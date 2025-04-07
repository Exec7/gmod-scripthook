--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 3/10 - 08/04/2025


--PATH addons/sl_util_accessory/lua/advanced_accessories/sh_config.lua:
AAS = AAS or {}

--fr, en, pl, de, tr, ru
--[[ You can choose between this langages fr, en, de, ru, es, tr, pl ]]
AAS.Lang = "fr"

--[[ Here you can change the title of the main menu ( "WELCOME, WHAT ARE YOU BUYING?" )]]
--[[ Don't touch if you want to get the basic text ]]
AAS.TitleMenu = ""

--[[ Set to true if you want to activate the download of all materials ]]
AAS.FastDL = true

--[[ If you use mysql you have to activate this and configure the mysql information and restart your server !! ]]
AAS.Mysql = false

--[[ How long the new tag remains when an object is added 1 = 1 day, 2 = 2 days, 0.5 = 12 hours ... ]]
AAS.NewTime = 1

--[[ Set to true if you want to use the notification of the addon ]]
AAS.ActivateNotification = true

--[[ If you want to open the menu with a key you need to set to true this variable ]]
AAS.OpenShopWithKey = false

--[[ Here you can modify key for open the shop menu https://wiki.facepunch.com/gmod/Enums/KEY ]]
AAS.ShopKey = KEY_F6

--[[ If you want to open the menu with a key you need to set to true this variable ]]
AAS.OpenBodyGroupWithKey = false

--[[ Here you can modify key for open the bodygroup menu https://wiki.facepunch.com/gmod/Enums/KEY ]]
AAS.BodyGroupKey = KEY_F5

--[[ If you want to open the menu with a key you need to set to true this variable ]]
AAS.OpenModelChangerWithKey = false

--[[ Here you can modify key for open the model changer menu https://wiki.facepunch.com/gmod/Enums/KEY ]]
AAS.ModelChangerKey = KEY_F7

--[[ If you want to reload item when you come back to the server ]]
AAS.LoadItemsSaved = true

--[[ If you want to reload the model when you come back to the server ]]
AAS.LoadModelSaved = true

--[[ Refund pourcentage of the accessory ]]
AAS.SellValue = 50

--[[ If the player can modify the offset of items bought ]]
AAS.ModifyOffset = true

--[[
    You need to restart the server when you add a new content into this table

    This is the table where you can load the default id of content who was configured for you
    572310302 = https://steamcommunity.com/sharedfiles/filedetails/?id=572310302 
    148215278 = https://steamcommunity.com/sharedfiles/filedetails/?id=148215278
    282958377 = https://steamcommunity.com/sharedfiles/filedetails/?id=282958377
    158532239 = https://steamcommunity.com/sharedfiles/filedetails/?id=158532239
    551144079 = https://steamcommunity.com/sharedfiles/filedetails/?id=551144079
    826536617 = https://steamcommunity.com/sharedfiles/filedetails/?id=826536617
    166177187 = https://steamcommunity.com/sharedfiles/filedetails/?id=166177187
    354739227 = https://steamcommunity.com/sharedfiles/filedetails/?id=354739227
]]

AAS.LoadWorkshop = {
    ["572310302"] = false,
    ["148215278"] = false,
    ["282958377"] = false,
    ["158532239"] = false,
    ["551144079"] = false,
    ["826536617"] = false,
    ["166177187"] = false,
    ["354739227"] = false,
}

--[[ Time to wear the accessory when you use the swep ]]
AAS.WearTimeAccessory = 2

--[[ Whitch rank can add, modify and configure items ]]
AAS.AdminRank = {
    ["superadmin"] = true,
    ["admin"] = true, 
}

--[[ Which job can't have accessory equiped ]]
AAS.BlackListJobAccessory = {
    -- ["Civil Protection"] = true,
    -- ["Civil Protection Chief"] = true, 
}

--[[ Which command for open the admin menu ]]
AAS.AdminCommand = "/accconfig"

--[[ Can open item menu with a command ]]
AAS.OpenItemMenuCommand = true

AAS.ItemsMenuCommand = "/acc"

--[[ Here you can modify gradient colors]]
AAS.Gradient = {
    ["upColor"] = Color(18, 30, 42, 200), 
    ["midleColor"] = Color(27, 59, 89, 200),
    ["downColor"] = Color(54, 140, 220), 
}

--[[ The name of the swep ]]
AAS.SwepName = "Inventory Swep"

--[[ If you want to be able to buy, sell item when you open the menu with the swep ]]
AAS.BuyItemWithSwep = false

--[[ If you want to activate the weight module ]]
AAS.WeightActivate = false

--[[ All can have 10 items and Vip can have 30 items in his inventory ]]
AAS.WeightInventory = {
    ["all"] = 4, -- don't touch to the name of the category !!!!
    ["VIP"] = 10,
}

AAS.ItemNpcModel = "models/Humans/Group01/Female_02.mdl"

AAS.ItemNpcName = "Vendeur d'Accessoire"

AAS.BodyGroupModel = "models/props_c17/FurnitureDresser001a.mdl"

AAS.BodyGroupsName = "Armoire"

AAS.ModelChanger = "models/props_c17/FurnitureDresser001a.mdl"

AAS.ModelName = "Models Changer"

--[[ Whitch job can't change his bodygroups and can't open the bodygroups armory ]]
AAS.BlackListBodyGroup = {
    // ["Hobo"] = true,
    // ["Civil Protection Chief"] = true,
}

--[[ Whitch job can't choose, buy, sell accessory and can't access to the menu ]]
AAS.BlackListItemsMenu = {
    // ["Hobo"] = true,
    // ["Civil Protection Chief"] = true,
}

--[[ Whitch job can't change his models ]]
AAS.BlackListModelsMenu = {
    // ["Hobo"] = true,
    // ["Civil Protection Chief"] = true,
}

--[[ If you want to use darkrp model when you try to change your model ]]
AAS.UseDarkRPModel = false

--[[ Here you can add your model]]
AAS.CustomModelTable = {
    ["Citizen"] = {
        "models/player/zelpa/male_01.mdl",
        "models/player/zelpa/male_03.mdl",
        "models/player/zelpa/male_05.mdl",
        "models/player/zelpa/male_06.mdl",
        "models/player/zelpa/male_07.mdl",
        "models/player/zelpa/male_08.mdl",
        "models/player/zelpa/male_09.mdl",
        "models/player/zelpa/male_10.mdl",
        "models/player/zelpa/male_11.mdl",
        "models/player/zelpa/female_01_b.mdl",
        "models/player/zelpa/female_06.mdl",
        "models/player/zelpa/female_02_b.mdl",
        "models/player/zelpa/female_03_b.mdl",
        "models/player/zelpa/female_04_b.mdl",
        "models/player/zelpa/female_06_b.mdl",
    },
    ["Civil Protection"] = {
        "models/player/zelpa/male_01.mdl",
        "models/player/zelpa/male_02.mdl",
        "models/player/zelpa/male_03.mdl",
        "models/player/zelpa/male_04.mdl",
    },
}

--[[ Here you can modify all color used by the addon ]]
AAS.Colors = {
    ["whiteConfig"] = Color(255,255,255),
    ["white"] = Color(240,240,240),
    ["black"] = Color(0,0,0),
    ["black100"] = Color(0,0,0,100),
    ["black150"] = Color(0,0,0,150),
    ["black18"] = Color(18, 30, 42),
    ["black18230"] = Color(18, 30, 42, 230),
    ["black18200"] = Color(18, 30, 42, 200),
    ["black18100"] = Color(18, 30, 42, 100),
    ["background"] = Color(25, 40, 55),
    ["selectedBlue"] = Color(53, 139, 219),
    ["white200"] = Color(255,255,255,200),
    ["white50"] = Color(255,255,255,50),
    ["yellow"] = Color(255, 198, 57),
    ["darkBlue"] = Color(49, 98, 255),
    ["dark34"] = Color(34,34,34),
    ["blue77"] = Color(77, 128, 255),
    ["red49"] = Color(255, 49, 84), 
    ["grey"] = Color(189,190,191,255),
    ["blue75"] = Color(75, 168, 255),
    ["grey53"] = Color(53, 139, 219),
    ["grey165"] = Color(165, 165, 165),
    ["notifycolor"] = Color(54, 140, 220),
    ["white200"] = Color(240,240,240),
    ["bought"] = Color(252, 186, 3),
}

--[[ Actually you can just set € and $ but if you know what you do you can add more currencies]]
AAS.CurrentCurrency = "Y"

--[[ You can add more currency here ]]
AAS.Currencies = {
    ["$"] = function(money)
        return "$"..money
    end,
    ["€"] = function(money)
        return money.."€"
    end
}

--[[ This number define the max vector offset modification ( don't touch if you don't know what you do !! )]]
AAS.MaxVectorOffset = 100

--[[ This number define the max angle offset modification ( don't touch if you don't know what you do !! )]]
AAS.MaxAngleOffset = 360

// Reload item language if the language was changed
if SERVER then 
    if isfunction(AAS.ChangeLangage) then
        AAS.ChangeLangage() 
    end
end
--PATH addons/sl_util_accessory/lua/advanced_accessories/shared/sh_functions.lua:
-- [[ Compress table ]] --
function AAS.CompressTable(tbl)
    if not istable(tbl) then return end

    return (util.Compress(util.TableToJSON(tbl)) or "")
end

-- [[ Uncompress table ]] --
function AAS.UnCompressTable(compressedString)
    if not isstring(compressedString) then return end

    return (util.JSONToTable(util.Decompress(compressedString)) or {})
end

--[[ Check if the category exist on the sh_advanced_configuration.lua ]]
function AAS.CheckCategory(category)
    for k,v in pairs(AAS.Category["mainMenu"]) do 
        if v.uniqueName == category then return true end 
    end
    return false 
end

--[[ Convert a number to a format number ]]
function AAS.formatMoney(money)
    if not isnumber(money) then return 0 end

    money = string.Comma(money)

    return isfunction(AAS.Currencies[AAS.CurrentCurrency]) and AAS.Currencies[AAS.CurrentCurrency](money) or money
end

--[[ Serverside get the invetory table with a steamId64 and Clientside get your inventory ]]
function AAS.GetInventory(steamId64)
    if SERVER then
        local inventoryQuery = AAS.Query("SELECT * FROM aas_inventory WHERE steam_id = '"..steamId64.."'")
        local returnTable = {}

        for k,v in ipairs(inventoryQuery) do
            if not AAS.GetTableById(v.uniqueId) then continue end

            returnTable[#returnTable + 1] = v
        end
        
        return returnTable
    else
        return AAS.ClientTable["ItemsInventory"]
    end
end

--[[ Make sure sentence exist and also langage exist]]
function AAS.GetSentence(string)
    local result = "Lang Problem"
    local sentence = istable(AAS.Language[AAS.Lang]) and AAS.Language[AAS.Lang][string] or "Lang Problem"

    if istable(AAS.Language[AAS.Lang]) and isstring(sentence) then
        result = sentence
    elseif istable(AAS.Language["en"]) and isstring(AAS.Language["en"][sentence]) then
        result = AAS.Language["en"][sentence]
    end

    return result
end

local PLAYER = FindMetaTable("Player")

--[[ This function permite to add compatibility with other gamemode ]]
function PLAYER:AASGetMoney()
    if DarkRP then
        return self:getDarkRPVar("money")
    elseif ix then
        return (self:GetCharacter() != nil and self:GetCharacter():GetMoney() or 0)
    elseif nut then
        return (self:getChar() != nil and self:getChar():getMoney() or 0)
    end

    return 0
end

--[[ Get if the model is equipped on the player ]]
function PLAYER:AASModelEquiped(model)
    if SERVER then
        local AASTbl = AAS.Query("SELECT * FROM aas_item WHERE model = '"..model.."'")
        local tbl = AASTbl[1] or {}    
        local Equiped = false

        for k,v in pairs(self.AASAccessories) do
            if tonumber(v) != tonumber(tbl["uniqueId"]) then continue end

            Equiped = true
            break
        end

        return Equiped
    else
        local Equiped = false
        local itemsEquiped = AAS.ClientTable["ItemsEquiped"][self:SteamID64()] or {}
        
        for k,v in pairs(itemsEquiped) do
            if v.model == model then Equiped = true break end
        end

        return Equiped
    end
end
--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_cards.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize(AAS.ScrW*0.0811, AAS.ScrH*0.26)

    local size = AAS.Materials["editpos"]

    local editItem = vgui.Create("DImageButton", self)
    editItem:SetMaterial(AAS.Materials["editpos"])
    editItem:SetSize(AAS.Materials["editpos"]:Width()*AAS.ScrW/1920, AAS.Materials["editpos"]:Height()*AAS.ScrH/1080)
    editItem:SetPos(self:GetWide()*0.83, 0)
    editItem.DoClick = function()
        AAS.ClientTable["ItemSelected"] = self.AASTable

        sliderList:AlphaTo( 0, 0.3, 0, function()
            sliderList:Remove()
            AAS.settingsScroll(accessoriesFrame, AAS.ScrH*0.11, AAS.ScrH*0.525, true, "Edit Item", true, true)
        end)

        // Debug a litle thing with the icon
        for i=1, 4 do
            if istable(AAS.ClientTable["ItemSelected"]) then
                if i == 4 then
                    if isnumber(AAS.ClientTable["ItemSelected"]["options"]["iconFov"]) then
                        AAS.ClientTable["ResizeIcon"][i] = AAS.ClientTable["ItemSelected"]["options"]["iconFov"]
                    end
                elseif i < 4 then
                    if isvector(AAS.ClientTable["ItemSelected"]["options"]["iconPos"]) then
                        AAS.ClientTable["ResizeIcon"][i] = AAS.ClientTable["ItemSelected"]["options"]["iconPos"][i]
                    end
                end
            end
        end
    end

    local deleteItem = vgui.Create("DImageButton", self)
    deleteItem:SetMaterial(AAS.Materials["removeitem"])
    deleteItem:SetSize(AAS.Materials["removeitem"]:Width()*AAS.ScrW/1920, AAS.Materials["removeitem"]:Height()*AAS.ScrH/1080)
    deleteItem:SetPos(self:GetWide()*0.83, AAS.ScrH*0.035)
    deleteItem.DoClick = function()
        net.Start("AAS:Main")
            net.WriteUInt(2, 5)
            net.WriteUInt(self.AASTable["uniqueId"], 32)
        net.SendToServer()
    end

    self.AASButton = {editItem, deleteItem}
end

function PANEL:RemoveButton()
    if IsValid(self.AASButton[1]) then self.AASButton[1]:Remove() end 
    if IsValid(self.AASButton[2]) then self.AASButton[2]:Remove() end 
end 

function PANEL:AddItemView(itemScroll, accessoriesFrame, itemContainer, tbl)
    if not istable(tbl) then return end
    local sizeX, sizeY = 0, 0

    local item = vgui.Create("DPanel", self)
    item:SetSize(AAS.ScrW*0.081, AAS.ScrH*0.2)
    self.AASTable = tbl
    
    item.Paint = function(panel,w,h)
        local scrollX, scrollY = accessoriesFrame:LocalToScreen(itemScroll:GetPos())
        local scrollW, scrollH = itemScroll:GetSize()
        
        local itemX, itemY = itemContainer:LocalToScreen(self:GetPos())
        local itemW, itemH = AAS.ScrW*0.081, h - AAS.ScrH*0.031
        
        itemY = itemY + AAS.ScrH*0.0135
        
        sizeX, sizeY = itemW, itemH
        posX, posY = itemX, itemY
        
        if itemY < scrollY then
            sizeY = sizeY - (scrollY-itemY)
            posY = posY + (scrollY-itemY)
        end
        
        if (itemY+itemH) > (scrollY+scrollH) then
            sizeY = sizeY - ((itemY+itemH) - (scrollY+scrollH))
        end

        draw.RoundedBoxEx(16, 0, 0, w, h, AAS.Colors["white"], false, true, true, false)
        draw.RoundedBoxEx(14, AAS.ScrW*0.001, h*0.0695, w-AAS.ScrW*0.0022, h*0.92, AAS.Gradient["downColor"], false, true, true, false)

        AAS.SimpleLinearGradient(posX + AAS.ScrW*0.001, posY, w - AAS.ScrW*0.002, sizeY, AAS.Colors["white"], AAS.Gradient["downColor"])

        local newTime = istable(self.AASTable["options"]) and tonumber(self.AASTable["options"]["date"]) or 0

        if istable(self.AASTable["options"]) and ((newTime + (AAS.NewTime*60*60*24)) > os.time()) and self.AASTable["options"]["new"] then 
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(AAS.Materials["new"])
            surface.DrawTexturedRect(0, 0, AAS.ScrW*0.047, AAS.ScrH*0.046)
        end 
        
        if istable(self.AASTable["options"]) and self.AASTable["options"]["vip"] then 
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(AAS.Materials["vip"])
            surface.DrawTexturedRect(w-AAS.ScrW*0.0465, itemH-AAS.ScrH*0.02, AAS.ScrW*0.0475, AAS.ScrH*0.055)
        end
    end
    
    local itemModel = vgui.Create("DModelPanel", item)
    itemModel:SetSize(item:GetWide(), item:GetWide())
    itemModel:SetModel((self.AASTable["model"] or ""))
    itemModel.AASTable = self.AASTable

    function itemModel:Think()
        if not IsValid(self.Entity) then return end
        
        self.mn, self.mx = self.Entity:GetRenderBounds()
        
        local size = 0
        size = math.max(size, math.abs(self.mn.x) + math.abs(self.mx.x))
        size = math.max(size, math.abs(self.mn.y) + math.abs(self.mx.y))
        size = math.max(size, math.abs(self.mn.z) + math.abs(self.mx.z))
    
        self:SetPos(0, AAS.ScrH*0.2/2 - self:GetWide()/2)
        self:SetCamPos(Vector(size, size, size))
        
        if not self.AASStatut and istable(AAS.ClientTable["ItemSelected"]) then
    
            local vector = (AAS.ClientTable["ItemSelected"].uniqueId == self.AASTable.uniqueId) and Vector(AAS.ClientTable["ResizeIcon"][1], AAS.ClientTable["ResizeIcon"][2], AAS.ClientTable["ResizeIcon"][3]) or self.AASTable["options"]["iconPos"]
            if not isvector(vector) then vector = Vector(0,0,0) end

            local fov = (AAS.ClientTable["ItemSelected"].uniqueId == self.AASTable.uniqueId) and AAS.ClientTable["ResizeIcon"][4] or self.AASTable["options"]["iconFov"]
    
            self:SetFOV(45 + fov)
            self:SetLookAt((self.mn + self.mx) * 0.5 + vector)
        else
            if istable(self.AASTable["options"]) then
                if isnumber(self.AASTable["options"]["iconFov"]) then
                    self:SetFOV(45 + self.AASTable["options"]["iconFov"])
                end
    
                local vector = self.AASTable["options"]["iconPos"]
                if isvector(vector) then
                    self:SetLookAt((self.mn + self.mx) * 0.5 + vector)
                end
            end
        end

        AAS.SetPanelSettings(self, self.AASTable)
    end
    function itemModel:LayoutEntity() end

    local buttonHover = vgui.Create("DButton", self)
    buttonHover:SetSize(AAS.ScrW*0.081, AAS.ScrH*0.2)
    buttonHover:SetText("")
    buttonHover.AASColor = AAS.Colors["black18"]
    buttonHover.DoClick = function()
        local uniqueId = self.AASTable["uniqueId"]
        local sell = AAS.ItemIsBought(uniqueId)
        
        if not IsValid(self.AASButton[1]) and not IsValid(self.AASButton[2]) then
            AAS.PopupMenu(uniqueId, sell, self.AASTable["price"])
        end
    end

    local text = AAS.BreakText((self.AASTable["description"] or ""), 20)
    
    buttonHover.Paint = function(panel,w,h) 
        if istable(AAS.ClientTable["ItemSelected"]) and IsValid(self.AASButton[1]) and IsValid(self.AASButton[2]) and AAS.ClientTable["ItemSelected"].uniqueId == self.AASTable["uniqueId"] then 
            local checkSizeX, checkSizeY = (AAS.Materials["selected"]:Width()*AAS.ScrW/1920), (AAS.Materials["selected"]:Height()*AAS.ScrH/1080)
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(AAS.Materials["selected"])
            surface.DrawTexturedRect(w/2-checkSizeX/2, h/2-checkSizeY/2, checkSizeX, checkSizeY)
        end

        if not isnumber(panel.LerpColor) then panel.LerpColor = 0 end 
        
        if panel:IsHovered() then 
            panel.LerpColor = Lerp(FrameTime()*15, panel.LerpColor, 255)
            
            buttonHover.AASColor = AAS.Colors["white"]
            
            draw.RoundedBoxEx(16, 0, 0, w, h, ColorAlpha(AAS.Colors["white"], panel.LerpColor), false, true, true, false)
            draw.RoundedBoxEx(16, 1, 1, w-2, h-2, ColorAlpha(AAS.Colors["dark34"], panel.LerpColor), false, true, true, false)
            draw.DrawText(text, "AAS:Font:03", w/2.1, h*0.25, ColorAlpha(AAS.Colors["white"], panel.LerpColor), TEXT_ALIGN_CENTER)
        else
            buttonHover.AASColor = AAS.Colors["black18"]

            if panel.LerpColor != 0 then panel.LerpColor = 0 end 
        end

        local mat = AAS.GetMaterial(tbl["category"])
        surface.SetDrawColor(buttonHover.AASColor)
        surface.SetMaterial(AAS.GetMaterial(tbl["category"]))
        surface.DrawTexturedRect(AAS.ScrW*0.052, AAS.ScrH*0.005, (mat:Width()*AAS.ScrW/1920)*0.8, (mat:Height()*AAS.ScrH/1080)*0.8 )
    end
    self.buttonHover = buttonHover
end 

function PANEL:Paint(w, h)
    local uniqueId = self.AASTable["uniqueId"]
    local sell = AAS.ItemIsBought(uniqueId)

    draw.DrawText((self.AASTable["name"] or "Data Problem"), "AAS:Font:02", AAS.ScrW*0.081/2, h*0.79,  AAS.Colors["white"], TEXT_ALIGN_CENTER)
    draw.DrawText((sell and not IsValid(self.AASButton[1])) and AAS.GetSentence("bought") or AAS.formatMoney((self.AASTable["price"] or 0)), "AAS:Font:03", AAS.ScrW*0.081/2, h*0.89,  (sell and not IsValid(self.AASButton[1])) and AAS.Colors["bought"] or AAS.Colors["white"], TEXT_ALIGN_CENTER)
end

derma.DefineControl("AAS:Cards", "AAS Cards", PANEL, "DPanel")


--PATH addons/sl_aphone/lua/aphone/languages/french.lua:
aphone.LanguageTable = {
    // NPC
    NPC_Name = "Changer ma coque",

    // Error
    Error_FailedTextScreen = "Echec de la création du texte, erreur dans la console",

    // APP Names
    Calculator = "Calculette",
    Camera = "Caméra",
    Contacts = "Contacts",
    Cookies = "Cookies",
    Darkweb = "Darkweb",
    Gallery = "Galerie",
    GPS = "GPS",
    SMS = "Messages",
    Radio = "Radio",
    Options = "Options",
    Bank = "Banque",
    Printer = "Printer",

    // Printers
    printer_money = "Argent",
    printer_capacity = "Capacité",
    printer_sec = "Argent/Sec",
    printer_danger = "Printers en surchauffe",

    // Params
    SilentMode = "Silencieux",
    AutoLight = "AutoLight",

    // DodgeIt!
    Restart = "Réessayer ?",
    Hello = "Bonjour",
    WelcomeTo = "Bienvenue sur",

    // Special Numbers
    Police = "Police",
    Police_Desc = "Appeler la police",

    // Painting
    Material = "Image",
    Angle = "Angle",
    Red = "Rouge",
    Blue = "Bleu",
    Green = "Vert",
    PosX = "Pos X",
    PosY = "Pos Y",
    SizeX = "Taille X",
    SizeY = "Taille Y",
    Add_Layer = "Ajouter Couche",
    Confirm = "Valider",

    // Call
    Already_Call = "Déjà en appel",
    Calling = "Appel",

    // Pictures
    Uploading = "Mise en ligne",
    Online_Pictures = "Votre Cloud",
    Offline_Pictures = "Votre Gallerie",

    // Contacts
    No_Number = "Pas de numéro",
    PutName = "Mettez un nom",
    PutNumber = "Mettez un numéro",
    Already_Exist = "Déjà présent",
    PlayerNotFound = "Joueur pas trouvé",
    ChangeName = "Changer le nom",

    // Cookies ( Number )
    Thousand = " mille",
    Million = " million",
    Billion = " milliard",
    Trillion = " billion",
    Quadrillion = " billiard",
    Quintillion = " trillion",
    Sextillion = " trilliard",
    Septillion = " quatrillion",

    // Cookies ( Items )
    Cursor = "Curseur",
    Grandma = "Grand-mère",
    Farm = "Ferme",
    Mine = "Mine",
    Factory = "Usine",
    Bank = "Banque",
    Temple = "Temple",
    WizardTower = "Tour de mage",
    Shipment = "Cargaison",
    Alchemy = "Labo d'alchimie",
    Portal = "Portail",
    TimeMachine = "Spatio-Temporel",
    Antimatter_Condenser = "Condensateur Anti-Matière",
    Prism = "Prisme",
    Chancemaker = "Faiseur de chances",
    FractalEngine = "Moteur Fractal",
    JSConsole = "Console Javascript",
    Idleverse = "Multi-Mondes",

    // Messages
    Messages = "Messages",
    Type_Message = "Écrire...",
    First_Message = "Aucun message trouvé\nEngagerez-vous la conversation ?",
    Search = "Rechercher",
    Available = "Connecté",
    Not_Available = "Messages seulement",

    // Radio
    Music_NotFound = "Nom de la musique inconnu",
    Music_Disabled = "- Désactivé",
    Radio_Off = "Eteinte",

    // Darkweb
    Darkweb_Title = "darkweb",
    Darkweb_Contracts = "contrats",
    Darkweb_Confirm = "confirmer",
    Darkweb_name = "nom",
    Darkweb_price = "prix",
    Darkweb_putname = "mettre nom",
    Darkweb_notfound = "pas trouvé",

    // Days
    Monday = "Lundi",
    Tuesday = "Mardi",
    Wednesday = "Mercredi",
    Thursday = "Jeudi",
    Friday = "Vendredi",
    Saturday = "Samedi",
    Sunday = "Dimanche",

    January = "Janvier",
    February = "Février",
    March = "Mars",
    April = "Avril",
    May = "Mai",
    June = "Juin",
    July = "Juillet",
    August = "Août",
    September = "Septembre",
    October = "Octobre",
    November = "Novembre",
    December = "Décembre",

    // BLogs
    BLogs_Message = "{1} à envoyé un message à {2} ",
    BLogs_MessageOffline = "{1} à envoyé un message à %s ",
    BLogs_Call_Pending = "{1} à appellé {2}",
    BLogs_Call_Accept = "{1} à accepté l'appel de {2}",
    BLogs_Call_Stop = "{1} à coupé l'appel avec {2}",
    BLogs_Deepweb_Create = "{1} à créer un contrat sur {2} pour ",
    BLogs_Deepweb_Remove = "Le contrat de {1} sur {2} a été retiré ",

    // Colors
    Black48 = "Noir",
    Black40 = "Noir 2",
    Black40_120 = "Noir 2 - 120",
    Silver = "Argent",
    White = "Blanc",
    Black1 = "Noir 3",
    Black2 = "Noir 4",
    Black3 = "Noir 5",
    mat_black = "Noir 6",

    Text_White = "Couleur du texte",
    Text_White180 = "Couleur du texte - 180",
    Text_White120 = "Couleur du texte - 120",
    Text_White60 = "Couleur du texte - 60",
    Text_Shadow = "Ombre du texte",
    Text_Apps = "Couleur du titre des apps",

    Text_Orange = "Orange",
    mat_orange = "Orange 2",
    GPS_Line = "Trait GPS",

    Cookie_BoostOff = "Cookie - Sans Boost",
    Cookie_BoostOn = "Cookie - Avec Boost",
    Cookie_Blue = "Cookie - Fond boutique",

    Radio_Background = "Radio - Fond",
    Radio_VolumeBar = "Radio - Fond du volume",
    Radio_RadioList = "Radio - Fond liste",

    mat_red = "Rouge",
    mat_blackred = "Rouge foncé",
    mat_lightred = "Rouge clair",
    Services_Desc = "Demandez de l'aide!",
    Services = "Services",
    BATM_Issue = "Vous devez utiliser un ATM avant d'utiliser l'application",
    OnlyMyRadio = "Que ma radio",
    Ringtones = "Sonnerie",

    Darkweb_Notify = "Vous avez été payé %s pour le meurtre",
    Colors = "Couleurs",
    Core = "Autres",
    SettingFlashlight = "Lampe de Porche",
}
--PATH addons/sl_aphone/lua/aphone/_libs/painting/cl_panel.lua:
local rt = GetRenderTargetEx( "aphone_RT_Shop", 1024, 1024, RT_SIZE_OFFSCREEN, MATERIAL_RT_DEPTH_NONE, 0, 0, IMAGE_FORMAT_RGBA8888)
local tex = CreateMaterial( "aphone_RT_Shop", "VertexLitGeneric", {
	["$basetexture"] = rt:GetName()
} )

aphone.matlist = {6}

local slider_list = {
	["mat_id"] = {
		name = aphone.L("Material"),
		min = 1,
		max = #aphone.Painting,
		default = 1,
		round = 0,
		order = 0,
	},
	["angle"] = {
		name = aphone.L("Angle"),
		min = 0,
		max = 360,
		default = 0,
		order = 1,
	},
	["clr_r"] = {
		name = aphone.L("Red"),
		min = 0,
		max = 255,
		default = 255,
		order = 2,
	},
	["clr_g"] = {
		name = aphone.L("Green"),
		min = 0,
		max = 255,
		default = 255,
		order = 3,
	},
	["clr_b"] = {
		name = aphone.L("Blue"),
		min = 0,
		max = 255,
		default = 255,
		order = 4,
	},
	["posx"] = {
		name = aphone.L("PosX"),
		min = 0,
		max = 1,
		default = 0.5,
		round = 2,
		order = 5,
	},
	["posy"] = {
		name = aphone.L("PosY"),
		min = 0,
		max = 1,
		default = 0.5,
		round = 2,
		order = 6,
	},
	["sizex"] = {
		name = aphone.L("SizeX"),
		min = 0,
		max = 5,
		default = 1,
		round = 2,
		order = 7,
	},
	["sizey"] = {
		name = aphone.L("SizeY"),
		min = 0,
		max = 5,
		default = 1,
		round = 2,
		order = 8,
	},
}

function aphone.OpenPaint()
	gui.EnableScreenClicker(true)
	local stickers = aphone.SelfPaint or {}

	// Cache colors
	local black_48 = aphone:Color("Black48")
	local black_40 = aphone:Color("Black40")
	local mat_red = aphone:Color("mat_red")
	local text_orange = aphone:Color("Text_Orange")
	local white_font = aphone:Color("White_Font")
	local text_white = aphone:Color("Text_White")
	local mat_black = aphone:Color("mat_black")
	local mat_lightred = aphone:Color("mat_lightred")
	local mat_blackred = aphone:Color("mat_blackred")

	aphone:Painting_Generate(rt, stickers)

	local f = vgui.Create("EditablePanel")
	f:SetSize(ScrW() * 0.45, ScrH() * 0.5)
	f:Center()
	f:MakePopup()

	function f:OnRemove()
		gui.EnableScreenClicker(false)
	end

	function f:Paint(w, h)
		draw.RoundedBox(4, 0, 0, w, h, black_40)
	end

	local AdjustableModelPanel = vgui.Create( "DAdjustableModelPanel", f)
	AdjustableModelPanel:Dock(LEFT)
	AdjustableModelPanel:SetWide(f:GetTall())
	AdjustableModelPanel:SetLookAt( Vector( 0, 0, 0 ) )
	AdjustableModelPanel:SetModel( "models/akulla/aphone/w_aphone.mdl" )
	function AdjustableModelPanel:LayoutEntity() return end // disables default rotation

	// HACK : The model will show only if the panel is already clicked one time if I don't do that.
	AdjustableModelPanel:OnMousePressed(MOUSE_LEFT)

	timer.Simple(0.3, function()
		AdjustableModelPanel:OnMouseReleased(MOUSE_LEFT)
	end)
	// End of hack

	if !aphone.Texturelist[LocalPlayer():UserID()] then
		aphone:Painting_Generate(rt, {})
	end

	for k, v in pairs(aphone.matlist) do
		AdjustableModelPanel.Entity:SetSubMaterial(v, "!" .. tex:GetName())
	end

	local bottom_dock = vgui.Create("DPanel", f)
	bottom_dock:Dock(BOTTOM)
	bottom_dock:SetTall(50)

	local add_sticker = vgui.Create("DButton", bottom_dock)
	add_sticker:Dock(LEFT)
	add_sticker:SetWide((f:GetWide() - f:GetTall()) / 2)
	add_sticker:SetPaintBackground(false)
	add_sticker:TDLib()
	add_sticker:Background(mat_red)
	add_sticker:FadeHover(text_orange)
	add_sticker:Text(aphone.L("Add_Layer"), "MediumHeader_2D", white_font)

	local finish_sticker = vgui.Create("DButton", bottom_dock)
	finish_sticker:Dock(FILL)
	finish_sticker:SetPaintBackground(false)
	finish_sticker:TDLib()
	finish_sticker:Background(mat_red)
	finish_sticker:FadeHover(text_orange)
	finish_sticker:Text(aphone.L("Confirm"), "MediumHeader_2D", white_font)

	local list = vgui.Create("DScrollPanel", f)
	list:Dock(FILL)
	list:GetVBar():SetWide(0)
	list:aphone_PaintScroll()

	function list:Paint(w, h)
		surface.SetDrawColor(black_48)
		surface.DrawRect(0, 0, w, h)
	end

	function list:AddSticker(id, id_table)
		local deployable = vgui.Create("DPanel")
		list:AddItem(deployable)
		deployable:Dock(TOP)
		deployable:SetTall(50)
		deployable:SetPaintBackground(false)

		local b = vgui.Create("DButton", deployable)
		b:Dock(TOP)
		b:SetText("")
		b:SetTall(50)
		b:SetPaintBackground(false)
		b:TDLib()
		b:FillHover(mat_red, LEFT)

		local delete = vgui.Create("DButton", b)
		delete:Dock(RIGHT)
		delete:SetText("")
		delete:SetPaintBackground(false)
		delete:SetWide(b:GetTall())

		function delete:DoClick()
			stickers[id] = nil
			deployable:Remove()
			aphone:Painting_Generate(rt, stickers)
		end

		function deployable:Paint(w, h)
			if deployable:GetTall() != b:GetTall() then
				surface.SetDrawColor(mat_black)
				surface.DrawRect(0, 0, w, h)
			end
		end

		b:On("PaintOver", function(pnl, w, h)
			if deployable:GetTall() != pnl:GetTall() then
				surface.SetDrawColor(mat_red)
				surface.DrawRect(0, 0, w, h)
			end

			draw.SimpleText("Sticker " .. id, "MediumHeader_2D", 10, h / 2, text_white, 0, 1)
			// Bit ghetto, but I won't need to mess with ZPos etc...
			draw.SimpleText("-", "MediumHeader_2D", w - h / 2, h / 2, white_font, 1, 1)
		end)

		local settings_wide = f:GetWide() - AdjustableModelPanel:GetWide() - 20
		local settings = vgui.Create("DScrollPanel", deployable)
		settings:Dock(TOP)
		settings:DockMargin(10, 0, 10, 0)
		settings:SetPadding(settings_wide * 0.05)

		b:On("DoClick", function(pnl)
			deployable:SizeTo(-1, deployable:GetTall() == b:GetTall() and settings:GetTall() + b:GetTall() or b:GetTall(), 0.5, 0, 0.5)
		end)

		// Choose material
		for k, v in SortedPairsByMemberValue(slider_list, "order") do
			local set_txt = vgui.Create("DLabel")
			settings:AddItem(set_txt)
			set_txt:Dock(TOP)
			set_txt:SetText(v.name)
			set_txt:SetFont("Small_2D")

			local set_slider = vgui.Create("DSlider")
			settings:AddItem(set_slider)
			set_slider:Dock(TOP)
			set_slider:DockMargin(settings_wide * 0.15, 0, settings_wide * 0.15, 0)
			set_slider:SetSlideX((id_table[k] - v.min) / (v.max - v.min))

			function set_slider:Paint(w, h)
				surface.SetDrawColor(mat_lightred)
				surface.DrawRect(0, h * 0.35, w, h * 0.3)
				surface.SetDrawColor(mat_blackred)
				surface.DrawRect(0, h * 0.35, w * self:GetSlideX(), h * 0.3)
			end

			function set_slider:Think()
				if self:IsEditing() then
					local val = (v.max - v.min) * self:GetSlideX() + v.min

					if v.round then
						val = math.Round(val, v.round)
					end

					stickers[id][k] = val
					aphone:Painting_Generate(rt, stickers)
				end
			end

			function set_slider.Knob:Paint(w, h) end
		end

		// SizeToChildren don't work, making it myself
		local final_height = 0
		for k, v in ipairs(settings:GetCanvas():GetChildren()) do
			local _, dm_top, __, dm_bottom = v:GetDockMargin()
			final_height = final_height + v:GetTall() + dm_top + dm_bottom
		end
		settings:SetTall(final_height)
	end

	-- Can have gap, not using ipairs
	for k, v in pairs(stickers) do
		list:AddSticker(k, v)
	end

	function add_sticker:DoClick()
		if table.Count(stickers) >= aphone.MaxPainting then return end

		local t = {}
		-- Can have gap, not using ipairs
		for k, v in pairs(slider_list) do
			t[k] = v.default
		end

		list:AddSticker(table.insert(stickers, t), t)
		aphone:Painting_Generate(rt, stickers)
	end

	function finish_sticker:DoClick()
		net.Start("aphone_ChangeSticker")
			net.WriteUInt(table.Count(stickers), 6)

			// Send the wannabe table
			for k, v in SortedPairs(stickers) do
				net.WriteUInt(v.mat_id, 16)
				net.WriteUInt(v.angle, 9)
				net.WriteUInt(v.clr_r, 8)
				net.WriteUInt(v.clr_g, 8)
				net.WriteUInt(v.clr_b, 8)
				net.WriteUInt(v.posx * 100, 10)
				net.WriteUInt(v.posy * 100, 10)
				net.WriteUInt(v.sizex * 100, 10)
				net.WriteUInt(v.sizey * 100, 10)
			end
		net.SendToServer()
		f:Remove()
	end
end
--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_call.lua:
local PANEL = {}

local green = Color(46, 204, 113)
local stencil_writemask = render.SetStencilWriteMask
local stencil_testmask = render.SetStencilTestMask
local stencil_id = render.SetStencilReferenceValue
local stencil_fail = render.SetStencilFailOperation
local stencil_zfail = render.SetStencilZFailOperation
local stencil_compare = render.SetStencilCompareFunction
local stencil_pass = render.SetStencilPassOperation

function PANEL:Init()
    local font_svg45 = aphone:GetFont("SVG_45")

    local clr_white = aphone:Color("Text_White")
    local clr_white120 = aphone:Color("Text_White120")
    local clr_white60 = aphone:Color("Text_White60")
    local clr_transparent = Color(1, 1, 1, 1)

    local main_x, main_y = self:GetParent():GetSize()

    if main_x > main_y then
        aphone.RequestAnim(1)
        self:Remove()
        return
    end

    self:SetSize(main_x, main_y)
    self.last_dring = 0

    self:GetParent():SetMouseInputEnabled(false)
    self:SetMouseInputEnabled(true)

    if aphone.Call.Infos.target then
        self.backgroundavatar = vgui.Create("AvatarImage", self)
        self.backgroundavatar:SetSize(main_y, main_y)
        self.backgroundavatar:SetPos(main_x/2 - main_y/2, 0)
        self.backgroundavatar:SetPlayer(aphone.Call.Infos.target, 184)
        self.backgroundavatar:SetPaintedManually(true)
    end

    local circle
    local avatar_outline = vgui.Create("DPanel", self)
    avatar_outline:SetSize(main_x*0.8, main_x*0.8)
    avatar_outline:SetPos(main_x*0.4, -main_x*0.1)
    avatar_outline:SetMouseInputEnabled(false)
    avatar_outline.colorbg = green

    function avatar_outline:Paint(w, h)
        if !circle then
            circle = aphone.GUI.GenerateCircle(w / 2, h / 2, w / 2)
        end

        if !aphone.Call.Infos then return end
        draw.NoTexture()

        if aphone.Call.Infos.target then
            surface.SetDrawColor(self.colorbg or green)
            surface.DrawPoly(circle)
        else
            render.ClearStencil()
            render.SetStencilEnable(true)
            stencil_writemask( 0xFF )
            stencil_testmask( 0xFF )
            stencil_fail( STENCIL_KEEP )
            stencil_zfail( STENCIL_KEEP )
            stencil_id( 1 )

            // Stencil
            stencil_compare(STENCIL_ALWAYS)
            stencil_pass(STENCIL_REPLACE)
                draw.NoTexture()
                surface.SetDrawColor(clr_transparent)
                surface.DrawPoly(circle)
            stencil_id(1)
            stencil_pass(STENCIL_KEEP)
            stencil_compare(STENCIL_EQUAL)
                surface.SetMaterial(aphone.SpecialNumbers[aphone.SpecialCalls[aphone.Call.Infos.special_id].name].icon)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(0, 0, w, h)
            render.SetStencilEnable(false)
        end
    end

    if aphone.Call.Infos.target then
        local player_avatar = vgui.Create("aphone_CircleAvatar", avatar_outline)
        player_avatar:Dock(FILL)
        player_avatar:DockMargin(aphone.GUI.ScaledSize(7, 7, 7, 7))
        player_avatar.ignorestencil = true
        player_avatar:SetPlayer(aphone.Call.Infos.target, 184)
    end
    self.avatar_outline = avatar_outline

    local player_calling = vgui.Create("DLabel", self)
    player_calling:Dock(TOP)
    player_calling:SetFont(aphone:GetFont("MediumHeader"))
    player_calling:SetText("")
    player_calling:SetContentAlignment(4)
    player_calling:DockMargin(main_x*0.08, main_y*0.45, 0, 0)
    player_calling:SetTextColor(aphone:Color("Text_White180"))
    player_calling:SetMouseInputEnabled(true)

    function player_calling:Think()
        if aphone.Call.Infos and aphone.Call.Infos.pending and aphone.Call.Infos.is_caller then
            player_calling:SetText(aphone.L("Calling") .. string.rep( ".", CurTime() % 3 ))
        else
            player_calling:SetText("")
            player_calling.Think = nil
        end
    end
    self.player_calling = player_calling

    surface.SetFont(player_calling:GetFont())
    player_calling:SetTall(select(2, surface.GetTextSize(player_calling:GetText())))

    surface.SetFont(aphone:GetFont("Roboto40"))

    local player_num = vgui.Create("DLabel", self)
    player_num:Dock(TOP)

    player_num:SetText(aphone.Call.Infos.target and aphone.Call.Infos.target:aphone_GetNumber() or "")
    player_num:SetFont(aphone:GetFont("Roboto40"))
    player_num:SetContentAlignment(4)
    player_num:DockMargin(main_x*0.08, 0, 0, 0)
    player_num:SetTextColor(clr_white60)
    self.player_num = player_num

    surface.SetFont(player_num:GetFont())
    player_num:SetTall(select(2, surface.GetTextSize(player_num:GetText())))

    local player_name = vgui.Create("DLabel", self)
    player_name:Dock(TOP)
    player_name:SetFont(aphone:GetFont("Roboto60"))
    player_name:SetContentAlignment(4)
    player_name:DockMargin(main_x*0.08, 0, 0, 0)
    player_name:SetTextColor(clr_white)
    self.player_name = player_name

    if IsValid(aphone.Call.Infos.target) then
        local n = aphone.GetName(aphone.Call.Infos.target)
        if n == aphone.Call.Infos.target:aphone_GetNumber() then 
            // Unknown
            player_name:SetText(player_num:GetText())
            player_num:SetText("")
        else
            player_name:SetText(n)
        end
    elseif aphone.Call.Infos.is_caller then
        player_name:SetText(aphone.SpecialCalls[aphone.Call.Infos.special_id].name)
    else
        player_name:SetText("Unknown")
    end

    surface.SetFont(player_name:GetFont())
    player_name:SetTall(select(2, surface.GetTextSize(player_name:GetText())))

    local buttons = vgui.Create("DPanel", self)
    buttons:Dock(BOTTOM)
    buttons:DockMargin(0, 0, 0, main_y * 0.1)
    buttons:SetTall(main_y * 0.1)
    buttons:SetPaintBackground(false)

    local ref = vgui.Create("DButton", buttons)
    ref:SetPos(((aphone.Call.Infos.pending and !aphone.Call.Infos.is_caller) and main_x * 0.25 or main_x * 0.50) - buttons:GetTall() / 2, 0)
    ref:SetSize(buttons:GetTall(), buttons:GetTall())
    ref:SetText("")
    ref:TDLib()
    ref:ClearPaint()
    ref:Circle(aphone:Color("Black3"))
    ref:CircleFadeHover(aphone:Color("mat_red"))

    ref:On("PaintOver", function(self, w, h)
        draw.SimpleText("4", font_svg45, w / 2, h / 2, clr_white, 1, 1)
    end)

    ref:On("DoClick", function()
        net.Start("aphone_Phone")
            net.WriteUInt(3, 4)
        net.SendToServer()
    end)
    self.button_refuse = ref

    if aphone.Call.Infos.pending and !aphone.Call.Infos.is_caller then
        self.button_accept = vgui.Create("DButton", buttons)
        self.button_accept:SetPos(main_x * 0.75 - buttons:GetTall() / 2, 0)
        self.button_accept:SetSize(buttons:GetTall(), buttons:GetTall())
        self.button_accept:SetText("")
        self.button_accept:TDLib()
        self.button_accept:ClearPaint()
        self.button_accept:Circle(aphone:Color("Black3"))
        self.button_accept:CircleFadeHover(green)

        function self.button_accept:PaintOver(w, h)
            draw.SimpleText("o", aphone:GetFont("SVG_40"), w / 2, h / 2, clr_white, 1, 1)
        end

        function self.button_accept:DoClick()
            net.Start("aphone_Phone")
                net.WriteUInt(2, 4)
            net.SendToServer()
        end

        self.button_accept:aphone_RemoveCursor()
    end

    surface.SetFont(aphone:GetFont("SVG_76"))
    local fc_x, fc_y = surface.GetTextSize("E")

    local fc = vgui.Create("DButton", self)
    fc:SetPos(main_x * 0.1, main_x * 0.1)
    fc:SetSize(main_x * 0.1, main_x * 0.1)
    fc:SetFont(aphone:GetFont("SVG_40"))
    fc:SetText("E")
    fc:SetPaintBackground(false)
    fc:SetEnabled(!aphone.Call.Infos.pending)
    fc:SetAlpha(!aphone.Call.Infos.pending and 255 or 0)
    fc:SetTextColor(aphone.Call.Infos.facetime and clr_white or clr_white120)

    function fc:DoClick()
        aphone.Call.Infos.facetime = !aphone.Call.Infos.facetime
        self:SetTextColor(aphone.Call.Infos.facetime and clr_white or clr_white120)

        net.Start("aphone_Phone")
            net.WriteUInt(4, 4)
        net.SendToServer()
    end

    local msg = vgui.Create("DButton", self)
    msg:SetPos(main_x * 0.1, main_x * 0.2)
    msg:SetSize(main_x * 0.1, main_x * 0.1)
    msg:SetFont(aphone:GetFont("SVG_40"))
    msg:SetText("n")
    msg:SetPaintBackground(false)
    msg:SetEnabled(!aphone.Call.Infos.pending)
    msg:SetAlpha(!aphone.Call.Infos.pending and 255 or 0)
    msg:Phone_AlphaHover()

    function msg:DoClick()
        local msg_pnl = vgui.Create("aphone_Msg", self:GetParent())
        msg_pnl:InitPly(aphone.Call.Infos.target)
    end

    self.msg = msg
    self.fc = fc

    aphone.Call.Panel = self
    self:aphone_RemoveCursor()
end

function PANEL:Accepted()
    if IsValid(self.button_accept) then
        self.button_accept:Remove()
        self.button_refuse:MoveTo(self:GetWide() * 0.5 - self.button_refuse:GetParent():GetTall() / 2, 0, 0.5, 0, 0.5)
    end

    self.fc:SetEnabled(true)
    self.fc:SetAlpha(0)
    self.fc:AlphaTo(255, 0.5, 0)

    self.msg:SetEnabled(true)
    self.msg:SetAlpha(0)
    self.msg:AlphaTo(255, 0.5, 0)
end

function PANEL:OnRemove()
    self:GetParent():SetMouseInputEnabled(true)
    self:SetMouseInputEnabled(false)
    aphone.RenderView_End("phoneCamSelf")
    aphone.RenderView_End("phoneCam")
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(color_white)
    surface.SetMaterial(aphone.GUI.GetBackground())
    surface.DrawTexturedRect(0, 0, w, h)

    if self.backgroundavatar then
        self.backgroundavatar:PaintManual()
    end

    aphone.blur_rt(8 * (h/w), 8, 2)

    if aphone.Call.Infos.target_facetime and IsValid(aphone.Call.Infos.target) then
        // Better use power of 2 numbers for RenderTarget
        local localply = aphone.Call.Infos.target
        local ang = localply:EyeAngles()
        local pos = localply:EyePos()
        local wep = localply:GetActiveWeapon()
        local is_out = IsValid(wep) and wep:GetClass() == "aphone"

        surface.SetDrawColor(color_black)
        surface.DrawRect(0, 0, w, h)

        if is_out then
            local atta = wep:GetAttachment(1)
            local tr = util.TraceLine({
                start = pos,
                endpos = atta.Pos + atta.Ang:Forward() * 5,
                collisiongroup = COLLISION_GROUP_WORLD,
            })

            if !tr.Hit then
                aphone.RenderView_Start("phoneCam", {
                    origin = tr.HitPos,
                    angles = ang,
                    fov = 90,
                    x = 0, y = 0,
                    w = 1024, h = 1024,
                })

                surface.SetMaterial(aphone.RenderView_RequestTexture("phoneCam"))
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(w / 2 - h / 2, 0, h, h)
            end
        end
    else
        aphone.RenderView_End("phoneCam")
    end

    if aphone.Call.Infos.facetime then
        // Better use power of 2 numbers for RenderTarget
        local localply = LocalPlayer()
        local ang = localply:EyeAngles()
        local pos = EyePos()

        local tr = util.TraceLine({
            start = EyePos(),
            endpos = pos + ang:Forward() * 10,
            collisiongroup = COLLISION_GROUP_WORLD,
        })

        aphone.RenderView_Start("phoneCamSelf", {
            origin = tr.HitPos,
            angles = ang,
            fov = 90,
            x = 0, y = 0,
            w = 1024, h = 1024,
        })

        surface.SetDrawColor(color_white)
        surface.DrawRect(w * 0.1-2, h - w/4 - w*0.1-2, w/4+4, w/4+4)

        surface.SetMaterial(aphone.RenderView_RequestTexture("phoneCamSelf"))
        surface.SetDrawColor(color_white)
        surface.DrawTexturedRect(w * 0.1, h - w/4 - w*0.1, w/4, w/4)
    else
        aphone.RenderView_End("phoneCamSelf")
    end
end

local old_ratio = 0
function PANEL:Think()
    if !aphone.Call.Infos then
        timer.Remove("aphone_DringSound")
        self:Remove()
    elseif self.player_calling:IsVisible() then
        if self.avatar_outline then
            self.avatar_outline:SetVisible(!aphone.Call.Infos.target_facetime)
            local ratio = 0

            if IsValid(aphone.Call.Infos.target) then
                ratio = aphone.Call.Infos.target:VoiceVolume()*2
            end

            if old_ratio > ratio and old_ratio > 0 then
                old_ratio = old_ratio - 0.03
            else
                old_ratio = ratio
            end

            self.avatar_outline.colorbg.r = Lerp(old_ratio, 46, 52)
            self.avatar_outline.colorbg.g = Lerp(old_ratio, 204, 152)
            self.avatar_outline.colorbg.b = Lerp(old_ratio, 113, 219)
        end

        self.player_calling:SetVisible(!aphone.Call.Infos.target_facetime)
        self.player_name:SetVisible(!aphone.Call.Infos.target_facetime)
        self.player_num:SetVisible(!aphone.Call.Infos.target_facetime)
    end
end

vgui.Register("aphone_Call", PANEL)
--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_messagepanel.lua:
local PANEL = {}

local empty_color = Color(155, 89, 182)
function PANEL:Init(revert)
	self:SetPaintBackground(false)
	self.bgcolor = empty_color
	self.font = aphone:GetFont("MediumHeader")

	local self_pnl = self

	self.avatar_maindock = vgui.Create("DPanel", self)
	self.avatar_maindock:Dock(revert and RIGHT or LEFT)
	self.avatar_maindock:SetWide(aphone.GUI.ScaledSizeX(48))
	self.avatar_maindock:SetPaintBackground(false)

	self.avatar = vgui.Create("aphone_CircleAvatar", self.avatar_maindock)
	self.avatar:Dock(BOTTOM)
	self.avatar:SetTall(self.avatar_maindock:GetWide())
	self.avatar:SetPlayer(LocalPlayer(), 64)
	self.avatar.ignorestencil = true

	self.text_maindock = vgui.Create("DPanel", self)
	self.text_maindock:Dock(FILL)
	self.text_maindock:SetPaintBackground(false)
	self.text_maindock:DockMargin(aphone.GUI.ScaledSize(!revert and 10 or 0, 0, revert and 10 or 0, 0))

	function self.text_maindock:Paint(w, h)
		if !self_pnl.wrapped_text then
			self_pnl.wrapped_text = aphone.GUI.WrapText(self_pnl.text, self_pnl.font, w-32)

			// Font already set by wraptext
			local _, h1_y = surface.GetTextSize(self_pnl.wrapped_text)
			local h2 = IsValid(self_pnl.avatar) and self_pnl.avatar:GetTall() or 0

			h1_y = h1_y + 32

			self_pnl:SetTall(h1_y > h2 and h1_y or h2)
		end
		draw.RoundedBox(16, 0, 0, w, h, self:GetParent().bgcolor)
		draw.DrawText(self_pnl.wrapped_text or "Placeholder", self_pnl.font, 16, 16, color_white, 0)
	end

	self:aphone_RemoveCursor()

	self.revert = revert
end

function PANEL:KillAvatar()
	self.avatar_maindock:Remove()

	if !self.revert then
		self.text_maindock:DockMargin(aphone.GUI.ScaledSizeX(10), 0, aphone.GUI.ScaledSizeX(48), 0)
	else
		self.text_maindock:DockMargin(aphone.GUI.ScaledSizeX(48), 0, aphone.GUI.ScaledSizeX(10), 0)
	end
end

function PANEL:SetText(t)
	self.text = t
	self.wrapped_text = nil
end

function PANEL:SetAvatar(ply, size)
	self.avatar:SetPlayer(ply, size)
end

function PANEL:GetText()
	return self.text
end

function PANEL:SetFont(n)
	self.text:SetFont(n)
	self:RecalculateHeight()
end

function PANEL:SetBackgroundColor(clr)
	self.bgcolor = clr
end

function PANEL:Left_Avatar(b)
	self:Clear()
	self:Init(b)
end

vgui.Register("aphone_Message", PANEL, "DPanel")
--PATH addons/sl_aphone/lua/aphone/_libs/printers/sh_rprint.lua:
hook.Add("PostGamemodeLoaded", "APhone_LoadPrinter_RPrint", function()
    if rPrint then
        aphone.Printer = aphone.Printer or {}

        function aphone.Printer.GetPrinters(ply)
            local tbl = {}

            for k, v in ipairs(ents.FindByClass("rprint*")) do
                if v:CPPIGetOwner() == ply or v:Getowning_ent() == ply then
                    table.insert(tbl, v)
                end
            end

            return tbl
        end

        function aphone.Printer.FormatMoney(amt)
            return aphone.Gamemode.Format(amt)
        end

        function aphone.Printer.GetInfo(ents)
            local capacity = 0
            local money = 0
            local sec = 0
            local danger = 0

            for k, v in ipairs(ents or {}) do
                if IsValid(v) then
                    money = money + v:GetMoney()
                    capacity = money

                    if (v:GetPower() > 0) then
                        sec = sec + v.Params.PrintRate*60
                    end

                    danger = danger + (v:GetTemp() < v.Params.TempMax and 0 or 1)
                else
                    ents[k] = nil
                end
            end

            return {
                [1] = {
                    val = money,
                    name = "money",
                },

                [2] = {
                    val = sec,
                    name = "sec",
                },

                [3] = {
                    val = capacity,
                    name = "capacity",
                },

                [4] = {
                    val = danger,
                    name = "danger",
                },
            }, ents
        end
    end
end)
--PATH addons/sl_aphone/lua/aphone/apps/dodgeit/cl_init.lua:
local APP = {}

APP.name = "DodgeIt!"
APP.icon = "akulla/aphone/app_dodgeit.png"

local clr = {
    Color(29, 209, 161),
    Color(72, 219, 251),
    Color(255, 107, 107),
    Color(255, 159, 67),
    Color(254, 202, 87),
    Color(255, 159, 243),
    Color(95, 39, 205),
    Color(200, 214, 229),
}

function APP:Open(main, main_x, main_y, horizontal)
    local color_black2 = aphone:Color("Black2")
    local color_white180 = aphone:Color("Text_White180")
    local round_time = CurTime()
    local Roboto60 = aphone:GetFont("Roboto60")
    local svg_30 = aphone:GetFont("SVG_30")

    local balls = {}

    function main:Paint(w, h)
        surface.SetDrawColor(color_black2)
        surface.DrawRect(0,0,w,h)

        draw.SimpleText(math.Round(CurTime() - round_time) .. "s", Roboto60, w / 2, h / 5, color_white180, 1, 1)
    end

    local s = main_x < main_y and main_x * 0.1 or main_y * 0.1

    local end_game = vgui.Create("DPanel", main)
    end_game:Dock(FILL)
    end_game:SetVisible(false)
    end_game:SetAlpha(0)

    function end_game:Paint(w, h)
        surface.SetDrawColor(color_black2)
        surface.DrawRect(0,0,w,h)

        draw.SimpleText(end_game.win_time .. "s", Roboto60, w / 2, h / 5, color_white180, 1, 1)
    end

    local restart = vgui.Create("DLabel", end_game)
    restart:SetFont(Roboto60)
    restart:SetContentAlignment(5)
    restart:Dock(FILL)
    restart:SetText(aphone.L("Restart"))
    restart:SetTextColor(color_white180)
    restart:Phone_AlphaHover()
    restart:SetMouseInputEnabled(true)

    function restart:DoClick()
        round_time = CurTime()
        timer.UnPause("APhone_DodgeIt")
        timer.Adjust("APhone_DodgeIt", 1)

        end_game:AlphaTo(0, 0.25, 0, function()
            end_game:SetVisible(false)
        end)
    end

    timer.Create("APhone_DodgeIt", 1, 0, function()
        local dir = math.random(1, 4)
        local move_x, move_y
        local c = vgui.Create("DPanel", main)

        c:SetSize(s, s)

        if dir == 1 then
            local val = math.random(0, main_y)
            c:SetPos(0, val)
            move_x, move_y = main_x + s, val
        elseif dir == 2 then
            local val = math.random(0, main_y)
            c:SetPos(main_x, val)
            move_x, move_y = -s, val
        elseif dir == 3 then
            local val = math.random(0, main_x)
            c:SetPos(val, 0)
            move_x = val
            move_y = main_y + s
        elseif dir == 4 then
            local val = math.random(0, main_x)
            c:SetPos(val, main_y)
            move_x, move_y = val, -s
        end

        c:MoveTo(move_x, move_y, 1, 0, 1, function()
            c:Remove()
            table.RemoveByValue(balls, c)
        end)

        local random_clr = clr[ math.random( #clr ) ]

        function c:Paint(w, h)
            draw.SimpleText("d", svg_30, w / 2, h / 2, random_clr, 1, 1)

            // He hover a ball ? then he lost
            // Cursor not visible ? Then he is cheating, make him lose
            if self:IsHovered() and !end_game:IsVisible() then
                end_game.win_time = math.Round(CurTime() - round_time)

                end_game:SetVisible(true)
                end_game:AlphaTo(255, 0.5, 0)
                timer.Pause( "APhone_DodgeIt" )
            end
        end

        local time = timer.TimeLeft("APhone_DodgeIt") - 0.03
        time = (time >= 0.20) and time or 0.20

        timer.Adjust("APhone_DodgeIt", time)

        table.insert(balls, c)
    end)

    function main:Think()
        if !aphone.cursor_visible and !end_game:IsVisible() then
            end_game.win_time = math.Round(CurTime() - round_time)

            end_game:SetVisible(true)
            end_game:AlphaTo(255, 0.5, 0)
            timer.Pause( "APhone_DodgeIt" )
        end
    end

    main:aphone_RemoveCursor()
end

function APP:Open2D(main, main_x, main_y)
    APP:Open(main, main_x, main_y, true)
end

aphone.RegisterApp(APP)
--PATH addons/darkrp_old_advert/lua/autorun/darkrp-full-classic-advert.lua:
local function init()
	if not DarkRP then
		MsgC(Color(255,0,0), "DarkRP Classic Advert tried to run, but DarkRP wasn't declared!\n")
		return
	end

	DarkRP.removeChatCommand("advert")
	DarkRP.declareChatCommand({
		command = "advert",
		description = "Displays an advertisement to everyone in chat.",
		delay = 1.5
	})
	
	if SERVER then
		DarkRP.defineChatCommand("advert",function(ply,args)
			if args == "" then
				DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
				return ""
			end
			local DoSay = function(text)
				if text == "" then
					DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
					return
				end
				for k,v in pairs(player.GetAll()) do
					local col = team.GetColor(ply:Team())
					DarkRP.talkToPerson(v, col, "[Advert] " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
				end
			end
			hook.Call("playerAdverted", nil, ply, args)
			return args, DoSay
		end, 1.5)
	else
		DarkRP.addChatReceiver("/advert", "advertise", function(ply) return true end)
	end
end

if SERVER then
	if #player.GetAll() > 0 then
		init()
	else
		hook.Add("PlayerInitialSpawn", "dfca-load", init)
	end
else
	hook.Add("InitPostEntity", "dfca-load", init)
end

--PATH lua/drgbase/colors.lua:
-- Opaque --

DrGBase.CLR_WHITE = Color(255, 255, 255)
DrGBase.CLR_GREEN = Color(150, 255, 40)
DrGBase.CLR_RED = Color(255, 50, 50)
DrGBase.CLR_CYAN = Color(0, 200, 200)
DrGBase.CLR_PURPLE = Color(220, 40, 115)
DrGBase.CLR_BLUE = Color(50, 100, 255)
DrGBase.CLR_ORANGE = Color(255, 150, 30)
DrGBase.CLR_DARKGRAY = Color(20, 20, 20)
DrGBase.CLR_LIGHTGRAY = Color(200, 200, 200)

-- Transparent --

local function Transparent(color)
	color = color:ToVector():ToColor()
	color.a = 0
	return color
end

DrGBase.CLR_WHITE_TR = Transparent(DrGBase.CLR_WHITE)
DrGBase.CLR_GREEN_TR = Transparent(DrGBase.CLR_GREEN)
DrGBase.CLR_RED_TR = Transparent(DrGBase.CLR_RED)
DrGBase.CLR_CYAN_TR = Transparent(DrGBase.CLR_CYAN)
DrGBase.CLR_PURPLE_TR = Transparent(DrGBase.CLR_PURPLE)
DrGBase.CLR_BLUE_TR = Transparent(DrGBase.CLR_BLUE)
DrGBase.CLR_ORANGE_TR = Transparent(DrGBase.CLR_ORANGE)
DrGBase.CLR_DARKGRAY_TR = Transparent(DrGBase.CLR_DARKGRAY)
DrGBase.CLR_LIGHTGRAY_TR = Transparent(DrGBase.CLR_LIGHTGRAY)

--PATH lua/drgbase/entity_helpers.lua:
if not istable(ENT) then return end

-- Print --

function ENT:PrintPoseParameters()
	for i = 0, (self:GetNumPoseParameters()-1) do
		local min, max = self:GetPoseParameterRange(i)
		print(self:GetPoseParameterName(i).." "..min.." / "..max)
	end
end
function ENT:PrintAnimations()
	for i, seq in pairs(self:GetSequenceList()) do
		local act = self:GetSequenceActivity(i)
		if act ~= -1 then
			print(i.." => "..seq.." / "..act.." => "..self:GetSequenceActivityName(i))
		else
			print(i.." => "..seq.." / -1")
		end
	end
end
function ENT:PrintBones()
	for i = 0, (self:GetBoneCount()-1) do
		local bonename = self:GetBoneName(i)
		if bonename == nil then continue end
		print(i.." => "..bonename)
	end
end
function ENT:PrintAttachments()
	for i, attach in ipairs(self:GetAttachments()) do
		print(attach.id.." => "..attach.name)
	end
end
function ENT:PrintBodygroups()
	for i, group in ipairs(self:GetBodyGroups()) do
		print(group.id.." => "..group.name.." ("..group.num.." subgroups)")
	end
end

-- Timers --

function ENT:Timer(...)
	return self:DrG_Timer(...)
end
function ENT:LoopTimer(...)
	return self:DrG_LoopTimer(...)
end

-- Traces --

function ENT:TraceLine(vec, data)
	return self:DrG_TraceLine(vec, data)
end
function ENT:TraceHull(vec, data)
	return self:DrG_TraceHull(vec, data)
end
function ENT:TraceLineRadial(distance, precision, data)
	return self:DrG_TraceLineRadial(distance, precision, data)
end
function ENT:TraceHullRadial(distance, precision, data)
	return self:DrG_TraceHullRadial(distance, precision, data)
end

-- Misc --

function ENT:ScreenShake(amplitude, frequency, duration, radius)
	return util.ScreenShake(self:GetPos(), amplitude, frequency, duration, radius)
end

function ENT:GetCooldown(name)
	local delay = self:GetNW2Float("DrGBaseCooldowns/"..tostring(name), false)
	if delay ~= false then
		return math.Clamp(delay - CurTime(), 0, math.huge)
	else return 0 end
end

--[[function ENT:GetScale()
	return self:GetModelScale()
end
function ENT:SetScale(scale)
	return self:SetModelScale(scale)
end
function ENT:Scale(scale)
	return self:SetModelScale(self:GetModelScale()*scale)
end]]

-- Net --

function ENT:NetMessage(name, ...)
	return net.DrG_Send("DrGBaseEntMessage", name, self, ...)
end
function ENT:_HandleNetMessage() end
function ENT:OnNetMessage() end

if SERVER then
	AddCSLuaFile()

	-- Misc --

	function ENT:RandomPos(min, max)
		return self:DrG_RandomPos(min, max)
	end

	function ENT:SetCooldown(name, delay)
		self:SetNW2Float("DrGBaseCooldowns/"..tostring(name), CurTime() + delay)
	end

	function ENT:PushEntity(ent, force)
		if istable(ent) then
			local vecs = {}
			for i, en in ipairs(ent) do
				if not IsValid(en) then continue end
				vecs[en:EntIndex()] = self:PushEntity(en, force)
			end
			return vecs
		elseif isentity(ent) and IsValid(ent) then
			local direction = self:GetPos():DrG_Direction(ent:GetPos())
			local forward = direction
			forward.z = 0
			forward:Normalize()
			local right = Vector()
			right:Set(forward)
			right:Rotate(Angle(0, -90, 0))
			local up = Vector(0, 0, 1)
			local vec = forward*force.x + right*force.y + up*force.z
			local phys = ent:GetPhysicsObject()
			if ent:IsNextBot() then
				local jumpHeight = ent.loco:GetJumpHeight()
				local seq = ent:GetSequence()
				local rate = ent:GetPlaybackRate()
				local cycle = ent:GetCycle()
				ent.loco:SetJumpHeight(1)
				ent.loco:Jump()
				ent.loco:SetJumpHeight(jumpHeight)
				ent.loco:SetVelocity(ent.loco:GetVelocity()+vec)
				ent:ResetSequence(seq)
				ent:SetPlaybackRate(rate)
				ent:SetCycle(cycle)
			elseif IsValid(phys) and not ent:IsPlayer() then
				phys:AddVelocity(vec)
			else ent:SetVelocity(ent:GetVelocity()+vec) end
			return vec
		end
	end

	-- Net --

	net.DrG_Receive("DrGBaseEntMessage", function(ply, name, self, ...)
		if not IsValid(self) then return end
		if not self.IsDrGEntity then return end
		if not self:_HandleNetMessage(name, ply, ...) then
			self:OnNetMessage(name, ply, ...)
		end
	end)
	function ENT:CallOnClient(name, ...)
		if not isstring(name) then return end
		return self:NetMessage("DrGBaseCallOnClient", name, ...)
	end

	function ENT:NetCallback(name, callback, ply, ...)
		if not isfunction(callback) then return end
		if not ply:IsPlayer() then return end
		return ply:DrG_NetCallback(name, function(...)
			if IsValid(self) then callback(self, ...) end
		end, self, ...)
	end

	-- Effects --

	function ENT:ParticleEffect(effect, ...)
		return self:DrG_ParticleEffect(effect, ...)
	end
	function ENT:DynamicLight(color, radius, brightness, style, attachment)
		return self:DrG_DynamicLight(color, radius, brightness, style, attachment)
	end

else

	-- Net --

	local function ReceiveMessage(name, self, ...)
		if not IsValid(self) then return end
		if isfunction(self._HandleNetMessage) and isfunction(self.OnNetMessage) then
			if name == "DrGBaseCallOnClient" then
				local args, n = table.DrG_Pack(...)
				local functionName = table.remove(args, 1)
				if isfunction(self[functionName]) then
					self[functionName](self, table.DrG_Unpack(args, n-1))
				end
			elseif not self:_HandleNetMessage(name, ...) then self:OnNetMessage(name, ...) end
		else timer.DrG_Simple(engine.TickInterval(), ReceiveMessage, name, self, ...) end
	end
	net.DrG_Receive("DrGBaseEntMessage", ReceiveMessage)
	function ENT:NetCallback(name, callback, ...)
		if not isfunction(callback) then return end
		return net.DrG_UseCallback(name, function(...)
			if IsValid(self) then callback(self, ...) end
		end, self, ...)
	end

	-- Effects --

	function ENT:DynamicLight(color, radius, brightness, style, attachment)
		return self:DrG_DynamicLight(color, radius, brightness, style, attachment)
	end

end

--PATH lua/drgbase/weapons.lua:

-- Registry --

function DrGBase.AddWeapon(SWEP)
	local class = string.Replace(SWEP.Folder, "weapons/", "")
	if SWEP.PrintName == nil or SWEP.Category == nil then return end
	if CLIENT then
		language.Add(class, SWEP.PrintName)
		SWEP.Killicon = SWEP.Killicon or {
			icon = "HUD/killicons/default",
			color = Color(255, 80, 0, 255)
		}
		killicon.Add(class, SWEP.Killicon.icon, SWEP.Killicon.color)
	else resource.AddFile("materials/weapons/"..class..".png") end
	list.Set("DrGBaseWeapons", class, {
		Name = SWEP.PrintName,
		Class = class,
		Category = SWEP.Category
	})
	DrGBase.Print("Weapon '"..class.."': loaded.")
end

hook.Add("PopulateDrGBaseSpawnmenu", "AddDrGBaseWeapons", function(pnlContent, tree, node)
	local list = list.Get("DrGBaseWeapons")
	local categories = {}
	for class, ent in pairs(list) do
		local category = ent.Category or "Other"
		local tab = categories[category] or {}
		tab[class] = ent
		categories[category] = tab
	end
	local weaponsTree = tree:AddNode("Weapons", "icon16/gun.png")
	for categoryName, category in SortedPairs(categories) do
		local icon = DrGBase.GetIcon(categoryName) or "icon16/gun.png"
		if categoryName == "DrGBase" then icon = DrGBase.Icon end
		local node = weaponsTree:AddNode(categoryName, icon)
		node.DoPopulate = function(self)
			if self.PropPanel then return end
			self.PropPanel = vgui.Create("ContentContainer", pnlContent)
			self.PropPanel:SetVisible(false)
			self.PropPanel:SetTriggerSpawnlistChange(false)
			for class, ent in SortedPairsByMemberValue(category, "Name") do
				spawnmenu.CreateContentIcon("weapon", self.PropPanel, {
					nicename	= ent.Name or class,
					spawnname	= class,
					material	= "entities/"..class..".png",
					admin	= ent.AdminOnly or false
				})
			end
		end
		node.DoClick = function(self)
			self:DoPopulate()
			pnlContent:SwitchPanel(self.PropPanel)
		end
	end
	local firstNode = tree:Root():GetChildNode(0)
	if IsValid(firstNode) then
		firstNode:InternalDoClick()
	end
end)

-- Misc --

local PlayersCanGiveWeapons = CreateConVar("drgbase_give_weapons", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

properties.Add("drgbasegiveweapons", {
	MenuLabel = "Give Current Weapon",
	Order = 1001,
	MenuIcon = "icon16/gun.png",
	Filter = function(self, ent, ply)
		return ent.IsDrGNextbot and
		ent.UseWeapons and
		ent.AcceptPlayerWeapons and
		PlayersCanGiveWeapons:GetBool()
	end,
	Action = function(self, ent)
		self:MsgStart()
		net.WriteEntity(ent)
		self:MsgEnd()
	end,
	Receive = function(self, len, ply)
		local ent = net.ReadEntity()
		if not IsValid(ent) then return end
		local wep = ply:GetActiveWeapon()
		ent:SetActiveWeapon(ent:GiveWeapon(wep:GetClass()))    
	end
})

properties.Add("drgbasestripweapons", {
	MenuLabel = "Strip Weapon",
	Order = 1002,
	MenuIcon = "icon16/gun.png",
	Filter = function(self, ent, ply)
		return ent.IsDrGNextbot and
		ent.UseWeapons and
		ent.AcceptPlayerWeapons and
		PlayersCanGiveWeapons:GetBool()
	end,
	Action = function(self, ent)
		self:MsgStart()
		net.WriteEntity(ent)
		self:MsgEnd()
	end,
	Receive = function(self, len, ply)
		local ent = net.ReadEntity()
		if not IsValid(ent) then return end
		ent:RemoveWeapon()
	end
})

--PATH lua/drgbase/meta/player.lua:
local UpdateLuminosity = CreateConVar("drgbase_update_luminosity", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

local plyMETA = FindMetaTable("Player")

function plyMETA:DrG_IsPossessing()
	return IsValid(self:DrG_Possessing())
end
function plyMETA:DrG_Possessing()
	return self:GetNW2Entity("DrGBasePossessing")
end
function plyMETA:DrG_GetPossessing()
	return self:DrG_Possessing()
end

hook.Add("PlayerButtonDown", "DrGBasePlayerButtonDown", function(ply, button)
	ply._DrGBaseButtonsDown = ply._DrGBaseButtonsDown or {}
	ply._DrGBaseButtonsDown[button] = {
		down = true, time = CurTime()
	}
end)
hook.Add("PlayerButtonUp", "DrGBasePlayerButtonUp", function(ply, button)
	ply._DrGBaseButtonsDown = ply._DrGBaseButtonsDown or {}
	ply._DrGBaseButtonsDown[button] = {
		down = false, time = CurTime()
	}
end)
function plyMETA:DrG_ButtonUp(button)
	self._DrGBaseButtonsDown = self._DrGBaseButtonsDown or {}
	local data = self._DrGBaseButtonsDown[button]
	if data == nil then return true end
	return not data.down
end
function plyMETA:DrG_ButtonPressed(button)
	self._DrGBaseButtonsDown = self._DrGBaseButtonsDown or {}
	local data = self._DrGBaseButtonsDown[button]
	if data == nil then return false end
	return data.down and data.time == CurTime()
end
function plyMETA:DrG_ButtonDown(button)
	self._DrGBaseButtonsDown = self._DrGBaseButtonsDown or {}
	local data = self._DrGBaseButtonsDown[button]
	if data == nil then return false end
	return data.down or false
end
function plyMETA:DrG_ButtonReleased(button)
	self._DrGBaseButtonsDown = self._DrGBaseButtonsDown or {}
	local data = self._DrGBaseButtonsDown[button]
	if data == nil then return false end
	return not data.down and data.time == CurTime()
end

-- Toolgun --

function plyMETA:DrG_GetSelectionTable(mode)
	self._DrGBaseSelectionTables = self._DrGBaseSelectionTables or {}
	if isstring(mode) then
		self._DrGBaseSelectionTables[mode] = self._DrGBaseSelectionTables[mode] or {}
		return self._DrGBaseSelectionTables[mode]
	else
		local tool = self:GetTool()
		if tool == nil then return {}
		else return self:DrG_GetSelectionTable(tool.Mode) end
	end
end

local function NextSelectedEntity(ply, previous, mode)
	local ent = next(ply:DrG_GetSelectionTable(mode), previous)
	if ent == nil then return nil
	elseif not IsValid(ent) then
		return NextSelectedEntity(ply, ent, mode)
	else return ent end
end
function plyMETA:DrG_SelectedEntities(mode)
	return function(inv, previous)
		return NextSelectedEntity(self, previous, mode)
	end
end
function plyMETA:DrG_GetSelectedEntities(mode)
	local entities = {}
	for ent in self:DrG_SelectedEntities(mode) do
		table.insert(entities, ent)
	end
	return entities
end
function plyMETA:DrG_IsEntitySelected(ent, mode)
	return self:DrG_GetSelectionTable(mode)[ent] or false
end

if SERVER then

	-- Toolgun --

	util.AddNetworkString("DrGBaseSelectEntity")
	function plyMETA:DrG_SelectEntity(ent, mode)
		if not IsValid(ent) then return end
		self:DrG_GetSelectionTable(mode)[ent] = true
		net.Start("DrGBaseSelectEntity")
		net.WriteEntity(ent)
		if isstring(mode) then
			net.WriteBool(true)
			net.WriteString(mode)
		else net.WriteBool(false) end
		net.Send(self)
	end

	util.AddNetworkString("DrGBaseDeselectEntity")
	function plyMETA:DrG_DeselectEntity(ent, mode)
		if not IsValid(ent) then return end
		self:DrG_GetSelectionTable(mode)[ent] = nil
		net.Start("DrGBaseDeselectEntity")
		net.WriteEntity(ent)
		if isstring(mode) then
			net.WriteBool(true)
			net.WriteString(mode)
		else net.WriteBool(false) end
		net.Send(self)
	end

	function plyMETA:DrG_ClearSelectedEntities(mode)
		for ent in self:DrG_SelectedEntities(mode) do
			self:DrG_DeselectEntity(ent, mode)
		end
	end

	function plyMETA:DrG_ToggleEntitySelect(ent, mode)
		if self:DrG_IsEntitySelected(ent, mode) then
			self:DrG_DeselectEntity(ent, mode)
		else self:DrG_SelectEntity(ent, mode) end
	end

	function plyMETA:DrG_CleverEntitySelect(ent, mode)
		local selected = self:DrG_GetSelectedEntities(mode)
		if (#selected > 1 or selected[1] ~= ent) and
		not self:KeyDown(IN_SPEED) then
			self:DrG_ClearSelectedEntities(mode)
		end
		self:DrG_ToggleEntitySelect(ent, mode)
	end

	function plyMETA:DrG_SingleEntitySelect(ent, mode)
		if not self:DrG_IsEntitySelected(ent, mode) then
			self:DrG_ClearSelectedEntities(mode)
			self:DrG_SelectEntity(ent, mode)
		else self:DrG_DeselectEntity(ent, mode) end
	end

	hook.Add("SetupPlayerVisibility", "DrGBaseSelectedEntitiesAddToPVS", function(ply)
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
		if ply:GetTool() == nil then return end
		for ent in ply:DrG_SelectedEntities() do
			AddOriginToPVS(ent:GetPos())
		end
	end)

	-- Factions --

	function plyMETA:DrG_JoinFaction(faction)
		self:DrG_InitFactions()
		if self:DrG_IsInFaction(faction) then return end
		self._DrGBaseFactions[string.upper(faction)] = true
		for i, nextbot in ipairs(DrGBase.GetNextbots()) do
			nextbot:UpdateRelationshipWith(self)
		end
	end
	function plyMETA:DrG_LeaveFaction(faction)
		self:DrG_InitFactions()
		if not self:DrG_IsInFaction(faction) then return end
		self._DrGBaseFactions[string.upper(faction)] = false
		for i, nextbot in ipairs(DrGBase.GetNextbots()) do
			nextbot:UpdateRelationshipWith(self)
		end
	end
	function plyMETA:DrG_IsInFaction(faction)
		self:DrG_InitFactions()
		return self._DrGBaseFactions[string.upper(faction)] or false
	end
	function plyMETA:DrG_GetFactions()
		self:DrG_InitFactions()
		local factions = {}
		for faction, joined in pairs(self._DrGBaseFactions) do
			if joined then table.insert(factions, faction) end
		end
		return factions
	end
	function plyMETA:DrG_InitFactions()
		self._DrGBaseFactions = self._DrGBaseFactions or {}
	end
	function plyMETA:DrG_JoinFactions(factions)
		for i, faction in ipairs(factions) do
			self:DrG_JoinFaction(faction)
		end
	end
	function plyMETA:DrG_LeaveFactions(factions)
		for i, faction in ipairs(factions) do
			self:DrG_LeaveFaction(faction)
		end
	end
	function plyMETA:DrG_LeaveAllFactions()
		self:DrG_LeaveFactions(self:DrG_GetFactions())
	end

	-- Misc --

	util.AddNetworkString("DrGBasePlayerLuminosity")
	net.Receive("DrGBasePlayerLuminosity", function(len, ply)
		ply._DrGBaseLuminosity = net.ReadFloat()
	end)
	function plyMETA:DrG_Luminosity()
		return self._DrGBaseLuminosity or 1
	end

	function plyMETA:DrG_Immobilize()
		local chair = ents.Create("prop_vehicle_prisoner_pod")
		if not chair then return end
		chair:SetModel("models/nova/airboat_seat.mdl")
		chair:SetKeyValue("vehiclescript", "scripts/vehicles/prisoner_pod.txt")
		chair:SetPos(self:GetPos())
		chair:SetAngles(self:GetAngles())
		chair:SetNoDraw(true)
		chair:Spawn()
		self:EnterVehicle(chair)
	end

	function plyMETA:DrG_AddUndo(ent, type, text)
		undo.Create(type)
		undo.SetPlayer(self)
		undo.AddEntity(ent)
		if not isstring(text) then
			undo.SetCustomUndoText("Undone #"..ent:GetClass())
		else undo.SetCustomUndoText(text) end
		undo.Finish()
	end

	function plyMETA:DrG_NetCallback(name, callback, ...)
		return net.DrG_UseCallback(name, callback, self, ...)
	end

else

	-- Toolgun --

	net.Receive("DrGBaseSelectEntity", function()
		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local mode = net.ReadBool() and net.ReadString()
		if IsValid(ent) then
			ply:DrG_GetSelectionTable(mode)[ent] = true
		end
	end)
	net.Receive("DrGBaseDeselectEntity", function()
		local ply = LocalPlayer()
		local ent = net.ReadEntity()
		local mode = net.ReadBool() and net.ReadString()
		if IsValid(ent) then
			ply:DrG_GetSelectionTable(mode)[ent] = nil
		end
	end)

	-- Misc --

	local LAST_LUX_UPDATE = 0
	hook.Add("Think", "DrGBasePlayerLuminosity", function()
		if not UpdateLuminosity:GetBool() then return end
		if CurTime() <= LAST_LUX_UPDATE + 1 then return end
		LAST_LUX_UPDATE = CurTime()
		net.Start("DrGBasePlayerLuminosity")
		net.WriteFloat(LocalPlayer():DrG_Luminosity())
		net.SendToServer()
	end)
	function plyMETA:DrG_Luminosity()
		local ply = LocalPlayer()
		return math.min(render.GetLightColor(ply:EyePos()):Length()*(1/0.7), 1)
	end

end

--PATH lua/drgbase/modules/render.lua:
if SERVER then return end

function render.DrG_DrawSprite(sprite, pos, size, options)
	options = options or {}
	size = isnumber(size) and math.Clamp(size, 0, math.huge) or 100
	local normal = pos:DrG_Direction(isvector(options.origin) and options.origin or EyePos())
	normal.z = 0
	local material = DrGBase.Material(sprite)
	if material:IsError() then return end
	render.SetMaterial(material)
	local color = options.color or Color(255, 255, 255)
	if options.lighting then
		local light = (render.GetLightColor(pos)*255):ToColor()
		local p = ((light.r + light.g + light.b)/3)/255
		color = Color(color.r*p, color.g*p, color.b*p, color.a)
	end
	render.DrawQuadEasy(pos, normal, size, size, color, (options.rotation or 0) + 180)
end

--PATH addons/sl_util_wallet/lua/ezwallet/shared/checks.lua:


easzy.wallet.checks = easzy.wallet.checks or {}

local function IsTableValidAndNotEmpty(tbl)
    return (tbl and not table.IsEmpty(tbl))
end

local function AlertMissingAddon()
    if not easzy.wallet.checks.compatibility[easzy.wallet.config.driverLicenseSystem] then
        easzy.wallet.PrintError(easzy.wallet.languages.addonNotFound .. " " .. easzy.wallet.config.driverLicenseSystem)
    end
    if not easzy.wallet.checks.compatibility[easzy.wallet.config.weaponLicenseSystem] then
        easzy.wallet.PrintError(easzy.wallet.languages.addonNotFound .. " " .. easzy.wallet.config.weaponLicenseSystem)
    end
    if not easzy.wallet.checks.compatibility[easzy.wallet.config.bankSystem] then
        easzy.wallet.PrintError(easzy.wallet.languages.addonNotFound .. " " .. easzy.wallet.config.bankSystem)
    end
end

hook.Add("InitPostEntity", "ezwallet_checks_InitPostEntity", function()
    easzy.wallet.checks.compatibility = {
        ["Kobralost Advanced Driver License"] = IsTableValidAndNotEmpty(ADL),
        ["ToBadForYou Driver License System"] = IsTableValidAndNotEmpty(TBFYDIConfig),
        ["Kobralost Advanced Weapon License"] = IsTableValidAndNotEmpty(AWLicense),
        ["ToBadForYou Firearms License System"] = IsTableValidAndNotEmpty(TBFY_FAConfig),
        ["Blue's ATM"] = IsTableValidAndNotEmpty(BATM),
        ["SlownLS ATM"] = IsTableValidAndNotEmpty(SlownLS) and IsTableValidAndNotEmpty(SlownLS.ATM),
        ["Glorified Banking"] = IsTableValidAndNotEmpty(GlorifiedBanking),
        ["ARCBank"] = IsTableValidAndNotEmpty(ARCBank),
        ["Better Banking"] = IsTableValidAndNotEmpty(BetterBanking),
        ["Crap-Head ATM"] = IsTableValidAndNotEmpty(CH_ATM)
    }

    AlertMissingAddon()
end)

--PATH addons/gmodadminsuite-config-master/lua/gmodadminsuite_config.lua:
--[[

	   ______                    _____       __          _      _____       _ __     
	  / ____/___ ___  ____  ____/ /   | ____/ /___ ___  (_)___ / ___/__  __(_) /____ 
	 / / __/ __ `__ \/ __ \/ __  / /| |/ __  / __ `__ \/ / __ \\__ \/ / / / / __/ _ \
	/ /_/ / / / / / / /_/ / /_/ / ___ / /_/ / / / / / / / / / /__/ / /_/ / / /_/  __/
	\____/_/ /_/ /_/\____/\__,_/_/  |_\__,_/_/ /_/ /_/_/_/ /_/____/\__,_/_/\__/\___/ 
	                                                                                 
	Welcome to the main config.
	You may have noticed that it's a bit small - but no worries; this is because most configuration
	for GmodAdminSuite is in the menu itself.

]]

-- What chat command should open the GmodAdminSuite main menu?
GAS.Config.ChatCommand = "!gas"

-- In seconds, how long until an inactive player is marked AFK?
GAS.Config.AFKTime = 300

-- Should GmodAdminSuite content (sounds, materials, etc.) be downloaded by users through the Workshop when they join the server?
GAS.Config.WorkshopDL = true

-- Should GmodAdminSuite content be downloaded by users directly from the server when they join? (this is unnecessary if you are using WorkshopDL)
GAS.Config.ServerDL = false

-- Do not delete the following line; your config will break.
return true

--PATH lua/gmodadminsuite/modules/commands/lang/chinese.lua:
return {
    Name = "Chinese",
    Flag = "flags16/cn.png",
    Phrases = function()
        return {
            module_name = "命令管理器",

            no_permission = "对不起，您没有使用这个命令的权限。",
            commands = "命令",
            command = "命令",
            action = "操作",
            help = "帮助",
            new_command = "+ 新命令",
            wiki = "维基",
            run_command = "运行命令",
            edit_command = "编辑命令",
            form_help = "帮助文本...（可选）",
            form_help_tip = "这是在命令菜单的“帮助”列中显示的文本。",
            select_action = "选择操作...",
            hide_in_chat = "在聊天中隐藏？",
            hide_in_chat_tip = "如果选中，当有人输入时命令将不会在聊天中显示。",
            finished = "完成",
            commands_case_insensitive = "所有命令都不区分大小写。",
            ok = "确定",
            cannot_create_command = "无法创建命令！",
            cancel = "取消",
            delete_command = "删除命令",
            copy_command = "复制命令",
            permissions = "权限",
            permissions_editor = "打开权限编辑器",
            permissions_tip = "允许您对用户组和团队/职业进行白名单和黑名单设置。",
            can_access_command = "可以访问命令",
            teams = "团队",
            usergroups = "用户组",
            anyone_can_access = "任何人都可以访问这个命令",
            whitelisted_only = "只有白名单中的人可以访问这个命令",
            non_blacklisted_only = "只有非黑名单中的人可以访问这个命令",
            whitelisted_and_blacklisted = "只有白名单中的人（除了黑名单中的人）可以访问这个命令",
            custom_usergroup = "+ 自定义用户组",
            custom_usergroup_text = "输入用户组",
            custom_usergroup_placeholder = "用户组...",
            reason_usergroup_blacklisted = "您的用户组被禁止使用这个命令。",
            reason_usergroup_not_whitelisted = "您的用户组没有被列入这个命令的白名单。",
            reason_team_blacklisted = "您的团队被禁止使用这个命令。",
            reason_team_not_whitelisted = "您的团队没有被列入这个命令的白名单。",
            saved_exclamation = "已保存！",
            set_position = "设置位置",
            position_set = "位置已设置！",
            set_position_instruction = "前往期望的位置并面向期望的方向",
            set_position_instruction_2 = "完成后，取消固定菜单，然后位置和角度将被保存",

            action_open_commands_menu = "打开命令菜单",
            action_command = "运行控制台命令",
            action_chat = "说出聊天消息",
            action_website = "打开网站",
            action_lua_function_sv = "运行服务器端Lua函数",
            action_lua_function_cl = "运行客户端Lua函数",
            action_gas_module = "打开GAS模块",
            action_teleport = "传送",

            form_action_command = "要运行的控制台命令",
            form_action_chat = "要说的聊天消息",
            form_action_website = "要打开的网站",
            form_action_lua_function_sv = "要运行的服务器端Lua函数",
            form_action_lua_function_cl = "要运行的客户端Lua函数",
            form_action_gas_module = "要打开的GAS模块",
            form_action_teleport = "传送",

            error_command_exists = "这个名称的命令已经存在！",
            error_no_command = "您没有输入命令。",
            error_no_command_execute = "您没有输入要执行的命令。",
            error_no_action = "您没有为这个命令选择一个操作。",
            error_invalid_website = "您输入的网站不是一个有效的URL。",
            error_no_lua_function = "您没有选择要执行的Lua函数。",
            error_no_gas_module = "您没有选择要打开的GAS模块。",
            error_no_position_set = "您没有为这个传送设置位置和角度。",
        }
    end
}

--PATH lua/gmodadminsuite/modules/playerdatabase/lang/chinese.lua:
return {
    Name = "Chinese",
    Flag = "flags16/cn.png",
    Phrases = function()
        return {
            module_name = "玩家数据库",

            right_click_to_focus = "右键点击聚焦",
            steamid = "SteamID",
            name = "名称",
            usergroup = "用户组",
            ip_address = "IP地址",
            last_seen = "最后出现",
            copy_steamid = "复制SteamID",
            copy_steamid64 = "复制SteamID64",
            copy_usergroup = "复制用户组",
            copy_ip_address = "复制IP地址",
            copy_name = "复制名称",
            copy_steam_profile_link = "复制Steam个人资料链接",
            search = "搜索",
            country = "国家",
            copy_country = "复制国家",
            search_usergroup = "搜索用户组",
            search_ip_address = "搜索IP地址",
            search_country = "搜索国家",
            search_name = "搜索名称",
            none = "< 无 >",
            cancel = "取消",
        }
    end
}

--PATH lua/gmodadminsuite/modules/playerdatabase/lang/french.lua:
return {
	Name = "French",
	Flag = "flags16/fr.png",
	Phrases = function() return {

		module_name = "Player Database",

		right_click_to_focus    = "Clic Droit pour faire le focus",
		steamid                 = "SteamID",
		name                    = "Nom",
		usergroup               = "Groupe",
		ip_address              = "Adresse IP",
		last_seen               = "Dernière Connexion",
		copy_steamid            = "Copier SteamID",
		copy_steamid64          = "Copier SteamID64",
		copy_usergroup          = "Copier Groupe d'Utilisateurs",
		copy_ip_address         = "Copier IP Address",
		copy_name               = "Copier Nom",
		copy_steam_profile_link = "Copier Lien de Page de Profil Steam",
		search                  = "Chercher",
		country                 = "Pays",
		copy_country            = "Copier Country",
		search_usergroup        = "Chercher Groupe d'Utilisateurs",
		search_ip_address       = "Chercher Adresse IP",
		search_country          = "Chercher Pays",
		search_name             = "Chercher Nom",
		none                    = "< none >",
		cancel                  = "Annuler",
		steamid                 = "SteamID",

} end }
--PATH lua/gmodadminsuite/modules/secondaryusergroups/lang/english.lua:
return {
	Name = "English",
	Flag = "flags16/gb.png",
	Phrases = function() return {

		module_name = "Secondary Usergroups",

		open_menu          = "Open Menu",
		custom_ellipsis    = "Custom...",
		usergroup_ellipsis = "Usergroup...",
		players            = "Players",
		settings           = "Settings",
		players            = "Players",
		give_usergroup     = "Give Usergroup",
		usergroup_ellipsis = "Usergroup...",
		usergroup_is_main  = "This is the user's main usergroup, and cannot be given or revoked.",
		help               = "Help",
		offline_btn        = "New Player...",
		loading_ellipsis   = "Loading...",
		unknown            = "Unknown",

} end }
--PATH addons/sl_utils/lua/autorun/guigui_handcuffs_wep.lua:
Handcuffs = Handcuffs or {}

function guigui_handcuff_wep(wep)
	for k, v in pairs(Handcuffs.wepTable) do
		if k == wep then
			return v
		end
	end
	if GetConVar("Handcuffs_StrictWeapons"):GetString() == "1" then
		return false
	else
		return true
	end
end

Handcuffs.wepTable = {
	["weapon_physgun"] = true, 
	["weapon_physcannon"] = true, 
	["gmod_tool"] = true, 
	["weapon_fists"] = true, 
	["keys"] = true, 
	["pocket"] = true, 
}
--PATH addons/rogue_scoreboard/lua/autorun/loadroguesb.lua:
RogueScoreboard = RogueScoreboard or {}

function RogueScoreboard.LoadingSV(filePath)
	if SERVER then
		include(filePath)
	end
end

function RogueScoreboard.LoadingCL(filePath)
	AddCSLuaFile(filePath)
	if CLIENT then
		include(filePath)
	end
end

function RogueScoreboard.LoadingSH(filePath)
	AddCSLuaFile(filePath)
	include(filePath)
end

RogueScoreboard.LoadingSH("roguescoreboard/sh_roguenetdata.lua")
RogueScoreboard.LoadingSH("roguescoreboard/configuration.lua")
RogueScoreboard.LoadingCL("roguescoreboard/cl_rogue.lua")
RogueScoreboard.LoadingSH("roguescoreboard/incog.lua")

if SERVER then
	resource.AddWorkshop( "2248752220" )
end
--PATH addons/mc_simple_npcs/lua/autorun/mcs_load.lua:
--   __  __                  _            _____   _                       _            _   _   _____     _____       
--  |  \/  |                ( )          / ____| (_)                     | |          | \ | | |  __ \   / ____|      
--  | \  / |   __ _    ___  |/   ___    | (___    _   _ __ ___    _ __   | |   ___    |  \| | | |__) | | |       ___ 
--  | |\/| |  / _` |  / __|     / __|    \___ \  | | | '_ ` _ \  | '_ \  | |  / _ \   | . ` | |  ___/  | |      / __|
--  | |  | | | (_| | | (__      \__ \    ____) | | | | | | | | | | |_) | | | |  __/   | |\  | | |      | |____  \__ \
--  |_|  |_|  \__,_|  \___|     |___/   |_____/  |_| |_| |_| |_| | .__/  |_|  \___|   |_| \_| |_|       \_____| |___/
--                                                               | |                                                 
--                                                               |_|       V 1.2.0                                   

MCS = {}
MCS.Spawns = {}
MCS.Config = {}
MCS.Themes = {}

if (SERVER) then
	include("mcs_npcs/sh_addonsup.lua")
	include("mcs_npcs/sh_config.lua")
	include("mcs_npcs/sh_npcspawn.lua")
	include("mcs_npcs/sv_init.lua")
	AddCSLuaFile("mcs_npcs/sh_addonsup.lua")
	AddCSLuaFile("mcs_npcs/sh_config.lua")
	AddCSLuaFile("mcs_npcs/sh_npcspawn.lua")
	AddCSLuaFile("mcs_npcs/cl_init.lua")
	AddCSLuaFile("mcs_npcs/cl_util.lua")
	AddCSLuaFile("mcs_npcs/cl_menu.lua")
else
	include("mcs_npcs/sh_addonsup.lua")
	include("mcs_npcs/sh_config.lua")
	include("mcs_npcs/sh_npcspawn.lua")
	include("mcs_npcs/cl_init.lua")
	include("mcs_npcs/cl_util.lua")
	include("mcs_npcs/cl_menu.lua")
end

local files, folders = file.Find("mcs_npcs/themes/*", "LUA")

for k,v in pairs(files) do
	if (SERVER) then
		print("[MCS NPCs] Adding theme "..k.." "..v)
		include("mcs_npcs/themes/" .. v)
		AddCSLuaFile("mcs_npcs/themes/" .. v)
	else
		include("mcs_npcs/themes/" .. v)
	end
end
--PATH addons/mc_simple_npcs/lua/mcs_npcs/sh_addonsup.lua:
--  _______               __          _______  __                   __          _______  ______  ______        
-- |   |   |.---.-..----.|  |.-----. |     __||__|.--------..-----.|  |.-----. |    |  ||   __ \|      |.-----.
-- |       ||  _  ||  __| |_||__ --| |__     ||  ||        ||  _  ||  ||  -__| |       ||    __/|   ---||__ --|
-- |__|_|__||___._||____|    |_____| |_______||__||__|__|__||   __||__||_____| |__|____||___|   |______||_____|
--   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////// Warning! Nothing to edit here, you can break the system //////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

MCS.AddonList = {}

MCS.AddonList["CH FireSystem"] = {
	["path"] = "entities/npc_firetruck/init.lua",
	["function"] = nil,
	["function_sv"] = function(ply)
		if IsValid( ply ) and table.HasValue( CH_FireSystem.Config.AllowedTeams, team.GetName(ply:Team()) ) then
			net.Start( "FIRE_FiretruckMenu" )
			net.Send( ply )
		else
			DarkRP.notify(ply, 2, 5,  "Only firefighters can access this NPC!")
		end
	end,
	["enabled"] = false,
}

MCS.AddonList["CH TowTruck"] = {
	["path"] = "entities/npc_towtruck/init.lua",
	["function"] = nil,
	["function_sv"] = function(ply)
		if IsValid( ply ) and ply:Team() == TEAM_TOWER then
			net.Start("TOW_TowTruck_Menu", ply)
			net.Send( ply )
		else
			DarkRP.notify(ply, 1, 5,  "Only tow truck drivers can access this NPC!")
		end
	end,
	["enabled"] = false,
}

MCS.AddonList["CH ShopNPC"] = {
	["path"] = "entities/npc_shop_npc/init.lua",
	["function"] = function() NPC_ShopMenu() end,
	["function_sv"] = nil,
	["enabled"] = false,
}

MCS.AddonList["CH GovStation"] = {
	["path"] = "autorun/client/govstation_client.lua",
	["function"] = function() GovStation_Menu() end,
	["function_sv"] = nil,
	["enabled"] = false,
}

MCS.AddonList["SH Accessories"] = {
	["path"] = "accessory/sv_accessory.lua",
	["function"] = nil,
	["function_sv"] = function(ply) SH_ACC:Show(ply) end,
	["enabled"] = false,
}


local function AddonListCheck()

	for id, addon in pairs(MCS.AddonList) do
		if addon["path"] and file.Exists(addon["path"], "LUA") then
			addon["enabled"] = true
			print(id.." enabled!")
		end
	end

end	

timer.Simple(2, function() AddonListCheck() end)
--PATH lua/openpermissions/thirdparty/pon.lua:
--[[

DEVELOPMENTAL VERSION;

VERSION 1.2.2
Copyright thelastpenguin™

	You may use this for any purpose as long as:
	-	You don't remove this copyright notice.
	-	You don't claim this to be your own.
	-	You properly credit the author, thelastpenguin™, if you publish your work based on (and/or using) this.

	If you modify the code for any purpose, the above still applies to the modified code.

	The author is not held responsible for any damages incured from the use of pon, you use it at your own risk.

DATA TYPES SUPPORTED:
 - tables  - 		k,v - pointers
 - strings - 		k,v - pointers
 - numbers -		k,v
 - booleans- 		k,v
 - Vectors - 		k,v
 - Angles  -		k,v
 - Entities- 		k,v
 - Players - 		k,v

CHANGE LOG
V 1.1.0
 - Added Vehicle, NPC, NextBot, Player, Weapon
V 1.2.0
 - Added custom handling for k,v tables without any array component.
V 1.2.1
 - fixed deserialization bug.

THANKS TO...
 - VERCAS for the inspiration.
]]


local pon = {};

local type, count = type, table.Count ;
local tonumber = tonumber ;
local format = string.format;
do
	local type, count = type, table.Count ;
	local tonumber = tonumber ;
	local format = string.format;

	local encode = {};

	local tryCache ;

	local cacheSize = 0;

	encode['table'] = function( self, tbl, output, cache )

		if( cache[ tbl ] )then
			output[ #output + 1 ] = format('(%x)',  cache[tbl] );
			return ;
		else
			cacheSize = cacheSize + 1;
			cache[ tbl ] = cacheSize;
		end


    local first = next(tbl, nil)
    local predictedNumeric = 1
    local lastKey = nil
    -- starts with a numeric dealio
    if first == 1 then
      output[#output + 1] = '{'

      for k,v in next, tbl do
        if k == predictedNumeric then
          predictedNumeric = predictedNumeric + 1

          local tv = type(v)
          if tv == 'string' then
            local pid = cache[v]
            if pid then
              output[#output + 1] = format('(%x)', pid)
            else
              cacheSize = cacheSize + 1
              cache[v] = cacheSize
              self.string(self, v, output, cache)
            end
          else
            self[tv](self, v, output, cache)
          end

        else
          break
        end
      end

			predictedNumeric = predictedNumeric - 1
    else
      predictedNumeric = nil
    end

    if predictedNumeric == nil then
      output[#output + 1] = '[' -- no array component
    else
      output[#output + 1] = '~' -- array component came first so shit needs to happen
    end

    for k, v in next, tbl, predictedNumeric do
      local tk, tv = type(k), type(v)

      -- WRITE KEY
      if tk == 'string' then
        local pid = cache[ k ];
        if( pid )then
          output[ #output + 1 ] = format('(%x)',  pid );
        else
          cacheSize = cacheSize + 1;
          cache[ k ] = cacheSize;

          self.string( self, k, output, cache );
        end
      else
        self[tk](self, k, output, cache)
      end

      -- WRITE VALUE
      if( tv == 'string' )then
        local pid = cache[ v ];
        if( pid )then
          output[ #output + 1 ] = format('(%x)',  pid );
        else
          cacheSize = cacheSize + 1;
          cache[ v ] = cacheSize;

          self.string( self, v, output, cache );
        end
      else
        self[ tv ]( self, v, output, cache );
      end
    end

    output[#output + 1] = '}'
	end
	--    ENCODE STRING
	local gsub = string.gsub ;
	encode['string'] = function( self, str, output )
		--if tryCache( str, output ) then return end
		local estr, count = gsub( str, ";", "\\;");
		if( count == 0 )then
			output[ #output + 1 ] = '\''..str..';';
		else
			output[ #output + 1 ] = '"'..estr..'";';
		end
	end
	--    ENCODE NUMBER
	encode['number'] = function( self, num, output )
		if num%1 == 0 then
			if num < 0 then
				output[ #output + 1 ] = format( 'x%x;', -num );
			else
				output[ #output + 1 ] = format('X%x;', num );
			end
		else
			output[ #output + 1 ] = tonumber( num )..';';
		end
	end
	--    ENCODE BOOLEAN
	encode['boolean'] = function( self, val, output )
		output[ #output + 1 ] = val and 't' or 'f'
	end
	--    ENCODE VECTOR
	encode['Vector'] = function( self, val, output )
		output[ #output + 1 ] = ('v'..val.x..','..val.y)..(','..val.z..';');
	end
	--    ENCODE ANGLE
	encode['Angle'] = function( self, val, output )
		output[ #output + 1 ] = ('a'..val.p..','..val.y)..(','..val.r..';');
	end
	encode['Entity'] = function( self, val, output )
		output[ #output + 1] = 'E'..(IsValid( val ) and (val:EntIndex( )..';') or '#');
	end
	encode['Player']  = encode['Entity'];
	encode['Vehicle'] = encode['Entity'];
	encode['Weapon']  = encode['Entity'];
	encode['NPC']     = encode['Entity'];
	encode['NextBot'] = encode['Entity'];
	encode['PhysObj'] = encode['Entity'];

	encode['nil'] = function()
		output[ #output + 1 ] = '?';
	end
	encode.__index = function( key )
		ErrorNoHalt('Type: '..key..' can not be encoded. Encoded as as pass-over value.');
		return encode['nil'];
	end

	do
		local empty, concat = table.Empty, table.concat ;
		function pon.encode( tbl )
			local output = {};
			cacheSize = 0;
			encode[ 'table' ]( encode, tbl, output, {} );
			local res = concat( output );

			return res;
		end
	end
end

do
	local tonumber = tonumber ;
	local find, sub, gsub, Explode = string.find, string.sub, string.gsub, string.Explode ;
	local Vector, Angle, Entity = Vector, Angle, Entity ;

	local decode = {};
	decode['{'] = function( self, index, str, cache )

		local cur = {};
		cache[ #cache + 1 ] = cur;

		local k, v, tk, tv = 1, nil, nil, nil;
		while( true )do
			tv = sub( str, index, index );
			if( not tv or tv == '~' )then
				index = index + 1;
				break ;
			end
			if( tv == '}' )then
				return index + 1, cur;
			end

			-- READ THE VALUE
			index = index + 1;
			index, v = self[ tv ]( self, index, str, cache );
			cur[ k ] = v;

			k = k + 1;
		end

		while( true )do
			tk = sub( str, index, index );
			if( not tk or tk == '}' )then
				index = index + 1;
				break ;
			end

			-- READ THE KEY

			index = index + 1;
			index, k = self[ tk ]( self, index, str, cache );

			-- READ THE VALUE
			tv = sub( str, index, index );
			index = index + 1;
			index, v = self[ tv ]( self, index, str, cache );

			cur[ k ] = v;
		end

		return index, cur;
	end
	decode['['] = function( self, index, str, cache )

		local cur = {};
		cache[ #cache + 1 ] = cur;

		local k, v, tk, tv = 1, nil, nil, nil;
		while( true )do
			tk = sub( str, index, index );
			if( not tk or tk == '}' )then
				index = index + 1;
				break ;
			end

			-- READ THE KEY
			index = index + 1;
			index, k = self[ tk ]( self, index, str, cache );
			if not k then continue end

			-- READ THE VALUE
			tv = sub( str, index, index );
			index = index + 1;
			if not self[tv] then
				print('did not find type: '..tv)
			end
			index, v = self[ tv ]( self, index, str, cache );

			cur[ k ] = v;
		end

		return index, cur;
	end

	-- STRING
	decode['"'] = function( self, index, str, cache )
		local finish = find( str, '";', index, true );
		local res = gsub( sub( str, index, finish - 1 ), '\\;', ';' );
		index = finish + 2;

		cache[ #cache + 1 ] = res;
		return index, res;
	end
	-- STRING NO ESCAPING NEEDED
	decode['\''] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local res = sub( str, index, finish - 1 )
		index = finish + 1;

		cache[ #cache + 1 ] = res;
		return index, res;
	end

	-- NUMBER
	decode['n'] = function( self, index, str, cache )
		index = index - 1;
		local finish = find( str, ';', index, true );
		local num = tonumber( sub( str, index, finish - 1 ) );
		index = finish + 1;
		return index, num;
	end
	decode['0'] = decode['n'];
	decode['1'] = decode['n'];
	decode['2'] = decode['n'];
	decode['3'] = decode['n'];
	decode['4'] = decode['n'];
	decode['5'] = decode['n'];
	decode['6'] = decode['n'];
	decode['7'] = decode['n'];
	decode['8'] = decode['n'];
	decode['9'] = decode['n'];
	decode['-'] = decode['n'];
	-- positive hex
	decode['X'] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local num = tonumber( sub( str, index, finish - 1), 16 );
		index = finish + 1;
		return index, num;
	end
	-- negative hex
	decode['x'] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local num = -tonumber( sub( str, index, finish - 1), 16 );
		index = finish + 1;
		return index, num;
	end

	-- POINTER
	decode['('] = function( self, index, str, cache )
		local finish = find( str, ')', index, true );
		local num = tonumber( sub( str, index, finish - 1), 16 );
		index = finish + 1;
		return index, cache[ num ];
	end

	-- BOOLEAN. ONE DATA TYPE FOR YES, ANOTHER FOR NO.
	decode[ 't' ] = function( self, index )
		return index, true;
	end
	decode[ 'f' ] = function( self, index )
		return index, false;
	end

	-- VECTOR
	decode[ 'v' ] = function( self, index, str, cache )
		local finish =  find( str, ';', index, true );
		local vecStr = sub( str, index, finish - 1 );
		index = finish + 1; -- update the index.
		local segs = Explode( ',', vecStr, false );
		return index, Vector( tonumber( segs[1] ), tonumber( segs[2] ), tonumber( segs[3] ) );
	end
	-- ANGLE
	decode[ 'a' ] = function( self, index, str, cache )
		local finish =  find( str, ';', index, true );
		local angStr = sub( str, index, finish - 1 );
		index = finish + 1; -- update the index.
		local segs = Explode( ',', angStr, false );
		return index, Angle( tonumber( segs[1] ), tonumber( segs[2] ), tonumber( segs[3] ) );
	end
	-- ENTITY
	decode[ 'E' ] = function( self, index, str, cache )
		if( str[index] == '#' )then
			index = index + 1;
			return index, NULL ;
		else
			local finish = find( str, ';', index, true );
			local num = tonumber( sub( str, index, finish - 1 ) );
			index = finish + 1;
			return index, Entity( num );
		end
	end
	-- PLAYER
	decode[ 'P' ] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local num = tonumber( sub( str, index, finish - 1 ) );
		index = finish + 1;
		return index, Entity( num ) or NULL;
	end
	-- NIL
	decode['?'] = function( self, index, str, cache )
		return index + 1, nil;
	end


	function pon.decode( data )
		local _, res = decode[sub(data,1,1)]( decode, 2, data, {});
		return res;
	end
end

return pon
--PATH lua/openpermissions/lang/english.lua:
return {
	Name = "English",
	Icon = "flags16/gb.png",
	Phrases = {
		operator_only_menu = "Only OpenPermissions Operators can access this menu.",
		permissions = "Permissions",
		help = "Help",
		tester = "Tester",
		access_groups = "Access Groups",
		access_group = "Access Group",
		type = "Type",
		add_access_group = "Add Access Group",
		custom_ellipsis = "Custom...",
		enter_usergroup = "Enter the name of a usergroup",
		enter_steamid = "Enter a SteamID or SteamID64. Examples:\nSteamID: %s\nSteamID64: %s",
		invalid_steamid = "That was not a valid SteamID.",
		error = "Error",
		ok = "OK",
		none_info = "(none)",
		key = "Key",
		access_group_exists = "This access group already exists.",
		operations = "Operations",
		select_an_access_group = "Please select access group(s) on the left",
		back_btn = "Back",
		delete_access_group = "Delete Selected Access Group(s)",
		copy = "Copy",
		paste = "Paste",
		all_permissions = "All Permissions",
		all_addons = "All Addons",
		save = "Save",
		not_an_addon = "That's not a valid addon.",
		hold_ctrl_to_select_multiple = "Hold CTRL to multiselect groups",
		permission_clash_msg = "WARNING: You have selected multiple access groups to copy, only permissions where\nall access groups have the same permission will be copied",
		Players = "Players",

		ACCESS_GROUP_OTHER = "Other",
		ACCESS_GROUP_USERGROUP = "Usergroup",
		ACCESS_GROUP_STEAMID = "SteamID",
		ACCESS_GROUP_TEAM = "Team",
		ACCESS_GROUP_LUA_FUNCTION = "Lua Function",
		ACCESS_GROUP_DARKRP_CATEGORY = "DarkRP Job Category",
	}
}
--PATH lua/openpermissions/cl.lua:
local L = OpenPermissions.L
local Lf = OpenPermissions.Lf

local function DMenuOption_ColorIcon(option, color)
	option:SetIcon("icon16/box.png")
	function option.m_Image:Paint(w,h)
		surface.SetDrawColor(color)
		surface.DrawRect(0,0,w,h)
	end
end
local function GreenToRed_DMenu(i, max, option)
	DMenuOption_ColorIcon(option, Color(i / max * 255, 1 - (i / max) * 255, 0))
end

surface.CreateFont("OpenPermissions_14px", {
	font = "Roboto",
	size = 14,
})
surface.CreateFont("OpenPermissions_Tip", {
	font = "Roboto",
	size = 22,
})

function OpenPermissions:AddTooltip(pnl, options)
	pnl.OpenPermissions_Tooltip_OnCursorEntered = pnl.OnCursorEntered
	pnl.OpenPermissions_Tooltip_OnCursorExited = pnl.OnCursorExited

	function pnl:OnCursorEntered(...)
		pnl.OpenPermissions_Tooltip = vgui.Create("OpenPermissions.Tooltip")
		pnl.OpenPermissions_Tooltip:SetText(options.Text)
		pnl.OpenPermissions_Tooltip.VGUI_Element = pnl

		if (self.OpenPermissions_Tooltip_OnCursorEntered) then
			return self.OpenPermissions_Tooltip_OnCursorEntered(self, ...)
		end
	end

	function pnl:OnCursorExited(...)
		if (IsValid(self.OpenPermissions_Tooltip)) then
			self.OpenPermissions_Tooltip:Remove()
		end
		self.OpenPermissions_Tooltip = nil
		if (self.OpenPermissions_Tooltip_OnCursorExited) then
			return self.OpenPermissions_Tooltip_OnCursorExited(self, ...)
		end
	end
end
function OpenPermissions:RemoveTooltip(pnl)
	if (IsValid(pnl.OpenPermissions_Tooltip)) then
		pnl.OpenPermissions_Tooltip:Remove()
	end
	pnl.OpenPermissions_Tooltip = nil
	pnl.OnCursorEntered = pnl.OpenPermissions_Tooltip_OnCursorEntered
	pnl.OnCursorExited = pnl.OpenPermissions_Tooltip_OnCursorExited
end

local blur = Material("pp/blurscreen")
function OpenPermissions:OpenMenu(specific_addon)
	if (IsValid(OpenPermissions_Menu)) then
		OpenPermissions_Menu:Close()
	end

	OpenPermissions_Menu = vgui.Create("DFrame")

	local AccessGroups
	local PermissionsSave

	local Menu = OpenPermissions_Menu
	Menu:SetSize(850,500)
	Menu:SetTitle("OpenPermissions")
	Menu:SetIcon("icon16/shield.png")
	Menu:Center()
	Menu:MakePopup()

	local Tabs = vgui.Create("DPropertySheet", Menu)
	Tabs:Dock(FILL)

	local PermissionsTab = vgui.Create("DPanel", Tabs)
	PermissionsTab.Paint = nil

		local AccessGroupsDivider = vgui.Create("OpenPermissions.HorizontalDivider", PermissionsTab)
		AccessGroupsDivider:Dock(FILL)
		AccessGroupsDivider:SetDividerWidth(5)
		AccessGroupsDivider:SetLeftWidth(200)
		AccessGroupsDivider:SetRightMin(465)
		AccessGroupsDivider:SetLeftMin(150)

		local AddonsContainer = vgui.Create("OpenPermissions.ColumnLayout", AccessGroupsDivider)
		AccessGroupsDivider:SetRight(AddonsContainer)
		AddonsContainer:SetColumns(OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW, OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW, OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW)
		AddonsContainer:SetPaddings(5,5)

		local AddonContentContainer = vgui.Create("DPanel", PermissionsTab)
		AddonContentContainer.Paint = nil
		AddonContentContainer:SetVisible(false)
		AddonContentContainer:Dock(FILL)
		AddonContentContainer:DockMargin(5,0,0,0)

			local AddonContent = vgui.Create("DPropertySheet", AddonContentContainer)
			AddonContent:Dock(FILL)
			function AddonContent:PaintOver(w,h)
				if (not self.ShowOverlay) then return end
				local x,y = self:LocalToScreen(0,0)
				local scrW,scrH = ScrW(), ScrH()
				surface.SetDrawColor(255,255,255)
				surface.SetMaterial(blur)
				for i=1,2 do
					blur:SetFloat("$blur", (i / 2) * 2)
					blur:Recompute()
					render.UpdateScreenEffectTexture()
					surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
				end

				surface.SetDrawColor(0,0,0,240)
				surface.DrawRect(0,0,w,h)

				draw.SimpleTextOutlined(L"select_an_access_group", "OpenPermissions_Tip", w / 2, h / 2, OpenPermissions.COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, OpenPermissions.COLOR_BLACK)
			end

			local PermissionsContent = vgui.Create("OpenPermissions.HorizontalDivider", AddonContent)
			PermissionsContent:SetDividerWidth(5)
			PermissionsContent:SetRightMin(150)
			PermissionsContent:SetLeftMin(150)
			PermissionsContent.Paint = nil

				local PermissionsTree = vgui.Create("OpenPermissions.Tree", PermissionsContent)

				local PropertiesContent = vgui.Create("OpenPermissions.ScrollPanel", PermissionsContent)
				PropertiesContent:DockMargin(5,0,0,0)
				PropertiesContent:SetWide(150)
				PropertiesContent:SetDrawBackground(true)
				function PropertiesContent:AddProperty(options, indent_level, no_checkbox)
					local permission_row = vgui.Create("DPanel", PropertiesContent)
					permission_row.Paint = nil
					permission_row:Dock(TOP)
					permission_row:SetTall(16)
					permission_row:DockMargin(5 + ((indent_level or 0) * (16 + 5)),5,5,0)

					OpenPermissions:AddTooltip(permission_row, {Text = options.Tip or options.Label})

					local checkbox
					if (not no_checkbox) then
						permission_row:SetMouseInputEnabled(true)
						permission_row:SetCursor("hand")

						checkbox = vgui.Create("OpenPermissions.Checkbox", permission_row)
						checkbox:SetCrossable(true)
						checkbox:Dock(LEFT)
						checkbox:DockMargin(0,0,5,0)

						function permission_row:OnMouseReleased(m)
							if (m == MOUSE_LEFT) then
								checkbox:DoClick()
							elseif (m == MOUSE_RIGHT) then
								checkbox:DoRightClick()
							end
						end
					end

					if (options.Icon) then
						local icon = vgui.Create("DImage", permission_row)
						icon:Dock(LEFT)
						icon:SetSize(16,16)
						icon:DockMargin(0,0,5,0)
						icon:SetImage(options.Icon)
						icon:SetMouseInputEnabled(false)
					elseif (options.Color) then
						local col_icon = vgui.Create("DPanel", permission_row)
						col_icon:Dock(LEFT)
						col_icon:SetSize(16,16)
						col_icon:DockMargin(0,0,5,0)
						col_icon:SetMouseInputEnabled(false)
						function col_icon:Paint(w,h)
							surface.SetDrawColor(options.Color)
							surface.DrawRect(0,0,w,h)
						end
					end

					local label = vgui.Create("DLabel", permission_row)
					label:Dock(FILL)
					label:SetTextColor(OpenPermissions.COLOR_BLACK)
					label:SetText(options.Label)
					label:SetContentAlignment(4)
					label:SetMouseInputEnabled(false)

					return checkbox
				end

				PermissionsContent:SetLeft(PermissionsTree)
				PermissionsContent:SetRight(PropertiesContent)
				PermissionsContent:BalanceWidths()

			AddonContent:AddSheet(L"permissions", PermissionsContent, "icon16/group.png")

			local OperationsContainer = vgui.Create("OpenPermissions.ScrollPanel", AddonContent)
			AddonContent:AddSheet(L"operations", OperationsContainer, "icon16/wrench_orange.png")

			function AddonContent:SetShowOverlay(show)
				self.ShowOverlay = show
				self:SetMouseInputEnabled(not show)
				for _,v in ipairs(self:GetItems()) do
					v.Panel:SetMouseInputEnabled(not show)
				end
			end
			AddonContent:SetShowOverlay(true)

				local DeleteAccessGroup = vgui.Create("DButton", OperationsContainer)
				DeleteAccessGroup:SetSize(250,30)
				DeleteAccessGroup:SetText(L"delete_access_group")
				DeleteAccessGroup:SetIcon("icon16/delete.png")

				local CopyPasteContainer = vgui.Create("DPanel", OperationsContainer)
				CopyPasteContainer.Paint = nil
				CopyPasteContainer:SetSize(250,30)
				CopyPasteContainer:AlignTop(DeleteAccessGroup:GetTall() + 5)

					local CopyPermissions = vgui.Create("DButton", CopyPasteContainer)
					CopyPermissions:SetText(L"copy")
					CopyPermissions:SetIcon("icon16/page_copy.png")
					CopyPermissions:DockMargin(0,0,5,0)

					local PastePermissions = vgui.Create("DButton", CopyPasteContainer)
					PastePermissions:SetText(L"paste")
					PastePermissions:SetIcon("icon16/page_paste.png")
					PastePermissions:DockMargin(0,0,5,0)
					PastePermissions:SetDisabled(true)

					function CopyPermissions:DoClick()
						PastePermissions:SetDisabled(false)
						PastePermissions.PermissionsData = {}
						local copied_clashes = false
						for _,line in ipairs(AccessGroups:GetSelected()) do
							local identifier = line.Data.Enum .. " " .. line.Data.Value
							if (not OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] or not OpenPermissions.PermissionsRegistryEditing[line.Data.Value]) then continue end
							for access_group, perms in pairs(OpenPermissions.PermissionsRegistryEditing[line.Data.Enum]) do
								for permission_id, checked in pairs(perms) do
									if (PastePermissions.PermissionsData[permission_id] == nil) then
										local has_clashed = false
										for _,line_2 in ipairs(AccessGroups:GetSelected()) do
											local identifier_2 = line_2.Data.Enum .. " " .. line_2.Data.Value
											if (not OpenPermissions.PermissionsRegistryEditing[line_2.Data.Enum] or not OpenPermissions.PermissionsRegistryEditing[line_2.Data.Value]) then continue end
											if (identifier_2 == identifier) then continue end
											if (OpenPermissions.PermissionsRegistryEditing[line_2.Data.Enum][line_2.Data.Value][permission_id] ~= checked) then
												copied_clashes, has_clashed = true, true
												break
											end
										end
										if (not has_clashed) then
											PastePermissions.PermissionsData[permission_id] = checked
										else
											PastePermissions.PermissionsData[permission_id] = nil
										end
									elseif (PastePermissions.PermissionsData[permission_id] ~= checked) then
										copied_clashes = true
										PastePermissions.PermissionsData[permission_id] = nil
									end
								end
							end
						end
						if (copied_clashes) then
							Derma_Message(L"permission_clash_msg", "OpenPermissions", L"ok")
						end
					end
					function PastePermissions:DoClick()
						for _,line in ipairs(AccessGroups:GetSelected()) do
							OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] = OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] or {}
							OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] = OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] or {}
							table.Merge(OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value], PastePermissions.PermissionsData)
						end
					end

					function CopyPasteContainer:PerformLayout(w,h)
						CopyPermissions:SetSize((w - 2.5) / 2,h)
						CopyPermissions:AlignLeft(0)
						PastePermissions:SetSize((w - 2.5) / 2,h)
						PastePermissions:AlignRight(0)
					end

			local AddonNav = vgui.Create("DPanel", AddonContentContainer)
			AddonNav.Paint = nil
			AddonNav:Dock(BOTTOM)
			AddonNav:DockMargin(0,5,0,0)
			AddonNav:SetTall(30)

				PermissionsSave = vgui.Create("DButton", AddonNav)
				PermissionsSave:Dock(LEFT)
				PermissionsSave:SetWide(100)
				PermissionsSave:DockMargin(0,0,5,0)
				PermissionsSave:SetText(L"save")
				PermissionsSave:SetIcon("icon16/disk.png")
				PermissionsSave:SetDisabled(true)

				function PermissionsSave:RememberPermission(permission_id, checked)
					local is_disabled = true
					for _,line in ipairs(AccessGroups:GetSelected()) do
						if (checked == OpenPermissions.CHECKBOX.INHERIT or checked == false) then
							if (OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] ~= nil and OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] ~= nil) then
								OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value][permission_id] = nil
								if (OpenPermissions:table_IsEmpty(OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value])) then
									OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] = nil
									if (OpenPermissions:table_IsEmpty(OpenPermissions.PermissionsRegistryEditing[line.Data.Enum])) then
										OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] = nil
									end
								end
							end
						else
							OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] = OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] or {}
							OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] = OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] or {}
							OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value][permission_id] = checked
						end
						if (is_disabled) then
							if ((OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] ~= nil and OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] ~= nil) ~= (OpenPermissions.PermissionsRegistry[line.Data.Enum] ~= nil and OpenPermissions.PermissionsRegistry[line.Data.Enum][line.Data.Value] ~= nil)) then
								is_disabled = false
							else
								if (OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] ~= nil and OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] ~= nil and OpenPermissions.PermissionsRegistry[line.Data.Enum] ~= nil and OpenPermissions.PermissionsRegistry[line.Data.Enum][line.Data.Value] ~= nil and OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value][permission_id] ~= OpenPermissions.PermissionsRegistry[line.Data.Enum][line.Data.Value][permission_id]) then
									is_disabled = false
								elseif (not OpenPermissions:table_IsIdentical(OpenPermissions.PermissionsRegistryEditing, OpenPermissions.PermissionsRegistry)) then
									is_disabled = false
								end
							end
						end
					end
					self:SetDisabled(is_disabled)
				end
				function PermissionsSave:CheckedFromMemory(permission_id, checkbox)
					local checked
					for _,line in ipairs(AccessGroups:GetSelected()) do
						local should_be_checked = OpenPermissions.CHECKBOX.INHERIT
						if (OpenPermissions.PermissionsRegistryEditing[line.Data.Enum] ~= nil and OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] ~= nil and OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value][permission_id] ~= nil) then
							should_be_checked = OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value][permission_id]
						elseif (OpenPermissions.DefaultPermissions[permission_id] ~= nil) then
							should_be_checked = OpenPermissions.DefaultPermissions[permission_id]
						end
						if (checked == nil) then
							checked = should_be_checked
						else
							if (should_be_checked ~= checked) then
								checkbox:SetAmbigious(true)
								return
							end
						end
					end
					checkbox:SetChecked(checked)
					checkbox:SetAmbigious(false)
				end
				function PermissionsSave:DoClick()
					OpenPermissions.PermissionsRegistry = table.Copy(OpenPermissions.PermissionsRegistryEditing)
					self:SetDisabled(true)
					surface.PlaySound("garrysmod/content_downloaded.wav")
					
					OpenPermissions:SerializeRegistry(OpenPermissions.REGISTRY.FLAT_FILE)
					net.Start("OpenPermissions.SavePermissions")
						OpenPermissions:StartNetworkTable(OpenPermissions.PermissionsRegistry)
					net.SendToServer()
					file.Delete("openpermissions_v2.dat")
				end

				local AddonBack = vgui.Create("DButton", AddonNav)
				AddonBack:Dock(LEFT)
				AddonBack:SetWide(100)
				AddonBack:DockMargin(0,0,5,0)
				AddonBack:SetText(L"back_btn")
				function AddonBack:DoClick()
					AddonsContainer:SetVisible(true)
					AddonContentContainer:SetVisible(false)

					AccessGroupsDivider:SetRight(AddonsContainer)
				end

				local AddonSelect = vgui.Create("OpenPermissions.ComboBox", AddonNav)
				AddonSelect:Dock(FILL)
				AddonSelect.AddonBtns = {}

				AddonSelect:SetSortItems(false)
				AddonSelect:AddChoice(L"all_addons", true, false, "icon16/layers.png")
				AddonSelect:AddSpacer()

				function AddonSelect:OnSelect(i, v, d)
					PropertiesContent:Clear()
					if (d == true) then
						function AccessGroups:OnRowSelected(i, row)
							AddonContent:SetShowOverlay(false)
							PermissionsTree:Clear()
							PropertiesContent:Clear()
							for id, data in pairs(OpenPermissions.Addons) do
								PermissionsTab:LoadPermissions(id, data, true)
							end
						end
						if (AccessGroups:GetSelectedLine() ~= nil) then
							AccessGroups:OnRowSelected()
						end
					else
						self.AddonBtns[d]:DoClick()
					end
				end

		local NavContent = vgui.Create("DPanel", PermissionsTab)
		AccessGroupsDivider:SetLeft(NavContent)
		NavContent.Paint = nil
		NavContent:Dock(LEFT)
		NavContent:SetWide(200)

			AccessGroups = vgui.Create("OpenPermissions.ListView", NavContent)
			AccessGroups:AddColumn(L"type"):SetFixedWidth(65)
			AccessGroups:AddColumn(L"access_group")
			AccessGroups:Dock(FILL)
			AccessGroups.Data = {}

			local KeyCategory = vgui.Create("DCollapsibleCategory", NavContent)
			KeyCategory:Dock(TOP)
			KeyCategory:SetTall(130)
			KeyCategory:DockMargin(0,0,0,5)
			KeyCategory:SetLabel(L"key")
			KeyCategory:SetExpanded(false)

				local KeyInfo = vgui.Create("OpenPermissions.ScrollPanel", NavContent)
				KeyInfo:SetDrawBackground(true)

				for name, enum in pairs(OpenPermissions.ACCESS_GROUP) do
					local Key = vgui.Create("DPanel", KeyInfo)
					Key:Dock(TOP)
					Key:DockMargin(5,5,5,0)

					local KeyColor = OpenPermissions.ACCESS_GROUP_KEY[enum]
					local KeyName = L("ACCESS_GROUP_" .. name)
					local KeyPoly = {
						{x = 9, y = 0},
						{x = 18, y = 9},
						{x = 9, y = 18},
						{x = 0, y = 9},
					}
					function Key:Paint(w,h)
						surface.SetDrawColor(KeyColor)
						draw.NoTexture()
						surface.DrawPoly(KeyPoly)

						draw.SimpleText(KeyName, "DermaDefault", 18 + 5, 8, OpenPermissions.COLOR_BLACK, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					end
				end

				KeyCategory:SetContents(KeyInfo)
			
			local MultipleTip = vgui.Create("DLabel", NavContent)
			MultipleTip:Dock(TOP)
			MultipleTip:SetContentAlignment(5)
			MultipleTip:DockMargin(0,0,0,5)
			MultipleTip:SetText(L"hold_ctrl_to_select_multiple")
			MultipleTip:SetTextColor(OpenPermissions.COLOR_BLACK)

			local AddAccessGroup = vgui.Create("DButton", NavContent)
			AddAccessGroup:SetText(L"add_access_group")
			AddAccessGroup:SetIcon("icon16/add.png")
			AddAccessGroup:Dock(BOTTOM)
			AddAccessGroup:DockMargin(0,5,0,0)
			AddAccessGroup:SetTall(30)

			function AddAccessGroup:Add(enum, text, value)
				local val = value or text
				if (AccessGroups.Data[enum] and AccessGroups.Data[enum][val]) then
					Derma_Message(L"access_group_exists", L"error", L"ok")
				else
					local type
					for name, _enum in pairs(OpenPermissions.ACCESS_GROUP) do
						if (_enum == enum) then
							type = name
							break
						end
					end
					local line = AccessGroups:AddLine(L("ACCESS_GROUP_" .. type), text)
					line.Data = {
						Enum = enum,
						Value = val
					}
					function line:Paint(w,h)
						derma.SkinHook("Paint", "ListViewLine", self, w, h)

						surface.SetDrawColor(OpenPermissions.ACCESS_GROUP_KEY[enum])
						surface.DrawRect(0,0,w,h)
					end
					AccessGroups.Data[enum] = AccessGroups.Data[enum] or {}
					AccessGroups.Data[enum][val] = true
				end
			end
			for enum, accessors in pairs(OpenPermissions.PermissionsRegistry) do
				for val, vals in pairs(accessors) do
					enum = tonumber(enum)
					if (enum == OpenPermissions.ACCESS_GROUP.STEAMID) then
						AddAccessGroup:Add(enum, OpenPermissions:AccountIDToSteamID(tonumber(val)), tonumber(val))
					elseif (enum == OpenPermissions.ACCESS_GROUP.TEAM) then
						local team_index = OpenPermissions:GetTeamFromIdentifier(val)
						if (team_index) then
							AddAccessGroup:Add(enum, team.GetName(team_index), val)
						end
					elseif (enum == OpenPermissions.ACCESS_GROUP.DARKRP_CATEGORY) then
						if (OpenPermissions.IsDarkRP) then
							local category_index = OpenPermissions:DarkRP_GetCategoryFromIdentifier(val)
							if (category_index) then
								AddAccessGroup:Add(enum, DarkRP.getCategories().jobs[category_index].name, val)
							end
						end
					else
						AddAccessGroup:Add(enum, val)
					end
				end
			end

			function AddAccessGroup:DoClick()
				local menu = DermaMenu()
				
				local ACCESS_GROUP_USERGROUP, _ = menu:AddSubMenu(L"ACCESS_GROUP_USERGROUP") _:SetIcon("icon16/group.png")

					ACCESS_GROUP_USERGROUP:AddOption(L"custom_ellipsis", function()
						Derma_StringRequest(L"add_access_group", L"enter_usergroup", LocalPlayer():GetUserGroup(), function(usergroup)
							AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.USERGROUP, usergroup)
						end)
					end):SetIcon("icon16/pencil.png")

					local usergroups = {superadmin = true, admin = true, user = true}
					for _,ply in ipairs(player.GetHumans()) do
						for usergroup in pairs(OpenPermissions:GetUserGroups(ply)) do
							usergroups[usergroup] = true
						end
					end
					usergroups = table.GetKeys(usergroups)
					table.sort(usergroups)
					for i,usergroup in ipairs(usergroups) do
						GreenToRed_DMenu(i, #usergroups, ACCESS_GROUP_USERGROUP:AddOption(usergroup, function()
							AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.USERGROUP, usergroup)
						end))
					end

				local ACCESS_GROUP_STEAMID, _ = menu:AddSubMenu(L"ACCESS_GROUP_STEAMID") _:SetIcon("icon16/user_gray.png")

					ACCESS_GROUP_STEAMID:AddOption(L"custom_ellipsis", function()
						Derma_StringRequest(L"add_access_group", Lf("enter_steamid", LocalPlayer():SteamID(), LocalPlayer():SteamID64()), LocalPlayer():SteamID(), function(_input)
							local steamid64
							if (_input:find("^STEAM_%d:%d:%d+$")) then
								steamid64 = util.SteamIDTo64(_input)
							elseif (_input:find("^7656119%d+$")) then
								steamid64 = _input
							else
								Derma_Message(L"invalid_steamid", L"error", L"ok")
								return
							end
							local steamid = util.SteamIDFrom64(steamid64)
							AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.STEAMID, steamid, OpenPermissions:SteamIDToAccountID(steamid))
						end)
					end):SetIcon("icon16/pencil.png")

					local steamids = {}
					for _,ply in ipairs(player.GetHumans()) do
						table.insert(steamids, {Distance = ply:GetPos():DistToSqr(LocalPlayer():GetPos()), Name = ply:Nick(), SteamID = ply:SteamID(), AccountID = ply:AccountID(), Color = team.GetColor(ply:Team())})
					end
					table.SortByMember(steamids, "Distance", true)
					for i,item in ipairs(steamids) do
						DMenuOption_ColorIcon(ACCESS_GROUP_STEAMID:AddOption(item.Name, function()
							AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.STEAMID, item.SteamID, item.AccountID)
						end), item.Color)
					end

				local ACCESS_GROUP_TEAM, _ = menu:AddSubMenu(L"ACCESS_GROUP_TEAM") _:SetIcon("icon16/flag_green.png")

					if (OpenPermissions.IsDarkRP) then
						local categories = {}
						for i,c in ipairs(DarkRP.getCategories().jobs) do
							if (GAS:table_IsEmpty(c.members)) then continue end
							table.insert(categories, {name = c.name, color = c.color, members = c.members})
						end
						table.SortByMember(categories, "name", true)
						for i,c in ipairs(categories) do
							local submenu, _submenu = ACCESS_GROUP_TEAM:AddSubMenu(c.name)
							DMenuOption_ColorIcon(_submenu, c.color)

							local members = {}
							for _,member in ipairs(c.members) do
								table.insert(members, {name = member.name, color = member.color, index = member.team})
							end
							table.SortByMember(members, "name", true)
							for _,member in ipairs(members) do
								DMenuOption_ColorIcon(submenu:AddOption(member.name, function()
									AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.TEAM, member.name, OpenPermissions:GetTeamIdentifier(member.index))
								end), member.color)
							end
						end
					else
						local teams = {}
						for i,t in ipairs(team.GetAllTeams()) do
							table.insert(teams, {Name = t.Name, Index = i, Color = t.Color})
						end
						table.SortByMember(teams, "Name", true)
						for i,item in ipairs(teams) do
							DMenuOption_ColorIcon(ACCESS_GROUP_TEAM:AddOption(item.Name, function()
								AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.TEAM, item.Name, OpenPermissions:GetTeamIdentifier(i))
							end), item.Color)
						end
					end

				local ACCESS_GROUP_LUA_FUNCTION, _ = menu:AddSubMenu(L"ACCESS_GROUP_LUA_FUNCTION") _:SetIcon("icon16/script.png")
					local lua_functions = table.GetKeys(OpenPermissions.LuaFunctions)
					if (#lua_functions == 0) then
						ACCESS_GROUP_LUA_FUNCTION:AddOption(L"none_info")
					else
						table.sort(lua_functions)
						for i,lua_func_name in ipairs(lua_functions) do
							GreenToRed_DMenu(i, #lua_functions, ACCESS_GROUP_LUA_FUNCTION:AddOption(lua_func_name, function()
								AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.LUA_FUNCTION, lua_func_name)
							end))
						end
					end

				if (OpenPermissions.IsDarkRP) then
					local ACCESS_GROUP_DARKRP_CATEGORY, _ = menu:AddSubMenu(L"ACCESS_GROUP_DARKRP_CATEGORY") _:SetIcon("icon16/wrench_orange.png")
					local darkrp_categories = {}
					for i,category in ipairs(DarkRP.getCategories().jobs) do
						table.insert(darkrp_categories, {Name = category.name, Color = category.color, Category = category})
					end
					table.SortByMember(darkrp_categories, "Name", true)
					for i,item in ipairs(darkrp_categories) do
						DMenuOption_ColorIcon(ACCESS_GROUP_DARKRP_CATEGORY:AddOption(item.Name, function()
							AddAccessGroup:Add(OpenPermissions.ACCESS_GROUP.DARKRP_CATEGORY, item.Name, OpenPermissions:DarkRP_GetCategoryIdentifier(i))
						end), item.Color)
					end
				end

				hook.Run("OpenPermissions:AddAccessGroup", menu)

				menu:Open()
			end

		local function permissions_node_clicked(self, addon_id, v)
			PropertiesContent:Clear()

			local indent_level = 0
			local function _r(tbl, permission_id, my_parent, i)
				i = (i or 0) + 1
				local final_checkbox
				for i,v in ipairs(tbl) do
					local my_permission_id = permission_id
					if (v[2].Value) then
						my_permission_id = my_permission_id .. "/" .. v[2].Value
					end
					local new_checkbox = PropertiesContent:AddProperty(v[2], indent_level)
					final_checkbox = new_checkbox
					v[3] = new_checkbox
					v[4] = my_parent

					function new_checkbox:CheckAmbigious()
						if (my_parent) then
							local all_state
							local ambigious = false
							for _,_v in ipairs(my_parent[1]) do
								if (not IsValid(_v[3])) then continue end
								if (_v[3]:IsAmbigious()) then
									ambigious = true
									break
								elseif (all_state == nil) then
									all_state = _v[3]:GetChecked()
								elseif (all_state ~= _v[3]:GetChecked()) then
									ambigious = true
									break
								end
							end
							my_parent[3]:SetAmbigious(ambigious)
							if (not ambigious) then
								my_parent[3]:SetChecked(all_state)
							end
							my_parent[3]:CheckAmbigious()
						end
					end
					function new_checkbox:OnChange()
						self:CheckAmbigious()
						if (#v[1] > 0) then
							local function __r(tbl)
								for _,_v in ipairs(tbl) do
									_v[3]:SetChecked(self:GetChecked())
									_v[3]:OnChange()
									__r(_v[1])
								end
							end
							__r(v[1])
						else
							PermissionsSave:RememberPermission(my_permission_id, self:GetChecked())
						end
					end

					PermissionsSave:CheckedFromMemory(my_permission_id, new_checkbox)

					if (#v[1] > 0) then
						indent_level = indent_level + 1
						_r(v[1], my_permission_id, v, i)
					end
				end
				if (final_checkbox) then
					final_checkbox:CheckAmbigious()
				end
				indent_level = indent_level - 1
			end
			_r(v[1], addon_id)
		end
		function PermissionsTab:LoadPermissions(addon_id, addon_data, shouldnt_clear)
			PermissionsTab.AddonID, PermissionsTab.AddonData = addon_id, addon_data

			if (not shouldnt_clear) then
				PermissionsTree:Clear()
				PropertiesContent:Clear()
			end

			local tree = addon_data[1]
			local addon_options = addon_data[2]

			local root_node = PermissionsTree:AddNode(addon_options.Name or addon_id, addon_options.Icon)
			if (not shouldnt_clear) then root_node:SetExpanded(true) end
			function root_node:DoClick()
				-- show all permissions
				permissions_node_clicked(self, addon_id, addon_data)
			end

			local is_root = true
			local function r(tbl, node, permission_id, prev_options)
				local lowest_level = true
				for _,v in ipairs(tbl) do
					if (#v[1] > 0) then
						lowest_level = false
						break
					end
				end
				if (not is_root and lowest_level) then
					-- if we can't go any deeper then show property checkboxes
					-- when the node is clicked
					function node:DoClick()
						PropertiesContent:Clear()

						if (#tbl > 1) then
							local checkboxes = {}
							local master_checkbox = PropertiesContent:AddProperty(prev_options)
							function master_checkbox:OnChange()
								self:SetAmbigious(false)
								for _,v in ipairs(checkboxes) do
									v:SetChecked(self:GetChecked())
									v:OnChange()
								end
							end

							for i,v in ipairs(tbl) do
								local my_permission_id = permission_id
								if (v[2].Value) then
									my_permission_id = my_permission_id .. "/" .. v[2].Value
								end
								local checkbox = PropertiesContent:AddProperty(v[2], 1)
								table.insert(checkboxes, checkbox)
								function checkbox:CheckAmbigious()
									local all_state
									local ambigious = false
									for _,v in ipairs(checkboxes) do
										if (v:IsAmbigious()) then
											ambigious = true
											break
										elseif (all_state == nil) then
											all_state = v:GetChecked()
										elseif (all_state ~= v:GetChecked()) then
											ambigious = true
											break
										end
									end
									master_checkbox:SetAmbigious(ambigious)
									if (not ambigious) then master_checkbox:SetChecked(all_state) end
								end
								function checkbox:OnChange()
									PermissionsSave:RememberPermission(my_permission_id, self:GetChecked())
									self:CheckAmbigious()
								end
								PermissionsSave:CheckedFromMemory(my_permission_id, checkbox)
							end
							checkboxes[1]:CheckAmbigious()
						else
							local my_permission_id = permission_id
							if (tbl[1][2].Value) then
								my_permission_id = my_permission_id .. "/" .. tbl[1][2].Value
							end
							local checkbox = PropertiesContent:AddProperty(tbl[1][2])
							function checkbox:OnChange()
								PermissionsSave:RememberPermission(my_permission_id, self:GetChecked())
							end
							PermissionsSave:CheckedFromMemory(my_permission_id, checkbox)
						end
					end
				else
					is_root = false
				end

				for _,v in ipairs(tbl) do
					local my_permission_id = permission_id
					if (v[2].Value) then
						my_permission_id = my_permission_id .. "/" .. v[2].Value
					end
					local new_node = node:AddNode(v[2].Label)
					if (v[2].Icon) then
						new_node:SetIcon(v[2].Icon)
					elseif (v[2].Color) then
						function new_node.Icon:PaintOver(w,h)
							surface.SetDrawColor(v[2].Color)
							surface.DrawRect(0,0,w,h)
						end
					end
					if (#v[1] == 0) then
						function new_node:DoClick()
							PropertiesContent:Clear()
							local checkbox = PropertiesContent:AddProperty(v[2])
							function checkbox:OnChange()
								PermissionsSave:RememberPermission(my_permission_id, self:GetChecked())
							end
							PermissionsSave:CheckedFromMemory(my_permission_id, checkbox)
						end
					else
						function new_node:DoClick()
							permissions_node_clicked(self, my_permission_id, v)
						end
						r(v[1], new_node, my_permission_id, v[2])
					end
				end
			end
			r(tree, root_node, addon_id)
		end

	local TesterTab = vgui.Create("DPanel", Tabs)
	TesterTab.Paint = nil

	local HelpTabContent = vgui.Create("DPanel", Tabs)
	HelpTabContent.Paint = nil

	Tabs:AddSheet(L"permissions", PermissionsTab, "icon16/group.png")
	Tabs:AddSheet(L"tester", TesterTab, "icon16/wrench_orange.png")
	local HelpTab = Tabs:AddSheet(L"help", HelpTabContent, "icon16/help.png")

	local HelpContent
	function Tabs:OnActiveTabChanged(old, new)
		if (new == HelpTab.Tab) then
			if (IsValid(HelpContent)) then
				HelpContent:SetVisible(true)
			else
				HelpContent = vgui.Create("DPanel", HelpTabContent)
				HelpContent.Paint = nil
				HelpContent:Dock(FILL)

				local HelpControls = vgui.Create("DHTMLControls", HelpContent)
				HelpControls:Dock(TOP)
				HelpControls.HomeURL = "https://gmodadminsuite.github.io/OpenPermissions"

				local HelpHTML = vgui.Create("DHTML", HelpContent)
				HelpHTML:Dock(FILL)
				HelpHTML:OpenURL(HelpControls.HomeURL)

				HelpControls:SetHTML(HelpHTML)
			end
		elseif (IsValid(HelpContent)) then
			HelpContent:SetVisible(false)
		end
	end

	--## Create Dynamic Content ##--

	function DeleteAccessGroup:DoClick()
		for i,line in pairs(AccessGroups:GetLines()) do
			if (not line:IsLineSelected()) then continue end
			if (AccessGroups.Data[line.Data.Enum][line.Data.Value] ~= nil) then
				AccessGroups.Data[line.Data.Enum][line.Data.Value] = nil
			end
			if (OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] ~= nil) then
				OpenPermissions.PermissionsRegistryEditing[line.Data.Enum][line.Data.Value] = nil
			end
			AccessGroups:RemoveLine(i)
		end
		AddonContent:SetShowOverlay(true)
		AddonContent:SwitchToName(L"permissions")
		PermissionsTree:Clear()
		PropertiesContent:Clear()

		PermissionsSave:SetDisabled(false)
	end

	local sorted_addons = {}
	for id, data in pairs(OpenPermissions.Addons) do
		local options = data[2]
		table.insert(sorted_addons, {name = options.Name or id, id = id, data = data})
	end
	table.SortByMember(sorted_addons, "name", true)

	local AddonQueue = {}
	local ActiveAddon
	for _,addon_data in ipairs(sorted_addons) do
		local id, data = addon_data.id, addon_data.data
		local options = data[2]
		AddonSelect:AddChoice(options.Name or id, id, false, options.Icon)

		local Addon = vgui.Create("OpenPermissions.Addon", AddonsContainer)

		if (specific_addon == id) then
			ActiveAddon = Addon
		end

		AddonSelect.AddonBtns[id] = Addon

		Addon:SetSize(200,120)
		Addon:Setup(id, options)
		if (Addon.Addon.Logo) then
			OpenPermissions:AddTooltip(Addon, {
				Text = options.Name
			})
		end

		function Addon:DoClick()
			PropertiesContent:Clear()

			AddonSelect:SetValue(options.Name or id)

			AddonsContainer:SetVisible(false)
			AddonContentContainer:SetVisible(true)

			AccessGroupsDivider:SetRight(AddonContentContainer)

			CopyPermissions:SetDisabled(#AccessGroups:GetSelected() > 1)
			PastePermissions:SetDisabled(true)

			function AccessGroups:OnRowSelected(i, row)
				AddonContent:SetShowOverlay(false)
				PropertiesContent:Clear()
				PermissionsTab:LoadPermissions(id, data)
			end
			if (AccessGroups:GetSelectedLine() ~= nil) then
				AccessGroups:OnRowSelected()
			end
		end

		table.insert(AddonQueue, Addon)
		if (#AddonQueue == 3) then
			AddonsContainer:AddRow(AddonQueue[1], AddonQueue[2], AddonQueue[3])
			AddonQueue = {}
		end
	end
	if (#AddonQueue > 0) then
		AddonsContainer:AddRow(AddonQueue[1], AddonQueue[2], AddonQueue[3])
	end
	if (ActiveAddon) then
		ActiveAddon:DoClick()
	end
end

net.Receive("OpenPermissions.OpenMenu", function()
	OpenPermissions.Addons = OpenPermissions:ReceiveNetworkTable()
	OpenPermissions.PermissionsRegistryEditing = table.Copy(OpenPermissions.PermissionsRegistry)

	local specific_addon = net.ReadBool()
	if (specific_addon) then
		OpenPermissions:OpenMenu(net.ReadString())
	else
		OpenPermissions:OpenMenu()
	end
end)

concommand.Add("openpermissions", function(_, __, args)
	net.Start("OpenPermissions.OpenMenu")
		net.WriteString(table.concat(args, " "))
	net.SendToServer()
end, function(cmd, args)
	local stuff = {}
	if (OpenPermissions.Addons ~= nil) then
		if (#string.Trim(args) > 0) then
			for name in pairs(OpenPermissions.Addons) do
				if (name:lower():find(string.Trim(args):lower())) then
					stuff[#stuff + 1] = "openpermissions " .. name
				end
			end
		else
			for name in pairs(OpenPermissions.Addons) do
				stuff[#stuff + 1] = "openpermissions " .. name
			end
		end
	end
	table.sort(stuff)
	return stuff
end)

net.Receive("OpenPermissions.NoPermissions", function()
	OpenPermissions:ChatPrint(L"operator_only_menu", "[ERROR]", OpenPermissions.COLOR_RED)
end)

net.Receive("OpenPermissions.NotAnAddon", function()
	OpenPermissions:ChatPrint(L"not_an_addon", "[ERROR]", OpenPermissions.COLOR_RED)
end)
--PATH addons/sam-157/lua/autorun/sam.lua:
if SAM_LOADED then return end

local version = tonumber("157") or 157

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
load_file("sam/libs/sh_pon.lua")
load_file("sam/libs/sh_mp.lua")

do
	local IsValid = IsValid
	local OLD_Player = Player

	-- this is because sam sends players' ids to the client, so if a player disconnects while net message is being sent
	-- the client will not know the player's name
	if CLIENT then
		local players = {}

		local Name = function(s)
			return s.name
		end

		local not_valid = function() return false end

		Player = function(id)
			local ply = OLD_Player(id)

			if not IsValid(ply) then
				local name = players[id]
				if name then
					return {
						name = name,
						Name = Name,
						IsValid = not_valid
					}
				end
			end

			return ply
		end

		hook.Add("OnEntityCreated", "SAM.GetPlayerName", function(ent)
			if ent:IsPlayer() and ent:IsValid() then
				ent.sam_userid = ent:UserID() -- userid is -1 in EntityRemoved?????
			end
		end)

		hook.Add("EntityRemoved", "SAM.GetPlayerName", function(ent)
			if not ent:IsPlayer() then return end

			local id = ent.sam_userid
			if not id then return end

			players[id] = ent:Name()

			timer.Simple(60, function()
				if not IsValid(ent) then
					players[id] = nil
				end
			end)
		end)
	end

	local sfs = load_file("sam/libs/sh_sfs.lua")
	sam.sfs = sfs

	local Encoder = sfs.Encoder
	local chars = sfs.chars
	local write = Encoder.write

	local CONSOLE
	CONSOLE = sfs.add_encoder("console", function(buf, color)
		write(buf, chars[CONSOLE])
	end)

	sfs.add_decoder(CONSOLE, function(ctx)
		ctx[1] = ctx[1] + 1
		return sam.console
	end)

	sfs.set_type_function(sam.type)

	Player = OLD_Player
end

load_file("sam/libs/sh_netstream.lua")
load_file("sam/libs/sh_async_netstream.lua")
load_file("sam/libs/sh_globals.lua")
load_file("sam/libs/sql/sv_init.lua")
sam.Promise = load_file("sam/libs/sh_promises.lua")

load_file("sam/sh_colors.lua")

load_file("sam/sh_util.lua")
load_file("sam/sh_lang.lua")
load_file("sam/sv_sql.lua")
load_file("sam/sh_permissions.lua")

load_file("sam/ranks/sh_ranks.lua")
load_file("sam/ranks/sv_ranks.lua")

load_file("sam/config/sh_config.lua")
load_file("sam/config/sv_config.lua")
load_file("sam/config/cl_config.lua")

load_file("sam/player/sh_player.lua")
load_file("sam/player/sh_nw_vars.lua")
load_file("sam/player/sv_player.lua")
load_file("sam/player/cl_player.lua")
load_file("sam/player/sv_ranks.lua")
load_file("sam/player/sv_auth.lua")
load_file("sam/player/sv_bans.lua")

load_file("sam/command/sh_command.lua")
load_file("sam/command/sv_command.lua")
load_file("sam/command/cl_command.lua")

for _, f in ipairs(file.Find("sam/command/arguments/*.lua", "LUA")) do
	load_file("sam/command/arguments/" .. f, "sh")
end

load_file("sam/sh_restrictions.lua")

load_file("sam/menu/sh_init.lua")
load_file("sam/menu/cl_init.lua")

load_file("sam/sh_motd.lua")

local modules = file.Find("sam/modules/*.lua", "LUA")
for _, module in ipairs(modules) do
	load_file("sam/modules/" .. module)
end

load_file("sam/reports/cl_reports.lua")
load_file("sam/reports/sv_reports.lua")

do
	if SERVER then
		hook.Add("SAM.LoadedConfig", "SAM.AdvertsMain", function(config)
			if not config.Adverts then
				sam.config.set("Adverts", {})
			end
		end)
	end
	load_file("sam/cl_adverts.lua")
end

if not FAILED then
	sam.print("Loaded!")
end

if SERVER then
	local path = "sam/importers/"

	concommand.Add("sam_import", function(ply, _, args)
		if IsValid(ply) then return end

		local admin_mod = args[1]
		if not admin_mod then
			sam.print("You need to provide an admin mod to import!")
			return
		end

		if not file.Exists(path .. admin_mod, "LUA") then
			sam.print("There is no importer for '" .. admin_mod .. "'")
			return
		end

		CompileFile(path .. admin_mod .. "/main.lua")()
	end, nil, nil, FCVAR_PROTECTED)
end

SAM_LOADED = true

--PATH addons/sam-157/lua/sam/sh_util.lua:
if SAM_LOADED then return end

local sam = sam

function sam.parse_args(str)
	local args = {}
	local tmp, in_quotes = "", false
	for i = 1, #str do
		local char = str:sub(i, i)
		if char == "\"" then
			-- i could use string.find to find the next double quotes but thats gonna be overkill
			in_quotes = not in_quotes
			if tmp ~= "" or not in_quotes then
				args[#args + 1], tmp = tmp, ""
			end
		elseif char ~= " " or in_quotes then
			tmp = tmp .. char
		elseif tmp ~= "" then
			args[#args + 1], tmp = tmp, ""
		end
	end
	if tmp ~= "" then
		args[#args + 1] = tmp
	end
	return args, #args
end

function sam.get_targets_list(targets)
	if sam.isstring(targets) then
		return {Color(244, 67, 54), targets}
	end

	local len = #targets

	if len == player.GetCount() and len > 1 then
		return {Color(244, 67, 54), sam.language.get("Everyone")}
	end

	local admin = targets.admin
	local result = {}
	local white = Color(236, 240, 241)
	for i = 1, len do
		local target = targets[i]

		if CLIENT and LocalPlayer() == target then
			table.insert(result, Color(255, 215, 0))
			if admin ~= LocalPlayer() then
				table.insert(result, sam.language.get("You"))
			else
				table.insert(result, sam.language.get("Yourself"))
			end
		elseif admin ~= target then
			local name
			if sam.isentity(target) and target.Name then
				name = target:Name()
			else
				name = "Unknown"
				table.insert(result, white)
				table.insert(result, "*")
			end

			table.insert(result, Color(244, 67, 54))
			table.insert(result, name)
		else
			table.insert(result, Color(255, 215, 0))
			table.insert(result, sam.language.get("Themself"))
		end

		if i ~= len then
			table.insert(result, white)
			table.insert(result, ",")
		end
	end

	return result
end

function sam.is_steamid(id, err) -- https://stackoverflow.com/questions/6724268/check-if-input-matches-steam-id-format
	if sam.isstring(id) and id:match("^STEAM_[0-5]:[0-1]:[0-9]+$") ~= nil then
		return true
	else
		return err and error("invalid steamid", 2) or false
	end
end

function sam.is_steamid64(id, err)
	if sam.isstring(id)
		and tonumber(id)
		and id:sub(1, 7) == "7656119"
		and (#id == 17 or #id == 18) then
		return true
	else
		return err and error("invalid steamid64", 2) or false
	end
end

do
	local console = {}

	do
		local return_console = function()
			return "Console"
		end
		for _, v in ipairs({"SteamID", "SteamID64", "Name", "Nick", "Name"}) do
			console[v] = return_console
		end
		setmetatable(console, {
			__tostring = return_console,
			MetaName = "console"
		})
	end

	function console.IsAdmin()
		return true
	end

	function console.IsSuperAdmin()
		return true
	end

	function console:IsUserGroup(name)
		return name == "superadmin"
	end

	function console.GetUserGroup()
		return "superadmin"
	end

	function console.HasPermission()
		return true
	end

	function console.CanTarget()
		return true
	end

	function console.CanTargetRank()
		return true
	end

	function console.GetBanLimit()
		return 0
	end

	function console.SetUserGroup()
	end

	function sam.isconsole(v)
		return v == console
	end

	sam.console = console
end

do
	local times = {
		"year"; 525600,
		"month"; 43800,
		"week"; 10080,
		"day"; 1440,
		"hour"; 60,
		"minute"; 1
	}

	for i = 1, #times, 2 do
		times[i] = " " .. times[i]
	end

	local floor = math.floor
	function sam.format_length(mins) -- Thanks to this guide https://stackoverflow.com/a/21323783
		if mins <= 0 then
			return "Indefinitely"
		elseif mins <= 1 then
			return "1 minute"
		end

		local str = ""
		for i = 1, #times, 2 do
			local n1, n2 = times[i + 1]
			n2, mins = floor(mins / n1), mins % n1

			if n2 > 0 then
				if str ~= "" then
					if mins == 0 then
						str = str .. " and "
					else
						str = str .. ", "
					end
				end
				str = str .. n2 .. times[i]
				if n2 > 1 then
					str = str .. "s"
				end
			end

			if mins == 0 then
				break
			end
		end
		return str
	end
end

do
	local times = {
		m = 1,
		h = 60,
		d = 1440,
		w = 10080,
		mo = 43800,
		y = 525600
	}

	function sam.parse_length(length)
		local time, found = tonumber(length), false
		if sam.isnumber(length) then
			time, found = length, true
		elseif time then
			found = true
		else
			time = 0
			for t, u in length:gmatch("(%d+)(%a+)") do
				u = times[u]
				if u then
					time = time + (u * t)
					found = true
				end
			end
		end
		if not found then return false end
		return math.Clamp(time, 0, 31536000)
	end

	local times2 = {}
	for k, v in SortedPairsByValue(times, true) do
		table.insert(times2, k)
		table.insert(times2, v)
	end

	local floor = math.floor
	function sam.reverse_parse_length(mins) -- Thanks to this guide https://stackoverflow.com/a/21323783
		if mins <= 0 then
			return "0"
		elseif mins <= 1 then
			return "1m"
		end

		local str = ""
		for i = 1, #times2, 2 do
			local n1, n2 = times2[i + 1]
			n2, mins = floor(mins / n1), mins % n1

			if n2 > 0 then
				if str ~= "" then
					str = str .. " "
				end
				str = str .. n2 .. times2[i]
			end

			if mins == 0 then
				break
			end
		end
		return str
	end
end

do
	if SERVER then
		function sam.hook_call(event, ...)
			hook.Call(event, nil, ...)
			sam.netstream.Start(nil, "HookCall", event, ...)
		end

		function sam.client_hook_call(event, ...)
			sam.netstream.Start(nil, "HookCall", event, ...)
		end
	else
		local function hook_call(event, ...)
			hook.Call(event, nil, ...)
		end
		sam.netstream.Hook("HookCall", hook_call)
	end
end

if SERVER then
	local maps = {}

	for k, v in ipairs(file.Find("maps/*.bsp", "GAME")) do
		maps[k] = v:sub(1, -5):lower()
	end

	sam.set_global("Maps", maps)
end

function sam.is_valid_map(name)
	local maps = sam.get_global("Maps", {})
	if name:sub(-4) == ".bsp" then
		name = name:sub(1, -5)
	end
	name = name:lower()
	for i = 1, #maps do
		if maps[i] == name then
			return name
		end
	end
	return false
end

function sam.is_valid_gamemode(name)
	name = name:lower()
	local gamemodes = engine.GetGamemodes()
	for i = 1, #gamemodes do
		local gamemode = gamemodes[i]
		if sam.isstring(gamemode.name) and gamemode.name:lower() == name then
			return true
		end
	end
	return false
end

function sam.hook_first(event, name, func)
	if HOOK_HIGH then
		return hook.Add(event, name, func, HOOK_HIGH)
	end

	return hook.Add(event, name, func)
end

function sam.hook_last(event, name, func)
	if HOOK_LOW then
		return hook.Add(event, name, func, HOOK_LOW)
	end

	return hook.Add(event, name, func)
end

do
	local byte = string.byte
	local gsub = string.gsub
	local char = string.char
	local format = string.format
	local tonumber = tonumber

	local hex_encode = function(c)
		return format("%02X", byte(c))
	end

	function sam.to_hex(text)
		-- gsub returns more than one value, fucking glualint can't stop complaining about using ()
		local hex = gsub(text, ".", hex_encode)
		return hex
	end

	local hex_decode = function(d)
		return char(tonumber(d, 16))
	end

	function sam.from_hex(hex)
		local text = (gsub(hex, "%x%x", hex_decode))
		return text
	end
end

--PATH addons/sam-157/lua/sam_languages/english.lua:
return {
	You = "You",
	Yourself = "Yourself",
	Themself = "Themself",
	Everyone = "Everyone",

	cant_use_as_console = "You need to be a player to use {S Red} command!",
	no_permission = "You don't have permission to use '{S Red}'!",

	cant_target_multi_players = "You can't target multiple players using this command!",
	invalid_id = "Invalid id ({S Red})!",
	cant_target_player = "You can't target {S Red}!",
	cant_target_self = "You can't target your self using {S Red} command!",
	player_id_not_found = "Player with id {S Red} is not found!",
	found_multi_players = "Found multiple players: {T}!",
	cant_find_target = "Can't find a player to target ({S Red})!",

	invalid = "Invalid {S} ({S_2 Red})",
	default_reason = "none",

	menu_help = "Open admin mod menu.",

	-- Chat Commands
	pm_to = "PM to {T}: {V}",
	pm_from = "PM from {A}: {V}",
	pm_help = "Send a personal message (PM) to a player.",

	to_admins = "{A} to admins: {V}",
	asay_help = "Send a message to admins.",

	mute = "{A} muted {T} for {V}. ({V_2})",
	mute_help = "Stop player(s) from sending messages in chat.",

	unmute = "{A} unmuted {T}.",
	unmute_help = "Unmute player(s).",

	you_muted = "You are muted.",

	gag = "{A} gagged {T} for {V}. ({V_2})",
	gag_help = "Stop player(s) from speaking.",

	ungag = "{A} ungagged {T}.",
	ungag_help = "Ungag player(s).",

	-- Fun Commands
	slap = "{A} slapped {T}.",
	slap_damage = "{A} slapped {T} with {V} damage.",
	slap_help = "Slap asses.",

	slay = "{A} slayed {T}.",
	slay_help = "Slay player(s).",

	set_hp = "{A} set the hp for {T} to {V}.",
	hp_help = "Set health for player(s).",

	set_armor = "{A} set the armor for {T} to {V}.",
	armor_help = "Set armor for player(s).",

	ignite = "{A} ignited {T} for {V}.",
	ignite_help = "Ignite player(s).",

	unignite = "{A} extinguished {T}.",
	unignite_help = "Extinguish player(s).",

	god = "{A} enabled god mode for {T}.",
	god_help = "Enable god mode for player(s).",

	ungod = "{A} disabled god mode for {T}.",
	ungod_help = "Disable god mode for player(s).",

	freeze = "{A} froze {T}.",
	freeze_help = "Freeze player(s).",

	unfreeze = "{A} unfroze {T}.",
	unfreeze_help = "Unfreeze player(s).",

	cloak = "{A} cloaked {T}.",
	cloak_help = "Cloak player(s).",

	uncloak = "{A} uncloaked {T}.",
	uncloak_help = "Uncloak player(s).",

	jail = "{A} jailed {T} for {V}. ({V_2})",
	jail_help = "Jail player(s).",

	unjail = "{A} unjailed {T}.",
	unjail_help = "Unjail player(s).",

	strip = "{A} stripped weapons from {T}.",
	strip_help = "Strip weapons from player(s).",

	respawn = "{A} respawned {T}.",
	respawn_help = "Respawn player(s).",

	setmodel = "{A} set the model for {T} to {V}.",
	setmodel_help = "Change player(s)'s model.",

	giveammo = "{A} gave {T} {V} ammo.",
	giveammo_help = "Give player(s) ammo.",

	scale = "{A} set model scale for {T} to {V}.",
	scale_help = "Scale player(s).",

	freezeprops = "{A} froze all props.",
	freezeprops_help = "Freezes all props on the map.",

	-- Teleport Commands
	dead = "You are dead!",
	leave_car = "Leave the vehicle first!",

	bring = "{A} teleported {T}.",
	bring_help = "Bring a player.",

	goto = "{A} teleported to {T}.",
	goto_help = "Goto a player.",

	no_location = "No previous location to return {T} to.",
	returned = "{A} returned {T}.",
	return_help = "Return a player to where he was.",

	-- User Management Commands
	setrank = "{A} set the rank for {T} to {V} for {V_2}.",
	setrank_help = "Set a player's rank.",
	setrankid_help = "Set a player's rank by his steamid/steamid64.",

	addrank = "{A} created a new rank {V}.",
	addrank_help = "Create a new rank.",

	removerank = "{A} removed rank {V}.",
	removerank_help = "Remove a rank.",

	super_admin_access = "superadmin has access to everything!",

	giveaccess = "{A} granted access {V} to {T}.",
	givepermission_help = "Give permission to rank.",

	takeaccess = "{A} taken access {V} from {T}.",
	takepermission_help = "Take permission from rank.",

	renamerank = "{A} renamed rank {T} to {V}.",
	renamerank_help = "Rename rank.",

	changeinherit = "{A} changed the rank to inherit from for {T} to {V}.",
	changeinherit_help = "Change the rank to inherit from.",

	rank_immunity = "{A} changed rank {T}'s immunity to {V}.",
	changerankimmunity_help = "Change rank immunity.",

	rank_ban_limit = "{A} changed rank {T}'s ban limit to {V}.",
	changerankbanlimit_help = "Change rank ban limit.",

	changeranklimit = "{A} changed {V} limit for {T} to {V_2}.",
	changeranklimit_help = "Change rank limits.",

	-- Utility Commands
	map_change = "{A} changing the map to {V} in 10 seconds.",
	map_change2 = "{A} changing the map to {V} with gamemode {V_2} in 10 seconds.",
	map_help = "Change current map and gamemode.",

	map_restart = "{A} restarting the map in 10 seconds.",
	map_restart_help = "Restart current map.",

	mapreset = "{A} reset the map.",
	mapreset_help = "Reset the map.",

	kick = "{A} kicked {T} Reason: {V}.",
	kick_help = "Kick a player.",

	ban = "{A} banned {T} for {V} ({V_2}).",
	ban_help = "Ban a player.",

	banid = "{A} banned ${T} for {V} ({V_2}).",
	banid_help = "Ban a player using his steamid.",

	-- ban message when admin name doesn't exists
	ban_message = [[


		You are banned by: {S}

		Reason: {S_2}

		You will be unbanned in: {S_3}]],

	-- ban message when admin name exists
	ban_message_2 = [[


		You are banned by: {S} ({S_2})

		Reason: {S_3}

		You will be unbanned in: {S_4}]],

	unban = "{A} unbanned {T}.",
	unban_help = "Unban a player using his steamid.",

	noclip = "{A} has toggled noclip for {T}.",
	noclip_help = "Toggle noclip on player(s).",

	cleardecals = "{A} cleared ragdolls and decals for all players.",
	cleardecals_help = "Clear ragdolls and decals for all players.",

	stopsound = "{A} stopped all sounds.",
	stopsound_help = "Stop all sounds for all players.",

	not_in_vehicle = "You are not in a vehicle!",
	not_in_vehicle2 = "{S Blue} is not in a vehicle!",
	exit_vehicle = "{A} forced {T} to get out from a vehicle.",
	exit_vehicle_help = "Force a player out of a vehicle.",

	time_your = "Your total time is {V}.",
	time_player = "{T} total time is {V}.",
	time_help = "Check a player's time.",

	admin_help = "Activate admin mode.",
	unadmin_help = "Deactivate admin mode.",

	buddha = "{A} enabled buddha mode for {T}.",
	buddha_help = "Make player(s) godmoded when their health is 1.",

	unbuddha = "{A} disabled buddha mode for {T}.",
	unbuddha_help = "Disable buddha mode for player(s).",

	give = "{A} gave {T} {V}.",
	give_help = "Give player(s) weapon/entity",

	-- DarkRP Commands
	arrest = "{A} arrested {T} forever.",
	arrest2 = "{A} arrested {T} for {V} seconds.",
	arrest_help = "Arrest player(s).",

	unarrest = "{A} unarrested {T}.",
	unarrest_help = "Unarrest player(s).",

	setmoney = "{A} set money for {T} to {V}.",
	setmoney_help = "Set money for a player.",

	addmoney = "{A} added {V} for {T}.",
	addmoney_help = "Add money for a player.",

	door_invalid = "invalid door to sell.",
	door_no_owner = "no one owns this door.",

	selldoor = "{A} sold a door/vehicle for {T}.",
	selldoor_help = "Unown the door/vehicle you are looking at.",

	sellall = "{A} sold every door/vehicle for {T}.",
	sellall_help = "Sell every door/vehicle owned for a player.",

	s_jail_pos = "{A} set a new jail position.",
	setjailpos_help = "Resets all jail positions and sets a new one at your location.",

	a_jail_pos = "{A} added a new jail position.",
	addjailpos_help = "Adds a jail position at your current location.",

	setjob = "{A} set {T}'s job to {V}.",
	setjob_help = "Change a player's job.",

	shipment = "{A} spawned {V} shipment.",
	shipment_help = "Spawn a shipment.",

	forcename = "{A} set the name for {T} to {V}.",
	forcename_taken = "Name already taken. ({V})",
	forcename_help = "Force name for a player.",

	report_claimed = "{A} claimed a report submitted by {T}.",
	report_closed = "{A} closed a report submitted by {T}.",
	report_aclosed = "Your report is closed. (Time expired)",

	rank_expired = "{V} rank for {T} expired.",

	-- TTT Commands
	setslays = "{A} set amount of auto-slays for {T} to {V}.",
	setslays_help = "Set amount of rounds to auto-slay a player for.",

	setslays_slayed = "{T} got auto-slayed, slays left: {V}.",

	removeslays = "{A} removed auto-slays for {T}.",
	removeslays_help = "Remove auto-slays for a player."
}
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
--PATH addons/sam-157/lua/sam/modules/chat.lua:
if SAM_LOADED then return end

local sam, command, language = sam, sam.command, sam.language

command.set_category("Chat")

command.new("pm")
	:SetPermission("pm", "user")

	:AddArg("player", {allow_higher_target = true, single_target = true, cant_target_self = true})
	:AddArg("text", {hint = "message", check = function(str)
		return str:match("%S") ~= nil
	end})

	:GetRestArgs()

	:Help("pm_help")

	:OnExecute(function(ply, targets, message)
		if ply:sam_get_pdata("unmute_time") then
			return ply:sam_send_message("you_muted")
		end

		local target = targets[1]

		ply:sam_send_message("pm_to", {
			T = targets, V = message
		})

		if ply ~= target then
			target:sam_send_message("pm_from", {
				A = ply, V = message
			})
		end
	end)
:End()

do
	sam.permissions.add("see_admin_chat", nil, "admin")

	local reports_enabled = sam.config.get_updated("Reports", true)
	command.new("asay")
		:SetPermission("asay", "user")

		:AddArg("text", {hint = "message"})
		:GetRestArgs()

		:Help("asay_help")

		:OnExecute(function(ply, message)
			if reports_enabled.value and not ply:HasPermission("see_admin_chat") then
				local success, time = sam.player.report(ply, message)
				if success == false then
					ply:sam_send_message("You need to wait {S Red} seconds.", {
						S = time
					})
				else
					ply:sam_send_message("to_admins", {
						A = ply, V = message
					})
				end
				return
			end

			local targets = {ply}

			local players = player.GetHumans()
			for i = 1, #players do
				local v = players[i]
				if v:HasPermission("see_admin_chat") and v ~= ply then
					table.insert(targets, v)
				end
			end

			sam.player.send_message(targets, "to_admins", {
				A = ply, V = message
			})
		end)
	:End()

	if SERVER then
		sam.hook_last("PlayerSay", "SAM.Chat.Asay", function(ply, text)
			if text:sub(1, 1) == "@" then
				ply:Say("!asay " .. text:sub(2))
				return ""
			end
		end)
	end
end

do
	command.new("mute")
		:SetPermission("mute", "admin")

		:AddArg("player")
		:AddArg("length", {optional = true, default = 0, min = 0})
		:AddArg("text", {hint = "reason", optional = true, default = sam.language.get("default_reason")})

		:GetRestArgs()

		:Help("mute_help")

		:OnExecute(function(ply, targets, length, reason)
			local current_time = SysTime()

			for i = 1, #targets do
				local target = targets[i]
				target:sam_set_pdata("unmute_time", length ~= 0 and (current_time + length * 60) or 0)
			end

			sam.player.send_message(nil, "mute", {
				A = ply, T = targets, V = sam.format_length(length), V_2 = reason
			})
		end)
	:End()

	command.new("unmute")
		:SetPermission("unmute", "admin")
		:AddArg("player", {optional = true})
		:Help("unmute_help")

		:OnExecute(function(ply, targets)
			for i = 1, #targets do
				targets[i]:sam_set_pdata("unmute_time", nil)
			end

			sam.player.send_message(nil, "unmute", {
				A = ply, T = targets
			})
		end)
	:End()

	if SERVER then
		sam.hook_first("PlayerSay", "SAM.Chat.Mute", function(ply, text)
			local unmute_time = ply:sam_get_pdata("unmute_time")
			if not unmute_time then return end

			if text:sub(1, 1) == "!" and text:sub(2, 2):match("%S") ~= nil then
				local args = sam.parse_args(text:sub(2))

				local cmd_name = args[1]
				if not cmd_name then return end

				local cmd = command.get_command(cmd_name)
				if cmd then
					return
				end
			end

			if unmute_time == 0 or unmute_time > SysTime() then
				return ""
			else
				ply:sam_set_pdata("unmute_time", nil)
			end
		end)
	end
end

do
	command.new("gag")
		:SetPermission("gag", "admin")

		:AddArg("player")
		:AddArg("length", {optional = true, default = 0, min = 0})
		:AddArg("text", {hint = "reason", optional = true, default = sam.language.get("default_reason")})

		:GetRestArgs()

		:Help("gag_help")

		:OnExecute(function(ply, targets, length, reason)
			for i = 1, #targets do
				local target = targets[i]
				target.sam_gagged = true
				if length ~= 0 then
					timer.Create("SAM.UnGag" .. target:SteamID64(), length * 60, 1, function()
						RunConsoleCommand("sam", "ungag", "#" .. target:EntIndex())
					end)
				end
			end

			sam.player.send_message(nil, "gag", {
				A = ply, T = targets, V = sam.format_length(length), V_2 = reason
			})
		end)
	:End()

	command.new("ungag")
		:SetPermission("ungag", "admin")

		:AddArg("player", {optional = true})
		:Help("ungag_help")

		:OnExecute(function(ply, targets)
			for i = 1, #targets do
				local target = targets[i]
				target.sam_gagged = nil
				timer.Remove("SAM.UnGag" .. target:SteamID64())
			end

			sam.player.send_message(nil, "ungag", {
				A = ply, T = targets
			})
		end)
	:End()

	if SERVER then
		hook.Add("PlayerCanHearPlayersVoice", "SAM.Chat.Gag", function(_, ply)
			if ply.sam_gagged then
				return false
			end
		end)

		hook.Add("PlayerInitialSpawn", "SAM.Gag", function(ply)
			local gag_time = ply:sam_get_pdata("gagged")
			if gag_time then
				ply:sam_set_pdata("gagged", nil)
				RunConsoleCommand("sam", "gag", "#" .. ply:EntIndex(), gag_time / 60, "LTAP")
			end
		end)

		hook.Add("PlayerDisconnected", "SAM.Gag", function(ply)
			if ply.sam_gagged then
				ply:sam_set_pdata("gagged", timer.TimeLeft("SAM.UnGag" .. ply:SteamID64()) or 0)
			end
		end)
	end
end
--PATH addons/sam-157/lua/sam/modules/user.lua:
if SAM_LOADED then return end

local sam, command, language = sam, sam.command, sam.language

command.set_category("User Management")

command.new("setrank")
	:Aliases("adduser", "changerank", "giverank")

	:SetPermission("setrank")

	:AddArg("player", {single_target = true})
	:AddArg("rank", {check = function(rank, ply)
		return ply:CanTargetRank(rank)
	end})
	:AddArg("length", {optional = true, default = 0})

	:Help("setrank_help")

	:OnExecute(function(ply, targets, rank, length)
		targets[1]:sam_set_rank(rank, length)

		sam.player.send_message(nil, "setrank", {
			A = ply, T = targets, V = rank, V_2 = sam.format_length(length)
		})
	end)
:End()

command.new("setrankid")
	:Aliases("adduserid", "changerankid", "giverankid")

	:SetPermission("setrankid")

	:AddArg("steamid")
	:AddArg("rank", {check = function(rank, ply)
		return ply:CanTargetRank(rank)
	end})
	:AddArg("length", {optional = true, default = 0})

	:Help("setrankid_help")

	:OnExecute(function(ply, promise, rank, length)
		local a_name = ply:Name()

		promise:done(function(data)
			local steamid, target = data[1], data[2]
			if target then
				target:sam_set_rank(rank, length)

				sam.player.send_message(nil, "setrank", {
					A = ply, T = {target, admin = ply}, V = rank, V_2 = sam.format_length(length)
				})
			else
				sam.player.set_rank_id(steamid, rank, length)

				sam.player.send_message(nil, "setrank", {
					A = a_name, T = steamid, V = rank, V_2 = sam.format_length(length)
				})
			end
		end)
	end)
:End()

command.new("addrank")
	:SetPermission("manage_ranks")

	:AddArg("text", {hint = "rank name", check = function(rank)
		return not sam.ranks.is_rank(rank)
	end})
	:AddArg("rank", {hint = "inherit from"})
	:AddArg("number", {hint = "immunity", min = 2, max = 99, optional = true})
	:AddArg("length", {hint = "ban limit", optional = true})

	:Help("addrank_help")

	:MenuHide()

	:OnExecute(function(ply, rank, inherit, immunity, ban_limit)
		sam.ranks.add_rank(rank, inherit, immunity, ban_limit)

		sam.player.send_message(nil, "addrank", {
			A = ply, V = rank
		})
	end)
:End()

command.new("removerank")
	:SetPermission("manage_ranks")

	:AddArg("rank", {check = function(rank)
		return not sam.ranks.is_default_rank(rank)
	end})

	:Help("removerank_help")

	:MenuHide()

	:OnExecute(function(ply, rank)
		sam.ranks.remove_rank(rank)

		sam.player.send_message(nil, "removerank", {
			A = ply, V = rank
		})
	end)
:End()

command.new("renamerank")
	:SetPermission("manage_ranks")

	:AddArg("rank", {check = function(rank)
		return not sam.ranks.is_default_rank(rank)
	end})
	:AddArg("text", {hint = "new name", check = function(rank)
		return not sam.ranks.is_rank(rank)
	end})

	:Help("renamerank_help")

	:MenuHide()

	:OnExecute(function(ply, rank, new_name)
		sam.ranks.rename_rank(rank, new_name)

		sam.player.send_message(nil, "renamerank", {
			A = ply, T = rank, V = new_name
		})
	end)
:End()

command.new("changeinherit")
	:SetPermission("manage_ranks")

	:AddArg("rank", {check = function(rank)
		return rank ~= "user" and rank ~= "superadmin"
	end})
	:AddArg("rank", {hint = "inherits from"})

	:Help("changeinherit_help")

	:MenuHide()

	:OnExecute(function(ply, rank, inherit)
		if rank == inherit then return end

		sam.ranks.change_inherit(rank, inherit)

		sam.player.send_message(nil, "changeinherit", {
			A = ply, T = rank, V = inherit
		})
	end)
:End()

command.new("changerankimmunity")
	:SetPermission("manage_ranks")

	:AddArg("rank", {check = function(rank)
		return rank ~= "user" and rank ~= "superadmin"
	end})
	:AddArg("number", {hint = "new immunity", min = 2, max = 99})

	:Help("changerankimmunity_help")

	:MenuHide()

	:OnExecute(function(ply, rank, new_immunity)
		sam.ranks.change_immunity(rank, new_immunity)

		sam.player.send_message(nil, "rank_immunity", {
			A = ply, T = rank, V = new_immunity
		})
	end)
:End()

command.new("changerankbanlimit")
	:SetPermission("manage_ranks")

	:AddArg("rank", {check = function(rank)
		return rank ~= "superadmin"
	end})
	:AddArg("length")

	:Help("changerankbanlimit_help")

	:MenuHide()

	:OnExecute(function(ply, rank, new_limit)
		sam.ranks.change_ban_limit(rank, new_limit)

		sam.player.send_message(nil, "rank_ban_limit", {
			A = ply, T = rank, V = sam.format_length(new_limit)
		})
	end)
:End()

command.new("givepermission")
	:SetPermission("manage_ranks")

	:AddArg("rank")
	:AddArg("text", {hint = "permission"})

	:Help("givepermission_help")

	:MenuHide()

	:OnExecute(function(ply, rank, permission)
		if rank == "superadmin" then
			return ply:sam_send_message("super_admin_access")
		end

		sam.ranks.give_permission(rank, permission)

		sam.player.send_message(nil, "giveaccess", {
			A = ply, V = permission, T = rank
		})
	end)
:End()

command.new("takepermission")
	:SetPermission("manage_ranks")

	:AddArg("rank")
	:AddArg("text", {hint = "permission"})

	:Help("takepermission_help")

	:MenuHide()

	:OnExecute(function(ply, rank, permission)
		if rank == "superadmin" then
			return ply:sam_send_message("super_admin_access")
		end

		sam.ranks.take_permission(rank, permission)

		sam.player.send_message(nil, "takeaccess", {
			A = ply, V = permission, T = rank
		})
	end)
:End()

command.new("changeranklimit")
	:SetPermission("manage_ranks")

	:AddArg("rank")
	:AddArg("text", {hint = "limit"})
	:AddArg("number", {hint = "value"})

	:Help("changeranklimit_help")

	:MenuHide()

	:OnExecute(function(ply, rank, limit, value)
		if rank == "superadmin" then
			return ply:sam_send_message("super_admin_access")
		end

		sam.ranks.set_limit(rank, limit, value)

		sam.player.send_message(nil, "changeranklimit", {
			A = ply, T = rank, V = limit, V_2 = value
		})
	end)
:End()
--PATH addons/sui/lua/sui/vgui/sui_number_slider.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local NUMBER_SLIDER_FONT = SUI.CreateFont("NumberSlider", "Roboto Regular", 14)

local PANEL = {}

sui.scaling_functions(PANEL)

function PANEL:Init()
	self:ScaleInit()

	local slider = vgui.Create(NAME .. ".Slider", self, "NumberSlider")
	slider:Dock(FILL)

	self.slider = slider

	local label = self:Add(NAME .. ".Label")
	label:Dock(RIGHT)
	label:DockMargin(3, 0, 0, 0)
	label:SetFont(NUMBER_SLIDER_FONT)
	self.label = label

	function label:Think()
		self:SetText(slider:GetValue())

		self:SizeToContents()
	end

	self:SetSize(100, 12)
	self:InvalidateLayout(true)
end

sui.register("NumberSlider", PANEL, "Panel")

--PATH addons/chatbox/lua/scb/libs/message_pack/sh_messagepack.lua:
if SCB_LOADED then return end

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

local type = scb.type
local isnumber = scb.isnumber
local _ENV = nil
local m = {}

--[[ debug only
local function hexadump (s)
	return (s:gsub('.', function (c) return format('%02X ', c:byte()) end))
end
m.hexadump = hexadump
--]]

local function argerror (caller, narg, extramsg)
	error("bad argument #" .. tostring(narg) .. " to "
		  .. caller .. " (" .. extramsg .. ")")
end

local function typeerror (caller, narg, arg, tname)
	argerror(caller, narg, tname .. " expected, got " .. type(arg))
end

local function checktype (caller, narg, arg, tname)
	if type(arg) ~= tname then
		typeerror(caller, narg, arg, tname)
	end
end

local packers = setmetatable({}, {
	__index = function (t, k)
		if k == 1 then return end   -- allows ipairs
		error("pack '" .. k .. "' is unimplemented")
	end
})
m.packers = packers

packers['nil'] = function (buffer)
	buffer[#buffer+1] = char(0xC0)	-- nil
end

packers['boolean'] = function (buffer, bool)
	if bool then
		buffer[#buffer+1] = char(0xC3)	-- true
	else
		buffer[#buffer+1] = char(0xC2)	-- false
	end
end

packers['string_compat'] = function (buffer, str)
	local n = #str
	if n <= 0x1F then
		buffer[#buffer+1] = char(0xA0 + n)	-- fixstr
	elseif n <= 0xFFFF then
		buffer[#buffer+1] = char(0xDA,		-- str16
								 floor(n / 0x100),
								 n % 0x100)
	elseif n <= 4294967295.0 then
		buffer[#buffer+1] = char(0xDB,		-- str32
								 floor(n / 0x1000000),
								 floor(n / 0x10000) % 0x100,
								 floor(n / 0x100) % 0x100,
								 n % 0x100)
	else
		error"overflow in pack 'string_compat'"
	end
	buffer[#buffer+1] = str
end

packers['_string'] = function (buffer, str)
	local n = #str
	if n <= 0x1F then
		buffer[#buffer+1] = char(0xA0 + n)		-- fixstr
	elseif n <= 0xFF then
		buffer[#buffer+1] = char(0xD9,			-- str8
								 n)
	elseif n <= 0xFFFF then
		buffer[#buffer+1] = char(0xDA,			-- str16
								 floor(n / 0x100),
								 n % 0x100)
	elseif n <= 4294967295.0 then
		buffer[#buffer+1] = char(0xDB,			-- str32
								 floor(n / 0x1000000),
								 floor(n / 0x10000) % 0x100,
								 floor(n / 0x100) % 0x100,
								 n % 0x100)
	else
		error"overflow in pack 'string'"
	end
	buffer[#buffer+1] = str
end

packers['binary'] = function (buffer, str)
	local n = #str
	if n <= 0xFF then
		buffer[#buffer+1] = char(0xC4,		-- bin8
								 n)
	elseif n <= 0xFFFF then
		buffer[#buffer+1] = char(0xC5,		-- bin16
								 floor(n / 0x100),
								 n % 0x100)
	elseif n <= 4294967295.0 then
		buffer[#buffer+1] = char(0xC6,		-- bin32
								 floor(n / 0x1000000),
								 floor(n / 0x10000) % 0x100,
								 floor(n / 0x100) % 0x100,
								 n % 0x100)
	else
		error"overflow in pack 'binary'"
	end
	buffer[#buffer+1] = str
end

local set_string = function (str)
	if str == 'string_compat' then
		packers['string'] = packers['string_compat']
	elseif str == 'string' then
		packers['string'] = packers['_string']
	elseif str == 'binary' then
		packers['string'] = packers['binary']
	else
		argerror('set_string', 1, "invalid option '" .. str .."'")
	end
end
m.set_string = set_string

packers['map'] = function (buffer, tbl, n)
	if n <= 0x0F then
		buffer[#buffer+1] = char(0x80 + n)		-- fixmap
	elseif n <= 0xFFFF then
		buffer[#buffer+1] = char(0xDE,			-- map16
								 floor(n / 0x100),
								 n % 0x100)
	elseif n <= 4294967295.0 then
		buffer[#buffer+1] = char(0xDF,			-- map32
								 floor(n / 0x1000000),
								 floor(n / 0x10000) % 0x100,
								 floor(n / 0x100) % 0x100,
								 n % 0x100)
	else
		error"overflow in pack 'map'"
	end
	for k, v in pairs(tbl) do
		packers[type(k)](buffer, k)
		packers[type(v)](buffer, v)
	end
end

packers['array'] = function (buffer, tbl, n)
	if n <= 0x0F then
		buffer[#buffer+1] = char(0x90 + n)		-- fixarray
	elseif n <= 0xFFFF then
		buffer[#buffer+1] = char(0xDC,			-- array16
								 floor(n / 0x100),
								 n % 0x100)
	elseif n <= 4294967295.0 then
		buffer[#buffer+1] = char(0xDD,			-- array32
								 floor(n / 0x1000000),
								 floor(n / 0x10000) % 0x100,
								 floor(n / 0x100) % 0x100,
								 n % 0x100)
	else
		error"overflow in pack 'array'"
	end
	for i = 1, n do
		local v = tbl[i]
		packers[type(v)](buffer, v)
	end
end

local set_array = function (array)
	if array == 'without_hole' then
		packers['_table'] = function (buffer, tbl)
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
			if max ~= n then	-- there are holes
				is_map = true
			end
			if is_map then
				packers['map'](buffer, tbl, n)
			else
				packers['array'](buffer, tbl, n)
			end
		end
	elseif array == 'with_hole' then
		packers['_table'] = function (buffer, tbl)
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
				packers['map'](buffer, tbl, n)
			else
				packers['array'](buffer, tbl, max)
			end
		end
	elseif array == 'always_as_map' then
		packers['_table'] = function(buffer, tbl)
			local n = 0
			for k in pairs(tbl) do
				n = n + 1
			end
			packers['map'](buffer, tbl, n)
		end
	else
		argerror('set_array', 1, "invalid option '" .. array .."'")
	end
end
m.set_array = set_array

packers['table'] = function (buffer, tbl)
	packers['_table'](buffer, tbl)
end

packers['unsigned'] = function (buffer, n)
	if n >= 0 then
		if n <= 0x7F then
			buffer[#buffer+1] = char(n)			-- fixnum_pos
		elseif n <= 0xFF then
			buffer[#buffer+1] = char(0xCC,		-- uint8
									 n)
		elseif n <= 0xFFFF then
			buffer[#buffer+1] = char(0xCD,		-- uint16
									 floor(n / 0x100),
									 n % 0x100)
		elseif n <= 4294967295.0 then
			buffer[#buffer+1] = char(0xCE,		-- uint32
									 floor(n / 0x1000000),
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		else
			buffer[#buffer+1] = char(0xCF,		-- uint64
									 0,			-- only 53 bits from double
									 floor(n / 0x1000000000000) % 0x100,
									 floor(n / 0x10000000000) % 0x100,
									 floor(n / 0x100000000) % 0x100,
									 floor(n / 0x1000000) % 0x100,
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		end
	else
		if n >= -0x20 then
			buffer[#buffer+1] = char(0x100 + n) -- fixnum_neg
		elseif n >= -0x80 then
			buffer[#buffer+1] = char(0xD0,		-- int8
									 0x100 + n)
		elseif n >= -0x8000 then
			n = 0x10000 + n
			buffer[#buffer+1] = char(0xD1,		-- int16
									 floor(n / 0x100),
									 n % 0x100)
		elseif n >= -0x80000000 then
			n = 4294967296.0 + n
			buffer[#buffer+1] = char(0xD2,		-- int32
									 floor(n / 0x1000000),
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		else
			buffer[#buffer+1] = char(0xD3,		-- int64
									 0xFF,		-- only 53 bits from double
									 floor(n / 0x1000000000000) % 0x100,
									 floor(n / 0x10000000000) % 0x100,
									 floor(n / 0x100000000) % 0x100,
									 floor(n / 0x1000000) % 0x100,
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		end
	end
end

packers['signed'] = function (buffer, n)
	if n >= 0 then
		if n <= 0x7F then
			buffer[#buffer+1] = char(n)			-- fixnum_pos
		elseif n <= 0x7FFF then
			buffer[#buffer+1] = char(0xD1,		-- int16
									 floor(n / 0x100),
									 n % 0x100)
		elseif n <= 0x7FFFFFFF then
			buffer[#buffer+1] = char(0xD2,		-- int32
									 floor(n / 0x1000000),
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		else
			buffer[#buffer+1] = char(0xD3,		-- int64
									 0,			-- only 53 bits from double
									 floor(n / 0x1000000000000) % 0x100,
									 floor(n / 0x10000000000) % 0x100,
									 floor(n / 0x100000000) % 0x100,
									 floor(n / 0x1000000) % 0x100,
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		end
	else
		if n >= -0x20 then
			buffer[#buffer+1] = char(0xE0 + 0x20 + n)   -- fixnum_neg
		elseif n >= -0x80 then
			buffer[#buffer+1] = char(0xD0,		-- int8
									 0x100 + n)
		elseif n >= -0x8000 then
			n = 0x10000 + n
			buffer[#buffer+1] = char(0xD1,		-- int16
									 floor(n / 0x100),
									 n % 0x100)
		elseif n >= -0x80000000 then
			n = 4294967296.0 + n
			buffer[#buffer+1] = char(0xD2,		-- int32
									 floor(n / 0x1000000),
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		else
			buffer[#buffer+1] = char(0xD3,		-- int64
									 0xFF,		-- only 53 bits from double
									 floor(n / 0x1000000000000) % 0x100,
									 floor(n / 0x10000000000) % 0x100,
									 floor(n / 0x100000000) % 0x100,
									 floor(n / 0x1000000) % 0x100,
									 floor(n / 0x10000) % 0x100,
									 floor(n / 0x100) % 0x100,
									 n % 0x100)
		end
	end
end

local set_integer = function (integer)
	if integer == 'unsigned' then
		packers['integer'] = packers['unsigned']
	elseif integer == 'signed' then
		packers['integer'] = packers['signed']
	else
		argerror('set_integer', 1, "invalid option '" .. integer .."'")
	end
end
m.set_integer = set_integer

packers['float'] = function (buffer, n)
	local sign = 0
	if n < 0.0 then
		sign = 0x80
		n = -n
	end
	local mant, expo = frexp(n)
	if mant ~= mant then
		buffer[#buffer+1] = char(0xCA,  -- nan
								 0xFF, 0x88, 0x00, 0x00)
	elseif mant == huge or expo > 0x80 then
		if sign == 0 then
			buffer[#buffer+1] = char(0xCA,	  -- inf
									 0x7F, 0x80, 0x00, 0x00)
		else
			buffer[#buffer+1] = char(0xCA,	  -- -inf
									 0xFF, 0x80, 0x00, 0x00)
		end
	elseif (mant == 0.0 and expo == 0) or expo < -0x7E then
		buffer[#buffer+1] = char(0xCA,  -- zero
								 sign, 0x00, 0x00, 0x00)
	else
		expo = expo + 0x7E
		mant = floor((mant * 2.0 - 1.0) * ldexp(0.5, 24))
		buffer[#buffer+1] = char(0xCA,
								 sign + floor(expo / 0x2),
								 (expo % 0x2) * 0x80 + floor(mant / 0x10000),
								 floor(mant / 0x100) % 0x100,
								 mant % 0x100)
	end
end

packers['double'] = function (buffer, n)
	local sign = 0
	if n < 0.0 then
		sign = 0x80
		n = -n
	end
	local mant, expo = frexp(n)
	if mant ~= mant then
		buffer[#buffer+1] = char(0xCB,  -- nan
								 0xFF, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
	elseif mant == huge or expo > 0x400 then
		if sign == 0 then
			buffer[#buffer+1] = char(0xCB,	  -- inf
									 0x7F, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
		else
			buffer[#buffer+1] = char(0xCB,	  -- -inf
									 0xFF, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
		end
	elseif (mant == 0.0 and expo == 0) or expo < -0x3FE then
		buffer[#buffer+1] = char(0xCB,  -- zero
								 sign, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
	else
		expo = expo + 0x3FE
		mant = floor((mant * 2.0 - 1.0) * ldexp(0.5, 53))
		buffer[#buffer+1] = char(0xCB,
								 sign + floor(expo / 0x10),
								 (expo % 0x10) * 0x10 + floor(mant / 0x1000000000000),
								 floor(mant / 0x10000000000) % 0x100,
								 floor(mant / 0x100000000) % 0x100,
								 floor(mant / 0x1000000) % 0x100,
								 floor(mant / 0x10000) % 0x100,
								 floor(mant / 0x100) % 0x100,
								 mant % 0x100)
	end
end

local set_number = function (number)
	if number == 'float' then
		packers['number'] = function (buffer, n)
			if floor(n) == n and n < maxinteger and n > mininteger then
				packers['integer'](buffer, n)
			else
				packers['float'](buffer, n)
			end
		end
	elseif number == 'double' then
		packers['number'] = function (buffer, n)
			if floor(n) == n and n < maxinteger and n > mininteger then
				packers['integer'](buffer, n)
			else
				packers['double'](buffer, n)
			end
		end
	else
		argerror('set_number', 1, "invalid option '" .. number .."'")
	end
end
m.set_number = set_number

for k = 0, 4 do
	local n = tointeger(2^k)
	local fixext = 0xD4 + k
	packers['fixext' .. tostring(n)] = function (buffer, tag, data)
		assert(#data == n, "bad length for fixext" .. tostring(n))
		buffer[#buffer+1] = char(fixext,
								 tag < 0 and tag + 0x100 or tag)
		buffer[#buffer+1] = data
	end
end

packers['ext'] = function (buffer, tag, data)
	local n = #data
	if n <= 0xFF then
		buffer[#buffer+1] = char(0xC7,		  -- ext8
								 n,
								 tag < 0 and tag + 0x100 or tag)
	elseif n <= 0xFFFF then
		buffer[#buffer+1] = char(0xC8,		  -- ext16
								 floor(n / 0x100),
								 n % 0x100,
								 tag < 0 and tag + 0x100 or tag)
	elseif n <= 4294967295.0 then
		buffer[#buffer+1] = char(0xC9,		  -- ext&32
								 floor(n / 0x1000000),
								 floor(n / 0x10000) % 0x100,
								 floor(n / 0x100) % 0x100,
								 n % 0x100,
								 tag < 0 and tag + 0x100 or tag)
	else
		error"overflow in pack 'ext'"
	end
	buffer[#buffer+1] = data
end

function m.pack (data)
	local buffer = {}
	packers[type(data)](buffer, data)
	return tconcat(buffer)
end


local unpackers		 -- forward declaration

local function unpack_cursor (c)
	local s, i, j = c.s, c.i, c.j
	if i > j then
		c:underflow(i)
		s, i, j = c.s, c.i, c.j
	end
	local val = s:byte(i)
	c.i = i+1
	return unpackers[val](c, val)
end
m.unpack_cursor = unpack_cursor

local function unpack_str (c, n)
	local s, i, j = c.s, c.i, c.j
	local e = i+n-1
	if e > j or n < 0 then
		c:underflow(e)
		s, i, j = c.s, c.i, c.j
		e = i+n-1
	end
	c.i = i+n
	return s:sub(i, e)
end

local function unpack_array (c, n)
	local t = {}
	for i = 1, n do
		t[i] = unpack_cursor(c)
	end
	return t
end

local function unpack_map (c, n)
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

local function unpack_float (c)
	local s, i, j = c.s, c.i, c.j
	if i+3 > j then
		c:underflow(i+3)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2, b3, b4 = s:byte(i, i+3)
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
			n = 0.0/0.0
		end
	else
		n = sign * ldexp(1.0 + mant / 0x800000, expo - 0x7F)
	end
	c.i = i+4
	return n
end

local function unpack_double (c)
	local s, i, j = c.s, c.i, c.j
	if i+7 > j then
		c:underflow(i+7)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2, b3, b4, b5, b6, b7, b8 = s:byte(i, i+7)
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
			n = 0.0/0.0
		end
	else
		n = sign * ldexp(1.0 + mant / 4503599627370496.0, expo - 0x3FF)
	end
	c.i = i+8
	return n
end

local function unpack_uint8 (c)
	local s, i, j = c.s, c.i, c.j
	if i > j then
		c:underflow(i)
		s, i, j = c.s, c.i, c.j
	end
	local b1 = s:byte(i)
	c.i = i+1
	return b1
end

local function unpack_uint16 (c)
	local s, i, j = c.s, c.i, c.j
	if i+1 > j then
		c:underflow(i+1)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2 = s:byte(i, i+1)
	c.i = i+2
	return b1 * 0x100 + b2
end

local function unpack_uint32 (c)
	local s, i, j = c.s, c.i, c.j
	if i+3 > j then
		c:underflow(i+3)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2, b3, b4 = s:byte(i, i+3)
	c.i = i+4
	return ((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4
end

local function unpack_uint64 (c)
	local s, i, j = c.s, c.i, c.j
	if i+7 > j then
		c:underflow(i+7)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2, b3, b4, b5, b6, b7, b8 = s:byte(i, i+7)
	c.i = i+8
	return ((((((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4) * 0x100 + b5) * 0x100 + b6) * 0x100 + b7) * 0x100 + b8
end

local function unpack_int8 (c)
	local s, i, j = c.s, c.i, c.j
	if i > j then
		c:underflow(i)
		s, i, j = c.s, c.i, c.j
	end
	local b1 = s:byte(i)
	c.i = i+1
	if b1 < 0x80 then
		return b1
	else
		return b1 - 0x100
	end
end

local function unpack_int16 (c)
	local s, i, j = c.s, c.i, c.j
	if i+1 > j then
		c:underflow(i+1)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2 = s:byte(i, i+1)
	c.i = i+2
	if b1 < 0x80 then
		return b1 * 0x100 + b2
	else
		return ((b1 - 0xFF) * 0x100 + (b2 - 0xFF)) - 1
	end
end

local function unpack_int32 (c)
	local s, i, j = c.s, c.i, c.j
	if i+3 > j then
		c:underflow(i+3)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2, b3, b4 = s:byte(i, i+3)
	c.i = i+4
	if b1 < 0x80 then
		return ((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4
	else
		return ((((b1 - 0xFF) * 0x100 + (b2 - 0xFF)) * 0x100 + (b3 - 0xFF)) * 0x100 + (b4 - 0xFF)) - 1
	end
end

local function unpack_int64 (c)
	local s, i, j = c.s, c.i, c.j
	if i+7 > j then
		c:underflow(i+7)
		s, i, j = c.s, c.i, c.j
	end
	local b1, b2, b3, b4, b5, b6, b7, b8 = s:byte(i, i+7)
	c.i = i+8
	if b1 < 0x80 then
		return ((((((b1 * 0x100 + b2) * 0x100 + b3) * 0x100 + b4) * 0x100 + b5) * 0x100 + b6) * 0x100 + b7) * 0x100 + b8
	else
		return ((((((((b1 - 0xFF) * 0x100 + (b2 - 0xFF)) * 0x100 + (b3 - 0xFF)) * 0x100 + (b4 - 0xFF)) * 0x100 + (b5 - 0xFF)) * 0x100 + (b6 - 0xFF)) * 0x100 + (b7 - 0xFF)) * 0x100 + (b8 - 0xFF)) - 1
	end
end

function m.build_ext (tag, data)
	return nil
end

local function unpack_ext (c, n, tag)
	local s, i, j = c.s, c.i, c.j
	local e = i+n-1
	if e > j or n < 0 then
		c:underflow(e)
		s, i, j = c.s, c.i, c.j
		e = i+n-1
	end
	c.i = i+n
	return m.build_ext(tag, s:sub(i, e))
end

local fn_1 = function(c, val)
	return val
end

local fn_2 = function(c, val)
	return unpack_map(c, val % 0x10)
end

local fn_3 = function(c, val)
	return unpack_array(c, val % 0x10)
end

local fn_4 = function(c, val)
	return unpack_str(c, val % 0x20)
end

local fn_5 = function(c, val)
	return val - 0x100
end

unpackers = setmetatable({
	[0xC0] = function () return nil end,
	[0xC2] = function () return false end,
	[0xC3] = function () return true end,
	[0xC4] = function (c) return unpack_str(c, unpack_uint8(c)) end,	-- bin8
	[0xC5] = function (c) return unpack_str(c, unpack_uint16(c)) end,   -- bin16
	[0xC6] = function (c) return unpack_str(c, unpack_uint32(c)) end,   -- bin32
	[0xC7] = function (c) return unpack_ext(c, unpack_uint8(c), unpack_int8(c)) end,
	[0xC8] = function (c) return unpack_ext(c, unpack_uint16(c), unpack_int8(c)) end,
	[0xC9] = function (c) return unpack_ext(c, unpack_uint32(c), unpack_int8(c)) end,
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
	[0xD4] = function (c) return unpack_ext(c, 1, unpack_int8(c)) end,
	[0xD5] = function (c) return unpack_ext(c, 2, unpack_int8(c)) end,
	[0xD6] = function (c) return unpack_ext(c, 4, unpack_int8(c)) end,
	[0xD7] = function (c) return unpack_ext(c, 8, unpack_int8(c)) end,
	[0xD8] = function (c) return unpack_ext(c, 16, unpack_int8(c)) end,
	[0xD9] = function (c) return unpack_str(c, unpack_uint8(c)) end,
	[0xDA] = function (c) return unpack_str(c, unpack_uint16(c)) end,
	[0xDB] = function (c) return unpack_str(c, unpack_uint32(c)) end,
	[0xDC] = function (c) return unpack_array(c, unpack_uint16(c)) end,
	[0xDD] = function (c) return unpack_array(c, unpack_uint32(c)) end,
	[0xDE] = function (c) return unpack_map(c, unpack_uint16(c)) end,
	[0xDF] = function (c) return unpack_map(c, unpack_uint32(c)) end,
}, {
	__index = function (t, k)
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
			return function () error("unpack '" .. format('%#x', k) .. "' is unimplemented") end
		end
	end
})

local function cursor_string (str)
	return {
		s = str,
		i = 1,
		j = #str,
		underflow = function ()
						error "missing bytes"
					end,
	}
end

local function cursor_loader (ld)
	return {
		s = '',
		i = 1,
		j = 0,
		underflow = function (self, e)
						self.s = self.s:sub(self.i)
						e = e - self.i + 1
						self.i = 1
						self.j = 0
						while e > self.j do
							local chunk = ld()
							if not chunk then
								error "missing bytes"
							end
							self.s = self.s .. chunk
							self.j = #self.s
						end
					end,
	}
end

function m.unpack (s)
	checktype('unpack', 1, s, 'string')
	local cursor = cursor_string(s)
	local data = unpack_cursor(cursor)
	if cursor.i <= cursor.j then
		error "extra bytes"
	end
	return data
end

function m.unpacker (src)
	if type(src) == 'string' then
		local cursor = cursor_string(src)
		return function ()
			if cursor.i <= cursor.j then
				return cursor.i, unpack_cursor(cursor)
			end
		end
	elseif type(src) == 'function' then
		local cursor = cursor_loader(src)
		return function ()
			if cursor.i > cursor.j then
				pcall(cursor.underflow, cursor, cursor.i)
			end
			if cursor.i <= cursor.j then
				return true, unpack_cursor(cursor)
			end
		end
	else
		argerror('unpacker', 1, "string or function expected, got " .. type(src))
	end
end

set_string'string_compat'
set_integer'unsigned'
if SIZEOF_NUMBER == 4 then
	maxinteger = 16777215
	mininteger = -maxinteger
	m.small_lua = true
	unpackers[0xCB] = nil	   -- double
	unpackers[0xCF] = nil	   -- uint64
	unpackers[0xD3] = nil	   -- int64
	set_number'float'
else
	maxinteger = 9007199254740991
	mininteger = -maxinteger
	set_number'double'
	if SIZEOF_NUMBER > 8 then
		m.long_double = true
	end
end
set_array'without_hole'

m._VERSION = '0.5.2'
m._DESCRIPTION = "lua-MessagePack : a pure Lua implementation"
m._COPYRIGHT = "Copyright (c) 2012-2019 Francois Perrad"

return m

--
-- This library is licensed under the terms of the MIT/X11 license,
-- like Lua itself.
--

--PATH addons/chatbox/lua/scb/cl_overrides.lua:
if SCB_LOADED then return end

local table = table
local gui = gui
local team = team
local chat = chat
local hook = hook

local tonumber = tonumber
local Color = Color
local SetClipboardText = SetClipboardText
local IsValid = IsValid
local date = os.date
local team_GetColor = team.GetColor

local scb = scb
local config = scb.config
local language = scb.language

chat.OldOpen = chat.OldOpen or chat.Open
chat.OldClose = chat.OldClose or chat.Close

-- sometimes default chatbox prevents opening the console???
chat.OldClose()

local TEAM = "(" .. language.team .. ") "

function chat.Open(mode)
	mode = tonumber(mode)

	local dont_open = hook.Run("StartChat", mode ~= 1)
	if dont_open == true then return end

	scb.create_chatbox()

	local chatbox = scb.chatbox
	if chatbox.hidden == false then return end

	chatbox.bteam = mode
	chatbox.text_entry:SetPlaceholder((mode ~= 1 and TEAM or "") .. language.type_something)

	chatbox:SetVisible(true)
	chatbox.text_entry:RequestFocus()
	chatbox.text_entry:InvalidateLayout()
	chatbox:MakePopup()

	local childs = chatbox.scroll_panel:GetCanvas():GetChildren()
	for i = 1, #childs do
		local v = childs[i]
		v:Stop()
		v:AlphaTo(255, 0)
	end

	net.Start("SCB.IsTyping")
		net.WriteBool(true)
	net.SendToServer()
end

function chat.Close()
	local chatbox = scb.chatbox
	if not chatbox then return end

	if IsValid(scb.emojis_menu) then
		scb.emojis_menu:Remove()
	end

	chatbox.text_entry:SetValue("")
	chatbox.text_entry:OnTextChanged() -- reset chat history

	local childs = chatbox.scroll_panel:GetCanvas():GetChildren()
	for i = 1, #childs do
		local v = childs[i]
		if v.can_hide == nil then
			v:Stop()
			v:AlphaTo(0, 0)
		end
	end

	chatbox:SetVisible(false)
	chatbox:SetMouseInputEnabled(false)
	chatbox:SetKeyboardInputEnabled(false)

	chatbox.scroll_panel:ScrollToBottom()

	hook.Run("FinishChat")

	net.Start("SCB.IsTyping")
		net.WriteBool(false)
	net.SendToServer()
end

chat.OldGetChatBoxPos = chat.OldGetChatBoxPos or chat.GetChatBoxPos
function chat.GetChatBoxPos()
	if scb.chatbox then
		return scb.chatbox:GetPos()
	end
	return chat.OldGetChatBoxPos()
end

chat.OldGetChatBoxSize = chat.OldGetChatBoxSize or chat.GetChatBoxSize
function chat.GetChatBoxSize()
	if scb.chatbox then
		return scb.chatbox:GetSize()
	end
	return chat.OldGetChatBoxSize()
end

local fade_out_time = GetConVar("scb_message_fade_out_time"):GetFloat()
cvars.AddChangeCallback("scb_message_fade_out_time", function(_, _, value_new)
	fade_out_time = value_new
end)

chat.OldAddText = chat.OldAddText or chat.AddText
local AddText_queue = {}
local allow_parsing = config.parse_in_chat
function chat.AddText(...)
	local args
	if AddText_queue == true then
		args = ...
	else
		chat.OldAddText(...)
		args = {n = select("#", ...), ...}
	end

	if not scb.chatbox then
		table.insert(AddText_queue, args)
		return
	end

	local scroll_panel = scb.chatbox.scroll_panel
	local down = scroll_panel:ShouldScrollDown()

	local line = scroll_panel:Add("SCB.ChatLine")
	line:HideAfterTime(fade_out_time)

	line.parsing = true

	local current_color = line.text_color
	for i = 1, args.n do
		local v = args[i]
		local t = scb.type(v)
		if t == "Color" then
			current_color = v
		elseif t == "string" then
			if allow_parsing then
				line:Parse(v, current_color)
			else
				line:NewLabel(v, current_color)
			end
		elseif scb.isentity(v) and not IsValid(v) and not v:IsWorld() then
			line:NewLabel("NULL", current_color)
		elseif t == "Player" then
			line:NewLabel(v:Name(), team_GetColor(v:Team()))
		elseif t == "Entity" then
			line:NewLabel(v:GetClass(), current_color)
		end
	end

	line.parsing = nil

	line:SizeToChildren(false, true)

	if down then
		scroll_panel:ScrollToBottom()
	end
end

local gamemodes_OnPlayerChat = {}
do
	local add_say = function(key, func)
		gamemodes_OnPlayerChat[key] = func
	end

	local line_DoRightClick = function(s)
		local d_menu = DermaMenu()

		local text = s.text
		d_menu:AddOption(language.copy_text, function()
			SetClipboardText(text)
		end)

		local message = s.message
		d_menu:AddOption(language.copy_message, function()
			SetClipboardText(message)
		end)

		local steamid = s.steamid
		if steamid then
			d_menu:AddSpacer()

			d_menu:AddOption(language.copy_steamid, function()
				SetClipboardText(util.SteamIDFrom64(steamid))
			end)

			d_menu:AddOption(language.copy_steamid64, function()
				SetClipboardText(steamid)
			end)

			d_menu:AddOption(language.show_profile, function()
				gui.OpenURL("https://steamcommunity.com/profiles/" .. steamid)
			end)
		end

		d_menu:AddSpacer()
		local time = s.time
		d_menu:AddOption(language.copy_time, function()
			SetClipboardText(time)
		end)

		d_menu:Open()
		d_menu:MakePopup()
	end

	local show_timestamps = GetConVar("scb_show_timestamps"):GetBool()
	cvars.AddChangeCallback("scb_show_timestamps", function(_, _, value_new)
		show_timestamps = tobool(value_new)
	end)

	local show_avatars = config.enable_avatars and GetConVar("scb_show_avatars"):GetBool() or false
	cvars.AddChangeCallback("scb_show_avatars", function(_, _, value_new)
		show_avatars = tobool(value_new)
	end)

	local default_say = function(ply, text, bteam, is_dead, name_replacement, name_color_replacement, text_color)
		local is_console = not ply:IsValid()

		local scroll_panel = scb.chatbox.scroll_panel
		local down = scroll_panel:ShouldScrollDown()

		local line = scroll_panel:Add("SCB.ChatLine")
		line:HideAfterTime(fade_out_time)

		line.parsing = true
		line.time = date(config.timestamps_format)

		if show_timestamps then
			line:SetFont(SCB_16)
			line:NewLabel(line.time .. " ", Color(164, 164, 164))
			line:SetFont(SCB_18)
		end

		local name, name_color
		if not is_console then
			if show_avatars then
				line:NewAvatar(ply)
			end

			if is_dead then
				line:NewLabel(language.dead, Color(244, 67, 54))
			end

			if bteam then
				line:NewLabel(TEAM, Color(76, 175, 80))
			end

			local tag = ply:SCB_GetTag()
			if tag then
				line.emoji_size = 18
				line:Parse(tag .. " ")
				line.emoji_size = 24
			end

			if name_replacement then
				name = name_replacement
			else
				name = ply:Name()
			end

			if name_color_replacement then
				name_color = name_color_replacement
			else
				name_color = team_GetColor(ply:Team())
			end

			line.steamid = ply:SteamID64()
		else
			line:NewLabel("*")
			name, name_color = language.console, Color(13, 130, 223)
		end

		line:NewLabel(name, name_color)
		line:NewLabel(": ")
		line:SetPlayer(ply)
		line:Parse(text, text_color)

		line.message = text
		line.DoRightClick = line_DoRightClick

		if down then
			scroll_panel:ScrollToBottom()
		end

		chat.OldAddText(Color(164, 164, 164), line.time .. " - ", name_color, name, line.text_color, ": ", text_color, text)

		return true
	end
	add_say(1, default_say)

	add_say("darkrp", function(ply, text, _, is_dead, prefix, col1, col2)
		return default_say(ply, text, false, is_dead, prefix, col1, col2 ~= color_white and col2 or nil)
	end)

	add_say("terrortown", function(ply, text, bteam, is_dead)
		if not IsValid(ply) then
			return default_say(ply, text, bteam, is_dead)
		end

		local is_spec = ply:Team() == TEAM_SPEC
		if is_spec then
			is_dead = true
		end

		if bteam and ((not is_spec and not ply:IsSpecial()) or is_spec) then
			bteam = false
		end

		local name_color
		if ply:GetTraitor() then
			name_color = Color(244, 67, 54)
		elseif ply:GetDetective() then
			name_color = Color(13, 130, 223)
		end

		return default_say(ply, text, bteam, is_dead, nil, name_color)
	end)
end

local OnPlayerChat_queue = {}
hook.Add("OnPlayerChat", "SCB", function(...)
	table.insert(OnPlayerChat_queue, {n = select("#", ...), ...})
	return true
end)

local OnPlayerChat
hook.Add("HUDPaint", "SCB", function()
	chat.Open(1)

	for _, v in ipairs(AddText_queue) do
		AddText_queue = true
		chat.AddText(v)
	end
	AddText_queue = nil

	hook.Remove("OnPlayerChat", "SCB")
	OnPlayerChat = gamemodes_OnPlayerChat[engine.ActiveGamemode()] or gamemodes_OnPlayerChat[1]
	function GAMEMODE:OnPlayerChat(...)
		return OnPlayerChat(...)
	end
	for _, v in ipairs(OnPlayerChat_queue) do
		OnPlayerChat(unpack(v, 1, v.n))
	end
	OnPlayerChat_queue = nil

	chat.Close()
	hook.Remove("HUDPaint", "SCB")
end)

hook.Add("PlayerButtonDown", "SCB", function()
	local chatbox = scb.chatbox
	if chatbox and not chatbox.hidden then
		chatbox.text_entry:RequestFocus()
	end
end)

-- https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/mp/src/game/client/clientmode_shared.cpp#L651
timer.Simple(5, function()
	local binds = {
		messagemode = 1,
		say = 1,

		messagemode2 = 0,
		say_team = 0
	}

	local old_PlayerBindPress = GAMEMODE.PlayerBindPress
	function GAMEMODE:PlayerBindPress(ply, bind, pressed)
		if old_PlayerBindPress(self, ply, bind, pressed) == true then
			return true
		end

		local team_mode = binds[bind]
		if team_mode then
			if pressed then
				chat.Open(team_mode)
			end
			return true
		end
	end
end)

timer.Simple(5, function()
	local types = {
		namechange = 1,
		servermsg = 1,
		teamchange = 1,
		none = 1,
	}

	if not config.enable_custom_join_messages and not config.enable_custom_leave_messages then
		types.joinleave = 1
	end

	local old_ChatText = GAMEMODE.ChatText
	function GAMEMODE:ChatText(index, name, text, type, ...)
		if old_ChatText(self, index, name, text, type) == true then
			return true
		end

		if types[type] then
			chat.AddText(text)
			return true
		end

		if type == "joinleave" then
			return true
		end
	end
end)

if config.enable_custom_join_messages then
	local show_var = GetConVar("scb_joindisconnect_message")

	local printed_join = {}
	gameevent.Listen("player_connect_client")
	hook.Add("player_connect_client", "SCB.JoinMessage", function(data)
		if not show_var:GetBool() then return end

		if data.bot == 1 then
			chat.AddText((
				language.bot_joined:gsub("NAME", scb.escape(data.name))
			))
			return
		end

		local steamid = data.networkid
		if not printed_join[steamid] then
			printed_join[steamid] = true

			timer.Simple(4, function()
				printed_join[steamid] = nil
			end)

			chat.AddText((
				language.player_connecting:gsub("NAME", scb.escape(data.name)):gsub("STEAMID", data.networkid)
			))
		end
	end)
end

if config.enable_custom_leave_messages then
	local show_var = GetConVar("scb_joindisconnect_message")

	local printed_left = {}
	gameevent.Listen("player_disconnect")
	hook.Add("player_disconnect", "SCB.LeaveMessage", function(data)
		if not show_var:GetBool() then return end

		if data.bot == 1 then
			chat.AddText((
				language.bot_left:gsub("NAME", scb.escape(data.name))
			))
			return
		end

		local steamid = data.networkid
		if not printed_left[steamid] then
			printed_left[steamid] = true

			timer.Simple(4, function()
				printed_left[steamid] = nil
			end)

			chat.AddText((
				language.player_left:gsub("NAME", scb.escape(data.name)):gsub("REASON", scb.escape(data.reason)):gsub("STEAMID", data.networkid)
			))
		end
	end)
end

hook.Add("HUDShouldDraw", "SCB", function(name)
	if name == "CHudChat" then
		return false
	end
end)

net.Receive("SCB.TTTRadio", function()
	local sender = net.ReadEntity()
	local msg = net.ReadString()
	local param = net.ReadString()
	if not IsValid(sender) and sender:IsPlayer() then return end

	GAMEMODE:PlayerSentRadioCommand(sender, msg, param)

	local lang_param = LANG.GetNameParam(param)
	if lang_param then
		if lang_param == "quick_corpse_id" then
			param = LANG.GetParamTranslation(lang_param, {player = net.ReadString()})
		else
			param = LANG.GetTranslation(lang_param)
		end
	end

	local text = LANG.GetParamTranslation(msg, {player = param})

	if lang_param then
		text = util.Capitalize(text)
	end

	OnPlayerChat(sender, text, false, false)
end)
--PATH addons/sl_util_atm/lua/autorun/sh_batm.lua:
--Id's used via net message to identify the message type
BATM_NET_COMMANDS = {
	--Client to server
	selectAccount = 1,
	deposit       = 2,
	withdraw      = 3,
	transfer      = 4,
	kickUser      = 5,
	addUser       = 6,

	--Server to client
	receiveAccountInfo = 50,
}

--PATH addons/sl_util_atm/lua/batm_scenes/history.lua:
--[[-------------------------------------------------------------------------
Draws the last 20 transactions of an account
---------------------------------------------------------------------------]]

surface.CreateFont( "batm_history_large", {
	font = "Roboto",
	extended = false,
	size = 35,
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

surface.CreateFont( "batm_history_med", {
	font = "Coolvetica",
	extended = false,
	size = 32,
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


surface.CreateFont( "batm_history_small", {
	font = "Coolvetica",
	extended = false,
	size = 30,
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

	--Previous buttons
	ent:AddButton(ScrW/2 - 350, 585, 150, 50, 
		function() --On Pressed
			if scene.page == 2 then
				scene.page = 1
			end
		end
	)

	--Next buttons
	ent:AddButton(ScrW/2 + 350 - 150, 585, 150, 50,
		function() --On Pressed
			local account = BATM.GetActiveAccount()
			if account ~= nil and account.balanceHistory[11] ~= nil and scene.page == 1  then
				scene.page = 2
			end
		end
	)

	--back button
	ent:AddButton(35, 135, 64, 64, 
		function() --On pressed
			if BATM.SelectedAccount == "personal" then
				ent:SetScene("personalaccount")
			else
				ent:SetScene("groupaccount")
			end
		end
	)
end

local back = Material("bluesatm/back.png", "noclamp smooth")

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	local account = BATM.GetActiveAccount()
	if account == nil then return end --This should not happen but just incase

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw back button
	surface.SetDrawColor(Color(255,255,255,100))
	surface.SetMaterial(back)
	surface.DrawTexturedRect(35, 135, 64, 64)

	local yOffset = 135

	--Show previous history
	for i = 1 , 10 do
		local index = i
		if scene.page == 2 then
			index = i + 10
		end

		--Skip if no history exists
		if account.balanceHistory[index] == nil then continue end

		--draw a transaction
		local color = Color(52, 73, 94)
		if i%2 == 0 then
			color = Color(52 * 1.1, 73 * 1.1, 94 * 1.1)
		end
		draw.RoundedBox(0,ScrW/2 - 350, yOffset, 700, 40, color)
		local text = ""

		if account.balanceHistory[index].amount < 0 then
			text = "-"..BATM.Lang["$"]
			color = Color(246 * 1.2, 41 * 1.2, 80 * 1.2)
		else 
			color = Color(100,200,120)
			text = "+"..BATM.Lang["$"]
		end

		text = text..CBLib.Helper.CommaFormatNumber(math.abs(account.balanceHistory[index].amount))
		draw.SimpleText(text, "batm_history_large",ScrW/2 - 350 + 10, yOffset + 20, color, 0, 1)
		draw.SimpleText(account.balanceHistory[index].description, "batm_history_small",ScrW/2 + 350 - 10, yOffset + 20, Color(255,255,255, 100), 2, 1)
		--add to offset
		yOffset = yOffset + 45
	end

	--Draw next and previous buttons
	if scene.page == 2 then 
		draw.RoundedBox(0, ScrW/2 - 350, 585, 150, 50,Color(52, 73, 94))
		draw.SimpleText(BATM.Lang["Previous"], "batm_history_med",ScrW/2 - 350 + 75, 585 + 25, Color(255,255,255,220), 1, 1)
	else
		draw.RoundedBox(0, ScrW/2 - 350, 585, 150, 50,Color(52, 73, 94, 80))
		draw.SimpleText(BATM.Lang["Previous"], "batm_history_med",ScrW/2 - 350 + 75, 585 + 25, Color(255,255,255,30), 1, 1)
	end

	if account.balanceHistory[11] ~= nil and scene.page == 1 then 
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
BATM.RegisterScene(scene, "history")

--PATH addons/sl_util_atm/lua/batm_scenes/done_withdraw.lua:
--[[-------------------------------------------------------------------------
Draws the done withdraw screen
---------------------------------------------------------------------------]]


surface.CreateFont( "batm_done_text", {
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

local scene = {}

local done = Material("bluesatm/done.png", "noclamp smooth")

--Called when the scene is loaded
function scene.Load(ent)
	timer.Simple(2.5, function()
		if BATM.SelectedAccount == "personal" then
			ent:SetScene("personalaccount")
		else
			ent:SetScene("groupaccount")
		end
	end)

	-- subscrib code blue tugtoial

end

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw background
	draw.RoundedBox(0, 0, 100, ScrW, ScrH - 100, Color(231, 126, 34,255))

	--Draw logo
	surface.SetDrawColor(Color(255,255,255,50))
	surface.SetMaterial(done)
	surface.DrawTexturedRectRotated(ScrW/2, ScrH/2, 256, 256, 0)

	--Draw text
	draw.SimpleText(BATM.Lang["Withdrawal Complete."], "batm_done_text", ScrW/2, ScrH - 150, Color(255,255,255,100), 1)

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
BATM.RegisterScene(scene, "done_withdraw")

--PATH lua/catmullromcams/stools/sh_layout.lua:
local STool = {}

CatmullRomCams.SToolMethods.Layout  = STool
CatmullRomCams.SToolMethods.ToolObj = nil

function STool.LeftClick(self, trace)
	local ply   = self:GetOwner()
	
	trace = {}
	trace.start  = ply:GetShootPos()
	trace.endpos = trace.start + (ply:GetAimVector() * 99999999)
	trace.filter = ply
	trace = util.TraceLine(trace)
	
	local key = self:GetClientNumber("key")
	
	if key == -1 then ply:ChatPrint("You must assign a key to the camera before spawning it!") return false end
	if CLIENT then    return true  end -- what's the point, I never seem to be able to get the client to call n STool func :crying:
	
	local plyID = ply:UniqueID()
	
	local facetraveldir   = (self:GetClientNumber("facetraveldir") == 1)
	
	local bank_on_turn    = (self:GetClientNumber("bankonturn") == 1)
	local bank_delta_max  =  self:GetClientNumber("bankdelta_max")
	local bank_multiplyer =  self:GetClientNumber("bank_multi")
	
	local zoom = self:GetClientNumber("zoom")
	
	local roll_enabled = (self:GetClientNumber("enable_roll") == 1)
	local roll         =  self:GetClientNumber("roll")
	
	if trace.Entity then
		if trace.Entity:IsPlayer() then return end
		
		if (trace.Entity:GetClass() == "sent_catmullrom_camera") and (ply:GetShootPos():Distance(trace.HitPos) < 512) then
			trace.Entity:SetFaceTravelDir(facetraveldir)
			print(bank_on_turn)
			
			trace.Entity:SetBankOnTurn(bank_on_turn)
			trace.Entity:SetBankDeltaMax(bank_delta_max)
			trace.Entity:SetBankMultiplier(bank_multiplyer)
			print(trace.Entity.BankOnTurn)
			trace.Entity:SetZoom(zoom or 75)
			
			trace.Entity:SetEnableRoll(roll_enabled)
			trace.Entity:SetRoll(roll)
			
			return true
		end
	end
	
	CatmullRomCams.Tracks[plyID]      = CatmullRomCams.Tracks[plyID]      or {}
	CatmullRomCams.Tracks[plyID][key] = CatmullRomCams.Tracks[plyID][key] or {}
	
	local track_index = #CatmullRomCams.Tracks[plyID][key] + 1
	print(track_index)
	local camera = ents.Create("sent_catmullrom_camera")
	if not (camera and camera.IsValid and camera:IsValid()) then return end
	
	local ang = ply:EyeAngles()
	ang.r = (self:GetClientNumber("enable_roll") == 1) and roll or 0
	
	camera:SetAngles(ang)
	camera:SetPos(trace.StartPos)
	camera:Spawn()
	
	camera:SetPlayer(ply)
	
	if CatmullRomCams.Tracks[plyID][key][track_index - 1] and CatmullRomCams.Tracks[plyID][key][track_index - 1]:IsValid() then
		CatmullRomCams.Tracks[plyID][key][track_index - 1]:DeleteOnRemove(camera) -- Because we don't want to have broken chains let's daisy chain them to self destruct
		CatmullRomCams.Tracks[plyID][key][track_index - 1]:SetNWEntity("ChildCamera", camera)
	else
		camera:SetNWBool("IsMasterController", true)
		camera:SetNWEntity("ControllingPlayer", ply)
		
		camera:SetKey(key)
		
		numpad.OnDown(ply, key, "CatmullRomCamera_Toggle", camera)
	end
	
	CatmullRomCams.Tracks[plyID][key][track_index] = camera
	
	camera:SetFaceTravelDir(facetraveldir)
	
	camera:SetBankOnTurn(bank_on_turn)
	camera:SetBankDeltaMax(bank_delta_max)
	camera:SetBankMultiplier(bank_multiplyer)
	
	camera:SetZoom(zoom or 75)
	camera:SetEnableRoll(roll_enabled)
	camera:SetRoll(roll)
	
	camera:SetNWEntity("MasterController", CatmullRomCams.Tracks[plyID][key][1])
	
	camera.UndoData = {}
	camera.UndoData.PID = plyID
	camera.UndoData.Key = key
	camera.UndoData.TrackIndex = track_index
	
	undo.Create("CatmullRomCamera")
		undo.AddEntity(camera)
		
		if track_index ~= 1 then
			undo.AddEntity(constraint.NoCollide(camera, CatmullRomCams.Tracks[plyID][key][1], 0, 0)) -- so the adv dup grabs everything
		end
		
		undo.SetPlayer(ply)
	undo.Finish()
	
	ply:AddCleanup("catmullrom_cameras", camera)
	
	return true, camera
end

function STool.RightClick(self, trace)
	-- Fun Fact: If you check the _G table on the server for the key 'camera' you can find the last camera
	--           requested by the camera STool's Rightclick method because Garry, in his omniscience, declared
	--           that it would be best if he didn't add a local in front of the variable declaration. :loleyes:
	
	if CLIENT then return true end
	
	local ply = self:GetOwner()
	
	if ply:KeyDown(IN_SPEED) and self:ValidTrace(trace) then -- COPY!
		ply:ConCommand("catmullrom_camera_facetraveldir " .. (trace.Entity.FaceTravelDir and 1 or 0) .. "\n")
		
		ply:ConCommand("catmullrom_camera_bankonturn "    .. (trace.Entity.BankOnTurn and 1 or 0) .. "\n")
		ply:ConCommand("catmullrom_camera_bankdelta_max " .. (trace.Entity.DeltaBankMax or 1) .. "\n")
		ply:ConCommand("catmullrom_camera_bank_multi "    .. (trace.Entity.DeltaBankMulti or 1) .. "\n")
		
		ply:ConCommand("catmullrom_camera_zoom "        .. (trace.Entity.Zoom or 75) .. "\n")
		
		ply:ConCommand("catmullrom_camera_enable_roll " .. (trace.Entity.EnableRoll and 1 or 0) .. "\n")
		ply:ConCommand("catmullrom_camera_roll "        .. (trace.Entity.Roll or 0) .. "\n")
		
		return true
	end
	
	local _, camera = self:LeftClick(trace)
	if not (camera and camera.IsValid and camera:IsValid()) then return end

	if trace.Entity:IsWorld() then
		camera:SetTracking(ply, trace.Entity:WorldToLocal(trace.HitPos))
	else
		camera:SetTracking(trace.Entity, trace.Entity:WorldToLocal(trace.HitPos))
	end
	
	return true
end

function STool.Reload(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return true end
	
	local ply = self:GetOwner()
	
	if ply:KeyDown(IN_SPEED) then
		ply:ConCommand("catmullrom_camera_facetraveldir 0\n")
		
		ply:ConCommand("catmullrom_camera_bankonturn 0\n")
		ply:ConCommand("catmullrom_camera_bankdelta_max 1\n")
		ply:ConCommand("catmullrom_camera_bank_multi 1\n")
		
		ply:ConCommand("catmullrom_camera_zoom 75\n")
		
		ply:ConCommand("catmullrom_camera_enable_roll 0\n")
		ply:ConCommand("catmullrom_camera_roll 0\n")
	else
		trace.Entity:SetFaceTravelDir(false)
		
		trace.Entity:SetBankOnTurn(false)
		trace.Entity:SetBankDeltaMax(1)
		trace.Entity:SetBankMultiplier(1)
		
		trace.Entity:SetZoom(75)
		
		trace.Entity:SetEnableRoll(false)
		trace.Entity.SetRoll(0)
	end
	
	return true
end

function STool.Think(self)
	if SERVER then return end
	
	CatmullRomCams.SToolMethods.ToolObj = self -- Hackz
end

function STool.BuildCPanel(panel)
	--panel:AddControl("Header", {Text = "Catmull-Rom Cinematic Cameras: Track Layout Creator", Description = "Use this to create your track's layout!"})
	
	panel:AddControl("Numpad",   {Label = "Track Trigger Key: ", Command = "catmullrom_camera_key", ButtonSize = 22})
	
	panel:AddControl("CheckBox", {Label = "Face Direction Of Travel: ", Description = "Should the cameras face the direction in which they are moving?", Command = "catmullrom_camera_facetraveldir"})
	
	panel:AddControl("CheckBox", {Label = "Bank While Turning: ", Description = "(Requires Face-Direction-Of-Travel) Should the cameras bank/roll when they turn?",                                                                      Command = "catmullrom_camera_bankonturn"})
	panel:AddControl("Slider",   {Label = "Bank Delta: ",         Description = "(Change Speed Max) How fast is the maximum we should be able to bank in one frame? (1 = As much as we want.)", Type = "Float", Min = "0.01", Max = "1", Command = "catmullrom_camera_bankdelta_max"})
	panel:AddControl("Slider",   {Label = "Bank Multiplier: ",    Description = "(Magnify Banking Effect) How much should we multiply the amount we bank in one frame? (1 = No change.)",       Type = "Float", Min = "0.01", Max = "5", Command = "catmullrom_camera_bank_multi"})
	
	panel:AddControl("Slider",   {Label = "Zoom: ", Description = "Default is 75. Press 'USE' (typically 'e' on your keyboard) to reset Zoom & Roll.", Type = "Float", Min = ".1", Max = "110",   Command = "catmullrom_camera_zoom"})
	
	panel:AddControl("CheckBox", {Label = "Enable Roll: ", Description = "ROLL-UP-THE-RIM-TO-WIN! Caution! This overrides bank-on-turn.", Command = "catmullrom_camera_enable_roll"})
	panel:AddControl("Slider",   {Label = "Roll: ",        Description = "DO A BARREL ROLL! Beware! Make sure you add a node with '0' if you just want to make part of the track rolling;\nOtherwise the camera will jump!", Type = "Float", Min = "-180", Max = "180", Command = "catmullrom_camera_roll"})
	
	--panel:AddControl("CheckBox", {Label = "Don't Stop At Track End: ", Description = "(Requires to be on Control node.) Just stay at the last position at the end of the track.", Command = "catmullrom_camera_enable_stay_on_end"})
	--panel:AddControl("CheckBox", {Label = "Loop Track: ",              Description = "(Requires to be on Control node & that the option above is on.) But loop instead.", Command = "catmullrom_camera_enable_looping"})
end

--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/languages/french.lua:
//Translated by: Mika http://steamcommunity.com/id/pb_mika32/
RHandcuffsConfig.Language =  RHandcuffsConfig.Language or {}
RHandcuffsConfig.Language["French"] = {
CuffedBy = "Vous �tes menott� par : %s",
Cuffer = "Vous avez menott� %s.",
ReleasedBy = "Vous avez �t� lib�r� par : %s",
Releaser = "Vous venez de lib�rer %s.",
 
CantEnterVehicle = "Vous ne pouvez pas entrer dans un v�hicule en �tant menott�",
CantLeaveVehicle = "Vous ne pouvez pas sortir du v�hicule si vous �tes menott�",
CantSpawnProps = "Vous ne pouvez pas faire appara�tre de props en �tant menott�",
CantChangeTeam = "Vous ne pouvez pas changer de m�tier en �tant menott�",
CantSwitchSeat = "Vous ne pouvez pas changer de si�ge en �tant menott�",
 
ConfiscateReward = "La confisquation de cette arme vous rapporte %s �",
ArrestReward = "L'arrestation de %s vous rapporte %s �",
AlreadyArrested = "Cette personne est d�j� arr�t�",
MustBeCuffed = "Vous devez menotter cette personne avant de la mettre en prison",
ReqLockpick = "Vous devez lockpick les menottes pour le lib�rer",

PlayerPutInDriver = "Player was put in driver seat.",
CantCuffRestrained = "Vous ne pouvez pas menotter cette personne",
NoSeats = "Aucun si�ge disponible dans ce v�hicule",
CuffingText = "Menottage %s",
TazedPlayer = "Personne tas�",
 
CuffedText = "Vous �tes menott�",
SurrenderedText = "Vous avez les mains en l'air",
}
--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/cl_rhandcuffs.lua:

local RHC_BoneManipulations = {
	["Cuffed"] = {
		["ValveBiped.Bip01_R_UpperArm"] = Angle(-28,18,-21),
		["ValveBiped.Bip01_L_Hand"] = Angle(0,0,119),
		["ValveBiped.Bip01_L_Forearm"] = Angle(15,20,40),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(15, 26, 0),
		["ValveBiped.Bip01_R_Forearm"] = Angle(0,50,0),
		["ValveBiped.Bip01_R_Hand"] = Angle(45,34,-15),
		["ValveBiped.Bip01_L_Finger01"] = Angle(0,50,0),
		["ValveBiped.Bip01_R_Finger0"] = Angle(10,2,0),
		["ValveBiped.Bip01_R_Finger1"] = Angle(-10,0,0),
		["ValveBiped.Bip01_R_Finger11"] = Angle(0,-40,0),
		["ValveBiped.Bip01_R_Finger12"] = Angle(0,-30,0)
	},
	["HandsUp"] = {	
		["ValveBiped.Bip01_R_UpperArm"] = Angle(73,35,128),
		["ValveBiped.Bip01_L_Hand"] = Angle(-12,12,90),
		["ValveBiped.Bip01_L_Forearm"] = Angle(-28,-29,44),
		["ValveBiped.Bip01_R_Forearm"] = Angle(-22,1,15),
		["ValveBiped.Bip01_L_UpperArm"] = Angle(-77,-46,4),
		["ValveBiped.Bip01_R_Hand"] = Angle(33,39,-21),
		["ValveBiped.Bip01_L_Finger01"] = Angle(0,30,0),
		["ValveBiped.Bip01_L_Finger1"] = Angle(0,45,0),
		["ValveBiped.Bip01_L_Finger11"] = Angle(0,45,0),
		["ValveBiped.Bip01_L_Finger2"] = Angle(0,45,0),
		["ValveBiped.Bip01_L_Finger21"] = Angle(0,45,0),
		["ValveBiped.Bip01_L_Finger3"] = Angle(0,45,0),
		["ValveBiped.Bip01_L_Finger31"] = Angle(0,45,0),
		["ValveBiped.Bip01_R_Finger0"] = Angle(-10,0,0),
		["ValveBiped.Bip01_R_Finger11"] = Angle(0,30,0),
		["ValveBiped.Bip01_R_Finger2"] = Angle(20,25,0),
		["ValveBiped.Bip01_R_Finger21"] = Angle(0,45,0),
		["ValveBiped.Bip01_R_Finger3"] = Angle(20,35,0),
		["ValveBiped.Bip01_R_Finger31"] = Angle(0,45,0)
	}
}

net.Receive("rhc_bonemanipulate", function()
	local Player, Type, Reset = net.ReadEntity(), net.ReadString(), net.ReadBool()
	
	for k,v in pairs(RHC_BoneManipulations[Type]) do
		local Bone = Player:LookupBone(k)
		if Bone then
			if Reset then
				Player:ManipulateBoneAngles(Bone, Angle(0,0,0))
			else
				Player:ManipulateBoneAngles(Bone, v)			
			end
		end
	end
	if RHandcuffsConfig.DisablePlayerShadow then
		Player:DrawShadow(false)
	end	
end)

local PLAYER = FindMetaTable("Player")
//Whacky way to add text without overriding the function completely
hook.Add("loadCustomDarkRPItems", "rhc_set_drawPINFO", function()
	local OldDrawPlayerInfo = PLAYER.drawPlayerInfo
	function RHC_AddInCuffs(self)
		if RHandcuffsConfig.DisplayOverheadCuffed and self:GetNWBool("rhc_cuffed", false) then
			local pos = self:EyePos()

			pos.z = pos.z + 10
			pos = pos:ToScreen()
			if not self:getDarkRPVar("wanted") then
				pos.y = pos.y - 50
			end
			
			draw.DrawNonParsedText("Handcuffed", "DarkRPHUD2", pos.x + 1, pos.y - 19, Color(0,0,0,255), 1)
			draw.DrawNonParsedText("Handcuffed", "DarkRPHUD2", pos.x, pos.y - 20, Color(255,255,255,255) , 1)
		end
		OldDrawPlayerInfo(self)
	end
	PLAYER.drawPlayerInfo = RHC_AddInCuffs
end)
	
local RHC_ChatOpen = false
hook.Add("StartChat", "RHC_OnChatOpen", function()
	RHC_ChatOpen = true
end)

hook.Add("FinishChat", "RHC_OnChatOpen", function()
	RHC_ChatOpen = false
end)

local RHC_LastSurrender = 0
hook.Add("Think","TBFY_Surrender",function()
	if RHandcuffsConfig.SurrenderEnabled and input.IsKeyDown(RHandcuffsConfig.SurrenderKey) then
		if (!LOUNGE_CHAT or !LOUNGE_CHAT.ChatboxOpen) and !gui.IsConsoleVisible() and !RHC_ChatOpen and (!xgui or (IsValid(xgui.anchor) and !xgui.anchor:IsVisible())) then
			if RHC_LastSurrender < CurTime() then
				net.Start("tbfy_surrender")
				net.SendToServer()
				RHC_LastSurrender = CurTime() + 1
			end
		end
	end
end)

net.Receive("rhc_send_inspect_information", function()
	local Player, WepTbl = net.ReadEntity(), net.ReadTable()
	
	local InsMenu = vgui.Create("rhc_inspect_menu")
	InsMenu:SetupInfo(Player, WepTbl)
	LocalPlayer().LastInspect = Player
end)

surface.CreateFont( "rhc_inspect_headline", {
	font = "Arial",
	size = 20,
	weight = 1000,
	antialias = true,
})

surface.CreateFont( "rhc_inspect_information", {
	font = "Arial",
	size = 20,
	weight = 100,
	antialias = true,
})

surface.CreateFont( "rhc_inspect_confiscate_weapon", {
	font = "Arial",
	size = 11,
	weight = 1000,
	antialias = true,
})

surface.CreateFont( "rhc_inspect_stealmoney", {
	font = "Arial",
	size = 14,
	weight = 1000,
	antialias = true,
})

surface.CreateFont( "rhc_inspect_weaponname", {
	font = "Arial",
	size = 14,
	weight = 100,
	antialias = true,
})

local MainPanelColor = Color(255,255,255,200)
local HeaderColor = Color(0,71,130,255)
local SecondPanelColor = Color(215,215,220,255)
local ButtonColor = Color(50,50,50,255)
local ButtonColorHovering = Color(0,71,130,200)
local ButtonColorPressed = Color(150,150,150,200)
local ButtonOutline = Color(0,0,0,200)

local PANEL = {}

function PANEL:Init()
	self.ButtonText = ""
	self.BColor = ButtonColor
	self.Font = "rhc_inspect_headline"	
	self:SetText("")
end

function PANEL:UpdateColours()

	if self:IsDown() or self.m_bSelected then self.BColor = ButtonColorPressed return end
	if self.Hovered and !self:GetDisabled() then self.BColor = ButtonColorHovering return end

	self.BColor = ButtonColor
	return
end

function PANEL:SetBText(Text)
	self.ButtonText = Text
end

function PANEL:SetBFont(Font)
	self.Font = Font
end

function PANEL:Paint(W,H)
	draw.RoundedBox(4, 0, 0, W, H, self.BColor)
	draw.SimpleText(self.ButtonText, self.Font, W/2, H/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )   
end
vgui.Register( "rhc_inspect_button", PANEL, "DButton")

local PANEL = {}

function PANEL:Init()
	self.Name = ""
	self.WID = 0
	
	self.ConfisItem = vgui.Create("rhc_inspect_button", self)
	self.ConfisItem:SetBText("CONFISCATE")
	self.ConfisItem:SetBFont("rhc_inspect_confiscate_weapon")
	self.ConfisItem.DoClick = function() net.Start("rhc_confiscate_weapon") net.WriteEntity(LocalPlayer().LastInspect) net.WriteFloat(self.WID) net.SendToServer() self:Remove() end
	
	self.WModel = vgui.Create( "ModelImage", self )
end

function PANEL:Paint(W,H)
	draw.SimpleText(self.Name, "rhc_inspect_weaponname", W/2, 0, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )  
end

function PANEL:PerformLayout(W,H)	
	self.ConfisItem:SetPos(2.5,H-20)
	self.ConfisItem:SetSize(W-5,15)
	
	self.WModel:SetPos(2.5,10)
    self.WModel:SetSize(W-15,W-15)	
end

function PANEL:SetInfo(Wep, ID)
	local SWEPTable = weapons.GetStored(Wep)
	if SWEPTable.WorldModel then
		self.WModel:SetModel(SWEPTable.WorldModel)
	end
	self.Name = SWEPTable.PrintName
	self.WID = ID
end
vgui.Register( "rhc_weapon", PANEL)

local PANEL = {}

function PANEL:Init()	
	self:ShowCloseButton(false)
	self:SetTitle("")   
	self:MakePopup()
	
	self.Name = "INVALID"
	self.Job = "INVALID"
	self.SteamID = "INVALID"
	self.Wallet = 0
	self.WepItems = {}

    self.TopDPanel = vgui.Create("DPanel", self)
	self.TopDPanel.Paint = function(selfp, W,H)
		draw.RoundedBoxEx(8, 0, 0, W, H, HeaderColor, true, true, false, false)	
		draw.SimpleText("Inspecting: " .. self.Name, "rhc_inspect_headline", W/2, H/2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )			
	end	
	
    self.InfoDPanel = vgui.Create("DPanel", self)
	self.InfoDPanel.Paint = function(selfp, W,H) 
		draw.RoundedBoxEx(8, 0, 0, W, H, SecondPanelColor, false, false, true, true)
		local TW, TH = surface.GetTextSize("Name: ")
		draw.SimpleText("Name:", "rhc_inspect_headline", 5, 10, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText(self.Name, "rhc_inspect_information", 5+TW, 10, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		TW, TH = surface.GetTextSize("SteamID: ")
		draw.SimpleText("SteamID:", "rhc_inspect_headline", 5, 25, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText(self.SteamID, "rhc_inspect_information", 5 + TW, 25, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		TW, TH = surface.GetTextSize("Job: ")
		draw.SimpleText("Job:", "rhc_inspect_headline", 5, 40, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText(self.Job, "rhc_inspect_information", 5 + TW, 40, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )		
		TW, TH = surface.GetTextSize("Wallet: ")
		draw.SimpleText("Wallet:", "rhc_inspect_headline", 5, 55, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText(self.Wallet, "rhc_inspect_information", 5 + TW, 55, Color(0,0,0,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end		
	
    self.WeaponHeader = vgui.Create("DPanel", self)
	self.WeaponHeader.Paint = function(selfp, W,H) 
		draw.RoundedBoxEx(8, 0, 0, W, H, HeaderColor, true, true, false, false)	
		draw.SimpleText("Weapon List", "rhc_inspect_headline", W/2, H/2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )			
	end		

	self.WeaponList = vgui.Create("DScrollPanel", self)
	self.WeaponList.Paint = function(selfp, W, H)
		draw.RoundedBoxEx(4, 0, 0, W-15, H, SecondPanelColor, false, false, true, true)
	end	
	
	self.WeaponList.VBar.Paint = function() end
	self.WeaponList.VBar.btnUp.Paint = function() end
    self.WeaponList.VBar.btnDown.Paint = function() end	
	self.WeaponList.VBar.btnGrip.Paint = function() end		
	
	self.CloseButton = vgui.Create("rhc_inspect_button", self)
	self.CloseButton:SetBText("X")
	self.CloseButton.DoClick = function() self:Remove() end		
end

function PANEL:SetupInfo(Player, WepTbl)
	self.Name = Player:Nick()
	self.Job = Player:getDarkRPVar("job")
	self.SteamID = Player:SteamID()
	self.Wallet = DarkRP.formatMoney(Player:getDarkRPVar("money"))
	
	for k,v in pairs(WepTbl) do
		if !RHandcuffsConfig.BlackListedWeapons[v] then
			local Wep = vgui.Create("rhc_weapon", self.WeaponList)
			Wep:SetInfo(v, k)
			
			self.WepItems[k] = Wep
		end
	end
end

local TopH = 25
local InfoH =75
local WeaponH = 25
local WeaponListH = 180
function PANEL:Paint(W,H)
	draw.RoundedBoxEx(8, 0, TopH, W, H-TopH, MainPanelColor,false,false,true,true)	
end

local WepsPerLine = 4
local Width, Height, Padding = 300, 330, 5
function PANEL:PerformLayout()	
	self:SetPos(ScrW()/2-Width/2, ScrH()/2-Height/2)
	self:SetSize(Width, TopH+InfoH+WeaponH+WeaponListH)
	
    self.TopDPanel:SetPos(0,0)
	self.TopDPanel:SetSize(Width,TopH)	
	
    self.InfoDPanel:SetPos(Padding,TopH+Padding)
	self.InfoDPanel:SetSize(Width-Padding*2,InfoH-Padding*2)	

    self.WeaponHeader:SetPos(Padding,TopH+InfoH)
	self.WeaponHeader:SetSize(Width-Padding*2,WeaponH)	
	
	self.WeaponList:SetPos(Padding,TopH+InfoH+WeaponH)
	self.WeaponList:SetSize(Width+Padding, WeaponListH-Padding)
	
	local WAvailable = self.WeaponList:GetWide()-15
	local WepWSize = WAvailable/WepsPerLine
	
	local NumSlots = 0
	local CRow = 0
	for k,v in pairs(self.WepItems) do
		if IsValid(v) then
			if NumSlots >= WepsPerLine then
				NumSlots = 0
				CRow = CRow + 1
			end
			v:SetPos(WepWSize*(NumSlots),CRow*(WepWSize+15))
			v:SetSize(WepWSize,WepWSize+15)
			NumSlots = NumSlots + 1
		end
	end		
	
	self.CloseButton:SetPos(Width-TopH,TopH/2-9)
	self.CloseButton:SetSize(20, 20)	
end
vgui.Register("rhc_inspect_menu", PANEL, "DFrame")
--PATH addons/squad_reborn/lua/squads/client/cl_squad.lua:
local outlines = CreateConVar("squad_outlines", 0, FCVAR_ARCHIVE, "Show outlines trhough walls")
local tips = CreateConVar("squad_tips", 1, FCVAR_ARCHIVE, "Show tips in screen")

hook.Add("PreDrawHalos", "Squad.DoHalos", function()
    if (outlines:GetInt() > 0 and LocalPlayer():GetSquadName() ~= "") then
        for k, v in pairs(LocalPlayer():GetSquadMembers()) do
            if (v ~= LocalPlayer() and IsValid(v)) then
                halo.Add({v}, Color(v:GetPlayerColor().x * 255, v:GetPlayerColor().y * 255, v:GetPlayerColor().z * 255), 2, 2, 1, v:GetPlayerColor():Length() > 0.15, true)
            elseif (not IsValid(v)) then
                table.RemoveByValue(SQUAD.Groups[LocalPlayer():GetSquadName()].Members,v)
                return
            end
        end
    end
end)

net.Receive("Squad.ForceRemove", function()
    local ent = net.ReadEntity()
    ent._squad = nil
    ent._squadLeader = nil

    if (IsValid(squad_window)) then
        squad_window:Recreate()
    end
end)

net.Receive("Squad.QuickSyncGroups", function()
    local delta = net.ReadString( )
    local name = net.ReadString()
    local creator = net.ReadEntity()
    local memberI = net.ReadInt(8)

    if (not SQUAD.Groups[delta]) then
        SQUAD.Groups[delta] = {}
    end

    SQUAD.Groups[delta].Members = {}
    SQUAD.Groups[delta].Name = name
    SQUAD.Groups[delta].Creator = creator
    creator._squadLeader = true

    for k = 1, memberI do
        local ply = net.ReadEntity()
        ply._squad = delta
        SQUAD.Groups[delta].Members[k] = ply
    end

    for k, v in pairs(player.GetAll()) do
        if (IsValid(v.AvatarImage)) then
            v.AvatarImage:Remove()
        end
    end

end)

net.Receive("Squad.SyncGroups", function()
    local delta = net.ReadString()

    if (delta ~= "") then
        SQUAD.Groups[delta] = net.ReadTable()
        for k, v in pairs(player.GetAll()) do
            if (v._squad == delta and not table.HasValue(SQUAD.Groups[delta].Members,v)) then
                v._squad = nil
                v._squadLeader = nil
            end
        end
    else
        SQUAD.Groups = net.ReadTable()
    end

    for tag, group in pairs(SQUAD.Groups or {}) do
        if (not istable(group)) then continue end
        for _, member in pairs(group.Members or {}) do
            member._squad = tag

            if (group.Creator == member) then
                member._squadLeader = true
            end
        end
    end

    if (not LocalPlayer():IsValid()) then return end

    if ((LocalPlayer():GetSquadName() or "") == delta and not table.HasValue(LocalPlayer():GetSquadMembers(), LocalPlayer())) then
        LocalPlayer()._squad = nil
        LocalPlayer()._squadLeader = nil
    end

    for k, v in pairs(player.GetAll()) do
        if (IsValid(v.AvatarImage)) then
            v.AvatarImage:Remove()
        end
    end

    if (IsValid(squad_window)) then
        squad_window:Recreate()
    end
end)

net.Receive("Squad.AssignGroup", function()
    LocalPlayer()._squad = net.ReadString()
    LocalPlayer()._squadLeader = net.ReadBool()
end)

net.Receive("Squad.PurgeGroup", function()
    local tag = net.ReadString()
    LocalPlayer()._squad = LocalPlayer()._squad == tag and "" or LocalPlayer()._squad
    SQUAD.Groups[tag] = nil
end)

net.Receive("Squad.SendMessage", function()
    local txt = net.ReadString()
    local ent = net.ReadEntity()
    chat.AddText(Color(155, 89, 182), "(", string.upper(ent:GetSquadName()), ") ", team.GetColor(ent:Team()), ent:Nick(), color_white, ": ", txt)
end)

net.Receive("Squad.SendInvitation", function()
    local trg = net.ReadEntity()
    if _invitation then
        _invitation:Remove()
        _invitation = nil
    end
    _invitation = vgui.Create("dSquadInvitation")
    _invitation:SetPlayer(trg, net.ReadString())
end)

net.Receive("Squad.FailedJoin", function()
    local reason = net.ReadInt(8)

    if (reason == 1) then
        reason = " " .. SQUAD.Language.MaxMembers
    end

    chat.AddText(Color(235, 100, 50), "[SQUAD]", color_white, reason)
end)

hook.Add("PlayerStartVoice", "Squad.SenseVoice", function(ply)
    if (ply:GetSquad() ~= "" and ply:GetSquad() == LocalPlayer():GetSquad()) then
        ply.DoingVoice = true
    end
end)

hook.Add("PlayerEndVoice", "Squad.SenseVoice", function(ply)
    if (ply:GetSquad() ~= "" and ply:GetSquad() == LocalPlayer():GetSquad()) then
        ply.DoingVoice = false
    end
end)

local nextTip = -1
hook.Add("Think","Squad.DrawTips", function()
    if (tips:GetInt() ~= 0) then
        if (nextTip == -1) then
            nextTip = CurTime() + math.random(30, 240)
            notification.AddLegacy( SQUAD.Tips[ math.random( 1 , #SQUAD.Tips ) ] , NOTIFY_GENERIC , 8 )
            surface.PlaySound("buttons/button1.wav")
            return
        end
        if (nextTip < CurTime() and GetConVar("squad_tips"):GetInt() == 1) then
            nextTip = CurTime() + math.random(30, 240)
            notification.AddLegacy( SQUAD.Tips[ math.random( 1 , #SQUAD.Tips ) ] , NOTIFY_GENERIC , 8 )
        end
    end
end)

hook.Add( "PlayerButtonDown" , "Squad.BringMenu.Down" , function( ply , key )
    if ( key == SQUAD.Config.KeyBringSquadMenu ) then
        if (IsValid(squad_window)) then
            squad_window:GetParent():Remove()
        end

        squad_window_frame = vgui.Create("DFrame")
        squad_window_frame:SetSize(600,500)
        squad_window_frame:Center()
        squad_window_frame:MakePopup()

        if ( LocalPlayer( )._squad ~= "" ) then
            squad_window = vgui.Create( "dSquadPanel" , squad_window_frame )
        else
            squad_window_frame.Paint = function( ) end
            net.Start( "Squad.Verify" )
            net.WriteString( LocalPlayer( )._squad or "" )
            net.SendToServer( )
        end
    end
end )

concommand.Add("squad_create", function(_, _, args)
    net.Start("Squad.CreateSquad")
    net.WriteString(args[1])
    net.WriteString(args[2])
    net.SendToServer()
end)

concommand.Add("squad_exit", function()
    net.Start("Squad.ExitSquad")
    net.SendToServer()
end)

concommand.Add("squad_invite", function(_, _, args)
    net.Start("Squad.InviteSquad")
    net.WriteString(args[1])
    net.SendToServer()
end)

--PATH addons/tlib/lua/tlib/shared/init.lua:
TLib = TLib or {
    Cfg = {},
    Lang = {}
}
--PATH addons/tlib/lua/tlib/client/derma/checkbox.lua:
local PANEL = {}

--[[

    PANEL:Paint

]]--

function PANEL:Init()
    self.tBgColor = TLib:C( 1 )
    self.tCheckedColor = TLib:C( 6 )
    self.tUncheckedColor = TLib:C( 2 )

    if self:GetChecked() then
    	self.fLerpX = ( self:GetWide() - self:GetTall() )
        return
    end
    
    self.fLerpX = 0
end

function PANEL:DoClickInternal()
    TLib:Play2DSound( "tlib/click_01.mp3" )
end

--[[

    PANEL:SetBgColor

]]--

function PANEL:SetBgColor( tColor )
    self.tBgColor = tColor
end

--[[

    PANEL:SetCheckedColor

]]--

function PANEL:SetCheckedColor( tColor )
    self.tCheckedColor = tColor
end

--[[

    PANEL:SetUncheckedColor

]]--

function PANEL:SetUncheckedColor( tColor )
    self.tUncheckedColor = tColor
end

--[[

    PANEL:Paint

]]--

function PANEL:Paint( iW, iH )
    draw.RoundedBox( ( iH * .5 ), 0, 0, iW, iH, self.tBgColor )

	if self:GetChecked() then
        self.fLerpX = Lerp( ( RealFrameTime() * 10 ), self.fLerpX, ( iW - iH ) )
        draw.RoundedBox( ( iH * .5 ), self.fLerpX, 0, iH, iH, self.tCheckedColor )

        return
    end

    self.fLerpX = Lerp( ( RealFrameTime() * 10 ), self.fLerpX, 0 )
    draw.RoundedBox( ( iH * .5 ), self.fLerpX, 0, iH, iH, self.tUncheckedColor )
end

-- Register VGUI element
vgui.Register( "TLCheckBox", PANEL, "DCheckBox" )
PANEL = nil
--PATH addons/tlib/lua/tlib/client/derma/notify.lua:
local draw = draw
local surface = surface

-- Static vars
NOTIFY_GENERIC	= ( NOTIFY_GENERIC or 0 )
NOTIFY_ERROR	= ( NOTIFY_ERROR or 1 )
NOTIFY_UNDO		= ( NOTIFY_UNDO or 2 )
NOTIFY_HINT		= ( NOTIFY_HINT or 3 )
NOTIFY_CLEANUP	= ( NOTIFY_CLEANUP or 4 )

local PANEL = {}
local iMargin = 0
local iRoundness = 0

local tBgColor = TLib:C( 0 )
local tTextColor = TLib:C( 5 )
local tShadowColor = TLib:C( 7 )

-- Notif types materials
local tTypeMaterial = {
    [ 0 ] = Material( "tlib/notify_generic.png", "smooth" ),
    [ 1 ] = Material( "tlib/notify_error.png", "smooth" ),
    [ 2 ] = Material( "tlib/notify_undo.png", "smooth" ),
    [ 3 ] = Material( "tlib/notify_hint.png", "smooth" ),
    [ 4 ] = Material( "tlib/notify_cleanup.png", "smooth" )
}

-- Notif types colors
local tTypeColors = {
    [ 0 ] = TLib:C( 3 ),
    [ 1 ] = TLib:C( 4 ),
    [ 2 ] = TLib:C( 3 ),
    [ 3 ] = TLib:C( 3 ),
    [ 4 ] = Color( 52, 152, 219 )
}

--[[

    PANEL:Paint

]]--

function PANEL:Init()
    iMargin, iRoundness = TLib:ScaleVGUI()
    iMargin = iMargin

    self.iType = 0

    self:SetFont( "TLib.Standard" )
    self:SetTextColor( tTextColor )
    self:ParentToHUD()
end

--[[

    PANEL:Paint

]]--


function PANEL:SetNotificationLayout()
    self:SetText( string.gsub( self:GetText(), "\n", "" ) )
    self:SizeToContents()

    local iNotifH = ( draw.GetFontHeight( self:GetFont() ) ) + ( iMargin * .75 )   
    local iNotifW = ( self:GetWide() + iNotifH + ( iMargin * 2 ) )
    local iNotifX = ( ( ScrW() - iNotifW ) - iMargin )
    local iNotifY = ( ScrH() - ( iNotifH * 4 ) )

    self:SetSize( iNotifW, iNotifH )
    self:SetTextInset( ( iNotifH + iMargin ), -1 )
    self:SetPos( ScrW(), iNotifY - ( table.Count( TLib.tNotifPanels ) * ( iNotifH + iMargin ) ) )

    self.iEndX = iNotifX
    if not self.iEndY then
        local _, iPosY = self:GetPos()
        self.iEndY = iPosY
    end

    self.fIconH = math.ceil( iNotifH * .56 ) - 2

    self.fIconX = -iNotifH
    self.fLerpIconX = self.fIconX

    self:MoveTo( self.iEndX, self.iEndY, .1, 0, 1, function()
        if IsValid( self ) then
            self.iEndX = nil
            self.iEndY = nil
            self.fIconX = ( iMargin + ( iNotifH  * .5 ) )

            TLib:Play2DSound( "tlib/notify_01.mp3", .6 )
        end
    end )

    function self:OnRemove()
        local iProccessedNotif = -1
        for iPanel, dPanel in pairs( TLib.tNotifPanels ) do
            if not IsValid( dPanel )  then
                TLib.tNotifPanels[ iPanel ] = nil
                continue
            end

            iProccessedNotif = ( iProccessedNotif + 1 )

            dPanel.iEndY = iNotifY - ( iProccessedNotif * ( iNotifH + iMargin ) )
            if not dPanel.iEndX then
                dPanel.iEndX = dPanel:GetPos()
            end

            dPanel:MoveTo( dPanel.iEndX, dPanel.iEndY, .1, 0, 1, function()
                if IsValid( dPanel ) then
                    dPanel.iEndX, dPanel.iEndY = nil, nil
                end
            end )
        end
    end

    self.bLayoutReady = true
end

--[[

    PANEL:SetNotificationType

]]--

function PANEL:SetNotificationType( iType )
    local iType = iType
    if not iType or not tTypeMaterial[ iType ] then
        iType = 0
    end

    self.tColor = tTypeColors[ iType ]
    self.iMaterial = tTypeMaterial[ iType ]    
end

--[[

    PANEL:SetNotificationTime

]]--

function PANEL:SetNotificationTime( fTime )
    self.fNotifTime = math.Clamp( ( fTime or 3 ), 1, 63 )
    self.fEndTime = ( CurTime() + self.fNotifTime )
end

--[[

    PANEL:Paint

]]--

function PANEL:Paint( iW, iH )
    if not self.bLayoutReady then
        return
    end

    self.fLerpIconX = Lerp( RealFrameTime() * 8, self.fLerpIconX, self.fIconX )
    local iProgW = ( ( self.fEndTime - CurTime() ) * ( iW - iMargin ) / self.fNotifTime )

    surface.SetDrawColor( tBgColor )
    surface.DrawRect( iMargin, 0, ( iW - iMargin ), iH )

    surface.SetDrawColor( TLib:C( 2 ) )
    surface.SetMaterial( self.iMaterial )
    surface.DrawTexturedRectRotated( self.fLerpIconX, ( iH * .5 ) - 1, self.fIconH, self.fIconH, 0 )

    draw.RoundedBoxEx( iRoundness, 0, 0, iMargin, iH, self.tColor, true, false, true, false )

    surface.SetDrawColor( tShadowColor )
    surface.SetMaterial( TLib.Mat[ 3 ] )
    surface.DrawTexturedRect( iMargin, 0, ( iW - iMargin ), iH - 2 )

    surface.SetDrawColor( self.tColor )
    surface.DrawRect( iMargin, iH - 2, iProgW, 2 )
end

--[[

    PANEL:Think

]]--

function PANEL:Think()
    if not self.fEndTime then
        return
    end

    if not self.bRemoving and ( CurTime() >= self.fEndTime ) then
        self.bRemoving = true

        local _, iY = self:GetPos()

        self:SetZPos( 0 )
        self:AlphaTo( 0, 3, .1 )
        self:MoveTo( ScrW(), iY, .2, .1, .5, function()
            if IsValid( self ) then
                self:Remove()
            end
        end )
    end
end

-- Register VGUI element
vgui.Register( "TLNotify", PANEL, "DLabel" )
PANEL = nil
--PATH addons/tlib/lua/tlib/client/derma/toast.lua:
local PANEL = {}

--[[

    PANEL:Init

]]--

function PANEL:Init()
    self.iMargin, self.iRoundness = TLib:ScaleVGUI()
    self.tChoices = ( self.tChoices or {} )
end

--[[

    PANEL:AddChoice

]]--

function PANEL:AddChoice( sChoice, fCallback )
    local sChoice = ( sChoice and isstring( sChoice ) ) and sChoice or ""
    local fCallback = ( fCallback and isfunction( fCallback ) ) and fCallback or function() end

    self.tChoices[ ( #self.tChoices + 1 ) ] = true

    local dChoice = vgui.Create( "TLButton", self )
    dChoice:SetSize( self:GetWide() - ( self.iMargin * 2 ), ( ScrH() * .032 ) )
    dChoice:SetPos( self.iMargin, self:GetHeaderHeight() + self.iMargin + ( ( #self.tChoices - 1 ) * ( dChoice:GetTall() + ( self.iMargin * .5 ) ) ) )
    dChoice:SetText( sChoice )
    dChoice.fCBack = fCallback

    dChoice.DoClick = function( dButton )
        dButton.fCBack( dButton )

        if self.OnChoiceClicked then
            self.OnChoiceClicked( dChoice )
        end
    end

    self:SizeToChildren( false, true )
    self:SetTall( self:GetTall() + self.iMargin )

    return dChoice
end

-- Register VGUI element
vgui.Register( "TLToast", PANEL, "TLFrame" )
PANEL = nil
--PATH addons/sl_utils/lua/autorun/sh_vmenu_legs.lua:
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
	AddCSLuaFile( "sh_vmenu_legs.lua" )
end

if (CLIENT) then
	local function AddText(font, color, text)		 
		local label = vgui.Create("DLabel", g_GMLOptions)
		label:Dock( TOP )	
		label:SetFont(font)
		label:SetText(text)
		label:SetTextColor(color)
		label:SizeToContents()

		return label
	end

	local function AddOptions( text, cvar )	 
		local option = vgui.Create("DCheckBoxLabel", g_GMLOptions)
		option:SetText(text)
		option:SetTextColor(Color(194,194,194))
		option:SetConVar( cvar )
		option:Dock( TOP )
		option:DockMargin(30, 0, 0, 0)
		option:SizeToContents()

		return label
	end

	local function AddHeader( text )
		AddText("VAddonsHeader", Color(194,194,194), text):DockMargin(12, 0, 0, 0)
	end

	hook.Add( "GetVMenuTabs", "GMLTabs", function(parent, tabs) 
		g_GMLOptions = vgui.Create( "DScrollPanel", parent )
		g_GMLOptions.Paint = function(this, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color( 30, 30, 30 ) )
		end

		AddHeader(string.format("\nWhats new in Gmod Legs %s?", g_LegsVer))
		AddText("VAddonsCredits", Color(194,194,194), g_LegsLog):DockMargin(30, 0, 0, 0)

		AddHeader("Settings")
		AddOptions( "Enable rendering of Legs?", "cl_legs" )
		AddOptions( "Enable rendering of Legs in vehicles?", "cl_vehlegs" )

		AddHeader("\nCredits")
		AddText("VAddonsCredits", Color(194,194,194), "Valkyrie\n\tblackops7799"):DockMargin(30, 0, 0, 0)
		
		tabs:AddSheet(string.format("Gmod Legs %s", g_LegsVer), g_GMLOptions, "icon16/user.png")
	end)
end
--PATH addons/simplistic_presentation/lua/simplistic_presentation/shared/sh_functions.lua:
SimplisticPresentation.Language = SimplisticPresentation.Language or {}

function SimplisticPresentation:GetSentence(sId)

    local tLangSentences = SimplisticPresentation.Language[SimplisticPresentation.Config.sLanguage or "en"]

    return tLangSentences and tLangSentences[sId] or error("SimplisticPresentation.Config.sLanguage value isn't valid !")

end
--PATH addons/simplistic_presentation/lua/simplistic_presentation/languages/lang_fr.lua:
SimplisticPresentation.Language["fr"] = {

    ["Unknown"] = "Inconnu",
    ["IntroduceYourself"] = "Se présenter",

    ["IntroduceNotify:Sender"] = "Vous vous êtes présenté à %s !",
    ["IntroduceNotify:Receiver"] = "%s s'est présenté à vous !",

    ["CopyIdentifier"] = "Un identifiant a été ajouté à votre presse-papier !",

    ["ManagePanel:MainText"] = "Gérer les relations",
    ["ManagePanel:CopyIdentifier"] = "Le SteamID64 de %s a été ajouté à votre presse-papier !",
    ["ManagePanel:ForgotIdentity"] = "Vous avez oublié l'identité de %s !",
    ["ManagePanel:NoData"] = "Vous ne connaissez l'identité de personne !",

    ["AdminMenu:MainText"] = "Base de Connaissance",
    ["AdminMenu:SelectPlayer"] = "Sélectionnez un joueur",
    ["AdminMenu:RemoveKnownPlayer"] = "%s ne connaît désormais plus l'identité de %s !",

    ["AdminMenu:SearchText"] = "Rechercher...",
    ["AdminMenu:NothingFound"] = "Aucune relation trouvée !",

    ["AdminMode:Activated"] = "Mode d'administration activé !",
    ["AdminMode:Disabled"] = "Mode d'administration désactivé !",

}
--PATH addons/simplistic_presentation/lua/simplistic_presentation/lib/w3d.lua:
-- This library has been created by Wasied on may2022
-- You are allowed to use it anywhere but you must credit the author (Wasied)
-- I do not provide any support to this library. You can still try opening an issue on GitHub to get help.
-- Have fun, Wasied.

w3d = {}
w3d.tCache = w3d.tCache or { tButtons = {} }

--[[-------------------------------------------------]]--
--[[                   LOCAL CACHE                   ]]--
--[[     As we need to optimize the best we can,     ]]--
--[[   I'm trying to CPU-optimize everything I can   ]]--
--[[-------------------------------------------------]]--

local tVGUIList = {}
local pLocal

--[[-----------------]]--
--[[ LOCAL FUNCTIONS ]]--
--[[-----------------]]--

-- Clear buttons from the cache when they are not existing anymore
local function ClearButtonsCache()

    for sId, tInfos in pairs(w3d.tCache.tButtons or {}) do
        if SysTime() - RealFrameTime() > tInfos.iLastTime then
            w3d.tCache.tButtons[sId] = nil
        end
    end

end

--[[------------------]]--
--[[ PUBLIC FUNCTIONS ]]--
--[[------------------]]--

-- Start 3D2D context
function w3d.Start3D2D(vecTarget, angTarget, iScale, iUseDistance)

    if not IsValid(pLocal) then
        pLocal = LocalPlayer()
    end

    cam.Start3D2D(vecTarget, angTarget, iScale)

    local tTrace = pLocal:GetEyeTrace()
    local vecHitPos = util.IntersectRayWithPlane(tTrace.StartPos, tTrace.Normal, vecTarget, angTarget:Up())

    if iUseDistance and tTrace.StartPos:DistToSqr(vecTarget) > iUseDistance then
    
        w3d.tCache.iMouseX = nil
        w3d.tCache.iMouseY = nil
    
    elseif vecHitPos then
        
        local vecDelta = vecTarget - vecHitPos

        w3d.tCache.iMouseX = vecDelta:Dot(-angTarget:Forward()) / iScale
        w3d.tCache.iMouseY = vecDelta:Dot(-angTarget:Right()) / iScale
    
    end

    return true

end

-- End 3D2D context
function w3d.End3D2D()

    cam.End3D2D()
    return true

end

-- Get the mouse position relative to the screen
function w3d.GetMousePos()
    return w3d.tCache.iMouseX or 0, w3d.tCache.iMouseY or 0
end

-- Check if the mouse is hovering something on the screen
function w3d.IsHovered(x, y, w, h)

    local iMouseX, iMouseY = w3d.tCache.iMouseX, w3d.tCache.iMouseY
    
    if iMouseX and iMouseY then
        return iMouseX >= x and iMouseX <= x + w and iMouseY >= y and iMouseY <= y + h
    end

    return false

end

-- Create a new vgui element
function w3d.Create(sType, sId, x, y, w, h, fcCallback, fcPaint)

    if not isfunction(tVGUIList[sType]) then return false, "Invalid vgui type (#1)" end
    if not isstring(sId) then return false, "Invalid unique identifier (#2)" end

    tVGUIList[sType](sId, x, y, w, h, fcCallback, fcPaint)

end


--[[-----------]]--
--[[ OUR HOOKS ]]--
--[[-----------]]--

-- Called when the player press the primary attack button
hook.Add("KeyPress", "w3d:KeyPress", function(pPlayer, iKey)

    if not IsFirstTimePredicted() then return end
    if not IsValid(pPlayer) or not pPlayer:IsPlayer() then return end
    if iKey ~= IN_ATTACK and iKey ~= IN_USE then return end

    ClearButtonsCache()

    for sId, tInfos in pairs(w3d.tCache.tButtons or {}) do

        if tInfos.bHovered then
            tInfos.fcCallback(sId)
            hook.Run("w3d:ButtonPressed", sId)
            break
        end

    end

end)

--[[----------------------------------------------------]]--
--[[             CUSTOM 3D2D VGUI ELEMENTS              ]]--
--[[  In order to make the usage easy, I created some   ]]--
--[[  predefined elements that you can easily create.   ]]--
--[[----------------------------------------------------]]--

-- Button creation callback
local function CreateButton(sId, x, y, w, h, fcCallback, fcPaint)

    local bHovered = w3d.IsHovered(x, y, w, h)

    -- Paint the button (custom or by default)
    if isfunction(fcPaint) then
        fcPaint(x, y, w, h, bHovered)
    else
        
        surface.SetDrawColor(bHovered and Color(87, 75, 144, 220) or Color(48, 57, 82, 200))
        surface.DrawRect(x, y, w, h)

        draw.SimpleText("Wasied", "Trebuchet24", x + w / 2, y + h / 2, color_white, 1, 1)

    end

    -- Make a default callback just to show it works
    if not isfunction(fcCallback) then
        fcCallback = function()
            chat.AddText(Color(0, 110, 255), "Such a great developer! This is the default callback function")
        end
    end

    -- Register the button in order to make it clickable
    w3d.tCache.tButtons[sId] = { x = x, y = y, w = w, h = h, bHovered = bHovered, fcCallback = fcCallback, iLastTime = SysTime() }

end
tVGUIList["DButton"] = CreateButton
--PATH addons/the_sit_anywhere_script/lua/sitanywhere/client/sit.lua:
local TAG = "SitAny_"
local useAlt = CreateClientConVar("sitting_use_walk", "1.00", true, true, "Makes sitting require the use of walk, disable this to sit simply by using use", 0, 1)
local forceBinds = CreateClientConVar("sitting_force_left_alt", "0", true, true, "Forces left alt to always act as a walk key for sitting", 0, 1)
local SittingNoAltServer = CreateConVar("sitting_force_no_walk", "0", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Disables the need for using walk to sit anywhere on the server", 0, 1)

CreateClientConVar("sitting_allow_on_me", "1.00", true, true, "Allows people to sit on you", 0, 1)

local function ShouldSit(ply)
	return hook.Run("ShouldSit", ply)
end

local arrow, drawScale, traceDist = Material("widgets/arrow.png"), 0.1, 20
local traceScaled = traceDist / drawScale

local function StartSit(trace)
	local wantedAng = nil
	local cancelled = false
	local start = CurTime()
	local ply = LocalPlayer()

	hook.Add("PostDrawOpaqueRenderables", TAG .. "PostDrawOpaqueRenderables", function(depth, skybox)
		if CurTime() - start <= 0.25 then return end
		if trace.StartPos:Distance(ply:EyePos()) > 10 then
			cancelled, wantedAng = true, nil
			hook.Remove("PostDrawOpaqueRenderables", TAG .. "PostDrawOpaqueRenderables")
			return
		end

		local vec = util.IntersectRayWithPlane(ply:EyePos(), ply:EyeAngles():Forward(), trace.HitPos, Vector(0, 0, 1))
		if not vec then
			return
		end

		local posOnPlane = WorldToLocal(vec, Angle(0, 90, 0), trace.HitPos, Angle(0, 0, 0))
		local testVec = posOnPlane:GetNormal() * traceScaled
		local currentAng = (trace.HitPos - vec):Angle()
		wantedAng = currentAng

		if posOnPlane:Length() < 2 then
			wantedAng = nil
			return
		end

		if wantedAng then
			local goodSit = SitAnywhere.CheckValidAngForSit(trace.HitPos, trace.HitNormal:Angle(), wantedAng.y)
			if not goodSit then wantedAng = nil end
			cam.Start3D2D(trace.HitPos + Vector(0, 0, 1), Angle(0, 0, 0), drawScale)
				surface.SetDrawColor(goodSit and Color(255, 255, 255, 255) or Color(255, 0, 0, 255))
				surface.SetMaterial(arrow)
				surface.DrawTexturedRectRotated(testVec.x * 0.5, testVec.y * -0.5, 2 / drawScale, traceScaled, currentAng.y + 90)
			cam.End3D2D()
		end
	end)

	return function()
		hook.Remove("PostDrawOpaqueRenderables", TAG .. "PostDrawOpaqueRenderables")
		if cancelled then return end

		if CurTime() - start < 0.25 then
			RunConsoleCommand("sit")
			return
		end

		if wantedAng then
			net.Start("SitAnywhere")
				net.WriteInt(SitAnywhere.NET.SitWantedAng, 4)
				net.WriteFloat(wantedAng.y)
				net.WriteVector(trace.StartPos)
				net.WriteVector(trace.Normal)
			net.SendToServer()
			wantedAng = nil
		end
	end
end

local function DoSit(trace)
	if not trace.Hit then return end

	local surfaceAng = trace.HitNormal:Angle() + Angle(-270, 0, 0)

	local playerTrace = not trace.HitWorld and IsValid(trace.Entity) and trace.Entity:IsPlayer()

	local goodSit = SitAnywhere.GetAreaProfile(trace.HitPos + Vector(0, 0, 0.1), 24, true)
	if math.abs(surfaceAng.pitch) >= 15 or not goodSit or playerTrace then
		RunConsoleCommand"sit"
		return
	end

	local valid = SitAnywhere.ValidSitTrace(LocalPlayer(), trace)
	if not valid then
		return
	end

	return StartSit(trace)
end

local currSit
concommand.Add("+sit", function(ply, cmd, args)
	if currSit then return end
	if not IsValid(ply) or not ply.GetEyeTrace then return end
	currSit = DoSit(ply:GetEyeTrace())
end)

concommand.Add("-sit", function(ply, cmd, args)
	if currSit then
		currSit()
		currSit = nil
	end
end)


hook.Add("KeyPress", TAG .. "KeyPress", function(ply, key)
	if not IsFirstTimePredicted() and not game.SinglePlayer() then return end
	if currSit then return end

	if key ~= IN_USE then return end
	local good = not useAlt:GetBool()
	local alwaysSit = ShouldSit(ply)

	if forceBinds:GetBool() then
		if useAlt:GetBool() and input.IsKeyDown(KEY_LALT) then
			good = true
		end
	else
		if useAlt:GetBool() and ply:KeyDown(IN_WALK) then
			good = true
		end
	end

	if SittingNoAltServer:GetBool() then
		good = true
	end

	if alwaysSit == true then
		good = true
	elseif alwaysSit == false then
		good = false
	end

	if not good then return end
	local trace = LocalPlayer():GetEyeTrace()

	if trace.Hit then
		currSit = DoSit(trace)
		hook.Add("KeyRelease", TAG .. "KeyRelease", function(releasePly, releaseKey)
			if not IsFirstTimePredicted() and not game.SinglePlayer() then return end
			if ply ~= releasePly or releaseKey ~= IN_USE then return end
			hook.Remove("KeyRelease", TAG .. "KeyRelease")
			if not currSit then return end

			currSit()
			currSit = nil
		end)
	end
end)
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_sframe.lua:
local PANEL = {}

slib.setTheme("maincolor", Color(36,36,36))
slib.setTheme("accentcolor", Color(66,179,245))
slib.setTheme("margin", slib.getScaledSize(3, "x"))
slib.setTheme("textcolor", Color(255,255,255))
slib.setTheme("neutralcolor", Color(0,0,200,40))
slib.setTheme("topbarcolor", Color(44,44,44))
slib.setTheme("sidebarcolor", Color(34,34,34))
slib.setTheme("sidebarbttncolor", Color(39,39,39))
slib.setTheme("whitecolor", Color(255,255,255))
slib.setTheme("hovercolor", Color(255,255,255,100))
slib.setTheme("orangecolor", Color(130, 92, 10))
slib.setTheme("successcolor", Color(0,200,0))
slib.setTheme("failcolor", Color(200,0,0))
slib.setTheme("bgblur", true)

local topbarcolor, topbarcolor_min10, sidebarcolor, sidebarbttncolor, textcolor, accentcolor, maincolor, maincolor_7, maincolor_15, hovercolor = slib.getTheme("topbarcolor"), slib.getTheme("topbarcolor", -10), slib.getTheme("sidebarcolor"), slib.getTheme("sidebarbttncolor"), slib.getTheme("textcolor"), slib.getTheme("accentcolor"), slib.getTheme("maincolor"), slib.getTheme("maincolor", 7), slib.getTheme("maincolor", 15), slib.getTheme("hovercolor")
local accentcol_a100 = slib.getTheme("accentcolor")
accentcol_a100.a = 100

local black_a160 = Color(0,0,0,160)
local black_a140 = Color(0,0,0,140)

function PANEL:Init()
	self.topbarheight = slib.getScaledSize(30, "y")
	self.font = slib.createFont("Roboto", 21)
	self.tab = {}
	self.iterator = 0

	self.topbar = vgui.Create("EditablePanel", self)
	self.topbar:SetCursor("sizeall")
	self.topbar:SetSize(self:GetWide(), self.topbarheight)

	self.topbar.OnSizeChanged = function()
		if IsValid(self.close) then
			self.close:SetPos(self.topbar:GetWide() - self.close:GetWide() - slib.getScaledSize(3,"x"), 0)
		end
	end

	self.topbar.Paint = function(s, w, h)
		if !s.Holding and input.IsMouseDown(MOUSE_LEFT) then
				if s:IsHovered() then
					s.Move = true
				end

				s.Holding = true
				local x, y = gui.MouseX(), gui.MouseY()
				s.startedx, s.startedy = s:ScreenToLocal(x, y)
		elseif s.Holding and !input.IsMouseDown(MOUSE_LEFT) then
			s.Holding = nil
			s.Move = nil
		end

		if s.Move then
			local x, y = gui.MouseX(), gui.MouseY()
			local offsetx, offsety =  s:ScreenToLocal(x, y)
			
			self:SetPos(x - s.startedx, y - s.startedy)
		end

		draw.RoundedBoxEx(5, 0, 0, w, h, topbarcolor, true, true)

		surface.SetDrawColor(black_a160)
		surface.DrawRect(0, h - 1, w, 1)

		surface.SetDrawColor(black_a140)
		surface.DrawRect(0, h - 2, w, 1)
		draw.SimpleText(self.title, self.font, slib.getScaledSize(3,"x"), h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	self.frame = vgui.Create("EditablePanel", self)

	self.frame.Resize = function()
		local wide = 0

		if self.tabmenu then
			wide = wide + self.tabmenu:GetWide()
		end

		self.frame:SetPos(wide,self.topbarheight)
		self.frame:SetSize(self:GetWide() - wide, self:GetTall() - self.topbarheight)
		
		for k,v in pairs(self.tab) do
			self.tab[k]:SetSize(self.frame:GetWide(), self.frame:GetTall())
		end
	end

	self.frame.Resize()

	self.MadePanel = SysTime()

	slib.wrapFunction(self, "SetSize", nil, function() return self end, true)
	slib.wrapFunction(self, "SetWide", nil, function() return self end, true)
	slib.wrapFunction(self, "Center", nil, function() return self end, true)
	slib.wrapFunction(self, "SetPos", nil, function() return self end, true)
	slib.wrapFunction(self, "MakePopup", nil, function() return self end, true)
	slib.wrapFunction(self, "DockPadding", nil, function() return self end, true)
end

function PANEL:OnRemove()
	if !IsValid(self.bgclose) then return end
	self.bgclose:Remove()
end

function PANEL:SetBG(bool, close, col, makepopup)
	if !bool and IsValid(self.bgclose) then
		self:SetParent()
		self.bgclose:Remove()
		
		return
	end

	local parent = self:GetParent()

	local w, h

	if IsValid(parent) then
		w, h = parent:GetSize() 
	else
		w, h = ScrW(), ScrH()
	end

	self.bgclose = vgui.Create("SButton", parent)
	self.bgclose:SetSize(w, h)

	if makepopup then
		self.bgclose:MakePopup()
	else
		self.bgclose:MoveToFront()
	end

	self.bgclose.DoClick = function()
		if !close then return end

		if IsValid(self.bgclose) then
			self.bgclose:Remove()
		end

		if IsValid(self) then
			self:Remove()
		end
	end

	self.bgclose.bg = col

	self.bgclose.Paint = function(s,w,h)
		if !IsValid(self) then s:Remove() end
		
		if !s.bg then return end
		surface.SetDrawColor(s.bg)
		surface.DrawRect(0,0,w,h)
	end

	self:SetParent(self.bgclose)
	self:MoveToFront()
	
	return self
end

function PANEL:SetDraggable(bool)
	if IsValid(self.topbar) then
		self.topbar:SetMouseInputEnabled(bool)
	end

	return self
end

function PANEL:setTitle(str, font)
	self.title = str

	if font then
		self.font = font
	end
	
	return self
end

function PANEL:addCloseButton()
	self.close = vgui.Create("DButton", self)
	self.close:SetSize(slib.getScaledSize(25, "y"),slib.getScaledSize(25, "y"))
	self.close:SetMouseInputEnabled(true)
	self.close:SetPos(self.topbar:GetWide() - self.close:GetWide() - slib.getScaledSize(3,"x"), self.topbarheight * .5 - self.close:GetTall() * .5)
	self.close:SetText("")

	self.close.DoClick = function()
		if isfunction(self.onClose) then
			self.onClose()
		end
		
		if self.onlyHide then
			self:SetVisible(false)
		return end

		self:Remove()
	end

	self.close.Paint = function(s,w,h)
		local width = slib.getScaledSize(2, "X")
		local height = h * .7

		draw.NoTexture()

		local wantedCol = s:IsHovered() and color_white or hovercolor

        surface.SetDrawColor(slib.lerpColor(s, wantedCol))
		surface.DrawTexturedRectRotated(w - (height * .5), h * .5 - (width * .5), width, height, 45)
		surface.DrawTexturedRectRotated(w - (height * .5), h * .5 - (width * .5), width, height, -45)
	end

	return self
end

function PANEL:OnSizeChanged()
	self.topbar:SetSize(self:GetWide(), self.topbarheight)
	self.frame.Resize()
end

function PANEL:setBlur(bool)
	self.blur = bool

	return self
end

function PANEL:setDoClick(func)
	self.DoClick = func

	return self
end

function PANEL:Paint(w, h)
	if slib.getTheme("bgblur") and self.blur then
		Derma_DrawBackgroundBlur( self, self.MadePanel )
	end
	
	draw.RoundedBox(5, 0, 0, w, h, maincolor)
end

function PANEL:addTab(name, icon)
	if !IsValid(self.tabmenu) then
		self.tabmenu = vgui.Create("DScrollPanel", self)
		self.tabmenu:SetTall(self:GetTall() - self.topbarheight)
		self.tabmenu:SetPos(0, self.topbarheight)
		self.tabmenu.font = slib.createFont("Roboto", 14)
		self.tabmenu.Paint = function(s,w,h)
			draw.RoundedBoxEx(5, 0, 0, w, h, sidebarcolor, false, false, true, false)
		end

		self.tabmenu.OnSizeChanged = function()
			self.frame.Resize()
		end

		self.frame.Resize()
	end

	self.tab[name] = vgui.Create("EditablePanel", self.frame)
	self.tab[name]:SetSize(self.frame:GetWide(), self.frame:GetTall())
	self.tab[name]:SetVisible(false)
	self.tab[name].addTab = function(tab_name)
		local w, h, tab_h = self.tab[name]:GetWide(), self.tab[name]:GetTall(), slib.getScaledSize(32, "y")
		if !IsValid(self.tab[name].topbar) then
			self.tab[name].topbar = vgui.Create("EditablePanel", self.tab[name])
			self.tab[name].topbar:Dock(TOP)
			self.tab[name].topbar:SetTall(tab_h)
			self.tab[name].topbar.Paint = function(s,w,h)
				surface.SetDrawColor(maincolor_7)
				surface.DrawRect(0,0,w,h)
			end
		end

		local frame = vgui.Create("EditablePanel", self.tab[name])
		frame:SetPos(0, tab_h)
		frame:SetSize(w, h - tab_h)
		frame:SetVisible(false)

		local tab_button = vgui.Create("SButton", self.tab[name].topbar)
		tab_button.font = slib.createFont("Roboto", 16)
		tab_button.bg = maincolor_7
		tab_button.tab = frame

		tab_button.DoClick = function()
			if IsValid(self.tab[name].selTab) and self.tab[name].selTab:IsVisible() then
				self.tab[name].selTab.tabbttn.forcehover = nil
				self.tab[name].selTab.tabbttn.bg = maincolor_7
				self.tab[name].selTab:SetVisible(false)
			end

			frame:SetVisible(true)
			self.tab[name].selTab = frame

			tab_button.bg = maincolor_15
			tab_button.forcehover = true
		end

		frame.tabbttn = tab_button

		tab_button:setTitle(tab_name)
		:Dock(LEFT)

		local childs = self.tab[name].topbar:GetChildren()
		local width = math.ceil(self.frame:GetWide() / #childs)
		for k,v in ipairs(childs) do
			v:SetWide(width)
		end

		if #childs == 1 then
			tab_button.DoClick()
		end

		return frame
	end

	local height = slib.getScaledSize(28, "y")
	self.iterator = self.iterator + 1
	local tabbttn = vgui.Create("DButton", self.tabmenu)
	tabbttn:Dock(TOP)
	tabbttn:SetZPos(self.iterator)
	tabbttn:SetTall(height)
	tabbttn:SetText("")
	tabbttn.name = name

	tabbttn.getFrame = function()
		return self.tab[name]
	end

	if icon then
		tabbttn.icon = Material(icon, "smooth")
	end

	local icosize = height * .6
	local gap = height * .20

	tabbttn.Paint = function(s,w,h)
		surface.SetDrawColor(sidebarbttncolor)
		surface.DrawRect(0, 0, w, h)

		local wantedh = self.seltab == name and h or 0
		local curH = slib.lerpNum(s, wantedh, .9, true)

		if self.seltab == name then
			surface.SetDrawColor(accentcol_a100)
			surface.DrawRect(0, h * .5 - curH * .5, w, curH)
		end

		if s.icon then
			surface.SetDrawColor(color_white)
			surface.SetMaterial(s.icon)
			surface.DrawTexturedRect(gap,gap,icosize,icosize)
		end

		draw.SimpleText(name, self.tabmenu.font, (s.icon and icosize + gap or 0) + slib.getTheme("margin"), h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	tabbttn.DoClick = function()
		self:setActiveTab(name)

		if isfunction(self.changedTab) then
			self.changedTab(name)
		end
	end

	self.tab[name].tabbttn = tabbttn
	
	surface.SetFont(self.tabmenu.font)
	local w = select(1, surface.GetTextSize(name)) + (slib.getTheme("margin") * 4) + height

	if w > self.tabmenu:GetWide() then
		self.tabmenu:SetWide(w)
	end

	return self, tabbttn
end

function PANEL:setActiveTab(name)
	if !name then
		local childs = self.tabmenu:GetCanvas():GetChildren()
		local lowest, selected = math.huge
		for k,v in ipairs(childs) do
			local zpos = v:GetZPos()
			if zpos < lowest then
				selected = v.name
				lowest = zpos
			end

		end

		if selected then
			self:setActiveTab(selected)
		end

		return
	end

	if self.seltab and IsValid(self.tab[self.seltab]) then
		self.tab[self.seltab]:SetVisible(false)
	end

	self.seltab = name

	self.tab[name]:SetVisible(true)

	return self
end

vgui.Register("SFrame", PANEL, "EditablePanel")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_sbutton.lua:
local PANEL = {}

local font = slib.createFont("Roboto", 13)
local textcolor, accentcolor, successcolor, failcolor = slib.getTheme("textcolor"), slib.getTheme("accentcolor"), slib.getTheme("successcolor"), slib.getTheme("failcolor")

function PANEL:Init()
    self.font = font
    self:SetText("")
    self.bg = slib.getTheme("maincolor")
    self.alignment = TEXT_ALIGN_CENTER
    self.accentheight = 2
    self.selCol = accentcolor
    self.textcolor = textcolor
    slib.wrapFunction(self, "Dock", nil, function() return self end, true)
    slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
    slib.wrapFunction(self, "DockPadding", nil, function() return self end, true)
    slib.wrapFunction(self, "SetZPos", nil, function() return self end, true)
    slib.wrapFunction(self, "SetTall", nil, function() return self end, true)
    slib.wrapFunction(self, "SetWide", nil, function() return self end, true)
    slib.wrapFunction(self, "SetSize", nil, function() return self end, true)
    slib.wrapFunction(self, "SetPos", nil, function() return self end, true)
    slib.wrapFunction(self, "SetVisible", nil, function() return self end, true)
end

function PANEL:setTitle(title, alignment, noresize)
    if self.title == title then return end
    self.title = title

    if alignment then self.alignment = alignment end
    
    if !noresize then
        surface.SetFont(self.font)
        local w = select(1, surface.GetTextSize(title))

        self:SetWide(w + (slib.getTheme("margin") * 2))
    end
    
    return self
end

function PANEL:getTitle()
    return self.title
end

function PANEL:SetLinePos(h)
    self.linepos = h

    return self
end

function PANEL:setToggleable(bool)
    self.toggleable = bool

    return self
end

function PANEL:Paint(w,h)
    local wantedcolor = self.toggleable and (isfunction(self.toggleCheck) and self.toggleCheck() and istable(self.toggleCheck()) and self.toggleCheck() or self.toggleCheck() and successcolor or failcolor) or self.selCol

    if !self.toggleable then
        wantedcolor.a = (self:IsHovered() or self.forcehover) and 120 or 20
    end

    surface.SetDrawColor(self.bg)
    surface.DrawRect(0, 0, w, h)

    surface.SetDrawColor(slib.lerpColor(self, wantedcolor))
    surface.DrawRect(0, self.linepos ~= nil and self.linepos or (h - self.accentheight), w, self.accentheight)
    local x
    if self.alignment == TEXT_ALIGN_CENTER then
        x = w * .5
    elseif self.alignment == TEXT_ALIGN_RIGHT then
        x = w - slib.getTheme("margin")
    elseif self.alignment == TEXT_ALIGN_LEFT then
        x = slib.getTheme("margin")
    end

    draw.SimpleText(self.title, self.font, x, h * .5, self.textcolor, self.alignment, TEXT_ALIGN_CENTER)
end

vgui.Register("SButton", PANEL, "DButton")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_slistpanel.lua:
local font = slib.createFont("Roboto", 14)
local textcolor, neutralcolor, successcolor, failcolor, maincolor_7, maincolor_10, maincolor_15, maincolor_25 = slib.getTheme("textcolor"), slib.getTheme("neutralcolor"), slib.getTheme("successcolor"), slib.getTheme("failcolor"), slib.getTheme("maincolor", 7), slib.getTheme("maincolor", 10), slib.getTheme("maincolor", 15), slib.getTheme("maincolor", 25)

local PANEL = {}

function PANEL:Init()
    self:Dock(TOP)
    self:SetTall(slib.getScaledSize(250, "y"))
    self:DockMargin(slib.getTheme("margin"),0,slib.getTheme("margin"),slib.getTheme("margin"))

    self.frame = vgui.Create("SScrollPanel", self)
    self.frame:Dock(FILL)

    self.frame.Paint = function(s,w,h)
        surface.SetDrawColor(maincolor_10)
        surface.DrawRect(0, 0, w, h)
    end

    self.selected = false

    slib.wrapFunction(self, "SetZPos", nil, function() return self end, true)
    slib.wrapFunction(self, "SetTall", nil, function() return self end, true)
    slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
    slib.wrapFunction(self, "Dock", nil, function() return self end, true)
end

function PANEL:addEntry(var, toggleable, tab)
    title = var
    if !isstring(var) and IsValid(var) and var:IsPlayer() then title = var:Nick() end

    local selectable = vgui.Create("DButton", self.frame)
    selectable:SetTall(slib.getScaledSize(25, "y"))
    selectable:Dock(TOP)
    selectable:DockMargin(slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"),0)
    selectable:SetText("")
    selectable.name = title
    selectable.tab = tab
    selectable.toggleable = toggleable

    selectable.Paint = function(s,w,h)
        if !isstring(var) and !IsValid(var) then s:Remove() return end

        local wantedcolor
        
        if s.toggleable then
            if isfunction(s.toggleCheck) then
                wantedcolor = s.toggleCheck() and successcolor or failcolor
            end
        else
            wantedcolor = neutralcolor
        end

        wantedcolor.a = 40
        if !s.toggleable and self.selected ~= var then
            wantedcolor.a = 0
        end
        
        surface.SetDrawColor(slib.lerpColor(s, wantedcolor))
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(maincolor_25)
        surface.DrawOutlinedRect(0, 0, w, h)


        draw.SimpleText(selectable.name, font, 5, h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    selectable.DoClick = function()
        self.selected = (self.selected ~= var) and var or nil 
    end

    return self, selectable
end

function PANEL:setTitle(title)
    self.title = title

    if !self.topbar then
        self.topbar = vgui.Create("EditablePanel", self)
        self.topbar:SetTall(slib.getScaledSize(25, "y"))
        self.topbar:Dock(TOP)

        self.topbar.Paint = function(s,w,h)
            surface.SetDrawColor(maincolor_7)
            surface.DrawRect(0, 0, w, h)

            surface.SetDrawColor(maincolor_25)
            surface.DrawRect(0,h-1,w,1)

            draw.SimpleText(self.title, font, slib.getTheme("margin"), h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    return self
end

function PANEL:addSearchbar()
    self.search = vgui.Create("SSearchBar", self.topbar)
    self.search:Dock(RIGHT)
    :DockMargin(slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"))

    self.search.entry.bg = maincolor_15
    self.search.entry.onValueChange = function(newval)
        for k,v in pairs(self.frame:GetCanvas():GetChildren()) do
            v:SetVisible(string.find(string.lower(v.name), string.lower(newval)))

            self.frame:GetCanvas():InvalidateLayout(true)
        end
    end

    self.topbar.OnSizeChanged = function()
        self.search:SetWide(self.topbar:GetWide() * .35)
    end

    return self
end

function PANEL:addDropdown()
    self.dropdown = vgui.Create("SDropDown", self.topbar)
    self.dropdown:Dock(RIGHT)
    :DockMargin(slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"))

    self.dropdown.bg = maincolor_15
    
    self.dropdown.onValueChange = function(newtab)
        for k,v in pairs(self.frame:GetCanvas():GetChildren()) do
            v:SetVisible(v.tab == newtab)
            self.frame:GetCanvas():InvalidateLayout(true)
        end
    end

    self.topbar.OnSizeChanged = function()
        self.dropdown:SetWide(self.topbar:GetWide() * .35)
    end

    return self.dropdown
end

function PANEL:addButton(title, func, thnk)
    if !self.bottombar then
		self.bottombar = vgui.Create("EditablePanel", self)
		self.bottombar:Dock(BOTTOM)
		self.bottombar:SetTall(slib.getScaledSize(25,"x"))

		self.bottombar.Paint = function(s,w,h)
			surface.SetDrawColor(maincolor_25)
			surface.DrawRect(0, 0, w, 1)
		end
    end

    local bttn = vgui.Create("SButton", self.bottombar)
    bttn:Dock(LEFT)
    :setTitle(title)
    :DockMargin(slib.getTheme("margin"),slib.getTheme("margin"),0,slib.getTheme("margin"))
    
    bttn.DoClick = function() func(self, bttn) end

    if thnk then
        bttn.Think = function() thnk(self, bttn) end
    end

    return self, bttn
end

function PANEL:Paint(w,h)
    surface.SetDrawColor(maincolor_10)
    surface.DrawRect(0, 0, w, h)
end

vgui.Register("SListPanel", PANEL, "EditablePanel")
--PATH addons/eprotect_1.4.22/lua/e_protect/languages/sh_turkish.lua:
if CLIENT then
    slib.setLang("eprotect", "tr", "sc-preview", "Ekranı Görüntüle - ")
    slib.setLang("eprotect", "tr", "net-info", "Ağ bilgisi - ")
    slib.setLang("eprotect", "tr", "ip-info", "IP bilgisi - ")
    slib.setLang("eprotect", "tr", "id-info", "ID bilgisi - ")
    slib.setLang("eprotect", "tr", "ip-correlation", "IP ilişkisi - ")
    slib.setLang("eprotect", "tr", "table-viewer", "Masa Görüntülemesi")

    slib.setLang("eprotect", "tr", "tab-general", "Genel")
    slib.setLang("eprotect", "tr", "tab-identifier", "Tanımlayıcı")
    slib.setLang("eprotect", "tr", "tab-netlimiter", "Bağ limitleyicisi")
    slib.setLang("eprotect", "tr", "tab-netlogger", "Ağ kayıtçısı")
    slib.setLang("eprotect", "tr", "tab-exploitpatcher", "Exploit Güncelleyici")
    slib.setLang("eprotect", "tr", "tab-exploitfinder", "Exploit Bulucusu")
    slib.setLang("eprotect", "tr", "tab-fakeexploits", "Sahte Exploitler")
    slib.setLang("eprotect", "tr", "tab-datasnooper", "Kayıt ağı")

    slib.setLang("eprotect", "tr", "player-list", "Oyuncu Listesi")

    slib.setLang("eprotect", "tr", "ratelimit", "Hız sınırlayıcısı")
    slib.setLang("eprotect", "tr", "ratelimit-tooltip", "Bu genel bir hız sınırlayıcısı. (Xs/Y)")

    slib.setLang("eprotect", "tr", "timeout", "Zaman Aşımı")
    slib.setLang("eprotect", "tr", "timeout-tooltip", "Bu zaman aşımı genel hız sınırlayıcısına karşıdır.")
    
    slib.setLang("eprotect", "tr", "overflowpunishment", "Taşma cezası")
    slib.setLang("eprotect", "tr", "overflowpunishment-tooltip", "Bu ceza ağı rahatlatmak için uygulanır. (1 = kick, 2 = ban)")

    slib.setLang("eprotect", "tr", "enable-networking", "Ağ oluşturmayı aktifleştir")
    slib.setLang("eprotect", "tr", "disable-networking", "Ağ oluşturmayı engelle")

    slib.setLang("eprotect", "tr", "disable-all-networking", "Tüm ağ oluşturmayı engelle")
    slib.setLang("eprotect", "tr", "disable-all-networking-tooltip", "Eğer bu aktif olursa kimse sunucuya giremez!")

    slib.setLang("eprotect", "tr", "player", "Player")
    slib.setLang("eprotect", "tr", "net-string", "Net String")
    slib.setLang("eprotect", "tr", "called", "Called")
    slib.setLang("eprotect", "tr", "len", "Len")
    slib.setLang("eprotect", "tr", "type", "Type")
    slib.setLang("eprotect", "tr", "activated", "Activated")
    slib.setLang("eprotect", "tr", "secure", "Secured")
    slib.setLang("eprotect", "tr", "ip", "IP Adress")
    slib.setLang("eprotect", "tr", "date", "Date")
    slib.setLang("eprotect", "tr", "country-code", "Country code")
    slib.setLang("eprotect", "tr", "status", "Status")

    slib.setLang("eprotect", "tr", "unknown", "Unknown")
    slib.setLang("eprotect", "tr", "secured", "Secured")

    slib.setLang("eprotect", "tr", "check-ids", "ID'leri kontrol et")
    slib.setLang("eprotect", "tr", "correlate-ip", "IP adreslerini ilişkilendir")
    slib.setLang("eprotect", "tr", "family-share-check", "Aile paylaşımını kontrol et")

    slib.setLang("eprotect", "tr", "ply-sent-invalid-data", "Bu oyuncu geçersiz data gönderdi!")
    slib.setLang("eprotect", "tr", "ply-failed-retrieving-data", "%s data alınamadı!")

    slib.setLang("eprotect", "tr", "net-limit-desc", "Buradaki sayı, insanların hız sınırlandırılmadan önce bir saniye içinde sunucuya maksimum ağ kurma sayısıdır..")

    slib.setLang("eprotect", "tr", "capture", "Screenshot")
    slib.setLang("eprotect", "tr", "check-ips", "Check IP(s)")
    slib.setLang("eprotect", "tr", "fetch-data", "Fetch Data")
elseif SERVER then
    slib.setLang("eprotect", "tr", "invalid-player", "böyle bir oyuncu yok!")
    slib.setLang("eprotect", "tr", "kick-net-overflow", "Net ağına karşı kötü niyetli eylem gerçekleştirdiğinizden dolayı atıldınız!")
    slib.setLang("eprotect", "tr", "banned-net-overflow", "Net ağına karşı kötü niyetli eylem gerçekleştirdiğinizden dolayı yasaklandınız !")
    slib.setLang("eprotect", "tr", "banned-net-exploitation", "Net ağına karşı kötü niyetli eylem gerçekleştirdiğinizden dolayı yasaklandınız!")
    slib.setLang("eprotect", "tr", "kick-malicious-intent", "Kötü niyetli eylem gerçekleştirdiğinizden dolayı sunucudan atıldınız!")
    slib.setLang("eprotect", "tr", "banned-malicious-intent", "Kötü niyetli eylem gerçekleştirdiğinizden dolayı sunucudan yasaklandınız!")

    slib.setLang("eprotect", "tr", "banned-exploit-attempt", "Exploit kullanmaya çalıştığın için sunucudan yasaklandın !")

    slib.setLang("eprotect", "tr", "sc-timeout", "Şu kadar  %s saniye beklemen gerek %s tekrar ekran görüntüsü almak için!")
    slib.setLang("eprotect", "tr", "sc-failed", "Şu kişiden ekran görüntüsü alınamadı %s, şüpheli!")

    slib.setLang("eprotect", "tr", "has-family-share", "%s Aile paylaşımından oynuyor oyunu  ödünç aldığı kişinin ID'si %s!")
    slib.setLang("eprotect", "tr", "no-family-share", "%s Aile paylaşımından oynamıyor!")
    slib.setLang("eprotect", "tr", "no-correlation", "Şu değer için hiç bir IP adresi ilişkilendirilemedi %s")
end
--PATH addons/tadminsystem/lua/t_adminsystem/languages.lua:
print(true)
--PATH addons/tadminsystem/lua/t_adminsystem/client/cl_utils.lua:
TAS.Fonts = {}

RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

function TAS:Font(iSize, sType)

	iSize = iSize or 15
	sType = sType or "Medium"

	local sName = ("TAS:Font:%i:%s"):format(iSize, sType)
	if not TAS.Fonts[sName] then

		surface.CreateFont(sName, {
			font = ("Montserrat %s"):format(sType):Trim(),
			size = RX(iSize),
			weight = 500,
			extended = false
		})

		TAS.Fonts[sName] = true

	end

	return sName

end

net.Receive("TAS:UI", function()
    local uInt = net.ReadUInt(8)

	if (uInt == 0) then // refund menu
		local data = net.ReadTable()
		TAS:RefundMainMenu(data)
	elseif (uInt == 1) then // ticket gen menu
		TAS:TicketGenerator()
	elseif (uInt == 2) then // warn menu
		local data = net.ReadTable()
		TAS:WarnMainMenu(data)
	end
end)
--PATH addons/talk-modes/lua/talk_modes/vgui/libs/cl_circles.lua:
local _R = debug.getregistry()
if (_R.Circles) then return _R.Circles end

local BlurMat = Material("pp/blurscreen")

local rad = math.rad
local cos = math.cos
local sin = math.sin
local min = math.min
local max = math.max

local CIRCLE = {}
CIRCLE.__index = CIRCLE

CIRCLE_FILLED = 0
CIRCLE_OUTLINED = 1
CIRCLE_BLURRED = 2

local function New(type, radius, x, y, ...)
	local circle = setmetatable({}, CIRCLE)

	circle:SetType(tonumber(type))
	circle:SetRadius(tonumber(radius))
	circle:SetPos(tonumber(x), tonumber(y))

	if (type == CIRCLE_OUTLINED) then
		local outline_width = ({...})[1]
		circle:SetOutlineWidth(tonumber(outline_width))
	elseif (type == CIRCLE_BLURRED) then
		local blur_density, blur_quality = unpack({...})
		circle:SetBlurDensity(tonumber(blur_density))
		circle:SetBlurQuality(tonumber(blur_quality))
	end

	return circle
end

local function RotateVertices(vertices, ox, oy, rotation, rotate_uv)
	rotation = rad(rotation)

	local c = cos(rotation)
	local s = sin(rotation)

	for i = 1, #vertices do
		local vertex = vertices[i]
		local vx, vy = vertex.x, vertex.y

		vx = vx - ox
		vy = vy - oy

		vertex.x = ox + (vx * c - vy * s)
		vertex.y = oy + (vx * s + vy * c)

		if (not rotate_uv) then
			local u, v = vertex.u, vertex.v
			u, v = u - 0.5, v - 0.5

			vertex.u = 0.5 + (u * c - v * s)
			vertex.v = 0.5 + (u * s + v * c)
		end
	end
end

local function CalculateVertices(x, y, radius, rotation, start_angle, end_angle, distance, rotate_uv)
	x = tonumber(x) or 0
	y = tonumber(y) or 0
	radius = tonumber(radius) or 16
	rotation = tonumber(rotation) or 0
	start_angle = tonumber(start_angle) or 0
	end_angle = tonumber(end_angle) or 360
	distance = tonumber(distance) or 10

	if (start_angle > end_angle) then
		local tmp = start_angle
		start_angle = end_angle
		end_angle = tmp
	end

	local vertices = {}
	local step = (distance * 360) / (2 * math.pi * radius)

	for a = start_angle, end_angle + step, step do
		a = max(start_angle, min(end_angle, a))
		a = rad(a)

		local c = cos(a)
		local s = sin(a)

		local vertex = {
			x = x + c * radius,
			y = y + s * radius,

			u = 0.5 + c / 2,
			v = 0.5 + s / 2,
		}

		table.insert(vertices, vertex)
	end

	if (end_angle - start_angle ~= 360) then
		table.insert(vertices, 1, {
			x = x, y = y,
			u = 0.5, v = 0.5,
		})
	else
		table.remove(vertices)
	end

	if (rotation ~= 0) then
		RotateVertices(vertices, x, y, rotation, rotate_uv)
	end

	return vertices
end

function CIRCLE:__tostring()
	return string.format("Circle: %p", self)
end

function CIRCLE:Copy()
	return table.Copy(self)
end

function CIRCLE:Calculate()
	local rotate_uv = self:GetRotateMaterial()
	local x, y = self:GetPos()
	local radius = self:GetRadius()
	local rotation = self:GetRotation()
	local start_angle = self:GetStartAngle()
	local end_angle = self:GetEndAngle()
	local distance = self:GetDistance()

	self:SetVertices(CalculateVertices(x, y, radius, rotation, start_angle, end_angle, distance, rotate_uv))

	if (self:GetType() == CIRCLE_OUTLINED) then
		local inner = self:GetChildCircle() or self:Copy()

		inner:SetType(CIRCLE_FILLED)
		inner:SetRadius(self:GetRadius() - self:GetOutlineWidth())
		inner:SetAngles(0, 360)

		inner:SetColor(false)
		inner:SetMaterial(false)
		inner:SetDisableClipping(false)

		self:SetChildCircle(inner)
	end

	self:SetDirty(false)
end

function CIRCLE:__call()
	if (self:GetDirty()) then
		self:Calculate()
	end

	if (IsColor(self:GetColor())) then surface.SetDrawColor(self:GetColor()) end
	if (TypeID(self:GetMaterial()) == TYPE_MATERIAL) then surface.SetMaterial(self:GetMaterial()) end

	local clip = self:GetDisableClipping()
	if (clip) then surface.DisableClipping(true) end

	if (self:GetType() == CIRCLE_OUTLINED) then
		render.ClearStencil()

		render.SetStencilEnable(true)
			render.SetStencilTestMask(0xFF)
			render.SetStencilWriteMask(0xFF)
			render.SetStencilReferenceValue(0x01)

			render.SetStencilCompareFunction(STENCIL_NEVER)
			render.SetStencilFailOperation(STENCIL_REPLACE)
			render.SetStencilZFailOperation(STENCIL_REPLACE)

			self:GetChildCircle()()

			render.SetStencilCompareFunction(STENCIL_GREATER)
			render.SetStencilFailOperation(STENCIL_KEEP)
			render.SetStencilZFailOperation(STENCIL_KEEP)

			surface.DrawPoly(self:GetVertices())
		render.SetStencilEnable(false)
	elseif (self:GetType() == CIRCLE_BLURRED) then
		render.ClearStencil()

		render.SetStencilEnable(true)
			render.SetStencilTestMask(0xFF)
			render.SetStencilWriteMask(0xFF)
			render.SetStencilReferenceValue(0x01)

			render.SetStencilCompareFunction(STENCIL_NEVER)
			render.SetStencilFailOperation(STENCIL_REPLACE)
			render.SetStencilZFailOperation(STENCIL_REPLACE)

			surface.DrawPoly(self:GetVertices())

			render.SetStencilCompareFunction(STENCIL_LESSEQUAL)
			render.SetStencilFailOperation(STENCIL_KEEP)
			render.SetStencilZFailOperation(STENCIL_KEEP)

			surface.SetMaterial(BlurMat)

			local sw, sh = ScrW(), ScrH()

			for i = 1, self:GetBlurQuality() do
				BlurMat:SetFloat("$blur", (i / self:GetBlurQuality()) * self:GetBlurDensity())
				BlurMat:Recompute()

				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(0, 0, sw, sh)
			end
		render.SetStencilEnable(false)
	else
		surface.DrawPoly(self:GetVertices())
	end

	if (clip) then surface.DisableClipping(false) end
end

function CIRCLE:Translate(x, y)
	self.m_X = self:GetX() + x
	self.m_Y = self:GetY() + y

	if (self:GetDirty()) then return end

	x = tonumber(x) or 0
	y = tonumber(y) or 0

	for i, v in ipairs(self:GetVertices()) do
		v.x = v.x + x
		v.y = v.y + y
	end

	if (self:GetType() == CIRCLE_OUTLINED) then
		self:GetChildCircle():Translate(x, y)
	end
end

function CIRCLE:Scale(scale)
	self.m_Radius = self:GetRadius() * scale

	if (self:GetDirty()) then return end

	local x, y = self:GetPos()
	scale = tonumber(scale) or 1

	for i, vertex in ipairs(self:GetVertices()) do
		vertex.x = x + ((vertex.x - x) * scale)
		vertex.y = y + ((vertex.y - y) * scale)
	end

	if (self:GetType() == CIRCLE_OUTLINED) then
		self:GetChildCircle():Scale(scale)
	end
end

function CIRCLE:Rotate(degrees)
	self.m_Rotation = self:GetRotation() + degrees

	if (self:GetDirty()) then return end

	local vertices = self:GetVertices()
	local x, y = self:GetPos()
	local rotate_uv = self:GetRotateMaterial()
	degrees = tonumber(degrees) or 0

	RotateVertices(vertices, x, y, degrees, rotate_uv)

	if (self:GetType() == CIRCLE_OUTLINED) then
		self:GetChildCircle():Rotate(degrees)
	end
end

do
	local function AccessorFunc(name, default, dirty, callback)
		local varname = "m_" .. name

		CIRCLE["Get" .. name] = function(self)
			return self[varname]
		end

		CIRCLE["Set" .. name] = function(self, value)
			if (default ~= nil and value == nil) then
				value = default
			end

			if (self[varname] ~= value) then
				if (dirty) then
					self[dirty] = true
				end

				if (isfunction(callback)) then
					value = callback(self, self[varname], value) or value
				end
			end

			self[varname] = value
		end

		CIRCLE[varname] = default
	end

	local function OffsetVerticesX(circle, old, new)
		if (circle:GetDirty() or not circle:GetVertices()) then return end

		for i, vertex in ipairs(circle:GetVertices()) do
			vertex.x = 0 - old + new + old
		end

		if (circle:GetType() == CIRCLE_OUTLINED) then
			OffsetVerticesX(circle:GetChildCircle(), old, new)
		end
	end

	local function OffsetVerticesY(circle, old, new)
		if (circle:GetDirty() or not circle:GetVertices()) then return end

		for i, vertex in ipairs(circle:GetVertices()) do
			vertex.y = 0 - old + new + old
		end

		if (circle:GetType() == CIRCLE_OUTLINED) then
			OffsetVerticesY(circle:GetChildCircle(), old, new)
		end
	end

	local function UpdateRotation(circle, old, new)
		if (circle:GetDirty() or not circle:GetVertices()) then return end

		local vertices = circle:GetVertices()
		local x, y = circle:GetPos()
		local rotation = new - old
		local rotate_uv = circle:GetRotateMaterial()

		RotateVertices(vertices, x, y, rotation, rotate_uv)

		if (circle:GetType() == CIRCLE_OUTLINED) then
			UpdateRotation(circle:GetChildCircle(), old, new)
		end
	end

	-- These are set internally. Only use them if you know what you're doing.
	AccessorFunc("Dirty", true)
	AccessorFunc("Vertices", false)
	AccessorFunc("ChildCircle", false)

	AccessorFunc("Color", false)						-- The colour you want the circle to be. If set to false then surface.SetDrawColor's can be used.
	AccessorFunc("Material", false)						-- The material you want the circle to render. If set to false then surface.SetMaterial can be used.
	AccessorFunc("RotateMaterial", true)				-- Sets whether or not the circle's UV points should be rotated with the vertices.
	AccessorFunc("DisableClipping", false)				-- Sets whether or not to disable clipping when the circle is rendered. Useful for circles that go out of the render bounds.

	AccessorFunc("Type", CIRCLE_FILLED, "m_Dirty") 		-- The circle's type.
	AccessorFunc("X", 0, false, OffsetVerticesX) 		-- The circle's X position relative to the top left of the screen.
	AccessorFunc("Y", 0, false, OffsetVerticesY) 		-- The circle's Y position relative to the top left of the screen.
	AccessorFunc("Radius", 8, "m_Dirty") 				-- The circle's radius.
	AccessorFunc("Rotation", 0, false, UpdateRotation)	-- The circle's rotation, measured in degrees.
	AccessorFunc("StartAngle", 0, "m_Dirty") 			-- The circle's start angle, measured in degrees.
	AccessorFunc("EndAngle", 360, "m_Dirty")			-- The circle's end angle, measured in degrees.
	AccessorFunc("Distance", 10, "m_Dirty")				-- The maximum distance between each of the circle's vertices. Set to false to use segments instead. This should typically be used for large circles in 3D2D.

	AccessorFunc("BlurDensity", 3)						-- The circle's blur density if Type is set to CIRCLE_BLURRED.
	AccessorFunc("BlurQuality", 2)						-- The circle's blur quality if Type is set to CIRCLE_BLURRED.
	AccessorFunc("OutlineWidth", 10, "m_Dirty")			-- The circle's outline width if Type is set to CIRCLE_OUTLINED.

	function CIRCLE:SetPos(x, y)
		self:SetX(x)
		self:SetY(y)
	end

	function CIRCLE:SetAngles(s, e)
		self:SetStartAngle(s)
		self:SetEndAngle(e)
	end

	function CIRCLE:GetPos()
		return self:GetX(), self:GetY()
	end

	function CIRCLE:GetAngles()
		return self:GetStartAngle(), self:GetEndAngle()
	end
end

_R.Circles = {
	New = New,
	RotateVertices = RotateVertices,
	CalculateVertices = CalculateVertices,
}

return _R.Circles

--PATH addons/talk-modes/lua/talk_modes/vgui/libs/cl_circles.lua:
local _R = debug.getregistry()
if (_R.Circles) then return _R.Circles end

local BlurMat = Material("pp/blurscreen")

local rad = math.rad
local cos = math.cos
local sin = math.sin
local min = math.min
local max = math.max

local CIRCLE = {}
CIRCLE.__index = CIRCLE

CIRCLE_FILLED = 0
CIRCLE_OUTLINED = 1
CIRCLE_BLURRED = 2

local function New(type, radius, x, y, ...)
	local circle = setmetatable({}, CIRCLE)

	circle:SetType(tonumber(type))
	circle:SetRadius(tonumber(radius))
	circle:SetPos(tonumber(x), tonumber(y))

	if (type == CIRCLE_OUTLINED) then
		local outline_width = ({...})[1]
		circle:SetOutlineWidth(tonumber(outline_width))
	elseif (type == CIRCLE_BLURRED) then
		local blur_density, blur_quality = unpack({...})
		circle:SetBlurDensity(tonumber(blur_density))
		circle:SetBlurQuality(tonumber(blur_quality))
	end

	return circle
end

local function RotateVertices(vertices, ox, oy, rotation, rotate_uv)
	rotation = rad(rotation)

	local c = cos(rotation)
	local s = sin(rotation)

	for i = 1, #vertices do
		local vertex = vertices[i]
		local vx, vy = vertex.x, vertex.y

		vx = vx - ox
		vy = vy - oy

		vertex.x = ox + (vx * c - vy * s)
		vertex.y = oy + (vx * s + vy * c)

		if (not rotate_uv) then
			local u, v = vertex.u, vertex.v
			u, v = u - 0.5, v - 0.5

			vertex.u = 0.5 + (u * c - v * s)
			vertex.v = 0.5 + (u * s + v * c)
		end
	end
end

local function CalculateVertices(x, y, radius, rotation, start_angle, end_angle, distance, rotate_uv)
	x = tonumber(x) or 0
	y = tonumber(y) or 0
	radius = tonumber(radius) or 16
	rotation = tonumber(rotation) or 0
	start_angle = tonumber(start_angle) or 0
	end_angle = tonumber(end_angle) or 360
	distance = tonumber(distance) or 10

	if (start_angle > end_angle) then
		local tmp = start_angle
		start_angle = end_angle
		end_angle = tmp
	end

	local vertices = {}
	local step = (distance * 360) / (2 * math.pi * radius)

	for a = start_angle, end_angle + step, step do
		a = max(start_angle, min(end_angle, a))
		a = rad(a)

		local c = cos(a)
		local s = sin(a)

		local vertex = {
			x = x + c * radius,
			y = y + s * radius,

			u = 0.5 + c / 2,
			v = 0.5 + s / 2,
		}

		table.insert(vertices, vertex)
	end

	if (end_angle - start_angle ~= 360) then
		table.insert(vertices, 1, {
			x = x, y = y,
			u = 0.5, v = 0.5,
		})
	else
		table.remove(vertices)
	end

	if (rotation ~= 0) then
		RotateVertices(vertices, x, y, rotation, rotate_uv)
	end

	return vertices
end

function CIRCLE:__tostring()
	return string.format("Circle: %p", self)
end

function CIRCLE:Copy()
	return table.Copy(self)
end

function CIRCLE:Calculate()
	local rotate_uv = self:GetRotateMaterial()
	local x, y = self:GetPos()
	local radius = self:GetRadius()
	local rotation = self:GetRotation()
	local start_angle = self:GetStartAngle()
	local end_angle = self:GetEndAngle()
	local distance = self:GetDistance()

	self:SetVertices(CalculateVertices(x, y, radius, rotation, start_angle, end_angle, distance, rotate_uv))

	if (self:GetType() == CIRCLE_OUTLINED) then
		local inner = self:GetChildCircle() or self:Copy()

		inner:SetType(CIRCLE_FILLED)
		inner:SetRadius(self:GetRadius() - self:GetOutlineWidth())
		inner:SetAngles(0, 360)

		inner:SetColor(false)
		inner:SetMaterial(false)
		inner:SetDisableClipping(false)

		self:SetChildCircle(inner)
	end

	self:SetDirty(false)
end

function CIRCLE:__call()
	if (self:GetDirty()) then
		self:Calculate()
	end

	if (IsColor(self:GetColor())) then surface.SetDrawColor(self:GetColor()) end
	if (TypeID(self:GetMaterial()) == TYPE_MATERIAL) then surface.SetMaterial(self:GetMaterial()) end

	local clip = self:GetDisableClipping()
	if (clip) then surface.DisableClipping(true) end

	if (self:GetType() == CIRCLE_OUTLINED) then
		render.ClearStencil()

		render.SetStencilEnable(true)
			render.SetStencilTestMask(0xFF)
			render.SetStencilWriteMask(0xFF)
			render.SetStencilReferenceValue(0x01)

			render.SetStencilCompareFunction(STENCIL_NEVER)
			render.SetStencilFailOperation(STENCIL_REPLACE)
			render.SetStencilZFailOperation(STENCIL_REPLACE)

			self:GetChildCircle()()

			render.SetStencilCompareFunction(STENCIL_GREATER)
			render.SetStencilFailOperation(STENCIL_KEEP)
			render.SetStencilZFailOperation(STENCIL_KEEP)

			surface.DrawPoly(self:GetVertices())
		render.SetStencilEnable(false)
	elseif (self:GetType() == CIRCLE_BLURRED) then
		render.ClearStencil()

		render.SetStencilEnable(true)
			render.SetStencilTestMask(0xFF)
			render.SetStencilWriteMask(0xFF)
			render.SetStencilReferenceValue(0x01)

			render.SetStencilCompareFunction(STENCIL_NEVER)
			render.SetStencilFailOperation(STENCIL_REPLACE)
			render.SetStencilZFailOperation(STENCIL_REPLACE)

			surface.DrawPoly(self:GetVertices())

			render.SetStencilCompareFunction(STENCIL_LESSEQUAL)
			render.SetStencilFailOperation(STENCIL_KEEP)
			render.SetStencilZFailOperation(STENCIL_KEEP)

			surface.SetMaterial(BlurMat)

			local sw, sh = ScrW(), ScrH()

			for i = 1, self:GetBlurQuality() do
				BlurMat:SetFloat("$blur", (i / self:GetBlurQuality()) * self:GetBlurDensity())
				BlurMat:Recompute()

				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(0, 0, sw, sh)
			end
		render.SetStencilEnable(false)
	else
		surface.DrawPoly(self:GetVertices())
	end

	if (clip) then surface.DisableClipping(false) end
end

function CIRCLE:Translate(x, y)
	self.m_X = self:GetX() + x
	self.m_Y = self:GetY() + y

	if (self:GetDirty()) then return end

	x = tonumber(x) or 0
	y = tonumber(y) or 0

	for i, v in ipairs(self:GetVertices()) do
		v.x = v.x + x
		v.y = v.y + y
	end

	if (self:GetType() == CIRCLE_OUTLINED) then
		self:GetChildCircle():Translate(x, y)
	end
end

function CIRCLE:Scale(scale)
	self.m_Radius = self:GetRadius() * scale

	if (self:GetDirty()) then return end

	local x, y = self:GetPos()
	scale = tonumber(scale) or 1

	for i, vertex in ipairs(self:GetVertices()) do
		vertex.x = x + ((vertex.x - x) * scale)
		vertex.y = y + ((vertex.y - y) * scale)
	end

	if (self:GetType() == CIRCLE_OUTLINED) then
		self:GetChildCircle():Scale(scale)
	end
end

function CIRCLE:Rotate(degrees)
	self.m_Rotation = self:GetRotation() + degrees

	if (self:GetDirty()) then return end

	local vertices = self:GetVertices()
	local x, y = self:GetPos()
	local rotate_uv = self:GetRotateMaterial()
	degrees = tonumber(degrees) or 0

	RotateVertices(vertices, x, y, degrees, rotate_uv)

	if (self:GetType() == CIRCLE_OUTLINED) then
		self:GetChildCircle():Rotate(degrees)
	end
end

do
	local function AccessorFunc(name, default, dirty, callback)
		local varname = "m_" .. name

		CIRCLE["Get" .. name] = function(self)
			return self[varname]
		end

		CIRCLE["Set" .. name] = function(self, value)
			if (default ~= nil and value == nil) then
				value = default
			end

			if (self[varname] ~= value) then
				if (dirty) then
					self[dirty] = true
				end

				if (isfunction(callback)) then
					value = callback(self, self[varname], value) or value
				end
			end

			self[varname] = value
		end

		CIRCLE[varname] = default
	end

	local function OffsetVerticesX(circle, old, new)
		if (circle:GetDirty() or not circle:GetVertices()) then return end

		for i, vertex in ipairs(circle:GetVertices()) do
			vertex.x = 0 - old + new + old
		end

		if (circle:GetType() == CIRCLE_OUTLINED) then
			OffsetVerticesX(circle:GetChildCircle(), old, new)
		end
	end

	local function OffsetVerticesY(circle, old, new)
		if (circle:GetDirty() or not circle:GetVertices()) then return end

		for i, vertex in ipairs(circle:GetVertices()) do
			vertex.y = 0 - old + new + old
		end

		if (circle:GetType() == CIRCLE_OUTLINED) then
			OffsetVerticesY(circle:GetChildCircle(), old, new)
		end
	end

	local function UpdateRotation(circle, old, new)
		if (circle:GetDirty() or not circle:GetVertices()) then return end

		local vertices = circle:GetVertices()
		local x, y = circle:GetPos()
		local rotation = new - old
		local rotate_uv = circle:GetRotateMaterial()

		RotateVertices(vertices, x, y, rotation, rotate_uv)

		if (circle:GetType() == CIRCLE_OUTLINED) then
			UpdateRotation(circle:GetChildCircle(), old, new)
		end
	end

	-- These are set internally. Only use them if you know what you're doing.
	AccessorFunc("Dirty", true)
	AccessorFunc("Vertices", false)
	AccessorFunc("ChildCircle", false)

	AccessorFunc("Color", false)						-- The colour you want the circle to be. If set to false then surface.SetDrawColor's can be used.
	AccessorFunc("Material", false)						-- The material you want the circle to render. If set to false then surface.SetMaterial can be used.
	AccessorFunc("RotateMaterial", true)				-- Sets whether or not the circle's UV points should be rotated with the vertices.
	AccessorFunc("DisableClipping", false)				-- Sets whether or not to disable clipping when the circle is rendered. Useful for circles that go out of the render bounds.

	AccessorFunc("Type", CIRCLE_FILLED, "m_Dirty") 		-- The circle's type.
	AccessorFunc("X", 0, false, OffsetVerticesX) 		-- The circle's X position relative to the top left of the screen.
	AccessorFunc("Y", 0, false, OffsetVerticesY) 		-- The circle's Y position relative to the top left of the screen.
	AccessorFunc("Radius", 8, "m_Dirty") 				-- The circle's radius.
	AccessorFunc("Rotation", 0, false, UpdateRotation)	-- The circle's rotation, measured in degrees.
	AccessorFunc("StartAngle", 0, "m_Dirty") 			-- The circle's start angle, measured in degrees.
	AccessorFunc("EndAngle", 360, "m_Dirty")			-- The circle's end angle, measured in degrees.
	AccessorFunc("Distance", 10, "m_Dirty")				-- The maximum distance between each of the circle's vertices. Set to false to use segments instead. This should typically be used for large circles in 3D2D.

	AccessorFunc("BlurDensity", 3)						-- The circle's blur density if Type is set to CIRCLE_BLURRED.
	AccessorFunc("BlurQuality", 2)						-- The circle's blur quality if Type is set to CIRCLE_BLURRED.
	AccessorFunc("OutlineWidth", 10, "m_Dirty")			-- The circle's outline width if Type is set to CIRCLE_OUTLINED.

	function CIRCLE:SetPos(x, y)
		self:SetX(x)
		self:SetY(y)
	end

	function CIRCLE:SetAngles(s, e)
		self:SetStartAngle(s)
		self:SetEndAngle(e)
	end

	function CIRCLE:GetPos()
		return self:GetX(), self:GetY()
	end

	function CIRCLE:GetAngles()
		return self:GetStartAngle(), self:GetEndAngle()
	end
end

_R.Circles = {
	New = New,
	RotateVertices = RotateVertices,
	CalculateVertices = CalculateVertices,
}

return _R.Circles

--PATH addons/the_perfect_training_system/lua/diablos_training/client/cl_functions.lua:
/*---------------------------------------------------------------------------
	Paint functions to paint a panel depending on the effect (none, hovered, down)
	If none of the colors are specified, then it means this is a "classic" label color scheme
	Return the great color
---------------------------------------------------------------------------*/

local DEFAULT_COLOR_PATH = Diablos.TS.Colors
function Diablos.TS:PaintFunctions(panel, panelNone, panelHover, panelDown)
	local panelColor = panelNone
	local panelHoverColor = panelHover
	local panelDownColor = panelDown
	if not panelColor then
		panelColor = DEFAULT_COLOR_PATH.Label
	end
	if not panelHoverColor then
		panelHoverColor = DEFAULT_COLOR_PATH.LabelHovered
	end
	if not panelDownColor then
		panelDownColor = DEFAULT_COLOR_PATH.LabelDown
	end

	local colorValue

	if panel:IsHovered() then
		if panel:IsDown() then
			colorValue = panelDownColor
		else
			colorValue = panelHoverColor
		end
	else
		colorValue = panelColor
	end

	return colorValue
end

/*---------------------------------------------------------------------------
	Write a progress bar with the fill according to the percent
---------------------------------------------------------------------------*/

function Diablos.TS:WriteProgressBar(posX, posY, WIDTH, HEIGHT, percent)
	surface.SetDrawColor(Diablos.TS.Colors.barBackground)
	surface.DrawRect(posX, posY - HEIGHT / 2, WIDTH, HEIGHT)
	surface.SetDrawColor(Diablos.TS.Colors.barFill)
	surface.DrawRect(posX, posY - HEIGHT / 2, math.min(WIDTH * percent, WIDTH), HEIGHT)
end


/*---------------------------------------------------------------------------
	Draw a key onto the screen
---------------------------------------------------------------------------*/

function Diablos.TS:DrawKey(key, posX, posY, fontSize, borderSize, isArrow, keyIndex)
	local ply = LocalPlayer()
	local font = string.format("Diablos:Font:TS:%u", fontSize)
	surface.SetFont(font)
	local sizex, sizey = surface.GetTextSize(key)

	local colInside = color_black
	if not isArrow then
		if ply.keyTable != nil and #ply.keyTable > 0 then
			if ply.keyGreat[keyIndex] != nil then
				if ply.keyGreat[keyIndex] then
					colInside = Diablos.TS.Colors.gl
				else
					colInside = Diablos.TS.Colors.rl
				end
			end
		end
	end

	draw.RoundedBox(12, posX - sizex / 2 - borderSize, posY - sizey / 2 - borderSize / 2, sizex + borderSize * 2, sizey + borderSize, color_black)
	draw.RoundedBox(8, posX - sizex / 2 - borderSize / 2, posY - sizey / 2 - borderSize / 4, sizex + borderSize, sizey + borderSize / 2, Diablos.TS.Colors.Label)
	draw.RoundedBox(8, posX - sizex / 2 - borderSize / 2 + 1, posY - sizey / 2 - borderSize / 4 + 1, sizex + borderSize - 2, sizey + borderSize / 2 - 2, colInside)
	draw.SimpleText(key, font, posX, posY, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	if isArrow then
		local downState = 20 * math.sin(CurTime() * 10)
		surface.SetDrawColor(color_white)
		surface.SetMaterial(Diablos.TS.Materials.downKey)
		surface.DrawTexturedRect(posX - 30, posY - sizey / 2 - downState - 100, 60, 60)
	end
end

/*---------------------------------------------------------------------------
	Set the render bounds of the DModelPanel
---------------------------------------------------------------------------*/

function Diablos.TS:UpdateRenderBounds(icon, fov)
	local mn, mx = icon.Entity:GetRenderBounds()
	local size = 0
	size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
	size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
	size = math.max(size, math.abs(mn.z) + math.abs(mx.z))

	icon:SetFOV(fov)
	icon:SetCamPos(Vector(size, size, size))
	icon:SetLookAt((mn + mx) * 0.5)

	function icon:LayoutEntity( Entity ) return end
end


/*---------------------------------------------------------------------------
	Update information clientside when the user is starting a training
---------------------------------------------------------------------------*/


function Diablos.TS:StartTraining(ply, typeTraining, timeTraining)

	ply.typeTraining = typeTraining

	ply.startTraining = CurTime() -- start the training experience
	ply.beginTraining = CurTime() + Diablos.TS.TimeBeforeTraining -- the training begins
	ply.EndTraining = ply.beginTraining + timeTraining -- the training ends

	if typeTraining == "stamina" or typeTraining == "runningspeed" then
		ply.keyTipTime = CurTime()
		ply.curSpeed = 0
	elseif typeTraining == "strength" then
		ply.keyGreat = {}
		ply.curnbKeysSucceed = 0

		ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, ACT_GMOD_GESTURE_BECON, false)
	elseif typeTraining == "attackspeed" then
		ply.curHit = 0
	end
end

/*---------------------------------------------------------------------------
	Update animation gesture for all the players
	AnimRestartGesture needs to be broadcasted to the clients as this is not networked by default
---------------------------------------------------------------------------*/

function Diablos.TS:UpdateAnimation(plyAnim, isStarting)
	if isStarting then
		plyAnim:AnimRestartGesture(GESTURE_SLOT_CUSTOM, ACT_GMOD_GESTURE_BECON, false)
	else
		plyAnim:AnimResetGestureSlot(GESTURE_SLOT_CUSTOM)
	end
end

/*---------------------------------------------------------------------------
	Update information clientside to refresh some data about the training
---------------------------------------------------------------------------*/

function Diablos.TS:RefreshTraining(ply, typeTraining, newNumber)
	if typeTraining == "stamina" or typeTraining == "runningspeed" then
		ply.curSpeed = newNumber / 10
	elseif typeTraining == "strength" then
		ply.curnbKeysSucceed = newNumber
	elseif typeTraining == "attackspeed" then
		ply.curHit = (ply.curHit or 0) + newNumber
	end
end


/*---------------------------------------------------------------------------
	Reset all the data when the training has ended
---------------------------------------------------------------------------*/

function Diablos.TS:StopTraining(ply, typeTraining)
	ply.startTraining = 0
	ply.beginTraining = 0
	ply.EndTraining = 0
	ply.typeTraining = ""

	if typeTraining == "stamina" then
		ply.keyTipTime = 0
		ply.curSpeed = 0
	elseif typeTraining == "runningspeed" then
		ply.keyTipTime = 0
		ply.curSpeed = 0
	elseif typeTraining == "strength" then
		ply.keyTable = {}
		ply.keyGreat = {}
		ply:AnimResetGestureSlot(GESTURE_SLOT_CUSTOM)
	elseif typeTraining == "attackspeed" then
		ply.curHit = 0
	end
end


/*---------------------------------------------------------------------------
	Self-explanatory function (called a lot of times on RefreshBones and is much smoother to read)
---------------------------------------------------------------------------*/

local function ScaleBone(ply, index, vec)
	if index != nil then
		-- ply:ManipulateBoneScale(index, vec)
	end
end

/*---------------------------------------------------------------------------
	Self-explanatory function, again (to reset bones to a default size)
---------------------------------------------------------------------------*/

local vec_one = Vector(1, 1, 1)
local function ResetBonesToOrigin(ply, listBones)
	for _, bone in ipairs(listBones) do
		-- ScaleBone(ply, bone, vec_one)
	end
end

/*---------------------------------------------------------------------------
	Self-explanatory function to scale the vector by the quota
---------------------------------------------------------------------------*/

local function ScaleVector(vec, quota)
	return vec_one + vec * quota
end

-- can be several type of trainings
function Diablos.TS:RefreshBones(plyBone, trainingsToUpdate)
	if not Diablos.TS.ChangeBones then return end

	for typeMuscle, values in pairs(trainingsToUpdate) do

		local curLevel = values.level
		local reset = values.reset

		local maxLevel = table.Count(Diablos.TS:GetTrainingLevelTable(typeMuscle))


		local levelQuota = curLevel / maxLevel
		-- levelQuota = 1 -- WARN: To uncomment only if you want to see the maximum realistic muscles you could have

		local bones = {}

		if typeMuscle == "strength" then
			-- Increase Shoulder / Trapezius / Upperarm
			-- bicep & elbow are useless here

			local shoulderL = plyBone:LookupBone("ValveBiped.Bip01_L_Shoulder") table.insert(bones, shoulderL)
			local shoulderR = plyBone:LookupBone("ValveBiped.Bip01_R_Shoulder") table.insert(bones, shoulderR)
			local trapeziusL = plyBone:LookupBone("ValveBiped.Bip01_L_Trapezius") table.insert(bones, trapeziusL)
			local trapeziusR = plyBone:LookupBone("ValveBiped.Bip01_R_Trapezius") table.insert(bones, trapeziusR)
			local upperarmL = plyBone:LookupBone("ValveBiped.Bip01_L_Upperarm") table.insert(bones, upperArmL)
			local upperarmR = plyBone:LookupBone("ValveBiped.Bip01_R_Upperarm") table.insert(bones, upperArmR)

			if not reset then
				ScaleBone(plyBone, shoulderL, ScaleVector(Vector(1, 0.4, 2), levelQuota))
				ScaleBone(plyBone, shoulderR, ScaleVector(Vector(1, 0.4, 2), levelQuota))
				ScaleBone(plyBone, trapeziusL, ScaleVector(Vector(1, 1, 1), levelQuota))
				ScaleBone(plyBone, trapeziusR, ScaleVector(Vector(1, 1, 1), levelQuota))
				ScaleBone(plyBone, upperarmL, ScaleVector(Vector(0, 0, 1), levelQuota))
				ScaleBone(plyBone, upperarmR, ScaleVector(Vector(0, 0, 1), levelQuota))
			end
		elseif typeMuscle == "stamina" then
			-- Increase Thigh


			local thighL = plyBone:LookupBone("ValveBiped.Bip01_L_Thigh") table.insert(bones, thighL)
			local thighR = plyBone:LookupBone("ValveBiped.Bip01_R_Thigh") table.insert(bones, thighR)

			if not reset then
				ScaleBone(plyBone, thighL, ScaleVector(Vector(0, 0.3, 0.6), levelQuota))
				ScaleBone(plyBone, thighR, ScaleVector(Vector(0, 0.3, 0.6), levelQuota))
			end

		elseif typeMuscle == "runningspeed" then
			-- Increase Calf

			local calfL = plyBone:LookupBone("ValveBiped.Bip01_L_Calf") table.insert(bones, calfL)
			local calfR = plyBone:LookupBone("ValveBiped.Bip01_R_Calf") table.insert(bones, calfR)

			if not reset then
				ScaleBone(plyBone, calfL, ScaleVector(Vector(0.3, 0.3, 0.6), levelQuota))
				ScaleBone(plyBone, calfR, ScaleVector(Vector(0.3, 0.3, 0.6), levelQuota))
			end

		elseif typeMuscle == "attackspeed" then -- doesn't do anything
			-- Increase Forearm
			-- wrist and ulna increases do nothing, and hand should not be increased because the viewmodels will also be!

			local forearmL = plyBone:LookupBone("ValveBiped.Bip01_L_Forearm") table.insert(bones, forearmL)
			local forearmR = plyBone:LookupBone("ValveBiped.Bip01_R_Forearm") table.insert(bones, forearmR)

			if not reset then
				ScaleBone(plyBone, forearmL, ScaleVector(Vector(0, 0.5, 0.5), levelQuota))
				ScaleBone(plyBone, forearmR, ScaleVector(Vector(0, 0.5, 0.5), levelQuota))
			end
		end

		if reset then
			-- If we need to reset bones
			ResetBonesToOrigin(plyBone, bones)
		end
	end

end

/*---------------------------------------------------------------------------
	Read the training information of a player
	This will recreate the training table clientside with the values sent: 
		- a pair of (xp, date) for every training enabled on the server
		- a UInt for the subscription date validity
---------------------------------------------------------------------------*/

function Diablos.TS:ReadTrainingInfo(ply)
	local trainings = Diablos.TS:GetTrainings()
	local tableToReturn = {["Trainings"] = {}}
	for _, training in ipairs(trainings) do
		local curXP = net.ReadUInt(32)
		local curDate = net.ReadUInt(32)

		tableToReturn["Trainings"][training] = {xp = curXP, date = curDate}
	end

	tableToReturn["Badge"] = {subdate = net.ReadUInt(32)}

	return tableToReturn
end
--PATH addons/the_perfect_training_system/lua/diablos_training/client/cl_hooks.lua:
/* Show the current level */

local curLevelFrame
hook.Add("HUDPaint", "TPTSA:ShowCurrentLevel", function()
	local ply = LocalPlayer()
	local scrw, scrh = ScrW(), ScrH()

	-- Show data automatically
	if ply.beginTraining != nil and ply.beginTraining > 0 then

		if not IsValid(curLevelFrame) then

			local sizex, sizey = scrw / 1920 * 600, scrh / 1080 * 360


			curLevelFrame = vgui.Create("DFrame")
			curLevelFrame:ShowCloseButton(false)
			curLevelFrame:SetTitle("")
			curLevelFrame:SetPos(scrw * 0.05, scrh * 0.05)
			curLevelFrame:SetSize(sizex, sizey)
			curLevelFrame.text = ""
			curLevelFrame.Paint = function(s, w, h) end
			curLevelFrame:SetKeyboardInputEnabled(true)

			local curLevelPanel = vgui.Create("DPanel", curLevelFrame)
			curLevelPanel:Dock(FILL)
			curLevelPanel:DockMargin(10, 10, 10, 10)

			curLevelPanel.Paint = function(s, w, h)

				if ply.typeTraining == "" then return end

				surface.SetDrawColor(color_white)
				surface.DrawRect(0, 0, w, h)

				surface.SetDrawColor(Diablos.TS.Colors.CurLevelBox)
				surface.DrawRect(2, 2, w - 4, h - 4)

				draw.SimpleText(Diablos.TS:GetLanguageString("training"), "Diablos:Font:TS:45:B", 10, 10, Diablos.TS.Colors.gl, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

				surface.SetDrawColor(Diablos.TS.Colors.barBackground)
				surface.DrawRect(2, h * 0.2, w - 4, 2)

				local trainingMat
				local typeTraining = ply.typeTraining
				local trainingText = Diablos.TS:GetLanguageString(ply.typeTraining)
				typeTraining = string.lower(typeTraining)
				if typeTraining == "stamina" then
					trainingMat = Diablos.TS.Materials.stamina
				elseif typeTraining == "runningspeed" then
					trainingMat = Diablos.TS.Materials.runningSpeed
				elseif typeTraining == "strength" then
					trainingMat = Diablos.TS.Materials.strength
				elseif typeTraining == "attackspeed" then
					trainingMat = Diablos.TS.Materials.attackSpeed
				end


				local curtime = CurTime()
				local trainingLevel = Diablos.TS:GetTrainingLevel(typeTraining, ply)

				local begPosY = h * 0.23
				local sizeIconY = h * 0.13

				surface.SetDrawColor(color_white)
				surface.SetMaterial(trainingMat)
				surface.DrawTexturedRect(10, begPosY, 40, sizeIconY)

				draw.SimpleText(trainingText, "Diablos:Font:TS:40", 60, begPosY + sizeIconY / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				draw.SimpleText(string.format(Diablos.TS:GetLanguageString("currentLevel"), trainingLevel), "Diablos:Font:TS:40", w - 10, begPosY + sizeIconY / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

				begPosY = h * 0.42
				sizeY = h * 0.06

				local transition = math.min(curtime - ply.startTraining, 1)
				Diablos.TS:WriteProgressBar(10, begPosY, w - 20, sizeY, Diablos.TS:GetTrainingPercentage(typeTraining, ply) / 100 * transition)

				begPosY = h * 0.5
				sizeY = h * 0.3

				local posCenter = w / 2 / 2
				surface.SetDrawColor(Diablos.TS.Colors.CurLevelBox)
				surface.DrawRect(10, begPosY, w / 2 - 15, sizeY)
				local currentTimer = math.ceil(ply.beginTraining-curtime)
				local prefixText = Diablos.TS:GetLanguageString("beginning")

				if currentTimer <= 0 then -- it means the current timer is the ending one
					prefixText = Diablos.TS:GetLanguageString("ending")
					currentTimer = math.ceil(ply.EndTraining - curtime)
				end

				draw.SimpleText(prefixText, "Diablos:Font:TS:35:I", posCenter, begPosY + 5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				local curColor = Diablos.TS.Colors.gl
				if currentTimer <= 3 then
					curColor = Diablos.TS.Colors.rl
				end

				local secondStr = Diablos.TS:GetLanguageString("second")
				if currentTimer > 1 then
					secondStr = Diablos.TS:GetLanguageString("seconds")
				end

				surface.SetFont("Diablos:Font:TS:40:B")
				local sizextimer, sizeytimer = surface.GetTextSize(currentTimer)
				surface.SetFont("Diablos:Font:TS:25")
				local sizexsecond = surface.GetTextSize(secondStr)

				local sizextotal = sizextimer + sizexsecond

				draw.SimpleText(currentTimer, "Diablos:Font:TS:40:B", posCenter - sizextotal / 2, begPosY + sizeY - 5, curColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
				draw.SimpleText(secondStr, "Diablos:Font:TS:25", posCenter - sizextotal / 2 + sizextimer + 10, begPosY + sizeY - 5 - sizeytimer / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				posCenter = w - w / 2 / 2
				surface.SetDrawColor(Diablos.TS.Colors.CurLevelBox)
				surface.DrawRect(w / 2 + 5, begPosY, w / 2 - 15, sizeY)
				local leaveKey = string.upper(Diablos.TS:GetKeyNameReference(Diablos.TS.StopTrainingKey))
				draw.SimpleText(Diablos.TS:GetLanguageString("leaveTraining"), "Diablos:Font:TS:35:I", posCenter, begPosY + 5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

				local fontSize = 30
				if h < 300 then
					fontSize = 25
				end

				Diablos.TS:DrawKey(leaveKey, posCenter, begPosY + sizeY - 5 - 15, fontSize, 10, false)

				if curLevelFrame.text then
					draw.SimpleText(curLevelFrame.text, "Diablos:Font:TS:45", w / 2, h - 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				end
			end
		end
	else
		if IsValid(curLevelFrame) then
			curLevelFrame:Close()
			curLevelFrame = nil
		end
	end

end)

/* Show the treadmill training information */

hook.Add("HUDPaint", "TPTSA:ShowTreadmillInfo", function()
	local ply = LocalPlayer()
	local curtime = CurTime()
	local scrw, scrh = ScrW(), ScrH()

	if ply.typeTraining == "stamina" or ply.typeTraining == "runningspeed" then
		if ply.keyTipTime != nil and ply.keyTipTime > 0 then

			if IsValid(curLevelFrame) then
				curLevelFrame.text = string.format("%s: %4.2f %s", Diablos.TS:GetLanguageString("treadmillCurSpeed"), ply.curSpeed, Diablos.TS:GetSpeedText())
			end

			if ply.beginTraining > curtime then
				local keyName = Diablos.TS:GetKeyNameReference(IN_FORWARD)
				if keyName then
					keyName = string.upper(keyName)
					Diablos.TS:DrawKey(keyName, scrw * 0.5, scrh * 0.8, 45, 40, true)
				end

			else
				if ply:KeyDown(IN_FORWARD) then
					ply.keyTipTime = curtime
				end

				if not ply:KeyDown(IN_FORWARD) and ply.keyTipTime + 1.5 < curtime then
					local keyName = Diablos.TS:GetKeyNameReference(IN_FORWARD)
					if keyName then
						keyName = string.upper(keyName)
						Diablos.TS:DrawKey(keyName, scrw * 0.5, scrh * 0.8, 45, 40, true)
					end
				end
			end
		end
	end
end)

/* Show the dumbbell training information */

local dumbbellCircleCol = Color(255, 255, 255, 10)

hook.Add("HUDPaint", "TPTSA:ShowDumbbellInfo", function()
	local ply = LocalPlayer()
	local curtime = CurTime()
	local scrw, scrh = ScrW(), ScrH()

	if ply.typeTraining == "strength" then

		if IsValid(curLevelFrame) then
			curLevelFrame.text = string.format("%u/%u %s", ply.curnbKeysSucceed, #ply.keyTable, Diablos.TS:GetLanguageString("keys"))
		end

		local heightPoint = 0.8

		surface.SetDrawColor(dumbbellCircleCol)
		surface.SetMaterial(Diablos.TS.Materials.dumbbellBackground)
		surface.DrawTexturedRect(0, scrh * heightPoint, scrw, 200)

		surface.SetDrawColor(color_white)

		surface.SetMaterial(Diablos.TS.Materials.circle)
		surface.DrawTexturedRect(scrw * 0.5 - 100, scrh * heightPoint, 200, 200)


		if ply.beginTraining <= curtime then

			local totalTime = ply.EndTraining - ply.beginTraining
			local timePerKey = (totalTime - 2) / #ply.keyTable
			for k,v in ipairs(ply.keyTable) do
				local realName = string.upper(language.GetPhrase(input.GetKeyName(v)))

				local diff = curtime - ply.beginTraining
				local xCalc = (scrw * 0.5 * (k-1)) + ((scrw * 1) - ((scrw * 0.5) * diff / timePerKey))

				local intervalTouch = 0.3 -- meaning you have intervalTouch second interval to touch
				local goodTime = diff - k * timePerKey

				-- If the key has not been managed (still not right nor wrong)
				if #ply.keyGreat < k then
					-- If you press a key in the wrong interval: failure!
					for i = 1, 36 do
						if input.IsKeyDown(i) and (goodTime > -(timePerKey - intervalTouch) and goodTime < -intervalTouch) then
							table.insert(ply.keyGreat, k, false)
						end
					end

					-- You pressed the correct key in the good interval: success!
					if input.IsKeyDown(v) and (goodTime <= intervalTouch and goodTime >= -intervalTouch) then
						table.insert(ply.keyGreat, k, true)
						ply.curnbKeysSucceed = ply.curnbKeysSucceed + 1
					end

					-- Too late
					if goodTime > intervalTouch then
						table.insert(ply.keyGreat, k, false)
					end
				end

				Diablos.TS:DrawKey(realName, xCalc, scrh * heightPoint + 100, 45, 40, false, k)
			end

			-- Since it is better to manage keys clientside to not abuse the network traffic,
			-- The net has a lot of verification serverside to ensure everything is alright.
			if ply.EndTraining < curtime then
				net.Start("TPTSA:DumbbellResult")
					net.WriteUInt(#ply.keyTable, 8)
					for k,v in ipairs(ply.keyGreat) do
						net.WriteBool(v)
					end
				net.SendToServer()
				Diablos.TS:StopTraining(ply, ply.typeTraining)
				ply:AnimResetGestureSlot(GESTURE_SLOT_CUSTOM)
			end
		end
	end
end)



/* Show the punching ball training information */

hook.Add("HUDPaint", "TPTSA:ShowPunchingInfo", function()
	local ply = LocalPlayer()

	if ply.typeTraining == "attackspeed" then
		if IsValid(curLevelFrame) then
			curLevelFrame.text = string.format(Diablos.TS:GetLanguageString("punchingHitDamage"), ply.curHit)
		end
	end
end)

/* Show the stamina bar */

local staminaPanel

hook.Add("HUDPaint", "TPTSA:StaminaPanel", function()

	-- Don't show the panel if stamina is disabled
	if not Diablos.TS:IsTrainingEnabled("stamina") then return end

	if Diablos.TS.ShowStaminaOnRun then

		local ply = LocalPlayer()

		-- Don't show the panel if the stamina has not been initialized
		if not ply.InitStamina then return end

		-- Don't show the panel if you're training
		if (ply.typeTraining and ply.typeTraining != "") then return end


		local scrw, scrh = ScrW(), ScrH()

		local curStamina = ply:TSGetStamina()
		local maxStamina = ply:TSGetMaxStamina()

		if IsValid(staminaPanel) and (curStamina == maxStamina or ply.StaminaNoClip) then
			staminaPanel:Remove()
		end

		if (not IsValid(staminaPanel) and curStamina != maxStamina) then

			local posX, posY
			if Diablos.TS.StaminaPanelPosX >= 0 and Diablos.TS.StaminaPanelPosX <= 1 then
				posX = scrw * Diablos.TS.StaminaPanelPosX
			else
				posX = Diablos.TS.StaminaPanelPosX
			end
			if Diablos.TS.StaminaPanelPosY >= 0 and Diablos.TS.StaminaPanelPosY <= 1 then
				posY = scrh * Diablos.TS.StaminaPanelPosY
			else
				posY = Diablos.TS.StaminaPanelPosY
			end

			if Diablos.TS.MinimalisticPanel then

				local sizex, sizey = scrw / 1920 * (Diablos.TS.MinimalisticBarX or 200), scrh / 1080 * (Diablos.TS.MinimalisticBarY or 40)

				staminaPanel = vgui.Create("DPanel")
				staminaPanel:SetPos(posX, posY)
				staminaPanel:SetSize(sizex, sizey)
				staminaPanel.Paint = function(s, w, h)
					curStamina = ply:TSGetStamina()
					maxStamina = ply:TSGetMaxStamina()

					local percent = curStamina / maxStamina

					local sizeX = w - 10
					local sizeY = h - 10

					local posXPanel = 5
					local posYPanel = h - sizeY - 5

					surface.SetDrawColor(Diablos.TS.Colors.StaminaBar)
					surface.DrawRect(posXPanel, posYPanel, sizeX, sizeY)

					local percentColor = Color(200 - (percent * 100) * 2, percent * 100, 0, 255)

					surface.SetDrawColor(percentColor)
					surface.DrawRect(posXPanel, posYPanel, sizeX * percent, sizeY)
				end

			else

				local sizex, sizey = scrw / 1920 * 300, scrh / 1080 * 85

				staminaPanel = vgui.Create("DPanel")
				staminaPanel:SetPos(posX, posY)
				staminaPanel:SetSize(sizex, sizey)
				staminaPanel.Paint = function(s, w, h)
					curStamina = ply:TSGetStamina()
					maxStamina = ply:TSGetMaxStamina()

					local realSpeed = Diablos.TS:GetSpeedFromUnit(ply:GetRunSpeed())

					local percent = curStamina / maxStamina

					surface.SetDrawColor(Diablos.TS.Colors.CurLevelBox)
					surface.DrawRect(0, 0, w, h)

					draw.SimpleText(string.format("%s", Diablos.TS:GetLanguageString("runSpeed")), "Diablos:Font:TS:20:I", 5, 5, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
					draw.SimpleText(string.format("%4.2f %s", math.Round(realSpeed, 2), Diablos.TS:GetSpeedText()), "Diablos:Font:TS:20:B", w - 5, 5, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

					local sizeX = w - 10
					local sizeY = h * 0.35

					local posXPanel = 5
					local posYPanel = h - sizeY - 5


					local maxSpeedText = string.format("%s", Diablos.TS:GetLanguageString("timeMaxSpeed"))
					local fontToUse = "Diablos:Font:TS:20:I"
					surface.SetFont(fontToUse)
					local sizexSpeed = surface.GetTextSize(maxSpeedText)
					if sizexSpeed > w - 70 then
						fontToUse = "Diablos:Font:TS:15:I"
					end
					draw.SimpleText(maxSpeedText, fontToUse, 5, posYPanel - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
					draw.SimpleText(string.format("%u %s", ply:TSGetStaminaTimeDuration(), Diablos.TS:GetLanguageString("seconds")), "Diablos:Font:TS:20:B", w - 5, posYPanel - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)


					surface.SetDrawColor(Diablos.TS.Colors.StaminaBar)
					surface.DrawRect(posXPanel, posYPanel, sizeX, sizeY)

					local percentColor = Color(200 - (percent * 100) * 2, percent * 100, 0, 255)
					surface.SetDrawColor(percentColor)
					surface.DrawRect(posXPanel, posYPanel, sizeX * percent, sizeY)



					draw.SimpleText(string.format("%u%%", curStamina), "Diablos:Font:TS:30", posXPanel + sizeX - 5, posYPanel + sizeY / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				end
			end
		end
	end
end)

/* 
	Block the bind presses (for example moving forward, jumping, etc.) when you're doing a dumbbell training
	The only exception is the "Leave training" key that we don't want to prevent in case the user wants to stop the training 
*/

hook.Add("PlayerBindPress", "TPTSA:DisableBindDumbbellTraining", function (ply, bind, pressed, code)
	if ply.typeTraining == "strength" then
		local leaveBind = "+" .. Diablos.TS:GetBindReference(Diablos.TS.StopTrainingKey)
		if bind != leaveBind then
			return true
		end
	end
end)


local hide = {
	["CHudAmmo"] = true,
	["CHudBattery"] = true,
	["CHudChat"] = true,
	["CHudCrosshair"] = true,
	["CHudCloseCaption"] = true,
	["CHudDamageIndicator"] = true,
	["CHudDeathNotice"] = true,
	["CHudGeiger"] = true,
	["CHudGMod"] = false, -- Default gmod hud
	["CHudHealth"] = true,
	["CHudHintDisplay"] = true,
	["CHudMenu"] = false, -- Should still be able to open main menu/console
	["CHudMessage"] = true,
	["CHudPoisonDamageIndicator"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudSquadStatus"] = true,
	["CHudTrain"] = true,
	["CHudVehicle"] = true,
	["CHudWeapon"] = true,
	["CHudWeaponSelection"] = true,
	["CHudZoom"] = true,
	["NetGraph"] = true,
	["CHUDQuickInfo"] = true,
	["CHudSuitPower"] = true,
}

hook.Add( "HUDShouldDraw", "TPTSA:HideHUDElements", function( name )
	if ( hide[ name ] and LocalPlayer().typeTraining and LocalPlayer().typeTraining != "" ) then return false end
end )


/* Hook to create materials when you're on startup */

hook.Add("HUDPaint", "TPTSA:CreateMaterialsOnStartup", function()
	timer.Simple(5, function()
		Diablos.TS:GenerateMaterialsOnStartup()
	end)
	hook.Remove("HUDPaint", "TPTSA:CreateMaterialsOnStartup")
end)
--PATH addons/the_perfect_training_system/lua/diablos_training/client/cl_materials.lua:
/*---------------------------------------------------------------------------
    Generate the treadmill materials to have a "speed simulation"
	They go from 0 to 50 with a step of 5, this could be changed though.
---------------------------------------------------------------------------*/

function Diablos.TS:GenerateTreadmillMaterials()
	Diablos.TS.Materials["TreadmillMat"] = "Diablos:TS:Materials:Treadmill"

	for speed = 0, 50, 5 do
		speed = tostring(speed)

		CreateMaterial(Diablos.TS.Materials["TreadmillMat"] .. ":" .. speed, "VertexLitGeneric", {
				["$basetexture"] = "models/tptsa/treadmill/floor",
				["Proxies"] = {
					["AnimatedTexture"] =  {
						["animatedTextureVar"] = "$basetexture",
						["animatedTextureFrameNumVar"] = "$frame",
						["animatedTextureFrameRate"] = speed,
					}
				},
			}
		)
	end
end



/*---------------------------------------------------------------------------
	Returns if the logo should be taken online
	WARNING: this function returns false if the config file doesn't specify a logo at all,
	it doesn't mean the logo isn't online, as there is just no logo at all
---------------------------------------------------------------------------*/

function Diablos.TS:IsLogoOnline()
	return string.StartWith(Diablos.TS.IconLogo, "http")
end


/*---------------------------------------------------------------------------
    Call the functions to create the logo materials
	from local or online depending on the result of Diablos.TS:IsLogoOnline()
---------------------------------------------------------------------------*/

function Diablos.TS:GenerateLogoMaterials()
	if Diablos.TS.IconLogo != "" then
		if Diablos.TS:IsLogoOnline() then
			Diablos.TS:GenerateLogoOnline()
			Diablos.TS:DebugConsoleMsg(2, "Retrieving the logo via online...")
		else
			Diablos.TS:GenerateLogoLocal()
			Diablos.TS:DebugConsoleMsg(2, "Retrieving the logo via local...")
		end
	end
end

/*---------------------------------------------------------------------------
    Generate the logo material from the material "mat"
	The material mat is a material already created, from which we recover its name to create the materials we want to have:
	- Diablos.TS.Materials["PunchingLogo"]:
		* material to apply on the punching ball model, whose name is Diablos.TS.Materials["PunchingLogoName"]
	- Diablos.TS.Materials["GUILogo"]:
		* material to apply on the punching ball model, whose name is Diablos.TS.Materials["GUILogoName"]
---------------------------------------------------------------------------*/

function Diablos.TS:GenerateLogoMaterial(mat)

	if mat then

		Diablos.TS:DebugConsoleMsg(2, "Generating the logo " .. mat:GetName() .. "...")

		Diablos.TS.Materials["PunchingLogoName"] = "Diablos:TS:Materials:Punching:Icon"
		Diablos.TS.Materials["GUILogoName"] = "Diablos:TS:Materials:GUI:Icon"

		-- Logo for the punching ball (VertexLitGeneric)
		Diablos.TS.Materials["PunchingLogo"] = CreateMaterial(Diablos.TS.Materials["PunchingLogoName"], "VertexLitGeneric", {
				["$basetexture"] = mat:GetName(),
				["$translucent"] = 1,
				["$smooth"] = 1,
				["$model"] = 1,
			}
		)

		-- Logo for the GUI (UnlitGeneric)
		Diablos.TS.Materials["GUILogo"] = CreateMaterial(Diablos.TS.Materials["GUILogoName"], "UnlitGeneric", {
			["$basetexture"] = mat:GetName(),
			["$translucent"] = 1,
			["$smooth"] = 1,
		}
	)

	end
end


/*---------------------------------------------------------------------------
    Create the punching icon material local:
		- Use the basic Material() function (as the image is put in the server in local)
		- Call the Diablos.TS:GenerateLogoMaterial(mat) method
---------------------------------------------------------------------------*/

function Diablos.TS:GenerateLogoLocal()

	local punchingIcon = Material(Diablos.TS.IconLogo, "smooth")

	Diablos.TS:GenerateLogoMaterial(punchingIcon)

end

/*---------------------------------------------------------------------------
    Create the punching icon material online:
		- Creates a DHTML panel with a custom body to put the icon logo in background
			* Made to work for all image resolutions automatically (with background-size: contain)
		- Get the HTML material of that page by using a custom timer (because there could be some time for the DHTML to be prepared)
		- Call the Diablos.TS:GenerateLogoMaterial(mat) method
---------------------------------------------------------------------------*/

function Diablos.TS:GenerateLogoOnline()

	local htmlPanel = vgui.Create("DHTML")

	local htmlCode = [[
        <html>
            <head>
                <style>
                    body {
						background-image: url("]] .. Diablos.TS.IconLogo .. [[");
						background-position: center;
						background-size: contain;
						background-repeat: no-repeat;
                        background-attachment: fixed;
						overflow: hidden;
					}
                </style>
            </head>
            <body>
			</body>
        </html>
	]]

	htmlPanel:SetHTML(htmlCode)

	-- Hide the panel and the console messages

	htmlPanel:SetAlpha(0)
	htmlPanel:SetMouseInputEnabled(false)

	function htmlPanel:ConsoleMessage(msg) end

	local html_mat = htmlPanel:GetHTMLMaterial()

	local timerName = "TPTSA:GenerateMaterial:Icon:" .. LocalPlayer():SteamID64()

	-- We launch this until the html material is generated - if it's not generated after delay * repetitions then we forget about the generation
	timer.Create(timerName, 0.5, 10, function()
		if IsValid(htmlPanel) then
			html_mat = htmlPanel:GetHTMLMaterial()
			if html_mat then
				Diablos.TS:GenerateLogoMaterial(html_mat)

				timer.Remove(timerName)
			end
		else
			timer.Remove(timerName)
		end
	end)
end

/*---------------------------------------------------------------------------
    Generate materials on startup when a client is coming.
	This will generate:
		- Treadmill materials to have a "speed simulation"
		- Logo materials (if the setting is used by the server)
---------------------------------------------------------------------------*/

function Diablos.TS:GenerateMaterialsOnStartup()
	Diablos.TS:GenerateTreadmillMaterials() -- generate treadmill materials
	Diablos.TS:GenerateLogoMaterials() -- generate logo material
end
--PATH addons/the_perfect_training_system/lua/diablos_training/client/cl_net.lua:

/*---------------------------------------------------------------------------
	Notify someone
---------------------------------------------------------------------------*/

net.Receive("TPTSA:Notify", function(len, ply)
	local type = net.ReadUInt(3)
	local text = net.ReadString()
	notification.AddLegacy(text, type, 5)
end)

/*---------------------------------------------------------------------------
	Starting a training
	Arguments sent:
		- type of training
		- duration of the training
		- [optional] the amount of keys followed by the key numbers for the strength training
---------------------------------------------------------------------------*/

net.Receive("TPTSA:StartTraining", function(len, _)
	local ply = LocalPlayer()

	local typeTrainingInt = net.ReadUInt(2)
	local typeTraining = Diablos.TS:GetTrainingFromInteger(typeTrainingInt)

	local timeTraining = net.ReadUInt(8)

	local keyTableStrength = {}
	if typeTraining == "strength" then
		local nbKeys = net.ReadUInt(8)
		for i = 1, nbKeys do
			table.insert(keyTableStrength, net.ReadUInt(6))
		end
		ply.keyTable = keyTableStrength
	end

	Diablos.TS:StartTraining(ply, typeTraining, timeTraining)
end)

/*---------------------------------------------------------------------------
	A training has ended
	Arguments sent:
		- type of training
---------------------------------------------------------------------------*/

net.Receive("TPTSA:StopTraining", function(len, _)
	local ply = LocalPlayer()
	local typeTrainingInt = net.ReadUInt(2)
	local typeTraining = Diablos.TS:GetTrainingFromInteger(typeTrainingInt)

	Diablos.TS:StopTraining(ply, typeTraining)
end)

/*---------------------------------------------------------------------------
	Refresh clientside values when you're doing a training
	Arguments sent:
		- type of training
		- a refreshed value of your training, which is:
			* treadmill: the current speed
			* dumbbell: not used
			* punching ball: the amount of redpoints touched on the punching ball
---------------------------------------------------------------------------*/

net.Receive("TPTSA:RefreshTraining", function(len, _)
	local ply = LocalPlayer()
	local typeTrainingInt = net.ReadUInt(2)
	local typeTraining = Diablos.TS:GetTrainingFromInteger(typeTrainingInt)
	local newNumber = net.ReadUInt(8)

	Diablos.TS:RefreshTraining(ply, typeTraining, newNumber)
end)


/*---------------------------------------------------------------------------
	Update the animation for a specific player
	Used for the dumbbell when the player is training
---------------------------------------------------------------------------*/

net.Receive("TPTSA:UpdateAnimation", function(len, _)
	local plyAnim = net.ReadEntity()
	local isStarting = net.ReadBool()

	Diablos.TS:UpdateAnimation(plyAnim, isStarting)
end)

/*---------------------------------------------------------------------------
	Open a frame according to the machine you want to train for
	Arguments sent:
		- the entity to train for

	It isn't the type of entity (which would be a UInt(2)) because the treadmill has two type of exercices,
	and the user would need to choose which exercice he wants to do with this frame.
---------------------------------------------------------------------------*/

net.Receive("TPTSA:OpenTrainingExercicePanel", function(len, _)
	local ply = LocalPlayer()

	local ent = net.ReadEntity()
	if IsValid(ent) then
		local class = ent:GetClass()

		-- same condition for stamina and runningspeed at the moment
		if class == "diablos_treadmill" then
			Diablos.TS:OpenRunningPanel(ply, ent)
		elseif class == "diablos_dumbbell" then
			Diablos.TS:OpenDumbbellPanel(ply, ent)
		elseif class == "diablos_punching_base" or class == "diablos_punching_ball" then
			Diablos.TS:OpenPunchingPanel(ply, ent)
		end
	end

end)

/*---------------------------------------------------------------------------
	Called when the client spawn to update the Training table clientside 
---------------------------------------------------------------------------*/

net.Receive("TPTSA:UpdClientInfo", function(len, _)
	local ply = LocalPlayer()

	ply.Training = Diablos.TS:ReadTrainingInfo(ply)

	if Diablos.TS.DebugSupport then
		Diablos.TS:DebugConsoleMsg(2, "--- Beg Table Retrieve for Client ---")
		PrintTable(ply.Training)
		Diablos.TS:DebugConsoleMsg(2, "--- End Table Retrieve for Client ---")
	end

	if not ply:TSIsTrainingDataLaunched() then
		ply:TSTrainingDataLaunched()
	end

	ply:TSUpdateTrainings()
end)


/*---------------------------------------------------------------------------
	Broadcasted to everyone when someone:
	* spawns (and has training data so he has bigger bones)
	* changes his model
	* ended a training which changes the bones sizes
---------------------------------------------------------------------------*/

net.Receive("TPTSA:UpdClientBone", function(len, _)
	if not Diablos.TS.ChangeBones then return end

	local plyBone = net.ReadEntity()
	if not IsValid(plyBone) then return end

	local trainings = {}

	local amountOfTrainingsToUpdate = net.ReadUInt(2) + 1

	for i = 1, amountOfTrainingsToUpdate do
		local typeMuscleInt = net.ReadUInt(2)
		local typeMuscle = Diablos.TS:GetTrainingFromInteger(typeMuscleInt)
		local curLevel = net.ReadUInt(8)
		local forceReset = net.ReadBool()

		trainings[typeMuscle] = {level = curLevel, reset = forceReset}
	end

	Diablos.TS:RefreshBones(plyBone, trainings)
end)

/*---------------------------------------------------------------------------
	Update the default "run speed" value when changing team. Called when:
	* changing team

---------------------------------------------------------------------------*/


net.Receive("TPTSA:UpdateRunSpeedTeam", function(len, _)
	local ply = LocalPlayer()

	ply.TS_JOB_RUN_SPEED = net.ReadUInt(10)

	if Diablos.TS.DebugSupport then
		print("New speed client : ", ply.TS_JOB_RUN_SPEED)
	end
end)
--PATH addons/the_perfect_training_system/lua/diablos_training/shared/sh_hooks.lua:
/*---------------------------------------------------------------------------
    +USE key to give a credit to someone
---------------------------------------------------------------------------*/

hook.Add("KeyPress", "TPTSA:GiveBadgeCredit", function(ply, key)
    if key != IN_USE then return end
    local ent = ply:GetEyeTrace().Entity
    if not IsValid(ent) or not ent:IsPlayer() then return end
    if not ply:TSIsSportCoach() then return end
    if CLIENT then return end
    if ent:TSHasTrainingSubscription() then
        Diablos.TS:Notify(ply, 1, Diablos.TS:GetLanguageString("cardReaderGiveAlreadySubscribed"))
        return
    end
    if ent:TSGetBadgeCredit() == 1 then
        Diablos.TS:Notify(ply, 1, Diablos.TS:GetLanguageString("cardReaderGiveAlreadyCredit"))
        return
    end
    net.Start("TPTSA:CardReaderGive")
        net.WriteEntity(ent)
    net.Send(ply)
end)

/*---------------------------------------------------------------------------
    Avoid showing and decreasing stamina if the player is in a no-clip state
---------------------------------------------------------------------------*/

hook.Add("PlayerNoClip", "TPTSA:DontShowStamina", function(ply, desiredState)
    ply.StaminaNoClip = desiredState
end)


/*---------------------------------------------------------------------------
    Avoid taking 
        * turnstile button/trigger
        * the "treadmill floor" because you only need to take the treadmill entity, not its subcomponent
---------------------------------------------------------------------------*/

hook.Add("PhysgunPickup", "TPTSA:DontPickupTurnstile", function(ply, ent)
    local class = ent:GetClass()
    if class == "diablos_turnstile_button" or class == "diablos_turnstile_trigger" then
        return false
    else
        if IsValid(ent.treadmill) then
            return false
        end
    end
end)



--PATH addons/warning_system/lua/warning_system_7452/client/nets.lua:
WarningSystem7452em:NetReceive("sync_settings", function(tConfig)
    WarningSystem7452em.CFG = WarningSystem7452em.CFG or {}

    if( tConfig.key ) then
        WarningSystem7452em.CFG[tConfig.key] = tConfig.value

        if not WarningSystem7452em.CMenuOkay and WarningSystem7452em.CFG.permissions then
            if WarningSystem7452em:Can(LocalPlayer(), "add_warn") or WarningSystem7452em:Can(LocalPlayer(), "view_others_warnings") then
                WarningSystem7452em:InitContextMenu()
            end
        end
    else
        WarningSystem7452em.CFG = tConfig.value
    end
end)

WarningSystem7452em:NetReceive("open_menu", function()
    WarningSystem7452em:OpenMenu()
end)

WarningSystem7452em:NetReceive("WarningSystem7452em:Player:GetInfo", function(tInfo)
    if( tInfo.target ~= "null" ) then
        WarningSystem7452em.Users[tInfo.target] = WarningSystem7452em.Users[tInfo.target] or {}

        if( tInfo.type == "warnings" ) then
            WarningSystem7452em.Users[tInfo.target].warnings = tInfo.result
            hook.Run("WarningSystem7452em:Player:InfoReceived", "warnings")
        end

        if( tInfo.type == "note" ) then
            WarningSystem7452em.Users[tInfo.target].note = tInfo.result
            hook.Run("WarningSystem7452em:Player:InfoReceived", "note")
        end

        for k,v in pairs(tInfo.results or {}) do
            WarningSystem7452em.Users[tInfo.target][k] = v
        end
    end

    if( tInfo.type == "fetch_penalty_points" ) then
        WarningSystem7452em.PenaltyPoints = tInfo.result
    end

    if( tInfo.type == "settings" ) then
        WarningSystem7452em.CFG = tInfo.result
    end

    if( tInfo.type == "stats" ) then
        WarningSystem7452em.Stats = tInfo.result
    end

    if IsValid(WarningSystem7452em.Menu) then
        WarningSystem7452em.Menu:StopLoading()
    end
end)

WarningSystem7452em:NetReceive("WarningSystem7452em:Player:Notify", function(tInfo)
    WarningSystem7452em:Notify(tInfo.iType, tInfo.msg, tInfo.iLength)
end)
--PATH addons/sl_utils/lua/advdupe2/cl_ghost.lua:
function AdvDupe2.LoadGhosts(dupe, info, moreinfo, name, preview)
	AdvDupe2.RemoveGhosts()
	AdvDupe2.Ghosting = true
	AdvDupe2.GhostToSpawn = {}
	local count = 0
	local time, desc, date, creator

	if(info.ad1) then
		local z = dupe.HeadEnt.Z
		local Pos, Ang

		time    = moreinfo.Time    or ""
		desc    = info.Description or ""
		date    = info.Date        or ""
		creator = info.Creator     or ""

		AdvDupe2.HeadEnt = dupe.HeadEnt.Index
		AdvDupe2.HeadPos = dupe.HeadEnt.Pos
		AdvDupe2.HeadZPos = z
		AdvDupe2.HeadPos.Z = AdvDupe2.HeadPos.Z + z

		for k, v in pairs(dupe.Entities) do
			if(v.SavedParentIdx) then
				if(not v.BuildDupeInfo) then v.BuildDupeInfo = {} end
				v.BuildDupeInfo.DupeParentID = v.SavedParentIdx
				Pos = v.LocalPos
				Ang = v.LocalAngle
			else
				Pos, Ang = nil, nil
			end

			for i, p in pairs(v.PhysicsObjects) do
				p.Pos        = Pos or p.LocalPos
				p.Pos.Z      = p.Pos.Z - z
				p.Angle      = Ang or p.LocalAngle
				p.LocalPos   = nil
				p.LocalAngle = nil
			end

			v.LocalPos = nil
			v.LocalAngle = nil
			AdvDupe2.GhostToSpawn[count] =
			{
				Model          = v.Model,
				PhysicsObjects = v.PhysicsObjects
			}

			if(AdvDupe2.HeadEnt == k) then
				AdvDupe2.HeadEnt = count
			end

			count = count + 1
		end

		AdvDupe2.HeadOffset = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos
		AdvDupe2.HeadAngle  = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle
	else
		time    = info.time        or ""
		desc    = dupe.Description or ""
		date    = info.date        or ""
		creator = info.name        or ""

		AdvDupe2.HeadEnt    = dupe.HeadEnt.Index
		AdvDupe2.HeadZPos   = dupe.HeadEnt.Z
		AdvDupe2.HeadPos    = dupe.HeadEnt.Pos
		AdvDupe2.HeadOffset = dupe.Entities[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos
		AdvDupe2.HeadAngle  = dupe.Entities[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle

		for k, v in pairs(dupe.Entities) do
			AdvDupe2.GhostToSpawn[count] =
			{
				Model          = v.Model,
				PhysicsObjects = v.PhysicsObjects
			}

			if(AdvDupe2.HeadEnt == k) then
				AdvDupe2.HeadEnt = count
			end

			count = count + 1
		end
	end

	if(not preview) then
		AdvDupe2.Info.File:SetText("File: "..name)
		AdvDupe2.Info.Creator:SetText("Creator: "..creator)
		AdvDupe2.Info.Date:SetText("Date: "..date)
		AdvDupe2.Info.Time:SetText("Time: "..time)
		AdvDupe2.Info.Size:SetText("Size: "..string.NiceSize(tonumber(info.size) or 0))
		AdvDupe2.Info.Desc:SetText("Desc: "..(desc or ""))
		AdvDupe2.Info.Entities:SetText("Entities: "..table.Count(dupe.Entities))
		AdvDupe2.Info.Constraints:SetText("Constraints: "..table.Count(dupe.Constraints))
	end

	AdvDupe2.StartGhosting()
	AdvDupe2.Preview = preview
end

function AdvDupe2.RemoveGhosts()
	if(AdvDupe2.Ghosting) then
		hook.Remove("Tick", "AdvDupe2_SpawnGhosts")
		AdvDupe2.Ghosting = false

		if(not AdvDupe2.BusyBar) then
			AdvDupe2.RemoveProgressBar()
		end
	end

	if(AdvDupe2.GhostEntities) then
		for k, v in pairs(AdvDupe2.GhostEntities) do
			if(IsValid(v))then
				v:Remove()
			end
		end
	end

	if(IsValid(AdvDupe2.HeadGhost))then
		AdvDupe2.HeadGhost:Remove()
	end

	AdvDupe2.CurrentGhost  = 1
	AdvDupe2.HeadGhost     = nil
	AdvDupe2.GhostEntities = nil
	AdvDupe2.Preview       = false
end

--Creates a ghost from the given entity's table
local function MakeGhostsFromTable(EntTable)

	if(not EntTable) then return end
	if(not EntTable.Model or EntTable.Model:sub(-4,-1) ~= ".mdl") then
		EntTable.Model = "models/error.mdl"
	end

	local GhostEntity = ClientsideModel(EntTable.Model, RENDERGROUP_TRANSLUCENT)

	-- If there are too many entities we might not spawn..
	if not IsValid(GhostEntity) then
		AdvDupe2.RemoveGhosts()
		AdvDupe2.Notify("Too many entities to spawn ghosts!", NOTIFY_ERROR)
		return
	end

	GhostEntity:SetRenderMode( RENDERMODE_TRANSALPHA )	--Was broken, making ghosts invisible
	GhostEntity:SetColor( Color(255, 255, 255, 150) )
	GhostEntity.Phys = EntTable.PhysicsObjects[0]

	if util.IsValidRagdoll(EntTable.Model) then
		local ref, parents, angs = {}, {}, {}

		GhostEntity:SetupBones()
		for k, v in pairs(EntTable.PhysicsObjects) do
			local bone = GhostEntity:TranslatePhysBoneToBone(k)
			local bonp = GhostEntity:GetBoneParent(bone)
			if bonp == -1 then
				ref[bone] = GhostEntity:GetBoneMatrix(bone):GetInverseTR()
			else
				bonp = GhostEntity:TranslatePhysBoneToBone(GhostEntity:TranslateBoneToPhysBone(bonp))
				parents[bone] = bonp
				ref[bone] = GhostEntity:GetBoneMatrix(bone):GetInverseTR() * GhostEntity:GetBoneMatrix(bonp)
			end

			local m = Matrix() m:SetAngles(v.Angle)
			angs[bone] = m
		end

		for bone, ang in pairs( angs ) do
			if parents[bone] and angs[parents[bone]] then
				local localrotation = angs[parents[bone]]:GetInverseTR() * ang
				local m = ref[bone] * localrotation
				GhostEntity:ManipulateBoneAngles(bone, m:GetAngles())
			else
				local pos = GhostEntity:GetBonePosition(bone)
				GhostEntity:ManipulateBonePosition(bone, -pos)
				GhostEntity:ManipulateBoneAngles(bone, ref[bone]:GetAngles())
			end
		end
	end

	return GhostEntity
end

local function SpawnGhosts()

	if AdvDupe2.CurrentGhost == AdvDupe2.HeadEnt then AdvDupe2.CurrentGhost = AdvDupe2.CurrentGhost + 1 end

	local g = AdvDupe2.GhostToSpawn[AdvDupe2.CurrentGhost]
	if g and AdvDupe2.CurrentGhost / AdvDupe2.TotalGhosts * 100 <= GetConVar("advdupe2_limit_ghost"):GetFloat() then
		AdvDupe2.GhostEntities[AdvDupe2.CurrentGhost] = MakeGhostsFromTable(g)
		if(not AdvDupe2.BusyBar) then
			AdvDupe2.ProgressBar.Percent = AdvDupe2.CurrentGhost / AdvDupe2.TotalGhosts * 100
		end

		AdvDupe2.CurrentGhost = AdvDupe2.CurrentGhost + 1
		AdvDupe2.UpdateGhosts(true)
	else
		AdvDupe2.Ghosting = false
		hook.Remove("Tick", "AdvDupe2_SpawnGhosts")

		if(not AdvDupe2.BusyBar) then
			AdvDupe2.RemoveProgressBar()
		end
	end
end

net.Receive("AdvDupe2_SendGhosts", 	function(len, ply, len2)
	AdvDupe2.RemoveGhosts()
	AdvDupe2.GhostToSpawn = {}
	AdvDupe2.HeadEnt  = net.ReadInt(16)
	AdvDupe2.HeadZPos = net.ReadFloat()
	AdvDupe2.HeadPos  = net.ReadVector()

	local cache = {}
	for i = 1, net.ReadInt(16) do
		cache[i] = net.ReadString()
	end

	for i = 1, net.ReadInt(16) do
		AdvDupe2.GhostToSpawn[i] =
		{
			Model = cache[net.ReadInt(16)],
			PhysicsObjects = {}
		}

		for k = 0, net.ReadInt(8) do
			AdvDupe2.GhostToSpawn[i].PhysicsObjects[k] =
			{
				Angle = net.ReadAngle(),
				Pos   = net.ReadVector()
			}
		end
	end

	AdvDupe2.CurrentGhost  = 1
	AdvDupe2.GhostEntities = {}
	AdvDupe2.HeadGhost     = MakeGhostsFromTable(AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt])
	AdvDupe2.HeadOffset    = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos
	AdvDupe2.HeadAngle     = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle
	AdvDupe2.GhostEntities[AdvDupe2.HeadEnt] = AdvDupe2.HeadGhost
	AdvDupe2.TotalGhosts   = #AdvDupe2.GhostToSpawn

	if(AdvDupe2.TotalGhosts > 1) then
		AdvDupe2.Ghosting = true

		if(not AdvDupe2.BusyBar) then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
		end

		hook.Add("Tick", "AdvDupe2_SpawnGhosts", SpawnGhosts)
	else
		AdvDupe2.Ghosting = false
	end
end)

net.Receive("AdvDupe2_AddGhost", function(len, ply, len2)
	local ghost = {Model = net.ReadString(), PhysicsObjects = {}}
	for k = 0, net.ReadInt(8) do
		ghost.PhysicsObjects[k] = {Angle = net.ReadAngle(), Pos = net.ReadVector()}
	end

	AdvDupe2.GhostEntities[AdvDupe2.CurrentGhost] = MakeGhostsFromTable(ghost)
	AdvDupe2.CurrentGhost = AdvDupe2.CurrentGhost + 1
end)

function AdvDupe2.StartGhosting()
	AdvDupe2.RemoveGhosts()
	if(not AdvDupe2.GhostToSpawn) then return end
	AdvDupe2.CurrentGhost  = 1
	AdvDupe2.GhostEntities = {}
	AdvDupe2.Ghosting      = true
	AdvDupe2.HeadGhost     = MakeGhostsFromTable(AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt])
	AdvDupe2.GhostEntities[AdvDupe2.HeadEnt] = AdvDupe2.HeadGhost
	AdvDupe2.TotalGhosts   = #AdvDupe2.GhostToSpawn

	if AdvDupe2.TotalGhosts > 1 then
		if not AdvDupe2.BusyBar then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
		end
		hook.Add("Tick", "AdvDupe2_SpawnGhosts", SpawnGhosts)
	else
		AdvDupe2.Ghosting = false
	end
end
net.Receive("AdvDupe2_StartGhosting", function()
	AdvDupe2.StartGhosting()
end)

net.Receive("AdvDupe2_RemoveGhosts", AdvDupe2.RemoveGhosts)

--Update the ghost's postion and angles based on where the player is looking and the offsets
local Lheadpos, Lheadang = Vector(), Angle()
function AdvDupe2.UpdateGhosts(force)
	if not IsValid(AdvDupe2.HeadGhost) then
		AdvDupe2.RemoveGhosts()
		AdvDupe2.Notify("Invalid ghost parent!", NOTIFY_ERROR)
		return
	end

	local trace = LocalPlayer():GetEyeTrace()
	if (not trace.Hit) then return end

	local originpos, originang, headpos, headang
	local worigin = GetConVar("advdupe2_offset_world"):GetBool()
	if(GetConVar("advdupe2_original_origin"):GetBool())then
		originang  = Angle()
		originpos  = Vector(AdvDupe2.HeadPos)
		headpos = AdvDupe2.HeadPos + AdvDupe2.HeadOffset
		headang = AdvDupe2.HeadAngle
	else
		local hangle = worigin and Angle(0,0,0) or AdvDupe2.HeadAngle
		local pz = math.Clamp(AdvDupe2.HeadZPos + GetConVar("advdupe2_offset_z"):GetFloat() or 0, -16000, 16000)
		local ap = math.Clamp(GetConVar("advdupe2_offset_pitch"):GetFloat() or 0, -180, 180)
		local ay = math.Clamp(GetConVar("advdupe2_offset_yaw"  ):GetFloat() or 0, -180, 180)
		local ar = math.Clamp(GetConVar("advdupe2_offset_roll" ):GetFloat() or 0, -180, 180)
		originang = Angle(ap, ay, ar)
		originpos = Vector(trace.HitPos); originpos.z = originpos.z + pz
		headpos, headang = LocalToWorld(AdvDupe2.HeadOffset, hangle, originpos, originang)
	end

	if math.abs(Lheadpos.x - headpos.x) > 0.01 or
	   math.abs(Lheadpos.y - headpos.y) > 0.01 or
	   math.abs(Lheadpos.z - headpos.z) > 0.01 or
	   math.abs(Lheadang.p - headang.p) > 0.01 or
	   math.abs(Lheadang.y - headang.y) > 0.01 or
	   math.abs(Lheadang.r - headang.r) > 0.01 or force then

		Lheadpos = headpos
		Lheadang = headang

		AdvDupe2.HeadGhost:SetPos(headpos)
		AdvDupe2.HeadGhost:SetAngles(headang)

		for k, ghost in ipairs(AdvDupe2.GhostEntities) do
			local phys = ghost.Phys
			local pos, ang = LocalToWorld(phys.Pos, phys.Angle, originpos, originang)
			ghost:SetPos(pos)
			ghost:SetAngles(ang)
		end

	end
end

--PATH lua/bricks_server/languages/bricks_server/turkish.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "turkish", {
    ["search"] = "Ara",
    ["invalidPlayerProfile"] = "Geçersiz oyuncu profili aratıldı!",
    ["unbound"] = "SERBEST",
    ["themes"] = "TEMALAR",
    ["groups"] = "GrUPLAR",
    ["general"] = "Genel",
    ["itemWhitelisting"] = "Eşya Beyaz Listeleme",
    ["rarities"] = "Enderlikler",
    ["languages"] = "Diller",
    ["disabled"] = "Deaktif",
    ["enabled"] = "Aktif",
    ["purchase"] = "Satın Al",
    ["profile"] = "Profil",
    ["view"] = "Görüntüle",
    ["admin"] = "Admin",
    ["noToolPermission"] = "Bu aleti kullanmaya yetkiniz yok.",
    ["settings"] = "Ayarlar",
    ["players"] = "Oyuncular",
    ["modules"] = "Modüller",

    ["userGroupEditor"] = "Kullanıcı Grup Düzenleyicisi",
    ["addNewGroup"] = "Yeni grup ekle",
    ["newUserGroup"] = "Yeni kullanıcı grubu ne olsun?",
    ["groupName"] = "GrupAdı",

    ["custom"] = "Özel",
    ["addNew"] = "Yeni ekle",
    ["material"] = "Materyal",
    ["directImage"] = "Aşağıya resim URL'si yerleştirin.",
    ["default"] = "Varsayılan",
    ["selectMaterial"] = "Bir materyal seçmen lazım!",

    ["errorNoText"] = "HATA: METİN YOK",
    ["selectOption"] = "Bir ayar seçin",
    ["selectValue"] = "Bir değer seçin.",
    ["selectColor"] = "Bir renk seçin.",
    ["configSaved"] = "Konfig kaydedildi!",
    ["cmdNoPermission"] = "Bu komutu kullanmaya iznin yok.",
    ["entityPosUpdated"] = "Varlık pozisyonları kaydedildi.",
    ["noEntitiesSpawned"] = "Kaydedilmiş hiçbir varlık çıkartılmadı.",
    ["xEntitiesSpawned"] = "%d çıkartılan varlıkları kaydetti.",
    ["error"] = "Hata",

    ["seconds"] = "%d saniye",
    ["second"] = "%d saniye",
    ["minutes"] = "%d dakika",
    ["minute"] = "%d dakika",
    ["hours"] = "%d saat",
    ["hour"] = "%d saat",

    ["noRarity"] = "Nadir değil",

    ["config"] = "Konfig",
    ["edit"] = "Düzenle",
    ["editColor"] = "Rengi Düzenle",
    ["editName"] = "İsim Düzenle",
    ["remove"] = "Kaldır",
    ["name"] = "İsim",
    ["description"] = "Açıklama",
    ["model"] = "Model",
    ["icon"] = "İkon",
    ["type"] = "Tür",
    ["price"] = "Ücret",
    ["group"] = "Grup",
    ["category"] = "Kategori",
    ["color"] = "Renk",
    ["invalidType"] = "Geçersiz tür.",
    ["invalidOption"] = "Geçersiz ayar.",
    ["invalidChoice"] = "Geçersiz seçenek.",
    ["invalidGroup"] = "Geçersiz grup.",
    ["invalidPlayer"] = "Geçersiz oyuncu.",
    ["true"] = "DOĞRU",
    ["false"] = "YANLIŞ",
    ["noDescription"] = "Açıklama bulunmamakta",
    ["other"] = "Diğer",
    ["completed"] = "Tamamlandı",
    ["close"] = "Kapat",
    ["main"] = "Ana Sayfa",
    
    ["valueQuery"] = "%s ne olmalı?",
    ["dataValueQuery"] = "Bu hangi veri olmalı?",
    ["newNameQuery"] = "Yeni isim ne olsun?",
    ["newDescriptionQuery"] = "Yeni açıklama ne olsun?",
    ["newModelQuery"] = "Yeni model ne olsun?",
    ["newIconQuery"] = "Yeni ikon ne olsun?",
    ["newColorQuery"] = "Yeni renk ne olsun?",
    ["npcTypeQuery"] = "Bu NPC ne tür olsn?",
    ["newTypeQuery"] = "Yeni tür ne olsun",
    ["groupRequirementQuery"] = "Grup gereksinimleri ne olsun?",
    ["levelRequirementQuery"] = "Seviye gereksinimleri ne olsun?",
    ["newPriceQuery"] = "Yeni ücreti ne olsun?",
    ["newCategoryQuery"] = "Yeni kategori ne olsun?",
    ["npcType"] = "NPC Türü",

    ["npcEditor"] = "NPC Düzenleyicisi",
    ["addNPC"] = "NPC Ekle",
    ["newNPC"] = "Yeni NPC",

    ["ok"] = "TAMAM",
    ["cancel"] = "İptal",
    ["save"] = "Kaydet",
    ["confirm"] = "Onayla",
    ["nil"] = "NIL",
    ["none"] = "Yok",
    ["selected"] = "Seçilmiş",
    ["unselected"] = "Seçilmemiş",
    ["add"] = "Ekle",

    ["shootyStick"] = "Bir sopa!",
    ["permanent"] = "Kalıcı",
    ["tierX"] = "(Aşama %d)",
    ["someDescription"] = "Açıklama.",
    ["invalidNPC"] = "BRICKS SUNUCU HATASI: Geçersiz NPC",

    ["disconnected"] = "Bağlantı Kesildi",
    ["profileView"] = "Profili Görüntüle",
    ["loading"] = "Yükleniyor",
    ["statistics"] = "İstatistikler",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Bağışçı Rütbesi",
    ["staffRank"] = "Yetkili Rütbesi",
    ["currentJob"] = "Şu anki Meslek",
    ["wallet"] = "Cüzdan",
    ["level"] = "Seviye",
    ["levelX"] = "Seviye %d",
    ["experience"] = "Tecrübe",
    ["exp"] = "TP",
    ["money"] = "Para",
    ["playerLogs"] = "Oyuncu Kayıtları",
    ["deleteLogs"] = "Kayıtları sil",
    ["xLogs"] = "%d'nın kayıtları",
    ["xAdminGroups"] = "%d Admin Grupları",
    ["noUserGroups"] = "Hiçbir kullanıcı grubu bulunamadı",
    ["userGroups"] = "Kullanıcı Grubu: %s",
    ["editUserGroups"] = "Kullanıcı Kruplarını Düzenle",
    ["newGroupColor"] = "Yeni grup rengi ne olsun?",
    ["newGroupName"] = "Yeni grup ismi ne olsun?",
    ["groupAlreadyExists"] = "Bu grup zaten bulunmakta!",
    ["whitelist"] = "Beyaz Liste",
    ["unWhitelist"] = "Beyaz Listeden Çıkar",
    ["addCustom"] = "Özel Ekle",
    ["entClassWhitelist"] = "Hangi varlık sınıfını beyaz listeye almak istiyorsun?",
    ["entClassAlreadyOnList"] = "Bu valrık sınıfı zaten beyaz listede!",
    ["changesServerRestart"] = "Sunucu tekrardan başlatılıncaya kadar değişimler uygulanmayacak!",
    ["comingSoon"] = "Çok Yakında!",
    ["features"] = "OZELLIKLER",
    ["addNewRarity"] = "Yeni bir enderlik ekle",
    ["newRarity"] = "Yeni Enderlik",
    ["needToAddRarity"] = "İlk başta enderlik türü eklemen lazım!",
    ["whatRarityItem"] = "Bu eşya hangi enderlikte olsun?",
    ["invalidRarity"] = "Geçersiz Enderlik.",
    ["rarityAlreadyExists"] = "Bu isime sahip bir enderlik bulunmakta!",
    ["themeColorX"] = "Tema - Renk %d",
    ["themeTextColor"] = "Tema - Yazı Rengi",
    ["presetAccents"] = "Önceden Ayarlanmış Aksanlar",
    ["presetBackgrounds"] = "Önceden Ayarlanmış Arka Planlar",
    ["resetToBaseThemes"] = "Ana temaları sıfırla",
    ["resetToCurrentThemes"] = "Şimdiki temaları sıfırla",
    ["toggle"] = "Toggle",
    ["menu"] = "Menü",
    ["emptyValue"] = "BOŞ DEĞER",
    ["newValueQuery"] = "Yeni değer ne olsun?",
    ["pressKey"] = "BİR TUŞA BAS",

    ["entityPlacer"] = "Varlık Yerleştiricisi",
    ["invalidEntityType"] = "Geçersiz varlık türü, aletler menüsünden geçerli bir tür seç.",
    ["entityPlaced"] = "Varlık başarıyla yerleştirildi.",
    ["entityRemoved"] = "Varlık başarıyla kaldırıldı.",
    ["canOnlyUseToolEntity"] = "Bu alet sadece bir varlığı kaldırıp/oluşturmak için kullanabilirsin.",
    ["entityType"] = "Varlık Türü",
    ["entityPlacerDescription"] = "Sunucuya varlık yerleştirip kaldırmanı sağlar. Sol Tık - yerleştir. Sağ Tık - kaldır.",
    ["entityPlacerDescriptionSmall"] = "Varlıkları yerleştirip kaldırır",
    ["entityPlacerInstructions"] = "Sol Tık - yerleştir, Sağ Tık - kaldır.",

    ["npcPlacer"] = "NPC Yerleştiricisi",
    ["npcPlaced"] = "NPC başarıyla yerleştirildi.",
    ["invalidNPCType"] = "Geçersiz NPC türü, aletler menüsünden geçerli bir alet seçin.",
    ["npcRemoved"] = "NPC kaldırıldı.",
    ["errorNotNPC"] = "Bu aleti sadece NPC kaldırıp/oluşturmanı sağlar.",
    ["npcPlacerDescription"] = "PSunucudan NPC kaldırıp yerleştirmeni sağlar, Sol Tık - yerleştir, Sağ Tık - kaldır.",
    ["npcPlacerDescriptionSmall"] = "Sunucudan NPC kaldırıp eklemeni sağlar.",

    ["inventory"] = "Envanter",
    ["player"] = "Oyuncu",
    ["drop"] = "Bırak",
    ["use"] = "Kullan",
    ["dropAll"] = "Hepsini Bırak",
    ["delete"] = "Kaldır",
} )
--PATH lua/bricks_server/vgui/bricks_server_circle_avatar.lua:
local PANEL = {}

function PANEL:Init()
	self.avatar = vgui.Create( "AvatarImage", self )
	self.avatar:SetPaintedManually( true )
end

function PANEL:PerformLayout()
	self.avatar:SetSize( self:GetWide(), self:GetTall() )
end

function PANEL:SetPlayer( ply, size )
	self.avatar:SetPlayer( ply, size )
end

function PANEL:SetSteamID( steamID, size )
	self.avatar:SetSteamID( steamID, size )
end

function PANEL:Paint( w, h )
	render.ClearStencil()
	render.SetStencilEnable( true )

	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )

	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_ZERO )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilReferenceValue( 1 )

	draw.NoTexture()
	surface.SetDrawColor( Color( 0, 0, 0, 255 ) )
    BRICKS_SERVER.Func.DrawCircle( w/2, h/2, h/2, w/2 )

	render.SetStencilFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilReferenceValue( 1 )

	self.avatar:PaintManual()

	render.SetStencilEnable( false )
	render.ClearStencil()
end
 
vgui.Register( "bricks_server_circle_avatar", PANEL )
--PATH lua/bricks_server/vgui/bricks_server_config_itemwhitelist.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    function self.RefreshPanel()
        self:Clear()

        self.slots = nil
        if( self.grid and IsValid( self.grid ) ) then
            self.grid:Remove()
        end

        local entitySearchBarBack = vgui.Create( "DPanel", self )
        entitySearchBarBack:Dock( TOP )
        entitySearchBarBack:DockMargin( 0, 0, 0, 5 )
        entitySearchBarBack:SetTall( 40 )
        local search = Material( "materials/bricks_server/search.png" )
        local Alpha = 0
        local Alpha2 = 20
        local color1 = BRICKS_SERVER.Func.GetTheme( 2 )
        local entitySearchBar
        entitySearchBarBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
    
            if( entitySearchBar:IsEditing() ) then
                Alpha = math.Clamp( Alpha+5, 0, 100 )
                Alpha2 = math.Clamp( Alpha2+20, 20, 255 )
            else
                Alpha = math.Clamp( Alpha-5, 0, 100 )
                Alpha2 = math.Clamp( Alpha2-20, 20, 255 )
            end
            
            draw.RoundedBox( 5, 0, 0, w, h, Color( color1.r, color1.g, color1.b, Alpha ) )
        
            surface.SetDrawColor( 255, 255, 255, Alpha2 )
            surface.SetMaterial(search)
            local size = 24
            surface.DrawTexturedRect( w-size-(h-size)/2, (h-size)/2, size, size )
        end
    
        entitySearchBar = vgui.Create( "bricks_server_search", entitySearchBarBack )
        entitySearchBar:Dock( FILL )
        
        local entitySpacing = 5
        local gridWide = (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20
        local wantedSlotSize = 125*(ScrW()/2560)
        local slotsWide = math.floor( gridWide/wantedSlotSize )
    
        local slotSize = (gridWide-((slotsWide-1)*entitySpacing))/slotsWide
    
        local entityGrid = vgui.Create( "DIconLayout", self )
        entityGrid:Dock( TOP )
        entityGrid:SetSpaceY( entitySpacing )
        entityGrid:SetSpaceX( entitySpacing )
        entityGrid:SetTall( slotSize )

        local function CreateSlot( header, text, doClick, key )
            entityGrid.slots = (entityGrid.slots or 0)+1
            local slots = entityGrid.slots
            local slotsTall = math.ceil( slots/slotsWide )
            local newTall = (slotsTall*slotSize)+((slotsTall-1)*entitySpacing)
            if( entityGrid:GetTall() != newTall ) then
                entityGrid:SetTall( newTall )
            end

            local slotBack = entityGrid:Add( "DButton" )
            slotBack:SetSize( slotSize, slotSize )
            slotBack:SetText( "" )
            local changeAlpha = 0
            local x, y, w, h = 0, 0, slotSize, slotSize
            slotBack.Paint = function( self2, w, h )
                local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )
                if( x != toScreenX or y != toScreenY ) then
                    x, y = toScreenX, toScreenY
                end

                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                if( key and BS_ConfigCopyTable.INVENTORY.Whitelist[key] ) then
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
                end
                
                if( self2:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 175 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 100 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 100 )
                end

                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                surface.SetAlphaMultiplier( 1 )

                draw.SimpleText( header, "BRICKS_SERVER_Font17B", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
                draw.SimpleText( text, "BRICKS_SERVER_Font17", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
            end
            slotBack.DoClick = function( self2 )
                doClick( self2, x, y, w, h )
            end
        end

        function self.FillEntityList()
            entityGrid:Clear()

            if( not BS_ConfigCopyTable.INVENTORY.Whitelist ) then
                BS_ConfigCopyTable.INVENTORY.Whitelist = {}
            end

            entityGrid.slots = 1

            for k, v in pairs( list.Get( "SpawnableEntities" ) ) do
                if( (entitySearchBar:GetValue() or "") != "" and not string.find( string.lower( v.PrintName or "" ), string.lower( entitySearchBar:GetValue() or "" ) ) and not string.find( string.lower( k ), string.lower( entitySearchBar:GetValue() or "" ) ) ) then
                    continue
                end

                local actions = {}
                if( not BS_ConfigCopyTable.INVENTORY.Whitelist[k] ) then
                    actions[BRICKS_SERVER.Func.L( "whitelist" )] = function() 
                        BS_ConfigCopyTable.INVENTORY.Whitelist[k] = { true, true }
                        self.FillEntityList()
                        BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                    end
                else
                    actions[BRICKS_SERVER.Func.L( "unWhitelist" )] = function() 
                        BS_ConfigCopyTable.INVENTORY.Whitelist[k] = nil
                        self.FillEntityList()
                        BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                    end
                end

                CreateSlot( (v.PrintName or BRICKS_SERVER.Func.L( "nil" )), k, function( slotBack, x, y, w, h )
                    slotBack.Menu = vgui.Create( "bricks_server_dmenu" )
                    for key, val in pairs( actions ) do
                        slotBack.Menu:AddOption( key, val )
                    end
                    slotBack.Menu:Open()
                    slotBack.Menu:SetPos( x+w+5, y+(h/2)-(slotBack.Menu:GetTall()/2) )
                end, k )
            end

            for k, v in pairs( BS_ConfigCopyTable.INVENTORY.Whitelist ) do
                if( list.Get( "SpawnableEntities" )[k] ) then continue end

                if( (entitySearchBar:GetValue() or "") != "" and not string.find( string.lower( k ), string.lower( entitySearchBar:GetValue() or "" ) ) ) then
                    continue
                end

                local actions = {}
                actions[BRICKS_SERVER.Func.L( "remove" )] = function() 
                    BS_ConfigCopyTable.INVENTORY.Whitelist[k] = nil
                    self.FillEntityList()
                    BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                end

                CreateSlot( BRICKS_SERVER.Func.L( "custom" ), k, function( slotBack, x, y, w, h )
                    slotBack.Menu = vgui.Create( "bricks_server_dmenu" )
                    for key, val in pairs( actions ) do
                        slotBack.Menu:AddOption( key, val )
                    end
                    slotBack.Menu:Open()
                    slotBack.Menu:SetPos( x+w+5, y+(h/2)-(slotBack.Menu:GetTall()/2) )
                end, k )
            end

            local addNewButton = entityGrid:Add( "DButton" )
            addNewButton:SetText( "" )
            addNewButton:SetSize( slotSize, slotSize )
            local changeAlpha = 0
            local newMat = Material( "materials/bricks_server/add_64.png")
            addNewButton.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                
                if( self2:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 175 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 100 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 100 )
                end

                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
                surface.SetAlphaMultiplier( 1 )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
                surface.SetMaterial( newMat )
                local iconSize = 64
                surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )

                draw.SimpleText( BRICKS_SERVER.Func.L( "addCustom" ), "BRICKS_SERVER_Font17", w/2, h-10, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
            end
            addNewButton.DoClick = function()
                BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "entClassWhitelist" ), "", function( text ) 
                    if( list.Get( "SpawnableEntities" )[text] ) then
                        notification.AddLegacy( BRICKS_SERVER.Func.L( "entClassAlreadyOnList" ), 1, 5 )
                        return
                    end

                    BS_ConfigCopyTable.INVENTORY.Whitelist[text] = { true, true }
                    self.FillEntityList()
                    BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
            end
        end
        self.FillEntityList()

        entitySearchBar.OnChange = function()
            self.FillEntityList()
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_itemwhitelist", PANEL, "bricks_server_scrollpanel" )
--PATH lua/bricks_server/vgui/bricks_server_dframe.lua:
local PANEL = {}

function PANEL:Init()
    self:MakePopup()
    self:SetTitle( "" )
    self:SetDraggable( false )
    self:ShowCloseButton( false )
    self.headerHeight = 40
    self:DockPadding( 0, self.headerHeight, 0, 0 )

    self.removeOnClose = true
    self:CreateCloseButton()
end

function PANEL:CloseFrame()
    if( self.onCloseFunc ) then
        self.onCloseFunc()
    end

    if( self.removeOnClose or BRS_REMOVEONCLOSE ) then
        self:Remove()
    else
        self:SetVisible( false )
    end
end

function PANEL:CreateCloseButton()
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
        self:CloseFrame()
    end
end

function PANEL:OnSizeChanged( newW, newH )
    self:CreateCloseButton()

    if( self.centerOnSizeChanged ) then
        self:Center()
    end
end

function PANEL:SetHeader( header )
    self.header = header
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

vgui.Register( "bricks_server_dframe", PANEL, "DFrame" )
--PATH lua/bricks_server/vgui/bricks_server_dmenu.lua:

local PANEL = {}

AccessorFunc( PANEL, "m_bBorder",			"DrawBorder" )
AccessorFunc( PANEL, "m_bDeleteSelf",		"DeleteSelf" )
AccessorFunc( PANEL, "m_iMinimumWidth",		"MinimumWidth" )
AccessorFunc( PANEL, "m_bDrawColumn",		"DrawColumn" )
AccessorFunc( PANEL, "m_iMaxHeight",		"MaxHeight" )

AccessorFunc( PANEL, "m_pOpenSubMenu",		"OpenSubMenu" )

function PANEL:Init()

	self:SetIsMenu( true )
	self:SetDrawBorder( true )
	self:SetPaintBackground( true )
	self:SetMinimumWidth( 150 )
	self:SetDrawOnTop( true )
	self:SetMaxHeight( ScrH() * 0.9 )
	self:SetDeleteSelf( true )

	self:SetPadding( 0 )

	-- Automatically remove this panel when menus are to be closed
	RegisterDermaMenuForClose( self )

end

function PANEL:AddPanel( pnl )

	self:AddItem( pnl )
	pnl.ParentMenu = self

end

function PANEL:AddOption( strText, funcFunction, extraData )
	self.optionCount = (self.optionCount or 0)+1

	local pnl = vgui.Create( "bricks_server_dmenuoption", self )
	pnl:SetMenu( self )
	pnl:SetText( "" )
	pnl.label = strText
	pnl.position = self.optionCount
	pnl.parentPanel = self
	if ( funcFunction ) then 
		pnl.DoClick = function()
			funcFunction( extraData )
		end
	end

	self:AddPanel( pnl )

	return pnl

end

function PANEL:AddCVar( strText, convar, on, off, funcFunction )

	local pnl = vgui.Create( "bricks_server_dmenuoptioncvar", self )
	pnl:SetMenu( self )
	pnl:SetText( strText )
	if ( funcFunction ) then pnl.DoClick = funcFunction end

	pnl:SetConVar( convar )
	pnl:SetValueOn( on )
	pnl:SetValueOff( off )

	self:AddPanel( pnl )

	return pnl

end

function PANEL:AddSpacer( strText, funcFunction )

	local pnl = vgui.Create( "DPanel", self )
	pnl.Paint = function( p, w, h )
		derma.SkinHook( "Paint", "MenuSpacer", p, w, h )
	end

	pnl:SetTall( 1 )
	self:AddPanel( pnl )

	return pnl

end

function PANEL:AddSubMenu( strText, funcFunction )

	local pnl = vgui.Create( "bricks_server_dmenuoption", self )
	local SubMenu = pnl:AddSubMenu( strText, funcFunction )

	pnl:SetText( strText )
	if ( funcFunction ) then pnl.DoClick = funcFunction end

	self:AddPanel( pnl )

	return SubMenu, pnl

end

function PANEL:Hide()

	local openmenu = self:GetOpenSubMenu()
	if ( openmenu ) then
		openmenu:Hide()
	end

	self:SetVisible( false )
	self:SetOpenSubMenu( nil )

end

function PANEL:OpenSubMenu( item, menu )

	-- Do we already have a menu open?
	local openmenu = self:GetOpenSubMenu()
	if ( IsValid( openmenu ) && openmenu:IsVisible() ) then

		-- Don't open it again!
		if ( menu && openmenu == menu ) then return end

		-- Close it!
		self:CloseSubMenu( openmenu )

	end

	if ( !IsValid( menu ) ) then return end

	local x, y = item:LocalToScreen( self:GetWide(), 0 )
	menu:Open( x - 3, y, false, item )

	self:SetOpenSubMenu( menu )

end

function PANEL:CloseSubMenu( menu )

	menu:Hide()
	self:SetOpenSubMenu( nil )

end

function PANEL:Paint( w, h )

	if ( !self:GetPaintBackground() ) then return end

	if( not self.dontRoundTop and not self.dontRoundBottom ) then
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
	else
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ), (not self.dontRoundTop), (not self.dontRoundTop), (not self.dontRoundBottom), (not self.dontRoundBottom) )
	end
	return true

end

function PANEL:ChildCount()
	return #self:GetCanvas():GetChildren()
end

function PANEL:GetChild( num )
	return self:GetCanvas():GetChildren()[ num ]
end

function PANEL:PerformLayout()

	local w = self:GetMinimumWidth()

	-- Find the widest one
	for k, pnl in pairs( self:GetCanvas():GetChildren() ) do

		pnl:PerformLayout()
		w = math.max( w, pnl:GetWide() )

	end

	self:SetWide( w )

	local y = 0 -- for padding

	for k, pnl in pairs( self:GetCanvas():GetChildren() ) do

		pnl:SetWide( w )
		pnl:SetPos( 0, y )
		pnl:InvalidateLayout( true )

		y = y + pnl:GetTall()

	end

	y = math.min( y, self:GetMaxHeight() )

	self:SetTall( y )

	derma.SkinHook( "Layout", "Menu", self )

	DScrollPanel.PerformLayout( self )

end

--[[---------------------------------------------------------
	Open - Opens the menu.
	x and y are optional, if they're not provided the menu
		will appear at the cursor.
-----------------------------------------------------------]]
function PANEL:Open( x, y, skipanimation, ownerpanel )
	if( IsValid( BRS_TOOLTIP ) ) then
		BRS_TOOLTIP:Remove()
	end

	RegisterDermaMenuForClose( self )

	local maunal = x && y

	x = x or gui.MouseX()
	y = y or gui.MouseY()

	local OwnerHeight = 0
	local OwnerWidth = 0

	if ( ownerpanel ) then
		OwnerWidth, OwnerHeight = ownerpanel:GetSize()
	end

	self:PerformLayout()

	local w = self:GetWide()
	local h = self:GetTall()

	self:SetSize( w, h )

	if ( y + h > ScrH() ) then y = ( ( maunal && ScrH() ) or ( y + OwnerHeight ) ) - h end
	if ( x + w > ScrW() ) then x = ( ( maunal && ScrW() ) or x ) - w end
	if ( y < 1 ) then y = 1 end
	if ( x < 1 ) then x = 1 end

	self:SetPos( x, y )

	-- Popup!
	self:MakePopup()

	-- Make sure it's visible!
	self:SetVisible( true )

	-- Keep the mouse active while the menu is visible.
	self:SetKeyboardInputEnabled( false )

end

--
-- Called by bricks_server_dmenuoption
--
function PANEL:OptionSelectedInternal( option )

	self:OptionSelected( option, option:GetText() )

end

function PANEL:OptionSelected( option, text )

	-- For override

end

function PANEL:ClearHighlights()

	for k, pnl in pairs( self:GetCanvas():GetChildren() ) do
		pnl.Highlight = nil
	end

end

function PANEL:HighlightItem( item )

	for k, pnl in pairs( self:GetCanvas():GetChildren() ) do
		if ( pnl == item ) then
			pnl.Highlight = true
		end
	end

end

derma.DefineControl( "bricks_server_dmenu", "A Menu", PANEL, "bricks_server_scrollpanel" )

--PATH lua/bricks_server/vgui/bricks_server_settings.lua:
local PANEL = {}

function PANEL:FillSettings()
    self:Clear()

    for k, v in pairs( BRICKS_SERVER.BASECLIENTCONFIG ) do
        local type = v[2] or ""
        if( type == "string" or type == "number" or type == "bind" or type == "bool" ) then
            local displayValue = BRICKS_SERVER.Func.GetClientConfig( k ) or BRICKS_SERVER.Func.L( "emptyValue" )
            if( type == "bind" and BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] ) then
                displayValue = string.upper( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] )
            elseif( type == "bool" ) then
                displayValue = string.upper( tostring( BRICKS_SERVER.Func.GetClientConfig( k ) or false ) )
            end

            local variableBack = vgui.Create( "DPanel", self )
            variableBack:Dock( TOP )
            variableBack:DockMargin( 0, 0, 0, 5 )
            variableBack:SetTall( 65 )
            variableBack:DockPadding( 0, 0, 30, 0 )
            variableBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                draw.SimpleText( v[1] or k, "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( displayValue, "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
            end

            local variableAction = vgui.Create( "DButton", variableBack )
            variableAction:SetPos( 0, 0 )
            variableAction:SetSize( (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20, variableBack:GetTall() )
            variableAction:SetText( "" )
            local changeAlpha = 0
            variableAction.Paint = function( self2, w, h ) 
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
            variableAction.DoClick = function( self2 )
                if( type == "bind" ) then
                    self2:RequestFocus()
                    displayValue = BRICKS_SERVER.Func.L( "pressKey" )
                elseif( type == "bool" ) then
                    BRICKS_SERVER.Func.ChangeClientConfig( k, not (BRICKS_SERVER.Func.GetClientConfig( k ) or false) )
                    self:FillSettings()
                elseif( type == "number" ) then
                    BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newValueQuery" ), BRICKS_SERVER.Func.GetClientConfig( k ) or 0, function( number ) 
                        BRICKS_SERVER.Func.ChangeClientConfig( k, number )
                        self:FillSettings()
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
                elseif( type == "string" ) then
                    BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newValueQuery" ), BRICKS_SERVER.Func.GetClientConfig( k ) or "", function( text ) 
                        BRICKS_SERVER.Func.ChangeClientConfig( k, text )
                        self:FillSettings()
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end
            end

            if( type == "bind" ) then
                variableAction.OnKeyCodeReleased = function( self, text )
                    BRICKS_SERVER.Func.ChangeClientConfig( k, text )
                    self:FocusNext()
                    displayValue = BRICKS_SERVER.Func.GetClientConfig( k ) or BRICKS_SERVER.Func.L( "emptyValue" )
                    if( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] ) then
                        displayValue = string.upper( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] )
                    end
                end
            end
        end
    end
end

function PANEL:Init()
    self:FillSettings()
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_settings", PANEL, "bricks_server_scrollpanel" )
--PATH lua/bricks_server/vgui/bricks_server_url.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:LoadURL( url, wide )
    if( self.openedURL ) then return end

    self:OpenURL( url )

    self.openedURL = true
    

    local button = vgui.Create( "DButton", self )
    button:SetSize( 36, 36 )
    button:SetPos( wide-5-36, 5 )
    button:SetText( "" )
    local changeAlpha = 95
    local webMat = Material( "materials/bricks_server/web.png" )
    button.Paint = function( self3, w, h )
        if( self3:IsDown() ) then
            changeAlpha = math.Clamp( changeAlpha+10, 95, 255 )
        elseif( self3:IsHovered() ) then
            changeAlpha = math.Clamp( changeAlpha+10, 95, 165 )
        else
            changeAlpha = math.Clamp( changeAlpha-10, 95, 165 )
        end

        surface.SetAlphaMultiplier( changeAlpha/255 )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.SetAlphaMultiplier( 1 )

        surface.SetMaterial( webMat )
        local size = 24
        surface.SetDrawColor( 0, 0, 0, 255 )
        surface.DrawTexturedRect( (h-size)/2-1, (h-size)/2+1, size, size )

        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.DrawTexturedRect( (h-size)/2, (h-size)/2, size, size )
    end
    button.DoClick = function()
        gui.OpenURL( url )
    end
end

local loadingIcon = Material( "materials/bricks_server/loading.png" )
function PANEL:Paint( w, h )
    surface.SetDrawColor( 255, 255, 255, 255 )
    surface.SetMaterial( loadingIcon )
    local size = 32
    surface.DrawTexturedRectRotated( w/2, h/2, size, size, -(CurTime() % 360 * 250) )

    draw.SimpleText( BRICKS_SERVER.Func.L( "loading" ), "BRICKS_SERVER_Font20", w/2, h/2+(size/2)+5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
end

vgui.Register( "bricks_server_url", PANEL, "DHTML" )
--PATH lua/bricks_server/modules/default/submodules/currencies/shared/sh_currency_system.lua:
local playerMeta = FindMetaTable("Player")

function playerMeta:GetCurrencies()
    if( CLIENT and self == LocalPlayer() ) then
        return BRS_CURRENCIES
    else
        return self.BRS_CURRENCIES or {}
    end
end

function playerMeta:GetCurrency( currency )
	if( not BRICKS_SERVER.CONFIG.CURRENCIES[currency] ) then return 0 end

    return self:GetCurrencies()[currency] or 0
end

concommand.Add( "addcurrency", function( ply, cmd, args )
    if( CLIENT ) then
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then 
			print( "BRICKS SERVER ERROR: NO ACCESS" )
			return 
		end

		if( args[1] and args[2] and args[3] and isstring( args[1] ) and isnumber( tonumber( args[2] ) ) and isnumber( tonumber( args[3] ) ) ) then
			net.Start( "BRS.Net.Admin_AddCurrency" )
				net.WriteString( args[1] )
				net.WriteUInt( tonumber( args[2] ), 8 )
				net.WriteInt( tonumber( args[3] ), 32 )
			net.SendToServer()
		end
    elseif( SERVER ) then
        local steamid64 = args[1]
        local currencyType = tonumber( args[2] or 0 )
        local amount = tonumber( args[3] or 0 )
        if( (not IsValid( ply ) or BRICKS_SERVER.Func.HasAdminAccess( ply )) and steamid64 and currencyType and amount ) then
            if( not BRICKS_SERVER.CONFIG.CURRENCIES[currencyType] ) then return end
        
            local victim = player.GetBySteamID64( steamid64 )
        
            if( not IsValid( victim ) ) then return end
        
            victim:AddCurrency( currencyType, amount )

            if( IsValid( ply ) ) then
				BRICKS_SERVER.Func.SendNotification( ply, 1, 5, "Gave " .. victim:Nick() .. " " .. string.Comma( amount ) .. " " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") )
            end

			BRICKS_SERVER.Func.SendNotification( victim, 1, 5, "An admin has gave you " .. string.Comma( amount ) .. " " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") )
        end
	end
end )

concommand.Add( "setcurrency", function( ply, cmd, args )
    if( CLIENT ) then
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then 
			print( "BRICKS SERVER ERROR: NO ACCESS" )
			return 
		end

		if( args[1] and args[2] and args[3] and isstring( args[1] ) and isnumber( tonumber( args[2] ) ) and isnumber( tonumber( args[3] ) ) ) then
			net.Start( "BRS.Net.Admin_SetCurrency" )
				net.WriteString( args[1] )
				net.WriteUInt( tonumber( args[2] ), 8 )
				net.WriteInt( tonumber( args[3] ), 32 )
			net.SendToServer()
		end
    elseif( SERVER ) then
        local steamid64 = args[1]
        local currencyType = tonumber( args[2] or 0 )
        local amount = tonumber( args[3] or 0 )
        if( (not IsValid( ply ) or BRICKS_SERVER.Func.HasAdminAccess( ply )) and steamid64 and currencyType and amount ) then
            if( not BRICKS_SERVER.CONFIG.CURRENCIES[currencyType] ) then return end
        
            local victim = player.GetBySteamID64( steamid64 )
        
            if( not IsValid( victim ) ) then return end
        
            victim:SetCurrency( currencyType, amount )

            if( IsValid( ply ) ) then
				BRICKS_SERVER.Func.SendNotification( ply, 1, 5, "Set " .. victim:Nick() .. "'s " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") .. " to " .. string.Comma( amount ) )
            end

			BRICKS_SERVER.Func.SendNotification( victim, 1, 5, "An admin has set your " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") .. " to " .. string.Comma( amount ) )
        end
	end
end )

function BRICKS_SERVER.LoadCurrencies()
	BRICKS_SERVER.DEVCONFIG.Currencies = BRICKS_SERVER.DEVCONFIG.Currencies or {}

	for k, v in pairs( BRICKS_SERVER.CONFIG.CURRENCIES or {} ) do
		BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k] = {
			Title = v.Name,
			getFunction = function( ply )
				return ply:GetCurrency( k )
			end,
			addFunction = function( ply, amount )
				ply:AddCurrency( k, amount )
			end,
			formatFunction = function( amount )
				if( v.Prefix ) then
					return v.Prefix .. string.Comma( amount or 0 )
				elseif( v.Suffix ) then
					return string.Comma( amount or 0 ) .. " " .. v.Suffix
				else
					return string.Comma( amount or 0 )
				end
			end
		}
	end
end
BRICKS_SERVER.LoadCurrencies()
--PATH addons/sl_utils/lua/autorun/client/cl_hitdamagenumbers.lua:
local indicators  = {}
local initialized = false
local lastcurtime = 0
local on          = true

local debugger = {}
debugger.enabled     = false
debugger.tickms      = 0
debugger.renderms    = 0
debugger.ticktimer   = 0
debugger.rendertimer = 0
debugger.count       = 0

local indicatorColors = {}

local CRIT_MODE = {}
CRIT_MODE.NONE                = 0
CRIT_MODE.DMG_ONLY            = 1
CRIT_MODE.CRIT_ONLY           = 2
CRIT_MODE.CRITICAL_ONLY       = 3
CRIT_MODE.CRIT_AND_DMG        = 4
CRIT_MODE.CRITICAL_AND_DMG    = 5
CRIT_MODE.CRIT_AND_DMG_EX     = 6
CRIT_MODE.CRITICAL_AND_DMG_EX = 7


local function invlerp(min, max, p)
--	if max-min == 0 then return 0 end
	return (p - min) / (max - min)
end


local ANIMATION_FUNC = {}
ANIMATION_FUNC[1] = function(p)
	if p <= 0.2 then
		local x = invlerp(0, 0.2, p)
		return x*3*0.25 + 0.25
	else
		local x = invlerp(0.2, 1, p)
		return ((-x + 1) / 2) + 0.5
	end
end
ANIMATION_FUNC[2] = function(p)
	if p <= 0.2 then
		local x = invlerp(0, 0.2, p)
		return x*3*0.25 + 0.25
	else
		return 1
	end
end
ANIMATION_FUNC[3] = function(p)
	return 1-p
end


-- Debug mode, shows performance.
CreateConVar( "hitnums_debugmode", 0 )
cvars.AddChangeCallback( "hitnums_debugmode", function()
	debugger.enabled = GetConVarNumber("hitnums_debugmode") ~= 0
end )


-- Client-side Hit Numbers show/hide concommand.
concommand.Add( "hitnums_toggle", function()
	
	if not GetGlobalBool("HDN_AllowUserToggle") then
		LocalPlayer():PrintMessage( HUD_PRINTTALK, "You do not have permission to hide the Hit Numbers indicators." )
		MsgN("You do not have permission to hide the Hit Numbers indicators. (Server convar 'sv_hitnums_allowusertoggle' is disabled)")
		return
	end
	
	on = not on
	
	if on then
		LocalPlayer():PrintMessage( HUD_PRINTTALK, "Damage indicators enabled." )
	else
		LocalPlayer():PrintMessage( HUD_PRINTTALK, "Damage indicators disabled." )
		table.Empty(indicators)
	end
	
end )


-- Build colour table from server-set colours.
local function buildColourTable()
	
	local col = GetGlobalInt("HDN_Col_Gen", 16770770)
	indicatorColors.gen = Color(bit.band(bit.rshift(col, 16), 255), bit.band(bit.rshift(col, 8), 255), bit.band(col, 255))
	
	col = GetGlobalInt("HDN_Col_Crit", 16721960)
	indicatorColors.crit = Color(bit.band(bit.rshift(col, 16), 255), bit.band(bit.rshift(col, 8), 255), bit.band(col, 255))
	
	col = GetGlobalInt("HDN_Col_Fire", 16742400)
	indicatorColors.fire = Color(bit.band(bit.rshift(col, 16), 255), bit.band(bit.rshift(col, 8), 255), bit.band(col, 255))
	
	col = GetGlobalInt("HDN_Col_Expl", 15790130)
	indicatorColors.expl = Color(bit.band(bit.rshift(col, 16), 255), bit.band(bit.rshift(col, 8), 255), bit.band(col, 255))
	
	col = GetGlobalInt("HDN_Col_Acid", 9240395)
	indicatorColors.acid = Color(bit.band(bit.rshift(col, 16), 255), bit.band(bit.rshift(col, 8), 255), bit.band(col, 255))
	
	col = GetGlobalInt("HDN_Col_Elec", 6594815)
	indicatorColors.elec = Color(bit.band(bit.rshift(col, 16), 255), bit.band(bit.rshift(col, 8), 255), bit.band(col, 255))
	
end
net.Receive( "hdn_refreshColours", function()
	timer.Simple(1.0, buildColourTable) -- Delay to allow Globals to sync.
end )


local function spawnIndicator(text, col, pos, vel, ttl)
	
	if not initialized then return end
	
	local ind = {}
	
	ind.text = text
	ind.pos  = Vector(pos.x, pos.y, pos.z)
	ind.vel  = Vector(vel.x, vel.y, vel.z)
	ind.col  = Color(col.r, col.g, col.b)
	
	ind.ttl       = ttl
	ind.life      = ttl
	ind.spawntime = CurTime()
	
	surface.SetFont("font_HDN_Inds")
	local w, h = surface.GetTextSize(text)
	
	ind.widthH  = w/2
	ind.heightH = h/2
	
	table.insert(indicators, ind)
	
end


local function populateSettingsPlayer(panel)
	
	if GetGlobalBool("HDN_AllowUserToggle") then
		
		panel:AddControl("Button", {
			Label   = "Toggle Hit Numbers",
			Command = "hitnums_toggle",
		})
		
	end
	
end


-- Set up hit numbers.
net.Receive( "hdn_initPly", function()
	
	surface.CreateFont( "font_HDN_Inds", {
		font 		= net.ReadString(),
		size 		= net.ReadUInt(32),
		weight 		= net.ReadUInt(32),
		blursize 	= 0,
		scanlines 	= 0,
		antialias 	= false,
		underline 	= (net.ReadBit()~=0),
		italic 		= (net.ReadBit()~=0),
		strikeout 	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= (net.ReadBit()~=0),
		additive 	= (net.ReadBit()~=0),
		outline 	= (net.ReadBit()~=0)
	} )
	
	buildColourTable()
	
	initialized = true
	
end )


net.Receive( "hdn_forceToggleOn", function()
	
	on = true
	
end )


-- Called when an indicator should be created for this player.
net.Receive( "hdn_spawn", function()
	
	if not on then return end
	
	-- Get damage type and amount.
	local dmg     = net.ReadFloat()
	local dmgtype = net.ReadUInt(32)
	
	if dmg < 1 then
		dmg = math.Round(dmg, 3)
	else
		dmg = math.floor(dmg)
	end
	
	-- Get "critical hit" bit.
	local crit = (net.ReadBit() ~= 0)
	
	-- Retrieve position and force of the damage.
	local pos   = net.ReadVector()
	local force = net.ReadVector() * GetGlobalFloat("HDN_ForceInheritance", 1.0)
	
	-- Set colour of indicator based on damage type (or critical hit).
	local col = indicatorColors.gen
	
	local ttl      = GetGlobalFloat("HDN_TTL", 1.0)
	local showsign = GetGlobalBool("HDN_ShowSign", true)
	local critmode = GetGlobalInt("HDN_CritMode", CRIT_MODE.CRITICAL_AND_DMG_EX) -- See "Critical indicator mode" in sv_hitdamagenumbers.lua
	
	local fxmin, fxmax = GetGlobalFloat("HDN_ForceOffset_XMin", -0.5), GetGlobalFloat("HDN_ForceOffset_XMax", 0.5)
	local fymin, fymax = GetGlobalFloat("HDN_ForceOffset_YMin", -0.5), GetGlobalFloat("HDN_ForceOffset_YMax", 0.5)
	local fzmin, fzmax = GetGlobalFloat("HDN_ForceOffset_ZMin", 0.75), GetGlobalFloat("HDN_ForceOffset_ZMax", 1.0)
	
	-- Is critical text indicator.
	if crit and critmode >= CRIT_MODE.CRIT_ONLY then
		
		local txt
		
		if critmode == CRIT_MODE.CRIT_ONLY or critmode == CRIT_MODE.CRIT_AND_DMG_EX then
			
			txt = "Crit!"
			
		elseif critmode == CRIT_MODE.CRITICAL_ONLY or critmode >= CRIT_MODE.CRITICAL_AND_DMG_EX then
			
			txt = "Critical!"
			
		elseif critmode == CRIT_MODE.CRIT_AND_DMG then
			
			txt = "Crit " .. ( showsign and tostring(-dmg) or tostring(math.abs(dmg)) )
			
		elseif critmode == CRIT_MODE.CRITICAL_AND_DMG then
			
			txt = "Critical " .. ( showsign and tostring(-dmg) or tostring(math.abs(dmg)) )
			
		else
			
			txt = "?"
			
		end
		
		spawnIndicator(txt, indicatorColors.crit, pos, force + Vector(math.Rand(fxmin, fxmax), math.Rand(fymin, fymax), math.Rand(fzmin, fzmax) * 1.5), ttl)
		
	end
	
	-- Regular number indicator.
	if not crit or critmode == CRIT_MODE.NONE or critmode == CRIT_MODE.DMG_ONLY or critmode == CRIT_MODE.CRIT_AND_DMG_EX or critmode >= CRIT_MODE.CRITICAL_AND_DMG_EX then
		
		local txt = ( showsign and tostring(-dmg) or tostring(math.abs(dmg)) )
		
		if crit and critmode == 1 then
			
			col = indicatorColors.crit
			
		else
			
			if bit.band(dmgtype, bit.bor(DMG_BURN, DMG_SLOWBURN, DMG_PLASMA)) != 0 then
				
				-- Fire damage.
				col = indicatorColors.fire
				
			elseif bit.band(dmgtype, bit.bor(DMG_BLAST, DMG_BLAST_SURFACE)) != 0 then
				
				-- Explosive damage.
				col = indicatorColors.expl
				
			elseif bit.band(dmgtype, bit.bor(DMG_ACID, DMG_POISON, DMG_RADIATION, DMG_NERVEGAS)) != 0 then
				
				-- Acidic damage.
				col = indicatorColors.acid
				
			elseif bit.band(dmgtype, bit.bor(DMG_DISSOLVE, DMG_ENERGYBEAM, DMG_SHOCK)) != 0 then
				
				-- Electrical damage.
				col = indicatorColors.elec
				
			end
			
		end
		
		spawnIndicator(txt, col, pos, force + Vector(math.Rand(fxmin, fxmax), math.Rand(fymin, fymax), math.Rand(fzmin, fzmax) * 1.5), ttl)
		
	end
	
end )


-- Update indicators.
hook.Add( "Tick", "hdn_updateInds", function()

	if not on then return end
	if debugger.enabled then debugger.ticktimer = SysTime() end
	
	local curtime = CurTime()
	local dt      = curtime - lastcurtime
	lastcurtime   = curtime
	
	if #indicators == 0 then return end
	
	local gravity = GetGlobalFloat("HDN_Gravity", 1.0) * 0.05
	
	-- Update hit texts.
	local ind
	for i=1, #indicators do
		ind       = indicators[i]
		ind.life  = ind.life - dt
	--  ind.vel.z = math.Min(ind.vel.z - 0.05, 2)
		ind.vel.z = ind.vel.z - gravity
		ind.pos   = ind.pos + ind.vel
	end
	
	-- Check for and remove expired hit texts.
	local i = 1
	while i <= #indicators do
		if indicators[i].life < 0 then
			table.remove(indicators, i)
		else
			i = i + 1
		end
	end
	
	-- Update debugging info.
	if debugger.enabled then
		debugger.count = #indicators
		debugger.tickms = (SysTime() - debugger.ticktimer) * 1000
	end
	
end )


-- Render the 3D indicators.
hook.Add( "PostDrawTranslucentRenderables", "hdn_drawInds", function()
	
	if not on then return end
	if not initialized then return end
	if #indicators == 0 then return end
	if debugger.enabled then debugger.rendertimer = SysTime() end
	
	-- Indicators to always face the player.
	local observer = (LocalPlayer():GetViewEntity() or LocalPlayer())
	local ang = observer:EyeAngles()
	ang:RotateAroundAxis( ang:Forward(), 90 )
	ang:RotateAroundAxis( ang:Right(), 90 )
	ang = Angle( 0, ang.y, ang.r )
	
	local scale = GetGlobalFloat("HDN_Scale", 0.3)
	local alphamul = GetGlobalFloat("HDN_AlphaMul", 1) * 255
	local fanimation = ANIMATION_FUNC[GetGlobalInt("HDN_Animation", 0)]
	
	-- Is this even necessary to do anymore?
	local cam_Start3D2D        = cam.Start3D2D
	local cam_End3D2D          = cam.End3D2D
	local surface_SetTextColor = surface.SetTextColor
	local surface_SetTextPos   = surface.SetTextPos
	local surface_DrawText     = surface.DrawText
	
	-- Render above everything.
	local ignorez = GetGlobalBool("HDN_IgnoreZ", false)
	if ignorez then
		cam.IgnoreZ(true)
	end
	
	surface.SetFont("font_HDN_Inds")
	
	-- Render each indicator.
	local ind
	for i=1, #indicators do
		ind = indicators[i]
		cam_Start3D2D(ind.pos, ang, scale * ((fanimation ~= nil) and fanimation((CurTime() - ind.spawntime) / ind.ttl) or 1))
			surface_SetTextColor(ind.col.r, ind.col.g, ind.col.b, (ind.life / ind.ttl * alphamul))
			surface_SetTextPos(-ind.widthH, -ind.heightH)
			surface_DrawText(ind.text)
		cam_End3D2D()
	end
	
	-- Reset depth ignorance.
	if ignorez then
		cam.IgnoreZ(false)
	end
	
	if debugger.enabled then
		debugger.renderms = (SysTime() - debugger.rendertimer) * 1000
	end
	
end )


hook.Add( "HUDPaint", "hdn_debugHUD", function()
	
	if not on then return end
	if not debugger.enabled then return end
	
	local hudx, hudy = 10, 10
	
	local tickcol = color_white
	local rendercol = color_white
	
	for k,v in pairs({debugger.tickms, debugger.renderms}) do
		if v > 1.0 then
			if k == 1 then tickcol = Color(255,0,0,255)
			else rendercol = Color(255,0,0,255) end
		elseif v > 0.5 then
			if k == 1 then tickcol = Color(255,255,0,255)
			else rendercol = Color(255,255,0,255) end
		elseif v > 0.1 then
			if k == 1 then tickcol = Color(0,255,0,255)
			else rendercol = Color(0,255,0,255) end
		else
			if k == 1 then tickcol = Color(0,255,255,255)
			else rendercol = Color(0,255,255,255) end
		end
	end
	
	draw.RoundedBox(4, hudx, hudy, 128, 58, Color(0, 0, 0, 200))
	draw.Text({
		text = "HITNUMBERS - DEBUG",
		pos  = { hudx + 4, hudy + 4}
	})
	draw.Text({
		text = "Count " .. debugger.count,
		pos  = { hudx + 4, hudy + 20}
	})
	draw.Text({
		text  = "Tick " .. math.Round(debugger.tickms, 3) .. " ms",
		pos   = { hudx + 4, hudy + 30},
		color = tickcol
	})
	draw.Text({
		text  = "Render " .. math.Round(debugger.renderms, 3) .. " ms",
		pos   = { hudx + 4, hudy + 40},
		color = rendercol
	})
	
	debugger.tickms   = 0
	debugger.renderms = 0
	
end )


-- Spawn Menu settings for Sandbox gamemodes.
hook.Add("PopulateToolMenu", "hdn_spawnMenu", function()
	
	spawnmenu.AddToolMenuOption("Utilities", "Hit Numbers", "hdn_playerSpawnMenuSettings", "Player", "", "", populateSettingsPlayer)
	
end)


MsgN("-- Hit Numbers loaded --")
--PATH addons/newera_reroll/lua/autorun/client/cl_seefox_reroll_rang.lua:
local mats = {
    ["background"] = Material("seefox/newera/reroll/background_rank.png"),
    ["rank_1"] = Material("seefox/newera/reroll/rank_e.png"),
    ["rank_2"] = Material("seefox/newera/reroll/rank_d.png"),
    ["rank_3"] = Material("seefox/newera/reroll/rank_c.png"),
    ["rank_4"] = Material("seefox/newera/reroll/rank_b.png"),
    ["rank_5"] = Material("seefox/newera/reroll/rank_a.png"),
    ["rank_6"] = Material("seefox/newera/reroll/rank_s.png"),
}

local colors = {
    ["white"] = Color(255, 255, 255),
    ["black"] = Color(0, 0, 0),
    ["rank_e"] = Color(60, 91, 17),
    ["rank_d"] = Color(38, 73, 116),
    ["rank_c"] = Color(0, 29, 75),
    ["rank_b"] = Color(156, 0, 255),
    ["rank_a"] = Color(253, 156, 22),
    ["rank_s"] = Color(93, 0, 0),
}

local rankIds = {
    ["e"] = 1,
    ["d"] = 2,
    ["c"] = 3,
    ["b"] = 4,
    ["a"] = 5,
    ["s"] = 6
}

function Seefox_Reroll:Menu2()
    if IsValid(Seefox_Reroll.Panel2) then Seefox_Reroll.Panel2:Remove() end

    local black = vgui.Create("EditablePanel")
    black:SetSize(ScrW(), ScrH())
    black:MakePopup()
    black.Paint = function(_, w, h)
        surface.SetDrawColor(color_black)
        surface.DrawRect(0, 0, w, h)
    end

    local panel = vgui.Create("EditablePanel", black)
    panel:Dock(FILL)
    panel:SetAlpha(0)
    panel:AlphaTo(255, 0.2)
    panel.rank = LocalPlayer():GetNWString("Rang", "Aucune"):lower()
    if panel.rank == "aucune" then
        panel.rank = nil
    end
    panel.Paint = function(_, w, h)
        surface.SetDrawColor(color_white)
        surface.SetMaterial(mats["background"])
        surface.DrawTexturedRect(0, 0, w, h)

        draw.SimpleText(LocalPlayer():GetPoints("rang").." REROLLS RESTANTS", self:Font("Coral Reef", 24), RX(1598), RY(753), colors["white"], 2, 1)
        draw.SimpleText("VOUS ÊTES DE RANG :", self:Font("Coral Reef", 48), w/2, RY(350), panel.rank and colors["rank_"..panel.rank] or color_white, 1, 1)
    end

    local item = vgui.Create("EditablePanel", panel)
    item:SetSize(RX(200), RY(250))
    item:SetPos(black:GetWide()/2-item:GetWide()/2, black:GetTall()/2-item:GetTall()/2)
    if panel.rank then
        item.icon = mats["rank_"..rankIds[panel.rank]]
    end
    item.Paint = function(_, w, h)
        if not item.icon then return end

        surface.SetDrawColor(color_white)
        surface.SetMaterial(item.icon)
        surface.DrawTexturedRect(0, 0, w, h)
    end

    panel.item = item

    local reroll = vgui.Create("DButton", panel)
    reroll:SetSize(RX(214), RY(76))
    reroll:SetPos(RX(859), RY(752))
    reroll:SetText("")
    reroll.Paint = function(_, w, h)
        draw.SimpleText("LANCER", self:Font("Coral Reef", 48), w/2, h*.4, colors["black"], 1, 1)
    end
    reroll.DoClick = function()
        if panel.locked then return end

        -- surface.PlaySound("seefox/newera/upgrade.wav")

        net.Start("Seefox:Reroll:Purchase2")
        net.SendToServer()
    end
    reroll.OnCursorEntered = function()
        reroll:AlphaTo(225, 0.2)
    end
    reroll.OnCursorExited = function()
        if panel.locked then return end

        reroll:AlphaTo(255, 0.2)
    end

    panel.reroll = reroll

    local close = vgui.Create("DButton", panel)
    close:SetSize(RX(60), RY(60))
    close:SetPos(black:GetWide() - close:GetWide() - RX(50), RY(30))
    close:SetText("")
    close.Paint = function(_, w, h)
        draw.SimpleText("X", self:Font("Montserrat Bold", 40), w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    close.DoClick = function()
        black:Remove()
    end

    Seefox_Reroll.Panel2 = black
end

net.Receive("Seefox:Reroll:Menu2", function()
    Seefox_Reroll:Menu2()
end)

local colWhite = Color(0, 0, 0, 255)
net.Receive("Seefox:Reroll:Purchase2", function()
    if not IsValid(Seefox_Reroll.Panel2) then return end

    local panel = Seefox_Reroll.Panel2:GetChildren()[1]

    if not IsValid(panel) then return end

    panel.locked = true

    local rerolls = Seefox_Reroll.Rerolls["rang"]
    local rerollId = net.ReadUInt(6)
    local reroll = rerolls[rerollId]

    local item = panel.item

    surface.PlaySound("seefox/newera/reroll.mp3")

    local i = 1

    timer.Create("Seefox:Reroll:Rank", 0.2, 29, function()
        if not IsValid(item) then return end

        item.icon = mats["rank_"..i]

        i = i + 1

        if i > 6 then
            i = 1
        end
    end)

    timer.Simple(6, function()
        if not IsValid(item) then return end

        timer.Remove("Seefox:Reroll:Rank")

        timer.Simple(0, function()
            -- surface.PlaySound("seefox/newera/unlocked.wav")
            item.icon = mats["rank_"..rerollId]
    
            if IsValid(panel.reroll) then
                panel.reroll:AlphaTo(255, 0.2, 0, function()
                    panel.locked = false
                end)
            end
    
            panel.rank = LocalPlayer():GetNWString("Rang"):lower()
    
            /*hook.Add("PostRenderVGUI", "Seefox:Reroll:Notify", function() 
                colWhite.a = math.sin(CurTime() * 5) * 100 + 155
        
                draw.SimpleText("Vous avez obtenu le rang "..reroll.name.." !", Seefox_Reroll:Font("Montserrat Regular", 42), ScrW()/2, ScrH()/4, colWhite, 1, 1)
            end)
        
            timer.Simple(5, function()
                hook.Remove("PostRenderVGUI", "Seefox:Reroll:Notify")
            end)*/
        end)
    end)
end)
-- if IsValid(Seefox_Reroll.Panel2) then Seefox_Reroll.Panel2:Remove() end
-- local ply = LocalPlayer()
-- if not IsValid(ply) or ply:SteamID64() != "76561198306115597" then return end

-- Seefox_Reroll:Menu2()

W = function(x) return ScrW() * x / 1920 end

if not IsValid(LocalPlayer()) then return end
if not LocalPlayer():IsSeefox() then return end

if IsValid(background) then background:Remove() end

local bigPos = Vector(-5598, 4819, 7360)

-- if true then return end
background = vgui.Create("EditablePanel")
background:SetSize(ScrW(), ScrH())
background:MakePopup()

local chest = ClientsideModel("models/blackclover/coffre.mdl")
chest:SetNoDraw(true)
chest:SetModelScale(1.5)
local tAngWanted = LocalPlayer():EyeAngles()
tAngWanted.p = 0
LocalPlayer():SetEyeAngles(tAngWanted)
local tAng = Angle(tOriginAng)
            tAng:RotateAroundAxis(tAng:Up(), 180)
local tOriginPos = Vector(-5598, 4819, 7360) + tAngWanted:Forward() * 80 + tAngWanted:Up() * 50
background.chestY = 225
background.speed = 0.5
background.Paint = function(_, w, h)
    background.chestY = background.chestY + background.speed
    if background.chestY > 360 then
        background.chestY = 0
    end
    render.SuppressEngineLighting(true)
    cam.Start3D(nil, nil, 100)
        chest:SetPos(bigPos - tAng:Forward() * 90 - tAng:Up() * 10 + tAng:Right() * 100)
        chest:SetAngles(Angle(0, background.chestY, 0))
        chest:DrawModel()
        -- chest:SetRenderMode(RENDERMODE_GLOW)
        -- chest:SetColor(color_white)
        -- chest:SetMaterial("models/debug/debugwhite")
        -- chest:SetColor(color_black)
    cam.End3D()
    render.SuppressEngineLighting(false)
end
background.OnRemove = function()
    -- hook.Remove("CalcView", "Seefox:Reroll:Rang")
    chest:Remove()
end

local open = vgui.Create("DButton", background)
open:SetSize(W(200), W(40))
open:SetPos(background:GetWide()/2-open:GetWide()/2, ScrH()*.8)
open:SetText("")
open.Paint = function(_, w, h)
    draw.RoundedBox(8, 0, 0, w, h, open:IsHovered() and Color(37, 37, 37) or Color(30, 30, 30))
    draw.SimpleText("Ouvrir", Seefox_Reroll:Font("Montserrat Regular", 42), w/2, h/2, color_white, 1, 1)
end
open.DoClick = function()
    -- Seefox_Reroll:Menu2()
    timer.Create("yolo", 0.1, 20, function()
        background.speed = background.speed + 0.25
    end)
end

hook.Add("CalcView", "Seefox:Reroll:Rang", function(ply, pos, ang, fov)
    return {
        origin = bigPos,
        angles = Angle(0, 45, 0),
        fov = 90
    }
end)
--PATH addons/simplistic_presentation/lua/vgui/avatarmaterial.lua:
local getAvatarMaterial = include("simplistic_presentation/lib/material-avatar.lua")

local PANEL = {}

function PANEL:Init()
	self.m_Material = Material("vgui/avatar_default")
end

function PANEL:SetPlayer(ply)
	if ply:IsBot() then return end
	self.m_SteamID64 = ply:SteamID64()
	self:Download()
end

function PANEL:SetSteamID64(steamid64)
	self.m_SteamID64 = steamid64
	if steamid64 then
		self:Download()
	end
end

function PANEL:GetPlayer()
	if self.m_SteamID64 == nil then
		return NULL
	else
		-- This is slow. Don't call it every frame.
		return player.GetBySteamID64(self.m_SteamID64)
	end
end

function PANEL:GetMaterial()
	return self.m_Material
end

function PANEL:GetSteamID64()
	return self.m_SteamID64
end

function PANEL:Download()
	assert(self.m_SteamID64 ~= nil, "Tried to download the avatar image of a nil SteamID64!")
	getAvatarMaterial(self.m_SteamID64, function(mat)
		if not IsValid(self) then return end -- The panel could've been destroyed before it could download the avatar image.
		self.m_Material = mat
	end)
end

function PANEL:Paint(w, h)
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(self.m_Material)
	surface.DrawTexturedRect(0, 0, w, h)
end

vgui.Register("AvatarMaterial", PANEL, "Panel")
--PATH lua/vgui/bvgui/header.lua:
local PANEL = {}

function PANEL:Init()
	self:SetTall(24)
	self:DockPadding(5,5,5,5)

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetTextColor(bVGUI.COLOR_BLACK)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 14))
	self.Label:Dock(FILL)
	self.Label:SetContentAlignment(5)

	self:SetText("Header")
	self:SetColor(bVGUI.COLOR_GMOD_BLUE)
end

function PANEL:SetText(text)
	self.Text = text
	self.Label:SetText(self.Text)
end
function PANEL:SetColor(color)
	self.Color = color
	self.Label:SetTextColor(bVGUI.TextColorContrast(color))
end

function PANEL:SetIcon(icon)
	if (icon == false) then
		if (IsValid(self.IconLeft)) then
			self.IconLeft:Remove()
		end
		if (IsValid(self.IconRight)) then
			self.IconRight:Remove()
		end
	else
		if (IsValid(self.IconLeft)) then
			self.IconLeft:SetImage(icon)
		else
			self.IconLeft = vgui.Create("DImage", self)
			self.IconLeft:SetSize(16,16)
			self.IconLeft:SetImage(icon)
		end

		if (IsValid(self.IconRight)) then
			self.IconRight:SetImage(icon)
		else
			self.IconRight = vgui.Create("DImage", self)
			self.IconRight:SetSize(16,16)
			self.IconRight:SetImage(icon)
		end
	end
end

function PANEL:PerformLayout()
	if (IsValid(self.IconLeft)) then
		self.IconLeft:AlignLeft(5)
		self.IconLeft:CenterVertical()
	end
	if (IsValid(self.IconRight)) then
		self.IconRight:AlignRight(5)
		self.IconRight:CenterVertical()
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(self.Color)
	surface.DrawRect(0,0,w,h)

	surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
	surface.DrawTexturedRect(0,0,w,h)
end
function PANEL:PaintOver(w,h)
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect(0,h - 1,w,1)
end

derma.DefineControl("bVGUI.Header", nil, PANEL, "DPanel")
--PATH lua/vgui/bvgui/tabs.lua:
--/// bVGUI.Tabs ///--

local PANEL = {}

function PANEL:Init()
	self.Tabs = {}
	self.TabPages = {}

	self.EnabledTabs = {}
	self.EnabledTabPages = {}

	self.SelectedTab = 0

	self.BarX = bVGUI.Lerp(0,0,.5)
	self.BarColor = bVGUI.LerpColor(bVGUI.COLOR_BLACK,bVGUI.COLOR_BLACK,.5)
end

function PANEL:OnRemove()
	for _,v in pairs(self.TabPages) do
		v:Remove()
	end
end

function PANEL:CalculateEnabledTabs()
	self.EnabledTabs = {}
	self.EnabledTabPages = {}
	for i,v in pairs(self.Tabs) do
		if (v:GetEnabled()) then
			v.EnabledTabIndex = table.insert(self.EnabledTabs, v)
			self.TabPages[i].EnabledTabIndex = table.insert(self.EnabledTabPages, self.TabPages[i])
		end
	end
end

function PANEL:AddTab(tab_name, tab_color, enabled)
	local tab_index = #self.Tabs + 1
	local tab = vgui.Create("bVGUI.Tab", self)
	self.Tabs[tab_index] = tab
	tab.TabIndex = tab_index
	tab:SetColor(tab_color)
	tab:SetText(tab_name)

	local tab_page = vgui.Create("bVGUI.TabPage", self:GetParent())
	self.TabPages[tab_index] = tab_page
	tab_page:SetTab(tab)
	tab_page:SetTabs(self)

	tab:SetTabPage(tab_page)
	tab:SetEnabled(enabled ~= false)
	if (self.SelectedTab == 0 and enabled ~= false) then
		self.SelectedTab = tab_index
		self.BarColor:SetColor(tab:GetColor())
	end

	return tab_page, tab
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(bVGUI.COLOR_SLATE)
	surface.DrawRect(0,0,w,h)
end

function PANEL:PaintOver(w,h)
	if (self.SelectedTab > 0) then
		self.BarX:DoLerp()
		self.BarColor:DoLerp()

		surface.SetDrawColor(bVGUI.COLOR_DARK_GREY)
		surface.DrawRect(0, h - 3, w, 3)

		surface.SetDrawColor(self.BarColor:GetColor())
		surface.DrawRect(self.BarX:GetValue(), h - 3, self:GetWide() / #self.EnabledTabs, 3)
	end
end

function PANEL:PerformLayout()
	self:CalculateEnabledTabs()

	local tab_width = self:GetWide() / #self.EnabledTabs
	for i,v in ipairs(self.EnabledTabs) do
		v:SetSize(tab_width, self:GetTall())
		local _,y = v:GetPos()
		v:SetPos((i - 1) * tab_width, y)
	end

	if (self.SelectedTab > 0) then
		for i,v in ipairs(self.EnabledTabPages) do
			local _,y = self:GetPos()
			v:SetSize(self:GetWide(), v:GetParent():GetTall() - self:GetTall() - y)
			if (not v.m_AnimList or #v.m_AnimList == 0) then
				v:SetPos((i - self.Tabs[self.SelectedTab].EnabledTabIndex) * self:GetWide() + (self:GetPos()), y + self:GetTall())
			end
		end

		local bar_x = (self.Tabs[self.SelectedTab]:GetPos())
		if (not self.EnabledTabs_Check or self.EnabledTabs_Check ~= #self.EnabledTabs) then
			self.EnabledTabs_Check = #self.EnabledTabs
			self.BarX:SetValue(bar_x)
		end
		if (self.BarX.to ~= bar_x) then
			self.BarX:SetValue(bar_x)
		end
	end
end

function PANEL:SelectTab(tab_index, suppress_click_func)
	if self.MovingTo == tab_index then return end
	self.MovingTo = tab_index
	local tab = self.Tabs[tab_index]

	local prev_tab = self.SelectedTab
	self.SelectedTab = tab.TabIndex

	self.BarX:SetTo((tab:GetPos()))
	self.BarColor:SetTo(tab:GetColor())

	for i,v in pairs(self.EnabledTabPages) do
		local _,y = v:GetPos()
		v:Stop()
		v:MoveTo((i - self.Tabs[self.SelectedTab].EnabledTabIndex) * v:GetWide() + (self:GetPos()), y, 0.5, 0, -1, function()
			self:InvalidateLayout(true)
			v:InvalidateChildren(true)
		end)
	end

	if (not suppress_click_func and tab.ClickFunction) then
		tab:GetTabPage().ExecClickFunction = tab.ClickFunction
		timer.Simple(0, function()
			if (self.OnTabSelected and prev_tab ~= nil) then
				self:OnTabSelected(self.Tabs[prev_tab], tab)
			end
		end)
	else
		if (self.OnTabSelected and prev_tab ~= nil) then
			self:OnTabSelected(self.Tabs[prev_tab], tab)
		end
	end
end

derma.DefineControl("bVGUI.Tabs", nil, PANEL, "DPanel")

--/// bVGUI.Tab ///--

local PANEL = {}

function PANEL:Init()
	self:SetMouseInputEnabled(true)
	self:SetCursor("hand")

	self.Label = vgui.Create("DLabel", self)
	self.Label:Dock(FILL)
	self.Label:SetContentAlignment(5)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetText("Tab")
end

function PANEL:OnMouseReleased()
	self:GetParent():SelectTab(self.TabIndex)
end

function PANEL:SetEnabled(enabled)
	self:SetVisible(enabled)
	self:GetTabPage():SetVisible(enabled)
	if (enabled ~= self.Enabled) then
		self.Enabled = enabled
		self:GetParent():InvalidateLayout(true)
	else
		self.Enabled = enabled
	end
end
function PANEL:GetEnabled()
	return self.Enabled
end

function PANEL:SetColor(color)
	self.Color = color
end
function PANEL:GetColor()
	return self.Color
end

function PANEL:SetText(name)
	self.Name = name
	self.Label:SetText(self.Name)
end
function PANEL:GetText()
	return self.Name
end

function PANEL:SetTabPage(tabpage)
	self.TabPage = tabpage
end
function PANEL:GetTabPage()
	return self.TabPage
end

function PANEL:SetFunction(func)
	self.ClickFunction = func
end
function PANEL:GetFunction()
	return self.ClickFunction
end

function PANEL:Paint(w,h)
	if (self:GetParent().SelectedTab == self.TabIndex) then
		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
		surface.DrawTexturedRect(0,0,w,h)
	end
end

derma.DefineControl("bVGUI.Tab", nil, PANEL, "DPanel")

--/// bVGUI.TabPage ///--

local PANEL = {}

function PANEL:SetTab(tab)
	self.MyTab = tab
end
function PANEL:GetTab()
	return self.MyTab
end

function PANEL:SetTabs(tabs)
	self.MyTabs = tabs
end
function PANEL:GetTabs()
	return self.MyTabs
end

function PANEL:Think()
	if (self.ExecClickFunction) then
		self.ExecClickFunction(self:GetTab())
		self.ExecClickFunction = nil
	end
end

derma.DefineControl("bVGUI.TabPage", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/bvgui/textentry.lua:
local PANEL = {}

function PANEL:Init()
	self:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self:ApplySchemeSettings()
	self:SetTextColor(bVGUI.COLOR_BLACK)
end

local focused_col = Color(0,120,255,255)
function PANEL:Paint(w,h)
	surface.SetDrawColor(255,255,255,255)
	surface.DrawRect(0,0,w,h)
	
	if (self._Valid) then
		surface.SetDrawColor(0,255,0,100)
		surface.DrawRect(0,0,w,h)
	elseif (self._Invalid) then
		surface.SetDrawColor(255,0,0,100)
		surface.DrawRect(0,0,w,h)
	end

	if (self:HasFocus()) then
		surface.SetDrawColor(0,120,255,255)
		surface.DrawOutlinedRect(0,0,w,h)
	end
	if (self:GetPlaceholderText() and #string.Trim(self:GetText()) == 0) then
		local oldtext = self:GetText()
		self:SetText(self:GetPlaceholderText())
		self:DrawTextEntryText(self:GetPlaceholderColor(), self:GetHighlightColor(), self:GetCursorColor())
		self:SetText(oldtext)
	else
		self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
	end
end

function PANEL:OnGetFocus()
	self.StoredValue = self:GetValue()
end

function PANEL:OnLoseFocus()
	if (self.OnValueChange and self:GetValue() ~= self.StoredValue) then
		self:OnValueChange(self:GetValue())
	end
end

function PANEL:SetInvalid(invalid)
	self._Invalid = invalid
	self._Valid = nil
end

function PANEL:SetValid(valid)
	self._Valid = valid
	self._Invalid = nil
end

function PANEL:ResetValidity()
	self._Valid, self._Invalid = nil
end

derma.DefineControl("bVGUI.TextEntry", nil, PANEL, "DTextEntry")

local PANEL = {}

function PANEL:Init()
	self.TextEntry = vgui.Create("bVGUI.TextEntry", self)
	self.TextEntry:SetWide(350)
end

function PANEL:SetLabel(text)
	self.Label = vgui.Create("DLabel", self)
	self.Label:SetContentAlignment(4)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetText(text)
	self.Label:SizeToContents()

	self:PerformSizing()
end

function PANEL:SetHelpText(text)
	self.HelpLabel = vgui.Create("DLabel", self)
	self.HelpLabel:SetContentAlignment(4)
	self.HelpLabel:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.HelpLabel:SetTextColor(bVGUI.COLOR_WHITE)
	self.HelpLabel:SetText(text)
	self.HelpLabel:SetWide(500)
	self.HelpLabel:SetWrap(true)
	self.HelpLabel:SetAutoStretchVertical(true)
	self.HelpLabel:SetTextColor(Color(200,200,200))
	function self.HelpLabel:PerformLayout()
		self:GetParent():PerformSizing()
		self:InvalidateParent(true)
	end
end

function PANEL:PerformSizing()
	local y = self.TextEntry:GetTall()
	if (IsValid(self.Label)) then
		y = y + self.Label:GetTall() + 10
	end
	if (IsValid(self.HelpLabel)) then
		y = y + self.HelpLabel:GetTall() + 10
	end
	self:SetTall(y)
end

function PANEL:PerformLayout()
	self.Label:AlignTop(0)
	self.HelpLabel:AlignBottom(0)
	self.TextEntry:AlignTop(self.Label:GetTall() + 10)
end

derma.DefineControl("bVGUI.TextEntryContainer", nil, PANEL, "bVGUI.BlankPanel")
--PATH addons/squad_reborn/lua/vgui/dsquadvgui.lua:
surface.CreateFont( "bebas_32" , {
    font = "Bebas Neue" ,
    size = 32
} )

local PANEL = { }
local _creatorPanel = nil
local notifIndex = 1
squad_window_frame = nil
squad_window = nil

function PANEL:Init( )
    if ( not LocalPlayer( ):GetSquad( ) or LocalPlayer( ):GetSquad( ) == { } ) then
        LocalPlayer( )._squad = nil
        LocalPlayer( )._squadLeader = nil
    end

    if (not IsValid(self:GetParent( ))) then
        squad_window_frame = vgui.Create("DFrame")
        squad_window_frame:SetSize(500,256)
        squad_window_frame:Center()
        squad_window_frame:MakePopup()
        self:SetParent(squad_window_frame)
    end

    self:Dock( FILL )
    self:Center( )
    self:GetParent( ).Paint = self.PaintFrame
    self:GetParent( ):ShowCloseButton( false )
    self:GetParent( ):SetTitle( "" )
    self.cl = vgui.Create( "DButton" , self:GetParent( ) )
    self.cl:SetSize( 36 , 36 )
    self.cl:SetPos( self:GetParent( ):GetWide( ) - 36 , 0 )
    self.cl:SetText( "" )

    self.cl.DoClick = function( _ )
        self:GetParent( ):Remove( )
    end

    self.cl.Paint = function( s , w , h )
        surface.SetDrawColor( Color( 201 , 51 , 40 ) )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( Color( 231 , 76 , 60 ) )
        surface.DrawRect( 0 , 0 , w , h - 4 )
        draw.SimpleText( "✕" , "bebas_32" , w / 2 , h / 2 - 2 , Color( 255 , 255 , 255 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )

        if ( s:IsHovered( ) ) then
            surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
            surface.DrawRect( 0 , 0 , w , h )
        end
    end

    self.help = vgui.Create( "DButton" , self:GetParent( ) )
    self.help:SetSize( 36 , 36 )
    self.help:SetPos( self:GetParent( ):GetWide( ) - 36 - 42 , 0 )
    self.help:SetText( "" )

    self.help.DoClick = function( s )
        notifIndex = notifIndex + 1

        if ( notifIndex > #SQUAD.Tips ) then
            notifIndex = 1
        end

        s:SetTooltip( SQUAD.Tips[ notifIndex ] )
        ChangeTooltip( s )
    end

    self.help.OnRemove = function( s )
        if ( IsValid( s.Help ) ) then
            s.Help:Remove( )
        end
    end

    self.help:SetTooltip( SQUAD.Tips[ 1 ] )

    self.help.Paint = function( s , w , h )
        surface.SetDrawColor( Color( 142 , 68 , 173 ) )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( Color( 155 , 89 , 182 ) )
        surface.DrawRect( 0 , 0 , w , h - 4 )
        draw.SimpleText( "?" , "bebas_32" , w / 2 , h / 2 - 2 , Color( 255 , 255 , 255 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )

        if ( s:IsHovered( ) ) then
            surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
            surface.DrawRect( 0 , 0 , w , h )
        end
    end

    if ( LocalPlayer( ):IsAdmin( ) or table.HasValue( SQUAD.Config.AdminPanelView , LocalPlayer( ):GetUserGroup( ) ) ) then
        self.admin = vgui.Create( "DButton" , self:GetParent( ) )
        self.admin:SetSize( 36 , 36 )
        self.admin:SetPos( self:GetParent( ):GetWide( ) - 36 - 42 - 42 , 0 )
        self.admin:SetText( "" )

        self.admin.DoClick = function( _ )
            RunConsoleCommand( "squad_admin" )
        end

        self.admin:SetTooltip( "Open admin menu" )

        self.admin.Paint = function( s , w , h )
            surface.SetDrawColor( Color( 22 , 160 , 133 ) )
            surface.DrawRect( 0 , 0 , w , h )
            surface.SetDrawColor( Color( 26 , 188 , 156 ) )
            surface.DrawRect( 0 , 0 , w , h - 4 )
            draw.SimpleText( "!" , "bebas_32" , w / 2 , h / 2 - 2 , Color( 255 , 255 , 255 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )

            if ( s:IsHovered( ) ) then
                surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
                surface.DrawRect( 0 , 0 , w , h )
            end
        end
    end

    local extraY = 0

    if ( LocalPlayer( ):GetSquadName( ) == "" ) then
        extraY = 72
        self.cr = vgui.Create( "DButton" , self )
        self.cr:SetPos( self:GetParent( ):GetWide( ) / 2 - 96 , 96 )
        self.cr:SetSize( 96 * 2 , 48 )
        self.cr:SetText( "" )

        self.cr.Paint = function( s , w , h )
            surface.SetDrawColor( Color( 39 , 174 , 96 ) )
            surface.DrawRect( 0 , 0 , w , h )
            surface.SetDrawColor( Color( 46 , 204 , 113 ) )
            surface.DrawRect( 0 , 0 , w , h - 4 )

            if ( s:IsHovered( ) ) then
                surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
                surface.DrawRect( 0 , 0 , w , h )
            end

            draw.SimpleText( string.upper( SQUAD.Language.CreateOne ) , "bebas_48" , w / 2 , h / 2 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
        end

        self.cr.DoClick = function( _ )
            if (SQUAD.Config.CustomCheck(LocalPlayer())) then
                self:GetParent( ):Remove( )
                _creatorPanel = vgui.Create( "dSquadCreate" )
                _creatorPanel:MakePopup( )
            else
                Derma_Message(SQUAD.Config.FailCheck,"Error","Ok")
            end
        end

        self:GetParent( ):SetTall( 292 )
        self:GetParent( ):Center( )
    else
        self:Recreate( )
    end

    self.CanInvite = vgui.Create( "dSquadToggle" , self )
    self.CanInvite:SetPos( 32 , extraY + ( IsValid( self.sq ) and ( self.sq:GetTall( ) + 96 ) or 96 ) )
    self.CanInvite:SetSize( 256 , 32 )
    self.CanInvite:SetToggled( true )
    self.CanInvite.Text = SQUAD.Language.AcceptInvitations

    self.CanInvite.OnValueChange = function( _ , b )
        net.Start( "Squad.CanInvite" )
        net.WriteBool( b )
        net.SendToServer( )
    end

    self.CanView = vgui.Create( "dSquadToggle" , self )
    self.CanView:SetPos( 32 + 296 + 8 , extraY + ( IsValid( self.sq ) and ( self.sq:GetTall( ) + 96 ) or 96 ) )
    self.CanView:SetSize( 256 , 32 )
    self.CanView:SetToggled( LocalPlayer():GetNWBool("Squad.CanShareView", false) )
    self.CanView.Text = SQUAD.Language.ShareView

    self.CanView.OnValueChange = function( _ , b )
        net.Start( "Squad.CanView" )
        net.WriteBool( b )
        net.SendToServer( )
    end

    self.DrawOutlines = vgui.Create( "dSquadToggle" , self )
    self.DrawOutlines:SetPos( 32 , extraY + 48 + ( IsValid( self.sq ) and ( self.sq:GetTall( ) + 96 ) or 96 ) )
    self.DrawOutlines:SetSize( 256 , 32 )
    self.DrawOutlines:SetToggled( GetConVar( "squad_outlines" ):GetInt( ) == 1 )
    self.DrawOutlines.Text = SQUAD.Language.DrawOutlines

    self.DrawOutlines.OnValueChange = function( )
        RunConsoleCommand( "squad_outlines" , GetConVar( "squad_outlines" ):GetInt( ) == 1 and 0 or 1 )
    end

    self.DrawTips = vgui.Create( "dSquadToggle" , self )
    self.DrawTips:SetPos( 32 + 296 + 8 , extraY + 48 + ( IsValid( self.sq ) and ( self.sq:GetTall( ) + 96 ) or 96 ) )
    self.DrawTips:SetSize( 256 , 32 )
    self.DrawTips:SetToggled( GetConVar( "squad_tips" ):GetInt( ) == 1 )
    self.DrawTips.Text = SQUAD.Language.Drawtips

    self.DrawTips.OnValueChange = function( )
        RunConsoleCommand( "squad_tips" , GetConVar( "squad_tips" ):GetInt( ) == 1 and 0 or 1 )
    end
end

function PANEL:PaintFrame( w , h )
    util.DrawBlur( self , 2 , 1 )
    surface.SetDrawColor( 0 , 0 , 0 , 100 )
    surface.DrawRect( 0 , 0 , w , h )
    surface.SetDrawColor( 0 , 0 , 0 , 150 )
    surface.DrawOutlinedRect( 0 , 0 , w , h )
    surface.SetDrawColor( Color( 200 , 200 , 200 ) )
    surface.DrawRect( 0 , 0 , w , 36 )
    surface.SetDrawColor( Color( 241 , 240 , 240 ) )
    surface.DrawRect( 0 , 0 , w , 32 )
    draw.SimpleText( "SQUADS" , "bebas_32" , 6 , 2 , Color( 120 , 120 , 120 ) )

    if ( LocalPlayer( ):GetSquadName( ) ~= "" ) then
        draw.SimpleText( "SQUADS" , "bebas_32" , 6 , 2 , Color( 120 , 120 , 120 ) )
    else
        draw.SimpleText( "- " .. SQUAD.Language.NotInSquad .. " -" , "bebas_48" , w / 2 , 64 , Color( 100 , 100 , 100 ) , TEXT_ALIGN_CENTER )
        draw.SimpleText( "- " .. SQUAD.Language.NotInSquad .. " -" , "bebas_48" , w / 2 , 62 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER )
        draw.SimpleText( "✕" , "bebas_48" , w / 2 + 200 , 64 , Color( 201 , 51 , 40 ) , TEXT_ALIGN_CENTER )
        draw.SimpleText( "✕" , "bebas_48" , w / 2 + 200 , 62 , Color( 231 , 76 , 60 ) , TEXT_ALIGN_CENTER )
        draw.SimpleText( "✕" , "bebas_48" , w / 2 - 200 , 64 , Color( 201 , 51 , 40 ) , TEXT_ALIGN_CENTER )
        draw.SimpleText( "✕" , "bebas_48" , w / 2 - 200 , 62 , Color( 231 , 76 , 60 ) , TEXT_ALIGN_CENTER )
    end
end

function PANEL:Recreate( )
    if ( IsValid( self.sq ) ) then
        self.sq:Remove( )
    end

    self.sq = vgui.Create( "DPanel" , self )
    self.sq:SetSize( self:GetParent( ):GetWide( ) , 340 )
    self.sq:SetPos( 0 , 16 )
    local tx = 0

    self.sq.Paint = function( _ , w , _ )
        if ( LocalPlayer( ):GetSquadName( ) ~= "" and ( LocalPlayer( ):GetSquad( ) or {
            Name = "Error"
        } ).Name ) then
            tx , _ = draw.SimpleText( LocalPlayer( ):GetSquadName( ) .. " - " .. LocalPlayer( ):GetSquad( ).Name , "bebas_48" , w / 2 , 16 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER )
            surface.SetDrawColor( color_white )
            surface.DrawRect( w / 2 - tx / 2 , 56 , tx , 2 )
        end
    end

    local bHeight = ( self.sq:GetWide( ) / 4 ) * math.ceil( SQUAD.Config.MaxMembers / 4 )
    self.sq:SetTall( 64 + bHeight )
    self.pl = vgui.Create( "DPanel" , self.sq )
    self.pl:SetSize( self.sq:GetWide( ) - 16 , bHeight )
    self.pl:SetPos( 8 , 72 )
    self.pl.Paint = function( ) end
    local size = self.sq:GetWide( ) / 4 - 4

    for k = 0 , SQUAD.Config.MaxMembers do
        local pl = vgui.Create( "dSquadMember" , self.pl )
        pl:SetSize( size , size )
        pl.Index = k

        if ( IsValid( LocalPlayer( ):GetSquadMembers( )[ k ] ) ) then
            pl:SetPlayer( LocalPlayer( ):GetSquadMembers( )[ k ] )
        end

        pl:SetPos( size * ( ( k + 3 ) % 4 ) , math.ceil( k / 4 ) * size - size - 32 )
    end

    self:GetParent( ):SetTall( bHeight + 286 )
    self:GetParent( ):Center( )
    self.inv = vgui.Create( "DButton" , self )
    self.inv:SetPos( self:GetParent( ):GetWide( ) / 2 - 116 , 64 + bHeight )
    self.inv:SetSize( 116 * 2 , 48 )
    self.inv:SetText( "" )

    self.inv.Paint = function( s , w , h )
        surface.SetDrawColor( Color( 142 , 68 , 173 ) )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( Color( 155 , 89 , 182 ) )
        surface.DrawRect( 0 , 0 , w , h - 4 )

        if ( s:IsHovered( ) ) then
            surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
            surface.DrawRect( 0 , 0 , w , h )
        end

        draw.SimpleText( SQUAD.Language.InvitePlayers , "bebas_48" , w / 2 , h / 2 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
    end

    self.inv.DoClick = function( _ )
        vgui.Create( "dSquadList" )
    end
end

function PANEL:Paint( )
end

derma.DefineControl( "dSquadPanel" , "DSquads" , PANEL , "DPanel" )
local CONFIG = { }

function CONFIG:Init( )
    self:SetSize( 200 , 300 )
    self:Center( )
    self:MakePopup( )
end

function CONFIG:Paint( )
end

derma.DefineControl( "dSquadConfig" , "DSquads" , CONFIG , "DFrame" )
local CREATE = { }

function CREATE:Init( )
    self:SetSize( 226 , 256 )
    self:Center( )
    self:MakePopup( )
    self:SetTitle( "" )
    self:ShowCloseButton( false )
    self._start = SysTime( )
    self.cl = vgui.Create( "DButton" , self )
    self.cl:SetSize( 32 , 32 )
    self.cl:SetPos( 226 - 32 , 0 )
    self.cl:SetText( "" )

    self.cl.DoClick = function( )
        self:Remove( )
    end

    self.cl.Paint = function( s , w , h )
        surface.SetDrawColor( Color( 201 , 51 , 40 ) )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( Color( 231 , 76 , 60 ) )
        surface.DrawRect( 0 , 0 , w , h - 4 )
        draw.SimpleText( "✕" , "bebas_32" , w / 2 , h / 2 - 2 , Color( 255 , 255 , 255 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )

        if ( s:IsHovered( ) ) then
            surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
            surface.DrawRect( 0 , 0 , w , h )
        end
    end

    self.tag = vgui.Create( "DTextEntry" , self )
    self.tag:SetSize( 226 - 12 , 34 )
    self.tag:SetPos( 6 , 78 )
    self.tag:SetUpdateOnType( true )
    self.tag:SetFont( "bebas_32" )

    self.tag.OnValueChange = function( s , t )
        if ( #t > SQUAD.Config.TagMaxSize ) then
            s:SetText( string.sub( t , 1 , SQUAD.Config.TagMaxSize ) )
            s:SetCaretPos( SQUAD.Config.TagMaxSize )
        end
    end

    self.tag.Paint = function( s , w , h )
        surface.SetDrawColor( 75 , 75 , 75 )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( 30 , 30 , 30 )
        surface.DrawRect( 1 , 1 , w - 2 , h - 2 )
        s:DrawTextEntryText( Color( 175 , 175 , 175 ) , Color( 230 , 126 , 34 ) , Color( 52 , 152 , 219 ) )
    end

    self.name = vgui.Create( "DTextEntry" , self )
    self.name:SetSize( 226 - 12 , 34 )
    self.name:SetUpdateOnType( true )

    self.name.OnValueChange = function( s , t )
        if ( #t > SQUAD.Config.NameMaxSize ) then
            s:SetText( string.sub( t , 1 , SQUAD.Config.NameMaxSize ) )
            s:SetCaretPos( SQUAD.Config.NameMaxSize )
        end
    end

    self.name:SetPos( 6 , 78 + 66 )
    self.name:SetFont( "bebas_32" )

    self.name.Paint = function( s , w , h )
        surface.SetDrawColor( 75 , 75 , 75 )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( 30 , 30 , 30 )
        surface.DrawRect( 1 , 1 , w - 2 , h - 2 )
        s:DrawTextEntryText( Color( 175 , 175 , 175 ) , Color( 230 , 126 , 34 ) , Color( 52 , 152 , 219 ) )
    end

    self.cr = vgui.Create( "DButton" , self )
    self.cr:SetPos( 0 , 192 )
    self.cr:SetSize( 226 , 48 )
    self.cr:SetText( "" )

    self.cr.Paint = function( s , w , h )
        surface.SetDrawColor( Color( 39 , 174 , 96 ) )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( Color( 46 , 204 , 113 ) )
        surface.DrawRect( 0 , 0 , w , h - 4 )

        if ( s:IsHovered( ) ) then
            surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
            surface.DrawRect( 0 , 0 , w , h )
        end

        draw.SimpleText( SQUAD.Language.Create , "bebas_48" , w / 2 , h / 2 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
    end

    self.cr.DoClick = function( )
        if ( self.tag:GetValue( ) ~= "" and self.name:GetValue( ) ~= "" ) then
            net.Start( "Squad.CreateSquad" )
            net.WriteString( self.tag:GetValue( ) )
            net.WriteString( self.name:GetValue( ) )
            net.SendToServer( )
            self.Wait = vgui.Create( "DPanel" , self )
            self.Wait.Paint = self.PaintBackground
            self.Wait:SetPos( 0 , 32 )
            self.Wait:SetSize( self:GetWide( ) , self:GetTall( ) - 32 )
        end
    end
end

function CREATE:Paint( w , h )
    Derma_DrawBackgroundBlur( self , self._start )
    surface.SetDrawColor( 20 , 20 , 20 )
    surface.DrawRect( 0 , 0 , w , h )
    surface.SetDrawColor( 50 , 50 , 50 )
    surface.DrawRect( 0 , 0 , w , h - 4 )
    draw.SimpleText( SQUAD.Language.D_Title , "bebas_32" , 6 , 2 , Color( 120 , 120 , 120 ) )
    draw.SimpleText( "TAG:" , "bebas_32" , 6 , 48 , Color( 120 , 120 , 120 ) )
    draw.SimpleText( "max " .. SQUAD.Config.TagMaxSize .. " " .. SQUAD.Language.Chars , "bebas_18" , w - 8 , 56 , Color( 120 , 120 , 120 , 100 ) , TEXT_ALIGN_RIGHT )
    draw.SimpleText( "Name:" , "bebas_32" , 6 , 48 + 66 , Color( 120 , 120 , 120 ) )
    draw.SimpleText( "max " .. SQUAD.Config.NameMaxSize .. " " .. SQUAD.Language.Chars , "bebas_18" , w - 8 , 56 + 66 , Color( 120 , 120 , 120 , 100 ) , TEXT_ALIGN_RIGHT )
end

function CREATE:PaintBackground( w , h )
    surface.SetDrawColor( 0 , 0 , 0 , 225 )
    surface.DrawRect( 0 , 0 , w , h )

    if ( self.Error == 1 ) then
        draw.SimpleText( SQUAD.Language.D_Created , "bebas_48" , w / 2 , h / 3 , Color( 46 , 204 , 113 , 255 + math.cos( RealTime( ) * 16 ) * 125 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
    elseif ( self.Error == 2 ) then
        draw.SimpleText( SQUAD.Language.D_Exists , "bebas_32" , w / 2 , h / 3 , Color( 231 , 76 , 60 , 255 + math.cos( RealTime( ) * 16 ) * 125 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
        draw.SimpleText( SQUAD.Language.D_ExistsB , "bebas_32" , w / 2 , h / 3 + 36 , Color( 231 , 76 , 60 , 255 + math.cos( RealTime( ) * 16 ) * 125 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
    elseif ( self.Error == 3 ) then
        draw.SimpleText( SQUAD.Language.D_Error , "bebas_32" , w / 2 , h / 3 , Color( 231 , 76 , 60 , 255 + math.cos( RealTime( ) * 16 ) * 125 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
    end
end

function CREATE:ShowResult( can )
    if ( can == 1 ) then
        self.Wait.Error = 1

        timer.Simple( 3 , function( )
            if (IsValid(self)) then
                self:Remove( )
            end
        end )
    elseif ( can == 2 ) then
        self.Wait.Error = 2

        timer.Simple( 3 , function( )
            if (IsValid(self.Wait)) then
                self.Wait:Remove( )
            end
        end )
    elseif ( can == 3 ) then
        self.Wait.error = 3

        timer.Simple( 3 , function( )
            if (IsValid(self.Wait)) then
                self.Wait:Remove( )
            end
        end )
    end
end

derma.DefineControl( "dSquadCreate" , "DSquads" , CREATE , "DFrame" )
local MEMBER = { }
MEMBER.Index = 0

function MEMBER:Init( )
end

local nextMessage = 0

function MEMBER:SetPlayer( ply )
    self.Avatar = vgui.Create( "AvatarImage" , self )
    self.Avatar:SetSize( 64 , 64 )
    self.Avatar:SetPlayer( ply , 64 )
    self.Avatar:Center( )
    self.Player = ply
    local isRemove = ply == LocalPlayer( ) or LocalPlayer( ):GetSquad( ).Creator == LocalPlayer( )
    self.bRemove = vgui.Create( "DImageButton" , self )
    self.bRemove:SetSize( 16 , 16 )
    self.bRemove:SetPos( 64 , 112 )
    self.bRemove:SetTooltip( "Options" )

    self.bRemove.DoClick = function( )
        local Menu = DermaMenu( )

        if ( ply ~= LocalPlayer( ) ) then
            Menu:AddOption( SQUAD.Language.Message , function( )
                Derma_StringRequest( SQUAD.Language.Message , SQUAD.Language.Message , "hey!" , function( val )
                    if ( nextMessage < CurTime( ) and #val <= 1024 ) then
                        nextMessage = CurTime( ) + 5
                        net.Start( "Squad.SendMessage" )
                        net.WriteString( val )
                        net.WriteEntity( ply )
                        net.SendToServer( )
                    else
                        chat.AddText( Color( 235 , 100 , 100 ) , SQUAD.Language.MessageWarning )
                    end
                end , function( ) end )
            end ):SetIcon( "icon16/user_comment.png" )

            if ( SQUAD.Config.CanShareMoney ) then
                Menu:AddOption( SQUAD.Language.Money , function( )
                    Derma_StringRequest( SQUAD.Language.Money , SQUAD.Language.MoneySubtitle .. "(Max " .. LocalPlayer( ):getDarkRPVar( "money" ) .. ")" , 100 , function( val )
                        if ( tonumber( val ) and LocalPlayer( ):canAfford( tonumber( val ) ) and tonumber( val ) > 0 ) then
                            net.Start( "Squad.SendMoney" )
                            net.WriteFloat( tonumber( val ) )
                            net.WriteEntity( ply )
                            net.SendToServer( )
                            notification.AddLegacy( "You sent $" .. tonumber( val ) .. "to " .. ply:Nick( ) , NOTIFY_GENERIC, 5 )
                        end
                    end , function( ) end )
                end ):SetIcon( "icon16/money.png" )
            end

            if ( SQUAD.Config.CanViewPlayerScreens ) then
                if ( SQUAD.Config.OnlyBossCanSee and not LocalPlayer( )._squadLeader ) then return end

                Menu:AddOption( SQUAD.Language.ScreenView , function( )
                    if ( ply:GetNWBool( "Squad.CanShareView" , false ) ) then
                        local screen = vgui.Create( "DFrame" , g_ContextMenu )
                        screen:SetSize( 320 , 240 )
                        screen:SetSizable( true )
                        screen:SetTitle( ply:Nick( ) .. " view" )
                        screen:Center( )
                        screen.Camera = vgui.Create( "DPanel" , screen )
                        screen.Camera:Dock( FILL )

                        screen.Camera.Paint = function( _ , w , h )
                            if ( not IsValid( ply ) ) then
                                screen:Remove( )
                                return
                            end

                            local x , y = screen:GetPos( )
                            local wh , hh = screen:GetSize( )

                            render.RenderView( {
                                origin = ply:EyePos( ) ,
                                angles = ply:EyeAngles( ) ,
                                x = x + 4 ,
                                y = y + 28 ,
                                w = w ,
                                h = h ,
                                drawviewmodel = false ,
                                drawviewer = true ,
                                aspectratio = wh / hh
                            } )
                        end
                    else
                        MsgN("!")
                        notification.AddLegacy("This player has share view option disabled", 1, 3)
                    end
                end ):SetIcon( "icon16/eye.png" )
            end

            if ( SQUAD.Config.CanShareWeapons ) then
                local SubMenu = Menu:AddSubMenu( SQUAD.Language.GiveGun )

                for k , v in pairs( LocalPlayer( ):GetWeapons( ) ) do
                    if ( GAMEMODE.Config and GAMEMODE.Config.DisallowDrop[ v:GetClass( ) ] ) then continue end

                    SubMenu:AddOption( v:GetPrintName( ) , function( )
                        net.Start( "Squad.GiveWeapon" )
                        net.WriteEntity( ply )
                        net.WriteString( v:GetClass( ) )
                        net.SendToServer( )
                    end ):SetIcon( "icon16/bullet_blue.png" )
                end
            end

            Menu:AddSpacer( )
        end

        if ( isRemove ) then
            local btnWithIcon = Menu:AddOption( ( LocalPlayer( ):GetSquad( ).Creator == LocalPlayer( ) and SQUAD.Language.RemoveLeave[1] or SQUAD.Language.RemoveLeave[2] ) .. " " .. SQUAD.Language.RemoveLeave[3] , function( )
                Derma_Query( SQUAD.Language.ExitMessage , SQUAD.Language.ExitConfirm , SQUAD.Language.Yeah , function( )
                    net.Start( "Squad.ExitSquad" )
                    net.WriteEntity( ply )
                    net.SendToServer( )

                    if ( IsValid( squad_window ) ) then
                        squad_window:GetParent( ):Remove( )
                        squad_window = nil
                    end
                end , "Cancel" , function( ) end )
            end )

            btnWithIcon:SetIcon( "icon16/door.png" )
        end

        Menu:Open( )
    end

    self.bRemove:SetImage( "icon16/cog.png" )
end

function MEMBER:Paint( w , h )
    if ( IsValid( self.Player ) ) then
        local col = Color( 40 , 40 , 40 )

        if ( self.Player == LocalPlayer( ) ) then
            col = Color( 243 , 156 , 18 )
        end

        if ( LocalPlayer( ):GetSquad( ) and LocalPlayer( ):GetSquad( ).Creator == self.Player ) then
            col = Color( 41 , 128 , 185 )
        end

        surface.SetDrawColor( Color( col.r * 1.6 , col.g * 1.6 , col.b * 1.6 ) )
        surface.DrawRect( w / 2 - 36 , h / 2 - 38 , 72 , 2 )
        surface.SetDrawColor( col )
        surface.DrawRect( w / 2 - 36 , h / 2 - 36 , 72 , 100 )
        surface.SetDrawColor( Color( col.r * 1.25 , col.g * 1.25 , col.b * 1.25 ) )
        surface.DrawRect( w / 2 - 36 , h / 2 - 36 , 72 , 96 )
        surface.SetDrawColor( Color( col.r * 1.6 , col.g * 1.6 , col.b * 1.6 ) )
        surface.DrawRect( w / 2 - 33 , h / 2 - 33 , 66 , 66 )
    else
        if ( IsValid( self.Avatar ) ) then
            self:GetParent( ):GetParent( ):GetParent( ):Recreate( )
            self:GetParent( ):GetParent( ):MakePopup( )
        end

        local wd = math.cos( RealTime( ) * 8 + self.Index ) * 4
        draw.RoundedBox( 8 , w / 2 - 17 - wd , h / 2 - 17 - wd , 34 + wd * 2 , 34 + wd * 2 , Color( 150 , 150 , 150 ) )
        draw.RoundedBox( 8 , w / 2 - 16 - wd , h / 2 - 16 - wd , 32 + wd * 2 , 32 + wd * 2 , Color( 75 , 75 , 75 ) )
        draw.RoundedBox( 8 , w / 2 - 12 - wd , h / 2 - 12 - wd , 24 + wd * 2 , 24 + wd * 2 , Color( 50 , 50 , 50 ) )
        draw.RoundedBox( 4 , w / 2 - 6 - wd , h / 2 - 6 - wd , 12 + wd * 2 , 12 + wd * 2 , Color( 100 , 100 , 100 ) )
    end
end

derma.DefineControl( "dSquadMember" , "DSQuads" , MEMBER , "DPanel" )
local LIST = { }

function LIST:Init( )
    self:SetSize( 104 * 3 + 16 , 300 )
    self:Center( )
    self:SetTitle( "" )
    self:MakePopup( )
    self:SetDraggable( false )
    self.List = vgui.Create( "DPanel" , self )
    self.List:SetSize( 104 * 3 , 256 )
    self.List:SetPos( 8 , 32 )

    self.List.Paint = function( _ , w , h )
        surface.SetDrawColor( 0 , 0 , 0 , 100 )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( 0 , 0 , 0 , 150 )
        surface.DrawOutlinedRect( 0 , 0 , w , h )
    end

    self.cl = vgui.Create( "DButton" , self )
    self.cl:SetSize( 24 , 24 )
    self.cl:SetPos( 104 * 3 - 18 , 4 )
    self.cl:SetText( "" )

    self.cl.DoClick = function( )
        self:Remove( )
    end

    self.cl.Paint = function( s , w , h )
        surface.SetDrawColor( Color( 201 , 51 , 40 ) )
        surface.DrawRect( 0 , 0 , w , h )
        surface.SetDrawColor( Color( 231 , 76 , 60 ) )
        surface.DrawRect( 0 , 0 , w , h - 2 )
        draw.SimpleText( "✕" , "bebas_32" , w / 2 - 1 , h / 2 , Color( 255 , 255 , 255 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )

        if ( s:IsHovered( ) ) then
            surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
            surface.DrawRect( 0 , 0 , w , h )
        end
    end

    self.Search = vgui.Create( "DTextEntry" , self )
    self.Search:SetPos( 136 , 4 )
    self.Search:SetSize( 96 , 24 )
    self.Search:SetUpdateOnType( true )

    self.Search.OnValueChange = function( )
        self:UpdateList( )
    end

    self:UpdateList( )
    self:ShowCloseButton( false )
end

function LIST:UpdateList( )
    for k , v in pairs( self.List.Models or { } ) do
        v:Remove( )
    end

    if IsValid( self.List.F ) then
        self.List.F:Remove( )
    end

    if IsValid( self.List.B ) then
        self.List.B:Remove( )
    end

    self.List.Models = { }
    local i = 0
    local playerList = { }
    local str = string.lower( self.Search:GetText( ) )

    for k , v in pairs( player.GetAll( ) ) do
        if ( string.find( string.lower( v:Nick( ) ) , str ) ~= nil ) then
            table.insert( playerList , v )
        end
    end

    for k , v in pairs( playerList ) do
        if ( v:GetSquadName( ) == "" and v ~= LocalPlayer( ) and v:GetNWBool( "Squad.CanHire" , true ) ) then
            local item = vgui.Create( "DPanel" , self.List )
            item:SetSize( 104 , 256 )
            item:SetPos( i * 104 , 0 )

            item.Paint = function( _ , w , h )
                surface.SetDrawColor( 0 , 0 , 0 , 100 )
                surface.DrawRect( 2 , 2 , w - 4 , h - 4 )
                surface.SetDrawColor( 0 , 0 , 0 , 150 )
                surface.DrawOutlinedRect( 2 , 2 , w - 4 , h - 4 )
            end

            item.Model = vgui.Create( "DModelPanel" , item )
            item.Model:SetModel( v:GetModel( ) )
            item.Model:SetSize( 100 , 256 )
            item.Model:SetPos( 4 , 0 )
            item.Model.i = math.random( 1 , 4 )

            item.Model.LayoutEntity = function( s , ent )
                if(ent:LookupSequence( "pose_standing_0" .. s.i ) > 0) then
                    ent:SetSequence( ent:LookupSequence( "pose_standing_0" .. s.i ) )
                end
                s:RunAnimation( )

                return
            end

            item.Model.OldPaint = item.Model.Paint

            item.Model.Paint = function( s , w , h )
                if ( not IsValid( v ) ) then
                    item:Remove( )

                    return
                end

                s:OldPaint( w , h )
                draw.SimpleText( v:Nick( ) , "bebas_18" , w / 2 , 20 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
            end

            item.Model.Entity.GetPlayerColor = function( ) return Vector( v:GetPlayerColor( ).x , v:GetPlayerColor( ).y , v:GetPlayerColor( ).z ) end
            local bone = item.Model.Entity:LookupBone( "ValveBiped.Bip01_Head1" )
            local eyepos = Vector(0,0,60)
            if(bone and bone > 1) then
                eyepos = item.Model.Entity:GetBonePosition( bone)
            end
            eyepos:Add( Vector( 12 , 0 , -12 ) )
            item.Model:SetFOV( 40 )
            item.Model:SetLookAt( eyepos )
            item.Model:SetCamPos( eyepos - Vector( -16 , 0 , -1 ) )
            item.Model.Entity:SetEyeTarget( eyepos - Vector( -12 , 0 , 0 ) )
            item.Select = vgui.Create( "DButton" , item )
            item.Select:SetSize( 96 , 32 )
            item.Select:SetPos( 4 , 256 - 32 )
            item.Select:SetText( "" )

            item.Select.Paint = function( s , w , h )
                surface.SetDrawColor( s.Sent and Color( 142 , 68 , 173 ) or Color( 211 , 84 , 0 ) )
                surface.DrawRect( 0 , 0 , w , h )
                surface.SetDrawColor( s.Sent and Color( 155 , 89 , 182 ) or Color( 230 , 126 , 34 ) )
                surface.DrawRect( 0 , 0 , w , h - 4 )

                if ( s:IsHovered( ) ) then
                    surface.SetDrawColor( Color( 255 , 255 , 255 , 50 ) )
                    surface.DrawRect( 0 , 0 , w , h )
                end

                draw.SimpleText( s.Sent and SQUAD.Language.InvitationButtons[1] or SQUAD.Language.InvitationButtons[2] , "bebas_32" , w / 2 , h / 2 - 1 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
            end

            item.Select.DoClick = function( s )
                net.Start( "Squad.SendInvitation" )
                net.WriteEntity( v )
                net.SendToServer( )
                s.Sent = true
            end

            self.List.Models[ i ] = item
            i = i + 1
        end
    end

    if ( i > 3 ) then
        self.List.Movement = 0
        self.List.F = vgui.Create( "DPanel" , self.List )
        self.List.F:SetSize( 12 , 256 )
        self.List.F:SetPos( 104 * 3 - 12 )
        self.List.F:SetCursor( "hand" )

        self.List.F.Paint = function( _ , w , h )
            surface.SetDrawColor( 0 , 0 , 0 , 200 )
            surface.DrawRect( 0 , 0 , w , h )
            surface.SetDrawColor( 0 , 0 , 0 , 235 )
            surface.DrawOutlinedRect( 0 , 0 , w , h )
            draw.SimpleText( ">" , "bebas_32" , w / 2 , h / 2 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
        end

        self.List.F.OnCursorEntered = function( )
            self.List.Movement = self.List.Movement - 1
        end

        self.List.F.OnCursorExited = function( )
            self.List.Movement = self.List.Movement + 1
        end

        self.List.B = vgui.Create( "DPanel" , self.List )
        self.List.B:SetSize( 12 , 256 )
        self.List.B:SetPos( 0 )
        self.List.B:SetCursor( "hand" )

        self.List.B.Paint = function( _ , w , h )
            surface.SetDrawColor( 0 , 0 , 0 , 200 )
            surface.DrawRect( 0 , 0 , w , h )
            surface.SetDrawColor( 0 , 0 , 0 , 235 )
            surface.DrawOutlinedRect( 0 , 0 , w , h )
            draw.SimpleText( "<" , "bebas_32" , w / 2 , h / 2 , Color( 240 , 240 , 240 ) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER )
        end

        self.List.B.OnCursorEntered = function( )
            self.List.Movement = self.List.Movement + 1
        end

        self.List.B.OnCursorExited = function( )
            self.List.Movement = self.List.Movement - 1
        end

        self.List.Think = function( )
            if ( self.List.Movement ~= 0 ) then
                self.List.Extra = math.Clamp( ( self.List.Extra or 0 ) + self.List.Movement * ( input.IsMouseDown( 107 ) and 3 or 1 ) , -( i - 3 ) * 104 , 0 )

                for k , v in pairs( self.List.Models ) do
                    if ( not v.bPos ) then
                        v.bPos , _ = v:GetPos( )
                    end

                    v:SetPos( v.bPos + self.List.Extra , 0 )
                end
            end
        end
    end
end

function LIST:Paint( w , h )
    util.DrawBlur( self , 2 , 4 )
    surface.SetDrawColor( 0 , 0 , 0 , 100 )
    surface.DrawRect( 0 , 0 , w , h )
    surface.SetDrawColor( 0 , 0 , 0 , 150 )
    surface.DrawOutlinedRect( 0 , 0 , w , h )
    draw.SimpleText( SQUAD.Language.Filter , "bebas_32" , 8 , 2 , Color( 255 , 255 , 255 ) )
end

derma.DefineControl( "dSquadList" , "DSquads" , LIST , "DFrame" )
local INV = { }
INV.Player = nil

function INV:Init( )
    self:SetSize( 300 , 128 )
    self:SetPos( ScrW( ) , ScrH( ) / 2 - 64 )
end

function INV:SetPlayer( ply , squad )
    self.Avatar = vgui.Create( "AvatarImage" , self )
    self.Avatar:SetSize( 64 , 64 )
    self.Avatar:SetPos( 8 , 32 )
    self.Avatar:SetPlayer( ply , 64 )
    self.Player = ply
    self.Enabled = true
    self.Squad = squad
    self.CreateTime = 7.9
    surface.SetFont( "bebas_18" )
    local bX , _ = surface.GetTextSize( string.format( SQUAD.Language.Join , self.Player:Nick( ) ) )
    local dX , _ = surface.GetTextSize( self.Squad )
    local wide = ( bX > dX and bX or dX ) + 88
    self:SetSize( wide , 86 )
    self:MoveTo( ScrW( ) - wide , ScrH( ) / 2 - 64 , 0.25 , 0 , 5 )
end

function INV:Paint( w , h )
    if ( self.Enabled ) then
        if ( not IsValid( self.Player ) ) then
            self:Remove( )

            return
        else
            util.DrawBlur( self , 2 , 4 )
            surface.SetDrawColor( 0 , 0 , 0 , 100 )
            surface.DrawRect( 0 , 0 , w , h )
            surface.SetDrawColor( 0 , 0 , 0 , 150 )
            surface.DrawOutlinedRect( 0 , 0 , w , h )
            local dx , _ = draw.SimpleText( string.format( SQUAD.Language.Join , self.Player:Nick( ) ) , "bebas_18" , w - 8 , 8 , color_white , TEXT_ALIGN_RIGHT )
            draw.SimpleText( self.Squad , "bebas_32" , w - 8 - dx , 26 , color_white , TEXT_ALIGN_LEFT )
            self.Avatar:SetPos( w - 16 - dx - 64 , 8 )
            draw.SimpleText( "(O) " .. SQUAD.Language.Accept , "bebas_18" , w - 8 , 56 , Color( 150 , 255 , 50 ) , TEXT_ALIGN_RIGHT )
            draw.SimpleText( "(P) " .. SQUAD.Language.Refuse , "bebas_18" , w - 8 - 92 , 56 , Color( 255 , 100 , 50 ) , TEXT_ALIGN_RIGHT )
            surface.SetDrawColor( util.GetProgressColor( 255 , ( self.CreateTime / 8 ) * 100 ) )
            surface.DrawRect( 1 , h - 5 , w - 2 , 4 )
            surface.SetDrawColor( Color( 0 , 0 , 0 , 100 ) )
            surface.DrawRect( 1 , h - 5 , w - 2 , 4 )
            surface.SetDrawColor( util.GetProgressColor( 255 , ( self.CreateTime / 8 ) * 100 ) )
            surface.DrawRect( 1 , h - 5 , ( self.CreateTime / 8 ) * w - 2 , 4 )

            if ( self.CreateTime < 0 and not self.Removing ) then
                self:MoveTo( ScrW( ) , ScrH( ) / 2 - 64 , 0.25 , 0 , 5 , function( )
                    self:Remove( )
                end )

                self.Removing = true
            else
                self.CreateTime = self.CreateTime - FrameTime( )
            end
        end
    end
end

function INV:Think( )
    if ( not vgui.CursorVisible( ) and not self.Removing ) then
        if ( input.IsKeyDown( KEY_O ) ) then
            net.Start( "Squad.ReplyInvitation" )
            net.WriteEntity( self.Player )
            net.WriteBool( true )
            net.SendToServer( )
            self.CreateTime = -1
        end

        if ( input.IsKeyDown( KEY_P ) ) then
            net.Start( "Squad.ReplyInvitation" )
            net.WriteEntity( self.Player )
            net.WriteBool( false )
            net.SendToServer( )
            self.CreateTime = -1
        end
    end
end

function INV:OnRemove( )
    if ( self.Removing and self.CreateTime ~= -1 ) then
        net.Start( "Squad.ReplyInvitation" )
        net.WriteEntity( self.Player )
        net.WriteBool( false )
        net.SendToServer( )
    end
end

function util.GetProgressColor( a , am )
    local col = Color( 231 , 76 , 60 , a )

    if ( am > 30 ) then
        if ( am < 50 ) then
            col = Color( 230 , 126 , 34 , a )
        elseif ( am < 75 ) then
            col = Color( 241 , 196 , 15 , a )
        else
            col = Color( 46 , 204 , 113 , a )
        end
    end

    return col
end

derma.DefineControl( "dSquadInvitation" , "DSquads" , INV , "DPanel" )
local TG = { }
AccessorFunc( TG , "TG" , "Toggled" , FORCE_BOOL )

function TG:Init( )
    self:SetText( "" )
end

function TG:Paint( _ , h )
    surface.SetDrawColor( 100 , 100 , 100 )
    surface.DrawOutlinedRect( 1 , 1 , 64 , h - 2 )
    surface.SetDrawColor( 25 , 25 , 25 )
    surface.DrawRect( 2 , 2 , 62 , h - 4 )

    if ( self:GetToggled( ) ) then
        surface.SetDrawColor( Color( 46 , 204 , 113 ) )
        surface.DrawRect( 2 + 31 , 2 , 31 , h - 4 )
        surface.SetDrawColor( Color( 0 , 0 , 0 , 50 ) )
        surface.DrawRect( 2 , h - 6 , 31 , 4 )
    else
        surface.SetDrawColor( Color( 230 , 126 , 34 ) )
        surface.DrawRect( 2 , 2 , 31 , h - 4 )
        surface.SetDrawColor( Color( 0 , 0 , 0 , 50 ) )
        surface.DrawRect( 2 , h - 6 , 31 , 4 )
    end

    draw.SimpleText( self.Text or "TEST" , "bebas_32" , 72 , h / 2 , color_white , TEXT_ALIGN_LEFT , TEXT_ALIGN_CENTER )
end

function TG:DoClick( )
    self:SetToggled( not self:GetToggled( ) )
    self:OnValueChange( self:GetToggled( ) )
end

function TG:OnValueChange( )
end

derma.DefineControl( "dSquadToggle" , "DSquads" , TG , "DButton" )

net.Receive( "Squad.VerifyIfAvailable" , function( )
    if ( IsValid( _creatorPanel ) ) then
        local can = net.ReadInt( 4 )
        _creatorPanel:ShowResult( can )
    end
end )

concommand.Add( "squad_config" , function( ) end )
local png_icon = file.Exists( "materials/icon64/squad2.png" , "GAME" ) and "icon64/squad2.png" or "icon64/playermodel.png"

net.Receive( "Squad.Verify" , function( )
    if ( IsValid( squad_window_frame ) ) then
        squad_window = vgui.Create( "dSquadPanel" , squad_window_frame )
    end
end )

if (SQUAD.Config.UseCMenu) then

list.Set( "DesktopWindows" , "SquadInvitation" , {
    title = "Squads" ,
    icon = png_icon ,
    width = 600 ,
    height = 500 ,
    onewindow = true ,
    init = function( _ , wd )
        squad_window_frame = wd

        if ( LocalPlayer( )._squad ~= "" ) then
            squad_window = vgui.Create( "dSquadPanel" , squad_window_frame )
        else
            wd.Paint = function( ) end
            net.Start( "Squad.Verify" )
            net.WriteString( LocalPlayer( )._squad or "" )
            net.SendToServer( )
        end
    end
} )

end

concommand.Add( "squad_admin" , function( ply )
    if ( ply:IsAdmin( ) or table.HasValue( SQUAD.Config.AdminPanelView , ply:GetUserGroup( ) ) ) then
        local frame = vgui.Create( "DFrame" )
        frame:SetSize( 600 , 500 )
        frame:Center( )
        frame:MakePopup( )
        frame:SetTitle( "Squad Administration" )

        frame.Paint = function( _ , w , h )
            util.DrawBlur( frame , 2 , 4 )
            surface.SetDrawColor( 0 , 0 , 0 , 100 )
            surface.DrawRect( 0 , 0 , w , h )
            surface.SetDrawColor( 0 , 0 , 0 , 150 )
            surface.DrawOutlinedRect( 0 , 0 , w , h )
        end

        frame.Squads = vgui.Create( "DListView" , frame )
        frame.Squads:SetPos( 16 , 38 )
        frame.Squads:SetSize( 228 , 256 - 38 - 16 )
        frame.Squads:AddColumn( "Squad name" )
        frame.Member = vgui.Create( "DListView" , frame )
        frame.Member:SetPos( 500 - 16 - 228 , 38 )
        frame.Member:SetSize( 228 , 256 - 38 - 16 )
        frame.Member:AddColumn( "Members" )

        for k , v in pairs( SQUAD.Groups ) do
            if ( k ~= "" ) then
                local line = frame.Squads:AddLine( v.Name )
                line.Data = v
                line.Tag = k
                line.oM = line.OnMousePressed

                line.OnMousePressed = function( s , val )
                    s:oM( val )
                    frame.Member:Clear( )

                    if ( SQUAD.Groups[ s.Tag ] and SQUAD.Groups[ s.Tag ].Members ) then
                        if ( #( SQUAD.Groups[ s.Tag ] or {
                            Members = { }
                        } ).Members > 0 ) then
                            for _ , ply in pairs( SQUAD.Groups[ s.Tag ].Members ) do
                                if ( IsValid( ply ) ) then
                                    frame.Member:AddLine( ply:Nick( ) )
                                else
                                    table.RemoveByValue( SQUAD.Groups[ s.Tag ].Members , ply )
                                end
                            end
                        else
                            SQUAD.Groups[ s.Tag ] = nil
                        end
                    end
                end
            else
                SQUAD.Groups[ k ] = nil
                continue
            end
        end
    end
end )

--PATH lua/vgui/openpermissions_scrollpanel.lua:
local PANEL = {}

function PANEL:Init()
	self.CurrentOffset = 0
	self.TargetOffset = 0
	self.StartTime = 0
	self.EndTime = 0

	self.VBar:SetHideButtons(true)
	self.VBar:SetWide(5)
	self.VBar:DockMargin(3,3,3,3)

	function self.VBar:Paint() end
	function self.VBar.btnGrip:Paint(w,h)
		surface.SetDrawColor(0,0,0,150)
		surface.DrawRect(0,0,w,h)
	end

	self.VBar.CurrentY = 0
	self.VBar.TargetY = 0
	function self.VBar:PerformLayout()

		local Wide = self:GetWide()
		local BtnHeight = Wide
		if ( self:GetHideButtons() ) then BtnHeight = 0 end
		local Scroll = self:GetScroll() / self.CanvasSize
		local BarSize = math.max( self:BarScale() * ( self:GetTall() - ( BtnHeight * 2 ) ), 10 )
		local Track = self:GetTall() - ( BtnHeight * 2 ) - BarSize
		Track = Track + 1

		Scroll = Scroll * Track

		self.TargetY = BtnHeight + Scroll
		self.btnGrip:SetSize( Wide, BarSize )

		if ( BtnHeight > 0 ) then
			self.btnUp:SetPos( 0, 0, Wide, Wide )
			self.btnUp:SetSize( Wide, BtnHeight )

			self.btnDown:SetPos( 0, self:GetTall() - BtnHeight )
			self.btnDown:SetSize( Wide, BtnHeight )
			
			self.btnUp:SetVisible( true )
			self.btnDown:SetVisible( true )
		else
			self.btnUp:SetVisible( false )
			self.btnDown:SetVisible( false )
			self.btnDown:SetSize( Wide, BtnHeight )
			self.btnUp:SetSize( Wide, BtnHeight )
		end

	end

	function self.VBar:Think()
		self.CurrentY = Lerp(FrameTime() * 10, self.CurrentY, self.TargetY)
		self.btnGrip:SetPos(0, math.Round(self.CurrentY))
	end

	self.pnlCanvas.CurrentOffset = 0
	self.pnlCanvas.TargetOffset = 0
	function self.pnlCanvas:Think()
		self.CurrentOffset = Lerp(FrameTime() * 10, self.CurrentOffset, self.TargetOffset)
		self:SetPos(0, math.Round(self.CurrentOffset))
	end
end

function PANEL:OnVScroll(offset)
	self.pnlCanvas.TargetOffset = offset
end

function PANEL:PerformLayoutInternal()

	local Tall = self.pnlCanvas:GetTall()
	local Wide = self:GetWide()
	local YPos = 0

	self:Rebuild()

	self.VBar:SetUp( self:GetTall(), self.pnlCanvas:GetTall() )
	YPos = self.VBar:GetOffset()

	if ( self.VBar.Enabled ) then Wide = Wide - self.VBar:GetWide() end

	self.pnlCanvas:SetPos( 0, YPos )
	self.pnlCanvas:SetWide( Wide + self.VBar:GetWide() )

	self:Rebuild()

	if ( Tall != self.pnlCanvas:GetTall() ) then
		self.VBar:SetScroll( self.VBar:GetScroll() ) -- Make sure we are not too far down!
	end

end

derma.DefineControl("OpenPermissions.ScrollPanel", nil, PANEL, "DScrollPanel")
--PATH gamemodes/mangarp/gamemode/libraries/tablecheck.lua:
--[[
tablecheck

WIP

Author: FPtje Falco

Purpose:
Allow validating tables by creating schemas of tables. Inspired by Joi (https://github.com/hapijs/joi)

Requires fn library (https://github.com/FPtje/GModFunctional),

Example:
```lua
local schema = tc.checkTable{
    name   = tc.addHint(isstring, "The name must be a string!"),
    id     = tc.addHint(isnumber, "The id must be a number!"),
    gender = tc.addHint(tc.oneOf{"male", "female", "carp"}, "Gender missing or not recognised!", {"Perhaps you are a carp?"}),
}

local correct, err, hints = schema({name = "Dick", id = 3, gender = "carp"})
print(correct) -- true


local correct, err, hints = schema({name = "Dick", id = 3, gender = "crap"})
print(correct) -- false
print(err) -- Gender missing or not recognised!
PrintTable(hints) -- {"Perhaps you are a carp?"}
```

For further examples, including nesting and combining of schemas, please see the `unitTests` function for now.
--]]

module("tc", package.seeall)

-- Helpers for quick access to metatables
angle                  = FindMetaTable("Angle")
convar                 = FindMetaTable("ConVar")
effectdata             = FindMetaTable("CEffectData")
entity                 = FindMetaTable("Entity")
file                   = FindMetaTable("File")
imaterial              = FindMetaTable("IMaterial")
irestore               = FindMetaTable("IRestore")
isave                  = FindMetaTable("ISave")
itexture               = FindMetaTable("ITexture")
lualocomotion          = FindMetaTable("CLuaLocomotion")
movedata               = FindMetaTable("CMoveData")
navarea                = FindMetaTable("CNavArea")
navladder              = FindMetaTable("CNavLadder")
nextbot                = FindMetaTable("NextBot")
npc                    = FindMetaTable("NPC")
pathfollower           = FindMetaTable("PathFollower")
physobj                = FindMetaTable("PhysObj")
player                 = FindMetaTable("Player")
recipientfilter        = FindMetaTable("CRecipientFilter")
soundpatch             = FindMetaTable("CSoundPatch")
takedamageinfo         = FindMetaTable("CTakeDamageInfo")
usercmd                = FindMetaTable("CUserCmd")
vector                 = FindMetaTable("Vector")
vehicle                = FindMetaTable("Vehicle")
vmatrix                = FindMetaTable("VMatrix")
weapon                 = FindMetaTable("Weapon")

-- Assert function, asserts a property and returns the error if false.
-- Allows f to override err and hints by simply returning them
addHint = function(f, err, hints) return function(...)
    local res = {f(...)}
    res[2] = err
    res[3] = hints

    return unpack(res)
end end

--[[ Validates a table against a schema
Capable of nesting
--]]
function checkTable(schema)
    return function(tbl)
        if not istable(tbl) then
            return false, "Not a table!"
        end

        for k, v in pairs(schema or {}) do
            local correct, err, hints = tbl[v] ~= nil
            if isfunction(v) then correct, err, hints, replace, replaceWith = v(tbl[k], tbl) end


            if not correct then
                err = err or string.format("Element '%s' is corrupt!", k)
                return correct, err, hints
            end

            -- Update the value
            if correct and replace == true and replaceWith then
                tbl[k] = replaceWith
            end
        end

        return true
    end
end

-- Returns whether a value is nil
isnil = fn.Curry(fn.Eq, 2)(nil)

-- Returns whether a value is a color
iscolor = IsColor

-- Returns true on the client
client = function() return CLIENT end

-- returns true on the server
server = function() return SERVER end

-- Optional value, when filled in it must meet the conditions
optional = function(...) return fn.FOr{isnil, ...} end

-- Default value, implies optional. Only works in combination with tc.checkTable
-- Note that the tc.addHint is to be the second parameter of default.
--      tc.addHint(tc.default(x)) does NOT work, default(x, tc.addHint(...)) does.
-- example: tc.checkTable{test = tc.default(3, tc.addHint(isnumber, "must be a number"))}
-- example: tc.checkTable{test = tc.default(3)}
default = function(def, f)
    return function(val, ...)
        if val == nil then
            -- second return value is the default value. Expects parent function to actually change the value
            return true, nil, nil, true, def
        end
        -- Return in if statement rather than "return f and f(val) or true" to allow multiple return values
        if f then return f(val, ...) else return true end
    end
end

-- A table of which each element must meet condition f
-- i.e. "this must be a table of xxx"
-- example: tc.tableOf(isnumber) demands that the table contains only numbers
tableOf = function(f) return function(tbl, parentTbl)
    if not istable(tbl) then return false end
    for _, v in pairs(tbl) do
        local res = {f(v, parentTbl)}
        if not res[1] then
            return unpack(res)
        end
    end

    return true
end end

-- Checks whether a value is amongst a given set of values
-- exapmle: tc.oneOf{"jobs", "entities", "shipments", "weapons", "vehicles", "ammo"}
oneOf = function(f) return fp{table.HasValue, f} end

-- A table that is non-empty, also useful for wrapping around tableOf
-- example: tc.nonEmpty(tc.tableOf(isnumber))
-- example: tc.nonEmpty() -- just checks that the table is non-empty
nonEmpty = function(f) return function(tbl, parentTbl)
    if not istable(tbl) or table.IsEmpty(tbl) then return false end
    if not f then return true end
    return f(tbl, parentTbl)
end end

-- Number check: minimum
min = function(n) return fn.FAnd{isnumber, fp{fn.Lte, n}} end

-- Number check: maximum
max = function(n) return fn.FAnd{isnumber, fp{fn.Gte, n}} end

-- Number check: positive
positive = min(0)

-- Number check: negative
negative = max(0)


-- Whether the input matches regex
-- Note: uses string.match, so it doesn't support full regex.
-- May also allow numbers, since string.match also accepts numbers.
-- Note, also matches on substrings. Use ^pattern$ for a full match.
regex = function(pattern, startpos) return function(val)
    return (isstring(val) or isnumber(val)) and tobool(string.match(val, pattern, startpos))
end end

-- Requires that the value only contains alphanumeric characters
alphanum = regex("^[a-zA-Z0-9]+$")


-- Test cases. Also serve as nice examples
function unitTests()
    local id = 0

    -- unit test helper functions
    local function checkCorrect(correct, err, hints)
        id = id + 1

        if correct ~= true then
            print(id, "Incorrect value that should be correct!", correct, err, hints)
            if hints then PrintTable(hints) end
            return
        end

        print(id, "Correct")
    end

    local function checkIncorrect(correct, err, hints)
        id = id + 1

        if correct then
            print(id, "Correct value that should be incorrect!", correct, err, hints)
            if hints then PrintTable(hints) end
            return
        end

        print(id, "Correct")
    end

    --[[
    Simple value schema. Checks whether the input is a number.
    ]]
    local simpleSchema = tc.addHint(isnumber, "Must be a number!")

    -- This is how a schema is to be used. Just call it with the value you want to check.
    -- In further unit tests, the schema function is immediately called inside the checkCorrect/checIncorrect call for brevity
    local correct, err, hints = simpleSchema(3)

    checkCorrect(correct, err, hints)


    --[[
    Simple table schema
    ]]
    local simpleTableSchema = tc.checkTable{
        name        = tc.addHint(isstring, "The name must be a string!"),
        id          = tc.addHint(isnumber, "The id must be a number!"),
        gender      = tc.addHint(tc.oneOf{"male", "female", "carp"}, "Gender missing or not recognised!", {"Perhaps you are a carp?"}),
        nilthing    = tc.addHint(tc.isnil, "nilthing must be nil"),
        nonEmpty    = tc.addHint(tc.nonEmpty(tc.tableOf(isnumber)), "nonEmpty not table of numbers"),
        optnum      = tc.addHint(tc.optional(isnumber), "optnum given, but not a number"),
        strnum      = tc.addHint(fn.FOr{isstring, isnumber}, "strnum must either be a string or a number"),
        minmax      = tc.addHint(fn.FAnd{tc.min(5), tc.max(10)}),
        pos         = tc.addHint(tc.optional(tc.positive)),
        regx        = tc.addHint(tc.optional(tc.regex("[a-z]+"))),
        letters     = tc.addHint(tc.optional(tc.alphanum)),
    }

    checkCorrect(simpleTableSchema({name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 5, regx = "asdf", letters = "asdfj", pos = 3}))

    -- Counterexamples, should throw errors
    local badTables = {
        {},
        {name = 1, id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7},
        {name = "Dick", id = "3", gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7},
        {name = "Dick", id = 3, gender = "other", nonEmpty = {1,2,3}, strnum = "str", minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {}, strnum = "str", minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = {}, minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", optnum = "nope", minmax = 7},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 4},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 11},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str"},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7, regx = "666"},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7, regx = "asdf", letters = ">:D"},
        {name = "Dick", id = 3, gender = "carp", nonEmpty = {1,2,3}, strnum = "str", minmax = 7, regx = "asdf", letters = ">:D", pos = -1},
    }

    for _, tbl in pairs(badTables) do
        checkIncorrect(simpleTableSchema(tbl))
    end

    --[[
    Table Schema with no explicit keys
    ]]
    local nokeysSchema = tc.checkTable{
        tc.addHint(isstring, "The first value must be a string."),
        tc.addHint(isnumber, "The second value must be a number!"),
    }
    checkCorrect(nokeysSchema({"string", 3}))

    --[[
    Nested table schema
    ]]
    local nestedSchema = tc.checkTable{
        nested = tc.checkTable{
            val = tc.addHint(isnumber, "'val' must be a number!")
        }
    }

    checkCorrect(nestedSchema({nested = {val = 3}}))
    checkIncorrect(nestedSchema({}))

    --[[
    Combining schemas using the fn library
    ]]
    local andSchema = fn.FAnd{
        tc.checkTable{
            num = tc.addHint(isnumber, "num is not a number")
        },
        tc.checkTable{
            str = tc.addHint(isstring, "str is not a string")
        }
    }

    checkCorrect(andSchema({num = 1, str = "string!"}))
    checkIncorrect(andSchema({num = 1}))
    checkIncorrect(andSchema({str = "string!"}))

    local orSchema = fn.FOr{
        tc.checkTable{
            num = tc.addHint(isnumber, "num is not a number")
        },
        tc.checkTable{
            str = tc.addHint(isstring, "str is not a string")
        }
    }
    checkCorrect(orSchema({num = 1}))
    checkCorrect(orSchema({str = "string!"}))

    --[[
    Default value with a check
    ]]
    local withDefaultSchema = tc.checkTable{
        value = tc.default(10, tc.addHint(isnumber, "must be a number!"))
    }
    checkCorrect(withDefaultSchema({value = 30}))
    checkIncorrect(withDefaultSchema({value = "string"}))

    local empty = {}
    checkCorrect(withDefaultSchema(empty))
    if empty.value ~= 10 then
        print("Default did NOT set the value to 10!")
    else
        print("Default test OK!")
    end

    --[[
    Default value with no checks
    ]]
    local withDefaultNoCheck = tc.checkTable{
        value = tc.default(10)
    }
    checkCorrect(withDefaultNoCheck({}))
    checkCorrect(withDefaultNoCheck({value = "string"}))

    --[[
    Creating your own checker function that returns an error message
    When both the function and the tc.addHint define error messages, there's a conflict
    ]]
    local function customCheck(val)
        return false, "function error message", {"function hint"}
    end

    local customCheckSchema = tc.checkTable{
        value = tc.addHint(customCheck, "added error message", {"added hint"})
    }
    checkIncorrect(customCheckSchema{value = 1})
    checkIncorrect(customCheckSchema{})

    _, err, hints = customCheckSchema{value = 2}
    if err ~= "added error message" or hints[1] ~= "added hint" then
        print("Wrong conflict solution", err, hints[1])
    else
        print("Conflict solution OK!")
    end

    print("finished")
end

--PATH gamemodes/mangarp/gamemode/modules/money/sh_interface.lua:
DarkRP.PLAYER.canAfford = DarkRP.stub{
    name = "canAfford",
    description = "Whether the player can afford the given amount of money",
    parameters = {
        {
            name = "amount",
            description = "The amount of money",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether the player can afford it",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.ENTITY.isMoneyBag = DarkRP.stub{
    name = "isMoneyBag",
    description = "Whether this entity is a money bag",
    parameters = {

    },
    returns = {
        {
            name = "answer",
            description = "Whether this entity is a money bag.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

--PATH gamemodes/mangarp/gamemode/modules/doorsystem/cl_interface.lua:
DarkRP.readNetDoorVar = DarkRP.stub{
    name = "readNetDoorVar",
    description = "Internal function. You probably shouldn't need this. DarkRP calls this function when reading DoorVar net messages. This function reads the net data for a specific DoorVar.",
    parameters = {
    },
    returns = {
        {
            name = "name",
            description = "The name of the DoorVar.",
            type = "string"
        },
        {
            name = "value",
            description = "The value of the DoorVar.",
            type = "any"
        }
    },
    metatable = DarkRP
}

DarkRP.ENTITY.drawOwnableInfo = DarkRP.stub{
    name = "drawOwnableInfo",
    description = "Draw the ownability information on a door or vehicle.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP.ENTITY
}

DarkRP.hookStub{
    name = "HUDDrawDoorData",
    description = "Called when DarkRP is about to draw the door ownability information of a door or vehicle. Override this hook to ",
    parameters = {
        {
            name = "ent",
            description = "The door or vehicle of which the ownability information is about to be drawn.",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "override",
            description = "Return true in your hook to disable the default drawing and use your own.",
            type = "boolean"
        }
    }
}

--PATH gamemodes/mangarp/gamemode/modules/chat/sh_interface.lua:
DarkRP.declareChatCommand = DarkRP.stub{
    name = "declareChatCommand",
    description = "Declare a chat command (describe it)",
    parameters = {
        {
            name = "table",
            description = "The description of the chat command. Has to contain a string: command, string: description, number: delay, optional function: condition",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeChatCommand = DarkRP.stub{
    name = "removeChatCommand",
    description = "Remove a chat command",
    parameters = {
        {
            name = "command",
            description = "The chat command to remove",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.chatCommandAlias = DarkRP.stub{
    name = "chatCommandAlias",
    description = "Create an alias for a chat command",
    parameters = {
        {
            name = "command",
            description = "An already existing chat command.",
            type = "string",
            optional = false
        },
        {
            name = "alias",
            description = "One or more aliases for the chat command.",
            type = "vararg",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getChatCommand = DarkRP.stub{
    name = "getChatCommand",
    description = "Get the information on a chat command.",
    parameters = {
        {
            name = "command",
            description = "The chat command",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "chatTable",
            description = "A table containing the information of the chat command.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getChatCommands = DarkRP.stub{
    name = "getChatCommands",
    description = "Get every chat command.",
    parameters = {

    },
    returns = {
        {
            name = "commands",
            description = "A table containing every command. Table indices are the command strings.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getSortedChatCommands = DarkRP.stub{
    name = "getSortedChatCommands",
    description = "Get every chat command, sorted by their name.",
    parameters = {

    },
    returns = {
        {
            name = "commands",
            description = "A table containing every command.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getIncompleteChatCommands = DarkRP.stub{
    name = "getIncompleteChatCommands",
    description = "chat commands that have been defined, but not declared. Information about these chat commands is missing.",
    parameters = {
    },
    returns = {
        {
            name = "commands",
            description = "A table containing the undeclared chat commands.",
            type = "table"
        }
    },
    metatable = DarkRP
}

--PATH gamemodes/mangarp/gamemode/modules/animations/sh_interface.lua:
DarkRP.addPlayerGesture = DarkRP.stub{
    name = "addPlayerGesture",
    description = "Add a player gesture to the DarkRP animations menu (the one that opens with the keys weapon.). Note: This function must be called BOTH serverside AND clientside!",
    parameters = {
        {
            name = "anim",
            description = "The gesture enumeration.",
            type = "number",
            optional = false
        },
        {
            name = "text",
            description = "The textual description of the animation. This is what players see on the button in the menu.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removePlayerGesture = DarkRP.stub{
    name = "removePlayerGesture",
    description = "Removes a player gesture from the DarkRP animations menu (the one that opens with the keys weapon.). Note: This function must be called BOTH serverside AND clientside!",
    parameters = {
        {
            name = "anim",
            description = "The gesture enumeration.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

--PATH gamemodes/mangarp/gamemode/modules/voting/cl_voting.lua:
local QuestionVGUI = {}
local PanelNum = 0
local VoteVGUI = {}
local function MsgDoVote(msg)
    local _, chatY = chat.GetChatBoxPos()

    local question = msg:ReadString()
    local voteid = msg:ReadShort()
    local timeleft = msg:ReadFloat()
    if timeleft == 0 then
        timeleft = 100
    end
    local OldTime = CurTime()
    if not IsValid(LocalPlayer()) then return end -- Sent right before player initialisation

    LocalPlayer():EmitSound("Town.d1_town_02_elevbell1", 100, 100)
    local panel = vgui.Create("DFrame")
    panel:SetPos(3 + PanelNum, chatY - 145)
    panel:SetTitle(DarkRP.getPhrase("vote"))
    panel:SetSize(140, 140)
    panel:SetSizable(false)
    panel.btnClose:SetVisible(false)
    panel.btnMaxim:SetVisible(false)
    panel.btnMinim:SetVisible(false)
    panel:SetDraggable(false)
    function panel:Close()
        PanelNum = PanelNum - 140
        VoteVGUI[voteid .. "vote"] = nil

        local num = 0
        for _, v in SortedPairs(VoteVGUI) do
            v:SetPos(num, ScrH() / 2 - 50)
            num = num + 140
        end

        for _, v in SortedPairs(QuestionVGUI) do
            v:SetPos(num, ScrH() / 2 - 50)
            num = num + 300
        end
        self:Remove()
    end

    function panel:Think()
        self:SetTitle(DarkRP.getPhrase("time", math.Clamp(math.ceil(timeleft - (CurTime() - OldTime)), 0, 9999)))
        if timeleft - (CurTime() - OldTime) <= 0 then
            panel:Close()
        end
    end

    panel:SetKeyboardInputEnabled(false)
    panel:SetMouseInputEnabled(true)
    panel:SetVisible(true)

    local label = vgui.Create("DLabel")
    label:SetParent(panel)
    label:SetPos(5, 25)
    label:SetText(DarkRP.textWrap(DarkRP.deLocalise(question), "DermaDefault", 130))
    label:SizeToContents()
    label:SetVisible(true)

    local nextHeight = label:GetTall() > 78 and label:GetTall() - 78 or 0 -- Make panel taller for divider and buttons
    panel:SetTall(panel:GetTall() + nextHeight)

    local divider = vgui.Create("Divider")
    divider:SetParent(panel)
    divider:SetPos(2, panel:GetTall() - 30)
    divider:SetSize(180, 2)
    divider:SetVisible(true)

    local ybutton = vgui.Create("Button")
    ybutton:SetParent(panel)
    ybutton:SetPos(25, panel:GetTall() - 25)
    ybutton:SetSize(40, 20)
    ybutton:SetCommand("!")
    ybutton:SetText(DarkRP.getPhrase("yes"))
    ybutton:SetVisible(true)
    ybutton.DoClick = function()
        LocalPlayer():ConCommand("vote " .. voteid .. " yea\n")
        panel:Close()
    end

    local nbutton = vgui.Create("Button")
    nbutton:SetParent(panel)
    nbutton:SetPos(70, panel:GetTall() - 25)
    nbutton:SetSize(40, 20)
    nbutton:SetCommand("!")
    nbutton:SetText(DarkRP.getPhrase("no"))
    nbutton:SetVisible(true)
    nbutton.DoClick = function()
        LocalPlayer():ConCommand("vote " .. voteid .. " nay\n")
        panel:Close()
    end

    PanelNum = PanelNum + 140
    VoteVGUI[voteid .. "vote"] = panel
    panel:SetSkin(GAMEMODE.Config.DarkRPSkin)
end
usermessage.Hook("DoVote", MsgDoVote)

local function KillVoteVGUI(msg)
    local id = msg:ReadShort()

    if VoteVGUI[id .. "vote"] and VoteVGUI[id .. "vote"]:IsValid() then
        VoteVGUI[id .. "vote"]:Close()
    end
end
usermessage.Hook("KillVoteVGUI", KillVoteVGUI)

local function MsgDoQuestion(msg)
    if not IsValid(LocalPlayer()) then return end

    local question = msg:ReadString()
    local quesid = msg:ReadString()
    local timeleft = msg:ReadFloat()
    if timeleft == 0 then
        timeleft = 100
    end
    local OldTime = CurTime()
    LocalPlayer():EmitSound("Town.d1_town_02_elevbell1", 100, 100)
    local panel = vgui.Create("DFrame")
    panel:SetPos(3 + PanelNum, ScrH() / 2 - 50) -- Times 140 because if the question is the second screen, the first screen is always a vote screen.
    panel:SetSize(300, 140)
    panel:SetSizable(false)
    panel.btnClose:SetVisible(false)
    panel.btnMaxim:SetVisible(false)
    panel.btnMinim:SetVisible(false)
    panel:SetKeyboardInputEnabled(false)
    panel:SetMouseInputEnabled(true)
    panel:SetVisible(true)

    function panel:Close()
        PanelNum = PanelNum - 300
        QuestionVGUI[quesid .. "ques"] = nil
        local num = 0
        for _, v in SortedPairs(VoteVGUI) do
            v:SetPos(num, ScrH() / 2 - 50)
            num = num + 140
        end

        for _, v in SortedPairs(QuestionVGUI) do
            v:SetPos(num, ScrH() / 2 - 50)
            num = num + 300
        end

        self:Remove()
    end

    function panel:Think()
        self:SetTitle(DarkRP.getPhrase("time", math.Clamp(math.ceil(timeleft - (CurTime() - OldTime)), 0, 9999)))
        if timeleft - (CurTime() - OldTime) <= 0 then
            panel:Close()
        end
    end

    local label = vgui.Create("DLabel")
    label:SetParent(panel)
    label:SetPos(5, 30)
    label:SetSize(380, 40)
    label:SetText(DarkRP.deLocalise(question))
    label:SetVisible(true)

    local divider = vgui.Create("Divider")
    divider:SetParent(panel)
    divider:SetPos(2, 80)
    divider:SetSize(380, 2)
    divider:SetVisible(true)

    local ybutton = vgui.Create("DButton")
    ybutton:SetParent(panel)
    ybutton:SetPos(105, 100)
    ybutton:SetSize(40, 20)
    ybutton:SetText(DarkRP.getPhrase("yes"))
    ybutton:SetVisible(true)
    ybutton.DoClick = function()
        LocalPlayer():ConCommand("ans " .. quesid .. " 1\n")
        panel:Close()
    end

    local nbutton = vgui.Create("DButton")
    nbutton:SetParent(panel)
    nbutton:SetPos(155, 100)
    nbutton:SetSize(40, 20)
    nbutton:SetText(DarkRP.getPhrase("no"))
    nbutton:SetVisible(true)
    nbutton.DoClick = function()
        LocalPlayer():ConCommand("ans " .. quesid .. " 2\n")
        panel:Close()
    end

    PanelNum = PanelNum + 300
    QuestionVGUI[quesid .. "ques"] = panel

    panel:SetSkin(GAMEMODE.Config.DarkRPSkin)
end
usermessage.Hook("DoQuestion", MsgDoQuestion)

local function KillQuestionVGUI(msg)
    local id = msg:ReadString()

    if QuestionVGUI[id .. "ques"] and QuestionVGUI[id .. "ques"]:IsValid() then
        QuestionVGUI[id .. "ques"]:Close()
    end
end
usermessage.Hook("KillQuestionVGUI", KillQuestionVGUI)

local function DoVoteAnswerQuestion(ply, cmd, args)
    if not args[1] then return end

    local vote = 0
    if tonumber(args[1]) == 1 or string.lower(args[1]) == "yes" or string.lower(args[1]) == "true" then vote = 1 end

    for k, v in pairs(VoteVGUI) do
        if IsValid(v) then
            local ID = string.sub(k, 1, -5)
            VoteVGUI[k]:Close()
            RunConsoleCommand("vote", ID, vote)
            return
        end
    end

    for k, v in pairs(QuestionVGUI) do
        if IsValid(v) then
            local ID = string.sub(k, 1, -5)
            QuestionVGUI[k]:Close()
            RunConsoleCommand("ans", ID, vote)
            return
        end
    end
end
concommand.Add("rp_vote", DoVoteAnswerQuestion)

--PATH gamemodes/mangarp/gamemode/modules/hud/cl_hud.lua:
--[[---------------------------------------------------------------------------
HUD ConVars
---------------------------------------------------------------------------]]
local ConVars = {}
local HUDWidth
local HUDHeight

local Color = Color
local CurTime = CurTime
local cvars = cvars
local DarkRP = DarkRP
local draw = draw
local GetConVar = GetConVar
local hook = hook
local IsValid = IsValid
local Lerp = Lerp
local localplayer
local math = math
local pairs = pairs
local ScrW, ScrH = ScrW, ScrH
local SortedPairs = SortedPairs
local string = string
local surface = surface
local table = table
local timer = timer
local tostring = tostring
local plyMeta = FindMetaTable("Player")

local colors = {}
colors.black = color_black
colors.blue = Color(0, 0, 255, 255)
colors.brightred = Color(200, 30, 30, 255)
colors.darkred = Color(0, 0, 70, 100)
colors.darkblack = Color(0, 0, 0, 200)
colors.gray1 = Color(0, 0, 0, 155)
colors.gray2 = Color(51, 58, 51,100)
colors.red = Color(255, 0, 0, 255)
colors.white = color_white
colors.white1 = Color(255, 255, 255, 200)

local function ReloadConVars()
    ConVars = {
        background = {0,0,0,100},
        Healthbackground = {0,0,0,200},
        Healthforeground = {140,0,0,180},
        HealthText = {255,255,255,200},
        Job1 = {0,0,150,200},
        Job2 = {0,0,0,255},
        salary1 = {0,150,0,200},
        salary2 = {0,0,0,255}
    }

    for name, Colour in pairs(ConVars) do
        ConVars[name] = {}
        for num, rgb in SortedPairs(Colour) do
            local CVar = GetConVar(name .. num) or CreateClientConVar(name .. num, rgb, true, false)
            table.insert(ConVars[name], CVar:GetInt())

            if not cvars.GetConVarCallbacks(name .. num, false) then
                cvars.AddChangeCallback(name .. num, function()
                    timer.Simple(0, ReloadConVars)
                end)
            end
        end
        ConVars[name] = Color(unpack(ConVars[name]))
    end


    HUDWidth =  (GetConVar("HudW") or CreateClientConVar("HudW", 240, true, false)):GetInt()
    HUDHeight = (GetConVar("HudH") or CreateClientConVar("HudH", 115, true, false)):GetInt()

    if not cvars.GetConVarCallbacks("HudW", false) and not cvars.GetConVarCallbacks("HudH", false) then
        cvars.AddChangeCallback("HudW", function() timer.Simple(0,ReloadConVars) end)
        cvars.AddChangeCallback("HudH", function() timer.Simple(0,ReloadConVars) end)
    end
end
ReloadConVars()

local Scrw, Scrh, RelativeX, RelativeY
--[[---------------------------------------------------------------------------
HUD separate Elements
---------------------------------------------------------------------------]]
local Health = 0
local function DrawHealth()
    local maxHealth = localplayer:GetMaxHealth()
    local myHealth = localplayer:Health()
    Health = math.min(maxHealth, (Health == myHealth and Health) or Lerp(0.1, Health, myHealth))

    local healthRatio = math.Min(Health / maxHealth, 1)
    local rounded = math.Round(3 * healthRatio)
    local Border = math.Min(6, rounded * rounded)
    draw.RoundedBox(Border, RelativeX + 4, RelativeY - 30, HUDWidth - 8, 20, ConVars.Healthbackground)
    draw.RoundedBox(Border, RelativeX + 5, RelativeY - 29, (HUDWidth - 9) * healthRatio, 18, ConVars.Healthforeground)

    draw.DrawNonParsedText(math.Max(0, math.Round(myHealth)), "DarkRPHUD2", RelativeX + 4 + (HUDWidth - 8) / 2, RelativeY - 32, ConVars.HealthText, 1)

    -- Armor
    local armor = math.Clamp(localplayer:Armor(), 0, 100)
    if armor ~= 0 then
        draw.RoundedBox(2, RelativeX + 4, RelativeY - 15, (HUDWidth - 8) * armor / 100, 5, colors.blue)
    end
end

local salaryText, JobWalletText
local function DrawInfo()
    salaryText = salaryText or DarkRP.getPhrase("salary", DarkRP.formatMoney(localplayer:getDarkRPVar("salary")), "")

    JobWalletText = JobWalletText or string.format("%s\n%s",
        DarkRP.getPhrase("job", localplayer:getDarkRPVar("job") or ""),
        DarkRP.getPhrase("wallet", DarkRP.formatMoney(localplayer:getDarkRPVar("money")), "")
    )

    draw.DrawNonParsedText(salaryText, "DarkRPHUD2", RelativeX + 5, RelativeY - HUDHeight + 6, ConVars.salary1, 0)
    draw.DrawNonParsedText(salaryText, "DarkRPHUD2", RelativeX + 4, RelativeY - HUDHeight + 5, ConVars.salary2, 0)

    surface.SetFont("DarkRPHUD2")
    local _, h = surface.GetTextSize(salaryText)

    draw.DrawNonParsedText(JobWalletText, "DarkRPHUD2", RelativeX + 5, RelativeY - HUDHeight + h + 6, ConVars.Job1, 0)
    draw.DrawNonParsedText(JobWalletText, "DarkRPHUD2", RelativeX + 4, RelativeY - HUDHeight + h + 5, ConVars.Job2, 0)
end

local Page = Material("icon16/page_white_text.png")
local function GunLicense()
    if localplayer:getDarkRPVar("HasGunlicense") then
        surface.SetMaterial(Page)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(RelativeX + HUDWidth, Scrh - 34, 32, 32)
    end
end

local agendaText
local function Agenda(gamemodeTable)
    local shouldDraw = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_Agenda")
    if shouldDraw == false then return end

    local agenda = localplayer:getAgendaTable()
    if not agenda then return end
    agendaText = agendaText or DarkRP.textWrap((localplayer:getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440)

    draw.RoundedBox(10, 10, 10, 460, 110, colors.gray1)
    draw.RoundedBox(10, 12, 12, 456, 106, colors.gray2)
    draw.RoundedBox(10, 12, 12, 456, 20, colors.darkred)

    draw.DrawNonParsedText(agenda.Title, "DarkRPHUD1", 30, 12, colors.red, 0)
    draw.DrawNonParsedText(agendaText, "DarkRPHUD1", 30, 35, colors.white, 0)
end

hook.Add("DarkRPVarChanged", "agendaHUD", function(ply, var, _, new)
    if ply ~= localplayer then return end
    if var == "agenda" and new then
        agendaText = DarkRP.textWrap(new:gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440)
    else
        agendaText = nil
    end

    if var == "salary" then
        salaryText = DarkRP.getPhrase("salary", DarkRP.formatMoney(new), "")
    end

    if var == "job" or var == "money" then
        JobWalletText = string.format("%s\n%s",
            DarkRP.getPhrase("job", var == "job" and new or localplayer:getDarkRPVar("job") or ""),
            DarkRP.getPhrase("wallet", var == "money" and DarkRP.formatMoney(new) or DarkRP.formatMoney(localplayer:getDarkRPVar("money")), "")
        )
    end
end)

local VoiceChatTexture = surface.GetTextureID("voice/icntlk_pl")
local function DrawVoiceChat(gamemodeTable)
    local shouldDraw = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_VoiceChat")
    if shouldDraw == false then return end

    if localplayer.DRPIsTalking then
        local _, chboxY = chat.GetChatBoxPos()

        local Rotating = math.sin(CurTime() * 3)
        local backwards = 0

        if Rotating < 0 then
            Rotating = 1 - (1 + Rotating)
            backwards = 180
        end

        surface.SetTexture(VoiceChatTexture)
        surface.SetDrawColor(ConVars.Healthforeground)
        surface.DrawTexturedRectRotated(Scrw - 100, chboxY, Rotating * 96, 96, backwards)
    end
end

local function LockDown(gamemodeTable)
    local chbxX, chboxY = chat.GetChatBoxPos()
    if GetGlobalBool("DarkRP_LockDown") then
        local shouldDraw = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_LockdownHUD")
        if shouldDraw == false then return end
        local cin = (math.sin(CurTime()) + 1) / 2
        local chatBoxSize = math.floor(Scrh / 4)
        draw.DrawNonParsedText(DarkRP.getPhrase("lockdown_started"), "ScoreboardSubtitle", chbxX, chboxY + chatBoxSize, Color(cin * 255, 0, 255 - (cin * 255), 255), TEXT_ALIGN_LEFT)
    end
end

local Arrested = function() end

usermessage.Hook("GotArrested", function(msg)
    local StartArrested = CurTime()
    local ArrestedUntil = msg:ReadFloat()

    Arrested = function(gamemodeTable)
        local shouldDraw = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_ArrestedHUD")
        if shouldDraw == false then return end

        if CurTime() - StartArrested <= ArrestedUntil and localplayer:getDarkRPVar("Arrested") then
            draw.DrawNonParsedText(DarkRP.getPhrase("youre_arrested", math.ceil((ArrestedUntil - (CurTime() - StartArrested)) * 1 / game.GetTimeScale())), "DarkRPHUD1", Scrw / 2, Scrh - Scrh / 12, colors.white, 1)
        elseif not localplayer:getDarkRPVar("Arrested") then
            Arrested = function() end
        end
    end
end)

local AdminTell = function() end

usermessage.Hook("AdminTell", function(msg)
    timer.Remove("DarkRP_AdminTell")
    local Message = msg:ReadString()

    AdminTell = function()
        draw.RoundedBox(4, 10, 10, Scrw - 20, 110, colors.darkblack)
        draw.DrawNonParsedText(DarkRP.getPhrase("listen_up"), "GModToolName", Scrw / 2 + 10, 10, colors.white, 1)
        draw.DrawNonParsedText(Message, "ChatFont", Scrw / 2 + 10, 90, colors.brightred, 1)
    end

    timer.Create("DarkRP_AdminTell", 10, 1, function()
        AdminTell = function() end
    end)
end)

--[[---------------------------------------------------------------------------
Drawing the HUD elements such as Health etc.
---------------------------------------------------------------------------]]
local function DrawHUD(gamemodeTable)
    local shouldDraw = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_HUD")
    if shouldDraw == false then return end

    Scrw, Scrh = ScrW(), ScrH()
    RelativeX, RelativeY = 0, Scrh

    shouldDraw = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_LocalPlayerHUD")
    shouldDraw = shouldDraw ~= false
    if shouldDraw then
        --Background
        draw.RoundedBox(6, 0, Scrh - HUDHeight, HUDWidth, HUDHeight, ConVars.background)
        DrawHealth()
        DrawInfo()
        GunLicense()
    end
    Agenda(gamemodeTable)
    DrawVoiceChat(gamemodeTable)
    LockDown(gamemodeTable)

    Arrested(gamemodeTable)
    AdminTell()
end

--[[---------------------------------------------------------------------------
Entity HUDPaint things
---------------------------------------------------------------------------]]
-- Draw a player's name, health and/or job above the head
-- This syntax allows for easy overriding
plyMeta.drawPlayerInfo = plyMeta.drawPlayerInfo or function(self)
    local pos = self:EyePos()

    pos.z = pos.z + 10 -- The position we want is a bit above the position of the eyes
    pos = pos:ToScreen()
    if not self:getDarkRPVar("wanted") then
        -- Move the text up a few pixels to compensate for the height of the text
        pos.y = pos.y - 50
    end

    if GAMEMODE.Config.showname then
        local nick, plyTeam = self:Nick(), self:Team()
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam) , 1)
    end

    if GAMEMODE.Config.showhealth then
        local health = DarkRP.getPhrase("health", math.max(0, self:Health()))
        draw.DrawNonParsedText(health, "DarkRPHUD2", pos.x + 1, pos.y + 21, colors.black, 1)
        draw.DrawNonParsedText(health, "DarkRPHUD2", pos.x, pos.y + 20, colors.white1, 1)
    end

    if GAMEMODE.Config.showjob then
        local teamname = self:getDarkRPVar("job") or team.GetName(self:Team())
        draw.DrawNonParsedText(teamname, "DarkRPHUD2", pos.x + 1, pos.y + 41, colors.black, 1)
        draw.DrawNonParsedText(teamname, "DarkRPHUD2", pos.x, pos.y + 40, colors.white1, 1)
    end

    if self:getDarkRPVar("HasGunlicense") then
        surface.SetMaterial(Page)
        surface.SetDrawColor(255,255,255,255)
        surface.DrawTexturedRect(pos.x-16, pos.y + 60, 32, 32)
    end
end

-- Draw wanted information above a player's head
-- This syntax allows for easy overriding
plyMeta.drawWantedInfo = plyMeta.drawWantedInfo or function(self)
    if not self:Alive() then return end

    local pos = self:EyePos()
    if not pos:isInSight({localplayer, self}) then return end

    pos.z = pos.z + 10
    pos = pos:ToScreen()

    if GAMEMODE.Config.showname then
        local nick, plyTeam = self:Nick(), self:Team()
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam) , 1)
    end

    local wantedText = DarkRP.getPhrase("wanted", tostring(self:getDarkRPVar("wantedReason")))

    draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x, pos.y - 40, colors.white1, 1)
    draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x + 1, pos.y - 41, colors.red, 1)
end

--[[---------------------------------------------------------------------------
The Entity display: draw HUD information about entities
---------------------------------------------------------------------------]]
local function DrawEntityDisplay(gamemodeTable)
    local shouldDraw, players = hook.Call("HUDShouldDraw", gamemodeTable, "DarkRP_EntityDisplay")
    if shouldDraw == false then return end

    local shootPos = localplayer:GetShootPos()
    local aimVec = localplayer:GetAimVector()

    for _, ply in ipairs(players or player.GetAll()) do
        if not IsValid(ply)
           or ply == localplayer
           or not ply:Alive()
           or ply:GetNoDraw()
           or ply:IsDormant()
           or ply:GetColor().a == 0 and (ply:GetRenderMode() == RENDERMODE_TRANSALPHA or ply:GetRenderMode() == RENDERMODE_TRANSCOLOR) then
           continue
        end
        local hisPos = ply:GetShootPos()
        if ply:getDarkRPVar("wanted") then ply:drawWantedInfo() end

        if gamemodeTable.Config.globalshow then
            ply:drawPlayerInfo()
        -- Draw when you're (almost) looking at him
        elseif hisPos:DistToSqr(shootPos) < 160000 then
            local pos = hisPos - shootPos
            local unitPos = pos:GetNormalized()
            if unitPos:Dot(aimVec) > 0.95 then
                local trace = util.QuickTrace(shootPos, pos, localplayer)
                if trace.Hit and trace.Entity ~= ply then
                    -- When the trace says you're directly looking at a
                    -- different player, that means you can draw /their/ info
                    if trace.Entity:IsPlayer() then
                        trace.Entity:drawPlayerInfo()
                    end
                    break
                end
                ply:drawPlayerInfo()
            end
        end
    end

    local ent = localplayer:GetEyeTrace().Entity

    if IsValid(ent) and ent:isKeysOwnable() and ent:GetPos():DistToSqr(localplayer:GetPos()) < 40000 then
        ent:drawOwnableInfo()
    end
end

--[[---------------------------------------------------------------------------
Drawing death notices
---------------------------------------------------------------------------]]
function GM:DrawDeathNotice(x, y)
    if not self.Config.showdeaths then return end
    self.Sandbox.DrawDeathNotice(self, x, y)
end

--[[---------------------------------------------------------------------------
Display notifications
---------------------------------------------------------------------------]]
local notificationSound = GM.Config.notificationSound
local function DisplayNotify(msg)
    local txt = msg:ReadString()
    GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
    surface.PlaySound(notificationSound)

    -- Log to client console
    MsgC(Color(255, 20, 20, 255), "[DarkRP] ", Color(200, 200, 200, 255), txt, "\n")
end
usermessage.Hook("_Notify", DisplayNotify)

--[[---------------------------------------------------------------------------
Remove some elements from the HUD in favour of the DarkRP HUD
---------------------------------------------------------------------------]]
local noDraw = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudSuitPower"] = true,
    ["CHUDQuickInfo"] = true
}
function GM:HUDShouldDraw(name)
    if noDraw[name] or (HelpToggled and name == "CHudChat") then
        return false
    else
        return self.Sandbox.HUDShouldDraw(self, name)
    end
end

--[[---------------------------------------------------------------------------
Disable players' names popping up when looking at them
---------------------------------------------------------------------------]]
function GM:HUDDrawTargetID()
    return false
end

--[[---------------------------------------------------------------------------
Actual HUDPaint hook
---------------------------------------------------------------------------]]
function GM:HUDPaint()
    localplayer = localplayer or LocalPlayer()

    DrawHUD(self)
    DrawEntityDisplay(self)

    self.Sandbox.HUDPaint(self)
end

--PATH gamemodes/mangarp/gamemode/modules/hobo/cl_hobo.lua:
hook.Add("PlayerBindPress", "Hobo sound", function(ply, bind, pressed)
    if ply == LocalPlayer() and ply:GetActiveWeapon():IsValid() and string.find(string.lower(bind), "attack2") and ply:GetActiveWeapon():GetClass() == "weapon_bugbait" then
        LocalPlayer():ConCommand("_hobo_emitsound")
    end
end)

--PATH gamemodes/mangarp/gamemode/modules/fpp/cl_fpp.lua:
include("pp/sh_settings.lua")
include("pp/client/menu.lua")
include("pp/client/hud.lua")
include("pp/client/buddies.lua")
include("pp/client/ownability.lua")
include("pp/sh_cppi.lua")

--PATH gamemodes/mangarp/gamemode/modules/fpp/pp/sh_settings.lua:
-- These are the default settings. Don't mind changing these.
FPP = FPP or {}

-- Don't reset the settings when they're already there
if FPP.Settings then
    return
end

FPP.Settings = {}
FPP.Settings.FPP_PHYSGUN1 = {
    toggle = 1,
    adminall = 1,
    worldprops = 0,
    adminworldprops = 1,
    canblocked = 0,
    admincanblocked = 0,
    shownocross = 1,
    checkconstrained = 1,
    reloadprotection = 1,
    iswhitelist = 0}
FPP.Settings.FPP_GRAVGUN1 = {
    toggle = 1,
    adminall = 1,
    worldprops = 1,
    adminworldprops = 1,
    canblocked = 0,
    admincanblocked = 0,
    shownocross = 1,
    checkconstrained = 1,
    noshooting = 1,
    iswhitelist = 0}
FPP.Settings.FPP_TOOLGUN1 = {
    toggle = 1,
    adminall = 1,
    worldprops = 0,
    adminworldprops = 0,
    canblocked = 0,
    admincanblocked = 0,
    shownocross = 1,
    checkconstrained = 1,
    iswhitelist = 0,

    duplicatorprotect = 1,
    duplicatenoweapons = 1,
    spawniswhitelist = 0,
    spawnadmincanweapon = 0,
    spawnadmincanblocked = 0}
FPP.Settings.FPP_PLAYERUSE1 = {
    toggle = 0,
    adminall = 1,
    worldprops = 1,
    adminworldprops = 1,
    canblocked = 0,
    admincanblocked = 1,
    shownocross = 1,
    checkconstrained = 0,
    iswhitelist = 0}
FPP.Settings.FPP_ENTITYDAMAGE1 = {
    toggle = 1,
    protectpropdamage = 1,
    adminall = 1,
    worldprops = 1,
    adminworldprops = 1,
    canblocked = 0,
    admincanblocked = 0,
    shownocross = 1,
    checkconstrained = 0,
    iswhitelist = 0}
FPP.Settings.FPP_GLOBALSETTINGS1 = {
    freezedisconnected = 0,
    cleanupdisconnected = 1,
    cleanupdisconnectedtime = 120,
    cleanupadmin = 1,
    antie2minge = 1}
FPP.Settings.FPP_ANTISPAM1 = {
    toggle = 1,
    antispawninprop = 0,
    bigpropantispam = 1,
    bigpropsize = 5.85,
    bigpropwait = 1.5,
    smallpropdowngradecount = 3,
    smallpropghostlimit = 2,
    smallpropdenylimit = 6,
    duplicatorlimit = 3
}
FPP.Settings.FPP_BLOCKMODELSETTINGS1 = {
    toggle = 1,
    propsonly = 0,
    iswhitelist = 0
}

FPP.InitialSettings = table.Copy(FPP.Settings)

function FPP.ForAllSettings(fn)
    -- Loop in sorted pairs for deterministic order
    for kind, sets in SortedPairs(FPP.Settings) do
        for setting, val in SortedPairs(sets) do
            if fn(kind, setting, val) then break end
        end
    end
end

--[[-------------------------------------------------------------------------
CAMI
Register the CAMI privilege
---------------------------------------------------------------------------]]
CAMI.RegisterPrivilege{
    Name = "FPP_Settings",
    MinAccess = "superadmin" -- By default only superadmins can change settings
}

CAMI.RegisterPrivilege{
    Name = "FPP_Cleanup",
    MinAccess = "admin"
}

CAMI.RegisterPrivilege{
    Name = "FPP_TouchOtherPlayersProps",
    MinAccess = "admin"
}

function FPP.calculatePlayerPrivilege(priv, callback)
    local plys = player.GetAll()
    local count = #plys

    for _, ply in ipairs(plys) do
        local function onRes(b)
            count = count - 1
            ply.FPP_Privileges = ply.FPPPrivileges or {}
            ply.FPP_Privileges[priv] = b

            if count == 0 then callback() end
        end
        CAMI.PlayerHasAccess(ply, priv, onRes)
    end
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/rcon/cl_init.lua:
FAdmin.StartHooks["00RCon"] = function()
    FAdmin.Access.AddPrivilege("RCon", 3)
    FAdmin.Commands.AddCommand("RCon", "<command>", "<args>")

    FAdmin.ScoreBoard.Server:AddServerAction("RCon", "fadmin/icons/rcon", Color(155, 0, 0, 255), function() return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "RCon") end,
    function(ply, button)
        Derma_StringRequest("RCon comand", "Enter a command to be run on the server. Note: a lot of commands are blocked and they will not work!", "",
            function(text) RunConsoleCommand("_FAdmin", "RCon", unpack(string.Explode(" ", text))) end)
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/cl_start.lua:
FAdmin.ScoreBoard = FAdmin.ScoreBoard or {}

local ScreenWidth, ScreenHeight = ScrW(), ScrH()

FAdmin.ScoreBoard.X = ScreenWidth * 0.05
FAdmin.ScoreBoard.Y = ScreenHeight * 0.025
FAdmin.ScoreBoard.Width = ScreenWidth * 0.9
FAdmin.ScoreBoard.Height = ScreenHeight * 0.95

FAdmin.ScoreBoard.Controls = FAdmin.ScoreBoard.Controls or {}
FAdmin.ScoreBoard.CurrentView = "Main"

FAdmin.ScoreBoard.Main = FAdmin.ScoreBoard.Main or {}
FAdmin.ScoreBoard.Main.Controls = FAdmin.ScoreBoard.Main.Controls or {}
FAdmin.ScoreBoard.Main.Logo = "gui/gmod_logo"

FAdmin.ScoreBoard.Player = FAdmin.ScoreBoard.Player or {}
FAdmin.ScoreBoard.Player.Controls = FAdmin.ScoreBoard.Player.Controls or {}
FAdmin.ScoreBoard.Player.Player = NULL
FAdmin.ScoreBoard.Player.Logo = "fadmin/back"

FAdmin.ScoreBoard.Server = FAdmin.ScoreBoard.Server or {}
FAdmin.ScoreBoard.Server.Controls = FAdmin.ScoreBoard.Server.Controls or {}
FAdmin.ScoreBoard.Server.Logo = "fadmin/back"

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/slap/cl_init.lua:
local Damages = {0, 1, 10, 50, 100, 500, 9999999--[[for the 12-year-olds]]}
local Repetitions = {[1] = "once", [5] = "5 times", [10] = "10 times", [50] = "50 times", [100] = "100 times"}

FAdmin.StartHooks["Slap"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "slap",
        hasTarget = true,
        message = {"instigator", " slapped ", "targets"},
    }

    FAdmin.Access.AddPrivilege("Slap", 2)
    FAdmin.Commands.AddCommand("Slap", nil, "<Player>", "[Amount]", "[Repetitions]")

    -- Right click option
    FAdmin.ScoreBoard.Main.AddPlayerRightClick("Slap", function(ply)
        RunConsoleCommand("_FAdmin", "Slap", ply:UserID())
    end)

    -- Slap option in player menu
    FAdmin.ScoreBoard.Player:AddActionButton("Slap", "fadmin/icons/slap", Color(255, 130, 0, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Slap", ply) end, function(ply)
        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Damage:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)
        menu:AddPanel(Title)

        for _, v in ipairs(Damages) do
            local SubMenu = menu:AddSubMenu(v, function() RunConsoleCommand("_FAdmin", "slap", ply:UserID(), v) end)

            local SubMenuTitle = vgui.Create("DLabel")
            SubMenuTitle:SetText("  " .. v .. " damage\n")
            SubMenuTitle:SetFont("UiBold")
            SubMenuTitle:SizeToContents()
            SubMenuTitle:SetTextColor(color_black)

            SubMenu:AddPanel(SubMenuTitle)

            for reps, Name in SortedPairs(Repetitions) do
                local uid = ply:UserID()
                SubMenu:AddOption(Name, function() RunConsoleCommand("_FAdmin", "slap", uid, v, reps) end)
            end
        end
        menu:Open()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/freeze/cl_init.lua:
FAdmin.StartHooks["Freeze"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "freeze",
        hasTarget = true,
        message = {"instigator", " froze ", "targets", " ", "extraInfo.1"},
        readExtraInfo = function()
            local time = net.ReadUInt(16)

            return {time == 0 and FAdmin.PlayerActions.commonTimes[time] or string.format("for %s", FAdmin.PlayerActions.commonTimes[time] or (time .. " seconds"))}
        end
    }

    FAdmin.Messages.RegisterNotification{
        name = "unfreeze",
        hasTarget = true,
        message = {"instigator", " unfroze ", "targets"},
    }


    FAdmin.Access.AddPrivilege("Freeze", 2)
    FAdmin.Commands.AddCommand("freeze", nil, "<Player>")
    FAdmin.Commands.AddCommand("unfreeze", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_frozen") then return "Unfreeze" end
        return "Freeze"
    end, function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_frozen") then return "fadmin/icons/freeze", "fadmin/icons/disable" end
        return "fadmin/icons/freeze"
    end, Color(255, 130, 0, 255),

    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Freeze", ply) end, function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_frozen") then
            FAdmin.PlayerActions.addTimeMenu(function(secs)
                RunConsoleCommand("_FAdmin", "freeze", ply:UserID(), secs)
                button:SetImage2("fadmin/icons/disable")
                button:SetText("Unfreeze")
                button:GetParent():InvalidateLayout()
            end)
        else
            RunConsoleCommand("_FAdmin", "unfreeze", ply:UserID())
        end

        button:SetImage2("null")
        button:SetText("Freeze")
        button:GetParent():InvalidateLayout()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/f4menu/cl_jobstab.lua:
--[[---------------------------------------------------------------------------
Vote/become job button
---------------------------------------------------------------------------]]
local PANEL = {}

function PANEL:Init()
    self.BaseClass.Init(self)
    self:SetFont("F4MenuFont02")
    self:SetTall(50)
end

function PANEL:setJob(job, closeFunc)
    if not job.team then
        self:SetVisible(false)
    elseif job.vote or job.RequiresVote and job.RequiresVote(LocalPlayer(), job.team) then
        self:SetVisible(true)
        self:SetText(DarkRP.getPhrase("create_vote_for_job"))
        self.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "darkrp", "vote" .. job.command)}
    else
        self:SetVisible(true)
        self:SetText(DarkRP.getPhrase("become_job"))
        self.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "darkrp", job.command)}
    end
end

local red, dark = Color(140, 0, 0, 180), Color(0, 0, 0, 200)
function PANEL:Paint(w, h)
    draw.RoundedBox(4, 0, 0, w, h, dark)
    draw.RoundedBox(4, 5, 5, w - 10, h - 10, red)
end

derma.DefineControl("F4MenuJobBecomeButton", "", PANEL, "DButton")

--[[---------------------------------------------------------------------------
Icon for the model choose panel
---------------------------------------------------------------------------]]
PANEL = {}

AccessorFunc(PANEL, "selected", "Selected", FORCE_BOOL)
AccessorFunc(PANEL, "depressed", "Depressed", FORCE_BOOL)
function PANEL:Init()
    self:SetSize(60, 60)
    self:SetText("")

    self.model = self.model or vgui.Create("ModelImage", self)
    self.model:SetSize(60, 60)
    self.model:SetPos(0, 0)
    self.model.OnMousePressed = fn.Partial(self.OnMousePressed, self)
    self.model.OnMouseReleased = fn.Partial(self.OnMouseReleased, self)
end

local gray = Color(140, 140, 140, 255)
function PANEL:Paint(w, h)
    if self:GetSelected() then
        draw.RoundedBox(4, 0, 0, w, h, red)
        draw.RoundedBox(4, 3, 3, w - 6, h - 6, gray)
        return
    end
    local depressed = self:GetDepressed()
    local x, y = depressed and 3 or 0, depressed and 3 or 0
    w, h = depressed and w - 6 or w, depressed and h - 6 or h
    draw.RoundedBox(4, x, y, w, h, gray)
end

function PANEL:OnMousePressed()
    self:SetDepressed(true)
    self.model:SetSize(50, 50)
    self.model:SetPos(5, 5)
end

function PANEL:OnMouseReleased()
    self:SetSelected(true)
    self:SetDepressed(false)
    self.hostPanel:onSelected(self)
    DarkRP.setPreferredJobModel(self.job.team, self.strModel)
end

function PANEL:updateInfo(job, model, host)
    self.hostPanel = host
    self.strModel = model
    self.model:SetModel(model, 1, "000000000")
    self.job = job
    self:SetTooltip(model)
end

derma.DefineControl("F4MenuChooseJobModelIcon", "", PANEL, "DButton")

--[[---------------------------------------------------------------------------
Choose model panel
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:Rebuild()
    if table.IsEmpty(self.iconList.Items) then return end

    local x = 0
    for _, item in pairs(self.iconList.Items) do
        item:SetPos(x)

        x = x + item:GetWide() + 2
    end
    self.iconList:GetCanvas():SetWide(x)
end

function PANEL:getScroll()
    return self.scroll
end

function PANEL:setScroll(scroll)
    local canvas = self.iconList:GetCanvas()
    local x, y = canvas:GetPos()
    local minScroll = 0
    local maxScroll = math.Max(self.iconList:GetWide(), canvas:GetWide()) - self.iconList:GetWide()

    self.scroll = math.Max(0, scroll)
    local scrollPos = math.Clamp(scroll * -62, -maxScroll, -minScroll)

    if scrollPos == x then
        self.scroll = math.Max(self.scroll - 1, 0)
        return
    end

    canvas:SetPos(scrollPos, y)
end

function PANEL:Init()
    self:SetTall(70)
    self:StretchRightTo(self:GetParent())

    self.scroll = 0

    self.leftButton = vgui.Create("F4MenuJobBecomeButton", self)
    self.leftButton:SetText("<")
    self.leftButton:SetWide(40)
    self.leftButton:Dock(LEFT)
    self.leftButton.DoClick = function(btn) self:setScroll(self:getScroll() - 1) end
    self.leftButton.DoDoubleClick = self.leftButton.DoClick

    self.rightButton = vgui.Create("F4MenuJobBecomeButton", self)
    self.rightButton:SetText(">")
    self.rightButton:SetWide(40)
    self.rightButton:Dock(RIGHT)
    self.rightButton.DoClick = function(btn) self:setScroll(self:getScroll() + 1) end
    self.rightButton.DoDoubleClick = self.rightButton.DoClick

    self.iconList = vgui.Create("DPanelList", self)

    self.iconList:EnableHorizontal(true)
    self.iconList.PerformLayout = fn.Partial(self.PerformLayout, self)
    self.iconList.Rebuild = fn.Curry(self.Rebuild, 2)(self)
end

function PANEL:PerformLayout()
    self.iconList:SetPos(40, 5)
    self.iconList:SetSize(self:GetWide() - 2 * 40, 60)
    self.iconList:GetCanvas():SetTall(60)
    self.iconList:Rebuild()
end

function PANEL:Paint(w, h)
    draw.RoundedBox(4, 0, 0, w, h, dark)
end

function PANEL:onSelected(item)
    for _,v in pairs(self.iconList.Items) do
        if v == item then continue end
        v:SetSelected(false)
        v.model:SetSize(60, 60)
        v.model:SetPos(0, 0)
    end
end

function PANEL:updateInfo(job)
    self.iconList:Clear()
    if not istable(job.model) then return end

    local preferredModel = DarkRP.getPreferredJobModel(job.team)
    for _, mdl in ipairs(job.model) do
        local btn = vgui.Create("F4MenuChooseJobModelIcon", self.iconList)
        btn:updateInfo(job, mdl, self)
        if preferredModel == mdl then
            btn:SetSelected(true)
            btn.model:SetSize(50, 50)
            btn.model:SetPos(5, 5)
        end
        self.iconList:AddItem(btn)
    end

    self.iconList:InvalidateLayout()
end

derma.DefineControl("F4MenuChooseJobModel", "", PANEL, "DPanel")

--[[---------------------------------------------------------------------------
Left panel for the jobs
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:Init()
    self:SetBackgroundColor(color_transparent)
    self:EnableVerticalScrollbar()
    self:SetSpacing(2)
    self.VBar.Paint = fn.Id
    self.VBar.btnUp.Paint = fn.Id
    self.VBar.btnDown.Paint = fn.Id
end

function PANEL:Refresh()
    for _,v in pairs(self.Items) do
        if v.Refresh then v:Refresh() end
    end
    self:InvalidateLayout()
end

function PANEL:Paint(w, h)
    if not self.category then return end
    draw.RoundedBox(4, 0, 0, w, h, color_white)
end

derma.DefineControl("F4EmptyPanel", "", PANEL, "DPanelList")

--[[---------------------------------------------------------------------------
Right panel for the jobs
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:Init()
    self.BaseClass.Init(self)

    self:SetPadding(10)
    self:DockPadding(5, 5, 5, 5)

    self.innerPanel = vgui.Create("F4EmptyPanel", self)
    self.innerPanel:SetPos(0, 0)

    self.lblTitle = vgui.Create("DLabel")
    self.lblTitle:SetFont("F4MenuFont02")
    self.innerPanel:AddItem(self.lblTitle)

    self.lblDescription = vgui.Create("DLabel")
    self.lblDescription:SetWide(self:GetWide() - 20)
    self.lblDescription:SetFont("Roboto Light")
    self.lblDescription:SetAutoStretchVertical(true)
    self.innerPanel:AddItem(self.lblDescription)

    self.filler = VGUIRect(0, 0, 0, 20)
    self.filler:SetColor(color_transparent)
    self.innerPanel:AddItem(self.filler)

    self.lblWeapons = vgui.Create("DLabel")
    self.lblWeapons:SetFont("F4MenuFont02")
    self.lblWeapons:SetText(DarkRP.getPhrase("F4guns"))
    self.lblWeapons:SizeToContents()
    self.lblWeapons:SetTall(50)
    self.innerPanel:AddItem(self.lblWeapons)

    self.lblSweps = vgui.Create("DLabel")
    self.lblSweps:SetAutoStretchVertical(true)
    self.lblSweps:SetFont("Roboto Light")
    self.innerPanel:AddItem(self.lblSweps)

    self.btnGetJob = vgui.Create("F4MenuJobBecomeButton", self)
    self.btnGetJob:Dock(BOTTOM)

    self.pnlChooseMdl = vgui.Create("F4MenuChooseJobModel", self)
    self.pnlChooseMdl:Dock(BOTTOM)

    self.job = {}
end

local black = Color(0, 0, 0, 170)
function PANEL:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, black)
end

-- functions for getting the weapon names from the job table
local getWepName = fn.FOr{fn.FAnd{weapons.Get, fn.Compose{fn.Curry(fn.GetValue, 2)("PrintName"), weapons.Get}}, fn.Id}
local getWeaponNames = fn.Curry(fn.Map, 2)(getWepName)
local weaponString = fn.Compose{fn.Curry(fn.Flip(table.concat), 2)("\n"), fn.Curry(fn.Seq, 2)(table.sort), getWeaponNames, table.Copy}
function PANEL:updateInfo(job)
    self.job = job

    self.lblTitle:SetText(job.name and DarkRP.deLocalise(job.name) or (job.team and "" or "No jobs available"))
    self.lblTitle:SizeToContents()

    local weps
    if not job.weapons then
        self.lblWeapons:SetText("")
        weps = ""
    else
        weps = weaponString(job.weapons)
        weps = weps ~= "" and weps or DarkRP.getPhrase("no_extra_weapons")
    end

    self.lblSweps:SetText(weps)

    self.btnGetJob:setJob(job, fn.Partial(self:GetParent():GetParent().Hide, self:GetParent():GetParent()))

    if istable(job.model) and #job.model > 1 and (not isfunction(job.PlayerSetModel) or not job.PlayerSetModel(LocalPlayer())) then
        self.pnlChooseMdl:updateInfo(job)
        self.pnlChooseMdl:SetVisible(true)
    else
        self.pnlChooseMdl:SetVisible(false)
    end

    self:InvalidateLayout()
end

function PANEL:PerformLayout()
    local text = DarkRP.textWrap(DarkRP.deLocalise(self.job.description or ""):gsub('\t', ''), "Roboto Light", self:GetWide() - 43)
    surface.SetFont("Roboto Light")
    local _, h = surface.GetTextSize(text)
    self.BaseClass.PerformLayout(self)

    self.innerPanel:SetPos(3, 3)
    self.innerPanel:SetSize(self:GetWide() - 6, self:GetTall() - self.pnlChooseMdl:GetTall() - self.btnGetJob:GetTall() - 13)
    self.innerPanel:InvalidateLayout()
    self.lblDescription:SetText(text)
    self.lblDescription:SetTall(h)
end

derma.DefineControl("F4JobsPanelRight", "", PANEL, "F4EmptyPanel")


--[[---------------------------------------------------------------------------
Jobs panel
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:Init()
    self.pnlLeft = vgui.Create("F4EmptyPanel", self)
    self.pnlLeft:Dock(LEFT)

    self.pnlRight = vgui.Create("F4JobsPanelRight", self)
    self.pnlRight:Dock(RIGHT)

    self:fillData()
end

function PANEL:PerformLayout()
    self.pnlLeft:SetWide(self:GetWide() * 2 / 3 - 5)
    if not self.pnlRight then return end
    self.pnlRight:SetWide(self:GetWide() * 1 / 3 - 5)
end

PANEL.Paint = fn.Id

function PANEL:Refresh()
    self.pnlLeft:Refresh()

    if not self.pnlLeft.Items then self.pnlRight:updateInfo({}) return end

    -- don't refresh if still valid
    if not table.IsEmpty(self.pnlRight.job) then return end

    local job
    for _, cat in ipairs(self.pnlLeft:GetItems()) do
        for _, v in pairs(cat:GetItems()) do
            if v:GetDisabled() then continue end
            job = v.DarkRPItem
            goto break2
        end
    end
    ::break2::
    self.pnlRight:updateInfo(job or {})
end

function PANEL:fillData()
    local categories = DarkRP.getCategories().jobs

    for _, cat in pairs(categories) do
        local dCat = vgui.Create("F4MenuCategory", self)

        dCat:SetButtonFactory(function(item, ui)
            local pnl = vgui.Create("F4MenuJobButton", ui)
            pnl:setDarkRPItem(item)
            pnl.DoClick = fc{fp{self.pnlRight.updateInfo, self.pnlRight}, fp{fn.GetValue, "DarkRPItem", pnl}}

            pnl:Refresh()
            return pnl
        end)

        dCat:SetPerformLayout(function(contents)

        end)

        dCat:SetCategory(cat)
        self.pnlLeft:AddItem(dCat)
    end
end

derma.DefineControl("F4MenuJobs", "", PANEL, "DPanel")

--PATH gamemodes/mangarp/gamemode/modules/f4menu/cl_frame.lua:
--[[---------------------------------------------------------------------------
F4 tab
---------------------------------------------------------------------------]]
local PANEL = {}

function PANEL:Init()
    self.BaseClass.Init(self)
end

local gray = Color(110, 110, 110, 255)
function PANEL:Paint(w, h)
    local drawFunc = self:GetSkin().tex.TabT_Inactive

    if self:GetDisabled() then
        drawFunc(0, 0, w, h, gray)
        return
    end
    self.BaseClass.Paint(self, w, h)
end

function PANEL:ApplySchemeSettings()
    local ExtraInset = 10

    if self.Image then
        ExtraInset = ExtraInset + self.Image:GetWide()
    end

    local Active = self:GetPropertySheet():GetActiveTab() == self

    self:SetTextInset(ExtraInset, 4)
    local w, h = self:GetContentSize()
    h = Active and 38 or 30

    self:SetSize(w + 30, h)

    DLabel.ApplySchemeSettings(self)
end

derma.DefineControl("F4MenuTab", "", PANEL, "DTab")



--[[---------------------------------------------------------------------------
F4 tab sheet
---------------------------------------------------------------------------]]

PANEL = {}

local mouseX, mouseY = ScrW() / 2, ScrH() / 2
function PANEL:Init()
    self.F4Down = true

    self:StretchToParent(100, 100, 100, 100)
    self:Center()
    self:SetVisible(true)
    self:MakePopup()
    self:SetupCloseButton(fn.Curry(self.Hide, 2)(self))
    self:ParentToHUD()
end

function PANEL:SetupCloseButton(func)
    self.CloseButton = self.tabScroller:Add("DButton")
    self.CloseButton:SetText("")
    self.CloseButton.DoClick = func
    self.CloseButton.Paint = function(panel, w, h) derma.SkinHook("Paint", "WindowCloseButton", panel, w, h) end
    self.CloseButton:Dock(RIGHT)
    self.CloseButton:DockMargin(0, 0, 0, 8)
    self.CloseButton:SetSize(32, 32)
end

function PANEL:AddSheet(label, panel, material, NoStretchX, NoStretchY, Tooltip, order)
    if not IsValid(panel) then return end

    local sheet = {}

    sheet.Name = label

    sheet.Tab = vgui.Create("F4MenuTab", self)
    sheet.Tab:Setup(label, self, panel, material)
    sheet.Tab:SetTooltip(Tooltip)
    sheet.Tab:SetFont("DarkRPHUD2")

    sheet.Panel = panel
    sheet.Panel.tab = sheet.Tab
    sheet.Panel.NoStretchX = NoStretchX
    sheet.Panel.NoStretchY = NoStretchY
    sheet.Panel:SetPos(self:GetPadding(), sheet.Tab:GetTall() + 8 + self:GetPadding())
    sheet.Panel:SetVisible(false)
    if sheet.Panel.shouldHide and sheet.Panel:shouldHide() then sheet.Tab:SetDisabled(true) end

    panel:SetParent(self)

    local index = #self.Items + 1
    if order then
        table.insert(self.Items, order, sheet)
        index = order
    else
        table.insert(self.Items, sheet)
    end

    if not self:GetActiveTab() then
        self:SetActiveTab(sheet.Tab)
        sheet.Panel:SetVisible(true)
    end

    if order then
        table.insert(self.tabScroller.Panels, order, sheet.Tab)
        sheet.Tab:SetParent(self.tabScroller.pnlCanvas)
        self.tabScroller:InvalidateLayout(true)
    else
        self.tabScroller:AddPanel(sheet.Tab)
    end

    if panel.Refresh then panel:Refresh() end

    return sheet, index
end

local F4Bind
function PANEL:Think()
    self.CloseButton:SetVisible(not self.tabScroller.btnRight:IsVisible())

    F4Bind = F4Bind or input.KeyNameToNumber(input.LookupBinding("gm_showspare2"))
    if not F4Bind then return end

    if self.F4Down and not input.IsKeyDown(F4Bind) then
        self.F4Down = false
        return
    elseif not self.F4Down and input.IsKeyDown(F4Bind) then
        self.F4Down = true
        self:Hide()
    end
end

hook.Add("PlayerBindPress", "DarkRPF4Bind", function(ply, bind, pressed)
    if string.find(bind, "gm_showspare2", 1, true) then
        F4Bind = input.KeyNameToNumber(input.LookupBinding(bind))
    end
end)

function PANEL:Refresh()
    for _, v in pairs(self.Items) do
        if v.Panel.shouldHide and v.Panel:shouldHide() then v.Tab:SetDisabled(true)
        else v.Tab:SetDisabled(false) end
        if v.Panel.Refresh then v.Panel:Refresh() end
    end
end

function PANEL:Show()
    self:Refresh()
    if not table.IsEmpty(self.Items) and self:GetActiveTab() and self:GetActiveTab():GetDisabled() then
        self:SetActiveTab(self.Items[1].Tab) --Jobs
    end
    self.F4Down = true
    self:SetVisible(true)
    gui.SetMousePos(mouseX, mouseY)
end

function PANEL:Hide()
    mouseX, mouseY = gui.MousePos()
    self:SetVisible(false)
end

function PANEL:Close()
    self:Hide()
end

function PANEL:createTab(name, panel, order)
    local sheet, index = self:AddSheet(name, panel, nil, nil, nil, nil, order)
    return index, sheet
end

function PANEL:removeTab(name)
    for _, v in pairs(self.Items) do
        if v.Tab:GetText() ~= name then continue end
        return self:CloseTab(v.Tab, true)
    end
end

function PANEL:switchTabOrder(tab1, tab2)
    self.Items[tab1], self.Items[tab2] = self.Items[tab2], self.Items[tab1]
    self.tabScroller.Panels[tab1], self.tabScroller.Panels[tab2] = self.tabScroller.Panels[tab2], self.tabScroller.Panels[tab1]
    self.tabScroller:InvalidateLayout(true)
end


function PANEL:generateTabs()
    DarkRP.hooks.F4MenuTabs()
    hook.Call("F4MenuTabs")
    self:SetSkin(GAMEMODE.Config.DarkRPSkin)
end

derma.DefineControl("F4EditablePropertySheet", "", vgui.GetControlTable("DPropertySheet"), "EditablePanel")
derma.DefineControl("F4MenuFrame", "", PANEL, "F4EditablePropertySheet")

--PATH gamemodes/mangarp/gamemode/modules/doorsystem/cl_doors.lua:
local meta = FindMetaTable("Entity")
local black = color_black
local white = Color(255, 255, 255, 200)
local red = Color(128, 30, 30, 255)
local changeDoorAccess = false

local function updatePrivs()
    CAMI.PlayerHasAccess(LocalPlayer(), "DarkRP_ChangeDoorSettings", function(b, _)
        changeDoorAccess = b
    end)
end
-- Timer due to lack of "on privilege changed" hook
hook.Add("InitPostEntity", "Load door privileges", function()
    updatePrivs()
    timer.Create("Door changeDoorAccess checker", 1, 0, updatePrivs)
end)

function meta:drawOwnableInfo()
    local ply = LocalPlayer()
    if ply:InVehicle() and not ply:GetAllowWeaponsInVehicle() then return end

    -- Look, if you want to change the way door ownership is drawn, don't edit this file, use the hook instead!
    local doorDrawing = hook.Call("HUDDrawDoorData", nil, self)
    if doorDrawing == true then return end

    local blocked = self:getKeysNonOwnable()
    local doorTeams = self:getKeysDoorTeams()
    local doorGroup = self:getKeysDoorGroup()
    local playerOwned = self:isKeysOwned() or table.GetFirstValue(self:getKeysCoOwners() or {}) ~= nil
    local owned = playerOwned or doorGroup or doorTeams

    local doorInfo = {}

    local title = self:getKeysTitle()
    if title then table.insert(doorInfo, title) end

    if owned then
        table.insert(doorInfo, DarkRP.getPhrase("keys_owned_by"))
    end

    if playerOwned then
        if self:isKeysOwned() then table.insert(doorInfo, self:getDoorOwner():Nick()) end
        for k in pairs(self:getKeysCoOwners() or {}) do
            local ent = Player(k)
            if not IsValid(ent) or not ent:IsPlayer() then continue end
            table.insert(doorInfo, ent:Nick())
        end

        local allowedCoOwn = self:getKeysAllowedToOwn()
        if allowedCoOwn and not fn.Null(allowedCoOwn) then
            table.insert(doorInfo, DarkRP.getPhrase("keys_other_allowed"))

            for k in pairs(allowedCoOwn) do
                local ent = Player(k)
                if not IsValid(ent) or not ent:IsPlayer() then continue end
                table.insert(doorInfo, ent:Nick())
            end
        end
    elseif doorGroup then
        table.insert(doorInfo, doorGroup)
    elseif doorTeams then
        for k, v in pairs(doorTeams) do
            if not v or not RPExtraTeams[k] then continue end

            table.insert(doorInfo, RPExtraTeams[k].name)
        end
    elseif blocked and changeDoorAccess then
        table.insert(doorInfo, DarkRP.getPhrase("keys_allow_ownership"))
    elseif not blocked then
        table.insert(doorInfo, DarkRP.getPhrase("keys_unowned"))
        if changeDoorAccess then
            table.insert(doorInfo, DarkRP.getPhrase("keys_disallow_ownership"))
        end
    end

    if self:IsVehicle() then
        local driver = self:GetDriver()
        if driver:IsPlayer() then
            table.insert(doorInfo, DarkRP.getPhrase("driver", driver:Nick()))
        end
    end

    local x, y = ScrW() / 2, ScrH() / 2
    local text = table.concat(doorInfo, "\n")
    draw.DrawNonParsedText(text, "Roboto20", x , y + 1 , black, 1)
    draw.DrawNonParsedText(text, "Roboto20", x, y, (blocked or owned) and white or red, 1)
end


--[[---------------------------------------------------------------------------
Door data
---------------------------------------------------------------------------]]
DarkRP.doorData = DarkRP.doorData or {}

--[[---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------]]
function meta:getDoorData()
    local doorData = DarkRP.doorData[self:EntIndex()] or {}

    self.DoorData = doorData -- Backwards compatibility

    return doorData
end

--[[---------------------------------------------------------------------------
Networking
---------------------------------------------------------------------------]]

--[[---------------------------------------------------------------------------
Retrieve all the data for all doors
---------------------------------------------------------------------------]]
local function retrieveAllDoorData(len)
    local count = net.ReadUInt(16)

    for i = 1, count do
        local ix = net.ReadUInt(16)
        local varCount = net.ReadUInt(8)

        DarkRP.doorData[ix] = DarkRP.doorData[ix] or {}

        for vc = 1, varCount do
            local name, value = DarkRP.readNetDoorVar()
            DarkRP.doorData[ix][name] = value
        end
    end
end
net.Receive("DarkRP_AllDoorData", retrieveAllDoorData)

--[[---------------------------------------------------------------------------
Update changed variables
---------------------------------------------------------------------------]]
local function updateDoorData()
    local door = net.ReadUInt(32)

    DarkRP.doorData[door] = DarkRP.doorData[door] or {}

    local var, value = DarkRP.readNetDoorVar()

    DarkRP.doorData[door][var] = value
end
net.Receive("DarkRP_UpdateDoorData", updateDoorData)

--[[---------------------------------------------------------------------------
Set a value of a single doorvar to nil
---------------------------------------------------------------------------]]
local function removeDoorVar()
    local door = net.ReadUInt(16)
    local id = net.ReadUInt(8)

    local name = id == 0 and net.ReadString() or DarkRP.getDoorVars()[id].name

    if not DarkRP.doorData[door] then return end
    DarkRP.doorData[door][name] = nil
end
net.Receive("DarkRP_RemoveDoorVar", removeDoorVar)

--[[---------------------------------------------------------------------------
Remove doordata of removed entity
---------------------------------------------------------------------------]]
local function removeDoorData()
    local door = net.ReadUInt(32)
    DarkRP.doorData[door] = nil
end
net.Receive("DarkRP_RemoveDoorData", removeDoorData)

--PATH gamemodes/mangarp/gamemode/modules/deathpov/cl_init.lua:
local view = {
    origin = Vector(0, 0, 0),
    angles = Angle(0, 0, 0),
    fov = 90,
    znear = 1
}

local deathpov = GM.Config.deathpov
hook.Add("CalcView", "rp_deathPOV", function(ply, origin, angles, fov)
    -- Entity:Alive() is being slow as hell, we might actually see ourselves from third person for frame or two
    if not deathpov or ply:Health() > 0 then return end

    local Ragdoll = ply:GetRagdollEntity()
    if not IsValid(Ragdoll) then return end

    local head = Ragdoll:LookupAttachment("eyes")
    head = Ragdoll:GetAttachment(head)
    if not head or not head.Pos then return end

    if not Ragdoll.BonesRattled then
        Ragdoll.BonesRattled = true

        Ragdoll:InvalidateBoneCache()
        Ragdoll:SetupBones()

        local matrix

        for bone = 0, (Ragdoll:GetBoneCount() or 1) do
            if Ragdoll:GetBoneName(bone):lower():find("head") then
                matrix = Ragdoll:GetBoneMatrix(bone)
                break
            end
        end

        if IsValid(matrix) then
            matrix:SetScale(Vector(0, 0, 0))
        end
    end

    view.origin = head.Pos + head.Ang:Up() * 8
    view.angles = head.Ang

    return view
end)

--PATH gamemodes/mangarp/gamemode/modules/base/sh_util.lua:
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

    local config = GAMEMODE.Config

    local negative = n < 0

    n = tostring(math.abs(n))

    local dp = string.find(n, ".", 1, true) or #n + 1

    for i = dp - 4, 1, -3 do
        n = n:sub(1, i) .. config.currencyThousandSeparator .. n:sub(i + 1)
    end

    -- Make sure the amount is padded with zeroes
    if n[#n - 1] == "." then
        n = n .. "0"
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
            if IsValid(Player(PlayerInfo)) and not found[Player(PlayerInfo)] then
                found[Player(PlayerInfo)] = true
                players = players or {}
                table.insert(players, Player(PlayerInfo))
            end
            continue
        end

        for _, v in ipairs(pls) do
            -- Prevend duplicates
            if found[v] then continue end

            -- Find by Steam ID
            if (PlayerInfo == v:SteamID() or v:SteamID() == "UNKNOWN") or
            -- Find by Partial Nick
            string.find(string.lower(v:Nick()), string.lower(tostring(PlayerInfo)), 1, true) ~= nil or
            -- Find by steam name
            (v.SteamName and string.find(string.lower(v:SteamName()), string.lower(tostring(PlayerInfo)), 1, true) ~= nil) then
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

--PATH gamemodes/mangarp/gamemode/modules/base/sh_playerclass.lua:
local PLAYER_CLASS = {}

-- Value of -1 = set to config value, if a corresponding setting exists
PLAYER_CLASS.DisplayName = "DarkRP Base Player Class"
PLAYER_CLASS.WalkSpeed = -1
PLAYER_CLASS.RunSpeed = -1
PLAYER_CLASS.DuckSpeed = 0.3
PLAYER_CLASS.UnDuckSpeed = 0.3
PLAYER_CLASS.TeammateNoCollide = false
PLAYER_CLASS.StartHealth = -1

function PLAYER_CLASS:Loadout()
    -- Let gamemode decide
end

function PLAYER_CLASS:SetModel()
    -- Let gamemode decide
end

function PLAYER_CLASS:ShouldDrawLocal()
    -- Let gamemode decide
end

function PLAYER_CLASS:CreateMove(cmd)
    -- Let gamemode decide
end

function PLAYER_CLASS:CalcView(view)
    -- Let gamemode decide
end

function PLAYER_CLASS:GetHandsModel()
    -- Let gamemode decide
end

function PLAYER_CLASS:StartMove(mv, cmd)
    -- Let gamemode decide
end

function PLAYER_CLASS:FinishMove(mv)
    -- Let gamemode decide
end

player_manager.RegisterClass("player_darkrp", PLAYER_CLASS, "player_sandbox")

--PATH gamemodes/mangarp/gamemode/modules/base/cl_drawfunctions.lua:
-- concatenate a space to avoid the text being parsed as valve string
local function safeText(text)
    return string.match(text, "^#([a-zA-Z_]+)$") and text .. " " or text
end

DarkRP.deLocalise = safeText

function draw.DrawNonParsedText(text, font, x, y, color, xAlign)
    return draw.DrawText(safeText(text), font, x, y, color, xAlign)
end

function draw.DrawNonParsedSimpleText(text, font, x, y, color, xAlign, yAlign)
    return draw.SimpleText(safeText(text), font, x, y, color, xAlign, yAlign)
end

function draw.DrawNonParsedSimpleTextOutlined(text, font, x, y, color, xAlign, yAlign, outlineWidth, outlineColor)
    return draw.SimpleTextOutlined(safeText(text), font, x, y, color, xAlign, yAlign, outlineWidth, outlineColor)
end

function surface.DrawNonParsedText(text)
    return surface.DrawText(safeText(text))
end

function chat.AddNonParsedText(...)
    local tbl = {...}
    for i = 2, #tbl, 2 do
        tbl[i] = safeText(tbl[i])
    end
    return chat.AddText(unpack(tbl))
end

--PATH gamemodes/mangarp/gamemode/config/jobrelated.lua:
-- People often copy jobs. When they do, the GM table does not exist anymore.
-- This line makes the job code work both inside and outside of gamemode files.
-- You should not copy this line into your code.
local GAMEMODE = GAMEMODE or GM
--[[--------------------------------------------------------
Default teams. Please do not edit this file. Please use the darkrpmod addon instead.
--------------------------------------------------------]]
TEAM_CITIZEN = DarkRP.createJob("Citoyen", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_civil3.mdl"
    },
    description = [[Le Citoyen est le niveau le plus bas de la société que vous pouvez occuper, à part être un sans-abri. Vous n'avez aucun rôle spécifique dans la vie de la ville.]],
    weapons = {},
    command = "citizen",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_BARNIGHTCLUB = DarkRP.createJob("Bar / Night Club", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_armor29.mdl"
    },
    description = [[Un barman prépare et sert des boissons, accueille et conseille les clients, encaisse les paiements, gère les stocks et veille à la propreté du bar.]],
    weapons = {},
    command = "barnightclub",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_STYLISTE = DarkRP.createJob("Styliste", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male1.mdl"
    },
    description = [[Un styliste crée et coordonne des tenues en suivant les tendances de la mode et les préférences de ses clients ou des marques.]],
    weapons = {},
    command = "styliste",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_ASSOCIATION = DarkRP.createJob("Association", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_armor29.mdl"
    },
    description = [[Vous faite parti de l'association !]],
    weapons = {"mad_asso_detecteur"},
    command = "association",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_MINEUR = DarkRP.createJob("Mineur", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_armor29.mdl"
    },
    description = [[Vous êtes Mineur !]],
    weapons = {"buellost_pioche"},
    command = "mineur",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_CULTE = DarkRP.createJob("Culte", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_armor31.mdl"
    },
    description = [[Mec brezon.]],
    weapons = {},
    command = "culte",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_COIFFEUR = DarkRP.createJob("Coiffeur", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male1.mdl"
    },
    description = [[Un coiffeur coupe, coiffe, et traite les cheveux de ses clients en fonction de leurs préférences et des tendances actuelles.]],
    weapons = {},
    command = "coiffeur",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_CRISTAUX = DarkRP.createJob("Vendeur de Cristaux", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_armor29.mdl"
    },
    description = [[Un vendeur de cristaux rachète et vend divers types de cristaux, en conseillant les clients sur leurs propriétés et bienfaits potentiels.]],
    weapons = {},
    command = "cristaux",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_CITIZEN2 = DarkRP.createJob("Citoyen - VIP", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/mad_models/mad_sl_male_civil3.mdl"
    },
    description = [[Merci les clients fidèle...]],
    weapons = {},
    command = "citizenvip",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    customCheck = function(ply) 
        return table.HasValue({"vip"}, ply:GetUserGroup()) 
    end,
    CustomCheckFailMsg = "JOB VIP !",
    category = "Citizens",
})

TEAM_POLICE = DarkRP.createJob("Civil Protection", {
    color = Color(25, 25, 170, 255),
    model = {"models/player/police.mdl", "models/player/police_fem.mdl"},
    description = [[The protector of every citizen that lives in the city.
        You have the power to arrest criminals and protect innocents.
        Hit a player with your arrest baton to put them in jail.
        Bash a player with a stunstick and they may learn to obey the law.
        The Battering Ram can break down the door of a criminal, with a warrant for their arrest.
        The Battering Ram can also unfreeze frozen props (if enabled).
        Type /wanted <name> to alert the public to the presence of a criminal.]],
    weapons = {"arrest_stick", "unarrest_stick", "weapon_glock2", "stunstick", "door_ram", "weaponchecker"},
    command = "cp",
    max = 4,
    salary = GAMEMODE.Config.normalsalary * 1.45,
    admin = 0,
    vote = true,
    hasLicense = true,
    ammo = {
        ["pistol"] = 60,
    },
    category = "Civil Protection",
})

TEAM_GANG = DarkRP.createJob("Gangster", {
    color = Color(75, 75, 75, 255),
    model = {
        "models/player/Group03/Female_01.mdl",
        "models/player/Group03/Female_02.mdl",
        "models/player/Group03/Female_03.mdl",
        "models/player/Group03/Female_04.mdl",
        "models/player/Group03/Female_06.mdl",
        "models/player/group03/male_01.mdl",
        "models/player/Group03/Male_02.mdl",
        "models/player/Group03/male_03.mdl",
        "models/player/Group03/Male_04.mdl",
        "models/player/Group03/Male_05.mdl",
        "models/player/Group03/Male_06.mdl",
        "models/player/Group03/Male_07.mdl",
        "models/player/Group03/Male_08.mdl",
        "models/player/Group03/Male_09.mdl"},
    description = [[The lowest person of crime.
        A gangster generally works for the Mobboss who runs the crime family.
        The Mob boss sets your agenda and you follow it or you might be punished.]],
    weapons = {},
    command = "gangster",
    max = 3,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

TEAM_MOB = DarkRP.createJob("Mob boss", {
    color = Color(25, 25, 25, 255),
    model = "models/player/gman_high.mdl",
    description = [[The Mob boss is the boss of the criminals in the city.
        With their power they coordinate the gangsters and form an efficient crime organization.
        They have the ability to break into houses by using a lockpick.
        The Mob boss posesses the ability to unarrest you.]],
    weapons = {"lockpick", "unarrest_stick"},
    command = "mobboss",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.34,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

TEAM_GUN = DarkRP.createJob("Gun Dealer", {
    color = Color(255, 140, 0, 255),
    model = "models/player/monk.mdl",
    description = [[A Gun Dealer is the only person who can sell guns to other people.
        Make sure you aren't caught selling illegal firearms to the public! You might get arrested!]],
    weapons = {},
    command = "gundealer",
    max = 2,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
})

TEAM_MEDIC = DarkRP.createJob("Medic", {
    color = Color(47, 79, 79, 255),
    model = "models/player/kleiner.mdl",
    description = [[With your medical knowledge you work to restore players to full health.
        Without a medic, people cannot be healed.
        Left click with the Medical Kit to heal other players.
        Right click with the Medical Kit to heal yourself.]],
    weapons = {"med_kit"},
    command = "medic",
    max = 3,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    medic = true,
    category = "Citizens",
})

TEAM_CHIEF = DarkRP.createJob("Civil Protection Chief", {
    color = Color(20, 20, 255, 255),
    model = "models/player/combine_soldier_prisonguard.mdl",
    description = [[The Chief is the leader of the Civil Protection unit.
        Coordinate the police force to enforce law in the city.
        Hit a player with arrest baton to put them in jail.
        Bash a player with a stunstick and they may learn to obey the law.
        The Battering Ram can break down the door of a criminal, with a warrant for their arrest.
        Type /wanted <name> to alert the public to the presence of a criminal.
        Type /jailpos to set the Jail Position]],
    weapons = {"arrest_stick", "unarrest_stick", "weapon_deagle2", "stunstick", "door_ram", "weaponchecker"},
    command = "chief",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.67,
    admin = 0,
    vote = false,
    hasLicense = true,
    chief = true,
    NeedToChangeFrom = TEAM_POLICE,
    ammo = {
        ["pistol"] = 60,
    },
    category = "Civil Protection",
})

TEAM_MAYOR = DarkRP.createJob("Mayor", {
    color = Color(150, 20, 20, 255),
    model = "models/player/breen.mdl",
    description = [[The Mayor of the city creates laws to govern the city.
    If you are the mayor you may create and accept warrants.
    Type /wanted <name>  to warrant a player.
    Type /jailpos to set the Jail Position.
    Type /lockdown initiate a lockdown of the city.
    Everyone must be inside during a lockdown.
    The cops patrol the area.
    /unlockdown to end a lockdown]],
    weapons = {},
    command = "mayor",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.89,
    admin = 0,
    vote = true,
    hasLicense = false,
    mayor = true,
    category = "Civil Protection",
})

TEAM_HOBO = DarkRP.createJob("Hobo", {
    color = Color(80, 45, 0, 255),
    model = "models/player/corpse1.mdl",
    description = [[The lowest member of society. Everybody laughs at you.
        You have no home.
        Beg for your food and money
        Sing for everyone who passes to get money
        Make your own wooden home somewhere in a corner or outside someone else's door]],
    weapons = {"weapon_bugbait"},
    command = "hobo",
    max = 5,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    hobo = true,
    category = "Citizens",
})

if not DarkRP.disabledDefaults["modules"]["hungermod"] then
    TEAM_COOK = DarkRP.createJob("Cook", {
        color = Color(238, 99, 99, 255),
        model = "models/player/mossman.mdl",
        description = [[As a cook, it is your responsibility to feed the other members of your city.
            You can spawn a microwave and sell the food you make:
            /buymicrowave]],
        weapons = {},
        command = "cook",
        max = 2,
        salary = 45,
        admin = 0,
        vote = false,
        hasLicense = false,
        cook = true
    })
end

-- Compatibility for when default teams are disabled
TEAM_CITIZEN = TEAM_CITIZEN  or -1
TEAM_POLICE  = TEAM_POLICE   or -1
TEAM_GANG    = TEAM_GANG     or -1
TEAM_MOB     = TEAM_MOB      or -1
TEAM_GUN     = TEAM_GUN      or -1
TEAM_MEDIC   = TEAM_MEDIC    or -1
TEAM_CHIEF   = TEAM_CHIEF    or -1
TEAM_MAYOR   = TEAM_MAYOR    or -1
TEAM_HOBO    = TEAM_HOBO     or -1
TEAM_COOK    = TEAM_COOK     or -1

-- Door groups
AddDoorGroup("Cops and Mayor only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR)
AddDoorGroup("Gundealer only", TEAM_GUN)
AddDoorGroup("Association", TEAM_ASSOCIATION)


-- Agendas
DarkRP.createAgenda("Gangster's agenda", TEAM_MOB, {TEAM_GANG})
DarkRP.createAgenda("Police agenda", {TEAM_MAYOR, TEAM_CHIEF}, {TEAM_POLICE})

-- Group chats
DarkRP.createGroupChat(function(ply) return ply:isCP() end)
DarkRP.createGroupChat(TEAM_MOB, TEAM_GANG)
DarkRP.createGroupChat(function(listener, ply) return not ply or ply:Team() == listener:Team() end)

-- Initial team when first spawning
GAMEMODE.DefaultTeam = TEAM_CITIZEN

-- Teams that belong to Civil Protection
GAMEMODE.CivilProtection = {
    [TEAM_POLICE] = true,
    [TEAM_CHIEF] = true,
    [TEAM_MAYOR] = true,
}

-- Hitman team
DarkRP.addHitmanTeam(TEAM_MOB)

-- Demote groups
DarkRP.createDemoteGroup("Cops", {TEAM_POLICE, TEAM_CHIEF})
DarkRP.createDemoteGroup("Gangsters", {TEAM_GANG, TEAM_MOB})

-- Default categories
DarkRP.createCategory{
    name = "Citizens",
    categorises = "jobs",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 100,
}

DarkRP.createCategory{
    name = "Civil Protection",
    categorises = "jobs",
    startExpanded = true,
    color = Color(25, 25, 170, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 101,
}

DarkRP.createCategory{
    name = "Gangsters",
    categorises = "jobs",
    startExpanded = true,
    color = Color(75, 75, 75, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 101,
}

DarkRP.createCategory{
    name = "Other",
    categorises = "jobs",
    startExpanded = true,
    color = Color(0, 107, 0, 255),
    canSee = fp{fn.Id, true},
    sortOrder = 255,
}

--PATH addons/sl_util_wallet/lua/weapons/ez_wallet_money/shared.lua:


SWEP.PrintName          = easzy.wallet.config.moneyName or "Money"
SWEP.Author             = "Easzy"
SWEP.Instructions       = ""
SWEP.Category           = "Easzy Wallet"

SWEP.AutomaticFrameAdvance = true

SWEP.Spawnable          = false
SWEP.AdminOnly          = true

SWEP.Slot               = 1
SWEP.SlotPos            = 0

SWEP.Base               = "weapon_base"
SWEP.ViewModel          = "models/easzy/ez_wallet/banknote/v_banknote.mdl"

if GAMEMODE.Config.currency == "€" then
    SWEP.WorldModel = "models/easzy/ez_wallet/banknote/w_banknote_euro.mdl"
else
    SWEP.WorldModel = "models/easzy/ez_wallet/banknote/w_banknote_dollar.mdl"
end

SWEP.UseHands           = true
SWEP.HoldType           = "slam"

SWEP.DrawAmmo           = false
SWEP.DrawCrosshair      = false
SWEP.ViewModelFOV       = 54
SWEP.ShouldDropOnDie    = false
SWEP.AutoSwitchTo       = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.BobScale = 0.5 -- (Clientside) The scale of the viewModel bob (viewModel movement from left to right when walking around)
SWEP.SwayScale = 0.5 -- (Clientside) The scale of the viewModel sway (viewModel position lerp when looking around)


--PATH lua/weapons/gmod_tool/stools/drgbase_tool_mover.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_mover.name"
TOOL.BuildCPanel = function(panel)
	panel:Help("#tool.drgbase_tool_mover.desc")
	panel:Help("#tool.drgbase_tool_mover.0")
end

function TOOL:LeftClick(tr)
	if not IsValid(tr.Entity) then return false end
	if not tr.Entity.IsDrGNextbot then return false end
	if CLIENT then return true end
	self:GetOwner():DrG_CleverEntitySelect(tr.Entity)
	return true
end
function TOOL:RightClick(tr)
	if CLIENT then return true end
	for nextbot in self:GetOwner():DrG_SelectedEntities() do
		nextbot._DrGBaseMoverTool = true
		nextbot:CallInCoroutine(function(nextbot, delay)
			nextbot._DrGBaseMoverTool = false
			nextbot:GoTo(tr.HitPos, nil, function()
				if nextbot._DrGBaseMoverTool then return false end
			end)
		end)
	end
	return true
end
function TOOL:Reload(tr)
	if CLIENT then return true end
	self:GetOwner():DrG_ClearSelectedEntities()
	return true
end

if CLIENT then
	language.Add("tool.drgbase_tool_mover.name", "Nextbot Mover")
	language.Add("tool.drgbase_tool_mover.desc", "Force nextbots to move to a different position.")
	language.Add("tool.drgbase_tool_mover.0", "Left click to select/deselect a nextbot (hold shift to select multiple nextbots), right click to set the position to go to and reload to clear the list of selected nextbots.")

	hook.Add("PreDrawHalos", "DrGBaseToolMoverHalos", function()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
		local tool = ply:GetTool()
		if tool == nil or tool.Mode ~= "drgbase_tool_mover" then return end
		halo.Add(ply:DrG_GetSelectedEntities(), DrGBase.CLR_CYAN, nil, nil, nil, nil, true)
	end)
end

--PATH addons/gmod_info_board/lua/weapons/gmod_tool/stools/gmib_gun.lua:
--Gmod Info Board by 2REK 2020
TOOL.Category		=	"2REK Scripts"
TOOL.Name			=	"GMod Info Board Tool"
TOOL.Command		=	nil
TOOL.ConfigName		=	""

if SERVER then
	util.AddNetworkString("gmib_openmenu")
	util.AddNetworkString("gmib_addpost")
	util.AddNetworkString("gmib_addpos")
	util.AddNetworkString("gmib_ChooseBoardModel")
end

if CLIENT then
	language.Add("Tool.gmib_gun.name", "Information Board Tool")
	language.Add("Tool.gmib_gun.desc", "All functions in here!")
	language.Add("Tool.gmib_gun.0", "Left Click: Save/remove board position Right Click: Open script menu")
end

local displayedEnt
local model = "models/2rek/gmib/gmib_board.mdl"
local mode = 0 
-- mode 0 = gun is idle
-- mode 1 = gun displays choosen model

function TOOL:LeftClick(trace)
	if CLIENT then return end
	local owner = self:GetOwner()
	if gmib.usergroups[owner:GetUserGroup()] ~= true then return end
	
	if mode == 1 then 
		--todo spawn board and add to database
		gmib.spawnAndSave(displayedEnt:GetPos(),displayedEnt:GetAngles(),model)
		
		timer.Remove("gmibTrace" .. owner:GetName())
		mode = 0
		--if displayedEnt == nil || displayedEnt == NULL then return end
		displayedEnt:Remove()
	else
		mode = 1
		local trace = owner:GetEyeTrace()
		local ent = ents.Create("gmib_blank_visual")
		ent:SetPos(trace.HitPos)
		ent:SetAngles(Angle(0,0,0))
		ent:Spawn()
		ent:SetModel(model)
		ent:SetMaterial("models/wireframe")
		ent:SetColor( Color(255, 255, 255, 255) )
		displayedEnt = ent
		
		timer.Create("gmibTrace" .. owner:GetName(),0.1,0,function()
			if displayedEnt == nil then return end
			local trace = owner:GetEyeTrace()
			if ent == NULL then return end
			ent:SetPos(trace.HitPos)
			ent:SetModel(model)
		end)
	end
end --of tool:LeftClick

function TOOL:RightClick(trace)
	if CLIENT then return end
	local owner = self:GetOwner()
	if gmib.usergroups[owner:GetUserGroup()] ~= true then return end
	local ent = trace.Entity
	
	if mode == 1 then
		if model == "models/2rek/gmib/gmib_board.mdl" then
			model = "models/2rek/gmib/gmib_board_legs.mdl"
		else
			model = "models/2rek/gmib/gmib_board.mdl"
		end
	else 
		--todo remove board from world and database
		if ent:GetClass() != "gmib_board" then return end
		file.Delete( "_2rek/gmod_info_board/positions/" .. game.GetMap() .. "/" .. ent.data.id .. ".txt" )
		ent:Remove()
	end
	
end --of tool:RightClick

function TOOL:Reload(trace)
	if CLIENT then return end
	local owner = self:GetOwner()
	if gmib.usergroups[owner:GetUserGroup()] ~= true then return end
	
	if mode == 1 then
		local angles = displayedEnt:GetAngles()
		displayedEnt:SetAngles(Angle(angles.x,angles.y+15,angles.z))
	else 
		gmib.openManager(owner)
	end
end --of tool:Reload

function TOOL:Holster()
	if CLIENT then return end
	local owner = self:GetOwner()
	timer.Remove("gmibTrace .. " .. owner:GetName())
	if displayedEnt == nil || displayedEnt == NULL then return end
	displayedEnt:Remove()
end --of TOOL:Holster

local gunBgColor = Color(20,20,20)
local gunTextColor1 = Color(200,200,200)
local gunTextColor2 = Color(20,200,20)

function TOOL:DrawToolScreen( width, height )
	if SERVER then return end
	surface.SetDrawColor( gunBgColor )
	surface.DrawRect( 0, 0, width, height )
	
	draw.SimpleText( "GMod Info Board", "DermaLarge", width / 2, 20, gunTextColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Left Click", "DermaLarge", width / 2, 20 * 2 + 5 * 2, gunTextColor2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Open spawn menu", "DermaLarge", width / 2, 20 * 3 + 5 * 3, gunTextColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Right Click", "DermaLarge", width / 2, 20 * 4 + 5 * 4, gunTextColor2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Choose/Remove board", "DermaLarge", width / 2, 20 * 5 + 5 * 5, gunTextColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Reload", "DermaLarge", width / 2, 20 * 6 + 5 * 6, gunTextColor2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Enter script menu", "DermaLarge", width / 2, 20 * 7 + 5 * 7, gunTextColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Remember to", "DermaLarge", width / 2, 20 * 8 + 5 * 8, gunTextColor2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	draw.SimpleText( "leave review :)", "DermaLarge", width / 2, 20 * 9 + 5 * 9, gunTextColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end --tool:DrawToolScreen

--PATH lua/weapons/gmod_tool/stools/gparticles.lua:
TOOL.Category = "Render"
TOOL.Name = "Particles"
TOOL.ClientConVar["key"] = "37"
TOOL.ClientConVar["particle"] = "medicgun_beam_red_invun"
TOOL.ClientConVar["cps"] = "0"
TOOL.ClientConVar["att"] = "0"
TOOL.ClientConVar["autokill"] = "0"
TOOL.Information = {
	{ name = "left", stage = 0 },
	{ name = "right", stage = 0 },
	{ name = "right_1", stage = 1 },
}

if CLIENT then
	language.Add("tool.gparticles.name", "Particle Spawner")
	language.Add("tool.gparticles.desc", "Spawn silly particles")
	language.Add("tool.gparticles.left", "Click to spawn a particle you moron")
	language.Add("tool.gparticles.right", "Select a particle controller to attach to")
	language.Add("tool.gparticles.right_1", "Select on what entity do you want to attach to")
end

cleanup.Register("particles")
CreateConVar("sbox_maxparticles", "5", FCVAR_ARCHIVE)
local function CheckLimit(ply, key)
	-- TODO: Clientside prediction
	if CLIENT then return true end
	local found = false
	for id, particle in ipairs(ents.FindByClass("sent_particle_def")) do
		if not particle.controlkey or particle.controlkey ~= key then continue end
		if IsValid(particle:GetPlayer()) and ply ~= particle:GetPlayer() then continue end
		found = true
		break
	end

	if not found and not ply:CheckLimit("particles") then return false end

	return true
end

local function MakeParticle(ply, key, particle, cps, autokill, Data)
	if IsValid(ply) and not CheckLimit(ply, key) then return false end
	local ent = ents.Create("sent_particle_def")
	if not IsValid(ent) then return false end
	duplicator.DoGeneric(ent, {
		particle = particle,
		cps = cps,
		autokill = autokill,
		Data = Data
	})

	ent.particle = particle
	ent.cps = cps
	ent.autokill = autokill

	ent:SetPlayer(ply)
	ent:SetPos(ply:GetEyeTrace().HitPos)
	ent:Spawn()
	ent:SetControlPoints(cps or 0)
	ent:SetAutoKill((autokill or 0) == 1)
	ent:SetParticleName(particle)

	timer.Simple(.1, function()
		net.Start("GPart.Restart")
		net.WriteEntity(ent)
		net.SendPVS(ent:GetPos())
	end)

	DoPropSpawnedEffect(ent)
	numpad.OnDown(ply, key, "Particle_Toggle", ent)
	if IsValid(ply) then
		ply:AddCleanup("particles", ent)
		ply:AddCount("particles", ent)
	end

	return ent
end

duplicator.RegisterEntityClass("sent_particle_def", function(ply, data)
	local ent = MakeParticle(ply, data.controlkey, data.particle, data.cps, data.autokill, data.Data)
	return ent
end, "Data")

function TOOL:LeftClick(trace)
	local ply = self:GetOwner()
	local key = self:GetClientNumber("key")
	if key == -1 then return false end
	if not CheckLimit(ply, key) then return false end
	if CLIENT then return true end

	if self:GetStage() == 1 then
		self:RightClick(trace)
		self:SetStage(0)
		return true
	end
	local autokill = self:GetClientNumber("autokill")
	local cps = self:GetClientNumber("cps")
	local particle = self:GetClientInfo("particle")
	local ent = MakeParticle(
		ply,
		key,
		particle,
		cps,
		autokill,
		{
			Pos = trace.StartPos,
			Angle = ply:EyeAngles()
		}
	)

	if not IsValid(ent) then return false end
	undo.Create("Particle")
	undo.AddEntity(ent)
	undo.SetPlayer(ply)
	undo.Finish()

	return true, ent
end

function TOOL:RightClick(trace)
	local ent = trace.Entity

	if self:GetStage() == 1 then
		if not IsValid(ent) then return end

		local obj = self:GetEnt(1)
		if IsValid(obj) then
			obj.lastPlace = obj:GetPos()
			obj:SetMoveType(MOVETYPE_NONE)
			obj:SetParent(ent, self:GetClientNumber("att"))
			obj:SetLocalPos(Vector(0, 0, 0))
			obj:SetAttachmentSelected(self:GetClientNumber("att"))

			if SERVER then
				undo.Create("Particle Attach")
				undo.AddFunction(function()
					if IsValid(obj) then
						obj:SetParent(nil)
						obj:SetMoveType(MOVETYPE_VPHYSICS)
						obj:SetPos(obj.lastPlace)
						obj:GetPhysicsObject():EnableGravity(false)
					end
				end)
				undo.SetPlayer(self:GetOwner())
				undo.Finish("Removed Particle Attachment")
			end
		end

		self:SetStage(0)
		return true
	end
	if ent:GetClass() != "sent_particle_def" then
		return false
	end

	self:SetObject(1, ent, trace.HitPos, ent:GetPhysicsObject(), 0, trace.HitNormal)
	self:SetStage(1)
	return true
end

local ConVarsDefault = TOOL:BuildConVarList()
function TOOL.BuildCPanel(CPanel)
	CPanel:AddControl(
		"ComboBox",
		{
			MenuButton = 1,
			Folder = "camera",
			Options = {
				["#preset.default"] = ConVarsDefault
			},
			CVars = table.GetKeys(ConVarsDefault)
		}
	)

	CPanel:AddControl(
		"Numpad",
		{
			Label = "Particle Enable Key",
			Command = "gparticles_key"
		}
	)

	CPanel:AddControl(
		"textbox",
		{
			Label = "Particle Name",
			Command = "gparticles_particle"
		}
	)

	CPanel:AddControl(
		"CheckBox",
		{
			Label = "Destroy particle after done",
			Command = "gparticles_autokill"
		}
	)

	CPanel:AddControl(
		"slider",
		{
			Label = "Control Points",
			Command = "gparticles_cps",
			Min = 0,
			Max = 32
		}
	)

	CPanel:AddControl(
		"slider",
		{
			Label = "Attachment",
			Command = "gparticles_att",
			Min = 0,
			Max = 16
		}
	)
end
--PATH addons/the_perfect_training_system/lua/weapons/gmod_tool/stools/training.lua:
TOOL.Category = "Diablos Tool"
TOOL.Name = "Training Manager"

if CLIENT then
	TOOL.Information = {
		{ name = "left" },
		{ name = "right" },
		{ name = "reload" },
	}
	language.Add("tool.training.name", "Training Manager")
	language.Add("tool.training.desc", "Create / edit training entity and access the admin panel.")
	language.Add("tool.training.left", "Select this option")
	language.Add("tool.training.right", "Switch between purposes")
	language.Add("tool.training.reload", "Return to the main toolscreen")
end

local level, max, typeEnt, edit, openPanel
local function ResetVars()
	level = 1
	max = 3
	typeEnt = 0
	edit = 0
	openPanel = 0
end
ResetVars()


function TOOL:LeftClick(trace)
	if not IsFirstTimePredicted() then return end
	local ply = self:GetOwner()
	if not Diablos.TS:IsAdmin(ply) then return end


	local stage = self:GetStage()
	if stage == 1 then 
		edit = level - 1 
		openPanel = level - 2 
		max = 6

		if openPanel == 1 then
			if SERVER then
				local players = player.GetAll()
				net.Start("TPTSA:OpenAdminClientPanel")
					net.WriteUInt(#players, 8)
					for _, pl in ipairs(players) do
						net.WriteEntity(pl)
						Diablos.TS:WriteTrainingInfo(pl, true)
					end
				net.Send(ply)
			end
			self:Reload(trace)
		else
			self:SetStage(stage + 1)
		end
	elseif stage == 2 then
		if edit != 1 and openPanel != 1 then
			typeEnt = level
			// self:SetStage(stage + 1)
			if SERVER then
				-- send data to save an entity
				net.Start("TPTSA:OpenAdminToolgunPanel")
					net.WriteEntity(nil)
					net.WriteUInt(typeEnt, 3)
				net.Send(ply)
			end
			self:Reload(trace)
		elseif edit == 1 then
			if SERVER then
				local ent = trace.Entity
				-- if ent:GetClass() == "diablos_punching_base" then ent = ent.punchingBall end
				if IsValid(ent) then
					if IsValid(ent.balance) then ent = ent.balance end -- Hitting the television instead of the balance
					if IsValid(ent.treadmill) then ent = ent.treadmill end -- Hitting the artificial floor instead of the "treadmill" main entity
					if IsValid(ent.turnstile) then ent = ent.turnstile end -- Hitting a turnstile button/trigger instead of the "turnstile" main entity
					if IsValid(ent.punchingBall) then ent = ent.punchingBall end -- Hitting the punching base instead of the punching ball

					if Diablos.TS:IsTrainingEntity(ent:GetClass()) then
						net.Start("TPTSA:OpenAdminToolgunPanel")
							net.WriteEntity(ent)
							net.WriteUInt(0, 3)
						net.Send(ply)
					end
				end
			end
			self:Reload(trace)
		end
	elseif stage == 3 then
		// if edit != 1 and openPanel != 1 then


	end

	return true
end


function TOOL:RightClick(trace)
	if not IsFirstTimePredicted() then return end
	level = level + 1
	if level > max then level = 1 end
	return false
end

function TOOL:Reload(trace)
	if not IsFirstTimePredicted() then return end
	ResetVars()
	self:SetStage(1)
	return false
end

function TOOL:Allowed() return Diablos.TS:IsAdmin(self:GetOwner()) end

function TOOL:Deploy() self:SetStage(1) end

local col = {
	b = Color(20, 20, 20, 255),
	grey = Color(100, 100, 100, 100),
	grey_light = Color(200, 200, 200, 100),
	w = Color(200, 200, 200, 255),
	r = Color(150, 0, 0, 100),
	r_light = Color(200, 30, 30, 110),
	g = Color(0, 150, 0, 100),
	g_light = Color(30, 200, 30, 110),
}


function TOOL:DrawToolScreen(width, height)

	surface.SetDrawColor(col.b)
	surface.DrawRect(0, 0, width, height)

	local stage = self:GetStage()

	local function ToolScreenTypes(...)
		local arg = {...}
		local SIZE_Y = 30
		local numInfos = #arg

		if numInfos == 6 then SIZE_Y = 25 end

		local function DrawText(numLevel, posY)

			if level == numLevel then surface.SetDrawColor(col.grey_light) else surface.SetDrawColor(col.grey) end
			surface.DrawRect(20, posY - SIZE_Y / 2, width - 40, SIZE_Y)
			draw.SimpleText(arg[numLevel], "Diablos:Font:TS:40", width / 2, posY, col.w, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end


		if numInfos == 2 then

			DrawText(1, height / 2 - 35)
			DrawText(2, height / 2 + 35)

		elseif numInfos == 3 then

			DrawText(1, height / 2 - 50)
			DrawText(2, height / 2)
			DrawText(3, height / 2 + 50)

		elseif numInfos == 4 then

			DrawText(1, height / 2 - 75)
			DrawText(2, height / 2 - 25)
			DrawText(3, height / 2 + 25)
			DrawText(4, height / 2 + 75)

		elseif numInfos == 5 then

			DrawText(1, height / 2 - 70)
			DrawText(2, height / 2 - 35)
			DrawText(3, height / 2)
			DrawText(4, height / 2 + 35)
			DrawText(5, height / 2 + 70)

		elseif numInfos == 6 then

			DrawText(1, height / 2 - 100)
			DrawText(2, height / 2 - 60)
			DrawText(3, height / 2 - 20)
			DrawText(4, height / 2 + 20)
			DrawText(5, height / 2 + 60)
			DrawText(6, height / 2 + 100)

		end
	end

	local printInfo = true

	if stage == 1 then
		ToolScreenTypes("Create", "Edit / Remove", "Admin panel")
	elseif stage == 2 then
		if edit == 1 then
			draw.SimpleText("Left click on entity!", "Diablos:Font:TS:35", width / 2, height / 2, col.w, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			ToolScreenTypes("Weigh balance", "Card reader", "Turnstile", "Treadmill", "Dumbbell", "Punching ball")
			printInfo = false
		end
	end

	if printInfo then
		draw.SimpleText("Training Manager", "Diablos:Font:TS:35", width / 2, 5, col.w, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.SimpleText("Created by Diablos", "Diablos:Font:TS:20", width - 5, height - 5, col.w, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
	end
end
--PATH addons/sl_main_system/lua/weapons/mad_baton1/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton3/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton5/shared.lua:
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

SWEP.PrintName 		      = "5 : Baton saint" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton1.mdl"
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
SWEP.BonusDegats = 42

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_corpsacorps/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague12/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague18/shared.lua:
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

SWEP.PrintName 		      = "18 : Dague Courbé" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague6.mdl"
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
SWEP.BonusDegats = 146

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague19/shared.lua:
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

SWEP.PrintName 		      = "19 : Dague Sanglante" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague19.mdl"
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
SWEP.BonusDegats = 154

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague2/shared.lua:
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

SWEP.PrintName 		      = "2 : Dague en fer fine" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague27.mdl"
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

SWEP.TypeArme = "dague"
SWEP.BonusDegats = 18
SWEP.holdtype = "sl_dague_ht_mad"
--PATH addons/sl_main_system/lua/weapons/mad_epee11/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee16/shared.lua:
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

SWEP.PrintName 		      = "16 : Épée Blue Marine" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword18.mdl"
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
SWEP.BonusDegats = 138

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee20/shared.lua:
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

SWEP.PrintName 		      = "20 : Épée Enflammé" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword13.mdl"
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
SWEP.BonusDegats = 170

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee21/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau18/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau5/shared.lua:
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

SWEP.PrintName 		      = "5 : Marteau du Crépuscule" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/marteau7.mdl"
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
SWEP.BonusDegats = 42

--------------------------------------------------------------------------
--PATH addons/sl_utils/lua/weapons/middlefinger_animation_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can show the middle one!"
SWEP.Instructions 			= "Click to show the Middle one."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Middlefinger"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 110

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(15,-55,-0),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(0,-55,-0),
	        ["ValveBiped.Bip01_R_Hand"] = Angle(20,20,90),
	        ["ValveBiped.Bip01_R_Finger1"] = Angle(20,-40,-0),
	        ["ValveBiped.Bip01_R_Finger3"] = Angle(0,-30,0),
	        ["ValveBiped.Bip01_R_Finger4"] = Angle(-10,-40,0),
	        ["ValveBiped.Bip01_R_Finger11"] = Angle(-0,-70,-0),
	        ["ValveBiped.Bip01_R_Finger31"] = Angle(0,-70,0),
	        ["ValveBiped.Bip01_R_Finger41"] = Angle(0,-70,0),
	        ["ValveBiped.Bip01_R_Finger12"] = Angle(-0,-70,-0),
	        ["ValveBiped.Bip01_R_Finger32"] = Angle(0,-70,0),
	        ["ValveBiped.Bip01_R_Finger42"] = Angle(0,-70,-0),
	    }
	end
end

--PATH gamemodes/mangarp/entities/weapons/stick_base/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

DEFINE_BASECLASS("weapon_cs_base2")

SWEP.Author = "DarkRP Developers"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "stunstick"

SWEP.UseHands = false

SWEP.AdminOnly = true

SWEP.StickColor = color_white

SWEP.ViewModel = Model("models/weapons/v_stunbaton.mdl")
SWEP.WorldModel = Model("models/weapons/w_stunbaton.mdl")

SWEP.Sound = Sound("weapons/stunstick/stunstick_swing1.wav")

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Bool 0 = IronsightsPredicted
    -- Bool 1 = Reloading
    self:NetworkVar("Bool", 2, "SeqIdling")
    -- Float 0 = IronsightsTime
    -- Float 1 = LastPrimaryAttack
    -- Float 2 = ReloadEndTime
    -- Float 3 = BurstTime
    self:NetworkVar("Float", 4, "SeqIdleTime")
    self:NetworkVar("Float", 5, "HoldTypeChangeTime")
end

local stunstickMaterials
function SWEP:Initialize()
    self:SetHoldType("normal")

    self.stickRange = 90

    if SERVER then return end

    stunstickMaterials = stunstickMaterials or {}

    local materialName = "darkrp/" .. self:GetClass()
    if stunstickMaterials[materialName] then return end

    CreateMaterial(materialName, "VertexLitGeneric", {
        ["$basetexture"] = "models/debug/debugwhite",
        ["$surfaceprop"] = "metal",
        ["$envmap"] = "env_cubemap",
        ["$envmaptint"] = "[ .5 .5 .5 ]",
        ["$selfillum"] = 0,
        ["$model"] = 1
    }):SetVector("$color2", self.StickColor:ToVector())

    stunstickMaterials[materialName] = true
end

function SWEP:Deploy()
    BaseClass.Deploy(self)
    if SERVER then
        self:SetMaterial("!darkrp/" .. self:GetClass())
    end

    local vm = self:GetOwner():GetViewModel()
    if not IsValid(vm) then return true end

    vm:SendViewModelMatchingSequence(vm:LookupSequence("idle01"))

    return true
end

function SWEP:PreDrawViewModel(vm)
    for i = 9, 15 do
        vm:SetSubMaterial(i, "!darkrp/" .. self:GetClass())
    end
end

function SWEP:ViewModelDrawn(vm)
    if not IsValid(vm) then return end
    vm:SetSubMaterial() -- clear sub-materials
end

function SWEP:ResetStick()
    if not IsValid(self:GetOwner()) then return end
    if SERVER then
        self:SetMaterial() -- clear material
    end
    self:SetSeqIdling(false)
    self:SetSeqIdleTime(0)
    self:SetHoldTypeChangeTime(0)
end

function SWEP:Holster()
    BaseClass.Holster(self)
    self:ResetStick()
    return true
end

function SWEP:Think()
    if self:GetSeqIdling() then
        self:SetSeqIdling(false)

        if not IsValid(self:GetOwner()) then return end
        self:GetOwner():SetAnimation(PLAYER_ATTACK1)
        self:EmitSound(self.Sound)

        local vm = self:GetOwner():GetViewModel()
        if not IsValid(vm) then return end
        vm:SendViewModelMatchingSequence(vm:LookupSequence("attackch"))
        vm:SetPlaybackRate(1 + 1 / 3)
        local duration = vm:SequenceDuration() / vm:GetPlaybackRate()
        local time = CurTime() + duration
        self:SetSeqIdleTime(time)
        self:SetNextPrimaryFire(time)
    end
    if self:GetSeqIdleTime() ~= 0 and CurTime() >= self:GetSeqIdleTime() then
        self:SetSeqIdleTime(0)

        if not IsValid(self:GetOwner()) then return end
        local vm = self:GetOwner():GetViewModel()
        if not IsValid(vm) then return end
        vm:SendViewModelMatchingSequence(vm:LookupSequence("idle01"))
    end
    if self:GetHoldTypeChangeTime() ~= 0 and CurTime() >= self:GetHoldTypeChangeTime() then
        self:SetHoldTypeChangeTime(0)
        self:SetHoldType("normal")
    end
end

function SWEP:PrimaryAttack()
    self:SetHoldType("melee")
    self:SetHoldTypeChangeTime(CurTime() + 0.3)

    self:SetNextPrimaryFire(CurTime() + 0.51) -- Actual delay is set later.

    local vm = self:GetOwner():GetViewModel()
    if IsValid(vm) then
        vm:SendViewModelMatchingSequence(vm:LookupSequence("idle01"))
        self:SetSeqIdling(true)
    end
end

function SWEP:SecondaryAttack()
    -- Do nothing
end

function SWEP:Reload()
    -- Do nothing
end

--PATH lua/weapons/weapon_drg_ar2/shared.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
SWEP.Base = "drgbase_weapon" -- DO NOT TOUCH (obviously)

-- Misc --
SWEP.PrintName = "AR2"
SWEP.Class = "weapon_drg_ar2"
SWEP.Category = "DrG - Half Life 2"
SWEP.Author = "Dragoteryx"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions	= ""
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Slot = 2
SWEP.SlotPos = 0

-- Looks --
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV	= 54
SWEP.ViewModelFlip = false
SWEP.ViewModelOffset = Vector(0, 0, 0)
SWEP.ViewModelAngle = Angle(0, 0, 0)
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_irifle.mdl"
SWEP.WorldModel	= "models/weapons/w_irifle.mdl"
SWEP.CSMuzzleFlashes = false
SWEP.CSMuzzleX = false

-- Primary --

-- Shooting
SWEP.Primary.Damage = 10
SWEP.Primary.Bullets = 1
SWEP.Primary.Spread = 0.02
SWEP.Primary.Automatic = true
SWEP.Primary.Delay = 0.1
SWEP.Primary.Recoil = 0.5

-- Ammo
SWEP.Primary.Ammo	= "AR2"
SWEP.Primary.Cost = 1
SWEP.Primary.ClipSize	= 30
SWEP.Primary.DefaultClip = 90

-- Effects
SWEP.Primary.Sound = "Weapon_AR2.Single"
SWEP.Primary.EmptySound = "Weapon_AR2.Empty"

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddWeapon(SWEP)

--PATH lua/weapons/weapon_fistsofreprisal.lua:
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
AddCSLuaFile( "autorun/cl_mas_fistsofreprisal_options.lua" )
AddCSLuaFile( "autorun/sh_mas_fistsofreprisal_fonts.lua" )
include( "autorun/cl_mas_fistsofreprisal_options.lua" )
include( "autorun/sh_mas_fistsofreprisal_fonts.lua" )

if (CLIENT) then

	SWEP.PrintName			= "MAS: Fists of Reprisal"
	SWEP.Author				= "Maranzo"
	SWEP.Category 			= "1. Maranzo's Ability SWEPs"
	SWEP.Instructions		= [[
	LMB: Attack
	RMB: Ability 1
	"F" Key: Ability 2
	"C" Key: Ability 3
	"T" Key: Ultimate Ability
	Mouse3: Ability Selection
	
	Deal more damage and attack faster by getting more combos and alternating hands!
	]]
	
end // end If Client

SWEP.ViewModel			=	Model( "models/weapons/c_arms.mdl" )
SWEP.UseHands			=	true
SWEP.WorldModel			=	""
SWEP.HoldType			=	"fist"
SWEP.ViewModelFOV 		= 	54
SWEP.Spawnable 			= 	GetConVar( "sk_mas_fistsofreprsial_enabled" ):GetBool()
SWEP.AdminOnly 			= 	GetConVar( "sk_mas_fistsofreprsial_adminonly" ):GetBool()

SWEP.Weight				= 	5
SWEP.AutoSwitchTo		= 	true
SWEP.AutoSwitchFrom		= 	false
SWEP.ShouldDropOnDie	=	false

SWEP.Slot				= 	1 -- Secondary weapon
SWEP.SlotPos			= 	0 -- Takes up the beginning slot
SWEP.DrawAmmo			= 	false -- Do not show ammo on HUD
SWEP.DrawCrosshair		= 	true

SWEP.Primary.ClipSize		= 	-1 -- Infinite Ammo
SWEP.Primary.DefaultClip	= 	-1 -- Starts Infinite
SWEP.Primary.Automatic		= 	false -- Not automatic
SWEP.Primary.Ammo			= 	"none" -- "none" bc no ammo needed
SWEP.Primary.Damage			= 	30
SWEP.Primary.DamageUppercut	= 	45

SWEP.Secondary.ClipSize		= 	-1 -- Infinite again
SWEP.Secondary.DefaultClip	= 	-1
SWEP.Secondary.Automatic	= 	false -- Not automatic
SWEP.Secondary.Ammo			= 	"none" -- No ammo needed

SWEP.SwingDelay1			=	0.3
SWEP.SwingDelay2			=	0.2
SWEP.ModDelay				=	1
SWEP.ModDmg					=	1
SWEP.Hit					= 	false
SWEP.HitTime				= 	CurTime()
SWEP.HitDistance		 	= 	48

// Abilities

ASWEP_Ability_AutoAttack		= 1
ASWEP_Ability_ScornMark			= 2
ASWEP_Ability_VengefulLeap		= 3
ASWEP_Ability_VeteranStrength	= 4
ASWEP_Ability_MeteorDive		= 5
ASWEP_Ability_Select			= 6

SWEP.AbilityTable = {
	["Equipped"] = {
		[ASWEP_Ability_AutoAttack]		= {
			["Category"] = "AutoAttack",
			["Name"] = "Fists of Reprisal",
			["Description"] = "Beat your enemy down! Gain health, extra damage, and attack speed with each hit." },
		[ASWEP_Ability_ScornMark]		= { ["Category"] = "Ability 1", ["Name"] = "Scorn Mark", ["Description"] = "Land this right jab on your enemy to slow and weigh them down. A marked target will take extra damage and heal you significantly for each blow." },
		[ASWEP_Ability_VengefulLeap]	= { ["Category"] = "Ability 2", ["Name"] = "Vengeful Leap", ["Description"] = "Leap into the air and send everything flying on impact." },
		[ASWEP_Ability_VeteranStrength]	= {	["Category"] = "Ability 3", ["Name"] = "Veteran Strength", ["Description"] = "Regain your strength! Every hit deals more damage, and you receive more health back for each blow." },
		[ASWEP_Ability_MeteorDive]		= {	["Category"] = "Ultimate", ["Name"] = "Meteor Dive", ["Description"] = "Your craving for vengeance empowers you - giving you health and armor. Then, launch yourself at your enemies dealing massive damage!" },
	},
}

-------------------------------------------------------------------

local ability_icons = {
	[ASWEP_Ability_AutoAttack] 		= { def = Material( 'hud/maranzo_abilityswep/icon_aa_swordswing.png' ), 	cast = Material( 'hud/maranzo_abilityswep/icon_aa_swordswing.png' ) },
	[ASWEP_Ability_ScornMark] 		= { def = Material( 'hud/maranzo_abilityswep/icon_scornmark.png' ), 		cast = Material( 'hud/maranzo_abilityswep/icon_scornMark_cast.png' ) },
	[ASWEP_Ability_VengefulLeap] 	= { def = Material( 'hud/maranzo_abilityswep/icon_vengefulleap.png' ), 		cast = Material( 'hud/maranzo_abilityswep/icon_vengefulLeap_cast.png' ) },
	[ASWEP_Ability_VeteranStrength]	= { def = Material( 'hud/maranzo_abilityswep/icon_veteranstrength.png' ), 	cast = Material( 'hud/maranzo_abilityswep/icon_veteranStrength_cast.png' ) },
	[ASWEP_Ability_MeteorDive] 		= { def = Material( 'hud/maranzo_abilityswep/icon_meteordive.png' ), 		cast = Material( 'hud/maranzo_abilityswep/icon_meteordive_cast.png' ) },
}

local function DrawCenteredRect( x, y, w, h )
	surface.DrawTexturedRect( x - w / 2, y - h / 2, w, h )
end

	
if (CLIENT) then
	killicon.Add( "weapon_fistsofreprisal", "icons/fistsofreprisal_killicon", color_white )
	local WepSelectIcon = Material( "icons/fistsofreprisal_weaponselect.png" )
	local Size = 128
	
	function SWEP:DrawWeaponSelection( x, y, w, h, a )
		surface.SetDrawColor( 255, 255, 255, a )
		surface.SetMaterial( WepSelectIcon )
	
		--render.PushFilterMag( TEXFILTER.ANISOTROPIC )
		--render.PushFilterMin( TEXFILTER.ANISOTROPIC )
	
		surface.DrawTexturedRect( x + ( ( w - Size ) / 2 ), y + 2, Size, Size )
	
		--render.PopFilterMag()
		--render.PopFilterMin()
		-- Draw weapon info box
		self:PrintWeaponInfo( x + w + 20, y + h * 0.95, a )
	end
end

-------------------------------------------------------------------
-- Precache Misc Sounds

local SwingSound = Sound( "WeaponFrag.Throw" )
local HitSound = Sound( "Flesh.ImpactHard" )

--------------------------------------------------------------------
-- Define Local Functions

// Keys down for SinglePlayer
local keysDown = {}

// Effect F'n for think
local function playEffect( origin, entity, flags, effectstr, iterations, scale, magnitude, r1, r2, rz )
	
	if !iterations then iterations = 1 end
	if !scale then scale = 1 end
	if !magnitude then magnitude = 1 end
	if !r1 then r1 = 0 r2 = 0 end
	if !r2 then r2 = r1 end
		local TF_ed = EffectData()
		TF_ed:SetOrigin( origin )
		TF_ed:SetEntity( entity )
		TF_ed:SetFlags( flags )
		TF_ed:SetScale( scale )
		TF_ed:SetMagnitude( magnitude )
	for i=1, iterations do
		local randVec = !rz and Vector( math.random( -r1, r2 ), math.random( -r1, r2 ), 0 ) or Vector( math.random( -r1, r2 ), math.random( -r1, r2 ), math.random( -r1, r2 ) )
		TF_ed:SetOrigin( origin + randVec )
		util.Effect( effectstr, TF_ed, true, true )
	end
	
end

--------------------------------------------------------------------
-- Define SWEP Functions

local MAS = {}
function SWEP:Initialize()
	self.Spawnable			= 	GetConVar( "sk_mas_fistsofreprsial_enabled" ):GetBool()
	self.AdminOnly			= 	GetConVar( "sk_mas_fistsofreprsial_adminonly" ):GetBool()
	
	if Maranzos_AbilitySWEPs then 
		Maranzos_AbilitySWEPs.FoR_InfUlt= tobool( GetConVarNumber( "sk_mas_fistsofreprisal_infinitecharge" ) )
		Maranzos_AbilitySWEPs.FoR_NoCD	= tobool( GetConVarNumber( "sk_mas_fistsofreprisal_nocooldown" ) )
		
		table.Merge( MAS, Maranzos_AbilitySWEPs ) -- Merge that shit rather than reference it
	end
	
	MAS.IsCasting					=	false
	MAS.Ability 					=	{}
	MAS.Ability.AA 					= 	{}	-- Auto Attack
	MAS.Ability.ScornMk 			= 	{}	-- Scorn Mark
	MAS.Ability.VengLp 				= 	{}	-- Vengeful Leap
	MAS.Ability.VetSt 				= 	{}	-- Veteran Strength
	MAS.Ability.MeteorDv 			= 	{}	-- Ultimate: Meteor Dive
	
	-- Ultimate: Charge up your health & shield, then launch yourself and crash into the ground
	MAS.Ability.MeteorDv.Damage			=	200
	MAS.Ability.MeteorDv.MaxCharge		=	100
	MAS.Ability.MeteorDv.Heal			=	10	-- per 0.1s * 10
	MAS.Ability.MeteorDv.Arm			=	10	-- per 0.1s * 10
	MAS.Ability.MeteorDv.Sound1			= 	Sound( "ambience/particle_suck1.wav" )
	MAS.Ability.MeteorDv.Sound2			= 	Sound( "npc/antlion/digup1.wav" )
	MAS.Ability.MeteorDv.SoundLand		= 	Sound( "physics/concrete/boulder_impact_hard4.wav" )
	MAS.Ability.MeteorDv.SoundLand2		= 	Sound( "phx/explode01.wav" )
	
	-- ScornMark: Mark Target if hit (Hit Trace), slows & make them take extra damage from your attacks ( +15 dmg ) that partially heals you ( 10% )
	MAS.Ability.ScornMk.Cooldown	=	10	-- seconds
	MAS.Ability.ScornMk.CDMissed	=	3	-- seconds
	MAS.Ability.ScornMk.Damage		=	35
	MAS.Ability.ScornMk.DmgMul		=	1.3
	MAS.Ability.ScornMk.LSMul		=	0.3
	MAS.Ability.ScornMk.Duration	=	3	-- seconds
	MAS.Ability.ScornMk.SoundHit	=	Sound( "npc/antlion_guard/antlion_guard_shellcrack2.wav" )	-- seconds
	
	-- Vengeful Leap: Leap in direction facing & slow targets in area upon landing
	MAS.Ability.VengLp.Cooldown		=	10	-- seconds
	MAS.Ability.VengLp.Damage		=	20
	MAS.Ability.VengLp.ForceMul		=	850
	MAS.Ability.VengLp.Sound1		= 	Sound( "physics/concrete/concrete_break2.wav" )
	MAS.Ability.VengLp.SoundLand	= 	Sound( "physics/concrete/boulder_impact_hard3.wav" )
	
	-- Veteran Strength: Heal yourself & gain extra damage
	MAS.Ability.VetSt.Cooldown		=	18	-- seconds
	MAS.Ability.VetSt.DmgMul		=	1.3
	MAS.Ability.VetSt.Duration		=	4
	MAS.Ability.VetSt.Heal			=	75
	MAS.Ability.VetSt.LSMul			=	0.3	-- HP LS
	MAS.Ability.VetSt.ALS			=	2	-- armor LS
	MAS.Ability.VetSt.Sound1		=	Sound( "npc/combine_gunship/ping_search.wav" ) -- Activate Sound
	MAS.Ability.VetSt.SoundHit		=	Sound( "npc/strider/strider_step5.wav" ) -- Currently not in use
	
	if Maranzos_AbilitySWEPs.FoR_NoCD then
		MAS.Ability.ScornMk.Cooldown	=	1
		MAS.Ability.VengLp.Cooldown		=	1
		MAS.Ability.VetSt.Cooldown		=	1
	end
	
	
	local ply = self.Owner
	
	if (CLIENT) then
		self.DrawCrosshair		= 	GetConVar( "cl_mas_crosshairon" ):GetBool()
		self.KB = Maranzos_AbilitySWEPs.keyconfigs
		
		// Define a table of instructions
		self.Instr = {}
		self.Instr["H1"] = self.KB[ 1 ] .. " : "
		self.Instr["H2"] = self.KB[ 2 ] .. " : "
		self.Instr["H3"] = self.KB[ 3 ] .. " : "
		self.Instr["H4"] = self.KB[ 4 ] .. " : "
		self.Instr["H5"] = self.KB[ 5 ] .. " : "
		self.Instr["H6"] = self.KB[ 6 ] .. " : "
		self.Instr["1"] = "Attack"
		self.Instr["2"] = "Scorn Mark"
		self.Instr["3"] = "Vengeful Leap"
		self.Instr["4"] = "Veteran Strength"
		self.Instr["5"] = "Ultimate: Meteor Dive"
		self.Instr["6"] = "Ability Selection"
		self.Instr["7"] = "\n".. "Deal more damage and attack faster by getting more combos!"
		self.Instr["8"] = "\n".. "Check the Options menu to Rebind Abilities and Enable Menu & Flashlight use."
	
		// Run when key pressed
		if !game.SinglePlayer() then
			hook.Add( "PlayerButtonDown", "MAS.Keybind.FistsOfReprisal" .. ply:EntIndex(), function( ply, btn )
				local Wep = ply:GetActiveWeapon()
				
				if ( ply:IsValid() and ply:Alive() and Wep:IsValid() and Wep:GetClass() == "weapon_fistsofreprisal" ) then
					
					if self.KB and self.KB["Btn"][btn] and IsFirstTimePredicted() then 
						-- AutoAttack & Ability #1:Scorn Mark are bound to +attack & +attack2 by default & won't trigger anything here.
						if !vgui.CursorVisible() then
							
							if self.KB["Btn"][btn] == ASWEP_Ability_VengefulLeap then 
							// Abil 2: Vengeful Leap
								if ( self:GetIsCasting() or self:GetA2_CD() != 0 ) then 
									return 
								end
								local ability = ASWEP_Ability_VengefulLeap
								local CD = MAS.Ability.VengLp.Cooldown
								self:SetA2_Active( true )
								self:SetIsCasting( true )
								self:SetA2_CD( CD )
							
								-- Launch!
								local vel = ply:GetAimVector()
								local forcemul = MAS.Ability.VengLp.ForceMul
								if vel.z > 0.5 then vel.z = vel.z * 0.8 end
								ply:SetPos( ply:GetPos() + Vector( 0, 0, 3 ) )
								ply:SetVelocity( vel * forcemul + ply:GetUp() * 30 )
								
								net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
								net.WriteInt( ability, 4 )
								net.SendToServer()
								
							elseif self.KB["Btn"][btn] == ASWEP_Ability_VeteranStrength then 
							// Abil 3: Veteran Strength
								if ( self:GetIsCasting() or self:GetA3_CD() != 0 ) then 
									return 
								end
								local CD = MAS.Ability.VetSt.Cooldown
								self:SetA3_Active( true )
								self:SetIsCasting( true )
								self:SetA3_CD( CD )
								
								local ability = ASWEP_Ability_VeteranStrength
								
								net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
								net.WriteInt( ability, 4 )
								net.SendToServer()
								
							elseif self.KB["Btn"][btn] == ASWEP_Ability_MeteorDive then 
							// Ultimate: Meteor Dive
								if ( self:GetIsCasting() or self:GetAU_Active() ) then 
									return -- do nothing
								end
								
								self:SetIsCasting( true )
								local ability = ASWEP_Ability_MeteorDive
								
								net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
								net.WriteInt( ability, 4 )
								net.SendToServer()
								
							end // end Key Check
						end // end if cursor visible
						
						if self.KB["Btn"][btn] == ASWEP_Ability_Select then
						// Ability Selection
							self:DrawAbilitySelection()
							
						end // end Key check, cursor visible OK
						
					end // end Btn Pushed Check
				end // end if ply & alive & weapon
			end) // end Hook
		else // if game is SinglePlayer
			-- do nothing
		end // end if SinglePlayer
	
		// Run when key pressed
		hook.Add( "PlayerBindPress", "MAS.Keybind.FistsOfReprisal" .. ply:EntIndex(), function( ply, bind, down )
			local Wep = ply:GetActiveWeapon()
			if ( ply and ply:IsValid() and ply:Alive() and MASconvar_preventbinds:GetBool() and Wep:IsValid() and ply:GetActiveWeapon():GetClass() == "weapon_fistsofreprisal" ) then
				if ( string.find( bind, "impulse 100" ) or string.find( bind, "+menu" ) or string.find( bind, "+menu_context" ) ) then 
					return true
				end // end string find 
			end // end if Valid
		end) // end Hook
		
	end // end If Client
	
	self:SetHoldType( "fist" )
	if (SERVER) then
		self:SetCharge( 0 )
	end

end

function SWEP:DrawAbilitySelection()
	
	if ( MAS.Editor != nil ) then
		MAS.Editor:Remove()
		MAS.Editor = nil
	elseif !vgui.CursorVisible() then
		local x = ScrW()
		local y = ScrH()
		local BGColor = Color( 0, 130, 200, 200 )
		local FGColor = Color(50, 50, 50, 150)
		local BorderColor = Color( 0, 100, 165, 255 )
		local TColor1 = Color(255, 255, 255, 255)
		local TColor2 = Color(255, 180, 20, 255)
		local TColor3 = Color(255, 240, 220, 255)
		local TColorBG = Color(60, 60, 60, 255)
		local OvlColor = Color(255, 255, 0, 100)
		MAS.Editor = vgui.Create( "DFrame" ) //Create a Frame to contain everything.
		MAS.Editor:SetTitle( "" )
		MAS.Editor:SetSize( x, y )
		MAS.Editor:Center()
		MAS.Editor:SetVisible( true )
		MAS.Editor:ShowCloseButton( false )
		function MAS.Editor:Paint()
			surface.SetDrawColor( BGColor )
			surface.DrawRect( 0, 0, x, y )
			surface.SetDrawColor( BorderColor )
			for i=1, 6 do
				surface.DrawOutlinedRect( 0+i, 0+i, x - i*2, y - i*2 )
			end
			local Tx = x/2
			local Ty = y/20
			draw.SimpleText("Ability Selection", "MaranzoAbil_UltimateFont", Tx + 2, Ty + 2, TColorBG, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Ability Selection", "MaranzoAbil_UltimateFont", Tx, Ty, TColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
			
		local DButton = vgui.Create( "DButton", MAS.Editor )
		local size = 64
		local border = 12
		DButton:SetSize( size, size )
		DButton:SetPos( x - size - border, y - size - border )
		DButton:SetText( "Close" )
		DButton:SetTextColor( TColor1 )
		DButton:SetFontInternal( "MaranzoAbil_DefaultFont" )
		DButton:SetExpensiveShadow( 1, TColorBG )
		DButton.DoClick = function()
			MAS.Editor:Remove()
			MAS.Editor = nil
		end
		local Dw, Dh
		function DButton:Paint( w, h)
			Dw = w
			Dh = h
			draw.RoundedBox( 8, 0, 0, Dw, Dh, BorderColor )
			draw.RoundedBox( 8, 0, 0, Dw - 4, Dh - 4, FGColor )
		end
		
		
		MAS.Editor.Scroll = vgui.Create( "DScrollPanel", MAS.Editor ) //Create the Scroll panel
		MAS.Editor.Scroll:SetSize( x - 24, y - y/5 )
		MAS.Editor.Scroll:SetPos( 12, y/20 )
		
		MAS.Editor.List = vgui.Create( "DIconLayout", MAS.Editor.Scroll )
		MAS.Editor.List:SetSize( x - 30, y - y/5 )
		MAS.Editor.List:SetPos( 0, 0 )
		MAS.Editor.List:SetSpaceX( 5 )
		MAS.Editor.List:SetSpaceY( 10 )
		
		// Create list
		for k, v in ipairs( self.AbilityTable["Equipped"] ) do -- ipairs is a temp fix until I add additional abilities
			local ListItem = MAS.Editor.List:Add( "DPanel" ) //Add DPanel to the DIconLayout
			ListItem:SetSize( MAS.Editor.List:GetWide(), y/7 ) //Set the size of it
			function ListItem:Paint( w, h )
				local drawColor = Color( 255, 255, 255, 255 )
				local ability = k
				local material = ability_icons[ ability ] and ability_icons[ ability ].def or ability_icons[ ASWEP_Ability_AutoAttack ].def
				local size = 64
				local Tx = w/50
				local Ty = 2
				surface.SetMaterial( material )
				surface.SetDrawColor( drawColor )
				DrawCenteredRect( size/2 + Tx, h/2, size, size )
				draw.SimpleText( v["Category"], "MaranzoAbil_DefaultFont", Tx +2, 2 +2, TColorBG, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				draw.SimpleText( v["Category"], "MaranzoAbil_DefaultFont", Tx, 2, TColor2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				draw.SimpleText( v["Name"], "MaranzoAbil_DefaultFont", Tx +2, h - 28 +2, TColorBG, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				draw.SimpleText( v["Name"], "MaranzoAbil_DefaultFont", Tx, h - 28, TColor1, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
			end // end ListItem Paint
			
			local DLabel = vgui.Create( "DLabel", ListItem )
			local w = ListItem:GetWide()
			local h = ListItem:GetTall()
			local Tx, Sx
			if x > 1200 then
				if x > 1350 then Tx = w/7 Sx = w - Tx * 2.5
				else Tx = w/6 Sx = w - Tx * 2 end
			else Tx = w/4 Sx = w - Tx end
			
			local Ty = 12
			DLabel:SetSize( Sx, h - 14 )
			DLabel:SetPos( Tx, Ty )
			DLabel:SetText( v["Description"] )
			DLabel:SetContentAlignment( 4 )
			DLabel:SetTextColor( TColor3 )
			DLabel:SetTextInset( 0, 0 )
			DLabel:SetFontInternal( "MaranzoAbil_DefaultFont" )
			DLabel:SetWrap( true )
			DLabel:SetExpensiveShadow( 1, TColorBG )
			
		end // end For Loop List Creation
		
	end
	
end

function SWEP:DrawHUD()
	
	// Setup Var's used across the board
	local Combo = self:GetCombo()
	local Charge = self:GetCharge()
	local ability
	local ACTIVE
	local CD
	
	if !MASconvar_drawhud:GetBool() then return end
	// Ability Icon Draw
	local drawColor = ( prohibited ) and Color( 100, 100, 100, 255 ) or Color( 255, 255, 255, 255 ) -- shortened If statement	
	local size = ( menushown && ability == menu_ability ) and 128 or 64 // 128 | 64
	local ultsize = ( menushown && ability == menu_ability ) and 128 or 128 // 128 | 64
	
	-- positioning
	local x = ScrW()/2 -- Ult (Center)
	local y = ScrH() - 70
	local dif = 110
	local x0 = x - dif * 1.7 -- AA
	local x1 = x - dif
	local x2 = x + dif
	local x3 = x + dif * 1.7
	local TxtY = y + size * 0.65
	local Txt2Y = y + size * 0.65 + 2
	local TColor = Color(255, 255, 255, 255)
	local T2Color = Color(20, 20, 20, 255)
	
	// Auto-Attack
	ability = ASWEP_Ability_AutoAttack
	ACTIVE = self:GetAA_Active()
	CD = self:GetAA_CD()
	drawColor = ( CD > 0 ) and Color( 100, 100, 100, 255 ) or Color( 255, 255, 255, 255 ) -- shortened If statement
	surface.SetMaterial( ability_icons[ ability ].def )
	surface.SetDrawColor( drawColor )
	DrawCenteredRect( x0, y, size, size )
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x0 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x0, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	// Ability 1
	ability = ASWEP_Ability_ScornMark
	ACTIVE = self:GetA1_Active()
	CD = self:GetA1_CD()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if CD > 0 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x1, y, size, size )
			draw.SimpleText( CD, "MaranzoAbil_DefaultFont", x1, y, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x1, y, size, size )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 ) -- shortened If statement
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x1, y, size, size )
	end // end if Active
	
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x1 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x1, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
	// Ability 2
	ability = ASWEP_Ability_VengefulLeap
	ACTIVE = self:GetA2_Active()
	CD = self:GetA2_CD()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if CD > 0 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x2, y, size, size )
			draw.SimpleText( CD, "MaranzoAbil_DefaultFont", x2, y, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x2, y, size, size )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 )
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x2, y, size, size )
	end // end if Active
	
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x2 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x2, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
	// Ability 3
	ability = ASWEP_Ability_VeteranStrength
	ACTIVE = self:GetA3_Active()
	CD = self:GetA3_CD()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if CD > 0 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x3, y, size, size )
			draw.SimpleText( CD, "MaranzoAbil_DefaultFont", x3, y, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x3, y, size, size )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 )
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x3, y, size, size )
	end // end if Active
	
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x3 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x3, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	// Ultimate
	ability = ASWEP_Ability_MeteorDive
	ACTIVE = self:GetAU_Active()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if Charge < 100 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x, y - 32, size * 1.7, size * 1.7 )
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x, y - 32, ultsize, ultsize )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 )
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x, y - 32, ultsize, ultsize )
	end // end if Active
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x, TxtY, drawColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
----------------------------
	// Variables
	-- local ChargeColor = Color(40,200,255,180) - Nice Blue
	local ChargeColor = Color(255,255,255,255)
	local FullChargeColor = Color(255,200,40,180)
	local x = ScrW() * 0.5
	local y = ScrH() * 0.5
	
	// Combo HUD Draw
	if Combo > 2 then
		local color = Color(255,200,40,180)
		local ComboText = Combo .. " (" .. 1 + Combo/20 .. ")"
		local ComboAlpha = 255
		
		if Combo > 9 then
			if Combo > 20 then
				for i = 1, 2 do
					local Rand1 = math.random(-2, 2)
					local Rand2 = math.random(-2, 2)
					draw.SimpleText("Combo:", "MaranzoAbil_DefaultFont", x + Rand1 + 2, y + 30 + Rand2 + 2, Color(60, 60, 60, ComboAlpha * 1), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					draw.SimpleText("Combo:", "MaranzoAbil_DefaultFont", x + Rand1, y + 30 + Rand2, Color(255, 20, 20, ComboAlpha * 1), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			else // not Combo > 20
				ComboAlpha = Lerp(0.1, ComboAlpha, 0)
					local Rand1 = math.random(-1, 1)
					local Rand2 = math.random(-1, 1)
					draw.SimpleText("Combo:", "MaranzoAbil_DefaultFont", x + Rand1 + 2, y + 30 + Rand2 + 2, Color(60, 60, 60, ComboAlpha * 1), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					draw.SimpleText("Combo:", "MaranzoAbil_DefaultFont", x + Rand1, y + 30 + Rand2, Color(255, 255, 255, ComboAlpha * 1), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		else // not Combo > 9
			ComboAlpha = Lerp(0.1, ComboAlpha, 0)
			draw.SimpleText("Combo", "MaranzoAbil_DefaultFont", x, y + 30, Color(255, 255, 255, ComboAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					end
			draw.SimpleText(ComboText, "MaranzoAbil_DefaultFont", x, y + 50, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end // end Combo
	
	local y = ScrH() - 120
	
	// Charge HUD Draw
	if Charge >= MAS.Ability.MeteorDv.MaxCharge then
		-- do nothing
	elseif !ACTIVE then // not max charge & not active
		-- Draw Charge %
		local ChargeText = Charge.."%"
		draw.SimpleText(ChargeText, "MaranzoAbil_UltimateFont", x + 12, ScrH() - 98, Color( 20, 20, 20, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(ChargeText, "MaranzoAbil_UltimateFont" , x + 10, ScrH() - 100, ChargeColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	return true
  end

// Specifically draw crosshair
function SWEP:DoDrawCrosshair( x, y )	
	-- little box
    surface.SetDrawColor(0, 0, 0, 125)
    surface.DrawRect(x - 3, y - 3, 6, 6)
    
    surface.SetDrawColor(255, 255, 255, 150)
    surface.DrawRect( x - 2, y - 2, 4, 4)
	return true
end

function SWEP:SetupDataTables()

	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
	self:NetworkVar( "Float", 2, "AA_CD" )
	self:NetworkVar( "Float", 3, "A1_CD" )
	self:NetworkVar( "Float", 4, "A2_CD" )
	self:NetworkVar( "Float", 5, "A3_CD" )
	
	self:NetworkVar( "Int", 0, "Combo" )
	self:NetworkVar( "Int", 1, "Charge" )
	
	self:NetworkVar( "String", 0, "Ability" )
	
	self:NetworkVar( "Bool", 0, "AA_Active" )
	self:NetworkVar( "Bool", 1, "A1_Active" )
	self:NetworkVar( "Bool", 2, "A2_Active" )
	self:NetworkVar( "Bool", 3, "A3_Active" )
	self:NetworkVar( "Bool", 4, "AU_Active" )
	self:NetworkVar( "Bool", 5, "IsCasting" )
	self:NetworkVar( "Bool", 6, "CastOnLand" )

end

function SWEP:UpdateNextIdle( ply )
	
	local ply = ply or self.Owner
	local vm = ply:GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )

end

local reloadToggle = false
local reloadTime = CurTime()
function SWEP:Reload()
	
	local curtime = CurTime()
	if curtime < reloadTime then return end
	reloadTime = curtime + 0.5
	if self:GetAU_Active() or self:GetA2_Active() or self:GetA3_Active() then return end
	
	-- Visual FX
	local anim					=	reloadToggle and "fists_draw" or "fists_holster"
	local vm 					= 	self.Owner:GetViewModel()
	local speed 				= 	GetConVarNumber( "sv_defaultdeployspeed" ) or 1
	local Duration				= 	vm:SequenceDuration() / speed
	local CD					=	reloadToggle and Duration or 1000000000
	local HoldType				=	reloadToggle and "fist" or "normal"
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:SetHoldType( HoldType )
	self:SetNextPrimaryFire( curtime + CD )
	self:SetNextSecondaryFire( curtime + CD )
	self:SetNextIdle( curtime + CD )
	
	reloadToggle = !reloadToggle
	self:SetIsCasting( reloadToggle )
	
	return false
end

--
-- Called when the left mouse button is pressed
--
function SWEP:PrimaryAttack( right )
	
	local ply = self.Owner
	
	self:SetAA_Active( true )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:SetNextMeleeAttack( CurTime() + 0.2 * self.ModDelay )
	local combo = self:GetCombo()
	
	local anim = "fists_left"
	if ( right ) then 	// Ability 1: Scorn Mark
		anim = "fists_right"
		CD = self.SwingDelay2 * self.ModDelay
		self:SetAA_CD( CD )
		timer.Simple( CD, function()
			if self:IsValid() and !self:GetAA_Active() then self:SetAA_CD( 0 ) end
		end)
		self:SetNextPrimaryFire( CurTime() + CD )
		self:SetNextSecondaryFire( CurTime() + self.SwingDelay1 * self.ModDelay )
		
	else // Not A1, is AA
		local rand = math.Round(CurTime()) / 2
		if ( math.Round(rand) == rand ) then anim = "fists_left" else anim = "fists_right" end
		CD = self.SwingDelay1 * self.ModDelay
		self:SetAA_CD( CD )
		timer.Simple( CD, function()
			if self:IsValid() and !self:GetAA_Active() then self:SetAA_CD( 0 ) end
		end)
		self:SetNextPrimaryFire( CurTime() + CD )
		self:SetNextSecondaryFire( CurTime() + CD )
	end // end if AA
	
	if ( combo > 2 ) then
		if (combo / 3) == math.floor(combo / 3) then anim = "fists_uppercut" end 
		self.ModDmg = 1 + combo/20
		if	( combo > 5 ) then
			if	( combo > 10 ) then
				if ( combo > 20 ) then
					self.ModDelay = 0.7
				else // not > 20
					self.ModDelay = 0.8
				end
			else // not > 10
				self.ModDelay = 0.9
			end
		end
	end
	
	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:EmitSound( SwingSound )
	self:UpdateNextIdle()

end

function SWEP:SecondaryAttack()
	
	if !IsFirstTimePredicted() then return end
	local A1_CD = self:GetA1_CD()
	local AA_CD = self:GetAA_CD()
	
	if ( A1_CD != 0 ) then return end
	
	local CD = MAS.Ability.ScornMk.Cooldown
	self:SetA1_Active( true )
	self:SetA1_CD( CD )
	self:PrimaryAttack( true )
	
end

function SWEP:DealDamage( ability )

	local anim = self:GetSequenceName(self.Owner:GetViewModel():GetSequence())
	self.Owner:LagCompensation( true )
	local tr = util.TraceLine( {
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
		filter = self.Owner,
		mask = MASK_SHOT_HULL
	} )

	if ( !IsValid( tr.Entity ) ) then
		tr = util.TraceHull( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
			filter = self.Owner,
			mins = Vector( -10, -10, -8 ),
			maxs = Vector( 10, 10, 8 ),
			mask = MASK_SHOT_HULL
		} )

	end

	-- We need the second part for single player because SWEP:Think is ran shared in SP
	if ( tr.Hit && !( game.SinglePlayer() && CLIENT ) ) then
		self:EmitSound( HitSound )
	end

	self.Hit = false

	if ( SERVER && IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) ) then
		
		local dmginfo = DamageInfo()
		local attacker = self.Owner
		if ( !IsValid( attacker ) ) then attacker = self end

		dmginfo:SetAttacker( attacker )
		dmginfo:SetInflictor( self )
		dmginfo:SetDamage( self.Primary.Damage * self.ModDmg )

		if ( anim == "fists_left" ) then
			dmginfo:SetDamageForce( self.Owner:GetRight() * 4912 + self.Owner:GetForward() * 9998 ) -- Yes we need those specific numbers
		elseif ( anim == "fists_right" ) then
			dmginfo:SetDamageForce( self.Owner:GetRight() * -4912 + self.Owner:GetForward() * 9989 )
		elseif ( anim == "fists_uppercut" ) then
			dmginfo:SetDamageForce( self.Owner:GetUp() * 5158 + self.Owner:GetForward() * 10012 )
			dmginfo:SetDamage( self.Primary.DamageUppercut * self.ModDmg )
		end
		
		if ability then
			if ability == ASWEP_Ability_ScornMark then
				self:ScornMark( tr.Entity )
				dmginfo:SetDamage( MAS.Ability.ScornMk.Damage * self.ModDmg )
			end
		end

		tr.Entity:TakeDamageInfo( dmginfo )
		
		self.Hit = true

	end // end if Server & Entity

	if ( SERVER && IsValid( tr.Entity ) ) then
	
		local phys = tr.Entity:GetPhysicsObject()
		if ( IsValid( phys ) ) then
			phys:ApplyForceOffset( self.Owner:GetAimVector() * 80 * phys:GetMass(), tr.HitPos )
		end

	end

	if ( SERVER ) then
		if ( self.Hit ) then
			local ply = self.Owner
			local charge = self:GetCharge() + 1
			local combo = self:GetCombo()
			self:SetCombo( combo + 1 )
			self:SetCharge( charge )
			self.HitTime = CurTime()
			
			// Heal on Hit
			local health = ply:Health() + 1 * self.ModDmg
			if (ply:GetMaxHealth() < health) then health = ply:GetMaxHealth() end
			if (ply:Health() > health) then health = ply:Health() end
			ply:SetHealth(health)
			
			// Heal on Kill
			if tr.Entity:Health() <= 0 then
				local health = ply:Health() + 4 * self.ModDmg
				self:SetCharge( charge + 5 )
				if (ply:GetMaxHealth() < health) then health = ply:GetMaxHealth() end
				if (ply:Health() > health) then health = ply:Health() end
				ply:SetHealth(health)
			end
			
		end // end If Hit
	end // end If Server

	self.Owner:LagCompensation( false )

end // end DealDamage Function

//// SCORN MARK Debuff ////
function SWEP:ScornMark( target )
	
	local ply	=	self.Owner
	local CD	=	self:GetA1_CD()
	
	if SERVER then
		if ply:IsValid() and ply:Alive() and CD > 0 and target:IsValid() and target:Health() > 0 then
			
			// Get the Target's original values
			local Mult = 0.5
			local T_SGravity = target:GetGravity()
			local T_SRunSpeed, T_SWalkSpeed
			target:SetGravity( T_SGravity / Mult )
			if target:IsPlayer() then
				T_SRunSpeed = target:GetRunSpeed()
				T_SWalkSpeed = target:GetWalkSpeed()
			// Set the Target's new values
				target:SetWalkSpeed( T_SWalkSpeed * Mult )
				target:SetRunSpeed( T_SRunSpeed * Mult )
			end
			
			//Effect
			local Origin = target:GetPos() + Vector(0,0,1)
			playEffect( Origin, target, 1, "VortDispel" )
			playEffect( Origin, target, 1, "StriderBlood" )
			target:EmitSound( MAS.Ability.ScornMk.SoundHit )
			
			// Deal extra damage on future hits
			hook.Add( "EntityTakeDamage", "MAS.Ability.ScornMark.Debuff".. ply:EntIndex() .. "." .. target:EntIndex(), function( ent, dmginfo )
				if ent == target and dmginfo:GetAttacker() == ply and dmginfo:GetInflictor() == self then
					local dmg = dmginfo:GetDamage() * MAS.Ability.ScornMk.DmgMul
					dmginfo:SetDamage( dmg )
				end
			end) // end Hook
			
			// Set the Target's normal values
			local dur = MAS.Ability.ScornMk.Duration
			timer.Create( "MAS.Ability.ScornMark.Debuff".. ply:EntIndex() .. "." .. target:EntIndex(), dur, 1, function()
				hook.Remove( "EntityTakeDamage", "MAS.Ability.ScornMark.Debuff".. ply:EntIndex() .. "." .. target:EntIndex() )
				if target:IsValid() and target:Health() > 0 then
					target:SetGravity( T_SGravity )
					if target:IsPlayer() then
						target:SetWalkSpeed( T_SWalkSpeed )
						target:SetRunSpeed( T_SRunSpeed )
					end
				end // end if valid
			end) // end timer
			
		end // end Checks
	end // end If Server
	
end // end ScornMark Ability

//// VETERAN STRENGTH Buff ////
function SWEP:VeteranStrength( ply, self, SWEP )
	-- Heal self & gain extra damage
	local ply	=	ply or SWEP.Owner
	local CD	=	SWEP:GetA3_CD()
	
	if SERVER then
		if ply:IsValid() and ply:Alive() and CD > 0 then
			
			// Set future variables
			local dmgmul	=	MAS.Ability.VetSt.DmgMul	-- damage mul
			local ls 		= 	MAS.Ability.VetSt.LSMul 	-- hp LS
			local als 		= 	MAS.Ability.VetSt.ALS 		-- armor LS
			local heal 		= 	MAS.Ability.VetSt.Heal 		-- Heal on Use
			
			// Heal on Use
			local health = ply:Health() + heal
			if (ply:GetMaxHealth() < health) then -- if HP full, do nothing
				health = ply:GetMaxHealth()
			end
			ply:SetHealth(health)
			
			// Deal extra damage on future hits
			hook.Add( "EntityTakeDamage", "MAS.Ability.VeteranStrength.Buff"..ply:EntIndex(), function( ent, dmginfo )
				if dmginfo:GetAttacker() == ply and dmginfo:GetInflictor() == self then
					local dmg = dmginfo:GetDamage() * dmgmul
					dmginfo:SetDamage( dmg )
					
					// Heal on Hit
					if ply:IsValid() and ply:Alive() then
						
						local health = ply:Health() + dmg * ls
						if (ply:GetMaxHealth() < health) then -- if HP full, overcharge to shield!
							health = ply:GetMaxHealth() 
							if (ply:Health() > health) then health = ply:Health() end
							local armor = ply:Armor() + als
							ply:SetArmor(armor)
						end
						ply:SetHealth(health)
					end
				end
			end) // end Hook
			
			// Set the Target's normal values
			local dur = MAS.Ability.VetSt.Duration
			timer.Create( "MAS.Ability.VeteranStrength.Buff" .. ply:EntIndex(), dur, 1, function()
				hook.Remove( "EntityTakeDamage", "MAS.Ability.VeteranStrength.Buff"..ply:EntIndex() )
			end) // end timer
			
		end // end Checks
	end // end If Server
	
end // end ScornMark Ability


///// ULTIMATE ABILITY /////
function SWEP:Ult( ply )
	
	local ply = ply or self.Owner
	
	local Charge = self:GetCharge()
	
	if Charge >= 100 then -- ULTIMATE Ability
		if !self:GetIsCasting() and ply:IsValid() and ply:Alive() then
			self:SetAU_Active( true )
			self:SetIsCasting( true )
			local timeset	 			= 	0
			local vel 					= 	ply:GetVelocity()
			local vm 					= 	ply:GetViewModel()
			local anim					=	"fists_holster"
			local speed 				= 	GetConVarNumber( "sv_defaultdeployspeed" ) or 1
			local WEP					=	ply:GetActiveWeapon()
			ply:SetVelocity( -Vector(0,0,vel.Z) ) 			-- slow / stop decent
			ply:EmitSound( MAS.Ability.MeteorDv.Sound1 )
			vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
			local dur = 1.2
			WEP:SetNextPrimaryFire( CurTime() + dur )
			WEP:SetNextSecondaryFire( CurTime() + dur )
			self:SetNextIdle( CurTime() + dur + 1 )
			if SERVER then
				ply:SetPos( ply:GetPos() + ply:GetUp() * 2 ) 	-- move ply up a bit for boost
				
				hook.Add("EntityTakeDamage", "MAS.Ability.MeteorDive.OnTakeDamage" .. ply:EntIndex(), function( ent, DmgInfo )
				
					if ent == ply then
						if ply:GetActiveWeapon():GetClass() == "weapon_fistsofreprisal" and self:GetAU_Active() then 
							if DmgInfo:IsFallDamage() then DmgInfo:SetDamage( 0 ) end
						else 
							hook.Remove( "EntityTakeDamage", "MAS.Ability.MeteorDive.OnTakeDamage" .. ply:EntIndex() )
							return
						end
					end
				end) // end Hook
			end
			
			-- Effect!
			local Origin = ply:GetPos() + Vector( 0, 0, 5 )
			
			self:SetCharge( 0 )
			
			local Dur = 1
			local itDur = 10
			timer.Create( "MAS.Ability.MeteorDive.Cast"..ply:EntIndex() , Dur/itDur, itDur, function()
				itDur = itDur - 1
				if ( ply:IsValid() && ply:Alive() ) then
					if	(SERVER) then
			
						playEffect( Origin, ply, 1, "ThumperDust", 1, 20, 1 )
						local health = ply:Health()
						if health < ply:GetMaxHealth() then	-- Don't lower overhealed HP
							health = health + MAS.Ability.MeteorDv.Heal
							if health > ply:GetMaxHealth() then health = ply:GetMaxHealth() end -- Don't Overheal
							if (ply:Health() > health) then health = ply:Health() end -- Don't go down to max HP if already up
						end
						ply:SetHealth( health )
						
						local armor = ply:Armor()
						if armor < 100 then 				-- Don't lower oveshield
							armor = armor + MAS.Ability.MeteorDv.Arm
							if armor > 100 then armor = 100 end -- Don't Overshield
						end
						ply:SetArmor( armor )
					end // end if Server
					
					if itDur == 0 then
						timer.Simple( 0.1, function()
							if ply:IsValid() and ply:Alive() then
								if WEP:IsValid() and WEP:GetClass() == "weapon_fistsofreprisal" then
									anim = "fists_draw"
									vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
									self:UpdateNextIdle( ply )
									local dur = vm:SequenceDuration() / speed
									WEP:SetNextPrimaryFire( CurTime() + dur )
									WEP:SetNextSecondaryFire( CurTime() + dur )
								end
								ply:EmitSound( MAS.Ability.MeteorDv.Sound2 )
								self:SetCastOnLand( true )
								local vel = ply:GetAimVector()
								if vel.z > 0.5 then vel.z = vel.z * 0.8 end
								ply:SetVelocity( vel * 1500 + ply:GetUp() * 30 )
							end
						end) // end timer
					end // end if Dur == 0
					
				else // end if Ply valid
					timer.Remove( "MAS.Ability.MeteorDive.Cast" )
				end
			end)
		end // end if Is Casting
	else // end if charge 100%
		if Maranzos_AbilitySWEPs.FoR_InfUlt then
			self:SetCharge( 100 )
		end
	end
	return true
end

// Dropped Weapon
function SWEP:OnDrop()

	self:Remove() -- You can't drop fists

end

// Holster
function SWEP:Holster()
	-- Prevent abilities from working if weapon switched to prevent abuse
	if SERVER and ( self:GetA2_Active() or self:GetAU_Active() ) then
		self.Owner:ChatPrint( "[MAS] Fists of Reprisal: Ability Canceled - Weapon Switched")
	end
	reloadToggle = false
	self:SetCastOnLand( false )
	self:SetA2_Active( false )
	self:SetAU_Active( false )
	self:SetIsCasting( false )
	return true
	
end

// Weapon Info
function SWEP:PrintWeaponInfo(x, y, alpha)

	if (self.DrawWeaponInfoBox == false) then return end

	if (self.InfoMarkup == nil) then
		local str
		local title_color = "<color = 255, 200, 0, 255>"
		local hl_color = "<color = 247, 168, 32, 200>"
		local text_color = "<color = 255, 255, 255, 200>"
		
		str = "<font=DermaDefaultBold>"
		if (self.Author != "") then str = str .. title_color .. "Author:</color>\t" .. text_color .. self.Author .. "</color>\n" end
		if (self.Contact != "") then str = str .. title_color .. "Contact:</color>\t" .. text_color .. self.Contact .. "</color>\n\n" end
		if (self.Purpose != "") then str = str .. title_color .. "Purpose:</color>\n" .. text_color .. self.Purpose .. "</color>\n\n" end

		-- Set the instructions
		if (self.Instructions != "") then str = str .. title_color .. "Instructions:</color>\n"
			local myInstr = self.Instr
			for i = 1, table.Count(myInstr) do
				local HL = myInstr["H"..i]
				local TL = myInstr[""..i]
				if ( HL != nil ) then
					str = str .. hl_color .. HL .. text_color .. TL .. "\n"
					table.remove( myInstr, i )
					table.remove( myInstr, tostring(i) )
				elseif TL != nil then -- If No Headline, then Check Text Line
					str = str .. text_color .. TL .. "\n"
				end
			end
		end // end of Instructions
		str = str .. "</font>"
		
		self.InfoMarkup = markup.Parse(str, 250)
	end
	
	local outerColor 	= 	Color( 0, 100, 165, 255 )
	local innerColor 	= 	Color( 0, 130, 200, 255 )
	
	surface.SetDrawColor(outerColor)
	surface.SetTexture(self.SpeechBubbleLid)
	surface.DrawTexturedRect(x, y - 69.5, 128, 64) 
	draw.RoundedBox(8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, outerColor)
	draw.RoundedBox(8, x - 2, y - 3, 254, self.InfoMarkup:GetHeight() + 12, innerColor)
	
	self.InfoMarkup:Draw(x + 5, y + 5, nil, nil, alpha)
end

// Deployed Weapon
function SWEP:Deploy()
	
	local speed = GetConVarNumber( "sv_defaultdeployspeed" ) or 1
	local vm = self.Owner:GetViewModel()
	vm:SetPlaybackRate( speed )
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_draw" ) )
	local dur = vm:SequenceDuration() / speed
	self:SetNextPrimaryFire( CurTime() + dur )
	self:SetNextSecondaryFire( CurTime() + dur )
	self:UpdateNextIdle()

	if ( SERVER ) then
		self:SetCombo( 0 )
	else // Client
		self.DrawCrosshair		= 	GetConVar( "cl_mas_crosshairon" ):GetBool()
	end
	
	return true

end // end Fn Deploy

// Weapons Think Too
function SWEP:Think()
	
	local ply = self.Owner
	local vm = self.Owner:GetViewModel()
	local curtime = CurTime()
	local idletime = self:GetNextIdle()
	
	if CLIENT and game.SinglePlayer() then -- is SinglePlayer
		
		if !vgui.CursorVisible() and !vgui.GetKeyboardFocus() and self.KB then -- Not in menu, Key table exists
		
			local Wep = ply:GetActiveWeapon()
			if !( ply:IsValid() and ply:Alive() and Wep:IsValid() and Wep:GetClass() == "weapon_fistsofreprisal" ) then return end
			
			for btn, ability in pairs( self.KB["Btn"] ) do
				if ability != 1 and ability != 2 then
					if ( input.IsButtonDown( btn ) ) and !table.HasValue( keysDown, btn ) then
						table.insert( keysDown, btn )
						
						if ( ply:IsValid() and ply:Alive() and Wep:IsValid() and Wep:GetClass() == "weapon_fistsofreprisal" ) then
							-- AutoAttack & Ability #1:Scorn Mark are bound to +attack & +attack2 by default & won't trigger anything here.
							
							if ability == ASWEP_Ability_VengefulLeap then 
							// Abil 2: Vengeful Leap
								if ( self:GetIsCasting() or self:GetA2_CD() != 0 ) then 
									return 
								end
								local ability = ASWEP_Ability_VengefulLeap
								local CD = MAS.Ability.VengLp.Cooldown
								self:SetA2_Active( true )
								self:SetIsCasting( true )
								self:SetA2_CD( CD )
							
								-- Launch!
								local vel = ply:GetAimVector()
								local forcemul = MAS.Ability.VengLp.ForceMul
								if vel.z > 0.5 then vel.z = vel.z * 0.8 end
								ply:SetPos( ply:GetPos() + Vector( 0, 0, 3 ) )
								ply:SetVelocity( vel * forcemul + ply:GetUp() * 30 )
								
								net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
								net.WriteInt( ability, 4 )
								net.SendToServer()
								
							elseif ability == ASWEP_Ability_VeteranStrength then 
							// Abil 3: Veteran Strength
								if ( self:GetIsCasting() or self:GetA3_CD() != 0 ) then 
									return 
								end
								local CD = MAS.Ability.VetSt.Cooldown
								self:SetA3_Active( true )
								self:SetIsCasting( true )
								self:SetA3_CD( CD )
								
								local ability = ASWEP_Ability_VeteranStrength
								
								net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
								net.WriteInt( ability, 4 )
								net.SendToServer()
								
							elseif ability == ASWEP_Ability_MeteorDive then 
							// Ultimate: Meteor Dive
								if ( self:GetIsCasting() or self:GetAU_Active() ) then 
									return -- do nothing
								end
								
								self:SetIsCasting( true )
								local ability = ASWEP_Ability_MeteorDive
								
								net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
								net.WriteInt( ability, 4 )
								net.SendToServer()
								
							end // end Key Check
							
							if ability == ASWEP_Ability_Select then
							// Ability Selection
								self:DrawAbilitySelection()
								
							end // end Key check, cursor visible OK <-- Not set currently for SP
							
						end // end if ply & alive & weapon
						
					elseif !( input.IsButtonDown( btn ) ) and table.HasValue( keysDown, btn ) then
						table.RemoveByValue( keysDown, btn )
					end // end Btn Release
				end // end AutoAttack & Ability 1 check
			end // end For Btn check
		end // end  if !Mouse Visible
	end // end SinglePlayer
	
	if ( idletime > 0 && curtime > idletime ) then
		
		vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_idle_0" .. math.random( 1, 2 ) ) )
		self:UpdateNextIdle()
	
	end

	local meleetime = self:GetNextMeleeAttack()
	if ( meleetime > 0 && curtime > meleetime ) then

		self:SetNextMeleeAttack( 0 )
		self:SetAA_Active( false )
		
		-- If Ability 1: Scorn Mark
		if ( self:GetA1_Active() ) then 
			
			-- Do Scorn Mark
			self:DealDamage( ASWEP_Ability_ScornMark )
			self:SetA1_Active( false )
			local CD = self:GetA1_CD()
			local itCD = CD
			timer.Create( "MAS.Ability.ScornMark.CD" .. ply:EntIndex(), 1, itCD, function()
				if self:IsValid() then
					CD = CD - 1
					self:SetA1_CD( CD )
				else
					timer.Remove( "MAS.Ability.ScornMark.CD" .. ply:EntIndex() )
				end
			end)
			
		else // end if an ability
			self:DealDamage()
		end

	end
	
	if (SERVER) then
		
		// Set up Variables across the board
		local CastOnLand = self:GetCastOnLand()
		
		// Vengeful Leap
		if self:GetA2_Active() then
		
			if CastOnLand then
				
				local Landed = ply:OnGround()
				
				if Landed then
					local insphere = ents.FindInSphere( ply:GetPos(), 200 )
					local targets = {}
					
					local dmginfo = DamageInfo()
					local attacker = self.Owner
					if ( !IsValid( attacker ) ) then attacker = self end
					
			
					dmginfo:SetAttacker( attacker )
					dmginfo:SetInflictor( self )
					dmginfo:SetDamage( MAS.Ability.VengLp.Damage )
					
					local origin = ply:GetPos()
					local forcemul = MAS.Ability.VengLp.ForceMul
					
					for k, v in ipairs(insphere) do
						if (!v:Health() or v:Health() == 0 or v == ply) and v:GetClass() != "prop_physics" then continue end
						table.insert(targets,v)
						
						-- Damage!
						local entpos	=	v:GetPos()
						local dist 		=	math.Clamp((math.Distance(origin.x, origin.y, entpos.x, entpos.y) / 100), 1, 100)
						local force 	= 	(-(origin - entpos):GetNormalized() * forcemul*0.4 + Vector(0,0,300) ) / dist
						if (v:GetClass()=="prop_physics" and v:GetPhysicsObject():IsValid()) then 
							v:GetPhysicsObject():SetVelocity( force / 5 )
						else 
							dmginfo:SetDamageForce( force )
							v:TakeDamageInfo( dmginfo )
							if v:GetClass() == "npc_strider" then force = Vector( 0, 0, 0 ) end -- prevent striders fly glitch
							v:SetVelocity( force ) 
						end
					end
					
					-- Effect & Sound
					local Origin = ply:GetPos() + Vector( 0, 0, 1)
					playEffect( Origin, ply, 1, "WheelDust", 5, 1, 1 )
					playEffect( Origin, ply, 1, "ThumperDust", 2, 100, 1 )
					ply:EmitSound( MAS.Ability.VengLp.SoundLand )
					-- Turn it off
					self:SetA2_Active( false )
					self:SetIsCasting( false )
					self:SetCastOnLand( false )
					hook.Remove( "EntityTakeDamage", "MAS.FistsOfReprisal.OnTakeFallDamage" .. ply:EntIndex() )
				
				end // end on ground
				
			end // end Cast on Land
					
		end // end Ability 2: Vengeful Leap
		
		// Ultimate
		if self:GetAU_Active() then
			if ( !CastOnLand ) then
				local vel = ply:GetVelocity()
				ply:SetVelocity( -vel )
			elseif ( CastOnLand ) then
				
				local Landed = ply:OnGround()
				
				if Landed then
					local insphere = ents.FindInSphere( ply:GetPos(), 200 )
					local targets = {}
					
				local dmginfo = DamageInfo()
				local attacker = self.Owner
				if ( !IsValid( attacker ) ) then attacker = self end
		
				dmginfo:SetAttacker( attacker )
				dmginfo:SetInflictor( self )
				dmginfo:SetDamage( MAS.Ability.MeteorDv.Damage * self.ModDmg )
				
				local origin = ply:GetPos()
				
				for k, v in ipairs(insphere) do
					if (!v:Health() or v:Health() == 0 or v == ply) and v:GetClass() != "prop_physics" then continue end
					
					-- Damage!
					local entpos	=	v:GetPos()
					local dist 		=	math.Clamp((math.Distance(origin.x, origin.y, entpos.x, entpos.y) / 100), 1, 100)
					local force 	= 	(-(origin - entpos):GetNormalized() * 1500 + Vector(0,0,300) ) / dist
					local rand		=	math.random(1,3)
					if (v:GetClass()=="prop_physics" and v:GetPhysicsObject():IsValid()) then 
						v:GetPhysicsObject():SetVelocity( force / 5 )
					else 
						if rand == 1 then playEffect( entpos, v, 1, "Explosion" ) end
						dmginfo:SetDamageForce( force )
						v:TakeDamageInfo( dmginfo )
						if v:GetClass() == "npc_strider" then force = Vector( 0, 0, 0 ) end -- prevent striders fly glitch
						v:SetVelocity( force ) 
						table.insert(targets,v)
					end
				end
				
				self:SetCharge( self:GetCharge() + math.Round(3 * self.ModDmg * #targets) )
				self:SetCombo(#targets * 5)
				self.HitTime = curtime + 5
				-- Effect!
				local Origin = ply:GetPos() + Vector( 0, 0, 5 )
				playEffect( Origin, ply, 1, "ThumperDust", 1, -20 )
				playEffect( Origin, ply, 1, "ThumperDust", 1, 200 )
				playEffect( Origin, ply, 1, "Explosion" )
				ply:EmitSound( MAS.Ability.MeteorDv.SoundLand )
				ply:EmitSound( MAS.Ability.MeteorDv.SoundLand2 )
				-- Values off
				self:SetCastOnLand( false )
				self:SetAU_Active( false )
				self:SetIsCasting( false )
				hook.Remove("EntityTakeDamage", "MAS.Ability.MeteorDive.OnTakeDamage" .. ply:EntIndex())
					
				end // if on ground
			end // end if Abil on Land
		end // end if Ult Active
		
		
		
		if ( curtime > self.HitTime + 1 ) then
	
			self:SetCombo( 0 )
			self.ModDelay = 1
			self.ModDmg = 1
	
		end
		
	end // End if Server
	
end // end SWEP think


----------------------------------------------------------------------
---- Net Usage

if (SERVER) then
	
	util.AddNetworkString( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
	util.AddNetworkString( "Maranzo_AbilitySWEP_FistsOfReprisal_CastCancel" )

	// Run the real ability server-side
	net.Receive( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast", function( len, ply )
		
		if ( IsValid( ply ) and ply:Alive() and ply:GetActiveWeapon():GetClass() == "weapon_fistsofreprisal" ) then
			local ability = net.ReadInt( 4 )
			local Wep = ply:GetActiveWeapon()
			local SWEP = Wep:GetTable()
				
			if ability == ASWEP_Ability_VengefulLeap then 
				if ( !SWEP:GetA2_Active() and !SWEP:GetIsCasting() and SWEP:GetA2_CD() == 0 ) then 
					-- Prevent more abilities
					SWEP:SetA2_Active( true )
					SWEP:SetIsCasting( true )
					
					-- Launch!
					local vel = ply:GetAimVector()
					local forcemul = MAS.Ability.VengLp.ForceMul
					if vel.z > 0.5 then vel.z = vel.z * 0.8 end
					ply:SetPos( ply:GetPos() + Vector( 0, 0, 3 ) )
					ply:SetVelocity( vel * forcemul + ply:GetUp() * 30 )
					ply:EmitSound( MAS.Ability.VengLp.Sound1 )
					local Origin = ply:GetPos() + Vector( 0, 0, 5)
					playEffect( Origin, ply, 1, "WheelDust", 5 )
						
					hook.Add("EntityTakeDamage", "MAS.FistsOfReprisal.OnTakeFallDamage" .. ply:EntIndex(), function( ent, DmgInfo )
			
						if ent == ply then
							if Wep:IsValid() and SWEP:GetA2_Active() then 
								if DmgInfo:IsFallDamage() then DmgInfo:SetDamage( 0 ) end
							else 
								hook.Remove( "EntityTakeDamage", "MAS.FistsOfReprisal.OnTakeFallDamage" .. ply:EntIndex() )
								return
							end
						end
					end)
					
					-- Ability Activates
					timer.Simple( 0.1, function() 
						if Wep:IsValid() then 
							SWEP:SetCastOnLand( true )
						end
					end )
					
					-- Cooldown Active
					local CD = MAS.Ability.VengLp.Cooldown
					SWEP:SetA2_CD( CD )
					local itCD = CD
					timer.Create( "MAS.Ability.VengefulLeap.CD" .. ply:EntIndex(), 1, itCD, function()
						if Wep:IsValid() then
							CD = CD - 1
							SWEP:SetA2_CD( CD )
						else
							timer.Remove( "MAS.Ability.VengefulLeap.CD" .. ply:EntIndex() )
						end
					end)
					
					-- Let the player know CD Active
					net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
					net.WriteInt( ability, 4 )
					net.Send( ply )
					
				end
				
			elseif ability == ASWEP_Ability_VeteranStrength then 
				
				if ( !SWEP:GetA3_Active() and !SWEP:GetIsCasting() and SWEP:GetA3_CD() == 0 ) then
					
					-- Activate Veteran Strength ability ( May be used with others )
					SWEP:SetA3_Active( true )
					ply:EmitSound( MAS.Ability.VetSt.Sound1 )
					local CD = MAS.Ability.VetSt.Cooldown
					SWEP:SetA3_CD( CD )
					SWEP:VeteranStrength( ply, Wep, SWEP )
					
					-- Deactivate ability
					local dur = MAS.Ability.VetSt.Duration
					timer.Simple( dur, function() 
						if Wep:IsValid() then 
							SWEP:SetA3_Active( false ) 
						end
					end )
					
					-- Countdown CD on server
					local itCD = CD
					timer.Create( "MAS.Ability.VeteranStrength.CD" .. ply:EntIndex() , 1, itCD, function()
						if Wep:IsValid() then
							CD = CD - 1
							SWEP:SetA3_CD( CD )
						else
							timer.Remove( "MAS.Ability.VeteranStrength.CD" .. ply:EntIndex() )
						end
					end)
					
					-- Tell ply to countdown CD if server lags
					net.Start( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast" )
					net.WriteInt( ability, 4 )
					net.Send( ply )
				end
				
				
			elseif ability == ASWEP_Ability_MeteorDive then 
				
				if ( !SWEP:GetAU_Active() and !SWEP:GetIsCasting() ) then
					SWEP:Ult( ply )
				end
				
			end
			
		end // end If Ply & Weapon
		
	end ) // end Net Receive
	
end

if (CLIENT) then

	net.Receive( "Maranzo_AbilitySWEP_FistsOfReprisal_Cast", function( len, ply )
		
		local ply = LocalPlayer()
		local Wep = ply:GetActiveWeapon()
		local SWEP = Wep:GetTable()
		
		if ( IsValid( ply ) and ply:Alive() and ply:GetActiveWeapon():GetClass() == "weapon_fistsofreprisal" ) then
			local ability = net.ReadInt( 4 )
			
			if ability == ASWEP_Ability_VengefulLeap then 
				timer.Simple( 0.1, function()
					if Wep:IsValid() then
						
						-- Countdown CD
						local CD = SWEP:GetA2_CD()
						local itCD = CD
						timer.Create( "MAS.Ability.VengefulLeap.CD" .. ply:EntIndex(), 1, itCD, function()
							if Wep:IsValid() then
								CD = CD - 1
								SWEP:SetA2_CD( CD )
							end
						end)
						
					end
				end)
				
				
			elseif ability == ASWEP_Ability_VeteranStrength then 
				timer.Simple( 0.1, function()
					if Wep:IsValid() then
					
						-- Deactivate Ability
						local dur = MAS.Ability.VetSt.Duration
						timer.Simple( dur, function() 
							if Wep:IsValid() then 
								SWEP:SetA3_Active( false ) 
							end
						end )
						
						-- Countdown CD
						local CD = SWEP:GetA3_CD()
						local itCD = CD
						timer.Create( "MAS.Ability.Strength.CD" .. ply:EntIndex(), 1, itCD, function()
							if Wep:IsValid() then
								CD = CD - 1
								SWEP:SetA3_CD( CD )
							end
						end)
					end
				end)
				
				
			elseif ability == ASWEP_Ability_MeteorDive then 
				
			end
			
		end // end If Ply & Weapon
		
	end ) // end Net Receive
	
	
	
end
--PATH addons/realistichandcuffs/lua/weapons/weapon_r_handcuffs/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName = "Handcuffs"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "ToBadForYou"
SWEP.Instructions = "Left Click: Restrain/Release. \nRight Click: Force Players out of vehicle. \nReload: Inspect."
SWEP.Contact = ""
SWEP.Purpose = ""

SWEP.HoldType = "melee";
SWEP.ViewModel = "models/tobadforyou/c_hand_cuffs.mdl";
SWEP.WorldModel = "models/tobadforyou/c_hand_cuffs.mdl";
SWEP.UseHands = true

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "melee"
SWEP.Category = "ToBadForYou"
SWEP.UID = 76561199385207507

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

local LangTbl = RHandcuffsConfig.Language[RHandcuffsConfig.LanguageToUse]

function SWEP:Initialize() self:SetWeaponHoldType("melee") end
function SWEP:CanPrimaryAttack ( ) return true; end

function SWEP:PlayCuffSound(Time)
	timer.Simple(Time, function() if IsValid(self) then self:EmitSound(RHandcuffsConfig.CuffSound) end end)
	timer.Simple(Time+1, function() if IsValid(self) then self:EmitSound(RHandcuffsConfig.CuffSound) end end)
end

function SWEP:Think()
	local PlayerToCuff = self.AttemptToCuff
	if IsValid(PlayerToCuff) then
		local vm = self.Owner:GetViewModel();
		local ResetSeq, Time1 = vm:LookupSequence("Reset")
		
		if self.CuffingRagdoll then
			if PlayerToCuff:GetPos():Distance(self.Owner:GetPos()) > 400 then
				PlayerToCuff = nil
				vm:SendViewModelMatchingSequence(ResetSeq)	
				vm:SetPlaybackRate(2)	
			elseif CurTime() >= self.AttemptCuffFinish then
				if SERVER then
					PlayerToCuff.tazeplayer.LastRHCCuffed = self.Owner
					PlayerToCuff.tazeplayer.TazedRHCRestrained = true
				end
				PlayerToCuff.RagdollCuffed = true
				self.AttemptToCuff = nil
				vm:SendViewModelMatchingSequence(ResetSeq)	
				vm:SetPlaybackRate(2)		
			end
		else
			local TraceEnt = self.Owner:GetEyeTrace().Entity
			if !IsValid(TraceEnt) or TraceEnt != PlayerToCuff or TraceEnt:GetPos():Distance(self.Owner:GetPos()) > RHandcuffsConfig.CuffRange then
				self.AttemptToCuff = nil
				vm:SendViewModelMatchingSequence(ResetSeq)	
				vm:SetPlaybackRate(2)	
			elseif CurTime() >= self.AttemptCuffFinish then
				if SERVER then
					PlayerToCuff:RHCRestrain(self.Owner)
				end
				self.AttemptToCuff = nil	
				vm:SendViewModelMatchingSequence(ResetSeq)	
				vm:SetPlaybackRate(2)
			end	
		end	
	end	
end

function SWEP:PrimaryAttack()
	self.Weapon:EmitSound("npc/vort/claw_swing" .. math.random(1, 2) .. ".wav")
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	local Trace = self.Owner:GetEyeTrace()
		
	self.Weapon:SetNextPrimaryFire(CurTime() + 3)
		
	local TPlayer = Trace.Entity
	if !IsValid(TPlayer) then return false end
	local Distance = self.Owner:EyePos():Distance(TPlayer:GetPos());
	if Distance > 400 then return false; end
	if TPlayer:GetNWBool("rks_restrained", false) then
		if SERVER then
			DarkRP.notify(self.Owner, 1, 4, LangTbl.CantCuffRestrained)
		end
		return
	end	
	if TPlayer:IsPlayer() and !TPlayer:IsRHCWhitelisted() and !IsValid(self.AttemptToCuff) then
		if TPlayer:GetNWBool("rhc_cuffed", false) then
			if SERVER then
				TPlayer:RHCRestrain(self.Owner)
			end
		else
			self.CuffingRagdoll = false
			self.AttemptToCuff = TPlayer
			self.AttemptCuffFinish = CurTime() + RHandcuffsConfig.CuffTime
			self.AttemptCuffStart = CurTime()
			local vm = self.Owner:GetViewModel();
			local DeploySeq, Time = vm:LookupSequence("Deploy")
	
			vm:SendViewModelMatchingSequence(DeploySeq)	
			vm:SetPlaybackRate(2)
			self:PlayCuffSound(.3)
		end
	elseif !TPlayer.RagdollCuffed and TPlayer:GetNWBool("CanRHCArrest", false) then
		self.CuffingRagdoll = true
		self.AttemptToCuff = TPlayer
		self.AttemptCuffFinish = CurTime() + RHandcuffsConfig.CuffTime
		self.AttemptCuffStart = CurTime()
		local vm = self.Owner:GetViewModel();
		local DeploySeq, Time = vm:LookupSequence("Deploy")
	
		vm:SendViewModelMatchingSequence(DeploySeq)	
		vm:SetPlaybackRate(2)
		self:PlayCuffSound(.3)
	end
end

function SWEP:Reload()
	if self.NextRPress and self.NextRPress > CurTime() then return end
	self.NextRPress = CurTime() + 1
	if CLIENT then return end
	
	if !self.Owner:IsRHCWhitelisted() then return end
	
	local Trace = self.Owner:GetEyeTrace()
		
	self.Weapon:SetNextPrimaryFire(CurTime() + 3)
		
	local TPlayer = Trace.Entity
	local Distance = self.Owner:EyePos():Distance(TPlayer:GetPos());
	if Distance > 100 then return false; end	
	
	if TPlayer.Restrained then	
		self.Owner:RHCInspect(TPlayer)
	end
end	

function SWEP:SecondaryAttack()
	if SERVER then 
		self.Weapon:SetNextSecondaryFire(CurTime() + 1)
		local Player = self.Owner
		local Trace = Player:GetEyeTrace()
	
		local TVehicle = Trace.Entity
		local Distance = Player:GetPos():Distance(TVehicle:GetPos());
		if Distance > 300 then return false; end	
		if IsValid(TVehicle) and TVehicle:IsVehicle() then
			if vcmod1 then 
				if !Player.Dragging then
					for k,v in pairs(TVehicle:VC_GetPlayers()) do
						if v.Restrained then 
							local DraggedByP = v.DraggedBy
							if IsValid(DraggedByP) then
								DraggedByP.Dragging = nil
							end
							v.DraggedBy = nil
							v:ExitVehicle()
						end
					end
				elseif Player.Dragging then
					local PlayerDragged = Player.Dragging
					if IsValid(PlayerDragged) then
						local SeatsTBL = TVehicle:VC_GetSeatsAvailable()
						if #SeatsTBL < 1 then DarkRP.notify(Player, 1, 4, LangTbl.NoSeats) if !IsValid(TVehicle:GetDriver()) then PlayerDragged:EnterVehicle(TVehicle) DarkRP.notify(Player, 1, 4, LangTbl.PlayerPutInDriver) end return end
						for k,v in pairs(SeatsTBL) do
							local SeatsDist = Player:GetPos():Distance(v:GetPos())
							if SeatsDist < 80 then
								PlayerDragged:EnterVehicle(v)
								break
							end
						end
					end				
				end
			elseif NOVA_Config then
				if !Player.Dragging then
					local Passengers = TVehicle:CMGetAllPassengers()
					for k,v in pairs(Passengers) do
						if v and v:IsPlayer() and v.Restrained then
							local DraggedByP = v.DraggedBy
							if IsValid(DraggedByP) then
								DraggedByP.Dragging = nil
							end
							v.DraggedBy = nil
							v:ExitVehicle()	
						end	
					end
				elseif Player.Dragging then
					local PlayerDragged = Player.Dragging
					if IsValid(PlayerDragged) then
						local SeatsTBL = table.Copy(TVehicle.CmodSeats)
						for k,v in pairs(SeatsTBL) do
							local Driver = v:GetDriver()
							if IsValid(Driver) and Driver:IsPlayer() then
								SeatsTBL[k] = nil
							end
						end
						if table.Count(SeatsTBL) < 1 then DarkRP.notify(Player, 1, 4, LangTbl.NoSeats) if !IsValid(TVehicle:GetDriver()) then PlayerDragged:EnterVehicle(TVehicle) DarkRP.notify(Player, 1, 4, LangTbl.PlayerPutInDriver) end return end
						for k,v in pairs(SeatsTBL) do
							local SeatsDist = Player:GetPos():Distance(v:GetPos())
							if SeatsDist < 80 then
								PlayerDragged:EnterVehicle(v)
								break
							end
						end
					end				
				end
			elseif TVehicle.Seats then
				if !Player.Dragging then
					local Seats = TVehicle.Seats
					for k,v in pairs(Seats) do
						local Passenger = v:GetDriver()
						if IsValid(Passenger) and Passenger.Restrained then
							local DraggedByP = Passenger.DraggedBy
							if IsValid(DraggedByP) then
								DraggedByP.Dragging = nil
							end
							Passenger.DraggedBy = nil
							Passenger:ExitVehicle()	
						end	
					end				
				elseif Player.Dragging then
					local PlayerDragged = Player.Dragging
					if IsValid(PlayerDragged) then
						local SeatsTBL = TVehicle.Seats
						SeatsTBL[1] = nil
						for k,v in pairs(SeatsTBL) do
							local Driver = v:GetDriver()
							if IsValid(Driver) and Driver:IsPlayer() then
								SeatsTBL[k] = nil
							end
						end
						if #SeatsTBL < 1 then DarkRP.notify(Player, 1, 4, LangTbl.NoSeats) return end
						for k,v in pairs(SeatsTBL) do
							local SeatsDist = Player:GetPos():Distance(v:GetPos())
							if SeatsDist < 150 then
								PlayerDragged:EnterVehicle(v)
								break
							end
						end
					end					
				end	
			elseif Player.Dragging and !vcmod1 then
				local DragPlayer = Player.Dragging
				if IsValid(DragPlayer) then
					DragPlayer:EnterVehicle(TVehicle)
				end	
			elseif IsValid(TVehicle:GetDriver()) and TVehicle:GetDriver().Restrained then
				TVehicle:GetDriver():ExitVehicle()				
			end	
		end
	end			
end

if CLIENT then
function SWEP:DrawHUD()
    local PlayerToCuff = self.AttemptToCuff
	if !IsValid(PlayerToCuff) then return end

    local time = self.AttemptCuffFinish - self.AttemptCuffStart
    local curtime = CurTime() - self.AttemptCuffStart
    local percent = math.Clamp(curtime / time, 0, 1)	
    local w = ScrW()
    local h = ScrH()
	local Nick = ""
	if self.CuffingRagdoll then
		Nick = LangTbl.TazedPlayer
	else 
		Nick = PlayerToCuff:Nick()
	end

	local TPercent = math.Round(percent*100)
	local TextToDisplay = string.format(LangTbl.CuffingText, Nick)
    draw.DrawNonParsedSimpleText(TextToDisplay .. " (" .. TPercent .. "%)", "Trebuchet24", w/2, h/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	
end
end
--PATH lua/entities/baconslab/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bacon"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Bacon"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bacon_2.mdl")
	
end
--PATH lua/entities/bagette/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Baguette"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A french baguette"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bagette.mdl")
	
end
--PATH lua/entities/bread3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bread"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bread-3.mdl")
	
end
--PATH lua/entities/bread5c/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bread (slice)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bread_slice.mdl")
	
end
--PATH lua/entities/burger1/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/burgergtasa.mdl")
	
end
--PATH lua/entities/cabbage3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cabbage"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Caggage"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cabbage3.mdl")
	
end
--PATH lua/entities/chipsbag1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Cassava Chips"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Chips (Crisps if ya from Blighty)"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipsbag1.mdl")
	
end
--PATH lua/entities/chipsdoritos2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Doritos"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Doritos with nacho cheese"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipsdoritos2.mdl")
	
end
--PATH lua/entities/chipsdoritos3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Doritos - Toasted Corn"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Chips (Crisps if ya from Blighty)"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/ChipsDoritos3.mdl")
	
end
--PATH lua/entities/chipslays/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Lays"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Lays"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipslays.mdl")
	
end
--PATH lua/entities/chipslays8/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Lays - Fight for your Flavour"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Lays"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipslays8.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/darkrp_billboard/cl_init.lua:
include("shared.lua")

ENT.DrawPos = Vector(1, -111, 58)

ENT.Width = 558
ENT.Height = 290

ENT.HeaderMargin = 10
ENT.BodyMargin = 10

ENT.HeaderFont = "Trebuchet48"
ENT.BodyFont = "DermaLarge"

function ENT:Draw()
    self:DrawModel()

    local DrawPos = self:LocalToWorld(self.DrawPos)

    local DrawAngles = self:GetAngles()
    DrawAngles:RotateAroundAxis(self:GetAngles():Forward(), 90)
    DrawAngles:RotateAroundAxis(self:GetAngles():Up(), 90)

    local backgroundColor = self:GetBackgroundColor() * 255
    local barColor = self:GetBarColor() * 255
    local topText = DarkRP.textWrap(self:GetTopText(), self.HeaderFont, self.Width - self.BodyMargin * 2)

    local bottomText = string.gsub(string.gsub(self:GetBottomText() or "", "//", "\n"), "\\n", "\n")
    bottomText = DarkRP.textWrap(string.Replace(bottomText, "\\n", "\n"), self.BodyFont, self.Width - self.BodyMargin * 2)

    if not self.HeaderFontHeight then self.HeaderFontHeight = draw.GetFontHeight(self.HeaderFont) end

    local barHeight = 1
    for _ in string.gmatch(topText, "\n") do barHeight = barHeight + 1 end
    barHeight = self.HeaderMargin * 2 + barHeight * self.HeaderFontHeight

    local centerX = self.Width / 2

    render.EnableClipping(true)
    local normal = self:GetUp()
    render.PushCustomClipPlane(normal, normal:Dot(DrawPos - normal * self.Height * 0.4))

    cam.Start3D2D(DrawPos, DrawAngles, 0.4)

        surface.SetDrawColor(backgroundColor.x, backgroundColor.y, backgroundColor.z, 255)
        surface.DrawRect(0, 0, self.Width, self.Height)

        draw.RoundedBox(0, 0, 0, self.Width, barHeight, Color(barColor.x, barColor.y, barColor.z))

        draw.DrawText(topText, self.HeaderFont, centerX, self.HeaderMargin, color_white, TEXT_ALIGN_CENTER)
        draw.DrawText(bottomText, self.BodyFont, centerX, barHeight + self.BodyMargin, color_white, TEXT_ALIGN_CENTER)

    cam.End3D2D()

    render.PopCustomClipPlane()
    render.EnableClipping(false)
end

language.Add("Cleaned_advert_billboards", "Cleaned up Advert Billboards")
language.Add("Cleanup_advert_billboards", "Advert Billboards")
language.Add("Undone_advert_billboard", "Undone Advert Billboard")

--PATH addons/the_perfect_training_system/lua/entities/diablos_punching_ball/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()

	self.IconChanged = false
	if not self.IconChanged then
		if Diablos.TS.Materials["PunchingLogoName"] then
			self:SetLogoMaterial()
			self.IconChanged = true
		end
	end
end
--PATH lua/entities/drg_roach_ds1_base.lua:
if not DrGBase then return end
ENT.Base = "drgbase_nextbot"

ENT.BloodColor = BLOOD_COLOR_RED ENT.RagdollOnDeath = false ENT.Omniscient = false ENT.SpotDuration = 60 ENT.RangeAttackRange = 128 ENT.ReachEnemyRange = 30 ENT.UseWalkframes = true ENT.ClimbLedges = false ENT.ClimbProps = false ENT.ClimbLadders = false ENT.ClimbLaddersUp = false ENT.ClimbLaddersDown = false ENT.EyeBone = "head" ENT.PossessionEnabled = true ENT.PossessionPrompt = true ENT.PossessionCrosshair = true ENT.PossessionMovement = POSSESSION_MOVE_CUSTOM ENT.PossessionViews = {{offset = Vector(0, 30, 20),distance = 100},{offset = Vector(7.5, 0, 0),distance = 0,eyepos = true}}

-- Editables --
ENT.PrintName = "Andre of Astora"
ENT.Category = "Dark Souls 1"
ENT.Models = {"models/roach/ds1/andre.mdl"}
ENT.CollisionBounds = Vector(15, 15, 70)
ENT.SpawnHealth = 1065*2
ENT.MeleeAttackRange = 65
ENT.Factions = {FACTION_REBELS}
ENT.PossessionBinds = {
	[IN_ATTACK] = {{coroutine = true,onkeydown = function(self)
		if self:IsRunning() then
			self:PlaySequenceAndMove("att8",1,self.PossessionFaceForward)
		else
			while self:GetPossessor():KeyDown(IN_ATTACK) do
				self:PlaySequenceAndMove("att"..math.random(4),1,function()
					self:PossessionFaceForward()
					if not self:GetPossessor():KeyDown(IN_ATTACK) then return true end
				end)
			end
			self:PlaySequenceAndMove("att"..math.random(5,7),1,self.PossessionFaceForward)
		end
	end}},
	[IN_ATTACK2] = {{coroutine = true,onkeydown = function(self)
		local ply = self:GetPossessor()
		
		self.Flinching = true
			if ply:KeyDown(IN_MOVERIGHT) then self:Dodge(nil,1)
			elseif ply:KeyDown(IN_MOVELEFT) then self:Dodge(nil,2)
			elseif ply:KeyDown(IN_BACK) then self:Dodge(nil,3)
			else self:DS1_Range()end
		self.Flinching = false
	end}},
	[IN_USE] = {{coroutine = true,onkeydown = function(self)if self:GetCooldown(self:GetClass().."_Use") <= 0 then for k,door in pairs(ents.FindInSphere(self:LocalToWorld(Vector(0,0,70)), 50)) do if IsValid(door) and door:GetClass() == "prop_door_rotating" then door:Fire("openawayfrom",self:GetName())elseif IsValid(door)and string.find(door:GetClass(),"door")and door:GetClass() != "prop_door_rotating" then door:Fire("open")end if IsValid(door) and string.find(door:GetClass(),"button") then door:Fire("press") end end self:SetCooldown(self:GetClass().."_Use",0.5)end end}},
	[IN_ATTACK3] = {{coroutine = true,onkeydown = function(self)self:Suicide()end}},
	[IN_JUMP] = {{coroutine = true,onkeydown = function(self)self:Jump(450)end}},
}
ENT.HPBarOffset = 10
ENT.HPBarScale = 0.2

if SERVER then
ENT.SOUND_EVTTABLE = {
	["movement"] = {"roach/ds1/main/body-lobe-",4},
	["punch_whoosh"] = {"roach/ds1/main/swing-hand.wav.mp3"},
	["kick_whoosh"] = {"roach/ds1/main/swing-knock-large.wav.mp3"},
	["block"] = {"roach/ds1/main/meat-knock-iron2.wav.mp3"},
	["fragment"] = {"roach/ds1/main/fragment.wav.mp3",0,100,function(self)ParticleEffect("ds3_watcher_thrust",self:LocalToWorld(Vector(-20,0,0)),Angle(0,0,0),nil)end},
	["down"] = {"roach/ds1/main/downs.WAV.mp3"},
	["down_knee"] = {"roach/ds1/main/downs-knee.WAV.mp3"}
}
ENT.IdleAnimation = "idle"
ENT.WalkAnimation = "walk_all"
ENT.RunAnimation = "run"
ENT.JumpAnimation = "glide"

ENT.SetupDamage = 30
ENT.SetupType = DMG_CLUB
ENT.HitSnds = {"roach/ds1/main/meat-knock-iron2.wav.mp3","roach/ds1/main/meat-knock-meat.wav.mp3","roach/ds1/main/meat-knock-meat2.wav.mp3"}
ENT.StrafeMin = 128
ENT.StrafeMax = 256
ENT.SetupPush = false
ENT.Parryable = false
ENT.FAFCycle = 0.85
ENT.SoundDisp = 100
ENT.SoundDispMoving = 80
function ENT:DS1_Initialize()
	self:AddPlayersRelationship(D_LI,1)
	self.SetupTable = {
		["jab"] = {10,DMG_CLUB},
		["jab_hard"] = {15,DMG_CLUB},
		["hook"] = {25,DMG_CLUB},
		["kick"] = {35,DMG_CLUB},
		["dropkick"] = {75,DMG_CLUB},
	}
end
function ENT:DS1_OnLand()
	self:EmitSound("roach/ds1/main/downs.WAV.mp3")
	self:PlaySequenceAndMove("land")
end
function ENT:DS1_EventHook(e)
	if e[1] == "setup" then
		self.SetupDamage = self.SetupTable[e[2]][1]
		self.SetupType = self.SetupTable[e[2]][2]
	elseif e[1] == "combo" then
		if (self:IsPossessed() and self:GetPossessor():KeyDown(IN_ATTACK))
		or (not self:IsPossessed() and self:IsInRange(self:GetEnemy(),self.MeleeAttackRange)) then
			self:CICO(function()
				self:PlaySequenceAndMove("att"..math.random((self:IsPossessed() and 4 or 6)),math.Rand(0.9,1.2),function()
					if self:IsPossessed() then self:PossessionFaceForward()
					else self:FaceEnemy() end
				end)
			end)
		end
	end
end
function ENT:DS1_Melee(enemy)
	local num = (enemy.Flinching and 8 or 7)
	self:PlaySequenceAndMove("att"..math.random(num),1,function()if num!=8 then self:FaceEnemy()end end)
end
function ENT:DS1_Range(enemy)
	if not self:IsPossessed() then self:PlaySequenceAndMove("run",{stoponcollide=true},self.FaceEnemy)end
	self:PlaySequenceAndMove("att8")
end
function ENT:DS1_OnDodge(m,mat)
	self:EmitSound("roach/ds1/main/body-lobe-b"..math.random(2)..".wav.mp3",70)
	if m==1 then
		self:DS1_Seq("dodge_r",{multiply=Vector(mat,mat,1)},function()
			if self:IsPossessed() then self:PossessionFaceForward()
			else self:FaceEnemy()end
		end)
	elseif m==2 then
		self:DS1_Seq("dodge_l",{multiply=Vector(mat,mat,1)},function()
			if self:IsPossessed() then self:PossessionFaceForward()
			else self:FaceEnemy()end
		end)
	elseif m==3 then
		self:DS1_Seq("dodge_b",{multiply=Vector(mat,mat,1)},function()
			if self:IsPossessed() then self:PossessionFaceForward()
			else self:FaceEnemy()end
		end)
	end
end
function ENT:DS1_Strafe(enemy,mdirection)
	if mdirection == 1 then
		self:MoveBackward(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	elseif mdirection == 2 then
		self:MoveLeft(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	elseif mdirection == 3 then
		self:MoveRight(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:ShouldRun() then return true end
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end 
			if self:IsPossessed() then return true end
			if not self:IsMoving() then return true end
		end)
	end
end
function ENT:OnSpawn()
	self.Ready = true
	self.Flinching = false
end
function ENT:OnTakeDamage(dmg, dir, tr)
	if self.Dodging then dmg:SetDamage(0) return end
	if self.Flinching or self:IsDead() then 
		if self.Blocking then dmg:ScaleDamage(0.25) end
		self:SetDMGDealt(self:GetDMGDealt()+dmg:GetDamage())
		self:SetHP(math.Clamp(self:Health()-dmg:GetDamage(),0,self.StartHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
	return end
	self:SpotEntity(dmg:GetAttacker())
	
	if dmg:IsDamageType(DMG_BLAST) or (dmg:GetDamage() >= 50 and math.random(10) == 3) then
		dmg:ScaleDamage(2)
		self.Flinching = true
		self:CICO(function(self)
			self:EmitSound("roach/ds1/main/damage"..math.random(3)..".wav.mp3",100)
			if IsValid(dmg:GetAttacker()) then
				self:FaceInstant(dmg:GetAttacker():GetPos())
			else
				self:FaceInstant(dmg:GetReportedPosition())
			end
			self.Flinching = false
			self:PlaySequenceAndMove("flinch_blast",1,function()if self.Flinching then return true end end)
		end)
	elseif math.random(150) <= (10*(dmg:IsBulletDamage() and 1 or 3)) then
		self.Flinching = true
		if dmg:IsDamageType(DMG_BURN) then 
			self:EmitSound("roach/ds1/main/burning.wav.mp3",100)
			for i=1,math.random(5,10) do ParticleEffect("burning_character",self:GetBonePosition(math.random(1,self:GetBoneCount()-1)),self:GetAngles(),self)end
			self:Timer(0.5,self.StopParticles)
		else self:EmitSound("roach/ds1/main/damage"..math.random(3)..".wav.mp3",100) end
		self:CICO(function(self)
			self:PlaySequenceAndMove("flinch"..math.random(7))
			self.Flinching = false
		end)
	elseif (dmg:IsDamageType(DMG_CLUB) or dmg:IsDamageType(DMG_SLASH) or dmg:IsDamageType(DMG_CRUSH)) and not self:IsAttacking() then
		dmg:ScaleDamage(0.25)
		self:FaceInstant(dmg:GetAttacker():GetPos())
		self.Flinching = true
		self.Blocking = true
		self:CICO(function(self)
			self:EmitSound("roach/ds1/main/meat-knock-iron2.wav.mp3",100)
			self:PlaySequenceAndMove("block",math.Rand(1,2))
			self.Flinching = false
			self.Blocking = false
		end)
	end
	self:SetDMGDealt(self:GetDMGDealt()+dmg:GetDamage())
	self:SetHP(math.Clamp(self:Health()-dmg:GetDamage(),0,self.StartHealth))
	self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
end
function ENT:OnDeath(dmg, hitgroup) 
	self:SetHP(math.Clamp(self:Health()-dmg:GetDamage(),0,self.StartHealth))
	self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 2)
	self:EmitSound("roach/ds1/main/kill"..math.random(2)..".wav.mp3",100)
	self:PlaySequenceAndMove("death"..(dmg:IsDamageType(DMG_BLAST) and "_blast" or math.random(3)))
	
	self:SetCollisionBounds(Vector(-1,-1,-1),Vector(0,0,0))
	self:PauseCoroutine(false)
end

function ENT:PossessionControls(f,b,r,l)
	if not self:IsRunning() then
		if self:IsMoving() then self:PossessionFaceForward() end
		local dir = self._DrGBasePossLast4DIR or ""
		if f and (dir == "" or dir == "N") then
			self:PossessionMoveForward()
			self._DrGBasePossLast4DIR = "N"
		elseif b and (dir == "" or dir == "S") then
			self:PossessionMoveBackward()
			self._DrGBasePossLast4DIR = "S"
		elseif r and (dir == "" or dir == "E") then
			self:PossessionMoveRight()
			self._DrGBasePossLast4DIR = "E"
		elseif l and (dir == "" or dir == "W") then
			self:PossessionMoveLeft()
			self._DrGBasePossLast4DIR = "W"
		else self._DrGBasePossLast4DIR = "" end
	else
		local direction = self:GetPos()
		if not self.Ready then return end
		if f then direction = direction + self:PossessorForward()
		elseif b then direction = direction - self:PossessorForward() end
		if r then direction = direction + self:PossessorRight()
		elseif l then direction = direction - self:PossessorRight() end
		if direction ~= self:GetPos() then self:MoveTowards(direction)
		else if self.Ready then self:PossessionFaceForward() end end
	end
end
function ENT:CustomInitialize()
	for k,v in pairs(self:GetSequenceList()) do if string.find(v,"att") and not string.find(v,"grab") then self:SetAttack(v,true)end end
	self:SetDefaultRelationship(D_HT)
	self.Blocking = false
	self.Ready = true
	
	if self:GetNetworkVars()["Phantom"]!=nil then self:SetPhantom(GetConVar("drg_ds1_redphantoms"):GetBool()) end
	self:SetHealth(self:Health()*(self:IsRedPhantom() and 3 or 1))
	self.StartHealth = self:Health()
	
	self:Timer(0,function()
		self:SetHP(self:Health())
		self:SetHPY(self:Health())
		self:SetDMGDealt(0)
	end)
	self:DS1_Initialize()
end
function ENT:IsRedPhantom()
	if self:GetNetworkVars()["Phantom"]!=nil then
		return self:GetPhantom()
	end
	return false
end
function ENT:ShouldRun() return self:HasEnemy() and not self:IsInRange(self:GetEnemy(),self.RangeAttackRange*2) end
function ENT:OnLandOnGround()
	if self:IsDead() or self.Flinching or string.find(self:GetSequenceName(self:GetSequence()),"flinch_blast") then return end
	self:CICO(function()self:DS1_OnLand()end)
end

function ENT:HandleAnimEvent(a,b,c,d,e)
	if e == "InvokeAttackBehaviour" then
		self:Attack({
			damage = (self.SetupDamage*((self:GetEnemy():IsPlayer()) and 1 or 2))*(self:IsRedPhantom() and math.Rand(2,3) or 1),
			range=self.MeleeAttackRange,
			type = self.SetupType,
			viewpunch = Angle(20, math.random(-10, 10), 0),
			push = (self.SetupPush),
			force=Vector(500,0,750)
		}, 
		function(self, hit)
			if #hit > 0 then
				self:EmitSound("roach/ds1/main/blood"..math.random(2)..".wav.mp3",65)
				if #self.HitSnds ==0 then return end
				if #self.HitSnds==1 then self:EmitSound(self.HitSnds[1],100)else self:EmitSound(self.HitSnds[math.random(#self.HitSnds)],100)end
			end
		end)
	end
	
	local evt = string.Explode(" ", e, false)
	if evt[1] == "PlaySound" then
		local snd = self.SOUND_EVTTABLE[evt[2]]
		if not snd then return end
		local var = self:IsMoving() and self.SoundDispMoving or self.SoundDisp
		local var2 = snd[3]
		if not snd[3] then var2=100 end
		local callback = snd[4] or function(self)end
		if #snd==1 or (snd[2]==0) then self:EmitSound(snd[1],var,var2)else self:EmitSound(snd[1]..math.random(snd[2])..".wav.mp3",var,var2)end
		callback(self)
	elseif evt[1] == "FadeOut" then
		ParticleEffectAttach("dskart_death",PATTACH_POINT_FOLLOW,self,1)
		SafeRemoveEntityDelayed(self,3)
		local n = math.Round((tonumber(evt[2])/30)*10)
		for i=1,n do
			self:Timer(0.1*i,function()
				self.ColA = math.Max(self.ColA-(256/n),0)
				self:SetColor(Color(255,255,255,self.ColA))
			end)
		end
	elseif evt[1] == "Flag" then
		if evt[2] == "Dodging" then self.Dodging = tobool(tonumber(evt[3])) 
		elseif evt[2] == "Turning" then self.Turning = tobool(tonumber(evt[3])) 
		elseif evt[2] == "Blocking" then self.Blocking = tobool(tonumber(evt[3])) end
	end
	self:DS1_EventHook(evt)
end

function ENT:OnMeleeAttack(enemy)
	self.Dodging = false
	if math.random(2)==1 and not enemy.Flinching then self:Dodge(enemy) end
	if not self:IsInRange(enemy,self.MeleeAttackRange) then return end
	self:DS1_Melee(enemy)
end

function ENT:OnRangeAttack(enemy)
	self.Dodging = false
	if self:GetCooldown("DS1_"..self:GetClass().."_Strafe") >0 then return end
	if enemy.Flinching then return end
	local mdirection = math.random(4)
	if mdirection == 4 then
		self:DS1_Range(enemy)
	else
		self:DS1_Strafe(enemy,mdirection)
	end
	self:SetCooldown("DS1_"..self:GetClass().."_Strafe", math.random(5,10))
end

function ENT:OnChaseEnemy(enemy)
	if (self:CanDodge("player") or self:CanDodge("normal")) and (self:IsInRange(enemy,self.RangeAttackRange)) then self:Dodge(enemy)end
end
function ENT:Dodge(enemy,forcedir)
	local m = forcedir or math.random(3)
	local mat = (self:IsPossessed() and 1.5 or math.Rand(1,2))
	
	local colgr = self:GetCollisionGroup()
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	self:DS1_OnDodge(m,mat)
	self:SetCollisionGroup(colgr)
end
function ENT:CustomThink()
	if self:GetCooldown("DS1_"..self:GetClass().."_HPYDegrade") <= 0 then
		local var = self:GetHPY()
		self:SetDMGDealt(0)
		self:SetHPY(math.Clamp(var-(self.StartHealth/250),self:Health(),self.StartHealth))
	end
end
function ENT:OnUpdateAnimation()
	if !self.Ready or self:IsDead() or self:IsDown() then return end
	if !self:IsOnGround() then return self.JumpAnimation, 0.1
	elseif self:IsRunning() then return self.RunAnimation, self.RunAnimRate
	elseif self:IsMoving() then return self.WalkAnimation, self.WalkAnimRate
	else return self.IdleAnimation, self.IdleAnimRate end
end
function ENT:CICO(callback)
	local oldThread = self.BehaveThread
	self.BehaveThread = coroutine.create(function()
		callback(self)
		self.BehaveThread = oldThread
	end)
end
ENT.AcceptableWeaponsTbl = {
	["gmod_camera"]=true,
	["gmod_tool"]=true,
	["weapon_physgun"]=true,
	["weapon_physcannon"]=true
}
function ENT:CanDodge(dodgetype)
	if not self:HasEnemy() or not IsValid(self:GetEnemy()) then return false end
	if dodgetype == "normal" then
		if self:GetEnemy():IsNPC() or self:GetEnemy():IsNextBot()
		and ((self:GetEnemy().MeleeAttacking and self:GetEnemy().MeleeAttacking == true) 
		or (self:GetEnemy().IsAttacking and self:GetEnemy().IsAttacking == true)) then
			return true
		else
			return false
		end
	elseif dodgetype == "player" then
		if self:GetEnemy():IsPlayer() then
			local emwp = self:GetEnemy():GetActiveWeapon()
			if not IsValid(emwp) then return false end
			if self:GetEnemy():GetEyeTrace().Entity == self and emwp != nil and not self.AcceptableWeaponsTbl[emwp:GetClass()]
			and (self:GetEnemy():KeyPressed(IN_ATTACK) or self:GetEnemy():KeyPressed(IN_ATTACK2) 
			or self:GetEnemy():KeyReleased(IN_ATTACK) or self:GetEnemy():KeyReleased(IN_ATTACK2) 
			or self:GetEnemy():KeyDown(IN_ATTACK) or self:GetEnemy():KeyDown(IN_ATTACK2)) then
				return true
			else
				return false
			end
		end
	end
end
function ENT:CanFAF()
	if self:IsPossessed() then
		return ((self:GetPossessor():KeyDown(IN_FORWARD) or self:GetPossessor():KeyDown(IN_BACK)
		or self:GetPossessor():KeyDown(IN_MOVELEFT) or self:GetPossessor():KeyDown(IN_MOVERIGHT)
		or self:GetPossessor():KeyDown(IN_ATTACK2)) and "possession" or "none")
	else
		if (self:CanDodge("player") or self:CanDodge("normal")) and (self:IsInRange(self:GetEnemy(),self.RangeAttackRange)) then
			return "dodge"
		elseif self:IsInRange(self:GetEnemy(),self.MeleeAttackRange) then
			return "attack"
		end
	end
	return "none"
end
function ENT:DS1_Seq(seq,options,func)
	func = func or function()end
	options = options or {gravity=true}
	return self:PlaySequenceAndMove(seq,options,function(self,cycle)
		if self.Turning then
			self:FaceEnemy()
			self:PossessionFaceForward()
		end
		if cycle > self.FAFCycle and self:CanFAF()!="none" then return true end
		if not self.Flinching and not self:IsOnGround() then return true end
		func(self,cycle)
	end)
end
elseif CLIENT then
	ENT.RenderGroup = RENDERGROUP_OPAQUE
	ENT.HUDMat_Main = Material("hud/ds1/boss_hpbar.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar = Material("hud/ds1/boss_hpbar_red.png", "smooth unlitgeneric")
	ENT.HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")
	local tab = {["$pp_colour_addr"]=0,["$pp_colour_addg"]=0,["$pp_colour_addb"]=0,["$pp_colour_brightness"]=0,["$pp_colour_contrast"]=0.1,["$pp_colour_colour"]=0,["$pp_colour_mulr"]=50, ["$pp_colour_mulg"]=0, ["$pp_colour_mulb"]=0 }
	function ENT:CustomDraw()
		if self:GetNetworkVars()["Phantom"]!=nil then
		if self:GetPhantom() then
			render.SetStencilWriteMask(0xFF)
			render.SetStencilTestMask(0xFF)
			render.ClearStencil()
			render.SetStencilEnable(true)
			render.SetStencilReferenceValue(1)
			render.SetStencilCompareFunction(STENCIL_ALWAYS)
			render.SetStencilPassOperation(STENCIL_REPLACE)
			render.SetStencilFailOperation(STENCIL_KEEP)
			render.SetStencilZFailOperation(STENCIL_KEEP)
			self:DrawModel()
			render.SetStencilCompareFunction(STENCIL_EQUAL)
			DrawSobel(0.1)
			-- halo.Add({self}, Color(255,0,0)) -- crashes the game apparently, epic
			DrawColorModify(tab)
			DrawMaterialOverlay("effects/tp_refract", 0.02)
			DrawMaterialOverlay("effects/water_warp01", -0.01)
			render.SetStencilEnable(false)
		end
		end
		if self:IsDead() and (math.Round(self:GetHPY())<=math.Round(self:GetHP())) then return end
		if GetConVar("drg_ds1_healthbars"):GetBool() then
			local angle = EyeAngles()
			angle = Angle(0,angle.y,0)
			angle.y = angle.y + math.sin(CurTime())*10
			angle:RotateAroundAxis(angle:Up(),-90)
			angle:RotateAroundAxis(angle:Forward(),90)
			
			local pos = self:GetBonePosition(self:LookupBone(self.EyeBone)) + Vector(0,0,self.HPBarOffset)
			cam.Start3D2D(pos,angle,self.HPBarScale)
				local hp = math.Round(self:GetHP())
				local hp2 = math.Round(self:GetHPY())
				local hpmax = self.SpawnHealth
				if self:GetNetworkVars()["Phantom"]!=nil then
				if self:GetPhantom() then
					hpmax = self.SpawnHealth*3
				end
				end
				local text = self.PrintName
				local text2 = tostring(math.Round(self:GetDMGDealt()))
				surface.SetFont("Trebuchet24")
				local tW, tH = surface.GetTextSize(text)

				local pad = 0.01
				surface.SetDrawColor(255,255,255,255)
				surface.SetMaterial(self.HUDMat_Bar2)
				surface.DrawTexturedRectUV(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp2/hpmax), self.HUDMat_Bar:Height()/2, 0,0,1,0.5)
				surface.SetMaterial(self.HUDMat_Bar)
				surface.DrawTexturedRectUV(-(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height())+5, (self.HUDMat_Bar:Width()*1.05)*(hp/hpmax), self.HUDMat_Bar:Height()/2, 0,0,1,0.5)
				surface.SetMaterial(self.HUDMat_Main)
				surface.DrawTexturedRect(-(self.HUDMat_Main:Width()/6), -(self.HUDMat_Main:Height()), self.HUDMat_Main:Width()/3, self.HUDMat_Main:Height(), 2)

				draw.SimpleText(text, "DermaDefault", -(self.HUDMat_Main:Width()/6)+8, -(self.HUDMat_Main:Height()+16), color_white)
				if text2 != "0" then draw.SimpleText(text2, "DermaDefault", (self.HUDMat_Main:Width()/6)-16, -(self.HUDMat_Main:Height()+16), color_white) end
			cam.End3D2D()
		end
		-- self:DS1_Draw()
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
--PATH lua/entities/drgbase_nextbot/shared.lua:
ENT.Base = "base_nextbot"
ENT.Type = "nextbot"
ENT.IsDrGEntity = true
ENT.IsDrGNextbot = true

-- Misc --
ENT.PrintName = "Template"
ENT.Category = "Other"
ENT.Models = {"models/player/kleiner.mdl"}
ENT.Skins = {0}
ENT.ModelScale = 1
ENT.CollisionBounds = Vector(10, 10, 72)
ENT.BloodColor = BLOOD_COLOR_RED
ENT.RagdollOnDeath = true

-- Stats --
DrGBase.IncludeFile("status.lua")
ENT.SpawnHealth = 100
ENT.HealthRegen = 0
ENT.MinPhysDamage = 10
ENT.MinFallDamage = 10

-- AI --
DrGBase.IncludeFile("ai.lua")
DrGBase.IncludeFile("patrol.lua")
ENT.BehaviourType = AI_BEHAV_BASE
ENT.Omniscient = false
ENT.SpotDuration = 30
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 50
ENT.ReachEnemyRange = 50
ENT.AvoidEnemyRange = 0
ENT.AvoidAfraidOfRange = 500
ENT.WatchAfraidOfRange = 750

-- Relationships --
DrGBase.IncludeFile("relationships.lua")
ENT.DefaultRelationship = D_NU
ENT.Factions = {}
ENT.Frightening = false
ENT.AllyDamageTolerance = 0.33
ENT.AfraidDamageTolerance = 0.33
ENT.NeutralDamageTolerance = 0.33

-- Detection --
DrGBase.IncludeFile("awareness.lua")
DrGBase.IncludeFile("detection.lua")
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 150
ENT.SightRange = 15000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Locomotion --
DrGBase.IncludeFile("locomotion.lua")
DrGBase.IncludeFile("path.lua")
ENT.Acceleration = 1000
ENT.Deceleration = 1000
ENT.JumpHeight = 50
ENT.StepHeight = 20
ENT.MaxYawRate = 250
ENT.DeathDropHeight = 200

-- Movements --
DrGBase.IncludeFile("movements.lua")
ENT.UseWalkframes = false
ENT.WalkSpeed = 100
ENT.RunSpeed = 200

-- Climbing --
ENT.ClimbLedges = false
ENT.ClimbLedgesMaxHeight = math.huge
ENT.ClimbLedgesMinHeight = 0
ENT.LedgeDetectionDistance = 20
ENT.ClimbProps = false
ENT.ClimbLadders = false
ENT.ClimbLaddersUp = true
ENT.LaddersUpDistance = 20
ENT.ClimbLaddersUpMaxHeight = math.huge
ENT.ClimbLaddersUpMinHeight = 0
ENT.ClimbLaddersDown = false
ENT.LaddersDownDistance = 20
ENT.ClimbLaddersDownMaxHeight = math.huge
ENT.ClimbLaddersDownMinHeight = 0
ENT.ClimbSpeed = 60
ENT.ClimbUpAnimation = ACT_CLIMB_UP
ENT.ClimbDownAnimation = ACT_CLIMB_DOWN
ENT.ClimbAnimRate = 1
ENT.ClimbOffset = Vector(0, 0, 0)

-- Animations --
DrGBase.IncludeFile("animations.lua")
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1
ENT.JumpAnimation = ACT_JUMP
ENT.JumpAnimRate = 1

-- Sounds --
ENT.OnSpawnSounds = {}
ENT.OnIdleSounds = {}
ENT.IdleSoundDelay = 2
ENT.ClientIdleSounds = false
ENT.OnDamageSounds = {}
ENT.DamageSoundDelay = 0.25
ENT.OnDeathSounds = {}
ENT.OnDownedSounds = {}
ENT.Footsteps = {}

-- Weapons --
DrGBase.IncludeFile("weapons.lua")
ENT.UseWeapons = false
ENT.Weapons = {}
ENT.DropWeaponOnDeath = false
ENT.AcceptPlayerWeapons = true

-- Possession --
DrGBase.IncludeFile("possession.lua")
ENT.PossessionEnabled = false
ENT.PossessionPrompt = true
ENT.PossessionCrosshair = false
ENT.PossessionMovement = POSSESSION_MOVE_1DIR
ENT.PossessionViews = {}
ENT.PossessionBinds = {}

-- Misc --
DrGBase.IncludeFile("drgbase/entity_helpers.lua")
DrGBase.IncludeFile("behaviours.lua")
DrGBase.IncludeFile("hooks.lua")
DrGBase.IncludeFile("misc.lua")

-- Convars --
local MultHealth = CreateConVar("drgbase_multiplier_health", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local EnablePatrol = CreateConVar("drgbase_ai_patrol", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

-- Initialize --
function ENT:Initialize()
	if SERVER then
		if istable(self.Models) and #self.Models > 0 then
			self:SetModel(self.Models[math.random(#self.Models)])
		end
		if istable(self.ModelScale) and #self.ModelScale == 2 then
			self:SetModelScale(self.ModelScale[math.random(2)])
		elseif isnumber(self.ModelScale) then
			self:SetModelScale(self.ModelScale)
		end
		if istable(self.Skins) and #self.Skins > 0 then
			self:SetSkin(self.Skins[math.random(#self.Skins)])
		elseif isnumber(self.Skins) then
			self:SetSkin(self.Skins)
		end
		self:SetNW2Int("DrGBaseMaxHealth", self.SpawnHealth)
		self:SetNW2Int("DrGBaseHealth", self.SpawnHealth)
		self:SetMaxHealth(self.SpawnHealth)
		self:SetHealth(self.SpawnHealth)
		self:ScaleHealth(MultHealth:GetFloat())
		self:SetHealthRegen(self.HealthRegen)
		self:SetBloodColor(self.BloodColor)
		self:SetCollisionGroup(COLLISION_GROUP_NPC)
		if isvector(self.CollisionBounds) then
			self:SetCollisionBounds(
				Vector(self.CollisionBounds.x, self.CollisionBounds.y, self.CollisionBounds.z),
				Vector(-self.CollisionBounds.x, -self.CollisionBounds.y, 0)
			)
		else self:SetCollisionBounds(self:GetModelBounds()) end
		self:SetUseType(SIMPLE_USE)
		self.VJ_AddEntityToSNPCAttackList = true
		self.vFireIsCharacter = true
		self._DrGBaseCorReacts = {}
		self._DrGBaseCorCalls = {}
		self._DrGBaseWaterLevel = self:WaterLevel()
		self._DrGBaseDownSpeed = 0
		self:SetName("drgbase_nextbot_"..self:GetCreationID())
		self:PhysicsInitShadow()
		self:AddCallback("PhysicsCollide", function(self, data)
			self:_HandleCollide(data, self:GetPhysicsObject())
		end)
		if self.IsDrGNextbotSprite then
			self:DrawShadow(false)
		end
	else self:SetIK(true) end
	self:AddFlags(FL_OBJECT + FL_NPC)
	self._DrGBaseBaseThinkDelay = 0
	self._DrGBaseCustomThinkDelay = 0
	self._DrGBasePossessionThinkDelay = 0
	self._DrGBaseThinkDelayLong = 0
	self._DrGBaseThinkDelayMedium = 0
	self._DrGBaseThinkDelayShort = 0
	self:_InitModules()
	table.insert(DrGBase._SpawnedNextbots, self)
	self:CallOnRemove("DrGBaseCallOnRemove", function(self)
		table.RemoveByValue(DrGBase._SpawnedNextbots, self)
		if isstring(self._DrGBaseIdleSound) then self:StopSound(self._DrGBaseIdleSound) end
		if SERVER and self:IsPossessed() then self:Dispossess() end
	end)
	self:_BaseInitialize()
	self:CustomInitialize()
	if SERVER then
		self._DrGBaseRelationshipReady = true
		self:UpdateRelationships()
		self:UpdateAnimation()
		self:UpdateSpeed()
		self:UpdateAI()
	end
end
function ENT:_BaseInitialize() end
function ENT:CustomInitialize() end
function ENT:_InitModules()
	if SERVER then
		self:_InitLocomotion()
		self:_InitPath()
	end
	self:_InitHooks()
	self:_InitMisc()
	self:_InitAnimations()
	self:_InitMovements()
	self:_InitWeapons()
	self:_InitPossession()
	self:_InitRelationships()
	self:_InitAwareness()
	self:_InitDetection()
	self:_InitPatrol()
	self:_InitAI()
end

-- Think --
function ENT:Think()
	self:_HandleAnimations()
	self:_HandleMovements()
	if SERVER then
		-- long delays
		if CurTime() > self._DrGBaseThinkDelayLong then
			self._DrGBaseThinkDelayLong = CurTime() + 1
			self:_RegenHealth()
			self:UpdateAI()
		end
		-- medium delays
		if CurTime() > self._DrGBaseThinkDelayMedium then
			self._DrGBaseThinkDelayMedium = CurTime() + 0.1
			self:UpdateAnimation()
			self:UpdateSpeed()
			-- update phys obj
			local phys = self:GetPhysicsObject()
			if IsValid(phys) then
				if self:WaterLevel() == 0 then
					phys:SetPos(self:GetPos())
					phys:SetAngles(self:GetAngles())
				else
					phys:UpdateShadow(self:GetPos(), self:GetAngles(), 0)
				end
			end
		end
		-- short delays
		if CurTime() > self._DrGBaseThinkDelayShort then
			self._DrGBaseThinkDelayShort = CurTime() + 0.05
			-- water level
			local waterLevel = self:WaterLevel()
			if self._DrGBaseWaterLevel ~= waterLevel then
				self:OnWaterLevelChange(self._DrGBaseWaterLevel, waterLevel)
				self._DrGBaseWaterLevel = waterLevel
			end
			-- on fire
			if self._DrGBaseIsOnFire and not self:IsOnFire() then
				self:OnExtinguish()
			end
			self._DrGBaseIsOnFire = self:IsOnFire()
			-- update fall speed
			local speed = -self:GetVelocity().z
			self:Timer(0.1, function()
				self._DrGBaseDownSpeed = speed
			end)
		end
	end
	-- idle sounds
	if #self.OnIdleSounds > 0 then
		if (SERVER and not self.ClientIdleSounds) or
		(CLIENT and self.ClientIdleSounds) then
			local sound = self.OnIdleSounds[math.random(#self.OnIdleSounds)]
			if self:EmitSlotSound("DrGBaseIdleSounds", SoundDuration(sound) + self.IdleSoundDelay, sound) then
				self._DrGBaseIdleSound = sound
			end
		end
	end
	-- custom thinks
	if CurTime() > self._DrGBaseBaseThinkDelay then
		local delay = self:_BaseThink() or 0
		self._DrGBaseBaseThinkDelay = CurTime() + delay
	end
	if CurTime() > self._DrGBaseCustomThinkDelay then
		local delay = self:CustomThink() or 0
		self._DrGBaseCustomThinkDelay = CurTime() + delay
	end
	if self:IsPossessed() and (SERVER or self:IsPossessedByLocalPlayer()) then
		local possessor = self:GetPossessor()
		if SERVER then possessor:SetPos(self:GetPos()) end
		possessor:SetKeyValue("waterlevel", self:WaterLevel())
		self:_HandlePossession(false)
		if CurTime() > self._DrGBasePossessionThinkDelay then
			local delay = self:PossessionThink(possessor) or 0
			self._DrGBasePossessionThinkDelay = CurTime() + delay
		end
	end
end
function ENT:_BaseThink() end
function ENT:CustomThink() end
function ENT:PossessionThink() end

if SERVER then
	AddCSLuaFile()

	-- Sandbox support --

	hook.Add("PlayerSpawnedNPC", "DrGBasePlayerSpawnedNPC", function(ply, ent)
		if not ent.IsDrGNextbot then return end
		ent:SetCreator(ply)
		if ent:SpawnedBy(ply) ~= false then
			if not navmesh.IsLoaded() and tobool(ply:GetInfoNum("drgbase_navmesh_error", 1)) then
				local msg = "Nextbots need a navmesh to navigate around the map. "
				if game.SinglePlayer() then msg = msg.."You can generate a navmesh using the command 'nav_generate' in the console."
				else msg = msg.."If you are the server owner you can generate a navmesh using the command 'nav_generate' in the server console." end
				DrGBase.Error(msg.."\nSet 'drgbase_navmesh_error' to 0 to disable this message.", {player = ply, color = DrGBase.CLR_GREEN, chat = true})
			end
		else ent:Remove() end
	end)
	function ENT:SpawnedBy() end

	-- Coroutine --

	function ENT:ReactInCoroutine(callback, ...)
		local args, n = table.DrG_Pack(...)
		table.insert(self._DrGBaseCorReacts, function(self)
			callback(self, table.DrG_Unpack(args, n))
		end)
	end
	function ENT:CallInCoroutine(callback, ...)
		local args, n = table.DrG_Pack(...)
		if n > 0 then
			table.insert(self._DrGBaseCorCalls, function(self)
				callback(self, table.DrG_Unpack(args, n))
			end)
		else
			local now = CurTime()
			table.insert(self._DrGBaseCorCalls, function(self)
				callback(self, CurTime() - now)
			end)
		end
	end

	function ENT:YieldCoroutine(interrompt)
		if interrompt then
			repeat
				if not self._DrGBaseCorReacting then
					if #self._DrGBaseCorReacts > 0 then
						self._DrGBaseCorReacting = true
						while #self._DrGBaseCorReacts > 0 do
							table.remove(self._DrGBaseCorReacts, 1)(self)
						end
						self._DrGBaseCorReacting = false
					elseif #self._DrGBaseCorCalls > 0 and
					not self._DrGBaseCorCalling then
						self._DrGBaseCorCalling = true
						while #self._DrGBaseCorCalls > 0 do
							table.remove(self._DrGBaseCorCalls, 1)(self)
						end
						self._DrGBaseCorCalling = false
					end
				else self._DrGBaseCorReacts = {} end
				coroutine.yield()
			until not self:IsAIDisabled() or self:IsPossessed() or self._DrGBaseCorReacting
		else
			self._DrGBaseCorReacts = {}
			coroutine.yield()
		end
	end
	function ENT:PauseCoroutine(duration, interrompt)
		if isnumber(duration) then
			if duration <= 0 then return end
			local now = CurTime()
			while CurTime() < now + duration do
				self:YieldCoroutine(interrompt)
			end
		else
			self._DrGBaseResumeCoroutine = false
			while not self._DrGBaseResumeCoroutine do
				self:YieldCoroutine(interrompt)
			end
			self._DrGBaseResumeCoroutine = nil
		end
	end
	function ENT:ResumeCoroutine()
		if self._DrGBaseResumeCoroutine ~= false then return end
		self._DrGBaseResumeCoroutine = true
	end

	function ENT:BehaveStart()
		if self.BehaveThread then return end
		self.BehaveThread = coroutine.create(function()
			if not self._DrGBaseSpawned then
				self._DrGBaseSpawned = true
				if #self.OnSpawnSounds > 0 then
					self:EmitSound(self.OnSpawnSounds[math.random(#self.OnSpawnSounds)])
				end
				self:OnSpawn()
			end
			while true do
				if self:IsPossessed() then
					self:_HandlePossession(true)
				elseif not self:IsAIDisabled() then
					if self.BehaviourType ~= AI_BEHAV_CUSTOM then
						if self:HasEnemy() then self:HandleEnemy()
						elseif self:HadEnemy() then self:UpdateEnemy()
						elseif self:HasPatrol() then self:Patrol()
						else self:OnIdle() end
					else self:AIBehaviour() end
				end
				self:YieldCoroutine(true)
			end
		end)
	end
	function ENT:BehaveUpdate()
		if not self.BehaveThread then return end
		if coroutine.status(self.BehaveThread) ~= "dead" then
			local ok, args = coroutine.resume(self.BehaveThread)
			if not ok then
				self.BehaveThread = nil
				if not self:OnError(args) then
					ErrorNoHalt(self, " Error: ", args, "\n")
				else self:BehaveStart() end
			end
		else self.BehaveThread = nil end
	end

	-- Net --

	function ENT:_HandleNetMessage(name, ply, ...) end

	-- Hooks --

	function ENT:OnSpawn() end
	function ENT:OnError() end

	function ENT:OnHealthChange() end
	function ENT:OnExtinguish() end
	function ENT:OnWaterLevelChange() end

	-- SLVBase compatibility --
	if file.Exists("autorun/slvbase", "LUA") then
		function ENT:PercentageFrozen() return 0 end
	end

	-- AI Behaviour --

	function ENT:AIBehaviour() end

	function ENT:HandleEnemy()
		local enemy = self:GetEnemy()
		local relationship = self:GetRelationship(enemy)
		if relationship == D_HT then
			local visible = self:Visible(enemy)
			if not self:IsInRange(enemy, self.ReachEnemyRange) or not visible then
				if self:OnChaseEnemy(enemy) ~= true then
					if self:FollowPath(enemy) == "unreachable" then
						self:OnEnemyUnreachable(enemy)
					end
				end
			elseif self:IsInRange(enemy, self.AvoidEnemyRange) and visible and
			not self:IsInRange(enemy, self.MeleeAttackRange) then
				if self:OnAvoidEnemy(enemy) ~= true then
					self:FollowPath(self:GetPos():DrG_Away(enemy:GetPos()))
				end
			elseif self:OnIdleEnemy(enemy) ~= true then self:FaceTowards(enemy) end
			if IsValid(enemy) and self:Visible(enemy) then self:AttackEntity(enemy) end
		elseif relationship == D_FR then
			local visible = self:Visible(enemy)
			if self:IsInRange(enemy, self.AvoidAfraidOfRange) and visible then
				if self:OnAvoidAfraidOf(enemy) ~= true then
					self:FollowPath(self:GetPos():DrG_Away(enemy:GetPos()))
				end
			elseif self:OnIdleAfraidOf(enemy) ~= true then self:FaceTowards(enemy) end
			if IsValid(enemy) and self:Visible(enemy) then self:AttackEntity(enemy) end
		elseif relationship == D_LI then self:OnAllyEnemy(enemy)
		elseif relationship == D_NU then self:OnNeutralEnemy(enemy) end
	end

	function ENT:AttackEntity(ent)
		local weapon = self:GetWeapon()
		if self.BehaviourType == AI_BEHAV_HUMAN and self:HasWeapon() then
			if weapon.DrGBase_Melee or string.find(weapon:GetHoldType(), "melee") then
				if self:IsInRange(ent, self.MeleeAttackRange) then
					if self:OnMeleeAttack(ent, weapon) ~= true  and self.IsDrGNextbotHuman then
						self:FaceTowards(ent)
						-- todo: melee code
					end
				end
			elseif self:IsInRange(ent, self.RangeAttackRange) then
				if self:OnRangeAttack(ent, weapon) ~= true and self.IsDrGNextbotHuman then
					if self:IsMoving() then
						self:FaceTowards(ent)
						self:FaceTowards(ent)
					end
					if self:IsWeaponPrimaryEmpty() then
						self:Reload()
					elseif self:IsInSight(ent) then
						local shootPos = self:GetShootPos()
						local tr = util.DrG_TraceHull({
							start = shootPos, endpos = shootPos + self:GetAimVector()*99999,
							mins = Vector(-5, -5, -5), maxs = Vector(5, 5, 5),
							filter = {self, self:GetWeapon(), self:GetPossessor()}
						})
						if tr.Entity == ent then
							local class = weapon:GetClass()
							if class == "weapon_shotgun" and
							weapon:Clip1() >= 2 and math.random(3) == 1 then
								self:SecondaryFire()
							else self:PrimaryFire() end
						end
					end
				end
			end
		elseif self:IsInRange(ent, self.MeleeAttackRange) and
		self:OnMeleeAttack(ent, weapon) ~= false then
		elseif self:IsInRange(ent, self.RangeAttackRange) then
			self:OnRangeAttack(ent, weapon)
		end
	end

	function ENT:Patrol()
		if not EnablePatrol:GetBool() then return end
		if not self:HasPatrol() then return end
		local patrol = self:GetPatrol()
		local pos = patrol:FetchPos(self)
		local res = self:OnPatrolling(pos, patrol)
		if not isbool(res) then
			local follow = self:FollowPath(pos)
			if follow == "unreachable" then res = false
			elseif follow == "reached" then res = true end
		end
		if isbool(res) then
			self:RemovePatrol(patrol)
			if res then
				patrol:OnReached(self, pos)
				self:OnReachedPatrol(pos, patrol)
			else
				patrol:OnUnreachable(self, pos)
				self:OnPatrolUnreachable(pos, patrol)
			end
		end
	end

else

	local NavmeshMessage = CreateClientConVar("drgbase_navmesh_error", "1", true, true)

	-- Net --

	function ENT:_HandleNetMessage(name, ...)
		local args, n = table.DrG_Pack(...)
		if name == "DrGBasePickupWeapon" then
			local weapon = args[1]
			if not IsValid(weapon) then return end
			self._DrGBaseWeapons[weapon:GetClass()] = weapon
			self:OnPickupWeapon(weapon, weapon:GetClass())
			return true
		elseif name == "DrGBaseDropWeapon" then
			local class = args[1]
			self._DrGBaseWeapons[class] = nil
			self:OnDropWeapon(NULL, class)
			return true
		end
	end

	-- Draw --

	local DisplayCollisions = CreateClientConVar("drgbase_display_collisions", "0")
	local DisplaySight = CreateClientConVar("drgbase_display_sight", "0")

	function ENT:Draw()
		if DrGBase.INFO_TOOL and DrGBase.INFO_TOOL.Viewcam then
			local selected = LocalPlayer():DrG_GetSelectedEntities()[1]
			if selected == self then return end
		end
		if self:ShouldDraw() then
			self:DrawModel()
			self:_BaseDraw()
			self:CustomDraw()
		end
		self:_DrawDebug()
		if self:IsPossessedByLocalPlayer() then
			self:PossessionDraw()
		end
	end
	function ENT:_BaseDraw() end
	function ENT:CustomDraw() end
	function ENT:PossessionDraw() end
	function ENT:ShouldDraw() return true end

	function ENT:_DrawDebug()
		if not GetConVar("developer"):GetBool() then return end
		if DisplayCollisions:GetBool() then
			local bound1, bound2 = self:GetCollisionBounds()
			local center = self:GetPos() + self:OBBCenter()
			render.DrawWireframeBox(self:GetPos(), Angle(0, 0, 0), bound1, bound2, DrGBase.CLR_WHITE, false)
			render.DrawLine(center, center + self:GetVelocity(), DrGBase.CLR_ORANGE, false)
			render.DrawWireframeSphere(center, 2*self:GetScale(), 4, 4, DrGBase.CLR_ORANGE, false)
		end
		if DisplaySight:GetBool() then
			 local eyepos = self:EyePos()
			 local color = self:WasInSight(LocalPlayer()) and DrGBase.CLR_GREEN or DrGBase.CLR_RED
			 if self:IsPossessedByLocalPlayer() then color = DrGBase.CLR_ORANGE end
			 render.DrawWireframeSphere(eyepos, 2*self:GetScale(), 4, 4, color, false)
			 render.DrawLine(eyepos, eyepos + self:EyeAngles():Forward()*15, color, false)
		end
	end

end

DrGBase.AddNextbotMixins(ENT)
--PATH gamemodes/mangarp/entities/entities/fadmin_motd/cl_init.lua:
include("shared.lua")
local defaultHTML

-- I love the garry's mod wiki!
-- Credits to whoever made this function!
local function WorldToScreen(vWorldPos, vPos, vScale, aRot)
    vWorldPos = vWorldPos - vPos
    vWorldPos:Rotate(Angle(0, -aRot.y, 0))
    vWorldPos:Rotate(Angle(-aRot.p, 0, 0))
    vWorldPos:Rotate(Angle(0, 0, -aRot.r))

    return vWorldPos.x / vScale, (-vWorldPos.y) / vScale
end

function ENT:LoadPage()
    local Page = self.MOTDPage:GetString()
    if string.lower(Page) == "data/fadmin/motd.txt" or string.lower(Page) == "default" then
        self.HTML:SetHTML(defaultHTML)
    elseif string.lower(string.sub(Page, -4)) == ".txt" and string.lower(string.sub(Page, 1, 5)) == "data/" then -- If it's a text file somewhere in data...
        Page = string.sub(Page, 6)
        self.HTML:SetHTML(file.Read(Page, "DATA") or "")
    else
        self.HTML:OpenURL(Page)
    end
end

function ENT:Initialize()
    self.MOTDPage = GetConVar("_FAdmin_MOTDPage")
    self.Disabled = true
    self.LastDrawn = CurTime()
    self.HTML = self.HTMLControl or vgui.Create("HTML")
    self.HTML:SetPaintedManually(false)
    self.HTML:SetPos(-512, -256)
    self.HTMLWidth = 1448
    self.HTMLHeight = 724
    self.HTML:SetSize(self.HTMLWidth, self.HTMLHeight)
    self:LoadPage()

    self.HTML:SetVisible(false)
    self.HTML:SetKeyboardInputEnabled(false)
    timer.Simple(0, function() -- Fix areas of the FAdmin scoreboard coming unclickable
        self.HTML:SetPaintedManually(true)
    end)
end

function ENT:Think()
    if not self.HTML or self.Disabled or self.HTMLCloseButton then
        self.HTMLMat = nil
    else
        self.HTML:UpdateHTMLTexture()
        self.HTMLMat = self.HTML:GetHTMLMaterial()
    end
    self:NextThink(CurTime() + 0.1)
end

local gripTexture = surface.GetTextureID("sprites/grip")
local ArrowTexture = surface.GetTextureID("gui/arrow")
local color_white = color_white
local color_darkgrey = Color(100, 100, 100, 255)

function ENT:Draw()
    self:DrawModel()

    local pos = self:GetPos()
    local ply = LocalPlayer()
    if pos:DistToSqr(ply:GetShootPos()) > 90000 then return end

    if CurTime() - self.LastDrawn > 0.5 then
        self.Disabled = true --Disable it again when you stop looking at it
    end

    self.LastDrawn = CurTime()
    local IsAdmin = ply:IsAdmin()
    local HasPhysgun = ply:GetActiveWeapon():IsValid() and ply:GetActiveWeapon():GetClass() == "weapon_physgun"
    local isUsing = (HasPhysgun and ply:KeyDown(IN_ATTACK)) or ply:KeyDown(IN_USE)

    surface.SetFont("Roboto20")
    local TextPosX = surface.GetTextSize("Physgun/use the button to see the MOTD!") * (-0.5)

    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Right(), -90)
    ang:RotateAroundAxis(ang:Up(), 90)

    local posX, posY = WorldToScreen(ply:GetEyeTrace().HitPos, self:GetPos() + ang:Up() * 3, 0.25, ang)
    render.SuppressEngineLighting(true)
    cam.Start3D2D(self:GetPos() + ang:Up() * 3, ang, 0.25)

        if self.Disabled then
            surface.SetDrawColor(0, 0, 0, 255)
            surface.DrawRect(-512, 256, 1024, -512)
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(TextPosX, 0)
            surface.DrawNonParsedText("Physgun/use the button to see the MOTD!")

            draw.WordBox(4, -16, 24, "Click!", "default", color_darkgrey, color_white)

            surface.SetDrawColor(255, 255, 255, 255)
            if IsAdmin and HasPhysgun then
                surface.SetTexture(gripTexture)
                surface.DrawTexturedRect(-10, 240, 16, 16)
            end
            if isUsing then

                posX, posY = math.Clamp(posX, -506, 506), math.Clamp(posY, -250, 250)
                surface.SetTexture(ArrowTexture)
                surface.DrawTexturedRectRotated(posX + 5, posY + 5, 16, 16, 45)

                -- Clicking button
                if posX > -16 and posX < 16 and posY > 24 and posY < 48 then
                    self:LoadPage()
                    self.Disabled = false
                    self.CanClickAgain = CurTime() + 1
                end
            end
        elseif not self.HTMLMat then
            self.HTML:SetVisible(true)
            self.HTML:SetKeyboardInputEnabled(true)
            self.HTML:SetPaintedManually(false)
            self.HTML:UpdateHTMLTexture()

            timer.Simple(0, function() -- Fix HTML material
                self.HTML:SetPaintedManually(true)
                self.HTML:SetVisible(false)
                self.HTML:SetKeyboardInputEnabled(false)
            end)

        else
            surface.SetMaterial(self.HTMLMat)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(-512, -256, self.HTMLWidth, self.HTMLHeight)
        end

    cam.End3D2D()
    render.SuppressEngineLighting(false)
    if self.HTMLCloseButton then return end

    --Drawing the actual HTML panel:

    if isUsing and posX > -500 and posX < 500 and posY < 250 and posY > -250 and
    not self.Disabled and self.HTML and self.HTML:IsValid() and self.CanClickAgain and CurTime() > self.CanClickAgain then
        self.CanClickAgain = CurTime() + 1
        self.HTML:SetPaintedManually(false)
        self.HTML:SetPos(0, 100)
        self.HTML:SetSize(ScrW(), ScrH() - 100)
        gui.EnableScreenClicker(true)
        -- gui.SetMousePos(posX/1024*ScrW(), posY/512*(ScrH() - 100) + 100)
        self.HTMLCloseButton = self.HTMLCloseButton or vgui.Create("DButton")
        self.HTMLCloseButton:SetPos(ScrW() - 100, 0)
        self.HTMLCloseButton:SetSize(100, 100)
        self.HTMLCloseButton:SetText("X")
        self.HTMLCloseButton:SetVisible(true)
        self.HTML:SetVisible(true)
        self.HTML:RequestFocus()
        self.HTML:SetKeyboardInputEnabled(true)
        self.HTML:MakePopup()

        function self.HTMLCloseButton.DoClick() -- Revert to drawing on the prop
            self.HTML:SetPos(-512, -256)
            self.HTML:SetSize(self.HTMLWidth, self.HTMLHeight)
            self.HTML:SetPaintedManually(true)
            self.HTML:SetKeyboardInputEnabled(false)
            self.HTML:SetVisible(false)
            gui.EnableScreenClicker(false)
            self.HTMLCloseButton:Remove()
            self.HTMLCloseButton = nil
        end
    end
end

defaultHTML = [[
<html>
<title>MOTD!</title>
<body bgcolor="888888">
<center><h1>Example MOTD/Instructions on how to set a proper MOTD</h1></center>
<h2>Of course you have to be superadmin or owner.</h2>
<ol>
<li>Copy the website URL to the clipboard<br></li>
<li>Enter the command: FAdmin MOTDPage "your website here"<br><br></li>
<i>Example:</i><br>
FAdmin MOTDPage "www.facepunch.com"
</body>
</html>]]

--PATH lua/entities/fish1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Catfish"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A raw catfish"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/fishcatfish.mdl")
	
end
--PATH lua/entities/fruitapple2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Apple"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/apple2.mdl")
	
end
--PATH lua/entities/icecream6/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream (Licorice)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream6.mdl")
	
end
--PATH lua/entities/marabou4/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Marabou"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/marabou4.mdl")
	
end
--PATH lua/entities/mcdfries/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "McDonalds Fries"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Fries from McDonalds"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/mcdfrenchfries.mdl")
	
end
--PATH addons/realistichandcuffs/lua/entities/npc_bailer/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Category = "FibreRP Police"

ENT.Spawnable = true
ENT.PrintName		= "Bailer NPC"
ENT.Author			= "ToBadForYou"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""
--PATH lua/entities/npc_drg_antlion.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Antlion"
ENT.Category = "DrGBase"
ENT.Models = {"models/Antlion.mdl"}
ENT.Skins = {0, 1, 2, 3}
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.BloodColor = BLOOD_COLOR_YELLOW

-- Sounds --
ENT.OnDamageSounds = {"NPC_Antlion.Pain"}

-- Stats --
ENT.SpawnHealth = 40

-- AI --
ENT.RangeAttackRange = 750
ENT.MeleeAttackRange = 50
ENT.ReachEnemyRange = 50
ENT.AvoidEnemyRange = 0
ENT.FollowPlayers = true

-- Relationships --
ENT.Factions = {FACTION_ANTLIONS}

-- Movements/animations --
ENT.UseWalkframes = true
ENT.JumpAnimation = ACT_GLIDE

-- Detection --
ENT.EyeBone = "Antlion.Head_Bone"
ENT.EyeOffset = Vector(7.5, 0, 5)
ENT.EyeAngle = Angle(0, 0, 0)

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_8DIR
ENT.PossessionCrosshair = true
ENT.PossessionViews = {
	{
		offset = Vector(0, 40, 0),
		distance = 125
	},
	{
		offset = Vector(7.5, 0, 10),
		distance = 0,
		eyepos = true
	}
}
ENT.PossessionBinds = {
	[IN_JUMP] = {{
		coroutine = false,
		onkeypressed = function(self)
			if not self:IsOnGround() then return end
			self:LeaveGround()
			self:SetVelocity(self:PossessorNormal()*1500)
		end
	}},
	[IN_ATTACK] = {{
		coroutine = true,
		onkeydown = function(self)
			self:PlaySequenceAndMove("attack"..math.random(6), 1, self.PossessionFaceForward)
		end
	}},
	[IN_ATTACK2] = {{
		coroutine = true,
		onkeydown = function(self)
			self:BurrowTo(self:PossessorTrace().HitPos)
		end
	}}
}

if SERVER then

	-- Antlion --

	function ENT:BurrowTo(pos)
		self:PlaySequenceAndMove("digin")
		if navmesh.IsLoaded() then
			pos = navmesh.GetNearestNavArea(pos):GetClosestPointOnArea(pos) or pos
		end
		self:SetPos(pos)
		self:DropToFloor()
		self:PlaySequenceAndMove("digout")
	end

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
	end

	-- AI --

	function ENT:OnRangeAttack(enemy)
		if not self:IsInRange(enemy, 500) then
			self:Leap(enemy, 1000)
			self:PauseCoroutine(0.25)
		end
	end
	function ENT:OnMeleeAttack(enemy)
		self:PlaySequenceAndMove("attack"..math.random(6), 1, self.FaceEnemy)
	end

	function ENT:OnReachedPatrol()
		self:Wait(math.random(3, 7))
	end
	function ENT:OnIdle()
		self:AddPatrolPos(self:RandomPos(1500))
	end

	-- Animations/Sounds --

	function ENT:OnLeaveGround()
		self:SetBodygroup(1, 1)
		self:PlayActivity(ACT_JUMP)
		self.WingsOpen = self:StartLoopingSound("NPC_Antlion.WingsOpen")
	end
	function ENT:OnLandOnGround()
		self:SetBodygroup(1, 0)
		if isnumber(self.WingsOpen) then
			self:StopLoopingSound(self.WingsOpen)
			self:EmitSlotSound("Landing", 1, "NPC_Antlion.Land")
		end
	end
	function ENT:OnRemove()
		if isnumber(self.WingsOpen) then
			self:StopLoopingSound(self.WingsOpen)
		end
	end

	function ENT:OnAnimEvent()
		if self:IsAttacking() then
			if self:GetCycle() > 0.3 then
				self:Attack({
					damage = 5,
					range = 50,
					type = DMG_SLASH,
					viewpunch = Angle(10, 0, 0)
				}, function(self, hit)
					if #hit > 0 then self:EmitSound("NPC_Antlion.MeleeAttack") end
				end)
			else self:EmitSound("NPC_Antlion.MeleeAttackSingle") end
		elseif self:IsOnGround() then
			self:EmitSound("NPC_Antlion.Footstep")
		end
	end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/realistichandcuffs/lua/entities/npc_jailer/cl_init.lua:
include('shared.lua')

function ENT:Initialize ()
	self.aps = 40
	self.lastRot = CurTime()
	self.curRot = 0
end

function ENT:Draw()
	self.curRot = self.curRot + (self.aps * (CurTime() - self.lastRot))
	if (self.curRot > 360) then self.curRot = self.curRot - 360 end
	self.lastRot = CurTime()
	
	local Maxs = self:LocalToWorld(self:OBBMaxs())
	local EntPos = self:GetPos()
	local TextPos = Vector(EntPos.x,EntPos.y,Maxs.z+8)
	local Text = RHandcuffsConfig.JailerText
	
	cam.Start3D2D(TextPos, Angle(180, self.curRot, -90), .1)
		draw.SimpleText(Text, "rhc_npc_text", 0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	cam.End3D2D()	
	cam.Start3D2D(TextPos, Angle(180, self.curRot + 180, -90), .1)
		draw.SimpleText(Text, "rhc_npc_text", 0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()

	self:DrawModel()	
end

function ENT:OnRemove( )
end	

--PATH addons/pcasino/lua/entities/pcasino_prize_plinth/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Sign Wall Logo"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false

PerfectCasino.Core.RegisterEntity("pcasino_prize_plinth", {
	general = {
		rope = {d = true, t = "bool"},
		model = {d = "models/buggy.mdl", t = "string"}, 
		spin = {d = true, t = "bool"}, 
		bow = {d = false, t = "bool"}, 
		bowOffset = {d = 0, t = "int"}, 
	},
},
"models/freeman/owain_prize_plinth.mdl")
--PATH addons/pcasino/lua/entities/pcasino_roulette_table/cl_init.lua:
include("shared.lua")


function ENT:Initialize()
	self.currentBid = 0
	self.active = false
	self.currentBets = {}

	self.hasInitialized = true
end

function ENT:PostData()
	if not self.hasInitialized then
		self:Initialize()
	end

	self.currentBid = self.data.bet.default
	self:GetCurrentPad(Vector(0, 0, 0)) -- To force generate the cache
end
function ENT:OnRemove()
	self:ClearBets()
end

local surface_setdrawcolor = surface.SetDrawColor
local surface_drawrect = surface.DrawRect
local draw_simpletext = draw.SimpleText
local black = Color(0, 0, 0, 155)
local white = Color(255, 255, 255, 100)
local gold = Color(255, 200, 0, 100)
function ENT:Draw()
	self:DrawModel()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 25000 then return end

	-- We can piggyback off the distance check to only request the entities data when it's needed :D
	if (not self.data) and (not PerfectCasino.Cooldown.Check(self:EntIndex(), 5)) then
		PerfectCasino.Core.RequestConfigData(self)
		return
	end

	if not self.data then return end


	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis(ang:Up(), -90)

	cam.Start3D2D(pos + (ang:Up()*14.7) + (ang:Right()*20) + (ang:Forward()*-15.5), ang, 0.05)
		local button = self:GetCurrentPad(self:WorldToLocal(LocalPlayer():GetEyeTrace().HitPos))


		-- Bet limit
		if self.data.bet.betLimit and not (tonumber(self.data.bet.betLimit) == 0) then
			surface_setdrawcolor(black)
			surface_drawrect(5, -80, 410, 65)
			-- Border
			surface_setdrawcolor(white)
			surface_drawrect(0, -85, 420, 5)
			surface_drawrect(0, -80, 5, 65)
			surface_drawrect(415, -80, 5, 65)
			surface_drawrect(0, -15, 420, 5)
			-- Bet limit text
			draw_simpletext(string.format(PerfectCasino.Translation.UI.BetLimit, PerfectCasino.Config.FormatMoney(self.data.bet.betLimit)), "pCasino.Entity.Bid", 215, -47, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	
		-- Previous bet step
		surface_setdrawcolor(black)
		surface_drawrect(5, 5, 90, 65)
		-- Border
		surface_setdrawcolor(button == "bet_lower" and gold or white)
		surface_drawrect(0, 0, 100, 5)
		surface_drawrect(0, 5, 5, 65)
		surface_drawrect(95, 5, 5, 65)
		surface_drawrect(0, 70, 100, 5)
		-- Left arrow
		draw_simpletext("<", "pCasino.Entity.Arrows", 50, 35, button == "bet_lower" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		-- Current bet
		surface_setdrawcolor(black)
		surface_drawrect(115, 5, 190, 65)
		-- Border
		surface_setdrawcolor(white)
		surface_drawrect(110, 0, 200, 5)
		surface_drawrect(110, 5, 5, 65)
		surface_drawrect(305, 5, 5, 65)
		surface_drawrect(110, 70, 200, 5)
		-- Current Bid
		draw_simpletext(PerfectCasino.Config.FormatMoney(self.currentBid), "pCasino.Entity.Bid", 215, 37, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		-- Next bet step
		-- Box
		surface_setdrawcolor(black)
		surface_drawrect(325, 5, 90, 65)
		-- Border
		surface_setdrawcolor(button == "bet_raise" and gold or white)
		surface_drawrect(320, 0, 100, 5)
		surface_drawrect(320, 5, 5, 65)
		surface_drawrect(415, 5, 5, 65)
		surface_drawrect(320, 70, 100, 5)
		-- Right arrow
		draw_simpletext(">", "pCasino.Entity.Arrows", 370, 35, button == "bet_raise" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()

	if (not (self:GetStartRoundIn() == -1)) or (self:GetLastRoundNumber() >= 0) then
		ang:RotateAroundAxis(ang:Forward(), 90)
		ang:RotateAroundAxis(ang:Right(), 90)
		cam.Start3D2D(pos + (ang:Up()*-20.3) + (ang:Right()*-21.3) + (ang:Forward()*-15), ang, 0.05)
			
			-- Previous bet step
			surface_setdrawcolor(black)
			surface_drawrect(5, 5, 190, 65)
			-- Border
			surface_setdrawcolor(white)
			surface_drawrect(0, 0, 200, 5)
			surface_drawrect(0, 5, 5, 65)
			surface_drawrect(195, 5, 5, 65)
			surface_drawrect(0, 70, 200, 5)

			local text = (not (self:GetStartRoundIn() == -1)) and string.format(PerfectCasino.Translation.UI.Start, self.data.general.betPeriod - (os.time() - self:GetStartRoundIn())) or string.format(PerfectCasino.Translation.UI.Number, self:GetLastRoundNumber())
			draw_simpletext(text, "pCasino.Entity.Bid", 100, 37, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		cam.End3D2D()
	end

end

local tempStack = {}
local lastPad = false

local function clearTempStack()
	for k, v in pairs(tempStack) do
		if not IsValid(v) then continue end
		v:Remove()
	end
	tempStack = {}
end

function ENT:Think()
	if self.active then return end
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 25000 then return end

	local pos = self:WorldToLocal(LocalPlayer():GetEyeTrace().HitPos)
	local curPad, padData = self:GetCurrentPad(pos)

	if (not curPad) or (curPad == "bet_raise") or (curPad == "bet_lower") then
		lastPad = curPad
		if not table.IsEmpty(tempStack) then
			clearTempStack()
		end
		return
	end -- Don't do anything if it's not a bet pad

	if not (curPad == lastPad) then
		clearTempStack()
	end
	lastPad = curPad

	if table.IsEmpty(tempStack) then
		local chips = PerfectCasino.Chips:GetFromNumber(self.currentBid)
		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Up(), 90)

		for k=#PerfectCasino.Chips.Types, 0, -1 do -- Run it in reverse, putting the highest chips at the bottom
			if not chips[k] then continue end
			for i=1, chips[k] do
				local plaque = k >= 11 -- There are 11 normal skins, so anything over 10 (11-1, due to skins starting at 0) we use the big plaque models

				local chip = ClientsideModel(plaque and "models/freeman/owain_casino_plaque.mdl" or "models/freeman/owain_casino_chip.mdl")
				table.insert(tempStack, chip)
				chip:SetParent(self)
				chip:SetSkin(plaque and k-11 or k)
				chip:SetPos(self:LocalToWorld(Vector(padData.origin.x, padData.origin.y, 14.8+((#tempStack+(self.currentBets[curPad] and #self.currentBets[curPad] or 0))*0.3))))
				chip:SetAngles(ang)
			end
		end
	else
		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Up(), CurTime()*30%360)
		for k, v in pairs(tempStack) do
			v:SetAngles(ang)
		end
	end
end

-- Chip code
function ENT:AddBet(pad, amount)
	local padName, padData = self:GetPadByName(pad)
	if not padName then return end

	self.currentBets[padName] = self.currentBets[padName] or {}

	local chips = PerfectCasino.Chips:GetFromNumber(amount)
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Up(), 90)
	for k=#PerfectCasino.Chips.Types, 0, -1 do -- Run it in reverse, putting the highest chips at the bottom
		if not chips[k] then continue end
		for i=1, chips[k] do
			local plaque = k >= 11 -- There are 11 normal skins, so anything over 10 (11-1, due to skins starting at 0) we use the big plaque models

			local chip = ClientsideModel(plaque and "models/freeman/owain_casino_plaque.mdl" or "models/freeman/owain_casino_chip.mdl")
			table.insert(self.currentBets[padName], chip)
			chip:SetParent(self)
			chip:SetSkin(plaque and k-11 or k)
			chip:SetPos(self:LocalToWorld(Vector(padData.origin.x, padData.origin.y, 14.5+(#self.currentBets[padName]*0.3))))
			chip:SetAngles(ang)
		end
	end

	clearTempStack() -- To update the hight to have over the new stack
end
function ENT:ClearBets()
	for _, pad in pairs(self.currentBets) do
		for k, v in pairs(pad) do
			v:Remove()
		end
	end

	self.currentBets = {}
end

function ENT:OnRemove()
	-- Clear the board of last rounds best
	for k, v in pairs(self.currentBets) do
		if not IsValid(v) then continue end

		v:Remove()
	end
	
	clearTempStack()
end


net.Receive("pCasino:Roulette:Bet:Change", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end

	local newBet = net.ReadUInt(32)
	entity.currentBid = newBet
end)

net.Receive("pCasino:Roulette:Bet:Place", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100000 then return end

	local pad = net.ReadString()
	local betAmount = net.ReadUInt(32)


	entity:AddBet(pad, betAmount)
end)
net.Receive("pCasino:Roulette:Bet:Clear", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end

	entity:ClearBets()
end)
--PATH addons/pcasino/lua/entities/pcasino_slot_machine/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Slot Machine"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "CurrentJackpot")
end

PerfectCasino.Core.RegisterEntity("pcasino_slot_machine", {
	-- General data
	general = {
		limitUse = {d = false, t = "bool"}
	},
	-- Bet data
	bet = {
		default = {d = 1000, t = "num"}, -- The default bet
	},
	-- Combo data
	combo = {
		{c = {"bell", "bell", "bell"}, p = 0.5, j = false},
		{c = {"melon", "melon", "melon"}, p = 0.8, j = false},
		{c = {"cherry", "cherry", "cherry"}, p = 1, j = false},
		{c = {"seven", "seven", "seven"}, p = 1.6, j = false},
		{c = {"clover", "clover", "clover"}, p = 2, j = false},
		{c = {"diamond", "diamond", "diamond"}, p = 2.5, j = false},
		{c = {"diamond", "diamond", "anything"}, p = 2, j = false},
		{c = {"anything", "diamond", "diamond"}, p = 2, j = false},
		{c = {"berry", "berry", "berry"}, p = 2.8, j = false},
		{c = {"dollar", "dollar", "dollar"}, p = 0, j = true},
	},
	jackpot = {
		toggle = {d = true, t = "bool"}, -- The bell chance
		startValue = {d = 10000, t = "num"}, -- Jackpot start value
		betAdd = {d = 0.5, t = "num"}, -- The % of the bet to add to the jackpot
	},
	-- Chance data
	chance = {
		bell = {d = 15}, -- The bell chance
		melon = {d = 10}, -- The watermelon chance
		cherry = {d = 8}, -- The cherry chance
		seven = {d = 6}, -- The seven chance
		clover = {d = 5}, -- The clover chance
		diamond = {d = 3}, -- The diamond chance
		berry = {d = 2}, -- The strawberrry chance
		dollar = {d = 1} -- The dollar chance
	},
},
"models/freeman/owain_slotmachine.mdl")
--PATH addons/pcasino/lua/entities/pcasino_wheel_slot_machine/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.active = false
	self.spin = false

	self.wheels = {}
	for i=0, self:GetNumPoseParameters()-2 do
		self.wheels[i+1] = {name = self:GetPoseParameterName(i)}
	end

	self.isPreSpin = false
	self.hasInitialized = true
end
function ENT:PostData()
	if not self.hasInitialized then
		self:Initialize()
	end
end

local colorGold = Color(255, 200, 0)
local colorPurple = Color(255, 0, 255)
local colorDarkWhite = Color(240, 240, 240)
function ENT:Draw()
	self:DrawModel()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 25000 then return end

	-- We can piggyback off the distance check to only request the entities data when it's needed :D
	if (not self.data) and (not PerfectCasino.Cooldown.Check(self:EntIndex(), 5)) then
		PerfectCasino.Core.RequestConfigData(self)
		return
	end

	if not self.data then return end

	-- For ticking value
	self.curJackpot = math.Approach(self.curJackpot or self:GetCurrentJackpot(), self:GetCurrentJackpot(), math.Round((self.data.bet.default*5)*FrameTime()))

	-- Basic setups
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)

	cam.Start3D2D(pos + (ang:Up()*-5.17) + (ang:Right()*-31.63) + (ang:Forward()*-0.1), ang, 0.02)
		-- Spinny wheel icons
		local itter = 0
		for i=1, 360, 360/12 do 
			itter = itter + 1
			local x = math.cos(math.rad(i - 90)) * 115
			local y = math.sin(math.rad(i - 90)) * 115

			draw.NoTexture()
			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetMaterial(PerfectCasino.Icons[self.data.wheel[itter].p].mat)

			PerfectCasino.UI.DrawTexturedRectRotatedPoint(x, y, 80, 80, (-i), 0, -145)
			PerfectCasino.UI.TextRotated(self.data.wheel[itter].n, x, y, colorDarkWhite, "pCasino.Title.Static", i-90)
		end

		-- Pre spin text
		if self.isPreSpin and (math.ceil((CurTime()*2)%2) == 1) then
			draw.SimpleText(PerfectCasino.Translation.UI.SpinThatWheel, "pCasino.Entity.Bid", 0, 590, colorPurple, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		draw.SimpleText(string.format(PerfectCasino.Translation.UI.JackPot, PerfectCasino.Config.FormatMoney(self.curJackpot)), "pCasino.Title.Static", 0, 650, colorGold, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.SimpleText(string.format(PerfectCasino.Translation.UI.Play, PerfectCasino.Config.FormatMoney(self.data.bet.default)), "pCasino.Title.Static", -415, 650, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
	cam.End3D2D()
end

function ENT:Think()
	if not self.active then return end
	if self.win then
		for i=1, 2 do
			local winLight = DynamicLight(self:EntIndex()+i)
			if winLight then
				winLight.pos = self:GetPos()+(self:GetUp()*13)+(self:GetForward()*-5)+((self:GetRight()*3)*(-3+(2*i)))
				winLight.r = (self.win == 2) and ((math.Round(CurTime()%1) == 1) and 100 or 0) or 100
				winLight.g = self.win == 2 and 0 or 100
				winLight.b = (self.win == 2) and 100 or 0 -- and ((math.Round(CurTime()%2) == 1) and
				winLight.brightness = 3
				winLight.Decay = 1000
				winLight.Size = 100
				winLight.DieTime = CurTime() + 1
			end
		end
	end

	for k, v in pairs(self.wheels) do
		if v.spinning then
			self:SetPoseParameter(v.name, (CurTime()*600)%360)
		end
	end
end

-- Game specific code
function ENT:StartSpinning(i)
	self.wheels[i].spinning = true
end

function ENT:StopSpinning(i, result)
	local wheel = self.wheels[i]
	if not wheel then return end
	
	wheel.spinning = false
end

function ENT:StartWin(winData)
	-- 2 is jackpot, 1 is normal win
	self.win = tobool(winData.j) and 2 or 1
end

function ENT:EndWin()
	self.active = false
	self.win = nil
	self.spin = false
	self.isPreSpin = false
end

net.Receive("pCasino:WheelSlot:Spin:Start", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 500000 then return end
	if not entity.data then return end

	entity.active = true

	for i=1, 3 do
		entity:StartSpinning(i)
	end
end)

net.Receive("pCasino:WheelSlot:Spin:Stop", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.active then return end
	if not entity.data then return end

	local key = net.ReadUInt(2)
	local result = net.ReadString()
	entity:StopSpinning(key, result)
end)

net.Receive("pCasino:WheelSlot:Spin:Win", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.active then return end
	if not entity.data then return end

	local winData = net.ReadTable()
	entity:StartWin(winData)
	
	if tobool(winData.j) then
		entity.isPreSpin = true
		return
	end

	timer.Simple(2, function()
		entity:EndWin()
	end)
end)

net.Receive("pCasino:WheelSlot:Spin:Spin", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.active then return end
	if not entity.data then return end

	entity.spin = true
	entity.isPreSpin = false
	timer.Simple(5, function()
		entity:EndWin()
	end)
end)
--PATH lua/entities/pfx1_08#_l.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large Fire [Pink]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_large_campfire_pink"
--PATH lua/entities/pfx1_08_.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [Red]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_campfire_red"
--PATH lua/entities/pfx1_0c~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large fire"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]ground_fire_1*"
--PATH lua/entities/pfx2_00.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Sparkle 1"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]sparkle1"

--PATH lua/entities/pfx2_03.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Ground Acid"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]acid_ground"
--PATH lua/entities/pfx3_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Tree Leafs 1"
ENT.Category         = "PPE: Nature"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[3]leaves_env"



--PATH lua/entities/pfx4_01_s~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Blue Jet [Smokeless]"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_b_s*"

--PATH lua/entities/pfx5_00_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Small Black Hole"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]black_hole_micro"
--PATH lua/entities/pfx7_05.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Blizzard [Moderate]"
ENT.Category         = "PPE: Weather"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[7]blizzard_mod"
--PATH lua/entities/pfx8_02.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Magic Flame 2"
ENT.Category         = "PPE: Magic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[8]magic_flame"
--PATH addons/sl_main_system/lua/entities/portail_sl/shared.lua:
ENT.Type                    = "anim"
ENT.Base                    = "base_gmodentity"

ENT.PrintName				= "Portail"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true

game.AddParticles( "particles/mad_sololeveling1.pcf" )
game.AddParticles( "particles/mad_sololeveling3.pcf" )

-- if SERVER then
-- 	PrecacheParticleSystem( "[NE]PortailBleue" )
-- 	PrecacheParticleSystem( "[NE]PortailRouge" )
-- end

-- function ENT:Initialize()
-- 	timer.Simple(0.5, function()
-- 		if self:GetNWInt("Rang") == "S" then
-- 			ParticleEffectAttach("[NE]PortailRouge", 4, self, 0)
-- 		else
-- 			ParticleEffectAttach("[NE]PortailBleue", 4, self, 0)
-- 		end
-- 	end)
-- end

-- DrGBase._SpawnedNextbots = {}
--PATH lua/entities/proj_drg_default/meta.lua:

local entMETA = FindMetaTable("Entity")

if SERVER then

	local old_GetVelocity = entMETA.GetVelocity
	function entMETA:GetVelocity()
		if self.IsDrGProjectile then
			local phys = self:GetPhysicsObject()
			if IsValid(phys) then
				return phys:GetVelocity()
			else return old_GetVelocity(self) end
		else return old_GetVelocity(self) end
	end

	local old_SetVelocity = entMETA.SetVelocity
	function entMETA:SetVelocity(velocity)
		if self.IsDrGProjectile then
			local phys = self:GetPhysicsObject()
			if IsValid(phys) then
				return phys:SetVelocity(velocity)
			else return old_SetVelocity(self, velocity) end
		else return old_SetVelocity(self, velocity) end
	end

end

--PATH addons/sl_utils/lua/entities/seefox_hunterdoor/shared.lua:
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Hunter Door"
ENT.Category = "NW - SL"
ENT.Author = "Seefox"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/sl_bouffe/lua/entities/sl_beercan2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Pißwasser)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beercan02.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_champagne4/shared.lua:
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
--PATH addons/sl_bouffe/lua/entities/sl_mcdsoda/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "McDonalds Soda"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A cup of McDonalds Soda"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/mcddrink.mdl")
	
end
--PATH lua/entities/sodacanb02/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Monster Energy (Lo-Carb)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacanb02.mdl")
	
end
--PATH lua/entities/sodasprunk1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Sprunk (Large)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A large bottle of Sprunk"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/sprunk1.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/spawned_ammo/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Spawned Ammo"
ENT.Author = "FPtje"
ENT.Spawnable = false
ENT.IsSpawnedAmmo = true

--PATH gamemodes/mangarp/entities/entities/spawned_shipment/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Shipment"
ENT.Author = "philxyz"
ENT.Spawnable = false
ENT.IsSpawnedShipment = true

function ENT:SetupDataTables()
    self:NetworkVar("Int",0,"contents")
    self:NetworkVar("Int",1,"count")
    self:NetworkVar("Float", 0, "gunspawn")
    self:NetworkVar("Entity", 0, "owning_ent")
    self:NetworkVar("Entity", 1, "gunModel")
end

DarkRP.declareChatCommand{
    command = "splitshipment",
    description = "Split the shipment you're looking at.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "makeshipment",
    description = "Create a shipment from a dropped weapon.",
    delay = 1.5
}

--PATH gamemodes/mangarp/entities/entities/spawned_weapon/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Spawned Weapon"
ENT.Author = "Rickster"
ENT.Spawnable = false
ENT.IsSpawnedWeapon = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "amount")
    self:NetworkVar("String", 0, "WeaponClass")
end

--PATH lua/entities/wineclassic3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Wine (Classic)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/winebottle3.mdl")
	
end
--PATH lua/entities/winered3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Wine (Red)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/wine_red3.mdl")
	
end
--PATH addons/sl_main_system/lua/effects/sl_effect10.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
    self.Ent = data:GetEntity()
    self.Pos = data:GetOrigin()

    self.LifeTime = 2
    self.DieTime = CurTime() + self.LifeTime

    if not IsValid( self.Ent ) then return end

    self.swep = self.Ent:GetActiveWeapon()

    if self.Ent:GetNWString("CosmetiqueArme") != "RIEN" then
        self.Model = ClientsideModel( self.Ent:GetNWString("CosmetiqueArme"), RENDERGROUP_TRANSLUCENT )
    else
        if self.Ent:GetActiveWeapon().ModelArme then self.Model = ClientsideModel( self.Ent:GetActiveWeapon().ModelArme, RENDERGROUP_TRANSLUCENT ) else self.Model = ClientsideModel( "models/mad_worldmodel/sword14.mdl", RENDERGROUP_TRANSLUCENT ) end
    end

    self.Model:SetColor( Color(255,255,255) )
    self.Model:SetParent( self.Ent, 0 )
    self.Model:SetMoveType( MOVETYPE_NONE )
    self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
    self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
    self.Model:AddEffects( EF_BONEMERGE )

    for i = 0,self.Ent:GetBoneCount() do
        self.Model:ManipulateBoneScale( i, Vector(1,1,1) * 1 )
    end

    for i = 0, self.Ent:GetNumBodyGroups() do
        self.Model:SetBodygroup(i, self.Ent:GetBodygroup(i))
    end
end

function EFFECT:Think()
    if not IsValid( self.Ent ) then if IsValid( self.Model ) then self.Model:Remove() end return false end
    if self.Ent:GetNoDraw() or self.Ent:GetActiveWeapon() != self.swep or not IsValid( self.Ent ) or not self.Ent:Alive() then 
        if IsValid( self.Model ) then
            self.Model:Remove()
        end

        return false
    end

    return true
end

function EFFECT:Render()
    if not IsValid( self.Ent ) then self.Model:Remove() return false end
    if self.Ent:GetNoDraw() or self.Ent:GetActiveWeapon() != self.swep or not IsValid( self.Ent ) or not self.Ent:Alive() then return end

end

--PATH addons/sl_main_system/lua/effects/sl_effect4.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
    self.Ent = data:GetEntity()
    self.Pos = data:GetOrigin()

    self.LifeTime = 1
    self.DieTime = CurTime() + self.LifeTime

    if not IsValid( self.Ent ) then return end

    self.Model = ClientsideModel( self.Ent:GetModel(), RENDERGROUP_TRANSLUCENT )

    self.Model:SetMaterial("models/alyx/emptool_glow")
    self.Model:SetColor( Color(255,0,0) )
    self.Model:SetParent( self.Ent, 0 )
    self.Model:SetMoveType( MOVETYPE_NONE )
    self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
    self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
    self.Model:AddEffects( EF_BONEMERGE )
    
    for i = 0,self.Ent:GetBoneCount() do
        self.Model:ManipulateBoneScale( i, Vector(1,1,1) * 1.1 )
    end

    for i = 0, self.Ent:GetNumBodyGroups() do
        self.Model:SetBodygroup(i, self.Ent:GetBodygroup(i))
    end
end

function EFFECT:Think()
    if self.DieTime < CurTime() or not IsValid( self.Ent ) or (self.Ent.Alive and not self.Ent:Alive()) then 
        if IsValid( self.Model ) then
            self.Model:Remove()
        end

        return false
    end

    if IsValid( self.Model ) then
        self.Model:SetColor( Color(255* (self.DieTime - CurTime()) / self.LifeTime,0,0,255) )
    end

    return true
end

function EFFECT:Render()
    if not IsValid( self.Ent ) then return end

end

--PATH addons/sl_main_system/lua/effects/sl_effect9.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
    self.Ent = data:GetEntity()
    self.Pos = data:GetOrigin()

    self.LifeTime = 1
    self.DieTime = CurTime() + self.LifeTime

    if not IsValid( self.Ent ) then return end

    self.Model = ClientsideModel( self.Ent:GetModel(), RENDERGROUP_TRANSLUCENT )

    self.Model:SetMaterial("models/alyx/emptool_glow")
    self.Model:SetColor( Color(127,255,255) )
    self.Model:SetParent( self.Ent, 0 )
    self.Model:SetMoveType( MOVETYPE_NONE )
    self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
    self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
    self.Model:AddEffects( EF_BONEMERGE )
    
    for i = 0,self.Ent:GetBoneCount() do
        self.Model:ManipulateBoneScale( i, Vector(1,1,1) * 1.1 )
    end

    for i = 0, self.Ent:GetNumBodyGroups() do
        self.Model:SetBodygroup(i, self.Ent:GetBodygroup(i))
    end
end

function EFFECT:Think()
    if self.DieTime < CurTime() or not IsValid( self.Ent ) or (self.Ent.Alive and not self.Ent:Alive()) then 
        if IsValid( self.Model ) then
            self.Model:Remove()
        end

        return false
    end

    if IsValid( self.Model ) then
        self.Model:SetColor( Color(127* (self.DieTime - CurTime()) / self.LifeTime,255,255,255) )
    end

    return true
end

function EFFECT:Render()
    if not IsValid( self.Ent ) then return end

end

--PATH addons/sl_main_system/lua/weapons/mad_dague12/shared.lua:
--