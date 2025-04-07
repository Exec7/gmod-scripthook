--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 9/10 - 08/04/2025


--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_notify.lua:
AAS.Notify = AAS.Notify or {}

function AAS.Notification(time, msg)
    if AAS.ActivateNotification then
        AAS.Notify[#AAS.Notify + 1] = {
            ["Message"] = msg,
            ["Time"] = CurTime() + (time or 5),
            ["Material"] = Material("aas_materials/man.png", "smooth"), 
        }
    else
        notification.AddLegacy(msg, NOTIFY_GENERIC, time)
    end
end

hook.Add("DrawOverlay", "AAS:DrawOverlay", function()
    if AAS.Notify and #AAS.Notify > 0 then 
        for k,v in ipairs(AAS.Notify) do 
            if not isnumber(v.RLerp) then v.RLerp = -(AAS.ScrW*0.25 + #v.Message*AAS.ScrW*0.0057) end 

            surface.SetFont("AAS:Font:11")
            local SizeText = surface.GetTextSize(v.Message)

            if v.Time > CurTime() then 
                v.RLerp = math.Round(Lerp(6*FrameTime(), v.RLerp, AAS.ScrW*0.02))
            else 
                v.RLerp = math.Round(Lerp(6*FrameTime(), v.RLerp, -(AAS.ScrW*0.25 + #v.Message*AAS.ScrW*0.0057+AAS.ScrW*0.032)))
                if v.RLerp < -(AAS.ScrW*0.1 + #v.Message*AAS.ScrW*0.0057+AAS.ScrW*0.032) then AAS.Notify[k] = nil AAS.Notify = table.ClearKeys(AAS.Notify) end 
            end 
            
            draw.RoundedBox(4, v.RLerp, (AAS.ScrH*0.055*k)-AAS.ScrH*0.038, SizeText + AAS.ScrH*0.07, AAS.ScrH*0.043, AAS.Colors["black18200"])
            draw.RoundedBox(4, v.RLerp, (AAS.ScrH*0.055*k)-AAS.ScrH*0.038, AAS.ScrH*0.043, AAS.ScrH*0.043, AAS.Colors["notifycolor"])
            
            local width, height = (v.Material:Width()*AAS.ScrW/1920), (v.Material:Height()*AAS.ScrH/1080)
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(v.Material)
            surface.DrawTexturedRect( v.RLerp + AAS.ScrH*0.045/2 - width/2, (AAS.ScrH*0.055*k) - height, width, height)

            draw.SimpleText(v.Message, "AAS:Font:11", v.RLerp + AAS.ScrW*0.03, (AAS.ScrH*0.055*k) + AAS.ScrH*0.04/2-AAS.ScrH*0.038, AAS.Colors["white"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end 
    end
end)

net.Receive("AAS:Notification", function()
    local Time = net.ReadUInt(5)
    local Message = net.ReadString()
    
    if AAS.ActivateNotification then
        AAS.Notification(Message, Time)
    else
        notification.AddLegacy(Message, NOTIFY_GENERIC, Time)
    end
end)
--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_combobox.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize(AAS.ScrW*0.15, AAS.ScrH*0.029)
    self:SetTextColor(AAS.Colors["white"])
    self:SetText("")
    self:SetFont("AAS:Font:03")
end

function PANEL:Paint(w, h)
    draw.RoundedBox(4, 0, 0, w, h, AAS.Colors["black18"])
end

derma.DefineControl("AAS:ComboBox", "AAS ComboBox", PANEL, "DComboBox")
--PATH addons/sl_aphone/lua/aphone/sh_config.lua:
--[[
	Hello there !
	You like the addon ? Mind making a review ? That would be very helpful and it's always nice to see happy people :)
]]--

aphone.GPS = {
}

// UNCOMMENT THIS ONLY IF YOUR SERVER CRASH WHEN USING GPS
// aphone.GPSScan = 1000

// Edit there if you want to add painting, However you need to make the player download them yourself
aphone.Painting = {
	[1] = "akulla/aphone/sticker_1.png",
	[2] = "akulla/aphone/sticker_2.png",
	[3] = "akulla/aphone/sticker_3.png",
	[4] = "akulla/aphone/sticker_4.png",
	[5] = "akulla/aphone/sticker_5.png",
	[6] = "akulla/aphone/sticker_6.png",
	[7] = "akulla/aphone/sticker_7.png",
	[8] = "akulla/aphone/sticker_8.png",
	[9] = "akulla/aphone/sticker_9.png",
	[10] = "akulla/aphone/sticker_10.png",
	[11] = "akulla/aphone/sticker_11.png",
	[12] = "akulla/aphone/sticker_12.png",
	[13] = "akulla/aphone/sticker_13.png",
	[14] = "akulla/aphone/sticker_14.png",
	[15] = "akulla/aphone/sticker_15.png",
	[16] = "akulla/aphone/sticker_16.png",
	[17] = "akulla/aphone/sticker_17.png",
	[18] = "akulla/aphone/sticker_18.png",
	[19] = "akulla/aphone/sticker_19.png",
	[20] = "akulla/aphone/sticker_20.png",
	[21] = "akulla/aphone/sticker_21.png",
	[22] = "akulla/aphone/sticker_22.png",
	[23] = "akulla/aphone/sticker_23.png",
	[24] = "akulla/aphone/sticker_24.png",
	[25] = "akulla/aphone/sticker_25.png",
	[26] = "akulla/aphone/sticker_26.png",
	[27] = "akulla/aphone/sticker_27.png",
	[28] = "akulla/aphone/sticker_28.png",
	[29] = "akulla/aphone/sticker_29.png",
	[30] = "akulla/aphone/sticker_30.png",
}

// 8 Numbers/%s please
aphone.Format = "+82 %s%s%s%s%s%s%s%s"

aphone.OthersHearRadio = true
aphone.Language = "french"
aphone.bank_onlytransfer = false
aphone.never_realname = false // Hide RP Name, except in Friends
aphone.disable_showingUnknownPlayers = false
aphone.disable_hitman = false
aphone.disable_smileycamera = false

aphone.Links = {
	{
		name = "Discord",
		icon = "akulla/aphone/app_socialserver.png",
		link = "https://discord.gg/qJHmVrqhFV",
	},
}

aphone.SpecialCallsCooldown = 30
aphone.SpecialCalls = {
	{
		name = "l'Association",
		icon = "akulla/aphone/specialcall_police.png",
		teams = {
			[2] = true,
			["Police"] = true,
		},
		desc = "Call police",
	}
}

aphone.Ringtones = {
	{
		name = "Old School",
		url = "https://akulla.dev/aphone/oldschool_ringtone.mp3",
		-- is_local = true, For workshop/fastdl content sounds
	},
}

aphone.DarkWeb = aphone.DarkWeb or {
	config = {
		viewing_jobs = {
			["Citizen"] = true,
		},

		killing_jobs = {
			["Citizen"] = true,
		},

		min = -1, // > 0 to have a min amount
		max = -1 // > 0 to have a max amount
	}
}

aphone.backgrounds_imgur = {
	"q17ud2K",
	"VQHAC3h",
	"vlwy740",
	"TxUSRK5",
	"DY0NdEr",
	"ACuEH9j",
	"6oeJSj9",
	"KPA1Q2d",
	"HijquPC",
	"7DX9Fuv",
	"ohrMfn1",
	"aI1Oxmn",
	"IMkav2r",
	"MqzB4Ib",
	"93TZu0t",
	"OmMWSSY",
	"fcIFXay",
	"lH2pun4",
	"OHzGh9m",
	"b8gEjIl",
	"qFSFj6l",
	"5nCGb2C",
	"wzXxgPQ",
	"JJH78M6",
	"1zhAVuS",
	"Fel9fOI",
	"pkVIpj5",
	"xQEWbYt",
	"Lv4zq7k",
	"Fh8Sx95",
	"nGWhWsx",
	"OvmjYIK",
}

aphone.RadioList = {
	{
		name = "Rap FR",
		url = "http://urbanhitrapfr.ice.infomaniak.ch/urbanhitrapfr-128.mp3",
		logo = "https://cdn-profiles.tunein.com/s74407/images/logog.png",
		clr = Color(230, 126, 34),
	},
	{
		name = "Rap US",
		url = "https://generationfm-underground.ice.infomaniak.ch/generationfm-underground-high.mp3",
		logo = "https://cdn.onlineradiobox.com/img/l/6/6376.v4.png",
		clr = Color(231, 76, 60),
	},
	{
		name = "NRJ",
		logo = "https://images-eu.ssl-images-amazon.com/images/I/61pw4pjJN9L.png",
		url = "https://scdn.nrjaudio.fm/fr/30001/mp3_128.mp3?cdn_path=adswizz_lbs9",
		clr = Color(255, 100, 100),
	},
	{
		name = "Allzic Chill",
		logo = "https://www.allzicradio.com/media/radios/thumb/195x195_allzic-radio-electro-chillout_1400px.png",
		url = "https://allzic53.ice.infomaniak.ch/allzic53.mp3",
		clr = Color(210, 162, 0),
	},
	{
		name = "Fun Radio",
		logo = "https://images-eu.ssl-images-amazon.com/images/I/61SBhLAGLNL.png",
		url = "http://streamer-01.rtl.fr/fun-1-44-128?listen=webCwsBCggNCQgLDQUGBAcGBg",
		clr = Color(243, 104, 224),
	},
	{
		name = "Mouv'",
		logo = "https://i.imgur.com/lgDfnrA.png",
		url = "http://direct.mouv.fr/live/mouvxtra-midfi.mp3?ID=33c5hej2c2",
		clr = Color(93, 255, 166),
	},
	{
		name = "Skyrock",
		logo = "https://www.radio.net/images/broadcasts/c1/bb/8302/3/c300.png",
		url = "http://icecast.skyrock.net/s/natio_mp3_128k",
		clr = Color(255, 50, 50),
	},
}
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl__clientside_save.lua:
-- Save Vars
aphone.Clientside = aphone.Clientside or {}
aphone.Clientside.Varlist = util.JSONToTable(file.Read("aphone/save.json") or "") or {}

-- You can't create a folder with : in the name
local dir = "aphone/" .. string.Replace(game.GetIPAddress(), ":", "_") .. "/"
file.CreateDir(dir)

function aphone.Clientside.GetSetting(name, fallback)
    return aphone.Clientside.Varlist[name] or fallback
end

-- Save, with timer so we don't kill their HDD and gmod with spamming saves
local rewrite = false

function aphone.Clientside.SaveSetting(name, var)
    aphone.Clientside.Varlist[name] = var
    rewrite = true
end

timer.Create("aphone_InsertNewInfosClientside", 10, 0, function()
    if rewrite then
        file.Write("aphone/save.json", util.TableToJSON(aphone.Clientside.Varlist))
        rewrite = false
    end
end)

-- Register Param
local acceptables_types = {
    ["string"] = true,
    ["bool"] = true,
    ["num"] = true,
    ["color"] = true,
    ["sound"] = true,
}

-- Create Params
aphone.Params = aphone.Params or {}

function aphone:RegisterParameters(catName, paramName, short_name, var_type, defaultValue, onChange)
    if catName and paramName and var_type and acceptables_types[var_type] then
        table.Merge(aphone.Params, {
            [catName] = {
                [short_name] = {
                    var_type = var_type,
                    full_name = paramName,
                    def = defaultValue,
                    onChange = onChange
                }
            }
        })
    end
end

function aphone:ChangeParameters(catName, short_name, value, ignore)
    local p = aphone.Params[catName][short_name]
    aphone.Clientside.SaveSetting(catName .. "_" .. short_name, value)

    if p.onChange then
        aphone.Params[catName][short_name].onChange()
    end

    if !ignore then
        hook.Run("APhone_SettingChange", catName, short_name, value)
    end

    return value
end

function aphone:GetParameters(catName, shortName, fallback)
    return aphone.Clientside.GetSetting(catName .. "_" .. shortName, fallback)
end

-- Default/hard-coded params
aphone:RegisterParameters("Core", "2D", "2D", "bool", false, function()
    if IsValid(aphone.MainDerma) then
        gui.EnableScreenClicker(false)
        aphone.MainDerma:Remove()
    end
end)

aphone:RegisterParameters("Core", aphone.L("SilentMode"), "SilentMode", "bool", false)
aphone:RegisterParameters("Core", aphone.L("AutoLight"), "AutoLight", "bool", false)

if aphone.OthersHearRadio then
    aphone:RegisterParameters("Core", aphone.L("OnlyMyRadio"), "OnlyMyRadio", "bool", false)
end

aphone:RegisterParameters("Core", aphone.L("SettingFlashlight"), "Flashlight", "bool", false)

for k, v in ipairs(aphone.Ringtones) do
    aphone:RegisterParameters("Ringtones", v.name, "Ringstone_" .. k, "sound", false)
end
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_changeanims.lua:
-- I can't simulate keys, because it won't trigger the reload/secondary attack SWEP hooks, so I need this
function aphone.RequestAnim(id)
    if aphone.Horizontal and id == 2 then return end
    if !aphone.Horizontal and id == 1 then return end

    if !aphone:Is2D() and (aphone.Force_AllowHorizontal or (aphone.Running_App and aphone.Running_App.Open2D)) then
        net.Start("aphone_AskAnim")
        net.WriteUInt(id, 4)
        net.SendToServer()
        aphone.Horizontal = (id == 2)
        aphone.asking_changestate = true
    end
end
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_loadconfigapps.lua:
hook.Add("aphone_PostLoad", "APhone_LoadConfigLinks", function()
    for k, v in pairs(aphone.Links) do
        local APP = v
        APP.Complete_Detour = true

        function APP:Open()
            gui.OpenURL(self.link)
        end

        aphone.RegisterApp(APP)
    end
end)
--PATH addons/sl_aphone/lua/aphone/_libs/banks/sh_bluesatm.lua:
hook.Add("PostGamemodeLoaded", "Aphone_BluesATM", function()
    if BATM then
        if !CBLib then
            print("[APhone] Trying to load BATM without CBLib, reinstall BATM please")
            return
        end

        local Accounts = CBLib.LoadModule("batm/bm_accounts.lua", false)
        local p = FindMetaTable("Player")

        if aphone.Bank then
            print("[APhone] Do you got multiples bank addons ? The last loaded bank will be used for the bank app")
        end

        aphone.Bank = aphone.Bank or {}

        aphone.Bank.clr = Color(52, 152, 219)
        aphone.Bank.logo = Material("akulla/aphone/atm.png", "smooth 1")

        function p:aphone_bankWithdraw(amt)
            if amt < 0 then return end
            local ply = self

            Accounts.GetCachedPersonalAccount(self:SteamID64(), function(account)
                --Check if they have enough
                if account.balance - amt >= 0 then
                    account:AddBalance(-amt, "Withdrawal from account owner.")
                    aphone.Gamemode.AddMoney(ply, amt)
                    account:SaveAccount()
                    BATM.NetworkAccount(ply, account)
                end
            end)
        end

        function p:aphone_bankDeposit(amt)
            local ply = self
            if amt < 0 or aphone.Gamemode.GetMoney(ply) < amt then return end

            Accounts.GetCachedPersonalAccount(ply:SteamID64(), function(account)
                account:AddBalance(amt, "APhone")
                aphone.Gamemode.AddMoney(ply, -amt)

                account:SaveAccount()
                BATM.NetworkAccount(ply, account)
            end)
        end

        function p:aphone_bankTransfer(target, amt)
            if amt < 0 then return end

            local ply = self

            Accounts.GetCachedPersonalAccount(ply:SteamID64(), function(account)
                if account:GetBalance() - amt >= 0 then
                    Accounts.GetCachedPersonalAccount(target, function(targetAccount, didExist)
                        if !IsValid(ply) then return end --Dont do anything as that player has left now
                        if didExist and account:GetBalance() - amount >= 0 then
                            --Take money
                            account:AddBalance(-amount, "Transfer to '"..target.."'")
                            account:SaveAccount()

                            --Add money
                            targetAccount:AddBalance(amount, "Transfer from '"..ply:SteamID64().."'")
                            targetAccount:SaveAccount()	
    
                            --Update display
                            BATM.NetworkAccount(ply, account)

                            ply.batmtransfercooldown = CurTime() + 1.5

                            --If the player is online who he transfered to, then go ahead and network it to them too
                            if player.GetBySteamID64(target) ~= false then
                                BATM.NetworkAccount(player.GetBySteamID64(target) , targetAccount)
                            end
                        end
                    end)
                end
            end)
        end

        function p:aphone_getmoney()
            return BATM.GetPersonalAccount().balance
        end

        function aphone.Bank.FormatMoney(amt)
            return BATM.Lang["$"] .. CBLib.Helper.CommaFormatNumber(amt)
        end
    end
end)
--PATH addons/sl_aphone/lua/aphone/_libs/banks/sh_chatm.lua:
hook.Add("PostGamemodeLoaded", "Aphone_CHATM", function()
    if CH_ATM then
        local p = FindMetaTable("Player")

        if aphone.Bank then
            print("[APhone] Do you got multiples bank addons ? The last loaded bank will be used for the bank app")
        end

        aphone.Bank = aphone.Bank or {}

        aphone.Bank.clr = Color(140, 140, 140)
        aphone.Bank.logo = Material("akulla/aphone/atm.png", "smooth 1")
        aphone.Bank.name = "CH Bank"

        function p:aphone_bankDeposit(amt)
            if amt < 0 or CH_ATM.GetMoney( self ) - amt < 0 then return end
			
			if CH_ATM.GetAccountMaxMoney( self ) != 0 and tonumber( amt + CH_ATM.GetMoneyBankAccount( self ) ) > CH_ATM.GetAccountMaxMoney( self ) then return end
			
            CH_ATM.AddMoneyToBankAccount( self, amt )
            aphone.Gamemode.AddMoney(self, -amt)

            -- Log transaction (only works with SQL enabled)
            CH_ATM.LogSQLTransaction( self, "deposit", amt )
                
            -- bLogs support
            hook.Run( "CH_ATM_bLogs_DepositMoney", self, amt )
        end

        function p:aphone_bankWithdraw(amt)
            if amt < 0 or !aphone.Gamemode.Afford(self, amt) then return end
            aphone.Gamemode.AddMoney(self, amt)
            CH_ATM.TakeMoneyFromBankAccount( self, amt )

            -- Log transaction (only works with SQL enabled)
            CH_ATM.LogSQLTransaction( self, "withdraw", amt )

            -- bLogs support
            hook.Run( "CH_ATM_bLogs_WithdrawMoney", self, amt )
        end

        function p:aphone_bankTransfer(ply2, amt)
            if amt < 0 then return end
            local amtSelfBank = CH_ATM.GetMoney( self )

            if amt > amtSelfBank then return end
            
            CH_ATM.TakeMoneyFromBankAccount( self, amt )
            CH_ATM.AddMoneyToBankAccount( ply2, amt )

            -- Log transaction (only works with SQL enabled)
            CH_ATM.LogSQLTransaction( self, "transfer", amt )
                
            -- bLogs support
            hook.Run( "CH_ATM_bLogs_SendMoney", self, amt, ply2 )
        end

        function p:aphone_getmoney()
            return CH_ATM.GetMoneyBankAccount( self )
        end

        function aphone.Bank.FormatMoney(amt)
            return CH_ATM.FormatMoney(amt)
        end
    end
end)
--PATH addons/sl_aphone/lua/aphone/apps/bank/cl_main.lua:
local APP = {}

APP.name = aphone.L("Bank")
APP.icon = "akulla/aphone/app_bank.png"

local lua_grad = Material("akulla/aphone/lua_grad1.png")

function APP:ShowCondition()
	return tobool(aphone.Bank)
end

local functions_table = {
    [1] = {
        name = "Deposit",
        logo = "1",
        max_valuetype = true, // False = Bank amt, true = player amt
    },
    [2] = {
        name = "Withdraw",
        logo = "2",
    },
    [3] = {
        name = "Transfer",
        logo = "0",
        player_param = true,
        transfer = true,
    }
}

function APP:Open(main, main_x, main_y, screenmode)
	// consts
    if BATM and !BATM.GetPersonalAccount() then
        aphone.AddNotif("alert", aphone.L("BATM_Issue"), 5)
        aphone.App_Panel:Remove()
        return
    end

	local font_header = aphone:GetFont("Roboto40")
	local font_mediumheader = aphone:GetFont("MediumHeader")
	local font_svg = aphone:GetFont("SVG_40")
    local font_small = aphone:GetFont("Small")

	local clr_white180 = aphone:Color("Text_White180")
	local clr_white = aphone:Color("Text_White")
    local clr_bg = aphone:Color("Black2")
    local local_ply = LocalPlayer()
    local local_plyname = local_ply:Nick()
    local send_txt = aphone.L("Confirm")

    local boosted_clr = Color(math.Clamp(aphone.Bank.clr.r + 20, 0, 255), math.Clamp(aphone.Bank.clr.g + 20, 0, 255), math.Clamp(aphone.Bank.clr.b + 20, 0, 255))

    function main:Paint(w, h)
        surface.SetDrawColor(clr_bg)
        surface.DrawRect(0, 0, w, h)

        surface.SetMaterial(lua_grad)
        surface.SetDrawColor(aphone.Bank.clr)
        surface.DrawTexturedRectRotated(w / 2, h / 2, w, h, 180)

        draw.SimpleText(aphone.Bank.FormatMoney( local_ply:aphone_getmoney() ), font_mediumheader, w / 2, h * 0.93, clr_white180, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local logo = vgui.Create("DPanel", main)
    logo:Dock(TOP)
    logo:SetTall(main_x / 4)
    logo:DockMargin(0, main_y * 0.08, 0, main_y * 0.04)

    function logo:Paint(w, h)
        surface.SetDrawColor(color_white)
        surface.SetMaterial(aphone.Bank.logo)
        surface.DrawTexturedRect(w / 2 - h / 2, 0, h, h)
    end

    local welcome_txt = aphone.L("Hello")
    surface.SetFont(font_header)

    local txt_h = select(2, surface.GetTextSize(welcome_txt))

    local welcome_text = vgui.Create("DLabel", main)
    welcome_text:Dock(TOP)
    welcome_text:SetText(welcome_txt)
    welcome_text:SetFont(font_header)
    welcome_text:SetTall(txt_h)
    welcome_text:SetTextColor(clr_white)
    welcome_text:SetContentAlignment(5)

    local name_text = vgui.Create("DLabel", main)
    name_text:Dock(TOP)
    name_text:SetText(local_plyname)
    name_text:SetFont(font_header)
    name_text:SetTall(select(2, surface.GetTextSize(local_plyname)))
    name_text:SetContentAlignment(5)
    name_text:SetTextColor(clr_white180)

	main:Phone_DrawTop(main_x, main_y)

    local main_scroll = vgui.Create("DScrollPanel", main)
    main_scroll:Dock(FILL)
    main_scroll:aphone_PaintScroll()
    main_scroll:DockMargin(0, main_y * 0.025, 0, main_y * 0.025)

    for k, v in pairs(functions_table) do
        if aphone.bank_onlytransfer and !v.transfer then continue end

        local sub_pnl = main_scroll:Add("DPanel")
        sub_pnl:SetPaintBackground(false)
        sub_pnl:Dock(TOP)
        sub_pnl:SetTall(txt_h * 1.5)
        sub_pnl:DockMargin(0, main_y * 0.005, 0, main_y * 0.005)

        local sub_pnltop = vgui.Create("DButton", sub_pnl)
        sub_pnltop:Dock(TOP)
        sub_pnltop:SetTall(txt_h * 1.5)
        sub_pnltop:SetPaintBackground(false)
        sub_pnltop:TDLib()
        sub_pnltop:FadeHover(aphone.Bank.clr, 3)
        sub_pnltop:SetText("")
        sub_pnltop:SetIsToggle(true)

        function sub_pnltop:OnToggled(opening)
            if opening then
                sub_pnl:SetTall(txt_h * (v.player_param and 5 or 3))
            else
                sub_pnl:SetTall(txt_h * 1.5)
            end
        end

        local icon = vgui.Create("DLabel", sub_pnltop)
        icon:Dock(LEFT)
        icon:DockMargin(txt_h, 0, txt_h, 0)
        icon:SetWide(txt_h)
        icon:SetText(v.logo)
        icon:SetTextColor(color_white)
        icon:SetFont(font_svg)
        icon:SetContentAlignment(5)

        local title = vgui.Create("DLabel", sub_pnltop)
        title:Dock(FILL)
        title:SetText(v.name)
        title:SetTextColor(clr_white)
        title:SetFont(font_mediumheader)

        local sub_option = vgui.Create("DPanel", sub_pnl)
        sub_option:Dock(TOP)
        sub_option:SetTall(txt_h * (v.player_param and 3.5 or 1.5))
        sub_option:SetPaintBackground(false)

        local p = vgui.Create("DSlider", sub_option)
        p:Dock(TOP)
        p:SetSlideX(0)
        p:DockMargin(aphone.GUI.ScaledSize(main_x * 0.1, 0, main_x * 0.1, 0))

        function p:Paint(w, h)
            draw.RoundedBox(4, 0, h / 2-4, w, 8, clr_white180)
            draw.RoundedBox(4, 0, h / 2-4, w * self:GetSlideX(), 8, boosted_clr)
        end
        function p.Knob:Paint(w, h) end

        local textentry

        if v.player_param then
            textentry = vgui.Create("DLabel", sub_option)
            textentry:Dock(TOP)
            textentry:SetTall(txt_h)
            textentry:SetText(aphone.L("PutName"))
            textentry:SetFont(font_small)
            textentry:SetTextColor(clr_white)
            textentry:SetMouseInputEnabled(true)
            textentry:SetContentAlignment(5)
            textentry:DockMargin(main_x * 0.1, 0, main_x * 0.1, 0)

            local helperTextEntry = vgui.Create("DLabel", sub_option)
            helperTextEntry:Dock(TOP)
            helperTextEntry:SetFont(aphone:GetFont("Roboto18_500"))
            helperTextEntry:SetTextColor(clr_white180)
            helperTextEntry:SetText("")
            helperTextEntry:SetContentAlignment(5)
            helperTextEntry:DockMargin(main_x * 0.1, 0, main_x * 0.1, 0)
            helperTextEntry:SetTall(0)

            local helperTextH = select(2, helperTextEntry:GetContentSize())

            function textentry:textEnd(text_pnl)
                local p = self:textChange(text_pnl)

                if p then
                    self:SetText(p:Nick())
                    self.targetentity = p
                    return
                end

                for k, v in ipairs(player.GetHumans()) do
                    if v:Nick() == text_pnl then
                        self:SetText(text_pnl)
                        self.targetentity = v
                        return
                    end
                end

                self:SetText(aphone.L("PlayerNotFound"))
            end

            function textentry:DoClick()
                self:Phone_AskTextEntry(self:GetText(), 32)
            end

            function textentry:textChange(name)
                if(!name) then
                    helperTextEntry:SetText("")
                    helperTextEntry:SetTall(0)
                    return
                end

                local ply

                for a, b in ipairs(player.GetAll()) do
                    if string.StartWith(b:Nick(), name) then
                        ply = b
                        break
                    end
                end

                if ply then
                    helperTextEntry:SetText(ply:Nick() .. " ?")
                    helperTextEntry:SetTall(helperTextH)

                    return ply
                else
                    helperTextEntry:SetTall(0)
                end
            end
        end

        local p_amt = vgui.Create("DLabel", sub_option)
        p_amt:SetText(send_txt .. " - " .. aphone.Bank.FormatMoney(0))
        p_amt:SetFont(font_small)
        p_amt:SetTextColor(clr_white)
        p_amt:SetTall(txt_h)
        p_amt:Dock(TOP)
        p_amt:SetContentAlignment(5)
        p_amt:SetMouseInputEnabled(true)

        function p_amt:DoClick()
            if !textentry or IsValid(textentry.targetentity) then
                net.Start("aphone_bank")
                    net.WriteUInt(k, 4)
                    net.WriteUInt(math.Round(p:GetSlideX() * (v.max_valuetype and aphone.Gamemode.GetMoney(local_ply) or local_ply:aphone_getmoney()) ), 32)

                    if IsValid(textentry) then
                        net.WriteEntity(textentry.targetentity)
                    end
                net.SendToServer()
            end
        end

        function p:Think()
            self.lastrefresh = self.lastrefresh or CurTime()
            if self:IsEditing() or self.lastrefresh < CurTime() then
                local max_amt = v.max_valuetype and aphone.Gamemode.GetMoney(local_ply) or local_ply:aphone_getmoney()
                p_amt:SetText(send_txt .. " - " .. aphone.Bank.FormatMoney( math.Round(self:GetSlideX() * max_amt )))
                self.lastrefresh = CurTime() + 0.33
            end
        end
    end

	main:aphone_RemoveCursor()
end

aphone.RegisterApp(APP)
--PATH addons/sl_aphone/lua/aphone/apps/messages/cl_init.lua:
local APP = {}

APP.name = aphone.L("SMS")
APP.icon = "akulla/aphone/app_sms.png"
APP.Default = true

local clr_green = Color(46,139,87)
local clr_blue = Color(93,207,202)

function APP:Open(main, main_x, main_y, screenmode)
    local clr_white = aphone:Color("Text_White")
    local clr_black3 = aphone:Color("Black3")
    local clr_black1 = aphone:Color("Black1")
    local clr_white120 = aphone:Color("Text_White120")
    local font_bold = aphone:GetFont("Roboto45_700")
    local font_mediumheader = aphone:GetFont("MediumHeader")

    local tbl = {}

    function main:Paint(w, h)
        surface.SetDrawColor(clr_black3)
        surface.DrawRect(0,0,w,h)
    end

    surface.SetFont(font_bold)
    local _, title_y = surface.GetTextSize(aphone.L("Messages"))

    local local_player = LocalPlayer()
    local already_ids = {}
    local already_num = {}

    local title = vgui.Create("DLabel", main)
    title:Dock(TOP)
    title:DockMargin(main_x * 0.12, main_y * 0.05, 0, 0)
    title:SetTall(title_y)
    title:SetFont(font_bold)
    title:SetTextColor(clr_white)
    title:SetText(aphone.L("Messages"))

    local search_bg = vgui.Create("DPanel", main)
    search_bg:Dock(TOP)
    search_bg:DockMargin(main_x * 0.04, main_y * 0.025, main_x * 0.04, 0)
    search_bg:SetTall(main_y * 0.07)

    function search_bg:Paint(w, h)
        draw.RoundedBox(h / 2, 0, 0, w, h, clr_black1)
    end

    local search_icon = vgui.Create("DLabel", search_bg)
    search_icon:Dock(LEFT)
    search_icon:DockMargin(search_bg:GetTall() / 2, 0, 0, 0)
    search_icon:SetWide(search_bg:GetTall())
    search_icon:SetFont(aphone:GetFont("SVG_30"))
    search_icon:SetText("g")
    search_icon:SetTextColor(clr_white120)

    local search_entry = vgui.Create("DLabel", search_bg)
    search_entry:Dock(FILL)
    search_entry:DockMargin(0, 0, search_bg:GetTall() / 2, 0)
    search_entry:SetFont(font_mediumheader)
    search_entry:SetText(aphone.L("Search"))
    search_entry:SetMouseInputEnabled(true)
    search_entry:Phone_AlphaHover()

    function search_entry:DoClick()
        self:Phone_AskTextEntry(aphone.L("Search") != self:GetText() and self:GetText() or "", 32)
    end

    function search_entry:textChange(txt)
        txt = string.lower(txt or "")

        for k, v in pairs(tbl) do
            if !string.StartWith(k, txt) and !v.on_closeanim then
                // Reset it
                v:SetAnimationEnabled(false)
                v:SetAnimationEnabled(true)

                v:AlphaTo(0, 0.25, 0)
                v:SizeTo(-1, 0, 0.25, 0, 0.5)
                v.on_closeanim = true
            elseif string.StartWith(k, txt) then
                // Reset it
                if v.on_closeanim then
                    v:SetAnimationEnabled(false)
                    v:SetAnimationEnabled(true)
                end

                v:SizeTo(-1, main_y * 0.12, 0.25, 0, 0.5)
                v:AlphaTo(255, 0.25, 0)
                v.on_closeanim = false
            end
        end
    end

    local dial = vgui.Create("DLabel", main)
    dial:Dock(BOTTOM)
    dial:DockMargin(0, 0, 0, main_y*0.05)
    dial:SetFont(aphone:GetFont("SVG_40"))
    dial:SetText("5")
    dial:SetContentAlignment(5)
    dial:SetAutoStretchVertical(true)
    dial:SetMouseInputEnabled(true)
    dial:Phone_AlphaHover()

    function dial:DoClick()
        local number = 0

        local dial_bigpanel = vgui.Create("DButton", main)
        dial_bigpanel:SetSize(main_x, main_y)
        dial_bigpanel:SetPaintBackground(false)
        dial_bigpanel:SetText("")
        dial_bigpanel.open = CurTime()

        local dial_keys = vgui.Create("DPanel", dial_bigpanel)
        dial_keys:SetPos(0, main_y)
        dial_keys:SetSize(main_x, main_y*0.55)
        dial_keys:MoveTo(0, main_y - dial_keys:GetTall(), 0.5, 0, 0.2)

        function dial_bigpanel:DoClick()
            dial_bigpanel.closing = CurTime()
            dial_keys:MoveTo(0, main_y, 0.5, 0, 0.2, function()
                dial_bigpanel:Remove()
            end)
        end

        function dial_bigpanel:Paint(w, h)
            local ratio = !dial_bigpanel.closing and (CurTime() - dial_bigpanel.open)*3 or 1 - (CurTime() - dial_bigpanel.closing)*3

            if ratio > 1 then
                ratio = 1
            elseif ratio < 0 then
                ratio = 0
            end

            surface.SetDrawColor(0, 0, 0, 230 * ratio)
            surface.DrawRect(0, 0, w, h)
        end

        function dial_keys:Paint(w, h)
            draw.RoundedBoxEx(32, 0, 0, w, h, clr_blue, true, true, false, false)
            draw.RoundedBoxEx(32, 0, 10, w, h, clr_black1, true, true, false, false)
        end

        surface.SetFont(font_bold)

        local dial_number = vgui.Create("DLabel", dial_keys)
        dial_number:Dock(TOP)
        dial_number:SetText(aphone.FormatNumber("0"))
        dial_number:SetFont(font_bold)
        dial_number:SetContentAlignment(5)
        dial_number:DockMargin(0, main_y*0.03, 0, 0)
        dial_number:SetTextColor(clr_blue)
        dial_number:SetTall(select(2, surface.GetTextSize(aphone.FormatNumber("0"))))

        local lang_unknown = aphone.L("PlayerNotFound")

        local dial_name = vgui.Create("DLabel", dial_keys)
        dial_name:Dock(TOP)
        dial_name:SetText(lang_unknown)
        dial_name:SetFont(aphone:GetFont("Little_NoWeight"))
        dial_name:SetContentAlignment(5)
        dial_name:SetTextColor(clr_white120)
        dial_name:DockMargin(0, 0, 0, main_y*0.02)

        surface.SetFont(dial_name:GetFont())
        dial_name:SetTall(select(2, surface.GetTextSize(dial_name:GetText())))

        local dial_DIconLayout = vgui.Create("DIconLayout", dial_keys)
        dial_DIconLayout:Dock(TOP)
        dial_DIconLayout:DockMargin(main_x*0.2, 0, main_x*0.2, 0)
        dial_DIconLayout:SetTall(main_y*0.25)

        local button_call = vgui.Create("DLabel", dial_keys)
        button_call:Dock(FILL)
        button_call:SetText("o")
        button_call:SetFont(dial:GetFont())
        button_call:SetContentAlignment(5)
        button_call:Phone_AlphaHover()
        button_call:SetVisible(false)
        button_call:SetMouseInputEnabled(true)

        function button_call:DoClick()
            if !IsValid(already_num[dial_number:GetText()]) then return end

            net.Start("aphone_Phone")
                net.WriteUInt(1, 4)
                net.WriteEntity(already_num[dial_number:GetText()])
            net.SendToServer()

            dial_bigpanel:DoClick()
        end

        local roboto40 = aphone:GetFont("Roboto40")
        local pnl_0

        for i=9, 0, -1 do
            local ratio = (i != 0 and 3 or 1)

            local num = vgui.Create("DButton", dial_DIconLayout)
            num:SetSize(main_x*0.6 / ratio, main_y*0.25 / 3)
            num:SetText(i)
            num:SetPaintBackground(false)
            num:SetFont(roboto40)
            num:Phone_AlphaHover()

            function num:DoClick()
                local tempnumber = tonumber(tostring(number) .. i)

                if string.len(tempnumber) > aphone.digitscount then return end
                number = tempnumber
                dial_number:SetText(aphone.FormatNumber(tempnumber))

                if already_num[dial_number:GetText()] then
                    dial_name:SetText(aphone.GetName(already_num[dial_number:GetText()]))
                    button_call:SetVisible(true)
                else
                    dial_name:SetText(lang_unknown)
                    button_call:SetVisible(false)
                end
            end

            if i == 0 then pnl_0 = num end
        end

        local remove = vgui.Create("DButton", pnl_0)
        remove:SetSize(main_x*0.2, main_y*0.25 / 3)
        remove:SetText("<")
        remove:SetPaintBackground(false)
        remove:SetFont(roboto40)
        remove:Phone_AlphaHover()
        remove:Dock(RIGHT)

        function remove:DoClick()
            if tonumber(number) == 0 then return end
            local formatted = string.sub(tostring(number), 1, -2)
            formatted = (formatted != "" and formatted or "0")

            number = tonumber(formatted)
            dial_number:SetText(aphone.FormatNumber(formatted))

            if already_num[dial_number:GetText()] then
                dial_name:SetText(aphone.GetName(already_num[dial_number:GetText()]))
                button_call:SetVisible(true)
            else
                dial_name:SetText(lang_unknown)
                button_call:SetVisible(false)
            end
        end

        dial_bigpanel:aphone_RemoveCursor()
    end

    local player_list = vgui.Create("DScrollPanel", main)
    player_list:Dock(FILL)
    player_list:DockMargin(0, main_y * 0.02, 0, 0)
    player_list:aphone_PaintScroll()

    local title_available = player_list:Add("DLabel")
    title_available:Dock(TOP)
    title_available:DockMargin(main_x * 0.09, 0, 0, 0)
    title_available:SetTall(title_y)
    title_available:SetFont(aphone:GetFont("Little"))
    title_available:SetTextColor(clr_white120)
    title_available:SetText(aphone.L("Available"))

    main:aphone_RemoveCursor()

    function player_list:Phone_GeneratePanel(ply, disconnected)
        if !ply then return end

        local connected = ply and isentity(ply) and ply:IsPlayer()
        local id = connected and ply:aphone_GetID() or ply

        // Get last message, for date + text display
        local infos = sql.Query("SELECT * FROM aphone_Messages WHERE user = " .. id .. " AND ip = '" .. game.GetIPAddress() .. "' ORDER BY timestamp DESC LIMIT 1")
        local name = aphone.GetName(ply)

        infos = infos and infos[1]

        local player_main = vgui.Create("DButton", self)
        player_main:Dock(TOP)
        player_main:SetTall(main_y * 0.12)
        player_main:SetPaintBackground(false)
        player_main:TDLib()
        player_main:SetText("")
        player_main:FadeHover(clr_green)

        local player_subpanel = vgui.Create("DPanel", player_main)
        player_subpanel:Dock(TOP)
        player_subpanel:DockMargin(main_x * 0.04, main_y * 0.02, main_x * 0.04, main_y * 0.02)
        player_subpanel:SetTall(main_y * 0.08)
        player_subpanel:SetPaintBackground(false)
        player_subpanel:SetMouseInputEnabled(false)

        tbl[string.lower(aphone.GetName(ply))] = player_main

        function player_main:DoClick()
            local msg_pnl = vgui.Create("aphone_Msg", main)
            msg_pnl:InitPly(ply)
        end

        if !disconnected then
            local player_outlineavatar = vgui.Create("DPanel", player_subpanel)
            player_outlineavatar:Dock(LEFT)
            player_outlineavatar:SetWide(player_subpanel:GetTall())
            player_outlineavatar:SetMouseInputEnabled(false)
            player_outlineavatar:SetPaintBackground(false)
            player_outlineavatar:DockMargin(main_x * 0.05, 0, 0, 0)

            local s_c = aphone.GUI.ScaledSize(8)

            local player_avatar = vgui.Create("aphone_CircleAvatar", player_outlineavatar)
            player_avatar:Dock(FILL)
            player_avatar:DockMargin(s_c, s_c, s_c, s_c)
            player_avatar:SetPlayer(ply, 184)
        end

        local player_text = vgui.Create("DPanel", player_subpanel)
        player_text:Dock(FILL)
        player_text:DockMargin(main_x * 0.05, 0, 0, 0)
        player_text:SetPaintBackground(false)
        player_text:SetMouseInputEnabled(false)

        local time = aphone.FormatTimeStamp(infos and infos.timestamp or 0)

        surface.SetFont(font_mediumheader)
        local text_x, text_y = surface.GetTextSize(time)

        local player_toptext = vgui.Create("DPanel", player_text)
        player_toptext:Dock(TOP)
        player_toptext:SetTall(text_y)
        player_toptext:SetPaintBackground(false)
        player_toptext:SetMouseInputEnabled(false)

        local player_textdate = vgui.Create("DLabel", player_toptext)
        player_textdate:Dock(RIGHT)
        player_textdate:SetWide(text_x)
        player_textdate:SetFont(font_mediumheader)
        player_textdate:SetText(time)
        player_textdate:SetTextColor(aphone:Color("Text_White180"))
        player_textdate:SetMouseInputEnabled(false)

        local player_textname = vgui.Create("DLabel", player_toptext)
        player_textname:Dock(FILL)
        player_textname:DockMargin(0, 0, 5, 0)
        player_textname:SetFont(font_mediumheader)
        player_textname:SetTextColor(aphone:Color("Text_White"))
        player_textname:SetText(aphone.GetName(ply))
        player_textname:SetMouseInputEnabled(false)

        if infos and infos.body then
            local player_lastmsg = vgui.Create("DLabel", player_text)
            player_lastmsg:Dock(FILL)
            player_lastmsg:DockMargin(0, 5, 0, 0)
            player_lastmsg:SetFont(font_mediumheader)
            player_lastmsg:SetText(infos.body)
            player_lastmsg:SetTextColor(aphone:Color("Text_White180"))
            player_lastmsg:SetMouseInputEnabled(false)
        end
    end

    // Create Special Numbers ( aka compatibilities with sh_compatibilities.lua )
    for k, v in pairs(aphone.SpecialNumbers) do
        if v.showcondition and !v.showcondition() then continue end

        local spenum = vgui.Create("DButton", player_list)
        spenum:Dock(TOP)
        spenum:SetTall(main_y * 0.12)
        spenum:SetPaintBackground(false)
        spenum:SetText("")
        spenum:TDLib()
        spenum:FadeHover(v.clr or clr_green)

        function spenum:DoClick()
            v.func()
        end

        local spenum_sub = vgui.Create("DPanel", spenum)
        spenum_sub:Dock(TOP)
        spenum_sub:DockMargin(main_x * 0.09, main_y * 0.02, main_x * 0.04, main_y * 0.02)
        spenum_sub:SetTall(main_y * 0.08)
        spenum_sub:SetPaintBackground(false)
        spenum_sub:SetMouseInputEnabled(false)

        local player_outlineavatar = vgui.Create("DPanel", spenum_sub)
        player_outlineavatar:Dock(LEFT)
        player_outlineavatar:SetWide(spenum_sub:GetTall() - aphone.GUI.ScaledSizeX(16))
        player_outlineavatar:SetMouseInputEnabled(false)
        player_outlineavatar:DockMargin(aphone.GUI.ScaledSize(8, 8, 8, 8))

        function player_outlineavatar:Paint(w, h)
            surface.SetDrawColor(color_white)
            surface.SetMaterial(v.icon)
            surface.DrawTexturedRect(0, 0, w, h)
        end

        local player_text = vgui.Create("DButton", spenum_sub)
        player_text:Dock(FILL)
        player_text:SetText("")
        player_text:DockMargin(main_x * 0.05, 0, 0, 0)
        player_text:SetPaintBackground(false)
        player_text:SetMouseInputEnabled(false)
        player_text:TDLib()

        player_text:DualText(
            v.name,
            font_mediumheader,
            color_white,

            v.desc or "",
            font_mediumheader,
            clr_white120,
            TEXT_ALIGN_LEFT
        )
    end

    for k, v in ipairs(player.GetHumans()) do
        local id = v:aphone_GetID()

        if local_player == v or (aphone.disable_showingUnknownPlayers and !aphone.Contacts.GetName(id)) then continue end
        already_ids[id] = v
        player_list:Phone_GeneratePanel(v)
    end

    for k, v in ipairs(player.GetHumans()) do
        if local_player == v or !v:aphone_GetNumber() then continue end
        already_num[v:aphone_GetNumber()] = v
    end

    local title_onlymessages = vgui.Create("DLabel", player_list)
    title_onlymessages:Dock(TOP)
    title_onlymessages:DockMargin(main_x * 0.09, 0, 0, 0)
    title_onlymessages:SetTall(title_y)
    title_onlymessages:SetFont(aphone:GetFont("Little"))
    title_onlymessages:SetTextColor(clr_white120)
    title_onlymessages:SetText(aphone.L("Not_Available"))

    for k, v in pairs(aphone.Contacts.GetContacts()) do
        if !already_ids[k] then
            player_list:Phone_GeneratePanel(k, true)
        end
    end

    main:aphone_RemoveCursor()
end

function APP:OnClose()
    aphone.InsertNewMessage = nil
end

aphone.RegisterApp(APP)
--PATH addons/sh_reports/lua/reports/language/french.lua:
SH_REPORTS.Language = {
	reports = "Signalement",
	your_reports = "Vos signalements",
	report_list = "Liste de signalements",
	reporter = "Signaler",
	reported_player = "Joueur signalé(e)",
	reason = "Raison",
	waiting_time = "Temps d'attente",
	claimed = "Accepté ?",
	unclaimed = "Non accepté",

	new_report = "Signaler un joueur",
	player_to_report = "Joueur à signaler",
	comment = "Commentaire",
	submit_report = "Envoyer signalement",

	view_report = "Voir signalement",
	actions = "Actions",
	goto = "Aller à",
	bring = "Ramener",
	bring_reported_player = "Ramener le joueur signalé ?",
	yes = "Oui",
	no = "Non",
	claim_report = "Accepter le signalement",
	close_report = "Fermer le signalement",
	view = "Voir",
	start_sit_session = "Commencer une session isolée",
	report_of_x = "Signalement de %s",
	claimed_by_x = "Accepté par %s",
	other = "Autre",
	none = "Aucun",

	performance_reports = "Rapports de performance",
	displaying_perf_report_from_x_to_y = "Affichage des rapports de performance de %s à %s.", -- 76561199385207498 
	admin = "Admin",
	num_claimed = "Acceptés",
	num_closed = "Fermés",
	time_spent = "Temps passé",
	rating = "Note",
	rate_question = "Comment noteriez-vous la performance de %s ?",
	rate_thanks = "Merci pour votre note !",
	rate_notification = "%s vous a donné une note de %s.",
	history = "Historique",

	not_allowed_to_run_cmd = "Vous n'êtes pas autorisé à exécuter cette commande.",
	report_submitted = "Signalement soumis. Veuillez attendre la réponse d'un admin.",
	report_limit_reached = "Vous avez atteint la limite de signalements soumis !",
	report_received = "Nouveau signalement de %s contre %s : %s",
	report_claimed = "Signalement accepté !",
	admin_claimed_your_report = "Un admin a accepté votre signalement !",
	admin_has_disconnected = "L'admin en charge de votre signalement s'est déconnecté.",
	report_closed = "Signalement fermé.",
	your_report_was_closed = "Votre signalement a été fermé par un admin.",
	reporter_closed_report = "Le signaleur a fermé son signalement.",
	report_already_claimed = "Ce signalement a déjà été accepté.",
	report_non_existent = "Ce signalement n'existe pas.",
	player_has_no_reports = "La cible n'a pas de signalements actifs.",
	cannot_report_self = "Vous ne pouvez pas signaler vous-même.",
	cannot_report_admin = "Vous ne pouvez pas signaler un admin.",
	cannot_report_as_admin = "Vous êtes un admin ; vous ne pouvez pas signaler de joueurs !",
	claimed_report_still_active = "Vous avez déjà un rapport d'accepté ; finissez-le d'abord !",
	select_reason_first = "Choisissez la raison de votre signalement.",
	select_player_first = "Choisissez le joueur à signaler.",
	there_are_x_reports_pending = "Il y a %d signalements en attente.",
}
--PATH addons/sh_reports/lua/reports/cl_menu_performance.lua:
local function L(...) return SH_REPORTS:L(...) end

local matBack = Material("shenesis/general/back.png")

function SH_REPORTS:ShowPerformanceReports()
	if (IsValid(_SH_REPORTS_PERF)) then
		_SH_REPORTS_PERF:Remove()
	end

	local styl = self.Style
	local th, m = self:GetPadding(), self:GetMargin()
	local m2 = m * 0.5
	local ss = self:GetScreenScale()

	local delay = 0
	if (self.ServerTime) then
		delay = self.ServerTime - os.time()
	end

	local curprep

	local frame = self:MakeWindow(L"performance_reports")
	frame:SetSize(800 * ss, 600 * ss)
	frame:Center()
	frame:MakePopup()
	_SH_REPORTS_PERF = frame

		frame:AddHeaderButton(matBack, function()
			frame:Close()
			self:ShowReports()
		end)

		local sel = vgui.Create("DScrollPanel", frame)
		sel:SetDrawBackground(false)
		sel:SetWide(140 * ss)
		sel:Dock(LEFT)
		sel.Paint = function(me, w, h)
			draw.RoundedBoxEx(4, 0, 0, w, h, styl.inbg, false, false, true, false)
		end
		self:PaintScroll(sel)

		local ilist_perf = vgui.Create("DListView", frame)
		ilist_perf:SetVisible(false)
		ilist_perf:SetSortable(false)
		ilist_perf:SetDrawBackground(false)
		ilist_perf:SetDataHeight(32)
		ilist_perf:Dock(FILL)
		ilist_perf:AddColumn(L"admin")
		ilist_perf:AddColumn(L"num_claimed")
		ilist_perf:AddColumn(L"num_closed")
		ilist_perf:AddColumn(L"time_spent")
		self:PaintList(ilist_perf)

		local ilist_rating = vgui.Create("DListView", frame)
		ilist_rating:SetVisible(false)
		ilist_rating:SetSortable(false)
		ilist_rating:SetDrawBackground(false)
		ilist_rating:SetDataHeight(32)
		ilist_rating:Dock(FILL)
		ilist_rating:AddColumn(L"admin")
		ilist_rating:AddColumn(L"rating")
		self:PaintList(ilist_rating)

		local ilist_history = vgui.Create("DListView", frame)
		ilist_history:SetVisible(false)
		ilist_history:SetSortable(false)
		ilist_history:SetDrawBackground(false)
		ilist_history:SetDataHeight(32)
		ilist_history:Dock(FILL)
		ilist_history:AddColumn(L"reporter")
		ilist_history:AddColumn(L"reported_player")
		ilist_history:AddColumn(L"reason")
		ilist_history:AddColumn(L"admin")
		ilist_history:AddColumn(L"rating")
		-- ilist_history.Think = function(me)
			-- local hover = vgui.GetHoveredPanel()
			-- if (!IsValid(_SH_REPORTS_HIST_DETAILS)) then
				-- if (!IsValid(hover) or !hover.m_HistoryReport) then
					-- return end
				
				-- _SH_REPORTS_HIST_DETAILS = NULL
			-- else
			
			-- end
		-- end
		self:PaintList(ilist_history)

		frame.ShowStaff = function(me, staffs)
			if (!ilist_perf:IsVisible()) then
				return end

			local i = 0
			for _, info in pairs (staffs) do
				local user = vgui.Create("DPanel", frame)
				user:SetDrawBackground(false)

					local avi = self:Avatar(info.steamid, 24, user)
					avi:SetPos(4, 4)

					local name = self:QuickLabel("...", "{prefix}Medium", styl.text, user)
					name:Dock(FILL)
					name:SetTextInset(ilist_perf:GetDataHeight(), 0)

					self:GetName(info.steamid, function(nick)
						if (IsValid(name)) then
							name:SetText(nick)
						end
					end)

				local line = ilist_perf:AddLine(user, info.claimed, info.closed, self:FullFormatTime(info.timespent))
				line:SetAlpha(0)
				line:AlphaTo(255, 0.1, 0.1 * i)
				self:LineStyle(line)

				i = i + 1
			end
		end

		frame.ShowRatings = function(me, ratings)
			if (!ilist_rating:IsVisible()) then
				return end

			ilist_rating:Clear()

			local i = 0
			for _, info in pairs (ratings) do
				if (info.num == 0) then
					continue end

				local frac = info.total / info.num / 5
				local tot = string.Comma(info.num)
				local tx = " " .. math.Round(frac * 100) .. "% (" .. tot .. ")"

				local user = vgui.Create("DPanel", frame)
				user:SetDrawBackground(false)

					local avi = self:Avatar(info.steamid, 24, user)
					avi:SetPos(4, 4)

					local name = self:QuickLabel("...", "{prefix}Medium", styl.text, user)
					name:Dock(FILL)
					name:SetTextInset(ilist_rating:GetDataHeight(), 0)

					self:GetName(info.steamid, function(nick)
						if (IsValid(name)) then
							name:SetText(nick)
						end
					end)

				local stars = vgui.Create("DPanel", frame)
				stars.Paint = function(me, w, h)
					local _x, _y = me:LocalToScreen(0, 0)

					surface.SetFont("SH_REPORTS.Large")
					local wi = surface.GetTextSize("★★★★★")

					surface.SetFont("SH_REPORTS.Medium")
					local wi2 = surface.GetTextSize(tx)

					local wid = wi + wi2

					draw.SimpleText("★★★★★", "SH_REPORTS.Large", w * 0.5 - wid * 0.5, h * 0.5, styl.inbg, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					render.SetScissorRect(_x, _y, _x + w * 0.5 - wid * 0.5 + wi * frac, _y + h, true)
						draw.SimpleText("★★★★★", "SH_REPORTS.Large", w * 0.5 - wid * 0.5, h * 0.5, styl.rating, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					render.SetScissorRect(0, 0, 0, 0, false)

					draw.SimpleText(tx, "SH_REPORTS.Medium", w * 0.5 - wid * 0.5 + wi, h * 0.5, styl.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				end

				local line = ilist_rating:AddLine(user, stars)
				line:SetAlpha(0)
				line:AlphaTo(255, 0.1, 0.1 * i)
				self:LineStyle(line)

				i = i + 1
			end
		end

		frame.ShowHistory = function(me, history)
			if (!ilist_history:IsVisible()) then
				return end

			ilist_history:Clear()

			local i = 0
			for _, info in pairs (history) do
				local reporter = vgui.Create("DPanel", frame)
				reporter:SetDrawBackground(false)

					local avi = self:Avatar(info.reporter, 24, reporter)
					avi:SetPos(4, 4)

					local name = self:QuickLabel("...", "{prefix}Medium", styl.text, reporter)
					name:Dock(FILL)
					name:SetTextInset(ilist_history:GetDataHeight(), 0)

					self:GetName(info.reporter, function(nick)
						if (IsValid(name)) then
							name:SetText(nick)
						end
					end)

				local reported = vgui.Create("DPanel", frame)
				reported:SetDrawBackground(false)

					local avi = self:Avatar(info.reported, 24, reported)
					avi:SetPos(4, 4)

					local name = self:QuickLabel("...", "{prefix}Medium", styl.text, reported)
					name:Dock(FILL)
					name:SetTextInset(ilist_history:GetDataHeight(), 0)

					if (info.reported == "0") then
						avi:SetVisible(false)
						name:SetText("[" .. L"other" .. "]")
						name:SetTextInset(0, 0)
						name:SetContentAlignment(5)
					else
						self:GetName(info.reported, function(nick)
							if (IsValid(name)) then
								name:SetText(nick)
							end
						end)
					end

				local admin = vgui.Create("DPanel", frame)
				admin:SetDrawBackground(false)

					local avi = self:Avatar(info.admin, 24, admin)
					avi:SetPos(4, 4)

					local name = self:QuickLabel("...", "{prefix}Medium", styl.text, admin)
					name:Dock(FILL)
					name:SetTextInset(ilist_history:GetDataHeight(), 0)

					self:GetName(info.admin, function(nick)
						if (IsValid(name)) then
							name:SetText(nick)
						end
					end)

				local rating
				if (info.rating > 0) then
					local frac = info.rating / 5

					rating = vgui.Create("DPanel", frame)
					rating.Paint = function(me, w, h)
						local _x, _y = me:LocalToScreen(0, 0)

						surface.SetFont("SH_REPORTS.Large")
						local wi = surface.GetTextSize("★★★★★")
						local wid = wi

						draw.SimpleText("★★★★★", "SH_REPORTS.Large", w * 0.5 - wid * 0.5, h * 0.5, styl.inbg, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						render.SetScissorRect(_x, _y, _x + w * 0.5 - wid * 0.5 + wi * frac, _y + h, true)
							draw.SimpleText("★★★★★", "SH_REPORTS.Large", w * 0.5 - wid * 0.5, h * 0.5, styl.rating, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						render.SetScissorRect(0, 0, 0, 0, false)
					end
				end

				local line = ilist_history:AddLine(reporter, reported, info.reason, admin, info.rating > 0 and rating or L"none")
				line:SetAlpha(0)
				line:AlphaTo(255, 0.1, 0.1 * i)
				line:SetToolTip(os.date(self.TimeFormat, info.date) .. "\n\n" .. L"waiting_time" .. ": " .. self:FullFormatTime(info.waiting_time) .. "\n\n" .. L"comment" .. ":\n" .. info.comment)
				self:LineStyle(line)
				
				// HAAAAAAAAACKS
				-- line.m_HistoryReport = info
				
				-- local function RecFix(s)
					-- for _, v in pairs (s:GetChildren()) do
						-- v.m_HistoryReport = info
						-- v.m_HistoryLine = line
						
						-- RecFix(v)
					-- end
				-- end
				
				-- RecFix(line)

				i = i + 1
			end
		end

		local function display_perf(start, prep)
			if (curprep == start) then
				return end

			curprep = start
			frame.m_iID = prep.id

			ilist_perf:Clear()
			ilist_perf:SetVisible(true)
			ilist_rating:SetVisible(false)
			ilist_history:SetVisible(false)

			local ds, de = os.date(self.DateFormat, start), os.date(self.DateFormat, prep.end_time)

			frame.m_Title:SetText(L"performance_reports" .. /* 76561199385207507 */ " (" .. ds .. " - " .. de .. ")")
			frame.m_Title:SizeToContentsX()

			if (prep.staff) then
				frame:ShowStaff(prep.staff)
			else
				easynet.SendToServer("SH_REPORTS.RequestPerfReportStaff", {id = prep.id})
			end

			self:Notify(L("displaying_perf_report_from_x_to_y", ds, de), 5, styl.success, frame)
		end

		local btn_ratings = self:QuickButton(L"rating", function()
			ilist_perf:SetVisible(false)
			ilist_history:SetVisible(false)
			ilist_rating:SetVisible(true)
			ilist_rating:Clear()

			frame.m_Title:SetText(L"performance_reports")
			frame.m_Title:SizeToContentsX()

			easynet.SendToServer("SH_REPORTS.RequestStaffRatings")
		end, sel)
		btn_ratings:SetContentAlignment(4)
		btn_ratings:SetTextInset(m + 2, 0)
		btn_ratings:Dock(TOP)
		btn_ratings:SetTall(32 * ss)
		btn_ratings.m_iRound = 0
		btn_ratings.PaintOver = function(me, w, h)
			if (ilist_rating:IsVisible()) then
				surface.SetDrawColor(styl.header)
				surface.DrawRect(0, 0, 4, h)
			end
		end

		local btn_history = self:QuickButton(L"history", function()
			ilist_perf:SetVisible(false)
			ilist_rating:SetVisible(false)
			ilist_history:SetVisible(true)
			ilist_history:Clear()

			frame.m_Title:SetText(L"performance_reports")
			frame.m_Title:SizeToContentsX()

			easynet.SendToServer("SH_REPORTS.RequestReportHistory")
		end, sel)
		btn_history:SetContentAlignment(4)
		btn_history:SetTextInset(m + 2, 0)
		btn_history:Dock(TOP)
		btn_history:SetTall(32 * ss)
		btn_history.m_iRound = 0
		btn_history.PaintOver = function(me, w, h)
			if (ilist_history:IsVisible()) then
				surface.SetDrawColor(styl.header)
				surface.DrawRect(0, 0, 4, h)
			end
		end

		for _, prep in SortedPairs (self.CachedPerfReports, true) do
			local btn = self:QuickButton(os.date(self.DateFormat, prep.start_time), function()
				display_perf(prep.start_time, prep)
			end, sel, nil, prep.end_time >= (os.time() + delay) and styl.success or styl.text)
			btn:SetContentAlignment(4)
			btn:SetTextInset(m + 2, 0)
			btn:Dock(TOP)
			btn:SetTall(32 * ss)
			btn.m_iRound = 0
			btn.PaintOver = function(me, w, h)
				if (curprep == prep.start_time and ilist_perf:IsVisible()) then
					surface.SetDrawColor(styl.header)
					surface.DrawRect(0, 0, 4, h)
				end
			end
		end

	frame:SetAlpha(0)
	frame:AlphaTo(255, 0.1)
end

easynet.Callback("SH_REPORTS.SendPerfReports", function(data)
	SH_REPORTS.CachedPerfReports = data.struct_perf_reports
	SH_REPORTS:ShowPerformanceReports()
end)

easynet.Callback("SH_REPORTS.SendPerfReportStaff", function(data)
	if (!IsValid(_SH_REPORTS_PERF) or _SH_REPORTS_PERF.m_iID ~= data.id) then
		return end

	_SH_REPORTS_PERF:ShowStaff(data.struct_perf_reports_staff)
end)

easynet.Callback("SH_REPORTS.SendRatings", function(data)
	if (!IsValid(_SH_REPORTS_PERF)) then
		return end

	_SH_REPORTS_PERF:ShowRatings(data.struct_rating)
end)

easynet.Callback("SH_REPORTS.SendHistoryList", function(data)
	if (!IsValid(_SH_REPORTS_PERF)) then
		return end

	local steamids = data.struct_history_steamids
	for _, dat in pairs (data.struct_history_list) do
		dat.reporter = steamids[dat.reporter_nid].steamid
		dat.reported = steamids[dat.reported_nid].steamid
		dat.admin = steamids[dat.admin_nid].steamid

		dat.reporter_nid = nil
		dat.reported_nid = nil
		dat.admin_nid = nil
	end

	_SH_REPORTS_PERF:ShowHistory(data.struct_history_list)
end)
--PATH addons/cb-lib/lua/autorun/cb-lib.lua:
if _G.CBLib ~= nil then return _G.CBLib end --Prevent Lua refresh.

local CBLib = {}

--[[-------------------------------------------------------------------------
Helper functions
---------------------------------------------------------------------------]]
CBLib.Helper = {}

--Formats a number as a string with commas inserted
function CBLib.Helper.CommaFormatNumber(amount)
	local formatted = amount
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end 
	return formatted
end

--Credit to facepunch (Didnt see guys name)
--Retursn the text in a table for, an index for each new line
function CBLib.Helper.WrapText(Str,font,width)
	if( font ) then  --Dr Magnusson's much less prone to failure and more optimized version
         surface.SetFont( font )  
     end  
       
     local tbl, len, Start, End = {}, string.len( Str ), 1, 1  
       
     while ( End < len ) do  
         End = End + 1  
         if ( surface.GetTextSize( string.sub( Str, Start, End ) ) > width ) then  
             local n = string.sub( Str, End, End )  
             local I = 0  
             for i = 1, 15 do  
                 I = i  
                 if( n != " " and n != "," and n != "." and n != "\n" ) then  
                     End = End - 1  
                     n = string.sub( Str, End, End )  
                 else  
                     break  
                 end  
             end  
             if( I == 15 ) then  
                 End = End + 14  
             end  
               
             local FnlStr = string.Trim( string.sub( Str, Start, End ) )  
             table.insert( tbl, FnlStr )  
             Start = End + 1  
         end                   
     end  
     table.insert( tbl, string.sub( Str, Start, End ) )  
     return tbl 
end



-----------------------------
--		   MODULES 	       --
-----------------------------

--Modules are basicly instances of a table. This handles loading and destroying modules.
--Or anouther way to look at it is like a static class in an oop language.

--A module can also contain three event functions, OnLoaded, OnUnloaded, and OnReloaded

--A Table for all modules loaded.
CBLib.Modules = {}

--loads a module script and stores a reference, if a module is loaded of the same name then 
--the function will instead return the already loaded module to prevent reloading of them.
--Unless you pass true for reload the module will not be reloaded but instead return the current instance.
--Subfolder is a folder you know its located in, even if its in anouther folder. For example store you modules in lua/codebluemodules then supply lua/codebluemodules as the subfolder
function CBLib.LoadModule(modulePath, reload)
	reload = reload or false 

	--Check if a module was found
	if modulePath == nil then
		CBLib.Debug.Error("Failed to load module '"..modulePath.."'. Module not found...")
		return
	end

	--We must re-load the module
	if reload then 
		CBLib.Modules[modulePath] = nil --Destroy the old reference
	end

	--This will either return the already created module, or it will create a new one
	if CBLib.Modules[modulePath] == nil then

		--Load the module code.
		local moduleContents = file.Read(modulePath, "lsv")

		local module = nil
		include(modulePath)

		if CBLIB_MODULE ~= nil then
			module = CBLIB_MODULE
			CBLIB_MODULE = nil
		else
			CBLib.Debug.Error("Tried to locate module @"..modulePath.." but the module returned nothing, it either does not exist or has produced an error!")
			return
		end

		CBLib.Debug.Info("Loaded Module : "..modulePath)

		--Did compile string return an error?
		if isstring(module) then
			CBLib.Debug.Error("Failed to load module. Error : "..module)
		else
			--Execute the module
			CBLib.Modules[modulePath] = module

			if CBLib.Modules[modulePath].OnLoaded then
				CBLib.Modules[modulePath].OnLoaded()
			end

			if reload and CBLib.Modules[modulePath].OnReloaded then
				CBLib.Modules[modulePath].OnReloaded()
			end
		end
	end

	--Return the reference.
	return CBLib.Modules[modulePath]
end


--Altough it does not destroy 'copies' of the module it does remove the reference stored here.
function CBLib.UnloadModule(modulePath)
	if CBLib.Modules[modulePath].OnUnloaded then
		CBLib.Modules[modulePath].OnUnloaded()
	end

	CBLib.Modules[modulePath] = nil
end

--Scans for all modules and sends any client/shared ones to the server using AddCSLuaFile()
function CBLib.NetworkModules()
	local base = ""

	local function ScanForClientSideModules(first, currentDirectory, currentFiles, path)
		if first then
			currentFiles, currentDirectory = file.Find("*", "lsv")
			path = base
			first = false  
		else
			currentFiles, currentDirectory = file.Find(path.."/*", "lsv")
		end  

		for k ,v in pairs(currentFiles) do
			--Client
			if string.find( v, "bmcl_" ) then
				local modulePath = path.."/"..v --Found it!
				AddCSLuaFile(modulePath)
				CBLib.Debug.Info("Added client side file '"..modulePath.."'")
			end

			--Shared
			if string.find( v, "bmsh_" ) then
				local modulePath = path.."/"..v --Found it!
				AddCSLuaFile(modulePath)
				CBLib.Debug.Info("Added client side file '"..modulePath.."'")
			end
		end 

		for k , v in pairs(currentDirectory) do
			local newPath = ""
			if path == "" then
				newPath = v
			else
				newPath = path.."/"..v
			end

			--Scan again and append directory.
			if ScanForClientSideModules(first, currentDirectory, currentFiles, newPath) then return true end --Cancle scan
		end
	end

	ScanForClientSideModules(true) 
end

----------------------------- 
--		   DEBUG 	       --
-----------------------------

CBLib.Debug = {} --A table with a bunch of debug functions

function CBLib.Debug.Error(message)
	MsgC(Color(255,120,120), "[CB-LIB][ERROR] ", message, "\n")
end

function CBLib.Debug.Warning(message)
	MsgC(Color(255,255,0), "[CB-LIB][WARNING] ", message, "\n")
end

function CBLib.Debug.Info(message)
	MsgC(Color(0,191,255), "[CB-LIB][INFO] ", message, "\n")
end

--Add global reference
_G.CBLib = CBLib

if CLIENT then
	--Done!
	CBLib.Debug.Info("Finished loading CB-LIB client-side")
else
	--Add Clientside modules
	CBLib.NetworkModules()

	--Done!
	CBLib.Debug.Info("Finished loading CB-LIB server-side")
end

--PATH lua/autorun/drgbase.lua:
DrGBase = DrGBase or {}
DrGBase.Icon = "drgbase/icon16.png"

-- Print --

function DrGBase.Print(msg, options)
	options = options or {}
	if SERVER and options.chat then
		net.Start("DrGBaseChatPrint")
		net.WriteString(msg)
		net.WriteBool(options.title ~= nil)
		if options.title ~= nil then
			net.WriteColor(options.title)
		end
		net.WriteBool(options.color ~= nil)
		if options.color ~= nil then
			net.WriteColor(options.color)
		end
		if IsValid(options.player) then
			net.Send(options.player)
		else net.Broadcast() end
	else
		local title = DrGBase.CLR_GREEN
		if options.title then title = options.title
		elseif SERVER or options._server then
			title = DrGBase.CLR_CYAN
		elseif CLIENT then title = DrGBase.CLR_ORANGE end
		local color = options.color or DrGBase.CLR_WHITE
		if options.chat and CLIENT then
			chat.AddText(title, "[DrGBase] ", color, msg)
		else MsgC(title, "[DrGBase] ", color, msg, "\n") end
	end
end
function DrGBase.Info(msg, options)
	options = options or {}
	options.title = DrGBase.CLR_GREEN
	return DrGBase.Print(msg, options)
end
function DrGBase.Error(msg, options)
	options = options or {}
	options.color = DrGBase.CLR_RED
	return DrGBase.Print(msg, options)
end
function DrGBase.ErrorInfo(msg, options)
	options = options or {}
	options.title = DrGBase.CLR_GREEN
	options.color = DrGBase.CLR_RED
	return DrGBase.Print(msg, options)
end
if CLIENT then
	net.Receive("DrGBaseChatPrint", function()
		local msg = net.ReadString()
		local options = {_server = true, chat = true}
		if net.ReadBool() then
			options.title = net.ReadColor()
		end
		if net.ReadBool() then
			options.color = net.ReadColor()
		end
		DrGBase.Print(msg, options)
	end)
end

-- Manage files --

local function IncludeFile(fileName)
	DrGBase.Print("Include file '"..fileName.."'.")
	return include(fileName)
end
function DrGBase.IncludeFile(fileName)
	local explode = string.Explode("[/\\]", fileName, true)
	local last = explode[#explode]
	if string.StartWith(last, "sv_") then
		if SERVER then return IncludeFile(fileName) end
	elseif string.StartWith(last, "cl_") then
		if CLIENT then return IncludeFile(fileName) end
	else
		AddCSLuaFile(fileName)
		return IncludeFile(fileName)
	end
end
function DrGBase.IncludeFiles(fileNames)
	local tbl = {}
	for i, fileName in ipairs(fileNames) do
		tbl[fileName] = DrGBase.IncludeFile(fileName)
	end
	return tbl
end
function DrGBase.IncludeFolder(folder)
	DrGBase.Print("Include folder '"..folder.."'.")
	local tbl = {}
	for i, fileName in ipairs(file.Find(folder.."/*.lua", "LUA")) do
		tbl[folder.."/"..fileName] = DrGBase.IncludeFile(folder.."/"..fileName)
	end
	return tbl
end
function DrGBase.RecursiveInclude(folder)
	local tbl = DrGBase.IncludeFolder(folder)
	local files, folders = file.Find(folder.."/*", "LUA")
	for i, folderName in ipairs(folders) do
		table.Merge(tbl, DrGBase.RecursiveInclude(folder.."/"..folderName))
	end
	return tbl
end

-- Autorun --

DrGBase.IncludeFolder("drgbase")
DrGBase.IncludeFolder("drgbase/meta")
DrGBase.IncludeFolder("drgbase/modules")

if SERVER then
	util.AddNetworkString("DrGBaseChatPrint")
else

	hook.Add("Initialize", "DrGBaseHello", function()
		DrGBase.Info("Hi! :)")
	end)

end

--PATH lua/drgbase/enumerations.lua:
NODE_TYPE_GROUND = 2
NODE_TYPE_AIR = 3
NODE_TYPE_CLIMB = 4
NODE_TYPE_WATER = 5

FACTION_REBELS = "FACTION_HL2_REBELS"
FACTION_COMBINE = "FACTION_HL2_COMBINE"
FACTION_ANIMALS = "FACTION_HL2_ANIMALS"
FACTION_ZOMBIES = "FACTION_HL2_ZOMBIES"
FACTION_ANTLIONS = "FACTION_HL2_ANTLIONS"
FACTION_GMAN = "FACTION_HL2_GMAN"
FACTION_BARNACLES = "FACTION_HL2_BARNACLES"
FACTION_SANIC = "FACTION_SHITTY_SANIC_CLONES"
FACTION_XEN_ARMY = "FACTION_HL_XEN_ARMY"
FACTION_XEN_WILDLIFE = "FACTION_HL_XEN_WILDLIFE"
FACTION_HECU = "FACTION_HL_HECU"

POSSESSION_MOVE_CUSTOM = 0
POSSESSION_MOVE_8DIR = 1
POSSESSION_MOVE_NSEW = 1
POSSESSION_MOVE_COMPASS = 1
POSSESSION_MOVE_1DIR = 2
POSSESSION_MOVE_FORWARD = 2
POSSESSION_MOVE_4DIR = 3

AI_BEHAV_CUSTOM = 0
AI_BEHAV_BASE = 1
AI_BEHAV_HUMAN = 2

PATROL_POS = 0
PATROL_SEARCH = 100
PATROL_SOUND = 200

IN_ATTACK3 = 33554432

if CLIENT then

	D_ER = 0
	D_HT = 1
	D_FR = 2
	D_LI = 3
	D_NU = 4

end

--PATH lua/drgbase/nodegraph.lua:
-- NODES TABLE --

local DRG_NODES = {}
local DRG_NODES_POS = {}

-- NODE CLASS --

local Node = {}
Node.__index = Node
function Node:New(id, type, pos)
	local node = {}
	node._id = id
	node._type = type
	node._pos = pos
	node._links = {}
	setmetatable(node, self)
	return node
end

function Node:GetID()
	return self._id
end
function Node:GetType()
	return self._type
end
function Node:GetPos()
	return self._pos
end
function Node:__tostring()
	return "Node["..self:GetID().."]"
end

function Node:Link(node)
	self._links[node:GetID()] = true
	node._links[self:GetID()] = true
end
function Node:Unlink(node)
	self._links[node:GetID()] = false
	node._links[self:GetID()] = false
end
function Node:IsLinked(node)
	return self._links[node:GetID()] or false
end
function Node:GetLinked()
	local nodes = {}
	for id, linked in pairs(self._links) do
		if not linked then continue end
		table.insert(nodes, DRG_NODES[id])
	end
	return nodes
end

function Node:Distance(pos)
	if not isvector(pos) then pos = pos:GetPos() end
	return self:GetPos():Distance(pos)
end
function Node:DistToSqr(pos)
	if not isvector(pos) then pos = pos:GetPos() end
	return self:GetPos():DistToSqr(pos)
end

-- ACCESS NODEGRAPH --

function DrGBase.GetNodegraph()
	return DRG_NODES
end
function DrGBase.ClosestNode(pos)
	local goal
	local distSqr = math.huge
	for id, node in ipairs(DRG_NODES) do
		if node:DistToSqr(pos) >= distSqr then continue end
		distSqr = node:DistToSqr(pos)
		goal = node
	end
	return goal
end
function DrGBase.NodegraphAstar(pos, goal, callback)
	local closest = DrGBase.ClosestNode(pos)
	local toreach = DrGBase.ClosestNode(goal)
	local path, success = DrGBase.Astar(closest:GetPos(), toreach:GetPos(), {
		neighbours = function(pos)
			local node = DRG_NODES_POS[tostring(pos)]
			if node then
				local i = 1
				local linked = node:GetLinked()
				return function()
					local next = linked[i]
					i = i+1
					if next then return next:GetPos() end
				end
			else return function() end end
		end
	}, isfunction(callback) and function(pos1, pos2, ...)
		return callback(DRG_NODES_POS[tostring(pos1)], DRG_NODES_POS[tostring(pos2)], ...)
	end)
	table.remove(path, #path)
	table.insert(path, goal)
	return path, success
end

-- INIT NODEGRAPH --

if SERVER then
	util.AddNetworkString("DrGBaseNodegraph")

	-- thx Silverlan!
	local NUM_HULLS = 10
	local SIZEOF_INT = 4
	local SIZEOF_SHORT = 2
	local AINET_VERSION_NUMBER = 37
	local function toUShort(b)
		local i = {string.byte(b,1,SIZEOF_SHORT)}
		return i[1]+i[2]*256
	end
	local function toInt(b)
		local i = {string.byte(b,1,SIZEOF_INT)}
		i = i[1]+i[2]*256+i[3]*65536+i[4]*16777216
		if i > 2147483647 then return i-4294967296 end
		return i
	end
	local function ReadInt(f) return toInt(f:Read(SIZEOF_INT)) end
	local function ReadUShort(f) return toUShort(f:Read(SIZEOF_SHORT)) end
	local function InitNodegraph()
		local f = file.Open("maps/graphs/"..game.GetMap()..".ain", "rb", "GAME")
		if not f then return false end
		DRG_NODES = {}
		DRG_NODES_POS = {}
		local ainet_ver = ReadInt(f)
		if ainet_ver ~= AINET_VERSION_NUMBER then return false end
		local map_ver = ReadInt(f)
		local nbnodes = ReadInt(f)
		for i = 1, nbnodes do
			local pos = Vector(f:ReadFloat(), f:ReadFloat(), f:ReadFloat())
			local yaw = f:ReadFloat()
			local offsets = {}
			for h = 1, NUM_HULLS do
				offsets[h] = f:ReadFloat()
			end
			local type = f:ReadByte()
			local info = ReadUShort(f)
			local zone = f:ReadShort()
			local node = Node:New(i, type, pos)
			table.insert(DRG_NODES, node)
			DRG_NODES_POS[tostring(pos)] = node
		end
		local nblinks = ReadInt(f)
		for i = 1, nblinks do
			local srcID = f:ReadShort()
			local destID = f:ReadShort()
			local nodesrc = DRG_NODES[srcID+1]
			local nodedest = DRG_NODES[destID+1]
			local move = {}
			for i = 1, NUM_HULLS do
				move[i] = f:ReadByte()
			end
			nodesrc:Link(nodedest)
		end
		f:Close()
		return true
	end

	local PARSED = false
	function DrGBase.RefreshNodegraph()
		PARSED = InitNodegraph()
	end

	local function NetNodegraph()
		net.Start("DrGBaseNodegraph")
		local compressed = util.Compress(util.TableToJSON(DRG_NODES))
		net.WriteData(compressed, #compressed)
	end
	function DrGBase.BroadcastNodegraph()
		if not PARSED then return end
		--NetNodegraph()
		--net.Broadcast()
	end
	function DrGBase.SendNodegraph(ply)
		if not PARSED then return end
		--NetNodegraph()
		--net.Send(ply)
	end

	DrGBase.RefreshNodegraph()
	DrGBase.BroadcastNodegraph()
	hook.Add("PlayerInitialSpawn", "DrGBaseSendNodegraph", function(ply)
		DrGBase.SendNodegraph(ply)
	end)

else

	net.Receive("DrGBaseNodegraph", function(len)
		DRG_NODES = {}
		local nodes = util.JSONToTable(util.Decompress(net.ReadData(len/8)))
		for i, data in ipairs(nodes) do
			local node = Node:New(data._id, data._type, data._pos)
			table.insert(DRG_NODES, node)
		end
		for i, data in ipairs(nodes) do
			local node = DRG_NODES[i]
			for id, linked in pairs(data._links) do
				if not linked then continue end
				node:Link(DRG_NODES[id])
			end
		end
	end)

	local DisplayNodegraph = CreateConVar("drgbase_nodegraph_display", "0")
	local DisplayDistance = CreateConVar("drgbase_nodegraph_distance", "1500")
	local DisplayType = CreateConVar("drgbase_nodegraph_type", "2")
	local DisplayTransparent = CreateConVar("drgbase_nodegraph_transparent", "0")
	local COLORS = {
		[NODE_TYPE_GROUND] = DrGBase.CLR_GREEN,
		[NODE_TYPE_AIR] = DrGBase.CLR_CYAN,
		[NODE_TYPE_CLIMB] = DrGBase.CLR_PURPLE,
		[NODE_TYPE_WATER] = DrGBase.CLR_BLUE
	}

	hook.Add("PostDrawOpaqueRenderables", "DrGBaseDrawNodegraph", function()
		if not GetConVar("developer"):GetBool() then return end
		if not DisplayNodegraph:GetBool() then return end
		local ply = LocalPlayer()
		local tr = ply:GetEyeTrace()
		for id, node in ipairs(DRG_NODES) do
			if node:GetType() ~= DisplayType:GetInt() then continue end
			if node:DistToSqr(tr.HitPos) > DisplayDistance:GetFloat()^2 then continue end
			render.DrawWireframeBox(node:GetPos(), Angle(0, 0, 0), Vector(-15, -15, -5), Vector(15, 15, 5), COLORS[node:GetType()], not DisplayTransparent:GetBool())
			for id, next in ipairs(node:GetLinked()) do
				render.DrawLine(node:GetPos(), next:GetPos(), DrGBase.CLR_WHITE, not DisplayTransparent:GetBool())
			end
		end
	end)

end

--PATH addons/sl_util_wallet/lua/ezwallet/languages/fr.lua:


easzy.wallet.languages = easzy.wallet.languages or {}

if (easzy.wallet.config.language != "fr") then return end

local languages = easzy.wallet.languages

languages.yes = "Oui"
languages.no = "Non"

languages.points = "points"
languages.theoryOnly = "Théorie uniquement"
languages.carry = "Port"
languages.sell = "Vente"
languages.andSell = "et vente"

languages.youHave = "Vous avez"
languages.pressToRotate = "Appuyez sur B pour retourner"
languages.pressToATM = "Appuyez sur E pour accéder à l'ATM"
languages.pressToGive = "Appuyez sur E pour donner"
languages.pressToUse = "Appuyez sur E pour utiliser"

languages.money = "Argent"
languages.creditCard = "Carte bancaire"
languages.idCard = "Carte d'identité"
languages.driverLicense = "Permis de conduire"
languages.weaponLicense = "Permis port d'arme"

languages.drop = "jette"
languages.onTheGround = "par terre"
languages.give = "donne"
languages.to = "à"

languages.takeOut = "sort"

languages.addonNotFound = "Addon non trouvé"

--PATH lua/gmodadminsuite/lang/french.lua:
return {
	Name = "French",
	Flag = "flags16/fr.png",
	Phrases = function() return {

		open_menu                 = "Ouvrir Menu",
		menu_nopermission         = "Désolé, mais vous n'avez pas la permission d'accéder au menu GmodAdminSuite.",
		menu_unknown_module       = "Désolé, mais le module spécifié n'est pas installé ou n'existe pas.",
		menu_disabled_module      = "Désolé, mais ce module est désactivé.",
		menu_module_nopermission  = "Désolé, mais vous n'avez pas la permission d'accéder à ce module.",
		open_gas                  = "Ouvrir GmodAdminSuite",
		module_shortcut           = "Raccourci Module",
		module_shortcut_info      = [[You can quickly access this GmodAdminSuite module through console and chat commands.

		To access the module through your console, type: %s
		To access the module through chat, type: %s

		Additionally, you can bind a key on your keyboard to a specific module.
		To do this, in your console, type: %s

		Make sure to replace KEY with a key on your keyboard of your choice.
		%s]],
		close                     = "Fermer",
		wiki                      = "Wiki",
		licensee                  = "Licencié",
		support                   = "Support",
		module_shop               = "Boutique de Modules",
		welcome                   = "Bienvenue",
		operator                  = "Opérateur",
		script_page               = "Page du Script",
		wiki                      = "Wiki",
		no_modules_available      = "Aucuns modules disponnibles!",
		no_modules_available_info = [[Désolé, but there aren't any GmodAdminSuite modules available for you to use.
		You may have insufficient permissions to use any, or none are enabled.]],
		custom_ellipsis           = "Custom...",
		usergroup_ellipsis        = "Groupe d'Utilisateurs...",
		steamid_ellipsis          = "SteamID...",
		enter_steamid_ellipsis    = "Entrez SteamID...",
		by_distance               = "Par Distance",
		by_usergroup              = "Par Groupes d'Utilisateurs",
		by_team                   = "Par Equipe",
		by_name                   = "Par Nom",
		right_click_to_focus      = "Clic Droit pour faire le focus",
		unknown                   = "Inconnu",
		utilities                 = "Utilitaires",
		player_management         = "Gestion Joueurs",
		administration            = "Administration",
		s_second                  = "1 seconde",
		s_seconds                 = "%d secondes",
		s_minute                  = "1 minute",
		s_minutes                 = "%d minutes",
		s_hour                    = "1 heure",
		s_hours                   = "%d heures",
		second_ago                = "il y a 1 seconde",
		seconds_ago               = "il y a %d secondes",
		minute_ago                = "il y a 1 minute",
		minutes_ago               = "il y a %d minutes",
		hour_ago                  = "il y a 1 heure",
		hours_ago                 = "il y a %d heures",
		just_now                  = "A l'instant",
		click_to_focus            = "Clic pour faire le focus",
		add_steamid               = "SteamID Custom",
		copied                    = "Copié !",
		settings                  = "Paramètres",
		add_steamid_help          = [[Entrez un SteamID ou SteamID64. Exemples:
		SteamID: %s
		SteamID64: %s]],

		setting_default_module = "Module par Défaut",
		setting_default_module_tip = "Quel module doit être ouvert lorsque le menu principal GmodAdminSuite est ouvert ?",
		none = "Aucun",
		general = "Général",
		localization = "Localisation",
		setting_menu_voicechat = "Autoriser Chat Vocal\nlorsque les menu GAS sont ouverts",
		setting_menu_voicechat_tip = "Les menu GmodAdminSuite ne vous empêchent pas de communiquer en jeu lorsqu'ils sont ouverts. Si cette option est active, appuyez simplement sur votre touche désignée à cet effet pour parler.",
		use_gas_language = "Utiliser le langage GmodAdminSuite",
		default_format = "Format par Défaut",
		short_date_format = "Format Date Abrégée",
		long_date_format = "Format Date Entière",
		short_date_format_tip = "Date format used for shorter date formats\n\nThe default format automatically matches the date format of your region (North America, Europe, etc.)",
		long_date_format_tip = "Date format used for longer date formats",
		permissions = "Permissions",
		module_enable_switch_tip = "Changes to this will only apply after a server restart/map change",
		enabled = "Activé",
		modules = "Modules",
		permissions_help = [[GmodAdminSuite utilise une librairie de permission open-sources nommée OpenPermissions, développée par Billy pour GAS. Elle fournit une gestion optimisée des permissions pour les systèmes avancées fonctionnant sur des serveurs de tous types.
		
		OpenPermissions est l'addon depuis lequel vous contrôlerez quels groupes peuvent accéder à quels modules, et ce qu'ils peuvent faire avec ces modules.
		Il peut être ouvert ouvert n'importe quand en écrivant "!openpermissions" dans le chat, ou "openpermissions" dans la console en jeu.

		Pour obtenir de l'aide, ou des informations, cliquez sur l'onglet "Aide" dans le menu OpenPermissions.]],
		website = "Site Web",
		fun = "Fun",

		bvgui_copied               = "Copié !",
		bvgui_open_context_menu    = "Ouvrir Menu Contextuel",
		bvgui_open_steam_profile   = "Afficher Profil Steam",
		bvgui_right_click_to_focus = "Clic Droit pour faire le focus",
		bvgui_click_to_focus       = "Clic pour faire le focus",
		bvgui_unknown              = "Inconnu",
		bvgui_no_data              = "Aucune Données",
		bvgui_no_results_found     = "Aucun résultat trouvé",
		bvgui_done                 = "Terminé",
		bvgui_enter_text_ellipsis  = "Entrez texte...",
		bvgui_loading_ellipsis     = "Chargement...",
		bvgui_pin_tip              = "Appuyez sur ECHAP pour pouvoir de nouveau intéragir avec le menu",

} end }
--PATH lua/gmodadminsuite/modules/commands/lang/english.lua:
return {
	Name = "English",
	Flag = "flags16/gb.png",
	Phrases = function() return {

		module_name = "Command Manager",

		no_permission = "Sorry, you don't have permission to use this command.",
		commands = "Commands",
		command = "Command",
		action = "Action",
		help = "Help",
		new_command = "+ New command",
		wiki = "Wiki",
		run_command = "Run Command",
		edit_command = "Edit Command",
		form_help = "Help text... (optional)",
		form_help_tip = "This is the text that will be shown in the commands menu in the \"help\" column.",
		select_action = "Select action...",
		hide_in_chat = "Hide in chat?",
		hide_in_chat_tip = "If checked, the command will not show up in chat when somebody types it.",
		finished = "Finished",
		commands_case_insensitive = "All commands are case insensitive.",
		ok = "OK",
		cannot_create_command = "Cannot create command!",
		cancel = "Cancel",
		delete_command = "Delete Command",
		copy_command = "Copy Command",
		permissions = "Permissions",
		permissions_editor = "Open Permissions Editor",
		permissions_tip = "Allows you to whitelist and blacklist usergroups and teams/jobs.",
		can_access_command = "Can access command",
		teams = "Teams",
		usergroups = "Usergroups",
		anyone_can_access = "Anyone can access this command",
		whitelisted_only = "Only whitelisted can access this command",
		non_blacklisted_only = "Only non-blacklisted can access this command",
		whitelisted_and_blacklisted = "Only whitelisted (except blacklisted) can access this command",
		custom_usergroup = "+ Custom Usergroup",
		custom_usergroup_text = "Enter usergroup",
		custom_usergroup_placeholder = "Usergroup...",
		reason_usergroup_blacklisted = "Your usergroup is blacklisted from this command.",
		reason_usergroup_not_whitelisted = "Your usergroup is not whitelisted to this command.",
		reason_team_blacklisted = "Your team is blacklisted from this command.",
		reason_team_not_whitelisted = "Your team is not whitelisted to this command.",
		saved_exclamation = "Saved!",
		set_position = "Set position",
		position_set = "Position set!",
		set_position_instruction = "Go to the desired position and face in the desired direction",
		set_position_instruction_2 = "When finished, unpin the menu and the position and angle will then be saved",

		action_open_commands_menu = "Open commands menu",
		action_command = "Run console command",
		action_chat = "Say chat message",
		action_website = "Open website",
		action_lua_function_sv = "Serverside Lua Function",
		action_lua_function_cl = "Clientside Lua Function",
		action_gas_module = "Open GAS Module",
		action_teleport = "Teleport",

		form_action_command = "Console command to run",
		form_action_chat = "Chat message to say",
		form_action_website = "Website to open",
		form_action_lua_function_sv = "Lua function to run\nserverside",
		form_action_lua_function_cl = "Lua function to run\nclientside",
		form_action_gas_module = "GAS module to open",
		form_action_teleport = "Teleport",

		error_command_exists = "A command with this name already exists!",
		error_no_command = "You have not entered the command.",
		error_no_command_execute = "You have not entered the command to execute.",
		error_no_action = "You have not selected an action for this command.",
		error_invalid_website = "The website you have entered is not a valid URL.",
		error_no_lua_function = "You have not selected a Lua function to execute.",
		error_no_gas_module = "You have not selected a GAS module to open.",
		error_no_position_set = "You did not set a position and angle for this teleport.",

} end }
--PATH lua/gmodadminsuite/modules/secondaryusergroups/lang/french.lua:
return {
	Name = "French",
	Flag = "flags16/fr.png",
	Phrases = function() return {

		module_name = "Secondary Usergroups",

		open_menu          = "Ouvrir Menu",
		custom_ellipsis    = "Custom...",
		usergroup_ellipsis = "Groupes d'Utilisateurs...",
		players            = "Joueurs",
		settings           = "Paramètres",
		players            = "Joueurs",
		give_usergroup     = "Définir Groupe",
		usergroup_ellipsis = "Groupe d'Utilisateurs...",
		usergroup_is_main  = "C'est le groupe principal des utilisateurs, il ne peut pas être donné ou retiré.",
		help               = "Aide",
		offline_btn        = "Nouveau Joueur...",
		loading_ellipsis   = "Chargement...",
		unknown            = "Inconnu",

} end }
--PATH lua/gmodadminsuite/cl_country_codes.lua:
--Source: https://datahub.io/core/country-list

GAS.CountryCodes = GAS.CountryCodes or GAS.spon.decode([[[S02DMS08DominicaS02IOS1EBritish Indian Ocean TerritoryS02FMS1FMicronesia, Federated States ofS02AMS07ArmeniaS02JOS06JordanS02CMS08CameroonS02BMS07BermudaS02FOS0DFaroe IslandsS02AOS06AngolaS02DOS12Dominican RepublicS02BOS1FBolivia, Plurinational State ofS02TKS07TokelauS02ZMS06ZambiaS02COS08ColombiaS02TMS0CTurkmenistanS02RSS06SerbiaS02MSS0AMontserratS02PSS13Palestine, State ofS02PMS19Saint Pierre and MiquelonS02SMS0ASan MarinoS02MMS07MyanmarS02WSS05SamoaS02USS0DUnited StatesS02BQS20Bonaire, Sint Eustatius and SabaS02ROS07RomaniaS02MOS05MacaoS02GQS11Equatorial GuineaS02SOS07SomaliaS02AQS0AAntarcticaS02BSS07BahamasS02TWS19Taiwan, Province of ChinaS02ASS0EAmerican SamoaS02MWS06MalawiS02IQS04IraqS02CRS0ACosta RicaS02ESS05SpainS02GUS04GuamS02ZWS08ZimbabweS02AUS09AustraliaS02UYS07UruguayS02LSS07LesothoS02KMS07ComorosS02PYS08ParaguayS02LUS0ALuxembourgS02AWS05ArubaS02NUS04NiueS02GWS0DGuinea-BissauS02BWS08BotswanaS02IMS0BIsle of ManS02VIS14Virgin Islands, U.S.S02CWS08CuraçaoS02SKS08SlovakiaS02GTS09GuatemalaS02KYS0ECayman IslandsS02ECS07EcuadorS02GSS2CSouth Georgia and the South Sandwich IslandsS02LYS05LibyaS02FIS07FinlandS02KWS06KuwaitS02GIS09GibraltarS02IDS09IndonesiaS02CYS06CyprusS02BYS07BelarusS02ETS08EthiopiaS02HKS09Hong KongS02GYS06GuyanaS02CIS0ECôte d'IvoireS02BBS08BarbadosS02EGS05EgyptS02VUS07VanuatuS02KGS0AKyrgyzstanS02YES05YemenS02GBS0EUnited KingdomS02LIS0DLiechtensteinS02GDS07GrenadaS02LKS09Sri LankaS02ADS07AndorraS02CUS04CubaS02CDS25Congo, the Democratic Republic of theS02KIS08KiribatiS02GMS06GambiaS02LBS07LebanonS02UMS24United States Minor Outlying IslandsS02AFS0BAfghanistanS02SBS0FSolomon IslandsS02GFS0DFrench GuianaS02CGS05CongoS02MFS1ASaint Martin (French part)S02BFS0CBurkina FasoS02CFS18Central African RepublicS02KES05KenyaS02KHS08CambodiaS02NFS0ENorfolk IslandS02EHS0EWestern SaharaS02SDS05SudanS02CNS05ChinaS02MDS14Moldova, Republic ofS02IES07IrelandS02NES05NigerS02CHS0BSwitzerlandS02AGS13Antigua and BarbudaS02WFS11Wallis and FutunaS02TFS1BFrench Southern TerritoriesS02GHS05GhanaS02KNS15Saint Kitts and NevisS02BTS06BhutanS02PFS10French PolynesiaS02BES07BelgiumS02VAS1DHoly See (Vatican City State)S02BJS05BeninS02ILS06IsraelS02NLS0BNetherlandsS02RUS12Russian FederationS02FJS04FijiS02NCS0DNew CaledoniaS02DJS08DjiboutiS02GLS09GreenlandS02INS05IndiaS02ALS07AlbaniaS02THS08ThailandS02CLS05ChileS02SLS0CSierra LeoneS02DES07GermanyS02BLS11Saint BarthélemyS02HNS08HondurasS02PTS08PortugalS02SJS16Svalbard and Jan MayenS02GNS06GuineaS02MYS08MalaysiaS02SSS0BSouth SudanS02BNS11Brunei DarussalamS02TJS0ATajikistanS02MHS10Marshall IslandsS02TLS0BTimor-LesteS02MRS0AMauritaniaS02ARS09ArgentinaS02SRS08SurinameS02PRS0BPuerto RicoS02MLS04MaliS02PWS05PalauS02MQS0AMartiniqueS02TRS06TurkeyS02VNS08Viet NamS02TTS13Trinidad and TobagoS02TNS07TunisiaS02GPS0AGuadeloupeS02STS15Sao Tome and PrincipeS02SNS07SenegalS02PNS08PitcairnS02KPS26Korea, Democratic People's Republic ofS02HUS07HungaryS02BRS06BrazilS02JPS05JapanS02MUS09MauritiusS02TVS06TuvaluS02FRS06FranceS02GRS06GreeceS02SVS0BEl SalvadorS02ERS07EritreaS02YTS07MayotteS02KRS12Korea, Republic ofS02HRS07CroatiaS02IRS19Iran, Islamic Republic ofS02NRS05NauruS02NOS06NorwayS02LRS07LiberiaS02MPS18Northern Mariana IslandsS02SXS19Sint Maarten (Dutch part)S02UZS0AUzbekistanS02MXS06MexicoS02BDS0ABangladeshS02HTS05HaitiS02BVS0DBouvet IslandS02CVS0ACape VerdeS02TDS04ChadS02LVS06LatviaS02MZS0AMozambiqueS02SYS14Syrian Arab RepublicS02SZS09SwazilandS02FKS1BFalkland Islands (Malvinas)S02AXS0EÅland IslandsS02MNS08MongoliaS02MES0AMontenegroS02TZS1CTanzania, United Republic ofS02MVS08MaldivesS02MKS2AMacedonia, the Former Yugoslav Republic ofS02KZS0AKazakhstanS02CXS10Christmas IslandS02NPS05NepalS02NZS0BNew ZealandS02ATS07AustriaS02CAS06CanadaS02BAS16Bosnia and HerzegovinaS02BZS06BelizeS02CZS0ECzech RepublicS02GAS05GabonS02AZS0AAzerbaijanS02ITS05ItalyS02LTS09LithuaniaS02DZS07AlgeriaS02PKS08PakistanS02CCS17Cocos (Keeling) IslandsS02LAS20Lao People's Democratic RepublicS02GGS08GuernseyS02NAS07NamibiaS02MTS05MaltaS02PAS06PanamaS02SAS0CSaudi ArabiaS02GES07GeorgiaS02MAS07MoroccoS02AES14United Arab EmiratesS02PLS06PolandS02LCS0BSaint LuciaS02QAS05QatarS02RWS06RwandaS02MCS06MonacoS02ZAS0CSouth AfricaS02SCS0ASeychellesS02VCS20Saint Vincent and the GrenadinesS02BGS08BulgariaS02TCS18Turks and Caicos IslandsS02JES06JerseyS02EES07EstoniaS02NGS07NigeriaS02PHS0BPhilippinesS02VES21Venezuela, Bolivarian Republic ofS02SHS2CSaint Helena, Ascension and Tristan da CunhaS02PES04PeruS02SES06SwedenS02RES08RéunionS02NIS09NicaraguaS02VGS17Virgin Islands, BritishS02BHS07BahrainS02TGS04TogoS02BIS07BurundiS02UAS07UkraineS02MGS0AMadagascarS02PGS10Papua New GuineaS02SGS09SingaporeS02AIS08AnguillaS02TOS05TongaS02SIS08SloveniaS02OMS04OmanS02CKS0CCook IslandsS02UGS06UgandaS02HMS21Heard Island and McDonald IslandsS02DKS07DenmarkS02JMS07JamaicaS02ISS07Iceland)]])
GAS.CountryCodesReverse = GAS.CountryCodesReverse or GAS:table_Flip(GAS.CountryCodes)
--PATH lua/gmodadminsuite/sh_registry_tbl.lua:
-- Optimization library
-- Helps with optimizing pairs() into ipairs() for some stuff
-- Basically just a table that makes sure there are no duplicates

AddCSLuaFile()

local setmetatable = setmetatable
local rawget = rawget
local rawset = rawset
local isnumber = isnumber

local function __index_func(self, i)
	if (isnumber(i)) then
		return rawget(self, "seq")[i]
	else
		return rawget(self, "kv")[i]
	end
end

local function __call_func(self, i, method)
	local kv = rawget(self, "kv")

	if (method == nil and kv[i] ~= nil) then -- remove

		local seq = rawget(self, "seq")
		local seq_i = rawget(self, "seq_i")
		local seq_r = rawget(self, "seq_r")
		
		kv[i] = nil
		seq[seq_r[i]] = nil
		for shift=seq_r[i]+1,seq_i do
			if (seq[shift] ~= nil) then
				seq_r[seq[shift]] = shift - 1
			end
			seq[shift-1] = seq[shift]
		end
		
		seq_r[i] = nil

		rawset(self, "seq_i", seq_i - 1)

	elseif (method ~= nil) then -- add

		if (kv[i] ~= nil) then
			self(i, nil)
		end

		local seq = rawget(self, "seq")
		local seq_i = rawget(self, "seq_i")
		local seq_r = rawget(self, "seq_r")

		kv[i] = method
		seq[seq_i] = i
		seq_r[i] = seq_i

		rawset(self, "seq_i", seq_i + 1)

	end
end

local function ipairs_func(self)
	return ipairs(rawget(self, "seq"))
end

local function pairs_func(self)
	return pairs(rawget(self, "kv"))
end

local function ipairs_pop_func(self)
	local n, prev_n
	return function()
		n = self:len()
		if (n > 0) then
			assert(prev_n == nil or n < prev_n, "ipairs_pop requires element to always be popped")
			prev_n = n
			return n, rawget(self, "seq")[n]
		end
	end
end

local ipairs_poppy_func
do
	local active_ipairs_pop
	local function pop_func()
		active_ipairs_pop(rawget(active_ipairs_pop, "seq")[rawget(active_ipairs_pop, "poppy_i")], nil)
	end
	ipairs_poppy_func = function(self)
		self(NULL, nil)
		active_ipairs_pop = self
		rawset(self, "poppy_i", self:len() + 1)
		return function()
			rawset(self, "poppy_i", rawget(self, "poppy_i") - 1)
			if (rawget(self, "poppy_i") > 0) then
				return rawget(self, "poppy_i"), rawget(self, "seq")[rawget(self, "poppy_i")], pop_func
			end
		end
	end
end

local function len_func(self)
	self(NULL, nil)
	return rawget(self, "seq_i") - 1
end

local function sequential_func(self)
	self(NULL, nil)
	return rawget(self, "seq")
end

local function dictionary_func(self)
	self(NULL, nil)
	return rawget(self, "kv")
end

function GAS:Registry()
	local Registry = {
		seq = {},
		seq_i = 1,
		seq_r = {},
		kv = {},
		ipairs = ipairs_func,
		ipairs_pop = ipairs_pop_func,
		ipairs_poppy = ipairs_poppy_func,
		pairs = pairs_func,
		len = len_func,
		sequential = sequential_func,
		dictionary = dictionary_func
	}

	setmetatable(Registry, {
		__index = __index_func,
		__call = __call_func
	})
	
	return Registry
end
--PATH lua/gmodadminsuite/modules/secondaryusergroups/_gas_info.lua:
return {
	DefaultEnabled = true,
	Name = "Secondary Usergroups",
	Category = GAS.MODULE_CATEGORY_PLAYER_MANAGEMENT,
	Wiki = "https://gmodsto.re/gmodadminsuite-secondaryusergroups-wiki",
	Icon = "icon16/group.png",
}
--PATH addons/sl_utils/lua/autorun/init_improvedstacker.lua:
if ( SERVER ) then
	
	-- needed for custom vgui controls in the menu
	AddCSLuaFile( "vgui/stackercontrolpresets.lua" )
	AddCSLuaFile( "vgui/stackerdnumslider.lua" )
	AddCSLuaFile( "vgui/stackerpreseteditor.lua" )
	
	-- convenience modules
	AddCSLuaFile( "improvedstacker/improvedstacker.lua" )
	AddCSLuaFile( "improvedstacker/localify.lua" )
	
else

	-- needed for custom vgui controls in the menu
	include( "vgui/stackercontrolpresets.lua" )
	include( "vgui/stackerdnumslider.lua" )
	include( "vgui/stackerpreseteditor.lua" )

end
--PATH lua/autorun/mad_sololeveling_pm.lua:
player_manager.AddValidModel( "Male1 - Mad", "models/mad_models/mad_sl_male1.mdl" );
list.Set( "PlayerOptionsModel", "Male1 - Mad", "models/mad_models/mad_sl_male1.mdl" );

player_manager.AddValidModel( "Female1 - Mad", "models/mad_models/mad_sl_female1.mdl" );
list.Set( "PlayerOptionsModel", "Female1 - Mad", "models/mad_models/mad_sl_female1.mdl" );

--------------------------------------------------------------------------------------------------------

player_manager.AddValidModel( "Male Armor1 - Mad", "models/mad_models/mad_sl_male_armor1.mdl" );
list.Set( "PlayerOptionsModel", "Male Armor1 - Mad", "models/mad_models/mad_sl_male_armor1.mdl" );

player_manager.AddValidModel( "Female Armor1 - Mad", "models/mad_models/mad_sl_female_armor1.mdl" );
list.Set( "PlayerOptionsModel", "Female Armor1 - Mad", "models/mad_models/mad_sl_female_armor1.mdl" );
--PATH addons/msd_ui/lua/msd/sh_language.lua:
-- ┏━┓┏━┳━━━┳━━━┓───────────────────────
-- ┃┃┗┛┃┃┏━┓┣┓┏┓┃───────────────────────
-- ┃┏┓┏┓┃┗━━┓┃┃┃┃──By MacTavish <3──────
-- ┃┃┃┃┃┣━━┓┃┃┃┃┃───────────────────────
-- ┃┃┃┃┃┃┗━┛┣┛┗┛┃───────────────────────
-- ┗┛┗┛┗┻━━━┻━━━┛───────────────────────
local files = file.Find("msd/language/*", "LUA")

for k, v in ipairs(files) do
	if (SERVER) then
		include("msd/language/" .. v)
		AddCSLuaFile("msd/language/" .. v)
		MsgC(Color(174, 0, 255), "[MSD] " .. v .. " language found\n")
	else
		include("msd/language/" .. v)
	end
end

function MSD.GetPhrase(name, ...)
	local lang = MSD.Language[MSD.Config.Language] or MSD.Language["en"]
	local prase = lang[name]

	if not prase then
		prase = MSD.Language["en"][name]
	end

	if not prase then return name end

	return string.format(prase, ...)
end
--PATH addons/msd_ui/lua/msd/language/tr.lua:
MSD.Language["tr"] = {

	lang_name = "Türkçe",

	ok = "Tamam",
	map = "Harita",
	off = "Kapalı",
	on = "Açık",
	time_add = "Eklenecek zaman",
	type = "Tür",
	delay = "Gecikme",
	cancel = "İptal",
	enable = "Aktif Et",
	model = "Model",
	name = "İsim",
	settings = "Ayarlar",
	editor = "Düzenleyici",
	red = "Kırmızı",
	green = "Yeşil",
	blue = "Mavi",
	admin_menu = "Yetkili Menüsü",
	ui_settings = "Arayüz Ayarları",
	active = "Aktif",
	inactive = "Deaktif",
	disabled = "Devre Dışı",
	warning = "Uyarı!",
	remove = "Kaldır",
	theme = "Tema",
	dark_theme = "Karanlık Tema",
	payment = "Ödeme",
	load_autosave = "Son kaydı yükleyecek misin?",
	load_save = "Kaydı yükle",
	create_new = "Yeni oluştur",
	enable_option = "Ayarı aktif et",
	main_opt = "Ana ayarlar",
	copy_data = "Veriyi kopyala",
	save_chng = "Değişiklikleri kaydet",
	enter_name = "İsimi giriniz",
	enter_id = "ID giriniz",
	confirm_action = "Eylemlerinizi lütfen onaylayınız",
	check_fpr_errors = "Hataları kontrol et",
	enter_description = "Açıklama gir",
	cooldown_ok = "Başarı sonucu bekleme süresi",
	cooldown_fail = "Hata sonucu bekleme süresi",
	s_team_whitelist = "Takım beyaz listesini ayarla",
	whitelist_blacklist = "Beyaz liste kara liste",
	custom_val = "Özel değer ayarla",
	set_hp_full = "Sağlık değerini fulle",
	dist_to_close = "En yakınına mesafe",

	e_text = "Yazı giriniz",
	e_number = "Sayı giriniz",
	e_class = "Sınıf giriniz",
	e_value = "Değer giriniz",
	e_blank_dis = "Devre dışı bırakmak için boş bırakın",
	e_blank_default = "Varsayılan ayarlar için boş bırakın",
	e_url = "Bağlantı giriniz",
	e_model = "Model uzantısını giriniz",
	e_material = "Materyal uzantısını giriniz",
	e_wep_class = "Silah sınıfını giriniz",
	e_ent_class = "Varlık sınıfını giriniz",
	e_veh_class = "Araç sınıfını giriniz",
	e_npc_class = "NPC sınıfını giriniz",

	select_ammo = "Seçili mermi",
	amount_ammo = "Mermi asyısı",
	disable_phys = "Fiziği devre dışı bırak",
	none = "Hiç",
	custom_icon = "Özel ikon ayarla",
	weapon_name = "Silah isim",
	moveup = "Yukarı git",
	movedown = "Aşağıya git",
	movepoint = "Noktayı hareket ettir",
	swap = "Değiş",
	swapmod = "Değişim modu aktif. Tıklayarak devre dışı bırak",
	copy_from_ent = "Baktığın varlıktan kopyala",
	set_pos_self = "Pozisyonunu ayarla",
	set_pos_aim = "Baktığın noktaya ayarla",
	spawn_point = "Nokta oluştur",
	spawn_ang = "Açı oluştur",
	mark_area = "Alanı işaretle",
	time_wait = "Bekleme süresi",
	map_marker = "Harita işaretçisini ayarla",
	in_sec = "saniye olarak",
	def_units = "Varsayılan %s ünit", -- "Default 350 units" leave %s as is
	def_seconds = "Varasyılan %s saniye", -- "Default 10 seconds" leave %s as is
	ent_show_pointer = "İaşretçiyi varlığın üstünde göstr",
	ent_arcade_style = "Arcade-tarzında entitiy görünüşü",
	ent_stnd_style = "Standart varlık görünüşü",
	custom_color = "Özel rengi aktif et",
	mat_default = "Varsayılan materyal için boş bırak",

	set_ui = "Kullanıcı Arayüzü ayarları",
	set_hud = "HUD ayarları",
	set_hud_pos = "Görev HUD'u ayarları",
	set_hud_themes = "HUD Temaları",
	set_server = "Sunucu ayarları",
	set_ui_blur = "Arkaplanı bulanıklaştır",
	set_ui_mono = "Monokrom arkaplan",
	set_ui_vignette = "Arka plan için vignette efekti",
	set_ui_brightness = "Arkaplan parlaklığı",
	set_ui_color = "Ana rengi seç",
	set_ui_align_left = "Sola yatay hizalama",
	set_ui_align_right = "Sağa yatay hizalama",
	set_ui_align_top = "Yukarıya dikey hizalama",
	set_ui_align_bottom = "Aşağıya dikey hizalama",
	set_ui_offset_h = "Yatay Ofset",
	set_ui_offset_v = "Dikey Ofset",

	upl_changes = "Değişiklikleri sunucuya yükle",
	res_changes = "Değişimleri eski haline getir",

	-- Player

	dead = "Öldün",
	time_ex = "Zaman doldu",
	vehicle_bum = "Aracın yok oldu",
	left_area = "Bölgeyi terk ettin",
	m_blew = "Görevi batırdın",
	m_failed = "Görev başarısız",
	m_success = "Görev başarılı",
	m_loop = "Görev güncellemesi",

	-- Errors

	inv_quest = "Geçersiz görev",
	team_bl = "Takımın karalistede",
	no_players = "Bunu yapman için sunucuda daha fazla oyuncu olması gerekmekte",
	no_players_team = "Bunu yapman için belirli takımlarda daha fazla oyuncu olması gerekmekte",
	need_admin = "Sadece adminler bu eylemi gerçekleştirebilir",

	-- Quests

	active_quest = "Aktif bir görevin var",
	inactive_quest = "Bu görevi oynayamazsın",
	quest_editor = "Görev Düzenleyicisi",
	quest_list = "Görev Listesi",
	quests = "Görevler",
	leave_pnt = "Noktadan ayrıl",

	q_editobj = "hedefleri düzenle",
	q_incvobj = "Geçersiz hedef",
	q_setobj = "Hedef ayarları",
	q_newobj = "Yeni bir hedef oluştur",
	q_editrwd = "Ödülleri düzenle",
	q_rwdeditor = "Ödül Düzenleyicisir",
	q_rwdlist = "Ödül Listesi",
	q_rwdsets = "Ödül Ayarları",
	q_findmap = "Diğer haritalardan görev bul",
	q_obj_des = "Hedef açıklaması",
	q_dist_point = "Noktaya olan uzaklık",
	q_dist_from_point = "Noktadan olan uzaklık",
	q_ignore_veh = "Görev aracını görmezden gel",
	q_timer_show = "Oyuncuya zamanlayıcıyı göster",
	q_area_stay = "Oyuncu bölgede kalmalı",
	q_start = "Görevi başlat",
	q_new = "Yeni görev",
	q_submit = "Görevi sun",
	q_addnew = "Yeni görev ekle",
	q_remove = "Görevi kaldır",
	q_id_unique = "Her bir görevin ID'si kendine özel olmalı",
	q_complete_msg = "Görevi bitirme mesajı",
	q_dotime = "Görev süresi",
	q_dotime_ok = "Süre bitince görev başarıyla tamamlansın",
	q_dotime_fail = "Süre bitince görev başarısız olsun",
	q_death_fail = "Oyuncu öldüğünde görevi iptal et",
	q_loop = "Görevleri tekrara al",
	q_loop_reward = "Her bir tekrarda oyuncuyu ödüllendir",
	q_enable = "Görevi aktif et",
	q_events = "Etkinlikler",
	q_eventadd = "Etkinlik Ekle",
	q_eventedit = "etkinlik düzenle",
	q_eventremove = "Etkinlik kaldır",
	q_in_progress = "Görev işlem sürecinde",
	q_time_left = "Kalan süre",
	q_ply_limit = "Görev için azami oyuncu sayısı",
	q_ply_team_limit = "Takım limitlerini ayarla",
	q_ply_team_need = "Gerekli takım oyuncuları",
	q_ply_need = "Başlamak için gereken oyuncu sayısı",
	q_play_limit = "Görevi kaç oyuncunun oynayabileceğinin limiti",
	q_must_stay_area = "Bu bölgenin içinde kalman gerekiyor yoksa görev başarısız olur",
	q_time_wait = "Bu görevi tekrarlaman için beklemen lazım",
	q_dotime_reset = "Görevin süresini sıfırla",
	q_dotime_add = "Göreve yapma süresi ekle",
	q_noreplay = "Bu görevi tekrar yapamazsın",
	q_dis_replay = "Görev tekrarını iptal et",
	q_needquest = "İlk başka bir görevi yapman gerekmekte",
	q_needquest_menu = "Bitirilmiş görev gerekmektedir",
	q_enterror = "Görev varlıkları oluşmamakta, görev kurulumunu kontrol et",
	q_get = "Bu NPC'lerden görev alabilirsin",
	q_noquests = "Görev yapabileceğin herhangi bir yol bulunmamakta :(",
	q_ent_draw = "Görev varlığı çizim mesafesi",
	q_loop_stop_key = "Görev tekrarlama durdurma tuşu",
	q_hold_key_stop = "görevi durdurmak için [%s] tuşuna basılı tutun", -- To stop quest hold [P]
	q_enter_veh = "Aracına bin",
	q_npc_link = "Görevi bir NPC'ye bağla",
	q_icon68 = ".PNG ve 68x68 pixel olucak şekilde bir bağlantı giriniz",
	q_ent_pos_show = "Varlık lokasyonlarını oyunculara göster",
	q_area_size = "Bölge boyutu",
	q_area_pos = "Bölge pozisyonu",
	q_s_area_size = "Bölge boyutunu ara",
	q_s_area_pos = "Bölge pozisyonunu ara",
	q_npc_answer_ok = "Oyuncunun pozitif cevabı",
	q_npc_answer_no = "Oyuncunun negatif cevabı",
	q_npc_answer_noq = "Görev yoksa oyuncunun cevabı",
	q_npc_quest_no = "Görev yoksa NPC'nin konuşması",
	q_money_give = "Verilecek para",

	-- Simple NPCs

	npc_editor = "NPC Düzenleyicisi",
	npc_new = "Yeni NPC",
	npc_select = "Bir NPC seçin",
	npc_e_speech = "NPC konuşması giriniz",
	npc_submit = "NPC oluşumunu onayla",
	npc_update = "NPC'yi güncelle",
	npc_remove = "NPC'yi kaldır",
	npc_q_enable = "Görev NPC'lerini aktif et",
	npc_did_open = "Dialog ID'si açılırken gereksin",
	npc_q_target = "NPC objektif bir hedef",
	npc_hostile = "Düşman NPC",


	-- Update 1.1.0

	cam_start = "Kamera başlama parametreleri",
	cam_end = "Kamera parametrelerini bitir",
	cam_pos = "Kamera pozisyonu",
	cam_ang = "Kamera açısı",
	cam_fov = "Kamera FOV'u",
	cam_effect = "Kamera kapanma efekti",
	q_open_target = "Diğer oyuncuların NPCleri öldürmelerine izin ver",
	q_npc_mind = "NPClere olan Min. uzaklık",
	not_spawned = "spawnlanmamış",
	dis_text = "Sergilenen Yazı",
	cam_speed = "Kamera hızı (düşük sayı - düşük hız)",
	fov_speed = "FOV değişme hızı (düşük sayı - düşük hız)",
	category_des = "Görev kategorisi, görevleri sınıflamak için kullanılır",
	sortquests_cat = "Görevleri kategoriye göre düzenle",
	search_q = "Görev ara",
	quest_tools = "Görev araçları",
	set_anim = "Animasyon ayarla",
	s_quest_blacklist = "Görev karalistesi oluştur",
	s_quest_blacklist_desc = "Bitirildiğinde bu görevi engelleyecek görevleri seçin",
	hold_use = "Basılı Tut [%s]",
	duplicate = "Çiftle",
	unsorted = "Sınıflandırılmamış",
	search = "Ara",
	duration = "Süre",
	category = "Kategori",
	blacklist = "Karaliste",


	--  Update 1.2.0

	restore_wep = "Görev sonunda silahları geri yükle",
	e_cmd = "Konsol komutunu girin",
	e_args = "Komut bağımsız değişkenlerini girin",
	hint_cmd = "Otomatik doldurma kısayolları: \n$uid - Kullanıcı Kimliği, \n$sid - SteamID, \n$s64 - SteamID 64, \n$n - Oyuncu adı",
	youaretracked = "Konumunuzu artık diğer oyuncular da görebiliyor!",
	border_rounded = "Yuvarlak kenarlık tasarımı",
	border_square = "Kare kenarlık tasarımı",
	access_settings = "Menü erişimi",
	compact_obj = "Görevler için kompakt hedef listesi",
	e_usergroup = "Kullanıcı grubu girin",
	ug_isanadmin = "Bu kullanıcı grubu zaten tam erişime sahip",
	find_player_id32 = "SteamID 32 ile oyuncu verilerini bulun",
	user_data = "Kullanıcı verileri düzenleyicisi",
	access_editors = "Görev düzenleyicilerinin erişimini ayarla",
	access_admins = "Tam erişimi ayarla",
	add_usergroup = "Kullanıcı grubu ekle",
	edit_objmod = "Objektif sırasını düzenle",
	editmod = "Düzenleme modu",
	move = "Taşı",
	q_errorloop = "Görev sonsuz bir döngüye girdi",
	q_cooldow_perply = "Genel bekleme süresi sayacı",
	q_cooldow_publick = "Oyuncu Başına bekleme süresi sayacı",
	q_stop_anytime = "Görevi manuel olarak bırakmaya izin ver",
	quest_abandon = "Görevi terk ettin",
	q_dotime_set = "Görev yapma zamanını ayarla",

	-- Ranks

	enter_path_or_url = "Klasör yolu ya da url girin",
	rank_edit = "Rütbe Ayarla",
	rank_list = "Rütbe Listesi",
	group_list = "Grup Listesi",
	group_addnew = "Yeni grup ekle",
	blank = "Boş",
	mrs_show_all = "Tüm oyunculara rütbeleri göster",
	mrs_show_team = "Sadece gruplara rütbeleri göster",
	mrs_use_sn = "Rütbe kısaltmalarını göster",
	use_url = "URL kullan",
	enter_srt_name = "Kısaltma gir",
	srt_name = "Kısaltma",
	mrs_prom_demote = "Sıradaki 2 ayar sadece düşük rütbeleri etkileyecek. Bu rütbeye sahip oyuncular, diğer oyuncuları daha yüksek rütbelere veya aynı rütbeye terfi ettiremezler.",
	mrs_whilelist = "Bir iş için rütbe gereksinimini seçerseniz, oyuncu bu işi ancak rütbesi seçilen veya daha yüksek olanla eşleşirse oynayabilir.",
	can_promote = "Oyuncuları terfi ettirebilir",
	can_demote = "Oyuncuların rütbesini düşürebilir",
	edit_player_model = "Özel oyuncu modelini düzenle",
	enable_player_model = "Özel oyuncu modelini aktifleştir",
	disable_player_model = "Özel oyuncu modelini deaktif et",
	edit_custom_stats = "Özel oyuncu istatistiklerini düzenle",
	autoprom = "Sonraki rütbeye otomatik yükselt",
	in_min = "dakika içinde",
	mrs_promoted = "Terfi aldın",
	mrs_demoted = "Rütben düşürüldü",
	mrs_job_smallrank = "%s ya da daha üst bir rütbeye değilsen %s olarak oynayamazsın", -- You must be Sergeant II or higher to play as Watch Commander
	show_group = "Rütbe grup ismini göster",
	hide_rank = "Sadece rütbe ikonunu göster",
	mrs_hud_follow = "Arayüzü oyuncunun bakış açısına göre döndür",
	set_overhead = "Oyuncu bilgisi arayüzü",
	offline_users = "Çevrimdışı oyuncular",
	mrs_noranks = "Şu anki mesleğinin rütbesi yok",
	mrs_nopower = "Şu anki rütbenin ekstra izini yok",
	promotion = "Terfi",
	on_duty = "Görevde",
	other_players = "Diğer oyuncular",
	mrs_change_jobname = "Meslek ismini rütbe ismi olarak değiştir",
	mrs_set_prefix = "Rütbe ismini mesleğin başına ekle",
	copy_all_data = "Bütün verileri kopyala",
	copy_only_stats = "Sadece istatistikleri ve oyuncu modelini kopyala",
	mrs_change_plyname = "Oyuncunun ismini rütbe ismi yap",
	mrs_set_prefix_ply = "Rütbe ismini önek gibi oyuncunun isminin önüne koy",

}

-- Other phrases
local lng = "tr"

MSD.Language[lng]["Move to point"] = "Noktaya git"
MSD.Language[lng]["Leave area"] = "Bölgeden ayrıl"
MSD.Language[lng]["Kill NPC"] = "NPC'yi öldür"
MSD.Language[lng]["Collect quest ents"] = "Görev varlıklarını topla"
MSD.Language[lng]["Talk to NPC"] = "NPC ile konuş"
MSD.Language[lng]["There is no quests available"] = "Mevcut görev bulunmamakta"
MSD.Language[lng]["Give weapon"] = "Silah ver"
MSD.Language[lng]["Give ammo"] = "Mermi ver"
MSD.Language[lng]["Strip Weapon"] = "Silaha el koy"
MSD.Language[lng]["Spawn quest entity"] = "Görev varlığı oluştur"
MSD.Language[lng]["Spawn entity"] = "Varlık oluştur"
MSD.Language[lng]["Spawn npc"] = "NPC oluştur"
MSD.Language[lng]["Manage do time"] = "Yapım süresini yönet"
MSD.Language[lng]["Spawn vehicle"] = "Araç oluştur"
MSD.Language[lng]["Remove vehicle"] = "Aracı kaldır"
MSD.Language[lng]["Remove all entites"] = "Tüm varlıkları kaldır"
MSD.Language[lng]["Set HP"] = "Can Ayarla"
MSD.Language[lng]["Set Armor"] = "Zırh Ayarla"
MSD.Language[lng]["DarkRP Money"] = "DarkRP Parası"
MSD.Language[lng]["Quest NPCs are disabled"] = "Görev NPC'leri devre dışı"
MSD.Language[lng]["You can enable them in settings"] = "Ayarlardan aktif edebilirsin"
--PATH addons/gmodadminsuite-config-master/lua/openpermissions_config.lua:
--[[

	   ____                   ____                      _           _                 
	  / __ \____  ___  ____  / __ \___  _________ ___  (_)_________(_)___  ____  _____
	 / / / / __ \/ _ \/ __ \/ /_/ / _ \/ ___/ __ `__ \/ / ___/ ___/ / __ \/ __ \/ ___/
	/ /_/ / /_/ /  __/ / / / ____/  __/ /  / / / / / / (__  |__  ) / /_/ / / / (__  ) 
	\____/ .___/\___/_/ /_/_/    \___/_/  /_/ /_/ /_/_/____/____/_/\____/_/ /_/____/  
	    /_/                                                                           

	Welcome to the OpenPermissions configuration file.
	This is where you'll define who is an OpenPermissions Operator.

	Operators have maximum permissions - you could call them "superadmins" of OpenPermissions.
	They have access to changing the permissions of the server, so only add people you trust here!

]]

-- Enter usergroups that should be Operators
OpenPermissions.Operators.Usergroups = {"superadmin", "operator", "developer", "owner", "founder"}

-- Enter SteamIDs or SteamID64s of people who should be Operators
OpenPermissions.Operators.SteamIDs = {"STEAM_0:1:40314158", "76561198040894045"}

-- Don't delete the line below; your config will break.
return true
--PATH addons/permanent_sweps/lua/perm_swepy/cl_perm_sweps.lua:
/*
	Perma SWEP system by Hackcraft STEAM_0:1:50714411
*/

local currentPerson, currentGroup, currentEDS
local currentInventory = {}
local perm = {}
local OtherSweps = PermSWEPsCFG.HiddenSWEPs or {}
local swepsList = false
local thingToThing = {
	["Player"] = "steam id",
	["Group"] = "rank",
	["EDS"] = "power(number)"
}
local currentMode = false

local function getweaponsList()
	if !swepsList then
		swepsList = table.Add(weapons.GetList(), OtherSweps)
	end
	return swepsList
end

local function weaponList()
	local new = {}
	for k, v in ipairs(getweaponsList()) do
//		PrintTable(v)
		if istable(v) and v.PrintName and #v.PrintName >= 1 and v.ClassName and !table.HasValue(currentInventory, v.ClassName) and !string.find(v.ClassName, "base") then
			table.insert(new, {PrintName = v.PrintName, ClassName = v.ClassName})
		end
	end
	return new
end

local function InventoryChanged(id, t)
	if id then
		net.Start("PermSweps_SendInventoryToServer")
			net.WriteString(id)
			net.WriteString(util.TableToJSON(t))
		net.SendToServer()
	end
end

local function GroupInventoryChanged(rank, t)
	if rank then
		net.Start("PermSweps_SendGroupInventoryToServer")
			net.WriteString(rank)
			net.WriteString(util.TableToJSON(t))
		net.SendToServer()
	end
end

local function EDSInventoryChanged(num, t)
	if num and tonumber(num) == num then
		net.Start("PermSweps_SendEDSInventoryToServer")
			net.WriteInt(num, 16)
			PrintTable(t)
			net.WriteString(util.TableToJSON(t))
		net.SendToServer()
	end
end

local function IsValidUserGroup(val)
	for k, v in pairs(CAMI.GetUsergroups()) do
		if k == val then return true end
	end
	return false
end

local function PermMenu()

	currentPerson, currentGroup, currentEDS = false, false, false
	local boxes = {}

	local Frame = vgui.Create( "DFrame" )
	Frame:SetSize( 1000, 750 )
	Frame:Center()
	Frame:SetTitle( "Perm SWEPS" )
	Frame:SetVisible( true )
	Frame:SetDraggable( false )
	Frame:ShowCloseButton( true )
	Frame:MakePopup()

	// Multipurpose
	local steamid = vgui.Create( "DTextEntry", Frame ) 
	steamid:SetPos( 805, 55 )
	steamid:SetSize( 190, 20 )
	steamid:SetText( "" )
	steamid:SetVisible(false)
	steamid.OnEnter = function( self )
		local val = self:GetValue()
		if boxes.Player:IsVisible() then
	    	if val != "steam id" and string.Left(val, 5) == "STEAM" then
				currentPerson = val
				currentInventory = {}
				boxes.Player:SetValue( val )
				net.Start("PermSweps_GetInventoryFromServer")
					net.WriteString(currentPerson)
				net.SendToServer()
			else
				surface.PlaySound("buttons/button2.wav")
			end
		elseif boxes.Group:IsVisible() then
			if !IsValidUserGroup(val) then
				surface.PlaySound("buttons/button2.wav")
			else
				currentGroup = val
				currentInventory = {}
				boxes.Group:SetValue( val )
				net.Start("PermSweps_GetGroupInventoryFromServer")
					net.WriteString(currentGroup)
				net.SendToServer()
			end
		elseif boxes.EDS:IsVisible() then
			val = tonumber(val)
			if val > 100 or val < 1 then
				surface.PlaySound("buttons/button2.wav")
			else
				currentEDS = val
				currentInventory = {}
				boxes.EDS:SetValue( val )
				net.Start("PermSweps_GetEDSInventoryFromServer")
					net.WriteInt(val, 16)
				net.SendToServer()
			end
		end
	end

	// Pick from Players, Groups, EDS power
	boxes.Pick = vgui.Create( "DComboBox", Frame )
	boxes.Pick:SetPos( 5, 30 )
	boxes.Pick:SetSize( 990, 20 )
	boxes.Pick:SetValue( "Select" )

	boxes.Pick:AddChoice( "Player" )
	boxes.Pick:AddChoice( "Group" )
	boxes.Pick:AddChoice( "EDS" )

	boxes.Pick.OnSelect = function( panel, index, value )
		currentPerson, currentGroup, currentEDS = false, false, false
		for k, v in pairs(boxes) do
			if k == "Pick" then continue end
			if k == value then
				boxes[k]:SetVisible(true)
				steamid:SetVisible(true)
				steamid:SetText(thingToThing[k])
				currentMode = k
				if value == "EDS" then
					steamid:SetNumeric( true )
				else
					steamid:SetNumeric( false )
				end
			else
				boxes[k]:SetVisible(false)
			end
		end
	end

	// Players
	boxes.Player = vgui.Create( "DComboBox", Frame )
	boxes.Player:SetPos( 5, 55 )
	boxes.Player:SetSize( 800, 20 )
	boxes.Player:SetValue( "Player" )
	boxes.Player:SetVisible(false)
	for k, v in ipairs(player.GetHumans()) do
		boxes.Player:AddChoice( v:Nick() )
	end
	boxes.Player.OnSelect = function( panel, index, value )
		local did = false
		for k, v in ipairs(player.GetHumans()) do
			if value == v:Nick() then
				did = true
				currentPerson = v:SteamID()
				currentInventory = {}
				boxes.Player:SetValue( v:Nick() )
				net.Start("PermSweps_GetInventoryFromServer")
					net.WriteString(currentPerson)
				net.SendToServer()
			end
		end
		if !did then
			boxes.Player:Clear()
			boxes.Player:SetValue( "Player" )
			for k, v in ipairs(player.GetHumans()) do
				boxes.Player:AddChoice( v:Nick() )
			end
		end
	end

	// Groups
	boxes.Group = vgui.Create( "DComboBox", Frame )
	boxes.Group:SetPos( 5, 55 )
	boxes.Group:SetSize( 800, 20 )
	boxes.Group:SetValue( "Group" )
	boxes.Group:SetVisible(false)
	for k, v in pairs(CAMI.GetUsergroups()) do
		boxes.Group:AddChoice( k )
	end
	boxes.Group.OnSelect = function( panel, index, value )
		// do stuff here
		currentGroup = value
		currentInventory = {}
		boxes.Group:SetValue( value )
		net.Start("PermSweps_GetGroupInventoryFromServer")
			net.WriteString(currentGroup)
		net.SendToServer()
	end

	// EDS Power
	boxes.EDS = vgui.Create( "DComboBox", Frame )
	boxes.EDS:SetPos( 5, 55 )
	boxes.EDS:SetSize( 800, 20 )
	boxes.EDS:SetValue( "EDS" )
	boxes.EDS:SetVisible(false)
	for i=1, 100 do
		boxes.EDS:AddChoice( i )
	end
	boxes.EDS.OnSelect = function( panel, index, value )
		// do stuff here
		currentEDS = value
		currentInventory = {}
		boxes.EDS:SetValue( value )
		net.Start("PermSweps_GetEDSInventoryFromServer")
			net.WriteInt(value, 16)
		net.SendToServer()
	end

	perm.available = vgui.Create( "DListView", Frame )
	perm.available:SetPos( 5, 80 )
	perm.available:SetSize( 990, 300 )
	perm.available:SetMultiSelect( true )
	perm.available:AddColumn( "PrintName" )
	perm.available:AddColumn( "ClassName" )

	for k, v in ipairs(weaponList()) do
		perm.available:AddLine( v.PrintName, v.ClassName )
	end

	local TextEntry = vgui.Create( "DTextEntry", Frame ) 
	TextEntry:SetPos( 5, 385 )
	TextEntry:SetSize( 990, 20 )
	TextEntry:SetText( "" )
	TextEntry.OnTextChanged = function( self )
		perm.available:Clear()
		local val = string.lower(self:GetValue())

		for k, v in ipairs(weaponList()) do
			if string.find(string.lower(v.PrintName), val) or string.find(string.lower(v.ClassName), val) then
				perm.available:AddLine( v.PrintName, v.ClassName )
			end
		end
	end

	perm.inventory = vgui.Create( "DListView", Frame )
	perm.inventory:SetPos( 5, 445 )
	perm.inventory:SetSize( 990, 300 )
	perm.inventory:SetMultiSelect( true )
	perm.inventory:AddColumn( "PrintName" )
	perm.inventory:AddColumn( "ClassName" )

	local add = vgui.Create( "DButton", Frame )
	add:SetText( "Add" )				
	add:SetPos( 5, 410 )			
	add:SetSize( 60, 30 )				
	add.DoClick = function()
		if !currentPerson and !currentGroup and !currentEDS then surface.PlaySound("buttons/button2.wav") return end

		for k, line in pairs(perm.available:GetSelected()) do
			local class = line:GetValue(2)
			local name = line:GetValue(1)
			if !table.HasValue(currentInventory, class) then
				table.insert(currentInventory, class)
				perm.inventory:AddLine( name, class )
				perm.available:RemoveLine( line:GetID() )
			end
	    end	
	    if boxes.Player:IsVisible() then
	    	InventoryChanged(currentPerson, currentInventory)
		elseif boxes.Group:IsVisible() then
			GroupInventoryChanged(currentGroup, currentInventory)
		elseif boxes.EDS:IsVisible() then 
			EDSInventoryChanged(currentEDS, currentInventory)
		end
	end

	local remove = vgui.Create( "DButton", Frame )
	remove:SetText( "Remove" )				
	remove:SetPos( 65, 410 )			
	remove:SetSize( 60, 30 )				
	remove.DoClick = function()	
		if !currentPerson and !currentGroup and !currentEDS then surface.PlaySound("buttons/button2.wav") return end

		for k, line in pairs(perm.inventory:GetSelected()) do
			local class = line:GetValue(2)
			local name = line:GetValue(1)
			if table.HasValue(currentInventory, class) then
				table.RemoveByValue(currentInventory, class)
				perm.inventory:RemoveLine( line:GetID() )
				perm.available:AddLine( name, class )
			end
	    end		
	   	if boxes.Player:IsVisible() then
	    	InventoryChanged(currentPerson, currentInventory)
		elseif boxes.Group:IsVisible() then
			GroupInventoryChanged(currentGroup, currentInventory)
		elseif boxes.EDS:IsVisible() then 
			EDSInventoryChanged(currentEDS, currentInventory)
		end
	end

end

concommand.Add("perm_swep_menu", function(ply)
	if ply:IsSuperAdmin() then
		PermMenu()
	else
		ply:ChatPrint("No access!")
	end
end)

// Player
net.Receive("PermSweps_SendInventoryToClient", function(len)
	if currentMode != "Player" then return end

	local data = net.ReadString()

	currentInventory = util.JSONToTable(data)

//	print("t")
//	PrintTable(currentInventory)
//	print("t")

	perm.available:Clear()
	for k, v in ipairs(weaponList()) do
		perm.available:AddLine( v.PrintName, v.ClassName )
	end

	perm.inventory:Clear()
	for k, v in ipairs(getweaponsList()) do
		if table.HasValue(currentInventory, v.ClassName) then
			perm.inventory:AddLine(v.PrintName, v.ClassName)
		end
	end
end)

// Group
net.Receive("PermSweps_SendGroupInventoryToClient", function(len)
	if currentMode != "Group" then return end

	local data = net.ReadString()

	currentInventory = util.JSONToTable(data)

	perm.available:Clear()
	for k, v in ipairs(weaponList()) do
		perm.available:AddLine( v.PrintName, v.ClassName )
	end

	perm.inventory:Clear()
	for k, v in ipairs(getweaponsList()) do
		if table.HasValue(currentInventory, v.ClassName) then
			perm.inventory:AddLine(v.PrintName, v.ClassName)
		end
	end
end)

// EDS
net.Receive("PermSweps_SendEDSInventoryToClient", function(len)
	if currentMode != "EDS" then return end

	local data = net.ReadString()

	currentInventory = util.JSONToTable(data)

	perm.available:Clear()
	for k, v in ipairs(weaponList()) do
		perm.available:AddLine( v.PrintName, v.ClassName )
	end

	perm.inventory:Clear()
	for k, v in ipairs(getweaponsList()) do
		if table.HasValue(currentInventory, v.ClassName) then
			perm.inventory:AddLine(v.PrintName, v.ClassName)
		end
	end
end)

--PATH lua/autorun/rscpck_wpn_trails.lua:
WeaponTrail = WeaponTrail or {}
if SERVER then
    AddCSLuaFile("effect/trail.lua")
	AddCSLuaFile("effect/trail.Bone_Set.lua")
    util.AddNetworkString("weapontrail.PlayEffect" )
    util.AddNetworkString("weapontrail.StopEffect" )
elseif CLIENT then
    include("effect/trail.lua")
	include("effect/trail.Bone_Set.lua")
    WeaponTrail.EffectList = WeaponTrail.EffectList or {}


    hook.Add( "PostDrawOpaqueRenderables", "WeaponTrail.Effect", function()
        local EffectList = WeaponTrail.EffectList
        local ply = LocalPlayer()
        for v, k in pairs(EffectList) do
            if k.Owner:IsValid() then
                if k.Draw then
                    k:Draw()
                    if k.Draw == false then
                    table.remove(WeaponTrail.EffectList, v)
                        if k.EndEffect then
                            k:EndEffect(ply)
                        end
                    end

                end
                if k.DieTime - CurTime() <= 0 then

                    table.remove(WeaponTrail.EffectList, v)
                    if k.EndEffect then
                        k:EndEffect(ply)
                    end
                end
            else
                table.remove(WeaponTrail.EffectList, v)
            end
        end

    end)
    hook.Add("Think", "WeaponTrail.EffectThink", function()
    end)
end

local meta = FindMetaTable("Entity")

function meta:SetWeaponTrail(mat, _time, size, flag)
    local data = {}
    data.Mat = mat
    data.Owner = self
    data.Time = _time
    data.Size = size
    data.Flag = flag

    net.Start("weapontrail.PlayEffect")
        net.WriteTable(data)
    net.Broadcast()
end
function meta:StopWeaponTrail()
    local data = {}
    data.Owner = self
    net.Start("weapontrail.StopEffect")
        net.WriteTable(data)
    net.Broadcast()
end
net.Receive("weapontrail.PlayEffect", function(len)
    local Data = net.ReadTable()
    local effect = WeaponTrail.Eff
    if effect then
        effect.Owner = Data.Owner
        effect.Mat = Data.Mat
        effect.CustomTime = Data.Time
        effect.Size = Data.Size
        effect.Flag = Data.Flag
        effect.DieTime = Data.Time + CurTime()
        if Data.Owner:IsValid() then
            effect:InitEffect()
        end
        if Data.Time != -1 then
            WeaponTrail.EffectList[#WeaponTrail.EffectList+1] = table.Copy( effect )
        end
    end
end)
net.Receive("weapontrail.StopEffect", function(len)
    local Data = net.ReadTable()
    local EffectList = WeaponTrail.EffectList
    for v, k in pairs(EffectList) do
        if !Data.Other or Data.Other == false then
            if k.Owner == Data.Owner then
                table.remove(WeaponTrail.EffectList, v)
            end
        elseif Data.Other == true then
            k.EndTime = 0
        end
    end
end)

--PATH addons/sam-157/lua/sam/libs/sh_types.lua:
if SAM_LOADED then return end

-- https://gist.github.com/CapsAdmin/0d9c1e77d0fc22d910e182bfeb9812e5
local getmetatable = getmetatable

do
	local types = {
		["string"] = "",
		["boolean"] = true,
		["number"] = 0,
		["function"] = function() end,
		["thread"] = coroutine.create(getmetatable),
		["Color"] = Color(0, 0, 0),
	}

	for k, v in pairs(types) do
		if not getmetatable(v) then
			debug.setmetatable(v, {MetaName = k})
		else
			getmetatable(v).MetaName = k
		end
	end
end

function sam.type(value)
	if value == nil then
		return "nil"
	end
	local meta = getmetatable(value)
	if meta then
		meta = meta.MetaName
		if meta then
			return meta
		end
	end
	return "table"
end

do
	local function add(name)
		local new_name = name
		if name == "bool" then
			new_name = "boolean"
		end
		sam["is" .. name:lower()] = function(value)
			local meta = getmetatable(value)
			if meta and meta.MetaName == new_name then
				return true
			else
				return false
			end
		end
	end

	add("string")
	add("number")
	add("bool")
	add("function")

	add("Angle")
	add("Vector")
	add("Panel")
	add("Matrix")
end

function sam.isentity(value)
	local meta = getmetatable(value)
	if meta then
		if meta.MetaName == "Entity" then
			return true
		end
		meta = meta.MetaBaseClass
		if meta then
			return meta.MetaName == "Entity"
		end
	end
	return false
end
sam.IsEntity = sam.isentity

local type = sam.type
function sam.istable(value)
	return type(value) == "table"
end
--PATH addons/sam-157/lua/sam_language.lua:
return "english"
--PATH addons/sam-157/lua/sam/sh_restrictions.lua:
if SAM_LOADED then return end

local loaded = false
local load_restrictions = function()
	local sam = sam
	local config = sam.config
	local hook = hook
	local SERVER = SERVER

	if CLIENT then
		local add_setting = function(body, title, key)
			local setting = body:Add("SAM.LabelPanel")
			setting:Dock(TOP)
			setting:SetLabel(title)

			local enable = setting:Add("SAM.ToggleButton")
			enable:SetConfig(key, true)

			return setting
		end

		config.add_menu_setting("Restrictions", function(body)
			local setting = body:Add("SAM.LabelPanel")
			setting:Dock(TOP)
			setting:DockMargin(8, 6, 8, 0)
			setting:SetLabel("Restrictions (Check these settings in ranks' permissions)")

			local setting_body = body:Add("Panel")
			setting_body:Dock(TOP)
			setting_body:DockMargin(8, 6, 8, 0)
			setting_body:DockPadding(8, 0, 8, 0)

			add_setting(setting_body, "Tool (Eg. using button tool)", "Restrictions.Tool")
			add_setting(setting_body, "Spawning (Eg. spawning props)", "Restrictions.Spawning")
			add_setting(setting_body, "Limits (Eg. how many props can you spawn)", "Restrictions.Limits")

			function setting_body:PerformLayout()
				setting_body:SizeToChildren(false, true)
			end
		end)
	end

	local tools = weapons.GetStored("gmod_tool")
	if sam.istable(tools) then
		if config.get("Restrictions.Tool", true) then
			for k, v in pairs(tools.Tool) do
				sam.permissions.add(v.Mode, "Tools - " .. (v.Category or "Other"), "user")
			end

			hook.Add("CanTool", "SAM.Module.Restrictions", function(ply, _, tool)
				if not ply:HasPermission(tool) then
					if CLIENT and sam.player.check_cooldown(ply, "ToolNoPermission", 0.1) then
						ply:sam_send_message("You don't have permission to use this tool.")
					end
					return false
				end
			end)
		else
			for k, v in pairs(tools.Tool) do
				sam.permissions.remove(v.Mode)
			end

			hook.Remove("CanTool", "SAM.Module.Restrictions")
		end
	end

	sam.permissions.add("admin_weapons", "Spawning", "superadmin")

	local function no_permission(ply, name)
		ply:sam_play_sound("buttons/button10.wav")
		ply:sam_send_message("You don't have permission to spawn {S Blue}.", {
			S = name
		})
	end

	local spawning = {
		PlayerSpawnProp = {
			name = "props",
			permission = "user",
			call_gm = true,
		},
		PlayerGiveSWEP = {
			name = "give_weapons",
			cb = function(_, ply, _, wep)
				if wep.sam_AdminOnly and not ply:HasPermission("admin_weapons") then
					no_permission(ply, "admin weapons")
					return false
				end
				return true
			end,
			hook = sam.hook_first,
		},
		PlayerSpawnSWEP = {
			name = "spawn_weapons",
			cb = function(_, ply, _, wep)
				if wep.sam_AdminOnly and not ply:HasPermission("admin_weapons") then
					no_permission(ply, "admin weapons")
					return false
				end
				return true
			end,
			hook = sam.hook_first,
		},
		-- PlayerSpawnSENT = {
		-- 	name = "entities",
		-- 	check_limit = "sents"
		-- },
		PlayerSpawnNPC = {
			name = "npcs",
			check_limit = "npcs",
		},
		PlayerSpawnVehicle = {
			name = "vehicles",
			check_limit = "vehicles",
		},
		PlayerSpawnRagdoll = {
			name = "ragdolls",
			permission = "user",
			check_limit = "ragdolls",
		}
	}

	local override_lists = {
		"Weapon",
		-- "SpawnableEntities"
	}

	local function LimitReachedProcess(ply, str)
		if not IsValid(ply) then return true end
		return ply:CheckLimit(str)
	end

	local GAMEMODE = GAMEMODE
	if config.get("Restrictions.Spawning", true) then
		for k, v in pairs(spawning) do
			local name = v
			local permission = "superadmin"
			local check
			local check_limit
			local hook = sam.hook_last
			if istable(v) then
				name = v.name
				permission = v.permission or permission
				if v.call_gm then
					check = GAMEMODE[k]
				elseif v.cb then
					check = v.cb
				end
				hook = v.hook or hook
				check_limit = v.check_limit
			end

			sam.permissions.add(name, "Spawning", permission)

			if SERVER then
				hook(k, "SAM.Spawning." .. k .. name, function(ply, ...)
					if not ply:HasPermission(name) then
						no_permission(ply, name)
						return false
					end

					if check_limit then
						return LimitReachedProcess(ply, check_limit)
					end

					if check then
						return check(GAMEMODE, ply, ...)
					end

					return true
				end)
			end
		end

		for i = 1, #override_lists do
			for k, v in pairs(list.GetForEdit(override_lists[i])) do
				v.sam_AdminOnly = v.sam_AdminOnly or v.AdminOnly
				v.AdminOnly = false
			end
		end
	else
		sam.permissions.add("admin_weapons")

		for k, v in pairs(spawning) do
			sam.permissions.remove(istable(v) and v.name or v)

			if SERVER then
				hook.Remove(k, "SAM.Spawning." .. k)
			end
		end

		for i = 1, #override_lists do
			for k, v in pairs(list.GetForEdit(override_lists[i])) do
				if v.sam_AdminOnly then
					v.AdminOnly = v.sam_AdminOnly
				end
			end
		end
	end

	local PLAYER = FindMetaTable("Player")
	if config.get("Restrictions.Limits", true) then
		local get_limit = sam.ranks.get_limit
		function PLAYER:GetLimit(limit_type)
			return get_limit(self:GetUserGroup(), limit_type)
		end

		sam.hook_first("PlayerCheckLimit", "SAM.PlayerCheckLimit", function(ply, limit_type, count)
			local ply_limit = ply:GetLimit(limit_type)
			if ply_limit < 0 then return true end

			if count > ply_limit - 1 then
				return false
			end

			return true
		end)

		sam.limit_types = {}
		for _, limit_type in SortedPairs(cleanup.GetTable(), true) do
			local cvar = GetConVar("sbox_max" .. limit_type)
			if cvar then
				table.insert(sam.limit_types, limit_type)
			end
		end
	else
		sam.limit_types = nil
		PLAYER.GetLimit = nil
		hook.Remove("PlayerCheckLimit", "SAM.PlayerCheckLimit")
	end

	if not loaded then
		loaded = true
		hook.Call("SAM.LoadedRestrictions")
	end
end

timer.Simple(5, function()
	if GAMEMODE.IsSandboxDerived then
		sam.config.hook({"Restrictions.Tool", "Restrictions.Spawning", "Restrictions.Limits"}, load_restrictions)
	end
end)

--PATH addons/sam-157/lua/sam/menu/sh_init.lua:
if SAM_LOADED then return end

require("sui")

sam.command.new("menu")
	:Help("Open admin mod menu")
	:MenuHide()
	:DisableNotify()
	:OnExecute(function(ply)
		sam.netstream.Start(ply, "OpenMenu")
	end)
:End()

if CLIENT then
	sam.netstream.Hook("OpenMenu", function()
		sam.menu.open_menu()
	end)
end

if SERVER then
	for _, f in ipairs(file.Find("sam/menu/tabs/*.lua", "LUA")) do
		sam.load_file("sam/menu/tabs/" .. f)
	end
end
--PATH addons/sui/lua/includes/modules/sui.lua:
if sui then return end

AddCSLuaFile()

sui = {}

do
	local wspace_chs = {} -- whitespace  characters except a normal space " "
	for k, v in ipairs({0x0c, 0x0a, 0x0d, 0x09, 0x0b}) do
		wspace_chs[string.char(v)] = true
	end
	sui.wspace_chs = wspace_chs

	local cntrl_chs = {string.char(0x7f)} -- control characters
	for i = 0x00, 0x1f do
		cntrl_chs[string.char(i)] = true
	end
	sui.cntrl_chs = cntrl_chs
end

if SERVER then
	AddCSLuaFile("sui/libs/tdlib/cl_tdlib.lua")
	AddCSLuaFile("sui/libs/bshadows.lua")
	AddCSLuaFile("sui/libs/gif_loader.lua")
	AddCSLuaFile("sui/libs/png_encoder.lua")
	AddCSLuaFile("sui/libs/types.lua")
	AddCSLuaFile("sui/cl_base.lua")
else
	include("sui/libs/tdlib/cl_tdlib.lua")
	include("sui/libs/bshadows.lua")
	include("sui/libs/types.lua")
	include("sui/cl_base.lua")
end

if SERVER then
	for _, f in ipairs(file.Find("sui/vgui/*.lua", "LUA")) do
		AddCSLuaFile("sui/vgui/" .. f)
	end
end
--PATH addons/sui/lua/sui/libs/bshadows.lua:
local ScrW = ScrW
local ScrH = ScrH

local sin = math.sin
local cos = math.cos
local rad = math.rad
local ceil = math.ceil

local Start2D = cam.Start2D
local End2D = cam.End2D

local PushRenderTarget = render.PushRenderTarget
local OverrideAlphaWriteEnable = render.OverrideAlphaWriteEnable
local Clear = render.Clear
local CopyRenderTargetToTexture = render.CopyRenderTargetToTexture
local BlurRenderTarget = render.BlurRenderTarget
local PopRenderTarget = render.PopRenderTarget
local SetMaterial = render.SetMaterial
local DrawScreenQuadEx = render.DrawScreenQuadEx
local DrawScreenQuad = render.DrawScreenQuad

local RenderTarget, RenderTarget2
local load_render_targets = function()
	local w, h = ScrW(), ScrH()
	RenderTarget = GetRenderTarget("sui_bshadows_original" .. w .. h, w, h)
	RenderTarget2 = GetRenderTarget("sui_bshadows_shadow" .. w .. h,  w, h)
end
load_render_targets()
hook.Add("OnScreenSizeChanged", "SUI.BShadows", load_render_targets)

local ShadowMaterial = CreateMaterial("sui_bshadows", "UnlitGeneric", {
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["alpha"] = 1
})

local ShadowMaterialGrayscale = CreateMaterial("sui_bshadows_grayscale", "UnlitGeneric", {
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["$alpha"] = 1,
	["$color"] = "0 0 0",
	["$color2"] = "0 0 0"
})

local SetTexture = ShadowMaterial.SetTexture

local BSHADOWS = {}

BSHADOWS.BeginShadow = function()
	PushRenderTarget(RenderTarget)

	OverrideAlphaWriteEnable(true, true)
	Clear(0, 0, 0, 0)
	OverrideAlphaWriteEnable(false, false)

	Start2D()
end

BSHADOWS.EndShadow = function(intensity, spread, blur, opacity, direction, distance, _shadowOnly)
	opacity = opacity or 255
	direction = direction or 0
	distance = distance or 0

	CopyRenderTargetToTexture(RenderTarget2)

	if blur > 0 then
		OverrideAlphaWriteEnable(true, true)
		BlurRenderTarget(RenderTarget2, spread, spread, blur)
		OverrideAlphaWriteEnable(false, false)
	end

	PopRenderTarget()

	SetTexture(ShadowMaterial, "$basetexture", RenderTarget)
	SetTexture(ShadowMaterialGrayscale, "$basetexture", RenderTarget2)

	local xOffset = sin(rad(direction)) * distance
	local yOffset = cos(rad(direction)) * distance

	SetMaterial(ShadowMaterialGrayscale)
	for i = 1, ceil(intensity) do
		DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
	end

	if not _shadowOnly then
		SetTexture(ShadowMaterial, "$basetexture", RenderTarget)
		SetMaterial(ShadowMaterial)
		DrawScreenQuad()
	end

	End2D()
end

sui.BSHADOWS = BSHADOWS
--PATH addons/sam-157/lua/sam/menu/cl_init.lua:
if SAM_LOADED then return end

local vgui = vgui
local draw = draw

local sam = sam
local sui = sui
local TDLib = sui.TDLib

local config = sam.config

do
	local funcs = {
		["SAM.ComboBox"] = {
			event = "OnSelect",
			function(s, _, value)
				config.set(s.config_key, value)
			end
		},
		["SAM.TextEntry"] = {
			event = "OnEnter",
			function(s)
				local v = s:GetText()
				if s:GetNumeric() then
					v = tonumber(v)
				end
				config.set(s.config_key, v)
			end
		},
		["SAM.ToggleButton"] = {
			event = "OnChange",
			function(s, v)
				config.set(s.config_key, v)
			end
		}
	}

	sam.SUI = sam.SUI or sui.new("SAM", true, {
		SetConfig = function(s, key, default)
			s.config_key = key

			local i = config.hook({key}, function(value, old)
				local v = config.get(key, default)
				s:SetValue(v)
			end)

			local t = funcs[s:GetName()]
			s[t.event] = t[1]

			s:On("OnRemove", function()
				config.remove_hook(i)
			end)
		end
	})
end

local SUI = sam.SUI
local GetColor = SUI.GetColor

sam.menu = {}

local tabs = {}
function sam.menu.add_tab(icon, func, check, pos)
	local tab = {
		icon = icon,
		func = func,
		check = check,
		pos = pos
	}
	for k, v in ipairs(tabs) do
		if v.icon == icon then
			tabs[k] = tab
			return
		end
	end
	table.insert(tabs, tab)
end

function sam.menu.remove_tab(name)
	for k, v in ipairs(tabs) do
		if v.name == name then
			table.remove(tabs, k)
			break
		end
	end
end

SAM_TAB_TITLE_FONT = SUI.CreateFont("TabTitle", "Roboto Bold", 22)
SAM_TAB_DESC_FONT = SUI.CreateFont("TabDesc", "Roboto Medium", 15)

local MENU_LOADING = SUI.CreateFont("MenuLoading", "Roboto", 30)

SUI.AddToTheme("Dark", {
	frame = "#181818",

	scroll_panel = "#181818",

	menu_tabs_title = "#ffffff",

	--=--
	player_list_titles = "#f2f1ef",

	player_list_names = "#eeeeee",
	player_list_names_2 = "#ff6347",
	player_list_data = "#e8e8e8",

	player_list_rank = "#41b9ff",
	player_list_console = "#00c853",
	player_list_rank_text = "#2c3e50",

	player_list_steamid = "#a4a4a4",
	--=--

	--=--
	actions_button = Color(0, 0, 0, 0),
	actions_button_hover = Color(200, 200, 200, 60),

	actions_button_icon = "#aaaaaa",
	actions_button_icon_hover = "#ffffff",
	--=--

	--=--
	page_switch_bg = "#222222",
	--=--
})

SUI.SetTheme("Dark")

function SUI.panels.Frame:Paint(w, h)
	if GetColor("frame_blur") then
		TDLib.BlurPanel(self)
	end

	draw.RoundedBox(8, 0, 0, w, h, GetColor("frame"))
end

function SUI.panels.Frame:HeaderPaint(w, h)
	draw.RoundedBoxEx(8, 0, 0, w, h, GetColor("header"), true, true, false, false)
	draw.RoundedBox(0, 0, h - 1, w, 1, GetColor("line"))
end

do
	function sam.menu.add_loading_panel(parent)
		local is_loading = false

		local loading_panel = parent:Add("Panel")
		loading_panel:SetVisible(false)
		loading_panel:SetZPos(999999)
		loading_panel:SetMouseInputEnabled(false)

		function loading_panel:Paint(w, h)
			draw.RoundedBox(3, 0, 0, w, h, Color(50, 50, 50, 200))
			draw.SimpleText(string.rep(".", (CurTime() * 3) % 3), MENU_LOADING, w/2, h/2, Color(200, 200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		parent:SUI_TDLib()
		parent:On("PerformLayout", function(s, w, h)
			loading_panel:SetSize(w, h)
		end)

		local first = true
		local toggle_loading = function(bool)
			if not IsValid(loading_panel) then return end

			is_loading = bool or not is_loading
			if is_loading and not first then
				loading_panel:SetVisible(is_loading and true or false)
				loading_panel:SetMouseInputEnabled(is_loading)
			else
				timer.Simple(0.2, function()
					if not IsValid(loading_panel) then return end
					loading_panel:SetVisible(is_loading and true or false)
					loading_panel:SetMouseInputEnabled(is_loading)
				end)
			end

			first = false
		end

		return toggle_loading, function()
			return is_loading
		end
	end
end

local sam_menu
function sam.menu.open_menu()
	if IsValid(sam_menu) then
		return sam_menu:IsVisible() and sam_menu:Hide() or sam_menu:Show()
		-- sam_menu:Remove()
	end

	sam_menu = vgui.Create("SAM.Frame")
	sam_menu:Center()
	sam_menu:MakePopup()
	sam_menu:SetTitle("SAM")

	sam_menu:AddAnimations(800, 600)

	sam_menu.close.DoClick = function()
		sam_menu:Hide()
	end

	local sheet = sam_menu:Add("SAM.ColumnSheet")
	sheet:Dock(FILL)
	sheet:InvalidateParent(true)
	sheet:InvalidateLayout(true)
	sheet.Paint = nil

	local tab_scroller = sheet.tab_scroller
	tab_scroller:DockMargin(0, 1, 0, 1)

	function tab_scroller:Paint(w, h)
		draw.RoundedBoxEx(8, 0, 0, w, h, GetColor("column_sheet_bar"), false, false, true, false)
	end

	local sheets = {}
	for _, v in SortedPairsByMemberValue(tabs, "pos") do
		sheets[v.icon] = sheet:AddSheet(v.icon, v.func)
	end

	tab_scroller = tab_scroller:GetCanvas()
	sam_menu:On("Think", function()
		for _, v in ipairs(tabs) do
			local tab = sheets[v.icon]
			if v.check and not v.check() then
				if tab:IsVisible() then
					tab:SetVisible(false)
					if sheet:GetActiveTab() == tab then
						sheet:SetActiveTab(sheet.tabs[1])
					end
					tab_scroller:InvalidateLayout()
				end
			elseif not tab:IsVisible() then
				tab:SetVisible(true)
				tab_scroller:InvalidateLayout()
			end
		end
	end)
end

function sam.menu.get()
	return sam_menu
end

hook.Add("GUIMouseReleased", "SAM.CloseMenu", function(mouse_code)
	local panel = vgui.GetHoveredPanel()
	if mouse_code == MOUSE_LEFT and panel == vgui.GetWorldPanel() and IsValid(sam_menu) and sam_menu:HasHierarchicalFocus() then
		sam_menu:Hide()
	end
end)

for _, f in ipairs(file.Find("sam/menu/tabs/*.lua", "LUA")) do
	sam.load_file("sam/menu/tabs/" .. f, "sh")
end
--PATH addons/sam-157/lua/sui/vgui/sam_player_line.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local TDLib = sui.TDLib
local draw_material = sui.draw_material
local lerp_color = sui.lerp_color

local GetColor = SUI.GetColor
local RoundedBox = TDLib.RoundedBox
local CircleAvatar = TDLib.LibClasses.CircleAvatar
local CircleClick2 = TDLib.LibClasses.CircleClick2

local PLAYER_LINE_NAME = SUI.CreateFont("PlayerLineName", "Roboto Bold", 17)
local PLAYER_LINE_RANK = SUI.CreateFont("PlayerLineRank", "Roboto Bold", 13)
local PLAYER_LINE_STEAMID = SUI.CreateFont("PlayerLineSteamID", "Roboto Medium", 12)

local PANEL = {}

function PANEL:Init()
	local size = SUI.Scale(34)

	self:Dock(TOP)
	self:SetTall(size)

	self.size = size
end

local rank_Paint = function(s, w, h)
	RoundedBox(s.rect, SUI.Scale(10), 0, 0, w, h, s.col)
end

function PANEL:SetInfo(info)
	local size = self.size

	local container
	do
		local w = SUI.Scale(280) + size

		local _container = self:Add("Panel")
		_container:Dock(LEFT)
		_container:SetMouseInputEnabled(false)
		_container:SetWide(w)

		container = _container:Add("Panel")
		container:SetSize(w, size)

		function _container:PerformLayout()
			container:Center()
		end
	end

	do
		local avatar = container:Add("Panel")
		avatar:Dock(LEFT)
		avatar:DockMargin(0, 0, 5, 0)
		avatar:SetWide(size)
		avatar:SetMouseInputEnabled(false)
		CircleAvatar(avatar)

		avatar:SetSteamID(util.SteamIDTo64(info.steamid), size)
	end

	do
		local top_container = container:Add("Panel")
		top_container:Dock(TOP)
		top_container:DockMargin(0, 0, 0, 2)

		local name = top_container:Add("SAM.Label")
		name:Dock(LEFT)
		name:SetFont(PLAYER_LINE_NAME)
		self.name = name

		local pname = info.name
		if not pname or pname == "" then
			name:SetTextColor(GetColor("player_list_names_2"))
			self:SetName("N/A")
		else
			name:SetTextColor(GetColor("player_list_names"))
			self:SetName(pname)
		end

		if info.rank then
			local rank_bg = top_container:Add("Panel")
			rank_bg:Dock(LEFT)
			rank_bg:DockMargin(5, 0, 0, 0)

			rank_bg.rect = {}
			rank_bg.col = info.rank_bg or GetColor("player_list_rank")
			rank_bg.Paint = rank_Paint

			local rank = rank_bg:Add("SAM.Label")
			rank:Dock(FILL)
			rank:DockMargin(SUI.Scale(8), 0, 0, 0)
			rank:SetTextColor(GetColor("player_list_rank_text"))
			rank:SetFont(PLAYER_LINE_RANK)
			rank.bg = rank_bg

			self.rank = rank
			self:SetRank(info.rank)

			rank_bg:SetSize(rank:GetTextSize() + SUI.Scale(8) * 2)
		end

		top_container:SizeToChildren(true, true)
	end

	local steamid = container:Add("SAM.Label")
	steamid:Dock(TOP)
	steamid:SetTextColor(GetColor("player_list_steamid"))
	steamid:SetFont(PLAYER_LINE_STEAMID)
	steamid:SetText(info.steamid)
	steamid:SizeToContents()
	steamid:SetAutoStretchVertical(true)

	self.container = container
end

function PANEL:SetName(new_name)
	local name =  self.name
	name:SetText(new_name)
	name:SizeToContents()
	if name:GetWide() > 160 then
		name:SetWide(158)
	end
end

function PANEL:SetRank(new_rank)
	local rank = self.rank
	rank:SetText(new_rank)
	rank:SizeToContents()
	rank.bg:SetSize(rank:GetTextSize() + SUI.Scale(8) * 2)
end

function PANEL:Actions()
	local container
		do
		local size = self.size

		local _container = self:Add("Panel")
		_container:Dock(RIGHT)
		_container:SetWide(size)

		container = _container:Add("Panel")
		container:SetSize(size, size)

		function _container:PerformLayout()
			container:Center()
		end
	end

	local actions_button = container:Add("SAM.Button")
	actions_button:SetText("")
	actions_button:ClearPaint()

	function container:PerformLayout(w, h)
		actions_button:SetSize(h, h)
		actions_button:Center()
	end

	local image = actions_button:Add("SAM.Image")
	image:Dock(FILL)
	image:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/dots_verticle.png")

	local current_icon_color = Color(GetColor("actions_button_icon"):Unpack())
	function image:Draw(w, h)
		if not h then return end

		if actions_button.Hovered then
			lerp_color(current_icon_color, GetColor("actions_button_icon_hover"))
		else
			lerp_color(current_icon_color, GetColor("actions_button_icon"))
		end

		draw_material(nil, w / 2, h / 2, SUI.ScaleEven(20), current_icon_color)
	end

	CircleClick2(actions_button, Color(62, 62, 62), 10)
	actions_button:Center()

	return actions_button
end

sui.register("PlayerLine", PANEL, "Panel")
--PATH addons/sam-157/lua/sam/modules/support_cami.lua:
if SAM_LOADED then return end

local ranks_loaded
if SERVER then
	ranks_loaded = sam.ranks.ranks_loaded()
else
	ranks_loaded = sam.get_global("Ranks") ~= nil
end

do
	local load_ranks = function()
		for name, rank in pairs(sam.ranks.get_ranks()) do
			if not sam.ranks.is_default_rank(name) then
				CAMI.RegisterUsergroup({Name = name, Inherits = rank.inherit}, "SAM")
			end
		end
	end

	if ranks_loaded then
		load_ranks()
	else
		hook.Add("SAM.LoadedRanks", "SAM.CAMI.LoadRanksToCAMI", load_ranks)
	end
end

hook.Add("SAM.AddedRank", "SAM.CAMI.AddedRank", function(name, rank)
	if not sam.ranks.is_default_rank(name) then
		CAMI.RegisterUsergroup({Name = name, Inherits = rank.inherit}, "SAM")
	end
end)

hook.Add("SAM.RemovedRank", "SAM.CAMI.RemovedRank", function(name)
	CAMI.UnregisterUsergroup(name, "SAM")
end)

hook.Add("SAM.RankNameChanged", "SAM.CAMI.RankNameChanged", function(old, new)
	CAMI.UnregisterUsergroup(old, "SAM")
	CAMI.RegisterUsergroup({Name = new, Inherits = sam.ranks.get_rank(new).inherit}, "SAM")
end)

hook.Add("SAM.ChangedPlayerRank", "SAM.CAMI.ChangedPlayerRank", function(ply, new_rank, old_rank)
	CAMI.SignalUserGroupChanged(ply, old_rank, new_rank, "SAM")
end)

hook.Add("SAM.ChangedSteamIDRank", "SAM.CAMI.ChangedSteamIDRank", function(steamid, new_rank, old_rank)
	CAMI.SignalSteamIDUserGroupChanged(steamid, old_rank, new_rank, "SAM")
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

if SERVER then
	do
		local on_user_group_registered = function(rank, source)
			if source ~= "SAM" then
				sam.ranks.add_rank(rank.Name, sam.ranks.is_rank(rank.Inherits) and rank.Inherits or "user")
			end
		end

		local load_ranks = function()
			for _, rank in pairs(CAMI.GetUsergroups()) do
				on_user_group_registered(rank, "CAMI")
			end
			hook.Add("CAMI.OnUsergroupRegistered", "SAM.CAMI.OnUsergroupRegistered", on_user_group_registered)
		end

		if ranks_loaded then
			load_ranks()
		else
			hook.Add("SAM.LoadedRanks", "SAM.CAMI.LoadRanksFromCAMI", load_ranks)
		end
	end

	hook.Add("CAMI.OnUsergroupUnregistered", "SAM.CAMI.OnUsergroupUnregistered", function(rank, source)
		if source ~= "SAM" then
			sam.ranks.remove_rank(rank.Name)
		end
	end)

	hook.Add("CAMI.PlayerUsergroupChanged", "SAM.CAMI.PlayerUsergroupChanged", function(ply, _, new_rank, source)
		if ply and IsValid(ply) and source ~= "SAM" then
			sam.player.set_rank(ply, new_rank)
		end
	end)

	hook.Add("CAMI.SteamIDUsergroupChanged", "SAM.CAMI.SteamIDUsergroupChanged", function(steamid, _, new_rank, source)
		if sam.is_steamid(steamid) and source ~= "SAM" then
			sam.player.set_rank_id(steamid, new_rank)
		end
	end)
end

do
	local on_privilege_registered = function(privilege)
		sam.permissions.add(privilege.Name, "CAMI", privilege.MinAccess)
	end

	local load_privileges = function()
		for _, privilege in pairs(CAMI.GetPrivileges()) do
			on_privilege_registered(privilege)
		end
		hook.Add("CAMI.OnPrivilegeRegistered", "SAM.CAMI.OnPrivilegeRegistered", on_privilege_registered)
	end

	if ranks_loaded then
		load_privileges()
	else
		hook.Add("SAM.LoadedRanks", "SAM.CAMI.LoadPrivileges", load_privileges)
	end
end

hook.Add("CAMI.OnPrivilegeUnregistered", "SAM.CAMI.OnPrivilegeUnregistered", function(privilege)
	sam.permissions.remove(privilege.Name)
end)

hook.Add("CAMI.PlayerHasAccess", "SAM.CAMI.PlayerHasAccess", function(ply, privilege, callback, target)
	if sam.type(ply) ~= "Player" then return end

	local has_permission = ply:HasPermission(privilege)
	if sam.type(target) == "Player" then
		callback(has_permission and ply:CanTarget(target))
	else
		callback(has_permission)
	end

	return true
end)

--PATH addons/sam-157/lua/sam/cl_adverts.lua:
if SAM_LOADED then return end

local sam = sam
local config = sam.config

local times = {}

local entry_OnValueChange = function(s)
	s:SetTall(s:GetNumLines() * (sam.SUI.Scale(16) --[[font size]] + 1) + 1 + 2)
end

local entry_OnEnter = function(s)
	local ads = config.get("Adverts")
	local txt = s:GetText()
	if txt == "" then
		s:Remove()
		if s.i then
			table.remove(ads, s.i)
		end
	else
		if txt == s.ad then return end
		ads[s.i] = txt
		s.ad = txt
	end
	config.set("Adverts", ads, true)
end

local entry_OnKeyCodeTyped = function(s, code)
	if code == KEY_ENTER then
		s:old_OnKeyCodeTyped(code)
		return true
	else
		return s:old_OnKeyCodeTyped(code)
	end
end

config.add_menu_setting("Adverts", function(body)
	local adverts_body

	local adverts = body:Add("SAM.LabelPanel")
	adverts:Dock(TOP)
	adverts:DockMargin(8, 6, 8, 0)
	adverts:SetLabel("Adverts\n- Random adverts print every 60 seconds\n- Timed adverts can be done like this: {1m} This advert prints every 1 minute")

	local add_advert = adverts:Add("SAM.Button")
	add_advert:SetText("+")
	add_advert:SetSize(25, 25)

	local zpos = 0
	local add_func = function(ad, ad_i)
		zpos = zpos + 1

		local entry = adverts_body:Add("SAM.TextEntry")
		entry:SetPlaceholder("")
		entry:SetMultiline(true)
		entry:SetNoBar(true)
		entry:Dock(TOP)
		entry:DockMargin(8, 6, 8, 0)
		entry:SetZPos(zpos)
		entry.ad = ad
		entry.no_scale = true

		if not sam.ispanel(ad) then
			entry.i = ad_i
			entry:SetValue(ad)
		else
			entry.i = #config.get("Adverts") + 1
		end

		entry.OnValueChange = entry_OnValueChange
		entry.OnEnter = entry_OnEnter
		entry.old_OnKeyCodeTyped = entry.OnKeyCodeTyped
		entry.OnKeyCodeTyped = entry_OnKeyCodeTyped
	end
	add_advert:On("DoClick", add_func)

	adverts_body = body:Add("Panel")
	adverts_body:Dock(TOP)

	function adverts_body:PerformLayout(w, h)
		for k, v in ipairs(self:GetChildren()) do
			entry_OnValueChange(v)
		end
		self:SizeToChildren(false, true)
	end

	sam.config.hook({"Adverts"}, function()
		if not IsValid(adverts_body) then return end
		adverts_body:Clear()

		for k, v in ipairs(config.get("Adverts")) do
			add_func(v, k)
		end
	end)
end)

local random = {}

timer.Create("SAM.Advert.RandomAdverts", 60, 0, function()
	local ad = random[math.random(1, #random)]
	if not ad then return end
	sam.player.send_message(nil, ad)
end)

sam.config.hook({"Adverts"}, function()
	for i = #times, 1, -1 do
		times[i] = nil
		timer.Remove("SAM.Adverts." .. i)
	end

	random = {}
	for k, v in ipairs(config.get("Adverts")) do
		if v:sub(1, 1) == "{" then
			local time, message = v:match("(%b{}) *(.*)")
			time = sam.parse_length(time)
			if time then
				timer.Create("SAM.Adverts." .. table.insert(times, true), time * 60, 0, function()
					sam.player.send_message(nil, message)
				end)
			else
				table.insert(random, v)
			end
		else
			table.insert(random, v)
		end
	end
end)

--PATH addons/sui/lua/sui/vgui/sui_label.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local MOUSE_LEFT = MOUSE_LEFT

local SysTime = SysTime

local PANEL = {}

AccessorFunc(PANEL, "m_colText", "TextColor")
AccessorFunc(PANEL, "m_colTextStyle", "TextStyleColor")
AccessorFunc(PANEL, "m_FontName", "Font")

AccessorFunc(PANEL, "m_bDoubleClicking", "DoubleClickingEnabled", FORCE_BOOL)
AccessorFunc(PANEL, "m_bAutoStretchVertical", "AutoStretchVertical", FORCE_BOOL)
AccessorFunc(PANEL, "m_bIsMenuComponent", "IsMenu", FORCE_BOOL)

AccessorFunc(PANEL, "m_bBackground", "PaintBackground",	FORCE_BOOL)
AccessorFunc(PANEL, "m_bBackground", "DrawBackground",	FORCE_BOOL)
AccessorFunc(PANEL, "m_bDisabled", "Disabled", FORCE_BOOL)

AccessorFunc(PANEL, "m_bIsToggle", "IsToggle", FORCE_BOOL)
AccessorFunc(PANEL, "m_bToggle", "Toggle", FORCE_BOOL)

AccessorFunc(PANEL, "m_bBright", "Bright", FORCE_BOOL)
AccessorFunc(PANEL, "m_bDark", "Dark", FORCE_BOOL)
AccessorFunc(PANEL, "m_bHighlight",	"Highlight", FORCE_BOOL)

PANEL:SetIsToggle(false)
PANEL:SetToggle(false)
PANEL:SetDisabled(false)
PANEL:SetDoubleClickingEnabled(true)

local Panel = FindMetaTable("Panel")
local SetMouseInputEnabled = Panel.SetMouseInputEnabled
local SetPaintBackgroundEnabled = Panel.SetPaintBackgroundEnabled
local SetPaintBorderEnabled = Panel.SetPaintBorderEnabled
local InvalidateLayout = Panel.InvalidateLayout
local SetFGColor = Panel.SetFGColor
function PANEL:Init()
	SetMouseInputEnabled(self, false)
	SetPaintBackgroundEnabled(self, false)
	SetPaintBorderEnabled(self, false)
end

function PANEL:AllowScale()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function PANEL:ScaleChanged()
	self:SizeToContents()
end

function PANEL:SetFont(font)
	if self.m_FontName == font then return end

	self.m_FontName = font
	self:SetFontInternal(self.m_FontName)
end

function PANEL:SetTextColor(col)
	if self.m_colText == col then return end

	self.m_colText = col
	SetFGColor(self, col.r, col.g, col.b, col.a)
end
PANEL.SetColor = PANEL.SetTextColor

function PANEL:GetColor()
	return self.m_colText or self.m_colTextStyle
end

function PANEL:Toggle()
	if not self:GetIsToggle() then return end

	self:SetToggle(not self:GetToggle())
	self:OnToggled(self:GetToggle())
end

function PANEL:SetDisabled(bDisabled)
	self.m_bDisabled = bDisabled
	InvalidateLayout(self)
end

function PANEL:SetEnabled(bEnabled)
	self:SetDisabled(not bEnabled)
end

function PANEL:IsEnabled()
	return not self:GetDisabled()
end

function PANEL:ApplySchemeSettings()
	local col = self:GetColor()
	if not col then return end

	self:SetFGColor(col.r, col.g, col.b, col.a)
end

function PANEL:AutoStretchVerticalThink()
	self:SizeToContentsY()
end

function PANEL:SetAutoStretchVertical(enable)
	self.m_bAutoStretchVertical = enable
	self.Think = enable and self.AutoStretchVerticalThink or nil
end

function PANEL:OnCursorEntered()
	InvalidateLayout(self, true)
end

function PANEL:OnCursorExited()
	InvalidateLayout(self, true)
end

function PANEL:OnMousePressed(mousecode)
	if self:GetDisabled() then return end

	if mousecode == MOUSE_LEFT and not dragndrop.IsDragging() and self.m_bDoubleClicking then
		if self.LastClickTime and SysTime() - self.LastClickTime < 0.2 then

			self:DoDoubleClickInternal()
			self:DoDoubleClick()
			return
		end

		self.LastClickTime = SysTime()
	end

	if self:IsSelectable() and mousecode == MOUSE_LEFT and input.IsShiftDown() then
		return self:StartBoxSelection()
	end

	self:MouseCapture(true)
	self.Depressed = true
	self:OnDepressed()
	InvalidateLayout(self, true)

	self:DragMousePress(mousecode)
end

function PANEL:OnMouseReleased(mousecode)
	self:MouseCapture(false)

	if self:GetDisabled() then return end
	if not self.Depressed and dragndrop.m_DraggingMain ~= self then return end

	if self.Depressed then
		self.Depressed = nil
		self:OnReleased()
		InvalidateLayout(self, true)
	end

	if self:DragMouseRelease(mousecode) then return end

	if self:IsSelectable() and mousecode == MOUSE_LEFT then
		local canvas = self:GetSelectionCanvas()
		if canvas then
			canvas:UnselectAll()
		end
	end

	if not self.Hovered then return end

	self.Depressed = true

	if mousecode == MOUSE_RIGHT then
		self:DoRightClick()
	end

	if mousecode == MOUSE_LEFT then
		self:DoClickInternal()
		self:DoClick()
	end

	if mousecode == MOUSE_MIDDLE then
		self:DoMiddleClick()
	end

	self.Depressed = nil
end

function PANEL:OnReleased()
end

function PANEL:OnDepressed()
end

function PANEL:OnToggled(bool)
end

function PANEL:DoClick()
	self:Toggle()
end

function PANEL:DoRightClick()
end

function PANEL:DoMiddleClick()
end

function PANEL:DoClickInternal()
end

function PANEL:DoDoubleClick()
end

function PANEL:DoDoubleClickInternal()
end

sui.register("Label", PANEL, "Label")
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
--PATH addons/sui/lua/sui/vgui/sui_zcolumn_sheet.lua:
local IsValid = IsValid

local TDLib_Classes = sui.TDLib.LibClasses
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor

local Panel = {}

function Panel:Init()
	self.tabs = {}

	local tab_scroller = self:Add(NAME .. ".ScrollPanel")
	tab_scroller:Dock(LEFT)

	function tab_scroller:Paint(w, h)
		self:RoundedBox("Background", 1, 0, 0, w, h, GetColor("column_sheet_bar"))
	end

	self.tabs_wide = 48
	self.tab_scroller = tab_scroller

	self:ScaleChanged()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function Panel:ScaleChanged()
	local tabs_wide = SUI.Scale(self.tabs_wide)
	self.tab_scroller:SetWide(tabs_wide)

	self:InvalidateLayout(true)

	local tabs = self.tabs
	for i = 1, #self.tabs do
		tabs[i].img:SetMinus(SUI.Scale(20))
	end
end

function Panel:Paint(w, h)
	self:RoundedBox("Background", 1, 0, 0, w, h, GetColor("column_sheet"))
end

local tab_DoClick = function(s)
	s.parent:SetActiveTab(s)
end

local tab_Paint = function(s, w, h)
	local cur_col
	if s.active then
		cur_col = GetColor("column_sheet_tab_active")
	elseif s.Hovered then
		cur_col = GetColor("column_sheet_tab_hover")
	else
		cur_col = GetColor("column_sheet_tab")
	end

	s:RoundedBox("Backgrounds", 0, 0, 0, w, h, cur_col)
end

local tab_OnRemove = function(s)
	table.RemoveByValue(s.parent.tabs, s)
end

function Panel:AddSheet(mat, load_func)
	local tab = self.tab_scroller:Add(NAME .. ".Button")
	tab:Dock(TOP)
	tab:SetText("")
	tab:SetTall(self.tabs_wide)

	tab.On = TDLib_Classes.On

	tab.DoClick = tab_DoClick
	tab.Paint = tab_Paint
	tab:On("OnRemove", tab_OnRemove)

	tab.parent = self
	tab.load_func = load_func

	local img = tab:Add(NAME .. ".Image")
	img:Dock(FILL)
	img:SetImage(mat)
	img:SetMinus(SUI.Scale(20))

	tab.img = img

	self.tab_scroller:AddItem(tab)

	if not self:GetActiveTab() then
		self:SetActiveTab(tab)
	end

	table.insert(self.tabs, tab)

	return tab
end

function Panel:GetActiveTab()
	return self.active_tab
end

function Panel:SetActiveTab(new_tab)
	if new_tab == self.active_tab then return end

	if not IsValid(new_tab.panel) then
		local panel = new_tab.load_func(self)
		panel:SetParent(self)
		panel:SetVisible(false)
		panel:SetAlpha(0)

		panel.tab = new_tab
		new_tab.panel = panel
	end

	local old_active_tab = self.active_tab
	local delay = 0
	if old_active_tab and IsValid(old_active_tab.panel) then
		old_active_tab.active = false
		delay = 0.2
		old_active_tab.panel:AlphaTo(0, delay, 0, function(_, p)
			if p:IsValid() then
				p:SetVisible(false)
			end
		end)
	end

	new_tab.active = true
	new_tab.panel:SetVisible(true)
	new_tab.panel:AlphaTo(255, 0.2, delay)
	self.active_tab = new_tab
end

sui.register("ColumnSheet", Panel, "EditablePanel")
--PATH addons/chatbox/lua/scb/cl_emojis_data.lua:
return {["jack_o_lantern"]="41",["sloth"]="254",["flag_nl"]="8179",["man_raising_hand"]="1240",["crossed_swords"]="6187",["flag_ck"]="853",["flag_mn"]="8160",["woman_kiss_man"]="1447",["heartpulse"]="1120",["man_girl"]="1472",["flag_se"]="8210",["woman_with_probing_cane"]="1372",["flag_bd"]="827",["rolled_up_newspaper"]="6117",["fog"]="5195",["flag_af"]="811",["aries"]="760",["japan"]="56",["arrow_forward"]="776",["stadium"]="517",["five"]="7139",["flag_kr"]="8135",["guitar"]="663",["woman_kiss_woman"]="1449",["flag_ro"]="8202",["man_getting_massage"]="1356",["exclamation"]="7127",["flag_gt"]="8103",["princess"]="1315",["skunk"]="256",["world_map"]="55",["flag_sm"]="8217",["crab"]="380",["flag_bl"]="834",["grey_exclamation"]="7126",["rainbow"]="5198",["woman_mountain_biking"]="1421",["racing_motorcycle"]="592",["deaf_person"]="1242",["kangaroo"]="257",["stethoscope"]="6212",["flag_cz"]="865",["spider"]="2101",["man_girl_boy"]="1473",["smirk"]="137",["ophiuchus"]="772",["flag_uy"]="8249",["cool"]="7154",["woman_getting_massage"]="1357",["whale"]="285",["frog"]="276",["man_standing"]="1365",["running_shirt_with_sash"]="451",["wind_chime"]="414",["imp"]="192",["thought_balloon"]="1148",["biohazard_sign"]="726",["m"]="7158",["sparkler"]="44",["jigsaw"]="465",["clock430"]="5149",["bust_in_silhouette"]="1481",["wine_glass"]="3105",["no_bicycles"]="718",["sneezing_face"]="152",["carousel_horse"]="558",["flag_ps"]="8196",["chipmunk"]="248",["ant"]="297",["man_running"]="1380",["nine"]="7143",["bamboo"]="411",["facepunch"]="1171",["earth_africa"]="51",["woman_running"]="1381",["lower_left_fountain_pen"]="6147",["wedding"]="538",["disappointed_relieved"]="176",["clock530"]="5151",["man_woman_girl_girl"]="1459",["computer"]="677",["mantelpiece_clock"]="5139",["woman_heart_woman"]="1453",["broom"]="6223",["trackball"]="682",["martial_arts_uniform"]="445",["lemon"]="35",["flag_qa"]="8200",["surfer"]="1401",["child"]="1199",["flag_cr"]="859",["male_singer"]="1288",["rice_scene"]="415",["metro"]="568",["flag_jo"]="8126",["drum_with_drumsticks"]="668",["black_right_pointing_double_triangle_with_vertical_bar"]="778",["blue_heart"]="1131",["house_buildings"]="521",["male_judge"]="1264",["wheelchair"]="74",["field_hockey_stick_and_ball"]="439",["fish_cake"]="374",["spoon"]="3119",["man_woman_boy_boy"]="1458",["dark_sunglasses"]="62",["lock_with_ink_pen"]="6177",["u5408"]="7178",["man_in_business_suit_levitating"]="1384",["raised_back_of_hand"]="1151",["probing_cane"]="6196",["currency_exchange"]="6130",["person_in_lotus_position"]="1437",["flag_pk"]="8191",["flag_ua"]="8244",["hot_pepper"]="323",["large_orange_circle"]="7185",["male_firefighter"]="1300",["paperclip"]="6167",["flag_km"]="8132",["pizza"]="346",["massage"]="1355",["female_astronaut"]="1298",["postbox"]="6143",["railway_track"]="5102",["label"]="6120",["microscope"]="6205",["mask"]="147",["ramen"]="368",["boxing_glove"]="444",["man_walking"]="1362",["jeans"]="68",["flag_iq"]="8120",["statue_of_liberty"]="540",["flag_bw"]="843",["flag_my"]="8171",["axe"]="6182",["money_with_wings"]="6126",["tophat"]="636",["flag_no"]="8180",["milky_way"]="5184",["flag_cu"]="860",["on"]="745",["flag_tk"]="8234",["high_brightness"]="793",["flag_eh"]="877",["arrow_double_up"]="784",["white_flower"]="2108",["flag_gb"]="889",["male_astronaut"]="1297",["face_palm"]="1248",["llama"]="237",["bald_man"]="1209",["angel"]="1325",["female_doctor"]="1256",["flag_om"]="8185",["abacus"]="687",["abcd"]="7146",["printer"]="679",["man_kiss_man"]="1448",["moyai"]="6233",["construction"]="5109",["arrow_upper_right"]="728",["man_dancing"]="1383",["female_artist"]="1292",["smile_cat"]="1104",["pig"]="228",["flag_sl"]="8216",["star2"]="5182",["tennis"]="435",["radio"]="661",["beers"]="3109",["custard"]="397",["blue_book"]="6108",["flag_bo"]="837",["flag_mq"]="8163",["flag_ls"]="8145",["flag_hk"]="8107",["volcano"]="510",["weary"]="184",["spider_web"]="2102",["sweat_smile"]="16",["leaves"]="2127",["car"]="585",["white_haired_man"]="1208",["flag_cm"]="855",["flag_tz"]="8243",["art"]="477",["pouch"]="623",["flag_ng"]="8177",["rooster"]="262",["boom"]="1138",["supervillain"]="1331",["u7121"]="7174",["earth_americas"]="52",["clock11"]="5162",["six"]="7140",["shopping_bags"]="624",["mushroom"]="329",["wc"]="79",["ng"]="7160",["flag_lc"]="8141",["flag_ge"]="891",["hatched_chick"]="265",["flag_pr"]="8195",["clock3"]="5146",["diamonds"]="469",["unlock"]="6176",["o"]="7106",["credit_card"]="6127",["flags"]="413",["mailbox_with_no_mail"]="6142",["softball"]="430",["melon"]="32",["bride_with_veil"]="1322",["unamused"]="138",["taco"]="349",["helicopter"]="5124",["snow_cloud"]="5192",["nazar_amulet"]="460",["goat"]="234",["flag_aq"]="817",["repeat_one"]="775",["astonished"]="169",["newspaper"]="6116",["speaking_head_in_silhouette"]="1480",["lower_left_crayon"]="6150",["purple_heart"]="1132",["athletic_shoe"]="627",["dancers"]="1385",["large_blue_circle"]="7188",["fries"]="345",["flag_lk"]="8143",["u7533"]="7177",["cinema"]="791",["flag_tr"]="8239",["pray"]="1179",["man_playing_water_polo"]="1429",["womans_clothes"]="620",["musical_note"]="654",["confused"]="163",["no_entry_sign"]="717",["calling"]="670",["cookie"]="389",["pushpin"]="6165",["female_pilot"]="1295",["weight_lifter"]="1413",["admission_tickets"]="420",["gift"]="418",["lightning"]="5193",["restroom"]="77",["broccoli"]="326",["manual_wheelchair"]="594",["sagittarius"]="768",["no_mobile_phones"]="723",["purse"]="621",["sunflower"]="2113",["double_vertical_bar"]="787",["om_symbol"]="750",["flag_za"]="8263",["flushed"]="170",["male_pilot"]="1294",["curry"]="367",["chair"]="6216",["panda_face"]="253",["large_blue_square"]="7197",["lollipop"]="396",["oden"]="371",["flying_disc"]="436",["flag_ai"]="813",["ice_cream"]="387",["flag_gg"]="893",["cow2"]="227",["sleuth_or_spy"]="1305",["high_heel"]="630",["flag_hr"]="8110",["fearful"]="174",["flag_mx"]="8170",["flag_nf"]="8176",["person_in_steamy_room"]="1388",["joystick"]="462",["garlic"]="327",["speaker"]="645",["video_camera"]="695",["male_farmer"]="1267",["flag_tj"]="8233",["female_detective"]="1307",["see_no_evil"]="1112",["dromedary_camel"]="235",["ear_of_rice"]="2121",["heavy_minus_sign"]="7114",["male_supervillain"]="1332",["straight_ruler"]="6169",["robot_face"]="1102",["flag_bv"]="842",["sparkling_heart"]="1119",["trumpet"]="665",["no_entry"]="716",["up"]="7165",["flag_dk"]="869",["ledger"]="6112",["headphones"]="660",["full_moon"]="5168",["no_smoking"]="719",["flag_pm"]="8193",["couplekiss"]="1446",["flag_cd"]="848",["chart_with_upwards_trend"]="6161",["two_women_holding_hands"]="1443",["man_woman_boy"]="1455",["tiger2"]="217",["sunrise_over_mountains"]="552",["flag_bf"]="829",["man_woman_girl"]="1456",["flag_so"]="8219",["hugging_face"]="128",["flag_mp"]="8162",["clock1030"]="5161",["yum"]="122",["chart"]="6129",["ox"]="225",["camping"]="512",["bath"]="1440",["onion"]="328",["rice_cracker"]="364",["beverage_box"]="3113",["flag_hu"]="8112",["clock830"]="5157",["flag_cl"]="854",["large_yellow_circle"]="7186",["last_quarter_moon_with_face"]="5175",["handball"]="1431",["spiral_note_pad"]="6158",["flag_tm"]="8236",["female_construction_worker"]="1313",["female_office_worker"]="1280",["yellow_heart"]="1129",["hotsprings"]="557",["beach_with_umbrella"]="513",["flag_bn"]="836",["shield"]="6190",["film_projector"]="690",["o2"]="7161",["ok_woman"]="1233",["flag_lb"]="8140",["flag_gd"]="890",["package"]="6138",["clock2"]="5144",["candle"]="699",["clock10"]="5160",["person_with_blond_hair"]="1203",["elephant"]="239",["small_red_triangle_down"]="7213",["man_man_girl"]="1461",["koko"]="7167",["elf"]="1346",["clock630"]="5153",["camera"]="693",["money_mouth_face"]="127",["first_quarter_moon"]="5166",["male_sign"]="798",["duck"]="270",["snow_capped_mountain"]="58",["clown_face"]="196",["no_bell"]="652",["flag_kw"]="8136",["kiwifruit"]="315",["tanabata_tree"]="410",["eyeglasses"]="61",["ok_hand"]="1155",["last_quarter_moon"]="5170",["lower_left_paintbrush"]="6149",["anguished"]="173",["womans_hat"]="635",["parking"]="7163",["flag_sg"]="8211",["wrestlers"]="1425",["closed_lock_with_key"]="6178",["circus_tent"]="562",["expressionless"]="135",["symbols"]="7148",["wrench"]="6191",["flag_lu"]="8147",["fire"]="5208",["phone"]="671",["flag_gn"]="898",["scarf"]="69",["man_gesturing_no"]="1231",["two_hearts"]="1123",["arrows_clockwise"]="741",["airplane_arriving"]="5121",["movie_camera"]="688",["man_man_girl_girl"]="1464",["woman_frowning"]="1226",["orange_book"]="6109",["petri_dish"]="6203",["clipboard"]="6164",["clock130"]="5143",["question"]="7124",["flag_yt"]="8262",["iphone"]="669",["dolls"]="412",["tea"]="3102",["three"]="7137",["flag_pt"]="8197",["baby_bottle"]="399",["film_frames"]="689",["spiral_calendar_pad"]="6159",["waxing_crescent_moon"]="5165",["octagonal_sign"]="5108",["male_construction_worker"]="1312",["shirt"]="67",["maple_leaf"]="2125",["female_police_officer"]="1304",["barber"]="561",["man_wrestling"]="1426",["menorah_with_nine_branches"]="758",["woman"]="1210",["burrito"]="350",["ballot_box_with_ballot"]="6144",["bus"]="575",["bell"]="651",["hamster"]="245",["heart_decoration"]="1124",["grinning"]="11",["man_boy"]="1470",["bulb"]="6100",["small_orange_diamond"]="7210",["flag_tt"]="8240",["secret"]="7181",["congratulations"]="7180",["male_superhero"]="1329",["chart_with_downwards_trend"]="6162",["flag_sv"]="8223",["part_alternation_mark"]="7118",["wavy_dash"]="7128",["yo_yo"]="456",["white_large_square"]="7201",["black_large_square"]="7200",["left_luggage"]="713",["arrow_down"]="731",["flag_is"]="8122",["small_red_triangle"]="7212",["tractor"]="590",["green_book"]="6107",["sleeping_accommodation"]="1441",["baseball"]="429",["thumbsdown"]="1169",["arrow_up"]="727",["shell"]="293",["arrow_heading_down"]="740",["arrow_heading_up"]="739",["koala"]="252",["desert"]="514",["loop"]="7117",["flag_vi"]="8255",["flag_pl"]="8192",["children_crossing"]="715",["lizard"]="279",["curly_loop"]="7116",["arrow_right"]="729",["middle_finger"]="1165",["heavy_division_sign"]="7115",["second_place_medal"]="426",["rowboat"]="1404",["stars"]="5183",["heavy_heart_exclamation_mark_ornament"]="1125",["flag_td"]="8229",["grey_question"]="7125",["cat2"]="214",["flag_ne"]="8175",["x"]="7111",["sparkle"]="7121",["flag_ye"]="8261",["flag_kg"]="8129",["bar_chart"]="6163",["hocho"]="3120",["snowflake"]="5204",["potable_water"]="73",["flag_jp"]="8127",["santa"]="1326",["accept"]="7176",["star_of_david"]="751",["busts_in_silhouette"]="1482",["eyes"]="1194",["wave"]="1150",["heavy_multiplication_x"]="7110",["heavy_check_mark"]="7109",["cocktail"]="3106",["black_nib"]="6146",["full_moon_with_face"]="5178",["pencil2"]="6145",["thermometer"]="5176",["flag_de"]="866",["calendar"]="6157",["flag_gw"]="8105",["flag_ht"]="8111",["writing_hand"]="1180",["v"]="1157",["rocket"]="5129",["point_up"]="1167",["email"]="6132",["door"]="6213",["satellite"]="5128",["scissors"]="6171",["zap"]="5203",["clock5"]="5150",["loudspeaker"]="648",["flag_by"]="844",["church"]="541",["footprints"]="1483",["fuelpump"]="5104",["tent"]="548",["flag_sn"]="8218",["capricorn"]="769",["customs"]="711",["person_with_ball"]="1410",["rice"]="366",["smiley_cat"]="1103",["hotel"]="530",["woman_bouncing_ball"]="1412",["man_heart_man"]="1452",["ice_skate"]="448",["skier"]="1396",["boat"]="5111",["flag_ms"]="8165",["female_fairy"]="1339",["female_cook"]="1271",["snowman"]="5205",["woman_girl_girl"]="1479",["palm_tree"]="2119",["european_post_office"]="527",["ferry"]="5115",["dress"]="613",["flag_dm"]="870",["golf"]="447",["female_supervillain"]="1333",["flag_zm"]="8264",["vibration_mode"]="795",["flag_uz"]="8250",["flag_wf"]="8258",["umbrella_on_ground"]="5202",["ribbon"]="417",["point_left"]="1162",["mouse2"]="243",["mountain"]="59",["shinto_shrine"]="545",["blond_haired_woman"]="1219",["large_purple_circle"]="7189",["orange_heart"]="1128",["flag_scotland"]="8267",["sunrise"]="553",["helmet_with_white_cross"]="639",["man_wearing_turban"]="1317",["pick"]="6183",["anchor"]="5110",["partly_sunny"]="5186",["snowman_without_snow"]="5206",["busstop"]="5100",["flag_na"]="8173",["loud_sound"]="647",["rat"]="244",["file_cabinet"]="6173",["beginner"]="7105",["flag_mc"]="8151",["fleur_de_lis"]="7102",["musical_score"]="653",["desktop_computer"]="678",["kiss"]="1115",["frowning"]="172",["postal_horn"]="650",["coffin"]="6231",["linked_paperclips"]="6168",["man_boy_boy"]="1471",["black_circle"]="7191",["tooth"]="1192",["warning"]="714",["face_with_cowboy_hat"]="158",["clock230"]="5145",["four_leaf_clover"]="2124",["flag_lt"]="8146",["meat_on_bone"]="340",["flag_sc"]="8208",["first_place_medal"]="425",["kissing_closed_eyes"]="120",["alembic"]="6201",["ticket"]="421",["medical_symbol"]="799",["flag_bq"]="838",["hammer"]="6181",["thunder_cloud_and_rain"]="5187",["derelict_house_building"]="522",["waving_black_flag"]="84",["flag_as"]="819",["flag_cg"]="850",["hammer_and_pick"]="6184",["sandal"]="631",["gift_heart"]="1118",["dragon"]="282",["japanese_ogre"]="197",["infinity"]="7100",["champagne"]="3104",["recycle"]="7101",["hearts"]="468",["right_facing_fist"]="1173",["oncoming_police_car"]="582",["chess_pawn"]="471",["flag_ni"]="8178",["pisces"]="771",["tram"]="571",["diamond_shape_with_a_dot_inside"]="7214",["scorpius"]="767",["flag_mk"]="8157",["wheel_of_dharma"]="752",["libra"]="766",["mosque"]="542",["virgo"]="765",["one"]="7135",["shopping_trolley"]="6229",["woman_rowing_boat"]="1406",["vertical_traffic_light"]="5107",["revolving_hearts"]="1122",["sound"]="646",["bowl_with_spoon"]="357",["female_technologist"]="1286",["man_with_bunny_ears_partying"]="1386",["rewind"]="781",["flag_ba"]="825",["crying_cat_face"]="1110",["free"]="7155",["flag_pw"]="8198",["female_sign"]="797",["flag_ac"]="88",["arrow_double_down"]="786",["white_frowning_face"]="166",["heartbeat"]="1121",["small_airplane"]="5119",["peace_symbol"]="757",["star_and_crescent"]="756",["orthodox_cross"]="755",["monkey"]="22",["radioactive_sign"]="725",["mega"]="649",["skull_and_crossbones"]="194",["old_key"]="6180",["flag_es"]="879",["fist"]="1170",["shamrock"]="2123",["black_circle_for_record"]="789",["coffee"]="3101",["file_folder"]="6153",["man_mountain_biking"]="1420",["male_detective"]="1306",["ballot_box_with_check"]="7108",["candy"]="395",["comet"]="5207",["flag_in"]="8118",["cloud"]="5185",["sunny"]="5177",["flag_gq"]="8100",["woman_in_steamy_room"]="1390",["id"]="7157",["cricket_bat_and_ball"]="438",["female_zombie"]="1354",["nerd_face"]="161",["flag_kn"]="8133",["white_medium_small_square"]="7205",["flag_ag"]="812",["page_with_curl"]="6113",["white_medium_square"]="7203",["dumpling"]="377",["copyright"]="7129",["clock330"]="5147",["fried_shrimp"]="373",["arrow_backward"]="780",["flag_bi"]="832",["fish"]="288",["fax"]="674",["drop_of_blood"]="6209",["house"]="523",["woman_wearing_turban"]="1318",["bald_woman"]="1217",["low_brightness"]="792",["seven"]="7141",["flag_ec"]="874",["card_index_dividers"]="6155",["safety_vest"]="65",["flag_ir"]="8121",["timer_clock"]="5138",["mag_right"]="698",["otter"]="255",["flag_mz"]="8172",["stopwatch"]="5137",["takeout_box"]="379",["alarm_clock"]="5136",["ocean"]="5210",["black_right_pointing_triangle_with_double_vertical_bar"]="779",["cl"]="7153",["black_left_pointing_double_triangle_with_vertical_bar"]="782",["relaxed"]="119",["fast_forward"]="777",["registered"]="7130",["woman_in_manual_wheelchair"]="1378",["eject"]="790",["keyboard"]="680",["flag_cv"]="861",["aerial_tramway"]="5127",["ballet_shoes"]="632",["male_scientist"]="1282",["smoking"]="6230",["woman_walking"]="1363",["leftwards_arrow_with_hook"]="737",["badger"]="258",["swimmer"]="1407",["hourglass_flowing_sand"]="5134",["underage"]="724",["woman_juggling"]="1436",["flamingo"]="273",["one_piece_swimsuit"]="616",["left_right_arrow"]="736",["information_source"]="7156",["woman_in_lotus_position"]="1439",["clock1130"]="5163",["fallen_leaf"]="2126",["woman_biking"]="1418",["horse_racing"]="1395",["interrobang"]="7123",["hushed"]="168",["man_in_motorized_wheelchair"]="1374",["mrs_claus"]="1327",["closed_umbrella"]="5199",["lower_left_ballpoint_pen"]="6148",["razor"]="6220",["ringed_planet"]="5180",["woman_heart_man"]="1451",["parachute"]="5122",["raised_hand_with_fingers_splayed"]="1152",["kite"]="457",["male_police_officer"]="1303",["star"]="5181",["trident"]="7103",["mute"]="644",["balloon"]="47",["relieved"]="142",["flag_cf"]="849",["kaaba"]="546",["flag_gi"]="895",["flag_fk"]="884",["earth_asia"]="53",["ambulance"]="579",["date"]="6156",["flag_sy"]="8225",["clock4"]="5148",["partying_face"]="159",["speak_no_evil"]="1114",["adhesive_bandage"]="6211",["blond_haired_man"]="1220",["rugby_football"]="434",["notebook_with_decorative_cover"]="6104",["flag_az"]="824",["white_small_square"]="7207",["shorts"]="618",["flag_to"]="8238",["flag_bg"]="830",["arrow_up_down"]="735",["open_file_folder"]="6154",["flag_np"]="8181",["police_car"]="581",["watch"]="5135",["guide_dog"]="27",["sponge"]="6227",["flag_mr"]="8164",["soap"]="6226",["roll_of_paper"]="6225",["basket"]="6224",["tongue"]="1196",["teddy_bear"]="466",["penguin"]="267",["male_cook"]="1270",["e_mail"]="6133",["spaghetti"]="369",["flag_st"]="8222",["eight"]="7142",["thread"]="478",["sa"]="7168",["flag_cn"]="856",["clock12"]="5140",["face_with_hand_over_mouth"]="129",["vampire"]="1340",["service_dog"]="28",["bed"]="6214",["clapper"]="691",["female_superhero"]="1330",["flag_um"]="8246",["bricks"]="520",["link"]="6197",["snowboarder"]="1397",["flag_pg"]="8189",["crown"]="634",["laughing"]="15",["new_moon_with_face"]="5173",["toolbox"]="6199",["diving_mask"]="450",["fire_extinguisher"]="6228",["compass"]="57",["large_purple_square"]="7198",["baby"]="1198",["test_tube"]="6202",["woozy_face"]="155",["red_envelope"]="416",["socks"]="612",["coat"]="611",["flag_gf"]="892",["flag_us"]="8248",["aquarius"]="770",["brain"]="1191",["fried_egg"]="354",["male_zombie"]="1353",["genie"]="1349",["adult"]="1202",["flag_ie"]="8115",["female_genie"]="1351",["hibiscus"]="2112",["joy_cat"]="1105",["male_elf"]="1347",["female_elf"]="1348",["merperson"]="1343",["merman"]="1344",["mermaid"]="1345",["butterfly"]="295",["lotion_bottle"]="6221",["flag_cw"]="862",["person_with_pouting_face"]="1227",["national_park"]="516",["shushing_face"]="130",["male_fairy"]="1338",["mage"]="1334",["fishing_pole_and_fish"]="449",["female_mage"]="1336",["flag_ar"]="818",["pineapple"]="37",["safety_pin"]="6222",["tm"]="7131",["juggling"]="1434",["traffic_light"]="5106",["male_factory_worker"]="1276",["clock7"]="5154",["avocado"]="318",["video_game"]="461",["flag_tg"]="8231",["control_knobs"]="658",["eye"]="1195",["family"]="1454",["t_rex"]="284",["person_with_headscarf"]="1320",["rhinoceros"]="240",["bow_and_arrow"]="6189",["eggplant"]="319",["older_adult"]="1221",["male_genie"]="1350",["bikini"]="619",["flag_im"]="8117",["face_with_monocle"]="162",["icecream"]="385",["deaf_man"]="1243",["flag_mu"]="8167",["deaf_woman"]="1244",["man_swimming"]="1408",["kneeling_person"]="1367",["man_kneeling"]="1368",["flag_sa"]="8206",["clock9"]="5158",["mortar_board"]="637",["ship"]="5117",["standing_person"]="1364",["crossed_flags"]="83",["ice_cube"]="3115",["red_haired_man"]="1206",["pancakes"]="337",["mate_drink"]="3114",["black_joker"]="472",["woman_swimming"]="1409",["croissant"]="333",["bouquet"]="2106",["butter"]="360",["speech_balloon"]="1144",["factory"]="535",["man_with_turban"]="1316",["grimacing"]="140",["place_of_worship"]="748",["salt"]="361",["flag_er"]="878",["basketball"]="431",["cupcake"]="392",["parrot"]="275",["sushi"]="372",["globe_with_meridians"]="54",["monorail"]="572",["motorized_wheelchair"]="595",["ear_with_hearing_aid"]="1189",["arrow_lower_left"]="732",["fountain"]="547",["superhero"]="1328",["flag_ky"]="8137",["flag_me"]="8153",["performing_arts"]="475",["flag_fr"]="887",["magnet"]="6200",["white_circle"]="7192",["foot"]="1187",["falafel"]="352",["city_sunrise"]="555",["smirk_cat"]="1107",["banjo"]="667",["hospital"]="528",["watermelon"]="33",["receipt"]="6128",["water_buffalo"]="226",["sweet_potato"]="370",["hash"]="7132",["oyster"]="384",["flag_bh"]="831",["hotdog"]="347",["arrow_upper_left"]="734",["orangutan"]="24",["swan"]="271",["microbe"]="2105",["ice_hockey_stick_and_puck"]="440",["tada"]="48",["woman_woman_boy"]="1465",["briefs"]="617",["gem"]="643",["raccoon"]="212",["flag_au"]="821",["train"]="574",["flag_wales"]="8268",["cheese_wedge"]="339",["man_pouting"]="1228",["hippopotamus"]="241",["flag_vc"]="8252",["peacock"]="274",["cricket"]="2100",["man"]="1204",["man_in_steamy_room"]="1389",["boar"]="230",["flag_mm"]="8159",["sauropod"]="283",["reminder_ribbon"]="419",["hedgehog"]="249",["telescope"]="6206",["zebra_face"]="222",["woman_golfing"]="1400",["giraffe_face"]="238",["squid"]="383",["shrimp"]="382",["tiger"]="216",["izakaya_lantern"]="6102",["flag_zw"]="8265",["bearded_person"]="1205",["evergreen_tree"]="2117",["gun"]="6188",["gorilla"]="23",["potato"]="320",["deer"]="223",["fox_face"]="211",["barely_sunny"]="5189",["man_surfing"]="1402",["nut_and_bolt"]="6192",["mountain_railway"]="573",["owl"]="272",["shark"]="291",["bat"]="250",["flag_ae"]="810",["eagle"]="269",["pound"]="6125",["leopard"]="218",["boot"]="633",["first_quarter_moon_with_face"]="5174",["desert_island"]="515",["sled"]="453",["turkey"]="260",["repeat"]="774",["scorpion"]="2103",["mailbox_closed"]="6140",["person_climbing"]="1391",["flag_eu"]="881",["womans_flat_shoe"]="629",["fireworks"]="43",["hole"]="1142",["tumbler_glass"]="3111",["hiking_boot"]="628",["ram"]="232",["flag_gh"]="894",["flag_fj"]="883",["female_teacher"]="1262",["large_orange_square"]="7194",["goggles"]="63",["flag_sx"]="8224",["sports_medal"]="424",["flag_tf"]="8230",["sake"]="3103",["lab_coat"]="64",["cupid"]="1117",["left_facing_fist"]="1172",["water_polo"]="1428",["pleading_face"]="171",["moneybag"]="6121",["cold_face"]="154",["hot_face"]="153",["fortune_cookie"]="378",["dove_of_peace"]="268",["firecracker"]="45",["radio_button"]="7215",["flag_am"]="815",["three_button_mouse"]="681",["chopsticks"]="3116",["notebook"]="6111",["smiling_face_with_3_hearts"]="114",["trophy"]="423",["pretzel"]="335",["vhs"]="696",["moon_cake"]="375",["woman_lifting_weights"]="1415",["bowling"]="437",["flag_ee"]="875",["ab"]="7151",["canned_food"]="362",["flag_it"]="8123",["four"]="7138",["sandwich"]="348",["ear"]="1188",["woman_pouting"]="1229",["rosette"]="2109",["hankey"]="195",["flag_do"]="871",["euro"]="6124",["bagel"]="336",["pie"]="393",["lobster"]="381",["cup_with_straw"]="3112",["flag_tn"]="8237",["gemini"]="762",["yawning_face"]="186",["peanuts"]="330",["heart_eyes"]="115",["luggage"]="5132",["egg"]="353",["male_doctor"]="1255",["8ball"]="458",["stuffed_flatbread"]="351",["female_guard"]="1310",["green_salad"]="358",["baguette_bread"]="334",["carrot"]="321",["dango"]="376",["bacon"]="343",["kimono"]="614",["round_pushpin"]="6166",["tulip"]="2115",["cucumber"]="324",["knife_fork_plate"]="3117",["woman_climbing"]="1393",["sparkles"]="46",["bathtub"]="6219",["camera_with_flash"]="694",["flag_th"]="8232",["flag_id"]="8114",["medal"]="422",["third_place_medal"]="427",["bear"]="251",["flag_ki"]="8131",["chocolate_bar"]="394",["ok"]="7162",["birthday"]="390",["heavy_plus_sign"]="7113",["rose"]="2110",["clinking_glasses"]="3110",["hear_no_evil"]="1113",["man_playing_handball"]="1432",["chicken"]="261",["flag_fm"]="885",["crocodile"]="277",["sari"]="615",["feet"]="259",["doughnut"]="388",["woman_wrestling"]="1427",["oncoming_taxi"]="584",["fencer"]="1394",["man_juggling"]="1435",["arrow_lower_right"]="730",["fork_and_knife"]="3118",["flag_nc"]="8174",["clock6"]="5152",["classical_building"]="518",["person_doing_cartwheel"]="1422",["cityscape"]="551",["man_cartwheeling"]="1423",["woman_cartwheeling"]="1424",["night_with_stars"]="550",["shrug"]="1251",["man_shrugging"]="1252",["woman_shrugging"]="1253",["man_in_tuxedo"]="1321",["male_teacher"]="1261",["handshake"]="1178",["no_pedestrians"]="722",["man_gesturing_ok"]="1234",["flag_il"]="8116",["red_circle"]="7184",["prince"]="1314",["office"]="525",["flag_mt"]="8166",["flag_lv"]="8148",["selfie"]="1182",["flag_tv"]="8241",["breast_feeding"]="1324",["i_love_you_hand_sign"]="1159",["male_artist"]="1291",["exploding_head"]="157",["violin"]="666",["flag_bs"]="840",["flag_dg"]="867",["runner"]="1379",["arrow_down_small"]="785",["face_vomiting"]="151",["oncoming_bus"]="576",["joy"]="18",["strawberry"]="314",["face_with_symbols_on_mouth"]="190",["u7a7a"]="7179",["zany_face"]="125",["stew"]="356",["the_horns"]="1160",["man_facepalming"]="1249",["woman_facepalming"]="1250",["lying_face"]="141",["stuck_out_tongue_winking_eye"]="124",["briefcase"]="6152",["compression"]="6194",["rolling_on_the_floor_laughing"]="17",["nauseated_face"]="150",["atom_symbol"]="749",["flag_ca"]="846",["older_woman"]="1223",["pregnant_woman"]="1323",["school"]="533",["cactus"]="2120",["triangular_ruler"]="6170",["studio_microphone"]="656",["clock8"]="5156",["flag_md"]="8152",["crossed_fingers"]="1158",["clubs"]="470",["slot_machine"]="463",["call_me_hand"]="1161",["lock"]="6175",["face_with_raised_eyebrow"]="133",["bangbang"]="7122",["muscle"]="1183",["man_rowing_boat"]="1405",["zipper_mouth_face"]="132",["brown_heart"]="1133",["pinching_hand"]="1156",["white_heart"]="1135",["flag_sh"]="8212",["large_brown_square"]="7199",["large_green_square"]="7196",["large_yellow_square"]="7195",["microphone"]="659",["camel"]="236",["soon"]="746",["blush"]="112",["large_red_square"]="7193",["large_brown_circle"]="7190",["chains"]="6198",["lips"]="1197",["large_green_circle"]="7187",["scroll"]="6114",["cherries"]="313",["flag_at"]="820",["auto_rickshaw"]="596",["skateboard"]="599",["christmas_tree"]="42",["sleepy"]="144",["canoe"]="5112",["pig2"]="229",["flag_xk"]="8260",["motor_scooter"]="593",["flag_ru"]="8204",["scooter"]="598",["flag_ci"]="852",["flag_ml"]="8158",["envelope_with_arrow"]="6135",["keycap_ten"]="7144",["non_potable_water"]="721",["white_check_mark"]="7107",["airplane_departure"]="5120",["cop"]="1302",["yin_yang"]="753",["waning_gibbous_moon"]="5169",["pig_nose"]="231",["keycap_star"]="7133",["man_frowning"]="1225",["man_golfing"]="1399",["motorway"]="5101",["oil_drum"]="5103",["hammer_and_wrench"]="6185",["name_badge"]="7104",["hindu_temple"]="543",["cold_sweat"]="175",["flag_ga"]="888",["no_mouth"]="136",["necktie"]="66",["left_speech_bubble"]="1146",["clock730"]="5155",["baggage_claim"]="712",["walking"]="1361",["passport_control"]="710",["flag_ad"]="89",["fairy"]="1337",["ferris_wheel"]="559",["toilet"]="6217",["baby_symbol"]="78",["oncoming_automobile"]="586",["mens"]="75",["mountain_bicyclist"]="1419",["flag_py"]="8199",["flag_re"]="8201",["umbrella_with_rain_drops"]="5201",["flag_kp"]="8134",["man_man_boy"]="1460",["flag_et"]="880",["card_index"]="6160",["man_biking"]="1417",["flag_ma"]="8150",["passenger_ship"]="5114",["football"]="433",["eight_pointed_black_star"]="7120",["monkey_face"]="21",["do_not_litter"]="720",["flag_vu"]="8257",["dvd"]="686",["clock1230"]="5141",["lion_face"]="215",["airplane"]="5118",["no_good"]="1230",["rotating_light"]="5105",["put_litter_in_its_place"]="72",["tropical_drink"]="3107",["speedboat"]="5113",["face_with_thermometer"]="148",["cancer"]="763",["woman_kneeling"]="1369",["hourglass"]="5133",["mountain_cableway"]="5126",["flag_rw"]="8205",["shaved_ice"]="386",["mechanical_arm"]="1184",["articulated_lorry"]="589",["flag_al"]="814",["a"]="7150",["1234"]="7147",["blue_car"]="587",["green_apple"]="310",["key"]="6179",["womens"]="76",["couple_with_heart"]="1450",["female_scientist"]="1283",["older_man"]="1222",["flag_cx"]="863",["crystal_ball"]="459",["spades"]="467",["fire_engine"]="580",["minibus"]="578",["trolleybus"]="577",["table_tennis_paddle_and_ball"]="442",["grin"]="14",["train2"]="567",["light_rail"]="569",["flag_ve"]="8253",["bullettrain_front"]="566",["dart"]="455",["love_hotel"]="531",["baby_chick"]="264",["bullettrain_side"]="565",["railway_car"]="564",["flag_bz"]="845",["steam_locomotive"]="563",["hand"]="1153",["female_vampire"]="1342",["leg"]="1186",["skull"]="193",["motor_boat"]="5116",["raised_hands"]="1175",["white_haired_woman"]="1215",["raising_hand"]="1239",["woman_raising_hand"]="1241",["post_office"]="526",["flag_nr"]="8182",["wilted_flower"]="2111",["bow"]="1245",["man_bowing"]="1246",["woman_bowing"]="1247",["woman_gesturing_ok"]="1235",["triangular_flag_on_post"]="82",["black_square_button"]="7217",["woman_gesturing_no"]="1232",["face_with_rolling_eyes"]="139",["u7981"]="7175",["slightly_smiling_face"]="19",["slightly_frowning_face"]="165",["u6708"]="7169",["pouting_cat"]="1111",["point_down"]="1166",["kissing_cat"]="1108",["heart_eyes_cat"]="1106",["bee"]="298",["man_bouncing_ball"]="1411",["woman_woman_girl_girl"]="1469",["prayer_beads"]="640",["couch_and_lamp"]="6215",["chestnut"]="331",["male_technologist"]="1285",["scream"]="179",["bellhop_bell"]="5131",["face_with_head_bandage"]="149",["open_mouth"]="167",["sob"]="178",["poultry_leg"]="341",["flag_ea"]="873",["green_heart"]="1130",["flying_saucer"]="5130",["level_slider"]="657",["thumbsup"]="1168",["triumph"]="187",["bridge_at_night"]="556",["broken_heart"]="1126",["cry"]="177",["rage"]="188",["beer"]="3108",["amphora"]="3121",["disappointed"]="182",["stuck_out_tongue_closed_eyes"]="126",["stuck_out_tongue"]="123",["rabbit"]="246",["flag_pa"]="8186",["kissing_smiling_eyes"]="121",["flag_je"]="8124",["kissing_heart"]="117",["flag_cp"]="858",["kissing"]="118",["mans_shoe"]="626",["confounded"]="180",["pensive"]="143",["sweat"]="183",["neutral_face"]="134",["large_blue_diamond"]="7209",["memo"]="6151",["sunglasses"]="160",["house_with_garden"]="524",["wink"]="111",["flag_io"]="8119",["smiling_imp"]="191",["flag_ss"]="8221",["european_castle"]="537",["flag_mw"]="8169",["flag_br"]="839",["woman_getting_haircut"]="1360",["smile"]="13",["flag_co"]="857",["red_haired_woman"]="1211",["tokyo_tower"]="539",["mount_fuji"]="511",["tired_face"]="185",["dagger_knife"]="6186",["drooling_face"]="145",["male_student"]="1258",["wastebasket"]="6174",["pear"]="311",["u6709"]="7170",["flag_ug"]="8245",["moon"]="5167",["soccer"]="428",["card_file_box"]="6172",["new"]="7159",["deciduous_tree"]="2118",["blossom"]="2114",["frame_with_picture"]="476",["u55b6"]="7182",["tomato"]="316",["flag_mh"]="8156",["back"]="743",["flag_nu"]="8183",["flag_jm"]="8125",["clock930"]="5159",["bento"]="363",["cake"]="391",["flag_ta"]="8227",["zombie"]="1352",["curling_stone"]="454",["flag_tc"]="8228",["synagogue"]="544",["b"]="7152",["banana"]="36",["suspension_railway"]="5125",["flag_bb"]="826",["flag_si"]="8213",["negative_squared_cross_mark"]="7112",["black_square_for_stop"]="788",["inbox_tray"]="6137",["flag_kz"]="8138",["spock_hand"]="1154",["hamburger"]="344",["pager"]="673",["flag_pf"]="8188",["abc"]="7149",["taxi"]="583",["flag_cc"]="847",["leo"]="764",["tornado"]="5194",["dash"]="1141",["sun_with_face"]="5179",["goal_net"]="446",["yen"]="6122",["peach"]="312",["flag_be"]="828",["golfer"]="1398",["syringe"]="6208",["waving_white_flag"]="85",["cyclone"]="5197",["flag_ly"]="8149",["honey_pot"]="398",["grapes"]="31",["flag_aw"]="822",["flashlight"]="6101",["rainbow_flag"]="86",["flag_ch"]="851",["twisted_rightwards_arrows"]="773",["corn"]="322",["thinking_face"]="131",["flag_sd"]="8209",["two"]="7136",["black_small_square"]="7206",["man_in_lotus_position"]="1438",["flag_ke"]="8128",["flag_mo"]="8161",["flag_fi"]="882",["lacrosse"]="441",["roller_coaster"]="560",["mechanical_leg"]="1185",["flag_sk"]="8215",["flag_ax"]="823",["scream_cat"]="1109",["flag_bj"]="833",["smiley"]="12",["umbrella"]="5200",["pirate_flag"]="87",["truck"]="588",["flag_mg"]="8155",["gloves"]="610",["woman_woman_girl_boy"]="1467",["rain_cloud"]="5191",["flag_hn"]="8109",["arrow_up_small"]="783",["flag_tl"]="8235",["wind_blowing_face"]="5196",["flag_tw"]="8242",["bug"]="296",["woman_girl"]="1477",["mailbox"]="6139",["female_farmer"]="1268",["100"]="1136",["woman_tipping_hand"]="1238",["couple"]="1444",["angry"]="189",["female_student"]="1259",["bomb"]="1143",["bike"]="597",["snake"]="280",["bone"]="1193",["man_with_probing_cane"]="1371",["flag_gy"]="8106",["book"]="6106",["black_medium_square"]="7202",["gear"]="6193",["flag_li"]="8142",["floppy_disk"]="684",["crescent_moon"]="5172",["mostly_sunny"]="5188",["dizzy_face"]="156",["clock1"]="5142",["diya_lamp"]="6103",["new_moon"]="5164",["top"]="747",["ski"]="452",["dragon_face"]="281",["cow"]="224",["coconut"]="317",["person_frowning"]="1224",["tv"]="692",["flag_ic"]="8113",["waning_crescent_moon"]="5171",["shower"]="6218",["woman_standing"]="1366",["game_die"]="464",["flag_va"]="8251",["flag_dz"]="872",["poodle"]="29",["bird"]="266",["zero"]="7134",["male_mage"]="1335",["foggy"]="549",["flag_ws"]="8259",["flag_ao"]="816",["building_construction"]="519",["dog2"]="26",["flag_rs"]="8203",["anger"]="1137",["cherry_blossom"]="2107",["space_invader"]="1101",["man_man_boy_boy"]="1463",["mahjong"]="473",["flag_nz"]="8184",["herb"]="2122",["tangerine"]="34",["white_square_button"]="7216",["u6e80"]="7183",["school_satchel"]="625",["black_medium_small_square"]="7204",["flag_sz"]="8226",["atm"]="71",["flag_gu"]="8104",["zzz"]="1149",["flag_lr"]="8144",["love_letter"]="1116",["popcorn"]="359",["page_facing_up"]="6115",["flag_pn"]="8194",["ideograph_advantage"]="7172",["man_girl_girl"]="1474",["flag_bm"]="835",["apple"]="39",["male_guard"]="1309",["convenience_store"]="532",["boy"]="1200",["flag_england"]="8266",["department_store"]="534",["cut_of_meat"]="342",["badminton_racquet_and_shuttlecock"]="443",["flag_la"]="8139",["flower_playing_cards"]="474",["rabbit2"]="247",["pill"]="6210",["black_heart"]="1134",["whale2"]="286",["snail"]="294",["racehorse"]="220",["woman_playing_handball"]="1433",["glass_of_milk"]="3100",["woman_boy_boy"]="1476",["octopus"]="292",["arrow_left"]="733",["nail_care"]="1181",["persevere"]="181",["notes"]="655",["woman_woman_boy_boy"]="1468",["flag_dj"]="868",["beetle"]="299",["tropical_fish"]="289",["outbox_tray"]="6136",["seedling"]="2116",["flag_un"]="8247",["dolphin"]="287",["mouse"]="242",["bookmark"]="6119",["bread"]="332",["sos"]="7164",["male_vampire"]="1341",["six_pointed_star"]="759",["cat"]="213",["wolf"]="210",["books"]="6110",["latin_cross"]="754",["nose"]="1190",["end"]="744",["flag_gr"]="8101",["female_firefighter"]="1301",["point_up_2"]="1164",["point_right"]="1163",["innocent"]="113",["sheep"]="233",["upside_down_face"]="110",["open_hands"]="1176",["clap"]="1174",["ghost"]="199",["people_holding_hands"]="1442",["star_struck"]="116",["female_mechanic"]="1274",["unicorn_face"]="221",["lipstick"]="641",["japanese_castle"]="536",["arrows_counterclockwise"]="742",["bookmark_tabs"]="6118",["bicyclist"]="1416",["man_woman_girl_boy"]="1457",["sleeping"]="146",["shallow_pan_of_food"]="355",["arrow_right_hook"]="738",["woman_girl_boy"]="1478",["flag_sr"]="8220",["man_tipping_hand"]="1237",["flag_gm"]="897",["information_desk_person"]="1236",["flag_hm"]="8108",["female_singer"]="1289",["vs"]="7166",["woman_playing_water_polo"]="1430",["flag_vn"]="8256",["mag"]="697",["closed_book"]="6105",["woman_woman_girl"]="1466",["curly_haired_woman"]="1213",["flag_kh"]="8130",["japanese_goblin"]="198",["incoming_envelope"]="6134",["mailbox_with_mail"]="6141",["musical_keyboard"]="664",["hatching_chick"]="263",["taurus"]="761",["female_judge"]="1265",["minidisc"]="683",["handbag"]="622",["man_with_gua_pi_mao"]="1319",["dna"]="6204",["u6307"]="7171",["woman_in_motorized_wheelchair"]="1375",["mosquito"]="2104",["alien"]="1100",["u5272"]="7173",["flag_ph"]="8190",["eight_spoked_asterisk"]="7119",["male_mechanic"]="1273",["rice_ball"]="365",["flag_mv"]="8168",["scales"]="6195",["dancer"]="1382",["city_sunset"]="554",["two_men_holding_hands"]="1445",["flag_sb"]="8207",["ring"]="642",["haircut"]="1358",["flag_cy"]="864",["flag_eg"]="876",["woman_with_bunny_ears_partying"]="1387",["horse"]="219",["flag_pe"]="8187",["flag_gs"]="8102",["woman_surfing"]="1403",["right_anger_bubble"]="1147",["sweat_drops"]="1140",["partly_sunny_rain"]="5190",["battery"]="675",["waffle"]="338",["dollar"]="6123",["saxophone"]="662",["guardsman"]="1308",["seat"]="5123",["bank"]="529",["man_getting_haircut"]="1359",["man_in_manual_wheelchair"]="1377",["large_orange_diamond"]="7208",["male_office_worker"]="1279",["man_climbing"]="1392",["confetti_ball"]="49",["girl"]="1201",["flag_fo"]="886",["leafy_green"]="325",["woman_boy"]="1475",["telephone_receiver"]="672",["cd"]="685",["satellite_antenna"]="6207",["turtle"]="278",["flag_mf"]="8154",["female_factory_worker"]="1277",["racing_car"]="591",["funeral_urn"]="6232",["mobile_phone_off"]="796",["mango"]="38",["volleyball"]="432",["billed_cap"]="638",["man_man_girl_boy"]="1462",["blowfish"]="290",["palms_up_together"]="1177",["heart"]="1127",["flag_gp"]="899",["dizzy"]="1139",["flag_sj"]="8214",["electric_plug"]="676",["man_lifting_weights"]="1414",["yarn"]="479",["station"]="570",["construction_worker"]="1311",["droplet"]="5209",["capital_abcd"]="7145",["curly_haired_man"]="1207",["flag_vg"]="8254",["flag_bt"]="841",["checkered_flag"]="81",["heavy_dollar_sign"]="6131",["flag_gl"]="896",["small_blue_diamond"]="7211",["signal_strength"]="794",["dog"]="25",["worried"]="164",}
--PATH lua/autorun/scorpion_viewheight.lua:
CreateConVar( "player_dinosaur_viewheight", "1", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE } )

hook.Add("PlayerSpawn",  "Ark_scorpion_Viewheight_Offset", function(ply)
	if not ply or not ply:IsValid() then return end
	if (ply:GetModel() == "models/echo/ark/scorpion_pm.mdl") then
	timer.Simple(0.1, function()
	if GetConVarNumber( "player_dinosaur_viewheight" ) == 1 then
	ply:SetViewOffset( Vector( 0, 0, 38 ) )
	ply:SetViewOffsetDucked( Vector( 0, 0, 28 ) )
	ply:SetHull( Vector( -16, -16, 0 ), Vector( 16, 16, 42 ) )
	ply:SetHullDuck( Vector( -16, -16, 0 ), Vector( 16, 16, 32 ) )
	end
	end)
else
	ply:SetViewOffset( Vector(0,0,64) )
	ply:SetViewOffsetDucked( Vector(0,0,28) )
	ply:SetHull( Vector( -16, -16, 0 ), Vector( 16, 16, 70 ) )
	ply:SetHullDuck( Vector( -16, -16, 0 ), Vector( 16, 16, 34 ) )
	end
end)
--PATH addons/sl_util_atm/lua/batm_scenes/accountselection.lua:
--[[-------------------------------------------------------------------------
Allows the user to select between there personal account and there 
---------------------------------------------------------------------------]]
surface.CreateFont( "batm_accountselect_button", {
	font = "Coolvetica",
	extended = false,
	size = 75,
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

surface.CreateFont( "batm_accountselect_button_small", {
	font = "Coolvetica",
	extended = false,
	size = 55,
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

surface.CreateFont( "batm_accountselect_button_smallest", {
	font = "Coolvetica",
	extended = false,
	size = 40,
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

surface.CreateFont( "batm_accountselect_title", {
	font = "Coolvetica",
	extended = false,
	size = 100,
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

local arrow = Material("bluesatm/arrow.png", "noclamp smooth")

local scene = {}

scene.personalAccountHovered = false
scene.personalgroupAccountHovered = false

scene.pageoffset = 0

--Called when the scene is loaded
function scene.Load(ent)

	scene.pageoffset = 0

	scene.SetUpButtons(ent)

end

function scene.SetUpButtons(ent)
	local account = BATM.PersonalAccount

	ent:ClearButtons()

	--Personal account
	ent:AddButton(65, 285, 378, 345, 
		--Pressed
		function(ent)
			ent:SetScene("loading")
			timer.Simple(1, function() --Little load delay, not to much that its annoying but enough to make it look cool
				net.Start("blueatm")
				net.WriteUInt(BATM_NET_COMMANDS.selectAccount,8)
				net.WriteEntity(ent)
				net.WriteString("personal")
				net.SendToServer()

				BATM.SelectedAccount = "personal"
			end)
		end,
		--Mouse enter
		function(ent)
			scene.personalAccountHovered = true
		end,
		--Mouse Exit
		function(ent)
			scene.personalAccountHovered = false
		end
	)

	--Increate group scroll
	ent:AddButton(847, 400, 112, 106, 
		--Pressed
		function(ent)
			scene.pageoffset = scene.pageoffset - 1
			scene.SetUpButtons(ent)
		end
	)

	--Decrement group scroll
	ent:AddButton(847, 523, 112, 106, 
		--Pressed
		function(ent)
			scene.pageoffset = scene.pageoffset + 1
			scene.SetUpButtons(ent)
		end
	)

 	--Personal group
	ent:AddButton(458, 285, 504, 100, 
		--Pressed
		function(ent)
			ent:SetScene("loading")
			timer.Simple(1, function() --Little load delay, not to much that its annoying but enough to make it look cool
				net.Start("blueatm")
				net.WriteUInt(BATM_NET_COMMANDS.selectAccount,8)
				net.WriteEntity(ent)
				net.WriteString("personalgroup")
				net.SendToServer()

				BATM.SelectedAccount = "personalgroup"
			end)
		end,
		--Mouse enter
		function(ent)
			scene.personalgroupAccountHovered = true
		end,
		--Mouse Exit
		function(ent)
			scene.personalgroupAccountHovered = false
		end
	)

	--add the buttons to select a group account
		--Draw the first free groups
	if account ~= nil then

		local yOffset = 400 + 40 + 7

		if 4 + scene.pageoffset > table.Count(account.groupAccounts) then
			scene.pageoffset = 0 --Reset it
		end

		for i = 1, 4 do
			local index = i + (scene.pageoffset)

			if account.groupAccounts[index] == nil then 
				continue 
			end

			ent:AddButton(456, yOffset, 377, 40,
				function()
					ent:SetScene("loading")
					timer.Simple(1, function() --Little load delay, not to much that its annoying but enough to make it look cool
						net.Start("blueatm")
						net.WriteUInt(BATM_NET_COMMANDS.selectAccount,8)
						net.WriteEntity(ent)
						net.WriteString("group")
						net.WriteString(account.groupAccounts[index].id)
						net.SendToServer()

						BATM.SelectedAccount = "group"
					end)
				end
			)
			yOffset = yOffset +47
		end
	end
end

--Draw code
function scene.Draw(ent, ScrW, ScrH)
 
	local account = BATM.PersonalAccount

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw title
	draw.SimpleText(BATM.Lang["Select an account."], "batm_accountselect_title", ScrW/2, 140, Color(255,255,255,255), 1)

	--Draw personal account button
	if scene.personalAccountHovered then
		draw.RoundedBox(0,65,285,378, 345, Color(45 * 1.2, 204 * 1.2, 112 * 1.2))
	else
		draw.RoundedBox(0,65,285,378, 345, Color(45, 204, 112))
	end
	draw.SimpleText(BATM.Lang["Personal"], "batm_accountselect_button",65 + (378/2), 285 + (345/2) - 30, Color(255,255,255,255), 1, 1)
	draw.SimpleText(BATM.Lang["Account"], "batm_accountselect_button",65 + (378/2), 285 + (345/2) + 30, Color(255,255,255,255), 1, 1)

	--Draw group button
	draw.RoundedBox(0, 458, 285, 504, 100, Color(154, 89, 181))
	draw.SimpleText(BATM.Lang["My Group Account"], "batm_accountselect_button_small",458 + (504/2), 285 + (100/2), Color(255,255,255,255), 1, 1)

	--Draw group selection
	draw.RoundedBox(0, 456, 400, 377, 40, Color(50, 151, 219))
	draw.SimpleText(BATM.Lang["Other Group Accounts"], "batm_accountselect_button_smallest",456 + (377/2), 400 + (40/2), Color(255,255,255,255), 1, 1)

	--Draw the first free groups
	if account ~= nil then

		local yOffset = 400 + 40 + 7

		if 4 + scene.pageoffset > table.Count(account.groupAccounts) then
			scene.pageoffset = 0 --Reset it
		end

		for i = 1, 4 do
			local index = i + (scene.pageoffset)

			if account.groupAccounts[index] == nil then 
				continue 
			end

			local color = Color(52, 73, 94)
			if i%2 == 0 then
				color = Color(52 * 1.1, 73 * 1.1, 94 * 1.1)
			end
			draw.RoundedBox(0, 456, yOffset, 377, 40, color)
			draw.SimpleText(account.groupAccounts[index].name, "batm_accountselect_button_smallest",456 + (377/2), yOffset + (40/2), Color(255,255,255,255), 1, 1)	
			yOffset = yOffset +47
		end
	end


	--Draw group arrow (up)
	draw.RoundedBox(0, 847, 400, 112, 106, Color(231, 126, 34))
	surface.SetDrawColor(Color(255,255,255,255))
	surface.SetMaterial(arrow)
	surface.DrawTexturedRectRotated(847 + (112/2),400 + (106/2), 68, 50, 0)

	--Draw group arrow (down)
	draw.RoundedBox(0, 847, 523, 112, 106, Color(231, 126, 34))
	surface.SetDrawColor(Color(255,255,255,255))
	surface.SetMaterial(arrow)
	surface.DrawTexturedRectRotated(847 + (112/2), 523 + (106/2), 68, 50, 180)

 	--Draw the cursor position
  	BATM.Scenes["cursor"].Draw(ent, ScrW, ScrH)

end

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when a the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "accountselection")


--PATH lua/catmullromcams/cl_language_defs.lua:
language.Add("Tool.catmullrom_camera.name", "Catmull-Rom Cinematic Cameras: Track Layout")
language.Add("Tool.catmullrom_camera.desc", "Spawn a new segment on your current numpad key's track.")
language.Add("Tool.catmullrom_camera.0",    "Left click to spawn a new segment, or to update mutable settings on an existing camera.\nRight click to spawn a new segment that will track an entity.")

language.Add("Tool.catmullrom_camera_duration.name", "Catmull-Rom Cinematic Cameras: Duration Editor")
language.Add("Tool.catmullrom_camera_duration.desc", "Modifies a track segment's duration.")
language.Add("Tool.catmullrom_camera_duration.0",    "Left click to set the duration of a track segment. Right click to copy it.\nReload to reset it to default (2 sec.). Use shift + left click for setting meters per seconds.")

language.Add("Tool.catmullrom_camera_numpad_trigger.name", "Catmull-Rom Cinematic Cameras: Numpad Trigger Editor")
language.Add("Tool.catmullrom_camera_numpad_trigger.desc", "Allows you to specify numpad keys to be presed when the track reaches a specific node.")
language.Add("Tool.catmullrom_camera_numpad_trigger.0",    "Left click to set the numpad keys to be triggered when selected node is reached.\nRight click to copy a node's settings. Reload to reset the node.")

language.Add("Tool.catmullrom_camera_looker.name", "Catmull-Rom Cinematic Cameras: Smart Look Modifier")
language.Add("Tool.catmullrom_camera_looker.desc", "You can make the camera search around for something interesting to look at instead of always looking the same way.")
language.Add("Tool.catmullrom_camera_looker.0",    "Left click to apply settings. Right click to copy. Reload to reset.")

language.Add("Tool.catmullrom_camera_map_io.name", "Catmull-Rom Cinematic Cameras: Map I/O Modifier")
language.Add("Tool.catmullrom_camera_map_io.desc", "Useful only for mappers! Allows you to specify the OnUser output(s) to call when you reach a node.")
language.Add("Tool.catmullrom_camera_map_io.0",    "Left click apply settings. Right click to copy. Reload to reset.")

language.Add("Tool.catmullrom_camera_linker.name", "Catmull-Rom Cinematic Cameras: Track Linker")
language.Add("Tool.catmullrom_camera_linker.desc", "You can link two tracks and merge them using this tool.")
language.Add("Tool.catmullrom_camera_linker.0",    "Left click on the first track.")
language.Add("Tool.catmullrom_camera_linker.1",    "Now left click on the second track. Reload to cancel.")

language.Add("Tool.catmullrom_camera_hitchcock.name", "Catmull-Rom Cinematic Cameras: Hitchcock Effect")
language.Add("Tool.catmullrom_camera_hitchcock.desc", "Vomit your guts out with this useful tool! Now you can create that sickening effect that those poor people on the Galactica have to suffer when they jump.")
language.Add("Tool.catmullrom_camera_hitchcock.0",    "Left on an end node to setup a Hitchcock sequence. (Makes 4 nodes due to the way the effect works.)")

language.Add("Undone.CatmullRomCamera", "Undone Catmull-Rom Camera Segment")
language.Add("Undone.CatmullRomCamsHitchcockEffect", "Undone Hitchcock Effect Shot")

--PATH lua/catmullromcams/sh_general_hooks.lua:

if CLIENT then
	CatmullRomCams.CL.TunnelingTracer = {}
	--CatmullRomCams.CL.TunnelingTracer.mask = MASK_NPCWORLDSTATIC
	
	function CatmullRomCams.CL.CalcViewOverride(ply, origin, angles, fov)
		local weap = ply:GetActiveWeapon()
		
		local toolmode_active = (CatmullRomCams.SToolMethods.ToolObj and (GetConVar( "gmod_toolmode"):GetString() == "catmullrom_camera") and weap and weap:IsValid() and (weap:GetClass() == "gmod_tool"))
		local playing_track   = ply:GetNWEntity("UnderControlCatmullRomCamera") and ply:GetNWEntity("UnderControlCatmullRomCamera"):IsValid()
		
		if not (toolmode_active or playing_track) then return end
		
		local overrides = {}
		overrides.origin = origin
		overrides.angles = angles
		overrides.fov    = fov
		
		if playing_track then
			overrides.fov = ply.CatmullRomCamsTrackZoom or fov
		else
			overrides.fov      =  CatmullRomCams.SToolMethods.ToolObj:GetClientNumber("zoom") or 75
			overrides.angles.r = (CatmullRomCams.SToolMethods.ToolObj:GetClientNumber("enable_roll") == 1) and CatmullRomCams.SToolMethods.ToolObj:GetClientNumber("roll") or angles.r
		end
		
		CatmullRomCams.CL.TunnelingTracer.start  = origin
		CatmullRomCams.CL.TunnelingTracer.endpos = origin-- + angles:Forward()
		
		return overrides
	end
	hook.Add("CalcView", "CatmullRomCams.CL.CalcViewOverride", CatmullRomCams.CL.CalcViewOverride)
	
	function CatmullRomCams.CL.HUDHide(element)
		local ply = LocalPlayer()
		if not IsValid(ply) then return end

		local cam = ply:GetNWEntity("UnderControlCatmullRomCamera", NULL)
		if not IsValid(cam) then return end
	
		if IsValid(cam) then
			return false
		end
	end
	hook.Add("HUDShouldDraw", "CatmullRomCams.CL.HUDHide", CatmullRomCams.CL.HUDHide)
	
	function CatmullRomCams.CL.BlackenScreenDuringTunneling()
		local ply = LocalPlayer()
		if not IsValid(ply) then return end

		local cam = ply:GetNWEntity("UnderControlCatmullRomCamera", NULL)
		if not IsValid(cam) then return end
	
		if IsValid(cam) then
			local tr = util.TraceLine(CatmullRomCams.CL.TunnelingTracer)
	
			if (tr.FractionLeftSolid == 1) then
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawRect(0, 0, ScrW(), ScrH())
			end
		end
	end
	hook.Add("RenderScreenspaceEffects", "CatmullRomCams.CL.BlackenScreenDuringTunneling", CatmullRomCams.CL.BlackenScreenDuringTunneling)
else
	function CatmullRomCams.SH.Toggle(ply, ent, idx, buttoned)
		if ent and ply and ply.IsPlayer and ent.IsValid and ply:IsPlayer() and ent:IsValid() and (ent:GetClass() == "sent_catmullrom_camera") then
			return ent:Toggle(ply)
		end
	end
	numpad.Register("CatmullRomCamera_Toggle", CatmullRomCams.SH.Toggle)

	function CatmullRomCams.SH.GravGunPuntStopper(ply, ent)
		if ent and ent.IsValid and ent:IsValid() and (ent:GetClass() == "sent_catmullrom_camera") then
			return false
		end
	end
	hook.Add("GravGunPunt", "CatmullRomCams.SH.GravGunPuntStopper", CatmullRomCams.SH.GravGunPuntStopper)
end

--PATH lua/catmullromcams/stools/sh_linker.lua:
local STool = {}

CatmullRomCams.SToolMethods.Linker = STool

STool.EntA = nil

local Hackz = {}

function STool.LeftClick(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return true end
	
	local ply   = self:GetOwner()
	local plyID = ply:UniqueID()
	
	if not trace.Entity.UndoData.PID == plyID then return end
	
	if not Hackz[ply] then
		Hackz[ply] = trace.Entity.UndoData.Key
		
		self:SetStage(1)
		
		return true
	else
		local newkey        = trace.Entity.UndoData.Key
		
		local newcontroller = CatmullRomCams.Tracks[plyID][newkey][1]
		local newtrackcount = #CatmullRomCams.Tracks[plyID][newkey]
		
		local tbl_track     = {} -- so we don't instate side effects
		
		for k, v in ipairs(CatmullRomCams.Tracks[plyID][Hackz[ply]]) do
			if k == 1 then -- remove 'is controller' flag & set it to be a child of the last node of the other track
				v:SetNWBool("IsMasterController", false)
				v:SetNWEntity("ControllingPlayer", NULL)
				
				local last_cam = CatmullRomCams.Tracks[plyID][newkey][newtrackcount]
				last_cam:DeleteOnRemove(v) -- Because we don't want to have broken chains let's daisy chain them to self destruct
				last_cam:SetNWEntity("ChildCamera", v)
			end
			
			-- change key, change track id & update controller
			v.UndoData.Key = newkey
			v.UndoData.TrackIndex = newtrackcount + k
			
			v:SetNWEntity("MasterController", newcontroller)
			
			tbl_track[newtrackcount + k] = v
		end
		
		CatmullRomCams.Tracks[plyID][Hackz[ply]] = {}
		
		table.Merge(CatmullRomCams.Tracks[plyID][Hackz[ply]], tbl_track)
		
		self:SetStage(0)
		Hackz[ply] = nil
		
		return true
	end
end

function STool.RightClick(self, trace)
	if not self:ValidTrace(trace) then return end
end

function STool.Reload(self, trace)
	if self:GetStage() == 1 then
		self:SetStage(0)
		
		Hackz[self:GetOwner()] = nil
		
		return true
	end
end

function STool.Think(self)
	if SERVER then return end
end

function STool.BuildCPanel(panel)
end
--PATH lua/catmullromcams/stools/sh_smart_look.lua:
local STool = {}

CatmullRomCams.SToolMethods.SmartLook = STool

function STool.LeftClick(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return true end
	
	trace.Entity:SetSmartLook(true)
	trace.Entity:SetSmartLookPerc(self:GetClientNumber("percent"))
	trace.Entity:SetSmartLookRange(self:GetClientNumber("range") or 512)
	trace.Entity:SetSmartLookTraceFilter(self:GetClientNumber("block") or 0)
	trace.Entity:SetSmartLookTargetFilter(self:GetClientNumber("target") or 1)
	trace.Entity:SetSmartLookClosest(self:GetClientNumber("closest") == 1)
	
	return true
end

function STool.RightClick(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return end
	
	--return true
end

function STool.Reload(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return true end
	
	trace.Entity:SetSmartLook(false)
	trace.Entity:SetSmartLookPerc(1)
	trace.Entity:SetSmartLookRange(512)
	trace.Entity:SetSmartLookTraceFilter(2)
	trace.Entity:SetSmartLookTargetFilter(1)
	
	return true
end

function STool.Think(self)
end

function STool.BuildCPanel(panel)
	local block_filter_listbox = {}
	block_filter_listbox.Label = "Filters For LOS: "
	block_filter_listbox.Options = {}
	block_filter_listbox.Options["NPC Static"]      = {catmullrom_camera_looker_block = MASK_NPCWORLDSTATIC}
	block_filter_listbox.Options["Solid-To-NPC"]    = {catmullrom_camera_looker_block = MASK_NPCSOLID_BRUSHONLY}
	block_filter_listbox.Options["Solid-To-Player"] = {catmullrom_camera_looker_block = MASK_PLAYERSOLID_BRUSHONLY}
	block_filter_listbox.Options["Solid Brush"]     = {catmullrom_camera_looker_block = MASK_SOLID_BRUSHONLY}
	block_filter_listbox.Options["Shot Hull"]       = {catmullrom_camera_looker_block = MASK_SHOT_HULL}
	block_filter_listbox.Options["Shot"]            = {catmullrom_camera_looker_block = MASK_SHOT}
	block_filter_listbox.Options["Opaque"]          = {catmullrom_camera_looker_block = MASK_OPAQUE}
	block_filter_listbox.Options["Water"]           = {catmullrom_camera_looker_block = MASK_WATER}
	block_filter_listbox.Options["NPC Solid"]       = {catmullrom_camera_looker_block = MASK_NPCSOLID}
	block_filter_listbox.Options["Player Solid"]    = {catmullrom_camera_looker_block = MASK_PLAYERSOLID}
	block_filter_listbox.Options["Solid"]           = {catmullrom_camera_looker_block = MASK_SOLID}
	block_filter_listbox.Options["Everything"]      = {catmullrom_camera_looker_block = MASK_ALL}
	block_filter_listbox.Options["Nothing"]         = {catmullrom_camera_looker_block = 0}
	
	local target_filter_listbox = {}
	target_filter_listbox.Label = "Filters For Potential Targets: "
	target_filter_listbox.Options = {}
	target_filter_listbox.Options["Anything"]             = {catmullrom_camera_looker_target = 1}
	target_filter_listbox.Options["Fire + Ignited Stuff"] = {catmullrom_camera_looker_target = 2}
	target_filter_listbox.Options["Props"]                = {catmullrom_camera_looker_target = 3}
	target_filter_listbox.Options["Has Physics Object"]   = {catmullrom_camera_looker_target = 4}
	target_filter_listbox.Options["NPCs"]                 = {catmullrom_camera_looker_target = 5}
	target_filter_listbox.Options["Players"]              = {catmullrom_camera_looker_target = 6}
	target_filter_listbox.Options["Light Entities"]       = {catmullrom_camera_looker_target = 7}
	target_filter_listbox.Options["Particle Systems"]     = {catmullrom_camera_looker_target = 8}
	
	panel:AddControl("Label",  {Text = "Filters For LOS: ", Description = "What should block our line of sight check?"})
	panel:AddControl("listbox", block_filter_listbox) 
	
	panel:AddControl("Label",  {Text = "Filters For Potential Targets: ", Description = "What sort of things should we look for?"})
	panel:AddControl("listbox", target_filter_listbox) 
	
	panel:AddControl("Slider",  {Label = "Percent: ", Description = "How much should we apply the look?", Type = "Float", Min = ".01", Max = "1", Command = "catmullrom_camera_looker_percent"})
	panel:AddControl("Slider",  {Label = "Range: ", Description = "How far should we look?", Type = "Float", Min = "32", Max = "4096", Command = "catmullrom_camera_looker_range"})
	panel:AddControl("CheckBox", {Label = "Closest Target", Description = "Do I NEEED to look for the closest target? Or can I just pick the first one I find?", Command = "catmullrom_camera_looker_closest"})
end




--PATH addons/sl_utils/lua/autorun/sh_legs_compat.lua:
--[[
	   ______                    __   __                   
	  / ____/___ ___  ____  ____/ /  / /   ___  ____ ______
	 / / __/ __ `__ \/ __ \/ __  /  / /   / _ \/ __ `/ ___/
	/ /_/ / / / / / / /_/ / /_/ /  / /___/  __/ /_/ (__  ) 
	\____/_/ /_/ /_/\____/\__,_/  /_____/\___/\__, /____/  
	                                         /____/        
	@Valkyrie, @blackops7799
]]--
    
if (SERVER) then
    AddCSLuaFile("sh_legs.lua")
end

if (CLIENT) then
    hook.Add("ShouldDisableLegs", "GML::Support::Prone", function()
        if (!LocalPlayer().IsProne) then
            return
        end

        if (LocalPlayer():IsProne()) then
            return true
        end
    end)

    hook.Add("ShouldDisableLegs", "GML::Support::MorphMod", function()
        if (!pk_pills) then
            return
        end

        if (pk_pills.getMappedEnt(LocalPlayer())) then
            return true
        end
    end)

	hook.Add("ShouldDisableLegs", "GML::Support::VWallrun", function()
        if (VWallrunning) then
            return true
        end
    end)
    
    hook.Add("ShouldDisableLegs", "GML::Support::Mantle", function()
        if (inmantle) then
            return true
        end
	end)
end

--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/sh_rhandcuffs_config.lua:
--[[
It will now put the player in the driver seat if no seat is available (allows usage of chairs etc)
Added German language (phynx https://steamcommunity.com/profiles/76561198040343084 )
Added checks so if bLogs fails to correctly it will no longer error

Configs added:
None
]]
RHandcuffsConfig = {}

--Contact me on SF for help to translate
--Languages available:
--[[
Chinese
Danish
Dutch
English
French
German
Norwegian
Russian
]]
RHandcuffsConfig.LanguageToUse = "French"
 
RHandcuffsConfig.JailerModel = "models/player/Group01/Female_01.mdl"
RHandcuffsConfig.JailerText = "Jailer"
 
RHandcuffsConfig.BailerModel = "models/Barney.mdl"
RHandcuffsConfig.BailerText = "Bailer"
 
RHandcuffsConfig.CuffSound = "weapons/357/357_reload1.wav"
 
//The bail price for each year so -> YEARS*ThisConfig, so 10 years = 5000 in this case
RHandcuffsConfig.BailPricePerYear = 1000
//How many years(minutes) can a player be arrested for?
RHandcuffsConfig.MaxJailYears = 15
//How long it takes to lockpick the cuffs
RHandcuffsConfig.CuffPickTime = 15
//How long it takes to cuff someone
RHandcuffsConfig.CuffTime = 2
//Displays if player is cuffed overhead while aiming at him
RHandcuffsConfig.DisplayOverheadCuffed = true
//Calculates Movement/Penalty, so 2 would make player move half as fast
//Moving penalty while cuffed
RHandcuffsConfig.RestrainedMovePenalty = 3
//Moving penalty while dragging
RHandcuffsConfig.DraggingMovePenalty = 3
//Setting this to true will cause the system to bonemanipulate clientside, might cause sync issues but won't require you to install all playermodels on the server
RHandcuffsConfig.BoneManipulateClientside = false
//Range for cuffing
RHandcuffsConfig.CuffRange = 75
//Range while dragging, if player is too far away the dragging will cancel
RHandcuffsConfig.DragMaxRange = 185
//Maximum of velocity for dragging (raise if dragging is slow)
RHandcuffsConfig.DragMaxForce = 95
//Lower this to raise the velocity of dragging (lower if dragging is slow)
RHandcuffsConfig.DragRangeForce = 120
//Does the player has to be cuffed in order to arrest him?
RHandcuffsConfig.RestrainArrest = false
//Can only arrest players through the jailer NPC
RHandcuffsConfig.NPCArrestOnly = false
//Should the player stay cuffed after arrested?
RHandcuffsConfig.RestrainOnArrest = true
//Cuffs must be removed before you can unarrest if this is set to true
RHandcuffsConfig.UnarrestMustRemoveCuffs = true
//Give rewards when successfully arrested someone?
RHandcuffsConfig.ArrestReward = true
//Reward amount
RHandcuffsConfig.ArrestRewardAmount = 2500
//Reward for each weapon
RHandcuffsConfig.ConfiscateRewardAmount = 1000
--[[
1 = Only cuffing player can drag
2 = Only jobs in the RHC_PoliceJobs can drag
3 = Anyone can drag
]]
RHandcuffsConfig.DraggingPermissions = 3
//Key to drag a player
//https://wiki.garrysmod.com/page/Enums/IN
RHandcuffsConfig.KEY = IN_USE
 
RHandcuffsConfig.SurrenderEnabled = false
//All keys can be found here -> https://wiki.garrysmod.com/page/Enums/KEY
//Key for surrendering
RHandcuffsConfig.SurrenderKey = KEY_K
 
//Disables drawing player shadow
//Only use this if the shadows are causing issues
//This is a temp fix, will be fixed in the future
RHandcuffsConfig.DisablePlayerShadow = false
 
RHandcuffsConfig.BlackListedWeapons = {
["gmod_tool"] = true,
["keys"] = true,
["pocket"] = true,
["driving_license"] = true,
["weapon_physcannon"] = true,
["gmod_camera"] = true,
["weapon_physgun"] = true,
["weapon_r_restrained"] = true,
["tbfy_surrendered"] = true,
["weapon_r_cuffed"] = true,
["alter_acide"] = true,
["alter_megamuscle"] = true,
["alter_cremation"] = true,
["alter_dark_shadow"] = true,
["alter_dragon"] = true,
["alter_durcissement"] = true,
["alter_electrique"] = true,
["alter_engine"] = true,
["alter_explosion"] = true,
["alter_glace"] = true,
["alter_gravite"] = true,
["alter_feu"] = true,
["alter_eau"] = true,
["alter_portail"] = true,
["alter_prevoyance"] = true,
["alter_soins"] = true,
["alter_trou_noir"] = true,
["alter_vent"] = true,
["alter_vibration"] = true,
["alter_voice"] = true,
["alter_wings"] = true,
["collections_bag"] = true
}
 
//Sets players to a specific team when arrested
RHandcuffsConfig.SetTeamOnArrest = false
//Allow DarkRP to create teams
timer.Simple(3, function()
    //The team it sets on player during jailtime if enabled
    RHandcuffsConfig.ArrestTeam = TEAM_GANG
    //Jobs that can use the cuffs and gets it as loadout
    RHandcuffsConfig.PoliceJobs = {TEAM_CCG1, TEAM_CCG2, TEAM_CCG3, TEAM_CCG4, TEAM_CCG5, TEAM_CCG6, TEAM_CCG7, TEAM_CCG8, TEAM_CCG9, TEAM_CCG10, TEAM_CCG11, TEAM_CCG12, TEAM_CCG13, TEAM_CCG14, TEAM_CCG15, TEAM_CCG16, TEAM_CCG17, TEAM_CCG18, TEAM_CCG19, TEAM_CCG20}
end)
 
//Add all female models here or the handcuffs positioning will be weird
//It's case sensitive, make sure all letters are lowercase
RHandcuffsConfig.FEMALE_MODELS = {
    "models/player/group01/female_01.mdl",
    "models/player/group01/female_02.mdl",
    "models/player/group01/female_03.mdl",
    "models/player/group01/female_04.mdl",
    "models/player/group01/female_05.mdl", 
    "models/player/group01/female_06.mdl",
    "models/player/group03/female_01.mdl",
    "models/player/group03/female_02.mdl",
    "models/player/group03/female_03.mdl",
    "models/player/group03/female_04.mdl",
    "models/player/group03/female_05.mdl", 
    "models/player/group03/female_06.mdl",
}
--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/languages/german.lua:
//Translated by phynx (https://steamcommunity.com/profiles/76561198040343084 )
RHandcuffsConfig.Language =  RHandcuffsConfig.Language or {}
RHandcuffsConfig.Language["German"] = {
CuffedBy = "Du wurdest von %s festgenommen",
Cuffer = "Du hast %s festgenommen.",
ReleasedBy = "Du wurdest von %s freigelassen",
Releaser = "Du hast %s freigelassen.",
 
CantEnterVehicle = "Du kannst nicht in ein Fahrzeug einsteigen w�hrend du Handschellen an hast!",
CantLeaveVehicle = "Du bist verhaftet und kannst das Auto nicht verlassen!",
CantSpawnProps = "Du kannst w�hrend du festgenommen bist keine Props spawnen!",
CantChangeTeam = "Du kannst den Job nicht wechseln w�hrend du festgenommen bist.",
CantSwitchSeat = "Du kannst w�hrend du festgenommen bist deinen Sitzplatz nicht �ndern.",
 
ConfiscateReward = "Du hast %s� f�r das konfiszieren einer Waffe erhalten.",
ArrestReward = "Du hast %s� f�r die Festnahme von %s erhalten.",
AlreadyArrested = "Dieser Spieler ist bereits festgenommen!",
MustBeCuffed = "Du musst den Spieler verhaften!",
ReqLockpick = "Knacke das Schloss der Handschellen um den Spieler freizulassen!",

PlayerPutInDriver = "Player was put in driver seat.",
CantCuffRestrained = "Du kannst keinen gefesselten Spieler festnehmen.",
NoSeats = "Keine Sitzpl�tze!",
CuffingText = "%s festnehmen",
TazedPlayer = "Spieler getazerd",
 
CuffedText = "Du bist festgenommen!",
SurrenderedText = "Du gibst auf!",
}
--PATH addons/tlib/lua/autorun/sh_tlib_load.lua:
local function loadSH( sPath )
    if SERVER then
        AddCSLuaFile( "tlib/" .. sPath )
        include( "tlib/" .. sPath )
    end

    if CLIENT then
        include( "tlib/" .. sPath )
    end
end

local function loadSV( sPath )
    if SERVER then
        include( "tlib/" .. sPath )
    end
end

local function loadCL( sPath, bAddOnly )
    if SERVER then
        AddCSLuaFile( "tlib/" .. sPath )
    end
    if CLIENT and not bAddOnly then
        include( "tlib/" .. sPath )
    end
end

--[[

     Init file loading

]]--

if TLib then
    loadSH, loadSV, loadCL = nil, nil, nil
    return
end

if SERVER then
    MsgC( Color( 0, 255, 0 ), "\n[TLib] ", color_white, "Initialization...\n" )
end

loadSH( "shared/init.lua" )
loadSH( "config.lua" )

-- local sLang = ( TLib.Cfg.Language or "en" )
-- loadSH( "shared/i18n/" .. sLang .. ".lua" )

-- if SERVER then
--     MsgC( Color( 0, 255, 0 ), "[TLib] ", color_white, "Language set to " .. string.upper( sLang ) .. "\n" )
-- end

loadSH( "shared/util.lua" )
loadSH( "shared/functions.lua" )

loadSV( "server/init.lua" )
loadSV( "server/util.lua" )
loadSV( "server/functions.lua" )
loadSV( "server/commands.lua" )

loadCL( "client/init.lua" )
loadCL( "client/util.lua" )
loadCL( "client/functions.lua" )

loadCL( "client/derma/frame.lua" )
loadCL( "client/derma/button.lua" )
loadCL( "client/derma/checkbox.lua" )
loadCL( "client/derma/combobox.lua" )
loadCL( "client/derma/notify.lua" )
loadCL( "client/derma/scroll.lua" )
loadCL( "client/derma/textentry.lua" )
loadCL( "client/derma/toast.lua" )
loadCL( "client/derma/test.lua" )

-- Clear cached funcs
loadSH, loadSV, loadCL = nil, nil, nil

-- TLib is loaded at this point
hook.Run( "OnTLibLoaded" )

if SERVER then
    MsgC( Color( 0, 255, 0 ), "[TLib] ", color_white, "Successfully loaded TLib!\n\n" )
end
--PATH addons/tlib/lua/tlib/client/util.lua:
local draw = draw
local math = math

local CurTime = CurTime
local LocalPlayer = LocalPlayer

local tBgColor = TLib:C( 0 )
local tMainColor = TLib:C( 6 )
local tShadowColor = ColorAlpha( color_black, 240 )

--[[

    TLib:IsEntityInRange
        Desc: Performs optimized distance checks between LocalPlayer and an entity, can be called every tick without much CPU impact
        Params: Target (entity), Range (number), Delay (number)
        Return: Entity in range (boolean)

]]--

function TLib:IsEntityInRange( eEnt, iRange, fDelay )
    if not IsValid( eEnt ) then
        return
    end

    if ( CurTime() > ( eEnt.iNextDistCheck or 0 ) ) then
        if not IsValid( LocalPlayer() ) then
            return
        end

        eEnt.iLastDist = LocalPlayer():GetPos():DistToSqr( eEnt:GetPos() )
        eEnt.iNextDistCheck = ( CurTime() + ( fDelay or 1 ) )
    end

    return ( eEnt.iLastDist <= iRange )
end

--[[

    TLib:DrawEdges (1: Top left, 2: Top right, 3: Bottom right, 4: Bottom left)

]]--

local tCornerPoly = {
    [ 1 ] = function( iX, iY, iW, iH, iBarW, iBarH, iBarS )
        local iX1, iX2 = ( iX + iBarW ), ( iX + iBarS )
        local iY1, iY2 = ( iY + iBarS ), ( iY + iBarH )
        return {
            { x = iX, y = iY }, { x = iX1, y = iY }, { x = iX1, y = iY1 }, { x = iX2, y = iY1 }, { x = iX2, y = iY2 }, { x = iX, y = iY2 }
        }
    end,
    [ 2 ] = function( iX, iY, iW, iH, iBarW, iBarH, iBarS )
        local iX1, iX2 = ( iX + ( iW - iBarS ) ), ( iX + ( iW - iBarW ) )
        local iY1, iY2 = ( iY + iBarS ), ( iY + iBarH )
        return {
            { x = iX1, y = iY1 }, { x = iX2, y = iY1 }, { x = iX2, y = iY }, { x = iX + iW, y = iY }, { x = iX + iW, y = iY2 }, { x = iX1, y = iY2 }
        }
    end,
    [ 3 ] = function( iX, iY, iW, iH, iBarW, iBarH, iBarS )
        local iX1, iX2 = ( iX + ( iW - iBarS ) ), ( iX + ( iW - iBarW ) )
        local iY1, iY2 = ( iY + ( iH - iBarS ) ), ( iY + ( iH - iBarH ) )
        return {
            { x = iX1, y = iY1 }, { x = iX1, y = iY2 }, { x = iX + iW, y = iY2 }, { x = iX + iW, y = iY + iH }, { x = iX2, y = iY + iH }, { x = iX2, y = iY1 }
        }
    end,
    [ 4 ] = function( iX, iY, iW, iH, iBarW, iBarH, iBarS )
        local iX1, iX2 = ( iX + iBarS ), ( iX + iBarW )
        local iY1, iY2 = ( iY + ( iH - iBarS ) ), ( iY + ( iH - iBarH )  )
        return {
            { x = iX, y = iY + iH }, { x = iX, y = iY2 }, { x = iX1, y = iY2 }, { x = iX1, y = iY1 }, { x = iX2, y = iY1 }, { x = iX2, y = iY + iH }
        }
    end,
}

function TLib:DrawEdges( iX, iY, iW, iH, iBarW, iBarH, iBarS )
    draw.NoTexture()
    for k, v in ipairs( tCornerPoly ) do
        surface.DrawPoly( v( iX, iY, iW, iH, iBarW, iBarH, iBarS ) )
    end
end

--[[

    TLib:DrawProgressBar

]]--

function TLib:DrawProgressBar( iX, iY, iW, iH, iProg, tColor )
    local iProgW = ( math.Clamp( 0, iProg, 100 ) * iW / 100 )

    surface.SetDrawColor( tBgColor )
    surface.DrawRect( iX, iY, iW, iH )

    surface.SetDrawColor( tColor or tMainColor )
    surface.DrawRect( iX, iY, ( iW - iProgW ), iH )
end

--[[

    TLib:DrawLoader

]]--

function TLib:DrawLoader( iX, iY, iW, iH, iPoints )
    local iPoints = ( iPoints or 6 )
    local iBranchH = ( iW / ( iPoints * 2 ) )

    for i = 1, iPoints do
        local iBranchX = ( iX + ( ( i - 1 ) * ( iBranchH * 2 ) ) )
        local iBranchY = ( iY + TimedSin( 1, ( iH * .5 ), 0, ( i /2 ) ) )
        local iScale = ( iBranchY * iBranchH / iH )

        surface.DrawRect( iBranchX, iBranchY, iScale, iScale )
    end
end

--[[

    TLib:DrawEntOverhead

]]--

local iOffsetY = 20

function TLib:DrawEntOverhead( eEnt, sText1, sText2, sText3 )
    if ( CurTime() > ( eEnt.iNextOHCheck or 0 ) ) then
        iOffsetY = ( ScrH() * .02 )
        eEnt.iMaxZ = ( eEnt.iMaxZ or eEnt:OBBMaxs().z )
        eEnt.iNextOHCheck = ( CurTime() + 5 )
    end

    local tToScreen = ( eEnt:GetPos() + ( eEnt:GetUp() * eEnt.iMaxZ ) ):ToScreen()

    cam.Start2D()
        if sText1 then
            TLib:TextShadow( sText1, "TLib.Small", tToScreen.x, ( tToScreen.y - ( iOffsetY * 2 ) ), color_white, 1, 1 )
        end
        if sText2 then
            TLib:TextShadow( sText2, "TLib.Big", tToScreen.x, ( tToScreen.y - iOffsetY ), color_white, 1, 1 )
        end
        if sText3 then
            TLib:TextShadow( sText3, "TLib.Small", tToScreen.x, tToScreen.y, color_white, 1, 1 )
        end
    cam.End2D()

    return tToScreen
end

--[[

    TLib:KeyTooltip

]]--

local tKeysTT = {}
hook.Add( "OnScreenSizeChanged", "TLib_ClearKeysTT", function( iOldW, iOldH )
	tKeysTT = {}
end )

function TLib:KeyTooltip( sKey, sText, iX, iY )
    if not tKeysTT[ sKey ] then
        surface.SetFont( "TLib.Big" )
        local iKeyW, iKeyH = surface.GetTextSize( sKey )
        tKeysTT[ sKey ] = { w = iKeyW + ( iKeyH * .5 ), h = ( iKeyH * .8 ) }
        return
    end

    local tKey = tKeysTT[ sKey ]

    draw.RoundedBox( ( tKey.h * .25 ), iX - ( tKey.w * .5 ), iY - ( tKey.h * .5 ) + 3, tKey.w, tKey.h, TLib:C( 2 ) )
    draw.RoundedBox( ( tKey.h * .25 ), iX - ( tKey.w * .5 ) + 1, iY - ( tKey.h * .5 ) + 1, tKey.w - 2, tKey.h - 1, TLib:C( 5 ) )

    draw.SimpleText( sKey, "TLib.Big", iX, iY + 1, TLib:C( 2 ), 1, 1 )

    if sText then
        TLib:TextShadow( sText, "TLib.Standard", iX + ( tKey.w * .5 ) + 6, iY, TLib:C( 5 ), 0, 1 )
    end
end

--[[

    TLib:TextShadow

]]--



function TLib:TextShadow( sText, sFont, iX, iY, tTextCol, iAlignX, iAlignY, iDist, iAlpha )
    -- local tText = { text = sText, font = sFont, pos = { iX, iY }, xalign = iAlignX, yalign = iAlignY, color = tTextCol }

    -- draw.TextShadow( tText, 2, 240 )
    -- draw.Text( tText )

    draw.SimpleText( sText, sFont, iX + 2, iY + 2, tShadowColor, iAlignX, iAlignY )
    draw.SimpleText( sText, sFont, iX, iY, tTextCol, iAlignX, iAlignY )
end
--PATH addons/tlib/lua/tlib/client/derma/scroll.lua:
local PANEL = {}

--[[

    PANEL:Init

]]--

function PANEL:Init()
    local iMargin, iRoundness = TLib:ScaleVGUI()

    self.tBgColor = TLib:C( 1 )
    self.tGripColor = TLib:C( 2 )

    self.Paint = nil

    local dPanel = self
    local dVBar = self:GetVBar()

    dVBar:SetHideButtons( true )
    dVBar:SetWide( iMargin * .5 )

    -- Background
    function dVBar:Paint( iW, iH )
        surface.SetDrawColor( dPanel.tBgColor )
        surface.DrawRect( 0, 0, iW, iH )
    end

    -- Grip
    function dVBar.btnGrip:Paint( iW, iH )
        surface.SetDrawColor( dPanel.tGripColor )
        surface.DrawRect( 0, 0, iW, iH )
    end
end

--[[

    PANEL:AlignContents

]]--

function PANEL:AlignContents( iMargin, iMarginH )
    local iMargin = ( iMargin or 0 )
    local bEnabled = self:GetVBar().Enabled
    local iW = false

    for k, v in ipairs( self:GetCanvas():GetChildren() ) do
        v:Dock( TOP )

        if bEnabled then
            iW = ( iW or ( v:GetWide() - self:GetVBar():GetWide() - iMargin ) )
            v:SetWide( iW )

            v:DockMargin( 0, 0, iMargin, ( iMarginH or iMargin ) )
        else
            v:DockMargin( 0, 0, 0, ( iMarginH or iMargin ) )
        end
    end
end

--[[

    PANEL:SetBgColor

]]--

function PANEL:SetBgColor( tColor )
    self.tBgColor = tColor
end

--[[

    PANEL:SetGripColor

]]--

function PANEL:SetGripColor( tColor )
    self.tGripColor = tColor
end

-- Register VGUI element
vgui.Register( "TLScroll", PANEL, "DScrollPanel" )
PANEL = nil

--PATH addons/simplistic_presentation/lua/simplistic_presentation/client/cl_nets.lua:

SimplisticPresentation.tKnownPlayers = SimplisticPresentation.tKnownPlayers or {}
SimplisticPresentation.tKnownByWho = SimplisticPresentation.tKnownByWho or {}

net.Receive("SimplisticPresentation:SendKnownPlayers", function()

    local sKnownPly = net.ReadString()
    local tKnownPly = util.JSONToTable(sKnownPly)

    SimplisticPresentation.tKnownPlayers = {}

    for _, v in ipairs(tKnownPly) do
        SimplisticPresentation.tKnownPlayers[v] = true
    end

end)

net.Receive("SimplisticPresentation:KnownByWho", function()

    local sKnownByWho = net.ReadString()
    local tKnown = util.JSONToTable(sKnownByWho)

    SimplisticPresentation.tKnownByWho = {}

    for _, v in ipairs(tKnown) do
        SimplisticPresentation.tKnownByWho[v] = true
    end

end)

net.Receive("SimplisticPresentation:Menu:SendKnownByWho", function()

    local sKnownByWho = net.ReadString()
    local iSelectedUserId = net.ReadString()
    local iPanel = net.ReadUInt(2)

    local tKnown = util.JSONToTable(sKnownByWho)

    if iPanel == 1 and SimplisticPresentation.Config.tAdminModeGroups[LocalPlayer():GetUserGroup()] then

        local vRow = SimplisticPresentation.AdminPanel.vRow
        local vContainer = SimplisticPresentation.AdminPanel.vContainer

        SimplisticPresentation.AdminPanel.bIsFocus = false

        if IsValid(SimplisticPresentation.AdminPanel.vKnoweldgesContainer) or not SimplisticPresentation.AdminPanel.vRowToggle and IsValid(SimplisticPresentation.AdminPanel.vKnoweldgesContainer) then
            SimplisticPresentation.AdminPanel.vKnoweldgesContainer:Remove()
        end

        local vPanel = vgui.Create("DPanel", vContainer)
        vPanel:SetSize(RX(300), RY(0))
        vPanel:SetPos(RX(175), vRow:GetY() + RY(95))

        function vPanel:Paint(w, h)
            draw.RoundedBoxEx(8, RX(0), RY(0), w, h, SimplisticPresentation.Constants.cColors["cHeader"], false, false, true, true)
            draw.RoundedBoxEx(8, RX(5), RY(0), w - RX(10), h - RY(5), SimplisticPresentation.Constants.cColors["cBackground"], false, false, true, true)        
        end

        if #tKnown ~= 0 then

            local vContainerScrollP = vgui.Create("DScrollPanel", vPanel)
            vContainerScrollP:SetSize(RX(300), ((#tKnown > 3 and 3 or #tKnown) * RY(50)))
            vContainerScrollP:SetPos(RX(0), RY(0))
            vContainerScrollP:GetVBar():SetWide(0)

            local vTextEntry = vgui.Create("DTextEntry", SimplisticPresentation.AdminPanel.vDownPanel)
            vTextEntry:SetSize(RX(398), RY(45))
            vTextEntry:SetPos(RX(5), RY(0))
            vTextEntry:SetUpdateOnType(true)
            vTextEntry:SetPaintBackground(false)
            vTextEntry:SetFont("SimplisticPresentation:Font:Subtitle")
            vTextEntry:SetPlaceholderText(SimplisticPresentation:GetSentence("AdminMenu:SearchText"))
            vTextEntry:SetTextColor(SimplisticPresentation.Constants.cColors["cText"])
            vTextEntry:SetDrawLanguageID(false)
            vTextEntry:RequestFocus()

            function vTextEntry:OnChange()

                local sValue = self:GetValue()
                local sSafeValue = string.PatternSafe(sValue)
                vContainerScrollP:Clear()

                SimplisticPresentation.AdminPanel.bIsFocus = true

                for iPos, pPlayer in ipairs(tKnown) do

                    local sName = pPlayer.sName
                    local iUserId = pPlayer.iUserId

                    if string.find(string.lower(sName), string.lower(sSafeValue)) then
                        SimplisticPresentation:AdminMenuKnownRows(sName, iUserId, iSelectedUserId, vContainerScrollP, tKnown, iPos)
                    end

                end

            end

            if not SimplisticPresentation.AdminPanel.bIsFocus then
                for iPos, pPlayer in ipairs(tKnown) do

                    local sName = pPlayer.sName
                    local iUserId = pPlayer.iUserId

                    SimplisticPresentation:AdminMenuKnownRows(sName, iUserId, iSelectedUserId, vContainerScrollP, tKnown, iPos)
                end
            end

            vPanel:SizeTo(RX(300), ((#tKnown > 3 and 3 or #tKnown) * RY(50)), 0.5, 0.3, -1)

        else

            local vLabelNothingFound = vgui.Create( "DLabel", vRow )
            vLabelNothingFound:SetSize(RX(410), RY(45))
            vLabelNothingFound:SetPos(RX(105), RY(50))
            vLabelNothingFound:SetFont("SimplisticPresentation:Font:Subtitle")
            vLabelNothingFound:SetColor(SimplisticPresentation.Constants["cColors"]["cText"])
            vLabelNothingFound:SetText(SimplisticPresentation:GetSentence("AdminMenu:NothingFound"))
            vLabelNothingFound:SetContentAlignment(5)

        end

        SimplisticPresentation.AdminPanel.vKnoweldgesContainer = vPanel

    elseif iPanel == 2 then
        local vPanel = SimplisticPresentation.ManagePanel
        local vSearchButton = SimplisticPresentation.ManagePanel_vSearchButton

        if not IsValid(vPanel) then return end

        if table.IsEmpty(tKnown) then
            vPanel:Remove()
        end

        local vContainer = vgui.Create("DScrollPanel", vPanel)
        vContainer:SetSize(RX(640), RY(335))
        vContainer:SetPos(RX(30), RY(85))
        vContainer:GetVBar():SetWide(0)

        function vSearchButton:Paint(w, h)
            draw.RoundedBoxEx(8, 0, 0, w, h, SimplisticPresentation.Constants.cColors["cHeader"], false, false, true, true)

            surface.SetDrawColor(255,255,255)
            surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mSearch"])
            surface.DrawTexturedRect(RX(5), RY(5), RX(40), RY(40))
        end

        SimplisticPresentation.ManagePanel.SearchIsClicked = false

        function vSearchButton:DoClick()

            LocalPlayer():EmitSound("garrysmod/ui_click.wav")

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

                    SimplisticPresentation.ManagePanel.SearchIsClicked = true

                    function vTextEntry:OnChange()
                        local sValue = self:GetValue()
                        local sSafeValue = string.PatternSafe(sValue)
                        vContainer:Clear()

                        for i, v in ipairs(tKnown) do

                            local sName = v.sName
                            local sId = v.iUserId

                            if string.find(string.lower(sName), string.lower(sSafeValue)) or string.find(string.lower(sId), string.lower(sSafeValue)) then
                                SimplisticPresentation:ManagePanelKnownRows(sName, sId, vContainer, tKnown, i)
                            end

                        end

                    end


                end)
            end)
        end

        if not SimplisticPresentation.ManagePanel.SearchIsClicked then
            for iId, v in ipairs(tKnown) do
                local sName = v.sName
                local sId = v.iUserId

                SimplisticPresentation:ManagePanelKnownRows(sName, sId, vContainer, tKnown, iId)

                if iId == #tKnown then
                    vPanel:SizeTo(RX(700), RY(500), 1.8, 0, .1, function()
                        vPanel.bIsAnimating =  false
                    end)
                end

            end
        end

        function vPanel:OnSizeChanged(w, h)
            if vPanel.bIsAnimating then
                vPanel:Center()
            end
        end

        SimplisticPresentation.ManagePanel_vSearchButton = vSearchButton

    end

end)

net.Receive("SimplisticPresentation:AdminMenu:Open", function()

    if not IsValid(LocalPlayer()) then return end
    if not SimplisticPresentation.Config.tAdminModeGroups[LocalPlayer():GetUserGroup()] then return end

    SimplisticPresentation:OpenAdminPanel()

end)

net.Receive("SimplisticPresentation:ManagePanel:Open", function()

    if not IsValid(LocalPlayer()) then return end

    SimplisticPresentation:OpenManagePanel()

end)
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_sscrollpanel.lua:
local PANEL = {}

local elegantcol, maincol, maincol_5 = Color(255,255,255,3), slib.getTheme("maincolor"), slib.getTheme("maincolor", 5)

function PANEL:Init()
    local scr = self:GetVBar()
    scr:SetHideButtons(true)

    scr.Paint = function(_, w, h)
        surface.SetDrawColor(self.scrollbg or maincol)
        surface.DrawRect(0,0,w,h)
    end    
    scr.btnUp.Paint = function(_, w, h)end
    scr.btnDown.Paint = function(_, w, h)end
    scr.btnGrip.Paint = function(_, w, h)
        draw.RoundedBoxEx(h * .5, w * 0.5 - (w * 0.45 / 2), h * 0.03, w * 0.45, h - h * 0.06, elegantcol, true, true, true, true)
    end

    slib.wrapFunction(self, "SetSize", nil, function() return self end, true)
	slib.wrapFunction(self, "Center", nil, function() return self end, true)
	slib.wrapFunction(self, "SetPos", nil, function() return self end, true)
    slib.wrapFunction(self, "Dock", nil, function() return self end, true)
    slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
    slib.wrapFunction(self, "SetTall", nil, function() return self end, true)
end

function PANEL:Paint(w,h)
    if self.bg then
        surface.SetDrawColor(self.bg)
        surface.DrawRect(0,0,w,h)
    end
end

vgui.Register("SScrollPanel", PANEL, "DScrollPanel")
--PATH addons/gprotect_1.15.101/lua/g_protect/client/cl_overrides.lua:
local custom_for_all_tabs = CreateConVar( "wire_tool_menu_custom_menu_for_all_tabs", 0, {FCVAR_ARCHIVE} ) -- Wiremod Support

local updateToolMenu = function()
    if !gProtect.config.HideToolsInSpawnMenu then return end
    
    local lp = LocalPlayer()

    if !IsValid(lp) or !gProtect or !gProtect.LoadedModules or !gProtect.LoadedModules["toolgunsettings"] then return end

    local perms = gProtect.LoadedModules["toolgunsettings"]
    local usergroup = lp:GetUserGroup()
    local groupToolsRestrictions = perms["groupToolRestrictions"][usergroup]
    
    local wiremodCustomTabs = custom_for_all_tabs:GetBool()
    
    local toolMenu = g_SpawnMenu:GetToolMenu()
    local toolsTab = toolMenu.ToolPanels[1]
    local tabCanvas = toolsTab.List:GetChildren()[1]
    local wireTabCanvas = wiremodCustomTabs and tabCanvas:GetChildren()[1]:GetChildren()[4]

    for _, tab in ipairs((wireTabCanvas or tabCanvas):GetChildren()) do
        local visibleTabs = 0
        local wireTab = wiremodCustomTabs and tab:GetChildren()[3]

        if wireTab then tab = wireTab end

        for _, tool in ipairs(tab:GetChildren()) do
            if !tool.Name then continue end

            local blockedByGroups = groupToolsRestrictions and groupToolsRestrictions and groupToolsRestrictions.list and (groupToolsRestrictions.list[tool.Name] == (groupToolsRestrictions.isBlacklist or false))
            local isBlocked = (perms["restrictTools"][tool.Name] and !perms["bypassGroups"][usergroup]) or blockedByGroups

            tool:SetVisible(!isBlocked)

            if !isBlocked then
                visibleTabs = visibleTabs + 1
            end
        end

        if !wireTab then
            tab:SetVisible(visibleTabs > 0)
        else
            wireTab:GetParent():SetVisible(visibleTabs > 0)
            wireTab:InvalidateLayout(true)
        end

        tab:InvalidateLayout(true)
    end

    tabCanvas:InvalidateLayout(true)
end

hook.Add("gP:ConfigUpdated", "gP:FilterTools", function(moduleName)
    if moduleName == "toolgunsettings" then
        updateToolMenu()
    end
end)

hook.Add("OnSpawnMenuOpen", "gP:FilterTools", function()
    timer.Simple(0, function() updateToolMenu() end)
end)
--PATH addons/gprotect_1.15.101/lua/g_protect/languages/sh_german.lua:
if SERVER then
	slib.setLang("gprotect", "de", "colliding-too-much", "%s's Entities kollidieren zu sehr!")
	slib.setLang("gprotect", "de", "too-many-obstructs", "%s's Entity blockiert zu viele schlechte Entities!")
	slib.setLang("gprotect", "de", "blacklisted-multiple", "Du hast %s Modelle erfolgreich zu den blockieren Modellen hinzugefügt!")
	slib.setLang("gprotect", "de", "unblacklisted-multiple", "Du hast %s Modelle erfolgreich von den blockierten Modellen entfernt!")
	slib.setLang("gprotect", "de", "blacklisted-multiple-ent", "Du hast %s Entities erfolgreich zur Blacklist hinzugefügt!")
	slib.setLang("gprotect", "de", "unblacklisted-multiple-ent", "Du hast %s Entities erfolgreich von der Blacklist entfernt!")
	slib.setLang("gprotect", "de", "added-blacklist", "Du hast %s erfolgreich zu den blockieren Modellen hinzugefügt!")
	slib.setLang("gprotect", "de", "removed-blacklist", "Du hast %s erfolgreich von den blockierten Modellen entfernt")
	slib.setLang("gprotect", "de", "added-blacklist-ent", "Du hast %s erfolgreich zur Entity-Blacklist hinzugefügt!")
	slib.setLang("gprotect", "de", "removed-blacklist-ent", "Du hast %s erfolgreich von der Entity-Blacklist entfernt!")
	slib.setLang("gprotect", "de", "attempted-unfreeze-all", "%s hat versucht, alles nach dem Spawn einer Duplikation zu entfrieren!")
	slib.setLang("gprotect", "de", "attempted-upscaled-ent", "%s hat versucht, ein hochskaliertes Entity mit Adv Dupe 2 zu spawnen!")
	slib.setLang("gprotect", "de", "attempted-rope-spawning", "%s hat versucht, Seile mit Adv Dupe 2 zu spawnen!")
	slib.setLang("gprotect", "de", "attempted-no-gravity", "%s hat versucht, Entities ohne Schwerkraft mit Adv Dupe 2 zu spawnen!")

	slib.setLang("gprotect", "de", "model-restricted", "Die Nutzung dieses Modells wurde beschränkt!")
	slib.setLang("gprotect", "de", "classname-restricted", "Die Nutzung dieser Entity-Klasse wurde beschränkt!")
	slib.setLang("gprotect", "de", "attempted-blackout", "%s hat versucht, den Blackout-Exploit zu nutzen!")
	slib.setLang("gprotect", "de", "spam-spawning", "%s versucht, Entities/Props zu spammen.")

	slib.setLang("gprotect", "de", "too-complex-model", "Dieses Modell wurde eingeschränkt, es ist zu komplex!")
	slib.setLang("gprotect", "de", "too-big-prop", "Dein Prop ist zu groß, desshalb haben wir es entfernt!")
	slib.setLang("gprotect", "de", "successfull-fpp-blockedmodels", "Du hast die blockierten Modelle erfolgreich von FPP nach gProtect übertragen!")
	slib.setLang("gprotect", "de", "successfull-fpp-grouptools", "Du hast die Gruppentools erfolgreich von FPP nach gProtect übertragen!")
	slib.setLang("gprotect", "de", "unsuccessfull-transfer", "Es scheint so als gäbe es ein Problem mit der Datenübertragung! (MySQL wird nicht unterstützt)")

	slib.setLang("gprotect", "de", "you-ghosted-props", "Du hast %s's Props geghostet")
	slib.setLang("gprotect", "de", "you-frozen-props", "Du hast %s's Props eingefroren!")
	slib.setLang("gprotect", "de", "you-removed-props", "Du hast %s's Props entfernt!")

	slib.setLang("gprotect", "de", "props-ghosted", "Deine Props wurden geghostet!")
	slib.setLang("gprotect", "de", "props-frozen", "Deine Props wurden eingefroren!")
	slib.setLang("gprotect", "de", "props-removed", "Deine Props wurden entfernt!")

	slib.setLang("gprotect", "de", "everyones-props-ghosted", "Jemand hat alle Props gehostet!")
	slib.setLang("gprotect", "de", "everyones-props-frozen", "Jemand hat alle Props eingefroren")
	slib.setLang("gprotect", "de", "disconnected-ents-removed", "Du hast alle Entities von getrennten Spielern etnfernt!")

	slib.setLang("gprotect", "de", "insufficient-permission", "Du hast nicht die Berechtigung, dies zu tun!")
	slib.setLang("gprotect", "de", "spawn-to-close", "Dein Prop kann nicht in jemanden gespawnt werden!")
	slib.setLang("gprotect", "de", "entity-ghosted", "Dein Entitiy wurde gehostet!")
elseif CLIENT then
	slib.setLang("gprotect", "de", "title", "gProtect - Einstellungen")
	slib.setLang("gprotect", "de", "buddies-title", "gProtect - Freunde")

	slib.setLang("gprotect", "de", "world", "Welt")
	slib.setLang("gprotect", "de", "disconnected", "Getrennt")
	slib.setLang("gprotect", "de", "toolgun-name", "Blacklist Props")
	slib.setLang("gprotect", "de", "toolgun-desc", "Verwalte blockierte Modelle")
	slib.setLang("gprotect", "de", "toolgun-leftclick", "Füge zu blockierten Modellen hinzu")
	slib.setLang("gprotect", "de", "toolgun-rightclick", "Entferne von blockieren Modellen")
	slib.setLang("gprotect", "de", "toolgun-help", "Schieße auf ein Prop mit dem Werkzeug")
	slib.setLang("gprotect", "de", "remove-on-blacklist", "Entferne prop auf der Blacklist")
	slib.setLang("gprotect", "de", "player-list", "Spielerliste")

	slib.setLang("gprotect", "de", "toolgun", "Toolgun")
	slib.setLang("gprotect", "de", "physgun", "Physgun")
	slib.setLang("gprotect", "de", "gravity-gun", "Gravity Gun")
	slib.setLang("gprotect", "de", "canproperty", "Kann-Eigenschaft")

	slib.setLang("gprotect", "de", "add-blocked-models", "Füge zu blockierten Modellen hinzu")
	slib.setLang("gprotect", "de", "remove-blocked-models", "Entferne von blockierten Modellen")

	slib.setLang("gprotect", "de", "add-blacklisted-ents", "Füge zur Entity-Blacklist hinzu")
	slib.setLang("gprotect", "de", "remove-blacklisted-ents", "Entferne von Entity-Blacklist")
	slib.setLang("gprotect", "de", "copy-clipboard", "In Zwischenablage kopieren")

	slib.setLang("gprotect", "de", "general", "Allgemeines")
	slib.setLang("gprotect", "de", "ghosting", "Ghosting")
	slib.setLang("gprotect", "de", "damage", "Schaden")
	slib.setLang("gprotect", "de", "anticollide", "Anti Kollision")
	slib.setLang("gprotect", "de", "spamprotection", "Spam Schutz")
	slib.setLang("gprotect", "de", "spawnrestriction", "Spawn Beschränkung")
	slib.setLang("gprotect", "de", "toolgunsettings", "Toolgun Einstellungen")
	slib.setLang("gprotect", "de", "physgunsettings", "Physgun Einstellungen")
	slib.setLang("gprotect", "de", "gravitygunsettings", "Gravgun Einstellungen")
	slib.setLang("gprotect", "de", "canpropertysettings", "Kann-Eigenschaft Einstellungen")
	slib.setLang("gprotect", "de", "advdupe2", "Adv Dupe 2")
	slib.setLang("gprotect", "de", "miscs", "Sonstiges")

	slib.setLang("gprotect", "de", "ghost-props", "Props ghosten")
	slib.setLang("gprotect", "de", "remove-props", "Props entfernen")
	slib.setLang("gprotect", "de", "freeze-props", "Props einfrieren")
	slib.setLang("gprotect", "de", "highlight-ents", "Markiere Entities")
	slib.setLang("gprotect", "de", "unhighlight-ents", "Demarkiere Entities")

	slib.setLang("gprotect", "de", "ghost-everyones-props", "Ghoste alle Props")
	slib.setLang("gprotect", "de", "freeze-everyones-props", "Friere alle Props ein")
	slib.setLang("gprotect", "de", "remove-disconnected-props", "Entferne Props von getrennten Spielern")

	slib.setLang("gprotect", "de", "general_remDiscPlyEnt", "Entferne Entities von getrennten Spielern")
	slib.setLang("gprotect", "de", "general_remDiscPlyEnt_tooltip", "Dies entfernt Entities von getrennten Spielern (deaktiviert falls -1.)")
	slib.setLang("gprotect", "de", "general_blacklist", "Blacklist")
	slib.setLang("gprotect", "de", "general_blacklist_tooltip", "Hier werden Klassennamen hinzugefügt, welche von allen Modulen beschützt werden.")
	slib.setLang("gprotect", "de", "general_protectedFrozenEnts", "Geschützte eingefrorene Entities")
	slib.setLang("gprotect", "de", "general_protectedFrozenEnts_tooltip", "Dies ist eine Liste von Entities, die im eingefrorenen Zustand geschützt werden.")
	slib.setLang("gprotect", "de", "general_protectedFrozenGroup", "Geschützte eingefrorene Gruppe")
	slib.setLang("gprotect", "de", "general_protectedFrozenGroup_tooltip", "Diese Kollisionsgruppe wird eingefrorenen Entities zugewiesen.")

	slib.setLang("gprotect", "de", "ghosting_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "ghosting_enabled_tooltip", "Aktiviere das Ghosting-Modul?")
	slib.setLang("gprotect", "de", "ghosting_ghostColor", "Ghosting Farbe")
	slib.setLang("gprotect", "de", "ghosting_ghostColor_tooltip", "Wähle eine Farbe für geghostete Entities")
	slib.setLang("gprotect", "de", "ghosting_antiObscuring", "Anti-Obscuring")
	slib.setLang("gprotect", "de", "ghosting_antiObscuring_tooltip", "Dies verhindert, dass Props entfroren werden, während sie in anderen Objekten stecken. Füg einfach Entities ein, welche nicht verdeckt werden sollen!")
	slib.setLang("gprotect", "de", "ghosting_onPhysgun", "Ghost bei Physgun?")
	slib.setLang("gprotect", "de", "ghosting_onPhysgun_tooltip", "Dies ghostet Entities, welche von der Physgun gehalten werden.")
	slib.setLang("gprotect", "de", "ghosting_useBlacklist", "Verwende Blacklist")
	slib.setLang("gprotect", "de", "ghosting_useBlacklist_tooltip", "Diese Option ghostet Gegenstände auf der Blacklist, falls das Modul aktiv ist.")
	slib.setLang("gprotect", "de", "ghosting_entities", "Entities")
	slib.setLang("gprotect", "de", "ghosting_entities_tooltip", "Klassennamen in dieser Liste werden geghostet. Dies verändert nicht die Blacklist von anderen Modulen.")

	slib.setLang("gprotect", "de", "damage_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "damage_enabled_tooltip", "Aktiviere das Schadens-Modul?")
	slib.setLang("gprotect", "de", "damage_useBlacklist", "Verwende Blacklist")
	slib.setLang("gprotect", "de", "damage_useBlacklist_tooltip", "Diese Option betrachtet die allgemeine Blacklist als eine Entity Blacklist in diesem Modul!")
	slib.setLang("gprotect", "de", "damage_entities", "Entitiy Blacklist")
	slib.setLang("gprotect", "de", "damage_entities_tooltip", "Klassennamen in dieser Liste werden keinen Schaden zufügen, wenn Deaktiviere Schaden aktiv ist, dies modifiziert nicht die Blacklist, die durch andere Module verwendet wird.")
	slib.setLang("gprotect", "de", "damage_blacklistedEntPlayerDamage", "Deaktiviere Schaden von Entities auf der Blacklist")
	slib.setLang("gprotect", "de", "damage_blacklistedEntPlayerDamage_tooltip", "Wenn dies aktiviert ist, dann bekommen Spieler keinen Schaden von Entities, welche auf der Blacklist stehen.")
	slib.setLang("gprotect", "de", "damage_vehiclePlayerDamage", "Deaktiviere Fahrzeugschaden")
	slib.setLang("gprotect", "de", "damage_vehiclePlayerDamage_tooltip", "Wenn dies aktiviert ist, dann bekommen Spieler keinen Schaden von Fahrzeugen.")
	slib.setLang("gprotect", "de", "damage_worldPlayerDamage", "Deaktivierte Weltschaden")
	slib.setLang("gprotect", "de", "damage_worldPlayerDamage_tooltip", "Wenn dies aktiviert ist, dann bekommen Spieler keinen Schaden von Entities, die auf der Blacklist stehen.")
	slib.setLang("gprotect", "de", "damage_immortalEntities", "Unsterbliche Entities")
	slib.setLang("gprotect", "de", "damage_immortalEntities_tooltip", "Klassennamen in dieser Liste werden keinen Schaden nehmen, es sei denn, der Spieler ist in einer Ausnahmegruppe!")
	slib.setLang("gprotect", "de", "damage_bypassGroups", "Ausnahme Gruppen")
	slib.setLang("gprotect", "de", "damage_bypassGroups_tooltip", "Füge Gruppen in dieser Liste hinzu, welche die Schadensbeschränkung umgehen. '*' heißt alle!")
	slib.setLang("gprotect", "de", "damage_canDamageWorldEntities", "Kann Welt-Entities schaden")
	slib.setLang("gprotect", "de", "damage_canDamageWorldEntities_tooltip", "Gruppen in dieser Liste können Welt-Entities Schaden zufügen. '*' heißt alle!")

	slib.setLang("gprotect", "de", "anticollide_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "anticollide_enabled_tooltip", "Aktiviere das Anti-Kollisions Modul?")
	slib.setLang("gprotect", "de", "anticollide_notifyStaff", "Benachrichtige Teammitglieder")
	slib.setLang("gprotect", "de", "anticollide_notifyStaff_tooltip", "Sollen Erkennungen Teammitglieder benachrichtigen? NB: Dies kann verwendet werden, um Teammitglieder zu nerven.")
	slib.setLang("gprotect", "de", "anticollide_protectDarkRPEntities", "Schütze DarkRP Entities")
	slib.setLang("gprotect", "de", "anticollide_protectDarkRPEntities_tooltip", "Sollen wir DarkRP-Entities schützen? (0 = Deaktiviert, 1 = Ghost, 2 = Einfrieren, 3 = Entfernen, 4 = Entfernen & Erstattung)")
	slib.setLang("gprotect", "de", "anticollide_DRPentitiesThreshold", "DRP Entities Schwelle")
	slib.setLang("gprotect", "de", "anticollide_DRPentitiesThreshold_tooltip", "Wie viele Kollisionen kann ein DRP Entity innerhalb einer Sekunde haben, bevor das System ausgelöst wird?")
	slib.setLang("gprotect", "de", "anticollide_DRPentitiesException", "DRP Entities Ausnahme")
	slib.setLang("gprotect", "de", "anticollide_DRPentitiesException_tooltip", "Welche Kollisionen sollen wir ignorieren? (0 = Keine, 1 = Unterschiedliche Besitzer, 2 = Kein Besitzer)")
	slib.setLang("gprotect", "de", "anticollide_protectSpawnedEntities", "Schütze gespawnte Entities")
	slib.setLang("gprotect", "de", "anticollide_protectSpawnedEntities_tooltip", "Sollen wir gespawnte Entities schützen? (0 = Deaktiviert, 1 = Ghost, 2 = Einfrieren, 3 = Entfernen")
	slib.setLang("gprotect", "de", "anticollide_entitiesThreshold", "Gespawnte Entities Schwelle")
	slib.setLang("gprotect", "de", "anticollide_entitiesThreshold_tooltip", "Wie viele Kollisionen kann ein Entity innerhalb einer Sekunde haben, bevor das System ausgelöst wird?")
	slib.setLang("gprotect", "de", "anticollide_entitiesException", "Gespawnte Entities Ausnahme")
	slib.setLang("gprotect", "de", "anticollide_entitiesException_tooltip", "Welche Kollisionen sollen wir ignorieren? (0 = Keine, 1 = Unterschiedliche Besitzer, 2 = Kein Besitzer)")
	slib.setLang("gprotect", "de", "anticollide_protectSpawnedProps", "Schütze gespawnte Props")
	slib.setLang("gprotect", "de", "anticollide_protectSpawnedProps_tooltip", "Sollen wir gespawnte Props schützen? (0 = Deaktiviert, 1 = Ghost, 2 = Einfrieren, 3 = Entfernen")
	slib.setLang("gprotect", "de", "anticollide_propsThreshold", "Gespawnte Props Schwelle")
	slib.setLang("gprotect", "de", "anticollide_propsThreshold_tooltip", "Wie viele Kollisionen kann ein Prop innerhalb einer Sekunde haben, bevor das System ausgelöst wird?")
	slib.setLang("gprotect", "de", "anticollide_propsException", "Gespawnte Props Ausnahme")
	slib.setLang("gprotect", "de", "anticollide_propsException_tooltip", "Welche Kollisionen sollen wir ignorieren? (0 = Keine, 1 = Unterschiedliche Besitzer, 2 = Kein Besitzer)")
	slib.setLang("gprotect", "de", "anticollide_useBlacklist", "Verwende Blacklist")
	slib.setLang("gprotect", "de", "anticollide_useBlacklist_tooltip", "Entities auf der Blacklist werden geghostet falls diese zu sehr kollidieren und dies aktiviert ist.")
	slib.setLang("gprotect", "de", "anticollide_ghostEntities", "Entities")
	slib.setLang("gprotect", "de", "anticollide_ghostEntities_tooltip", "Klassennamen in dieser Liste werden geghostet, falls diese zu sehr kollidieren.")

	slib.setLang("gprotect", "de", "spamprotection_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "spamprotection_enabled_tooltip", "Aktiviere das Spamschutz Modul?")
	slib.setLang("gprotect", "de", "spamprotection_threshold", "Schwelle")
	slib.setLang("gprotect", "de", "spamprotection_threshold_tooltip", "Wenn du so viele Props gleichzeitig spawnst, dann greift das System ein, es sei denn, die unten definierte Verzögerung ist abgelaufen.")
	slib.setLang("gprotect", "de", "spamprotection_delay", "Verzögerung")
	slib.setLang("gprotect", "de", "spamprotection_delay_tooltip", "Dieser Timer löscht die obere Schwelle.")
	slib.setLang("gprotect", "de", "spamprotection_action", "Bestrafung")
	slib.setLang("gprotect", "de", "spamprotection_action_tooltip", "Dies entscheidet, wie mit Spammern umgegangen werden soll! (1 = Verweigere Spawn, 2 = Entity/Prop ghosten)")
	slib.setLang("gprotect", "de", "spamprotection_notifyStaff", "Benachrichtige Teammitglieder")
	slib.setLang("gprotect", "de", "spamprotection_notifyStaff_tooltip", "Sollen Erkennungen Teammitglieder benachrichtigen? NB: Dies kann verwendet werden, um Teammitglieder zu nerven.")
	slib.setLang("gprotect", "de", "spamprotection_protectProps", "Schütze Props")
	slib.setLang("gprotect", "de", "spamprotection_protectProps_tooltip", "Dies schützt Props vor Spam.")
	slib.setLang("gprotect", "de", "spamprotection_protectEntities", "Schütze Entities")
	slib.setLang("gprotect", "de", "spamprotection_protectEntities_tooltip", "Dies schützt Entities vor Spam")

	slib.setLang("gprotect", "de", "spawnrestriction_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "spawnrestriction_enabled_tooltip", "Aktiviere das Spawn-EinschränkungsModul?")
	slib.setLang("gprotect", "de", "spawnrestriction_propSpawnPermission", "Prop Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_propSpawnPermission_tooltip", "Dies schränkt das Spawnen von Props vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_SENTSpawnPermission", "SENT Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_SENTSpawnPermission_tooltip", "Dies schränkt das Spawnen von SENTs vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_SWEPSpawnPermission", "SWEP Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_SWEPSpawnPermission_tooltip", "Dies schränkt das Spawnen von SWEPs vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_vehicleSpawnPermission", "Fahrzeug Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_vehicleSpawnPermission_tooltip", "Dies schränkt das Spawnen von Fahrzeugen vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_NPCSpawnPermission", "NPC Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_NPCSpawnPermission_tooltip", "Dies schränkt das Spawnen von NPCs vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_ragdollSpawnPermission", "Ragdoll Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_ragdollSpawnPermission_tooltip", "Dies schränkt das Spawnen von Ragdolls vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_effectSpawnPermission", "Effekte Spawnberechtigungen")
	slib.setLang("gprotect", "de", "spawnrestriction_effectSpawnPermission_tooltip", "Dies schränkt das Spawnen von Effekten vollständig ein! (Füge Nutzergruppen hier hinzu, um diese zu erlauben, * bedeutet alle!)")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedEntities", "Blockierte SENTs")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedEntities_tooltip", "Platziere hier Klassennamen von Entities, welche nie gespawnt werden sollen!")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedEntitiesIsBlacklist", "Blockierte Klassen sind Blacklist")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedEntitiesIsBlacklist_tooltip", "Falls aktiviert, dann werden Klassen in der Liste blockiert, ansonsten kannst du nur diese Klassen spawnen.")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedModels", "Blockierte Modelle")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedModels_tooltip", "Platziere Modellnamen, damit Props mit diesem Modellnamen nicht spawnen!")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedModelsisBlacklist", "Blockierte Modelle sind Blacklist")
	slib.setLang("gprotect", "de", "spawnrestriction_blockedModelsisBlacklist_tooltip", "Falls aktiviert, dann werden Modelle in dieser Liste blockiert, ansonsten kannst du nur diese Modelle spawnen.")
	slib.setLang("gprotect", "de", "spawnrestriction_bypassGroups", "Ausnahme Gruppen")
	slib.setLang("gprotect", "de", "spawnrestriction_bypassGroups_tooltip", "Diese Gruppen können blockierte SENTs und Modelle umgehen.")
	slib.setLang("gprotect", "de", "spawnrestriction_maxModelSize", "Maximale Modellgröße")
	slib.setLang("gprotect", "de", "spawnrestriction_maxModelSize_tooltip", "Falls dies größer 0 ist, entfernt es größere Props direkt nach dem Spawn.")

	slib.setLang("gprotect", "de", "toolgunsettings_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "toolgunsettings_enabled_tooltip", "Aktiviere das Werkzeug-Einstellungsmodul?")
	slib.setLang("gprotect", "de", "toolgunsettings_targetWorld", "Kann Weltentities anvisieren")
	slib.setLang("gprotect", "de", "toolgunsettings_targetWorld_tooltip", "Dies bedeutet, dass sie Weltentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "toolgunsettings_targetPlayerOwned", "Kann Spielerentities anvisieren")
	slib.setLang("gprotect", "de", "toolgunsettings_targetPlayerOwned_tooltip", "Dies bedeutet, dass sie Spielerentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "toolgunsettings_restrictTools", "Eingeschränkte Werkzeuge")
	slib.setLang("gprotect", "de", "toolgunsettings_restrictTools_tooltip", "Die Werkzeuge hier können von niemanden außer den Ausnahmegruppen benutzt werden.")
	slib.setLang("gprotect", "de", "toolgunsettings_groupToolRestrictions", "Gruppen Werkzeugeinschränkungen")
	slib.setLang("gprotect", "de", "toolgunsettings_groupToolRestrictions_tooltip", "Konfiguriere Werkzeugbeschränkungen nach Werkzeug")
	slib.setLang("gprotect", "de", "toolgunsettings_entityTargetability", "Entity Anvisierbarkeit")
	slib.setLang("gprotect", "de", "toolgunsettings_entityTargetability_tooltip", "Dies ist nützlich, wenn z.B Spieler die Toolgun nur auf ihre eigenen Props anwenden können!")
	slib.setLang("gprotect", "de", "toolgunsettings_bypassGroups", "Ausnahme Gruppen")
	slib.setLang("gprotect", "de", "toolgunsettings_bypassGroups_tooltip", "Gruppen in dieser Liste umgehen die Wekzeugbeschränkungsliste von oben!")

	slib.setLang("gprotect", "de", "physgunsettings_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "physgunsettings_enabled_tooltip", "Aktiviere das Physgun Einstellungsmodul?")
	slib.setLang("gprotect", "de", "physgunsettings_targetWorld", "Kann Welt-Entities anvisieren")
	slib.setLang("gprotect", "de", "physgunsettings_targetWorld_tooltip", "Dies bedeutet, dass sie Weltentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "physgunsettings_targetPlayerOwned", "Kann Spielerentities anvisieren")
	slib.setLang("gprotect", "de", "physgunsettings_targetPlayerOwned_tooltip", "Dies bedeutet, dass sie Spielerentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "physgunsettings_DisableReloadUnfreeze", "Deaktiviere Nachladen-Entfrieren")
	slib.setLang("gprotect", "de", "physgunsettings_DisableReloadUnfreeze_tooltip", "Dies verhindert, dass Personen Props mit Nachladen entfrieren.")
	slib.setLang("gprotect", "de", "physgunsettings_PickupVehiclePermission", "Fahrzeug aufheben Berechtigung")
	slib.setLang("gprotect", "de", "physgunsettings_PickupVehiclePermission_tooltip", "Personen in diesen Gruppen können Fahrzeuge aufheben!")
	slib.setLang("gprotect", "de", "physgunsettings_StopMotionOnDrop", "Stoppe Bewegung beim Fallenlassen")
	slib.setLang("gprotect", "de", "physgunsettings_StopMotionOnDrop_tooltip", "Dies verhindert Proppushing/Propkilling.")
	slib.setLang("gprotect", "de", "physgunsettings_blockMultiplePhysgunning", "Blockiere mehrfaches Physgunnen")
	slib.setLang("gprotect", "de", "physgunsettings_blockMultiplePhysgunning_tooltip", "Dies verhindert, dass jemand ein Entity physgunnt, welches bereits gephysgunnt wird!")
	slib.setLang("gprotect", "de", "physgunsettings_maxDropObstructs", "Maximale Blockierschwelle")
	slib.setLang("gprotect", "de", "physgunsettings_maxDropObstructs_tooltip", "Dies ist die Schwelle von wie vielen Blockierungen von Entities, welche auf der Blacklist stehen, bis das System ausgelöst wird!")
	slib.setLang("gprotect", "de", "physgunsettings_maxDropObstructsAction", "Maximale Blockierschwelle Auslösaktion")
	slib.setLang("gprotect", "de", "physgunsettings_maxDropObstructsAction_tooltip", "Dies ist wie wir mit Auslösungen umgehen (1 = Ghost, 2 = Einfrieren, 3 = Entfernen)")
	slib.setLang("gprotect", "de", "physgunsettings_blockedEntities", "Blockierte Entities")
	slib.setLang("gprotect", "de", "physgunsettings_blockedEntities_tooltip", "Füge hier Entities hinzu und sie werden von niemanden, der nicht in einer Ausnahmegruppe ist, gephysgunnt werden können.")
	slib.setLang("gprotect", "de", "physgunsettings_bypassGroups", "Ausnahme Gruppen")
	slib.setLang("gprotect", "de", "physgunsettings_bypassGroups_tooltip", "Füge Nutzergruppen in dieser Liste hinzu, damit diese die blockierten Entities umgehen, '*' bedeutet alle!")

	slib.setLang("gprotect", "de", "gravitygunsettings_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "gravitygunsettings_enabled_tooltip", "Aktiviere das Gravity Gun Einstellungsmodul?")
	slib.setLang("gprotect", "de", "gravitygunsettings_targetWorld", "Kann Welt-Entities anvisieren")
	slib.setLang("gprotect", "de", "gravitygunsettings_targetWorld_tooltip", "Dies bedeutet, dass sie Weltentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "gravitygunsettings_targetPlayerOwned", "Kann Spielerentities anvisieren")
	slib.setLang("gprotect", "de", "gravitygunsettings_targetPlayerOwned_tooltip", "Dies bedeutet, dass sie Spielerentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "gravitygunsettings_DisableGravityGunPunting", "Deaktiviere Gravity Gun Werfen")
	slib.setLang("gprotect", "de", "gravitygunsettings_DisableGravityGunPunting_tooltip", "Dies ist die Wurfattacke der Gravity Gun.")
	slib.setLang("gprotect", "de", "gravitygunsettings_blockedEntities", "Blockierte Entities")
	slib.setLang("gprotect", "de", "gravitygunsettings_blockedEntities_tooltip", "Füge hier Entities hinzu und sie werden von niemanden, der nicht in einer Ausnahmegruppe ist, gephysgunnt werden können.")
	slib.setLang("gprotect", "de", "gravitygunsettings_bypassGroups", "Ausnahme Gruppen")
	slib.setLang("gprotect", "de", "gravitygunsettings_bypassGroups_tooltip", "Füge Nutzergruppen in dieser Liste hinzu, damit diese die blockierten Entities umgehen, '*' bedeutet alle!")

	slib.setLang("gprotect", "de", "canpropertysettings_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "canpropertysettings_enabled_tooltip", "Aktiviere das Kann-Eigenschaft Einstellungsmodul?")
	slib.setLang("gprotect", "de", "canpropertysettings_targetWorld", "Kann Welt-Entities anvisieren")
	slib.setLang("gprotect", "de", "canpropertysettings_targetWorld_tooltip", "Dies bedeutet, dass sie Weltentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "canpropertysettings_targetPlayerOwned", "Kann Spielerentities anvisieren")
	slib.setLang("gprotect", "de", "canpropertysettings_targetPlayerOwned_tooltip", "Dies bedeutet, dass sie Spielerentities und -props anvisieren können! (Füge Nutzergruppen hier hinzu, um diese zu erlauben. * bedeutet alle!)")
	slib.setLang("gprotect", "de", "canpropertysettings_blockedProperties", "Blockierte Eigenschaften")
	slib.setLang("gprotect", "de", "canpropertysettings_blockedProperties_tooltip", "Füge Eigenschaften zu dieser Liste hinzu")
	slib.setLang("gprotect", "de", "canpropertysettings_blockedPropertiesisBlacklist", "Blockierte Eigenschaften sind Blacklist")
	slib.setLang("gprotect", "de", "canpropertysettings_blockedPropertiesisBlacklist_tooltip", "Falls aktiviert, dann werden Eigenschaften in der Liste blockiert, ansonsten kannst du nur diese Eigenschaften nutzen.")
	slib.setLang("gprotect", "de", "canpropertysettings_blockedEntities", "Blockierte Entities")
	slib.setLang("gprotect", "de", "canpropertysettings_blockedEntities_tooltip", "Füge hier Entities hinzu, damit sie von niemanden mehr anvisiert können, außer von den Leuten in der Ausnahme Gruppe!")
	slib.setLang("gprotect", "de", "canpropertysettings_bypassGroups", "Ausnahme Gruppen")
	slib.setLang("gprotect", "de", "canpropertysettings_bypassGroups_tooltip", "Gruppen in dieser Liste umgehen die Kann-Eigenschaft Beschränkungsliste von oben!")

	slib.setLang("gprotect", "de", "advdupe2_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "advdupe2_enabled_tooltip", "Sollen Erkennungen Teammitglieder benachrichtigen? NB: Dies kann verwendet werden, um Teammitglieder zu nerven.")
	slib.setLang("gprotect", "de", "advdupe2_notifyStaff", "Benachrichtige Teammitglieder")
	slib.setLang("gprotect", "de", "advdupe2_notifyStaff_tooltip", "Sollen Erkennungen Teammitglieder benachrichtigen? NB: Dies kann verwendet werden, um Teammitglieder zu nerven.")
	slib.setLang("gprotect", "de", "advdupe2_PreventRopes", "Verhindere Seil-Spawn")
	slib.setLang("gprotect", "de", "advdupe2_PreventRopes_tooltip", "Verhindere das Spawnen von Seilen! (1 = Verhindere Spawn, 2 = Spawn aber beheben)")
	slib.setLang("gprotect", "de", "advdupe2_PreventScaling", "Verhindere Skalierung")
	slib.setLang("gprotect", "de", "advdupe2_PreventScaling_tooltip", "Verhindere das Spawnen von hochskalierten Props. (1 = Verhindere Spawn, 2 = Spawn aber beheben)")
	slib.setLang("gprotect", "de", "advdupe2_PreventNoGravity", "Verhindere keine Schwerkraft")
	slib.setLang("gprotect", "de", "advdupe2_PreventNoGravity_tooltip", "Verhindere das Spawnen von Props ohne Schwerkraft. (1 = Verhindere Spawn, 2 = Spawn aber beheben)")
	slib.setLang("gprotect", "de", "advdupe2_PreventUnfreezeAll", "Verhindere Unfreeze All")
	slib.setLang("gprotect", "de", "advdupe2_PreventUnfreezeAll_tooltip", "Verhindere, dass Personen alle Props entfrieren. (1 = Verhindere Spawn, 2 = Spawn aber beheben)")
	slib.setLang("gprotect", "de", "advdupe2_BlacklistedCollisionGroups", "Kollisionsgruppe Blacklist")
	slib.setLang("gprotect", "de", "advdupe2_BlacklistedCollisionGroups_tooltip", "Dies schützt vor Props die du nicht anvisieren kannst. NB: Werte müssen Kollisions-ENUMs sein")
	slib.setLang("gprotect", "de", "advdupe2_WhitelistedConstraints", "Verbindungs Whitelist")
	slib.setLang("gprotect", "de", "advdupe2_WhitelistedConstraints_tooltip", "Dies dient um ungewollte Verbindungen zu verhindern.")

	slib.setLang("gprotect", "de", "miscs_enabled", "Aktiviert")
	slib.setLang("gprotect", "de", "miscs_enabled_tooltip", "Aktiviere das Sonstiges Modul?")
	slib.setLang("gprotect", "de", "miscs_ClearDecals", "Clear decals Timer")
	slib.setLang("gprotect", "de", "miscs_ClearDecals_tooltip", "Timer in Sekunden. Dies löscht die Decals für alle Spieler nach dem Timer :)")
	slib.setLang("gprotect", "de", "miscs_NoBlackoutGlitch", "Verhindere Blackout-Exploit")
	slib.setLang("gprotect", "de", "miscs_NoBlackoutGlitch_tooltip", "Zahl Dies verhindert den 'pp/copy'  (1 = Benachrichtigung, 2 = Kick, 3 = Ban).")
	slib.setLang("gprotect", "de", "miscs_FadingDoorLag", "Verhindere Fading Door Lag")
	slib.setLang("gprotect", "de", "miscs_FadingDoorLag_tooltip", "Dies verhindert, dass Personen den Server mit dem Fading Door Werkzeug zum Absturz bringen.")
	slib.setLang("gprotect", "de", "miscs_DisableMotion", "Deaktiviere Bewegung")
	slib.setLang("gprotect", "de", "miscs_DisableMotion_tooltip", "Dies deaktiviert die Bewegung für alle Entities auf der Blacklist.")
	slib.setLang("gprotect", "de", "miscs_freezeOnSpawn", "Friere beim Spawn ein")
	slib.setLang("gprotect", "de", "miscs_freezeOnSpawn_tooltip", "Dies friert Props ein, sobald diese gespawnt werden")
	slib.setLang("gprotect", "de", "miscs_preventFadingDoorAbuse", "Verhindere Fading Door Missbrauch")
	slib.setLang("gprotect", "de", "miscs_preventFadingDoorAbuse_tooltip", "Dies verhindert, dass Personen in Fading Doors festgesetzt werden.")
	slib.setLang("gprotect", "de", "miscs_preventSpawnNearbyPlayer", "Verhindere Spawn in der Nähe")
	slib.setLang("gprotect", "de", "miscs_preventSpawnNearbyPlayer_tooltip", "Falls jemand näher als dieser Wert zur Spawnposition befindet, wird das Prop nicht gespawnt (0 bedeutet deaktiviert)")
	slib.setLang("gprotect", "de", "miscs_DRPEntForceOwnership", "Erzwinge Besitz auf DarkRP Entities")
	slib.setLang("gprotect", "de", "miscs_DRPEntForceOwnership_tooltip", "Dies erzwingt den Besitz von Entities, welche im F4 Menü gekauft wurden")
end
--PATH addons/gprotect_1.15.101/lua/g_protect/languages/sh_polish.lua:
if SERVER then
	slib.setLang("gprotect", "pl", "colliding-too-much", "%s's entities za bardzo się zderzają!	")
	slib.setLang("gprotect", "pl", "too-many-obstructs", "%s's entity blokuje zbyt wiele złych istot!")
	slib.setLang("gprotect", "pl", "blacklisted-multiple", "Pomyślnie dodałeś modele %s do zablokowanych modeli!")
	slib.setLang("gprotect", "pl", "unblacklisted-multiple", "Usunąłeś pomyślnie %s modele z zablokowanych modeli!")
	slib.setLang("gprotect", "pl", "blacklisted-multiple-ent", "Dodałeś pomyślnie %s ents do podmiotów z czarnej listy!")
	slib.setLang("gprotect", "pl", "unblacklisted-multiple-ent", "Pomyślnie usunąłeś %s ents z czarnej listy!")
	slib.setLang("gprotect", "pl", "added-blacklist", "Pomyślnie dodałeś %s do zablokowanych modeli!")
	slib.setLang("gprotect", "pl", "removed-blacklist", "Usunąłeś pomyślnie %s z zablokowanych modeli!")
	slib.setLang("gprotect", "pl", "added-blacklist-ent", "Pomyślnie dodałeś %s do czarnej listy jednostek!")
	slib.setLang("gprotect", "pl", "removed-blacklist-ent", "Usunąłeś pomyślnie	%s z czarnej listy podmiotów!")
	slib.setLang("gprotect", "pl", "attempted-unfreeze-all", "%s próbował odblokować wszystko po spawnowaniu dupe!")
	slib.setLang("gprotect", "pl", "attempted-upscaled-ent", "%s próbował odrodzić skalowany byt za pomocą adv dupe 2!")
	slib.setLang("gprotect", "pl", "attempted-rope-spawning", "%s próbował spawnować liny używając adv dupe 2!")
	slib.setLang("gprotect", "pl", "attempted-no-gravity", "%s próbował stworzyć rekwizyty bez grawitacji, używając Adv Dupe 2!")

	slib.setLang("gprotect", "pl", "model-restricted", "Ten model został objęty ograniczeniami!")
	slib.setLang("gprotect", "pl", "classname-restricted", "Ta klasa encji została ograniczona!")
	slib.setLang("gprotect", "pl", "attempted-blackout", "%s próbował wykorzystać exploit blackout!")
	slib.setLang("gprotect", "pl", "spam-spawning", "%s próbuje spamować spawnowaniem bytów / rekwizytów.")

	slib.setLang("gprotect", "pl", "too-complex-model", "Ten model został ograniczony, jest zbyt skomplikowany!")
	slib.setLang("gprotect", "pl", "too-big-prop", "Twój rekwizyt jest za duży, więc go usunęliśmy!")
	slib.setLang("gprotect", "pl", "successfull-fpp-blockedmodels", "Udało Ci się przenieść zablokowane modele z FPP do gProtect!")
	slib.setLang("gprotect", "pl", "successfull-fpp-grouptools", "Pomyślnie przeniosłeś grouptools z FPP do gProtect!")
	slib.setLang("gprotect", "pl", "unsuccessfull-transfer", "Wydaje się, że wystąpił problem podczas przesyłania danych! (MySQL nie jest obsługiwany)")

	slib.setLang("gprotect", "pl", "you-ghosted-props", "Masz upiorne %s's rekwizyty!")
	slib.setLang("gprotect", "pl", "you-frozen-props", "Zamarzłeś %s's rekwizyty!")
	slib.setLang("gprotect", "pl", "you-removed-props", "Usunąłeś %s's rekwizyty!")

	slib.setLang("gprotect", "pl", "props-ghosted", "Twoje rekwizyty zostały zniszczone!")
	slib.setLang("gprotect", "pl", "props-frozen", "Twoje rekwizyty zostały zamrożone!")
	slib.setLang("gprotect", "pl", "props-removed", "Twoje rekwizyty zostały usunięte!")

	slib.setLang("gprotect", "pl", "everyones-props-ghosted", "Someone has ghosted everyones props!")
	slib.setLang("gprotect", "pl", "everyones-props-frozen", "Ktoś zamroził wszystkie rekwizyty!")
	slib.setLang("gprotect", "pl", "disconnected-ents-removed", "Usunąłeś wszystkie odłączone podmioty graczy!")

	slib.setLang("gprotect", "pl", "insufficient-permission", "Nie masz takiego przywileju!")
	slib.setLang("gprotect", "pl", "spawn-to-close", "Twój rekwizyt nie może zostać odrodzony w kimś!")
	slib.setLang("gprotect", "pl", "entity-ghosted", "Twoja istota została zniszczona!")
elseif CLIENT then
	slib.setLang("gprotect", "pl", "title", "gProtect - Ustawienia")
	slib.setLang("gprotect", "pl", "buddies-title", "gProtect - Kumple")

	slib.setLang("gprotect", "pl", "world", "Świat")
	slib.setLang("gprotect", "pl", "disconnected", "Bezładny")
	slib.setLang("gprotect", "pl", "toolgun-name", "Rekwizyty czarnej listy")
	slib.setLang("gprotect", "pl", "toolgun-desc", "Zarządzaj zablokowanymi modelami")
	slib.setLang("gprotect", "pl", "toolgun-leftclick", "Dodaj do modeli na czarnej liście")
	slib.setLang("gprotect", "pl", "toolgun-rightclick", "Usuń z modeli na czarnej liście")
	slib.setLang("gprotect", "pl", "toolgun-help", "Strzelaj do rekwizytu za pomocą narzędzia")
	slib.setLang("gprotect", "pl", "remove-on-blacklist", "Usuń prop z czarnej listy")
	slib.setLang("gprotect", "pl", "player-list", "Lista graczy")

	slib.setLang("gprotect", "pl", "toolgun", "Toolgun")
	slib.setLang("gprotect", "pl", "physgun", "Physgun")
	slib.setLang("gprotect", "pl", "gravity-gun", "Gravity Gun")
	slib.setLang("gprotect", "pl", "canproperty", "Moga własność")

	slib.setLang("gprotect", "pl", "add-blocked-models", "Dodaj do zablokowanych modeli")
	slib.setLang("gprotect", "pl", "remove-blocked-models", "Usuń z zablokowanych modeli")

	slib.setLang("gprotect", "pl", "add-blacklisted-ents", "Dodaj do obiektów na czarnej liścies")
	slib.setLang("gprotect", "pl", "remove-blacklisted-ents", "Usuń z czarnej listy")
	slib.setLang("gprotect", "pl", "copy-clipboard", "Skopiuj do schowka")

	slib.setLang("gprotect", "pl", "general", "Generał")
	slib.setLang("gprotect", "pl", "ghosting", "Ghosting")
	slib.setLang("gprotect", "pl", "damage", "Uszkodzić")
	slib.setLang("gprotect", "pl", "anticollide", "Anti Collide")
	slib.setLang("gprotect", "pl", "spamprotection", "Ochrona przed spamem")
	slib.setLang("gprotect", "pl", "spawnrestriction", "Ograniczenie odradzania")
	slib.setLang("gprotect", "pl", "toolgunsettings", "Toolgun Ustawienia")
	slib.setLang("gprotect", "pl", "physgunsettings", "Physgun Ustawienia")
	slib.setLang("gprotect", "pl", "gravitygunsettings", "Gravgun Ustawienia")
	slib.setLang("gprotect", "pl", "canpropertysettings", "Can Property Ustawienia")
	slib.setLang("gprotect", "pl", "advdupe2", "Adv Dupe 2")
	slib.setLang("gprotect", "pl", "miscs", "Miscs")

	slib.setLang("gprotect", "pl", "ghost-props", "Duchowe rekwizyty")
	slib.setLang("gprotect", "pl", "remove-props", "Usun rekwizyty")
	slib.setLang("gprotect", "pl", "freeze-props", "Zatrzymaj rekwizyty")
	slib.setLang("gprotect", "pl", "highlight-ents", "Podświetl elementy")
	slib.setLang("gprotect", "pl", "unhighlight-ents", "Odznacz jednostki")

	slib.setLang("gprotect", "pl", "ghost-everyones-props", "Duchy wszystkich rekwizytów")
	slib.setLang("gprotect", "pl", "freeze-everyones-props", "Zamrozić wszystkie rekwizyty")
	slib.setLang("gprotect", "pl", "remove-disconnected-props", "Usuń rekwizyty odłączonych graczy")

	slib.setLang("gprotect", "pl", "general_remDiscPlyEnt", "Usuń odłączone jednostki graczy")
	slib.setLang("gprotect", "pl", "general_remDiscPlyEnt_tooltip", "Spowoduje to usunięcie odłączonych graczy na liczniku (jeśli -1 zostanie wyłączone).")
	slib.setLang("gprotect", "pl", "general_blacklist", "Czarna lista")
	slib.setLang("gprotect", "pl", "general_blacklist_tooltip", "W tym miejscu dodaje się nazwy klas, które powinny być chronione przez wszystkie moduły.")
	slib.setLang("gprotect", "pl", "general_protectedFrozenEnts", "Chronione zamrożone jednostki")
	slib.setLang("gprotect", "pl", "general_protectedFrozenEnts_tooltip", "To jest lista podmiotów, które należy chronić po zamrożeniu")
	slib.setLang("gprotect", "pl", "general_protectedFrozenGroup", "Grupa chroniona zamrożona")
	slib.setLang("gprotect", "pl", "general_protectedFrozenGroup_tooltip", "To jest grupa kolizji, w której umieszczane są zamrożone obiekty!")

	slib.setLang("gprotect", "pl", "ghosting_enabled", "Włączone")
	slib.setLang("gprotect", "pl", "ghosting_enabled_tooltip", "Włączyć moduł ghosting?")
	slib.setLang("gprotect", "pl", "ghosting_ghostColor", "Kolor zjawy")
	slib.setLang("gprotect", "pl", "ghosting_ghostColor_tooltip", "Wybierz kolor dla obiektów widmowych")
	slib.setLang("gprotect", "pl", "ghosting_antiObscuring", "Anti-obscuring")
	slib.setLang("gprotect", "pl", "ghosting_antiObscuring_tooltip", "Zapobiegnie to unghosted rekwizytów podczas zasłaniania obiektu. Po prostu dodaj elementy, które nie powinny być zasłaniane!")
	slib.setLang("gprotect", "pl", "ghosting_onPhysgun", "Ghost on physgun?")
	slib.setLang("gprotect", "pl", "ghosting_onPhysgun_tooltip", "Spowoduje to pojawienie się bytów duchów podczas strzelania fizycznego.")
	slib.setLang("gprotect", "pl", "ghosting_useBlacklist", "Użyj czarnej listy")
	slib.setLang("gprotect", "pl", "ghosting_useBlacklist_tooltip", "Ta opcja spowoduje usunięcie elementów z czarnej listy z czarnej listy, jeśli moduł jest włączony.")
	slib.setLang("gprotect", "pl", "ghosting_entities", "Entities")
	slib.setLang("gprotect", "pl", "ghosting_entities_tooltip", "Nazwy klas na tej liście będą widmowe, nie zmieni to czarnej listy używanej przez inne moduły.")

	slib.setLang("gprotect", "pl", "damage_enabled", "Włączone")
	slib.setLang("gprotect", "pl", "damage_enabled_tooltip", "Włączyć moduł uszkodzeń?")
	slib.setLang("gprotect", "pl", "damage_useBlacklist", "Użyj czarnej listy")
	slib.setLang("gprotect", "pl", "damage_useBlacklist_tooltip", "Ta opcja potraktuje ogólną czarną listę jako wpis na czarnej liście w tym module!")
	slib.setLang("gprotect", "pl", "damage_entities", "Elementy na czarnej liście")
	slib.setLang("gprotect", "pl", "damage_entities_tooltip", "Nazwy klas na tej liście nie będą zadawać obrażeń, jeśli zaznaczono opcję wyłączenia obrażeń, nie zmieni to czarnej listy używanej przez inne moduły.")
	slib.setLang("gprotect", "pl", "damage_blacklistedEntPlayerDamage", "Wyłącz uszkodzenia ents na czarnej liście")
	slib.setLang("gprotect", "pl", "damage_blacklistedEntPlayerDamage_tooltip", "Jeśli ta opcja jest zaznaczona, gracze nie będą otrzymywać obrażeń od podmiotów z czarnej listy.")
	slib.setLang("gprotect", "pl", "damage_vehiclePlayerDamage", "Wyłącz uszkodzenia pojazdów")
	slib.setLang("gprotect", "pl", "damage_vehiclePlayerDamage_tooltip", "Jeśli ta opcja jest zaznaczona, gracze nie otrzymają obrażeń od pojazdów.")
	slib.setLang("gprotect", "pl", "damage_worldPlayerDamage", "Wyłącz obrażenia świata")
	slib.setLang("gprotect", "pl", "damage_worldPlayerDamage_tooltip", "Jeśli ta opcja jest zaznaczona, gracze mogą otrzymywać obrażenia od podmiotów z czarnej listy.")
	slib.setLang("gprotect", "pl", "damage_immortalEntities", "Immortal Entities")
	slib.setLang("gprotect", "pl", "damage_immortalEntities_tooltip", "Nazwy klas na tej liście nie odnoszą obrażeń, chyba że gracz znajduje się w grupie obejścia!")
	slib.setLang("gprotect", "pl", "damage_bypassGroups", "Pomijaj grupy")
	slib.setLang("gprotect", "pl", "damage_bypassGroups_tooltip", "Dodaj grupy użytkowników do tej listy, aby ominąć ograniczenia szkód, '*' oznacza wszystkich!")
	slib.setLang("gprotect", "pl", "damage_canDamageWorldEntities", "Może uszkadzać byty świata")
	slib.setLang("gprotect", "pl", "damage_canDamageWorldEntities_tooltip", "Grupy znajdujące się na tej liście mogą uszkadzać byty świata, '*' oznacza każdego!")

	slib.setLang("gprotect", "pl", "anticollide_enabled", "Włączono")
	slib.setLang("gprotect", "pl", "anticollide_enabled_tooltip", "Włączyć moduł antykolizyjny?")
	slib.setLang("gprotect", "pl", "anticollide_notifyStaff", "Powiadom personel")
	slib.setLang("gprotect", "pl", "anticollide_notifyStaff_tooltip", "Czy wykrycie powinno powiadomić personel? Uwaga: można to wykorzystać do sikania personelu.")
	slib.setLang("gprotect", "pl", "anticollide_protectDarkRPEntities", "Chroń podmioty DarkRP")
	slib.setLang("gprotect", "pl", "anticollide_protectDarkRPEntities_tooltip", "Czy powinniśmy chronić podmioty DarkRP? (0 = wyłączone, 1 = duch, 2 = zablokuj, 3 = usuń, 4 = usuń i zwrot)")
	slib.setLang("gprotect", "pl", "anticollide_DRPentitiesThreshold", "Próg jednostek DRP")
	slib.setLang("gprotect", "pl", "anticollide_DRPentitiesThreshold_tooltip", "Ile kolizji może mieć rekwizyt, zanim zostanie wywołany w ciągu 1 sekundy?")
	slib.setLang("gprotect", "pl", "anticollide_DRPentitiesException", "Wyjątek jednostek DRP")
	slib.setLang("gprotect", "pl", "anticollide_DRPentitiesException_tooltip", "Jakie kolizje ignorujemy? (0 = brak, 1 = inny właściciel, 2 = brak właściciela)")
	slib.setLang("gprotect", "pl", "anticollide_protectSpawnedEntities", "Chroń spawnowane byty")
	slib.setLang("gprotect", "pl", "anticollide_protectSpawnedEntities_tooltip", "Czy powinniśmy chronić spawnowane byty? (0 = wyłączone, 1 = duch, 2 = zatrzymaj, 3 = usuń")
	slib.setLang("gprotect", "pl", "anticollide_entitiesThreshold", "Próg odrodzonych bytów")
	slib.setLang("gprotect", "pl", "anticollide_entitiesThreshold_tooltip", "Ile kolizji może mieć rekwizyt, zanim zostanie wywołany w ciągu 1 sekundy?")
	slib.setLang("gprotect", "pl", "anticollide_entitiesException", "Wyjątek od wygenerowanych bytów")
	slib.setLang("gprotect", "pl", "anticollide_entitiesException_tooltip", "Jakie kolizje ignorujemy? (0 = brak, 1 = inny właściciel, 2 = brak właściciela)")
	slib.setLang("gprotect", "pl", "anticollide_protectSpawnedProps", "Chroń rozmnożone rekwizyty")
	slib.setLang("gprotect", "pl", "anticollide_protectSpawnedProps_tooltip", "Czy powinniśmy chronić rozmnożone rekwizyty? (0 = wyłączone, 1 = duch, 2 = zatrzymaj, 3 = usuń")
	slib.setLang("gprotect", "pl", "anticollide_propsThreshold", "Próg odrodzonych rekwizytów")
	slib.setLang("gprotect", "pl", "anticollide_propsThreshold_tooltip", "Ile kolizji może mieć rekwizyt, zanim zostanie wywołany w ciągu 1 sekundy?")
	slib.setLang("gprotect", "pl", "anticollide_propsException", "Wyjątek od wygenerowanych rekwizytów")
	slib.setLang("gprotect", "pl", "anticollide_propsException_tooltip", "Jakie kolizje ignorujemy? (0 = brak, 1 = inny właściciel, 2 = brak właściciela)")
	slib.setLang("gprotect", "pl", "anticollide_useBlacklist", "Użyj czarnej listy")
	slib.setLang("gprotect", "pl", "anticollide_useBlacklist_tooltip", "Elementy na czarnej liście będą widmowe, jeśli kolidują za dużo, jeśli ta opcja jest włączona")
	slib.setLang("gprotect", "pl", "anticollide_ghostEntities", "Podmioty")
	slib.setLang("gprotect", "pl", "anticollide_ghostEntities_tooltip", "Nazwy klas na tej liście będą widmowe, jeśli będą się zbytnio zderzać.")

	slib.setLang("gprotect", "pl", "spamprotection_enabled", "Enabled")
	slib.setLang("gprotect", "pl", "spamprotection_enabled_tooltip", "Włączyć moduł ochrony przed spamem?")
	slib.setLang("gprotect", "pl", "spamprotection_threshold", "Próg")
	slib.setLang("gprotect", "pl", "spamprotection_threshold_tooltip", "Jeśli stworzysz te wiele rekwizytów naraz, włączy się, chyba że zdefiniowane poniżej opóźnienie zniknie.")
	slib.setLang("gprotect", "pl", "spamprotection_delay", "Delay")
	slib.setLang("gprotect", "pl", "spamprotection_delay_tooltip", "Ten licznik czasu wyczyści powyższy próg.")
	slib.setLang("gprotect", "pl", "spamprotection_action", "Punishment")
	slib.setLang("gprotect", "pl", "spamprotection_action_tooltip", "To zadecyduje, jak postępować ze spamerami! (1 = nie zezwalaj na tworzenie się, 2 = obiekt widmo / atrybut)")
	slib.setLang("gprotect", "pl", "spamprotection_notifyStaff", "Powiadom personel")
	slib.setLang("gprotect", "pl", "spamprotection_notifyStaff_tooltip", "Czy wykrycie powiadamia personel? Uwaga: można to wykorzystać do wkurzenia pracowników.")
	slib.setLang("gprotect", "pl", "spamprotection_protectProps", "Chroń rekwizyty")
	slib.setLang("gprotect", "pl", "spamprotection_protectProps_tooltip", "Dzięki temu rekwizyty będą chronione przed spamowaniem.")
	slib.setLang("gprotect", "pl", "spamprotection_protectEntities", "Chroń jednostki")
	slib.setLang("gprotect", "pl", "spamprotection_protectEntities_tooltip", "To ochroni jednostki przed pojawieniem się spamu.")
	
	slib.setLang("gprotect", "pl", "spawnrestriction_enabled", "Enabled")
	slib.setLang("gprotect", "pl", "spawnrestriction_enabled_tooltip", "Włączyć moduł spawnrestriction?")
	slib.setLang("gprotect", "pl", "spawnrestriction_propSpawnPermission", "Uprawnienia spawn Prop")
	slib.setLang("gprotect", "pl", "spawnrestriction_propSpawnPermission_tooltip", "Spowoduje to całkowite ograniczenie tworzenia się rekwizytów! (Dodaj tutaj grupy użytkowników, aby na nie zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_SENTSpawnPermission", "SENT spawn permissions")
	slib.setLang("gprotect", "pl", "spawnrestriction_SENTSpawnPermission_tooltip", "Spowoduje to całkowite ograniczenie spawnowania SENTS! (Dodaj tutaj grupy użytkowników, aby na nie zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_SWEPSpawnPermission", "Uprawnienia do spawnowania SWEP")
	slib.setLang("gprotect", "pl", "spawnrestriction_SWEPSpawnPermission_tooltip", "Spowoduje to całkowite ograniczenie tworzenia SWEP! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_vehicleSpawnPermission", "Uprawnienia do odradzania pojazdów")
	slib.setLang("gprotect", "pl", "spawnrestriction_vehicleSpawnPermission_tooltip", "Spowoduje to całkowite ograniczenie pojawiających się pojazdów! (Dodaj tutaj grupy użytkowników, aby na nie zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_NPCSpawnPermission", "Uprawnienia do odradzania NPC")
	slib.setLang("gprotect", "pl", "spawnrestriction_NPCSpawnPermission_tooltip", "To całkowicie ograniczy pojawiające się NPC! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_ragdollSpawnPermission", "Uprawnienia do spawn Ragdoll")
	slib.setLang("gprotect", "pl", "spawnrestriction_ragdollSpawnPermission_tooltip", "Spowoduje to całkowite ograniczenie tworzenia ragdoll! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_effectSpawnPermission", "Uprawnienia do odradzania efektów")
	slib.setLang("gprotect", "pl", "spawnrestriction_effectSpawnPermission_tooltip", "Spowoduje to całkowite ograniczenie efektów odradzania! (Dodaj tutaj grupy użytkowników, aby na nie zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedEntities", "Blocked SENTs")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedEntities_tooltip", "Umieść tutaj nazwy klas bytów, które nigdy nie powinny się pojawiać!")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedEntitiesIsBlacklist", "Zablokowane klasy to czarna lista")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedEntitiesIsBlacklist_tooltip", "Zaznaczenie tej opcji spowoduje, że klasy z listy będą blokowane przed tworzeniem, w przeciwnym razie możesz tworzyć tylko te klasy.")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedModels", "Zablokowane modele")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedModels_tooltip", "Umieść nazwy modeli, aby rekwizyty z nazwą modelu nie pojawiały się!")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedModelsisBlacklist", "Zablokowane modele to czarna lista")
	slib.setLang("gprotect", "pl", "spawnrestriction_blockedModelsisBlacklist_tooltip", "Zaznaczenie tej opcji spowoduje, że modele z listy zostaną zablokowane przed tworzeniem, w przeciwnym razie możesz tworzyć tylko te modele.")
	slib.setLang("gprotect", "pl", "spawnrestriction_bypassGroups", "Pomijaj grupy")
	slib.setLang("gprotect", "pl", "spawnrestriction_bypassGroups_tooltip", "Te grupy będą mogły pomijać zablokowane wysyłanie i modele.")
	slib.setLang("gprotect", "pl", "spawnrestriction_maxModelSize", "Maksymalny rozmiar modelu")
	slib.setLang("gprotect", "pl", "spawnrestriction_maxModelSize_tooltip", "Jeśli jest powyżej 0, spowoduje to usunięcie większych rekwizytów zaraz po ich pojawieniu się.")

	slib.setLang("gprotect", "pl", "toolgunsettings_enabled", "Włączone")
	slib.setLang("gprotect", "pl", "toolgunsettings_enabled_tooltip", "Włączyć moduł toolgunsettings?")
	slib.setLang("gprotect", "pl", "toolgunsettings_targetWorld", "Może kierować reklamy na obiekty świata")
	slib.setLang("gprotect", "pl", "toolgunsettings_targetWorld_tooltip", "Oznacza to, że mogą kierować reklamy na obiekty świata i rekwizyty! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "toolgunsettings_targetPlayerOwned", "Może kierować reklamy na podmioty należące do gracza")
	slib.setLang("gprotect", "pl", "toolgunsettings_targetPlayerOwned_tooltip", "Oznacza to, że mogą kierować reklamy na elementy i rekwizyty graczy! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "toolgunsettings_restrictTools", "Narzędzia z ograniczeniami")
	slib.setLang("gprotect", "pl", "toolgunsettings_restrictTools_tooltip", "Te narzędzia nie będą dostępne dla nikogo oprócz tych, które są w opcji bypassGroups poniżej.")
	slib.setLang("gprotect", "pl", "toolgunsettings_groupToolRestrictions", "Ograniczenia dotyczące narzędzi grupowych")
	slib.setLang("gprotect", "pl", "toolgunsettings_groupToolRestrictions_tooltip", "Konfiguruj ograniczenia narzędzi według narzędzia.")
	slib.setLang("gprotect", "pl", "toolgunsettings_entityTargetability", "Element docelowy")
	slib.setLang("gprotect", "pl", "toolgunsettings_entityTargetability_tooltip", "To jest fajne, aby ludzie mogli używać pistoletu narzędziowego tylko na przykład na swoich rekwizytach!")
	slib.setLang("gprotect", "pl", "toolgunsettings_bypassGroups", "Pomijaj grupy")
	slib.setLang("gprotect", "pl", "toolgunsettings_bypassGroups_tooltip", "Grupy tutaj będą omijać listę ograniczeń narzędzi z góry!")
	
	slib.setLang("gprotect", "pl", "physgunsettings_enabled", "Enabled")
	slib.setLang("gprotect", "pl", "physgunsettings_enabled_tooltip", "Włączyć moduł ustawień physgun?")
	slib.setLang("gprotect", "pl", "physgunsettings_targetWorld", "Może kierować na obiekty świata")
	slib.setLang("gprotect", "pl", "physgunsettings_targetWorld_tooltip", "Oznacza to, że mogą kierować reklamy na obiekty świata i rekwizyty! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "physgunsettings_targetPlayerOwned", "Może kierować reklamy na podmioty należące do gracza")
	slib.setLang("gprotect", "pl", "physgunsettings_targetPlayerOwned_tooltip", "Oznacza to, że mogą kierować reklamy na elementy i rekwizyty graczy! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "physgunsettings_DisableReloadUnfreeze", "Wyłącz ponowne ładowanie unreeze")
	slib.setLang("gprotect", "pl", "physgunsettings_DisableReloadUnfreeze_tooltip", "Zapobiegnie to odblokowywaniu rekwizytów przez przeładowanie.")
	slib.setLang("gprotect", "pl", "physgunsettings_PickupVehiclePermission", "Uprawnienie do odbioru pojazdu")
	slib.setLang("gprotect", "pl", "physgunsettings_PickupVehiclePermission_tooltip", "Jeśli ludzie znajdują się w grupach użytkowników na tej liście, mogą odbierać pojazdy!")
	slib.setLang("gprotect", "pl", "physgunsettings_StopMotionOnDrop", "Zatrzymaj ruch przy upuszczaniu")
	slib.setLang("gprotect", "pl", "physgunsettings_StopMotionOnDrop_tooltip", "Zapobiegnie to podsadzaniu / podsadzaniu.")
	slib.setLang("gprotect", "pl", "physgunsettings_maxDropObstructs", "Maksymalny próg obstrukcji")
	slib.setLang("gprotect", "pl", "physgunsettings_maxDropObstructs_tooltip", "To jest próg liczby obsctructów z czarnej listy do momentu wyzwolenia!")
	slib.setLang("gprotect", "pl", "physgunsettings_maxDropObstructsAction", "Maksymalne działanie wyzwalacza obstrukcji")
	slib.setLang("gprotect", "pl", "physgunsettings_maxDropObstructsAction_tooltip", "To jest sposób na zagrożenie wyzwalaczami (1 = Ghost, 2 = Freeze, 3 = Remove)")
	slib.setLang("gprotect", "pl", "physgunsettings_blockedEntities", "Zablokowane elementy")
	slib.setLang("gprotect", "pl", "physgunsettings_blockedEntities_tooltip", "Dodaj do tego elementy, a nikt, kto nie należy do grupy obejściowej, nie będzie mógł tego fizycznie przechwycić.")
	slib.setLang("gprotect", "pl", "physgunsettings_bypassGroups", "Pomijaj grupy")
	slib.setLang("gprotect", "pl", "physgunsettings_bypassGroups_tooltip", "Dodaj grupy użytkowników do tej listy, aby ominąć zablokowane elementy, * oznacza wszystkich!")

	slib.setLang("gprotect", "pl", "gravitygunsettings_enabled", "Enabled")
	slib.setLang("gprotect", "pl", "gravitygunsettings_enabled_tooltip", "Włączyć moduł ustawień pistoletu grawitacyjnego?")
	slib.setLang("gprotect", "pl", "gravitygunsettings_targetWorld", "Może kierować na obiekty świata")
	slib.setLang("gprotect", "pl", "gravitygunsettings_targetWorld_tooltip", "Oznacza to, że mogą kierować reklamy na obiekty świata i rekwizyty! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "gravitygunsettings_targetPlayerOwned", "Może kierować reklamy na podmioty należące do gracza")
	slib.setLang("gprotect", "pl", "gravitygunsettings_targetPlayerOwned_tooltip", "Oznacza to, że mogą kierować reklamy na podmioty i rekwizyty graczy! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "gravitygunsettings_DisableGravityGunPunting", "Wyłącz dziurkowanie działem grawitacyjnym")
	slib.setLang("gprotect", "pl", "gravitygunsettings_DisableGravityGunPunting_tooltip", "To jest rzucany atak pistoletu grawitacyjnego.")
	slib.setLang("gprotect", "pl", "gravitygunsettings_blockedEntities", "Zablokowane elementy")
	slib.setLang("gprotect", "pl", "gravitygunsettings_blockedEntities_tooltip", "Dodaj elementy do tego, a nikt, kto nie należy do grupy obejściowej, nie będzie mógł tego fizycznie przechwycić.")
	slib.setLang("gprotect", "pl", "gravitygunsettings_bypassGroups", "Pomijaj grupy")
	slib.setLang("gprotect", "pl", "gravitygunsettings_bypassGroups_tooltip", "Dodaj grupy użytkowników do tej listy, aby ominąć zablokowane elementy,„ * oznacza wszystkich!")
		
	slib.setLang("gprotect", "pl", "canpropertysettings_enabled", "Enabled")
	slib.setLang("gprotect", "pl", "canpropertysettings_enabled_tooltip", "Włączyć moduł ustawień właściwości can?")
	slib.setLang("gprotect", "pl", "canpropertysettings_targetWorld", "Może kierować na obiekty świata")
	slib.setLang("gprotect", "pl", "canpropertysettings_targetWorld_tooltip", "Oznacza to, że mogą kierować reklamy na obiekty świata i rekwizyty! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "canpropertysettings_targetPlayerOwned", "Może kierować reklamy na podmioty należące do gracza")
	slib.setLang("gprotect", "pl", "canpropertysettings_targetPlayerOwned_tooltip", "Oznacza to, że mogą kierować reklamy na elementy i rekwizyty graczy! (Dodaj tutaj grupy użytkowników, aby im zezwolić, * oznacza wszystkich!)")
	slib.setLang("gprotect", "pl", "canpropertysettings_blockedProperties", "Zablokowane właściwości")
	slib.setLang("gprotect", "pl", "canpropertysettings_blockedProperties_tooltip", "Dodaj właściwości do tej listy")
	slib.setLang("gprotect", "pl", "canpropertysettings_blockedPropertiesisBlacklist", "Zablokowane właściwości to czarna lista")
	slib.setLang("gprotect", "pl", "canpropertysettings_blockedPropertiesisBlacklist_tooltip", "Zaznaczenie tej opcji spowoduje, że właściwości z listy nie będą mogły być używane, w przeciwnym razie możesz używać tylko tych właściwości.")
	slib.setLang("gprotect", "pl", "canpropertysettings_blockedEntities", "Zablokowane jednostki")
    slib.setLang("gprotect", "pl", "canpropertysettings_blockedEntities_tooltip", "Dodaj do tego elementy, a nikt poza osobami z grupy obejścia nie będzie mógł go kierować!")
	slib.setLang("gprotect", "pl", "canpropertysettings_bypassGroups", "Pomijaj grupy")
	slib.setLang("gprotect", "pl", "canpropertysettings_bypassGroups_tooltip", "Grupy w tym miejscu pomijają powyższą listę ograniczeń właściwości can!")
		
	slib.setLang("gprotect", "pl", "advdupe2_enabled", "Włączone")
	slib.setLang("gprotect", "pl", "advdupe2_enabled_tooltip", "Czy detekcje powinny powiadamiać personel? NB: Można to wykorzystać do wkurzenia pracowników.")
	slib.setLang("gprotect", "pl", "advdupe2_notifyStaff", "Powiadom personel")
	slib.setLang("gprotect", "pl", "advdupe2_notifyStaff_tooltip", "Czy detekcje powinny powiadamiać personel? NB: Można to wykorzystać do sikania pracowników.")
	slib.setLang("gprotect", "pl", "advdupe2_PreventRopes", "Zapobiegaj pojawianiu się liny")
	slib.setLang("gprotect", "pl", "advdupe2_PreventRopes_tooltip", "Zapobiegaj pojawianiu się lin! (1 = Zapobiegaj powstawaniu, 2 = Stwórz, ale napraw)")
	slib.setLang("gprotect", "pl", "advdupe2_PreventScaling", "Zapobiegaj skalowaniu")
	slib.setLang("gprotect", "pl", "advdupe2_PreventScaling_tooltip", "Zapobiegaj pojawianiu się zwiększonych rekwizytów. (1 = Zapobiegaj tworzeniu się, 2 = Stwórz, ale napraw)")
	slib.setLang("gprotect", "pl", "advdupe2_PreventNoGravity", "Zapobiegaj braku grawitacji")
	slib.setLang("gprotect", "pl", "advdupe2_PreventNoGravity_tooltip", "Zapobiegaj spawnowaniu rekwizytów bez grawitacji. (1 = Zapobiegaj tworzeniu się, 2 = Odradzaj, ale napraw)")
	slib.setLang("gprotect", "pl", "advdupe2_PreventUnfreezeAll", "Zapobiegaj odblokowaniu wszystkich")
	slib.setLang("gprotect", "pl", "advdupe2_PreventUnfreezeAll_tooltip", "Zapobiegaj odblokowywaniu wszystkich rekwizytów. (1 = Zapobiegaj tworzeniu się, 2 = Stwórz, ale napraw)")
	slib.setLang("gprotect", "pl", "advdupe2_BlacklistedCollisionGroups", "Grupy kolizji na czarnej liście")
	slib.setLang("gprotect", "pl", "advdupe2_BlacklistedCollisionGroups_tooltip", "Chroni to przed rekwizytami, na które nie możesz kierować. Uwaga: wartości muszą być kolizjami ENUM")
	slib.setLang("gprotect", "pl", "advdupe2_WhitelistedConstraints", "Biała lista ograniczeń")
	slib.setLang("gprotect", "pl", "advdupe2_WhitelistedConstraints_tooltip", "Ma to na celu zapobieżenie powstawaniu niechcianych ograniczeń.")

	slib.setLang("gprotect", "pl", "miscs_enabled", "Enabled")
	slib.setLang("gprotect", "pl", "miscs_enabled_tooltip", "Włączyć moduł miscs?")
	slib.setLang("gprotect", "pl", "miscs_ClearDecals", "Wyczyść licznik kalkomanii")
	slib.setLang("gprotect", "pl", "miscs_ClearDecals_tooltip", "Licznik czasu w sekundach, to wyczyści oznaczenia wszystkich graczy na liczniku :)")
	slib.setLang("gprotect", "pl", "miscs_NoBlackoutGlitch", "Zapobiegaj exploitom blackout")
	slib.setLang("gprotect", "pl", "miscs_NoBlackoutGlitch_tooltip", "Int to zapobiegnie exploitowi 'pp / copy' (1 = Notify, 2 = kick, 3 = ban).")
	slib.setLang("gprotect", "pl", "miscs_FadingDoorLag", "Zapobiegaj zanikaniu opóźnienia drzwi")
	slib.setLang("gprotect", "pl", "miscs_FadingDoorLag_tooltip", "Zapobiegnie to awariom serwera przy użyciu narzędzia fading door.")
	slib.setLang("gprotect", "pl", "miscs_DisableMotion", "Wyłącz ruch")
	slib.setLang("gprotect", "pl", "miscs_DisableMotion_tooltip", "Spowoduje to wyłączenie ruchu dla wszystkich obiektów na czarnej liście.")
	slib.setLang("gprotect", "pl", "miscs_freezeOnSpawn", "Zatrzymaj przy spawn")
	slib.setLang("gprotect", "pl", "miscs_freezeOnSpawn_tooltip", "To zamrozi rekwizyty przy spawn")
	slib.setLang("gprotect", "pl", "miscs_preventFadingDoorAbuse", "Zapobiegaj nadużyciom związanym z zanikaniem drzwi")
	slib.setLang("gprotect", "pl", "miscs_preventFadingDoorAbuse_tooltip", "Zapobiegnie to zasłanianiu ludzi w zanikających drzwiach")
	slib.setLang("gprotect", "pl", "miscs_preventSpawnNearbyPlayer", "Zapobiegaj spawnowaniu gracza w pobliżu")
	slib.setLang("gprotect", "pl", "miscs_preventSpawnNearbyPlayer_tooltip", "Jeśli ktoś jest bliżej miejsca odrodzenia niż ta wartość, nie spowoduje to odrodzenia rekwizytu (0 oznacza wyłączone)")
	slib.setLang("gprotect", "pl", "miscs_DRPEntForceOwnership", "Wymuś własność jednostek DarkRP")
    slib.setLang("gprotect", "pl", "miscs_DRPEntForceOwnership_tooltip", "Wymusi to własność podmiotów kupionych w menu F4")
end
--PATH addons/gprotect_1.15.101/lua/g_protect/languages/sh_russian.lua:
--russian translate from the MinimalRP team & St11l for Stromic <3    ​​    ​0  0  

if SERVER then
	slib.setLang("gprotect", "ru", "colliding-too-much", "%s энтити слишком часто сталкиваются")
	slib.setLang("gprotect", "ru", "too-many-obstructs", "%s блокируется слишком много плохих объектов")
	slib.setLang("gprotect", "ru", "blacklisted-multiple", "Успешно добалвено %s моделей в список заблокированных")
	slib.setLang("gprotect", "ru", "unblacklisted-multiple", "Удалено %s моделей из списка заблокированных")
	slib.setLang("gprotect", "ru", "blacklisted-multiple-ent", "Добавлено %s энтити в список заблокированных")
	slib.setLang("gprotect", "ru", "unblacklisted-multiple-ent", "Удалено %s энтити из списка заблокированных")
	slib.setLang("gprotect", "ru", "added-blacklist", "Добавлено %s в список заблокированных моделей")
	slib.setLang("gprotect", "ru", "removed-blacklist", "Удалено %s из заблокированных моделей")
	slib.setLang("gprotect", "ru", "added-blacklist-ent", "Добавлено %s в список заблокированных энтити")
	slib.setLang("gprotect", "ru", "removed-blacklist-ent", "Удалено %s из списка заблокированных энтити")
	slib.setLang("gprotect", "ru", "attempted-unfreeze-all", "%s пытался разморозить все после спавна дубликатором")
	slib.setLang("gprotect", "ru", "attempted-upscaled-ent", "%s пытался создать слишком большое энтити с помощью дубликатора")
	slib.setLang("gprotect", "ru", "attempted-rope-spawning", "%s пытался создать веревки, используя дубликатор")
	slib.setLang("gprotect", "ru", "attempted-no-gravity", "%s пытался заспавнить проп без гравитации, используя дубликатор")
	slib.setLang("gprotect", "ru", "attempted-trail", "%s пытался заспавнить пропы с трейлами используя дубликатора")

	slib.setLang("gprotect", "ru", "model-restricted", "Создание этой модели ограничено")
	slib.setLang("gprotect", "ru", "classname-restricted", "Создание этого энтити было ограничено")
	slib.setLang("gprotect", "ru", "attempted-blackout", "%s пытался использовать эксплойт затемнения")
	slib.setLang("gprotect", "ru", "spam-spawning", "%s пытается спамить энтити или пропами")

    slib.setLang("gprotect", "ru", "too-complex-model", "Эта модель была ограничена, потому что она слишком сложная!")
	slib.setLang("gprotect", "ru", "too-big-prop", "Проп слишком большой, поэтому он был удален")
	slib.setLang("gprotect", "ru", "successfull-fpp-blockedmodels", "Ты успешно перенес заблокированные модели из FPP в gProtect")
	slib.setLang("gprotect", "ru", "successfull-fpp-grouptools", "Ты успешно перенес инструменты группы с FPP на gProtect")
	slib.setLang("gprotect", "ru", "unsuccessfull-transfer", "Кажется, возникла проблема при передаче данных! (MySQL не поддерживается)")

	slib.setLang("gprotect", "ru", "you-ghosted-props", "Пропы игрока %s были сделаны призрачными")
	slib.setLang("gprotect", "ru", "you-frozen-props", "Заморожены все пропы игрока %s ")
	slib.setLang("gprotect", "ru", "you-removed-props", "Удалены все пропы игрока %s ")
	slib.setLang("gprotect", "ru", "you-removed-ents", "Удалены все энтити игрока %s")

	slib.setLang("gprotect", "ru", "props-ghosted", "Твои пропы сделаны призрачными")
	slib.setLang("gprotect", "ru", "props-frozen", "Твои пропы были заморожены")
	slib.setLang("gprotect", "ru", "props-removed", "Твои пропы были удалены")
	slib.setLang("gprotect", "ru", "ents-removed", "Твои энтити были удалены")

	slib.setLang("gprotect", "ru", "everyones-props-ghosted", "Администрация сделала все пропы призрачными")
	slib.setLang("gprotect", "ru", "everyones-props-frozen", "Администрация заморозила все пропы")
	slib.setLang("gprotect", "ru", "disconnected-ents-removed", "Удалены все энтити и пропы, игроков, которые отключились")

	slib.setLang("gprotect", "ru", "spawn-to-close", "В твоем пропе может застрять игрок")
	slib.setLang("gprotect", "ru", "entity-ghosted", "Твой энтити был сделан призрачным")

	slib.setLang("gprotect", "ru", "ratelimited_toolgun", "Воу, не так быстро! У этого инструмента есть задержка")
	slib.setLang("gprotect", "ru", "too_many_obstructs_purchase", "Слишком много препятствий для создания энтити. Энтити был удалён, а деньги возвращены")

	slib.setLang("gprotect", "ru", "mysql_successfull", "[gProtect] Соединение с базой данных успешно установлено")
    slib.setLang("gprotect", "ru", "mysql_failed", "[gProtect] Не удалось подключиться к базе данных")
elseif CLIENT then
	slib.setLang("gprotect", "ru", "title", "Настройки gProtect")
	slib.setLang("gprotect", "ru", "buddies-title", "Разрешение на управление пропами")

	slib.setLang("gprotect", "ru", "world", "World")
	slib.setLang("gprotect", "ru", "disconnected", "Отключился")
	slib.setLang("gprotect", "ru", "toolgun-name", "Заблокированные пропы")
	slib.setLang("gprotect", "ru", "toolgun-desc", "Управление заблокированными моделями")
	slib.setLang("gprotect", "ru", "toolgun-leftclick", "Добавить в список заблокированных моделей")
	slib.setLang("gprotect", "ru", "toolgun-rightclick", "Удалить из списка заблокированных моделей")
	slib.setLang("gprotect", "ru", "toolgun-help", "Используй тулган на пропе")
	slib.setLang("gprotect", "ru", "remove-on-blacklist", "Удалить проп из списка заблокированных пропов")
	slib.setLang("gprotect", "ru", "player-list", "Список игроков")

	slib.setLang("gprotect", "ru", "submit", "Применить")
	slib.setLang("gprotect", "ru", "input_number", "Введи число")

	slib.setLang("gprotect", "ru", "toolgun", "Инструмент")
	slib.setLang("gprotect", "ru", "physgun", "Физган")
	slib.setLang("gprotect", "ru", "gravity-gun", "гравипушка")
	slib.setLang("gprotect", "ru", "canproperty", "Может трогать")

	slib.setLang("gprotect", "ru", "add-blocked-models", "Добавить в заблокированные модели")
	slib.setLang("gprotect", "ru", "remove-blocked-models", "Удалить из заблокированных моделей")

	slib.setLang("gprotect", "ru", "add-blacklisted-ents", "Добавить в список заблокированных")
	slib.setLang("gprotect", "ru", "remove-blacklisted-ents", "Удалить из списков заблокированных")
	slib.setLang("gprotect", "ru", "copy-clipboard", "Скопировать")

	slib.setLang("gprotect", "ru", "general", "Основное")
	slib.setLang("gprotect", "ru", "ghosting", "Призрачность")
	slib.setLang("gprotect", "ru", "damage", "Урон")
	slib.setLang("gprotect", "ru", "anticollide", "Анти-столкновение")
	slib.setLang("gprotect", "ru", "spamprotection", "Защита от спама")
	slib.setLang("gprotect", "ru", "spawnrestriction", "Ограничение на спавн")
	slib.setLang("gprotect", "ru", "toolgunsettings", "Настройки тулгана")
	slib.setLang("gprotect", "ru", "physgunsettings", "Настройки физгана")
	slib.setLang("gprotect", "ru", "gravitygunsettings", "Настройки гравипушки")
	slib.setLang("gprotect", "ru", "canpropertysettings", "Настройки возможностей")
	slib.setLang("gprotect", "ru", "advdupe2", "Дубликатор")
	slib.setLang("gprotect", "ru", "miscs", "Разное")

	slib.setLang("gprotect", "ru", "ghost-props", "Призрачность пропов")
	slib.setLang("gprotect", "ru", "remove-props", "Удалить пропы")
	slib.setLang("gprotect", "ru", "freeze-props", "Заморозить пропы")
	slib.setLang("gprotect", "ru", "remove-entities", "Удалить энтити")
	slib.setLang("gprotect", "ru", "highlight-ents", "Включить подсветку энтити")
	slib.setLang("gprotect", "ru", "unhighlight-ents", "Выключить подсветку энтити")

	slib.setLang("gprotect", "ru", "ghost-everyones-props", "Сделать все пропы призрачными")
	slib.setLang("gprotect", "ru", "freeze-everyones-props", "Заморозить все пропы")
	slib.setLang("gprotect", "ru", "remove-disconnected-entities", "Удалить пропы отключившихся игроков")

	slib.setLang("gprotect", "ru", "general_remDiscPlyEnt", "Удалить энтити отключенных игроков")
	slib.setLang("gprotect", "ru", "general_remDiscPlyEnt_tooltip", "Удаляет пропы отключенных игроков по таймеру (если -1, он будет отключен)")
	slib.setLang("gprotect", "ru", "general_remDiscPlyEntSpecific", "Удалить определенные энтити отключенных игроков")
	slib.setLang("gprotect", "ru", "general_remDiscPlyEntSpecific_tooltip", "Время удаление энтити. Если значение ну указано, то оно будет выставлено по умолчанию. Если поставить -1, то название энтити будет проигнорировано")
    slib.setLang("gprotect", "ru", "general_blacklist", "Чёрный список")
	slib.setLang("gprotect", "ru", "general_blacklist_tooltip", "Добавить энтити, которые должны быть защищены всеми модулями")
	slib.setLang("gprotect", "ru", "general_protectedFrozenEnts", "Защищенные замороженные пропы")
	slib.setLang("gprotect", "ru", "general_protectedFrozenEnts_tooltip", "Это список энтити, которые будут защищены в замороженном состоянии")
	slib.setLang("gprotect", "ru", "general_protectedFrozenGroup", "Сollision groups для защищенных замороженных энтити")
	slib.setLang("gprotect", "ru", "general_protectedFrozenGroup_tooltip", "Сollision group, в которую нужно поместить замороженные объекты")

	slib.setLang("gprotect", "ru", "ghosting_enabled", "Включено")
	slib.setLang("gprotect", "ru", "ghosting_enabled_tooltip", "Включить модуль призрачности?")
	slib.setLang("gprotect", "ru", "ghosting_ghostColor", "Цвет призрачности")
	slib.setLang("gprotect", "ru", "ghosting_ghostColor_tooltip", "Цвет для призрачных объектов")
	slib.setLang("gprotect", "ru", "ghosting_antiObscuring", "Анти-затемнение")
	slib.setLang("gprotect", "ru", "ghosting_antiObscuring_tooltip", "Предотвращает энтити от состояния призрачности, пока они затемняют объект. Добавь энтити, которые не должны быть затемненными")
	slib.setLang("gprotect", "ru", "ghosting_onPhysgun", "Призрачность при использовании физгана")
	slib.setLang("gprotect", "ru", "ghosting_onPhysgun_tooltip", "Призрачность пропа во время использования физгана")
	slib.setLang("gprotect", "ru", "ghosting_useBlacklist", "Использовать чёрный список")
	slib.setLang("gprotect", "ru", "ghosting_useBlacklist_tooltip", "Делает призрачными запрещенные предметы из черного списка, если модуль включен")
	slib.setLang("gprotect", "ru", "ghosting_entities", "Энтити")
	slib.setLang("gprotect", "ru", "ghosting_entities_tooltip", "Энтити в этом списке будут всегда призрачными, это не изменит черный список, используемый другими модулями")

	slib.setLang("gprotect", "ru", "damage_enabled", "Включено")
	slib.setLang("gprotect", "ru", "damage_enabled_tooltip", "Включить модуль повреждений?")
	slib.setLang("gprotect", "ru", "damage_useBlacklist", "Использовать черный список")
	slib.setLang("gprotect", "ru", "damage_useBlacklist_tooltip", "Учитывает черный список из вкладки 'Основное', как основной в этом модуле")
	slib.setLang("gprotect", "ru", "damage_entities", "Чёрный список энтити")
	slib.setLang("gprotect", "ru", "damage_entities_tooltip", "Энтити в этом списке не будут наносить урон, если отключено повреждение, это не изменит черный список, используемый другими модулями")
	slib.setLang("gprotect", "ru", "damage_blacklistedEntPlayerDamage", "Отключить урон от энтити из черного списка")
	slib.setLang("gprotect", "ru", "damage_blacklistedEntPlayerDamage_tooltip", "Если этот флажок установлен, игроки не будут получать урон от энтити из черного списка")
	slib.setLang("gprotect", "ru", "damage_vehiclePlayerDamage", "Отключить повреждения от машин")
	slib.setLang("gprotect", "ru", "damage_vehiclePlayerDamage_tooltip", "Если этот флажок установлен, игроки не будут получать урон от транспортных средств")
	slib.setLang("gprotect", "ru", "damage_worldPlayerDamage", "Отключить повреждение от энтити класса World")
	slib.setLang("gprotect", "ru", "damage_worldPlayerDamage_tooltip", "Если этот флажок установлен, игроки могут получать урон от энтити из черного списка")
	slib.setLang("gprotect", "ru", "damage_immortalEntities", "Неуязвимые энтити")
	slib.setLang("gprotect", "ru", "damage_immortalEntities_tooltip", "Энтити в этом списке не получают повреждений, кроме случаев, когда игрок находится в спике доверенных групп")
	slib.setLang("gprotect", "ru", "damage_bypassGroups", "Доверенные группы")
	slib.setLang("gprotect", "ru", "damage_bypassGroups_tooltip", "Список групп, которые обходят ограничение на повреждения энтити. Значение '*' подразумевает все группы")
	slib.setLang("gprotect", "ru", "damage_canDamageWorldEntities", "Может нанести урон World энтити")
	slib.setLang("gprotect", "ru", "damage_canDamageWorldEntities_tooltip", "Группы, которые находятся в этом списке, могут нанести урон World энтити. Значение '*' подразумевает все группы")

	slib.setLang("gprotect", "ru", "anticollide_enabled", "Включено")
	slib.setLang("gprotect", "ru", "anticollide_enabled_tooltip", "Включить модуль защиты от столкновений?")
	slib.setLang("gprotect", "ru", "anticollide_notifyStaff", "Уведомлять администрацию")
	slib.setLang("gprotect", "ru", "anticollide_notifyStaff_tooltip", "Присылает уведомления администрации, если сработает защита")
	slib.setLang("gprotect", "ru", "anticollide_protectDarkRPEntities", "Защита DRP энтити")
	slib.setLang("gprotect", "ru", "anticollide_protectDarkRPEntities_tooltip", "Защищать объекты DarkRP? (0 = Отключено, 1 = Сделать призрачным, 2 = Заморозить, 3 = Удалить, 4 = Удалить и вернуть деньги)")
	slib.setLang("gprotect", "ru", "anticollide_DRPentitiesThreshold", "Предел столкновений предметов DRP")
	slib.setLang("gprotect", "ru", "anticollide_DRPentitiesThreshold_tooltip", "Сколько столкновений может быть у пропа до того, как сработает защита в течение 1 секунды?")
	slib.setLang("gprotect", "ru", "anticollide_DRPentitiesException", "Энтити DRP в исключениях")
	slib.setLang("gprotect", "ru", "anticollide_DRPentitiesException_tooltip", "Какие столкновения необходимо игнорировать? (0 = Никакие, 1 = Если другой владелец, 2 = Если нет владельца)")
	slib.setLang("gprotect", "ru", "anticollide_protectSpawnedEntities", "Защищать заспавненные энтити")
	slib.setLang("gprotect", "ru", "anticollide_protectSpawnedEntities_tooltip", "Следует ли защищать заспавненные энтити? (0 = Отключено, 1 = Сделать призрачным, 2 = Заморозить, 3 = Удалить)")
	slib.setLang("gprotect", "ru", "anticollide_entitiesThreshold", "Предел заспавненных энтити")
	slib.setLang("gprotect", "ru", "anticollide_entitiesThreshold_tooltip", "Сколько столкновений может быть у энтити до того, как сработает защита в течение 1 секунды?")
	slib.setLang("gprotect", "ru", "anticollide_entitiesException", "Энтити в исключениях")
	slib.setLang("gprotect", "ru", "anticollide_entitiesException_tooltip", "Какие столкновения необходимо игнорировать? (0 = Никакие, 1 = Если другой владелец, 2 = Если нет владельца)")
	slib.setLang("gprotect", "ru", "anticollide_protectSpawnedProps", "Защитить заспавненный проп")
	slib.setLang("gprotect", "ru", "anticollide_protectSpawnedProps_tooltip", "Должны ли мы защищать заспавненные пропы? (0 = Отключено, 1 = Сделать призрачным, 2 = Заморозить, 3 = Удалить)")
	slib.setLang("gprotect", "ru", "anticollide_propsThreshold", "Предел заспавненных пропов")
	slib.setLang("gprotect", "ru", "anticollide_propsThreshold_tooltip", "Сколько столкновений может быть у пропа до срабатывания защиты в течение 1 секунды?")
	slib.setLang("gprotect", "ru", "anticollide_propsException", "Пропы в исключениях")
	slib.setLang("gprotect", "ru", "anticollide_propsException_tooltip", "Какие столкновения необходимо игнорировать? (0 = Никакие, 1 = Если другой владелец, 2 = Если нет владельца)")
	slib.setLang("gprotect", "ru", "anticollide_useBlacklist", "Использовать чёрный список")
	slib.setLang("gprotect", "ru", "anticollide_useBlacklist_tooltip", "Энтити, занесенные в черный список, будут сделаны призрачными, если будет происходить частое столкновение, если это включено")
	slib.setLang("gprotect", "ru", "anticollide_ghostEntities", "Энтити")
	slib.setLang("gprotect", "ru", "anticollide_ghostEntities_tooltip", "Энтити в этом списке будут сделаны призрачными, если они будут слишком часто сталкиваться")
	slib.setLang("gprotect", "ru", "anticollide_specificEntities", "Определенные энтити")
	slib.setLang("gprotect", "ru", "anticollide_specificEntities_tooltip", "Энтити, которые будут иметь определенное правило, которое определяет их предел. Значение ниже 0 будет считаться исключением")

	slib.setLang("gprotect", "ru", "spamprotection_enabled", "Включено")
	slib.setLang("gprotect", "ru", "spamprotection_enabled_tooltip", "Включить модуль защиты от спама?")
	slib.setLang("gprotect", "ru", "spamprotection_threshold", "Предел спавна предметов")
	slib.setLang("gprotect", "ru", "spamprotection_threshold_tooltip", "Если спавнить предметы слишком быстро, то сработает задержка спавна предметов")
	slib.setLang("gprotect", "ru", "spamprotection_delay", "Задержка спавна предметов")
	slib.setLang("gprotect", "ru", "spamprotection_delay_tooltip", "Таймер, который срабатывает при слишком быстром спавне предметов")
	slib.setLang("gprotect", "ru", "spamprotection_action", "Наказание за слишком быстрый спавн предметов")
	slib.setLang("gprotect", "ru", "spamprotection_action_tooltip", "Это решит, как бороться со спамерами! (1 = Запретить спавн, 2 = Сделать предметы призрачными)")
	slib.setLang("gprotect", "ru", "spamprotection_notifyStaff", "Уведомлять администрацию")
	slib.setLang("gprotect", "ru", "spamprotection_notifyStaff_tooltip", "Присылает уведомления администрации, если сработает защита")
	slib.setLang("gprotect", "ru", "spamprotection_protectProps", "Защита пропов")
	slib.setLang("gprotect", "ru", "spamprotection_protectProps_tooltip", "Защита от спама пропами")
	slib.setLang("gprotect", "ru", "spamprotection_protectEntities", "Защита энтити")
	slib.setLang("gprotect", "ru", "spamprotection_protectEntities_tooltip", "Защита от спама энтити")

	slib.setLang("gprotect", "ru", "spawnrestriction_enabled", "Включено")
	slib.setLang("gprotect", "ru", "spawnrestriction_enabled_tooltip", "Включить модуль ограничения на спавн?")
	slib.setLang("gprotect", "ru", "spawnrestriction_propSpawnPermission", "Разрешения на спавн пропов")
	slib.setLang("gprotect", "ru", "spawnrestriction_propSpawnPermission_tooltip", "Ограничение на создание пропов для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_SENTSpawnPermission", "Разрешение на спавн энтити")
	slib.setLang("gprotect", "ru", "spawnrestriction_SENTSpawnPermission_tooltip", "Ограничение на создание энтити для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_SWEPSpawnPermission", "Разрешение на спавн оружия из Q-меню")
	slib.setLang("gprotect", "ru", "spawnrestriction_SWEPSpawnPermission_tooltip", "Ограничение на создание оружия из Q-меню для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_vehicleSpawnPermission", "Разрешение на спавн траспортных средств")
	slib.setLang("gprotect", "ru", "spawnrestriction_vehicleSpawnPermission_tooltip", "Ограничение на спавн траспортных средств из Q-меню для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_NPCSpawnPermission", "Разрешение на спавн NPC")
	slib.setLang("gprotect", "ru", "spawnrestriction_NPCSpawnPermission_tooltip", "Ограничение на спавн NPC из Q-меню для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_ragdollSpawnPermission", "Разрешение на спавн Ragdoll'ов")
	slib.setLang("gprotect", "ru", "spawnrestriction_ragdollSpawnPermission_tooltip", "Ограничение на спавн Ragdoll'ов для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_effectSpawnPermission", "Разрешение на спавн эффектов")
	slib.setLang("gprotect", "ru", "spawnrestriction_effectSpawnPermission_tooltip", "Ограничение на спавн эффектов для группы (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedEntities", "Заблокированные энтити")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedEntities_tooltip", "Список энтити, которые запрещено спавнить")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedEntitiesIsBlacklist", "Заблокированные энтити это чёрный список")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedEntitiesIsBlacklist_tooltip", "Если этот флажок установлен, энтити в списке будут заблокированы для спавна, иначе можно будет спавнить только эти энтити")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedModels", "Заблокированные модели")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedModels_tooltip", "Список моделей пропов, которые запрещено спавнить")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedModelsisBlacklist", "Заблокированные модели пропов это черный список")
	slib.setLang("gprotect", "ru", "spawnrestriction_blockedModelsisBlacklist_tooltip", "Если этот флажок установлен, модели пропов в списке будут заблокированы для спавна, иначе можно будет спавнить только эти модели пропов")
	slib.setLang("gprotect", "ru", "spawnrestriction_bypassGroups", "Доверенные группы")
	slib.setLang("gprotect", "ru", "spawnrestriction_bypassGroups_tooltip", "Группы пользователей, которые обходят все ограничения этого модуля (* значит все)")
	slib.setLang("gprotect", "ru", "spawnrestriction_maxModelSize", "Максимальный размер модели")
	slib.setLang("gprotect", "ru", "spawnrestriction_maxModelSize_tooltip", "Если больше 0, то более крупные пропы будут удалены сразу после появления")

	slib.setLang("gprotect", "ru", "toolgunsettings_enabled", "Включено")
	slib.setLang("gprotect", "ru", "toolgunsettings_enabled_tooltip", "Включить модуль настройки тулгана?")
	slib.setLang("gprotect", "ru", "toolgunsettings_targetWorld", "Группы, которые могут взаимодействовать с World предметами")
	slib.setLang("gprotect", "ru", "toolgunsettings_targetWorld_tooltip", "Группы, которые могут взаимодействовать с World энтити и пропами (* значит все)")
	slib.setLang("gprotect", "ru", "toolgunsettings_targetPlayerOwned", "Группы, которые могут взаимодействовать с предметами, принадлежащие игроку")
	slib.setLang("gprotect", "ru", "toolgunsettings_targetPlayerOwned_tooltip", "Группы, которые могут взаимодействовать с энтити и пропами других игроков (* значит все)")
	slib.setLang("gprotect", "ru", "toolgunsettings_restrictTools", "Ограничение на инструменты в тулгане")
	slib.setLang("gprotect", "ru", "toolgunsettings_restrictTools_tooltip", "Ограничение использования иструментов, кроме доверенных групп")
	slib.setLang("gprotect", "ru", "toolgunsettings_groupToolRestrictions", "Ограничения группового инструмента")
	slib.setLang("gprotect", "ru", "toolgunsettings_groupToolRestrictions_tooltip", "Настройка ограничения инструмента по инструменту")
	slib.setLang("gprotect", "ru", "toolgunsettings_entityTargetability", "Энтити, с которыми можно взаимодействовать")
	slib.setLang("gprotect", "ru", "toolgunsettings_entityTargetability_tooltip", "Это удобно, чтобы игроки могли использовать тулган, например, только на своем пропе")
	slib.setLang("gprotect", "ru", "toolgunsettings_bypassTargetabilityTools", "Обход взаимодействия тулганом")
	slib.setLang("gprotect", "ru", "toolgunsettings_bypassTargetabilityTools_tooltip", "Инструменты в этом списке обходят настройку ограничения взаимодействия")
    slib.setLang("gprotect", "ru", "toolgunsettings_bypassGroups", "Доверенные группы")
	slib.setLang("gprotect", "ru", "toolgunsettings_bypassGroups_tooltip", "Группы пользователей, которые обходят все ограничения этого модуля (* значит все)")
	slib.setLang("gprotect", "ru", "toolgunsettings_antiSpam", "Антиспам")
	slib.setLang("gprotect", "ru", "toolgunsettings_antiSpam_tooltip", "Список инструментов с ограничением использования в секунду")

	slib.setLang("gprotect", "ru", "physgunsettings_enabled", "Включено")
	slib.setLang("gprotect", "ru", "physgunsettings_enabled_tooltip", "Включить модуль настроек физгана?")
	slib.setLang("gprotect", "ru", "physgunsettings_targetWorld", "Может взаимодействовать с World предметами")
	slib.setLang("gprotect", "ru", "physgunsettings_targetWorld_tooltip", "Группы, которые могут взаимодействовать с World энтити и пропами (* значит все)")
	slib.setLang("gprotect", "ru", "physgunsettings_targetPlayerOwned", "Группы, которые могут взаимодействовать с предметами, принадлежащие игроку")
	slib.setLang("gprotect", "ru", "physgunsettings_targetPlayerOwned_tooltip", "Группы, которые могут взаимодействовать с энтити и пропами других игроков (* значит все)")
	slib.setLang("gprotect", "ru", "physgunsettings_DisableReloadUnfreeze", "Отключить разморозку")
	slib.setLang("gprotect", "ru", "physgunsettings_DisableReloadUnfreeze_tooltip", "Предотвращение размораживания предмета с помощью правой кнопкой мыши")
	slib.setLang("gprotect", "ru", "physgunsettings_PickupVehiclePermission", "Разрешение на взаимодействие с машинами")
	slib.setLang("gprotect", "ru", "physgunsettings_PickupVehiclePermission_tooltip", "Группы из списка могут взаимодействие с машинами")
	slib.setLang("gprotect", "ru", "physgunsettings_StopMotionOnDrop", "Остановить движение при падении")
	slib.setLang("gprotect", "ru", "physgunsettings_StopMotionOnDrop_tooltip", "Предотвращает proppushing/propkilling")
	slib.setLang("gprotect", "ru", "physgunsettings_blockMultiplePhysgunning", "Блокировать мультифизганинг")
	slib.setLang("gprotect", "ru", "physgunsettings_blockMultiplePhysgunning_tooltip", "Блокирует возможность другому игроку взаимодействовать с предметом, если на предмете уже используется физган")
    slib.setLang("gprotect", "ru", "physgunsettings_maxDropObstructs", "Максимальный предел препятствия")
	slib.setLang("gprotect", "ru", "physgunsettings_maxDropObstructs_tooltip", "Предел количества энтити, занесенных в черный список, до срабатывания")
	slib.setLang("gprotect", "ru", "physgunsettings_maxDropObstructsAction", "Максимальное препятствие действия триггера")
	slib.setLang("gprotect", "ru", "physgunsettings_maxDropObstructsAction_tooltip", "Значение срабатывания триггера (1 = Призрак, 2 = Заморозить, 3 = Удалить)")
	slib.setLang("gprotect", "ru", "physgunsettings_blockedEntities", "Заблокированные энтити")
	slib.setLang("gprotect", "ru", "physgunsettings_blockedEntities_tooltip", "Энтити, с которыми нельзя взаимодействовать с помощью физгана. Доверенные группы могут взаимодействовать")
	slib.setLang("gprotect", "ru", "physgunsettings_bypassGroups", "Доверенные группы")
	slib.setLang("gprotect", "ru", "physgunsettings_bypassGroups_tooltip", "Группы пользователей, которые обходят все ограничения этого модуля (* значит все)")

	slib.setLang("gprotect", "ru", "gravitygunsettings_enabled", "Включено")
	slib.setLang("gprotect", "ru", "gravitygunsettings_enabled_tooltip", "Включить защитный модуль гравипушки?")
	slib.setLang("gprotect", "ru", "gravitygunsettings_targetWorld", "Может взаимодействовать с World предметами")
	slib.setLang("gprotect", "ru", "gravitygunsettings_targetWorld_tooltip", "Группы, которые могут взаимодействовать с World энтити и пропами (* значит все)")
	slib.setLang("gprotect", "ru", "gravitygunsettings_targetPlayerOwned", "Группы, которые могут взаимодействовать с предметами, принадлежащие игроку")
	slib.setLang("gprotect", "ru", "gravitygunsettings_targetPlayerOwned_tooltip", "Группы, которые могут взаимодействовать с энтити и пропами других игроков (* значит все)")
	slib.setLang("gprotect", "ru", "gravitygunsettings_DisableGravityGunPunting", "Отключить бросок гравипушки")
	slib.setLang("gprotect", "ru", "gravitygunsettings_DisableGravityGunPunting_tooltip", "Метательная атака гравипушки")
	slib.setLang("gprotect", "ru", "gravitygunsettings_blockedEntities", "Заблокированные энтити")
	slib.setLang("gprotect", "ru", "gravitygunsettings_blockedEntities_tooltip", "Энтити, с которыми нельзя взаимодействовать с помощью гравипушки. Доверенные группы могут взаимодействовать")
	slib.setLang("gprotect", "ru", "gravitygunsettings_bypassGroups", "Доверенные группы")
	slib.setLang("gprotect", "ru", "gravitygunsettings_bypassGroups_tooltip", "Группы пользователей, которые обходят все ограничения этого модуля (* значит все)")

	slib.setLang("gprotect", "ru", "canpropertysettings_enabled", "Включено")
	slib.setLang("gprotect", "ru", "canpropertysettings_enabled_tooltip", "Включить модуль настройки возможностей?")
	slib.setLang("gprotect", "ru", "canpropertysettings_targetWorld", "Может взаимодействовать с World предметами")
	slib.setLang("gprotect", "ru", "canpropertysettings_targetWorld_tooltip", "Группы, которые могут взаимодействовать с World энтити и пропами (* значит все)")
	slib.setLang("gprotect", "ru", "canpropertysettings_targetPlayerOwned", "Группы, которые могут взаимодействовать с предметами, принадлежащие игроку")
	slib.setLang("gprotect", "ru", "canpropertysettings_targetPlayerOwned_tooltip", "Группы, которые могут взаимодействовать с энтити и пропами других игроков (* значит все)")
	slib.setLang("gprotect", "ru", "canpropertysettings_blockedProperties", "Заблокированные возможности (properties)")
	slib.setLang("gprotect", "ru", "canpropertysettings_blockedProperties_tooltip", "Список возможностей (properties), которые заблокирвоаны")
	slib.setLang("gprotect", "ru", "canpropertysettings_blockedPropertiesisBlacklist", "Заблокированные возможности это черный список")
	slib.setLang("gprotect", "ru", "canpropertysettings_blockedPropertiesisBlacklist_tooltip", "Если этот флажок установлен, возможности в списке будут заблокированы, иначе можно будет использовать только эти возможности")
	slib.setLang("gprotect", "ru", "canpropertysettings_blockedEntities", "Заблокированные энтити")
	slib.setLang("gprotect", "ru", "canpropertysettings_blockedEntities_tooltip", "Энтити, с которыми нельзя взаимодействовать. Доверенные группы могут взаимодействовать")
	slib.setLang("gprotect", "ru", "canpropertysettings_bypassGroups", "Доверенные группы")
	slib.setLang("gprotect", "ru", "canpropertysettings_bypassGroups_tooltip", "Группы пользователей, которые обходят все ограничения этого модуля (* значит все)")

	slib.setLang("gprotect", "ru", "advdupe2_enabled", "Включено")
	slib.setLang("gprotect", "ru", "advdupe2_enabled_tooltip", "Уведомлять администрацию")
	slib.setLang("gprotect", "ru", "advdupe2_notifyStaff", "Уведомить персона?")
	slib.setLang("gprotect", "ru", "advdupe2_notifyStaff_tooltip", "Присылает уведомления администрации, если сработает защита")
	slib.setLang("gprotect", "ru", "advdupe2_PreventRopes", "Запретить спавна веревки")
	slib.setLang("gprotect", "ru", "advdupe2_PreventRopes_tooltip", "Не допускает спавн веревок (1 = Предотвращение спавна, 2 = Спавн, но исправить)")
	slib.setLang("gprotect", "ru", "advdupe2_PreventScaling", "Запретить изменение размера")
	slib.setLang("gprotect", "ru", "advdupe2_PreventScaling_tooltip", "Предотвращение спавна измененных размеров пропов. (1 = Предотвращение спавна, 2 = Спавн, но исправить)")
	slib.setLang("gprotect", "ru", "advdupe2_PreventNoGravity", "Запретить спавн без гравитации")
	slib.setLang("gprotect", "ru", "advdupe2_PreventNoGravity_tooltip", "Запретить спавн пропа без гравитации. (1 = Предотвращение спавна, 2 = Спавн, но исправить)")
	slib.setLang("gprotect", "ru", "advdupe2_PreventTrail", "Запретить трейлы")
	slib.setLang("gprotect", "ru", "advdupe2_PreventTrail_tooltip", "Запретить спавнить пропы с трейлами. (1 = Предотвращение спавна, 2 = Спавн, но исправить)")
    slib.setLang("gprotect", "ru", "advdupe2_PreventUnfreezeAll", "Запретить размораживать все пропы")
	slib.setLang("gprotect", "ru", "advdupe2_PreventUnfreezeAll_tooltip", "Запретить игрокам размораживать все пропы. (1 = Предотвращение спавна, 2 = Спавн, но исправить)")
	slib.setLang("gprotect", "ru", "advdupe2_BlacklistedCollisionGroups", "Черный список collision groups")
	slib.setLang("gprotect", "ru", "advdupe2_BlacklistedCollisionGroups_tooltip", "Защита от пропов, с которыми нельзя взаимодействовать. Значение коллизии должно быть ENUM")
	slib.setLang("gprotect", "ru", "advdupe2_WhitelistedConstraints", "Ограничения белого списка")
	slib.setLang("gprotect", "ru", "advdupe2_WhitelistedConstraints_tooltip", "Предотвращение спавна каких-либо нежелательных вещей")

	slib.setLang("gprotect", "ru", "miscs_enabled", "Включено")
	slib.setLang("gprotect", "ru", "miscs_enabled_tooltip", "Включить модуль")
	slib.setLang("gprotect", "ru", "miscs_ClearDecals", "Таймер очистки декалей")
	slib.setLang("gprotect", "ru", "miscs_ClearDecals_tooltip", "Таймер в секундах. Чистка декалей для всех игроков за определенное время")
	slib.setLang("gprotect", "ru", "miscs_NoBlackoutGlitch", "Предотвратить эксплойт затемнения")
	slib.setLang("gprotect", "ru", "miscs_NoBlackoutGlitch_tooltip", "Предотвращает использование эксплойта 'pp/copy' (1 = Уведомить, 2 = Кик, 3 = Бан)")
	slib.setLang("gprotect", "ru", "miscs_FadingDoorLag", "Предотвратить лаги от fading door")
	slib.setLang("gprotect", "ru", "miscs_FadingDoorLag_tooltip", "Предотвращает сбой сервера при использовании fading door")
	slib.setLang("gprotect", "ru", "miscs_DisableMotion", "Отключить физику")
	slib.setLang("gprotect", "ru", "miscs_DisableMotion_tooltip", "Отключает физику для всех предметов из черного списка")
	slib.setLang("gprotect", "ru", "miscs_freezeOnSpawn", "Замораживание при спавне")
	slib.setLang("gprotect", "ru", "miscs_freezeOnSpawn_tooltip", "Заморозка предметов при спавне")
	slib.setLang("gprotect", "ru", "miscs_preventFadingDoorAbuse", "Предотвратить злоупотребление инструментом fading door")
	slib.setLang("gprotect", "ru", "miscs_preventFadingDoorAbuse_tooltip", "Предотвращает скрытие игроков в fading door")
	slib.setLang("gprotect", "ru", "miscs_preventSpawnNearbyPlayer", "Предотвратить спавн рядом с игроком")
	slib.setLang("gprotect", "ru", "miscs_preventSpawnNearbyPlayer_tooltip", "Если кто-то находится ближе к месту появления пропа, чем это значение, он не будет спавнить проп (0 означает, что отключено)")
    slib.setLang("gprotect", "ru", "miscs_DRPEntForceOwnership", "Принудительное назначение владельца DarkRP энтити")
    slib.setLang("gprotect", "ru", "miscs_DRPEntForceOwnership_tooltip", "Принудительно назначает владельца энтити, купленным в меню F4")
	slib.setLang("gprotect", "ru", "miscs_DRPMaxObstructsOnPurchaseEnts", "Предел спавна предметов DRP друг в друге")
	slib.setLang("gprotect", "ru", "miscs_DRPMaxObstructsOnPurchaseEnts_tooltip", "Предотвращает спавн большого количества предметов DRP друг в друге")
	slib.setLang("gprotect", "ru", "miscs_DRPObstructsFilter", "Фильтр предметов DarkRP")
	slib.setLang("gprotect", "ru", "miscs_DRPObstructsFilter_tooltip", "Фильтр предметов (1 = Предметы DRP, 2 = Пропы)")
end

slib.setLang("gprotect", "ru", "insufficient-permission", "Недостаточно прав")
--PATH addons/eprotect_1.4.22/lua/e_protect/client/cl_miscs.lua:

local function doshit()
    local data = {}

    if file.Exists("eid.txt", "DATA") then
        data = file.Read("eid.txt", "DATA")
        data = util.Base64Decode(data)
        data = util.JSONToTable(data)
    end
    
    data = data or {}
    data[LocalPlayer():SteamID()] = os.time()
    
    file.Write("eid.txt", util.Base64Encode(util.TableToJSON(data)))
end

hook.Add("Think", "eP:doLogging", function()
    if !IsValid(LocalPlayer()) then return end
    hook.Remove("Think", "eP:doLogging")
    doshit()
end)
--PATH addons/eprotect_1.4.22/lua/e_protect/languages/sh_german.lua:
if CLIENT then
    slib.setLang("eprotect", "de", "sc-preview", "Screenshot Vorschau - ")
    slib.setLang("eprotect", "de", "net-info", "Net Info - ")
    slib.setLang("eprotect", "de", "ip-info", "IP Info - ")
    slib.setLang("eprotect", "de", "id-info", "ID Info - ")
    slib.setLang("eprotect", "de", "ip-correlation", "IP Korrelation - ")
    slib.setLang("eprotect", "de", "table-viewer", "Tabellenbetrachtung")

    slib.setLang("eprotect", "de", "tab-general", "Generell")
    slib.setLang("eprotect", "de", "tab-identifier", "Kennung")
    slib.setLang("eprotect", "de", "tab-netlimiter", "Net-Begrenzer")
    slib.setLang("eprotect", "de", "tab-netlogger", "Net Logger")
    slib.setLang("eprotect", "de", "tab-exploitpatcher", "Exploit Patcher")
    slib.setLang("eprotect", "de", "tab-exploitfinder", "Exploit Finder")
    slib.setLang("eprotect", "de", "tab-fakeexploits", "Fake Exploits")
    slib.setLang("eprotect", "de", "tab-datasnooper", "Datenschnüffler")

    slib.setLang("eprotect", "de", "player-list", "Spielerliste")

    slib.setLang("eprotect", "de", "ratelimit", "Bewertungslimit")
    slib.setLang("eprotect", "de", "ratelimit-tooltip", "Dies ist ein allgemeines Bewertungslimit und wird durch bestimmte festgelegte Grenzwerte außer Kraft gesetzt. (Xs / Y)")

    slib.setLang("eprotect", "de", "timeout", "Timeout")
    slib.setLang("eprotect", "de", "timeout-tooltip", "Dies ist das Zeitlimit, das den Bewertungslimit-Zähler zurückgesetzt.")

    slib.setLang("eprotect", "de", "overflowpunishment", "Overflow Bestrafung")
    slib.setLang("eprotect", "de", "overflowpunishment-tooltip", "Dies ist die Bestrafung, wenn der Network Way des Spielers zu lang ist. (1 = Kick, 2 = Bann)")

    slib.setLang("eprotect", "de", "enable-networking", "Aktiviere Networking")
    slib.setLang("eprotect", "de", "disable-networking", "Deaktiviere Networking")

    slib.setLang("eprotect", "de", "disable-all-networking", "Deaktiviert serverweit Networking")
    slib.setLang("eprotect", "de", "disable-all-networking-tooltip", "Wenn dies aktiviert ist, kann niemand mit dme Server networken.")

    slib.setLang("eprotect", "de", "player", "Spieler")
    slib.setLang("eprotect", "de", "net-string", "Net String")
    slib.setLang("eprotect", "de", "called", "Aufgerufen")
    slib.setLang("eprotect", "de", "len", "Len")
    slib.setLang("eprotect", "de", "type", "Typ")
    slib.setLang("eprotect", "de", "activated", "Aktiviert")
    slib.setLang("eprotect", "de", "secure", "Gesichert")
    slib.setLang("eprotect", "de", "ip", "IP Adresse")
    slib.setLang("eprotect", "de", "date", "Datum")
    slib.setLang("eprotect", "de", "country-code", "Landesvorwahl")
    slib.setLang("eprotect", "de", "status", "Status")

    slib.setLang("eprotect", "de", "unknown", "Unbekannt")
    slib.setLang("eprotect", "de", "secured", "Gesichert")

    slib.setLang("eprotect", "de", "check-ids", "Check ID(s)")
    slib.setLang("eprotect", "de", "correlate-ip", "Zusammenhängende IP(s)")
    slib.setLang("eprotect", "de", "family-share-check", "Prüfe Family Share")

    slib.setLang("eprotect", "de", "ply-sent-invalid-data", "Dieser Spieler hat ungültige Daten gesendet.")
    slib.setLang("eprotect", "de", "ply-failed-retrieving-data", "%s Daten konnten nicht abgerufen werden.")

    slib.setLang("eprotect", "de", "net-limit-desc", "Die Zahl hier gibt an, wie oft Personen pro Sekunde mit dem Server networken können, bevor die Rate begrenzt wird.")

    slib.setLang("eprotect", "de", "capture", "Screenshot")
    slib.setLang("eprotect", "de", "check-ips", "Prüfe IP(s)")
    slib.setLang("eprotect", "de", "fetch-data", "Daten abrufen")
elseif SERVER then
    slib.setLang("eprotect", "de", "invalid-player", "Dieser Spieler ist ungültig!")
    slib.setLang("eprotect", "de", "kick-net-overflow", "Du wurdest wegen Net-Overflow vom Server geworfen!")
    slib.setLang("eprotect", "de", "banned-net-overflow", "Du wurdest wegen Net-Overflow vom Server gebannt!")
    slib.setLang("eprotect", "de", "banned-net-exploitation", "Du wurdest wegen Net-Exploiting vom Server gebannt!")
    slib.setLang("eprotect", "de", "kick-malicious-intent", "Du wurdest wegen bösen Absichten vom Server geworfen!")
    slib.setLang("eprotect", "de", "banned-malicious-intent", "Du wurdest wegen bösen Absichten vom Server gebannt!")

    slib.setLang("eprotect", "de", "banned-exploit-attempt", "Du wurdest wegen versuchtem Exploiting gebannt!")

    slib.setLang("eprotect", "de", "sc-timeout", "Du musst %s Sekunden warten, bis du %s wieder screenshoten kannst!")
    slib.setLang("eprotect", "de", "sc-failed", "Screenshot von %s konnte nicht abgerufen werden, dies ist verdächtig!")

    slib.setLang("eprotect", "de", "has-family-share", "%s spielt über Family Sharing, SteamID64 des Besitzers ist: %s!")
    slib.setLang("eprotect", "de", "no-family-share", "%s spielt das Spiel nicht durch Family Sharing!")
    slib.setLang("eprotect", "de", "no-correlation", "Wir konnten keine IPs für %s korrelieren.")
end
--PATH addons/eprotect_1.4.22/lua/e_protect/languages/sh_russian.lua:
if CLIENT then
    slib.setLang("eprotect", "ru", "sc-preview", "Предпросмотр снимка экрана - ")
    slib.setLang("eprotect", "ru", "net-info", "Net Информация - ")
    slib.setLang("eprotect", "ru", "ip-info", "IP Информация - ")
    slib.setLang("eprotect", "ru", "id-info", "ID Информация - ")
    slib.setLang("eprotect", "ru", "ip-correlation", "IP Совпадение - ")
    slib.setLang("eprotect", "ru", "table-viewer", "Просмотр таблиц")

    slib.setLang("eprotect", "ru", "tab-general", "Главная")
    slib.setLang("eprotect", "ru", "tab-identifier", "Идентификатор")
    slib.setLang("eprotect", "ru", "tab-netlimiter", "Net Лимит")
    slib.setLang("eprotect", "ru", "tab-netlogger", "Net Регистратор")
    slib.setLang("eprotect", "ru", "tab-exploitpatcher", "Патчер эксплойтов")
    slib.setLang("eprotect", "ru", "tab-exploitfinder", "Поиск эксплойтов")
    slib.setLang("eprotect", "ru", "tab-fakeexploits", "Поддельные эксплойты")
    slib.setLang("eprotect", "ru", "tab-datasnooper", "Просмотр Data'ы игрока")

    slib.setLang("eprotect", "ru", "player-list", "Список игроков")

    slib.setLang("eprotect", "ru", "ratelimit", "Ограничение скорости оборотов")
    slib.setLang("eprotect", "ru", "ratelimit-tooltip", "Это общий предел скорости оборотов, который будет отменен конкретными установленными пределами. (Xs / Y)")

    slib.setLang("eprotect", "ru", "timeout", "Тайм-аут")
    slib.setLang("eprotect", "ru", "timeout-tooltip", "Это тайм-аут, который сбросит счетчик предельного числа оборотов..")
    
    slib.setLang("eprotect", "ru", "overflowpunishment", "Наказание за переполнение")
    slib.setLang("eprotect", "ru", "overflowpunishment-tooltip", "Если включено, то люди получат наказание за слишком большое количество трафика сети. (1 = Кик, 2 = Бан)")

    slib.setLang("eprotect", "ru", "enable-networking", "Включить сеть")
    slib.setLang("eprotect", "ru", "disable-networking", "Отключить сеть")

    slib.setLang("eprotect", "ru", "disable-all-networking", "Отключить все сети")
    slib.setLang("eprotect", "ru", "disable-all-networking-tooltip", "Если этот параметр включен, никто не сможет подключиться к серверу по сети!")

    slib.setLang("eprotect", "ru", "player", "Игрок")
    slib.setLang("eprotect", "ru", "net-string", "Net строка")
    slib.setLang("eprotect", "ru", "called", "Называется")
    slib.setLang("eprotect", "ru", "len", "Длина")
    slib.setLang("eprotect", "ru", "type", "Тип")
    slib.setLang("eprotect", "ru", "activated", "Активирована")
    slib.setLang("eprotect", "ru", "secure", "Защищена")
    slib.setLang("eprotect", "ru", "ip", "IP Адрес")
    slib.setLang("eprotect", "ru", "date", "Дата")
    slib.setLang("eprotect", "ru", "country-code", "Код страны")
    slib.setLang("eprotect", "ru", "status", "Статус")

    slib.setLang("eprotect", "ru", "unknown", "Неизвестно")
    slib.setLang("eprotect", "ru", "secured", "Защищена")

    slib.setLang("eprotect", "ru", "check-ids", "Проверить ID")
    slib.setLang("eprotect", "ru", "correlate-ip", "Соотнести IP")
    slib.setLang("eprotect", "ru", "family-share-check", "Проверить Семейный доступ")

    slib.setLang("eprotect", "ru", "ply-sent-invalid-data", "Этот игрок отправил неверные данные!")
    slib.setLang("eprotect", "ru", "ply-failed-retrieving-data", "%s не удалось получить данные!")

    slib.setLang("eprotect", "ru", "net-limit-desc", "Число здесь - это максимальное количество раз, которое люди могут отправить на сервер в секунду, прежде чем будут ограничены по частоте.")

    slib.setLang("eprotect", "ru", "capture", "Скриншот")
    slib.setLang("eprotect", "ru", "check-ips", "Проверить IP")
    slib.setLang("eprotect", "ru", "fetch-data", "Получить Data'у ")
elseif SERVER then
    slib.setLang("eprotect", "ru", "invalid-player", "Этот игрок недействителен!")
    slib.setLang("eprotect", "ru", "kick-net-overflow", "Вас выгнали за переполнение сети!")
    slib.setLang("eprotect", "ru", "banned-net-overflow", "Вас забанили за переполнение сети!")
    slib.setLang("eprotect", "ru", "banned-net-exploitation", "Вас забанили за эксплуатацию в сети!")
    slib.setLang("eprotect", "ru", "kick-malicious-intent", "Вас выгнали за злой умысел!")
    slib.setLang("eprotect", "ru", "banned-malicious-intent", "Вас забанили за злой умысел!")

    slib.setLang("eprotect", "ru", "banned-exploit-attempt", "Вас забанили за попытку использовать эксплоит!")

    slib.setLang("eprotect", "ru", "sc-timeout", "Вам нужно подождать %s секунд, пока вы снова не сможете сделать снимок экрана %s!")
    slib.setLang("eprotect", "ru", "sc-failed", "Не удалось получить снимок экрана %s, это подозрительно!")

    slib.setLang("eprotect", "ru", "has-family-share", "%s играет в игру через семейный ресурс, SteamID64 владельца %s!")
    slib.setLang("eprotect", "ru", "no-family-share", "%s не играет в игру через семейный просмотр.")
    slib.setLang("eprotect", "ru", "no-correlation", "Нам не удалось сопоставить IP-адреса для %s")
end
--PATH lua/autorun/sv_mas_fistsofreprisal_init.lua:
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

if (SERVER) then
	AddCSLuaFile( "autorun/sh_mas_fistsofreprisal_fonts.lua" )
	AddCSLuaFile( "autorun/cl_mas_fistsofreprisal_options.lua" )
	resource.AddWorkshop( "935300356" )
	
	local MaxHP = tobool( GetConVarNumber( "sk_mas_setmaxhealth_onspawn" ) )
	local LCNPC = tobool ( GetConVarNumber( "sk_mas_lagcompensate_npc" ) )
	
	if MaxHP then
		// Spawn Hook, Set Max HP
		local function spawn( ply )
			ply:SetMaxHealth( ply:Health() )
		end
		hook.Add( "PlayerSpawn", "Maranzo_PlySpawnHP", spawn )
	else
		hook.Remove( "PlayerSpawn", "Maranzo_PlySpawnHP" )
	end
	
	if LCNPC then
		// NPC Spawn Hook, Set Lag Compensation
		local function NPCspawn( ply, npc )
			npc:SetLagCompensated( true )
		end
		hook.Add( "PlayerSpawnedNPC", "Maranzo_PlySpawnNPCLag", NPCspawn )
	else
		hook.Remove( "PlayerSpawnedNPC", "Maranzo_PlySpawnNPCLag" ) 
	end
	
end // end If SERVER
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_base.lua:
local THEME = TalkModes.Client.ActiveTheme
local tblPages = {
    [1] = {
        strName = "General",
        strPanel = "TalkModes.GeneralSettings",
        strMat = Material("talkmodes/config.png")
    },
    [2] = {
        strName = "Modes",
        strPanel = "TalkModes.ModesSettings",
        strMat = Material("talkmodes/modes.png")
    },
    [3] = {
        strName = "Theme",
        strPanel = "TalkModes.ThemesSettings",
        strMat = Material("talkmodes/paint.png")
    }
}

local PANEL = {}
AccessorFunc(PANEL, "loaded_panel", "LoadedPanel")

function PANEL:Init()
    self:SetSize(ScrW()/2.5, ScrH()/2)
    self:Center()
    self:MakePopup()

    local intW, intH = self:GetWide(), self:GetTall()

    self.xBut = self:Add("DButton")
    self.xBut:SetSize(32, intH/12)
    self.xBut:SetText("✕")
    self.xBut:SetFont("TalkModes:Medium")
    self.xBut:SetPos(intW - 46, 0)
    self.xBut.Paint = nil
    self.xBut.Alpha = 120
    self.xBut.Think = function(self)
        self.Alpha = Lerp(FrameTime() * 8, self.Alpha, self:IsHovered() && 255 || 120)
        self:SetColor(Color(THEME["White"].r, THEME["White"].g, THEME["White"].b, self.Alpha))
    end
    self.xBut.DoClick = function()
        self:Close()
    end
    
    self.navbar = self:Add("TalkModes.Navbar")
    self.navbar:SetSize(intW/4)
    self.navbar:Dock(LEFT)
    self.navbar:DockMargin(0, intH/12, 0, 0)
    for _, v in ipairs(tblPages) do
        self.navbar:AddButton(v.strPanel, v.strMat, v.strName)
    end

    self.docker = self:Add("TalkModes.Docker")
    self.docker:Dock(FILL)
    self.docker:DockMargin(0, intH/12, 0, 0)
    self.docker:ChangePage("TalkModes.GeneralSettings")
end

function PANEL:Close()
    self:AlphaTo(0, 0.2, 0, function()
        self:Remove()
    end)
end

function PANEL:Paint(intW, intH)
    draw.RoundedBoxEx(8, 0, 0, intW, intH/12, THEME["Background"], true, true, false, false)
    draw.SimpleText("Talk Modes - Config", "TalkModes:Medium", 8, intH/12/2, THEME["White"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
vgui.Register("TalkModes.AdminMenu", PANEL, "EditablePanel")
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_settingsbase.lua:
local circles = include("talk_modes/vgui/libs/cl_circles.lua")
local THEME = TalkModes.Client.ActiveTheme
local SETTING_TYPES = {
    ["Language"] = "String",
    ["Selection Key"] = "UInt",
	["3D Voice"] = "Bool",
	["Talking Dead"] = "Bool",
    ["Selection Menu Position"] = "String",
    ["Auto-Hide"] = "Bool",
    ["Whisper"] = "UInt",
    ["Talk"] = "UInt",
    ["Yell"] = "UInt",
    ["White"] = "Color",
    ["Gray"] = "Color",
    ["Background"] = "Color",
    ["Foreground"] = "Color",
    ["Hover"] = "Color",
    ["Mode Change Message"] = "Bool"
}

local PANEL = {}
AccessorFunc(PANEL, "page_name", "PageName")
function PANEL:Init()
    self.tblSettings = {}
    self.docker = self:GetParent()
    self.base = self.docker:GetParent()

    self.scroll = self:Add("DScrollPanel")
    self.scroll:Dock(FILL)
    self.scroll:DockMargin(6, 6, 6, 0)
    self.scroll.Paint = function(this, intW, intH)
        draw.RoundedBox(2, 0, 0, intW, intH, THEME["Background"])
    end

    self.scroll.bar = self.scroll:GetVBar()
    self.scroll.bar:SetWidth(4)
    self.scroll.bar.Paint = function(this, intW, intH)
        draw.RoundedBox(2, 0, 0, intW, intH, THEME["Background"])
    end
    self.scroll.bar.btnGrip:SetCursor("Hand")
    self.scroll.bar.btnGrip.Paint = function(this, intW, intH)
        draw.RoundedBox(2, 0, 0, intW, intH, THEME["Hover"])
    end
    self.scroll.bar.btnUp.Paint = nil
    self.scroll.bar.btnDown.Paint = nil

    self.footer = self:Add("DPanel")
    self.footer:Dock(BOTTOM)
    self.footer:SetHeight(36)
    self.footer.Paint = function(self, intW, intH)
        draw.RoundedBoxEx(6, 0, 0, intW, intH, THEME["Background"], false, false, false, true)
    end

    self.save = self.footer:Add("DButton")
    self.save:SetSize(150, 28)
    self.save:SetText("")
    self.save.Alpha = 90
    self.save.Paint = function(self, intW, intH)
        self.Alpha = Lerp(FrameTime() * 8, self.Alpha, self:IsHovered() && 255 || 90)
        draw.RoundedBox(6, 0, 0, intW, intH, Color(39, 174, 96, self.Alpha))
        draw.SimpleText(string.upper(TalkModes.Languages:GetPhrase("Save")), "TalkModes:Small", intW/2, intH/2, THEME["White"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    self.save.DoClick = function()
        self.tblUpdatedSettings = {}
        self.tblUpdatedSettings[self:GetPageName()] = {}
        for k, v in SortedPairs(self.tblSettings) do 
            local child = v:GetChildren()[1]
            self.tblUpdatedSettings[self:GetPageName()][v.strSetting] = child:GetValue()
        end
        
        for i, v in SortedPairs(self.tblUpdatedSettings[self:GetPageName()]) do 
            net.Start("TalkModes.Config.UpdateSetting")
                net.WriteString(self:GetPageName()..":"..i)
                net["Write"..SETTING_TYPES[i]](v, 32)
            net.SendToServer()
        end
    end

    self.reset = self.footer:Add("DButton")
    self.reset:SetSize(150, 28)
    self.reset:SetText("")
    self.reset.Alpha = 90
    self.reset.Paint = function(self, intW, intH)
        self.Alpha = Lerp(FrameTime() * 8, self.Alpha, self:IsHovered() && 255 || 90)
        draw.RoundedBox(6, 0, 0, intW, intH, Color(243, 156, 18, self.Alpha))
        draw.SimpleText(string.upper(TalkModes.Languages:GetPhrase("Reset")), "TalkModes:Small", intW/2, intH/2, THEME["White"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    self.reset.DoClick = function()
        net.Start("TalkModes.Config.ResetSettings")
        net.SendToServer()
        self.base:Close()
    end
    
    self.footer.PerformLayout = function(this, intW, intH)
        self.reset:SetPos(intW/2 - self.reset:GetWide() - 2, 4)
        self.save:SetPos(intW/2 + 2, 4)
    end
end

function PANEL:Paint(intW, intH)
    draw.RoundedBoxEx(6, 0, 0, intW, intH, THEME["Foreground"], false, false, false, true)
end

function PANEL:RefreshSettings()
    if (self.tblSettings) then
        for _,v in SortedPairs(self.tblSettings) do
            v:Remove()
        end
    end
    self.tblSettings = {}

    self.tblServerSettings = {}
    for k, v in SortedPairs(TalkModes.Config:GetTable(self:GetPageName())) do
        self.tblServerSettings[k] = v
    end

    for a, b in SortedPairs(self.tblDefaultSettings) do
        for c, d in SortedPairs(self.tblServerSettings) do
            if (a == c) then
                self.tblDefaultSettings[a].uValue = d
            end
        end
    end
    for k, v in SortedPairs(self.tblDefaultSettings) do
        self:AddSetting(v.strType, k, v.strDesc, v.uValue, v.tblData)
    end
end

function PANEL:AddSetting(strType, strTitle, strDesc, uValue, tblData)
    self.settingsPanel = self.scroll:Add("EditablePanel")
    self.settingsPanel:Dock(TOP)
    self.settingsPanel:DockMargin(6, 6, 6, 0)
    self.settingsPanel:SetKeyboardInputEnabled(true)
    self.settingsPanel.strSetting = strTitle
    this = self.settingsPanel
    this.Paint = function(this, intW, intH)
        draw.RoundedBox(6, 0, 0, intW, intH, THEME["Foreground"])
        draw.SimpleText(TalkModes.Languages:GetPhrase(strTitle), "TalkModes:Medium", 6, 6, THEME["White"])
        local _, intH = surface.GetTextSize(TalkModes.Languages:GetPhrase(strTitle))
        draw.SimpleText(TalkModes.Languages:GetPhrase(strDesc), "TalkModes:Small", 6, 6 + intH, THEME["Gray"])
    end

    if (strType == "tText") then
        this:SetHeight(100)
        this.textEntry = this:Add("TalkModes.TextEntry")
        this.textEntry:SetPos(8, 100 - 32 - 6)
        this.textEntry:SetSize(128, 32)
        this.textEntry:SetValue(uValue)
    end

    if (strType == "tSwitch") then
        this:SetHeight(100)
        this.switch = this:Add("TalkModes.Switch")
        this.switch:SetPos(12, 100 - 6 - 32)
        this.switch:SetValue(uValue)
    end

    if (strType == "tColor") then
        this:SetHeight(125)
        this.colorPicker = this:Add("TalkModes.ColorPicker")
        this.colorPicker:Dock(FILL)
        this.colorPicker:SetValue(uValue)
        this.colorPicker:UpdateColors()
    end

    if (strType == "tDropdown") then
        this:SetHeight(100)
        this.dropdown = this:Add("TalkModes.Dropdown")
        this.dropdown:SetPos(8, 100 - 6 - 32)
        this.dropdown:SetValue(uValue)
        this.dropdown.intW, this.dropdown.intH = this.dropdown:GetContentSize()
        this.dropdown:SetSize(this.dropdown.intW + 24, this.dropdown.intH + 4)
        for k, _ in pairs(tblData) do
            this.dropdown:AddChoice(k, v)
        end
    end

    if (strType == "tBinder") then
        this:SetHeight(100)
        this.binder = this:Add("TalkModes.Binder")
        this.binder:SetSize(64, 24)
        this.binder:SetPos(8, 100 - 6 - 32)
        this.binder:SetValue(uValue)
    end
    
    if (strType == "tSlider") then
        this:SetHeight(100)
        this.slider = this:Add("TalkModes.PreviewSlider")
        this.slider:Dock(FILL)
        this.slider.slider:SetMinMax(0, 2000)
        this.slider:SetValue(uValue)
        this.slider:RefreshValue()
    end

    self.tblSettings[#self.tblSettings + 1] = this
end
vgui.Register("TalkModes.SettingsBase", PANEL, "EditablePanel")



--PATH addons/talk-modes/lua/talk_modes/vgui/libs/cl_spheres.lua:
local color_mask2 = Color(0, 0, 0, 0)

local function drawStencilSphere( pos, ref, compare_func, radius, color, detail )
    render.SetStencilReferenceValue( ref )
    render.SetStencilCompareFunction( compare_func )
    render.DrawSphere(pos, radius, detail, detail, color)
end

function render.StartWorldRings()
    render.WORLD_RINGS = {}
    cam.IgnoreZ(false)
    render.SetStencilEnable(true)
    render.SetStencilTestMask(255)
    render.SetStencilWriteMask(255)
    render.ClearStencil()
    render.SetColorMaterial()
end

function render.AddWorldRing(pos, radius, thicc, detail)
    detail = detail or 25
    thicc = thicc or 10
    local z = {detail=detail, thicc=thicc, pos=pos, outer_r=radius, inner_r=math.max(radius-thicc,0)}
    table.insert(render.WORLD_RINGS, z)
end

function render.FinishWorldRings(color)
    local ply = LocalPlayer()
    local zones = render.WORLD_RINGS
   
    render.SetStencilZFailOperation( STENCILOPERATION_REPLACE )
   
    for i, zone in ipairs(zones) do
        local outer_r = zone.radius
        drawStencilSphere(zone.pos, 1, STENCILCOMPARISONFUNCTION_ALWAYS, -zone.outer_r, color_mask2, zone.detail ) -- big, inside-out
    end
    render.SetStencilZFailOperation( STENCILOPERATION_DECR )
    for i, zone in ipairs(zones) do
        local outer_r = zone.radius
        drawStencilSphere(zone.pos, 1, STENCILCOMPARISONFUNCTION_ALWAYS, zone.outer_r, color_mask2, zone.detail ) -- big
    end
    render.SetStencilZFailOperation( STENCILOPERATION_INCR )
    for i, zone in ipairs(zones) do
        drawStencilSphere(zone.pos, 1, STENCILCOMPARISONFUNCTION_ALWAYS, -zone.inner_r, color_mask2, zone.detail ) -- small, inside-out
    end
    render.SetStencilZFailOperation( STENCILOPERATION_DECR )
    for i, zone in ipairs(zones) do
        drawStencilSphere(zone.pos, 1, STENCILCOMPARISONFUNCTION_ALWAYS, zone.inner_r, color_mask2, zone.detail ) -- small
    end
    render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
   
    local cam_pos = ply:EyePos()
    local cam_angle = ply:EyeAngles()
    local cam_normal = cam_angle:Forward()
    cam.IgnoreZ(true)
    render.SetStencilReferenceValue( 1 )
    render.DrawQuadEasy(cam_pos + cam_normal * 10, -cam_normal, 10000, 10000, color, cam_angle.roll)
    cam.IgnoreZ(false)
    render.SetStencilEnable(false)
end
--PATH addons/the_perfect_training_system/lua/diablos_training/init/sh_init.lua:
Diablos = Diablos or {}
Diablos.TS = Diablos.TS or {}
Diablos.TS.Entities = Diablos.TS.Entities or {}
Diablos.TS.Colors = Diablos.TS.Colors or {}
Diablos.TS.Joining = Diablos.TS.Joining or {}
Diablos.TS.Languages = Diablos.TS.Languages or {}
Diablos.TS.Languages.AvailableLanguages = Diablos.TS.Languages.AvailableLanguages or {}

Diablos.TS.Data = Diablos.TS.Data or {}
Diablos.TS.Parameters = Diablos.TS.Parameters or {}
Diablos.TS.CameraViews = true
Diablos.TS.CameraViewsPos = {
	["diablos_treadmill"] = 225,
	["diablos_dumbbell"] = 45,
}


Diablos.TS.DebugSupport = false -- !!! Set it to true if Diablos told you to do so. This will throw messages in server / client consoles. You need to set it back to false once your issue is being fixed. !!!


Diablos.TS.DebugDev = false -- !!!!! For Diablos only, don't touch this line !!!!!


Diablos.TS.Download = Diablos.TS.Download or {}
Diablos.TS.Strings = Diablos.TS.Strings or {}



Diablos.TS.Colors = {
	CurLevelBox = Color(65, 65, 65, 250),
	StaminaBar = Color(100, 100, 100, 255),

	-- Red light and basic red colors
	rl = Color(200, 100, 100, 200),
	r = Color(100, 40, 40, 100),

	-- Green light and basic green colors
	gl = Color(0, 200, 0, 200),
	g = Color(40, 100, 40, 100),

	-- Blue light colors (for mouse effect when hovering/clicking)
	bl = Color(100, 100, 200, 255),
	bl2 = Color(60, 60, 220, 100),
	bl3 = Color(40, 40, 240, 100),

	regular = Color(200, 200, 100, 255),

	-- Colors to draw on the panel ontop of the dumbbells
	drawColor = Color(40, 40, 40, 250),

	-- Colors applied on the panel when you're doing a training
	barBackground = Color(100, 100, 100, 250),
	barFill = Color(200, 200, 200, 240),

	-- Colors applied when hovering/selecting a proposal in the left menu for training & admin client panels
	navbarSelection = Color(220, 140, 18),
}

Diablos.TS.Materials = {
	home =  Material("diablos/tptsa/home.png", "smooth mips"),
	humanBody = Material("diablos/tptsa/human_body.png", "smooth mips"),
	humanBodyReliefStrength = Material("diablos/tptsa/human_body_relief_strength.png", "smooth mips"),
	humanBodyReliefStamina = Material("diablos/tptsa/human_body_relief_stamina.png", "smooth mips"),
	humanBodyReliefRunningSpeed = Material("diablos/tptsa/human_body_relief_runningspeed.png", "smooth mips"),
	humanBodyReliefAttackSpeed = Material("diablos/tptsa/human_body_relief_attackspeed.png", "smooth mips"),
	sub = Material("diablos/tptsa/sub.png", "smooth mips"),
	treadmill = Material("diablos/tptsa/treadmill.png", "smooth mips"),
	treadmillOrientation = Material("diablos/tptsa/treadmill_orientation.png", "smooth mips"),
	stamina = Material("diablos/tptsa/stamina.png", "smooth mips"),
	runningSpeed = Material("diablos/tptsa/running_speed.png", "smooth mips"),
	strength = Material("diablos/tptsa/strength.png", "smooth mips"),
	attackSpeed = Material("diablos/tptsa/punching_ball.png", "smooth mips"),

	downKey = Material("diablos/tptsa/down_key.png", "smooth mips"),
	circle = Material("diablos/tptsa/circle.png", "smooth mips"),
	dumbbellBackground = Material("diablos/tptsa/dumbbell_background.png", "smooth mips"),
	close = Material("diablos/tptsa/close.png", "smooth mips"),
	checked = Material("diablos/tptsa/checked.png", "smooth mips"),

	sportbadgeRecto = Material("diablos/tptsa/sportbadge_recto.png", "smooth mips"),
	sportbadgeVerso = Material("diablos/tptsa/sportbadge_verso.png", "smooth mips"),

	zero = Material("diablos/tptsa/zero.png", "smooth mips"),
	one = Material("diablos/tptsa/one.png", "smooth mips"),
	rightArrow = Material("diablos/tptsa/right_arrow.png", "smooth"),
	price = Material("diablos/tptsa/price.png", "smooth mips"),
}


/* Sounds */

sound.Add(
	{
		name = "Diablos:Sound:TS:Correct",
		channel = CHAN_STATIC,
		volume = 1.0,
		level = 80,
		pitch = 100,
		sound = "tptsa/correct.wav" -- taken at https://www.youtube.com/watch?v=KDGq81bDclE
	}
)

sound.Add(
	{
		name = "Diablos:Sound:TS:Incorrect",
		channel = CHAN_STATIC,
		volume = 1.0,
		level = 80,
		pitch = 100,
		sound = "tptsa/incorrect.wav" -- taken at https://www.youtube.com/watch?v=PdNb0r_n2mo
	}
)

/*---------------------------------------------------------------------------
	Write a message (msg) to the console, with a color depending on the type of the message (typeMsg)
---------------------------------------------------------------------------*/

function Diablos.TS:ConsoleMsg(typeMsg, msg)
	local col
	if typeMsg == 0 then
		col = Diablos.TS.Colors.gl
	elseif typeMsg == 1 then
		col = Diablos.TS.Colors.rl
	elseif typeMsg == 2 then
		col = Diablos.TS.Colors.regular
	end

	MsgC(col, "[Training System] " .. msg .. "\n")
end

/*---------------------------------------------------------------------------
	Call Diablos.TS:ConsoleMsg above if we are in debug mode
---------------------------------------------------------------------------*/

function Diablos.TS:DebugConsoleMsg(typeMsg, msg)
	if Diablos.TS.DebugSupport then
		Diablos.TS:ConsoleMsg(typeMsg, msg)
	end
end

/*---------------------------------------------------------------------------
	Set the current language used
---------------------------------------------------------------------------*/

function Diablos.TS:UpdateCurrentLanguage()
	Diablos.TS.Languages.CurrentLanguage = ""
	local languageName = Diablos.TS.Language
	languageName = string.lower(languageName)
	if not Diablos.TS.Languages.AvailableLanguages[languageName] then
		Diablos.TS:ConsoleMsg(2, "Language entered is incorrect; back to English language.")
		languageName = "english"
	end
	if languageName != Diablos.TS.Languages.CurrentLanguage then
		Diablos.TS.Strings = Diablos.TS.Languages.AvailableLanguages[languageName]
		Diablos.TS.Languages.CurrentLanguage = languageName
	end
end

/*---------------------------------------------------------------------------
	Retrieve the languages used
---------------------------------------------------------------------------*/

hook.Add("gmodstore:UpdateAddon", "TPTSA:UpdateLanguage", function(ID, variables)
	if ID == "736838731494260737" then
		Diablos.TS:UpdateCurrentLanguage()
	end
end)
--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_english.lua:
Diablos.TS.Languages.AvailableLanguages["english"] = {

	-- Global data
	lbs = "lbs",
	kg = "kg",
	yes = "YES",
	no = "NO",
	andStr = "and",
	active = "ACTIVE",
	training = "TRAINING",
	beginning = "Beginning:",
	ending = "End:",
	leaveTraining = "Leave the training:",
	second = "second",
	seconds = "seconds",
	minute = "minute",
	minutes = "minutes",
	hour = "hour",
	hours = "hours",
	day = "day",
	days = "days",
	week = "week",
	weeks = "weeks",
	month = "month",
	months = "months",
	year = "year",
	years = "years",
	key = "key",
	keys = "keys",
	free = "FREE",

	-- Home tips
	home = "Home",
	trainingStatistics = "TRAINING STATISTICS",
	levelProgression = "Level progression",
	captionFine = "Muscle break",
	captionShouldTrain = "Should train",
	captionMuscleLoss = "Loss of muscle",
	staminaBenefit = "Speed duration",
	staminaMuscle = "Thigh",
	runningspeedBenefit = "Max running speed",
	runningspeedMuscle = "Calf",
	strengthBenefit = "Strength damage",
	strengthMuscle = "Shoulder, Trapezius & Upperarm",
	attackspeedBenefit = "Attack speed",
	attackspeedMuscle = "Forearm",

	-- Personal statistics

	currentLevel = "Level %u",
	xpPoint = "XP: %u",

	-- Global statistics

	globalStatistics = "Global statistics",
	onlineStatistics = "Statistics for online players",
	updateSelection = "UPDATE (%u selected)",
	resetPlayerData = "RESET PLAYER DATA",
	resetEntityData = "RESET ENTITY DATA",
	peopleSelected = "People selected: %s",
	peopleSelectedTip = "You can set some training parameters to apply to people you selected",


	-- Training times part

	trainingTimes = "TRAINING TIMES",
	trainingAdv = "You sometimes need to take a muscle rest. However, waiting too much time will induct a muscle loss.",
	muscleRest = "Muscle rest",
	losingMuscle = "Losing muscle",
	waitUntil = "You should wait until",
	secondsRemaining = "%d seconds remaining",
	needTrainBeforeLosingMuscle = "You need to train before:",
	neverTrained = "Never trained",
	freeToWorkout = "You are free to workout this muscle!",
	currentlyLosing = "You are currently losing muscle!",
	yourChoice = "Your choice",
	trainNow = "Start the training",


	-- XP/Level table

	levels = "Levels",
	level = "Level",
	xp = "XP",
	percentage = "Percentage",
	undefined = "Undefined",
	lastTraining = "Last training",

	-- Global trainings

	trainingWillBegin = "The training will begin in %u seconds",
	trainingEndsIn = "The training ends in %u seconds",
	currentlyUsingMachine = "Someone is currently using the machine",
	leftMachine = "You left the training. You can try again from now!",
	farFromMachine = "You are too far from a machine to train!",
	notAllowedJob = "Your job does not allow you to train!",

	-- Admin data

	setTo = "Set %s to",
	confirmationBox = "CONFIRMATION BOX",
	areYouSure = "Are you sure you want to do that ?",

	-- Weigh balance data


	weighBalanceUse = "Press USE to get information",
	weighBalanceCantSee = "Statistics are confidential",
	weighBalanceTipL1 = "PLEASE STEP",
	weighBalanceTipL2 = "ON THE BALANCE",
	weighBalanceTipL3 = "TO HAVE STATISTICS",

	-- Turnstile data

	turnstileNeedBadge = "You need to use your badge to access here!",

	-- Badge data

	activebadge = "Active badge",
	neverSubscribed = "Never subscribed",
	badgeSubscription = "Badge subscription",
	expirationDate = "Expiration date",
	expired = "Expired",
	previousSub = "Previous subscription",

	-- Stamina data

	stamina = "Stamina",
	runSpeed = "Run speed",
	timeMaxSpeed = "Top speed time",

	-- Running speed data

	runningspeed = "Running speed",

	-- Treadmill data

	treadmillDrawLeft = "%u seconds left",
	treadmillDrawSomeone = "Someone is training!",
	treadmillDrawCanUse = "FREE-TO-USE",
	treadmillCurSpeed = "Current speed",
	treadmillFrameTitle = "TREADMILL",
	treadmillChooseExerciceTip1 = "Hammer the forward key to increase your speed",
	treadmillChooseExerciceTip2 = "Points you earn depend on the speed you're running at at the end",
	quickExerciceSpeed = "Quick exercice based on speed",
	longExerciceStamina = "Long exercice based on stamina",
	runningTime = "Running time",
	increaseSpeed = "Increase speed",
	decreaseSpeed = "Decrease speed",
	needFasterTreadmill = "You need to be faster when pressing/releasing the FORWARD key",

	-- Strength data

	strength = "Strength",

	-- Dumbbell data

	dumbbellDraw = "Dumbbell",
	dumbbellFrameTitle = "DUMBBELL",
	dumbbellChooseExerciceTip1 = "Press the right keys at the right time",
	dumbbellChooseExerciceTip2 = "Points you earn depend on the ratio of keys pressed at the right time",

	-- Attack speed data

	attackspeed = "Attack speed",

	-- Punching ball data

	punchingHitDamage = "%u red points hit",
	punchingFrameTitle = "PUNCHING BALL",
	punchingChooseExerciceTip1 = "Hit the punching-ball red points",
	punchingChooseExerciceTip2 = "Points you earn depend on the amount of red points you hit using your fists",

	-- Card reader data

	cardReaderTitle = "CARD READER",
	approachBadge = "You need to approach your sport badge to use the terminal!",
	becomeOwner = "You became the owner of the terminal!",
	someoneElseOwner = "Someone else is already a owner of this terminal",

	cardReaderOwnerAdd = "ADD",
	cardReaderOwnerRemove = "REMOVE",
	cardReaderApply = "APPLY CHANGES",
	cardReaderBadgePrice = "Badge price",
	cardReaderPurchaseSub = "PURCHASE A SUB",
	cardReaderPurchaseSubTip1 = "A subscription allows you to use your badge on the turnstiles",
	cardReaderFullyRecharged = "Your subscription is already fully recharged! Expires at %s",

	cardReaderGiveCredit = "GIVE A CREDIT",
	cardReaderGiveCreditTip1 = "You are about to give a credit to the player in front of you",
	cardReaderGiveCreditTip2 = "This will allow him to access a turnstile once",
	cardReaderGiveCreditBtn = "GIVE CREDIT",
	cardReaderGiveAlreadyCredit = "You can't give a credit to someone who has already one!",
	cardReaderGiveAlreadySubscribed = "You can't give a credit to someone who has already a valid subscription!",


	cardReaderEditTerminal = "EDIT THE TERMINAL",
	cardReaderEditTerminalTip1 = "You can change some parameters of the terminal as the subscription price/co-owner",
	cardReaderEditTerminalTip2 = "Co-owners are here to share the money you receive from subscriptions",
	cardReaderEditTerminalSetPrice = "The price can be set from %s to %s",


	-- Notify player

	alreadyTrained = "You recently made a training of these muscles, please come back in %s",
	needMoreLevel = "You need to be atleast level %u to use this!",
	tooEasy = "This machine is too easy for your level!",
	endTraining = "The training has ended",
	xpAdded = "You won %u points!",
	newLevel = "You are now level %u!",
	lossOfTraining = "You lose some muscle due to a loss of training for this type of training: %s",
	sportBadgeVerified = "Your sub has been verified",
	sportBadgeInvalid = "Your sub is invalid",
	subDataUpdated = "You updated badge sub data!",
	subPurchased = "You received %s because %s purchased a sub!",
	subRenewed = "You have renewed your sub!",
	subNotEnoughMoney = "You don't have enough money to purchase a sub!",
	creditGiven = "You gave a credit!",
	creditReceived = "You received a credit!",
	entitiesUpdated = "Training entity data have been updated!",
	entitiesRemoved = "The entities have been removed and the data erased!",
	playerDataRemoved = "The database of the players has been erased!",
	playerDataUpdated = "Data updated with your value!",

}
--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_polish.lua:
Diablos.TS.Languages.AvailableLanguages["polish"] = {

	-- Global data
	lbs = "funty",
	kg = "kg",
	yes = "TAK",
	no = "NIE",
	andStr = "oraz",
	active = "AKTYWNE",
	training = "TRENING",
	beginning = "Poczatek:",
	ending = "Koniec:",
	leaveTraining = "Przerwij trening:",
	second = "sekunda",
	seconds = "sekund",
	minute = "minuta",
	minutes = "minut",
	hour = "godzina",
	hours = "godzin",
	day = "dzien",
	days = "dni",
	week = "tydzien",
	weeks = "tygodnie",
	month = "miesiac",
	months = "miesiace",
	year = "rok",
	years = "lata",
	key = "klawisz",
	keys = "klawisze",
	free = "DARMOWE",

	-- Home tips
	home = "Strona domowa",
	trainingStatistics = "STATYSTYKI TRENINGU",
	levelProgression = "POSTEP",
	captionFine = "Przyrost miesni",
	captionShouldTrain = "Zacznij trenowac",
	captionMuscleLoss = "Utrata miesni",
	staminaBenefit = "Czas trwania",
	staminaMuscle = "Udo",
	runningspeedBenefit = "Max predkosc biegu",
	runningspeedMuscle = "Lydka",
	strengthBenefit = "Sila",
	strengthMuscle = "Ramiona, Biceps & Triceps",
	attackspeedBenefit = "Predkosc ataku",
	attackspeedMuscle = "Przedramie",

	-- Personal statistics

	currentLevel = "Poziom %u",
	xpPoint = "PD: %u",

	-- Global statistics

	globalStatistics = "Statystyki globalne",
	onlineStatistics = "Statystyki dla graczy online",
	updateSelection = "AKTUALIZACJA (%u selected)",
	resetPlayerData = "ZRESETUJ DANE GRACZA",
	resetEntityData = "RESETUJ DANE PODMIOTOW",
	peopleSelected = "Wybrane osoby: %s",
	peopleSelectedTip = "Mozesz ustawic niektore parametry treningu, aby zastosowac je do wybranych osob",


	-- Training times part

	trainingTimes = "GODZINY TRENINGU",
	trainingAdv = "Czasami trzeba dac odpoczac miesniom. Jednak zbyt dlugie czekanie spowoduje ich utrate",
	muscleRest = "Odpoczynek miesni",
	losingMuscle = "Utrata miesni",
	waitUntil = "Powinienes poczekac do",
	secondsRemaining = "%d pozostalych sekund",
	needTrainBeforeLosingMuscle = "Zrob trening przed:",
	neverTrained = "Nigdy nie trenowano:",
	freeToWorkout = "Mozesz cwiczyc ten miesien!",
	currentlyLosing = "Obecnie tracisz miesnie!",
	yourChoice = "Twoj wybor",
	trainNow = "Rozpocznij trening",


	-- XP/Level table

	levels = "Poziomy",
	level = "Poziom",
	xp = "PD",
	percentage = "Protentowo",
	undefined = "Nieokreslony",
	lastTraining = "Ostatni trening",

	-- Global trainings

	trainingWillBegin = "Trening rozpocznie sie za %u sekund",
	trainingEndsIn = "Trening konczy sie za %u sekund",
	currentlyUsingMachine = "Ktos obecnie z tego korzysta",
	leftMachine = "Opusciles trening. Mozesz sprobowac ponownie od teraz!",
	farFromMachine = "Jestes za daleko od maszyny, aby trenowac!",
	notAllowedJob = "Twoja praca nie pozwala Ci rozpoczac treningu!",

	-- Admin data

	setTo = "Ustaw %s do",
	confirmationBox = "POLE POTWIERDZENIA",
	areYouSure = "Czy na pewno chcesz to zrobić?",

	-- Weigh balance data


	weighBalanceUse = "Nacisnij USE, aby uzyskac informacje",
	weighBalanceCantSee = "Statystyki są poufne",
	weighBalanceTipL1 = "PROSZE O KROK",
	weighBalanceTipL2 = "NA WAGE",
	weighBalanceTipL3 = "ABY UZYSKAC STATYSTKI",

	-- Turnstile data

	turnstileNeedBadge = "Potrzebujesz karnetu na te silownie!",

	-- Badge data

	activebadge = "Aktywne karnety",
	neverSubscribed = "Nigdy niesubskrybował",
	badgeSubscription = "Subskrypcja",
	expirationDate = "Data wygasniecia",
	expired = "Wygaslo",
	previousSub = "Poprzedni karnet",

	-- Stamina data

	stamina = "Wytrzymalosc",
	runSpeed = "Predkosc biegu",
	timeMaxSpeed = "Czas MAX predkosci",

	-- Running speed data

	runningspeed = "Predkosc biegu",

	-- Treadmill data

	treadmillDrawLeft = "%u pozostało sekund",
	treadmillDrawSomeone = "Ktos trenuje!",
	treadmillDrawCanUse = "BEZPLATNE W UZYCIU",
	treadmillCurSpeed = "Obecna predkosc",
	treadmillFrameTitle = "BIEZNIA",
	treadmillChooseExerciceTip1 = "Klikaj klawisz DO PRZODU aby zwiekszyc predkosc",
	treadmillChooseExerciceTip2 = "Ilosc przydzielonych punktow zalezy od koncowej predkosci",
	quickExerciceSpeed = "Szybki trening oparty na szybkosci",
	longExerciceStamina = "Dlugi trening oparty na wytrzymalosci",
	runningTime = "Czas trwania",
	increaseSpeed = "Zwieksz predkosc",
	decreaseSpeed = "Zmniejsz predkosc",
	needFasterTreadmill = "Musisz szybciej klikac klawisz DO PRZODU",

	-- Strength data

	strength = "Sila",

	-- Dumbbell data

	dumbbellDraw = "Hantle",
	dumbbellFrameTitle = "HANTLE",
	dumbbellChooseExerciceTip1 = "Nacisnij odpowiedni klawisz we wlasciwym czasie",
	dumbbellChooseExerciceTip2 = "Zdobyte punkty zaleza od ilosci Twoich pomylek",

	-- Attack speed data

	attackspeed = "Predkosc ataku",

	-- Punching ball data

	punchingHitDamage = "%u czerwone punkty trafione",
	punchingFrameTitle = "WOREK TRENINGOWY",
	punchingChooseExerciceTip1 = "Uderzaj w czerwone punkty na worku",
	punchingChooseExerciceTip2 = "Zdobyte punkty zaleza od ilosci czerwonych punktow, ktore trafisz piesciami",

	-- Card reader data

	cardReaderTitle = "CZYTNIK KART",
	approachBadge = "Musisz zblizyc swoja karte aby moc uzywac biezni!",
	becomeOwner = "Zostales wlascicielem terminala",
	someoneElseOwner = "Ktos inny posiada ten terminal",

	cardReaderOwnerAdd = "DODAJ",
	cardReaderOwnerRemove = "USUN",
	cardReaderApply = "ZATWIERDZ ZMIANY",
	cardReaderBadgePrice = "Cena karnetu",
	cardReaderPurchaseSub = "ZAKUP KARNET",
	cardReaderPurchaseSubTip1 = "Subskrypcja umozliwia przejscie przez bramke",
	cardReaderFullyRecharged = "Twoja subskrypcja jest w pelni naladowana! Wygasa w %s",

	cardReaderGiveCredit = "DARMOWA WEJSCIOWKA",
	cardReaderGiveCreditTip1 = "Zaraz udzielisz kredytu graczowi przed tobą",
	cardReaderGiveCreditTip2 = "Umozliwi mu to jednorazowe wejscie",
	cardReaderGiveCreditBtn = "DAJ WEJSCIE",
	cardReaderGiveAlreadyCredit = "Nie mozesz przyznac wejsciowki osobie ktora juz ja posiada!",
	cardReaderGiveAlreadySubscribed = "Nie mozezsz przyznac wejsciowki osobie z waznym karnetem!",


	cardReaderEditTerminal = "EDYTUJ TERMINAL",
	cardReaderEditTerminalTip1 = "Mozesz zmienic parametry terminala takie jak cena karnetu/Wspolwlasciciele",
	cardReaderEditTerminalTip2 = "Wspolwlasciciele otrzymaja czesc pieniedzy z karnetow",
	cardReaderEditTerminalSetPrice = "Cene mozna ustawic od %s do %s",


	-- Notify player

	alreadyTrained = "Niedawno trenowales te miesnie, wroc za %s",
	needMoreLevel = "Aby tego uzyc, musisz miec co najmniej %u poziom!",
	tooEasy = "Ta maszyna jest za slaba na Twoj poziom!",
	endTraining = "Trening zakonczony",
	xpAdded = "Wygrales %u punktow!",
	newLevel = "Jestes teraz na poziomie %u!",
	lossOfTraining = "Utraciles doswiadczenie w treningu: %s",
	sportBadgeVerified = "Twoja subskrypcja zostala zweryfikowana",
	sportBadgeInvalid = "Odmowa dostepu",
	subDataUpdated = "Zwiekszyles okres karnetu!",
	subPurchased = "Otrzymales %s, poniewaz %s kupil subskrypcję!",
	subRenewed = "Odnowiles swoj karnet!",
	subNotEnoughMoney = "Nie masz kasy na zakup karnetu!",
	creditGiven = "Udzieliles darmowego wejscia!",
	creditReceived = "Otrzymales darmowe wejscie!",
	entitiesUpdated = "Dane jednostki szkoleniowej zostaly zaktualizowane!",
	entitiesRemoved = "Podmioty zostaly usuniete, a dane skasowane!",
	playerDataRemoved = "Baza danych graczy zostala usunieta!",
	playerDataUpdated = "Dane zostaly zaktualizowane!",

}
--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_turkish.lua:
Diablos.TS.Languages.AvailableLanguages["turkish"] = {

	-- Global data
	lbs = "lbs",
	kg = "kg",
	yes = "EVET",
	no = "HAYIR",
	andStr = "ve",
	active = "AKTIF",
	training = "ANTRENMAN",
	beginning = "Başlangıç:",
	ending = "Bitiş:",
	leaveTraining = "Antrenmandan ayrıl:",
	second = "saniye",
	seconds = "saniyeler",
	minute = "dakika",
	minutes = "dakikalar",
	hour = "saat",
	hours = "saatler",
	day = "gün",
	days = "günler",
	week = "hafta",
	weeks = "haftalar",
	month = "ay",
	months = "aylar",
	year = "yıl",
	years = "yıllar",
	key = "anahtar",
	keys = "anahtarlar",
	free = "BEDAVA",

	-- Home tips
	home = "Ana menü",
	trainingStatistics = "ANTRENMAN ISTATISTIKLERI",
	levelProgression = "Seviye ilerlemesi",
	captionFine = "Kas gelişimi",
	captionShouldTrain = "Geliştirilmeli",
	captionMuscleLoss = "Kas kaybı",
	staminaBenefit = "Hız süresi",
	staminaMuscle = "Kalça",
	runningspeedBenefit = "Maks koşma hızı",
	runningspeedMuscle = "Baldır",
	strengthBenefit = "Güç hasarı",
	strengthMuscle = "Omuz, Trapez ve Üst Kol",
	attackspeedBenefit = "Atak hızı",
	attackspeedMuscle = "Kolun ön kısmı",

	-- Personal statistics

	currentLevel = "%u Seviye",
	xpPoint = "XP: %u",

	-- Global statistics

	globalStatistics = "Genel istatistikler",
	onlineStatistics = "Aktif oyuncuların istatistikleri",
	updateSelection = "GÜNCEL VERILER (%u seçildi)",
	resetPlayerData = "OYUNCU VERİLERİNİ SIFIRLA",
	resetEntityData = "VARLIK VERİLERİNİ SIFIRLA",
	peopleSelected = "Seçilen kişiler: %s",
	peopleSelectedTip = "Seçtiğiniz kişilere uygulanacak bazı eğitim parametreleri belirleyebilirsiniz.",


	-- Training times part

	trainingTimes = "ANTRENMAN ZAMANLARI",
	trainingAdv = "Bazen kaslarınızı dinlendirmeniz gerekir. Ancak çok fazla dinlendirmek kas kaybına neden olacaktır.",
	muscleRest = "Kas dinlendirme",
	losingMuscle = "Kas kaybı",
	waitUntil = "Kadar beklemelisin",
	secondsRemaining = "%d saniye kaldı",
	needTrainBeforeLosingMuscle = "Önce bu antrenmanı yapmanız lazım:",
	neverTrained = "Hiç eğitim almamış",
	freeToWorkout = "Bu kası çalıştırmakta özgürsünüz!",
	currentlyLosing = "Şu anda kas kaybediyorsunuz!",
	yourChoice = "Seçimin",
	trainNow = "Antrenmana başla",


	-- XP/Level table

	levels = "Seviyeler",
	level = "Seviye",
	xp = "XP",
	percentage = "Yüzde",
	undefined = "Belirsiz",
	lastTraining = "Son antrenman",

	-- Global trainings

	trainingWillBegin = "Eğitim %u saniye içinde başlayacak",
	trainingEndsIn = "Eğitim %u saniye içinde bitecek",
	currentlyUsingMachine = "Birisi şu anda bu makineyi kullanıyor",
	leftMachine = "Antrenmandan ayrıldın. İstediğin zaman tekrar deneyebilirsin!",
	farFromMachine = "Antrenman yapmak için makineden çok uzaktasın!",
	notAllowedJob = "İşiniz antrenman yapmanıza izin vermiyor!",

	-- Admin data

	setTo = "%s olarak ayarla",
	confirmationBox = "ONAY KUTUSU",
	areYouSure = "Bunu yapmak istediğinizden emin misiniz ?",

	-- Weigh balance data


	weighBalanceUse = "Bilgi almak için KULLAN'a basın",
	weighBalanceCantSee = "İstatistikler gizlidir",
	weighBalanceTipL1 = "İSTATİSTİKLERE SAHİP OLMAK İÇİN",
	weighBalanceTipL2 = "LÜTFEN TARTIYA",
	weighBalanceTipL3 = "ADIM ATINIZ",

	-- Turnstile data

	turnstileNeedBadge = "Buraya erişmek için rozetinizi kullanmanız gerekiyor!",

	-- Badge data

	activebadge = "Aktif rozet",
	neverSubscribed = "Hiç abone olmadım",
	badgeSubscription = "Rozet aboneliği",
	expirationDate = "Son kullanma tarihi",
	expired = "Süresi doldu",
	previousSub = "Önceki abonelik",

	-- Stamina data

	stamina = "Dayanıklılık",
	runSpeed = "Koşma hızı",
	timeMaxSpeed = "En yüksek hız süresi",

	-- Running speed data

	runningspeed = "Koşma hızı",

	-- Treadmill data

	treadmillDrawLeft = "%u saniye kaldı",
	treadmillDrawSomeone = "Biri antrenman yapıyor!",
	treadmillDrawCanUse = "ÜCRETSİZ-KULLANIM",
	treadmillCurSpeed = "Geçerli hız",
	treadmillFrameTitle = "KOŞU BANDI",
	treadmillChooseExerciceTip1 = "Hızınızı artırmak için ileri tuşuna basın",
	treadmillChooseExerciceTip2 = "Kazandığınız puanlar, sonunda koştuğunuz hıza bağlıdır.",
	quickExerciceSpeed = "Hıza dayalı hızlı egzersiz",
	longExerciceStamina = "Dayanıklılığa dayalı uzun egzersiz",
	runningTime = "Çalışma süresi",
	increaseSpeed = "Hızı arttır",
	decreaseSpeed = "Hızı azalt",
	needFasterTreadmill = "İLERİ tuşuna basarken/bırakırken daha hızlı olmanız gerekir",

	-- Strength data

	strength = "Kuvvet",

	-- Dumbbell data

	dumbbellDraw = "Dumbbell",
	dumbbellFrameTitle = "DUMBBELL",
	dumbbellChooseExerciceTip1 = "Doğru zamanda doğru tuşlara basın",
	dumbbellChooseExerciceTip2 = "Kazandığınız puanlar, doğru zamanda basılan tuşların oranına bağlıdır.",

	-- Attack speed data

	attackspeed = "Atak hızı",

	-- Punching ball data

	punchingHitDamage = "%u kırmızı nokta isabet etti",
	punchingFrameTitle = "YUMRUK TOPU",
	punchingChooseExerciceTip1 = "Yumruk topunun kırmızı noktalarına vur",
	punchingChooseExerciceTip2 = "Kazandığınız puanlar, yumruklarınızı kullanarak vurduğunuz kırmızı puanların miktarına bağlıdır.",

	-- Card reader data

	cardReaderTitle = "KART OKUYUCU",
	approachBadge = "Terminali kullanmak için spor rozetinize yaklaşmanız gerekiyor!",
	becomeOwner = "Terminalin sahibi oldunuz!",
	someoneElseOwner = "Başka biri zaten bu terminalin sahibi",

	cardReaderOwnerAdd = "EKLE",
	cardReaderOwnerRemove = "KALDIR",
	cardReaderApply = "DEĞİŞİKLİKLERİ UYGULA",
	cardReaderBadgePrice = "Rozet fiyatı",
	cardReaderPurchaseSub = "ABONELİK SATIN AL",
	cardReaderPurchaseSubTip1 = "Bir abonelik, rozetinizi turnikelerde kullanmanızı sağlar.",
	cardReaderFullyRecharged = "Aboneliğiniz zaten tamamen yenilendi! %s tarihinde sona eriyor",

	cardReaderGiveCredit = "KREDİ VER",
	cardReaderGiveCreditTip1 = "Önünüzdeki oyuncuya kredi vermek üzeresiniz",
	cardReaderGiveCreditTip2 = "Bu, bir kez turnikeye erişmesine izin verecek",
	cardReaderGiveCreditBtn = "KREDİ VER",
	cardReaderGiveAlreadyCredit = "Zaten sahip olan birine kredi veremezsiniz!",
	cardReaderGiveAlreadySubscribed = "Halihazırda geçerli bir aboneliği olan birine kredi veremezsiniz!",


	cardReaderEditTerminal = "TERMİNALİ DÜZENLE",
	cardReaderEditTerminalTip1 = "Abonelik fiyatı/ortak sahip gibi terminalin bazı parametrelerini değiştirebilirsiniz.",
	cardReaderEditTerminalTip2 = "Ortak sahipler, aboneliklerden aldığınız parayı paylaşmak için buradalar",
	cardReaderEditTerminalSetPrice = "Fiyat %s ile %s arasında ayarlanabilir",


	-- Notify player

	alreadyTrained = "Yakın zamanda bu kasları çalıştırdınız, lütfen %s sonra tekrar gelin",
	needMoreLevel = "Bunu kullanmak için en az %u seviyesinde olmanız gerekir!",
	tooEasy = "Bu makine senin seviyen için çok kolay!",
	endTraining = "Antrenman sona erdi",
	xpAdded = "%u puan kazandınız!",
	newLevel = "Artık %u seviyesindesiniz!",
	lossOfTraining = "Bu tür bir antrenman için antrenman kaybı nedeniyle biraz kas kaybedersiniz: %s",
	sportBadgeVerified = "Aboneliğiniz doğrulandı",
	sportBadgeInvalid = "Aboneliğiniz geçersiz",
	subDataUpdated = "Rozet abonelik verilerini güncellediniz!",
	subPurchased = "%s abonelik satın aldığı için %s aldınız!",
	subRenewed = "Abonenizi yenilediniz!",
	subNotEnoughMoney = "Bir abonelik satın almak için yeterli paranız yok!",
	creditGiven = "Bir kredi verdiniz!",
	creditReceived = "Bir kredi aldınız!",
	entitiesUpdated = "Eğitim varlık verileri güncellendi!",
	entitiesRemoved = "Varlıklar kaldırıldı ve veriler silindi!",
	playerDataRemoved = "Oyuncuların veritabanı silindi!",
	playerDataUpdated = "Girdiğiniz değerlerle veriler güncellendi!",

}
--PATH lua/autorun/velyn_solo_leveling_arise.lua:
                                                                                                                                                                if SERVER then
	AddCSLuaFile()
end

local function AddPlayerModel( name, model )

	list.Set( "PlayerOptionsModel", name, model )
	player_manager.AddValidModel( name, model )
	
end



AddPlayerModel("Man_Solo_Leveling_Vaelyn_01", "models/vaelyn/Man_Solo_Leveling_Vaelyn_01.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_02", "models/vaelyn/Man_Solo_Leveling_Vaelyn_02.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_03", "models/vaelyn/Man_Solo_Leveling_Vaelyn_03.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_04", "models/vaelyn/Man_Solo_Leveling_Vaelyn_04.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_05", "models/vaelyn/Man_Solo_Leveling_Vaelyn_05.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_06", "models/vaelyn/Man_Solo_Leveling_Vaelyn_06.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_07", "models/vaelyn/Man_Solo_Leveling_Vaelyn_07.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_08", "models/vaelyn/Man_Solo_Leveling_Vaelyn_08.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_09", "models/vaelyn/Man_Solo_Leveling_Vaelyn_09.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_10", "models/vaelyn/Man_Solo_Leveling_Vaelyn_10.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_11", "models/vaelyn/Man_Solo_Leveling_Vaelyn_11.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_12", "models/vaelyn/Man_Solo_Leveling_Vaelyn_12.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_13", "models/vaelyn/Man_Solo_Leveling_Vaelyn_13.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_14", "models/vaelyn/Man_Solo_Leveling_Vaelyn_14.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_15", "models/vaelyn/Man_Solo_Leveling_Vaelyn_15.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_16", "models/vaelyn/Man_Solo_Leveling_Vaelyn_16.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_17", "models/vaelyn/Man_Solo_Leveling_Vaelyn_17.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_18", "models/vaelyn/Man_Solo_Leveling_Vaelyn_18.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_19", "models/vaelyn/Man_Solo_Leveling_Vaelyn_19.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_20", "models/vaelyn/Man_Solo_Leveling_Vaelyn_20.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_21", "models/vaelyn/Man_Solo_Leveling_Vaelyn_21.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_22", "models/vaelyn/Man_Solo_Leveling_Vaelyn_22.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_23", "models/vaelyn/Man_Solo_Leveling_Vaelyn_23.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_24", "models/vaelyn/Man_Solo_Leveling_Vaelyn_24.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_25", "models/vaelyn/Man_Solo_Leveling_Vaelyn_25.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_26", "models/vaelyn/Man_Solo_Leveling_Vaelyn_26.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_27", "models/vaelyn/Man_Solo_Leveling_Vaelyn_27.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_28", "models/vaelyn/Man_Solo_Leveling_Vaelyn_28.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_29", "models/vaelyn/Man_Solo_Leveling_Vaelyn_29.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_30", "models/vaelyn/Man_Solo_Leveling_Vaelyn_30.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_31", "models/vaelyn/Man_Solo_Leveling_Vaelyn_31.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_32", "models/vaelyn/Man_Solo_Leveling_Vaelyn_32.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_33", "models/vaelyn/Man_Solo_Leveling_Vaelyn_33.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_34", "models/vaelyn/Man_Solo_Leveling_Vaelyn_34.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_35", "models/vaelyn/Man_Solo_Leveling_Vaelyn_35.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_36", "models/vaelyn/Man_Solo_Leveling_Vaelyn_36.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_37", "models/vaelyn/Man_Solo_Leveling_Vaelyn_37.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_38", "models/vaelyn/Man_Solo_Leveling_Vaelyn_38.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_39", "models/vaelyn/Man_Solo_Leveling_Vaelyn_39.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_40", "models/vaelyn/Man_Solo_Leveling_Vaelyn_40.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_41", "models/vaelyn/Man_Solo_Leveling_Vaelyn_41.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_42", "models/vaelyn/Man_Solo_Leveling_Vaelyn_42.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_43", "models/vaelyn/Man_Solo_Leveling_Vaelyn_43.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_44", "models/vaelyn/Man_Solo_Leveling_Vaelyn_44.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_45", "models/vaelyn/Man_Solo_Leveling_Vaelyn_45.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_46", "models/vaelyn/Man_Solo_Leveling_Vaelyn_46.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_47", "models/vaelyn/Man_Solo_Leveling_Vaelyn_47.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_48", "models/vaelyn/Man_Solo_Leveling_Vaelyn_48.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_49", "models/vaelyn/Man_Solo_Leveling_Vaelyn_49.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_50", "models/vaelyn/Man_Solo_Leveling_Vaelyn_50.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_51", "models/vaelyn/Man_Solo_Leveling_Vaelyn_51.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_52", "models/vaelyn/Man_Solo_Leveling_Vaelyn_52.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_53", "models/vaelyn/Man_Solo_Leveling_Vaelyn_53.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_54", "models/vaelyn/Man_Solo_Leveling_Vaelyn_54.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_55", "models/vaelyn/Man_Solo_Leveling_Vaelyn_55.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_56", "models/vaelyn/Man_Solo_Leveling_Vaelyn_56.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_57", "models/vaelyn/Man_Solo_Leveling_Vaelyn_57.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_58", "models/vaelyn/Man_Solo_Leveling_Vaelyn_58.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_59", "models/vaelyn/Man_Solo_Leveling_Vaelyn_59.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_60", "models/vaelyn/Man_Solo_Leveling_Vaelyn_60.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_61", "models/vaelyn/Man_Solo_Leveling_Vaelyn_61.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_62", "models/vaelyn/Man_Solo_Leveling_Vaelyn_62.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_63", "models/vaelyn/Man_Solo_Leveling_Vaelyn_63.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_64", "models/vaelyn/Man_Solo_Leveling_Vaelyn_64.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_65", "models/vaelyn/Man_Solo_Leveling_Vaelyn_65.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_66", "models/vaelyn/Man_Solo_Leveling_Vaelyn_66.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_67", "models/vaelyn/Man_Solo_Leveling_Vaelyn_67.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_68", "models/vaelyn/Man_Solo_Leveling_Vaelyn_68.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_69", "models/vaelyn/Man_Solo_Leveling_Vaelyn_69.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_70", "models/vaelyn/Man_Solo_Leveling_Vaelyn_70.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_71", "models/vaelyn/Man_Solo_Leveling_Vaelyn_71.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_72", "models/vaelyn/Man_Solo_Leveling_Vaelyn_72.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_73", "models/vaelyn/Man_Solo_Leveling_Vaelyn_73.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_74", "models/vaelyn/Man_Solo_Leveling_Vaelyn_74.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_75", "models/vaelyn/Man_Solo_Leveling_Vaelyn_75.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_76", "models/vaelyn/Man_Solo_Leveling_Vaelyn_76.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_77", "models/vaelyn/Man_Solo_Leveling_Vaelyn_77.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_78", "models/vaelyn/Man_Solo_Leveling_Vaelyn_78.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_79", "models/vaelyn/Man_Solo_Leveling_Vaelyn_79.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_80", "models/vaelyn/Man_Solo_Leveling_Vaelyn_80.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_81", "models/vaelyn/Man_Solo_Leveling_Vaelyn_81.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_82", "models/vaelyn/Man_Solo_Leveling_Vaelyn_82.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_83", "models/vaelyn/Man_Solo_Leveling_Vaelyn_83.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_84", "models/vaelyn/Man_Solo_Leveling_Vaelyn_84.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_85", "models/vaelyn/Man_Solo_Leveling_Vaelyn_85.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_86", "models/vaelyn/Man_Solo_Leveling_Vaelyn_86.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_87", "models/vaelyn/Man_Solo_Leveling_Vaelyn_87.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_88", "models/vaelyn/Man_Solo_Leveling_Vaelyn_88.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_89", "models/vaelyn/Man_Solo_Leveling_Vaelyn_89.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_90", "models/vaelyn/Man_Solo_Leveling_Vaelyn_90.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_91", "models/vaelyn/Man_Solo_Leveling_Vaelyn_91.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_92", "models/vaelyn/Man_Solo_Leveling_Vaelyn_92.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_93", "models/vaelyn/Man_Solo_Leveling_Vaelyn_93.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_94", "models/vaelyn/Man_Solo_Leveling_Vaelyn_94.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_95", "models/vaelyn/Man_Solo_Leveling_Vaelyn_95.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_96", "models/vaelyn/Man_Solo_Leveling_Vaelyn_96.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_97", "models/vaelyn/Man_Solo_Leveling_Vaelyn_97.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_98", "models/vaelyn/Man_Solo_Leveling_Vaelyn_98.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_99", "models/vaelyn/Man_Solo_Leveling_Vaelyn_99.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_100", "models/vaelyn/Man_Solo_Leveling_Vaelyn_100.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_101", "models/vaelyn/Man_Solo_Leveling_Vaelyn_101.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_102", "models/vaelyn/Man_Solo_Leveling_Vaelyn_102.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_103", "models/vaelyn/Man_Solo_Leveling_Vaelyn_103.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_104", "models/vaelyn/Man_Solo_Leveling_Vaelyn_104.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_105", "models/vaelyn/Man_Solo_Leveling_Vaelyn_105.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_106", "models/vaelyn/Man_Solo_Leveling_Vaelyn_106.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_107", "models/vaelyn/Man_Solo_Leveling_Vaelyn_107.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_108", "models/vaelyn/Man_Solo_Leveling_Vaelyn_108.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_109", "models/vaelyn/Man_Solo_Leveling_Vaelyn_109.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_110", "models/vaelyn/Man_Solo_Leveling_Vaelyn_110.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_111", "models/vaelyn/Man_Solo_Leveling_Vaelyn_111.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_112", "models/vaelyn/Man_Solo_Leveling_Vaelyn_112.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_113", "models/vaelyn/Man_Solo_Leveling_Vaelyn_113.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_114", "models/vaelyn/Man_Solo_Leveling_Vaelyn_114.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_115", "models/vaelyn/Man_Solo_Leveling_Vaelyn_115.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_116", "models/vaelyn/Man_Solo_Leveling_Vaelyn_116.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_117", "models/vaelyn/Man_Solo_Leveling_Vaelyn_117.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_118", "models/vaelyn/Man_Solo_Leveling_Vaelyn_118.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_119", "models/vaelyn/Man_Solo_Leveling_Vaelyn_119.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_120", "models/vaelyn/Man_Solo_Leveling_Vaelyn_120.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_121", "models/vaelyn/Man_Solo_Leveling_Vaelyn_121.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_122", "models/vaelyn/Man_Solo_Leveling_Vaelyn_122.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_123", "models/vaelyn/Man_Solo_Leveling_Vaelyn_123.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_124", "models/vaelyn/Man_Solo_Leveling_Vaelyn_124.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_125", "models/vaelyn/Man_Solo_Leveling_Vaelyn_125.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_126", "models/vaelyn/Man_Solo_Leveling_Vaelyn_126.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_127", "models/vaelyn/Man_Solo_Leveling_Vaelyn_127.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_128", "models/vaelyn/Man_Solo_Leveling_Vaelyn_128.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_129", "models/vaelyn/Man_Solo_Leveling_Vaelyn_129.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_130", "models/vaelyn/Man_Solo_Leveling_Vaelyn_130.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_131", "models/vaelyn/Man_Solo_Leveling_Vaelyn_131.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_132", "models/vaelyn/Man_Solo_Leveling_Vaelyn_132.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_133", "models/vaelyn/Man_Solo_Leveling_Vaelyn_133.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_134", "models/vaelyn/Man_Solo_Leveling_Vaelyn_134.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_135", "models/vaelyn/Man_Solo_Leveling_Vaelyn_135.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_136", "models/vaelyn/Man_Solo_Leveling_Vaelyn_136.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_137", "models/vaelyn/Man_Solo_Leveling_Vaelyn_137.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_138", "models/vaelyn/Man_Solo_Leveling_Vaelyn_138.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_139", "models/vaelyn/Man_Solo_Leveling_Vaelyn_139.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_140", "models/vaelyn/Man_Solo_Leveling_Vaelyn_140.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_141", "models/vaelyn/Man_Solo_Leveling_Vaelyn_141.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_142", "models/vaelyn/Man_Solo_Leveling_Vaelyn_142.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_143", "models/vaelyn/Man_Solo_Leveling_Vaelyn_143.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_144", "models/vaelyn/Man_Solo_Leveling_Vaelyn_144.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_145", "models/vaelyn/Man_Solo_Leveling_Vaelyn_145.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_146", "models/vaelyn/Man_Solo_Leveling_Vaelyn_146.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_147", "models/vaelyn/Man_Solo_Leveling_Vaelyn_147.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_148", "models/vaelyn/Man_Solo_Leveling_Vaelyn_148.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_149", "models/vaelyn/Man_Solo_Leveling_Vaelyn_149.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_150", "models/vaelyn/Man_Solo_Leveling_Vaelyn_150.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_151", "models/vaelyn/Man_Solo_Leveling_Vaelyn_151.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_152", "models/vaelyn/Man_Solo_Leveling_Vaelyn_152.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_153", "models/vaelyn/Man_Solo_Leveling_Vaelyn_153.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_154", "models/vaelyn/Man_Solo_Leveling_Vaelyn_154.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_155", "models/vaelyn/Man_Solo_Leveling_Vaelyn_155.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_156", "models/vaelyn/Man_Solo_Leveling_Vaelyn_156.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_157", "models/vaelyn/Man_Solo_Leveling_Vaelyn_157.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_158", "models/vaelyn/Man_Solo_Leveling_Vaelyn_158.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_159", "models/vaelyn/Man_Solo_Leveling_Vaelyn_159.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_160", "models/vaelyn/Man_Solo_Leveling_Vaelyn_160.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_161", "models/vaelyn/Man_Solo_Leveling_Vaelyn_161.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_162", "models/vaelyn/Man_Solo_Leveling_Vaelyn_162.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_163", "models/vaelyn/Man_Solo_Leveling_Vaelyn_163.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_164", "models/vaelyn/Man_Solo_Leveling_Vaelyn_164.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_165", "models/vaelyn/Man_Solo_Leveling_Vaelyn_165.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_166", "models/vaelyn/Man_Solo_Leveling_Vaelyn_166.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_167", "models/vaelyn/Man_Solo_Leveling_Vaelyn_167.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_168", "models/vaelyn/Man_Solo_Leveling_Vaelyn_168.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_169", "models/vaelyn/Man_Solo_Leveling_Vaelyn_169.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_170", "models/vaelyn/Man_Solo_Leveling_Vaelyn_170.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_171", "models/vaelyn/Man_Solo_Leveling_Vaelyn_171.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_172", "models/vaelyn/Man_Solo_Leveling_Vaelyn_172.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_173", "models/vaelyn/Man_Solo_Leveling_Vaelyn_173.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_174", "models/vaelyn/Man_Solo_Leveling_Vaelyn_174.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_175", "models/vaelyn/Man_Solo_Leveling_Vaelyn_175.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_176", "models/vaelyn/Man_Solo_Leveling_Vaelyn_176.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_177", "models/vaelyn/Man_Solo_Leveling_Vaelyn_177.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_178", "models/vaelyn/Man_Solo_Leveling_Vaelyn_178.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_179", "models/vaelyn/Man_Solo_Leveling_Vaelyn_179.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_180", "models/vaelyn/Man_Solo_Leveling_Vaelyn_180.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_181", "models/vaelyn/Man_Solo_Leveling_Vaelyn_181.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_182", "models/vaelyn/Man_Solo_Leveling_Vaelyn_182.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_183", "models/vaelyn/Man_Solo_Leveling_Vaelyn_183.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_184", "models/vaelyn/Man_Solo_Leveling_Vaelyn_184.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_185", "models/vaelyn/Man_Solo_Leveling_Vaelyn_185.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_186", "models/vaelyn/Man_Solo_Leveling_Vaelyn_186.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_187", "models/vaelyn/Man_Solo_Leveling_Vaelyn_187.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_188", "models/vaelyn/Man_Solo_Leveling_Vaelyn_188.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_189", "models/vaelyn/Man_Solo_Leveling_Vaelyn_189.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_190", "models/vaelyn/Man_Solo_Leveling_Vaelyn_190.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_191", "models/vaelyn/Man_Solo_Leveling_Vaelyn_191.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_192", "models/vaelyn/Man_Solo_Leveling_Vaelyn_192.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_193", "models/vaelyn/Man_Solo_Leveling_Vaelyn_193.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_194", "models/vaelyn/Man_Solo_Leveling_Vaelyn_194.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_195", "models/vaelyn/Man_Solo_Leveling_Vaelyn_195.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_196", "models/vaelyn/Man_Solo_Leveling_Vaelyn_196.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_197", "models/vaelyn/Man_Solo_Leveling_Vaelyn_197.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_198", "models/vaelyn/Man_Solo_Leveling_Vaelyn_198.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_199", "models/vaelyn/Man_Solo_Leveling_Vaelyn_199.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_200", "models/vaelyn/Man_Solo_Leveling_Vaelyn_200.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_201", "models/vaelyn/Man_Solo_Leveling_Vaelyn_201.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_202", "models/vaelyn/Man_Solo_Leveling_Vaelyn_202.mdl")
AddPlayerModel("Man_Solo_Leveling_Vaelyn_203", "models/vaelyn/Man_Solo_Leveling_Vaelyn_203.mdl")


AddPlayerModel("Women_Solo_Leveling_Vaelyn_01", "models/vaelyn/Women_Solo_Leveling_Vaelyn_01.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_02", "models/vaelyn/Women_Solo_Leveling_Vaelyn_02.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_03", "models/vaelyn/Women_Solo_Leveling_Vaelyn_03.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_04", "models/vaelyn/Women_Solo_Leveling_Vaelyn_04.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_05", "models/vaelyn/Women_Solo_Leveling_Vaelyn_05.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_06", "models/vaelyn/Women_Solo_Leveling_Vaelyn_06.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_07", "models/vaelyn/Women_Solo_Leveling_Vaelyn_07.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_08", "models/vaelyn/Women_Solo_Leveling_Vaelyn_08.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_09", "models/vaelyn/Women_Solo_Leveling_Vaelyn_09.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_10", "models/vaelyn/Women_Solo_Leveling_Vaelyn_10.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_11", "models/vaelyn/Women_Solo_Leveling_Vaelyn_11.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_12", "models/vaelyn/Women_Solo_Leveling_Vaelyn_12.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_13", "models/vaelyn/Women_Solo_Leveling_Vaelyn_13.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_14", "models/vaelyn/Women_Solo_Leveling_Vaelyn_14.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_15", "models/vaelyn/Women_Solo_Leveling_Vaelyn_15.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_16", "models/vaelyn/Women_Solo_Leveling_Vaelyn_16.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_17", "models/vaelyn/Women_Solo_Leveling_Vaelyn_17.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_18", "models/vaelyn/Women_Solo_Leveling_Vaelyn_18.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_19", "models/vaelyn/Women_Solo_Leveling_Vaelyn_19.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_20", "models/vaelyn/Women_Solo_Leveling_Vaelyn_20.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_21", "models/vaelyn/Women_Solo_Leveling_Vaelyn_21.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_22", "models/vaelyn/Women_Solo_Leveling_Vaelyn_22.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_23", "models/vaelyn/Women_Solo_Leveling_Vaelyn_23.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_24", "models/vaelyn/Women_Solo_Leveling_Vaelyn_24.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_25", "models/vaelyn/Women_Solo_Leveling_Vaelyn_25.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_26", "models/vaelyn/Women_Solo_Leveling_Vaelyn_26.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_27", "models/vaelyn/Women_Solo_Leveling_Vaelyn_27.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_28", "models/vaelyn/Women_Solo_Leveling_Vaelyn_28.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_29", "models/vaelyn/Women_Solo_Leveling_Vaelyn_29.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_30", "models/vaelyn/Women_Solo_Leveling_Vaelyn_30.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_31", "models/vaelyn/Women_Solo_Leveling_Vaelyn_31.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_32", "models/vaelyn/Women_Solo_Leveling_Vaelyn_32.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_33", "models/vaelyn/Women_Solo_Leveling_Vaelyn_33.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_34", "models/vaelyn/Women_Solo_Leveling_Vaelyn_34.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_35", "models/vaelyn/Women_Solo_Leveling_Vaelyn_35.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_36", "models/vaelyn/Women_Solo_Leveling_Vaelyn_36.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_37", "models/vaelyn/Women_Solo_Leveling_Vaelyn_37.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_38", "models/vaelyn/Women_Solo_Leveling_Vaelyn_38.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_39", "models/vaelyn/Women_Solo_Leveling_Vaelyn_39.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_40", "models/vaelyn/Women_Solo_Leveling_Vaelyn_40.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_41", "models/vaelyn/Women_Solo_Leveling_Vaelyn_41.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_42", "models/vaelyn/Women_Solo_Leveling_Vaelyn_42.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_43", "models/vaelyn/Women_Solo_Leveling_Vaelyn_43.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_44", "models/vaelyn/Women_Solo_Leveling_Vaelyn_44.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_45", "models/vaelyn/Women_Solo_Leveling_Vaelyn_45.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_46", "models/vaelyn/Women_Solo_Leveling_Vaelyn_46.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_47", "models/vaelyn/Women_Solo_Leveling_Vaelyn_47.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_48", "models/vaelyn/Women_Solo_Leveling_Vaelyn_48.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_49", "models/vaelyn/Women_Solo_Leveling_Vaelyn_49.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_50", "models/vaelyn/Women_Solo_Leveling_Vaelyn_50.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_51", "models/vaelyn/Women_Solo_Leveling_Vaelyn_51.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_52", "models/vaelyn/Women_Solo_Leveling_Vaelyn_52.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_53", "models/vaelyn/Women_Solo_Leveling_Vaelyn_53.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_54", "models/vaelyn/Women_Solo_Leveling_Vaelyn_54.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_55", "models/vaelyn/Women_Solo_Leveling_Vaelyn_55.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_56", "models/vaelyn/Women_Solo_Leveling_Vaelyn_56.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_57", "models/vaelyn/Women_Solo_Leveling_Vaelyn_57.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_58", "models/vaelyn/Women_Solo_Leveling_Vaelyn_58.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_59", "models/vaelyn/Women_Solo_Leveling_Vaelyn_59.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_60", "models/vaelyn/Women_Solo_Leveling_Vaelyn_60.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_61", "models/vaelyn/Women_Solo_Leveling_Vaelyn_61.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_62", "models/vaelyn/Women_Solo_Leveling_Vaelyn_62.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_63", "models/vaelyn/Women_Solo_Leveling_Vaelyn_63.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_64", "models/vaelyn/Women_Solo_Leveling_Vaelyn_64.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_65", "models/vaelyn/Women_Solo_Leveling_Vaelyn_65.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_66", "models/vaelyn/Women_Solo_Leveling_Vaelyn_66.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_67", "models/vaelyn/Women_Solo_Leveling_Vaelyn_67.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_68", "models/vaelyn/Women_Solo_Leveling_Vaelyn_68.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_69", "models/vaelyn/Women_Solo_Leveling_Vaelyn_69.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_70", "models/vaelyn/Women_Solo_Leveling_Vaelyn_70.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_71", "models/vaelyn/Women_Solo_Leveling_Vaelyn_71.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_72", "models/vaelyn/Women_Solo_Leveling_Vaelyn_72.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_73", "models/vaelyn/Women_Solo_Leveling_Vaelyn_73.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_74", "models/vaelyn/Women_Solo_Leveling_Vaelyn_74.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_75", "models/vaelyn/Women_Solo_Leveling_Vaelyn_75.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_76", "models/vaelyn/Women_Solo_Leveling_Vaelyn_76.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_77", "models/vaelyn/Women_Solo_Leveling_Vaelyn_77.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_78", "models/vaelyn/Women_Solo_Leveling_Vaelyn_78.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_79", "models/vaelyn/Women_Solo_Leveling_Vaelyn_79.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_80", "models/vaelyn/Women_Solo_Leveling_Vaelyn_80.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_81", "models/vaelyn/Women_Solo_Leveling_Vaelyn_81.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_82", "models/vaelyn/Women_Solo_Leveling_Vaelyn_82.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_83", "models/vaelyn/Women_Solo_Leveling_Vaelyn_83.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_84", "models/vaelyn/Women_Solo_Leveling_Vaelyn_84.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_85", "models/vaelyn/Women_Solo_Leveling_Vaelyn_85.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_86", "models/vaelyn/Women_Solo_Leveling_Vaelyn_86.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_87", "models/vaelyn/Women_Solo_Leveling_Vaelyn_87.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_88", "models/vaelyn/Women_Solo_Leveling_Vaelyn_88.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_89", "models/vaelyn/Women_Solo_Leveling_Vaelyn_89.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_90", "models/vaelyn/Women_Solo_Leveling_Vaelyn_90.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_91", "models/vaelyn/Women_Solo_Leveling_Vaelyn_91.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_92", "models/vaelyn/Women_Solo_Leveling_Vaelyn_92.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_93", "models/vaelyn/Women_Solo_Leveling_Vaelyn_93.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_94", "models/vaelyn/Women_Solo_Leveling_Vaelyn_94.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_95", "models/vaelyn/Women_Solo_Leveling_Vaelyn_95.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_96", "models/vaelyn/Women_Solo_Leveling_Vaelyn_96.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_97", "models/vaelyn/Women_Solo_Leveling_Vaelyn_97.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_98", "models/vaelyn/Women_Solo_Leveling_Vaelyn_98.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_99", "models/vaelyn/Women_Solo_Leveling_Vaelyn_99.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_100", "models/vaelyn/Women_Solo_Leveling_Vaelyn_100.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_101", "models/vaelyn/Women_Solo_Leveling_Vaelyn_101.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_102", "models/vaelyn/Women_Solo_Leveling_Vaelyn_102.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_103", "models/vaelyn/Women_Solo_Leveling_Vaelyn_103.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_104", "models/vaelyn/Women_Solo_Leveling_Vaelyn_104.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_105", "models/vaelyn/Women_Solo_Leveling_Vaelyn_105.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_106", "models/vaelyn/Women_Solo_Leveling_Vaelyn_106.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_107", "models/vaelyn/Women_Solo_Leveling_Vaelyn_107.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_108", "models/vaelyn/Women_Solo_Leveling_Vaelyn_108.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_109", "models/vaelyn/Women_Solo_Leveling_Vaelyn_109.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_110", "models/vaelyn/Women_Solo_Leveling_Vaelyn_110.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_111", "models/vaelyn/Women_Solo_Leveling_Vaelyn_111.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_112", "models/vaelyn/Women_Solo_Leveling_Vaelyn_112.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_113", "models/vaelyn/Women_Solo_Leveling_Vaelyn_113.mdl")
AddPlayerModel("Women_Solo_Leveling_Vaelyn_114", "models/vaelyn/Women_Solo_Leveling_Vaelyn_114.mdl")


--PATH addons/warning_system/lua/warning_system_7452/languages/tr.lua:
WarningSystem7452em.Lang["tr"] = {
	tabs = {
		my_warnings = "Uyarılarım",
		offline_players = "Çevrimdışı Oyuncular",
		online_players = "Çevrimiçi Oyuncular",
		settings = "Ayarlar",
		statistics = "İstatistik",
	},

	settings_tabs = {
		preset_reasons = "Önceden Ayarlanmış Nedenler",
		thresholds = "Eşikler",
		permissions = "İzinler",
		theme = "Tema",
		other = "Diğer",

		add_this_reason = "Bu nedeni ekleyin",
		penalty_points_to_reach = "Ulaşılacak ceza puanları",
		add_this_threshold = "Bu eşiği ekleyin",
		save_those_permissions = "Bu izinleri kaydedin",
		save_this_theme = "Bu temayı herkes için kaydedin",
		save_this_config = "Bu ayarları kaydedin",
	},

	webhooks = {
		new_warning = "Yeni Uyarı",
		warning_removed = "Uyarı Kaldırıldı",

		user = "Kullanıcı",
		admin = "Yetkili",
		more_info = "Daha fazla bilgi",
	},

	errors = {
		no_access = "Buna erişiminiz yok",
		reason_too_short = "Nedeni çok kısa",
		reason_too_long = "Reason too long",
		invalid_key = "Nedeni çok uzun",
	},

	notifs = {
		success = "Başarıyla",
		error = "Hata",
		warning = "Uyarı",
	},

	youve_been_warned = "Uyarıldın",
	player_been_warned = "Oyuncu başarıyla uyarıldı",
	player_been_unwarned = "Oyuncu başarıyla uyarılmadı",

	settings_updated = "Ayarlar güncellendi",

	awarn_imported = "AWarn3'ten gelen uyarılar içe aktarıldı!",

	by = "Tarafından",
	reason = "Nedeni",
	penalty = "Ceza",
	date = "Tarih",
	expiration = "Son",
	duration = "Süresi",
	preset = "Ön ayar",

	none = "Yok",

	warn = "Uyar",

	custom_warning = "Özel Uyarı",

	penalty_points = "Ceza puanları",

	warn_this_player = "Bu oyuncuyu uyar",

	search_player_sid64 = "SteamID x64 (7656 ...) ile bir oyuncu arayın",
	search_player = "Oyuncu ara ...",

	x_displayed = "%i görüntülendi",
	x_online_players = "%i Çevrimiçi Oyuncular",

	total_warnings = "Toplam Uyarılar",
	total_penalty_points = "Toplam Ceza Puanı",
	monthly_warnings = "Aylık Uyarılar",
	last_warnings = "Son Uyarılar",
	most_warned = "En Çok Uyarılan",
	staff_leaderboard = "Yetkili Lider Tablosu",
	active_warnings = "Aktif Uyarılar",

	view_more = "Daha fazla göster",

	joins_with_x = "%s , sunucuya %s uyarısyla katılıyor",

	set_api_key = "Bir Steam API anahtarı koymalısınız",

	months = {"Oca", "Şub", "Mar", "Nis", "May", "Haz", "Tem", "Ağu", "Eyl", "Eki", "Kas", "Ara"}
}

--PATH addons/warning_system/lua/warning_system_7452/shared/functions.lua:
function WarningSystem7452em:Compress( tTable )
	local sJson = util.TableToJSON( tTable or {} )
	local dCompressed = util.Compress( sJson or "" )
	return dCompressed, dCompressed:len()
end

function WarningSystem7452em:Decompress( dData )
	local sJson = util.Decompress( dData )
	local tTable = util.JSONToTable( sJson or "" )
	return tTable
end

function WarningSystem7452em:AddCategory(sID, tCategory)
    WarningSystem7452em.Categories = WarningSystem7452em.Categories or {}

    WarningSystem7452em.Categories[sID] = tCategory
end

function WarningSystem7452em:RegisterThreshold(sID, tTable)
    WarningSystem7452em.Thresholds = WarningSystem7452em.Thresholds or {}

    WarningSystem7452em.Thresholds[sID] = tTable
end

function WarningSystem7452em:Can(pPlayer, sPermission)
    if( pPlayer:IsSuperAdmin() ) then return true end

    local tPermissions = self.CFG.permissions[pPlayer:GetUserGroup()]

    if( not tPermissions ) then return false end

    return tPermissions[sPermission] or false
end

--[[
    Desc: Format Time from 1w 2d 3h for example
    Return: integer
]]

local tTimes = {
    ["s"]  = 1, -- seconds
    ["m"]  = 60, -- minutes
    ["h"]  = 60 * 60, -- hours
    ["d"]  = 60 * 60 * 24, -- days
    ["mo"] = 60 * 60 * 24 * 30, -- months
    ["y"]  = 60 * 60 * 24 * 30 * 12, -- years
}

function WarningSystem7452em:FormatStringToTime(sTime)
    local iTotalTime = 0

    for iValue, sTime in sTime:gmatch("(%d+)(%a+)") do
        if not tTimes[sTime] then continue end
        iTotalTime = iTotalTime + (iValue * tTimes[sTime] or 1) 
    end

    return iTotalTime
end

local tTimesNames = {
    "y", "mo", "d", "h", "m", "s"
}

function WarningSystem7452em:FormatTimeToString(iTime)
    local tUsedTimes = {}

    local iCurrentTime = iTime or 0

    tUsedTimes[6] = iCurrentTime % 60
    iCurrentTime = math.floor( iCurrentTime / 60 )

    tUsedTimes[5] = iCurrentTime % 60
    iCurrentTime = math.floor( iCurrentTime / 60 )

    tUsedTimes[4] = iCurrentTime % 24
    iCurrentTime = math.floor( iCurrentTime / 24 )

    tUsedTimes[3] = iCurrentTime % 30
    iCurrentTime = math.floor( iCurrentTime / 30 )

    tUsedTimes[2] = iCurrentTime % 12
    tUsedTimes[1] = math.floor(iCurrentTime / 12)

    local sTime = ""

    for k, v in ipairs(tUsedTimes) do
        if v == 0 then continue end
        sTime = sTime .. " " .. v .. tTimesNames[k]
    end

    return sTime == "" and "infinite" or string.sub(sTime, 2)
end

function WarningSystem7452em:GetUserGroups()
    if xAdmin then
	    return table.GetKeys(xAdmin.Groups)	
    end
	
    if CAMI then
        return table.GetKeys(CAMI.GetUsergroups())
    end

    if ULib then
        return table.GetKeys(ULib.ucl.groups)
    end

    if FAdmin then
        return table.GetKeys(FAdmin.Access.Groups)
    end

    return {}
end

function WarningSystem7452em:RGBToHex(rgb)
    local charset = {"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"}
    local tmp = {}
    local sHex = ""

    rgb.a = nil

    for k,v in SortedPairs(rgb or {}, true) do
        repeat
            table.insert(tmp, 1, charset[v % 16 + 1])
            v = math.floor(v / 16)
        until v == 0

        sHex = sHex .. table.concat(tmp)
        tmp = {}
    end

    return sHex
end

--PATH addons/warning_system/lua/warning_system_7452/shared/thresholds/kick.lua:
local THRESHOLD = {}

THRESHOLD.Name = "Kick"

THRESHOLD.Params = {
    { name = "reason", type = "string" },
}

function THRESHOLD:Execute(pPlayer, ...)
    local tParams = {...}
    local sReason = tParams[1]

    pPlayer:Kick(sReason)
end

WarningSystem7452em:RegisterThreshold("Kick", THRESHOLD)
--PATH addons/warning_system/lua/warning_system_7452/client/functions.lua:
function WarningSystem7452em:OpenMenu()
    WarningSystem7452em.Menu = vgui.Create("WarningSystem7452em:Menu")
end

--[[
    Desc: Check if warn has expiration
    Return: boolean
]]--

function WarningSystem7452em:HasExpiration(tWarn)
    if( not tWarn.expires_at || tWarn.expires_at == "NULL" ) then
        return false 
    end

    return true
end

--[[
    Desc: Get note of player
    Return: string
]]--

function WarningSystem7452em:GetNote(sSteamID)
    local tUser = self.Users[sSteamID]

    if( not tUser ) then return "" end

    return tUser.note or ""
end

--[[  
    Desc : Get warnings of player
    return : Array
]]

function WarningSystem7452em:GetWarnings(sSteamID)
    local tUser = self.Users[sSteamID]

    if( not tUser ) then return {} end
    if( not tUser.warnings ) then return {} end

    return tUser.warnings 
end

--[[  
    Desc : Get total penalty points of player
    Return : int
]]

function WarningSystem7452em:GetTotalPoints(sSteamID)
    local tWarnings = self:GetWarnings(sSteamID)
    local iPoint = 0

    for k,v in pairs(tWarnings or {}) do
        if( self:HasExpiration(v) ) then
            if( tonumber(v.expires_at) > os.time() ) then
                iPoint = iPoint + v.penalty
            end
        else
            iPoint = iPoint + v.penalty
        end
    end

    return iPoint
end

--[[  
    Desc : Get active warning of player
    Return : int
]]

function WarningSystem7452em:GetActiveWarnings(sSteamID)
    local tWarnings = self:GetWarnings(sSteamID)
    local iActiveWarnings = 0

    for k,v in pairs(tWarnings or {}) do
        if( self:HasExpiration(v) ) then
            if( tonumber(v.expires_at) > os.time() ) then
                iActiveWarnings = iActiveWarnings + 1
            end
        else
            iActiveWarnings = iActiveWarnings + 1
        end
    end

    return iActiveWarnings
end

--[[  
    Desc : Get total warnings of player
    Return : int
]]

function WarningSystem7452em:GetTotalWarnings(sSteamID)
    return table.Count(self:GetWarnings(sSteamID) or {})
end

--[[
    Desc: Wrap strings to not become wider than the given amount of pixels
    Taken from DarkRP
]]

local function charWrap(text, remainingWidth, maxWidth)
    local totalWidth = 0

    text = text:gsub(".", function(char)
        totalWidth = totalWidth + surface.GetTextSize(char)

        -- Wrap around when the max width is reached
        if totalWidth >= remainingWidth then
            -- totalWidth needs to include the character width because it's inserted in a new line
            totalWidth = surface.GetTextSize(char)
            remainingWidth = maxWidth
            return "\n" .. char
        end

        return char
    end)

    return text, totalWidth
end

function WarningSystem7452em:textWrap(text, font, maxWidth)
    local totalWidth = 0

    surface.SetFont(font)

    local spaceWidth = surface.GetTextSize(' ')
    text = text:gsub("(%s?[%S]+)", function(word)
            local char = string.sub(word, 1, 1)
            if char == "\n" or char == "\t" then
                totalWidth = 0
            end

            local wordlen = surface.GetTextSize(word)
            totalWidth = totalWidth + wordlen

            -- Wrap around when the max width is reached
            if wordlen >= maxWidth then -- Split the word if the word is too big
                local splitWord, splitPoint = charWrap(word, maxWidth - (totalWidth - wordlen), maxWidth)
                totalWidth = splitPoint
                return splitWord
            elseif totalWidth < maxWidth then
                return word
            end

            -- Split before the word
            if char == ' ' then
                totalWidth = wordlen - spaceWidth
                return '\n' .. string.sub(word, 2)
            end

            totalWidth = wordlen
            return '\n' .. word
        end)

    return text
end

--[[
    Desc: Splits a text into a table
    Return: table
]]

function WarningSystem7452em:splitText(sText, pnlParent, iOffsetX, iSize, sFont, cColor, bMultiline)
    local tTexts = string.Explode("\n", WarningSystem7452em:textWrap(sText, sFont, iSize))

    local iLines = #tTexts + 1

    local pnlText = vgui.Create("DPanel", pnlParent)
    pnlText:SetSize(iSize, pnlParent:GetTall())
    pnlText:SetPos(iOffsetX, 0)
    if bMultiline then
        function pnlText:Paint(iW, iH)
            for k, v in ipairs(tTexts) do
                draw.SimpleText(v, sFont, iW * 0.5, (iH * 0.5) - ((iLines/2) * iH * 0.3) + k * iH * 0.3, cColor, 1, 1)
            end
        end
    else
        function pnlText:Paint(iW, iH)
            draw.SimpleText(tTexts[1], sFont, iW * 0.5, iH * 0.5, cColor, 1, 1)
        end
    end

    return iSize
end

--[[
    Desc: Shows a notification on the user screen
    Return: void
]]

WarningSystem7452em.NotifList = {}

local iNotifH = 60

local tNotifications = nil

function WarningSystem7452em:Notify(iType, sMessage, iLength)
	if not WarningSystem7452em or not WarningSystem7452em.CFG or not WarningSystem7452em.CFG.theme then return end
	
	tNotifications = tNotifications or {
		[0] = {
			title = WarningSystem7452em:__("notifs.success"),
			color = WarningSystem7452em.CFG.theme.Green
		},
		[1] = {
			title = WarningSystem7452em:__("notifs.error"),
			color = WarningSystem7452em.CFG.theme.Red
		},
		[2] = {
			title = WarningSystem7452em:__("notifs.warning"),
			color = WarningSystem7452em.CFG.theme.Orange
		},
	}

	iLength = tonumber( iLength ) or 10

	surface.SetFont("WarningSystem7452em:25M")
	local w = surface.GetTextSize(sMessage)

	table.insert(self.NotifList, {sTitle = tNotifications[iType].title, sMsg = sMessage, cColor = tNotifications[iType].color, iEnd = CurTime() + iLength, iW = w, x = ScrW(), y = 0, iA = w})

	if not hook.GetTable()["HUDPaint"]["WarningSystem7452em.Notif:HUDPaint"] then
		hook.Add("HUDPaint", "WarningSystem7452em.Notif:HUDPaint", function()
			for k, v in pairs(self.NotifList) do
				v.x = Lerp(RealFrameTime() * 8, v.x, (CurTime() > v.iEnd) and (ScrW() + 1) or (ScrW() - v.iW - 40 - 10))
                v.y = Lerp(RealFrameTime() * 8, v.y, (iNotifH + 10) * (k - 1) + 10)

				if v.x >= ScrW() and CurTime() > v.iEnd then
					table.remove(self.NotifList, k)
					if #self.NotifList == 0 then
						hook.Remove("HUDPaint", "WarningSystem7452em.Notif:HUDPaint")
					end
				end

				surface.SetDrawColor(WarningSystem7452em.CFG.theme.Primary)
				surface.DrawRect(v.x, v.y, v.iW + 40, iNotifH)

				surface.SetDrawColor(v.cColor)
                surface.DrawRect(v.x + 3, v.y + 3, 6, iNotifH - 6)

				draw.SimpleText(v.sTitle, "WarningSystem7452em:30M", v.x + 22, v.y + 19, WarningSystem7452em.CFG.theme.Texts, 0, 1)
				draw.SimpleText(v.sMsg, "WarningSystem7452em:25M", v.x + 22, v.y + 43, WarningSystem7452em.CFG.theme.Texts, 0, 1)
			end
		end)
	end
end

--[[
    Desc: Display warning menu
    Return: void
]]

function WarningSystem7452em:DisplayWarningMenu(sID)
    local pFound = player.GetBySteamID64(sID)
    local sName = sID

    if pFound then sName = pFound:Nick() end 

    local pnlWarning = vgui.Create("EditablePanel")
    pnlWarning:SetSize(ScrH() * 0.35, ScrH() * 0.5)
    pnlWarning:Center()
    pnlWarning:SetAlpha(0)
    pnlWarning:AlphaTo(255, 0.25)
    pnlWarning:MakePopup()
    local iTime = SysTime()
    function pnlWarning:Paint(iW, iH)
        Derma_DrawBackgroundBlur(self, iTime)

        draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Primary)
        draw.RoundedBox(8, 0, iH * 0.1, iW, 1, WarningSystem7452em.CFG.theme.Secondary)

        draw.SimpleText(sName, "WarningSystem7452em:30M", iW * 0.05, iH * 0.05, WarningSystem7452em.CFG.theme.Texts, 0, 1)

        draw.SimpleText(WarningSystem7452em:__("preset"), "WarningSystem7452em:25M", iW * 0.05, iH * 0.13, WarningSystem7452em.CFG.theme.Texts2)
        draw.SimpleText(WarningSystem7452em:__("reason"), "WarningSystem7452em:25M", iW * 0.05, iH * 0.275, WarningSystem7452em.CFG.theme.Texts2)
        draw.SimpleText(WarningSystem7452em:__("penalty"), "WarningSystem7452em:25M", iW * 0.05, iH * 0.59, WarningSystem7452em.CFG.theme.Texts2)
        draw.SimpleText(WarningSystem7452em:__("duration"), "WarningSystem7452em:25M", iW * 0.05, iH * 0.74, WarningSystem7452em.CFG.theme.Texts2)
    end

    local btnClose = vgui.Create("DButton", pnlWarning)
    btnClose:SetSize(pnlWarning:GetTall() * 0.1, pnlWarning:GetTall() * 0.1)
    btnClose:SetPos(pnlWarning:GetWide() - btnClose:GetWide(), 0)
    btnClose:SetText("")
    function btnClose:Paint(iW, iH)
        draw.SimpleText("✕", "WarningSystem7452em:20M", iW * 0.5, iH * 0.5, WarningSystem7452em.CFG.theme.Texts, 1, 1)
    end
    function btnClose:DoClick()
        self:GetParent().bClosing = true

        self:GetParent():AlphaTo(0, 0.2, 0, function()
            if not IsValid(self) or not IsValid(self:GetParent()) then return end

            self:GetParent():Remove()
        end)
    end

    function pnlWarning:Think()
        if not self:HasFocus() and not vgui.FocusedHasParent(self) then
            self:MakePopup()
        end
    end

    local pnlPreset = vgui.Create("WarningSystem7452em:DComboBox", pnlWarning)
    pnlPreset:SetSize(pnlWarning:GetWide() * 0.9, pnlWarning:GetTall() * 0.07)
    pnlPreset:SetPos(pnlWarning:GetWide() * 0.05, pnlWarning:GetTall() * 0.18)
    pnlPreset:AddChoice(WarningSystem7452em:__("none"), nil, true)
    for k, v in pairs(WarningSystem7452em.CFG.reasons) do
        pnlPreset:AddChoice(v.reason, k)
    end

    local pnlReason = vgui.Create("WarningSystem7452em:DTextEntry", pnlWarning)
    pnlReason:SetSize(pnlWarning:GetWide() * 0.9, pnlWarning:GetTall() * 0.238)
    pnlReason:SetPos(pnlWarning:GetWide() * 0.05, pnlWarning:GetTall() * 0.325)
    pnlReason:SetMultiline(true)
    pnlReason:SetPlaceholderText(WarningSystem7452em:__("reason") .. "\n\n\n")

    local pnlPenalty = vgui.Create("WarningSystem7452em:DTextEntry", pnlWarning)
    pnlPenalty:SetSize(pnlWarning:GetWide() * 0.9, pnlWarning:GetTall() * 0.07)
    pnlPenalty:SetPos(pnlWarning:GetWide() * 0.05, pnlWarning:GetTall() * 0.64)
    pnlPenalty:SetPlaceholderText("5")

    local pnlDuration = vgui.Create("WarningSystem7452em:DTextEntry", pnlWarning)
    pnlDuration:SetSize(pnlWarning:GetWide() * 0.9, pnlWarning:GetTall() * 0.07)
    pnlDuration:SetPos(pnlWarning:GetWide() * 0.05, pnlWarning:GetTall() * 0.79)
    pnlDuration:SetPlaceholderText("1y 2mo 3d 4h 5m 6s")

    function pnlPreset:OnSelect(iID, sValue, xData)
        if xData == nil then
            pnlReason:SetText("")
            pnlPenalty:SetText("")
            pnlDuration:SetText("")

            return
        end

        local tPreset = WarningSystem7452em.CFG.reasons[xData]

        pnlReason:SetText(tPreset.reason)
        pnlPenalty:SetText(tPreset.penalty)
        pnlDuration:SetText(WarningSystem7452em:FormatTimeToString(tPreset.duration))
    end

    local btnWarn = vgui.Create("WarningSystem7452em:DButton", pnlWarning)
    btnWarn:SetSize(pnlWarning:GetWide() * 0.9, pnlWarning:GetTall() * 0.07)
    btnWarn:SetPos(pnlWarning:GetWide() * 0.05, pnlWarning:GetTall() * 0.90)
    btnWarn:SetText(WarningSystem7452em:__("warn"))
    btnWarn:SetFont("WarningSystem7452em:30M")
    function btnWarn:DoClick()
        local sReason = tostring(pnlReason:GetText()) or ""
        local iPenalty = tonumber(pnlPenalty:GetText()) or 0
        local iDuration = WarningSystem7452em:FormatStringToTime(pnlDuration:GetText() or "")

        WarningSystem7452em:NetStart("WarningSystem7452em:Player:Warn", {
            target = sID,
            reason = sReason,
            penalty = iPenalty,
            duration = iDuration
        })

        if IsValid(WarningSystem7452em.Menu) then
            WarningSystem7452em.Menu:LoadContent("my_warnings", IsValid(pFound) and pFound or sID)
        end

        btnClose:DoClick()
    end
end

--[[
    Desc: Very simple card element
    Return: void
]]

function WarningSystem7452em:DrawCard(sTitle, sContent, xIcon, iX, iY, iW, iH)
    local sFont = "WarningSystem7452em:45M"
    surface.SetFont(sFont)
    local iTotalW = surface.GetTextSize(sContent) + iH * 0.4

    draw.RoundedBox(8, iX, iY, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
    draw.RoundedBox(8, iX + 1, iY + 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)

    draw.SimpleText(sTitle, "WarningSystem7452em:28M", iX + iW * 0.5, iY + iH * 0.3, WarningSystem7452em.CFG.theme.Texts2, 1, 1)
    draw.SimpleText(sContent, sFont, iX + iW * 0.5 - iTotalW * 0.5 + iH * 0.4, iY + iH * 0.7, WarningSystem7452em.CFG.theme.Texts, 0, 1)

    surface.SetMaterial(xIcon)
    surface.SetDrawColor(WarningSystem7452em.CFG.theme.Texts)
    surface.DrawTexturedRect(iX + iW * 0.5 - iTotalW * 0.5, iY + iH * 0.525, iH * 0.3, iH * 0.3)
end

function WarningSystem7452em:InitContextMenu()
    WarningSystem7452em.CMenuOkay = true

    properties.Add("warning_system", {
        MenuLabel = "Warning System",
        Order = 999,
        MenuIcon = "icon16/add.png",

        Action = function() end,

        Filter = function( self, ent, ply )
            return IsValid(ent) and ent:IsPlayer()
        end,

        MenuOpen = function(self, pnlMenuOption, pClicked, tTrace)
            local sID = pClicked:SteamID64()
            local pnlMenu = pnlMenuOption:AddSubMenu()

            if WarningSystem7452em:Can(LocalPlayer(), "add_warn") then
                pnlMenu:AddOption(WarningSystem7452em:__("custom_warning"), function()
                    WarningSystem7452em:DisplayWarningMenu(sID)
                end):SetIcon("icon16/cog.png")

                if WarningSystem7452em.CFG.reasons then
                    local pnlReasonsMenu, pnlReasonsMenuIcon = pnlMenu:AddSubMenu(WarningSystem7452em:__("settings_tabs.preset_reasons"))
                    pnlReasonsMenuIcon:SetIcon("icon16/folder.png")

                    for k, v in pairs(WarningSystem7452em.CFG.reasons) do
                        pnlReasonsMenu:AddOption(v.reason, function()
                            WarningSystem7452em:NetStart("WarningSystem7452em:Player:Warn", {
                                target = sID,
                                reason = v.reason,
                                penalty = v.penalty,
                                duration = v.duration
                            })
                        end):SetIcon("icon16/flag_red.png")
                    end
                end
            end

            if WarningSystem7452em:Can(LocalPlayer(), "view_others_warnings") then
                local pnlStatistics, pnlStatisticsIcon = pnlMenu:AddSubMenu(WarningSystem7452em:__("tabs.statistics"))
                pnlStatisticsIcon:SetIcon("icon16/chart_pie.png")

                WarningSystem7452em:NetStart("WarningSystem7452em:Player:GetInfo", {
                    type = "warnings",
                    target = sID
                })

                hook.Add("WarningSystem7452em:Player:InfoReceived", "Warning:Player:" .. pClicked:UserID(), function(sInfo)
                    if( not IsValid(pnlMenu) or not IsValid(pnlStatistics) ) then return end

                    WarningSystem7452em.Users = WarningSystem7452em.Users or {}

                    if( sInfo == "warnings" ) then
                        pnlStatistics:AddOption(WarningSystem7452em:__("penalty_points") .. ": " .. WarningSystem7452em:GetTotalPoints(sID)):SetIcon("icon16/exclamation.png")
                        pnlStatistics:AddOption(WarningSystem7452em:__("active_warnings") .. ": " .. WarningSystem7452em:GetActiveWarnings(sID)):SetIcon("icon16/error.png")
                        pnlStatistics:AddOption(WarningSystem7452em:__("total_warnings") .. ": " .. WarningSystem7452em:GetTotalWarnings(sID)):SetIcon("icon16/error_delete.png")
                    end
                end)

                pnlMenu:AddOption(WarningSystem7452em:__("view_more"), function()
                    if not IsValid(pClicked) then return end
                    if not IsValid(WarningSystem7452em.Menu) then
                        WarningSystem7452em.Menu = vgui.Create("WarningSystem7452em:Menu")
                    end
                    
		    if not IsValid(WarningSystem7452em.Menu) then
			WarningSystem7452em:OpenMenu()					
		    end
							
                    WarningSystem7452em.Menu:LoadContent("my_warnings", pClicked)
                end):SetIcon("icon16/eye.png")
            end
        end,
    })
end

--PATH addons/warning_system/lua/warning_system_7452/client/vgui/components/dscrollpanel.lua:
local PANEL = {}

function PANEL:Init()
    local dvBar = self.VBar

    dvBar:SetHideButtons(true)
    dvBar:SetWide(10)

    function dvBar:Paint()end
    function dvBar.btnGrip:Paint(iW, iH)
        -- draw.RoundedBox(3, 4, 0, 6, iH, color_white)
        draw.RoundedBox(3, 3, 0, iW - 3, iH, self:IsHovered() and WarningSystem7452em.CFG.theme.Main or WarningSystem7452em.CFG.theme.Secondary)
        -- draw.RoundedBox(3, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)
    end

    
    /*
        Edited code from Gigabait
    */
    dvBar.LerpTarget = 0

    function dvBar:AddScroll(dlta)
        local OldScroll = self.LerpTarget or self:GetScroll()
        dlta = dlta * 75
        self.LerpTarget = math.Clamp(self.LerpTarget + dlta, -self.btnGrip:GetTall(), self.CanvasSize + self.btnGrip:GetTall())

        return OldScroll ~= self:GetScroll()
    end

    function dvBar:OnMousePressed(...)
	    local x, y = self:CursorPos()
        local PageSize = self.BarSize

        if ( y > self.btnGrip.y ) then
            self.LerpTarget = self:GetScroll() + PageSize
        else
            self.LerpTarget = self:GetScroll() - PageSize
        end
    end

    dvBar.Think = function(s)
        if s.Dragging then s.LerpTarget = s:GetScroll() return end
        
        local frac = FrameTime() * 5

        if (math.abs(s.LerpTarget - s:GetScroll()) <= (s.CanvasSize / 10)) then
            frac = FrameTime() * 2
        end

        local newpos = Lerp(frac, s:GetScroll(), s.LerpTarget)
        s:SetScroll(math.Clamp(newpos, 0, s.CanvasSize))

        if (s.LerpTarget < 0 and s:GetScroll() <= 0) then
            s.LerpTarget = 0
        elseif (s.LerpTarget > s.CanvasSize and s:GetScroll() >= s.CanvasSize) then
            s.LerpTarget = s.CanvasSize
        end
    end
end

vgui.Register("WarningSystem7452em:DScrollPanel", PANEL, "DScrollPanel")
--PATH lua/autorun/wiltos_animbase_loader.lua:

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
--PATH lua/wos/anim_extension/core/sh_holdtypes.lua:
--[[-------------------------------------------------------------------
	wiltOS Hold Type Register:
		The core files needed to make your own hold types
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

wOS.AnimExtension.HoldTypes = wOS.AnimExtension.HoldTypes or {}
wOS.AnimExtension.TranslateHoldType = wOS.AnimExtension.TranslateHoldType or {}

wOS.AnimExtension.ActIndex = {
	[ "pistol" ] 		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ] 			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ] 		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ] 			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ] 		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]	 		= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ] 		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ] 		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ] 		= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ] 			= ACT_HL2MP_IDLE_SLAM,
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

function wOS.AnimExtension:RegisterHoldtype( data )

	self.TranslateHoldType[ data.HoldType ] = data
    self.HoldTypeMeta:CreateMetaType( self.TranslateHoldType[ data.HoldType ] )
	
	if data.BaseHoldType then
		if prone then
			if prone.animations then
				if prone.animations.WeaponAnims then
					prone.animations.WeaponAnims.moving[ data.HoldType ] = prone.animations.WeaponAnims.moving[ data.BaseHoldType ]
					prone.animations.WeaponAnims.idle[ data.HoldType ] = prone.animations.WeaponAnims.idle[ data.BaseHoldType ]
				end
			end
		end
	end

	print( "[wOS] Registered new Hold Type: " .. data.Name )
	
end

local meta = FindMetaTable( "Player" )
local ENTITY = FindMetaTable( "Entity" )

local AttackTable = {
[ ACT_MP_ATTACK_STAND_PRIMARYFIRE  ] = true,
[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE  ] = true,
[ ACT_MP_ATTACK_STAND_SECONDARYFIRE  ] = true,
[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE  ] = true,
}

local _TranslateWeaponActivity = meta.TranslateWeaponActivity
function meta:TranslateWeaponActivity( act )

	if AttackTable[ act ] then
		local wep = self:GetActiveWeapon()
		if IsValid( wep ) then  
			local holdtype = wep:GetHoldType()
			if wOS.AnimExtension.TranslateHoldType[ holdtype ] then
				local ATTACK_DATA = wOS.AnimExtension.TranslateHoldType[ holdtype ]:GetActData( act )
				if ATTACK_DATA then
					local anim = self:LookupSequence( ATTACK_DATA.Sequence )
					self:AddVCDSequenceToGestureSlot( GESTURE_SLOT_VCD, anim, 0, true ) //Figure out weight to make it balanced!
					self:AnimSetGestureWeight( GESTURE_SLOT_VCD, ATTACK_DATA.Weight or 1 )
				end
			end
		end
	end
	
	return _TranslateWeaponActivity( self, act )

end


-- local _DoAnimationEvent = meta.DoAnimationEvent
-- function meta:DoAnimationEvent( ply, event, data )

-- 	local act = _DoAnimationEvent( self, ply, event, data )
-- 	print( act )
-- 	local wep = self:GetActiveWeapon()
-- 	if IsValid( wep ) then  
-- 		local holdtype = wep:GetHoldType()
-- 		if wOS.AnimExtension.TranslateHoldType[ holdtype ] then
-- 			local result = wOS.AnimExtension.TranslateHoldType[ holdtype ][ act ]
-- 			if result then
-- 				if istable( result ) then
-- 					result = table.Random( result )
-- 				end
-- 				if isstring( result ) then
-- 					local anim = ply:LookupSequence( result )	
-- 					ply.ActOverrider = act
-- 					ply.SequenceTime = CurTime() + ply:SequenceDuration( anim )
-- 				end
-- 			end
-- 		end
-- 	end
	
-- 	return act
-- end

hook.Add( "DoAnimationEvent", "wOS.AnimExtension.CustomTriggers", function( ply, event, data ) 

	local wep = ply:GetActiveWeapon()
	if !IsValid( wep ) then return end
	local holdtype = wep:GetHoldType()
	if !wOS.AnimExtension.TranslateHoldType[ holdtype ] then return end

	local act = 9999
	local crouch = ply:Crouching()
	if event == PLAYERANIMEVENT_RELOAD then
		act = ( crouch and ACT_MP_RELOAD_CROUCH ) or ACT_MP_RELOAD_STAND
	elseif event == PLAYERANIMEVENT_ATTACK_SECONDARY then
		act = ( crouch and ACT_MP_ATTACK_CROUCH_SECONDARYFIRE ) or ACT_MP_ATTACK_STAND_SECONDARYFIRE
	end

	local ATTACK_DATA = wOS.AnimExtension.TranslateHoldType[ holdtype ]:GetActData( act )
	if !ATTACK_DATA then return end

	local anim = ply:LookupSequence( ATTACK_DATA.Sequence )
	ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_VCD, anim, 0, true ) //Figure out weight to make it balanced!
	ply:AnimSetGestureWeight( GESTURE_SLOT_VCD, ATTACK_DATA.Weight or 1 )

	return ACT_INVALID
end )

hook.Add( "Initialize", "wOS.AnimExtension.CustomSequenceHoldtypes", function()

	local _CalcMainActivity = GAMEMODE.CalcMainActivity
	function GAMEMODE:CalcMainActivity( ply, vel )
		
		local act, seq = _CalcMainActivity( self, ply, vel )
		local pr = false
		if prone then
			if ply.IsProne then
				pr = ply:IsProne()
			end
		end

		if not pr then
			local wep = ply:GetActiveWeapon()
			if IsValid( wep ) then  
				local holdtype = wep:GetHoldType()
				if wOS.AnimExtension.TranslateHoldType[ holdtype ] then
					local ATTACK_DATA = wOS.AnimExtension.TranslateHoldType[ holdtype ]:GetActData( act )
					if act == ACT_MP_RUN and ply:KeyDown( IN_SPEED ) then
						ATTACK_DATA = wOS.AnimExtension.TranslateHoldType[ holdtype ]:GetActData( ACT_MP_SPRINT ) or ATTACK_DATA
					end
					if ATTACK_DATA then
						seq = ply:LookupSequence( ATTACK_DATA.Sequence )
					end
				end
			end

			
			if act != ply.LastAct then
				ply:SetCycle( 0 )
			end
		end
		
		ply.LastAct = act
		
		return act, seq
		
	end
	
end )

if SERVER then return end

concommand.Add( "wos_base_help", function( ply, cmd, args )
	MsgC( Color( 255, 255, 255 ), "------------------ ", Color( 133, 173, 219 ), "wiltOS HELP PRINT", Color( 255, 255, 255 ), " ----------------------\n" )
	MsgC( Color( 255, 255, 255 ), "Addon Path Check: " )
	LocalPlayer():ConCommand( "whereis models/m_anm.mdl" )
	timer.Simple( 0.01, function()
	
		MsgC( color_white, "\nPlease ensure the addon path above points to ", Color( 0, 255, 0 ), "'[wOS] Animation Extension - Base'\n")
		MsgC( color_white, "If it does not, unsubscribe to the addon it does point to and get the Animation Base\n")
		print("\n")

		local seq = LocalPlayer():LookupSequence( "_base_wiltos_enabled_" )
		local resp = ( seq >= 0 and Color( 0, 255, 0 ) ) or Color( 255, 0, 0 )
		MsgC( color_white, "Sequence Check: ", resp, "\t", seq, "\n" )
		MsgC( color_white, "If the above sequence check is ", Color( 255, 0, 0 ), -1, color_white, " and the addon above points to the correct location,\nensure your model is a ", Color( 0, 255, 0 ), "PLAYER MODEL", color_white, " and not an ", Color( 255, 0, 0 ), "NPC MODEL\n" )
		MsgC( color_white, "Run this commmand again as a default GMod player model. If it still prints ", Color( 255, 0, 0 ), -1, color_white, " your Animation Base may be outdated\n" )

		print( "\n" )
		MsgC( color_white, "You can find the link here: https://steamcommunity.com/sharedfiles/filedetails/?id=757604550\n")
		MsgC( Color( 255, 255, 255 ), "-----------------------------------------------------------\n" )
	end )
end )
--PATH lua/bricks_server/languages/bricks_server/ukrainian.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "ukrainian", {
    ["search"] = "Знайти",
    ["invalidPlayerProfile"] = "Запрошен неверний профиль игрока!",
    ["unbound"] = "НЕ ЗВЯЗАН",
    ["themes"] = "Теми",
    ["groups"] = "Группи",
    ["general"] = "Основне",
    ["itemWhitelisting"] = "Белий список предметов",
    ["rarities"] = "Раритети",
    ["languages"] = "Мови",
    ["disabled"] = "Вiдключено",
    ["enabled"] = "Вмикнуто",
    ["purchase"] = "Купити",
    ["profile"] = "Профиль",
    ["view"] = "Переглянуты",
    ["admin"] = "AДМIН",
    ["noToolPermission"] = "Нема прав.",
    ["settings"] = "Налаштуваня",
    ["players"] = "Iгроки",
    ["modules"] = "Модулi",

    ["userGroupEditor"] = "Редактор групп iгроков",
    ["addNewGroup"] = "Добавить новую группу",
    ["newUserGroup"] = "Какой должна бить новая группа iгроков?",
    ["groupName"] = "Название",

    ["custom"] = "Свое",
    ["addNew"] = "Добавить новую",
    ["material"] = "Материал",
    ["directImage"] = "Введите URL прямого iзображения ниже.",
    ["default"] = "Стандарт",
    ["selectMaterial"] = "Ви должни вибрать материал!",

    ["errorNoText"] = "ПОМИЛКА: НЕМА ТЕКСТА",
    ["selectOption"] = "Виберите опцiю",
    ["selectValue"] = "Виберите значенiе.",
    ["selectColor"] = "Виберите цвет.",
    ["configSaved"] = "Конфиг сохраненено!",
    ["cmdNoPermission"] = "Нема прав.",
    ["entityPosUpdated"] = "Позицiя entity сохранена.",
    ["noEntitiesSpawned"] = "Нет сохраненних entities.",
    ["xEntitiesSpawned"] = "%d сохранил entities где бил заспавнен.",
    ["error"] = "ERROR",

    ["seconds"] = "%d секунд",
    ["second"] = "%d секунда",
    ["minutes"] = "%d хвилин",
    ["minute"] = "%d хвилини",
    ["hours"] = "%d години",
    ["hour"] = "%d година",

    ["noRarity"] = "Нема редкости",

    ["config"] = "Налаштуваня [Конфиг]",
    ["edit"] = "iзменить",
    ["editColor"] = "iзменить цвет",
    ["editName"] = "iзменить название",
    ["remove"] = "Видалити",
    ["name"] = "Название",
    ["description"] = "Описание",
    ["model"] = "Модель",
    ["icon"] = "Значек",
    ["type"] = "Тiп",
    ["price"] = "Стоимость",
    ["group"] = "Группа",
    ["category"] = "Категорiя",
    ["color"] = "Цвет",
    ["invalidType"] = "Неверний тип.",
    ["invalidOption"] = "Неверна опция.",
    ["invalidChoice"] = "Неверний вибор.",
    ["invalidGroup"] = "Неверная группа.",
    ["invalidPlayer"] = "Неверний игрок.",
    ["true"] = "ВКЛ",
    ["false"] = "ВиКЛ",
    ["noDescription"] = "Нет описания",
    ["other"] = "Остальное",
    ["completed"] = "Виполнено",
    ["close"] = "Закрити",
    ["main"] = "Меню",
    
    ["valueQuery"] = "Що следует %s?",
    ["dataValueQuery"] = "Какие данние должни это?",
    ["newNameQuery"] = "Що следует новому имени?",
    ["newDescriptionQuery"] = "Що следует новому описанию?",
    ["newModelQuery"] = "Що следует новой моделе?",
    ["newIconQuery"] = "Що следует новой иконке?",
    ["newColorQuery"] = "Що следует новому цвету?",
    ["npcTypeQuery"] = "Какой тип этого NPC?",
    ["newTypeQuery"] = "Що следует типу",
    ["groupRequirementQuery"] = "Що следует требованиям группи?",
    ["levelRequirementQuery"] = "Що следует уровню группи?",
    ["newPriceQuery"] = "Що следует новой стоимости?",
    ["newCategoryQuery"] = "Що следует новой категории?",

    ["npcEditor"] = "Настройка NPC [Editor]",
    ["addNPC"] = "Добавить NPC",
    ["newNPC"] = "Новий NPC",

    ["ok"] = "OK",
    ["cancel"] = "Отмена",
    ["save"] = "Сохранить",
    ["confirm"] = "Подтвердить",
    ["nil"] = "NIL",
    ["none"] = "Ничего",
    ["selected"] = "Вибрано",
    ["unselected"] = "Не вибрано",
    ["add"] = "Добавить",

    ["shootyStick"] = "Стрелка!",
    ["permanent"] = "Вечная",
    ["tierX"] = "(Уровень %d)",
    ["someDescription"] = "Некоторое описание.",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Неверний NPC",

    ["disconnected"] = "Отключился",
    ["profileView"] = "Просмотр профиля",
    ["loading"] = "Загрузка",
    ["statistics"] = "Статистика",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Рейтинг пожертвований",
    ["staffRank"] = "Рейтинг персонала",
    ["currentJob"] = "Текущее место работи",
    ["wallet"] = "Бумажник",
    ["level"] = "Уровень",
    ["levelX"] = "Уровень %d",
    ["experience"] = "ОПиТ",
    ["exp"] = "EXP",
    ["money"] = "Деньги",
    ["playerLogs"] = "Логи игрока",
    ["deleteLogs"] = "Видалити логи",
    ["xLogs"] = "%d логи",
    ["xAdminGroups"] = "%d Админ группи",
    ["noUserGroups"] = "Нет групп iгроков",
    ["userGroups"] = "Группи iгроков: %s",
    ["editUserGroups"] = "iзменить группи iгроков",
    ["newGroupColor"] = "Що следует новому цвету группу?",
    ["newGroupName"] = "Какое название новой группи?",
    ["groupAlreadyExists"] = "Эта группа уже существует!",
    ["whitelist"] = "Белий список",
    ["unWhitelist"] = "Искл. iз белого списка",
    ["addCustom"] = "Добавить свое",
    ["entClassWhitelist"] = "Какой класс сущностей ви би хотели добавить в белий список?",
    ["entClassAlreadyOnList"] = "Этот класс сущностей уже есть в списке!",
    ["changesServerRestart"] = "Некоторие iзменения не вступят в силу, пока сервер не будет перезагружен!",
    ["comingSoon"] = "Скоро!",
    ["features"] = "ФУНКЦИИ",
    ["addNewRarity"] = "Добавить новий раритет",
    ["newRarity"] = "Новий раритет",
    ["needToAddRarity"] = "Ви должни сначала добавить тип редкости!",
    ["whatRarityItem"] = "Какой редкости стоит этот предмет?",
    ["invalidRarity"] = "Неверная редкость.",
    ["rarityAlreadyExists"] = "Редкость с таким названием уже существует!",
    ["themeColorX"] = "Тема - Цвет %d",
    ["themeTextColor"] = "Тема - Цвет текста",
    ["presetAccents"] = "Предустановленние акценти",
    ["presetBackgrounds"] = "Предустановленние фони",
    ["resetToBaseThemes"] = "Сбросить тему к стандарту",
    ["resetToCurrentThemes"] = "Сброс к текущим темам",
    ["toggle"] = "Включить",
    ["menu"] = "Меню",
    ["emptyValue"] = "Пустое значение",
    ["newValueQuery"] = "Що следует пустому значению?",
    ["pressKey"] = "НАЖМИТЕ НА A",

    ["entityPlacer"] = "Спавн нового Entity",
    ["invalidEntityType"] = "Неверний тип объекта, виберите правильний iз меню инструментов.",
    ["entityPlaced"] = "Объект успешно размещен.",
    ["entityRemoved"] = "Сущность успешно удалена.",
    ["canOnlyUseToolEntity"] = "Ви можете Iспользовати этот инструмент только для удаления или создания объекта.",
    ["entityType"] = "Entity Тип",
    ["entityPlacerDescription"] = "Размещает и удаляет объекти с сервера Bricks и сохраняет их позиции. Левий щелчок - место. Правий клик - Видалити.",
    ["entityPlacerDescriptionSmall"] = "Размещает и удаляет объекти",
    ["entityPlacerInstructions"] = "Левий клик - разместить, правий клик - Видалити.",

    ["npcPlacer"] = "Установка NPC",
    ["npcPlaced"] = "NPC успешно размещен.",
    ["invalidNPCType"] = "Неверний тип NPC, виберите правильний iз меню инструментов.",
    ["npcRemoved"] = "NPC успешно удален.",
    ["errorNotNPC"] = "Ви можете Iспользовати этот инструмент только для удаления или создания NPC.",
    ["npcPlacerDescription"] = "Размещает и удаляет NPC с сервера Bricks. Щелкните левой кнопкой миши - поместите, щелкните правой кнопкой миши - удалите.",
    ["npcPlacerDescriptionSmall"] = "Размещает и удаляет NPC с сервера Brick.",

    ["inventory"] = "Iнвентар",
    ["player"] = "Iгрок",
    ["drop"] = "Вибросити",
    ["use"] = "Iспользовати",
    ["dropAll"] = "Вибросити все",
    ["delete"] = "Видалити",
} )
--PATH lua/bricks_server/itemtypes/spawned_shipment.lua:
local ITEM = BRICKS_SERVER.Func.CreateItemType( "spawned_shipment" )

ITEM.GetItemData = function( ent )
    local itemData = { "spawned_weapon", ent:GetModel(), CustomShipments[ent:Getcontents()].entity }

    if( CustomShipments[ent:Getcontents()] and CustomShipments[ent:Getcontents()].model ) then
        itemData[2] = CustomShipments[ent:Getcontents()].model or ent:GetModel()
    end
    
    return itemData, (ent:Getcount() or 1)
end

ITEM.OnSpawn = function( ply, pos, itemData, itemAmount )
    local ent = ents.Create( "spawned_weapon" )
    if( not IsValid( ent ) ) then return end
    ent:SetPos( pos )
    ent:SetWeaponClass( itemData[3] )
    ent:Setamount( itemAmount or 1 )
    ent:SetModel( itemData[2] )
    ent:Spawn()
end

ITEM.GetInfo = function( itemData )
    return { (itemData[4] or "Unknown"), (itemData[5] or BRICKS_SERVER.Func.L( "someDescription" )), (BRICKS_SERVER.CONFIG.INVENTORY.ItemRarities or {})[itemData[3] or ""] }
end

ITEM:Register()
--PATH lua/bricks_server/vgui/bricks_server_colsheet.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()
	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( BRICKS_SERVER.DEVCONFIG.MainNavWidth )
	self.Navigation:DockMargin( 0, 0, 0, 0 )
	self.Navigation.Paint = function( self2, w, h )
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, false )
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
end

function PANEL:AddLinebreak()
	local lineBreak = vgui.Create( "DPanel", self.Navigation )
	lineBreak:Dock( TOP )
	lineBreak:DockMargin( 0, 0, 0, 10 )
	lineBreak:SetTall( 5 )
	lineBreak.Paint = function( self2, w, h )
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
		surface.DrawRect( 0, 0, w, h )
	end
end

function PANEL:AddSheet( label, panel, onLoad, icon, color1, color2 )
	if ( !IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Navigation )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:DockMargin( 7, 0, 7, 10 )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( BRICKS_SERVER.Func.ScreenScale( 40 ) )
	Sheet.Button:SetColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( string.upper( label ) )
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	local iconSize = BRICKS_SERVER.Func.ScreenScale( 24 )
	local boxH, boxHMin = 0, 20
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			boxH = math.Clamp( boxH+3, boxHMin, h )
		else
			boxH = math.Clamp( boxH-3, boxHMin, h )
		end

		local textColor = Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 75 )

		if( self2.m_bSelected ) then
			textColor = BRICKS_SERVER.Func.GetTheme( 6 )
		end

		if( boxH > boxHMin ) then
			if( not color1 or not color2 ) then
				draw.RoundedBox( 8, 0, (h/2)-(boxH/2), w, boxH, self2:GetColor() )
			else
				BRICKS_SERVER.Func.DrawGradientRoundedBox( 8, 0, (h/2)-(boxH/2), w, boxH, 0, color1, color2 )
			end
		end

		if( iconMat ) then
			surface.SetDrawColor( textColor )
			surface.SetMaterial( iconMat )
			surface.DrawTexturedRect( 12, (h/2)-(iconSize/2), iconSize, iconSize )
		end

		draw.SimpleText( string.upper( label ), "BRICKS_SERVER_Font23", 12+iconSize+12, h/2-1, textColor, 0, TEXT_ALIGN_CENTER )

		if( Sheet.notifications and Sheet.notifications > 0 ) then
			local nX, nY, nW, nH = h+textX+5, (h/2)-(20/2), 20, 20
			draw.RoundedBox( 5, nX, nY, nW, nH, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
			draw.SimpleText( Sheet.notifications, "BRICKS_SERVER_Font20", nX+(nW/2), nY+(nH/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	end
	Sheet.Button.DoClick = function()
		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false

		if( istable( onLoad ) ) then
			Sheet.Button.onLoad = onLoad[1]
			Sheet.Button.onEntered = onLoad[2]
		else
			Sheet.Button.onLoad = onLoad
		end
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
	
	return Sheet
end

function PANEL:Think()
	for k, v in pairs( self.Items ) do
		if( v.Think ) then
			v.Think()
		end
	end
end

function PANEL:SetActiveButton( active )
	if ( self.ActiveButton == active ) then return end

	if( self.OnSheetChange ) then
		self.OnSheetChange( active )
	end
	
	if ( self.ActiveButton && self.ActiveButton.Target ) then
		local targetPanel = self.ActiveButton.Target
		targetPanel:SetVisible( false )
		targetPanel:SetAlpha( 0 )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
		self.ActiveButton:ColorTo( BRICKS_SERVER.Func.GetTheme( 2 ), 0.2 )
	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active.Target:AlphaTo( 255, 0.2, 0, function() end )
	active:SetSelected( true )
	active:SetToggle( true )
	active:ColorTo( BRICKS_SERVER.Func.GetTheme( 5 ), 0.2 )

	if( active.onLoad and not active.loaded ) then
		active.onLoad()
		active.loaded = true
	elseif( active.onLoad and active.onEntered ) then
		active.onEntered()
	end

	self.Content:InvalidateLayout()
end

function PANEL:SetActiveSheet( sheetLabel )
	if( not sheetLabel ) then return end

	for k, v in pairs( self.Items ) do
		if( v.Button and v.Button.label and v.Button.label == sheetLabel ) then
			self:SetActiveButton( v.Button )
			break
		end
	end
end

derma.DefineControl( "bricks_server_colsheet", "", PANEL, "Panel" )

--PATH lua/bricks_server/vgui/bricks_server_config.lua:
local PANEL = {}

function PANEL:Init()
    hook.Add( "BRS.Hooks.ConfigReceived", self, function()
        if( IsValid( self ) and self.loadedPreviously ) then
            self:FillPanel()
        else
            hook.Remove( "BRS.Hooks.ConfigReceived", self )
        end
    end )
end

function PANEL:FillPanel()
    self.loadedPreviously = true
    self:Clear()

    self.colSheet = vgui.Create( "bricks_server_colsheet_left", self )
    self.colSheet:Dock( FILL )
    self.colSheet.OnNavCollapse = function( name, collapsed )
        BRICKS_SERVER.Func.SetClientCookie( name, "bool", collapsed )
    end
    self.colSheet.OnSheetChange = function( name )
        BRICKS_SERVER.Func.SetClientCookie( "configpage", "string", name )
    end

    self.colSheet:CreateSearchBar()

    BS_ConfigCopyTable = table.Copy( BRICKS_SERVER.CONFIG )
    BS_ConfigsChanged = {}

    local sortedConfig = table.Copy( BRICKS_SERVER.ConfigPages )

    table.SortByMember( sortedConfig, 1, true )

    for k, v in pairs( sortedConfig ) do
        if( v[4] and not v[4]() ) then continue end

        local addonTable = BRICKS_SERVER.DLCMODULES[v[3] or ""] or {}

        local adminConfigPage = vgui.Create( v[2], self.colSheet )
        if( not IsValid( adminConfigPage ) ) then continue end
        adminConfigPage:Dock( FILL )
        adminConfigPage:DockMargin( (adminConfigPage.margin or 10), (adminConfigPage.margin or 10), (adminConfigPage.margin or 10), (adminConfigPage.margin or 10) )
        if( adminConfigPage.FillPanel ) then
            self.colSheet:AddSheet( v[1], adminConfigPage, false, function() 
                adminConfigPage:FillPanel()
            end, addonTable.Name, addonTable.Color )

            hook.Add( "BRS.Hooks.RefreshConfig", "BRS.Hooks.RefreshConfig." .. tostring( adminConfigPage ), function()
                if( IsValid( adminConfigPage ) and adminConfigPage.RefreshPanel ) then
                    adminConfigPage.RefreshPanel()
                end
            end )
        else
            self.colSheet:AddSheet( v[1], adminConfigPage, false, false, addonTable.Name, addonTable.Color )
        end
    end

    self.colSheet:FinishAddingSheets()

    for k, v in pairs( self.colSheet.Categories ) do
        if( BRICKS_SERVER.Func.GetClientCookie( v:GetLabel(), "bool" ) ) then
            v:SetExpanded( false )
        end
    end

    self.colSheet:SetActiveSheet( BRICKS_SERVER.Func.GetClientCookie( "configpage", "string" ) )
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config", PANEL, "bricks_server_colsheet_left" )
--PATH lua/bricks_server/vgui/bricks_server_dmenuoptioncvar.lua:

local PANEL = {}

DEFINE_BASECLASS( "bricks_server_dmenuoption" )

AccessorFunc( PANEL, "m_strConVar", "ConVar" )
AccessorFunc( PANEL, "m_strValueOn", "ValueOn" )
AccessorFunc( PANEL, "m_strValueOff", "ValueOff" )

function PANEL:Init()

	self:SetChecked( false )
	self:SetIsCheckable( true )

	self:SetValueOn( "1" )
	self:SetValueOff( "0" )

end

function PANEL:Think()

	if ( !self.m_strConVar ) then return end
	local strValue = GetConVarString( self.m_strConVar )

	self:SetChecked( strValue == self.m_strValueOn )

end

function PANEL:OnChecked( b )

	if ( !self.m_strConVar ) then return end

	if ( b ) then
		RunConsoleCommand( self.m_strConVar, self.m_strValueOn )
	else
		RunConsoleCommand( self.m_strConVar, self.m_strValueOff )
	end

end

derma.DefineControl( "bricks_server_dmenuoptioncvar", "", PANEL, "bricks_server_dmenuoption" )

--PATH lua/bricks_server/modules/default/submodules/currencies/client/cl_currency_system.lua:
BRICKS_SERVER.Func.AddConfigPage( "Currencies", "bricks_server_config_currencies" )
BRICKS_SERVER.Func.AddAdminPlayerFunc( "Currency", "Set", function( ply ) 
	local options = {}
	for k, v in pairs( (BRICKS_SERVER.CONFIG.CURRENCIES or {}) ) do
		options[k] = v.Name
	end
	BRICKS_SERVER.Func.ComboRequest( "Admin", "What currency would you like to set?", 1, options, function( value, data ) 
		if( BRICKS_SERVER.CONFIG.CURRENCIES[data] ) then
			BRICKS_SERVER.Func.StringRequest( "Admin", "How much would you like their currency to?", 0, function( text ) 
				if( isnumber( tonumber( text ) ) ) then
					RunConsoleCommand( "setcurrency", ply:SteamID64(), data, text )
				else
					notification.AddLegacy( "Invalid number.", 1, 3 )
				end
			end, function() end, "OK", "Cancel", true )
		else
			notification.AddLegacy( "Invalid currency.", 1, 3 )
		end
	end, function() end, "OK", "Cancel" )
end )
BRICKS_SERVER.Func.AddAdminPlayerFunc( "Currency", "Add", function( ply ) 
	local options = {}
	for k, v in pairs( (BRICKS_SERVER.CONFIG.CURRENCIES or {}) ) do
		options[k] = v.Name
	end
	BRICKS_SERVER.Func.ComboRequest( "Admin", "What currency would you like to add?", 1, options, function( value, data ) 
		if( BRICKS_SERVER.CONFIG.CURRENCIES[data] ) then
			BRICKS_SERVER.Func.StringRequest( "Admin", "How much would you like to add?", 0, function( text ) 
				if( isnumber( tonumber( text ) ) ) then
					RunConsoleCommand( "addcurrency", ply:SteamID64(), data, text )
				else
					notification.AddLegacy( "Invalid number.", 1, 3 )
				end
			end, function() end, "OK", "Cancel", true )
		else
			notification.AddLegacy( "Invalid currency.", 1, 3 )
		end
	end, function() end, "OK", "Cancel" )
end )

BRS_CURRENCIES = BRS_CURRENCIES or {}
net.Receive( "BRS.Net.SetCurrencies", function()
	local currenciesTable = net.ReadTable()

	BRS_CURRENCIES = currenciesTable or {}

	if( IsValid( BRICKS_SERVER_F4 ) and BRICKS_SERVER_F4:IsVisible() and BRICKS_SERVER_F4.FillProfile ) then
		BRICKS_SERVER_F4.FillProfile()
	end
end )

function BRICKS_SERVER.Func.CreateCurrencyEditor( currencyKey, oldCurrencyTable, onSave, onCancel )
	BS_CURRENCY_EDITOR = vgui.Create( "DFrame" )
	BS_CURRENCY_EDITOR:SetSize( ScrW(), ScrH() )
	BS_CURRENCY_EDITOR:Center()
	BS_CURRENCY_EDITOR:SetTitle( "" )
	BS_CURRENCY_EDITOR:ShowCloseButton( false )
	BS_CURRENCY_EDITOR:SetDraggable( false )
	BS_CURRENCY_EDITOR:MakePopup()
	BS_CURRENCY_EDITOR:SetAlpha( 0 )
	BS_CURRENCY_EDITOR:AlphaTo( 255, 0.1, 0 )
	BS_CURRENCY_EDITOR.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local backPanel = vgui.Create( "DPanel", BS_CURRENCY_EDITOR )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local currencyTable = table.Copy( oldCurrencyTable )

	local textArea

	local actions = {
		[1] = { "Name", Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( "Admin", "What should the new name be?", currencyTable.Name, function( text ) 
				currencyTable.Name = text
			end, function() end, "OK", "Cancel", false )
		end, "Name" },
		[2] = { "Prefix", Material( "materials/bricks_server/currency.png" ), function()
			BRICKS_SERVER.Func.StringRequest( "Admin", "What should the prefix be?", currencyTable.Prefix or "", function( text ) 
				if( currencyTable.Prefix and text == "" ) then
					currencyTable.Prefix = nil
					return
				end

				currencyTable.Prefix = text
			end, function() end, "OK", "Cancel", false )
		end, "Prefix" },
		[3] = { "Suffix", Material( "materials/bricks_server/currency.png" ), function()
			BRICKS_SERVER.Func.StringRequest( "Admin", "What should the suffix be?", currencyTable.Suffix or "", function( text ) 
				if( currencyTable.Suffix and text == "" ) then
					currencyTable.Suffix = nil
					return
				end

				currencyTable.Suffix = text
			end, function() end, "OK", "Cancel", false )
		end, "Suffix" }
	}

	function backPanel.FillOptions()
		backPanel:Clear()

		textArea = vgui.Create( "DPanel", backPanel )
		textArea:Dock( TOP )
		textArea:DockMargin( 10, 10, 10, 0 )
		textArea:SetTall( 30 )
		textArea.Paint = function( self2, w, h ) 
			draw.SimpleText( "Currency Editor", "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end

		for k, v in ipairs( actions ) do
			local actionButton = vgui.Create( "DButton", backPanel )
			actionButton:SetText( "" )
			actionButton:Dock( TOP )
			actionButton:DockMargin( 10, 10, 10, 0 )
			actionButton:SetTall( 40 )
			local changeAlpha = 0
			actionButton.Paint = function( self2, w, h )
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
				end
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
				surface.SetAlphaMultiplier( 1 )

				if( v[2] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( v[2] )
					local iconSize = 24
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				if( v[4] and currencyTable[v[4]] and not v[5] ) then
					draw.SimpleText( v[1] .. " - " .. string.sub( currencyTable[v[4]], 1, 20 ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				elseif( v[5] and isfunction( v[5] ) ) then
					draw.SimpleText( v[1] .. " - " .. v[5](), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( v[1], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
			actionButton.DoClick = function()
				if( v[3] ) then
					v[3]()
				end
			end
		end

		local buttonPanel = vgui.Create( "DPanel", backPanel )
		buttonPanel:Dock( BOTTOM )
		buttonPanel:DockMargin( 10, 10, 10, 10 )
		buttonPanel:SetTall( 40 )
		buttonPanel.Paint = function( self2, w, h ) end

		local leftButton = vgui.Create( "DButton", buttonPanel )
		leftButton:Dock( LEFT )
		leftButton:SetText( "" )
		leftButton:DockMargin( 0, 0, 0, 0 )
		local changeAlpha = 0
		leftButton.Paint = function( self2, w, h )
			if( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )

			surface.SetAlphaMultiplier( changeAlpha/255 )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen )
			surface.SetAlphaMultiplier( 1 )

			draw.SimpleText( "Save", "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		leftButton.DoClick = function()
			onSave( currencyTable )

			BS_CURRENCY_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_CURRENCY_EDITOR ) ) then
					BS_CURRENCY_EDITOR:Remove()
				end
			end )
		end

		local rightButton = vgui.Create( "DButton", buttonPanel )
		rightButton:Dock( RIGHT )
		rightButton:SetText( "" )
		rightButton:DockMargin( 0, 0, 0, 0 )
		local changeAlpha = 0
		rightButton.Paint = function( self2, w, h )
			if( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )

			surface.SetAlphaMultiplier( changeAlpha/255 )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed )
			surface.SetAlphaMultiplier( 1 )

			draw.SimpleText( "Cancel", "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		rightButton.DoClick = function()
			onCancel()

			BS_CURRENCY_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_CURRENCY_EDITOR ) ) then
					BS_CURRENCY_EDITOR:Remove()
				end
			end )
		end

		backPanel:SetSize( (2*10)+(2*150)+80, buttonPanel:GetTall()+(4*10)+textArea:GetTall()+(#actions*50) )
		backPanel:Center()

		leftButton:SetWide( (backPanel:GetWide()-30)/2 )
		rightButton:SetWide( (backPanel:GetWide()-30)/2 )
	end
	backPanel.FillOptions()
end

hook.Add( "BRS.Hooks.ConfigReceived", "BRS.Hooks.ConfigReceived.Currencies", function( configUnCompressed )
    if( configUnCompressed.CURRENCIES and BRICKS_SERVER.LoadCurrencies ) then
        BRICKS_SERVER.LoadCurrencies()
    end
end )
--PATH addons/sl_main_system/lua/autorun/client/cl_banque.lua:
print("banque")

net.Receive("SL:OpenBanque", function(len, ply)
    OpenBanque()
end)

function OpenBanque()
    if LocalPlayer():GetNWBool("Transforme", false) then
        LocalPlayer():ChatPrint("Vous ne pouvez pas ouvrir votre inventaire quand vous êtes transformé !")
        return
    end

    if LocalPlayer():GetNWInt("AchatBanque") == true then
        surface.PlaySound("buttons/button15.wav")

        local inventoryItems = {}
        local bankItems = {}

        local Frame_Inventaire = vgui.Create("DFrame")
        Frame_Inventaire:SetPos(W(0), H(0))
        Frame_Inventaire:SetSize(W(1920), H(1080))
        Frame_Inventaire:SetTitle("")
        Frame_Inventaire:MakePopup()
        Frame_Inventaire:SetDraggable(false)
        Frame_Inventaire:ShowCloseButton(false)
        Frame_Inventaire:SetAlpha(0)
        Frame_Inventaire:AlphaTo(255, 1, 0)
        Frame_Inventaire.Paint = function(self, w, h)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(Material("mad_sololeveling/banque3.png"))
            surface.DrawTexturedRect(0, 0, w, h)

            local nbInventory = #inventoryItems
            local nbBank = #bankItems
            if LocalPlayer():GetNWString("Classe") == "porteur" then
                draw.DrawText("Items max : " .. nbInventory .. "/40", "MNew_Font1", W(762), H(905), Color(255, 255, 255), TEXT_ALIGN_LEFT)
            elseif LocalPlayer():GetUserGroup() == "vip" then
                draw.DrawText("Items max : " .. nbInventory .. "/10", "MNew_Font1", W(762), H(905), Color(255, 255, 255), TEXT_ALIGN_LEFT)
            else
                draw.DrawText("Items max : " .. nbInventory .. "/8", "MNew_Font1", W(762), H(905), Color(255, 255, 255), TEXT_ALIGN_LEFT)
            end

            draw.DrawText("Items max : " .. nbBank .. "/15", "MNew_Font1", W(998), H(905), Color(255, 255, 255), TEXT_ALIGN_LEFT)
        end

        local CloseB = vgui.Create("DButton", Frame_Inventaire)
        CloseB:SetText("")
        CloseB:SetPos(W(1489), H(192))
        CloseB:SetSize(W(34), H(32))
        CloseB.DoClick = function()
            if IsValid(Frame_Inventaire) then
                timer.Destroy("IconUpdate" .. LocalPlayer():SteamID64())
                Frame_Inventaire:Remove()
            end
        end
        CloseB.Paint = function() end

        local InvGrid = vgui.Create("DGrid", Frame_Inventaire)
        InvGrid:SetPos(W(473), H(360))
        InvGrid:SetSize(W(480), H(540))
        InvGrid:SetCols(5)
        InvGrid:SetColWide(W(97))
        InvGrid:SetRowHeight(H(97))

        local InvBankGrid = vgui.Create("DGrid", Frame_Inventaire)
        InvBankGrid:SetPos(W(993), H(360))
        InvBankGrid:SetSize(W(480), H(540))
        InvBankGrid:SetCols(5)
        InvBankGrid:SetColWide(W(97))
        InvBankGrid:SetRowHeight(H(97))

        for k, v in pairs(INV_SL) do
            if sl_data and sl_data[k] and sl_data[k] >= 1 then
                table.insert(inventoryItems, k)
            end
            if sl_data7 and sl_data7[k] and sl_data7[k] >= 1 then
                table.insert(bankItems, k)
            end
        end

        local function RefreshInventory()
            InvGrid:Clear()
            InvBankGrid:Clear()

            for _, k in ipairs(inventoryItems) do
                local v = INV_SL[k]
                local InvBut = CreateInventoryButton(k, v, true)
                if sl_data and sl_data[k] and sl_data[k] > 0 then
                    InvGrid:AddItem(InvBut)
                end
            end

            for _, k in ipairs(bankItems) do
                local v = INV_SL[k]
                local InvBut = CreateInventoryButton(k, v, false)
                if sl_data7 and sl_data7[k] and sl_data7[k] > 0 then
                    InvBankGrid:AddItem(InvBut)
                end
            end
        end

        function CreateInventoryButton(k, v, isInventory)
            local InvBut
            if string.StartWith(v.type, "item") then
                InvBut = vgui.Create("DImage")

                local breen_img = vgui.Create("DImage", InvBut)
                breen_img:SetPos(0, 0)
                breen_img:SetSize(W(87), H(87))
                breen_img:SetImage("mad_sololeveling/menu/new/casse")
                breen_img.Paint = function(self, w, h)
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.SetMaterial(Material("mad_sololeveling/menu/new/casse.png"))
                    surface.DrawTexturedRect(W(-5), H(-5), W(90), H(90))
                end

                local imageMap = {
                    ["Crystal Blanc"] = "mad_sololeveling/crystal_icon.png",
                    ["Crystal Bleu"] = "mad_sololeveling/crystal_icon2.png",
                    ["Crystal Rouge"] = "mad_sololeveling/crystal_icon3.png",
                    ["Crystal Violet"] = "mad_sololeveling/crystal_icon4.png",
                    ["Minerai de Mana"] = "mad_sololeveling/minerai.png"
                }

                InvBut:SetImage(imageMap[v.name] or "mad_sololeveling/crystal_icon.png")
                InvBut:SetSize(W(87), H(70))
            else
                InvBut = vgui.Create("DModelPanel")

                local breen_img = vgui.Create("DImage", InvBut)
                breen_img:SetPos(0, 0)
                breen_img:SetSize(W(87), H(87))
                breen_img:SetImage("mad_sololeveling/menu/new/casse")
                breen_img.Paint = function(self, w, h)
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.SetMaterial(Material("mad_sololeveling/menu/new/casse.png"))
                    surface.DrawTexturedRect(W(-5), H(-5), W(90), H(90))
                end

                if v.type == "armure" then
                    local model = (LocalPlayer():GetNWInt("Genre") == "male") and v.playermodel_male or v.playermodel_female
                    InvBut:SetModel(model)
                else
                    InvBut:SetModel(v.model)
                end

                InvBut:GetEntity():SetAngles(Angle(0, 0, 0))
                InvBut:GetEntity():SetModelScale(v.scale * 2)
                function InvBut:LayoutEntity(ent) end

                InvBut:SetText(v.name)
                InvBut:SetTooltip(v.name)
                InvBut:SetTextColor(Color(255, 255, 255))

                InvBut:SetFont("M_Font3")
                InvBut:SetLookAt(InvBut:GetEntity():GetPos())
                InvBut:SetFOV((v.type == "armure") and 20 or 50)
                InvBut:SetSize(W(87), H(87))
            end

            InvBut:SetContentAlignment(2)
            InvBut.InternalValue = k

            local DLabel = vgui.Create("DLabel", InvBut)
            if isInventory then
                DLabel:SetText(sl_data and sl_data[k] or "")
            else
                DLabel:SetText(sl_data7 and sl_data7[k] or "")
            end
            DLabel:SetPos(W(68), 0)
            DLabel:SetFont("M_Font3")

            InvBut:Droppable("InventoryItem")

            InvBut.OnStopDragging = function(self)
                local mx, my = gui.MousePos()

                if mx >= W(473) and mx <= W(953) and my >= H(360) and my <= H(900) then
                    net.Start("SL:Mad - Inv:RetirerDeLaBanque")
                    net.WriteString(self.InternalValue)
                    net.SendToServer()

                    if IsValid(Frame_Inventaire) then
                        Frame_Inventaire:Remove()
                    end
                elseif mx >= W(993) and mx <= W(1473) and my >= H(360) and my <= H(900) then
                    net.Start("SL:Mad - Inv:AjouterALaBanque")
                    net.WriteString(self.InternalValue)
                    net.SendToServer()

                    if IsValid(Frame_Inventaire) then
                        Frame_Inventaire:Remove()
                    end
                end

                RefreshInventory()
            end

            return InvBut
        end

        RefreshInventory()
    else

        local Frame_Inventaire = vgui.Create("DFrame")
        Frame_Inventaire:SetPos(W(0), H(0))
        Frame_Inventaire:SetSize(W(1920), H(1080))
        Frame_Inventaire:SetTitle("")
        Frame_Inventaire:MakePopup()
        Frame_Inventaire:SetDraggable(false)
        Frame_Inventaire:ShowCloseButton(false)
        Frame_Inventaire:SetAlpha(0)
        Frame_Inventaire:AlphaTo(255, 1, 0)
        Frame_Inventaire.Paint = function(self, w, h)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(Material("mad_sololeveling/banque5.png"))
            surface.DrawTexturedRect(0, 0, w, h)

            draw.DrawText("PRIX : 100M ₩", "MNew_Font1", W(875), H(625), Color(255, 255, 255), TEXT_ALIGN_LEFT)
        end

        local CloseB = vgui.Create("DButton", Frame_Inventaire)
        CloseB:SetText("")
        CloseB:SetPos(W(1432), H(220))
        CloseB:SetSize(W(28), H(34))
        CloseB.DoClick = function()
            if IsValid(Frame_Inventaire) then
                timer.Destroy("IconUpdate" .. LocalPlayer():SteamID64())
                Frame_Inventaire:Remove()
            end
        end
        CloseB.Paint = function() end

        local AcheterB = vgui.Create("DButton", Frame_Inventaire)
        AcheterB:SetText("")
        AcheterB:SetPos(W(840), H(680))
        AcheterB:SetSize(W(240), H(80))
        AcheterB.DoClick = function()

            if LocalPlayer():getDarkRPVar("money") < 100000000 then LocalPlayer():ChatPrint("Vous n'avez pas assez d'argent pour acheter un coffre") return end

            net.Start("SL:Mad - Inv:AchatBanque")
            net.SendToServer()

            if IsValid(Frame_Inventaire) then
                timer.Destroy("IconUpdate" .. LocalPlayer():SteamID64())
                Frame_Inventaire:Remove()
            end
        end
        AcheterB.Paint = function() end

    end
end

--PATH addons/sl_main_system/lua/autorun/client/cl_charactercreator.lua:
local function W(x) return x * ScrW() / 1920 end
local function H(y) return y * ScrH() / 1080 end
net.Receive("SL:Mad - Character:SendClient_1", function(ply) 

  data_1 = net.ReadTable()

end)

net.Receive("SL:Mad - Character:SendClient_2", function(ply) 

  data_2 = net.ReadTable()

end)

net.Receive("SL:Mad - Character:SendClient_3", function(ply) 

  data_3 = net.ReadTable()

end)
local BvnotifImg = Material("Alerte.png")
local BvFond = Material("fond_alerte.png")
local timerCreaImg = Material("Alerte Creation personnage.png")
local fonc_crea = Material("fond_crea.png")
local crea_perso = Material("crea_personnage.png")
local homme = Material("Vcx.png")
local femme = Material("VF.png")
local suivant = Material("suivant.png")
local suivant_hover = Material("suivant_hover.png")
local check = Material("check.png")
local check_hover = Material("check_hover.png")
local Goatimg = Material('GOAL.png')
local ColorButton = Material("colorButton.png")
net.Receive("SL:OpenCharacterCreatorMenu", function( len, ply )
  isAnimating = true
  LocalPlayer():EmitSound("notif_sl.wav")
  local fond_alerte = vgui.Create("DFrame")
  fond_alerte:SetSize(W(1920),H(1080))
  fond_alerte:ShowCloseButton(false)
  fond_alerte:SetTitle("")
  fond_alerte:SetDraggable(false)
  fond_alerte.Paint = function(self,w,h)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(BvFond)
    surface.DrawTexturedRect(0, 0, w, h)
  end
  local Bvnotif = vgui.Create("DFrame",fond_alerte)
  Bvnotif:SetTitle("")
  Bvnotif:MakePopup(true)
  Bvnotif:SetSize(0,0)
  Bvnotif:ShowCloseButton(false)
  Bvnotif.Paint = function(ply,w,h)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(BvnotifImg)
    surface.DrawTexturedRect(0, 0, w, h)
  end
  Bvnotif:SizeTo(W(700),H(412),1.8,0,.1,function()
    isAnimating = false
  end)
  Bvnotif.Think = function(me)
    if isAnimating then
      me:Center()
    end
  end
  
  local closebt = vgui.Create("DButton", Bvnotif)
  closebt:SetSize(W(50),H(50))
  closebt:SetPos(W(605),H(25))
  closebt:SetText("")
  closebt.Paint = function(self,w,h)
    if closebt:IsHovered() then
      draw.SimpleText("X","CloseCaption_Bold",h/2,0,Color(168,48,48),TEXT_ALIGN_CENTER)
    else
      draw.SimpleText("X","CloseCaption_Bold",h/2,0,Color(255,255,255),TEXT_ALIGN_CENTER)
    end
  end
  closebt.DoClick = function()
    if data_1 == "nil" then
      LocalPlayer():SetNWInt("Perso1", "no")
    elseif data_2 == "nil" then
      LocalPlayer():SetNWInt("Perso2", "no")
    elseif data_3 == "nil" then
      LocalPlayer():SetNWInt("Perso3", "no")
    end
    
    if LocalPlayer():GetNWInt("Perso1") == "no" then
      Bvnotif:Remove()
      isAnimating = true
      TimeLeft = 10 
      local delay = 0
      LocalPlayer():EmitSound("notif_sl.wav")
      local timerCrea = vgui.Create("DFrame",fond_alerte)
      timerCrea:SetSize(0,0)
      timerCrea:Center()
      timerCrea:MakePopup()
      timerCrea:SetTitle("")
      timerCrea:ShowCloseButton(false)
      timerCrea.Paint = function(ply,w,h)
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(timerCreaImg)
        surface.DrawTexturedRect(0, 0, w, h)
        if TimeLeft > 3 then
          couleur = Color(255,255,255)
        else
          couleur = Color(255,0,0)
        end
        draw.SimpleText(TimeLeft,"CloseCaption_Bold",w/1.75, h-80,couleur)
        if CurTime() < delay then return end
          TimeLeft = TimeLeft - 1
          delay = CurTime() + 1
      end
      timerCrea:SizeTo(W(684),H(736),1.8,0,.1,function()
        isAnimating = false
      end)
      timerCrea.Think = function(me)
        if isAnimating then
          me:Center()
        end
      end
      timer.Simple(TimeLeft,function()
        fond_alerte:Remove()
        MenuCharacterCreator(1)
        LocalPlayer():EmitSound("notif_sl.wav")
      end)
    else
      fond_alerte:Remove()
      net.Start("SL:Mad - Character:Load")
      net.WriteFloat(1)
      net.SendToServer()
    end
  end
end)

function CharacterCreatorMenu()
  net.Start("SL:Mad - Character:Reload")
  net.SendToServer()

  if data_1 == "nil" then
    LocalPlayer():SetNWInt("Perso1", "no")
  elseif data_2 == "nil" then
    LocalPlayer():SetNWInt("Perso2", "no")
  elseif data_3 == "nil" then
    LocalPlayer():SetNWInt("Perso3", "no")
  end

  local CharacterCreator = vgui.Create("DFrame")
  CharacterCreator:SetPos(W(0), H(0))
  CharacterCreator:SetSize(W(1920), H(1080))
  CharacterCreator:SetTitle("")
  CharacterCreator:MakePopup()
  CharacterCreator:SetDraggable(false)
  CharacterCreator:ShowCloseButton(false)
  CharacterCreator:SetAlpha(0)
  CharacterCreator:AlphaTo(255, 1, 0)
  CharacterCreator.Paint = function( s, self, w, h )
  surface.SetDrawColor(255, 255, 255, 255)
  surface.SetMaterial(Material("mad_sololeveling/menu/charactercreator/menu.png"))
  surface.DrawTexturedRect(W(0),H(0),W(1920),H(1080))
  end

  if LocalPlayer():GetNWInt("Perso1") == "no" then
    local CharacterOne = vgui.Create("DImage", CharacterCreator)	
    CharacterOne:SetPos(W(700), H(100))	
    CharacterOne:SetSize(W(520), H(860))
    CharacterOne:SetImage( "mad_sololeveling/menu/charactercreator/creer.png" )

    CharacterOne_Icon = vgui.Create( "DModelPanel", CharacterCreator )
    CharacterOne_Icon:SetSize(W(520),H(860))
    CharacterOne_Icon:SetPos(W(700),H(50))
    CharacterOne_Icon:SetFOV(50)
    CharacterOne_Icon:SetColor(Color(0, 0, 0))
    CharacterOne_Icon:SetModel( "models/mad_models/mad_sl_male_civil1.mdl" )

    local CharacterOne_Button = vgui.Create( "DButton", CharacterCreator )
    CharacterOne_Button:SetText( "" )
    CharacterOne_Button:SetPos( W(760), H(860) )
    CharacterOne_Button:SetSize( W(400), H(80) )
    CharacterOne_Button.Paint = function( s, self, w, h )
    CharacterOne_Button.DoClick = function()
      if IsValid(CharacterCreator) then CharacterCreator:Remove() end
      MenuCharacterCreator(1)
      end
    end

    else
    local CharacterOne = vgui.Create("DImage", CharacterCreator)	
    CharacterOne:SetPos(W(700), H(100))	
    CharacterOne:SetSize(W(520), H(860))
    CharacterOne:SetImage( "mad_sololeveling/menu/charactercreator/jouer.png" )

    CharacterOne_Icon = vgui.Create( "DModelPanel", CharacterCreator )
    CharacterOne_Icon:SetSize(W(520),H(860))
    CharacterOne_Icon:SetPos(W(700),H(10))
    CharacterOne_Icon:SetFOV(50)
    CharacterOne_Icon:SetModel( data_1.sl_model )

    if data_1.sl_genre == "male" then
      CharacterOne_Icon.Entity:SetBodygroup(3, data_1.sl_cheveux)
    else
      CharacterOne_Icon.Entity:SetBodygroup(2, data_1.sl_cheveux)
    end

    CharacterOne_Icon.Entity:SetSkin(data_1.sl_yeux)
    function CharacterOne_Icon.Entity:GetPlayerColor() return (LocalPlayer():GetPlayerColor()) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

    local CharacterOne_Button = vgui.Create( "DButton", CharacterCreator )
    CharacterOne_Button:SetText( "" )
    CharacterOne_Button:SetPos( W(760), H(860) )
    CharacterOne_Button:SetSize( W(400), H(80) )
    CharacterOne_Button.Paint = function( s, self, w, h )
    CharacterOne_Button.DoClick = function()
      if IsValid(CharacterCreator) then CharacterCreator:Remove() end
      net.Start("SL:Mad - Character:Load")
      net.WriteFloat(1)
      net.SendToServer()
    end
  end

  end

  if LocalPlayer():GetUserGroup() == "vip" or LocalPlayer():GetUserGroup() == "admin" or LocalPlayer():GetUserGroup() == "superadmin" then

  if LocalPlayer():GetNWInt("Perso2") == "no" then
    local CharacterTwo = vgui.Create("DImage", CharacterCreator)	
    CharacterTwo:SetPos(W(80), H(100))	
    CharacterTwo:SetSize(W(520), H(860))
    CharacterTwo:SetImage( "mad_sololeveling/menu/charactercreator/creer.png" )

    CharacterTwo_Icon = vgui.Create( "DModelPanel", CharacterCreator )
    CharacterTwo_Icon:SetSize(W(520),H(860))
    CharacterTwo_Icon:SetPos(W(100),H(50))
    CharacterTwo_Icon:SetFOV(50)
    CharacterTwo_Icon:SetColor(Color(0, 0, 0))
    CharacterTwo_Icon:SetModel( "models/mad_models/mad_sl_male_civil1.mdl" )

    local CharacterTwo_Button = vgui.Create( "DButton", CharacterCreator )
    CharacterTwo_Button:SetText( "" )
    CharacterTwo_Button:SetPos( W(140), H(860) )
    CharacterTwo_Button:SetSize( W(400), H(80) )
    CharacterTwo_Button.Paint = function( s, self, w, h )
    CharacterTwo_Button.DoClick = function()
      if IsValid(CharacterCreator) then CharacterCreator:Remove() end
      MenuCharacterCreator(2)
      end
    end

    else
      
    local CharacterTwo = vgui.Create("DImage", CharacterCreator)	
    CharacterTwo:SetPos(W(80), H(100))	
    CharacterTwo:SetSize(W(520), H(860))
    CharacterTwo:SetImage( "mad_sololeveling/menu/charactercreator/jouer.png" )

    CharacterTwo_Icon = vgui.Create( "DModelPanel", CharacterCreator )
    CharacterTwo_Icon:SetSize(W(520),H(860))
    CharacterTwo_Icon:SetPos(W(80),H(50))
    CharacterTwo_Icon:SetFOV(50)
    CharacterTwo_Icon:SetModel( data_2.sl_model )

    if data_2.sl_genre == "male" then
      CharacterTwo_Icon.Entity:SetBodygroup(3, data_2.sl_cheveux)
    else
      CharacterTwo_Icon.Entity:SetBodygroup(2, data_2.sl_cheveux)
    end

    CharacterTwo_Icon.Entity:SetSkin(data_2.sl_yeux)
    function CharacterTwo_Icon.Entity:GetPlayerColor() return (LocalPlayer():GetPlayerColor()) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

    local CharacterTwo_Button = vgui.Create( "DButton", CharacterCreator )
    CharacterTwo_Button:SetText( "" )
    CharacterTwo_Button:SetPos( W(140), H(860) )
    CharacterTwo_Button:SetSize( W(400), H(80) )
    CharacterTwo_Button.Paint = function( s, self, w, h )
      CharacterTwo_Button.DoClick = function()
      if IsValid(CharacterCreator) then CharacterCreator:Remove() end
      net.Start("SL:Mad - Character:Load")
      net.WriteFloat(2)
      net.SendToServer()
    end

    
    end
  end

  if LocalPlayer():GetNWInt("Perso3") == "no" then
    local CharacterThree = vgui.Create("DImage", CharacterCreator)	
    CharacterThree:SetPos(W(1318), H(100))	
    CharacterThree:SetSize(W(520), H(860))
    CharacterThree:SetImage( "mad_sololeveling/menu/charactercreator/creer.png" )

    CharacterThree_Icon = vgui.Create( "DModelPanel", CharacterCreator )
    CharacterThree_Icon:SetSize(W(520),H(860))
    CharacterThree_Icon:SetPos(W(1318),H(50))
    CharacterThree_Icon:SetFOV(50)
    CharacterThree_Icon:SetColor(Color(0, 0, 0))
    CharacterThree_Icon:SetModel( "models/mad_models/mad_sl_male_civil1.mdl" )

    local CharacterThree_Button = vgui.Create( "DButton", CharacterCreator )
    CharacterThree_Button:SetText( "" )
    CharacterThree_Button:SetPos( W(1380), H(860) )
    CharacterThree_Button:SetSize( W(400), H(80) )
    CharacterThree_Button.Paint = function( s, self, w, h )
    CharacterThree_Button.DoClick = function()
      if IsValid(CharacterCreator) then CharacterCreator:Remove() end
      MenuCharacterCreator(3)
      end
    end

    else
    local CharacterThree = vgui.Create("DImage", CharacterCreator)	
    CharacterThree:SetPos(W(1318), H(100))	
    CharacterThree:SetSize(W(520), H(860))
    CharacterThree:SetImage( "mad_sololeveling/menu/charactercreator/jouer.png" )

    CharacterThree_Icon = vgui.Create( "DModelPanel", CharacterCreator )
    CharacterThree_Icon:SetSize(W(520),H(860))
    CharacterThree_Icon:SetPos(W(1318),H(50))
    CharacterThree_Icon:SetFOV(50)
    CharacterThree_Icon:SetModel( data_3.sl_model )

    if data_3.sl_genre == "male" then
      CharacterThree_Icon.Entity:SetBodygroup(3, data_3.sl_cheveux)
    else
      CharacterThree_Icon.Entity:SetBodygroup(2, data_3.sl_cheveux)
    end

    CharacterThree_Icon.Entity:SetSkin(data_3.sl_yeux)
    function CharacterThree_Icon.Entity:GetPlayerColor() return (LocalPlayer():GetPlayerColor()) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

    local CharacterThree_Button = vgui.Create( "DButton", CharacterCreator )
    CharacterThree_Button:SetText( "" )
    CharacterThree_Button:SetPos( W(1380), H(860) )
    CharacterThree_Button:SetSize( W(400), H(80) )
    CharacterThree_Button.Paint = function( s, self, w, h )
      CharacterThree_Button.DoClick = function()
      if IsValid(CharacterCreator) then CharacterCreator:Remove() end
      net.Start("SL:Mad - Character:Load")
      net.WriteFloat(3)
      net.SendToServer()
    end
  end
end

end
end
function MenuCharacterCreator(num)
  slot_chara = num
  LocalPlayer():SetNWInt("Creation_Genre", "male")

  local CharacterCreator = vgui.Create("DFrame")
  CharacterCreator:SetPos(W(0), H(0))
  CharacterCreator:SetSize(W(1920), H(1080))
  CharacterCreator:SetTitle("")
  CharacterCreator:MakePopup()
  CharacterCreator:SetDraggable(false)
  CharacterCreator:ShowCloseButton(false)
  CharacterCreator.Paint = function( s, self, w, h )
    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(fonc_crea)
    surface.DrawTexturedRect(W(0),H(0),W(1920),H(1080))

    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(crea_perso)
    surface.DrawTexturedRect(0,0,W(1920),H(1080))
  end

CharacterOne_Icon = vgui.Create("DModelPanel", CharacterCreator)
CharacterOne_Icon:SetSize(W(609), H(881))
CharacterOne_Icon:SetPos(W(771), H(100))
CharacterOne_Icon:SetFOV(50)
function CharacterOne_Icon:LayoutEntity(Entity)
-- désactive la rotation par défaut
return
end

CharacterOne_Icon:SetModel("models/mad_models/mad_sl_male_civil1.mdl")

local mouseX, mouseY = 0, 0
local isDragging = false
local initialAngles
local initialMouseX, initialMouseY

-- Fonction pour gérer le mouvement de la souris
local function IconOnMousePressed(panel, mousecode)
  if mousecode == MOUSE_LEFT then
      isDragging = true
      mouseX, mouseY = gui.MousePos()
      initialMouseX, initialMouseY = mouseX, mouseY
      initialAngles = CharacterOne_Icon:GetCamPos():Angle()
  end
end

local function IconOnMouseReleased(panel, mousecode)
  if mousecode == MOUSE_LEFT then
      isDragging = false
  end
end

local function IconOnCursorMoved(panel, x, y)
  if isDragging then
      local deltaX, deltaY = x - mouseX, y - mouseY
      local deltaInitialX, deltaInitialY = x - initialMouseX, y - initialMouseY
      -- ajuster l'angle de la vue du modèle selon le mouvement de la souris par rapport à la position initiale
      local curAngles = initialAngles + Angle(0, -deltaInitialX * 0.5, deltaInitialY * 0.5)
      CharacterOne_Icon:SetCamPos(curAngles:Forward() * 80)
      mouseX, mouseY = x, y
  end
end

-- Lier les fonctions aux événements de souris
CharacterOne_Icon.OnMousePressed = IconOnMousePressed
CharacterOne_Icon.OnMouseReleased = IconOnMouseReleased
CharacterOne_Icon.OnCursorMoved = IconOnCursorMoved	

local CharacterCreator_ButtonGenderMale = vgui.Create( "DButton", CharacterCreator ) 
CharacterCreator_ButtonGenderMale:SetText( "" )				
CharacterCreator_ButtonGenderMale:SetPos(W(335), H(470))
CharacterCreator_ButtonGenderMale:SetSize(W(45) / 1.3, H(84) / 1.3)
CharacterCreator_ButtonGenderMale.DoClick = function()		
  LocalPlayer():SetNWInt("Creation_Genre", "male")
  CharacterOne_Icon:SetModel( "models/mad_models/mad_sl_male_civil1.mdl" )

  CharacterCreator_SliderCheveux:Remove()

  CharacterCreator_SliderCheveux = vgui.Create( "DNumSlider", CharacterCreator )
  CharacterCreator_SliderCheveux:SetPos( W(1290), H(280) )				-- Set the position
  CharacterCreator_SliderCheveux:SetSize( W(550), H(100) )			-- Set the size
  CharacterCreator_SliderCheveux:SetText( "" )	-- Set the text above the slider
  CharacterCreator_SliderCheveux:SetMin( 0 )				 	-- Set the minimum number you can slide to
  CharacterCreator_SliderCheveux:SetMax( 42 )				-- Set the maximum number you can slide to
  CharacterCreator_SliderCheveux:SetDecimals( 0 )				-- Decimal places - zero for whole number

  CharacterCreator_SliderCheveux.OnValueChanged = function( self, value )
    CharacterOne_Icon.Entity:SetBodygroup(3, value)
    LocalPlayer():SetNWInt("Creation_Cheveux", value)
  end

end
CharacterCreator_ButtonGenderMale.Paint = function( self, w, h )
  if CharacterCreator_ButtonGenderMale:IsHovered() then
    surface.SetDrawColor(125, 145, 255)
  else
  surface.SetDrawColor(255, 255, 255, 255)
  end
  if LocalPlayer():GetNWInt("Creation_Genre") == "male" then
    surface.SetDrawColor(125, 145, 255)
  end
  surface.SetMaterial(homme)
  surface.DrawTexturedRect(0,0,w,h)
end

CharacterCreator_ButtonGenderFemale = vgui.Create( "DButton", CharacterCreator ) 
CharacterCreator_ButtonGenderFemale:SetText( "" )				
CharacterCreator_ButtonGenderFemale:SetPos(W(441), H(470))
CharacterCreator_ButtonGenderFemale:SetSize(W(45) / 1.3, H(84) / 1.3)
CharacterCreator_ButtonGenderFemale.DoClick = function()				
  LocalPlayer():SetNWInt("Creation_Genre", "female")
  CharacterOne_Icon:SetModel( "models/mad_models/mad_sl_female1.mdl" )

  CharacterCreator_SliderCheveux:Remove()

  CharacterCreator_SliderCheveux = vgui.Create( "DNumSlider", CharacterCreator )
  CharacterCreator_SliderCheveux:SetPos( W(1290), H(280) )				-- Set the position
  CharacterCreator_SliderCheveux:SetSize( W(550), H(100) )			-- Set the size
  CharacterCreator_SliderCheveux:SetText( "" )	-- Set the text above the slider
  CharacterCreator_SliderCheveux:SetMin( 0 )				 	-- Set the minimum number you can slide to
  CharacterCreator_SliderCheveux:SetMax( 18 )				-- Set the maximum number you can slide to
  CharacterCreator_SliderCheveux:SetDecimals( 0 )				-- Decimal places - zero for whole number

  CharacterCreator_SliderCheveux.OnValueChanged = function( self, value )
    CharacterOne_Icon.Entity:SetBodygroup(2, value)
    LocalPlayer():SetNWInt("Creation_Cheveux", value)
  end

end
CharacterCreator_ButtonGenderFemale.Paint = function(self, w, h )
  if CharacterCreator_ButtonGenderFemale:IsHovered() then
    surface.SetDrawColor(218, 125, 255)
  else
  surface.SetDrawColor(255, 255, 255, 255)
  end
  if LocalPlayer():GetNWInt("Creation_Genre") == "female" then
    surface.SetDrawColor(218, 125, 255)
  end
  surface.SetMaterial(femme)
  surface.DrawTexturedRect(0,0,w,h)
end

local CharacterCreator_EntryName = vgui.Create( "DTextEntry", CharacterCreator ) -- create the form as a child of frame
CharacterCreator_EntryName:SetPos(W(255), H(620))
CharacterCreator_EntryName:SetFont("M_Font1")
CharacterCreator_EntryName:SetTextColor(Color(0,0,0))
CharacterCreator_EntryName:SetPaintBackground(false)
CharacterCreator_EntryName:SetSize(W(300), H(50))
CharacterCreator_EntryName.OnEnter = function( self )
  chat.AddText( self:GetValue() )	-- print the textentry text as a chat message
end

local CharacterCreator_SliderAge = vgui.Create( "DNumSlider", CharacterCreator )
CharacterCreator_SliderAge:SetPos( W(10), H(525) )				-- Set the position
CharacterCreator_SliderAge:SetSize( W(650), H(100) )			-- Set the size
CharacterCreator_SliderAge:SetText( "" )	-- Set the text above the slider
CharacterCreator_SliderAge:SetMin( 16 )				 	-- Set the minimum number you can slide to
CharacterCreator_SliderAge:SetMax( 60 )				-- Set the maximum number you can slide to
CharacterCreator_SliderAge:SetDecimals( 0 )				-- Decimal places - zero for whole number
CharacterCreator_SliderAge:SetValue( 16 )
CharacterCreator_SliderAge.OnValueChanged = function( self, value )
  LocalPlayer():SetNWInt("Creation_Age", value)
end

CharacterCreator_SliderCheveux = vgui.Create( "DNumSlider", CharacterCreator )
CharacterCreator_SliderCheveux:SetPos( W(1290), H(280) )				-- Set the position
CharacterCreator_SliderCheveux:SetSize( W(550), H(100) )			-- Set the size
CharacterCreator_SliderCheveux:SetText( "" )	-- Set the text above the slider
CharacterCreator_SliderCheveux:SetMin( 0 )				 	-- Set the minimum number you can slide to
CharacterCreator_SliderCheveux:SetMax( 42 )				-- Set the maximum number you can slide to
CharacterCreator_SliderCheveux:SetDecimals( 0 )				-- Decimal places - zero for whole number

CharacterCreator_SliderCheveux.OnValueChanged = function( self, value )
  CharacterOne_Icon.Entity:SetBodygroup(3, value)
  LocalPlayer():SetNWInt("Creation_Cheveux", value)
end

CharacterCreator_Colorpickerbutton = vgui.Create("DButton", CharacterCreator)
CharacterCreator_Colorpickerbutton:SetPos(W(1820), H(305))
CharacterCreator_Colorpickerbutton:SetSize( W(50), H(50) )
CharacterCreator_Colorpickerbutton:SetText("")	
CharacterCreator_Colorpickerbutton.Paint = function(self,w,h)
  surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(ColorButton)
    surface.DrawTexturedRect(0,0,w,h)
end
CharacterCreator_Colorpickerbutton.DoClick = function()
  if IsValid(CharacterCreator_Colorpickermenu) then return end
  CharacterCreator_Colorpickermenu = vgui.Create("DFrame", CharacterCreator)
  CharacterCreator_Colorpickermenu:SetSize(W(341), H(361))
  CharacterCreator_Colorpickermenu:Center()
  local ColorPicker = vgui.Create("DColorMixer", CharacterCreator_Colorpickermenu)
  ColorPicker:SetSize(W(341), H(341))
  ColorPicker:SetPos(W(0), H(20))      
  ColorPicker.ValueChanged = function(picker, color)
    LocalPlayer():SetPlayerColor(Vector(color.r / 255, color.g / 255, color.b / 255))
    function CharacterOne_Icon.Entity:GetPlayerColor() return (Vector(color.r / 255, color.g / 255, color.b / 255)) end
  end

end

local CharacterCreator_SliderYeux = vgui.Create( "DNumSlider", CharacterCreator )
CharacterCreator_SliderYeux:SetPos( W(1290), H(380) )				-- Set the position
CharacterCreator_SliderYeux:SetSize( W(550), H(100) )			-- Set the size
CharacterCreator_SliderYeux:SetText( "" )	-- Set the text above the slider
CharacterCreator_SliderYeux:SetMin( 0 )				 	-- Set the minimum number you can slide to
CharacterCreator_SliderYeux:SetMax( 9 )				-- Set the maximum number you can slide to
CharacterCreator_SliderYeux:SetDecimals( 0 )				-- Decimal places - zero for whole number

CharacterCreator_SliderYeux.OnValueChanged = function( self, value )
  CharacterOne_Icon.Entity:SetSkin(value)
  LocalPlayer():SetNWInt("Creation_Yeux", value)
end


  CharacterCreator_ButtonSuivant = vgui.Create( "DButton", CharacterCreator ) 
  CharacterCreator_ButtonSuivant:SetText( "" )				
  CharacterCreator_ButtonSuivant:SetPos(W(1543), H(967))
  CharacterCreator_ButtonSuivant:SetSize(W(260), H(62))
  CharacterCreator_ButtonSuivant.DoClick = function()				
    net.Start("SL:Mad - Character:Create")
    net.WriteFloat(slot_chara)
    net.WriteString(LocalPlayer():GetNWInt("Creation_Genre"))
    net.WriteFloat(LocalPlayer():GetNWInt("Creation_Cheveux"))
    net.WriteFloat(LocalPlayer():GetNWInt("Creation_Yeux"))
    net.WriteString(CharacterCreator_EntryName:GetValue())
    net.WriteFloat(LocalPlayer():GetNWInt("Creation_Age"))
    net.WriteVector(LocalPlayer():GetPlayerColor()) 
    net.SendToServer()

    CharacterCreator:Remove()

    local goal_fond = vgui.Create("DFrame")
    goal_fond:SetSize(W(1920),H(1080))
    goal_fond:ShowCloseButton(false)
    goal_fond:SetDraggable(false)
    goal_fond:SetTitle("")
    goal_fond.Paint = function(self,w,h)
      surface.SetDrawColor(255, 255, 255)
      surface.SetMaterial(BvFond)
      surface.DrawTexturedRect(0, 0, w, h)
    end
    isAnimating = true
    LocalPlayer():EmitSound("notif_sl.wav")
    local Goal = vgui.Create("DFrame",goal_fond)
    Goal:SetSize(0,0)
    Goal:Center()
    Goal:MakePopup()
    Goal:SetTitle("")
    Goal:ShowCloseButton(false)
    Goal.Paint = function(ply,w,h)
      surface.SetDrawColor(255, 255, 255)
      surface.SetMaterial(Goatimg)
      surface.DrawTexturedRect(0, 0, w, h)
    end
    Goal:SizeTo(W(684),H(736),1.8,0,.1,function()
      isAnimating = false
    end)
    Goal.Think = function(me)
      if isAnimating then
        me:Center()
      end
    end

    local valider = vgui.Create("DButton", Goal)
    valider:SetSize(W(50),H(50))
    valider:SetPos(W(605),H(25))
    valider:SetText("")
    valider.Paint = function(self,w,h)
      if valider:IsHovered() then
        draw.SimpleText("X","CloseCaption_Bold",h/2,0,Color(168,48,48),TEXT_ALIGN_CENTER)
      else
        draw.SimpleText("X","CloseCaption_Bold",h/2,0,Color(255,255,255),TEXT_ALIGN_CENTER)
      end
    end
    valider.DoClick = function()
      goal_fond:Remove()
    end
  end
  CharacterCreator_ButtonSuivant.Paint = function( self, w, h )
    if CharacterCreator_ButtonSuivant:IsHovered() then
      surface.SetDrawColor(255, 255, 255, 255)
      surface.SetMaterial(suivant_hover)
      surface.DrawTexturedRect(0,H(8),W(229),H(46))
  
      surface.SetDrawColor(255, 255, 255, 255)
      surface.SetMaterial(check_hover)
      surface.DrawTexturedRect(W(198),H(0),W(62),H(62))  
    else
    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(suivant)
    surface.DrawTexturedRect(0,H(8),W(229),H(46))

    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(check)
    surface.DrawTexturedRect(W(198),H(0),W(62),H(62))    
    end
  end
end
--PATH addons/xeon-drm-dll/lua/autorun/client/xeon-drm-auth.lua:
local domain = CreateConVar("xeon_dev", 0, bit.bor(FCVAR_REPLICATED, FCVAR_UNREGISTERED, FCVAR_UNLOGGED, FCVAR_DONTRECORD), nil, 0, 1):GetInt() == 1 and "http://gmod.local" or "https://xeon.network"

local XEON_AUTH
local XEON_IP
net.Receive("XEON.Auth", function(len)
	if net.ReadBool() then
		if not IsValid(XEON_AUTH) then return end

		local path = net.ReadString()

		XEON_AUTH:Remove()
		XEON_AUTH = Derma_Query(
			"You will now be prompted to open a URL in the Steam Overlay. Please click \"Yes\" when prompted.\n\nThe URL will redirect you to a Sign in through Steam page for https://xeon.network.\nYou won't need to enter a username or password, the Steam Overlay should already have you logged in.",
			"XEON DRM",
			"Continue", function()
				gui.OpenURL(domain .. path)
			end,
			"Cancel"
		)
	end

	net.Start("XEON.Auth")
	net.SendToServer()

	if IsValid(XEON_AUTH) then return end

	if not LocalPlayer():IsSuperAdmin() then
		XEON_AUTH = Derma_Message("Thanks for installing one of Billy's scripts!\nTo activate your license and use your new scripts, you need to be a superadmin. Please promote yourself to superadmin, then respawn or rejoin to try again.", "XEON DRM", "Dismiss")
		return
	end

	XEON_AUTH = Derma_Query(
		"Thanks for installing one of Billy's scripts!\nTo activate your license and use your new scripts, I'll need you to log in to Steam via the Steam Overlay to authenticate that this server belongs to you.\nWould you like to do this now?",
		"XEON DRM",
		"Link Server", function()
			XEON_AUTH = Derma_Message("Connecting to XEON... please wait. If nothing happens, please check your server's console.", "XEON DRM", "Cancel")

			if not IsValid(XEON_IP) then
				XEON_IP = vgui.Create("DHTML")

				if not IsValid(XEON_IP) or not XEON_IP.OpenURL then
					XEON_IP = { GetIPAddress = function(_, callback) callback(nil) end }
				else
					XEON_IP:SetSize(0, 0)
					XEON_IP:AddFunction("XEON", "IP", function(IP)
						timer.Remove("XEON_IP")
						XEON_IP.IP = IP
						for _, c in ipairs(XEON_IP.IP_Callbacks) do c(IP) end
						XEON_IP.IP_Callbacks = {}
					end)

					XEON_IP.IP_Callbacks = {}
					function XEON_IP:GetIPAddress(callback)
						if os.time() - self.StartedLoading > 5 then
							callback(nil)
						elseif self.IP then
							callback(self.IP)
						else
							table.insert(self.IP_Callbacks, callback)
						end
					end

					function XEON_IP:OnFinishLoadingDocument(IP)
						self:QueueJavascript("XEON.IP(document.body.textContent.trim())")
					end

					XEON_IP.StartedLoading = os.time()
					XEON_IP:OpenURL("https://icanhazip.com/")

					timer.Create("XEON_IP", 1, 0, function()
						if not IsValid(XEON_IP) then
							timer.Remove("XEON_IP")
							return
						end

						if os.time() - XEON_IP.StartedLoading <= 5 then return end

						timer.Remove("XEON_IP")

						for _, c in ipairs(XEON_IP.IP_Callbacks) do c(nil) end
						XEON_IP.IP_Callbacks = {}
					end)
				end
			end

			XEON_IP:GetIPAddress(function(IP)
				net.Start("XEON.Auth")
					net.WriteBool(true)
					net.WriteString(tostring(IP or ""))
				net.SendToServer()
			end)
		end,
		"Dismiss"
	)
end)

local function openErrors(errors)
	if IsValid(XEON_ERRORS) then
		XEON_ERRORS:Update(errors)
		return
	end

	XEON_ERRORS = vgui.Create("DFrame")
	XEON_ERRORS:SetSize(ScrW() * .8, ScrH() * .8)
	XEON_ERRORS:SetTitle("XEON DRM by Billy - Error!")
	XEON_ERRORS:Center()
	XEON_ERRORS:MakePopup()

	local html = vgui.Create("DHTML", XEON_ERRORS)
	html:Dock(FILL)
	html:OpenURL(domain .. "/errors")
	html:AddFunction("XEON", "ScriptSupport", function()
		gui.OpenURL("https://support.billy.enterprises")
	end)

	function XEON_ERRORS:Update(errors)
		print("XEON Errors: " .. #errors)
		PrintTable(errors)

		html:QueueJavascript("ShowNetworkedErrors(" .. util.TableToJSON(errors) .. ")")
	end
	function html:OnDocumentReady()
		XEON_ERRORS:Update(errors)
		self.OnDocumentReady = nil
	end
	XEON_ERRORS:Update(errors)

	sound.PlayURL("https://xeon.network/static/media/oof.mp3", "", function() end)
end

net.Receive("XEON.Error", function()
	local errors = {}
	for i = 1, net.ReadUInt(16) do
		errors[i] = net.ReadString()
	end
	openErrors(errors)
end)

hook.Add("InitPostEntity", "XEON.Error", function()
	timer.Simple(2, function()
		net.Start("XEON.Error")
		net.SendToServer()
	end)
end)
--PATH lua/vgui/bvgui/progressbar.lua:
local PANEL = {}

function PANEL:Init()
	self.Min = 0
	self.Max = 0
	self.Progress = 0
	self.Fraction = 0
	self.Decimals = false

	self.Text = vgui.Create("DLabel", self)
	self.Text:SetText("")
	self.Text:SetTextColor(bVGUI.COLOR_WHITE)
	self.Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 14))

	self.ProgressBar_X = -1
	self.ProgressBar_Col = -1
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(bVGUI.COLOR_SLATE)
	surface.DrawRect(0,0,w,h)

	--surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
	--surface.DrawTexturedRect(0,0,w,h)

	local w_frac = self.Fraction * w
	if (self.ProgressBar_X == -1) then
		self.ProgressBar_X = w_frac
	else
		self.ProgressBar_X = Lerp(FrameTime() * 10, self.ProgressBar_X, w_frac)
	end

	local frac_255 = self.Fraction * 255
	if (self.ProgressBar_Col == -1) then
		self.ProgressBar_Col = frac_255
	else
		self.ProgressBar_Col = Lerp(FrameTime() * 10, self.ProgressBar_Col, frac_255)
	end

	surface.SetDrawColor(255 - self.ProgressBar_Col, self.ProgressBar_Col, 0, 255)
	surface.DrawRect(0, 0, self.ProgressBar_X, h)

	--surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
	--surface.DrawTexturedRect(0, 0, self.ProgressBar_X, h)

	surface.SetDrawColor(bVGUI.COLOR_BLACK)
	surface.DrawOutlinedRect(0,0,w,h)
end

function PANEL:Think()
	self.Fraction = (self.Progress - self.Min) / (self.Max - self.Min)
	if (self.Decimals == false and tostring(self.Fraction * 100):find("%.")) then
		self.Decimals = true
	end

	if (self.Fraction > 0) then
		if (self.Decimals) then
			local percentage = math.Round(self.Fraction * 100, 1)
			if (percentage % 1 == 0 and self.Fraction ~= 1) then
				percentage = percentage .. ".0"
			end
			self.Text:SetText(percentage .. "%")
		else
			self.Text:SetText(math.Round(self.Fraction * 100, 1) .. "%")
		end
		self.Text:SizeToContents()
		self.Text:Center()
	elseif (self.Text:GetText() ~= "") then
		self.Text:SetText("")
	end
end

derma.DefineControl("bVGUI.ProgressBar", nil, PANEL, "DPanel")
--PATH lua/vgui/bvgui/toolbarbutton.lua:
--/// bVGUI.ToolbarButton_IMG ///--

local PANEL = {}

function PANEL:Init()
	self:SetCursor("hand")
	self.bVGUI_IMG = vgui.Create("DImage", self)
	self.bVGUI_IMG:SetSize(16,16)
end

function PANEL:Paint()
	if (self:IsHovered()) then
		if (not self._IsHovered) then
			self._IsHovered = true
			self.bVGUI_IMG:SetMaterial(self.HoverMaterial)
		end
	else
		if (self._IsHovered) then
			self._IsHovered = nil
			self.bVGUI_IMG:SetMaterial(self.DefaultMaterial)
		end
	end
end

function PANEL:SetMaterial(mat)
	self.bVGUI_IMG:SetMaterial(mat)
	self.DefaultMaterial = mat
end
function PANEL:SetHoverMaterial(mat)
	self.HoverMaterial = mat
end

function PANEL:OnMouseReleased()
	self:DoClick()
end

function PANEL:PerformLayout()
	self.bVGUI_IMG:Center()
end

derma.DefineControl("bVGUI.ToolbarButton_IMG", nil, PANEL, "DPanel")

--/// bVGUI.ToolbarButton_IMGText ///--

local PANEL = {}

function PANEL:Init()
	self:SetCursor("hand")

	self.bVGUI_IMG = vgui.Create("DImage", self)
	self.bVGUI_IMG:SetSize(16,16)

	self.bVGUI_Text = vgui.Create("DLabel", self)
	self.bVGUI_Text:SetText("Menu")
	self.bVGUI_Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
	self.bVGUI_Text:SetTextColor(bVGUI.COLOR_DARK_GREY)
end

function PANEL:Paint()
	if (self:IsHovered()) then
		if (not self._IsHovered) then
			self._IsHovered = true
			self.bVGUI_IMG:SetMaterial(self.HoverMaterial)
			self.bVGUI_Text:SetTextColor(bVGUI.COLOR_WHITE)
		end
	else
		if (self._IsHovered) then
			self._IsHovered = nil
			self.bVGUI_IMG:SetMaterial(self.DefaultMaterial)
			self.bVGUI_Text:SetTextColor(bVGUI.COLOR_DARK_GREY)
		end
	end
end

function PANEL:SetMaterial(mat)
	self.bVGUI_IMG:SetMaterial(mat)
	self.DefaultMaterial = mat
end
function PANEL:SetHoverMaterial(mat)
	self.HoverMaterial = mat
end

function PANEL:SetText(txt)
	self.bVGUI_Text:SetText(txt)
	self:PerformLayout()
end

function PANEL:PerformLayout()
	self.bVGUI_IMG:AlignLeft(5)
	self.bVGUI_IMG:CenterVertical()

	self.bVGUI_Text:SizeToContents()
	self.bVGUI_Text:AlignLeft(5 + 16 + 5)
	self.bVGUI_Text:CenterVertical()

	self:SetWide(5 + 16 + 5 + self.bVGUI_Text:GetWide() + 5 + 2)
end

function PANEL:OnMouseReleased()
	self:DoClick()
end

derma.DefineControl("bVGUI.ToolbarButton_IMGText", nil, PANEL, "DPanel")
--PATH lua/vgui/openpermissions_addon.lua:
local function markup_Escape(str)
	return (tostring(str):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local PANEL = {}

function PANEL:Init()
	self:SetText("")
end

function PANEL:GenerateMarkup(text, maxwidth)
	self.Addon.Markup = markup.Parse("<color=255,255,255>" .. markup_Escape(text) .. "</color>", maxwidth)
end

function PANEL:Setup(id, options)
	self.Addon = {}

	self.Addon.Name = options.Name or id
	self.Addon.Color = options.Color or OpenPermissions.COLOR_BLACK

	if (options.Logo and options.Logo.Path and options.Logo.Width and options.Logo.Height) then
		self.Addon.Logo = {
			Material = Material(options.Logo.Path),
			Width = options.Logo.Width / 2,
			Height = options.Logo.Height / 2
		}
	end
end

function PANEL:Paint(w,h)
	derma.SkinHook("Paint", "Button", self, w, h)

	if (not self.Addon) then return end

	surface.SetDrawColor(self.Addon.Color)
	surface.DrawRect(5, 5, w - 10, h - 10)

	if (self.Addon.Logo) then
		local x,y = w / 2 - self.Addon.Logo.Width / 2, h / 2 - self.Addon.Logo.Height / 2
		surface.SetDrawColor(255,255,255)
		surface.SetMaterial(self.Addon.Logo.Material)
		surface.DrawTexturedRect(x, y, self.Addon.Logo.Width, self.Addon.Logo.Height)
	elseif (self.Addon.Markup) then
		self.Addon.Markup:Draw(w / 2, h / 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		self:GenerateMarkup(self.Addon.Name, w - 20)
	end
end

derma.DefineControl("OpenPermissions.Addon", nil, PANEL, "DButton")
--PATH gamemodes/mangarp/gamemode/modules/hitmenu/cl_interface.lua:
DarkRP.openHitMenu = DarkRP.stub{
    name = "openHitMenu",
    description = "Open the menu that requests a hit.",
    parameters = {
        {
            name = "hitman",
            description = "The hitman to request the hit to.",
            type = "Player",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.PLAYER.drawHitInfo = DarkRP.stub{
    name = "drawHitInfo",
    description = "Start drawing the hit information above a hitman.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.stopHitInfo = DarkRP.stub{
    name = "stopHitInfo",
    description = "Stop drawing the hit information above a hitman.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP.PLAYER
}

--PATH gamemodes/mangarp/gamemode/modules/doorsystem/sh_interface.lua:
DarkRP.ENTITY.getDoorData = DarkRP.stub{
    name = "getDoorData",
    description = "Internal function to get the door/vehicle data.",
    parameters = {
    },
    returns = {
        {
            name = "doordata",
            description = "All the DarkRP information on a door or vehicle.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysOwnable = DarkRP.stub{
    name = "isKeysOwnable",
    description = "Whether this door can be bought.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether the door can be bought.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isDoor = DarkRP.stub{
    name = "isDoor",
    description = "Whether this entity is considered a door in DarkRP.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether it's a door.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysOwned = DarkRP.stub{
    name = "isKeysOwned",
    description = "Whether this door is owned by someone.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether it's owned.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getDoorOwner = DarkRP.stub{
    name = "getDoorOwner",
    description = "Get the owner of a door.",
    parameters = {
    },
    returns = {
        {
            name = "owner",
            description = "The owner of the door.",
            type = "Player"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isMasterOwner = DarkRP.stub{
    name = "isMasterOwner",
    description = "Whether the player is the main owner of the door (as opposed to a co-owner).",
    parameters = {
        {
            name = "ply",
            description = "The player to query.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is the master owner.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysOwnedBy = DarkRP.stub{
    name = "isKeysOwnedBy",
    description = "Whether this door is owned or co-owned by this player",
    parameters = {
        {
            name = "ply",
            description = "The player to query.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether this door is (co-)owned by the player.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysAllowedToOwn = DarkRP.stub{
    name = "isKeysAllowedToOwn",
    description = "Whether this player is allowed to co-own a door, as decided by the master door owner.",
    parameters = {
        {
            name = "ply",
            description = "The player to query.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether this door is (co-)ownable by the player.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysNonOwnable = DarkRP.stub{
    name = "getKeysNonOwnable",
    description = "Whether ownability of this door/vehicle is disabled.",
    parameters = {
    },
    returns = {
        {
            name = "title",
            description = "The ownability status.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysTitle = DarkRP.stub{
    name = "getKeysTitle",
    description = "Get the title of this door or vehicle.",
    parameters = {
    },
    returns = {
        {
            name = "title",
            description = "The title of the door or vehicle.",
            type = "string"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysDoorGroup = DarkRP.stub{
    name = "getKeysDoorGroup",
    description = "The door group of a door if it exists.",
    parameters = {
    },
    returns = {
        {
            name = "group",
            description = "The door group.",
            type = "string"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysDoorTeams = DarkRP.stub{
    name = "getKeysDoorTeams",
    description = "The teams that are allowed to open this door.",
    parameters = {
    },
    returns = {
        {
            name = "teams",
            description = "The door teams.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysAllowedToOwn = DarkRP.stub{
    name = "getKeysAllowedToOwn",
    description = "The list of people of which the master door owner has added as allowed to own.",
    parameters = {
    },
    returns = {
        {
            name = "players",
            description = "The list of people allowed to own.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysCoOwners = DarkRP.stub{
    name = "getKeysCoOwners",
    description = "The list of people who co-own the door.",
    parameters = {
    },
    returns = {
        {
            name = "players",
            description = "The list of people allowed to own. The keys of this table are UserIDs, the values are booleans.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.PLAYER.canKeysLock = DarkRP.stub{
    name = "canKeysLock",
    description = "Whether the player can lock a given door.",
    parameters = {
        {
            name = "door",
            description = "The door",
            optional = false,
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to lock the door.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.canKeysUnlock = DarkRP.stub{
    name = "canKeysUnlock",
    description = "Whether the player can unlock a given door.",
    parameters = {
        {
            name = "door",
            description = "The door",
            optional = false,
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to unlock the door.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.registerDoorVar = DarkRP.stub{
    name = "registerDoorVar",
    description = "Register a door variable by name. You should definitely register door variables. Registering DarkRPVars will make networking much more efficient.",
    parameters = {
        {
            name = "name",
            description = "The name of the door var.",
            type = "string",
            optional = false
        },
        {
            name = "writeFn",
            description = "The function that writes a value for this door var. Examples: net.WriteString, function(val) net.WriteUInt(val, 8) end.",
            type = "function",
            optional = false
        },
        {
            name = "readFn",
            description = "The function that reads and returns a value for this door var. Examples: net.ReadString, function() return net.ReadUInt(8) end.",
            type = "function",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getDoorVars = DarkRP.stub{
    name = "getDoorVars",
    description = "Internal function, retrieves all the registered door variables.",
    parameters = {

    },
    returns = {
        {
            name = "doorvars",
            description = "The door variables, indexed by number",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getDoorVarsByName = DarkRP.stub{
    name = "getDoorVarsByName",
    description = "Internal function, retrieves all the registered door variables, indeded by their names.",
    parameters = {

    },
    returns = {
        {
            name = "doorvars",
            description = "The door variables, indexed by name",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "canKeysLock",
    description = "Whether the player can lock a given door. This hook is run when ply:canKeysLock is called.",
    parameters = {
        {
            name = "ply",
            description = "The player",
            type = "Player"
        },
        {
            name = "door",
            description = "The door",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to lock the door.",
            type = "boolean"
        }
    }
}

DarkRP.hookStub{
    name = "canKeysUnlock",
    description = "Whether the player can unlock a given door. This hook is run when ply:canKeysUnlock is called.",
    parameters = {
        {
            name = "ply",
            description = "The player",
            type = "Player"
        },
        {
            name = "door",
            description = "The door",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to unlock the door.",
            type = "boolean"
        }
    }
}

--PATH gamemodes/mangarp/gamemode/modules/positions/sh_commands.lua:
local plyMeta = FindMetaTable("Player")

DarkRP.declareChatCommand{
    command = "setspawn",
    description = "Reset the spawn position for some job and place a new one at your position (use the command name of the job as argument)",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "addspawn",
    description = "Add a spawn position for some job (use the command name of the job as argument)",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "removespawn",
    description = "Remove a spawn position for some job (use the command name of the job as argument)",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "jailpos",
    description = "Reset jail positions and create a new one at your position.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.isChief, fn.Compose{fn.Curry(fn.GetValue, 2)("chiefjailpos"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}}
}

DarkRP.declareChatCommand{
    command = "setjailpos",
    description = "Reset jail positions and create a new one at your position.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.isChief, fn.Compose{fn.Curry(fn.GetValue, 2)("chiefjailpos"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}}
}

DarkRP.declareChatCommand{
    command = "addjailpos",
    description = "Add a jail position where you're standing.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.isChief, fn.Compose{fn.Curry(fn.GetValue, 2)("chiefjailpos"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}}
}

--PATH gamemodes/mangarp/gamemode/modules/money/sh_commands.lua:
DarkRP.declareChatCommand{
    command = "give",
    description = "Give money to the player you're looking at.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "dropmoney",
    description = "Drop money on the floor.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "moneydrop",
    description = "Drop money on the floor.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "cheque",
    description = "Write a cheque for a specific person.",
    delay = 1.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "check",
    description = "Write a cheque for a specific person.",
    delay = 1.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "setmoney",
    description = "Set a player's wallet value.",
    delay = 0.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "addmoney",
    description = "Add money to a player's wallet.",
    delay = 0.5,
    tableArgs = true
}

--PATH gamemodes/mangarp/gamemode/modules/fadmin/cl_fadmin.lua:
local function IncludeFolder(fol)
    fol = string.lower(fol)
    local _, folders = file.Find(fol .. "*", "LUA")

    for _, folder in SortedPairs(folders, true) do
        if folder ~= "." and folder ~= ".." then
            for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
                include(fol .. folder .. "/" .. File)
            end

            for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
                include(fol .. folder .. "/" .. File)
            end
        end
    end
end

IncludeFolder(GM.FolderName .. "/gamemode/modules/fadmin/fadmin/")
IncludeFolder(GM.FolderName .. "/gamemode/modules/fadmin/fadmin/playeractions/")

--[[---------------------------------------------------------------------------
FAdmin global settings
---------------------------------------------------------------------------]]
net.Receive("FAdmin_GlobalSetting", function(len)
    local setting, value = net.ReadString(), net.ReadType(net.ReadUInt(8))

    FAdmin.GlobalSetting = FAdmin.GlobalSetting or {}
    FAdmin.GlobalSetting[setting] = value
end)

net.Receive("FAdmin_PlayerSetting", function(len)
    local uid, setting, value = net.ReadUInt(16), net.ReadString(), net.ReadType(net.ReadUInt(8))

    FAdmin.PlayerSettings = FAdmin.PlayerSettings or {}
    FAdmin.PlayerSettings[uid] = FAdmin.PlayerSettings[uid] or {}
    FAdmin.PlayerSettings[uid][setting] = value
end)

timer.Create("FAdmin_CleanPlayerSettings", 300, 0, function()
    if not FAdmin.PlayerSettings then return end

    -- find highest userID
    local max = math.huge
    for _, v in ipairs(player.GetAll()) do
        if IsValid(v) and v:UserID() > max then max = v:UserID() end
    end

    -- Anything lower than the maximal UserID can be culled
    -- This prevents data from joining players from being removed
    -- New players always get a strictly higher UserID than any player before them
    for uid in pairs(FAdmin.PlayerSettings) do
        if IsValid(Player(uid)) or uid > max then continue end

        FAdmin.PlayerSettings[uid] = nil
    end
end)

local plyMeta = FindMetaTable("Player")

function plyMeta:FAdmin_GetGlobal(setting)
    local uid = self:UserID()
    return FAdmin.PlayerSettings and FAdmin.PlayerSettings[uid] and FAdmin.PlayerSettings[uid][setting] or nil
end

net.Receive("FAdmin_GlobalPlayerSettings", function(len)
    local globalCount = net.ReadUInt(8)

    FAdmin.GlobalSetting = FAdmin.GlobalSetting or {}

    for i = 1, globalCount do
        FAdmin.GlobalSetting[net.ReadString()] = net.ReadType(net.ReadUInt(8))
    end

    local plyCount = net.ReadUInt(8)
    FAdmin.PlayerSettings = FAdmin.PlayerSettings or {}

    for i = 1, plyCount do
        local uid = net.ReadUInt(16)
        local count = net.ReadUInt(8)

        FAdmin.PlayerSettings[uid] = FAdmin.PlayerSettings[uid] or {}

        for j = 1, count do
            FAdmin.PlayerSettings[uid][net.ReadString()] = net.ReadType(net.ReadUInt(8))
        end
    end
end)


--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/cl_scoreboard.lua:
local OverrideScoreboard = CreateClientConVar("FAdmin_OverrideScoreboard", 0, true, false) -- Set if it's a scoreboard or not

function FAdmin.ScoreBoard.ChangeView(newView, ...)
    if FAdmin.ScoreBoard.CurrentView == newView or not FAdmin.ScoreBoard.Visible then return end

    for _, v in pairs(FAdmin.ScoreBoard[FAdmin.ScoreBoard.CurrentView].Controls) do
        v:SetVisible(false)
    end

    FAdmin.ScoreBoard.CurrentView = newView
    FAdmin.ScoreBoard[newView].Show(...)
    FAdmin.ScoreBoard.ChangeGmodLogo(FAdmin.ScoreBoard[newView].Logo)

    FAdmin.ScoreBoard.Controls.BackButton = FAdmin.ScoreBoard.Controls.BackButton or vgui.Create("DButton")
    FAdmin.ScoreBoard.Controls.BackButton:SetVisible(true)
    FAdmin.ScoreBoard.Controls.BackButton:SetPos(FAdmin.ScoreBoard.X, FAdmin.ScoreBoard.Y)
    FAdmin.ScoreBoard.Controls.BackButton:SetText("")
    FAdmin.ScoreBoard.Controls.BackButton:SetTooltip("Click me to go back!")
    FAdmin.ScoreBoard.Controls.BackButton:SetCursor("hand")
    FAdmin.ScoreBoard.Controls.BackButton:SetSize(100,90)
    FAdmin.ScoreBoard.Controls.BackButton:SetZPos(999)

    function FAdmin.ScoreBoard.Controls.BackButton:DoClick()
        FAdmin.ScoreBoard.ChangeView("Main")
    end
    FAdmin.ScoreBoard.Controls.BackButton.Paint = function() end
end

--"fadmin/back", gui/gmod_tool
local GmodLogo, TempGmodLogo, GmodLogoColor = surface.GetTextureID("gui/gmod_logo"), surface.GetTextureID("gui/gmod_logo"), color_white
function FAdmin.ScoreBoard.ChangeGmodLogo(new)
    if surface.GetTextureID(new) == TempGmodLogo then return end
    TempGmodLogo = surface.GetTextureID(new)
    for i = 0, 0.5, 0.01 do
        timer.Simple(i, function() GmodLogoColor = Color(255,255,255,GmodLogoColor.a-5.1) end)
    end
    timer.Simple(0.5, function() GmodLogo = surface.GetTextureID(new) end)
    for i = 0.5, 1, 0.01 do
        timer.Simple(i, function()
            GmodLogoColor = Color(255, 255, 255, GmodLogoColor.a + 5.1)
        end)
    end
end

function FAdmin.ScoreBoard.Background()
    surface.SetDrawColor(0,0,0,200)
    surface.DrawRect(FAdmin.ScoreBoard.X, FAdmin.ScoreBoard.Y, FAdmin.ScoreBoard.Width, FAdmin.ScoreBoard.Height)

    surface.SetTexture(GmodLogo)
    surface.SetDrawColor(255,255,255,GmodLogoColor.a)
    surface.DrawTexturedRect(FAdmin.ScoreBoard.X - 20, FAdmin.ScoreBoard.Y, 128, 128)
end


function FAdmin.ScoreBoard.DrawScoreBoard()
    if (input.IsMouseDown(MOUSE_4) or input.IsKeyDown(KEY_BACKSPACE)) and not FAdmin.ScoreBoard.DontGoBack then
        FAdmin.ScoreBoard.ChangeView("Main")
    elseif FAdmin.ScoreBoard.DontGoBack then
        FAdmin.ScoreBoard.DontGoBack = input.IsMouseDown(MOUSE_4) or input.IsKeyDown(KEY_BACKSPACE)
    end
    FAdmin.ScoreBoard.Background()
end

function FAdmin.ScoreBoard.ShowScoreBoard()
    FAdmin.ScoreBoard.Visible = true
    FAdmin.ScoreBoard.DontGoBack = input.IsMouseDown(MOUSE_4) or input.IsKeyDown(KEY_BACKSPACE)

    FAdmin.ScoreBoard.Controls.Hostname = FAdmin.ScoreBoard.Controls.Hostname or vgui.Create("DLabel")
    FAdmin.ScoreBoard.Controls.Hostname:SetText(DarkRP.deLocalise(GetHostName()))
    FAdmin.ScoreBoard.Controls.Hostname:SetFont("ScoreboardHeader")
    FAdmin.ScoreBoard.Controls.Hostname:SetColor(Color(200,200,200,200))
    FAdmin.ScoreBoard.Controls.Hostname:SetPos(FAdmin.ScoreBoard.X + 90, FAdmin.ScoreBoard.Y + 20)
    FAdmin.ScoreBoard.Controls.Hostname:SizeToContents()
    FAdmin.ScoreBoard.Controls.Hostname:SetVisible(true)

    FAdmin.ScoreBoard.Controls.Description = FAdmin.ScoreBoard.Controls.Description or vgui.Create("DLabel")
    FAdmin.ScoreBoard.Controls.Description:SetText(string.format("%s\n%s", GAMEMODE.Name, GAMEMODE.Author))
    FAdmin.ScoreBoard.Controls.Description:SetFont("ScoreboardSubtitle")
    FAdmin.ScoreBoard.Controls.Description:SetColor(Color(200,200,200,200))
    FAdmin.ScoreBoard.Controls.Description:SetPos(FAdmin.ScoreBoard.X + 90, FAdmin.ScoreBoard.Y + 50)
    FAdmin.ScoreBoard.Controls.Description:SizeToContents()
    if FAdmin.ScoreBoard.X + FAdmin.ScoreBoard.Width / 9.5 + FAdmin.ScoreBoard.Controls.Description:GetWide() > FAdmin.ScoreBoard.Width - 150 then
        FAdmin.ScoreBoard.Controls.Description:SetFont("Trebuchet18")
        FAdmin.ScoreBoard.Controls.Description:SetPos(FAdmin.ScoreBoard.X + 90, FAdmin.ScoreBoard.Y + 50)
    end
    FAdmin.ScoreBoard.Controls.Description:SetVisible(true)

    FAdmin.ScoreBoard.Controls.ServerSettingsLabel = FAdmin.ScoreBoard.Controls.ServerSettingsLabel or vgui.Create("DLabel")
    FAdmin.ScoreBoard.Controls.ServerSettingsLabel:SetFont("ScoreboardSubtitle")
    FAdmin.ScoreBoard.Controls.ServerSettingsLabel:SetText("Server settings")
    FAdmin.ScoreBoard.Controls.ServerSettingsLabel:SetColor(Color(200,200,200,200))
    FAdmin.ScoreBoard.Controls.ServerSettingsLabel:SizeToContents()
    FAdmin.ScoreBoard.Controls.ServerSettingsLabel:SetPos(FAdmin.ScoreBoard.Width-150, FAdmin.ScoreBoard.Y + 68)
    FAdmin.ScoreBoard.Controls.ServerSettingsLabel:SetVisible(true)

    FAdmin.ScoreBoard.Controls.ServerSettings = FAdmin.ScoreBoard.Controls.ServerSettings or vgui.Create("DImageButton")
    FAdmin.ScoreBoard.Controls.ServerSettings:SetMaterial("vgui/gmod_tool")
    FAdmin.ScoreBoard.Controls.ServerSettings:SetPos(FAdmin.ScoreBoard.Width-200, FAdmin.ScoreBoard.Y - 20)
    FAdmin.ScoreBoard.Controls.ServerSettings:SizeToContents()
    FAdmin.ScoreBoard.Controls.ServerSettings:SetVisible(true)

    function FAdmin.ScoreBoard.Controls.ServerSettings:DoClick()
        FAdmin.ScoreBoard.ChangeView("Server")
    end

    if FAdmin.ScoreBoard.Controls.BackButton then FAdmin.ScoreBoard.Controls.BackButton:SetVisible(true) end

    FAdmin.ScoreBoard[FAdmin.ScoreBoard.CurrentView].Show()

    gui.EnableScreenClicker(true)
    hook.Add("HUDPaint", "FAdmin_ScoreBoard", FAdmin.ScoreBoard.DrawScoreBoard)
    hook.Call("FAdmin_ShowFAdminMenu")
    return true
end
concommand.Add("+FAdmin_menu", FAdmin.ScoreBoard.ShowScoreBoard)

hook.Add("ScoreboardShow", "FAdmin_scoreboard", function()
    if FAdmin.GlobalSetting.FAdmin or OverrideScoreboard:GetBool() then -- Don't show scoreboard when FAdmin is not installed on server
        return FAdmin.ScoreBoard.ShowScoreBoard()
    end
end)

function FAdmin.ScoreBoard.HideScoreBoard()
    if not FAdmin.GlobalSetting.FAdmin then return end
    FAdmin.ScoreBoard.Visible = false
    CloseDermaMenus()

    gui.EnableScreenClicker(false)
    hook.Remove("HUDPaint", "FAdmin_ScoreBoard")

    for _, v in pairs(FAdmin.ScoreBoard[FAdmin.ScoreBoard.CurrentView].Controls) do
        v:SetVisible(false)
    end

    for _, v in pairs(FAdmin.ScoreBoard.Controls) do
        v:SetVisible(false)
    end
    return true
end
concommand.Add("-FAdmin_menu", FAdmin.ScoreBoard.HideScoreBoard)

hook.Add("ScoreboardHide", "FAdmin_scoreboard", function()
    if FAdmin.GlobalSetting.FAdmin or OverrideScoreboard:GetBool() then -- Don't show scoreboard when FAdmin is not installed on server
        return FAdmin.ScoreBoard.HideScoreBoard()
    end
end)

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/kickban/cl_init.lua:
--[[
WHEN GETTING KICKED
]]
local KickText = ""
usermessage.Hook("FAdmin_kick_start", function()
    hook.Add("HUDPaint", "FAdmin_kick", function()
        draw.RoundedBox(0,0,0, ScrW(), ScrH(), Color(0,0,0,255))
        draw.DrawNonParsedText("You are getting kicked\nReason: " .. KickText .. "\nLeaving voluntarily is also an option.", "HUDNumber5", ScrW() / 2, ScrH() / 2, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER)
    end)
end)

usermessage.Hook("FAdmin_kick_cancel", function()
    hook.Remove("HUDPaint", "FAdmin_kick")
    FAdmin.Messages.AddMessage(4, "Kick was canceled by admin")
end)

usermessage.Hook("FAdmin_kick_update", function(um)
    KickText = um:ReadString()
end)

local BanText = "No reason"
local BanTimeText = "permanent"

usermessage.Hook("FAdmin_ban_start", function()
    hook.Add("HUDPaint", "FAdmin_ban", function()
        draw.RoundedBox(0,0,0, ScrW(), ScrH(), Color(0,0,0,255))
        draw.DrawNonParsedText("You are getting banned\nReason: " .. BanText .. "\nTime: " .. " " .. BanTimeText .. "\nLeaving voluntarily or rejoining will not prevent banning.", "HUDNumber5", ScrW() / 2, ScrH() / 2, Color(0, 0, 255, 255), TEXT_ALIGN_CENTER)
    end)
end)

usermessage.Hook("FAdmin_ban_cancel", function()
    hook.Remove("HUDPaint", "FAdmin_ban")
    FAdmin.Messages.AddMessage(4, "Ban was canceled by admin")
end)

usermessage.Hook("FAdmin_ban_update", function(um)
    BanTimeText = FAdmin.PlayerActions.ConvertBanTime(um:ReadLong())
    BanText = um:ReadString()
end)

--[[---------------------------------------------------------------------------
Show the window for banning
---------------------------------------------------------------------------]]
local function showBanWindow(SteamID, NICK, time, reason)
    local BanTime = time or 60
    NICK = NICK or ""
    reason = reason or "No reason"
    local M,H,D,W,Y = BanTime % 60,
        math.floor(BanTime / 60) % 24,
        math.floor(BanTime / 1440) % 7,
        math.floor(BanTime / 10080) % 53,
        math.floor(BanTime / 525948)

    RunConsoleCommand("_FAdmin", "ban", SteamID, "start")

    local Window = vgui.Create("DFrame")
    Window:SetTitle("Ban Details")
    Window:SetDraggable(false)
    Window:ShowCloseButton(false)
    Window:SetBackgroundBlur(true)
    Window:SetDrawOnTop(true)

    local InnerPanel = vgui.Create("DPanel", Window)
    InnerPanel:SetPaintBackground(false)

    local Text = vgui.Create("DLabel", InnerPanel)
        Text:SetText("Ban " .. NICK .. "")
        Text:SizeToContents()
        Text:SetContentAlignment(5)


    local TimePanel = vgui.Create("DPanel", Window)
    TimePanel:SetPaintBackground(false)

    local TextEntry = vgui.Create("DTextEntry", TimePanel)
        function TextEntry:OnTextChanged()
            RunConsoleCommand("_FAdmin", "ban", SteamID, "update", BanTime, self:GetValue())
        end
        TextEntry:SetText(DarkRP.deLocalise(reason))
        TextEntry.OnEnter = function() Window:Close() RunConsoleCommand("_FAdmin", "ban", SteamID, "execute", BanTime, TextEntry:GetValue()) end
        function TextEntry:OnFocusChanged(changed)
            self:RequestFocus()
            self:SelectAllText(true)
        end

    local Minutes = vgui.Create("DNumberWang", TimePanel)
    Minutes:SetMinMax(0, 59)
    Minutes:SetDecimals(0)
    Minutes:SetValue(M)

    local Hours = vgui.Create("DNumberWang", TimePanel)
    Hours:SetMinMax(0, 23)
    Hours:SetValue(H)
    Hours:SetDecimals(0)

    local Days = vgui.Create("DNumberWang", TimePanel)
    Days:SetMinMax(0, 6)
    Days:SetValue(D)
    Days:SetDecimals(0)

    local Weeks = vgui.Create("DNumberWang", TimePanel)
    Weeks:SetMinMax(0, 53)
    Weeks:SetValue(W)
    Weeks:SetDecimals(0)

    local Years = vgui.Create("DNumberWang", TimePanel)
    Years:SetMinMax(0, 3)
    Years:SetValue(Y)
    Years:SetDecimals(0)

    local MinLabel, HourLabel, DayLabel, WeekLabel, YearLabel = vgui.Create("DLabel", TimePanel), vgui.Create("DLabel", TimePanel),
    vgui.Create("DLabel", TimePanel), vgui.Create("DLabel", TimePanel), vgui.Create("DLabel", TimePanel)
    MinLabel:SetText("Minutes:")
    HourLabel:SetText("Hours:")
    DayLabel:SetText("Days:")
    WeekLabel:SetText("Weeks:")
    YearLabel:SetText("Years:")


    MinLabel:SetPos(370, 0)
    HourLabel:SetPos(280, 0)
    DayLabel:SetPos(190, 0)
    WeekLabel:SetPos(100, 0)
    YearLabel:SetPos(10, 0)

    local function update()
        BanTime = M + H * 60 + D * 1440 + W * 10080 + Y * 525948
        RunConsoleCommand("_FAdmin", "ban", SteamID, "update", BanTime, TextEntry:GetValue())
    end

    function Minutes:OnValueChanged(val) if val == M then return end M = val update() end
    function Hours:OnValueChanged(val) if val == H then return end H = val update() end
    function Days:OnValueChanged(val) if val == D then return end D = val update() end
    function Weeks:OnValueChanged(val) if val == W then return end W = val update() end
    function Years:OnValueChanged(val) if val == Y then return end Y = val update() end

    local ButtonPanel = vgui.Create("DPanel", Window)
    ButtonPanel:SetTall(25)
    ButtonPanel:SetPaintBackground(false)

    local Button = vgui.Create("DButton", ButtonPanel)
        Button:SetText("OK")
        Button:SizeToContents()
        Button:SetTall(20)
        Button:SetWide(Button:GetWide() + 20)
        Button:SetPos(5, 3)
        Button.DoClick = function()
            Window:Close()
            M, H, D, W, Y = Minutes:GetValue(), Hours:GetValue(), Days:GetValue(), Weeks:GetValue(), Years:GetValue()
            update()
            RunConsoleCommand("_FAdmin", "ban", SteamID, BanTime, (TextEntry and TextEntry:GetValue()) or "")
        end

    local ButtonCancel = vgui.Create("DButton", ButtonPanel)
        ButtonCancel:SetText("Cancel")
        ButtonCancel:SizeToContents()
        ButtonCancel:SetTall(20)
        ButtonCancel:SetWide(Button:GetWide() + 20)
        ButtonCancel:SetPos(5, 3)
        ButtonCancel.DoClick = function() Window:Close() RunConsoleCommand("_FAdmin", "ban", SteamID, "cancel") end
        ButtonCancel:MoveRightOf(Button, 5)

    ButtonPanel:SetWide(Button:GetWide() + 5 + ButtonCancel:GetWide() + 10)

    Window:SetSize(450, 111 + 75 + 20)
    Window:Center()

    InnerPanel:StretchToParent(5, 25, 5, 125)
    TimePanel:StretchToParent(5, 83, 5, 37)

    Minutes:SetPos(370, 20)
    Hours:SetPos(280, 20)
    Days:SetPos(190, 20)
    Weeks:SetPos(100, 20)
    Years:SetPos(10, 20)

    Text:StretchToParent(5, 5, 5, nil)

    TextEntry:StretchToParent(5, nil, 5, nil)
    TextEntry:AlignBottom(5)

    TextEntry:RequestFocus()

    ButtonPanel:CenterHorizontal()
    ButtonPanel:AlignBottom(7)

    Window:MakePopup()
    Window:DoModal()
end

--[[
ADD BUTTONS ETC. TO MENU
]]
FAdmin.StartHooks["CL_KickBan"] = function()
    FAdmin.Access.AddPrivilege("Kick", 2)
    FAdmin.Access.AddPrivilege("Ban", 2)
    FAdmin.Access.AddPrivilege("UnBan", 2)

    FAdmin.Commands.AddCommand("kick", nil, "<Player>", "[Reason]")
    FAdmin.Commands.AddCommand("ban", nil, "<Player>", "<Time (minutes)>", "[Reason]")
    FAdmin.Commands.AddCommand("unban", "<SteamID>")

    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Quick Kick", function(ply, Panel)
        RunConsoleCommand("_FAdmin", "kick", ply:UserID(), "Quick kick")
        if IsValid(Panel) then Panel:Remove() end
    end)
    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Ban", function(ply, Panel)
        showBanWindow(ply:SteamID(), ply:Nick())
        if IsValid(Panel) then Panel:Remove() end
    end)


    -- Kick button
    FAdmin.ScoreBoard.Player:AddActionButton("Kick", "fadmin/icons/kick", nil, function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Kick", ply) end, function(ply)
        if not IsValid(ply) then return end
        local UserID = ply:UserID()
        local NICK = ply:Nick()

        RunConsoleCommand("FAdmin", "kick", UserID, "start")
        local Window = vgui.Create("DFrame")
        Window:SetTitle("Reason for kicking")
        Window:SetDraggable(false)
        Window:ShowCloseButton(false)
        Window:SetBackgroundBlur(true)
        Window:SetDrawOnTop(true)

        local InnerPanel = vgui.Create("DPanel", Window)
        InnerPanel:SetPaintBackground(false)

        local Text = vgui.Create("DLabel", InnerPanel)
            Text:SetText(NICK .. " knows they are getting kicked\nTake all your time entering the reason, they can't do anything anymore")
            Text:SizeToContents()
            Text:SetContentAlignment(5)
            Text:SetTextColor(color_white)

        local TextEntry = vgui.Create("DTextEntry", InnerPanel)
            function TextEntry:OnTextChanged()
                RunConsoleCommand("_FAdmin", "kick", UserID, "update", self:GetValue())
            end
            TextEntry:SetText("Enter reason here")
            TextEntry.OnEnter = function() Window:Close() RunConsoleCommand("_FAdmin", "kick", UserID, "execute", TextEntry:GetValue()) end
            function TextEntry:OnFocusChanged(changed)
                self:RequestFocus()
                self:SelectAllText(true)
            end



        local ButtonPanel = vgui.Create("DPanel", Window)
        ButtonPanel:SetTall(30)
        ButtonPanel:SetPaintBackground(false)

        local Button = vgui.Create("DButton", ButtonPanel)
            Button:SetText("OK")
            Button:SizeToContents()
            Button:SetTall(20)
            Button:SetWide(Button:GetWide() + 20)
            Button:SetPos(5, 5)
            Button.DoClick = function() Window:Close() RunConsoleCommand("_FAdmin", "kick", UserID, "execute", TextEntry:GetValue()) end

        local ButtonCancel = vgui.Create("DButton", ButtonPanel)
            ButtonCancel:SetText("Cancel")
            ButtonCancel:SizeToContents()
            ButtonCancel:SetTall(20)
            ButtonCancel:SetWide(Button:GetWide() + 20)
            ButtonCancel:SetPos(5, 5)

        ButtonCancel.DoClick = function()
            Window:Close()
            RunConsoleCommand("FAdmin", "kick", UserID, "cancel")
        end

        ButtonCancel:MoveRightOf(Button, 5)
        ButtonPanel:SetWide(Button:GetWide() + 5 + ButtonCancel:GetWide() + 10)
        local w, h = Text:GetSize()
        w = math.max(w, 400)
        Window:SetSize(w + 50, h + 25 + 75 + 10)
        Window:Center()
        InnerPanel:StretchToParent(5, 25, 5, 45)
        Text:StretchToParent(5, 5, 5, 35)
        TextEntry:StretchToParent(5, nil, 5, nil)
        TextEntry:AlignBottom(5)
        TextEntry:RequestFocus()
        ButtonPanel:CenterHorizontal()
        ButtonPanel:AlignBottom(8)

        Window:MakePopup()
        Window:DoModal()
    end)

    -- Ban button
    FAdmin.ScoreBoard.Player:AddActionButton("Ban", "fadmin/icons/ban", nil, function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Ban", ply) end, function(ply)
        local SteamID = ply:SteamID()
        local NICK = ply:Nick()

        if ply:IsBot() then SteamID = "BOT" end
        showBanWindow(SteamID, NICK)
    end)

    FAdmin.ScoreBoard.Server:AddPlayerAction("Unban", function() return "fadmin/icons/ban", "fadmin/icons/disable" end, Color(0, 155, 0, 255), true, function(button)
        local selectedLine

        local Frame = vgui.Create("DFrame")
        Frame:SetSize(740, 600)
        Frame:SetTitle("Unban Details")
        Frame:SetDraggable(true)
        Frame:ShowCloseButton(true)
        Frame:SetBackgroundBlur(true)
        Frame:SetDrawOnTop(true)

        local BanList = vgui.Create("DListView", Frame)
        BanList:StretchToParent(5, 55, 5, 5)
        BanList:AddColumn("SteamID")
        BanList:AddColumn("Name")
        BanList:AddColumn("Time")
        BanList:AddColumn("Reason")
        BanList:AddColumn("Banned by")
        BanList:AddColumn("Banned by SteamID")

        local unban = vgui.Create("DButton", Frame)
        unban:SetText("Unban")
        unban:SetPos(695, 25)
        unban:SetSize(40, 25)

        function unban:DoClick()
            if IsValid(selectedLine) then
                RunConsoleCommand("_FAdmin", "Unban", string.upper(selectedLine:GetValue(1)))
                BanList:RemoveLine(selectedLine:GetID())
            end
        end

        local edit = vgui.Create("DButton", Frame)
        edit:SetText("Edit")
        edit:SetPos(650, 25)
        edit:SetSize(40, 25)
        function edit:DoClick()
            if not selectedLine then return end
            showBanWindow(selectedLine:GetValue(1), selectedLine.name, selectedLine.time > os.time() and (selectedLine.time - os.time()) / 60 or 0, selectedLine.reason)
            Frame:Close()
        end

    local function RetrieveBans(len)
        local banCount = net.ReadUInt(32)

        for i = 1, banCount do
            local steamid = net.ReadString()
            local time = net.ReadUInt(32)
            local name = net.ReadString()
            local reason = net.ReadString()
            local adminname = net.ReadString()
            local adminsteam = net.ReadString()


            local Line = BanList:AddLine(
                    steamid,
                    name or "N/A",
                    (tonumber(time or "") and FAdmin.PlayerActions.ConvertBanTime((tonumber(time) - os.time()) / 60)) or "N/A",
                    reason or "",
                    adminname or "",
                    adminsteam or "")
                Line.name = name
                Line.time = time
                Line.reason = reason

                function Line:OnSelect()
                    selectedLine = self
                end
            end
        end
        net.Receive("FAdmin_retrievebans", RetrieveBans)
        RunConsoleCommand("_FAdmin", "RequestBans")

        Frame:Center()
        Frame:MakePopup()
        Frame:DoModal()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/jail/cl_init.lua:
FAdmin.StartHooks["Jail"] = function()
    FAdmin.Access.AddPrivilege("Jail", 2)
    FAdmin.Commands.AddCommand("Jail", nil, "<Player>", "[Small/Normal/Big]", "[Time]")
    FAdmin.Commands.AddCommand("UnJail", nil, "<Player>")

    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Jail/Unjail", function(ply)
        if ply:FAdmin_GetGlobal("fadmin_jailed") then
            RunConsoleCommand("_FAdmin", "unjail", ply:UserID())
        else
            RunConsoleCommand("_FAdmin", "jail", ply:UserID())
        end
    end)

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        if ply:FAdmin_GetGlobal("fadmin_jailed") then return "Unjail" end
        return "Jail"
    end,
    function(ply)
        if ply:FAdmin_GetGlobal("fadmin_jailed") then return "fadmin/icons/jail", "fadmin/icons/disable" end
        return "fadmin/icons/jail"
    end,
    Color(255, 130, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Jail", ply) end,
    function(ply, button)
        if ply:FAdmin_GetGlobal("fadmin_jailed") then RunConsoleCommand("_FAdmin", "unjail", ply:UserID()) button:SetImage2("null") button:SetText("Jail") button:GetParent():InvalidateLayout() return end

        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Jail Type:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)

        menu:AddPanel(Title)

        for k, v in pairs(FAdmin.PlayerActions.JailTypes) do
            if v == "Unjail" then continue end
            FAdmin.PlayerActions.addTimeSubmenu(menu, v .. " jail",
                function()
                    RunConsoleCommand("_FAdmin", "Jail", ply:UserID(), k)
                    button:SetText("Unjail") button:GetParent():InvalidateLayout()
                    button:SetImage2("fadmin/icons/disable")
                end,
                function(secs)
                    RunConsoleCommand("_FAdmin", "Jail", ply:UserID(), k, secs)
                    button:SetText("Unjail")
                    button:GetParent():InvalidateLayout()
                    button:SetImage2("fadmin/icons/disable")
                end
            )
        end

        menu:Open()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/health/cl_init.lua:
FAdmin.StartHooks["Health"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "sethealth",
        hasTarget = true,
        message = {"instigator", " set the health of ", "targets", " to ", "extraInfo.1"},
        readExtraInfo = function() return {tostring(net.ReadUInt(16))} end
    }

    FAdmin.Access.AddPrivilege("SetHealth", 2)
    FAdmin.Commands.AddCommand("hp", nil, "<Player>", "<health>")
    FAdmin.Commands.AddCommand("SetHealth", nil, "[Player]", "<health>")

    FAdmin.ScoreBoard.Player:AddActionButton("Set health", "icon16/heart.png", Color(255, 130, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "SetHealth", ply) end,
    function(ply, button)
        --Do nothing when the button has been clicked
    end,
    function(ply, button) -- Create the Wang when the mouse is pressed
        button.OnMousePressed = function()
            local window = Derma_StringRequest("Select health", "What do you want the health of the person to be?", "",
                function(text)
                    local health = DarkRP.toInt(text or 100) or 100
                    RunConsoleCommand("_fadmin", "SetHealth", ply:UserID(), health)
                end
            )

            -- The user is usually holding tab when clicking health, so fix the focus
            window:RequestFocus()
        end
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/chatmute/cl_init.lua:
FAdmin.StartHooks["Chatmute"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "chatmute",
        hasTarget = true,
        message = {"instigator", " chat muted ", "targets", " ", "extraInfo.1"},
        readExtraInfo = function()
            local time = net.ReadUInt(16)

            return {time == 0 and FAdmin.PlayerActions.commonTimes[time] or string.format("for %s", FAdmin.PlayerActions.commonTimes[time] or (time .. " seconds"))}
        end
    }

    FAdmin.Messages.RegisterNotification{
        name = "chatunmute",
        hasTarget = true,
        message = {"instigator", " chat unmuted ", "targets"},
    }

    FAdmin.Access.AddPrivilege("Chatmute", 2)
    FAdmin.Commands.AddCommand("Chatmute", nil, "<Player>")
    FAdmin.Commands.AddCommand("UnChatmute", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_chatmuted") then return "Unmute chat" end
        return "Mute chat"
    end, function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_chatmuted") then return "fadmin/icons/chatmute" end
        return "fadmin/icons/chatmute", "fadmin/icons/disable"
    end, Color(255, 130, 0, 255),

    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Chatmute", ply) end, function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_chatmuted") then
            FAdmin.PlayerActions.addTimeMenu(function(secs)
                RunConsoleCommand("_FAdmin", "chatmute", ply:UserID(), secs)
                button:SetImage2("null")
                button:SetText("Unmute chat")
                button:GetParent():InvalidateLayout()
            end)
        else
            RunConsoleCommand("_FAdmin", "UnChatmute", ply:UserID())
        end

        button:SetImage2("fadmin/icons/disable")
        button:SetText("Mute chat")
        button:GetParent():InvalidateLayout()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/f4menu/cl_entitiestab.lua:
--[[---------------------------------------------------------------------------
Base panel for custom entities
---------------------------------------------------------------------------]]
local PANEL = {}

function PANEL:Init()
    self:EnableVerticalScrollbar()
    timer.Simple(0, function() if IsValid(self) then self:generateButtons() self:Refresh() end end)
end

function PANEL:Rebuild()
    if table.IsEmpty(self.Items) then return end

    local lHeight, rHeight = 0, 0
    local height = 0
    local k = 0
    local visibleCount = 0
    local lastVisible = 0
    for i, item in pairs(self.Items) do
        if item:IsVisible() then
            visibleCount = visibleCount + 1
            lastVisible = i
        end
    end

    for _, item in pairs(self.Items) do
        if not item:IsVisible() then continue end
        k = k + 1
        local goRight = k % 2 == 0

        item:SetWide(self:GetWide() / 2 - 10)
        local x = goRight and self:GetWide() / 2 or 0
        item:SetPos(x, goRight and rHeight or lHeight)

        rHeight = goRight and rHeight + item:GetTall() + 2 or rHeight
        lHeight = goRight and lHeight or lHeight + item:GetTall() + 2
    end

    -- Make the category stretch if it's the only one
    if visibleCount == 1 then
        self.Items[lastVisible]:SetWide(self:GetWide())
    end

    height = math.max(lHeight, rHeight)
    self:GetCanvas():SetTall(height)
end

function PANEL:generateButtons()
    -- override this
end

function PANEL:isItemHidden(cantBuy, important)
    return cantBuy and (GAMEMODE.Config.hideNonBuyable or (important and GAMEMODE.Config.hideTeamUnbuyable))
end

function PANEL:shouldHide()
    -- override this
end

function PANEL:Refresh()
    for _,v in pairs(self.Items) do
        if v.Refresh then v:Refresh() end
    end
    self:InvalidateLayout()
end

derma.DefineControl("F4MenuEntitiesBase", "", PANEL, "DPanelList")

-- Create categories for an entity tab
local function createCategories(self, categories, itemClick, canBuy)
    for _, cat in pairs(categories) do
        local dCat = vgui.Create("F4MenuCategory", self)

        dCat:SetButtonFactory(function(item, ui)
            local pnl = vgui.Create("F4MenuEntityButton", ui)
            pnl:setDarkRPItem(item)
            pnl.DoClick = fp{itemClick, item}

            return pnl
        end)

        dCat:SetPerformLayout(function(contents)
            local anyVisible = false
            for _, v in pairs(contents.Items) do
                local can, important, _, price = canBuy(v.DarkRPItem)
                v:SetDisabled(not can, important)
                v:updatePrice(price)
                anyVisible = anyVisible or v:IsVisible()
            end

            dCat:SetVisible(anyVisible)
        end)

        dCat:SetCategory(cat)
        self:AddItem(dCat)
    end
end

--[[---------------------------------------------------------------------------
Entities panel
---------------------------------------------------------------------------]]
PANEL = {}

local function canBuyEntity(item)
    local ply = LocalPlayer()

    if istable(item.allowed) and not table.HasValue(item.allowed, ply:Team()) then return false, true end
    if item.customCheck and not item.customCheck(ply) then return false, true end

    local canbuy, suppress, message, price = hook.Call("canBuyCustomEntity", nil, ply, item)
    local cost = price or item.getPrice and item.getPrice(ply, item.price) or item.price
    if not ply:canAfford(cost) then return false, false, message, cost end

    if canbuy == false then
        return false, suppress, message, cost
    end

    return true, nil, message, cost
end

function PANEL:generateButtons()
    local categories = DarkRP.getCategories().entities

    createCategories(self, categories, function(item) RunConsoleCommand("DarkRP", item.cmd) end, canBuyEntity)
end

function PANEL:shouldHide()
    for _, v in pairs(DarkRPEntities) do
        local canBuy, important = canBuyEntity(v)
        if not self:isItemHidden(not canBuy, important) then return false end
    end
    return true
end

derma.DefineControl("F4MenuEntities", "", PANEL, "F4MenuEntitiesBase")

--[[---------------------------------------------------------------------------
Shipments panel
---------------------------------------------------------------------------]]
PANEL = {}

local function canBuyShipment(ship)
    local ply = LocalPlayer()

    if not table.HasValue(ship.allowed, ply:Team()) then return false, true end
    if ship.customCheck and not ship.customCheck(ply) then return false, true end

    local canbuy, suppress, message, price = hook.Call("canBuyShipment", nil, ply, ship)
    local cost = price or ship.getPrice and ship.getPrice(ply, ship.price) or ship.price

    if not ply:canAfford(cost) then return false, false, message, cost end

    if canbuy == false then
        return false, suppress, message, cost
    end

    return true, nil, message, cost
end

function PANEL:generateButtons()
    local categories = DarkRP.getCategories().shipments

    createCategories(self, categories, function(item) RunConsoleCommand("DarkRP", "buyshipment", item.name) end, canBuyShipment)
end

function PANEL:shouldHide()
    local shipments = fn.Filter(fn.Compose{fn.Not, fn.Curry(fn.GetValue, 2)("noship")}, CustomShipments)

    for _, v in pairs(shipments) do
        local canBuy, important = canBuyShipment(v)
        if not self:isItemHidden(not canBuy, important) then return false end
    end

    return true
end

derma.DefineControl("F4MenuShipments", "", PANEL, "F4MenuEntitiesBase")

--[[---------------------------------------------------------------------------
Gun buying panel
---------------------------------------------------------------------------]]
PANEL = {}

local function canBuyGun(ship)
    local ply = LocalPlayer()

    if GAMEMODE.Config.restrictbuypistol and not table.HasValue(ship.allowed, ply:Team()) then return false, true end
    if ship.customCheck and not ship.customCheck(ply) then return false, true end

    local canbuy, suppress, message, price = hook.Call("canBuyPistol", nil, ply, ship)
    local cost = price or ship.getPrice and ship.getPrice(ply, ship.pricesep) or ship.pricesep

    if not ply:canAfford(cost) then return false, false, message, cost end

    if canbuy == false then
        return false, suppress, message, cost
    end

    return true, nil, message, cost
end

function PANEL:generateButtons()
    local categories = DarkRP.getCategories().weapons

    createCategories(self, categories, function(item) RunConsoleCommand("DarkRP", "buy", item.name) end, canBuyGun)
end

function PANEL:shouldHide()
    local shipments = fn.Filter(fn.Curry(fn.GetValue, 2)("separate"), CustomShipments)

    for _, v in pairs(shipments) do
        local canBuy, important = canBuyGun(v)

        if not self:isItemHidden(not canBuy, important) then return false end
    end

    return true
end

derma.DefineControl("F4MenuGuns", "", PANEL, "F4MenuEntitiesBase")

--[[---------------------------------------------------------------------------
Ammo panel
---------------------------------------------------------------------------]]
PANEL = {}

local function canBuyAmmo(item)
    local ply = LocalPlayer()

    if item.customCheck and not item.customCheck(ply) then return false, true end

    local canbuy, suppress, message, price = hook.Call("canBuyAmmo", nil, ply, item)
    local cost = price or item.getPrice and item.getPrice(ply, item.price) or item.price
    if not ply:canAfford(cost) then return false, false, message, cost end

    if canbuy == false then
        return false, suppress, message, price
    end

    return true, nil, message, price
end

function PANEL:generateButtons()
    local categories = DarkRP.getCategories().ammo

    createCategories(self, categories, function(item) RunConsoleCommand("DarkRP", "buyammo", item.id) end, canBuyAmmo)
end

function PANEL:shouldHide()
    for _, v in pairs(GAMEMODE.AmmoTypes) do
        local canBuy, important = canBuyAmmo(v)
        if not self:isItemHidden(not canBuy, important) then return false end
    end
    return true
end

derma.DefineControl("F4MenuAmmo", "", PANEL, "F4MenuEntitiesBase")

--[[---------------------------------------------------------------------------
Vehicles panel
---------------------------------------------------------------------------]]
PANEL = {}

local function canBuyVehicle(item)
    local ply = LocalPlayer()
    local cost = item.getPrice and item.getPrice(ply, item.price) or item.price

    if istable(item.allowed) and not table.HasValue(item.allowed, ply:Team()) then return false, true end
    if item.customCheck and not item.customCheck(ply) then return false, true end

    local canbuy, suppress, message, price = hook.Call("canBuyVehicle", nil, ply, item)

    cost = price or cost

    if not ply:canAfford(cost) then return false, false, message, cost end

    if canbuy == false then
        return false, suppress, message, cost
    end

    return true, nil, message, cost
end

function PANEL:generateButtons()
    local categories = DarkRP.getCategories().vehicles

    createCategories(self, categories, function(item) RunConsoleCommand("DarkRP", "buyvehicle", item.command or item.name) end, canBuyVehicle)
end

derma.DefineControl("F4MenuVehicles", "", PANEL, "F4MenuEntitiesBase")

--PATH gamemodes/mangarp/gamemode/modules/f4menu/cl_categories.lua:
--[[---------------------------------------------------------------------------
Category header
---------------------------------------------------------------------------]]
local PANEL = {}

function PANEL:Init()
    self:SetContentAlignment(4)
    self:SetTextInset(5, 0)
    self:SetFont("DarkRPHUD2")
end

function PANEL:Paint(w, h)
    if not self.category then return end
    draw.RoundedBox(4, 0, 0, w, h, self.category.color)
end

function PANEL:UpdateColours() end

function PANEL:SetCategory(cat)
    self.category = cat
    self:SetText(cat.name)
end

derma.DefineControl("F4MenuCategoryHeader", "", PANEL, "DCategoryHeader")

--[[---------------------------------------------------------------------------
Contents of category headers
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:Init()
    self:EnableVerticalScrollbar()
end

function PANEL:Rebuild()
    if table.IsEmpty(self.Items) then return end

    local height = 0
    local k = 0
    for _, item in pairs(self.Items) do
        if not item:IsVisible() then continue end
        k = k + 1
        item:SetWide(self:GetWide() - 10)
        item:SetPos(5, height)
        height = height + item:GetTall() + 2
    end
    self:GetCanvas():SetTall(height)
    self:SetTall(height)
end


function PANEL:Refresh()
    for _, v in pairs(self.Items) do
        if v.Refresh then v:Refresh() end
    end
    self:InvalidateLayout()
end

derma.DefineControl("F4MenuCategoryContents", "", PANEL, "DPanelList")

--[[---------------------------------------------------------------------------
Category panel
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:Init()
    if self.Header then self.Header:Remove() end
    self.Header = vgui.Create("F4MenuCategoryHeader", self)
    self.Header:Dock(TOP)
    self.Header:SetSize(20, 40)
    self:SetSize(16, 16)
    self:SetExpanded(true)
    self:SetMouseInputEnabled(true)
    self:SetAnimTime(0.2)
    self.animSlide = Derma_Anim("Anim", self, self.AnimSlide)
    self:SetPaintBackgroundEnabled(false)
    self:DockMargin(0, 0, 0, 10)
    self:DockPadding(0, 0, 0, 10)

    self:SetContents(vgui.Create("F4MenuCategoryContents", self))
end

function PANEL:Paint()

end

function PANEL:SetButtonFactory(f)
    self.buttonFactory = f
end

function PANEL:SetCategory(cat)
    self.category = cat
    self.Header:SetCategory(cat)
    self:Fill()
    self:SetExpanded(cat.startExpanded)
end

function PANEL:SetPerformLayout(f)
    self.Contents.PerformLayout = function()
        f(self.Contents)
        self.Contents.BaseClass.PerformLayout(self.Contents)
    end
end

function PANEL:GetItems()
    return self.Contents:GetItems()
end

function PANEL:Fill()
    self.Contents:Clear(true)
    for _, v in ipairs(self.category.members) do
        local pnl = self.buttonFactory(v, self.Contents)
        self.Contents:AddItem(pnl)
    end

    self:InvalidateLayout(true)
end

function PANEL:Refresh()
    if IsValid(self.Contents) then self.Contents:Refresh() end

    if not self.category then return end
    local canSee = table.IsEmpty(self.category.members) or isfunction(self.category.canSee) and not self.category.canSee(LocalPlayer())
    self:SetVisible(not canSee)

    self:InvalidateLayout()
end

derma.DefineControl("F4MenuCategory", "", PANEL, "DCollapsibleCategory")

--PATH gamemodes/mangarp/gamemode/modules/base/cl_entityvars.lua:
local DarkRPVars = {}

--[[---------------------------------------------------------------------------
Interface
---------------------------------------------------------------------------]]
local pmeta = FindMetaTable("Player")
-- This function is made local to optimise getDarkRPVar, which is called often
-- enough to warrant optimizing. See https://github.com/FPtje/DarkRP/pull/3212
local get_user_id = pmeta.UserID
function pmeta:getDarkRPVar(var, fallback)
    local vars = DarkRPVars[get_user_id(self)]
    if vars == nil then return fallback end

    local results = vars[var]
    if results == nil then return fallback end

    return results
end

--[[---------------------------------------------------------------------------
Retrieve the information of a player var
---------------------------------------------------------------------------]]
local function RetrievePlayerVar(userID, var, value)
    local ply = Player(userID)
    DarkRPVars[userID] = DarkRPVars[userID] or {}

    hook.Call("DarkRPVarChanged", nil, ply, var, DarkRPVars[userID][var], value)
    DarkRPVars[userID][var] = value

    -- Backwards compatibility
    if IsValid(ply) then
        ply.DarkRPVars = DarkRPVars[userID]
    end
end

--[[---------------------------------------------------------------------------
Retrieve a player var.
Read the usermessage and attempt to set the DarkRP var
---------------------------------------------------------------------------]]
local function doRetrieve()
    local userID = net.ReadUInt(16)
    local var, value = DarkRP.readNetDarkRPVar()

    RetrievePlayerVar(userID, var, value)
end
net.Receive("DarkRP_PlayerVar", doRetrieve)

--[[---------------------------------------------------------------------------
Retrieve the message to remove a DarkRPVar
---------------------------------------------------------------------------]]
local function doRetrieveRemoval()
    local userID = net.ReadUInt(16)
    local vars = DarkRPVars[userID] or {}
    local var = DarkRP.readNetDarkRPVarRemoval()
    local ply = Player(userID)

    hook.Call("DarkRPVarChanged", nil, ply, var, vars[var], nil)

    vars[var] = nil
end
net.Receive("DarkRP_PlayerVarRemoval", doRetrieveRemoval)

--[[---------------------------------------------------------------------------
Initialize the DarkRPVars at the start of the game
---------------------------------------------------------------------------]]
local function InitializeDarkRPVars(len)
    local plyCount = net.ReadUInt(8)

    for i = 1, plyCount, 1 do
        local userID = net.ReadUInt(16)
        local varCount = net.ReadUInt(DarkRP.DARKRP_ID_BITS + 2)

        for j = 1, varCount, 1 do
            local var, value = DarkRP.readNetDarkRPVar()
            RetrievePlayerVar(userID, var, value)
        end
    end
end
net.Receive("DarkRP_InitializeVars", InitializeDarkRPVars)
timer.Simple(0, fp{RunConsoleCommand, "_sendDarkRPvars"})

net.Receive("DarkRP_DarkRPVarDisconnect", function(len)
    local userID = net.ReadUInt(16)
    DarkRPVars[userID] = nil
end)

--[[---------------------------------------------------------------------------
Request the DarkRPVars when they haven't arrived
---------------------------------------------------------------------------]]
timer.Create("DarkRPCheckifitcamethrough", 15, 0, function()
    for _, v in ipairs(player.GetAll()) do
        if v:getDarkRPVar("rpname") then continue end

        RunConsoleCommand("_sendDarkRPvars")
        return
    end

    timer.Remove("DarkRPCheckifitcamethrough")
end)

--PATH gamemodes/mangarp/gamemode/config/addentities.lua:

DarkRP.createCategory{
    name = "Other",
    categorises = "entities",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

DarkRP.createCategory{
    name = "Rifles",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 100,
}

DarkRP.createCategory{
    name = "Shotguns",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 101,
}

DarkRP.createCategory{
    name = "Snipers",
    categorises = "shipments",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 102,
}

DarkRP.createCategory{
    name = "Pistols",
    categorises = "weapons",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 100,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "weapons",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "vehicles",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

--PATH addons/sl_utils/lua/weapons/cross_arms_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Author					= "Mattzimann & Oninoni & Flynt"
SWEP.Purpose				= "You can now cross your arms behind your back!"
SWEP.Instructions 			= "Click to cross your arms."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Cross Arms"
SWEP.Spawnable				= true

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(3.809, 15.382, 2.654),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(-63.658, 1.8 , -84.928),
	        ["ValveBiped.Bip01_L_UpperArm"] = Angle(3.809, 15.382, 2.654),
	        ["ValveBiped.Bip01_L_Forearm"] = Angle(53.658, -29.718, 31.455),

	        ["ValveBiped.Bip01_R_Thigh"] = Angle(4.829, 0, 0),
	        ["ValveBiped.Bip01_L_Thigh"] = Angle(-8.89, 0, 0),
	    }
	end
end

--PATH addons/sl_util_wallet/lua/weapons/ez_wallet_card/cl_init.lua:


include("shared.lua")

function SWEP:SetupDataTables()
	self:NetworkVar("String", 0, "BodygroupsString")
 	self:NetworkVar("String", 1, "Side")
 	self:NetworkVar("String", 2, "BaseTexture")
end

function SWEP:Initialize()
    self:SetHoldType(self.HoldType)

    local hand = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Finger2")
    if hand then
        self:FollowBone(self:GetOwner(), hand)
    end

    self.id = easzy.wallet.itemID
    easzy.wallet.itemID = easzy.wallet.itemID + 1
end

function SWEP:PostDrawViewModel(viewModel, weapon, ply)
    local baseTexture = weapon:GetBaseTexture()
    if not baseTexture or baseTexture == "" then return end

    if not weapon.id then return end
    viewModel.id = weapon.id

    local owner = weapon:GetOwner()
    if not IsValid(owner) then return end

    easzy.wallet.UpdateCardMaterial(baseTexture, owner, viewModel)

    local currentAnim = easzy.wallet.GetViewModelAnimationName(ply)
    if currentAnim == "idle_front" or currentAnim == "idle_back" then
        self:Draw3D2DGui(viewModel, currentAnim)
    end
end

function SWEP:Draw3D2DGui(viewModel, currentAnim)
    local cardBone = viewModel:LookupBone("Card")
    if not cardBone then return end

    -- 3D2D
    local cardBonePos, cardBoneAng = viewModel:GetBonePosition(cardBone)
    if cardBonePos == viewModel:GetPos() then
        cardBonePos = viewModel:GetBoneMatrix(cardBone):GetTranslation()
    end
    cardBoneAng:RotateAroundAxis(cardBoneAng:Forward(), 90)
    cardBoneAng:RotateAroundAxis(cardBoneAng:Right(), 90)
    cardBonePos = cardBonePos + cardBoneAng:Up()*0.1

    local x = currentAnim == "idle_front" and 400 or -400
    local align = currentAnim == "idle_front" and TEXT_ALIGN_LEFT or TEXT_ALIGN_RIGHT
    cam.Start3D2D(cardBonePos, cardBoneAng, 0.0045)
		draw.SimpleText(string.upper(easzy.wallet.languages.pressToRotate), "EZFont48", x, -50, easzy.wallet.colors.white, align, TEXT_ALIGN_CENTER)
        if self:GetBaseTexture() == "easzy/ez_wallet/credit_card" then
		    draw.SimpleText(string.upper(easzy.wallet.languages.pressToATM), "EZFont48", x, 50, easzy.wallet.colors.white, align, TEXT_ALIGN_CENTER)
        end
    cam.End3D2D()
end

function SWEP:DrawWorldModel()
    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    local baseTexture = self:GetBaseTexture()
    if not baseTexture or baseTexture == "" then return end

	if not IsValid(self.worldModel) then
		self.worldModel = ClientsideModel(self.WorldModel)
		self.worldModel:SetSkin(1)
		self.worldModel:SetNoDraw(true)
		self.worldModel:DrawShadow(false)

        self.worldModel.id = easzy.wallet.itemID
        easzy.wallet.itemID = easzy.wallet.itemID + 1
	else
        -- Set the same bodygroups as the viewmodel
        local bodygroups = self:GetBodygroupsString()
        if bodygroups then
            self.worldModel:SetBodyGroups(bodygroups)
        end

        easzy.wallet.UpdateCardMaterial(baseTexture, owner, self.worldModel)

        -- Specify a good position
        local offsetVec = Vector(5, -3, -2)
        local side = self:GetSide()
        local offsetAng = side == "front" and Angle(270, 70, 285) or Angle(270, 70, 103)

        local boneid = owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
        if not boneid then return end

        local matrix = owner:GetBoneMatrix(boneid)
        if not matrix then return end

        local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())

        self.worldModel:SetPos(newPos)
        self.worldModel:SetAngles(newAng)
        self.worldModel:SetupBones()
    end
    self.worldModel:DrawModel()
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

--PATH addons/sl_util_wallet/lua/weapons/ez_wallet_money/cl_init.lua:


include("shared.lua")

function SWEP:SetupDataTables()
	self:NetworkVar("String", 0, "BodygroupsString")
 	self:NetworkVar("Int", 0, "Amount")
end

function SWEP:Initialize()
    self:SetHoldType(self.HoldType)

    local hand = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Finger2")
    if hand then
        self:FollowBone(self:GetOwner(), hand)
    end
end

function SWEP:PostDrawViewModel(viewModel, weapon, ply)
    local currentAnim = easzy.wallet.GetViewModelAnimationName(ply)
    if currentAnim == "idle" then
        self:Draw3D2DGui(viewModel)
    end
end

function SWEP:Draw3D2DGui(viewModel)
    local banknoteBone = viewModel:LookupBone("Banknote")
    if not banknoteBone then return end

    -- 3D2D
    local banknoteBonePos, banknoteBoneAng = viewModel:GetBonePosition(banknoteBone)
    if banknoteBonePos == viewModel:GetPos() then
        banknoteBonePos = viewModel:GetBoneMatrix(banknoteBone):GetTranslation()
    end
    banknoteBoneAng:RotateAroundAxis(banknoteBoneAng:Forward(), 90)
    banknoteBoneAng:RotateAroundAxis(banknoteBoneAng:Right(), 90)
    banknoteBonePos = banknoteBonePos + banknoteBoneAng:Up()*1

    cam.Start3D2D(banknoteBonePos, banknoteBoneAng, 0.01)
        local moneyText = string.upper(easzy.wallet.languages.youHave) .. " " .. easzy.wallet.FormatCurrency(LocalPlayer():getDarkRPVar('money'))
        draw.SimpleText(moneyText, "EZFont48", 0, -440, easzy.wallet.colors.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        local amount = self:GetAmount()
        if amount == -1 then
		    draw.SimpleText(string.upper(easzy.wallet.languages.pressToGive), "EZFont48", 0, -360, easzy.wallet.colors.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
		    draw.SimpleText(easzy.wallet.FormatCurrency(amount), "EZFont48", 0, -360, easzy.wallet.colors.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    cam.End3D2D()
end

function SWEP:DrawWorldModel()
    local owner = self:GetOwner()
    if not IsValid(owner) then return end

	if not IsValid(self.worldModel) then
		self.worldModel = ClientsideModel(self.WorldModel)
		self.worldModel:SetSkin(1)
		self.worldModel:SetNoDraw(true)
		self.worldModel:DrawShadow(false)
	else
        -- Set the same bodygroups as the viewmodel
        local bodygroups = self:GetBodygroupsString()
        if bodygroups then
            self.worldModel:SetBodyGroups(bodygroups)
        end

        -- Specify a good position
        local offsetVec = Vector(5, -3, -2)
        local offsetAng = Angle(130, 214, 38)

        local boneid = owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
        if not boneid then return end

        local matrix = owner:GetBoneMatrix(boneid)
        if not matrix then return end

        local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())

        self.worldModel:SetPos(newPos)
        self.worldModel:SetAngles(newAng)
        self.worldModel:SetupBones()
    end
    self.worldModel:DrawModel()
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

--PATH lua/weapons/gmod_tool/stools/drgbase_tool_faction.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_faction.name"
TOOL.ClientConVar = {["list"] = "[]"}
TOOL.BuildCPanel = function(panel)
	panel:Help("#tool.drgbase_tool_faction.desc")
	panel:Help("Click on a faction to remove it from the list, or right click to copy it.")
	local dlist = DrGBase.DListView({"Factions"}, {convar = "drgbase_tool_faction_list"})
	dlist:SetSize(10, 300)
	function dlist:OnRowSelected(row)
		self:RemoveLine(row)
	end
	panel:AddItem(dlist)
	panel:Help("Insert a custom faction here:")
	local entry = vgui.Create("DTextEntry")
	function dlist:OnRowRightClick(id, line)
		entry:SetValue(line:GetValue(1))
	end
	panel:AddItem(entry)
	local insert = vgui.Create("DButton")
	insert:SetText("Insert faction")
	function insert:DoClick()
		dlist:AddLine(string.upper(entry:GetValue()))
	end
	panel:AddItem(insert)
	local clear = vgui.Create("DButton")
	clear:SetText("Clear factions")
	function clear:DoClick()
		dlist:Clear()
	end
	panel:AddItem(clear)
end

function TOOL:ClearFactions()
	if CLIENT then return end
	net.Start("DrGBaseFactionTool")
	net.WriteString("[]")
	net.Send(self:GetOwner())
end
function TOOL:SetFactions(factions)
	if CLIENT then return end
	local list = {}
	for i, faction in ipairs(factions) do
		table.insert(list, {faction})
	end
	net.Start("DrGBaseFactionTool")
	net.WriteString(util.TableToJSON(list))
	net.Send(self:GetOwner())
end

function TOOL:LeftClick(tr)
	local ent = tr.Entity
	if IsValid(ent) and ent.IsDrGNextbot then
		if SERVER then
			ent:LeaveAllFactions()
			local factions = util.JSONToTable(self:GetClientInfo("list"))
			for i, faction in ipairs(factions) do
				if not isstring(faction[1]) then continue end
				ent:JoinFaction(faction[1])
			end
		end
	elseif ent:IsWorld() then
		if SERVER then
			ent = self:GetOwner()
			ent:DrG_LeaveAllFactions()
			local factions = util.JSONToTable(self:GetClientInfo("list"))
			for i, faction in ipairs(factions) do
				if not isstring(faction[1]) then continue end
				ent:DrG_JoinFaction(faction[1])
			end
		end
	else return false end
	return true
end
function TOOL:RightClick(tr)
	local ent = tr.Entity
	if ent:IsPlayer() then
		if SERVER then self:SetFactions(ent:DrG_GetFactions()) end
	elseif ent.IsDrGNextbot then
		if SERVER then self:SetFactions(ent:GetFactions()) end
	elseif ent:IsWorld() then
		if SERVER then self:SetFactions(self:GetOwner():DrG_GetFactions()) end
	else return false end
	return true
end
function TOOL:Reload()
	if CLIENT then return true end
	self:ClearFactions()
	return true
end

if SERVER then
	util.AddNetworkString("DrGBaseFactionTool")
else
	language.Add("tool.drgbase_tool_faction.name", "Faction Tool")
	language.Add("tool.drgbase_tool_faction.desc", "Edit your factions or a nextbot's.")
	language.Add("tool.drgbase_tool_faction.0", "Right click to copy a nextbot/player's factions, left click to apply those factions to a nextbot. (aim at the ground to apply them to yourself)")

	net.Receive("DrGBaseFactionTool", function(len)
		GetConVar("drgbase_tool_faction_list"):SetString(net.ReadString())
	end)
end

--PATH addons/pcasino/lua/weapons/gmod_tool/stools/pcasino_creator.lua:
TOOL.Category = "pCasino"
TOOL.Name = "#tool.pcasino_creator.name"
TOOL.Command = nil
TOOL.Information = {
	{name = "left"},
	{name = "right"},
	{name = "reload"}
} 


if CLIENT then
	language.Add("tool.pcasino_creator.name", "Entity Creation")
	language.Add("tool.pcasino_creator.desc", "Used to place all the pCasino entities.")

    language.Add("tool.pcasino_creator.left", "Place the configured entity.")
    language.Add("tool.pcasino_creator.right", "Open the menu to configure an entity.")
    language.Add("tool.pcasino_creator.reload", "Remove the entity permanently.")
end

local cooldown = 0
local currentEnt
local offset = {
	["pcasino_slot_machine"] = function(ent) return Vector(0, 0, 48) end,
	["pcasino_roulette_table"] = function(ent) return Vector(0, 0, 20) end,
	["pcasino_blackjack_table"] = function(ent) return Vector(0, 0, 22) end,
	["pcasino_wheel_slot_machine"] = function(ent) return Vector(0, 0, 44) end,
	["pcasino_mystery_wheel"] = function(ent) return Vector(0, 0, 61) end,
	["pcasino_sign_plaque"] = function(ent) return ent:GetForward() * 4 end,
	["pcasino_sign_stand"] = function(ent) return Vector(0, 0, 27) end,
	["pcasino_sign_wall_logo"] = function(ent) return ent:GetForward() * 6 end,
	["pcasino_sign_interior_standing"] = function(ent) return Vector(0, 0, 29	) end,
	["pcasino_sign_interior_wall"] = function(ent) return ent:GetForward() * 2.5 end,
	["pcasino_chair"] = function(ent) return Vector(0, 0, 26) end,
	["pcasino_prize_plinth"] = function(ent) return Vector(0, 0, 0) end,
	["pcasino_npc"] = function(ent) return Vector(0, 0, 1) end
}
local ang = {
	["pcasino_chair"] = function(ent) return Angle(0, 180, 0) end
}

function TOOL:LeftClick(trace)
	if SERVER then return end
	if PerfectCasino.Cooldown.Check("ToolGun:Cooldown", 1) then return end
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	if not PerfectCasino.UI.CurrentSettings.Entity then
		PerfectCasino.Core.Msg(PerfectCasino.Translation.ToolGun.NoEntity)
		return
	end

	if cooldown > CurTime() then return end
	cooldown = CurTime() + 1

	plyAngle = LocalPlayer():GetAngles()
	net.Start("pCasino:ToolGun:CreateEntity")
		net.WriteString(PerfectCasino.UI.CurrentSettings.Entity)
		net.WriteTable(PerfectCasino.UI.CurrentSettings.Settings)
		net.WriteVector(trace.HitPos + plyAngle:Forward() + plyAngle:Up() + (offset[PerfectCasino.UI.CurrentSettings.Entity] and offset[PerfectCasino.UI.CurrentSettings.Entity](currentEnt) or vector_origin))
		net.WriteAngle(Angle(0, math.Round(plyAngle.y/10)*10 + 180, plyAngle.z) + (ang[PerfectCasino.UI.CurrentSettings.Entity] and ang[PerfectCasino.UI.CurrentSettings.Entity](currentEnt) or angle_zero))
	net.SendToServer()
end

function TOOL:RightClick(trace)
	if SERVER then return end
	if PerfectCasino.Cooldown.Check("ToolGun:Cooldown", 1) then return end
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	if cooldown > CurTime() then return end
	cooldown = CurTime() + 1
	PerfectCasino.UI.Config()
end

function TOOL:Reload(trace)
	if CLIENT then return end
	if not PerfectCasino.Core.Access(self:GetOwner()) then return end
	local entity = trace.Entity
	if not entity.DatabaseID then return end
	PerfectCasino.Database.DeleteEntityByID(entity.DatabaseID)
	entity:Remove()
end

concommand.Add("pcasino_remove_ent", function(ply)
	if CLIENT then return end
	if not PerfectCasino.Core.Access(ply) then return end
	local entity = ply:GetEyeTrace().Entity
	if not entity.DatabaseID then return end
	PerfectCasino.Database.DeleteEntityByID(entity.DatabaseID)
	entity:Remove()
end)

concommand.Add("pcasino_update_pos", function(ply)
	if CLIENT then return end
	if not IsValid(ply) then return end
	if not PerfectCasino.Core.Access(ply) then return end

	PerfectCasino.Database.UpdateAllPositions()
end)


function TOOL:Think()
	if SERVER then return end
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	if not PerfectCasino.UI.CurrentSettings.Entity then
		if IsValid(currentEnt) then currentEnt:Remove() end
		return
	end

	if not IsValid(currentEnt) then
		currentEnt = ents.CreateClientProp()
		currentEnt:SetModel(PerfectCasino.Core.Entites[PerfectCasino.UI.CurrentSettings.Entity].model)
		currentEnt:SetMaterial("models/wireframe")
		currentEnt:Spawn()
	end
	if not (currentEnt:GetModel() == PerfectCasino.Core.Entites[PerfectCasino.UI.CurrentSettings.Entity].model) then
		currentEnt:SetModel(PerfectCasino.Core.Entites[PerfectCasino.UI.CurrentSettings.Entity].model)
	end
	trace = LocalPlayer():GetEyeTrace()
	plyAngle = LocalPlayer():GetAngles()
	currentEnt:SetPos(trace.HitPos + plyAngle:Forward() + plyAngle:Up() + (offset[PerfectCasino.UI.CurrentSettings.Entity] and offset[PerfectCasino.UI.CurrentSettings.Entity](currentEnt) or vector_origin))
	currentEnt:SetAngles(Angle(0, math.Round(plyAngle.y/10)*10 + 180, plyAngle.z) + (ang[PerfectCasino.UI.CurrentSettings.Entity] and ang[PerfectCasino.UI.CurrentSettings.Entity](currentEnt) or angle_zero))
end

function TOOL:Holster()
	if IsValid(currentEnt) then
		currentEnt:Remove()
		currentEnt = nil
	end
end

local darBack = Color(0, 0, 0, 240)
local red = Color(200, 0, 0)
function TOOL:DrawHUD()
	if not FPP then return end
	
	local ent = self.Owner:GetEyeTrace().Entity
	if not IsValid(ent) then return end
	if not PerfectCasino.Core.Entites[ent:GetClass()] then return end
	if FPP.canTouchEnt(self.Owner:GetEyeTrace().Entity, "Toolgun") then return end
	
	draw.RoundedBox(0, 0, ScrH()*0.5-50, ScrW(), 100, darBack)
	draw.SimpleText(PerfectCasino.Translation.ToolGun.DeletePermissions, "pCasino.Main.Static", ScrW()*0.5, ScrH()*0.5, red, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
	draw.SimpleText(PerfectCasino.Translation.ToolGun.FPPCheck, "pCasino.Nav.Static", ScrW()*0.5, ScrH()*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
end
--PATH addons/sl_utils/lua/weapons/gmod_tool/stools/permaprops.lua:
/*
	PermaProps
	Created by Entoros, June 2010
	Facepunch: http://www.facepunch.com/member.php?u=180808
	Modified By Malboro 28 / 12 / 2012
	
	Ideas:
		Make permaprops cleanup-able
		
	Errors:
		Errors on die

	Remake:
		By Malboro the 28/12/2012
*/

TOOL.Category		=	"Props Tool"
TOOL.Name			=	"PermaProps"
TOOL.Command		=	nil
TOOL.ConfigName		=	""

if CLIENT then
	language.Add("Tool.permaprops.name", "PermaProps")
	language.Add("Tool.permaprops.desc", "Save a props permanently")
	language.Add("Tool.permaprops.0", "LeftClick: Add RightClick: Remove Reload: Update")

	surface.CreateFont("PermaPropsToolScreenFont", { font = "Arial", size = 40, weight = 1000, antialias = true, additive = false })
	surface.CreateFont("PermaPropsToolScreenSubFont", { font = "Arial", size = 30, weight = 1000, antialias = true, additive = false })
end

function TOOL:LeftClick(trace)

	if CLIENT then return true end

	local ent = trace.Entity
	local ply = self:GetOwner()

	if not PermaProps then ply:ChatPrint( "ERROR: Lib not found" ) return end
	
	if !PermaProps.HasPermission( ply, "Save") then return end

	if not ent:IsValid() then ply:ChatPrint( "That is not a valid entity !" ) return end
	if ent:IsPlayer() then ply:ChatPrint( "That is a player !" ) return end
	if ent.PermaProps then ply:ChatPrint( "That entity is already permanent !" ) return end

	local content = PermaProps.PPGetEntTable(ent)
	if not content then return end

	local max = tonumber(sql.QueryValue("SELECT MAX(id) FROM permaprops;"))
	if not max then max = 1 else max = max + 1 end

	local new_ent = PermaProps.PPEntityFromTable(content, max)
	if !new_ent or !new_ent:IsValid() then return end

	PermaProps.SparksEffect( ent )

	PermaProps.SQL.Query("INSERT INTO permaprops (id, map, content) VALUES(NULL, ".. sql.SQLStr(game.GetMap()) ..", ".. sql.SQLStr(util.TableToJSON(content)) ..");")
	ply:ChatPrint("You saved " .. ent:GetClass() .. " with model ".. ent:GetModel() .. " to the database.")

	ent:Remove()

	return true

end

function TOOL:RightClick(trace)

	if CLIENT then return true end

	local ent = trace.Entity
	local ply = self:GetOwner()

	if not PermaProps then ply:ChatPrint( "ERROR: Lib not found" ) return end

	if !PermaProps.HasPermission( ply, "Delete") then return end

	if not ent:IsValid() then ply:ChatPrint( "That is not a valid entity !" ) return end
	if ent:IsPlayer() then ply:ChatPrint( "That is a player !" ) return end
	if not ent.PermaProps then ply:ChatPrint( "That is not a PermaProp !" ) return end
	if not ent.PermaProps_ID then ply:ChatPrint( "ERROR: ID not found" ) return end

	PermaProps.SQL.Query("DELETE FROM permaprops WHERE id = ".. ent.PermaProps_ID ..";")

	ply:ChatPrint("You erased " .. ent:GetClass() .. " with a model of " .. ent:GetModel() .. " from the database.")

	ent:Remove()

	return true

end

function TOOL:Reload(trace)

	if CLIENT then return true end

	if not PermaProps then self:GetOwner():ChatPrint( "ERROR: Lib not found" ) return end

	if (not trace.Entity:IsValid() and PermaProps.HasPermission( self:GetOwner(), "Update")) then self:GetOwner():ChatPrint( "You have reload all PermaProps !" ) PermaProps.ReloadPermaProps() return false end

	if trace.Entity.PermaProps then

		local ent = trace.Entity
		local ply = self:GetOwner()

		if !PermaProps.HasPermission( ply, "Update") then return end

		if ent:IsPlayer() then ply:ChatPrint( "That is a player !" ) return end
		
		local content = PermaProps.PPGetEntTable(ent)
		if not content then return end

		PermaProps.SQL.Query("UPDATE permaprops set content = ".. sql.SQLStr(util.TableToJSON(content)) .." WHERE id = ".. ent.PermaProps_ID .." AND map = ".. sql.SQLStr(game.GetMap()) .. ";")

		local new_ent = PermaProps.PPEntityFromTable(content, ent.PermaProps_ID)
		if !new_ent or !new_ent:IsValid() then return end

		PermaProps.SparksEffect( ent )

		ply:ChatPrint("You updated the " .. ent:GetClass() .. " in the database.")

		ent:Remove()


	else

		return false

	end

	return true

end

function TOOL.BuildCPanel(panel)

	panel:AddControl("Header",{Text = "PermaProps", Description = "PermaProps\n\nSaves entities across map changes\n"})
	panel:AddControl("Button",{Label = "Open Configuration Menu", Command = "pp_cfg_open"})

end

function TOOL:DrawToolScreen(width, height)

	if SERVER then return end

	surface.SetDrawColor(17, 148, 240, 255)
	surface.DrawRect(0, 0, 256, 256)

	surface.SetFont("PermaPropsToolScreenFont")
	local w, h = surface.GetTextSize(" ")
	surface.SetFont("PermaPropsToolScreenSubFont")
	local w2, h2 = surface.GetTextSize(" ")

	draw.SimpleText("PermaProps", "PermaPropsToolScreenFont", 128, 100, Color(224, 224, 224, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, Color(17, 148, 240, 255), 4)
	draw.SimpleText("By Malboro", "PermaPropsToolScreenSubFont", 128, 128 + (h + h2) / 2 - 4, Color(224, 224, 224, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, Color(17, 148, 240, 255), 4)

end

--PATH addons/sl_utils/lua/improvedstacker/localization.lua:
--local prefix = "#tool."..debug.getinfo( 1, "S" ).source:match(".+[/?\\?](.+)%.lua").."."

local prefix = "#tool.stacker_improved."

localify.Bind( "en",    prefix.."language_en",    "English" )
localify.Bind( "bg",    prefix.."language_bg",    "Български" )
localify.Bind( "fr",    prefix.."language_fr",    "Français" )
localify.Bind( "pl",    prefix.."language_pl",    "Polski" )
localify.Bind( "ru",    prefix.."language_ru",    "Русский" )
localify.Bind( "zh-cn", prefix.."language_zh-cn", "简体中文" )
localify.Bind( "de",    prefix.."language_de",    "Deutsch" )
localify.Bind( "tr",    prefix.."language_tr",    "Türkçe" )

--[[--------------------------------------------------------------------------
-- English Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "en", prefix.."name",                     "Stacker - Improved" )
localify.Bind( "en", prefix.."desc",                     "Easily stack duplicated props in any direction" )
localify.Bind( "en", prefix.."left",                     "Create a stack" )
localify.Bind( "en", prefix.."shift_left",               "Increase stack size" )
localify.Bind( "en", prefix.."right",                    "Create a single prop" )
localify.Bind( "en", prefix.."shift_right",              "Decrease stack size" )
localify.Bind( "en", prefix.."reload",                   "Change stack direction" )
localify.Bind( "en", "Undone_stacker_improved",          "Undone stacked prop(s)" )
-- Errors
localify.Bind( "en", prefix.."error_blocked_by_server",  "The server has blocked you from changing this console variable" )
localify.Bind( "en", prefix.."error_not_admin",          "You must be in the 'admin' usergroup to change this console variable" )
localify.Bind( "en", prefix.."error_invalid_argument",   "You must enter a valid number value" )
localify.Bind( "en", prefix.."error_max_per_stack",      "The max props that can be stacked at once is limited to " )
localify.Bind( "en", prefix.."error_too_quick",          "You are using stacker too quickly" )
localify.Bind( "en", prefix.."error_max_per_player",     "Stacker prop limit reached" )
localify.Bind( "en", prefix.."error_not_in_world",       "Stacked props must be spawned within the world" )
localify.Bind( "en", prefix.."error_max_constraints",    "Failed to create constraint, most likely ran out of entity slots" )
-- Labels
localify.Bind( "en", prefix.."label_presets",            "Stacker Presets: " )
localify.Bind( "en", prefix.."label_relative",           "Stack relative to: " )
localify.Bind( "en", prefix.."label_direction",          "Stack direction: " )
localify.Bind( "en", prefix.."label_count",              "Stack size" )
localify.Bind( "en", prefix.."label_reset_offsets",      "Reset offsets" )
localify.Bind( "en", prefix.."label_reset_angles",       "Reset angles" )
localify.Bind( "en", prefix.."label_show_settings",      "Click to show settings" )
localify.Bind( "en", prefix.."label_hide_settings",      "Click to hide settings" )
localify.Bind( "en", prefix.."label_x",                  "X  (-back, +front)" )
localify.Bind( "en", prefix.."label_y",                  "Y  (-left, +right)" )
localify.Bind( "en", prefix.."label_z",                  "Z  (-down, +up)" )
localify.Bind( "en", prefix.."label_pitch",              "Pitch  (-down, +up)" )
localify.Bind( "en", prefix.."label_yaw",                "Yaw   (-left, +right)" )
localify.Bind( "en", prefix.."label_roll",               "Roll    (-left, +right)" )
localify.Bind( "en", prefix.."label_language",           "Language: " )
localify.Bind( "en", prefix.."label_credits",            "" )
localify.Bind( "en", prefix.."label_max_per_stack",      "Stack size" )
localify.Bind( "en", prefix.."label_max_per_player",     "Props per player" )
localify.Bind( "en", prefix.."label_max_offsetx",        "Maximum X offset" )
localify.Bind( "en", prefix.."label_max_offsety",        "Maximum Y offset" )
localify.Bind( "en", prefix.."label_max_offsetz",        "Maximum Z offset" )
localify.Bind( "en", prefix.."label_delay",              "Delay" )
localify.Bind( "en", prefix.."label_opacity",            "Opacity" )
-- Checkboxes
localify.Bind( "en", prefix.."checkbox_freeze",          "Freeze stacked props" )
localify.Bind( "en", prefix.."checkbox_weld",            "Weld stacked props" )
localify.Bind( "en", prefix.."checkbox_nocollide",       "No-Collide stacked props with each other" )
localify.Bind( "en", prefix.."checkbox_nocollide_all",   "No-Collide stacked props with EVERYTHING" )
localify.Bind( "en", prefix.."checkbox_use_shift_key",   "Change stack size with SHIFT + left/right-click" )
localify.Bind( "en", prefix.."checkbox_relative",        "Stack relative to new rotation" )
localify.Bind( "en", prefix.."checkbox_material",        "Apply material" )
localify.Bind( "en", prefix.."checkbox_color",           "Apply color" )
localify.Bind( "en", prefix.."checkbox_physprop",        "Apply physical properties" )
localify.Bind( "en", prefix.."checkbox_ghost",           "Ghost all props in the stack" )
localify.Bind( "en", prefix.."checkbox_halo",            "Add halos to ghosted props" )
localify.Bind( "en", prefix.."checkbox_halo_color",      "Halo color" )
localify.Bind( "en", prefix.."checkbox_axis",            "Draw XYZ axis" )
localify.Bind( "en", prefix.."checkbox_axis_labels",     "Draw XYZ axis labels" )
localify.Bind( "en", prefix.."checkbox_axis_angles",     "Draw XYZ axis angles" )
localify.Bind( "en", prefix.."checkbox_stayinworld",     "Stay in world" )
-- Comboboxes
localify.Bind( "en", prefix.."combobox_world",           "World" )
localify.Bind( "en", prefix.."combobox_prop",            "Prop" )
localify.Bind( "en", prefix.."combobox_direction_up",    "Up" )
localify.Bind( "en", prefix.."combobox_direction_down",  "Down" )
localify.Bind( "en", prefix.."combobox_direction_front", "Front" )
localify.Bind( "en", prefix.."combobox_direction_back",  "Back" )
localify.Bind( "en", prefix.."combobox_direction_right", "Right" )
localify.Bind( "en", prefix.."combobox_direction_left",  "Left" )
localify.Bind( "en", prefix.."combobox_default",         "Default" )
localify.Bind( "en", prefix.."combobox_sandbox",         "Sandbox" )
localify.Bind( "en", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "en", prefix.."combobox_singleplayer",    "Singleplayer" )
-- HUD
localify.Bind( "en", prefix.."hud_front",                "Front" )
localify.Bind( "en", prefix.."hud_right",                "Right" )
localify.Bind( "en", prefix.."hud_up",                   "Up" )
-- Help
localify.Bind( "en", prefix.."help_max_per_player",      "Maximum stacked props each player is limited to." )
localify.Bind( "en", prefix.."help_max_per_stack",       "Maximum props per stack (left-click)." )
localify.Bind( "en", prefix.."help_delay",               "Delay (in seconds) between each Stacker use (left/right-click)" )
localify.Bind( "en", prefix.."help_max_offsetx",         "Maximum distance between stacked props (X-axis)." )
localify.Bind( "en", prefix.."help_max_offsety",         "Maximum distance between stacked props (Y-axis)." )
localify.Bind( "en", prefix.."help_max_offsetz",         "Maximum distance between stacked props (Z-axis)." )
localify.Bind( "en", prefix.."help_freeze",              "Stacked props are frozen when spawned." )
localify.Bind( "en", prefix.."help_weld",                "Stacked props are welded to each other when spawned." )
localify.Bind( "en", prefix.."help_nocollide",           "Stacked props won't collide with other stacked props." )
localify.Bind( "en", prefix.."help_nocollide_all",       "Stacked props won't collide with anything except players, NPCs, vehicles, and the world." )
localify.Bind( "en", prefix.."help_stayinworld",         "Prevents stacked props from being created outside of the map." )
-- Warnings
localify.Bind( "en", prefix.."warning_max_per_player",   "Primarily for Roleplay gamemodes. For Sandbox gamemodes, this should generally be unlimited (-1)." )
localify.Bind( "en", prefix.."warning_max_offsetx",      "Primarily for Roleplay gamemodes. Don't modify unless you know what you're doing." )
localify.Bind( "en", prefix.."warning_max_offsety",      "Primarily for Roleplay gamemodes. Don't modify unless you know what you're doing." )
localify.Bind( "en", prefix.."warning_max_offsetz",      "Primarily for Roleplay gamemodes. Don't modify unless you know what you're doing." )
localify.Bind( "en", prefix.."warning_freeze",           "For DarkRP." )
localify.Bind( "en", prefix.."warning_weld",             "For DarkRP." )
localify.Bind( "en", prefix.."warning_nocollide",        "For DarkRP." )
localify.Bind( "en", prefix.."warning_nocollide_all",    "DO NOT CHANGE WHILE THE SERVER IS RUNNING. This uses the GM.ShouldCollide hook and is experimental. It works and is guaranteed to stop crashes from Stacker, but needs more testing." )

--[[--------------------------------------------------------------------------
-- Bulgarian Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "bg", prefix.."name",                     "Натрупвач - Подобрен" )
localify.Bind( "bg", prefix.."desc",                     "Лесно натрупва еднакви предмети във всяка посока" )
localify.Bind( "bg", prefix.."left",                     "Създай натрупване" )
localify.Bind( "bg", prefix.."shift_left",               "Увеличи размера на натрупването" )
localify.Bind( "bg", prefix.."right",                    "Създай единичен обект" )
localify.Bind( "bg", prefix.."shift_right",              "Намали размера на натрупването" )
localify.Bind( "bg", prefix.."reload",                   "Смени направлението на натрупване" )
localify.Bind( "bg", "Undone_stacker_improved",          "Премахва натрупването на предмет(и)" )
-- Errors
localify.Bind( "bg", prefix.."error_blocked_by_server",  "Сървърът ви е блокирал да променяте тази конзолна променлива" )
localify.Bind( "bg", prefix.."error_not_admin",          "Трябва да бъдете в групата 'admin' за да промените тази конзолна променлива" )
localify.Bind( "bg", prefix.."error_invalid_argument",   "Трябва да въведете валидно число за тази стойност" )
localify.Bind( "bg", prefix.."error_max_per_stack",      "Максималния брой предмети които могат да бъдат натрупани на един път е ограничен до " )
localify.Bind( "bg", prefix.."error_too_quick",          "Използвате натрупвача твърде бързо" )
localify.Bind( "bg", prefix.."error_max_per_player",     "Ограничението за натрупани предмети е достигнато" )
localify.Bind( "bg", prefix.."error_not_in_world",       "Натрупваните предмети трябва да се създават вътре в света" )
localify.Bind( "bg", prefix.."error_max_constraints",    "Не можа да се създаде връзка, най вероятно са свършили слотовете за обекти" )
-- Labels
localify.Bind( "bg", prefix.."label_presets",            "Шаблон на натрупвача: " )
localify.Bind( "bg", prefix.."label_relative",           "Натрупвай спрямо: " )
localify.Bind( "bg", prefix.."label_direction",          "Направление на натрупване: " )
localify.Bind( "bg", prefix.."label_count",              "Размер на натрупване" )
localify.Bind( "bg", prefix.."label_reset_offsets",      "Нулиране на отместването" )
localify.Bind( "bg", prefix.."label_reset_angles",       "Нулиране на ъглите" )
localify.Bind( "bg", prefix.."label_show_settings",      "Цъкнете за показване на настройки" )
localify.Bind( "bg", prefix.."label_hide_settings",      "Цъкнете за скриване на настройки" )
localify.Bind( "bg", prefix.."label_x",                  "Абсциса  (-назад, +напред)" )
localify.Bind( "bg", prefix.."label_y",                  "Ордината  (-ляво, +дясно)" )
localify.Bind( "bg", prefix.."label_z",                  "Апликата  (-долу, +горе)" )
localify.Bind( "bg", prefix.."label_pitch",              "Тангаж  (-долу, +горе)" )
localify.Bind( "bg", prefix.."label_yaw",                "Азимут  (-ляво, +дясно)" )
localify.Bind( "bg", prefix.."label_roll",               "Крен    (-ляво, +дясно)" )
localify.Bind( "bg", prefix.."label_language",           "Език: " )
localify.Bind( "bg", prefix.."label_credits",            "Преведено от: [BG][Sk&Bh]Trick or treat KID!" )
localify.Bind( "bg", prefix.."label_max_per_stack",      "Брой на натрупване" )
localify.Bind( "bg", prefix.."label_max_per_player",     "Брой предмети на играч" )
localify.Bind( "bg", prefix.."label_max_offsetx",        "Максимално отместване по абсциса" )
localify.Bind( "bg", prefix.."label_max_offsety",        "Максимално отместване по ордината" )
localify.Bind( "bg", prefix.."label_max_offsetz",        "Максимално отместване по апликата" )
localify.Bind( "bg", prefix.."label_delay",              "Закъснение" )
localify.Bind( "bg", prefix.."label_opacity",            "Тъмнота" )
-- Checkboxes
localify.Bind( "bg", prefix.."checkbox_freeze",          "Замрази натрупаните предмети" )
localify.Bind( "bg", prefix.."checkbox_weld",            "Завари натрупаните предмети" )
localify.Bind( "bg", prefix.."checkbox_nocollide",       "Не-сблъсък на натрупаните предмети един към друг" )
localify.Bind( "bg", prefix.."checkbox_nocollide_all",   "Не-сблъсък на натрупаните предмети с ВСИЧКО" )
//localify.Bind( "bg", prefix.."checkbox_use_shift_key",   "" )
localify.Bind( "bg", prefix.."checkbox_relative",        "Натрупвай спрямо новата ориентация" )
localify.Bind( "bg", prefix.."checkbox_material",        "Приложи текстура" )
localify.Bind( "bg", prefix.."checkbox_color",           "Приложи цвят" )
localify.Bind( "bg", prefix.."checkbox_physprop",        "Приложи физически свойства" )
localify.Bind( "bg", prefix.."checkbox_ghost",           "Сенки за всички предмети в стека" )
localify.Bind( "bg", prefix.."checkbox_halo",            "Добави ореоли към предметите сенки" )
localify.Bind( "bg", prefix.."checkbox_halo_color",      "Цвят на ореола" )
localify.Bind( "bg", prefix.."checkbox_axis",            "Чертай осите XYZ" )
localify.Bind( "bg", prefix.."checkbox_axis_labels",     "Чертай етикети на XYZ осите" )
localify.Bind( "bg", prefix.."checkbox_axis_angles",     "Чертай ъглите на XYZ осите" )
localify.Bind( "bg", prefix.."checkbox_stayinworld",     "Натрупвай в рамките на света" )
-- Comboboxes
localify.Bind( "bg", prefix.."combobox_world",           "Свят" )
localify.Bind( "bg", prefix.."combobox_prop",            "Предмет" )
localify.Bind( "bg", prefix.."combobox_direction_up",    "Горе" )
localify.Bind( "bg", prefix.."combobox_direction_down",  "Долу" )
localify.Bind( "bg", prefix.."combobox_direction_front", "Отпред" )
localify.Bind( "bg", prefix.."combobox_direction_back",  "Отзад" )
localify.Bind( "bg", prefix.."combobox_direction_right", "Дясно" )
localify.Bind( "bg", prefix.."combobox_direction_left",  "Ляво" )
localify.Bind( "bg", prefix.."combobox_default",         "По подразбиране" )
localify.Bind( "bg", prefix.."combobox_sandbox",         "Пясъчник" )
localify.Bind( "bg", prefix.."combobox_darkrp",          "Ролева игра" )
localify.Bind( "bg", prefix.."combobox_singleplayer",    "Самостоятелна игра" )
-- HUD
localify.Bind( "bg", prefix.."hud_front",                "Отпред" )
localify.Bind( "bg", prefix.."hud_right",                "Дясно" )
localify.Bind( "bg", prefix.."hud_up",                   "Горе" )
-- Help
localify.Bind( "bg", prefix.."help_max_per_player",      "Максимален брой натрупвани предмети до които е ограничен всеки играч" )
localify.Bind( "bg", prefix.."help_max_per_stack",       "Максимален брой предмети при всяко натрупване (ляв клик)." )
localify.Bind( "bg", prefix.."help_delay",               "Закъснение (в секунди) между всяко използване на натрупвача (ляв/десен клик)" )
localify.Bind( "bg", prefix.."help_max_offsetx",         "Максимално разстояние между натрупаните предмети (абсциса)." )
localify.Bind( "bg", prefix.."help_max_offsety",         "Максимално разстояние между натрупаните предмети (ордината)." )
localify.Bind( "bg", prefix.."help_max_offsetz",         "Максимално разстояние между натрупаните предмети (апликата)." )
localify.Bind( "bg", prefix.."help_freeze",              "Натрупваните предмети са замразени при създаване." )
localify.Bind( "bg", prefix.."help_weld",                "Натрупваните предмети са заварени по между си при създаване." )
localify.Bind( "bg", prefix.."help_nocollide",           "Натрупваните предмети няма да се сблъскват с други такива." )
localify.Bind( "bg", prefix.."help_nocollide_all",       "Натрупваните предмети няма да се сблъскват с всичко освен играчи, NPC, превозни средства, и света." )
localify.Bind( "bg", prefix.."help_stayinworld",         "Предотвратява натрупваните обекти да бъдат създавани извън света." )
-- Warnings
localify.Bind( "bg", prefix.."warning_max_per_player",   "Преди всичко за режими на Ролева игра. За режим Пясъчник, това трябва генерално да бъде неограничено (-1)." )
localify.Bind( "bg", prefix.."warning_max_offsetx",      "Преди всичко за режими на Ролева игра. Не модифицирайте ако не знаете какво правите." )
localify.Bind( "bg", prefix.."warning_max_offsety",      "Преди всичко за режими на Ролева игра. Не модифицирайте ако не знаете какво правите." )
localify.Bind( "bg", prefix.."warning_max_offsetz",      "Преди всичко за режими на Ролева игра. Не модифицирайте ако не знаете какво правите." )
localify.Bind( "bg", prefix.."warning_freeze",           "За режим на Ролева игра." )
localify.Bind( "bg", prefix.."warning_weld",             "За режим на Ролева игра." )
localify.Bind( "bg", prefix.."warning_nocollide",        "За режим на Ролева игра." )
localify.Bind( "bg", prefix.."warning_nocollide_all",    "НЕ ПРОМЕНЯЙТЕ ДОКАТО СЪРВЪРА РАБОТИ. Това използва кука /GM.ShouldCollide/ и е експериментално. Работи и с гаранция ще спре крашовете, но се нуждае от още тестване." )

--[[--------------------------------------------------------------------------
-- French Localization
--------------------------------------------------------------------------]]--

-- Paramètres de l'outil
localify.Bind( "fr", prefix.."name",                     "Stacker - Amélioré" )
localify.Bind( "fr", prefix.."desc",                     "Empilez facilement les props dupliqués dans n'importe quelle direction" )
localify.Bind( "fr", prefix.."left",                     "Créer une pile" )
localify.Bind( "fr", prefix.."shift_left",               "Augmenter la taille des piles" )
localify.Bind( "fr", prefix.."right",                    "Créer un seul prop" )
localify.Bind( "fr", prefix.."shift_right",              "Diminuer la taille de la pile" )
localify.Bind( "fr", prefix.."reload",                   "Changer la direction de la pile" )
localify.Bind( "fr", "Undone_stacker_improved",          "Annuler le(s) prop(s) empilé(s)" )
-- Erreurs
localify.Bind( "fr", prefix.."error_blocked_by_server",  "Le serveur vous a empêché de modifier cette variable de console" )
localify.Bind( "fr", prefix.."error_not_admin",          "Vous devez être dans le groupe d'utilisateurs 'admin' pour modifier cette variable de console" )
localify.Bind( "fr", prefix.."error_invalid_argument",   "Vous devez entrer une valeur numérique valide" )
localify.Bind( "fr", prefix.."error_max_per_stack",      "Les props maximum qui peuvent être empilés à la fois sont limités à " )
localify.Bind( "fr", prefix.."error_too_quick",          "Vous utilisez l'empileur trop rapidement" )
localify.Bind( "fr", prefix.."error_max_per_player",     "Limite de l'empileur atteinte" )
localify.Bind( "fr", prefix.."error_not_in_world",       "Les props empilés doivent être engendrés dans le monde" )
localify.Bind( "fr", prefix.."error_max_constraints",    "Échec de la création de la contrainte, très probablement à court d'emplacements d'entité" )
-- Etiquettes
localify.Bind( "fr", prefix.."label_presets",            "Préréglages de l'empileur " )
localify.Bind( "fr", prefix.."label_relative",           "Pile relatif au: " )
localify.Bind( "fr", prefix.."label_direction",          "Direction: " )
localify.Bind( "fr", prefix.."label_count",              "Taille" )
localify.Bind( "fr", prefix.."label_reset_offsets",      "Effacer les décalages" )
localify.Bind( "fr", prefix.."label_reset_angles",       "Effacer les angles" )
localify.Bind( "fr", prefix.."label_show_settings",      "Afficher les paramètres" )
localify.Bind( "fr", prefix.."label_hide_settings",      "Masquer les paramètres" )
localify.Bind( "fr", prefix.."label_x",                  "X  (-derrière, +devant)" )
localify.Bind( "fr", prefix.."label_y",                  "Y  (-gauche, +droite)" )
localify.Bind( "fr", prefix.."label_z",                  "Z  (-bas, +haut)" )
localify.Bind( "fr", prefix.."label_pitch",              "Pitch  (-bas, +haut)" )
localify.Bind( "fr", prefix.."label_yaw",                "Yaw   (-gauche, +droite)" )
localify.Bind( "fr", prefix.."label_roll",               "Roll    (-gauche, +droite)" )
localify.Bind( "fr", prefix.."label_language",           "Langue: " )
localify.Bind( "fr", prefix.."label_credits",            "" )
localify.Bind( "fr", prefix.."label_max_per_stack",      "Taille" )
localify.Bind( "fr", prefix.."label_max_per_player",     "Props par joueur(s)" )
localify.Bind( "fr", prefix.."label_max_offsetx",        "Décalage X maximal" )
localify.Bind( "fr", prefix.."label_max_offsety",        "Décalage Y maximal" )
localify.Bind( "fr", prefix.."label_max_offsetz",        "Décalage Z maximal" )
localify.Bind( "fr", prefix.."label_delay",              "Délai" )
localify.Bind( "fr", prefix.."label_opacity",            "Opacité" )
-- Checkboxes
localify.Bind( "fr", prefix.."checkbox_freeze",          "Geler les props empilés" )
localify.Bind( "fr", prefix.."checkbox_weld",            "Souder les props empilés" )
localify.Bind( "fr", prefix.."checkbox_nocollide",       "No-Collide les props empilés avec les autres" )
localify.Bind( "fr", prefix.."checkbox_nocollide_all",   "No-Collide les props empilés avec TOUT" )
localify.Bind( "fr", prefix.."checkbox_use_shift_key",   "Changer la taille d'empilement avec SHIFT + clic gauche/droite" )
localify.Bind( "fr", prefix.."checkbox_relative",        "Pile par rapport à la nouvelle rotation" )
localify.Bind( "fr", prefix.."checkbox_material",        "Appliquer un matériaux" )
localify.Bind( "fr", prefix.."checkbox_color",           "Appliquer une couleur" )
localify.Bind( "fr", prefix.."checkbox_physprop",        "Appliquer une propriété physique" )
localify.Bind( "fr", prefix.."checkbox_ghost",           "Traverser tout les props dans l'empilement" )
localify.Bind( "fr", prefix.."checkbox_halo",            "Ajouter des halos aux props fantômes" )
localify.Bind( "fr", prefix.."checkbox_halo_color",      "Couleur du halo" )
localify.Bind( "fr", prefix.."checkbox_axis",            "Dessiner l'axe XYZ" )
localify.Bind( "fr", prefix.."checkbox_axis_labels",     "Dessiner des étiquettes d'axe XYZ" )
localify.Bind( "fr", prefix.."checkbox_axis_angles",     "Dessiner des angles d'axe XYZ" )
localify.Bind( "fr", prefix.."checkbox_stayinworld",     "Rester dans le monde" )
-- Comboboxes
localify.Bind( "fr", prefix.."combobox_world",           "Monde" )
localify.Bind( "fr", prefix.."combobox_prop",            "Prop" )
localify.Bind( "fr", prefix.."combobox_direction_up",    "Haut" )
localify.Bind( "fr", prefix.."combobox_direction_down",  "Bas" )
localify.Bind( "fr", prefix.."combobox_direction_front", "Devant" )
localify.Bind( "fr", prefix.."combobox_direction_back",  "Derrière" )
localify.Bind( "fr", prefix.."combobox_direction_right", "Droite" )
localify.Bind( "fr", prefix.."combobox_direction_left",  "Gauche" )
localify.Bind( "fr", prefix.."combobox_default",         "Défaut" )
localify.Bind( "fr", prefix.."combobox_sandbox",         "Sandbox" )
localify.Bind( "fr", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "fr", prefix.."combobox_singleplayer",    "Solo" )
-- HUD
localify.Bind( "fr", prefix.."hud_front",                "Devant" )
localify.Bind( "fr", prefix.."hud_right",                "Droite" )
localify.Bind( "fr", prefix.."hud_up",                   "Haut" )
-- Aide
localify.Bind( "fr", prefix.."help_max_per_player",      "Les props empilés sont limités à chaque joueur." )
localify.Bind( "fr", prefix.."help_max_per_stack",       "Maximum de props par pile (clic gauche)." )
localify.Bind( "fr", prefix.."help_delay",               "Délai (en secondes) entre chaque utilisation de l'Empileur (clic gauche / droit)" )
localify.Bind( "fr", prefix.."help_max_offsetx",         "Distance maximale entre les props empilés (axe X)." )
localify.Bind( "fr", prefix.."help_max_offsety",         "Distance maximale entre les props empilés (axe Y)." )
localify.Bind( "fr", prefix.."help_max_offsetz",         "Distance maximale entre les props empilés (axe Z)." )
localify.Bind( "fr", prefix.."help_freeze",              "Les props empilés sont congelés lorsqu'ils sont spawn." )
localify.Bind( "fr", prefix.."help_weld",                "Les props empilés sont soudés les uns aux autres lors du spawn." )
localify.Bind( "fr", prefix.."help_nocollide",           "Les props empilés ne vont pas entrer en collision avec d'autres props empilés." )
localify.Bind( "fr", prefix.."help_nocollide_all",       "Les props empilés n'entreront en collision avec rien d'autre que les joueurs, les PNJ, les véhicules et le monde." )
localify.Bind( "fr", prefix.."help_stayinworld",         "Empêche la création de props empilés à l'extérieur de la carte." )
-- Attentions
localify.Bind( "fr", prefix.."warning_max_per_player",   "Principalement pour les modes de jeu Roleplay. Pour les modes de jeu Sandbox, cela devrait généralement être illimité (-1)." )
localify.Bind( "fr", prefix.."warning_max_offsetx",      "Principalement pour les modes de jeu Roleplay. Ne modifiez pas à moins de savoir ce que vous faites." )
localify.Bind( "fr", prefix.."warning_max_offsety",      "Principalement pour les modes de jeu Roleplay. Ne modifiez pas à moins de savoir ce que vous faites." )
localify.Bind( "fr", prefix.."warning_max_offsetz",      "Principalement pour les modes de jeu Roleplay. Ne modifiez pas à moins de savoir ce que vous faites." )
localify.Bind( "fr", prefix.."warning_freeze",           "Pour DarkRP." )
localify.Bind( "fr", prefix.."warning_weld",             "Pour DarkRP." )
localify.Bind( "fr", prefix.."warning_nocollide",        "Pour DarkRP." )
localify.Bind( "fr", prefix.."warning_nocollide_all",    "NE PAS CHANGER PENDANT QUE LE SERVEUR FONCTIONNE. Cela utilise le crochet GM.ShouldCollide et est expérimental. Cela fonctionne et est garanti pour arrêter les plantages de Stacker, mais a besoin de plus de tests." )

--[[--------------------------------------------------------------------------
-- Polish Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "pl", prefix.."name",                     "Stacker - Ulepszony" )
localify.Bind( "pl", prefix.."desc",                     "Łatwo kopiuj obiekty w dowolnym kierunku" )
localify.Bind( "pl", prefix.."left",                     "Utwórz kopię" )
localify.Bind( "pl", prefix.."shift_left",               "Zwiększ ilość kopii" )
localify.Bind( "pl", prefix.."right",                    "Utwórz pojedyńczy obiekt" )
localify.Bind( "pl", prefix.."shift_right",              "Zmniejsz ilość kopii" )
localify.Bind( "pl", prefix.."reload",                   "Zmień kierunek kopiowania" )
localify.Bind( "pl", "Undone_stacker_improved",          "Cofnięto skopiowany obiekt" )
-- Errors
localify.Bind( "pl", prefix.."error_blocked_by_server",  "Serwer zablokował twoją możliwość zmieniania wartości serwerowych" )
localify.Bind( "pl", prefix.."error_not_admin",          "Musiz być w grupie 'admin' by zmienić tę wartość konsolową" )
localify.Bind( "pl", prefix.."error_invalid_argument",   "Musisz wprowadzić poprawną wartość liczbową" )
localify.Bind( "pl", prefix.."error_max_per_stack",      "Maksymalna ilość kopii jest ograniczona do " )
localify.Bind( "pl", prefix.."error_too_quick",          "Używasz Stackera za szybko" )
localify.Bind( "pl", prefix.."error_max_per_player",     "Osiągnięto limir obiektów dla Stackera" )
localify.Bind( "pl", prefix.."error_not_in_world",       "Skopiowane obiekty nie mogą wychodzić poza mapę" )
localify.Bind( "pl", prefix.."error_max_constraints",    "Nie udało się utworzyć łaczenia, najprawdopodobniej brakuje miejsc na obiekty" )
-- Labels
localify.Bind( "pl", prefix.."label_presets",            "Ustawienia zapisane: " )
localify.Bind( "pl", prefix.."label_relative",           "Kopiowanie względem: " )
localify.Bind( "pl", prefix.."label_direction",          "Kierunek kopiowania: " )
localify.Bind( "pl", prefix.."label_count",              "Ilość kopii" )
localify.Bind( "pl", prefix.."label_reset_offsets",      "Zresetuj przesunięcia" )
localify.Bind( "pl", prefix.."label_reset_angles",       "Zresetuj kąty" )
localify.Bind( "pl", prefix.."label_show_settings",      "Pokaż ustawienia" )
localify.Bind( "pl", prefix.."label_hide_settings",      "Ukryj ustawienia" )
localify.Bind( "pl", prefix.."label_x",                  "X  (-tył, +przód)" )
localify.Bind( "pl", prefix.."label_y",                  "Y  (-lewo, +prawo)" )
localify.Bind( "pl", prefix.."label_z",                  "Z  (-dół, +góra)" )
localify.Bind( "pl", prefix.."label_pitch",              "Pochylenie  (-dół, +góra)" )
localify.Bind( "pl", prefix.."label_yaw",                "Odchylenie   (-lewo, +prawo)" )
localify.Bind( "pl", prefix.."label_roll",               "Przechylenie    (-lewo, +prawo)" )
localify.Bind( "pl", prefix.."label_language",           "Język: " )
localify.Bind( "pl", prefix.."label_credits",            "" )
localify.Bind( "pl", prefix.."label_max_per_stack",      "Ilość kopii" )
localify.Bind( "pl", prefix.."label_max_per_player",     "Ilość obiektów na gracza" )
localify.Bind( "pl", prefix.."label_max_offsetx",        "Max przesunięcie X" )
localify.Bind( "pl", prefix.."label_max_offsety",        "Max przesunięcie Y" )
localify.Bind( "pl", prefix.."label_max_offsetz",        "Max przesunięcie Z" )
localify.Bind( "pl", prefix.."label_delay",              "Opóźnienie" )
localify.Bind( "pl", prefix.."label_opacity",            "Przezroczystość" )
-- Checkboxes
localify.Bind( "pl", prefix.."checkbox_freeze",          "Zamrażaj skopiowane obiekty" )
localify.Bind( "pl", prefix.."checkbox_weld",            "Spawaj skopiowane obiekty" )
localify.Bind( "pl", prefix.."checkbox_nocollide",       "Wyłącz kolizję pomiędzy skopiowanymi obiektami" )
localify.Bind( "pl", prefix.."checkbox_nocollide_all",   "Wyłącz kolizję skopiowanych obiektamów ze WSZYSTKIM" )
localify.Bind( "pl", prefix.."checkbox_use_shift_key",   "Zmień ilość kopii za pomocą SHIFT + lewy/prawy" )
localify.Bind( "pl", prefix.."checkbox_relative",        "Kopiuj względem nowego obrotu" )
localify.Bind( "pl", prefix.."checkbox_material",        "Zastosuj materiał" )
localify.Bind( "pl", prefix.."checkbox_color",           "Zastosuj kolor" )
localify.Bind( "pl", prefix.."checkbox_physprop",        "Zastosuj właściwości fizyczne" )
localify.Bind( "pl", prefix.."checkbox_ghost",           "Dodaj duchy obiektów wszyschich kopii" )
localify.Bind( "pl", prefix.."checkbox_halo",            "Dodaj poświatę do duchów obiektów" )
localify.Bind( "pl", prefix.."checkbox_halo_color",      "Kolor poświaty" )
localify.Bind( "pl", prefix.."checkbox_axis",            "Rysuj oś XYZ" )
localify.Bind( "pl", prefix.."checkbox_axis_labels",     "Rysuj opis osi XYZ" )
localify.Bind( "pl", prefix.."checkbox_axis_angles",     "Rysuj kąty osi XYZ" )
localify.Bind( "pl", prefix.."checkbox_stayinworld",     "Zostań w środku mapy" )
-- Comboboxes
localify.Bind( "pl", prefix.."combobox_world",           "świat" )
localify.Bind( "pl", prefix.."combobox_prop",            "Obiekt" )
localify.Bind( "pl", prefix.."combobox_direction_up",    "Góra" )
localify.Bind( "pl", prefix.."combobox_direction_down",  "Dół" )
localify.Bind( "pl", prefix.."combobox_direction_front", "Przód" )
localify.Bind( "pl", prefix.."combobox_direction_back",  "Tył" )
localify.Bind( "pl", prefix.."combobox_direction_right", "Prawo" )
localify.Bind( "pl", prefix.."combobox_direction_left",  "Lewo" )
localify.Bind( "pl", prefix.."combobox_default",         "Domyślne" )
localify.Bind( "pl", prefix.."combobox_sandbox",         "Sandbox" )
localify.Bind( "pl", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "pl", prefix.."combobox_singleplayer",    "Singleplayer" )
-- HUD
localify.Bind( "pl", prefix.."hud_front",                "Przód" )
localify.Bind( "pl", prefix.."hud_right",                "Prawo" )
localify.Bind( "pl", prefix.."hud_up",                   "Góra" )
-- Help
localify.Bind( "pl", prefix.."help_max_per_player",      "Maksymalna ilość skopiowanych obiektó na gracza to." )
localify.Bind( "pl", prefix.."help_max_per_stack",       "Maksymalna ilość obiektów na kopię (lewy przycisk myszki)." )
localify.Bind( "pl", prefix.."help_delay",               "Opóźnienie (w sekundach) pomiędzy każdym użyciem Stackera (lewy/prawy przycisk)" )
localify.Bind( "pl", prefix.."help_max_offsetx",         "Maksymalny dystans pomiędzy skopiowanymi obiektami (oś X)." )
localify.Bind( "pl", prefix.."help_max_offsety",         "Maksymalny dystans pomiędzy skopiowanymi obiektami (oś Y)." )
localify.Bind( "pl", prefix.."help_max_offsetz",         "Maksymalny dystans pomiędzy skopiowanymi obiektami (oś Z)." )
localify.Bind( "pl", prefix.."help_freeze",              "Skopiowane obiekty są zamrożone." )
localify.Bind( "pl", prefix.."help_weld",                "Skopiowane obiekty są zespawane do siebie." )
localify.Bind( "pl", prefix.."help_nocollide",           "Skopiowane obiekty nie będą kolidowały z innymi skopiowanymi obiektami." )
localify.Bind( "pl", prefix.."help_nocollide_all",       "Skopiowane obiekty nie będą kolidowały ze wszystkim oprócz graczy, NPCs, pojazdów, i mapy." )
localify.Bind( "pl", prefix.."help_stayinworld",         "Nie pozwalaj na tworzenie kopii poza mapą." )
-- Warnings
localify.Bind( "pl", prefix.."warning_max_per_player",   "Głównie dla trybu Roleplay. Dla trybów Sandbox, zazwyczaj powinno być nieograniczone (-1)." )
localify.Bind( "pl", prefix.."warning_max_offsetx",      "Głownie dla tryby Roleplay. Nie zmieniaj, jeśli nie wiesz co robisz." )
localify.Bind( "pl", prefix.."warning_max_offsety",      "Głownie dla tryby Roleplay. Nie zmieniaj, jeśli nie wiesz co robisz." )
localify.Bind( "pl", prefix.."warning_max_offsetz",      "Głownie dla tryby Roleplay. Nie zmieniaj, jeśli nie wiesz co robisz." )
localify.Bind( "pl", prefix.."warning_freeze",           "Dla DarkRP." )
localify.Bind( "pl", prefix.."warning_weld",             "Dla DarkRP." )
localify.Bind( "pl", prefix.."warning_nocollide",        "Dla DarkRP." )
localify.Bind( "pl", prefix.."warning_nocollide_all",    "NIE ZMIENIAJ JEŚLI SERWER JEST WŁĄCZONY. To używa GM.ShouldCollide i jest eksperymentalne. Działa i zapobiega awarii serwera spowodowanymi Stackerem, ale wymaga dalszych testów." )

--[[--------------------------------------------------------------------------
-- Russian Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "ru", prefix.."name",                     "Стакер - Улучшенный" )
localify.Bind( "ru", prefix.."desc",                     "Легко дублируйте предметы в любом направлении" )
localify.Bind( "ru", prefix.."left",                     "Стакать" )
localify.Bind( "ru", prefix.."shift_left",               "Увеличить размер стака" )
localify.Bind( "ru", prefix.."right",                    "Создать одиночный предмет" )
localify.Bind( "ru", prefix.."shift_right",              "Уменьшить размер стака" )
localify.Bind( "ru", prefix.."reload",                   "Изменить напраление стака" )
localify.Bind( "ru", "Undone_stacker_improved",          "Отменить стаканные предметы" )
-- Errors
localify.Bind( "ru", prefix.."error_blocked_by_server",  "Сервер заблокировал вас от изменения этой консольной переменной" )
localify.Bind( "ru", prefix.."error_not_admin",          "Вы должны быть в группе админа, чтобы изменить эту консольную переменную" )
localify.Bind( "ru", prefix.."error_invalid_argument",   "Вы должны ввести правильное числовое значение" )
localify.Bind( "ru", prefix.."error_max_per_stack",      "Максимальное количество предметов, которые могут быть стаканы в один момент, ограничено к " )
localify.Bind( "ru", prefix.."error_too_quick",          "Вы используете стакер слишком быстро" )
localify.Bind( "ru", prefix.."error_max_per_player",     "Достигнуто максимальное количество предметов" )
localify.Bind( "ru", prefix.."error_not_in_world",       "Стаканные предметы должны появляться в мире" )
localify.Bind( "ru", prefix.."error_max_constraints",    "Не удалось создать соединение, скорее всего, закончились слоты сущностей" )
-- Labels
localify.Bind( "ru", prefix.."label_presets",            "Готовые настройки стака: " )
localify.Bind( "ru", prefix.."label_relative",           "Стак относителен к: " )
localify.Bind( "ru", prefix.."label_direction",          "Направление стака: " )
localify.Bind( "ru", prefix.."label_count",              "Размер стака" )
localify.Bind( "ru", prefix.."label_reset_offsets",      "Сбросить отклонения" )
localify.Bind( "ru", prefix.."label_reset_angles",       "Сбросить углы" )
localify.Bind( "ru", prefix.."label_show_settings",      "Показать настройки" )
localify.Bind( "ru", prefix.."label_hide_settings",      "Спрятать настройки" )
localify.Bind( "ru", prefix.."label_x",                  "X  (-сзади, +спереди)" )
localify.Bind( "ru", prefix.."label_y",                  "Y  (-слева, +справа)" )
localify.Bind( "ru", prefix.."label_z",                  "Z  (-снизу, +сверху)" )
localify.Bind( "ru", prefix.."label_pitch",              "Pitch  (-снизу, +сверху)" )
localify.Bind( "ru", prefix.."label_yaw",                "Yaw   (-слева, +справа)" )
localify.Bind( "ru", prefix.."label_roll",               "Roll    (-слева, +справа)" )
localify.Bind( "ru", prefix.."label_language",           "Язык: " )
localify.Bind( "ru", prefix.."label_credits",            "Переведено от SupinePandora43" )
localify.Bind( "ru", prefix.."label_max_per_stack",      "Размер стака" )
localify.Bind( "ru", prefix.."label_max_per_player",     "Количество предметов игрока" )
localify.Bind( "ru", prefix.."label_max_offsetx",        "Максимальное X отклонение" )
localify.Bind( "ru", prefix.."label_max_offsety",        "Максимальное Y отклонение" )
localify.Bind( "ru", prefix.."label_max_offsetz",        "Максимальное Z отклонение" )
localify.Bind( "ru", prefix.."label_delay",              "Задержка" )
localify.Bind( "ru", prefix.."label_opacity",            "Непрозрачность" )
-- Checkboxes
localify.Bind( "ru", prefix.."checkbox_freeze",          "Заморозить стаканные предметы" )
localify.Bind( "ru", prefix.."checkbox_weld",            "Сварить стаканные предметы" )
localify.Bind( "ru", prefix.."checkbox_nocollide",       "Отключить столкновения стаканных предметов друг с другом" )
localify.Bind( "ru", prefix.."checkbox_nocollide_all",   "Отключить столкновения стаканных предметов со ВСЕМ" )
localify.Bind( "ru", prefix.."checkbox_use_shift_key",   "Изменить размер стака с SHIFT + ЛКМ/ПКМ" )
localify.Bind( "ru", prefix.."checkbox_relative",        "Стак относителен нового поворота" )
localify.Bind( "ru", prefix.."checkbox_material",        "Применить материал" )
localify.Bind( "ru", prefix.."checkbox_color",           "Применить цвет" )
localify.Bind( "ru", prefix.."checkbox_physprop",        "Применить физические свойства" )
localify.Bind( "ru", prefix.."checkbox_ghost",           "Призрачные все предметы в стаке" )
localify.Bind( "ru", prefix.."checkbox_halo",            "Добавить обводку к призрачным предметам" )
localify.Bind( "ru", prefix.."checkbox_halo_color",      "Цвет обводки" )
localify.Bind( "ru", prefix.."checkbox_axis",            "Отрисовывать XYZ ось" )
localify.Bind( "ru", prefix.."checkbox_axis_labels",     "Отрисовывать XYZ названия осей " )
localify.Bind( "ru", prefix.."checkbox_axis_angles",     "Отрисовывать XYZ углы оси" )
localify.Bind( "ru", prefix.."checkbox_stayinworld",     "Оставаться в мире" )
-- Comboboxes
localify.Bind( "ru", prefix.."combobox_world",           "Мир" )
localify.Bind( "ru", prefix.."combobox_prop",            "Предмет" )
localify.Bind( "ru", prefix.."combobox_direction_up",    "Верх" )
localify.Bind( "ru", prefix.."combobox_direction_down",  "Низ" )
localify.Bind( "ru", prefix.."combobox_direction_front", "Перед" )
localify.Bind( "ru", prefix.."combobox_direction_back",  "Зад" )
localify.Bind( "ru", prefix.."combobox_direction_right", "Право" )
localify.Bind( "ru", prefix.."combobox_direction_left",  "Лево" )
localify.Bind( "ru", prefix.."combobox_default",         "По умолчанию" )
localify.Bind( "ru", prefix.."combobox_sandbox",         "Sandbox" )
localify.Bind( "ru", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "ru", prefix.."combobox_singleplayer",    "Одиночная игра" )
-- HUD
localify.Bind( "ru", prefix.."hud_front",                "Перед" )
localify.Bind( "ru", prefix.."hud_right",                "Право" )
localify.Bind( "ru", prefix.."hud_up",                   "Верх" )
-- Help
localify.Bind( "ru", prefix.."help_max_per_player",      "Максимальное количество предметов, которые могут быть стаканы в один момент." )
localify.Bind( "ru", prefix.."help_max_per_stack",       "Максимальное количество предметов в стаке (ЛКМ)." )
localify.Bind( "ru", prefix.."help_delay",               "Задержка (в секундах) между каждым использыванием стакера (ЛКМ/ПКМ)" )
localify.Bind( "ru", prefix.."help_max_offsetx",         "Максимальная дистанция между стаканными предметами (X-ось)." )
localify.Bind( "ru", prefix.."help_max_offsety",         "Максимальная дистанция между стаканными предметами (Y-ось)." )
localify.Bind( "ru", prefix.."help_max_offsetz",         "Максимальная дистанция между стаканными предметами (Z-ось)." )
localify.Bind( "ru", prefix.."help_freeze",              "Заморозить стаканные предметы при спавне." )
localify.Bind( "ru", prefix.."help_weld",                "Сварить стаканные предметы друг к другу при спавне." )
localify.Bind( "ru", prefix.."help_nocollide",           "Стаканные предметы не будут сталкиваться друг с другом." )
localify.Bind( "ru", prefix.."help_nocollide_all",       "Отключить столкновения для стаканных предметов." )
localify.Bind( "ru", prefix.."help_stayinworld",         "Предотвращает создание стака за пределами мира." )
-- Warnings
localify.Bind( "ru", prefix.."warning_max_per_player",   "В основном для RolePlay игровых режимов. Для SandBox игровых режимов, это должно быть неограничено (-1)." )
localify.Bind( "ru", prefix.."warning_max_offsetx",      "В основном для RolePlay игровых режимов. Не изменяйте, если не знаете что делаете." )
localify.Bind( "ru", prefix.."warning_max_offsety",      "В основном для RolePlay игровых режимов. Не изменяйте, если не знаете что делаете." )
localify.Bind( "ru", prefix.."warning_max_offsetz",      "В основном для RolePlay игровых режимов. Не изменяйте, если не знаете что делаете." )
localify.Bind( "ru", prefix.."warning_freeze",           "Для DarkRP." )
localify.Bind( "ru", prefix.."warning_weld",             "Для DarkRP." )
localify.Bind( "ru", prefix.."warning_nocollide",        "Для DarkRP." )
localify.Bind( "ru", prefix.."warning_nocollide_all",    "НЕ ИЗМЕНЯЙТЕ ВО ВРЕМЯ РАБОТЫ СЕРВЕРА. Это использует экспериментальный GM.ShouldCollide. Это работает и гарантированно предотвращает сбои в Stacker, но требует дополнительного тестирования." )

--[[--------------------------------------------------------------------------
-- Russian Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "zh-cn", prefix.."name",                     "叠加器 - 改进" )
localify.Bind( "zh-cn", prefix.."desc",                     "轻易在任何方向复制物品" )
localify.Bind( "zh-cn", prefix.."left",                     "进行一次叠加" )
localify.Bind( "zh-cn", prefix.."shift_left",               "增加叠加大小" )
localify.Bind( "zh-cn", prefix.."right",                    "叠加单个物品" )
localify.Bind( "zh-cn", prefix.."shift_right",              "减少叠加大小" )
localify.Bind( "zh-cn", prefix.."reload",                   "改变叠加方向" )
localify.Bind( "zh-cn", "Undone_stacker_improved",          "撤回叠加物品" )
-- Errors
localify.Bind( "zh-cn", prefix.."error_blocked_by_server",  "服务器禁止你修改这个控制台参数" )
localify.Bind( "zh-cn", prefix.."error_not_admin",          "你必须是管理员才能修改这个控制台参数" )
localify.Bind( "zh-cn", prefix.."error_invalid_argument",   "你必须输入一个合法数字" )
localify.Bind( "zh-cn", prefix.."error_max_per_stack",      "单次叠加物品的上限是 " )
localify.Bind( "zh-cn", prefix.."error_too_quick",          "你叠加器使用得太快了" )
localify.Bind( "zh-cn", prefix.."error_max_per_player",     "叠加器达到了物品上限" )
localify.Bind( "zh-cn", prefix.."error_not_in_world",       "叠加的物品必须生成在地图内部" )
localify.Bind( "zh-cn", prefix.."error_max_constraints",    "约束生成失败，很可能是达到了实体上限" )
-- Labels
localify.Bind( "zh-cn", prefix.."label_presets",            "叠加器预设：" )
localify.Bind( "zh-cn", prefix.."label_relative",           "叠加相对方向：" )
localify.Bind( "zh-cn", prefix.."label_direction",          "叠加方向：" )
localify.Bind( "zh-cn", prefix.."label_count",              "叠加大小：" )
localify.Bind( "zh-cn", prefix.."label_reset_offsets",      "重置位差" )
localify.Bind( "zh-cn", prefix.."label_reset_angles",       "重置角度" )
localify.Bind( "zh-cn", prefix.."label_show_settings",      "点击显示设置" )
localify.Bind( "zh-cn", prefix.."label_hide_settings",      "点击隐藏设置" )
localify.Bind( "zh-cn", prefix.."label_x",                  "X  (-后, +前)" )
localify.Bind( "zh-cn", prefix.."label_y",                  "Y  (-左, +右)" )
localify.Bind( "zh-cn", prefix.."label_z",                  "Z  (-下, +上)" )
localify.Bind( "zh-cn", prefix.."label_pitch",              "Pitch  (-下, +上)" )
localify.Bind( "zh-cn", prefix.."label_yaw",                "Yaw    (-左, +右)" )
localify.Bind( "zh-cn", prefix.."label_roll",               "Roll    (-左, +右)" )
localify.Bind( "zh-cn", prefix.."label_language",           "语言: " )
localify.Bind( "zh-cn", prefix.."label_credits",            "翻译： 8Z (STEAM_0:0:33380074)" )
localify.Bind( "zh-cn", prefix.."label_max_per_stack",      "单次叠加上限" )
localify.Bind( "zh-cn", prefix.."label_max_per_player",     "玩家叠加物品上限" )
localify.Bind( "zh-cn", prefix.."label_max_offsetx",        "最大 X 位差" )
localify.Bind( "zh-cn", prefix.."label_max_offsety",        "最大 Y 位差" )
localify.Bind( "zh-cn", prefix.."label_max_offsetz",        "最大 Z 位差" )
localify.Bind( "zh-cn", prefix.."label_delay",              "冷却" )
localify.Bind( "zh-cn", prefix.."label_opacity",            "透明度" )
-- Checkboxes
localify.Bind( "zh-cn", prefix.."checkbox_freeze",          "固定叠加物品" )
localify.Bind( "zh-cn", prefix.."checkbox_weld",            "焊接叠加物品" )
localify.Bind( "zh-cn", prefix.."checkbox_nocollide",       "叠加互相无碰撞" )
localify.Bind( "zh-cn", prefix.."checkbox_nocollide_all",   "叠加全部无碰撞" )
localify.Bind( "zh-cn", prefix.."checkbox_use_shift_key",   "更改叠加大小使用 SHIFT+左键/右键" )
localify.Bind( "zh-cn", prefix.."checkbox_relative",        "叠加使用新物品的相对角度" )
localify.Bind( "zh-cn", prefix.."checkbox_material",        "应用材质" )
localify.Bind( "zh-cn", prefix.."checkbox_color",           "应用颜色" )
localify.Bind( "zh-cn", prefix.."checkbox_physprop",        "应用物理特性" )
localify.Bind( "zh-cn", prefix.."checkbox_ghost",           "所有叠加物品显示预览" )
localify.Bind( "zh-cn", prefix.."checkbox_halo",            "物品预览光环效果" )
localify.Bind( "zh-cn", prefix.."checkbox_halo_color",      "光环颜色" )
localify.Bind( "zh-cn", prefix.."checkbox_axis",            "显示 XYZ 轴" )
localify.Bind( "zh-cn", prefix.."checkbox_axis_labels",     "显示 XYZ 轴标签" )
localify.Bind( "zh-cn", prefix.."checkbox_axis_angles",     "显示 XYZ 轴角度" )
localify.Bind( "zh-cn", prefix.."checkbox_stayinworld",     "叠加限定在地图内部" )
-- Comboboxes
localify.Bind( "zh-cn", prefix.."combobox_world",           "世界" )
localify.Bind( "zh-cn", prefix.."combobox_prop",            "物品" )
localify.Bind( "zh-cn", prefix.."combobox_direction_up",    "上" )
localify.Bind( "zh-cn", prefix.."combobox_direction_down",  "下" )
localify.Bind( "zh-cn", prefix.."combobox_direction_front", "前" )
localify.Bind( "zh-cn", prefix.."combobox_direction_back",  "后" )
localify.Bind( "zh-cn", prefix.."combobox_direction_right", "右" )
localify.Bind( "zh-cn", prefix.."combobox_direction_left",  "左" )
localify.Bind( "zh-cn", prefix.."combobox_default",         "默认" )
localify.Bind( "zh-cn", prefix.."combobox_sandbox",         "沙盘" )
localify.Bind( "zh-cn", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "zh-cn", prefix.."combobox_singleplayer",    "单人" )
-- HUD
localify.Bind( "zh-cn", prefix.."hud_front",                "前" )
localify.Bind( "zh-cn", prefix.."hud_right",                "右" )
localify.Bind( "zh-cn", prefix.."hud_up",                   "上" )
-- Help
localify.Bind( "zh-cn", prefix.."help_max_per_player",      "每个玩家堆叠物品的数量上限。" )
localify.Bind( "zh-cn", prefix.."help_max_per_stack",       "单次堆叠（左键）时的物品上限。" )
localify.Bind( "zh-cn", prefix.."help_delay",               "每次使用堆叠器（左键/右键）后的冷却。" )
localify.Bind( "zh-cn", prefix.."help_max_offsetx",         "叠加物品间的最大位差（X轴）。" )
localify.Bind( "zh-cn", prefix.."help_max_offsety",         "叠加物品间的最大位差（Y轴）。" )
localify.Bind( "zh-cn", prefix.."help_max_offsetz",         "叠加物品间的最大位差（Z轴）。" )
localify.Bind( "zh-cn", prefix.."help_freeze",              "叠加的物品刷出后固定。" )
localify.Bind( "zh-cn", prefix.."help_weld",                "叠加的物品刷出后互相焊接。" )
localify.Bind( "zh-cn", prefix.."help_nocollide",           "叠加的物品和其他叠加物品无碰撞。" )
localify.Bind( "zh-cn", prefix.."help_nocollide_all",       "叠加的物品只会和玩家，NPC，车辆和世界碰撞。" )
localify.Bind( "zh-cn", prefix.."help_stayinworld",         "避免叠加的物品刷出在地图外部。" )
-- Warnings
localify.Bind( "zh-cn", prefix.."warning_max_per_player",   "主要用于角色扮演模式的设置。沙盘模式下这个应该是无限的（-1）。" )
localify.Bind( "zh-cn", prefix.."warning_max_offsetx",      "主要用于角色扮演模式的设置。如果你不确定这是什么，不要修改。" )
localify.Bind( "zh-cn", prefix.."warning_max_offsety",      "主要用于角色扮演模式的设置。如果你不确定这是什么，不要修改。" )
localify.Bind( "zh-cn", prefix.."warning_max_offsetz",      "主要用于角色扮演模式的设置。如果你不确定这是什么，不要修改。" )
localify.Bind( "zh-cn", prefix.."warning_freeze",           "提供给 DarkRP 的设置。" )
localify.Bind( "zh-cn", prefix.."warning_weld",             "提供给 DarkRP 的设置。" )
localify.Bind( "zh-cn", prefix.."warning_nocollide",        "提供给 DarkRP 的设置。" )
localify.Bind( "zh-cn", prefix.."warning_nocollide_all",    "绝对不要在服务器运作时修改！这个实验性的功能调用 GM.ShouldCollide。这个设置管用且必定能够避免叠加器崩服，但需要更多的测试。" )

--[[--------------------------------------------------------------------------
-- German Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "de", prefix.."name",                     "Stapler - Verbessert" )
localify.Bind( "de", prefix.."desc",                     "Einfaches Stapeln von duplizierten Props in jede Richtung" )
localify.Bind( "de", prefix.."left",                     "Stapel erstellen" )
localify.Bind( "de", prefix.."shift_left",               "Stapelgröße erhöhen" )
localify.Bind( "de", prefix.."right",                    "Einzelnes Prop erstellen" )
localify.Bind( "de", prefix.."shift_right",              "Stapelgröße verkleinern" )
localify.Bind( "de", prefix.."reload",                   "Stapelrichtung ändern" )
localify.Bind( "de", "Undone_stacker_improved",          "Gestapelte Prop(s) rückgängig machen" )
-- Errors
localify.Bind( "de", prefix.."error_blocked_by_server",  "Der Server hat dich daran gehindert, diese Konsolenvariable zu ändern" )
localify.Bind( "de", prefix.."error_not_admin",          "Du musst dich in der Benutzergruppe 'admin' befinden, um diese Konsolenvariable zu ändern" )
localify.Bind( "de", prefix.."error_invalid_argument",   "Du musst einen gültigen Zahlenwert eingeben" )
localify.Bind( "de", prefix.."error_max_per_stack",      "Die maximale Anzahl von Props, die auf einmal gestapelt werden können, ist begrenzt auf " )
localify.Bind( "de", prefix.."error_too_quick",          "Du verwendest den Stapler zu schnell" )
localify.Bind( "de", prefix.."error_max_per_player",     "Stapler prop limit erreicht" )
localify.Bind( "de", prefix.."error_not_in_world",       "Gestapelte Props müssen innerhalb der Welt gespawnt werden" )
localify.Bind( "de", prefix.."error_max_constraints",    "Constraint konnte nicht erstellt werden ")
-- Labels
localify.Bind( "de", prefix.."label_presets",            "Stapler-Voreinstellungen: " )
localify.Bind( "de", prefix.."label_relative",           "Stapel relativ zu: " )
localify.Bind( "de", prefix.."label_direction",          "Stapelrichtung: " )
localify.Bind( "de", prefix.."label_count",              "Stapelgröße" )
localify.Bind( "de", prefix.."label_reset_offsets",      "Versätze zurücksetzen" )
localify.Bind( "de", prefix.."label_reset_angles",       "Winkel zurücksetzen" )
localify.Bind( "de", prefix.."label_show_settings",      "Zum Anzeigen der Einstellungen anklicken" )
localify.Bind( "de", prefix.."label_hide_settings",      "Zum Verstecken der Einstellungen anklicken" )
localify.Bind( "de", prefix.."label_x",                  "X  (-Hinten, +Vorne)" )
localify.Bind( "de", prefix.."label_y",                  "Y  (-Links, +Rechts)" )
localify.Bind( "de", prefix.."label_z",                  "Z  (-Runter, +Hoch)" )
localify.Bind( "de", prefix.."label_pitch",              "Nicken  (-Runter, +Hoch)" )
localify.Bind( "de", prefix.."label_yaw",                "Gieren   (-Links, +Rechts)" )
localify.Bind( "de", prefix.."label_roll",               "Roll    (-Links, +Rechts)" )
localify.Bind( "de", prefix.."label_language",           "Sprache: " )
localify.Bind( "de", prefix.."label_credits",            "" )
localify.Bind( "de", prefix.."label_max_per_stack",      "Stapelgröße" )
localify.Bind( "de", prefix.."label_max_per_player",     "Props je Spieler" )
localify.Bind( "de", prefix.."label_max_offsetx",        "Maximaler X-Offset" )
localify.Bind( "de", prefix.."label_max_offsety",        "Maximaler Y-Offset" )
localify.Bind( "de", prefix.."label_max_offsetz",        "Maximaler Z-Offset" )
localify.Bind( "de", prefix.."label_delay",              "Delay/Verzögerung" )
localify.Bind( "de", prefix.."label_opacity",            "Deckkraft" )
-- Checkboxes
localify.Bind( "de", prefix.."checkbox_freeze",          "Einfrieren gestapelter Props" )
localify.Bind( "de", prefix.."checkbox_weld",            "Verbinde gestapelte Props" )
localify.Bind( "de", prefix.."checkbox_nocollide",       "Keine-Kollision der gestapelte Props mit einander" )
localify.Bind( "de", prefix.."checkbox_nocollide_all",   "Keine-Kollision der gestapelte Props mit ALLEM" )
localify.Bind( "de", prefix.."checkbox_use_shift_key",   "Stapelgröße mit SHIFT + Links-/Rechtsklick ändern" )
localify.Bind( "de", prefix.."checkbox_relative",        "Stapel relativ zur neuen Drehung" )
localify.Bind( "de", prefix.."checkbox_material",        "Material anwenden" )
localify.Bind( "de", prefix.."checkbox_color",           "Farbe anwenden" )
localify.Bind( "de", prefix.."checkbox_physprop",        "Physikalische Eigenschaften anwenden" )
localify.Bind( "de", prefix.."checkbox_ghost",           "Ghoste alle Props im Stapel" )
localify.Bind( "de", prefix.."checkbox_halo",            "Halos zu geghosteten Props hinzufügen" )
localify.Bind( "de", prefix.."checkbox_halo_color",      "Halo-Farbe" )
localify.Bind( "de", prefix.."checkbox_axis",            "XYZ-Achse zeigen" )
localify.Bind( "de", prefix.."checkbox_axis_labels",     "XYZ-Achsenbeschriftungen zeigen" )
localify.Bind( "de", prefix.."checkbox_axis_angles",     "XYZ-Achsenwinkel zeigen" )
localify.Bind( "de", prefix.."checkbox_stayinworld",     "In der Welt bleiben" )
-- Comboboxes
localify.Bind( "de", prefix.."combobox_world",           "Welt" )
localify.Bind( "de", prefix.."combobox_prop",            "Prop" )
localify.Bind( "de", prefix.."combobox_direction_up",    "Hoch" )
localify.Bind( "de", prefix.."combobox_direction_down",  "Runter" )
localify.Bind( "de", prefix.."combobox_direction_front", "Vorne" )
localify.Bind( "de", prefix.."combobox_direction_back",  "Hinten" )
localify.Bind( "de", prefix.."combobox_direction_right", "Rechts" )
localify.Bind( "de", prefix.."combobox_direction_left",  "Links" )
localify.Bind( "de", prefix.."combobox_default",         "Standard" )
localify.Bind( "de", prefix.."combobox_sandbox",         "Sandbox" )
localify.Bind( "de", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "de", prefix.."combobox_singleplayer",    "Singleplayer" )
-- HUD
localify.Bind( "de", prefix.."hud_front",                "Vorne" )
localify.Bind( "de", prefix.."hud_right",                "Rechts" )
localify.Bind( "de", prefix.."hud_up",                   "Hoch" )
-- Help
localify.Bind( "de", prefix.."help_max_per_player",      "Die maximale Anzahl gestapelter Props pro Spieler ist begrenzt." )
localify.Bind( "de", prefix.."help_max_per_stack",       "Maximale Props pro Stapel (Linksklick)." )
localify.Bind( "de", prefix.."help_delay",               "Verzögerung (in Sekunden) zwischen jeder Stacker-Verwendung (Links-/Rechtsklick)" )
localify.Bind( "de", prefix.."help_max_offsetx",         "Maximaler Abstand zwischen gestapelten Props (X-Achse)." )
localify.Bind( "de", prefix.."help_max_offsety",         "Maximaler Abstand zwischen gestapelten Props (Y-Achse)." )
localify.Bind( "de", prefix.."help_max_offsetz",         "Maximaler Abstand zwischen gestapelten Props (Z-Achse)." )
localify.Bind( "de", prefix.."help_freeze",              "Gestapelte Props werden beim Spawnen eingefroren." )
localify.Bind( "de", prefix.."help_weld",                "Gestapelte Stützen werden beim Spawnen aneinander verbunden." )
localify.Bind( "de", prefix.."help_nocollide",           "Gestapelte Props kollidieren nicht mit anderen gestapelten Props." )
localify.Bind( "de", prefix.."help_nocollide_all",       "Gestapelte Props kollidieren mit nichts außer Spielern, NPCs, Fahrzeugen und der Welt." )
localify.Bind( "de", prefix.."help_stayinworld",         "Verhindert, dass gestapelte Props außerhalb der Map erstellt werden." )
-- Warnings
localify.Bind( "de", prefix.."warning_max_per_player",   "In erster Linie für Rollenspiel-Gamemodi. Für Sandbox-Gamemodes sollte dies generell unbegrenzt sein (-1)." )
localify.Bind( "de", prefix.."warning_max_offsetx",      "In erster Linie für Rollenspiel-Gamemodi. Ändern Sie nichts, wenn Sie nicht wissen, was Sie tun." )
localify.Bind( "de", prefix.."warning_max_offsety",      "In erster Linie für Rollenspiel-Gamemodi. Ändern Sie nichts, wenn Sie nicht wissen, was Sie tun." )
localify.Bind( "de", prefix.."warning_max_offsetz",      "In erster Linie für Rollenspiel-Gamemodi. Ändern Sie nichts, wenn Sie nicht wissen, was Sie tun." )
localify.Bind( "de", prefix.."warning_freeze",           "Für DarkRP." )
localify.Bind( "de", prefix.."warning_weld",             "Für DarkRP." )
localify.Bind( "de", prefix.."warning_nocollide",        "Für DarkRP." )
localify.Bind( "de", prefix.."warning_nocollide_all",    "ÄNDERE NICHTS, WÄHREND DER SERVER AUSGEFÜHRT WIRD. Dies verwendet den GM.ShouldCollide-Hook und ist experimentell. Es funktioniert und verhindert garantiert Abstürze von Stacker, muss aber noch weiter getestet werden." )

--[[--------------------------------------------------------------------------
-- Turkish Localization
-- Big thanks to Matt (STEAM_0:1:241718138) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "tr", prefix.."name",                     "Geliştirilmiş Yığıcı" )
localify.Bind( "tr", prefix.."desc",                     "Kopyalanan nesneleri herhangi bir yönde kolayca yığın" )
localify.Bind( "tr", prefix.."left",                     "Bir yığın oluştur" )
localify.Bind( "tr", prefix.."shift_left",               "Yığın boyutunu artır" )
localify.Bind( "tr", prefix.."right",                    "Tek bir nesne oluştur" )
localify.Bind( "tr", prefix.."shift_right",              "Yığın boyutunu azalt" )
localify.Bind( "tr", prefix.."reload",                   "Yığın yönünü değiştir" )
localify.Bind( "tr", "Undone_stacker_improved",          "Yığınlanmış nesne(ler) geri alındı" )
-- Errors                                              
localify.Bind( "tr", prefix.."error_blocked_by_server",  "Sunucu bu konsol değişkenini değiştirmenizi engelledi" )
localify.Bind( "tr", prefix.."error_not_admin",          "Bu konsol değişkenini değiştirmek için 'admin' kullanıcı grubunda olmanız gerekir" )
localify.Bind( "tr", prefix.."error_invalid_argument",   "Geçerli bir sayı değeri girmelisiniz" )
localify.Bind( "tr", prefix.."error_max_count",          "Bir kerede yığılabilecek maksimum nesne sayısı sınırlıdır" )
localify.Bind( "tr", prefix.."error_too_quick",          "Yığınlayıcıyı çok hızlı kullanıyorsunuz" )
localify.Bind( "tr", prefix.."error_max_total",          "Yığınlayıcı destek sınırına ulaşıldı" )
localify.Bind( "tr", prefix.."error_not_in_world",       "Yığılmış nesneler dünya içinde oluşturulmalıdır" )
localify.Bind( "tr", prefix.."error_max_constraints",    "Kısıtlama oluşturulamadı, büyük olasılıkla varlık yuvaları tükendi" )
-- Labels                                              
localify.Bind( "tr", prefix.."label_presets",            "Yığınlayıcı Ön Ayarları: " )
localify.Bind( "tr", prefix.."label_relative",           "Göreceli yığın: " )
localify.Bind( "tr", prefix.."label_direction",          "Yığın yönü: " )
localify.Bind( "tr", prefix.."label_count",              "Yığın boyutu" )
localify.Bind( "tr", prefix.."label_reset_offsets",      "Ofsetleri sıfırla" )
localify.Bind( "tr", prefix.."label_reset_angles",       "Açıları sıfırla" )
localify.Bind( "tr", prefix.."label_show_settings",      "Ayarları göstermek için tıklayın" )
localify.Bind( "tr", prefix.."label_hide_settings",      "Ayarları gizlemek için tıklayın" )
localify.Bind( "tr", prefix.."label_x",                  "X (-arka, +ön)" )
localify.Bind( "tr", prefix.."label_y",                  "E (-sol, +sağ)" )
localify.Bind( "tr", prefix.."label_z",                  "Z (-aşağı, +yukarı)" )
localify.Bind( "tr", prefix.."label_pitch",              "Pitch (-aşağı, +yukarı)" )
localify.Bind( "tr", prefix.."label_yaw",                "Yaw (-sol, +sağ)" )
localify.Bind( "tr", prefix.."label_roll",               "Döndür (-sola, +sağa)" )
localify.Bind( "tr", prefix.."label_language",           "Dil: Türkçe" )
localify.Bind( "tr", prefix.."label_credits",            "Türkçeye Matt tarafından çevrilmiştir (STEAM_0:1:241718138)" )
localify.Bind( "tr", prefix.."label_max_per_stack",      "Yığın boyutu" )
localify.Bind( "tr", prefix.."label_max_per_player",     "Oyuncu başına nesne" )
localify.Bind( "tr", prefix.."label_max_offsetx",        "Maksimum X ofseti" ) 
localify.Bind( "tr", prefix.."label_max_offsety",        "Maksimum Y ofseti" )
localify.Bind( "tr", prefix.."label_max_offsetz",        "Maksimum Z ofseti" )
localify.Bind( "tr", prefix.."label_delay",              "Gecikme" )
localify.Bind( "tr", prefix.."label_opacity",            "Opaklık" )
-- Checkboxes                                          
localify.Bind( "tr", prefix.."checkbox_freeze",          "Yığınlanmış nesneleri dondur" )
localify.Bind( "tr", prefix.."checkbox_weld",            "Yığılmış nesneleri yapıştır" )
localify.Bind( "tr", prefix.."checkbox_nocollide",       "Yığılmış nesnelerin birbirine çarpmasını engelle" )
localify.Bind( "tr", prefix.."checkbox_nocollide_all",   "Yığılmış nesnelerin her şey ile çarpışmasını engelle" )
localify.Bind( "tr", prefix.."checkbox_use_shift_key",   "SHIFT + sol/sağ tıklamayla yığın boyutunu değiştir" )
localify.Bind( "tr", prefix.."checkbox_relative",        "Yeni rotasyona göre yığın" )
localify.Bind( "tr", prefix.."checkbox_material",        "Materyali uygula" )
localify.Bind( "tr", prefix.."checkbox_color",           "Renk uygula" )
localify.Bind( "tr", prefix.."checkbox_physprop",        "Fiziksel özellikleri uygula" )
localify.Bind( "tr", prefix.."checkbox_ghost",           "Yığındaki tüm nesneleri gizle" )
localify.Bind( "tr", prefix.."checkbox_halo",            "Gizlenmiş nesnelere ışık halkası ekle" )
localify.Bind( "tr", prefix.."checkbox_halo_color",      "Işık halkası rengi" )
localify.Bind( "tr", prefix.."checkbox_axis",            "XYZ eksenini çiz" )
localify.Bind( "tr", prefix.."checkbox_axis_labels",     "XYZ eksen etiketlerini çizin" )
localify.Bind( "tr", prefix.."checkbox_axis_angles",     "XYZ eksen açılarını çiz" )
localify.Bind( "tr", prefix.."checkbox_stayinworld",     "Dünyada kal" )
-- Comboboxes                                          
localify.Bind( "tr", prefix.."combobox_world",           "Dünya" )
localify.Bind( "tr", prefix.."combobox_prop",            "Nesne" )
localify.Bind( "tr", prefix.."combobox_direction_up",    "Yukarı" )
localify.Bind( "tr", prefix.."combobox_direction_down",  "Aşağı" )
localify.Bind( "tr", prefix.."combobox_direction_front", "Ön" )
localify.Bind( "tr", prefix.."combobox_direction_back",  "Geri" )
localify.Bind( "tr", prefix.."combobox_direction_right", "Sağ" )
localify.Bind( "tr", prefix.."combobox_direction_left",  "Sol" )
localify.Bind( "tr", prefix.."combobox_default",         "Varsayılan" )
localify.Bind( "tr", prefix.."combobox_sandbox",         "Sandbox" )
localify.Bind( "tr", prefix.."combobox_darkrp",          "DarkRP" )
localify.Bind( "tr", prefix.."combobox_singleplayer",    "Tek oyuncu" )
-- HUD                                                 
localify.Bind( "tr", prefix.."hud_front",                "Ön" )
localify.Bind( "tr", prefix.."hud_right",                "Sağ" )
localify.Bind( "tr", prefix.."hud_up",                   "Yukarı" )
-- Help                                                
localify.Bind( "tr", prefix.."help_max_per_player",      "Her oyuncunun maksimum yığılmış nesnesi sınırlıdır." )
localify.Bind( "tr", prefix.."help_max_per_stack",       "Yığın başına maksimum nesne (sol tıklama)." )
localify.Bind( "tr", prefix.."help_delay",               "Her yığınlayıcı kullanımı arasındaki gecikme (saniye cinsinden) (sol/sağ tıklama)" )
localify.Bind( "tr", prefix.."help_max_offsetx",         "Yığılmış nesneler arasındaki maksimum mesafe (X ekseni)." )
localify.Bind( "tr", prefix.."help_max_offsety",         "Yığılmış nesneler arasındaki maksimum mesafe (Y ekseni)." )
localify.Bind( "tr", prefix.."help_max_offsetz",         "Yığılmış nesneler arasındaki maksimum mesafe (Z ekseni)." )
localify.Bind( "tr", prefix.."help_freeze",              "Yığılmış nesneler ortaya çıktığında donar." )
localify.Bind( "tr", prefix.."help_weld",                "Yığılmış nesneler, ortaya çıktıklarında birbirine yapışır." )
localify.Bind( "tr", prefix.."help_nocollide",           "Yığılmış nesneler diğer yığılmış nesnelerle çarpışmaz." )
localify.Bind( "tr", prefix.."help_nocollide_all",       "Yığılmış nesneler oyuncular, NPC'ler, araçlar ve dünya dışında hiçbir şeyle çarpışmaz." )
localify.Bind( "tr", prefix.."help_stayinworld",         "Yığınlanmış nesnelerin harita dışında oluşturulmasını önler." )
-- Warnings                                            
localify.Bind( "tr", prefix.."warning_max_per_player",   "Öncelikle Rol Yapma oyun modları için. Sandbox oyun modları için bu genellikle sınırsız olmalıdır (-1)." )
localify.Bind( "tr", prefix.."warning_max_offsetx",      "Öncelikle Rol Yapma oyun modları için. Ne yaptığınızı bilmiyorsanız değişiklik yapmayın." )
localify.Bind( "tr", prefix.."warning_max_offsety",      "Öncelikle Rol Yapma oyun modları için. Ne yaptığınızı bilmiyorsanız değişiklik yapmayın." )
localify.Bind( "tr", prefix.."warning_max_offsetz",      "Öncelikle Rol Yapma oyun modları için. Ne yaptığınızı bilmiyorsanız değişiklik yapmayın." )
localify.Bind( "tr", prefix.."warning_freeze",           "DarkRP için." )
localify.Bind( "tr", prefix.."warning_weld",             "DarkRP için." )
localify.Bind( "tr", prefix.."warning_nocollide",        "DarkRP için." )
localify.Bind( "tr", prefix.."warning_nocollide_all",    "SUNUCU ÇALIŞIRKEN DEĞİŞTİRMEYİN. Bu, GM.ShouldCollide kancasını kullanır ve deneyseldir. Çalışır ve yığınlayıcıdan kaynaklanan çökmeleri durdurması garanti edilir, ancak daha fazla test yapılması gerekiyor." )

--[[--------------------------------------------------------------------------
-- <Other> Localization
--------------------------------------------------------------------------]]--
--[[
-- Tool Settings
localify.Bind( "", prefix.."name",                     "" )
localify.Bind( "", prefix.."desc",                     "" )
localify.Bind( "", prefix.."left",                     "" )
localify.Bind( "", prefix.."shift_left",               "" )
localify.Bind( "", prefix.."right",                    "" )
localify.Bind( "", prefix.."shift_right",              "" )
localify.Bind( "", prefix.."reload",                   "" )
localify.Bind( "", "Undone_stacker_improved",          "" )
-- Errors
localify.Bind( "", prefix.."error_blocked_by_server",  "" )
localify.Bind( "", prefix.."error_not_admin",          "" )
localify.Bind( "", prefix.."error_invalid_argument",   "" )
localify.Bind( "", prefix.."error_max_count",          "" )
localify.Bind( "", prefix.."error_too_quick",          "" )
localify.Bind( "", prefix.."error_max_total",          "" )
localify.Bind( "", prefix.."error_not_in_world",       "" )
localify.Bind( "", prefix.."error_max_constraints",    "" )
-- Labels
localify.Bind( "", prefix.."label_presets",            "" )
localify.Bind( "", prefix.."label_relative",           "" )
localify.Bind( "", prefix.."label_direction",          "" )
localify.Bind( "", prefix.."label_count",              "" )
localify.Bind( "", prefix.."label_reset_offsets",      "" )
localify.Bind( "", prefix.."label_reset_angles",       "" )
localify.Bind( "", prefix.."label_show_settings",      "" )
localify.Bind( "", prefix.."label_hide_settings",      "" )
localify.Bind( "", prefix.."label_x",                  "" )
localify.Bind( "", prefix.."label_y",                  "" )
localify.Bind( "", prefix.."label_z",                  "" )
localify.Bind( "", prefix.."label_pitch",              "" )
localify.Bind( "", prefix.."label_yaw",                "" )
localify.Bind( "", prefix.."label_roll",               "" )
localify.Bind( "", prefix.."label_language",           "" )
localify.Bind( "", prefix.."label_credits",            "" )
localify.Bind( "", prefix.."label_max_per_stack",      "" )
localify.Bind( "", prefix.."label_max_per_player",     "" )
localify.Bind( "", prefix.."label_max_offsetx",        "" ) 
localify.Bind( "", prefix.."label_max_offsety",        "" )
localify.Bind( "", prefix.."label_max_offsetz",        "" )
localify.Bind( "", prefix.."label_delay",              "" )
localify.Bind( "", prefix.."label_opacity",            "" )
-- Checkboxes
localify.Bind( "", prefix.."checkbox_freeze",          "" )
localify.Bind( "", prefix.."checkbox_weld",            "" )
localify.Bind( "", prefix.."checkbox_nocollide",       "" )
localify.Bind( "", prefix.."checkbox_nocollide_all",   "" )
localify.Bind( "", prefix.."checkbox_use_shift_key",   "" )
localify.Bind( "", prefix.."checkbox_relative",        "" )
localify.Bind( "", prefix.."checkbox_material",        "" )
localify.Bind( "", prefix.."checkbox_color",           "" )
localify.Bind( "", prefix.."checkbox_physprop",        "" )
localify.Bind( "", prefix.."checkbox_ghost",           "" )
localify.Bind( "", prefix.."checkbox_halo",            "" )
localify.Bind( "", prefix.."checkbox_halo_color",      "" )
localify.Bind( "", prefix.."checkbox_axis",            "" )
localify.Bind( "", prefix.."checkbox_axis_labels",     "" )
localify.Bind( "", prefix.."checkbox_axis_angles",     "" )
localify.Bind( "", prefix.."checkbox_stayinworld",     "" )
-- Comboboxes
localify.Bind( "", prefix.."combobox_world",           "" )
localify.Bind( "", prefix.."combobox_prop",            "" )
localify.Bind( "", prefix.."combobox_direction_up",    "" )
localify.Bind( "", prefix.."combobox_direction_down",  "" )
localify.Bind( "", prefix.."combobox_direction_front", "" )
localify.Bind( "", prefix.."combobox_direction_back",  "" )
localify.Bind( "", prefix.."combobox_direction_right", "" )
localify.Bind( "", prefix.."combobox_direction_left",  "" )
localify.Bind( "", prefix.."combobox_default",         "" )
localify.Bind( "", prefix.."combobox_sandbox",         "" )
localify.Bind( "", prefix.."combobox_darkrp",          "" )
localify.Bind( "", prefix.."combobox_singleplayer",    "" )
-- HUD
localify.Bind( "", prefix.."hud_front",                "" )
localify.Bind( "", prefix.."hud_right",                "" )
localify.Bind( "", prefix.."hud_up",                   "" )
-- Help
localify.Bind( "", prefix.."help_max_per_player",      "" )
localify.Bind( "", prefix.."help_max_per_stack",       "" )
localify.Bind( "", prefix.."help_delay",               "" )
localify.Bind( "", prefix.."help_max_offsetx",         "" )
localify.Bind( "", prefix.."help_max_offsety",         "" )
localify.Bind( "", prefix.."help_max_offsetz",         "" )
localify.Bind( "", prefix.."help_freeze",              "" )
localify.Bind( "", prefix.."help_weld",                "" )
localify.Bind( "", prefix.."help_nocollide",           "" )
localify.Bind( "", prefix.."help_nocollide_all",       "" )
localify.Bind( "", prefix.."help_stayinworld",         "" )
-- Warnings
localify.Bind( "", prefix.."warning_max_per_player",   "" )
localify.Bind( "", prefix.."warning_max_offsetx",      "" )
localify.Bind( "", prefix.."warning_max_offsety",      "" )
localify.Bind( "", prefix.."warning_max_offsetz",      "" )
localify.Bind( "", prefix.."warning_freeze",           "" )
localify.Bind( "", prefix.."warning_weld",             "" )
localify.Bind( "", prefix.."warning_nocollide",        "" )
localify.Bind( "", prefix.."warning_nocollide_all",    "" )
]]

-- Hopefully will add more with community/crowdsource support.

-- If you are multi/bilingual, please consider helping me translate the phrases above into other languages.
-- Create an issue on the Github page ( https://github.com/Mista-Tea/improved-stacker ) or
-- add me on Steam ( http://steamcommunity.com/profiles/76561198015280374 ). Thanks!

--PATH addons/sl_utils/lua/weapons/hololink_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can now use the Hololink!"
SWEP.Instructions 			= "Click to Hololink."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Hololink"
SWEP.Spawnable				= true

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(10,-20),
	        ["ValveBiped.Bip01_R_Hand"] = Angle(0,1,50),
	        ["ValveBiped.Bip01_Head1"] = Angle(0,-30,-20),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(0,-65,39.8863),
	    }
	end
end

--PATH addons/sl_main_system/lua/weapons/idcard/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Carte de Chasseur"
	SWEP.Slot = 2
	SWEP.SlotPos = 2
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = ""
SWEP.Instructions = "Gardez cette carte en main pour la montrer aux autres joueurs."
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.HoldType = "pistol";
SWEP.WorldModel = ""

SWEP.AnimPrefix	 = "pistol"
SWEP.Category = "[UTIL - MAD]"

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

function SWEP:Initialize() self:SetHoldType("pistol") end
function SWEP:CanPrimaryAttack ( ) return false; end
function SWEP:CanSecondaryAttack ( ) return false; end

function SWEP:DrawWorldModel()
end

function SWEP:PreDrawViewModel(vm)
    return true
end

if CLIENT then

local VUMat = Material("liscence_card_chasseur.png")

function SWEP:DrawHUD()
	local LW, LH = 500, 250
	local W,H = ScrW()-LW-5, ScrH()-LH-5
	
	local LP = LocalPlayer()
	LP.PIcon = LP.PIcon or vgui.Create( "ModelImage")
	LP.PIcon:SetSize(146,144)
	LP.PIcon:SetModel(LP:GetModel())
					
	surface.SetMaterial(VUMat)
	surface.SetDrawColor(255, 255, 255, 255)
	surface.DrawTexturedRect(W, H, LW, LH)

	LP.PIcon:SetPos(W+25,H+71)
	LP.PIcon:SetPaintedManually(false)
	LP.PIcon:PaintManual()
	LP.PIcon:SetPaintedManually(true)					
		
	local TextW,TextH = W+175, H + 75
	
	draw.SimpleText(LP:Nick(), "MNew_Font1", TextW+90, TextH+14, Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	draw.SimpleText(LP:GetNWInt("Rang"), "MNew_Font1", TextW+97, TextH+50, Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

	local DIS = 0
	local CS = 5 
	local LicenseW, LicenseH = W+325, H+90

end


hook.Add("PreDrawTranslucentRenderables", "DrawDICards", function()
	local LPlayer = LocalPlayer()
	for k,v in pairs(player.GetAll()) do
		local CurWep = v:GetActiveWeapon()
		if v != LPlayer and IsValid(CurWep) and v:GetActiveWeapon():GetClass() == "idcard" and v:HasWeapon("idcard") then
			if LPlayer:GetPos():Distance(v:GetPos()) > 1000 then return end
			v.PIcon = v.PIcon or vgui.Create( "ModelImage")
			v.PIcon:SetSize(90,93)
			v.PIcon:SetModel(v:GetModel())

			local boneindex = v:LookupBone("ValveBiped.Bip01_R_Hand")
			if boneindex then	
				local HPos, HAng = v:GetBonePosition(boneindex)
				
				HAng:RotateAroundAxis(HAng:Forward(), -90)
				HAng:RotateAroundAxis(HAng:Right(), -90)
				HAng:RotateAroundAxis(HAng:Up(), 5)
				HPos = HPos + HAng:Up()*4 + HAng:Right()*-5 + HAng:Forward()*1
				
				cam.Start3D2D(HPos, HAng, 1)
					surface.SetMaterial(VUMat)
					surface.SetDrawColor(255, 255, 255, 255)
					surface.DrawTexturedRect(0, 0, 15, 8)
				cam.End3D2D()
				cam.Start3D2D(HPos, HAng, .05)
					v.PIcon:SetPos(12,45)
					v.PIcon:SetPaintedManually(false)
					v.PIcon:PaintManual()
					v.PIcon:SetPaintedManually(true)					
					
					local TextW = 105
					
					draw.SimpleText(v:Nick(), "MNew_Font3", TextW+52, 56, Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
					draw.SimpleText(v:GetNWInt("Rang"), "MNew_Font3", TextW+58, 79, Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
					

					local LicenseW = 225
					local DIS = 35
					local CS = 40 

				cam.End3D2D()
				
			end		
		end
	end
end)
end
--PATH addons/sl_main_system/lua/weapons/mad_baton/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton17/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton19/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton9/shared.lua:
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

SWEP.PrintName 		      = "9 : Baton noir" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton16.mdl"
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
SWEP.BonusDegats = 74

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_bow/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague1/shared.lua:
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

SWEP.PrintName 		      = "1 : Dague en fer poli" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague35.mdl"
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
SWEP.BonusDegats = 10
SWEP.holdtype = "sl_dague_ht_mad"

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague12/shared.lua:
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

SWEP.PrintName 		      = "12 : Dague scellé" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague14.mdl"
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
SWEP.BonusDegats = 98

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague13/shared.lua:
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

SWEP.PrintName 		      = "13 : Dague en améthyste" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague31.mdl"
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
SWEP.BonusDegats = 106

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague18/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague2/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague6/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee14/shared.lua:
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

SWEP.PrintName 		      = "14 : Épée Royal" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword25.mdl"
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
SWEP.BonusDegats = 122

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee15/shared.lua:
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

SWEP.PrintName 		      = "15 : Épée de Pirate" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword8.mdl"
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
SWEP.BonusDegats = 130

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee7/shared.lua:
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

SWEP.PrintName 		      = "7 : Épée en fer doré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword7.mdl"
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
SWEP.BonusDegats = 66

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau1/shared.lua:
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

SWEP.PrintName 		      = "1 : Marteau en fer poli" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/marteau9.mdl"
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
SWEP.BonusDegats = 10
SWEP.holdtype = "sl_marteau_ht_mad"

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau14/shared.lua:
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

SWEP.PrintName 		      = "14 : Hache Royal" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/axe2.mdl"
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
SWEP.BonusDegats = 114

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau15/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau3/shared.lua:
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

SWEP.PrintName 		      = "3 : Marteau en fer précieux" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/marteau3.mdl"
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
SWEP.BonusDegats = 26

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau4/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau8/cl_init.lua:
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
--PATH addons/sl_utils/lua/weapons/point_in_direction_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can now point in a direction!"
SWEP.Instructions 			= "Click to point."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Point"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 110

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_Finger2"] = Angle(4.151602268219, -52.963024139404, 0.42117667198181),
	        ["ValveBiped.Bip01_R_Finger21"] = Angle(0.00057629722869024, -58.618747711182, 0.001297949347645),
	        ["ValveBiped.Bip01_R_Finger3"] = Angle(4.151602268219, -52.963024139404, 0.42117667198181),
	        ["ValveBiped.Bip01_R_Finger31"] = Angle(0.00057629722869024, -58.618747711182, 0.001297949347645),
	        ["ValveBiped.Bip01_R_Finger4"] = Angle(4.151602268219, -52.963024139404, 0.42117667198181),
	        ["ValveBiped.Bip01_R_Finger41"] = Angle(0.00057629722869024, -58.618747711182, 0.001297949347645),
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(25.019514083862, -87.288040161133, -0.0012286090059206),
	    }
	end
end

--PATH addons/sl_utils/lua/weapons/salute_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can salute!"
SWEP.Instructions 			= "Click to salute."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Salute"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 100

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(80, -95, -77.5),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(35, -125, -5),
	    }
	end
end

--PATH gamemodes/mangarp/entities/weapons/weapon_fiveseven2/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.IconLetter = "u"

    killicon.AddFont("weapon_fiveseven2", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

SWEP.Base = "weapon_cs_base2"

SWEP.PrintName = "FiveSeven"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_fiveseven.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fiveseven.mdl"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "pistol"
SWEP.LoweredHoldType = "normal"

SWEP.Primary.Sound = Sound("Weapon_FiveSeven.Single")
SWEP.Primary.Recoil = .5
SWEP.Primary.Damage = 10
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.03
SWEP.Primary.ClipSize = 21
SWEP.Primary.Delay = 0.05
SWEP.Primary.DefaultClip = 21
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-5.92, -6.2, 3)
SWEP.IronSightsAng = Vector(-0.5, 0.07, 0)

--PATH gamemodes/mangarp/entities/weapons/weapon_p2282/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.IconLetter = "y"

    killicon.AddFont("weapon_p2282", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

SWEP.Base = "weapon_cs_base2"

SWEP.PrintName = "P228"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.HoldType = "pistol"
SWEP.LoweredHoldType = "normal"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.Primary.Sound = Sound("Weapon_p228.Single")
SWEP.Primary.Recoil = 0.8
SWEP.Primary.Damage = 10
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.04
SWEP.Primary.ClipSize = 12
SWEP.Primary.Delay = 0.1
SWEP.Primary.DefaultClip = 12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-5.985, -6.7, 2.87)
SWEP.IronSightsAng = Vector(-0.3, -0.03, 0)

--PATH addons/sl_util_accessory/lua/entities/aas_npc_shop/shared.lua:
ENT.Base = "base_ai" 
ENT.Type = "ai"
ENT.PrintName = "NPC - Accessory"
ENT.Category = "Aldreya"
ENT.Author = "Kobralost"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/sl_aphone/lua/entities/aphone_npc/cl_init.lua:
include("shared.lua")
local p_h = Vector(0,0,15)
local p = Vector(0,0,70)

function ENT:Draw()
    self:DrawModel()
    if LocalPlayer():GetPos():DistToSqr(self:GetPos()) > 500 * 500 then return end

    local ang = LocalPlayer():EyeAngles()
    local pos = self:GetPos() + p

    local targethead = self:LookupBone("ValveBiped.Bip01_Head1")

    if targethead then
        local targetheadpos = self:GetBonePosition(targethead)
        pos = targetheadpos + p_h
    end

    ang:RotateAroundAxis( ang:Forward(), 90 )
    ang:RotateAroundAxis( ang:Right(), 90 )

    cam.Start3D2D(pos, ang, 0.08)
        draw.SimpleText(self.PrintName, "Roboto80_3D", 0, -30, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    cam.End3D2D()
end

net.Receive("APhone_OpenPaint", function()
    aphone.OpenPaint()
end)
--PATH addons/sl_util_atm/lua/entities/atm_reader/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Card Reader"
ENT.Author = "<CODE BLUE>"
ENT.Contact = "Via Steam"
ENT.Spawnable = true
ENT.Category = "Blue's ATM"
ENT.AdminSpawnable = true 

--Vars for the screen
function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "ReaderOwner")
	self:NetworkVar("Int", 0, "ItemPrice")
	self:NetworkVar("String", 1, "ItemTitle")
	self:NetworkVar("String", 2, "ItemDescription")
end
--PATH lua/entities/champagne3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Champagne"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/champagne2.mdl")
	
end
--PATH lua/entities/champagne4/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Champagne (open)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/champagne2b.mdl")
	
end
--PATH lua/entities/cheesewheel1c/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/cheesewheel1c.mdl")
	
end
--PATH lua/entities/chipsdoritos5/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Doritos - Cool Ranch"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Chips (Crisps if ya from Blighty)"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/ChipsDoritos5.mdl")
	
end
--PATH lua/entities/chipslays3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Lays Barbeque"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Lays"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipslays3.mdl")
	
end
--PATH lua/entities/chipslays7/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Lays - BBQ"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Lays"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipslays7.mdl")
	
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_punching_point/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end
--PATH lua/entities/digestive/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Digestives"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A pack of Digestives"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Digestive2.mdl")
	
end
--PATH lua/entities/drg_roach_chester_arrow.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "proj_drg_default"
ENT.IsDrGGrenade = true

-- Misc --
ENT.PrintName = "HE Grenade"
ENT.Category = "DrGBase"
ENT.Models = {"models/Items/CrossbowRounds.mdl"}
ENT.Spawnable = false

-- Physics --
ENT.Physgun = false
ENT.Gravgun = false
ENT.Gravity = false

if SERVER then
  AddCSLuaFile()

	function ENT:OnContact(ent)
		if ent:IsWorld() then
			self:EmitSound("roach/ds1/main/sword-x-sword1.wav.mp3")
		else
			ParticleEffect("blood_impact_red_01",self:GetPos(),self:GetAngles(),nil)
			self:EmitSound("roach/ds1/main/blood"..math.random(3)..".wav.mp3")
		end
		dmg = math.random(23,32)
		if self:GetNoDraw() then dmg=dmg*math.Rand(3,5) end
		if (IsValid(self:GetOwner())) and self:GetOwner():IsPossessed() then dmg = dmg*3 end
		self:DealDamage(ent, dmg, DMG_NEVERGIB)
		SafeRemoveEntity(self)
	end
end

--PATH lua/entities/drgbase_nextbot/relationships.lua:

-- Convars --

local DebugRelationship = CreateConVar("drgbase_debug_relationships", "0")

-- Getters/setters --

function ENT:IsFrightening()
	return self:GetNW2Bool("DrGBaseFrightening")
end

function ENT:Team()
	return self:GetNW2Int("DrGBaseTeam", 0)
end

-- Helpers --

local function EnumToString(disp)
	if disp == D_LI then return "D_LI"
	elseif disp == D_HT then return "D_HT"
	elseif disp == D_FR then return "D_FR"
	elseif disp == D_NU then return "D_NU"
	else return "D_ER" end
end

local CACHED_DISPS = {
	[D_LI] = true,
	[D_HT] = true,
	[D_FR] = true
}
local function IsCachedDisp(disp)
	return CACHED_DISPS[disp] or false
end
local function IsValidDisp(disp)
	return IsCachedDisp(disp) or disp == D_NU
end

local DEFAULT_DISP = D_NU
local DEFAULT_PRIO = 1
local DEFAULT_REL = {disp = DEFAULT_DISP, prio = DEFAULT_PRIO}
function ENT:_InitRelationships()
	if CLIENT then return end
	self._DrGBaseRelationships = table.DrG_Default({}, DEFAULT_DISP)
	self._DrGBaseRelPriorities = table.DrG_Default({}, DEFAULT_PRIO)
	self._DrGBaseRelationshipCaches = {[D_LI] = {}, [D_HT] = {}, [D_FR] = {}}
	self._DrGBaseRelationshipCachesSpotted = {[D_LI] = {}, [D_HT] = {}, [D_FR] = {}}
	self._DrGBaseIgnoredEntities = {}
	if IsValidDisp(self.DefaultRelationship) then
		self._DrGBaseDefaultRelationship = self.DefaultRelationship
	else self._DrGBaseDefaultRelationship = DEFAULT_DISP end
	self._DrGBaseRelationshipDefiners = {
		["entity"] = table.DrG_Default({}, DEFAULT_REL),
		["class"] = table.DrG_Default({}, DEFAULT_REL),
		["model"] = table.DrG_Default({}, DEFAULT_REL),
		["faction"] = table.DrG_Default({}, DEFAULT_REL)
	}
	self:SetNW2Bool("DrGBaseFrightening", self.Frightening)
	self._DrGBaseFactions = {}
	self:JoinFactions(self.Factions)
end

if SERVER then
	util.AddNetworkString("DrGBaseNextbotPlayerRelationship")

	-- Util --

	local DISP_PRIORITIES = {
		[D_LI] = 4,
		[D_FR] = 3,
		[D_HT] = 2,
		[D_NU] = 1,
		[D_ER] = 0
	}
	local function HighestRelationship(relationships)
		local relationship = table.DrG_Fetch(relationships, function(rel1, rel2)
			if rel1.prio > rel2.prio then
				return true
			elseif rel1.prio == rel2.prio then
				if DISP_PRIORITIES[rel1.disp] > DISP_PRIORITIES[rel2.disp] then
					return true
				else return false end
			else return false end
		end)
		return relationship
	end

	local DEFAULT_FACTIONS = {
		["npc_crow"] = FACTION_ANIMALS,
		["npc_monk"] = FACTION_REBELS,
		["npc_pigeon"] = FACTION_ANIMALS,
		["npc_seagull"] = FACTION_ANIMALS,
		["npc_combine_camera"] = FACTION_COMBINE,
		["npc_turret_ceiling"] = FACTION_COMBINE,
		["npc_cscanner"] = FACTION_COMBINE,
		["npc_combinedropship"] = FACTION_COMBINE,
		["npc_combinegunship"] = FACTION_COMBINE,
		["npc_combine_s"] = FACTION_COMBINE,
		["npc_hunter"] = FACTION_COMBINE,
		["npc_helicopter"] = FACTION_COMBINE,
		["npc_manhack"] = FACTION_COMBINE,
		["npc_metropolice"] = FACTION_COMBINE,
		["npc_rollermine"] = FACTION_COMBINE,
		["npc_clawscanner"] = FACTION_COMBINE,
		["npc_stalker"] = FACTION_COMBINE,
		["npc_strider"] = FACTION_COMBINE,
		["npc_turret_floor"] = FACTION_COMBINE,
		["npc_alyx"] = FACTION_REBELS,
		["npc_barney"] = FACTION_REBELS,
		["npc_citizen"] = FACTION_REBELS,
		["npc_dog"] = FACTION_REBELS,
		["npc_magnusson"] = FACTION_REBELS,
		["npc_kleiner"] = FACTION_REBELS,
		["npc_mossman"] = FACTION_REBELS,
		["npc_eli"] = FACTION_REBELS,
		["npc_fisherman"] = FACTION_REBELS,
		["npc_gman"] = FACTION_GMAN,
		["npc_odessa"] = FACTION_REBELS,
		["npc_vortigaunt"] = FACTION_REBELS,
		["npc_breen"] = FACTION_COMBINE,
		["npc_antlion"] = FACTION_ANTLIONS,
		["npc_antlion_grub"] = FACTION_ANTLIONS,
		["npc_antlionguard"] = FACTION_ANTLIONS,
		["npc_antlionguardian"] = FACTION_ANTLIONS,
		["npc_antlion_worker"] = FACTION_ANTLIONS,
		["npc_barnacle"] = FACTION_BARNACLES,
		["npc_headcrab_fast"] = FACTION_ZOMBIES,
		["npc_fastzombie"] = FACTION_ZOMBIES,
		["npc_fastzombie_torso"] = FACTION_ZOMBIES,
		["npc_headcrab"] = FACTION_ZOMBIES,
		["npc_headcrab_black"] = FACTION_ZOMBIES,
		["npc_poisonzombie"] = FACTION_ZOMBIES,
		["npc_zombie"] = FACTION_ZOMBIES,
		["npc_zombie_torso"] = FACTION_ZOMBIES,
		["npc_zombine"] = FACTION_ZOMBIES,
		["monster_alien_grunt"] = FACTION_XEN_ARMY,
		["monster_alien_slave"] = FACTION_XEN_ARMY,
		["monster_human_assassin"] = FACTION_HECU,
		["monster_babycrab"] = FACTION_ZOMBIES,
		["monster_bullchicken"] = FACTION_XEN_WILDLIFE,
		["monster_cockroach"] = FACTION_ANIMALS,
		["monster_alien_controller"] = FACTION_XEN_ARMY,
		["monster_gargantua"] = FACTION_XEN_ARMY,
		["monster_bigmomma"] = FACTION_ZOMBIES,
		["monster_human_grunt"] = FACTION_HECU,
		["monster_headcrab"] = FACTION_ZOMBIES,
		["monster_houndeye"] = FACTION_XEN_WILDLIFE,
		["monster_nihilanth"] = FACTION_XEN_ARMY,
		["monster_scientist"] = FACTION_REBELS,
		["monster_barney"] = FACTION_REBELS,
		["monster_snark"] = FACTION_XEN_WILDLIFE,
		["monster_tentacle"] = FACTION_XEN_WILDLIFE,
		["monster_zombie"] = FACTION_ZOMBIES,
		["npc_apc_dropship"] = FACTION_COMBINE,
		["npc_elite_overwatch_dropship"] = FACTION_COMBINE,
		["npc_civil_protection_tier1_dropship"] = FACTION_COMBINE,
		["npc_civil_protection_tier2_dropship"] = FACTION_COMBINE,
		["npc_shotgunner_dropship"] = FACTION_COMBINE,
		["npc_overwatch_squad_tier1_dropship"] = FACTION_COMBINE,
		["npc_overwatch_squad_tier2_dropship"] = FACTION_COMBINE,
		["npc_overwatch_squad_tier3_dropship"] = FACTION_COMBINE,
		["npc_random_combine_dropship"] = FACTION_COMBINE,
		["npc_strider_dropship"] = FACTION_COMBINE
	}

	-- Getters/setters --

	function ENT:GetRelationship(ent, absolute)
		if not IsValid(ent) then return D_ER end
		if self == ent then return D_ER end
		local disp = self._DrGBaseRelationships[ent]
		if not absolute and self:IsIgnored(ent) then
			return D_NU
		else return disp or DEFAULT_DISP end
	end
	function ENT:GetPriority(ent)
		if not IsValid(ent) then return -1 end
		if self == ent then return -1 end
		return self._DrGBaseRelPriorities[ent] or DEFAULT_PRIO
	end
	function ENT:IsAlly(ent)
		return self:GetRelationship(ent) == D_LI
	end
	function ENT:IsEnemy(ent)
		return self:GetRelationship(ent) == D_HT
	end
	function ENT:IsAfraidOf(ent)
		return self:GetRelationship(ent) == D_FR
	end
	function ENT:IsHostile(ent)
		local disp = self:GetRelationship(ent)
		return disp == D_HT or disp == D_FR
	end
	function ENT:IsNeutral(ent)
		return self:GetRelationship(ent) == D_NU
	end

	function ENT:_SetRelationship(ent, disp)
		if not IsValid(ent) then return end
		if not IsValidDisp(disp) then return end
		local curr = self:GetRelationship(ent, true)
		if (cur ~= disp or disp == D_HT) and
		ent:IsNPC() then self:_UpdateNPCRelationship(ent, disp) end
		if curr == disp then return end
		if IsCachedDisp(disp) then
			self._DrGBaseRelationshipCaches[D_LI][ent] = nil
			self._DrGBaseRelationshipCaches[D_HT][ent] = nil
			self._DrGBaseRelationshipCaches[D_FR][ent] = nil
			self._DrGBaseRelationshipCaches[disp][ent] = true
			self._DrGBaseRelationshipCachesSpotted[D_LI][ent] = nil
			self._DrGBaseRelationshipCachesSpotted[D_HT][ent] = nil
			self._DrGBaseRelationshipCachesSpotted[D_FR][ent] = nil
			if self:HasSpotted(ent, true) then
				self._DrGBaseRelationshipCachesSpotted[disp][ent] = true
			end
			self._DrGBaseRelationships[ent] = disp
			ent:CallOnRemove("DrGBaseRemoveFromDrGNextbot"..self:GetCreationID().."RelationshipCache", function()
				if IsValid(self) then self._DrGBaseRelationshipCaches[disp][ent] = nil end
			end)
		elseif disp == D_NU then
			self._DrGBaseRelationshipCaches[D_LI][ent] = nil
			self._DrGBaseRelationshipCaches[D_HT][ent] = nil
			self._DrGBaseRelationshipCaches[D_FR][ent] = nil
			self._DrGBaseRelationshipCachesSpotted[D_LI][ent] = nil
			self._DrGBaseRelationshipCachesSpotted[D_HT][ent] = nil
			self._DrGBaseRelationshipCachesSpotted[D_FR][ent] = nil
			self._DrGBaseRelationships[ent] = DEFAULT_DISP
		end
		if self:GetEnemy() == ent and
		disp ~= D_HT and disp ~= D_FR then
			self:UpdateEnemy()
		end
		self:OnRelationshipChange(ent, curr, disp)
		if DebugRelationship:GetBool() then
			DrGBase.Print(tostring(self)..": ".."'"..tostring(ent).."' "..EnumToString(curr).." => "..EnumToString(disp)..".")
		end
		if ent:IsPlayer() then
			net.Start("DrGBaseNextbotPlayerRelationship")
			net.WriteEntity(self)
			net.WriteInt(disp, 4)
			net.Send(ent)
		end
	end
	function ENT:_SetPriority(ent, prio)
		if not IsValid(ent) then return end
		if not isnumber(prio) then return end
		self._DrGBaseRelPriorities[ent] = prio
	end

	net.DrG_DefineCallback("DrGBaseGetRelationship", function(nextbot, ent)
		if not IsValid(nextbot) or not IsValid(ent) then return D_ER, -1
		else return nextbot:GetRelationship(ent) end
	end)

	local NPC_STATES_IGNORED = {
		[NPC_STATE_PLAYDEAD] = true,
		[NPC_STATE_DEAD] = true
	}
	function ENT:IsIgnored(ent)
		if ent:IsPlayer() and not ent:Alive() then return true end
		if ent:IsPlayer() and GetConVar("ai_ignoreplayers"):GetBool() then return true end
		if ent:IsFlagSet(FL_NOTARGET) then return true end
		if ent.IsVJBaseSNPC and ent.VJ_NoTarget then return true end
		if ent.CPTBase_NPC and ent.UseNotarget then return true end
		if ent:IsNPC() and NPC_STATES_IGNORED[ent:GetNPCState()] then return true end
		if (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) and ent:Health() <= 0 then return true end
		if ent.IsDrGNextbot and (ent:IsDown() or ent:IsDead()) then return true end
		if self:ShouldIgnore(ent) then return true end
		return self._DrGBaseIgnoredEntities[ent] or false
	end
	function ENT:SetIgnored(ent, bool)
		self._DrGBaseIgnoredEntities[ent] = tobool(bool)
	end

	net.DrG_DefineCallback("DrGBaseIsIgnored", function(nextbot, ent)
		if not IsValid(nextbot) or not IsValid(ent) then return false
		else return nextbot:IsIgnored(ent) end
	end)

	function ENT:SetFrightening(frightening)
		local old = self:IsFrightening()
		if old == tobool(frightening) then return end
		self:SetNW2Bool("DrGBaseFrightening", frightening)
		if old ~= self:IsFrightening() then
			for i, ent in ipairs(ents.GetAll()) do
				if not ent:IsNPC() then continue end
				self:UpdateRelationshipWith(ent)
			end
		end
	end

	-- Functions --

	function ENT:GetDefaultRelationship()
		return self._DrGBaseDefaultRelationship, DEFAULT_PRIO
	end
	function ENT:SetDefaultRelationship(disp)
		self._DrGBaseDefaultRelationship = disp
		self:UpdateRelationships()
	end

	function ENT:_GetRelationshipDefiner(name, id)
		local rel = self._DrGBaseRelationshipDefiners[name][id]
		return rel.disp, rel.prio
	end
	function ENT:_SetRelationshipDefiner(name, id, disp, prio)
		if not IsValidDisp(disp) then return end
		self._DrGBaseRelationshipDefiners[name][id] = {
			disp = disp, prio = prio or DEFAULT_PRIO
		}
	end
	function ENT:_AddRelationshipDefiner(name, id, disp, prio)
		prio = prio or DEFAULT_PRIO
		local curr = self._DrGBaseRelationshipDefiners[name][id]
		if curr.prio > prio then return end
		self:_SetRelationshipDefiner(name, id, disp, prio)
	end

	-- Entity
	function ENT:GetEntityRelationship(ent)
		if not IsValid(ent) then return D_ER, -1 end
		return self:_GetRelationshipDefiner("entity", ent)
	end
	function ENT:SetEntityRelationship(ent, disp, prio)
		if not IsValid(ent) then return end
		local res = self:_SetRelationshipDefiner("entity", ent, disp, prio)
		self:UpdateRelationshipWith(ent)
		return res
	end
	function ENT:AddEntityRelationship(ent, disp, prio)
		if not IsValid(ent) then return end
		local res = self:_AddRelationshipDefiner("entity", ent, disp, prio)
		self:UpdateRelationshipWith(ent)
		return res
	end

	-- Class
	function ENT:GetClassRelationship(class)
		if not isstring(class) then return D_ER, -1 end
		class = string.lower(class)
		return self:_GetRelationshipDefiner("class", class)
	end
	function ENT:SetClassRelationship(class, disp, prio)
		if not isstring(class) then return end
		class = string.lower(class)
		local res = self:_SetRelationshipDefiner("class", class, disp, prio)
		self:UpdateRelationships()
		return res
	end
	function ENT:AddClassRelationship(class, disp, prio)
		if not isstring(class) then return end
		class = string.lower(class)
		local res = self:_AddRelationshipDefiner("class", class, disp, prio)
		self:UpdateRelationships()
		return res
	end

	function ENT:GetSelfClassRelationship()
		return self:GetClassRelationship(self:GetClass())
	end
	function ENT:SetSelfClassRelationship(disp, prio)
		return self:SetClassRelationship(self:GetClass(), disp, prio)
	end
	function ENT:AddSelfClassRelationship(disp, prio)
		return self:AddClassRelationship(self:GetClass(), disp, prio)
	end

	function ENT:GetPlayersRelationship()
		return self:GetClassRelationship("player")
	end
	function ENT:SetPlayersRelationship(disp, prio)
		return self:SetClassRelationship("player", disp, prio)
	end
	function ENT:AddPlayersRelationship(disp, prio)
		return self:AddClassRelationship("player", disp, prio)
	end

	-- Models
	function ENT:GetModelRelationship(model)
		if not isstring(model) then return D_ER, -1 end
		model = string.lower(model)
		return self:_GetRelationshipDefiner("model", model)
	end
	function ENT:SetModelRelationship(model, disp, prio)
		if not isstring(model) then return end
		model = string.lower(model)
		local res = self:_SetRelationshipDefiner("model", model, disp, prio)
		self:UpdateRelationships()
		return res
	end
	function ENT:AddModelRelationship(model, disp, prio)
		if not isstring(model) then return end
		model = string.lower(model)
		local res = self:_AddRelationshipDefiner("model", model, disp, prio)
		self:UpdateRelationships()
		return res
	end

	function ENT:GetSelfModelRelationship()
		return self:GetModelRelationship(self:GetModel())
	end
	function ENT:SetSelfModelRelationship(disp, prio)
		return self:SetModelRelationship(self:GetModel(), disp, prio)
	end
	function ENT:AddSelfModelRelationship(disp, prio)
		return self:AddModelRelationship(self:GetModel(), disp, prio)
	end

	-- Factions
	function ENT:GetFactionRelationship(faction)
		if not isstring(faction) then return D_ER, -1 end
		faction = string.upper(faction)
		return self:_GetRelationshipDefiner("faction", faction)
	end
	function ENT:SetFactionRelationship(faction, disp, prio)
		if not isstring(faction) then return end
		faction = string.upper(faction)
		local res = self:_SetRelationshipDefiner("faction", faction, disp, prio)
		self:UpdateRelationships()
		return res
	end
	function ENT:AddFactionRelationship(faction, disp, prio)
		if not isstring(faction) then return end
		faction = string.upper(faction)
		local res = self:_AddRelationshipDefiner("faction", faction, disp, prio)
		self:UpdateRelationships()
		return res
	end

	function ENT:JoinFaction(faction)
		if self:IsInFaction(faction) then return end
		self._DrGBaseFactions[string.upper(faction)] = true
		self:AddFactionRelationship(faction, D_LI)
		for i, nextbot in ipairs(DrGBase.GetNextbots()) do
			if nextbot == self then continue end
			nextbot:UpdateRelationshipWith(self)
		end
	end
	function ENT:JoinFactions(factions)
		for i, faction in ipairs(factions) do self:JoinFaction(faction) end
	end

	function ENT:LeaveFaction(faction)
		if not self:IsInFaction(faction) then return end
		self._DrGBaseFactions[string.upper(faction)] = nil
		local disp, prio = self:GetFactionRelationship(faction)
		if disp == D_LI and prio == DEFAULT_PRIO then
			self:SetFactionRelationship(faction, D_NU)
		end
		for i, nextbot in ipairs(DrGBase.GetNextbots()) do
			if nextbot == self then continue end
			nextbot:UpdateRelationshipWith(self)
		end
	end
	function ENT:LeaveFactions(factions)
		for i, faction in ipairs(factions) do self:LeaveFaction(faction) end
	end
	function ENT:LeaveAllFactions()
		return self:LeaveFactions(self:GetFactions())
	end

	function ENT:IsInFaction(faction)
		return self._DrGBaseFactions[string.upper(faction)] or false
	end
	function ENT:GetFactions()
		local factions = {}
		for faction, joined in pairs(self._DrGBaseFactions) do
			if not joined then return end
			table.insert(factions, faction)
		end
		return factions
	end

	-- Teams
	function ENT:SetTeam(team)
		local current = self:Team()
		self:SetNW2Int("DrGBaseTeam", team)
		if team ~= current then self:UpdateRelationships() end
	end

	-- Update
	function ENT:UpdateRelationships()
		if not self._DrGBaseRelationshipReady then return end
		for i, ent in ipairs(ents.GetAll()) do
			self:UpdateRelationshipWith(ent)
		end
	end
	function ENT:UpdateRelationshipWith(ent)
		if not self._DrGBaseRelationshipReady then return end
		if not IsValid(ent) then return end
		if ent == self then return end
		if (ent:IsPlayer() or ent.IsDrGNextbot) and
		ent:Team() == self:Team() and self:Team() ~= 0 then
			self:_SetRelationship(ent, D_LI)
			self:_SetPriority(ent, DEFAULT_PRIO)
		else
			local default, defprio
			if not DrGBase.IsTarget(ent) then
				default = DEFAULT_DISP
				defprio = DEFAULT_PRIO
			else default, defprio = self:GetDefaultRelationship() end
			local entdisp, entprio = self:GetEntityRelationship(ent)
			local classdisp, classprio = self:GetClassRelationship(ent:GetClass())
			local modeldisp, modelprio = self:GetModelRelationship(ent:GetModel())
			local customdisp, customprio = self:CustomRelationship(ent)
			local relationships = {HighestRelationship({
				{disp = default, prio = defprio}, {disp = entdisp, prio = entprio},
				{disp = classdisp, prio = classprio}, {disp = modeldisp, prio = modelprio},
				{disp = customdisp or DEFAULT_DISP, prio = customprio or DEFAULT_PRIO}
			})}
			for faction, relationship in pairs(self._DrGBaseRelationshipDefiners["faction"]) do
				if relationship.disp == D_ER or relationship.prio < relationships[1].prio then continue end
				if ent:IsPlayer() then
					if ent:DrG_IsInFaction(faction) then table.insert(relationships, relationship) end
				elseif ent.IsDrGNextbot then
					if ent:IsInFaction(faction) then table.insert(relationships, relationship) end
				elseif ent:DrG_IsSanic() then
					if faction == FACTION_SANIC then table.insert(relationships, relationship) end
				elseif ent.IsVJBaseSNPC then
					for i, class in ipairs(ent.VJ_NPC_Class) do
						if string.upper(class) ~= faction then continue end
						table.insert(relationships, relationship)
						break
					end
				elseif ent.CPTBase_NPC or ent.IV04NextBot then
					if string.upper(ent.Faction) == faction then table.insert(relationships, relationship) end
				else
					local def = DEFAULT_FACTIONS[ent:GetClass()]
					if def == faction then table.insert(relationships, relationship) end
				end
			end
			local relationship = HighestRelationship(relationships)
			self:_SetRelationship(ent, relationship.disp)
			self:_SetPriority(ent, relationship.prio)
		end
	end

	-- Iterators
	local function NextCachedEntity(self, cache, previous, spotted)
		local ent = next(cache, previous)
		if ent == nil then return nil
		elseif not IsValid(ent) or
		self:GetRelationship(ent) == D_NU or
		(spotted and not self:HasSpotted(ent)) then
			return NextCachedEntity(self, cache, ent, spotted)
		else return ent end
	end
	local function NextNeutralEntity(self, entities, j, spotted)
		local i = j+1
		local ent = entities[i]
		if ent == nil then return i, nil
		elseif not IsValid(ent) or
		self:GetRelationship(ent) ~= D_NU or
		(spotted and not self:HasSpotted(ent)) then
			return NextNeutralEntity(self, entities, i, spotted)
		else return i, ent end
	end
	function ENT:EntityIterator(disp, spotted)
		if istable(disp) then
			local i = 1
			local iterators = {}
			for i, dis in ipairs(disp) do
				table.insert(iterators, self:EntityIterator(dis, spotted))
			end
			return function(inv, previous)
				local ent = iterators[i](nil, previous)
				if IsValid(ent) then return ent end
				for j = i+1, #iterators do
					i = j
					ent = iterators[i](nil, nil)
					if IsValid(ent) then return ent end
				end
			end
		elseif IsCachedDisp(disp) then
			local cache = (spotted and not self:IsOmniscient()) and self._DrGBaseRelationshipCachesSpotted[disp] or self._DrGBaseRelationshipCaches[disp]
			return function(inv, previous)
				return NextCachedEntity(self, cache, previous, spotted)
			end
		elseif disp == D_NU then
			local i = 0
			local entities = ents.GetAll()
			return function()
				local j, ent = NextNeutralEntity(self, entities, i, spotted)
				i = j
				return ent
			end
		else return function() end end
	end
	function ENT:AllyIterator(spotted)
		return self:EntityIterator(D_LI, spotted)
	end
	function ENT:EnemyIterator(spotted)
		return self:EntityIterator(D_HT, spotted)
	end
	function ENT:AfraidOfIterator(spotted)
		return self:EntityIterator(D_FR, spotted)
	end
	function ENT:HostileIterator(spotted)
		return self:EntityIterator({D_HT, D_FR}, spotted)
	end
	function ENT:NeutralIterator(spotted)
		return self:EntityIterator(D_NU, spotted)
	end

	-- Get entities
	function ENT:GetEntities(disp, spotted)
		local entities = {}
		for ent in self:EntityIterator(disp, spotted) do
			table.insert(entities, ent)
		end
		return entities
	end
	function ENT:GetAllies(spotted)
		return self:GetEntities(D_LI, spotted)
	end
	function ENT:GetEnemies(spotted)
		return self:GetEntities(D_HT, spotted)
	end
	function ENT:GetAfraidOf(spotted)
		return self:GetEntities(D_FR, spotted)
	end
	function ENT:GetHostiles(spotted)
		return self:GetEntities({D_HT, D_FR}, spotted)
	end
	function ENT:GetNeutrals(spotted)
		return self:GetEntities(D_NU, spotted)
	end

	-- Number of entities left
	function ENT:EntitiesLeft(disp, spotted)
		return #self:GetEntities(disp, spotted)
	end
	function ENT:AlliesLeft(spotted)
		return self:EntitiesLeft(D_LI, spotted)
	end
	function ENT:EnemiesLeft(spotted)
		return self:EntitiesLeft(D_HT, spotted)
	end
	function ENT:AfraidOfLeft(spotted)
		return self:Entitiesleft(D_FR, spotted)
	end
	function ENT:HostilesLeft(spotted)
		return self:Entitiesleft({D_HT, D_FR}, spotted)
	end
	function ENT:NeutralsLeft(spotted)
		return self:EntitiesLeft(D_NU, spotted)
	end

	-- Get closest entity
	function ENT:GetClosestEntity(disp, spotted)
		local closest = NULL
		for ent in self:EntityIterator(disp, spotted) do
			if not IsValid(closest) or
			self:GetRangeSquaredTo(ent) < self:GetRangeSquaredTo(closest) then
				closest = ent
			end
		end
		return closest
	end
	function ENT:GetClosestAlly(spotted)
		return self:GetClosestEntity(D_LI, spotted)
	end
	function ENT:GetClosestEnemy(spotted)
		return self:GetClosestEntity(D_HT, spotted)
	end
	function ENT:GetClosestAfraidOf(spotted)
		return self:GetClosestEntity(D_FR, spotted)
	end
	function ENT:GetClosestHostile(spotted)
		return self:GetClosestEntity({D_HT, D_FR}, spotted)
	end
	function ENT:GetClosestNeutral(spotted)
		return self:GetClosestEntity(D_NU, spotted)
	end

	-- Hooks --

	function ENT:CustomRelationship() end
	function ENT:ShouldIgnore() end
	function ENT:OnRelationshipChange() end

	-- Handlers --

	function ENT:_UpdateNPCRelationship(ent, relationship)
		if not IsValid(ent) or not ent:IsNPC() or not ent.DrG_SetRelationship then return end
		if relationship == D_FR then
			ent:DrG_SetRelationship(self, D_HT)
		elseif relationship == D_HT and self:IsFrightening() then
			ent:DrG_SetRelationship(self, D_FR)
		else ent:DrG_SetRelationship(self, relationship) end
	end

	local function CPTBaseValidTarget(ent, nextbot)
		local disp = ent:Disposition(nextbot)
		if disp ~= D_HT and disp ~= D_FR then return false end
		if nextbot:IsFlagSet(FL_NOTARGET) then return false end
		if nextbot:IsDead() or nextbot:IsDown() then return false end
		return true
	end
	local function CPTBasePickClosestEnemy(ent, nextbots)
		local enemy
		for i, nextbot in ipairs(nextbots) do
			if not ent:Visible(nextbot) then continue end
			if not ent:CanSeeEntities(nextbot) then continue end
			if not ent:FindInCone(nextbot, ent.ViewAngle) then continue end
			if not ent:CanSetAsEnemy(nextbot) then continue end
			if not CPTBaseValidTarget(ent, nextbot) then continue end
			if not IsValid(enemy) or ent:GetPos():DistToSqr(nextbot:GetPos()) < ent:GetPos():DistToSqr(enemy:GetPos()) then
				enemy = nextbot
			end
		end
		return enemy
	end
	hook.Add("OnEntityCreated", "DrGBaseNextbotRelationshipsInit", function(ent)
		ent:DrG_Timer(0, function()
			if ent.IsVJBaseSNPC and isfunction(ent.DoHardEntityCheck) then
				local old_DoHardEntityCheck = ent.DoHardEntityCheck
				ent.DoHardEntityCheck = function(ent, tbl)
					local entities = old_DoHardEntityCheck(ent, tbl)
					return table.Merge(entities, DrGBase.GetNextbots())
				end
			elseif ent.CPTBase_NPC then
				local old_LocateEnemies = ent.LocateEnemies
				ent.LocateEnemies = function(ent)
					local enemy = old_LocateEnemies(ent)
					local nextbots = DrGBase.GetNextbots()
					if #nextbots == 0 then return enemy end
					local nextbot = CPTBasePickClosestEnemy(ent, nextbots)
					if not IsValid(nextbot) then return enemy
					elseif IsValid(enemy) and
					ent:GetPos():DistToSqr(enemy:GetPos()) < ent:GetPos():DistToSqr(nextbot:GetPos()) then
						return enemy
					elseif ent:GetPos():DistToSqr(nextbot:GetPos()) <= ent.FindEntitiesDistance^2 then
						return nextbot
					end
				end
				local old_FindAllEnemies = ent.FindAllEnemies
				ent.FindAllEnemies = function(ent)
					local enemy = old_FindAllEnemies(ent)
					local nextbots = DrGBase.GetNextbots()
					if #nextbots == 0 then return enemy end
					local nextbot = table.DrG_Fetch(nextbots, function(nb1, nb2)
						if not CPTBaseValidTarget(ent, nb1) and CPTBaseValidTarget(ent, nb2) then return false end
						if CPTBaseValidTarget(ent, nb1) and not CPTBaseValidTarget(ent, nb2) then return true end
						return ent:GetPos():DistToSqr(nb1:GetPos()) < ent:GetPos():DistToSqr(nb2:GetPos())
					end)
					if not CPTBaseValidTarget(ent, nextbot) then return enemy
					elseif IsValid(enemy) and
					ent:GetPos():DistToSqr(enemy:GetPos()) < ent:GetPos():DistToSqr(nextbot:GetPos()) then
						return enemy
					else return nextbot end
				end
			end
			for i, nextbot in ipairs(DrGBase.GetNextbots()) do
				if ent == nextbot then continue end
				nextbot:UpdateRelationshipWith(ent)
			end
		end)
	end)

	-- Aliases --

	function ENT:Disposition(ent)
		return self:GetRelationship(ent)
	end
	function ENT:AddRelationship(str)
		local split = string.Explode("[%s]+", str, true)
		if #split ~= 3 then return end
		local class = split[1]
		local relationship = split[2]
		if relationship == "D_ER" then relationship = D_ER
		elseif relationship == "D_HT" then relationship = D_HT
		elseif relationship == "D_FR" then relationship = D_FR
		elseif relationship == "D_LI" then relationship = D_LI
		elseif relationship == "D_NU" then relationship = D_NU
		else return end
		local val = tonumber(split[3])
		if val ~= val then return end
		self:AddClassRelationship(class, relationship, val)
	end

else

	-- Getters/setters --

	function ENT:LocalPlayerRelationship()
		return self._DrGBaseLocalPlayerRelationship or DEFAULT_DISP
	end
	net.Receive("DrGBaseNextbotPlayerRelationship", function()
		local nextbot = net.ReadEntity()
		local disp = net.ReadInt(4)
		if IsValid(nextbot) then
			nextbot._DrGBaseLocalPlayerRelationship = disp
		end
	end)

	function ENT:GetRelationship(ent, callback)
		if IsValid(ent) then
			return self:NetCallback("DrGBaseGetRelationship", callback, ent)
		elseif isfunction(callback) then callback(self, D_ER) end
	end
	function ENT:IsAlly(ent, callback)
		return self:GetRelationship(ent, function(self, disp)
			callback(self, disp == D_LI)
		end)
	end
	function ENT:IsEnemy(ent, callback)
		return self:GetRelationship(ent, function(self, disp)
			callback(self, disp == D_HT)
		end)
	end
	function ENT:IsAfraidOf(ent, callback)
		return self:GetRelationship(ent, function(self, disp)
			callback(self, disp == D_FR)
		end)
	end
	function ENT:IsHostile(ent, callback)
		return self:GetRelationship(ent, function(self, disp)
			callback(self, disp == D_HT or disp == D_FR)
		end)
	end
	function ENT:IsNeutral(ent, callback)
		return self:GetRelationship(ent, function(self, disp)
			callback(self, disp == D_NU)
		end)
	end

	function ENT:IsIgnored(ent, callback)
		if IsValid(ent) then
			return self:NetCallback("DrGBaseIsIgnored", callback, ent)
		elseif isfunction(callback) then callback(self, false) end
	end

	-- Functions --

	-- Hooks --

	-- Handlers --

end

--PATH addons/sl_util_wallet/lua/entities/ez_wallet_spawned_money/cl_init.lua:

include("shared.lua")

local color_red = Color(140, 0, 0, 100)
local color_white = color_white

function ENT:Draw()
    self:DrawModel()

    -- Do not draw labels when a different model is used.
    -- If you want a different model with labels, make your own money entity and use GM.Config.MoneyClass.
    -- if self:GetModel() != "models/props/cs_assault/money.mdl" then return end

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

--PATH lua/entities/fish4/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Rainbow Trout"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A raw fish"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/fishrainbow.mdl")
	
end
--PATH lua/entities/fruitpumpkin/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pumpkin"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pumpkin01.mdl")
	
end
--PATH lua/entities/fruitwatermelonhalf/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Watermelon (half)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/watermelon_half.mdl")
	
end
--PATH lua/entities/fruitwatermelonslice/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Watermelon (Slice)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/watermelon_slice.mdl")
	
end
--PATH lua/entities/honeyjar/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Honey"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/honey_jar.mdl")
	
end
--PATH lua/entities/hotdog/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Hotdog"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Half a hotdog"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/hotdog.mdl")
	
end
--PATH lua/entities/icecream2b/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream (Vanilla)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream_open2.mdl")
	
end
--PATH lua/entities/icecream3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream (Strawberry)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream3.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/jet_item_sl/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Item"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "ItemName" )

    self:NetworkVar( "String", 1, "ItemID" )

    self:NetworkVar( "Bool", 0, "ItemPanel" )

end
--PATH lua/entities/kindersurprise3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Kinder Surprise (Half)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "An unwrapped halved Kinder Surprise"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/KinderSurprisehalf.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/money_printer/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
    self:initVars()
    if not self.DisplayName or self.DisplayName == "" then
        self.DisplayName = DarkRP.getPhrase("money_printer")
    end
end

local camStart3D2D = cam.Start3D2D
local camEnd3D2D = cam.End3D2D
local drawWordBox = draw.WordBox
local IsValid = IsValid

local color_red = Color(140,0,0,100)
local color_white = color_white

function ENT:Draw()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    local owner = self:Getowning_ent()
    owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

    surface.SetFont("HUDNumber5")
    local text = self.DisplayName
    local TextWidth = surface.GetTextSize(text)
    local TextWidth2 = surface.GetTextSize(owner)

    Ang:RotateAroundAxis(Ang:Up(), 90)

    camStart3D2D(Pos + Ang:Up() * 11.5, Ang, 0.11)
        drawWordBox(2, -TextWidth * 0.5, -30, text, "HUDNumber5", color_red, color_white)
        drawWordBox(2, -TextWidth2 * 0.5, 18, owner, "HUDNumber5", color_red, color_white)
    camEnd3D2D()
end

function ENT:Think()
end

--PATH addons/mc_quests/lua/entities/mqs_npc/shared.lua:
ENT.Type = "ai"
ENT.Base = "base_anim"
ENT.PrintName = "MQS Quest NPC"
ENT.Author = "Mactavish"
ENT.Spawnable = false
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Namer")
	self:NetworkVar("Int", 1, "UID")
end
--PATH addons/sl_main_system/lua/entities/npc_werewolf.lua:
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
ENT.PrintName = "Loup Garou"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_werewolfmob.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 2277
ENT.money = 300000
ENT.Damage = 200
ENT.SpawnHealth = 10000

ENT.WalkSpeed = 100
ENT.RunSpeed = 220

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
					if enemy:GetPos():Distance(self:GetPos()) < 375 then
						enemy:TakeDamage(self.Damage, self, self)    
						timer.Simple(0.001, function()
							if enemy:Health() <= 0 then
								local currentXP = enemy:getDarkRPVar("xp") or 0
								-- Calcule 50% de l'XP
								local xpToRemove = currentXP * 0.5
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

--PATH addons/pcasino/lua/entities/pcasino_chair/cl_init.lua:
include("shared.lua")

function ENT:PostData()
end

--PATH addons/pcasino/lua/entities/pcasino_sign_interior_standing/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Sign Interior Standing"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false

PerfectCasino.Core.RegisterEntity("pcasino_sign_interior_standing", {
	-- General data
	general = {
		text = {d = "Welcome to the Cool Casino. We hope you enjoy your stay!", t = "string"} -- The text to show
	}
},
"models/freeman/owain_interiorsign_standing.mdl")
--PATH addons/pcasino/lua/entities/pcasino_sign_stand/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.letters = {}
end

function ENT:PostData()
	if not self.hasInitialized then
		self:Initialize()
	end
	
	self.data.general.text = string.sub(self.data.general.text, 1, 7)
	local letterMap = PerfectCasino.Core.Letter

	-- Right side
		-- Letter calculations
		local startPoint = (self:GetRight() * 25) + (self:GetForward() * 13.5) + (self:GetUp() * 9)
		local curLength = vector_origin
		local right = self:GetRight()
	
		for k, v in ipairs(string.Split(string.lower(self.data.general.text), "")) do
			if not letterMap[v] then -- It's either a space or a character we don't support
				curLength = curLength + (self:GetRight() * 5)
				continue
			end
	
			-- Create the letter
			local letter = ClientsideModel("models/freeman/owain_casino_alphabet.mdl")
			table.insert(self.letters, letter)
			letter:SetParent(self)
			curLength = curLength + ((self:GetRight()) * (letterMap[v].w*2))
			letter:SetPos(self:GetPos() + startPoint - curLength + ((self:GetRight()) * (letterMap[v].w)))
			letter:SetAngles(self:GetAngles())
			letter:SetBodygroup(1, letterMap[v].b)
		end
	-- Left side
		-- Letter calculations
		local startPoint = (self:GetRight() * 25) + (self:GetForward() * -13.5) + (self:GetUp() * 9)
		local curLength = vector_origin
		local right = self:GetRight()
	
		for k, v in ipairs(table.Reverse(string.Split(string.lower(self.data.general.text), ""))) do
			if not letterMap[v] then -- It's either a space or a character we don't support
				curLength = curLength + (self:GetRight() * 5)
				continue
			end
	
			-- Create the letter
			local letter = ClientsideModel("models/freeman/owain_casino_alphabet.mdl")
			table.insert(self.letters, letter)
			letter:SetParent(self)
			curLength = curLength + ((self:GetRight()) * (letterMap[v].w*2))
			letter:SetPos(self:GetPos() + startPoint - curLength + ((self:GetRight()) * (letterMap[v].w)))
			local ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Up(), 180)
			letter:SetAngles(ang)
			letter:SetBodygroup(1, letterMap[v].b)
		end
end

function ENT:OnRemove()
	-- Clear the board of last rounds best
	for k, v in pairs(self.letters) do
		if not IsValid(v) then continue end

		v:Remove()
	end
end

function ENT:Draw()
	self:DrawModel()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 1000000 then return end

	-- We can piggyback off the distance check to only request the entities data when it's needed :D
	if (not self.data) and (not PerfectCasino.Cooldown.Check(self:EntIndex(), 5)) then
		PerfectCasino.Core.RequestConfigData(self)
		return
	end
end
--PATH lua/entities/pfx1_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [v_3]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]groundflame1"
--PATH lua/entities/pfx1_05.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large Ground Burst"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]groundflame"
--PATH lua/entities/pfx2_06.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Dripping blood"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]blood_leak"
--PATH lua/entities/pfx4_00_s~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Basic Jet [Smokeless]"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_f_s*"
--PATH lua/entities/pfx4_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Blue Jet"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_b"

--PATH lua/entities/pfx8_04.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large Core"
ENT.Category         = "PPE: Magic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[8]core_1"
--PATH lua/entities/pizza2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pizza"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pizzaB.mdl")
	
end
--PATH lua/entities/point_drg_ragdoll.lua:
ENT.Type = "point"
ENT.Base = "base_entity"
ENT.PrintName = "Ragdoll Attachment"
ENT.Category = "DrGBase"
function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "Ragdoll")
	self:NetworkVar("Int", 0, "Bone")
end
if SERVER then
	AddCSLuaFile()
	function ENT:Initialize()
		local ragdoll = self:GetRagdoll()
		if not IsValid(ragdoll) then self:Remove() end
	end
	function ENT:Think()
		local ragdoll = self:GetRagdoll()
		if IsValid(ragdoll) then
			local bone = ragdoll:GetPhysicsObjectNum(ragdoll:TranslateBoneToPhysBone(self:GetBone()))
			if bone then
				bone:SetAngleDragCoefficient(100000)
				bone:SetPos(self:GetPos())
			end
		else self:Remove() end
		self:NextThink(CurTime() + engine.TickInterval())
		return true
	end
else
	local AdjustRagdollsAttachs = CreateClientConVar("drgbase_adjust_ragdoll_attachments", "0")
	function ENT:Think()
		if not AdjustRagdollsAttachs:GetBool() then return end
		local ragdoll = self:GetRagdoll()
		if IsValid(ragdoll) then
			local pos = ragdoll:GetBonePosition(self:GetBone())
			local offset = pos:DrG_Direction(self:GetPos())
			for boneId = 0, (ragdoll:GetBoneCount()-1) do
				if ragdoll:GetBoneName(boneId) == "__INVALIDBONE__" then continue end
				local bonePos, boneAng = ragdoll:GetBonePosition(boneId)
				ragdoll:SetBonePosition(boneId, bonePos+offset, boneAng)
			end
		end
	end
end

--PATH lua/entities/sent_catmullrom_camera/shared.lua:
ENT.Type = "anim"
-- We're the root controller, we'll be handling all the real camera stuff (the interpolation will be clientside, but the server will periodicly move the ViewEntity to update the client's PVS)
ENT.PrintName		= "Cubic Cameras"
ENT.Author			= "Olivier 'LuaPineapple' Hamel"
ENT.Contact			= "evilpineapple@cox.net"
ENT.Purpose			= "For the lulz."
ENT.Instructions	= "Try the GMod Tower servers, but be sure to check out Duke Nukem: Forever first!"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

function ENT:InitController()
	self.CatmullRomController = CatmullRomCams.SH.Controller:New(self)
end

function ENT:TrackEntity(ent, lpos)
	if not (ent and lpos and ent.IsValid and ent:IsValid()) then return end
	
	self.TrackEnt = ent
	
	return self:SetAngles(((ent:IsPlayer() and (ent:LocalToWorld(lpos) + Vector(0, 0, 54)) or ent:LocalToWorld(lpos)) - self:GetPos()):Angle())
end 

function ENT:Toggle(ply)
	if ply:GetNWEntity("UnderControlCatmullRomCamera") ~= NULL then
		if ply:GetNWEntity("UnderControlCatmullRomCamera") == self then
			self:Off(ply)
		end
	else
		self:On(ply)
	end
end

function ENT:On(ply)
	if SERVER and self:GetNWBool("IsMasterController") and (ply:GetNWEntity("UnderControlCatmullRomCamera") == NULL) then
		print("toggle on: ", ply)
		
		self:GetPointData()
		
		if #self.CatmullRomController.PointsList < 4 then
			return print("not enough points: ", #self.CatmullRomController.PointsList)
		end
		
		ply:SetNWEntity("UnderControlCatmullRomCamera", self)
		
		self:GetPointData()
		--self.CatmullRomController:CalcEntireSpline(self.VecList)
		
		self.ViewPointEnt = ents.Create("sent_catmullrom_camera_viewpnt")
		self.ViewPointEnt:SetPos(self.CatmullRomController.PointsList[2])
		self.ViewPointEnt:SetAngles(self:GetAngles())
		self.ViewPointEnt:Spawn()
		
		self.ViewPointEnt.Master               = self
		self.ViewPointEnt.CatmullRomController = self.CatmullRomController
		
		self.ViewPointEnt.FaceTravelDir = self.FaceTravelDir
		self.ViewPointEnt.BankOnTurn    = self.BankOnTurn
		
		self.ViewPointEnt.DeltaBankConstant = self.DeltaBankConstant or 0
		
		self.ViewPointEnt:SetPlayers(ply)
		
		self.Playing = true
		self:SetNWBool("IsPlaying", true)
		
		self.PlyVictim = ply
		
		self:OnChangeSegment(2)
	end
end

function ENT:Off(ply)
	if self:GetNWBool("IsMasterController") and (ply:GetNWEntity("UnderControlCatmullRomCamera") == self) then
		ply:SetNWEntity("UnderControlCatmullRomCamera", NULL)
		print("toggle off: ", ply)
		if self.ViewPointEnt and self.ViewPointEnt:IsValid() then
			self.ViewPointEnt:Remove()
		end
		
		self.Playing = false
		self:SetNWBool("IsPlaying", false)
	end
end

function ENT:End()
	return self:Off(self.PlyVictim)
end

function ENT:SetPlayer(ply)
	return self:SetNetworkedEntity("ControllingPlayer", ply)
end

function ENT:RequestSaveData()
	local tbl = {}
	
	tbl.Duration = (self:GetNWFloat("Duration") > 0) and self:GetNWFloat("Duration") or 2
	
	if self:GetNWBool("IsMasterController") then
		-- ?
	else -- Because there's no point in saving key trigger or map io data, even if there is some, for the controller
		tbl.MapIO          = self.MapIO
		tbl.KeyTriggerData = self.OnNodeTriggerNumPadKey
	end
	
	tbl.FaceTravelDir = self.FaceTravelDir
	
	tbl.EnableRoll = self.EnableRoll
	tbl.Roll       = self.Roll
	
	tbl.SmartLookEnabled      = self.SmartLookEnabled
	tbl.SmartLookRange        = self.SmartLookRange
	tbl.SmartLookPerc         = self.SmartLookPerc
	tbl.SmartLookTargetFilter = self.SmartLookTargetFilter
	tbl.SmartLookTraceFilter  = self.SmartLookTraceFilter
	tbl.SmartLookClosest      = self.SmartLookClosest
	
	tbl.BankOnTurn     = self.BankOnTurn
	tbl.DeltaBankMax   = self.DeltaBankMax
	tbl.DeltaBankMulti = self.DeltaBankMulti
	
	tbl.HitchcockEffect = self.HitchcockEffect
	
	tbl.Zoom = self.Zoom
	
	tbl.UndoData = self.UndoData
	
	tbl.ChildCamera = self:GetNWEntity("ChildCamera"):IsValid() and self:GetNWEntity("ChildCamera"):EntIndex() or nil
	
	return tbl
end

function ENT:ApplySaveData(ply, plyID, CreatedEntities, CatmullRomCamsDupData)
	if not CreatedEntities.EntityList then return self:Remove() end
	
	local tbl = CatmullRomCamsDupData
	
	self:SetPlayer(ply)
	
	self:SetNWFloat("Duration", (tbl.Duration > 0) and tbl.Duration or nil)
	
	self.FaceTravelDir = tbl.FaceTravelDir
	
	self.EnableRoll = tbl.EnableRoll
	self.Roll       = tbl.Roll
	
	self.SmartLookEnabled      = tbl.SmartLookEnabled
	self.SmartLookRange        = tbl.SmartLookRange
	self.SmartLookPerc         = tbl.SmartLookPerc
	self.SmartLookTargetFilter = tbl.SmartLookTargetFilter
	self.SmartLookTraceFilter  = tbl.SmartLookTraceFilter
	self.SmartLookClosest      = tbl.SmartLookClosest
	
	self.BankOnTurn     = tbl.BankOnTurn
	self.DeltaBankMax   = tbl.DeltaBankMax
	self.DeltaBankMulti = tbl.DeltaBankMulti
	
	self.HitchcockEffect      = tbl.HitchcockEffect
	
	self:SetZoom(tbl.Zoom)
	
	self.UndoData = tbl.UndoData
	
	CatmullRomCams.Tracks[plyID]                    = CatmullRomCams.Tracks[plyID]                    or {}
	CatmullRomCams.Tracks[plyID][self.UndoData.Key] = CatmullRomCams.Tracks[plyID][self.UndoData.Key] or {}
	
	if CatmullRomCams.Tracks[plyID][self.UndoData.Key][self.UndoData.TrackIndex] and CatmullRomCams.Tracks[plyID][self.UndoData.Key][self.UndoData.TrackIndex]:IsValid() then
		CatmullRomCams.Tracks[plyID][self.UndoData.Key][self.UndoData.TrackIndex]:Remove()
		CatmullRomCams.Tracks[plyID][self.UndoData.Key][self.UndoData.TrackIndex] = nil
	end
	
	CatmullRomCams.Tracks[plyID][self.UndoData.Key][self.UndoData.TrackIndex] = self
	
	if tbl.UndoData.TrackIndex == 1 then
		self:SetKey(self.UndoData.Key)
		
		self:SetNWBool("IsMasterController", true)
		self:SetNWEntity("ControllingPlayer", ply)
		
		numpad.OnDown(ply, self.Key, "CatmullRomCamera_Toggle", self)
		
		for k, v in pairs(CatmullRomCams.Tracks[plyID][self.UndoData.Key]) do
			v:SetNWEntity("MasterController", self)
			
			--print(v, "'s controller set to ", CatmullRomCams.Tracks[plyID][self.UndoData.Key][1])
		end
	else -- Because there's no point in saving key trigger or map io, even if there is some, for the controller
		self.MapIO          = tbl.MapIO
		self.KeyTriggerData = tbl.OnNodeTriggerNumPadKey
		
		if CatmullRomCams.Tracks[plyID][self.UndoData.Key][1] and CatmullRomCams.Tracks[plyID][self.UndoData.Key][1]:IsValid() then
			self:SetNWEntity("MasterController", CatmullRomCams.Tracks[plyID][self.UndoData.Key][1])
			
			--print("Set controller to ", CatmullRomCams.Tracks[plyID][self.UndoData.Key][1])
		end
	end
	
	local child = CreatedEntities[CatmullRomCamsDupData.ChildCamera]
	
	if (not (child and child:IsValid())) and (not CreatedEntities.EntityList[CatmullRomCamsDupData.ChildCamera]) then
		child = ents.GetByIndex(CatmullRomCamsDupData.ChildCamera)
	end
	
	if child and child:IsValid() then
		self:DeleteOnRemove(child) -- Because we don't want to have broken chains let's daisy chain them to self destruct
		
		self:SetNWEntity("ChildCamera", child)
	end
	
	--return self:InitController()
end

function ENT:SetTracking(ent, LPos)
	if ent and ent.IsValid and ent:IsValid() then
		self:SetMoveType(MOVETYPE_NONE)
		self:SetSolid(SOLID_BBOX)
	else
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
	end
	
	self:SetNetworkedVector("TrackEntLPos", LPos)
	self:SetNetworkedEntity("TrackEnt",     ent)
	
	return self:NextThink(CurTime())
end

function ENT:SetBankOnTurn(val)
	self.BankOnTurn = val
end

function ENT:SetBankDeltaMax(val)
	self.DeltaBankMax = val
end

function ENT:SetBankMultiplier(val)
	self.DeltaBankMulti = val
end

function ENT:SetFaceTravelDir(val)
	self.FaceTravelDir = val
end

function ENT:SetKey(key)
	self.Key = key
	
	self:SetNWInt("NumPadKey", key)
end

function ENT:SetSmartLook(bool)
	self.SmartLookEnabled = bool
end

function ENT:SetSmartLookPerc(val)
	self.SmartLookPerc = math.Clamp(val, .01, 1)
end

function ENT:SetSmartLookRange(val)
	self.SmartLookRange = math.abs(val)
end

function ENT:SetSmartLookTraceFilter(val)
	self.SmartLookTraceFilter = val
end

function ENT:SetSmartLookTargetFilter(val)
	self.SmartLookTargetFilter = val
end

function ENT:SetSmartLookClosest(val)
	self.SmartLookClosest = val
end

function ENT:SetEnableRoll(bool)
	self.EnableRoll = bool
end

function ENT:SetRoll(roll)
	self.Roll = roll
end

function ENT:SetZoom(zoom)
	self.Zoom = zoom
	
	self:SetNWFloat("CamZoom", zoom)
end

function ENT:SetHitchcockEffect(val)
	self.HitchcockEffect = val
end

function ENT:CalcPerc()
	if not self:GetNWBool("IsMasterController") then return end
	
	return self.CatmullRomController:CalcPerc()
end

function ENT:GetPointData(terminating_entity_marker)
	if not self:GetNWBool("IsMasterController") then return end
	if self:SetNWBool("IsMapController") then return end
	
	local lastent = self
	local count = 1
	
	self.CatmullRomController:AddPointAngle(count, lastent:GetPos(), lastent:GetAngles())
	
	while true do
		count = count + 1
		
		local ent = lastent:GetNWEntity("ChildCamera")
		
		if ent == terminating_entity_marker then break end
		
		if CLIENT then
			lastent.CLTrackIndex = count - 1
		end
		
		local zoom = lastent:GetNWFloat("CamZoom")
		
		self.CatmullRomController:AddZoomPoint(count, (zoom > 0) and zoom or 75)
		
		if ent and ent:IsValid() then
			lastent = ent
			
			local dur = lastent:GetNWFloat("Duration")
			
			self.CatmullRomController:AddPointAngle(count, lastent:GetPos(), lastent:GetAngles(), (dur > 0) and dur or 2)
			
			if CLIENT then
				lastent.CLTrackIndex = count - 1
			end
			
			local zoom = lastent:GetNWFloat("CamZoom")
			
			self.CatmullRomController:AddZoomPoint(count, (zoom > 0) and zoom or 75)
			
			self.CatmullRomController.EntityList[count] = lastent
		else
			break
		end
	end
	
	if CLIENT then
		self.CatmullRomController.CLEntityListCount = #self.CatmullRomController.EntityList
	end
end

function ENT:ResetController(ent)
	self.CatmullRomController.PointsList    = {}
	
	self.CatmullRomController.FacingsList   = {}
	self.CatmullRomController.RotationsList = {}
	
	self.CatmullRomController.DurationList  = {}
	self.CatmullRomController.EntityList    = {}
	
	self.CatmullRomController.ZoomList      = {} -- needed serverside as well if there's a hitchcock camera in the track
	
	if CLIENT then
		self.CatmullRomController.Spline    = {}
	end
end

function ENT:RebuildTrack(ent)
	self:ResetController()
	
	return self:GetPointData(ent)
end

function ENT:ClearTrack(ent, trackidx, dont_loop_back)
	if trackidx == 1 then return end
	
	if (not self:GetNWBool("IsMasterController")) then
		if self:GetNWEntity("MasterController"):IsValid() then
			return self:GetNWEntity("MasterController"):ClearTrack(ent, trackidx, dont_loop_back)
		end
		
		return
	end
	if !self.CatmullRomController["PointsList"] then self:ResetController(self) end -- This is all I could think of.
	self.CatmullRomController.PointsList[trackidx]    = nil
	
	self.CatmullRomController.FacingsList[trackidx]   = nil
	self.CatmullRomController.RotationsList[trackidx] = nil
	
	self.CatmullRomController.DurationList[trackidx]  = nil
	self.CatmullRomController.EntityList[trackidx]    = nil
	
	self.CatmullRomController.ZoomList[trackidx]  = nil
	
	if CLIENT then
		self.CatmullRomController.Spline[trackidx]    = nil
	elseif self.Playing then
		self:End()
	end
	
	if trackidx < 3 then return end
	
	if dont_loop_back then
		return self:GetNWEntity("MasterController"):RebuildTrack(ent)
	else
		return self:ClearTrack(ent, trackidx - 1, true)
	end
end

function ENT:OnRemove()
	local trackidx = -1
	
	if SERVER then
		if self.ViewPointEnt and self.ViewPointEnt.IsValid and self.ViewPointEnt:IsValid() then
			self.ViewPointEnt:Remove()
		end
		
		if self.UndoData then
			CatmullRomCams.Tracks[self.UndoData.PID][self.UndoData.Key][self.UndoData.TrackIndex] = nil
			
			trackidx = self.UndoData.TrackIndex
		end
	else
		self:RemoveGuideGhost()
		
		if not self.CLTrackIndex then 


			if self:GetNWEntity("MasterController") then
				self:GetNWEntity("MasterController"):GetPointData() 
			end
			





		end
		
		trackidx = self.CLTrackIndex
	end
	
	return self:ClearTrack(self, trackidx)
end


--PATH addons/sl_bouffe/lua/entities/sl_sodacan06/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Soda (Mountain Dew)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacan06.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_winerose1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Wine (Rose)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/wine_rose1.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_winewhite3/shared.lua:
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
--PATH lua/entities/sodacan05/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Soda (Sprite)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacan05.mdl")
	
end
--PATH lua/entities/turkey2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Turkey"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/turkey2.mdl")
	
end
--PATH lua/entities/vegeggplant/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Eggplant"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/eggplant.mdl")
	
end
--PATH addons/leveling-system/lua/entities/vrondakis_book/cl_init.lua:
include("shared.lua")
 

function ENT:Draw()
    self:DrawModel()    

end
--PATH lua/entities/winerose2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Wine (Rose)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/wine_rose2.mdl")
	
end
--PATH lua/effects/ryukofinishercard.lua:
local dietime = 0

function EFFECT:Init( Effect )

	self.pos = Effect:GetOrigin()
	self.ang = Effect:GetAngles()
	
	--ParticleEffect( "martialhit_heavy_helper_base", self.DummyProj:GetPos(), self.DummyProj:GetAngles(), self.DummyProj )
	ParticleEffect("martialhit_heavy_helper_base",self.pos,self.ang)

	local emitter1 = ParticleEmitter(self.pos, true )
	local particle1 = emitter1:Add( "ryu_shockwave_ring",self.pos+Vector(0,0,5))
	if particle1 then
		particle1:SetAngles(Angle(0,self.ang.y,0))
		particle1:SetVelocity( Vector( 0, 0, 0 ) )
		particle1:SetDieTime( 0.125 )
		particle1:SetStartAlpha( 150 )
		particle1:SetEndAlpha( 0 )
		particle1:SetStartSize( 25 )
		particle1:SetEndSize( 150 )
		particle1:SetLighting(false)
		particle1:SetCollide(false)
	end
	emitter1:Finish()

	local emitter2 = ParticleEmitter(self.pos, true )
	local particle2 = emitter2:Add( "ryu_shockwave_ring",self.pos+Vector(0,0,5))
	if particle2 then
		particle2:SetAngles(Angle(0,self.ang.y - 180,0))
		particle2:SetVelocity( Vector( 0, 0, 0 ) )
		particle2:SetDieTime( 0.125 )
		particle2:SetStartAlpha( 150 )
		particle2:SetEndAlpha( 0 )
		particle2:SetStartSize( 25 )
		particle2:SetEndSize( 150 )
		particle2:SetLighting(false)
		particle2:SetCollide(false)
	end
	emitter2:Finish()

end

function EFFECT:Think()
end

function EFFECT:Render()
end
