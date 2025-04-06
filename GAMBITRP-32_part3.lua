--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 3/10 - 06/04/2025


--PATH addons/accessory/lua/accessory/cl_interface.lua:
local matClose = Material("shenesis/accessory/close.png", "noclamp smooth")
local matList = Material("shenesis/accessory/list.png", "noclamp smooth")
local matPrevious = Material("shenesis/accessory/previous.png", "noclamp smooth")
local matStop = Material("shenesis/accessory/stop.png", "noclamp smooth")
local matSearch = Material("shenesis/accessory/search.png", "noclamp smooth")

local th, m, m5
local scale

local cacheL = {}
local cacheC = {}
local curs_donata_dollari = 2800 // $ за рубль
local function L(s, ...)
	if (cacheL[s]) then
		return cacheL[s]
	end

	local tx = SH_ACC.Language[s] or s

	local a = {...}
	if (#a > 0) then
		return string.format(tx, ...)
	else
		cacheL[s] = tx
		return tx
	end
end
SH_ACC._L = L

local function C(s)
	if (cacheC[s]) then
		return cacheC[s]
	else
		local c = SH_ACC.Style[s]
		cacheC[s] = c

		return c
	end
end
SH_ACC._C = C

function SH_ACC:Label(t, f, c, p)
	local l = vgui.Create("DLabel", p)
	l:SetText(t)
	l:SetFont(f)
	l:SetColor(c)
	l:SizeToContents()

	return l
end

function SH_ACC:PaintScroll(panel)
	local styl = self.Style

	local scr = panel:GetVBar()
	scr.Paint = function(_, w, h)
		draw.RoundedBox(4, 0, 0, w, h, styl.bg)
	end

	scr.btnUp.Paint = function(_, w, h)
		draw.RoundedBox(4, 2, 0, w - 4, h - 2, styl.inbg)
	end
	scr.btnDown.Paint = function(_, w, h)
		draw.RoundedBox(4, 2, 2, w - 4, h - 2, styl.inbg)
	end

	scr.btnGrip.Paint = function(me, w, h)
		draw.RoundedBox(4, 2, 0, w - 4, h, styl.inbg)

		if (vgui.GetHoveredPanel() == me) then
			draw.RoundedBox(4, 2, 0, w - 4, h, styl.hover2)
		end

		if (me.Depressed) then
			draw.RoundedBox(4, 2, 0, w - 4, h, styl.hover2)
		end
	end
end

function SH_ACC:CreateAccIcon(acc, bg)
	local mdl = vgui.Create("DModelPanel", bg)
	mdl:SetModel(acc.mdl)
	mdl:Dock(FILL)
	mdl.LayoutEntity = function() end
	mdl:SetLookAt(Vector(0, 0, 0))
	mdl:SetFOV(10)
	mdl.Entity:SetSkin(acc.skin)
	-- TODO: bodygroups
	mdl.Entity:SetMaterial(acc.material)
	mdl.Entity:SetColor(acc.color)
	mdl.Entity:SetModelScale(acc.scale, 0)

	return mdl
end

function SH_ACC:TextEntry(parent)
	local tent = vgui.Create("DTextEntry", parent)
	tent:SetTextColor(C"text")
	tent:SetCursorColor(C"text")
	tent:SetFont("SH_ACC.Medium")
	tent:SetDrawLanguageID(false)
	tent.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, C"bg")

		if (me:HasFocus()) then
			draw.RoundedBox(4, 0, 0, w, h, C"hover")
		end
		me:DrawTextEntryText(me:GetTextColor(), me:GetHighlightColor(), me:GetCursorColor())
	end

	return tent
end

function SH_ACC:NumSlider(parent)
	local slider = vgui.Create("DNumSlider", parent)
	slider.TextArea:SetTextColor(C"text")
	slider.TextArea:SetFont("SH_ACC.Medium")
	slider.TextArea:SetDrawLanguageID(false)
	slider.TextArea:SetCursorColor(C"text")
	slider.Label:SetVisible(false)
	slider.Slider.Paint = function(me, w, h)
		draw.RoundedBox(0, 0, h * 0.5 - 1, w, 2, C"bg")
	end
	slider.Slider.Knob.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, C"header")

		if (me.Hovered) then
			surface.SetDrawColor(C"hover")
			surface.DrawRect(0, 0, w, h)
		end

		if (me:IsDown()) then
			surface.SetDrawColor(C"hover")
			surface.DrawRect(0, 0, w, h)
		end
	end

	return slider
end

function SH_ACC:Menu()
	local styl = self.Style

	if (IsValid(_SH_ACC_MENU)) then
		_SH_ACC_MENU:Remove()
	end

	scale = math.Clamp(ScrH() / 1080, 0.7, 1)

	local th = 48 * scale
	local m = th * 0.25

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = vgui.Create("DPanel")
	pnl:SetDrawBackground(false)
	pnl:SetSize(20, 1)
	pnl.AddOption = function(me, text, callback)
		surface.SetFont("SH_ACC.MediumB")
		local wi, he = surface.GetTextSize(text)
		wi = wi + m * 2
		he = he + m

		me:SetWide(math.max(wi, me:GetWide()))
		me:SetTall(pnl:GetTall() + he)

		local btn = vgui.Create("DButton", me)
		btn:SetText(text)
		btn:SetFont("SH_ACC.MediumB")
		btn:SetColor(styl.text)
		btn:Dock(TOP)
		btn:SetSize(wi, he)
		btn.Paint = function(me, w, h)
			surface.SetDrawColor(styl.menu)
			surface.DrawRect(0, 0, w, h)

			if (me.Hovered) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end

			if (me:IsDown()) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end
		end
		btn.DoClick = function(me)
			callback()
			pnl:Close()
		end
	end
	pnl.Open = function(me)
		me:SetPos(gui.MouseX(), gui.MouseY())
		me:MakePopup()
	end
	pnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:AlphaTo(0, 0.1, 0, function()
			me:Remove()
		end)
	end
	_SH_ACC_MENU = pnl

	cancel.OnMouseReleased = function(me, mc)
		pnl:Close()
	end
	cancel.Think = function(me)
		if (!IsValid(pnl)) then
			me:Remove()
		end
	end

	return pnl
end

function SH_ACC:MakeFrame(title)
	scale = math.Clamp(ScrH() / 1080, 0.7, 1)

	local pnl = vgui.Create("EditablePanel")
	pnl.Paint = function(me, w, h)
		if (me.m_fCreateTime) then
			Derma_DrawBackgroundBlur(me, me.m_fCreateTime)
		end

		draw.RoundedBox(4, 0, 0, w, h, C"bg")
	end
	pnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:AlphaTo(0, 0.1, 0, function()
			me:Remove()
		end)

		me:OnClose()
	end
	pnl.OnClose = function()
	end

		th = 48 * scale
		m = th * 0.25
		m5 = m * 0.5

		local header = vgui.Create("DPanel", pnl)
		header:SetTall(th)
		header:Dock(TOP)
		header.Paint = function(me, w, h)
			draw.RoundedBoxEx(4, 0, 0, w, h, C"header", true, true, false, false)
		end

			local titlelbl = self:Label(title or "", "SH_ACC.Larger", C"text", header)
			titlelbl:Dock(FILL)
			titlelbl:DockMargin(m, 0, 0, 0)

			local close = vgui.Create("DButton", header)
			close:SetText("")
			close:SetWide(th)
			close:Dock(RIGHT)
			close.Paint = function(me, w, h)
				if (me.Hovered) then
					draw.RoundedBoxEx(4, 0, 0, w, h, C"close_hover", false, true, false, false)
				end

				if (me:IsDown()) then
					draw.RoundedBoxEx(4, 0, 0, w, h, C"hover", false, true, false, false)
				end

				surface.SetDrawColor(me:IsDown() and C"text_down" or C"text")
				surface.SetMaterial(matClose)
				surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 16 * scale, 16 * scale, 0)
			end
			close.DoClick = function(me)
				pnl:Close()
			end

	pnl.SetTitle = function(me, tx)
		titlelbl:SetText(tx)
	end

	return pnl
end

function SH_ACC:CreateFonts(sc)
	local font = self.Font
	local font_bold = self.FontBold

	local sizes = {
		[12] = "Small",
		[16] = "Medium",
		[20] = "Large",
		[24] = "Larger",
		[32] = "Largest",
	}

	for s, n in pairs (sizes) do
		surface.CreateFont("SH_ACC." .. n, {font = font, size = s * sc, extended = true})
		surface.CreateFont("SH_ACC." .. n .. "B", {font = font_bold, size = s * sc, extended = true})
	end
end

function SH_ACC:ShowAdjustMenu(acc, contents, ilist)
	if (IsValid(_SH_ACC_ADJUST_MENU)) then
		_SH_ACC_ADJUST_MENU:QuickSave()
		_SH_ACC_ADJUST_MENU:Remove()
	end

	local MySelf = LocalPlayer()
	local fact = MySelf:SH_GetAccessoryAdjustFactor()
	local mdl = acc.mdl

	local w = ilist:GetWide()

	ilist:Dock(NODOCK)
	ilist:MoveTo(-(ilist:GetWide() + m * 2), ilist.y, 0.2)

	local apnl = vgui.Create("DScrollPanel", contents)
	apnl:SetSize(w, contents:GetTall() - m * 2)
	apnl:SetPos(w, m)
	apnl:MoveTo(m, apnl.y, 0.2, nil, nil, function()
		apnl:Dock(FILL)
	end)
	apnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true

		-- Save immediately
		me:QuickSave()

		apnl:Dock(NODOCK)
		apnl:MoveTo(apnl:GetWide() + m * 2, apnl.y, 0.2)

		ilist:MoveTo(m, ilist.y, 0.2, nil, nil, function()
			ilist:Dock(FILL)
			apnl:Remove()
		end)
	end
	apnl.Think = function(me)
		if (me.m_fNetworkIn and CurTime() >= me.m_fNetworkIn) then
			MySelf:SH_BroadcastAdjustment(mdl)
			MySelf:SH_SaveAdjustments()
			me.m_fNetworkIn = nil
		end
	end
	apnl.QuickSave = function(me)
		if (me.m_fNetworkIn) then
			me.m_fNetworkIn = 0
			me:Think()
		end
	end
	_SH_ACC_ADJUST_MENU = apnl

		local top = vgui.Create("DPanel", apnl)
		top:SetDrawBackground(false)
		top:SetTall(32 * scale)
		top:Dock(TOP)
		top:DockMargin(0, 0, 0, 0)

			local btn = vgui.Create("DImageButton", top)
			btn:SetImage("shenesis/accessory/previous.png")
			btn:SetWide(top:GetTall())
			btn:Dock(LEFT)
			btn:DockMargin(-6 * scale, 0, 0, 0)
			btn.DoClick = function(me)
				apnl:Close()
			end
			btn.DoRightClick = btn.DoClick
			if (!self.DisableKeyShortcuts) then
				btn.Think = function(me)
					if (input.IsMouseDown(MOUSE_4)) then
						btn:DoClick()
					end
				end
			end

		local pnl = vgui.Create("DPanel", apnl)
		pnl:SetTall(64 * scale)
		pnl:Dock(TOP)
		pnl:DockMargin(0, m5, 0, 0)
		pnl:DockPadding(m5, m5, m5, m5)
		pnl.Paint = function(me, w, h)
			draw.RoundedBox(4, 0, 0, w, h, C"inbg")
		end

			local lbl = self:Label(L"adjust" .. " - " .. acc.name, "SH_ACC.LargerB", C"text", pnl)
			lbl:Dock(TOP)

			local lbl = self:Label(L"adjust_desc", "SH_ACC.Medium", C"text", pnl)
			lbl:SetAutoStretchVertical(true)
			lbl:SetWrap(true)
			lbl:Dock(TOP)

		timer.Simple(0.1, function()
			if (!IsValid(pnl)) then
				return end

			pnl:SizeToChildren(true, true)
		end)

		local nosave = false
		local adjustments = {}
		local function AddAdjustMenu(tx, ad, fc, de)
			tx = L(tx)
			fc = fc or 1
			de = de or 0

			local adj = vgui.Create("DPanel", apnl)
			adj:SetTall(64 * scale)
			adj:Dock(TOP)
			adj:DockMargin(0, m5, 0, 0)
			adj:DockPadding(m5, m5, m5, m5)
			adj.Paint = pnl.Paint

			for _, c in ipairs ({"x", "y", "z"}) do
				local id = ad .. c

				local lbl = self:Label(tx .. " " .. c:upper(), "SH_ACC.LargeB", C"text", adj)
				lbl:Dock(TOP)

				local slider = self:NumSlider(adj)
				slider:Dock(TOP)
				slider:SetMinMax(de + -fact * fc, de + fact * fc)
				slider.m_fDefault = de
				table.insert(adjustments, slider)

				if (MySelf.SH_AccessoryAdjust and MySelf.SH_AccessoryAdjust[mdl]) then
					slider:SetValue(MySelf.SH_AccessoryAdjust[mdl][id] or de)
				else
					slider:SetValue(de)
				end

				slider.OnValueChanged = function(me, val)
					val = math.Clamp(val, -fact, fact)

					if (!MySelf.SH_AccessoryAdjust) then
						MySelf.SH_AccessoryAdjust = {}
					end

					if (!MySelf.SH_AccessoryAdjust[mdl]) then
						MySelf.SH_AccessoryAdjust[mdl] = {
							[id] = val,
						}
					else
						MySelf.SH_AccessoryAdjust[mdl][id] = val
					end

					MySelf.SH_AccessoryAdjust[mdl][ad] = nil

					if (nosave) then
						return end

					apnl.m_fNetworkIn = CurTime() + 0.5
				end
			end

			timer.Simple(0, function()
				if (!IsValid(adj)) then
					return end

				adj:SizeToChildren(true, true)
			end)
		end

		local function ShowAdjustElements()
			AddAdjustMenu("translate", "p", self.IndividiualAdjustFactor.translate)
			AddAdjustMenu("rotate", "a", self.IndividiualAdjustFactor.rotate)
			AddAdjustMenu("scale", "s", self.IndividiualAdjustFactor.scale, 1)
		end

		ShowAdjustElements()

		local reset = vgui.Create("DButton", apnl)
		reset:SetText(L"reset_adjustments")
		reset:SetColor(C"text")
		reset:SetFont("SH_ACC.LargeB")
		reset:SetTall(draw.GetFontHeight(reset:GetFont()) + m5)
		reset:Dock(TOP)
		reset:DockMargin(0, m5, 0, 0)
		reset.Paint = function(me, w, h)
			draw.RoundedBox(4, 0, 0, w, h, C"inbg")

			if (me.Hovered) then
				surface.SetDrawColor(C"hover")
				surface.DrawRect(0, 0, w, h)
			end

			if (me:IsDown()) then
				surface.SetDrawColor(C"hover")
				surface.DrawRect(0, 0, w, h)
			end
		end
		reset.DoClick = function(me)
			MySelf:SH_ResetAdjustments(mdl)

			nosave = true
			for _, v in ipairs (adjustments) do
				v:SetValue(v.m_fDefault)
			end
			nosave = false
		end
end

function SH_ACC:ShowConfirmMenu(title, text, callback)
	if (IsValid(_SH_ACC_CONFIRM)) then
		_SH_ACC_CONFIRM:Remove()
	end

	scale = math.Clamp(ScrH() / 1080, 0.7, 1)
	local wi, he = 200 * scale, 160 * scale

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = SH_ACC:MakeFrame(L(title))
	pnl:SetSize(wi, he)
	pnl:Center()
	pnl:MakePopup()
	pnl.m_fCreateTime = SysTime()
	_SH_ACC_CONFIRM = pnl

	cancel.OnMouseReleased = function(me, mc)
		if (mc == MOUSE_LEFT) then
			pnl:Close()
		end
	end
	cancel.Think = function(me)
		if (!IsValid(pnl)) then
			me:Remove()
		end
	end

		local th = 48 * scale
		local m = th * 0.25

		local body = vgui.Create("DPanel", pnl)
		body:SetDrawBackground(false)
		body:Dock(FILL)
		body:DockPadding(m, 0, m, m)

			local tx
			if (istable(text)) then
				tx = L(unpack(text))
			else
				tx = L(text)
			end

			local tx = self:Label(tx, "SH_ACC.Large", C"text", body)
			tx:SetContentAlignment(5)
			tx:Dock(FILL)

			local btns = vgui.Create("DPanel", body)
			btns:SetDrawBackground(false)
			btns:Dock(BOTTOM)

				local yes = vgui.Create("DButton", btns)
				yes:SetText(L"yes")
				yes:SetColor(C"text")
				yes:SetFont("SH_ACC.Medium")
				yes:Dock(FILL)
				yes.Paint = function(me, w, h)
					draw.RoundedBox(4, 0, 0, w, h, C"inbg")

					if (me.Hovered) then
						surface.SetDrawColor(C"hover")
						surface.DrawRect(0, 0, w, h)
					end

					if (me:IsDown()) then
						surface.SetDrawColor(C"hover")
						surface.DrawRect(0, 0, w, h)
					end
				end
				yes.DoClick = function()
					pnl:Close()
					callback()
				end

				local no = vgui.Create("DButton", btns)
				no:SetText(L"no")
				no:SetColor(C"text")
				no:SetFont("SH_ACC.Medium")
				no:Dock(RIGHT)
				no:DockMargin(m, 0, 0, 0)
				no.Paint = yes.Paint
				no.DoClick = function()
					pnl:Close()
				end

	pnl.OnFocusChanged = function(me, gained)
		if (!gained) then
			timer.Simple(0, function()
				if (!IsValid(me) or vgui.GetKeyboardFocus() == entry) then
					return end

				me:Close()
			end)
		end
	end

	pnl:SetWide(math.max(tx:GetWide() + m * 2, pnl:GetWide()))
	pnl:CenterHorizontal()

	no:SetWide(pnl:GetWide() * 0.5 - m * 1.5)

	pnl:SetAlpha(0)
	pnl:AlphaTo(255, 0.1)
end

local mdlcam_pos = CreateClientConVar("sh_acc_campos", "50 50 50", true, false)
local mdlcam_lookat = CreateClientConVar("sh_acc_lookat", "0 0 40", true, false)
local mdlcam_fov = CreateClientConVar("sh_acc_fov", "30", true, false)
local mdlcam_ang = CreateClientConVar("sh_acc_angle", "0", true, false)

function SH_ACC:ChangeEquipment(id, eq)
	net.Start("SH_ACC_CHANGE")
		net.WriteString(id)
		net.WriteBool(eq)
	net.SendToServer()

	surface.PlaySound("shenesis/generic_cloth_movement" .. math.random(1, 16) .. ".ogg")
end

function SH_ACC:ShowBuyMenu()
	if (IsValid(_SH_ACC_BUYMENU)) then
		_SH_ACC_BUYMENU:Remove()
	end

	local curcat
	local previewing

	local MySelf = LocalPlayer()
	scale = math.Clamp(ScrH() / 1080, 0.7, 1)
	self:CreateFonts(scale)

	local wi, he = 1100 * scale, 800 * scale

	local title = L"accessory_vendor"
	local swep = MySelf:SH_HasAccessoryChanger()
	if (!MySelf:SH_NearAccessoryVendor() and swep) then
		title = swep:GetPrintName()
	end

	local frame = self:MakeFrame(title)
	frame:SetSize(wi, he)
	frame:Center()
	frame:MakePopup()
	if (self.DrawBackgroundBlur) then
		frame.m_fCreateTime = SysTime()
	end
	frame.OnClose = function(me)
		if (previewing) then
			if (!MySelf:SH_HasAccessoryEquipped(previewing[1])) then
				MySelf:SH_RemoveAccessory(previewing[1])
			end
			previewing = nil
		end

		if (IsValid(_SH_ACC_MENU)) then
			_SH_ACC_MENU:Remove()
		end
		if (IsValid(_SH_ACC_CONFIRM)) then
			_SH_ACC_CONFIRM:Remove()
		end
		if (IsValid(_SH_ACC_ADJUST_MENU)) then
			_SH_ACC_ADJUST_MENU:QuickSave()
			_SH_ACC_ADJUST_MENU:Remove()
		end
	end
	frame.m_bEscaping = false
	frame.Think = function(me)
		if (input.IsKeyDown(KEY_ESCAPE)) then
			if (frame.m_bEscaping) then
				return end

			frame.m_bEscaping = true

			gui.HideGameUI()
			timer.Simple(0, function()
				gui.HideGameUI()
			end)

			local focus = vgui.GetKeyboardFocus()
			if (IsValid(focus) and focus:GetName() == "DTextEntry") then
				focus:KillFocus()
				TextEntryLoseFocus()
				return
			end

			me:Close()
		else
			frame.m_bEscaping = false
		end
	end
	_SH_ACC_BUYMENU = frame

		local body = vgui.Create("DPanel", frame)
		body:SetDrawBackground(false)
		body:Dock(FILL)

			local contents = vgui.Create("DPanel", body)
			contents:SetDrawBackground(false)
			contents:SetWide(wi - th)
			contents:Dock(FILL)
			contents:DockPadding(m, m, m, m)
			contents.m_iBorder = m
			frame.m_Contents = contents

				local ilist = vgui.Create("DScrollPanel", contents)
				self:PaintScroll(ilist)
				ilist:StretchToParent(0, 0, 0, 0)
				ilist:Dock(FILL)
				ilist.Think = function()
					local hover = vgui.GetHoveredPanel()
					if (IsValid(hover) and hover.m_Accessory and !frame.m_bClosing) then
						if (!MySelf:SH_HasAccessoryEquipped(hover.m_Accessory.id)) then
							if (previewing and !MySelf:SH_HasAccessoryEquipped(previewing[1])) then
								MySelf:SH_RemoveAccessory(previewing[1])
							end

							previewing = {hover.m_Accessory.id, hover.m_Accessory.slots}
							local cs = MySelf:SH_AddAccessory(previewing[1], true)
							if (IsValid(cs)) then
								_SH_ACC_BUYMENU.m_PreviewModel = cs
							end
						end
					else
						if (previewing) then
							if (MySelf:SH_HasAccessoryEquipped(previewing[1])) then
								previewing = nil
							else
								MySelf:SH_RemoveAccessory(previewing[1])
								previewing = nil
							end
						end
					end

					_SH_ACC_BUYMENU.m_Previewing = previewing
				end

			local function AddAccessoryPanel(acc, title, slot)
				local ph = 64 * scale + (title and (16 * scale + m5) or 0)

				local pnl = vgui.Create("DPanel", ilist)
				pnl:SetDrawBackground(false)
				pnl:SetTall(ph)
				pnl:Dock(TOP)
				pnl:DockMargin(0, 0, 0, m5)

					local function DrawBG(me, w, h, col)
						if (me.m_QuickSwitch) then
							draw.RoundedBoxEx(4, 0, 0, w, h, col, true, true, false, false)
						else
							draw.RoundedBox(4, 0, 0, w, h, col)
						end
					end

					local btnbody = vgui.Create("DButton", pnl)
					btnbody:SetText("")
					btnbody:Dock(FILL)
					btnbody:DockPadding(m5, m5, m5, m5)
					btnbody.Paint = function(me, w, h)
						DrawBG(me, w, h, C"inbg")

						if (me.Hovered) then
							DrawBG(me, w, h, C"hover")
						end

						if (me:IsDown()) then
							DrawBG(me, w, h, C"hover")
						end
					end

						-- overview accpnl
						if (title) then
							local lbl = self:Label(L(title), "SH_ACC.MediumB", C"text", btnbody)
							lbl:Dock(TOP)
							lbl:DockMargin(0, 0, 0, m5)
							pnl.m_Title = lbl
						else -- shop category accpnl: can preview
							pnl.m_Accessory = acc
							btnbody.m_Accessory = pnl.m_Accessory
						end

						local itm = vgui.Create("DPanel", btnbody)
						itm:SetDrawBackground(false)
						itm:SetMouseInputEnabled(false)
						itm:Dock(FILL)

							local bg = vgui.Create("DPanel", itm)
							bg:Dock(LEFT)
							bg.Think = function(me)
								me:SetWide(itm:GetTall())
							end
							bg.Paint = frame.Paint

								if (acc) then
									SH_ACC:CreateAccIcon(acc, bg)
								end

							local lbl = self:Label(acc and acc.name or L"none", "SH_ACC.LargeB", C"text", itm)
							lbl:SetContentAlignment(title and 5 or 7)
							lbl:Dock(title and FILL or TOP)
							lbl:DockMargin(m5, 0, 0, 0)

							local textlbl
							if (acc and !title) then
								local lbls = vgui.Create("DPanel", itm)
								lbls:SetDrawBackground(false)
								lbls:SetTall(draw.GetFontHeight("SH_ACC.Medium"))
								lbls:Dock(TOP)
								lbls:DockMargin(m5, 0, 0, 0)

									local lbl = self:Label("", "SH_ACC.Medium", col, lbls)
									lbl:Dock(LEFT)
									lbl.Update = function(me)
										local tx = acc.price > 0 and SH_ACC.formatMoney(acc.price * MySelf:SH_GetAccessoryPurchaseFrac()) or L"free"
										local col = SH_ACC.CanAfford(LocalPlayer(), acc.price * MySelf:SH_GetAccessoryPurchaseFrac()) and C"can_afford" or C"cant_afford"

										if (MySelf:SH_HasAccessory(acc.id)) then
											local eq = MySelf:SH_HasAccessoryEquipped(acc.id)
											tx = eq and L"equipped" or L"possessed"
											col = eq and C"equipped" or C"possessed"
										else
											if curs_donata_dollari * acc.price < acc.price_de then 
												tx = SH_ACC.formatMoney2(acc.price_de)
											else
												tx = tx..(acc.price_de and (acc.price_de > 0 and " или "..SH_ACC.formatMoney2(acc.price_de)) or "")
											end
										end
										me:SetText(tx)
										me:SetTextColor(col)
										me:SizeToContents()
									end
									textlbl = lbl

									if (acc.canPurchase or acc.usergroups or acc.steamids) then
										local lbl = self:Label(" - " .. L"restricted", "SH_ACC.Medium", C"restricted", lbls)
										lbl:Dock(LEFT)
									end

									if (acc.jobs or acc.jobsexclude) then
										local lbl = self:Label(" " .. L"job_specific", "SH_ACC.Medium", C"restricted", lbls)
										lbl:Dock(LEFT)
									end

								-- slot text
								local t = {}
								for sl, tx in SortedPairs (self.SlotText) do
									if (bit.band(acc.slots, sl) > 0) then
										table.insert(t, L(tx))
									end
								end

								if (#t > 1) then
									local lbl = self:Label(L("this_accessory_covers_x", table.concat(t, ", ")), "SH_ACC.Medium", C"text", itm)
									lbl:Dock(TOP)
									lbl:DockMargin(m5, 0, 0, 0)
								end
							end

					btnbody.DoClick = function(me, rmb)
						if (title and !rmb) then
							if (me.m_bQuickSwitchAnim) then
								return end

							me.m_bQuickSwitchAnim = true

							local b = !me.m_bQuickSwitching
							me.m_bQuickSwitching = b

							me:Dock(TOP)
							pnl:Stop()
							pnl:SizeTo(pnl:GetWide(), b and (ph + m5 * 3 + 48 * scale + 20 * scale) or ph, 0.2, nil, nil, function()
								me.m_bQuickSwitchAnim = false

								if (!b) then
									if (IsValid(me.m_QuickSwitch)) then
										me.m_QuickSwitch:Remove()
									end
									me.m_QuickSwitch = nil

									-- die
									timer.Simple(0, function()
										if (IsValid(me)) then
											me:Dock(FILL)
										end
									end)
								end
							end)

							if (b) then
								if (IsValid(me.m_QuickSwitch)) then
									me.m_QuickSwitch:Remove()
								end

								local p = vgui.Create("DPanel", pnl)
								p:Dock(FILL)
								p:DockPadding(m5, m5, m5, m5)
								p.Paint = function(me, w, h)
									draw.RoundedBoxEx(4, 0, 0, w, h, C"inbg", false, false, true, true)
								end
								me.m_QuickSwitch = p

									local scroll = vgui.Create("DScrollPanel", p)
									SH_ACC:PaintScroll(scroll)
									scroll:Dock(FILL)

										local ilist = vgui.Create("DIconLayout", scroll)
										ilist:SetSpaceX(m5)
										ilist:SetSpaceY(m5)
										ilist:Dock(FILL)

									local deftext = L"quick_switch"

									local name = vgui.Create("DPanel", p)
									name:SetTall(20 * scale)
									name:Dock(BOTTOM)
									name.Paint = function(me, w, h)
										draw.RoundedBox(4, 0, 0, w, h, C"bg")
										draw.SimpleText(me.m_sText, "SH_ACC.Medium", w * 0.5, h * 0.5, C"text", TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
									end
									name.m_sText = deftext

									-- Take off
									local takeoff = vgui.Create("DButton", ilist)
									takeoff:SetText("")
									takeoff:SetSize(32 * scale, 32 * scale)
									takeoff.Paint = function(me, w, h)
										DrawBG(me, w, h, C"bg")

										if (me.Hovered) then
											DrawBG(me, w, h, C"hover")
										end

										if (me:IsDown()) then
											DrawBG(me, w, h, C"hover")
										end
									end
									takeoff.OnCursorEntered = function(me)
										name.m_sText = L"unequip"
									end
									takeoff.OnCursorExited = function(me)
										name.m_sText = deftext
									end
									takeoff.DoClick = function(me)
										self:ChangeEquipment(acc.id, false)
									end
									takeoff:SetVisible(acc ~= nil)

										local img = vgui.Create("DPanel", takeoff)
										img:SetMouseInputEnabled(false)
										img:Dock(FILL)
										img.Paint = function(me, w, h)
											surface.SetDrawColor(C"text")
											surface.SetMaterial(matStop)
											surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 16 * scale, 16 * scale, 0)
										end

									-- Actual accessories
									for accid in SortedPairs (MySelf.SH_AccessoryInfo.inventory) do
										if (acc and acc.id == accid) then
											continue end

										local acc2 = SH_ACC:GetAccessory(accid)
										if (acc2 and bit.band(acc2.slots, slot) > 0) then
											local bg = vgui.Create("DButton", ilist)
											bg:SetText("")
											bg:SetSize(32 * scale, 32 * scale)
											bg.Paint = takeoff.Paint
											bg.OnCursorEntered = function(me)
												name.m_sText = acc2.name
											end
											bg.OnCursorExited = takeoff.OnCursorExited
											bg.DoClick = function(me)
												self:ChangeEquipment(accid, true)
											end
											bg.m_Accessory = acc2 -- Hover

												local mdl = SH_ACC:CreateAccIcon(acc2, bg)
												mdl:SetMouseInputEnabled(false)
										end
									end
							end
						elseif (acc) then
							local m = SH_ACC:Menu()

							local haveitem = MySelf:SH_HasAccessory(acc.id)
							if (title) or (haveitem) then

								if (haveitem and MySelf:SH_HasAccessoryEquipped(acc.id)) then
									m:AddOption(L"adjust", function()
										self:ShowAdjustMenu(acc, contents, ilist)
									end)

									local mdl = acc.mdl
									if (MySelf.SH_AccessoryAdjust and MySelf.SH_AccessoryAdjust[mdl]) then
										m:AddOption(L"reset_adjustments", function()
											MySelf:SH_ResetAdjustments(mdl)
										end)
									end

									m:AddOption(L"unequip", function()
										self:ChangeEquipment(acc.id, false)
									end)
								else
									m:AddOption(L"equip", function()
										self:ChangeEquipment(acc.id, true)
									end)
								end

								if (MySelf:SH_CanSellAccessories() and MySelf:SH_NearAccessoryVendor()) then
									m:AddOption(L"sell", function()
										SH_ACC:ShowConfirmMenu("confirm_action", {"sell_confirm", acc.name, (acc.price_de and (acc.price_de > 0 and SH_ACC.formatMoney2(math.Round(acc.price_de * MySelf:SH_GetAccessorySellFrac())))) or SH_ACC.formatMoney(math.Round(acc.price * MySelf:SH_GetAccessorySellFrac()))}, function()
											net.Start("SH_ACC_SELL")
												net.WriteString(acc.id)
											net.SendToServer()

											surface.PlaySound("ambient/levels/labs/coinslot1.wav")
										end)
									end)
								end
							else
								if (!MySelf:SH_HasAccessory(acc.id) and MySelf:SH_NearAccessoryVendor()) then
									m:AddOption(L"purchase" .. " (" .. SH_ACC.formatMoney(acc.price * MySelf:SH_GetAccessoryPurchaseFrac()) .. ")"..(acc.price_de and (acc.price_de > 0 and " или "..SH_ACC.formatMoney2(acc.price_de) or "")), function()
										SH_ACC:ShowConfirmMenu("confirm_action", {"buy_confirm", acc.name, SH_ACC.formatMoney(acc.price * MySelf:SH_GetAccessoryPurchaseFrac())}, function()
											net.Start("SH_ACC_PURCHASE")
												net.WriteString(acc.id)
											net.SendToServer()

											surface.PlaySound("ambient/levels/labs/coinslot1.wav")
										end)
									end)
								end
							end

							m:Open()
						end
					end
					btnbody.DoRightClick = function(me)
						me:DoClick(true)
					end

				pnl.Think = function()
					if (acc and textlbl) then
						textlbl:Update()
					end
				end

				return pnl
			end

			local overv = false

			contents.RefreshOverview = function(me, refresh)
				if (refresh and !overv) then
					return end

				overv = true

				if (IsValid(_SH_ACC_ADJUST_MENU)) then
					_SH_ACC_ADJUST_MENU:Close()
				end

				if (IsValid(_SH_ACC_POPULATE_DUMMY)) then
					_SH_ACC_POPULATE_DUMMY:Remove()
				end

				timer.Destroy("_SH_ACC_POPULATE_LIST")

				if (IsValid(contents.m_SearchBar)) then
					contents.m_SearchBar:Remove()
				end
				if (IsValid(contents.m_Score)) then
					contents.m_Score:Remove()
				end

				ilist:Clear()

				-- Show acc count if need be
				local limit = MySelf:SH_GetAccessoryLimit()
				if (limit > 0) then
					local num = MySelf:SH_GetNumEquippedAccessories()

					local pnl = vgui.Create("DPanel", ilist)
					pnl:Dock(TOP)
					pnl:DockMargin(0, 0, 0, m5)
					pnl.Paint = function(me, w, h)
						draw.RoundedBox(4, 0, 0, w, h, C"inbg")
					end

						local lbl = self:Label(L"accessory_limit" .. ": " .. num .. "/" .. limit, "SH_ACC.Medium", num >= limit and C"cant_afford" or C"text", pnl)
						lbl:SetContentAlignment(5)
						lbl:Dock(FILL)
				end

				-- Build category pnls
				local notadded = table.Copy(self.SlotText)

				local toadd = {}
				for id, cs in pairs (MySelf.SH_AccessoryInfo.equipped) do
					local acc = self:GetAccessory(id)
					if (!acc) then
						continue end

					for sl, tx in pairs (self.SlotText) do
						if (bit.band(acc.slots, sl) > 0) then
							toadd[sl] = id
						end
					end
				end

				local pnls = {}
				for sl, id in pairs (notadded) do
					local cls = toadd[sl]
					if (cls) then
						if (!pnls[cls]) then
							pnls[cls] = AddAccessoryPanel(self:GetAccessory(cls), id, sl)
						else
							local lbl = pnls[cls].m_Title
							if (IsValid(lbl)) then
								lbl:SetText(lbl:GetText() .. ", " .. L(id))
							end
						end
					else
						AddAccessoryPanel(nil, id, sl)
					end
				end
			end
			contents.RefreshCategory = function(me, slot)
				overv = false

				if (IsValid(_SH_ACC_ADJUST_MENU)) then
					_SH_ACC_ADJUST_MENU:Close()
				end

				if (IsValid(_SH_ACC_POPULATE_DUMMY)) then
					_SH_ACC_POPULATE_DUMMY:Remove()
				end

				timer.Destroy("_SH_ACC_POPULATE_LIST")

				ilist:Clear()
				ilist.VBar:SetScroll(0)

				local have, num = 0, 0
				local itemz = {}
				local function PopulateList(slot, filter)
					if (IsValid(_SH_ACC_POPULATE_DUMMY)) then
						_SH_ACC_POPULATE_DUMMY:Remove()
					end

					timer.Destroy("_SH_ACC_POPULATE_LIST")

					for _, v in pairs (itemz) do
						if (IsValid(v)) then
							v:Remove()
						end
					end

					--
					if (filter == "") then
						filter = nil
					end

					local toadd = {}
					local delayed = {}
					for id, acc in SortedPairsByMemberValue (self.List, "name") do
						if not (bit.band(acc.slots, slot) > 0) then
							continue end

						num = num + 1

						if (MySelf:SH_HasAccessory(acc.id)) then
							have = have + 1
						end

						if (filter and !string.find(acc.name:lower(), filter)) then
							continue end

						-- Don't delay population if searching
						table.insert((!filter and #toadd >= 10) and delayed or toadd, acc)
					end

					for _, acc in pairs (toadd) do
						table.insert(itemz, AddAccessoryPanel(acc))
					end

					if (#delayed > 0) then
						-- Add a dummy panel to fool the scrollbar..!
						local dummy = vgui.Create("DPanel", ilist)
						dummy:SetDrawBackground(false)
						dummy:SetTall(64 * scale * #delayed)
						dummy:Dock(TOP)
						_SH_ACC_POPULATE_DUMMY = dummy

						-- This is probably the ugliest thing alive to avoid a potential freeze when loading up big lists
						-- but it WORKS
						timer.Create("_SH_ACC_POPULATE_LIST", 0.01, 0, function()
							if (#delayed <= 0 or !IsValid(_SH_ACC_BUYMENU)) then
								timer.Destroy("_SH_ACC_POPULATE_LIST")
								if (IsValid(dummy)) then
									for _, v in pairs (dummy:GetChildren()) do
										if (IsValid(v) and IsValid(ilist)) then
											v:SetParent(ilist)
										end
									end

									dummy:Remove()
								end

								return
							end

							for i = 1, 3 do
								if (#delayed <= 0) then
									return end

								local acc = table.remove(delayed, 1)
								local pnl = AddAccessoryPanel(acc)
								pnl:SetParent(dummy)
								table.insert(itemz, pnl)
							end
						end)
					end
				end

				-- Search bar
				if (IsValid(contents.m_SearchBar)) then
					contents.m_SearchBar:Remove()
				end

				local pnl = vgui.Create("DPanel", contents)
				pnl:SetTall(24 * scale + m5 * 2)
				pnl:Dock(TOP)
				pnl:DockMargin(0, 0, 0, m5)
				pnl:DockPadding(m5, m5, m5, m5)
				pnl.Paint = function(me, w, h)
					draw.RoundedBox(4, 0, 0, w, h, C"inbg")
				end
				contents.m_SearchBar = pnl

					local tent = self:TextEntry(pnl)
					tent:SetText(filter or "")
					tent:Dock(FILL)
					tent.Paint = function(me, w, h)
						draw.RoundedBox(4, 0, 0, w, h, C"bg")

						surface.SetDrawColor(me:GetTextColor())
						surface.SetMaterial(matSearch)
						surface.DrawTexturedRect(w - 16 * scale - 2, h * 0.5 - 8 * scale, 16 * scale, 16 * scale)

						if (me:GetText() == "" and !me:HasFocus()) then
							draw.SimpleText(L"search" .. ".. " .. (self.DisableKeyShortcuts and "" or "(Ctrl+F)"), me:GetFont(), 2, h * 0.5, me:GetTextColor(), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						else
							draw.RoundedBox(4, 0, 0, w, h, C"hover")
							me:DrawTextEntryText(me:GetTextColor(), me:GetHighlightColor(), me:GetCursorColor())
						end
					end
					tent.OnChange = function(me)
						local tx = me:GetValue():lower():Trim()
						PopulateList(slot, tx)
					end
					if (!self.DisableKeyShortcuts) then
						tent.Think = function(me)
							if (input.IsKeyDown(KEY_LCONTROL) or input.IsKeyDown(KEY_RCONTROL)) and (input.IsKeyDown(KEY_F)) then
								if (me:HasFocus()) then
									me:SelectAllText()
								else
									me:RequestFocus()
								end
							end
						end
					end

				-- Count
				if (IsValid(contents.m_Score)) then
					contents.m_Score:Remove()
				end

				local score = vgui.Create("DPanel", contents)
				score:SetTall(16 * scale + m5 * 2)
				score:Dock(BOTTOM)
				score:DockMargin(0, m5, 0, 0)
				score:DockPadding(m5, m5, m5, m5)
				score.Paint = function(me, w, h)
					draw.RoundedBox(4, 0, 0, w, h, C"inbg")
					draw.RoundedBox(4, m5, m5, w - m, h - m, C"bg")

					local tx = have .. "/" .. num
					draw.SimpleText(tx, "SH_ACC.Medium", w * 0.5, h * 0.5, C"text", TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

					local x, y = me:LocalToScreen(0, 0)
					render.SetScissorRect(x, y, x + w * (have / num), y + h, true)
						draw.RoundedBox(4, m5, m5, (w - m) * (have / num), h - m, C"possessed")
						draw.SimpleText(tx, "SH_ACC.Medium", w * 0.5, h * 0.5, C"text_down", TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					render.SetScissorRect(0, 0, 0, 0, false)
				end
				contents.m_Score = score

				-- The hats
				PopulateList(slot)
			end

			local mdlpanel = vgui.Create("DPanel", body)
			mdlpanel:SetWide(wi * 0.35)
			mdlpanel:Dock(RIGHT)
			mdlpanel:DockMargin(0, m, m, m)
			mdlpanel.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, C"inbg")
			end

				local mdl = vgui.Create("DModelPanel", mdlpanel)
				mdl:SetModel(MySelf.m_sServerModel or MySelf:GetModel())
				mdl:SetCamPos(Vector(mdlcam_pos:GetString()))
				mdl:SetLookAt(Vector(mdlcam_lookat:GetString()))
				mdl.Entity:SetAngles(Angle(0, mdlcam_ang:GetInt(), 0))
				mdl:SetFOV(mdlcam_fov:GetInt())
				mdl:Dock(FILL)
				mdl.LayoutEntity = function() end
				mdl.PostDrawModel = function(me, ent)
					self:DrawAccessories(ent, MySelf)
				end
				mdl.m_iX = 0
				mdl.m_iY = 0
				mdl.PaintOver = function(me, w, h)
					if (me.m_bCursorIn) then
						local c = table.Copy(C"text")
						c.a = (me.m_bDragging or me.m_bZooming or me.m_bMoving) and c.a * 0.5 or c.a

						local f = "SH_ACC.Medium"
						local fh = draw.GetFontHeight(f)
						draw.SimpleText(L"left_click_help", f, m5, m5, c)
						draw.SimpleText(L"right_click_help", f, m5, m5 + fh, c)
						draw.SimpleText(L"middle_click_help", f, m5, m5 + fh * 2, c)
					end
				end
				mdl.Think = function(me)
					if (me.m_bDragging and !input.IsMouseDown(MOUSE_LEFT)) then
						me.m_bDragging = false
					end

					if (me.m_bZooming and !input.IsMouseDown(MOUSE_RIGHT)) then
						me.m_bZooming = false
					end

					if (me.m_bMoving and !input.IsMouseDown(MOUSE_MIDDLE)) then
						me.m_bMoving = false
					end

					-- Save camera pos
					if (me.m_fNextSave and RealTime() >= me.m_fNextSave) then
						RunConsoleCommand("sh_acc_campos", tostring(me:GetCamPos()))
						RunConsoleCommand("sh_acc_lookat", tostring(me:GetLookAt()))
						RunConsoleCommand("sh_acc_fov", tostring(me:GetFOV()))
						RunConsoleCommand("sh_acc_angle", tostring(me.Entity:GetAngles()[2]))
						me.m_fNextSave = nil
					end
				end
				mdl.OnMousePressed = function(me, mc)
					if (mc == MOUSE_LEFT) then
						me.m_bDragging = true
						me.m_iX = gui.MouseX()
					elseif (mc == MOUSE_RIGHT) then
						me.m_bZooming = true
						me.m_iY = gui.MouseY()
					elseif (mc == MOUSE_MIDDLE) then
						me.m_bMoving = true
						me.m_iX = gui.MouseX()
						me.m_iY = gui.MouseY()
					end
				end
				mdl.OnCursorMoved = function(me)
					local ang = me.Entity:GetAngles()
					local modif = me.m_bDragging or me.m_bZooming or me.m_bMoving

					if (me.m_bDragging) then
						local mx = gui.MouseX()
						local xdif = mx - me.m_iX

						me.m_iX = mx
						me.Entity:SetAngles(Angle(0, (ang[2] + xdif * 0.5) % 360, 0))
					end

					if (me.m_bZooming) then
						local my = gui.MouseY()
						local ydif = my - me.m_iY

						me.m_iY = my
						me:SetFOV(math.Clamp(me:GetFOV() + ydif * 0.33, 5, 100))
					end

					if (me.m_bMoving) then
						local mx, my = gui.MousePos()
						local xdif = mx - me.m_iX
						local ydif = my - me.m_iY
						local cp = me:GetCamPos()
						local la = me:GetLookAt()

						me.m_iX = mx
						me.m_iY = my
						me:SetCamPos(Vector(cp.x + xdif * 0.1, cp.y, cp.z + ydif * 0.15))
						me:SetLookAt(Vector(la.x + xdif * 0.1, la.y, la.z + ydif * 0.15))
					end

					if (modif) then
						me.m_fNextSave = RealTime() + 0.1
					end

					me.m_bCursorIn = true
				end
				mdl.OnCursorExited = function(me)
					local mx, my = gui.MousePos()

					if (me.m_bDragging or me.m_bZooming or me.m_bMoving) then
						local rx, ry = me:ScreenToLocal(mx, my)
						if (rx <= 0) then
							rx, ry = me:LocalToScreen(me:GetWide(), 0)
							input.SetCursorPos(rx, my)
							me.m_iX = rx
						elseif (rx >= me:GetWide()) then
							rx, ry = me:LocalToScreen(0, 0)
							input.SetCursorPos(rx, my)
							me.m_iX = rx
						end

						local rx, ry = me:ScreenToLocal(mx, my)
						if (ry <= 0) then
							rx, ry = me:LocalToScreen(0, me:GetTall())
							input.SetCursorPos(mx, ry)
							me.m_iY = ry
						elseif (ry >= me:GetTall()) then
							rx, ry = me:LocalToScreen(0, 0)
							input.SetCursorPos(mx, ry)
							me.m_iY = ry
						end
					end

					me.m_bCursorIn = false
				end
				mdl.OnMouseReleased = function(me, mc)
					if (mc == MOUSE_LEFT) then
						me.m_bDragging = false
					elseif (mc == MOUSE_RIGHT) then
						me.m_bZooming = false
					elseif (mc == MOUSE_MIDDLE) then
						me.m_bMoving = false
					end
				end

			local toggled = cookie.GetNumber("SH_ACC.NavBarOff", 0) == 0

			local navbar = vgui.Create("DPanel", body)
			navbar:SetWide(toggled and th * 3 or th)
			navbar:Dock(LEFT)
			navbar:DockPadding(0, th, 0, 0)
			navbar.Paint = mdlpanel.Paint

				local togglenavbar = vgui.Create("DButton", navbar)
				togglenavbar:SetText("")
				togglenavbar:SetToolTip(L"toggle")
				togglenavbar:SetSize(th, th)
				togglenavbar.Paint = function(me, w, h)
					surface.SetDrawColor(C"text")
					surface.SetMaterial(matList)
					surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 24 * scale, 24 * scale, 0)
				end
				togglenavbar.DoClick = function()
					toggled = !toggled
					cookie.Set("SH_ACC.NavBarOff", toggled and 0 or 1)

					navbar:Stop()
					navbar:SizeTo(toggled and th * 3 or th, -1, 0.1, 0, 0.2)
				end

				local cats = {}
				local function AddCategory(text, icon, callback, i)
					local tx = L(text)

					local btn = vgui.Create("DButton", navbar)
					btn:SetText("")
					btn:SetToolTip(tx)
					btn:SetTall(th)
					btn:Dock(TOP)
					btn.Paint = function(me, w, h)
						if (me.Hovered) then
							surface.SetDrawColor(C"hover")
							surface.DrawRect(0, 0, w, h)
						end

						if (me:IsDown()) then
							surface.SetDrawColor(C"hover")
							surface.DrawRect(0, 0, w, h)
						end

						surface.SetDrawColor(C"text")
						surface.SetMaterial(icon)
						surface.DrawTexturedRectRotated(24 * scale, 24 * scale, 24 * scale, 24 * scale, 0)

						if (i and curcat == i) then
							surface.SetDrawColor(C"header")
							surface.DrawRect(0, 0, th * 0.1, h)
						end
					end
					btn.DoClick = function(me)
						callback(me)
					end
					btn.m_sText = tx

						local lbl = self:Label(tx, "SH_ACC.Medium", C"text", btn)
						lbl:Dock(LEFT)
						lbl:DockMargin(th, 0, 0, 0)

					cats[#cats + 1] = btn

					return btn
				end

				AddCategory("overview", Material("shenesis/accessory/user.png", "noclamp smooth"), function(me)
					contents:RefreshOverview()

					--
					curcat = 0
					frame:SetTitle(title .. " - " .. me.m_sText)
				end, 0):DoClick()

				for i, cat in ipairs (self.ShopCategories) do
					AddCategory(cat.text, cat.icon, function(me)
						contents:RefreshCategory(cat.slot)

						--
						curcat = i
						frame:SetTitle(title .. " - " .. me.m_sText)
					end, i)
				end

				if (!self.DisableInfoTab) then
					local cachedworkshop = {}

					AddCategory("info", Material("shenesis/accessory/info.png", "noclamp smooth"), function(me)
						if (IsValid(_SH_ACC_ADJUST_MENU)) then
							_SH_ACC_ADJUST_MENU:Close()
						end

						if (IsValid(contents.m_SearchBar)) then
							contents.m_SearchBar:Remove()
						end
						if (IsValid(contents.m_Score)) then
							contents.m_Score:Remove()
						end

						ilist:Clear()

						local lbl = self:Label("SH Accessories " .. _SH_ACC_VERSION, "SH_ACC.LargestB", C"text", ilist)
						lbl:Dock(TOP)

						local lbl = self:Label("by Shendow", "SH_ACC.LargerB", C"text", ilist)
						lbl:Dock(TOP)

						local lbl = self:Label("Enabled add-ons:", "SH_ACC.LargeB", C"text", ilist)
						lbl:Dock(TOP)
						lbl:DockMargin(0, m, 0, 0)

						for id, b in pairs (SH_ACC.Addons) do
							if (!b) then
								continue end

							local lbl = self:Label("[" .. id .. "]", "SH_ACC.Medium", C"text", ilist)
							lbl:SetMouseInputEnabled(true)
							lbl:Dock(TOP)

								local btn = vgui.Create("DButton", lbl)
								btn:SetText("")
								btn:Dock(FILL)
								btn.Paint = function() end
								btn.DoClick = function(me)
									steamworks.ViewFile(tonumber(id))
								end

							if (cachedworkshop[id]) then
								lbl:SetText("- " .. cachedworkshop[id])
							else
								steamworks.FileInfo(tonumber(id), function(result)
									if (result and IsValid(lbl)) then
										lbl:SetText("- " .. result.title)
										cachedworkshop[id] = result.title
									end
								end)
							end
						end

						local cnt = table.Count(self.List)

						local lbl = self:Label("Number of accessories registered: " .. cnt, "SH_ACC.LargeB", cnt <= 0 and C"cant_afford" or C"text", ilist)
						lbl:Dock(TOP)
						lbl:DockMargin(0, m, 0, 0)

						local valid = 0
						for id in pairs (MySelf.SH_AccessoryInfo.inventory) do
							if (self:GetAccessory(id)) then
								valid = valid + 1
							end
						end

						local lbl = self:Label("You have: " .. valid .. "/" .. table.Count(self.List) .. " accessories", "SH_ACC.LargeB", C"text", ilist)
						lbl:Dock(TOP)

						local lbl = self:Label("Purchase this add-on on ScriptFodder", "SH_ACC.LargeB", C"header", ilist)
						lbl:SetMouseInputEnabled(true)
						lbl:Dock(TOP)
						lbl:DockMargin(0, m, 0, 0)

							local btn = vgui.Create("DButton", lbl)
							btn:SetText("")
							btn:Dock(FILL)
							btn.Paint = function() end
							btn.DoClick = function(me)
								gui.OpenURL("https://scriptfodder.com/users/view/76561197976345467/scripts")
							end

						--
						curcat = 999
						frame:SetTitle(title .. " - " .. L"info")
					end, 999)
				end

			if (!self.DisableKeyShortcuts) then
				local tabbing = false
				local pressing = false
				navbar.Think = function()
					if (input.IsKeyDown(KEY_TAB)) then
						if (!tabbing) then
							tabbing = true
							togglenavbar:DoClick()
						end
					else
						tabbing = false
					end

					if not (pressing and input.IsKeyDown(pressing)) then
						pressing = false

						for id, btn in pairs (cats) do
							local key = _G["KEY_" .. id]
							if (!key) then
								continue end

							if (input.IsKeyDown(key)) then
								pressing = key
								btn:DoClick()
								return
							end
						end
					end
				end
			end

	frame:SetAlpha(0)
	frame:AlphaTo(255, 0.1)
end
--PATH addons/accessory/lua/accessory_offsets.lua:
-- Whenever you add a new model as an accessory, you NEED to register at least one offset (the "default" offset) which
-- will position your model on every player model. Without the "default" offset the add-on will throw an error and that's bad.
-- This is also where you position models manually for specific models. It can be very tedious to do so I recommend you
-- contact the author (http://steamcommunity.com/id/shendow/) before touching anything.

-- every little character counts
local B_HEAD = "ValveBiped.Bip01_Head1"
local B_SPINE2 = "ValveBiped.Bip01_Spine2"

local V = Vector
local A = Angle

function SH_ACC:GetOffset(mdl, ply)
	if (!self.Offsets[mdl]) then
		return false
	end

	return self.Offsets[mdl][ply:GetModel():lower()] or self.Offsets[mdl].default or false
end

function SH_ACC:GetModelOffset(bone, ply)
	local mdl = self.ModelOffsets[ply:GetModel():lower()]
	if (!mdl or !mdl[bone]) then
		return false
	end

	return mdl[bone]
end

function SH_ACC:DefineOffsetEasy(mdl, bone, pos, ang)
	self.Offsets[mdl] = {
		default = {
			bone = bone,
			pos = pos,
			ang = ang,
		}
	}
end

local function Offset(...)
	SH_ACC:DefineOffsetEasy(...)
end

/*
	PREDEFINED OFFSETS
*/

SH_ACC.Offsets = {}
Offset("models/santa/santa.mdl", B_HEAD, V(0.4, -0.5, 0), A(0, -70, -90))
--
--2.0 ACCESSORY
--
--ponchik
Offset("models/noesis/donut.mdl", B_HEAD, V(6.2, -0.5, 0.2), A(0, -70, -90))
--hedkrab
Offset("models/nova/w_headcrab.mdl", B_HEAD, V(5.2, -1.5, 0), A(90, -90, -360))
--pedofil
Offset("models/nova/w_headgear.mdl", B_HEAD, V(-0.5, -2.5, -0.1), A(90, -90, -360))
--professor
Offset("models/player/items/humans/top_hat.mdl", B_HEAD, V(0, -2.5, -0.1), A(90, -90, -360))
--shkolnik
Offset("models/player/items/humans/graduation_cap.mdl", B_HEAD, V(0, 0.65, 0), A(90, -90, -90))
--trava
Offset("models/props/pi_fern.mdl", B_HEAD, V(5, 0.65, 0), A(90, -90, -90))
--snegovik
Offset("models/props/cs_office/snowman_face.mdl", B_HEAD, V(2, 2, -0.1), A(90, -90, -90))
--kepka
Offset("models/props/cs_office/snowman_hat.mdl", B_HEAD, V(6, 1.5, 0), A(90, -90, -90))
--shar
Offset("models/maxofs2d/hover_basic.mdl", B_HEAD, V(2.7, 1, -0.1), A(90, -90, -360))
--vasya
Offset("models/maxofs2d/balloon_gman.mdl", B_HEAD, V(-8, -0.65, 0.1), A(0, -90, -90))
--sveta
Offset("models/maxofs2d/balloon_mossman.mdl", B_HEAD, V(-8, 0.55, -0.1), A(0, -90, -90))
--defender
Offset("models/maxofs2d/logo_gmod_b.mdl", B_SPINE2, V(4, 4, -0.1), A(0, -90, -90))
--lampa
Offset("models/props/de_inferno/ceiling_light.mdl", B_HEAD, V(4.5, 0, 0), A(0, -90, -270))
--kepka
Offset("models/props/de_tides/vending_hat.mdl", B_HEAD, V(4.2, 0.7, 0.15), A(90, -90, -90))
--cherepashka
Offset("models/props/de_tides/vending_turtle.mdl", B_HEAD, V(4.2, 0.25, 0.15), A(90, -90, -90))
--gitara
Offset("models/props_phx/misc/fender.mdl", B_SPINE2, V(9, 1, -4.15), A(30, 180, 270))
--jetpack
Offset("models/thrusters/jetpack.mdl", B_SPINE2, V(-1, 4, -0.5), A(0, 90, 90))
--GIB
Offset("models/gibs/scanner_gib05.mdl", B_HEAD, V(2, -1.5, -1.5), A(0, -90, -270))
--uebaka
Offset("models/props_phx/facepunch_logo.mdl", B_SPINE2, V(3, 4.5, 0), A(0, 180, 90))
--construct_sign
Offset("models/maxofs2d/construct_sign.mdl", B_SPINE2, V(3, 3.5, 0), A(0, -90, 270))
--шляпа-лампа
Offset("models/props_wasteland/prison_lamp001c.mdl", B_HEAD, V(9, 1.1, 0), A(0, -90, 270))
--znak1
Offset("models/props_c17/streetsign004e.mdl", B_SPINE2, V(3, 4, 0), A(0, 180, 0))
--znak2
Offset("models/props_c17/streetsign004f.mdl", B_SPINE2, V(3, 4, 0), A(0, 180, 0))
--krug
Offset("models/props/de_nuke/lifepreserver.mdl", "ValveBiped.Bip01_Neck1", V(1, 3, 0), A(0, 180, 0))






-- ADDON: [GTA V] Giant Accessories Pack
Offset("models/modified/hat07.mdl", B_HEAD, V(4.8, -0.5, 0.2), A(0, -70, -90))
Offset("models/modified/hat08.mdl", B_HEAD, V(4.2, -0, 0.2), A(0, -80, -90))
Offset("models/sal/acc/fix/beerhat.mdl", B_HEAD, V(3, 0, 0.2), A(0, -75, -90))
Offset("models/modified/glasses01.mdl", B_HEAD, V(2, -0.1, 0.05), A(180, 110, 90))
Offset("models/modified/bandana.mdl", B_HEAD, V(-1.9, 1.5, 0), A(180, 110, 90))
Offset("models/modified/backpack_1.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/modified/backpack_2.mdl", B_SPINE2, V(2, -4, 0), A(0, 80, 90))
Offset("models/modified/backpack_3.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/sal/cat.mdl", B_HEAD, V(2, 0.5, 0), A(180, 110, 90))
Offset("models/sal/fox.mdl", B_HEAD, V(1.1, 0.5, 0), A(180, 110, 90))
Offset("models/sal/gingerbread.mdl", B_HEAD, V(0.5, 1, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/scarf01.mdl", "ValveBiped.Bip01_Neck1", V(-18, 14, 0), A(180, 120, 90))
Offset("models/modified/headphones.mdl", B_HEAD, V(2.3, 0.8, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/cheafhat.mdl", B_HEAD, V(7, 0, 0.4), A(180, 90, 90))
Offset("models/sal/halloween/bag.mdl", B_HEAD, V(0.5, 0.66, 0), A(180, 110, 90))
Offset("models/sal/halloween/doctor.mdl", B_HEAD, V(0, -0.1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/headwrap1.mdl", B_HEAD, V(0.6, 1.6, 0), A(180, 110, 90))
Offset("models/modified/hat01_fix.mdl", B_HEAD, V(4.4, -0.7, 0.2), A(0, -70, -90))
Offset("models/modified/hat03.mdl", B_HEAD, V(4.4, -0.7, 0), A(0, -60, -90))
Offset("models/modified/hat04.mdl", B_HEAD, V(4.2, -2.1, 0), A(0, -60, -90))
Offset("models/modified/hat06.mdl", B_HEAD, V(5.3, -1, 0), A(0, -80, -90))
Offset("models/modified/mask5.mdl", B_HEAD, V(0.5, 1.2, 0.05), A(180, 110, 90))
Offset("models/sal/hawk_1.mdl", B_HEAD, V(-1.5, 1, 0.2), A(180, 110, 90))
Offset("models/sal/pig.mdl", B_HEAD, V(0.1, 0.5, 0), A(180, 105, 90))
Offset("models/sal/wolf.mdl", B_HEAD, V(-1, 1, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_1.mdl", B_HEAD, V(-62.5, 17.7, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_4.mdl", B_HEAD, V(0.2, 1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/monkey.mdl", B_HEAD, V(0.2, 0.8, 0), A(180, 110, 90))
Offset("models/sal/halloween/ninja.mdl", B_HEAD, V(-0.3, 0.8, 0.1), A(180, 110, 90))

-- matveicher
Offset("models/captainbigbutt/skeyler/accessories/duck_tube.mdl", "ValveBiped.Bip01_Head1", Vector(7, -1.5, 0), Angle(0, -72.5, -90))
Offset("models/gmod_tower/fairywings.mdl", "ValveBiped.Bip01_Spine2", Vector(5.4, -2.56, 0), Angle(-90, 0, 0))
Offset("models/gmod_tower/jetpack.mdl", "ValveBiped.Bip01_Spine2", Vector(0, -2.5, 0), Angle(0, 90, 90))
Offset("models/crown/models/crownroyal.mdl", "ValveBiped.Bip01_Head1", Vector(5.56, -0.427, 0), Angle(0, -62.5, -90))
Offset("models/gmod_tower/batmanmask.mdl", "ValveBiped.Bip01_Head1", Vector(2, 1.3, 0), Angle(0, -62.5, -90))
Offset("models/gmod_tower/bombermanhelmet.mdl", "ValveBiped.Bip01_Head1", Vector(2, 0, 0), Angle(0, -77.5, -90))
Offset("models/gmod_tower/legohead.mdl", "ValveBiped.Bip01_Head1", Vector(2, 0, 0), Angle(0, -77.5, -90))
Offset("models/gmod_tower/rubikscube.mdl", "ValveBiped.Bip01_Head1", Vector(2.71, 0.68, 0), Angle(0, -75, -90))
-- Offset("models/gmod_tower/rubikscube.mdl", "ValveBiped.Bip01_Head1", Vector(2, -0.4, 0), Angle(0, -69.5, -90))
Offset("models/gmod_tower/noface.mdl", "ValveBiped.Bip01_Head1", Vector(3.5, 5, 0), Angle(0, -69.5, -90))
Offset("models/lordvipes/daftpunk/thomas.mdl", "ValveBiped.Bip01_Head1", Vector(3.22, 0.286, 0), Angle(0, -69.5, -90))
Offset("models/splinks/kf2/cosmetics/albert_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0.823, 0.22, 0), Angle(0, -69.5, -90))
Offset("models/splinks/kf2/cosmetics/bowler_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0.823, 0.22, 0), Angle(0, -69.5, -90))
Offset("models/splinks/kf2/cosmetics/coleman_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0.823, 0.22, 0), Angle(0, -69.5, -90))
Offset("models/vikinghelmet/vikinghelmet.mdl", "ValveBiped.Bip01_Head1", Vector(3.72, 0.22, 0), Angle(0, -69.5, -90))
Offset("models/warz/desertboonie.mdl", "ValveBiped.Bip01_Head1", Vector(0.12, 2.38, -0.842), Angle(270, -69.5, -90))
Offset("models/warz/firehelmet.mdl", "ValveBiped.Bip01_Head1", Vector(-3.87, 2.38, -0.842), Angle(270, -69.5, -90))
Offset("models/warz/hardhat.mdl", "ValveBiped.Bip01_Head1", Vector(-0.956, 1.66, 1.42), Angle(270, -69.5, -90))
Offset("models/warz/leatherboonie.mdl", "ValveBiped.Bip01_Head1", Vector(0.875, -0.142, 1.2), Angle(270, -69.5, -90))





-- ADDON: GMod Tower: Accessories Pack
Offset("models/captainbigbutt/skeyler/accessories/glasses04.mdl", B_HEAD, V(2.5, 2.8, 0.05), A(180, 110, 90))
Offset("models/captainbigbutt/skeyler/hats/strawhat.mdl", B_HEAD, V(5.08, -0.37, 0), A(0, 108.00, 90))
Offset("models/gmod_tower/aviators.mdl", B_HEAD, V(3.26, 1.73, 0), A(180, 98.26, 90))
Offset("models/captainbigbutt/skeyler/hats/sunhat.mdl", B_HEAD, V(5.02, 2.44, 1.50), A(-40.60, 129.64, 90))
Offset("models/captainbigbutt/skeyler/accessories/glasses03.mdl", B_HEAD, V(2.68, 3.56, 0), A(180, 114.32, 90))
Offset("models/captainbigbutt/skeyler/hats/cowboyhat.mdl", B_HEAD, V(6.07, -0.73, 0), A(180, 113.41, 90))
Offset("models/gmod_tower/starglasses.mdl", B_HEAD, V(3.23, 2.50, 0), A(180, 100.50, 90))
Offset("models/gmod_tower/fairywings.mdl", B_SPINE2, V(0, -0.67, 0), A(-91.86, 0, 0))
Offset("models/captainbigbutt/skeyler/hats/cat_ears.mdl", B_HEAD, V(2.53, 0, 0), A(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/afro.mdl", "ValveBiped.Bip01_Head1", Vector(3.20871, 0, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/cat_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.43, -0.72, 0), Angle(180, 102, 90))
Offset("models/captainbigbutt/skeyler/hats/deadmau5.mdl", "ValveBiped.Bip01_Head1", Vector(3.87, 0.705, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/bear_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.79, -0.189, 0), Angle(180, 99.9, 90))
Offset("models/captainbigbutt/skeyler/hats/frog_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.29, -0.6, 0), Angle(180, 99.9, 90))
Offset("models/captainbigbutt/skeyler/hats/maid_headband.mdl", "ValveBiped.Bip01_Head1", Vector(3.25, 0, 0), Angle(-180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/zhat.mdl", "ValveBiped.Bip01_Head1", Vector(3.97, -0.36, 0), Angle(161, 101, 101))
Offset("models/gmod_tower/3dglasses.mdl", "ValveBiped.Bip01_Head1", Vector(2.89, 1.8, 0), Angle(180, 103, 90))
Offset("models/gmod_tower/partyhat.mdl", "ValveBiped.Bip01_Head1", Vector(6.78, 0, 0.72), Angle(180, 101, 76.8))

-- ADDON: Horse Mask Prop
Offset("models/horsie/horsiemask.mdl", "ValveBiped.Bip01_Head1", Vector(3.52, 3.37, 0), Angle(-90, 0, -26.9))

-- ADDON: Alienware mask from PAYDAY 2
Offset("models/snowzgmod/payday2/masks/maskalienware.mdl", "ValveBiped.Bip01_Head1", Vector(2.66, 4.33, 0), Angle(0, -90, -90))

-- ADDON: Freddy Mask SWEP
Offset("models/errolliamp/five_nights_at_freddys/freddy_mask.mdl", "ValveBiped.Bip01_Head1", Vector(-2.19, 1.05, 0), Angle(-180, 77.7, 90))

-- ADDON: MGS V TPP Venom's Respirator
Offset("models/mgsv/gear/venom_respirator.mdl", "ValveBiped.Bip01_Head1", Vector(0.36, 2.88, 0), Angle(180, 116, 90))

-- ADDON: Pirate Hat Model
Offset("models/piratehat/piratehat.mdl", "ValveBiped.Bip01_Head1", Vector(3.59, 0.746, 0), Angle(0, 109, 90))

-- ADDON: Detective Hat Model
Offset("models/ttt/deerstalker.mdl", "ValveBiped.Bip01_Head1", Vector(-1.84, 0.364, 0), Angle(0, 3.62, 0))

-- ADDON: MGS V TPP Chicken Hat
Offset("models/chicken_hat/chicken_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.72, 0), Angle(0, -71.8, -90))

-- ADDON: Polished Military Beret- FO3 HAT
Offset("models/fallout 3/polish_beret.mdl", "ValveBiped.Bip01_Head1", Vector(6.13, 1.77, 1.49), Angle(0, -90, -90))

-- ADDON: Animal masks from PAYDAY 2
Offset("models/snowzgmod/payday2/masks/maskarnold.mdl", "ValveBiped.Bip01_Head1", Vector(2.52, 3.97, 0), Angle(0, -90, -90))

-- ADDON: Wrench Mask
Offset("models/models/wrenchmask.mdl", "ValveBiped.Bip01_Head1", Vector(-1.37, 6.3, 0), Angle(0, -70.6, -90))

-- ADDON: Russian hat/Ushanka prop
Offset("models/russianhat1.mdl", "ValveBiped.Bip01_Head1", Vector(-6.12, -0.2, 0), Angle(180, -92.9, -90))

-- ADDON: GTA IV Bike Helmets
Offset("models/dean/gtaiv/helmet.mdl", "ValveBiped.Bip01_Head1", Vector(2.88, 0, 0), Angle(0, -90, -90))

-- ADDON: Halloween_Pumpkin
Offset("models/props/pumpkin_z.mdl", "ValveBiped.Bip01_Head1", Vector(3.98, 0, 0), Angle(0, -90, -90))

-- Offset copies
SH_ACC.Offsets["models/sal/bear.mdl"] = SH_ACC.Offsets["models/sal/cat.mdl"]
SH_ACC.Offsets["models/sal/owl.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/penguin.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/halloween/headwrap2.mdl"] = SH_ACC.Offsets["models/sal/halloween/headwrap1.mdl"]
SH_ACC.Offsets["models/modified/mask6.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/sal/hawk_2.mdl"] = SH_ACC.Offsets["models/sal/hawk_1.mdl"]
SH_ACC.Offsets["models/sal/acc/fix/mask_2.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/bunny_ears.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/cat_ears.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/heartband.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/maid_headband.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/starband.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/maid_headband.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskbabyrhino.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskchuck.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskdolph.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskjeanclaude.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskmark.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskmonkeybusiness.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskthehog.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]

-- You shouldn't have to modify this.
-- These are model-specific bone offsets for when you have a model slightly different in a set of otherwise identical models
SH_ACC.ModelOffsets = {
	["models/player/breen.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.2, 0)
		},
	},
	["models/player/alyx.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.4, 0)
		},
	},
	["models/player/p2_chell.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.3, 0)
		},
	},
	["models/player/barney.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.25, 0.2, 0)
		},
	},
	["models/player/monk.mdl"] = {
		[B_HEAD] = {
			pos = V(0.5, -0.5, 0)
		},
	},
	["models/player/gman_high.mdl"] = {
		[B_HEAD] = {
			pos = V(0.8, 0, 0)
		},
	},
	["models/player/odessa.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.1, 0.65, 0)
		},
	},
	["models/player/mossman.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.2, 0)
		},
	},
	["models/player/eli.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -0.5, 0)
		},
	},
	["models/player/charple.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -1.5, 0)
		},
	},
	["models/player/soldier_stripped.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.2, -1.2, 0)
		},
	},

	["models/player/group01/male_01.mdl"] = {
		[B_HEAD] = {
			pos = V(0, 0.85, 0)
		},
	},
	["models/player/group01/male_03.mdl"] = {
		[B_HEAD] = {
			pos = V(0.25, 0, 0)
		},
	},
	["models/player/group01/male_06.mdl"] = {
		[B_HEAD] = {
			pos = V(0.35, 1, 0)
		},
	},
	["models/player/group01/female_01.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.33, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_02.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_03.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.1, 0.0, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_04.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
}
SH_ACC.ModelOffsets["models/player/group01/male_04.mdl"] = SH_ACC.ModelOffsets["models/player/group01/male_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_05.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_06.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_01.mdl"]
SH_ACC.ModelOffsets["models/player/mossman_arctic.mdl"] = SH_ACC.ModelOffsets["models/player/mossman.mdl"]

/*
	CUSTOM OFFSETS
	Place your custom offsets here!
*/

Offset("models/player/items/humans/top_hat.mdl", B_HEAD, V(0, 1.43, 0), A(0, 113.47, 90))

-- Refresh the offsets
if (_FIRST_OFFSETS) then
	for _, v in ipairs (player.GetAll()) do
		if (v.SH_Accessories) then
			for id, cs in pairs (v.SH_Accessories) do
				local offset = SH_ACC:GetOffset(cs.m_sModel, v)
				cs.m_Offset = offset
			end
		end
	end
else
	_FIRST_OFFSETS = true
end
--PATH addons/cp_ballistic_shields/lua/libraries/cl_surfacegeturl.lua:
/*
MIT License

Copyright (c) 2016 Matt Krins

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
*/

--[[ Helper Function by StealthPaw/101kl/MattKrins. --]]
if SERVER then return end
local WebMaterials = {}
function surface.GetURL(url, w, h, time)
	if !url or !w or !h then return Material("error") end
	if WebMaterials[url] then return WebMaterials[url] end
	local WebPanel = vgui.Create( "HTML" )
	WebPanel:SetAlpha( 0 )
	WebPanel:SetSize( tonumber(w), tonumber(h) )
	WebPanel:OpenURL( url )
	WebPanel.Paint = function(self)
		if !WebMaterials[url] and self:GetHTMLMaterial() then
			WebMaterials[url] = self:GetHTMLMaterial()
			self:Remove()
		end
	end
	timer.Simple( 1 or tonumber(time), function() if IsValid(WebPanel) then WebPanel:Remove() end end ) // In case we do not render
	return Material("error")
end
--PATH addons/cp_ballistic_shields/lua/ballistic_shields/sh_bs_util.lua:
bshields = bshields or {}
bshields.config = bshields.config or {}

bshields.shields = {
	{
		[1] = {
			["angles"] = Angle(4,6,-14),
			["position"] = Vector(0,8,-1)
		},
		[2] = {
			["angles"] = Angle(6,6,-12),
			["position"] = Vector(8,10,-4)
		},
		[3] = {
			["angles"] = Angle(-3,7,-16),
			["position"] = Vector(-1,4,-3)
		}
	},
	{
		[1] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(6,-4,-8)
		},
		[2] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(16,-3,-12)
		},
		[3] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(6,-3,-12)
		}
	},
	{
		[1] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-7,-13)
		},
		[2] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-6,-22)
		},
		[3] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-8,-12)
		}
	}
}

--PATH addons/the_cocaine_factory/lua/autorun/cocaine_initialize.lua:
-- INITIALIZE SCRIPT
if SERVER then
	KostilWork( "1734833080" )
	
	for k, v in pairs( file.Find( "ch_cocaine/server/*.lua", "LUA" ) ) do
		include( "ch_cocaine/server/" .. v )
		--print("server: ".. v)
	end
	
	for k, v in pairs( file.Find( "ch_cocaine/client/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ch_cocaine/client/" .. v )
		--print("cs client: ".. v)
	end
	
	for k, v in pairs( file.Find( "ch_cocaine/shared/*.lua", "LUA" ) ) do
		include( "ch_cocaine/shared/" .. v )
		--print("shared: ".. v)
	end
	
	for k, v in pairs( file.Find( "ch_cocaine/shared/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ch_cocaine/shared/" .. v )
		--print("cs shared: ".. v)
	end
	
	--[[
	if TCF.Config.EnableItemStore then
		for k, v in pairs( file.Find( "autorun/ch_cocaine/itemstore/items/*.lua", "LUA" ) ) do
			include( "autorun/ch_cocaine/itemstore/items/" .. v )
			--print("itemstore: ".. v)
		end
		
		for k, v in pairs( file.Find( "autorun/ch_cocaine/itemstore/items/*.lua", "LUA" ) ) do
			AddCSLuaFile( "autorun/ch_cocaine/itemstore/items/" .. v )
			--print("cs itemstore: ".. v)
		end
	end
	--]]
end

if CLIENT then
	for k, v in pairs( file.Find( "ch_cocaine/client/*.lua", "LUA" ) ) do
		include( "ch_cocaine/client/" .. v )
		--print("client: ".. v)
	end
	
	for k, v in pairs( file.Find( "ch_cocaine/shared/*.lua", "LUA" ) ) do
		include( "ch_cocaine/shared/" .. v )
		--print("shared client: ".. v)
	end
	
	--[[
	if TCF.Config.EnableItemStore then
		for k, v in pairs( file.Find( "autorun/ch_cocaine/itemstore/items/*.lua", "LUA" ) ) do
			include( "autorun/ch_cocaine/itemstore/items/" .. v )
			--print("itemstore client: ".. v)
		end
	end
	--]]
end
--PATH addons/the_cocaine_factory/lua/ch_cocaine/shared/cocaine_meta_donator.lua:
local metaply = FindMetaTable( "Player" )

function metaply:GetDonatorBonus()
	local bonus = 1
	
	if not TCF.Config.EnableDonatorBonus then
		return 1
	end
	
	for k, v in pairs( TCF.Config.DonatorBonuses ) do
		if v.ULXGroup == self:GetUserGroup() then
			return v.Bonus
		end
	end
	
	return bonus
end
--PATH addons/cp_bricks_enchanced_sweps/lua/bricksenchancedsweps/bes_shared.lua:
BES.FText = {}
BES.FText.Nothing = {
    "Ничего не найдено",
    "что?"
}

-- hook.Add( "Initialize", "BES_Initialize_SWEPs", function()
--     table.insert( GAMEMODE.Config.DefaultWeapons, "dsr_keys" )
-- end )
--PATH addons/executioner/lua/autorun/executioner_language.lua:
Executioner.Config.Language[ 'english' ] = {
    HitPriceFormatError = 'Не правильная цена. Максимум %s - Минимум %s.',
    HitPriceCantAfford = 'Заказ стоит %s а у вас %s.',
    BonusWeaponAccepted = '%s будет удалено после выполнения заказа.',
    HitTimeReached = '%s has run out of time to complete their hit. The hit has failed!',
    HitTooSoon = 'Подождите чуть-чуть перед следующим заказом.',
    HitmanBusy = '%s уже имеет заказ.',
    RequestSent = 'Ваш заказ отправлен убийце %s.',
    CustomerNoResponse = '%s не ответил на ваш запрос.',
    HitmanNoResponse = 'Вы не смогли своевременно ответить на запрос.',
    TargetRejectHit = 'Вы не можете сделать заказ на этого человека.',
    InvalidTargets = 'Ошибка заказа, сделайте заказ заного.',
    CustomerOnHitAccepted = '%s принял ваш запрос на %s. Деньги были взяты.',
    CustomerOnHitDeclined = '%s отклонил ваш запрос на убийство.',
    HitmanOnHitAccepted = 'Вы приняли %s заказ на %s за %s.',
    HitmanOnHitDeclined = 'Вы отказали %s в заказе.',
    MessageAllOnAccepted = 'Наемник принял заказ.',
    BonusWeaponHitComplete = '%s выполнил заказ с бонусным оружием %s на %s. Награда с бонусом %s + %s.',
    HitCompletedNoBonus = '%s выполнил заказ на %s и получил %s.',
    TaxOnKill = 'Мы вяли с вас ' .. Executioner.Config.TaxOnKill .. '% за заказ.',
    TargetDiedBeforeHit = 'Цель наемника %s - %s была убита до убийства наемником!',
    TargetKilledHitman = '%s не справился с заказом %s',
    HitmanDied = 'Наемник %s был убит!',
    TargetDisconnected = 'Цель %s вышла с сервера.',
    HitmanDisconnected = 'Наемник %s вышел с сервера.',
    CustomerDisconnected = 'Заказчик %s вышел с сервера.',
    --HitmanChangedJob = 'Наемник %s сменил профессию. The hit has been refunded and the customer has been given %s back.', -- REMOVE
    HitmanArrested = 'Наемник %s был арестован полицейским %s.',
    TargetArrested = 'Цель %s была арестована полицейским %s.',
    PhoneNoSave = 'There is nothing to save.',
    PhoneOnSave = '%i Phone(s) have been saved successfully.',
    PhoneOnReset = 'Successfully removed %i phones and reset all data.',
    OnSwitchTeam = '%s сменил профессию на %s деньги возвращены.',
    BonusNoReply = 'Вы не захотели брать бонусное оружие.',
    HitActive = 'У него уже есть заказ.',
    SameTargetTooSoon = 'Вы не можете так часто делать заказы.',
    CantDrop = 'Вы не можете выкинуть бонусное оружие.',
    --> Start of Phone Related Messages <--
    OnRandomHit = 'Anonymous has placed a hit on a suspect. More detail is displayed on your phone. Type ' .. Executioner.Config.Phone_Command .. '.',
    OnRadomHitAccepted = 'You have accepted a randomly generated hit against %s for %s.',
    HitmanActiveHit = 'У вас уже есть заказ.',
    NotEnoughHitmen = 'Вы не можете сделать заказ. Наемники отсутствуют',
    CustomerOnPhoneHitPlaced = 'Вы сделали заказ на %s. Вы отдали %s.',
    HitmanNotifyRequest = '%s Сделал заказ на человека. Введите ' .. Executioner.Config.Phone_Command .. ' чтобы принять заказ.',
    PhoneNotInService = 'Попробуйте сделать заказ позднее.',
    HitmanOnUsePhone = 'Меню наёмника ' .. Executioner.Config.Phone_Command .. ''
}

Executioner.Config.Language[ 'norwegian' ] = {
    HitPriceFormatError = 'Det er noe galt med hit prisen. Maks %s - Minst %s.',
    HitPriceCantAfford = 'Du har ikke råd til å å sette hit i og med at det koster %s og for øyeblikket har du %s.',
    BonusWeaponAccepted = '%s vil bli borte når mordet har blitt forsøkt.',
    HitTimeReached = '%s har gått tom for tid for å fullføre deres hit. Mordet var mislykket!',
    HitTooSoon = 'Du kan ikke allerede plassere et nytt hit.',
    HitmanBusy = '%s jobber allerede med noen.',
    RequestSent = 'Din forespørsel er sendt til %s.',
    CustomerNoResponse = '%s har ikke svart på din forespørsel.',
    HitmanNoResponse = 'Du klarte ikke å svare på forespørselen i tide.',
    TargetRejectHit = 'Du kan ikke plassere et hit på denne personen.',
    InvalidTargets = 'Kunne ikke plassere et hit. Kunden(e) er ikke koblet til serveren, eller så er du død.',
    CustomerOnHitAccepted = '%s har akseptert ditt hit-forespørsel på %s. Pengene har nå blitt overført.',
    CustomerOnHitDeclined = '%s har avvist ditt hit-forespørsel. Du har ikke blitt belastet.',
    HitmanOnHitAccepted = 'Du har akseptert %s\'s hit-forespørsel mot %s for %s.',
    HitmanOnHitDeclined = 'Du har avvist %s\'s hit.',
    MessageAllOnAccepted = 'Noen har akseptert et hit. Se deg for, du er kanskje neste mål.',
    BonusWeaponHitComplete = '%s har fullført et hit ved bruk av %s mot %s. De har blitt belønnet med %s og et bonus av %s.',
    HitCompletedNoBonus = '%s har fullført deres hit på %s og har blitt belønnet med %s.',
    TaxOnKill = 'Din samlede inntekt har blitt skattelagt av ' .. Executioner.Config.TaxOnKill .. '%.',
    TargetDiedBeforeHit = '%s\'s mål %s ble drept før de kunne fullføre deres hit. Hit-forespørselet som ble satt, mislyktes!',
    TargetKilledHitman = '%s slo %s i sitt eget spill. Leiemorderen har blitt drept. Mordet mislyktes!',
    HitmanDied = 'Leiemorder %s ble drept før han/hun hadde muligheten til å fullføre deres hit. Hit-forespørselen var misslykket!',
    TargetDisconnected = 'Målet %s forlot serveren med et aktiv hit. Kunden har blitt betalt tilbake.',
    HitmanDisconnected = 'Leiemorder %s har forlatt serveren. Hit-forespørselen er tatt tilbake.',
    CustomerDisconnected = 'Kunden %s har forlatt serveren. Hit-forespørselen er tatt tilbake.',
    HitmanChangedJob = 'Leiemorder %s har byttet jobb. Hit-forespørselen har blitt refundert og kunden har fått %s tilbake.',
    HitmanArrested = 'Leiemorder %s har blitt arrestert av %s. Hit-forespørselen har blitt refundert.',
    TargetArrested = 'Målet %s har blitt arrestert av %s. Hit-forespørselen har blitt refundert.',
    PhoneNoSave = 'Det er ingenting å lagre.',
    PhoneOnSave = '%i Telefon(er) har blitt lagret.',
    PhoneOnReset = 'Telefonene til %i ble vellykket fjernet og alle dataene er tilbakestilt',
    OnSwitchTeam = '%s har endret seg til %s hvis Hit er refundert.',
    BonusNoReply = 'Du tok for lang tid til å svare på bonustilbudet',
    HitActive = 'Denne personen er allerede fra en Hit-transaksjon. Du kan ikke plassere et slag på dem.',
    SameTargetTooSoon = 'Denne personen har nylig hatt et Hit mot dem, du kan ikke plassere en på denne personen ennå.',
    CantDrop = 'Du kan ikke slippe en bonusvåpen.',
    --> Starten på telefon relatert meldinger <--
    OnRandomHit = 'Det har blitt plassert et hit anonymt på en mistenkt. Flere detaljer er vist på telefonen. Skriv ' .. Executioner.Config.Phone_Command .. '.',
    OnRadomHitAccepted = 'Du har akseptert et tilfeldig generert hit på %s for %s.',
    HitmanActiveHit = 'Du har allerede et aktivt hit. Det er ikke nødvendig med en til.',
    NotEnoughHitmen = 'Det er ikke nok leiemordere på serveren for øyeblikket. Du kan ikke plassere et hit.',
    CustomerOnPhoneHitPlaced = 'Du har satt et hit på %s. Leiemordere vil ta hånd om ditt forespørsel snart. Du har blitt belastet %s.',
    HitmanNotifyRequest = '%s har bedt om at et hit skal utføres. Flere detaljer vises på telefonen. Skriv ' .. Executioner.Config.Phone_Command .. '.',
    PhoneNotInService = 'Telefonen er ikke i tjeneste for øyeblikket, kom tilbake senere.',
    HitmanOnUsePhone = 'Du kan ikke bruke telefonen som en leiemorder. Skriv ' .. Executioner.Config.Phone_Command .. ' istedet.'
}

Executioner.Config.Language[ 'dutch' ] = {
    HitPriceFormatError = 'Er is iets fout met de kosten van de hit. Maximaal %s - Minimaal %s.',
    HitPriceCantAfford = 'Je hebt niet genoeg geld voor deze hit. Het kost %s, je hebt op dit moment %s.',
    BonusWeaponAccepted = 'Het %s zal weggehaald worden wanneer een poging is gedaan tot de hit.',
    HitTimeReached = '%s heeft geen tijd meer om de hit te voltooien. De hit was niet geslaagd!',
    HitTooSoon = 'Je kunt de hit niet zo vroeg plaatsen.',
    HitmanBusy = '%s is al bezig met iemand.',
    RequestSent = 'Je hit verzoek is verstuurd naar %s.',
    CustomerNoResponse = '%s heeft niet geantwoord op je verzoek.',
    HitmanNoResponse = 'Je was te laat om het hit verzoek te beantwoorden.',
    TargetRejectHit = 'Je kan geen hit plaatsen op dit persoon.',
    InvalidTargets = 'Kon de hit niet plaatsen. Client(en) zijn niet verbonden met de server, of je bent dood.',
    CustomerOnHitAccepted = 'Je hebt %s\'s hit verzoek op %s voor %s geaccepteerd.',
    CustomerOnHitDeclined = '%s heeft je hit geweigerd. Je hebt niets hoeven betalen.',
    HitmanOnHitAccepted = 'Je hebt geaccepteerd %s\'s hit verzoek op %s voor %s.',
    HitmanOnHitDeclined = 'Je hebt %s\'s hit geweigerd.',
    MessageAllOnAccepted = 'Iemand heeft je hit geaccepteerd. Kijk uit, jij zou het doelwit kunnen zijn.',
    BonusWeaponHitComplete = '%s heeft de hit volbracht met %s op %s. Ze zijn beloond met %s en een bonus van %s.',
    HitCompletedNoBonus = '%s heeft zijn hit op %s volbracht en is beloond met %s.',
    TaxOnKill = 'Je totale inkomen is belast met ' .. Executioner.Config.TaxOnKill .. '%.',
    TargetDiedBeforeHit = '%s\'s doelwit %s was vermoord voordat ze de hit konden voltooien. De hit is gefaald!',
    TargetKilledHitman = '%s was geen match voor hun doelwit %s. Ze zijn vermoord. De hit is gefaald!',
    HitmanDied = 'Hitman %s was vermoord voordat ze een kans hadden om hun hit te voltooien. De hit is gefaald!',
    TargetDisconnected = 'Doelwit %s heeft de server verlaten met een active hit. De klant is terugbetaald.',
    HitmanDisconnected = 'Hitman %s heeft de server verlaten. De hit is terugbetaald.',
    CustomerDisconnected = 'Klant %s heeft de server verlaten. De hit is terugbetaald.',
    HitmanChangedJob = 'Hitman %s heeft zijn klasse veranderd. De hit is terugbetaald en aan de klant is %s terug gegeven.',
    HitmanArrested = 'Hitman %s is gearresteerd door %s. De hit is terugbetaald.',
    TargetArrested = 'Target %s is gearresteerd door %s. De hit is terugbetaald.',
    PhoneNoSave = 'Er is niets om te redden.',
    PhoneOnSave = '%i Telefoon(s) zijn succesvol opgeslagen.',
    PhoneOnReset = 'Succesvol verwijderd %i phones en reset alle gegevens.',
    OnSwitchTeam = '%s is veranderd in een %s the Hit is terugbetaald.',
    BonusNoReply = 'Je hebt te lang geduurd om te antwoorden op de bonusaanbieding',
    HitActive = 'Deze persoon maakt al deel uit van een Hit-transactie. Je kunt geen Hit op hem plaatsen.',
    SameTargetTooSoon = 'Deze persoon heeft recent een klap tegen zich gekregen, je kunt er nog geen één op deze persoon plaatsen.',
    CantDrop = 'Je kunt een bonuswapen niet laten vallen.',
    --> Start of Phone Related Messages <--
    OnRandomHit = 'Anoniem heeft een hit op de verdachte geplaatst. Meer details zijn zichtbaar op je telefoon. Typ ' .. Executioner.Config.Phone_Command .. '.',
    OnRadomHitAccepted = 'Je hebt een willekeurig gegenereerde hit geaccepteerd op %s voor %s.',
    HitmanActiveHit = 'Je hebt al een actieve hit. Het is niet nodig er nog een te plaatsen.',
    NotEnoughHitmen = 'Er zijn niet genoeg hitmans verbonden met de server op het moment. Je kunt geen hit plaatsen',
    CustomerOnPhoneHitPlaced = 'Je hebt een hit gecreerd op %s. Hitmen zullen je verzoek spoedig behandelen. Je hebt betaald',
    HitmanNotifyRequest = '%s heeft verzocht een hit uit te voeren. Meer details zijn zichtbaar op je telefoon. Typ ' .. Executioner.Config.Phone_Command .. '.',
    PhoneNotInService = 'De telefoon is niet beschikbaar op dit moment, kom later terug.',
    HitmanOnUsePhone = 'Je kunt de telefoon niet als Hitman gebruiken. Typ ' .. Executioner.Config.Phone_Command .. ' inplaats daarvan.'
}

Executioner.Language = Executioner.Config.Language[ Executioner.Config.Language.Choice ]

--PATH addons/admin_warns/lua/fam/vgui/fam_avatar.lua:
local rad 						= math.rad
local cos 						= math.cos
local sin 						= math.sin

local function DrawCircle(x, y, radius, seg)
	local cir = {}

	table.insert(cir, {
		x = x,
		y = y
	})

	for i = 0, seg do
		local a = rad((i / seg) * -360)

		table.insert(cir, {
			x = x + sin(a) * radius,
			y = y + cos(a) * radius
		})
	end

	local a = rad(0)

	table.insert(cir, {
		x = x + sin(a) * radius,
		y = y + cos(a) * radius
	})

	surface.DrawPoly(cir)
end

local PANEL = {}

function PANEL:Init()
	self.avatar = vgui.Create("AvatarImage", self)
	self.avatar:SetPaintedManually(true)
	self.button = vgui.Create("DButton", self.avatar)
	self.button:SetText("")
	self.button:SetPaintedManually(true)

	self.button.OnCursorEntered = function(this)
		surface.PlaySound("garrysmod/ui_hover.wav")
	end

	self.button.DoClick = function(this)
		surface.PlaySound("garrysmod/ui_click.wav")

		if self.picked_ply ~= nil then
			gui.OpenURL("http://steamcommunity.com/profiles/".. self.picked_ply)
		end
	end

	self.button.Paint = function(this, w, h)
		if (this.Depressed or this.m_bSelected) then
			surface.SetDrawColor(255, 155, 55, 100)
		elseif (this.Hovered) then
			surface.SetDrawColor(0,0,0,100)
		else
			surface.SetDrawColor(0,0,0,0)
		end

		surface.DrawRect(0,0,w,h)
	end
end

function PANEL:PerformLayout()
	self.avatar:SetSize(self:GetWide(), self:GetTall())
	self.button:SetSize(self:GetWide(), self:GetTall())
end

function PANEL:SetPlayer(ply, size)
	self.avatar:SetPlayer(ply, size)
	self.picked_ply = ply:SteamID64()
end

function PANEL:SetSteamID(sid, size)
	self.avatar:SetSteamID(sid, size)
	self.picked_ply = sid
end

function PANEL:Paint(w, h)
	render.ClearStencil()
	render.SetStencilEnable(true)
	render.SetStencilWriteMask(1)
	render.SetStencilTestMask(1)
	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_ZERO)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
	render.SetStencilReferenceValue(1)
	draw.NoTexture()
	surface.SetDrawColor(Color(0, 0, 0, 255))
	DrawCircle(w * .5, h * .5, h * .5, 60)
	render.SetStencilFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(1)
	self.avatar:PaintManual()
	render.SetStencilEnable(false)
	render.ClearStencil()
end

vgui.Register("fam_avatar", PANEL, "Panel")
--PATH addons/fpp/lua/fprofiler/cami.lua:
--[[
CAMI - Common Admin Mod Interface.
Makes admin mods intercompatible and provides an abstract privilege interface
for third party addons.

IMPORTANT: This is a draft script. It is very much WIP.

Follows the specification on this page:
https://docs.google.com/document/d/1QIRVcAgZfAYf1aBl_dNV_ewR6P25wze2KmUVzlbFgMI


Structures:
    CAMI_USERGROUP, defines the charactaristics of a usergroup:
    {
        Name
            string
            The name of the usergroup
        Inherits
            string
            The name of the usergroup this usergroup inherits from
    }

    CAMI_PRIVILEGE, defines the charactaristics of a privilege:
    {
        Name
            string
            The name of the privilege
        MinAccess
            string
            One of the following three: user/admin/superadmin
        HasAccess
            function(
                privilege :: CAMI_PRIVILEGE,
                actor     :: Player,
                target    :: Player
            ) :: bool
            optional
            Function that decides whether a player can execute this privilege,
            optionally on another player (target).
    }
]]

-- Version number in YearMonthDay format.
local version = 20150902.1

if CAMI and CAMI.Version >= version then return end

CAMI = CAMI or {}
CAMI.Version = version

--[[
usergroups
    Contains the registered CAMI_USERGROUP usergroup structures.
    Indexed by usergroup name.
]]
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

--[[
privileges
    Contains the registered CAMI_PRIVILEGE privilege structures.
    Indexed by privilege name.
]]
local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}

--[[
CAMI.RegisterUsergroup
    Registers a usergroup with CAMI.

    Parameters:
        usergroup
            CAMI_USERGROUP
            (see CAMI_USERGROUP structure)
        source
            any
            Identifier for your own admin mod. Can be anything.
            Use this to make sure CAMI.RegisterUsergroup function and the
            CAMI.OnUsergroupRegistered hook don't cause an infinite loop



    Return value:
        CAMI_USERGROUP
            The usergroup given as argument.
]]
function CAMI.RegisterUsergroup(usergroup, source)
    usergroups[usergroup.Name] = usergroup

    hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source)
    return usergroup
end

--[[
CAMI.UnregisterUsergroup
    Unregisters a usergroup from CAMI. This will call a hook that will notify
    all other admin mods of the removal.

    Call only when the usergroup is to be permanently removed.

    Parameters:
        usergroupName
            string
            The name of the usergroup.
        source
            any
            Identifier for your own admin mod. Can be anything.
            Use this to make sure CAMI.UnregisterUsergroup function and the
            CAMI.OnUsergroupUnregistered hook don't cause an infinite loop

    Return value:
        bool
            Whether the unregistering succeeded.
]]
function CAMI.UnregisterUsergroup(usergroupName, source)
    if not usergroups[usergroupName] then return false end

    local usergroup = usergroups[usergroupName]
    usergroups[usergroupName] = nil

    hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)

    return true
end

--[[
CAMI.GetUsergroups
    Retrieves all registered usergroups.

    Return value:
        Table of CAMI_USERGROUP, indexed by their names.
]]
function CAMI.GetUsergroups()
    return usergroups
end

--[[
CAMI.GetUsergroup
    Receives information about a usergroup.

    Return value:
        CAMI_USERGROUP
            Returns nil when the usergroup does not exist.
]]
function CAMI.GetUsergroup(usergroupName)
    return usergroups[usergroupName]
end

--[[
CAMI.UsergroupInherits
    Returns true when usergroupName1 inherits usergroupName2.
    Note that usergroupName1 does not need to be a direct child.
    Every usergroup trivially inherits itself.

    Parameters:
        usergroupName1
            string
            The name of the usergroup that is queried.
        usergroupName2
            string
            The name of the usergroup of which is queried whether usergroupName1
            inherits from.

    Return value:
        bool
            Whether usergroupName1 inherits usergroupName2.
]]
function CAMI.UsergroupInherits(usergroupName1, usergroupName2)
    repeat
        if usergroupName1 == usergroupName2 then return true end

        usergroupName1 = usergroups[usergroupName1] and
                         usergroups[usergroupName1].Inherits or
                         usergroupName1
    until not usergroups[usergroupName1] or
          usergroups[usergroupName1].Inherits == usergroupName1

    -- One can only be sure the usergroup inherits from user if the
    -- usergroup isn't registered.
    return usergroupName1 == usergroupName2 or usergroupName2 == "user"
end

--[[
CAMI.InheritanceRoot
    All usergroups must eventually inherit either user, admin or superadmin.
    Regardless of what inheritance mechism an admin may or may not have, this
    always applies.

    This method always returns either user, admin or superadmin, based on what
    usergroups eventually inherit.

    Parameters:
        usergroupName
            string
            The name of the usergroup of which the root of inheritance is
            requested

    Return value:
        string
            The name of the root usergroup (either user, admin or superadmin)
]]
function CAMI.InheritanceRoot(usergroupName)
    if not usergroups[usergroupName] then return end

    local inherits = usergroups[usergroupName].Inherits
    while inherits ~= usergroups[usergroupName].Inherits do
        usergroupName = usergroups[usergroupName].Inherits
    end

    return usergroupName
end

--[[
CAMI.RegisterPrivilege
    Registers a privilege with CAMI.
    Note: do NOT register all your admin mod's privileges with this function!
    This function is for third party addons to register privileges
    with admin mods, not for admin mods sharing the privileges amongst one
    another.

    Parameters:
        privilege
            CAMI_PRIVILEGE
            See CAMI_PRIVILEGE structure.

    Return value:
        CAMI_PRIVILEGE
            The privilege given as argument.
]]
function CAMI.RegisterPrivilege(privilege)
    privileges[privilege.Name] = privilege

    hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)

    return privilege
end

--[[
CAMI.UnregisterPrivilege
    Unregisters a privilege from CAMI. This will call a hook that will notify
    all other admin mods of the removal.

    Call only when the privilege is to be permanently removed.

    Parameters:
        privilegeName
            string
            The name of the privilege.

    Return value:
        bool
            Whether the unregistering succeeded.
]]
function CAMI.UnregisterPrivilege(privilegeName)
    if not privileges[privilegeName] then return false end

    local privilege = privileges[privilegeName]
    privileges[privilegeName] = nil

    hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)

    return true
end

--[[
CAMI.GetPrivileges
    Retrieves all registered privileges.

    Return value:
        Table of CAMI_PRIVILEGE, indexed by their names.
]]
function CAMI.GetPrivileges()
    return privileges
end

--[[
CAMI.GetPrivilege
    Receives information about a privilege.

    Return value:
        CAMI_PRIVILEGE when the privilege exists.
            nil when the privilege does not exist.
]]
function CAMI.GetPrivilege(privilegeName)
    return privileges[privilegeName]
end

--[[
CAMI.PlayerHasAccess
    Queries whether a certain player has the right to perform a certain action.
    Note: this function does NOT return an immediate result!
    The result is in the callback!

    Parameters:
        actorPly
            Player
            The player of which is requested whether they have the privilege.
        privilegeName
            string
            The name of the privilege.
        callback
            function(bool, string)
            This function will be called with the answer. The bool signifies the
            yes or no answer as to whether the player is allowed. The string
            will optionally give a reason.
        targetPly
            Optional.
            The player on which the privilege is executed.
        extraInfoTbl
            Optional.
            Table containing extra information.
            Officially supported members:
                Fallback
                    string
                    Either of user/admin/superadmin. When no admin mod replies,
                    the decision is based on the admin status of the user.
                    Defaults to admin if not given.
                IgnoreImmunity
                    bool
                    Ignore any immunity mechanisms an admin mod might have.
                CommandArguments
                    table
                    Extra arguments that were given to the privilege command.

    Return value:
        None, the answer is given in the callback function in order to allow
        for the admin mod to perform e.g. a database lookup.
]]
-- Default access handler
local defaultAccessHandler = {["CAMI.PlayerHasAccess"] =
    function(_, actorPly, privilegeName, callback, _, extraInfoTbl)
        -- The server always has access in the fallback
        if not IsValid(actorPly) then return callback(true, "Fallback.") end

        local priv = privileges[privilegeName]

        local fallback = extraInfoTbl and (
            not extraInfoTbl.Fallback and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "user" and true or
            extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())


        if not priv then return callback(fallback, "Fallback.") end

        callback(
            priv.MinAccess == "user" or
            priv.MinAccess == "admin" and actorPly:IsAdmin() or
            priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin()
            , "Fallback.")
    end,
    ["CAMI.SteamIDHasAccess"] =
    function(_, _, _, callback)
        callback(false, "No information available.")
    end
}
function CAMI.PlayerHasAccess(actorPly, privilegeName, callback, targetPly,
extraInfoTbl)
    hook.Call("CAMI.PlayerHasAccess", defaultAccessHandler, actorPly,
        privilegeName, callback, targetPly, extraInfoTbl)
end

--[[
CAMI.GetPlayersWithAccess
    Finds the list of currently joined players who have the right to perform a
    certain action.
    NOTE: this function will NOT return an immediate result!
    The result is in the callback!

    Parameters:
        privilegeName
            string
            The name of the privilege.
        callback
            function(players)
            This function will be called with the list of players with access.
        targetPly
            Optional.
            The player on which the privilege is executed.
        extraInfoTbl
            Optional.
            Table containing extra information.
            Officially supported members:
                Fallback
                    string
                    Either of user/admin/superadmin. When no admin mod replies,
                    the decision is based on the admin status of the user.
                    Defaults to admin if not given.
                IgnoreImmunity
                    bool
                    Ignore any immunity mechanisms an admin mod might have.
                CommandArguments
                    table
                    Extra arguments that were given to the privilege command.
]]
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

    for _, ply in pairs(allPlys) do
        CAMI.PlayerHasAccess(ply, privilegeName,
            function(...) onResult(ply, ...) end,
            targetPly, extraInfoTbl)
    end
end

--[[
CAMI.SteamIDHasAccess
    Queries whether a player with a steam ID has the right to perform a certain
    action.
    Note: the player does not need to be in the server for this to
    work.

    Note: this function does NOT return an immediate result!
    The result is in the callback!

    Parameters:
        actorSteam
            Player
            The SteamID of the player of which is requested whether they have
            the privilege.
        privilegeName
            string
            The name of the privilege.
        callback
            function(bool, string)
            This function will be called with the answer. The bool signifies the
            yes or no answer as to whether the player is allowed. The string
            will optionally give a reason.
        targetSteam
            Optional.
            The SteamID of the player on which the privilege is executed.
        extraInfoTbl
            Optional.
            Table containing extra information.
            Officially supported members:
                IgnoreImmunity
                    bool
                    Ignore any immunity mechanisms an admin mod might have.
                CommandArguments
                    table
                    Extra arguments that were given to the privilege command.

    Return value:
        None, the answer is given in the callback function in order to allow
        for the admin mod to perform e.g. a database lookup.
]]
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback,
targetSteam, extraInfoTbl)
    hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam,
        privilegeName, callback, targetSteam, extraInfoTbl)
end

--[[
CAMI.SignalUserGroupChanged
    Signify that your admin mod has changed the usergroup of a player. This
    function communicates to other admin mods what it thinks the usergroup
    of a player should be.

    Listen to the hook to receive the usergroup changes of other admin mods.

    Parameters:
        ply
            Player
            The player for which the usergroup is changed
        old
            string
            The previous usergroup of the player.
        new
            string
            The new usergroup of the player.
        source
            any
            Identifier for your own admin mod. Can be anything.
]]
function CAMI.SignalUserGroupChanged(ply, old, new, source)
    hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source)
end

--[[
CAMI.SignalSteamIDUserGroupChanged
    Signify that your admin mod has changed the usergroup of a disconnected
    player. This communicates to other admin mods what it thinks the usergroup
    of a player should be.

    Listen to the hook to receive the usergroup changes of other admin mods.

    Parameters:
        ply
            string
            The steam ID of the player for which the usergroup is changed
        old
            string
            The previous usergroup of the player.
        new
            string
            The new usergroup of the player.
        source
            any
            Identifier for your own admin mod. Can be anything.
]]
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source)
    hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source)
end

--PATH addons/gprofiler/lua/gprofiler/profilers/hooks/sh_hooks.lua:
GProfiler.Hooks = GProfiler.Hooks or {}
GProfiler.Hooks.IsDetoured = GProfiler.Hooks.IsDetoured or false
GProfiler.Hooks.ProfileData = GProfiler.Hooks.ProfileData or {}
GProfiler.Hooks.RestoreHookTable = GProfiler.Hooks.RestoreHookTable or {}

local SysTime = SysTime
local unpack = unpack
local debug = debug

function GProfiler.Hooks:DetourHooks(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) or GProfiler.Hooks.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " hook profile started!", 2)
	GProfiler.Hooks.ProfileData = {}
	GProfiler.Hooks.IsDetoured = true
	GProfiler.Hooks.AddHook = GProfiler.Hooks.AddHook or hook.Add

	local function profileHook(hookName, receiverName, receiverFunc, ...)
		if type(receiverName) ~= "string" or type(receiverFunc) ~= "function" then return end
		local dataIdent = string.format("%s_%s", hookName, receiverName)
		GProfiler.Hooks.ProfileData[dataIdent] = {
			h = hookName,
			r = receiverName,
			c = 0,
			t = 0,
			f = receiverFunc,
			extra = {...}
		}

		local Source = debug.getinfo(receiverFunc, "S")
		if Source and Source.short_src and Source.linedefined and Source.lastlinedefined then
			GProfiler.Hooks.ProfileData[dataIdent].Source = Source.short_src
			GProfiler.Hooks.ProfileData[dataIdent].Lines = { Source.linedefined, Source.lastlinedefined }
		end

		GProfiler.Hooks.AddHook(hookName, receiverName, function(...)
			local startTime = SysTime()
			local result = { receiverFunc(...) }
			local endTime = SysTime()
			local deltaTime = endTime - startTime

			GProfiler.Hooks.ProfileData[dataIdent].c = GProfiler.Hooks.ProfileData[dataIdent].c + 1
			GProfiler.Hooks.ProfileData[dataIdent].t = GProfiler.Hooks.ProfileData[dataIdent].t + deltaTime

			return unpack(result)
		end, ...)
	end

	for hookName, hookReceivers in pairs(hook.GetTable()) do
		for receiverName, receiverFunc in pairs(hookReceivers) do
			profileHook(hookName, receiverName, receiverFunc)
		end
	end

	hook.Add = function(hookName, receiverName, receiverFunc, ...)
		profileHook(hookName, receiverName, receiverFunc, ...)
	end
end

function GProfiler.Hooks:RestoreHooks(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) or not GProfiler.Hooks.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " hook profile stopped, sending data!", 2)
	GProfiler.Hooks.IsDetoured = false

	hook.Add = GProfiler.Hooks.AddHook

	for hookName, hookReceivers in pairs(hook.GetTable()) do
		for receiverName, receiverFunc in pairs(hookReceivers) do
			if type(receiverName) ~= "string" or type(receiverFunc) ~= "function" then continue end
			local data = GProfiler.Hooks.ProfileData[string.format("%s_%s", hookName, receiverName)]
			if data then
				-- 5802dd5f74bf8d5ef8c655d8e71178cd44203cbdb75e65f6b9995af1c503e5c2
				hook.Add(hookName, receiverName, data.f, unpack(data.extra or {}))
			end
		end
	end

	if SERVER then
		net.Start("GProfiler_Hooks_SendData")
		net.WriteUInt(table.Count(GProfiler.Hooks.ProfileData), 20)
		for k, v in pairs(GProfiler.Hooks.ProfileData) do
			net.WriteString(v.r)
			net.WriteString(v.h)
			net.WriteUInt(v.c, 32)
			net.WriteFloat(v.t)
			net.WriteString(v.Source or "")
			net.WriteUInt(v.Lines and v.Lines[1] or 0, 16)
			net.WriteUInt(v.Lines and v.Lines[2] or 0, 16)
		end
		net.Send(ply)
	end
end

if SERVER then
	util.AddNetworkString("GProfiler_Hooks_ToggleServerProfile")
	util.AddNetworkString("GProfiler_Hooks_ServerProfileStatus")
	util.AddNetworkString("GProfiler_Hooks_SendData")
	util.AddNetworkString("GProfiler_Hooks_HookTbl")
	util.AddNetworkString("GProfiler_Hooks_RemoveHook")

	net.Receive("GProfiler_Hooks_ToggleServerProfile", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		local startStop = net.ReadBool()
		if startStop then
			GProfiler.Hooks:DetourHooks(ply)
			net.Start("GProfiler_Hooks_ServerProfileStatus")
			net.WriteBool(true)
			net.WriteEntity(ply)
			net.Broadcast()
		else
			GProfiler.Hooks:RestoreHooks(ply)
			net.Start("GProfiler_Hooks_ServerProfileStatus")
			net.WriteBool(false)
			net.WriteEntity(ply)
			net.Broadcast()
		end
	end)

	net.Receive("GProfiler_Hooks_HookTbl", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		local hooks = hook.GetTable()
		net.Start("GProfiler_Hooks_HookTbl")
		net.WriteUInt(table.Count(hooks), 15)
		for hookName, hookReceivers in pairs(hooks) do
			net.WriteString(hookName)
			net.WriteUInt(table.Count(hookReceivers), 10)
		end
		net.Send(ply)
	end)

	net.Receive("GProfiler_Hooks_RemoveHook", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		local hookName = net.ReadString()
		local receiverName = net.ReadString()

		if not hookName or not receiverName then return end

		hook.Remove(hookName, receiverName)
	end)
end

--PATH addons/foodmode/lua/autorun/hfm_player.lua:
local meta = FindMetaTable("Player")

function meta:CanCookFood(luaname)
	local FTB = HFMGetTable(luaname)
	
	for k,v in pairs(FTB.Ingredients or {}) do
		if self:HFM_AmountItem(k) < v then
			 return false
		end
	end
	return true
end

function meta:HFM_AmountItem(luaname)
	return self:GetNW2Int(luaname)
end
--PATH addons/vehicles_lw_quad_bikes_309880608/lua/autorun/lwcars_suzukikingquad.lua:
local V = {
			Name = "Suzuki Kingquad", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable quad by LoneWolfie",
			Model = "models/LoneWolfie/suzuki_kingquad.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/suzuki_kingquad.txt"
							}
			}
list.Set("Vehicles", "suzuki_kingquad_lw", V)

--PATH addons/m9k/lua/autorun/m9k_small_arms_11_07_15.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/autorun/m9k_small_arms_11_07_15.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local icol = Color( 255, 255, 255, 255 ) 
if CLIENT then
	killicon.Add( "m9k_bizonp19", "vgui/hud/m9k_bizonp19", icol  )
	killicon.Add( "m9k_colt1911", "vgui/hud/m9k_colt1911", icol  )
	killicon.Add( "m9k_coltpython", "vgui/hud/m9k_coltpython", icol  )
	killicon.Add( "m9k_deagle", "vgui/hud/m9k_deagle", icol  )
	killicon.Add( "m9k_glock", "vgui/hud/m9k_glock", icol  )
	killicon.Add( "m9k_hk45", "vgui/hud/m9k_hk45", icol  )
	killicon.Add( "m9k_luger", "vgui/hud/m9k_luger", icol  )
	killicon.Add( "m9k_m29satan", "vgui/hud/m9k_m29satan", icol  )
	killicon.Add( "m9k_m92beretta", "vgui/hud/m9k_m92beretta", icol  )
	killicon.Add( "m9k_model3russian", "vgui/hud/m9k_model3russian", icol  )
	killicon.Add( "m9k_mp7", "vgui/hud/m9k_mp7", icol  )
	killicon.Add( "m9k_ragingbull", "vgui/hud/m9k_ragingbull", icol  )
	killicon.Add( "m9k_remington1858", "vgui/hud/m9k_remington1858", icol  )
	killicon.Add( "m9k_sig_p229r", "vgui/hud/m9k_sig_p229r", icol  )
	killicon.Add( "m9k_smgp90", "vgui/hud/m9k_smgp90", icol  )
	killicon.Add( "m9k_sten", "vgui/hud/m9k_sten", icol  )
	killicon.Add( "m9k_thompson", "vgui/hud/m9k_thompson", icol  )
	killicon.Add( "m9k_usp", "vgui/hud/m9k_usp", icol  )
	killicon.Add( "m9k_uzi", "vgui/hud/m9k_uzi", icol  )
	killicon.Add( "m9k_model500", "vgui/hud/m9k_model500", icol  )
	killicon.Add( "m9k_model627", "vgui/hud/m9k_model627", icol  )
	killicon.Add( "m9k_ump45", "vgui/hud/m9k_ump45", icol  )
	killicon.Add( "m9k_mp9", "vgui/hud/m9k_mp9", icol  )
	killicon.Add( "m9k_vector", "vgui/hud/m9k_vector", icol  )
	killicon.Add( "m9k_tec9", "vgui/hud/m9k_tec9", icol  )
	killicon.Add( "m9k_mp5", "vgui/hud/m9k_mp5", icol  )
	killicon.Add( "m9k_kac_pdw", "vgui/hud/m9k_kac_pdw", icol  )
	killicon.Add( "m9k_honeybadger", "vgui/hud/m9k_honeybadger", icol  )
	killicon.Add( "m9k_mp5sd", "vgui/hud/m9k_mp5sd", icol  )
	killicon.Add( "m9k_magpulpdr", "vgui/hud/m9k_magpulpdr", icol  )
	killicon.Add( "m9k_scoped_taurus", "vgui/hud/m9k_scoped_taurus", icol  )
	killicon.Add( "m9k_mp40", "vgui/hud/m9k_mp40", icol  )
	

end


//MP40
sound.Add({
	name = 			"mp40.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/mp40/mp5-1.wav"
})

sound.Add({
	name = 			"Weapon_mp40m9k.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp40/magout.mp3"
})

sound.Add({
	name = 			"Weapon_mp40m9k.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp40/magin.mp3"
})

sound.Add({
	name = 			"Weapon_mp40m9k.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp40/boltback.mp3"
})

//Magpul PDR
sound.Add({
	name = 			"MAG_PDR.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			{"weapons/pdr/pdr-1.wav",
						"weapons/pdr/pdr-2.wav",
						"weapons/pdr/pdr-3.wav"}
})

sound.Add({
	name = 			"Weapon_PDR.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pdr/pdr_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_PDR.Clipin2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pdr/pdr_clipin2.mp3"
})

sound.Add({
	name = 			"Weapon_PDR.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pdr/pdr_boltpull.mp3"
})

sound.Add({
	name = 			"Weapon_PDR.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pdr/pdr_boltrelease.mp3"
})

sound.Add({
	name = 			"Weapon_PDR.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pdr/pdr_clipout.mp3"
})

//KAC PDW
sound.Add({
	name = 			"KAC_PDW.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_unsil-1.wav"
})

sound.Add({
	name = 			"KAC_PDW.SilentSingle",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1-1.wav"
})

sound.Add({
	name = 			"kac_pdw_001.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_clipout.mp3"
})

sound.Add({
	name = 			"kac_pdw_001.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_clipin.mp3"
})

sound.Add({
	name = 			"kac_pdw_001.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_boltpull.mp3"
})

sound.Add({
	name = 			"kac_pdw_001.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_deploy.mp3"
})

sound.Add({
	name = 			"kac_pdw_001.Silencer_On",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_silencer_on.mp3"
})

sound.Add({
	name = 			"kac_pdw_001.Silencer_Off",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/kac_pdw/m4a1_silencer_off.mp3"
})

//MP5
sound.Add({
	name = 			"mp5_navy_Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/mp5-1.wav"
})

sound.Add({
	name = 			"mp5_foley",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/foley.mp3"
})

sound.Add({
	name = 			"mp5_magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/magout.mp3"
})

sound.Add({
	name = 			"mp5_magin1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/magin1.mp3"
})

sound.Add({
	name = 			"mp5_magin2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/magin2.mp3"
})

sound.Add({
	name = 			"mp5_boltback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/boltback.mp3"
})

sound.Add({
	name = 			"mp5_boltslap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/boltslap.mp3"
})

sound.Add({
	name = 			"mp5_cloth",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/cloth.mp3"
})

sound.Add({
	name = 			"mp5_safety",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/brightmp5/safety.mp3"
})

//tec9
sound.Add({
	name = 			"Weapon_Tec9.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/tec9/ump45-1.wav"
})

sound.Add({
	name = 			"Weapon_Tec9.Magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tec9/tec9_magin.mp3"
})

sound.Add({
	name = 			"Weapon_Tec9.Magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tec9/tec9_magout.mp3"
})

sound.Add({
	name = 			"Weapon_Tec9.NewMag",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tec9/tec9_newmag.mp3"
})

sound.Add({
	name = 			"Weapon_Tec9.Charge",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tec9/tec9_charge.mp3"
})

//Kriss
sound.Add({
	name = 			"kriss_vector.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/Kriss/ump45-1.wav"
})

sound.Add({
	name = 			"kriss_vector.Magrelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/Kriss/magrel.mp3"
})

sound.Add({
	name = 			"kriss_vector.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/Kriss/clipout.mp3"
})

sound.Add({
	name = 			"kriss_vector.Dropclip",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/Kriss/dropclip.mp3"
})

sound.Add({
	name = 			"kriss_vector.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/Kriss/clipin.mp3"
})


sound.Add({
	name = 			"kriss_vector.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/Kriss/boltpull.mp3"
})

sound.Add({
	name = 			"kriss_vector.unfold",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/Kriss/unfold.mp3"
})

//MP9
sound.Add({
	name = 			"Weapon_mp9.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/mp9/tmp-1.wav"
})

sound.Add({
	name = 			"Weapon_mp9.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp9/tmp_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_mp9.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp9/tmp_clipout.mp3"
})

//ump45 
sound.Add({
	name = 			"m9k_hk_ump45.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45-1.wav"
})

sound.Add({
	name = 			"m9k_hk_ump45.Clipout1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45_clipout1.mp3"
})

sound.Add({
	name = 			"m9k_hk_ump45.Clipout2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45_clipout2.mp3"
})

sound.Add({
	name = 			"m9k_hk_ump45.Clipin1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45_clipin1.mp3"
})

sound.Add({
	name = 			"m9k_hk_ump45.Clipin2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45_clipin2.mp3"
})

sound.Add({
	name = 			"m9k_hk_ump45.Boltslap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45_boltslap.mp3"
})

sound.Add({
	name = 			"m9k_hk_ump45.Cloth",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hk_ump45/ump45_cloth.mp3"
})


//p19 Bizon
sound.Add({
	name = 			"Weapon_P19.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/p19/p90-1.wav"
})

sound.Add({
	name = 			"Weapon_P19.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p19/p90_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_P19.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p19/p90_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_P19.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p19/p90_boltpull.mp3"
})

//p90
sound.Add({
	name = 			"P90_weapon.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/p90_smg/p90-1.wav"
})

sound.Add({
	name = 			"P90_weapon.unlock",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p90_smg/p90_unlock.mp3"
})

sound.Add({
	name = 			"P90_weapon.magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p90_smg/p90_magout.mp3"
})

sound.Add({
	name = 			"P90_weapon.magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p90_smg/p90_magin.mp3"
})

sound.Add({
	name = 			"P90_weapon.cock",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/p90_smg/p90_cock.mp3"
})

//sten
sound.Add({
	name = 			"Weaponsten.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/sten/mp5-1.wav"
	
})

sound.Add({
	name = 			"Weaponsten.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/sten/mp5_clipout.mp3"
	
})

sound.Add({
	name = 			"Weaponsten.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/sten/mp5_clipin.mp3"
	
})

sound.Add({
	name = 			"Weaponsten.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/sten/mp5_boltpull.mp3"	
})

sound.Add({
	name = 			"Weaponsten.boltslap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/sten/mp5_boltslap.mp3"
	
})

sound.Add({
	name = 			"Weapon_stengun.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/sten/mp5_slideback.mp3"
	
})

//tommy gun
sound.Add({
	name = 			"Weapon_tmg.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/tmg/tmg_1.wav"
})

sound.Add({
	name = 			"Weapon_tmg.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tmg/tmg_magout.mp3"
})

sound.Add({
	name = 			"Weapon_tmg.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tmg/tmg_magin.mp3"
})

sound.Add({
	name = 			"Weapon_tmg.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tmg/tmg_cock.mp3"
})

//MP7
sound.Add({
	name =			"Weapon_MP7.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound =				"weapons/mp7/usp1.wav"
})

sound.Add({
	name =			"Weapon_MP7.magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp7/mp7_magout.mp3"
})

sound.Add({
	name =			"Weapon_MP7.magin" ,
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp7/mp7_magin.mp3"
})

sound.Add({
	name =			"Weapon_MP7.charger" ,
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/mp7/mp7_charger.mp3"
})

//uzi
sound.Add({
	name = 			"Weapon_uzi.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/uzi/mac10-1.wav"
})

sound.Add({
	name = 			"imi_uzi_09mm.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/uzi/mac10_boltpull.mp3"
})

sound.Add({
	name = 			"imi_uzi_09mm.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/uzi/mac10_clipin.mp3"
})

sound.Add({
	name = 			"imi_uzi_09mm.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/uzi/mac10_clipout.mp3"
})

//MP5SD
sound.Add({
	name = 			"Weapon_hkmp5sd.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/mp5-1.wav"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/magout.mp3"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.magfiddle",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/magfiddle.mp3"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/magin.mp3"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/boltpull.mp3"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/boltrelease.mp3"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.cloth",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/cloth.mp3"
})

sound.Add({
	name = 			"Weapon_hkmp5sd.safety",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hkmp5sd/safety.mp3"
})

//Honey Badger
sound.Add({
	name = 			"Weapon_HoneyB.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/hb/hb_fire.wav"
})

sound.Add({
	name = 			"Weapon_HoneyB.Magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hb/magout.mp3"
})

sound.Add({
	name = 			"Weapon_HoneyB.Magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hb/magin.mp3"
})

sound.Add({
	name = 			"Weapon_HoneyB.Boltcatch",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hb/boltcatch.mp3"
})

sound.Add({
	name = 			"Weapon_HoneyB.Boltforward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hb/boltforward.mp3"
})

sound.Add({
	name = 			"Weapon_HoneyB.Boltback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hb/boltback.mp3"
})

//colt python
sound.Add({
	name = 			"Weapon_ColtPython.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/coltpython/python-1.wav"
})

sound.Add({
	name = 			"WepColtPython.clipdraw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/coltpython/clipdraw.mp3"
})

sound.Add({
	name = 			"WepColtPython.blick",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/coltpython/blick.mp3"
})

sound.Add({
	name = 			"WepColtPython.bulletsout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/coltpython/bulletsout.mp3"
})

sound.Add({
	name = 			"WepColtPython.bulletsin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/coltpython/bulletsin.mp3"
})

//Raging Bull
sound.Add({
	name = 			"weapon_r_bull.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/r_bull/r-bull-1.wav"
})

sound.Add({
	name = 			"weapons_r_bull_bullreload_wav",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/r_bull/bullreload.mp3"
})

sound.Add({
	name = 			"weapons_r_bull_draw_gun_wav",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/r_bull/draw_gun.mp3"
})

//smith and wesson model 3
sound.Add({
	name = 			"Model3.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/model3/model3-1.wav" 
})

sound.Add({
	name = 			"Model3.Hammer",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/Hammer.mp3" 
})

sound.Add({
	name = 			"Model3.Break_Eject",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/Break_eject.mp3" 
})

sound.Add({
	name = 			"Model3.bulletout_1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/bulletout_1.mp3"
})

sound.Add({
	name = 			"Model3.bulletout_2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/bulletout_2.mp3"
})

sound.Add({
	name = 			"Model3.bulletout_3",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/bulletout_3.mp3"
})

sound.Add({
	name = 			"Model3.bullets_in",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/bullets_in.mp3"
})

sound.Add({
	name = 			"Model3.Break_close",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model3/Break_CLose.mp3"	
})

//m29 satan
sound.Add({
	name = 			"Weapon_satan1.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/satan1/satan-1.wav"
})

sound.Add({
	name = 			"Weapon_satan1.blick",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/satan1/blick.mp3"
})

sound.Add({
	name = 			"Weapon_satan1.unfold",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/satan1/unfold.mp3"
})

sound.Add({
	name = 			"Weapon_satan1.bulletsin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/satan1/bulletsin.mp3"
})

sound.Add({
	name = 			"Weapon_satan1.bulletsout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/satan1/bulletsout.mp3"
})

//Remington 1858
sound.Add({
	name = 			"Remington.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/remington/remington-1.wav" 
})

sound.Add({
	name = 			"Remington.cylinderhit",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/remington/cylinderhit.mp3" 
})

sound.Add({
	name = 			"Remington.cylinderswap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/remington/cylinderswap.mp3" 
})

sound.Add({
	name = 			"Remington.bounce1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/remington/bounce1.mp3" 
})

sound.Add({
	name = 			"Remington.bounce1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/remington/bounce2.mp3" 
})

sound.Add({
	name = 			"Remington.bounce1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/remington/bounce3.mp3" 
})

sound.Add({
	name = 			"Remington.Hammer",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/remington/hammer.mp3" 
})

//BERETTAM92
sound.Add({
	name = 			"Weapon_m92b.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			")weapons/beretta92/berettam92-1.wav"
})

sound.Add({
	name = 			"Weapon_beretta92.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/beretta92/berettam92_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_beretta92.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/beretta92/berettam92_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_beretta92.Sliderelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/beretta92/berettam92_sliderelease.mp3"
})

sound.Add({
	name = 			"Weapon_beretta92.Slidepull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/beretta92/berettam92_slidepull.mp3"
})

sound.Add({
	name = 			"Weapon_beretta92.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/beretta92/berettam92_slideback.mp3"
})

//hk45c
sound.Add({
	name = 			"Weapon_hk45.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/hk45/hk45-1.wav"
})

sound.Add({
	name = 			"HK45C.Deploy",
	channel =		CHAN_ITEM,
	volume =		1,	
	sound =			"weapons/hk45/draw.mp3"
})

sound.Add({
	name = 			"HK45C.Magout",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/hk45/magout.mp3"
})

sound.Add({
	name = 			"HK45C.Magin",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/hk45/magin.mp3"
})

sound.Add({
	name = 			"HK45C.Release",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/hk45/sliderelease.mp3"
})

sound.Add({
	name = 			"HK45C.Slidepull",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/hk45/slidepull.mp3"
})

//usp
sound.Add({
	name = 			"Weapon_fokkususp.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_usp/fiveseven-1.wav" 
})

sound.Add({
	name = 			"Weapon_fokkususp.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_usp/fiveseven_clipout.mp3" 
})

sound.Add({
	name = 			"Weapon_fokkususp.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_usp/fiveseven_clipin.mp3" 
})

sound.Add({
	name = 			"Weapon_fokkususp.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_usp/fiveseven_slideback.mp3" 
})

sound.Add({
	name = 			"Weapon_fokkususp.Slidepull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_usp/fiveseven_slidepull.mp3" 
})

// Sig P228
sound.Add({
	name = 			"Sauer1_P228.Single",
	channel =		CHAN_USER_BASE+10,
	volume =		1,
	sound =			"weapons/sig_p228/p228-1.wav"
})

sound.Add({
	name = 			"Sauer1_P228.Magout",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/magout.mp3" 
})

sound.Add({
	name = 			"Sauer1_P228.Magin",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/magin.mp3" 
})

sound.Add({
	name = 			"Sauer1_P228.MagShove",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/magshove.mp3" 
})

sound.Add({
	name = 			"Sauer1_P228.Sliderelease",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/sliderelease.mp3"
})

sound.Add({
	name = 			"Sauer1_P228.Cloth",
	channel =		CHAN_ITEM,
	volume =		.5,
	sound =			"weapons/sig_p228/cloth.mp3"
})

sound.Add({
	name = 			"Sauer1_P228.Shift",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/shift.mp3"
})

//glock 18
sound.Add({
	name = 			"Dmgfok_glock.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/dmg_glock/mac10-1.wav" 
})

sound.Add({
	name = 			"Dmgfok_glock.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_glock/magout.mp3" 
})

sound.Add({
	name = 			"Dmgfok_glock.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_glock/magin.mp3" 
})

sound.Add({
	name = 			"Dmgfok_glock.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_glock/boltpull.mp3" 
})

sound.Add({
	name = 			"Dmgfok_glock.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_glock/boltrelease.mp3" 
})

sound.Add({
	name = 			"Dmgfok_glock.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_glock/mac10_deploy.mp3" 
})

//colt 1911
sound.Add({
	name = 			"Dmgfok_co1911.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/dmg_colt1911/deagle-1.wav"
})

sound.Add({
	name = 			"Dmgfok_co1911.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_colt1911/draw.mp3"
})

sound.Add({
	name = 			"Dmgfok_co1911.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_colt1911/de_clipin.mp3"
})

sound.Add({
	name = 			"Dmgfok_co1911.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_colt1911/de_slideback.mp3"
})

sound.Add({
	name = 			"Dmgfok_co1911.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_colt1911/draw.mp3"
})

//luger
sound.Add({
	name = 			"Weapon_luger.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/luger/luger-1.wav"
})

sound.Add({
	name = 			"Weapon_luger.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/luger/luger_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_luger.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/luger/luger_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_luger.Sliderelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/luger/luger_sliderelease.mp3"
})

//desert eagle
sound.Add({
	name = 			"Weapon_TDegle.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_deagle/deagle-1.wav" 
})

sound.Add({
	name = 			"Weapon_TDegle.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_deagle/de_clipout.mp3" 
})

sound.Add({
	name = 			"Weapon_TDegle.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_deagle/de_clipin.mp3" 
})

sound.Add({
	name = 			"Weapon_TDegle.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_deagle/de_slideback.mp3" 
})

sound.Add({
	name = 			"Weapon_TDegle.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_deagle/de_deploy.mp3" 
})

// Sig P229R
sound.Add({
	name = 			"Sauer1_P228.Single",
	channel =		CHAN_USER_BASE+10,
	volume =		1,
	sound =			"weapons/sig_p228/p228-1.wav"
})

sound.Add({
	name = 			"Sauer1_P228.Magout",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/magout.mp3" 
})

sound.Add({
	name = 			"Sauer1_P228.Magin",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/magin.mp3" 
})

sound.Add({
	name = 			"Sauer1_P228.MagShove",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/magshove.mp3" 
})

sound.Add({
	name = 			"Sauer1_P228.Sliderelease",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/sliderelease.mp3"
})

sound.Add({
	name = 			"Sauer1_P228.Cloth",
	channel =		CHAN_ITEM,
	volume =		.5,
	sound =			"weapons/sig_p228/cloth.mp3"
})

sound.Add({
	name = 			"Sauer1_P228.Shift",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/sig_p228/shift.mp3"
})

//Model 500
sound.Add({
	name = 			"Model_500.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound =			"weapons/model500/deagle-1.wav"		
})

sound.Add({
	name = 			"saw_model_500.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model500/de_clipin.mp3"	
})

sound.Add({
	name = 			"saw_model_500.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model500/de_clipout.mp3"	
})

sound.Add({
	name = 			"saw_model_500.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model500/de_deploy.mp3"	
})

sound.Add({
	name = 			"saw_model_500.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/model500/de_slideback.mp3"	
})

//S&W 627
sound.Add({
	name = 			"model_627perf.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/627/deagle-1.wav"
})

sound.Add({
	name = 			"model_627perf.wheel_in",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/627/wheel_in.mp3"
})

sound.Add({
	name = 			"model_627perf.bullets_in",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/627/bullets_in.mp3"
})

sound.Add({
	name = 			"model_627perf.bulletout_3",
	channel = 		CHAN_USER_BASE+11,
	volume = 		1.0,
	sound = 			"weapons/627/bulletout_3.mp3"
})

sound.Add({
	name = 			"model_627perf.bulletout_2",
	channel = 		CHAN_USER_BASE+12,
	volume = 		1.0,
	sound = 			"weapons/627/bulletout_2.mp3"
})

sound.Add({
	name = 			"model_627perf.bulletout_1",
	channel = 		CHAN_USER_BASE+13,
	volume = 		1.0,
	sound = 			"weapons/627/bulletout_1.mp3"
})

sound.Add({
	name = 			"model_627perf.wheel_out",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/627/wheel_out.mp3"
})

//usc
sound.Add({
	name = 			"Weapon_hkusc.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			{"weapons/usc/ump45-1.wav",
						"weapons/usc/ump45-2.wav"}
})

sound.Add({
	name = 			"Weapon_hkusc.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/usc/ump45_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_hkusc.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/usc/ump45_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_hkusc.Boltslap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/usc/ump45_boltslap.mp3"
})


small_autorun_mounted = true
--PATH addons/mlib/lua/autorun/mlib.lua:
--[[
	mLib (M4D Library Core)
	Created by M4D | http://m4d.one/ | http://steamcommunity.com/id/m4dhead |
	Copyright © 2021 M4D.one All Rights Reserved
	All 3rd party content is public domain or used with permission
	M4D.one is the copyright holder of all code below. Do not distribute in any circumstances.
--]]

--[[ 
	You do not need to edit anything in this addon (mLib).
	All files and configurations can be found the addon's folder that you have downloaded.
]]

mLib = mLib or {}
mLib.version = 2
mLib.Local = true
mLib.Hosts = {
	"https://api.m4dsolutions.com/mlib/",
	"https://std-ca-que-1.api.m4dsolutions.com/mlib/",
	"https://prx-api.m4dsolutions.com/mlib/",
	"https://prx2-api.m4dsolutions.com/mlib/",
}
mLib.Addons = {}
mLib.Lang = {
	a = "Registered mLib addons found: ",
	b = "No valid mLib addons found",
	c = "Unknown routing table found, error: ",
	d = "Unable to verify server destination.",
	e = "Unable to verify a secure connection, request denied.",
	f = "Connection to mLib service successful.",
	g = "mLib was unsuccessful contacting the API server, retrying route ",
	h = "mLib has failed to contact the API server, please make sure your addons are up to date, otherwise contact the developer of the addon.",
	i = "Service configuration queued, a player is required to start the process.",
	j = "Service configuration has started.",
	k = "Received code from server."
}

function mLib.Print(str) MsgC(Color(255,100,0), "[mLib] ", color_white, tostring(str) .. "\n") end
mLib.Print("Service starting now, auto-updater version: " .. mLib.version)
if CLIENT then include("mlib/core/client.lua") else AddCSLuaFile("mlib/core/client.lua") include("mlib/core/server.lua") end
--PATH addons/pm_cp_mix_models/lua/autorun/mw2_playermodels.lua:
player_manager.AddValidModel( "mw2_skin09_01", "models/mw2/skin_09/MW2_Soldier_01.mdl" ) list.Set( "PlayerOptionsModel", "mw2_skin09_01", "models/mw2/skin_09/MW2_Soldier_01.mdl" )
player_manager.AddValidModel( "mw2_skin09_02", "models/mw2/skin_09/MW2_Soldier_02.mdl" ) list.Set( "PlayerOptionsModel", "mw2_skin09_02", "models/mw2/skin_09/MW2_Soldier_02.mdl" )
player_manager.AddValidModel( "mw2_skin09_06", "models/mw2/skin_09/MW2_Soldier_06.mdl" ) list.Set( "PlayerOptionsModel", "mw2_skin09_06", "models/mw2/skin_09/MW2_Soldier_06.mdl" )

--PATH addons/radial_menu/lua/autorun/nexus_load.lua:
Nexus = {}

hook.Run("Nexus.PreLoaded")

if (CLIENT) then
	include("nexus_framework/core/load.lua")
elseif (SERVER) then
	include("nexus_framework/core/load.lua")
	AddCSLuaFile("nexus_framework/core/load.lua")
end

local loader = Nexus:Loader()
loader:SetName("Framework")
loader:SetColor(Color(208, 53, 53))
loader:SetAcronym("Framework")
loader:RegisterAcronym()
loader:SetLoadDirectory("nexus_framework")
loader:Load("core", "SHARED", true, {
	["load.lua"] = true
})
loader:Load("database", "SERVER", true)
loader:Load("vgui", "CLIENT")
loader:Load("vgui/modules", "CLIENT", true)
loader:Load("vgui/components", "CLIENT", true)
loader:Register()

hook.Run("Nexus.PostLoaded")
--PATH addons/ogyzok_pm_2831900714/lua/autorun/oguzok_addpm.lua:
player_manager.AddValidModel( "Oguzok", "models/player/oguzok.mdl" )
--PATH addons/radial_menu/lua/radia_menu/vgui/circle_menu.lua:
local mat8 = Material('rm/icon_mouseone.png','noclamp smooth')

PIS.PingCache = {}
function PIS:GetPingIcon(mat)
	if not PIS.PingCache[mat] then 
		PIS.PingCache[mat] = Material("radial/"..mat..".png","smooth")
	end
	return PIS.PingCache[mat]
end

local framework = Nexus:ClassManager("Framework")
local _draw = framework:Class("Draw")
local panels = framework:Class("Panels")

local PANEL = {}

local rightClick = Material("radial/rmb.png","smooth")
local leftClick = Material("radial/lmb.png","smooth")

local soundHover = Sound("ping_system/hover2.wav")
local soundSelect = Sound("ping_system/accept2.wav")

local sin = math.sin 
local cos = math.cos 
local mrad = math.rad 
local abs = math.abs

	radial = radial or {}
	radial.hud = radial.hud or {}
	
	local function ss(px) return ScreenScale(px)/3 end 

	function radial.hud:CreateFont(name,size,font,weight,scale)
		scale = scale or false 
		if scale then size = ss(size) end

		surface.CreateFont("infl.hud."..name,{font = font, size = size, weight = weight, extended = true})
		surface.CreateFont("infl.hud."..name.."_blur",{font = font, size = size, weight = weight, extended = true, blursize = 1})
	end

	function radial.hud:GetFont(name) return "infl.hud."..name,"infl.hud."..name.."_blur" end

	function radial.hud:DrawText(text,font,x,y,col,xa,ya)
		local font_def,font_blur = radial.hud:GetFont(font)
		xa = xa or 0
		ya = ya or 0

		draw.SimpleText(text,font_blur,x+1,y+1,ColorAlpha(color_black,col.a),xa,ya)
		return draw.SimpleText(text,font_def,x,y,col,xa,ya)
	end

	function radial.LerpColor(t,col1,col2)
		col2 = Color(255,255,255)
		return Color    (
						Lerp(t,col1.r,col2.r),
						Lerp(t,col1.g,col2.g),
						Lerp(t,col1.b,col2.b),
						Lerp(t,col1.a,col2.a)
						)
	end

function PANEL:SetContents(name)

	self.SectionsTbl = {}
	self.ContentType = name 

	for i, v in pairs(self.SectionsTbl) do
		if (!ispanel(v)) then continue end

		v:Remove()
	end

	if name == "pings" then
		for i, v in ipairs(tblRadial.Panels) do
			if isfunction(v.Filter) and not v.Filter(LocalPlayer()) then continue end
			self:AddSection(v.name, v.MenuIcon, v.Filter, v.Action, v)
		end
	elseif name == "commands" and istable(self.DisplayCommand) then
		local ping = self.DisplayCommand
		for k,t in pairs(ping) do if t.customcheck and not t.customcheck(LocalPlayer()) then continue end self:AddSection(t.name, t.mat, settings.WheelMonochrome != 1 and PIS.Config.WheelColors[settings.WheelMonochrome][2] or t.col, t.func, t.name) end
	end

	self.Sections = #self.SectionsTbl
end

function PANEL:PerformLayout(w, h)
	local sectionSize = 360 / self.Sections
	local rad = self.Radius * 0.4
	for i, v in ipairs(self.SectionsTbl) do
		if (!ispanel(v)) then continue end

		local ang = (i - 1) * sectionSize
		ang = mrad(ang)
		local size = self.Sections > 12 and self.Radius * 2 / self.Sections or (56 * 1)
		if (self.selectedArea and self.selectedArea + 1 == i) then
			size = size * 1.285
		end
		local r = self.Radius - rad / 2
		local sin = sin(ang) * r
		local cos = cos(ang) * r
		local x = self.Center.X - size / 2 + sin
		local y = self.Center.Y - size / 2 - cos
		
		v:SetSize(size, size)
		v:SetPos(x, y)
	end
end
local HoverPlayer
function PANEL:Init()
	PIS.RadialMenu = self

	surface.CreateFont("Nexus.PingSystem.Ping", {
		font = "Roboto",
		size = math.Round(46 * 1),
		weight = 600
	})

	surface.CreateFont("Nexus.PingSystem.Name", {
		font = "Roboto",
		size = math.Round(30 * 1),
		weight = 600
	})

	surface.CreateFont("Nexus.PingSystem.Info", {
		font = "Roboto",
		size = math.Round(26 * 1)
	})
	self.Radius = 325 * 1

	self.Center = {
		X = ScrW() / 2,
		Y = ScrH() / 2
	}

	self.SectionsTbl = {}

	self:SetContents("pings")

	self.CircleColor = Color(0, 0, 0, 0)
	self:SetAlpha(0)
	self:AlphaTo(255, 0.2)

	self.selectable = true

	self:MakePopup()
	self:SetKeyboardInputEnabled(false)

	self.InnerArcColor = color_white
	self.OuterArcColor = color_white

	local rad = self.Radius * 0.4

	self.MainCircle = _draw:Call("PrecacheCircle",self.Center.X, self.Center.Y, self.Radius,360,90,Color(255, 0, 0, 150))
	self.MainArc = _draw:Call("PrecacheArc",self.Center.X, self.Center.Y, self.Radius,rad, 0, 360, 1)
	self.MainArc2 = _draw:Call("PrecacheArc",self.Center.X, self.Center.Y, self.Radius - rad, 3, 0, 360, 1)
end

function PANEL:Select(id)
	if (self.FadingOut) then return end

	surface.PlaySound(soundSelect)
	local tbl = self.SectionsTbl[id + 1]
	if isfunction(tbl.command) then tbl.command(HoverPlayer) self:Remove() return end
end


function PANEL:AddSection(name, mat, filter, command, id)
	table.insert(self.SectionsTbl, {
		name = name,
		mat = mat,
		filter = filter,
		command = command,
		id = id
	})
end

function PANEL:Think()
	local tr = LocalPlayer():GetEyeTrace()
	local distance = LocalPlayer():GetPos():Distance(tr.HitPos)
	if not tr.Entity and not tr.Entity:IsValid() and not tr.Entity:IsPlayer() or distance >= 100 then
		self:Close()
	end
	if input.IsKeyDown(KEY_ESCAPE) then
		self:Remove()
	end
	commandKeyDown = input.IsMouseDown(MOUSE_RIGHT)
	if commandKeyDown and self.selectable and self.ContentType == "commands" then 
		self:SetContents("pings")
		self.Command = function() end
		self.selectedTbl = self.SectionsTbl[self.selectedArea+1]
		self.DisplayCommand = nil
		surface.PlaySound(soundHover)
		timer.Simple(.1,function() 
			if ValidPanel(self) then 
				self.selectable = true 
			end 
		end)
	end

	if not input.IsMouseDown(MOUSE_LEFT) then return end
	if self.selectedArea and self.HasMovedSlightly and self.selectable then
		self:Select(self.selectedArea)
		return
	end
end


function PANEL:Close()
	if (self.FadingOut) then return end

	self.FadingOut = true
	self:AlphaTo(0, 0.2, nil, function()
		self:Remove()
	end)
end

function draw.Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function PANEL:Paint(w, h)
	local rad = self.Radius * 0.4

	surface.SetDrawColor( 0, 0, 0, 145)
	draw.NoTexture()
	draw.Circle( self.Center.X, self.Center.Y, self.Radius, rad)

	_draw:Call("Arc", self.Center.X, self.Center.Y, self.Radius, rad, 0, 360, 1, Color(0, 0, 0, 145))

	local cursorAng = 180 - (
		math.deg(
			math.atan2(
				gui.MouseX() - self.Center.X, 
				gui.MouseY() - self.Center.Y
			)
		)
	)
	_draw:Call("Circle", self.Center.X, self.Center.Y, self.Radius - rad, 90, Color(0,0,0,220))

	if (self.HasMovedSlightly) then
		local sectionSize = 360 / self.Sections
		
		local selectedArea = abs(cursorAng + sectionSize / 2) / sectionSize
		selectedArea = math.floor(selectedArea)
		if (selectedArea >= self.Sections) then
			selectedArea = 0
		end

		if (self.selectedArea != selectedArea) then
			if (#self.SectionsTbl > 0) then
				surface.PlaySound(soundHover)
			end

			self.selectedTbl = self.SectionsTbl[selectedArea + 1]

			self:InvalidateLayout()
		end

		self.InnerArcColor = radial.LerpColor(FrameTime()*10,self.InnerArcColor,self.selectedTbl.col)
		self.OuterArcColor = self.selectedTbl.col
	
		self.selectedArea = selectedArea
		local selectedAng = selectedArea * sectionSize
		local outerArcScale = math.Round(4 * 1)
		_draw:Call("Arc", self.Center.X, self.Center.Y, self.Radius + outerArcScale, outerArcScale, 90 - selectedAng - sectionSize / 2, 90 - selectedAng + sectionSize / 2, 1, Color(1,116,222))
		_draw:Call("Arc", self.Center.X, self.Center.Y, self.Radius, rad, 90 - selectedAng - sectionSize / 2, 90 - selectedAng + sectionSize / 2, 1, Color(0, 0, 0, 180))

		local innerArcScale = math.Round(6 * 1)
		_draw:Call("Arc", self.Center.X, self.Center.Y, self.Radius - rad + innerArcScale * 2, innerArcScale, -cursorAng - 21 + 90 - 0, -cursorAng + 90 + 21, 1, Color(1,116,222))

		if (self.selectedTbl) then
			radial.hud:DrawText(self.selectedTbl.name, "notify", w / 2, h / 2 - 24, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

			local str = istable(self.selectedTbl.command) and "Открыть меню" or "Выбрать"
			surface.SetFont("Nexus.PingSystem.Info")
			local tw, th = surface.GetTextSize(str)
			local iconSize = th
			local x = w / 2 - iconSize / 2 - tw / 2 - 4
			local y = h / 2 + 20 + th / 2

			surface.SetDrawColor(color_white)
			surface.SetMaterial(mat8)
			surface.DrawTexturedRect(x, y, iconSize, iconSize)

			radial.hud:DrawText(str, "icon", x + iconSize + 8, y + 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

			if self.ContentType == "commands" then 
				local str = "Назад"
				surface.SetFont("Nexus.PingSystem.Info")
				local tw, th = surface.GetTextSize(str)

				local iconSize = th
				local x = w / 2 - iconSize / 2 - tw / 2 - 4
				local y = h / 2 + (56 * 1) + th / 2
				surface.SetDrawColor(color_white)
				surface.SetMaterial(rightClick)
				surface.DrawTexturedRect(x, y, weight(15), height(20))
				radial.hud:DrawText(str,"icon",x + iconSize + 8, y, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			end
		end
	else
		local xDist = abs(self.Center.X - gui.MouseX())
		local yDist = abs(self.Center.Y - gui.MouseY())
		local dist = math.sqrt(xDist ^ 2 + yDist ^ 2)
		if (dist > 20) then
			self.HasMovedSlightly = true
			self:Anim():Call("AnimateColor", self, "CircleColor", Color(0, 0, 0, 200))
		end
	end

	local sectionSize = 360 / self.Sections
	for i, v in ipairs(self.SectionsTbl) do
		if (ispanel(v)) then continue end

		local ang = (i - 1) * sectionSize
		ang = mrad(ang)
		local size = (56 * 1)
		if (self.selectedArea and self.selectedArea + 1 == i) then
			size = (72 * 1)
		end
		local r = self.Radius - rad / 2
		local sin = sin(ang) * r
		local cos = cos(ang) * r
		local x = self.Center.X - size / 2 + sin
		local y = self.Center.Y - size / 2 - cos
		surface.SetMaterial(v.mat)
		surface.SetDrawColor(v.col or color_white)
		surface.DrawTexturedRect(x, y, size, size)
	end
end

vgui.Register("PIS.Radial", PANEL)

function PIS:OpenRadialMenu()
	local frame = panels:Call("Create", "PIS.Radial")
	frame:SetSize(ScrW(), ScrH())
	frame:SetPos(0, 0)
end

hook.Add( "PlayerButtonDown", "PlayerButtonDownWikiExample2", function( ply, button )
	if button != KEY_G then return end
	if ply:isArrested() then return end
	if ply.sBanned then return end
	
	if CLIENT and not IsFirstTimePredicted() then
		return
	end
	local tr = ply:GetEyeTrace()
	local distance = ply:GetPos():Distance(tr.HitPos)
	if tr.Entity and tr.Entity:IsValid() and tr.Entity:IsPlayer() and distance <= 100 then
		if not ValidPanel(PIS.RadialMenu) then
			PIS:OpenRadialMenu()
			HoverPlayer = tr.Entity
		else
			PIS.RadialMenu:Close()
		end
	else
		if ValidPanel(PIS.RadialMenu) then
			PIS.RadialMenu:Close()
		end
	end
end)

radial.hud:CreateFont("icon",26,"Roboto",400)
radial.hud:CreateFont("base",36,"Consolas",700)
radial.hud:CreateFont("small",20,"Roboto",700)
radial.hud:CreateFont("notify",26,"Roboto",700)
radial.hud:CreateFont("safezone",40,"Roboto",700)
radial.hud:CreateFont("safezone_small",30,"Roboto",500)
radial.hud:CreateFont("entitydisplay",170,"Roboto",1600)
radial.hud:CreateFont("wsel",24,"Roboto",600)
radial.hud:CreateFont("wsel-small",19,"Roboto",500)
radial.hud:CreateFont("ban",52,"Consolas",800)

--PATH addons/rptip/lua/autorun/rp_box.lua:
rp_box = {}


rp_box.NPC_name = "Кладовщик" -- Имя NPC
rp_box.NPC_model = "models/Eli.mdl" -- Модель NPC

rp_box.MoneyForBox = 500  -- Награда за коробку (для рандомной награды пишем math.random(min,max))

if SERVER then
	util.AddNetworkString( "PlayerDisplayChat" )
	local PLAYER = FindMetaTable( "Player" )
	if PLAYER then
	    function PLAYER:SendMessageFD( ... )
	         local args = { ... }
	         net.Start( "PlayerDisplayChat" )
	             net.WriteTable( args )
	         net.Send( self )
	    end
	end
end

if CLIENT then
	net.Receive( "PlayerDisplayChat", function()
	    local args = net.ReadTable()
	    chat.AddText( unpack( args ) )
	end )
end
--PATH addons/_adminmodules_menu/lua/autorun/sam.lua:
if SAM_LOADED then return end

local version = tonumber("143") or 143

sam = {}
sam.config = {}
sam.language = {}
sam.player = {}
sam.ranks = {}
sam.permissions = {}
sam.author = "Srlion"
sam.version = version

function sam.print(...)
	MsgC(
		Color(236, 240, 241), "(",
		Color(244, 67, 54), "SAM",
		Color(236, 240, 241), ") ",
		Color(236, 240, 241), ...
	) Msg("\n")
end

local FAILED = false
do
	local types = {
		sv_ = SERVER and include or function() end,
		cl_ = SERVER and AddCSLuaFile or include,
		sh_ = function(name)
			if SERVER then
				AddCSLuaFile(name)
			end
			return include(name)
		end
	}

	sam.load_file = function(name, type)
		if FAILED then return end

		if type and not type:EndsWith("_") then
			type = type .. "_"
		end

		local func = types[type] or types[name:GetFileFromFilename():sub(1, 3)] or types["sh_"]
		if func then
			local rets = {func(name)}
			if rets[1] == false then
				FAILED = true
				sam.print("Failed to load!")
			end
			return unpack(rets)
		end
	end
end
local load_file = sam.load_file

sam.print("Loading...")

load_file("sam/libs/sh_types.lua")
load_file("sam/libs/sv_init.lua")
load_file("sam/menu/cl_menu.lua")
load_file("sam/menu/sh_init.lua")
load_file("sam/menu/cl_init.lua")

SAM_LOADED = true
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_property_sheet.lua:
local draw = draw
local surface = surface
local vgui = vgui

local TYPE_MATERIAL = TYPE_MATERIAL

local RealFrameTime = RealFrameTime
local IsValid = IsValid
local Lerp = Lerp
local pairs = pairs
local TypeID = TypeID

local TDLib_Classes = sui.TDLib.LibClasses
local TextColor = TDLib_Classes.TextColor
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local PROPERTY_SHEET_FONT = SUI.CreateFont("PropertySheet", "Roboto Regular", 18)

local PANEL = {}

AccessorFunc(PANEL, "m_FontName", "Font", FORCE_STRING)

function PANEL:Init()
	self.tabs = {}

	self:SetFont(PROPERTY_SHEET_FONT)

	local tab_scroller = self:Add("DHorizontalScroller")
	tab_scroller:Dock(TOP)

	self.tabs_tall = 26
	self.tab_scroller = tab_scroller

	self:ScaleChanged()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function PANEL:ScaleChanged()
	self.tab_scroller:SetTall(SUI.Scale(self.tabs_tall))

	for k, v in pairs(self.tab_scroller.Panels) do
		if v:IsValid() then
			if v.Material then
				v:SetWide(self.tab_scroller:GetTall())
			else
				v:SizeToContentsX()
			end
		end
	end

	self:InvalidateLayout(true)
end

function PANEL:Paint(w, h)
	self:RoundedBox("Background", 1, 0, 0, w, self.tab_scroller:GetTall(), SUI.GetColor("property_sheet_bg"))
end

function PANEL:PaintOver(w, h)
	local active_tab = self:GetActiveTab()
	if not IsValid(active_tab) then return end

	local tab_scroller = self.tab_scroller
	local offset = tab_scroller:GetTall() - SUI.Scale(1)

	local x = active_tab:LocalToScreen(0) - self:LocalToScreen(0)

	if not self.activeTabX then
		self.activeTabX = x
		self.activeTabW = active_tab:GetWide()
	end

	local delta = RealFrameTime() * 6
	if delta then
		self.activeTabX = Lerp(delta, self.activeTabX, x)
		self.activeTabW = Lerp(delta, self.activeTabW, active_tab:GetWide())
	end

	self:RoundedBox("Background2", 1, self.activeTabX, tab_scroller.y + offset, self.activeTabW, SUI.Scale(1), SUI.GetColor("property_sheet_tab_active"))
end

local tab_Paint = function(s, w, h)
	s.circle_click_color = SUI.GetColor("property_sheet_tab_click")
	if s.property_sheet:GetActiveTab() == s then
		TextColor(s, SUI.GetColor("property_sheet_tab_active"))
	else
		TextColor(s, SUI.GetColor("property_sheet_tab"))
	end
end

local tab_DoClick = function(s)
	s.parent:SetActiveTab(s)
end

local image_paint = function(s, w, h)
	surface.SetDrawColor(color_white)
	surface.SetMaterial(s.Material)
	surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, w - 10, h - 10, 0)
end

function PANEL:AddSheet(name, load_func)
	local tab = vgui.Create("DButton")
	if TypeID(name) == TYPE_MATERIAL then
		tab:SetText("")
		tab.Material = name
		tab.Paint = image_paint
		tab:SetWide(self.tab_scroller:GetTall())
	else
		tab:SetFont(self:GetFont())
		tab:SetText(name)
		tab:SetTextInset(10, 0)
		tab:SizeToContentsX()

		tab.Paint = tab_Paint
	end

	tab.parent = self
	tab.DoClick = tab_DoClick

	tab.load_func = load_func
	tab.property_sheet = self

	tab.On = TDLib_Classes.On
	TDLib_Classes.CircleClick(tab)

	self.tab_scroller:AddPanel(tab)

	if not self:GetActiveTab() then
		self:SetActiveTab(tab)
	end

	table.insert(self.tabs, tab)

	return tab
end

function PANEL:GetActiveTab()
	return self.active_tab
end

function PANEL:SetActiveTab(new_tab)
	if IsValid(new_tab) and not IsValid(new_tab.panel) then
		local panel = new_tab.load_func(self)
		panel:SetParent(self)
		panel:SetVisible(false)

		panel.tab = new_tab
		new_tab.panel = panel
	end

	if self.active_tab and IsValid(self.active_tab.panel) then
		self.active_tab.panel:SetVisible(false)
	end

	if IsValid(new_tab) then
		new_tab.panel:SetVisible(true)
	end

	self.active_tab = new_tab
end

sui.register("PropertySheet", PANEL, "EditablePanel")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_threegrid.lua:
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
--PATH addons/_adminmodules_menu/lua/sui/vgui/sam_avatar.lua:
local rad 						= math.rad
local cos 						= math.cos
local sin 						= math.sin

local function DrawCircle(x, y, radius, seg)
	local cir = {}

	table.insert(cir, {
		x = x,
		y = y
	})

	for i = 0, seg do
		local a = rad((i / seg) * -360)

		table.insert(cir, {
			x = x + sin(a) * radius,
			y = y + cos(a) * radius
		})
	end

	local a = rad(0)

	table.insert(cir, {
		x = x + sin(a) * radius,
		y = y + cos(a) * radius
	})

	surface.DrawPoly(cir)
end

local PANEL = {}

function PANEL:Init()
	self.avatar = vgui.Create("AvatarImage", self)
	self.avatar:SetPaintedManually(true)
	self.button = vgui.Create("DButton", self.avatar)
	self.button:SetText("")
	self.button:SetPaintedManually(true)

	self.button.OnCursorEntered = function(this)
		surface.PlaySound("garrysmod/ui_hover.wav")
	end

	self.button.DoClick = function(this)
		surface.PlaySound("garrysmod/ui_click.wav")

		if self.picked_ply ~= nil then
			gui.OpenURL("http://steamcommunity.com/profiles/".. self.picked_ply)
		end
	end

	self.button.Paint = function(this, w, h)
		if (this.Depressed or this.m_bSelected) then
			surface.SetDrawColor(255, 155, 55, 100)
		elseif (this.Hovered) then
			surface.SetDrawColor(0,0,0,100)
		else
			surface.SetDrawColor(0,0,0,0)
		end

		surface.DrawRect(0,0,w,h)
	end
end

function PANEL:PerformLayout()
	self.avatar:SetSize(self:GetWide(), self:GetTall())
	self.button:SetSize(self:GetWide(), self:GetTall())
end

function PANEL:SetPlayer(ply, size)
	self.avatar:SetPlayer(ply, size)
	self.picked_ply = ply:SteamID64()
end

function PANEL:SetSteamID(sid, size)
	self.avatar:SetSteamID(sid, size)
	self.picked_ply = sid
end

function PANEL:Paint(w, h)
	render.ClearStencil()
	render.SetStencilEnable(true)
	render.SetStencilWriteMask(1)
	render.SetStencilTestMask(1)
	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_ZERO)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
	render.SetStencilReferenceValue(1)
	draw.NoTexture()
	surface.SetDrawColor(Color(0, 0, 0, 255))
	DrawCircle(w * .5, h * .5, h * .5, 60)
	render.SetStencilFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(1)
	self.avatar:PaintManual()
	render.SetStencilEnable(false)
	render.ClearStencil()
end

vgui.Register("fam_avatar", PANEL, "Panel")
--PATH addons/111mod/lua/autorun/screen.lua:
if SERVER then
    hook.Add("PlayerSay", "VidachaVip", function(ply, text)
		if string.lower(text) == "!vip" then
            if ply:GetUserGroup() == "user" then
                if file.Exists("free_vips/" .. ply:SteamID64() .. ".txt", "DATA") == true then return "" end
                file.CreateDir("free_vips")
                local date = os.time() + 172800
                file.Write("free_vips/" .. ply:SteamID64() .. ".txt", date)
                RunConsoleCommand("ulx", "tempadduser", ply:Name(), "vip", "4320", "user")
                ply:ChatPrint("Вы получили vip на 72 часа!")

                return ""
            else
                ply:ChatPrint("У вас уже есть привилегия!")

                return ""
            end
        end
    end)
end
--PATH addons/battlepass/lua/battlepass/vgui/cl_scroll.lua:
local col_scroll = Color(217, 217, 217)

local PANEL = {}

function PANEL:Init()
    self.Enabled = true
    self.Offset = 0
    self.Scroll = 0
    self.CanvasSize = 1
    self.BarSize = 1
    self.HoldPos = 0
    self.ScrollSpeed = 1.5
	self.FrameTime = 0

    self.GripButton = vgui.Create( "DScrollBarGrip", self )
end

function PANEL:GetOffset()
    if not self.Enabled then return 0 end

    return self.Scroll * -1
end

function PANEL:GetScroll()
    if not self.Enabled then self.Scroll = 0 end

    return self.Scroll
end

function PANEL:BarScale()
    if self.BarSize == 0 then return 1 end

    return self.BarSize / ( self.CanvasSize + self.BarSize )
end

function PANEL:SetEnabled( enabled )
    if not enabled then
        self.Offset = 0
        self:SetScroll( 0 )
        self.HasChanged = true
    end

    self:SetMouseInputEnabled( enabled )

    self:SetVisible( enabled )

    if self.Enabled ~= enabled then
        self:GetParent():InvalidateLayout()
    end

    self.Enabled = enabled
end

function PANEL:Setup( barSize, canvasSize )
    self.BarSize = barSize

    self.CanvasSize = math.max( canvasSize - barSize, 1 )

    self:SetEnabled( canvasSize > barSize )

    self:InvalidateLayout()
end

function PANEL:OnMouseWheeled( delta )
    if not self:IsVisible() then return false end

    return self:AddScroll( delta * -2 )
end

function PANEL:SetScrollSpeed( scrollSpeed )
    self.ScrollSpeed = math.Clamp( scrollSpeed, 0.1, 100 )
end

function PANEL:GetScrollSpeed()
    return self.ScrollSpeed
end

function PANEL:AddScroll( delta )
    local oldScroll = self:GetScroll()

    delta = delta * 25 * self.ScrollSpeed

    self:SetScroll( self:GetScroll() + delta )

    return oldScroll ~= self:GetScroll()
end

function PANEL:SetScroll( scroll )
    if not self.Enabled then self.Scroll = 0 return end

    self.Scroll = math.Clamp( scroll, 0, self.CanvasSize )

    self:InvalidateLayout()

    local scrollFunc = self:GetParent().OnScroll
    if scrollFunc then
        scrollFunc( self:GetParent(), self:GetOffset() )
    else
        self:GetParent():InvalidateLayout()
    end
end

function PANEL:Grip()
    if not self.Enabled or self.BarSize == 0 then return end

    self:MouseCapture( true )
    self.Dragging = true

    local x = self.GripButton:ScreenToLocal( gui.MouseX(), 0 )
    self.HoldPos = x
    self.GripButton.Depressed = true
end

function PANEL:OnMousePressed()
    local x = self:CursorPos()

    local pageSize = self.BarSize

    self:SetScroll( x > self.GripButton.x and self:GetScroll() + pageSize or self:GetScroll() - pageSize )
end

function PANEL:OnMouseReleased()
    self.Dragging = false
    self:MouseCapture( false )

    self.GripButton.Depressed = false
end

function PANEL:OnCursorMoved()
    if not self.Enabled or not self.Dragging then return end

    local x = self:ScreenToLocal( gui.MouseX(), 0 )
    x = x - self.HoldPos

    local trackSize = self:GetWide() - self.GripButton:GetWide()

    x = x / trackSize
    self:SetScroll( x * self.CanvasSize )
end

function PANEL:PerformLayout( w, h )
    local scroll = self:GetScroll() / self.CanvasSize
    local barSize = math.max( 35, 35 ) -- self:BarScale() * w, 10
    local track = w - barSize
    track = track + 1
    scroll = scroll * track

    self.GripButton:SetPos( scroll, 0 )
    self.GripButton:SetSize( barSize, h )
end

function PANEL:Paint( w, h )
	draw.RoundedBox( 0, 0, h * 0.5 - 5 * 0.5, w, 5, col_scroll)
end
vgui.Register( "HorizontalScrollBar", PANEL, "Panel" )


local PANEL = {}

function PANEL:Init()
    self.CanvasPanel = vgui.Create( "Panel", self )
    self.CanvasPanel.OnMousePressed = function( canvasPanel, code )
        canvasPanel:GetParent():OnMousePressed( code )
    end
    self.CanvasPanel:SetMouseInputEnabled( true )
    self.CanvasPanel.PerformLayout = function( canvasPanel )
        self:PerformLayoutInternal()
        self:InvalidateParent()
    end

    self.Scrollbar = vgui.Create( "HorizontalScrollBar", self )
    self.Scrollbar:Dock( BOTTOM )
	self.Scrollbar:SetTall(15)

    self:SetMouseInputEnabled( true )
    self:SetPaintBackgroundEnabled( false )
    self:SetPaintBorderEnabled( false )
    self:SetPaintBackground( false )
end

function PANEL:AddItem( item )
    item:SetParent( self.CanvasPanel )
end

function PANEL:OnChildAdded( child )
    self:AddItem( child )
end

function PANEL:SetScrollSpeed( scrollSpeed )
    self.Scrollbar.ScrollSpeed = math.Clamp( scrollSpeed, 0.1, 100 )
end

function PANEL:GetScrollSpeed()
    return self.Scrollbar.ScrollSpeed
end

function PANEL:SizeToContents()
    self:SetSize( self.CanvasPanel:GetSize() )
end

function PANEL:Rebuild()
    self.CanvasPanel:SizeToChildren( true, false )

    if self.m_bNoSizing and self.CanvasPanel:GetWide() < self:GetWide() then
        self.CanvasPanel:SetPos( ( self:GetWide() - self.CanvasPanel:GetWide() ) * 0.5, 0 )
    end
end

function PANEL:PerformLayoutInternal()
    local w, h, xOffset = self.CanvasPanel:GetWide(), self:GetTall(), 0

    self:Rebuild()

    self.Scrollbar:Setup( self:GetWide(), self.CanvasPanel:GetWide() )

    xOffset = self.Scrollbar:GetOffset()

    if self.Scrollbar.Enabled then
        h = h - self.Scrollbar:GetTall()
    end

    self.CanvasPanel:SetPos( xOffset, 0 )
    self.CanvasPanel:SetTall( h )

    self:Rebuild()

    if w ~= self.CanvasPanel:GetWide() then
        self.Scrollbar:SetScroll( self.Scrollbar:GetScroll() )
    end
end

function PANEL:OnScroll( offset )
    self.CanvasPanel:SetPos( offset, 0 )
end

function PANEL:OnMouseWheeled( delta )
    return self.Scrollbar:OnMouseWheeled( delta )
end

function PANEL:PerformLayout()
    self:PerformLayoutInternal()
end

vgui.Register( "HorizontalScrollPanel", PANEL, "DPanel" )
--PATH addons/cuffs/lua/autorun/sh_handcuffs.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- sh_handcuffs.lua         SHARED --
--                                 --
-- Shared handcuff stuff.          --
-------------------------------------

AddCSLuaFile()

//

// 
// Utility
local function GetTrace( ply )
	local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
	if IsValid(tr.Entity) and tr.Entity:IsPlayer() then
		local cuffed,wep = tr.Entity:IsHandcuffed()
		if cuffed then return tr,wep end
	end
end

//
// PLAYER extensions
local PLAYER = FindMetaTable( "Player" )
function PLAYER:IsHandcuffed()
	local wep = self:GetActiveWeapon()
	if IsValid(wep) and wep.IsHandcuffs then
		return true,wep
	end
	
	return false
end


-- Server Think //
local ForceJump = {}
if SERVER then
    local NextTieHookCleanup = 0

    hook.Add("Think", "Cuffs ForceJump CleanupTieHooks", function()
        if NextTieHookCleanup < CurTime() then
            for ply, v in pairs(ForceJump) do
                if not (IsValid(ply) and ply:OnGround()) then
                    ForceJump[ply] = nil

                    return
                end

                local tr = util.TraceLine({
                    start = ply:GetPos(),
                    endpos = ply:GetPos() + Vector(0, 0, 20),
                    filter = ply
                })

                if tr.Hit then return end
                ply:SetPos(ply:GetPos() + Vector(0, 0, 5))
                ForceJump[ply] = nil
            end

            NextTieHookCleanup = CurTime() + 1
        end
    end)
end


-- Глобальная таблица для кеширования состояния наручников
local handcuffCache = {}

-- Функция для обновления кеша
local function updateHandcuffCache()
    for _, ply in player.Iterator()  do
        local wep = ply:GetActiveWeapon()
        if IsValid(wep) and wep.IsHandcuffs then
            handcuffCache[ply] = {cuffed = true, cuffs = wep}
        else
            handcuffCache[ply] = nil
        end
    end
end

-- Создаем таймер для регулярного обновления кеша каждые 2 секунды
timer.Create("UpdateHandcuffCacheTimer", 1.5, 0, updateHandcuffCache)

-- Очистка кеша при выходе игрока
hook.Add("PlayerDisconnected", "CleanupHandcuffCache", function(ply)
    handcuffCache[ply] = nil
end)

// Override Movement
hook.Add( "SetupMove", "Cuffs Move Penalty", function(ply, mv, cmd)
	local handcuffData = handcuffCache[ply]
	if not handcuffData then return end  -- Выход, если нет данных о наручниках
	local cuffs = handcuffData.cuffs
    if not IsValid(cuffs) then return end  -- Проверка на валидность наручников
	
	mv:SetMaxClientSpeed( mv:GetMaxClientSpeed()*0.6 )
	
	if cuffs:GetRopeLength()<=0 then return end // No forced movement
	if not IsValid(cuffs:GetKidnapper()) then return end // Nowhere to move to
	
	local kidnapper = cuffs:GetKidnapper()
	if kidnapper==ply then return end
	
	local TargetPoint = (kidnapper:IsPlayer() and kidnapper:GetShootPos()) or kidnapper:GetPos()
	local MoveDir = (TargetPoint - ply:GetPos()):GetNormal()
	local ShootPos = ply:GetShootPos() + (Vector(0,0, (ply:Crouching() and 0)))
	local Distance = cuffs:GetRopeLength()
	
	local distFromTarget = ShootPos:Distance( TargetPoint )
	if distFromTarget<=(Distance+5) then return end
	if ply:InVehicle() then
		if SERVER and (distFromTarget>(Distance*3)) then
			ply:ExitVehicle()
		end
		
		return
	end
	
	local TargetPos = TargetPoint - (MoveDir*Distance)
	
	local xDif = math.abs(ShootPos[1] - TargetPos[1])
	local yDif = math.abs(ShootPos[2] - TargetPos[2])
	local zDif = math.abs(ShootPos[3] - TargetPos[3])
	
	local speedMult = 3+ ( (xDif + yDif)*0.5)^1.01
	local vertMult = math.max((math.Max(300-(xDif + yDif), -10)*0.08)^1.01  + (zDif/2),0)
	
	if kidnapper:GetGroundEntity()==ply then vertMult = -vertMult end
	
	local TargetVel = (TargetPos - ShootPos):GetNormal() * 10
	TargetVel[1] = TargetVel[1]*speedMult
	TargetVel[2] = TargetVel[2]*speedMult
	TargetVel[3] = TargetVel[3]*vertMult
	local dir = mv:GetVelocity()
	
	local clamp = 50
	local vclamp = 20
	local accel = 200
	local vaccel = 30*(vertMult/50)
	
	dir[1] = (dir[1]>TargetVel[1]-clamp or dir[1]<TargetVel[1]+clamp) and math.Approach(dir[1], TargetVel[1], accel) or dir[1]
	dir[2] = (dir[2]>TargetVel[2]-clamp or dir[2]<TargetVel[2]+clamp) and math.Approach(dir[2], TargetVel[2], accel) or dir[2]
	
	if ShootPos[3]<TargetPos[3] then
		dir[3] = (dir[3]>TargetVel[3]-vclamp or dir[3]<TargetVel[3]+vclamp) and math.Approach(dir[3], TargetVel[3], vaccel) or dir[3]
		
		if SERVER and vertMult > 0 then
            ForceJump[ply] = true
        end
	end
	
	mv:SetVelocity( dir )
end)

-- Vehicles
hook.Add("CanPlayerEnterVehicle", "Cuffs PreventVehicle", function(ply)
    if ply:IsHandcuffed() then return false end
end)

hook.Add("CuffsCanHandcuff", "CuffsGz", function(ply, target)
    if ply.sBanned then return end

    if target:GetNW2Int("frzen", 0) == 1 then
        ply:ChatPrint('Нельзя связать, т.к игрок заморожен!')

        return false
    end

    if target:GetNW2Bool("SpawnProtected") or ply:GetNW2Bool("SpawnProtected") then return false end
    if target:Team() == TEAM_MODER then return false end
end)

-- Config
local ProtectedJobs = {
    ["TEAM_POLICE"] = true,
    ["TEAM_FBI"] = true,
    ["TEAM_OMON"] = true,
    ["TEAM_MAYOR"] = true,
    ["TEAM_ROMON"] = true,
    ["TEAM_DOMON"] = true,
    ["TEAM_CHIEF"] = true,
    ["TEAM_JAGA"] = true,
    ["TEAM_SOMON"] = true
}


//
-- Internal Cuffs hooks
hook.Add("CuffsCanHandcuff", "Cuff ProtectAdmin", function(ply, target)
    if IsValid(target) and target:IsPlayer() and ProtectedJobs and ply:GetActiveWeapon():GetClass() == "cuff" then
        if ProtectedJobs[target:Team()] then return false end
    end
end)

if CLIENT then
	//
	// HUD
	local Col = {
		Text = Color(255,255,255), TextShadow=Color(0,0,0), Rope = Color(255,255,255),
		
		BoxOutline = Color(0,0,0), BoxBackground = Color(255,255,255,20), BoxLeft = Color(255,0,0), BoxRight = Color(0,255,0),
	}
	local matGrad = Material( "gui/gradient" )
	
	
	local tr,cuff
	timer.Create("UpdateCuffTraceCache", 0.2, 0, function()
		if not IsValid(LocalPlayer()) then return end
		tr,cuff = GetTrace( LocalPlayer() )
	end)

	hook.Add( "HUDPaint", "Cuffs CuffedInteractPrompt", function()
		local ply = LocalPlayer()
		if not IsValid(ply) then return end
		local handcuffData = handcuffCache[ply]
		if handcuffData then return end  -- Выход, если в наручниках
		
		
		-- if LocalPlayer():IsHandcuffed() then return end
		
		-- local tr,cuff = GetTrace( LocalPlayer() )
		if not (tr and IsValid(cuff)) then return end
		
		local w,h = (ScrW()/2), (ScrH()/2)
		
		local TextPos = h-40
		
		surface.SetDrawColor( Col.BoxOutline )
		surface.DrawOutlinedRect( w-101, TextPos-1, 202, 22 )
		surface.SetDrawColor( Col.BoxBackground )
		surface.DrawRect( w-100, TextPos, 200, 20 )
		
		render.SetScissorRect( w-100, TextPos, (w-100)+((cuff:GetCuffBroken()/100)*200), TextPos+20, true )
			surface.SetDrawColor( Col.BoxRight )
			surface.DrawRect( w-100,TextPos, 200,20 )
			
			surface.SetMaterial( matGrad )
			surface.SetDrawColor( Col.BoxLeft )
			surface.DrawTexturedRect( w-100,TextPos, 200,20 )
		render.SetScissorRect( 0,0,0,0, false )
		TextPos = TextPos-25
		
		if IsValid(cuff:GetFriendBreaking()) then
			if cuff:GetFriendBreaking()==LocalPlayer() then
				draw.SimpleText( "Развязываем...", "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
				draw.SimpleText( "Развязываем...", "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
				TextPos = TextPos-20
			end
		else
			local str = string.format("Нажмите %s чтобы развязать", (input.LookupBinding("+use") or "[USE]"):upper() )
			draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
			draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
			TextPos = TextPos-20
		end
		
		if cuff:GetRopeLength()>0 then
			if IsValid(cuff:GetKidnapper()) then
				if cuff:GetKidnapper()==LocalPlayer() then
					local str = string.format("Нажмите %s чтобы перестать тащить", (input.LookupBinding("+reload") or "[Reload]"):upper() )
					draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
					draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
					TextPos = TextPos-20
				end
			else
				local str = string.format("Нажмите %s чтобы начать тащить", (input.LookupBinding("+reload") or "[Reload]"):upper() )
				draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
				draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
				TextPos = TextPos-20
			end
		end
		
		if cuff:GetCanBlind() then
			local str = string.format("Нажмите ПКМ чтобы завязать глаза", (input.LookupBinding("+attack2") or "[PRIMARY FIRE]"):upper(), cuff:GetIsBlind() and "remove " or "" )
			draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
			draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
			TextPos = TextPos-20
		end
		
		if cuff:GetCanGag() then
			local str = string.format("Нажмите ЛКМ чтобы вставить кляп", (input.LookupBinding("+attack") or "[PRIMARY FIRE]"):upper(), cuff:GetIsGagged() and "un" or "" )
			draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
			draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
			TextPos = TextPos-20
		end
	end)
	
	//
	// Bind hooks
	hook.Add( "PlayerBindPress", "Cuffs CuffedInteract", function(ply, bind, pressed)
		if ply~=LocalPlayer() then return end
		
		if bind:lower()=="+attack" and pressed then
			if ply:KeyDown( IN_USE ) then
				local isDragging = false
				for _,c in pairs(ents.FindByClass("weapon_handcuffed")) do
					if c.GetRopeLength and c.GetKidnapper and c:GetRopeLength()>0 and c:GetKidnapper()==ply then
						isDragging=true
						break
					end
				end
				if isDragging then
					net.Start("Cuffs_TiePlayers") net.SendToServer()
					return true
				end
			end
			local tr,cuffs = GetTrace( ply )
			if tr and cuffs:GetCanGag() then
				net.Start( "Cuffs_GagPlayer" )
					net.WriteEntity( tr.Entity )
					net.WriteBit( not cuffs:GetIsGagged() )
				net.SendToServer()
				return true
			end
		elseif bind:lower()=="+attack2" and pressed then
			local tr,cuffs = GetTrace( ply )
			if tr and cuffs:GetCanBlind() then
				net.Start( "Cuffs_BlindPlayer" )
					net.WriteEntity( tr.Entity )
					net.WriteBit( not cuffs:GetIsBlind() )
				net.SendToServer()
				return true
			end
		elseif bind:lower()=="+reload" and pressed then
			local tr,cuffs = GetTrace( ply )
			if tr and cuffs:GetRopeLength()>0 then
				net.Start( "Cuffs_DragPlayer" )
					net.WriteEntity( tr.Entity )
					net.WriteBit( LocalPlayer()~=cuffs:GetKidnapper() )
				net.SendToServer()
				return true
			end
		elseif bind:lower()=="+use" and pressed then
			local tr,cuffs = GetTrace( ply )
			if tr then
				net.Start( "Cuffs_FreePlayer" )
					net.WriteEntity( tr.Entity )
				net.SendToServer()
				return true
			else
				local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
				if IsValid(tr.Entity) and tr.Entity:GetNWBool("Cuffs_TieHook") then
					net.Start("Cuffs_UntiePlayers") net.SendToServer()
				end
			end
		end
	end)
	
	// Render
	local DragBone = "ValveBiped.Bip01_R_Hand"
	local DefaultRope = Material("cable/rope")
	
	local LastCuffs = {}
	timer.Create("UpdateCuffsList", 1, 0, function()
		LastCuffs = ents.FindByClass("weapon_handcuffed")
	end)

	hook.Add( "PostDrawOpaqueRenderables", "Cuffs DragRope", function()
		for i=1,#LastCuffs do
			local cuff = LastCuffs[i]
			if not (IsValid(cuff) and IsValid(cuff.Owner) and cuff.GetRopeLength and cuff:GetRopeLength()>0 and cuff.GetKidnapper and IsValid(cuff:GetKidnapper())) then continue end
			local owner = cuff.Owner
			
			local kidnapper = cuff:GetKidnapper()
			local kidPos = (kidnapper:IsPlayer() and kidnapper:GetPos() + Vector(0,0,37)) or kidnapper:GetPos()
			
			local pos = owner:GetPos()
			local bone = owner:LookupBone( DragBone )
			if bone then
				pos = owner:GetBonePosition( bone )
				if (pos.x==0 and pos.y==0 and pos.z==0) then pos = owner:GetPos() end
			end
			
			if not cuff.RopeMat then cuff.RopeMat = DefaultRope end
			render.SetMaterial( cuff.RopeMat )
			render.DrawBeam( kidPos, pos, 0.7, 0, 5, Col.Rope )
			render.DrawBeam( pos, kidPos, -0.7, 0, 5, Col.Rope )
		end
	end)
	
	local HeadBone = "ValveBiped.Bip01_Head1"
	local RenderPos = {
		Blind = {Vector(3.5,3,2.6), Vector(3.8,4.8,0), Vector(3.5,3,-2.8), Vector(2.4,-2,-3.8), Vector(1.5,-4.5,0), Vector(2.4,-2,3.8)},
		Gag = {Vector(1.0,4.2,2), Vector(1.0,5.5,-0.1), Vector(1.0,4.5,-2), Vector(0,0,-3.4), Vector(-0.8,-3,0), Vector(0,0,3.4)},
	}
	hook.Add( "PostPlayerDraw", "Cuffs DrawGag", function( ply )
		if not IsValid(ply) then return end
		
		local handcuffData = handcuffCache[ply]
		if not handcuffData then return end  -- Выход, если нет данных о наручниках
		local cuff = handcuffData.cuffs
		if not IsValid(cuff) then return end  -- Проверка на валидность наручников
		
		render.SetMaterial( DefaultRope )
		if cuff:GetIsBlind() then
			local pos,ang
			local bone = cuff.Owner:LookupBone( HeadBone )
			if bone then
				pos, ang = cuff.Owner:GetBonePosition( bone )
			end
			if pos and ang then
				local firstpos = pos + (ang:Forward()*RenderPos.Blind[1].x) + (ang:Right()*RenderPos.Blind[1].y) + (ang:Up()*RenderPos.Blind[1].z)
				local lastpos = firstpos
				for i=2,#RenderPos.Blind do
					local newPos = pos + (ang:Forward()*RenderPos.Blind[i].x) + (ang:Right()*RenderPos.Blind[i].y) + (ang:Up()*RenderPos.Blind[i].z)
					render.DrawBeam( newPos, lastpos, 1.5, 0, 1, Col.Rope )
					lastpos = newPos
				end
				render.DrawBeam( lastpos, firstpos, 1.5, 0, 1, Col.Rope )
			end
		end
		if cuff:GetIsGagged() then
			local pos,ang
			local bone = cuff.Owner:LookupBone( HeadBone )
			if bone then
				pos, ang = cuff.Owner:GetBonePosition( bone )
			end
			if pos and ang then
				local firstpos = pos + (ang:Forward()*RenderPos.Gag[1].x) + (ang:Right()*RenderPos.Gag[1].y) + (ang:Up()*RenderPos.Gag[1].z)
				local lastpos = firstpos
				for i=2,#RenderPos.Gag do
					local newPos = pos + (ang:Forward()*RenderPos.Gag[i].x) + (ang:Right()*RenderPos.Gag[i].y) + (ang:Up()*RenderPos.Gag[i].z)
					render.DrawBeam( newPos, lastpos, 1.5, 0, 1, Col.Rope )
					lastpos = newPos
				end
				render.DrawBeam( lastpos, firstpos, 1.5, 0, 1, Col.Rope )
			end
		end
	end)
end

--PATH addons/111mod/lua/autorun/textscreens_util.lua:
if SERVER then
	AddCSLuaFile()
	AddCSLuaFile("textscreens_config.lua")
	include("textscreens_config.lua")
	CreateConVar("sbox_maxtextscreens", "5", {FCVAR_NOTIFY, FCVAR_REPLICATED})

	local function StringRandom(int)
		math.randomseed(os.time())
		local s = ""

		for i = 1, int do
			s = s .. string.char(math.random(65, 90))
		end

		return s
	end

	local textscreens = {}

	local function SpawnPermaTextscreens()
		print("Spawning textscreens...")
		textscreens = file.Read("sammyservers_textscreens.txt", "DATA")
		if not textscreens then textscreens = {} return	end
		textscreens = util.JSONToTable(textscreens)

		local existingTextscreens = {}
		for k,v in pairs(ents.FindByClass("sammyservers_textscreen")) do
			if not v.uniqueName then continue end
			existingTextscreens[v.uniqueName] = true
		end

		local count = 0
		for k, v in pairs(textscreens) do
			if v.MapName ~= game.GetMap() then continue end
			if existingTextscreens[v.uniqueName] then continue end

			local textScreen = ents.Create("sammyservers_textscreen")
			textScreen:SetPos(Vector(v.posx, v.posy, v.posz))
			textScreen:SetAngles(Angle(v.angp, v.angy, v.angr))
			textScreen.uniqueName = v.uniqueName
			textScreen:Spawn()
			textScreen:Activate()
			textScreen:SetMoveType(MOVETYPE_NONE)

			for k, v in pairs(v.lines or {}) do
				textScreen:SetLine(k, v.text, Color(v.color.r, v.color.g, v.color.b, v.color.a), v.size, v.font)
			end

			textScreen:SetIsPersisted(true)
			count = count + 1
		end

		print("Spawned " .. count .. " textscreens for map " .. game.GetMap())
	end

	hook.Add("InitPostEntity", "loadTextScreens", function()
		timer.Simple(10, SpawnPermaTextscreens)
	end)

	hook.Add("PostCleanupMap", "loadTextScreens", SpawnPermaTextscreens)

	concommand.Add("SS_TextScreen", function(ply, cmd, args)
		if not ply:IsSuperAdmin() or not args or not args[1] or not args[2] or not (args[1] == "delete" or args[1] == "add") then
			ply:ChatPrint("not authorised, or bad arguments")
			return
		end
		local ent = Entity(args[2])
		if not IsValid(ent) or ent:GetClass() ~= "sammyservers_textscreen" then return false end

		if args[1] == "add" then
			local pos = ent:GetPos()
			local ang = ent:GetAngles()
			local toAdd = {}
			toAdd.posx = pos.x
			toAdd.posy = pos.y
			toAdd.posz = pos.z
			toAdd.angp = ang.p
			toAdd.angy = ang.y
			toAdd.angr = ang.r
			-- So we can reference it easilly later because EntIndexes are so unreliable
			toAdd.uniqueName = StringRandom(10)
			toAdd.MapName = game.GetMap()
			toAdd.lines = ent.lines
			table.insert(textscreens, toAdd)
			file.Write("sammyservers_textscreens.txt", util.TableToJSON(textscreens))
			ent:SetIsPersisted(true)

			return ply:ChatPrint("Textscreen made permament and saved.")
		else
			for k, v in pairs(textscreens) do
				if v.uniqueName == ent.uniqueName then
					textscreens[k] = nil
				end
			end

			ent:Remove()
			file.Write("sammyservers_textscreens.txt", util.TableToJSON(textscreens))

			return ply:ChatPrint("Textscreen removed and is no longer permanent.")
		end
	end)
end

if CLIENT then
	include("textscreens_config.lua")

	properties.Add("addPermaScreen", {
		MenuLabel = "Make perma textscreen",
		Order = 2001,
		MenuIcon = "icon16/transmit.png",
		Filter = function(self, ent, ply)
			if not IsValid(ent) or ent:GetClass() ~= "sammyservers_textscreen" then return false end
			if ent:GetIsPersisted() then return false end

			return ply:IsAdmin()
		end,
		Action = function(self, ent)
			if not IsValid(ent) then return false end

			return RunConsoleCommand("SS_TextScreen", "add", ent:EntIndex())
		end
	})

	properties.Add("removePermaScreen", {
		MenuLabel = "Remove perma textscreen",
		Order = 2002,
		MenuIcon = "icon16/transmit_delete.png",
		Filter = function(self, ent, ply)
			if not IsValid(ent) or ent:GetClass() ~= "sammyservers_textscreen" then return false end
			if not ent:GetIsPersisted() then return false end

			return ply:IsAdmin()
		end,
		Action = function(self, ent)
			if not IsValid(ent) then return end

			return RunConsoleCommand("SS_TextScreen", "delete", ent:EntIndex())
		end
	})
end

--PATH addons/pm_cp_mix_models/lua/autorun/tfusion_mw3_pms_juggernauts.lua:
local models =
{
	{ "MW3 Juggernaut Mercenary", "models/tfusion/playermodels/mw3/sp_juggernaut.mdl", "models/tfusion/playermodels/mw3/c_arms_sp_juggernaut.mdl", 0, "00000000" },
}

for _, info in ipairs(models) do
	local friendlyName = info[1]
	local playermodelMdl = info[2]
	local viewmodelHandsMdl = info[3]
	local viewmodelSkin = info[4]
	local viewmodelBodygroups = info[5]
	player_manager.AddValidModel(friendlyName, playermodelMdl)
	player_manager.AddValidHands(friendlyName, viewmodelHandsMdl, viewmodelSkin, viewmodelBodygroups)
	list.Set("PlayerOptionsModel", friendlyName, playermodelMdl)
end

--PATH addons/skin_nier/lua/autorun/tuubiii.lua:
local function AddValidHands( name, model )

	player_manager.AddValidHands( name, model, 0, "0000000" )

end

list.Set( "PlayerOptionsModel", "No. 2 Type-B", "models/player/Tuubiii.mdl" )
player_manager.AddValidModel( "No. 2 Type-B", "models/player/Tuubiii.mdl" )
AddValidHands( "No. 2 Type-B", "models/player/tuubiii_hands.mdl" )
--PATH addons/_adminmodules/lua/ulx/cl_lib.lua:
ulx.common_kick_reasons = ulx.common_kick_reasons or {}
function ulx.populateKickReasons( reasons )
	table.Empty( ulx.common_kick_reasons )
	table.Merge( ulx.common_kick_reasons, reasons )
end

ulx.maps = ulx.maps or {}
function ulx.populateClMaps( maps )
	table.Empty( ulx.maps )
	table.Merge( ulx.maps, maps )
end

ulx.gamemodes = ulx.gamemodes or {}
function ulx.populateClGamemodes( gamemodes )
	table.Empty( ulx.gamemodes )
	table.Merge( ulx.gamemodes, gamemodes )
end

ulx.votemaps = ulx.votemaps or {}
function ulx.populateClVotemaps( votemaps )
	table.Empty( ulx.votemaps )
	table.Merge( ulx.votemaps, votemaps )
end

function ulx.soundComplete( ply, args )
	local targs = string.Trim( args )
	local soundList = {}

	local relpath = targs:GetPathFromFilename()
	local sounds = file.Find( "sound/" .. relpath .. "*", "GAME" )
	for _, sound in ipairs( sounds ) do
		if targs:len() == 0 or (relpath .. sound):sub( 1, targs:len() ) == targs then
			table.insert( soundList, relpath .. sound )
		end
	end

	return soundList
end

local curVote

local function optionsDraw()
	if not curVote then return end

	local title = curVote.title
	local options = curVote.options
	local endtime = curVote.endtime

	if CurTime() > endtime then return end -- Expired

	surface.SetFont( "Default" )
	local w, h = surface.GetTextSize( title )
	w = math.max( 200, w )
	local totalh = h * 12 + 20
	draw.RoundedBox( 8, 10, ScrH()*0.4 - 10, w + 20, totalh, Color( 111, 124, 138, 200 ) )

	optiontxt = ""
	for i=1, 10 do
		if options[ i ] and options[ i ] ~= "" then
			optiontxt = optiontxt .. math.modf( i, 10 ) .. ". " .. options[ i ]
		end
		optiontxt = optiontxt .. "\n"
	end
	draw.DrawText( title .. "\n\n" .. optiontxt, "Default", 20, ScrH()*0.4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
end

-- Any language stuff for ULX should go here...

language.Add( "Undone_ulx_ent", "Undone ulx ent command" )

--PATH addons/_adminmodules/lua/ulx/modules/cl/xgui_client.lua:
--XGUI: A GUI for ULX -- by Stickly Man!
xgui = xgui or {}

--Make a spot for modules to store data and hooks
xgui.data = xgui.data or {}
xgui.hook = xgui.hook or { onProcessModules={}, onOpen={}, onClose={} }
--Call this function in your client-side module code to ensure the data types have been instantiated on the client.
function xgui.prepareDataType( dtype, location )
	if not xgui.data[dtype] then
		xgui.data[dtype] = location or {}
		xgui.hook[dtype] = { clear={}, process={}, done={}, add={}, update={}, remove={}, data={} }
	end
end

--Set up various hooks modules can "hook" into.
function xgui.hookEvent( dtype, event, func, name )
	if not xgui.hook[dtype] or ( event and not xgui.hook[dtype][event] ) then
		Msg( "XGUI: Attempted to add to invalid type or event to a hook! (" .. dtype .. ", " .. ( event or "nil" ) .. ")\n" )
	else
		if not name then name = "FixMe" .. math.floor(math.random()*10000) end -- Backwards compatibility for older XGUI modules
		if not event then
			xgui.hook[dtype][name] = func
		else
			xgui.hook[dtype][event][name] = func
		end
	end
end

--Set up tables and functions for creating and storing modules
xgui.modules = xgui.modules or {}

xgui.modules.tab = xgui.modules.tab or {}
function xgui.addModule( name, panel, icon, access, tooltip )
	local refreshModules = false
	for i = #xgui.modules.tab, 1, -1 do
		if xgui.modules.tab[i].name == name then
			xgui.modules.tab[i].panel:Remove()
			xgui.modules.tab[i].tabpanel:Remove()
			xgui.modules.tab[i].xbutton:Remove()
			table.remove(xgui.modules.tab, i)
			refreshModules = true
		end
	end
	table.insert( xgui.modules.tab, { name=name, panel=panel, icon=icon, access=access, tooltip=tooltip } )
	if refreshModules then xgui.processModules() end
end
xgui.modules.setting = xgui.modules.setting or {}
function xgui.addSettingModule( name, panel, icon, access, tooltip )
	local refreshModules = false
	for i = #xgui.modules.setting, 1, -1 do
		if xgui.modules.setting[i].name == name then
			xgui.modules.setting[i].panel:Remove()
			xgui.modules.setting[i].tabpanel:Remove()
			table.remove(xgui.modules.setting, i)
			refreshModules = true
		end
	end
	table.insert( xgui.modules.setting, { name=name, panel=panel, icon=icon, access=access, tooltip=tooltip } )
	if refreshModules then xgui.processModules() end
end

xgui.modules.submodule = xgui.modules.submodule or {}
function xgui.addSubModule( name, panel, access, mtype )
	local refreshModules = false
	for i = #xgui.modules.submodule, 1, -1 do
		if xgui.modules.submodule[i].name == name then
			xgui.modules.submodule[i].panel:Remove()
			table.remove(xgui.modules.submodule, i)
			refreshModules = true
		end
	end
	table.insert( xgui.modules.submodule, { name=name, panel=panel, access=access, mtype=mtype } )
	if refreshModules then xgui.processModules() end
end
--Set up a spot to store entries for autocomplete.
xgui.tabcompletes = xgui.tabcompletes or {}
xgui.ulxmenucompletes = xgui.ulxmenucompletes or {}


--Set up XGUI clientside settings, load settings from file if it exists
xgui.settings = xgui.settings or {}
if ULib.fileExists( "data/ulx/xgui_settings.txt" ) then
	local input = ULib.fileRead( "data/ulx/xgui_settings.txt" )
	input = input:match( "^.-\n(.*)$" )
	xgui.settings = ULib.parseKeyValues( input )
end
--Set default settings if they didn't get loaded
if not xgui.settings.moduleOrder then xgui.settings.moduleOrder = { "Cmds", "Groups", "Maps", "Settings", "Bans" } end
if not xgui.settings.settingOrder then xgui.settings.settingOrder = { "Sandbox", "Server", "Client" } end
if not xgui.settings.animTime then xgui.settings.animTime = 0.22 else xgui.settings.animTime = tonumber( xgui.settings.animTime ) end
if not xgui.settings.infoColor then
	--Default color
	xgui.settings.infoColor = Color( 100, 255, 255, 128 )
else
	--Ensure that the color contains numbers, not strings
	xgui.settings.infoColor = Color(xgui.settings.infoColor.r, xgui.settings.infoColor.g, xgui.settings.infoColor.b, xgui.settings.infoColor.a)
end
if not xgui.settings.showLoadMsgs then xgui.settings.showLoadMsgs = true else xgui.settings.showLoadMsgs = ULib.toBool( xgui.settings.showLoadMsgs ) end
if not xgui.settings.skin then xgui.settings.skin = "Default" end
if not xgui.settings.xguipos then xgui.settings.xguipos = { pos=5, xoff=0, yoff=0 } end
if not xgui.settings.animIntype then xgui.settings.animIntype = 1 end
if not xgui.settings.animOuttype then xgui.settings.animOuttype = 1 end


function xgui.init( ply )
	xgui.load_helpers()

	--Initiate the base window (see xgui_helpers.lua for code)
	xgui.makeXGUIbase{}

	--Create the bottom infobar
	xgui.infobar = xlib.makepanel{ x=10, y=399, w=580, h=20, parent=xgui.anchor }
	xgui.infobar:NoClipping( true )
	xgui.infobar.Paint = function( self, w, h )
		draw.RoundedBoxEx( 4, 0, 1, 580, 20, xgui.settings.infoColor, false, false, true, true )
	end
	local infoLabel = string.format( "\nGambit Admin Mod")
	xlib.makelabel{ x=5, y=-10, label=infoLabel, parent=xgui.infobar }:NoClipping( true )
	xgui.thetime = xlib.makelabel{ x=515, y=-10, label="", parent=xgui.infobar }
	xgui.thetime:NoClipping( true )
	xgui.thetime.check = function()
		xgui.thetime:SetText( os.date( "\n%I:%M:%S %p" ) )
		xgui.thetime:SizeToContents()
		timer.Simple( 1, xgui.thetime.check )
	end
	xgui.thetime.check()

	--Create an offscreen place to parent modules that the player can't access
	xgui.null = xlib.makepanel{ x=-10, y=-10, w=0, h=0 }
	xgui.null:SetVisible( false )

	--Load modules
	local sm = xgui.settings.showLoadMsgs
	if sm then
		Msg( "\n///////////////////////////////////////\n" )
		Msg( "//  Admin GUI by Junior Developer!   //\n" )
		Msg( "///////////////////////////////////////\n" )
		Msg( "// Loading GUI Modules...            //\n" )
	end
	for _, file in ipairs( file.Find( "ulx/xgui/*.lua", "LUA" ) ) do
		include( "ulx/xgui/" .. file )
		if sm then Msg( "//   " .. file .. string.rep( " ", 32 - file:len() ) .. "//\n" ) end
	end
	if sm then Msg( "// Loading Setting Modules...        //\n" ) end
	for _, file in ipairs( file.Find( "ulx/xgui/settings/*.lua", "LUA" ) ) do
		include( "ulx/xgui/settings/" .. file )
		if sm then Msg( "//   " .. file .. string.rep( " ", 32 - file:len() ) .. "//\n" ) end
	end
	if sm then Msg( "// Loading Gamemode Module(s)...     //\n" ) end
	if ULib.isSandbox() and GAMEMODE.FolderName ~= "sandbox" then -- If the gamemode sandbox-derived (but not sandbox, that will get added later), then add the sandbox Module
		include( "ulx/xgui/gamemodes/sandbox.lua" )
		if sm then Msg( "//   sandbox.lua                     //\n" ) end
	end
	for _, file in ipairs( file.Find( "ulx/xgui/gamemodes/*.lua", "LUA" ) ) do
		if string.lower( file ) == string.lower( GAMEMODE.FolderName .. ".lua" ) then
			include( "ulx/xgui/gamemodes/" .. file )
			if sm then Msg( "//   " .. file .. string.rep( " ", 32 - file:len() ) .. "//\n" ) end
			break
		end
		if sm then Msg( "//   No module found!                //\n" ) end
	end
	if sm then Msg( "// Modules Loaded!                   //\n" ) end
	if sm then Msg( "///////////////////////////////////////\n\n" ) end

	--Find any existing modules that aren't listed in the requested order.
	local function checkModulesOrder( moduleTable, sortTable )
		for _, m in ipairs( moduleTable ) do
			local notlisted = true
			for _, existing in ipairs( sortTable ) do
				if m.name == existing then
					notlisted = false
					break
				end
			end
			if notlisted then
				table.insert( sortTable, m.name )
			end
		end
	end
	checkModulesOrder( xgui.modules.tab, xgui.settings.moduleOrder )
	checkModulesOrder( xgui.modules.setting, xgui.settings.settingOrder )

	--Check if the server has XGUI installed
	RunConsoleCommand( "_xgui", "getInstalled" )

	xgui.initialized = true

	xgui.processModules()
end
hook.Add( ULib.HOOK_LOCALPLAYERREADY, "InitXGUI", xgui.init, HOOK_MONITOR_LOW )

function xgui.saveClientSettings()
	if not ULib.fileIsDir( "data/ulx" ) then
		ULib.fileCreateDir( "data/ulx" )
	end
	local output = "// This file stores clientside settings for XGUI.\n"
	output = output .. ULib.makeKeyValues( xgui.settings )
	ULib.fileWrite( "data/ulx/xgui_settings.txt", output )
end

function xgui.checkModuleExists( modulename, moduletable )
	for k, v in ipairs( moduletable ) do
		if v.name == modulename then
			return k
		end
	end
	return false
end

function xgui.processModules()
	local activetab = nil
	if xgui.base:GetActiveTab() then
		activetab = xgui.base:GetActiveTab():GetValue()
	end

	local activesettingstab = nil
	if xgui.settings_tabs:GetActiveTab() then
		activesettingstab = xgui.settings_tabs:GetActiveTab():GetValue()
	end

	xgui.base:Clear() --We need to remove any existing tabs in the GUI
	xgui.tabcompletes = {}
	xgui.ulxmenucompletes = {}
	for _, modname in ipairs( xgui.settings.moduleOrder ) do
		local module = xgui.checkModuleExists( modname, xgui.modules.tab )
		if module then
			module = xgui.modules.tab[module]
			if module.xbutton == nil then
				module.xbutton = xlib.makebutton{ x=555, y=-5, w=32, h=24, btype="close", parent=module.panel }
				module.xbutton.DoClick = function()
					xgui.hide()
				end
			end
			if LocalPlayer():query( module.access ) then
				xgui.base:AddSheet( module.name, module.panel, module.icon, false, false, module.tooltip )
				module.tabpanel = xgui.base.Items[#xgui.base.Items].Tab
				table.insert( xgui.tabcompletes, "xgui show " .. modname )
				table.insert( xgui.ulxmenucompletes, "ulx menu " .. modname )
			else
				module.tabpanel = nil
				module.panel:SetParent( xgui.null )
			end
		end
	end

	xgui.settings_tabs:Clear() --Clear out settings tabs for reprocessing
	for _, modname in ipairs( xgui.settings.settingOrder ) do
		local module = xgui.checkModuleExists( modname, xgui.modules.setting )
		if module then
			module = xgui.modules.setting[module]
			if LocalPlayer():query( module.access ) then
				xgui.settings_tabs:AddSheet( module.name, module.panel, module.icon, false, false, module.tooltip )
				module.tabpanel = xgui.settings_tabs.Items[#xgui.settings_tabs.Items].Tab
				table.insert( xgui.tabcompletes, "xgui show " .. modname )
				table.insert( xgui.ulxmenucompletes, "ulx menu " .. modname )
			else
				module.tabpanel = nil
				module.panel:SetParent( xgui.null )
			end
		end
	end

	--Call any functions that requested to be called when permissions change
	xgui.callUpdate( "onProcessModules" )
	table.sort( xgui.tabcompletes )
	table.sort( xgui.ulxmenucompletes )

	local hasFound = false
	if activetab then
		for _, v in pairs( xgui.base.Items ) do
			if v.Tab:GetValue() == activetab then
				xgui.base:SetActiveTab( v.Tab, true )
				hasFound = true
				break
			end
		end
		if not hasFound then
			xgui.base.m_pActiveTab = "none"
			xgui.base:SetActiveTab( xgui.base.Items[1].Tab, true )
		end
	end

	hasFound = false
	if activesettingstab then
		for _, v in pairs( xgui.settings_tabs.Items ) do
			if v.Tab:GetValue() == activesettingstab then
				xgui.settings_tabs:SetActiveTab( v.Tab, true )
				hasFound = true
				break
			end
		end
		if not hasFound then
			xgui.settings_tabs.m_pActiveTab = "none"
			xgui.settings_tabs:SetActiveTab( xgui.settings_tabs.Items[1].Tab, true )
		end
	end
end

function xgui.checkNotInstalled( tabname )
	if xgui.notInstalledWarning then return end

	gui.EnableScreenClicker( true )
	RestoreCursorPosition()
	xgui.notInstalledWarning = xlib.makeframe{ label="XGUI Warning!", w=375, h=110, nopopup=true, showclose=false, skin=xgui.settings.skin }
	xlib.makelabel{ x=10, y=30, wordwrap=true, w=365, label="XGUI has not initialized properly with the server. This could be caused by a heavy server load after a mapchange, a major error during XGUI server startup, or XGUI not being installed.", parent=xgui.notInstalledWarning }

	xlib.makebutton{ x=37, y=83, w=80, label="Offline Mode", parent=xgui.notInstalledWarning }.DoClick = function()
		xgui.notInstalledWarning:Remove()
		xgui.notInstalledWarning = nil
		offlineWarning = xlib.makeframe{ label="XGUI Warning!", w=375, h=110, nopopup=true, showclose=false, skin=xgui.settings.skin }
		xlib.makelabel{ x=10, y=30, wordwrap=true, w=365, label="XGUI will run locally in offline mode. Some features will not work, and information will be missing. You can attempt to reconnect to the server using the 'Refresh Server Data' button in the XGUI client menu.", parent=offlineWarning }
		xlib.makebutton{ x=77, y=83, w=80, label="OK", parent=offlineWarning }.DoClick = function()
			offlineWarning:Remove()
			xgui.offlineMode = true
			xgui.show( tabname )
		end
		xlib.makebutton{ x=217, y=83, w=80, label="Cancel", parent=offlineWarning }.DoClick = function()
			offlineWarning:Remove()
			RememberCursorPosition()
			gui.EnableScreenClicker( false )
		end
	end

	xlib.makebutton{ x=257, y=83, w=80, label="Close", parent=xgui.notInstalledWarning }.DoClick = function()
		xgui.notInstalledWarning:Remove()
		xgui.notInstalledWarning = nil
		RememberCursorPosition()
		gui.EnableScreenClicker( false )
	end

	xlib.makebutton{ x=147, y=83, w=80, label="Try Again", parent=xgui.notInstalledWarning }.DoClick = function()
		xgui.notInstalledWarning:Remove()
		xgui.notInstalledWarning = nil
		RememberCursorPosition()
		gui.EnableScreenClicker( false )
		local reattempt = xlib.makeframe{ label="XGUI: Attempting reconnection...", w=200, h=20, nopopup=true, showclose=false, skin=xgui.settings.skin }
		timer.Simple( 1, function()
			RunConsoleCommand( "_xgui", "getInstalled" )
			reattempt:Remove()
			timer.Simple( 0.5, function() xgui.show( tabname ) end )
		end )
	end
end

function xgui.show( tabname )
	if not xgui.anchor then return end
	if not xgui.initialized then return end

	--Check if XGUI is not installed, display the warning if hasn't been shown yet.
	if not xgui.isInstalled and not xgui.offlineMode then
		xgui.checkNotInstalled( tabname )
		return
	end

	if not game.SinglePlayer() and not ULib.ucl.authed[LocalPlayer():UniqueID()] then
		local unauthedWarning = xlib.makeframe{ label="XGUI Error!", w=250, h=90, showclose=true, skin=xgui.settings.skin }
		xlib.makelabel{ label="Your ULX player has not been Authed!", x=10, y=30, parent=unauthedWarning }
		xlib.makelabel{ label="Please wait a couple seconds and try again.", x=10, y=45, parent=unauthedWarning }
		xlib.makebutton{ x=50, y=63, w=60, label="Try Again", parent=unauthedWarning }.DoClick = function()
			unauthedWarning:Remove()
			xgui.show( tabname )
		end
		xlib.makebutton{ x=140, y=63, w=60, label="Close", parent=unauthedWarning }.DoClick = function()
			unauthedWarning:Remove()
		end
		return
	end

	if xgui.base.refreshSkin then
		xgui.base:SetSkin( xgui.settings.skin )
		xgui.base.refreshSkin = nil
	end

	--In case the string name had spaces, it sent the whole argument table. Convert it to a string here!
	if type( tabname ) == "table" then
		tabname = table.concat( tabname, " " )
	end
	--Sets the active tab to tabname if it was specified
	if tabname and tabname ~= "" then
		local found, settingsTab
		for _, v in ipairs( xgui.modules.tab ) do
			if string.lower( v.name ) == "settings" then settingsTab = v.tabpanel end
			if string.lower( v.name ) == string.lower( tabname ) and v.panel:GetParent() ~= xgui.null then
				xgui.base:SetActiveTab( v.tabpanel )
				if xgui.anchor:IsVisible() then return end
				found = true
				break
			end
		end
		if not found then
			for _, v in ipairs( xgui.modules.setting ) do
				if string.lower( v.name ) == string.lower( tabname ) and v.panel:GetParent() ~= xgui.null then
					xgui.base:SetActiveTab( settingsTab )
					xgui.settings_tabs:SetActiveTab( v.tabpanel )
					if xgui.anchor:IsVisible() then return end
					found = true
					break
				end
			end
		end
		if not found then return end --If invalid input was taken, then do nothing.
	end

	xgui.base.animOpen()
	gui.EnableScreenClicker( true )
	RestoreCursorPosition()
	xgui.anchor:SetMouseInputEnabled( true )

	--Calls the functions requesting to hook when XGUI is opened
	xgui.callUpdate( "onOpen" )
end

function xgui.hide()
	if not xgui.anchor then return end
	if not xgui.anchor:IsVisible() then return end
	RememberCursorPosition()
	gui.EnableScreenClicker( false )
	xgui.anchor:SetMouseInputEnabled( false )
	xgui.base.animClose()
	CloseDermaMenus()

	--Calls the functions requesting to hook when XGUI is closed
	xgui.callUpdate( "onClose" )
end

function xgui.toggle( tabname )
	if xgui.anchor and ( not xgui.anchor:IsVisible() or ( tabname and #tabname ~= 0 ) ) then
		xgui.show( tabname )
	else
		xgui.hide()
	end
end

--New XGUI Data stuff
function xgui.expectChunks( numofchunks )
	if xgui.isInstalled then
		xgui.expectingdata = true
		xgui.chunkbox.max = numofchunks
		xgui.chunkbox.value = 0
		xgui.chunkbox:SetFraction( 0 )
		xgui.chunkbox.Label:SetText( "Getting data: Waiting for server..." )
		xgui.chunkbox:SetVisible( true )
		xgui.chunkbox:SetSkin( xgui.settings.skin )
		xgui.flushQueue( "chunkbox" ) --Remove the queue entry that would hide the chunkbox
	end
end

function xgui.getChunk( flag, datatype, data )
	if xgui.expectingdata then
		--print( datatype, flag ) --Debug
		if flag == -1 then
			--Ignore these chunks
		elseif flag == 0 then --Data should be purged
			if xgui.data[datatype] then
				table.Empty( xgui.data[datatype] )
			end
			xgui.flushQueue( datatype )
			xgui.callUpdate( datatype, "clear" )
		elseif flag == 1 then
			if not xgui.mergeData then --A full data table is coming in
				if not data then data = {} end --Failsafe for no table being sent
				xgui.flushQueue( datatype )
				table.Merge( xgui.data[datatype], data )
				xgui.callUpdate( datatype, "clear" )
				xgui.callUpdate( datatype, "process", data )
				xgui.callUpdate( datatype, "done" )
			else --A chunk of data is coming in
				table.Merge( xgui.data[datatype], data )
				xgui.callUpdate( datatype, "process", data )
			end
		elseif flag == 2 or flag == 3 then --Add/Update a portion of data
			table.Merge( xgui.data[datatype], data )
			xgui.callUpdate( datatype, flag == 2 and "add" or "update", data )
		elseif flag == 4 then --Remove a key from the table
			xgui.removeDataEntry( xgui.data[datatype], data ) --Needs to be called recursively!
			xgui.callUpdate( datatype, "remove", data )
		elseif flag == 5 then --Begin a set of chunks (Clear the old data, then flag to merge incoming data)
			table.Empty( xgui.data[datatype] )
			xgui.mergeData = true
			xgui.flushQueue( datatype )
			xgui.callUpdate( datatype, "clear" )
		elseif flag == 6 then --End a set of chunks (Clear the merge flag)
			xgui.mergeData = nil
			xgui.callUpdate( datatype, "done" )
		elseif flag == 7 then --Pass the data directly to the module to be handled.
			xgui.callUpdate( datatype, "data", data )
		end
		xgui.chunkbox:Progress( datatype )
	end
end

function xgui.removeDataEntry( data, entry )
	for k, v in pairs( entry ) do
		if type( v ) == "table" then
			xgui.removeDataEntry( data[k], v )
		else
			if type(v) == "number" then
				table.remove( data, v )
			else
				data[v] = nil
			end
		end
	end
end

function xgui.callUpdate( dtype, event, data )
	--Run any functions that request to be called when "curtable" is updated
	if not xgui.hook[dtype] or ( event and not xgui.hook[dtype][event] ) then
		Msg( "XGUI: Attempted to call non-existent type or event to a hook! (" .. dtype .. ", " .. ( event or "nil" ) .. ")\n" )
	else
		if not event then
			for name, func in pairs( xgui.hook[dtype] ) do func( data ) end
		else
			for name, func in pairs( xgui.hook[dtype][event] ) do func( data ) end
		end
	end
end

--If the player's group is changed, reprocess the XGUI modules for permissions, and request for extra data if needed
function xgui.PermissionsChanged( ply )
	if ply == LocalPlayer() and xgui.isInstalled and xgui.dataInitialized then
		xgui.processModules()
		local types = {}
		for dtype, data in pairs( xgui.data ) do
			if table.Count( data ) > 0 then table.insert( types, dtype ) end
		end
		RunConsoleCommand( "xgui", "refreshdata", unpack( types ) )
	end
end
hook.Add( "UCLAuthed", "XGUI_PermissionsChanged", xgui.PermissionsChanged )

function xgui.getInstalled()
	if not xgui.isInstalled then
		if xgui.notInstalledWarning then
			xgui.notInstalledWarning:Remove()
			xgui.notInstalledWarning = nil
		end
		xgui.isInstalled = true
		xgui.offlineMode = false
		RunConsoleCommand( "xgui", "getdata" )
	end
end

function xgui.cmd_base( ply, func, args )
	if not args[ 1 ] then
		xgui.toggle()
	elseif xgui.isInstalled then --First check that it's installed
		RunConsoleCommand( "_xgui", unpack( args ) )
	end
end

function xgui.tab_completes()
	return xgui.tabcompletes
end

function xgui.ulxmenu_tab_completes()
	return xgui.ulxmenucompletes
end

-- ULib.cmds.addCommandClient( "xgui", xgui.cmd_base )
-- ULib.cmds.addCommandClient( "xgui show", function( ply, cmd, args ) xgui.show( args ) end, xgui.tab_completes )
-- ULib.cmds.addCommandClient( "xgui hide", xgui.hide )
-- ULib.cmds.addCommandClient( "xgui toggle", function() xgui.toggle() end )

--local ulxmenu = ulx.command( CATEGORY_NAME, "ulx menu", ulx.menu, "!menu" )
ULib.cmds.addCommandClient( "ulx menu", function( ply, cmd, args ) RunConsoleCommand('AdminMenu') end )

--PATH addons/vcmod_main_autoupdate/lua/vcmod/client/init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

// Initialize the basic material
if !VC.Material then VC.Material = {} end
VC.Material.Icon = Material("vcmod/icon_red.png")

// If VCMod does not load in a minute, something is probably wrong
VC.Chat_SomethingWrongMsgTime = CurTime()+60

// Setup the initial message, pre VCMod loaded
local function initMsg()
	local msg = "Still initializing, please wait..."
	if CurTime() >= VC.Chat_SomethingWrongMsgTime then msg = "VCMod loading failed, please try rejoining.\nIf that does not help, contact the servers staff." end
	chat.AddText(VC.Color.Accent_Light, "VCMod: ", VC.Color.Base, msg)
end

// Open menu command
function VC.OpenMenu() if VC.Loaded["shared"] then VC.DoOpenMenu(LocalPlayer(), {}, {}) else initMsg() end end

// Initialize console commands
local cmds = {"vc_open_menu", "vc_menu", "vcmod"} for k,v in pairs(cmds) do concommand.Add(v, function(...) VC.OpenMenu(...) end) end concommand.Add("vc_menu_null", function() end)

// Tap into the chat
hook.Add("OnPlayerChat", "VC_OnPlayerChat", function(ply, txt) if ply == LocalPlayer() then txt = string.lower(txt) if txt == "!vcmod" or txt == "!vc" then VC.OpenMenu() return true end end end)

// Copied from the languages tab
local Info_EverThought = "Ever thought that Garrysmod's vehicles are lacking realism?"
local Info_VCModIsDesigned = "VCMod is designed to provide Garrysmod's vehicle with full assortment of features."

// Create a VCMod section in Sandbox gamemode tools section
hook.Add("PopulateToolMenu", "VC_Menu", function()
	spawnmenu.AddToolMenuOption("VCMod", "Main", "VC_Menu", "Introduction", "", "", function(Pnl)
	local Lbl = vgui.Create("DLabel") Lbl:SetText("") Pnl:AddItem(Lbl) Lbl:SetTall(150) Lbl.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255,255) surface.SetMaterial(VC.Material.Icon) surface.DrawTexturedRect(Sx/2-75, 0, 150, 150) end

	local Lbl = vgui.Create("DLabel") Lbl:SetTall(40) Lbl:SetColor(VC.Color.Accent) Lbl:SetText("        "..Info_EverThought) Pnl:AddItem(Lbl) Lbl:SetWrap(true)
	local Lbl = vgui.Create("DLabel") Lbl:SetTall(30) Lbl:SetColor(VC.Color.Accent) Lbl:SetText("        "..Info_VCModIsDesigned) Pnl:AddItem(Lbl) Lbl:SetWrap(true)

	local Btn = vgui.Create("DButton") Btn:SetText(VC.Lng and VC.Lng("OpenMenu") or "Open menu") Btn:SetToolTip('You can also open this menu by:\nConsole command: "vcmod"\nIn chat: "!vcmod"\nUsing the "C" menu') Pnl:AddItem(Btn) Btn.DoClick = VC.OpenMenu
		Btn.Paint = function(Obj, Sx, Sy) draw.RoundedBox(4, 0, 0, Sx, Sy, VC.Color.Accent_Light) draw.RoundedBox(4, 2, 2, Sx-4, Sy-4, VC.Color.Base) end
	end)
end)

// Create the "C menu" icon
list.Set("DesktopWindows", "VCMod", {title = "VCMod Menu", icon = "vcmod/icon_red_border.png", init = function(icon, window) window:Close() VC.OpenMenu() end})
--PATH addons/vcmod_main_autoupdate/lua/autorun/vc_load.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

AddCSLuaFile()

// This file is here solely to prevent version mismatch breaking usability.
--PATH addons/animation/lua/autorun/wiltos_animbase_loader.lua:

--[[-------------------------------------------------------------------
	Animation Base:
		Create your own animations, mount animations from other games, and more!
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
-------------------------------------------------------------------]]--[[
							  
	Lua Developer: King David
	Contact: http://steamcommunity.com/groups/wiltostech
		
----------------------------------------]]--


if SERVER then
	AddCSLuaFile( "wos/anim_extension/loader/loader.lua" )
end

include( "wos/anim_extension/loader/loader.lua" )
--PATH addons/zeros_lua_libary/lua/zclib/util/cl_atracker.lua:
if SERVER then return end
zclib = zclib or {}

/*
	Keep track on cached fonts which are created
*/
zclib.CachedFonts = zclib.CachedFonts or {}
local oldFontFunc = surface.CreateFont
function surface.CreateFont(name,data)
	//print("surface.CreateFont: "..name)
	zclib.CachedFonts[name] = true
	oldFontFunc(name,data)
end
concommand.Add("zclib_print_fonts", function(ply, cmd, args)
	PrintTable(zclib.CachedFonts)
end)


/*
	Keep track on cached fonts which are created
*/
zclib.CachedEffects = zclib.CachedEffects or {}
local oldPrecacheFunc = PrecacheParticleSystem
function PrecacheParticleSystem(name)
	zclib.CachedEffects[name] = true
	hook.Run("zclib_OnParticleSystemPrecached", name)
	oldPrecacheFunc(name)
end

function zclib.GetCachedEffects()
	local FoundEffects = {}

	for k, v in pairs(zclib.CachedEffects) do
		table.insert(FoundEffects, k)
	end

	return FoundEffects
end

timer.Simple(2,function()
	for k,v in pairs(zclib.CachedEffects) do
		hook.Run("zclib_OnParticleSystemPrecached", k)
	end
end)
concommand.Add("zclib_print_effects", function(ply, cmd, args)
	PrintTable(zclib.CachedEffects)
end)

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_table.lua:
zclib = zclib or {}
zclib.table = zclib.util or {}



// Creates a new randomized table from the input table
function zclib.table.randomize( t )
	local out = { }

	while #t > 0 do
		table.insert( out, table.remove( t, math.random( #t ) ) )
	end

	return out
end

function zclib.table.clean(tbl)
	local new_tbl = {}

	for k, v in pairs(tbl) do
		if v then
			new_tbl[k] = v
		end
	end

	return new_tbl
end

function zclib.table.ToString(tbl)
	local str = ""

	for k, v in pairs(tbl) do
		str = str .. k .. ", "
	end

	return str
end

function zclib.table.JobToString(tbl)
	local str = ""

	for k, v in pairs(tbl) do
		str = str .. team.GetName(k) .. ", "
	end

	return str
end

function zclib.table.invert(tbl)
	local new = {}

	for k, v in pairs(tbl) do
		new[v] = true
	end

	return new
end

--PATH addons/zeros_lua_libary/lua/zclib/util/cl_atracker.lua:
if SERVER then return end
zclib = zclib or {}

/*
	Keep track on cached fonts which are created
*/
zclib.CachedFonts = zclib.CachedFonts or {}
local oldFontFunc = surface.CreateFont
function surface.CreateFont(name,data)
	//print("surface.CreateFont: "..name)
	zclib.CachedFonts[name] = true
	oldFontFunc(name,data)
end
concommand.Add("zclib_print_fonts", function(ply, cmd, args)
	PrintTable(zclib.CachedFonts)
end)


/*
	Keep track on cached fonts which are created
*/
zclib.CachedEffects = zclib.CachedEffects or {}
local oldPrecacheFunc = PrecacheParticleSystem
function PrecacheParticleSystem(name)
	zclib.CachedEffects[name] = true
	hook.Run("zclib_OnParticleSystemPrecached", name)
	oldPrecacheFunc(name)
end

function zclib.GetCachedEffects()
	local FoundEffects = {}

	for k, v in pairs(zclib.CachedEffects) do
		table.insert(FoundEffects, k)
	end

	return FoundEffects
end

timer.Simple(2,function()
	for k,v in pairs(zclib.CachedEffects) do
		hook.Run("zclib_OnParticleSystemPrecached", k)
	end
end)
concommand.Add("zclib_print_effects", function(ply, cmd, args)
	PrintTable(zclib.CachedEffects)
end)

--PATH addons/zeros_lua_libary/lua/zclib/util/player/sh_player.lua:
zclib = zclib or {}
zclib.Player = zclib.Player or {}

zclib.Player.List = zclib.Player.List or {}

if SERVER then
	util.AddNetworkString("zclib_Player_Send")
	function zclib.Player.Send(plytbl,sendto)

		// Better save then sorry
		local cleantbl = {}
		for k,v in pairs(plytbl) do
			if IsValid(v) then
				table.insert(cleantbl,v)
			end
		end

		local length = table.Count(cleantbl)
		net.Start("zclib_Player_Send")
		net.WriteUInt(length,15)
		for k,v in pairs(cleantbl) do
			net.WriteEntity(v)
		end
		net.Send(sendto)
	end
else
	net.Receive("zclib_Player_Send", function(len)
		zclib.Debug_Net("zclib_Player_Send", len)
		local length = net.ReadUInt(15)
		for i = 1,length do
			local ply = net.ReadEntity()
			if IsValid(ply) then
				zclib.Player.Add(ply)
			end
		end
	end)
end

function zclib.Player.Add(ply)
    zclib.Player.List[zclib.Player.GetID(ply)] = ply
	if SERVER then

		// Tell the other players that this player just joined
		zclib.Player.Send({ply},zclib.Player.GetAll())

		// Tell this player about the other players
		zclib.Player.Send(zclib.Player.GetAll(),ply)
	end
end

function zclib.Player.GetAll()
	local cleantbl = {}
	for k,v in pairs(zclib.Player.List) do
		if IsValid(v) then
			table.insert(cleantbl,v)
		end
	end
	return cleantbl
end

/*
	A timer that auto updates the Playerlist ever 10 minutes
*/
zclib.Timer.Remove("zclib.Player.GetAll")
zclib.Timer.Create("zclib.Player.GetAll",600,0,function()
	for k,v in player.Iterator() do
		if IsValid(v) then
			zclib.Player.List[zclib.Player.GetID(v)] = v
		end
	end
end)

// Returns a list of all the players who are close enough to the provided distance
function zclib.Player.GetInSphere(pos,radius)
    local tbl = {}
    for k,v in pairs(zclib.Player.List) do
        if IsValid(v) and zclib.util.InDistance(v:GetPos(), pos, radius) then
            tbl[v] = true
        end
    end
    return tbl
end

// Returns the steam id of the player
function zclib.Player.GetID(ply)
    if ply:IsBot() then
        return ply:UserID()
    else
        return ply:SteamID()
    end
end

// Returns the name of the player
function zclib.Player.GetName(ply)
    if ply:IsBot() then
        return "Bot_" .. ply:UserID()
    else
        return ply:Nick()
    end
end

// Returns the player rank / usergroup
function zclib.Player.GetRank(ply)
	if ply.GetSecondaryUserGroup then
		local rank = ply:GetSecondaryUserGroup()
		if rank == "user" then rank = ply:GetUserGroup() end
		if rank == "" then rank = ply:GetUserGroup() end
		if rank == " " then rank = ply:GetUserGroup() end
		if rank == "  " then rank = ply:GetUserGroup() end
		return rank
	else
		return ply:GetUserGroup()
	end
end

// Checks if the player has one of the specified ranks
function zclib.Player.RankCheck(ply, ranks)
	if not IsValid(ply) or ranks == nil then return false end
	if table.Count(ranks) <= 0 then return true end

	if xAdmin then
		local HasRank = false

		for k, v in pairs(ranks) do
			if ply:IsUserGroup(k) then
				HasRank = true
				break
			end
		end

		return HasRank
	else
		if ranks[ zclib.Player.GetRank(ply) ] == nil then
			return false
		else
			return true
		end
	end
end

function zclib.Player.JobCheck(ply, jobs)
    if not IsValid(ply) or jobs == nil then return false end
    if table.Count(jobs) <= 0 then return true end

    return jobs[zclib.Player.GetJobName(ply)] ~= nil
end

// Returns the players job
function zclib.Player.GetJob(ply)
    if not IsValid(ply) then return -1 end
    return ply:Team()
end

// Returns the players job command
function zclib.Player.GetJobCommand(ply)
    if not IsValid(ply) then return "" end
	local jobtbl = RPExtraTeams[ply:Team()]
	if not jobtbl then return "" end
    return jobtbl.command
end

// Returns the players job name
function zclib.Player.GetJobName(ply)
    if not IsValid(ply) then return "Invalid" end
    return team.GetName(zclib.Player.GetJob(ply))
end

// Gets the position of the players head
function zclib.Player.GetHeadPos(ply)
    local pos = ply:GetPos() + ply:GetUp() * 25
    local attachID = ply:LookupAttachment("eyes")
    if attachID then
        local attach = ply:GetAttachment(attachID)
        if attach then
            pos = attach.Pos
        end
    end
    return pos
end


// This returns true if the player is a admin
function zclib.Player.IsAdmin(ply)
    if IsValid(ply) then

        // xAdmin Support
        if xAdmin then
            return ply:IsAdmin()

        // SAM Support
        elseif sam then
            return ply:IsSuperAdmin()

        // sAdmin support
        elseif sAdmin then
            return ply:IsAdmin()

        elseif ply:IsSuperAdmin() == true then
            return true
        elseif ply.IsAdmin and ply:IsAdmin() == true then
            return true
        else
            if zclib.config.AdminRanks[zclib.Player.GetRank(ply)] then

                return true
            else

                return false
            end
        end
    else
        return false
    end
end

if SERVER then

	// This saves the owners SteamID
	function zclib.Player.SetOwner(ent, ply)

		if (IsValid(ply)) then
			ent:SetNWString("zclib_Owner", ply:SteamID())

			if CPPI then
				ent:CPPISetOwner(ply)
			end

			if gProtect and istable(gProtect) then
				gProtect.SetOwner(ply,ent)
			end
		else
			ent:SetNWString("zclib_Owner", "world")
		end
	end
end

// This returns the entites owner SteamID
function zclib.Player.GetOwnerID(ent)
	return ent:GetNWString("zclib_Owner", "nil")
end

// Checks if both entities have the same owner
function zclib.Player.SharedOwner(ent01,ent02)
	if IsValid(ent01) and IsValid(ent02) then

		if zclib.Player.GetOwnerID(ent01) == zclib.Player.GetOwnerID(ent02) then
			return true
		else
			return false
		end
	else
		return false
	end
end

// This returns the owner
function zclib.Player.GetOwner(ent)
	if IsValid(ent) then

		local id = ent:GetNWString("zclib_Owner", "nil")
		local ply = player.GetBySteamID(id)
		if IsValid(ply) then return ply end

		ply = ent:GetOwner()
		if IsValid(ply) then return ply end


		if gProtect then ply = gProtect.GetOwner(ent) end
		if IsValid(ply) then return ply end

		if ent.CPPIGetOwner then ply = ent:CPPIGetOwner() end
		if IsValid(ply) then return ply end

		return false
	else
		return false
	end
end

// Checks if the player is the owner of the entitiy
function zclib.Player.IsOwner(ply, ent)
	if IsValid(ent) and IsValid(ply) then
		local id = ent:GetNWString("zclib_Owner", "nil")
		local ply_id = ply:SteamID()

		if id == ply_id or id == "world" then

			return true
		else
			return false
		end
	else
		return false
	end
end

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_pointer.lua:
if SERVER then return end

zclib = zclib or {}
zclib.PointerSystem = zclib.PointerSystem or {}

/*

    This system handles the Left / Right Mouse Click logic and displays a 2d colored rope from one Point to another
         Gets used by: Extinguisher(Extinguish Object), PointerSystem(MoveLiquid), Equipment(Build,Move,Remove,Repair)

*/

zclib.PointerSystem.Data = {
    // Stores what entity is the liquid comming from
    From = nil,

    // Will Later be filled with the DummyClientModel
    PreviewModel = nil,

    // The position we are currently aiming at
    Pos = nil,

    // The entity we are currently aiming at
    HitEntity = nil,

    // A valid found target, can be a entity or a position
    Target = nil,

    // Displays on the screen what action is currently active
    ActionName = "Test",

    CancelName = zclib.Language["Cancel"],
}


local IsLeftClickDown = false
local IsRightClickDown = false

local function ClearDummy()
    if IsValid(zclib.PointerSystem.Data.PreviewModel) then
        zclib.ClientModel.Remove(zclib.PointerSystem.Data.PreviewModel)
        zclib.PointerSystem.Data.PreviewModel = nil
    end
end

local function CreateDummy(pos, model)
    ClearDummy()
    local ent = zclib.ClientModel.AddProp()
    if not IsValid(ent) then return end
    ent:SetPos(pos)
    ent:SetModel(model)
    ent:SetAngles(angle_zero)
    ent:Spawn()

    ent:SetRenderMode(RENDERMODE_TRANSCOLOR)
    zclib.PointerSystem.Data.PreviewModel = ent
end

// Starts the pointer system
function zclib.PointerSystem.Start(Machine,OnInit,OnLeftClick,MainLogic,HUDLogic,OnRightClick,PostDrawTranslucentRenderables,OnClose)
    zclib.Debug("zclib.PointerSystem.Start")

    if zclib.PointerSystem.Data.CancelName == nil then zclib.PointerSystem.Data.CancelName = zclib.Language["Cancel"] end

    ClearDummy()

    zclib.PointerSystem.Data.From = Machine

    // Can be used to add something on the hud
    zclib.PointerSystem.Data.HUDLogic = HUDLogic

    // Can be used to setup some main data like (Default Rope color)
    pcall(OnInit)

    // What should happen when the player left clicks (Confirms a action)
    zclib.PointerSystem.Data.OnLeftClick = OnLeftClick

    zclib.PointerSystem.Data.OnRightClick = OnRightClick

	zclib.PointerSystem.Data.OnClose = OnClose

	zclib.PointerSystem.Data.PostDrawTranslucentRenderables = PostDrawTranslucentRenderables

    // This function will later run some core logic of what data should be stored etc
    zclib.PointerSystem.Data.MainLogic = MainLogic

    zclib.PointerSystem.StartHook()
end

// Stops the pointer system
function zclib.PointerSystem.Stop()
    zclib.Debug("zclib.PointerSystem.Stop")

    ClearDummy()

	if zclib.PointerSystem.Data.OnClose then pcall(zclib.PointerSystem.Data.OnClose) end

	zclib.PointerSystem.FinishHook()

    zclib.PointerSystem.Data = {}
end

function zclib.PointerSystem.StartHook()

    local ply = LocalPlayer()

    zclib.Hook.Remove("Think", "PointerSystem")
    zclib.Hook.Add("Think", "PointerSystem", function(depth, skybox)
        zclib.PointerSystem.MainLogic(ply)
        IsLeftClickDown = input.IsMouseDown(MOUSE_LEFT)
        IsRightClickDown = input.IsMouseDown(MOUSE_RIGHT)
    end)

    zclib.Hook.Remove(zclib.PointerSystem.Data.RenderHook2D or "HUDPaint", "PointerSystem")
    zclib.Hook.Add(zclib.PointerSystem.Data.RenderHook2D or "HUDPaint", "PointerSystem", function()
        zclib.PointerSystem.Paint()
    end)

    zclib.Hook.Remove("PostDrawTranslucentRenderables", "PointerSystem")
    zclib.Hook.Add("PostDrawTranslucentRenderables", "PointerSystem", function(depth, bDrawingSkybox,isDraw3DSkybox )
        if isDraw3DSkybox == false then zclib.PointerSystem.PostDrawTranslucentRenderables() end
    end)
end

function zclib.PointerSystem.FinishHook()
    zclib.Hook.Remove("Think", "PointerSystem")
    zclib.Hook.Remove(zclib.PointerSystem.Data.RenderHook2D or "HUDPaint", "PointerSystem")
    zclib.Hook.Remove("PostDrawTranslucentRenderables", "PointerSystem")
end



// Draws the indicator line for the pointer system and also handles the trace for detecting the entity the player is left click on to
local LinePoints = nil
local gravity = Vector(0, 0, -3)
local damping = 0.9
local Length = 10
function zclib.PointerSystem.Paint()
    if zclib.PointerSystem.Data.From then

        // Render the rope
        if zclib.PointerSystem.Data.Pos then

            local r_start = zclib.PointerSystem.Data.RopeStart

			if IsValid(zclib.PointerSystem.Data.From) then
				if isentity(zclib.PointerSystem.Data.From) then
					r_start = zclib.PointerSystem.Data.RopeStart or zclib.PointerSystem.Data.From:GetPos()
				else
					r_start = zclib.PointerSystem.Data.RopeStart or zclib.PointerSystem.Data.From
				end
			end

            // Create rope points
            if LinePoints == nil then
                LinePoints = zclib.Rope.Setup(Length, r_start)
            end

            // Updates the Rope points to move physicly
            if LinePoints and table.Count(LinePoints) > 0 then
                zclib.Rope.Update(LinePoints, r_start, zclib.PointerSystem.Data.Pos, Length, gravity, damping)
            end

            // Draw the rope
            zclib.Rope.Draw(LinePoints, r_start, zclib.PointerSystem.Data.Pos, Length, zclib.Materials.Get("beam01"), zclib.Materials.Get("glow01"), zclib.PointerSystem.Data.MainColor)
        else
            LinePoints = nil
        end
    else
        LinePoints = nil
    end

    // Draw Action Hud indicator
    draw.SimpleText(zclib.PointerSystem.Data.ActionName, zclib.GetFont("zclib_font_big"), zclib.wM *  650, zclib.hM * 895, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    surface.SetDrawColor(color_white)
    surface.SetMaterial(zclib.Materials.Get("icon_mouse_left"))
    surface.DrawTexturedRect(zclib.wM * 560, zclib.hM * 860,zclib.wM * 80, zclib.hM * 80)

    draw.SimpleText(zclib.PointerSystem.Data.CancelName, zclib.GetFont("zclib_font_big"), zclib.wM * 1350, zclib.hM * 895, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    surface.SetDrawColor(color_white)
    surface.SetMaterial( zclib.Materials.Get("icon_mouse_right"))
    surface.DrawTexturedRect(zclib.wM * 1360, zclib.hM * 860,zclib.wM * 80, zclib.hM * 80)

    if zclib.PointerSystem.Data.HUDLogic then pcall(zclib.PointerSystem.Data.HUDLogic) end
end

function zclib.PointerSystem.PostDrawTranslucentRenderables()
    // Render Remove Material
    if zclib.PointerSystem.Data and IsValid(zclib.PointerSystem.Data.PreviewModel) and zclib.PointerSystem.Data.PreviewModel:GetNoDraw() == false then
        render.MaterialOverride(zclib.Materials.Get("highlight"))
        render.SetColorModulation((1 / 255) * zclib.PointerSystem.Data.MainColor.r, (1 / 255) * zclib.PointerSystem.Data.MainColor.g, (1 / 255) * zclib.PointerSystem.Data.MainColor.b)
        zclib.PointerSystem.Data.PreviewModel:DrawModel()
        render.MaterialOverride()
        render.SetColorModulation(1, 1, 1)
    end

	if zclib.PointerSystem.Data.PostDrawTranslucentRenderables then pcall(zclib.PointerSystem.Data.PostDrawTranslucentRenderables) end
end


local NextAction = CurTime()
function zclib.PointerSystem.Wait()
    NextAction = CurTime() + 0.25
end

local function LeftClick(func)
    if IsLeftClickDown == false and input.IsMouseDown(MOUSE_LEFT) == true then
        IsLeftClickDown = true

        pcall(func)

        zclib.PointerSystem.Wait()
    end
end

local function RightClick(func)
    if IsRightClickDown == false and input.IsMouseDown(MOUSE_RIGHT) == true then
        IsRightClickDown = true

        if zclib.PointerSystem.Data.OnRightClick then pcall(zclib.PointerSystem.Data.OnRightClick) end

        pcall(func)

        zclib.PointerSystem.Wait()
    end
end

function zclib.PointerSystem.MainLogic(ply)

    // Stop if the player is dead
    if not IsValid(ply) or ply:Alive() == false then
        zclib.PointerSystem.Stop()
        return
    end

    // Stop if the start entity got invalid
    if not zclib.PointerSystem.Data.From then
        zclib.PointerSystem.Stop()
        return
    end

    // Execute right click function, is mostlikely just cancel
    RightClick(function()

        zclib.PointerSystem.Stop()
        surface.PlaySound("UI/buttonclickrelease.wav")
        return
    end)

    // Trace for data
    local c_trace = zclib.util.TraceLine({
        start = ply:EyePos(),
        endpos = ply:EyePos() + ply:EyeAngles():Forward() * 10000,
        filter = {ply,zclib.PointerSystem.Data.Ignore}
    }, "PointerSystemPointer")

    zclib.PointerSystem.Data.Hit = c_trace.Hit

    if c_trace.Hit then

        zclib.PointerSystem.Data.Pos = c_trace.HitPos
        zclib.PointerSystem.Data.HitEntity = c_trace.Entity
        zclib.PointerSystem.Data.HitNormal = c_trace.HitNormal

        if c_trace.HitNormal then
            zclib.PointerSystem.Data.Ang = c_trace.HitNormal:Angle()
            zclib.PointerSystem.Data.Ang:RotateAroundAxis(zclib.PointerSystem.Data.Ang:Right(),-90)
        end
    else
        zclib.PointerSystem.Data.Pos = nil
        zclib.PointerSystem.Data.HitEntity = nil
    end

    // If we have to wait then stop
    if NextAction > CurTime() then return end

    // Create Preview Model if none exist yet
    if not IsValid(zclib.PointerSystem.Data.PreviewModel) and zclib.PointerSystem.Data.Pos then
        CreateDummy(zclib.PointerSystem.Data.Pos, zclib.PointerSystem.Data.ModelOverwrite or "models/props_junk/PopCan01a.mdl")
        return
    end

    if zclib.PointerSystem.Data.Pos == nil then return end
    if zclib.PointerSystem.Data.Ang == nil then return end

    // Runs the main logic of the pointer system
    pcall(zclib.PointerSystem.Data.MainLogic)

    // Check if the user left clicked on a machine who wants the liquid
    LeftClick(function()
        pcall(zclib.PointerSystem.Data.OnLeftClick)
    end)
end

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_vgui.lua:
if SERVER then return end
zclib = zclib or {}
zclib.vgui = zclib.vgui or {}

zclib.hM = ScrH() / 1080
zclib.wM = zclib.hM

// Lets update the WindowSize Multiplicator if teh ScreenSize got changed
zclib.Hook.Add("OnScreenSizeChanged", "VGUIScaleReset", function(oldWidth, oldHeight)
	zclib.hM = ScrH() / 1080
	zclib.wM = zclib.hM

	zclib.Print("ScreenSize changed, Recalculating ScreenSize values.")
end)

// Plays a interface sound
function zclib.vgui.PlaySound(sound)
	surface.PlaySound(sound)
end

// Creates a notify + sound according to what view the player currntly has
function zclib.vgui.Notify(msg,msgType)
	local s_sound = nil

	if msgType == NOTIFY_GENERIC then
		s_sound = "common/bugreporter_succeeded.wav"
	elseif msgType == NOTIFY_ERROR then
		s_sound = "common/warning.wav"
	elseif msgType == NOTIFY_HINT then
		s_sound = "buttons/button15.wav"
	end

	zclib.vgui.PlaySound(s_sound)

	if msg and string.len(msg) > 0 then
		local dur = 0.2 * string.len(msg)
		notification.AddLegacy(msg, msgType, dur)
	end
end

function zclib.vgui.TextButton(_x,_y,_w,_h,parent,data,action,IsLocked,IsSelected)
	/*
		data = {
			Text01 = "Off"
			color
			txt_color
			locked
		}
	*/
	local button_pnl = vgui.Create("DButton", parent)
	button_pnl:SetPos(_x * zclib.wM, _y * zclib.hM)
	button_pnl:SetSize(_w * zclib.wM, _h * zclib.hM)
	button_pnl:SetAutoDelete(true)
	button_pnl:SetText("")

	button_pnl.Text01 = data.Text01
	button_pnl.color = data.color or zclib.colors["ui01"]
	button_pnl.txt_color = data.txt_color or zclib.colors["text01"]
	button_pnl.txt_font = data.txt_font or zclib.GetFont("zclib_font_big")
	button_pnl.locked = false

	local txtW,txtH = zclib.util.GetTextSize(button_pnl.Text01,button_pnl.txt_font)
	button_pnl.txt_length = txtW
	button_pnl.txt_height = txtH

	local round = 5

	button_pnl.Paint = function(s, w, h)

		draw.RoundedBox(round, 0, 0, w, h, s.color)

		if IsSelected then
			local _, result = xpcall(IsSelected, function() end, nil)

			if result then
				draw.RoundedBox(8, 0, 0, 8 * zclib.wM, h, zclib.colors["green01"])
			end
		end

		if s.Text01 then
			draw.SimpleText(s.Text01, s.txt_font, w / 2, h / 2, s.txt_color, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		end

		if s.locked == true then
			draw.RoundedBox(round, 0, 0, w, h, zclib.colors["black_a100"])
		else
			if IsLocked then
				local _, varg = xpcall(IsLocked, function() end, s)
				if varg then
					draw.RoundedBox(round, 0, 0, w, h, zclib.colors["black_a100"])
				else
					if s:IsHovered() then
						draw.RoundedBox(round, 0, 0, w, h, zclib.colors["white_a15"])
					end
				end
			else
				if s:IsHovered() then
					draw.RoundedBox(round, 0, 0, w, h, zclib.colors["white_a15"])
				end
			end
		end
	end

	button_pnl.DoClick = function(s)
		if s.locked == true then return end
		local _, varg = xpcall(IsLocked, function() end, nil)
		if varg == true then return end
		zclib.vgui.PlaySound("UI/buttonclick.wav")
		pcall(action,button_pnl)
	end
	return button_pnl
end

function zclib.vgui.Slider(parent,text,start_val,onChange)

	local p = vgui.Create("DButton", parent)
	p:SetSize(200 * zclib.wM,50 * zclib.hM )
	p.locked = false
	p.slideValue = start_val
	p:SetAutoDelete(true)
	p:SetText("")
	p.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, zclib.colors["black_a50"])

		draw.SimpleText(text, zclib.GetFont("zclib_font_medium"),5 * zclib.wM, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		draw.SimpleText(math.Round(s.slideValue * 100), zclib.GetFont("zclib_font_medium"),w - 5 * zclib.wM, h / 2, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

		local AreaW = w * 0.5
		local AreaX = w * 0.35
		draw.RoundedBox(4, AreaX, h * 0.5, AreaW, 2 * zclib.hM, color_black)


		local boxHeight = h * 0.5
		local boxPosX = AreaW * s.slideValue
		draw.RoundedBox(4, (AreaX - (boxHeight / 2)) + boxPosX, boxHeight / 2, boxHeight, boxHeight, zclib.colors["ui01"])

		if p.locked == true then
			draw.RoundedBox(4, 0, 0, w, h, zclib.colors["black_a100"])
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

function zclib.vgui.CheckBox(parent,text,state,onclick)

	local p = vgui.Create("DButton", parent)
	p:SetSize(200 * zclib.wM,50 * zclib.hM )
	p.locked = false
	p.state = state
	p.slideValue = 0
	p:SetAutoDelete(true)
	p:SetText("")
	p.Paint = function(s, w, h)
		//draw.RoundedBox(0, 0, 0, w, h, zclib.colors["ui01"])

		draw.RoundedBox(4, 0, 0, w, h, zclib.colors["black_a100"])

		//draw.SimpleText(text, zclib.GetFont("zclib_font_medium"),5 * zclib.wM, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)


		local BoxWidth = w
		local BoxHeight = h
		local BoxPosY = 0
		local BoxPosX = 0

		//draw.SimpleText(text, zclib.GetFont("zclib_font_medium"),w / 2, BoxHeight * 0.8, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.RoundedBox(4, BoxPosX, BoxPosY, BoxWidth, BoxHeight, zclib.colors["black_a100"])

		if s.state then
			s.slideValue = Lerp(5 * FrameTime(), s.slideValue, 1)
		else
			s.slideValue = Lerp(5 * FrameTime(), s.slideValue, 0)
		end

		local col = zclib.util.LerpColor(s.slideValue, zclib.colors["ui01"], zclib.colors["green01"])
		draw.RoundedBox(4, BoxPosX + (BoxWidth-BoxHeight) * s.slideValue, BoxPosY, BoxHeight, BoxHeight, col)

		if p.locked == true then
			draw.RoundedBox(4, BoxPosX, BoxPosY, BoxWidth, BoxHeight, zclib.colors["black_a100"])
		end
	end
	p.DoClick = function(s)
		if p.locked == true then return end
		zclib.vgui.PlaySound("UI/buttonclick.wav")
		s.state = not s.state
		pcall(onclick,s.state)
	end
	return p
end

function zclib.vgui.ImageButton(_x,_y,_w,_h,parent,image,OnClick,IsLocked,SoundOverwrite)
	local Button = vgui.Create("DButton", parent)
	Button:SetPos(_x , _y )
	Button:SetSize(_w, _h)
	Button:SetText("")
	Button.IconColor = zclib.colors["text01"]
	Button.NoneHover_IconColor = zclib.colors["ui01"]
	Button.Sound = SoundOverwrite or "UI/buttonclick.wav"
	Button.IconImage = image
	Button.Paint = function(s, w, h)
		if IsLocked then
			local _, varg = xpcall(IsLocked, function() end, nil)
			if varg or s:IsEnabled() == false then
				zclib.util.DrawOutlinedBox(0 * zclib.wM, 0 * zclib.hM, w, h, 2, zclib.colors["black_a50"])
				surface.SetDrawColor(zclib.colors["black_a50"])
				surface.SetMaterial(s.IconImage)
				surface.DrawTexturedRect(0, 0,w, h)
			else
				if s:IsHovered() then
					zclib.util.DrawOutlinedBox(0 * zclib.wM, 0 * zclib.hM, w, h, 2, zclib.colors["text01"])
					surface.SetDrawColor(s.IconColor)
					surface.SetMaterial(s.IconImage)
					surface.DrawTexturedRect(0, 0,w, h)
				else
					zclib.util.DrawOutlinedBox(0 * zclib.wM, 0 * zclib.hM, w, h, 2, s.NoneHover_IconColor)
					surface.SetDrawColor(s.NoneHover_IconColor)
					surface.SetMaterial(s.IconImage)
					surface.DrawTexturedRect(0, 0,w, h)
				end
			end
		else
			if s:IsHovered() then
				zclib.util.DrawOutlinedBox(0 * zclib.wM, 0 * zclib.hM, w, h, 2, zclib.colors["text01"])
				surface.SetDrawColor(s.IconColor)
				surface.SetMaterial(s.IconImage)
				surface.DrawTexturedRect(0, 0,w, h)
			else
				zclib.util.DrawOutlinedBox(0 * zclib.wM, 0 * zclib.hM, w, h, 2, s.NoneHover_IconColor)
				surface.SetDrawColor(s.NoneHover_IconColor)
				surface.SetMaterial(s.IconImage)
				surface.DrawTexturedRect(0, 0,w, h)
			end
		end
	end
	Button.DoClick = function(s)

		local _, varg = xpcall(IsLocked, function() end, nil)
		if varg == true then return end

		zclib.vgui.PlaySound(s.Sound)

		s:SetEnabled(false)

		timer.Simple(0.25, function() if IsValid(s) then s:SetEnabled(true) end end)

		pcall(OnClick,s)
	end
	return Button
end

function zclib.vgui.TextEntry(parent, emptytext,onchange,hasrefreshbutton,onRefresh)
	local p = vgui.Create("DTextEntry", parent)
	p:SetSize(200 * zclib.wM,50 * zclib.hM )
	p:SetPaintBackground(false)
	p:SetAutoDelete(true)
	p:SetUpdateOnType(true)
	p.font = zclib.GetFont("zclib_font_small")
	p.bg_color = zclib.colors["ui01"]
	p.Emptytext = emptytext
	p.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, s.bg_color)
		//draw.RoundedBox(4, 0, 0, w, h, zclib.colors["red01"])

		if s:GetText() == "" and not s:IsEditing() then
			draw.SimpleText(s.Emptytext, s.font, 5 * zclib.wM, h / 2, zclib.colors["white_a15"], 0, 1)
		end

		s:DrawTextEntryText(color_white, zclib.colors["textentry"], color_white)
	end
	p:SetDrawLanguageID(false)
	p.OnValueChange = function(s,val)
		pcall(onchange,val)
	end

	function p:PerformLayout(width, height)
		self:SetFontInternal(self.font)
	end

	if hasrefreshbutton then
		local b = vgui.Create("DButton",p)
		b:SetText("")
		b:SetSize(50 * zclib.wM, 50 * zclib.hM )
		b:Dock(RIGHT)
		b.DoClick = function()
			onRefresh(p:GetText())
		end
		b.Paint = function(s, w, h)
			surface.SetDrawColor(zclib.colors["textentry"])
			surface.SetMaterial(zclib.Materials.Get("refresh"))
			surface.DrawTexturedRect(5 * zclib.wM, 5 * zclib.hM, h - 10 * zclib.hM,h - 10 * zclib.hM)
		end

		p.b = b

		timer.Simple(0,function()
			if IsValid(b) and IsValid(p) then
				b:SetPos(p:GetWide() - 50 * zclib.wM,0 * zclib.hM  )
			end
		end)
	end

	return p
end

function zclib.vgui.ModelPanel(data)
	local model_pnl = vgui.Create("DModelPanel")
	model_pnl:SetPos(0 * zclib.wM, 0 * zclib.hM)
	model_pnl:SetSize(50 * zclib.wM, 50 * zclib.hM)
	model_pnl:SetVisible(false)
	model_pnl:SetAutoDelete(true)
	model_pnl.LayoutEntity = function(self) end

	if data and data.model then

		model_pnl:SetModel(zclib.CacheModel(data.model))

		if not IsValid(model_pnl.Entity) then
			model_pnl:SetVisible(true)
			zclib.Print("Could not create DModel Panel, Clientmodel Limit reached?")
			return model_pnl
		end

		local min, max = model_pnl.Entity:GetRenderBounds()
		local size = 0
		size = math.max(size, math.abs(min.x) + math.abs(max.x))
		size = math.max(size, math.abs(min.y) + math.abs(max.y))
		size = math.max(size, math.abs(min.z) + math.abs(max.z))

		// Force the model to look good, aka no lod reduction
		model_pnl.Entity:SetLOD( 0 )

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

function zclib.vgui.DAdjustableModelPanel(data)
	local model_pnl = vgui.Create("DAdjustableModelPanel")
	model_pnl:SetPos(0 * zclib.wM, 0 * zclib.hM)
	model_pnl:SetSize(50 * zclib.wM, 50 * zclib.hM)
	model_pnl:SetVisible(false)
	model_pnl:SetAutoDelete(true)
	model_pnl.LayoutEntity = function(self) end

	if data and data.model then

		model_pnl:SetModel(zclib.CacheModel(data.model))

		if not IsValid(model_pnl.Entity) then
			model_pnl:SetVisible(true)
			zclib.Print("Could not create DModel Panel, Clientmodel Limit reached?")
			return model_pnl
		end

		local min, max = model_pnl.Entity:GetRenderBounds()
		local size = 0
		size = math.max(size, math.abs(min.x) + math.abs(max.x))
		size = math.max(size, math.abs(min.y) + math.abs(max.y))
		size = math.max(size, math.abs(min.z) + math.abs(max.z))

		// Force the model to look good, aka no lod reduction
		model_pnl.Entity:SetLOD( 0 )

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



function zclib.vgui.Panel(parent, name)
	local m = vgui.Create("DPanel", parent)
	m:SetSize(600 * zclib.wM, 600 * zclib.hM)
	m:DockMargin(50 * zclib.wM, 10 * zclib.hM, 50 * zclib.wM, 0 * zclib.hM)

	if name then
		m:DockPadding(0, 50 * zclib.hM, 0, 0)
	else
		m:DockPadding(0, 0 , 0, 0)
	end

	m:Dock(TOP)

	m.Title_text = name
	m.Title_font = zclib.GetFont("zclib_font_medium")
	m.Title_color = zclib.colors["orange01"]
	m.BG_color = zclib.colors["ui01"]

	m.Paint = function(s, w, h)
		draw.RoundedBox(5, 0, 0, w, h, s.BG_color)
		if s.Title_text then
			draw.SimpleText(s.Title_text, s.Title_font, 10 * zclib.wM, 10 * zclib.hM, s.Title_color, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end
	end

	m:InvalidateLayout(true)
	m:InvalidateParent(true)

	return m
end

function zclib.vgui.ComboBox(parent,default,OnSelect)

    local DComboBox = vgui.Create( "DComboBox", parent )
    DComboBox:SetSize(200 * zclib.wM, 50 * zclib.hM)
    DComboBox:DockMargin(240 * zclib.wM,0 * zclib.hM,0 * zclib.wM,0 * zclib.hM)
    DComboBox:Dock(FILL)
    if default then DComboBox:SetValue(default) end
    DComboBox:SetColor(zclib.colors["text01"] )
    DComboBox.Paint = function(s, w, h) draw.RoundedBox(4, 0, 0, w, h, zclib.colors["black_a50"]) end
    DComboBox.OnSelect = function( s, index, value ,data_val) pcall(OnSelect,index,value,DComboBox,data_val) end

    return DComboBox
end

function zclib.vgui.Colormixer(parent,default,OnChange,OnValueChangeStop)
    local colmix = vgui.Create("DColorMixer", parent)
    colmix:SetSize(240 * zclib.wM, 100 * zclib.hM)
    colmix:DockMargin(10 * zclib.wM,40 * zclib.hM,10 * zclib.wM,0 * zclib.hM)
    colmix:Dock(FILL)
    colmix:SetPalette(false)
    colmix:SetAlphaBar(false)
    colmix:SetWangs(true)
    colmix:SetColor(default or color_white)
    colmix.ValueChanged = function(s,col)
        pcall(OnChange,col,s)

        zclib.Timer.Remove("zclib_colormixer_delay")
        zclib.Timer.Create("zclib_colormixer_delay",0.1,1,function()
            pcall(OnValueChangeStop,col,s)
        end)
    end

    return colmix
end

function zclib.vgui.Page(title, content, desc)
	if IsValid(zclib_main_panel) then zclib_main_panel:Remove() end

    local mainframe = vgui.Create("DFrame")
    mainframe:SetSize(1000 * zclib.wM, 800 * zclib.hM)
    mainframe:Center()
    mainframe:MakePopup()
    mainframe:ShowCloseButton(false)
    mainframe:SetTitle("")
    mainframe:SetDraggable(true)
    mainframe:SetSizable(false)
    mainframe:DockPadding(0, 15 * zclib.hM, 0, 30 * zclib.hM)

    mainframe.Paint = function(s, w, h)
        draw.RoundedBox(5, 0, 0, w, h, zclib.colors["ui02"])

        surface.SetMaterial(zclib.Materials.Get("grib_horizontal"))
        surface.SetDrawColor(zclib.colors["white_a5"])
        surface.DrawTexturedRectUV(0, 0, w, 20 * zclib.hM, 0, 0, w / (30 * zclib.hM), (20 * zclib.hM) / (20 * zclib.hM))

        if input.IsKeyDown(KEY_ESCAPE) and IsValid(mainframe) then
            mainframe:Close()
        end
    end

    zclib_main_panel = mainframe

	zclib_main_panel.Close = function()
		zclib.Inventory.RemoveSlotOptions()
		zclib.vgui.ActiveEntity = nil

		if IsValid(zclib_main_panel) then
			zclib_main_panel:Remove()
		end
	end

    local top_pnl = vgui.Create("DPanel", mainframe)
    top_pnl:SetSize(600 * zclib.wM, 80 * zclib.hM)
    top_pnl:Dock(TOP)
    top_pnl:DockPadding(10 * zclib.wM, 10 * zclib.hM, 10 * zclib.wM, 20 * zclib.hM)
    top_pnl:DockMargin(0 * zclib.wM, 0 * zclib.hM, 0 * zclib.wM, 10 * zclib.hM)
    top_pnl.Title_font = zclib.GetFont("zclib_font_big")
	top_pnl.title = title
    top_pnl.Paint = function(s, w, h)
        draw.RoundedBox(5, 50 * zclib.wM, h - 5 * zclib.hM, w, 5 * zclib.hM, zclib.colors["ui01"])

        if desc then
            draw.SimpleText(s.title, s.Title_font, 50 * zclib.wM, 30 * zclib.hM, zclib.colors["text01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText(desc, zclib.GetFont("zclib_font_mediumsmall_thin"), 50 * zclib.wM, 60 * zclib.hM, zclib.colors["orange01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(s.title, s.Title_font, 50 * zclib.wM, 35 * zclib.hM, zclib.colors["text01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    pcall(content, mainframe, top_pnl)

	mainframe:InvalidateLayout(true)
	mainframe:SizeToChildren(false,true)
	mainframe:Center()

	return mainframe
end

function zclib.vgui.AddSeperator(parent)
	local seperator = vgui.Create("DPanel", parent)
	seperator:SetSize(600 * zclib.wM, 5 * zclib.hM)
	seperator:Dock(TOP)
	seperator:DockMargin(50 * zclib.wM, 10 * zclib.hM, 50 * zclib.wM, 0 * zclib.hM)

	seperator.Paint = function(s, w, h)
		draw.RoundedBox(5, 0, 0, w, h, zclib.colors["ui01"])
	end

	return seperator
end

function zclib.vgui.List(parent)
	local scroll = vgui.Create("DScrollPanel", parent)
	scroll:Dock(FILL)
	scroll:DockMargin(10 * zclib.wM, 10 * zclib.hM, 10 * zclib.wM, 10 * zclib.hM)

	scroll.Paint = function(s, w, h)
		//draw.RoundedBox(0, 0, 0, w, h, zclib.colors["green01"])
	end

	local sbar = scroll:GetVBar()
	sbar:SetHideButtons(true)

	function sbar:Paint(w, h)
		draw.RoundedBox(5, w * 0.1, 0, w * 0.8, h, zclib.colors["black_a50"])
	end

	function sbar.btnUp:Paint(w, h)
	end

	function sbar.btnDown:Paint(w, h)
	end

	function sbar.btnGrip:Paint(w, h)
		draw.RoundedBox(5, w * 0.1, 0, w * 0.8, h, zclib.colors["text01"])
	end

	function scroll:JumpToChild(panel)
		self:InvalidateLayout(true)
		local _, y = self.pnlCanvas:GetChildPosition(panel)
		local _, h = panel:GetSize()
		y = y + h * 0.5
		y = y - self:GetTall() * 0.5
		self.VBar:AnimateTo(y, 0.01, 0, 0.5)
	end

	local list = vgui.Create("DIconLayout", scroll)
	list:Dock(FILL)
	list:SetSpaceY(10 * zclib.hM)
	list:SetSpaceX(10 * zclib.wM)
	list:DockMargin(10 * zclib.wM, 10 * zclib.hM, 10 * zclib.wM, 0 * zclib.hM)

	list.Paint = function(s, w, h)
		//draw.RoundedBox(0, 0, 0, w, h, zclib.colors["red01"])
	end

	list:Layout()

	return list, scroll
end

--PATH addons/bricks_gangs/lua/bricks_server/bricks_server_autorun_gangs.lua:
BRICKS_SERVER.GANGS = {}

local module = BRICKS_SERVER.Func.AddModule( "gangs", "Brick's Gangs", "materials/bricks_server/gangs.png", "1.7.2" )
module:AddSubModule( "achievements", "Achievements" )
module:AddSubModule( "associations", "Associations" )
module:AddSubModule( "leaderboards", "Leaderboards" )
module:AddSubModule( "printers", "Printers" )
module:AddSubModule( "storage", "Storage" )
module:AddSubModule( "territories", "Territories" )

hook.Add( "BRS.Hooks.BaseConfigLoad", "BricksServerHooks_BRS_BaseConfigLoad_Gangs", function()
    AddCSLuaFile( "bricks_server/bricks_gangs/sh_baseconfig.lua" )
    include( "bricks_server/bricks_gangs/sh_baseconfig.lua" )
end )

hook.Add( "BRS.Hooks.ClientConfigLoad", "BricksServerHooks_BRS_ClientConfigLoad_Gangs", function()
    AddCSLuaFile( "bricks_server/bricks_gangs/sh_clientconfig.lua" )
    include( "bricks_server/bricks_gangs/sh_clientconfig.lua" )
end )

hook.Add( "BRS.Hooks.DevConfigLoad", "BricksServerHooks_BRS_DevConfigLoad_Gangs", function()
    AddCSLuaFile( "bricks_server/bricks_gangs/sh_devconfig.lua" )
    include( "bricks_server/bricks_gangs/sh_devconfig.lua" )
end )

if( SERVER ) then
    KostilWork( "2136421687" ) -- Brick's Server

    hook.Add( "BRS.Hooks.SQLLoad", "BricksServerHooks_BRS_SQLLoad_Gangs", function()
        if( BRICKS_SERVER.GANGS.LUACFG.UseMySQL ) then
            include( "bricks_server/bricks_gangs/sv_mysql.lua" )
        else
            include( "bricks_server/bricks_gangs/sv_sqllite.lua" )
        end
    end )
end
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_main.lua:
net.Receive( "BRS.Net.SendConfig", function( len, ply )
    if( not BRICKS_SERVER.TEMP.Configs ) then
        BRICKS_SERVER.TEMP.Configs = {}
    end

    local uniqueStr = net.ReadString()
    local currentPart = net.ReadUInt( 5 )
    local totalParts = net.ReadUInt( 5 )
    local dataLen = net.ReadUInt( 16 )
    local partData = net.ReadData( dataLen )

    if( currentPart > 1 ) then
        if( BRICKS_SERVER.TEMP.Configs[uniqueStr] ) then
            BRICKS_SERVER.TEMP.Configs[uniqueStr] = BRICKS_SERVER.TEMP.Configs[uniqueStr] .. partData
        end
    else
        BRICKS_SERVER.TEMP.Configs[uniqueStr] = partData
    end

    if( currentPart == totalParts and BRICKS_SERVER.TEMP.Configs[uniqueStr] ) then
        if( totalParts > 1 and not BRICKS_SERVER.TEMP.Configs[uniqueStr] ) then return end

        local configUnCompressed = util.JSONToTable( util.Decompress( BRICKS_SERVER.TEMP.Configs[uniqueStr] ) ) or BRICKS_SERVER.BASECONFIG

        if( not BRICKS_SERVER.CONFIG ) then
            BRICKS_SERVER.CONFIG = table.Copy( configUnCompressed ) or {}
        else
            for k, v in pairs( configUnCompressed ) do
                BRICKS_SERVER.CONFIG[k] = v
            end
        end
    
        if( BRICKS_SERVER.Func.HasAdminAccess and BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
            BS_ConfigCopyTable = table.Copy( BRICKS_SERVER.CONFIG )
        end
    
        hook.Run( "BRS.Hooks.ConfigReceived", configUnCompressed )
    
        RunConsoleCommand( "spawnmenu_reload" )
    end
end )

local function GetImageFromURL( url, failFunc )
    local CRC = util.CRC( url )
    local Extension = string.Split( url, "." )
    Extension = Extension[#Extension] or "png"

    if( not file.Exists( "bricks_server/images", "DATA" ) ) then
        file.CreateDir( "bricks_server/images" )
    end
    
    if( file.Exists( "bricks_server/images/" .. CRC .. "." .. Extension, "DATA" ) ) then
        BRICKS_SERVER.CachedMaterials[url] = Material( "data/bricks_server/images/" .. CRC .. "." .. Extension )

        if( failFunc ) then
            failFunc( BRICKS_SERVER.CachedMaterials[url], key )
        end

        return BRICKS_SERVER.CachedMaterials[url], key
    else
        http.Fetch( url, function( body )
            file.Write( "bricks_server/images/" .. CRC .. "." .. Extension, body )
            BRICKS_SERVER.CachedMaterials[url] = Material( "data/bricks_server/images/" .. CRC .. "." .. Extension )

            if( failFunc ) then
                failFunc( BRICKS_SERVER.CachedMaterials[url], key )
            end
        end )
    end
end

BRICKS_SERVER.CachedMaterials = {}

function BRICKS_SERVER.Func.CacheImageFromURL( url, failFunc )
    BRICKS_SERVER.CachedMaterials[url] = false

    if( not BRICKS_SERVER.CachedMaterials[url] ) then
        BRICKS_SERVER.CachedMaterials[url] = GetImageFromURL( url, failFunc )
    end
end

function BRICKS_SERVER.Func.CacheImageFromFile( filePath, fileName )
    BRICKS_SERVER.CachedMaterials[fileName] = Material( filePath )
end

function BRICKS_SERVER.Func.GetImage( key, onGetFunc )
    if( BRICKS_SERVER.CachedMaterials[key] ) then
        if( onGetFunc ) then
            onGetFunc( BRICKS_SERVER.CachedMaterials[key], key )
        else
            return BRICKS_SERVER.CachedMaterials[key], key
        end
    else
        if( string.StartWith( key, "http") ) then
            BRICKS_SERVER.Func.CacheImageFromURL( key, onGetFunc )
        end
    end
end

local files, directories = file.Find( "materials/bricks_server/*", "GAME" )
for k, v in pairs( files ) do
    BRICKS_SERVER.CachedMaterials[v] = Material( "materials/bricks_server/" .. v )
end

net.Receive( "BRS.Net.ProfileAdminSend", function( len, ply )
	local requestedID64 = net.ReadString()
	local profileTable = net.ReadTable()

	if( not requestedID64 or not profileTable ) then return end
	local requestedPly = player.GetBySteamID64( requestedID64 )

	if( IsValid( requestedPly ) ) then
		if( IsValid( BS_ADMIN_PROFILE ) and BS_ADMIN_PROFILE:IsVisible() and BS_ADMIN_PROFILE.RefreshProfile ) then
			BS_ADMIN_PROFILE:RefreshProfile( requestedID64, profileTable )
		end
	else
		notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidPlayerProfile" ), 1, 5 )
	end
end )

function BRICKS_SERVER.Func.ConfigChange( moduleKey )
    if( not BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then return end

    if( (BS_ConfigsChanged or {})[moduleKey] ) then return end

    if( not BS_ConfigsChanged ) then
        BS_ConfigsChanged = {}
    end

    BS_ConfigsChanged[moduleKey] = true
end

function BRICKS_SERVER.Func.LoadClientConfig()
    BRICKS_SERVER.CLIENTCONFIG = BRICKS_SERVER.CLIENTCONFIG or {}

    for k, v in pairs( BRICKS_SERVER.BASECLIENTCONFIG ) do
        local type = v[2] or ""

        if( type == "number" or type == "bind" ) then
            BRICKS_SERVER.CLIENTCONFIG[k] = cookie.GetNumber( "bricks_server_" .. k, v[3] or 0 )
        elseif( type == "bool" ) then
            BRICKS_SERVER.CLIENTCONFIG[k] = tobool( cookie.GetNumber( "bricks_server_" .. k, v[3] or 0 ) )
        else
            BRICKS_SERVER.CLIENTCONFIG[k] = cookie.GetString( "bricks_server_" .. k, v[3] or "" )
        end
    end
end
BRICKS_SERVER.Func.LoadClientConfig()

function BRICKS_SERVER.Func.ChangeClientConfig( key, value )
    if( BRICKS_SERVER.BASECLIENTCONFIG[key] ) then
        BRICKS_SERVER.CLIENTCONFIG = BRICKS_SERVER.CLIENTCONFIG or {}

        if( BRICKS_SERVER.BASECLIENTCONFIG[key][2] and BRICKS_SERVER.BASECLIENTCONFIG[key][2] == "bool" ) then
            BRICKS_SERVER.CLIENTCONFIG[key] = value and 1 or 0
            cookie.Set( "bricks_server_" .. key, (value and 1 or 0) )
        else
            BRICKS_SERVER.CLIENTCONFIG[key] = value
            cookie.Set( "bricks_server_" .. key, value )
        end

        if( BRICKS_SERVER.BASECLIENTCONFIG[key][4] and isfunction( BRICKS_SERVER.BASECLIENTCONFIG[key][4] ) ) then
            BRICKS_SERVER.BASECLIENTCONFIG[key][4]( value )
        end
    end
end

function BRICKS_SERVER.Func.GetClientConfig( key )
    if( not BRICKS_SERVER.BASECLIENTCONFIG[key] ) then return end

    local type = BRICKS_SERVER.BASECLIENTCONFIG[key][2] or ""

    if( type == "number" ) then
        return BRICKS_SERVER.CLIENTCONFIG[key] or ((BRICKS_SERVER.BASECLIENTCONFIG[key] or {})[3] or 0)
    elseif( type == "string" ) then
        return BRICKS_SERVER.CLIENTCONFIG[key] or ((BRICKS_SERVER.BASECLIENTCONFIG[key] or {})[3] or "")
    elseif( type == "bind" ) then
        return BRICKS_SERVER.CLIENTCONFIG[key] or ((BRICKS_SERVER.BASECLIENTCONFIG[key] or {})[3] or 0)
    elseif( type == "bool" ) then
        return tobool( BRICKS_SERVER.CLIENTCONFIG[key] )
    end
end

function BRICKS_SERVER.Func.GetClientBind( key )
    if( not BRICKS_SERVER.BASECLIENTCONFIG[key] ) then return BRICKS_SERVER.Func.L( "unbound" ), 0 end

    local bindNum = BRICKS_SERVER.Func.GetClientConfig( key ) or BRICKS_SERVER.BASECLIENTCONFIG[key][3]
    if( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[bindNum] ) then
        return BRICKS_SERVER.DEVCONFIG.KEY_BINDS[bindNum], bindNum
    else
        return BRICKS_SERVER.Func.L( "unbound" ), bindNum
    end
end

function BRICKS_SERVER.Func.SetClientCookie( key, type, value )
    if( type == "bool" ) then
        cookie.Set( "bricks_server_cc_" .. key, value and 1 or 0 )
    else
        cookie.Set( "bricks_server_cc_" .. key, value )
    end
end

function BRICKS_SERVER.Func.GetClientCookie( key, type )
    if( type == "number" ) then
        return cookie.GetNumber( "bricks_server_cc_" .. key, 0 )
    elseif( type == "bool" ) then
        return tobool( cookie.GetNumber( "bricks_server_cc_" .. key, 0 ) )
    else
        return cookie.GetString( "bricks_server_cc_" .. key, "" )
    end
end

BRICKS_SERVER.ConfigPages = BRICKS_SERVER.ConfigPages or {}
function BRICKS_SERVER.Func.AddConfigPage( name, vguiElement, addon, shouldCreate )
    for k, v in pairs( BRICKS_SERVER.ConfigPages ) do
        if( v[2] == vguiElement ) then return end
    end

    table.insert( BRICKS_SERVER.ConfigPages, { name, vguiElement, addon, shouldCreate } )
end

BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "themes" ), "bricks_server_config_themes" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "groups" ), "bricks_server_config_groups" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "general" ), "bricks_server_config_general" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "itemWhitelisting" ), "bricks_server_config_itemwhitelist" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "rarities" ), "bricks_server_config_rarities" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "itemRarities" ), "bricks_server_config_itemrarities" )
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "languages" ), "bricks_server_config_languages" )
BRICKS_SERVER.Func.AddConfigPage( "NPCS", "bricks_server_config_npcs" )

function BRICKS_SERVER.Func.FillVariableConfigs( parent, configKey, configChanged, specialConfigs )
    if( not BRICKS_SERVER.BASECONFIG[configKey] or not parent or not IsValid( parent ) ) then return end

    local spacing = 5
    local gridWide = (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20
    local slotsWide = (ScrW() >= 1080 and 2) or 1
    local slotWide = (gridWide-((slotsWide-1)*spacing))/slotsWide
    local slotTall = 80

    if( not parent.grid or not IsValid( parent.grid ) ) then
        parent.grid = vgui.Create( "DIconLayout", parent )
        parent.grid:Dock( TOP )
        parent.grid:DockMargin( 0, 0, 0, 5 )
        parent.grid:SetTall( slotTall )
        parent.grid:SetSpaceY( spacing )
        parent.grid:SetSpaceX( spacing )
    end

    if( not parent.grid or not IsValid( parent.grid ) ) then return end

    local configs, specialConfigs = {}, specialConfigs or {}

    for k, v in pairs( BRICKS_SERVER.BASECONFIG[configKey] ) do
        if( isnumber( v ) or isstring( v ) or isbool( v ) ) then
            configs[k] = v
        end
    end

    if( specialConfigs ) then
        for k, v in pairs( specialConfigs ) do
            configs[k] = v
        end
    end

    for k, v in pairs( configs ) do
        parent.slots = (parent.slots or 0)+1
        local slots = parent.slots
        local slotsTall = math.ceil( slots/slotsWide )
        parent.grid:SetTall( (slotsTall*slotTall)+((slotsTall-1)*spacing) )

        local header = k
        if( istable( v ) and v[3] ) then
            header = v[3]
        end

        local description
        if( istable( v ) and v[2] ) then
            description = v[2]
        end

        local variableBack = parent.grid:Add( "DPanel" )
        variableBack:SetSize( slotWide, slotTall )
        variableBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

            draw.SimpleText( header, "BRICKS_SERVER_Font20", 10, 5, BRICKS_SERVER.Func.GetTheme( 5 ), 0, 0 )

            if( description ) then
                surface.SetFont( "BRICKS_SERVER_Font20" )
                local headerX, headerY = surface.GetTextSize( header )

                draw.SimpleText( description, "BRICKS_SERVER_Font20", 10+headerX+5, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
            end
        end

        if( not specialConfigs[k] and (isstring( v ) or isnumber( v )) ) then
            local valueEntryBack = vgui.Create( "DPanel", variableBack )
            valueEntryBack:Dock( BOTTOM )
            valueEntryBack:DockMargin( 10, 10, 10, 10 )
            valueEntryBack:SetTall( 40 )
            local Alpha = 0
            local valueEntry
            local color1 = BRICKS_SERVER.Func.GetTheme( 1 )
            valueEntryBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        
                if( valueEntry:IsEditing() ) then
                    Alpha = math.Clamp( Alpha+5, 0, 100 )
                else
                    Alpha = math.Clamp( Alpha-5, 0, 100 )
                end
                
                draw.RoundedBox( 5, 0, 0, w, h, Color( color1.r, color1.g, color1.b, Alpha ) )
            end

            if( isnumber( v ) ) then
                valueEntry = vgui.Create( "bricks_server_numberwang", valueEntryBack )
                valueEntry:Dock( FILL )
                valueEntry:SetMinMax( 0, 9999999999999 )
                valueEntry:SetValue( ((BS_ConfigCopyTable or BRICKS_SERVER.CONFIG)[configKey] or {})[k] or 0 )
                valueEntry.OnValueChanged = function( self2, value )
                    BS_ConfigCopyTable[configKey][k] = tonumber( valueEntry:GetValue() )
                    BRICKS_SERVER.Func.ConfigChange( configChanged )
                end
            else
                valueEntry = vgui.Create( "bricks_server_textentry", valueEntryBack )
                valueEntry:Dock( FILL )
                valueEntry:SetValue( ((BS_ConfigCopyTable or BRICKS_SERVER.CONFIG)[configKey] or {})[k] or "" )
                valueEntry.OnChange = function( self2, value )
                    BS_ConfigCopyTable[configKey][k] = valueEntry:GetValue()
                    BRICKS_SERVER.Func.ConfigChange( configChanged )
                end
            end
        elseif( specialConfigs[k] or isbool( v ) ) then
            local toggleButton = vgui.Create( "DButton", variableBack )
            toggleButton:Dock( BOTTOM )
            toggleButton:DockMargin( 10, 10, 10, 10 )
            toggleButton:SetTall( 40 )
            toggleButton:SetText( "" )
            local alpha = 0
            toggleButton.Paint = function( self2, w, h )
                local buttonText = BRICKS_SERVER.Func.L( "edit" )
                local buttonColor = BRICKS_SERVER.Func.GetTheme( 2 )
                local buttonDownColor = BRICKS_SERVER.Func.GetTheme( 1 )

                if( not specialConfigs[k] and isbool( v ) ) then
                    local enabled = BS_ConfigCopyTable[configKey][k]
                    buttonText = (enabled and BRICKS_SERVER.Func.L( "enabled" )) or BRICKS_SERVER.Func.L( "disabled" )
                    buttonColor = (enabled and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green) or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red
                    buttonDownColor = (enabled and BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen) or BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed
                end
    
                if( not self2:IsDown() and self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+5, 0, 200 )
                else
                    alpha = math.Clamp( alpha-5, 0, 255 )
                end
    
                draw.RoundedBox( 5, 0, 0, w, h, buttonColor )
    
                surface.SetAlphaMultiplier( alpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, buttonDownColor )
                surface.SetAlphaMultiplier( 1 )
    
                BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, buttonDownColor )
    
                draw.SimpleText( buttonText, "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            if( specialConfigs[k] and istable( v ) and v[1] ) then
                toggleButton.DoClick = v[1]
            else
                toggleButton.DoClick = function()
                    BS_ConfigCopyTable[configKey][k] = not BS_ConfigCopyTable[configKey][k]
                    BRICKS_SERVER.Func.ConfigChange( configChanged )
                end
            end
        end
    end
end

BRS_SERVER_OS_DIFF = 0

net.Receive( "BRS.Net.SendServerTime", function()
    local svrOSTime = net.ReadInt( 32 )
    local svrCurTime = net.ReadInt( 32 )

    BRS_SERVER_OS_DIFF = os.time()-svrOSTime+svrCurTime-CurTime()
end )

function BRICKS_SERVER.Func.GetServerTime()
    return os.time()-BRS_SERVER_OS_DIFF
end

net.Receive( "BRS.Net.OpenBrickServer", function()
    if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
        BS_ConfigsChanged = {}
        BS_ConfigCopyTable = table.Copy( BRICKS_SERVER.CONFIG )
    end

	if( not IsValid( BRICKS_SERVER_MENU ) ) then
		BRICKS_SERVER_MENU = vgui.Create( "bricks_server_menu" )
		BRICKS_SERVER_MENU:FillTabs()
    elseif( not BRICKS_SERVER_MENU:IsVisible() ) then
        BRICKS_SERVER_MENU:SetVisible( true )
        if( BRICKS_SERVER_MENU.FillProfile ) then BRICKS_SERVER_MENU.FillProfile() end
        if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
            hook.Run( "BRS.Hooks.RefreshConfig" )
            if( BRICKS_SERVER_MENU.FillPlayers ) then BRICKS_SERVER_MENU.FillPlayers() end
            if( BRICKS_SERVER_MENU.RefreshAdminPerms ) then BRICKS_SERVER_MENU.RefreshAdminPerms() end
        end
    end
end )

BRICKS_SERVER.AdminPlayerFunctions = {}
function BRICKS_SERVER.Func.AddAdminPlayerFunc( title, category, func )
    if( not BRICKS_SERVER.AdminPlayerFunctions ) then
        BRICKS_SERVER.AdminPlayerFunctions = {}
    end

    table.insert( BRICKS_SERVER.AdminPlayerFunctions, { title, category, func } )
end

BRICKS_SERVER.Func.AddAdminPlayerFunc( BRICKS_SERVER.Func.L( "profile" ), BRICKS_SERVER.Func.L( "view" ), function( ply ) 
    if( not IsValid( BS_ADMIN_PROFILE ) ) then
        BS_ADMIN_PROFILE = vgui.Create( "bricks_server_admin_profile" )
    end

    net.Start( "BRS.Net.ProfileAdminRequest" )
        net.WriteString( ply:SteamID64() or "" )
    net.SendToServer()
end )

concommand.Add( "brs_removeonclose", function( ply, cmd, args )
	BRS_REMOVEONCLOSE = not BRS_REMOVEONCLOSE
end )

hook.Add( "InitPostEntity", "BRS.InitPostEntity.NetworkReady", function()
	net.Start( "BRS.Net.SendNetworkReady" )
	net.SendToServer()
end )

net.Receive( "BRS.Net.SendTopNotification", function()
    local text = net.ReadString()
    local time = net.ReadUInt( 8 ) or 5
    local color = net.ReadColor() or BRICKS_SERVER.Func.GetTheme( 5 )

    BRICKS_SERVER.Func.CreateTopNotification( text, time, color )
end )

net.Receive( "BRS.Net.SendNotification", function()
    local text = net.ReadString()
    local type = net.ReadUInt( 8 ) or 1
    local time = net.ReadUInt( 8 ) or 3

    notification.AddLegacy( text, type, time )
end )

net.Receive( "BRS.Net.SendChatNotification", function()
    chat.AddText( net.ReadColor(), net.ReadString(), " ", net.ReadColor(), net.ReadString() )
end )

net.Receive( "BRS.Net.UseMenuNPC", function()
    local vguiElement = net.ReadString()
    local title = net.ReadString()

    if( not vguiElement ) then return end

    if( IsValid( BRICKS_SERVER.TEMP.NPCMenu ) ) then
        BRICKS_SERVER.TEMP.NPCMenu:Remove()
    end

    BRICKS_SERVER.TEMP.NPCMenu = vgui.Create( "bricks_server_dframe" )
	BRICKS_SERVER.TEMP.NPCMenu:SetHeader( title )
    BRICKS_SERVER.TEMP.NPCMenu:SetSize( ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth, ScrH()*0.65 )
    BRICKS_SERVER.TEMP.NPCMenu:Center()
    
    local vguiPanel = vgui.Create( vguiElement, BRICKS_SERVER.TEMP.NPCMenu )
    vguiPanel:Dock( FILL )
    if( vguiPanel.FillPanel ) then
        vguiPanel:FillPanel()
    end
end )

function BRICKS_SERVER.Func.SendAdminConfig()
    if( BS_ConfigsChanged and table.Count( BS_ConfigsChanged ) > 0 ) then
        local configToSend = {}
        for k, v in pairs( BS_ConfigsChanged ) do
            if( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG)[k] ) then
                configToSend[k] = (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG)[k]
            end
        end

        local configData = util.Compress( util.TableToJSON( configToSend ) )

        net.Start( "BRS.Net.UpdateConfig" )
            net.WriteData( configData, string.len( configData ) )
        net.SendToServer()
    end
end
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_player.lua:
BRICKS_SERVER.LOCALPLYMETA = {}

setmetatable( BRICKS_SERVER.LOCALPLYMETA, BRICKS_SERVER.PLAYERMETA )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_admin_profile.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize( ScrW(), ScrH() )
    self:Center()
    self:MakePopup()
    self:SetTitle( "" )
    self:SetDraggable( false )
    self:ShowCloseButton( false )

    self.mainPanel = vgui.Create( "DPanel", self )
    self.mainPanel:SetSize( (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth, ScrH()*0.65-50 )
    self.mainPanel:Center()
    self.mainPanel.headerHeight = 40
    self.mainPanel:DockPadding( 0, self.mainPanel.headerHeight, 0, 0 )
    self.mainPanel.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        draw.RoundedBoxEx( 5, 0, 0, w, self.mainPanel.headerHeight, BRICKS_SERVER.Func.GetTheme( 0 ), true, true, false, false )
    
        local requestedPly = player.GetBySteamID64( self.requestedID64 or "" )
        if( requestedPly and IsValid( requestedPly ) ) then 
            draw.SimpleText( BRICKS_SERVER.Func.L( "profileView" ) .. " - " .. requestedPly:Nick(), "BRICKS_SERVER_Font30", 10, (self.mainPanel.headerHeight or 40)/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
        else
            draw.SimpleText( BRICKS_SERVER.Func.L( "profileView" ), "BRICKS_SERVER_Font30", 10, (self.mainPanel.headerHeight or 40)/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
        end
    end

    local closeButton = vgui.Create( "DButton", self.mainPanel )
	local size = 24
	closeButton:SetSize( size, size )
	closeButton:SetPos( self.mainPanel:GetWide()-size-((self.mainPanel.headerHeight-size)/2), (self.mainPanel.headerHeight/2)-(size/2) )
	closeButton:SetText( "" )
    local CloseMat = Material( "materials/bricks_server/close.png" )
    local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
	closeButton.Paint = function( self2, w, h )
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
    closeButton.DoClick = function()
        self:Remove()
    end

    self.contentsPanel = vgui.Create( "DPanel", self.mainPanel )
    self.contentsPanel:Dock( FILL )
    self.contentsPanel:DockMargin( 10, 10, 10, 10 )
    self.contentsPanel.Paint = function( self, w, h ) end 

    local loadingPanel = vgui.Create( "DPanel", self.contentsPanel )
    loadingPanel:Dock( FILL )
    local loadingIcon = Material( "materials/bricks_server/loading.png" )
    loadingPanel.Paint = function( self, w, h ) 
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( loadingIcon )
        local size = 32
        surface.DrawTexturedRectRotated( w/2, h/2, size, size, -(CurTime() % 360 * 250) )

        draw.SimpleText( BRICKS_SERVER.Func.L( "loading" ), "BRICKS_SERVER_Font20", w/2, h/2+(size/2)+5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
    end 
end

function PANEL:RefreshProfile( requestedID64, profileTable )
    self.requestedID64 = requestedID64

    self.contentsPanel:Clear()

    local requestedPly = player.GetBySteamID64( requestedID64 or "" )
    if( not requestedPly or not IsValid( requestedPly ) ) then return end

    local profileSheet = vgui.Create( "bricks_server_colsheet_top", self.contentsPanel )
    profileSheet:Dock( FILL )
    profileSheet:DockMargin( 0, 0, 0, 0 )
    profileSheet.rounded = true
    profileSheet.pageClickFunc = function( page )
        self.page = page
    end

    local refreshButton = vgui.Create( "DButton", profileSheet.navigationBack )
    refreshButton:Dock( RIGHT )
    refreshButton:SetWide( profileSheet.navigationBack:GetTall() )
    refreshButton:SetText( "" )
    local changeAlpha = 0
    local refreshMat = Material( "materials/bricks_server/refresh.png" )
    refreshButton.Paint = function( self2, w, h ) 
        if( self2:IsDown() ) then
            changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
        elseif( self2:IsHovered() ) then
            changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
        else
            changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
        end
        
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.DrawRect( 0, 0, w, h )

        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

        surface.SetAlphaMultiplier( changeAlpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
        surface.SetAlphaMultiplier( 1 )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
        surface.SetMaterial( refreshMat )
        local iconSize = 24
        surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
    end
    refreshButton.DoClick = function()
        net.Start( "BRS.Net.ProfileAdminRequest" )
            net.WriteString( requestedID64 )
        net.SendToServer()
    end

    local refreshCover = vgui.Create( "DPanel", profileSheet.navigationBack )
    refreshCover:Dock( RIGHT )
    refreshCover:SetWide( profileSheet.navigationBack:GetTall() )
    refreshCover.Paint = function( self2, w, h ) 
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.DrawRect( 0, 0, w, h )

        draw.RoundedBoxEx( 5, 0, 0, w-5, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, true, false, true )
    end

    local profileMain = vgui.Create( "DPanel", profileSheet )
    profileMain:Dock( FILL )
    profileMain.Paint = function( self, w, h ) end 
    profileSheet:AddSheet( BRICKS_SERVER.Func.L( "statistics" ), profileMain )

    local profileModelBack = vgui.Create( "DPanel", profileMain )
    profileModelBack:Dock( LEFT )
    profileModelBack:DockMargin( 0, 0, 5, 0 )
    profileModelBack:SetWide( (self.mainPanel:GetWide()-20-5)/2 )
    local plyName = requestedPly:Nick() or BRICKS_SERVER.Func.L( "nil" )
    surface.SetFont( "BRICKS_SERVER_Font25" )
    local textX, textY = surface.GetTextSize( plyName )
    local donationRank
    for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
        if( BRICKS_SERVER.Func.IsInGroup( requestedPly, v[1] ) ) then
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
            draw.RoundedBox( 5, (w/2)-(totalW/2)+textX+5, h-(h/10)-(donationTextY/2)+1.5, donationTextX, donationTextY, (BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank][3] or BRICKS_SERVER.Func.GetTheme( 5 )) )
            draw.SimpleText( BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank][1], "BRICKS_SERVER_Font20", (w/2)-(totalW/2)+textX+5+(donationTextX/2), h-(h/10), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
    end

    local profileModelBack = vgui.Create( "DModelPanel", profileModelBack )
    profileModelBack:Dock( FILL )
    profileModelBack:DockMargin( 10, 10, 10, 10 )
    profileModelBack:SetModel( requestedPly:GetModel() or "" )
    function profileModelBack:LayoutEntity( Entity ) return end

    local dataToShow = {
        [1] = { BRICKS_SERVER.Func.L( "name" ), requestedPly:Nick() },
        [2] = { BRICKS_SERVER.Func.L( "steamID64" ), requestedID64 },
        [3] = { BRICKS_SERVER.Func.L( "donationRank" ), (BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank] or {})[1] or BRICKS_SERVER.Func.L( "none" ) },
        [4] = { BRICKS_SERVER.Func.L( "staffRank" ), BRICKS_SERVER.Func.GetAdminGroup( requestedPly ) }
    }

    if( DarkRP ) then
        table.insert( dataToShow, { BRICKS_SERVER.Func.L( "currentJob" ), requestedPly:getDarkRPVar( "job" ) or BRICKS_SERVER.Func.L( "none" ) } )
        table.insert( dataToShow, { BRICKS_SERVER.Func.L( "wallet" ), DarkRP.formatMoney( requestedPly:getDarkRPVar( "money" ) or 0 ) } )
    end

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "essentials", "levelling" ) ) then
        table.insert( dataToShow, { BRICKS_SERVER.Func.L( "level" ), profileTable.level or 0 } )
        table.insert( dataToShow, { BRICKS_SERVER.Func.L( "experience" ), string.Comma( math.Round( profileTable.experience or 0 ) ) } )
    end

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "default", "currencies" ) ) then
        for k, v in pairs( BRICKS_SERVER.CONFIG.CURRENCIES or {} ) do
            if( not BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k] ) then continue end

            local currencyTable = BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k]

            table.insert( dataToShow, { v.Name, currencyTable.formatFunction( (profileTable.currencies or {})[k] or 0 ) } )
        end
    end
    
    local profileInfoBack = vgui.Create( "DPanel", profileMain )
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

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "essentials", "logging" ) ) then    
        local profileLogs = vgui.Create( "bricks_server_scrollpanel", profileSheet )
        profileLogs:Dock( FILL )
        profileLogs.Paint = function( self, w, h ) end 
        profileSheet:AddSheet( BRICKS_SERVER.Func.L( "playerLogs" ), profileLogs, ((self.page or "") == BRICKS_SERVER.Func.L( "playerLogs" ) ) )

        function self.FillLogs()
            profileLogs:Clear()

            local logsRequest = vgui.Create( "DButton", profileLogs )
            logsRequest:Dock( TOP )
            logsRequest:DockMargin( 0, 0, 0, 5 )
            logsRequest:SetTall( 65 )
            logsRequest:DockPadding( 0, 0, 30, 0 )
            logsRequest:SetText( "" )
            local changeAlpha = 0
            logsRequest.Paint = function( self2, w, h ) 
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                draw.SimpleText( BRICKS_SERVER.Func.L( "deleteLogs" ), "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( BRICKS_SERVER.Func.L( "xLogs", (#(profileTable.logs or {}) or 0) ), "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )

                if( self2:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
                end

                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                surface.SetAlphaMultiplier( 1 )
            end
            logsRequest.DoClick = function()
                net.Start( "BRS.Net.DeleteLogsAdmin" )
                    net.WriteString( requestedID64 )
                net.SendToServer()
            end

            local sortedLogs = table.Copy( profileTable.logs or {} )
            table.sort( sortedLogs, function(a, b) return a[1] > b[1] end )

            for k, v in pairs( sortedLogs or {} ) do
                if( not BRICKS_SERVER.DEVCONFIG.LogTypes[v[2] or ""] ) then continue end

                local entryBack = vgui.Create( "DPanel", profileLogs )
                entryBack:Dock( TOP )
                entryBack:DockMargin( 0, 0, 0, 5 )
                entryBack:SetTall( 65 )
                entryBack:DockPadding( 0, 0, 30, 0 )
                local dateTime = os.date( "%H:%M:%S - %d/%m/%Y" , v[1] )
                local text = ""
                if( BRICKS_SERVER.DEVCONFIG.LogTypes[v[2] or ""].FormatInfo ) then
                    text = BRICKS_SERVER.DEVCONFIG.LogTypes[v[2] or ""].FormatInfo( v[3] )
                end
                entryBack.Paint = function( self2, w, h )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                    draw.SimpleText( dateTime, "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                    draw.SimpleText( text, "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                end
            end
        end
        self.FillLogs()
    end
end

function PANEL:Paint( w, h )
    BRICKS_SERVER.Func.DrawBlur( self, 4, 4 )
end

vgui.Register( "bricks_server_admin_profile", PANEL, "DFrame" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_combo_search.lua:

local PANEL = {}

Derma_Install_Convar_Functions( PANEL )

AccessorFunc( PANEL, "m_bDoSort", "SortItems", FORCE_BOOL )

function PANEL:Init()

	self:SetTall( 40 )
	self:Clear()

	self:SetIsMenu( true )
	self:SetSortItems( true )
	self:SetText( "" )

end

function PANEL:Clear()

	self.Choices = {}
	self.Data = {}
	self.ChoiceIcons = {}
	self.selected = nil

	if ( self.Menu ) then
		self.Menu:Remove()
		self.Menu = nil
	end

end

function PANEL:GetOptionText( id )

	return self.Choices[ id ]

end

function PANEL:GetOptionData( id )

	return self.Data[ id ]

end

function PANEL:GetOptionTextByData( data )

	for id, dat in pairs( self.Data ) do
		if ( dat == data ) then
			return self:GetOptionText( id )
		end
	end

	-- Try interpreting it as a number
	for id, dat in pairs( self.Data ) do
		if ( dat == tonumber( data ) ) then
			return self:GetOptionText( id )
		end
	end

	-- In case we fail
	return data

end

function PANEL:PerformLayout()

end

function PANEL:ChooseOption( value, index )

	if ( self.Menu ) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.text = value

	-- This should really be the here, but it is too late now and convar changes are handled differently by different child elements
	--self:ConVarChanged( self.Data[ index ] )

	self.selected = index
	self:OnSelect( index, value, self.Data[ index ] )

end

function PANEL:ChooseOptionID( index )

	local value = self:GetOptionText( index )
	self:ChooseOption( value, index )

end

function PANEL:GetSelectedID()

	return self.selected

end

function PANEL:GetSelected()

	if ( !self.selected ) then return end

	return self:GetOptionText( self.selected ), self:GetOptionData( self.selected )

end

function PANEL:OnSelect( index, value, data )

	-- For override

end

function PANEL:AddChoice( value, data, select, icon )

	local i = table.insert( self.Choices, value )

	if ( data ) then
		self.Data[ i ] = data
	end
	
	if ( icon ) then
		self.ChoiceIcons[ i ] = icon
	end

	if ( select ) then

		self:ChooseOption( value, i )

	end

	return i

end

function PANEL:IsMenuOpen()

	return IsValid( self.Menu ) && self.Menu:IsVisible()

end

function PANEL:OpenMenu( pControlOpener )

	if ( pControlOpener && pControlOpener == self.TextEntry ) then
		return
	end

	-- Don't do anything if there aren't any options..
	if ( #self.Choices == 0 ) then return end

	-- If the menu still exists and hasn't been deleted
	-- then just close it and don't open a new one.
	if ( IsValid( self.Menu ) ) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.Menu = vgui.Create( "bricks_server_dmenu" )

	if ( self:GetSortItems() ) then
		local sorted = {}
		for k, v in pairs( self.Choices ) do
			if( IsValid( self.textEntry ) and not string.find( string.lower( v ), string.lower( self.textEntry:GetValue() ) ) ) then continue end

			local val = tostring( v ) --tonumber( v ) || v -- This would make nicer number sorting, but SortedPairsByMemberValue doesn't seem to like number-string mixing
			if ( string.len( val ) > 1 && !tonumber( val ) && val:StartWith( "#" ) ) then val = language.GetPhrase( val:sub( 2 ) ) end
			table.insert( sorted, { id = k, data = v, label = val } )
		end
		for k, v in SortedPairsByMemberValue( sorted, "label" ) do
			if( IsValid( self.textEntry ) and not string.find( string.lower( v.data ), string.lower( self.textEntry:GetValue() ) ) ) then continue end

			local option = self.Menu:AddOption( v.data, function() self:ChooseOption( v.data, v.id ) end )
			if ( self.ChoiceIcons[ v.id ] ) then
				option:SetIcon( self.ChoiceIcons[ v.id ] )
			end
		end
	else
		for k, v in pairs( self.Choices ) do
			if( IsValid( self.textEntry ) and not string.find( string.lower( v ), string.lower( self.textEntry:GetValue() ) ) ) then continue end

			local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
			if ( self.ChoiceIcons[ k ] ) then
				option:SetIcon( self.ChoiceIcons[ k ] )
			end
		end
	end

	local x, y = self:LocalToScreen( 0, self:GetTall() )

	self.Menu:SetMaxHeight( ScrH()*0.2 )
	self.Menu.dontRoundTop = true
	self.Menu:SetMinimumWidth( self:GetWide() )
	self.Menu:Open( x, y, false, self )

end

function PANEL:CloseMenu()

	if ( IsValid( self.Menu ) ) then
		self.Menu:Remove()
	end

end

-- This really should use a convar change hook
function PANEL:CheckConVarChanges()

	if ( !self.m_strConVar ) then return end

	local strValue = GetConVarString( self.m_strConVar )
	if ( self.m_strConVarValue == strValue ) then return end

	self.m_strConVarValue = strValue

	self:SetValue( self:GetOptionTextByData( self.m_strConVarValue ) )

end

function PANEL:Think()

	self:CheckConVarChanges()

	if( not self:IsMenuOpen() and IsValid( self.textEntry ) ) then
		self.textEntry:Remove()
	elseif( self:IsMenuOpen() ) then
		self:CreateTextEntry()
	end
end

function PANEL:CreateTextEntry()
	if( IsValid( self.textEntry ) ) then return end

	self.textEntry = vgui.Create( "bricks_server_search", self )
	self.textEntry:Dock( FILL )
	self.textEntry:RequestFocus()
	self.textEntry.OnChange = function()
		self:OpenMenu()
	end
	self.textEntry.OnMousePressed = function()
		self.textEntry:OnGetFocus()
		self:OpenMenu()
	end
end

function PANEL:SetValue( strValue )

	self.text = strValue

end

function PANEL:DoClick()

	if ( self:IsMenuOpen() ) then
		return self:CloseMenu()
	end

	self:OpenMenu()

end

function PANEL:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
	self.roundedBoxX, self.roundedBoxY, self.roundedBoxW, self.roundedBoxH = roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH
end

local alpha = 0
function PANEL:Paint( w, h )
	if( self:IsMenuOpen() or self:IsHovered() ) then
		alpha = math.Clamp( alpha+10, 0, 100 )
	else
		alpha = math.Clamp( alpha-10, 0, 100 )
	end

	local roundBottom = not (self:IsMenuOpen() and (self.optionCount or 1) > 0)

	draw.RoundedBoxEx( (self.cornerRadius or 5), (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h), (self.backColor or BRICKS_SERVER.Func.GetTheme( 3 )), true, true, roundBottom, roundBottom )

	surface.SetAlphaMultiplier( alpha/255 )
	draw.RoundedBoxEx( (self.cornerRadius or 5), (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h), (self.highlightColor or BRICKS_SERVER.Func.GetTheme( 2 )), true, true, roundBottom, roundBottom )
	surface.SetAlphaMultiplier( 1 )

	draw.SimpleText( (self.text or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 20+(not self:IsMenuOpen() and 235*(alpha/100) or 0) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

derma.DefineControl( "bricks_server_combo_search", "", PANEL, "DButton" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_modules.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    self.panelWide = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth

    surface.SetFont( "BRICKS_SERVER_Font20" )
    local headerX, headerY = surface.GetTextSize( BRICKS_SERVER.Func.L( "changesServerRestart" ) )
    local fullWidth = 60+headerX+35

    self.topBar = vgui.Create( "DPanel", self )
    self.topBar:Dock( TOP )
    self.topBar:SetTall( 60 )
    local noticeMat = Material( "bricks_server/warning.png" )
    self.topBar.Paint = function( self, w, h ) 
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.DrawRect( 0, 0, w, h )

        -- Notice --
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
        surface.DrawRect( w-fullWidth, 0, fullWidth, h )
        
        surface.SetDrawColor( BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
        surface.DrawRect( w-fullWidth, 0, h, h )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
        surface.SetMaterial( noticeMat )
        local iconSize = 32
        surface.DrawTexturedRect( w-fullWidth+(h/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )

        draw.SimpleText( BRICKS_SERVER.Func.L( "changesServerRestart" ), "BRICKS_SERVER_Font20", w-fullWidth+60+((fullWidth-60)/2), h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end 

    self.searchBar = vgui.Create( "bricks_server_searchbar", self.topBar )
    self.searchBar:Dock( LEFT )
    self.searchBar:DockMargin( 25, 10, 10, 10 )
    self.searchBar:SetWide( math.min( ScrW()*0.2, self.panelWide-fullWidth-50 ) )
    self.searchBar:SetBackColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
    self.searchBar:SetHighlightColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
    self.searchBar.OnChange = function()
        self:Refresh()
    end

    self.scrollPanel = vgui.Create( "bricks_server_scrollpanel_bar", self )
    self.scrollPanel:Dock( FILL )
    self.scrollPanel:DockMargin( 25, 25, 25, 25 )
    self.scrollPanel.Paint = function( self, w, h ) end 

    local spacing = 10
    local gridWide = self.panelWide-50-10-spacing
    local slotSize = 320
    local slotsWide = math.floor( gridWide/slotSize )
    self.slotWide, self.slotTall = (gridWide-((slotsWide-1)*spacing))/slotsWide, 0

    self.grid = vgui.Create( "DIconLayout", self.scrollPanel )
    self.grid:Dock( TOP )
    self.grid:SetSpaceY( spacing )
    self.grid:SetSpaceX( spacing )
    self.grid:SetTall( ScrH()*0.65 )

    self:Refresh()
end

function PANEL:Refresh()
    self.grid:Clear()

    local modules = {}
    for k, v in pairs( BRICKS_SERVER.DLCMODULES or {} ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v.Name ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local addDLC = true

        for key, val in pairs( v.Modules ) do
            if( BRICKS_SERVER.Modules[val] ) then
                addDLC = false
                break
            end
        end

        if( not addDLC ) then continue end

        local module = v
        module.Key = k
        module.DLC = true

        table.insert( modules, module )
    end

    for k, v in pairs( BRICKS_SERVER.Modules or {} ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        table.insert( modules, {
            Key = k,
            Name = v[1],
            Icon = v[2],
            SubModules = v[3]
        } )
    end

    local subModuleTall, subModuleSpacing, iconSpacing = 25, 10, 75
    for k, v in pairs( modules ) do
        surface.SetFont( "BRICKS_SERVER_Font25" )
        local textX, textY = surface.GetTextSize( v.Name )

        local defaultSize = 25+textY+5+iconSpacing+64+iconSpacing+40+10+40+25

        self.slotTall = math.max( defaultSize, self.slotTall )
    end

    for k, v in pairs( modules ) do
        local moduleBack = vgui.Create( "DPanel", self.grid )
        moduleBack:SetSize( self.slotWide, self.slotTall )
        moduleBack.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
        end
        
        surface.SetFont( "BRICKS_SERVER_Font25" )
        local textX, textY = surface.GetTextSize( v.Name )

        local moduleName = vgui.Create( "DPanel", moduleBack )
        moduleName:Dock( TOP )
        moduleName:DockMargin( 0, 25, 0, 0 )
        moduleName:SetTall( textY+5 )
        local wide = textX+20
        moduleName.Paint = function( self2, w, h )
            draw.RoundedBox( 8, (w/2)-(wide/2), 0, wide, h, BRICKS_SERVER.Func.GetTheme( 5 ) )

            draw.SimpleText( v.Name, "BRICKS_SERVER_Font25", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local moduleIcon = vgui.Create( "DPanel", moduleBack )
        moduleIcon:Dock( TOP )
        moduleIcon:DockMargin( 0, iconSpacing, 0, (not v.DLC and iconSpacing) or 0 )
        moduleIcon:SetTall( 64 )
        local iconMat = Material( v.Icon )
        moduleIcon.Paint = function( self2, w, h )
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
            surface.SetMaterial( iconMat )
            local iconSize = 64
            surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
        end

        local subModulesBack
        if( not v.DLC and table.Count( v.SubModules or {} ) > 0 ) then
            subModulesBack = vgui.Create( "DPanel", moduleBack )
            subModulesBack:Dock( v.Key != "default" and TOP or BOTTOM )
            subModulesBack:DockMargin( 10, 0, 10, v.Key != "default" and 0 or 10 )
            subModulesBack:SetTall( 40 )
            subModulesBack.Paint = function( self2, w, h ) end
            subModulesBack.FillSubModules = function( self2 )
                subModulesBack.list:Clear()

                for key, val in pairs( v.SubModules or {} ) do
                    local subModuleBack = vgui.Create( "DPanel", subModulesBack.list )
                    subModuleBack:Dock( TOP )
                    subModuleBack:DockMargin( 20, 0, 20, subModuleSpacing )
                    subModuleBack:SetTall( subModuleTall )
                    subModuleBack.Paint = function( self2, w, h )
                        draw.SimpleText( val, "BRICKS_SERVER_Font20", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                    end
        
                    local moduleTable = BS_ConfigCopyTable.MODULES[v.Key]
                    local subModuleEnabled = moduleTable and moduleTable[1] == true and moduleTable[2] and moduleTable[2][key] and moduleTable[2][key] == true
        
                    local subModuleButton = vgui.Create( "bricks_server_dcheckbox", subModuleBack )
                    subModuleButton:Dock( RIGHT )
                    subModuleButton:SetValue( subModuleEnabled )
                    subModuleButton:SetTitle( "" )
                    subModuleButton.backgroundCol = BRICKS_SERVER.Func.GetTheme( 2 )
                    subModuleButton.OnChange = function( value )
                        BS_ConfigCopyTable.MODULES[v.Key][2][key] = value
                        BRICKS_SERVER.Func.ConfigChange( "MODULES" )
                    end

                    if( not moduleTable or moduleTable[1] != true ) then
                        subModuleButton:SetDisabled( true )
                    end
                end
            end

            local subModulesExpand = vgui.Create( "DButton", subModulesBack )
            subModulesExpand:Dock( TOP )
            subModulesExpand:SetTall( subModulesBack:GetTall() )
            subModulesExpand:SetText( "" )
            local alpha = 0
            local arrow = Material( "bricks_server/down_16.png" )
            subModulesExpand.textureRotation = -90
            subModulesExpand.Paint = function( self2, w, h )
                local expanded = subModulesBack:GetTall() > 40

                if( not self2:IsDown() and self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+5, 0, 150 )
                else
                    alpha = math.Clamp( alpha-5, 0, 150 )
                end

                draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ), true, true, not expanded, not expanded )

                surface.SetAlphaMultiplier( alpha/255 )
                draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), true, true, not expanded, not expanded )
                surface.SetAlphaMultiplier( 1 )

                BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), 8 )

                draw.SimpleText( table.Count( v.SubModules or {} ) .. " Sub Modules", "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
                surface.SetMaterial( arrow )
                local iconSize = 16
                surface.DrawTexturedRectRotated( w-((h-iconSize)/2)-(iconSize/2), h/2, iconSize, iconSize, math.Clamp( (self2.textureRotation or 0), -90, 0 ) )
            end
            subModulesExpand.DoAnim = function( expanding )
                local anim = subModulesExpand:NewAnimation( 0.2, 0, -1 )
            
                anim.Think = function( anim, pnl, fraction )
                    if( expanding ) then
                        subModulesExpand.textureRotation = (1-fraction)*-90
                    else
                        subModulesExpand.textureRotation = fraction*-90
                    end
                end
            end
            subModulesExpand.DoClick = function()
                if( table.Count( v.SubModules or {} ) <= 0 ) then return end

                subModulesBack.Expanded = not subModulesBack.Expanded

                if( subModulesBack.Expanded ) then
                    subModulesBack.FillSubModules()

                    local listTall = (table.Count( v.SubModules or {} )*(subModuleTall+subModuleSpacing))+subModuleSpacing
                    subModulesBack:SizeTo( self.slotWide-20, 40+listTall, 0.2 )
                    moduleBack:SizeTo( self.slotWide, self.slotTall+listTall, 0.2 )
                    subModulesExpand.DoAnim( true )
                else
                    subModulesBack:SizeTo( self.slotWide-20, 40, 0.2, 0, -1, function() 
                        if( not IsValid( subModulesBack.list ) ) then return end

                        subModulesBack.list:Clear()
                    end )

                    moduleBack:SizeTo( self.slotWide, self.slotTall, 0.2 )

                    subModulesExpand.DoAnim( false )
                end
            end

            subModulesBack.list = vgui.Create( "DPanel", subModulesBack )
            subModulesBack.list:Dock( FILL )
            subModulesBack.list:DockPadding( 0, subModuleSpacing, 0, 0 )
            subModulesBack.list.Paint = function( self2, w, h ) 
                draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), false, false, true, true )
            end
        end
 
        if( v.Key != "default" ) then
            local moduleButton = vgui.Create( "DButton", moduleBack )
            moduleButton:Dock( BOTTOM )
            moduleButton:DockMargin( 10, 0, 10, 10 )
            moduleButton:SetTall( 40 )
            moduleButton:SetText( "" )
            local alpha = 0
            moduleButton.Paint = function( self2, w, h )
                local buttonText, buttonColor, buttonDownColor = BRICKS_SERVER.Func.L( "purchase" ), BRICKS_SERVER.Func.GetTheme( 5 ), BRICKS_SERVER.Func.GetTheme( 4 )

                if( not v.DLC ) then
                    local moduleEnabled = ((BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).MODULES or {})[v.Key] and ((BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).MODULES or {})[v.Key][1] == true

                    buttonText = (moduleEnabled and BRICKS_SERVER.Func.L( "enabled" )) or BRICKS_SERVER.Func.L( "disabled" )
                    buttonColor = (moduleEnabled and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green) or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red
                    buttonDownColor = (moduleEnabled and BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen) or BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed
                elseif( not v.Link ) then
                    buttonText = BRICKS_SERVER.Func.L( "comingSoon" )
                    buttonColor = BRICKS_SERVER.Func.GetTheme( 2 )
                    buttonDownColor = BRICKS_SERVER.Func.GetTheme( 1 )
                end

                if( not self2:IsDown() and self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+5, 0, 200 )
                else
                    alpha = math.Clamp( alpha-5, 0, 255 )
                end

                draw.RoundedBox( 5, 0, 0, w, h, buttonColor )

                surface.SetAlphaMultiplier( alpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, buttonDownColor )
                surface.SetAlphaMultiplier( 1 )

                BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, buttonDownColor )

                draw.SimpleText( buttonText, "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            moduleButton.DoClick = function()
                if( not v.DLC ) then
                    BS_ConfigCopyTable.MODULES[v.Key] = BS_ConfigCopyTable.MODULES[v.Key] or {}
                    BS_ConfigCopyTable.MODULES[v.Key][1] = not BS_ConfigCopyTable.MODULES[v.Key][1]
                    BS_ConfigCopyTable.MODULES[v.Key][2] = BS_ConfigCopyTable.MODULES[v.Key][2] or {}
                    BRICKS_SERVER.Func.ConfigChange( "MODULES" )

                    if( IsValid( subModulesBack ) and subModulesBack.Expanded ) then
                        subModulesBack.FillSubModules()
                    end
                elseif( v.Link ) then
                    gui.OpenURL( v.Link )
                end
            end
        end

        if( v.Description ) then
            local moduleIcon = vgui.Create( "DPanel", moduleBack )
            moduleIcon:Dock( TOP )
            moduleIcon:DockMargin( 0, 35, 0, 0 )
            moduleIcon:SetTall( 20 )
            moduleIcon.Paint = function( self2, w, h )
                draw.SimpleText( BRICKS_SERVER.Func.L( "features" ), "BRICKS_SERVER_Font17", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 5 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end

            local moduleDescription = vgui.Create( "DPanel" , moduleBack )
            moduleDescription:Dock( FILL )
            moduleDescription:DockMargin( 25, 5, 25, 5 )
            moduleDescription.Paint = function( self2, w, h )
                local description = BRICKS_SERVER.Func.TextWrap( v.Description, "BRICKS_SERVER_Font17", w )

                BRICKS_SERVER.Func.DrawNonParsedText( description, "BRICKS_SERVER_Font17", 0, 0, BRICKS_SERVER.Func.GetTheme( 6 ), 0 )
            end
        end
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_config_modules", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_rarities.lua:
local PANEL = {}

function PANEL:Init()
    self.margin = 0
end

function PANEL:FillPanel()
    self.panelWide, self.panelTall = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth, ScrH()*0.65-40

    self.topBar = vgui.Create( "DPanel", self )
    self.topBar:Dock( TOP )
    self.topBar:SetTall( 60 )
    self.topBar.Paint = function( self, w, h ) 
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.DrawRect( 0, 0, w, h )
    end 

    surface.SetFont( "BRICKS_SERVER_Font20" )
    local textX, textY = surface.GetTextSize( "Create Rarity" )
    local totalContentW = 16+5+textX

    local createNewButton = vgui.Create( "DButton", self.topBar )
    createNewButton:Dock( RIGHT )
    createNewButton:DockMargin( 10, 10, 25, 10 )
    createNewButton:SetWide( totalContentW+27 )
    createNewButton:SetText( "" )
    local alpha = 0
    local addMat = Material( "bricks_server/add_16.png" )
    createNewButton.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

        if( not self2:IsDown() and self2:IsHovered() ) then
            alpha = math.Clamp( alpha+10, 0, 255 )
        else
            alpha = math.Clamp( alpha-10, 0, 255 )
        end

        surface.SetAlphaMultiplier( alpha/255 )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
        surface.SetAlphaMultiplier( 1 )

        BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
        surface.SetMaterial( addMat )
        local iconSize = 16
        surface.DrawTexturedRect( 12, (h/2)-(iconSize/2), iconSize, iconSize )

        draw.SimpleText( "Create Rarity", "BRICKS_SERVER_Font20", 12+iconSize+5, h/2, BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ), 0, TEXT_ALIGN_CENTER )
    end
    createNewButton.DoClick = function()
        BS_ConfigCopyTable.GENERAL.Rarities = BS_ConfigCopyTable.GENERAL.Rarities or {}
        table.insert( BS_ConfigCopyTable.GENERAL.Rarities, 1, { BRICKS_SERVER.Func.L( "newRarity" ) .. " " .. (#BS_ConfigCopyTable.GENERAL.Rarities or 0)+1, "SolidColor", Color( 125, 125, 125 ) } )
        self:Refresh()
        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )

        BRICKS_SERVER.Func.CreateTopNotification( "New rarity added!", 3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )
    end

    self.searchBar = vgui.Create( "bricks_server_searchbar", self.topBar )
    self.searchBar:Dock( LEFT )
    self.searchBar:DockMargin( 25, 10, 10, 10 )
    self.searchBar:SetWide( ScrW()*0.2 )
    self.searchBar:SetBackColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
    self.searchBar:SetHighlightColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
    self.searchBar.OnChange = function()
        self:Refresh()
    end

    self.scrollPanel = vgui.Create( "bricks_server_scrollpanel_bar", self )
    self.scrollPanel:Dock( FILL )
    self.scrollPanel:DockMargin( 25, 25, 25, 25 )
    self.scrollPanel.Paint = function( self, w, h ) end 

    self.spacing = 25
    local gridWide = self.panelWide-50-10-10
    self.slotsWide = 2
    self.slotWide, self.slotTall = (gridWide-((self.slotsWide-1)*self.spacing))/self.slotsWide, 150

    self.grid = vgui.Create( "DIconLayout", self.scrollPanel )
    self.grid:Dock( TOP )
    self.grid:SetSpaceY( 10 )
    self.grid:SetSpaceX( self.spacing )

    self:Refresh()
end

function PANEL:Refresh()
    self.grid:Clear()

    local sortedItems = {}
    for k, v in pairs( BS_ConfigCopyTable.GENERAL.Rarities or {} ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local itemTable = table.Copy( v )
        itemTable.Key = k

        table.insert( sortedItems, itemTable)
    end

    table.sort( sortedItems, function( a, b ) return ((a or {}).Key or 0) > ((b or {}).Key or 0) end )

    for k, v in pairs( sortedItems ) do
        local rarityBack = vgui.Create( "DPanel", self.grid )
        rarityBack:SetSize( self.slotWide, self.slotTall )
        rarityBack.Paint = function( self2, w, h ) end

        local rarityNum = vgui.Create( "DPanel", rarityBack )
        rarityNum:Dock( LEFT )
        rarityNum:DockMargin( 0, 0, 10, 0 )
        rarityNum:SetWide( 35 )
        rarityNum.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 125 ) )
    
            draw.SimpleText( #(BS_ConfigCopyTable.GENERAL.Rarities or {})-v.Key+1, "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local rarityUpButton = vgui.Create( "DButton", rarityNum )
        rarityUpButton:SetText( "" )
        rarityUpButton:Dock( TOP )
        rarityUpButton:SetTall( rarityNum:GetWide() )
        local alpha = 0
        local upMat = Material( "materials/bricks_server/up_16.png" )
        rarityUpButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, false, false )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), 8 )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
            surface.SetMaterial( upMat )
            local iconSize = 16
            surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
        end
        rarityUpButton.DoClick = function()
            if( v.Key >= #BS_ConfigCopyTable.GENERAL.Rarities ) then return end

            local targetTable = BS_ConfigCopyTable.GENERAL.Rarities[v.Key+1]

            if( not targetTable ) then return end

            BS_ConfigCopyTable.GENERAL.Rarities[v.Key+1] = v
            BS_ConfigCopyTable.GENERAL.Rarities[v.Key] = targetTable

            self:Refresh()
            BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
        end

        local rarityDownButton = vgui.Create( "DButton", rarityNum )
        rarityDownButton:SetText( "" )
        rarityDownButton:Dock( BOTTOM )
        rarityDownButton:SetTall( rarityNum:GetWide() )
        local alpha = 0
        local downMat = Material( "materials/bricks_server/down_16.png" )
        rarityDownButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, true )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), 8 )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
            surface.SetMaterial( downMat )
            local iconSize = 16
            surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
        end
        rarityDownButton.DoClick = function()
            if( v.Key <= 1 ) then return end

            local targetTable = BS_ConfigCopyTable.GENERAL.Rarities[v.Key-1]

            if( not targetTable ) then return end

            BS_ConfigCopyTable.GENERAL.Rarities[v.Key-1] = v
            BS_ConfigCopyTable.GENERAL.Rarities[v.Key] = targetTable

            self:Refresh()
            BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
        end

        local rarityPanel = vgui.Create( "DPanel", rarityBack )
        rarityPanel:Dock( FILL )
        rarityPanel.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
    
            draw.SimpleText( v[1], "BRICKS_SERVER_Font30", 10+15, 10, BRICKS_SERVER.Func.GetRarityColor( v ), 0, 0 )
            draw.SimpleText( BRICKS_SERVER.DEVCONFIG.RarityTypes[v[2]].Title, "BRICKS_SERVER_Font21", 10+15, 32, BRICKS_SERVER.Func.GetTheme( 6, 125 ), 0, 0 )
        end

        surface.SetFont( "BRICKS_SERVER_Font30" )
        local nameX, nameY = surface.GetTextSize( v[1] )

        local rarityEditNameButton = vgui.Create( "DButton", rarityPanel )
        rarityEditNameButton:SetText( "" )
        rarityEditNameButton:SetSize( 16, 16 )
        rarityEditNameButton:SetPos( 10+15+nameX+5, 10+(nameY/2)-6 )
        local alpha = 20
        local editMat = Material( "materials/bricks_server/edit_16.png" )
        rarityEditNameButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 20, 255 )
            else
                alpha = math.Clamp( alpha-10, 20, 255 )
            end
    
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, alpha ) )
            surface.SetMaterial( editMat )
            local iconSize = 16
            surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
        end
        rarityEditNameButton.DoClick = function()
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), "What should the new rarity name be?", v[1], function( text ) 
                if( text == v[1] ) then return end

                BS_ConfigCopyTable.GENERAL.Rarities[v.Key][1] = text
                self:Refresh()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
        end
    
        local rarityBox = vgui.Create( "bricks_server_raritybox", rarityPanel )
        rarityBox:SetSize( 10, rarityBack:GetTall() )
        rarityBox:SetPos( 0, 0 )
        rarityBox:SetRarityName( v[1], 1 )
        rarityBox:SetCornerRadius( 8 )
        rarityBox:SetRoundedBoxDimensions( false, false, 20, false )

        surface.SetFont( "BRICKS_SERVER_Font20" )
        local typeX, typeY = surface.GetTextSize( "Edit Type" )

        local editTypeButton = vgui.Create( "DButton", rarityPanel )
        editTypeButton:SetText( "" )
        editTypeButton:SetSize( typeX+25, 35 )
        editTypeButton:SetPos( rarityBack:GetWide()-rarityNum:GetWide()-10-10-40-editTypeButton:GetWide()-5, rarityBack:GetTall()-10-editTypeButton:GetTall() )
        local alpha = 0
        editTypeButton.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 0 ), 8 )

            draw.SimpleText( "Edit Type", "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        editTypeButton.DoClick = function()
			local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.RarityTypes ) do
				options[k] = v.Title
            end
            
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), "What should the rarity color type be?", v[2], options, function( value, data ) 
				if( BRICKS_SERVER.DEVCONFIG.RarityTypes[data] ) then
                    if( data == v[2] ) then return end

                    local oldColors = BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3]
                    if( data == "Rainbow" ) then
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = nil
                    elseif( data == "SolidColor" ) then
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = (oldColors and (((istable( oldColors ) and not oldColors.r) and oldColors[1]) or oldColors)) or Color( 125, 125, 125 )
                    else
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = ((istable( oldColors ) and not oldColors.r) and oldColors) or { oldColors, oldColors }
                    end

                    BS_ConfigCopyTable.GENERAL.Rarities[v.Key][2] = data
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end

        local deleteButton = vgui.Create( "DButton", rarityPanel )
        deleteButton:SetText( "" )
        deleteButton:SetSize( 40, 40 )
        deleteButton:SetPos( rarityBack:GetWide()-rarityNum:GetWide()-10-10-deleteButton:GetWide(), rarityBack:GetTall()-10-deleteButton:GetTall() )
        local alpha = 0
        local deleteMat = Material( "materials/bricks_server/delete.png" )
        deleteButton.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 4 ), 8 )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
            surface.SetMaterial( deleteMat )
            local iconSize = 24
            surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
        end
        deleteButton.DoClick = function()
            BRICKS_SERVER.Func.CreatePopoutQuery( "Are you sure you want to remove this rarity?", self, self.panelWide, self.panelTall, "Confirm", "Cancel", function()
                table.remove( BS_ConfigCopyTable.GENERAL.Rarities, v.Key )
                self:Refresh()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )

                BRICKS_SERVER.Func.CreateTopNotification( "Rarity successfully removed!", 3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
            end )
        end

        if( v[2] == "Gradient" or v[2] == "Fade" or v[2] == "SolidColor" ) then
            local colorsBack = vgui.Create( "DPanel", rarityPanel )
            colorsBack:SetSize( 0, 30 )
            colorsBack:SetPos( 10+10, rarityBack:GetTall()-10-colorsBack:GetTall() )
            colorsBack.Paint = function( self2, w, h ) end
            colorsBack.AddColor = function( color, doClick )
                colorsBack:SetWide( colorsBack:GetWide()+colorsBack:GetTall()+((colorsBack:GetWide() > 0 and 5) or 0) )

                local colorButton = vgui.Create( "DButton", colorsBack )
                colorButton:SetText( "" )
                colorButton:Dock( LEFT )
                colorButton:DockMargin( 0, 0, 5, 0 )
                colorButton:SetWide( colorsBack:GetTall() )
                local alpha = 0
                local x, y, w, h = 0, 0, colorButton:GetWide(), colorButton:GetWide()
                colorButton.Paint = function( self2, w, h )
                    local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )
                    if( x != toScreenX or y != toScreenY ) then
                        x, y = toScreenX, toScreenY
                    end

                    draw.RoundedBox( 8, 0, 0, w, h, color )
        
                    if( not self2:IsDown() and self2:IsHovered() ) then
                        alpha = math.Clamp( alpha+10, 0, 125 )
                    else
                        alpha = math.Clamp( alpha-10, 0, 125 )
                    end
            
                    surface.SetAlphaMultiplier( alpha/255 )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
                    surface.SetAlphaMultiplier( 1 )
                end
                colorButton.DoClick = function()
                    doClick( colorButton, x+w-5, y+(h/2) )
                end
            end

            if( v[2] == "Gradient" or v[2] == "Fade" ) then
                for key, val in pairs( v[3] ) do
                    colorsBack.AddColor( val, function( colorButton, x, y )
                        colorButton.Menu = vgui.Create( "bricks_server_popupdmenu" )
                        colorButton.Menu:AddOption( "Edit Color", function() 
                            BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), val, function( color ) 
                                BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3][key] = color
                                self:Refresh()
                                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                        end )
                        if( #v[3] > 2 ) then
                            colorButton.Menu:AddOption( "Remove", function() 
                                if( #v[3] <= 2 ) then return end

                                table.remove( BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3], key )
                                self:Refresh()
                                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                            end )
                        end
                        colorButton.Menu:Open( colorButton, x, y-(colorButton.Menu:GetTall()/2) )
                    end )
                end

                colorsBack:SetWide( colorsBack:GetWide()+colorsBack:GetTall()+((colorsBack:GetWide() > 0 and 5) or 0) )

                local colorAddButton = vgui.Create( "DButton", colorsBack )
                colorAddButton:SetText( "" )
                colorAddButton:Dock( LEFT )
                colorAddButton:DockMargin( 0, 0, 5, 0 )
                colorAddButton:SetWide( colorsBack:GetTall() )
                local alpha = 0
                local addMat = Material( "materials/bricks_server/add_16_thin.png" )
                colorAddButton.Paint = function( self2, w, h )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        
                    if( not self2:IsDown() and self2:IsHovered() ) then
                        alpha = math.Clamp( alpha+10, 0, 255 )
                    else
                        alpha = math.Clamp( alpha-10, 0, 255 )
                    end
            
                    surface.SetAlphaMultiplier( alpha/255 )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
                    surface.SetAlphaMultiplier( 1 )
            
                    BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 0 ), 8 )
        
                    surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
                    surface.SetMaterial( addMat )
                    local iconSize = 16
                    surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
                end
                colorAddButton.DoClick = function()
                    BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), Color( 125, 125, 125 ), function( color ) 
                        table.insert( BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3], color )
                        self:Refresh()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end
            else
                colorsBack.AddColor( v[3], function()
                    BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), v[3], function( color ) 
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = color
                        self:Refresh()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end )
            end
        end
    end
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_rarities", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dcategorylist.lua:

local PANEL = {}

function PANEL:Init()

	self.pnlCanvas:DockPadding( 0, 0, 0, 0 )

end

function PANEL:AddItem( item )

	item:Dock( TOP )
	DScrollPanel.AddItem( self, item )
	self:InvalidateLayout()

end

function PANEL:Add( name, backColor, fillBackColor )

	local Category = vgui.Create( "bricks_server_dcollapsiblecategory", self )
	Category:SetLabel( "" )
	Category:SetList( self )
	Category.backColor = backColor
	Category.headerText = name
	Category.fillBackColor = fillBackColor

	self:AddItem( Category )

	return Category

end

function PANEL:Paint( w, h )

end

function PANEL:UnselectAll()

	for k, v in pairs( self:GetChildren() ) do

		if ( v.UnselectAll ) then
			v:UnselectAll()
		end

	end

end

derma.DefineControl( "bricks_server_dcategorylist", "", PANEL, "bricks_server_scrollpanel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dmenubar.lua:

local PANEL = {}

AccessorFunc( PANEL, "m_bBackground",		"PaintBackground",	FORCE_BOOL )
AccessorFunc( PANEL, "m_bBackground",		"DrawBackground",	FORCE_BOOL ) -- deprecated
AccessorFunc( PANEL, "m_bIsMenuComponent",	"IsMenu",			FORCE_BOOL )

Derma_Hook( PANEL, "Paint", "Paint", "MenuBar" )

function PANEL:Init()

	self:Dock( TOP )
	self:SetTall( 24 )

	self.Menus = {}

end

function PANEL:GetOpenMenu()

	for k, v in pairs( self.Menus ) do
		if ( v:IsVisible() ) then return v end
	end

	return nil

end

function PANEL:AddOrGetMenu( label )

	if ( self.Menus[ label ] ) then return self.Menus[ label ] end
	return self:AddMenu( label )

end

function PANEL:AddMenu( label )

	local m = DermaMenu()
	m:SetDeleteSelf( false )
	m:SetDrawColumn( true )
	m:Hide()
	self.Menus[ label ] = m

	local b = self:Add( "DButton" )
	b:SetText( label )
	b:Dock( LEFT )
	b:DockMargin( 5, 0, 0, 0 )
	b:SetIsMenu( true )
	b:SetPaintBackground( false )
	b:SizeToContentsX( 16 )
	b.DoClick = function()

		if ( m:IsVisible() ) then
			m:Hide()
			return
		end

		local x, y = b:LocalToScreen( 0, 0 )
		m:Open( x, y + b:GetTall(), false, b )

	end

	b.OnCursorEntered = function()
		local opened = self:GetOpenMenu()
		if ( !IsValid( opened ) || opened == m ) then return end
		opened:Hide()
		b:DoClick()
	end

	return m

end

function PANEL:OnRemove()

	for id, pnl in pairs( self.Menus ) do
		pnl:Remove()
	end

end

derma.DefineControl( "bricks_server_dmenubar", "", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dvscrollbar.lua:
--[[

	DVScrollBar

	Usage:

	Place this control in your panel. You will ideally have another panel or
		control which is bigger than the original panel. This is the Canvas.

	scrollbar:SetUp( _barsize_, _canvassize_ ) should be called whenever
		the size of your 'canvas' changes.

	scrollbar:GetOffset() can be called to get the offset of the canvas.
		You should call this in your PerformLayout function and set the Y
		pos of your canvas to this value.

	Example:

	function PANEL:PerformLayout()

		local Wide = self:GetWide()
		local YPos = 0

		-- Place the scrollbar
		self.VBar:SetPos( self:GetWide() - 16, 0 )
		self.VBar:SetSize( 16, self:GetTall() )

		-- Make sure the scrollbar knows how big our canvas is
		self.VBar:SetUp( self:GetTall(), self.pnlCanvas:GetTall() )

		-- Get data from the scrollbar
		YPos = self.VBar:GetOffset()

		-- If the scrollbar is enabled make the canvas thinner so it will fit in.
		if ( self.VBar.Enabled ) then Wide = Wide - 16 end

		-- Position the canvas according to the scrollbar's data
		self.pnlCanvas:SetPos( self.Padding, YPos + self.Padding )
		self.pnlCanvas:SetSize( Wide - self.Padding * 2, self.pnlCanvas:GetTall() )

	end

--]]

local PANEL = {}

function PANEL:Init()
	self.Offset = 0
	self.Scroll = 0
	self.CanvasSize = 1
	self.BarSize = 1
	self.cornerRadius = 5

	self.btnGrip = vgui.Create( "DScrollBarGrip", self )
	local Alpha = 0
	self.btnGrip.Paint = function( self2, w, h )
		if( h >= self.BarSize-1 ) then return end

		if( self2:IsHovered() ) then
			Alpha = math.Clamp( Alpha+10, 0, 100 )
		else
			Alpha = math.Clamp( Alpha-10, 0, 100 )
		end
	
		if( self.roundedBoxEx ) then
			draw.RoundedBoxEx( self.cornerRadius, 0, 0, w, h, (self.barColor or BRICKS_SERVER.Func.GetTheme( 3 )), self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight )
		else
			draw.RoundedBox( self.cornerRadius, 0, 0, w, h, (self.barColor or BRICKS_SERVER.Func.GetTheme( 3 )) )
		end

		surface.SetAlphaMultiplier( Alpha/255 )
		if( self.roundedBoxEx ) then
			draw.RoundedBoxEx( self.cornerRadius, 0, 0, w, h, (self.barDownColor or BRICKS_SERVER.Func.GetTheme( 2 )), self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight )
		else
			draw.RoundedBox( self.cornerRadius, 0, 0, w, h, (self.barDownColor or BRICKS_SERVER.Func.GetTheme( 2 )) )
		end
		surface.SetAlphaMultiplier( 1 )
	end

	self:SetSize( 10, 15 )
	self:SetEnabled( true )
end

function PANEL:SetRoundedCorners( roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight )
	self.roundedBoxEx = true
	self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight = roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight
end

function PANEL:SetRounded( cornerRadius )
	self.cornerRadius = cornerRadius
end

function PANEL:SetEnabled( b )

	if ( !b ) then

		self.Offset = 0
		self:SetScroll( 0 )
		self.HasChanged = true

	end

	self:SetMouseInputEnabled( b )
	self:SetVisible( b )

	-- We're probably changing the width of something in our parent
	-- by appearing or hiding, so tell them to re-do their layout.
	if ( self.Enabled != b ) then

		self:GetParent():InvalidateLayout()

		if ( self:GetParent().OnScrollbarAppear ) then
			self:GetParent():OnScrollbarAppear()
		end

	end

	self.Enabled = b

end

function PANEL:Value()

	return self.Pos

end

function PANEL:BarScale()

	if ( self.BarSize == 0 ) then return 1 end

	return self.BarSize / ( self.CanvasSize + self.BarSize )

end

function PANEL:SetUp( _barsize_, _canvassize_ )

	self.BarSize = _barsize_
	self.CanvasSize = math.max( _canvassize_ - _barsize_, 1 )

	self:InvalidateLayout()

end

function PANEL:OnMouseWheeled( dlta )

	if ( !self:IsVisible() ) then return false end

	-- We return true if the scrollbar changed.
	-- If it didn't, we feed the mousehweeling to the parent panel

	if( self.btnGrip:GetTall() >= self.BarSize-1 ) then return end

	return self:AddScroll( dlta * -2 )

end

function PANEL:AddScroll( dlta )

	local OldScroll = self:GetScroll()

	dlta = dlta * 25
	self:SetScroll( self:GetScroll() + dlta )

	return OldScroll != self:GetScroll()

end

function PANEL:SetScroll( scrll )

	if ( !self.Enabled ) then self.Scroll = 0 return end
	
	self.Scroll = math.Clamp( scrll, 0, self.CanvasSize )

	self:InvalidateLayout()

	-- If our parent has a OnVScroll function use that, if
	-- not then invalidate layout (which can be pretty slow)

	local func = self:GetParent().OnVScroll
	if ( func ) then

		func( self:GetParent(), self:GetOffset() )

	else

		self:GetParent():InvalidateLayout()

	end

end

function PANEL:AnimateTo( scrll, length, delay, ease )

	local anim = self:NewAnimation( length, delay, ease )
	anim.StartPos = self.Scroll
	anim.TargetPos = scrll
	anim.Think = function( anim, pnl, fraction )

		pnl:SetScroll( Lerp( fraction, anim.StartPos, anim.TargetPos ) )

	end

end

function PANEL:GetScroll()

	if ( !self.Enabled ) then self.Scroll = 0 end
	return self.Scroll

end

function PANEL:GetOffset()

	if ( !self.Enabled ) then return 0 end
	return self.Scroll * -1

end

function PANEL:Think()
end

function PANEL:Paint( w, h )
	if( self.roundedBoxEx ) then
		draw.RoundedBoxEx( self.cornerRadius, 0, 0, w, h, (self.backColor or BRICKS_SERVER.Func.GetTheme( 2 )), self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight )
	else
		draw.RoundedBox( self.cornerRadius, 0, 0, w, h, (self.backColor or BRICKS_SERVER.Func.GetTheme( 2 )) )
	end
end

function PANEL:OnMousePressed()

	local x, y = self:CursorPos()

	local PageSize = self.BarSize

	if ( y > self.btnGrip.y ) then
		self:SetScroll( self:GetScroll() + PageSize )
	else
		self:SetScroll( self:GetScroll() - PageSize )
	end

end

function PANEL:OnMouseReleased()

	self.Dragging = false
	self.DraggingCanvas = nil
	self:MouseCapture( false )

	self.btnGrip.Depressed = false

end

function PANEL:OnCursorMoved( x, y )

	if ( !self.Enabled ) then return end
	if ( !self.Dragging ) then return end

	local x, y = self:ScreenToLocal( 0, gui.MouseY() )

	-- Uck.
	y = y - self.HoldPos

	local TrackSize = self:GetTall() - self.btnGrip:GetTall()

	y = y / TrackSize

	self:SetScroll( y * self.CanvasSize )

end

function PANEL:Grip()

	if ( !self.Enabled ) then return end
	if ( self.BarSize == 0 ) then return end

	self:MouseCapture( true )
	self.Dragging = true

	local x, y = self.btnGrip:ScreenToLocal( 0, gui.MouseY() )
	self.HoldPos = y

	self.btnGrip.Depressed = true

end

function PANEL:PerformLayout()

	local Wide = self:GetWide()
	local Scroll = self:GetScroll() / self.CanvasSize
	local BarSize = math.max( self:BarScale() * ( self:GetTall() ), 10 )
	local Track = self:GetTall() - BarSize
	Track = Track + 1

	Scroll = Scroll * Track

	self.btnGrip:SetPos( 0, Scroll )
	self.btnGrip:SetSize( Wide, BarSize )
end

derma.DefineControl( "bricks_server_dvscrollbar", "A Scrollbar", PANEL, "Panel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_menu.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize( ScrW()*0.6, ScrH()*0.65 )
    self:Center()
    self:SetHeader( BRICKS_SERVER.CONFIG.GENERAL["Server Name"] )
    self.removeOnClose = false
    self.centerOnSizeChanged = true

    self.onCloseFunc = function()
        if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
            BRICKS_SERVER.Func.SendAdminConfig()
        end
    end

    if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
		BS_ConfigCopyTable = table.Copy( BRICKS_SERVER.CONFIG )
	end
end

function PANEL:FillTabs()
    if( IsValid( self.sheet ) ) then
        if( IsValid( self.sheet.ActiveButton ) ) then
            self.previousSheet = self.sheet.ActiveButton.label
        end
        self.sheet:Remove()
    end

    local originalW, originalH = ScrW()*0.6, ScrH()*0.65 
    local newW = originalW+200

    self.sheet = vgui.Create( "bricks_server_colsheet", self )
    self.sheet:Dock( FILL )
    self.sheet.OnSheetChange = function( active )
        if( active.label == BRICKS_SERVER.Func.L( "config" ) and (self:GetWide() != newW or self:GetTall() != originalH) ) then
            self:SizeTo( newW, originalH, 0.2 )
        elseif( active.label != BRICKS_SERVER.Func.L( "config" ) and (self:GetWide() != originalW or self:GetTall() != originalH) ) then
            self:SizeTo( originalW, originalH, 0.2 )
        end
    end

    local donationRank
    for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
        if( BRICKS_SERVER.Func.IsInGroup( LocalPlayer(), v[1] ) ) then
            donationRank = k
            break
        end
    end

    local height = 55
    local avatarBackSize = height
    local textStartPos = 65
    
    local avatarBack = vgui.Create( "DPanel", self.sheet.Navigation )
    avatarBack:Dock( TOP )
    avatarBack:DockMargin( 10, 10, 0, 10 )
    avatarBack:SetTall( height )
    avatarBack.Paint = function( self2, w, h )
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        draw.NoTexture()
        BRICKS_SERVER.Func.DrawCircle( (h-avatarBackSize)/2+(avatarBackSize/2), h/2, avatarBackSize/2, 45 )

        draw.SimpleText( LocalPlayer():Nick(), "BRICKS_SERVER_Font23", textStartPos, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )

        if( BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank] ) then
            draw.SimpleText( BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank][1], "BRICKS_SERVER_Font20", textStartPos, h/2-2, (BRICKS_SERVER.CONFIG.GENERAL.Groups[donationRank][3] or BRICKS_SERVER.Func.GetTheme( 5 )), 0, 0 )
        else
            draw.SimpleText( BRICKS_SERVER.Func.GetAdminGroup( LocalPlayer() ), "BRICKS_SERVER_Font20", textStartPos, h/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
        end
    end

    local distance = 2

    local avatarIcon = vgui.Create( "bricks_server_circle_avatar" , avatarBack )
    avatarIcon:SetPos( (height-avatarBackSize)/2+distance, (height-avatarBackSize)/2+distance )
    avatarIcon:SetSize( avatarBackSize-(2*distance), avatarBackSize-(2*distance) )
    avatarIcon:SetPlayer( LocalPlayer(), 64 )

    local profilePage = vgui.Create( "bricks_server_profile", self.sheet )
    profilePage:Dock( FILL )
    profilePage:DockMargin( 10, 10, 10, 10 )
    profilePage:FillPanel( self )
    profilePage.Paint = function( self, w, h ) end 
    self.sheet:AddSheet( BRICKS_SERVER.Func.L( "profile" ), profilePage, false, "profile_24.png" )

    local settingsPage = vgui.Create( "bricks_server_settings", self.sheet )
    settingsPage:Dock( FILL )
    settingsPage:DockMargin( 10, 10, 10, 10 )
    settingsPage.Paint = function( self, w, h ) end 
    self.sheet:AddSheet( BRICKS_SERVER.Func.L( "settings" ), settingsPage, false, "settings_24.png" )

    self.adminCreated = nil
    
    function self.RefreshAdminPerms()
        if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) and not self.adminCreated ) then
            self.sheet:AddLinebreak()
            
            -- PLAYERS PAGE --
            local adminPlayersPanelBack = vgui.Create( "bricks_server_admin", self.sheet )
            adminPlayersPanelBack:Dock( FILL )
            adminPlayersPanelBack.Paint = function( self, w, h ) end 
            self.sheet:AddSheet( BRICKS_SERVER.Func.L( "players" ), adminPlayersPanelBack, false, "players_24.png" )

            -- MODULES PAGE --
            local adminModulesPanel = vgui.Create( "bricks_server_config_modules", self.sheet )
            adminModulesPanel:Dock( FILL )
            adminModulesPanel.Paint = function( self, w, h ) end 
            self.sheet:AddSheet( BRICKS_SERVER.Func.L( "modules" ), adminModulesPanel, function()
                adminModulesPanel:FillPanel() 
            end, "modules_24.png" )

            -- CONFIG PAGE --
            local adminConfigPanel = vgui.Create( "bricks_server_config", self.sheet )
            adminConfigPanel:Dock( FILL )
            adminConfigPanel.Paint = function( self, w, h ) end 
            self.sheet:AddSheet( BRICKS_SERVER.Func.L( "config" ), adminConfigPanel, function()
                adminConfigPanel:FillPanel() 
            end, "admin_24.png" )

            self.adminCreated = true
        end
    end
    self.RefreshAdminPerms()

    if( self.previousSheet ) then
        self.sheet:SetActiveSheet( self.previousSheet )
    end
end

vgui.Register( "bricks_server_menu", PANEL, "bricks_server_dframe" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_numberwang.lua:

local PANEL = {}

AccessorFunc( PANEL, "m_numMin",		"Min" )
AccessorFunc( PANEL, "m_numMax",		"Max" )
AccessorFunc( PANEL, "m_iDecimals",		"Decimals" ) -- The number of decimal places in the output
AccessorFunc( PANEL, "m_fFloatValue",	"FloatValue" )
AccessorFunc( PANEL, "m_iInterval",		"Interval" )

-- AnchorValue and UnAnchorValue functions are internally used for "drag-changing" the value
local function AnchorValue( wang, button, mcode )

	button:OldOnMousePressed( mcode )
	wang.mouseAnchor = gui.MouseY()
	wang.valAnchor = wang:GetValue()

end

local function UnAnchorValue( wang, button, mcode )

	button:OldOnMouseReleased( mcode )
	wang.mouseAnchor = nil
	wang.valAnchor = nil

end

-- ScrollValue function is internally used for "scrolling" the value using mouse wheel
local function ScrollValue( wang, button, delta )

	wang:SetValue( wang:GetValue() + delta )

end

function PANEL:Init()

	self:SetDecimals( 2 )
	self:SetTall( 20 )
	self:SetMinMax( 0, 100 )

	self:SetInterval( 1 )

	self:SetUpdateOnType( true )
	self:SetNumeric( true )

	self.OnChange = function() self:OnValueChanged( self:GetValue() ) end

	self.Up = vgui.Create( "DButton", self )
	self.Up:SetText( "" )
	self.Up.DoClick = function( button, mcode ) self:SetValue( self:GetValue() + self:GetInterval() ) end
	self.Up.Paint = function( panel, w, h ) derma.SkinHook( "Paint", "NumberUp", panel, w, h ) end

	self.Up.OldOnMousePressed = self.Up.OnMousePressed
	self.Up.OldOnMouseReleased = self.Up.OnMouseReleased
	self.Up.OnMousePressed = function( button, mcode ) AnchorValue( self, button, mcode ) end
	self.Up.OnMouseReleased = function( button, mcode ) UnAnchorValue( self, button, mcode ) end
	self.Up.OnMouseWheeled = function( button, delta ) self:SetValue( self:GetValue() + delta ) end

	self.Down = vgui.Create( "DButton", self )
	self.Down:SetText( "" )
	self.Down.DoClick = function( button, mcode ) self:SetValue( self:GetValue() - self:GetInterval() ) end
	self.Down.Paint = function( panel, w, h ) derma.SkinHook( "Paint", "NumberDown", panel, w, h ) end

	self.Down.OldOnMousePressed = self.Down.OnMousePressed
	self.Down.OldOnMouseReleased = self.Down.OnMouseReleased
	self.Down.OnMousePressed = function( button, mcode ) AnchorValue( self, button, mcode ) end
	self.Down.OnMouseReleased = function( button, mcode ) UnAnchorValue( self, button, mcode ) end
	self.Down.OnMouseWheeled = function( button, delta ) self:SetValue( self:GetValue() + delta ) end

	self:SetValue( 0 )

end

function PANEL:HideWang()

	self.Up:Hide()
	self.Down:Hide()

end

function PANEL:Think()

	if ( self.mouseAnchor ) then
		self:SetValue( self.valAnchor + self.mouseAnchor - gui.MouseY() )
	end

end

function PANEL:SetDecimals( num )

	self.m_iDecimals = num
	self:SetValue( self:GetValue() )

end

function PANEL:SetMinMax( min, max )

	self:SetMin( min )
	self:SetMax( max )

end

function PANEL:SetMin( min )

	self.m_numMin = tonumber( min )

end

function PANEL:SetMax( max )

	self.m_numMax = tonumber( max )

end

function PANEL:GetFloatValue( max )

	if ( !self.m_fFloatValue ) then self.m_fFloatValue = 0 end

	return tonumber( self.m_fFloatValue ) or 0

end

function PANEL:SetValue( val )

	if ( val == nil ) then return end

	local OldValue = val
	val = tonumber( val )
	val = val or 0

	if ( self.m_numMax != nil ) then
		val = math.min( self.m_numMax, val )
	end

	if ( self.m_numMin != nil ) then
		val = math.max( self.m_numMin, val )
	end

	if ( self.m_iDecimals == 0 ) then

		val = Format( "%i", val )

	elseif ( val != 0 ) then

		val = Format( "%." .. self.m_iDecimals .. "f", val )

		-- Trim trailing 0's and .'s 0 this gets rid of .00 etc
		val = string.TrimRight( val, "0" )
		val = string.TrimRight( val, "." )

	end

	--
	-- Don't change the value while we're typing into it!
	-- It causes confusion!
	--
	if ( !self:HasFocus() ) then
		self:SetText( val )
		self:ConVarChanged( val )
	end

	self:OnValueChanged( tonumber( val ) )

end

local meta = FindMetaTable( "Panel" )

function PANEL:GetValue()

	return tonumber( meta.GetValue( self ) ) or 0

end

function PANEL:PerformLayout()

	local s = math.floor( self:GetTall() * 0.5 )

	self.Up:SetSize( s, s - 1 )
	self.Up:AlignRight( 3 )
	self.Up:AlignTop( 0 )

	self.Down:SetSize( s, s - 1 )
	self.Down:AlignRight( 3 )
	self.Down:AlignBottom( 2 )

end

function PANEL:SizeToContents()

	-- Size based on the max number and max amount of decimals

	local chars = 0

	local min = math.Round( self:GetMin(), self:GetDecimals() )
	local max = math.Round( self:GetMax(), self:GetDecimals() )

	local minchars = string.len( "" .. min .. "" )
	local maxchars = string.len( "" .. max .. "" )

	chars = chars + math.max( minchars, maxchars )

	if ( self:GetDecimals() && self:GetDecimals() > 0 ) then

		chars = chars + 1 -- .
		chars = chars + self:GetDecimals()

	end

	self:InvalidateLayout( true )
	self:SetWide( chars * 6 + 10 + 5 + 5 )
	self:InvalidateLayout()

end

function PANEL:GetFraction( val )

	local Value = val or self:GetValue()

	local Fraction = ( Value - self.m_numMin ) / ( self.m_numMax - self.m_numMin )
	return Fraction

end

function PANEL:SetFraction( val )

	local Fraction = self.m_numMin + ( (self.m_numMax - self.m_numMin) * val )
	self:SetValue( Fraction )

end

function PANEL:OnValueChanged( val )

end

function PANEL:GetTextArea()

	return self

end

function PANEL:GenerateExample( ClassName, PropertySheet, Width, Height )

	local ctrl = vgui.Create( ClassName )
	ctrl:SetDecimals( 0 )
	ctrl:SetMinMax( 0, 255 )
	ctrl:SetValue( 3 )

	PropertySheet:AddSheet( ClassName, ctrl, nil, true, true )

end

derma.DefineControl( "bricks_server_numberwang", "Menu Option Line", PANEL, "bricks_server_textentry" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_popupdmenu.lua:
local PANEL = {}

AccessorFunc( PANEL, "m_bDeleteSelf", "DeleteSelf" )

function PANEL:Init()
	self:SetSize( 150, 45 )

	self:SetAlpha( 0 )
	self:AlphaTo( 255, 0.05, 0 )

	self.optionCount = 0
end

local optionH = 45
function PANEL:AddOption( label, onClick, ... )
	local args = { ... }

	self.optionCount = self.optionCount+1

	self:SetTall( self.optionCount*optionH )
	
	local optionButton = vgui.Create( "DButton", self )
	optionButton:Dock( TOP )
	optionButton:SetTall( optionH )
	optionButton:SetText( "" )
	optionButton.OptionPos = self.optionCount
	local alpha = 0
	optionButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			alpha = math.Clamp( alpha+20, 0, 255 )
		else
			alpha = math.Clamp( alpha-20, 0, 255 )
		end

		if( self2.OptionPos == 1 and self.optionCount > 1 ) then
			draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, alpha ), true, true, false, false)
		elseif( self2.OptionPos == self.optionCount and self.optionCount > 1 ) then
			draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, alpha ), false, false, true, true)
		elseif( self.optionCount <= 1 ) then
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, alpha ) )
		else
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, alpha ) )
			surface.DrawRect( 0, 0, w, h )
		end

		draw.SimpleText( label, "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 1, 1 )
	end
    optionButton.DoClick = function()
        onClick( unpack( args ) )
        self:Remove()
    end
end

function PANEL:Open( parent, x, y )
	self.parent = parent

	self:MakePopup()
	self:SetPos( x, y )
end

function PANEL:Think()
	if( not self:HasFocus() ) then
		if( not self.removeTime ) then
			self.removeTime = CurTime()+0.1
		end
	elseif( self.removeTime ) then
		self.removeTime = nil
	end

	if( not IsValid( self.parent ) or not self.parent:IsVisible() or (self.removeTime and CurTime() >= self.removeTime) ) then
		self:Remove()
	end
end

function PANEL:Paint( w, h )
	local x, y = self:LocalToScreen( 0, 0 )

	BRICKS_SERVER.BSHADOWS.BeginShadow()
	draw.RoundedBox( 8, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )	
	BRICKS_SERVER.BSHADOWS.EndShadow(2, 2, 1, 255, 0, 0, false )
end

vgui.Register( "bricks_server_popupdmenu", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_profile.lua:
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
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/shared/sh_gang_player.lua:
local playerMeta = FindMetaTable("Player")

function playerMeta:HasGang()
    local gangID = self:GetGangID()
    
    if( not BRICKS_SERVER_GANGS or not BRICKS_SERVER_GANGS[gangID] ) then
        return false
    end

    return gangID
end

function playerMeta:GetGangID()
    if( SERVER ) then
        return self:GetNW2Int( "BRS_GANGID", 0 )
    elseif( CLIENT ) then
        if( self == LocalPlayer() ) then 
            return BRS_GANGID or self:GetNW2Int( "BRS_GANGID", 0 )
        else
            return self:GetNW2Int( "BRS_GANGID", 0 )
        end
    end
end

function playerMeta:HasGangInvite( gangID )
    if( BRS_GANG_INBOXES and BRS_GANG_INBOXES[self:SteamID()] ) then 
        for k, v in pairs( BRS_GANG_INBOXES[self:SteamID()] ) do
            if( istable( v ) and v.Type == "GangInvite" and v.ReqInfo and v.ReqInfo[1] and v.ReqInfo[1] == gangID ) then
                return k
            end
        end
    end

    return false
end

function playerMeta:GangGetGroupData()
    local gangTable = (BRICKS_SERVER_GANGS or {})[self:GetGangID()] or {}

    if( not gangTable or not gangTable.Members or not gangTable.Members[self:SteamID()] or not gangTable.Members[self:SteamID()][2] ) then return false end
    
    local groupID = gangTable.Members[self:SteamID()][2]

    return gangTable.Roles[groupID]
end

function playerMeta:GangHasPermission( permission )
    local gangTable = (BRICKS_SERVER_GANGS or {})[self:GetGangID()] or {}

    if( gangTable.Owner == self:SteamID() ) then return true end

    if( not BRICKS_SERVER.DEVCONFIG.GangPermissions[permission] ) then return false end
    
    local groupData = self:GangGetGroupData()

    if( not groupData or not groupData[3] or not groupData[3][permission] ) then return false end

    return true
end

function playerMeta:GangCanTargetMember( targetPlySteamID )
    local gangTable = (BRICKS_SERVER_GANGS or {})[self:GetGangID()] or {}

    if( not gangTable.Members ) then return end

    local targetPlyTable = gangTable.Members[targetPlySteamID]
    if( not targetPlyTable ) then return false end

    if( gangTable.Owner == self:SteamID() ) then return true end

    local plyTable = gangTable.Members[self:SteamID()]
    if( not plyTable ) then return false end

    if( plyTable[2] >= targetPlyTable[2] ) then return false end

    return true
end

if( SERVER ) then
    util.AddNetworkString( "BRS.Net.SetGangID" )
    function playerMeta:SetGangID( gangID )
        net.Start( "BRS.Net.SetGangID" )
            net.WriteUInt( gangID, 16 )
        net.Send( self )
        
        self:SetNW2Int( "BRS_GANGID", (gangID or 0) )
    end
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_create.lua:
local PANEL = {}

function PANEL:Init()
    self.animMultiplier = 0
    self.leftBorderW = BRICKS_SERVER.Func.ScreenScale( 6 )
    self.currentStep = 1
end

function PANEL:CreateStepPanel( parent, h, text, subText )
    self.stepPanels = self.stepPanels or {}
    local stepNumber = #self.stepPanels+1

    local rounding = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin10 = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin25 = BRICKS_SERVER.Func.ScreenScale( 25 )

    local errorIconMat = Material( "bricks_server/step_error.png", "noclamp smooth" )
    local completedIconMat = Material( "bricks_server/step_completed.png", "noclamp smooth" )
    local iconSize = BRICKS_SERVER.Func.ScreenScale( 24 )

    surface.SetFont( "BRICKS_SERVER_Font22B" )
    local textW, textH = surface.GetTextSize( string.upper( text ) )

    surface.SetFont( "BRICKS_SERVER_Font20B" )
    local subTextW, subTextH = surface.GetTextSize( subText )

    local stepPanel = vgui.Create( "DPanel", parent )
    stepPanel:Dock( TOP )
    stepPanel:SetTall( h )
    stepPanel:DockMargin( 0, margin25, 0, 0 )
    stepPanel.leftW = BRICKS_SERVER.Func.ScreenScale( 50 )
    stepPanel.Paint = function( self2, w, h )
        local isAvailable = true--self.currentStep >= stepNumber or self.stepPanels[stepNumber-1].completed

        if( not isAvailable ) then
            surface.SetAlphaMultiplier( 0.5 )
        end

        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2, 200 ) )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, 100 ) )
        surface.DrawRect( self.leftBorderW, 0, self2.leftW, h )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 10 ) )
        surface.SetMaterial( self2.completed and completedIconMat or errorIconMat )
        surface.DrawTexturedRect( self.leftBorderW+self2.leftW/2-iconSize/2, h/2-iconSize/2, iconSize, iconSize )

        local highlightColor = BRICKS_SERVER.Func.GetTheme( 3 )
        if( isAvailable ) then
            highlightColor = self2.completed and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red
        end

        BRICKS_SERVER.Func.DrawPartialRoundedBox( rounding, 0, 0, 6, h, highlightColor, 2*self.leftBorderW, h )
    
        local leftMargin = self.leftBorderW+self2.leftW+margin25
        draw.SimpleText( string.upper( text ), "BRICKS_SERVER_Font22B", leftMargin, margin25, BRICKS_SERVER.Func.GetTheme( 5 ) )
        draw.SimpleText( subText, "BRICKS_SERVER_Font20B", leftMargin, margin25+textH, BRICKS_SERVER.Func.GetTheme( 6, 50 ) )
        surface.SetAlphaMultiplier( 1 )
    end
    stepPanel.requirementEntries = {}
    stepPanel.AddRequirement = function( self2, requirementText, hasPassed, infoFunc )
        surface.SetFont( "BRS.Font.Bold20" )
        requirementText = string.upper( requirementText )

        local tickIconMat = Material( "bricks_server/accept_16.png" )
        local crossIconMat = Material( "bricks_server/decline_16.png" )
        local iconSize = BRICKS_SERVER.Func.ScreenScale( 16 )
    
        local requirementEntry = vgui.Create( "DPanel", self2.requirementsPanel )
        requirementEntry:Dock( LEFT )
        requirementEntry:SetWide( self2.requirementsPanel:GetTall()+surface.GetTextSize( requirementText )+margin10+(infoFunc and self2.requirementsPanel:GetTall() or 0) )
        requirementEntry:DockMargin( 0, 0, margin10, 0 )
        requirementEntry.hasPassed = hasPassed()
        requirementEntry.Paint = function( self2, w, h )
            local highlightColor = self2.hasPassed and BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen or BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed

            draw.RoundedBox( 5, 0, 0, w, h, Color( highlightColor.r, highlightColor.g, highlightColor.b, 25 ) )

            surface.SetDrawColor( highlightColor )
            surface.SetMaterial( self2.hasPassed and tickIconMat or crossIconMat )
            surface.DrawTexturedRect( h/2-iconSize/2, h/2-iconSize/2, iconSize, iconSize )

            draw.SimpleText( requirementText, "BRS.Font.Bold20", w-margin10-(infoFunc and h or 0), h/2-1, highlightColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
        end

        if( infoFunc ) then
            local infoButton = vgui.Create( "DButton", requirementEntry )
            infoButton:Dock( RIGHT )
            infoButton:SetWide( self2.requirementsPanel:GetTall() )
            infoButton:SetText( "" )
            infoButton.Paint = function( self2, w, h )
                draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 6, 5+(self2:IsHovered() and 5 or 0) ), false, true, false, true )
        
                draw.SimpleText( "!", "BRICKS_SERVER_Font30B", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            infoButton.DoClick = infoFunc
        end

        local reqWide = self2.requirementsPanel:GetWide()
        self2.requirementsPanel:SetWide( reqWide+(reqWide != 0 and margin10 or 0)+requirementEntry:GetWide() )

        table.insert( self2.requirementEntries, { requirementEntry, hasPassed } )
    end
    stepPanel.UpdateCompletion = function( self2 )
        local requirementsCompleted = true
        for k, v in ipairs( self2.requirementEntries ) do
            local passed = v[2]()
            v[1].hasPassed = passed

            if( passed ) then continue end
            requirementsCompleted = false
        end

        self2.completed = self2.isCompletedFunc( requirementsCompleted )

        if( not self2.completed or self.currentStep > stepNumber ) then return end
        self.currentStep = stepNumber+1
    end

    stepPanel.requirementsPanel = vgui.Create( "Panel", stepPanel )
    stepPanel.requirementsPanel:SetTall( BRICKS_SERVER.Func.ScreenScale( 30 ) )
    stepPanel.requirementsPanel:SetPos( self.leftBorderW+stepPanel.leftW+margin25+subTextW+margin25, margin25+(textH+subTextH)/2-stepPanel.requirementsPanel:GetTall()/2 )

    table.insert( self.stepPanels, stepPanel )
    return stepPanel
end

function PANEL:FillPanel()
    local rounding = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin5 = BRICKS_SERVER.Func.ScreenScale( 5 )
    local margin10 = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin25 = BRICKS_SERVER.Func.ScreenScale( 25 )
    local margin50 = BRICKS_SERVER.Func.ScreenScale( 50 )

    local contentPanel = vgui.Create( "Panel", self )
    contentPanel.OnSizeChanged = function( self2, w, h )
        self2:SetPos( margin50, self.panelHeight/2-h/2 )
    end
    contentPanel:SetSize( self.panelWide-2*margin50, 0 )

    local newPageIconMat = Material( "bricks_server/gang_page_new.png", "noclamp smooth" )
    local newPageIconSize = BRICKS_SERVER.Func.ScreenScale( 75 )
    local newIconMat = Material( "bricks_server/gang_new_banner.png", "noclamp smooth" )
    local newIconSize = BRICKS_SERVER.Func.ScreenScale( 75 )

    surface.SetFont( "BRICKS_SERVER_Font40B" )
    local contentH = select( 2, surface.GetTextSize( "Создайте новую банду" ) )

    surface.SetFont( "BRICKS_SERVER_Font20B" )
    contentH = contentH+select( 2, surface.GetTextSize( "Пригласите ваших друзей в свою банду!" ) )-BRICKS_SERVER.Func.ScreenScale( 20 )

    local headerPanel = vgui.Create( "DPanel", contentPanel )
    headerPanel:Dock( TOP )
    headerPanel:SetTall( BRICKS_SERVER.Func.ScreenScale( 150 ) )
    headerPanel.leftW = BRICKS_SERVER.Func.ScreenScale( 175 )
    headerPanel.Paint = function( self2, w, h )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2, 200 ) )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, 100 ) )
        surface.DrawRect( self.leftBorderW, 0, self2.leftW, h )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 50 ) )
        surface.SetMaterial( newPageIconMat )
        surface.DrawTexturedRect( self.leftBorderW+self2.leftW/2-newPageIconSize/2, h/2-newPageIconSize/2, newPageIconSize, newPageIconSize )
        
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 25 ) )
        surface.SetMaterial( newIconMat )
        surface.DrawTexturedRect( self.leftBorderW+self2.leftW-newIconSize, 0, newIconSize, newIconSize )

        local leftMargin = self.leftBorderW+self2.leftW+(h-contentH)/2
        draw.SimpleText( "Создайте новую банду", "BRICKS_SERVER_Font40B", leftMargin-1, h/2-contentH/2-BRICKS_SERVER.Func.ScreenScale( 10 ), BRICKS_SERVER.Func.GetTheme( 6, 50 ), 0, 0 )
        draw.SimpleText( "Пригласите ваших друзей в свою банду!", "BRICKS_SERVER_Font20B", leftMargin, h/2+contentH/2+BRICKS_SERVER.Func.ScreenScale( 4 ), BRICKS_SERVER.Func.GetTheme( 6, 50 ), 0, TEXT_ALIGN_BOTTOM )
    
        if( not self2.startLoading or CurTime() >= self2.startLoading+1 or CurTime()-firstPanel.startLoading < 0.2 ) then return end

        local circleThick = BRICKS_SERVER.Func.ScreenScale( 5 )
        local circleR = BRICKS_SERVER.Func.ScreenScale( 25 )
        BRICKS_SERVER.Func.DrawArc( w-h/2, h/2, circleR, circleThick, 0, 360, BRICKS_SERVER.Func.GetTheme( 3 ) )

        local percent = CurTime()*1
        BRICKS_SERVER.Func.DrawArc( w-h/2, h/2, circleR, circleThick, -360*percent, -360*percent+50, BRICKS_SERVER.Func.GetTheme( 5 ) )
    end

    contentPanel:SetTall( headerPanel:GetTall() )

    headerPanel.gradient = vgui.Create( "bricks_server_gradientanim", headerPanel )
    headerPanel.gradient:SetPos( 0, 0 )
    headerPanel.gradient:SetSize( self.leftBorderW, headerPanel:GetTall() )
    headerPanel.gradient:SetDirection( 1 )
    headerPanel.gradient:SetCornerRadius( rounding )
    headerPanel.gradient:SetRoundedBoxDimensions( false, false, 20, false )
    headerPanel.gradient:TasteTheRainbow()
    headerPanel.gradient:StartAnim()

    local pricePanel
    local createButton = vgui.Create( "DButton", headerPanel )
    createButton:Dock( RIGHT )
    createButton:DockMargin( 0, margin50, margin25, margin50 )
    createButton:SetWide( BRICKS_SERVER.Func.ScreenScale( 200 ) )
    createButton:SetText( "" )
    createButton.Paint = function( self2, w, h )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 50 ) )

        self2.hoverPercent = math.Clamp( (self2.hoverPercent or 0)+(self2:IsHovered() and 5 or -5), 0, 100 )

        local x, y = self2:LocalToScreen( 0, 0 )
        render.SetScissorRect( x+w/2-w*(self2.hoverPercent/200), y, x+w/2+w*(self2.hoverPercent/200), y+h, true )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 100 ) )
        render.SetScissorRect( 0, 0, 0, 0, false )

        draw.SimpleText( "Создать", "BRICKS_SERVER_Font30B", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    pricePanel = vgui.Create( "DPanel", headerPanel )
    pricePanel:Dock( RIGHT )
    pricePanel:DockMargin( 0, margin50, margin25, margin50 )
    pricePanel:SetWide( BRICKS_SERVER.Func.ScreenScale( 150 ) )
    pricePanel.Paint = function( self2, w, h )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 50 ) )

        draw.SimpleText( DarkRP.formatMoney( BRICKS_SERVER.CONFIG.GANGS["Creation Fee"] or 1500 ), "BRICKS_SERVER_Font30B", w/2, h/2, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

    -- First Step
    local firstPanel = self:CreateStepPanel( contentPanel, BRICKS_SERVER.Func.ScreenScale( 150 ), "Название банды", "Выберете хорошое название." )
    contentPanel:SetTall( contentPanel:GetTall()+margin25+firstPanel:GetTall() )

    local gangNameEntry = vgui.Create( "bricks_server_textentry", firstPanel )
    gangNameEntry:SetSize( contentPanel:GetWide()*0.3, BRICKS_SERVER.Func.ScreenScale( 40 ) )
    gangNameEntry:SetPos( self.leftBorderW+firstPanel.leftW+margin25, firstPanel:GetTall()-margin25-gangNameEntry:GetTall() )
    gangNameEntry:SetFont( "BRICKS_SERVER_Font22" )
    gangNameEntry.backColor = BRICKS_SERVER.Func.GetTheme( 0, 100 )
    local newGangName = ""
    gangNameEntry.OnChange = function()
        newGangName = string.Trim( gangNameEntry:GetValue() )
        firstPanel:UpdateCompletion()
    end

    firstPanel:AddRequirement( "+" .. BRICKS_SERVER.DEVCONFIG.GangNameCharMin .. " символов", function() 
        return utf8.len( newGangName ) >= BRICKS_SERVER.DEVCONFIG.GangNameCharMin
    end )

    firstPanel:AddRequirement( "Латинница или кириллица", function()
        if string.match(newGangName,"%d") or
           string.match(newGangName,"[']+") or
           string.match(newGangName,"[\"]") or
           string.match(newGangName,"%p") then
            return false
        end
        return true
    end )

    firstPanel:AddRequirement( "< " .. BRICKS_SERVER.DEVCONFIG.GangNameCharMax .. " символов", function() 
        return utf8.len( newGangName ) <= BRICKS_SERVER.DEVCONFIG.GangNameCharMax
    end )

    -- firstPanel:AddRequirement( "Пишите только буквы/числа", function() 
    --     return not string.Replace( newGangName, " ", "" ) 
    -- end )

    firstPanel.isCompletedFunc = function( requirementsPassed )
        return requirementsPassed
    end

    -- Second Step
    local secondPanel = self:CreateStepPanel( contentPanel, BRICKS_SERVER.Func.ScreenScale( 185 ), "Изображение", "Изображение которое будет рядом с вашей бандой." )
    contentPanel:SetTall( contentPanel:GetTall()+margin25+secondPanel:GetTall() )

    secondPanel.bottom = vgui.Create( "Panel", secondPanel )
    secondPanel.bottom:Dock( BOTTOM )
    secondPanel.bottom:SetTall( BRICKS_SERVER.Func.ScreenScale( 75 ) )
    secondPanel.bottom:DockMargin( self.leftBorderW+secondPanel.leftW+margin25, 0, margin25, margin25 )

    local unselectedIconMat = Material( "bricks_server/icon_unselected.png" )
    local newGangIcon, loadingNewIcon, newGangIconMat = "", false

    local currentIconDisplay = vgui.Create( "Panel", secondPanel.bottom )
    currentIconDisplay:Dock( LEFT )
    currentIconDisplay:SetWide( BRICKS_SERVER.Func.ScreenScale( 75 ) )
    currentIconDisplay.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100 ) )

        if( loadingNewIcon ) then
            if( CurTime() >= (self2.loadingStart or 0)+1.5 ) then
                self2.loadingStart = CurTime()
            end

            local percent = math.Clamp( (CurTime()-self2.loadingStart)/1.5, 0, 1 )

            local entrySize, entryMargin = BRICKS_SERVER.Func.ScreenScale( 10 ), margin5
            local yOffset = margin5
            local totalEntryW = 3*(entrySize+entryMargin)-entryMargin
            for i = 1, 3 do
                local min = (i-1)*(1/3)
                local isActive = percent >= min and percent < i*(1/3)
                local entryPercent = math.Clamp( (percent-min)*3, 0, 1 )
                local yAdjustment = isActive and (entryPercent < 0.5 and (entryPercent/0.5)*yOffset or yOffset-((entryPercent-0.5)/0.5*yOffset)) or 0

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.DrawRect( w/2-totalEntryW/2+(i-1)*(entryMargin+entrySize), h/2-entrySize/2-yAdjustment, entrySize, entrySize )
            end

            return
        end
        
        local unselectedIconSize = newGangIconMat and h*0.75 or BRICKS_SERVER.Func.ScreenScale( 64 )

        surface.SetDrawColor( newGangIconMat and BRICKS_SERVER.DEVCONFIG.BaseThemes.White or BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.SetMaterial( newGangIconMat or unselectedIconMat )
        surface.DrawTexturedRect( w/2-unselectedIconSize/2, h/2-unselectedIconSize/2, unselectedIconSize, unselectedIconSize )
    end

    local presetsSpacer = vgui.Create( "Panel", secondPanel.bottom )
    presetsSpacer:Dock( LEFT )
    presetsSpacer:SetWide( 4 )
    presetsSpacer:DockMargin( margin50, margin10, margin50, margin10 )
    presetsSpacer.Paint = function( self2, w, h )
        draw.RoundedBox( w/2, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100 ) )
    end

    surface.SetFont( "BRICKS_SERVER_Font20B" )

    local presetsHeader = vgui.Create( "Panel", secondPanel.bottom )
    presetsHeader:Dock( LEFT )
    presetsHeader:SetWide( surface.GetTextSize( "Стандартные изображения" ) )
    presetsHeader.Paint = function( self2, w, h )
        draw.SimpleText( "Пресеты", "BRICKS_SERVER_Font22B", 0, h/2+2, BRICKS_SERVER.Func.GetTheme( 4 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( "Стандартные изображения", "BRICKS_SERVER_Font20B", 0, h/2-2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), 0, 0 )
    end

    local presetsPanel = vgui.Create( "Panel", secondPanel.bottom )
    presetsPanel:Dock( LEFT )
    presetsPanel:SetTall( secondPanel.bottom:GetTall()-2*margin5 )
    presetsPanel:DockMargin( margin25, margin5, 0, margin5 )

    local customUrlEntry

    for k, v in ipairs( BRICKS_SERVER.DEVCONFIG.PresetGangIcons ) do
        local presetIconMat = Material( v, "noclamp smooth" )
    
        local currentIconDisplay = vgui.Create( "DButton", presetsPanel )
        currentIconDisplay:Dock( LEFT )
        currentIconDisplay:SetWide( presetsPanel:GetTall() )
        currentIconDisplay:DockMargin( 0, 0, margin5, 0 )
        currentIconDisplay:SetText( "" )
        currentIconDisplay.Paint = function( self2, w, h )
            local isSelected = v == newGangIcon
            self2.hoverAlpha = math.Clamp( (self2.hoverAlpha or 0)+(self2:IsHovered() and 5 or -5), 0, 100 )

            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100+(isSelected and 50 or self2.hoverAlpha) ) )

            local borderH = 3
            BRICKS_SERVER.Func.DrawPartialRoundedBox( 5, 0, h-borderH, w, borderH, BRICKS_SERVER.Func.GetTheme( 5, isSelected and 255 or self2.hoverAlpha ), w, 10, 0, h-10 )

            local iconSize = h*0.75
    
            surface.SetDrawColor( 255, 255, 255 )
            surface.SetMaterial( presetIconMat )
            surface.DrawTexturedRect( w/2-iconSize/2, h/2-iconSize/2, iconSize, iconSize )
        end
        currentIconDisplay.DoClick = function()
            if( newGangIcon == v ) then
                newGangIcon = ""
                newGangIconMat = nil
            else
                newGangIcon = v
                newGangIconMat = presetIconMat
                loadingNewIcon = false
                customUrlEntry:SetValue( "" )
            end

            secondPanel:UpdateCompletion()
        end
    end

    presetsPanel:SetWide( #BRICKS_SERVER.DEVCONFIG.PresetGangIcons*(presetsPanel:GetTall()+margin5)-margin5 )

    local customSpacer = vgui.Create( "Panel", secondPanel.bottom )
    customSpacer:Dock( LEFT )
    customSpacer:SetWide( 4 )
    customSpacer:DockMargin( margin50, margin10, margin50, margin10 )
    customSpacer.Paint = function( self2, w, h )
        draw.RoundedBox( w/2, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100 ) )
    end
    
    local customHeader = vgui.Create( "Panel", secondPanel.bottom )
    customHeader:Dock( LEFT )
    customHeader:SetWide( surface.GetTextSize( "Своё изображение" ) )
    customHeader.Paint = function( self2, w, h )
        draw.SimpleText( "Своя иконка", "BRICKS_SERVER_Font22B", 0, h/2+2, BRICKS_SERVER.Func.GetTheme( 4 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( "Своё изображение", "BRICKS_SERVER_Font20B", 0, h/2-2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), 0, 0 )
    end

    local customEntryBar = vgui.Create( "Panel", secondPanel.bottom )
    customEntryBar:Dock( LEFT )
    customEntryBar:SetWide( ScrW()*0.1 )
    local verticalMargin = (secondPanel.bottom:GetTall()-BRICKS_SERVER.Func.ScreenScale( 40 ))/2
    customEntryBar:DockMargin( margin25, verticalMargin, 0, verticalMargin )
    customEntryBar.Paint = function( self2, w, h )
        if( not IsValid( customUrlEntry ) or customUrlEntry:GetValue() == "" or customUrlEntry:GetValue() == newGangIcon ) then return end

        local oldClipping = DisableClipping( true )
        draw.SimpleText( "Нажмите Enter что-бы создать.", "BRICKS_SERVER_Font20B", w/2, h, BRICKS_SERVER.Func.GetTheme( 6, 50 ), TEXT_ALIGN_CENTER, 0 )
        DisableClipping( oldClipping )
    end

    customUrlEntry = vgui.Create( "bricks_server_textentry", customEntryBar )
    customUrlEntry:Dock( BOTTOM )
    customUrlEntry:SetTall( BRICKS_SERVER.Func.ScreenScale( 40 ) )
    customUrlEntry:DockMargin( 0, 0, 0, 0 )
    customUrlEntry:SetFont( "BRICKS_SERVER_Font22" )
    customUrlEntry.backColor = BRICKS_SERVER.Func.GetTheme( 0, 100 )
    customUrlEntry.OnEnter = function( self2 )
        local newValue = self2:GetValue()
        loadingNewIcon = true
        newGangIcon = newValue
        newGangIconMat = nil

        BRICKS_SERVER.Func.GetImage( newGangIcon, function( mat )
            if( newGangIcon != newValue ) then return end
            newGangIconMat = mat 
            loadingNewIcon = false
        end )

        secondPanel:UpdateCompletion()
    end

    local validImageEndings = { ".png", ".jpg", ".jpeg" }
    secondPanel:AddRequirement( ".png, .jpg или .jpeg", function() 
        if( table.HasValue( BRICKS_SERVER.DEVCONFIG.PresetGangIcons, newGangIcon ) ) then return true end

        for _, v in ipairs( validImageEndings ) do
            if( string.EndsWith( newGangIcon, v ) ) then return true end
        end

        return false
    end )

    -- BRICKS_SERVER.DEVCONFIG.GangURLWhitelist
    -- Show whitelsited urls when hovering?
    secondPanel:AddRequirement( "Вайтлист ссылок", function() 
        if( table.HasValue( BRICKS_SERVER.DEVCONFIG.PresetGangIcons, newGangIcon ) ) then return true end

        for _, v in ipairs( BRICKS_SERVER.DEVCONFIG.GangURLWhitelist ) do
            if( string.StartWith( newGangIcon, v ) ) then return true end
        end

        return false
    end, function( self2 )
        if( IsValid( self2.hoverPopup ) ) then
            self2.hoverPopup:Remove()
        end

        local x, y = self2:LocalToScreen( 0, 0 )

        self2.hoverPopup = vgui.Create( "DFrame" )
        self2.hoverPopup:SetSize( 300, 500 )
        self2.hoverPopup:Center()
        self2.hoverPopup:MakePopup()
        self2.hoverPopup:SetTitle( "" )
        self2.hoverPopup:DockPadding( 25, 50, 0, 0 )

        for k, v in ipairs( BRICKS_SERVER.DEVCONFIG.GangURLWhitelist ) do
            local urlEntry = vgui.Create( "DLabel", self2.hoverPopup )
            urlEntry:Dock( TOP )
            urlEntry:SetText( v )
            urlEntry:SetFont( "Trebuchet24" )
            urlEntry:SizeToContentsY()
        end
    end )

    secondPanel.isCompletedFunc = function( requirementsPassed )
        return requirementsPassed
    end

    -- Create Button
    createButton.DoClick = function()
        for k, v in ipairs( self.stepPanels ) do
            if( not v.completed ) then return end
        end
        
        net.Start( "BRS.Net.CreateGang" )
            net.WriteString( newGangIcon )
            net.WriteString( newGangName )
        net.SendToServer()
    end
    local RequireCreated = false
    local tempgangname
    net.Receive("BRS.Net.CreateGang",function()
        if IsValid(self) then
            tempgangname = newGangName
            if !RequireCreated then
                firstPanel:AddRequirement("Такое название существует!", function()
                    return string.nlower(tempgangname) != string.nlower(newGangName)
                end )
                RequireCreated = true
            end
            firstPanel:UpdateCompletion()
        end
    end)
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_create", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/achievements/client/cl_gang_achievements.lua:
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "gangAchievements" ), "bricks_server_config_gang_achievements", "gangs" )
--PATH lua/autorun/client/cl_fixes.lua:
local cmds, cache = {}, {}
cmds.r_shadowrendertotexture = 0
cmds.r_shadowmaxrendered = 0
cmds.mat_shadowstate = 0
cmds.cl_interp_ratio = 2
cmds.cl_phys_props_enable = 0
cmds.cl_phys_props_max = 0
cmds.props_break_max_pieces = 0
cmds.r_propsmaxdist = 1
cmds.violence_agibs = 0
cmds.violence_hgibs = 0
cmds.rope_smooth = 0
cmds.rope_wind_dist = 0
cmds.rope_shake = 0
cmds.violence_ablood = 1
cmds.r_3dsky = 0
cmds.r_waterdrawreflection = 0
cmds.r_waterforcereflectentities = 0
cmds.r_teeth = 0
-- cmds.r_ropetranslucent = 0
cmds.r_maxmodeldecal = 0
cmds.r_maxdlights = 5
cmds.r_decals = 0
cmds.r_drawmodeldecals = 0
cmds.r_drawdetailprops = 0
cmds.r_worldlights = 0
cmds.cl_forcepreload = 1
cmds.snd_mix_async = 1
cmds.cl_ejectbrass = 0
cmds.cl_detaildist = 0
cmds.cl_show_splashes = 0
cmds.r_drawflecks = 0
cmds.r_waterDrawRefraction = 0
cmds.r_fastzreject = -1
cmds.cl_ejectbrass = 0
cmds.muzzleflash_light = 0
cmds.cl_wpn_sway_interp = 0
cmds.in_usekeyboardsampletime = 0
cmds.r_radiosity = 2

for cvar, val in pairs(cmds) do
	cache[cvar] = GetConVarString(cvar)
	RunConsoleCommand(cvar, val)
end

local math_Clamp = math.Clamp
timer.Create( "lerp_timer", 2, 0, function() 
    local ratio = 2.4
    local lerp = 60
    local online = #player.GetAll()
    if online > 85 then 
        lerp = math_Clamp( online*ratio, 60, 250 )
    end 
    RunConsoleCommand( "cl_interp",lerp/1000 )
end)

local rubbish = {
	'HUDDrawTargetID',
	'HUDDrawPickupHistory',
	'DrawDeathNotice',
	'GUIMouseDoublePressed',
	'PostProcessPermitted',
	'ForceDermaSkin',

	'OnAchievementAchieved',
	'PreventScreenClicks',

	'DrawMonitors',
	'PreDrawEffects',
	'PostDrawEffects',
	'PreDrawHalos',
	'GetMotionBlurValues',

	'PreDrawTranslucentRenderables',
	'PostDrawTranslucentRenderables',
	'PreDrawOpaqueRenderables',
	'PostDrawOpaqueRenderables'
}

timer.Simple(2, function()
	local GM = GAMEMODE or gamemode.Get()
	for i = 1, #rubbish do
		local key = rubbish[i]
		GM[key] = nil
	end
end)
--PATH addons/111mod/lua/autorun/client/cl_fooc.lua:
net.Receive("oocmsg", function()
local tableread = net.ReadTable()
if not tableread.player:IsValid() then return end
local nick = tableread.player:Nick()
local job = tableread.player:Team()
chat.AddText( Color(129, 218, 170, 255), "[Общий Чат] ", team.GetColor(job), nick or "nil", ": ", Color( 255, 255, 255, 255), tableread.message )
end)

net.Receive("advertmsg", function()
local tableread = net.ReadTable()
if not tableread.player:IsValid() then return end
local nick = tableread.player:Nick()
local job = tableread.player:Team()
chat.AddText( Color(196, 37, 21, 255), "[Реклама] ", team.GetColor(job), nick or "nil", ": ", Color( 255, 255, 255, 255), tableread.message )
end)

net.Receive("darkwebmsg", function()
local tableread = net.ReadTable()
if not tableread.player:IsValid() then return end
local nick = tableread.player:Nick()
local job = tableread.player:Team()
if LocalPlayer():isCP() then return end
chat.AddText( Color(96, 96, 96, 255), "[DarkWEB] ", team.GetColor(job), nick or "nil", ": ", Color( 255, 255, 255, 255), tableread.message )
end)

net.Receive("error_message_revamp", function()
chat.AddText( Color(224, 37, 0, 255), "[Error] ", Color(255, 255, 255, 255), "Ошибка" )
end)
--PATH addons/svnv_ru_lib/lua/autorun/client/cl_netnotify.lua:
net.Receive( "_NotifyNet", function( len, pl )
		local typemsg = net.ReadInt(32)
		local typemsg2 = net.ReadInt(31)
		local msg	  = net.ReadString()
		
		GAMEMODE:AddNotify(msg, typemsg, typemsg2)
	 
	    MsgC(Color(255, 20, 20, 255), "[SpaceRP] ", Color(200, 200, 200, 255), msg, "\n")
	end )
--PATH addons/executioner/lua/autorun/client/executioner_hitman_hud.lua:
if not CLIENT then return end

surface.CreateFont( "rHit.Font.HUD", { font = "BFHUD", size = 32, weight = 800, bold = true } )
surface.CreateFont( "rHit.Font.Info", { font = "BFHUD", size = 48, weight = 800, bold = true } )
surface.CreateFont( "rHit.Font.Walls", { font = "BFHUD", size = 32, weight = 800, bold = true } )

local _a, _t = {}, nil

net.Receive( 'rHit.Send.a', function() _a = net.ReadTable() end )
net.Receive( 'rHit.Send.t', function() _t = net.ReadEntity() end )

local function SecondsToClock( seconds )
    local seconds = tonumber( seconds )
    if seconds <= 0 then
        return "00:00"
    else
        mins = string.format( "%02.f", math.floor( seconds / 60 ) )
        secs = string.format( "%02.f", math.floor( seconds - mins * 60 ) )
        return mins.. ":" .. secs
    end
end

function Executioner.OnComplete()
    local price = net.ReadInt( 32 ) or -1
    local frame = vgui.Create( 'base_panel' )
    frame:SetSize( 425, 170 )
    frame:SetDraggable( false )
    frame:SetPos( ScrW() / 2 - frame:GetWide() / 2, ScrH() - frame:GetTall() )
    frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.3, 0, 1 )
    timer.Simple( 3, function()
        if IsValid( frame ) then
            frame:MoveTo( ScrW() + frame:GetWide(), ScrH() / 2 - frame:GetTall() / 2, 0.3, 0, 1 )
            timer.Simple( 1, function() if IsValid( frame ) then frame:Remove() _t = nil end end )
        end
    end  )
    frame:Deploy( false, true )
    frame.Paint = function( me, w, h )
        Graphics.DrawText( Executioner.Config.Hit_Completed, 'rHit.Font.Large', w / 2, 10, Executioner.Config.Hit_Completed_Color )
        Graphics.DrawText( string.format( '%s%s', '+', DarkRP.formatMoney( price ) ), 'rHit.Font.Large', w / 2, 75, Executioner.Config.Confirmation.Money_Text_Color )
    end
end
net.Receive( 'rHit.Send.ScreenMessage', Executioner.OnComplete )

function Executioner.PaintDisplay()
    if not _a[ LocalPlayer():SteamID() ] or not IsValid( _t ) then return end
    draw.RoundedBox(10,weight(1537),height(66),weight(368),height(135),Color(45,45,45))
    draw.SimpleText( Executioner.Config.EnableHitTime and Executioner.Config.Time_Left .. SecondsToClock( LocalPlayer():GetNW2Int( 'rHit_HitTime', 0 ) ) or Executioner.Config.Active_Hit, 'EVSDDB20', weight(1552), height(72), Color( 255, 255, 255 ) )
    draw.SimpleText( Executioner.Config.Phone.Target ..' '.. _t:Nick(), 'EVSDDB20', weight(1552), height(107))
    draw.SimpleText( Executioner.Config.Occupation ..' '.. team.GetName( _t:Team() ), 'EVSDDB20', weight(1552), height(135) )
    if Executioner.Config.EnableDistance then
        draw.SimpleText( Executioner.Config.Distance_Text..' ', 'EVSDDB20', weight(1552), height(170) )
        draw.SimpleText(LocalPlayer():GetPos():Distance( _t:GetPos() ) > Executioner.Config.RangeDistance and math.Round( LocalPlayer():GetPos():Distance( _t:GetPos() ), 0 ) .. 'м' or ' Близко', 'EVSDDB20', weight(1635), height(170) )
    end

  --  if not LocalPlayer():HasGambitPlus() then return end
    -- if LocalPlayer():GetPos():Distance( _t:GetPos() ) > 850 then return end
    -- local pos = _t:EyePos():ToScreen()
    -- draw.SimpleTextOutlined("ЦЕЛЬ","ui.20",pos.x, pos.y,Color(255,0,0),TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0))

end
hook.Add( 'HUDPaint', 'rHit.Render.Display', Executioner.PaintDisplay )

function Executioner.PaintInfo()
    if not Executioner.Config.Draw_Info then hook.Remove( 'HUDPaint', 'rHit.Render.Info' ) return end
    local trace = LocalPlayer():GetEyeTrace().Entity
    if not trace then return end
    if IsValid( trace ) and trace:IsPlayer() and Executioner.Config.Hitman_Teams[ team.GetName( trace:Team() ) ] then
        if LocalPlayer():GetPos():Distance( trace:GetPos() ) > 120 then return end
        local w, h = ScrW(), ScrH()
        Graphics.DrawText( Executioner.Config.Hitman_Text, 'rHit.Font.Info', w / 2 - 5, h / 2 + 15, Color( 255, 255, 255 ) )
        Graphics.DrawText( _a[ trace:SteamID() ] and Executioner.Config.Busy_Text or Executioner.Config.Enable_Face_To_Face and Executioner.Config.Request_Hit_Text or '', 'rHit.Font.Info', w / 2, h / 2 + 50, _a[ trace:SteamID() ] and Color( math.abs( math.sin( CurTime() * 2 ) * 255 ), 0, 0 ) or Color( 200, 0, 0 ) )
    end
end
hook.Add( 'HUDPaint', 'rHit.Render.Info', Executioner.PaintInfo )

--PATH addons/executioner/lua/autorun/client/executioner_other.lua:
if not CLIENT then return end

surface.CreateFont( "rHit.Font.Large", { font = "BFHUD", size = 80, weight = 800, bold = true } )
surface.CreateFont( "rHit.Font.Phone", { font = "Calibri", size = 30, weight = 700 } )

--> This is the default DarkRP alternative (Small menu pops up.) <--
function Executioner.DeployConfirmation()
    local data = net.ReadTable()
    local price, target, name = data.price, data.target, ''
    local frame = vgui.Create( 'base_panel' )
    frame:SetSize( weight(429), height(484) )
    frame:SetDraggable( false )
    frame:SetPos( ScrW() / 2 - frame:GetWide() / 2, 0 )
    frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.1, 0, 1 )
    frame:Deploy()

    frame.Paint = function( self, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(45,45,45))
        if Executioner.Config.EnableBlur then Graphics.BlurMenu( self, 10, 15, 245 ) end
        draw.SimpleText( 'У вас новый заказ!', 'EVSDDB20', weight(13),height(15) )
    end

    local base_canvis = vgui.Create( 'DPanel', frame )
    base_canvis:SetSize( weight(400), height(303) )
    base_canvis:SetPos( weight(15),height(51) )
    base_canvis.Paint = function( me, w, h )
        name, job = IsValid( target ) and target:Nick() or 'Unknown', IsValid( target ) and team.GetName( target:Team() ) or 'Unknown'
        draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
        draw.SimpleText( name, 'EVSDM20', weight(13),height(11) )
        draw.SimpleText( job, 'EVSDM20', weight(13),height(36), team.GetColor(target:Team()) )
    end

    local model_panel = vgui.Create( 'DModelPanel', base_canvis )
    model_panel:SetSize( weight(210), height(225) )
    model_panel:SetPos( weight(95), height(65) )
    model_panel:SetModel( target:GetModel() )
    model_panel:SetAnimated( true )
    model_panel.LayoutEntity = function() return end
    model_panel:SetCamPos( Vector( 55, 0, 63 ) )
    model_panel:SetLookAt( Vector( 45, 0, 58 ) )
    Graphics.PlaySequence( model_panel, table.Random( Executioner.emoteTable ) )
    model_panel.Paint = function( me, w, h )
        baseclass.Get( 'DModelPanel' ).Paint( me, w, h )
        --Graphics.DrawText( DarkRP.formatMoney( price ), 'rHit.Font.Generic', w / 2, h - 32, Executioner.Config.Confirmation.Money_Text_Color )
    end

    local pricepan = vgui.Create('DPanel',frame)
    pricepan:SetSize(weight(400),height(50))
    pricepan:SetPos(weight(15),height(361))
    pricepan.Paint = function(self,w,h)
        draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
        draw.SimpleText(DarkRP.formatMoney( price ),'EVSDDB20',w/2,h/2,Color(22,165,96),1,1)
    end

    local accept_offer = vgui.Create( 'DButton', frame )
    accept_offer:SetSize( weight(194), height(55) )
    accept_offer:SetPos( weight(15),height(418) )
    accept_offer:SetText( Executioner.Config.Confirmation.Accept_Hit )
    accept_offer:SetFont( 'EVSDDB20' )
    accept_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_accept' ].text )
    accept_offer.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(1,116,222))
    end

    local deny_offer = vgui.Create( 'DButton', frame )
    deny_offer:SetSize( weight(194), height(55) )
    deny_offer:SetPos( weight(221),height(418) )
    deny_offer:SetText( Executioner.Config.Confirmation.Deny_Hit )
    deny_offer:SetFont( 'EVSDDB20' )
    deny_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_deny' ].text )
    deny_offer.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(120,0,0))
    end

    accept_offer.DoClick = function( me, w, h ) net.Start( 'rHit.Config.OrderHit' ) net.SendToServer() frame:Close() end
    deny_offer.DoClick = function( me, w, h ) net.Start( 'rHit.Confirm.Rejection' ) net.SendToServer() frame:Close() end

    timer.Simple( Executioner.Config.ResponseTime, function() if IsValid( frame ) then frame:Close()  end end )
end
net.Receive( 'rHit.Open.Confirmation', Executioner.DeployConfirmation )

function Executioner.UnPackMessage( message )
    message = message or ''
    chat.AddText( Color( 230, 32, 25 ), Executioner.Config.ChatPrefix, Executioner.Config.PrefixColor, net.ReadString() or message )
end
net.Receive( 'rHit.Send.Message', Executioner.UnPackMessage )

function Executioner.DeployBonus()
    local frame = vgui.Create( 'base_panel' )
    frame:SetSize( weight(368), height(159) )
    frame:SetDraggable( false )
    frame:SetPos(weight(776),height(66))
    frame:Deploy( false, true )

    frame.Paint = function( self, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(45,45,45))
        draw.SimpleText('Бонус','EVSDDB20',w/2,height(12),Color(255,255,255),1)
        draw.DrawText('Убейте цель бонусным оружием\nВам временно выдадут оружие','EVSDDB20',w/2,height(32),Color(255,255,255),1)
    end

    local accept_offer = vgui.Create( 'DButton', frame )
    accept_offer:SetSize( weight(156),height(45) )
    accept_offer:SetPos( weight(23),height(102) )
    accept_offer:SetText( Executioner.Config.Bonus.Accept_Offer )
    accept_offer:SetFont( 'EVSDDB20' )
    accept_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_accept' ].text )
    accept_offer.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(1,116,222))
    end
    accept_offer.DoClick = function()
        net.Start( 'rHit.Bonus.Accept' ) net.SendToServer()
        frame:MoveTo( 0 - frame:GetWide(), 125, 0.2, 0, 1 )
        timer.Simple( 1, function() if IsValid( frame ) then frame:Remove() end end )
    end

    local deny_offer = vgui.Create( 'DButton', frame )
    deny_offer:SetSize( weight(156),height(45) )
    deny_offer:SetPos( weight(188),height(102) )
    deny_offer:SetText( Executioner.Config.Bonus.Deny_Offer )
    deny_offer:SetFont( 'EVSDDB20' )
    deny_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_deny' ].text )
    deny_offer.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(120,0,0))

    end
    deny_offer.DoClick = function( self, w, h ) frame:Close() end
    timer.Simple( Executioner.Config.BonusTime, function()
        if IsValid( frame ) then
            Executioner.UnPackMessage( Executioner.Language.BonusNoReply )
            frame:MoveTo( 0 - frame:GetWide(), 125, 0.2, 0, 1 )
            timer.Simple( 1, function() if IsValid( frame ) then frame:Remove() end end )
        end
    end )
end
net.Receive( 'rHit.Open.Bonus', Executioner.DeployBonus )

function Executioner.OpenPhone()
    local data = net.ReadTable()
    local frame = vgui.Create( 'base_panel' )
    frame:SetSize( weight(478), height(484) )
    frame:SetDraggable( false )
    frame:SetPos( ScrW() / 2 - frame:GetWide() / 2, 0 )
    frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.1, 0, 1 )
    frame:Deploy( true )

    frame.Paint = function( self, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(45,45,45))
        if Executioner.Config.EnableBlur then Graphics.BlurMenu( self, 10, 15, 240 ) end
        draw.SimpleText( Executioner.Config.Phone.Main_Title, 'EVSDDB20', weight(19), height(15) )
    end

    local base_canvis = vgui.Create( 'DPanelList', frame )
    base_canvis:SetSize( weight(440), height(416) )
    base_canvis:SetPos( weight(19), height(51) )
    base_canvis:SetSpacing( 2 )
    base_canvis:EnableVerticalScrollbar( true )
    base_canvis.Paint = function( me, w, h )
        Graphics.PaintBar( me, Color( 30, 30, 30, 220 ), Color( 28, 28, 28 ), Color( 26, 26, 26 ) )
    end

    for k, v in pairs( data ) do
        local player_index = vgui.Create( 'DPanel', base_canvis )
        player_index:SetSize( 0, 90 )
        player_index.Paint = function( me, w, h )
            draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
            Graphics.DrawText( IsValid( v.target ) and Executioner.Config.Phone.Target .. v.target:Nick() or Executioner.Config.Phone.Target .. 'Отключен', 'EVSDM20', weight(69), height(6), Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
            if v.customer then
            Graphics.DrawText( type( v.customer ) == 'Player' and IsValid( v.customer ) and Executioner.Config.Phone.Customer .. v.customer:Nick() or type( v.customer ) == 'string' and Executioner.Config.Phone.Customer .. v.customer or Executioner.Config.Phone.Customer 'Disconnected.', 'EVSDM16', weight(69), height(31), Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
            else
                Graphics.DrawText( 'Неизвестный.', 'EVSDM16', weight(69), height(31), Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
            end
            Graphics.DrawText( IsValid( v.target ) and Executioner.Config.Phone.Price .. DarkRP.formatMoney( v.price ) or 'НЕИЗВ', 'EVSDM16', weight(69), height(51), Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
            draw.RoundedBox(3,weight(10),height(11),weight(50),height(54),Color(45,45,45))
        end

        local mdl = vgui.Create('SpawnIcon', player_index)
        mdl:SetSize(weight(45), height(45))
        mdl:SetPos(weight(17),height(20))
        mdl:SetModel(v.target:GetModel() or 'models/Items/item_item_crate.mdl')
        mdl:SetTooltip()
        mdl:SetDisabled(true)
        mdl:SetMouseInputEnabled(false)
        mdl.DoClick = function() return end


        local accept_offer = vgui.Create( 'DButton', player_index )
        accept_offer:SetSize( weight(132), height(45) )
        accept_offer:SetPos( weight(299),height(16) )
        accept_offer:SetText( Executioner.Config.Confirmation.Accept_Hit )
        accept_offer:SetFont( 'EVSDDB20' )
        accept_offer:SetTextColor( Color( 255, 255, 255 ) )
        accept_offer.Paint = function( me, w, h )
            draw.RoundedBox(10,0,0,w,h,Color(1,116,222))
        end
        accept_offer.DoClick = function()
            net.Start( 'rHit.Confirm.PhoneAccept' )
                net.WriteEntity( v.target )
            net.SendToServer()
            frame:Close()
        end

        base_canvis:AddItem( player_index )
    end
end
net.Receive( 'rHit.Open.Phonebox', Executioner.OpenPhone )

--PATH addons/foodmode/lua/autorun/client/hfm_open_stove.lua:
function HFMCloseStoveMenu()
	if HFMStovePanel and HFMStovePanel:IsValid() then
		HFMStovePanel:Remove()
		HFMStovePanel = nil
	end
end

function HFMOpenStoveMenu(Data)
	HFMCloseStoveMenu()
	
	HFMStovePanel = vgui.Create("HFMStovePanel")
	HFMStovePanel:SetSize(800,480)
	HFMStovePanel:Center()
	HFMStovePanel:Install(Data)
	HFMStovePanel:MakePopup()
end

local PANEL = {}
	
function PANEL:Init()
	self:SetTitle("")
	self:ShowCloseButton(false)
	self:SetDraggable(false)
	self.CreatedTime = CurTime()
end

function PANEL:Install(Data)
	local TopPanel = vgui.Create("DPanel",self)
	TopPanel:SetPos(0,0)
	TopPanel:SetSize(self:GetWide(),40)
	TopPanel.Paint = function(slf)
		surface.SetDrawColor(0,0,0,255)
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
		draw.SimpleText("Кухонная Плита",  "FM2_30", 10,20, Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end
	
	local CloseButton = vgui.Create("DButton",TopPanel)
	CloseButton:SetPos(TopPanel:GetWide()-102,2)
	CloseButton:SetSize(100,36)
	CloseButton:SetText("")
	CloseButton.Paint = function(slf)
			if slf:IsHovered() then
				surface.SetDrawColor(0,100,180,225)
			else
				surface.SetDrawColor(0,0,0,255)
			end
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
		draw.SimpleText("Закрыть", "FM2_30", slf:GetWide()/2,slf:GetTall()/2, Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	CloseButton.DoClick = function(slf)
		HFMCloseStoveMenu()
		surface.PlaySound('beep-21.mp3')
	end
	
	self.D3DPanel = vgui.Create("DPanel",self)
	self.D3DPanel:SetPos(0,40)
	self.D3DPanel:SetSize(self:GetWide()-300,self:GetTall()-40)
	self.D3DPanel.Paint = function(slf)
		local x, y = slf:LocalToScreen( 0, 0 )
		local w, h = slf:GetSize()
		
		local ViewPos = Vector(50,-20,70)
		
		cam.Start3D( ViewPos + Vector(0,10,0), (Vector(0,0,0)-ViewPos):Angle(), 70, x, y, w, h)
			FM_CMODEL_MASTER_MS:SetModel("models/ent/stove.mdl")
			FM_CMODEL_MASTER_MS:SetRenderOrigin(Vector(10,10,-25))
			FM_CMODEL_MASTER_MS:SetRenderAngles(Angle(0,0,0))
			FM_CMODEL_MASTER_MS:SetupBones()
			FM_CMODEL_MASTER_MS:DrawModel()
			
			FM_CMODEL_MASTER_MS:SetModel("models/props_interiors/pot02a.mdl")
			for k,v in pairs(HFMPotPositions) do
				if Data.Pots[k] then
					FM_CMODEL_MASTER_MS:SetRenderOrigin(Vector(10,10,-25) + v)
					FM_CMODEL_MASTER_MS:SetRenderAngles(Angle(0,10  + 45,0))
					FM_CMODEL_MASTER_MS:SetupBones()
					FM_CMODEL_MASTER_MS:DrawModel()
				end
			end
		cam.End3D()
	end
	
	
	self.RightBar = vgui.Create("DPanel",self)
	self.RightBar:SetPos(self:GetWide()-300,40)
	self.RightBar:SetSize(300,self:GetTall()-40)
	self.RightBar.Paint = function(slf)
	end
	
	self.RightBarLister = vgui.Create("DPanelList", self.RightBar)
	self.RightBarLister:SetPos(0, 0)
	self.RightBarLister:SetSize(self.RightBar:GetSize())
	self.RightBarLister:SetSpacing(5);
	self.RightBarLister:SetPadding(5);
	self.RightBarLister:EnableVerticalScrollbar(true);
	self.RightBarLister:EnableHorizontal(false);
	
	self:UpdateStove(Data)
end

function PANEL:CreateCookingMenu(slot,DATA)
local Main = self

	if self.CookingMenu and self.CookingMenu:IsValid() then
		self.CookingMenu:Remove()
		self.CookingMenu = nil
	end
	self.CookingMenu = vgui.Create("DPanel",self)
	self.CookingMenu:SetPos(0,40)
	self.CookingMenu:SetSize(self:GetWide()-300,self:GetTall()-40)
	self.CookingMenu.Paint = function(slf)

	end
	
	local Lister = vgui.Create("DPanelList", self.CookingMenu)
	Lister:SetPos(0, 0)
	Lister:SetSize(self.CookingMenu:GetWide(),self.CookingMenu:GetTall()-30)
	Lister:SetSpacing(5);
	Lister:SetPadding(5);
	Lister:EnableVerticalScrollbar(true);
	Lister:EnableHorizontal(true);
	
	function Lister:AddMenuIcon(luaname,Amount2CanCook)
		local PN = vgui.Create("ItemStoreSlot")
		PN:SetItem( GenerateFoodItem(luaname) )
		PN:SetSize(95, 95)
		PN.DoClick = function(slf)
			local function DoCook()
				HFMDoCook(luaname,slot,DATA.Ent)
			end
			Main:ShowIngredients(luaname,DoCook)
		end
		
		local PN2 = vgui.Create("DModelPanel", PN)
		PN2:SetModel(HFM_Config.TableFoods[luaname][1][4])
		PN2:SetSize(95, 95)
		PN2:SetFOV(15)
		PN2:SetCamPos(Vector(0,10,100))

		PN2.DoClick = function(slf)
			local function DoCook()
				HFMDoCook(luaname,slot,DATA.Ent)
			end
			Main:ShowIngredients(luaname,DoCook)
		end
		self:AddItem(PN)
	end
	
	function Lister:ShowMenusAvailable()
		self:Clear()
		
		for k,v in pairs(HFM_Foods) do
			if v.CookingTime and v.Ingredients then
				local Amount2CanCook
				for k,v in pairs(v.Ingredients) do
					Amount2CanCook = Amount2CanCook or math.floor(LocalPlayer():HFM_AmountItem(k)/v)
					Amount2CanCook = math.min(Amount2CanCook,math.floor(LocalPlayer():HFM_AmountItem(k)/v))
				end
				self:AddMenuIcon(k,Amount2CanCook)
			end
		end
	end
	
	Lister:ShowMenusAvailable()
end

function PANEL:ShowIngredients(luaname,DoFunc)
	self.RightBarLister:Clear()
	local FTB = HFMGetTable(luaname)
	
	local function AddLabel(text,tall,bgcolor)
		bgcolor = bgcolor or Color(0,0,0,150)
		tall = tall or 30
		
		local LB = vgui.Create("DPanel")
		LB:SetSize(self.RightBarLister:GetWide(),tall)
		LB.Paint = function(slf)
			draw.SimpleText(text, "FM2_25", slf:GetWide()/2,slf:GetTall()/2, Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		end
		self.RightBarLister:AddItem(LB)
	end
	
	local function AddIngredients(lname,amount)
		local ITB = HFMGetTable(lname)
		local BG = vgui.Create("DPanel")
		BG:SetSize(self.RightBarLister:GetWide(),50)
		BG.Paint = function(slf)
			draw.SimpleText(ITB:GetPrintName(), "FM2_25", 50,25, Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			
			if amount <= LocalPlayer():HFM_AmountItem(lname) then
				draw.SimpleText("x"..amount .. " / x" .. LocalPlayer():HFM_AmountItem(lname), "FM2_25", slf:GetWide()-10,25, Color(255,255,255,255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("x"..amount .. " / x" .. LocalPlayer():HFM_AmountItem(lname), "FM2_25", slf:GetWide()-10,25, Color(255,0,0,255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
			end
		end
			local PN = vgui.Create("ItemStoreSlot", BG)
			PN:SetItem( GenerateFoodItem(lname) )
			PN:SetSize(40,40)
			PN:SetPos(5,5)
			PN.DoClick = function() end

		local PN2 = vgui.Create("DModelPanel", PN)
		PN2:SetModel(HFM_Config.TableFoods[lname][1][4])
		PN2:SetSize(40, 40)
		PN2:SetFOV(5)
		PN2:SetPos(5,5)
		PN2:SetCamPos(Vector(0,0,100))

		PN2.DoClick = function(slf)
			-- local function DoCook()
				-- HFMDoCook(luaname,slot,DATA.Ent)
			-- end
			-- Main:ShowIngredients(luaname,DoCook)
		end
		self.RightBarLister:AddItem(BG)
	end
	
	AddLabel(FTB:GetPrintName())
	
	for k,v in pairs(FTB.Ingredients or {}) do
		AddIngredients(k,v)
	end
	
	local LB = vgui.Create("DButton")
	LB:SetSize(self.RightBarLister:GetWide(),30)
	LB:SetText("")
	LB.Paint = function(slf)
			if slf:IsHovered() then
				surface.SetDrawColor(30,200,30,255)
			else
				surface.SetDrawColor(30,200,30,200)
			end
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
		draw.SimpleText("Приготовить", "FM2_25", slf:GetWide()/2,slf:GetTall()/2, Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	LB.DoClick = function(slf)
		if LocalPlayer():CanCookFood(luaname) then
			DoFunc()
		end
	end
	self.RightBarLister:AddItem(LB)
	
	local LB = vgui.Create("DButton")
	LB:SetSize(self.RightBarLister:GetWide(),30)
	LB:SetText("")
	LB.Paint = function(slf)
			if slf:IsHovered() then
				surface.SetDrawColor(200,30,30,200)
			else
				surface.SetDrawColor(200,30,30,255)
			end
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
		draw.SimpleText("Отмена", "FM2_25", slf:GetWide()/2,slf:GetTall()/2, Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	LB.DoClick = function(slf)
		self:UpdateStove()
		self.CookingMenu:Remove()
		self.CookingMenu = nil
	end
	self.RightBarLister:AddItem(LB)
end

function PANEL:UpdateStove(DATA)
	DATA = DATA or self.LastStoveData
	self.LastStoveData = DATA
	local Main = self
	self.RightBarLister:Clear()
	for k = 1, 6 do
		local Burner = vgui.Create("DButton")
		Burner:SetSize(self.RightBarLister:GetWide(), 67)
		Burner:SetText("")
		function Burner:GetProgress()
			if DATA.Pots[k] then
				local SP = DATA.Pots[k]
				local Per =  math.min(1,(SP.TimeSpent + ( CurTime()-Main.CreatedTime )) / SP.TimeRequired)
				return Per , SP
			else
				return 0
			end
		end
		
		Burner.Paint = function(slf)
			if slf:IsHovered() then
				surface.SetDrawColor(0,100,180,225)
			else
				surface.SetDrawColor(0,0,0,255)
			end
			surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
			
			local Per,SP = slf:GetProgress()
			if Per == 1 then
				-- draw.SimpleText("Забрать" , "FM2B_30", slf:GetWide()/2, slf:GetTall()/2,Color(255,255,255,100),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				draw.SimpleText("Забрать" , "FM2_30", slf:GetWide()/2, slf:GetTall()/2,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
			elseif Per > 0 then
				surface.SetDrawColor(0, 0, 0, 200)
				surface.DrawRect(10, 10, slf:GetWide() - 20, slf:GetTall() - 20)
				
				surface.SetDrawColor(255 * (1 - Per), 255 * Per, 0, 200)
				surface.DrawRect(11, 11, (slf:GetWide() - 24) * Per, slf:GetTall() - 21)
			else
				-- draw.SimpleText("Приготовить" , "FM2_25", slf:GetWide()/2, slf:GetTall()/2,Color(255,255,255,100),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
				draw.SimpleText("Приготовить" , "FM2_30", slf:GetWide()/2, slf:GetTall()/2,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
			end
		end
		Burner.DoClick = function(slf)
			local Per,SP = slf:GetProgress()
			if Per == 0 then
				self:CreateCookingMenu(k,DATA)
			end
			if Per == 1 then
				local fr = ui.Create('ui_frame', function(self, p)
					self:SetPos(100, 200)
					self:SetSize(400, 205)
					self:ShowCloseButton(true)
					self:SetTitle('Выберите куда положить готовую еду')
					self:Center()
					self:MakePopup()
				end)

				ui.Create('DButton', function(self)
					self:SetSize(398, 50)
					self:SetPos(1, 50)
					self:SetText('Взять в инвентарь')

					self.DoClick = function()
						fr:Remove()
						HFMGetItem(DATA.Ent,k,true)
					end
				end, fr)

				ui.Create('DButton', function(self)
					self:SetSize(398, 50)
					self:SetPos(1, 102)
					self:SetText('Поместить в ингридиенты')

					self.DoClick = function()
						fr:Remove()
						HFMGetItem(DATA.Ent,k,false)
					end
				end, fr)
				
			end
		end
		
		self.RightBarLister:AddItem(Burner)
	end
end

function PANEL:Paint()
	surface.SetDrawColor(0,0,0,225)
	surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
end

vgui.Register("HFMStovePanel",PANEL,"DFrame")
--PATH lua/autorun/client/thirdperson_cl.lua:
require"cvar"
local rp = {}

cvar.Register("invert_thirdp_mouse"):SetDefault(false, true):AddMetadata("Menu", "Инвертировать мышь третьего лица"):ConCommand(function(self, pl, args)
    if (not args[1]) then
        self:SetValue(not self:GetValue())
    else
        self:SetValue(args[1] == "1")
    end
end)

local state = false

cvar.Register'enable_thirdperson':SetDefault(false, true):AddMetadata('Menu', 'Вид от третьего лица'):ConCommand(function(self, pl, args)
    if (not args[1]) then
        cvar.SetValue(not cvar.GetValue())
        self:SetValue(not self:GetValue())
    else
        self:SetValue(args[1] == "1")
    end
end)

local function toggleThirdPerson()
    if (not state) then
        cvar.SetValue("enable_thirdperson", not cvar:GetValue("enable_thirdperson"))
        state = true
    else
        cvar.SetValue("enable_thirdperson", false)
        state = false
    end
end

hook.Add("PlayerButtonUp", "dThirdPerson_keyBind", function(player, buttonId)
    if not IsFirstTimePredicted() then return end
    if player ~= LocalPlayer() then return end
    if buttonId ~= KEY_T then return end
    if player:IsTyping() then return end
    toggleThirdPerson()
end)

concommand.Add("ctp", function(player)
    if player ~= LocalPlayer() then return end
    if gui.IsGameUIVisible() then return end
    toggleThirdPerson()
end)

concommand.Add("thirdperson_toggle", function(player)
    if player ~= LocalPlayer() then return end
    if gui.IsGameUIVisible() then return end
    toggleThirdPerson()
end)

rp.thirdPerson = {}
local toggleCamLock = false
local x = CreateClientConVar("thirdperson_x", "120")
local y = CreateClientConVar("thirdperson_y", "0")
local z = CreateClientConVar("thirdperson_z", "15")
local xmin, xmax = 40, 120
local ymin, ymax = -40, 40
local zmin, zmax = -15, 15
local fov = 90
local dist = 0

local function isThirdPerson(pl)
    pl = pl or LocalPlayer()
    if ((IsValid(pl:GetViewEntity()) and pl:GetViewEntity():GetClass() == "gmod_cameraprop") or (IsValid(pl:GetActiveWeapon()) and pl:GetActiveWeapon():GetClass() == "gmod_camera")) then return false end

    return cvar.GetValue("enable_thirdperson") and (not pl:InVehicle()) and (pl:GetObserverMode() == OBS_MODE_NONE) and pl:Alive()
end

rp.thirdPerson.isEnabled = isThirdPerson
local view = {}
local freecam_ang
local lastAim = nil
local htfilter = function(ent)
	return !(ent:GetParent() == LocalPlayer() or ent:IsPlayer())
end

hook('CalcView', 'ThirdPerson.CalcView', function(pl, pos, angles)
	local tp = isThirdPerson(pl)
	if ((tp or dist > 0) and pl.camera_ang) then
		if (tp) then
			dist = math.min(dist + (1 - dist) * FrameTime() * 9, 1)
			if (dist > .99) then dist = 1 end
		else
			dist = math.max(dist - dist * FrameTime() * 9, 0)
			if (dist < .01) then dist = 0 end
		end

		local toggleCamLock = toggleCamLock
		if (pl:KeyDown(IN_WALK)) then toggleCamLock = !toggleCamLock end

		if (freecam_ang and !toggleCamLock) then
			pl.camera_ang = Angle(freecam_ang.p, freecam_ang.y, freecam_ang.r)
			freecam_ang = nil
		elseif (!freecam_ang and toggleCamLock) then
			freecam_ang = Angle(pl.camera_ang.p, pl.camera_ang.y, pl.camera_ang.r)
		end

		pos = pos + (pl.camera_ang:Forward() * dist * (-math.Clamp(x:GetInt(), xmin, xmax))) + (pl.camera_ang:Right() * dist * (math.Clamp(y:GetInt(), ymin, ymax))) + (pl.camera_ang:Up() * dist * (math.Clamp(z:GetInt(), zmin, zmax)))

		local hulltr = util.TraceHull({
			start = pl:GetShootPos(),
			endpos = pos,
			filter = htfilter,
			mask = MASK_SHOT_HULL,
			mins = Vector(-10, -10, -10),
			maxs = Vector(10, 10, 10)
		})

		if (hulltr.Hit) then
			pos = hulltr.HitPos + (pl:GetShootPos() - hulltr.HitPos):GetNormal() * 10
		end

		local aimtr = util.TraceLine({
			start = pl:EyePos(),--pos + (pl.camera_ang:Forward() * (-z:GetInt() + 45)),
			endpos = pos + (pl.camera_ang:Forward() * 100000),
			filter = htfilter
		})

		view.origin = pos
		view.fov = fov
		view.angles = pl.camera_ang
		view.drawviewer = true

		if (tp and pl:GetMoveType() == MOVETYPE_NOCLIP) then
			pl:SetEyeAngles(freecam_ang or pl.camera_ang)
		elseif (tp and !toggleCamLock) then
			local newAng = (aimtr.HitPos - pl:EyePos()):Angle()
			sp = aimtr.HitPos
			pl:SetEyeAngles(newAng)
		end

		return view
	else
		if (view and view.drawviewer) then
			view.drawviewer = false
			return view
		end
	end
end)

-- hook.Add("CreateMove", "ThirdPerson.CreateMove", function(cmd)
-- local pl = LocalPlayer()
-- if (isThirdPerson(pl) and pl.camera_ang and pl:GetMoveType() ~= MOVETYPE_NOCLIP) then
-- local realAng = freecam_ang or pl.camera_ang
-- local plAng = pl:GetAimVector():Angle() + pl:GetViewPunchAngles()
-- local curVec = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), cmd:GetUpMove())
-- curVec:Rotate(plAng - realAng)
-- cmd:SetForwardMove(curVec.x)
-- cmd:SetSideMove(curVec.y)
-- cmd:SetUpMove(curVec.z)
-- return false
-- end
-- end)
hook.Add("InputMouseApply", "ThirdPerson.InputMouseApply", function(cmd, x, y, ang)
    local pl = LocalPlayer()

    if (isThirdPerson(pl)) then
        if (not pl.camera_ang) then
            pl.camera_ang = pl:EyeAngles()
        end

        if (cvar.GetValue("invert_thirdp_mouse")) then
            y = -y
        end

        local punch = (pl:GetViewPunchAngles() / 50)
        pl.camera_ang.p = math.Clamp(math.NormalizeAngle(pl.camera_ang.p + y / 50), -90, 90) + punch.p
        pl.camera_ang.y = math.NormalizeAngle(pl.camera_ang.y - x / 50) + punch.y

        return true
    else
        pl.camera_ang = pl:EyeAngles()
    end
end)

-- hook.Add("ShouldDrawLocalPlayer", "ThirdPersonDrawPlayer", function()
-- 	if cvar.GetValue("enable_thirdperson") then
-- 		return isThirdPerson(LocalPlayer())
-- 	end
-- end)
local lastPress

hook.Add("PlayerBindPress", "ThirdPerson.PlayerBindPress", function(pl, bind, pressed)
    if (pressed and bind:lower() == "+walk") then
        local st = SysTime()

        if (lastPress and lastPress > st - 0.75) then
            toggleCamLock = not toggleCamLock
        end

        lastPress = st
    end
end)

local zoom_for_weapons = {
    ["awpdragon"] = true,
    ["weapon_ak47_phoen"] = true,
}

local to_ret = false
local shifted = false

hook.Add("KeyPress", "ThirdPerson.KeyPress", function(ply, key)
    if ply:Alive() then
        if key == IN_SPEED then
            shifted = true
        end

        if (key == IN_ATTACK2 or key == IN_ZOOM) then
            local wep = ply:GetActiveWeapon()

            if not shifted and not to_ret and isThirdPerson(ply) and IsValid(wep) and (zoom_for_weapons[wep:GetClass()]) then
                to_ret = true
                cvar.SetValue("enable_thirdperson", false)
            end
        end
    end
end)

hook.Add("KeyRelease", "ThirdPerson.KeyRelease", function(ply, key)
    if ply:Alive() and key == IN_SPEED then
        shifted = false
    end

    if to_ret and (key == IN_ATTACK2 or key == IN_ZOOM) then
        to_ret = false
        cvar.SetValue("enable_thirdperson", true)
    end
end)

-- Edit menu!
local fr, chk, chk2

hook('OnContextMenuOpen', 'rp.ThirdPerson.OnContextMenuOpen', function()
    local pl = LocalPlayer()

    chk = ui.Create('ui_checkbox', function(self, p)
        self:SetPos(10, 40)
        self:SetText('Вид от третьего лица')
        self:SizeToContents()
        self:SetConVar('enable_thirdperson')
        self:SetMouseInputEnabled(true)
    end, g_ContextMenu)

    if (isThirdPerson(pl) and pl.camera_ang) then
        chk2 = ui.Create('ui_checkbox', function(self, p)
            self:SetPos(10, 61)
            self:SetText('Инвертировать мышь третьего лица')
            self:SizeToContents()
            self:SetConVar('invert_thirdp_mouse')
            self:SetMouseInputEnabled(true)
        end, g_ContextMenu)

        fr = ui.Create('ui_frame', function(self, p)
            self:SetPos(10, 82)
            self:SetSize(159, 168)
            self:SetTitle("Камера")
            self:ShowCloseButton(false)
            self:SetMouseInputEnabled(true)
            self:SetDraggable(false)
        end, g_ContextMenu)

        local btn

        local grid = ui.Create('Panel', function(self, p)
            self:SetSize(128, 128)
            self:SetPos(fr:GetDockPos())

            self.Paint = function(s, w, h)
                surface.SetDrawColor(ui.col.OffWhite)
                surface.DrawOutlinedRect(0, 0, w, h)
                surface.DrawLine(btn.x + 8, 0, btn.x + 8, h)
                surface.DrawLine(0, btn.y + 8, w, btn.y + 8)
                surface.SetDrawColor(ui.col.Hover)
                surface.DrawOutlinedRect(w * .25, h * .25, w * .5, h * .5)
                surface.DrawLine(0, h * .5, w, h * .5)
                surface.DrawLine(w * .5, 0, w * .5, h)
            end
        end, fr)

        btn = ui.Create('DButton', function(self, p)
            self:SetText('')
            self:SetSize(16, 16)

            self.OnMousePressed = function(s)
                s.Dragging = true
            end

            self.Think = function(s)
                if (s.Dragging) then
                    if (not input.IsMouseDown(MOUSE_LEFT)) then
                        s.Dragging = false

                        return
                    end

                    local mx, my = grid:CursorPos()
                    local sx, sy = self.x, self.y
                    self:SetPos(math.Clamp(mx - 8, 0, grid:GetWide() - 16), math.Clamp(my - 8, 0, grid:GetTall() - 16))

                    if (self.x ~= sx or self.y ~= sy) then
                        local ymul = self.x / (grid:GetWide() - 16)
                        local zmul = 1 - (self.y / (grid:GetTall() - 16))
                        y:SetInt(ymin + (ymul * (ymax - ymin)))
                        z:SetInt(zmin + (zmul * (zmax - zmin)))
                    end
                end
            end
        end, grid)

        local slider = ui.Create('ui_slider_vertical', function(self, p)
            local _, y = fr:GetDockPos()
            self:SetPos(138, y)
            self:SetTall(128)

            self.OnChange = function(self, val)
                val = 1 - val
                x:SetInt(xmin + (val * (xmax - xmin)))
            end
        end, fr)

        slider:SetValue(1 - ((x:GetInt() - xmin) / (xmax - xmin)))
        local bx = ((y:GetInt() - ymin) / (ymax - ymin)) * (grid:GetWide() - 16)
        local by = (1 - ((z:GetInt() - zmin) / (zmax - zmin))) * (grid:GetTall() - 16)
        btn:SetPos(bx, by)
    end
end)

hook('OnContextMenuClose', 'rp.ThirdPerson.OnContextMenuClose', function()
    if (IsValid(fr)) then
        fr:Remove()
    end

    if (IsValid(chk)) then
        chk:Remove()
    end

    if (IsValid(chk2)) then
        chk2:Remove()
    end
end)
--PATH gamemodes/darkrp/gamemode/libraries/sh_cami.lua:
--[[
CAMI - Common Admin Mod Interface.
Makes admin mods intercompatible and provides an abstract privilege interface
for third party addons.

Follows the specification on this page:
https://docs.google.com/document/d/1QIRVcAgZfAYf1aBl_dNV_ewR6P25wze2KmUVzlbFgMI

Structures:
    CAMI_USERGROUP, defines the charactaristics of a usergroup:
    {
        Name
            string
            The name of the usergroup
        Inherits
            string
            The name of the usergroup this usergroup inherits from
    }

    CAMI_PRIVILEGE, defines the charactaristics of a privilege:
    {
        Name
            string
            The name of the privilege
        MinAccess
            string
            One of the following three: user/admin/superadmin
        Description
            string
            optional
            A text describing the purpose of the privilege
        HasAccess
            function(
                privilege :: CAMI_PRIVILEGE,
                actor     :: Player,
                target    :: Player
            ) :: bool
            optional
            Function that decides whether a player can execute this privilege,
            optionally on another player (target).
    }
]]

-- Version number in YearMonthDay format.
local version = 20190102

if CAMI and CAMI.Version >= version then return end

CAMI = CAMI or {}
CAMI.Version = version

--[[
usergroups
    Contains the registered CAMI_USERGROUP usergroup structures.
    Indexed by usergroup name.
]]
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

--[[
privileges
    Contains the registered CAMI_PRIVILEGE privilege structures.
    Indexed by privilege name.
]]
local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}

--[[
CAMI.RegisterUsergroup
    Registers a usergroup with CAMI.

    Parameters:
        usergroup
            CAMI_USERGROUP
            (see CAMI_USERGROUP structure)
        source
            any
            Identifier for your own admin mod. Can be anything.
            Use this to make sure CAMI.RegisterUsergroup function and the
            CAMI.OnUsergroupRegistered hook don't cause an infinite loop



    Return value:
        CAMI_USERGROUP
            The usergroup given as argument.
]]
function CAMI.RegisterUsergroup(usergroup, source)
    usergroups[usergroup.Name] = usergroup

    hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source)
    return usergroup
end

--[[
CAMI.UnregisterUsergroup
    Unregisters a usergroup from CAMI. This will call a hook that will notify
    all other admin mods of the removal.

    Call only when the usergroup is to be permanently removed.

    Parameters:
        usergroupName
            string
            The name of the usergroup.
        source
            any
            Identifier for your own admin mod. Can be anything.
            Use this to make sure CAMI.UnregisterUsergroup function and the
            CAMI.OnUsergroupUnregistered hook don't cause an infinite loop

    Return value:
        bool
            Whether the unregistering succeeded.
]]
function CAMI.UnregisterUsergroup(usergroupName, source)
    if not usergroups[usergroupName] then return false end

    local usergroup = usergroups[usergroupName]
    usergroups[usergroupName] = nil

    hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)

    return true
end

--[[
CAMI.GetUsergroups
    Retrieves all registered usergroups.

    Return value:
        Table of CAMI_USERGROUP, indexed by their names.
]]
function CAMI.GetUsergroups()
    return usergroups
end

--[[
CAMI.GetUsergroup
    Receives information about a usergroup.

    Return value:
        CAMI_USERGROUP
            Returns nil when the usergroup does not exist.
]]
function CAMI.GetUsergroup(usergroupName)
    return usergroups[usergroupName]
end

--[[
CAMI.UsergroupInherits
    Returns true when usergroupName1 inherits usergroupName2.
    Note that usergroupName1 does not need to be a direct child.
    Every usergroup trivially inherits itself.

    Parameters:
        usergroupName1
            string
            The name of the usergroup that is queried.
        usergroupName2
            string
            The name of the usergroup of which is queried whether usergroupName
            inherits from.

    Return value:
        bool
            Whether usergroupName1 inherits usergroupName2.
]]
function CAMI.UsergroupInherits(usergroupName1, usergroupName2)
    repeat
        if usergroupName1 == usergroupName2 then return true end

        usergroupName1 = usergroups[usergroupName1] and
                         usergroups[usergroupName1].Inherits or
                         usergroupName1
    until not usergroups[usergroupName1] or
          usergroups[usergroupName1].Inherits == usergroupName1

    -- One can only be sure the usergroup inherits from user if the
    -- usergroup isn't registered.
    return usergroupName1 == usergroupName2 or usergroupName2 == "user"
end

--[[
CAMI.InheritanceRoot
    All usergroups must eventually inherit either user, admin or superadmin.
    Regardless of what inheritance mechism an admin may or may not have, this
    always applies.

    This method always returns either user, admin or superadmin, based on what
    usergroups eventually inherit.

    Parameters:
        usergroupName
            string
            The name of the usergroup of which the root of inheritance is
            requested

    Return value:
        string
            The name of the root usergroup (either user, admin or superadmin)
]]
function CAMI.InheritanceRoot(usergroupName)
    if not usergroups[usergroupName] then return end

    local inherits = usergroups[usergroupName].Inherits
    while inherits ~= usergroups[usergroupName].Inherits do
        usergroupName = usergroups[usergroupName].Inherits
    end

    return usergroupName
end

--[[
CAMI.RegisterPrivilege
    Registers a privilege with CAMI.
    Note: do NOT register all your admin mod's privileges with this function!
    This function is for third party addons to register privileges
    with admin mods, not for admin mods sharing the privileges amongst one
    another.

    Parameters:
        privilege
            CAMI_PRIVILEGE
            See CAMI_PRIVILEGE structure.

    Return value:
        CAMI_PRIVILEGE
            The privilege given as argument.
]]
function CAMI.RegisterPrivilege(privilege)
    privileges[privilege.Name] = privilege

    hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)

    return privilege
end

--[[
CAMI.UnregisterPrivilege
    Unregisters a privilege from CAMI. This will call a hook that will notify
    all other admin mods of the removal.

    Call only when the privilege is to be permanently removed.

    Parameters:
        privilegeName
            string
            The name of the privilege.

    Return value:
        bool
            Whether the unregistering succeeded.
]]
function CAMI.UnregisterPrivilege(privilegeName)
    if not privileges[privilegeName] then return false end

    local privilege = privileges[privilegeName]
    privileges[privilegeName] = nil

    hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)

    return true
end

--[[
CAMI.GetPrivileges
    Retrieves all registered privileges.

    Return value:
        Table of CAMI_PRIVILEGE, indexed by their names.
]]
function CAMI.GetPrivileges()
    return privileges
end

--[[
CAMI.GetPrivilege
    Receives information about a privilege.

    Return value:
        CAMI_PRIVILEGE when the privilege exists.
            nil when the privilege does not exist.
]]
function CAMI.GetPrivilege(privilegeName)
    return privileges[privilegeName]
end

--[[
CAMI.PlayerHasAccess
    Queries whether a certain player has the right to perform a certain action.

    Parameters:
        actorPly
            Player
            The player of which is requested whether they have the privilege.
        privilegeName
            string
            The name of the privilege.
        callback
            function(bool, string) or nil
            This function will be called with the answer. The bool signifies the
            yes or no answer as to whether the player is allowed. The string
            will optionally give a reason.

            Give an explicit nil here to get an answer immediately
                Important note: May throw an error when the admin mod doesn't
                give an answer immediately!
        targetPly
            Optional.
            The player on which the privilege is executed.
        extraInfoTbl
            Optional.
            Table containing extra information.
            Officially supported members:
                Fallback
                    string
                    Either of user/admin/superadmin. When no admin mod replies,
                    the decision is based on the admin status of the user.
                    Defaults to admin if not given.
                IgnoreImmunity
                    bool
                    Ignore any immunity mechanisms an admin mod might have.
                CommandArguments
                    table
                    Extra arguments that were given to the privilege command.

    Return value:
        If callback is specified:
            None
        Otherwise:
            hasAccess
                bool
                Whether the player has access
            reason
                Optional.
                The reason why a player does or does not have access.
]]
-- Default access handler
local defaultAccessHandler = {["CAMI.PlayerHasAccess"] =
    function(_, actorPly, privilegeName, callback, _, extraInfoTbl)
        -- The server always has access in the fallback
        if not IsValid(actorPly) then return callback(true, "Fallback.") end

        local priv = privileges[privilegeName]

        local fallback = extraInfoTbl and (
            not extraInfoTbl.Fallback and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "user" and true or
            extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())


        if not priv then return callback(fallback, "Fallback.") end

        callback(
            priv.MinAccess == "user" or
            priv.MinAccess == "admin" and actorPly:IsAdmin() or
            priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin()
            , "Fallback.")
    end,
    ["CAMI.SteamIDHasAccess"] =
    function(_, _, _, callback)
        callback(false, "No information available.")
    end
}
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

--[[
CAMI.GetPlayersWithAccess
    Finds the list of currently joined players who have the right to perform a
    certain action.
    NOTE: this function will NOT return an immediate result!
    The result is in the callback!

    Parameters:
        privilegeName
            string
            The name of the privilege.
        callback
            function(players)
            This function will be called with the list of players with access.
        targetPly
            Optional.
            The player on which the privilege is executed.
        extraInfoTbl
            Optional.
            Table containing extra information.
            Officially supported members:
                Fallback
                    string
                    Either of user/admin/superadmin. When no admin mod replies,
                    the decision is based on the admin status of the user.
                    Defaults to admin if not given.
                IgnoreImmunity
                    bool
                    Ignore any immunity mechanisms an admin mod might have.
                CommandArguments
                    table
                    Extra arguments that were given to the privilege command.
]]
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

--[[
CAMI.SteamIDHasAccess
    Queries whether a player with a steam ID has the right to perform a certain
    action.
    Note: the player does not need to be in the server for this to
    work.

    Note: this function does NOT return an immediate result!
    The result is in the callback!

    Parameters:
        actorSteam
            Player
            The SteamID of the player of which is requested whether they have
            the privilege.
        privilegeName
            string
            The name of the privilege.
        callback
            function(bool, string)
            This function will be called with the answer. The bool signifies the
            yes or no answer as to whether the player is allowed. The string
            will optionally give a reason.
        targetSteam
            Optional.
            The SteamID of the player on which the privilege is executed.
        extraInfoTbl
            Optional.
            Table containing extra information.
            Officially supported members:
                IgnoreImmunity
                    bool
                    Ignore any immunity mechanisms an admin mod might have.
                CommandArguments
                    table
                    Extra arguments that were given to the privilege command.

    Return value:
        None, the answer is given in the callback function in order to allow
        for the admin mod to perform e.g. a database lookup.
]]
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback,
targetSteam, extraInfoTbl)
    hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam,
        privilegeName, callback, targetSteam, extraInfoTbl)
end

--[[
CAMI.SignalUserGroupChanged
    Signify that your admin mod has changed the usergroup of a player. This
    function communicates to other admin mods what it thinks the usergroup
    of a player should be.

    Listen to the hook to receive the usergroup changes of other admin mods.

    Parameters:
        ply
            Player
            The player for which the usergroup is changed
        old
            string
            The previous usergroup of the player.
        new
            string
            The new usergroup of the player.
        source
            any
            Identifier for your own admin mod. Can be anything.
]]
function CAMI.SignalUserGroupChanged(ply, old, new, source)
    hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source)
end

--[[
CAMI.SignalSteamIDUserGroupChanged
    Signify that your admin mod has changed the usergroup of a disconnected
    player. This communicates to other admin mods what it thinks the usergroup
    of a player should be.

    Listen to the hook to receive the usergroup changes of other admin mods.

    Parameters:
        ply
            string
            The steam ID of the player for which the usergroup is changed
        old
            string
            The previous usergroup of the player.
        new
            string
            The new usergroup of the player.
        source
            any
            Identifier for your own admin mod. Can be anything.
]]
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source)
    hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source)
end

--PATH gamemodes/darkrp/gamemode/modules/workarounds/sh_workarounds.lua:
-- Shared part

function DarkRP.getAvailableVehicles()
    local vehicles = list.Get("Vehicles")
    for _, v in pairs(list.Get("SCarsList")) do
        vehicles[v.PrintName] = {
            Name = v.PrintName,
            Class = v.ClassName,
            Model = v.CarModel
        }
    end

    return vehicles
end

local function argError(Val, iArg, sType)
    error(string.format("bad argument #%u to '%s' (%s expected, got %s)", iArg, debug.getinfo(2, "n").name, sType, type(Val)), 3)
end

if system.IsWindows() then
    local osdate = os.date
    local replace = function(txt)
        if txt == "%%" then return txt end -- Edge case, %% is allowed
        return ""
    end

    function os.date(format, time, ...)
        if (isstring(format) or isnumber(format)) then
            format = string.gsub(format, "%%[^aAbBcdHIjmMpSUwWxXyYz]", replace)
        elseif (format ~= nil) then
            argError(Val, 1, "string")
        end

        if (not (time == nil or isnumber(time)) and (not isstring(time) or tonumber(time) == nil)) then
            argError(Val, 2, "number")
        end

        return osdate(format, time, ...)
    end
end

timer.Simple(3, function()
    -- Malicious addons that kicks players this one person doesn't like.
    if istable(Skid) then
        Skid.Check = fn.Id
        hook.Remove("CheckPassword", "Skid.CheckPassword")

        MsgC(Color(0, 255, 0), "SkidCheck", Color(255, 255, 255), " has been ", Color(255, 0, 0), "DISABLED\n", Color(255, 255, 255), [[
        SkidCheck was detected on this server and has been disabled.

        SkidCheck is a ban list addon made by HeX as an attempt to get the people he doesn't like
        banned from as many servers as possible.

        You have probably installed this addon thinking that it would get rid of cheaters, and sure,
        it might get rid of some, but that's only to make you want to download this.

        SkidCheck would ban me (FPtje, developer of DarkRP) from your server because I have a
        workshop addon that he doesn't like and because I know how to throw a prop around
            (type /credits yourname in chat for the full story on that)
        It doesn't just ban /me/ for that, it bans EVERYONE who is subscribed to the addon.

        Can you imagine trying an addon out and getting on this list /just/ because you have
        it installed? That's SkidCheck for you.

        It also bans people who have a VAC ban (even if gotten from another game), people from
        arbitrary groups, /friends/ of people he doesn't like and many, many more.

        I'm not pulling this out of my ass either, you can check everything here:
        http://facepunch.com/showthread.php?t=1483607


        On a somewhat unrelated note, HeX has been known to be malicious for quite some time:
        He used to have an anticheat (called HAC) on his server, which not only misfired from
        time to time, but actively used exploits to fuck "cheaters" up as much as possible,
        doing malicious shit ranging from unbinding keys to removing every friend they had in
        their friends list.

        That too can be fact checked right here:
        http://facepunch.com/showthread.php?t=1416320

        DO NOT trust this guy to decide who gets banned from your server. In fact,
        DO NOT EVER TRUST ANYONE with that power. No one ever should have the power
        to decide who gets banned and who doesn't over the servers that decide to install
        their addon.
]])
    end
end)

if game.SinglePlayer() then
    local plyMeta = FindMetaTable("Player")

    if SERVER then
        local sid64 = plyMeta.SteamID64

        function plyMeta:SteamID64(...)
            return sid64(self, ...) or "0"
        end
    end

    local aid = plyMeta.AccountID

    function plyMeta:AccountID(...)
        return aid(self, ...) or 0
    end
end

-- Clientside part
if CLIENT then
    local cams3D, cams2D = 0, 0
    local cam_Start = cam.Start

    function cam.Start(tbl, ...)
        -- https://github.com/Facepunch/garrysmod-issues/issues/3361
        if (not istable(tbl)) then
           argError(tbl, 1, "table")
        end

        if (tbl.type == "3D") then
            cams3D = cams3D + 1
        elseif (tbl.type == "2D") then
            cams2D = cams2D + 1
        else
            error("bad argument #1 to '%s' (bad key 'type' - 2D or 3D expected, got %s)", debug.getinfo(1, "n").name, tbl.type, 2)
        end

        -- Could pcall this but it'd be impossible to
        -- tell if a render instance was created or not.
        -- Assume creation/deletion
        return cam_Start(tbl, ...)
    end

    local cam_End3D = cam.End3D

    function cam.End3D(...)
        if (cams3D == 0) then
            error("tried to end invalid render instance", 2)
        end

        cams3D = cams3D - 1

        return cam_End3D(...)
    end

    local cam_End2D = cam.End2D

    function cam.End2D(...)
        if (cams2D == 0) then
            error("tried to end invalid render instance", 2)
        end

        cams2D = cams2D - 1

        return cam_End2D(...)
    end

    local cams3D2D = 0
    local cam_Start3D2D = cam.Start3D2D

    function cam.Start3D2D(...)
        cams3D2D = cams3D2D + 1

        return cam_Start3D2D(...)
    end

    return
end

-- https://github.com/FPtje/DarkRP/issues/2640
local entsCreate = ents.Create
local entsCreateError = [[
Unable to create entity.

The server has come to a point where it has become impossible to create new
entities. The entity limit has been hit. Try cleaning up the server or
changing level. In the meantime, expect lots of errors coming from a lot of
addons.

If you do decide to send a bug report to ANY addon, please include this
message.]]

local function varArgsLen(...)
    return {...}, select("#", ...)
end

function ents.Create(name, ...)
    local res, len = varArgsLen(entsCreate(name, ...))

    if res[1] == NULL and ents.GetEdictCount() >= 8176 then
        DarkRP.error(entsCreateError, 2, { string.format("Affected entity: '%s'", name) })
    end

    return unpack(res, 1, len)
end

--[[---------------------------------------------------------------------------
Generic InitPostEntity workarounds
---------------------------------------------------------------------------]]
hook.Add("InitPostEntity", "DarkRP_Workarounds", function()
    local commands = concommand.GetTable()
    if commands["durgz_witty_sayings"] then
        game.ConsoleCommand("durgz_witty_sayings 0\n") -- Deals with the cigarettes exploit. I'm fucking tired of them. I hate having to fix other people's mods, but this mod maker is retarded and refuses to update his mod.
    end

    -- Remove ULX /me command. (the /me command is the only thing this hook does)
    hook.Remove("PlayerSay", "ULXMeCheck")

    -- why can people even save multiplayer games?
    -- Lag exploit
    if not game.SinglePlayer() then
        concommand.Remove("gm_save")
    end

    -- Remove that weird rooftop spawn in rp_downtown_v4c_v2
    if game.GetMap() == "rp_downtown_v4c_v2" then
        for _, v in pairs(ents.FindByClass("info_player_terrorist")) do
            v:Remove()
        end
    end

    if CLIENT then
        hook.Remove("HUDPaint","drawHudVital") -- Removes the white flashes when the server lags and the server has flashbang. Workaround because it's been there for fucking years

        -- Fuck up APAnti
        net.Receivers.sblockgmspawn = nil
        hook.Remove("PlayerBindPress", "_sBlockGMSpawn")
    end
end)

--[[---------------------------------------------------------------------------
Fuck up APAnti. These hooks send unnecessary net messages.
---------------------------------------------------------------------------]]
timer.Simple(3, function()
    hook.Remove("Move", "_APA.Settings.AllowGMSpawn")
    hook.Remove("PlayerSpawnObject", "_APA.Settings.AllowGMSpawn")
end)

--[[---------------------------------------------------------------------------
Wire field generator exploit
---------------------------------------------------------------------------]]
--hook.Add("OnEntityCreated", "DRP_WireFieldGenerator", function(ent)
--    timer.Simple(0, function()
 --       if IsValid(ent) and ent:GetClass() == "gmod_wire_field_device" then
   --         local TriggerInput = ent.TriggerInput
    --        function ent:TriggerInput(iname, value)
         --       if iname == "Distance" and isnumber(value) then
     --               value = math.min(value, 400)
         --       end
      --          TriggerInput(self, iname, value)
   --         end
 --       end
--    end)
--end)

--[[---------------------------------------------------------------------------
Door tool is shitty
Let's fix that huge class exploit
---------------------------------------------------------------------------]]
hook.Add("InitPostEntity", "FixDoorTool", function()
    local oldFunc = makedoor
    if isfunction(oldFunc) then
        function makedoor(ply, trace, ang, model, open, close, autoclose, closetime, class, hardware, ...)
            if class ~= "prop_dynamic" and class ~= "prop_door_rotating" then return end

            oldFunc(ply, trace, ang, model, open, close, autoclose, closetime, class, hardware, ...)
        end
    end
end)

--[[---------------------------------------------------------------------------
Anti crash exploit
---------------------------------------------------------------------------]]
hook.Add("PropBreak", "drp_AntiExploit", function(attacker, ent)
    if IsValid(ent) and ent:GetPhysicsObject():IsValid() then
        constraint.RemoveAll(ent)
    end
end)

local allowedDoors = {
    ["prop_dynamic"] = true,
    ["prop_door_rotating"] = true,
    [""] = true
}

hook.Add("CanTool", "DoorExploit", function(ply, trace, tool)
    if not IsValid(ply) or not ply:IsPlayer() or not IsValid(ply:GetActiveWeapon()) or not ply:GetActiveWeapon().GetToolObject or not ply:GetActiveWeapon():GetToolObject() then return end

    tool = ply:GetActiveWeapon():GetToolObject()
    if not allowedDoors[string.lower(tool:GetClientInfo("door_class") or "")] then
        return false
    end
end)

--[[---------------------------------------------------------------------------
Actively deprecate commands
---------------------------------------------------------------------------]]
local deprecated = {
    {command = "rp_removeletters",      alternative = "removeletters"           },
    {command = "rp_setname",            alternative = "forcerpname"             },
    {command = "rp_unlock",             alternative = "forceunlock"             },
    {command = "rp_lock",               alternative = "forcelock"               },
    {command = "rp_removeowner",        alternative = "forceremoveowner"        },
    {command = "rp_addowner",           alternative = "forceown"                },
    {command = "rp_unownall",           alternative = "forceunownall"           },
    {command = "rp_unown",              alternative = "forceunown"              },
    {command = "rp_own",                alternative = "forceown"                },
    {command = "rp_tellall",            alternative = "admintellall"            },
    {command = "rp_tell",               alternative = "admintell"               },
    {command = "rp_teamunban",          alternative = "teamunban"               },
    {command = "rp_teamban",            alternative = "teamban"                 },
    {command = "rp_setsalary",          alternative = "setmoney"                },
    {command = "rp_setmoney",           alternative = "setmoney"                },
 --   {command = "rp_revokelicense",      alternative = "unsetlicense"            },
 --   {command = "rp_givelicense",        alternative = "setlicense"              },
    {command = "rp_unlockdown",         alternative = "unlockdown"              },
    {command = "rp_lockdown",           alternative = "lockdown"                },
    {command = "rp_unarrest",           alternative = "unarrest"                },
    {command = "rp_arrest",             alternative = "arrest"                  },
    {command = "rp_cancelvote",         alternative = "forcecancelvote"         },
}

local lastDeprecated = 0
local function msgDeprecated(cmd, ply)
    if CurTime() - lastDeprecated < 0.5 then return end
    lastDeprecated = CurTime()

    DarkRP.notify(ply, 1, 4, ("This command has been deprecated. Please use 'DarkRP %s' or '/%s' instead."):format(cmd.alternative, cmd.alternative))
end

for _, cmd in pairs(deprecated) do
    concommand.Add(cmd.command, fp{msgDeprecated, cmd})
end
--PATH gamemodes/darkrp/gamemode/modules/language/sh_language.lua:
local rp_languages = {}
local selectedLanguage = GetConVar("gmod_language"):GetString() -- Switch language by setting gmod_language to another language

function DarkRP.addLanguage(name, tbl)
    local old = rp_languages[name] or {}
    rp_languages[name] = tbl

    -- Merge the language with the translations added by DarkRP.addPhrase
    for k, v in pairs(old) do
        if rp_languages[name][k] then continue end
        rp_languages[name][k] = v
    end
    LANGUAGE = rp_languages[name] -- backwards compatibility
end

function DarkRP.addPhrase(lang, name, phrase)
    rp_languages[lang] = rp_languages[lang]  or {}
    rp_languages[lang][name] = phrase
end

function DarkRP.getPhrase(name, ...)
    local langTable = rp_languages[selectedLanguage] or rp_languages.en

    return (langTable[name] or rp_languages.en[name]) and string.format(langTable[name] or rp_languages.en[name], ...) or nil
end

function DarkRP.getMissingPhrases(lang)
    lang = lang or selectedLanguage
    local res = {}
    local format = "%s = \"%s\","

    for k, v in pairs(rp_languages.en) do
        if rp_languages[lang][k] then continue end
        table.insert(res, string.format(format, k, v))
    end

    return #res == 0 and "No language strings missing!" or table.concat(res, "\n")
end

local function getMissingPhrases(ply, cmd, args)
    if not args[1] then print("Please run the command with a language code e.g. darkrp_getphrases \"en\"") return end
    local lang = rp_languages[args[1]]
    if not lang then print("This language does not exist! Make sure the casing is right.")
        print("Available languages:")
        for k in pairs(rp_languages) do print(k) end
        return
    end

    print(DarkRP.getMissingPhrases(args[1]))
end
if CLIENT then concommand.Add("darkrp_getphrases", getMissingPhrases) end

--[[---------------------------------------------------------------------------
Chat command translating
---------------------------------------------------------------------------]]
local chatCmdDescriptions = {}
function DarkRP.addChatCommandsLanguage(lang, tbl)
    chatCmdDescriptions[lang] = chatCmdDescriptions[lang] or {}

    table.Merge(chatCmdDescriptions[lang], tbl)
end

function DarkRP.getChatCommandDescription(name)
    local cmd = DarkRP.getChatCommand(name)
    return chatCmdDescriptions[selectedLanguage] and chatCmdDescriptions[selectedLanguage][name] or
        cmd and cmd.description or
        nil
end

local function getMissingCmdTranslations()
    local cmds = DarkRP.getSortedChatCommands()

    -- No commands have been translated
    if not chatCmdDescriptions[selectedLanguage] then return cmds end

    -- Remove translated commands and maintain keys
    local count = #cmds
    for i = 1, count do
        if chatCmdDescriptions[selectedLanguage][cmds[i].command] then
            cmds[i] = nil
        end
    end

    cmds = table.ClearKeys(cmds)

    return cmds
end

local function printMissingChatTranslations()
    local cmds = getMissingCmdTranslations()
    local text = {}

    local maxCmdLength = 0
    for _, v in pairs(cmds) do maxCmdLength = math.Max(maxCmdLength, string.len(v.command)) end

    for k, v in pairs(cmds) do
        text[k] = string.format([=[["%s"]%s=    "%s",]=], v.command, string.rep(' ', 4 + maxCmdLength - string.len(v.command)), v.description)
    end

    MsgC(Color(0, 255, 0), string.format("%s untranslated chat command descriptions!\n", #cmds))

    text = table.concat(text, "\n    ")
    SetClipboardText(text)

    MsgC(Color(0, 255, 0), "text copied to clipboard!\n")
end
if CLIENT then concommand.Add("darkrp_translateChatCommands", printMissingChatTranslations) end

--PATH gamemodes/darkrp/gamemode/modules/base/sh_util.lua:
--[[---------------------------------------------------------------------------
Utility functions
---------------------------------------------------------------------------]]

local vector = FindMetaTable("Vector")
local meta = FindMetaTable("Player")

--[[---------------------------------------------------------------------------
Decides whether the vector could be seen by the player if they were to look at it
---------------------------------------------------------------------------]]
function vector:isInSight(filter, ply)
    ply = ply or LocalPlayer()
    local trace = {}
    trace.start = ply:EyePos()
    trace.endpos = self
    trace.filter = filter
    trace.mask = -1
    local TheTrace = util.TraceLine(trace)

    return not TheTrace.Hit, TheTrace.HitPos
end

--[[---------------------------------------------------------------------------
Turn a money amount into a pretty string
---------------------------------------------------------------------------]]
local function attachCurrency(str)
    local config = GAMEMODE.Config
    return config.currencyLeft and config.currency .. str or str .. config.currency
end

function DarkRP.formatMoney(n)
    if not n then return attachCurrency("0") end

    if n >= 1e14 then return attachCurrency(tostring(n)) end
    if n <= -1e14 then return "-" .. attachCurrency(tostring(math.abs(n))) end

    local negative = n < 0

    n = tostring(math.abs(n))
    local sep = sep or ","
    local dp = string.find(n, "%.") or #n + 1

    for i = dp - 4, 1, -3 do
        n = n:sub(1, i) .. sep .. n:sub(i + 1)
    end

    return (negative and "-" or "") .. attachCurrency(n)
end

--[[---------------------------------------------------------------------------
Find a player based on given information
---------------------------------------------------------------------------]]
function DarkRP.findPlayer(info)
    if not info or info == "" then return nil end
    local pls = player.GetAll()

    for k = 1, #pls do -- Proven to be faster than pairs loop.
        local v = pls[k]
        if tonumber(info) == v:UserID() then
            return v
        end

        if info == v:SteamID() then
            return v
        end

        if string.find(string.lower(v:Nick()), string.lower(tostring(info)), 1, true) ~= nil then
            return v
        end

        if string.find(string.lower(v:SteamName()), string.lower(tostring(info)), 1, true) ~= nil then
            return v
        end
    end
    return nil
end

--[[---------------------------------------------------------------------------
Find multiple players based on a string criterium
Taken from FAdmin]]
---------------------------------------------------------------------------*/
function DarkRP.findPlayers(info)
    if not info then return nil end
    local pls = player.GetAll()
    local found = {}
    local players

    if string.lower(info) == "*" or string.lower(info) == "<all>" then return pls end

    local InfoPlayers = {}
    for A in string.gmatch(info .. ";", "([a-zA-Z0-9:_.]*)[;(,%s)%c]") do
        if A ~= "" then
            table.insert(InfoPlayers, A)
        end
    end

    for _, PlayerInfo in ipairs(InfoPlayers) do
        -- Playerinfo is always to be treated as UserID when it's a number
        -- otherwise people with numbers in their names could get confused with UserID's of other players
        if tonumber(PlayerInfo) then
            local foundPlayer = Player(PlayerInfo)
            if IsValid(foundPlayer) and not found[foundPlayer] then
                found[foundPlayer] = true
                players = players or {}
                table.insert(players, foundPlayer)
            end
            continue
        end

        local stringPlayerInfo = string.lower(PlayerInfo)
        for _, v in ipairs(pls) do
            -- Prevent duplicates
            if found[v] then continue end
            local steamId = v:SteamID()

            -- Find by Steam ID
            if (PlayerInfo == steamId or steamId == "UNKNOWN") or
            -- Find by Partial Nick
            string.find(string.lower(v:Nick()), stringPlayerInfo, 1, true) ~= nil or
            -- Find by steam name
            (v.SteamName and string.find(string.lower(v:SteamName()), stringPlayerInfo, 1, true) ~= nil) then
                found[v] = true
                players = players or {}
                table.insert(players, v)
            end
        end
    end

    return players
end

function meta:getEyeSightHitEntity(searchDistance, hitDistance, filter)
    searchDistance = searchDistance or 100
    hitDistance = (hitDistance or 15) * (hitDistance or 15)

    filter = filter or function(p) return p:IsPlayer() and p ~= self end

    self:LagCompensation(true)

    local shootPos = self:GetShootPos()
    local entities = ents.FindInSphere(shootPos, searchDistance)
    local aimvec = self:GetAimVector()

    local smallestDistance = math.huge
    local foundEnt

    for _, ent in pairs(entities) do
        if not IsValid(ent) or filter(ent) == false then continue end

        local center = ent:GetPos()

        -- project the center vector on the aim vector
        local projected = shootPos + (center - shootPos):Dot(aimvec) * aimvec

        if aimvec:Dot((projected - shootPos):GetNormalized()) < 0 then continue end

        -- the point on the model that has the smallest distance to your line of sight
        local nearestPoint = ent:NearestPoint(projected)
        local distance = nearestPoint:DistToSqr(projected)

        if distance < smallestDistance then
            local trace = {
                start = self:GetShootPos(),
                endpos = nearestPoint,
                filter = {self, ent}
            }
            local traceLine = util.TraceLine(trace)
            if traceLine.Hit then continue end

            smallestDistance = distance
            foundEnt = ent
        end
    end

    self:LagCompensation(false)

    if smallestDistance < hitDistance then
        return foundEnt, math.sqrt(smallestDistance)
    end

    return nil
end

--[[---------------------------------------------------------------------------
Print the currently available vehicles
---------------------------------------------------------------------------]]
local function GetAvailableVehicles(ply)
    if SERVER and IsValid(ply) and not ply:IsAdmin() then return end
    local print = SERVER and ServerLog or Msg

    print(DarkRP.getPhrase("rp_getvehicles") .. "\n")
    for k in pairs(DarkRP.getAvailableVehicles()) do
        print("\"" .. k .. "\"" .. "\n")
    end
end
if SERVER then
    concommand.Add("rp_getvehicles_sv", GetAvailableVehicles)
else
    concommand.Add("rp_getvehicles", GetAvailableVehicles)
end

--[[---------------------------------------------------------------------------
Whether a player has a DarkRP privilege
---------------------------------------------------------------------------]]
function meta:hasDarkRPPrivilege(priv)
    if FAdmin then
        return FAdmin.Access.PlayerHasPrivilege(self, priv)
    end
    return self:IsAdmin()
end

--[[---------------------------------------------------------------------------
Convenience function to return the players sorted by name
---------------------------------------------------------------------------]]
function DarkRP.nickSortedPlayers()
    local plys = player.GetAll()
    table.sort(plys, function(a,b) return a:Nick() < b:Nick() end)
    return plys
end

--[[---------------------------------------------------------------------------
Convert a string to a table of arguments
---------------------------------------------------------------------------]]
local bitlshift, stringgmatch, stringsub, tableinsert = bit.lshift, string.gmatch, string.sub, table.insert
function DarkRP.explodeArg(arg)
    local args = {}

    local from, to, diff = 1, 0, 0
    local inQuotes, wasQuotes = false, false

    for c in stringgmatch(arg, '.') do
        to = to + 1

        if c == '"' then
            inQuotes = not inQuotes
            wasQuotes = true

            continue
        end

        if c == ' ' and not inQuotes then
            diff = wasQuotes and 1 or 0
            wasQuotes = false
            tableinsert(args, stringsub(arg, from + diff, to - 1 - diff))
            from = to + 1
        end
    end
    diff = wasQuotes and 1 or 0

    if from ~= to + 1 then tableinsert(args, stringsub(arg, from + diff, to + 1 - bitlshift(diff, 1))) end

    return args
end

--[[---------------------------------------------------------------------------
Initialize Physics, throw an error on failure
---------------------------------------------------------------------------]]
function DarkRP.ValidatedPhysicsInit(ent, solidType, hint)
    solidType = solidType or SOLID_VPHYSICS

    if ent:PhysicsInit(solidType) then return true end

    local class = ent:GetClass()

    if solidType == SOLID_BSP then
        DarkRP.errorNoHalt(string.format("%s has no physics and will be motionless", class), 2, {
            "Is this a brush model? SOLID_BSP physics cannot initialize on entities that don't have brush models",
            "The physics limit may have been hit",
            hint
        })

        return false
    end

    if solidType == SOLID_VPHYSICS then
        local mdl = ent:GetModel()

        if not mdl or mdl == "" then
            DarkRP.errorNoHalt(string.format("Cannot init physics on entity \"%s\" because it has no model", class), 2, {hint})
            return false
        end

        mdl = string.lower(mdl)

        if util.IsValidProp(mdl) then
            -- Has physics, we must have hit the limit
            DarkRP.errorNoHalt(string.format("physics limit hit - %s will be motionless", class), 2, {hint})

            return false
        end

        if not file.Exists(mdl, "GAME") then
            DarkRP.errorNoHalt(string.format("%s has missing model \"%s\" and will be invisible and motionless", class, mdl), 2, {
                "Is the model path correct?",
                "Is the model from an addon that is not installed?",
                "Is the model from a game that isn't (properly) mounted? E.g. Counter Strike: Source",
                hint
            })

            return false
        end

        DarkRP.errorNoHalt(string.format("%s has model \"%s\" with no physics and will be motionless", class, mdl), 2, {
            "Does this model have an associated physics model (modelname.phy)?",
            "Is this model supposed to have physics? Many models, like effects and view models aren't made to have physics",
            hint
        })

        return false
    end

    DarkRP.errorNoHalt(string.format("Unable to initilize physics on entity \"%s\"", class, {hint}), 2)

    return false
end

--[[---------------------------------------------------------------------------
Like tonumber, but makes sure it's an integer
---------------------------------------------------------------------------]]
function DarkRP.toInt(value)
    value = tonumber(value)
    return value and math.floor(value)
end

--[[-------------------------------------------------------------------------
Check the database for integrity errors. Use in cases when stuff doesn't load
on restart, or you get corruption errors.
---------------------------------------------------------------------------]]
if SERVER then util.AddNetworkString("DarkRP_databaseCheckMessage") end
if CLIENT then net.Receive("DarkRP_databaseCheckMessage", fc{print, net.ReadString}) end

local function checkDatabase(ply)
    local dbFile = SERVER and "sv.db" or "cl.db"
    local display = (CLIENT or ply == game.GetWorld()) and print or function(msg)
            net.Start("DarkRP_databaseCheckMessage")
            net.WriteString(msg)
            net.Send(ply)
        end

    if SERVER and ply ~= game.GetWorld() and not ply:IsSuperAdmin() then
        display("You must be superadmin")
        return
    end

    if MySQLite and MySQLite.isMySQL() then
        display(string.format([[WARNING: DarkRP is using MySQL. This only
    checks the local SQLite database stored in the %s file in the
    garrysmod/ folder. The check will continue.]], dbFile))
    end

    local check = sql.QueryValue("PRAGMA INTEGRITY_CHECK")
    if check == false then
        display([[The query to check the database failed. Shit's surely
    fucked, but the cause is unknown.]])
        return
    end

    if check == "ok" then
        display(string.format("Your %s database file is good.", dbFile))
        return
    end

    display(string.format([[There are errors in your %s database file. It's corrupt!

    This can cause the following problems:
    - Data not loading, think of blocked models, doors, players' money and RP names
    - Settings resetting to their default values
    - Lua errors on startup

    The cause of the problem is that the %s file in your garrysmod/ folder on
    %s is corrupt. How this came to be is unknown, but here's what you can do to solve it:

    - Delete %s, and run a file integrity check. Warning: You will lose ALL data stored in it!
    - Take the file and try to repair it. This is sadly something that requires some technical knowledge,
      and may not always succeed.

    The specific error, by the way, is as follows:
    %s
    ]], dbFile, dbFile, SERVER and "the server" or "your own computer", dbFile, check))

end
concommand.Add("darkrp_check_db_" .. (SERVER and "sv" or "cl"), checkDatabase)
--PATH gamemodes/darkrp/gamemode/modules/base/sh_gamemode_functions.lua:
if SERVER then
	function GM:ScalePlayerDamage( ply, hitgroup, dmginfo )
		-- More damage if we're shot in the head
		if ( hitgroup == HITGROUP_HEAD ) then

			dmginfo:ScaleDamage( 2 )

		end

		-- Less damage if we're shot in the arms or legs
		-- if ( hitgroup == HITGROUP_LEFTARM ||
			 -- hitgroup == HITGROUP_RIGHTARM) then
					-- dmginfo:ScaleDamage( 0.75 )
		-- end
		if ( hitgroup == HITGROUP_LEFTLEG ||
			 hitgroup == HITGROUP_RIGHTLEG ||
			 hitgroup == HITGROUP_GEAR ) then

			dmginfo:ScaleDamage( 0.5 )

		end

	end
end

-- function GM:StartCommand(ply, usrcmd)
    -- Used in arrest_stick and unarrest_stick but addons can use it too!
    -- local wep = ply:GetActiveWeapon()
    -- if IsValid(wep) and isfunction(wep.startDarkRPCommand) then
        -- wep:startDarkRPCommand(usrcmd)
    -- end
-- end

function GM:OnPlayerChangedTeam(ply, oldTeam, newTeam)
    if RPExtraTeams[newTeam] and RPExtraTeams[newTeam].OnPlayerChangedTeam then
        RPExtraTeams[newTeam].OnPlayerChangedTeam(ply, oldTeam, newTeam)
    end

    if CLIENT then return end

    local agenda = ply:getAgendaTable()

    -- Remove agenda text when last manager left
    if agenda and agenda.ManagersByKey[oldTeam] then
        local found = false
        for man, _ in pairs(agenda.ManagersByKey) do
            if team.NumPlayers(man) > 0 then found = true break end
        end
        if not found then agenda.text = nil end
    end

    ply:setSelfDarkRPVar("agenda", agenda and agenda.text or nil)
end

hook.Add("loadCustomDarkRPItems", "CAMI privs", function()
    CAMI.RegisterPrivilege{
        Name = "DarkRP_SeeEvents",
        MinAccess = "admin"
    }

    CAMI.RegisterPrivilege{
        Name = "DarkRP_GetAdminWeapons",
        MinAccess = "admin"
    }

    CAMI.RegisterPrivilege{
        Name = "DarkRP_SetDoorOwner",
        MinAccess = "admin"
    }

    CAMI.RegisterPrivilege{
        Name = "DarkRP_ChangeDoorSettings",
        MinAccess = "superadmin"
    }

    CAMI.RegisterPrivilege{
        Name = "DarkRP_AdminCommands",
        MinAccess = "superadmin"
    }

    CAMI.RegisterPrivilege{
        Name = "DarkRP_SetMoney",
        MinAccess = "superadmin"
    }

    CAMI.RegisterPrivilege{
        Name = "DarkRP_SetLicense",
        MinAccess = "superadmin"
    }

    for _, v in pairs(RPExtraTeams) do
        if not v.vote or v.admin and v.admin > 1 then continue end

        local toAdmin = {[0] = "admin", [1] = "superadmin"}
        CAMI.RegisterPrivilege{
            Name = "DarkRP_GetJob_" .. v.command,
            MinAccess = toAdmin[v.admin or 0]-- Add privileges for the teams that are voted for
        }
    end
end)

--PATH gamemodes/darkrp/gamemode/modules/animations/sh_animations.lua:
local Anims = {}
local Flex = {}
local GSit = {}
-- Load animations after the languages for translation purposes
hook.Add("loadCustomDarkRPItems", "loadAnimations", function()
    Anims[ACT_GMOD_GESTURE_TAUNT_ZOMBIE] = "Зомби1"
    Anims[ACT_GMOD_TAUNT_SALUTE] = "Отдать честь"
    Anims[ACT_GMOD_GESTURE_AGREE] = "Согласен"
    Anims[ACT_GMOD_GESTURE_BECON] = "За мной"
    Anims[ACT_GMOD_GESTURE_BOW] = "Поклон"
    Anims[ACT_GMOD_TAUNT_CHEER] = "Ура!"
    Anims[ACT_GMOD_TAUNT_DANCE] = "Танец"
    Anims[ACT_GMOD_GESTURE_DISAGREE] = "Нет"
    Anims[ACT_SIGNAL_FORWARD] = "Вперёд!"
    Anims[ACT_SIGNAL_GROUP] = "Назад!"
    Anims[ACT_SIGNAL_HALT] = "Стоп!"
    Anims[ACT_GMOD_TAUNT_LAUGH] = "Смех"
    Anims[ACT_GMOD_TAUNT_MUSCLE] = "Сила"
    Anims[ACT_GMOD_TAUNT_PERSISTENCE] = "Испуг"
    Anims[ACT_GMOD_GESTURE_WAVE] = "Привет"
    Anims[ACT_GMOD_GESTURE_ITEM_THROW] = "Бросок"
    Anims[ACT_GMOD_GESTURE_ITEM_PLACE] = "Поставить"
    Anims[ACT_GMOD_GESTURE_ITEM_GIVE] = "Передать"
    Anims[ACT_GMOD_GESTURE_ITEM_DROP] = "Выбросить"
    Anims[ACT_GMOD_GESTURE_RANGE_FRENZY] = "Зомби3"
    Anims[ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL] = "Зомби2"
    Anims[ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE] = "Сильный Удар"
    Anims[ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2] = "Удар плечами"
    Anims[ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM] = "Слабый бросок"
    Flex['hype'] = 'Flek$'
    Flex['dancemoves'] = 'Танец'
    Flex['orangejustice'] = 'Оранжевый фрукт'
    Flex['bestmates'] = 'Выглядеть как идиот'
    Flex['boneless'] = 'Флексить руками'
    Flex['breakdown'] = 'Брейк'
    Flex['discofever'] = 'Король диско'
    Flex['electroshuffle'] = 'Электро-шаффл'
    Flex['floss'] = 'Зубная щётка'
    Flex['gentlemandab'] = 'Поклон'
    Flex['infinidab'] = 'Dab'
    Flex['intensity'] = 'Старомодный флекс'
    Flex['poplock'] = 'Полуробот'
    Flex['starpower'] = 'Звезда'
    Flex['wiggle'] = 'Wiggle'
    Flex['twist'] = 'Twist'
    Flex['youreawesome'] = 'Ты безбашенный'
    Flex['eagle'] = 'Орёл'
    Flex['flippinincredible'] = 'Флипп в невероятном'
    Flex['flippinsexy'] = 'Флипп в секси'
    Flex['fresh'] = 'Свежий'
    Flex['groovejam'] = 'ПАЗ варенья'
    Flex['handsignals'] = 'Сигналы руками'
    Flex['jubilation'] = 'Ликование'
    Flex['laughitup'] = 'Смейтесь!'
    Flex['livinglarge'] = 'Жить на широкую ногу'
    Flex['rambunctious'] = 'Буйный'
    Flex['reanimated'] = 'Реанимированный'
    Flex['swipeit'] = 'Проведите по нему пальцем'
    Flex['takethel'] = 'Взять л'
    Flex['trueheart'] = 'Истинное сердце'
    Flex['zany'] = 'Недотепа'
	GSit['sit_zen'] = 'Дзен'
	GSit['pose_standing_01'] = 'Важный типочек'
	GSit['pose_ducking_01'] = 'Рыцарь'
	GSit['pose_ducking_02'] = 'Йога'
	GSit['zombie_slump_idle_01'] = 'Мордой в пол'
	GSit['seq_cower'] = 'Админ не бань пж'
end)

hook.Add("KeyPress", "darkrp_animations", function(ply, key)
    if key == IN_ATTACK then
        local weapon = ply:GetActiveWeapon()

        if weapon:IsValid() then
            local class = weapon:GetClass()
            if class == "weapon_bugbait" then
                if ply.useshit == nil or ply.useshit < CurTime() then
                    ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_THROW)
                    ply.useshit = CurTime() + 1.5
                end
            end
        end
    end
end)

if SERVER then
    util.AddNetworkString("_DarkRP_CustomAnim")

    hook.Add("PlayerSwitchWeapon", "darkrp_sosiso4nie_onimacii_ya_goloden_da", function(ply, old, cucold)
        if IsValid(old) then
            net.Start("_DarkRP_CustomAnim")
            net.WriteEntity(ply)
            net.WriteDouble(8)
            net.Send(table.Filter(player.GetAll(), function(v) return ply:GetPos():Distance(v:GetPos()) < 2000 end))
        end
    end)

    local function CustomAnim(ply, cmd, args)
        if ply:EntIndex() == 0 then return end
        if ply:GetActiveWeapon():IsValid() and ply:GetActiveWeapon():GetClass() ~= "weapon_adv_keys" then return end
        local Gesture = tonumber(args[1] or 0)
        if not Anims[Gesture] then return end
        net.Start("_DarkRP_CustomAnim")
        net.WriteEntity(ply)
        net.WriteDouble(Gesture)
        net.Send(table.Filter(player.GetAll(), function(v) return ply:GetPos():Distance(v:GetPos()) < 2000 end))
    end

    concommand.Add("_DarkRP_DoAnimation", CustomAnim)

    return
end

local function CustomAnimation(len, ply)
    local ply = net.ReadEntity()
    local act = net.ReadDouble()
    if not IsValid(ply) then return end
    ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act, true)
end

net.Receive("_DarkRP_CustomAnim", CustomAnimation)
local AnimFlex
local AnimFrame
local AnimGSit
local function AnimationMenu()
    if AnimFrame then return end
    local Panel = vgui.Create("Panel")
    Panel:SetPos(0, 0)
    Panel:SetSize(ScrW(), ScrH())
    AnimFrame = AnimFrame or vgui.Create("DFrame", Panel)
    local Height = table.Count(Anims) * 27 + 32
    AnimFrame:SetSize(150, Height)
    AnimFrame:SetPos(ScrW() / 2 + ScrW() * 0.1, ScrH() / 2 - (Height / 2))
    AnimFrame:SetTitle("")
    AnimFrame.btnMaxim:SetVisible(false)
    AnimFrame.btnMinim:SetVisible(false)
    AnimFrame:SetVisible(true)
    AnimFrame:MakePopup()

    function AnimFrame:Close()
        surface.PlaySound('beep-21.mp3')

        if AnimFrame then
			Panel:Remove()
            AnimFrame:Remove()
            AnimFrame = nil
        end

        if AnimFlex then
            AnimFlex:Close()
        end
		
		if AnimGSit then
            AnimGSit:Close()
        end
    end

    local i = 0

    for k, v in SortedPairs(Anims) do
        i = i + 1
        local button = vgui.Create("DButton", AnimFrame)
        button:SetPos(10, (i - 1) * 27 + 30)
        button:SetSize(130, 25)
        button:SetText(v)

        button.DoClick = function()
            RunConsoleCommand("_DarkRP_DoAnimation", k)
        end
    end

    AnimFrame:SetSkin("SUP")
end

local function FlexAnimationMenu()
    if AnimFlex then return end
    local Panel = vgui.Create("Panel")
    Panel:SetPos(0, 0)
    Panel:SetSize(ScrW(), ScrH())
    AnimFlex = AnimFlex or vgui.Create("DFrame", Panel)
    local Height = table.Count(Flex) * 27 + 32
    AnimFlex:SetSize(150, Height)
    AnimFlex:SetPos(ScrW() / 1.6 + ScrW() * 0.1, ScrH() / 2 - (Height / 2))
    AnimFlex:SetTitle("")
    AnimFlex.btnMaxim:SetVisible(false)
    AnimFlex.btnMinim:SetVisible(false)
    AnimFlex:SetVisible(true)
    AnimFlex:MakePopup()

    function AnimFlex:Close()
        surface.PlaySound('beep-21.mp3')

        if AnimFlex then
			Panel:Remove()
            AnimFlex:Remove()
            AnimFlex = nil
        end
		
		 if AnimFrame then
            AnimFrame:Close()
        end
		
		if AnimGSit then
            AnimGSit:Close()
        end
    end

    local i = 0

    for k, v in SortedPairs(Flex) do
        i = i + 1
        local button = vgui.Create("DButton", AnimFlex)
        button:SetPos(10, (i - 1) * 27 + 30)
        button:SetSize(130, 25)
        button:SetText(v)

        button.DoClick = function()
            RunConsoleCommand('act_wos_fn', k)
        end
    end

    AnimFlex:SetSkin("SUP")
end

local function GSitAnimationMenu()
    if AnimGSit then return end
    local Panel = vgui.Create("Panel")
    Panel:SetPos(0, 0)
    Panel:SetSize(ScrW(), ScrH())
    AnimGSit = AnimGSit or vgui.Create("DFrame", Panel)
    local Height = table.Count(GSit) * 27 + 32
    AnimGSit:SetSize(150, Height)
    AnimGSit:SetPos(ScrW() / 1.33 + ScrW() * 0.1, ScrH() / 2 - (Height / 2))
    AnimGSit:SetTitle("Анимации Alt+E")
    AnimGSit.btnMaxim:SetVisible(false)
    AnimGSit.btnMinim:SetVisible(false)
    AnimGSit:SetVisible(true)
    AnimGSit:MakePopup()

    function AnimGSit:Close()
        surface.PlaySound('beep-21.mp3')

        if AnimGSit then
			Panel:Remove()
            AnimGSit:Remove()
            AnimGSit = nil
        end
		
		 if AnimFrame then
            AnimFrame:Close()
        end
		
		if AnimFlex then
            AnimFlex:Close()
        end
    end

    local i = 0

    for k, v in SortedPairs(GSit) do
        i = i + 1
        local button = vgui.Create("DButton", AnimGSit)
        button:SetPos(10, (i - 1) * 27 + 30)
        button:SetSize(130, 25)
        button:SetText(v)

        button.DoClick = function()
			net.Start("SelectAnimation")
            net.WriteString(k)
            net.SendToServer()
        end
    end

    AnimGSit:SetSkin("SUP")
end

concommand.Add("_DarkRP_AnimationMenu", AnimationMenu)
concommand.Add("_DarkRP_Flex", FlexAnimationMenu)
concommand.Add("_DarkRP_Gsit", GSitAnimationMenu)
--PATH addons/111mod/lua/darkrp_modules/menu/cl_joblist.lua:
local PANEL = {}

local c = Color
local ui = ui or {}

ui.col = {
	SUP 			= c(math.random(0,255),math.random(0,255),math.random(0,255)),
	Header 			= c(15,15,15,255),
	Gradient 		= c(85,85,85,200),
	Background 		= c(10,10,10,180),
	Outline 		= c(75,75,75,255),
	Hover 			= c(160,160,160,75),

	Button 			= c(80,80,80,150),
	ButtonHover 	= c(140,140,140,150),
	ButtonRed 		= c(240,0,0),
	ButtonGreen 	= c(0,240,0),
	Close 			= c(235,235,235),
	CloseBackground = c(215,45,90),
	doorcost = c(45, 164, 19),
	CloseHovered 	= c(235,25,70),
	cmenublack 	= c(0,0,0,200),

	TransGrey155 	= c(100,100,100,155),
	TransWhite50 	= c(255,255,255,50),
	TransWhite100 	= c(255,255,255,100),
	OffWhite 		= c(200,200,200),
	Grey 			= c(100,100,100),
	hp 			= c(255, 0, 0, 150),
	bron 			= c(204, 204, 204, 150),
	eda 			= c(214, 144, 61, 150),
	FlatBlack 		= c(40,40,40),
	tabblackcol 		= c(0, 0, 0, 220),
	taser 		= c(0, 255, 255, 255),
	dengi 		= c(64, 128, 64),
	hzche 		= c(255, 0, 0),
	zabanen 		= c(0, 255, 255),
	blackpp 		= c(0, 0, 0, 140),
	polublack 		= c(0, 0, 0, 150),
	Black 			= c(0,0,0),
	gplus 			= c(0,255,0),
	hztabkakoyto 			= c(120, 120, 120, 220),
	White 			= c(255,255,255),
	Red 			= c(235,10,10),
	huetadlyadash 			= c(255,255,255,10 ),
	huetadlyadash2 			= c(60,60,60,255),
	Green 			= c(10,235,10),
	DarkGreen 		= c(0, 153, 51),
	Orange 			= c(245,120,0),
	TransOrange 			= c(250,140,0,150),
	Yellow 			= c(255,255,51),
	Gold 			= c(212,175,55),
	bettergold 			= c(255,255,0),
	Purple 			= c(147,112,219),
	Pink 			= c(255,105,180),
	Brown 			= c(139,69,19)
}

function PANEL:Init()
    self:SetText('')
	self:SetTall(ScrH() * 0.052)
end

set_time = set_time or 0
played = played or 0

function PANEL:Paint(w, h)
	local colorbutton = self:IsHovered() and Color(91, 91, 91) or Color(61, 61, 61)
	draw.RoundedBoxEx(8, 0, 0, w, h - 2, colorbutton, true, false, true)
    draw.RoundedBox(8, 0, 0, w * 0.031, h - 2, self.job.color)

    local x = w * 0.075
    local job = self.kjob
    local mnoz = 1
	
	
    if self.job.playtime then
        local jobtime =  tonumber(self.job.playtime)
        local time = (played + (CurTime() - set_time) * mnoz)

        if time < jobtime and not self.job.vip then
            x = x + draw.SimpleText('[' .. string.FormatTime((jobtime - time)) .. ']', "F4FancyButton", x, h * 0.5 - 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) + 5
        elseif time < jobtime and self.job.vip then
            x = x + draw.SimpleText('[VIP] ', 'F4FancyButton', x, h * 0.5, ui.col.bettergold, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            x = x + draw.SimpleText(' [' .. string.FormatTime((jobtime - time)) .. ']', "F4FancyButton", x, h * 0.5 - 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) + 5
        end
    end
	
    if self.job.vip and job ~= TEAM_MODER then		
		if self.job.playtime then
			local jobtime =  tonumber(self.job.playtime)
			local time = (played + (CurTime() - set_time) * mnoz)
			if time > jobtime then
				x = x + draw.SimpleText('[VIP]', 'F4FancyButton', x, h * 0.5 - 2, ui.col.bettergold, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) + 5
			end
		else
			x = x + draw.SimpleText('[VIP]', 'F4FancyButton', x, h * 0.5 - 2, ui.col.bettergold, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) + 5
		end
    end

    draw.SimpleText(self.job.name, 'F4FancyButton', x, h * 0.5 - 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    draw.SimpleText(#team.GetPlayers(self.job.team) .. '/' .. ((self.job.max == 0) and '∞' or self.job.max), 'F4FancyButton', w - w * 0.065, h * 0.5 - 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function PANEL:OnCursorEntered()
    self.Parent.job = self.job
    self.Parent.ModelKey = self.ModelKey or 1
    self.Preview:SetModel(istable(self.job.model) and self.job.model[self.Parent.ModelKey] or tostring(self.job.model))
    self.Preview:FindSequence()
end

function PANEL:DoClick()
    if self.Parent.DoClick then
        self.Parent.DoClick(self)

        return
    end
    if self.job.vote then
        RunConsoleCommand("darkrp", "vote" .. self.job.command)
    else
        RunConsoleCommand("darkrp", self.job.command)
    end
	
	self.ModelKey = self.ModelKey or 1
	RunConsoleCommand("accesstomodel", tostring(self.job.model[self.ModelKey]))
end

function PANEL:SetJob(job, k)
    self.kjob = k
    self.job = job
    self.job.color = Color(job.color.r, job.color.g, job.color.b, 125)
end

vgui.Register('rp_jobbutton', PANEL, 'Button')
PANEL = {}

function PANEL:Init()
    self.job = RPExtraTeams[1]
    self.job.color = Color(self.job.color.r, self.job.color.g, self.job.color.b, 125)
    self.ModelKey = self.ModelKey or 1
    self.JobList = ui.Create('ui_scrollpanel', self)
	self.JobList.ShouldHideScrollbar = true
    self.Info = ui.Create('ui_panel', self)

    self.Info.Paint = function(s, w, h)
		local upperbox = ScrH() * 0.0355
		local downbox = ScrH() * 0.052
        draw.Box(0, 0, w, upperbox, self.job.color)
		draw.Box(0, upperbox, w, downbox - 2, Color(61, 61, 61))
        draw.SimpleText(self.job.name, 'F4FancyButton', w * 0.5, upperbox + downbox / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        for k, v in ipairs(string.Wrap('F4FancyButton', self.job.description, self:GetWide() - ScrW() * 0.3)) do
            draw.SimpleText(v, 'F4FancyButton', ScrW() * 0.01565, upperbox + downbox + ScrH() * 0.028 + ((k - 1) * 26), Color(182, 182, 182), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    self.Model = ui.Create('rp_playerpreview', self)
    self.Model:SetFOV(50)
    self.Model:SetModel(istable(self.job.model) and self.job.model[self.ModelKey] or tostring(self.job.model))
    self.pickprofa = ui.Create('DButton', self)
    self.pickprofa:SetText('')

	self.pickprofa.Paint = function(s, w, h)
		draw.RoundedBox(8, 0, 0, w, h, color_white)
		draw.SimpleText('Выбрать профессию', 'F4FancyButton', w / 2, h / 2, color_black, 1, 1)
	end

    self.pickprofa.DoClick = function()
        if self.job.vote then
            RunConsoleCommand("darkrp", "vote" .. self.job.command)
        else
            RunConsoleCommand("darkrp", self.job.command)
        end
		
		RunConsoleCommand("accesstomodel", tostring(self.job.model[self.ModelKey]))
    end
	
	self.BackModel = ui.Create('DButton', self)
	self.BackModel:SetText('')
	self.BackModel.Paint = function(s, w, h)
		draw.RoundedBox(8, 0, 0, w, h, color_white)
		draw.SimpleText('<<', 'F4FancyButton', w / 2, h / 2, color_black, 1, 1)
	end

	self.BackModel.Think = function(s)
		if (not istable(self.job.model)) or (#self.job.model == 1) or (self.ModelKey <= 1) then
			s:SetDisabled(true)
			s:SetAlpha(50)
		else
			s:SetDisabled(false)
			s:SetAlpha(255)
		end
	end

	self.BackModel.DoClick = function()
		self.ModelKey = self.ModelKey - 1
		self.Model:SetModel(self.job.model[self.ModelKey])
	end

	self.NextModel = ui.Create('DButton', self)
	self.NextModel:SetText('')
	self.NextModel.Paint = function(s, w, h)
		draw.RoundedBox(8, 0, 0, w, h, color_white)
		draw.SimpleText('>>', 'F4FancyButton', w / 2, h / 2, color_black, 1, 1)
	end

	self.NextModel.Think = function(s)
		if (not istable(self.job.model)) or (#self.job.model == 1) or (self.ModelKey >= #self.job.model) then
			s:SetDisabled(true)
			s:SetAlpha(50)
		else
			s:SetDisabled(false)
			s:SetAlpha(255)
		end
	end

	self.NextModel.DoClick = function()
		self.ModelKey = self.ModelKey + 1
		self.Model:SetModel(self.job.model[self.ModelKey])
	end
	
    local teams = {}

	for k, v in ipairs(RPExtraTeams) do
		-- if ((not v.customCheck) or v.customCheck(LocalPlayer())) and (k ~= LocalPlayer():Team()) then
			local cat = v.category or ''
			if (not teams[cat]) then teams[cat] = {} end
			teams[cat][#teams[cat] + 1] = {[1]=v,[2]=k}
		-- end
	end
	
	
	for cat, jobs in SortedPairs(teams) do
		self:AddCat(cat)
		for _, job in ipairs(jobs) do
			self:AddJob(job)
		end
	end
end

local grdown = Material('gui/gradient_down', 'smooth')
function PANEL:AddCat(cat)
	self.JobList:AddItem(ui.Create('DButton', function(s, p)
		s:SetText('')
		s:SetTall(ScrH() * 0.0355)
		s:SetDisabled(true)
		s.Paint = function(ss, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(126, 126, 126))
			surface.SetDrawColor(0, 0, 0, 100)
            surface.SetMaterial(grdown)
            surface.DrawTexturedRect(0, 0, w, h * 1.5)
			draw.SimpleText(cat, 'F4FancyButtonBold', w / 2, h / 2, color_white, 1, 1)
		end
	end))
end

function PANEL:AddJob(job)
	local btn = ui.Create('rp_jobbutton')
	btn:SetJob(job[1], job[2])
	btn.Parent 	= self
	btn.Preview = self.Model
	self.JobList:AddItem(btn)
end

function PANEL:PerformLayout()
    self.JobList:SetPos(0, 0)
    self.JobList:SetSize(self:GetWide() * 0.54625, self:GetTall())
    self.JobList:SetSpacing(0)
    self.Info:SetPos(self:GetWide() * 0.54625, 0)
    self.Info:SetSize(self:GetWide() * 0.45375, self:GetTall() * 0.5)
    self.Model:SetPos(self:GetWide() * 0.54625, self:GetTall() * 0.4)
    self.Model:SetSize(self:GetWide() * 0.45375, self:GetTall() * 0.45)
	local pickprofpos, pickprofh, pickprofclrh = (self:GetWide() + (self:GetWide() * 0.54625)) / 2 - (ScrW() * 0.124) / 2, ScrH() * 0.0334 + ScrH() * 0.04, ScrH() * 0.04
	local mdlw, mdlh = ScrW() * 0.0131, ScrH() * 0.0232
	self.BackModel:SetPos(pickprofpos - mdlw * 2, self:GetTall() - pickprofh / 2 - pickprofclrh / 2 - mdlh / 2)
	self.BackModel:SetSize(mdlw, mdlh)
	self.NextModel:SetPos(pickprofpos + (ScrW() * 0.124) + mdlw, self:GetTall() - pickprofh / 2 - pickprofclrh / 2 - mdlh / 2)
	self.NextModel:SetSize(mdlw, mdlh)
    self.pickprofa:SetPos(pickprofpos, self:GetTall() - pickprofh)
    self.pickprofa:SetSize(ScrW() * 0.124, pickprofclrh)
end

timer.Create('ASDSADASDD', 1, 0, function()
    if IsValid(LocalPlayer()) and LocalPlayer():GetNW2Int("playtime", 0) ~= played then
        set_time = CurTime()
        played = LocalPlayer():GetNW2Int("playtime", 0)
    end
end)

vgui.Register('rp_jobslist', PANEL, 'Panel')
--PATH addons/111mod/lua/darkrp_modules/gmb_adminchat/sh_adminchat.lua:
achat = achat or {}

achat.groups = {
    ['superadmin'] = true,
    ['admin'] = true,
    ['overwatch'] = true,
    ['manager'] = true,
    ['NS-helper'] = true,
    ['dsuperadmin'] = true,
    ['sponsor'] = true,
    ['uprav'] = true,
    ['NS-assistant'] = true,
    ['NS-mladmin'] = true,
    ['NS-mlmoder'] = true,
    ['NS-trainee'] = true,
    ['NS-zammanager'] = true,
    ['NS-admin'] = true,
    ['NS-moder'] = true,
    ['padmin'] = true,
    ['moder'] = true,
    ['downer'] = true
}

achat.headadmins = {
    ['superadmin'] = true,
    ['manager'] = true,
    ['uprav'] = true,
    ['NS-zammanager'] = true,
    ['overwatch'] = true
}

achat.staff = {
    ['NS-moder'] = true,
    ['NS-admin'] = true,
    ['NS-assistant'] = true,
    ['NS-mladmin'] = true,
    ['NS-mlmoder'] = true,
    ['NS-trainee'] = true,
    ['NS-helper'] = true
}

achat.ranks = {
    ['superadmin'] = 'Владелец',
    ['manager'] = 'Рук.состав',
    ['NS-helper'] = 'Хелпер',
    ['NS-admin'] = 'Администратор',
    ['NS-moder'] = 'Модератор',
    ['moder'] = 'Д-Модератор',
    ['padmin'] = 'Д-Админ',
    ['downer'] = 'Д-Создатель',
    ['dsuperadmin'] = 'Д-Владелец',
    ['sponsor'] = 'Д-Спонсор',
    ['admin'] = 'Тех-Админ',
    ['overwatch'] = 'Куратор NS',
    ['NS-mlmoder'] = 'Младший модератор',
    ['NS-mladmin'] = 'Младший администратор',
    ['NS-trainee'] = 'Стажер',
    ['NS-zammanager'] = 'Зам.рук.состава',
    ['NS-assistant'] = 'Ассистент',
    ['uprav'] = 'Управляющий',
}

if SERVER then
    util.AddNetworkString('sendachat')

    function sendachat(...)
        local args = {...}

        local plys = {}

        for _, v in player.Iterator() do
            if v:IsAdminGroups() and v:GetNW2Bool('ahide') == false then
                table.insert(plys, v)
            end
        end

        if table.Count(plys) == 0 then return end
        net.Start('sendachat')
        net.WriteTable(args)
        net.Send(plys)
    end
end

if CLIENT then
    net.Receive('sendachat', function()
        chat.AddText(unpack(net.ReadTable()))
    end)

	print(weapons.Get( "weapon_crowbar" ))
end

if SERVER then
    function sendchatall(...)
        local args = {...}

        net.Start('sendachat')
        net.WriteTable(args)
        net.Broadcast()
    end
end

local pmeta = FindMetaTable('Player')

function pmeta:IsAdminGroups()
    return achat.groups[self:GetUserGroup()] ~= nil
end

function pmeta:IsHeadAdminGroups()
    return achat.headadmins[self:GetUserGroup()] ~= nil
end

function pmeta:IsMainAdminGroups()
    return achat.staff[self:GetUserGroup()] ~= nil
end
--PATH addons/111mod/lua/darkrp_customthings/vehicles.lua:
--[[---------------------------------------------------------------------------
DarkRP custom vehicles
---------------------------------------------------------------------------

This file contains your custom vehicles.
This file should also contain vehicles from DarkRP that you edited.

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:Vehicles

If you want to keep the vehicle code and not comment it out you can add a vehicle to the "DarkRP.disabledDefaults["vehicles"]" section
in the disabled_defaults.lua in the "darkrp_config" folder

Add vehicles under the following line:
---------------------------------------------------------------------------]]

--PATH addons/111mod/lua/darkrp_customthings/categories.lua:
--[[-----------------------------------------------------------------------
Categories
---------------------------------------------------------------------------
The categories of the default F4 menu.

Please read this page for more information:
http://wiki.darkrp.com/index.php/DarkRP:Categories

In case that page can't be reached, here's an example with explanation:

DarkRP.createCategory{
    name = "Citizens", -- The name of the category.
    categorises = "jobs", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(0, 107, 0, 255), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 100, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}


Add new categories under the next line!
---------------------------------------------------------------------------]]

-- Основные работы
DarkRP.createCategory{ 
   name = "     Гражданские",
   categorises = "jobs",
   startExpanded = false,
   color = Color(18, 135, 0, 255),
   canSee = function(ply) return true end,
   sortOrder = 10,
}

-- Правительство
DarkRP.createCategory{
   name = "    Бездомные",
   categorises = "jobs",
   startExpanded = false,
   color = Color(0, 136, 145, 255),
   canSee = function(ply) return true end,
   sortOrder = 11,
}

-- Бизнес
DarkRP.createCategory{
   name = " Торговцы",
   categorises = "jobs",
   startExpanded = false,
   color = Color(0, 237, 94, 255),
   canSee = function(ply) return true end,
   sortOrder = 12,
}

-- Криминал
DarkRP.createCategory{
   name = "  Криминал",
   categorises = "jobs",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 13,
}

-- Криминал
DarkRP.createCategory{
   name = "   Правопорядок",
   categorises = "jobs",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 13,
}

-- Криминал
DarkRP.createCategory{
   name = "Другие",
   categorises = "jobs",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 13,
}

DarkRP.createCategory{
   name = "VIP/ADMIN",
   categorises = "jobs",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 14,
}

DarkRP.createCategory{
   name = "Нелегальные предметы",
   categorises = "entities",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 14,
}

DarkRP.createCategory{
   name = "Легкое оружие",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 2,
}

DarkRP.createCategory{
   name = "Тяжёлое оружие",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 4,
}

DarkRP.createCategory{
   name = "Холодное оружие",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 1,
}

DarkRP.createCategory{
   name = "Снайперские винтовки",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 5,
}

DarkRP.createCategory{
   name = "Взрывчатые устройства",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 6,
}

DarkRP.createCategory{
   name = "Остальное",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 7,
}

DarkRP.createCategory{
   name = "Остальное",
   categorises = "entities",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 7,
}

DarkRP.createCategory{
   name = "Пистолеты-Пулемёты",
   categorises = "shipments",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 3,
}


DarkRP.createCategory{
   name = "Жизни/Броня [VIP]",
   categorises = "entities",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 3,
}


DarkRP.createCategory{
	name = "Битмайнер",
	categorises = "entities",
	startExpanded = false,
	color = Color(120, 120, 255, 255),
    canSee = function(ply) return true end,
	sortOrder = 31,
}

DarkRP.createCategory{
   name = "Предметы работы",
   categorises = "entities",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 2,
}

DarkRP.createCategory{
   name = "Казино",
   categorises = "entities",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 39,
}


DarkRP.createCategory{
   name = "Наркота",
   categorises = "entities",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 2,
}

DarkRP.createCategory{
   name = "Патроны",
   categorises = "ammo",
   startExpanded = false,
   color = Color(30, 30, 30, 255),
   canSee = function(ply) return true end,
   sortOrder = 28,
}

DarkRP.createCategory{
	name = "Cocaine Factory",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 80,
}

DarkRP.createCategory{
	name = "Cocaine Factory",
	categorises = "weapons",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 80,
}

DarkRP.createCategory{
	name = "Cocaine Factory",
	categorises = "shipments",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 80,
}

DarkRP.createCategory{
	name = "MasterMethCook",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 103
}

DarkRP.createCategory{
    name = "Weed Grower",
    categorises = "entities",
    startExpanded = true,
    color = Color(255, 107, 0, 255),
    canSee = function(ply) return true end,
    sortOrder = 104
}

--PATH addons/m9k/lua/weapons/bobs_blacklisted/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/bobs_blacklisted/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("bobs_blacklisted")
SWEP.Category				= ""
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "you're holding a blacklisted weapon!"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= false		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- set false if you want no crosshair
SWEP.Weight				= 0			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= false		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "normal"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.SelectiveFire		= false

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_hands.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_suitcase_passenger.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= ("")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 1			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 0		-- Size of a clip
SWEP.Primary.DefaultClip		= 0		-- Bullets you start with
SWEP.Primary.KickUp				= 0		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "false"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 0		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 0		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 0	-- Base damage per bullet
SWEP.Primary.Spread		= 0	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(0,0,0)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(0,0,0)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector (0,0,0)
SWEP.RunSightsAng = Vector (0,0,0)

SWEP.BlackListed = true

function SWEP:PrimaryAttack()
self.Owner:PrintMessage(HUD_PRINTCENTER, "THIS WEAPON HAS BEEN BLACKLISTED")
end
function SWEP:SecondaryAttack()
self.Owner:PrintMessage(HUD_PRINTCENTER, "THIS WEAPON HAS BEEN BLACKLISTED")
end

function SWEP:Think()
end
--PATH addons/truefishing/lua/weapons/fishing_rod_2/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Удочка уровень 2"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Base = "fishing_rod"

SWEP.Author = "MrGeRoI"
SWEP.Instructions = "ЛКМ, чтобы пустить леску.\nПКМ, чтобы поймать рыбу."
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.BarSize = 0.09
SWEP.RodLevel = 1

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
--PATH addons/itemstore_new/lua/weapons/itemstore_pickup.lua:
if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName = "Инвентарь"

SWEP.Purpose = "Picking up stuff"
SWEP.Instructions = "Primary attack: pick up item\nSecondary attack: view inventory"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/c_arms.mdl"
SWEP.WorldModel = ""
SWEP.UseHands = true

SWEP.Primary.Clipsize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Clipsize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Slot               = 1
SWEP.SlotPos 			= 10
SWEP.DrawAmmo           = false
SWEP.DrawCrosshair      = true

function SWEP:Initialize()
	self:SetHoldType( "normal" )
end

function SWEP:OnDrop()
	self:Remove()
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	self.Owner:PickupItem()
end

function SWEP:SecondaryAttack()
	if CLIENT then return end

	self.Owner:OpenContainer( self.Owner.Inventory:GetID(),
		itemstore.Translate( "inventory" ), true )
end

--PATH addons/111mod/lua/weapons/lockpick/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "Отмычка"
	SWEP.Slot = 5
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server

SWEP.Instructions = "Подойдите к двери и нажмите ЛКМ или ПКМ"
SWEP.Purpose = ""

SWEP.ViewModelFOV = 85
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/sterling/c_enhanced_lockpicks.mdl")
SWEP.WorldModel = Model("models/sterling/w_enhanced_lockpicks.mdl")

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Other"

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = -1     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false        -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""

--[[-------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------]]
function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsLockpicking")
	self:NetworkVar("Float", 0, "LockpickStartTime")
	self:NetworkVar("Float", 1, "LockpickEndTime")
	self:NetworkVar("Float", 2, "NextSoundTime")
	self:NetworkVar("Int", 0, "TotalLockpicks")
	self:NetworkVar("Entity", 0, "LockpickEnt")
end

--[[-------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------]]
function SWEP:PrimaryAttack()
    local function RunAnimation()
		if( IsValid( self ) ) then
			local VModel = self.Owner:GetViewModel()
			local EnumToSeq = VModel:SelectWeightedSequence( ACT_VM_PRIMARYATTACK )
			VModel:SendViewModelMatchingSequence( EnumToSeq )
		end
	end
	
	self:SetNextPrimaryFire(CurTime() + 2)
	if self:GetIsLockpicking() then RunAnimation() return end
	
	self:GetOwner():LagCompensation(true)
	local trace = self:GetOwner():GetEyeTrace()
	self:GetOwner():LagCompensation(false)
	local ent = trace.Entity

	if not IsValid(ent) then return end
	local canLockpick = hook.Call("canLockpick", nil, self:GetOwner(), ent)

	if canLockpick == false then return end
	if canLockpick ~= true and (
			trace.HitPos:Distance(self:GetOwner():GetShootPos()) > 100 or
			(not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) or
			(not ent:isDoor() and not ent:IsVehicle() and not string.find(string.lower(ent:GetClass()), "vehicle") and (not GAMEMODE.Config.lockpickfading or not ent.isFadingDoor))
		) then
		return
	end

	self:SetHoldType("pistol")

	self:SetIsLockpicking(true)
	self:SetLockpickEnt(ent)
	self:SetLockpickStartTime(CurTime())
	local endDelta = hook.Call("lockpickTime", nil, ply, ent) or util.SharedRandom("DarkRP_Lockpick"..self:EntIndex().."_"..self:GetTotalLockpicks(), 8, 8)
	self:SetLockpickEndTime(CurTime() + endDelta)
	self:SetTotalLockpicks(self:GetTotalLockpicks() + 1)
	RunAnimation()
	if CLIENT then
		self.Dots = ""
		self.NextDotsTime = CurTime() + 0.3
		return
	end

	local onFail = function(ply) if ply == self:GetOwner() then hook.Call("onLockpickCompleted", nil, ply, false, ent) end end

	-- Lockpick fails when dying or disconnecting
	hook.Add("PlayerDeath", self, fc{onFail, fn.Flip(fn.Const)})
	hook.Add("PlayerDisconnected", self, fc{onFail, fn.Flip(fn.Const)})
	-- Remove hooks when finished
	hook.Add("onLockpickCompleted", self, fc{fp{hook.Remove, "PlayerDisconnected", self}, fp{hook.Remove, "PlayerDeath", self}})
end

function SWEP:Holster()
	self:SetIsLockpicking(false)
	self:SetLockpickEnt(nil)
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

	if ent.isFadingDoor then
		ent:Fade()
	elseif ent.Fire then
		ent:keysUnLock()
		timer.Simple( 0.6, function() ent:Use(self:GetOwner(), self:GetOwner(), USE_ON, 1) end )
	end
	
	 self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
	
end

function SWEP:Fail()
	self:SetIsLockpicking(false)
	self:SetHoldType("normal")

	hook.Call("onLockpickCompleted", nil, self:GetOwner(), false, self:GetLockpickEnt())
	self:SetLockpickEnt(nil)
	self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end

function SWEP:Think()
	if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

	if CurTime() >= self:GetNextSoundTime() then
		self:SetNextSoundTime(CurTime() + 1)
		local snd = {1,3,4}
		if table.HasValue({ "vip", "helper", "administrator", "admin", "superadmin"}, self:GetOwner():GetUserGroup()) then
			self:EmitSound("weapons/357/357_reload".. tostring(snd[math.Round(util.SharedRandom("DarkRP_LockpickSnd"..CurTime(), 1, #snd))]) ..".wav", 40, 100)
		else
			self:EmitSound("weapons/357/357_reload".. tostring(snd[math.Round(util.SharedRandom("DarkRP_LockpickSnd"..CurTime(), 1, #snd))]) ..".wav", 50, 100)
		end
	end
	if CLIENT and self.NextDotsTime and CurTime() >= self.NextDotsTime then
		self.NextDotsTime = CurTime() + 0.3
		self.Dots = self.Dots or ""
		local len = string.len(self.Dots)
		local dots = {[0]=".", [1]="..", [2]="...", [3]=""}
		self.Dots = dots[len]
	end

	local trace = self:GetOwner():GetEyeTrace()
	if not IsValid(trace.Entity) or trace.Entity ~= self:GetLockpickEnt() or trace.HitPos:Distance(self:GetOwner():GetShootPos()) > 100 then
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
	local x,y,width,height = w/2-w/10, h/2-60, w/5, h/30
	draw.RoundedBox(1, x, y, width, height, Color(30,30,30,255))
	draw.SimpleTextOutlined("Взлом"..self.Dots, "Trebuchet24", ScrW()/2, ScrH()/2, Color(255,255,255,255), 1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, Color(0,0,0,255))

	local time = self:GetLockpickEndTime() - self:GetLockpickStartTime()
	local curtime = CurTime() - self:GetLockpickStartTime()
	local status = math.Clamp(curtime/time, 0, 1)
	local BarWidth = status * (width - 15)
	local cornerRadius = math.Min(1, BarWidth/3*2 - BarWidth/3*2%2)
	draw.RoundedBox(cornerRadius, x+8, y+8, BarWidth, height-15, Color(255-(status*255), 0+(status*255), 0, 255))
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

--PATH addons/m9k/lua/weapons/m9k_deagle/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_deagle/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_deagle") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Desert Eagle"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 21			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_tcom_deagle.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_tcom_deagle.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_TDegle.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "357"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-1.7102, 0, 0.2585)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-1.7102, 0, 0.2585)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector(3.444, -7.823, -6.27)
SWEP.RunSightsAng = Vector(60.695, 0, 0)
-- SWEP.RunSightsPos = Vector (-0.3967, 0, 2.2339)
-- SWEP.RunSightsAng = Vector (-17.3454, -2.6248, 0)

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
--PATH addons/m9k/lua/weapons/m9k_glock/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_glock/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_glock") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Glock 18"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 22			-- Position in the slot
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
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_dmg_glock.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_dmg_glock.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Dmgfok_glock.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 1200			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 32		-- Size of a clip
SWEP.Primary.DefaultClip		= 64		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 12	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .02 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (2.2042, 0, 1.7661)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.2042, 0, 1.7661)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (0.4751, 0, 1.8442)
SWEP.RunSightsAng = Vector (-17.6945, -1.4012, 0)

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
--PATH addons/m9k/lua/weapons/m9k_m24/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m24/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m24") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M24"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 43			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_dmg_m24s.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_snip_m24_6.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Dmgfok_M24SN.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 60		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 5		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= .6				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .6			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .6		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 9	
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
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 95	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .000115 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector (2.894, 0, 1.7624)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.894, 0, 1.7624)
SWEP.SightsAng = Vector (0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_vikhr/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_vikhr/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_vikhr") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "SR-3M Vikhr"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 40			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_dmg_vikhr.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_dmg_vikhr.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Dmgfok_vikhr.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 800			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 19	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-2.2363, -1.0859, 0.5292)
SWEP.IronSightsAng = Vector (1.4076, 0.0907, 0)
SWEP.SightsPos = Vector (-2.2363, -1.0859, 0.5292)
SWEP.SightsAng = Vector (1.4076, 0.0907, 0)
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
--PATH addons/weaponandcontent/lua/weapons/mp5/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "MP5"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(2.049, -1.828, 0.782)
	SWEP.AimAng = Vector(0.089, 0, 0)
	
	SWEP.SprintPos = Vector(-4.075, -5.47, -0.237)
	SWEP.SprintAng = Vector(-5.073, -57.223, -0.276)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "x"
	--killicon.AddFont("swb_mp5", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_small"
	SWEP.MuzzlePosMod = {x = 5, y = 30, z = -4}
	SWEP.PosBasedMuz = true
end
SWEP.CanPenetrate = false
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 20
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_smg_mp5.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_mp5.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.075
SWEP.FireSound = Sound("Alt_Weapon_MP5Navy.1")
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.008
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH addons/weaponandcontent/lua/weapons/swb_base/shared.lua:
AddCSLuaFile()
AddCSLuaFile("sh_bullets.lua")
AddCSLuaFile("cl_model.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_calcview.lua")
AddCSLuaFile("sh_ammotypes.lua")
AddCSLuaFile("sh_move.lua")
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("cl_playerbindpress.lua")

include("sh_bullets.lua")
include("sh_ammotypes.lua")
include("sh_move.lua")
include("sh_sounds.lua")

game.AddParticles("particles/swb_muzzle.pcf")

PrecacheParticleSystem("swb_pistol_large")
PrecacheParticleSystem("swb_pistol_med")
PrecacheParticleSystem("swb_pistol_small")
PrecacheParticleSystem("swb_rifle_large")
PrecacheParticleSystem("swb_rifle_med")
PrecacheParticleSystem("swb_rifle_small")
PrecacheParticleSystem("swb_shotgun")
PrecacheParticleSystem("swb_silenced")
PrecacheParticleSystem("swb_silenced_small")
PrecacheParticleSystem("swb_sniper")

if CLIENT then
	include("cl_calcview.lua")
	include("cl_playerbindpress.lua")
	include("cl_model.lua")
	include("cl_hud.lua")
	
	SWEP.DrawCrosshair = false
	SWEP.BounceWeaponIcon = false
	SWEP.DrawWeaponInfoBox = false
	SWEP.CurFOVMod = 0
	SWEP.BobScale = 0
	SWEP.SwayScale = 0
	SWEP.ZoomAmount = 15
	SWEP.FadeCrosshairOnAim = true
	SWEP.DrawAmmo = true
	SWEP.DrawTraditionalWorldModel = true
	SWEP.CrosshairEnabled = true
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ReloadViewBobEnabled = true
	SWEP.RVBPitchMod = 1
	SWEP.RVBYawMod = 1
	SWEP.RVBRollMod = 1
	SWEP.BulletDisplay = 0
	SWEP.Shell = "mainshell"
	SWEP.ShellScale = 1
	SWEP.ZoomAmount = 15
	SWEP.CSMuzzleFlashes  = true
	SWEP.ZoomWait = 0
	SWEP.CrosshairParts = {left = false, right = false, upper = false, lower = false}
	SWEP.FireModeDisplayPos = "middle"
	SWEP.SwimPos = Vector(0, 0, -2.461)
	SWEP.SwimAng = Vector(-26.57, 0, 0)
end

SWEP.FadeCrosshairOnAim = true

if SERVER then
	SWEP.PlayBackRateSV = 1
end

SWEP.AimMobilitySpreadMod = 0.5
SWEP.PenMod = 1
SWEP.AmmoPerShot = 1
SWEP.SWBWeapon = true
SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= ""
SWEP.WorldModel		= ""
SWEP.AnimPrefix		= "fist"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= -1				// Default number of bullets in a clip
SWEP.Primary.Automatic		= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1				// Size of a clip
SWEP.Secondary.DefaultClip	= -1				// Default number of bullets in a clip
SWEP.Secondary.Automatic	= true				// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"

SWEP.AddSpread = 0
SWEP.SpreadWait = 0
SWEP.AddSpreadSpeed = 1
SWEP.ReloadWait = 1
SWEP.PlayBackRateHip = 1
SWEP.PlayBackRate = 1
SWEP.ReloadSpeed = 1

SWEP.Chamberable = true
SWEP.UseHands = true
SWEP.CanPenetrate = true
SWEP.CanRicochet = false
SWEP.AddSafeMode = true
SWEP.Suppressable = false
SWEP.SprintingEnabled = true
SWEP.HolsterUnderwater = true
SWEP.HolsterOnLadder = true

SWEP.BurstCooldownMul = 1.75
SWEP.BurstSpreadIncMul = 0.5
SWEP.BurstRecoilMul = 0.85
SWEP.DeployTime = 1
SWEP.Shots = 1
SWEP.FromActionToNormalWait = 0
SWEP.ShotgunReloadState = 0

SWB_IDLE = 0
SWB_RUNNING = 1
SWB_AIMING = 2
SWB_ACTION = 3

SWEP.FireModeNames = {["auto"] = {display = "АВТОМАТ  ", auto = true, burstamt = 0, buldis = 5},
	["semi"] = {display = "ПОЛУ-АВТО", auto = false, burstamt = 0, buldis = 1},
	["double"] = {display = "МОЩНЫЙ ВЫСТРЕЛ", auto = false, burstamt = 0, buldis = 1},
	["bolt"] = {display = "ОБЫЧНЫЙ", auto = false, burstamt = 0, buldis = 1},
	["pump"] = {display = "ПОМПОВЫЙ", auto = false, burstamt = 0, buldis = 1},
	["break"] = {display = "ПРЕРЫВНОЕ", auto = false, burstamt = 0, buldis = 1},
	["2burst"] = {display = "2 ВЫСТРЕЛА", auto = true, burstamt = 2, buldis = 2},
	["3burst"] = {display = "3 ВЫСТРЕЛА", auto = true, burstamt = 3, buldis = 3},
	["safe"] = {display = "ПРЕДОХРАНИТЕЛЬ", auto = false, burstamt = 0, buldis = 0}}

local math = math

function SWEP:IsEquipment() -- I have no idea what I'm doing, help
	return WEPS.IsEquipment(self)
end

function SWEP:CalculateEffectiveRange()
	self.EffectiveRange = self.CaseLength * 10 - self.BulletDiameter * 5 -- setup realistic base effective range
	self.EffectiveRange = self.EffectiveRange * 39.37 -- convert meters to units
	self.EffectiveRange = self.EffectiveRange * 0.25
	self.DamageFallOff = (100 - (self.CaseLength - self.BulletDiameter)) / 200
	self.PenStr = (self.BulletDiameter * 0.5 + self.CaseLength * 0.35) * (self.PenAdd and self.PenAdd or 1)
	self.PenetrativeRange = self.EffectiveRange * 0.5
end

local tbl, tbl2

function SWEP:Initialize()
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetHoldType(self.NormalHoldType)
	self:CalculateEffectiveRange()
	self.CHoldType = self.NormalHoldType
	
	if self.AddSafeMode then
		table.insert(self.FireModes, #self.FireModes + 1, "safe")
	end
	
	t = self.FireModes[1]
	self.FireMode = t
	t = self.FireModeNames[t]
	
	self.Primary.Auto = t.auto
	self.BurstAmount = t.burstamt
	
	self.CurCone = self.HipSpread
	self.Primary.ClipSize_Orig = self.Primary.ClipSize
	
	if CLIENT then
		self.ViewModelFOV_Orig = self.ViewModelFOV
		self.BulletDisplay = t.buldis
		self.FireModeDisplay = t.display
		
		if self.WM then
			self.WMEnt = ClientsideModel(self.WM, RENDERGROUP_BOTH)
			self.WMEnt:SetNoDraw(true)
		end
	end
end

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "State")
	self:NetworkVar("Int", 1, "Shots")
	self:NetworkVar("Bool", 0, "Suppressed")
	self:NetworkVar("Bool", 1, "Safe")
end

local vm, CT, aim, cone, vel, CT, tr
local td = {}

function SWEP:Deploy()
	if self.dt.Suppressed then
		self:SendWeaponAnim(ACT_VM_DRAW_SILENCED)
	else
		self:SendWeaponAnim(ACT_VM_DRAW)
	end
			
	self.dt.State = SWB_IDLE
	CT = CurTime()
	
	self:SetNextSecondaryFire(CT + self.DeployTime)
	self:SetNextPrimaryFire(CT + self.DeployTime)
	return true
end

function SWEP:TranslateFOV(fov)
	if self.dt.State == SWB_AIMING then return 40 end
	return fov
end

function SWEP:Holster()
	if self.ReloadDelay then
		return false
	end
	
	self.ShotgunReloadState = 0
	self.ReloadDelay = nil
	self.dt.State = SWB_IDLE
	return true
end

local mag

local reload_male = {
	Sound("vo/npc/male01/youdbetterreload01.wav"),
	Sound("vo/npc/male01/coverwhilereload01.wav"),
	Sound("vo/npc/male01/coverwhilereload02.wav"),
	Sound("vo/npc/male01/gottareload01.wav"),
}
local reload_female = {
	Sound("vo/npc/female01/youdbetterreload01.wav"),
	Sound("vo/npc/Alyx/youreload01.wav"),
	Sound("vo/npc/Alyx/youreload02.wav"),
}

function SWEP:Reload()
	CT = CurTime()
--[[
	if	SERVER
		and
		(self:Clip1() + self.Owner:GetAmmoCount(self.Primary.Ammo)) < self:GetMaxClip1()
		and
		fn.Head(fn.Filter(function(x) return x.ammoType == self.Primary.Ammo end, GAMEMODE.AmmoTypes))
	then
		DarkRP.chatCommands.buyammo.callback(self.Owner, self.Primary.Ammo)
	end
--]]	
	if self.ReloadDelay or CT < self.ReloadWait or self.dt.State == SWB_ACTION or self.ShotgunReloadState != 0 then
		return
	end
	
	if self.Owner:KeyDown(IN_USE) and self.dt.State != SWB_RUNNING then
		self:CycleFiremodes()
		return
	end
	
	mag = self:Clip1()
	
	if (self.Chamberable and mag >= self.Primary.ClipSize + 1) or (not self.Chamberable and mag >= self.Primary.ClipSize) or self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
		return
	end
	
	if self.dt.State != SWB_RUNNING then
		self.dt.State = SWB_IDLE
	end
	
	if self.ShotgunReload then
		self.ShotgunReloadState = 1
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
		self.ReloadDelay = CT + self.ReloadStartWait
	else
		if self.Chamberable then
			if mag == 0 then
				self.Primary.ClipSize = self.Primary.ClipSize_Orig
			else
				self.Primary.ClipSize = self.Primary.ClipSize_Orig + 1
			end
		end
		
		if self.dt.Suppressed then
			self:DefaultReload(ACT_VM_RELOAD_SILENCED)
		else
			self:DefaultReload(ACT_VM_RELOAD)
		end
		
	end
	if SERVER then
		if self:Clip1() < self.Primary.ClipSize then
			if self.Owner:IsPlayer() then
				self.Owner:SetAnimation(PLAYER_RELOAD)
			else 
				self.Owner:SetAnimation(PLAYER_RELOAD)
			end
		end
	end
	--[[self:SendWeaponAnim(ACT_VM_RELOAD)
	
	vm = self.Owner:GetViewModel() 
	vm:SetPlaybackRate(self.ReloadSpeed)
	dur = vm:SequenceDuration() / self.ReloadSpeed
	
	self.ReloadDelay = CT + dur]]--
	--self:SetNextPrimaryFire(CT + dur)
	--self:SetNextSecondaryFire(CT + dur)
end

function SWEP:CycleFiremodes()
	t = self.FireModes
	
	if not t.last then
		t.last = 2
	else
		if not t[t.last + 1] then
			t.last = 1
		else
			t.last = t.last + 1
		end
	end
	
	if self.dt.State == SWB_AIMING then
		if self.FireModes[t.last] == "safe" then
			t.last = 1
		end
	end
	
	if self.FireMode != self.FireModes[t.last] and self.FireModes[t.last] then
		CT = CurTime()
		self:SelectFiremode(self.FireModes[t.last])
		self:SetNextPrimaryFire(CT + 0.25)
		self:SetNextSecondaryFire(CT + 0.25)
		self.ReloadWait = CT + 0.25
	end
end
if SERVER then 
	util.AddNetworkString("SWB_FIREMODE")
end
function SWEP:SelectFiremode(n)
	if CLIENT then
		return
	end
		t = self.FireModeNames[n]
		self.Primary.Automatic = t.auto
		self.FireMode = n
		self.BurstAmount = t.burstamt
		
		if self.FireMode == "safe" then
			self.dt.Safe = true -- more reliable than umsgs
		else
			self.dt.Safe = false
		end
	if SERVER then
		net.Start("SWB_FIREMODE")
			net.WriteEntity(self.Owner)
			net.WriteString(n)
		net.Broadcast()
	end
end

local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local GetAimVector = reg.Player.GetAimVector

function SWEP:CalculateSpread(vel)
	aim = GetAimVector(self.Owner)
	CT = CurTime()
	
	if not self.Owner.LastView then
		self.Owner.LastView = aim
		self.Owner.ViewAff = 0
	else
		self.Owner.ViewAff = Lerp(0.25, self.Owner.ViewAff, (aim - self.Owner.LastView):Length() * 0.5)
		self.Owner.LastView = aim
	end
	
	if self.dt.State == SWB_AIMING then
		self.BaseCone = self.AimSpread
		
		if self.Owner.Expertise then
			self.BaseCone = self.BaseCone * (1 - self.Owner.Expertise["steadyaim"].val * 0.0015)
		end
	else
		self.BaseCone = self.HipSpread
		
		if self.Owner.Expertise then
			self.BaseCone = self.BaseCone * (1 - self.Owner.Expertise["wepprof"].val * 0.0015)
		end
	end
	
	if self.Owner:Crouching() then
		self.BaseCone = self.BaseCone * (self.dt.State == SWB_AIMING and 0.9 or 0.75)
	end
	
	self.CurCone = math.Clamp(self.BaseCone + self.AddSpread + (vel / 10000 * self.VelocitySensitivity) * (self.dt.State == SWB_AIMING and self.AimMobilitySpreadMod or 1) + self.Owner.ViewAff, 0, 0.09 + self.MaxSpreadInc)
	
	if CT > self.SpreadWait then
		self.AddSpread = math.Clamp(self.AddSpread - 0.005 * self.AddSpreadSpeed, 0, self.MaxSpreadInc)
		self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed + 0.05, 0, 1)
	end
end

local SP = game.SinglePlayer()

local mag, ammo

function SWEP:IndividualThink()
	if (SP and SERVER) or not SP then
		if self.dt.State == SWB_AIMING then
			if not self.Owner:OnGround() or Length(GetVelocity(self.Owner)) >= self.Owner:GetWalkSpeed() * 1.35 or not self.Owner:KeyDown(IN_ATTACK2)  then
				CT = CurTime()
				self.dt.State = SWB_IDLE
				self:SetNextSecondaryFire(CT + 0.2)
			end
		end
	end
end

local IFTP
local wl, ws

function SWEP:Think()
	if self.IndividualThink then
		self:IndividualThink()
	end

	if (not IsValid(self.Owner)) then return end
	
	vel = Length(GetVelocity(self.Owner))
	IFTP = IsFirstTimePredicted()
	
	if (not SP and IFTP) or SP then
		self:CalculateSpread(vel)
	end
	
	CT = CurTime()
	wl = self.Owner:WaterLevel()

	if self.Owner:OnGround() then
		if wl >= 3 and self.HolsterUnderwater then
			if self.ShotgunReloadState == 1 then
				self.ShotgunReloadState = 2
			end
			
			self.dt.State = SWB_ACTION
			self.FromActionToNormalWait = CT + 0.3
		else
			ws = self.Owner:GetWalkSpeed()
			
			if ((vel > ws * 1.2 and self.Owner:KeyDown(IN_SPEED)) or vel > ws * 3 or (self.ForceRunStateVelocity and vel > self.ForceRunStateVelocity)) and self.SprintingEnabled and !self.Owner:GetNW2Bool("donate_upgrade_runngun",false) then
				self.dt.State = SWB_RUNNING
			else
				if self.dt.State != SWB_AIMING then
					if CT > self.FromActionToNormalWait then
						if self.dt.State != SWB_IDLE then
							self.dt.State = SWB_IDLE
							self:SetNextPrimaryFire(CT + 0.7)
							self:SetNextSecondaryFire(CT + 0.3)
							self.ReloadWait = CT + 0.3
						end
					end
				end
			end
		end
	else
		if (wl > 1 and self.HolsterUnderwater) or (self.Owner:GetMoveType() == MOVETYPE_LADDER and self.HolsterOnLadder) then
			if self.ShotgunReloadState == 1 then
				self.ShotgunReloadState = 2
			end
			
			self.dt.State = SWB_ACTION
			self.FromActionToNormalWait = CT + 0.3
		else
			if CT > self.FromActionToNormalWait then
				if self.dt.State != SWB_IDLE then
					self.dt.State = SWB_IDLE
					self:SetNextPrimaryFire(CT + 0.3)
					self:SetNextSecondaryFire(CT + 0.3)
					self.ReloadWait = CT + 0.3
				end
			end
		end
	end
	
	if self.dt.Shots > 0 then
		if not self.Owner:KeyDown(IN_ATTACK) then
			if self.BurstAmount and self.BurstAmount > 0 then
				self.dt.Shots = 0
				self:SetNextPrimaryFire(CT + self.FireDelay * self.BurstCooldownMul)
				self.ReloadWait = CT + self.FireDelay * self.BurstCooldownMul
			end
		end
	end
	
	if IFTP then
		if self.ShotgunReloadState == 1 then
			if self.Owner:KeyPressed(IN_ATTACK) then
				self.ShotgunReloadState = 2
			end
			
			if CT > self.ReloadDelay then
				self:SendWeaponAnim(ACT_VM_RELOAD)
				
				if SERVER then
					self.Owner:SetAnimation(PLAYER_RELOAD)
				end
				
				mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)
				
				if SERVER then
					self:SetClip1(mag + 1)
					self.Owner:SetAmmo(ammo - 1, self.Primary.Ammo)
				end
				
				self.ReloadDelay = CT + self.ReloadShellInsertWait
				
				if mag + 1 == self.Primary.ClipSize or ammo - 1 == 0 then
					self.ShotgunReloadState = 2
				end
			end
		elseif self.ShotgunReloadState == 2 then
			if CT > self.ReloadDelay then
				self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
				self.ShotgunReloadState = 0
				self:SetNextPrimaryFire(CT + self.ReloadFinishWait)
				self:SetNextSecondaryFire(CT + self.ReloadFinishWait)
				self.ReloadWait = CT + self.ReloadFinishWait
				self.ReloadDelay = nil
			end
		end
	end
	
	if SERVER then
		if self.dt.Safe then
			if self.CHoldType != self.RunHoldType then
				self:SetHoldType(self.RunHoldType)
				self.CHoldType = self.RunHoldType
			end
		else
			if self.dt.State == SWB_RUNNING or self.dt.State == SWB_ACTION then
				if self.CHoldType != self.RunHoldType then
					self:SetHoldType(self.RunHoldType)
					self.CHoldType = self.RunHoldType
				end
			else
				if self.CHoldType != self.NormalHoldType then
					self:SetHoldType(self.NormalHoldType)
					self.CHoldType = self.NormalHoldType
				end
			end
		end
	end
	
	--[[if self.ReloadDelay and CT >= self.ReloadDelay then
		mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)
		
		if self.ReloadAmount then
			if SERVER then
				self:SetClip1(math.Clamp(mag + self.ReloadAmount, 0, self.Primary.ClipSize))
				self.Owner:RemoveAmmo(self.ReloadAmount, self.Primary.Ammo)
			end
		else
			if mag > 0 then
				if ammo >= self.Primary.ClipSize - mag then
					if SERVER then
						self:SetClip1(math.Clamp(self.Primary.ClipSize, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(self.Primary.ClipSize - mag, self.Primary.Ammo)
					end
				else
					if SERVER then
						self:SetClip1(math.Clamp(mag + ammo, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
					end
				end
			else
				if ammo >= self.Primary.ClipSize then
					if SERVER then
						self:SetClip1(math.Clamp(self.Primary.ClipSize, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(self.Primary.ClipSize, self.Primary.Ammo)
					end
				else
					if SERVER then
						self:SetClip1(math.Clamp(ammo, 0, self.Primary.ClipSize))
						self.Owner:RemoveAmmo(ammo, self.Primary.Ammo)
					end
				end
			end
		end
		
		self.ReloadDelay = nil
	end]]--
end

local mul

function SWEP:PrimaryAttack()
	if self.ShotgunReloadState != 0 then
		return
	end
	
	if self.ReloadDelay then
		return
	end
	
	if self.dt.Safe then
		self:CycleFiremodes()
		return
	end
	
	mag = self:Clip1()
	
	if mag == 0 then
		self:EmitSound("SWB_Empty", 100, 100)
		self:SetNextPrimaryFire(CT + 0.25)
		return
	end
	
	if self.dt.State == SWB_RUNNING or self.dt.State == SWB_ACTION then
		return
	end
	
	if self.BurstAmount and self.BurstAmount > 0 then
		if self.dt.Shots >= self.BurstAmount then
			return
		end
		
		self.dt.Shots = self.dt.Shots + 1
	end
	
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	CT = CurTime()
	
	if self.dt.Suppressed then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
	else
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	end
	
	if self.FireAnimFunc then
		self:FireAnimFunc()
	else
		if self.dt.State == SWB_AIMING then
			if mag - self.AmmoPerShot <= 0 and self.DryFire then
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_DRYFIRE_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_DRYFIRE)
				end
			else
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
				end
			end
			
			if self.FadeCrosshairOnAim then
				if SP then
					if SERVER then
						self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRate or 1)
					end
				else
					if SERVER then
						self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRateSV or 1)
					else
						self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRate or 1)
					end
				end
			end
		else
			if mag - self.AmmoPerShot <= 0 and self.DryFire then
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_DRYFIRE_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_DRYFIRE)
				end
			else
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
				end
			end
			
			if self.FadeCrosshairOnAim then
				self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRateHip or 1)
			end
		end
	end
	
	if IsFirstTimePredicted() then
		if self.dt.Suppressed then
			self:EmitSound(self.FireSoundSuppressed, 105, 100)
		else
			self:EmitSound(self.FireSound, 105, 100)
		end
		
		self:FireBullet(self.Damage * (self.dt.Suppressed and 0.9 or 1), self.CurCone, self.Shots)
		self:MakeRecoil()
		
		self.SpreadWait = CT + self.SpreadCooldown
		mul = 1
	
		if self.Owner:Crouching() then
			mul = mul * 0.75
		end
		
		if self.Owner.Expertise then
			mul = mul * (1 - self.Owner.Expertise["wepprof"].val * 0.002)
			
			if SERVER then
				if self.dt.State == SWB_AIMING then
					self.Owner:ProgressStat("steadyaim", self.Recoil * 1.5)
					self.Owner:ProgressStat("wepprof", self.Recoil * 0.5)
				else
					self.Owner:ProgressStat("wepprof", self.Recoil * 1.5)
				end
				
				self.Owner:ProgressStat("rechandle", self.Recoil)
			end
		end
		
		if self.BurstAmount > 0 then
			self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * self.BurstSpreadIncMul * mul, 0, self.MaxSpreadInc)
		else
			self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * mul, 0, self.MaxSpreadInc)
		end
		
		self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed - 0.2, 0, 1)
		
		if CLIENT then
			if self.dt.State == SWB_AIMING then
				self.FireMove = 1
			else
				self.FireMove = 0.4
			end
		end
		
		if SP and SERVER then
			//SendUserMessage("SWB_Recoil", self.Owner)
		end
	end
	
	self:TakePrimaryAmmo(self.AmmoPerShot)
	self:SetNextPrimaryFire(CT + self.FireDelay)
	self:SetNextSecondaryFire(CT + self.FireDelay)
	self.ReloadWait = CT + (self.WaitForReloadAfterFiring and self.WaitForReloadAfterFiring or self.FireDelay)
end

local ang

function SWEP:MakeRecoil(mod)
	mod = mod and mod or 1
	
	if self.Owner:Crouching() then
		mod = mod * 0.75
	end
	
	if self.dt.State == SWB_AIMING then
		mod = mod * 0.85
	end
	
	if self.dt.Suppressed then
		mod = mod * 0.85
	end
	
	if self.BurstAmount > 0 then
		mod = mod * self.BurstRecoilMul
	end
	
	if self.Owner.Expertise then
		mod = mod * (1 - self.Owner.Expertise["rechandle"].val * 0.0015)
	end
	
	if (SP and SERVER) or (not SP and CLIENT) then
		ang = self.Owner:EyeAngles()
		ang.p = ang.p - self.Recoil * 0.5 * mod
		ang.y = ang.y + math.random(-1, 1) * self.Recoil * 0.5 * mod
	
		self.Owner:SetEyeAngles(ang)
	end
	
	self.Owner:ViewPunch(Angle(-self.Recoil * 1.25 * mod, 0, 0))
end

function SWEP:SecondaryAttack()
	if self.ShotgunReloadState != 0 then
		return
	end
	
	if self.ReloadDelay then
		return
	end
	
	if self.dt.Safe then
		self:CycleFiremodes()
		return
	end
	
	if self.dt.State == SWB_RUNNING or self.dt.State == SWB_ACTION or self.dt.State == SWB_AIMING then
		return
	end
	
	if self.Suppressable and self.Owner:KeyDown(IN_USE) then
		self:ToggleSuppressor()
		return
	end
	
	if not self.Owner:OnGround() or Length(GetVelocity(self.Owner)) >= self.Owner:GetWalkSpeed() * 1.2 then
		return
	end
	
	CT = CurTime()
	
	self.dt.State = SWB_AIMING 
	
	if IsFirstTimePredicted() then
		self.AimTime = UnPredictedCurTime() + 0.25
		
		if self.PreventQuickScoping then
			self.AddSpread = math.Clamp(self.AddSpread + 0.03, 0, self.MaxSpreadInc)
			self.SpreadWait = CT + 0.3
		end
	end
	
	if SP and SERVER then
		//SendUserMessage("SWB_AimTime", self.Owner)
	end
	
	self:SetNextSecondaryFire(CT + 0.1)
end

function SWEP:ToggleSuppressor()
	if self.dt.Suppressed then
		self:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
	else
		self:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)
	end
	
	vm = self.Owner:GetViewModel()
	dur = vm:SequenceDuration()
	CT = CurTime()
	
	self:SetNextPrimaryFire(CT + dur)
	self:SetNextSecondaryFire(CT + dur)
	self.ReloadWait = CT + dur
	self.dt.Suppressed = ! self.dt.Suppressed
end

function SWEP:Equip()
end

if CLIENT then
	local EP, EA2, FT
	
	function SWEP:ViewModelDrawn()
		EP, EA2, FT = EyePos(), EyeAngles(), FrameTime()
		
		if IsValid(self.Hands) then
			self.Hands:SetRenderOrigin(EP)
			self.Hands:SetRenderAngles(EA2)
			self.Hands:FrameAdvance(FT)
			self.Hands:SetupBones()
			self.Hands:SetParent(self.Owner:GetViewModel())
			self.Hands:DrawModel()
		end
	end
	
	local wm, pos, ang
	local GetBonePosition = debug.getregistry().Entity.GetBonePosition
	
	local ply, wep

	local function SWB_ReceiveFireMode(len, ply)
		ply = net.ReadEntity()
		Mode = net.ReadString()
		
		if IsValid(ply) then
			wep = ply:GetActiveWeapon()
			wep.FireMode = Mode
			
			if IsValid(ply) and IsValid(wep) and wep.SWBWeapon then
				if wep.FireModeNames then
					t = wep.FireModeNames[Mode]
					
					wep.Primary.Automatic = t.auto
					wep.BurstAmount = t.burstamt
					wep.FireModeDisplay = t.display
					wep.BulletDisplay = t.buldis
					wep.CheckTime = CurTime() + 2
					
					if ply == LocalPlayer() then
						ply:EmitSound("weapons/smg1/switch_single.wav", 70, math.random(92, 112))
					end
				end
			end
		end
	end

	net.Receive("SWB_FIREMODE", SWB_ReceiveFireMode)
end

hook.Add( "EntityEmitSound", "SoundGlushitel", function(t)
	local ent = t.Entity		
	if t.SoundName:find("weapons") then
		-- print('DEFAULT - Name: '..t.SoundName..' Volume '..t.Volume)		
		local gluh = ent:GetNW2Int("glushitel", 0)
		local volume = t.Volume
		local defaultvolume = 0.15
		if volume < defaultvolume then volume = t.Volume else volume = defaultvolume end
		
		if gluh >= 1 then
			t.Volume = 0
		else 
			t.Volume = volume
		end

		if ent:GetNW2Bool("glushitel_off", false) == true then
			t.Volume = volume
		end
		-- print('NEW - Name: '..t.SoundName..' Volume '..t.Volume)
		return true
	end
	
	if t.SoundName:find("aheli_weapon_fire_loop3") then
		t.Volume = 0.01
		return true
	end

	if t.SoundName:find("ambient/fire") then
		t.Volume = 0.5
		return true
	end
	
	return
	
end )
--PATH addons/weaponandcontent/lua/weapons/swb_base/cl_playerbindpress.lua:
local wep, CT

function SWEP.PlayerBindPress(ply, b, p)
	if p then
		wep = ply:GetActiveWeapon()
		
		if IsValid(wep) and wep.SWBWeapon then
			if wep.dt and wep.dt.State == SWB_AIMING then
				if wep.AdjustableZoom then
					CT = CurTime()
					
					if b == "invprev" then
						CT = CurTime()
						
						if CT > wep.ZoomWait then
							if wep.ZoomAmount > wep.MinZoom then
								wep.ZoomAmount = math.Clamp(wep.ZoomAmount - 15, wep.MinZoom, wep.MaxZoom)
								surface.PlaySound("weapons/zoom.wav")
								wep.ZoomWait = CT + 0.15

							end
						end
						
						return true
					elseif b == "invnext" then
						CT = CurTime()
						
						if CT > wep.ZoomWait then
							if wep.ZoomAmount < wep.MaxZoom then
								wep.ZoomAmount = math.Clamp(wep.ZoomAmount + 15, wep.MinZoom, wep.MaxZoom)
								surface.PlaySound("weapons/zoom.wav")
								wep.ZoomWait = CT + 0.15
							end
						end
						
						return true
					end
				end
			end
		end
	end
end

hook.Add("PlayerBindPress", "SWEP.PlayerBindPress (SWB)", SWEP.PlayerBindPress)
--PATH gamemodes/darkrp/entities/weapons/unarrest_stick/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Снять арест"
    SWEP.Slot = 1
    SWEP.SlotPos = 3
end

DEFINE_BASECLASS("stick_base")

SWEP.Instructions = "Left click to unarrest\nRight click to switch batons"
SWEP.IsDarkRPUnarrestStick = true

SWEP.Spawnable = true
SWEP.Category = "DarkRP (Utility)"

SWEP.StickColor = Color(0, 255, 0)

DarkRP.hookStub{
    name = "canUnarrest",
    description = "Whether someone can unarrest another player.",
    parameters = {
        {
            name = "unarrester",
            description = "The player trying to unarrest someone.",
            type = "Player"
        },
        {
            name = "unarrestee",
            description = "The player being unarrested.",
            type = "Player"
        }
    },
    returns = {
        {
            name = "canUnarrest",
            description = "A yes or no as to whether the player can unarrest the other player.",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when they can't unarrest the player.",
            type = "string"
        }
    },
    realm = "Server"
}

-- Default for canUnarrest hook
local hookCanUnarrest = {canUnarrest = fp{fn.Id, true}}

function SWEP:Deploy()
    self.Switched = true
    return BaseClass.Deploy(self)
end

function SWEP:PrimaryAttack()
    BaseClass.PrimaryAttack(self)

    if CLIENT then return end

    self:GetOwner():LagCompensation(true)
    local trace = util.QuickTrace(self:GetOwner():EyePos(), self:GetOwner():GetAimVector() * 90, {self:GetOwner()})
    self:GetOwner():LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent.onUnArrestStickUsed then
        ent:onUnArrestStickUsed(self:GetOwner())
        return
    end

    ent = self:GetOwner():getEyeSightHitEntity(nil, nil, function(p) return p ~= self:GetOwner() and p:IsPlayer() and p:Alive() and p:IsSolid() end)
    if not ent then return end

    local stickRange = self.stickRange * self.stickRange
    if not IsValid(ent) or not ent:IsPlayer() or (self:GetOwner():EyePos():DistToSqr(ent:GetPos()) > stickRange) or not ent:getDarkRPVar("Arrested") then
        return
    end

    local canUnarrest, message = hook.Call("canUnarrest", hookCanUnarrest, self:GetOwner(), ent)
    if not canUnarrest then
        if message then DarkRP.notify(self:GetOwner(), 1, 5, message) end
        return
    end

    ent:unArrest(self:GetOwner())
    DarkRP.notify(ent, 0, 4, DarkRP.getPhrase("youre_unarrested_by", self:GetOwner():Nick()))
end

function SWEP:SecondaryAttack()
	if not IsValid(self.Owner) then return end

	if SERVER and self.Owner:HasWeapon('arrest_stick') then
		self.Owner:SelectWeapon('arrest_stick')
	end

	self:SetNextSecondaryFire(CurTime() + 0.5)
end

--PATH addons/cigarette_swep/lua/weapons/weapon_ciga_pachka_blat.lua:
-- MODEL WITH UNKNOWN AUTHOR! PM ME!!! QUICK :D -- 
SWEP.PrintName = "Pack Capitain Black"
SWEP.Author = "Mordestein"
SWEP.Purpose = "Pick one out."

SWEP.Category = "Cigarette"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 49.849246231156
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/mordeciga/mordes/pachkablat.mdl"
SWEP.UseHands = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
	
SWEP.ViewModelBoneMods = {
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/mordeciga/mordes/pachkablat.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0, -2.597), angle = Angle(-15.195, 180, 180), size = Vector(1.34, 1.34, 1.34), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/mordeciga/mordes/pachkablat.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 3.635, -0.519), angle = Angle(-26.883, 178.83, 180), size = Vector(1.728, 1.728, 1.728), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)

local ShootSound = Sound("physics/cardboard/cardboard_box_impact_soft7.wav")

function SWEP:PrimaryAttack()
if ( !SERVER ) then return end
self:SetNextPrimaryFire( CurTime() + 1.50 )
self:EmitSound( ShootSound )
timer.Simple( 0.3, function() 
self:EmitSound("weapons/smg1/switch_single.wav")
 end )
self.Owner:Give( "weapon_ciga_blat" )
 timer.Simple( 0.4, function() 
  
self.Owner:StripWeapon("weapon_ciga_pachka_blat")

end )
 end
 
function SWEP:Deploy()
self:SetNextPrimaryFire( CurTime() + 1 )
self:SetNextSecondaryFire( CurTime() + 1 ) 
self:SendWeaponAnim(ACT_VM_DRAW)
return true
end	


-- 

function SWEP:SecondaryAttack()
  return false 
end 

function SWEP:Reload()
return false   
end 
/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here

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

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

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





--PATH addons/cuffs/lua/weapons/weapon_cuff_rope.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- weapon_cuff_standard.lua SHARED --
--                                 --
-- Rope handcuffs.                 --
-------------------------------------

AddCSLuaFile()

SWEP.Base = "weapon_cuff_base"

SWEP.Category = "GambitRP"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = "A weak restraint."

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3
SWEP.PrintName = "Верёвка"

//
// Handcuff Vars
SWEP.CuffTime = 0.3 // Seconds to handcuff
SWEP.CuffSound = Sound( "buttons/lever7.wav" )

SWEP.CuffMaterial = "models/props_foliage/tree_deciduous_01a_trunk"
SWEP.CuffStrength = 1.5
SWEP.CuffRegen = 1
SWEP.RopeLength = 1
SWEP.CuffReusable = true

SWEP.CuffBlindfold = true
SWEP.CuffGag = true

SWEP.CuffStrengthVariance = 0.1 // Randomise strength
SWEP.CuffRegenVariance = 0.2 // Randomise regen
--PATH addons/111mod/lua/weapons/weapon_flechettegun/sh_anim.lua:

local ActIndex = {
	[ "pistol" ]		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ]			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ]		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ]			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ]		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]			= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ]		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ]		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ]			= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ]			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]			= ACT_HL2MP_IDLE_DUEL,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA,
	[ "magic" ]			= ACT_HL2MP_IDLE_MAGIC,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER
}

--[[---------------------------------------------------------
	Name: SetWeaponHoldType
	Desc: Sets up the translation table, to translate from normal
			standing idle pose, to holding weapon pose.
-----------------------------------------------------------]]
function SWEP:SetWeaponHoldType( t )

	t = string.lower( t )
	local index = ActIndex[ t ]

	if ( index == nil ) then
		Msg( "SWEP:SetWeaponHoldType - ActIndex[ \"" .. t .. "\" ] isn't set! (defaulting to normal)\n" )
		t = "normal"
		index = ActIndex[ t ]
	end

	self.ActivityTranslate = {}
	self.ActivityTranslate[ ACT_MP_STAND_IDLE ]					= index
	self.ActivityTranslate[ ACT_MP_WALK ]						= index + 1
	self.ActivityTranslate[ ACT_MP_RUN ]						= index + 2
	self.ActivityTranslate[ ACT_MP_CROUCH_IDLE ]				= index + 3
	self.ActivityTranslate[ ACT_MP_CROUCHWALK ]					= index + 4
	self.ActivityTranslate[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= index + 5
	self.ActivityTranslate[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= index + 5
	self.ActivityTranslate[ ACT_MP_RELOAD_STAND ]				= index + 6
	self.ActivityTranslate[ ACT_MP_RELOAD_CROUCH ]				= index + 6
	self.ActivityTranslate[ ACT_MP_JUMP ]						= index + 7
	self.ActivityTranslate[ ACT_RANGE_ATTACK1 ]					= index + 8
	self.ActivityTranslate[ ACT_MP_SWIM ]						= index + 9

	-- "normal" jump animation doesn't exist
	if ( t == "normal" ) then
		self.ActivityTranslate[ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end

	self:SetupWeaponHoldTypeForAI( t )

end

-- Default hold pos is the pistol
SWEP:SetWeaponHoldType( "pistol" )

--[[---------------------------------------------------------
	Name: weapon:TranslateActivity()
	Desc: Translate a player's Activity into a weapon's activity
		 	So for example, ACT_HL2MP_RUN becomes ACT_HL2MP_RUN_PISTOL
			Depending on how you want the player to be holding the weapon
-----------------------------------------------------------]]
function SWEP:TranslateActivity( act )

	if ( self:GetOwner():IsNPC() ) then
		if ( self.ActivityTranslateAI[ act ] ) then
			return self.ActivityTranslateAI[ act ]
		end
		return -1
	end

	if ( self.ActivityTranslate[ act ] != nil ) then
		return self.ActivityTranslate[ act ]
	end

	return -1

end

--PATH addons/skin_nier/lua/weapons/weapon_mad_2b/shared.lua:
if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo			= false
	SWEP.AutoSwitchFrom		= false

end

sound.Add({
	['name'] = "TFA_L4D2_OREN.Equip",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/l4d2_oren_katana/knife_deploy.wav" },
	['pitch'] = {95,105}
})

sound.Add({
	['name'] = "TFA_L4D2_OREN.Holster",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/l4d2_oren_katana/katana_holster.wav" },
	['pitch'] = {95,105}
})

sound.Add({
	['name'] = "TFA_L4D2_OREN.Swing",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/l4d2_oren_katana/katana_swing_miss1.wav", "weapons/l4d2_oren_katana/katana_swing_miss2.wav", "weapons/l4d2_oren_katana/katana_swing_miss3.wav", "weapons/l4d2_oren_katana/katana_swing_miss4.wav"},
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "TFA_L4D2_OREN.HitFlesh",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/l4d2_oren_katana/melee_katana_01.wav", "weapons/l4d2_oren_katana/melee_katana_04.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "TFA_L4D2_OREN.HitFleshHard",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/l4d2_oren_katana/melee_katana_02.wav", "weapons/l4d2_oren_katana/melee_katana_03.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "TFA_L4D2_OREN.HitWorld",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/l4d2_oren_katana/katana_impact_world1.wav", "weapons/l4d2_oren_katana/katana_impact_world2.wav" },
	['pitch'] = {95,105}
})

SWEP.HoldType = "melee2"

if ( CLIENT ) then
	SWEP.PrintName			= "Катана"
	SWEP.Author				= "Xaxidoro"
	SWEP.DrawAmmo 			= false
	SWEP.DrawCrosshair 		= false
	SWEP.ViewModelFOV			= 80
	SWEP.ViewModelFlip		= false
	SWEP.CSMuzzleFlashes		= false
	
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1

	killicon.Add("weapon_mad_2b", "HUD/killicons/default", Color( 255, 80, 0, 255 ) )
end


SWEP.Base 						= "weapon_mad_base"

SWEP.Category					= "Nier"

SWEP.UseHands 					= true

SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true

SWEP.ViewModel 					= "models/weapons/c_2b_sword.mdl"
SWEP.WorldModel 				= "models/weapons/w_2b_sword.mdl"

SWEP.Weight						= 5
SWEP.AutoSwitchTo				= false
SWEP.AutoSwitchFrom				= false
SWEP.HoldType = "melee2"

SWEP.Primary.Delay 				= 1.0
SWEP.Primary.Cone				= 0.1
SWEP.Primary.ClipSize			= -1
SWEP.Primary.Damage				= 34
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo				= "none"
SWEP.Primary.Combo				= 0

SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Damage			= 0	
SWEP.Secondary.Automatic		= true
SWEP.Secondary.Ammo				= "none"
SWEP.Secondary.Combo			= 0

SWEP.Pistol						= true
SWEP.Rifle						= false
SWEP.Shotgun					= false
SWEP.Sniper						= false

SWEP.RunArmOffset 				= Vector(0,2,-2)
SWEP.RunArmAngle 				= Vector(-10,0,5)

SWEP.HoldingPos 				= Vector(0,0,-1)
SWEP.HoldingAng 				= Vector(0,-90,0)

SWEP.MeleeRange					= 110
SWEP.SwingTimeAlt				= 0.45
SWEP.SwingTime 					= 0.2

SWEP.Idling 					= 0
SWEP.Parrying 					= false
SWEP.ParryTime 					= CurTime()
SWEP.SlashTime 					= CurTime()
SWEP.ShootTime					= CurTime()
SWEP.AirDashTime				= CurTime()
SWEP.SprintTime					= CurTime()
SWEP.ComboReset					= CurTime()

SWEP.DroneActive 				= false
SWEP.Drone 						= nil

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
	Pos = {
		Up = 1,
		Right = -1,
		Forward = 2
	},
	Ang = {
		Up = 0,
		Right = 0,
		Forward = 0
	},
	Scale = 0.8
}

function SWEP:IdleAnimationDelay( seconds, index )
	timer.Remove( "IdleAnimation" )
	self.Idling = index
	timer.Create( "IdleAnimation", seconds, 1, function()
		if not self:IsValid() or self.Idling == 0 then return end
		if self.Idling == index then
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		end
	end )
end

/*---------------------------------------------------------
   Name: SWEP:Reload()
   Desc: Parry
---------------------------------------------------------*/
function SWEP:Reload()

	if self.Owner:KeyDown(IN_USE) and self.SlashTime < CurTime() then
		if self.Weapon:GetNetworkedBool("Holsted") or self.Weapon:GetDTBool(0) then return end
		
		self.SlashTime = CurTime() + 3
		self.ParryTime = CurTime() + 5
		self.Parrying = true
		
		self.Weapon:SendWeaponAnim(ACT_VM_RECOIL3)
		self.Weapon:EmitSound("TFA_L4D2_OREN.Holster", 50, 100)
		
		self.Weapon:SetNextPrimaryFire(CurTime() + 2.7)
		self.Weapon:SetNextSecondaryFire(CurTime() + 2.7)
		
		if SERVER then
			timer.Simple( 2.5, function() 
				if not self:IsValid() or self.Idling == 0 then return end
				self.Parrying = false 
				self.Owner:SetAnimation(PLAYER_ATTACK1)
				self.Weapon:SendWeaponAnim(ACT_VM_HITLEFT)
				self.Owner:GetViewModel():SetPlaybackRate(3)
				self.Weapon:EmitSound("TFA_L4D2_OREN.HitFlesh")
				self:Bomb()
			end )
		end
		
		self:IdleAnimationDelay( 3, 3 )
		return
	end
	
end

function SWEP:OnRemove() 
	self:Holster()
	return true
end
function SWEP:OnDrop()
	self:Holster()
	return true
end
function SWEP:Holster()
	self.Idling = 0
	self.Parrying = false
	self.ParryTime = CurTime()
	self.SprintTime = CurTime()
	timer.Remove( "IdleAnimation" )
	
	if self.Drone then
		if self.Drone:IsValid() then
			self.Drone:Remove()
			self.Drone = nil
			self.DroneActive = false
		end
	end
	if self.Owner:IsValid() then
		self.Owner:SetRunSpeed( 300 )
	end
	
	return true
end

/*---------------------------------------------------------
   Name: SWEP:Deploy()
---------------------------------------------------------*/
function SWEP:Deploy()
	
	self.Parrying = false
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)

	self:IdleAnimationDelay( 0.9, -1 )
	
	-- if SERVER and not self.DroneActive then
		-- self.Drone = ents.Create("ent_pod")
		-- self.Drone:SetOwner( self.Owner )
		-- self.Drone:SetAngles(self.Owner:EyeAngles())
		-- local pos = self.Owner:GetShootPos()
			-- pos = pos + self.Owner:GetForward() * -10
			-- pos = pos + self.Owner:GetRight() * -25
			-- pos = pos + self.Owner:GetUp() * 25
		-- self.Drone:SetPos(pos)
		-- self.Drone:SetPhysicsAttacker(self.Owner)
		-- self.Drone:Spawn()
		-- self.Drone:Activate()
		-- self.DroneActive = true
	-- end

	return true
	
end

/*---------------------------------------------------------
   Name: SWEP:Think()
   Desc: Called every frame.
---------------------------------------------------------*/
function SWEP:Think()

	if self.ComboReset < CurTime() then
		self.Primary.Combo = 0
		self.Secondary.Combo = 0
	end

	if self.Owner:KeyPressed( IN_SPEED ) then
		self.SprintTime = CurTime()
		self.Owner:EmitSound( "weapons/physcannon/energy_sing_flyby2.wav" )
	end
	if self.Owner:KeyDown( IN_SPEED ) then
		if CurTime() - self.SprintTime > 3 then
			self.Owner:SetRunSpeed( 350 )
		elseif CurTime() - self.SprintTime < 0.6 then
			self.Owner:SetRunSpeed( 385 )
			self.ParryTime = CurTime() + 1
			self.Parrying = true
		else
			self.Owner:SetRunSpeed( 345 )
		end
	else
		self.Owner:SetRunSpeed( 370 )
		self.SprintTime = CurTime()
	end
	
	if not self.Owner:IsOnGround() then
		if self.Owner:KeyPressed( IN_JUMP ) and self.AirDashTime < CurTime() and IsFirstTimePredicted() then
			self.AirDashTime = CurTime() + 0.5
			self.Owner:EmitSound( "weapons/physcannon/energy_sing_flyby2.wav" )
			if self.Owner:KeyDown( IN_FORWARD ) then
				self.Owner:SetVelocity( self.Owner:GetAimVector() * 40 + self.Owner:GetUp() * 30 )
			elseif self.Owner:KeyDown( IN_BACK ) then
				self.Owner:SetVelocity( self.Owner:GetAimVector() * -40 + self.Owner:GetUp() * 30 )
			elseif self.Owner:KeyDown( IN_MOVELEFT ) then
				self.Owner:SetVelocity( self.Owner:GetRight() * -40 + self.Owner:GetUp() * 25 )
			elseif self.Owner:KeyDown( IN_MOVERIGHT ) then
				self.Owner:SetVelocity( self.Owner:GetRight() * 40 + self.Owner:GetUp() * 25 )
			else
				self.Owner:SetVelocity( self.Owner:GetUp() * 50 )
			end
		end
	elseif IsFirstTimePredicted() then
		self.AirDashTime = CurTime()
	end

	if self.ParryTime < CurTime() + 0.3 then
		self.Parrying = false
	end

	if self.DroneActive == true and not self.Drone:IsValid() and SERVER then
		self.Drone = ents.Create("ent_pod")
		self.Drone:SetOwner( self.Owner )
		self.Drone:SetAngles(self.Owner:EyeAngles())
		local pos = self.Owner:GetShootPos()
			pos = pos + self.Owner:GetForward() * -10
			pos = pos + self.Owner:GetRight() * -25
			pos = pos + self.Owner:GetUp() * 25
		self.Drone:SetPos(pos)
		self.Drone:SetPhysicsAttacker(self.Owner)
		self.Drone:Spawn()
		self.Drone:Activate()
	end
	
	self:NextThink(CurTime())
	
end

/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType) 	-- Hold type of the 3rd person animation
end

function SWEP:Parry( target, dmg )
	if target == self.Owner then
		if self.ParryTime > CurTime() then
			
			local damageForce = dmg:GetDamageForce()
			self.Weapon:EmitSound( "bounce.wav" )
			dmg:ScaleDamage( 0 )
			dmg:SetDamageForce( damageForce )
			
		end
	end
end

function Reflect(target, dmg)

	if !target:IsValid() or !target:IsPlayer() then return end
	
	local Wep = target:GetActiveWeapon()
	if !IsValid( Wep ) then return end
	if !Wep:IsWeapon() then return end
	if !Wep.MadCow then return end
	if Wep:GetClass() != "weapon_mad_2b" then return end
	
	if dmg:GetDamageType() == DMG_FALL then
		dmg:SetDamage( 0 )
		return
	end
	
	-- Wep:Parry( target, dmg )

end
hook.Add( "EntityTakeDamage", "2bReflect", Reflect );

function SWEP:DroneShoot()

	if not self.Drone then return end
	if not self.Drone:IsValid() then return end
	if self.Drone.HurtTime > CurTime() then return end
	
	self.Drone:EmitSound( "weapons/pod042/a.wav", 160, 100, 1, CHAN_WEAPON )
	if SERVER then
		local shot = ents.Create("ent_pod_shot")
		shot:SetAngles(self.Drone:EyeAngles())

		local pos = self.Drone:GetPos()
			pos = pos + self.Drone:GetRight() * -5
		shot:SetPos(pos)

		shot:SetOwner(self.Owner)
		shot:SetPhysicsAttacker(self.Owner)
		shot:Spawn()
		shot:Activate()

		local trace = util.TraceLine( {
			start = self:GetOwner():GetShootPos(),
			endpos = self:GetOwner():GetShootPos() + self.Owner:GetAimVector() * 10000,
			filter = self:GetOwner()
		} )
		trace.mask = MASK_SHOT
		local lookAng = ( trace.HitPos - self.Drone:GetPos() ):Angle()
		
		local phys = shot:GetPhysicsObject()
		if phys:IsValid() then
			phys:SetVelocity( ( trace.HitPos - self.Drone:GetPos() ):GetNormalized() * 3500 + Vector( 2000 * ( math.random() - 0.5 ) * self.Primary.Cone, 2000 * ( math.random() - 0.5 ) * self.Primary.Cone, 2000 * ( math.random() - 0.5 ) * self.Primary.Cone ))
		end
		--phys:AddAngleVelocity(Vector(0, 500, 0))
	end
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack()
   Desc: +attack2 has been pressed.
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
	
	if not IsFirstTimePredicted() then return end

	// Holst/Deploy your fucking weapon
	if (not self.Owner:IsNPC() and self.Owner:KeyDown(IN_USE)) then
		if self.Weapon:GetNetworkedBool("Holsted") or self.Owner:KeyDown(IN_SPEED) and !self.Owner:GetNW2Bool("donate_upgrade_runngun",false) then return end
		if self.ShootTime > CurTime() then return end

		if (SERVER) then
			self:DroneShoot()
			timer.Simple( 0.1, function() self:DroneShoot() end )
			timer.Simple( 0.2, function() self:DroneShoot() end )
			timer.Simple( 0.3, function() self:DroneShoot() end )
			timer.Simple( 0.4, function() self:DroneShoot() end )
		end
		
		self.ShootTime = CurTime() + 0.6
		return
	end

	if self.Weapon:GetNetworkedBool("Holsted") or self.Owner:KeyDown(IN_SPEED) and !self.Owner:GetNW2Bool("donate_upgrade_runngun",false) or self.Weapon:GetDTBool(0) then return end

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay + self.SwingTimeAlt - 0.05)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay + self.SwingTimeAlt - 0.05)
	self.ComboReset = CurTime() + self.Primary.Delay + self.SwingTimeAlt + 0.65
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	local ani = math.random( 1, 3 )
	if ani == 1 then
		self.Weapon:SendWeaponAnim(ACT_VM_MISSLEFT)
		self.Owner:GetViewModel():SetPlaybackRate(1.25)
	elseif ani == 2 then
		self.Weapon:SendWeaponAnim(ACT_VM_MISSRIGHT)
		self.Owner:GetViewModel():SetPlaybackRate(1.25)
	else 
		self.Weapon:SendWeaponAnim(ACT_VM_PULLBACK_HIGH)
		self.Owner:GetViewModel():SetPlaybackRate(1.25)
	end
	
	timer.Simple( self.SwingTimeAlt, function()
		
		local hitted = false
		self.Secondary.Combo = self.Secondary.Combo + 1
	
		if not self:IsValid() or self.Idling == 0 then return end
		self.ParryTime = CurTime()
		self.Parrying = false
		
		self.Weapon:EmitSound("TFA_L4D2_OREN.Swing")

		local ents = ents.FindInSphere(self.Owner:GetPos(), self.MeleeRange)

		local dmginfo = DamageInfo()
			dmginfo:SetAttacker( self.Owner )
			dmginfo:SetInflictor( self )
			
		local dmg = math.random(90,115)
		
		for k, v in pairs(ents) do
			if v ~= self and v ~= self.Owner and IsValid(v) and self:EntityFaceFront( v, 50 ) and self.Owner:GetPos() ~= v:GetPos() then
				if self:EntityFaceBack(v) then
					dmginfo:SetDamage( dmg )
				else 
					dmginfo:SetDamage( dmg )
				end
				-- self.Weapon:EmitSound("TFA_L4D2_OREN.HitWorld")
				hitted = true
				dmginfo:SetDamageForce( ( v:GetPos() - self.Owner:GetPos() ):GetNormalized() * 50000 )
				if SERVER then
					v:TakeDamageInfo( dmginfo )
				end
				if v:GetPhysicsObject():IsValid() and not string.find(v:GetClass(), "ent_pod") then
					v:GetPhysicsObject():ApplyForceCenter( ( v:GetPos() - self.Owner:GetPos() ):GetNormalized() * 50000 )
				end
			end
		end
		
		self.Primary.Combo = 0
		
		local trace = util.TraceLine( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.MeleeRange,
			filter = self.Owner
		} )
		trace.mask = MASK_SHOT
		if (trace.Hit) then
			hitted = true
			if trace.Entity:GetClass() == "func_door_rotating" or trace.Entity:GetClass() == "prop_door_rotating" then
			elseif trace.Entity:IsNPC() or trace.Entity:IsPlayer() then
			else
				bullet = {}
				bullet.Num    = 1
				bullet.Src    = self.Owner:GetShootPos()
				bullet.Dir    = self.Owner:GetAimVector()
				bullet.Spread = Vector(0, 0, 0)
				bullet.Tracer = 0
				bullet.Force  = 0
				bullet.Damage = 25
				bullet.AmmoType = "357"
				self.Owner:FireBullets(bullet)
				--self.Weapon:EmitSound("TFA_L4D2_OREN.HitWorld")
			end
		end

		if hitted then
			self.Weapon:EmitSound("TFA_L4D2_OREN.HitWorld")
		end
		
		if ((game.SinglePlayer() and SERVER) or CLIENT) then
			self.Weapon:SetNetworkedFloat("LastShootTime", CurTime())
		end

		self:IdleAnimationDelay( 0.3, 1 )
	
	end)
	
end

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: +attack1 has been pressed.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
	
	if not IsFirstTimePredicted() then return end
	
	// Holst/Deploy your fucking weapon
	if (not self.Owner:IsNPC() and self.Owner:KeyDown(IN_USE)) then
		bHolsted = !self.Weapon:GetDTBool(0)
		self:SetHolsted(bHolsted)

		self.Weapon:SetNextPrimaryFire(CurTime() + 0.6)
		self.Weapon:SetNextSecondaryFire(CurTime() + 0.6)

		self:SetIronsights(false)

		return
	end
	
	self.ParryTime = CurTime()
	
	if self.Weapon:GetNetworkedBool("Holsted") or self.Owner:KeyDown(IN_SPEED) and !self.Owner:GetNW2Bool("donate_upgrade_runngun",false) or self.Weapon:GetDTBool(0) then return end

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay + self.SwingTime - 0.05)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay + self.SwingTime - 0.05)
	self.ComboReset = CurTime() + self.Primary.Delay + self.SwingTime + 0.65
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	local ani = math.random( 1, 3 )
	if ani == 1 or self.Primary.Combo == 4 then
		self.Weapon:SendWeaponAnim(ACT_VM_HITLEFT)
		self.Owner:GetViewModel():SetPlaybackRate(1.25)
	elseif ani == 2 then
		self.Weapon:SendWeaponAnim(ACT_VM_HITRIGHT)
		self.Owner:GetViewModel():SetPlaybackRate(1.25)
	else 
		self.Weapon:SendWeaponAnim(ACT_VM_PULLBACK)
		self.Owner:GetViewModel():SetPlaybackRate(1.25)
	end
	
	timer.Simple( self.SwingTime, function()

		local hitted = false
		self.Primary.Combo = self.Primary.Combo + 1
		
		if not self:IsValid() or self.Idling == 0 then return end
		self.ParryTime = CurTime()
		self.Parrying = false
		
		self.Weapon:EmitSound("TFA_L4D2_OREN.Swing")

		local ents = ents.FindInSphere(self.Owner:GetPos(), self.MeleeRange)

		local dmginfo = DamageInfo()
			dmginfo:SetAttacker( self.Owner )
			dmginfo:SetInflictor( self )
		
		local dmg = math.random(90,115)
		
		if self.Primary.Combo < 5 then
			for k, v in pairs(ents) do
				if v ~= self and v ~= self.Owner and IsValid(v) and self:EntityFaceFront( v, 35 ) and self.Owner:GetPos() ~= v:GetPos() then
					if self:EntityFaceBack(v) then
						dmginfo:SetDamage( dmg )
					else 
						dmginfo:SetDamage( dmg )
					end
					--self.Weapon:EmitSound("TFA_L4D2_OREN.HitWorld")
					hitted = true
					dmginfo:SetDamageForce( ( v:GetPos() - self.Owner:GetPos() ):GetNormalized() * 50000 )
					if SERVER then
						v:TakeDamageInfo( dmginfo )
					end
					if v:GetPhysicsObject():IsValid() and not string.find(v:GetClass(), "ent_pod") then
						v:GetPhysicsObject():ApplyForceCenter( ( v:GetPos() - self.Owner:GetPos() ):GetNormalized() * 50000 )
					end
				end
			end
		else
			self.Weapon:EmitSound("TFA_L4D2_OREN.HitFlesh")
			self:RushFiveBomb()
			self.Primary.Combo = 0
			self.Secondary.Combo = 0
		end
		
		self.Secondary.Combo = 0
		
		local trace = util.TraceLine( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.MeleeRange,
			filter = self.Owner
		} )
		trace.mask = MASK_SHOT
		if (trace.Hit) then
			hitted = true
			if trace.Entity:GetClass() == "func_door_rotating" or trace.Entity:GetClass() == "prop_door_rotating" then
			elseif trace.Entity:IsNPC() or trace.Entity:IsPlayer() then
			else
				bullet = {}
				bullet.Num    = 1
				bullet.Src    = self.Owner:GetShootPos()
				bullet.Dir    = self.Owner:GetAimVector()
				bullet.Spread = Vector(0, 0, 0)
				bullet.Tracer = 0
				bullet.Force  = 0
				bullet.Damage = 25
				bullet.AmmoType = "357"
				self.Owner:FireBullets(bullet)
				--self.Weapon:EmitSound("TFA_L4D2_OREN.HitWorld")
			end
		end

		if hitted then
			self.Weapon:EmitSound("TFA_L4D2_OREN.HitWorld")
		end
		
		if ((game.SinglePlayer() and SERVER) or CLIENT) then
			self.Weapon:SetNetworkedFloat("LastShootTime", CurTime())
		end

		self:IdleAnimationDelay( 0.3, 1 )
	
	end)
	
end
--PATH addons/111mod/lua/weapons/weapon_pet/shared.lua:
--THIS SHIT YOU SHOULD NOT NEED TO MESS WITH
if (SERVER) then
	AddCSLuaFile("shared.lua")
	
	SWEP.Weight = 10
end
--END OF SHIT THAT SHOULDN'T BE MESSED WITH

if (CLIENT) then
	SWEP.BounceWeaponIcon = false
	SWEP.WepSelectIcon = surface.GetTextureID("vgui/weapons/weapon_pet/biteicon")
	killicon.Add("weapon_pet", "vgui/weapons/weapon_pet/biteicon", Color(255, 80, 0, 255))
end

SWEP.Author = "Alaska"
--Credit for audio resources: audioblocks.com
SWEP.Contact = ""
SWEP.Purpose = "All bark... but can it bite?"
SWEP.Instructions = "ЛКМ - атаковать. ПКМ -  Рык."

SWEP.Category = "Other"
SWEP.PrintName = "Покусака"
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom	= true

--Configured for DarkRP.
--For Sandbox set these two to "true"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 1
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

--How should we hold the ability to bite?
SWEP.HoldType = "fist"

--Should they bite underwater?
SWEP.FiresUnderwater = true

--Since it's a pet's ability to bite, it doesn't need ammo
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1

--Attributes of biting someone
SWEP.Primary.NumberofShots = 1
SWEP.Primary.Force = 20
SWEP.Primary.Damage = 4.5
SWEP.Primary.Recoil = 5

--Semi-auto biting preferred, unless it's a beaver on cocainum
SWEP.Primary.Automatic = false

--Ammo is capacity to bite... so none.
SWEP.Primary.Ammo = ""

--The sound of biting
SWEP.Primary.Sound = Sound("weapons/weapon_pet/doggrowl_1.wav")

--How beaver-like the bites should be in seconds
SWEP.Primary.Delay = 0.5

--Basically the same for the Secondary functions
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

--How Alley Cat-like the barking should be in seconds
SWEP.Secondary.Delay = 0.5

--Open wide (initialize the biting)
function SWEP:Initialize()	
	util.PrecacheSound("sound/weapons/weapon_pet/dogbark_1.wav")
	util.PrecacheSound("sound/weapons/weapon_pet/dogbark_2.wav")
	util.PrecacheSound("sound/weapons/weapon_pet/dogbark_3.wav")
	util.PrecacheSound("sound/weapons/weapon_pet/doggrowl_1.wav")
	
	if (SERVER) then
		self:SetWeaponHoldType(self.HoldType)
		self.Weapon:SetMoveType( MOVETYPE_WALK )
	end
	
	--The sounds of barking
	DogBarks = {
		Sound( "weapons/weapon_pet/dogbark_1.wav" ),
		Sound( "weapons/weapon_pet/dogbark_2.wav" ),
		Sound( "weapons/weapon_pet/dogbark_3.wav" )
	}
end

function SWEP:Deploy()
	if SERVER then
		self.Owner:DrawViewModel(false)
		self.Owner:DrawWorldModel(false)
	end
end

--The bite of the pet.
function SWEP:PrimaryAttack()
	if (!self:CanPrimaryAttack()) then return end
	
	--the meat of the bite
	if self.Owner:Alive() then
		self.Weapon:EmitSound(self.Primary.Sound)
		self:Bite()
		self.Owner:ViewPunch(Angle(rnda, rndb, rnda))
		self.Weapon:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
		self.Weapon:SetNextSecondaryFire(CurTime()+self.Primary.Delay)
	end
end

function SWEP:CanPrimaryAttack()
	if (self.Weapon.Primary.ClipSize <= 0) then
		return true
	end
end

function SWEP:Bite()
	pos = self.Owner:GetShootPos()
	ang = self.Owner:GetAimVector()
	dmg = self.Primary.Damage
	
	local trace = self.Owner:GetEyeTrace()
	
	if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 100 then
		if(trace.Entity:GetClass() == "prop_physics") then
			self.Weapon:EmitSound(self.Primary.Sound)
			return
		end
		-- local bite = {}
		-- bite.Num = self.Primary.NumberofShots
		-- bite.Src = pos
		-- bite.Dir = ang
		-- bite.Spread = Vector(0, 0, 0)
		-- bite.Tracer = 0
		-- bite.Force = self.Primary.Force
		-- bite.Damage = dmg
		-- local rnda = self.Primary.Recoil*-1
		-- local rndb = self.Primary.Recoil*math.random(-1,1)
		-- self.Owner:FireBullets(bite)
		if SERVER then 
			if trace.Entity:IsValid() and trace.Entity:IsPlayer() then
				trace.Entity:TakeDamage(dmg,self.Owner,self)
			end
		end
		
		if(trace.Entity:IsPlayer() || trace.Entity:IsNPC() || trace.Entity:GetClass() == "prop_ragdoll") then
			self:EmitSound(Sound("Weapon_Crowbar.Melee_Hit"))
			local effectdata = EffectData()
			util.Effect( "BloodImpact", effectdata )
		end
	end
end

--The bark, should be worse than the bite.
function SWEP:SecondaryAttack()
	self:CanSecondaryAttack()

	--the wood of the bark
	if self.Owner:Alive() then
		self:Bark()
		self.Owner:ViewPunch(Angle(rnda, rndb, rnda))
		self.Weapon:SetNextPrimaryFire(CurTime()+self.Secondary.Delay)
		self.Weapon:SetNextSecondaryFire(CurTime()+self.Secondary.Delay)
	end
end

function SWEP:CanSecondaryAttack()
	if (self.Weapon.Secondary.ClipSize <= 0) then
		return true
	end
end

function SWEP:Bark()
	pos = self.Owner:GetShootPos()
	ang = self.Owner:GetAimVector()
	
	self.Weapon:EmitSound(DogBarks[math.random(1,#DogBarks)])
	
	if (SERVER) and IsValid(self.Owner) and IsValid(self.Weapon) then
		local bark = {}
		bark.Num = self.Primary.NumberofShots
		bark.Src = pos
		bark.Dir = ang
		local rnda = self.Primary.Recoil*-1
		local rndb = self.Primary.Recoil*math.random(-1,1)
		self.Weapon:EmitSound(DogBarks[math.random(1,#DogBarks)])
	end
end

--extra necessary unnecessary shit
function SWEP:Reload()
end

function SWEP:Think()
end
--PATH addons/vapeswep/lua/weapons/weapon_vape_american.lua:
-- weapon_vape_american.lua
-- Defines a vape which emits red, white, and blue clouds and plays Donald Trump sounds

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.PrintName = "American Vape"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB: Bing Bong\nReload: MAGA\n\nA patriotic vape made in honor of President Trump."

SWEP.VapeID = 7
SWEP.VapeAccentColor = Vector(0.5,0.5,0.5)

--tells the matproxy to substitute red/white/blue fader (todo: change how this works)
SWEP.VapeTankColor = Vector(-2,-2,-2)

function SWEP:SecondaryAttack()
	--this makes it so the "bing bong" sounds the same to everyone instead of the owner hearing a different noise due to randomness
	if CLIENT then return else SuppressHostEvents(NULL) end

	if GetConVar("vape_block_sounds"):GetBool() then return end
	
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("vapebing"..tostring(math.random(1,2))..".wav", 80, pitch + math.Rand(-25,25))
	if SERVER then
		net.Start("VapeTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (0.9*100/pitch))
		net.Broadcast()
	end
end

function SWEP:Reload()
	if GetConVar("vape_block_sounds"):GetBool() then return end

	if self.reloading then return end
	self.reloading=true
	timer.Simple(0.5, function() self.reloading=false end)
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("vapemaga.wav", 80, pitch + math.Rand(-5,5))
	if SERVER then
		net.Start("VapeTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (2.2*100/pitch))
		net.Broadcast()
	end
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
--PATH addons/vapeswep/lua/weapons/weapon_vape/shared.lua:
-- weapon_vape/shared.lua
-- Defines common shared code/defaults for Vape SWEP

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

SWEP.Author = "Swamp Onions"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB & Reload: Play Sounds\n\nVape Nation!"

SWEP.PrintName = "Vape"

SWEP.IconLetter	= "V"
SWEP.Category = "Vapes"
SWEP.Slot = 1
SWEP.SlotPos = 0

SWEP.ViewModelFOV = 62 --default

SWEP.WepSelectIcon = surface and surface.GetTextureID("vape_icon")
SWEP.BounceWeaponIcon = false

SWEP.ViewModel = "models/swamponions/vape.mdl"
SWEP.WorldModel = "models/swamponions/vape.mdl"
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

SWEP.VapeID = 1

function SWEP:Deploy()
	self:SetHoldType("slam")
end

function SWEP:PrimaryAttack()
	if SERVER then
		VapeUpdate(self.Owner, self.VapeID)
	end
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.1)
end

function SWEP:SecondaryAttack()
	if GetConVar("vape_block_sounds"):GetBool() then return end
	
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("vapegogreen.wav", 80, pitch + math.Rand(-5,5))
	if SERVER then
		net.Start("VapeTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (0.6*100/pitch))
		net.Broadcast()
	end
end

function SWEP:Reload()
	if GetConVar("vape_block_sounds"):GetBool() then return end

	if self.reloading then return end
	self.reloading=true
	timer.Simple(0.5, function() self.reloading=false end)
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("vapenaysh.wav", 80, pitch + math.Rand(-5,5))
	if SERVER then
		net.Start("VapeTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (2.2*100/pitch))
		net.Broadcast()
	end
end

function SWEP:Holster()
	if SERVER and IsValid(self.Owner) then
		ReleaseVape(self.Owner)
	end
	return true
end

SWEP.OnDrop = SWEP.Holster
SWEP.OnRemove = SWEP.Holster
--PATH gamemodes/darkrp/entities/entities/base_rp/shared.lua:
ENT.Type 				= 'anim'
ENT.Base				= 'base_anim' 
ENT.Category 			= 'RP'
ENT.Spawnable			= false

--[[
ENT.RemoceOnDisconnect 	= false
ENT.RemoveDelay 		= 300

ENT.RemoveOnJobChange 	= false

ENT.LazyFreeze 			= false
ENT.AllLazyFreeze 		= false

ENT.MaxHealth 			= 100
ENT.ExplodeOnRemove 	= false

ENT.SeizeReward 		= 100
ENT.WantReason 			= 'Some illagel item'

ENT.MinPrice 			= 1
ENT.MaxPrice 			= 5
]]
--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_2/cl_init.lua:
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
				local firstPart = "CLOCK SPEED                              "
				local secondPart = tostring(__round(ent:GetClockSpeed(), 3)).."Ghz"
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				local firstPart = "CORES                                    "
				local secondPart = ent:GetCoreCount()
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				consoleDisplay.history = consoleDisplay.history.."POWER REQUIREMENT                    250W\n"
				consoleDisplay.history = consoleDisplay.history.."MODEL NAME                    Bitminer S2\n"
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
	} 
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_server/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bitminer Server"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 1, "ShouldAnimate" )
	self:NetworkVar("Entity", 0, "owning_ent")
end

--PATH addons/mod_bitminers2/lua/entities/bm2_generator/cl_init.lua:
include("shared.lua")

surface.CreateFont( "BM2GeneratorFont", {
	font = "Roboto Lt", 
	extended = false,
	size = 40,
	weight = 500,
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

local fuelMaterial = Material("materials/bitminers2/ui/fuel.png", "noclamp smooth")
local outputMaterial = Material("materials/bitminers2/ui/output.png", "noclamp smooth")
local warningMaterial = Material("materials/bitminers2/ui/warning.png", "noclamp smooth")

local function __round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function ENT:Draw()
	self:DrawModel()

	if LocalPlayer():GetPos():Distance(self:GetPos()) < 350 then
		if self.cam2d3dAng == nil then
			self.cam2d3dAng = Angle(0,LocalPlayer():GetAngles().y - 90,90)
		else
			self.cam2d3dAng = LerpAngle(7 * FrameTime(),self.cam2d3dAng, Angle(0,LocalPlayer():GetAngles().y - 90,90))
		end
		--Cam 2D3D for drawing infomation
		local ang = self:GetAngles()
		local pos = self:GetPos() + Vector(0,0,40) - (ang:Forward() * 5) + (ang:Up() * 20)

		local alpha = 1 - math.Clamp((LocalPlayer():GetPos():Distance(self:GetPos()) / 350) * 1.1, 0, 1)

		cam.Start3D2D(pos, self.cam2d3dAng, 0.05)
			if not self:GetShowToMuchPowerWarning() then
				draw.RoundedBox(8,-200, -10 , 410, (70 * 2) + 10,Color(0,0,0,100 * alpha))

				surface.SetMaterial(outputMaterial)
				surface.SetDrawColor(Color(200,200,0, 255 * alpha))
				surface.DrawTexturedRect(-200 + 4, 4, 64 - 8, 64 - 8)

				surface.SetMaterial(fuelMaterial)
				surface.SetDrawColor(Color(255,165,0, 255 * alpha))
				surface.DrawTexturedRect(-200 + 4,70 + 4, 64 - 8, 64 - 8)

				//Draw power ussage bar
				draw.RoundedBox(4, -200 + 70, 4, 400 - 70, 60-8, Color(36,36,36, 255 * alpha))
				draw.RoundedBox(2, -200 + 70 + 2, 4 + 2, 400 - 70 - 4, 60-8 - 4, Color(15,15,15, 255 * alpha))
				if self:GetPowerConsumpsion() > 0 then
					draw.RoundedBox(2, -200 + 70 + 2, 4 + 2, (400 - 70 - 4) * (self:GetPowerConsumpsion()/ 10), 60-8 - 4, Color(200,200,0, 255 * alpha))
				end
				
				local powerLevel = __round(self:GetPowerConsumpsion(), 2)

				draw.SimpleText((powerLevel*100).."/1000 W", "BM2GeneratorFont", 45, ((60-8-4)/2) + 6, Color(0,0,0, 255 * alpha), 1, 1)
				draw.SimpleText((powerLevel*100).."/1000 W", "BM2GeneratorFont", 44, ((60-8-4)/2) + 5, Color(255,255,255, 255 * alpha), 1, 1)

				draw.RoundedBox(4, -200 + 70, 4 + 70, 400 - 70, 60-8, Color(36,36,36,  255 * alpha))
				draw.RoundedBox(2, -200 + 70 + 2, 4 + 2 + 70, 400 - 70 - 4, 60-8 - 4, Color(15,15,15, 255 * alpha))
				draw.RoundedBox(2, -200 + 70 + 2, 4 + 2 + 70, (400 - 70 - 4) * (self:GetFuelLevel()/ 1000), 60-8 - 4, Color(255,165,0,  255 * alpha))
				draw.SimpleText(self:GetFuelLevel().."/1000 L", "BM2GeneratorFont", 45, ((60-8-4)/2) + 6 + 70, Color(0,0,0, 255 * alpha), 1, 1)
				draw.SimpleText(self:GetFuelLevel().."/1000 L", "BM2GeneratorFont", 44, ((60-8-4)/2) + 5 + 70, Color(255,255,255, 255 * alpha), 1, 1)
			else
				surface.SetMaterial(warningMaterial)
				surface.SetDrawColor(Color(255,255,255, 255))
				surface.DrawTexturedRect(-80, -20, 160, 160)

				draw.SimpleText("You are using to much power!", "BM2GeneratorFont", 0, 170, Color(0,0,0, 255), 1, 1)
				draw.SimpleText("You are using to much power!", "BM2GeneratorFont", -1, 170 - 1, Color(255,255,255, 255), 1, 1)

				draw.SimpleText("Please disconnect some devices or find anouther power source.", "BM2GeneratorFont", 0, 170 + 35, Color(0,0,0, 255), 1, 1)
				draw.SimpleText("Please disconnect some devices or find anouther power source.", "BM2GeneratorFont", -1, 170 - 1 + 35, Color(255,255,255, 255), 1, 1)

			end
		cam.End3D2D()
	end
end
--PATH addons/cp_ballistic_shields/lua/ballistic_shields/cl_bs_util.lua:
if SERVER then return end
include( "bs_config.lua" )

net.Receive( "bs_shield_info", function( len, pl )
	LocalPlayer().bs_shieldIndex = net.ReadUInt(16)	
end )

local Delay = 0
function bshields_materials_reload()
	for _,v in pairs(bshields.materialstoload) do
		Delay = Delay + 0.2
		timer.Simple( Delay, function() surface.GetURL(v[1], v[2], v[3]) end )
	end

	bshields.hshield_webmat = surface.GetURL(bshields.config.hShieldTexture, 256, 256)
	bshields.rshield_webmat = surface.GetURL(bshields.config.rShieldTexture, 256, 256)
	bshields.dshield_webmat = surface.GetURL(bshields.config.dShieldTexture, 256, 256)
end

bshields.materialstoload = {
	{bshields.config.hShieldTexture, 256, 256},
	{bshields.config.rShieldTexture, 256, 256},
	{bshields.config.dShieldTexture, 256, 256}
}

hook.Add( "InitPostEntity", "bshields_init_client", function()
	bshields_materials_reload()
end)
      
surface.CreateFont( "bshields.HudFont", {
	font = "Roboto",
	size = ScrH()/1080*18,
	extended = true
})
--PATH addons/the_cocaine_factory/lua/entities/cocaine_baking_soda/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Baking Soda"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_cooking_plate/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cooking Plate"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "HP" )

	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end


--PATH addons/the_cocaine_factory/lua/entities/cocaine_cooking_pot/cl_init.lua:
include( "shared.lua" )

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_extractor/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cocaine Extractor"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.AutomaticFrameAdvance = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	self:NetworkVar( "Int", 1, "Leafs" )
	self:NetworkVar( "Int", 2, "BakingSoda" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end

TCF.Config.ExtractorPos = {
	posone = Vector(25.000000, -21.000000, 47.000000), 
	postwo = Vector(26.000000, -15.000000, 37.000000)
}
--PATH addons/the_cocaine_factory/lua/entities/cocaine_gas/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Gas Canister"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_pack/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cocaine"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end

--PATH addons/truefishing/lua/entities/fish_container/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Fish Container"
ENT.Author			= "Tomasas"

function ENT:GetSpace()
	local space = 0
	
	for i=1, FISH_HIGHNUMBER do
		if self.Fishes[i] then
			space = space + self.Fishes[i]
		end
	end
	return space
end

--PATH addons/truefishing/lua/entities/fishing_rod_buoy/cl_init.lua:
include('shared.lua')

ENT.RenderGroup = RENDERGROUP_OPAQUE

ENT.Slashing = false
ENT.NextSplash = 0

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetModelScale(0.325, 0)
	self:SetMaterial("models/props_c17/furniturefabric002a")
end

ENT.OnReloaded = ENT.Initialize

local lineColor = Color(255, 255, 255, 100)
function ENT:Draw()
	if self:GetMaterial() ~= "models/props_c17/furniturefabric002a" then
		self:Initialize()
	end
	
	if !self.AnimationDone then
		if !self.RealPos then
			local owner = self:GetDTEntity(0)
			if !owner:IsValid() then return end
			-- local pos, ang = owner:GetBonePosition(owner:LookupBone("ValveBiped.Bip01_R_Hand", false))
			local bone = owner:LookupBone("ValveBiped.Bip01_R_Hand", false)
			local pos, ang
			if bone then
				pos, ang = owner:GetBonePosition(bone)
			else
				pos, ang = owner:GetPos(), owner:GetAngles()
			end
			
			ang:RotateAroundAxis(ang:Right(), -55)
			ang:RotateAroundAxis(ang:Forward(), 90)
			pos = pos + ang:Forward()*91.65 + ang:Up()*1 - ang:Right()*2.1
			self.RealPos = self:GetPos()
			self.StartPos = pos
			self.LerpPercent = 0
		end
		self.LerpPercent = self.LerpPercent + FrameTime()*0.80
		local posToSet = LerpVector(self.LerpPercent, self.StartPos, self.RealPos)
		posToSet.z = posToSet.z + math.sin(self.LerpPercent*math.pi)*100
		self:SetPos(posToSet)
		
		if self.LerpPercent >= 1 then
			local pos = self.RealPos
			self:SetPos(pos)
			local effectdata = EffectData()
			effectdata:SetOrigin(pos)
			effectdata:SetNormal(pos)
			effectdata:SetRadius(5)
			effectdata:SetScale(5)
			util.Effect("watersplash", effectdata)
			self.AnimationDone = true
		end
	end

	if self.Slashing then
		local ctime, pos = CurTime(), self:GetPos()
		if self.NextSplash < ctime then
			local effectdata = EffectData()
			effectdata:SetOrigin(pos)
			effectdata:SetNormal(pos)
			effectdata:SetRadius(5)
			effectdata:SetScale(4)
			util.Effect("watersplash", effectdata)
			self.NextSplash = ctime+1
		end
		pos.z = pos.z  + math.sin(CurTime()*6)*0.05
		self:SetPos(pos)
	end

	self:DrawModel()
	
	local owner = self:GetDTEntity(0)
	if !owner:IsValid() then return end
				local bone = owner:LookupBone("ValveBiped.Bip01_R_Hand", false)
			local pos, ang
			if bone then
				pos, ang = owner:GetBonePosition(bone)
			else
				pos, ang = owner:GetPos(), owner:GetAngles()
			end
	
	ang:RotateAroundAxis(ang:Right(), -55)
	ang:RotateAroundAxis(ang:Forward(), 90)
	pos = pos + ang:Forward()*91.65 + ang:Up()*1 - ang:Right()*2.1
	local selfpos = self:GetPos()
	selfpos.z = selfpos.z + 4
	render.DrawLine(selfpos, pos, lineColor, true)
	
end

--PATH addons/_gmbheist/lua/entities/gmb_bank/shared.lua:
ENT.Base = "base_gmodentity"
ENT.Type = "anim"

ENT.PrintName		= "Банк"
ENT.Category 		= "GambitHeist"
ENT.Author			= "TravkaCode"

ENT.Contact    		= ""
ENT.Purpose 		= ""
ENT.Instructions 	= ""

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

--PATH addons/newjukebox/lua/entities/jukebox/cl_init.lua:
include("shared.lua")

local VolumeCV = CreateClientConVar("jukebox_volume","1",true,false,"Changes the max volume of the boombox (Between 0 and 1, going beyond is useless)")



surface.CreateFont( "RadioFont",
	{
		font      = "coolvetica",
		size      = 48,
		weight    = 100,
		underline = 1
	}
)

function ENT:Draw()

	self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	local dist = pos:Distance(LocalPlayer():GetPos())
	if (dist > 350) then return end
	
	surface.SetFont( "RadioFont" )
	
	local radWidth = surface.GetTextSize( "Радио" )
	
	ang:RotateAroundAxis( ang:Forward(), 90 )
	ang:RotateAroundAxis( ang:Right(), -90 )
	
	cam.Start3D2D( pos + ang:Up() * 9.5, ang, 0.1 )
		draw.WordBox( 2, -2 - radWidth * 0.5, -150, "Радио", "RadioFont", Color( 0, 0, 0, 140 ), Color( 0, 230, 255 ) )
	cam.End3D2D()
end

-- function ENT:Initialize()
	-- self:SetRenderBounds(Vector(-16384,-16384,-16384),Vector(16384,16384,16384))
-- end

function ENT:OnRemove()
	if IsValid(self.audio) then
		self.audio:Stop()
	end
end

local function tryget(url,callback,tries,times)
	sound.PlayURL ( url, "3d noblock noplay", function(data)
		if IsValid(data) then
		    if (times - 2) > data:GetLength() then tryget(url,callback,tries,times) return end
			callback(data)
		else
			if tries > 3 then
				print("Failed, retrying...")
				tryget(url,callback,tries-1,times)
			else
				callback(nil)
			end
		end
	end)
end

local ExistingAudios = {}

local lastcheck = CurTime()
hook.Add("Think","fixjukeboxpos",function()
	if CurTime()-lastcheck>1 then
		for ent,audio in pairs(ExistingAudios) do
			if not IsValid(ent) and IsValid(audio) then
				audio:Stop()
				ExistingAudios[ent] = nil
			end
			if IsValid(audio) and IsValid(ent) then
				local dists = ent:GetSoundPos():DistToSqr(LocalPlayer():EyePos())
				if dists>JUKEBOX.config.FarDistance^2*1.1 and CurTime()-(ent.lastupdate or 0)>2 then
					audio:SetVolume(0)
				end
				if IsValid(ent:GetHeld()) and IsValid(ent:GetHeld():GetParent()) and CurTime()-(ent.lastupdate or 0)>2 then
					if ent:GetHeld():GetParent()~=LocalPlayer() or LocalPlayer():ShouldDrawLocalPlayer() then
						audio:SetPos(ent:GetHeld():GetParent():EyePos(),ent:GetForward())
					else
						audio:SetPos(LocalPlayer():EyePos()+LocalPlayer():EyeAngles():Forward()*20,-LocalPlayer():EyeAngles():Forward())
					end
				end
			end
		end
		lastcheck = CurTime()
	end
end)

function ENT:Play(data,autoplay,time)
	self.volume = self.volume or 1
	if not autoplay then
		self.shouldplay = {time,0}
	end
	if self.mdata and data.ref==self.mdata.ref then
		if IsValid(self.audio) then
			if autoplay then 
				self.audio:Stop()
			else
				self.audio:Play()
			end
			return
		end
	end
	self.loading = true
	tryget(data.ref, function(streamdata)
		if IsValid(streamdata) and self.loading then
			ExistingAudios[self] = streamdata
			self.error = nil
			self.loading = nil
			streamdata:SetPos(self:GetPos())
			if self.shouldplay then
				streamdata:Play()
				streamdata:SetTime(CurTime() - (self.shouldplay[1] or CurTime())+self.shouldplay[2])
				self.shouldplay = nil
			end
			streamdata:SetVolume(self.volume * math.Clamp(VolumeCV:GetFloat(),0,1))
			streamdata:Set3DCone(180,360,0.3)
			streamdata:Set3DFadeDistance(JUKEBOX.config.FarDistance or 800,0)
			self.audio = streamdata
			self.mdata = data
		else
			self.loading = nil
			self.error = true
		end
	end,3, data.time)
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:Think()
	if IsValid(self.audio) then
		if self.volume then
			local startpos = self:GetPos()
			if IsValid(self:GetHeld()) and IsValid(self:GetHeld():GetParent()) then 
				startpos = self:GetHeld():GetParent():EyePos()
			end
			local dsqr = startpos:DistToSqr(LocalPlayer():GetPos())
			local mins,maxs = JUKEBOX.config.CloseDistance^2,JUKEBOX.config.FarDistance^2

			if dsqr<maxs then
				local tr = util.TraceLine({start=startpos,endpos=LocalPlayer():EyePos(),mask=MASK_SHOT_HULL,filter={self,LocalPlayer()}})
				local submerged = self:WaterLevel()
				local fact = self:WaterLevel()>0 and 0.125 or 1
				fact = LocalPlayer():WaterLevel()>2 and fact/8 or fact
				if tr.Hit then fact = 0.3 end
				fact = fact * math.Clamp(VolumeCV:GetFloat(),0,1)
				if dsqr>mins then
					self.audio:SetVolume(self.volume*(1-(dsqr-mins)/(maxs-mins))*fact)
				else
					self.audio:SetVolume(self.volume*fact)
				end
			else
				self.audio:SetVolume(0)
			end
		end
		if IsValid(self:GetHeld()) and IsValid(self:GetHeld():GetParent()) then
			if self:GetHeld():GetParent()~=LocalPlayer() or LocalPlayer():ShouldDrawLocalPlayer() then
				self.audio:SetPos(self:GetHeld():GetParent():EyePos(),self:GetForward())
			else
				self.audio:SetPos(LocalPlayer():EyePos()+LocalPlayer():EyeAngles():Forward()*20,-LocalPlayer():EyeAngles():Forward())
			end
		else
			self.audio:SetPos(self:GetPos(),self:GetForward())
		end
		self.lastupdate = CurTime()
	end
end
--PATH addons/111mod/lua/entities/npc_donate/shared.lua:
ENT.Base = "base_ai" 
ENT.Type = "ai"
ENT.PrintName		= "Donate"
ENT.Author			= "TravkaCode"
ENT.Category = "@GambitEnts"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end

--PATH addons/truefishing/lua/entities/npc_fishshop/shared.lua:
ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.Spawnable = true
ENT.AdminOnly = true
--[[
list.Set( "NPC", "npc_fishshop", {
	Name = "Рыбак",
	Class = "npc_fishshop",
	Category = "TrueFish",
	Model = "models/Eli.mdl",
} )
]]
--PATH addons/foodmode/lua/entities/povaridzenpc/shared.lua:

ENT.Base = 'base_ai'
ENT.Type = 'ai'
ENT.PrintName = 'povaridzeshop'
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.Category = 'RP NPCs'
--PATH addons/truefishing/lua/entities/rod_fish/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Spawned Fish"
ENT.Author = "MrGeRoI"
ENT.Spawnable = false

function ENT:SetupDataTables()
end

--PATH addons/111mod/lua/entities/sammyservers_textscreen/cl_init.lua:
include("shared.lua")

local render_convar_range = CreateClientConVar("ss_render_range", 1500, true, false, "Determines the render range for Textscreens. Default 1500")
local render_rainbow = CreateClientConVar("ss_render_rainbow", 1, true, false, "Determines if rainbow screens are rendered. If disabled (0), will render as solid white. Default enabled (1)", 0, 1)
local render_range = render_convar_range:GetInt() * render_convar_range:GetInt() --We multiply this is that we can use DistToSqr instead of Distance so we don't need to workout the square root all the time
local rainbow_enabled = cvars.Number("ss_enable_rainbow", 1)
local textscreenFonts = textscreenFonts
local screenInfo = {}
local shouldDrawBoth = false

-- Numbers used in conjunction with text width to work out the render bounds
local widthBoundsDivider = 7.9
local heightBoundsDivider = 12.4

-- ENUM type things for faster table indexing
local FONT = 1
local TEXT = 2
local POSX = 3
local POSY = 4
local COL = 5
local LEN = 6
local SIZE = 7
local CAMSIZE = 8
local RAINBOW = 9

-- Make ply:ShouldDrawLocalPlayer() never get called more than once a frame
hook.Add("Think", "ss_should_draw_both_sides", function()
	shouldDrawBoth = LocalPlayer():ShouldDrawLocalPlayer()
end)

local function ValidFont(f)
	if textscreenFonts[f] ~= nil then
		return textscreenFonts[f]
	elseif table.HasValue(textscreenFonts, f) then
		return f
	else
		return false
	end
end

cvars.AddChangeCallback("ss_render_range", function(convar_name, value_old, value_new)
	render_range = tonumber(value_new) * tonumber(value_new)
end, "3D2DScreens")

cvars.AddChangeCallback("ss_render_rainbow", function(convar_name, value_old, value_new)
	render_rainbow = tonumber(value_new)
end, "3D2DScreens")

-- TODO: https://github.com/Facepunch/garrysmod-issues/issues/3740
-- cvars.AddChangeCallback("ss_enable_rainbow", function(convar_name, value_old, value_new)
-- 	print('ss_enable_rainbow changed: '.. value_new)
-- 	rainbow_enabled = tonumber(value_new)
-- end, "3D2DScreens")

function ENT:Initialize()
	self:SetMaterial("models/effects/vol_light001")
	self:SetRenderMode(RENDERMODE_NONE)
	net.Start("textscreens_download")
	net.WriteEntity(self)
	net.SendToServer()
end

local product
local function IsInFront(entPos, plyShootPos, direction)
	product = (entPos.x - plyShootPos.x) * direction.x +
		(entPos.y - plyShootPos.y) * direction.y +
		(entPos.z - plyShootPos.z) * direction.z
	return product < 0
end


-- Draws the 3D2D text with the given positions, angles and data(text/font/col)
local function Draw3D2D(ang, pos, camangle, data)

	for i = 1, data[LEN] do
		if not data[i] or not data[i][TEXT] then continue end

		cam.Start3D2D(pos, camangle, data[i][CAMSIZE] )
			render.PushFilterMin(TEXFILTER.ANISOTROPIC)
			-- Font
			surface.SetFont(data[i][FONT])
			-- Position
			surface.SetTextPos(data[i][POSX], data[i][POSY])
			-- Rainbow
			if data[i][RAINBOW] ~= nil and data[i][RAINBOW] ~= 0 then
				local j = 0
				for _, code in utf8.codes(data[i][TEXT]) do
					j = j + 1
					--Color
					if rainbow_enabled == 1 and render_rainbow ~= 0 then
						surface.SetTextColor(HSVToColor((CurTime() * 60 + (j * 5)) % 360, 1, 1))
					else
						-- Render as solid white if ss_render_rainbow is disabled or server disabled via ss_enable_rainbow
						surface.SetTextColor(255, 255, 255)
					end
					--Text
					surface.DrawText(utf8.char(code))
				end
			else
				--Color
				surface.SetTextColor(data[i][COL])
				--Text
				surface.DrawText(data[i][TEXT])
			end

			render.PopFilterMin()
		cam.End3D2D()
	end

end

local plyShootPos, ang, pos, camangle, showFront, data -- Less variables being created each frame
function ENT:DrawTranslucent()
	-- Cache the shoot pos for this frame
	plyShootPos = LocalPlayer():GetShootPos()

	if screenInfo[self] ~= nil and self:GetPos():DistToSqr(plyShootPos) < render_range then
		ang = self:GetAngles()
		pos = self:GetPos() + ang:Up()
		camangle = Angle(ang.p, ang.y, ang.r)
		data = screenInfo[self]

		-- Should we draw both screens? (Third person/calview drawing fix)
		if shouldDrawBoth then
			Draw3D2D(ang, pos, camangle, data)
			camangle:RotateAroundAxis(camangle:Right(), 180)
			Draw3D2D(ang, pos, camangle, data)
		else
			-- Is the front of the screen facing us or the back?
			showFront = IsInFront(pos, plyShootPos, ang:Up())

			-- Draw the front of the screen
			if showFront then
				Draw3D2D(ang, pos, camangle, data)
			else
			-- Draw the back of the screen
				camangle:RotateAroundAxis(camangle:Right(), 180)
				Draw3D2D(ang, pos, camangle, data)
			end
		end
	end
end

local function AddDrawingInfo(ent, rawData)
	local drawData = {}
	local textSize = {}

	local totalHeight = 0
	local maxWidth = 0
	local currentHeight = 0

	for i = 1, #rawData do
		-- Setup tables
		if not rawData[i] or not rawData[i].text then continue end
		drawData[i] = {}
		textSize[i] = {}
		-- Text
		drawData[i][TEXT] = rawData[i].text
		-- Font
		drawData[i][FONT] = (ValidFont(rawData[i].font) or textscreenFonts[1])
		-- Text size
		surface.SetFont(drawData[i][FONT])
		textSize[i][1], textSize[i][2] = surface.GetTextSize(drawData[i][TEXT])
		textSize[i][2] = rawData[i].size
		-- Workout max width for render bounds
		maxWidth = maxWidth > textSize[i][1] and maxWidth or textSize[i][1]
		-- Position
		totalHeight = totalHeight + textSize[i][2]
		-- Colour
		drawData[i][COL] = Color(rawData[i].color.r, rawData[i].color.g, rawData[i].color.b, 255)
		-- Size
		drawData[i][SIZE] = rawData[i]["size"]
		-- Remove text if text is empty so we don't waste performance
		if string.len(drawData[i][TEXT]) == 0 or string.len(string.Replace( drawData[i][TEXT], " ", "" )) == 0 then drawData[i][TEXT] = nil end
		--Rainbow
		drawData[i][RAINBOW] = rawData[i]["rainbow"] or 0
	end

	-- Sort out heights
	for i = 1, #rawData do
		if not rawData[i] then continue end
		-- The x position at which to draw the text relative to the text screen entity
		drawData[i][POSX] = math.ceil(-textSize[i][1] / 2)
		-- The y position at which to draw the text relative to the text screen entity
		drawData[i][POSY] = math.ceil(-(totalHeight / 2) + currentHeight)
		-- Calculate the cam.Start3D2D size based on the size of the font
		drawData[i][CAMSIZE] = (0.25 * drawData[i][SIZE]) / 100
		-- Use the CAMSIZE to "scale" the POSY
		drawData[i][POSY] = (0.25 / drawData[i][CAMSIZE] * drawData[i][POSY])
		-- Highest line to lowest, so that everything is central
		currentHeight = currentHeight + textSize[i][2]
	end

	-- Cache the number of lines/length
	drawData[LEN] = #drawData
	-- Add the new data to our text screen list
	screenInfo[ent] = drawData

	-- Calculate the render bounds
	local x = maxWidth / widthBoundsDivider
	local y = currentHeight / heightBoundsDivider + 13 -- Text is above the centre

	-- Setup the render bounds
	ent:SetRenderBounds(Vector(-x, -y, -1.75), Vector(x, y, 1.75))
end

net.Receive("textscreens_update", function(len)
	local ent = net.ReadEntity()

	if IsValid(ent) and ent:GetClass() == "sammyservers_textscreen" then

		local t = net.ReadTable()

		ent.lines = t -- Incase an addon or something wants to read the information.

		AddDrawingInfo(ent, t)
	end
end)

-- Auto refresh
if IsValid(LocalPlayer()) then
	local screens = ents.FindByClass("sammyservers_textscreen")
	for k, v in ipairs(screens) do
		if screenInfo[v] == nil and v.lines ~= nil then
			AddDrawingInfo(v, v.lines)
		end
	end
end

--PATH addons/111mod/lua/entities/sammyservers_textscreen/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "SammyServers Textscreen"
ENT.Author = "SammyServers"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "IsPersisted")
end

local function textScreenCanTool(ply, trace, tool)
	-- only allow textscreen, remover, and permaprops tool
	if IsValid(trace.Entity) and trace.Entity:GetClass() == "sammyservers_textscreen" and tool ~= "textscreen" and tool ~= "remover" and tool ~= "permaprops" then
		return false
	end
end
hook.Add("CanTool", "3D2DTextScreensPreventTools", textScreenCanTool)
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_nozzle/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Fuel nozzle"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_fuel_diesel/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Jerry can, diesel, 20 l"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "fuel"
ENT.VC_FuelType = 1
ENT.VC_Storage = 20
ENT.VC_MaxStorage = 20
ENT.VC_CanBeDamaged = true
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_fuel_petrol/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Jerry can, petrol, 20 l"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "fuel"
ENT.VC_FuelType = 0
ENT.VC_Storage = 20
ENT.VC_MaxStorage = 20
ENT.VC_CanBeDamaged = true
--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_palette/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Palette.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Palette.Draw(self)
end

function ENT:OnRemove()
	zmlab2.Palette.OnRemove(self)
end

function ENT:Think()
	zmlab2.Palette.Think(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_frezzer/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_frezzer.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Frezzer"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "ProcessState")
    /*
        0 = Needs Lox
        1 = Idle
        2 = Frezzing
    */
    self:NetworkVar("Int", 2, "FrezzeStart")
    if (SERVER) then
        self:SetProcessState(0)
        self:SetFrezzeStart(0)
    end
end

function ENT:OnDropTray(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > 8 and lp.x < 16.3 and lp.y < 11 and lp.y > 10 and lp.z > 49 and lp.z < 52.5 then
        return true
    else
        return false
    end
end

function ENT:OnStart(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > 8 and lp.x < 16.3 and lp.y < 11 and lp.y > 10 and lp.z > 52.5 and lp.z < 56 then
        return true
    else
        return false
    end
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_ventilation/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_ventilation.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Ventilation"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()

    self:NetworkVar("Int", 2, "ProcessState")
    /*
        0 = OFF
        1 = ON
    */

    self:NetworkVar("Entity", 1, "Output")

    //self:NetworkVar("Bool", 1, "IsVenting")
    self:NetworkVar("Int", 1, "LastPollutionMove")


    if (SERVER) then
        self:SetProcessState(0)
        self:SetOutput(NULL)
        //self:SetIsVenting(false)
        self:SetLastPollutionMove(-1)
    end
end

function ENT:GetIsVenting()
    return self:GetProcessState() == 1
end

function ENT:OnStart(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -8.8 and lp.x < 0 and lp.y < 15 and lp.y > 10 and lp.z > 28.5 and lp.z < 33.5 then
        return true
    else
        return false
    end
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_storage/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_storage.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Storage"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()

    self:NetworkVar("Int", 1, "NextPurchase")


    if (SERVER) then
        self:SetNextPurchase(0)
    end
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

--PATH addons/zeros_weedfarm/lua/entities/zwf_edibles/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_muffin.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Muffin"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

--PATH addons/zeros_weedfarm/lua/entities/zwf_fuel/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_fuel.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Fuel"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/zeros_weedfarm/lua/entities/zwf_jar/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self.LastWeedAmount = -1

	self.PlantData = nil

	self.IsInitialized = false

	timer.Simple(0.1,function()
		if IsValid(self) then
			self.IsInitialized = true
		end
	end)
end

function ENT:Draw()
	self:DrawModel()

	if  GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 35) == false and self.PlantData ~= nil and self.PlantData ~= -1 then
		self:DrawInfo()
	end
end

function ENT:DrawTranslucent()
	self:Draw()
end


function ENT:DrawInfo()
	cam.Start3D2D(/*self:LocalToWorld(Vector(0, 0, 20))*/ self:GetPos() + Vector(0, 0, 30), Angle(0, EyeAngles().y - 90, -EyeAngles().x + 90), 0.05)

		if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 150) then
			draw.SimpleText(self:GetWeedName(), "zwf_jar_font01", 0, -115, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.RoundedBox(15, -200, -15, 400, 250, zwf.default_colors["black03"])

			surface.SetDrawColor(zwf.default_colors["white01"])
			surface.SetMaterial(zwf.default_materials["icon_mass"])
			surface.DrawTexturedRect(-150, 10, 100, 100)

			surface.SetDrawColor(zwf.default_colors["white01"])
			surface.SetMaterial(zwf.default_materials["icon_thc"])
			surface.DrawTexturedRect(45, 10, 100, 100)

			draw.SimpleText( math.Round(self:GetWeedAmount()) .. zwf.config.UoW, "zwf_jar_font02", -100, 135, zwf.default_colors["green06"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.SimpleText(math.Round(self:GetTHC(), 2) .. "%", "zwf_jar_font02", 100, 135, zwf.default_colors["green06"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		else
			draw.SimpleText(self:GetWeedName(), "zwf_jar_font01", 0, 0, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		end

	cam.End3D2D()
end

function ENT:Think()
	if self.IsInitialized == false then return end

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then

		if self.PlantData == nil or self.PlantData == -1 then
			self.PlantData = zwf.config.Plants[self:GetPlantID()]
		end

		local _weed = self:GetWeedAmount()

		if _weed ~= self.LastWeedAmount then
			self.LastWeedAmount = _weed
			self:SetBodygroup(1, 0)
			self:SetBodygroup(2, 0)
			self:SetBodygroup(3, 0)

			if self.LastWeedAmount <= zwf.config.Jar.Capacity / 3 then
				self:SetBodygroup(1, 1)
			elseif self.LastWeedAmount <= (zwf.config.Jar.Capacity / 3) * 2 then
				self:SetBodygroup(1, 1)
				self:SetBodygroup(2, 1)
			else
				self:SetBodygroup(1, 1)
				self:SetBodygroup(2, 1)
				self:SetBodygroup(3, 1)
			end

			if self.PlantData then
				self:SetSkin(self.PlantData.skin)
			end
		end
	else
		self.LastWeedAmount = -1
		self.PlantData = -1
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_jar/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_jar.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Jar"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "PlantID")
    self:NetworkVar("Float", 0, "WeedAmount")
    self:NetworkVar("Float", 1, "THC")

    self:NetworkVar("Int", 1, "Perf_Time")
    self:NetworkVar("Int", 2, "Perf_Amount")
    self:NetworkVar("Int", 3, "Perf_THC")

    self:NetworkVar("String", 0, "WeedName")


    if (SERVER) then
        self:SetWeedAmount(200)
        self:SetPlantID(7)
        self:SetTHC(25)

        self:SetPerf_Time(125)
        self:SetPerf_Amount(115)
        self:SetPerf_THC(102)

        self:SetWeedName("OG Kush")
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_oven/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)

	self.LastWorkState = -1
	self.IsBaking = false
	self.BakeStart = -1
end

function ENT:Draw()
	self:DrawModel()

	zwf.f.UpdateEntityVisuals(self)

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 200) then
		self:DrawScreenUI()
	end
end

function ENT:DrawScreenUI()
	if self:GetIsBaking() then
		cam.Start3D2D(self:LocalToWorld(Vector(3.3,13, 19.4)), self:LocalToWorldAngles(Angle(0, 180, 90)), 0.1)

		if self.BakeStart ~= -1 then
			draw.RoundedBox(5, -90, -55, 180, 20, zwf.default_colors["gray02"])
			local width = (180 / zwf.config.Cooking.bake_duration) * (CurTime() - self.BakeStart)
			draw.RoundedBox(5, -90, -55, width, 20, zwf.default_colors["green04"])
		end

		cam.End3D2D()
	end
end



function ENT:Think()

	self.IsBaking = self:GetIsBaking()

	zwf.f.LoopedSound(self, "zwf_oven_loop", self.IsBaking)


	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then

		local _workstate = self:GetWorkState()

		if self.LastWorkState ~= _workstate then
			self.LastWorkState = _workstate

			if _workstate == 0 then

				// Play idle Animation
				zwf.f.ClientAnim(self, "idle", 1)

			elseif _workstate == 1 then

				// Play open Animation
				zwf.f.ClientAnim(self, "open", 1)
				zwf.f.EmitSoundENT("zwf_oven_open", self)

			elseif _workstate == 2 then

				// Play close Animation
				zwf.f.ClientAnim(self, "close", 1)
				zwf.f.EmitSoundENT("zwf_oven_close", self)
			end

			if self.IsBaking then
				if self.BakeStart == -1 then
					self.BakeStart = CurTime()
				end
				//self:SetBodygroup(0,1)
			else
				self.BakeStart = -1
				//self:SetBodygroup(0,0)
			end
		end
	else
		self.LastWorkState = -1
		self.BakeStart = -1
	end

	self:SetNextClientThink(CurTime())
	return true
end

function ENT:UpdateVisuals()

	local _workstate = self:GetWorkState()

	if _workstate == 0 then

		// Play idle Animation
		zwf.f.ClientAnim(self, "idle", 5)
	elseif _workstate == 1 then

		// Play open Animation
		zwf.f.ClientAnim(self, "open",  5)

	elseif _workstate == 2 then

		// Play close Animation
		zwf.f.ClientAnim(self, "close", 5)

	end

	/*
	if self.IsBaking then
		self:SetBodygroup(0, 1)
	else
		self:SetBodygroup(0, 0)
	end
	*/
end

function ENT:OnRemove()
	self:StopSound("zwf_oven_loop")
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_plant/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.LastSeedID = -1
	self.LastProgress = -1
	self.Pot = nil
	self.Grow_Duration = -1
	self.Grow_Amount = -1

	self.SkankEffect = {
		em = ParticleEmitter(self:GetPos()),
		last_emit = -1
	}

	self.IsInitialized = false

	timer.Simple(0.1,function()
		if IsValid(self) then
			self.IsInitialized = true
		end
	end)
end

function ENT:Draw()
	self:DrawModel()

	zwf.f.UpdateEntityVisuals(self)

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 250) and IsValid(self.Pot) then
		self:DrawPlantInfo()
	end
end

function ENT:DrawPlantInfo()
	local harvestReady = self.Pot:GetHarvestReady()
	local hasplague = self.Pot:GetHasPlague()

	if harvestReady or hasplague then

		cam.Start3D2D(self:LocalToWorld(Vector(0, 35, 55)), /* self:LocalToWorldAngles(Angle(0, 180, 90))*/ Angle(0, EyeAngles().y - 90, -EyeAngles().x + 90), 0.05)

		if hasplague then
			draw.SimpleText(">> " .. zwf.language.General["plant_heal"] .. " <<", "zwf_plant_font01", 0, 10, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		elseif harvestReady then
			draw.SimpleText(">> " .. zwf.language.General["plant_harvest"] .. " <<", "zwf_plant_font01", 0, 10, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.SimpleText("[ " .. math.Round(self.Pot:GetYieldAmount()) .. zwf.config.UoW .. " ]", "zwf_plant_font02", 0, 120, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		end

		cam.End3D2D()
	end
end

function ENT:DrawTranslucent()
	self:Draw()
end

// Gets called when the entity gets rendered again after certain amount of time
function ENT:UpdateVisuals()

	self:UpdateGrowData()
	self:UpdateBodygroups()
	self:UpdateModelScale()
	self:UpdateSkin()
end

function ENT:UpdateGrowData()

	local growData = zwf.config.Plants[self.LastSeedID]

	if growData == nil then return end

	if not IsValid(self.Pot) then
		self.Pot = self:GetParent()
	end

	if not IsValid(self.Pot) then return end

	local growBoost = self.Pot:GetPerf_Time() - 100
	local grow_Duration = growData.Grow.Duration * (1 - ((1 / 100) * growBoost))
	local grow_Amount = growData.Grow.MaxYieldAmount * ((1 / 100) * self.Pot:GetPerf_Amount())

	self.Grow_Duration = grow_Duration
	self.Grow_Amount = grow_Amount
end

function ENT:UpdateBodygroups()
	if not IsValid(self.Pot) then return end

	local dur = self.Grow_Duration

	local fraction = dur / 6

	if self.LastProgress >= dur then

		// Enables the Weed Buds Bodygroup depending on YieldAmount
		local MaxYieldAmount = self.Grow_Amount
		local CurYieldAmount = self.Pot:GetYieldAmount()

		if CurYieldAmount >= MaxYieldAmount /** 1.5*/ then

			// Bushes
			self:SetBodygroup(5,1)

			self:SetBodygroup(6,1)
			self:SetBodygroup(7,1)
			self:SetBodygroup(8,1)
		elseif CurYieldAmount >= MaxYieldAmount then
			self:SetBodygroup(6,1)
			self:SetBodygroup(7,1)

		elseif CurYieldAmount > 0 then
			self:SetBodygroup(6,1)
		end

		// Disable grow stage
		self:SetBodygroup(0,0)

		// Stem
		self:SetBodygroup(1,1)

		// Leafs small
		self:SetBodygroup(2,1)

		// Leafs big
		self:SetBodygroup(3,1)

		// Leafs inner
		self:SetBodygroup(4,1)

	elseif self.LastProgress > fraction * 5 then

		// Disable grow stage
		self:SetBodygroup(0,0)

		// Stem
		self:SetBodygroup(1,1)

		// Leafs small
		self:SetBodygroup(2,1)

		// Leafs big
		self:SetBodygroup(3,1)

		// Leafs inner
		self:SetBodygroup(4,1)

	elseif self.LastProgress > fraction * 4 then
		self:SetBodygroup(0,5)
	elseif self.LastProgress > fraction * 3 then
		self:SetBodygroup(0,4)
	elseif self.LastProgress > fraction * 2 then
		self:SetBodygroup(0,3)
	elseif self.LastProgress > fraction then

		self:SetBodygroup(0,2)
	elseif self.LastProgress > 0 then

		self:SetBodygroup(0,1)
	end
end

function ENT:UpdateModelScale()
	if not IsValid(self.Pot) then return end
	local weedAmount = self.Pot:GetYieldAmount()
	local extraSize = (0.25 / zwf.config.Growing.max_amount) * weedAmount
	extraSize = math.Clamp(extraSize,0,0.25)

	self:SetModelScale(1 + extraSize)
end

function ENT:UpdateSkin()
	local growData = zwf.config.Plants[self.LastSeedID]

	if growData == nil then return end

	self:SetSkin(growData.skin)
end

function ENT:Think()
	if self.IsInitialized == false then return end

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then


		if not IsValid(self.Pot) then
			self.Pot = self:GetParent()
		else

			local seedID = self.Pot:GetSeed()
			local _harvestready = self.Pot:GetHarvestReady()

			if self.LastSeedID ~= seedID then
				self.LastSeedID = seedID

				self:UpdateSkin()
			end


			local Progress = self.Pot:GetProgress()
			if self.LastProgress ~= Progress then

				self.LastProgress = Progress
				self:UpdateGrowData()
				self:UpdateBodygroups()
			end

			if CurTime() > 	self.SkankEffect.last_emit and _harvestready then

				if GetConVar("zwf_cl_vfx_skankeffect"):GetInt() == 1 then
					self:SkankEmitter("zerochain/zwf/particle/zwf_glow")
					self:SkankEmitter("zerochain/zwf/particle/zwf_skankcloud")
				end

				// If the plant is harvest ready and we have PostGrow enabled then we increase the Model Scale a bit to visualize the Post Growth
				if zwf.config.Growing.PostGrow.Enabled then
					self:UpdateModelScale()
				end

				self.SkankEffect.last_emit = CurTime() + math.Rand(0.3,0.6)
			end
		end

	else
		self.Grow_Duration = -1
		self.Grow_Amount = -1
		self.LastSeedID = -1
		self.LastProgress = -1

		if self.SkankEffect.em ~= NULL and type(self.SkankEffect.em) == "CLuaEmitter" then
			self.SkankEffect.em:Finish()
			self.SkankEffect.em = NULL
		end
	end
end


function ENT:SkankEmitter(mat)
	if self.SkankEffect.em == NULL or type(self.SkankEffect.em) ~= "CLuaEmitter" then

		self.SkankEffect = {
			em = ParticleEmitter(self:GetPos()),
			last_emit = -1
		}

		return
	end

	local pos = self:GetPos() + self:GetUp() * 35 + self:GetRight() * -15 + self:GetForward() * math.random(-5, 5)
	local vel = Vector(0, 0, math.random(25, 55))
	local icon = self.SkankEffect.em:Add(mat, pos)
	icon:SetVelocity(vel)
	icon:SetDieTime(1)
	icon:SetStartAlpha(200)
	icon:SetEndAlpha(0)
	icon:SetStartSize(15)
	icon:SetEndSize(55)
	local iconColor = zwf.default_colors["white01"]
	iconColor = zwf.config.Plants[self.LastSeedID].color
	icon:SetColor(iconColor.r, iconColor.g, iconColor.b)
	icon:SetGravity(Vector(0, 0, 0))
	icon:SetAirResistance(15)
end

function ENT:OnRemove()
	if self.SkankEffect.em ~= NULL and type(self.SkankEffect.em) == "CLuaEmitter" then
		self.SkankEffect.em:Finish()
		self.SkankEffect.em = NULL
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_pot/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_pot01.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Flowerpot"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()

    self:NetworkVar("String", 0, "SeedName")

    self:NetworkVar("Int", 0, "Water")
    self:NetworkVar("Int", 1, "NutritionID")
    self:NetworkVar("Int", 2, "Seed")
    self:NetworkVar("Int", 4, "Light")

    self:NetworkVar("Int", 5, "Temperatur")

    // This counts the progress steps in which the plants was perfectly happy aka Water levels are at perfect balance , it has light and the plants was not overheated and no plague
    self:NetworkVar("Int", 6, "PerfectProgress")

    self:NetworkVar("Bool", 0, "HasPlague")
    self:NetworkVar("Bool", 1, "HarvestReady")
    self:NetworkVar("Bool", 2, "HasSoil")

    // Tells us how long the plant is allready growing
    // Stores the seconds
    self:NetworkVar("Float", 1, "Progress")

    self:NetworkVar("Float", 0, "YieldAmount")


    self:NetworkVar("Int", 7, "Perf_Time")
    self:NetworkVar("Int", 8, "Perf_Amount")
    self:NetworkVar("Int", 9, "Perf_THC")


    if (SERVER) then
        self:SetWater(0)
        self:SetLight(0)
        self:SetNutritionID(-1)
        self:SetSeed(-1)

        self:SetPerfectProgress(0)

        self:SetTemperatur(0)
        self:SetHasSoil(false)
        self:SetHasPlague(false)
        self:SetHarvestReady(false)

        self:SetProgress(0)

        self:SetYieldAmount(0)

        self:SetPerf_Time(100)
        self:SetPerf_Amount(100)
        self:SetPerf_THC(100)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_pot_hydro.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_pot")
ENT.Type = "anim"
ENT.Base = "zwf_pot"

ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_pot02.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Hydro Flowerpot"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT



function ENT:SetupDataTables()

    self:NetworkVar("String", 0, "SeedName")

    self:NetworkVar("Int", 0, "Water")
    self:NetworkVar("Int", 1, "NutritionID")
    self:NetworkVar("Int", 2, "Seed")
    self:NetworkVar("Int", 4, "Light")

    self:NetworkVar("Int", 5, "Temperatur")

    self:NetworkVar("Bool", 0, "HasPlague")
    self:NetworkVar("Bool", 1, "HarvestReady")
    self:NetworkVar("Bool", 2, "HasSoil")


    // This counts the progress steps in which the plants was perfectly happy aka Water levels are at perfect balance , it has light and the plants was not overheated
    self:NetworkVar("Int", 6, "PerfectProgress")

    // Tells us how long the plant is allready growing
    // Stores the seconds
    self:NetworkVar("Float", 1, "Progress")

    self:NetworkVar("Float", 0, "YieldAmount")


    self:NetworkVar("Entity", 0, "Output")
    self:NetworkVar("Entity", 1, "WaterSource")

    self:NetworkVar("Int", 7, "Perf_Time")
    self:NetworkVar("Int", 8, "Perf_Amount")
    self:NetworkVar("Int", 9, "Perf_THC")


    if (SERVER) then

        self:SetOutput(NULL)
        self:SetWaterSource(NULL)

        self:SetWater(0)
        self:SetLight(0)
        self:SetNutritionID(-1)
        self:SetSeed(-1)

        self:SetTemperatur(0)

        self:SetHasSoil(false)
        self:SetHasPlague(false)
        self:SetHarvestReady(false)

        self:SetProgress(0)

        self:SetYieldAmount(0)

        self:SetPerf_Time(100)
        self:SetPerf_Amount(100)
        self:SetPerf_THC(100)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_splice_lab/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_seedlab.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Seed Lab"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "WeedA")
    self:NetworkVar("Entity", 1, "WeedB")

    self:NetworkVar("Int", 0, "SpliceStartTime")
    self:NetworkVar("String", 0, "SeedName")

    if (SERVER) then
        self:SetWeedA(NULL)
        self:SetWeedB(NULL)

        self:SetSpliceStartTime(-1)
        self:SetSeedName("nil")
    end
end

function ENT:Remove_WeedB(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.y > 0.6 and lp.y < 12.3 and lp.x < 2 and lp.x > 1 and lp.z < 65.9 and lp.z > 63 then

        return true
    else
        return false
    end
end

function ENT:Remove_WeedA(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.y > -12.5 and lp.y < -0.3 and lp.x < 2 and lp.x > 1 and lp.z < 65.9 and lp.z > 63 then
        return true
    else
        return false
    end
end


function ENT:SpliceWeed(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.y > -12.5 and lp.y < 12.5  and lp.x < 2 and lp.x > 1 and lp.z < 62.6 and lp.z > 60 then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_weedstick/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self:DrawShadow(false)
	self:SetBodygroup(0, math.random(0,3))

	self.LastProcess = -1
	self.NextSound = CurTime() + 2
	self.HSize = 200
end

function ENT:Draw()
	self:DrawModel()

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) then
		self:DrawInfo()
	end
end

function ENT:DrawInfo()

	local _dryStartTime = self:GetStartDryTime()

	if _dryStartTime ~= -1 then
		cam.Start3D2D(self:LocalToWorld(Vector(0, -5, 0)), Angle(0, EyeAngles().y - 90, -EyeAngles().x + 90), 0.05)

			local _dryTime = math.Clamp(CurTime() - _dryStartTime,0,zwf.config.DryStation.Duration)

			_dryTime = zwf.config.DryStation.Duration - _dryTime

			if _dryTime == 0 then

				local _progress = self:GetProgress()
				local _size = 200 - (200 / (zwf.config.DryStation.Harvest_Time * 4)) * _progress

				// Removal Sound
				if self.LastProcess ~= _progress and CurTime() > self.NextSound then
					self.LastProcess = _progress
					zwf.f.EmitSoundENT("zwf_cut_plant", self)
					self.NextSound = CurTime() + math.Rand(0.3,0.6)
				end


				self.HSize = math.Clamp(self.HSize + (200 / zwf.config.DryStation.Harvest_Time) * FrameTime(), 0, _size)

				draw.RoundedBox(90, -self.HSize / 2, -self.HSize / 2, self.HSize, self.HSize, zwf.default_colors["power"])
				draw.SimpleText("[E]", "zwf_seed_font01", 0, -50, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

			elseif _dryTime > 0 then


				local progress = (1 / zwf.config.DryStation.Duration) * _dryTime

				surface.SetDrawColor(zwf.default_colors["white01"])
				surface.SetMaterial(zwf.default_materials["clock_base"])
				surface.DrawTexturedRect(-90, -90, 180, 180)

				surface.SetDrawColor(zwf.default_colors["white01"])
				surface.SetMaterial(zwf.default_materials["clock_pointer"])
				surface.DrawTexturedRectRotated(0, 0, 180, 180, Lerp(progress, 0, 360))
			end
		cam.End3D2D()
	end
end

--PATH addons/enc_scripts/lua/es/sh_main.lua:
ES.Colors = {
    ['bg'] = Color(38, 38, 38),
    ['bar'] = Color(25, 25, 25),
    ['main'] = Color(0, 117, 223),
    ['green'] = Color(46, 141, 13),
    ['red'] = Color(141, 13, 13),
    ['white'] = Color(255, 255, 255),
}

ES.Voting = {
    ['voteTime'] = 15,
    ['prepareTime'] = 15,
}
--PATH addons/itemstore_new/lua/itemstore/items/base_auto.lua:
﻿ITEM.Name = "Auto Item Base"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

ITEM.DontNetwork = {
    EntityData = true
}

function ITEM:SaveData(ent)
    self:SetModel(ent:GetModel())
    self:SetData("EntityData", duplicator.CopyEntTable(ent))
end

function ITEM:LoadData(ent)
    local data = self:GetData("EntityData")
    data.Pos = nil
    data.Angle = nil
    duplicator.DoGeneric(ent, data)

    if data.DT then
        timer.Simple(0, function()
            for k, v in pairs(data.DT) do
                ent.dt[k] = v
            end
        end)
    end
end
--PATH addons/itemstore_new/lua/itemstore/items/base_darkrp.lua:
﻿ITEM.Name = "DarkRP Item Base"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

function ITEM:CanPickup(pl, ent)
    if not ent.dt or not ent.dt.owning_ent then return true end

    if not itemstore.config.IgnoreOwner and ent:Getowning_ent() ~= pl then
        pl:ChatPrint("You can't pick that up, it's not your's!")

        return false
    end

    return true
end
--PATH addons/itemstore_new/lua/itemstore/items/money_printer.lua:
﻿ITEM.Name = itemstore.Translate("moneyprinter_name")
ITEM.Description = itemstore.Translate("moneyprinter_desc")
ITEM.Model = "models/props_c17/consolebox01a.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Factories
ITEM.Base = "base_darkrp"

function ITEM:SaveData(ent)
    self:SetData("Price", ent:Getprice())
    self:SetData("Owner", ent:Getowning_ent())
end

function ITEM:LoadData(ent)
    ent:Setprice(self:GetData("Price"))
    ent:Setowning_ent(self:GetData("Owner"))
end
--PATH addons/zeros_weedfarm/lua/itemstore/items/zwf_seed.lua:
ITEM.Name = "Seed"
ITEM.Description = "Desc"
ITEM.Model = "models/zerochain/props_weedfarm/zwf_weedseed.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false

--ITEM.MaxStack = 10
function ITEM:GetDescription()

	local Perf_Time = self:GetData("Perf_Time")
	local Perf_Amount = self:GetData("Perf_Amount")
	local Perf_THC = self:GetData("Perf_THC")

	local seedData = zwf.config.Plants[self:GetData("SeedID")]

	Perf_Time = 100 - (Perf_Time - 100)
	Perf_Time = Perf_Time * 0.01
	Perf_Time = seedData.Grow.Duration * Perf_Time
	Perf_Time = math.Round(Perf_Time) .. "s"

	Perf_Amount = Perf_Amount * 0.01
	Perf_Amount = seedData.Grow.MaxYieldAmount * Perf_Amount
	Perf_Amount = math.Round(Perf_Amount) .. zwf.config.UoW

	Perf_THC = Perf_THC * 0.01
	Perf_THC = seedData.thc_level * Perf_THC
	Perf_THC = math.Round(Perf_THC) .. "%"

	local desc = zwf.language.VGUI["Duration"] .. ": " .. tostring(Perf_Time) .. "\n" .. zwf.language.VGUI["HarvestAmount"] .. ": " .. tostring(Perf_Amount) .. "\n" .. zwf.language.General["THC"] .. ": " .. tostring(Perf_THC)

	return self:GetData("Description", desc)
end


function ITEM:GetName()
	local name = self:GetData("SeedName") .. " x" .. self:GetData("SeedCount") .. "\n[" .. zwf.config.Plants[self:GetData("SeedID")].name .. "]"

	return self:GetData("Name", name)
end

function ITEM:SaveData(ent)
	self:SetData("SeedID", ent:GetSeedID())
	self:SetData("SeedName", ent:GetSeedName())
	self:SetData("Perf_Time", ent:GetPerf_Time())
	self:SetData("Perf_Amount", ent:GetPerf_Amount())
	self:SetData("Perf_THC", ent:GetPerf_THC())

	self:SetData("SeedCount", ent:GetSeedCount())

	self:SetData("ZWFOwner", zwf.f.GetOwnerID(ent))
end

function ITEM:LoadData(ent)
	ent:SetSeedID(self:GetData("SeedID"))
	ent:SetSeedName(self:GetData("SeedName"))
	ent:SetPerf_Time(self:GetData("Perf_Time"))
	ent:SetPerf_Amount(self:GetData("Perf_Amount"))
	ent:SetPerf_THC(self:GetData("Perf_THC"))

	ent:SetSeedCount(self:GetData("SeedCount"))

	zwf.f.SetOwnerByID(ent, self:GetData("ZWFOwner"))

	timer.Simple(0.25,function()
		if IsValid(ent) then
			ent:OnItemStoreDrop()
		end
	end)
end

--PATH addons/itemstore_new/lua/itemstore/modules/shops/cl_init.lua:
function itemstore.shops.OpenShop( ent, con_id )
	local con = itemstore.containers.Get( con_id )

	if not IsValid( ent ) or not con then return end

	local p = vgui.Create( "ItemStoreShop" )
	p:SetEntity( ent )
	p:SetContainerID( con_id )
	p:SetSize( 600, 500 )
	p:Center()
	p:MakePopup()
end

function itemstore.shops.PriceItem( con_id, slot, price )
end

net.Receive( "ItemStoreOpenShop", function()
	itemstore.shops.OpenShop( net.ReadEntity(), net.ReadUInt( 32 ) )
end )

net.Receive( "ItemStorePriceShopItem", function()
	local ent = net.ReadEntity()
	local slot = net.ReadUInt( 16 )

	local title = "Продажа предмета"
	local message = "Укажите сумму для продажи!"
	local default = 100

	Derma_StringRequest( title, message, default, function( price )
		if not IsValid( ent ) then return end

		price = tonumber( price )

		if not price then
			return
		end

		net.Start( "ItemStorePriceShopItem" )
			net.WriteEntity( ent )
			net.WriteUInt( slot, 16)
			net.WriteUInt( price, 32 )
		net.SendToServer()
	end ):SetSkin( "itemstore" )
end )
--PATH addons/itemstore_new/lua/itemstore/vgui/admin.lua:
﻿local PANEL = {}

function PANEL:Init()
    self:SetTitle(itemstore.Translate("admin_title"))
    self:SetSkin("itemstore")
    self.Scroll = vgui.Create("DScrollPanel", self)
    self.Scroll:Dock(FILL)
    self.List = vgui.Create("DListLayout", self.Scroll)
    self.List:Dock(FILL)

    for _, pl in player.Iterator() do
        local b = self.List:Add("DButton")
        b:SetText(pl:Name())
        b:DockMargin(0, 0, 0, 2)

        function b.DoClick()
            local menu = DermaMenu()

            menu:AddOption(itemstore.Translate("inventory"), function()
                net.Start("ItemStoreAdminInventory")
                net.WriteEntity(pl)
                net.SendToServer()
            end)

            menu:AddOption(itemstore.Translate("bank"), function()
                net.Start("ItemStoreAdminBank")
                net.WriteEntity(pl)
                net.SendToServer()
            end)

            menu:Open()
        end
    end
end

vgui.Register("ItemStoreAdmin", PANEL, "DFrame")
--PATH addons/itemstore_new/lua/itemstore/vgui/containerwindow.lua:
﻿local PANEL = {}

if itemstore.config.UseNewUI then
    function PANEL:Init()
        self:SetSkin("itemstore")
        self.Container = vgui.Create("ItemStoreNewContainer", self)
        self.Container:Dock(FILL)
    end

    function PANEL:Refresh()
        self.Container:Refresh()
    end

    function PANEL:SetContainerID(id)
        self.Container:SetContainerID(id)
        local con = itemstore.containers.Get(id)
        if not con then return end
        local p = 1
        local sw, sh = 48, 48
        local cw, ch = con:GetWidth(), con:GetHeight()
        local w, h = 10 + (sw + p) * cw, 34 + 37 + (sh + p) * ch
        self:SetSize(w, h)
    end

    function PANEL:GetContainerID()
        return self.Container:GetContainerID()
    end
else
    function PANEL:Init()
        self:SetSkin("itemstore")
        self.Container = vgui.Create("ItemStoreContainer", self)
        self.Container:SizeToContents()
    end

    function PANEL:PerformLayout()
        self:SetSize(self.Container:GetWide() + 10, self.Container:GetTall() + 32)
        self.Container:SetPos(5, 27)
        self.BaseClass.PerformLayout(self)
    end

    function PANEL:Refresh()
        self.Container:Refresh()
    end

    function PANEL:SetContainerID(id)
        self.Container:SetContainerID(id)
    end

    function PANEL:GetContainerID()
        return self.Container:GetContainerID()
    end
end

vgui.Register("ItemStoreContainerWindow", PANEL, "DFrame")
--PATH addons/itemstore_new/lua/itemstore/vgui/newcontainerwindow.lua:
﻿local PANEL = {}

function PANEL:Init()
    self:SetSkin("itemstore")
    self.Container = vgui.Create("ItemStoreNewContainer", self)
    self.Container:Dock(FILL)
end

function PANEL:Refresh()
    self.Container:Refresh()
end

function PANEL:SetContainerID(id)
    self.Container:SetContainerID(id)
    local con = itemstore.containers.Get(id)
    if not con then return end
    local p = 1
    local sw, sh = 48, 48
    local cw, ch = con:GetWidth(), con:GetHeight()
    local w, h = 10 + (sw + p) * cw, 34 + 37 + (sh + p) * ch
    self:SetSize(w, h)
end

function PANEL:GetContainerID()
    return self.Container:GetContainerID()
end

vgui.Register("ItemStoreNewContainerWindow", PANEL, "DFrame")
--PATH addons/deceive/lua/deceive/translations/fr.lua:

return {
	-- UI

	disguise_ui_title				= "Deceive - Déguisement",

	disguise_ui_row_name			= "Nom",
	disguise_ui_row_job 			= "Job",

	disguise_ui_info_player 		= "Joueur:",
	disguise_ui_info_job 			= "Job:",
	disguise_ui_info_gunlicensed	= "Licensé:",
	disguise_ui_info_wanted			= "Recherché:",
	disguise_ui_info_arrested		= "Détenu:",

	disguise_ui_yes 				= "Oui",
	disguise_ui_no 					= "Non",

	disguise_ui_action				= "Se déguiser",

	disguise_ui_undisguise1			= "/%s dans le chat pour retirer",
	disguise_ui_undisguise2			= "assignez '%s' à une touche dans la console pour rapidement retirer",

	disguise_ui_invalid_target		= "Votre cible n'est plus valide !",

	-- Server notifications

	disguise_successful				= "Vous vous êtes déguisé en %s.",
	disguise_removed 				= "Vous avez retiré votre déguisement.",

	disguise_removed_jobchange		= "Votre déguisement a été retiré car vous avez changé de job.",
	disguise_warn_disconnect 		= "ATTENTION: Le joueur en qui vous étiez déguisé vient de se déconnecter !",
	disguise_blown					= "Votre déguisement est ruiné car vous avez tiré avec une arme !",

	disguise_cooldown				= "Vous pouvez vous redéguiser dans %s.",
	disguise_disallowed_as			= "Vous ne pouvez pas vous déguiser avec votre job actuel. (%s)",
	disguise_disallowed_to			= "Vous ne pouvez pas vous déguiser en cette personne en raison de leur job actuel. (%s)",
	disguise_self 					= "Vous ne pouvez pas vous déguiser en vous même...",
	disguise_none 					= "Vous n'avez aucun déguisement !",

	disguise_drawer_usedup			= "La commode est à court de kits de déguisement !",

	-- Disguise SWEP help

	swep_disguise_briefcase 		= "Malette à déguisement",
	swep_disguise_briefcase_title	= "Deceive - Malette à déguisement",
	swep_disguise_briefcase_text	= "Déguisez vous en n'importe qui avec les assortiments de vêtements contenus dans cette malette, trompez les alentours et semez le chaos dans le monde !",
	swep_disguise_briefcase_help1	= "Clic gauche: Ouvrir le menu de déguisement",
	swep_disguise_briefcase_help2	= "Recharger: Retirer votre déguisement",
}


--PATH addons/deceive/lua/deceive/cl_interface.lua:

if IsValid(deceive.GUI) then
	deceive.GUI:Remove()
end

local cmd = deceive.Config and deceive.Config.UndisguiseCommand or "undisguise"

surface.CreateFont("deceive.title", {
	font = "Roboto Cn",
	size = 21,
	weight = 0
})

surface.CreateFont("deceive.line", {
	font = "Roboto Cn",
	size = 16,
	weight = 0
})

surface.CreateFont("deceive.line2", {
	font = "Roboto",
	size = 12,
	weight = 800
})

surface.CreateFont("deceive.close", {
	font = "Trebuchet",
	size = 14,
	weight = 800
})

surface.CreateFont("deceive.close2", {
	font = "Trebuchet",
	size = 10,
	weight = 800
})

local L = deceive.Translate

local PANEL = {}

function PANEL:Init()
	self:SetSize(400, 368)
	self:Center()

	self.PlayerList = vgui.Create("DListView", self)
	self.PlayerList:Dock(LEFT)
	self.PlayerList:DockMargin(8, 28 + 8, 8, 8)
	self.PlayerList:SetWide(math.ceil(self:GetWide() * 0.58 - 12))

	self.PlayerList:SetMultiSelect(false)
	self.PlayerList:AddColumn(L"disguise_ui_row_name")
	self.PlayerList:AddColumn(L"disguise_ui_row_job")

	self:RefreshList()
	function self.PlayerList.OnRowSelected(_, _, line)
		local ply = line.Player
		if not IsValid(ply) then
			self:RefreshList()
			return
		end

		self.Player = ply

		if not self.PlayerModel:IsVisible() then
			self.PlayerModel:SetVisible(true)
			self.Info:SetVisible(true)
		end
		self.PlayerModel:SetModel(ply:GetModel())
		self.PlayerModel:LayoutEntity()
		self.PlayerModel.Entity.GetPlayerColor = function()
			return ply:GetPlayerColor()
		end

		local yes, no = L"disguise_ui_yes", L"disguise_ui_no"
		local txt =  L"disguise_ui_info_player" .. " " .. ply:Nick(true) .. "\n"
		txt = txt .. L"disguise_ui_info_job" .. " " .. ply:getDarkRPVar("job", true) .. "\n"
		txt = txt .. L"disguise_ui_info_gunlicensed" .. " " .. (ply:getDarkRPVar("HasGunlicense", true) and yes or no) .. "\n"
		txt = txt .. L"disguise_ui_info_wanted" .. " " .. (ply:getDarkRPVar("wanted", true) and yes or no) .. "\n"
		txt = txt .. L"disguise_ui_info_arrested" .. " " .. (ply:getDarkRPVar("Arrested", true) and yes or no)
		self.Info:SetText(txt)
		self.Info:SizeToContents()

		self.Disguise:SetVisible(true)
	end

	self.RightSide = vgui.Create("EditablePanel", self)
	self.RightSide:Dock(RIGHT)
	self.RightSide:DockMargin(8, 28 + 8, 8, 8)
	self.RightSide:SetWide(math.ceil(self:GetWide() * 0.42 - 12))

	self.PlayerModel = vgui.Create("DModelPanel", self.RightSide)
	self.PlayerModel:Dock(TOP)
	self.PlayerModel:SetTall(150)
	self.PlayerModel:SetVisible(false)
	self.PlayerModel:SetFOV(12.5)
	function self.PlayerModel:LayoutEntity()
		local head = self.Entity:LookupBone("ValveBiped.Bip01_Head1")

		local headPos
		if head then
			headPos = self.Entity:GetBonePosition(head)
			self.Entity:ManipulateBoneAngles(head, Angle(-10, -5, -20))
		else
			local mins, maxs = self.Entity:GetModelBounds()
			headPos = maxs * 0.85 + Vector(-2.5, 0, 0)
		end
		self:SetLookAt(headPos + Vector(0, 0, 1.5))

		local vec = self.Entity:GetAngles():Forward() * 20 + self.Entity:GetAngles():Up() * 62.5 + self.Entity:GetAngles():Right() * 12
		self.Entity:SetEyeTarget(vec)
		self.Entity:SetPos(Vector(0, -2, 0))
		self.Entity:SetAngles(Angle(5, 70, 0))
	end

	self.Info = vgui.Create("DLabel", self.RightSide)
	self.Info:Dock(TOP)
	self.Info:DockMargin(0, 2, 0, 0)
	self.Info:SetVisible(false)
	self.Info:SetFont("deceive.line")
	self.Info:SetTextColor(Color(255, 255, 255, 255))

	self.Disguise = vgui.Create("DButton", self.RightSide)
	self.Disguise:Dock(BOTTOM)
	self.Disguise:SetVisible(false)
	self.Disguise:SetText(L"disguise_ui_action")
	self.Disguise:SetImage("icon16/briefcase.png")
	function self.Disguise.DoClick()
		if not IsValid(self.Player) then
			notification.AddLegacy(L"disguise_ui_invalid_target", NOTIFY_ERROR, 5)
			-- notification.AddLegacy("Your target isn't valid anymore!", NOTIFY_ERROR, 5)
			self:RefreshList()
			return
		end

		net.Start("deceive.interface")
			net.WriteUInt(self.Player:UserID(), 32)
		net.SendToServer()
		self:Remove()
	end

	self.Info2 = vgui.Create("DLabel", self.RightSide)
	self.Info2:Dock(BOTTOM)
	self.Info2:DockMargin(0, 0, 0, 2)
	-- self.Info2:SetVisible(false)
	self.Info2:SetFont("deceive.line2")
	self.Info2:SetTextColor(Color(255, 255, 255, 255))
	self.Info2:SetWrap(true)
	self.Info2:SetAutoStretchVertical(true)
	self.Info2:SetText(
		string.format(L"disguise_ui_undisguise1", cmd) .. "\n" ..
		string.format(L"disguise_ui_undisguise2", cmd)
	)
	-- self.Info2:SetText("/" .. cmd .. " in chat to remove\nbind '" .. cmd .. "' to a key (through console) to quickly remove")
	self.Info2:SizeToContents()

	self.Close = vgui.Create("DButton", self)
	self.Close:SetSize(40, 20)
	function self.Close.DoClick()
		self:Remove()
	end

	self:Theme()

	self:MakePopup()
	self:SetKeyboardInputEnabled(false)
	self:SetMouseInputEnabled(true)

	self:SetVisible(false)
end

function PANEL:PerformLayout()
	self.Close:SetPos(self:GetWide() - self.Close:GetWide() - 16, 1)
end

function PANEL:RefreshList()
	self.PlayerList:Clear()
	for _, ply in next, player.GetAll() do
		if ply:UserID() ~= LocalPlayer():UserID() then
			local line = self.PlayerList:AddLine(ply:Nick(true), team.GetName(ply:Team(true)))
			line.Player = ply
		end
	end
	self.Players = player.GetCount()
end

local gradient_u = Material("vgui/gradient-u.png")
function PANEL:Theme()
	function self.Close:Paint(w, h)
		surface.SetDrawColor(152, 25, 29)
		surface.DrawRect(0, 0, w, h - 1)
		surface.DrawRect(1, h - 1, w - 2, 1)

		local col = Color(0, 0, 0, 0)
		if self:IsHovered() and self.Depressed then
			col = Color(0, 0, 0, 64)
		elseif self:IsHovered() then
			col = Color(255, 255, 255, 3)
		end
		surface.SetDrawColor(col)
		surface.DrawRect(0, 0, w, h)

		surface.SetFont("deceive.close")
		local txt = "✕" -- x, ×, X, ✕, ☓, ✖, ✗, ✘, etc.
		local txtW, txtH = surface.GetTextSize(txt)
		draw.SimpleTextOutlined(txt, "deceive.close", -2 + w * 0.5 - txtW * 0.5, h * 0.5 - txtH * 0.5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 1, Color(0, 0, 0, 170))

		return true
	end

	self.PlayerList:SetHeaderHeight(24)
	function self.PlayerList:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(1, 1, w - 2, h - 2)

		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 1, 1, h - 2) -- left
		surface.DrawRect(w - 1, 1, 1, h - 2) -- right
		surface.DrawRect(1, 0, w - 2, 1) -- top
		surface.DrawRect(1, h - 1, w - 2, 1) -- bottom
	end
	function self.PlayerList.VBar:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
	end
	function self.PlayerList.VBar.btnGrip:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(1, 1, w - 2, h - 2)

		if self.Depressed then
			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(1, 1, w - 2, h - 2)
		elseif self:IsHovered() then
			surface.SetDrawColor(255, 255, 255, 2)
			surface.DrawRect(1, 1, w - 2, h - 2)
		end

		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 1, 1, h - 2) -- left
		surface.DrawRect(w - 1, 1, 1, h - 2) -- right
		surface.DrawRect(1, 0, w - 2, 1) -- top
		surface.DrawRect(1, h - 1, w - 2, 1) -- bottom
	end
	for k, v in next, {"Up", "Down"} do
		self.PlayerList.VBar["btn" .. v].Paint = function(self, w, h)
			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(1, 1, w - 2, h - 2)

			if self.Depressed then
				surface.SetDrawColor(0, 0, 0, 170)
				surface.DrawRect(1, 1, w - 2, h - 2)
			elseif self:IsHovered() then
				surface.SetDrawColor(255, 255, 255, 2)
				surface.DrawRect(1, 1, w - 2, h - 2)
			end

			surface.SetFont("deceive.close2")
			local txt = k == 1 and "▲" or "▼" -- x, ×, X, ✕, ☓, ✖, ✗, ✘, etc.
			local txtW, txtH = surface.GetTextSize(txt)
			draw.SimpleTextOutlined(txt, "deceive.close2", -1 + w * 0.5 - txtW * 0.5, h * 0.5 - txtH * 0.5, Color(230, 230, 255, 192), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 1, Color(0, 0, 0, 127))

			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 1, 1, h - 2) -- left
			surface.DrawRect(w - 1, 1, 1, h - 2) -- right
			surface.DrawRect(1, 0, w - 2, 1) -- top
			surface.DrawRect(1, h - 1, w - 2, 1) -- bottom
		end
	end

	for k, column in next, self.PlayerList.Columns do
		function column.Header:Paint(w, h)
			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)

			surface.SetMaterial(gradient_u)
			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawTexturedRect(1, 1, w - 2, h - 2)

			if self.Depressed then
				surface.SetDrawColor(0, 0, 0, 170)
				surface.DrawRect(1, 1, w - 2, h - 2)
			elseif self:IsHovered() then
				surface.SetDrawColor(255, 255, 255, 2)
				surface.DrawRect(1, 1, w - 2, h - 2)
			end

			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawOutlinedRect(0, 0, w, h)

			surface.SetFont("deceive.line")
			local txt = self:GetText()
			local txtW, txtH = surface.GetTextSize(txt)
			surface.SetTextPos(w * 0.5 - txtW * 0.5, h * 0.5 - txtH * 0.5)
			surface.SetTextColor(255, 255, 255, 255)
			surface.DrawText(txt)

			return true
		end
	end

	for k, line in next, self.PlayerList.Lines do
		function line:Paint(w, h)
			local ply = line.Player
			if not IsValid(ply) then self:Remove() end

			-- local col = Color(120, 120, 180, 0)
			local col = table.Copy(ply.getJobTable and ply:getJobTable(true).color or team.GetColor(ply:Team(true)))
			col.a = 10
			if self:IsHovered() and self:IsSelected() or self:IsSelected() then
				col.a = 50
			elseif self:IsHovered() or self:IsSelected() then
				col.a = 25
			end
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w - 1, h)
		end

		for _, column in next, line.Columns do
			column:SetFont("deceive.line")
			function column:UpdateColours()
				if self:GetParent():IsLineSelected() then
					return self:SetTextStyleColor(Color(255, 255, 255, 255))
				end

				return self:SetTextStyleColor(Color(255, 255, 225, 255))
			end
		end
	end

	function self.PlayerModel:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)

		DModelPanel.Paint(self, w, h)

		DisableClipping(true)

		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(-1, 0, 1, h) -- left
		surface.DrawRect(w, 0, 1, h) -- right
		surface.DrawRect(0, -1, w, 1) -- top
		surface.DrawRect(0, h, w, 1) -- bottom

		DisableClipping(false)
	end

	function self.Disguise:Paint(w, h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)

		surface.SetMaterial(gradient_u)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawTexturedRect(1, 1, w - 2, h - 2)

		if self.Depressed then
			surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(1, 1, w - 2, h - 2)
		elseif self:IsHovered() then
			surface.SetDrawColor(255, 255, 255, 2)
			surface.DrawRect(1, 1, w - 2, h - 2)
		end

		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawOutlinedRect(0, 0, w, h)

		surface.SetFont("deceive.line")
		local txt = self:GetText()
		local txtW, txtH = surface.GetTextSize(txt)
		surface.SetTextPos(w * 0.5 - txtW * 0.5, h * 0.5 - txtH * 0.5)
		surface.SetTextColor(255, 255, 255, 255)
		surface.DrawText(txt)

		return true
	end
end

function PANEL:Paint(w, h)
	surface.SetDrawColor(0, 0, 0, 170)
	surface.DrawRect(1, 1, w - 2, h - 2)

	surface.SetDrawColor(0, 0, 0, 170)
	surface.DrawRect(1, 1, w - 2, 28)

	surface.SetDrawColor(0, 0, 0, 170)
	surface.DrawRect(0, 1, 1, h - 2) -- left
	surface.DrawRect(w - 1, 1, 1, h - 2) -- right
	surface.DrawRect(1, 0, w - 2, 1) -- top
	surface.DrawRect(1, h - 1, w - 2, 1) -- bottom

	surface.SetFont("deceive.title")
	local txt = L"disguise_ui_title"
	local txtW, txtH = surface.GetTextSize(txt)
	surface.SetTextPos(w * 0.5 - txtW * 0.5, 1 + 28 * 0.5 - txtH * 0.5)
	surface.SetTextColor(255, 255, 255, 255)
	surface.DrawText(txt)
end

function PANEL:Show()
	self:SetVisible(true)
end

function PANEL:Hide()
	self:SetVisible(false)
end

function PANEL:Think()
	if not IsValid(self.Entity) then self:Remove() return end

	if LocalPlayer():GetPos():Distance(self.Entity:GetPos()) > 95 then
		self:Remove()
		return
	end

	if self.Players ~= player.GetCount() then
		self:RefreshList()
		self:Theme()
	end
end

vgui.Register("deceive.interface", PANEL, "EditablePanel")

net.Receive("deceive.interface", function()
	if not IsValid(deceive.GUI) then
		deceive.GUI = vgui.Create("deceive.interface")
	end

	local entIndex = net.ReadUInt(32)
	local ent = Entity(entIndex)
	if not IsValid(ent) then return end

	deceive.GUI.Entity = ent
	deceive.GUI:Show()
end)

net.Receive("deceive.notify", function()
	local str = net.ReadString()
	local typ = net.ReadUInt(8)
	local time = net.ReadUInt(8)
	local extra = net.ReadTable()
	local _str = string.format(L(str), unpack(extra))
	notification.AddLegacy(_str, typ, time)
	print(_str)
end)

concommand.Add(cmd, function()
	-- lazy but should do the trick nicely
	RunConsoleCommand("say", "/" .. cmd)
end)

--PATH addons/bricks_gangs/lua/bricks_server/bricks_gangs/sh_devconfig.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame or use the f4menu
    !!WARNING!!
]]--

BRICKS_SERVER.DEVCONFIG.GangURLWhitelist = {
    "https://i.imgur.com/"
}

BRICKS_SERVER.DEVCONFIG.GangRankLimit = 30
BRICKS_SERVER.DEVCONFIG.GangPrinterнServerTime = 0.1 -- The decimal to reduce the server time by for each server, e.g. 0.1 would make the added time 10% less for server 2 and 20% less for server 3.

BRICKS_SERVER.DEVCONFIG.GangNameCharMin = 4
BRICKS_SERVER.DEVCONFIG.GangNameCharMax = 16
BRICKS_SERVER.DEVCONFIG.GangIconCharLimit = 200
BRICKS_SERVER.DEVCONFIG.GangNextEditTime = 1
BRICKS_SERVER.DEVCONFIG.GangPermissions = {
    ["DepositMoney"] = { BRICKS_SERVER.Func.L( "gangDepositMoney" ), BRICKS_SERVER.Func.L( "gangBalance" ) },
    ["WithdrawMoney"] = { BRICKS_SERVER.Func.L( "gangWithdrawMoney" ), BRICKS_SERVER.Func.L( "gangBalance" ) },
    ["EditRoles"] = { BRICKS_SERVER.Func.L( "gangEditRoles" ), BRICKS_SERVER.Func.L( "gangSettings" ) },
    ["EditSettings"] = { BRICKS_SERVER.Func.L( "gangEditSettings" ), BRICKS_SERVER.Func.L( "gangSettings" ) },
    ["InvitePlayers"] = { BRICKS_SERVER.Func.L( "gangInvitePlayers" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["KickPlayers"] = { BRICKS_SERVER.Func.L( "gangKickPlayers" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["ChangePlayerRoles"] = { BRICKS_SERVER.Func.L( "gangChangeRank" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["PurchaseUpgrades"] = { BRICKS_SERVER.Func.L( "gangPurchaseUpgrades" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["EditInbox"] = { BRICKS_SERVER.Func.L( "gangAcceptDeclineInbox" ), BRICKS_SERVER.Func.L( "gangManagement" ) },
    ["SendMessages"] = { BRICKS_SERVER.Func.L( "gangSendChatMessages" ), BRICKS_SERVER.Func.L( "gangChatLower" ) }
}

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "associations" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangPermissions["RequestAssociations"] = { BRICKS_SERVER.Func.L( "gangAssociationSend" ), BRICKS_SERVER.Func.L( "gangAssociations" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["AcceptAssociations"] = { BRICKS_SERVER.Func.L( "gangAssociationAccept" ), BRICKS_SERVER.Func.L( "gangAssociations" ) }
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangPermissions["DepositItem"] = { BRICKS_SERVER.Func.L( "gangDepositItems" ), BRICKS_SERVER.Func.L( "gangStorage" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["WithdrawItem"] = { BRICKS_SERVER.Func.L( "gangWithdrawItems" ), BRICKS_SERVER.Func.L( "gangStorage" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["ViewItem"] = { BRICKS_SERVER.Func.L( "gangViewStorage" ), BRICKS_SERVER.Func.L( "gangStorage" ) }
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "printers" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangPermissions["PurchasePrinters"] = { BRICKS_SERVER.Func.L( "gangPurchasePrinters" ), BRICKS_SERVER.Func.L( "gangPrinters" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["UpgradePrinters"] = { BRICKS_SERVER.Func.L( "gangUpgradePrinters" ), BRICKS_SERVER.Func.L( "gangPrinters" ) }
    BRICKS_SERVER.DEVCONFIG.GangPermissions["PlacePrinters"] = { BRICKS_SERVER.Func.L( "gangPlacePrinters" ), BRICKS_SERVER.Func.L( "gangPrinters" ) }

    BRICKS_SERVER.DEVCONFIG.GangPrinterSlots = 6
    BRICKS_SERVER.DEVCONFIG.GangPrinterW = 807*0.8
    BRICKS_SERVER.DEVCONFIG.GangPrinterH = 1018*0.8
end

BRICKS_SERVER.DEVCONFIG.GangUpgrades = {
    ["MaxMembers"] = {
        Name = BRICKS_SERVER.Func.L( "gangMaxMembers" ),
        Format = function( reqInfo )
            return (reqInfo[1] or 0) .. " " .. BRICKS_SERVER.Func.L( "gangMembers" )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangMembers" ), "integer" }
        }
    },
    ["MaxBalance"] = { 
        Name = BRICKS_SERVER.Func.L( "gangMaxBalance" ), 
        Format = function( reqInfo )
            return DarkRP.formatMoney( reqInfo[1] or 0 )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangBalance" ), "integer" }
        }
    },
    ["Health"] = { 
        Name = BRICKS_SERVER.Func.L( "gangIncreasedHealth" ), 
        Format = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangXHP", (reqInfo[1] or 0) )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangExtraHealth" ), "integer" }
        }
    },
    ["Armor"] = { 
        Name = BRICKS_SERVER.Func.L( "gangIncreasedArmor" ), 
        Format = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangXAP", (reqInfo[1] or 0) )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangExtraArmor" ), "integer" }
        }
    },
    ["Salary"] = { 
        Name = BRICKS_SERVER.Func.L( "gangIncreasedSalary" ), 
        Format = function( reqInfo )
            return "+" .. DarkRP.formatMoney( reqInfo[1] or 0 )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangExtraSalary" ), "integer" }
        }
    },
    ["Weapon"] = { 
        Name = BRICKS_SERVER.Func.L( "gangPermWeapon" ), 
        Unlimited = true,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangWeapon" ), "table", "weapons" }
        }
    }
}

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangUpgrades["StorageSlots"] = { 
        Name = BRICKS_SERVER.Func.L( "gangStorageSlots" ), 
        Format = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangXSlots", (reqInfo[1] or 0) )
        end,
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangSlots" ), "integer" }
        }
    }
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "achievements" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangAchievements = {
        ["Balance"] = {
            Name = BRICKS_SERVER.Func.L( "gangBalanceFull" ),
            Format = function( progress, goal )
                return DarkRP.formatMoney( progress ) .. "/" .. DarkRP.formatMoney( goal )
            end,
            GetProgress = function( gangTable )
                return gangTable.Money or 0
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "gangBalance" ), "integer" }
            }
        },
        ["Members"] = {
            Name = BRICKS_SERVER.Func.L( "gangMembersFull" ),
            Format = function( progress, goal )
                return progress .. "/" .. goal .. " " .. BRICKS_SERVER.Func.L( "gangMembers" )
            end,
            GetProgress = function( gangTable )
                return table.Count( gangTable.Members or {} )
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "gangMembers" ), "integer" }
            }
        },
        ["Level"] = {
            Name = BRICKS_SERVER.Func.L( "gangLevel" ),
            Format = function( progress, goal )
                return BRICKS_SERVER.Func.L( "level" ) .. " " .. progress .. "/" .. goal
            end,
            GetProgress = function( gangTable )
                return gangTable.Level or 0
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "level" ), "integer" }
            }
        }
    }

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
        BRICKS_SERVER.DEVCONFIG.GangAchievements["Storage"] = {
            Name = BRICKS_SERVER.Func.L( "gangStorageFull" ),
            Format = function( progress, goal )
                return progress .. "/" .. goal .. " " .. BRICKS_SERVER.Func.L( "gangItems" )
            end,
            GetProgress = function( gangTable )
                local itemCount = 0
                for k, v in pairs( gangTable.Storage or {} ) do
                    itemCount = itemCount+(v[1] or 0)
                end

                return itemCount
            end,
            GetGoal = function( reqInfo )
                return reqInfo[1] or 0
            end,
            ReqInfo = {
                [1] = { BRICKS_SERVER.Func.L( "gangItems" ), "integer" }
            }
        }
    end
end

BRICKS_SERVER.DEVCONFIG.GangNotifications = {
    ["GangInvite"] = {
        Name = BRICKS_SERVER.Func.L( "gangInvite" ),
        ReqInfo = {
            [1] = { "InviterGangID", "integer" },
            [2] = { "InviterGangName", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangInviteReceivedInbox", reqInfo[2] )
        end,
        AcceptFunc = function( reqInfo ) 
            net.Start( "BRS.Net.GangInviteAccept" )
                net.WriteUInt( reqInfo[1], 16 )
            net.SendToServer()
        end
    },
    ["AssociationInvite"] = {
        Name = BRICKS_SERVER.Func.L( "gangAssociationInvite" ),
        ReqInfo = {
            [1] = { "InviterGangID", "integer" },
            [2] = { "InviterGangName", "string" },
            [3] = { "AssociationType", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangAssociationInviteInbox", reqInfo[2], reqInfo[3] )
        end,
        AcceptFunc = function( reqInfo ) 
            net.Start( "BRS.Net.AcceptGangAssociation" )
                net.WriteUInt( reqInfo[1], 16 )
            net.SendToServer()
        end
    },
    ["AssociationCreated"] = {
        Name = BRICKS_SERVER.Func.L( "gangAssociationCreated" ),
        ReqInfo = {
            [1] = { "OtherGangID", "integer" },
            [2] = { "OtherGangName", "string" },
            [3] = { "AssociationType", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangAssociationCreatedInbox", reqInfo[3], reqInfo[2] )
        end
    },
    ["AssociationDissolved"] = {
        Name = BRICKS_SERVER.Func.L( "gangAssociationDissolved" ),
        ReqInfo = {
            [1] = { "OtherGangID", "integer" },
            [2] = { "OtherGangName", "string" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.L( "gangAssociationDissolvedInbox", reqInfo[2] )
        end
    },
    ["AdminMail"] = {
        Name = BRICKS_SERVER.Func.L( "gangAdminNotification" ),
        ReqInfo = {
            [1] = { "Header", "string" },
            [2] = { "Description", "string" }
        },
        FormatHeader = function( reqInfo )
            return reqInfo[1]
        end,
        FormatDescription = function( reqInfo )
            return reqInfo[2]
        end
    },
    ["Achievement"] = {
        Name = BRICKS_SERVER.Func.L( "gangInboxAchievement" ),
        ReqInfo = {
            [1] = { "Achievement Key", "integer" }
        },
        FormatDescription = function( reqInfo )
            local achievementConfig = BRICKS_SERVER.CONFIG.GANGS.Achievements[reqInfo[1]]

            return BRICKS_SERVER.Func.L( "gangInboxAchievementCompleted", achievementConfig.Name )
        end
    },
    ["AchievementReward"] = {
        Name = BRICKS_SERVER.Func.L( "gangInboxAchievement" ),
        ReqInfo = {
            [1] = { "Achievement Key", "integer" },
            [2] = { "Achievement Rewards", "table" }
        },
        FormatDescription = function( reqInfo )
            local rewardString = ""
            for k, v in pairs( reqInfo[2] or {} ) do
                local devConfigReward = BRICKS_SERVER.DEVCONFIG.GangRewards[k]

                if( not devConfigReward ) then continue end

                if( rewardString == "" ) then
                    rewardString =  devConfigReward.FormatDescription( v )
                else
                    rewardString = rewardString .. ", " .. devConfigReward.FormatDescription( v )
                end
            end

            local achievementConfig = BRICKS_SERVER.CONFIG.GANGS.Achievements[reqInfo[1]]

            return BRICKS_SERVER.Func.L( "gangInboxAchievementCompletedReward", achievementConfig.Name, rewardString )
        end,
        AcceptFunc = function( reqInfo, inboxKey ) 
            net.Start( "BRS.Net.GangAchievementClaim" )
                net.WriteUInt( inboxKey, 16 )
            net.SendToServer()
        end
    }
}

BRICKS_SERVER.DEVCONFIG.GangRewards = {
    ["GangExperience"] = {
        Name = BRICKS_SERVER.Func.L( "gangExperienceFull" ),
        Color = Color( 22, 160, 133 ),
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "experience" ), "integer" }
        },
        FormatDescription = function( reqInfo )
            return BRICKS_SERVER.Func.FormatGangEXP( reqInfo[1] or 0 ) .. " " .. BRICKS_SERVER.Func.L( "exp" )
        end,
        RewardFunc = function( gangID, reqInfo )
            BRICKS_SERVER.Func.AddGangExperience( gangID, reqInfo[1] )

            return true
        end
    },
    ["GangBalance"] = {
        Name = BRICKS_SERVER.Func.L( "gangBalanceFull" ),
        Color = Color( 39, 174, 96 ),
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "money" ), "integer" }
        },
        FormatDescription = function( reqInfo )
            return DarkRP.formatMoney( reqInfo[1] or 0 )
        end,
        RewardFunc = function( gangID, reqInfo )
            BRICKS_SERVER.Func.AddGangBalance( gangID, reqInfo[1] )
        end
    }
}

hook.Add("bWhitelist:Init", "BricksServerHooks_bWhitelist:Init_Gang", function()
    BRICKS_SERVER.DEVCONFIG.GangRewards["bWhitelist"] = {
        Name = BRICKS_SERVER.Func.L( "gangJobWhitelist" ),
        Temporary = true,
        Color = Color( 52, 152, 219 ),
        ReqInfo = {
            [1] = { BRICKS_SERVER.Func.L( "gangJobs" ), "custom", function( rewardTable, rewardKey, reqInfoKey, currentReqInfo )
                BRICKS_SERVER.Func.CreateTeamSelector( (currentReqInfo or {}), BRICKS_SERVER.Func.L( "gangJobsSelect" ), function( teamTable ) 
                    if( table.Count( teamTable ) > 0 ) then
                        rewardTable[rewardKey] = rewardTable[rewardKey] or {}
                        rewardTable[rewardKey][reqInfoKey] = teamTable
                    else
                        rewardTable[rewardKey] = nil
                    end
                end, function() end )
            end }
        },
        FormatDescription = function( reqInfo )
            local jobString = ""
            for k, v in pairs( reqInfo[1] or {} ) do
                for key, val in pairs( RPExtraTeams ) do
                    if( val.command == k ) then
                        if( jobString == "" ) then
                            jobString = val.name
                        else
                            jobString = jobString .. ", " .. val.name
                        end
                        break
                    end
                end
            end

            return jobString
        end,
        RewardFunc = function( gangID, reqInfo )
            local teams = {}
            for k, v in pairs( reqInfo[1] or {} ) do
                for key, val in pairs( RPExtraTeams ) do
                    if( val.command == k ) then
                        table.insert( teams, k )
                        break
                    end
                end
            end

            local gangTable = (BRICKS_SERVER_GANGS or {})[gangID] or {}

            for k, v in pairs( teams ) do
                for key, val in pairs( gangTable.Members ) do
                    GAS.JobWhitelist:AddToWhitelist( v, GAS.JobWhitelist.LIST_TYPE_STEAMID, key )
                end
            end

            return true
        end,
        UnRewardFunc = function( gangID, reqInfo )
            local teams = {}
            for k, v in pairs( reqInfo[1] or {} ) do
                for key, val in pairs( RPExtraTeams ) do
                    if( val.command == k ) then
                        table.insert( teams, k )
                        break
                    end
                end
            end

            local gangTable = (BRICKS_SERVER_GANGS or {})[gangID] or {}

            for k, v in pairs( teams ) do
                for key, val in pairs( gangTable.Members ) do
                    GAS.JobWhitelist:RemoveFromWhitelist( v, GAS.JobWhitelist.LIST_TYPE_STEAMID, key )
                end
            end

            return true
        end
    }
end )

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "leaderboards" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangLeaderboards = {
        ["Experience"] = {
            Name = BRICKS_SERVER.Func.L( "experience" ),
            Color = Color( 22, 160, 133 ),
            FormatDescription = function( value )
                return BRICKS_SERVER.Func.FormatGangEXP( value or 0 ) .. " " .. BRICKS_SERVER.Func.L( "exp" )
            end,
            GetSortValue = function( gangTable )
                return gangTable.Experience or 0
            end
        },
        ["Members"] = {
            Name = BRICKS_SERVER.Func.L( "gangMembers" ),
            Color = Color( 41, 128, 185 ),
            FormatDescription = function( value )
                return (value or 0) .. " " .. (((value or 0) != 1 and BRICKS_SERVER.Func.L( "gangMembers" )) or BRICKS_SERVER.Func.L( "gangMember" ))
            end,
            GetSortValue = function( gangTable )
                return table.Count( gangTable.Members or {} )
            end
        },
        ["Balance"] = {
            Name = BRICKS_SERVER.Func.L( "gangBalance" ),
            Color = Color( 39, 174, 96 ),
            FormatDescription = function( value )
                return DarkRP.formatMoney( value or 0 )
            end,
            GetSortValue = function( gangTable )
                return gangTable.Money or 0
            end
        }
    }

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
        BRICKS_SERVER.DEVCONFIG.GangLeaderboards["StorageItems"] = {
            Name = BRICKS_SERVER.Func.L( "gangStorageItems" ),
            Color = Color( 231, 76, 60 ),
            FormatDescription = function( value )
                return (value or 0) .. " " .. (((value or 0) != 1 and BRICKS_SERVER.Func.L( "gangItems" )) or BRICKS_SERVER.Func.L( "gangItem" ))
            end,
            GetSortValue = function( gangTable )
                return table.Count( gangTable.Storage or {} )
            end
        }
    end
end

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "associations" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangAssociationTypes = {
        ["Allies"] = {
            Icon = "flag.png",
            Color = Color( 52, 152, 219 ),
            Query = BRICKS_SERVER.Func.L( "gangAllyRequest" )
        },
        ["War"] = {
            Icon = "gang_war.png",
            Color = Color( 231, 76, 60 ),
            Query = BRICKS_SERVER.Func.L( "gangWarRequest" )
        },
    }
end

BRICKS_SERVER.DEVCONFIG.GangAdminCmds = {
    -- [1] = {
    --     Name = BRICKS_SERVER.Func.L( "gangSetLevel" ),
    --     Icon = "levelling.png",
    --     ReqInfo = {
    --         [1] = { "Level", "integer", false, BRICKS_SERVER.Func.L( "gangSetLevelQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local newLevel = math.Clamp( reqInfo[1] or (gangTable.Level or 0), 0, BRICKS_SERVER.CONFIG.GANGS["Max Level"] )
    --         BRICKS_SERVER.Func.SetGangLevel( gangID, newLevel )
    --         BRICKS_SERVER.Func.SetGangExperience( gangID, BRICKS_SERVER.Func.GetGangExpToLevel( 0, newLevel ) )
    --         return BRICKS_SERVER.Func.L( "gangSetLevelMsg", (gangTable.Name or "NIL"), newLevel )
    --     end
    -- },
    -- [2] = {
    --     Name = BRICKS_SERVER.Func.L( "gangAddExperience" ),
    --     Icon = "gang_experience.png",
    --     ReqInfo = {
    --         [1] = { "Experience", "integer", false, BRICKS_SERVER.Func.L( "gangAddExperienceQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local experience = reqInfo[1] or (gangTable.Experience or 0)
    --         BRICKS_SERVER.Func.AddGangExperience( gangID, experience )
    --         return BRICKS_SERVER.Func.L( "gangAddExperienceMsg", BRICKS_SERVER.Func.FormatGangEXP( experience ), (gangTable.Name or "NIL") )
    --     end
    -- },
    -- [3] = {
    --     Name = BRICKS_SERVER.Func.L( "gangSetBalance" ),
    --     Icon = "balance.png",
    --     ReqInfo = {
    --         [1] = { "Money", "integer", false, BRICKS_SERVER.Func.L( "gangSetBalanceQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local newBalance = reqInfo[1] or (gangTable.Money or 0)
    --         BRICKS_SERVER.Func.SetGangBalance( gangID, newBalance )
    --         return BRICKS_SERVER.Func.L( "gangSetBalanceMsg", (gangTable.Name or "NIL"), DarkRP.formatMoney( newBalance ) )
    --     end
    -- },
    -- [4] = {
    --     Name = BRICKS_SERVER.Func.L( "gangAddBalance" ),
    --     Icon = "gang_add_money.png",
    --     ReqInfo = {
    --         [1] = { "Money", "integer", false, BRICKS_SERVER.Func.L( "gangAddBalanceQuery" ) }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local addBalance = reqInfo[1] or 0
    --         BRICKS_SERVER.Func.AddGangBalance( gangID, addBalance )
    --         return BRICKS_SERVER.Func.L( "gangAddBalanceMsg", DarkRP.formatMoney( addBalance ), (gangTable.Name or "NIL") )
    --     end
    -- },
    [1] = {
        Name = BRICKS_SERVER.Func.L( "gangViewMembers" ),
        Icon = "gang_viewmembers.png",
        ClientFunc = function( gangTable, gangID, panel )
            panel:ViewMembers()
        end
    },
    -- [6] = { -- Kick member
    --     ReqInfo = {
    --         [1] = { "MemberSteamID", "string" }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         if( gangTable.Owner == reqInfo[1] ) then
    --             return BRICKS_SERVER.Func.L( "gangCantKickOwner" )
    --         end

    --         local success = BRICKS_SERVER.Func.GangKickMember( gangID, reqInfo[1] )

    --         return (success and BRICKS_SERVER.Func.L( "gangKickSuccessAdmin" )) or BRICKS_SERVER.Func.L( "gangKickFailAdmin" )
    --     end
    -- },
    -- [7] = { -- Set member rank
    --     ReqInfo = {
    --         [1] = { "MemberSteamID", "string" },
    --         [2] = { "NewRank", "integer" }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         local success = BRICKS_SERVER.Func.GangMemberSetRank( gangID, reqInfo[1], reqInfo[2] )

    --         return (success and BRICKS_SERVER.Func.L( "gangSetRankSuccessAdmin" )) or BRICKS_SERVER.Func.L( "gangSetRankFailAdmin" )
    --     end
    -- },
    -- [8] = { -- Transfer ownership
    --     ReqInfo = {
    --         [1] = { "MemberSteamID", "string" }
    --     },
    --     ServerFunc = function( gangTable, gangID, reqInfo )
    --         if( gangTable.Owner == reqInfo[1] ) then
    --             return BRICKS_SERVER.Func.L( "gangMemberAlreadyOwner" )
    --         end

    --         if( not gangTable.Members or not gangTable.Members[reqInfo[1]] ) then 
    --             return BRICKS_SERVER.Func.L( "gangNotMember" )
    --         end
        
    --         BRICKS_SERVER.Func.UpdateGangTable( gangID, "Owner", reqInfo[1] )

    --         return BRICKS_SERVER.Func.L( "gangOwnershipTransferedAdmin" )
    --     end
    -- },
    [2] = {
        Name = BRICKS_SERVER.Func.L( "delete" ),
        Icon = "gang_delete.png",
        ClientFunc = function( gangTable, gangID, panel )
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "gangDeleteAdminQuery", string.upper( gangTable.Name or "" ) ), "", function( text ) 
                if( text == "Подтверждаю" ) then
                    net.Start( "BRS.Net.AdminGangCMD" )
                        net.WriteUInt( 2, 8 )
                        net.WriteUInt( gangID, 16 )
                        net.WriteTable( {} )
                    net.SendToServer()
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
        end,
        ServerFunc = function( gangTable, gangID, reqInfo )
            BRICKS_SERVER.Func.DeleteGangTable( gangID )

            return BRICKS_SERVER.Func.L( "gangDeleteSuccessAdmin", gangTable.Name )
        end
    }
}

if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "printers" ) ) then
    BRICKS_SERVER.DEVCONFIG.GangServerUpgradeTypes = {
        ["Cooling"] = {
            Name = "Cooling",
            Icon = Material( "bricks_server/gangprinter_upgrade_cooling.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Temperature Decrease", "integer" }
            },
            SetFunc = function( ent, server, tier, upgradeConfig )
                ent:SetNW2Int( "CoolingServer" .. server, tier )

                if( tier >= #upgradeConfig.Tiers/2 ) then
                    ent:SetBodygroup( 8+((server-1)*2), 1 )

                    if( tier >= #upgradeConfig.Tiers ) then
                        ent:SetBodygroup( 8+((server-1)*2)+1, 1 )
                    end
                end
            end,
            GetFunc = function( ent, server )
                return ent:GetNW2Int( "CoolingServer" .. server, 0 )
            end
        },
        ["Speed"] = {
            Name = "Speed",
            Icon = Material( "bricks_server/gangprinter_upgrade_speed.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Speed Increase", "integer" }
            },
            SetFunc = function( ent, server, tier, upgradeConfig )
                ent:SetNW2Int( "SpeedServer" .. server, tier )
            end,
            GetFunc = function( ent, server )
                return ent:GetNW2Int( "SpeedServer" .. server, 0 )
            end
        },
        ["Amount"] = {
            Name = "Amount",
            Icon = Material( "bricks_server/gangprinter_upgrade_amount.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Amount Increase", "integer" }
            },
            SetFunc = function( ent, server, tier, upgradeConfig )
                ent:SetNW2Int( "AmountServer" .. server, tier )
            end,
            GetFunc = function( ent, server )
                return ent:GetNW2Int( "AmountServer" .. server, 0 )
            end
        }
    }

    BRICKS_SERVER.DEVCONFIG.GangPrinterUpgradeTypes = {
        ["Health"] = {
            Name = "Health",
            Icon = Material( "bricks_server/gangprinter_upgrade_health.png" ),
            Tiered = true,
            ReqInfo = {
                [1] = { "Health Increase", "integer" }
            },
            SetFunc = function( ent, value )
                ent:SetNW2Int( "HealthUpgrade", value )
            end,
            GetFunc = function( ent )
                return ent:GetNW2Int( "HealthUpgrade", 0 )
            end
        },
        ["RGB"] = {
            Name = "RGB",
            SetFunc = function( ent, value )
                ent:SetNW2Bool( "RGBUpgrade", true )

                ent:SetBodygroup( 7, 1 )
            end,
            GetFunc = function( ent )
                return ent:GetNW2Bool( "RGBUpgrade", false )
            end
        }
    }
end

BRICKS_SERVER.DEVCONFIG.PresetGangIcons = {
    "bricks_server/gang_viewmembers.png",
    "bricks_server/gang_add_money.png",
    "bricks_server/storage_64.png"
}

-- 1: sql key (set to false to not save to DB), 2: data type
BRICKS_SERVER.DEVCONFIG.GangTableKeys = {
    ["Name"] = { "gangName", "string" },
    ["Icon"] = { "gangIcon", "string" },
    ["Owner"] = { "owner", "string" },
    ["Level"] = { "level", "integer" },
    ["Experience"] = { "experience", "integer" },
    ["Money"] = { "money", "integer" },
    ["Storage"] = { "storage", "table" },
    ["Members"] = { "members", "table" },
    ["Roles"] = { "roles", "table" },
    ["Upgrades"] = { "upgrades", "table" },
    ["Achievements"] = { "achievements", "table" },
    ["Printers"] = { false, "table" },
}

BRICKS_SERVER.DEVCONFIG.NPCTypes = BRICKS_SERVER.DEVCONFIG.NPCTypes or {}
BRICKS_SERVER.DEVCONFIG.NPCTypes["Gang"] = {
    UseFunction = function( ply, ent, NPCKey )
        BRICKS_SERVER.Func.OpenGangMenu( ply )
    end
}

BRICKS_SERVER.DEVCONFIG.EntityTypes = BRICKS_SERVER.DEVCONFIG.EntityTypes or {}
BRICKS_SERVER.DEVCONFIG.EntityTypes["bricks_server_territory"] = { 
    GetDataFunc = function( entity ) 
        return entity:GetTerritoryKey() or 0
    end,
    SetDataFunc = function( entity, data ) 
        return entity:SetTerritoryKeyFunc( data or 0 )
    end
}
--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_timer.lua:
zmlab2 = zmlab2 or {}
zmlab2.Timer = zmlab2.Timer or {}

////////////////////////////////////////////
///////////////// Timer ////////////////////
////////////////////////////////////////////
zmlab2.Timer.List = zmlab2.Timer.List or {}

function zmlab2.Timer.PrintAll()
	PrintTable(zmlab2.Timer.List)
end

function zmlab2.Timer.Create(timerid,time,rep,func)

	if zmlab2.util.FunctionValidater(func) then
		timer.Create(timerid, time, rep,func)
		table.insert(zmlab2.Timer.List, timerid)
	end
end

function zmlab2.Timer.Remove(timerid)
	if timer.Exists(timerid) then
		timer.Remove(timerid)
		table.RemoveByValue(zmlab2.Timer.List, timerid)
	end
end
////////////////////////////////////////////
////////////////////////////////////////////

--PATH addons/zeros_methlab2/lua/zmlab2/util/player/cl_player.lua:
if SERVER then return end
// Sends a net msg to the server that the player has fully initialized and removes itself
zmlab2.Hook.Add("HUDPaint", "PlayerInit", function()
	net.Start("zmlab2_Player_Initialize")
	net.SendToServer()

	zmlab2.Hook.Remove("HUDPaint", "PlayerInit")

	LocalPlayer().zmlab2_HasInitialized = true
end)

--PATH addons/zeros_methlab2/lua/zmlab2/equipment/sh_equipment.lua:
zmlab2 = zmlab2 or {}
zmlab2.Equipment = zmlab2.Equipment or {}

zmlab2.Equipment_Classes = {}
timer.Simple(2,function()
    for k,v in pairs(zmlab2.config.Equipment.List) do
        zmlab2.Equipment_Classes[v.class] = k
    end
end)


// Check if some player is in the way
function zmlab2.Equipment.AreaOccupied(pos,ignore)
    local IsOccupied = false
    for k,v in pairs(ents.FindInSphere(pos,15)) do
        if not IsValid(v) then continue end

        if ignore and v == ignore then continue end

        // We dont place a machine on top of another one
        if zmlab2.Equipment_Classes[v:GetClass()] then
            IsOccupied = true
            break
        end

        // Dont place a machine on a player
        if v:IsPlayer() then
            IsOccupied = true
            break
        end
    end
    return IsOccupied
end

--PATH addons/zeros_methlab2/lua/zmlab2/storage/sh_storage.lua:
zmlab2 = zmlab2 or {}
zmlab2.Storage = zmlab2.Storage or {}

function zmlab2.Storage.BuyCheck(ply,id)
    local data = zmlab2.config.Storage.Shop[id]
    if data == nil then return false end
    if data.rank and istable(data.rank) and table.Count(data.rank) > 0 and zmlab2.Player.RankCheck(ply,data.rank) == false then return false end
    if data.job and istable(data.job) and table.Count(data.job) > 0 and data.job[zmlab2.Player.GetJob(ply)] == nil then return false end
    if data.customcheck and data.customcheck(ply) == false then return false end

    return true
end

--PATH addons/zeros_methlab2/lua/zmlab2/mixer/cl_mixer.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Mixer = zmlab2.Mixer or {}


function zmlab2.Mixer.Initialize(Mixer)
    Mixer.SmoothAnim = 0
end

function zmlab2.Mixer.OnRemove(Mixer)
    Mixer:StopSound("zmlab2_machine_pumping")
    Mixer:StopSound("zmlab2_machine_venting")
end

function zmlab2.Mixer.Think(Mixer)

    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Mixer:GetPos(), 500) then
        Mixer:OnCenterButton(LocalPlayer())
        local _state = Mixer:GetProcessState()

        zmlab2.util.LoopedSound(Mixer, "zmlab2_machine_pumping", _state == 3 or _state == 6)
        zmlab2.util.LoopedSound(Mixer, "zmlab2_machine_venting", _state == 7 or _state == 8 or _state == 4 )

        // Smoke effect when tank is open
        if _state == 4 and (Mixer.NextEffect == nil or (Mixer.NextEffect and CurTime() > Mixer.NextEffect)) then

            local m_data = zmlab2.config.MethTypes[Mixer:GetMethType()]
            if m_data and m_data.visuals and m_data.visuals.effect_mixer_liquid then
                zmlab2.Effect.ParticleEffect(m_data.visuals.effect_mixer_liquid, Mixer:LocalToWorld(Vector(15,0,45)), Mixer:GetAngles(), Mixer)
            end
            Mixer.NextEffect = CurTime() + 1
        end

        // Smoke effect when Exhaust connection is open
        if _state == 7 and (Mixer.NextEffect == nil or (Mixer.NextEffect and CurTime() > Mixer.NextEffect)) then

            local m_data = zmlab2.config.MethTypes[Mixer:GetMethType()]
            if m_data and m_data.visuals and m_data.visuals.effect_mixer_exhaust then
                zmlab2.Effect.ParticleEffect(m_data.visuals.effect_mixer_exhaust, Mixer:LocalToWorld(Vector(23.1,0,55)), Mixer:GetAngles(), Mixer)
            end
            Mixer.NextEffect = CurTime() + 1
        end

        if _state == 0 or _state == 4 or _state == 11 then
            Mixer.SmoothAnim = Lerp(2 * FrameTime(),Mixer.SmoothAnim,0.6)
        else
            Mixer.SmoothAnim = Lerp(2 * FrameTime(),Mixer.SmoothAnim,0)
        end
        Mixer:SetPoseParameter("zmlab2_deckel_move",Mixer.SmoothAnim)
        Mixer:InvalidateBoneCache()
    end
end

function zmlab2.Mixer.Draw(Mixer)
    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Mixer:GetPos(), 500) then
        if zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then zmlab2.Mixer.DrawUI(Mixer) end

        // Vibrates certain bones of the machine
        local _state = Mixer:GetProcessState()
        zmlab2.VibrationSystem.Run(Mixer,_state == 3 or _state == 6,0.5)
    end
end

local ScreenData = {
    pos = Vector(-5,13.69,31.7),
    ang = Angle(0, 180, 90),
    x = 0,
    y = 0,
    w = 220,
    h = 280,
    pages = {
        [-1] = function(Mixer)
            local MethData = zmlab2.config.MethTypes[Mixer:GetMethType()]
            zmlab2.Interface.DrawButton(0, -50, 180, 80, MethData.name, Mixer:OnMethType(LocalPlayer()))
            zmlab2.Interface.DrawButton(0, 50, 180, 80, zmlab2.language["Start"], Mixer:OnStart(LocalPlayer()))
        end,
        [0] = function(Mixer)
            zmlab2.Interface.DrawIngredient(0, 0, 220, 280, zmlab2.materials["icon_bee"],Mixer:GetNeedAmount(),zmlab2.GetFont("zmlab2_font03"))
        end,
        [1] = function(Mixer)
            zmlab2.Interface.DrawPipe(220,220,zmlab2.colors["acid"])
        end,
        [2] = function(Mixer)
            zmlab2.Interface.DrawButton(0, 0, 200, 80, zmlab2.language["Start"], Mixer:OnCenterButton(LocalPlayer()))
        end,
        [3] = function(Mixer)
            zmlab2.Interface.DrawProgress(zmlab2.Meth.GetMixTime(Mixer:GetMethType()),CurTime() - Mixer:GetProcessStart())
        end,
        [4] = function(Mixer)
            zmlab2.Interface.DrawIngredient(0, 0, 220, 280, zmlab2.materials["icon_alu"],Mixer:GetNeedAmount(),zmlab2.GetFont("zmlab2_font03"))
        end,
        [5] = function(Mixer)
            zmlab2.Interface.DrawButton(0, 0, 200, 80, zmlab2.language["Start"], Mixer:OnCenterButton(LocalPlayer()))
        end,
        [6] = function(Mixer)
            zmlab2.Interface.DrawProgress(zmlab2.Meth.GetMixTime(Mixer:GetMethType()),CurTime() - Mixer:GetProcessStart())
        end,
        [7] = function(Mixer)
            local rot = 10 * math.sin(CurTime() * 1)
            rot = zmlab2.util.SnapValue(15,rot)

            surface.SetDrawColor(color_white )
            if rot == 0 then
                surface.SetMaterial(zmlab2.materials["icon_pipe"])
            else
                surface.SetMaterial(zmlab2.materials["icon_pipe_smoke"])
            end
            surface.DrawTexturedRectRotated(0, 10, 260, 260, 0 )


            local e_width,e_y = 100,-45
            surface.SetDrawColor(color_white)
            surface.SetMaterial(zmlab2.materials["icon_E"])
            surface.DrawTexturedRectRotated(0, e_y, e_width, e_width, 0)

            if Mixer:OnCenterButton(LocalPlayer()) then
                draw.RoundedBox(10, -45, -90, 90, 90, zmlab2.colors["white02"])
            end

            Mixer.Pulse = (Mixer.Pulse or 0) + (1 * FrameTime())
            if Mixer.Pulse > 1 then Mixer.Pulse = 0 end


            local mul = 1 + math.abs(0.7 * Mixer.Pulse)
            surface.SetDrawColor(Color(255, 255, 255, 200 - 200 * Mixer.Pulse))
            surface.SetMaterial(zmlab2.materials["icon_box01"])
            surface.DrawTexturedRectRotated(0, e_y, e_width * mul, e_width * mul, 0)
        end,
        [8] = function(Mixer)
            zmlab2.Interface.DrawProgress(zmlab2.Meth.GetVentTime(Mixer:GetMethType()),CurTime() - Mixer:GetProcessStart())
        end,
        [9] = function(Mixer)
            zmlab2.Interface.DrawButton(0, 0, 200, 80, zmlab2.language["Move Liquid"], Mixer:OnCenterButton(LocalPlayer()))
        end,
        [11] = function(Mixer)
            surface.SetDrawColor(color_white )
            surface.SetMaterial(zmlab2.materials["icon_sponge"])
            surface.DrawTexturedRectRotated(0, 0, 200, 200, 0 )
        end
    }
}

function zmlab2.Mixer.DrawUI_Liquid(Mixer)
    local _state = Mixer:GetProcessState()

    local col = zmlab2.Mixer.GetLiquidColor(Mixer)

    local amount = 0
    if (_state >= 1 and _state <= 9) or Mixer:GetBodygroup(4) == 1 then amount = 0.95 end

    if Mixer.SmoothBar == nil then Mixer.SmoothBar = 0 end
    Mixer.SmoothBar = Lerp(0.5 * FrameTime(),Mixer.SmoothBar,amount)

    if Mixer:GetBodygroup(4) == 0 and _state <= 0 or _state >= 11 then Mixer.SmoothBar = 0 end

    local turbulence = 0
    if _state == 3 or _state == 6 or _state == 8 then turbulence = 0.5 end

    cam.Start3D2D(Mixer:LocalToWorld(Vector(17.8,13.7,25)), Mixer:LocalToWorldAngles(Angle(0,0,-90)), 0.1)
        zmlab2.Interface.DrawLiquid(Mixer,-50, -20, 40, 275,Mixer.SmoothBar,col,turbulence)
    cam.End3D2D()
end

function zmlab2.Mixer.DrawUI(Mixer)

    local _state = Mixer:GetProcessState()

    // Draws the liquid indicator
    zmlab2.Mixer.DrawUI_Liquid(Mixer)

    local MethData = zmlab2.config.MethTypes[Mixer:GetMethType()]
    if _state == -1 then
        ScreenData.OverwriteColor = MethData.color
    end

    // Draws the current status
    zmlab2.Interface.Draw(Mixer,ScreenData)
end

--PATH addons/_adminmodules/lua/ulx/xgui/groups.lua:
--Groups/Players module V2 for ULX GUI -- by Stickly Man!
--Manages groups and players within groups, teams, and permissions/restrictions

xgui.prepareDataType( "groups" )
xgui.prepareDataType( "users" )
xgui.prepareDataType( "teams" )
xgui.prepareDataType( "accesses" )
xgui.prepareDataType( "playermodels" )

local groups = xlib.makepanel{ parent=xgui.null }
groups.list = xlib.makecombobox{ x=5, y=5, w=100, parent=groups }
function groups.list:populate()
	local prev_sel = self:GetValue()
	if prev_sel == "" then prev_sel = "Select a group..." end
	self:Clear()
	for _, v in ipairs( xgui.data.groups ) do
		self:AddChoice( v )
	end
	self:AddChoice( "--*" )
	self:AddChoice( "Manage Groups..." )
	self:SetText( groups.lastOpenGroup or prev_sel )
	if groups.lastOpenGroup then
		if not ULib.ucl.groups[groups.lastOpenGroup] then --Group no longer exists
			groups.pnlG1:Close()
			xlib.animQueue_start()
			self.openFlag = nil
			groups.lastOpenGroup = nil
			self:SetText( "Select a group..." )
		end
	end
end
groups.list.OnSelect = function( self, index, value, data )
	if value ~= "Manage Groups..." then
		if value ~= groups.lastOpenGroup then
			groups.lastOpenGroup = value
			groups.pnlG1:Open( value )
			xlib.animQueue_start()
		end
	else
		groups.lastOpenGroup = nil
		groups.pnlG2:Open()
		xlib.animQueue_start()
	end
end
groups.lastOpenGroup = nil

groups.clippanela = xlib.makepanel{ x=5, y=30, w=580, h=335, parent=groups }
groups.clippanela.Paint = function( self, w, h ) end
groups.clippanelb = xlib.makepanel{ x=175, y=30, w=410, h=335, visible=false, parent=groups }
groups.clippanelb.Paint = function( self, w, h ) end
groups.clippanelc = xlib.makepanel{ x=380, y=30, w=210, h=335, visible=false, parent=groups }
groups.clippanelc.Paint = function( self, w, h ) end

-----------------------------------
------Groups Panel 1 (Users, Teams)
-----------------------------------
groups.pnlG1 = xlib.makepanel{ w=170, h=335, parent=groups.clippanela }
groups.pnlG1:SetVisible( false )
function groups.pnlG1:Open( group )
	if self:IsVisible() then --Is open, lets close it first.
		self:Close()
	elseif groups.pnlG2:IsVisible() then
		groups.pnlG2:Close()
	end
	self:openAnim( group )
	if self.openFlag then
		self.openFlag:Open()
		self.openFlag = nil
	end
end
function groups.pnlG1:Close()
	if groups.pnlG3:IsVisible() then
		groups.pnlG3:Close()
		self.openFlag = groups.pnlG3
	end
	if groups.pnlG4:IsVisible() then
		groups.pnlG4:Close()
		self.openFlag = groups.pnlG4
	end
	self:closeAnim()
end
xlib.makelabel{ x=5, y=5, label="Users in group:", parent=groups.pnlG1 }
groups.players = xlib.makelistview{ x=5, y=20, w=160, h=190, parent=groups.pnlG1 }
groups.players:AddColumn( "Name" )
groups.players.OnRowSelected = function( self, LineID, Line )
	groups.cplayer:SetDisabled( false )
end
groups.aplayer = xlib.makebutton{ x=5, y=210, w=80, label="Add...", parent=groups.pnlG1 }
groups.aplayer.DoClick = function()
	local menu = DermaMenu()
	menu:SetSkin(xgui.settings.skin)
	for k, v in player.Iterator() do
		if v:GetUserGroup() ~= groups.list:GetValue() then
			menu:AddOption( v:Nick() .. "  |  " .. v:GetUserGroup(), function() groups.changeUserGroup( v:SteamID(), groups.list:GetValue() ) end )
		end
	end
	menu:AddSpacer()
	for ID, v in pairs( xgui.data.users ) do
		if v.group ~= groups.list:GetValue() and not groups.isOnline( ID ) then
			menu:AddOption( ( v.name or ID ) .. "  |  " .. ( v.group or "<none?>" ), function() groups.changeUserGroup( ID, groups.list:GetValue() ) end )
		end
	end
	menu:AddSpacer()
	menu:AddOption( "Add by SteamID...", function() groups.addBySteamID( groups.list:GetValue() ) end )
	menu:Open()
end
groups.cplayer = xlib.makebutton{ x=85, y=210, w=80, label="Change...", disabled=true, parent=groups.pnlG1 }
groups.cplayer.DoClick = function()
	if groups.players:GetSelectedLine() then
		local ID = groups.players:GetSelected()[1]:GetColumnText(2)
		local menu = DermaMenu()
		menu:SetSkin(xgui.settings.skin)
		for _, v in pairs( xgui.data.groups ) do
			if v ~= "user" and v ~= groups.list:GetValue() then
				menu:AddOption( v, function() groups.changeUserGroup( ID, v ) end )
			end
		end
		menu:AddSpacer()
		menu:AddOption( "Remove User", function() groups.changeUserGroup( ID, "user" ) end )
		menu:Open()
	end
end
xlib.makelabel{ x=5, y=240, label="Team:", parent=groups.pnlG1}
groups.teams = xlib.makecombobox{ x=5, y=100, w=160, disabled=not ulx.uteamEnabled(), parent=groups.pnlG1 }
groups.teams.OnSelect = function( self, index, value, data )
	if value == "<None>" then value = "" end
	RunConsoleCommand( "xgui", "changeGroupTeam", groups.list:GetValue(), value )
end
groups.teambutton = xlib.makebutton{ x=5, y=275, w=160, label="Manage Teams >>", disabled=not ulx.uteamEnabled(), parent=groups.pnlG1 }
groups.teambutton.DoClick = function( self )
	if not groups.pnlG3:IsVisible() then
		self:SetText( "Manage Teams <<" )
		groups.pnlG3:Open()
	else
		self:SetText( "Manage Teams >>" )
		groups.pnlG3:Close()
	end
	xlib.animQueue_start()
end
groups.accessbutton = xlib.makebutton{ x=5, y=305, w=160, label="Manage Permissions >>", parent=groups.pnlG1 }
groups.accessbutton.DoClick = function( self )
	if not groups.pnlG4:IsVisible() then
		self:SetText( "Manage Permissions <<" )
		groups.pnlG4:Open()
	else
		self:SetText( "Manage Permissions >>" )
		groups.pnlG4:Close()
	end
	xlib.animQueue_start()
end

function groups.addBySteamID( group )
	local frame = xlib.makeframe{ label="Add ID to group " .. group, w=190, h=60, skin=xgui.settings.skin }
	xlib.maketextbox{ x=5, y=30, w=180, parent=frame, selectall=true, text="Enter STEAMID..." }.OnEnter = function( self )
		if ULib.isValidSteamID( self:GetValue() ) then
			RunConsoleCommand( "ulx", "adduserid", self:GetValue(), group )
			frame:Remove()
		else
			Derma_Message( "Invalid SteamID!", "XGUI NOTICE" )
		end
	end
end

function groups.changeUserGroup( ID, group )
	if ID == "NULL" then
		-- Is bot, most likely.
		ID = "BOT"
	end

	if group == "user" then
		RunConsoleCommand( "ulx", "removeuserid", ID )
	else
		RunConsoleCommand( "ulx", "adduserid", ID, group )
	end
end

function groups.isOnline( steamID )
	for _, v in player.Iterator() do
		if v:SteamID() == steamID then
			return true
		end
	end
	return false
end

---------------------------------------
------Groups Panel 2 (Group Management)
---------------------------------------
groups.pnlG2 = xlib.makepanel{ w=350, h=200, parent=groups.clippanela }
groups.pnlG2:SetVisible( false )
function groups.pnlG2:Open()
	if not self:IsVisible() then
		if groups.pnlG1:IsVisible() then
			groups.pnlG1:Close()
		end
		self:openAnim()
	end
end
function groups.pnlG2:Close()
	self:closeAnim()
end
groups.glist = xlib.makelistview{ x=5, y=5, h=170, w=130, headerheight=0, parent=groups.pnlG2 }
groups.glist:AddColumn( "Groups" )
groups.glist.populate = function( self )
	local previous_group = nil
	local prev_inherit = groups.ginherit:GetValue()
	if groups.glist:GetSelectedLine() then previous_group = groups.glist:GetSelected()[1]:GetColumnText(1) end
	self:Clear()
	groups.ginherit:Clear()
	groups.ginherit:SetText( prev_inherit )
	for _, v in ipairs( xgui.data.groups ) do
		local l = self:AddLine( v )
		groups.ginherit:AddChoice( v )
		if v == previous_group then
			previous_group = true
			self:SelectItem( l )
		end
	end
	if previous_group and previous_group ~= true then --Old group not found, reset the values
		groups.gname:SetText( "new_group" )
		groups.ginherit:SetText( "user" )
		groups.gcantarget:SetText( "" )
		groups.glist:ClearSelection()
		groups.gdelete:SetDisabled( true )
		groups.gupdate:SetDisabled( true )
		groups.newgroup:SetDisabled( false )
		groups.gname:SetDisabled( false )
		groups.ginherit:SetDisabled( false )
	end
end
groups.glist.OnRowSelected = function( self, LineID, Line )
	local group = Line:GetColumnText(1)
	groups.gname:SetText( group )
	groups.ginherit:SetText( ULib.ucl.groups[group].inherit_from or "user" )
	groups.gcantarget:SetText( ULib.ucl.groups[group].can_target or "*" )
	groups.gupdate:SetDisabled( false )

	local isGroupUser = ( group == "user" )
	groups.gdelete:SetDisabled( isGroupUser )
	groups.ginherit:SetDisabled( isGroupUser )
	groups.newgroup:SetDisabled( isGroupUser )
	groups.gname:SetDisabled( isGroupUser )
end
groups.newgroup = xlib.makebutton{ x=245, y=175, w=100, label="Create New...", parent=groups.pnlG2 }
groups.newgroup.DoClick = function()
	if not ULib.ucl.groups[groups.gname:GetValue()] then
		RunConsoleCommand( "ulx", "addgroup", groups.gname:GetValue(), groups.ginherit:GetValue() )
		if groups.gcantarget:GetValue() ~= "" && groups.gcantarget:GetValue() ~= "*" then
			ULib.queueFunctionCall( RunConsoleCommand, "ulx", "setgroupcantarget", groups.gname:GetValue(), groups.gcantarget:GetValue() )
		end
	else
		Derma_Message( "A group with that name already exists!", "XGUI NOTICE" );
	end
end
xlib.makelabel{ x=145, y=8, label="Name:", parent=groups.pnlG2 }
xlib.makelabel{ x=145, y=33, label="Inherits from:", parent=groups.pnlG2 }
xlib.makelabel{ x=145, y=58, label="Can Target:", parent=groups.pnlG2 }
groups.gname = xlib.maketextbox{ x=180, y=5, w=165, text="new_group", selectall=true, parent=groups.pnlG2 }
groups.ginherit = xlib.makecombobox{ x=215, y=30, w=100, text="user", parent=groups.pnlG2 }
groups.gcantarget = xlib.maketextbox{ x=205, y=55, w=140, text="", selectall=true, parent=groups.pnlG2 }
groups.gupdate = xlib.makebutton{ x=140, y=175, w=100, disabled=true, label="Update", parent=groups.pnlG2 }
groups.gupdate.DoClick = function( self )
	local groupname = groups.glist:GetSelected()[1]:GetColumnText(1)
	local oldinheritance = ULib.ucl.groups[groupname].inherit_from
	local newinheritance = groups.ginherit:GetValue()
	local cantarget = ULib.ucl.groups[groupname].can_target

	if newinheritance == "user" then newinheritance = nil end
	if not cantarget then cantarget = "*" end

	if groups.gname:GetValue() ~= groupname then
		if groupname == "superadmin" or groupname == "admin" then
			Derma_Query( "Renaming the " .. groupname .. " group is generally a bad idea, and it could break some plugins. Are you sure?", "XGUI WARNING",
				"Rename to " .. groups.gname:GetValue(), function()
					RunConsoleCommand( "ulx", "renamegroup", groupname, groups.gname:GetValue() )
					groupname = groups.gname:GetValue() end,
				"Cancel", function() end )
		else
			if not ULib.ucl.groups[groups.gname:GetValue()] then
				RunConsoleCommand( "ulx", "renamegroup", groupname, groups.gname:GetValue() )
				groupname = groups.gname:GetValue()
			else
				Derma_Message( "A group with that name already exists!", "XGUI NOTICE" );
			end
		end
	end

	if newinheritance ~= oldinheritance then
		ULib.queueFunctionCall( RunConsoleCommand, "xgui", "setinheritance", groupname, newinheritance or ULib.ACCESS_ALL )
	end

	if cantarget ~= groups.gcantarget:GetValue() then
		ULib.queueFunctionCall( RunConsoleCommand, "ulx", "setgroupcantarget", groupname, groups.gcantarget:GetValue() )
	end
end
groups.gdelete = xlib.makebutton{ x=5, y=175, w=130, label="Delete", disabled=true, parent=groups.pnlG2 }
groups.gdelete.DoClick = function()
	local group = groups.gname:GetValue()
	if group == "superadmin" or group == "admin" then
		Derma_Query( "Removing the " .. group .. " group is generally a bad idea, and it could break some plugins. Are you sure?", "XGUI WARNING",
			"Remove", function()
				RunConsoleCommand( "ulx", "removegroup", group ) end,
			"Cancel", function() end )
	else
		Derma_Query( "Are you sure you would like to remove the \"" .. group .. "\" group?", "XGUI WARNING",
			"Remove", function()
				RunConsoleCommand( "ulx", "removegroup", group ) end,
			"Cancel", function() end )
	end
end

---------------------------------------
------Groups Panel 3 (Teams Management)
---------------------------------------
groups.pnlG3 = xlib.makepanel{ y=130, w=405, h=205, parent=groups.clippanelb }
groups.pnlG3:SetVisible( false )
function groups.pnlG3:Open()
	if groups.pnlG4:IsVisible() then
		groups.accessbutton:SetText( "Manage Permissions >>" )
		groups.pnlG4:Close()
	end
	self:openAnim()
end
function groups.pnlG3:Close()
	self:closeAnim()
end
groups.teamlist = xlib.makelistview{ x=5, y=5, w=100, h=155, headerheight=0, parent=groups.pnlG3 }
groups.teamlist:AddColumn( "Teams" )
groups.teamlist.OnRowSelected = function( self, LineID, Line )
	local team = Line:GetColumnText(1)
	groups.teamdelete:SetDisabled( false )
	groups.upbtn:SetDisabled( LineID == 1 )
	groups.downbtn:SetDisabled( LineID == #self.Lines )
	groups.teammodadd:SetDisabled( false )

	local lastmod = groups.teammodifiers:GetSelectedLine() and groups.teammodifiers:GetSelected()[1]:GetColumnText(1)
	groups.teammodifiers:Clear()
	for _, chteam in pairs( xgui.data.teams ) do
		if chteam.name == team then
			for k, v in pairs( chteam ) do
				if k ~= "index" and k ~= "order" and k ~= "groups" then
					local value = v
					if k == "color" then
						value = v.r .. " " .. v.g .. " " .. v.b
					end
					local l = groups.teammodifiers:AddLine( k, value, type( value ) )
					if k == lastmod then
						groups.teammodifiers:SelectItem( l )
						lastmod = true
					end
				end
			end
			break
		end
	end
	groups.teammodifiers:SortByColumn( 1, false )
	if not groups.teammodifiers:GetSelectedLine() then
		groups.teammodspace:Clear()
	end
end

local function checkNewTeamExists( name, number )
	for _, v in ipairs( xgui.data.teams ) do
		if v.name == name .. number then
			name, number = checkNewTeamExists( name, number == "" and 1 or number+1 )
			break
		end
	end
	return name, number
end

xlib.makebutton{ x=5, y=160, w=80, label="Create New", parent=groups.pnlG3 }.DoClick = function()
	local teamname, number = checkNewTeamExists( "New_Team", "" )
	RunConsoleCommand( "xgui", "createTeam", teamname..number, 255, 255, 255 )
end
groups.teamdelete = xlib.makebutton{ x=5, y=180, w=80, label="Delete", disabled=true, parent=groups.pnlG3 }
groups.teamdelete.DoClick = function()
	local team = groups.teamlist:GetSelected()[1]:GetColumnText(1)
	Derma_Query( "Are you sure you would like to remove the \"" .. team .. "\" team?", "XGUI WARNING",
		"Remove", function() RunConsoleCommand( "xgui", "removeTeam", team ) end,
		"Cancel", function() end )
end
groups.upbtn = xlib.makebutton{ x=85, y=160, w=20, icon="icon16/bullet_arrow_up.png", centericon=true, disabled=true, parent=groups.pnlG3 }
groups.upbtn.DoClick = function( self )
	self:SetDisabled( true )
	local lineID = groups.teamlist:GetSelectedLine()
	RunConsoleCommand( "xgui", "updateTeamValue",  groups.teamlist.Lines[lineID]:GetColumnText(1), "order", lineID-1 )
	RunConsoleCommand( "xgui", "updateTeamValue",  groups.teamlist.Lines[lineID-1]:GetColumnText(1), "order", lineID, "true" )
end
groups.downbtn = xlib.makebutton{ x=85, y=180, w=20, icon="icon16/bullet_arrow_down.png", centericon=true, disabled=true, parent=groups.pnlG3 }
groups.downbtn.DoClick = function( self )
	self:SetDisabled( true )
	local lineID = groups.teamlist:GetSelectedLine()
	RunConsoleCommand( "xgui", "updateTeamValue",  groups.teamlist.Lines[lineID]:GetColumnText(1), "order", lineID+1 )
	RunConsoleCommand( "xgui", "updateTeamValue",  groups.teamlist.Lines[lineID+1]:GetColumnText(1), "order", lineID, "true" )
end
groups.teammodifiers = xlib.makelistview{ x=110, y=5, h=175, w=150, parent=groups.pnlG3 }
groups.teammodifiers:AddColumn( "Modifiers" ).DoClick = function() end
groups.teammodifiers:AddColumn( "Value" ).DoClick = function() end
groups.teammodifiers.OnRowSelected = function( self, LineID, Line )
	groups.teammodremove:SetDisabled( Line:GetColumnText(1) == "name" or Line:GetColumnText(1) == "color" )
	groups.teammodspace:Clear()
	local applybtn = xlib.makebutton{ label="Apply", parent=groups.teammodspace }
	if Line:GetColumnText(3) ~= "number" then
		if Line:GetColumnText(1) == "name" then
			groups.teamctrl = xlib.maketextbox{ selectall=true, text=Line:GetColumnText(2), parent=groups.teammodspace }
			groups.teamctrl.OnEnter = function()
				applybtn.DoClick()
			end
			groups.teammodspace:Add( groups.teamctrl )
		elseif Line:GetColumnText(1) == "color" then
			groups.teamctrl = xlib.makecolorpicker{ parent=groups.teammodspace }
			local tempcolor = string.Explode( " ", Line:GetColumnText(2) )
			groups.teamctrl:SetColor( Color( tempcolor[1], tempcolor[2], tempcolor[3] ) )
			groups.teammodspace:Add( groups.teamctrl )
		elseif Line:GetColumnText(1) == "model" then
			groups.teamctrl = xlib.maketextbox{ selectall=true, text=Line:GetColumnText(2), parent=groups.teammodspace }
			groups.teamctrl.OnEnter = function( self )
				applybtn.DoClick()
				for _, item in ipairs( groups.modelList.Items ) do
					if item.ConVars == self:GetValue() or item.Model == self:GetValue() then
						groups.modelList:SelectPanel( item )
						break
					end
				end
			end
			groups.teammodspace:Add( groups.teamctrl )
			groups.modelList = vgui.Create( "DModelSelect" )
			groups.updateModelPanel()
			for _, item in ipairs( groups.modelList.Items ) do
				if item.ConVars == Line:GetColumnText(2) or item.Model == Line:GetColumnText(2) then
					groups.modelList:SelectPanel( item )
					break
				end
			end
			function groups.modelList:OnActivePanelChanged( pnlOld, pnlNew )
				groups.teamctrl:SetText( pnlNew.ConVars or pnlNew.Model )
				applybtn.DoClick()
			end
			groups.teammodspace:Add( groups.modelList )
		end
	else
		local defvalues = xgui.allowedTeamModifiers[Line:GetColumnText(1)]
		if type( defvalues ) ~= "table" then defvalues = { defvalues } end
		groups.teamctrl = xlib.makeslider{ min=defvalues[2] or 0, max=defvalues[3] or 2000, decimal=defvalues[4], value=tonumber( Line:GetColumnText(2) ), label=Line:GetColumnText(1), parent=groups.teammodspace }
		groups.teamctrl.OnEnter = function( self )
			applybtn.DoClick()
		end
		groups.teammodspace:Add( groups.teamctrl )
	end
	applybtn.DoClick = function()
		if Line:GetColumnText(1) == "color" then
			local col = groups.teamctrl:GetColor()
			RunConsoleCommand( "xgui", "updateTeamValue", groups.teamlist:GetSelected()[1]:GetColumnText(1), Line:GetColumnText(1), col.r, col.g, col.b )
		else
			if Line:GetColumnText(1) == "name" then --Check if a team by this name already exists!
				for _, v in ipairs( xgui.data.teams ) do
					if v.name == groups.teamctrl:GetValue() then return end
				end
			end
			RunConsoleCommand( "xgui", "updateTeamValue", groups.teamlist:GetSelected()[1]:GetColumnText(1), Line:GetColumnText(1), groups.teamctrl:GetValue() )
		end
	end
	if Line:GetColumnText(1) ~= "model" then
		groups.teammodspace:Add( applybtn )
	else
		applybtn:SetSize(0,0)
		groups.teammodspace:Add( applybtn )
	end
end

--Default, Min, Max, Decimals
xgui.allowedTeamModifiers = {
	armor = { 0, 0, 255 },
	--crouchedWalkSpeed = 0.6, --Pointless setting?
	deaths = { 0, -2048, 2047 },
	duckSpeed = { 0.3, 0, 10, 2 },
	frags = { 0, -2048, 2047 },
	gravity = { 1, -10, 10, 2 },
	health = { 100, 1, 2000 },
	jumpPower = 200,
	maxHealth = 100,
	--maxSpeed = 250, --Pointless setting?
	model = "scientist",
	runSpeed = { 500, 1, nil },
	stepSize = { 18, 0, 512, 2 },
	unDuckSpeed = { 0.2, 0, 10, 2 },
	walkSpeed = { 250, 1, nil } }

groups.teammodadd = xlib.makebutton{ x=110, y=180, w=75, label="Add..", disabled=true, parent=groups.pnlG3 }
groups.teammodadd.DoClick = function()
	local team = groups.teamlist:GetSelected()[1]:GetColumnText(1)
	local teamdata
	for i, v in pairs( xgui.data.teams ) do
		if v.name == team then teamdata = v end
	end

	local allowedSorted = {}
	for k,_ in pairs(xgui.allowedTeamModifiers) do table.insert(allowedSorted, k) end
	table.sort( allowedSorted, function( a,b ) return string.lower( a ) < string.lower( b ) end )

	local menu = DermaMenu()
	menu:SetSkin(xgui.settings.skin)
	for _, allowedname in pairs( allowedSorted ) do
		local add = true
		for name, data in pairs( teamdata ) do
			if name == allowedname then
				add = false
				break
			end
		end
		if add then
			local def = xgui.allowedTeamModifiers[allowedname]
			if type( def ) == "table" then def = def[1] end
			menu:AddOption( allowedname, function() RunConsoleCommand( "xgui", "updateTeamValue", team, allowedname, def ) end )
		end
	end
	menu:Open()
end
groups.teammodremove = xlib.makebutton{ x=185, y=180, w=75, label="Remove", disabled=true, parent=groups.pnlG3 }
groups.teammodremove.DoClick = function()
	local team = groups.teamlist:GetSelected()[1]:GetColumnText(1)
	local modifier = groups.teammodifiers:GetSelected()[1]:GetColumnText(1)
	RunConsoleCommand( "xgui", "updateTeamValue", team, modifier, "" )
end
groups.teammodspace = xlib.makelistlayout{ x=265, y=5, w=135, h=195, padding=1, parent=groups.pnlG3 }

----------------------------------------
------Groups Panel 4 (Access Management)
----------------------------------------
groups.pnlG4 = xlib.makepanel{ y=130, w=200, h=335, parent=groups.clippanelb }
groups.pnlG4:SetVisible( false )
function groups.pnlG4:Open()
	if groups.pnlG3:IsVisible() then
		groups.teambutton:SetText( "Manage Teams >>" )
		groups.pnlG3:Close()
	end
	self:openAnim()
	if groups.selcmd then
		if ULib.cmds.translatedCmds[groups.selcmd] and #ULib.cmds.translatedCmds[groups.selcmd].args > 1 then
			groups.pnlG5:Open( groups.selcmd )
		else
			groups.selcmd = nil
			groups.pnlG5:Close()
		end
	end
end
function groups.pnlG4:Close()
	if groups.pnlG5:IsVisible() then
		groups.pnlG5:Close()
	end
	self:closeAnim()
end
xlib.makelabel{ x=5, y=5, label="Has access to:", parent=groups.pnlG4 }
groups.accesses = xlib.makelistlayout{ x=5, y=20, w=190, h=310, padding=1, spacing=1, parent=groups.pnlG4 }

groups.access_cats = {}
groups.access_lines = {}
function groups.populateAccesses()
	if ULib.ucl.groups[groups.list:GetValue()] then
		local group = groups.list:GetValue()
		for access, line in pairs( groups.access_lines ) do
			--First, check through the group's allows and see if the access exists.
			local foundAccess, fromGroup, restrictionString = groups.groupHasAccess( group, access )
			--If found, then skip inheritance check and move along.
			if foundAccess then
				line.Columns[2]:SetDisabled( false )
			else --Access was not given to the group, check for inherited groups!
				foundAccess, fromGroup, restrictionString = groups.checkInheritedAccess( ULib.ucl.groups[group].inherit_from, access )
				line.Columns[2]:SetDisabled( foundAccess )
			end
			line.Columns[1]:SetColor((foundAccess and (restrictionString ~= "" and restrictionString ~= "*")) and SKIN.text_highlight or SKIN.text_dark )
			line.Columns[1]:SetAlpha( foundAccess and 255 or 128 )
			line.Columns[2]:SetValue( foundAccess )
			line:SetColumnText( 3, restrictionString )
			line:SetColumnText( 4, fromGroup )
			if groups.selcmd == line:GetColumnText(1) then
				if ( groups.access_lines[groups.selcmd].Columns[2].disabled or fromGroup ) or line:GetColumnText(3) ~= restrictionString then
					groups.populateRestrictionArgs( line:GetColumnText(1), restrictionString )
				end
			end
		end
	end
end

function groups.groupHasAccess( group, access )
	for k, v in pairs( ULib.ucl.groups[group].allow ) do
		if v == access then --This means there is no restriction tag
			return true, group, ""
		elseif k == access then
			return true, group, v
		end
	end
	return false, ""
end

function groups.checkInheritedAccess( group, access )
	if ULib.ucl.groups[group] then
		local foundAccess, fromGroup, restrictionString = groups.groupHasAccess( group, access )
		if foundAccess then
			return foundAccess, group, restrictionString
		else
			return groups.checkInheritedAccess( ULib.ucl.groups[group].inherit_from, access )
		end
	else
		return false, "", ""
	end
end

---------------------------------------------
------Groups Panel 5 (Restriction Management)
---------------------------------------------
groups.pnlG5 = xlib.makepanel{ y=130, w=200, h=335, parent=groups.clippanelc }
groups.pnlG5:SetVisible( false )
function groups.pnlG5:Open( cmd, accessStr )
	xlib.addToAnimQueue( groups.populateRestrictionArgs, cmd, accessStr )
	self:openAnim()
end
function groups.pnlG5:Close()
	if self:IsVisible() then
		self:closeAnim()
	end
end
groups.rArgList = xlib.makelistlayout{ x=5, y=20, w=190, h=308, parent=groups.pnlG5 }
xlib.makelabel{ x=5, y=5, label="Restrict command arguments:", parent=groups.pnlG5 }

function groups.populateRestrictionArgs( cmd, accessStr )
	if not accessStr then accessStr = groups.access_lines[cmd]:GetColumnText(3) end

	groups.rArgList:Clear()

	local restrictions = ULib.splitArgs( accessStr, "<", ">" )
	if restrictions[1] == "" then restrictions[1] = nil end

	local argnum = 0
	for i, arg in ipairs( ULib.cmds.translatedCmds[cmd].args ) do
		if not arg.type.invisible then
			argnum = argnum + 1
			if not arg.invisible then
				local hasrestriction = ( restrictions[argnum] ~= nil and restrictions[argnum] ~= "*" )
				local outCat
				---Player(s) Argument---
				if arg.type == ULib.cmds.PlayerArg or arg.type == ULib.cmds.PlayersArg then
					local ignoreCanTarget = ( restrictions[argnum] and string.sub( restrictions[argnum], 1, 1 ) == "$" )
					local outPanel = xlib.makepanel{ h=50 }
					outPanel.type = "ply"
					outPanel.cantarget = xlib.makecheckbox{ x=5, y=5, label="Ignore can_target", value=ignoreCanTarget or 0, parent=outPanel }
					outPanel.txtfield = xlib.maketextbox{ x=5, y=25, w=170, text=ignoreCanTarget and string.sub( restrictions[argnum], 2 ) or restrictions[argnum] or "*", parent=outPanel }
					--Handle change in width due to scrollbar
					local tempfunc = outPanel.PerformLayout
					outPanel.PerformLayout = function( self )
						tempfunc( self )
						outPanel.txtfield:SetWide( self:GetWide()-10 )
					end
					outCat = xlib.makecat{ label="Restrict " .. (arg.hint or "player(s)"), w=180, checkbox=true, expanded=hasrestriction, contents=outPanel, parent=xgui.null }
				---Number Argument---
				elseif arg.type == ULib.cmds.NumArg then
					local outPanel = xlib.makepanel{ h=85 }
					local rmin, rmax
					if hasrestriction and hasrestriction ~= "*" then
						local temp = restrictions[argnum] and string.Split( restrictions[argnum], ":" ) or ""
						rmin = string.sub( temp[1], 1, 1 ) ~= ":" and temp[1]
						rmax = temp[2]
						if rmax == nil then rmax = rmin end
					end
					outPanel.hasmin = xlib.makecheckbox{ x=5, y=8, value=( rmin~=nil ), parent=outPanel }
					outPanel.hasmax = xlib.makecheckbox{ x=5, y=48, value=( rmax~=nil ), parent=outPanel }
					if table.HasValue( arg, ULib.cmds.allowTimeString ) then
						outPanel.type = "time"

						local irmin, vrmin = ULib.cmds.NumArg.getTime( rmin )
						local iargmin, vargmin = ULib.cmds.NumArg.getTime( arg.min )
						local irmax, vrmax = ULib.cmds.NumArg.getTime( rmax )
						local iargmax, vargmax = ULib.cmds.NumArg.getTime( arg.max )

						local curinterval = ( irmin or iargmin or "Permanent" )
						local curval = vrmin or vargmin or 0
						outPanel.min = xlib.makeslider{ x=25, y=25, w=150, label="<--->", min=( vargmin or 0 ), max=( vargmax or 100 ), value=curval, decimal=0, disabled=( curinterval=="Permanent" ), parent=outPanel }
						outPanel.min:SetValue( curval ) --Set the value of the textentry manually to show decimals even though decimal=0.
						outPanel.minterval = xlib.makecombobox{ x=105, y=5, w=50, text=curinterval, choices={ "Permanent", "Minutes", "Hours", "Days", "Weeks", "Years" }, disabled=( rmin==nil ), parent=outPanel }
						outPanel.minterval.OnSelect = function( self, index, value, data )
							outPanel.min:SetDisabled( value == "Permanent" )
						end
						outPanel.hasmin.OnChange = function( self, bVal )
							outPanel.min:SetDisabled( not bVal or outPanel.minterval:GetValue() == "Permanent" )
							outPanel.minterval:SetDisabled( not bVal )
						end

						local curinterval = ( irmax or iargmax or "Permanent" )
						local curval = vrmax or vargmax or 0
						outPanel.max = xlib.makeslider{ x=25, y=65, w=150, label="<--->", min=( vargmin or 0 ), max=( vargmax or 100 ), value=curval, decimal=0, disabled=( curinterval=="Permanent" ), parent=outPanel }
						outPanel.max:SetValue( curval )
						outPanel.maxterval = xlib.makecombobox{ x=105, y=45, w=50, text=curinterval, choices={ "Permanent", "Minutes", "Hours", "Days", "Weeks", "Years" }, disabled=( rmax==nil ), parent=outPanel }
						outPanel.maxterval.OnSelect = function( self, index, value, data )
							outPanel.max:SetDisabled( value == "Permanent" )
						end
						outPanel.hasmax.OnChange = function( self, bVal )
							outPanel.max:SetDisabled( not bVal or outPanel.maxterval:GetValue() == "Permanent" )
							outPanel.maxterval:SetDisabled( not bVal )
						end

						xlib.makelabel{ x=25, y=8, label="Limit Minimum", parent=outPanel }
						xlib.makelabel{ x=25, y=48, label="Limit Maximum", parent=outPanel }

						--Handle change in width due to scrollbar
						local tempfunc = outPanel.PerformLayout
						outPanel.PerformLayout = function( self )
							tempfunc( self )
							local w = self:GetWide() - 10
							outPanel.min:SetWide( w-15 )
							outPanel.max:SetWide( w-15 )
							outPanel.minterval:SetWide( w-95 )
							outPanel.maxterval:SetWide( w-95 )
						end
					else
						outPanel.type = "num"
						outPanel.min = xlib.makeslider{ x=25, y=5, w=150, value=( rmin or arg.min or 0 ), min=( arg.min or 0 ), max=( arg.max or 100 ), label="Min", disabled=( rmin==nil ), parent=outPanel }
						outPanel.max = xlib.makeslider{ x=25, y=30, w=150, value=( rmax or arg.max or 100 ), min=( arg.min or 0 ), max=( arg.max or 100 ), label="Max", disabled=( rmax==nil ), parent=outPanel }
						outPanel.hasmax:SetPos( 5,33 )
						outPanel:SetHeight( 55 )
						outPanel.hasmin.OnChange = function( self, bVal )
							outPanel.min:SetDisabled( not bVal )
						end
						outPanel.hasmax.OnChange = function( self, bVal )
							outPanel.max:SetDisabled( not bVal )
						end

						--Handle change in width due to scrollbar
						local tempfunc = outPanel.PerformLayout
						outPanel.PerformLayout = function( self )
							tempfunc( self )
							local w = self:GetWide() - 10
							outPanel.min:SetWide( w-20 )
							outPanel.max:SetWide( w-20 )
						end
					end

					outCat = xlib.makecat{ label="Restrict " .. ( arg.hint or "number value" ), w=180, checkbox=true, expanded=hasrestriction, contents=outPanel, parent=xgui.null }
				---Bool Argument---
				elseif arg.type == ULib.cmds.BoolArg then
					local outPanel = xlib.makepanel{ h=25 }
					outPanel.type = "bool"
					outPanel.checkbox = xlib.makecheckbox{ x=5, y=5, value=restrictions[argnum] or false, label="Must be: True (1), False (0)", parent=outPanel }
					outCat = xlib.makecat{ label="Restrict " .. ( arg.hint or "bool value" ), w=180, checkbox=true, expanded=hasrestriction, contents=outPanel, parent=xgui.null }
				---String Argument---
				elseif arg.type == ULib.cmds.StringArg then
					local outPanel = xlib.makepanel{ h=200 }
					outPanel.type = "str"
					outPanel.list = xlib.makelistview{ x=5, y=5, w=170, h=150, multiselect=false, parent=outPanel }
					outPanel.list:AddColumn( "Whitelist String Values" )
					outPanel.textbox = xlib.maketextbox{ x=5, y=155, w=170, parent=outPanel, selectall=true }

					local strings = {}
					if restrictions[argnum] then strings = string.Split( restrictions[argnum], "," ) end
					for _, v in ipairs( strings ) do
						outPanel.list:AddLine( v )
					end

					outPanel.textbox.OnEnter = function( self )
						if self:GetValue() ~= "" then
							if not( string.find( self:GetValue(), "<" ) or string.find( self:GetValue(), ">" ) or string.find( self:GetValue(), "," ) ) then
								local found = false
								for _, l in ipairs( outPanel.list.Lines ) do
									if l:GetColumnText(1) == self:GetValue() then
										found = true
									end
								end
								if not found then
									outPanel.list:AddLine( self:GetValue() )
									self:SetText( "" )
								else
									Derma_Message( "This item already exists in the list!", "XGUI NOTICE" )
								end
							else
								Derma_Message( "You cannot use a string that contains the following characters: < > ,", "XGUI NOTICE" )
							end
						end
					end
					outPanel.addButton = xlib.makebutton{ x=5, y=175, w=85, label="Add", parent=outPanel }
					outPanel.addButton.DoClick = function( self )
						outPanel.textbox:OnEnter()
					end
					outPanel.removeButton = xlib.makebutton{ x=90, y=175, w=85, label="Remove", disabled=true, parent=outPanel }
					outPanel.removeButton.DoClick = function( self )
						outPanel.list:RemoveLine( outPanel.list:GetSelectedLine() )
						self:SetDisabled( true )
					end
					outPanel.list.OnRowSelected = function( self, LineID, Line )
						outPanel.removeButton:SetDisabled( false )
					end
					--Handle change in width due to scrollbar
					local tempfunc = outPanel.PerformLayout
					outPanel.PerformLayout = function( self )
						tempfunc( self )
						local w = self:GetWide() - 10
						outPanel.addButton:SetWide( w/2 )
						outPanel.removeButton:SetWide( w/2 )
						outPanel.list:SetWide( w )
						outPanel.textbox:SetWide( w )
						outPanel.removeButton:SetPos( (w/2)+5, 175 )
					end
					outCat = xlib.makecat{ label="Restrict " .. ( arg.hint or "string value" ), w=180, padding=0, checkbox=true, expanded=hasrestriction, contents=outPanel, parent=xgui.null }
				end
				groups.rArgList:Add( outCat )
			end
		end
	end
	groups.applyButton = xlib.makebutton{ h=20, label="Apply restrictions", parent=groups.rArgList }
	groups.applyButton.DoClick = function( self )
		if ( groups.access_lines[cmd].Columns[2].disabled or groups.access_lines[cmd]:GetColumnText(4) == "" ) or outstr ~= accessStr then
			RunConsoleCommand( "ulx", "groupallow", groups.list:GetValue(), cmd, groups.generateAccessString() )
		end
	end
	groups.rArgList:Add( groups.applyButton )

	if not groups.access_lines[cmd].Columns[2]:GetChecked() then
		groups.applyButton:SetText( "Apply access + restrictions" )
	elseif groups.access_lines[cmd].Columns[2].disabled then
		groups.applyInheritedButton = xlib.makebutton{ h=20, parent=groups.rArgList }
		groups.applyInheritedButton.DoClick = function( self )
			RunConsoleCommand( "ulx", "groupallow", groups.access_lines[cmd]:GetColumnText(4), cmd, groups.generateAccessString() )
		end
		groups.applyButton:SetText( "Apply access + restrictions" )
		groups.applyInheritedButton:SetText( "Apply restrictions at \"" .. groups.access_lines[cmd]:GetColumnText(4) .. "\" level" )
		groups.rArgList:Add( groups.applyInheritedButton )
	end
	groups.rArgList:SetSkin( xgui.settings.skin )  -- For some reason, skin doesn't update properly when this panel is recreated
	groups.rArgList:SetSkin( "" )                  -- Set the skin back to "" so that future skin changes in client settings will apply
end

function groups.generateAccessString()
	local outstr = ""
	local outtmp = ""
	for _, panel in ipairs( groups.rArgList:GetChildren() ) do
		local pnl = panel.Contents

		if panel.GetExpanded then --Weed out panels that we're not interested in
			if panel:GetExpanded() then
				if pnl.type == "ply" then
					outstr = outstr .. outtmp .. " " .. ( pnl.cantarget:GetChecked() and "$" or "" ) .. ( pnl.txtfield:GetValue() ~= "" and pnl.txtfield:GetValue() or "*" )
					outtmp = ""
				elseif pnl.type == "num" then
					if pnl.hasmin:GetChecked() or pnl.hasmax:GetChecked() then
						outstr = outstr .. outtmp .. " " .. ( pnl.hasmin:GetChecked() and pnl.min:GetValue() or "" ) .. ( pnl.hasmax:GetChecked() and ":" .. pnl.max:GetValue() or "" )
						outtmp = ""
					else
						outtmp = outtmp .. " *"
					end
				elseif pnl.type == "time" then
					if pnl.hasmin:GetChecked() or pnl.hasmax:GetChecked() then
						if pnl.min:GetValue() == 0 then pnl.minterval:ChooseOptionID(1) end --Set to Permanent when 0 hours/mins/weeks/years is selected
						if pnl.max:GetValue() == 0 then pnl.maxterval:ChooseOptionID(1) end

						local minchr = string.lower( pnl.minterval:GetValue():sub(1,1) )
						if minchr == "m" or minchr == "p" then minchr = "" end

						local maxchr = string.lower( pnl.maxterval:GetValue():sub(1,1) )
						if maxchr == "m" or maxchr == "p" then maxchr = "" end

						outstr = outstr .. outtmp .. " "
						if pnl.hasmin:GetChecked() then
							outstr = outstr .. pnl.min:GetValue() .. minchr
						end
						if pnl.hasmax:GetChecked() and not ( maxchr == minchr and pnl.max:GetValue() == pnl.min:GetValue() ) then
							outstr = outstr .. ":" .. pnl.max:GetValue() .. maxchr
						end
						outtmp = ""
					else
						outtmp = outtmp .. " *"
					end

				elseif pnl.type == "bool" then
					outstr = outstr .. outtmp .. " " .. ( pnl.checkbox:GetChecked() and "1" or "0" )
					outtmp = ""
				elseif pnl.type == "str" then
					if #pnl.list.Lines > 0 then
						local strings = {}
						for _, v in pairs( pnl.list.Lines ) do
							table.insert( strings, v:GetColumnText(1) )
						end
						outstr = outstr .. outtmp .. " <" .. table.concat( strings, "," ) .. ">"
					else
						outtmp = outtmp .. " *"
					end
				end
			else
				outtmp = outtmp .. " *"
			end
		end
	end
	outstr = string.sub( outstr, 2 )
	if outstr == "*" then outstr = "" end
	return outstr
end


--------------------------------
------Data refresh/GUI functions
--------------------------------
function groups.getGroupData( group )
	groups.refreshPlayerList()
	groups.populateAccesses()
	groups.aplayer:SetDisabled( group == "user" )
	groups.teams:SetText( groups.getGroupsTeam( groups.list:GetValue() ) )
end

function groups.clearPlayerList()
	groups.players:Clear()
	xgui.flushQueue( "group_userlist" )
end

function groups.sortPlayerList()
	groups.players:SortByColumn( 1, false )
end

function groups.playerRemoved( IDs )
	for i, ID in ipairs( IDs ) do
		groups.removePlayerLine( ID )
	end
end

function groups.removePlayerLine( ID )
	for lID, line in ipairs( groups.players.Lines ) do
		if line:GetColumnText(2) == ID then
			groups.players:RemoveLine( lID )
			break
		end
	end
end

function groups.playerUpdate( data ) --Call when a user has been moved to a different group
	for ID, pdata in pairs ( data ) do
		groups.removePlayerLine( ID ) --Remove the line, if it exists
	end
	groups.playerListAddChunk( data )
	xgui.queueFunctionCall( groups.sortPlayerList, "group_userlist" )
end

--Process a chunk of users and add them to the player list.
function groups.playerListAddChunk( chunk )
	local group = groups.lastOpenGroup
	if not group then return end

	local lastsel
	if groups.players:GetSelectedLine() then lastsel = groups.players:GetSelected()[1]:GetColumnText(1) end

	local function processline( name, ID, lastsel )
		local l = groups.players:AddLine( name, ID )
		if lastsel and name == lastsel then groups.players:SelectItem( l ) end
	end

	if group ~= "user" then
		for ID, user in pairs( chunk ) do
			if user.group == group then
				if user.name == nil or user.name == "" then user.name = ID end
				xgui.queueFunctionCall( processline, "group_userlist", user.name, ID, lastsel )
			end
		end
	else
		for k, v in player.Iterator() do
			if v:GetUserGroup() == "user" then
				xgui.queueFunctionCall( processline, "group_userlist", v:Nick(), v:SteamID(), lastsel )
			end
		end
	end
end

--Refresh the entire player list for a group
function groups.refreshPlayerList()

	groups.cplayer:SetDisabled( true )

	groups.clearPlayerList()
	groups.playerListAddChunk( xgui.data.users )
	xgui.queueFunctionCall( groups.sortPlayerList, "group_userlist" )
end

function groups.playerNameChanged( ply, old, new )
	if groups.lastOpenGroup then
		for i, line in ipairs( groups.players.Lines ) do
			if line:GetColumnText(1) == old then
				line:SetColumnText( 1, new )
			end
		end
	end
end

function groups.updateGroups()
	xgui.data.groups = {}
	groups.SortGroups( ULib.ucl.getInheritanceTree() )
	groups.list:populate()
	groups.glist:populate()
end

function groups.SortGroups( t )
	for k, v in pairs( t ) do
		groups.SortGroups( v )
		table.insert( xgui.data.groups, k )
	end
end
groups.updateGroups()

function groups.updateTeams()
	local last_selected = groups.teamlist:GetSelectedLine() and groups.teamlist:GetSelected()[1]:GetColumnText(1)
	groups.teams:Clear()
	groups.teams:AddChoice( "<None>" )
	groups.teams:AddChoice( "--*" )
	groups.teamlist:Clear()
	local updateLine = nil
	for k, v in pairs( xgui.data.teams ) do
		groups.teams:AddChoice( v.name )
		local l = groups.teamlist:AddLine( v.name )
		if v.name == last_selected then
			updateLine = l
		end
	end
	if updateLine then
		groups.teamlist:SelectItem( updateLine )
	else
		groups.teammodifiers:Clear()
		groups.teammodspace:Clear()
		groups.upbtn:SetDisabled( true )
		groups.downbtn:SetDisabled( true )
		groups.teamdelete:SetDisabled( true )
	end
	groups.teams:SetText( groups.getGroupsTeam( groups.list:GetValue() ) )
end

function groups.getGroupsTeam( check_group )
	--Since ULX doesn't refresh its groups data to clients when team stuff changes, we have to go the long way round to get the info.
	for _, team in ipairs( xgui.data.teams ) do
		for _, group in ipairs( team.groups ) do
			if group == check_group then
				return team.name
			end
		end
	end
	return "<None>"
end
groups.updateTeams()

function groups.updateAccessPanel()
	groups.accesses:Clear()
	groups.access_cats = {}
	groups.access_lines = {}
	groups.access_expandedcat = nil

	local newcategories = {}
	local sortcategories = {}
	local function processAccess( access, data )
		local catname = data.cat or "_Uncategorized"
		if catname == "Command" then
			if ULib.cmds.translatedCmds[access] and ULib.cmds.translatedCmds[access].category then
				catname = "Cmds - " .. ULib.cmds.translatedCmds[access].category
			else
				catname = "_Uncategorized Cmds"
			end
		end
		if not groups.access_cats[catname] then
			--Make a new category
			local list = xlib.makelistview{ headerheight=0, multiselect=false, h=136 }
			list:AddColumn( "Tag" )
			local col = list:AddColumn( "Checkbox" )
			col:SetMaxWidth( 15 )
			col:SetMinWidth( 15 )
			list.OnRowRightClick = function( self, LineID, line )
				groups.showAccessOptions( line )
			end
			list.OnRowSelected = function( self, LineID, Line )
				groups.accessSelected( self, LineID )
				local cmd = Line:GetColumnText(1)
				if ULib.cmds.translatedCmds[cmd] and #ULib.cmds.translatedCmds[cmd].args > 1 then
					if groups.selcmd == cmd then
						self:ClearSelection()
						groups.selcmd = nil
						groups.pnlG5:Close()
						xlib.animQueue_start()
						return
					end
					groups.selcmd = cmd
					if groups.pnlG5:IsVisible() then
						groups.pnlG5:Close()
					end
					groups.pnlG5:Open( cmd, Line:GetColumnText(3) )
					xlib.animQueue_start()
				else
					groups.selcmd = nil
					groups.pnlG5:Close()
					xlib.animQueue_start()
				end
			end
			--Hijack the DataLayout function to manually set the position of the checkboxes
			local tempfunc = list.DataLayout
			list.DataLayout = function( list )
				local rety = tempfunc( list )
				for _, Line in ipairs( list.Lines ) do
					local x,y = Line:GetColumnText(2):GetPos()
					Line.Columns[2]:SetPos( x-2, y+1 )
				end
				return rety
			end
			groups.access_cats[catname] = list
			local cat = xlib.makecat{ label=catname, contents=list, expanded=false, parent=xgui.null }
			newcategories[catname] = cat
			table.insert( sortcategories, catname )
			function cat.Header:OnMousePressed( mcode )
				if ( mcode == MOUSE_LEFT ) then
					self:GetParent():Toggle()
					--Use this to collapse the other categories.
					if groups.access_expandedcat then
						if groups.access_expandedcat ~= self:GetParent() then
							groups.access_expandedcat:Toggle()
						else
							groups.access_expandedcat = nil
							return
						end
					end
					groups.access_expandedcat = self:GetParent()
					return
				end
				return self:GetParent():OnMousePressed( mcode )
			end
		end
		local checkbox = xlib.makecheckbox{}
		checkbox.Button.DoClick = function( self )
			groups.accessChanged( access, not self:GetChecked() )
		end
		local line = groups.access_cats[catname]:AddLine( access, checkbox, "", "" )
		line:SetTooltip( data.hStr )
		groups.access_lines[access] = line
	end

	for access, data in pairs( xgui.data.accesses ) do
		xgui.queueFunctionCall( processAccess, "accesses", access, data )
	end
	--Why queueFunctionCall? Mainly to prevent large lags when performing a bunch of derma AddLine()s at once. queueFunctionCall will spread the load for each line, usually one per frame.
	--This results in the possibility of the end user seeing lines appearing as he's looking at the menus, but I believe that a few seconds of lines appearing is better than 150+ms of freeze time.

	local function finalSort()
		table.sort( sortcategories )
		for _, catname in ipairs( sortcategories ) do
			local cat = newcategories[catname]
			groups.accesses:Add( cat )
			cat.Contents:SortByColumn( 1 )
			cat.Contents:SetHeight( 17*#cat.Contents:GetLines() )
		end
		groups.accesses:InvalidateLayout()
		groups.populateAccesses()
	end
	xgui.queueFunctionCall( finalSort, "accesses" )
end
groups.updateAccessPanel()

function groups.accessChanged( access, newVal, group )
	if not group then group = groups.list:GetValue() end
	if newVal == true then
		RunConsoleCommand( "ulx", "groupallow", group, access )
	else
		--Check to see if they're attempting to remove one of these accesses from themselves:
		if access == "ulx groupallow" or access == "ulx groupdeny" or access == "ulx userallow" or access == "ulx userdeny" or access == "xgui_managegroups" then
			local foundAccess, fromGroup = groups.checkInheritedAccess( LocalPlayer():GetUserGroup(), access )
			if foundAccess and fromGroup == group then
				--Do a check for lower leves to determine whether or not they'll gain access from a lower inheritance level.
				if ULib.ucl.groups[group].inherit_from then
					local foundAccess, fromGroup = groups.checkInheritedAccess( ULib.ucl.groups[group].inherit_from, access )
					if foundAccess then
						RunConsoleCommand( "ulx", "groupdeny", group, access )
						return
					end
				end

				Derma_Query( "WARNING! Removing access to " .. access .. " will revoke YOUR access to features you're currently using.\nYou will most likely not be able to regain access without console intervention.\nAre you sure you wish to proceed?", "XGUI WARNING",
					"Revoke", function() RunConsoleCommand( "ulx", "groupdeny", group, access ) end,
					"Cancel", function() end )
				return
			end
		end
		RunConsoleCommand( "ulx", "groupdeny", group, access )
	end
end

function groups.accessSelected( catlist, LineID )
	for _, cat in pairs( groups.access_cats ) do
		if cat ~= catlist then
			cat:ClearSelection()
		end
	end
end

function groups.showAccessOptions( line )
	local access = line:GetColumnText(1)
	local menu = DermaMenu()
	menu:SetSkin(xgui.settings.skin)
	if line.Columns[2]:GetChecked() then
		if line.Columns[2].disabled then
			menu:AddOption( "Grant access at \"" .. groups.list:GetValue() .. "\" level", function() groups.accessChanged( access, true ) end )

			menu:AddOption( "Revoke access from \"" .. line:GetColumnText(4) .. "\"", function() groups.accessChanged( access, false, line:GetColumnText(4) ) end )
		else
			menu:AddOption( "Revoke access", function() groups.accessChanged( access, false ) end )
		end
	else
		menu:AddOption( "Grant access", function() groups.accessChanged( access, true ) end )
	end
	menu:Open()
end

function groups.updateModelPanel()
	if groups.modelList and groups.modelList:IsValid() then
		groups.modelList:Clear()
		local models = {}
		for k,v in pairs( xgui.data.playermodels ) do models[v] = k end
		groups.modelList:SetModelList( models, nil, false, true )
		groups.modelList:SetHeight( 2.63 )
	end
end

--------------
--ANIMATIONS--
--------------
groups.pnlG1.openAnim = function( self, group )
	xlib.addToAnimQueue( groups.getGroupData, group )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=0, starty=-335, endx=0, endy=0, setvisible=true } )
end
groups.pnlG1.closeAnim = function( self )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=0, starty=0, endx=0, endy=-335, setvisible=false } )
end

groups.pnlG2.openAnim = function( self )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=0, starty=-200, endx=0, endy=0, setvisible=true } )
end
groups.pnlG2.closeAnim = function( self )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=0, starty=0, endx=0, endy=-200, setvisible=false } )
end

groups.pnlG3.openAnim = function( self )
	xlib.addToAnimQueue( groups.clippanelb.SetVisible, groups.clippanelb, true )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=-410, starty=130, endx=5, endy=130, setvisible=true } )
end
groups.pnlG3.closeAnim = function( self )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=5, starty=130, endx=-410, endy=130, setvisible=false } )
	xlib.addToAnimQueue( groups.clippanelb.SetVisible, groups.clippanelb, false )
end

groups.pnlG4.openAnim = function( self )
	xlib.addToAnimQueue( groups.clippanelb.SetVisible, groups.clippanelb, true )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=-210, starty=0, endx=5, endy=0, setvisible=true } )
end
groups.pnlG4.closeAnim = function( self )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=5, starty=0, endx=-210, endy=0, setvisible=false } )
	xlib.addToAnimQueue( groups.clippanelb.SetVisible, groups.clippanelb, false )
end

groups.pnlG5.openAnim = function( self )
	xlib.addToAnimQueue( groups.clippanelc.SetVisible, groups.clippanelc, true )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=-210, starty=0, endx=5, endy=0, setvisible=true } )
end
groups.pnlG5.closeAnim = function( self )
	xlib.addToAnimQueue( "pnlSlide", { panel=self, startx=5, starty=0, endx=-210, endy=0, setvisible=false } )
	xlib.addToAnimQueue( groups.clippanelc.SetVisible, groups.clippanelc, false )
end
--------------

function groups.UCLChanged()
	groups.populateAccesses()
	groups.updateGroups()
end

-- hook.Add( "UCLChanged", "xgui_RefreshGroups", groups.UCLChanged )
-- hook.Add( "ULibPlayerNameChanged", "xgui_plyUpdateGroups", groups.playerNameChanged )
xgui.hookEvent( "users", "clear",  groups.clearPlayerList, "groupsPlayerClear" )
xgui.hookEvent( "users", "process", groups.playerListAddChunk, "groupsPlayerChunk" )
xgui.hookEvent( "users", "done", groups.sortPlayerList, "groupsPlayerSort" )
xgui.hookEvent( "users", "update", groups.playerUpdate, "groupsPlayerUpdate" )
xgui.hookEvent( "users", "remove", groups.playerRemoved, "groupsPlayerRemoved" )
xgui.hookEvent( "teams", "process", groups.updateTeams, "groupsUpdateTeams" )
xgui.hookEvent( "accesses", "process", groups.updateAccessPanel, "groupsUpdateAccesses" )
xgui.hookEvent( "playermodels", "process", groups.updateModelPanel, "groupsUpdateModels" )
xgui.addModule( "Редактор групп", groups, "icon16/group_gear.png", "xgui_managegroups" )

--PATH addons/zeros_weedfarm/lua/zwf_config_selling.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}
zwf.config = zwf.config or {}

zwf.config.NPC = {
    // The model of the npc
    Model = "models/zerochain/props_weedfarm/zwf_npc.mdl",

    // Setting this to false will improve network performance but disables the npc reactions for the player
    Capabilities = true,


    // How will the player sell the Weed?
    SellMode = 1,
    // 1 = The Player needs to put the Weedblocks on the Palette Entity and sell it at the NPC
    // 2 = The Player can absorb the WeedBlocks and sell them at the NPC

    // Do we want to use the dynamic buy rate which changes the Price for weed over time for the NPC
    DynamicBuyRate = true,

    // The maximal buy rate in % (Set to 100 for now no price change)
    MaxBuyRate = 150,

    // The minimal buy rate in % (Set to 100 for now no price change)
    MinBuyRate = 120,

    // The interval at which the sell price changes in second ( Set to -1 to disable the refresh timer)
    RefreshRate = 600,

    // These Jobs can buy Bongs. (Leave empty to allowe everyone to buy bongs)
    Customers = {
        //[TEAM_GANGSTER] = true
    },
}

zwf.config.Bongs = {

    // How much weed gets used per bong hit
    Use_Amount = 1,

    items = {
        [1] = {
            w_class = "zwf_bong01",
            e_class = "zwf_bong01_ent",
            name = "Cherry Bowl",
            desc = "A little sweet bong.",
            hold_amount = 10,
            price = 500,
            model = "models/zerochain/props_weedfarm/zwf_bong01.mdl",
            ranks = {},
        },
        [2] = {
            w_class = "zwf_bong02",
            e_class = "zwf_bong02_ent",
            name = "Reggae Dream",
            desc = "A big reggae colored bong.",
            hold_amount = 15,
            price = 1000,
            model = "models/zerochain/props_weedfarm/zwf_bong02.mdl",
            ranks = {},
        },
        [3] = {
            w_class = "zwf_bong03",
            e_class = "zwf_bong03_ent",
            name = "Dark Leaf",
            desc = "A small bong with weed leafs on it.",
            hold_amount = 20, // How much weed can the bong hold
            price = 1500,
            model = "models/zerochain/props_weedfarm/zwf_bong03.mdl",
            ranks = {
				['vip']             = true,
				['NS-moder'] 		= true,
				['downer']          = true,
				['NS-admin'] 	    = true,
				['NS-helper'] 	    = true,
				['sponsor'] 		= true,
				['padmin'] 		    = true,
				['moder'] 		    = true,
				['overwatch'] 		= true,
				['manager'] 		= true,
				['dsuperadmin'] 	= true,
				['superadmin'] 		= true,
				['NS-trainee'] 		= true,
				['NS-mlmoder'] 		= true,
				['NS-mladmin'] 		= true,
				['NS-assistant'] 	= true,
				['uprav'] 		    = true,
				['NS-zammanager'] 	= true,
				['superadmin'] 	= true,
            },
        },
    }
}

zwf.config.Police = {

    // Do we want the player to get wanted when he sells weed.
    WantedOnWeedSell = true,

    // The Wanted message we display
    WantedMessage = "Sold Weed!",

    // How long is the player wanted for it?
    WantedTime = 120,

    // These jobs can get extra money if they destroy weed reletated stuff and also get a Wanted notification once a player sells weed
    Jobs  = {
        [TEAM_POLICE] = true,
    },

    // How much money the police player gets for destroying weed reletated stuff
    Reward = {
        ["plant"] = 25,
        ["weedblock"] = 100,
        ["weedjunk"] = 25,
        ["weedjar"] = 25,
        ["palette"] = 100, // This value per weedblock on palette entity
    }
}

zwf.config.SnifferSWEP = {
    // Shows every harvest ready weed plant in this distance
    distance = 1000,

    // The duration of the sniff action in seconds per sniff
    duration = 3,

    // How often can the player sniff for illegal items in seconds
    interval = 1,

    // Here we add the entity classes which should be detected
    items = {
        ["zwf_pot"] = {
            // The icon we want to display
            icon = zwf.default_materials["illegal_indicator"],

            // The color of the icon
            color = Color(233, 48, 48),

            // Return true to display the icon
            check = function(ent)
                if ent:GetSeed() ~= 1 and ent:GetHarvestReady() then
                    return true
                else
                    return false
                end
            end
        },
        ["zwf_jar"] = {
            // The icon we want to display
            icon = zwf.default_materials["illegal_indicator"],

            // The color of the icon
            color = Color(233, 48, 48),

            // Return true to display the icon
            check = function(ent)
                if ent:GetPlantID() ~= 1 then
                    return true
                else
                    return false
                end
            end
        },
        ["zwf_pot_hydro"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetSeed() ~= 1 and ent:GetHarvestReady() then
                    return true
                else
                    return false
                end
            end
        },
        ["zwf_joint_ent"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                return true
            end
        },
        ["zwf_palette"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetBlockCount() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zwf_weedblock"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                return true
            end
        },
        ["zwf_weedstick"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                return true
            end
        },
        ["zmlab_collectcrate"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetMethAmount() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zmlab_meth"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetMethAmount() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zmlab_meth_baggy"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetMethAmount() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zmlab_palette"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetMethAmount() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zcm_firecracker"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                return true
            end
        },
        ["zcm_box"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetFireworkCount() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zyb_jar"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetMoonShine() > 0 then
                    return true
                else
                    return false
                end
            end
        },
        ["zyb_jarcrate"] = {
            icon = zwf.default_materials["illegal_indicator"],
            color = Color(233, 48, 48),
            check = function(ent)
                if ent:GetJarCount() > 0 then
                    return true
                else
                    return false
                end
            end
        }
    }
}

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_en.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "en") then

    zwf.language.General["Fuel"] = "Fuel"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Remove"
    zwf.language.General["Splice"] = "Splice" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Bad"
    zwf.language.General["Good"] = "Good"

    zwf.language.General["Collect"] = "Collect"

    zwf.language.General["Speed"] = "Speed"
    zwf.language.General["Productivity"] = "Productivity"
    zwf.language.General["AntiPlague"] = "Anti Plague"

    zwf.language.General["Water"] = "Water"

    zwf.language.General["invalid_character"] = "Name has invalid characters!"
    zwf.language.General["name_too_short"] = "Name too short!"
    zwf.language.General["name_too_long"] = "Name too long!"

    zwf.language.General["Cancel"] = "Cancel"
    zwf.language.General["Enter"] = "Enter"

    zwf.language.General["ItemBought"] = "You bought $itemname for $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "Seed Lab"
    zwf.language.General["seedlab_help"] = "Enter Plant Name"

    zwf.language.General["watertank_refill"] = "Refill"
    zwf.language.General["watertank_title"] = "Watertank"

    zwf.language.General["bong_pickup_fail"] = "You already have this bong!"
    zwf.language.General["bong_no_weed"] = "No Weed!"


    zwf.language.General["generator_repair"] = "Repair!"
    zwf.language.General["generator_start"] = "Start"
    zwf.language.General["generator_stop"] = "Stop"
    zwf.language.General["generator_nofuel"] = "No Fuel!"

    zwf.language.General["packingstation_info"] = "Add Jars of Weed."
    zwf.language.General["packingstation_weedmix"] = "Weed Mix" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Seedbank is full!"

    zwf.language.General["plant_heal"] = "Heal" // The heal button
    zwf.language.General["plant_harvest"] = "Harvest" // The harvest button
    zwf.language.General["plant_infected"] = "Infected!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Post Grow" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Empty" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "You cant afford that!"
    zwf.language.General["not_correct_rank"] = "You dont have the required rank for this!"
    zwf.language.General["entity_limit"] = "You reached the entity limit for $itemname!"


    zwf.language.General["CableDistanceFail"] = "Objects are to far away from each other!"

    zwf.language.General["BongSharingFail"] = "$PlayerName already has this kind of bong!"

    zwf.language.General["WeedBlock"] = "WeedBlock"

    zwf.language.General["WrongJob"] = "Wrong Job!"


    zwf.language.VGUI["Purchase"] = "Purchase"
    zwf.language.VGUI["SellWeed"] = "Sell Weed"
    zwf.language.VGUI["Drop"] = "Drop"
    zwf.language.VGUI["Delete"] = "Delete"
    zwf.language.VGUI["weedbuyer_title"] = "Weed Buyer"
    zwf.language.VGUI["seedbank_title"] = "Seed Bank"
    zwf.language.VGUI["Strain"] = "Strain"
    zwf.language.VGUI["Duration"] = "Duration"
    zwf.language.VGUI["Difficulty"] = "Difficulty"
    zwf.language.VGUI["HarvestAmount"] = "Harvest Amount"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["GrowTimeBoost"] = "Grow Time Boost"
    zwf.language.VGUI["GrowAmountBoost"] = "Grow Amount Boost"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["SeedCount"] = "SeedCount"
    zwf.language.VGUI["PowerUsage"] = "Power Usage"
    zwf.language.VGUI["HeatProduction"] = "Heat Production"
    zwf.language.VGUI["Ranks"] = "Ranks"
    zwf.language.VGUI["SeedName"] = "Seed Name"




    zwf.language.NPC["title"] = "Weed Buyer"
    zwf.language.NPC["profit"] = "Profit"
    zwf.language.NPC["interact_fail"] = "Bugger off!"
    zwf.language.NPC["interact_noweed"] = "Come back when you got something for me!"



    zwf.language.Shop["title"] = "Grow Shop"

    zwf.language.Shop["category_Equipment"] = "Equipment"

    zwf.language.Shop["item_generator_title"] = "Generator"
    zwf.language.Shop["item_generator_desc"] = "Generates Power using Fuel."

    zwf.language.Shop["item_fuel_title"] = "Fuel"
    zwf.language.Shop["item_fuel_desc"] = "Fuel for the Generator."

    zwf.language.Shop["item_lamp01_desc"] = "Provides Light for Plants but increases their Temperature."
    zwf.language.Shop["item_lamp02_desc"] = "Provides Light for Plants without increasing their Temperature."

    zwf.language.Shop["item_ventilator_title"] = "Fan"
    zwf.language.Shop["item_ventilator_desc"] = "Decreases the plants Temperature."

    zwf.language.Shop["item_outlet_title"] = "Power strip"
    zwf.language.Shop["item_outlet_desc"] = "Lets you supply multiple machines with power."

    zwf.language.Shop["item_flowerpot01_title"] = "Flowerpot"
    zwf.language.Shop["item_flowerpot01_desc"] = "Normal Flowerpot for growing plants."

    zwf.language.Shop["item_flowerpot02_title"] = "Hydro Flowerpot"
    zwf.language.Shop["item_flowerpot02_desc"] = "Used to grow plants. Can be connected to a watertank for automatic water supply."

    zwf.language.Shop["item_soil_title"] = "Soil"
    zwf.language.Shop["item_soil_desc"] = "Base matter for growing plants."

    zwf.language.Shop["item_watertank_title"] = "Watertank"
    zwf.language.Shop["item_watertank_desc"] = "Produces water for plants."

    zwf.language.Shop["item_drystation_title"] = "Dry Station"
    zwf.language.Shop["item_drystation_desc"] = "Used to dry weed."

    zwf.language.Shop["item_packingtable_title"] = "Packing Table"
    zwf.language.Shop["item_packingtable_desc"] = "Used to pack weed jars in to a Block for Transport."

    zwf.language.Shop["item_autopacker_title"] = "AutoPacker"
    zwf.language.Shop["item_autopacker_desc"] = "Can be installed in the Packing Table to automate the process."

    zwf.language.Shop["item_seedlab_title"] = "Seed Lab"
    zwf.language.Shop["item_seedlab_desc"] = "Lets you create new seeds from weed."

    zwf.language.Shop["item_seedbank_title"] = "Seed Bank"
    zwf.language.Shop["item_seedbank_desc"] = "Lets you store seeds."

    zwf.language.Shop["item_palette_title"] = "Palette"
    zwf.language.Shop["item_palette_desc"] = "Used for selling Blocks of Weed to the Weed Buyer."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush is a legendary strain with a name that has recognition even outside of the cannabis world."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush is a heavy indica hybrid that enjoys very wide popularity."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel’s energized and positive high makes it easy to see why the strain enjoys popularity across the United States."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 is a Sativa-dominate hybrid with bright white coloring."
    zwf.language.Shop["item_seed05_desc"] = "The genetics of Super Lemon Haze combine sweet and tart."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Cough is a bracing, taste-focused sativa hybrid."
    zwf.language.Shop["item_seed07_desc"] = "The purple characteristic of this strain is inherited from its ancestors from the Chitral region in the Pakistani Hindu Kush."

    zwf.language.Shop["category_Nutritions"] = "Fertilizer"

    zwf.language.Shop["item_nutrition01_desc"] = "A small Grow boost for your plant."
    zwf.language.Shop["item_nutrition02_desc"] = "Increases the growth speed of the plant a lot."
    zwf.language.Shop["item_nutrition03_desc"] = "A small Harvest boost for your plant."
    zwf.language.Shop["item_nutrition04_desc"] = "Increases the Harvest amount of the plant a lot."
    zwf.language.Shop["item_nutrition05_desc"] = "Increases both Harvest amount and Grow speed a bit."
    zwf.language.Shop["item_nutrition06_desc"] = "Increases both Harvest amount and Grow speed a lot."

    zwf.language.Shop["category_Seeds"] = "Seeds"



    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "You already have a joint!"
    zwf.language.General["JointSharingFail"] = "$PlayerName already has a joint!"

    zwf.language.NPC["question_01"] = "What do you want?"
    zwf.language.NPC["question_01_answer01"] = "I want to buy a Bong"
    zwf.language.NPC["question_01_answer02"] = "I got some Weed for you"
    zwf.language.NPC["question_01_answer03"] = "Nothing"

    zwf.language.NPC["question_02"] = "Which one do you want?"
    zwf.language.NPC["question_02_answer01"] = "Go Back" // This is the Back button on the NPC BongShop interface

end

--PATH addons/zeros_weedfarm/lua/zweedfarm/cl/zwf_player_cl.lua:
if SERVER then return end

// Sends a net msg to the server that the player has fully initialized and removes itself
hook.Add("HUDPaint", "a_zwf_PlayerInit_HUDPaint", function()
	zwf.f.Debug("zwf_PlayerInit_HUDPaint")

	net.Start("zwf_Player_Initialize")
	net.SendToServer()
	hook.Remove("HUDPaint", "a_zwf_PlayerInit_HUDPaint")
end)

--PATH vcmod??overrides:
local meta = FindMetaTable("Entity")  if SERVER then  util.AddNetworkString("VC_BGroup_Changed")  function VC.Seats_SetAllowed(ent) if VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).ExtraSeats then for k,v in pairs(VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).ExtraSeats) do v.Denied = v.BGroups and !VC.BGroups_Check(ent, "Seat "..k, v.BGroups) end end end else  net.Receive("VC_BGroup_Changed", function(len, ply) local ent, var1 = net.ReadEntity(), net.ReadInt(8) if !IsValid(ent) then return end ent.VC_BGroup_Tbl = nil if VC.ELS_BgroupChanged then VC.ELS_BgroupChanged(ent, var1) end end) end  local function BGroupChanged(ent, var1, var2, var3)  if IsValid(ent) and ent:IsVehicle() then hook.Call("VC_BodyGroupChanged", GAMEMODE, var1, var2, var3) hook.Call("VC_bodyGroupChanged", GAMEMODE, var1, var2, var3) end  if SERVER then  ent.VC_BGroup_Tbl = nil  if VC.Seats_SetAllowed then VC.Seats_SetAllowed(ent) end  net.Start("VC_BGroup_Changed") net.WriteEntity(ent) net.WriteInt(var2 or 0, 8) net.Broadcast()  if type(var1) == "number" and ent.VC_SeatBGroupCheckTbl and ent.VC_SeatBGroupCheckTbl[var1] then VC.SeatsForceReEnter(ent) end   if VC.ELS_BgroupChanged then VC.ELS_BgroupChanged(ent, var1) end   if VC.recheckProjTextures then VC.recheckProjTextures(ent) end  end end  if !meta.VC_Defaults_SetBodygroup then meta.VC_Defaults_SetBodygroup = meta.SetBodygroup end function meta:SetBodygroup(...)  self:VC_Defaults_SetBodygroup(...)  if self:IsVehicle() then BGroupChanged(self, ...) end end  if !meta.VC_Defaults_SetBodyGroups then meta.VC_Defaults_SetBodyGroups = meta.SetBodyGroups end function meta:SetBodyGroups(...)  self:VC_Defaults_SetBodyGroups(...)  if self:IsVehicle() then BGroupChanged(self, ...) end end  if !meta.VC_Defaults_SetSkin then meta.VC_Defaults_SetSkin = meta.SetSkin end function meta:SetSkin(...)  if IsValid(ent) and ent:IsVehicle() then hook.Call("VC_SkinChanged", GAMEMODE, ...) hook.Call("VC_skinChanged", GAMEMODE, ...) end  self:VC_Defaults_SetSkin(...) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?data_menu_shared:
if !VC.Menu_Items_P then VC.Menu_Items_P = {} end if !VC.Menu_Items_A then VC.Menu_Items_A = {} end  local function BuildMenu(Pnl)  local Font2 = "VC_Treb24_Small" if !VC.Fonts[Font2] then VC.Fonts[Font2] = true surface.CreateFont(Font2, {font = "Trebuchet24", size = 17, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end  local Font3 = "VC_Treb24_12" if !VC.Fonts[Font3] then VC.Fonts[Font3] = true surface.CreateFont(Font3, {font = "Trebuchet24", size = 12, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end  local Font_Logo = "VC_Logo" if !VC.Fonts[Font_Logo] then VC.Fonts[Font_Logo] = true surface.CreateFont(Font_Logo, {font = "MenuLarge", size = 40, weight = 1000, blursize = 2, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end   local List = VC.Add_El_List(7, 130, Pnl:GetWide()-14, Pnl:GetTall()-82) List:SetParent(Pnl) List:SetSpacing(7)   Pnl.Paint = function(obj, Sx, Sy)  draw.DrawText(game.SinglePlayer() and VC.Lng("YouAreUsingVCMod") or VC.Lng("ServerIsUsingVCMod"), "VC_Big_Italic", List:GetWide()/2, 5, VC.Color.Blue, TEXT_ALIGN_CENTER)  draw.DrawText(VC.Lng("Info_EverThought"), Font2, 50, 50, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)  draw.DrawText(VC.Lng("Info_VCModIsDesigned"), Font2, 10, 68, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)   draw.DrawText(VC.Lng("Info_VCModHasFollowingAddons"), Font2, 10, 100, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)  end   local news = vgui.Create("DHTML", Pnl) news:OpenURL("https://vcmod.org/".."api/news_v3.php?st=ns") news:SetPos(5, Pnl:GetTall()*0.7) news:SetSize(Pnl:GetWide()-10, 152)  news.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, Color(255,255,255,255))  draw.DrawText(VC.Lng("WhyISellVCMod"), Font3, Sx+5, 8, VC.Color.Blue, TEXT_ALIGN_RIGHT)  end   local objects = {} if VC.DataServer then for k,v in pairs(VC.DataServer) do local El = vgui.Create("VC_Ball", Pnl) El:SetSize(v.size,v.size) El:SetPos(Pnl:GetWide()*v.pos_x-v.size/2, Pnl:GetTall()*v.pos_y-v.size/2) local Px, Py = El:GetPos() objects[k] = {El, Px, Py, math.Rand(0.5,3), math.Rand(0.5,3), math.Rand(2,4), math.Rand(2,4)} El:Setup(v) El:NoClipping(true) end end   Pnl.Think = function()  for k,v in pairs(objects) do  local Px, Py = v[2], v[3] local sin = math.sin(CurTime()*v[4])*v[6]  v[1]:SetPos(Px+math.sin(CurTime()*v[4])*v[6], Py+math.sin(CurTime()*v[5])*v[7])  end  end   local Btn = vgui.Create("DButton") Btn:SetPos(5, Pnl:GetTall()-185) Btn:SetSize(145, 25) Btn:SetText(" ") Btn:SetParent(Pnl) Btn:NoClipping(true)  Btn.DoClick = function() gui.OpenURL(VC.Host.."api/whyisellvcmod.php?st=ws") end  Btn.Paint = function(stuff, Sx, Sy)  if Btn:IsHovered() then  local clr = table.Copy(VC.Color.Main)  draw.RoundedBox(0, 0, 0, Sx+12, Sy, clr)  end  draw.DrawText(VC.Lng("WhyISellVCMod"), Font3, Sx/2+5, 8, VC.Color.Blue, TEXT_ALIGN_CENTER)  end   local Btn = vgui.Create("DButton") Btn:SetPos(Pnl:GetWide()-130, Pnl:GetTall()-185) Btn:SetSize(125, 25) Btn:SetText(" ") Btn:SetParent(Pnl) Btn:NoClipping(true)  Btn.DoClick = function() gui.OpenURL("http://steamcommunity.com/id/freemmaann/") end  Btn.Paint = function(stuff, Sx, Sy)  if Btn:IsHovered() then  local clr = table.Copy(VC.Color.Main)  draw.RoundedBox(0, 0, 0, Sx+12, Sy, clr)  draw.RoundedBox(0, 137, 0, 135, 20, Color(clr.r,clr.g,clr.b,248))   draw.DrawText("email:", Font3, Sx+15, 8, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("freemmaann@gmail ", Font3, Sx+50, 8, VC.Color.Good, TEXT_ALIGN_LEFT)  end  draw.DrawText(VC.Lng("CreatedBy")..": ", Font3, Sx-60, 8, VC.Color.Blue, TEXT_ALIGN_RIGHT)  draw.DrawText("freemmaann", Font3, Sx-5, 8, VC.Color.Good, TEXT_ALIGN_RIGHT)  end end VC.Menu_Info_Panel_Build = {"Info", BuildMenu}  local function BuildMenu(Pnl)  local PW = Pnl:GetWide()  local List = VC.Add_El_List(0, 40, PW, Pnl:GetTall()-40) List:SetParent(Pnl)  local html = vgui.Create("DHTML", List) html:OpenURL(VC.Host.."ingame/changelog2/general/") html:SetPos(0, 0) html:SetSize(List:GetSize()) html.Paint = function(obj, Sx, Sy) surface.SetDrawColor(VC.Color.Base)  surface.DrawRect(0,0,Sx,Sy) end   local X, Y = List:GetPos() local Sx, Sy = List:GetSize()  Pnl.Paint = function(obj, Sx, Sy)  draw.DrawText(VC.Lng("UpdatesAreAppliedAutomaticallyAfterMapRestart"), "VC_Dev_Text", List:GetWide()/2, 10, VC.Color.White, TEXT_ALIGN_CENTER)  end  return Draw end VC.Menu_Update_Panel_Build = {"Updates", BuildMenu} local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?enter_exit:
function VC.isMidEnterExit(ply)     return ply.VC_isEntering or ply.VC_isExiting end  function VC.enterStarted(ply, ent)     local mainVeh = VC.getMainVehicle(ent)      ply.VC_isEntering = CurTime()+ math.Max(math.Rand(0.7,1), mainVeh:SequenceDuration() or 0)      ply.VC_isExiting = false      ply.VC_InVeh = true     ply.VC_lastVehicle = ent     ent.VC_lastDriver = ply      VC.handleAnimEnterStartInstant(ply, ent) end  function VC.enterFinished(ply, ent)     ply.VC_isEntering = false end  function VC.exitStarted(ply, AIVeh)     local ent = ply.VC_lastVehicle     if IsValid(ent) then         local mainVeh = VC.getMainVehicle(ent)         ply.VC_isExiting = CurTime()+ math.Max(math.Rand(0.7,1), mainVeh:SequenceDuration() or 0)         ply.VC_isEntering = false     end      VC.ResetBones(ply) end  function VC.exitFinished(ply, ent)     ply.VC_isExiting = false      if IsValid(ent) then         ent.VC_lastDriver = nil     end          if IsValid(ply) then         ply.VC_lastVehicle = nil         ply.VC_InVeh = false     end end   function VC.seatSwitched(ply, ent_old, ent)  end    function VC.VehicleChanged(ply, ent)  VC.ResetBones(ply) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?anim_shared:
function VC.ResetBones(ent)  if ent.VC_BoneTable then  for k, v in pairs(ent.VC_BoneTable) do  ent:ManipulateBoneAngles(k, Angle(0,0,0))  end  ent.VC_BoneTable = nil  end end   function VC.handleAnimEnterStartInstant(ply, ent, alsoExtraSeat)     if VC.anim_DoBendLegs then VC.anim_DoBendLegs(ply, ent, alsoExtraSeat) end   if VC.anim_OnDriverEnter then VC.anim_OnDriverEnter(ply, ent, alsoExtraSeat) end end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?language_init:
if !VC.Lng_T then  VC.Lng_T = {}  VC.Lng_T_Rev = {}  end  local Lng = {} Lng.Name = {"English", 'Specify this in your native language. Example: "Lietuvių", not "Lithuanian".'} Lng.Language_Code = {"en", "Country code"} Lng.Translated_By_Name = {"freemmaann", 'Your name.'} Lng.Translated_By_Link = {"http://steamcommunity.com//id/freemmaann/", "Your steam link."} Lng.Translated_Date = {"2016/05/26", "Date of which this was updated."}  Lng.BigThankYouToAllWhoHelpedTranslate = {"Big thank you to all who helped translate VCMod", ''} Lng.WishToHelpTranslate = {"Wish to help translate? Click here.", ''} Lng.Outdated = {"Outdated", ''} Lng.Good = {"Good", ''} Lng.TheName = {"Name", ''} Lng.Overrides = {"Overrides", ''} Lng.Tire = {"Tire", ''} Lng["Too soon"] = {"Too soon!", ''} Lng["Please wait"] = {"Please wait!", ''} Lng["Changed"] = {"Changed", ''} Lng.Light = {"Light", ''} Lng.Revision = {"Revision", ''} Lng.Compatibility = {"Compatibility", ''} Lng.Use = {"Use", ''} Lng.Disabled = {"Disabled", '"Test drive is diabled."'} Lng.Overwritten = {"Overwritten", ''} Lng.Status = {"Status", ''} Lng.Override_Controls = {"Override controls", ''} Lng.Date = {"Date", ''} Lng.Effects = {"Effects", ''} Lng.Logs = {"Logs", 'Logging events of VCMod.'} Lng.Return = {"Return", ''} Lng.Locked = {"Vehicle locked.", 'Vehicle has been locked.'} Lng.UnLocked = {"Vehicle unlocked.", 'Vehicle has been unlocked.'} Lng.FuelLidPosition = {'Fuel lid position', ''} Lng.Chat = {'To adjust options (car lights, view) type "!vcmod" in chat.', 'You seen this menu in chat when entering a vehicle.'} Lng.Broken = {"This vehicle is broken, it needs to be repaired.", 'You see this when entering a broken vehicle.'} Lng.AutoEnter = {"Automatically enter", ''} Lng.LimitReturnDistance = {"Limit return distance", ''} Lng.AutoReturnOnDisconnect = {"Automatically return vehicles on disconnect", ''} Lng.Trl_Atch = {"Trailer attached.", 'When attaching a trailer. "This trailer has been attached."'} Lng.Trl_Detch = {"Trailer detached.", 'When detaching a trailer. "This trailer has been detached."'} Lng.ELS_TuningIntoPoliceC = {"Tuning into police chatter", 'When entering an emergency vehicle displayed in chat.'} Lng.ELS_NoPoliceRCFound = {"No police chatter found.", 'When failed to find a police chatter stream when entering an emergency vehicle.'} Lng.All = {"All", '"All vehicles have been spawned."'} Lng.Apply = {"Apply", ''} Lng.Added = {"Added", 'Added something to something.'} Lng.Done = {"Done", 'Done doing something.'} Lng.Updates = {"Updates", ''} Lng.UpdatesAreAppliedAutomaticallyAfterMapRestart = {"Updates are applied automatically after map restart.", ''} Lng.UnknownVehicle = {"Unknown Vehicle", 'When entering a vehicle.'} Lng.Close = {"Close", '"To close this menu."'} Lng.LoadFromFile = {"Load from file", ''} Lng.Engine = {"Engine", ''} Lng.Available = {"Available", '"These vehicles are available to be purchased."'} Lng.JobRelated = {"Job related", ''} Lng.Buy = {"Buy", '"You can buy this vehicle."'} Lng.Sell = {"Sell", 'You can sell this vehicle.'} Lng.Paintjob = {"Paint job", 'Vehicles paint job, in other words, its skin.'} Lng.Spawn = {"Spawn", '"I am able to spawn thing vehicle."'} Lng.Purchase = {"Purchase", '"You are able to purchase this vehicle."'} Lng.Purchased = {"Purchased", '"This vehicle has been purchased."'} Lng.TestDrive = {"Test drive", '"You can test drive this vehicle."'} Lng.Allowed = {"Allowed", '"Was allowed to do something."'} Lng.NotAllowedRemoveOtherVehicles = {"Not allowed, remove other spawned vehicles.", '""'} Lng.AccessRestricted = {"Access restricted.", '"Your access has been restricted. In other words, denied."'} Lng.CantBeUsedBy = {"Can't be used by", '"Used in car dealer when someone is trying to use something they dont have access to."'} Lng.CantBeSpawnedBy = {"Can't be spawned by", '"Used in car dealer when someone is trying to spawn something they dont have access to."'} Lng.OriginalPrice = {"Original price", '"Vehicles original price."'} Lng.RefundPercentage = {"Refund percentage", 'The percentage you receive when selling the vehicle from the original price.'} Lng.SellingPrice = {"Selling price", 'For what price it will be sold.'} Lng.Free = {"Free", '"This addon is free."'} Lng.Humming = {"Humming", 'Humming, as in singing quitly.'} Lng.Persistent = {"Persistent", 'Constantly staying on or not wanting to change.'} Lng.TowingNotAllowTooFar = {"Not allowed to tow if too far", 'Car can not be towed back if its too far away.'} Lng.TooFar = {"Too far", 'Something is not close enough.'} Lng.Blurred = {"Blurred", 'Blurry, smudged.'} Lng.CoreOptions = {"Core options", ''} Lng.RM_Settings = {"Repair Man options", ''} Lng.HoldUseToPickup = {"Hold [USE] to pick up", ''} Lng.YouAlreadyHaveSpikestrip = {"You already have spike strip", ''} Lng.RepairMan = {"Repair Man", ''} Lng.NoneAdmin = {"None administrator", ''} Lng.AdminControlsCanBeAlteredBy = {"Administrator controls can be altered by:", ''} Lng.RMPlaced = {"Repair man placed", ''} Lng.Rays = {"NoneFound", '"None found."'} Lng.Rays = {"Rays", '"These light rays are blinding."'} Lng.Rotate = {"Rotate", '"Rotate this object around."'} Lng.customisation = {"customization", 'To alter, change something, customize.'} Lng.Sold = {"Sold", '"This vehicle has been sold."'} Lng.Tab = {"Tab", 'Same as the "Vehicle tab" or "NPC tab" you see in the Q menu.'} Lng.Previous = {"Previous", 'A thing before that. "Previous vehicle."'} Lng.Next = {"Next", 'A thing after that. "Next vehicle."'} Lng.RepairingVehicleAdmin = {"Admin: repairing vehicle", ''} Lng.Active = {"Active", ''} Lng.Idle = {"Idle", ''} Lng.TouchBrokenCarPiece = {"Touch broken car piece", ''} Lng.Pumping = {"Pumping", ''} Lng.Fuel_lidNeedUnlocked = {"Has to be unlocked to refuel.", ''} Lng.FuelTaken = {"Fuel taken", ''} Lng.DroppedFuel = {"Fuel dropped", ''} Lng.Wheels = {"Wheels", ''} Lng.critical = {"critical", ''} Lng.destroyed = {"destroyed", ''} Lng.damaged = {"damaged", ''} Lng.Repairs = {"Repairs", ''} Lng.DamagedParts = {"Damaged parts", ''} Lng.EngineNew = {"Engine new", ''} Lng.SelectVehicle = {"Select a vehicle", ''} Lng.YourVehiclesRepairsComplete = {"Your vehicle repairs are complete.", ''} Lng.severelydamaged = {"severely damaged", ''} Lng.YourVehiclesRepairsFailed = {"Your vehicle repair have failed", ''} Lng.sec = {"sec", ''} Lng.RepairSpeedMult = {"Repair speed multiplier", ''} Lng.NeedVehiclePart = {"Need a vehicle part", ''} Lng["Front left"] = {"Front left", 'Keep this etremely short.'} Lng["Front right"] = {"Front right", 'Keep this etremely short.'} Lng["Rear left"] = {"Rear left", 'Keep this etremely short.'} Lng["Rear right"] = {"Rear right", 'Keep this etremely short.'} Lng.Repairing = {"Repairing", ''} Lng.Prices = {"Prices", ''} Lng.PartsCost = {"Parts cost", ''} Lng.RepairCost = {"Repair cost", ''} Lng.RepairTime = {"Repair time", ''} Lng.Total = {"Total", ''} Lng.OutOfFuel = {"Out of fuel", ''} Lng.FuelRemaining = {"Fuel remaining", ''} Lng.Function = {"Function", ''} Lng.TestDriveEnded = {"Test drive ended.", '"Test drive has ended."'} Lng.EndTestDrive = {"End test drive", 'Button text. "To end a test drive."'} Lng.Error = {"Something went wrong.", ""} Lng.Respawn = {"Respawn", ""} Lng.Create = {"Create", ""} Lng.CantRemoveThisWay = {"Can't remove this way.", ""} Lng.Price = {"Price", ""} Lng.Add = {"Add", ""} Lng.OnlyAllowOneCarToBeSpawnedPerCarDealerPerUser = {"Only allow one car to be spawned per car dealer per user", ""} Lng.StoreInformation = {"Store information", "This car dealer will star information like fuel and health state of the vehicle."} Lng["Unlock vehicle on use by the spawner"] = {"Unlock vehicle on use by the spawner", ""} Lng["Unlock vehicle on use by person who locked from inside"] = {"Unlock vehicle on use by the person who locked from inside", ""} Lng.TextViewDistance = {"Text view distance", ""} Lng.DetectDistance = {"Detect distance", ""} Lng.TowingCost = {"Towing cost", ""} Lng.RefundPricePerc = {"Refund price %", ""} Lng.VehiclesCanBeRemovedByTool = {"Vehicles can be removed by tool", ""} Lng.CD_Cant_Afford = {"You can not afford this.", ''} Lng.ReachedMaxCapacity = {"Reached maximum capacity", ''} Lng.CD_Loading = {"Keep calm, car dealer is loading.", ''} Lng.VehicleBought = {"Vehicle has been bought.", ''} Lng.ParkingLotsTaken = {"All parking lots taken.", ''} Lng.NoVehiclesFound = {"No vehicles found", ''} Lng.VehicleSpawned = {"Vehicle has been spawned", ''} Lng.AreYouSureYouWantToSell = {"Are you sure you want to sell", ''} Lng.TestDriveTimeLeft = {"Test drive time left", ''} Lng.SpawnedVehicle = {"Spawned vehicle", ''} Lng.FirstReturnTheVehicle = {"You have to return the vehicle first.", ''} Lng.VehicleReturned = {"Vehicle returned.", ''} Lng.VehicleTowedFor = {"Vehicle towed for", ''} Lng.YouHaveToBeAdmin = {"You have to be an administrator.", ''} Lng.CDPlaced = {'Car dealer placed', ''} Lng.Deleted = {'Successfully deleted', ''} Lng.CDsPlaced = {"All car dealer's respawned.", ''} Lng.CDSpawnedIncorrectly = {"Car dealer has been spawned incorrectly.", ''} Lng.NoCloseVehicles = {"No nearby vehicles available.", ''} Lng.PosChanged = {"Positions changed.", ''} Lng.TouchCarWithThis = {"Touch a car using this for it to take affect.", ''} Lng.Info = {"Info", '"Information"'} Lng.Menu = {"Menu", '"Open this menu."'} Lng.Author = {"Author", ''} Lng.NoCDFound = {"No car dealer found", ''} Lng.Language = {"Language", ''} Lng.Personal = {"Personal", ''} Lng.Administrator = {"Administrator", ''} Lng.SuperAdmin = {"Super administrator", ''} Lng.Options = {"Options", ''} Lng.ELSOptions = {"ELS options", ''} Lng.Main = {"Main", '"Main lights."'} Lng.Controls = {"Controls", ''} Lng.Accept = {"Accept", ''} Lng.Cancel = {"Cancel", ''} Lng.HUD = {"HUD", ''} Lng.CruisingAt = {"Cruising at", ''} Lng.Damage_Repair_GiveWrenchToDriver = {"Give repair wrench to driver", ''} Lng.Damage_Repair_GiveWrenchToCarPartUser = {"Give repair wrench on vehicle part use", ''} Lng.Damage_Repair_NeedPart = {"Repairing with wrench needs vehicle part", ''} Lng.View = {"View", ''} Lng.Advanced = {"Advanced", ''} Lng.Lerp = {"Lerp", ''} Lng.ThirdPView = {"Radio", ''} Lng.FlatTire = {"Flat tire", ''} Lng.Radio = {"Radio", ''} Lng.Multiplier = {"Multiplier", 'A thing that multiplies things.'} Lng.OptOnly_You = {"These options will only affect you", ''} Lng.OptOnly_Admin = {"These settings can only be changed by an administrator", ''} Lng.OptOnly_SuperAdmin = {"These settings can only be changed by a super administrator", ''} Lng.CD_Settings = {"Car dealer", ''} Lng.Normal = {"Normal", ''} Lng.Skidding = {"Skidding", ''} Lng.Sparks = {"Sparks", ''} Lng.TireTracks = {"Tire tracks", ''} Lng.Height = {"Height", ''} Lng.PerformanceImpact = {"Performance impact", ''} Lng.Detail = {"Detail", ''} Lng.SpeedTilt = {"Speed tilt", ''} Lng.FadeOutTime = {"Fade out time", 'Time after which things start to become dimmer and dimmer.'} Lng.FadeOutDistance = {"Fade out distance", 'Distance at which things start to become dimmer and dimmer.'} Lng.BendPassengerLegs = {"Bend passenger legs", ''} Lng.OverrideDriverAnims = {"Override driver animations, position", ''} Lng.Reset = {"Reset", ''} Lng.Save = {"Save", ''} Lng.Load = {"Load", ''} Lng.Map = {"Map", ''} Lng.Volume = {"Volume", 'How load a thing is.'} Lng.LockFromInside = {"Lock vehicle from inside", ''} Lng.ThirdPersonViewSeeThroughProps = {"Third person view allows players to see through props", ''} Lng.LimitDriveByView = {"Limit drive by view", 'While in drive by if it should limite the player view rotation.'} Lng.Distance = {"Distance", ''} Lng.CantSwitchFromThisSeat = {"Can't change seats from this seat.", ''} Lng.CantSwitchToFront = {"You can not switch to front.", ''} Lng.CantExitWhileLocked = {"Can't exit while vehicle is locked.", ''} Lng.ExitPointNotFound = {"Exit blocked!", 'Ran when exiting the vehicle, no points found'} Lng.None = {"None", ''} Lng.Loading = {"Loading...", ''} Lng.EnterKey = {"Enter key", '"Please anter a key."'} Lng.Enabled_Cl = {"Enabled clientside", ''} Lng.Enabled_Sv = {"Enabled serverside", ''} Lng.Lights = {"Lights", ''} Lng.Health = {"Health", ''} Lng.Sound = {"Sound", ''} Lng.Other = {"Other", ''} Lng.CreatedBy = {"Created by", ''} Lng.Enabled = {"Enabled", ''} Lng.OffTime = {"Off time", 'Time in which it will be off.'} Lng.Time = {"Time", ''} Lng.DistMultiplier = {"Distance multiplier", ''} Lng.ControlsReset = {"Controls reset.", ''} Lng.SettingsSaved = {"Settings saved.", ''} Lng.SettingsReset = {"Settings reset.", ''} Lng.LoadedSettingsFromServer = {"Settings loaded from server.", ''} Lng.InteriorIndicators = {"Interior indicators", 'Indicators that are inside of a vehicle.'} Lng.ExtraGlow = {"Extra glow", ''} Lng.ManualSiren = {"Manual siren", ''} Lng.ELSSirenSwitch = {"ELS siren switch", ''} Lng.ELSSirenToggle = {"ELS siren toggle", ''} Lng.ELSLightsSwitch = {"ELS lights switch", ''} Lng.ELSLightsToggle = {"ELS lights toggle", ''} Lng.VCModMainEnabled = {"VCMod main enabled", ''} Lng.VCModELSEnabled = {"VCMod ELS enabled", ''} Lng.ELSLightsEnabled = {"ELS lights enabled", ''} Lng.AutoDisableELSLights = {"Auto disable ELS lights", ''} Lng.OffOnExit = {"Off on exit", ''} Lng.Siren = {"Siren", ''} Lng.AutoDisableELSSounds = {"Auto disable ELS sounds", ''} Lng.Manual = {"Manual", ''} Lng.AdvancedDamage = {"Advanced damage", ''} Lng.Damage_Lights = {"Can damage lights", ''} Lng.Damage_Wheels = {"Can damage tires", ''} Lng.Damage_Wheels_ELSOff = {"ELS vehicles have bullet-proof tires", ''} Lng.Damage_Exhaust = {"Can damage exhaust", ''} Lng.Damage_Exhaust_Backfire = {"Can backfire", ''} Lng.Damage_FuelLid = {"Can damage fuel lid", ''} Lng.Indication = {"Indication", 'Things that indicate something, example: "Popup headlights".'} Lng.Damage_Custom_Sounds = {"Custom collision sounds", ''} Lng.SpikeStrip_auto_give_els = {"Spike strip auto given in ELS vehicles", ''} Lng.Spikestrip = {"Spike strip", ''} Lng.SpikeStrip_auto_remove_death = {"Spike strip auto remove when player dies", ''} Lng.CanDamagePlayersNPCs = {"Can damage players/NPCs", ''} Lng.IgnoreEmergencyVehicles = {"Ignore emergency vehicles", ''} Lng.Explode = {"Explode", ''} Lng.Off = {"Off", ''} Lng.Light_Damage = {"Light damaged", ''} Lng.Light_Damaged = {"Light damaged, use sparks", 'The sparks when a light is damaged but is attempted to be used.'} Lng.Exhaust_Damage = {"Exhaust damaged", ''} Lng.Wheel_Damage = {"Tire damaged", ''} Lng.Damage_Sparks_Damage = {"Collision sparks", ''} Lng.Explosion_Custom = {"Custom explosion", ''} Lng["Help translate"] = {"Help translate"} Lng.Exhaust_Custom = {"Custom exhaust", ''} Lng.Brake_Effects = {"Brake/sliding - effects, tire tracks, sounds", ''} Lng.On = {"On", ''} Lng.Bullhorn = {"Bullhorn", ''} Lng.PoliceChatterEnabled = {"Police chatter enabled", ''} Lng.PoliceChatter = {"Police chatter", ''} Lng.PoliceChatter_Info = {"Police chatter is a real time feed of official police chatter VIA radio.", ''} Lng.SelectedRadioChatter = {"Selected radio chatter channel", ''} Lng.ReduceDamageToEmergencyVehicles = {"Reduce damage to emergency vehicles", ''} Lng.Repair = {"Repair", ''} Lng.YouAreUsingVCMod = {"You are using VCMod", ''} Lng.ServerIsUsingVCMod = {"This server is using VCMod", ''} Lng.Info_EverThought = {"Ever thought that Garrysmod's vehicles are lacking realism?", ''} Lng["Search"] = {"Search"} Lng["Core"] = {"Core"} Lng["Home"] = {"Home"} Lng["Changelog"] = {"Changelog"} Lng.Info_VCModIsDesigned = {"VCMod is designed to provide Garrysmod's vehicle with full assortment of features.", ''} Lng.Info_VCModHasFollowingAddons = {"VCMod has the following addons:", ''} Lng.WhyISellVCMod = {"Why VCMod is for sale", ''} Lng.VisDist = {"Visibility distance", ''} Lng.Warmth = {"Warmth", ''} Lng.Lines = {"Lines", ''} Lng.Glow = {"Glow", ''} Lng.DynamicLights = {"Dynamic lights", ''} Lng.ThirdPersonView = {"Third person view", ''} Lng.DynamicView = {"Dynamic view", ''} Lng.AutoFocus = {"Auto focus", ''} Lng.Reverse = {"Reverse", ''} Lng.VectorStiffness = {"Vector stiffness %", ''} Lng.AngleStiffness = {"Angle stiffness %", ''} Lng.TruckView = {"Truck connected view", ''} Lng.HoldDuration = {"Hold duration", ''} Lng.HoldKey = {"Hold key", ''} Lng.SwitchSeats = {"Switch seats:", ''} Lng.KickPeopleOut = {"Kick people out:", ''} Lng.OpenMenu = {"Open menu", ''} Lng.Body = {"Body", ''} Lng.Steering = {"Steering", ''} Lng.FrontAxle = {"Front Axle", ''} Lng.RearAxle = {"Rear Axle", ''} Lng.Mouse = {"Mouse", ''} Lng.KeyboardInput = {"Keyboard input", ''} Lng.MouseInput = {"Mouse input", ''} Lng.RunningLights = {"Running lights", ''} Lng.LightsSwitch = {"Swich lights", ''} Lng.HeadLights = {"Head lights", ''} Lng.FogLights = {"Fog lights", ''} Lng.Handling = {"Handling", ''} Lng.LowHighBeamToggle = {"Low/High beams", ''} Lng.LowHigh = {"Low/High beam toggle", ''} Lng.LowBeams = {"Low beams", ''} Lng.HighBeams = {"High beams", ''} Lng.HighBeamsFlash = {"High beams flash", ''} Lng.HazardLights = {"Hazard lights", ''} Lng.BlinkerLeft = {"Blinker left", ''} Lng.BlinkerRight = {"Blinker right", ''} Lng.Exhaust_Effect_BackFireHealthLow = {"Exhaust backfires if health is low", ''} Lng.DriveBy_NoSwitch = {"No switching weapons while in drive by mode", ''} Lng.Horn = {"Horn", ''} Lng.Cruise = {"Cruise", ''} Lng.LockUnlock = {"Lock/Unlock", ''} Lng.LookBehind = {"Look behind", ''} Lng.DetachTrailer = {"Detach trailer", ''} Lng.Wipers = {"Wipers", ''} Lng.Weaponry = {"Weaponry", ''} Lng.AuxiliaryLights = {"Auxiliary Lights", ''} Lng.Effect3D = {"3D effect", ''} Lng.PickupDistance = {"Pickup text draw distance", ''} Lng.HUDHeight = {"Side HUD height %", ''} Lng.Icons = {"Icons", ''} Lng.Drain_Fuel = {"Drain fuel", ''} Lng.HUD_MPH = {"mi/h instead of km/h", ''} Lng.ELS_Siren = {"ELS siren", ''} Lng.CanShootPlayersInSeats = {"Can shoot players inside vehicles", ''} Lng.CanShootPlayersInSeatsOverrideDefault = {"Can shoot players inside vehicles, override default", ''} Lng.HitLikelinessMult = {"Hit likeliness mult", ''} Lng.Empty = {"Empty", ''} Lng.hour = {"hour", 'As in 20 liters / hour'} Lng.g_gallons = {"gal", 'Short of the word Gallons'} Lng.g_liters = {"l", 'Short of the word Liters'} Lng.Parts = {"Parts", ''} Lng.ForceFirstPersonView = {"Force first person view", ''} Lng.Update = {"Update", ''} Lng.ELS_Lights = {"ELS lights", ''} Lng.HandbrakeLights = {"Handbrake lights", ''} Lng.EnterDriveByMode = {"Shoot out of the window", ''} Lng.DriveBy = {"Drive By mode for passengers", ''} Lng.ExitDriveByMode = {"Stop shooting out of the window", ''} Lng.Damage_Ignite = {"Ignite vehicle after explosion", ''} Lng.MinimumSpeed = {"Minimum speed", ''} Lng.Minor = {"Minor", ''} Lng.Currency = {"Currency", ''} Lng.Everything = {"Everything", ''} Lng.InteriorLights = {"Interior lights", ''} Lng.CanNotEquipThisWeapon = {"Can not equip this weapon", ''} Lng.BlinkersOffExit = {"Blinkers (turn signals) off on exit", ''} Lng.Imperialinsteadofmetric = {"Use imperial system instead of metric", ''} Lng.DamageEnabled = {"Damage enabled", ''} Lng.StartHealthMultiplier = {"Start health multiplier", ''} Lng.PhysicalDamage = {"Physical damage", ''} Lng.PhysicalDamageWPhysGun = {"Physical damage while using phys gun", ''} Lng["Player damage multiplier"] = {"Player damage multiplier", ''} Lng["Disable default driver physical damage"] = {"Disable default driver physical damage", ''} Lng.OnlyWithPassengers = {"Only with passengers", ''} Lng.HealthRepairBulletDamage = {"Attempt to repair default source bullet damage", ''} Lng.FireDuration = {"Fire duration", ''} Lng.SmokeDuration = {"Smoke duration", ''} Lng.RemoveDestroyedVehicle = {"Remove destroyed vehicle", ''} Lng.CanEnterIfDestroyed = {"Can enter if destroyed", ''} Lng.CarsCantRunOverPlayers = {"Cars can't damage players", ''} Lng.DoorSounds = {"Door sounds", ''} Lng.TruckRevBeep = {"Truck reverse sound", ''} Lng.OverrideDefaultSteeringLockOnExit = {"Override default steering lock on exit", ''} Lng.OverrideDefaultBrakesOnExit = {"Override default brakes on exit", ''} Lng.MatchPlayerSpeedExit = {"Match player speed on exit", ''} Lng.NoCollidePlyOnExit = {"No collide players with car on exit", ''} Lng.PlayersGetDamagedOnExit = {"Players get damaged on exit", ''} Lng.kWh = {"kWh", 'Kilo what hour'} Lng.Fuel = {"Fuel", ''} Lng.Exhaust = {"Exhaust", ''} Lng.PassengerSeats = {"Passenger seats", ''} Lng.Diesel = {"Diesel", 'Fuel type.'} Lng.Fuel_Cons_Mult = {"Fuel consumption multiplier", ''} Lng.Refuel_Mult_Station = {"Refueling speed multiplier using station", ''} Lng.Refuel_MaxCapacity = {"Refueling station maximum capacity", ''} Lng.Fuel_StartMult = {"Initial amount multiplier", ''} Lng.Refuel_Mult_Hand = {"Refueling speed multiplier using hands", ''} Lng.Fuel_Pickup_Pickup = {"Can pick up fuel canisters", ''} Lng.Fuel_Pickup_Explode = {"Fuel canisters can explode", ''} Lng.Fuel_Pickup_Touch = {"Fuel canisters can refuel by touch", ''} Lng.Fuel_Pickup_Touch_Elec = {"Fuel canisters can refuel by touch (Electricity)", ''} Lng.Fuel_Pickups_Beside_Stations = {"Place fuel canisters besides fuel stations", ''} Lng.Petrol = {"Petrol", 'Fuel type.'} Lng.Electricity = {"Electricity", ''} Lng.Elec = {"Elec", 'Electricity shortened.'} Lng.Pickup_Repair = {"Vehicle repair :val:", 'This is used in pickup entities.\n\n:val: will be replaced by the percentage.'} Lng.Pickup_Fuel = {"Vehicle fuel: ", 'This is used in pickup entities.'} Lng.Pickup_PartKit = {"Part kit", 'Box of parts (entity).'} Lng.Pickup_Carpart = {"Vehicle part: ", 'This is used in pickup entities.'} Lng.liters = {"liters", 'Volume, as in, 20 liters of water.'} Lng.gallons = {"gallons", 'Volume, as in, 20 gallons of water.'} Lng.AbleToSwitch = {"Can switch from inside", ''} Lng.DriverUsesCustomExitPos = {"Override driver exit position", ''} Lng.TrailerAttach = {"Trailer attach", ''} Lng.TrailerAttachConStrengthM = {"Trailer attach connection strength multiplier", ''} Lng.TrailersCanAtchToReg = {"Trailer can attach to regular cars", ''} Lng.RepairToolSpeedMult = {"Repair tool speed multiplier", ''} Lng["Auto select based on location"] = {"Auto select based on location", ""} VC.Lng_Default = Lng VC.Lng_Default_Count = table.Count(VC.Lng_Default)  local TempLng = {} for k,v in pairs(Lng) do TempLng[k] = v[1] end VC.Lng_T[Lng.Language_Code[1]] = TempLng    VC.Lng_T_Rev[Lng.Language_Code[1]] = 1    local lngDef = VC.Lng_T["en"]  function VC.Lng(msg)  if VC.Lng_Sel and VC.Lng_T[VC.Lng_Sel] and VC.Lng_T[VC.Lng_Sel][msg] then  msg = VC.Lng_T[VC.Lng_Sel][msg]  else  msg = lngDef[msg] or msg  end   return msg end   function VC.getLanguages()  return VC.Lng_T or {en = lngDef} end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?main_vc1:
local settings = { HUD_Height = 35, HUD_Name = true, HUD_Name_Height = 0.75, HUD_PickUp = true, HUD_Health = true, HUD_Health_Adv = true, HUD_Fuel = true, HUD_FuelLidPosition = true, HUD_DriveBy = true, HUD_Icons = true, HUD_Cruise = true,   HUD_MPh = false,  TireTracks_Enabled = true, TireTracks_Dist = 4000, TireTracks_FadeOutTime = 4, TireTracks_Detail = 50, TireTracks_Sparks = true,  Surface_Enabled = true,  Surface_Normal = true,  Surface_Brakes = true, Surface_Brakes_Audio = true, Surface_Sparks = true, Surface_Sparks_Audio = true,  ThirdPerson_Use = true, ThirdPerson_Dynamic = true, ThirdPerson_Auto = true, ThirdPerson_Vec_Stf = 100, ThirdPerson_Ang_Stf = 15, ThirdPerson_Auto_Pitch = 5, ThirdPerson_Ang_Pitch = true, ThirdPerson_Auto_Back = true, ThirdPerson_Switch = false, ThirdPerson_Cam_Trl = true, ThirdPerson_Speed = true, ThirdPerson_Hight_Auto = true, ThirdPerson_Type = 1,  Anim_PassengerLegBending = true, Anim_OverrieDriverAnimPos = true, } VC.SettingsAdd(settings)    local function DamagedObject_light_categorize(ent, int, state)  local OD = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)  if OD.LPT and OD.LPT[int] and ent.VC_DamagedObjects then  if OD.LPT[int].els then  if state then  if !ent.VC_DamagedObjects then ent.VC_DamagedObjects = {} end  if !ent.VC_DamagedObjects.L_ELS then ent.VC_DamagedObjects.L_ELS = 0 end  ent.VC_DamagedObjects.L_ELS = ent.VC_DamagedObjects.L_ELS+1  elseif ent.VC_DamagedObjects.L_ELS then  ent.VC_DamagedObjects.L_ELS = ent.VC_DamagedObjects.L_ELS-1  if ent.VC_DamagedObjects.L_ELS <= 0 then ent.VC_DamagedObjects.L_ELS = nil end  if table.Count(ent.VC_DamagedObjects) == 0 then ent.VC_DamagedObjects = nil end  end  else  local pos = OD.LPT[int].Pos  local pint = 1 if pos.x < 0 then if pos.y < 0 then pint = 3 end else if pos.y < 0 then pint = 4 else pint = 2 end end   if state then  if !ent.VC_DamagedObjects then ent.VC_DamagedObjects = {} end  if !ent.VC_DamagedObjects.LPT then ent.VC_DamagedObjects.LPT = {} end  ent.VC_DamagedObjects.LPT[pint] = (ent.VC_DamagedObjects.LPT[pint] or 0)+1  elseif ent.VC_DamagedObjects.LPT and ent.VC_DamagedObjects.LPT[pint] then  ent.VC_DamagedObjects.LPT[pint] = ent.VC_DamagedObjects.LPT[pint]-1  if ent.VC_DamagedObjects.LPT[pint] <= 0 then ent.VC_DamagedObjects.LPT[pint] = nil end  if table.Count(ent.VC_DamagedObjects.LPT) <= 0 then ent.VC_DamagedObjects.LPT = nil end  if table.Count(ent.VC_DamagedObjects) == 0 then ent.VC_DamagedObjects = nil end  end  end  end end  function VC.handleSurface(ent, EntLN, Elec)  if ent.VC_WheelSparkTable and table.Count(ent.VC_WheelSparkTable) > 0 and VC.getSetting("Surface_Sparks_Audio") then  if !ent.VC_Sounds.WheelGrind then ent.VC_Sounds.WheelGrind = VC.SoundEmit(ent, "vcmod/surface_grind.wav", 100, 70, 0, nil, true) end   local Vel = ent.VC_InBurnout and ent.VC_RPM/ent.VC_Engine.RPM_Max/1000 or (ent.VC_VelLength-100)  ent.VC_Sounds.WheelGrind:ChangePitch(100+Vel/100,0,25, 0)  ent.VC_Sounds.WheelGrind:ChangeVolume(math.Clamp(0.2+math.Clamp(Vel/500, 0,0.3+table.Count(ent.VC_WheelSparkTable)/2.8)*0.8, 0, 1), 0)  elseif ent.VC_Sounds.WheelGrind then  ent.VC_Sounds.WheelGrind:FadeOut(0.1) ent.VC_Sounds.WheelGrind = nil  end   if VC.getSetting("Surface_Brakes_Audio") then  if ent.VC_SurfaceData and ent.VC_SurfaceData.onAsphalt and (ent.VC_WheelBrakeDustTable and table.Count(ent.VC_WheelBrakeDustTable) > 0 or ent.VC_BurnoutDustTable and table.Count(ent.VC_BurnoutDustTable) > 0) then  if !ent.VC_Sounds.WheelBrake_Asphalt then ent.VC_Sounds.WheelBrake_Asphalt = VC.SoundEmit(ent, "vcmod/surface_asphalt.wav", 100, 95, 0, nil, true) end  local Vel = (ent.VC_BurnoutDustTable and table.Count(ent.VC_BurnoutDustTable) > 0 and ent.VC_RPM/7 or ent.VC_VelLength)-100        ent.VC_Sounds.WheelBrake_Asphalt:ChangePitch(95+math.Clamp(Vel/80,0,50), 0) ent.VC_Sounds.WheelBrake_Asphalt:ChangeVolume(math.Clamp(math.Clamp(Vel/250, 0,1), 0, 1), 0.1)  elseif ent.VC_Sounds.WheelBrake_Asphalt then  ent.VC_Sounds.WheelBrake_Asphalt:FadeOut(0.2) ent.VC_Sounds.WheelBrake_Asphalt = nil  end  if ent.VC_SurfaceData and ent.VC_SurfaceData.onNotAsphalt and (ent.VC_WheelBrakeDustTable and table.Count(ent.VC_WheelBrakeDustTable) > 0) then  if !ent.VC_Sounds.WheelBrake_NotAsphalt then ent.VC_Sounds.WheelBrake_NotAsphalt = VC.SoundEmit(ent, "vcmod/surface_dirt.wav", 100, 100, 0, nil, true) end  local Vel = (ent.VC_BurnoutDustTable and table.Count(ent.VC_BurnoutDustTable) > 0 and ent.VC_RPM/7 or ent.VC_VelLength)-100    ent.VC_Sounds.WheelBrake_NotAsphalt:ChangePitch(100+math.Clamp(Vel/50,0,30), 0) ent.VC_Sounds.WheelBrake_NotAsphalt:ChangeVolume(math.Clamp(math.Clamp(Vel/250, 0,1), 0, 1), 0.1)  elseif ent.VC_Sounds.WheelBrake_NotAsphalt then  ent.VC_Sounds.WheelBrake_NotAsphalt:FadeOut(0.1) ent.VC_Sounds.WheelBrake_NotAsphalt = nil  end  end end  local function AddNewDamagedObject(ent, object, int, state)  if !object or !int then return end  if state then  if hook.Call("VC_CanDamagePart", GAMEMODE, ent, object, int) == false or hook.Call("VC_canDamagePart", GAMEMODE, ent, object, int) == false then return end  if !ent.VC_DamagedObjects then ent.VC_DamagedObjects = {} end  if !ent.VC_DamagedObjects[object] then ent.VC_DamagedObjects[object] = {} end  if !ent.VC_DamagedObjects[object][int] then ent.VC_DamagedObjects[object][int] = true end  hook.Call("VC_PartDamaged", GAMEMODE, ent, obj, int) hook.Call("VC_partDamaged", GAMEMODE, ent, obj, int)  else  if ent.VC_DamagedObjects and VC.ObjectIsDamaged(ent, object, int) then  ent.VC_DamagedObjects[object][int] = nil  if table.Count(ent.VC_DamagedObjects[object]) == 0 then ent.VC_DamagedObjects[object] = nil end  if table.Count(ent.VC_DamagedObjects) == 0 then ent.VC_DamagedObjects = nil end  hook.Call("VC_PartRepaired", GAMEMODE, ent, object, int)  end  end   if object == "light" then DamagedObject_light_categorize(ent, int, state) end end  net.Receive("VC_SendToClient_DmgObjState_All", function(len)  local ent, tbl = net.ReadEntity(), net.ReadTable()  if !IsValid(ent) then return end  if table.Count(tbl) == 0 then  ent.VC_DamagedObjects = nil  else  for k,v in pairs(tbl) do for k2, v2 in pairs(v) do AddNewDamagedObject(ent, k, k2, true) end end  ent.VC_DamageObjectsForceReceived = true  end end)  net.Receive("VC_SendToClient_DmgObjState", function(len)  local ent, object, int, state = net.ReadEntity(), net.ReadString(), net.ReadInt(16), net.ReadBool()  if !IsValid(ent) then return end  AddNewDamagedObject(ent, object, int, state) end)  concommand.Add("vc_viewlookbehind", function(ply, cmd, arg) local HA = tonumber(arg[1]) if HA == 1 and !VC.View_LookingBehind then VC.View_LookingBehind = true elseif HA == 2 and VC.View_LookingBehind then VC.View_LookingBehind = false end end)  function VC.Handle_Input_VC1(ply, ent, Veh, IsNotPod, VSC)  if VSC and !vgui.CursorVisible() then  if (!ply.VC_UpKeysPressTime or CurTime() >= ply.VC_UpKeysPressTime) then  if input.IsKeyDown(KEY_LALT) and !ent.VC_ExtraSeat then  for i=1, 10 do local Ib = (i == 10 and 0 or i) if input.IsKeyDown(_G["KEY_"..Ib]) then RunConsoleCommand("VC_ClearSeat", Ib) ply.VC_UpKeysPressTime = CurTime()+0.2 end end  else  for i=1, 10 do local Ib = (i == 10 and 0 or i) if input.IsKeyDown(_G["KEY_"..Ib]) then if Ib > 0 then RunConsoleCommand("VC_Switch_Seats_"..Ib) else RunConsoleCommand("VC_Switch_Seats") end ply.VC_UpKeysPressTime = CurTime()+0.2 end end  end  end  end end  function VC.LitersToGallons(num) return num*0.264 end function VC.LitersToKwH(num) return num*1.7 end  function VC.LiterToAuto(num, ftype, am) if !am then am = 10 end if ftype == 2 then num = VC.LitersToKwH(num) else if VC.getSetting("HUD_MPh") then num = VC.LitersToGallons(num) end end return math.ceil(num*am)/am end function VC.TextToAuto_s(ftype) local text = "" if ftype == 2 then text = VC.Lng("kWh") else if VC.getSetting("HUD_MPh") then text = VC.Lng("g_gallons") else text = VC.Lng("g_liters") end end return text end function VC.TextToAuto(ftype) local text = "" if ftype == 2 then text = VC.Lng("kWh") else if VC.getSetting("HUD_MPh") then text = VC.Lng("gallons") else text = VC.Lng("liters") end end return text end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?data_menu_vc1:
function VC.CreateClSettingsTab_VC1(List, ListP)   local MPnl = VC.Add_El_Panel(ListP, {1/3,1/3,1/3}, 24, true)  local CBox = VC.Add_El_Checkbox("Enabled", "If VCMod third person view is on or off. If off, none of the settings bellow will work..", "ThirdPerson_Use", VC.Settings) MPnl[1]:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("DynamicView", "The dynamic slidy type of effect", "ThirdPerson_Dynamic", VC.Settings) MPnl[2]:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("SpeedTilt", "Camera tilts up and back when vehicle starts to move.", "ThirdPerson_Speed", VC.Settings) MPnl[3]:AddItem(CBox)   local MPnl = VC.Add_El_Panel(ListP, {1/3,1/3,1/3}, 34, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("AutoFocus", "Focuses the camera behind the vehicle.", "ThirdPerson_Auto", VC.Settings) MPnl[1]:AddItem(CBox)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[2]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("Reverse", "Focuses the camera in front of the vehicle while reversing.", "ThirdPerson_Auto_Back", VC.Settings) MPnl[2]:AddItem(CBox)  local Sldr = VC.Add_El_Slider("Height", 0, 20, 0, "How high behind the car the camera will focus.", "ThirdPerson_Auto_Pitch", VC.Settings) MPnl[3]:AddItem(Sldr)  local Sldr = VC.Add_El_Slider("VectorStiffness", 0, 100, 0, "How far the view will stay behind before slowly returning to normal.", "ThirdPerson_Vec_Stf", VC.Settings) ListP:AddItem(Sldr)  local Sldr = VC.Add_El_Slider("AngleStiffness", 0, 100, 0, "How far the view will sway from side to side before slowly returning to normal.", "ThirdPerson_Ang_Stf", VC.Settings) ListP:AddItem(Sldr)  local Type = vgui.Create("DComboBox", ListP) Type:AddChoice(VC.Lng("Advanced")) Type:AddChoice(VC.Lng("Lerp")) Type:SetSize(100, 24) Type:SetPos(List:GetWide()-Type:GetWide()-20,0) Type:ChooseOptionID(VC.getSetting("ThirdPerson_Type")) Type.OnSelect = function(idx, val) VC.SaveSetting("ThirdPerson_Type", val) end   local CBox = VC.Add_El_Checkbox("TruckView", "View focuses in between the trailer and the truck.", "ThirdPerson_Cam_Trl", VC.Settings) ListP:AddItem(CBox)  local CBox = VC.Add_El_Slider("Height", 0.2, 3, 2, "Vehicles camera hight multiplier.", "ThirdPerson_Hight_Mult", VC.Settings) ListP:AddItem(CBox) end  function VC.CreateClSettingsTab_TireTracks(List, ListP)  local CBox = VC.Add_El_Checkbox("Enabled", "This is for all effects.", "TireTracks_Enabled", VC.Settings) ListP:AddItem(CBox)  local Sldr = VC.Add_El_Slider("VisDist", 50, 10000, 0, "Distance at which the tire tracks simply are not drawn", "TireTracks_Dist", VC.Settings) ListP:AddItem(Sldr)  local Sldr = VC.Add_El_Slider("FadeOutTime", 0, 30, 2, "Distance at which the tire tracks simply are not drawn", "TireTracks_FadeOutTime", VC.Settings) ListP:AddItem(Sldr)  local Sldr = VC.Add_El_Slider(VC.Lng("Detail").." (%), "..VC.Lng("PerformanceImpact"), 5, 100, 1, "The detail of the tire track. Heavy impact on performance", "TireTracks_Detail", VC.Settings) ListP:AddItem(Sldr)  local CBox = VC.Add_El_Checkbox("FlatTire", "Leave a mark on the road when driving with a flat tire.", "TireTracks_Sparks", VC.Settings) ListP:AddItem(CBox) end  function VC.CreateClSettingsTab_Other(List, ListP)  local CBox = VC.Add_El_Checkbox(VC.Lng("Animation") ..": "..VC.Lng("BendPassengerLegs"), "Should we bend the passengers legs when entering the VCMod passenger seats?", "Anim_PassengerLegBending", VC.Settings) ListP:AddItem(CBox)  local CBox = VC.Add_El_Checkbox(VC.Lng("Animation") ..": "..VC.Lng("OverrideDriverAnims"), "If this is true, on compatible vehicles, driver positioning, animations, pose will be altered.", "Anim_OverrieDriverAnimPos", VC.Settings) ListP:AddItem(CBox) end  function VC.CreateClSettingsTab_Effects(List, ListP)  local CBox = VC.Add_El_Checkbox("Enabled", "Enabled all the stuff bellow.", "Surface_Enabled", VC.Settings) ListP:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("Normal", "Surface effects for when simply driving on a surface.", "Surface_Normal", VC.Settings) ListP:AddItem(CBox)   local MPnl = VC.Add_El_Panel(ListP, {0.5,0.5}, 28, true)  local CBox = VC.Add_El_Checkbox("Skidding", "Surface effects for when the vehicle is braking or skidding.", "Surface_Brakes", VC.Settings) MPnl[1]:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("Sound", "Emit audio while doing it.", "Surface_Brakes_Audio", VC.Settings) MPnl[2]:AddItem(CBox)   local MPnl = VC.Add_El_Panel(ListP, {0.5,0.5}, 28, true)  local CBox = VC.Add_El_Checkbox("Sparks", "Surface effects for when driving with a flat tire.", "Surface_Sparks", VC.Settings) MPnl[1]:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("Sound", "Emit audio while doing it.", "Surface_Sparks_Audio", VC.Settings) MPnl[2]:AddItem(CBox) end  local function BuildMenu(Pnl)  local List = VC.Add_El_List(0, 35, Pnl:GetWide(), Pnl:GetTall()-60) List:SetParent(Pnl)   local ElTbl = {}   local Settings_Sv = {}   local CBox = VC.Add_El_Checkbox("Enabled_Sv", "Basically shuts down all the stuff bellow.", "Enabled", Settings_Sv, true) List:AddItem(CBox) ElTbl.Enabled = CBox   local Sheet = vgui.Create("DPropertySheet") Sheet:SetTall(435)  local List_1_1 = VC.Add_El_List(0, 6, 450, 435) Sheet:AddSheet(VC.Lng("Lights"), List_1_1, "icon16/lightbulb.png", false, false, "Light options.")  local List_1_fuel = VC.Add_El_List(0, 6, 450, 435) Sheet:AddSheet(VC.Lng("Fuel"), List_1_fuel, "icon16/basket.png", false, false, "Fuel options.")  local List_1_2 = VC.Add_El_List(0, 6, 450, 435) Sheet:AddSheet(VC.Lng("Health"), List_1_2, "icon16/heart.png", false, false, "Health and damage controls.")  local List_1_6 = VC.Add_El_List(0, 6, 450, 435) Sheet:AddSheet(VC.Lng("AdvancedDamage"), List_1_6, "icon16/exclamation.png", false, false, "Health and damage controls, more advanced stuff.")  local List_1_5 = VC.Add_El_List(0, 6, 450, 435) Sheet:AddSheet(VC.Lng("Effects"), List_1_5, "icon16/chart_line.png", false, false, "Effect options.")  local List_1_3 = VC.Add_El_List(0, 6, 450, 435) Sheet:AddSheet(VC.Lng("Sound"), List_1_3, "icon16/sound.png", false, false, "Sound options.")  local List_1_4 = VC.Add_El_List(0, 6, 450, 800) Sheet:AddSheet(VC.Lng("Other"), List_1_4, "icon16/anchor.png", false, false, "Other options.")  List:AddItem(Sheet)    local CBox = VC.Add_El_Checkbox("Enabled", "Enables/Disables lights on vehicles including: emergency lights, running lights, reverse lights, blinkers, hazards, head lights.", "Lights", Settings_Sv, true) ElTbl.Lights = CBox List_1_1:AddItem(CBox)   local MPnl = VC.Add_El_Panel(List_1_1, {0.5,0.5}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("RunningLights", "Enables/Disables running lights on vehicles.", "Lights_Running", Settings_Sv, true) ElTbl.Lights_Running = CBox MPnl[1]:AddItem(CBox)  local Sldr = VC.Add_El_Slider("OffTime", 0, 600, 0, "Lights will turn off if the car is left alone after this time.", "LightsOffTime", Settings_Sv, true) ElTbl.LightsOffTime = Sldr MPnl[2]:AddItem(Sldr)   local MPnl = VC.Add_El_Panel(List_1_1, {1/3,1/3,1/3}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("HeadLights", "Enables/Disables headlights on vehicles. Low beams and high beams.", "HeadLights", Settings_Sv, true) ElTbl.HeadLights = CBox MPnl[1]:AddItem(CBox)  local Sldr = VC.Add_El_Slider("DistMultiplier", 0, 2, 2, "How far the headlights will lights up the world.", "HLights_Dist_M", Settings_Sv, true) ElTbl.HLights_Dist_M = Sldr MPnl[2]:AddItem(Sldr)  local Sldr = VC.Add_El_Slider("OffTime", 0, 120, 0, "Headlights will turn off if the car is left alone after this time.", "HLightsOffTime", Settings_Sv, true) ElTbl.HLightsOffTime = Sldr MPnl[3]:AddItem(Sldr)   local MPnl = VC.Add_El_Panel(List_1_1, {1/3,1/3,1/3}, 48, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("FogLights", "Enables/Disables headlights on vehicles.", "FogLights", Settings_Sv, true) ElTbl.FogLights = CBox MPnl[1]:AddItem(CBox)  local Sldr = VC.Add_El_Slider("DistMultiplier", 0, 2, 2, "How far the headlights will lights up the world.", "FogLights_Dist_M", Settings_Sv, true) ElTbl.FogLights_Dist_M = Sldr MPnl[2]:AddItem(Sldr)  local Sldr = VC.Add_El_Slider("OffTime", 0, 120, 0, "Headlights will turn off if the car is left alone after this time.", "FogLightsOffTime", Settings_Sv, true) ElTbl.FogLightsOffTime = Sldr MPnl[3]:AddItem(Sldr)   local CBox = VC.Add_El_Checkbox("HandbrakeLights", "Should the brake light turn on when pressing the handbrake too [SPACE] key.", "Lights_HandBrake", Settings_Sv, true) ElTbl.Lights_HandBrake = CBox List_1_1:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("InteriorLights", "If the door is opened the interior lights will turn on.", "Lights_Interior", Settings_Sv, true) ElTbl.Lights_Interior = CBox List_1_1:AddItem(CBox)  local CBox = VC.Add_El_Checkbox("BlinkersOffExit", "Should the blinkers auto turn off when a player leaves the driver seat.", "Lights_Blinker_OffOnExit", Settings_Sv, true) ElTbl.Lights_Blinker_OffOnExit = CBox List_1_1:AddItem(CBox)    local CBox = VC.Add_El_Checkbox("DamageEnabled", "With this the vehicle will receive physical and weapon based damage.", "Damage", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage = CBox   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(4) List_1_2:AddItem(SNLbl)  VC.Add_El_Line(List_1_2, VC.Color.Blue)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(4) List_1_2:AddItem(SNLbl)   local Sldr = VC.Add_El_Slider("StartHealthMultiplier", 0, 20, 1, "Starting health multiplier, applied to a car when it is spawned.", "Health_Multiplier", Settings_Sv, true) List_1_2:AddItem(Sldr) ElTbl.Health_Multiplier = Sldr   local Sldr = VC.Add_El_Slider("FireDuration", 0, 600, 1, "For how long the fire will last after the vehicle has exploded.", "Dmg_Fire_Duration", Settings_Sv, true) List_1_2:AddItem(Sldr) ElTbl.Dmg_Fire_Duration = Sldr  local Sldr = VC.Add_El_Slider("SmokeDuration", 0, 600, 1, "For how long the fire will last after the vehicle has exploded.", "Dmg_Smoke_Duration", Settings_Sv, true) List_1_2:AddItem(Sldr) ElTbl.Dmg_Smoke_Duration = Sldr   local MPnl = VC.Add_El_Panel(List_1_2, {0.5,0.5}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("RemoveDestroyedVehicle", "Vehicle will be removed after it has exploded.", "Damage_Expl_Rem", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Damage_Expl_Rem = CBox  local Sldr = VC.Add_El_Slider("Time", 0, 3600, 0, "Vehicle will be removed in this amount of time.", "Damage_Expl_Rem_Time", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.Damage_Expl_Rem_Time = Sldr   local CBox = VC.Add_El_Checkbox("CanEnterIfDestroyed", "Can the vehicle be entered if it has been destroyed?", "Damage_CanEnterIfDestroyed", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage_CanEnterIfDestroyed = CBox   VC.Add_El_Banner(List_1_2, "Repair")  local CBox = VC.Add_El_Checkbox("Damage_Repair_GiveWrenchToDriver", "Give the repair wrench to driver upon entering the drivers seat.", "Damage_Repair_GiveWrenchToDriver", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage_Repair_GiveWrenchToDriver = CBox  local CBox = VC.Add_El_Checkbox("Damage_Repair_GiveWrenchToCarPartUser", "Give the repair wrench to the person who uses a vehicle part.", "Damage_Repair_GiveWrenchToCarPartUser", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage_Repair_GiveWrenchToCarPartUser = CBox  local CBox = VC.Add_El_Checkbox("Damage_Repair_NeedPart", "You need a vehicle part in order to repart stuff.", "Damage_Repair_NeedPart", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage_Repair_NeedPart = CBox   local Sldr = VC.Add_El_Slider("RepairTime", 0, 5, 2, "How fast parts will be repaired by hand", "Damage_Repair_TimeMult", Settings_Sv, true) List_1_2:AddItem(Sldr) ElTbl.Damage_Repair_TimeMult = Sldr   VC.Add_El_Banner(List_1_2, "Other")   local CBox = VC.Add_El_Checkbox("HealthRepairBulletDamage", "Attempt to repair the default bullet source vehicle bullet damage issues.", "HealthRepairBulletDamage", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.HealthRepairBulletDamage = CBox   local CBox = VC.Add_El_Checkbox("CarsCantRunOverPlayers", "Cars cant run over players.", "CarsCantDamagePlayers", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.CarsCantDamagePlayers = CBox   local MPnl = VC.Add_El_Panel(List_1_2, {0.5,0.5}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("CanShootPlayersInSeats", "If players should be able to shoot out the players in seats.", "ShootPlayers", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.ShootPlayers = CBox  local Sldr = VC.Add_El_Slider("HitLikelinessMult", 0, 5, 0, "How likely the player is to be hit.", "ShootPlayers_Prec_Mult", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.ShootPlayers_Prec_Mult = Sldr  local CBox = VC.Add_El_Checkbox("CanShootPlayersInSeatsOverrideDefault", "This is mainly for people with custom addon setups who are experiencing some kind of an issue.\nIf the default driver damage methods shuld be replaced by the VCMod ones or not.", "ShootPlayers_OverrideDefault", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.ShootPlayers_OverrideDefault = CBox  local CBox = VC.Add_El_Checkbox("Damage_Ignite", "Ignite the car with fire after explosion", "Damage_Ignite", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage_Ignite = CBox  local CBox = VC.Add_El_Checkbox("Drain_Fuel", "Drain vehicles fuel on explosion", "Damage_explosion_drain_fuel", Settings_Sv, true) List_1_2:AddItem(CBox) ElTbl.Damage_explosion_drain_fuel = CBox              VC.Add_El_Banner(List_1_6, "PhysicalDamage")     local CBox = VC.Add_El_Checkbox("PhysicalDamage", "Vehicle will take damage when colliding with things.", "PhysicalDamage", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.PhysicalDamage = CBox  local CBox = VC.Add_El_Checkbox("PhysicalDamageWPhysGun", "Damage will be applied while not using physgun", "PhysicalDamageWPhysGun", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.PhysicalDamageWPhysGun = CBox  local CBox = VC.Add_El_Checkbox("OnlyWithPassengers", "Physical damage will not work unless the vehicle has passengers in it.", "OnlyWithPassengers", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.OnlyWithPassengers = CBox  local Sldr = VC.Add_El_Slider("Player damage multiplier", 0, 5, 1, "Damage will be multiplied by this amount to the players within the seats.", "PhysicalDamage_PlyDmgMult", Settings_Sv, true) List_1_6:AddItem(Sldr) ElTbl.PhysicalDamage_PlyDmgMult = Sldr  local CBox = VC.Add_El_Checkbox("Disable default driver physical damage", "Will disable all physical damage dealt to the driver. Useful for replacing it with VCMods damage", "PhysicalDamage_PlyDisable", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.PhysicalDamage_PlyDisable = CBox  local Sldr = VC.Add_El_Slider("Multiplier", 0, 5, 1, "Damage will be multiplied by this amount.", "PhysicalDamage_Mult", Settings_Sv, true) List_1_6:AddItem(Sldr) ElTbl.PhysicalDamage_Mult = Sldr  local Sldr = VC.Add_El_Slider("MinimumSpeed", 0, 1000, 0, "Damage will be started to count upwards from this number.", "Damage_Phys_MinVel", Settings_Sv, true) List_1_6:AddItem(Sldr) ElTbl.Damage_Phys_MinVel = Sldr  local CBox = VC.Add_El_Checkbox("Damage_Custom_Sounds", "Emit custom sounds when damaged.", "Sound_Damage_Custom", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.Sound_Damage_Custom = CBox   VC.Add_El_Banner(List_1_6, "Objects")   local CBox = VC.Add_El_Checkbox("Damage_Lights", "Able to damage the vehicles lights.", "Damage_Lights", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.Damage_Lights = CBox   local MPnl = VC.Add_El_Panel(List_1_6, {0.4,0.6}, 18, true)  local CBox = VC.Add_El_Checkbox("Damage_Wheels", "Able to damage the vehicles tires.", "Damage_Wheels", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Damage_Wheels = CBox  local CBox = VC.Add_El_Checkbox("Damage_Wheels_ELSOff", "ELS vehicles have bullet proof tires.", "Damage_Wheels_ELSOff", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Damage_Wheels_ELSOff = CBox   local MPnl = VC.Add_El_Panel(List_1_6, {0.4,0.6}, 18, true)  local CBox = VC.Add_El_Checkbox("Damage_Exhaust", "Able to damage the vehicles exhaust.", "Damage_Exhaust", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Damage_Exhaust = CBox  local CBox = VC.Add_El_Checkbox("Damage_Exhaust_Backfire", "Exhaust backfire damaged engine.", "Damage_Exhaust_Backfire", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Damage_Exhaust_Backfire = CBox   local MPnl = VC.Add_El_Panel(List_1_6, {0.4,0.3,0.3}, 18, true)  local CBox = VC.Add_El_Checkbox("Damage_FuelLid", "Able to shoot the players fuel lid", "Damage_FuelLid", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Damage_FuelLid = CBox  local CBox = VC.Add_El_Checkbox("Explode", "If the fuel lid is shot explode the vehicle? If not, it will only leak its fuel.", "Damage_FuelLid_Explode", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Damage_FuelLid_Explode = CBox  local CBox = VC.Add_El_Checkbox("Drain_Fuel", "Drains all vehicles fuel.", "Damage_FuelLid_DrainFuel", Settings_Sv, true) MPnl[3]:AddItem(CBox) ElTbl.Damage_FuelLid_DrainFuel = CBox   local CBox = VC.Add_El_Checkbox("Explode", "Explode the engine once its in critical condition.", "Damage_Explode", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.Damage_Explode = CBox   VC.Add_El_Banner(List_1_6, "Spikestrip")    local CBox = VC.Add_El_Checkbox("SpikeStrip_auto_give_els", "Should the spike strip be automatically given to anyone who enters a police vehicle? Not rear seats.", "SpikeStrip_auto_give_els", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.SpikeStrip_auto_give_els = CBox  local CBox = VC.Add_El_Checkbox("SpikeStrip_auto_remove_death", "Should the spike strip auto remove itself of a dead player?", "SpikeStrip_auto_remove_death", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.SpikeStrip_auto_remove_death = CBox   local CBox = VC.Add_El_Checkbox("CanDamagePlayersNPCs", "Should the spike strip damage entities above it?", "SpikeStrip_damage_players", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.SpikeStrip_damage_players = CBox  local CBox = VC.Add_El_Checkbox("IgnoreEmergencyVehicles", "Should the spike strip ignore ELS vehicles?", "SpikeStrip_Ignore_ELS", Settings_Sv, true) List_1_6:AddItem(CBox) ElTbl.SpikeStrip_Ignore_ELS = CBox     Pnl.FrameRate = VGUIFrameTime()- (Pnl.FrameTime or 0) Pnl.FrameTime = VGUIFrameTime()   local Horz = vgui.Create("DHorizontalScroller", List_1_fuel) Horz:SetSize(Pnl:GetWide()-120, 100) Horz:AlignTop(20) Horz:AlignLeft(50) Horz:SetOverlap(0) Horz:NoClipping(true)  function HorzResetAlpha(int) Horz:AlphaTo(0, 0, 0) Horz:AlphaTo(255, int or 0.5, 0) end HorzResetAlpha(1)   local Pnls = {}  local function FillData()  for k,v in pairs(Pnls) do if IsValid(v) then v:Remove() end end Pnls = {}  for k,v in pairs(ents.FindByClass("vc_fuel_station_*")) do  local ftype = VC.FuelTypes[v.VC_FuelType or 0]  local mdl = vgui.Create("DModelPanel", List_1_fuel) mdl:SetModel(ftype.mdl) mdl:SetCamPos(Vector(45,0,0)) mdl:SetSize(150, 150)  local RandMove = math.Rand(1.5,2.5) function mdl:LayoutEntity() mdl:SetLookAt(Vector(0, math.sin(CurTime()*RandMove), 0)) return end  local function DoClick()  local DDM = VC.DermaMenu("Fuel station options")  DDM:AddButton("Remove", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_Fuel_Remove") net.WriteEntity(v) net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/cross.png")  DDM:AddButton("Trace position", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_Fuel_Trace") net.WriteEntity(v) net.SendToServer() else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/map.png")  DDM:Open()  end  mdl.DoClick = DoClick mdl.DoRightClick = DoClick   local Nm = VC.Lng(ftype.name)  local clr = VC.Color.Main  mdl.PaintOver = function(obj, Sx, Sy)  mdl:SetCamPos(Vector(45,0,0))  local tclr = table.Copy(clr) draw.RoundedBox(0, 0, 0, Sx, 25, clr)   if !mdl:IsHovered() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,0,0,55)) end  if mdl:IsDown() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,100,100,55)) end  draw.DrawText(Nm, nil, Sx/2,7, table.Copy(VC.Color.Blue), TEXT_ALIGN_CENTER)   local pos = 0  if mdl:IsHovered() then tclr = table.Copy(VC.Color.Blue) surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  end  table.insert(Pnls, mdl)  Horz:AddPanel(mdl)  end  end   FillData()   function Horz:OnMouseWheeled(delta) Horz.OffsetX = Horz.OffsetX+ delta*-100 self:InvalidateLayout(true) return true end   function Horz:PerformLayout()  local w, h = self:GetSize() local x = 0  self.pnlCanvas:SetTall(h)  if self.Panels then  for k, v in pairs(self.Panels) do if IsValid(v) then v:SetPos(x, 0) v:SetTall(h) v:ApplySchemeSettings() x = x+ v:GetWide()- self.m_iOverlap end end  self.pnlCanvas:SetWide(x + self.m_iOverlap)  if (w < self.pnlCanvas:GetWide()) then self.OffsetX = math.Clamp(self.OffsetX, 0, self.pnlCanvas:GetWide()- self:GetWide()) else self.OffsetX = 0 end  self.pnlCanvas.x = Lerp(0.1, self.pnlCanvas.x, -self.OffsetX)  end  self.btnLeft:SetVisible(false) self.btnRight:SetVisible(false)  end   local clr = VC.Color.Main  local nvf = VC.Lng("Empty")  Horz.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, clr)  surface.SetDrawColor(clr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx+VC.FadeW/2, Sy/2, VC.FadeW, Sy, 0)  surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180)   if #Pnls == 0 then draw.DrawText(nvf, "VC_Big_Italic", Sx/2, 35, VC.Color.Blue, TEXT_ALIGN_CENTER) end  end   local CBox = VC.Add_El_Checkbox("Enabled", "Allows regular people to use car dealers.", "Fuel", Settings_Sv, true) List_1_fuel:AddItem(CBox) ElTbl.Fuel = CBox   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(110) List_1_fuel:AddItem(SNLbl)   local Add = vgui.Create("VC_Button") Add:SetColor(VC.Color.Btn_Add) Add:SetText(VC.Lng("Add")) List_1_fuel:AddItem(Add) Add:SetToolTip("Create a new fueling station.")  Add.DoClick = function()  if VC.CanEditAdminSettings(LocalPlayer()) then  local DDM = VC.DermaMenu("Fuel station options")  for k,v in pairs(VC.FuelTypes) do  DDM:AddButton(VC.Lng(v.name).." "..v.shrt, function() net.Start("VC_Fuel_Add") net.WriteInt(k, 4) net.SendToServer() timer.Simple(0.5, function() FillData() end) end)  end  DDM:Open()  else  VCPopup("AccessRestricted", "cross")  end  end   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(2) List_1_fuel:AddItem(SNLbl)   local MPnl = VC.Add_El_Panel(List_1_fuel, {0.5,0.5}, 32, true)  local Respawn = vgui.Create("VC_Button") Respawn:SetColor(VC.Color.Btn_Spw) Respawn:SetText(VC.Lng("Respawn")) MPnl[1]:AddItem(Respawn) Respawn:SetToolTip("Respawn all fuel stations on the map.")  Respawn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_Fuel_Respawn") net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end   local SavePos = vgui.Create("VC_Button") SavePos:SetColor(VC.Color.Good) SavePos:SetText(VC.Lng("Save")) MPnl[2]:AddItem(SavePos) SavePos:SetToolTip("Saves position of all fuel stations on the map.")  SavePos.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_Fuel_Save") net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end   local MPnl = VC.Add_El_Panel(List_1_fuel, {0.5,0.5}, 32, true)  local CBox = VC.Add_El_Checkbox("Persistent", "Will automatically respawn if removed by scripts.", "Fuel_Persistent", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Fuel_Persistent = CBox  local CBox = VC.Add_El_Checkbox("Fuel_lidNeedUnlocked", "Vehicle has to be unlocked to be able to use the fuel lid.", "Fuel_lidNeedUnlocked", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Fuel_lidNeedUnlocked = CBox   local Sldr = VC.Add_El_Slider("Fuel_Cons_Mult", 0, 50, 2, "Vehicle fuel consumption multiplier.", "Fuel_Cons_Mult", Settings_Sv, true) List_1_fuel:AddItem(Sldr) ElTbl.Fuel_Cons_Mult = Sldr   local MPnl = VC.Add_El_Panel(List_1_fuel, {0.5,0.5}, 32, true)  local Sldr = VC.Add_El_Slider("Refuel_MaxCapacity", 0, 1000, 0, "Maximum amount of purchased fuel that could be stored at one fuel station. In liters!", "Refuel_MaxCapacity", Settings_Sv, true) MPnl[1]:AddItem(Sldr) ElTbl.Refuel_MaxCapacity = Sldr  local Sldr = VC.Add_El_Slider("Fuel_StartMult", 0, 5, 2, "Starting fuel multiplier", "Fuel_StartMult", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.Fuel_StartMult = Sldr   local MPnl = VC.Add_El_Panel(List_1_fuel, {0.5,0.5}, 32, true)  local Sldr = VC.Add_El_Slider("Refuel_Mult_Station", 0, 10, 2, "How fast players are able to refuel vehicles by fuel stations.", "Refuel_Mult_Station", Settings_Sv, true) MPnl[1]:AddItem(Sldr) ElTbl.Refuel_Mult_Station = Sldr  local Sldr = VC.Add_El_Slider("Refuel_Mult_Hand", 0, 10, 2, "How fast players are able to refuel vehicles by fuel hand.", "Refuel_Mult_Hand", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.Refuel_Mult_Hand = Sldr     local CBox = VC.Add_El_Checkbox("Fuel_Pickup_Pickup", "If players are able to pickup the fuel canisters.", "Fuel_Pickup_Pickup", Settings_Sv, true) List_1_fuel:AddItem(CBox) ElTbl.Fuel_Pickup_Pickup = CBox  local CBox = VC.Add_El_Checkbox("Fuel_Pickup_Explode", "If players are able to pickup the fuel canisters.", "Fuel_Pickup_Explode", Settings_Sv, true) List_1_fuel:AddItem(CBox) ElTbl.Fuel_Pickup_Explode = CBox   local MPnl = VC.Add_El_Panel(List_1_fuel, {0.5,0.5}, 18, true)  local CBox = VC.Add_El_Checkbox("Fuel_Pickup_Touch", "Should the jerrycan instanly refuel the vehicle when it touches it?", "Fuel_Pickup_Touch", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Fuel_Pickup_Touch = CBox  local CBox = VC.Add_El_Checkbox("Fuel_Pickup_Touch_Elec", "Should the jerrycan instanly refuel the vehicle when it touches it? Only for eletric vehicles", "Fuel_Pickup_Touch_Elec", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Fuel_Pickup_Touch_Elec = CBox   local CBox = VC.Add_El_Checkbox("Fuel_Pickups_Beside_Stations", "Should a jerrycan be spawned besides the fuel station?", "Fuel_Pickups_Beside_Stations", Settings_Sv, true) List_1_fuel:AddItem(CBox) ElTbl.Fuel_Pickups_Beside_Stations = CBox   local MPnl = VC.Add_El_Panel(List_1_fuel, {1/3,1/3,1/3}, 32, true)  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..VC.Lng("Petrol"), 0, 100, 3, "The price of the fuel per liter.", "Fuel_PPL_0", Settings_Sv, true) MPnl[1]:AddItem(Sldr) ElTbl.Fuel_PPL_0 = Sldr  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..VC.Lng("Diesel"), 0, 100, 3, "The price of the fuel per liter.", "Fuel_PPL_1", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.Fuel_PPL_1 = Sldr  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..VC.Lng("Electricity"), 0, 100, 3, "The price of the fuel per liter.", "Fuel_PPL_2", Settings_Sv, true) MPnl[3]:AddItem(Sldr) ElTbl.Fuel_PPL_2 = Sldr      local MPnl = VC.Add_El_Panel(List_1_3, {0.5,0.5}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("Horn", "This will allow people to use cars horn.", "Horn_Enabled", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Horn_Enabled = CBox  local Sldr = VC.Add_El_Slider("Volume", 0, 1, 1, "How loud the horn will be.", "Horn_Volume", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.Horn_Volume = Sldr   local CBox = VC.Add_El_Checkbox("DoorSounds", "Emit sounds when a door is being open/closed.", "Door_Sounds", Settings_Sv, true) List_1_3:AddItem(CBox) ElTbl.Door_Sounds = CBox   local CBox = VC.Add_El_Checkbox("TruckRevBeep", "While a truck (vehicle bigger than usual or is supporting a truck socket type is considered a truck) it emits a sound.", "Truck_BackUp_Sounds", Settings_Sv, true) List_1_3:AddItem(CBox) ElTbl.Truck_BackUp_Sounds = CBox    VC.Add_El_Banner(List_1_4, "Trailer")  local CBox = VC.Add_El_Checkbox("TrailerAttach", "This will allow you to attach trailers to trucks.", "Trl_Enabled", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Trl_Enabled = CBox  local Sldr = VC.Add_El_Slider("Distance", 10, 1000, 0, "How far the trailer should be from the truck to attempt to attach?", "Trl_Dist", Settings_Sv, true) List_1_4:AddItem(Sldr) ElTbl.Trl_Dist = Sldr   local Sldr = VC.Add_El_Slider("TrailerAttachConStrengthM", 0, 1, 2, "How strong the connection is, before it breaks. Multiplier.", "Trl_Strength", Settings_Sv, true) List_1_4:AddItem(Sldr) ElTbl.Trl_Strength = Sldr   local CBox = VC.Add_El_Checkbox("TrailersCanAtchToReg", "All regular (none big) vehicles will have an attachment point setup near its end, to simulate a hook.", "Trl_Enabled_Reg", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Trl_Enabled_Reg = CBox   VC.Add_El_Banner(List_1_4, "Other")    local CBox = VC.Add_El_Checkbox("PlayersGetDamagedOnExit", "It is not a good idea to jump out of the car while its moving, you could get hurt.", "Exit_Velocity_Damage", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Exit_Velocity_Damage = CBox  local CBox = VC.Add_El_Checkbox("DriveBy", "Allow passengers to shoot out the window of their seats.", "DriveBy", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.DriveBy = CBox  local CBox = VC.Add_El_Checkbox("DriveBy_NoSwitch", "Will not allow to switch weapons while in drive by mode.", "DriveBy_NoSwitch", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.DriveBy_NoSwitch = CBox   local MPnl = VC.Add_El_Panel(List_1_4, {0.5,0.5}, 18, true)  local CBox = VC.Add_El_Checkbox("Cruise", "This will allow people to use cars cruise.", "Cruise_Enabled", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Cruise_Enabled = CBox  local CBox = VC.Add_El_Checkbox("OffOnExit", "Turn off the cruise control when the driver exits the vehicle.", "Cruise_OffOnExit", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Cruise_OffOnExit = CBox   local MPnl = VC.Add_El_Panel(List_1_4, {0.5,0.5}, 18, true)  local CBox = VC.Add_El_Checkbox("Exhaust", "Exhaust effect when a vehicle is idle or in movement.", "Exhaust_Effect", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Exhaust_Effect = CBox  local CBox = VC.Add_El_Checkbox("Exhaust_Effect_BackFireHealthLow", "Emit exhaust when engine is damaged.", "Exhaust_Effect_BackFireHealthLow", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Exhaust_Effect_BackFireHealthLow = CBox   local MPnl = VC.Add_El_Panel(List_1_4, {0.5,0.5}, 36, true)  local CBox = VC.Add_El_Checkbox("PassengerSeats", "Allows a vehicle to have passenger seats.", "Passenger_Seats", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Passenger_Seats = CBox  local CBox = VC.Add_El_Checkbox("AbleToSwitch", "People are allowed to switched seats from within the vehicle.", "Seat_Switch", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Seat_Switch = CBox  local CBox = VC.Add_El_Checkbox("DriverUsesCustomExitPos", "Should we override the default player exit positioning as well?", "ExitPoint_OverrideDriver", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.ExitPoint_OverrideDriver = CBox  VC.Add_El_Banner(List_1_4, "Minor")   local MPnl = VC.Add_El_Panel(List_1_4, {0.5,0.5}, 18, true)  local CBox = VC.Add_El_Checkbox("OverrideDefaultSteeringLockOnExit", "Overrides the default steering method of garrysmod when a driver exits.", "Wheel_Lock", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.Wheel_Lock = CBox  local CBox = VC.Add_El_Checkbox("OverrideDefaultBrakesOnExit", "Overrides the default always brake method of garrysmod when a drive exits.", "Brake_Lock", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.Brake_Lock = CBox   local CBox = VC.Add_El_Checkbox("MatchPlayerSpeedExit", "Players speed gets set to the ones of a car when they exit a vehicle.", "Exit_Velocity", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Exit_Velocity = CBox  local CBox = VC.Add_El_Checkbox("NoCollidePlyOnExit", "This allows for more stable exit.", "Exit_NoCollision", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Exit_NoCollision = CBox   local CBox = VC.Add_El_Checkbox("LockFromInside", "Allows to lock the vehicle form within.", "Lock_From_Inside", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Lock_From_Inside = CBox  local CBox = VC.Add_El_Checkbox("ThirdPersonViewSeeThroughProps", "Should the third person view of playeres allow them to see through props or not.", "TP_Props", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.TP_Props = CBox   local MPnl = VC.Add_El_Panel(List_1_4, {0.5,0.5}, 18, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("Currency") MPnl[1]:AddItem(SNLbl)  local CBox_Currency = vgui.Create("DComboBox", Pnl) MPnl[2]:AddItem(CBox_Currency)  for k,v in pairs(VC.Constant_Currency) do CBox_Currency:AddChoice(v.shrt.." ("..v.symbol..") "..v.name) end  CBox_Currency.OnSelect = function(idx, val) Settings_Sv["Currency"] = val end   local CBox = VC.Add_El_Checkbox("Indication", 'Things such as popuplights and other VCMod related bodygroup and pose paramter manipulation.', "Indication", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.Indication = CBox  local CBox = VC.Add_El_Checkbox("Unlock vehicle on use by person who locked from inside", 'If the vehicle is locked from within, should we allow the person who locked it and then exited it to unlock it, regardless if he is the owner or not?', "UnlockVehicleOnSpawnerUsePostLock", Settings_Sv, true) List_1_4:AddItem(CBox) ElTbl.UnlockVehicleOnSpawnerUsePostLock = CBox    local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(4) List_1_5:AddItem(SNLbl)   VC.Add_El_Banner(List_1_5, "Health")  local CBox = VC.Add_El_Checkbox("Repairing", "Emit effects while repairing.", "Effect_Repair", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Repair = CBox  local CBox = VC.Add_El_Checkbox("Light_Damage", "Emit effects when a light gets damaged/fixed.", "Effect_Light", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Light = CBox  local CBox = VC.Add_El_Checkbox("Light_Damaged", "Emit sparks out of lights if they are damaged and are attempted to be used.", "Effect_Light_Damaged", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Light_Damaged = CBox  local CBox = VC.Add_El_Checkbox("Exhaust_Damage", "Emit effects when an exhaust is damaged/fixed.", "Effect_Exhaust", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Exhaust = CBox  local CBox = VC.Add_El_Checkbox("Wheel_Damage", "Emit effects when an tire is damaged/fixed.", "Effect_Wheel", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Wheel = CBox  local CBox = VC.Add_El_Checkbox("Damage_Sparks_Damage", "Emit sparks when vehicle collides with something in the collision spot.", "Effect_Damage_Sparks", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Damage_Sparks = CBox  local CBox = VC.Add_El_Checkbox("Explosion_Custom", "Uses custom explosion effect.", "Effect_Explosion_Custom", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Explosion_Custom = CBox  VC.Add_El_Banner(List_1_5, "Other")  local CBox = VC.Add_El_Checkbox("Exhaust_Custom", "Uses custom exhaust effects.", "Effect_Exhaust_Custom", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Exhaust_Custom = CBox  local CBox = VC.Add_El_Checkbox("Brake_Effects", "Enabled effects while braking.", "Effect_Slide", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Effect_Slide = CBox  local CBox = VC.Add_El_Checkbox("TireTracks", "Enabled tiretracks for all players (players can not override it on their own anymore).", "Tiretracks", Settings_Sv, true) List_1_5:AddItem(CBox) ElTbl.Tiretracks = CBox     local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Add) Btn:SetSize(75, 20) Btn:SetPos(Pnl:GetWide()/2-112.25, Pnl:GetTall()-20) Btn:SetText(VC.Lng("Save")) Btn:SetParent(Pnl) Btn:SetToolTip("Save the settings.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_SendSettingsToServer") net.WriteTable(Settings_Sv) net.SendToServer() VCPopup("SettingsSaved", "check") end end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Orn) Btn:SetSize(75, 20) Btn:SetPos(Pnl:GetWide()/2-37.25, Pnl:GetTall()-20) Btn:SetText(VC.Lng("Reset")) Btn:SetParent(Pnl) Btn:SetToolTip("Reset all settings to their default values.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_ResetSettings") if VC.Menu_Panel then VC.Menu_Panel.VC_Refresh_Panel = true end VCPopup("SettingsReset", "check") end end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Spw) Btn:SetPos(Pnl:GetWide()/2+37.25, Pnl:GetTall()-20) Btn:SetSize(75, 20) Btn:SetText(VC.Lng("Load")) Btn:SetParent(Pnl) Btn:SetToolTip("Load settings from the server.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_GetSettings_Sv") VCPopup("LoadedSettingsFromServer", "check") end end   if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_GetSettings_Sv") end   local X, Y = List:GetPos() local Sx, Sy = List:GetSize()  Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, X, Y, Sx, Sy, Color(0, 0, 0, 100))  draw.DrawText(VC.Lng("OptOnly_Admin"), "VC_Dev_Text", List:GetWide()/2, 5, VC.Color.Blue, TEXT_ALIGN_CENTER)  end   Pnl.Think = function() if VC.Settings_TempTbl then CBox_Currency:ChooseOptionID(VC.Settings_TempTbl.Currency or 1) for k,v in pairs(VC.Settings_TempTbl) do if ElTbl[k] then ElTbl[k]:SetValue(v) end Settings_Sv[k] = v end VC.Settings_TempTbl = nil end end   return Draw end VC.Menu_Items_A.Options = {"Options", BuildMenu}  local function BuildMenu(Pnl)  local Settings_Sv = {} local ElTbl = {}   Pnl.FrameRate = VGUIFrameTime()- (Pnl.FrameTime or 0) Pnl.FrameTime = VGUIFrameTime()   local Horz = vgui.Create("DHorizontalScroller", Pnl) Horz:SetSize(Pnl:GetWide()-80, 100) Horz:AlignTop(30) Horz:AlignLeft(40) Horz:SetOverlap(0) Horz:NoClipping(true)  local Btn_Prev = vgui.Create("DButton", Pnl) Btn_Prev:SetText("") Btn_Prev:SetSize(15,Horz:GetTall()) Btn_Prev:AlignLeft(0) Btn_Prev:AlignTop(30)  local Btn_Next = vgui.Create("DButton", Pnl) Btn_Next:SetText("") Btn_Next:SetSize(15,Horz:GetTall()) Btn_Next:AlignRight(0) Btn_Next:AlignTop(30)  function HorzResetAlpha(int) Horz:AlphaTo(0, 0, 0) Horz:AlphaTo(255, int or 0.5, 0) Btn_Prev:AlphaTo(0, 0, 0) Btn_Prev:AlphaTo(255, int or 0.5, 0) Btn_Next:AlphaTo(0, 0, 0) Btn_Next:AlphaTo(255, int or 0.5, 0) end HorzResetAlpha(1)   local Pnls = {}  local function FillData()  for k,v in pairs(Pnls) do if IsValid(v) then v:Remove() end end Pnls = {}  for k,v in pairs(ents.FindByClass("vc_npc_cardealer")) do  local mdl = vgui.Create("DModelPanel", Pnl) mdl:SetModel(v:GetModel()) mdl:SetCamPos(Vector(30,0,62)) mdl:SetLookAt(Vector(0, 0, 62)) mdl:SetSize(150, 150)  local RandMove = math.Rand(1.5,2.5) function mdl:LayoutEntity() mdl:SetLookAt(Vector(0, math.sin(CurTime()*RandMove), 62)) return end  local function DoClick()  local DDM = VC.DermaMenu("CD ID: "..v:GetNWInt("VC_Int"))  DDM:AddButton("Open edit panel", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_CD_RequestOpen") net.WriteEntity(v) net.SendToServer() else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/application.png")  DDM:AddButton("Trace position", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_CD_TracePos") net.WriteEntity(v) net.SendToServer() else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/map.png")  DDM:AddButton("Delete", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_CD_Delete") net.WriteEntity(v) net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/delete.png")  DDM:Open()  end  mdl.DoClick = DoClick mdl.DoRightClick = DoClick   local Nm = VC.getName(v, VC.CD.Default.Name)  local clr = VC.Color.Main  mdl.PaintOver = function(obj, Sx, Sy)  local tclr = table.Copy(clr) draw.RoundedBox(0, 0, 0, Sx, 25, clr)   if !mdl:IsHovered() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,0,0,55)) end  if mdl:IsDown() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,100,100,55)) end  draw.DrawText(Nm, nil, Sx/2,7, table.Copy(VC.Color.Blue), TEXT_ALIGN_CENTER)   local pos = 0  if mdl:IsHovered() then tclr = table.Copy(VC.Color.Blue) surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  end  table.insert(Pnls, mdl)  Horz:AddPanel(mdl)  end  end   FillData()   Horz.Think = function()  if Btn_Prev:IsDown() then Horz.OffsetX = Horz.OffsetX- (2000* Pnl.FrameRate) Horz:InvalidateLayout(true) end  if Btn_Next:IsDown() then Horz.OffsetX = Horz.OffsetX+ (2000* Pnl.FrameRate) Horz:InvalidateLayout(true) end  end  function Horz:OnMouseWheeled(delta) Horz.OffsetX = Horz.OffsetX+ delta*-100 self:InvalidateLayout(true) return true end   function Horz:PerformLayout()  local w, h = self:GetSize() local x = 0  self.pnlCanvas:SetTall(h)  if self.Panels then  for k, v in pairs(self.Panels) do if IsValid(v) then v:SetPos(x, 0) v:SetTall(h) v:ApplySchemeSettings() x = x+ v:GetWide()- self.m_iOverlap end end  self.pnlCanvas:SetWide(x + self.m_iOverlap)  if (w < self.pnlCanvas:GetWide()) then self.OffsetX = math.Clamp(self.OffsetX, 0, self.pnlCanvas:GetWide()- self:GetWide()) else self.OffsetX = 0 end  self.pnlCanvas.x = Lerp(0.1, self.pnlCanvas.x, -self.OffsetX)  end  self.btnLeft:SetVisible(false) self.btnRight:SetVisible(false)  Btn_Prev:SetVisible(self.pnlCanvas.x < -25) Btn_Next:SetVisible(self.pnlCanvas.x + self.pnlCanvas:GetWide() > (self:GetWide()+25))  end   Btn_Next.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_right) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end  Btn_Prev.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_left) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end   local clr = VC.Color.Main  local nvf = VC.Lng("NoCDFound")  Horz.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, clr)  surface.SetDrawColor(clr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx+VC.FadeW/2, Sy/2, VC.FadeW, Sy, 0)  surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180)   if #Pnls == 0 then draw.DrawText(nvf, "VC_Big_Italic", Sx/2, 35, VC.Color.Blue, TEXT_ALIGN_CENTER) end  end   local List = VC.Add_El_List(0, 35+100, Pnl:GetWide(), Pnl:GetTall()-35) List:SetParent(Pnl)  local Add = vgui.Create("VC_Button") Add:SetColor(VC.Color.Btn_Add) Add:SetText(VC.Lng("Add")) List:AddItem(Add) Add:SetToolTip("Create a new car dealer.")  Add.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_CD_Add") net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(2) List:AddItem(SNLbl)   local Respawn = vgui.Create("VC_Button") Respawn:SetColor(VC.Color.Btn_Spw) Respawn:SetText(VC.Lng("Respawn")) List:AddItem(Respawn) Respawn:SetToolTip("Respawn all car dealers on the map.")  Respawn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_CD_Refresh") net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(10) List:AddItem(SNLbl)   local CBox = VC.Add_El_Checkbox("Enabled", "Allows regular people to use car dealers.", "CD_Enabled", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_Enabled = CBox   local MPnl = VC.Add_El_Panel(List, {0.3, 0.35, 0.35}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("TowingCost", "Vehicles will be towed for money if they are too far away or not found.", "CD_Towing", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.CD_Towing = CBox  local Sldr = VC.Add_El_Slider("Price", 50, 50000, 0, "How much towing will cost.", "CD_TowingPrice", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.CD_TowingPrice = Sldr  local Sldr = VC.Add_El_Slider("Distance", 500, 50000, 0, "Minimum distance the car has to be for it to be able to be stored for free.", "CD_Distance", Settings_Sv, true) MPnl[3]:AddItem(Sldr) ElTbl.CD_Distance = Sldr   local MPnl = VC.Add_El_Panel(List, {0.65, 0.35}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("TowingNotAllowTooFar", "Do not allow the car to be towed back if its too far.", "CD_TowingTooFar", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.CD_TowingTooFar = CBox  local Sldr = VC.Add_El_Slider("Distance", 500, 50000, 0, "If the distance is greater than this the towing will not be allowed.", "CD_TowingTooFar_Distance", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.CD_TowingTooFar_Distance = Sldr   local MPnl = VC.Add_El_Panel(List, {0.5,0.5}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("TestDrive", "Allow players to test drive their vehicle for a limited time.", "CD_TestDrive", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.CD_TestDrive = CBox  local Sldr = VC.Add_El_Slider("Time", 5, 60*10, 0, "For this amount of time.", "CD_TestDriveTime", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.CD_TestDriveTime = Sldr   local MPnl = VC.Add_El_Panel(List, {0.5,0.5}, 32, true)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(8) MPnl[1]:AddItem(SNLbl)  local CBox = VC.Add_El_Checkbox("LimitReturnDistance", "Should we limit the return distance of the car from a car dealer?", "CD_ReturnLimitByDistance", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.CD_ReturnLimitByDistance = CBox  local Sldr = VC.Add_El_Slider("Distance", 500, 50000, 0, "The distance needed.", "CD_ReturnLimitByDistanceDist", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.CD_ReturnLimitByDistanceDist = Sldr   local Sldr = VC.Add_El_Slider("RefundPricePerc", 0, 100, 0, "When selling a car, what the refund price should be from the original price.", "CD_RefundPrice", Settings_Sv, true) List:AddItem(Sldr) ElTbl.CD_RefundPrice = Sldr            local CBox = VC.Add_El_Checkbox("OnlyAllowOneCarToBeSpawnedPerCarDealerPerUser", "Only one vehicle can be spawned per car dealer using per one user.", "CD_OnlyAllowOne", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_OnlyAllowOne = CBox  local CBox = VC.Add_El_Checkbox("VehiclesCanBeRemovedByTool", "If this is unchecked you are unable to remove your vehicles using a remover tool.", "CD_Veh_RemTool", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_Veh_RemTool = CBox  local CBox = VC.Add_El_Checkbox("Humming", "Car dealers hum once in a while.", "CD_Hum", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_Hum = CBox  local CBox = VC.Add_El_Checkbox("Persistent", "Will automatically respawn if removed by scripts.", "CD_Persistent", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_Persistent = CBox  local CBox = VC.Add_El_Checkbox("StoreInformation", "This will store all VCMod damage states, remaining fuel amount, etc.", "CD_StoreInfo", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_StoreInfo = CBox  local CBox = VC.Add_El_Checkbox("Unlock vehicle on use by the spawner", "Unlocks vehicle upon use for the player who spawned the vehicle", "CD_UnlockVehicleOnSpawnerUse", Settings_Sv, true) List:AddItem(CBox) ElTbl.CD_UnlockVehicleOnSpawnerUse = CBox   local MPnl = VC.Add_El_Panel(List, {0.5,0.5}, 24, true)  local CBox = VC.Add_El_Checkbox("AutoEnter", "Automatically enter the spawned vehicle.", "CD_EnterVehicleOnSpawn", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.CD_EnterVehicleOnSpawn = CBox  local CBox = VC.Add_El_Checkbox("AutoReturnOnDisconnect", "Automatically return the spawned vehicles when a player disconnects.", "CD_AutoReturnOnDisconnect", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.CD_AutoReturnOnDisconnect = CBox   local Sldr = VC.Add_El_Slider("TextViewDistance", 50, 5000, 0, "How far the text above the car dealer's heads will be visible.", "CD_Text_Dist", Settings_Sv, true) List:AddItem(Sldr) ElTbl.CD_Text_Dist = Sldr   Pnl.Paint = function(obj, Sx, Sy) draw.DrawText(VC.Lng("CD_Settings"), "VC_Dev_Text", List:GetWide()/2, 5, VC.Color.Blue, TEXT_ALIGN_CENTER) draw.DrawText(VC.Lng("Map")..": "..game.GetMap(), "VC_Dev_Text", List:GetWide(), 5, VC.Color.Blue, TEXT_ALIGN_RIGHT) end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Add) Btn:SetSize(75, 20) Btn:SetPos(Pnl:GetWide()/2-112.25, Pnl:GetTall()-20) Btn:SetText(VC.Lng("Save")) Btn:SetParent(Pnl) Btn:SetToolTip("Save the settings.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_SendSettingsToServer") net.WriteTable(Settings_Sv) net.SendToServer() VCPopup("SettingsSaved", "check") end end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Orn) Btn:SetSize(75, 20) Btn:SetPos(Pnl:GetWide()/2-37.25, Pnl:GetTall()-20) Btn:SetText(VC.Lng("Reset")) Btn:SetParent(Pnl) Btn:SetToolTip("Reset all settings to their default values.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_ResetSettings") if VC.Menu_Panel then VC.Menu_Panel.VC_Refresh_Panel = true end VCPopup("SettingsReset", "check") end end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Spw) Btn:SetPos(Pnl:GetWide()/2+37.25, Pnl:GetTall()-20) Btn:SetSize(75, 20) Btn:SetText(VC.Lng("Load")) Btn:SetParent(Pnl) Btn:SetToolTip("Load settings from the server.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_GetSettings_Sv") VCPopup("LoadedSettingsFromServer", "check") end end   if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_GetSettings_Sv") end   VC.CD.MM_Refresh = nil   Pnl.Think = function()  if VC.CD.MM_Refresh then timer.Simple(0.2, FillData) VC.CD.MM_Refresh = nil end  if VC.Settings_TempTbl then for k,v in pairs(VC.Settings_TempTbl) do if ElTbl[k] then ElTbl[k]:SetValue(v) end Settings_Sv[k] = v end VC.Settings_TempTbl = nil end  end   return Draw end VC.Menu_Items_A.NPC_CD = {"CD_Settings", BuildMenu}   local function BuildMenu(Pnl)  local Settings_Sv = {} local ElTbl = {}   Pnl.FrameRate = VGUIFrameTime()- (Pnl.FrameTime or 0) Pnl.FrameTime = VGUIFrameTime()   local Horz = vgui.Create("DHorizontalScroller", Pnl) Horz:SetSize(Pnl:GetWide()-80, 100) Horz:AlignTop(30) Horz:AlignLeft(40) Horz:SetOverlap(0) Horz:NoClipping(true)  local Btn_Prev = vgui.Create("DButton", Pnl) Btn_Prev:SetText("") Btn_Prev:SetSize(15,Horz:GetTall()) Btn_Prev:AlignLeft(0) Btn_Prev:AlignTop(30)  local Btn_Next = vgui.Create("DButton", Pnl) Btn_Next:SetText("") Btn_Next:SetSize(15,Horz:GetTall()) Btn_Next:AlignRight(0) Btn_Next:AlignTop(30)  function HorzResetAlpha(int) Horz:AlphaTo(0, 0, 0) Horz:AlphaTo(255, int or 0.5, 0) Btn_Prev:AlphaTo(0, 0, 0) Btn_Prev:AlphaTo(255, int or 0.5, 0) Btn_Next:AlphaTo(0, 0, 0) Btn_Next:AlphaTo(255, int or 0.5, 0) end HorzResetAlpha(1)   local Pnls = {}  local function FillData()  for k,v in pairs(Pnls) do if IsValid(v) then v:Remove() end end Pnls = {}  for k,v in pairs(ents.FindByClass("vc_npc_repair")) do  local mdl = vgui.Create("DModelPanel", Pnl) mdl:SetModel(v:GetModel()) mdl:SetCamPos(Vector(30,0,62)) mdl:SetLookAt(Vector(0, 0, 62)) mdl:SetSize(150, 150)  local RandMove = math.Rand(1.5,2.5) function mdl:LayoutEntity() mdl:SetLookAt(Vector(0, math.sin(CurTime()*RandMove), 62)) return end  local function DoClick()  local DDM = VC.DermaMenu("RM ID: "..v:GetNWInt("VC_Int"))  DDM:AddButton("Open edit panel", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_RM_RequestOpen") net.WriteEntity(v) net.SendToServer() else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/application.png")  DDM:AddButton("Trace position", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_RM_TracePos") net.WriteEntity(v) net.SendToServer() else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/map.png")  DDM:AddButton("Delete", function() if IsValid(v) and VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_RM_Delete") net.WriteEntity(v) net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end):SetImage("icon16/delete.png")  DDM:Open()  end  mdl.DoClick = DoClick mdl.DoRightClick = DoClick   local Nm = VC.getName(v, VC.RM.Default.Name)  local clr = VC.Color.Main  mdl.PaintOver = function(obj, Sx, Sy)  local tclr = table.Copy(clr) draw.RoundedBox(0, 0, 0, Sx, 25, clr)   if !mdl:IsHovered() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,0,0,55)) end  if mdl:IsDown() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,100,100,55)) end  draw.DrawText(Nm, nil, Sx/2,7, table.Copy(VC.Color.Blue), TEXT_ALIGN_CENTER)   local pos = 0  if mdl:IsHovered() then tclr = table.Copy(VC.Color.Blue) surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  end  table.insert(Pnls, mdl)  Horz:AddPanel(mdl)  end  end   FillData()   Horz.Think = function()  if Btn_Prev:IsDown() then Horz.OffsetX = Horz.OffsetX- (2000* Pnl.FrameRate) Horz:InvalidateLayout(true) end  if Btn_Next:IsDown() then Horz.OffsetX = Horz.OffsetX+ (2000* Pnl.FrameRate) Horz:InvalidateLayout(true) end  end  function Horz:OnMouseWheeled(delta) Horz.OffsetX = Horz.OffsetX+ delta*-100 self:InvalidateLayout(true) return true end   function Horz:PerformLayout()  local w, h = self:GetSize() local x = 0  self.pnlCanvas:SetTall(h)  if self.Panels then  for k, v in pairs(self.Panels) do if IsValid(v) then v:SetPos(x, 0) v:SetTall(h) v:ApplySchemeSettings() x = x+ v:GetWide()- self.m_iOverlap end end  self.pnlCanvas:SetWide(x + self.m_iOverlap)  if (w < self.pnlCanvas:GetWide()) then self.OffsetX = math.Clamp(self.OffsetX, 0, self.pnlCanvas:GetWide()- self:GetWide()) else self.OffsetX = 0 end  self.pnlCanvas.x = Lerp(0.1, self.pnlCanvas.x, -self.OffsetX)  end  self.btnLeft:SetVisible(false) self.btnRight:SetVisible(false)  Btn_Prev:SetVisible(self.pnlCanvas.x < -25) Btn_Next:SetVisible(self.pnlCanvas.x + self.pnlCanvas:GetWide() > (self:GetWide()+25))  end   Btn_Next.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_right) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end  Btn_Prev.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_left) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end   local clr = VC.Color.Main  local nvf = VC.Lng("NoneFound")  Horz.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, clr)  surface.SetDrawColor(clr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx+VC.FadeW/2, Sy/2, VC.FadeW, Sy, 0)  surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180)   if #Pnls == 0 then draw.DrawText(nvf, "VC_Big_Italic", Sx/2, 35, VC.Color.Blue, TEXT_ALIGN_CENTER) end  end   local List = VC.Add_El_List(0, 35+100, Pnl:GetWide(), Pnl:GetTall()-35) List:SetParent(Pnl)  local Add = vgui.Create("VC_Button") Add:SetColor(VC.Color.Btn_Add) Add:SetText(VC.Lng("Add")) List:AddItem(Add) Add:SetToolTip("Create a new repair main.")  Add.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_RM_Add") net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(2) List:AddItem(SNLbl)   local Respawn = vgui.Create("VC_Button") Respawn:SetColor(VC.Color.Btn_Spw) Respawn:SetText(VC.Lng("Respawn")) List:AddItem(Respawn) Respawn:SetToolTip("Respawn all repair-men on the map.")  Respawn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_RM_Refresh") net.SendToServer() timer.Simple(0.5, function() FillData() end) else VCPopup("AccessRestricted", "cross") end end   local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(10) List:AddItem(SNLbl)   local CBox = VC.Add_El_Checkbox("Enabled", "Allows regular people to use repair-men.", "RM_Enabled", Settings_Sv, true) List:AddItem(CBox) ElTbl.RM_Enabled = CBox   local Sldr = VC.Add_El_Slider("TextViewDistance", 50, 5000, 0, "How far the text above the repair man's heads will be visible.", "RM_Text_Dist", Settings_Sv, true) List:AddItem(Sldr) ElTbl.RM_Text_Dist = Sldr   local MPnl = VC.Add_El_Panel(List, {0.5,0.5}, 32, true)  local Sldr = VC.Add_El_Slider("DetectDistance", 50, 5000, 0, "How far a car has to be ir order to be detected by the repair-man.", "RM_Distance", Settings_Sv, true) MPnl[1]:AddItem(Sldr) ElTbl.RM_Distance = Sldr  local Sldr = VC.Add_El_Slider("RepairSpeedMult", 0, 5, 2, "How fast parts will be repaired", "RM_RepairSpeedMult", Settings_Sv, true) MPnl[2]:AddItem(Sldr) ElTbl.RM_RepairSpeedMult = Sldr   local MPnl = VC.Add_El_Panel(List, {0.5,0.5}, 16, true)  local CBox = VC.Add_El_Checkbox("Humming", "Will hum once in a while.", "RM_Hum", Settings_Sv, true) MPnl[1]:AddItem(CBox) ElTbl.RM_Hum = CBox  local CBox = VC.Add_El_Checkbox("Persistent", "Will automatically respawn if removed by scripts.", "RM_Persistent", Settings_Sv, true) MPnl[2]:AddItem(CBox) ElTbl.RM_Persistent = CBox   VC.Add_El_Banner(List, "Prices")  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..string.lower(VC.Lng("Time")), 0, 10, 2, "Price of repairs, per second.", "RM_Repair_Time_Cost", Settings_Sv, true) List:AddItem(Sldr) ElTbl.RM_Repair_Time_Cost = Sldr  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..string.lower(VC.Lng("Engine")), 0, 100000, 0, "Price of engine full repair. (Price will be twice as low if the engine is not fully destroyed).", "RM_Price_Engine", Settings_Sv, true) List:AddItem(Sldr) ElTbl.RM_Price_Engine = Sldr  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..string.lower(VC.Lng("Light")), 0, 100000, 0, "Price of a new light.", "RM_Price_Light", Settings_Sv, true) List:AddItem(Sldr) ElTbl.RM_Price_Light = Sldr  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..string.lower(VC.Lng("Tire")), 0, 100000, 0, "Price of a new tire.", "RM_Price_Tire", Settings_Sv, true) List:AddItem(Sldr) ElTbl.RM_Price_Tire = Sldr  local Sldr = VC.Add_El_Slider(VC.Lng("Price").." "..string.lower(VC.Lng("Exhaust")), 0, 100000, 0, "Price of a new exhaust pipe.", "RM_Price_Exhaust", Settings_Sv, true) List:AddItem(Sldr) ElTbl.RM_Price_Exhaust = Sldr   Pnl.Paint = function(obj, Sx, Sy) draw.DrawText(VC.Lng("RM_Settings"), "VC_Dev_Text", List:GetWide()/2, 5, VC.Color.Blue, TEXT_ALIGN_CENTER) draw.DrawText(VC.Lng("Map")..": "..game.GetMap(), "VC_Dev_Text", List:GetWide(), 5, VC.Color.Blue, TEXT_ALIGN_RIGHT) end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Add) Btn:SetSize(75, 20) Btn:SetPos(Pnl:GetWide()/2-112.25, Pnl:GetTall()-20) Btn:SetText(VC.Lng("Save")) Btn:SetParent(Pnl) Btn:SetToolTip("Save the settings.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then net.Start("VC_SendSettingsToServer") net.WriteTable(Settings_Sv) net.SendToServer() VCPopup("SettingsSaved", "check") end end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Orn) Btn:SetSize(75, 20) Btn:SetPos(Pnl:GetWide()/2-37.25, Pnl:GetTall()-20) Btn:SetText(VC.Lng("Reset")) Btn:SetParent(Pnl) Btn:SetToolTip("Reset all settings to their default values.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_ResetSettings") if VC.Menu_Panel then VC.Menu_Panel.VC_Refresh_Panel = true end VCPopup("SettingsReset", "check") end end   local Btn = vgui.Create("VC_Button") Btn:SetColor(VC.Color.Btn_Spw) Btn:SetPos(Pnl:GetWide()/2+37.25, Pnl:GetTall()-20) Btn:SetSize(75, 20) Btn:SetText(VC.Lng("Load")) Btn:SetParent(Pnl) Btn:SetToolTip("Load settings from the server.")  Btn.DoClick = function() if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_GetSettings_Sv") VCPopup("LoadedSettingsFromServer", "check") end end   if VC.CanEditAdminSettings(LocalPlayer()) then RunConsoleCommand("VC_GetSettings_Sv") end   VC.CD.MM_Refresh = nil   Pnl.Think = function()    if VC.Settings_TempTbl then for k,v in pairs(VC.Settings_TempTbl) do if ElTbl[k] then ElTbl[k]:SetValue(v) end Settings_Sv[k] = v end VC.Settings_TempTbl = nil end  end   return Draw end VC.Menu_Items_A.NPC_RM = {"RepairMan", BuildMenu} local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH ml_pr_l:
mLib.Include("mlogs/load/sh_load.lua") mLib.Include("mlogs/cami/sh_cami.lua") mLib.Include("mlogs/minify/sh_parselua.lua") mLib.Include("mlogs/language/sh_language.lua") mLib.Include("mlogs/language/languages/default.lua") mLib.Include("mlogs/language/languages/english.lua") mLib.Include("mlogs/language/cl_language.lua") mLib.Include("mlogs/core/sh_interface.lua") mLib.Include("mlogs/core/sh_core.lua") mLib.Include("mlogs/core/cl_interface.lua") mLib.Include("mlogs/core/cl_core.lua") mLib.Include("mlogs/permissions/sh_permissions.lua") mLib.Include("mlogs/permissions/cl_permissions.lua") mLib.Include("mlogs/config/sh_config.lua") mLib.Include("mlogs/config/cl_config.lua") mLib.Include("mlogs/notify/cl_notify.lua") mLib.Include("mlogs/logger/sh_logger.lua") mLib.Include("mlogs/logger/sh_defs.lua") mLib.Include("mlogs/logger/sh_configure.lua") mLib.Include("mlogs/logger/sh_advlogger.lua") mLib.Include("mlogs/logger/loggers/logs/__category.lua") mLib.Include("mlogs/logger/cl_logger.lua") mLib.Include("mlogs/logger/cl_defs.lua") mLib.Include("mlogs/logger/cl_console.lua") mLib.Include("mlogs/settings/sh_settings.lua") mLib.Include("mlogs/settings/subs/sh_ui.lua") mLib.Include("mlogs/settings/subs/sh_types.lua") mLib.Include("mlogs/settings/subs/sh_storage.lua") mLib.Include("mlogs/settings/subs/sh_permissions.lua") mLib.Include("mlogs/settings/subs/sh_loggers.lua") mLib.Include("mlogs/settings/subs/sh_general.lua") mLib.Include("mlogs/settings/subs/sh_format.lua") mLib.Include("mlogs/settings/subs/sh_discord.lua") mLib.Include("mlogs/settings/subs/sh_console.lua") mLib.Include("mlogs/settings/subs/sh_automation.lua") mLib.Include("mlogs/settings/types/sh_string.lua") mLib.Include("mlogs/settings/types/sh_permissions.lua") mLib.Include("mlogs/settings/types/sh_number.lua") mLib.Include("mlogs/settings/types/sh_logger.lua") mLib.Include("mlogs/settings/types/sh_color.lua") mLib.Include("mlogs/settings/types/sh_bool.lua") mLib.Include("mlogs/settings/types/sh_action.lua") mLib.Include("mlogs/settings/cl_settings.lua") mLib.Include("mlogs/elements/logs/cl_logsposition.lua") mLib.Include("mlogs/elements/logs/cl_logsoptions.lua") mLib.Include("mlogs/elements/logs/cl_logsinfo.lua") mLib.Include("mlogs/elements/logs/cl_logshook.lua") mLib.Include("mlogs/elements/logs/cl_logscategory.lua") mLib.Include("mlogs/elements/logs/cl_logsadvancepanel.lua") mLib.Include("mlogs/elements/logs/cl_logsadvance.lua") mLib.Include("mlogs/elements/logs/cl_logsView.lua") mLib.Include("mlogs/elements/logs/cl_logs.lua") mLib.Include("mlogs/elements/main/cl_sidebarbutton.lua") mLib.Include("mlogs/elements/main/cl_mainheader.lua") mLib.Include("mlogs/elements/main/cl_mainframe.lua") mLib.Include("mlogs/elements/settings/types/cl_string.lua") mLib.Include("mlogs/elements/settings/types/cl_spacer.lua") mLib.Include("mlogs/elements/settings/types/cl_permissions_list.lua") mLib.Include("mlogs/elements/settings/types/cl_permissions.lua") mLib.Include("mlogs/elements/settings/types/cl_number.lua") mLib.Include("mlogs/elements/settings/types/cl_logger.lua") mLib.Include("mlogs/elements/settings/types/cl_color.lua") mLib.Include("mlogs/elements/settings/types/cl_bool.lua") mLib.Include("mlogs/elements/settings/types/cl_action.lua") mLib.Include("mlogs/elements/settings/cl_sub.lua") mLib.Include("mlogs/elements/settings/cl_settingsbase.lua") mLib.Include("mlogs/elements/settings/cl_settings.lua") mLib.Include("mlogs/elements/settings/cl_category.lua") mLib.Include("mlogs/elements/ui/cl_text.lua") mLib.Include("mlogs/elements/ui/cl_stringrequest.lua") mLib.Include("mlogs/elements/ui/cl_stringentry.lua") mLib.Include("mlogs/elements/ui/cl_sidebar.lua") mLib.Include("mlogs/elements/ui/cl_scrollpanel.lua") mLib.Include("mlogs/elements/ui/cl_scrollbar.lua") mLib.Include("mlogs/elements/ui/cl_propertysheet.lua") mLib.Include("mlogs/elements/ui/cl_popup.lua") mLib.Include("mlogs/elements/ui/cl_numberentry.lua") mLib.Include("mlogs/elements/ui/cl_navbuttons.lua") mLib.Include("mlogs/elements/ui/cl_listview_line.lua") mLib.Include("mlogs/elements/ui/cl_listview_column.lua") mLib.Include("mlogs/elements/ui/cl_listview.lua") mLib.Include("mlogs/elements/ui/cl_horizontalscroller.lua") mLib.Include("mlogs/elements/ui/cl_fonts.lua") mLib.Include("mlogs/elements/ui/cl_contentbase.lua") mLib.Include("mlogs/elements/ui/cl_button.lua") 
--PATH mlogs/core/cl_interface.lua:
   net.Receive("mLogs_interface",function() 	local command = net.ReadString() 	local cmd = mLogs.interfaces[command] 	if not cmd then return end 	cmd.callback() end)  function mLogs.InteractInterface(command, writeFn) 	net.Start("mLogs_interface") 		net.WriteString(command) 		writeFn() 	net.SendToServer() end 
--PATH mlogs/logger/loggers/vcmod/__category.lua:
   mLogs.addCategory( 	"VCMod",   	"vcmod",  	Color(207, 0, 15),   	function()   		return VC != nil 	end, 	true   )  mLogs.addCategoryDefinitions("vcmod", { 	vcpurchase = function(data) return mLogs.doLogReplace({"^player1","purchased a","^item"},data) end, 	vcspike = function(data) return mLogs.doLogReplace({"^player1","placed a spikestrip"},data) end, 	vcrepair = function(data) return mLogs.doLogReplace({"^player1","finished repairing a", "^vehicle", "^part"},data) end, }) 
--PATH mlogs/settings/subs/sh_permissions.lua:
       local ct,st = "server","permissions" mLogs.settings.addSubcategory(mLogs.getLang("permissions"),ct,st,70,true)  mLogs.settings.addOption(ct,st,{     title = "Permissions",     tag = "permissions",     desc = "",     type = "permissions",     default = "",     get = function() return true end,     set = function(command) end })  
--PATH mlogs/settings/subs/sh_general.lua:
       local ct,st = "server", "general" mLogs.settings.addSubcategory(mLogs.getLang("general"),ct,st,100)  mLogs.settings.addSpacer(mLogs.getLang("commands"),ct,st) mLogs.settings.addOption(ct,st,{     title = "Chat Command",     tag = "chat_command",     desc = "The chat command used to open the menu",     type = "string",     default = "/logs",     get = function() return mLogs.config.chatCommand end,     set = function(command) mLogs.config.chatCommand = command end })  mLogs.settings.addOption(ct,st,{     title = "Console Command",     tag = "console_command",     desc = "The console command used to open the menu",     type = "string",     default = "mlogs",     get = function() return mLogs.config.consoleCommand end,     set = function(command) mLogs.config.consoleCommand = command end })  mLogs.settings.addSpacer("File",ct,st) mLogs.settings.addOption(ct,st,{     title = "File Logs",     tag = "file_logs",     desc = "Should logs be saved to disk? (files stored in data/mlogs2/)",     type = "bool",     default = true,     get = function() return true end,     set = function(bool) mLogs.config.fileLogs = bool end })  mLogs.settings.addSpacer("External Loggers",ct,st) mLogs.settings.addOption(ct,st,{     title = "External Loggers",     tag = "external_loggers",     desc = "Should mLogs check for available loggers from M4D?",     type = "bool",     default = true,     get = function() return not mLogs.logger.disableEL end,     set = function(bool) mLogs.logger.disableEL = not bool end }) 
--PATH mlogs/settings/subs/sh_automation.lua:
       local ct,st = "server", "automation" mLogs.settings.addSubcategory(mLogs.getLang("automation"),ct,st,85)   mLogs.settings.addSpacer(mLogs.getLang("automation"),ct,st) mLogs.settings.addOption(ct,st,{     title = "Move to Deep Storage Interval",     tag = "automation_deepstorage",     desc = "How long should logs be kept before being moved into deep storage? Default: 7 days",     type = "number",     default = 604800,     get = function() return mLogs.config.moveToDeepStorage end,     set = function(num) mLogs.config.moveToDeepStorage = num end })  mLogs.settings.addOption(ct,st,{     title = "Clear Deep Storage Interval",     tag = "automation_cdeepstorage",     desc = "How long should logs be kept in deep storage before being deleted? (file logs still kept) Default: 30 days",     type = "number",     default = 2592000,     get = function() return mLogs.config.clearDeepStorage end,     set = function(num) mLogs.config.clearDeepStorage = num end })  mLogs.settings.addOption(ct,st,{     title = "View Current Automation Times",     tag = "automation_times",     desc = "View the next automation times in your console!",     type = "action",     default = "",     are_you_sure_msg = "The times will be printed to your CONSOLE! They are based on the server's time.",     get = function() return "Print Times to Console" end,     set = function(ply) mLogs.automation.printToConsole(ply) end })  mLogs.settings.addOption(ct,st,{     title = "Reset Automation Times",     tag = "automation_reset_times",     desc = "Reset the automation times to run from today midnight!",     type = "action",     default = "",     are_you_sure_msg = "This will reset automation times starting from today midnight!",     get = function() return "Reset Automation Times" end,     set = function(ply) mLogs.automation.reset(ply) end }) 
--PATH mlogs/settings/types/sh_permissions.lua:
     mLogs.settings.addType("permissions",function(d)     return true end) 
--PATH mlogs/elements/main/cl_mainframe.lua:
   local PANEL = {}  function PANEL:AddSidebarItem(title,icon,frame,check) 	table.insert(self.sidebarItems,{title=title,icon=icon,frame=frame,check=check}) 	self.sidebar:AddItem(title,icon,frame,check) end  function PANEL:Init() 	if not IsValid(LocalPlayer()) then return end 	self.sidebarItems = {} 	 	  	self:SetDraggable(false) 	self:ShowCloseButton(false) 	self:SetTitle("") 	 	  	self.header = self:Add("mLogs_mainHeader") 	self.header:SetClosePanel(self) 	 	self.openTime = SysTime() 	  	  	  	 	  	  	  	  	  	  	  	  	  	 	  	  		  			  			  		  	  	self:SwitchPanel("mLogs_logs") end function PANEL:SwitchPanel(frm) 	if(frm == self.currentFrame) then return end 	if(ValidPanel(self.content))then 		self.content:Remove() 	end 	self.content = self:Add(frm) 	self:InvalidateLayout(true) 	if(self.content.OnShowPanel)then 		self.content:OnShowPanel() 	end 	self.currentFrame = frm end  function PANEL:GetContent() 	return self.content end  function PANEL:GetCurrentFrame() 	return self.currentFrame end  function PANEL:SendUpdate() 	self.content:SendUpdate() end  function PANEL:Paint(w,h) 	if(mLogs.config.blur.bg)then 		mLogs.drawBlur(self,w,h) 		return 	end 	  end  function PANEL:PerformLayout(w,h) 	self.header:SetSize(w,h*0.08) 	 	  	  	 	if(ValidPanel(self.content))then 		self.content:SetPos(0,h*0.08) 		self.content:SetSize(w,h*0.92) 	end end vgui.Register( "mLogs_mainFrame", PANEL, "DFrame" ) 
--PATH mlogs/elements/settings/types/cl_string.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_settingsBase")  function PANEL:Init()  	self.action = self:Add("mLogs_stringEntry")     self.action:SetFont("mLogs_clearText") end  function PANEL:GetData() 	return self.action:GetText() end  function PANEL:OnReset() 	self.action:SetText(self.option.default) end  function PANEL:OnOption(option,data) 	if (not data) then return end 	self.action:SetText(data) end  function PANEL:PerformLayout(w,h)     BaseClass.PerformLayout(self,w,h) end  vgui.Register( "mLogs_settingsOption_string", PANEL, "mLogs_settingsBase" ) 
--PATH mlogs/elements/ui/cl_listview.lua:
   DEFINE_BASECLASS("DListView")  local PANEL = {} AccessorFunc(PANEL,"m_cBGColor","BGColor") AccessorFunc(PANEL,"m_bEditable","Editable") function PANEL:Init() 	self:SetBGColor(mLogs.config.colors.panel) 	self:SetEditable(false) 	self:SetHeaderHeight(20) 	self:SetDataHeight( 24 ) 	 	local color = mLogs.config.colors.scrollGrip 	self.VBar:SetHideButtons(true) 	self.VBar:SetWide(5) 	self.VBar.Paint = function() end 	self.alpha = color.a 	self.oldY = 0 	self.lastChange = CurTime() 	self.VBar.btnGrip.Paint = function(s,w,h) 		if(s.y != self.oldY) then 			self.lastChange = CurTime() 			self.alpha = color.a 		end 		local time = CurTime() - (self.lastChange+4) 		if(self.alpha > 0 and (CurTime() - self.lastChange) > 3 and time < 0) then 			self.alpha = Lerp(math.abs(time),0,color.a) 		end 		self.oldY = s.y 		draw.RoundedBox(0,0,0,w,h,Color(color.r,color.b,color.g,self.alpha))  	end end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,self:GetBGColor()) end  function PANEL:AddColumn( strName, iPosition )  	local pColumn = nil  	if ( self.m_bSortable ) then 		pColumn = vgui.Create( "mLogs_listView_column", self ) 	else 		pColumn = vgui.Create( "mLogs_listView_columnPlain", self ) 	end  	pColumn:SetName( strName ) 	pColumn:SetZPos( 10 )  	if ( iPosition ) then  		table.insert( self.Columns, iPosition, pColumn )  		for i = 1, #self.Columns do 			self.Columns[ i ]:SetColumnID( i ) 		end  	else  		local ID = table.insert( self.Columns, pColumn ) 		pColumn:SetColumnID( ID )  	end  	self:InvalidateLayout()  	return pColumn  end  function PANEL:AddLine( ... )  	self:SetDirty( true ) 	self:InvalidateLayout()  	local Line = vgui.Create( "mLogs_listView_line", self.pnlCanvas ) 	local ID = table.insert( self.Lines, Line )  	Line:SetListView( self ) 	Line:SetID( ID ) 	Line:SetEditable(self:GetEditable())  	  	for k, v in pairs( self.Columns ) do 		Line:SetColumnText( k, "" ) 	end  	for k, v in pairs( {...} ) do 		Line:SetColumnText( k, v ) 	end  	  	local SortID = table.insert( self.Sorted, Line )  	if ( SortID % 2 == 1 ) then 		Line:SetAltLine( true ) 	end  	return Line  end  function PANEL:Clear() 	BaseClass.Clear(self) end  function PANEL:PerformLayout(w,h) 	  	local Wide = self:GetWide() 	local YPos = 0  	if ( IsValid( self.VBar ) ) then  		self.VBar:SetPos( self:GetWide() - 4, 0 ) 		self.VBar:SetSize( 4, self:GetTall() ) 		self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() ) 		YPos = self.VBar:GetOffset()  		if ( self.VBar.Enabled ) then Wide = Wide - 4 end  	end  	if ( self.m_bHideHeaders ) then 		self.pnlCanvas:SetPos( 0, YPos ) 	else 		self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() ) 	end  	self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )  	self:FixColumnsLayout()  	  	  	  	if ( self:GetDirty( true ) ) then  		self:SetDirty( false ) 		local y = self:DataLayout() 		self.pnlCanvas:SetTall( y )  		  		self:InvalidateLayout( true )  	end end  vgui.Register( "mLogs_listView", PANEL, "DListView" )	 