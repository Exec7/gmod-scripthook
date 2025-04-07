--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 8/10 - 08/04/2025


--PATH lua/autorun/!nw_init.lua:
if not SERVER then return end

Seefox_PlayerCount = Seefox_PlayerCount or player.GetCount()

gameevent.Listen("player_connect")
hook.Add("player_connect", "Seefox:NewEra:ReservedSlots", function()
    Seefox_PlayerCount = Seefox_PlayerCount + 1
end)

gameevent.Listen("player_disconnect")
hook.Add("player_disconnect", "Seefox:NewEra:ReservedSlots", function()
    Seefox_PlayerCount = Seefox_PlayerCount - 1
end)

include("newera/init.lua")
--PATH addons/sl_util_accessory/lua/advanced_accessories/languages/sh_language_ru.lua:
AAS = AAS or {}
AAS.Language = AAS.Language  or {}

AAS.Language["ru"] = {
    ["cancel"] = "Отменить",
    ["save"] = "Сохранить",
    ["name"] = "Название",
    ["model"] = "Модель",
    ["itemPrice"] = "Цена предмета",
    ["itemPos"] = "Позиция предмета",
    ["itemStat"] = "Статистика предмета",
    ["itemJob"] = "Эксклюзивно для работы",
    ["itemName"] = "Название предмета",
    ["customCharacter"] = "ИЗМЕНИТЬ ВАШУ ВНЕШНОСТЬ",
    ["adminDashboard"] = "ПАНЕЛЬ АДМИНИСТРАТОРА",
    ["welcomeText"] = "ДОБРО ПОЖАЛОВАТЬ, ЧТО ВЫ ХОТЕЛИ КУПИТЬ?",
    ["position"] = "ПОЗИЦИЯ",
    ["rotation"] = "РАЗВОРОТ",
    ["scale"] = "РАЗМЕР",
    ["description"] = "Краткое описание предмета",
    ["search"] = "  Поиск предметов...",
    ["sell"] = "Продать",
    ["buy"] = "Купить",
    ["buyaccessory"] = "Купить аксессуар",
    ["sellaccessory"] = "Продать аксессуар",
    ["sure"] = "Вы правда хотите совершить это действие?",
    ["activate"] = "Активировать",
    ["desactivate"] = "Деактивировать",
    ["modifypos"] = "Изменить позицию",
    ["edititem"] = "Изменить",
    ["appearance"] = "Внешность",
    ["skin"] = "Скин",
    ["desc"] = "Описание",
    ["titleactivate"] = "Активировать / Деактивировать предмет",
    ["choosecategory"] = "Выбрать категорию",
    ["chooseskin"] = "Выбрать скин",
    ["additem"] = "Добавлять",
    ["adminname"] = "Название этого предмета не корректно!",
    ["faildesc"] = "Описание предмета не корректно!",
    ["failprice"] = "Цена не корректна!",
    ["choosemodel"] = "Вам нужно сменить модель!",
    ["failcategory"] = "Вам надо выбрать категорию для предмета",
    ["updateItem"] = "Вы переоделись",
    ["deleteItem"] = "Вы удалили предмет",
    ["ownedItem"] = "Вы уже владеете этим предметом",
    ["notEnoughtMoney"] = "У вас не достаточно денег!",
    ["notRank"] = "У вас не тот ранг чтобы использовать это!",
    ["itemDesactivate"] = "Этот предмет уже отключен!",
    ["sellItem"] = "Вы продали товар для",
    ["cantEquip"] = "Вы не можете одеть предмет!",
    ["itemVip"] = "Этот предмет забронированно для VIP",
    ["jobProblem"] = "У вас нет возможности сделать это со своей работой!",
    ["exploitArmory"] = "Вы находитесь слишком далеко от шкафа с одеждой, чтобы выполнить это действие!",
    ["exploitNpc"] = "Вы находитесь слишком далеко от npc, чтобы выполнить это действие!",
    ["saveBodygroup"] = "Вы только что сохранили внешний вид своего персонажа!",
    ["addItem"] = "Вы добавили этот элемент",
    ["buyItem"] = "Вы только что купили",
    ["for"] = "для",
    ["noItems"] = "На рынке нет товаров \n Пожалуйста, свяжитесь с администратором для получения более подробной информации !",
    ["yourInventory"] = "ВАШ ИНВЕНТАРЬ",
    ["emptyInventory"] = "В вашем инвентаре нет предметов",
    ["changeInv"] = "Вы можете изменить свой",
    ["clickingHere"] = "нажав здесь!",
    ["upHere"] = "Что вы хотите выбрать сегодня?",
    ["equipItem"] = "Вы только что одели свой предмет",
    ["deequipedItem"] = "Вы только что демонтировали свой предмет",
    ["equipModel"] = "Ты изменил свою внешность!",
    ["saveModel"] = "Сохранить модель",
    ["toomany"] = "У тебя в рюкзаке недостаточно места, чтобы купить это.",
    ["backpack"] = "Рюкзак",
    ["bought"] = "Одет",
    ["comboskin"] = "Выбрать скин",
    ["combocategory"] = "Выбрать категорию",
    ["waitItem"] = "Пожалуйста, подождите немного, прежде чем устанавливать другой аксессуар.",
    ["waitEquip"] = "Вы подгоняете аксессуар..",
    ["swepcantgo"] = "Вы не можете пойти в магазин аксессуаров с подметальной машиной!",
    ["iconPos"] = "Изменить позицию иконки",
    ["iconFov"] = "Изменить FOV иконки",
    ["itemUniqueId"] = "Item UniqueId",
    ["adjustAccessory"] = "Настроить Аксессуар",
    ["adjust"] = "Настроить",
    ["adjustText"] = "Вы хотите настроить элемент?",
    ["notOwned"] = "Вы не приобрели это!",
    ["rankBlackList"] = "Ранг в черном списке",

    ["titleGingerBread"] = "Имбирный пряник",
    ["titleCap"] = "Кепка",
    ["titleHeadphones"] = "Наушники",
    ["titleHawkMask"] = "Маска Ястреба",
    ["titleBeret"] = "Берета",
    ["titleBandMask"] = "Ленточная маска",
    ["titlePinguin"] = "Маска Пингвин",
    ["titleMummyMask"] = "Маска Мумии",
    ["titleBandana"] = "Бандана",
    ["titleBag"] = "Сумка",
    ["titleMonkeyMask"] = "Маска Мортышки",
    ["titleNinjaMask"] = "Маска Ниндзя",
    ["titleZombieMask"] = "Маска Зомби",
    ["titlePleaseStop"] = "Пожалуйста остановитесь",
    ["titleSkullMask"] = "Маска Черепа",
    ["titleGentlemanshat"] = "Шляпа джентльмена",
    ["titleMaskDoctor"] = "Маска Доктора",
    ["titleOrangeHat"] = "Оранжевая Шляпа",
    ["titleBlackBagPack"] = "Чёрный рюкзак",
    ["titlePigHat"] = "Поросячья Шляпа",
    ["titleCap2"] = "Кепка 2",
    ["titleBigBagpack"] = "Большой рюкзак 2",
    ["titleSchoolBagPack"] = "Школьный рюкзак",
    ["titleBeerHat"] = "Шляпа с пивом",
    ["titleArmor"] = "Броня",
    ["titleMaskDuck"] = "Утиная маска",
    ["titleGlasses"] = "Очки",
    ["titleGlasses2"] = "Очки 2",
    ["titleAfro"] = "Афро",
    ["titleMarioHat"] = "Шляпа Марио",
    ["titleGlasses3"] = "Очко 3",
    ["titleLuigiHat"] = "Шляпа Луиджи",
    ["titleGlasses4"] = "Очки 4",
    ["titleGlasses5"] = "Очки 5",
    ["titleToadHat"] = "Жабья шляпа",
    ["titleServboHead"] = "Головка Сервбота",
    ["titleCatHat"] = "Шляпа кота",
    ["titleStrawHat"] = "Соломенная шляпа",
    ["titleRabbitEar"] = "Кроличье ухо",
    ["titleSunHat"] = "Шляпа от солнца",
    ["title3DGlasses"] = "3D Очки",
    ["titleCatsEars"] = "Кошачьи уши",
    ["titleCatHat2"] = "Шляпа кота 2",
    ["titleJasonMask"] = "Маска Джейсона",
    ["titleMustache"] = "Усы",
    ["titleCowboyHat"] = "Шляпа ковбоя",
    ["titleDeadmau5"] = "Deadmau5",
    ["titleFrogHat"] = "Шляпа Лягушки",
    ["titleHeartBand"] = "Ленточные сердечки",
    ["titlePumpkinHead"] = "Голова тыква",
    ["titleChristmasHat"] = "Рождественская шляпа",
    ["titleStarHeadband"] = "Звездная повязка на голову",
    ["titleThomasHat"] = "Шляпа Томаса",
    ["titleSombrero"] = "Сомбреро",
    ["titleHeadphones2"] = "Наушнии 2",
    ["titleSnowGoggles"] = "Зимные очки",
    ["titleCap3"] = "Кепка 3",
    ["titleHat"] = "Чёрная шляпа",
    ["titleGlasses6"] = "Очки 6",
    ["titleCap4"] = "Кепка 4",
    ["titleDrinkCap"] = "Крышка для напитка",
    ["titleStarGlasses"] = "Звёздные очки",
    ["titleCatEars"] = "Кошачьи уши",
    ["titleHat2"] = "Шляпа 2",
    ["titleBabyRhino"] = "Детеныш Носорога",
    ["titleArnoldMask"] = "Маска Арнольда",
    ["titleChuckMask"] = "Маска Чака",
    ["titleDeerMask"] = "Маска Оленя",
    ["titlePandaMask"] = "Маска Панды",
    ["titleMonkeyMask2"] = "Маска объезьяны 2",
    ["titleBearMask"] = "Маска Медведя",
    ["titlePigMask"] = "Маска Свиньи.",
    ["titlePolishBeret"] = "Польская Берет",
    ["titlePolishBeret2"] = "Польская Берет 2",
    ["titlePolishBeret3"] = "Польская Берет 3",
    ["titleBikeHelmet"] = "Велосипедный шлем",
    ["titleBikeHelmet2"] = "Велосипедный шлем 2",
    ["titleBikeHelmet3"] = "Велосипедный шлем 3",
    ["titleBikeHelmet4"] = "Велосипедный шлем 4",
    ["titleBikeHelmet5"] = "Велосипедный шлем 5",
    ["titleBikeHelmet6"] = "Велосипедный шлем 6",
    ["titleBikeHelmet7"] = "Велосипедный шлем 7",
    ["titleBikeHelmet8"] = "Велосипедный шлем 8",
    ["titleBikeHelmet9"] = "Велосипедный шлем 9",
    ["titleBikeHelmet10"] = "Велосипедный шлем 10",
    ["titleBikeHelmet11"] = "Велосипедный шлем 11",
    ["titleBikeHelmet12"] = "Велосипедный шлем 12",
    ["titleBikeHelmet13"] = "Велосипедный шлем 13",
    ["titleBikeHelmet14"] = "Велосипедный шлем 14",
    ["titleBikeHelmet15"] = "Велосипедный шлем 15",
    ["titlePumpkinMask"] = "Маска Тывы",
    ["titleHorseMask"] = "Маска лошади",
    ["titleHorseMask2"] = "Маска лошади 2",
    ["titleHorseMask3"] = "Маска лошади 3",
    ["titleRussianHat"] = "Русская шляпа",

    ["descGingerBread"] = "Прекрасный пряник",
    ["descCap"] = "Шапочку, если вам холодно!",
    ["descHeadphones"] = "Слишком много шума этот аксессуар создан для вас",
    ["descHawkMask"] = "Красивая маска Ястреба",
    ["descBeret"] = "Ух ты! Это отлично смотрится на тебе",
    ["descBandMask"] = "Лучшая Маска для преступления",
    ["descPinguin"] = "Маска пингвина",
    ["descMummyMask"] = "Теперь ты друг Анубиса",
    ["descBandana"] = "Красивая бандана.",
    ["descBag"] = "Ваша любимая сумка для продуктов!",
    ["descMonkeyMask"] = "Красивая маска обезьяны",
    ["descNinjaMask"] = "Твой пропуск шиноби!",
    ["descZombieMask"] = "Идеально подходит для вашего смертельного путешествия!",
    ["descPleaseStop"] = "Красивая маска!",
    ["descSkullMask"] = "Лучшая маска для ваших шалостей на Хэллоуин",
    ["descGentlemanshat"] = "Шляпа джентльмена",
    ["descMaskDoctor"] = "Маска врача",
    ["descOrangeHat"] = "Оранжевая шляпа",
    ["descBlackBagPack"] = "Пакет из черной сумки",
    ["descPigHat"] = "Ты любишь свинью?",
    ["descCap2"] = "Чтобы защитить вас от солнца!",
    ["descBigBagpack"] = "Большой пакет с сумкой",
    ["descSchoolBagPack"] = "Пакет школьной сумки",
    ["descBeerHat"] = "Пивная шляпа",
    ["descArmor"] = "Просто броня",
    ["descMaskDuck"] = "Забавная утиная шляпа",
    ["descGlasses"] = "У тебя болят глаза? Тогда они созданы для вас",
    ["descGlasses2"] = "У тебя болят глаза? Тогда они созданы для вас",
    ["descAfro"] = "Хотите хорошо выглядеть?",
    ["descMarioHat"] = "Если вы поклонник Луиджи!",
    ["descGlasses3"] = "У тебя болят глаза? Тогда они созданы для вас",
    ["descLuigiHat"] = "Если вы поклонник Луиджи!",
    ["descGlasses4"] = "У тебя болят глаза? Тогда они созданы для вас",
    ["descGlasses5"] = "У тебя болят глаза? Тогда они созданы для вас",
    ["descToadHat"] = "Если вы поклонник жабы!",
    ["descServboHead"] = "Я люблю жизнь!",
    ["descCatHat"] = "Красивая кошачья шляпа.",
    ["descStrawHat"] = "Красивая соломенная шляпа!",
    ["descRabbitEar"] = "Очень красивые кроличьи ушки",
    ["descSunHat"] = "Чтобы хорошо провести время во время путешествия",
    ["desc3DGlasses"] = "Чтобы хорошо провести время в кино!",
    ["descCatsEars"] = "Почувствуй себя кошкой.",
    ["descCatHat2"] = "Красивая кошачья шляпа.",
    ["descJasonMask"] = "Маска из твоего любимого фильма ужасов",
    ["descMustache"] = "Красивые усы!",
    ["descCowboyHat"] = "Вы всегда мечтали стать ковбоем?",
    ["descDeadmau5"] = "Вы когда-нибудь мечтали быть Deadmau5?",
    ["descFrogHat"] = "Красивая шляпа-лягушка.",
    ["descHeartBand"] = "Повязка на голову с сердечком.",
    ["descPumpkinHead"] = "Идеальная маска для лица для ваших прогулок на Хэллоуин.",
    ["descChristmasHat"] = "Мы желаем вам счастливого Рождества.",
    ["descStarHeadband"] = "Станьте звездой с этой повязкой на голове.",
    ["descThomasHat"] = "Вы любите музыку?",
    ["descSombrero"] = "Красивая мексиканская шляпа!",
    ["descHeadphones2"] = "С помощью этих наушников слушайте качественную музыку",
    ["descSnowGoggles"] = "Кататься на лыжах в полной безопасности!",
    ["descCap3"] = "Хорошая кепка.",
    ["descHat"] = "Роскошная черная шляпа.",
    ["descGlasses6"] = "Роскошная пара очков.",
    ["descCap4"] = "Базовая шапочка.",
    ["descDrinkCap"] = "Красивая крышка для напитка!",
    ["descStarGlasses"] = "Если вы мечтаете стать звездой!",
    ["descCatEars"] = "Красивые кошачьи ушки.",
    ["descHat2"] = "Хорошая базовая черная шляпа.",
    ["descBabyRhino"] = "Если ты любишь Носорога.",
    ["descArnoldMask"] = "Маска Арнольда",
    ["descChuckMask"] = "Маска патрона",
    ["descDeerMask"] = "Прекрасная Маска Оленя!",
    ["descPandaMask"] = "Классная маска Панды! Для твоих жарких ночей с твоей девушкой",
    ["descMonkeyMask2"] = "Лучшая маска обезьяны на рынке!",
    ["descBearMask"] = "Простая медвежья маска",
    ["descPigMask"] = "Классная маска.",
    ["descPolishBeret"] = "Красивый польский берет",
    ["descPolishBeret2"] = "Красивый польский берет",
    ["descPolishBeret3"] = "Красивый польский берет",
    ["descBikeHelmet"] = "Безопасность на дороге важна!",
    ["descBikeHelmet2"] = "Безопасность на дороге важна!",
    ["descBikeHelmet3"] = "Безопасность на дороге важна!",
    ["descBikeHelmet4"] = "Безопасность на дороге важна!",
    ["descBikeHelmet5"] = "Безопасность на дороге важна!",
    ["descBikeHelmet6"] = "Безопасность на дороге важна!",
    ["descBikeHelmet7"] = "Безопасность на дороге важна!",
    ["descBikeHelmet8"] = "Безопасность на дороге важна!",
    ["descBikeHelmet9"] = "Безопасность на дороге важна!",
    ["descBikeHelmet10"] = "Безопасность на дороге важна!",
    ["descBikeHelmet11"] = "Безопасность на дороге важна!",
    ["descBikeHelmet12"] = "Безопасность на дороге важна!",
    ["descBikeHelmet13"] = "Безопасность на дороге важна!",
    ["descBikeHelmet14"] = "Безопасность на дороге важна!",
    ["descBikeHelmet15"] = "Безопасность на дороге важна!",
    ["descPumpkinMask"] = "Для лучшего Хэллоуина",
    ["descHorseMask"] = "Uuuuuuuuuhuhuhuh",
    ["descHorseMask2"] = "Uuuuuuuuuhuhuhuh",
    ["descHorseMask3"] = "Uuuuuuuuuhuhuhuh",
    ["descRussianHat"] = "A хорошая шляпа, RUSSIAN VODKA!",
}
// 76561198442896680
--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_main.lua:
AAS.LocalPlayer = LocalPlayer()
AAS.ClientTable = AAS.ClientTable or {
    ["Id"] = 1,
    ["ItemsTable"] = {},
    ["ItemSelected"] = nil,
    ["AdminPos"] = {},
    ["ItemsInventory"] = {},
    ["ItemsEquiped"] = {},
    ["ResizeIcon"] = {},
    ["offsetItems"] = {},
    ["filters"] = {["vip"] = true, ["new"] = true, ["search"] = ""}
}

local function resizeFontByLanguage()
    local fontScale = nil
    if AAS.Lang == "es" then
        fontScale = AAS.ScrH*0.022
    elseif AAS.Lang == "ru" then
        fontScale = AAS.ScrH*0.018
    end 

    return fontScale
end

AAS.ScrW, AAS.ScrH = ScrW(), ScrH()
hook.Add("OnScreenSizeChanged", "AAS:OnScreenSizeChanged", function()
    AAS.ScrW = ScrW()
    AAS.ScrH = ScrH()

    AAS.LoadFonts(resizeFontByLanguage())
end)

--[[ Update admin and client list ]]
function AAS.UpdateList(table, bool)
    if IsValid(accessoriesFrame) and IsValid(itemContainer) and IsValid(itemScroll) then
        itemContainer:Clear()

        if #table == 0 and IsValid(sliderList) then AAS.ItemMenu() end
        for k,v in ipairs(table) do
            local newTime = istable(v.options) and tonumber(v.options["date"]) or 0
            local isNew = (((newTime + (AAS.NewTime*60*60*24)) > os.time()) and v.options["new"])

            if (v.options["vip"] and not isNew) and not AAS.ClientTable["filters"]["vip"] and not AAS.ClientTable["filters"]["new"] then continue end
            if (v.options["vip"] and isNew) and not AAS.ClientTable["filters"]["vip"] then continue end
            if (not isNew and not v.options["vip"]) and not AAS.ClientTable["filters"]["new"] then continue end
            if not string.find(v.name:lower(), AAS.ClientTable["filters"]["search"]:lower()) then continue end

            if not IsValid(sliderList) and not v.options.activate then continue end
            
            local itemBackground = vgui.Create("AAS:Cards", itemContainer)
            itemBackground:AddItemView(itemScroll, accessoriesFrame, itemContainer, v)
            
            if IsValid(sliderList) then
                -- [[ Set the first item selected when one was deleted ]]
                local oldItem = AAS.GetTableById((AAS.ClientTable["ItemSelected"].uniqueId or 0))
                if not istable(oldItem) or #oldItem == 0 and k == 1 then
                    AAS.ClientTable["ItemSelected"] = v
                    AAS.settingsScroll(accessoriesFrame, AAS.ScrH*0.11, AAS.ScrH*0.525, true, AAS.GetSentence("edititem"), true, true)
                end
            end

            if not bool then 
                itemBackground:RemoveButton()
            else 
                itemBackground:SetSize(AAS.ScrW*0.11, AAS.ScrH*0.26)
            end
            itemBackground.buttonHover.Think = function(self)
                if not IsValid(playerModel) then return end
                if self:IsHovered() then
                    playerModel:SetDrawAccessories(v.uniqueId)
                else
                    playerModel:RemoveDrawAccessories(v.uniqueId)
                end
            end
        end
    end
end

--[[ Create clientside accessory ]]
function AAS.CreateAccessory(uniqueId, steamId, offsetTable)
    local itemTable = AAS.GetTableById(uniqueId)
        
    AAS.ClientTable["ItemsEquiped"][steamId] = AAS.ClientTable["ItemsEquiped"][steamId] or {}
    local viewModel = AAS.ClientTable["ItemsEquiped"][steamId][itemTable.category]

    if IsValid(viewModel) then viewModel:Remove() end
    if not isstring(itemTable.model) then return end

    local createAccessory = ClientsideModel(itemTable.model)
    createAccessory:SetNoDraw( true )
    createAccessory.uniqueId = uniqueId
    createAccessory.model = itemTable.model
    createAccessory.offset = offsetTable
    
    AAS.ClientTable["ItemsEquiped"][steamId][itemTable.category] = createAccessory
    
    if IsValid(playerModel) then
        playerModel:DrawAccessories()
    end
end

net.Receive("AAS:Main", function()
    local UInt = net.ReadUInt(5)

    if UInt == 1 then
        --[[ Syncrhonise all items created on the server ]]
        local length = net.ReadUInt(32)
        local data = net.ReadData(length)
        local bool = net.ReadBool()
        
        AAS.ClientTable["ItemsTable"] = AAS.UnCompressTable(data) or {}
        AAS.ClientTable["ItemsVisible"] = AAS.ClientTable["ItemsTable"]
        
        if IsValid(accessoriesFrame) then
            for k,v in pairs(AAS.ClientTable["ItemsTable"]) do
                util.PrecacheModel(v.model)
            end
        end
        
        AAS.UpdateList(AAS.ClientTable["ItemsTable"], !IsValid(playerModel))

        if bool then AAS.ItemMenu() end
    elseif UInt == 2 then
        --[[ Open the items menu ]]
        AAS.ItemMenu()

    elseif UInt == 3 then 
        --[[ Create a custom notification ]]
        local time = net.ReadUInt(5)
        local message = net.ReadString()
        
        AAS.Notification(time, message)
        
    elseif UInt == 4 then 
        --[[ Open the bodygroup menu ]]
        AAS.BodyGroup()
    elseif UInt == 5 then
        --[[ Open the model change menu ]]
        AAS.ChangeModels()
    elseif UInt == 6 then
        --[[ Open the adminsettings menu ]]
        AAS.AdminSetting()
    elseif UInt == 7 then
        --[[ Resize fonts ]]
        AAS.LoadFonts(resizeFontByLanguage())
    end 
end)

net.Receive("AAS:Inventory", function()
    local UInt = net.ReadUInt(5)

    if UInt == 1 then 
        --[[ Synchronise your inventory ]]
        local length = net.ReadUInt(32)
        local data = net.ReadData(length)
        
        AAS.ClientTable["ItemsInventory"] = AAS.UnCompressTable(data) or {}

        if IsValid(popupFrame) then
            popupFrame:AlphaTo( 0, 0.3, 0, function()
                popupFrame:Remove()
            end)
        end

        hook.Run("AAS:InventoryChange", AAS.ClientTable["ItemsInventory"])
    elseif UInt == 2 then
        --[[ Equip an accessory ]]
        local uniqueId = net.ReadUInt(32)
        local steamId = net.ReadString()
        local offsetTable = net.ReadTable()
        local category = net.ReadString()

        if not istable(AAS.ClientTable["ItemsEquiped"][steamId]) then AAS.ClientTable["ItemsEquiped"][steamId] = {} end
        local ent = AAS.ClientTable["ItemsEquiped"][steamId][category]
        if IsValid(ent) then ent:Remove() end
        
        AAS.CreateAccessory(uniqueId, steamId, offsetTable)

        local itemTable = AAS.GetTableById(uniqueId)
        
        if AAS.ModifyOffset and IsValid(accessoriesFrame) then
            AAS.SettingsPopupMenu(itemTable)
        end

        hook.Run("AAS:EquipAccessory", uniqueId)
    elseif UInt == 3 then
        --[[ Remove an equiped accessory ]]
        local category = net.ReadString()
        local steamId = net.ReadString()

        if not istable(AAS.ClientTable["ItemsEquiped"][steamId]) then AAS.ClientTable["ItemsEquiped"][steamId] = {} end
        local ent = AAS.ClientTable["ItemsEquiped"][steamId][category]
        if IsValid(ent) then ent:Remove() end

        AAS.ClientTable["ItemsEquiped"][steamId][category] = nil

        if IsValid(playerModel) then
            playerModel:DrawAccessories(category)
        end
        
        hook.Run("AAS:UnEquipAccessory", uniqueId)
        
    elseif UInt == 4 then
        --[[ Just reset the table when the player disconnect ]]
        local steamId = net.ReadString()

        AAS.ClientTable["ItemsEquiped"][steamId] = nil
    elseif UInt == 5 then
        --[[ This is the part for get all accessory of all player in the server]]
        local length = net.ReadUInt(32)
        local data = net.ReadData(length)
        local tbl = AAS.UnCompressTable(data) or {}

        for k,v in ipairs(player.GetAll()) do
            local steamId = v:SteamID()

            if not istable(tbl[v:SteamID()]) then continue end
            for category, uniqueId in pairs(tbl[v:SteamID()]) do
                if istable(uniqueId) then continue end

                local tbl = tbl[v:SteamID()]["offsets"][uniqueId]
                if not istable(tbl) then tbl = {} end

                AAS.CreateAccessory(uniqueId, v:SteamID64(), tbl)
            end
        end
    elseif UInt == 6 then
        --[[ Get all personal offset ]]
        local offsetTable = net.ReadTable()

        AAS.ClientTable["offsetItems"] = offsetTable

        hook.Run("AAS:ChangeOffsetItems")

    elseif UInt == 7 then
        hook.Run("AAS:ClosePlayerSettingsPanel")
    end
end)

local calcPos, calcAng, calcPosE, calcAngE
function AAS.BaseMenu(title, info, sizeX, icon, text)
    AAS.ClientTable["filters"] = {["vip"] = true, ["new"] = true, ["search"] = ""}

    if IsValid(accessoriesFrame) then accessoriesFrame:Remove() end 
    
    local linearGradient = {
        {offset = 0, color = AAS.Gradient["upColor"]},
        {offset = 0.4, color = AAS.Gradient["midleColor"]},
        {offset = 1, color = AAS.Gradient["downColor"]},
    }

    accessoriesFrame = vgui.Create("DFrame")
    accessoriesFrame:SetSize(AAS.ScrW*0.5994, AAS.ScrH*0.65)
    accessoriesFrame:Center()
    accessoriesFrame:SetDraggable(false) 
    accessoriesFrame:SetTitle("")
    accessoriesFrame:ShowCloseButton(false) 
    accessoriesFrame:MakePopup()
    accessoriesFrame.startTime = SysTime()
    accessoriesFrame:SetAlpha(200)
    accessoriesFrame:AlphaTo( 255, 0.3, 0 )
    accessoriesFrame.Paint = function(self,w,h)
        local x, y = accessoriesFrame:GetPos()

        draw.RoundedBoxEx(8, 0, 0, w, AAS.ScrH*0.047, AAS.Colors["background"], true, true, false, false)
        draw.RoundedBox(0, 0, AAS.ScrH*0.04, w, AAS.ScrH*0.009, AAS.Colors["black150"])
        draw.RoundedBoxEx(8, 0, AAS.ScrH*0.047, w, h-AAS.ScrH*0.047, AAS.Colors["black18"], false, false, true, true)

        AAS.LinearGradient(x, y + AAS.ScrH*0.047, AAS.ScrW*0.038, h-AAS.ScrH*0.065, linearGradient, false)
        AAS.LinearGradient(x + w-sizeX, y + AAS.ScrH*0.047, sizeX, h-AAS.ScrH*0.065, linearGradient, false)

        draw.RoundedBoxEx(8, 0, AAS.ScrH*0.63, AAS.ScrW*0.038, AAS.ScrH*0.02, AAS.Gradient["downColor"], false, false, true, false)
        draw.RoundedBoxEx(8, w-sizeX, AAS.ScrH*0.63, sizeX, AAS.ScrH*0.02, AAS.Gradient["downColor"], false, false, false, true)

        draw.SimpleText(title, "AAS:Font:01", AAS.ScrW*0.039, AAS.ScrH*0.019, AAS.Colors["white"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials[icon])

        local sizeY = AAS.Materials[icon]:Height()*AAS.ScrH/1080
        surface.DrawTexturedRect(AAS.ScrW*0.0125, sizeY/2-AAS.ScrH*0.003, AAS.Materials[icon]:Width()*AAS.ScrW/1920, sizeY)

        if #AAS.ClientTable["ItemsTable"] == 0 and text then
            draw.DrawText(AAS.GetSentence("noItems"), "AAS:Font:02", w*0.39, h*0.4, AAS.Colors["white"], TEXT_ALIGN_CENTER)
        end

        if not info then return end 

        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["informations"])
        surface.DrawTexturedRect(AAS.ScrW*0.478, AAS.ScrH*0.585, AAS.ScrW*0.0866, AAS.ScrH*0.0225)

        draw.DrawText(AAS.LocalPlayer:Health(), "AAS:Font:02", AAS.ScrW*0.4831, AAS.ScrH*0.612, AAS.Colors["white"], TEXT_ALIGN_CENTER)
        draw.DrawText(AAS.LocalPlayer:Armor(), "AAS:Font:02", AAS.ScrW*0.521, AAS.ScrH*0.612, AAS.Colors["white"], TEXT_ALIGN_CENTER)
        draw.DrawText(AAS.LocalPlayer:GetMaxSpeed(), "AAS:Font:02", AAS.ScrW*0.559, AAS.ScrH*0.612, AAS.Colors["white"], TEXT_ALIGN_CENTER)
    end

    local closeButton = vgui.Create("DButton", accessoriesFrame)
    closeButton:SetSize(AAS.ScrW*0.011, AAS.ScrW*0.011)
    closeButton:SetPos(accessoriesFrame:GetWide()*0.97, AAS.ScrH*0.04/2-closeButton:GetTall()/2) 
    closeButton:SetText("")
    closeButton.Paint = function(self,w,h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["close"])
        surface.DrawTexturedRect( 0, 0, w, h )
    end  
    closeButton.DoClick = function()
        accessoriesFrame:Remove()
    end
end

function AAS.ItemMenu()
    AAS.ClientTable["filters"] = {["vip"] = true, ["new"] = true, ["search"] = ""}

    AAS.ClientTable["ItemSelected"] = nil

    AAS.BaseMenu(isstring(AAS.TitleMenu) and AAS.TitleMenu != "" and AAS.TitleMenu or AAS.GetSentence("welcomeText"), true, AAS.ScrW*0.1595, "house", true)
    AAS.ClientTable["Id"], LerpPos, AAS.ClientTable["ItemsVisible"] = 1, 0, AAS.ClientTable["ItemsTable"]
    
    playerModel = vgui.Create("AAS:DModel", accessoriesFrame)
    playerModel:SetFOV(25)
    
    local categoryList = vgui.Create("DScrollPanel", accessoriesFrame)
    categoryList:SetSize(AAS.ScrW*0.038, AAS.ScrH*0.5)
    categoryList:SetPos(0, AAS.ScrH*0.1)
    categoryList.Paint = function(self,w,h)
        draw.RoundedBox(0, 0, LerpPos, AAS.ScrW*0.038, AAS.ScrH*0.038, AAS.Colors["selectedBlue"])
        draw.RoundedBox(0, AAS.ScrW*0.038 - AAS.ScrW*0.0017, LerpPos, AAS.ScrW*0.002, AAS.ScrH*0.038, AAS.Colors["white200"])
    end

    local LerpTo = 0
    for k,v in ipairs(AAS.Category["mainMenu"]) do
        local categoryButton = vgui.Create("DButton", categoryList)
        categoryButton:SetSize(0, AAS.ScrH*0.038)
        categoryButton:Dock(TOP)
        categoryButton:SetText("")
        categoryButton:DockMargin(0,AAS.ScrH*v.margin,0,0)
        categoryButton.Paint = function(self,w,h)
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(v.material, "smooth")
            surface.DrawTexturedRect(0, 0, w, h)
            
            LerpPos = Lerp(FrameTime()*5, LerpPos, LerpTo)
        end 
        categoryButton.DoClick = function()
            AAS.ClientTable["Id"] = k

            local x,y = categoryButton:GetPos()
            LerpTo = y

            local categoryTable = AAS.Category["mainMenu"][AAS.ClientTable["Id"]]
            
            local itemsTable = {}
            for k,v in ipairs(AAS.ClientTable["ItemsTable"]) do
                if v.category != categoryTable["uniqueName"] then continue end
                itemsTable[#itemsTable + 1] = v
            end

            AAS.ClientTable["ItemsVisible"] = categoryTable["all"] and AAS.ClientTable["ItemsTable"] or itemsTable

            AAS.UpdateList(AAS.ClientTable["ItemsVisible"])
        end 
    end 

    local searchBar = vgui.Create("AAS:SearchBar", accessoriesFrame)
    searchBar:SetPos(accessoriesFrame:GetWide()*0.15, AAS.ScrH*0.055)

    local newButton = vgui.Create("AAS:Button", accessoriesFrame)
    newButton:SetPos(accessoriesFrame:GetWide()*0.47, AAS.ScrH*0.055)
    newButton:SetTheme(false)
    
    local vipButton = vgui.Create("AAS:Button", accessoriesFrame)
    vipButton:SetPos(accessoriesFrame:GetWide()*0.59, AAS.ScrH*0.055)
    vipButton:SetTheme(true)
    vipButton.DoClick = function()
        vipButton:ChangeStatut(true)

        AAS.UpdateList(AAS.ClientTable["ItemsVisible"])
    end 

    newButton.DoClick = function()
        newButton:ChangeStatut(true)

        AAS.UpdateList(AAS.ClientTable["ItemsVisible"])
    end 
    
    itemScroll = vgui.Create( "AAS:ScrollPanel", accessoriesFrame)
    itemScroll:SetSize(AAS.ScrW*0.384, AAS.ScrH*0.542)
    itemScroll:SetPos(AAS.ScrW*0.052, AAS.ScrH*0.1)

    itemContainer = vgui.Create("DIconLayout", itemScroll)
    itemContainer:SetSize(AAS.ScrW*0.384, AAS.ScrH*0.542)
    itemContainer:SetSpaceX(AAS.ScrW*0.016) 
    itemContainer:SetSpaceY(AAS.ScrW*0.016)
    
    for k,v in ipairs(AAS.ClientTable["ItemsTable"]) do
        if not v.options.activate then continue end

        local itemBackground = vgui.Create("AAS:Cards", itemContainer)
        itemBackground:DockMargin(AAS.ScrW*0.016,0,0,0)  
        itemBackground:AddItemView(itemScroll, accessoriesFrame, itemContainer, v)
        itemBackground:RemoveButton()
        itemBackground.buttonHover.Think = function(self)
            if self:IsHovered() then
                playerModel:SetDrawAccessories(v.uniqueId)
            else
                playerModel:RemoveDrawAccessories(v.uniqueId)
            end
        end
    end

    local admin = AAS.AdminRank[AAS.LocalPlayer:GetUserGroup()]

    local inventoryButton = vgui.Create("DButton", accessoriesFrame)
    inventoryButton:SetSize(AAS.ScrH*0.0277, AAS.ScrH*0.0277)
    inventoryButton:SetPos(AAS.ScrW*0.0384/2 - AAS.ScrH*0.0277/2, accessoriesFrame:GetTall()*(admin and 0.85 or 0.92))
    inventoryButton:SetText("")
    inventoryButton.Paint = function(self,w,h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["avatar"])
        surface.DrawTexturedRect( 0, 0, w, h )
    end  
    inventoryButton.DoClick = function()
        AAS.InventoryMenu()
    end 

    if admin then
        local settingsButton = vgui.Create("DButton", accessoriesFrame)
        settingsButton:SetSize(AAS.ScrH*0.0277, AAS.ScrH*0.0277)
        settingsButton:SetPos(AAS.ScrW*0.0384/2 - AAS.ScrH*0.0277/2, accessoriesFrame:GetTall()*0.92)
        settingsButton:SetText("")
        settingsButton.Paint = function(self,w,h)
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(AAS.Materials["settings"])
            surface.DrawTexturedRect( 0, 0, w, h )
        end  
        settingsButton.DoClick = function()
            AAS.AdminSetting()
        end
    end
end

function AAS.PopupMenu(uniqueId, sell, price)
    local linearGradient = {
        {offset = 0, color = AAS.Gradient["upColor"]},
        {offset = 0.4, color = AAS.Gradient["midleColor"]},
        {offset = 1, color = AAS.Gradient["downColor"]},
    }

    if IsValid(popupFrame) then return end
    popupFrame = vgui.Create("DPanel", accessoriesFrame)
    popupFrame:SetSize(AAS.ScrW*0.19, AAS.ScrH*0.16)
    popupFrame:Center()
    popupFrame.startTime = SysTime()
    popupFrame:SetAlpha(0)
    popupFrame:AlphaTo( 255, 0.3, 0 )
    popupFrame.Paint = function(self,w,h)
        Derma_DrawBackgroundBlur(self, self.startTime)
        local x, y = popupFrame:GetPos()

        draw.RoundedBoxEx(8, 0, AAS.ScrH*0.047, w, h-AAS.ScrH*0.047, AAS.Colors["black18"], false, false, true, true)
        
        draw.RoundedBoxEx(8, 0, 0, w, AAS.ScrH*0.047, AAS.Colors["background"], true, true, false, false)
        draw.RoundedBox(6, 0, AAS.ScrH*0.045, w, AAS.ScrH*0.005, AAS.Colors["black150"])

        draw.SimpleText(sell and AAS.GetSentence("sellaccessory") or AAS.GetSentence("buyaccessory"), "AAS:Font:06", w*0.174, AAS.ScrH*0.021, AAS.Colors["white"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(AAS.GetSentence("sure"), "AAS:Font:07", w/2, h*0.465, AAS.Colors["white"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["market"])
        surface.DrawTexturedRect(w*0.05, AAS.ScrH*0.0105, (AAS.Materials["market"]:Width()*AAS.ScrW/1920)*0.85, (AAS.Materials["market"]:Height()*AAS.ScrH/1080)*0.85)
    end

    local lerpFirstButton = 255
    local payButton = vgui.Create("DButton", popupFrame)
    payButton:SetSize(AAS.ScrW*0.09, AAS.ScrH*0.042)
    payButton:SetPos(AAS.ScrW*0.005, AAS.ScrH*0.105)
    payButton:SetFont("AAS:Font:02")
    payButton:SetText((sell and string.upper(AAS.GetSentence("sell")) or string.upper(AAS.GetSentence("buy"))).." "..AAS.formatMoney(sell and (price*AAS.SellValue/100) or price))
    payButton:SetTextColor(AAS.Colors["white"])
    payButton.Paint = function(self,w,h)
        lerpFirstButton = Lerp(FrameTime()*10, lerpFirstButton, self:IsHovered() and 255 or 100)

        draw.RoundedBox(8, 0, 0, w, h,  ColorAlpha(AAS.Colors["blue75"], lerpFirstButton))
    end
    payButton.DoClick = function()
        net.Start("AAS:Inventory")
            net.WriteUInt((sell and 2 or 1), 5)
            net.WriteUInt(uniqueId, 32)
        net.SendToServer()
    end

    local lerpSecondButton = 255
    local cancelButton = vgui.Create("DButton", popupFrame)
    cancelButton:SetSize(AAS.ScrW*0.09, AAS.ScrH*0.042)
    cancelButton:SetPos(AAS.ScrW*0.097, AAS.ScrH*0.105)
    cancelButton:SetFont("AAS:Font:02")
    cancelButton:SetText(string.upper(AAS.GetSentence("cancel")))
    cancelButton:SetTextColor(AAS.Colors["white"])
    cancelButton.Paint = function(self,w,h)
        lerpSecondButton = Lerp(FrameTime()*10, lerpSecondButton, self:IsHovered() and 255 or 100)

        draw.RoundedBox(8, 0, 0, w, h,  ColorAlpha(AAS.Colors["red49"], lerpSecondButton))
    end
    cancelButton.DoClick = function()
        popupFrame:AlphaTo( 0, 0.3, 0, function()
            popupFrame:Remove()
        end)
    end 
end

/* 76561198442896689 */
hook.Add("HUDPaint", "AAS:HUDPaint:Initialize", function()
    AAS.LoadFonts(resizeFontByLanguage())
    AAS.LocalPlayer = LocalPlayer()
    hook.Remove("HUDPaint", "AAS:HUDPaint:Initialize")
end)

hook.Add("HUDShouldDraw", "AAS:HUDShouldDraw:Settings", function()
    if IsValid(mainPanel) then return false end 
end)

hook.Add( "PostPlayerDraw" , "AAS:PostPlayerDraw", function(ply)
    if IsValid(mainPanel) or IsValid(playerSettingsPanel) and AAS.LocalPlayer == ply then return end
    if not istable(AAS.ClientTable["ItemsEquiped"]) or not istable(AAS.ClientTable["ItemsEquiped"][ply:SteamID64()]) then return end
    if AAS.BlackListJobAccessory[team.GetName(ply:Team())] then return end

    for k,v in pairs(AAS.ClientTable["ItemsEquiped"][ply:SteamID64()]) do
        if not IsValid(v) or not isnumber(v.uniqueId) then continue end

        local itemTable = AAS.GetTableById(v.uniqueId)
        if not istable(itemTable) or table.Count(itemTable) == 0 then continue end

        if istable(itemTable.job) and table.Count(itemTable.job) > 0 and not itemTable.job[team.GetName(ply:Team())] then continue end
        if not istable(itemTable.options) or not isstring(itemTable.options.bone) then continue end
    
        local boneid = ply:LookupBone(itemTable.options.bone)
        if not boneid then
            continue
        end
        
        local matrix = ply:GetBoneMatrix(boneid)
        if not matrix then 
            continue
        end
        
        if not isvector(itemTable.pos) or not isangle(itemTable.ang) then continue end
        if not isstring(itemTable.model) or not isvector(itemTable.scale) or not istable(itemTable.options) then continue end
        
        local offsetPos = (istable(v.offset) and isvector(v.offset["pos"]) and AAS.ModifyOffset) and v.offset["pos"] or Vector(0,0,0)
        local offsetAng = (istable(v.offset) and isangle(v.offset["ang"]) and AAS.ModifyOffset) and v.offset["ang"] or Angle(0,0,0)
        local offsetScale = (istable(v.offset) and isvector(v.offset["scale"]) and AAS.ModifyOffset) and v.offset["scale"] or Vector(0,0,0)
        
        local newpos = AAS.ConvertVector(matrix:GetTranslation(), itemTable.pos + offsetPos, matrix:GetAngles())
        local newang = AAS.ConvertAngle(matrix:GetAngles(), itemTable.ang + offsetAng)
        
        v:SetPos(newpos)
        v:SetAngles(newang)
        v:SetModel(itemTable.model)
        v.model = itemTable.model

        local mat = Matrix()
        mat:Scale(itemTable.scale + (offsetScale / 50))
        v:EnableMatrix("RenderMultiply", mat)

        local skin = tonumber(itemTable.options.skin)
        if isnumber(skin) then
            v:SetSkin(skin)
        end

        local color = itemTable.options.color
        render.SetColorModulation(color.r/255, color.g/255, color.b/255, color.a/255)
        v:SetupBones()
        v:DrawModel()
    end
end)

local shCategoryToAAS = {
    ["head"] = AAS.Category["mainMenu"][2]["uniqueName"],
    ["eyes"] = AAS.Category["mainMenu"][3]["uniqueName"],
    ["mouth"] = AAS.Category["mainMenu"][5]["uniqueName"],
    ["neck"] = AAS.Category["mainMenu"][4]["uniqueName"],
    ["back"] = AAS.Category["mainMenu"][6]["uniqueName"],
}

local function getCategory(slot)
    if not SH_ACC then return end

    local category = "Hat"
    for k,v in ipairs(SH_ACC.ShopCategories) do
        if v.slot != slot or not isstring(shCategoryToAAS[v.text]) then continue end

        category = shCategoryToAAS[v.text]
    end

    return category
end

function AAS.SHToAAS()
    if not SH_ACC then return end

    local SendTable = {}
    for k,v in pairs(SH_ACC.List) do
        local offset = SH_ACC.Offsets[v.mdl]
        if not istable(offset) then continue end

        local AASTable = {
            ["name"] = v.name,
            ["price"] = v.price,
            ["model"] = v.mdl,
            ["price"] = v.price,
            ["pos"] = offset["default"]["pos"],
            ["ang"] = Angle(offset["default"]["ang"][2], offset["default"]["ang"][1], offset["default"]["ang"][3]),
            ["scale"] = Vector(v.scale, v.scale, v.scale),
            ["job"] = v.jobs,
            ["category"] = getCategory(v.slots),
            ["options"] = {
                ["iconPos"] = Vector(0,0,0),
                ["new"] = true,
                ["bone"] = offset["default"]["bone"],
                ["skin"] = v.skin,
                ["color"] = v.color,
                ["vip"] = false,
                ["iconFov"] = 0,
                ["usergroups"] = v.usergroups,
                ["activate"] = 1,
            }
        }
        SendTable[#SendTable + 1] = AASTable
    end

    local CompressTbl = AAS.CompressTable(SendTable)
    net.Start("AAS:Main")
        net.WriteUInt(4, 5)
        net.WriteUInt(#CompressTbl, 32)
        net.WriteData(CompressTbl, #CompressTbl)
    net.SendToServer()
end

concommand.Add("aas_sh_item_to_aas", function(ply, cmd, args)
    if not AAS.AdminRank[LocalPlayer():GetUserGroup()] then return end
    AAS.SHToAAS()
end)
--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_button.lua:
local PANEL = {}

function PANEL:Init()
    self:SetText("")
    self:SetFont("AAS:Font:01")
    self:SetSize(AAS.ScrW*0.075, AAS.ScrH*0.029)
    self:SetTextColor(AAS.Colors["white"])
    self.AASTheme = true
    self.activateButton = true 
    self.lerpCircle = self:GetWide()*0.63
    self.lerpColor = self.AASTheme and AAS.Colors["yellow"] or AAS.Colors["darkBlue"]
end

function PANEL:SetTheme(bool)
    self.AASTheme = bool
end 

function PANEL:ChangeStatut(bool)
    self.activateButton = !self.activateButton
    if bool then self:ChangeFilter() end
end 

function PANEL:ChangeFilter()
    AAS.ClientTable["filters"][self.AASTheme and "vip" or "new"] = self.activateButton
end

function PANEL:GetStatut()
    return (self.activateButton or false)
end 

function PANEL:Paint(w, h)
    self.lerpCircle = Lerp(FrameTime()*10, self.lerpCircle, self.activateButton and w*0.63 or w*0.45 )

    local textColor = self.activateButton and (self.AASTheme and AAS.Colors["yellow"] or AAS.Colors["darkBlue"]) or AAS.Colors["grey"]
    draw.SimpleText(self.AASTheme and "VIP" or "NEW", "AAS:Font:04", self.AASTheme and w*0.09 or 0, h/2, textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    surface.SetDrawColor(AAS.Colors["white"])
	surface.SetMaterial(AAS.Materials[self.activateButton and (self.AASTheme and "vipButton" or "newButton") or "inactive"])
	surface.DrawTexturedRect(w*0.41, 0, w*0.4, h*0.9)

    surface.SetDrawColor(AAS.Colors["white"])
	surface.SetMaterial(AAS.Materials["circle"])

    local height = AAS.Materials["circle"]:Height()*AAS.ScrH/1080
	surface.DrawTexturedRect(self.lerpCircle, h*0.09, AAS.Materials["circle"]:Width()*AAS.ScrW/1920, height)
end

derma.DefineControl("AAS:Button", "AAS Button", PANEL, "DButton")
--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_textentry.lua:
local PANEL = {}

function PANEL:Init()
    self:SetText("Edit Text")
    self:SetFont("AAS:Font:03")
    self:SetSize(AAS.ScrW*0.175, AAS.ScrH*0.03)
    self:SetTextColor(AAS.Colors["white"])
    self:SetDrawLanguageID(false)

    self.Icon = nil 
end

function PANEL:SetIcon(mat)
    self.Icon = mat
end 

function PANEL:SetHoldText(text)
    self.AASBaseText = text
    self:SetText(self.AASBaseText)
end 

function PANEL:Paint(w, h)
    draw.RoundedBox(4, 0, 0, w, h, AAS.Colors["black18"])

    self:DrawTextEntryText(AAS.Colors["white"], AAS.Colors["selectedBlue"], AAS.Colors["white"])

    if self.Icon != nil then
        local sizeY = self.Icon:Height()*AAS.ScrH/1080
        
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(self.Icon, "smooth")
        surface.DrawTexturedRect(w*0.78, h/2 - sizeY/2, self.Icon:Width()*AAS.ScrW/1920, sizeY)
    end 
end

function PANEL:OnGetFocus()
    if self:GetValue() == self.AASBaseText then
        self:SetText("") 
    end 
end 

function PANEL:OnLoseFocus()
    if self:GetValue() == "" then
        self:SetText(self.AASBaseText)
    end
end 

derma.DefineControl("AAS:TextEntry", "AAS TextEntry", PANEL, "DTextEntry")

--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_dmodel.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize(AAS.ScrW*0.158, AAS.ScrH*0.525)
    self:SetPos(AAS.ScrW*0.441, AAS.ScrH*0.052) 
    self:SetModel(AAS.LocalPlayer:GetModel())
    self:SetFOV(23)

    for k,v in pairs(AAS.LocalPlayer:GetBodyGroups()) do
        self.Entity:SetBodygroup(k, AAS.LocalPlayer:GetBodygroup(k))
    end
    self.Entity:SetSkin(AAS.LocalPlayer:GetSkin())

    if not isnumber(self.Entity:LookupBone("ValveBiped.Bip01_Head1")) then return end
    local modelEye = self.Entity:GetBonePosition(self.Entity:LookupBone("ValveBiped.Bip01_Head1"))
    modelEye:Add(Vector(0, 0, -25))
    self:SetLookAt(modelEye)
    self:SetCamPos(modelEye-Vector(-100, 0, 0))
    self.Entity:SetAngles(Angle(0, -20, 0))
    self.AASZoom = true

    self:DrawAccessories()
    self.DrawUniqueId = nil
    self.DrawModelAccessories = true
    self.Lerp = 0

    self.Entity:SetColor(Color(255,0,0,0))
end

function PANEL:Zoom()
    self.AASZoom = !self.AASZoom
end

local startFov, startAng, StartPosX
function PANEL:Think()
    if not self:IsHovered() and not isnumber(startFov) and not isnumber(startAng) then return end

    local CurX, CurY = self:ScreenToLocal(gui.MouseX(), gui.MouseY())
    
    if input.IsMouseDown(MOUSE_RIGHT) then
        if not self.AASZoom then return end
        if not isnumber(startFov) then startFov = CurY end
        
        local newFov = self:GetFOV() - (((startFov - CurY)/self:GetTall())*1.5)
        if newFov >= 10 and newFov <= 30 then
            self:SetFOV(newFov)
        end
    else
        startFov = nil
    end

    if input.IsMouseDown(MOUSE_LEFT) then 
        if not isnumber(startAng) then startAng = CurX end
        
        local newAng = self.Entity:GetAngles().yaw - (((startAng - CurX)/self:GetWide())*2)
        
        self.Entity:SetAngles(Angle(0, newAng, 0))
    else
        startAng = nil
    end
end

function PANEL:LayoutEntity()
    return
end

function PANEL:RemoveDrawAccessories(uniqueId)
    if self.DrawUniqueId != uniqueId then return end

    local itemTable = AAS.GetTableById(uniqueId)
    local cat = itemTable.category

    if IsValid(self.Accessories[cat]) then 
        self.Accessories[cat]:Remove() 
        self.Accessories[cat] = nil
        self.DrawUniqueId = nil
        self:DrawAccessories()
    end
end

function PANEL:SetDrawAccessories(uniqueId)
    if isnumber(self.DrawUniqueId) and self.DrawUniqueId == uniqueId then return end
    
    local itemTable = AAS.GetTableById(uniqueId)
    local cat = itemTable.category
    
    self:createAccessory(itemTable)
    self.DrawUniqueId = uniqueId
end

function PANEL:SetDrawModelAccessories(bool)
    self.DrawModelAccessories = bool
end

function PANEL:UpdateAccessoryPosition(itemTable, ent)
    local boneName = isstring(itemTable.options.bone) and itemTable.options.bone or "ValveBiped.Bip01_Head1"

    if not isnumber(self.Entity:LookupBone(boneName)) then return end
    local matrix = self.Entity:GetBoneMatrix(self.Entity:LookupBone(boneName))
    local pos = matrix:GetTranslation()
    local ang = matrix:GetAngles()

    local tbl = AAS.ClientTable["offsetItems"] or {}
    local offsetTable = tbl[tostring(itemTable.uniqueId)] or {}

    local offsetPos = (isvector(offsetTable["pos"]) and AAS.ModifyOffset) and offsetTable["pos"] or Vector(0,0,0)
    local offsetAng = (isangle(offsetTable["ang"]) and AAS.ModifyOffset) and offsetTable["ang"] or Angle(0,0,0)
    local offsetScale = (isvector(offsetTable["scale"]) and AAS.ModifyOffset) and offsetTable["scale"] or Vector(0,0,0)
    
    pos = AAS.ConvertVector(pos, (itemTable.pos + offsetPos), ang)
    ang = AAS.ConvertAngle(ang, (itemTable.ang + offsetAng))

    if isvector(itemTable.scale) then
        local mat = Matrix()
        mat:Scale(itemTable.scale + offsetScale/50)
        ent:EnableMatrix("RenderMultiply", mat)
    end
    
    ent:SetPos(pos)
    ent:SetAngles(ang)
    ent:SetRenderMode(RENDERMODE_GLOW)
    ent.AASTable = itemTable

    local skin = tonumber(itemTable.options.skin)
    if isnumber(skin) then
        ent:SetSkin(skin)
    end

    local color = itemTable.options.color
    if istable(color) then
        ent:SetColor(color)
    end
end

function PANEL:createAccessory(itemTable)
    local cat = itemTable.category
    if not isstring(cat) then return end
    if not istable(self.Accessories) then self.Accessories = {} end

    if IsValid(self.Accessories[cat]) then self.Accessories[cat]:Remove() else self.Accessories[cat] = nil end
    self.Accessories[cat] = ClientsideModel(itemTable.model)
    self.Accessories[cat]:SetNoDraw(true)
    self.Accessories[cat]:SetIK(false)
    self.Accessories[cat]:SetParent(self.Entity)
    self.Accessories[cat]:SetRenderMode(RENDERMODE_TRANSCOLOR)

    self:UpdateAccessoryPosition(itemTable, self.Accessories[cat])

    timer.Create("aas_refresh_accessories:"..cat, 0, 0, function()
        if istable(self.Accessories) and not IsValid(self.Accessories[cat]) or not IsValid(self.Entity) then timer.Remove("aas_refresh_accessories:"..cat) return end
        
        self:UpdateAccessoryPosition(itemTable, self.Accessories[cat])
    end)
end

function PANEL:DrawAccessories(category)
    if not istable(self.Accessories) then self.Accessories = {} end
    if not istable(AAS.ClientTable["ItemsEquiped"]) or not istable(AAS.ClientTable["ItemsEquiped"][AAS.LocalPlayer:SteamID64()]) then return end

    if isstring(category) and IsValid(self.Accessories[category]) then self.Accessories[category]:Remove() end

    for k,v in pairs(AAS.ClientTable["ItemsEquiped"][AAS.LocalPlayer:SteamID64()]) do
        local itemTable = AAS.GetTableById(v.uniqueId)

        self:createAccessory(itemTable)
    end
end

function PANEL:DoClick()
    StartAng = self.Entity:GetAngles().yaw
end

--[[ This is the DrawModel of the DModel made my gmod I ovveride it for draw my accessories]]
function PANEL:DrawModel()
	local curparent = self
	local leftx, topy = self:LocalToScreen( 0, 0 )
	local rightx, bottomy = self:LocalToScreen( self:GetWide(), self:GetTall() )
    
	while ( curparent:GetParent() != nil ) do
		curparent = curparent:GetParent()

		local x1, y1 = curparent:LocalToScreen( 0, 0 )
		local x2, y2 = curparent:LocalToScreen( curparent:GetWide(), curparent:GetTall() )

		leftx = math.max( leftx, x1 )
		topy = math.max( topy, y1 )
		rightx = math.min( rightx, x2 )
		bottomy = math.min( bottomy, y2 )
		previous = curparent
	end

	render.SetScissorRect( leftx, topy, rightx, bottomy, true )

	local ret = self:PreDrawModel( self.Entity )
	if ( ret != false ) then
		self.Entity:DrawModel()
        
        if self.DrawModelAccessories then
            for k,v in pairs(self.Accessories) do
                local itemTable = v.AASTable
                if not istable(itemTable) or not istable(itemTable.options) or not isstring(itemTable.options.bone) then continue end

                if self.DrawUniqueId != nil and self.DrawUniqueId != itemTable.uniqueId then continue end

                local color = itemTable["options"]["color"] or v:GetColor()
                render.SetColorModulation(color.r / 255, color.g / 255, color.b / 255)

                v:DrawModel()
            end
        end
		self:PostDrawModel(self.Entity)
	end

	render.SetScissorRect(0, 0, 0, 0, false)
end

function PANEL:Paint( w, h )
    if ( !IsValid( self.Entity ) ) then return end
    local x, y = self:LocalToScreen( 0, 0 )

    self:LayoutEntity( self.Entity )

    local ang = self.aLookAngle
    if ( !ang ) then
        ang = ( self.vLookatPos - self.vCamPos ):Angle()
    end

    cam.Start3D( self.vCamPos, ang, self.fFOV, x, y, w, h, 5, self.FarZ )

    if self.DrawModelAccessories then
        for k,v in pairs(self.Accessories) do
            if not istable(v.AASTable) then continue end
            if self.DrawUniqueId != nil and self.DrawUniqueId != v.AASTable.uniqueId then continue end

            if istable(v.AASTable.job) and not v.AASTable.job[team.GetName(AAS.LocalPlayer:Team())] then continue end

            local color = v.AASTable["options"]["color"] or v:GetColor()
            render.SetColorModulation(color.r / 255, color.g / 255, color.b / 255)
            v:DrawModel()
        end
    end

    render.SuppressEngineLighting( true )
    render.SetLightingOrigin( self.Entity:GetPos() )
    render.ResetModelLighting( self.colAmbientLight.r / 255, self.colAmbientLight.g / 255, self.colAmbientLight.b / 255 )
    render.SetColorModulation( self.colColor.r / 255, self.colColor.g / 255, self.colColor.b / 255 )
    render.SetBlend( ( self:GetAlpha() / 255 ) * ( self.colColor.a / 255 ) )

    for i = 0, 6 do
        local col = self.DirectionalLight[ i ]
        if ( col ) then
            render.SetModelLighting( i, col.r / 255, col.g / 255, col.b / 255 )
        end
    end

    self:DrawModel()

    render.SuppressEngineLighting( false )
    cam.End3D()

    self.LastPaint = RealTime()
end

function PANEL:OnRemove()
    if not istable(self.Accessories) then return end
    for k,v in pairs(self.Accessories) do
        if IsValid(v) then v:Remove() end
    end
end

derma.DefineControl("AAS:DModel", "AAS DModel", PANEL, "DModelPanel")
--PATH addons/sl_utils/lua/autorun/animation_swep_thinker.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

AddCSLuaFile()

AnimationSWEP = {}

if CLIENT then
    AnimationSWEP.GestureAngles = {}

    local function applyAnimation(ply, targetValue, class)
        if not IsValid(ply) then return end
        if ply.animationSWEPAngle ~= targetValue then
            ply.animationSWEPAngle = Lerp(FrameTime() * 5, ply.animationSWEPAngle, targetValue)
        end

        local oldanimationclass = ply:GetNWString("oldanimationClass")
        if oldanimationclass ~= class and AnimationSWEP.GestureAngles[oldanimationclass] then
        	for boneName, angle in pairs(AnimationSWEP.GestureAngles[oldanimationclass]) do
            local bone = ply:LookupBone(boneName)

            if bone then
                ply:ManipulateBoneAngles( bone, angle * 0)
            end
       		end
        end

       	ply:SetNWString("oldanimationClass",class)

       if AnimationSWEP.GestureAngles[class] then
        for boneName, angle in pairs(AnimationSWEP.GestureAngles[class]) do
            local bone = ply:LookupBone(boneName)

            if bone then
                ply:ManipulateBoneAngles( bone, angle * ply.animationSWEPAngle)
            end
        end
   		end

        if math.Round(ply.animationSWEPAngle, 2) == targetValue and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() ~= class then
            ply:SetNWString("animationClass", "")
        end
    end

    hook.Add("Think", "AnimationSWEP.Think", function ()
       	for _, ply in pairs( player.GetHumans() ) do
            local animationClass = ply:GetNWString("animationClass")

            if animationClass ~= "" then
                if not ply.animationSWEPAngle then
                    ply.animationSWEPAngle = 0
                end

                if ply:GetNWBool("animationStatus") then
                    applyAnimation(ply, 1, animationClass)
                else
                    applyAnimation(ply, 0, animationClass)
                end
            end

    		
    	end
	end)
else

	local function VelocityIsHigher(ply, value)
		local x, y, z = math.abs(ply:GetVelocity().x), math.abs(ply:GetVelocity().y), math.abs(ply:GetVelocity().z)
		if x > value or y > value or z > value then
			return true
		else
			return false
		end
	end

    hook.Add("SetupMove", "AnimationSWEP.SetupMove", function(ply, moveData, cmd)
        if ply:GetNWBool("animationStatus") then
        	local deactivateOnMove = ply:GetNWInt("deactivateOnMove", 5)
        	
	            if VelocityIsHigher(ply, deactivateOnMove) then
	                AnimationSWEP:Toggle(ply, false)
	            end

	            if ply:KeyDown(IN_DUCK) then
	                AnimationSWEP:Toggle(ply, false)
	            end

	            if ply:KeyDown(IN_USE) then
	                AnimationSWEP:Toggle(ply, false)
	            end

	            if ply:KeyDown(IN_JUMP) then
	                AnimationSWEP:Toggle(ply, false)
	            end
        end
    end)

    function AnimationSWEP:Toggle(ply, crossing, class, deactivateOnMove)
        if crossing then
            ply:SetNWBool("animationStatus", true)
            
            if class then
                ply:SetNWString("animationClass", class)
            end
            
            ply:SetNWInt("deactivateOnMove", deactivateOnMove)
        else
            ply:SetNWBool("animationStatus", false)
            ply:SetNWInt("deactivateOnMove", 5)
        end
    end
end
--PATH addons/sl_aphone/lua/aphone/apps/contacts/cl_contacts.lua:
-- Load/Variables
sql.Query("CREATE TABLE IF NOT EXISTS aphone_Contacts(id INTEGER, name TEXT, ip TEXT)")
aphone.Contacts = aphone.Contacts or {}
local c = {}

for k, v in ipairs(sql.Query("SELECT id, name FROM aphone_Contacts WHERE ip = " .. sql.SQLStr(game.GetIPAddress())) or {}) do
    c[tonumber(v.id)] = v.name
end

-- Functions
function aphone.Contacts.GetName(userid)
    return c[userid]
end

function aphone.GetName(e)
    local n = aphone.Contacts.GetName(e)
    if n then return n end

    local is_ply = IsValid(e) and e:IsPlayer()

    if is_ply then
        return aphone.never_realname and e:aphone_GetNumber() or e:Nick()
    end

    return aphone.GetNumber(is_ply and e:aphone_GetID() or e)
end

function aphone.Contacts.Add(id, name)
    if c[id] then return true end
    sql.Query("INSERT INTO aphone_Contacts(id, name, ip) VALUES(" .. id .. ", " .. sql.SQLStr(name) .. "," .. sql.SQLStr(game.GetIPAddress()) .. ")")
    c[id] = name
end

function aphone.Contacts.ChangeName(id, name)
    if not c[id] then return end
    sql.Query("UPDATE aphone_Contacts SET name = " .. sql.SQLStr(name) .. " WHERE ip = " .. sql.SQLStr(game.GetIPAddress()) .. " AND id = " .. id)
    c[id] = name
end

function aphone.Contacts.Remove(id)
    if not c[id] then return end
    sql.Query("DELETE FROM aphone_Contacts WHERE id = " .. id .. " AND ip = " .. sql.SQLStr(game.GetIPAddress()) .. ")")
    c[id] = nil
end

function aphone.Contacts.GetContacts()
    return c
end
--PATH addons/sl_aphone/lua/aphone/apps/messages/cl_messages.lua:
sql.Query( "CREATE TABLE IF NOT EXISTS aphone_Messages(user INTEGER, body TEXT, ip TEXT, local_sender INTEGER, timestamp INTEGER)")
sql.Query( "CREATE TABLE IF NOT EXISTS aphone_Friends(user INTEGER, body TEXT, ip TEXT, local_sender INTEGER, timestamp INTEGER, last_name TEXT, likes INTEGER DEFAULT 0, id INTEGER DEFAULT 0, local_vote INTEGER DEFAULT 0)")

aphone.Messages = aphone.Messages or {}

local function cache_message(userid, body, local_sender, timestamp, is_friends, msg_id)
	timestamp = timestamp or os.time()
	if !is_friends then
		sql.Query("INSERT INTO aphone_Messages(user, body, ip, local_sender, timestamp) VALUES(" .. userid .. ", " .. sql.SQLStr(body) .. "," .. sql.SQLStr(game.GetIPAddress()) .. "," .. (local_sender and 1 or 0) .. "," .. timestamp .. ")")
	else
		sql.Query("INSERT INTO aphone_Friends(user, body, ip, local_sender, timestamp, last_name, id) VALUES(" .. userid .. ", " .. sql.SQLStr(body) .. ", " .. sql.SQLStr(game.GetIPAddress()) .. ", " .. (userid == LocalPlayer():aphone_GetID() and 1 or 0) .. ", " .. timestamp .. ", '" .. is_friends .. "'," .. msg_id .. ")")
	end
end

function aphone.Contacts.Send(userid, body, is_friends)
	net.Start("aphone_NewMessage")
		net.WriteBool(is_friends)

		if !is_friends then
			net.WriteUInt(userid, 32)
		end

		net.WriteString(body)
	net.SendToServer()

	if !is_friends then
		cache_message(userid, body, true, os.time())
	end
end

net.Receive("aphone_CacheClientMessages", function()
	local loop_value = net.ReadUInt(16)
	local is_friends = net.ReadBool()
	local ply_id = LocalPlayer():aphone_GetID()

	for i = 1, loop_value do
		local user1 = net.ReadUInt(24)
		local user2 = !is_friends and net.ReadUInt(24) or nil
		local body = net.ReadString()
		local timestamp = net.ReadUInt(32)

		if is_friends then
			local name = net.ReadString()
			cache_message(user1, body, user1 == ply_id, timestamp, name, net.ReadUInt(32))
		else
			cache_message(user1 != ply_id and user1 or user2, body, user1 == ply_id, timestamp)
		end
	end
end)

net.Receive("aphone_CacheLikes", function()
	local loop_value = net.ReadUInt(16)

	for i = 1, loop_value do
		local q = "UPDATE aphone_Friends SET likes = " .. net.ReadUInt(32) .. " WHERE id = " .. net.ReadUInt(32)
		sql.Query(q)
	end
end)

net.Receive("aphone_SyncOneMessage", function()
	local uid = net.ReadEntity()
	local body = net.ReadString()
	local is_friends = net.ReadBool()

	if !is_friends then
		if !aphone:GetParameters("Core", "SilentMode", false) and IsValid(LocalPlayer()) and LocalPlayer():HasWeapon("aphone") then
			aphone.playringtone()
		end

		if aphone.InsertNewMessage then
			aphone.InsertNewMessage(uid, body)
		end

		cache_message(uid:aphone_GetID(), body, false)
	else
		local time = net.ReadUInt(32)
		local msg_id = net.ReadUInt(32)
		cache_message(uid:aphone_GetID(), body, false, time, uid:GetName(), msg_id)

		if aphone.InsertNewMessage_Friend then
			aphone.InsertNewMessage_Friend(uid:aphone_GetID(), body, msg_id, uid:GetName(), 0, 0)
		end
	end
end)

local red = Color(255, 82, 82)
net.Receive("aphone_AddLike", function()
	local b = net.ReadBool()
	local id = net.ReadUInt(29)
	local user = net.ReadUInt(24)
	local local_vote = (user == LocalPlayer():aphone_GetID())
	local q

	if local_vote then
		q = "UPDATE aphone_Friends SET likes = likes " .. (b and "+ 1" or "- 1") .. ", local_vote = " .. (b and 1 or 0 ) .. " WHERE id = " .. id
	else
		q = "UPDATE aphone_Friends SET likes = likes " .. (b and "+ 1" or "- 1") .. " WHERE id = " .. id
	end

	sql.Query(q)

	if aphone.Friends_PanelList and aphone.Friends_PanelList[id] and IsValid(aphone.Friends_PanelList[id]) then
		local pnl = aphone.Friends_PanelList[id].like_count
		pnl:SetText(tonumber(pnl:GetText()) + (b and 1 or -1))

		if local_vote then
			local like_logo = aphone.Friends_PanelList[id].like_logo
			like_logo:SetTextColor(!b and aphone:Color("Black1") or red)
		end
	end
end)
--PATH addons/sh_reports/lua/reports/sh_main.lua:
function SH_REPORTS:GetMidnight(offset)
	return os.time() - tonumber(os.date("%H")) * 3600 - tonumber(os.date("%M")) * 60 - tonumber(os.date("%S")) + 86400 * (offset or /* 76561199385207507 */ 0)
end

-- fresh from NEP
local d = {
	[86400 * 31] = "mo",
	[86400 * 7] = "w",
	[86400] = "d",
	[3600] = "h",
	[60] = "min",
	[1] = "s",
}
local c2 = {}
function SH_REPORTS:FullFormatTime(i)
	if (c2[i]) then
		return c2[i]
	end

	local f = i
	local t = {}
	for ti, s in SortedPairs(d, true) do
		local f = math.floor(i / ti)
		if (f > 0) then
			table.insert(t, f .. s)
			i = i - f * ti
		end
	end
	
	t = table.concat(t, " ")
	c2[f] = t

	return t
end

function SH_REPORTS:IsAdmin(ply)
	return self.Usergroups[ply:GetUserGroup()] ~= nil
end

-- SERVER -> CLIENT
easynet.Start("SH_REPORTS.SendList")
	easynet.Add("server_time", EASYNET_UINT32)
	easynet.Add("struct_reports", EASYNET_STRUCTURES)
easynet.Register()

easynet.Start("SH_REPORTS.Notify")
	easynet.Add("msg", EASYNET_STRING)
	easynet.Add("positive", EASYNET_BOOL)
easynet.Register()

easynet.Start("SH_REPORTS.Chat")
	easynet.Add("msg", EASYNET_STRING)
easynet.Register()

easynet.Start("SH_REPORTS.ReportCreated")
	easynet.Add("id", EASYNET_UINT32)
	easynet.Add("reporter_id", EASYNET_STRING)
	easynet.Add("reporter_name", EASYNET_STRING)
	easynet.Add("reported_id", EASYNET_STRING)
	easynet.Add("reported_name", EASYNET_STRING)
	easynet.Add("reason_id", EASYNET_UINT8)
	easynet.Add("comment", EASYNET_STRING)
	easynet.Add("time", EASYNET_UINT32)
	easynet.Add("admin_id", EASYNET_STRING)
easynet.Register()

easynet.Start("SH_REPORTS.ReportClaimed")
	easynet.Add("report_id", EASYNET_UINT8)
	easynet.Add("admin_id", EASYNET_STRING)
easynet.Register()

easynet.Start("SH_REPORTS.ReportClosed")
	easynet.Add("report_id", EASYNET_UINT8)
easynet.Register()

easynet.Start("SH_REPORTS.QuickReport")
	easynet.Add("comment", EASYNET_STRING)
	easynet.Add("lastkiller", EASYNET_PLAYER)
	easynet.Add("lastarrester", EASYNET_PLAYER)
easynet.Register()

easynet.Start("SH_REPORTS.MinimizeReport")
	easynet.Add("report_id", EASYNET_UINT32)
easynet.Register()

easynet.Start("SH_REPORTS.SendPerfReports")
	easynet.Add("struct_perf_reports", EASYNET_STRUCTURES)
easynet.Register()

easynet.Start("SH_REPORTS.SendPerfReportStaff")
	easynet.Add("id", EASYNET_UINT32)
	easynet.Add("struct_perf_reports_staff", EASYNET_STRUCTURES)
easynet.Register()

easynet.Start("SH_REPORTS.ReportsPending")
	easynet.Add("num", EASYNET_UINT16)
	easynet.Add("struct_reports", EASYNET_STRUCTURES)
easynet.Register()

easynet.Start("SH_REPORTS.AdminLeft")
	easynet.Add("report_id", EASYNET_UINT32)
easynet.Register()

easynet.Start("SH_REPORTS.PromptRating")
	easynet.Add("report_id", EASYNET_UINT32)
	easynet.Add("admin_name", EASYNET_STRING)
easynet.Register()

easynet.Start("SH_REPORTS.SendRatings")
	easynet.Add("struct_rating", EASYNET_STRUCTURES)
easynet.Register()

easynet.Start("SH_REPORTS.SendHistoryList")
	easynet.Add("struct_history_steamids", EASYNET_STRUCTURES)
	easynet.Add("struct_history_list", EASYNET_STRUCTURES)
easynet.Register()

easynet.Start("SH_REPORTS.SendReportValid")
	easynet.Add("report_id", EASYNET_UINT32)
	easynet.Add("valid", EASYNET_BOOL)
easynet.Register()

-- CLIENT -> SERVER
easynet.Start("SH_REPORTS.PlayerReady")
easynet.Register()

easynet.Start("SH_REPORTS.NewReport")
	easynet.Add("reported_name", EASYNET_STRING)
	easynet.Add("reported_id", EASYNET_STRING)
	easynet.Add("reason_id", EASYNET_UINT8)
	easynet.Add("comment", EASYNET_STRING)
easynet.Register()

easynet.Start("SH_REPORTS.RequestList")
easynet.Register()

easynet.Start("SH_REPORTS.ClaimAndTeleport")
	easynet.Add("id", EASYNET_UINT32)
	easynet.Add("bring", EASYNET_BOOL)
	easynet.Add("bring_reported", EASYNET_BOOL)
easynet.Register()

easynet.Start("SH_REPORTS.Claim")
	easynet.Add("id", EASYNET_UINT32)
easynet.Register()

easynet.Start("SH_REPORTS.ClaimAndCSit")
	easynet.Add("id", EASYNET_UINT32)
easynet.Register()

easynet.Start("SH_REPORTS.CloseReport")
	easynet.Add("id", EASYNET_UINT32)
easynet.Register()

easynet.Start("SH_REPORTS.RequestPerfReports")
easynet.Register()

easynet.Start("SH_REPORTS.RequestPerfReportStaff" /* 76561199385207498 */)
	easynet.Add("id", EASYNET_UINT32)
easynet.Register()

easynet.Start("SH_REPORTS.RateAdmin")
	easynet.Add("report_id", EASYNET_UINT32)
	easynet.Add("rating", EASYNET_UINT8)
easynet.Register()

easynet.Start("SH_REPORTS.RequestStaffRatings")
easynet.Register()

easynet.Start("SH_REPORTS.RequestReportHistory")
easynet.Register()

easynet.Start("SH_REPORTS.RequestReportValid")
	easynet.Add("report_id", EASYNET_UINT32)
easynet.Register()

-- STRUCTURES
easynet.Start("struct_reports")
	easynet.Add("id", EASYNET_UINT32)
	easynet.Add("reporter_id", EASYNET_STRING)
	easynet.Add("reporter_name", EASYNET_STRING)
	easynet.Add("reported_id", EASYNET_STRING)
	easynet.Add("reported_name", EASYNET_STRING)
	easynet.Add("reason_id", EASYNET_UINT8)
	easynet.Add("comment", EASYNET_STRING)
	easynet.Add("time", EASYNET_UINT32)
	easynet.Add("admin_id", EASYNET_STRING)
easynet.Register()

easynet.Start("struct_perf_reports")
	easynet.Add("id", EASYNET_UINT32)
	easynet.Add("start_time", EASYNET_UINT32)
	easynet.Add("end_time", EASYNET_UINT32)
easynet.Register()

easynet.Start("struct_perf_reports_staff")
	easynet.Add("steamid", EASYNET_STRING)
	easynet.Add("claimed", EASYNET_UINT16)
	easynet.Add("closed", EASYNET_UINT16)
	easynet.Add("timespent", EASYNET_UINT16)
easynet.Register()

easynet.Start("struct_rating")
	easynet.Add("steamid", EASYNET_STRING)
	easynet.Add("total", EASYNET_UINT32)
	easynet.Add("num", EASYNET_UINT16)
easynet.Register()

easynet.Start("struct_history_steamids")
	easynet.Add("steamid", EASYNET_STRING)
easynet.Register()

easynet.Start("struct_history_list")
	easynet.Add("report_id", EASYNET_UINT32)
	easynet.Add("reporter_nid", EASYNET_UINT16)
	easynet.Add("reported_nid", EASYNET_UINT16)
	easynet.Add("reason", EASYNET_STRING)
	easynet.Add("comment", EASYNET_STRING)
	easynet.Add("rating", EASYNET_UINT8)
	easynet.Add("date", EASYNET_UINT32)
	easynet.Add("waiting_time", EASYNET_UINT16)
	easynet.Add("admin_nid", EASYNET_UINT16)
easynet.Register()
--PATH addons/azlink/lua/autorun/azlink_autorun.lua:
if SERVER then
    include( "azlink/azlink.lua" )
    include( "azlink/logger/logger.lua" )
    include( "azlink/fetcher.lua" )
    include( "azlink/http/http_client.lua" )
    include( "azlink/http/promise.lua" )
    include( "azlink/commands/azlink_command.lua" )
end

--PATH lua/drgbase/misc.lua:

-- Misc --

local RANGE_MELEE = {
	["melee"] = true,
	["melee2"] = true,
	["fist"] = true,
	["knife"] = true
}
function DrGBase.IsMeleeWeapon(weapon)
	local holdType = weapon:GetHoldType()
	if RANGE_MELEE[holdType] or RANGE_MELEE[weapon.HoldType] then return true end
	return weapon.DrGBase_Melee or string.find(holdType, "melee") ~= nil
end

if SERVER then

	-- Misc --

	function DrGBase.CreateProjectile(model, binds)
		local proj = ents.Create("proj_drg_default")
		if not IsValid(proj) then return NULL end
		if istable(model) and #model > 0 then model = model[math.random(#model)] end
		if isstring(model) then proj:SetModel(model) end
		binds = binds or {}
		if isfunction(binds.Init) then proj.CustomInitialize = binds.Init end
		if isfunction(binds.Think) then proj.CustomThink = binds.Think end
		if isfunction(binds.Contact) then proj.OnContact = binds.Contact end
		if isfunction(binds.Use) then proj.Use = binds.Use end
		if isfunction(binds.DealtDamage) then proj.OnDealtDamage = binds.DealtDamage end
		if isfunction(binds.TakeDamage) then proj.OnTakeDamage = binds.TakeDamage end
		if isfunction(binds.Remove) then proj.OnRemove = binds.Remove end
		proj:Spawn()
		return proj
	end

	local TARGET_BLACKLIST = {
		["npc_bullseye"] = true,
		["npc_grenade_frag"] = true,
		["npc_tripmine"] = true,
		["npc_satchel"] = true,
		["npc_antlion_grub"] = true,
		["monster_cockroach"] = true
	}
	local TARGET_WHITELIST = {
		["replicator_melon"] = true,
		["replicator_worker"] = true,
		["replicator_queen"] = true,
		["replicator_queen_hive"] = true
	}
	function DrGBase.IsTarget(ent)
		if not IsValid(ent) then return false end
		local class = ent:GetClass()
		if ent:HasSpawnFlags(SF_NPC_TEMPLATE) then return false end
		if TARGET_BLACKLIST[class] then return false end
		if TARGET_WHITELIST[class] then return true end
		if ent.DrGBase_Target then return true end
		if ent:IsNextBot() then return true end
		if ent:IsPlayer() then return true end
		if ent:IsNPC() then return true end
		return false
	end

	function DrGBase.CanAttack(ent)
		if not IsValid(ent) then return false end
		if ent:IsPlayer() and ent:DrG_IsPossessing() then return false end
		if DrGBase.IsTarget(ent) then return true end
		local phys = ent:GetPhysicsObject()
		return IsValid(phys)
	end

	local BlindData = {}
	BlindData.__index = BlindData
	function BlindData:New()
		local blind = {}
		blind._duration = 3
		blind._attacker = NULL
		blind._inflictor = NULL
		setmetatable(blind, self)
		return blind
	end
	function BlindData:GetDuration()
		return self._duration
	end
	function BlindData:SetDuration(duration)
		if not isnumber(duration) then return end
		self._duration = math.max(0, duration)
	end
	function BlindData:ScaleDuration(scale)
		if not isnumber(scale) or scale < 0 then return end
		self:SetDuration(self:GetDuration()*scale)
	end
	function BlindData:GetAttacker()
		return self._attacker
	end
	function BlindData:SetAttacker(attacker)
		if not isentity(attacker) then return end
		self._attacker = attacker
	end
	function BlindData:GetInflictor()
		return self._inflictor
	end
	function BlindData:SetInflictor(inflictor)
		if not isentity(inflictor) then return end
		self._inflictor = inflictor
	end

	function DrGBase.Blind()
		return BlindData:New()
	end

else

	-- Misc --

	local MATERIALS = {}
	function DrGBase.Material(name, ...)
		if not MATERIALS[name] then
			local material = Material(name, ...)
			MATERIALS[name] = material
			return material
		else return MATERIALS[name] end
	end

	-- propspawn.lua effect fix --
	-- rubat fix your shit --

	local effects_Register = effects.Register
	function effects.Register(tbl, name)
		if name == "propspawn" then
			local RenderParent = tbl.RenderParent
			function tbl:RenderParent()
				if not IsValid(self) then return end
				if not IsValid(self.SpawnEffect) then self.RenderOverride = nil return end
				return RenderParent(self)
			end
		end

		return effects_Register(tbl, name)
	end

end

--PATH lua/drgbase/particles.lua:
-- Registry --

function DrGBase.AddParticles(pcf, particles)
	if not isstring(pcf) then return end
	game.AddParticles("particles/"..pcf)
	if not istable(particles) then particles = {particles} end
	for i, particle in ipairs(particles) do
		if not isstring(particle) then continue end
		PrecacheParticleSystem(particle)
	end
end

-- Premade particles --

DrGBase.AddParticles("drgbase.pcf", {
	"drg_plasma_ball",
	"drg_smokescreen"
})

-- Vanilla particles --

PrecacheParticleSystem("blood_impact_red_01_goop")
PrecacheParticleSystem("blood_impact_yellow_01")
PrecacheParticleSystem("blood_impact_green_01")
PrecacheParticleSystem("blood_impact_antlion_01")
PrecacheParticleSystem("blood_impact_zombie_01")
PrecacheParticleSystem("blood_impact_antlion_worker_01")

-- Create particles --

if SERVER then

	function DrGBase.ParticleEffect(effect, data)
		if not isstring(effect) then return end
		if not istable(data) then return end
		local ent = ents.Create("info_particle_system")
		if not IsValid(ent) then return NULL end
		ent:SetKeyValue("effect_name", effect)
		ent:SetName("drg_info_particle_system_"..ent:GetCreationID())
		if isvector(data.pos) then ent:SetPos(data.pos) end
		if isangle(data.ang) then ent:SetAngles(data.ang) end
		if data.active ~= false then ent:SetKeyValue("start_active", "1") end
		for i, subdata in ipairs(data.cpoints or {}) do
			local sub = DrGBase.ParticleEffect(effect, subdata)
			if not IsValid(sub) then continue end
			ent:SetKeyValue("cpoint"..tostring(i), sub:GetName())
			ent:DeleteOnRemove(sub)
		end
		ent:Spawn()
		ent:Activate()
		if isentity(data.parent) and IsValid(data.parent) then
			if isstring(data.attachment) then
				ent:SetParent(data.parent)
				if data.keepoffset then
					ent:Fire("SetParentAttachmentMaintainOffset", data.attachment)
				else ent:Fire("SetParentAttachment", data.attachment) end
			elseif not data.keepoffset then
				ent:SetPos(data.parent:GetPos())
				ent:SetParent(data.parent)
			else ent:SetParent(data.parent) end
		end
		return ent
	end

	function DrGBase.SimpleParticleEffect(effect, arg1, arg2)
		if isentity(arg1) and IsValid(arg1) then
			return DrGBase.ParticleEffect(effect, {
				parent = arg1, attachment = arg2
			})
		elseif isvector(arg1) then
			return DrGBase.ParticleEffect(effect, {
				pos = arg1, ang = arg2
			})
		end
	end

end

--PATH lua/drgbase/spawnmenu.lua:
if SERVER then return end

function DrGBase.GetIcon(name)
  return list.Get("DrGBaseIcons")[name]
end
function DrGBase.SetIcon(name, icon)
  list.Set("DrGBaseIcons", name, icon)
end
DrGBase.SetIcon("DrGBase", DrGBase.Icon)

-- Creation Tab --

spawnmenu.AddCreationTab("DrGBase", function()
  local ctrl = vgui.Create("SpawnmenuContentPanel")
  ctrl:EnableSearch("drgbase", "PopulateDrGBaseSpawnmenu")
  ctrl:CallPopulateHook("PopulateDrGBaseSpawnmenu")
  return ctrl
end, DrGBase.Icon, 75, "Every addon made using DrGBase.")

search.AddProvider(function(str)
	str = str:PatternSafe()
	local results = {}
	for class, ent in pairs(list.Get("DrGBaseNextbots")) do
    if #results >= 128 then break end
		if string.find(string.lower(ent.Name), string.lower(str)) ~= nil or
		string.find(string.lower(class), string.lower(str)) ~= nil then
			table.insert(results, {
				text = ent.Name or class,
				icon = spawnmenu.CreateContentIcon("npc", nil, {
					nicename = ent.Name or class,
					spawnname = class,
					material = "entities/"..class..".png",
					admin = ent.AdminOnly
				}),
				words = {ent}
			})
		end
	end
	for class, ent in pairs(list.Get("DrGBaseSpawners")) do
    if #results >= 128 then break end
		if string.find(string.lower(ent.Name), string.lower(str)) ~= nil or
		string.find(string.lower(class), string.lower(str)) ~= nil then
			table.insert(results, {
				text = ent.Name or class,
				icon = spawnmenu.CreateContentIcon("npc", nil, {
					nicename = ent.Name or class,
					spawnname = class,
					material = "entities/"..class..".png",
					admin = ent.AdminOnly
				}),
				words = {ent}
			})
		end
	end
	table.SortByMember(results, "text", true)
	return results
end, "drgbase")

-- Tool Tab --

hook.Add("AddToolMenuTabs", "DrGBaseToolMenu", function()
  spawnmenu.AddToolTab("DrGBase", "DrGBase", DrGBase.Icon)
end)

hook.Add("PopulateToolMenu", "DrGBaseToolMenu", function()
  -- Main Menu --
  --[[spawnmenu.AddToolMenuOption("DrGBase", "Main Menu", "drgbase_mm_about", "About", "", "", function(panel)
    panel:ClearControls()

  end)
  spawnmenu.AddToolMenuOption("DrGBase", "Main Menu", "drgbase_mm_list_nextbot", "Nextbot List", "", "", function(panel)
    panel:ClearControls()

  end)]]
  -- Nextbot Settings --
  spawnmenu.AddToolMenuOption("DrGBase", "Nextbot Settings", "drgbase_nb_settings_ai", "AI Settings", "", "", function(panel)
    panel:ClearControls()
    panel:ControlHelp("\nDetection")
    panel:NumSlider("Target distance", "drgbase_ai_radius", 0, 50000, 0)
    panel:CheckBox("Enable omniscience", "drgbase_ai_omniscient")
    panel:CheckBox("Enable sight", "drgbase_ai_sight")
    panel:CheckBox("Enable hearing", "drgbase_ai_hearing")
    panel:CheckBox("Enable patrol", "drgbase_ai_patrol")
    panel:ControlHelp("\nWeapons")
    panel:CheckBox("Players can give weapons", "drgbase_give_weapons")
  end)
  spawnmenu.AddToolMenuOption("DrGBase", "Nextbot Settings", "drgbase_nb_settings_possession", "Possession", "", "", function(panel)
    panel:ClearControls()
    panel:ControlHelp("\nServer Settings")
    panel:CheckBox("Enable possession", "drgbase_possession_enable")
    panel:ControlHelp("\nClient Settings")
    panel:AddControl("numpad", {
      label = "Exit possession",
      command = "drgbase_possession_exit",
      label2 = "Cycle views",
      command2 = "drgbase_possession_view"
    })
    panel:AddControl("numpad", {
      label = "Climb",
      command = "drgbase_possession_climb",
      label2 = "Lock on",
      command2 = "drgbase_possession_lockon"
    })
    panel:NumSlider("Lock on speed", "drgbase_possession_lockon_speed", 0.01, 1, 2)
    panel:CheckBox("Teleport on dispossess", "drgbase_possession_teleport")
  end)
  spawnmenu.AddToolMenuOption("DrGBase", "Nextbot Settings", "drgbase_nb_settings_misc", "Misc", "", "", function(panel)
    panel:ClearControls()
    panel:ControlHelp("\nStats")
    panel:NumSlider("Health multiplier", "drgbase_multiplier_health", 0.1, 10, 1)
    panel:NumSlider("Player damage multiplier", "drgbase_multiplier_damage_players", 0.1, 10, 1)
    panel:NumSlider("NPC damage multiplier", "drgbase_multiplier_damage_npc", 0.1, 10, 1)
    panel:NumSlider("Speed multiplier", "drgbase_multiplier_speed", 0.1, 10, 1)
    panel:ControlHelp("\nRagdolls")
    panel:NumSlider("Remove ragdolls", "drgbase_remove_ragdolls", -1, 180, 0)
    panel:NumSlider("Ragdoll fadeout", "drgbase_ragdoll_fadeout", 0, 10, 1)
    panel:CheckBox("Also remove 'dead' nextbots", "drgbase_remove_dead")
    panel:CheckBox("Disable ragdoll collisions", "drgbase_ragdoll_collisions_disabled")
    panel:ControlHelp("\nPathfinding")
    panel:NumSlider("Compute delay", "drgbase_compute_delay", 0.01, 3, 2)
    panel:CheckBox("Avoid obstacles", "drgbase_avoid_obstacles")
  end)
end)

--PATH addons/sl_util_wallet/lua/ezwallet_config.lua:
easzy.wallet.config = easzy.wallet.config or {}

local config = easzy.wallet.config

-- IMPORTANT
-- DON'T FORGET TO CHANGE SOME OF THE DARKRP SETTINGS IN ez_wallet/lua/darkrp_modules/ez_wallet/sh_init.lua
-- CHANGE CURRENCY ($, €) TO GET THE RIGHT MODELS

-- GENERAL
config.language = "fr" -- "en", "fr"
config.hands = "keys" -- Your hands weapon

-- Easily change SWEP PrintName
config.walletName = "Porte - Monnaie"
config.cardName = "Carte Bancaire"
config.moneyName = "Argent"

-- Remove cards from other license addons
config.removeOtherAddonsCards = true

-- /me when taking out an item (card or money)
config.itemMe = trye

-- /me when dropping and giving money
config.moneyMe = true

-- Remove /give, /moneydrop and /dropmoney
config.removeMoneyCommands = false

-- CHOOSE YOUR ITEMS
config.items = {
    ["credit_card"] = true, -- Enable the credit card
    ["id_card"] = false, -- Enable the ID card
    ["driver_license"] = false, -- Enable the driver license
    ["weapon_license"] = false, -- Enable the weapon license
    ["banknote"] = true -- Enable the banknote
}

-- SHOW CARD NAMES
config.showWalletHelp = true -- true will display the help "PRESS E TO USE"
config.showCardNames = true -- true will display the cards name
config.showCardNamesOnHover = true -- true will display the cards name only on hover, false will display the cards name all the time

-- BANK SYSTEM
config.bankSystem = "Blue's ATM" -- "Blue's ATM", "SlownLS ATM", "Glorified Banking", "ARCBank", "Better Banking" or "Crap-Head ATM"
config.needCardToAccessATM = true -- You can access the ATM only if you have the credit card in your hands, compatible with "Blue's ATM", "SlownLS ATM"

-- DRIVER LICENSE SYSTEM
config.driverLicenseSystem = "ToBadForYou Driver License System" -- "Kobralost Advanced Driver License" or "ToBadForYou Driver License System"

-- Create licenses in the "ToBadForYou Driver License System" addon and match them to Easzy's Wallet licenses in the table below.
-- You must not touch the values on the right, just change the license names on the left.
config.toBadForYouDriverLicenseSystem = {
    -- ["NameInToBadForYouDriverLicenseSystem"] = "donottouch"
    ["Car"] = "car",
    ["Motorcycle"] = "motorcycle",
    -- ["Truck"] = "truck",
    -- ["Bus"] = "bus"
}

-- Don't touch
config.kobralostAdvancedDriverLicense = {
    ["kobralost_adl/adl_car.png"] = "car",
    ["kobralost_adl/adl_motorcycle.png"] = "motorcycle",
    ["kobralost_adl/adl_trunk.png"] = "truck",
    ["kobralost_adl/adl_bus.png"] = "bus"
}

-- WEAPON LICENSE SYSTEM
config.weaponLicenseSystem = "ToBadForYou Firearms License System" -- "Kobralost Advanced Weapon License" or "ToBadForYou Firearms License System"

-- Create licenses in the "ToBadForYou Firearms License System" addon and match them to Easzy's Wallet licenses in the table below.
-- You must not touch the values on the right, just change the license names on the left.
config.toBadForYouFirearmsLicenseSystem = {
    -- ["NameInToBadForYouFirearmsLicenseSystem"] = "donottouch"
    ["A"] = "pistol",
    ["B"] = "shotgun",
    ["D"] = "rifle",
    ["E"] = "sniper"
}

-- Don't touch
config.kobralostAdvancedWeaponLicense = {
    [1] = "pistol",
    [2] = "shotgun",
    [1] = "rifle",
    [3] = "sniper"
}

--PATH addons/sl_util_wallet/lua/ezwallet/shared/screen_clicker.lua:


if CLIENT then
    local GUIToggled = false
    local lastClick
    local mouseX, mouseY = ScrW()/2, ScrH()/2

    -- Toggle screen clicker
    function easzy.wallet.ToggleScreenClicker()
        if lastClick and CurTime() - lastClick < 0.2 then return end

        GUIToggled = not GUIToggled

        if GUIToggled then
            gui.SetMousePos(mouseX, mouseY)
        end

        gui.EnableScreenClicker(GUIToggled)

        lastClick = CurTime()
    end

    -- Disable screen clicker
    net.Receive("ez_wallet_disable_screen_cliker", function()
        if lastClick and CurTime() - lastClick < 0.2 then return end

        gui.EnableScreenClicker(false)
        GUIToggled = false

        lastClick = CurTime()
    end)

    hook.Add("OnScreenSizeChanged", "ezwallet_screen_clicker_OnScreenSizeChanged", function()
        mouseX, mouseY = ScrW()/2, ScrH()/2
    end)
else
    util.AddNetworkString("ez_wallet_disable_screen_cliker")

    function easzy.wallet.DisableScreenClicker(ply)
        net.Start("ez_wallet_disable_screen_cliker")
        net.Send(ply)
    end
end





--PATH lua/includes/modules/billyserrors.lua:
AddCSLuaFile()

local BillysErrors_Version = 1
if (BillysErrors) then
	if (BillysErrors.Version >= BillysErrors_Version) then
		return
	elseif (CLIENT and IsValid(BillysErrors.Menu)) then
		BillysErrors.Menu:Close()
	end
end

BillysErrors = {}
BillysErrors.Version = BillysErrors_Version

BillysErrors.IMPORTANCE_NOTICE  = 0
BillysErrors.IMPORTANCE_WARNING = 1
BillysErrors.IMPORTANCE_FATAL   = 2

BillysErrors.COLOR_RED        = Color(255,0,0)
BillysErrors.COLOR_YELLOW     = Color(255,255,0)
BillysErrors.COLOR_LIGHT_BLUE = Color(0,255,255)
BillysErrors.COLOR_WHITE      = Color(255,255,255)

local function UnvectorizeColor(col)
	return col.r, col.g, col.b, col.a
end

function BillysErrors:ProcessConsoleMsg(print_items, msg)
	if (msg.Importance == BillysErrors.IMPORTANCE_NOTICE) then
		table.insert(print_items, BillysErrors.COLOR_LIGHT_BLUE)
		table.insert(print_items, "[NOTICE] ")
	elseif (msg.Importance == BillysErrors.IMPORTANCE_WARNING) then
		table.insert(print_items, BillysErrors.COLOR_YELLOW)
		table.insert(print_items, "[WARNING] ")
	elseif (msg.Importance == BillysErrors.IMPORTANCE_FATAL) then
		table.insert(print_items, BillysErrors.COLOR_RED)
		table.insert(print_items, "[FATAL] ")
	end
	if (#msg.TextItems > 0) then
		local prev_color
		if (not IsColor(msg.TextItems[1])) then
			table.insert(print_items, BillysErrors.COLOR_WHITE)
			prev_color = BillysErrors.COLOR_WHITE
		else
			prev_color = msg.TextItems[1]
		end
		for _,item in ipairs(msg.TextItems) do
			if (type(item) == "string") then
				table.insert(print_items, item)
			elseif (IsColor(item)) then
				table.insert(print_items, item)
				prev_color = item
			elseif (type(item) == "table" and item.Link ~= nil) then
				table.insert(print_items, BillysErrors.COLOR_LIGHT_BLUE)
				table.insert(print_items, item.Link)
				table.insert(print_items, prev_color)
			end
		end
	end
end

if (CLIENT) then
	function BillysErrors:ProcessRichTextMsg(rich_text, msg)
		if (msg.Importance == BillysErrors.IMPORTANCE_NOTICE) then
			rich_text:InsertColorChange(UnvectorizeColor(BillysErrors.COLOR_LIGHT_BLUE))
			rich_text:AppendText("[NOTICE] ")
		elseif (msg.Importance == BillysErrors.IMPORTANCE_WARNING) then
			rich_text:InsertColorChange(UnvectorizeColor(BillysErrors.COLOR_YELLOW))
			rich_text:AppendText("[WARNING] ")
		elseif (msg.Importance == BillysErrors.IMPORTANCE_FATAL) then
			rich_text:InsertColorChange(UnvectorizeColor(BillysErrors.COLOR_RED))
			rich_text:AppendText("[FATAL] ")
		end
		if (#msg.TextItems > 0) then
			local prev_color
			if (not IsColor(msg.TextItems[1])) then
				rich_text:InsertColorChange(UnvectorizeColor(BillysErrors.COLOR_WHITE))
				prev_color = BillysErrors.COLOR_WHITE
			else
				prev_color = msg.TextItems[1]
			end
			for i,item in ipairs(msg.TextItems) do
				if (IsColor(item)) then
					rich_text:InsertColorChange(UnvectorizeColor(item))
					prev_color = item
				elseif (type(item) == "table") then
					rich_text:InsertColorChange(0,125,255,255)
					rich_text:InsertClickableTextStart("OpenURL " .. item.Link)
					rich_text:AppendText(item.Link)
					rich_text:InsertClickableTextEnd()
					rich_text:InsertColorChange(UnvectorizeColor(prev_color))
				else
					rich_text:AppendText(tostring(item))
				end
			end
		end
	end
end

if (SERVER) then
	util.AddNetworkString("billyserrors")

	BillysErrors.Addons = {}
	BillysErrors.HasMessage = false

	local ADDON = {}
	function ADDON:Init(options)
		self.Name = options.Name
		self.Color = options.Color
		self.Icon = options.Icon
		self.Messages = options.Messages or {}
	end
	function ADDON:AddMessage(importance, ...)
		local msg = {
			Importance = importance,
			TextItems = {...}
		}
		table.insert(self.Messages, msg)

		local print_items = {}
		BillysErrors:ProcessConsoleMsg(print_items, msg)
		table.insert(print_items, "\n")
		MsgC(unpack(print_items))

		BillysErrors.HasMessage = true
		BillysErrors:SendData()
	end

	function BillysErrors:AddAddon(options)
		local addon = table.Copy(ADDON)
		addon:Init(options)
		table.insert(BillysErrors.Addons, addon)
		return addon
	end

	function BillysErrors:SendData(ply)
		if (not BillysErrors.HasMessage) then return end
		local data = util.Compress(util.TableToJSON(BillysErrors.Addons))
		if (ply ~= nil) then
			if (not IsValid(ply) or not ply:IsSuperAdmin()) then return end
			net.Start("billyserrors")
				net.WriteData(data, #data)
			net.Send(ply)
		else
			for _,ply in ipairs(player.GetHumans()) do
				if (not ply:IsSuperAdmin()) then continue end
				net.Start("billyserrors")
					net.WriteData(data, #data)
				net.Send(ply)
			end
		end
	end
	net.Receive("billyserrors", function(_, ply)
		BillysErrors:SendData(ply)
	end)
else
	function BillysErrors:OpenMenu()
		if (IsValid(BillysErrors.Menu)) then
			BillysErrors.Menu.Categories:Remove()
			BillysErrors.Menu.Categories = vgui.Create("bVGUI.Categories", BillysErrors.Menu.Content)
			BillysErrors.Menu.Categories:Dock(LEFT)
			BillysErrors.Menu.Categories:SetWide(175)
			BillysErrors.Menu.Categories:MoveToBefore(BillysErrors.Menu.Header)

			BillysErrors.Menu:LoadMessages(true)
			return
		end

		BillysErrors.Menu = vgui.Create("bVGUI.Frame")
		BillysErrors.Menu:SetSize(600,500)
		BillysErrors.Menu:SetMinimumSize(600,500)
		BillysErrors.Menu:Center()
		BillysErrors.Menu:SetTitle("BillysErrors")
		BillysErrors.Menu:MakePopup()
		function BillysErrors.Menu:OnClose()
			hook.Remove("SetupMove", "BillysErrors:ScrollRichText")
		end

		BillysErrors.Menu.Content = vgui.Create("bVGUI.BlankPanel", BillysErrors.Menu)
		BillysErrors.Menu.Content:Dock(FILL)
		function BillysErrors.Menu.Content:PaintOver(w,h)
			surface.SetDrawColor(255,255,255,255)
			surface.SetMaterial(bVGUI.MATERIAL_SHADOW)
			surface.DrawTexturedRect(175,0,10,h)
		end

		BillysErrors.Menu.Categories = vgui.Create("bVGUI.Categories", BillysErrors.Menu.Content)
		BillysErrors.Menu.Categories:Dock(LEFT)
		BillysErrors.Menu.Categories:SetWide(175)

		BillysErrors.Menu.Header = vgui.Create("bVGUI.Header", BillysErrors.Menu.Content)
		BillysErrors.Menu.Header:Dock(TOP)
		BillysErrors.Menu.Header:SetText("Help")
		BillysErrors.Menu.Header:SetColor(Color(76,216,76))
		BillysErrors.Menu.Header:SetIcon("icon16/help.png")

		local function CreateRichText()
			if (IsValid(BillysErrors.Menu.Text)) then
				BillysErrors.Menu.Text:Remove()
			end
			BillysErrors.Menu.Text = vgui.Create("RichText", BillysErrors.Menu.Content)
			BillysErrors.Menu.Text:Dock(FILL)
			BillysErrors.Menu.Text:DockMargin(10,10,10,10)
			BillysErrors.Menu.Text:SetVerticalScrollbarEnabled(true)
			BillysErrors.Menu.Text:InsertColorChange(255,255,255,255)

			local font_name = bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14)
			function BillysErrors.Menu.Text:PerformLayout()
				self:SetFontInternal(font_name)
			end

			function BillysErrors.Menu.Text:ActionSignal(signalName, signalValue)
				if (signalName == "TextClicked" and signalValue:sub(1,8) == "OpenURL ") then
					if (GAS) then
						GAS:OpenURL(signalValue:sub(9))
					else
						gui.OpenURL(signalValue:sub(9))
					end
				end
			end
		end

		function BillysErrors.Menu:LoadMessages(is_refresh)
			BillysErrors.Menu.Categories:Clear()

			local function ShowHelpText()
				if (not is_refresh) then
					BillysErrors.LastSelectedAddon = nil
				end

				CreateRichText()
				BillysErrors.Menu.Text:InsertColorChange(255,0,0,255)
				BillysErrors.Menu.Text:AppendText("(This window is only visible to superadmins)\n\n")
				BillysErrors.Menu.Text:InsertColorChange(255,255,255,255)
				BillysErrors.Menu.Text:AppendText(([[

					Uh oh! Something's wrong with an addon you have installed to your server.

					Click the addon's name on the left to see what's wrong, and how to fix the problem.

				]]):gsub("\t", ""):gsub("^%s",""):gsub("%s$",""))

				BillysErrors.Menu.Header:SetText("Help")
				BillysErrors.Menu.Header:SetColor(Color(76,216,76))
				BillysErrors.Menu.Header:SetIcon("icon16/help.png")
			end
			BillysErrors.Menu.Categories:AddItem("Help", ShowHelpText, Color(76,216,76)):SetActive(not is_refresh or BillysErrors.LastSelectedAddon == nil)

			ShowHelpText()

			local category_col = Color(216,76,76)
			if (BillysErrors.Addons[1] ~= nil and BillysErrors.Addons[1].Color ~= nil) then
				category_col = BillysErrors.Addons[1].Color
			end
			local category = BillysErrors.Menu.Categories:AddCategory("Addons", category_col)
			for _,addon in ipairs(BillysErrors.Addons) do
				if (#addon.Messages == 0) then continue end
				local item = category:AddItem(addon.Name, function()

					BillysErrors.LastSelectedAddon = addon.Name

					BillysErrors.Menu.Header:SetText(addon.Name)
					BillysErrors.Menu.Header:SetColor(addon.Color or Color(0,125,255))
					BillysErrors.Menu.Header:SetIcon(addon.Icon or false)

					CreateRichText()
					for i,msg in ipairs(addon.Messages) do
						local print_items = {}
						BillysErrors:ProcessConsoleMsg(print_items, msg)
						table.insert(print_items, "\n\n")
						MsgC(unpack(print_items))

						BillysErrors:ProcessRichTextMsg(BillysErrors.Menu.Text, msg)
						if (i ~= #msg) then BillysErrors.Menu.Text:AppendText("\n\n") end
					end

				end, addon.Color, addon.Icon)
				if (BillysErrors.LastSelectedAddon == addon.Name) then
					item:OnMouseReleased(MOUSE_LEFT)
				end
			end
		end
		BillysErrors.Menu:LoadMessages()

		BillysErrors.Menu:EnableUserResize()
		surface.PlaySound("gmodadminsuite/oof.mp3")
	end

	net.Receive("billyserrors", function(l)
		BillysErrors.Addons = util.JSONToTable(util.Decompress(net.ReadData(l)))
		BillysErrors:OpenMenu()
	end)

	if (BillysErrors_InitPostEntity) then
		net.Start("billyserrors")
		net.SendToServer()
	else
		hook.Add("InitPostEntity", "BillysErrors:InitPostEntity", function()
			BillysErrors_InitPostEntity = true

			net.Start("billyserrors")
			net.SendToServer()

			hook.Remove("InitPostEntity", "BillysErrors:InitPostEntity")
		end)
	end
end
--PATH lua/gmodadminsuite/sh_core.lua:
AddCSLuaFile()

--######## LOAD CONFIG ########--

GAS:HeaderPrint("")
GAS:HeaderPrint("Loading configs...", GAS_PRINT_TYPE_INFO)

GAS.Config = {}

local function InstallConfigAddon()
	if (SERVER) then
		GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "Looks like the GmodAdminSuite Config Addon has not been installed to your server: ", {Link = "https://gmodsto.re/gmodadminsuite-config-addon"}, "\nYou need to install this addon in order to use & configure GmodAdminSuite.")
	end
end

if (not file.Exists("gmodadminsuite_config.lua", "LUA")) then
	return InstallConfigAddon()
else
	local worked = include("gmodadminsuite_config.lua")
	if (not worked) then
		if (SERVER) then
			GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "GmodAdminSuite config failed to load. You probably have an error in your config. Please read your server's console.")
			return
		end
		return
	else
		GAS:HeaderPrint("Config successfully loaded", GAS_PRINT_COLOR_GOOD, GAS_PRINT_TYPE_INFO)
	end
end

if (not file.Exists("gmodadminsuite_lua_functions.lua", "LUA")) then
	return InstallConfigAddon()
else
	local worked = include("gmodadminsuite_lua_functions.lua")
	if (not worked) then
		if (SERVER) then
			GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "GmodAdminSuite Lua functions config failed to load. You probably have an error in your config. Please read your server's console.")
			return
		end
		return
	else
		GAS:HeaderPrint("Lua functions successfully loaded", GAS_PRINT_COLOR_GOOD, GAS_PRINT_TYPE_INFO)
	end
end

if (SERVER) then
	if (not file.Exists("gmodadminsuite_mysql_config.lua", "LUA")) then
		return InstallConfigAddon()
	else
		GAS.Config.MySQL = {}
		local worked = include("gmodadminsuite_mysql_config.lua")
		if (not worked) then
			GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "GmodAdminSuite MySQL config failed to load. You probably have an error in your config. Please read your server's console.")
			return
		else
			GAS:HeaderPrint("MySQL config successfully loaded", GAS_PRINT_COLOR_GOOD, GAS_PRINT_TYPE_INFO)
		end
	end

	if (not file.Exists("gmodadminsuite_steam_apikey.lua", "LUA")) then
		return InstallConfigAddon()
	else
		GAS.SteamAPI = {}
		GAS.SteamAPI.Config = {}
		local worked = include("gmodadminsuite_steam_apikey.lua")
		if (not worked) then
			GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "GmodAdminSuite Steam API key config failed to load. You probably have an error in your config. Please read your server's console.")
			return
		end
	end
end

--######## ADD RESOURCES ########--

if (SERVER) then
	-- Fonts must be downloaded from the server
	resource.AddFile("resource/fonts/circular-bold.ttf")
	resource.AddFile("resource/fonts/circular-medium.ttf")
	resource.AddFile("resource/fonts/rubik.ttf")
	resource.AddFile("resource/fonts/rubik-bold.ttf")

	if (GAS.Config.WorkshopDL == true or GAS.Config.WorkshopDL == nil) then
		resource.AddWorkshop("1596971443")
	end
	if (GAS.Config.ServerDL == true) then
		for _,v in ipairs({"materials/gmodadminsuite/*", "sound/gmodadminsuite/*"}) do
			local files = file.Find(v, "GAME")
			for _,f in pairs(files) do
				resource.AddFile((v:gsub("%*$", "")) .. f)
			end
		end
	end
else
	for _,v in ipairs((file.Find("sound/gmodadminsuite/*", "GAME"))) do
		util.PrecacheSound("sound/gmodadminsuite/" .. v)
	end
end

--######## Account ID ########--

function GAS:SteamID64ToAccountID(steamid64)
	return GAS:SteamIDToAccountID(util.SteamIDFrom64(steamid64))
end

function GAS:SteamIDToAccountID(steamid)
	local acc32 = tonumber(steamid:sub(11))
	return (acc32 * 2) + tonumber(steamid:sub(9,9))
end

function GAS:AccountIDToSteamID(account_id)
	local sid32 = tonumber(account_id) / 2
	if (sid32 % 1 > 0) then
		return "STEAM_0:1:" .. math.floor(sid32)
	else
		return "STEAM_0:0:" .. sid32
	end
end

function GAS:AccountIDToSteamID64(account_id)
	return util.SteamIDTo64(GAS:AccountIDToSteamID(account_id))
end

--######## MISC ########--

function GAS:IsIPAddress(ip_address, forbid_port)
	local v1,v2,v3,v4,port = ip_address:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)(.*)")
	return
		(v1 ~= nil and (v1 == "0" or (not v1:find("^0") and tonumber(v1) >= 1 and tonumber(v1) <= 255))) and
		(v2 ~= nil and (v2 == "0" or (not v2:find("^0") and tonumber(v2) >= 1 and tonumber(v2) <= 255))) and
		(v3 ~= nil and (v3 == "0" or (not v3:find("^0") and tonumber(v3) >= 1 and tonumber(v3) <= 255))) and
		(v4 ~= nil and (v4 == "0" or (not v4:find("^0") and tonumber(v4) >= 1 and tonumber(v4) <= 255))) and
		(
			(forbid_port == true and (port == nil or #port == 0)) or
			
			(not forbid_port and (
					(port == nil or #port == 0) or
					(port ~= nil and #port > 1 and #port <= 6 and port:sub(1,1) == ":" and
						(port:sub(2) == "0" or
							(tonumber(port:sub(2)) ~= nil and not port:sub(2):find("^0") and tonumber(port:sub(2)) >= 0 and tonumber(port:sub(2)) <= 65535)
						)
					)
				)
			)
		)
end

function GAS:BoolToBit(bool)
	if (bool == true) then
		return 1
	elseif (bool == false) then
		return 0
	end
end
function GAS:BitToBool(bit)
	if (tonumber(bit) == 1) then
		return true
	elseif (tonumber(bit) == 0) then
		return false
	end
end

function GAS:Unvectorize(vec)
	if (vec.r and vec.g and vec.b) then
		local vec_a = ""
		if (vec.a and vec.a ~= 255) then
			vec_a = "," .. vec.a
		end
		return vec.r .. "," .. vec.g .. "," .. vec.b .. vec_a
	elseif (vec.p and vec.y and vec.r) then
		return vec.p .. "," .. vec.y .. "," .. vec.r
	elseif (vec.x and vec.y and vec.z) then
		return vec.x .. "," .. vec.y .. "," .. vec.z
	end
end

function GAS:SetClipboardText(text)
	SetClipboardText(text)
	GAS:PlaySound("confirmed")
	bVGUI.MouseInfoTooltip.Create(GAS:Phrase("copied"))
end

function GAS:OpenURL(url)
	GAS:PlaySound("popup")
	gui.OpenURL(url)
end

function GAS:table_Flip(tbl)
	local new_tbl = {}
	for i,v in pairs(tbl) do
		new_tbl[v] = i
	end
	return new_tbl
end

function GAS:table_IsEmpty(tbl)
	return next(tbl) == nil
end

function GAS:table_ValuesFromKey(tab, key)
	local res = {}
	for k, v in pairs( tab ) do
		if ( v[ key ] ~= nil ) then res[ #res + 1 ] = v[ key ] end
	end
	return res
end

function GAS:table_RemoveEmptyChildren(tbl, tbl_key, parent_tbl)
	for k,v in pairs(tbl) do
		if (type(v) == "table") then
			if (GAS:table_IsEmpty(v)) then
				tbl[k] = nil
				if (tbl_key ~= nil and parent_tbl ~= nil and GAS:table_IsEmpty(tbl)) then
					parent_tbl[tbl_key] = nil
				end
			else
				tbl[k] = GAS:table_RemoveEmptyChildren(v, k, tbl)
			end
		end
	end
	if (GAS:table_IsEmpty(tbl)) then
		if (tbl_key == nil and parent_tbl == nil) then
			return {}
		else
			return nil
		end
	else
		return tbl
	end
end

function GAS:utf8_force_strip(str)
	return (utf8.force(str):gsub("�", ""))
end

--######## LUA FUNCTIONS ########--

function GAS:RunLuaFunction(lua_func_name, ...)
	if (not GAS.LuaFunctions[lua_func_name]) then
		GAS:print("Tried to run a Lua function that doesn't exist! (" .. lua_func_name .. ")", GAS.PRINT_ERROR)
	else
		return GAS.LuaFunctions[lua_func_name](...)
	end
end

--######## TEAM HELPERS ########--

local indexed_teams = {}
function GAS:TeamFromName(team_name)
	if (indexed_teams[team_name] ~= nil) then
		return indexed_teams[indexed_teams]
	else
		for i,v in pairs(team.GetAllTeams()) do
			if (v.Name == team_name) then
				indexed_teams[i] = v.Name
				return i
			end
		end
	end
end

--######## SOUND ########--

local sounds = {alert = "gmodadminsuite/alert.mp3"}
function GAS:PlaySound(sound_name)
	surface.PlaySound(sounds[sound_name] or "gmodadminsuite/" .. sound_name .. ".ogg")
end

--######## MARKUP HELPERS ########--

function GAS:MarkupToPlaintext(str)
	str = tostring(str)
	if (markup and markup.ToPlaintext) then
		return markup.ToPlaintext(str)
	else
		return (str:gsub("</?%a+=?.->",""))
	end
end

function GAS:EscapeMarkup(str)
	str = tostring(str)
	if (markup and markup.Escape) then
		return markup.Escape(str)
	else
		return (str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
	end
end

local special_markdown_chars = {"\\","`","*","_","{","}","[","]","(",")","#","+","-",".","!"}
function GAS:EscapeMarkdown(str)
	for _,v in ipairs(special_markdown_chars) do
		str = (str:gsub("%" .. v, "\\" .. v))
	end
	return str
end

function GAS:EscapeJSON(str)
	return (str:gsub("\\", "\\\\"):gsub('"', '\\"'))
end

--######## MySQL ########--

if (SERVER) then
	GAS:EndHeader()
	GAS:StartHeader("Database")
	if (GAS.Config.MySQL.Enabled == true) then
		GAS:HeaderPrint("MySQL enabled", GAS_PRINT_TYPE_INFO)
		local mysqloo_installed = false
		if (system.IsLinux() or system.IsWindows()) then
			local module_name = system.IsLinux() and (jit.arch == "x64" and "gmsv_mysqloo_linux64.dll" or "gmsv_mysqloo_linux.dll") or (jit.arch == "x64" and "gmsv_mysqloo_win64.dll" or "gmsv_mysqloo_win32.dll")
			if (file.Exists("lua/bin/" .. module_name, "GAME")) then
				mysqloo_installed = true
			else
				GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "You do not have the required MySQLOO module installed on your server (lua/bin/" .. module_name .. ") MySQLOO is required to communicate with your MySQL Server.\n", {Link = "https://github.com/FredyH/MySQLOO#install-instructions"})
			end
		else
			GAS.BillysErrors:AddMessage(BillysErrors.IMPORTANCE_FATAL, "You must be running Linux or Windows to use MySQL and its required module, MySQLOO.\n", {Link = "https://github.com/FredyH/MySQLOO#install-instructions"})
		end
		if (mysqloo_installed) then
			GAS:HeaderPrint("MySQLOO is installed!", GAS_PRINT_COLOR_GOOD, GAS_PRINT_TYPE_INFO)
		else
			return
		end
	else
		GAS:HeaderPrint("MySQL disabled, using local server database", GAS_PRINT_TYPE_INFO)
	end

	include("sv_database.lua")
	GAS:EndHeader()
else
	GAS:EndHeader()
end

--######## NETWORKING ########--

include("sh_networking.lua")

--######## HOOKING ########--

function GAS:hook(event, identifier, func)
	GAS:unhook(event, identifier)
	hook.Add(event, "gmodadminsuite:" .. identifier, func)
end
function GAS:unhook(event, identifier)
	hook.Remove(event, "gmodadminsuite:" .. identifier)
end

if (SERVER) then include("gmodadminsuite/sv_hooks.lua") end

--######## TIMERS ########--

function GAS:timer(name, ...)
	GAS:untimer(name)
	timer.Create("gmodadminsuite:" .. name, ...)
end
function GAS:untimer(name)
	timer.Remove("gmodadminsuite:" .. name)
end

--######## CONFIGS ########--

if (not file.IsDir("gmodadminsuite/configs", "DATA")) then
	file.CreateDir("gmodadminsuite/configs", "DATA")
end
if (SERVER) then
	GAS:netInit("getconfig")
	GAS:netInit("uncacheconfig")

	function GAS:DeleteConfig(config_name)
		file.Delete("gmodadminsuite/configs/" .. config_name .. ".txt")
		GAS.ConfigCache[config_name] = nil
	end

	GAS.ConfigCache = {}
	function GAS:GetConfig(config_name, default_config)
		if (GAS.ConfigCache[config_name]) then return GAS.ConfigCache[config_name] end
		if (file.Exists("gmodadminsuite/configs/" .. config_name .. ".txt", "DATA")) then
			local config = file.Read("gmodadminsuite/configs/" .. config_name .. ".txt", "DATA")
			if (config) then
				config = GAS:DeserializeTable(config)
				if (config) then
					GAS.ConfigCache[config_name] = config
					return config
				end
			end
			GAS:print("Failed to load config: " .. config_name .. "; reverting to default config.", GAS_PRINT_COLOR_BAD, GAS_PRINT_TYPE_FAIL)
			GAS.BillysErrors:AddMessage({"Failed to load config: " .. config_name .. "; reverting to default config."})
		end
		if (default_config) then
			GAS:SaveConfig(config_name, default_config)
			return default_config
		end
	end
	function GAS:SaveConfig(config_name, config)
		GAS.ConfigCache[config_name] = config

		local serialized_config = GAS:SerializeTable(config)

		file.Write("gmodadminsuite/configs/" .. config_name .. ".txt", serialized_config)

		GAS:netStart("uncacheconfig")
			net.WriteString(config_name)
		net.Broadcast()

		return config
	end

	GAS:netReceive("getconfig", function(ply)
		local config_name = net.ReadString()
		if (file.Exists("gmodadminsuite/configs/" .. config_name .. ".txt", "DATA")) then
			local data = util.Compress(file.Read("gmodadminsuite/configs/" .. config_name .. ".txt", "DATA"))
			local data_len = #data
			GAS:netStart("getconfig")
				net.WriteString(config_name)
				net.WriteUInt(data_len, 32)
				net.WriteData(data, data_len)
			net.Send(ply)
		end
	end)
else
	GAS.ConfigCache = {}

	GAS.ConfigCallbacks = {}
	function GAS:GetConfig(config_name, callback)
		if (callback) then
			GAS.ConfigCallbacks[config_name] = callback
		end
		if (GAS.ConfigCache[config_name]) then
			if (callback) then
				callback(GAS.ConfigCache[config_name])
			end
			return GAS.ConfigCache[config_name]
		end
		GAS:netStart("getconfig")
			net.WriteString(config_name)
		net.SendToServer()
	end
	GAS:netReceive("getconfig", function()
		local config_name = net.ReadString()
		local data_len = net.ReadUInt(32)
		local data = net.ReadData(data_len)
		data = util.Decompress(data)
		data = GAS:DeserializeTable(data)

		GAS.ConfigCache[config_name] = data

		GAS.ConfigCallbacks[config_name](data)
	end)

	GAS.LocalConfigCache = {}
	function GAS:GetLocalConfig(config_name, default_config)
		if (GAS.LocalConfigCache[config_name]) then return GAS.LocalConfigCache[config_name] end

		if (file.Exists("gmodadminsuite/configs/" .. config_name .. ".txt", "DATA")) then
			local config = file.Read("gmodadminsuite/configs/" .. config_name .. ".txt", "DATA")
			if (config) then
				config = GAS:DeserializeTable(config)
				if (config) then
					GAS.LocalConfigCache[config_name] = config
					return config
				end
			end
		end

		if (default_config) then
			GAS:SaveLocalConfig(config_name, default_config)
			return default_config
		end
	end
	function GAS:SaveLocalConfig(config_name, config)
		GAS.LocalConfigCache[config_name] = config
		file.Write("gmodadminsuite/configs/" .. config_name .. ".txt", GAS:SerializeTable(config))
		return config
	end

	function GAS:UncacheConfig(config_name)
		GAS.ConfigCache[config_name] = nil
	end
	GAS:netReceive("uncacheconfig", function()
		GAS:UncacheConfig(net.ReadString())
	end)
end

--######## SERIALIZATION ########--

GAS.von = include("gmodadminsuite/thirdparty/von.lua")
GAS.pon = include("gmodadminsuite/thirdparty/pon.lua")
GAS.spon = include("gmodadminsuite/thirdparty/spon.lua")
function GAS:SerializeTable(tbl)
	return GAS.von.serialize(tbl)
end
function GAS:DeserializeTable(tbl)
	local succ, r = pcall(GAS.von.deserialize, tbl)
	if (not succ) then
		return GAS.spon.decode(tbl)
	else
		return r
	end
end

--######## LANGUAGE ########--

include("gmodadminsuite/sh_language.lua")

--######## OFFLINE PLAYER DATA ########--

include("gmodadminsuite/sh_offline_player_data.lua")

--######## TEAMS ########--

include("gmodadminsuite/sh_teams.lua")

--######## STEAM API ########--

if (SERVER) then include("gmodadminsuite/sv_steam_avatar.lua") end

--######## AFK ########--

include("gmodadminsuite/sh_afk.lua")

--######## COUNTRY CODES ########--

if (CLIENT) then include("gmodadminsuite/cl_country_codes.lua") end


--######## COMMANDS ########--

local CmdRegistrations = {}
function GAS:RegisterCommand(text, module_name)
	if (GAS.Commands and GAS.Commands.Loaded) then
		GAS.Commands:RegisterCommand(text, module_name)
	else
		table.insert(CmdRegistrations, {text, module_name})
	end
end
GAS:hook("gmodadminsuite:Commands:Loaded", "CommandManagerLoaded", function()
	if (not CmdRegistrations) then return end
	for _,v in ipairs(CmdRegistrations) do
		GAS.Commands:RegisterCommand(unpack(v))
	end
	CmdRegistrations = nil
end)

--######## REGISTRY TABLES ########--

include("gmodadminsuite/sh_registry_tbl.lua")

--######## XEON ########--

if (SERVER) then include("gmodadminsuite/sv_xeon.lua") end

--######## INCLUDE FILES ########--

function GAS:Init()
	include("gmodadminsuite/sh_modules.lua")
	include("gmodadminsuite/sh_permissions.lua")

	if (CLIENT) then
		include("gmodadminsuite/cl_menubar.lua")
		include("gmodadminsuite/cl_contextmenu.lua")
		include("gmodadminsuite/cl_selection_prompts.lua")
		include("gmodadminsuite/cl_menu.lua")
	else
		include("gmodadminsuite/sv_menu.lua")
	end
end
GAS:Init()
--PATH lua/gmodadminsuite/sh_language.lua:
local function GmodLanguage(module_name)
	if (SERVER) then return "english" end
	local lang = GetConVar("gmod_language"):GetString()
	if (lang == "en") then return "english" end
	local module_name = module_name or "GAS"
	for lang_name, data in pairs(GAS.Languages.LanguageData[module_name]) do
		if (data.Flag == "flags16/" .. lang .. ".png") then
			return lang_name
		end
	end
	return "english"
end

GAS.Languages = {}

GAS.Languages.DefaultConfig = {
	SelectedLanguages = {},
	ShortDateFormat = false,
	LongDateFormat = false,
}

if (CLIENT) then
	GAS.Languages.Config = GAS:GetLocalConfig("languages", GAS.Languages.DefaultConfig)
else
	GAS.Languages.Config = table.Copy(GAS.Languages.DefaultConfig)
end

--######## LOAD LANGUAGE DATA ########--

GAS.Languages.LanguageData = {GAS = {}}

function GAS.Languages:LoadLanguageData()
	local languages = file.Find("gmodadminsuite/lang/*.lua", "LUA")
	for _,f in ipairs(languages) do
		local filename = (f:gsub("%.lua$",""))
		GAS.Languages.LanguageData["GAS"][filename] = include("gmodadminsuite/lang/" .. f)
		if (filename == "english" or GAS.Languages.Config.SelectedLanguages.GAS == filename) then
			GAS.Languages.LanguageData["GAS"][filename].Phrases = GAS.Languages.LanguageData["GAS"][filename].Phrases()
		end
	end

	local _,modules = file.Find("gmodadminsuite/modules/*", "LUA")
	for _,module in ipairs(modules) do
		local languages = file.Find("gmodadminsuite/modules/" .. module .. "/lang/*.lua", "LUA")
		if (#languages > 0) then
			GAS.Languages.LanguageData[module] = {}
			for _,f in ipairs(languages) do
				local filename = (f:gsub("%.lua$",""))
				GAS.Languages.LanguageData[module][filename] = include("gmodadminsuite/modules/" .. module .. "/lang/" .. f)
				if (filename == "english" or GAS.Languages.Config.SelectedLanguages[module] == filename) then
					GAS.Languages.LanguageData[module][filename].Phrases = GAS.Languages.LanguageData[module][filename].Phrases()
				end
			end
		end
	end
end
GAS.Languages:LoadLanguageData()

if (GAS.Languages.Config.SelectedLanguages.GAS == nil) then
	GAS.Languages.Config.SelectedLanguages.GAS = GmodLanguage()
end

--######## LANGUAGE FUNCTIONS ########--

function GAS.Languages:LanguageExists(language_name, module_name)
	return GAS.Languages.LanguageData[module_name or "GAS"][language_name] ~= nil
end

function GAS.Languages:GetSelectedLanguage(module_name)
	if (SERVER) then return "english" end
	if (not module_name) then
		if (GAS.Languages:LanguageExists(GAS.Languages.Config.SelectedLanguages.GAS)) then
			return GAS.Languages.Config.SelectedLanguages.GAS
		else
			return GmodLanguage()
		end
	else
		if (GAS.Languages.Config.SelectedLanguages[module_name] and GAS.Languages:LanguageExists(GAS.Languages.Config.SelectedLanguages[module_name], module_name)) then
			return GAS.Languages.Config.SelectedLanguages[module_name]
		elseif (GAS.Languages:LanguageExists(GAS.Languages.Config.SelectedLanguages.GAS, module_name)) then
			return GAS.Languages.Config.SelectedLanguages.GAS
		else
			return GmodLanguage(module_name)
		end
	end
end

function GAS.Languages:RawPhrase(str, module_name, discriminator)
	local selected_language = GAS.Languages:GetSelectedLanguage(module_name)
	local phrase_str
	if (isfunction(GAS.Languages.LanguageData[module_name or "GAS"][selected_language].Phrases)) then
		GAS.Languages.LanguageData[module_name or "GAS"][selected_language].Phrases = GAS.Languages.LanguageData[module_name or "GAS"][selected_language].Phrases()
	end
	if (discriminator) then
		phrase_str = GAS.Languages.LanguageData[module_name or "GAS"][selected_language].Phrases[discriminator][str]
	else
		phrase_str = GAS.Languages.LanguageData[module_name or "GAS"][selected_language].Phrases[str]
	end
	if (phrase_str) then
		return phrase_str
	elseif (selected_language ~= "english") then
		if (discriminator) then
			if (GAS.Languages.LanguageData[module_name or "GAS"]["english"].Phrases[discriminator] ~= nil) then
				return GAS.Languages.LanguageData[module_name or "GAS"]["english"].Phrases[discriminator][str] or str
			else
				return str
			end
		else
			return GAS.Languages.LanguageData[module_name or "GAS"]["english"].Phrases[str] or str
		end
	else
		return str
	end
end
function GAS:Phrase(str, module_name, discriminator)
	if (str == "module_name") then
		local friendly_name = GAS.Languages:RawPhrase(str, module_name)
		if (friendly_name == str) then
			return nil
		else
			return friendly_name
		end
	else
		return (GAS.Languages:RawPhrase(str, module_name, discriminator):gsub("\t",""))
	end
end
function GAS:PhraseFormat(str, module_name, ...)
	return GAS:Phrase(str, module_name):format(...)
end

--######## TIMESTAMP LOCALIZATION ########--

function GAS:FormatTimestamp(timestamp)
	if (GAS.Languages.Config.ShortDateFormat ~= false) then
		return os.date(GAS.Languages.Config.ShortDateFormat, timestamp)
	else
		if (CLIENT and (system.GetCountry() == "US" or system.GetCountry() == "CA")) then
			return os.date("%m/%d/%Y %I:%M:%S %p", timestamp)
		else
			return os.date("%d/%m/%Y %I:%M:%S %p", timestamp)
		end
	end
end
function GAS:FormatFullTimestamp(timestamp)
	if (GAS.Languages.Config.LongDateFormat ~= false) then
		return os.date(GAS.Languages.Config.LongDateFormat, timestamp)
	else
		if (CLIENT and (system.GetCountry() == "US" or system.GetCountry() == "CA")) then
			return os.date("%a %m/%d/%Y %I:%M:%S %p", timestamp)
		else
			return os.date("%a %d/%m/%Y %I:%M:%S %p", timestamp)
		end
	end
end
function GAS:SimplifySeconds(seconds)
	if (seconds < 60) then
		local sec = seconds
		local lang_str = "s_seconds"
		if (sec == 1) then lang_str = "s_second" end
		return GAS:PhraseFormat(lang_str, nil, sec)
	elseif (seconds < 3600) then
		local min = math.Round(seconds / 60)
		local lang_str = "s_minutes"
		if (min == 1) then lang_str = "s_minute" end
		return GAS:PhraseFormat(lang_str, nil, min)
	else
		local hour = math.Round(seconds / 60 / 60)
		local lang_str = "s_hours"
		if (hour == 1) then lang_str = "s_hour" end
		return GAS:PhraseFormat(lang_str, nil, hour)
	end
end
function GAS:SimplifyTimestamp(timestamp)
	local difference = os.time() - timestamp
	if (difference == 0) then
		return GAS:Phrase("just_now")
	elseif (difference < 60) then

		local sec = difference
		local lang_str = "seconds_ago"
		if (sec == 1) then lang_str = "second_ago" end
		return GAS:PhraseFormat(lang_str, nil, sec)

	elseif (difference < 3600) then

		local min = math.Round(difference / 60)
		local lang_str = "minutes_ago"
		if (min == 1) then lang_str = "minute_ago" end
		return GAS:PhraseFormat(lang_str, nil, min)

	elseif (difference < 86400) then

		local hour = math.Round(difference / 60 / 60)
		local lang_str = "hours_ago"
		if (hour == 1) then lang_str = "hour_ago" end
		return GAS:PhraseFormat(lang_str, nil, hour)

	else
		return GAS:FormatTimestamp(timestamp)
	end
end

if (SERVER) then
	local languages = file.Find("gmodadminsuite/lang/*.lua", "LUA")
	for _,f in ipairs(languages) do
		AddCSLuaFile("gmodadminsuite/lang/" .. f)
	end

	local _,modules = file.Find("gmodadminsuite/modules/*", "LUA")
	for _,module in ipairs(modules) do
		local languages = file.Find("gmodadminsuite/modules/" .. module .. "/lang/*.lua", "LUA")
		for _,f in ipairs(languages) do
			AddCSLuaFile("gmodadminsuite/modules/" .. module .. "/lang/" .. f)
		end
	end
end
--PATH lua/gmodadminsuite/lang/english.lua:
return {
	Name = "English",
	Flag = "flags16/gb.png",
	Phrases = function() return {

		open_menu                 = "Open Menu",
		menu_nopermission         = "Sorry, but you do not have permission to access the GmodAdminSuite menu.",
		menu_unknown_module       = "Sorry, but a module with that name is not installed or does not exist.",
		menu_disabled_module      = "Sorry, but that module is disabled.",
		menu_module_nopermission  = "Sorry, you don't have permission to access this module.",
		open_gas                  = "Open GmodAdminSuite",
		module_shortcut           = "Module Shortcut",
		module_reset_data		  = "Reset Module Position/Size",
		module_shortcut_info      = [[You can quickly access this GmodAdminSuite module through console and chat commands.

		To access the module through your console, type: %s
		To access the module through chat, type: %s

		Additionally, you can bind a key on your keyboard to a specific module.
		To do this, in your console, type: %s

		Make sure to replace KEY with a key on your keyboard of your choice.
		%s]],
		close                     = "Close",
		wiki                      = "Wiki",
		licensee                  = "Licensee",
		support                   = "Support",
		module_shop               = "Module Shop",
		welcome                   = "Welcome",
		operator                  = "Operator",
		script_page               = "Script Page",
		wiki                      = "Wiki",
		no_modules_available      = "No modules available!",
		no_modules_available_info = [[Sorry, but there aren't any GmodAdminSuite modules available for you to use.
		You may have insufficient permissions to use any, or none are enabled.]],
		custom_ellipsis           = "Custom...",
		usergroup_ellipsis        = "Usergroup...",
		steamid_ellipsis          = "SteamID...",
		enter_steamid_ellipsis    = "Enter SteamID...",
		by_distance               = "By Distance",
		by_usergroup              = "By Usergroup",
		by_team                   = "By Team",
		by_name                   = "By Name",
		right_click_to_focus      = "Right click to focus",
		unknown                   = "Unknown",
		utilities                 = "Utilities",
		player_management         = "Player Management",
		administration            = "Administration",
		s_second                  = "1 second",
		s_seconds                 = "%d seconds",
		s_minute                  = "1 minute",
		s_minutes                 = "%d minutes",
		s_hour                    = "1 hour",
		s_hours                   = "%d hours",
		second_ago                = "1 second ago",
		seconds_ago               = "%d seconds ago",
		minute_ago                = "1 minute ago",
		minutes_ago               = "%d minutes ago",
		hour_ago                  = "1 hour ago",
		hours_ago                 = "%d hours ago",
		just_now                  = "Just now",
		click_to_focus            = "Click to focus",
		right_click_to_focus      = "Right click to focus",
		add_steamid               = "Custom SteamID",
		copied                    = "Copied!",
		settings                  = "Settings",
		add_steamid_help          = [[Enter a SteamID or SteamID64. Examples:
		SteamID: %s
		SteamID64: %s]],

		setting_default_module = "Default Module",
		setting_default_module_tip = "What module should be opened when the GmodAdminSuite main menu is opened?",
		none = "None",
		general = "General",
		localization = "Localization",
		setting_menu_voicechat = "Allow speaking (voice chat)\nwhen GAS menus are open",
		setting_menu_voicechat_tip = "GmodAdminSuite's menus do not block your voice chat key. If this option is on, just press your voice chat key to talk whilst in a menu.",
		use_gas_language = "Use GmodAdminSuite language",
		default_format = "Default Format",
		short_date_format = "Short Date Format",
		long_date_format = "Long Date Format",
		short_date_format_tip = "Date format used for shorter date formats\n\nThe default format automatically matches the date format of your region (North America, Europe, etc.)",
		long_date_format_tip = "Date format used for longer date formats",
		permissions = "Permissions",
		module_enable_switch_tip = "Changes to this will only apply after a server restart/map change",
		enabled = "Enabled",
		modules = "Modules",
		permissions_help = [[GmodAdminSuite utilizes an open-source permissions library called OpenPermissions, which was developed by Billy for GAS. It provides optimized permissions handling for advanced systems running on any sized server.
		
		OpenPermissions is where you will control what groups can access what modules, and what they can do with those modules.
		It can be opened at any time by typing "!openpermissions" in chat or "openpermissions" in console.

		For help & info, click the "Help" tab in the OpenPermissions menu.]],
		website = "Website",
		fun = "Fun",

		bvgui_copied               = "Copied!",
		bvgui_open_context_menu    = "Open Context Menu",
		bvgui_open_steam_profile   = "Open Steam Profile",
		bvgui_right_click_to_focus = "Right click to focus",
		bvgui_click_to_focus       = "Click to focus",
		bvgui_unknown              = "Unknown",
		bvgui_no_data              = "No data",
		bvgui_no_results_found     = "No results found",
		bvgui_done                 = "Done",
		bvgui_enter_text_ellipsis  = "Enter text...",
		bvgui_loading_ellipsis     = "Loading...",
		bvgui_pin_tip              = "Press ESC to click the menu again",
		bvgui_click_to_render      = "Click to render",
		bvgui_teleport             = "Teleport",
		bvgui_inspecting           = "Inspecting",
		bvgui_inspect              = "Inspect",
		bvgui_screenshot           = "Screenshot",
		bvgui_ok                   = "OK",
		bvgui_screenshot_saved     = "Screenshot Saved",
		bvgui_screenshot_saved_to  = "The screenshot has been saved to %s on your computer",
		bvgui_reset                = "Reset",
		bvgui_right_click_to_stop_rendering = "Right click to stop rendering",

		settings_player_popup_close 		= "Close Player Popups when\nthey lose focus",
		settings_player_popup_close_tip	 	= "Should Player Popups close when you click on a different menu?"
} end }
--PATH lua/gmodadminsuite/modules/commands/sh_init.lua:
if (SERVER) then
	AddCSLuaFile("cl_commands.lua")
end

GAS.Commands = {}

GAS.Commands.ACTION_COMMANDS_MENU   = 0
GAS.Commands.ACTION_COMMAND         = 1
GAS.Commands.ACTION_CHAT            = 2
GAS.Commands.ACTION_WEBSITE         = 3
GAS.Commands.ACTION_TELEPORT        = 4
GAS.Commands.ACTION_LUA_FUNCTION_SV = 5
GAS.Commands.ACTION_LUA_FUNCTION_CL = 6
GAS.Commands.ACTION_GAS_MODULE      = 7

GAS:hook("gmodadminsuite:LoadModule:commands", "LoadModule:commands", function()
	if (SERVER) then
		include("gmodadminsuite/modules/commands/sv_commands.lua")
		include("gmodadminsuite/modules/commands/sv_permissions.lua")
	else
		include("gmodadminsuite/modules/commands/cl_commands.lua")
	end
end)
--PATH addons/sl_utils/lua/autorun/guigui_handcuffs_lang.lua:
Handcuffs = Handcuffs or {}

Handcuffs.lang = GetConVar("gmod_language"):GetString()

function guigui_handcuff_lang()
	for k, v in pairs(Handcuffs.langTable) do
		if k == Handcuffs.lang then
			return v
		end
	end
	return Handcuffs.langTable.en
end

Handcuffs.langTable = {
	["fr"] = {
		["PrintName"] = "Menottes", 
		["Instructions"] = "Clic gauche pour menotter\nClic droit pour demenotter",
		["PrintName_Lockpick"] = "Pince coupante pour menottes",
		["Instructions_Lockpick"] = "Clic gauche pour casser les menottes", 
		["Cuffed"] = "Menotté", 
		["Uncuffed"] = "Demenotté", 
		["Handcuffed"] = "MENOTTÉ"
	}, 
	["en"] = {
		["PrintName"] = "Handcuffs", 
		["Instructions"] = "Left click to cuffed\nRight click to uncuffed", 
		["PrintName_Lockpick"] = "Handcuffs lockpick", 
		["Instructions_Lockpick"] = "Left click to break handcuffs", 
		["Cuffed"] = "Cuffed", 
		["Uncuffed"] = "Unuffed", 
		["Handcuffed"] = "HANDCUFFED"
	}
}
--PATH lua/autorun/klk_nb_sounds.lua:
-- Funny Stuff --
---------------------------------------------------------------------------------------------------------------------------------------------
local FootstepSFXDist = 75
local WeapLightSFXDist = 90
local WeapHeavySFXDist = 110
local WeapUltiSFXDist = 140
local DmgLightSFXDist = 90
local DmgHeavySFXDist = 110
local DmgUltiSFXDist = 140
local VocalSFXDistance = 90
---------------------------------------------------------------------------------------------------------------------------------------------
function CreateSingleSound(SNDCHAN,SNDNAME,SNDLEV,SNDPATH,SNDVOL,SNDPMIN,SNDPMAX)
	sound.Add({
		channel = SNDCHAN,
		name = SNDNAME,
		level = SNDLEV,
		sound = SNDPATH,
		volume = SNDVOL,
		pitch = {SNDPMIN, SNDPMAX}
	})
end
---------------------------------------------------------------------------------------------------------------------------------------------
function CreateMultiSounds(SNDCHAN,SNDNAME,SMINNUM,SMAXNUM,SNDLEV,SNDPATH,SNDVOL,SNDPMIN,SNDPMAX)
	for SoundNum = SMINNUM, SMAXNUM do
		sound.Add({
			channel = SNDCHAN,
			name = SNDNAME..SoundNum,
			level = SNDLEV,
			sound = SNDPATH..SoundNum..".wav",
			volume = SNDVOL,
			pitch = {SNDPMIN, SNDPMAX}
		})
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
--== [Ryuko Matoi Vocals] ==-- 

-- (Challenge/Alert)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Challenge",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_CHALLENGE_1.wav","klk/ryuko/vox/single/RYU_CHALLENGE_2.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.Ryuko.FinisherTheme",
	level = 0,
	sound = {"klk/ryuko/sfx/FinisherTheme_01.wav","klk/ryuko/sfx/FinisherTheme_02.wav"},
	volume = 1,
	pitch = {100,100}
})
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.Ryuko.TransformTheme",
	level = 0,
	sound = {"klk/ryuko/sfx/beforemybloodisdry_01.wav","klk/ryuko/sfx/beforemybloodisdry_02.wav","klk/ryuko/sfx/beforemybloodisdry_03.wav","klk/ryuko/sfx/beforemybloodisdry_04.wav","klk/ryuko/sfx/beforemybloodisdry_05.wav"},
	volume = 1,
	pitch = {100,100}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.Transform",90,"klk/ryuko/vox/single/RYU_KAMUI_TRANSFORM.wav",1,98,102)
--CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.TransformTheme",0,"klk/ryuko/sfx/beforemybloodisdry.wav",1,100,100)
--CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.FinisherTheme",0,"klk/ryuko/sfx/FinisherTheme.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.ValorModeTheme",0,"klk/ryuko/sfx/ValorModeTheme.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.DefeatTheme",0,"klk/ryuko/sfx/defeattheme.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.UnchallengedTheme",0,"klk/ryuko/sfx/UnchallengedTheme.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.TriumphantTheme",0,"klk/ryuko/sfx/triumphanttheme.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.LosingThemeShort",0,"klk/ryuko/sfx/losingthemeshort.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.Ryuko.LosingThemeLong",0,"klk/ryuko/sfx/losingthemelong.wav",1,100,100)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.ValorAura",110,"klk/commonsfx/finisheraura.wav",1,100,100)

--= Attacks =--
-- (Hand to Hand)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.H2H",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/BT_011_RYU_ATTACK_1.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_2.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_3.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_4.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_5.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_6.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_7.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_8.wav","klk/ryuko/vox/single/BT_011_RYU_ATTACK_9.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.ShoulderTackle",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_SHOULDERTACKLE_1.wav","klk/ryuko/vox/single/RYU_ATTACK_SHOULDERTACKLE_2.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.LeftStraight",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_LEFTSTRAIGHT_01.wav","klk/ryuko/vox/single/RYU_ATTACK_LEFTSTRAIGHT_02.wav","klk/ryuko/vox/single/RYU_ATTACK_LEFTSTRAIGHT_03.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Light Slash)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Attack",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/VOI_011_RYU_ATTACK_1.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_2.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_3.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_4.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_5.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_6.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_7.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACK_8.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Heavy Slash)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.AttackHeavy",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/VOI_011_RYU_ATTACKHEAVY_1.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACKHEAVY_2.wav","klk/ryuko/vox/single/VOI_011_RYU_ATTACKHEAVY_3.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Light Range Attack)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.RangeLight",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_RANGE_LIGHT_01.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_02.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_03.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_04.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_05.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_06.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_07.wav","klk/ryuko/vox/single/RYU_RANGE_LIGHT_08.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Medium Range Attack)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.RangeMedium",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_RANGE_MEDIUM_01.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_02.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_03.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_04.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_05.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_06.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_07.wav","klk/ryuko/vox/single/RYU_RANGE_MEDIUM_08.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Heavy Range Attack)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.RangeHeavy",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_RANGE_HEAVY_01.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_02.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_03.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_04.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_05.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_06.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_07.wav","klk/ryuko/vox/single/RYU_RANGE_HEAVY_08.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Valor Burst)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.ValorBurst",
	level = 140,
	sound = {"klk/ryuko/vox/single/RYU_BURST_1.wav","klk/ryuko/vox/single/RYU_BURST_2.wav","klk/ryuko/vox/single/RYU_BURST_3.wav","klk/ryuko/vox/single/RYU_BURST_4.wav","klk/ryuko/vox/single/RYU_BURST_5.wav","klk/ryuko/vox/single/RYU_BURST_6.wav","klk/ryuko/vox/single/RYU_BURST_7.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Ranged Attacks)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.SlashWave1",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_SLASHWAVE_1.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.SlashWave2",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_SLASHWAVE_2.wav",1,98,102)

-- (Special Attacks)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.AmbushSlice",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_AMBUSHSLICE_01.wav","klk/ryuko/vox/single/RYU_ATTACK_AMBUSHSLICE_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Cleaver",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_CLEAVER_01.wav","klk/ryuko/vox/single/RYU_ATTACK_CLEAVER_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Cross",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_CROSS_01.wav","klk/ryuko/vox/single/RYU_ATTACK_CROSS_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.DecapStart",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_DMKMTC_START.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.DecapIntro",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_DMKMTC_INTRO.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.DecapSlash",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_DMKMTC_SLASH_01.wav","klk/ryuko/vox/single/RYU_ATTACK_DMKMTC_SLASH_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.DragonLaunch",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_DRAGON_LAUNCH.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.DragonKick",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_DRAGON_KICK.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.FanBladeStart",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_FANBLADE_START.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.FanBladePunch",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_FANBLADE_PUNCH_01.wav","klk/ryuko/vox/single/RYU_ATTACK_FANBLADE_PUNCH_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.FinisherStart",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_FINISHER_START.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.FinisherSlash",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_FINISHER_SLASH_01.wav","klk/ryuko/vox/single/RYU_ATTACK_FINISHER_SLASH_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.FinisherEnd",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_FINISHER_END.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.Frenzy",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_FRENZY.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.FrenzyOverhead",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_FRENZY_OVERHEAD_01.wav","klk/ryuko/vox/single/RYU_ATTACK_FRENZY_OVERHEAD_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.FrontKick",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_FRONTKICK_01.wav","klk/ryuko/vox/single/RYU_ATTACK_FRONTKICK_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.Headbutt",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_HEADBUTT.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.HomerunStart",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_HOMERUN_START.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.HomerunEnd",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_HOMERUN_END_01.wav","klk/ryuko/vox/single/RYU_ATTACK_HOMERUN_END_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.KMTC-Slice",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_KMTC_SLICE.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.KMTC-Triple",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_KMTC_TRIPLE_01.wav","klk/ryuko/vox/single/RYU_ATTACK_KMTC_TRIPLE_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Raid",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_RAID_01.wav","klk/ryuko/vox/single/RYU_ATTACK_RAID_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Rampant",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_RAMPANT_01.wav","klk/ryuko/vox/single/RYU_ATTACK_RAMPANT_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.RipperStart",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_RIPPER_START.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.RipperCharge",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_RIPPER_CHARGE.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.RipperSlash",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_RIPPER_SLASH_01.wav","klk/ryuko/vox/single/RYU_ATTACK_RIPPER_SLASH_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Shear",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_SHEAR_01.wav","klk/ryuko/vox/single/RYU_ATTACK_SHEAR_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.ShockwaveH1",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_SHOCKWAVE_H1.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.ShockwaveH2",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_SHOCKWAVE_H2_01.wav","klk/ryuko/vox/single/RYU_ATTACK_SHOCKWAVE_H2_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.ShockwaveL",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_SHOCKWAVE_L.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.Snippit",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_SNIPPET.wav",1,98,102)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.SplitDemon",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_SPLITDEMON_01.wav","klk/ryuko/vox/single/RYU_ATTACK_SPLITDEMON_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Uppercut",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_UPPERCUT_01.wav","klk/ryuko/vox/single/RYU_ATTACK_UPPERCUT_02.wav","klk/ryuko/vox/single/RYU_ATTACK_UPPERCUT_03.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.UppercutLaunch",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_UPPERCUT_LAUNCH_01.wav","klk/ryuko/vox/single/RYU_ATTACK_UPPERCUT_LAUNCH_02.wav"},
	volume = 1,
	pitch = {98,102}
})

-- (Taunting)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt1",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-1_01.wav","klk/ryuko/vox/single/RYU_TAUNT-1_02.wav","klk/ryuko/vox/single/RYU_TAUNT-1_03.wav","klk/ryuko/vox/single/RYU_TAUNT-1_04.wav","klk/ryuko/vox/single/RYU_TAUNT-1_05.wav","klk/ryuko/vox/single/RYU_TAUNT-1_06.wav","klk/ryuko/vox/single/RYU_TAUNT-1_07.wav","klk/ryuko/vox/single/RYU_TAUNT-1_08.wav","klk/ryuko/vox/single/RYU_TAUNT-1_09.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt2",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-2_01.wav","klk/ryuko/vox/single/RYU_TAUNT-2_02.wav","klk/ryuko/vox/single/RYU_TAUNT-2_03.wav","klk/ryuko/vox/single/RYU_TAUNT-2_04.wav","klk/ryuko/vox/single/RYU_TAUNT-2_05.wav","klk/ryuko/vox/single/RYU_TAUNT-2_06.wav","klk/ryuko/vox/single/RYU_TAUNT-2_07.wav","klk/ryuko/vox/single/RYU_TAUNT-2_08.wav","klk/ryuko/vox/single/RYU_TAUNT-2_09.wav","klk/ryuko/vox/single/RYU_TAUNT-2_10.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt4",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-4_01.wav","klk/ryuko/vox/single/RYU_TAUNT-4_02.wav","klk/ryuko/vox/single/RYU_TAUNT-4_03.wav","klk/ryuko/vox/single/RYU_TAUNT-4_04.wav","klk/ryuko/vox/single/RYU_TAUNT-4_05.wav","klk/ryuko/vox/single/RYU_TAUNT-4_06.wav","klk/ryuko/vox/single/RYU_TAUNT-4_07.wav","klk/ryuko/vox/single/RYU_TAUNT-4_08.wav","klk/ryuko/vox/single/RYU_TAUNT-4_09.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt5",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-5_01.wav","klk/ryuko/vox/single/RYU_TAUNT-5_02.wav","klk/ryuko/vox/single/RYU_TAUNT-5_03.wav","klk/ryuko/vox/single/RYU_TAUNT-5_04.wav","klk/ryuko/vox/single/RYU_TAUNT-5_05.wav","klk/ryuko/vox/single/RYU_TAUNT-5_06.wav","klk/ryuko/vox/single/RYU_TAUNT-5_07.wav","klk/ryuko/vox/single/RYU_TAUNT-5_08.wav","klk/ryuko/vox/single/RYU_TAUNT-5_09.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt6",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-6_01.wav","klk/ryuko/vox/single/RYU_TAUNT-6_02.wav","klk/ryuko/vox/single/RYU_TAUNT-6_03.wav","klk/ryuko/vox/single/RYU_TAUNT-6_04.wav","klk/ryuko/vox/single/RYU_TAUNT-6_05.wav","klk/ryuko/vox/single/RYU_TAUNT-6_06.wav","klk/ryuko/vox/single/RYU_TAUNT-6_07.wav","klk/ryuko/vox/single/RYU_TAUNT-6_08.wav","klk/ryuko/vox/single/RYU_TAUNT-6_09.wav","klk/ryuko/vox/single/RYU_TAUNT-6_10.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt7-Intro",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-7_INTRO_01.wav","klk/ryuko/vox/single/RYU_TAUNT-7_INTRO_02.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Taunt7-Outro",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_01.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_02.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_03.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_04.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_05.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_06.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_07.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_08.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_09.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_10.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_11.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_12.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_13.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_14.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_15.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_16.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_17.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_18.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_19.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_20.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_21.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_22.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_23.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_24.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_25.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_26.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_27.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_28.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_29.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_30.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_31.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_32.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_33.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_34.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_35.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_36.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_37.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_38.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_39.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_40.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_41.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_42.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_43.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_44.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_45.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_46.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_47.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_48.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_49.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_50.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_51.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_52.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_53.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_54.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_55.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_56.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_57.wav","klk/ryuko/vox/single/RYU_TAUNT-7_OUTRO_58.wav"},
	volume = 1,
	pitch = {98,102}
})

-- Movement (Hopping/Jumping)
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Jump",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/BT_011_RYU_HOP_1.wav","klk/ryuko/vox/single/BT_011_RYU_HOP_2.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.DashAir",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/RYU_ATTACK_DASHAIR_01.wav","klk/ryuko/vox/single/RYU_ATTACK_DASHAIR_02.wav"},
	volume = 1,
	pitch = {98,102}
})
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.DashAirSlow",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_DASHAIR_SLOW.wav",1,98,102)
CreateSingleSound(CHAN_VOICE,"KLK-IF.Ryuko.DashAirDragon",VocalSFXDistance,"klk/ryuko/vox/single/RYU_ATTACK_DASHAIR_DRAGON.wav",1,98,102)

-- Pain
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.PainLight",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/BT_011_RYU_PAIN_1.wav","klk/ryuko/vox/single/BT_011_RYU_PAIN_2.wav","klk/ryuko/vox/single/BT_011_RYU_PAIN_3.wav","klk/ryuko/vox/single/BT_011_RYU_PAIN_4.wav","klk/ryuko/vox/single/BT_011_RYU_PAIN_5.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.PainHeavy",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/BT_011_RYU_KNOCKED_1.wav","klk/ryuko/vox/single/BT_011_RYU_KNOCKED_2.wav","klk/ryuko/vox/single/BT_011_RYU_KNOCKED_3.wav","klk/ryuko/vox/single/BT_011_RYU_KNOCKED_4.wav"},
	volume = 1,
	pitch = {98,102}
})
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Recover",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/BT_011_RYU_RECOVER_1.wav","klk/ryuko/vox/single/BT_011_RYU_RECOVER_2.wav","klk/ryuko/vox/single/BT_011_RYU_RECOVER_3.wav"},
	volume = 1,
	pitch = {98,102}
})

-- Defeat
sound.Add({
	channel = CHAN_VOICE,
	name = "KLK-IF.Ryuko.Defeat",
	level = VocalSFXDistance,
	sound = {"klk/ryuko/vox/single/BT_011_RYU_DEFEAT_1.wav","klk/ryuko/vox/single/BT_011_RYU_DEFEAT_2.wav","klk/ryuko/vox/single/BT_011_RYU_DEFEAT_3.wav"},
	volume = 1,
	pitch = {98,102}
})

---------------------------------------------------------------------------------------------------------------------------------------------
--== [Ryuko Matoi Special SFX] ==-- 
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.SpecialSFX.Tornado",
	level = 140,
	sound = {"klk/ryuko/sfx/Ryuko_Tornado_1.wav","klk/ryuko/sfx/Ryuko_Tornado_2.wav","klk/ryuko/sfx/Ryuko_Tornado_3.wav","klk/ryuko/sfx/Ryuko_Tornado_4.wav","klk/ryuko/sfx/Ryuko_Tornado_5.wav","klk/ryuko/sfx/Ryuko_Tornado_6.wav","klk/ryuko/sfx/Ryuko_Tornado_7.wav","klk/ryuko/sfx/Ryuko_Tornado_8.wav","klk/ryuko/sfx/Ryuko_Tornado_9.wav","klk/ryuko/sfx/Ryuko_Tornado_10.wav","klk/ryuko/sfx/Ryuko_Tornado_11.wav","klk/ryuko/sfx/Ryuko_Tornado_12.wav"},
	volume = 1,
	pitch = {95,105}
})
---------------------------------------------------------------------------------------------------------------------------------------------
--== [Common] ==-- 

--= Attack Sounds =--
-- (Hand to Hand)
CreateMultiSounds(CHAN_ITEM,"KLK-IF.AttackSFX.Martial",1,3,WeapLightSFXDist,"klk/commonsfx/AttackSE_Martial_",1,95,105)

-- (Slash)
CreateMultiSounds(CHAN_ITEM,"KLK-IF.AttackSFX.Slash",1,3,WeapLightSFXDist,"klk/commonsfx/AttackSE_Weapon_",1,95,105)
CreateSingleSound(CHAN_ITEM,"KLK-IF.AttackSFX.BKZSlash",WeapLightSFXDist,"klk/satsuki/sfx/SATSE_Bakuzan.wav",1,95,105)

-- (Energy Attacks)
CreateSingleSound(CHAN_STATIC,"KLK-IF.AttackSFX.SlashWave",WeapLightSFXDist,"klk/commonsfx/HitSE_Energy_A.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.AttackSFX.ShockWave",WeapHeavySFXDist,"klk/commonsfx/HitSE_Energy_B.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.AttackSFX.RampantBlade",WeapHeavySFXDist,"klk/ryuko/sfx/RYUSE_Koudan.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.AttackSFX.EnergyExp",DmgLightSFXDist,"klk/commonsfx/HitSE_Energy_C.wav",1,95,105)

--= Hit Sounds =--
-- (Hand to Hand)
CreateMultiSounds(CHAN_STATIC,"KLK-IF.HitSFX.Martial",1,3,DmgLightSFXDist,"klk/commonsfx/HitSE_Blow_",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.HitSFX.Kick",DmgLightSFXDist,"klk/commonsfx/HitSE_GetaKick.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.HitSFX.MartialCrit",140,"klk/commonsfx/HitSE_Blow_Finish.wav",1,98,102)

-- (Slash)
CreateMultiSounds(CHAN_STATIC,"KLK-IF.HitSFX.Slash",1,3,DmgLightSFXDist,"klk/commonsfx/HitSE_Slash_",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.HitSFX.Launched",140,"klk/commonsfx/DownSE_Blow.wav",1,98,102)
CreateSingleSound(CHAN_STATIC,"KLK-IF.HitSFX.SlashCrit",140,"klk/commonsfx/HitSE_Slash_Finish.wav",1,98,102)

-- (Energy Attacks)
CreateSingleSound(CHAN_STATIC,"KLK-IF.HitSFX.Energy",DmgHeavySFXDist,"klk/commonsfx/HitSE_Energy_Ex.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.HitSFX.Rampant",DmgHeavySFXDist,"klk/ryuko/sfx/RYUSE_Koudan_Attack.wav",1,95,105)

--= Special Sounds =--
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.Initiate",WeapHeavySFXDist,"klk/ryuko/sfx/RyukoInitiate.wav",1,98,102)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.Transform",90,"klk/ryuko/sfx/RyukoTransform.wav",1,98,102)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.ChestBurst",90,"klk/ryuko/sfx/RyukoChestBurst.wav",1,98,102)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.GarterSnap",WeapLightSFXDist,"klk/ryuko/sfx/RYUSE_GarterSnap.wav",1,95,105)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.ValorCharge",DmgUltiSFXDist,"klk/commonsfx/BarstSE_Charge.wav",1,95,105)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.ValorBurst",DmgUltiSFXDist,"klk/commonsfx/BarstSE_Attack.wav",1,95,105)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.SpecialSFX.Shiny",WeapHeavySFXDist,"klk/commonsfx/AttackSE_Kira.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.Homerun",140,"klk/ryuko/sfx/RYUSE_Homer.wav",1,98,102)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.Boosters",WeapHeavySFXDist,"klk/ryuko/sfx/RYUSE_Boost.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.Rockets",140,"klk/ryuko/sfx/RyukoBoosters.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.RocketsMini",140,"klk/ryuko/sfx/RyukoBoostersMini.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.RocketsFinisher",140,"klk/ryuko/sfx/RyukoFinisherRockets.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.SteamRelease",70,"klk/ryuko/sfx/senketsu_steam.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.WeapSwitch",70,"klk/ryuko/sfx/RYUSE_Change_A.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.ChallengeStart",140,"klk/commonsfx/Battle_Start.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.AuraRelease",140,"klk/commonsfx/Get_Ready.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.FinisherConnect",140,"klk/commonsfx/HitSE_Itigeki_Finish.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.DecapSwitch",90,"klk/ryuko/sfx/RYUSE_Entry_2.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.Holster",90,"klk/ryuko/sfx/RyukoHolster.wav",1,98,102)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.Brandish",90,"klk/ryuko/sfx/RYUSE_Entry_2.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.SpecialSFX.GloveStretch",WeapLightSFXDist,"klk/satsuki/sfx/SATSE_GloveStretch.wav",1,95,105)
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.SpecialSFX.TitleCard",
	level = 0,
	sound = {"klk/commonsfx/DEMOSE_Moji.wav"},
	volume = 1,
	pitch = {95,105}
})

--= Guard/Blocking =--
-- (Initiate Guard)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.GuardSFX.Init",WeapHeavySFXDist,"klk/commonsfx/GuardSE.wav",1,95,105)

-- (Blocking Damage)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.GuardSFX.Block",WeapHeavySFXDist,"klk/commonsfx/GuardSE_Hit.wav",1,85,115)
CreateSingleSound(CHAN_STATIC,"KLK-IF.GuardSFX.Parry",WeapHeavySFXDist,"klk/commonsfx/OffsetSE.wav",1,85,115)

-- (Taking Damage)
CreateSingleSound(CHAN_WEAPON,"KLK-IF.PainSFX.ArmorHit",DmgLightSFXDist,"klk/commonsfx/Armor_Hit.wav",1,95,105)
CreateSingleSound(CHAN_STATIC,"KLK-IF.PainSFX.ArmorBreak",DmgHeavySFXDist,"klk/commonsfx/Armor_Break.wav",1,95,105)

--= Movement =--
-- (Footsteps)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.Heel",FootstepSFXDist,"klk/commonsfx/MoveSE_Heel.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.Boots",FootstepSFXDist,"klk/commonsfx/MoveSE_Boots.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.StepShort",FootstepSFXDist,"klk/commonsfx/StepSE_Short.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.StepNormal",FootstepSFXDist,"klk/commonsfx/StepSE_Normal.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.StepLong",FootstepSFXDist,"klk/commonsfx/StepSE_Long.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.Slide",FootstepSFXDist,"klk/commonsfx/MoveSE_Slide.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.DashAir",FootstepSFXDist,"klk/commonsfx/DashSE_Air.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.DashGround",FootstepSFXDist,"klk/commonsfx/DashSE_Ground.wav",1,95,105)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.Collapse",FootstepSFXDist,"klk/commonsfx/DownSE_Hizakuzure.wav",1,95,105)

-- (Hopping/Jumping)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.Jump",WeapLightSFXDist,"klk/commonsfx/JumpSE_Common.wav",1,95,105)

-- (Landing)
CreateSingleSound(CHAN_BODY,"KLK-IF.Movement.Land",WeapHeavySFXDist,"klk/commonsfx/LandingSE_Common.wav",1,95,105)
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.Movement.LightStomp",
	level = 70,
	sound = {"klk/commonsfx/lightstomp_1.wav","klk/commonsfx/lightstomp_2.wav","klk/commonsfx/lightstomp_3.wav","klk/commonsfx/lightstomp_4.wav","klk/commonsfx/lightstomp_5.wav","klk/commonsfx/lightstomp_6.wav","klk/commonsfx/lightstomp_7.wav","klk/commonsfx/lightstomp_8.wav"},
	volume = 1,
	pitch = {95,105}
})
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.Movement.HeavyStomp",
	level = 140,
	sound = {"klk/commonsfx/heavystomp_1.wav","klk/commonsfx/heavystomp_2.wav","klk/commonsfx/heavystomp_3.wav","klk/commonsfx/heavystomp_4.wav"},
	volume = 1,
	pitch = {95,105}
})
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.Movement.LightSplash",
	level = 70,
	sound = {"klk/commonsfx/water_splash_01.wav","klk/commonsfx/water_splash_02.wav","klk/commonsfx/water_splash_03.wav","klk/commonsfx/water_splash_04.wav"},
	volume = 1,
	pitch = {95,105}
})
sound.Add({
	channel = CHAN_STATIC,
	name = "KLK-IF.Movement.HeavySplash",
	level = 140,
	sound = {"klk/commonsfx/water_explode_01.wav","klk/commonsfx/water_explode_02.wav","klk/commonsfx/water_explode_03.wav","klk/commonsfx/water_explode_04.wav"},
	volume = 1,
	pitch = {95,105}
})

---------------------------------------------------------------------------------------------------------------------------------------------

--Server Convars
CreateConVar("drg_killlakill_handicap",1,{FCVAR_ARCHIVE})
CreateConVar("drg_killlakill_plydmgmult",1,{FCVAR_ARCHIVE})
CreateConVar("drg_killlakill_parryamount",1,{FCVAR_ARCHIVE})
CreateConVar("drg_killlakill_valorlimit",0,{FCVAR_ARCHIVE})
CreateConVar("drg_killlakill_easymode",0,FCVAR_ARCHIVE,"Easy Modo")
CreateConVar("drg_killlakill_armor",0,FCVAR_ARCHIVE,"Disable Armor")
CreateConVar("drg_killlakill_regen",0,FCVAR_ARCHIVE,"Disable Health Regeneration")
CreateConVar("drg_killlakill_valormode",0,FCVAR_ARCHIVE, "Disable Valor Mode.")
CreateConVar("drg_killlakill_valorparry",0,FCVAR_ARCHIVE,"Disable Valor Parries")
CreateConVar("drg_killlakill_valorreset",0,FCVAR_ARCHIVE,"Disable Valor Reset")
CreateConVar("drg_killlakill_counterburst",0,FCVAR_ARCHIVE, "Disable Counter Bursts.")
CreateConVar("drg_killlakill_transform",0,FCVAR_ARCHIVE, "Disable Transformations.")
CreateConVar("drg_killlakill_music",0,FCVAR_ARCHIVE, "Disable All Music.")
CreateConVar("drg_killlakill_specials",0,FCVAR_ARCHIVE,"Disable Special Attacks")
CreateConVar("drg_killlakill_finisher",0,FCVAR_ARCHIVE,"Disable Finisher Attacks")
CreateConVar("drg_killlakill_alliance",0,FCVAR_ARCHIVE,"Enable Sisterly Bond")
CreateConVar("drg_killlakill_sparring",0,FCVAR_ARCHIVE, "Enable 'Friendly' Sparring")
CreateConVar("drg_killlakill_friendly",0,FCVAR_ARCHIVE,"Friendly to Players")
CreateConVar("drg_killlakill_clone",0,FCVAR_ARCHIVE,"Friendly to Doppelgangers")
CreateConVar("drg_killlakill_nuiskins",0,FCVAR_ARCHIVE,"Prioritize Nui's alternate skins")

CreateConVar("drg_killlakill_stuloyalty",0,FCVAR_ARCHIVE,"Disable Loyalty")
CreateConVar("drg_killlakill_stucoop",0,FCVAR_ARCHIVE, "Enable Cooperation.")
CreateConVar("drg_killlakill_stuclone",0,FCVAR_ARCHIVE,"Hostile to Doppelgangers")

CreateConVar("drg_killlakill_covlink",0,FCVAR_ARCHIVE,"Disable Link")
CreateConVar("drg_killlakill_covhivemind",0,FCVAR_ARCHIVE,"Hostile to other COVERS")

--Check if DRG is Installed...

if DrGBase then

AddCSLuaFile()

--Shared Convars

if CLIENT then

hook.Add("PopulateToolMenu", "DrGBaseKILLlaKILLMenu", function()

spawnmenu.AddToolMenuOption("DrGBase", "KILL la KILL", "drgbase_killlakill_settings", "General Settings", "", "", function(panel)
    panel:ClearControls()

    panel:ControlHelp("\nGeneral Settings")

    if game.SinglePlayer() or LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() then
		panel:NumSlider("Stat Handicap", "drg_killlakill_handicap",1,10,1)
		panel:ControlHelp("Divides the Starting Stats for all spawned KLK Nextbots.")
		panel:ControlHelp("Tweak as much as you want to get the Best Balanced Outcome.")
		panel:ControlHelp("Also Divides any Applied Bonuses from Valor Mode (if enabled).")
		
		panel:NumSlider("Player Damage Multiplier", "drg_killlakill_plydmgmult",1,20,1)
		panel:ControlHelp("Multiplies the amount of damage taken from Players for all KILL la KILL Nextbots (applied on newly spawned ones only).")
		
		panel:NumSlider("Starting Valor Parries", "drg_killlakill_parryamount",0,10,0)
		panel:ControlHelp("Designates the amount for how many parries they should start with (only works when Valor Parries are enabled).")
		
		panel:NumSlider("Valor Level Limit", "drg_killlakill_valorlimit",0,25,0)
		panel:ControlHelp("Designates the amount for how many valor levels they can achieve.")
		panel:ControlHelp("A stat of 0 will make them achieve limitless potential.")

		panel:CheckBox("Easy Modo", "drg_killlakill_easymode")
		panel:ControlHelp("Easy Modo?! Only kids play in Easy Mode! How Lame!")
		panel:ControlHelp("Makes KLK Nextbots take full damage from Players.")
		panel:ControlHelp("KLK Nextbots will also only deal 5% of their True Damage.")

		panel:CheckBox("Disable Music", "drg_killlakill_music")
		panel:ControlHelp("Disables the Music from KILL la KILL Nextbots.")
		
		panel:CheckBox("Disable Health Regeneration", "drg_killlakill_regen")
		panel:ControlHelp("This option also disables Satsuki's lifesteal and health decay.")

		panel:CheckBox("Disable Armor", "drg_killlakill_armor")
		panel:ControlHelp("Disables the Armor Stat for KILL la KILL Nextbots.")

		panel:CheckBox("Disable Valor Mode", "drg_killlakill_valormode")
		panel:ControlHelp("Disables Valor Modes and Stat Bonuses.")

		panel:CheckBox("Disable Valor Parries", "drg_killlakill_valorparry")
		panel:ControlHelp("Disables Valor Parrying.")

		panel:CheckBox("Disable Valor Reset", "drg_killlakill_valorreset")
		panel:ControlHelp("Disables resetting their Valor Mode when no enemies are present.")

		panel:CheckBox("Disable Counter Bursts", "drg_killlakill_counterburst")
		panel:ControlHelp("Disables Counter Bursts (disables their ability to stop enemy combos midway).")

		panel:CheckBox("Disable Intro Transformation", "drg_killlakill_transform")
		panel:ControlHelp("Disables Transformation (if included).")

		panel:CheckBox("Disable Special Attacks", "drg_killlakill_specials")
		panel:ControlHelp("Disable all types of Special Attacks (which costs Meter).")

		panel:CheckBox("Disable Finisher Attacks", "drg_killlakill_finisher")
		panel:ControlHelp("Disable Finisher Attacks from happening.")

		panel:CheckBox("Enable Sisterly Bond", "drg_killlakill_alliance")
		panel:ControlHelp("Make Ryuko and Satsuki allied with each other.")
		
		panel:CheckBox("Enable 'Friendly' Sparring", "drg_killlakill_sparring")
		panel:ControlHelp("Make Nui and Ragyo fight each other.")

		panel:CheckBox("Become Friendly to Players", "drg_killlakill_friendly")
		panel:ControlHelp("Spawned KLK Nextbots will be Friendly to all Players.")

		panel:CheckBox("Become Friendly to Doppelgangers", "drg_killlakill_clone")
		panel:ControlHelp("Spawned KLK Nextbots will be Friendly to their clones.")
		
		panel:CheckBox("Prioritize Nui's alternate skins", "drg_killlakill_nuiskins")
		panel:ControlHelp("Nui will spawn with her Easter Egg skins instead.")
    else
        panel:Help("You are not an admin!")
        panel:ControlHelp("Notice: Only admins can change this settings.")
        return
    end

end)

---------------------------------------------------------------------------------------------------------------------------------------------

spawnmenu.AddToolMenuOption("DrGBase", "KILL la KILL", "drgbase_killlakill_student_settings", "Honnoji Students", "", "", function(panel)
    panel:ClearControls()

    panel:ControlHelp("\nHonnoji Students")

    if game.SinglePlayer() or LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() then
		panel:CheckBox("Disable Loyalty", "drg_killlakill_stuloyalty")
		panel:ControlHelp("Students become Hostile to Satsuki.")
		
		panel:CheckBox("Enable Cooperation", "drg_killlakill_stucoop")
		panel:ControlHelp("Students become Friendly to Ryuko.")

		panel:CheckBox("Become Hostile to other Students", "drg_killlakill_stuclone")
		panel:ControlHelp("Spawned Honnoji Students will be Hostile to other Students.")
    else
        panel:Help("You are not an admin!")
        panel:ControlHelp("Notice: Only admins can change this settings.")
        return
    end

end)

---------------------------------------------------------------------------------------------------------------------------------------------

spawnmenu.AddToolMenuOption("DrGBase", "KILL la KILL", "drgbase_killlakill_covers_settings", "COVERS", "", "", function(panel)
    panel:ClearControls()

    panel:ControlHelp("\nCOVERS")

    if game.SinglePlayer() or LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() then
		panel:CheckBox("Disable Link", "drg_killlakill_covlink")
		panel:ControlHelp("COVERS become Hostile to Non-Suit Allies.")

		panel:CheckBox("Disable Hive Mind", "drg_killlakill_covhivemind")
		panel:ControlHelp("All COVERS are hostile to other COVERS.")
    else
        panel:Help("You are not an admin!")
        panel:ControlHelp("Notice: Only admins can change this settings.")
        return
    end

end)

---------------------------------------------------------------------------------------------------------------------------------------------

end)
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
--PATH addons/mc_simple_npcs/lua/mcs_npcs/themes/hk_theme.lua:
MCS.Themes["Hollow Knight"] = {}

if SERVER then 

	resource.AddWorkshop( '1932352136' ) -- Content (Fonts and materials)
	return 

end

local NewFont = surface.CreateFont
NewFont( "MCS_HKMain", { font = "Kurale", extended = true, size = 46, antialias = true, weight = 800} )
NewFont( "MCS_HKSub", { font = "Kurale", extended = true, size = 46, antialias = true, weight = 800, outline = true} )
NewFont( "MCS_HKBIG", { font = "Kurale", extended = true, size = 126, antialias = true, weight = 800} )


MCS.Themes["Hollow Knight"].Menu =  function(npc, test)
	
	if !IsValid(npc) and !test then return end
	// Fonts
	local AnswersFont, NPCFont, AnswersAlign = "MCS_HKMain", "MCS_HKSub", TEXT_ALIGN_CENTER
	// Colors
	local NPCTextColor, TextColor, HighlightColor = MCS.Config.NPCTextColor, MCS.Config.TextColor, MCS.Config.HighlightColor
	
	local dialogs = (test and test.dialogs) or MCS.Spawns[npc:GetUID()].dialogs
	
	local dialog = dialogs[1]
	
	local textt = dialog["Line"]
	local time = CurTime()
	local pos, showhint = 0, true
	local fade, fade2 = 0, 0
	
	local subf
	local subl
	
	local mainf = vgui.Create( "DFrame" )
	mainf:SetSize( ScrW(), ScrH() )
	mainf:Center()
	mainf:MakePopup()
	mainf:SetDraggable( false )
	mainf:ShowCloseButton( MCS.Config.DebugMode )
	mainf:SetTitle( "" )
	mainf.OnClose = function()
		if subf then
			subf:OnClose()
		end
		if npc and npc:GetInputLimit() then
			net.Start( "CloseMCSMenu" )
				net.WriteEntity(npc)
			net.SendToServer()
		end
	end
	mainf.Paint = function(self, w, h)
		if test then Derma_DrawBackgroundBlur( self, self.startTime ) end
		if fade < 255 then
			fade = Lerp(FrameTime() * 3, fade, 255)
		end
		surface.SetFont("MCS_HKBIG")
		local tw, th = surface.GetTextSize((npc and npc:GetNamer()) or test.name)
		
		surface.SetDrawColor(0,0,0,math.Clamp(fade,0,120))
		surface.SetMaterial(Material("gui/center_gradient.vtf"))
		surface.DrawTexturedRect(50,h-120-th/2,tw,th-20)
		
		draw.SimpleTextOutlined( (npc and npc:GetNamer()) or test.name , "MCS_HKBIG", 50, h-130, Color(255,255,255,fade), TEXT_ALIGN_LEFT, 1, 1, Color(0,0,0,fade))
		
		
		surface.SetDrawColor(0,0,0,math.Clamp(fade,0,250))
		surface.SetMaterial(Material("gui/center_gradient.vtf"))
		surface.DrawTexturedRect(w/8,h/8,w-w/4,h/4-10)
		
		
		surface.SetDrawColor(255,255,255,math.Clamp(fade,0,255))
		surface.SetMaterial(Material("mcs_ui/hn_top.png"))
		surface.DrawTexturedRect(w/8+((w-w/4)/2-300),h/8-50,600,80)
		surface.SetMaterial(Material("mcs_ui/hn_but.png"))
		surface.DrawTexturedRect(w/8+((w-w/4)/2-200),h/8+(h/4-40),400,60)
		
		if showhint then
			local skipb = TextColor
			skipb.a = 100+math.sin( CurTime()*5)*55
			draw.SimpleTextOutlined( MCS.Config.SkipButton , AnswersFont, w/2, h/8+(h/4+60), skipb, TEXT_ALIGN_CENTER, 1, 1, Color(0,0,0,100))
		end
		
		if (!self.NextThing or self.NextThing < CurTime()) and !LocalPlayer():Alive() then
			self.NextThing = CurTime() + 1
			self:Close()
		end
	end
	
	local function OpenDialogue(dialog)
		
		if subf then subf:Close() end
		if subl then subl:Remove() end
		fade2, showhint = 0, 0, true
		
		textt = dialog["Line"]
		time = CurTime()
		pos = 0
		
		local snd
		local textspd = math.Clamp(MCS.Config.TextSpeed, 1, 10)
		
		if dialog["Sound"] then
			snd = CreateSound(LocalPlayer(), dialog["Sound"])
		end
		
		subf = vgui.Create( "DFrame", mainf )
		subf:SetSize( mainf:GetWide()-mainf:GetWide()/4, mainf:GetTall()/4-10 )
		subf:SetPos(mainf:GetWide()/8,mainf:GetTall()/8)
		subf:SetDraggable( false )
		subf:ShowCloseButton( false )
		subf:SetTitle( "" )
		subf.OnClose = function()
			if snd then
				snd:Stop()
			end
		end
		subf.Paint = function(self, w, h)
			if pos >= string.len(textt) then
				fade2 = Lerp(FrameTime() * 3, fade2, 255)
				showhint = false
			end
		end
		
		local npctext = vgui.Create( "RichText", subf )
		npctext:SetSize( subf:GetWide(), subf:GetTall()-40 )
		npctext:SetPos( 20,20)
		npctext.Paint = function(self, w, h)
			self:SetFontInternal( NPCFont  )
			self:SetFGColor( NPCTextColor )
			
			if (CurTime() > time) and pos < string.len(textt) and fade > 150 then
				pos = pos + 1
				time = CurTime() + FrameTime() * textspd
				
				if MCSruscheck(string.sub(textt, pos, pos+1)) then
					pos = pos + 1
					local addtext = string.sub(textt, pos-1, pos)
					self:AppendText(addtext)
				else
					
					self:AppendText(string.sub(textt, pos, pos))
				end
				
				
				if input.IsMouseDown( MOUSE_FIRST ) then
					time = CurTime() + 10
					pos = string.len(textt)
					self:SetText(textt)
					showhint = false
				end
				if snd then
					snd:Play()
				end
				
			end
			
		end
		
		subl = vgui.Create( "DFrame", mainf )
		subl:SetSize( mainf:GetWide()-mainf:GetWide()/4, mainf:GetTall()/4-60 )
		subl:SetPos(mainf:GetWide()/8,mainf:GetTall()/8+mainf:GetTall()/4+60)
		subl:SetDraggable( false )
		subl:ShowCloseButton( false )
		subl:SetTitle( "" )
		subl.Paint = function( self, w, h ) 
			surface.SetDrawColor(0,0,0,math.Clamp(fade2,0,250))
			surface.SetMaterial(Material("gui/center_gradient.vtf"))
			surface.DrawTexturedRect(0,0,w,h)
		end
		
		local slist = vgui.Create( "DPanelList", subl )
		slist:SetSize( subl:GetWide()-40, subl:GetTall()-40 )
		slist:SetPos(20,20)
		slist:EnableVerticalScrollbar( true )
		slist:EnableHorizontal( false )
		slist:SetSpacing( 5 )
		slist.Paint = function( self, w, h ) end
		slist.VBar.Paint = function( s, w, h ) draw.RoundedBox( 4, 3, 13, 8, h-24, Color(0,0,0,70)) end
		slist.VBar.btnUp.Paint = function( s, w, h ) end
		slist.VBar.btnDown.Paint = function( s, w, h ) end
		slist.VBar.btnGrip.Paint = function( s, w, h )draw.RoundedBox( 4, 5, 0, 4, h+22, Color(0,0,0,70)) end
		
		local function OpenDialogueLine(k, ans)
			
			local ab = vgui.Create( "DButton", bg )
			ab:SetSize( slist:GetWide()-10, 35 )
			ab:SetText( "" )
			ab:SetTextColor( Color( 255, 255, 255, 255 ) )
			ab.fade = 0
			ab.Paint = function( self, w, h )
				
				if fade2 < 1 then return end
				
				if self.hover then 
					self.fade = Lerp(FrameTime() * 3, self.fade, 255)
				else
					self.fade = 0
				end
				
				local x = 0
				
				if AnswersAlign == TEXT_ALIGN_CENTER then
					x = w/2
				elseif AnswersAlign == TEXT_ALIGN_RIGHT then
					x = w
				end
				
				if self.hover then 
					surface.SetFont(AnswersFont)
					local tw, th = surface.GetTextSize(ans[1])
					
					surface.SetDrawColor(255,255,255,math.Clamp(self.fade,0,110))
					surface.SetMaterial(Material("gui/center_gradient.vtf"))
					surface.DrawTexturedRect(w/2-tw/2-24,0,tw+48,h)
					
					surface.SetDrawColor(255,255,255,math.Clamp(self.fade,0,255))
					surface.SetMaterial(Material("mcs_ui/hn_opt.png"))
					surface.DrawTexturedRectRotated(w/2-tw/2-30,h/2,44,35,180)
					surface.DrawTexturedRect(w/2+tw/2+8,0,44,35)
				end
				
				draw.SimpleTextOutlined( ans[1] , AnswersFont, w/2, h/2, Color(255,255,255,fade2), TEXT_ALIGN_CENTER, 1, 1, Color(0,0,0,fade2))
				
			end
			ab.DoClick = function()
				if fade2 > 200 then
					if isnumber(ans[2]) and dialogs[ans[2]] then
						OpenDialogue(dialogs[ans[2]])
					else
						if MCS.AddonList[ans[2]] and MCS.AddonList[ans[2]]["enabled"] then
							if MCS.AddonList[ans[2]]["function"] then
								MCS.AddonList[ans[2]]["function"]()
							end
							
							if MCS.AddonList[ans[2]]["function_sv"] then
								net.Start( "StartMCSSvFunc" )
									net.WriteString(ans[2])
								net.SendToServer()
							end
						end
						
						mainf:Close()
					end
					
					if ans[3] then
						ans[3](npc)
					end
					
					if npc and npc:GetInputLimit() and ans[5] and isstring(ans[5]) then
						net.Start( "StartMCSAnimation" )
							net.WriteEntity(npc)
							net.WriteString(ans[5])
						net.SendToServer()
					end
					
				end
			end
			ab.OnCursorEntered = function( self ) self.hover = true end 
			ab.OnCursorExited = function( self ) self.hover = false end	
			
			slist:AddItem(ab)

		end
		
		if table.IsEmpty(dialog["Answers"]) then
			OpenDialogueLine(1, {"...", "close"})
		else
			for k,ans in pairs(dialog["Answers"]) do
				
				if ans[4] and !ans[4]() then
					continue
				end
				
				OpenDialogueLine(k, ans)
			end
		end
	end
	
	OpenDialogue(dialogs[1])
	
end
--PATH addons/mc_simple_npcs/lua/mcs_npcs/themes/retro_theme.lua:
MCS.Themes["Retro"] = {}

if SERVER then return end

MCS.Themes["Retro"].Paint = function(self, w, h, fade)
	draw.RoundedBox( 24, 0, 0, w, h, Color( 0, 0, 0, fade)) 
end

local NewFont = surface.CreateFont
NewFont( "MCS_RetroMain", { font = "DPix_8pt", extended = true, size = 32, antialias = true, weight = 800} )
NewFont( "MCS_RetroSub", { font = "DPix_8pt", extended = true, size = 32, antialias = true, weight = 800} )

MCS.Themes["Retro"].Fonts = {"MCS_RetroMain", "MCS_RetroSub", TEXT_ALIGN_CENTER}

MCS.Themes["Retro"].Colors = {
	NPCTextColor = Color(255,255,255),
	TextColor = Color(150,150,150),
	HighlightColor = Color(255,255,255)
}
--PATH addons/msd_ui/lua/msd/ui/msdcontext.lua:
local ScrW, ScrH = ScrW, ScrH
local Ln = MSD.GetPhrase
local logo = Material("msd/macnco.png", "smooth")
CreateClientConVar("mmd_lastscr", 0, true, false)

function MSD.AdminAccess(ply)
	if MQS then
		return MQS.IsEditor(ply)
	end
	if MRS then
		return MRS.IsAdministrator(ply)
	end
	return ply:IsSuperAdmin()
end

function MSD.OpenMenuManager(parrent, mod_open)
	if not MSD.AdminAccess(LocalPlayer()) then return end

	if IsValid(MSD.SetupMenu) then
		if not MSD.SetupMenu:IsVisible() then
			MSD.SetupMenu:AlphaTo(255, 0.4)
			MSD.SetupMenu:Show()
			MSD.SetupMenu:Center()
			return
		end
		if parrent then
			MSD.SetupMenu:Center()
			return
		else
			MSD.SetupMenu:Close()
		end
	end

	local pnl_w, pnl_h = ScrW(), ScrH()
	pnl_w, pnl_h = pnl_w - pnl_w / 4, pnl_h - pnl_h / 6
	local panel, setbut

	if parrent then
		panel = parrent:Add("MSDSimpleFrame")
	else
		panel = vgui.Create("MSDSimpleFrame")
		panel:MakePopup()
	end

	panel:SetSize(pnl_w, pnl_h)
	panel:Center()
	panel:SetAlpha(0)
	panel:AlphaTo(255, 0.3)

	panel.Paint = function(self, w, h)
		MSD.DrawBG(self, w, h)

		draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, 50, MSD.Theme["d"])
		draw.RoundedBox(MSD.Config.Rounded, 0, 52, w, h - 52, MSD.Theme["l"])
	end

	panel.clsBut = MSD.IconButton(panel, MSD.Icons48.cross, panel:GetWide() - 34, 10, 25, nil, MSD.Config.MainColor.p, function()
		if panel.OnPress then
			panel.OnPress()

			return
		end

		panel:AlphaTo(0, 0.4, 0, function()
			panel:Close()
		end)
	end)

	function panel:OnClose()
		if panel.ModuleSwitch then panel.ModuleSwitch() panel.ModuleSwitch = nil end
		MSD.SetupMenu = nil
	end

	if not parrent then
		panel.clsHide = MSD.IconButton(panel, MSD.Icons48.dot, panel:GetWide() - 64, 10, 25, nil, MSD.Config.MainColor.p, function()
			if panel.OnPress then
				panel.OnPress()

				return
			end

			panel:AlphaTo(0, .4, 0, function()
				MSD.SetupMenu:Hide()
			end)
		end)
	end

	panel.Menu = vgui.Create("MSDPanelList", panel)
	panel.Menu:SetSize(panel:GetWide() / 2, 50)
	panel.Menu:SetPos(0, 0)
	--panel.Menu:EnableVerticalScrollbar()
	panel.Menu:EnableHorizontal(true)
	panel.Menu:SetSpacing(2)
	panel.Menu.IgnoreVbar = true
	panel.Menu.Paint = function() end
	panel.Menu.Deselect = function(but)
		if not but then return end
		but.hovered = true

		for k, v in pairs(panel.Menu:GetItems()) do
			if v and v:IsValid() and v ~= but then
				v.hovered = false
			end
		end
	end

	function panel.ReOpenCanvas()
		if IsValid(panel.Canvas) then panel.Canvas:Remove() end
		panel.Canvas = vgui.Create("DPanel", panel)
		panel.Canvas:SetSize(panel:GetWide(), panel:GetTall() - 52)
		panel.Canvas:SetPos(0, 52)
		panel.Canvas.Paint = function() end
	end

	local cnv = GetConVar("mmd_lastscr")

	function panel.OpenSettings()
		cnv:SetInt(-1)
		panel.ReOpenCanvas()
		panel.Menu.Deselect(setbut)
		MSD.OpenSettingsMenu(panel.Canvas, panel)
	end

	for id, mod in ipairs(MSD.Modules) do
		local button = MSD.MenuButtonTop(panel.Menu, mod.icon, nil, nil, "auto", 50, mod.name, function(self)
			if panel.ModuleSwitch then panel.ModuleSwitch() panel.ModuleSwitch = nil end
			cnv:SetInt(id)
			panel.ReOpenCanvas()
			panel.Menu.Deselect(self)
			mod.menu(panel.Canvas, panel)
		end)

		if (mod_open and id == mod_open) or (cnv:GetInt() == 0 and id == 1) or cnv:GetInt() == id then
			panel.ReOpenCanvas()
			panel.Menu.Deselect(button)
			mod.menu(panel.Canvas, panel)
		end
	end

	setbut = MSD.MenuButtonTop(panel.Menu, MSD.Icons48.cog, nil, nil, "auto", 50, "", function(self)
		panel.OpenSettings()
	end)

	if cnv:GetInt() == -1 and not mod_open then
		panel.OpenSettings()
	end

	MSD.SetupMenu = panel

	return panel
end

function MSD.OpenSettingsMenu(panel)

	oldcfg = MSD.Config

	panel.Canvas = vgui.Create("MSDPanelList", panel)
	panel.Canvas:SetSize(panel:GetWide() / 2 - 5, panel:GetTall())
	panel.Canvas:SetPos(panel:GetWide() / 2 + 5, 0)
	panel.Canvas:EnableVerticalScrollbar()
	panel.Canvas:EnableHorizontal(true)
	panel.Canvas:SetSpacing(2)
	panel.Canvas.IgnoreVbar = true
	panel.Canvas.Paint = function() end

	panel.Settings = vgui.Create("MSDPanelList", panel)
	panel.Settings:SetSize(panel:GetWide() / 2, panel:GetTall() - 80)
	panel.Settings:SetPos(0, 0)
	panel.Settings:EnableVerticalScrollbar()
	panel.Settings:EnableHorizontal(true)
	panel.Settings:SetSpacing(2)
	panel.Settings.IgnoreVbar = true
	panel.Settings.Paint = function() end

	panel.Settings.Update = function()
		panel.Settings:Clear()

		MSD.Header(panel.Settings, Ln("set_ui"))
		local combo = MSD.ComboBox(panel.Settings, "static", nil, 1, 50, "Language:", Ln("none"))

		combo.OnSelect = function(self, index, text, data)
			MSD.Config.Language = data
			panel.Settings.Update()
		end

		for k, v in pairs(MSD.Language) do
			combo:AddChoice(v.lang_name, k)
		end

		combo:SetValue(Ln("lang_name"))
		local sld1

		local function sliderCL(cl)
			local c = math.Clamp(math.Round(cl * 255), 30, 250)
			MSD.Config.BgrColor = Color(c, c, c)
		end

		MSD.DTextSlider(panel.Settings, "static", nil, 1, 50, Ln("set_ui_blur"), Ln("set_ui_mono"), MSD.Config.Blur, function(self, value)
			MSD.Config.Blur = value
			if value then
				sld1.value = 1
				sliderCL(sld1.value)
			else
				sld1.value = 0.18
				sliderCL(sld1.value)
			end
		end)

		sld1 = MSD.VolumeSlider(panel.Settings, "static", nil, 1, 50, Ln("set_ui_brightness"), MSD.Config.BgrColor.r / 255, function(self, var)
			sliderCL(var)
		end)

		MSD.ColorSelector(panel.Settings, "static", nil, 1, 50, Ln("set_ui_color"), MSD.Config.MainColor.p, function(self, color)
			MSD.Config.MainColor.p = color
		end)

		MSD.DTextSlider(panel.Settings, "static", nil, 1, 50, Ln("border_rounded"), Ln("border_square"), MSD.Config.Rounded == 8, function(self, value)
			if value then
				MSD.Config.Rounded = 8
			else
				MSD.Config.Rounded = 0
			end
		end)

		if not MSD.HUD then return end

		MSD.Header(panel.Settings, Ln("set_hud"))

		MSD.BoolSlider(panel.Settings, "static", nil, 1, 50, Ln("custom_icon"), MSD.Config.HUD.ShowIcon, function(self, value)
			MSD.Config.HUD.ShowIcon = value
		end)

		MSD.TextEntry(panel.Settings, "static", nil, 1, 50, Ln("q_icon68"), Ln("e_url") .. ":",  MSD.Config.HUD.Icon, function(self, value)
			MSD.Config.HUD.Icon = value
		end)

		MSD.TextEntry(panel.Settings, "static", nil, 1, 50, Ln("e_text"), Ln("e_text") .. ":",  MSD.Config.HUD.Text, function(self, value)
			MSD.Config.HUD.Text = value
		end)

		local acombo = MSD.ComboBox(panel.Settings, "static", nil, 1, 50, "", "")

		local algm = {
			Ln("set_ui_align_left"),
			Ln("set_ui_align_center"),
			Ln("set_ui_align_right")
		}
		for i,t in pairs(algm) do
			acombo:AddChoice(t, i - 1)
			acombo:SetValue(t)
		end

		acombo.OnSelect = function(self, index, text, data)
			MSD.Config.HUD.AlignX = data
		end

		local sld0, txt1, sld2, txt2
		sld0 = MSD.VolumeSlider(panel.Settings, "static", nil, 1.2, 50, Ln("set_ui_offset_h"), MSD.Config.HUD.X, function(self, var)
			var = math.Round(var, 3)
			MSD.Config.HUD.X = var
			txt1:SetText(var * 100)
		end)

		txt1 = MSD.TextEntry(panel.Settings, "static", nil, 6, 50, "", "", MSD.Config.HUD.X * 100, function(self, value)
			value = math.Clamp((tonumber(value) or 0) / 100,0,1)
			sld0.value = value
			MSD.Config.HUD.X = value
		end, true, nil, nil, true)

		sld2 = MSD.VolumeSlider(panel.Settings, "static", nil, 1.2, 50, Ln("set_ui_offset_v"), MSD.Config.HUD.Y, function(self, var)
			var = math.Round(var, 3)
			MSD.Config.HUD.Y = var
			txt2:SetText(var * 100)
		end)

		txt2 = MSD.TextEntry(panel.Settings, "static", nil, 6, 50, "", "", MSD.Config.HUD.Y * 100, function(self, value)
			value = math.Clamp((tonumber(value) or 0) / 100,0,1)
			sld2.value = value
			MSD.Config.HUD.Y = value
		end, true, nil, nil, true)

		MSD.BoolSlider(panel.Settings, "static", nil, 1, 50, Ln("show_team"), MSD.Config.HUD.ShowGroup, function(self, value)
			MSD.Config.HUD.ShowGroup = value
		end)

		MSD.BoolSlider(panel.Settings, "static", nil, 1, 50, Ln("mrs_hud_follow"), MSD.Config.HUD.Follow, function(self, value)
			MSD.Config.HUD.Follow = value
		end)

		MSD.BoolSlider(panel.Settings, "static", nil, 1, 50, Ln("use_team_colors"), MSD.Config.HUD.TeamColor, function(self, value)
			MSD.Config.TeamColor = value
		end)

		MSD.BoolSlider(panel.Settings, "static", nil, 1, 50, Ln("icon_right"), MSD.Config.HUD.IconRight, function(self, value)
			MSD.Config.HUD.IconRight = value
		end)

		MSD.VolumeSlider(panel.Settings, "static", nil, 1, 50, Ln("icon_size"), (MSD.Config.HUD.IconSize - 24) / 40, function(self, var)
			var = math.Round(var, 3)
			MSD.Config.HUD.IconSize = math.Clamp(24 + math.Round(var * 40), 24, 64)
		end)

		MSD.VolumeSlider(panel.Settings, "static", nil, 1, 50, Ln("font_size"), (MSD.Config.HUD.FontSize - 16) / 30, function(self, var)
			var = math.Round(var, 3)
			MSD.Config.HUD.FontSize = math.Clamp(16 + math.Round(var * 30), 16, 46)
		end)
	end

	panel.Settings.Update()

	if LocalPlayer():IsSuperAdmin() then
		MSD.BigButton(panel, 0, panel:GetTall() - 80, panel:GetWide() / 4, 80, Ln("upl_changes"), MSD.Icons48.save, function()
			MSD.SaveConfig()
			panel.Settings.Update()
		end)

		MSD.BigButton(panel, panel:GetWide() / 4, panel:GetTall() - 80, panel:GetWide() / 4, 80, Ln("res_changes"), MSD.Icons48.cross, function()
			MSD.Config = oldcfg
			panel.Settings.Update()
		end)
	end

	local pnl = vgui.Create("DPanel")

	pnl.StaticScale = {
		w = 1,
		h = 1,
		minw = 150,
		minh = 150
	}

	pnl.Paint = function(self, w, h)
		MSD.DrawTexturedRect(w / 2 - 128, h / 2 - 128, 256, 236, logo, MSD.Text["l"])
		draw.DrawText("MSD UI version - " .. MSD.Version, "MSDFont.25", w / 2, h / 2 + 130, MSD.Text["l"], TEXT_ALIGN_CENTER)
	end

	panel.Canvas:AddItem(pnl)
end
--PATH addons/msd_ui/lua/msd/ui/msdpanellist.lua:
local PANEL = {}
AccessorFunc(PANEL, "m_bSizeToContents", "AutoSize")
AccessorFunc(PANEL, "m_bStretchHorizontally", "StretchHorizontally")
AccessorFunc(PANEL, "m_bNoSizing", "NoSizing")
AccessorFunc(PANEL, "m_bSortable", "Sortable")
AccessorFunc(PANEL, "m_fAnimTime", "AnimTime")
AccessorFunc(PANEL, "m_fAnimEase", "AnimEase")
AccessorFunc(PANEL, "m_strDraggableName", "DraggableName")
AccessorFunc(PANEL, "Spacing", "Spacing")
AccessorFunc(PANEL, "Padding", "Padding")

function PANEL:Init()
	self:SetDraggableName("GlobalDPanel")
	self.pnlCanvas = vgui.Create("DPanel", self)
	self.pnlCanvas:SetPaintBackground(false)

	self.pnlCanvas.OnMousePressed = function(s, code)
		s:GetParent():OnMousePressed(code)
	end

	self.pnlCanvas.OnChildRemoved = function()
		self:OnChildRemoved()
	end

	self.pnlCanvas:SetMouseInputEnabled(true)

	self.pnlCanvas.InvalidateLayout = function()
		self:InvalidateLayout()
	end

	self.pnlCanvas.MasterPanel = self
	self.Items = {}
	self.YOffset = 0
	self.m_fAnimTime = 0
	self.m_fAnimEase = -1
	self.m_iBuilds = 0
	self.IgnoreVbar = true
	self:SetSpacing(0)
	self:SetPadding(0)
	self:EnableHorizontal(false)
	self:SetAutoSize(false)
	self:SetPaintBackground(true)
	self:SetNoSizing(false)
	self:SetMouseInputEnabled(true)

	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
end

function PANEL:OnModified()
	-- Override me
end

function PANEL:SizeToContents()
	self:SetSize(self.pnlCanvas:GetSize())
end

function PANEL:GetItems()
	return self.Items
end

function PANEL:EnableHorizontal(bHoriz)
	self.Horizontal = bHoriz
end

local sdw = Color(0, 0, 0, 70)

function PANEL:EnableVerticalScrollbar()
	if (self.VBar) then return end
	self.VBar = vgui.Create("DVScrollBar", self)

	self.VBar.Paint = function(s, w, h)
		draw.RoundedBox(4, 3, 13, 8, h - 24, sdw)
	end

	self.VBar.btnUp.Paint = function(s, w, h) end
	self.VBar.btnDown.Paint = function(s, w, h) end

	self.VBar.btnGrip.Paint = function(s, w, h)
		draw.RoundedBox(4, 5, 0, 4, h + 22, sdw)
	end
end

function PANEL:GetCanvas()
	return self.pnlCanvas
end

function PANEL:Clear(nDelete)
	for k, panel in pairs(self.Items) do
		if (not IsValid(panel)) then continue end
		panel:Remove()

		if (nDelete) then
			panel:SetVisible(false)
		end
	end

	self.Items = {}
end

function PANEL:ClearEX(ex_panel)
	if (not IsValid(ex_panel)) then return end

	for k, panel in pairs(self.Items) do
		if (not IsValid(panel)) then continue end

		if (panel ~= ex_panel) then
			panel:Remove()
		end
	end

	self.Items = {}
	table.insert(self.Items, ex_panel)
end

function PANEL:AddItem(item, strLineState)
	if (not IsValid(item)) then return end
	item:SetVisible(true)
	item:SetParent(self:GetCanvas())
	item.m_strLineState = strLineState or item.m_strLineState
	table.insert(self.Items, item)
	item:SetSelectable(self.m_bSelectionCanvas)
	self:InvalidateLayout()
end

function PANEL:InsertBefore(before, insert, strLineState)
	table.RemoveByValue(self.Items, insert)
	self:AddItem(insert, strLineState)
	local key = table.KeyFromValue(self.Items, before)

	if (key) then
		table.RemoveByValue(self.Items, insert)
		table.insert(self.Items, key, insert)
	end
end

function PANEL:InsertAfter(before, insert, strLineState)
	table.RemoveByValue(self.Items, insert)
	self:AddItem(insert, strLineState)
	local key = table.KeyFromValue(self.Items, before)

	if (key) then
		table.RemoveByValue(self.Items, insert)
		table.insert(self.Items, key + 1, insert)
	end
end

function PANEL:InsertAtTop(insert, strLineState)
	table.RemoveByValue(self.Items, insert)
	self:AddItem(insert, strLineState)
	local key = 1

	if (key) then
		table.RemoveByValue(self.Items, insert)
		table.insert(self.Items, key, insert)
	end
end

function PANEL.DropAction(Slot, RcvSlot)
	local PanelToMove = Slot.Panel

	if (dragndrop.m_MenuData == "copy") then
		if (PanelToMove.Copy) then
			PanelToMove = Slot.Panel:Copy()
			PanelToMove.m_strLineState = Slot.Panel.m_strLineState
		else
			return
		end
	end

	PanelToMove:SetPos(RcvSlot.Data.pnlCanvas:ScreenToLocal(gui.MouseX() - dragndrop.m_MouseLocalX, gui.MouseY() - dragndrop.m_MouseLocalY))

	if (dragndrop.DropPos == 4 or dragndrop.DropPos == 8) then
		RcvSlot.Data:InsertBefore(RcvSlot.Panel, PanelToMove)
	else
		RcvSlot.Data:InsertAfter(RcvSlot.Panel, PanelToMove)
	end
end

function PANEL:RemoveItem(item, bDontDelete)
	for k, panel in pairs(self.Items) do
		if (panel == item) then
			self.Items[k] = nil

			if (not bDontDelete) then
				panel:Remove()
			end

			self:InvalidateLayout()
		end
	end
end

function PANEL:CleanList()
	for k, panel in pairs(self.Items) do
		if (not IsValid(panel) or panel:GetParent() ~= self.pnlCanvas) then
			self.Items[k] = nil
		end
	end
end

function PANEL:HorizontalRebuild(Offset)
	local x, y = self.Padding, self.Padding
	local l_highest = 0

	for k, panel in pairs(self.Items) do
		if (panel:IsVisible()) then
			if panel.StaticScale then
				local w, h

				if isstring(panel.StaticScale.w) then
					w = tonumber(panel.StaticScale.w)
					w = (self.pnlCanvas:GetWide() - (self.pnlCanvas:GetWide() / w)) - (self.Spacing + self.Padding)
				elseif panel.StaticScale.w == 1 then
					w = self.pnlCanvas:GetWide() / panel.StaticScale.w - (self.Spacing + self.Padding)
				else
					w = self.pnlCanvas:GetWide() / panel.StaticScale.w - (self.Spacing + self.Padding) / 1.5
				end

				if panel.StaticScale.fixed_h then
					h = panel.StaticScale.fixed_h
				elseif panel.StaticScale.h_w then
					h = w
				elseif panel.StaticScale.h then
					if isstring(panel.StaticScale.h) then
						h = tonumber(panel.StaticScale.h)
						h = (self:GetTall() - (self:GetTall() / h)) - (self.Spacing + self.Spacing / h + self.Padding)
					elseif panel.StaticScale.h == 1 then
						h = self:GetTall() / panel.StaticScale.h - (self.Spacing + self.Padding)
					else
						h = self:GetTall() / panel.StaticScale.h - (self.Spacing + self.Padding)
					end
				end

				if panel.StaticScale.minw > w then
					w = panel.StaticScale.minw
				end

				if panel.StaticScale.h and panel.StaticScale.minh > h then
					h = panel.StaticScale.minh
				end

				panel:SetSize(w, h)
			end

			local OwnLine = (panel.m_strLineState and panel.m_strLineState == "ownline")
			local w = panel:GetWide()
			local h = panel:GetTall()
			local vbar = 0

			if (self.VBar and self.VBar.Enabled and not self.IgnoreVbar) then
				vbar = 13
			end

			if (x > self.Padding and (x + w > (self:GetWide() - vbar) or OwnLine)) then
				x = self.Padding
				y = y + l_highest + self.Spacing
				l_highest = h
			end

			if h > l_highest then
				l_highest = h
			end

			if (self.m_fAnimTime > 0 and self.m_iBuilds > 1) then
				panel:MoveTo(x, y, self.m_fAnimTime, 0, self.m_fAnimEase)
			else
				panel:SetPos(x, y)
			end

			x = x + w + self.Spacing
			Offset = y + l_highest + self.Spacing

			if (OwnLine) then
				x = self.Padding
				y = y + h + self.Spacing
			end
		end
	end

	return Offset
end

function PANEL:NormalRebuild(Offset)
	for k, panel in pairs(self.Items) do
		if (panel:IsVisible()) then
			if (self.m_bNoSizing) then
				panel:SizeToContents()

				if (self.m_fAnimTime > 0 and self.m_iBuilds > 1) then
					panel:MoveTo((self:GetCanvas():GetWide() - panel:GetWide()) * 0.5, self.Padding + Offset, self.m_fAnimTime, 0, self.m_fAnimEase)
				else
					panel:SetPos((self:GetCanvas():GetWide() - panel:GetWide()) * 0.5, self.Padding + Offset)
				end
			else
				panel:SetWide(self:GetCanvas():GetWide() - self.Padding * 2)

				if (self.m_fAnimTime > 0 and self.m_iBuilds > 1) then
					panel:MoveTo(self.Padding, self.Padding + Offset, self.m_fAnimTime, self.m_fAnimEase)
				else
					panel:SetPos(self.Padding, self.Padding + Offset)
				end
			end

			panel:InvalidateLayout(true)
			Offset = Offset + panel:GetTall() + self.Spacing
		end
	end

	Offset = Offset + self.Padding

	return Offset
end

function PANEL:Rebuild()
	local Offset = 0
	self.m_iBuilds = self.m_iBuilds + 1
	self:CleanList()

	if (self.Horizontal) then
		Offset = self:HorizontalRebuild(Offset)
	else
		Offset = self:NormalRebuild(Offset)
	end

	self:GetCanvas():SetTall(Offset + self.Padding - self.Spacing)

	if (self.m_bNoSizing and self:GetCanvas():GetTall() < self:GetTall()) then
		self:GetCanvas():SetPos(0, (self:GetTall() - self:GetCanvas():GetTall()) * 0.5)
	end
end

function PANEL:OnMouseWheeled(dlta)
	if (self.VBar) then return self.VBar:OnMouseWheeled(dlta) end
end

function PANEL:Paint(w, h)
	derma.SkinHook("Paint", "PanelList", self, w, h)

	return true
end

function PANEL:OnVScroll(iOffset)
	self.pnlCanvas:SetPos(0, iOffset)
end

function PANEL:PerformLayout()
	local Wide = self:GetWide()
	local Tall = self.pnlCanvas:GetTall()
	local YPos = 0

	if (not self.Rebuild) then
		debug.Trace()
	end

	self:Rebuild()

	if (self.VBar) then
		self.VBar:SetPos(self:GetWide() - 13, 0)
		self.VBar:SetSize(13, self:GetTall())
		self.VBar:SetUp(self:GetTall(), self.pnlCanvas:GetTall())
		YPos = self.VBar:GetOffset()

		if not self.IgnoreVbar then
			Wide = Wide - 13
		end
	end

	self.pnlCanvas:SetPos(0, YPos)
	self.pnlCanvas:SetWide(Wide)

	if (self:GetAutoSize()) then
		self:SetTall(self.pnlCanvas:GetTall())
		self.pnlCanvas:SetPos(0, 0)
	end

	if (self.VBar and not self:GetAutoSize() and Tall ~= self.pnlCanvas:GetTall()) then
		self.VBar:SetScroll(self.VBar:GetScroll())
	end
end

function PANEL:OnChildRemoved()
	self:CleanList()
	self:InvalidateLayout()
end

function PANEL:ScrollToChild(panel)
	local _, y = self.pnlCanvas:GetChildPosition(panel)
	local _, h = panel:GetSize()
	y = y + h * 0.5
	y = y - self:GetTall() * 0.5
	self.VBar:AnimateTo(y, 0.5, 0, 0.5)
end

function PANEL:SortByMember(key, desc)
	desc = desc or true

	table.sort(self.Items, function(a, b)
		if (desc) then
			local ta = a
			local tb = b
			a = tb
			b = ta
		end

		if (a[key] == nil) then return false end
		if (b[key] == nil) then return true end

		return a[key] > b[key]
	end)
end

derma.DefineControl("MSDPanelList", "Fancy DpanelList", PANEL, "DPanel")
--PATH addons/pcasino/lua/perfectcasino/core/sh_cooldown.lua:
-- A cooldown lib I stole from my community's lib
PerfectCasino.Cooldown.Timers = PerfectCasino.Cooldown.Timers or {}

function PerfectCasino.Cooldown.Check(id, time, ply)
	if not id then return true end
	if not time then return true end

	if not PerfectCasino.Cooldown.Timers[id] then
		PerfectCasino.Cooldown.Timers[id] = {}
		PerfectCasino.Cooldown.Timers[id].global = 0
	end

	if ply then
		if not PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] then
			PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] = 0
		end

		if PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] > CurTime() then return true end

		PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] = CurTime() + time

		return false
	else
		if PerfectCasino.Cooldown.Timers[id].global > CurTime() then return true end

		PerfectCasino.Cooldown.Timers[id].global = CurTime() + time

		return false
	end
end

function PerfectCasino.Cooldown.Get(id, ply)
	if not id then return 0 end
	if not time then return 0 end

	if not PerfectCasino.Cooldown.Timers[id] then return 0 end

	-- The correct returns
	if ply and PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] then return PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] end
	if not ply and PerfectCasino.Cooldown.Timers[id].global then return PerfectCasino.Cooldown.Timers[id].global end

	-- Failsafe
	return 0
end


function PerfectCasino.Cooldown.Reset(id, ply)
	if not id then return end

	if not PerfectCasino.Cooldown.Timers[id] then return end

	if ply then
		if not PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] then return end
		PerfectCasino.Cooldown.Timers[id][ply:SteamID64()] = 0
	else
		PerfectCasino.Cooldown.Timers[id].global = 0
	end
end
--PATH addons/sam-157/lua/sam/libs/sh_pon.lua:
if SAM_LOADED then return end

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
 - tables  -		 k,v - pointers
 - strings -		 k,v - pointers
 - numbers -		k,v
 - booleans-		 k,v

 - Vectors -		 k,v
 - Angles  -		k,v
 - Entities-		 k,v
 - Players -		 k,v

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
local pon = {}
sam.pon = pon

do
	local type = sam.type
	local IsColor = IsColor
	local tonumber = tonumber
	local format = string.format
	local encode = {}
	local cacheSize = 0

	encode['table'] = function(self, tbl, output, cache)
		if cache[tbl] then
			output[#output + 1] = format('(%x)', cache[tbl])

			return
		else
			cacheSize = cacheSize + 1
			cache[tbl] = cacheSize
		end

		local first = next(tbl, nil)
		local predictedNumeric = 1

		-- starts with a numeric dealio
		if first == 1 then
			output[#output + 1] = '{'

			for k, v in next, tbl do
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
					elseif IsColor(v) then
						self.Color(self, v, output, cache)
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
			if not self[tk] or not self[tv] then continue end

			-- WRITE KEY
			if tk == 'string' then
				local pid = cache[k]

				if pid then
					output[#output + 1] = format('(%x)', pid)
				else
					cacheSize = cacheSize + 1
					cache[k] = cacheSize
					self.string(self, k, output, cache)
				end
			elseif IsColor(v) then
				self.Color(self, v, output, cache)
			else
				self[tk](self, k, output, cache)
			end

			-- WRITE VALUE
			if tv == 'string' then
				local pid = cache[v]

				if pid then
					output[#output + 1] = format('(%x)', pid)
				else
					cacheSize = cacheSize + 1
					cache[v] = cacheSize
					self.string(self, v, output, cache)
				end
			elseif IsColor(v) then
				self.Color(self, v, output, cache)
			else
				self[tv](self, v, output, cache)
			end
		end

		output[#output + 1] = '}'
	end

	--	ENCODE STRING
	local gsub = string.gsub

	encode['string'] = function(self, str, output)
		--if tryCache(str, output then return end
		local estr, count = gsub(str, ';', "\\;")

		if count == 0 then
			output[#output + 1] = '\'' .. str .. ';'
		else
			output[#output + 1] = '"' .. estr .. '";'
		end
	end

	--	ENCODE NUMBER
	encode['number'] = function(self, num, output)
		if num % 1 == 0 then
			if num < 0 then
				output[#output + 1] = format('x%x;', -num)
			else
				output[#output + 1] = format('X%x;', num)
			end
		else
			output[#output + 1] = tonumber(num) .. ';'
		end
	end

	--	ENCODE BOOLEAN
	encode['boolean'] = function(self, val, output)
		output[#output + 1] = val and 't' or 'f'
	end

	--	ENCODE VECTOR
	encode['Vector'] = function(self, val, output)
		output[#output + 1] = ('v' .. val.x .. ',' .. val.y) .. (',' .. val.z .. ';')
	end

	--	ENCODE ANGLE
	encode['Angle'] = function(self, val, output)
		output[#output + 1] = ('a' .. val.p .. ',' .. val.y) .. (',' .. val.r .. ';')
	end

	encode['Entity'] = function(self, val, output)
		output[#output + 1] = 'E' .. (IsValid(val) and (val:EntIndex() .. ';') or '#')
	end

	encode['Player'] = encode['Entity']
	encode['Vehicle'] = encode['Entity']
	encode['Weapon'] = encode['Entity']
	encode['NPC'] = encode['Entity']
	encode['NextBot'] = encode['Entity']
	encode['PhysObj'] = encode['Entity']

	encode['Color'] = function(self, val, output)
		output[#output + 1] = ('C' .. val.r .. ',' .. val.g .. ',' .. val.b) .. (',' .. val.a .. ';')
	end

	encode['console'] = function(self, val, output)
		output[#output + 1] = 's'
	end

	encode['nil'] = function(self, val, output)
		output[#output + 1] = '?'
	end

	encode.__index = function(key)
		ErrorNoHalt('Type: ' .. key .. ' can not be encoded. Encoded as as pass-over value.')

		return encode['nil']
	end

	do
		local concat = table.concat

		function pon.encode(tbl)
			local output = {nil, nil, nil, nil, nil, nil, nil, nil}
			cacheSize = 0
			encode['table'](encode, tbl, output, {})

			return concat(output)
		end
	end
end

do
	local tonumber = tonumber
	local find, sub, gsub, Explode = string.find, string.sub, string.gsub, string.Explode
	local Vector, Angle, Entity = Vector, Angle, Entity
	local decode = {}

	decode['{'] = function(self, index, str, cache)
		local cur = {}
		cache[#cache + 1] = cur
		local k, v, tk, tv = 1, nil, nil, nil

		while (true) do
			tv = sub(str, index, index)

			if not tv or tv == '~' then
				index = index + 1
				break
			end

			if tv == '}' then return index + 1, cur end
			-- READ THE VALUE
			index = index + 1
			index, v = self[tv](self, index, str, cache)
			cur[k] = v
			k = k + 1
		end

		while (true) do
			tk = sub(str, index, index)

			if not tk or tk == '}' then
				index = index + 1
				break
			end

			-- READ THE KEY
			index = index + 1
			index, k = self[tk](self, index, str, cache)
			-- READ THE VALUE
			tv = sub(str, index, index)
			index = index + 1
			index, v = self[tv](self, index, str, cache)
			cur[k] = v
		end

		return index, cur
	end

	decode['['] = function(self, index, str, cache)
		local cur = {}
		cache[#cache + 1] = cur
		local k, v, tk, tv = 1, nil, nil, nil

		while (true) do
			tk = sub(str, index, index)

			if not tk or tk == '}' then
				index = index + 1
				break
			end

			-- READ THE KEY
			index = index + 1
			index, k = self[tk](self, index, str, cache)
			if not k then continue end
			-- READ THE VALUE
			tv = sub(str, index, index)
			index = index + 1

			if not self[tv] then
				print('did not find type: ' .. tv)
			end

			index, v = self[tv](self, index, str, cache)
			cur[k] = v
		end

		return index, cur
	end

	-- STRING
	decode['"'] = function(self, index, str, cache)
		local finish = find(str, '";', index, true)
		local res = gsub(sub(str, index, finish - 1), '\\;', ';')
		index = finish + 2
		cache[#cache + 1] = res

		return index, res
	end

	-- STRING NO ESCAPING NEEDED
	decode['\''] = function(self, index, str, cache)
		local finish = find(str, ';', index, true)
		local res = sub(str, index, finish - 1)
		index = finish + 1
		cache[#cache + 1] = res

		return index, res
	end

	-- NUMBER
	decode['n'] = function(self, index, str)
		index = index - 1
		local finish = find(str, ';', index, true)
		local num = tonumber(sub(str, index, finish - 1))
		index = finish + 1

		return index, num
	end

	decode['0'] = decode['n']
	decode['1'] = decode['n']
	decode['2'] = decode['n']
	decode['3'] = decode['n']
	decode['4'] = decode['n']
	decode['5'] = decode['n']
	decode['6'] = decode['n']
	decode['7'] = decode['n']
	decode['8'] = decode['n']
	decode['9'] = decode['n']
	decode['-'] = decode['n']

	-- positive hex
	decode['X'] = function(self, index, str)
		local finish = find(str, ';', index, true)
		local num = tonumber(sub(str, index, finish - 1), 16)
		index = finish + 1

		return index, num
	end

	-- negative hex
	decode['x'] = function(self, index, str)
		local finish = find(str, ';', index, true)
		local num = -tonumber(sub(str, index, finish - 1), 16)
		index = finish + 1

		return index, num
	end

	-- POINTER
	decode['('] = function(self, index, str, cache)
		local finish = find(str, ')', index, true)
		local num = tonumber(sub(str, index, finish - 1), 16)
		index = finish + 1

		return index, cache[num]
	end

	-- BOOLEAN. ONE DATA TYPE FOR YES, ANOTHER FOR NO.
	decode['t'] = function(self, index) return index, true end
	decode['f'] = function(self, index) return index, false end

	-- VECTOR
	decode['v'] = function(self, index, str)
		local finish = find(str, ';', index, true)
		local vecStr = sub(str, index, finish - 1)
		index = finish + 1 -- update the index.
		local segs = Explode(',', vecStr, false)

		return index, Vector(tonumber(segs[1]), tonumber(segs[2]), tonumber(segs[3]))
	end

	-- ANGLE
	decode['a'] = function(self, index, str)
		local finish = find(str, ';', index, true)
		local angStr = sub(str, index, finish - 1)
		index = finish + 1 -- update the index.
		local segs = Explode(',', angStr, false)

		return index, Angle(tonumber(segs[1]), tonumber(segs[2]), tonumber(segs[3]))
	end

	-- ENTITY
	decode['E'] = function(self, index, str)
		if str[index] == '#' then
			index = index + 1

			return index, NULL
		else
			local finish = find(str, ';', index, true)
			local num = tonumber(sub(str, index, finish - 1))
			index = finish + 1

			return index, Entity(num)
		end
	end

	-- COLOR
	decode['C'] = function(self, index, str)
		local finish = find(str, ';', index, true)
		local colStr = sub(str, index, finish - 1)
		index = finish + 1 -- update the index.
		local segs = Explode(',', colStr, false)

		return index, Color(segs[1], segs[2], segs[3], segs[4])
	end

	-- PLAYER
	decode['P'] = function(self, index, str)
		local finish = find(str, ';', index, true)
		local num = tonumber(sub(str, index, finish - 1))
		index = finish + 1

		return index, Entity(num) or NULL
	end

	-- NIL
	decode['?'] = function(self, index) return index + 1, nil end
	-- SAM CONSOLE
	decode['s'] = function(self, index) return index, sam.console end

	function pon.decode(data)
		local _, res = decode[sub(data, 1, 1)](decode, 2, data, {})

		return res
	end
end
--PATH addons/sam-157/lua/sam/libs/sh_mp.lua:
if SAM_LOADED then return end

local sam = sam
local mp = sam.load_file("sam/libs/message_pack/sh_messagepack.lua")
local EXT_VECTOR  = 1
local EXT_ANGLE   = 2
local EXT_ENTITY  = 3
local EXT_PLAYER  = 4
local EXT_COLOR   = 5
local EXT_CONSOLE = 6

mp.packers["Entity"] = function(buffer, ent)
	local buf = {}
	mp.packers["number"](buf, ent:EntIndex())
	mp.packers["ext"](buffer, EXT_ENTITY, buf[1])
end
mp.packers["Vehicle"] = mp.packers["Entity"]
mp.packers["Weapon"] = mp.packers["Entity"]
mp.packers["NPC"] = mp.packers["Entity"]
mp.packers["NextBot"] = mp.packers["Entity"]
mp.packers["PhysObj"] = mp.packers["Entity"]

mp.packers["Player"] = function(buffer, ply)
	local buf = {}
	mp.packers["number"](buf, ply:UserID())
	mp.packers["ext"](buffer, EXT_PLAYER, buf[1])
end

local VECTOR = {}
mp.packers["Vector"] = function(buffer, vec)
	VECTOR[1] = vec.x
	VECTOR[2] = vec.y
	VECTOR[3] = vec.z

	local buf = {}
	mp.packers["_table"](buf, VECTOR)
	mp.packers["ext"](buffer, EXT_VECTOR, table.concat(buf))
end

local ANGLE = {}
mp.packers["Angle"] = function(buffer, ang)
	ANGLE[1] = ang.p
	ANGLE[2] = ang.y
	ANGLE[3] = ang.r

	local buf = {}
	mp.packers["_table"](buf, ANGLE)
	mp.packers["ext"](buffer, EXT_ANGLE, table.concat(buf))
end

local COLOR = {}
mp.packers["Color"] = function(buffer, col)
	COLOR[1] = col.r
	COLOR[2] = col.g
	COLOR[3] = col.b
	COLOR[4] = col.a

	local buf = {}
	mp.packers["_table"](buf, COLOR)
	mp.packers["ext"](buffer, EXT_COLOR, table.concat(buf))
end

mp.packers["console"] = function(buffer)
	mp.packers["ext"](buffer, EXT_CONSOLE, "")
end

local Entity = Entity
local Player = Player
local Color = Color
local Vector = Vector
local Angle = Angle
local unpackers = {
	[EXT_ENTITY] = function(v)
		return Entity(v)
	end,
	[EXT_PLAYER] = function(v)
		return Player(v)
	end,
	[EXT_VECTOR] = function(v)
		return Vector(v[1], v[2], v[3])
	end,
	[EXT_ANGLE] = function(v)
		return Angle(v[1], v[2], v[3])
	end,
	[EXT_COLOR] = function(v)
		return Color(v[1], v[2], v[3], v[4])
	end,
	[EXT_CONSOLE] = function(v)
		return sam.console
	end
}

mp.build_ext = function(tag, data)
	local f = mp.unpacker(data)
	local _, v = f()
	return unpackers[tag](v)
end

sam.mp = mp

--PATH addons/sam-157/lua/sam/ranks/sh_ranks.lua:
if SAM_LOADED then return end

SAM_IMMUNITY_SUPERADMIN = 100
SAM_IMMUNITY_ADMIN = 50
SAM_IMMUNITY_USER = 1

function sam.ranks.get_ranks()
	return sam.get_global("Ranks", {})
end

function sam.ranks.get_rank(rank)
	local ranks = sam.ranks.get_ranks()
	return ranks[rank]
end

function sam.ranks.is_rank(rank)
	if sam.ranks.get_rank(rank) then
		return true
	else
		return false
	end
end

function sam.ranks.is_default_rank(rank)
	return rank == "superadmin" or rank == "admin" or rank == "user"
end

function sam.ranks.inherits_from(rank, rank_2)
	if rank == rank_2 then
		return true
	end

	while true do
		rank = sam.ranks.get_rank(rank)

		if rank then
			local inherits_from = rank.inherit
			if inherits_from == rank_2 then
				return true
			end

			rank = rank.inherit
		else
			return false
		end
	end
end

function sam.ranks.has_permission(rank, permission)
	while true do
		if rank == "superadmin" then
			return true
		end

		rank = sam.ranks.get_rank(rank)

		if rank then
			local rank_permission = rank.data.permissions[permission]
			if rank_permission ~= nil then
				return rank_permission
			end

			rank = rank.inherit
		else
			return false
		end
	end
end

function sam.ranks.get_limit(rank, limit_type)
	while true do
		if rank == "superadmin" then return -1 end

		rank = sam.ranks.get_rank(rank)

		if rank then
			local limit = rank.data.limits[limit_type]
			if limit ~= nil then
				return limit
			end

			rank = rank.inherit
		else
			return cvars.Number("sbox_max" .. limit_type, 0)
		end
	end
end

function sam.ranks.get_immunity(rank)
	rank = sam.ranks.get_rank(rank)
	return rank and rank.immunity or false
end

function sam.ranks.can_target(rank_1, rank_2)
	rank_1, rank_2 = sam.ranks.get_rank(rank_1), sam.ranks.get_rank(rank_2)
	if not rank_1 or not rank_2 then
		return false
	end
	return rank_1.immunity >= rank_2.immunity
end

function sam.ranks.get_ban_limit(rank)
	rank = sam.ranks.get_rank(rank)
	return rank and rank.ban_limit or false
end

if CLIENT then
	hook.Add("SAM.ChangedGlobalVar", "SAM.Ranks.CheckLoadedRanks", function(key, value)
		if key == "Ranks" then
			hook.Call("SAM.LoadedRanks", nil, value)
			hook.Remove("SAM.ChangedGlobalVar", "SAM.Ranks.CheckLoadedRanks")
		end
	end)
end

--PATH addons/sam-157/lua/sam/command/arguments/number.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local get_number = function(argument, input, gsub)
	if (input == "" or input == nil) and argument.optional then
		if argument.default ~= nil then
			return argument.default
		end
		return ""
	end

	local number = tonumber(input)
	if gsub ~= false and not isnumber(number) then
		number = tonumber(input:gsub("%D", ""), 10 /*gsub returns two args*/)
	end

	return number
end

command.new_argument("number")
	:OnExecute(function(argument, input, ply, _, result, i)
		local number = get_number(argument, input)
		if number == "" then
			result[i] = nil
		elseif not number then
			ply:sam_send_message("invalid", {
				S = argument.hint or "number", S_2 = input
			})
			return false
		else
			if argument.min then
				number = math.max(number, argument.min)
			end

			if argument.max then
				number = math.min(number, argument.max)
			end

			if argument.round then
				number = math.Round(number)
			end

			result[i] = number
		end
	end)
	:Menu(function(set_result, body, buttons, argument)
		local number_entry = buttons:Add("SAM.TextEntry")
		number_entry:SetUpdateOnType(true)
		number_entry:SetNumeric(true)
		number_entry:SetTall(25)

		number_entry:SetCheck(function(number)
			number = get_number(argument, number, false)
			set_result(number)
			return number or false
		end)

		local hint = argument.hint or "number"
		if argument.default then
			hint = hint .. " = " .. tostring(argument.default)
		end
		number_entry:SetPlaceholder(hint)

		return number_entry
	end)
:End()
--PATH addons/sam-157/lua/sam/command/arguments/steamid.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local cached_ranks = {}
local targeting_offline = {}

local check_steamid = function(steamid)
	if not sam.is_steamid(steamid) then
		if sam.is_steamid64(steamid) then
			return util.SteamIDFrom64(steamid)
		else
			return nil
		end
	end

	return steamid
end

local can_target_steamid_callback = function(data, promise)
	local ply, steamid = promise.ply, promise.steamid

	if not data or sam.ranks.can_target(promise.rank, data.rank) then
		promise:resolve({steamid})
	elseif IsValid(ply) then
		ply:sam_send_message("cant_target_player", {
			S = steamid
		})
	end

	targeting_offline[ply] = nil
	cached_ranks[steamid] = data ~= nil and data or false
end

command.new_argument("steamid")
	:OnExecute(function(argument, input, ply, _, result, i)
		local steamid = check_steamid(input)
		if not steamid then
			ply:sam_send_message("invalid", {
				S = "steamid/steamid64", S_2 = input
			})
			return false
		end

		if argument.allow_higher_target then
			result[i] = steamid
			return
		end

		local promise = sam.Promise.new()
		promise.ply = ply
		promise.rank = ply:GetUserGroup()
		promise.steamid = steamid

		local target = player.GetBySteamID(steamid)
		if sam.isconsole(ply) then
			promise:resolve({steamid})
		elseif target then
			if ply:CanTarget(target) then
				promise:resolve({steamid, target})
			else
				ply:sam_send_message("cant_target_player", {
					S = steamid
				})
			end
		elseif cached_ranks[steamid] ~= nil then
			can_target_steamid_callback(cached_ranks[steamid], promise)
		else
			targeting_offline[ply] = true

			sam.SQL.FQuery([[
				SELECT
					`rank`
				FROM
					`sam_players`
				WHERE
					`steamid` = {1}
			]], {steamid}, can_target_steamid_callback, true, promise)
		end

		result[i] = promise
	end)
	:Menu(function(set_result, body, buttons, argument)
		local steamid_entry = buttons:Add("SAM.TextEntry")
		steamid_entry:SetTall(25)
		steamid_entry:SetUpdateOnType(true)
		steamid_entry:SetPlaceholder("steamid/steamid64")

		steamid_entry:SetCheck(function(steamid)
			steamid = check_steamid(steamid)
			set_result(steamid)
			return steamid or false
		end)

		return steamid_entry
	end)
:End()

timer.Create("SAM.ClearCachedRanks", 60 * 2.5, 0, function()
	table.Empty(cached_ranks)
end)

hook.Add("SAM.ChangedSteamIDRank", "RemoveIfCached", function(steamid)
	cached_ranks[steamid] = nil
end)

hook.Add("SAM.CanRunCommand", "StopIfTargetingOffline", function(ply)
	if targeting_offline[ply] then
		return false
	end
end)

--PATH addons/sui/lua/sui/libs/tdlib/cl_tdlib.lua:
--[[
	Three's Derma Lib
	Made by Threebow

	You are free to use this anywhere you like, or sell any addons
	made using this, as long as I am properly accredited.
]]

local pairs = pairs
local ipairs = ipairs
local Color = Color
local render = render
local SysTime = SysTime
local Lerp, RealFrameTime = Lerp, RealFrameTime
local RoundedBox, RoundedBoxEx, NoTexture = draw.RoundedBox, draw.RoundedBoxEx, draw.NoTexture
local SetDrawColor, DrawRect = surface.SetDrawColor, surface.DrawRect
local DrawPoly = surface.DrawPoly
local sui = sui

local Panel = FindMetaTable("Panel")

--[[
	Constants
]]
local BLUR = CreateMaterial("SUI.TDLib.Blur", "gmodscreenspace", {
	["$basetexture"] = "_rt_fullframefb",
	["$blur"] = (1 / 3) * 7,
})

local COL_WHITE_1 = Color(255, 255, 255)
local COL_WHITE_2 = Color(255, 255, 255, 30)

--[[
	credits to http://slabode.exofire.net/circle_draw.shtml
]]
local calculate_circle do
	local cos = math.cos
	local sin = math.sin
	local round = math.Round
	local sqrt = math.sqrt
	local pi = math.pi
	calculate_circle = function(circle, x_centre, y_centre, r)
		if circle.x == x_centre and circle.y == y_centre and circle.r == r then return end

		local step = (2 * pi) / round(6 * sqrt(r))

		local i = 0
		for theta = 2 * pi, 0, -step do
			local x = x_centre + r * cos(theta)
			local y = y_centre - r * sin(theta)
			i = i + 1
			circle[i] = {
				x = x,
				y = y
			}
		end

		for i = i + 1, #circle do
			circle[i] = nil
		end

		circle.x = x_centre
		circle.y = y_centre
		circle.r = r
	end
end

--[[
void DrawArc(float cx, float cy, float r, float start_angle, float arc_angle, int num_segments)
{
	float theta = arc_angle / float(num_segments - 1);//theta is now calculated from the arc angle instead, the - 1 bit comes from the fact that the arc is open

	float tangetial_factor = tanf(theta);

	float radial_factor = cosf(theta);


	float x = r * cosf(start_angle);//we now start at the start angle
	float y = r * sinf(start_angle);

	glBegin(GL_LINE_STRIP);//since the arc is not a closed curve, this is a strip now
	for(int ii = 0; ii < num_segments; ii++)
	{
		glVertex2f(x + cx, y + cy);

		float tx = -y;
		float ty = x;

		x += tx * tangetial_factor;
		y += ty * tangetial_factor;

		x *= radial_factor;
		y *= radial_factor;
	}
	glEnd();
}
]]

local copy_color = function(color)
	return Color(color.r, color.g, color.b, color.a)
end

local color_alpha = function(color, a)
	color.a = a
	return color
end

--[[
	Collection of various utilities
]]

local TDLibUtil = {}

function TDLibUtil.DrawCircle(circle, x, y, r, color)
	calculate_circle(circle, x, y, r)

	SetDrawColor(color)
	NoTexture()
	DrawPoly(circle)
end
local DrawCircle = TDLibUtil.DrawCircle

do
	local SetMaterial = surface.SetMaterial
	local UpdateScreenEffectTexture, DrawTexturedRect, SetScissorRect = render.UpdateScreenEffectTexture, surface.DrawTexturedRect, render.SetScissorRect

	local scrW, scrH = ScrW(), ScrH()
	hook.Add("OnScreenSizeChanged", "SUI.TDLib", function()
		scrW, scrH = ScrW(), ScrH()
	end)

	function TDLibUtil.BlurPanel(s)
		local x, y = s:LocalToScreen(0, 0)

		SetDrawColor(255, 255, 255)
		SetMaterial(BLUR)

		for i = 1, 2 do
			UpdateScreenEffectTexture()
			DrawTexturedRect(x * -1, y * -1, scrW, scrH)
		end
	end

	function TDLibUtil.DrawBlur(x, y, w, h)
		SetDrawColor(255, 255, 255)
		SetMaterial(BLUR)

		SetScissorRect(x, y, x + w, y + h, true)
			for i = 1, 2 do
				UpdateScreenEffectTexture()
				DrawTexturedRect(-1, -1, scrW, scrH)
			end
		SetScissorRect(0, 0, 0, 0, false)
	end
end

local LibClasses = {}

do
	local on_funcs = {}

	function LibClasses:On(name, func)
		local old_func = self[name]

		if not old_func then
			self[name] = func
			return self
		end

		local name_2 = name .. "_funcs"

		-- we gotta avoid creating 13535035 closures
		if not on_funcs[name] then
			on_funcs[name] = function(s, a1, a2, a3, a4)
				local funcs = s[name_2]
				local i, n = 0, #funcs
				::loop::
				i = i + 1
				if i <= n then
					funcs[i](s, a1, a2, a3, a4)
					goto loop
				end
			end
		end

		if not self[name_2] then
			self[name] = on_funcs[name]
			self[name_2] = {
				old_func,
				func
			}
		else
			table.insert(self[name_2], func)
		end

		return self
	end
end

do
	local UnPredictedCurTime = UnPredictedCurTime

	local transition_func = function(s)
		local transitions = s.transitions
		local i, n = 0, #transitions
		::loop::
		i = i + 1

		if i <= n then
			local v = transitions[i]
			local name = v.name
			local v2 = s[name]
			if v.func(s) then
				if v.start_0 then
					v.start_1, v.start_0 = UnPredictedCurTime(), nil
				end

				if v2 ~= 1 then
					s[name] = Lerp((UnPredictedCurTime() - v.start_1) / v.time, v2, 1)
				end
			else
				if v.start_1 then
					v.start_0, v.start_1 = UnPredictedCurTime(), nil
				end

				if v2 ~= 0 then
					s[name] = Lerp((UnPredictedCurTime() - v.start_0) / v.time, v2, 0)
				end
			end

			goto loop
		end
	end

	function LibClasses:SetupTransition(name, time, func)
		self[name] = 0

		local transition = {
			name = name,
			time = time,
			func = func,
			start_0 = 0,
			start_1 = 0,
		}

		if self.transitions then
			for k, v in ipairs(self.transitions) do
				if v.name == name then
					self.transitions[k] = transition
					return self
				end
			end
			table.insert(self.transitions, transition)
		else
			self.transitions = {transition}
			self:On("Think", transition_func)
		end

		return self
	end
end

function LibClasses:ClearPaint()
	self.Paint = nil
	self.Paint_funcs = nil
	local SetPaintBackgroundEnabled = self.SetPaintBackgroundEnabled
	if SetPaintBackgroundEnabled then
		SetPaintBackgroundEnabled(self, false)
	end
	return self
end

function LibClasses:RoundedBox(id, r, x, y, w, h, c)
	self.colors = self.colors or {}
	local colors = self.colors

	local id_c = colors[id]
	if not id_c then
		id_c = Color(c:Unpack())
		colors[id] = id_c
	end

	sui.lerp_color(id_c, c)
	RoundedBox(r, x, y, w, h, id_c)
end

do
	local SetFGColor = Panel.SetFGColor

	local set_color = function(s, col)
		s.m_colText = col
		SetFGColor(s, col.r, col.g, col.b, col.a)
	end

	local paint = function(s)
		local col = s.sui_textcolor
		sui.lerp_color(col, s.new_col)
		set_color(s, col)
	end

	function LibClasses:TextColor(c, use_paint)
		local col = self.sui_textcolor
		if not col then
			col = Color(c:Unpack())
			self.sui_textcolor = col

			if use_paint then
				self:On("Paint", paint)
			end
		end

		if use_paint then
			self.new_col = c
		else
			sui.lerp_color(col, c)
			self:SetTextColor(col)
		end
	end
end

do
	local fade_hover_Paint = function(s, w, h)
		if s.FadeHovers ~= 0 then
			color_alpha(s.fadehover_color, s.fadehover_old_alpha * s.FadeHovers)
			if s.fadehover_radius > 0 then
				RoundedBox(s.fadehover_radius, 0, 0, w, h, s.fadehover_color)
			else
				SetDrawColor(s.fadehover_color)
				DrawRect(0, 0, w, h)
			end
		end
	end

	function LibClasses:FadeHover(color, time, radius, func)
		color = copy_color(color or COL_WHITE_2)
		self.fadehover_color = color
		self.fadehover_radius = radius or 0
		self.fadehover_old_alpha = color.a
		self:SetupTransition("FadeHovers", time or 0.8, func or TDLibUtil.HoverFunc)
		self:On("Paint", fade_hover_Paint)
		return self
	end
end

function LibClasses:BarHover(color, height, time)
	color = color or COL_WHITE_1
	height = height or 2
	time = time or 1.6
	self:SetupTransition("BarHovers", time, TDLibUtil.HoverFunc)
	self:On("Paint", function(s, w, h)
		if s.BarHovers ~= 0 then
			local bar = Round(w * s.BarHovers)
			SetDrawColor(color)
			DrawRect((w / 2) - (bar / 2), h - height, bar, height)
		end
	end)
	return self
end

do
	local paint = function(s, w, h)
		draw.RoundedBox(0, 0, 0, w, h, s.SUI_GetColor("line"))
	end

	function LibClasses:Line(dock, m1, m2, m3, m4)
		self.making_line = true

		local line = self:Add("SAM.Panel")
		line:Dock(dock or TOP)

		if self.line_margin then
			line:DockMargin(unpack(self.line_margin))
		else
			line:DockMargin(m1 or 0, m2 or 0, m3 or 0, m4 or 10)
		end

		line.no_scale = true
		line:SetTall(1)
		line.Paint = paint

		self.making_line = false
		return line
	end

	function LibClasses:LineMargin(m1, m2, m3, m4)
		self.line_margin = {m1 or 0, m2 or 0, m3 or 0, m4 or 0}
		return self
	end
end

do
	local background_Paint_1 = function(s)
		s:SetBGColor(s.background_color)
	end

	local background_Paint_2 = function(s, w, h)
		RoundedBoxEx(s.background_radius, 0, 0, w, h, s.background_color, true, true, true, true)
	end

	local background_Paint_3 = function(s, w, h)
		RoundedBoxEx(s.background_radius, 0, 0, w, h, s.background_color, s.background_r_tl, s.background_r_tr, s.background_r_bl, s.background_r_br)
	end

	function LibClasses:Background(color, radius, r_tl, r_tr, r_bl, r_br)
		self.background_color = color
		if isnumber(radius) and radius ~= 0 then
			self.background_radius = radius
			if isbool(r_tl) or isbool(r_tr) or isbool(r_bl) or isbool(r_br) then
				self.background_r_tl = r_tl
				self.background_r_tr = r_tr
				self.background_r_bl = r_bl
				self.background_r_br = r_br
				self:On("Paint", background_Paint_3)
			else
				self:On("Paint", background_Paint_2)
			end
		else
			self:SetPaintBackgroundEnabled(true)
			self:On("ApplySchemeSettings", background_Paint_1)
			self:On("PerformLayout", background_Paint_1)
		end
		return self
	end
end

function LibClasses:CircleClick(color, speed, target_radius)
	self.circle_click_color = color or COL_WHITE_2

	speed = speed or 5
	target_radius = isnumber(target_radius) and target_radius or false

	local radius, alpha, click_x, click_y = 0, -1, 0, 0
	local circle = {}
	self:On("Paint", function(s, w)
		if alpha >= 0 then
			DrawCircle(circle, click_x, click_y, radius, ColorAlpha(self.circle_click_color, alpha))
			local frame_time = RealFrameTime()
			radius, alpha = Lerp(frame_time * speed, radius, target_radius or w), Lerp(frame_time * speed, alpha, -1)
		end
	end)
	self:On("DoClick", function()
		click_x, click_y = self:CursorPos()
		radius, alpha = 0, self.circle_click_color.a
	end)
	return self
end

do
	local min = math.min
	function LibClasses:CircleClick2(color, speed, target_radius, start_radius)
		color = color or COL_WHITE_2
		local _color = Color(color:Unpack())

		speed = speed or 5
		target_radius = isnumber(target_radius) and target_radius or false

		local radius, alpha = 0, -1
		local circle = {}
		self:On("Paint", function(s, w, h)
			if alpha >= 0 then
				_color.a = alpha
				DrawCircle(circle, w / 2, h / 2, radius, _color)

				local frame_time = RealFrameTime()
				radius, alpha = Lerp(frame_time * speed, radius, target_radius or min(w, h) / 2), Lerp(frame_time * speed, alpha, -1)
			end
		end)

		self:On("DoClick", function()
			radius, alpha = start_radius or 0, color.a
		end)

		return self
	end
end

-- https://github.com/Facepunch/garrysmod/pull/1520#issuecomment-410458090
function LibClasses:Outline(color, width)
	color = color or COL_WHITE_1
	width = width or 1
	self:On("Paint", function(s, w, h)
		SetDrawColor(color)
		DrawRect(0, 0, w, width)
		DrawRect(0, h - width, w, width)
		DrawRect(0, width, width, h - (width * 2))
		DrawRect(w - width, width, width, h - (width * 2))
	end)
	return self
end

function LibClasses:LinedCorners(color, len)
	color = color or COL_WHITE_1
	len = len or 15
	self:On("Paint", function(s, w, h)
		SetDrawColor(color)
		DrawRect(0, 0, len, 1)
		DrawRect(0, 1, 1, len - 1)
		DrawRect(w - len, h - 1, len, 1)
		DrawRect(w - 1, h - len, 1, len - 1)
	end)
	return self
end

function LibClasses:SideBlock(color, size, side)
	color = color or COL_WHITE_1
	size = size or 3
	side = side or LEFT
	self:On("Paint", function(s, w, h)
		SetDrawColor(color)
		if side == LEFT then
			DrawRect(0, 0, size, h)
		elseif side == TOP then
			DrawRect(0, 0, w, size)
		elseif size == RIGHT then
			DrawRect(w - size, 0, size, h)
		elseif side == BOTTOM then
			DrawRect(0, h - size, w, size)
		end
	end)
	return self
end

function LibClasses:Blur()
	self:On("Paint", TDLibUtil.BlurPanel)
	return self
end

do
	local STENCILOPERATION_REPLACE = STENCILOPERATION_REPLACE
	local STENCILOPERATION_ZERO = STENCILOPERATION_ZERO
	local STENCILCOMPARISONFUNCTION_NEVER = STENCILCOMPARISONFUNCTION_NEVER
	local STENCILCOMPARISONFUNCTION_EQUAL = STENCILCOMPARISONFUNCTION_EQUAL

	local ClearStencil = render.ClearStencil
	local SetStencilEnable = render.SetStencilEnable
	local SetStencilWriteMask = render.SetStencilWriteMask
	local SetStencilTestMask = render.SetStencilTestMask
	local SetStencilFailOperation = render.SetStencilFailOperation
	local SetStencilPassOperation = render.SetStencilPassOperation
	local SetStencilZFailOperation = render.SetStencilZFailOperation
	local SetStencilCompareFunction = render.SetStencilCompareFunction
	local SetStencilReferenceValue = render.SetStencilReferenceValue

	local color_white = color_white

	local avatar_setplayer = function(s, ply, size)
		s.avatar:SetPlayer(ply, size)
	end

	local avatar_setsteamid = function(s, steamid, size)
		s.avatar:SetSteamID(steamid, size)
	end

	function LibClasses:CircleAvatar()
		local avatar = self:Add("AvatarImage")
		avatar:Dock(FILL)
		avatar:SetPaintedManually(true)
		self.avatar = avatar
		self.SetSteamID = avatar_setsteamid
		self.SetPlayer = avatar_setplayer

		local circle = {}
		local PaintManual = avatar.PaintManual
		self.Paint = function(s, w, h)
			ClearStencil()
			SetStencilEnable(true)

			SetStencilWriteMask(1)
			SetStencilTestMask(1)

			SetStencilFailOperation(STENCILOPERATION_REPLACE)
			SetStencilPassOperation(STENCILOPERATION_ZERO)
			SetStencilZFailOperation(STENCILOPERATION_ZERO)
			SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
			SetStencilReferenceValue(1)

			local a = w / 2
			DrawCircle(circle, a, a, a, color_white)

			SetStencilFailOperation(STENCILOPERATION_ZERO)
			SetStencilPassOperation(STENCILOPERATION_REPLACE)
			SetStencilZFailOperation(STENCILOPERATION_ZERO)
			SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
			SetStencilReferenceValue(1)

			PaintManual(avatar)

			SetStencilEnable(false)
		end
		return self
	end
end

do
	function LibClasses:AnimationThinkInternal()
		local systime = SysTime()

		if self.Term and self.Term <= systime then
			self:Remove()

			return
		end

		local m_AnimList = self.m_AnimList
		if not m_AnimList then return end

		for i = #m_AnimList, 1, -1 do
			local anim = m_AnimList[i]
			if systime >= anim.StartTime then
				local frac = math.TimeFraction(anim.StartTime, anim.EndTime, systime)
				frac = math.Clamp(frac, 0, 1)

				local Think = anim.Think
				if Think then
					Think(anim, self, frac ^ (1.0 - (frac - 0.5)))
				end

				if frac == 1 then
					local OnEnd = anim.OnEnd
					if OnEnd then
						OnEnd(anim, self)
					end

					m_AnimList[i] = nil
				end
			end
		end
	end

	local sort = function(a, b)
		return a.EndTime > b.EndTime
	end

	function LibClasses:NewAnimation(length, delay, ease, callback)
		delay = delay or 0
		ease = ease or -1

		if self.m_AnimQueue then
			delay = delay + self:AnimTail()
			self.m_AnimQueue = false
		else
			delay = delay + SysTime()
		end

		local anim = {
			StartTime = delay,
			EndTime = delay + length,
			Ease = ease,
			OnEnd = callback
		}

		self:SetAnimationEnabled(true)

		if self.m_AnimList == nil then
			self.m_AnimList = {}
		end

		table.insert(self.m_AnimList, anim)
		table.sort(self.m_AnimList, sort)

		self.AnimationThink = self.AnimationThinkInternal

		return anim
	end

	local MoveThink = function(anim, panel, frac)
		if not anim.startx then
			anim.startx = panel.x
			anim.starty = panel.y
		end

		local x = Lerp(frac, anim.startx, anim.x)
		local y = Lerp(frac, anim.starty, anim.y)
		panel:SetPos(x, y)
	end

	function LibClasses:MoveTo(x, y, length, delay, ease, callback)
		if self.x == x and self.y == y then return end

		local anim = self:NewAnimation(length, delay, ease, callback)
		anim.x = x
		anim.y = y
		anim.Think = MoveThink
	end

	local SetSize = Panel.SetSize
	local SizeThink = function(anim, panel, frac)
		if not anim.startw then
			anim.startw, anim.starth = panel:GetSize()
		end

		local w, h
		if anim.sizew and anim.sizeh then
			w = Lerp(frac, anim.startw, anim.w)
			h = Lerp(frac, anim.starth, anim.h)
			SetSize(panel, w, h)
		elseif anim.sizew then
			w = Lerp(frac, anim.startw, anim.w)
			SetSize(panel, w, panel.starth)
		else
			h = Lerp(frac, anim.starth, anim.h)
			SetSize(panel, panel.startw, h)
		end

		if panel:GetDock() > 0 then
			panel:InvalidateParent()
		end
	end

	function LibClasses:SizeTo(w, h, length, delay, ease, callback)
		local anim = self:NewAnimation(length, delay, ease, callback)

		if w ~= -1 then
			anim.sizew = true
		end

		if h ~= -1 then
			anim.sizeh = true
		end

		anim.w, anim.h = w, h
		anim.Think = SizeThink

		return anim
	end

	local SetVisible = Panel.SetVisible
	local IsVisible = Panel.IsVisible

	local is_visible = function(s)
		local state = s.visible_state
		if state ~= nil then
			return state
		else
			return IsVisible(s)
		end
	end

	function LibClasses:AnimatedSetVisible(visible, cb)
		if visible == is_visible(self) then
			if cb then
				cb()
			end
			return
		end

		if visible then
			SetVisible(self, true)
		end

		self.visible_state = visible
		self:Stop()

		self:AlphaTo(visible and 255 or 0, 0.2, 0, function()
			SetVisible(self, visible)
			self:InvalidateParent(true)
			if cb then
				cb()
			end
		end)

		self:InvalidateParent(true)
	end

	function LibClasses:AnimatedToggleVisible()
		self:AnimatedSetVisible(not is_visible(self))
	end

	function LibClasses:AnimatedIsVisible()
		return is_visible(self)
	end
end

function Panel:SUI_TDLib()
	for k, v in pairs(LibClasses) do
		self[k] = v
	end
	return self
end

TDLibUtil.Install = Panel.SUI_TDLib

local count = 0
TDLibUtil.Start = function()
	count = count + 1
	for k, v in pairs(LibClasses) do
		if not Panel["SUI_OLD" .. k] then
			local old = Panel[k]
			if old == nil then
				old = v
			end
			Panel[k], Panel["SUI_OLD" .. k] = v, old
		end
	end
end

TDLibUtil.End = function()
	count = count - 1
	if count > 0 then return end
	for k, v in pairs(LibClasses) do
		local old = Panel["SUI_OLD" .. k]
		if old == v then
			Panel[k] = nil
		else
			Panel[k] = old
		end
		Panel["SUI_OLD" .. k] = nil
	end
end

TDLibUtil.HoverFunc = function(p)
	return p:IsHovered() and not p:GetDisabled()
end

TDLibUtil.DrawOutlinedBox = function(radius, x, y, w, h, bg, outline, thickness)
	thickness = thickness or 2
	draw.RoundedBox(radius, x, y, w, h, outline)
	draw.RoundedBox(radius, x + thickness, y + thickness, w - (thickness * 2), h - (thickness * 2), bg)
end

do
	local cos, sin, sqrt = math.cos, math.sin, math.sqrt
	local clamp, floor = math.Clamp, math.floor
	local min, max = math.min, math.max

	local calc_ellipse_points = function(rx, ry)
		local points = sqrt(((rx * ry) / 2) * 6)
		return max(points, 8)
	end

	local M_PI = 3.14159265358979323846
	calc_rect = function(c, r, x, y, w, h)
		if
			(c.r == r) and
			(c.x == x and c.y == y) and
			(c.w == w and c.h == h)
		then return end

		r = clamp(r, 0, min(w, h) / 2)

		local rx, ry = r, r
		if w >= 0.02 then
			rx = min(rx, w / 2.0 - 0.01)
		end
		if h >= 0.02 then
			ry = min(ry, h / 2.0 - 0.01)
		end

		local points = max(calc_ellipse_points(rx, ry) / 4, 1)
		points = floor(points)

		local half_pi = M_PI / 2
		local angle_shift = half_pi / (points + 1)

		local phi = 0
		for i = 1, points + 2 do
			c[i] = {
				x = x + rx * (1 - cos(phi)),
				y = y + ry * (1 - sin(phi))
			}
			phi = phi + angle_shift
		end

		phi = half_pi
		for i = points + 3, 2 * (points + 2) do
			c[i] = {
				x = x + w - rx * (1 + cos(phi)),
				y = y +     ry * (1 - sin(phi))
			}
			phi = phi + angle_shift
		end

		phi = 2 * half_pi
		for i = (2 * (points + 2)) + 1, 3 * (points + 2) do
			c[i] = {
				x = x + w - rx * (1 + cos(phi)),
				y = y + h - ry * (1 + sin(phi))
			}
			phi = phi + angle_shift
		end

		phi = 3 * half_pi
		for i = (3 * (points + 2)) + 1, 4 * (points + 2) do
			c[i] = {
				x = x +     rx * (1 - cos(phi)),
				y = y + h - ry * (1 + sin(phi))
			}
			phi = phi + angle_shift
		end

		local last = (points + 2) * 4 + 1
		c[last] = c[1]

		for i = last + 1, #c do
			c[i] = nil
		end

		c.r = r
		c.x, c.y = x, y
		c.w, c.h = w, h
	end

	TDLibUtil.RoundedBox = function(c, r, x, y, w, h, color)
		calc_rect(c, r, x, y, w, h)

		SetDrawColor(color)
		NoTexture()
		DrawPoly(c)
	end
end

TDLibUtil.LibClasses = LibClasses

sui.TDLib = TDLibUtil
--PATH addons/sui/lua/sui/vgui/sui_combobox.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local TEXT_FONT = SUI.CreateFont("ComboBox", "Roboto Regular", 16)

local GetColor = SUI.GetColor
local draw_material = sui.draw_material

local PANEL = {}

PANEL.NoOverrideClear = true

sui.scaling_functions(PANEL)

function PANEL:Init()
	self:ScaleInit()
	self.DropButton:Remove()
	self:SetFont(TEXT_FONT)
	self:SetSize(34, 22)
	self:SetIsMenu(true)

	local image = self:Add(NAME .. ".Image")
	image:Dock(FILL)
	image:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sui/arrow.png")
	image.Draw = self.Paint
end

function PANEL:OpenMenu(pControlOpener)
	if pControlOpener and pControlOpener == self.TextEntry then return end
	if #self.Choices == 0 then return end

	if IsValid(self.Menu) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.Menu = vgui.Create(NAME .. ".Menu", self)
	self.Menu:SetInternal(self)

	for k, v in ipairs(self.Choices) do
		self.Menu:AddOption(v, function()
			self:ChooseOption(v, k)
		end)
	end

	local x, y = self:LocalToScreen(0, self:GetTall())
	self.Menu:SetMinimumWidth(self:GetWide())
	self.Menu:Open(x, y, false, self)
end

function PANEL:Paint(w, h, from_image)
	local text_color = GetColor("menu_option_hover_text")

	if from_image then
		local size = SUI.ScaleEven(10)
		draw_material(nil, w - (size / 2) - 6, h / 2, size, text_color)
	else
		local col = GetColor("menu")
		self:RoundedBox("Background", 4, 0, 0, w, h, col)
		self:SetTextColor(text_color)
	end
end

function PANEL:PerformLayout()
end

sui.register("ComboBox", PANEL, "DComboBox")
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

--PATH addons/sui/lua/sui/vgui/sui_panel.lua:
local PANEL = {}

sui.scaling_functions(PANEL)

function PANEL:Init()
	self:ScaleInit()
end

sui.register("Panel", PANEL, "Panel")
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
--PATH addons/sam-157/lua/sam/menu/tabs/config/reports.lua:
if SAM_LOADED then return end

local sam = sam
local config = sam.config

local not_empty = function(s)
	return s and s ~= ""
end

local number_entry = function(setting, config_key, default)
	local entry = setting:Add("SAM.TextEntry")
	entry:SetWide(50)
	entry:SetPlaceholder("")
	entry:SetBackground(Color(34, 34, 34))
	entry:SetNumeric(true)
	entry:DisallowFloats()
	entry:DisallowNegative()
	entry:SetCheck(not_empty)
	entry:SetConfig(config_key, default)

	return entry
end

config.add_tab("Reports", function(parent)
	local body = parent:Add("SAM.ScrollPanel")
	body:Dock(FILL)
	body:LineMargin(0, 6, 0, 0)

	local i = 0
	body:GetCanvas():On("OnChildAdded", function(s, child)
		i = i + 1
		child:SetZPos(i)

		if not body.making_line then
			body:Line()
		end
	end)

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Enable")
		setting:DockMargin(8, 6, 8, 0)

		local enable = setting:Add("SAM.ToggleButton")
		enable:SetConfig("Reports", true)
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Commands")
		setting:DockMargin(8, 6, 8, 0)

		local entry = setting:Add("SAM.TextEntry")
		entry:SetWide(200)
		entry:SetNoBar(true)
		entry:SetPlaceholder("")
		entry:SetMultiline(true)
		entry:SetConfig("Reports.Commands")
		entry.no_scale = true

		function entry:OnValueChange()
			self:SetTall(self:GetNumLines() * (sam.SUI.Scale(16) --[[font size]] + 1) + 1 + 2)
		end
		entry:OnValueChange()
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Max Reports (Number of reports that can show on your screen)")
		setting:DockMargin(8, 6, 8, 0)

		number_entry(setting, "Reports.MaxReports", 4)
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Auto Close Time (Time to wait before automatically closing claimed reports)")
		setting:DockMargin(8, 6, 8, 0)

		local entry = setting:Add("SAM.TextEntry")
		entry:SetWide(70)
		entry:SetNoBar(false)
		entry:SetPlaceholder("")
		entry:SetCheck(function(time)
			time = sam.parse_length(time)
			if not time then
				return false
			end
		end)
		entry:SetConfig("Reports.AutoCloseTime", "10m")
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Always Show (Show the popups even if you are not on duty)")
		setting:DockMargin(8, 6, 8, 0)

		local enable = setting:Add("SAM.ToggleButton")
		enable:SetConfig("Reports.AlwaysShow", true)
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("On Duty Jobs")
		setting:DockMargin(8, 6, 8, 0)

		local entry = setting:Add("SAM.TextEntry")
		entry:SetWide(300)
		entry:SetNoBar(true)
		entry:SetPlaceholder("")
		entry:SetMultiline(true)
		entry:SetConfig("Reports.DutyJobs", "")
		entry.no_scale = true

		function entry:OnValueChange()
			self:SetTall(self:GetNumLines() * (sam.SUI.Scale(16) --[[font size]] + 1) + 1 + 2)
		end
		entry:OnValueChange()
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Position")
		setting:DockMargin(8, 6, 8, 0)

		local combo = setting:Add("SAM.ComboBox")
		combo:SetWide(60)
		combo:AddChoice("Left", nil, true)
		combo:AddChoice("Right")
		combo:SetConfig("Reports.Position", "Left")
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("X Padding")
		setting:DockMargin(8, 6, 8, 0)

		number_entry(setting, "Reports.XPadding", 5)
	end

	do
		local setting = body:Add("SAM.LabelPanel")
		setting:Dock(TOP)
		setting:SetLabel("Y Padding")
		setting:DockMargin(8, 6, 8, 0)

		number_entry(setting, "Reports.YPadding", 5)
	end

	return body
end, function()
	return LocalPlayer():HasPermission("manage_config")
end, 2)
--PATH addons/sui/lua/sui/libs/png_encoder.lua:
local string = string
local table = table
local bit = bit

local char = string.char
local byte = string.byte

local insert = table.insert
local concat = table.concat

local bor = bit.bor
local bxor = bit.bxor
local band = bit.band
local bnot = bit.bnot
local lshift = bit.lshift
local rshift = bit.rshift

local ceil = math.ceil

local SIGNATURE = char(137, 80, 78, 71, 13, 10, 26, 10)

local crc_table = {}; do
	local n = 0
	while n < 256 do
		local c = n
		local k = 0
		while k < 8 do
			if band(c, 1) ~= 0 then
				c = bxor(0xedb88320, rshift(c, 1))
			else
				c = rshift(c, 1)
			end
			k = k + 1
		end
		crc_table[n + 1] = c
		n = n + 1
	end
end

local crc = function(buf)
	local c = 0xffffffff
	for i = 1, #buf do
		c = bxor(crc_table[band(bxor(c, byte(buf, i)), 0xff) + 1], rshift(c, 8))
	end
	return bxor(c, 0xffffffff)
end

local dword_as_string = function(dword)
	return char(
		rshift(band(dword, 0xff000000), 24),
		rshift(band(dword, 0x00ff0000), 16),
		rshift(band(dword, 0x0000ff00), 8),
		band(dword, 0x000000ff)
	)
end

local create_chunk = function(type, data, length)
	local CRC = crc(type .. data)
	return concat({
		dword_as_string(length or #data),
		type,
		data,
		dword_as_string(CRC)
	}, "", 1, 4)
end

local create_IHDR; do
	local ARGS = (
		-- bit depth
		char(8) ..
		-- color type: 6=truecolor with alpha
		char(6) ..
		-- compression method: 0=deflate, only allowed value
		char(0) ..
		-- filtering: 0=adaptive, only allowed value
		char(0) ..
		-- interlacing: 0=none
		char(0)
	)

	create_IHDR = function(w, h)
		return create_chunk("IHDR", concat({
			dword_as_string(w),
			dword_as_string(h),
			ARGS
		}, "", 1, 3), 13)
	end
end

local deflate_pack; do
	local BASE = 6552
	local NMAX = 5552
	local adler32 = function(str)
		local s1 = 1
		local s2 = 0
		local n = NMAX

		for i = 1, #str do
			s1 = s1 + byte(str, i)
			s2 = s2 + s1

			n = n - 1
			if n == 0 then
				s1 = s1 % BASE
				s2 = s2 % BASE
				n = NMAX
			end
		end

		s1 = s1 % BASE
		s2 = s2 % BASE

		return bor(lshift(s2, 16), s1)
	end

	local splitChunks = function(chunk, chunkSize)
		local len = ceil(#chunk / chunkSize)
		local ret = {}
		for i = 1, len do
			ret[i - 1] = chunk:sub(((i - 1) * chunkSize) + 1, chunkSize)
		end
		return ret
	end

	deflate_pack = function(str)
		local ret = {"\x78\x9c"}

		local chunks = splitChunks(str, 0xFFFF)
		local len = #chunks

		local i = 0
		while i < (len + 1) do
			local chunk = chunks[i]
			local chunk_n = #chunk

			insert(ret, i < len and "\x00" or "\x01")
			insert(ret, char(band(chunk_n, 0xff), band(rshift(chunk_n, 8), 0xff)))
			insert(ret, char(band(bnot(chunk_n), 0xff), band(rshift(bnot(chunk_n), 8), 0xff)))
			insert(ret, chunk)
			i = i + 1
		end

		local t = adler32(str)
		t = char(
			band(rshift(t, 24), 0xff),
			band(rshift(t, 16), 0xff),
			band(rshift(t, 8), 0xff),
			band(t, 0xff)
		)

		insert(ret, t)

		return concat(ret)
	end
end

local create_IDAT; do
	local slice = function(a, s, e)
		local ret, j = {}, 0
		for i = s, e - 1 do
			ret[j] = char(band(a[i] or 0, 0xFF))
			j = j + 1
		end
		return ret
	end

	local array_split_chunks = function(w, h, array, chunkSize)
		local ret = {}
		local i = 0
		local len = ceil((w * h * 4 + 4) / chunkSize)
		while i < len do
			ret[i] = slice(array, i * chunkSize, (i + 1) * chunkSize)
			i = i + 1
		end
		return ret
	end

	create_IDAT = function(w, h, chunk)
		local scanlines = array_split_chunks(w, h, chunk, w * 4)

		local image_bytes = {}
		for i = 0, #scanlines do
			local scanline = scanlines[i]
			insert(image_bytes, char(band(0, 0xFF)))
			insert(image_bytes, concat(scanline, "", 0, #scanline))
		end
		image_bytes = deflate_pack(concat(image_bytes))

		return create_chunk("IDAT", image_bytes)
	end
end

local IEND = create_chunk("IEND", "", 0)
local to_return = {SIGNATURE, nil, nil, IEND}
local generate_png = function(w, h, chunk)
	local IHDR = create_IHDR(w, h)
	local IDAT = create_IDAT(w, h, chunk)

	to_return[2] = IHDR
	to_return[3] = IDAT

	return concat(to_return, "", 1, 4)
end

return generate_png
--PATH addons/sui/lua/sui/vgui/sui_zmenu.lua:
local BSHADOWS = sui.BSHADOWS
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor

local RoundedBox = sui.TDLib.LibClasses.RoundedBox
local TextColor = sui.TDLib.LibClasses.TextColor

local OPTION_FONT = SUI.CreateFont("MenuOption", "Roboto Medium", 15, 500)

local PANEL = {}

AccessorFunc(PANEL, "m_bIsMenuComponent", "IsMenu")
AccessorFunc(PANEL, "m_bDeleteSelf", "DeleteSelf")
AccessorFunc(PANEL, "m_iMinimumWidth", "MinimumWidth")
AccessorFunc(PANEL, "m_SetInternal", "Internal")

PANEL:SetIsMenu(true)
PANEL:SetDeleteSelf(true)

local pad = 4
local max_height = 300

local PerformLayout = function(s)
	local w, h = s:ChildrenSize()
	if h > SUI.Scale(max_height) then
		h = SUI.Scale(max_height)
	end
	s:SetSize(math.max(s:GetMinimumWidth(), w), h)
end

function PANEL:Init()
	self:GetCanvas():DockPadding(0, pad, 0, pad)
	self:SetMinimumWidth(SUI.Scale(100))
	self:SetKeyboardInputEnabled(false)
	self:SetTall(pad * 2)
	self:SetAlpha(0)
	self.tall = pad * 2
	RegisterDermaMenuForClose(self)
	self:On("PerformLayoutInternal", PerformLayout)
end

function PANEL:Paint(w, h)
	local x, y = self:LocalToScreen()

	BSHADOWS.BeginShadow()
		self:RoundedBox("Background", pad, x, y, w, h, GetColor("menu"))
	BSHADOWS.EndShadow(1, 3, 3)

	self:MoveToFront()
end

function PANEL:Open(x, y)
	self:SizeToChildren(true, false)

	local w, h = self:GetSize()
	if h > SUI.Scale(max_height) then
		h = SUI.Scale(max_height)
	end

	local internal = self:GetInternal()
	internal:On("OnRemove", function()
		self:Remove()
	end)
	if not x then
		x, y = internal:LocalToScreen(0, 0)
		y = y + (internal:GetTall() + 2)
	end

	if y + h > ScrH() then
		y = y - h
	end

	if x + w > ScrW() then
		x = x - w
	end

	if y < 1 then
		y = 1
	end

	if x < 1 then
		x = 1
	end

	self:SetPos(x, y)
	self:MakePopup()
	self:AlphaTo(255, 0.23)
	self:SetDrawOnTop(true)
	self:MoveToFront()
end

local option_OnMouseReleased = function(s, mousecode)
	if s.Depressed and mousecode == MOUSE_LEFT then
		CloseDermaMenus()
	end
	DButton.OnMouseReleased(s, mousecode)
end

function PANEL:AddOption(str, callback)
	local option = self:Add("DButton")
	option:Dock(TOP)
	option:SetFont(OPTION_FONT)
	option:SetText(str)
	option:SizeToContentsX(20)
	option:SizeToContentsY(10)
	option:InvalidateLayout(true)
	option.OnMouseReleased = option_OnMouseReleased

	function option:Paint(w, h)
		RoundedBox(self, "Background", 0, 0, 0, w, h, self.Hovered and GetColor("menu_option_hover") or GetColor("menu_option"))
		TextColor(self, self.Hovered and GetColor("menu_option_hover_text") or GetColor("menu_option_text"))
	end

	option.DoClick = callback

	self.tall = self.tall + option:GetTall()
	self:SetTall(self.tall)

	return option
end

function PANEL:AddSpacer()
	local spacer = self:Add("Panel")
	spacer:Dock(TOP)
	spacer:DockMargin(0, 1, 0, 1)
	spacer:SetTall(2)

	function spacer:Paint(w, h)
		RoundedBox(self, "Background", 0, 0, 0, w, h, GetColor("menu_spacer"))
	end

	spacer:InvalidateLayout(true)
end

sui.register("Menu", PANEL, NAME .. ".ScrollPanel")
--PATH addons/chatbox/lua/scb/vgui/scb_emojis.lua:
if SCB_LOADED then return end

local draw = draw
local IsValid = IsValid
local math = math
local pairs = pairs
local table = table
local SortedPairsByMemberValue = SortedPairsByMemberValue
local timer = timer

local scb = scb
local sui = sui
local SUI = scb.SUI
local language = scb.language

local Panel = {}

local flag = "flag_" .. (system.GetCountry() or ""):lower()
local categories = {
	People = {1, "grinning"},
	Nature = {2, "cat"},
	Food = {3, "watermelon"},
	Activities = {4, "person_in_lotus_position"},
	Travel = {5, "desert_island"},
	Objects = {6, "coffee"},
	Symbols = {7, "question"},
	Flags = {8, scb.emojis[flag] and flag or "flag_eg"},
	Custom = {9, "unlock"}
}

local generate_emojis = function()
	for k, v in pairs(categories) do
		local key = tostring(v[1])
		local emojis = {}

		local i, max_pos = 1, -math.huge
		for name, cat in pairs(scb.emojis) do
			local pos = i
			if not scb.is_custom_emoji(cat) then
				cat, pos = cat:sub(1, 1), tonumber(cat:sub(2))
			end

			if cat ~= key and (k ~= "Custom" or not scb.is_custom_emoji(cat)) then continue end

			emojis[pos] = name
			max_pos = math.max(max_pos, pos)

			i = i + 1
		end

		v[3] = emojis
		v[4] = max_pos
	end
end
generate_emojis()
hook.Add("SCB.EmojisModified", "FixEmojis", generate_emojis)

local DoClick = function(s)
	local text_entry = scb.chatbox.text_entry
	text_entry:RequestFocus()
	text_entry:AddValue(":" .. s.name .. ": ")

	s.parent:Remove()
end

local hovered_color = Color(50, 50, 50, 150)
local emoji_Paint = function(s, w, h)
	if s.parent.selected == s then
		s.search_field:SetPlaceholder(":" .. s.name .. ":")
		draw.RoundedBox(0, 0, 0, w, h, hovered_color)
	end
end

local emoji_OnCursorEntered = function(s, w, h)
	s.parent.selected = s
end

local category_list_Paint = function(_, w, h)
	draw.RoundedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"))
end

local make_category_list = function(parent, columns)
	local category_list = parent:Add("SCB.ThreeGrid")
	category_list:Dock(FILL)
	category_list:DockMargin(2, 0, 2, 2)
	category_list:GetCanvas():DockPadding(2, 2, 2, 2)
	category_list:InvalidateParent(true)
	category_list:SetWide2(category_list:GetWide() - (SUI.Scale(4) * 2))
	category_list:InvalidateParent(true)

	category_list:SetColumns(columns)
	category_list:SetHorizontalMargin(4)

	category_list.Paint = category_list_Paint

	return category_list
end

local add_emoji = function(self, emoji, category_list, search_field)
	if not IsValid(category_list) then return end

	local emoji_size = SUI.ScaleEven(28)

	local pnl = vgui.Create("DButton")
	pnl:SetTall(emoji_size)
	category_list:AddCell(pnl)

	pnl:SetSize(emoji_size, emoji_size)
	pnl:SetText("")
	pnl:SetTooltip(emoji)

	pnl.parent = self
	pnl.name = emoji
	pnl.search_field = search_field
	pnl.Paint = emoji_Paint
	pnl.OnCursorEntered = emoji_OnCursorEntered
	pnl.DoClick = DoClick

	local img = pnl:Add("SCB.Image")
	img:Dock(FILL)
	img:DockMargin(3, 3, 3, 3)
	img:SetMouseInputEnabled(false)

	local info = scb.emojis[emoji]
	img:SetImage(scb.is_custom_emoji(info) and info or ("scb/emojis/" .. emoji .. ".png"))
end

function Panel:Init()
	local has_permission = scb.has_permission(LocalPlayer(), "custom_emojis")
	local categories_n = table.Count(categories) - (has_permission and 0 or 1)

	self.tabs_tall = 30
	self.tab_scroller:SetTall(SUI.Scale(self.tabs_tall))

	self:SetFont(SCB_14)

	self.w = self.tab_scroller:GetTall() * categories_n
	self.h = self.w + 10

	self:InvalidateLayout(true)

	self.tab_scroller:Dock(BOTTOM)

	local emoji_size = SUI.ScaleEven(28)
	local columns = math.floor(self.w / emoji_size) - 1

	local search_field = self:Add("SCB.TextEntry")
	search_field:Dock(TOP)
	search_field:DockMargin(2, 2, 2, 2)
	search_field:SetPlaceholder(language.search)
	search_field:SetMouseInputEnabled(true)
	search_field:SetNoBar(true)

	local old_Paint = search_field.Paint
	function search_field:Paint(w, h)
		local outline = SUI.GetColor("scroll_panel_outline")
		if outline then
			sui.TDLib.DrawOutlinedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"), outline, 1)
		else
			draw.RoundedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"))
		end

		old_Paint(self, w, h)
	end

	function search_field.OnValueChange(s, value)
		if value == "" then
			if IsValid(s.search_body) then
				s.search_body:Remove()
			end
			self:SetActiveTab(self.tabs[1])
			search_field:SetPlaceholder(language.search)
			return
		end

		value = value:gsub(":", ""):lower()

		local search_body = s.search_body
		if not IsValid(search_body) then
			self:SetActiveTab(nil)

			search_body = self:Add("Panel")
			s.search_body = search_body
		end

		search_body:Dock(FILL)
		search_body:InvalidateParent(true)
		search_body:Clear()

		local category_list = make_category_list(search_body, columns)

		local main_i = 0
		for k, v in SortedPairsByMemberValue(categories, 1) do
			local emojis, n = v[3], v[4]
			for i = 1, n do
				local emoji = emojis[i]
				if not emoji then continue end
				if not emoji:find(value) then continue end

				timer.Simple(main_i * 0.004, function()
					add_emoji(self, emoji, category_list, search_field)
				end)

				main_i = main_i + 1
			end
		end
	end

	function self.tab_scroller:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, SUI.GetColor("header"))
	end

	for k, v in SortedPairsByMemberValue(categories, 1) do
		if k == "Custom" and not has_permission then continue end

		self:AddSheet(SUI.Material("scb/emojis/" .. v[2] .. ".png"), function(parent)
			local category_list = make_category_list(parent, columns)

			local emojis, n = v[3], v[4]
			for i = 1, n do
				local emoji = emojis[i]
				if not emoji then continue end

				timer.Simple(i * 0.004, function()
					add_emoji(self, emoji, category_list, search_field)
				end)
			end

			return category_list
		end):SetTooltip(k)
	end

	self:MakePopup()
	self:ParentToHUD()

	search_field:RequestFocus()

	hook.Add("VGUIMousePressed", self, function(_, panel, mouse_code)
		if self == panel then return end
		if self:IsOurChild(panel) then return end
		if mouse_code ~= MOUSE_LEFT then return end
		if panel == self.button then return end
		if panel == scb.chatbox.header then return end

		self:Remove()
	end)
end

function Panel:Paint(w, h)
	if SUI.GetColor("frame_blur") then
		sui.TDLib.BlurPanel(self)
	end

	draw.RoundedBox(0, 0, 0, w, h, SUI.GetColor("frame"))
end

function Panel:OnKeyCodePressed(key_code)
	if key_code == KEY_ENTER and IsValid(self.selected) then
		self.selected:DoClick()
	end
end

local anim_speed = 0.2
function Panel:FixPos()
	local w, h = self.w, self.h

	self:SetSize(s, w * 1.1, h * 1.1)
	self:SetPos(self:_GetPos())
	self:SetAlpha(0)

	self:SizeTo(w, h, anim_speed, 0, -1)
	local x, y = self:_GetPos(w, h)
	self:MoveTo(x, y, anim_speed, 0, -1)
	self:AlphaTo(255, anim_speed + 0.02, 0, function()
		self.Think = self._Think
	end)
end

function Panel:_GetPos(m_w, m_h)
	local button = self.button

	if not m_w then
		m_w, m_h = self:GetSize()
	end

	local x, y, w = button:GetBounds()
	x, y = button:LocalToScreen(0, 0)
	x = x - (m_w / 2 - w / 2)
	y = y - m_h - 4

	return x, y
end

function Panel:_Think()
	self:SetPos(self:_GetPos())
	self:MoveToFront()
end

sui.register("EmojiList", Panel, "SCB.PropertySheet")
--PATH addons/chatbox/lua/scb/vgui/scb_emojis_select.lua:
if SCB_LOADED then return end

local draw = draw

local scb = scb
local sui = sui
local SUI = scb.SUI

local Panel = {}

AccessorFunc(Panel, "m_bTextEntry", "TextEntry")

function Panel:Init()
	self.emojis = {}
end

local line_DoClick = function(s)
	local parent = s:GetParent()
	parent[KEY_ENTER](parent)
end

local emoji_Paint = function(s, w, h)
	local parent = s.parent
	if parent.selected_emoji == s then
		draw.RoundedBox(0, 0, 0, w, h, SUI.GetColor("emoji_select_menu_selected"))
	end
end

local emoji_OnCursorEntered = function(s)
	s.parent.selected_emoji = s.emoji
end

function Panel:AddEmoji(name)
	local line = self:Add("DButton")
	line:Dock(TOP)
	line:SetTall(SUI.ScaleEven(22))
	line:InvalidateParent(true)
	line:SetText("")
	line.Paint = nil
	line.DoClick = line_DoClick
	line.parent = self
	line.OnCursorEntered = emoji_OnCursorEntered

	local emoji = line:Add("SCB.ChatLine")
	emoji:Dock(NODOCK)
	emoji:SetSize(line:GetSize())
	emoji:NewLabel(" ")
	emoji:NewEmoji(name, scb.emojis[name], 20)
	emoji:NewLabel(" :" .. name .. ":")
	emoji:Center()
	emoji:SetMouseInputEnabled(false)

	emoji.parent = self
	emoji.name = name
	emoji.Paint = emoji_Paint

	emoji.i = table.insert(self.emojis, emoji)

	if emoji.i == 1 then
		self.selected_emoji = emoji
	end

	line.emoji = emoji

	self:InvalidateLayout(true)
	self:SizeToChildren(false, true)

	return emoji
end

function Panel:SetStartEnd(start, _end)
	self.start, self._end = start, _end
end

function Panel:Paint(w, h)
	if SUI.GetColor("frame_blur") then
		sui.TDLib.BlurPanel(self)
	end

	draw.RoundedBox(3, 0, 0, w, h, SUI.GetColor("emoji_select_menu"))
end

Panel[KEY_UP] = function(self)
	self.selected_emoji = self.emojis[self.selected_emoji.i - 1] or self.emojis[#self.emojis]
	return true
end

Panel[KEY_DOWN] = function(self)
	self.selected_emoji = self.emojis[self.selected_emoji.i + 1] or self.emojis[1]
	return true
end

Panel[KEY_ENTER] = function(self)
	local text_entry = self:GetTextEntry()
	text_entry:RequestFocus()
	text_entry:AddValue(":" .. self.selected_emoji.name .. ": ", self.start - 1, self._end + 1)

	scb.emoji_set_used(self.selected_emoji.name)
	return true
end
Panel[KEY_TAB] = Panel[KEY_ENTER]

Panel[KEY_ESCAPE] = function(self)
	gui.HideGameUI()
	self:Remove()
end

sui.register("EmojisSelect", Panel, "Panel")
--PATH lua/autorun/scorpionsound.lua:
CreateConVar( "player_dinosaur_sounds", "1", { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY } ) 
CreateConVar( "player_dinosaur_footsteps", "1", { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY } ) 

sound.AddSoundOverrides( "lua/scorpion_sound.lua" )

scorpion_sounds = "models/echo/ark/scorpion_pm.mdl"

hook.Add("PlayerDeathSound","scorpion_PlayerDeathSound",function(ply,velocity)
if GetConVarNumber( "player_dinosaur_sounds" ) == 1 then	
	if(ply:GetModel() == scorpion_sounds)then
		ply:EmitSound("playermodel_scorpion.die")
		return true
	end
end
end)

hook.Add("PlayerHurt","scorpion_PlayerHurt",function(ply,velocity)
if GetConVarNumber( "player_dinosaur_sounds" ) == 1 then	
	if(ply:GetModel() == scorpion_sounds)then
		ply:EmitSound("playermodel_scorpion.pain")
		return true
	end
end
end)
if SERVER then
hook.Add("PlayerFootstep","scorpion_PlayerFootstep",function(ply,velocity)
if GetConVarNumber( "player_dinosaur_footsteps" ) == 1 and ply:Alive() then	
if(ply:GetModel() == scorpion_sounds)then
ply:EmitSound("playermodel_scorpion.footsteps")
return true
end
end
end)
end
if CLIENT then
hook.Add("PlayerFootstep","mute_scorpion_PlayerFootstep",function(ply,velocity)
if GetConVarNumber( "player_dinosaur_footsteps" ) == 1 and ply:Alive() then	
if(ply:GetModel() == scorpion_sounds)then
ply:EmitSound("player/null.mp3")
return true
end
end
end)
end
--PATH addons/sl_util_atm/lua/autorun/sh_batm_scenes.lua:
if SERVER then
	--Include all the scenes
	AddCSLuaFile("batm_scenes/homescreen.lua")
	AddCSLuaFile("batm_scenes/background.lua")
	AddCSLuaFile("batm_scenes/cursor.lua")
	AddCSLuaFile("batm_scenes/accountselection.lua")
	AddCSLuaFile("batm_scenes/personalaccount.lua")
	AddCSLuaFile("batm_scenes/deposit.lua")
	AddCSLuaFile("batm_scenes/done.lua")
	AddCSLuaFile("batm_scenes/loading.lua")
	AddCSLuaFile("batm_scenes/history.lua")
	AddCSLuaFile("batm_scenes/withdraw.lua")
	AddCSLuaFile("batm_scenes/failed.lua")
	AddCSLuaFile("batm_scenes/done_withdraw.lua")
	AddCSLuaFile("batm_scenes/transfer.lua")
	AddCSLuaFile("batm_scenes/transfer_amount.lua")
	AddCSLuaFile("batm_scenes/transfer_offline.lua")
	AddCSLuaFile("batm_scenes/groupaccount.lua")
	AddCSLuaFile("batm_scenes/members.lua")
	AddCSLuaFile("batm_scenes/addmember.lua")
	AddCSLuaFile("batm_scenes/done_transfer.lua")
else
	BATM = BATM or {}
 
	--A table that stores all the scenes
	BATM.Scenes = {}
   
	--Fast way to register scenes
	function BATM.RegisterScene(scene, sceneName)
		BATM.Scenes[sceneName] = scene 
		print("[BATM] Registered Scene '"..sceneName.."'")
	end

	--Now include all the scenes
	include("batm_scenes/homescreen.lua")
	include("batm_scenes/background.lua")
	include("batm_scenes/cursor.lua")
	include("batm_scenes/accountselection.lua")
	include("batm_scenes/personalaccount.lua")
	include("batm_scenes/deposit.lua")
	include("batm_scenes/done.lua")
	include("batm_scenes/loading.lua")
	include("batm_scenes/history.lua")
	include("batm_scenes/withdraw.lua")
	include("batm_scenes/failed.lua")
	include("batm_scenes/done_withdraw.lua")
	include("batm_scenes/transfer.lua")
	include("batm_scenes/transfer_amount.lua")
	include("batm_scenes/transfer_offline.lua")
	include("batm_scenes/groupaccount.lua")
	include("batm_scenes/members.lua")
	include("batm_scenes/addmember.lua")
	include("batm_scenes/done_transfer.lua")	
end
--PATH addons/sl_util_atm/lua/batm_scenes/failed.lua:
--[[-------------------------------------------------------------------------
Draws the failed screen
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

local failed = Material("bluesatm/failed.png", "noclamp smooth")

--Called when the scene is loaded
function scene.Load(ent)
	timer.Simple(2.5, function()
		if BATM.SelectedAccount == "personal" then
			ent:SetScene("personalaccount")
		else
			ent:SetScene("groupaccount")
		end
	end)

end

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)
 
	--Draw background
	draw.RoundedBox(0, 0, 100, ScrW, ScrH - 100, Color(232, 76, 61, 255))

	--Draw logo
	surface.SetDrawColor(Color(0,0,0,255))
	surface.SetMaterial(failed)
	surface.DrawTexturedRectRotated(ScrW/2, ScrH/2, 256, 256, 0)

	--Draw text
	draw.SimpleText(BATM.Lang["Request failed, check chat."], "batm_done_text", ScrW/2, ScrH - 150, Color(0,0,0,255), 1)

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
BATM.RegisterScene(scene, "failed")

--PATH addons/sl_util_atm/lua/batm_scenes/members.lua:
--[[-------------------------------------------------------------------------
Draws all the members, and if your the account owner then you can kick or add new members
---------------------------------------------------------------------------]]

surface.CreateFont( "batm_transfer_large", {
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

surface.CreateFont( "batm_transfer_med", {
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


surface.CreateFont( "batm_transfer_small", {
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

scene.selectedIndex = -1 --Selected index, -1 means none

--Called when the scene is loaded
function scene.Load(ent)

	scene.selectedIndex = -1 --Reset selected user
	scene.page = 1 --Reset page
	scene.maxpage = 1

	scene.SetUpButton(ent)
end


--This is used so that when the user changes page we can clear the buttons and re-create them
function scene.SetUpButton(ent)
	local account = BATM.GroupAccount

	if account == nil then return end --This should not happen but just incase
	if account.IsGroup == false then return end --Should not happen either

	scene.maxpage = math.ceil(table.Count(account.owners) / 10)

	ent:ClearButtons()

	--Kick user button
	ent:AddButton(ScrW/2 - 185, 585, 180, 50,
		function() --On pressed
			if scene.selectedIndex ~= -1 then
				ent:SetScene("loading")
				timer.Simple(1, function()
					local account = BATM.GetActiveAccount()
					local id = account.owners[scene.selectedIndex]
					BATM.KickUser(ent, id)
				end)
			end
		end
	)

	--Add user button
	ent:AddButton(ScrW/2 + 8, 585, 180, 50,
		function() --On pressed
			ent:SetScene("addmember")
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
			local account = BATM.GetActiveAccount()
			if scene.page < scene.maxpage  then
				scene.page = scene.page + 1
				scene.SetUpButton(ent)
			end
		end
	)

	--back button
	ent:AddButton(35, 135, 64, 64, 
		function() --On pressed
			ent:SetScene("groupaccount")
		end
	)

	--Now add the buttons for the acctualy rows
	local yOffset = 135
	local players = account.owners 
	--Show previous history

	for i = 1 , 10 do
		local index = ((scene.page - 1) * 10) + i

		--Skip if no history exists
		if players[index] == nil then continue end

		--Add the button
		ent:AddButton(ScrW/2 - 350, yOffset, 700, 40, function()
			scene.selectedIndex = index
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

	scene.maxpage = math.ceil(table.Count(account.owners) / 10)

	if scene.page > scene.maxpage then scene.page = scene.maxpage end --Dont allow pages that dont exist

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw back button
	surface.SetDrawColor(Color(255,255,255,100))
	surface.SetMaterial(back)
	surface.DrawTexturedRect(35, 135, 64, 64)

	local yOffset = 135
	local players = account.owners
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

		if scene.selectedIndex == index then
			color = Color(43, 152, 35)
		end

		draw.RoundedBox(0,ScrW/2 - 350, yOffset, 700, 40, color)

		draw.SimpleText(account.ownerNames[tostring(players[index])], "batm_transfer_large",ScrW/2 - 350 + 10, yOffset + 20, Color(255,255,255, 230), 0, 1)
		draw.SimpleText(players[index] or "????????????????", "batm_transfer_small",ScrW/2 + 350 - 10, yOffset + 20, Color(255,255,255, 100), 2, 1)

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

	--Kick user button
	if BATM.SelectedAccount == "personalgroup" and scene.selectedIndex ~= -1 then
		draw.RoundedBox(0, ScrW/2 - 185, 585, 180, 50,Color(170, 70, 40, 255))
		draw.SimpleText(BATM.Lang["Kick User"], "batm_history_med",ScrW/2 - 95, 585 + 25, Color(255,255,255,220), 1, 1)
	elseif BATM.SelectedAccount == "personalgroup" then
		draw.RoundedBox(0, ScrW/2 - 185, 585, 180, 50,Color(52, 73, 94, 80))
		draw.SimpleText(BATM.Lang["Kick User"], "batm_history_med",ScrW/2 - 95, 585 + 25, Color(255,255,255,30), 1, 1)
	end

	--Add User button
	if BATM.SelectedAccount == "personalgroup" then
		draw.RoundedBox(0, ScrW/2 + 8, 585, 180, 50,Color(52, 73, 94))
		draw.SimpleText(BATM.Lang["Add User"], "batm_history_med",ScrW/2 + 98, 585 + 25, Color(255,255,255,220), 1, 1)
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
BATM.RegisterScene(scene, "members")

--PATH lua/catmullromcams/sh_quaternions.lua:
local function RoundTo(val, num_decimal_points)
	local pow = 1

	for i = 1, num_decimal_points do
		pow = pow * 10
	end
	
	return (math.Round(val * pow) / pow)
end


local AngMeta = FindMetaTable("Angle")

function AngMeta:ToDeg()
	self.p = math.deg(self.p)
	self.y = math.deg(self.y)
	self.r = math.deg(self.r)
end

function AngMeta:ToRad()
	self.p = math.rad(self.p)
	self.y = math.rad(self.y)
	self.r = math.rad(self.r)
end

function AngMeta:Quaternion(quaternion_output)
	local ang = self * 1
	ang:ToRad()
	
	local cp = math.cos(ang.p * .5)
	local cy = math.cos(ang.y * .5)
	local cr = math.cos(ang.r * .5)
	
	local sp = math.sin(ang.p * .5)
	local sy = math.sin(ang.y * .5)
	local sr = math.sin(ang.r * .5)
	
	local cpcy = cp * cy;
	local spsy = sp * sy;
	
	if not quaternion_output then return Quaternion(Vector(sr * cpcy - cr * spsy,
														   cr * sp * cy + sr * cp * sy,
														   cr * cp * sy - sr * sp * cy),
													cr * cpcy + sr * spsy) end
	
	quaternion_output.Vec.x = sr * cpcy - cr * spsy
	quaternion_output.Vec.y = cr * sp * cy + sr * cp * sy
	quaternion_output.Vec.z = cr * cp * sy - sr * sp * cy
	
	quaternion_output.Rotation = cr * cpcy + sr * spsy
end

local callmeta = {}

function callmeta:__call(vec, rot)
	return Quaternion:New(vec, rot)
end

Quaternion = {}
setmetatable(Quaternion, callmeta)

local opsmeta = {}
opsmeta.__index = Quaternion

function Quaternion:New(vec, rot)
	local obj = {}
	--obj.__index = Quaternion
	setmetatable(obj, opsmeta)
	
	obj.Vec = vec or Vector(0, 0, 0)
	obj.Rotation = math.rad(rot) or 1
	
	return obj
end

function Quaternion:Reset(make_into_identity)
	self.Vec.x = 0
	self.Vec.y = 0
	self.Vec.z = 0
	
	self.Rotation = 1
end

function Quaternion:IsIdentity()
	return tobool((self.Vec.x == 0) and
				  (self.Vec.y == 0) and
				  (self.Vec.z == 0) and
				  (self.Rotation == 1))
end

function opsmeta:__eq(quaternion, epsilon)
	if not epsilon then
		return tobool((self.Vec.x == quaternion.Vec.x) and
					  (self.Vec.y == quaternion.Vec.y) and
					  (self.Vec.z == quaternion.Vec.z) and
					  (self.Rotation == quaternion.Rotation))
	end
	
	return tobool((math.abs(self.Vec.x - quaternion.Vec.x) < epsilon) and
				  (math.abs(self.Vec.y - quaternion.Vec.y) < epsilon) and
				  (math.abs(self.Vec.z - quaternion.Vec.z) < epsilon) and
				  (math.abs(self.Rotation - quaternion.Rotation) < epsilon))
end

function opsmeta:__add(quaternion)
	return Quaternion(Vector(self.Vec.x + quaternion.Vec.x, self.Vec.y + quaternion.Vec.y, self.Vec.z + quaternion.Vec.z), self.Rotation + quaternion.Rotation)
end

function opsmeta:__unm()
	self.Vec = self.Vec * -1
end

function opsmeta:__mul(inval)
	return ((type(inval) == "number") and self:MultiplyScalar(inval) or self:MultiplyQuaternion(inval))
end

function Quaternion:MultiplyQuaternion(quaternion)
	local vec = Vector(self.Rotation * quaternion.Vec.x + self.Vec.x * quaternion.Rotation  +  self.Vec.y * quaternion.Vec.z  -  self.Vec.z * quaternion.Vec.y,
					   self.Rotation * quaternion.Vec.y + self.Vec.y * quaternion.Rotation  +  self.Vec.z * quaternion.Vec.x  -  self.Vec.x * quaternion.Vec.z,
					   self.Rotation * quaternion.Vec.z + self.Vec.z * quaternion.Rotation  +  self.Vec.x * quaternion.Vec.y  -  self.Vec.y * quaternion.Vec.x)
	
	local rot = self.Rotation * quaternion.Rotation - self.Vec.x * quaternion.Vec.x  -  self.Vec.y * quaternion.Vec.y  -  self.Vec.z * quaternion.Vec.z
	
	return Quaternion(vec, rot)
end

function Quaternion:MultiplyScalar(val)
	return Quaternion(self.Vec * val, self.Rotation * val)
end

function Quaternion:SetAxis(vec, deg_rotation)
	return self:SetAxisRad(vec, math.rad(deg_rotation))
end

function Quaternion:SetAxisRad(vec, rad_rotation)
	self.Vec = self.Vec * math.sin(rad_rotation)
	self.Rotation = math.cos(rad_rotation)
end

function Quaternion:Dot(quaternion)
	return ((self.Vec.x * quaternion.Vec.x) + (self.Vec.y * quaternion.Vec.y) + (self.Vec.z * quaternion.Vec.z) + (self.Rotation * quaternion.Rotation))
end

function Quaternion:FromAngle(angle)
	angle = angle * 1
	angle:ToRad()
	
	local cp = math.cos(angle.p * .5)
	local cy = math.cos(angle.y * .5)
	local cr = math.cos(angle.r * .5)
	
	local sp = math.sin(angle.p * .5)
	local sy = math.sin(angle.y * .5)
	local sr = math.sin(angle.r * .5)
	
	local cpcy = cp * cy;
	local spsy = sp * sy;
	
	self.Vec = Vector(sr * cpcy - cr * spsy,
					  cr * sp * cy + sr * cp * sy,
					  cr * cp * sy - sr * sp * cy)
	
	self.Rotation = cr * cpcy + sr * spsy
end

function Quaternion:ToAngle(angle)
	angle = angle or Angle()
	
	local singularity_checks = (self.Vec.y * self.Vec.z) + (self.Vec.x * self.Rotation)
	
	if singularity_checks > 0.499 then -- singularity at north pole
		angle.p = math.pi * .5
		angle.y = 2 * math.atan2(self.Vec.y, self.Rotation)
		angle.r = 0
	elseif singularity_checks < -0.499 then -- singularity at south pole
		angle.p = math.pi * -.5
		angle.y = -2 * math.atan2(self.Vec.y, self.Rotation)
		angle.r = 0
	else
		local x_2 = 1 - (2 * self.Vec.x^2)
		
		angle.p = math.asin(  2 * singularity_checks)
		angle.y = math.atan2((2 * self.Vec.z * self.Rotation) - (2 * self.Vec.y * self.Vec.x), (x_2 - (2 * self.Vec.z^2)))
		angle.r = math.atan2((2 * self.Vec.y * self.Rotation) - (2 * self.Vec.z * self.Vec.x), (x_2 - (2 * self.Vec.y^2)))
	end
	
	angle:ToDeg()
	print(angle)
	return angle
end

function Quaternion:Normalize()
	local scale = (self.Vec.x ^ 2) + (self.Vec.y ^ 2) + (self.Vec.z ^ 2) + (self.Rotation ^ 2)
	
	if (scale == 0) or (scale == 1.0) then return (scale == 1.0) end -- Because it might be a normalized already!
	
	scale = 1 / math.sqrt(scale)
	
	self.Vec.x = self.Vec.x * scale
	self.Vec.y = self.Vec.y * scale
	self.Vec.z = self.Vec.z * scale
	
	self.Rotation = self.Rotation * scale
	
	return true
end

function Quaternion:AimZAxis(point_a, point_b)
	local vAim = (point_b - point_a):Normalize()
	
	self.Vec.x	=  vAim.y
	self.Vec.y	= -vAim.x
	self.Vec.z	= 0
	self.Rotation = 1 + vAim.z

	if (self.Vec.x == 0) and (self.Vec.y == 0) and (self.Vec.z == 0) and (self.Rotation == 0) then -- can't norm this
		return self:Reset()
	else
		return self:Normalize()
	end
end

-- Creates a value from spherical linear interpolation
function QuaternionSlerp(start_quat, end_quat, perc) -- THIS IS SLOWER THEN NLERP!!!
	if start_quat == end_quat then return start_quat end
	
	local perc_a = 1 - perc
	local perc_b = perc
	
	local theta	 = math.acos(a.Dot(b));
	local sin_theta = math.sin(theta);

	if sin_theta > 0.001 then
		perc_a = math.sin((1 - perc) * theta ) / sin_theta
		perc_b = math.sin(perc * theta) / sin_theta
	end
	
	return ((a * perc_a) + (b * perc_b))
end

-- Unlike spherical interpolation, this does not rotate at a constant velocity, and it's faster to do
function QuaternionNLerp(start_quat, end_quat, perc)
	if start_quat == end_quat then return start_quat end
	
	local new_quat = (start_quat * 1) + (end_quat * perc)
	new_quat:Normalize()
	
	return new_quat
end

--PATH addons/squad_reborn/lua/squads/sh_squad_utils.lua:
-- returns the degrees between (0,0) and pt (note: 0 degrees is 'east')
function angleOfPoint(pt)
    local x, y = pt.x, pt.y
    local radian = math.atan2(y, x)
    local angle = radian * 180 / math.pi

    if angle < 0 then
        angle = 360 + angle
    end

    return angle
end

-- returns the degrees between two points (note: 0 degrees is 'east')
function angleBetweenPoints(a, b)
    local x, y = b.x - a.x, b.y - a.y

    return angleOfPoint({
        x = x,
        y = y
    })
end

--PATH addons/tlib/lua/tlib/shared/functions.lua:
-- TLib:GetMoney
local tGetWallet = {
    [ 1 ] = function( pPlayer ) return ( pPlayer:getDarkRPVar( "money" ) or 0 ) end,
    [ 2 ] = function( pPlayer ) return ( pPlayer:getChar():getMoney() or 0 ) end,
    [ 3 ] = function( pPlayer ) return ( pPlayer:GetCharacter():GetMoney() or 0 ) end
}

-- TLib:FormatMoney (1: DarkRP, 2: Nutscript, 3: Helix)
local tGetMoneyStr = {
    [ 1 ] = function( iMoney ) return DarkRP.formatMoney( iMoney or 0 ) end,
    [ 2 ] = function( iMoney ) return nut.currency.get( iMoney ) end,
    [ 3 ] = function( iMoney ) return ix.currency.Get( iMoney or 0 ) end
}

-- TLib:GetBankMoney (1: SlownLS ATM, 2: DarkRP foundation, 3: Glorified Banking)
local tGetBank = {
    [ 1 ] = function( pPlayer ) return ( pPlayer:SlownLS_ATM_Balance() or 0 ) end,
    [ 2 ] = function( pPlayer ) return ( pPlayer:DRPF_BankingGet().AccountBalance or 0 ) end,
    [ 3 ] = function( pPlayer ) return ( pPlayer:GetBankBalance() or 0 ) end,
}

-- TLib:GetFormattedTime (1: Real time, 2: StormFox time)
local tGetTime = {
    [ 1 ] = function( bCircatidal ) return os.date( ( bCircatidal and "%I" or "%H" ) .. ":%M", os.time() ) end,
    [ 2 ] = function( bCircatidal ) return os.date( ( bCircatidal and "%I" or "%H" ) .. ":%M", ( StormFox.GetTime( true ) * 60 ) ) end
}

-- TLib:GetFormattedDate (1: Real date, 2: StormFox date)
local tGetDate = {
    [ 1 ] = function() return os.date( "%x", os.time() ) end,
    [ 2 ] = function()
        local iDD, iMM = StormFox.GetDate()
        return ( ( ( iDD > 9 ) and iDD or ( "0" .. iDD ) ) .. "/" .. ( ( iMM > 9 ) and iMM or ( "0" .. iMM ) ) )
    end
}

--[[-------------------------------------------------------------------------------------------------------------------------

    FUNCTIONS

-------------------------------------------------------------------------------------------------------------------------]]--

--[[

    TLib:GetMoney
        - Params: Target (player)
        - Return: Wallet bank money (number)

]]--

function TLib:GetMoney( pPlayer )
    if DarkRP then
        return tGetWallet[ 1 ]( pPlayer )
    elseif nut then
        return tGetWallet[ 2 ]( pPlayer )
    elseif ix then
        return tGetWallet[ 3 ]( pPlayer )
    end

    return 0
end

--[[

    TLib:GetBankMoney
        - Params: Target (player)
        - Return: Player bank money (number)

]]--

function TLib:GetBankMoney( pPlayer )
    local pPlayer = ( CLIENT and LocalPlayer() or pPlayer )

    if pPlayer.SlownLS_ATM_Balance then
        return tGetBank[ 1 ]( pPlayer )
    elseif pPlayer.DRPF_BankingGet then
        return tGetBank[ 2 ]( pPlayer )
    elseif pPlayer.GetBankBalance then
        return tGetBank[ 3 ]( pPlayer )
    elseif BATM then
        return tGetBank[ 4 ]( pPlayer )
    end
end

--[[

    TLib:FormatMoney
        - Desc:
        - Params:
        - Return: 

]]--

function TLib:FormatMoney( iMoney )
    if DarkRP then
        return tGetMoneyStr[ 1 ]( iMoney )
    elseif nut then
        return tGetMoneyStr[ 2 ]( iMoney )
    elseif ix then
        return tGetMoneyStr[ 3 ]( iMoney )
    end

    return ( self:L( 1 ) .. string.Comma( iMoney ) )
end

--[[

    TLib:CanAfford
        - Desc: Performs a money check
        - Params: Target (player), Required money (number)
        - Return: Can afford (boolean)

]]--

function TLib:CanAfford( pPlayer, iPrice )
    return ( self:GetMoney( pPlayer ) >= ( iPrice or 0 ) )
end



--[[

    TLib:GetFormattedTime
        Params: Force real time even if addons like SF are installed (boolean)[, Force circatidal cycle (boolean) ]
        Return: Formatted time ("HH:MM")

]]--

function TLib:GetFormattedTime( bForceReal, bCircatidal )
    if bForceReal then
        return tGetTime[ 1 ]( bCircatidal )
    elseif StormFox then
        return tGetTime[ 2 ]( bCircatidal )
    end

    return tGetTime[ 1 ]( bCircatidal )
end

--[[

    TLib:GetFormattedDate
        Params: Force real date even if addons like SF are installed (boolean)
        Return: Formatted date ("MM:DD" )

]]--

function TLib:GetFormattedDate( bForceReal )
    if bForceReal then
        return tGetDate[ 1 ]()

    elseif StormFox then
        return tGetDate[ 2 ]()
    end

    return tGetDate[ 1 ]()
end

--[[

    TLib:FormatTime
        - Desc:
        - Params:
        - Return: 

]]--

function TLib:FormatTime( iTime )
    if not iTime or ( iTime <= 0 ) then
        return "00:00"
    end

    local iHour = string.format( "%02.f", math.floor( ( iTime / 3600 ) ) )
    local iMin = string.format( "%02.f", math.floor( ( ( iTime / 60 ) - ( iHour * 60 ) ) ) )
    local iSec = string.format( "%02.f", math.floor( ( iTime - ( iHour * 3600 ) - ( iMin * 60 ) ) ) )

    if ( iTime < 3600 ) then
        return ( iMin .. ":" .. iSec )
    end

    return ( iHour .. ":" .. iMin .. ":" .. iSec )
end

--[[

    TLib:FormatWeight
        - Desc:
        - Params:
        - Return: 

]]--

function TLib:FormatWeight( iWeightGrams )
    if ( iWeightGrams < 1000 ) then
        return ( iWeightGrams .. "g" )
    end

    return ( math.Round( ( iWeightGrams / 1000 ), 2 ) .. "kg" )
end
--PATH addons/simplistic_presentation/lua/autorun/simplistic_presentation_loader.lua:
SimplisticPresentation = SimplisticPresentation or {}
SimplisticPresentation.Language = SimplisticPresentation.Language or {}

include("simplistic_presentation/config.lua")
include("simplistic_presentation/constants.lua")

include("simplistic_presentation/shared/sh_functions.lua")

local tFiles = file.Find("simplistic_presentation/languages/lang_*.lua", "LUA")

for _, sFileName in ipairs(tFiles) do
    include("simplistic_presentation/languages/" .. sFileName)
end

if (SERVER) then

    resource.AddSingleFile('materials/simplistic_presentation/clipboard.png')
    resource.AddSingleFile('materials/simplistic_presentation/search.png')
    resource.AddSingleFile('materials/simplistic_presentation/user.png')
    resource.AddSingleFile('materials/simplistic_presentation/cicon.png')
    resource.AddSingleFile('resource/fonts/montserrat-medium.ttf')

    AddCSLuaFile("simplistic_presentation/config.lua")
    AddCSLuaFile("simplistic_presentation/constants.lua")

    for _, sFileName in ipairs(tFiles) do
        AddCSLuaFile("simplistic_presentation/languages/" .. sFileName)
    end

    AddCSLuaFile("simplistic_presentation/shared/sh_functions.lua")

    include("simplistic_presentation/server/sv_functions.lua")
    include("simplistic_presentation/server/sv_nets.lua")
    include("simplistic_presentation/server/sv_hooks.lua")

    AddCSLuaFile("simplistic_presentation/client/cl_functions.lua")
    AddCSLuaFile("simplistic_presentation/client/cl_fonts.lua")
    AddCSLuaFile("simplistic_presentation/client/cl_hooks.lua")
    AddCSLuaFile("simplistic_presentation/client/cl_nets.lua")
    AddCSLuaFile("simplistic_presentation/lib/w3d.lua")
    AddCSLuaFile("simplistic_presentation/lib/material-avatar.lua")

    MsgC(Color(72,255,0), "[Simplistic Presentation] All server files have been successfully loaded !\n")

else

    include("simplistic_presentation/client/cl_functions.lua")
    include("simplistic_presentation/client/cl_fonts.lua")
    include("simplistic_presentation/client/cl_hooks.lua")
    include("simplistic_presentation/client/cl_nets.lua")
    include("simplistic_presentation/lib/w3d.lua")
    include("simplistic_presentation/lib/material-avatar.lua")

    MsgC(Color(255,187,0), "[Simplistic Presentation] All client files have been successfully loaded !\n")

end


--PATH addons/sl_main_system/lua/autorun/sl_config_rang.lua:
-- sh
RANG_SLColor = {
    ["E"] = Color(99,252,146),
    ["D"] = Color(99,247,252),
    ["C"] = Color(99,103,252),
    ["B"] = Color(252,250,99),
    ["A"] = Color(252,99,99),
    ["S"] = Color(122,0,0),
}
RANG_SL = {
    
    ["E"] = {
        name = "Rang E",
        pourcent = 0.5,
        color = Color(99,252,146),
        coef_bonus_vie = 1,
        coef_bonus_vitesse = 1,
        coef_bonus_degat = 1,
    },

    ["D"] = {
        name = "Rang D",
        pourcent = 0.3,
        color = Color(99,247,252),
        coef_bonus_vie = 1.2,
        coef_bonus_vitesse = 1.2,
        coef_bonus_degat = 1.2,
    },

    ["C"] = {
        name = "Rang C",
        pourcent = 0.15,
        color = Color(99,103,252),
        coef_bonus_vie = 1.4,
        coef_bonus_vitesse = 1.4,
        coef_bonus_degat = 1.4,
    },

    ["B"] = {
        name = "Rang B",
        pourcent = 0.04,
        color = Color(252,250,99),
        coef_bonus_vie = 1.6,
        coef_bonus_vitesse = 1.6,
        coef_bonus_degat = 1.6,
    },

    ["A"] = {
        name = "Rang A",
        pourcent = 0.009,
        color = Color(252,99,99),
        coef_bonus_vie = 2,
        coef_bonus_vitesse = 2,
        coef_bonus_degat = 1.9,
    },

    ["S"] = {
        name = "Rang S",
        pourcent = 0.001,
        color = Color(0,0,0),
        coef_bonus_vie = 2.6,
        coef_bonus_vitesse = 2.3,
        coef_bonus_degat = 2.4,
    },

}


-- sh

-- TITRE_SL = {
    
--     ["TueurGoblin"] = {
--         name = "Tueur de Goblin",
--         bonus_vie = 50,
--         bonus_vitesse = 1,
--         bonus_degat = 0,
--     },

--     ["TueurLoup"] = {
--         name = "Tueur de Loup",
--         bonus_vie = 50,
--         bonus_vitesse = 50,
--         bonus_degat = 10,
--     },

--     ["TueurMortVivant"] = {
--         name = "Tueur de Mort Vivant",
--         bonus_vie = 50,
--         bonus_vitesse = 50,
--         bonus_degat = 25,
--     },

--     ["TueurLezard"] = {
--         name = "Tueur de Lézard",
--         bonus_vie = 50,
--         bonus_vitesse = 50,
--         bonus_degat = 30,
--     },

--     ["TueurOurs"] = {
--         name = "Tueur d'Ours",
--         bonus_vie = 65,
--         bonus_vitesse = 65,
--         bonus_degat = 35,
--     },

--     ["TueurCentipede"] = {
--         name = "Tueur de Centipede",
--         bonus_vie = 75,
--         bonus_vitesse = 75,
--         bonus_degat = 50,
--     },

--     ["TueurOrc"] = {
--         name = "Tueur d'Orc",
--         bonus_vie = 100,
--         bonus_vitesse = 100,
--         bonus_degat = 55,
--     },

--     ["TueurDemon"] = {
--         name = "Tueur de Démon",
--         bonus_vie = 125,
--         bonus_vitesse = 125,
--         bonus_degat = 65,
--     },

-- }

--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_scollapsiblepanel.lua:
local PANEL = {}

local font, font_smaller = slib.createFont("Roboto", 16), slib.createFont("Roboto", 14)
local textcolor, textcolor_min55, shade_5, shade_10 = slib.getTheme("textcolor"), slib.getTheme("textcolor", -55), slib.getTheme("maincolor", 5), slib.getTheme("maincolor", 10)
local margin = slib.getTheme("margin")

function PANEL:Init()
    self.collapsed = true
    self.defaultH = slib.getScaledSize(24, "y")
    self.halfTall = slib.getScaledSize(8, "y")
    self:SetTall(self.defaultH)
    self:SetText("")

    self.button = vgui.Create("SButton", self)
    :SetTall(self.defaultH)
    :Dock(TOP)

    self.button.Paint = function(s,w,h)
        surface.SetDrawColor(shade_5)
        surface.DrawRect(0,h - 2,w,2)
    end

    self.button.DoClick = function()
        self.collapsed = !self.collapsed

        if self.onClicked then if self.onClicked() == true then return end end
        self:SizeTo(-1, self:getChildsHeight(), .3)
    end

    slib.wrapFunction(self, "Dock", nil, function() return self end, true)
    slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
    slib.wrapFunction(self, "SetZPos", nil, function() return self end, true)
    slib.wrapFunction(self, "SetTall", nil, function() return self end, true)
    slib.wrapFunction(self, "SetWide", nil, function() return self end, true)
    slib.wrapFunction(self, "SetPos", nil, function() return self end, true)
end

function PANEL:getChildCount()
    local count = 0

    for k,v in ipairs(self:GetChildren()) do
        if v:IsVisible() and v != self.button then
            count = count + 1
        end
    end

    return count
end

function PANEL:getChildsHeight()
    local height = self.defaultH

    if self.collapsed then
        for k,v in ipairs(self:GetChildren()) do
            if v == self.button or !v:IsVisible() then continue end
            local l, t, r, b = v:GetDockMargin()
            height = height + v:GetTall() + b + t
        end
    end

    return height + ((self.collapsed and height > self.defaultH) and margin or 0)
end

function PANEL:setTitle(str)
    self.title = str

    return self
end

function PANEL:ForceSize(add_tall)
    self:SizeTo(-1, self:getChildsHeight() + (add_tall or 0), .3)
end

function PANEL:forceCollapse()
    self:InvalidateChildren()
    self:SetTall(select(2, self:ChildrenSize()) + margin)

    return self
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(self.bg or shade_10)
    surface.DrawRect(0,0,w,h)

    surface.SetDrawColor(shade_10)
    surface.DrawRect(0,0,w,self.defaultH)
    surface.DrawRect(w-1,0,1,h)
    surface.DrawRect(0,0,1,h)

    draw.SimpleText(self.title, font, w * .5, self.defaultH * .5, textcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText(self.collapsed and "-" or "+", font, w - margin - self.halfTall, self.defaultH * .5, textcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    if self.collapsed and self:getChildCount() <= 0 then 
        local offset = self:GetTall() - self.defaultH
        draw.SimpleText(self.emptyMsg or "", font_smaller, w * .5, self.defaultH + offset * .5, textcolor_min55, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end

vgui.Register("SCollapsiblePanel", PANEL, "EditablePanel")
--PATH addons/gprotect_1.15.101/lua/g_protect/languages/sh_french.lua:
if SERVER then
	slib.setLang("gprotect", "fr", "colliding-too-much", "%s's entités sont trop en collision!")
	slib.setLang("gprotect", "fr", "props-colliding-too-much", "Les props de %s entrent trop en collision avec un total de %s collisions")
	slib.setLang("gprotect", "fr", "too-many-obstructs", "%s's entités fait obstruction à trop de mauvaises entités!")
	slib.setLang("gprotect", "fr", "blacklisted-multiple", "Vous avez réussi à ajouter un modèles %s aux modèles bloqués!")
	slib.setLang("gprotect", "fr", "unblacklisted-multiple", "Vous avez réussi à supprimer les modèles %s des modèles bloqués!")
	slib.setLang("gprotect", "fr", "blacklisted-multiple-ent", "Vous avez réussi à ajouter %s ents aux entités figurant sur la liste noire!")
	slib.setLang("gprotect", "fr", "unblacklisted-multiple-ent", "Vous avez réussi à supprimer %s ents des entités figurant sur la liste noire!")
	slib.setLang("gprotect", "fr", "added-blacklist", "Vous avez réussi à ajouter %s aux modèles bloqués!")
	slib.setLang("gprotect", "fr", "removed-blacklist", "Vous avez réussi à supprimer %s des modèles bloqués!")
	slib.setLang("gprotect", "fr", "added-blacklist-ent", "Vous avez ajouté avec succès %s à la liste noire des entités!")
	slib.setLang("gprotect", "fr", "removed-blacklist-ent", "Vous avez réussi à supprimer %s de la liste noire des entités!")
	slib.setLang("gprotect", "fr", "attempted-unfreeze-all", "%s a essayé de tout décongeler après avoir engendré un dupe!")
	slib.setLang("gprotect", "fr", "attempted-upscaled-ent", "%s a essayé de spawner une entité trop grosse avec adv dupe 2!")
	slib.setLang("gprotect", "fr", "attempted-rope-spawning", "%s a essayé de spawner des cordes en utilisant adv dupe 2!")
	slib.setLang("gprotect", "fr", "attempted-no-gravity", "%s a essayé de spawner des accessoires sans gravité en utilisant adv dupe 2!")
	slib.setLang("gprotect", "fr", "attempted-trail", "%s a essayé de spawn un props avec des trails advanced dupe 2!")
	slib.setLang("gprotect", "fr", "attempted-advdupe-out-of-bounds", "%s a essayé de générer des entités hors limites en utilisant adv dupe 2!")
	slib.setLang("gprotect", "fr", "attempted-advdupe-weird-angles", "%s a essayé de générer des entités avec des angles étranges en utilisant adv dupe 2!")
	slib.setLang("gprotect", "fr", "attempted-instacrash-server", "%s peut avoir tenté d'instant-crash le server!")

	slib.setLang("gprotect", "fr", "model-restricted", "Ce modèle a été restreint!")
	slib.setLang("gprotect", "fr", "classname-restricted", "Cette classe d’entité a été restreinte!")
	slib.setLang("gprotect", "fr", "attempted-blacklistedmaterial", "%s a essayé d'utiliser un mazteriaux blacklisté avec le fading door!")
	slib.setLang("gprotect", "fr", "attempted-blackout", "%s a tenté l’exploit blackout!")
	slib.setLang("gprotect", "fr", "spam-spawning", "%s essaie de spam le spawn des entites / props.")

	slib.setLang("gprotect", "fr", "too-complex-model", "Ce Model a été restreint, il est trop compliqué!")
	slib.setLang("gprotect", "fr", "too-big-prop", "Votre props est trop grand alors nous l’avons enlevé!")
	slib.setLang("gprotect", "fr", "successfull-fpp-blockedmodels", "Vous avez réussi à transférer les modèles bloqués de FPP à gProtect!")
	slib.setLang("gprotect", "fr", "successfull-fpp-grouptools", "Vous avez réussi à transférer les grouptools de FPP à gProtect!")
	slib.setLang("gprotect", "fr", "unsuccessfull-transfer", "Il semble y avoir un problème lors du transfert des données! (MySQL n’est pas pris en charge)")

	slib.setLang("gprotect", "fr", "blocked-secondaryusergroup", "Bloqué en raison du usergroup secondaire!")
	slib.setLang("gprotect", "fr", "blocked-usergroup", "Bloqué en raison du usergroup!")
	slib.setLang("gprotect", "fr", "blocked-teamname", "Bloqué en raison du nom du métier!")
	slib.setLang("gprotect", "fr", "blocked-sid", "Bloqué à cause du SteamID!")
	
	slib.setLang("gprotect", "fr", "you-ghosted-props", "Vous avez mis en fantome %s's props!")
	slib.setLang("gprotect", "fr", "you-frozen-props", "Vous avez freeze %s's props!")
	slib.setLang("gprotect", "fr", "you-removed-props", "Vous avez supprimé %s's props!")
	slib.setLang("gprotect", "fr", "you-removed-ents", "Vous avez retiré les entités de %s !")

	slib.setLang("gprotect", "fr", "props-ghosted", "Vos props ont été mis en fantômes!")
	slib.setLang("gprotect", "fr", "props-frozen", "Vos props ont été gelés!")
	slib.setLang("gprotect", "fr", "props-removed", "Vos props ont été enlevés!")
	slib.setLang("gprotect", "fr", "ents-removed", "Vos entités ont été supprimées !")

	slib.setLang("gprotect", "fr", "everyones-props-ghosted", "Quelqu’un a mis en fantôme tout les props de tout le monde!")
	slib.setLang("gprotect", "fr", "everyones-props-frozen", "Quelqu’un a gelé tous les props!")
	slib.setLang("gprotect", "fr", "disconnected-ents-removed", "Vous avez supprimé toutes les entités des joueurs déconnectés!")
	
	slib.setLang("gprotect", "fr", "spawn-to-close", "Votre prop ne peux pas être spawn dans quelqu'un !")
	slib.setLang("gprotect", "fr", "entity-ghosted", "Votre entité a été mis en fantôme!")

	slib.setLang("gprotect", "fr", "ratelimited_toolgun", "Cet outil a un taux limite, veuillez patienter!")
	slib.setLang("gprotect", "fr", "too_many_obstructs_purchase", "Nous avons supprimé l'entité et vous avons remboursé, il y a trop d'obstructions !")

	slib.setLang("gprotect", "fr", "insufficient-permission", "Vous n’avez pas le privilège de le faire!")
	slib.setLang("gprotect", "fr", "spawn-to-close", "Votre props ne peut pas être spawner à l’intérieur de quelqu’un!")
	slib.setLang("gprotect", "fr", "entity-ghosted", "Votre entité a été mis en fantôme!")
	
	slib.setLang("gprotect", "fr", "mysql_successfull", "Nous nous sommes connectés avec succès à la base de données!")
    slib.setLang("gprotect", "fr", "mysql_failed", "Nous n'avons pas réussi à nous connecter à la base de données!")
elseif CLIENT then
	slib.setLang("gprotect", "fr", "title", "gProtect - Paramètres")
	slib.setLang("gprotect", "fr", "buddies-title", "gProtect - Ami(e)(s)")

	slib.setLang("gprotect", "fr", "world", "Monde")
	slib.setLang("gprotect", "fr", "disconnected", "Déconnecté")
	slib.setLang("gprotect", "fr", "toolgun-name", "Props blacklist")
	slib.setLang("gprotect", "fr", "toolgun-desc", "Gérer les modèles bloqués")
	slib.setLang("gprotect", "fr", "toolgun-leftclick", "Ajouter aux modèles sur la liste noire")
	slib.setLang("gprotect", "fr", "toolgun-rightclick", "Supprimer des modèles sur la liste noire")
	slib.setLang("gprotect", "fr", "toolgun-help", "Tirer sur un props avec l’outil")
	slib.setLang("gprotect", "fr", "remove-on-blacklist", "Supprimer le props sur la liste noire")
	slib.setLang("gprotect", "fr", "player-list", "Liste des joueurs")
	
	slib.setLang("gprotect", "fr", "submit", "Soumettre")
	slib.setLang("gprotect", "fr", "input_number", "Input number")

	slib.setLang("gprotect", "fr", "toolgun", "Toolgun")
	slib.setLang("gprotect", "fr", "physgun", "Physgun")
	slib.setLang("gprotect", "fr", "gravity-gun", "Gravity Gun")
	slib.setLang("gprotect", "fr", "canproperty", "Peut acheter")
	slib.setLang("gprotect", "fr", "canuse", "Peut utiliser")

	slib.setLang("gprotect", "fr", "add-blocked-models", "Ajouter aux modèles bloqués")
	slib.setLang("gprotect", "fr", "remove-blocked-models", "Supprimer des modèles bloqués")

	slib.setLang("gprotect", "fr", "add-blacklisted-ents", "Ajouter aux entités sur liste noire")
	slib.setLang("gprotect", "fr", "remove-blacklisted-ents", "Supprimer des entités inscrites sur la liste noire")
	slib.setLang("gprotect", "fr", "copy-clipboard", "Copier dans le Presse-papiers")

	slib.setLang("gprotect", "fr", "general", "Général")
	slib.setLang("gprotect", "fr", "ghosting", "Fantomes")
	slib.setLang("gprotect", "fr", "damage", "Dommages")
	slib.setLang("gprotect", "fr", "anticollide", "Anti collision")
	slib.setLang("gprotect", "fr", "spamprotection", "protection contre le spam")
	slib.setLang("gprotect", "fr", "spawnrestriction", "Restriction du spawn")
	slib.setLang("gprotect", "fr", "toolgunsettings", "Paramètres du Toolgun")
	slib.setLang("gprotect", "fr", "physgunsettings", "Paramètres du Physgun")
	slib.setLang("gprotect", "fr", "gravitygunsettings", "Paramètres du Gravgun")
	slib.setLang("gprotect", "fr", "canpropertysettings", "Paramètres propriétaire")
	slib.setLang("gprotect", "fr", "canusesettings", "Peut utiliser les paramètres")
	slib.setLang("gprotect", "fr", "advdupe2", "Adv Dupe 2")
	slib.setLang("gprotect", "fr", "miscs", "Divers")

	slib.setLang("gprotect", "fr", "ghost-props", "Props fantômes")
	slib.setLang("gprotect", "fr", "remove-props", "Supprimer les props")
	slib.setLang("gprotect", "fr", "freeze-props", "Freeze Props")
	slib.setLang("gprotect", "fr", "remove-entities", "Enlever entitées")
	slib.setLang("gprotect", "fr", "highlight-ents", "Mettre en surbrillance les entités")
	slib.setLang("gprotect", "fr", "unhighlight-ents", "Enlever la surbrillance des entités")

	slib.setLang("gprotect", "fr", "ghost-everyones-props", "Mettre en fantome tout les props de tout le monde")
	slib.setLang("gprotect", "fr", "freeze-everyones-props", "Freeze les props de tout le monde")
	slib.setLang("gprotect", "fr", "remove-disconnected-props", "Supprimer les props des joueurs déconnectés")

	slib.setLang("gprotect", "fr", "general_remDiscPlyEnt", "Supprimer les entités des joueurs déconnécter")
	slib.setLang("gprotect", "fr", "general_remDiscPlyEnt_tooltip", "Cela supprime les entités des joueurs déconnectés avec une minuterie(Si -1 il sera désactivé.)")
	slib.setLang("gprotect", "fr", "general_remDiscPlyEntSpecific", "Supprimer les entités de joueurs déconnectés spécifiques")
	slib.setLang("gprotect", "fr", "general_remDiscPlyEntSpecific_tooltip", "Heure spécifique pour la suppression des entités, si rien n'est spécifié, elle utilisera celle par défaut spécifiée ci-dessus. Faire -1 pour le nom de classe l'ignorera complètement")
	slib.setLang("gprotect", "fr", "general_blacklist", "Liste noire")
	slib.setLang("gprotect", "fr", "general_blacklist_tooltip", "C’est là qu'il faut ajouter des noms de classe qui doivent être protégés par généralement tous les modules.")
	slib.setLang("gprotect", "fr", "general_protectedFrozenEnts", "Les entités gelées et protégées")
	slib.setLang("gprotect", "fr", "general_protectedFrozenEnts_tooltip", "Il s’agit de la liste des entités à protéger")
	slib.setLang("gprotect", "fr", "general_protectedFrozenGroup", "Groupe gelé et protégé")
	slib.setLang("gprotect", "fr", "general_protectedFrozenGroup_tooltip", "Il s’agit du groupe de collision pour mettre des entités gelées!")

	slib.setLang("gprotect", "fr", "general_remOutOfBounds", "Supprimer le chronomètre hors limites")
	slib.setLang("gprotect", "fr", "general_remOutOfBounds_tooltip", "Cela supprimera les entités qui sont en dehors de la carte (Si -1, il sera désactivé)")
	slib.setLang("gprotect", "fr", "general_remOutOfBoundsWhitelist", "Supprimer la liste blanche hors limites")
	slib.setLang("gprotect", "fr", "general_remOutOfBoundsWhitelist_tooltip", "Les entités de cette liste seront supprimées si elles sont hors limites.")

	slib.setLang("gprotect", "fr", "general_blacklist", "Liste noire")
	slib.setLang("gprotect", "fr", "general_blacklist_tooltip", "C'est là que s'ajoutent les noms de classe qui doivent être protégés par généralement tous les modules.")
	slib.setLang("gprotect", "fr", "general_protectedFrozenEnts", "Entités gelées protégées")
	slib.setLang("gprotect", "fr", "general_protectedFrozenEnts_tooltip", "Voici la liste des entités à protéger pendant le gel")
	slib.setLang("gprotect", "fr", "general_protectedFrozenGroup", "Groupe congelé protégé")
	slib.setLang("gprotect", "fr", "general_protectedFrozenGroup_tooltip", "C'est le groupe de collision pour mettre les entités figées dans!")

	slib.setLang("gprotect", "fr", "ghosting_enabled", "Activé")
	slib.setLang("gprotect", "fr", "ghosting_enabled_tooltip", "Activer le module fantôme?")
	slib.setLang("gprotect", "fr", "ghosting_ghostColor", "Couleur fantôme")
	slib.setLang("gprotect", "fr", "ghosting_ghostColor_tooltip", "Sélectionner une couleur pour les entités fantômes")
	slib.setLang("gprotect", "fr", "ghosting_antiObscuring", "Anti-obscurcissement")
	slib.setLang("gprotect", "fr", "ghosting_antiObscuring_tooltip", "Cela empêchera les accessoires d’être unghosted alors qu’ils obscurcissent un objet, Il suffit d’ajouter des entités qui ne devraient pas être masquées!")
	slib.setLang("gprotect", "fr", "ghosting_onPhysgun", "Mettre en fantomes avec le physgun?")
	slib.setLang("gprotect", "fr", "ghosting_onPhysgun_tooltip", "Cela mettra en fontome les entités que sont pris avec le physgun.")
	slib.setLang("gprotect", "fr", "ghosting_useBlacklist", "Utiliser la liste noiret")
	slib.setLang("gprotect", "fr", "ghosting_useBlacklist_tooltip", "Cette option mettra en fantôme les éléments figurant sur la liste noire si le module est activé.")
	slib.setLang("gprotect", "fr", "ghosting_entities", "Entités")
	slib.setLang("gprotect", "fr", "ghosting_entities_tooltip", "Les noms de classe dans cette liste seront fantômes, sa ne vas pas modifier la liste noire utilisée par d’autres modules.")
	slib.setLang("gprotect", "fr", "ghosting_forceUnfrozen", "Forcer les entités fantômes dégelés")
	slib.setLang("gprotect", "fr", "ghosting_forceUnfrozen_tooltip", "Cela forcera les entités fantômes qui ne sont pas gelées.")
	slib.setLang("gprotect", "fr", "ghosting_forceUnfrozenEntities", "Forcer la liste blanche des ents dégelés fantômes")
	slib.setLang("gprotect", "fr", "ghosting_forceUnfrozenEntities_tooltip", "Les entités de cette liste seront fantômes si elles ne sont pas figées.")
	slib.setLang("gprotect", "fr", "ghosting_enableMotion", "Activer le mouvement en mode fantôme")
	slib.setLang("gprotect", "fr", "ghosting_fenableMotion_tooltip", "Si activé, la rémanence ne désactivera pas le mouvement pour les entités.")

	slib.setLang("gprotect", "fr", "damage_enabled", "Activé")
	slib.setLang("gprotect", "fr", "damage_enabled_tooltip", "Activer le module de dégâts?")
	slib.setLang("gprotect", "fr", "damage_useBlacklist", "Utiliser la liste noire")
	slib.setLang("gprotect", "fr", "damage_useBlacklist_tooltip", "Cette option considérera la liste noire générale comme une entitée sur liste noire dans ce module!")
	slib.setLang("gprotect", "fr", "damage_entities", "Entités inscrites sur liste noire")
	slib.setLang("gprotect", "fr", "damage_entities_tooltip", "Les noms de classe de cette liste n'infligeront pas de dégâts si la désactivation des dégats sont cochés, ce qui ne modifiera pas la liste noire utilisable par d’autres modules.")
	slib.setLang("gprotect", "fr", "damage_blacklistedEntPlayerDamage", "Désactiver les dégâts des entitées sur la liste noire")
	slib.setLang("gprotect", "fr", "damage_blacklistedEntPlayerDamage_tooltip", "Si cela est coché, les joueurs ne recevront pas de dommages de la part d’entités figurant sur la liste noire.")
	slib.setLang("gprotect", "fr", "damage_vehiclePlayerDamage", "Désactiver les dommages causés par le véhicule")
	slib.setLang("gprotect", "fr", "damage_vehiclePlayerDamage_tooltip", "Si cela est coché, les joueurs ne recevront pas de dommages par les véhicules.")
	slib.setLang("gprotect", "fr", "damage_worldPlayerDamage", "Désactiver les dégâts du monde")
	slib.setLang("gprotect", "fr", "damage_worldPlayerDamage_tooltip", "Si cela est coché, les joueurs peuvent recevoir des dommages de la part d’entités figurant sur la liste noire.")
	slib.setLang("gprotect", "fr", "damage_immortalEntities", "Entités immortelles")
	slib.setLang("gprotect", "fr", "damage_immortalEntities_tooltip", "Les noms de classe de cette liste ne seront pas endommagés, sauf si le joueur est dans le groupe de contournement!")
	slib.setLang("gprotect", "fr", "damage_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "damage_bypassGroups_tooltip", "Ajouter des groupes d’utilisateurs dans cette liste pour contourner les restrictions de dégâts, '*' signifie tout le monde!")
	slib.setLang("gprotect", "fr", "damage_canDamageWorldEntities", "Peut endommager les entités du monde")
	slib.setLang("gprotect", "fr", "damage_canDamageWorldEntities_tooltip", "Les groupes qui se trouvent dans cette liste peuvent endommager les entités du monde, '*' signifie tout le monde!")

	slib.setLang("gprotect", "fr", "anticollide_enabled", "Activé")
	slib.setLang("gprotect", "fr", "anticollide_enabled_tooltip", "Activer le module anti-collision ?")
	slib.setLang("gprotect", "fr", "anticollide_notifyStaff", "Informer le personnel")
	slib.setLang("gprotect", "fr", "anticollide_notifyStaff_tooltip", "Les détections devraient-elles en informer le personnel? NB: Cela peut être utilisé pour piss le personnel.")
	slib.setLang("gprotect", "fr", "anticollide_protectDarkRPEntities", "Protéger les entités DarkRP")
	slib.setLang("gprotect", "fr", "anticollide_protectDarkRPEntities_tooltip", "Devrions-nous protéger les entités DarkRP? (0 = Désactivé, 1 = Mettre en fantôme, 2 = Freeze, 3 = Supprimer, 4 = Supprimer et rembourser)")
	slib.setLang("gprotect", "fr", "anticollide_DRPentitiesThreshold", "Seuil des entités DRP")
	slib.setLang("gprotect", "fr", "anticollide_DRPentitiesThreshold_tooltip", "Combien de collisions un props peut avoir avant d’être déclenchée dans les 1 seconde?")
	slib.setLang("gprotect", "fr", "anticollide_DRPentitiesException", "Exception des entités DRP")
	slib.setLang("gprotect", "fr", "anticollide_DRPentitiesException_tooltip", "Quelles collisions ignorons-nous? (0 = Aucune, 1 = Pas le même propriétaire, 2 = Aucun propriétaire)")
	slib.setLang("gprotect", "fr", "anticollide_protectSpawnedEntities", "Protéger les entités spawner")
	slib.setLang("gprotect", "fr", "anticollide_protectSpawnedEntities_tooltip", "Devrions-nous protéger les entités spawner? (0 = Disactivé 1 = Mettre en fantôme, 2 = Freeze, 3 = Supprimer")
	slib.setLang("gprotect", "fr", "anticollide_entitiesThreshold", "Seuil des entités spawner")
	slib.setLang("gprotect", "fr", "anticollide_entitiesThreshold_tooltip", "Combien de collisions un props peut-il avoir avant d’être déclenchée en moins d’une seconde?")
	slib.setLang("gprotect", "fr", "anticollide_entitiesException", "Exception sur les entités spawner")
	slib.setLang("gprotect", "fr", "anticollide_entitiesException_tooltip", "Quelles collisions ignorons-nous? (0 = Aucune, 1 = Pas le même propriétaire, 2 = Aucun propriétaire)")
	slib.setLang("gprotect", "fr", "anticollide_protectSpawnedProps", "Protéger les props spawner")
	slib.setLang("gprotect", "fr", "anticollide_protectSpawnedProps_tooltip", "Devrions-nous protéger les props spawer ? (0 = Désactivé, 1 = Ghost, 2 = Freeze, 3 = Remove")
	slib.setLang("gprotect", "fr", "anticollide_propsThreshold", "Seuil des props spawner")
	slib.setLang("gprotect", "fr", "anticollide_propsThreshold_tooltip", "Combien de collisions un props peut avoir avant d’être déclenchée dans les 1 seconde?")
	slib.setLang("gprotect", "fr", "anticollide_propsException", "Exception des props spawner")
	slib.setLang("gprotect", "fr", "anticollide_propsException_tooltip", "Quelles collisions ignorons-nous? (0 = Aucune, 1 = Pas le même propriétaire, 2 = Aucun propriétaire)")
	slib.setLang("gprotect", "fr", "anticollide_useBlacklist", "Utiliser la liste noire")
	slib.setLang("gprotect", "fr", "anticollide_useBlacklist_tooltip", "Les entités figurant sur la liste noire seront fantômes si les collisions sont trop élevée si cela est activé.")
	slib.setLang("gprotect", "fr", "anticollide_playerPropAction", "Action d'accessoires spécifiques au joueur")
	slib.setLang("gprotect", "fr", "anticollide_playerPropAction_tooltip", "Quelle action faisons-nous une fois le seuil atteint ? (0 = Désactivé, 1 = Fantôme, 2 = Geler, 3 = Supprimer, 4 = Fantôme & Unghost)")
	slib.setLang("gprotect", "fr", "anticollide_playerPropThreshold", "Seuil d'accessoires spécifiques au joueur")
	slib.setLang("gprotect", "fr", "anticollide_playerPropThreshold_tooltip", "Il s'agit du nombre maximal de collisions que les accessoires d'un joueur peuvent avoir par seconde, cela ciblera tous leurs accessoires ! Cela n'enregistre que leurs propres accessoires comme une collision.")
	slib.setLang("gprotect", "fr", "anticollide_useBlacklist", "Utiliser la liste noire")
	slib.setLang("gprotect", "fr", "anticollide_useBlacklist_tooltip", "Les entités sur liste noire seront fantômes si elles se heurtent trop si cela est activé.")
	slib.setLang("gprotect", "fr", "anticollide_ghostEntities", "Entitiés")
	slib.setLang("gprotect", "fr", "anticollide_ghostEntities_tooltip", "Les noms de classe de cette liste seront masqués s'ils se heurtent trop.")
	slib.setLang("gprotect", "fr", "anticollide_specificEntities", "Entités spécifiques")
	slib.setLang("gprotect", "fr", "anticollide_specificEntities_tooltip", "Ajoutez des noms de classe ici pour établir des règles spécifiques pour eux, ce qui signifie que le nombre ici sera leur seuil, tout ce qui est en dessous de 0 les comptera comme contournement.")
	slib.setLang("gprotect", "fr", "anticollide_squaredPhysicsMaxSize", "Squared physics max size")
	slib.setLang("gprotect", "fr", "anticollide_squaredPhysicsMaxSize_tooltip", "Il s'agit d'une protection globale qui transformera automatiquement les boîtes de collision complexes et plus petites en carrés, ce qui est efficace pour empêcher les sphères de taille moyenne de provoquer un décalage.")
	slib.setLang("gprotect", "fr", "anticollide_squaredPhysicsEnts", "Entités de physique dans la zone")
	slib.setLang("gprotect", "fr", "anticollide_squaredPhysicsEnts_tooltip", "Il s'agit d'une fonction anti-collision globale, qui rend les entités endormies après avoir atteint le seuil défini (le seuil est effacé toutes les 1 seconde)")


	slib.setLang("gprotect", "fr", "spamprotection_enabled", "Activé")
	slib.setLang("gprotect", "fr", "spamprotection_enabled_tooltip", "Activer le module contre la protection des spams ?")
	slib.setLang("gprotect", "fr", "spamprotection_threshold", "Seuil")
	slib.setLang("gprotect", "fr", "spamprotection_threshold_tooltip", "Si vous spawner ces nombreux props à la fois, alors il seront effacer  à moins que le délai défini ci-dessous sois terminée.")
	slib.setLang("gprotect", "fr", "spamprotection_delay", "Delai")
	slib.setLang("gprotect", "fr", "spamprotection_delay_tooltip", "Cette minuterie effacera le seuil ci-dessus.")
	slib.setLang("gprotect", "fr", "spamprotection_action", "Punition")
	slib.setLang("gprotect", "fr", "spamprotection_action_tooltip", "Cela décidera de la façon de traiter avec les spammeurs! (1 = Désactiver le spawning, 2 = mettre en fantôme entitées / props)")
	slib.setLang("gprotect", "fr", "spamprotection_notifyStaff", "Informer le personnel")
	slib.setLang("gprotect", "fr", "spamprotection_notifyStaff_tooltip", "Les détections devraient-elles en informer le personnel? NB: Cela peut être utilisé pour piss le personnel.")
	slib.setLang("gprotect", "fr", "spamprotection_protectProps", "Protéger les props")
	slib.setLang("gprotect", "fr", "spamprotection_protectProps_tooltip", "Cela protégera les props contre le spawn spam.")
	slib.setLang("gprotect", "fr", "spamprotection_protectEntities", "Protéger les entités")
	slib.setLang("gprotect", "fr", "spamprotection_protectEntities_tooltip", "Cela protégera les entités contre le spawn spam.")

	slib.setLang("gprotect", "fr", "spawnrestriction_enabled", "Activé")
	slib.setLang("gprotect", "fr", "spawnrestriction_enabled_tooltip", "Activer le module réstriction contre les spawns?")
	slib.setLang("gprotect", "fr", "spawnrestriction_propSpawnPermission", "Permission pour spawn un props")
	slib.setLang("gprotect", "fr", "spawnrestriction_propSpawnPermission_tooltip", "Cela limitera totalement le spawn de props! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_SENTSpawnPermission", "Permission de spawn les entités")
	slib.setLang("gprotect", "fr", "spawnrestriction_SENTSpawnPermission_tooltip", "Cela limitera totalement le spawn d'entitées! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_SWEPSpawnPermission", "Permission pour spawn les Armes")
	slib.setLang("gprotect", "fr", "spawnrestriction_SWEPSpawnPermission_tooltip", "Cela limitera totalement le spawn d'arme! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_vehicleSpawnPermission", "Permission pour spawn les véhicules")
	slib.setLang("gprotect", "fr", "spawnrestriction_vehicleSpawnPermission_tooltip", "Cela limitera totalement le spawn de véhicules! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_NPCSpawnPermission", "Permission pour spawn de NPC")
	slib.setLang("gprotect", "fr", "spawnrestriction_NPCSpawnPermission_tooltip", "Cela limitera totalement le spawn de NPC! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_ragdollSpawnPermission", "permission pour spawn des RAGDOLL")
	slib.setLang("gprotect", "fr", "spawnrestriction_ragdollSpawnPermission_tooltip", "Cela limitera totalement le spawn de RAGDOLL! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_effectSpawnPermission", "Permission pour spawn des effets")
	slib.setLang("gprotect", "fr", "spawnrestriction_effectSpawnPermission_tooltip", "Cela limitera totalement le spawn d'effets! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedEntities", "Entitées bloqués")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedEntities_tooltip", "Placez les noms de classe d’entités qui ne devraient jamais être spawn ici!")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedEntitiesIsBlacklist", "Les classes bloquées sont une liste noire")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedEntitiesIsBlacklist_tooltip", "Si coché, il empêchera les classes dans la liste des classes bloqués de spawn, sinon vous pouvez spawn ces classes.")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedModels", "Modèles bloqués")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedModels_tooltip", "placer le model du props que vous voulez pas qui spawn et il ne pourrat plus être spawn par personne!")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedModelsisBlacklist", "Les modèles bloqués sont une liste noire")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedModelsisBlacklist_tooltip", "Si coché, il empêchera les models dans la liste noir de spawner")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedModelsVehicleBypass", "Générer des modèles bloqués par contournement de véhicule")
	slib.setLang("gprotect", "fr", "spawnrestriction_blockedModelsVehicleBypass_tooltip", "Si coché, les véhicules ignoreront la liste des modèles bloqués.")
	slib.setLang("gprotect", "fr", "spawnrestriction_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "spawnrestriction_bypassGroups_tooltip", "Ces groupes seront en mesure de contourner les entitées et les modèles bloqués.")
	slib.setLang("gprotect", "fr", "spawnrestriction_maxPropModelComplexity", "Complexité maximale du modèle d'hélice")
	slib.setLang("gprotect", "fr", "spawnrestriction_maxPropModelComplexity_tooltip", "Cela empêchera de générer des modèles avec des formes complexes, la valeur recommandée est 10. (0 = désactivé)")
	slib.setLang("gprotect", "fr", "spawnrestriction_maxModelSize", "Taille maximale du modèle")
	slib.setLang("gprotect", "fr", "spawnrestriction_maxModelSize_tooltip", "Si c’est au-dessus de 0, il supprimera les plus grands props juste après qu’ils soient spawner.")

	slib.setLang("gprotect", "fr", "toolgunsettings_enabled", "Activé")
	slib.setLang("gprotect", "fr", "toolgunsettings_enabled_tooltip", "Activer le module paramètres du toolsgun ?")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetWorld", "Peut cibler des entités mondiales")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetWorld_tooltip", "Cela signifie qu'ils peuvent cibler les entités et les props du de la map! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetPlayerOwned", "Peut cibler les entités détenues par le joueur")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetPlayerOwned_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props des joueurs! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetPlayerOwnedProps", "Peut cibler les accessoires appartenant au joueur")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetPlayerOwnedProps_tooltip", "Cela signifie qu'ils peuvent cibler les accessoires des joueurs ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetVehiclePermission", "Autorisation du véhicule cible")
	slib.setLang("gprotect", "fr", "toolgunsettings_targetVehiclePermission_tooltip", "Si des personnes font partie des groupes d'utilisateurs de cette liste, elles peuvent utiliser le pistolet à outils sur les véhicules !")

	slib.setLang("gprotect", "fr", "toolgunsettings_restrictTools", "Outils restreints")
	slib.setLang("gprotect", "fr", "toolgunsettings_restrictTools_tooltip", "Les outils ici ne seront pas utilisables par n’importe qui, sauf ceux dans l’option bypassGroups ci-dessous.")
	slib.setLang("gprotect", "fr", "toolgunsettings_groupToolRestrictions", "Réstriction des tools par groupe")
	slib.setLang("gprotect", "fr", "toolgunsettings_groupToolRestrictions_tooltip", "Configurer les restrictions d’outils par outil.")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassGroups_tooltip", "Les groupes ici contourneront les restrictions d'outils des listes ci-dessus !")
	slib.setLang("gprotect", "fr", "toolgunsettings_entityTargetability", "Cible des entités")
	slib.setLang("gprotect", "fr", "toolgunsettings_entityTargetability_tooltip", "Cette option permet de restreindre l'utilisation du toolsgun sur certaine entités!")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassGroups_tooltip", "Les groupes ici contourneront la liste de restriction d’outils d’en haut!")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassTargetabilityTools", "Contourner les outils de ciblage")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassTargetabilityTools_tooltip", "Les outils de cette liste contourneront les paramètres de ciblage !")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassTargetabilityGroups", "Ignorer les groupes de ciblage")
	slib.setLang("gprotect", "fr", "toolgunsettings_bypassTargetabilityGroups_tooltip", "Les groupes de cette liste contourneront les paramètres de ciblage !")
	slib.setLang("gprotect", "fr", "toolgunsettings_antiSpam", "Anti spam")
	slib.setLang("gprotect", "fr", "toolgunsettings_antiSpam_tooltip", "Ajoutez des outils ici et spécifiez combien de fois ils peuvent utiliser l'outil par seconde !")



	slib.setLang("gprotect", "fr", "physgunsettings_enabled", "Activé")
	slib.setLang("gprotect", "fr", "physgunsettings_enabled_tooltip", "Activer le module paramètres du physgun ?")
	slib.setLang("gprotect", "fr", "physgunsettings_targetWorld", "Peut cibler des entités mondiales")
	slib.setLang("gprotect", "fr", "physgunsettings_targetWorld_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props de la map! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "physgunsettings_targetPlayerOwned", "Peut cibler les entités détenues par le joueur")
	slib.setLang("gprotect", "fr", "physgunsettings_targetPlayerOwned_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props des joueurs! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "physgunsettings_targetPlayerOwnedProps", "Peut cibler les accessoires appartenant au joueur")
	slib.setLang("gprotect", "fr", "physgunsettings_targetPlayerOwnedProps_tooltip", "Cela signifie qu'ils peuvent cibler les accessoires des joueurs ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "physgunsettings_DisableReloadUnfreeze", "Désactiver le rechargement")
	slib.setLang("gprotect", "fr", "physgunsettings_DisableReloadUnfreeze_tooltip", "Empêche les joueurs de unfreeze leurs props en appuyant sur 'recharger' avec le physgun en main.")
	slib.setLang("gprotect", "fr", "physgunsettings_PickupVehiclePermission", "Permission de prendre les véhicules")
	slib.setLang("gprotect", "fr", "physgunsettings_PickupVehiclePermission_tooltip", "Si des personnes sont dans les groupes d’utilisateurs de cette liste, elles peuvent prendres les véhicules avec le physgun!")
	slib.setLang("gprotect", "fr", "physgunsettings_StopMotionOnDrop", "Stop motion on drop")
	slib.setLang("gprotect", "fr", "physgunsettings_StopMotionOnDrop_tooltip", "Cela permettra d’éviter prop-pushing / prop-killing.")
	slib.setLang("gprotect", "fr", "physgunsettings_blockMultiplePhysgunning", "Bloquer le physgunning multiple")
	slib.setLang("gprotect", "fr", "physgunsettings_blockMultiplePhysgunning_tooltip", "Cela bloquera une entité qui est physgunned d’être physgunned par quelqu’un d’autre!")
	slib.setLang("gprotect", "fr", "physgunsettings_maxDropObstructs", "Seuil d’obstruction maximale")
	slib.setLang("gprotect", "fr", "physgunsettings_maxDropObstructs_tooltip", "C’est le seuil du nombre d’obstructures des entités inscrites sur la liste noire jusqu’à ce qu’il déclenche!")
	slib.setLang("gprotect", "fr", "physgunsettings_maxDropObstructsAction", "Action maximale de déclenchement d’obstruction")
	slib.setLang("gprotect", "fr", "physgunsettings_maxDropObstructsAction_tooltip", "C’est la façon de menacer les déclencheurs (1 = mettre en fantôme, 2 = Freeze, 3 = Supprimer)")
	slib.setLang("gprotect", "fr", "physgunsettings_blockedEntities", "Entités bloquées")
	slib.setLang("gprotect", "fr", "physgunsettings_blockedEntities_tooltip", "Ajouter des entités dans cette liste et elle ne sera pas physgunable par toute personne qui n’est pas dans le groupe de contournement.")
	slib.setLang("gprotect", "fr", "physgunsettings_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "physgunsettings_bypassGroups_tooltip", "Ajouter des groupes d’utilisateurs dans cette liste pour contourner les entités bloquées, '*' signifie tout le monde!")

	slib.setLang("gprotect", "fr", "gravitygunsettings_enabled", "Activé")
	slib.setLang("gprotect", "fr", "gravitygunsettings_enabled_tooltip", "Activer le module de réglages du Gravity GUN?")
	slib.setLang("gprotect", "fr", "gravitygunsettings_targetWorld", "Peut cibler des entités mondiales")
	slib.setLang("gprotect", "fr", "gravitygunsettings_targetWorld_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props de la map! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "gravitygunsettings_targetPlayerOwned", "Peut cibler les entités détenues par les joueur")
	slib.setLang("gprotect", "fr", "gravitygunsettings_targetPlayerOwned_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props des joueurs! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "gravitygunsettings_targetPlayerOwnedProps", "Peut cibler les accessoires appartenant au joueur")
	slib.setLang("gprotect", "fr", "gravitygunsettings_targetPlayerOwnedProps_tooltip", "Cela signifie qu'ils peuvent cibler les accessoires des joueurs ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "gravitygunsettings_DisableGravityGunPunting", "Désactiver le lazer du clique droit")
	slib.setLang("gprotect", "fr", "gravitygunsettings_DisableGravityGunPunting_tooltip", "C'est le lazer du gravity gun.")
	slib.setLang("gprotect", "fr", "gravitygunsettings_blockedEntities", "Entités bloquées")
	slib.setLang("gprotect", "fr", "gravitygunsettings_blockedEntities_tooltip", "Ajouter des entités dans cette liste et il ne pourrat pas être pris avec le gravity-GUN par toute personne qui n’est pas dans le groupe de contournement.")
	slib.setLang("gprotect", "fr", "gravitygunsettings_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "gravitygunsettings_bypassGroups_tooltip", "Ajouter des groupes d’utilisateurs dans cette liste pour contourner les entités bloquées, '*' signifie tout le monde!")

	slib.setLang("gprotect", "fr", "canpropertysettings_enabled", "Activé")
	slib.setLang("gprotect", "fr", "canpropertysettings_enabled_tooltip", "Activer le module paramètres de la propriété?")
	slib.setLang("gprotect", "fr", "canpropertysettings_targetWorld", "Peut cibler des entités mondiales")
	slib.setLang("gprotect", "fr", "canpropertysettings_targetWorld_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props du monde! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "canpropertysettings_targetPlayerOwned", "Peut cibler les entités détenues par le joueur")
	slib.setLang("gprotect", "fr", "canpropertysettings_targetPlayerOwned_tooltip", "Cela signifie qu’ils peuvent cibler les entités et les props des joueurs! (Ajouter des groupes d’utilisateurs ici pour leur permettre, * signifie tout le monde!)")
	slib.setLang("gprotect", "fr", "canpropertysettings_targetPlayerOwnedProps", "Peut cibler les accessoires appartenant au joueur")
	slib.setLang("gprotect", "fr", "canpropertysettings_targetPlayerOwnedProps_tooltip", "Cela signifie qu'ils peuvent cibler les accessoires des joueurs ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "canpropertysettings_blockedProperties", "Propriétés bloquées")
	slib.setLang("gprotect", "fr", "canpropertysettings_blockedProperties_tooltip", "Ajouter des propriétés à cette liste")
	slib.setLang("gprotect", "fr", "canpropertysettings_blockedPropertiesisBlacklist", "Les propriétés bloquées sont inscrites sur la liste noire")
	slib.setLang("gprotect", "fr", "canpropertysettings_blockedPropertiesisBlacklist_tooltip", "Si coché, il empêchera les propriétées présente dans la liste noire d'être utilisée.")
	slib.setLang("gprotect", "fr", "canpropertysettings_blockedEntities", "Entités bloquées")
    slib.setLang("gprotect", "fr", "canpropertysettings_blockedEntities_tooltip", "Ajoutez des entités à cela et il ne sera pas possible de les cibler par quiconque sauf les personnes du groupe de contournement!")
	slib.setLang("gprotect", "fr", "canpropertysettings_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "canpropertysettings_bypassGroups_tooltip", "Les groupes ici contourneront la liste de restriction de propriété d’en haut!")

	slib.setLang("gprotect", "fr", "canusesettings_enabled", "Activé")
	slib.setLang("gprotect", "fr", "canusesettings_enabled_tooltip", "Activer le module de paramètres peut utiliser ?")
	slib.setLang("gprotect", "fr", "canusesettings_targetWorld", "Peut cibler des entités mondiales")
	slib.setLang("gprotect", "fr", "canusesettings_targetWorld_tooltip", "Cela signifie qu'ils peuvent cibler des entités mondiales ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "canusesettings_targetPlayerOwned", "Peut cibler des entités appartenant à des joueurs")
	slib.setLang("gprotect", "fr", "canusesettings_targetPlayerOwned_tooltip", "Cela signifie qu'ils peuvent cibler des entités de joueurs ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "canusesettings_targetPlayerOwnedProps", "Peut cibler les accessoires appartenant au joueur")
	slib.setLang("gprotect", "fr", "canusesettings_targetPlayerOwnedProps_tooltip", "Cela signifie qu'ils peuvent cibler les accessoires des joueurs ! (Ajoutez des groupes d'utilisateurs ici pour les autoriser, * signifie tout le monde !)")
	slib.setLang("gprotect", "fr", "canusesettings_blockedEntities", "Entités bloquées")
	slib.setLang("gprotect", "fr", "canusesettings_blockedEntities_tooltip", "Ajoutez des entités à cela et il ne pourra pas être utilisé par quiconque ne faisant pas partie du groupe de contournement.")
	slib.setLang("gprotect", "fr", "canusesettings_blockedEntitiesisBlacklist", "Les entités bloquées sont sur liste noire")
	slib.setLang("gprotect", "fr", "canusesettings_blockedEntitiesisBlacklist_tooltip", "Si coché, cela empêchera l'utilisation des entités de la liste, sinon vous ne pourrez utiliser que ces entités.")
	slib.setLang("gprotect", "fr", "canusesettings_bypassGroups", "Groupes de contournement")
	slib.setLang("gprotect", "fr", "canusesettings_bypassGroups_tooltip", "Ajoutez des groupes d'utilisateurs dans cette liste pour contourner les entités bloquées, '*' signifie tout le monde !")

	slib.setLang("gprotect", "fr", "advdupe2_enabled", "Activé")
	slib.setLang("gprotect", "fr", "advdupe2_enabled_tooltip", "Les détections devraient-elles en informer le personnel? NB: Cela peut être utilisé pour piss le personnel.")
	slib.setLang("gprotect", "fr", "advdupe2_notifyStaff", "Informer le personnel")
	slib.setLang("gprotect", "fr", "advdupe2_notifyStaff_tooltip", "Les détections devraient-elles en informer le personnel? NB: Cela peut être utilisé pour piss le personnel.")
	slib.setLang("gprotect", "fr", "advdupe2_PreventRopes", "prévient le spawn de corde")
	slib.setLang("gprotect", "fr", "advdupe2_PreventRopes_tooltip", "prévient les cordes de spawner! (1 = Prévenir le spawn, 2 = Spawn But Fix)")
	slib.setLang("gprotect", "fr", "advdupe2_PreventScaling", "prévient la mise à l’échelle")
	slib.setLang("gprotect", "fr", "advdupe2_PreventScaling_tooltip", "Empêcher les props haut trop grand de spawner. (1 = Prévenir le spawn, 2 = Spawn But Fix)")
	slib.setLang("gprotect", "fr", "advdupe2_PreventNoGravity", "Prévenir l’aucune gravité")
	slib.setLang("gprotect", "fr", "advdupe2_PreventNoGravity_tooltip", "Prévenir les props qui spawn sans gravité. (1 = Prévenir le spawn, 2 = Spawn But Fix)")
	slib.setLang("gprotect", "fr", "advdupe2_PreventTrail", "Empêcher les traînées")
	slib.setLang("gprotect", "fr", "advdupe2_PreventTrail_tooltip", "Empêcher les accessoires de frai avec des sentiers. (1 = empêcher le frai, 2 = frayer mais réparer)")
	slib.setLang("gprotect", "fr", "advdupe2_PreventUnreasonableValues", "Empêcher les valeurs déraisonnables")
	slib.setLang("gprotect", "fr", "advdupe2_PreventUnreasonableValues_tooltip", "Empêcher les entités avec des valeurs déraisonnables, c'est-à-dire la position et/ou les angles.")	
	slib.setLang("gprotect", "fr", "advdupe2_PreventUnfreezeAll", "Prévenir lors d'un unfreeze général")
	slib.setLang("gprotect", "fr", "advdupe2_PreventUnfreezeAll_tooltip", "préviens les gens lorsqu'il unfreeze tous les props. (1 = Prévenir le spawn, 2 = Spawn But Fix)")
	slib.setLang("gprotect", "fr", "advdupe2_BlacklistedCollisionGroups", "Groupes de collision sur liste noire")
	slib.setLang("gprotect", "fr", "advdupe2_BlacklistedCollisionGroups_tooltip", "Cela protège contre les props que vous ne pouvez pas cibler. NB:Les valeurs doivent être collision ENUMs")
	slib.setLang("gprotect", "fr", "advdupe2_WhitelistedConstraints", "Contraintes sur la liste blanche")
	slib.setLang("gprotect", "fr", "advdupe2_WhitelistedConstraints_tooltip", "Il s’agit d’éviter toute contrainte indésirable d’être spawn.")
	slib.setLang("gprotect", "fr", "advdupe2_DelayBetweenUse", "Délai entre les utilisations")
	slib.setLang("gprotect", "fr", "advdupe2_DelayBetweenUse_tooltip", "Cela empêchera les gens de spammer l'outil, évitant ainsi les décalages. (0 = désactivé)")

	slib.setLang("gprotect", "fr", "miscs_enabled", "Activé")
	slib.setLang("gprotect", "fr", "miscs_enabled_tooltip", "Activer le module divers?")
	slib.setLang("gprotect", "fr", "miscs_ClearDecals", "Minuterie du Clear decals")
	slib.setLang("gprotect", "fr", "miscs_ClearDecals_tooltip", "Minuterie en secondes qui effacera les decals pour tous les joueurs sur une minuterie :)")
	slib.setLang("gprotect", "fr", "miscs_blacklistedFadingDoorMats_punishment", "Paillassons décolorés sur liste noire de punition")
	slib.setLang("gprotect", "fr", "miscs_blacklistedFadingDoorMats_punishment_tooltip", "Int cela punira les gens pour avoir essayé d'utiliser des fading door sur liste noire (0 = rien, 1 = notifier, 2 = kick, 3 = ban).")
	slib.setLang("gprotect", "fr", "miscs_blacklistedFadingDoorMats", "fading door sur liste noire")
	slib.setLang("gprotect", "fr", "miscs_blacklistedFadingDoorMats_tooltip", "Ajoutez de mauvais matériaux dans cette liste, 'pp/copy' et 'dev/upscale' par exemple.")	
	slib.setLang("gprotect", "fr", "miscs_NoBlackoutGlitch", "Prévenir l’exploi blackout")
	slib.setLang("gprotect", "fr", "miscs_NoBlackoutGlitch_tooltip", "Int cela permettra d’empêcher l’exploit 'pp/copy'(1 = Prévenir, 2 = kick, 3 = ban).")
	slib.setLang("gprotect", "fr", "miscs_FadingDoorLag", "Prévenir les lags du fading doors")
	slib.setLang("gprotect", "fr", "miscs_FadingDoorLag_tooltip", "Cela empêchera les gens de crash le serveur avec l'outil fading door.")
	slib.setLang("gprotect", "fr", "miscs_DisableMotion", "Désactiver le mouvement")
	slib.setLang("gprotect", "fr", "miscs_DisableMotion_tooltip", "Cela désactivera la requête pour toutes les entités inscrites sur la liste noire.")
	slib.setLang("gprotect", "fr", "miscs_DisableMotion", "Désactiver le mouvement")
	slib.setLang("gprotect", "fr", "miscs_DisableMotion_tooltip", "Cela désactivera le mouvement pour toutes les entités sur liste noire.")
	slib.setLang("gprotect", "fr", "miscs_DisableMotionEntities", "Désactiver les entités de mouvement")
	slib.setLang("gprotect", "fr", "miscs_DisableMotionEntities_tooltip", "Les entités de cette liste ne peuvent pas être dégelées.")
	slib.setLang("gprotect", "fr", "miscs_freezeOnSpawn", "Geler au frai")
	slib.setLang("gprotect", "fr", "miscs_freezeOnSpawn_tooltip", "Cela permettra de freeze les porps lors du spawn")
	slib.setLang("gprotect", "fr", "miscs_precisionMoveFix", "Empêcher les abus de mouvement de précision")
	slib.setLang("gprotect", "fr", "miscs_precisionMoveFix_tooltip", "Empêche le mode de déplacement d'être abusé, pourrait être utilisé pour contourner l'anti-obscurcissement et autres.")	
	slib.setLang("gprotect", "fr", "miscs_preventFadingDoorAbuse", "Prévenir l’abus du fading door")
	slib.setLang("gprotect", "fr", "miscs_preventFadingDoorAbuse_tooltip", "Cela permettra d’éviter d’obscurcir les gens avec le fading door")
	slib.setLang("gprotect", "fr", "miscs_preventSpawnNearbyPlayer", "Prévient le joueur à proximité du spawn")
	slib.setLang("gprotect", "fr", "miscs_preventSpawnNearbyPlayer_tooltip", "Si quelqu’un est plus proche de la position de spawn que de cette valeur, il ne spawn pas (0 Désactivé)")
	slib.setLang("gprotect", "fr", "miscs_DRPEntForceOwnership", "Forcer la propriété sur les entités DarkRP")
	slib.setLang("gprotect", "fr", "miscs_DRPEntForceOwnership_tooltip", "Cela forcera la propriété d’entitées achetés dans le F4")
	slib.setLang("gprotect", "fr", "miscs_DRPMaxObstructsOnPurchaseEnts", "Max obstrue à l'achat pour DarkRP Ents")
	slib.setLang("gprotect", "fr", "miscs_DRPMaxObstructsOnPurchaseEnts_tooltip", "Cela empêchera de générer beaucoup d'entités DRP les unes à l'intérieur des autres !")
	slib.setLang("gprotect", "fr", "miscs_DRPObstructsFilter", "Max obstrue le filtre des entités DarkRP")
	slib.setLang("gprotect", "fr", "miscs_DRPObstructsFilter_tooltip", "C'est le filtre pour le maximum d'obstructions (1 = Entités DRP, 2 = Props)")
end

slib.setLang("gprotect", "fr", "insufficient-permission", "Vous n'avez pas le privilège de le faire!")
--PATH addons/eprotect_1.4.22/lua/e_protect/sh_baseconfig.lua:
------------------------------------------------------                                   
-- NO NOT TOUCH ANYTHING IN HERE!!!!!!!!!                                                  
------------------------------------------------------                  
              
eProtect = eProtect or {}

eProtect.BaseConfig = eProtect.BaseConfig or {}

eProtect.BaseConfig["disable-all-networking"] = {false, 1}

eProtect.BaseConfig["automatic-identifier"] = {1, 2, {min = 0, max = 3}}

eProtect.BaseConfig["block-vpn"] = {false, 3}

eProtect.BaseConfig["bypass-vpn"] = {{["76561199104969637"] = true}, 4, function()
    local list = {}

    for k,v in ipairs(player.GetAll()) do
        local sid64 = v:SteamID64()
        if !sid64 then continue end
        list[sid64] = true
    end

    if CAMI and CAMI.GetUsergroups then
        for k,v in pairs(CAMI.GetUsergroups()) do
            list[k] = true
        end
    end
    
    return list
end}


eProtect.BaseConfig["notification-groups"] = {{["superadmin"] = true}, 5, CAMI and CAMI.GetUsergroups and function() local tbl = {} for k,v in pairs(CAMI.GetUsergroups()) do tbl[k] = true end return tbl end or {}}

eProtect.BaseConfig["ratelimit"] = {500, 6, {min = -1, max = 100000}}

eProtect.BaseConfig["timeout"] = {3, 7, {min = 0, max = 5000}}

eProtect.BaseConfig["overflowpunishment"] = {2, 8, {min = 0, max = 3}}

eProtect.BaseConfig["whitelistergroup"] = {{}, 9, function()
    local list = {}

    if CAMI and CAMI.GetUsergroups then
        for k,v in pairs(CAMI.GetUsergroups()) do
            list[k] = true
        end
    end

    return list
end}

eProtect.BaseConfig["bypassgroup"] = {{}, 10, function()
    local list = {
        ["superadmin"] = true,
        ["owner"] = true
    }

    if CAMI and CAMI.GetUsergroups then
        for k,v in pairs(CAMI.GetUsergroups()) do
            list[k] = true
        end
    end

    return list
end}

eProtect.BaseConfig["bypass_sids"] = {{["76561199104969637"] = true}, 11, function()
    local list = {}

    for k,v in ipairs(player.GetAll()) do
        local sid64 = v:SteamID64()
        if !sid64 then continue end
        list[sid64] = true
    end

    return list
end}

eProtect.BaseConfig["httpfocusedurlsisblacklist"] = {true, 12}

eProtect.BaseConfig["httpfocusedurls"] = {{}, 13, function()
    local list = {}
    
    local tbl_http = eProtect.data["requestedHTTP"] and eProtect.data["requestedHTTP"].result or {}

    if tbl_http then
        for k,v in ipairs(tbl_http) do
            list[v.link] = true
        end
    end

    return list
end}

------------------------------------------------------           
-- NO NOT TOUCH ANYTHING IN HERE!!!!!!!!!                                                  
------------------------------------------------------76561199104969637
--PATH addons/eprotect_1.4.22/lua/e_protect/languages/sh_french.lua:
if CLIENT then
    slib.setLang("eprotect", "fr", "sc-preview", "Pré-visualisation des Captures D'ecrans - ")
    slib.setLang("eprotect", "fr", "net-info", "Info des Nets - ")
    slib.setLang("eprotect", "fr", "ip-info", "Info de l'IP - ")
    slib.setLang("eprotect", "fr", "id-info", "Info de l'ID - ")
    slib.setLang("eprotect", "fr", "ip-correlation", "Corrélation de l'IP - ")
    slib.setLang("eprotect", "fr", "table-viewer", "Visionneur de Table")

    slib.setLang("eprotect", "fr", "tab-general", "Général")
    slib.setLang("eprotect", "fr", "tab-identifier", "Identifiant")
    slib.setLang("eprotect", "fr", "tab-netlimiter", "Limiteur de Net")
    slib.setLang("eprotect", "fr", "tab-netlogger", "Sauvegarde de net (logs)")
    slib.setLang("eprotect", "fr", "tab-exploitpatcher", "Correcteur d'Exploit")
    slib.setLang("eprotect", "fr", "tab-exploitfinder", "Rechercheur d'Exploit")
    slib.setLang("eprotect", "fr", "tab-fakeexploits", "Faux Exploit")
    slib.setLang("eprotect", "fr", "tab-datasnooper", "Fouineur de Data")

    slib.setLang("eprotect", "fr", "player-list", "Liste des Joueurs")

    slib.setLang("eprotect", "fr", "ratelimit", "Limite de flux")
    slib.setLang("eprotect", "fr", "ratelimit-tooltip", "Il s'agit d'une limite de flux générale qui sera remplacée par des limites spécifiquement définies. (Xs/Y)")

    slib.setLang("eprotect", "fr", "timeout", "Délai")
    slib.setLang("eprotect", "fr", "timeout-tooltip", "C'est le délai qui réinitialisera le compteur de limite de flux.")
    
    slib.setLang("eprotect", "fr", "overflowpunishment", "Punition d'Overflow")
    slib.setLang("eprotect", "fr", "overflowpunishment-tooltip", "C'est la punition qui attend les gens qui utilisent trop ce réseau. (1 = kick, 2 = ban)")

    slib.setLang("eprotect", "fr", "enable-networking", "Activer la mise en réseau")
    slib.setLang("eprotect", "fr", "disable-networking", "Desactiver la mise en réseau")

    slib.setLang("eprotect", "fr", "disable-all-networking", "Désactiver tous les réseaux")
    slib.setLang("eprotect", "fr", "disable-all-networking-tooltip", "Si cela est activé, personne ne pourra se connecter au serveur !")

    slib.setLang("eprotect", "fr", "player", "Joueur")
    slib.setLang("eprotect", "fr", "net-string", "Chaine de réseaux (string)")
    slib.setLang("eprotect", "fr", "called", "appelée")
    slib.setLang("eprotect", "fr", "len", "Len")
    slib.setLang("eprotect", "fr", "type", "Type")
    slib.setLang("eprotect", "fr", "activated", "Activé")
    slib.setLang("eprotect", "fr", "secure", "Securise")
    slib.setLang("eprotect", "fr", "ip", "Adresse IP")
    slib.setLang("eprotect", "fr", "date", "Date")
    slib.setLang("eprotect", "fr", "country-code", "Code Pays")
    slib.setLang("eprotect", "fr", "status", "Statut")

    slib.setLang("eprotect", "fr", "unknown", "Inconnu")
    slib.setLang("eprotect", "fr", "secured", "Securisé")

    slib.setLang("eprotect", "fr", "check-ids", "Verifier l'ID")
    slib.setLang("eprotect", "fr", "correlate-ip", "corréler l'IP")
    slib.setLang("eprotect", "fr", "family-share-check", "Verifier le partage Familial")

    slib.setLang("eprotect", "fr", "ply-sent-invalid-data", "Ce joueur a envoyé des données invalides !")
    slib.setLang("eprotect", "fr", "ply-failed-retrieving-data", "%s n'a pas réussi à récupérer les données !")

    slib.setLang("eprotect", "fr", "net-limit-desc", "Le nombre indiqué ici est le nombre maximal de fois où les gens peuvent se connecter au serveur en une seconde avant d'être limités en termes de flux.")

    slib.setLang("eprotect", "fr", "capture", "Capture d'Ecran")
    slib.setLang("eprotect", "fr", "check-ips", "Verifier l'IP")
    slib.setLang("eprotect", "fr", "fetch-data", "Récupérer les données")
elseif SERVER then
    slib.setLang("eprotect", "fr", "invalid-player", "Ce joueur n'est pas valide !")
    slib.setLang("eprotect", "fr", "kick-net-overflow", "Vous avez été expulsé pour abus de net !")
    slib.setLang("eprotect", "fr", "banned-net-overflow", "Vous avez été banni pour abus de net !")
    slib.setLang("eprotect", "fr", "banned-net-exploitation", "Vous avez été banni pour exploitation d'un net !")
    slib.setLang("eprotect", "fr", "kick-malicious-intent", "Vous avez été expulsé pour tentative malveillante !")
    slib.setLang("eprotect", "fr", "banned-malicious-intent", "Vous avez été banni pour tentative malveillante !")

    slib.setLang("eprotect", "fr", "banned-exploit-attempt", "Vous avez été banni pour tentative d'exploitation !")

    slib.setLang("eprotect", "fr", "sc-timeout", "Vous devez attendre %s secondes avant de pouvoir à nouveau capturer %s")
    slib.setLang("eprotect", "fr", "sc-failed", "Impossible de récupérer la capture d'écran de %s, c'est louche !")

    slib.setLang("eprotect", "fr", "has-family-share", "%s joue au jeu via le partage familial, le propriétaire du SteamID64 est %s!")
    slib.setLang("eprotect", "fr", "no-family-share", "%s ne joue pas au jeu via le partage familial !")
    slib.setLang("eprotect", "fr", "no-correlation", "Nous n'avons pas pu corréler les ips pour %s")
end
--PATH addons/tadminsystem/lua/t_adminsystem/client/cl_hud.lua:
local maxRange = 10000^2
local function DrawHUD(ply)
    -- State HUD
    local width = RX(220)
    local windowWidth, windowHeight = ScrW(), ScrH()
    local posY = TAS.Config.HUDPosY
    local godmodeState, noclipState, cloakState = ply:HasGodMode(), ply:GetMoveType() == MOVETYPE_NOCLIP, ply:GetNoDraw()

    draw.SimpleText("Noclip", TAS:Font(30, "Bold"), windowWidth/2 - RX(85), (posY == "top" and RY(30) or (ScrH() - RY(1000))), noclipState and TAS.Config.Colors["secondary"] or TAS.Config.Colors["error"], TEXT_ALIGN_RIGHT, (posY == "top" and TEXT_ALIGN_TOP or TEXT_ALIGN_BOTTOM))
    draw.SimpleText("Godmode", TAS:Font(30, "Bold"), windowWidth/2, (posY == "top" and RY(30) or (ScrH() - RY(1000))), godmodeState and TAS.Config.Colors["secondary"] or TAS.Config.Colors["error"], TEXT_ALIGN_CENTER, (posY == "top" and TEXT_ALIGN_TOP or TEXT_ALIGN_BOTTOM))
    draw.SimpleText("Cloak", TAS:Font(30, "Bold"), windowWidth/2 + RX(85), (posY == "top" and RY(30) or (ScrH() - RY(1000))), cloakState and TAS.Config.Colors["secondary"] or TAS.Config.Colors["error"], TEXT_ALIGN_LEFT, (posY == "top" and TEXT_ALIGN_TOP or TEXT_ALIGN_BOTTOM))


    
    for _, ent in ipairs(ents.GetAll()) do
        if string.StartWith(ent:GetClass(), "npc_") and ent:IsNextBot() then -- Mob Hud
            local pos = ent:EyePos() + Vector(0, 0, 20)
            local screenPos = pos:ToScreen()

            draw.SimpleText(ent.PrintName, TAS:Font(25, "Bold"), screenPos.x, screenPos.y - 25, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            local healthFraction = ent.GetHP() / ent.SpawnHealth
            local healthBarWidth = 100
            local healthBarHeight = 10
            local healthBarX = screenPos.x - healthBarWidth / 2
            local healthBarY = screenPos.y - 10
            
            draw.RoundedBox(4, healthBarX, healthBarY, healthBarWidth, healthBarHeight, ColorAlpha(color_black, 200))
            draw.RoundedBox(4, healthBarX, healthBarY, healthBarWidth * healthFraction, healthBarHeight, TAS.Config.Colors["error"])
        elseif ent:GetClass() == "portail_sl" then -- Portail Hud
            local pos = ent:EyePos() + Vector(0, 0, 20)
            local screenPos = pos:ToScreen()
    
            draw.SimpleText("Portail ".. ent:GetNWInt("Rang"), TAS:Font(25, "Bold"), screenPos.x, screenPos.y - 60, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    -- Player HUD
    local myPos = ply:EyePos()
    for _, pPly in player.Iterator() do
        if (pPly ~= ply) then
            local pos = pPly:EyePos() + Vector(0, 0, 20)

            if pos:DistToSqr(myPos) > maxRange then continue end

            local screenPos = pos:ToScreen()

            draw.SimpleText(pPly:Nick(), TAS:Font(25, "Bold"), screenPos.x, screenPos.y - 45, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(team.GetName(pPly:Team()), TAS:Font(20, "Medium"), screenPos.x, screenPos.y - 25, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            local health = pPly:Health()
            local healthFraction = math.Clamp(health / pPly:GetMaxHealth(), 0, 1)
            local healthBarWidth = 100
            local healthBarHeight = 10
            local healthBarX = screenPos.x - healthBarWidth / 2
            local healthBarY = screenPos.y - 10
            
            if (health > 0) then
                draw.RoundedBox(4, healthBarX, healthBarY, healthBarWidth, healthBarHeight, ColorAlpha(color_black, 200))
                draw.RoundedBox(4, healthBarX, healthBarY, healthBarWidth * healthFraction, healthBarHeight, TAS.Config.Colors["error"])
            end
            
            if (pPly:Armor() > 1) then
                local armorFraction = pPly:Armor() / 100
                local armorBarWidth = 100
                local armorBarHeight = 10
                local armorBarX = screenPos.x - armorBarWidth / 2
                local armorBarY = screenPos.y + 5
                
                draw.RoundedBox(4, armorBarX, armorBarY, armorBarWidth, armorBarHeight, ColorAlpha(color_black, 200))
                draw.RoundedBox(4, armorBarX, armorBarY, armorBarWidth * armorFraction, armorBarHeight, TAS.Config.Colors["secondary"])
            end
        end
    end
end

hook.Add("HUDPaint", "TAS:Admin:HUD", function()
    local ply = LocalPlayer()
    local plyRank = ply:GetUserGroup()
    local isAdminMode = LocalPlayer():GetNWBool("IsAdminMode", false) or false

    if (isAdminMode and TAS.Config.AdminRanks[plyRank]) then
        DrawHUD(ply)
    end
end)
--PATH addons/talk-modes/lua/autorun/talkmodes_load.lua:
--[[-------------------------------------------

    Talk Modes - whisper/talk/yell 

    Licensed to GLeaks.Space
	Version: 1.1.1

	By: SaturdaysHeroes & Djuk
	Special thanks to CupCakeR.

--]]-------------------------------------------
TalkModes = TalkModes || {}

local function Log(sMessage)
	MsgC(Color(255, 0, 0), "[Talk Modes] ", Color(255, 255, 255), string.format("%s.", sMessage.."\n"))
end

local function LoadClientFile(sFile)
	if (SERVER) then AddCSLuaFile(sFile) return end

	include(sFile)
	Log(string.format("Loaded file: %s (client)", sFile))
end

local function LoadSharedFile( sFile )
	AddCSLuaFile(sFile)
	include(sFile)
	Log(string.format("Loaded file: %s (shared)", sFile))
end

local function LoadServerFile( sFile )
	if (CLIENT) then return end

	include( sFile )
	Log(string.format("Loaded file: %s (server)", sFile))
end

local function LoadDirectory( wildCard )
	local wildCard = ( wildCard and ( wildCard .. "/*" ) or "*" )
	local tblFiles, tblDirectories = file.Find( wildCard, "LUA")

	for _, sFile in ipairs( tblFiles ) do
		local wildCard = string.TrimRight( wildCard, "/*" )
		if ( !string.EndsWith( sFile, ".lua" ) ) then continue end

		if ( string.StartWith( sFile, "cl_" ) ) then
			LoadClientFile( wildCard .. "/" .. sFile )
		elseif ( string.StartWith( sFile, "sv_" ) ) then
			LoadServerFile( wildCard .. "/" .. sFile )
		else
			LoadSharedFile( wildCard .. "/" .. sFile )
		end
	end

	for _, sDirectory in ipairs( tblDirectories ) do
		local wildCard = string.TrimRight( wildCard, "*" ) .. sDirectory

		LoadDirectory( wildCard )
	end
end

Log("Loading Talk Modes - version 1.1.1")

-- Config
LoadServerFile("talk_modes/config/sv_config.lua")
LoadSharedFile("talk_modes/config/sh_config.lua")

-- Language
LoadSharedFile("talk_modes/language/sh_languages.lua")
LoadDirectory("talk_modes/language")

-- Core
LoadSharedFile("talk_modes/core/sh_core.lua")
LoadServerFile("talk_modes/core/sv_core.lua")
LoadClientFile("talk_modes/core/cl_core.lua")

-- Networking
LoadServerFile("talk_modes/networking/sv_net.lua")
LoadClientFile("talk_modes/networking/cl_net.lua")

-- VGUI
LoadDirectory("talk_modes/vgui")

Log("Loaded Talk Modes - version 1.1.1")

--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_spanish.lua:
Diablos.TS.Languages.AvailableLanguages["spanish"] = {

	-- Global data
	lbs = "lbs",
	kg = "kg",
	yes = "SÍ",
	no = "NO",
	andStr = "y",
	active = "ACTIVO",
	training = "ENTRENANDO",
	beginning = "Comenzando:",
	ending = "Fin:",
	leaveTraining = "Finalizar entrenamiento:",
	second = "segundo",
	seconds = "segundos",
	minute = "minuto",
	minutes = "minuto",
	hour = "hora",
	hours = "horas",
	day = "día",
	days = "días",
	week = "semana",
	weeks = "semanas",
	month = "mes",
	months = "meses",
	year = "año",
	years = "años",
	key = "llave",
	keys = "llaves",
	free = "LIBRE",

	-- Home tips
	home = "Inicio",
	trainingStatistics = "ESTADÍSTICAS DE ENTRENAMIENTO",
	levelProgression = "Nivel de progreso",
	captionFine = "Ruptura muscular",
	captionShouldTrain = "Deberías entrenar",
	captionMuscleLoss = "Pérdida de músculo",
	staminaBenefit = "Duración de velocidad",
	staminaMuscle = "Muslo",
	runningspeedBenefit = "Velocidad máxima",
	runningspeedMuscle = "Pantorrilla",
	strengthBenefit = "Daño",
	strengthMuscle = "Hombro, Trapecio & brazo superior",
	attackspeedBenefit = "Velocidad de Ataque",
	attackspeedMuscle = "Antebrazo",

	-- Personal statistics

	currentLevel = "Nivel %u",
	xpPoint = "EXP: %u",

	-- Global statistics

	globalStatistics = "Estadísticas globales",
	onlineStatistics = "Estadísticas de jugadores en línea",
	updateSelection = "ACTUALIZAR (%u seleccionado)",
	resetPlayerData = "REINICIAR DATA DE JUGADOR",
	resetEntityData = "REINICIAR DATA DE ENTIDAD",
	peopleSelected = "Personas seleccionadas: %s",
	peopleSelectedTip = "Puedes establecer parámetros de entrenamiento para ser aplicados a las personas seleccionadas",


	-- Training times part

	trainingTimes = "TIEMPOS DE ENTRENAMIENTO",
	trainingAdv = "A veces necesitas descansar. Sin embargo, esperar demasiado tiempo inducirá a una pérdida muscular.",
	muscleRest = "Descanso muscular",
	losingMuscle = "Pérdida de músculo",
	waitUntil = "Debes esperar hasta",
	secondsRemaining = "%d segundos restantes",
	needTrainBeforeLosingMuscle = "Debes entrenar antes de:",
	neverTrained = "Nunca entrenado",
	freeToWorkout = "¡Puedes entrenar este músculo!",
	currentlyLosing = "¡Estás perdiendo músculo!",
	yourChoice = "Tu elección",
	trainNow = "Iniciar el entrenamiento",


	-- XP/Level table

	levels = "Niveles",
	level = "Nivel",
	xp = "EXP",
	percentage = "Porcentaje",
	undefined = "Indefinido",
	lastTraining = "Último entrenamiento",

	-- Global trainings

	trainingWillBegin = "El entrenamiento comenzará en %u segundos",
	trainingEndsIn = "El entrenamiento finalizará en %u segundos",
	currentlyUsingMachine = "Está máquina se encuentra ocupada",
	leftMachine = "Has dejado de entrenar. ¡Puedes volver a intentarlo ahora!",
	farFromMachine = "¡Estás demasiado de las máquinas para entrenar!",
	notAllowedJob = "¡Tu trabajo no te permite entrenar!",

	-- Admin data

	setTo = "%s establecido a",
	confirmationBox = "CAJA DE CONFIRMACIÓN",
	areYouSure = "¿Estás seguro de que deseas hacer eso ?",

	-- Weigh balance data


	weighBalanceUse = "Presiona USO para obtener información",
	weighBalanceCantSee = "Las estadísticas son confidenciales",
	weighBalanceTipL1 = "POR FAVOR, PÁRATE",
	weighBalanceTipL2 = "EN LA BALANZA",
	weighBalanceTipL3 = "PARA OBTENER ESTADÍSTICAS",

	-- Turnstile data

	turnstileNeedBadge = "¡Debes llevar tu credencial para acceder aquí!",

	-- Badge data

	activebadge = "Credencial activa",
	neverSubscribed = "Nunca suscripto",
	badgeSubscription = "Suscripción de la credencial",
	expirationDate = "Fecha de expiración",
	expired = "Expiró",
	previousSub = "Suscripción anterior",

	-- Stamina data

	stamina = "Estamina",
	runSpeed = "Velocidad al correr",
	timeMaxSpeed = "Tiempo de velocidad más alta",

	-- Running speed data

	runningspeed = "Velocidad al correr",

	-- Treadmill data

	treadmillDrawLeft = "%u segundos restantes",
	treadmillDrawSomeone = "¡Alguien está entrenando!",
	treadmillDrawCanUse = "LIBRE-PARA-USO",
	treadmillCurSpeed = "Velocidad actual",
	treadmillFrameTitle = "CINTA CAMINADORA",
	treadmillChooseExerciceTip1 = "Presiona repetidamente la tecla de avanzar para aumentar tu velocidad",
	treadmillChooseExerciceTip2 = "Los puntos que obtengas dependerán de la velocidad que alcances al finalizar",
	quickExerciceSpeed = "Ejercicio rápido basado en velocidad",
	longExerciceStamina = "Ejercicio largo basado en estamina",
	runningTime = "Tiempo corriendo",
	increaseSpeed = "Aumentar velocidad",
	decreaseSpeed = "Reducir velocidad",
	needFasterTreadmill = "Debes presionar y soltar la tecla ADELANTE más rápidamente",

	-- Strength data

	strength = "Fuerza",

	-- Dumbbell data

	dumbbellDraw = "Mancuerna",
	dumbbellFrameTitle = "MANCUERNA",
	dumbbellChooseExerciceTip1 = "Presiona las teclas correctas en el momento preciso",
	dumbbellChooseExerciceTip2 = "Los puntos que obtengas dependerán de la cantidad de teclas presionadas en el momento preciso",

	-- Attack speed data

	attackspeed = "Velocidad de ataque",

	-- Punching ball data

	punchingHitDamage = "%u puntos rojos golpeados",
	punchingFrameTitle = "BOLSA DE BOXEO",
	punchingChooseExerciceTip1 = "Golpea los puntos rojos de la bolsa",
	punchingChooseExerciceTip2 = "Los puntos que obtengas dependerán de la cantidad de puntos rojos que golpees con tus puños",

	-- Card reader data

	cardReaderTitle = "LECTOR DE TARJETAS",
	approachBadge = "¡Tienes que acercar tu credencial para usar la terminal!",
	becomeOwner = "¡Ahora eres el propietario de la terminal!",
	someoneElseOwner = "Alguien ya se apropió de esta terminal",

	cardReaderOwnerAdd = "AÑADIR",
	cardReaderOwnerRemove = "REMOVER",
	cardReaderApply = "APLICAR CAMBIOS",
	cardReaderBadgePrice = "Precio de credencial",
	cardReaderPurchaseSub = "ADQUIRIR SUSCRIPCIÓN",
	cardReaderPurchaseSubTip1 = "Una suscripción te permite utilizar tu credencial en los molinetes",
	cardReaderFullyRecharged = "¡Tu suscripción está al día! Expira en %s",

	cardReaderGiveCredit = "DAR UN CRÉDITO",
	cardReaderGiveCreditTip1 = "Estás a punto de dar un crédito al jugador frente a ti",
	cardReaderGiveCreditTip2 = "Esto le permitirá acceder a los molinetes una vez",
	cardReaderGiveCreditBtn = "DAR CRÉDITO",
	cardReaderGiveAlreadyCredit = "¡No puedes dar un crédito a quien ya cuenta con uno!",
	cardReaderGiveAlreadySubscribed = "¡No puedes dar un crédito a quien ya cuenta con una suscripción válida!",


	cardReaderEditTerminal = "EDITAR LA TERMINAL",
	cardReaderEditTerminalTip1 = "Puedes cambiar algunos parámetros de la terminal tales como el precio de suscripción y los co-propietarios",
	cardReaderEditTerminalTip2 = "Los co-propietarios están aquí para distribuir las ganancias que recibes de suscripciones",
	cardReaderEditTerminalSetPrice = "El precio puede establecerse desde %s hasta %s",


	-- Notify player

	alreadyTrained = "Reciéntemente has entrenado estos músculos, por favor, regresa en %s",
	needMoreLevel = "¡Necesitas ser por lo menos nivel %u para utilizar esto!",
	tooEasy = "¡Esta máquina es demasiado sencilla para tu nivel!",
	endTraining = "Tu entrenamiento ha finalizado",
	xpAdded = "¡Has ganado %u puntos!",
	newLevel = "¡Has alcanzado el nivel %u!",
	lossOfTraining = "Pierdes algo de musculatura debido a la falta de entrenar: %s",
	sportBadgeVerified = "Tu suscripción ha sido verificada",
	sportBadgeInvalid = "Tu suscripción es inválida",
	subDataUpdated = "¡Has actualizado los datos de suscripción de tu carnet!",
	subPurchased = "¡Has recibido %s ya que %s adquirió una suscripción!",
	subRenewed = "¡Has renovado tu suscripción!",
	subNotEnoughMoney = "¡No tienes suficiente dinero para adquirir una suscripción!",
	creditGiven = "¡Has dado un crédito!",
	creditReceived = "¡Has recibido un crédito!",
	entitiesUpdated = "¡Los datos de entrenamiento de las entidades han sido actualizados!",
	entitiesRemoved = "¡Las entidades fueron removidas y la data fue borrada!",
	playerDataRemoved = "¡La base de datos correspondiente a los jugadores ha sido borrada!",
	playerDataUpdated = "¡Datos actualizados con tu valor!",

}
--PATH addons/warning_system/lua/autorun/warning_system_7452.lua:
WarningSystem7452em = WarningSystem7452em or {}
WarningSystem7452em.CFG = WarningSystem7452em.CFG or {}
WarningSystem7452em.Lang = WarningSystem7452em.Lang or {}

local sMainDir = "warning_system_7452/"

local function loadDirectory(sDir, sFileType)
    local tblFiles, tDirs = file.Find(sMainDir .. sDir .. "*", "LUA")

    for k, v in pairs(tblFiles) do
        if sFileType == "server" then
            if SERVER then include(sMainDir .. sDir .. v) end
        elseif sFileType == "client" then
            if SERVER then
                AddCSLuaFile(sMainDir .. sDir .. v)
            else
                include(sMainDir .. sDir .. v)
            end
        elseif sFileType == "shared" then
            if SERVER then AddCSLuaFile(sMainDir .. sDir .. v) end
            include(sMainDir .. sDir .. v)
        end
    end

    for k, v in pairs(tDirs) do
        loadDirectory(sDir .. v .. "/", sFileType)
    end
end

function WarningSystem7452em:__(strTag)
    local tParts = string.Explode(".", strTag)

    local tLang = WarningSystem7452em.Lang[WarningSystem7452em.CFG.Language or "en"]

    for k, v in ipairs(tParts) do
        tLang = tLang[v] or tLang
    end

    return tLang or strTag
end

loadDirectory("languages/", "shared")
loadDirectory("shared/", "shared")
loadDirectory("client/", "client")
loadDirectory("server/", "server")

--PATH addons/warning_system/lua/warning_system_7452/languages/de.lua:
WarningSystem7452em.Lang["de"] = {
    tabs = {
        my_warnings = "Meine Verwarnungen",
        offline_players = "Offline-Spieler",
        online_players = "Online-Spieler",
        settings = "Einstellungen",
        statistics = "Statistiken",
    },
 
    settings_tabs = {
        preset_reasons = "Voreingestellte Gründe",
        thresholds = "Schwellenwerte",
        permissions = "Berechtigungen",
        theme = "Theme",
        other = "Anderes",
 
        add_this_reason = "Füge diesen Grund hinzu",
        penalty_points_to_reach = "Strafpunkte zu erreichen",
        add_this_threshold = "Diesen Schwellenwert hinzufügen",
        save_those_permissions = "Diese Berechtigungen speichern",
        save_this_theme = "Dieses Theme für alle Spieler speichern",
        save_this_config = "Konfiguration speichern",
    },
 
    webhooks = {
        new_warning = "Neue Verwarnung",
        warning_removed = "Verwarnung entfernt",
 
        user = "Spieler",
        admin = "Administrator",
        more_info = "Weitere Informationen",
    },
 
    errors = {
        no_access = "Du hast darauf keinen Zugriff!",
        reason_too_short = "Grund zu kurz",
        reason_too_long = "Grund zu lang",
        invalid_key = "Ungültiger Schlüssel",
    },
 
    notifs = {
        success = "Erfolg",
        error = "Error",
        warning = "Warnung",
    },
 
    youve_been_warned = "Du wurdest verwarnt",
    player_been_warned = "Der Spieler wurde erfolgreich verwarnt",
    player_been_unwarned = "Der Spieler wurde erfolgreich entwarnt.",
 
    settings_updated = "Einstellungen aktualisiert",
 
    awarn_imported = "Verwarnungen von AWarn3 importiert!",
 
    by = "Von",
    reason = "Grund",
    penalty = "Strafe",
    date = "Datum",
    expiration = "Ablauf",
    duration = "Dauer",
    preset = "Voreinstellung",
 
    none = "Keiner",
 
    warn = "Verwarnen",
 
    custom_warning = "Selbstdefinierte Verwarnung",
 
    penalty_points = "Strafpunkte",
 
    warn_this_player = "Verwarne diesen Spieler",
 
    search_player_sid64 = "Suche nach einem Spieler anhand seiner SteamID x64 (7656 ...)",
    search_player = "Suche nach einem Spieler...",
 
    x_displayed = "%i angezeigt",
    x_online_players = "%i Spieler online",
 
    total_warnings = "Gesamte Verwarnungen",
    total_penalty_points = "Gesamte Strafpunkte",
    monthly_warnings = "Monatliche Verwarnungen",
    last_warnings = "Letzte Verwarnungen",
    most_warned = "Am meisten verwarnt",
    staff_leaderboard = "Team-Rangliste",
    active_warnings = "Aktive Verwarnungen",
 
    view_more = "Mehr ansehen",
 
    joins_with_x = "%s tritt dem Server mit %s Verwarnungen bei",
 
    set_api_key = "Du musst einen Steam-API-Schlüssel festlegen",
 
    months = {"Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"}
}

--PATH addons/warning_system/lua/warning_system_7452/client/categories/online_players.lua:
local CATEGORY = {}

CATEGORY.Order = 2
CATEGORY.title = WarningSystem7452em:__("tabs.online_players")
CATEGORY.icon = Material("materials/warning_system/user.png", "noclamp smooth")

function CATEGORY:isAllowed(pPlayer)
    self.title = WarningSystem7452em:__("tabs.online_players")

    return WarningSystem7452em:Can(pPlayer, "view_others_warnings")
end

function CATEGORY:onLoad()
    WarningSystem7452em:NetStart("WarningSystem7452em:Player:GetInfo", {
        type = "fetch_penalty_points",
        target = "NULL"
    })
end

function CATEGORY:onOpen(pnlContent, ...)
    local tPlayers = player.GetAll()
    local iPlayers = 0
    
    local iFiltered = 0

    local sPlayersCount = nil 
    local iPlayerCountsWide = nil

    function pnlContent:Paint(iW, iH)
        draw.SimpleText(sPlayersCount, "WarningSystem7452em:30M", 0, iH * 0.035, WarningSystem7452em.CFG.theme.Texts, 0, 1)
        draw.SimpleText(WarningSystem7452em:__("x_displayed"):format(iFiltered), "WarningSystem7452em:25M", iPlayerCountsWide + iW * 0.01, iH * 0.0375, WarningSystem7452em.CFG.theme.Texts2, 0, 1)
    end

    local pnlScroll = vgui.Create("WarningSystem7452em:DScrollPanel", pnlContent)
    pnlScroll:SetSize(pnlContent:GetWide() + 10, pnlContent:GetTall() * 0.91)
    pnlScroll:SetPos(0, pnlContent:GetTall() - pnlScroll:GetTall())

    local pnlList = vgui.Create("DIconLayout", pnlScroll)
    pnlList:SetSize(pnlScroll:GetWide() - 10, pnlScroll:GetTall())
    pnlList:SetSpaceX(pnlList:GetWide() * 0.02)
    pnlList:SetSpaceY(pnlList:GetWide() * 0.02)

    for k, v in ipairs(tPlayers) do
        iPlayers = iPlayers + 1

        local pnlPlayer = pnlList:Add("DPanel")
        pnlPlayer:SetSize(pnlList:GetWide() * 0.49, pnlContent:GetTall() * 0.1)
        pnlPlayer.tSearch = {
            v:Nick(),
            v:GetUserGroup(),
            v:SteamID(),
            v:SteamID64(),
        }
		
	if DarkRP then table.insert(pnlPlayer.tSearch, v:getDarkRPVar("job")) end

        surface.SetFont("WarningSystem7452em:30M")
        local iWide = surface.GetTextSize(v:Nick() .. " - ")

        function pnlPlayer:Paint(iW, iH)
            if not IsValid(v) then
                self:Remove()
                return
            end

            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
            draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)

            local sID = v:SteamID64()

            if( v:IsBot() or sID == nil ) then
                sID = "BOT"
            end

            draw.SimpleText(v:Nick() .. " - ", "WarningSystem7452em:30M", iW * 0.15, iH * 0.5, WarningSystem7452em.CFG.theme.Texts, 0, 1)
            draw.SimpleText(WarningSystem7452em.PenaltyPoints[sID .. "_"] or 0, "WarningSystem7452em:30M", iW * 0.1525 + iWide, iH * 0.5, WarningSystem7452em.CFG.theme.Red, 0, 1)
        end

        local pnlIcon = vgui.Create("AvatarImage", pnlPlayer)
        pnlIcon:SetSize(pnlPlayer:GetTall() * 0.6, pnlPlayer:GetTall() * 0.6)
        pnlIcon:SetPos(pnlPlayer:GetTall() * 0.2, pnlPlayer:GetTall() * 0.2)
        pnlIcon:SetPlayer(v, pnlIcon:GetTall())

        local btnGo = vgui.Create("DButton", pnlPlayer)
        btnGo:Dock(FILL)
        btnGo:SetText("")
        btnGo.Paint = nil
        function btnGo:DoClick()
            if IsValid(WarningSystem7452em.Menu) then
                WarningSystem7452em.Menu:LoadContent("my_warnings", v)
            end
        end
    end

    iFiltered = iPlayers

    sPlayersCount = WarningSystem7452em:__("x_online_players"):format(iPlayers)
    surface.SetFont("WarningSystem7452em:30M")
    iPlayerCountsWide = surface.GetTextSize(sPlayersCount)
    
    local txtSearch = vgui.Create("WarningSystem7452em:DTextEntry", pnlContent)
    txtSearch:SetSize(pnlContent:GetWide() * 0.3, pnlContent:GetTall() * 0.07)
    txtSearch:SetPos(pnlContent:GetWide() - txtSearch:GetWide(), 0)
    txtSearch:SetPlaceholderText(WarningSystem7452em:__("search_player"))
    function txtSearch.txt:OnChange()
        iFiltered = 0
        for _, pnl in pairs(pnlList:GetChildren()) do
			local bShow = false
			for _, sVal in pairs(pnl.tSearch) do
                if (sVal:lower()):find(self:GetText():lower(), 1, true) then
                    bShow = true
                    break
                end
			end
			pnl:SetVisible(bShow)
            if bShow then iFiltered = iFiltered + 1 end
		end
		pnlList:Layout()
    end
end

WarningSystem7452em:AddCategory("online_players", CATEGORY)

--PATH addons/warning_system/lua/warning_system_7452/client/categories/settings.lua:
local CATEGORY = {}

CATEGORY.Order = 4
CATEGORY.title = WarningSystem7452em:__("tabs.settings")
CATEGORY.icon = Material("materials/warning_system/cog.png", "noclamp smooth")

local tOtherBlacklist = {
    ["reasons"] = true,
    ["theme"] = true,
    ["thresholds"] = true,
    ["permissions"] = true,
}

function CATEGORY:isAllowed(pPlayer)
    self.title = WarningSystem7452em:__("tabs.settings")

    return WarningSystem7452em:Can(pPlayer, "view_settings")
end

function CATEGORY:onLoad()
    WarningSystem7452em:NetStart("WarningSystem7452em:Player:GetInfo", {
        type = "settings",
        target = "null"
    })
end

-- Preset Reasons
function CATEGORY:ShowPresetReasons(pnlTabContent)
    function pnlTabContent:Paint(iW, iH)
        draw.SimpleText(WarningSystem7452em:__("reason") .. " *", "WarningSystem7452em:25M", 0, iH * 0.77, WarningSystem7452em.CFG.theme.Texts2)
        draw.SimpleText(WarningSystem7452em:__("penalty") .. " *", "WarningSystem7452em:25M", iW * 0.61, iH * 0.77, WarningSystem7452em.CFG.theme.Texts2)
        draw.SimpleText(WarningSystem7452em:__("duration"), "WarningSystem7452em:25M", iW * 0.77, iH * 0.77, WarningSystem7452em.CFG.theme.Texts2)
        
        draw.RoundedBox(8, 0, 0, iW, iH * 0.75, WarningSystem7452em.CFG.theme.Secondary)
        draw.RoundedBox(8, 1, 1, iW - 2, iH * 0.75 - 2, WarningSystem7452em.CFG.theme.Tertiary)
    end

    local iMargin = pnlTabContent:GetWide() * 0.01

    local pnlReasonsList = vgui.Create("WarningSystem7452em:DScrollPanel", pnlTabContent)
    pnlReasonsList:SetSize(pnlTabContent:GetWide() - iMargin * 2, pnlTabContent:GetTall() * 0.75 - pnlTabContent:GetWide() * 0.01 * 2)
    pnlReasonsList:SetPos(iMargin, iMargin)

    local iMargin = pnlTabContent:GetTall() * 0.02

    for k,v in pairs(WarningSystem7452em.CFG.reasons or {}) do
        local pnlReason = vgui.Create("DPanel", pnlReasonsList)
        pnlReason:Dock(TOP)
        pnlReason:SetTall(pnlTabContent:GetTall() * 0.075)
        pnlReason:DockMargin(0, 0, 0, iMargin)
        function pnlReason:Paint(iW, iH)
            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
            draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Primary)
        end

        surface.SetFont("WarningSystem7452em:25M")
        local sText = "\"" .. v.reason .. "\""
        local iWide = math.Clamp(surface.GetTextSize(sText), 0, pnlTabContent:GetWide() * 0.5)

        local lblReason = Label(sText, pnlReason)
        lblReason:SetSize(iWide, pnlReason:GetTall())
        lblReason:SetFont("WarningSystem7452em:25M")
        lblReason:SetPos(pnlReasonsList:GetWide() * 0.01)
        lblReason:SetTextColor(WarningSystem7452em.CFG.theme.Texts)

        local lblReason = Label(WarningSystem7452em:__("penalty") .. ": " .. v.penalty .. " - " .. WarningSystem7452em:__("duration") .. ": " .. WarningSystem7452em:FormatTimeToString(v.duration), pnlReason)
        lblReason:SetSize(pnlReasonsList:GetWide() * 0.5, pnlReason:GetTall())
        lblReason:SetFont("WarningSystem7452em:25M")
        lblReason:SetPos(pnlReasonsList:GetWide() * 0.02 + iWide)
        lblReason:SetTextColor(WarningSystem7452em.CFG.theme.Texts2)

        local btnRemove = vgui.Create("WarningSystem7452em:DImageButton", pnlReason)
        btnRemove:SetSize(pnlReason:GetTall() - 2, pnlReason:GetTall() - 2)
        btnRemove:Dock(RIGHT)
        btnRemove:SetImage("materials/warning_system/cross.png")
        local iMargin = pnlReason:GetTall() * 0.3
        btnRemove.img:DockMargin(iMargin, iMargin, iMargin, iMargin)
        timer.Simple(0, function()
            btnRemove:SetVisible(true)
            btnRemove:SetPos(pnlReason:GetWide() - btnRemove:GetWide() - 1, 1)
        end)
        function btnRemove:DoClick()
            WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
                key = "reasons",
                removeId = k
            })

            pnlReason:Remove()
        end
    end
    local txtReason = vgui.Create("WarningSystem7452em:DTextEntry", pnlTabContent)
    txtReason:SetPos(0, pnlTabContent:GetTall() * 0.83)
    txtReason:SetSize(pnlTabContent:GetWide() * 0.6, pnlTabContent:GetTall() * 0.07)
    txtReason:SetPlaceholderText("Lorem ipsum dolor sit amet")

    local txtPenalty = vgui.Create("WarningSystem7452em:DTextEntry", pnlTabContent)
    txtPenalty:SetPos(pnlTabContent:GetWide() * 0.61, pnlTabContent:GetTall() * 0.83)
    txtPenalty:SetSize(pnlTabContent:GetWide() * 0.15, pnlTabContent:GetTall() * 0.07)
    txtPenalty:SetPlaceholderText("8")
    txtPenalty.txt:SetNumeric(true)

    local txtDuration = vgui.Create("WarningSystem7452em:DTextEntry", pnlTabContent)
    txtDuration:SetPos(pnlTabContent:GetWide() * 0.77, pnlTabContent:GetTall() * 0.83)
    txtDuration:SetSize(pnlTabContent:GetWide() * 0.23, pnlTabContent:GetTall() * 0.07)
    txtDuration:SetPlaceholderText("1y 1mo 1h 1m 1s")

    local btnAdd = vgui.Create("WarningSystem7452em:DButton", pnlTabContent)
    btnAdd:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.07)
    btnAdd:SetPos(0, pnlTabContent:GetTall() - btnAdd:GetTall())
    btnAdd:SetText(WarningSystem7452em:__("settings_tabs.add_this_reason"))
    btnAdd:SetFont("WarningSystem7452em:30M")
    function btnAdd:DoClick()
        if txtReason:GetText() == "" then return end

        local iPenalty = tonumber(txtPenalty:GetText() or "") or 1

        WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
            key = "reasons",
            value = {
                reason = txtReason:GetText(),
                penalty = iPenalty,
                duration = WarningSystem7452em:FormatStringToTime(txtDuration:GetText())
            }
        })

        WarningSystem7452em.Menu:LoadContent("settings", "preset_reasons")
    end
end

// Thresholds
-- Preset Reasons
function CATEGORY:ShowThresholds(pnlTabContent)
    function pnlTabContent:Paint(iW, iH)
        draw.RoundedBox(8, 0, 0, iW, iH * 0.4725, WarningSystem7452em.CFG.theme.Secondary)
        draw.RoundedBox(8, 1, 1, iW - 2, iH * 0.4725 - 2, WarningSystem7452em.CFG.theme.Tertiary)
    end

    local iMargin = pnlTabContent:GetWide() * 0.01

    local pnlReasonsList = vgui.Create("WarningSystem7452em:DScrollPanel", pnlTabContent)
    pnlReasonsList:SetSize(pnlTabContent:GetWide() - iMargin * 2, pnlTabContent:GetTall() * 0.4725 - pnlTabContent:GetWide() * 0.01 * 2)
    pnlReasonsList:SetPos(iMargin, iMargin)

    local iMargin = pnlTabContent:GetTall() * 0.02

    for k,v in pairs(WarningSystem7452em.CFG.thresholds or {}) do
        local pnlReason = vgui.Create("DPanel", pnlReasonsList)
        pnlReason:Dock(TOP)
        pnlReason:SetTall(pnlTabContent:GetTall() * 0.075)
        pnlReason:DockMargin(0, 0, 0, iMargin)
        function pnlReason:Paint(iW, iH)
            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
            draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Primary)
        end

        surface.SetFont("WarningSystem7452em:25M")
        local sText = v.penalty .. " " .. WarningSystem7452em:__("penalty_points"):lower()
        local iWide = math.Clamp(surface.GetTextSize(sText), 0, pnlTabContent:GetWide() * 0.5)

        local lblReason = Label(sText, pnlReason)
        lblReason:SetSize(iWide, pnlReason:GetTall())
        lblReason:SetFont("WarningSystem7452em:25M")
        lblReason:SetPos(pnlReasonsList:GetWide() * 0.01)
        lblReason:SetTextColor(WarningSystem7452em.CFG.theme.Texts)

        local tParams = WarningSystem7452em.Thresholds[v.name].Params

        local sDetails = "Type: " .. v.name:gsub("^%l", string.upper)

        for i, j in ipairs(tParams) do
            -- v.params[i], j.name, j.type

            if j.type == "time" then
                sDetails = sDetails .. " - " .. WarningSystem7452em:FormatTimeToString(v.params[i]) 
            elseif j.name ~= "reason" then
                sDetails = sDetails .. " - " .. v.params[i] 
            end
        end

        local lblReason = Label(sDetails, pnlReason)
        lblReason:SetSize(pnlReasonsList:GetWide() * 0.5, pnlReason:GetTall())
        lblReason:SetFont("WarningSystem7452em:25M")
        lblReason:SetPos(pnlReasonsList:GetWide() * 0.02 + iWide)
        lblReason:SetTextColor(WarningSystem7452em.CFG.theme.Texts2)

        local btnRemove = vgui.Create("WarningSystem7452em:DImageButton", pnlReason)
        btnRemove:SetSize(pnlReason:GetTall() - 2, pnlReason:GetTall() - 2)
        btnRemove:Dock(RIGHT)
        btnRemove:SetImage("materials/warning_system/cross.png")
        local iMargin = pnlReason:GetTall() * 0.3
        btnRemove.img:DockMargin(iMargin, iMargin, iMargin, iMargin)
        timer.Simple(0, function()
            btnRemove:SetVisible(true)
            btnRemove:SetPos(pnlReason:GetWide() - btnRemove:GetWide() - 1, 1)
        end)
        function btnRemove:DoClick()
            WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
                key = "threshold",
                removeId = k
            })

            pnlReason:Remove()
        end
    end

    local tThreshold = {
        name = "",
        penalty = 0,
        params = {}
    }

    local txtThreshold = vgui.Create("WarningSystem7452em:DTextEntry", pnlTabContent)
    txtThreshold:SetSize(pnlTabContent:GetWide() * 0.49, pnlTabContent:GetTall() * 0.07)
    txtThreshold:SetPos(0, pnlTabContent:GetTall() * 0.505)
    txtThreshold:SetPlaceholderText(WarningSystem7452em:__("settings_tabs.penalty_points_to_reach"))
    txtThreshold.txt:SetNumeric(true)
    function txtThreshold:OnChange()
        tThreshold.penalty = tonumber(self:GetText())
    end

    local pnlType = vgui.Create("WarningSystem7452em:DComboBox", pnlTabContent)
    pnlType:SetSize(pnlTabContent:GetWide() * 0.49, pnlTabContent:GetTall() * 0.07)
    pnlType:SetPos(pnlTabContent:GetWide() * 0.51, pnlTabContent:GetTall() * 0.505)
    for k, v in pairs(WarningSystem7452em.Thresholds) do
        if( v.Can and not v:Can() ) then continue end
        pnlType:AddChoice(v.Name, k)
    end

    local pnlScrollParams = vgui.Create("WarningSystem7452em:DScrollPanel", pnlTabContent)
    pnlScrollParams:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.3)
    pnlScrollParams:SetPos(0, pnlTabContent:GetTall() * 0.6025)

    function pnlType:OnSelect(iIndex, sValue, xData)
        tThreshold.name = xData
        tThreshold.params = {}

        pnlScrollParams:Clear()

        for k, v in ipairs(WarningSystem7452em.Thresholds[xData].Params) do
            local txtParam = vgui.Create("WarningSystem7452em:DTextEntry", pnlScrollParams)
            txtParam:Dock(TOP)
            txtParam:SetTall(pnlTabContent:GetTall() * 0.07)
            txtParam:DockMargin(0, 0, 0, pnlTabContent:GetTall() * 0.02)
            txtParam:SetPlaceholderText(v.name:gsub("^%l", string.upper))
            function txtParam:OnChange()
                if( v.type == "time" ) then
                    tThreshold.params[k] = WarningSystem7452em:FormatStringToTime(self:GetText())
                else
                    tThreshold.params[k] = self:GetText()
                end
            end
        end
    end

    local btnAdd = vgui.Create("WarningSystem7452em:DButton", pnlTabContent)
    btnAdd:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.07)
    btnAdd:SetPos(0, pnlTabContent:GetTall() - btnAdd:GetTall())
    btnAdd:SetText(WarningSystem7452em:__("settings_tabs.add_this_threshold"))
    btnAdd:SetFont("WarningSystem7452em:30M")
    function btnAdd:DoClick()
        if tThreshold.name == "" then return end

        WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
            key = "threshold",
            value = tThreshold
        })

        WarningSystem7452em.Menu:LoadContent("settings", "thresholds")
    end
end

// Permissions
local tPermissions = {
    "add_warn",
    "remove_warn",
    "view_others_warnings",
    "edit_settings",
    "view_note",
    "edit_note"
}

function CATEGORY:ShowPermissions(pnlTabContent)
    local tNewPermissions = table.Copy(WarningSystem7452em.CFG.permissions or {})

    local pnlGroups = vgui.Create("WarningSystem7452em:DComboBox", pnlTabContent)
    pnlGroups:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.07)
    for k, v in ipairs(WarningSystem7452em:GetUserGroups()) do
        pnlGroups:AddChoice(v)
    end

    local pnlScroll = vgui.Create("WarningSystem7452em:DScrollPanel", pnlTabContent)
    pnlScroll:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.8)
    pnlScroll:SetPos(0, pnlTabContent:GetTall() * 0.1)
    pnlScroll.Paint = nil

    local pnlList = vgui.Create("DIconLayout", pnlScroll)
    pnlList:SetSize(pnlScroll:GetWide(), pnlScroll:GetTall())
    pnlList:SetSpaceX(pnlList:GetWide() * 0.02)
    pnlList:SetSpaceY(pnlList:GetWide() * 0.02)

    function pnlGroups:OnSelect(iID, sValue, xData)
        pnlList:Clear()

        for k, v in ipairs(tPermissions) do
            local pnlPerm = pnlList:Add("DButton")
            pnlPerm:SetSize(pnlList:GetWide() * 0.49, pnlTabContent:GetTall() * 0.07)
            pnlPerm:SetText("")
            pnlPerm.bEnabled = (tNewPermissions[sValue] or {})[v]
            function pnlPerm:Paint(iW, iH)
                draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
                draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)

                draw.SimpleText(v, "WarningSystem7452em:25M", iW * 0.11, iH * 0.5, WarningSystem7452em.CFG.theme.Texts, 0, 1)

                if self.bEnabled then
                    draw.RoundedBox(8, iH * 0.2, iH * 0.2, iH * 0.6, iH * 0.6, WarningSystem7452em.CFG.theme.Main)
                else
                    draw.RoundedBox(8, iH * 0.2, iH * 0.2, iH * 0.6, iH * 0.6, WarningSystem7452em.CFG.theme.Secondary)
                end
            end
            function pnlPerm:DoClick()
                self.bEnabled = not self.bEnabled

                tNewPermissions[sValue] = tNewPermissions[sValue] or {}
                tNewPermissions[sValue][v] = self.bEnabled
            end
        end
    end

    local btnSave = vgui.Create("WarningSystem7452em:DButton", pnlTabContent)
    btnSave:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.07)
    btnSave:SetPos(0, pnlTabContent:GetTall() - btnSave:GetTall())
    btnSave:SetText(WarningSystem7452em:__("settings_tabs.save_those_permissions"))
    btnSave:SetFont("WarningSystem7452em:30M")
    function btnSave:DoClick()
        WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
            key = "permissions",
            value = tNewPermissions
        })

        WarningSystem7452em.Menu:LoadContent("settings", "permissions")
    end
end

// Theme
function CATEGORY:ShowTheme(pnlTabContent)
    local tNewTheme = table.Copy(WarningSystem7452em.CFG.theme)

    local pnlScroll = vgui.Create("WarningSystem7452em:DScrollPanel", pnlTabContent)
    pnlScroll:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.9)
    pnlScroll.Paint = nil

    local iX, iY = 0, 0

    for k, v in pairs(tNewTheme) do
        v = Color(v.r or 255, v.g or 255, v.b or 255, v.a or 255)
        
        local pnlColor = vgui.Create("DPanel", pnlScroll)
        pnlColor:SetSize(pnlScroll:GetWide() * 0.49, pnlTabContent:GetTall() * 0.1)
        pnlColor:SetPos(iX, iY)
        function pnlColor:Paint(iW, iH)
            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
            draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)

            draw.SimpleText(k, "WarningSystem7452em:25M", iW * 0.05, iH * 0.5, WarningSystem7452em.CFG.theme.Texts, 0, 1)
        end

        local pnlCube = vgui.Create("DButton", pnlColor)
        pnlCube:SetSize(pnlColor:GetTall() * 0.6, pnlColor:GetTall() * 0.6)
        pnlCube:SetPos(pnlColor:GetWide() - pnlColor:GetTall() * 1, pnlColor:GetTall() * 0.2)
        pnlCube:SetText("")
        pnlCube.cColor = v
        function pnlCube:Paint(iW, iH)
            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Primary)
            draw.RoundedBox(8, 2, 2, iW - 4, iH - 4, self.cColor)
        end
        function pnlCube:DoClick()
            local iX, iY = pnlCube:LocalToScreen(0, self:GetTall() + 5)

            local pnlOver = vgui.Create("EditablePanel")
            pnlOver:SetSize(ScrW(), ScrH())
            pnlOver:MakePopup()
            function pnlOver:OnMousePressed()
                self:Remove()
            end

            local pnlBack = vgui.Create("DPanel", pnlOver)
            pnlBack:SetPos(iX, iY)
            pnlBack:SetSize(ScrH() * 0.3, ScrH() * 0.3)
            function pnlBack:Paint(iW, iH)
            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
            draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)
            end

            local pnlColorCube = vgui.Create("DColorMixer", pnlBack)
            pnlColorCube:SetSize(pnlBack:GetWide() * 0.9, pnlBack:GetTall() * 0.9)
            pnlColorCube:SetPos(pnlBack:GetWide() * 0.05, pnlBack:GetTall() * 0.05)
            pnlColorCube:SetAlphaBar(true)
            pnlColorCube:SetPalette(true)
            pnlColorCube:SetWangs(true)
            pnlColorCube:SetColor(v)
            function pnlColorCube:ValueChanged(cColor)
                pnlCube.cColor = cColor
                tNewTheme[k] = cColor
            end
        end

        if iX == 0 then
            iX = pnlScroll:GetWide() * 0.51
        else
            iX = 0
            iY = iY + pnlTabContent:GetTall() * 0.13
        end
    end

    local btnSave = vgui.Create("WarningSystem7452em:DButton", pnlTabContent)
    btnSave:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.07)
    btnSave:SetPos(0, pnlTabContent:GetTall() - btnSave:GetTall())
    btnSave:SetText(WarningSystem7452em:__("settings_tabs.save_this_theme"))
    btnSave:SetFont("WarningSystem7452em:30M")
    function btnSave:DoClick()
        WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
            key = "theme",
            value = tNewTheme
        })

        WarningSystem7452em.Menu:LoadContent("settings", "theme")
    end
end

function CATEGORY:ShowOther(pnlTabContent)
    local pnlScroll = vgui.Create("DPanel", pnlTabContent)
    pnlScroll:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.9)
    pnlScroll.Paint = nil

    local tKeys = {}

    for k, v in pairs(WarningSystem7452em.CFG) do
        if tOtherBlacklist[k] then
            continue
        end

        tKeys[k] = v

        local lblCfg = Label(k, pnlScroll)
        lblCfg:Dock(TOP)
        lblCfg:SetFont("WarningSystem7452em:25M")
        lblCfg:SetTextColor(WarningSystem7452em.CFG.theme.Texts)
    
        local txtCfg = vgui.Create("WarningSystem7452em:DTextEntry", pnlScroll)
        txtCfg:Dock(TOP)
        txtCfg:SetTall(pnlTabContent:GetTall() * 0.08)
        txtCfg:SetText(v)
        txtCfg:DockMargin(0, txtCfg:GetTall() * 0.1, 0, txtCfg:GetTall() * 0.3)
        function txtCfg:OnChange()
            tKeys[k] = self:GetText()
        end
    end

    local btnSave = vgui.Create("WarningSystem7452em:DButton", pnlTabContent)
    btnSave:SetSize(pnlTabContent:GetWide(), pnlTabContent:GetTall() * 0.07)
    btnSave:SetPos(0, pnlTabContent:GetTall() - btnSave:GetTall())
    btnSave:SetText(WarningSystem7452em:__("settings_tabs.save_this_config"))
    btnSave:SetFont("WarningSystem7452em:30M")
    function btnSave:DoClick()
        WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateSettings", {
            keys = tKeys,
        })

        WarningSystem7452em.Menu:LoadContent("settings", "other")
    end
end

function CATEGORY:onOpen(pnlContent, ...)
    local pnlTabContent

    local tTabs = {
        ["preset_reasons"] = {
            title = WarningSystem7452em:__("settings_tabs.preset_reasons"),
            callback = function(pnlTabContent)
                CATEGORY:ShowPresetReasons(pnlTabContent)
            end,
            order = 1
        },
        ["thresholds"] = {
            title = WarningSystem7452em:__("settings_tabs.thresholds"),
            callback = function(pnlTabContent)
                CATEGORY:ShowThresholds(pnlTabContent)
            end,
            order = 2
        },
        ["permissions"] = {
            title = WarningSystem7452em:__("settings_tabs.permissions"),
            callback = function(pnlTabContent)
                CATEGORY:ShowPermissions(pnlTabContent)
            end,
            order = 3
        },
        ["theme"] = {
            title = WarningSystem7452em:__("settings_tabs.theme"),
            callback = function(pnlTabContent)
                CATEGORY:ShowTheme(pnlTabContent)
            end,
            order = 4
        },
        ["other"] = {
            title = WarningSystem7452em:__("settings_tabs.other"),
            callback = function(pnlTabContent)
                CATEGORY:ShowOther(pnlTabContent)
            end,
            order = 5
        },
    }

    local xArgs = {...}

    function pnlContent:Paint(iW, iH)
    end

    local pnlTabs = vgui.Create("DPanel", pnlContent)
    pnlTabs:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.08)
    pnlTabs.Paint = nil

    local function updateButtons(pnl)
        for k, v in ipairs(pnlTabs:GetChildren()) do
            v:SetBackgroundColor(v == pnl and WarningSystem7452em.CFG.theme.Main or WarningSystem7452em.CFG.theme.Tertiary)
            v:SetBorder(WarningSystem7452em.CFG.theme.Secondary, v == pnl and 0 or 1)
        end
    end

    pnlTabContent = vgui.Create("DPanel", pnlContent)
    pnlTabContent:SetPos(0, pnlContent:GetTall() * 0.1)
    pnlTabContent:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.9)
    pnlTabContent.Paint = nil

    local iOffsetX = 0
    for k, v in SortedPairsByMemberValue(tTabs, "order") do   
        surface.SetFont("WarningSystem7452em:30M")
        local iWide = surface.GetTextSize(v.title)

        local btnTab = vgui.Create("WarningSystem7452em:DButton", pnlTabs)
        btnTab:SetSize(iWide + pnlTabs:GetTall() * 0.5, pnlTabs:GetTall())
        btnTab:SetBackgroundColor(WarningSystem7452em.CFG.theme.Tertiary)
        btnTab:SetPos(iOffsetX, 0)
        btnTab:SetText(v.title)
        btnTab:SetFont("WarningSystem7452em:30M")
        btnTab:SetBorder(WarningSystem7452em.CFG.theme.Secondary, 1)
        function btnTab:DoClick()
            pnlTabContent:Clear()
            pnlTabContent.Paint = nil
            updateButtons(self)
            v.callback(pnlTabContent)
        
            WarningSystem7452em.tLastLoaded[2] = k
        end

        if xArgs[1] ~= nil and xArgs[1] == k then
            btnTab:DoClick()
        end

        iOffsetX = iOffsetX + btnTab:GetWide() + pnlTabs:GetTall() * 0.2
    end

    if not xArgs[1] then
        pnlTabs:GetChild(0):DoClick()
    end
end

WarningSystem7452em:AddCategory("settings", CATEGORY)

--PATH addons/warning_system/lua/warning_system_7452/client/categories/statistics.lua:
local xTotal = Material("materials/warning_system/warning.png", "noclamp smooth")
local xPenalty = Material("materials/warning_system/error.png", "noclamp smooth")
local xMonthly = Material("materials/warning_system/calendar.png", "noclamp smooth")

local CATEGORY = {}

CATEGORY.Order = 5
CATEGORY.title = WarningSystem7452em:__("tabs.statistics")
CATEGORY.icon = Material("materials/warning_system/chart.png", "noclamp smooth")

function CATEGORY:isAllowed(pPlayer)
    self.title = WarningSystem7452em:__("tabs.statistics")

    return WarningSystem7452em:Can(pPlayer, "view_stats")
end

function CATEGORY:onLoad()
    WarningSystem7452em:NetStart("WarningSystem7452em:Player:GetInfo", {
        type = "stats",
        target = "null"
    })
end

function CATEGORY:onOpen(pnlContent, ...)
    local tShowLeaderboards = WarningSystem7452em.Stats and WarningSystem7452em.Stats.apiKey or false

    function pnlContent:Paint(iW, iH)
        WarningSystem7452em:DrawCard(WarningSystem7452em:__("total_warnings"), WarningSystem7452em.Stats.total_warnings, xTotal, 0, 0, iW * 0.32, iH * 0.15)
        WarningSystem7452em:DrawCard(WarningSystem7452em:__("total_penalty_points"), WarningSystem7452em.Stats.total_penalty_points, xPenalty, iW * 0.34, 0, iW * 0.32, iH * 0.15)
        WarningSystem7452em:DrawCard(WarningSystem7452em:__("monthly_warnings"), WarningSystem7452em.Stats.monthly_warnings, xMonthly, iW * 0.68, 0, iW * 0.32, iH * 0.15)

        if not tShowLeaderboards then
            draw.SimpleText(WarningSystem7452em:__("set_api_key"), "WarningSystem7452em:30M", iW * 0.5, iH * 0.8, WarningSystem7452em.CFG.theme.Texts, 1, 1)
        end
    end

    local iValues = WarningSystem7452em.Stats and WarningSystem7452em.Stats.graph or {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    local iMax = math.max(unpack(iValues))
    local iMaxValue = math.ceil(iMax / 10) * 10
    
    local iMonths = WarningSystem7452em:__("months")

    local iSize = pnlContent:GetWide() * 0.85 / 12

    local pnlChart = vgui.Create("DPanel", pnlContent)
    pnlChart:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.4)    
    pnlChart:SetPos(0, pnlContent:GetTall() * 0.17)
    function pnlChart:Paint(iW, iH)
        draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
        draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)

        draw.SimpleText(WarningSystem7452em:__("monthly_warnings"), "WarningSystem7452em:25M", iW * 0.02, iH * 0.03, WarningSystem7452em.CFG.theme.Texts2)
    
        draw.SimpleText(iMaxValue, "WarningSystem7452em:25M", iW * 0.05, iH * 0.225, WarningSystem7452em.CFG.theme.Texts, 1, 1)
        draw.SimpleText(0, "WarningSystem7452em:25M", iW * 0.05, iH * 0.85, WarningSystem7452em.CFG.theme.Texts, 1, 1)

        for i = 1, 12 do
            draw.SimpleText(iMonths[i], "WarningSystem7452em:25M", iW * 0.1 + iSize * (i - 1) + iSize * 0.5, iH * 0.875, WarningSystem7452em.CFG.theme.Texts, 1)
        end

        surface.SetDrawColor(WarningSystem7452em.CFG.theme.Texts)
        surface.DrawLine(iW * 0.1, iH * 0.225, iW * 0.1, iH * 0.85)
        surface.DrawLine(iW * 0.1, iH * 0.85, iW * 0.95, iH * 0.85)
    end

    local iW, iH = pnlChart:GetSize()

    for i = 1, 12 do
        local iBarH = (iValues[i] * iH * 0.625) / iMaxValue

        local pnlMonth = vgui.Create("DPanel", pnlChart)
        pnlMonth:SetPos(iW * 0.1 + iSize * (i - 1) + iSize * 0.25, iH * 0.85 - iBarH)
        pnlMonth:SetSize(iSize * 0.5, iBarH)
        pnlMonth.sText = iValues[i]
        surface.SetFont("WarningSystem7452em:25M")
        pnlMonth.iTextW = surface.GetTextSize(pnlMonth.sText)
        function pnlMonth:Paint(iW, iH)
            draw.RoundedBoxEx(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Main, true, true)

            if self:IsHovered() then
                DisableClipping(true)
                    draw.RoundedBox(8, -self.iTextW * 0.5, -iW * 1.5, iW + self.iTextW, iW * 1.3, WarningSystem7452em.CFG.theme.Primary)

                    draw.SimpleText(self.sText, "WarningSystem7452em:25M", iW * 0.5, -iW * 0.75, WarningSystem7452em.CFG.theme.Texts, 1, 1)
                DisableClipping(false)
            end
        end
        function pnlMonth:OnCursorEntered()
            self:MoveToFront()
        end         
    end

    if not tShowLeaderboards then return end

    local pnlLastWarnings = vgui.Create("WarningSystem7452em:Leaderboard", pnlContent)
    pnlLastWarnings:SetSize(pnlContent:GetWide() * 0.32, pnlContent:GetTall() * 0.41)
    pnlLastWarnings:SetPos(0, pnlContent:GetTall() * 0.59)
    pnlLastWarnings:Setup(WarningSystem7452em:__("last_warnings"), WarningSystem7452em.CFG.theme.Red)
    for k,v in pairs(WarningSystem7452em.Stats.last_warnings or {}) do
        local sAvatar = WarningSystem7452em.Stats.users and WarningSystem7452em.Stats.users[v.steamid .. "_"] and WarningSystem7452em.Stats.users[v.steamid .. "_"].avatar or ""
        local sName = WarningSystem7452em.Stats.users and WarningSystem7452em.Stats.users[v.steamid .. "_"] and WarningSystem7452em.Stats.users[v.steamid .. "_"].name or v.steamid

        pnlLastWarnings:AddRow(
            sAvatar,
            sName,
            v.penalty
        )
    end
    
    local pnlMostWarned = vgui.Create("WarningSystem7452em:Leaderboard", pnlContent)
    pnlMostWarned:SetSize(pnlContent:GetWide() * 0.32, pnlContent:GetTall() * 0.41)
    pnlMostWarned:SetPos(pnlContent:GetWide() * 0.34, pnlContent:GetTall() * 0.59)
    pnlMostWarned:Setup(WarningSystem7452em:__("most_warned"), WarningSystem7452em.CFG.theme.Orange)
    for k,v in pairs(WarningSystem7452em.Stats.most_warned or {}) do
        local sAvatar = WarningSystem7452em.Stats.users and WarningSystem7452em.Stats.users[v.steamid .. "_"] and WarningSystem7452em.Stats.users[v.steamid .. "_"].avatar or ""
        local sName = WarningSystem7452em.Stats.users and WarningSystem7452em.Stats.users[v.steamid .. "_"] and WarningSystem7452em.Stats.users[v.steamid .. "_"].name or v.steamid

        pnlMostWarned:AddRow(
            sAvatar,
            sName,
            v.amount
        )
    end
    
    local pnlStaffLeaderboard = vgui.Create("WarningSystem7452em:Leaderboard", pnlContent)
    pnlStaffLeaderboard:SetSize(pnlContent:GetWide() * 0.32, pnlContent:GetTall() * 0.41)
    pnlStaffLeaderboard:SetPos(pnlContent:GetWide() * 0.68, pnlContent:GetTall() * 0.59)
    pnlStaffLeaderboard:Setup(WarningSystem7452em:__("staff_leaderboard"), WarningSystem7452em.CFG.theme.Green)
    for k,v in pairs(WarningSystem7452em.Stats.staff_leaderboards or {}) do
        local sAvatar = WarningSystem7452em.Stats.users and WarningSystem7452em.Stats.users[v.steamid .. "_"] and WarningSystem7452em.Stats.users[v.steamid .. "_"].avatar or ""
        local sName = WarningSystem7452em.Stats.users and WarningSystem7452em.Stats.users[v.steamid .. "_"] and WarningSystem7452em.Stats.users[v.steamid .. "_"].name or v.steamid

        pnlStaffLeaderboard:AddRow(
            sAvatar,
            sName,
            v.amount
        )
    end
end

WarningSystem7452em:AddCategory("statistics", CATEGORY)

--PATH lua/wos/anim_extension/extensions/wos_base.lua:
--[[-------------------------------------------------------------------
	wiltOS Animation Extension Register:
		Prints some feedback saying the Animation Extension successfully loaded.
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

wOS.AnimExtension.Mounted[ "Base" ] = true
MsgC( Color( 255, 255, 255 ), "[wOS] Successfully mounted wiltOS Animation Base\n" )
--PATH lua/wos/anim_extension/holdtypes/melee_combo.lua:
local DATA = {}

DATA.Name = "Melee Combination"
DATA.HoldType = "melee-combo"
DATA.BaseHoldType = "melee2"
DATA.Translations = {}

--DATA.Translations[ ACT_MP_STAND_IDLE ]					= 2680
--DATA.Translations[ ACT_MP_WALK ]						= 2683
--DATA.Translations[ ACT_MP_RUN ]							= 2685
DATA.Translations[ ACT_MP_CROUCH_IDLE ]					= ACT_HL2MP_IDLE_CROUCH_KNIFE 
DATA.Translations[ ACT_MP_CROUCHWALK ]					= ACT_HL2MP_WALK_CROUCH_KNIFE
--DATA.Translations[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= 2688
DATA.Translations[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE 
--DATA.Translations[ ACT_MP_RELOAD_STAND ]				= IdleActivity + 6
--DATA.Translations[ ACT_MP_RELOAD_CROUCH ]				= IdleActivity + 6
--DATA.Translations[ ACT_MP_JUMP ]						= 3160
--DATA.Translations[ ACT_MP_SWIM ]						= IdleActivity + 9
--DATA.Translations[ ACT_LAND ]							= ACT_LAND

wOS.AnimExtension:RegisterHoldtype( DATA )
--PATH lua/bricks_server/core/client/cl_bmasks.lua:
if( not BRICKS_SERVER.BMASKS ) then
    BRICKS_SERVER.BMASKS = {} --Global table, access the functions here

    BRICKS_SERVER.BMASKS.Materials = {} --Cache materials so they dont need to be reloaded
    BRICKS_SERVER.BMASKS.Masks = {} --A table of all active mask objects, you should destroy a mask object when done with it

    --The material used to draw the render targets
    BRICKS_SERVER.BMASKS.MaskMaterial = CreateMaterial("!bluemask","UnlitGeneric",{
        ["$translucent"] = 1,
        ["$vertexalpha"] = 1,
        ["$alpha"] = 1,
    })

    --Creates a mask with the specified options
    --Be sure to pass a unique maskName for each mask, otherwise they will override each other
    BRICKS_SERVER.BMASKS.CreateMask = function(maskName, maskPath, maskProperties)
        local mask = {}

        --Set mask name
        mask.name = maskName

        --Load materials
        if BRICKS_SERVER.BMASKS.Materials[maskPath] == nil then
            BRICKS_SERVER.BMASKS.Materials[maskPath] = Material(maskPath, maskProperties)
        end

        --Set the mask material
        mask.material = BRICKS_SERVER.BMASKS.Materials[maskPath]

        --Create the render target
        mask.renderTarget = GetRenderTargetEx("BRICKS_SERVER.BMASKS:"..maskName, ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888)

        BRICKS_SERVER.BMASKS.Masks[maskName] = mask

        return maskName
    end

    --Call this to begin drawing with a mask.
    --After calling this any draw call will be masked until you call EndMask(maskName)
    BRICKS_SERVER.BMASKS.BeginMask = function(maskName)
        --FindMask
        if BRICKS_SERVER.BMASKS.Masks[maskName] == nil then 
            print("Cannot begin a mask without creating it first!") 
            return false
        end

        --Store current render target
        BRICKS_SERVER.BMASKS.Masks[maskName].previousRenderTarget = render.GetRenderTarget() 
        
        --Confirgure drawing so that we write to the masks render target
        render.PushRenderTarget(BRICKS_SERVER.BMASKS.Masks[maskName].renderTarget)
        render.OverrideAlphaWriteEnable( true, true )
        render.Clear( 0, 0, 0, 0 ) 
    end

    --Ends the mask and draws it
    --Not calling this after calling BeginMask will cause some really bad effects 
    --This done return the render target used, using this you can create other effects such as drop shadows without problems
    --Passes true for dontDraw will result in it not being render and only returning the texture of the result (which is ScrW()xScrH())
    BRICKS_SERVER.BMASKS.EndMask = function(maskName, x, y, sizex, sizey, opacity, rotation, dontDraw)

        dontDraw = dontDraw or false
        rotation = rotation or 0
        opacity = opacity or 255

        --Draw the mask
        render.OverrideBlendFunc( true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO )
        surface.SetDrawColor(255,255,255,opacity)
        surface.SetMaterial(BRICKS_SERVER.BMASKS.Masks[maskName].material)
        if rotation == nil or rotation == 0 then
            surface.DrawTexturedRect(x, y, sizex, sizey) 
        else
            surface.DrawTexturedRectRotated(x, y, sizex, sizey, rotation) 
        end
        render.OverrideBlendFunc(false)
        render.OverrideAlphaWriteEnable( false )
        render.PopRenderTarget() 

        --Update material
        BRICKS_SERVER.BMASKS.MaskMaterial:SetTexture('$basetexture', BRICKS_SERVER.BMASKS.Masks[maskName].renderTarget)

        --Clear material for upcoming draw calls
        draw.NoTexture()

        --Only draw if they want is to
        if not dontDraw then
            --Now draw finished result
            surface.SetDrawColor(255,255,255,255) 
            surface.SetMaterial(BRICKS_SERVER.BMASKS.MaskMaterial) 
            render.SetMaterial(BRICKS_SERVER.BMASKS.MaskMaterial)
            render.DrawScreenQuad() 
        end

        return BRICKS_SERVER.BMASKS.Masks[maskName].renderTarget
    end
end
--PATH lua/bricks_server/core/client/cl_popups.lua:
function BRICKS_SERVER.Func.Message( text, title, button, buttonFunc )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2, w, h ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )

		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( text )

	local backPanel = vgui.Create( "bricks_server_dframepanel", frameBack )
	backPanel:SetHeader( title )
	backPanel:SetWide( math.max( ScrW()*0.15, textX+30 ) )
	backPanel.onCloseFunc = function()
		frameBack:Remove()
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( text, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local bottomButton = vgui.Create( "DButton", backPanel )
	bottomButton:SetText( "" )
	bottomButton:Dock( BOTTOM )
	bottomButton:DockMargin( 10, 10, 10, 10 )
	bottomButton:SetTall( 40 )
	local changeAlpha = 0
	bottomButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( button, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	bottomButton.DoClick = function()
		if( buttonFunc ) then
			buttonFunc()
		end
		
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetTall( bottomButton:GetTall()+(4*10)+textArea:GetTall()+backPanel.headerHeight )
	backPanel:Center()
end

function BRICKS_SERVER.Func.Query( text, title, confirmText, cancelText, confirmFunc, cancelFunc )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2, w, h ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )

		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( text )

	local backPanel = vgui.Create( "bricks_server_dframepanel", frameBack )
	backPanel:SetHeader( title )
	backPanel:SetWide( math.max( ScrW()*0.15, textX+30 ) )
	backPanel.onCloseFunc = function()
		frameBack:Remove()
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( text, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local buttonBack = vgui.Create( "DPanel", backPanel )
	buttonBack:Dock( BOTTOM )
	buttonBack:DockMargin( 10, 10, 10, 10 )
	buttonBack:SetTall( 40 )
	buttonBack.Paint = function() end

	local confirmButton = vgui.Create( "DButton", buttonBack )
	confirmButton:SetText( "" )
	confirmButton:Dock( LEFT )
	confirmButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	confirmButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( confirmText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	confirmButton.DoClick = function()
		if( confirmFunc ) then
			confirmFunc()
		end
		
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	local cancelButton = vgui.Create( "DButton", buttonBack )
	cancelButton:SetText( "" )
	cancelButton:Dock( RIGHT )
	cancelButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	cancelButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( cancelText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	cancelButton.DoClick = function()
		if( cancelFunc ) then
			cancelFunc()
		end

		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetTall( buttonBack:GetTall()+(4*10)+textArea:GetTall()+backPanel.headerHeight )
	backPanel:Center()
end

function BRICKS_SERVER.Func.StringRequest( title, subtitle, default, func_confirm, func_cancel, confirmText, cancelText, numberOnly )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2, w, h ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )

		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( subtitle )

	local backPanel = vgui.Create( "bricks_server_dframepanel", frameBack )
	backPanel:SetHeader( title )
	backPanel:SetWide( math.max( ScrW()*0.15, textX+30 ) )
	backPanel.onCloseFunc = function()
		frameBack:Remove()
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local textEntryBack = vgui.Create( "DPanel", backPanel )
	textEntryBack:Dock( TOP )
	textEntryBack:DockMargin( 10, 10, 10, 0 )
	textEntryBack:SetTall( 40 )
    local Alpha = 0
    local textEntry
    local color1 = BRICKS_SERVER.Func.GetTheme( 1 )
    textEntryBack.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

        if( textEntry:IsEditing() ) then
            Alpha = math.Clamp( Alpha+5, 0, 100 )
        else
            Alpha = math.Clamp( Alpha-5, 0, 100 )
        end
        
        draw.RoundedBox( 5, 0, 0, w, h, Color( color1.r, color1.g, color1.b, Alpha ) )
    end

	if( numberOnly ) then
		textEntry = vgui.Create( "bricks_server_numberwang", textEntryBack )
		textEntry:Dock( FILL )
		textEntry:SetMinMax( 0, 9999999999999 )
	else
		textEntry = vgui.Create( "bricks_server_textentry", textEntryBack )
		textEntry:Dock( FILL )
	end
	textEntry:SetValue( default or "" )

	local buttonPanel = vgui.Create( "DPanel", backPanel )
	buttonPanel:Dock( BOTTOM )
	buttonPanel:DockMargin( 10, 10, 10, 10 )
	buttonPanel:SetTall( 40 )
	buttonPanel.Paint = function( self2, w, h ) end

	local leftButton = vgui.Create( "DButton", buttonPanel )
	leftButton:Dock( LEFT )
	leftButton:SetText( "" )
	leftButton:DockMargin( 0, 0, 0, 0 )
	leftButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( confirmText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		func_confirm( textEntry:GetValue() )
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	local rightButton = vgui.Create( "DButton", buttonPanel )
	rightButton:Dock( RIGHT )
	rightButton:SetText( "" )
	rightButton:DockMargin( 0, 0, 0, 0 )
	rightButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( cancelText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		func_cancel( textEntry:GetValue() )
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetTall( buttonPanel:GetTall()+(4*10)+textArea:GetTall()+textEntryBack:GetTall()+backPanel.headerHeight )
	backPanel:Center()
end

function BRICKS_SERVER.Func.ComboRequest( title, subtitle, default, options, func_confirm, func_cancel, confirmText, cancelText, searchSelect )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2, w, h ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )

		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( subtitle )

	local backPanel = vgui.Create( "bricks_server_dframepanel", frameBack )
	backPanel:SetHeader( title )
	backPanel:SetWide( math.max( ScrW()*0.15, textX+30 ) )
	backPanel.onCloseFunc = function()
		frameBack:Remove()
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local comboEntry
	if( not searchSelect ) then
		comboEntry = vgui.Create( "bricks_server_combo", backPanel )
	else
		comboEntry = vgui.Create( "bricks_server_combo_search", backPanel )
	end

	if( not IsValid( comboEntry ) ) then return end

	comboEntry:Dock( TOP )
	comboEntry:DockMargin( 10, 10, 10, 0 )
	comboEntry:SetTall( 40 )
	comboEntry:SetValue( BRICKS_SERVER.Func.L( "selectOption" ) )
	for k, v in pairs( options ) do
		if( default != k and default != v ) then
			comboEntry:AddChoice( v, k, false )
		else
			comboEntry:AddChoice( v, k, true )
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
	leftButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( confirmText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		local value, data = comboEntry:GetSelected()
		if( value and data ) then
			func_confirm( value, data )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		else
			notification.AddLegacy( BRICKS_SERVER.Func.L( "selectValue" ), 1, 3 )
		end
	end

	local rightButton = vgui.Create( "DButton", buttonPanel )
	rightButton:Dock( RIGHT )
	rightButton:SetText( "" )
	rightButton:DockMargin( 0, 0, 0, 0 )
	rightButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( cancelText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		local value, data = comboEntry:GetSelected()
		if( value and data ) then
			func_cancel( value, data )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		else
			func_cancel( false, false )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		end
	end

	backPanel:SetTall( buttonPanel:GetTall()+(4*10)+textArea:GetTall()+comboEntry:GetTall()+backPanel.headerHeight )
	backPanel:Center()
end

function BRICKS_SERVER.Func.ColorRequest( title, subtitle, default, func_confirm, func_cancel, confirmText, cancelText )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2, w, h ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )

		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( subtitle )

	local backPanel = vgui.Create( "bricks_server_dframepanel", frameBack )
	backPanel:SetHeader( title )
	backPanel:SetWide( math.max( ScrW()*0.17, textX+30 ) )
	backPanel.onCloseFunc = function()
		frameBack:Remove()
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local colorEntry = vgui.Create( "DColorMixer", backPanel )
	colorEntry:Dock( TOP )
	colorEntry:DockMargin( 10, 10, 10, 0 )
	colorEntry:SetTall( 150 )
	colorEntry:SetPalette( false )
	colorEntry:SetAlphaBar( false) 
	colorEntry:SetWangs( true )
	colorEntry:SetColor( default or Color( 255, 255, 255 ) )
	local displayColor = colorEntry:GetColor()
	colorEntry.ValueChanged = function()
		displayColor = colorEntry:GetColor()
	end

	local displayColorPanel = vgui.Create( "DPanel", backPanel )
	displayColorPanel:Dock( TOP )
	displayColorPanel:DockMargin( 10, 10, 10, 10 )
	displayColorPanel:SetTall( 20 )
	displayColorPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, displayColor )
	end

	local buttonPanel = vgui.Create( "DPanel", backPanel )
	buttonPanel:Dock( BOTTOM )
	buttonPanel:DockMargin( 10, 0, 10, 10 )
	buttonPanel:SetTall( 40 )
	buttonPanel.Paint = function( self2, w, h ) end

	local leftButton = vgui.Create( "DButton", buttonPanel )
	leftButton:Dock( LEFT )
	leftButton:SetText( "" )
	leftButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( confirmText )
	textX = textX+20
	leftButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( confirmText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		local value = colorEntry:GetColor()
		if( value ) then
			func_confirm( value )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		else
			notification.AddLegacy( BRICKS_SERVER.Func.L( "selectColor" ), 1, 3 )
		end
	end

	local rightButton = vgui.Create( "DButton", buttonPanel )
	rightButton:Dock( RIGHT )
	rightButton:SetText( "" )
	rightButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( cancelText )
	textX = textX+20
	rightButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( cancelText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		local value = colorEntry:GetColor()
		if( value ) then
			func_cancel( value )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		else
			func_cancel( false )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		end
	end

	backPanel:SetTall( buttonPanel:GetTall()+(4*10)+textArea:GetTall()+colorEntry:GetTall()+displayColorPanel:GetTall()+10+backPanel.headerHeight )
	backPanel:Center()
end

function BRICKS_SERVER.Func.PassiveQuery( text, title, time, confirmFunc, cancelFunc )
	local backPanel = vgui.Create( "bricks_server_dframepanel" )
	backPanel:DisableClose()
	backPanel:SetHeader( title )
	backPanel:SetWide( ScrW()*0.1 )

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( text, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local buttonBack = vgui.Create( "DPanel", backPanel )
	buttonBack:Dock( BOTTOM )
	buttonBack:DockMargin( 10, 10, 10, 10 )
	buttonBack:SetTall( 40 )
	buttonBack.Paint = function() end

	local confirmButton = vgui.Create( "DButton", buttonBack )
	confirmButton:SetText( "" )
	confirmButton:Dock( LEFT )
	confirmButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	local tickMat = Material( "materials/bricks_server/tick_nofill.png" )
	confirmButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
		surface.SetMaterial( tickMat )
		local size = 24
		surface.DrawTexturedRect( (w/2)-(size/2), (h/2)-(size/2), size, size )
	end
	confirmButton.DoClick = function()
		if( confirmFunc ) then
			confirmFunc()
		end
		
		backPanel:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( backPanel ) ) then
				backPanel:Remove()
			end
		end )
	end

	local cancelButton = vgui.Create( "DButton", buttonBack )
	cancelButton:SetText( "" )
	cancelButton:Dock( RIGHT )
	cancelButton:SetWide( (backPanel:GetWide()-30)/2 )
	local changeAlpha = 0
	local denyMat = Material( "materials/bricks_server/close.png" )
	cancelButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
		surface.SetMaterial( denyMat )
		local size = 24
		surface.DrawTexturedRect( (w/2)-(size/2), (h/2)-(size/2), size, size )
	end
	cancelButton.DoClick = function()
		if( cancelFunc ) then
			cancelFunc()
		end

		backPanel:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( backPanel ) ) then
				backPanel:Remove()
			end
		end )
	end

	backPanel:SetTall( buttonBack:GetTall()+(4*10)+textArea:GetTall()+backPanel.headerHeight )
	backPanel:SetPos( 20, 20 )

	timer.Simple( (time or 5), function()
		if( IsValid( backPanel ) ) then
			if( cancelFunc ) then
				cancelFunc()
			end
			
			backPanel:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( backPanel ) ) then
					backPanel:Remove()
				end
			end )
		end
	end )
end

function BRICKS_SERVER.Func.CreatePopoutQuery( text, parent, panelWide, panelTall, confirmText, cancelText, confirmFunc, cancelFunc, disableBackgroundButton )
	if( IsValid( parent.brs_popout ) ) then
		parent.brs_popout:Remove()
	end

	local popoutClose = vgui.Create( "DButton", parent )
	popoutClose:SetSize( panelWide, panelTall )
	popoutClose:SetAlpha( 0 )
	popoutClose:AlphaTo( 255, 0.2 )
	popoutClose:SetText( "" )
	popoutClose:SetCursor( "arrow" )
	popoutClose.Paint = function( self2, w, h )
		surface.SetDrawColor( 0, 0, 0, 150 )
		surface.DrawRect( 0, 0, w, h )
		BRICKS_SERVER.Func.DrawBlur( self2, 2, 2 )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( text )

	local popoutWide, popoutTall = math.max( ScrW()*0.15, textX+40 ), 40+(4*10)+30+20

	parent.brs_popout = vgui.Create( "DPanel", parent )
	parent.brs_popout:SetSize( 0, 0 )
	parent.brs_popout:SizeTo( popoutWide, popoutTall, 0.2 )
	parent.brs_popout.Paint = function( self2, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		draw.SimpleText( text, "BRICKS_SERVER_Font20", w/2, h/3, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	parent.brs_popout.OnSizeChanged = function( self2 )
		self2:SetPos( (panelWide/2)-(self2:GetWide()/2), (panelTall/2)-(self2:GetTall()/2) )
	end
	parent.brs_popout.ClosePopout = function()
		if( IsValid( parent.brs_popout ) ) then
			parent.brs_popout:SizeTo( 0, 0, 0.2, 0, -1, function()
				if( IsValid( parent.brs_popout ) ) then
					parent.brs_popout:Remove()
				end
			end )
		end

		popoutClose:AlphaTo( 0, 0.2, 0, function()
			if( IsValid( popoutClose ) ) then
				popoutClose:Remove()
			end
		end )
	end

	popoutClose.DoClick = function()
		if( disableBackgroundButton ) then return end
		
		if( cancelFunc ) then
			cancelFunc()
		end

		parent.brs_popout.ClosePopout()
	end

	local buttonBack = vgui.Create( "DPanel", parent.brs_popout )
	buttonBack:Dock( BOTTOM )
	buttonBack:DockMargin( 10, 10, 10, 10 )
	buttonBack:SetTall( 40 )
	buttonBack.Paint = function() end

	local confirmButton = vgui.Create( "DButton", buttonBack )
	confirmButton:SetText( "" )
	confirmButton:Dock( LEFT )
	confirmButton:SetWide( (popoutWide-30)/2 )
	local changeAlpha = 0
	confirmButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( confirmText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	confirmButton.DoClick = function()
		if( confirmFunc ) then
			confirmFunc()
		end
		
		parent.brs_popout.ClosePopout()
	end

	local cancelButton = vgui.Create( "DButton", buttonBack )
	cancelButton:SetText( "" )
	cancelButton:Dock( RIGHT )
	cancelButton:SetWide( (popoutWide-30)/2 )
	local changeAlpha = 0
	cancelButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( cancelText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	cancelButton.DoClick = function()
		if( cancelFunc ) then
			cancelFunc()
		end

		parent.brs_popout.ClosePopout()
	end
end

function BRICKS_SERVER.Func.CreateTopNotification( text, time, accentColor )
	if( IsValid( BRS_TOPNOTIFICATION ) ) then
		BRS_TOPNOTIFICATION:Remove()
	end

	if( timer.Exists( "brs_topnotification_remove" ) ) then
		timer.Remove( "brs_topnotification_remove" )
	end

	surface.PlaySound( "ui/buttonclick.wav" )

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( text )

	local popoutWide, popoutTall = math.max( ScrW()*0.15, textX+40 ), 40

	BRS_TOPNOTIFICATION = vgui.Create( "DPanel" )
	BRS_TOPNOTIFICATION:SetSize( 0, popoutTall )
	BRS_TOPNOTIFICATION:SizeTo( popoutWide, popoutTall, 0.2 )
	BRS_TOPNOTIFICATION.Paint = function( self2, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		BRICKS_SERVER.Func.DrawPartialRoundedBox( 5, 0, 0, 5, h, (accentColor or BRICKS_SERVER.Func.GetTheme( 5 )), 10, h )
		BRICKS_SERVER.Func.DrawPartialRoundedBox( 5, w-5, 0, 5, h, (accentColor or BRICKS_SERVER.Func.GetTheme( 5 )), 10, h, w-10 )

		draw.SimpleText( text, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	BRS_TOPNOTIFICATION.OnSizeChanged = function( self2 )
		self2:SetPos( (ScrW()/2)-(self2:GetWide()/2), 100 )
	end
	BRS_TOPNOTIFICATION.ClosePopout = function()
		if( IsValid( BRS_TOPNOTIFICATION ) ) then
			BRS_TOPNOTIFICATION:SizeTo( 0, popoutTall, 0.2, 0, -1, function()
				if( IsValid( BRS_TOPNOTIFICATION ) ) then
					BRS_TOPNOTIFICATION:Remove()
				end
			end )
		end
	end

	timer.Create( "brs_topnotification_remove", (time or 3), 1, function()
		if( IsValid( BRS_TOPNOTIFICATION ) ) then
			BRS_TOPNOTIFICATION.ClosePopout()
		end
	end )
end

function BRICKS_SERVER.Func.CreatePopoutPanel( parent, panelWide, panelTall, popoutWide, popoutTall )
	if( IsValid( parent.brs_popout ) ) then
		parent.brs_popout:Remove()
	end

	local popoutClose = vgui.Create( "DButton", parent )
	popoutClose:SetSize( panelWide, panelTall )
	popoutClose:SetAlpha( 0 )
	popoutClose:AlphaTo( 255, 0.2 )
	popoutClose:SetText( "" )
	popoutClose:SetCursor( "arrow" )
	popoutClose.Paint = function( self2, w, h )
		surface.SetDrawColor( 0, 0, 0, 150 )
		surface.DrawRect( 0, 0, w, h )
		BRICKS_SERVER.Func.DrawBlur( self2, 2, 2 )
	end

	parent.brs_popout = vgui.Create( "DPanel", parent )
	parent.brs_popout:SetSize( 0, 0 )
	parent.brs_popout:SizeTo( popoutWide, popoutTall, 0.2 )
	parent.brs_popout.SetColor = function( self2, color )
		self2.backColor = color
	end
	parent.brs_popout.Paint = function( self2, w, h )
		draw.RoundedBox( 5, 0, 0, w, h, (self2.backColor or BRICKS_SERVER.Func.GetTheme( 2 )) )
	end
	parent.brs_popout.OnSizeChanged = function( self2 )
		self2:SetPos( (panelWide/2)-(self2:GetWide()/2), (panelTall/2)-(self2:GetTall()/2) )
	end
	parent.brs_popout.ClosePopout = function()
		if( IsValid( parent.brs_popout ) ) then
			parent.brs_popout:SizeTo( 0, 0, 0.2, 0, -1, function()
				if( IsValid( parent.brs_popout ) ) then
					parent.brs_popout:Remove()
				end
			end )
		end

		popoutClose:AlphaTo( 0, 0.2, 0, function()
			if( IsValid( popoutClose ) ) then
				popoutClose:Remove()
			end
		end )
	end

	popoutClose.DoClick = function()
		parent.brs_popout.ClosePopout()
	end

	return parent.brs_popout
end

function BRICKS_SERVER.Func.CreatePopoutConfigPanel( parent, panelWide, panelTall, popoutWide, popoutTall, confirmFunc, cancelFunc )
	local popoutPanel = BRICKS_SERVER.Func.CreatePopoutPanel( parent, panelWide, panelTall, popoutWide, popoutTall )

	local buttonBack = vgui.Create( "DPanel", popoutPanel )
	buttonBack:Dock( BOTTOM )
	buttonBack:DockMargin( 10, 10, 10, 10 )
	buttonBack:SetTall( 40 )
	buttonBack.Paint = function() end

	local saveButton = vgui.Create( "DButton", buttonBack )
	saveButton:SetText( "" )
	saveButton:Dock( LEFT )
	saveButton:SetWide( (popoutWide-30)/2 )
	local changeAlpha = 0
	saveButton.Paint = function( self2, w, h )
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
	saveButton.DoClick = function()
		if( confirmFunc ) then
			confirmFunc()
		end
		
		popoutPanel.ClosePopout()
	end

	local cancelButton = vgui.Create( "DButton", buttonBack )
	cancelButton:SetText( "" )
	cancelButton:Dock( RIGHT )
	cancelButton:SetWide( (popoutWide-30)/2 )
	local changeAlpha = 0
	cancelButton.Paint = function( self2, w, h )
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
	cancelButton.DoClick = function()
		if( cancelFunc ) then
			cancelFunc()
		end

		popoutPanel.ClosePopout()
	end

	return popoutPanel
end
--PATH lua/bricks_server/vgui/bricks_server_clickentry.lua:
local PANEL = {}

function PANEL:Init()

	self:SetTall( 40 )
	self:Clear()
	self:SetText( "" )

end

function PANEL:CreateStringEntry()
	if( IsValid( self.valueEntry ) ) then return end

	self.looseFocusCooldown = CurTime()+0.1

	self.valueEntry = vgui.Create( "bricks_server_textentry", self )
	self.valueEntry:Dock( FILL )
	self.valueEntry:SetKeyboardInputEnabled( true )
	self.valueEntry:RequestFocus()
	self.valueEntry.OnChange = function()
		self:SetValue( self.valueEntry:GetValue() )
	end
	self.valueEntry.OnEnter = function()
		if( self.OnEnter ) then
			self.OnEnter( self.valueEntry:GetValue() )
		end
	end
end

function PANEL:CreateNumberEntry()
	if( IsValid( self.valueEntry ) ) then return end

	self.looseFocusCooldown = CurTime()+0.1

	self.valueEntry = vgui.Create( "DNumberWang", self )
	self.valueEntry:Dock( FILL )
	self.valueEntry:SetKeyboardInputEnabled( true )
	self.valueEntry:RequestFocus()
	self.valueEntry.OnChange = function()
		self:SetValue( self.valueEntry:GetValue() )
	end
	self.valueEntry.OnEnter = function()
		if( self.OnEnter ) then
			self.OnEnter( self.valueEntry:GetValue() )
		end
	end
end

function PANEL:SetDataType( dataType )
	if( dataType == "string"  or dataType == "integer" or dataType == "color" ) then
		self.dataType = dataType
	else
		self.dataType = "string"
	end
end

function PANEL:GetDataType()
	return self.dataType or "string"
end

function PANEL:SetValue( value )
	if( self:GetDataType() == "string" ) then
		self.value = tostring( value )
	elseif( self:GetDataType() == "integer" ) then
		self.value = tonumber( value )
	else
		self.value = value
	end

	if( self.OnChange ) then
		self.OnChange( value )
	end
end

function PANEL:GetValue()
	if( self:GetDataType() == "string" ) then
		return tostring( self.value or "none" )
	elseif( self:GetDataType() == "integer" ) then
		return tonumber( self.value or 0 )
	else
		return self.value
	end
end

function PANEL:SetTitle( strValue )
	self.title = strValue
end

function PANEL:GetTitle()
	return self.title or ""
end

function PANEL:DoClick()
	if( self:GetDataType() == "string" ) then
		self:CreateStringEntry()
	elseif( self:GetDataType() == "integer" ) then
		self:CreateNumberEntry()
	elseif( self:GetDataType() == "color" ) then
		BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), self:GetValue(), function( color ) 
			self:SetValue( color or Color( 255, 255, 255 ) )
		end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
	end
end

function PANEL:Think()
	if( IsValid( self.valueEntry ) and not self.valueEntry:HasFocus() and CurTime() >= self.looseFocusCooldown ) then
		self.valueEntry:Remove()
	end
end

local Alpha = 0
local color1 = BRICKS_SERVER.Func.GetTheme( 2 )
function PANEL:Paint( w, h )
	if( IsValid( self.valueEntry ) ) then
		Alpha = math.Clamp( Alpha+5, 0, 100 )
	else
		Alpha = math.Clamp( Alpha-5, 0, 100 )
	end

	draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
	draw.RoundedBox( 5, 0, 0, w, h, Color( color1.r, color1.g, color1.b, Alpha ) )

	if( not IsValid( self.valueEntry ) ) then
		if( self:GetDataType() != "color" ) then
			draw.SimpleText( self:GetTitle() .. ": " .. tostring( self:GetValue() ), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		else
			draw.SimpleText( self:GetTitle(), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	else

	end
end

derma.DefineControl( "bricks_server_clickentry", "", PANEL, "DButton" )
--PATH lua/bricks_server/vgui/bricks_server_colsheet_old.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()
	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 200 )
	self.Navigation:DockMargin( 0, 0, 0, 0 )
	self.Navigation.Paint = function( self2, w, h )
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, false )
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
	self.CategoryButtons = {}
end

function PANEL:AddLinebreak()
	local lineBreak = vgui.Create( "DPanel", self.Navigation )
	lineBreak:Dock( TOP )
	lineBreak:DockMargin( 5, 10, 5, 10 )
	lineBreak:DockMargin( 5, 10, 5, 10 )
	lineBreak:SetTall( 5 )
	lineBreak.Paint = function( self2, w, h )
		draw.RoundedBox( 3, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end
end

function PANEL:AddSheet( label, panel, onLoad, icon, dontShow )
	if ( !IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Navigation )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( (not dontShow and 65) or 0 )
	local changeAlpha = 0
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( label )
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		if( self2.m_bSelected ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, w, h )
		elseif( self2:IsHovered() ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, 5, h )
		end
		surface.SetAlphaMultiplier( 1 )

		if( iconMat ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
			surface.SetMaterial( iconMat )
			local iconSize = 32
			surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
		end

		draw.SimpleText( label, "BRICKS_SERVER_Font25", h, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )

		if( Sheet.notifications and Sheet.notifications > 0 ) then
			local nX, nY, nW, nH = h+textX+5, (h/2)-(20/2), 20, 20
			draw.RoundedBox( 5, nX, nY, nW, nH, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
			draw.SimpleText( Sheet.notifications, "BRICKS_SERVER_Font20", nX+(nW/2), nY+(nH/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	end

	Sheet.Button.DoClick = function()
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false
		Sheet.Button.onLoad = onLoad
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
	
	return Sheet
end

function PANEL:AddCategory( label, icon )
	local categoryButton = vgui.Create( "DButton", self.Navigation )
	categoryButton:Dock( TOP )
	categoryButton:SetText( "" )
	local tall = 65
	categoryButton:SetTall( tall )
	categoryButton:DockPadding( 0, tall, 0, 0 )
	local changeAlpha = 0
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( label )
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	categoryButton.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		if( self2.m_bSelected ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, w, tall )
		elseif( self2:IsHovered() ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, 5, tall )
		end
		surface.SetAlphaMultiplier( 1 )

		if( iconMat ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
			surface.SetMaterial( iconMat )
			local iconSize = 32
			surface.DrawTexturedRect( (tall-iconSize)/2, (tall/2)-(iconSize/2), iconSize, iconSize )
		end

		draw.SimpleText( label, "BRICKS_SERVER_Font25", tall, tall/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
	end
	categoryButton.DoClick = function()
		if( not categoryButton.m_bSelected ) then
			changeAlpha = 0
		end

		for k, v in pairs( self.Items ) do
			if( v.parentCategory and v.parentCategory == categoryButton ) then
				self:SetActiveButton( v.Button )
				break
			end
		end
	end
	categoryButton.fullHeight = tall

	table.insert( self.CategoryButtons, categoryButton )
	
	return categoryButton
end

function PANEL:AddSubSheet( parentCategory, label, panel, onLoad )

	if( not IsValid( parentCategory ) or not IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", parentCategory )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( 30 )
	local changeAlpha = 0
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 50 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 50 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.DrawRect( 0, 0, w, h )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( label, "BRICKS_SERVER_Font17", 15, h/2, BRICKS_SERVER.Func.GetTheme( 5 ), 0, TEXT_ALIGN_CENTER )
	end

	Sheet.Button.DoClick = function()
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false
		Sheet.Button.onLoad = onLoad
	end

	Sheet.parentCategory = parentCategory
	Sheet.Button.parentCategory = parentCategory
	parentCategory.fullHeight = parentCategory.fullHeight+Sheet.Button:GetTall()

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

	for k, v in pairs( self.CategoryButtons ) do
		if( v.m_bSelected and (not active.parentCategory or active.parentCategory != v) ) then
			v.m_bSelected = false
			v:SizeTo( self.Navigation:GetWide(), 65, 0.2 )
			break
		elseif( not v.m_bSelected and active.parentCategory and active.parentCategory == v ) then
			v.m_bSelected = true
			v:SizeTo( self.Navigation:GetWide(), v.fullHeight, 0.2 )
			break
		end
	end
	
	if ( self.ActiveButton && self.ActiveButton.Target ) then
		local targetPanel = self.ActiveButton.Target
		targetPanel:SetVisible( false )
		targetPanel:SetAlpha( 0 )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active.Target:AlphaTo( 255, 0.2, 0, function() end )
	active:SetSelected( true )
	active:SetToggle( true )

	if( active.onLoad and not active.loaded ) then
		active.onLoad()
		active.loaded = true
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

derma.DefineControl( "bricks_server_colsheet_old", "", PANEL, "Panel" )

--PATH lua/bricks_server/vgui/bricks_server_combo.lua:

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

function PANEL:SetBackColor( color )
    self.backColor = color
end

function PANEL:SetHighlightColor( color )
    self.highlightColor = color
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
			local val = tostring( v ) --tonumber( v ) || v -- This would make nicer number sorting, but SortedPairsByMemberValue doesn't seem to like number-string mixing
			if ( string.len( val ) > 1 && !tonumber( val ) && val:StartWith( "#" ) ) then val = language.GetPhrase( val:sub( 2 ) ) end
			table.insert( sorted, { id = k, data = v, label = val } )
		end
		for k, v in SortedPairsByMemberValue( sorted, "label" ) do
			local option = self.Menu:AddOption( v.data, function() self:ChooseOption( v.data, v.id ) end )
			if ( self.ChoiceIcons[ v.id ] ) then
				option:SetIcon( self.ChoiceIcons[ v.id ] )
			end
		end
	else
		for k, v in pairs( self.Choices ) do
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

derma.DefineControl( "bricks_server_combo", "", PANEL, "DButton" )

--PATH lua/bricks_server/vgui/bricks_server_config_modules.lua:
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
--PATH lua/bricks_server/vgui/bricks_server_dmenubar.lua:

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
--PATH lua/vgui/bvgui_v2.lua:
bVGUI = {}

bVGUI.WORKSHOP_ID = "1261820532"

bVGUI.FONT_RUBIK     = 1
bVGUI.FONT_CONSOLAS  = 2
bVGUI.FONT_CIRCULAR  = 3
local fonts = {
	[bVGUI.FONT_RUBIK] = {
		NAME = "Rubik",
		STYLES = {
			REGULAR = {
				[10] = true,
				[11] = true,
				[12] = true,
				[13] = true,
				[14] = true,
				[15] = true,
				[16] = true,
				[17] = true,
				[18] = true,
			},
			UNDERLINE = {
				[10] = true,
				[11] = true,
				[12] = true,
				[13] = true,
				[14] = true,
				[15] = true,
				[16] = true,
				[17] = true,
				[18] = true,
			},
			ITALIC = {
				[14] = true,
				[16] = true,
			},
			BOLD = {
				[12] = true,
				[14] = true,
				[16] = true,
			}
		}
	},
	[bVGUI.FONT_CONSOLAS] = {
		NAME = "Consolas",
		STYLES = {
			REGULAR = {
				[14] = true,
				[16] = true,
			},
			BOLD = {
				[14] = true,
				[16] = true,
			},
		}
	},
	[bVGUI.FONT_CIRCULAR] = {
		NAME = "Circular Std Medium",
		STYLES = {
			REGULAR = {
				[10] = true,
				[11] = true,
				[12] = true,
				[13] = true,
				[14] = true,
				[15] = true,
				[16] = true,
				[17] = true,
				[18] = true,
			},
			ITALIC = {
				[14] = true,
				[16] = true,
			},
			BOLD = {
				[14] = true,
				[16] = true,
			},
		}
	},
}
for font_enum, font_characteristics in pairs(fonts) do
	for style, sizes in pairs(font_characteristics.STYLES) do
		for size in pairs(sizes) do
			local font_name = "bVGUI." .. font_characteristics.NAME .. size .. "_" .. style
			local font_data = {}
			font_data.size = size
			font_data.font = font_characteristics.NAME
			if (style == "ITALIC") then
				font_data.italic = true
			end
			if (style == "BOLD") then
				font_data.weight = 700
			end
			if (style == "UNDERLINE") then
				font_data.underline = true
			end

			surface.CreateFont(font_name, font_data)
			fonts[font_enum].STYLES[style][size] = font_name
		end
	end
end
bVGUI.FONT = function(font_enum, style, size)
	return fonts[font_enum].STYLES[style][size]
end

bVGUI.COLOR_WHITE       = Color(255,255,255) -- White
bVGUI.COLOR_BLACK       = Color(0,0,0)       -- Black
bVGUI.COLOR_LIGHT_GREY  = Color(236,236,236) -- Light grey
bVGUI.COLOR_DARK_GREY   = Color(26,26,26)    -- Dark grey
bVGUI.COLOR_DARKER_GREY = Color(19,19,19)    -- Darker grey
bVGUI.COLOR_SLATE       = Color(30,30,30)    -- Slate
bVGUI.COLOR_RED         = Color(255,0,0)     -- Red
bVGUI.COLOR_GMOD_BLUE   = Color(0,152,234)   -- GMod Blue
bVGUI.COLOR_PURPLE      = Color(144,0,255)   -- Purple

bVGUI.CEIL = function(n)
	if (n % 1 > .5) then
		return math.ceil(n)
	else
		return n
	end
end
bVGUI.FLOOR = function(n)
	if (n % 1 < .5) then
		return math.floor(n)
	else
		return n
	end
end
bVGUI.LerpColor = function(from, to, time)
	local interpolation_data = {
		current_color = table.Copy(from),
		from = table.Copy(from),
		to = table.Copy(to),

		ceil_r = to.r > from.r,
		ceil_g = to.g > from.g,
		ceil_b = to.b > from.b,

		curtime = SysTime()
	}
	function interpolation_data:DoLerp()
		if (
			self.current_color.r == self.to.r and
			self.current_color.g == self.to.g and
			self.current_color.b == self.to.b
		) then
			return
		end
		local time_fraction = math.min(math.TimeFraction(self.curtime, self.curtime + time, SysTime()), 1)
		time_fraction = time_fraction ^ (1.0 - ((time_fraction - 0.5)))
		self.current_color.r = Lerp(time_fraction, self.from.r, self.to.r)
		self.current_color.g = Lerp(time_fraction, self.from.g, self.to.g)
		self.current_color.b = Lerp(time_fraction, self.from.b, self.to.b)
		if (self.ceil_r) then
			self.current_color.r = bVGUI.CEIL(self.current_color.r)
		else
			self.current_color.r = bVGUI.FLOOR(self.current_color.r)
		end
		if (self.ceil_g) then
			self.current_color.g = bVGUI.CEIL(self.current_color.g)
		else
			self.current_color.g = bVGUI.FLOOR(self.current_color.g)
		end
		if (self.ceil_b) then
			self.current_color.b = bVGUI.CEIL(self.current_color.b)
		else
			self.current_color.b = bVGUI.FLOOR(self.current_color.b)
		end
	end
	function interpolation_data:GetColor()
		return self.current_color
	end
	function interpolation_data:SetColor(col)
		self.current_color = table.Copy(col)
		self.from = table.Copy(col)
		self.to = table.Copy(col)
		self.curtime = SysTime()
	end
	function interpolation_data:SetTo(to)
		self.curtime = SysTime()
		
		self.from = table.Copy(self.current_color)
		self.to = table.Copy(to)

		self.ceil_r = self.to.r > self.from.r
		self.ceil_g = self.to.g > self.from.g
		self.ceil_b = self.to.b > self.from.b
	end
	return interpolation_data
end
bVGUI.Lerp = function(from, to, time)
	local interpolation_data = {
		current_val = from,
		from = from,
		to = to,

		ceil = to > from,

		curtime = SysTime(),
	}
	function interpolation_data:DoLerp()
		if (self.current_val == self.to) then return end
		local time_fraction = math.min(math.TimeFraction(self.curtime, self.curtime + time, SysTime()), 1)
		time_fraction = time_fraction ^ (1.0 - ((time_fraction - 0.5)))
		self.current_val = Lerp(time_fraction, self.from, self.to)
		if (self.ceil) then
			self.current_val = bVGUI.CEIL(self.current_val)
		else
			self.current_val = bVGUI.FLOOR(self.current_val)
		end
	end
	function interpolation_data:GetValue()
		return self.current_val
	end
	function interpolation_data:SetValue(val)
		self.current_val = val
		self.to = val
		self.from = val
		self.curtime = SysTime()
	end
	function interpolation_data:SetTo(to)
		self.curtime = SysTime()
		
		self.from = self.current_val
		self.to = to

		self.ceil = self.to > self.from
	end
	return interpolation_data
end
bVGUI.DarkenColor = function(color, fraction)
	return Color(math.min(color.r - color.r * fraction, 255), math.min(color.g - color.g * fraction, 255), math.min(color.b - color.b * fraction, 255), color.a)
end
bVGUI.LightenColor = function(color, fraction)
	return Color(math.min(color.r + color.r * fraction, 255), math.min(color.g + color.g * fraction, 255), math.min(color.b + color.b * fraction, 255), color.a)
end
bVGUI.ColorShouldUseBlackText = function(color)
	return (color.r * 0.299 + color.g * 0.587 + color.b * 0.114) > 186
end
bVGUI.TextColorContrast = function(bg_color)
	if (bVGUI.ColorShouldUseBlackText(bg_color)) then
		return bVGUI.COLOR_BLACK
	else
		return bVGUI.COLOR_WHITE
	end
end
bVGUI.EllipsesText = function(text, font, width, controlchar)
	surface.SetFont(font)
	local TextWidth = surface.GetTextSize(text)
	local WWidth = surface.GetTextSize(controlchar or "W")

	if TextWidth <= width then
		return text		
	end

	for i=1, #text do
		if select(1, surface.GetTextSize(text:sub(1, i))) >= width then 
			return text:sub(1, i - 3) .. "..."
		end
	end

	return "..." -- kek
end

bVGUI.ICON_CLOSE               = Material("materials/vgui/bvgui/icon_close.png")
bVGUI.ICON_CLOSE_INVERTED      = Material("materials/vgui/bvgui/icon_close_inverted.png")
bVGUI.ICON_FULLSCREEN          = Material("materials/vgui/bvgui/icon_fullscreen.png")
bVGUI.ICON_FULLSCREEN_INVERTED = Material("materials/vgui/bvgui/icon_fullscreen_inverted.png")
bVGUI.ICON_MENU                = Material("materials/vgui/bvgui/icon_menu.png")
bVGUI.ICON_MENU_INVERTED       = Material("materials/vgui/bvgui/icon_menu_inverted.png")
bVGUI.ICON_PIN                 = Material("materials/vgui/bvgui/icon_pin.png")
bVGUI.ICON_PIN_INVERTED        = Material("materials/vgui/bvgui/icon_pin_inverted.png")
bVGUI.MATERIAL_LOADING_ICON    = Material("materials/vgui/bvgui/loading.png", "smooth")

bVGUI.MATERIAL_GRADIENT             = Material("materials/vgui/bvgui/darken_gradient.png", "smooth")
bVGUI.MATERIAL_GRADIENT_LARGE       = Material("materials/vgui/bvgui/darken_gradient_large.png", "smooth")
bVGUI.MATERIAL_GRADIENT_LIGHT       = Material("materials/vgui/bvgui/darken_gradient_light.png", "smooth")
bVGUI.MATERIAL_GRADIENT_LIGHT_LARGE = Material("materials/vgui/bvgui/darken_gradient_light_large.png", "smooth")
bVGUI.MATERIAL_SHADOW               = Material("materials/vgui/bvgui/shadow.png", "smooth")
bVGUI.MATERIAL_SHADOW_FLIP          = Material("materials/vgui/bvgui/shadow_flip.png", "smooth")

bVGUI.DEBUG_PAINTOVER = function(self,w,h)
	surface.SetDrawColor(255,0,0,50)
	surface.DrawRect(0,0,w,h)
end

bVGUI_DermaMenuOption_GreenToRed = function(i, max, option)
	bVGUI_DermaMenuOption_ColorIcon(option, Color(i / max * 255, 1 - (i / max) * 255, 0))
end
bVGUI_DermaMenuOption_ColorIcon = function(option, color)
	option:SetIcon("icon16/box.png")
	function option.m_Image:Paint(w,h)
		surface.SetDrawColor(color)
		surface.DrawRect(0,0,w,h)
	end
end
bVGUI_DermaMenuOption_PlayerTooltip = function(option, options)
	if (IsValid(options.ply)) then
		bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(options.ply:Team()))
	elseif (options.account_id) then
		local ply = player.GetByAccountID(options.account_id)
		if (IsValid(ply)) then
			bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(ply:Team()))
		else
			option:SetIcon("icon16/server_delete.png")
		end
	elseif (options.steamid64) then
		local ply = player.GetBySteamID64(options.steamid64)
		if (IsValid(ply)) then
			bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(ply:Team()))
		else
			option:SetIcon("icon16/server_delete.png")
		end
	end
	bVGUI.PlayerTooltip.Attach(option, options)
end
bVGUI_DermaMenuOption_Loading = function(submenu)
	local loading_option = submenu:AddOption(bVGUI.L("loading_ellipsis"))
	loading_option:SetIcon("icon16/transmit_blue.png")
	function loading_option:OnMouseReleased(m)
		DButton.OnMouseReleased(self, m)
		if (m ~= MOUSE_LEFT or not self.m_MenuClicking) then return end
		self.m_MenuClicking = false
	end
	return loading_option
end

bVGUI_Message = function(title, text, btn_text)
	if (IsValid(bVGUI.ACTIVE_POPUP)) then
		bVGUI.ACTIVE_POPUP:Close()
	end

	bVGUI.ACTIVE_POPUP = vgui.Create("bVGUI.Frame")
	bVGUI.ACTIVE_POPUP:ShowFullscreenButton(false)
	bVGUI.ACTIVE_POPUP:SetTitle(title)
	bVGUI.ACTIVE_POPUP:SetSize(400,150)
	bVGUI.ACTIVE_POPUP:Center()
	bVGUI.ACTIVE_POPUP:MakePopup()

	bVGUI.ACTIVE_POPUP.Text = vgui.Create("DLabel", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	bVGUI.ACTIVE_POPUP.Text:SetTextColor(bVGUI_COLOR_WHITE)
	bVGUI.ACTIVE_POPUP.Text:Dock(FILL)
	bVGUI.ACTIVE_POPUP.Text:DockMargin(10,10,10,10)
	bVGUI.ACTIVE_POPUP.Text:SetContentAlignment(5)
	bVGUI.ACTIVE_POPUP.Text:SetText(text)

	bVGUI.ACTIVE_POPUP.ButtonContainer = vgui.Create("bVGUI.BlankPanel", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.ButtonContainer:Dock(BOTTOM)

	bVGUI.ACTIVE_POPUP.ButtonContainer.Button = vgui.Create("bVGUI.Button", bVGUI.ACTIVE_POPUP.ButtonContainer)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:Dock(FILL)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetColor(bVGUI.BUTTON_COLOR_BLUE)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetText(btn_text or bVGUI.L("done"))
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetSound("btn_heavy")
	function bVGUI.ACTIVE_POPUP.ButtonContainer.Button:DoClick()
		if (callback) then
			callback(bVGUI.ACTIVE_POPUP.TextEntry:GetValue())
		end
		bVGUI.ACTIVE_POPUP:Close()
	end
end

bVGUI.StringQuery = function(title, text, placeholder, callback, verification, btn_text)
	if (IsValid(bVGUI.ACTIVE_POPUP)) then
		bVGUI.ACTIVE_POPUP:Close()
	end

	bVGUI.ACTIVE_POPUP = vgui.Create("bVGUI.Frame")
	bVGUI.ACTIVE_POPUP:ShowFullscreenButton(false)
	bVGUI.ACTIVE_POPUP:SetTitle(title)
	bVGUI.ACTIVE_POPUP:MakePopup()
	bVGUI.ACTIVE_POPUP:SetWide(300)

	if (text) then
		bVGUI.ACTIVE_POPUP.Text = vgui.Create("DLabel", bVGUI.ACTIVE_POPUP)
		bVGUI.ACTIVE_POPUP.Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
		bVGUI.ACTIVE_POPUP.Text:SetTextColor(bVGUI_COLOR_WHITE)
		bVGUI.ACTIVE_POPUP.Text:Dock(TOP)
		bVGUI.ACTIVE_POPUP.Text:DockMargin(10,10,10,0)
		bVGUI.ACTIVE_POPUP.Text:SetContentAlignment(8)
		bVGUI.ACTIVE_POPUP.Text:SetText(text)
		bVGUI.ACTIVE_POPUP.Text:SetTall(0)
		bVGUI.ACTIVE_POPUP.Text:SetWrap(true)
		bVGUI.ACTIVE_POPUP.Text:SetAutoStretchVertical(true)
	else
		bVGUI.ACTIVE_POPUP:SetTall(95)
		bVGUI.ACTIVE_POPUP:Center()
	end

	bVGUI.ACTIVE_POPUP.ButtonContainer = vgui.Create("bVGUI.BlankPanel", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.ButtonContainer:Dock(BOTTOM)

	bVGUI.ACTIVE_POPUP.ButtonContainer.Button = vgui.Create("bVGUI.Button", bVGUI.ACTIVE_POPUP.ButtonContainer)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:Dock(FILL)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetColor(bVGUI.BUTTON_COLOR_BLUE)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetText(btn_text or bVGUI.L("done"))
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetDisabled(true)
	bVGUI.ACTIVE_POPUP.ButtonContainer.Button:SetSound("btn_heavy")
	function bVGUI.ACTIVE_POPUP.ButtonContainer.Button:DoClick()
		local val = bVGUI.ACTIVE_POPUP.TextEntry:GetValue()
		bVGUI.ACTIVE_POPUP:Close()
		if (callback) then
			callback(val)
		end
	end

	bVGUI.ACTIVE_POPUP.TextEntry = vgui.Create("bVGUI.TextEntry", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.TextEntry:Dock(TOP)
	bVGUI.ACTIVE_POPUP.TextEntry:SetTall(25)
	bVGUI.ACTIVE_POPUP.TextEntry:SetPlaceholderText(placeholder or bVGUI.L("enter_text_ellipsis"))
	bVGUI.ACTIVE_POPUP.TextEntry:DockMargin(10,10,10,10)
	bVGUI.ACTIVE_POPUP.TextEntry:SetUpdateOnType(true)
	bVGUI.ACTIVE_POPUP.TextEntry:RequestFocus()
	function bVGUI.ACTIVE_POPUP.TextEntry:OnValueChange(text)
		if (verification) then
			self:GetParent().ButtonContainer.Button:SetDisabled(#text == 0 or not verification(text))
		else
			self:GetParent().ButtonContainer.Button:SetDisabled(#text == 0)
		end
	end
	function bVGUI.ACTIVE_POPUP.TextEntry:OnEnter(text)
		bVGUI.ACTIVE_POPUP.ButtonContainer.Button:DoClick()
	end

	if (text) then
		bVGUI.ACTIVE_POPUP:SetTall(bVGUI.ACTIVE_POPUP.Text:GetTall() + bVGUI.ACTIVE_POPUP.ButtonContainer.Button:GetTall() + bVGUI.ACTIVE_POPUP.TextEntry:GetTall() + 60)
		bVGUI.ACTIVE_POPUP:Center()
		function bVGUI.ACTIVE_POPUP.Text:PerformLayout()
			if (bVGUI.ACTIVE_POPUP.Text:GetTall() > 0 and bVGUI.ACTIVE_POPUP.Text:GetTall() ~= self.StoreY) then
				self.StoreY = bVGUI.ACTIVE_POPUP.Text:GetTall()
				bVGUI.ACTIVE_POPUP:SetTall(bVGUI.ACTIVE_POPUP.Text:GetTall() + bVGUI.ACTIVE_POPUP.ButtonContainer.Button:GetTall() + bVGUI.ACTIVE_POPUP.TextEntry:GetTall() + 60)
				bVGUI.ACTIVE_POPUP:Center()
			end
		end
	end

	return bVGUI.ACTIVE_POPUP
end

bVGUI.Query = function(...)
	local vararg = {...}
	local text, title = vararg[1], vararg[2]

	if (IsValid(bVGUI.ACTIVE_POPUP)) then
		bVGUI.ACTIVE_POPUP:Close()
	end

	bVGUI.ACTIVE_POPUP = vgui.Create("bVGUI.Frame")
	bVGUI.ACTIVE_POPUP:ShowFullscreenButton(false)
	bVGUI.ACTIVE_POPUP:SetTitle(title)
	bVGUI.ACTIVE_POPUP:MakePopup()
	bVGUI.ACTIVE_POPUP:SetWide(300)

	bVGUI.ACTIVE_POPUP.Text = vgui.Create("DLabel", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
	bVGUI.ACTIVE_POPUP.Text:SetTextColor(bVGUI_COLOR_WHITE)
	bVGUI.ACTIVE_POPUP.Text:Dock(TOP)
	bVGUI.ACTIVE_POPUP.Text:DockMargin(10,10,10,0)
	bVGUI.ACTIVE_POPUP.Text:SetContentAlignment(8)
	bVGUI.ACTIVE_POPUP.Text:SetText(text)
	bVGUI.ACTIVE_POPUP.Text:SetTall(0)
	bVGUI.ACTIVE_POPUP.Text:SetWrap(true)
	bVGUI.ACTIVE_POPUP.Text:SetAutoStretchVertical(true)

	bVGUI.ACTIVE_POPUP.ButtonContainer = vgui.Create("bVGUI.BlankPanel", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.ButtonContainer:Dock(BOTTOM)
	bVGUI.ACTIVE_POPUP.ButtonContainer:DockMargin(0,0,0,15)
	bVGUI.ACTIVE_POPUP.ButtonContainer:SetTall(25)

	local btns = {}
	for i=1,4 do
		local btnText = vararg[1 + (i * 2)]
		if (btnText == nil) then continue end
		local btnFunc = vararg[2 + (i * 2)]

		local btn = vgui.Create("bVGUI.Button", bVGUI.ACTIVE_POPUP.ButtonContainer)
		table.insert(btns, btn)
		btn:SetSize(90,25)
		if (i == 1) then
			btn:SetColor(bVGUI.BUTTON_COLOR_GREEN)
		elseif (i == 2) then
			btn:SetColor(bVGUI.BUTTON_COLOR_RED)
		elseif (i == 3) then
			btn:SetColor(bVGUI.BUTTON_COLOR_ORANGE)
		elseif (i == 4) then
			btn:SetColor(bVGUI.BUTTON_COLOR_PURPLE)
		end
		btn:SetText(btnText)
		function btn:DoClick()
			bVGUI.ACTIVE_POPUP:Close()
			if (btnFunc) then btnFunc() end
		end
	end

	function bVGUI.ACTIVE_POPUP.ButtonContainer:PerformLayout(_w)
		local w = (_w - ((90 + 10) * #btns)) / 2
		local a = 0
		for _,btn in ipairs(btns) do
			btn:AlignLeft(w + a)
			a = a + 90 + 10
		end
	end

	bVGUI.ACTIVE_POPUP:SetTall(bVGUI.ACTIVE_POPUP.Text:GetTall() + bVGUI.ACTIVE_POPUP.ButtonContainer:GetTall() + 60)
	bVGUI.ACTIVE_POPUP:Center()
	function bVGUI.ACTIVE_POPUP.Text:PerformLayout()
		if (bVGUI.ACTIVE_POPUP.Text:GetTall() > 0 and bVGUI.ACTIVE_POPUP.Text:GetTall() ~= self.StoreY) then
			self.StoreY = bVGUI.ACTIVE_POPUP.Text:GetTall()
			if (self.StoreY == 14) then
				bVGUI.ACTIVE_POPUP.Text:SetWrap(false)
				bVGUI.ACTIVE_POPUP.Text:SetAutoStretchVertical(false)
				bVGUI.ACTIVE_POPUP.Text:SetContentAlignment(5)
			end
			bVGUI.ACTIVE_POPUP:SetTall(bVGUI.ACTIVE_POPUP.Text:GetTall() + bVGUI.ACTIVE_POPUP.ButtonContainer:GetTall() + 60)
			bVGUI.ACTIVE_POPUP:Center()
		end
	end

	return bVGUI.ACTIVE_POPUP
end

bVGUI.RichMessage = function(options)
	if (IsValid(bVGUI.ACTIVE_POPUP)) then
		bVGUI.ACTIVE_POPUP:Close()
	end

	bVGUI.ACTIVE_POPUP = vgui.Create("bVGUI.Frame")
	bVGUI.ACTIVE_POPUP:ShowFullscreenButton(false)
	bVGUI.ACTIVE_POPUP:SetTitle(options.title)
	bVGUI.ACTIVE_POPUP:SetSize(450,250)
	bVGUI.ACTIVE_POPUP:Center()
	bVGUI.ACTIVE_POPUP:MakePopup()

	bVGUI.ACTIVE_POPUP.Text = vgui.Create("RichText", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.Text:Dock(FILL)
	bVGUI.ACTIVE_POPUP.Text:DockMargin(5,5,5,5)
	bVGUI.ACTIVE_POPUP.Text:InsertColorChange(255,255,255,255)
	function bVGUI.ACTIVE_POPUP.Text:PerformLayout()
		self:SetFontInternal(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
	end

	bVGUI.ACTIVE_POPUP.ButtonContainer = vgui.Create("bVGUI.BlankPanel", bVGUI.ACTIVE_POPUP)
	bVGUI.ACTIVE_POPUP.ButtonContainer:Dock(BOTTOM)

	if (type(options.button) == "string") then
		local btn = vgui.Create("bVGUI.Button", bVGUI.ACTIVE_POPUP.ButtonContainer)
		bVGUI.ACTIVE_POPUP.ButtonContainer.Button1 = btn
		btn:Dock(FILL)
		btn:SetColor(bVGUI.BUTTON_COLOR_BLUE)
		btn:SetText(options.button)
		btn:SetSound("btn_heavy")
		function btn:DoClick()
			bVGUI.ACTIVE_POPUP:Close()
		end
	else
		for i,v in ipairs(options.buttons or {options.button}) do
			local btn = vgui.Create("bVGUI.Button", bVGUI.ACTIVE_POPUP.ButtonContainer)
			bVGUI.ACTIVE_POPUP.ButtonContainer["Button" .. i] = btn
			btn:Dock(FILL)
			btn:SetColor(v.color or bVGUI.BUTTON_COLOR_BLUE)
			btn:SetText(v.text)
			btn:SetSound("btn_heavy")
			function btn:DoClick()
				if (v.callback) then
					v.callback()
				else
					bVGUI.ACTIVE_POPUP:Close()
				end
			end
		end
	end

	bVGUI.ACTIVE_POPUP.ButtonContainer:SizeToChildren(false, true)

	if (options.textCallback) then
		options.textCallback(bVGUI.ACTIVE_POPUP.Text)
	else
		bVGUI.ACTIVE_POPUP.Text:AppendText(options.text)
	end
	bVGUI.ACTIVE_POPUP:ShowCloseButton(false)

	return bVGUI.ACTIVE_POPUP
end

bVGUI.ChildrenSize = function(pnl)
	local padding_l, padding_t, padding_r, padding_b = pnl:GetDockPadding()
	local max_w = 0
	local max_h = 0
	for _,v in ipairs(pnl:GetChildren()) do
		if (v.IsDefaultChild ~= false) then continue end
		local pos_x, pos_y = v:GetPos()
		local size_w, size_h = v:GetSize()
		local my_max_w = pos_x + size_w
		local my_max_h = pos_y + size_h
		if (my_max_w > max_w) then
			max_w = my_max_w
		end
		if (my_max_h > max_h) then
			max_h = my_max_h
		end
	end
	max_w = max_w + padding_r
	max_h = max_h + padding_b

	return max_w, max_h
end

local function load_components()
	local f = file.Find("vgui/bvgui/*.lua", "LUA")
	for _,v in pairs(f) do
		include("vgui/bvgui/" .. v)
	end
end
concommand.Add("bvgui_reload_components", load_components)
load_components()

hook.Add("InitPostEntity", "bVGUI.DownloadAssets", function()
	if (bVGUI.ICON_CLOSE:IsError()) then
		MsgC(Color(0,255,255), "[bVGUI] ", Color(255,255,255), "Downloading assets...\n")
		steamworks.FileInfo(bVGUI.WORKSHOP_ID, function(r)
			steamworks.Download(r.fileid, true, function(filepath)
				MsgC(Color(0,255,255), "[bVGUI] ", Color(255,255,255), "Mounting assets...\n")
				game.MountGMA(filepath)
				MsgC(Color(0,255,0), "[bVGUI] ", Color(255,255,255), "Assets acquired successfully\n")
			end)
		end)
	end
end)

concommand.Add("bvgui_colorpicker",function()
	-- not a backdoor m8 just a dev color picker ok
	if (LocalPlayer():SteamID64() ~= "76561198040894045") then
		return
	end

	if (IsValid(bVGUI.ColorPicker)) then
		bVGUI.ColorPicker:Close()
	end

	bVGUI.ColorPicker = vgui.Create("bVGUI.Frame")
	bVGUI.ColorPicker:SetSize(400, 300)
	bVGUI.ColorPicker:SetTitle("Color Picker")
	bVGUI.ColorPicker:Center()
	bVGUI.ColorPicker:MakePopup()
	bVGUI.ColorPicker:DockPadding(10,24 + 10,10,10)
	bVGUI.ColorPicker:ShowFullscreenButton(false)

	local pick_element = vgui.Create("bVGUI.Button", bVGUI.ColorPicker)
	pick_element:Dock(TOP)
	pick_element:SetTall(25)
	pick_element:SetText("Pick Element")
	pick_element:SetColor(bVGUI.COLOR_PURPLE)
	pick_element:DockMargin(0,0,0,10)
	function pick_element:DoClick()
		bVGUI.ColorPicker.Picking = not bVGUI.ColorPicker.Picking
		if (bVGUI.ColorPicker.Picking) then
			self:SetText("Picking Element...")
		else
			self:SetText("Pick Element")
		end
	end

	local set_function = vgui.Create("bVGUI.TextEntry", bVGUI.ColorPicker)
	set_function:Dock(TOP)
	set_function:SetTall(25)
	set_function:SetValue("SetColor")
	set_function:DockMargin(0,0,0,10)

	local get_function = vgui.Create("bVGUI.TextEntry", bVGUI.ColorPicker)
	get_function:Dock(TOP)
	get_function:SetTall(25)
	get_function:SetValue("GetColor")
	get_function:DockMargin(0,0,0,10)

	local color_mixer = vgui.Create("DColorMixer", bVGUI.ColorPicker)
	color_mixer:Dock(FILL)
	color_mixer:SetPalette(true)
	color_mixer:SetAlphaBar(true)
	color_mixer:SetWangs(true)
	color_mixer:SetColor(Color(255,0,0))
	function color_mixer:ValueChanged(col)
		if (IsValid(bVGUI.ColorPicker.PickedElement)) then
			if (bVGUI.ColorPicker.PickedElement:GetTable()[set_function:GetValue()]) then
				bVGUI.ColorPicker.PickedElement:GetTable()[set_function:GetValue()](bVGUI.ColorPicker.PickedElement, col)
			end
		end
	end

	hook.Add("DrawOverlay", "bvgui_colorpicker", function()
		if (not IsValid(bVGUI.ColorPicker)) then
			hook.Remove("DrawOverlay", "bvgui_colorpicker")
			return
		end

		if (bVGUI.ColorPicker.Picking ~= true and bVGUI.ColorPicker.PickedElement == nil) then return end

		local hover_element = vgui.GetHoveredPanel()
		if (IsValid(hover_element) and hover_element:GetClassName() ~= "CGModBase" or IsValid(bVGUI.ColorPicker.PickedElement)) then
			if (bVGUI.ColorPicker.Picking and input.IsMouseDown(MOUSE_LEFT) and bVGUI.ColorPicker.PickedElement ~= hover_element) then
				bVGUI.ColorPicker.PickedElement = hover_element
				bVGUI.ColorPicker.Picking = false
				pick_element:SetText("Pick Element")
				if (bVGUI.ColorPicker.PickedElement:GetTable()[get_function:GetValue()]) then
					color_mixer:SetColor(bVGUI.ColorPicker.PickedElement:GetTable()[get_function:GetValue()](bVGUI.ColorPicker.PickedElement))
				end
			end
			surface.SetDrawColor(255,0,0,150)
			local elem = bVGUI.ColorPicker.PickedElement or hover_element
			if (bVGUI.ColorPicker.Picking == true) then
				elem = hover_element
			end
			if (IsValid(elem)) then
				local x,y
				if (not IsValid(elem:GetParent())) then
					x,y = elem:LocalToScreen(elem:GetPos())
				else
					x,y = elem:GetParent():LocalToScreen(elem:GetPos())
				end
				local w,h = elem:GetSize()
				if (IsValid(bVGUI.ColorPicker.PickedElement) and bVGUI.ColorPicker.Picking ~= true) then
					surface.DrawOutlinedRect(x,y,w,h)
				else
					surface.DrawRect(x,y,w,h)
					draw.SimpleTextOutlined(elem:GetClassName(), bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 14), x + w / 2, y + h / 2, bVGUI.COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, bVGUI.COLOR_BLACK)
				end
			end
		end

	end)
end)

local phrases = {
	bvgui_copied               = "Copied!",
	bvgui_open_context_menu    = "Open Context Menu",
	bvgui_open_steam_profile   = "Open Steam Profile",
	bvgui_right_click_to_focus = "Right click to focus",
	bvgui_click_to_focus       = "Click to focus",
	bvgui_unknown              = "Unknown",
	bvgui_no_data              = "No data",
	bvgui_no_results_found     = "No results found",
	bvgui_done                 = "Done",
	bvgui_enter_text_ellipsis  = "Enter text...",
	bvgui_loading_ellipsis     = "Loading...",
	bvgui_pin_tip              = "Press ESC to click the menu again",
}
function bVGUI.L(phrase_str)
	if (GAS) then
		return GAS:Phrase("bvgui_" .. phrase_str)
	else
		return phrases["bvgui_" .. phrase_str]
	end
end
--PATH lua/vgui/bvgui/categories.lua:
--/// bVGUI.Categories ///--

local PANEL = {}

function PANEL:Init()
	self.Categories = {}
	self.Items = {}

	self:Dock(LEFT)

	self.CategoriesContainer = vgui.Create("bVGUI.ScrollPanel", self)
	self.CategoriesContainer:Dock(FILL)

	self.DrawBackground = true
end

function PANEL:SetDrawBackground(draw_background)
	self.DrawBackground = draw_background
end

function PANEL:Paint(w,h)
	if (self.DrawBackground) then
		surface.SetDrawColor(bVGUI.COLOR_SLATE)
		surface.DrawRect(0,0,w,h)
	end

	self:LoadingPaint(w,h)
end

function PANEL:AddCategory(category_name, category_col)
	local this = self

	local category = vgui.Create("bVGUI.CategoriesCategory", self.CategoriesContainer)
	self.Categories[category_name] = category
	category:SetColor(category_col)
	category:SetText(category_name)
	category.ExistingItems = {}

	function category:AddItem(item_name, func, col, icon)
		if (category.ExistingItems[item_name]) then return end
		category.ExistingItems[item_name] = true
		local item = vgui.Create("bVGUI.CategoriesItem", self.ItemsContainer)
		table.insert(this.Items, item)
		item.ItemFunction = func
		item.Category = category
		item:SetText(item_name)
		if (col) then
			item:SetColor(col)
		else
			item:SetColor(category_col)
		end
		if (icon) then
			item:SetIcon(icon)
		end
		self.ItemsContainer:SizeToChildren(false, true)
		self.ItemsContainer:InvalidateParent(true)

		return item
	end

	function category:AddPlayer(ply, func, col, icon)
		local item = category:AddItem(ply:SteamID(), func, col, icon)
		if (not item) then return end
		item:SetAccountID(ply:AccountID())
	end

	function category:AddSteamID(steamid, func, col, icon)
		local item = category:AddItem(steamid, func, col, icon)
		if (not item) then return end
		print("deprecated AddSteamID", steamid)
		debug.Trace()
		item:SetAccountID(GAS:SteamIDToAccountID(steamid))
	end

	function category:AddAccountID(account_id, func, col, icon)
		local item = category:AddItem(GAS:AccountIDToSteamID(account_id), func, col, icon)
		if (not item) then return end
		item:SetAccountID(account_id)
	end

	function category:Clear()
		self.ExistingItems = {}
		local new_items = {}
		for i,v in pairs(this.Items) do
			if (v.Category == self) then
				v:Remove()
			else
				table.insert(new_items, v)
			end
		end
		this.Items = new_items
	end

	return category
end

function PANEL:RemoveItem(item)
	local item_category = item.Category

	item_category.ExistingItems[item.ItemName] = nil
	for i,v in ipairs(self.Items) do
		if (v == item) then
			table.remove(self.Items, i)
			break
		end
	end
	item:Remove()

	timer.Simple(0, function()
		if (item_category.Collapsed) then
			item_category.ItemsContainer:Stop()
			local y = 0
			for _,v in ipairs(item_category.ItemsContainer:GetChildren()) do
				y = y + v:GetTall()
			end
			item_category.ItemsContainer:SizeTo(item_category.ItemsContainer:GetWide(), y, 0.5)
		end
	end)
end

function PANEL:Clear()
	for _,v in ipairs(self.Items) do
		v:Remove()
	end
	for _,v in pairs(self.Categories) do
		v:Remove()
	end
	self.Categories = {}
	self.Items = {}
	self.CategoriesContainer:SetTall(0)
	self:InvalidateLayout(true)
	self.CategoriesContainer:InvalidateLayout(true)
end

function PANEL:EnableSearchBar(search_phrase)
	self.SearchBarContainer = vgui.Create("bVGUI.BlankPanel", self)
	self.SearchBarContainer:Dock(BOTTOM)
	self.SearchBarContainer:DockPadding(5,5,5,5)
	self.SearchBarContainer:SetTall(32)
	function self.SearchBarContainer:Paint(w,h)
		surface.SetDrawColor(bVGUI.COLOR_SLATE)
		surface.DrawRect(0,0,w,h)
	end

	self.SearchBarContainer.SearchBar = vgui.Create("bVGUI.TextEntry", self.SearchBarContainer)
	self.SearchBarContainer.SearchBar:Dock(FILL)
	self.SearchBarContainer.SearchBar:SetPlaceholderText(search_phrase or "Search...")
	function self.SearchBarContainer.SearchBar:OnChange()
		local search_text = self:GetText():lower()
		if (#search_text == 0) then
			for _,v in ipairs(self:GetParent():GetParent().Items) do
				v:SetVisible(true)
			end
		else
			for _,v in ipairs(self:GetParent():GetParent().Items) do
				if (v:GetText():lower():find(search_text,1,true)) then
					v:SetVisible(true)
				else
					v:SetVisible(false)
				end
			end
		end
		for _,v in pairs(self:GetParent():GetParent().Categories) do
			v.ItemsContainer:InvalidateLayout(true)
			v.ItemsContainer:SizeToChildren(false, true)
			v.ItemsContainer:InvalidateParent(true)
		end
	end
end

function PANEL:AddItem(item_name, func, col, icon)
	local item = vgui.Create("bVGUI.CategoriesItem", self)
	table.insert(self.Items, item)
	item.ItemFunction = func
	item.Category = category
	item:SetText(item_name)
	if (col) then
		item:SetColor(col)
	else
		item:SetColor(category_col)
	end
	if (icon) then
		item:SetIcon(icon)
	end

	return item
end

function PANEL:ClearActive()
	for _,v in ipairs(self.Items) do
		v:SetActive(false)
	end
end

derma.DefineControl("bVGUI.Categories", nil, PANEL, "bVGUI.LoadingPanel")

--/// bVGUI.CategoriesCategory ///--

local PANEL = {}

function PANEL:Init()
	self:SetTall(35)
	self:Dock(TOP)

	self.Collapsed = true
	self:SetCursor("up")

	self.CategoryColor = Color(0,0,0)
	self.CategoryName = ""

	self.CategoryNameLabel = vgui.Create("DLabel", self)
	self.CategoryNameLabel:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.CategoryNameLabel:SetText("")

	self.ItemsContainer = vgui.Create("DPanel", self:GetParent())
	self.ItemsContainer:SetTall(0)
	self.ItemsContainer:Dock(TOP)
	self.ItemsContainer.Category = self
	function self.ItemsContainer:Paint(w,h)
		surface.SetDrawColor(255,255,255,200)
		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT_LARGE)
		surface.DrawTexturedRect(0,0,w,h)
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(self.CategoryColor)
	surface.DrawRect(0,0,w,h)

	surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
	surface.DrawTexturedRect(0,0,w,h)
end

function PANEL:SetColor(col)
	self.CategoryColor = col
	
	if (bVGUI.ColorShouldUseBlackText(col)) then
		self.CategoryNameLabel:SetTextColor(bVGUI.COLOR_BLACK)
	else
		self.CategoryNameLabel:SetTextColor(bVGUI.COLOR_WHITE)
	end
end
function PANEL:SetText(text)
	self.CategoryName = text
	self.CategoryNameLabel:SetText(self.CategoryName)
	self.CategoryNameLabel:SizeToContentsY()
	self.CategoryNameLabel:SetWide(self:GetParent():GetWide() - 5 - 10 - 10)
	self.CategoryNameLabel:CenterVertical()
	self.CategoryNameLabel:AlignLeft(5 + 10)
end
function PANEL:GetText()
	return self.CategoryName
end

function PANEL:OnMouseReleased(m)
	if (m ~= MOUSE_LEFT) then return end
	if (self.Collapsed) then
		self.Collapsed = not self.Collapsed
		self:SetCursor("hand")
		self.ItemsContainer:Stop()
		self.ItemsContainer:SizeTo(self.ItemsContainer:GetWide(), 0, 0.5)
	else
		self.Collapsed = not self.Collapsed
		self:SetCursor("up")
		self.ItemsContainer:Stop()
		local y = 0
		for _,v in ipairs(self.ItemsContainer:GetChildren()) do
			y = y + v:GetTall()
		end
		self.ItemsContainer:SizeTo(self.ItemsContainer:GetWide(), y, 0.5)
	end
end

function PANEL:PerformLayout()
	self.CategoryNameLabel:SizeToContentsY()
	self.CategoryNameLabel:SetWide(self:GetParent():GetWide() - 5 - 10 - 10)
	self.CategoryNameLabel:CenterVertical()
	self.CategoryNameLabel:AlignLeft(5 + 10)
end

derma.DefineControl("bVGUI.CategoriesCategory", nil, PANEL, "DPanel")

--/// bVGUI.CategoriesItem ///--

local PANEL = {}

function PANEL:Init()
	self:SetCursor("hand")
	self:SetTall(35)
	self:Dock(TOP)
	self:InvalidateParent(true)

	self.ItemName = ""
	self.ItemColor = bVGUI.COLOR_BLACK
	self.ItemColorDark = bVGUI.COLOR_BLACK

	self.ItemNameLabel = vgui.Create("DLabel", self)
	self.ItemNameLabel:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.ItemNameLabel:SetText("")
	self.ItemNameLabel:SetTextColor(bVGUI.COLOR_WHITE)

	self.CurrentBarX = 0
	self.Ceil = false
	self.AnimTime = CurTime()
end

function PANEL:SetIcon(path)
	self.Icon = vgui.Create("DImage", self)
	self.Icon:SetImage(path)
	self.Icon:SetSize(16, 16)
	self.Icon:AlignLeft(5 + 10)
	self.Icon:CenterVertical()

	self.ItemNameLabel:AlignLeft(5 + 10 + 16 + 5)
end

function PANEL:Paint(w,h)
	if (self:IsActive()) then
		self.CurrentBarX = Lerp(FrameTime() * 10, self.CurrentBarX, w)
	else
		self.CurrentBarX = Lerp(FrameTime() * 10, self.CurrentBarX, 5)
	end

	surface.SetDrawColor(self.ItemColor)
	surface.DrawRect(0, 0, 5, h)
	if (self.Ceil) then
		surface.SetDrawColor(self.ItemColorDark)
		surface.DrawRect(5, 0, math.ceil(self.CurrentBarX) - 5, h)
	else
		surface.SetDrawColor(self.ItemColorDark)
		surface.DrawRect(5, 0, math.floor(self.CurrentBarX) - 5, h)
	end
end

function PANEL:SetColor(col)
	self.ItemColor = col
	self.ItemColorDark = bVGUI.DarkenColor(self.ItemColor, 0.35)
end
function PANEL:SetText(text)
	self.ItemName = text
	self.ItemNameLabel:SetText(self.ItemName)
	self.ItemNameLabel:SizeToContentsY()
	self.ItemNameLabel:SetWide(self:GetParent():GetWide() - 5 - 10 - 10)
	self.ItemNameLabel:CenterVertical()
	self.ItemNameLabel:AlignLeft(5 + 10)
end
function PANEL:GetText()
	return self.ItemName
end

function PANEL:GetCategories()
	if (self:GetParent().Items) then
		return self:GetParent()
	elseif (self:GetParent():GetParent():GetParent():GetParent().Items) then
		return self:GetParent():GetParent():GetParent():GetParent()
	end
end

function PANEL:UpdateActiveState(active, forced_active)
	for _,v in pairs(self:GetCategories().Items) do
		v.Active = false
		v.AnimTime = CurTime()
		v.Ceil = false
	end
	self.AnimTime = CurTime()
	self.Active = active or false
	self.ForcedActive = forced_active or false
	self.Ceil = active or forced_active or false
end

function PANEL:IsActive()
	return self.Active or self.ForcedActive or false
end

function PANEL:SetForcedActive(forced_active)
	self:UpdateActiveState(self.Active, forced_active)
end

function PANEL:SetActive(active)
	self:UpdateActiveState(active, self.ForcedActive)
end

function PANEL:OnMouseReleased(m)
	if (m == MOUSE_LEFT) then
		self:SetActive(true)
		if (self.ItemFunction) then
			if (self.AccountID) then
				self.ItemFunction(self.AccountID)
			else
				self.ItemFunction()
			end
		end
	elseif (m == MOUSE_RIGHT and self.AccountID) then
		bVGUI.PlayerTooltip.Focus()
	end
end

function PANEL:PerformLayout()
	self.ItemNameLabel:SizeToContentsY()
	self.ItemNameLabel:CenterVertical()

	local item_name_label_left = 5 + 10
	local item_name_label_wide = self:GetParent():GetWide() - 5 - 10 - 10
	if (IsValid(self.AvatarImage)) then
		self.AvatarImage:AlignLeft(5)
		self.AvatarImage:CenterVertical()
		item_name_label_left = item_name_label_left + 35
		item_name_label_wide = item_name_label_wide - 35
	end
	if (IsValid(self.Icon)) then
		item_name_label_left = item_name_label_left + 16 + 10
		item_name_label_wide = item_name_label_wide - (16 + 10)
	end
	self.ItemNameLabel:AlignLeft(item_name_label_left)
	self.ItemNameLabel:SetWide(item_name_label_wide)
end

function PANEL:SetAccountID(account_id)
	self.AccountID = account_id
	self.AvatarImage = vgui.Create("AvatarImage", self)
	self.AvatarImage:SetSize(35,35)
	self.AvatarImage:SetSteamID(GAS:AccountIDToSteamID64(account_id), 32)
	self.AvatarImage:SetMouseInputEnabled(false)
	local this = self
	GAS.OfflinePlayerData:AccountID(account_id, function(success, data)
		if (not success) then
			this:SetText(GAS:AccountIDToSteamID(account_id))
		else
			this:SetText(data.nick)
		end
	end)
end

function PANEL:SetSteamID64(steamid64)
	print("SetSteamID64 deprecated", steamid64)
	return self:SetAccountID(GAS:SteamID64ToAccountID(steamid64))
end

function PANEL:OnCursorEntered()
	if (self.AccountID) then
		bVGUI.PlayerTooltip.Create({
			account_id = self.AccountID,
			focustip = bVGUI.L("right_click_to_focus"),
			copiedphrase = bVGUI.L("copied"),
			creator = self
		})
	end
end
function PANEL:OnCursorExited()
	if (self.AccountID) then
		bVGUI.PlayerTooltip.Close()
	end
end

derma.DefineControl("bVGUI.CategoriesItem", nil, PANEL, "DPanel")
--PATH lua/vgui/bvgui/checkbox.lua:
local PANEL = {}

local checked_mat = Material("vgui/bvgui/checked.png", "smooth")

function PANEL:Init()
	self:SetMouseInputEnabled(true)
	self:SetCursor("hand")
	self:SetSize(18,18)

	self.Checked = false
end

local checkbox_bg = Color(47,53,66)
local check_size = 12
function PANEL:Paint(w,h)
	draw.RoundedBox(4, 0, 0, w, h, checkbox_bg)

	if (self.CheckedIconOpacity) then
		self.CheckedIconOpacity:DoLerp()
		surface.SetMaterial(checked_mat)
		surface.SetDrawColor(255,255,255,self.CheckedIconOpacity:GetValue())
		surface.DrawTexturedRect(w / 2 - check_size / 2, h / 2 - check_size / 2, check_size, check_size)
	end
end

function PANEL:OnMouseReleased()
	if (not self.CheckedIconOpacity) then
		self.CheckedIconOpacity = bVGUI.Lerp(0,255,.5)
	end
	self:SetChecked(not self:GetChecked())
	if (self:GetChecked()) then
		GAS:PlaySound("btn_on")
		self.CheckedIconOpacity:SetTo(255)
	else
		GAS:PlaySound("btn_off")
		self.CheckedIconOpacity:SetTo(0)
	end
	if (self.OnChange) then
		self:OnChange()
	end
end

function PANEL:SetChecked(checked)
	if (not self.CheckedIconOpacity) then
		if (checked) then
			self.CheckedIconOpacity = bVGUI.Lerp(255,255,.5)
		else
			self.CheckedIconOpacity = bVGUI.Lerp(0,0,.5)
		end
	else
		if (checked) then
			self.CheckedIconOpacity:SetTo(255)
		else
			self.CheckedIconOpacity:SetTo(0)
		end
	end
	self.Checked = checked
end
function PANEL:GetChecked()
	return self.Checked
end

function PANEL:SetTooltip(text)
	self.Tooltip = text
end
function PANEL:OnCursorEntered()
	if (self.Tooltip) then
		bVGUI.CreateTooltip({
			VGUI_Element = self,
			Text = self.Tooltip
		})
	end
end
function PANEL:OnCursorExited()
	if (self.Tooltip) then
		bVGUI.DestroyTooltip()
	end
end

derma.DefineControl("bVGUI.Checkbox", nil, PANEL, "DPanel")
--PATH lua/vgui/bvgui/colormixer.lua:
local matGradient = Material( "vgui/gradient-u" )
local matGrid = Material( "gui/alpha_grid.png", "nocull" )

local PANEL = {}

function PANEL:Init()
	self.ColorMixer = vgui.Create("DColorMixer", self)
	self.ColorMixer:SetPalette(false)

	self.ColorMixer.HSV.Knob.Paint = nil 
	self.ColorMixer.HSV.PaintOver = function(s,w,h)
		self.GottenRGB = s:GetRGB()
		self.ColorContrast = bVGUI.TextColorContrast(self.GottenRGB)

		local x,y = s.Knob:GetPos()
		local ww,hh = s.Knob:GetSize()
		surface.SetDrawColor(bVGUI.COLOR_DARK_GREY)
		surface.DrawOutlinedRect(0,0,w,h)
		draw.NoTexture()

		surface.DrawPoly({
			{x=x,y=y},
			{x=x+ww,y=y},
			{x=x+math.ceil(ww/2),y=y+math.ceil(hh/2)},
		})
		surface.DrawRect(x,y-hh,ww,hh)

		surface.SetDrawColor(self.ColorContrast)
		surface.DrawRect(x+2,y-hh+2,ww-4,hh-4)

		surface.SetDrawColor(self.GottenRGB)
		surface.DrawRect(x+3,y-hh+3,ww-6,hh-6)
	end

	self.ColorMixer.colPrev = self.ColorMixer.WangsPanel:Add( "DPanel" )
	self.ColorMixer.colPrev:SetTall( 20 )
	self.ColorMixer.colPrev:Dock( TOP )
	self.ColorMixer.colPrev:DockMargin( 0, 4, 0, 0 )
	self.ColorMixer.colPrev.Paint = function(s,w,h)
		if !self.GottenRGB then return end
		
		surface.SetDrawColor(self.GottenRGB)
		surface.DrawRect(0,0,w,h)
		surface.SetDrawColor(self.ColorContrast)
		surface.DrawOutlinedRect(0,0,w,h)
	end

	function self.ColorMixer.Alpha:Paint(w, h)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetMaterial(matGrid)
		local size = 128
	
		for i = 0, math.ceil(h / size) do
			surface.DrawTexturedRect(w / 2 - size / 2, i * size, size, size)
		end
	
		surface.SetDrawColor(self.m_BarColor)
		surface.SetMaterial(matGradient)

		surface.DrawTexturedRect(0, 0, w, h)
		surface.DrawTexturedRect(0, 0, w, h)

		surface.SetDrawColor(0, 0, 0, 250)
		self:DrawOutlinedRect()
		surface.DrawRect(2, (1 - self.m_Value) * h - 3, w - 4, 6)

		surface.SetDrawColor(255, 255, 255, 250)
		surface.DrawRect(4, (1 - self.m_Value) * h - 1, w - 8, 2)
	end
	
	function self.ColorMixer.RGB:Paint(w, h)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetMaterial(self.Material)

		surface.DrawTexturedRect(0, 0, w, h)
		
		surface.SetDrawColor(0, 0, 0, 250)
		self:DrawOutlinedRect()
		surface.DrawRect(2, self.LastY - 3, w - 4, 6)
		
		surface.SetDrawColor(255, 255, 255, 250)
		surface.DrawRect(4, self.LastY - 1, w - 8, 2)
	end
end

function PANEL:SetColor(col)
	self.ColorMixer:SetColor(col)
end
function PANEL:GetColor()
	return self.ColorMixer:GetColor()
end

function PANEL:SetLabel(text)
	self.Label = vgui.Create("DLabel", self)
	self.Label:SetContentAlignment(4)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetText(text)
	self.Label:SizeToContentsX()
	self.Label:SetTall(21)
end

function PANEL:PerformLayout()
	self.ColorMixer:AlignBottom(0)
	if (IsValid(self.Label)) then
		self.ColorMixer:SetSize(self:GetTall() * 1.6, self:GetTall() - self.Label:GetTall())
	else
		self.ColorMixer:SetSize(self:GetTall() * 1.6, self:GetTall())
	end
end

derma.DefineControl("bVGUI.ColorMixer", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/bvgui/frame.lua:
bVGUI.Frames = {}

local voice_enum
local voice_key
local function GetVoiceKeyEnum()
	voice_key = input.LookupBinding("+voicerecord", true)
	if (voice_key) then
		for i,v in pairs(_G) do
			if (i:sub(1,4) == "KEY_") then
				if (input.GetKeyName(v) == voice_key) then
					voice_enum = v
					break
				end
			end
		end
	end
end
GetVoiceKeyEnum()
timer.Create("bVGUI.voicerecord_bind", 10, 0, function()
	if (voice_key ~= input.LookupBinding("+voicerecord", true)) then
		GetVoiceKeyEnum()
	end
end)

local PANEL = {}

function PANEL:OnKeyCodePressed(key_code)
	if (GAS and GAS.LocalConfig and GAS.LocalConfig.AllowVoiceChat == false) then return end
	if (voice_enum and key_code == voice_enum) then
		if (permissions and permissions.EnableVoiceChat) then
			permissions.EnableVoiceChat(true)
		else
			RunConsoleCommand("+voicerecord")
		end
	end
end
function PANEL:OnKeyCodeReleased(key_code)
	if (GAS and GAS.LocalConfig and GAS.LocalConfig.AllowVoiceChat == false) then return end
	if (voice_enum and key_code == voice_enum) then
		if (permissions and permissions.EnableVoiceChat) then
			permissions.EnableVoiceChat(false)
		else
			RunConsoleCommand("-voicerecord")
		end
	end
end

function PANEL:Init()
	table.insert(bVGUI.Frames, self)

	local this = self

	self:DockPadding(0, 24, 0, 0)
	self.lblTitle:SetVisible(false)
	self.btnClose:SetVisible(false)
	self.btnMaxim:SetVisible(false)
	self.btnMinim:SetVisible(false)

	self.ColorCycling = {}
	self.ColorCycling.IntendedColor = table.Copy(bVGUI.COLOR_GMOD_BLUE)
	self.ColorCycling.CurrentColor = table.Copy(bVGUI.COLOR_GMOD_BLUE)

	self.bVGUI_Toolbar = vgui.Create("DPanel", self)
	self.bVGUI_Toolbar:SetTall(24)
	self.bVGUI_Toolbar:SetCursor("sizeall")
	function self.bVGUI_Toolbar:OnMousePressed()
		if (this.Fullscreened ~= false or this:GetDraggable() == false) then return end
		this.Dragging = { gui.MouseX() - this.x, gui.MouseY() - this.y }
	end
	function self.bVGUI_Toolbar:OnMouseReleased()
		this.Dragging = nil
	end
	function self.bVGUI_Toolbar:Paint(w,h)
		surface.SetDrawColor(this.ColorCycling.CurrentColor)
		surface.DrawRect(0,0,w,h)

		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
		surface.DrawTexturedRect(0,0,w,h)
	end
	function self.bVGUI_Toolbar:PaintOver(w,h)
		if (this.DrawBorder ~= false) then
			surface.SetDrawColor(bVGUI.COLOR_BLACK)
			surface.DrawLine(0,h - 1,w,h - 1)
		end
	end

	self.MenuOpen = false
	self.bVGUI_MenuButton = vgui.Create("bVGUI.ToolbarButton_IMGText", self.bVGUI_Toolbar)
	self.bVGUI_MenuButton:Dock(LEFT)
	self.bVGUI_MenuButton:SetMaterial(bVGUI.ICON_MENU)
	self.bVGUI_MenuButton:SetHoverMaterial(bVGUI.ICON_MENU_INVERTED)
	self.bVGUI_MenuButton:SetText(self:GetTitle())
	self.bVGUI_MenuButton.bVGUI_Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 14))
	function self.bVGUI_MenuButton:DoClick()
		if (GAS and GAS.PlaySound) then GAS:PlaySound("btn_light") end
		if (this.MenuClicked) then
			this:MenuClicked()
		elseif (not IsValid(this.DermaMenu) and this.DermaMenuOptions) then
			this.DermaMenu = DermaMenu()
			this:DermaMenuOptions(this.DermaMenu)
			this.DermaMenu:Open(self:LocalToScreen(0,self:GetTall() - 1))
			function this.DermaMenu:OptionSelected()
				this.DermaMenu = nil
			end
		elseif (IsValid(this.DermaMenu)) then
			this.DermaMenu:Hide()
			this.DermaMenu:Remove()
			this.DermaMenu = nil
		elseif (this.DermaMenu ~= nil) then
			this.DermaMenu = nil
		end
	end

	self.bVGUI_CloseButton = vgui.Create("bVGUI.ToolbarButton_IMG", self.bVGUI_Toolbar)
	self.bVGUI_CloseButton:SetSize(20,24)
	self.bVGUI_CloseButton:Dock(RIGHT)
	self.bVGUI_CloseButton:SetMaterial(bVGUI.ICON_CLOSE)
	self.bVGUI_CloseButton:SetHoverMaterial(bVGUI.ICON_CLOSE_INVERTED)
	function self.bVGUI_CloseButton:DoClick()
		if (GAS and GAS.PlaySound) then GAS:PlaySound("btn_heavy") end
		this:Close()
	end

	self.Fullscreened = false
	self.bVGUI_FullscreenButton = vgui.Create("bVGUI.ToolbarButton_IMG", self.bVGUI_Toolbar)
	self.bVGUI_FullscreenButton:SetSize(24,24)
	self.bVGUI_FullscreenButton:Dock(RIGHT)
	self.bVGUI_FullscreenButton:SetMaterial(bVGUI.ICON_FULLSCREEN)
	self.bVGUI_FullscreenButton:SetHoverMaterial(bVGUI.ICON_FULLSCREEN_INVERTED)

	function self.bVGUI_FullscreenButton:DoClick()
		if (this.Fullscreened == false) then
			if (GAS and GAS.PlaySound) then GAS:PlaySound("jump") end

			this.Fullscreened = {this:GetWide(), this:GetTall()}
			this.bVGUI_Toolbar:SetCursor("arrow")

			this:Stop()
			this:SizeTo(ScrW() - (self.OffsetX or 0), ScrH(), 0.5, 0, 0.5)
			this:MoveTo(self.OffsetX or 0, 0, 0.5, 0, 0.5)
		else
			if (GAS and GAS.PlaySound) then GAS:PlaySound("delete") end

			this:Stop()
			this:MoveTo((ScrW() / 2) - (this.Fullscreened[1] / 2), (ScrH() / 2) - (this.Fullscreened[2] / 2), 0.5, 0, 0.5)
			this:SizeTo(this.Fullscreened[1], this.Fullscreened[2], 0.5, 0, 0.5)

			this.Fullscreened = false
			this.bVGUI_Toolbar:SetCursor("sizeall")
		end
		timer.Simple(0.5, function()
			if (IsValid(this)) then
				this:InvalidateLayout(true)
				local function recursive(children)
					for _,child in ipairs(children) do
						if (child.RerenderMarkups) then
							child:RerenderMarkups()
						end
						recursive(child:GetChildren())
					end
				end
				recursive(this:GetChildren())
			end
		end)
	end

	self.Pinned = false
	self.bVGUI_PinButton = vgui.Create("bVGUI.ToolbarButton_IMG", self.bVGUI_Toolbar)
	self.bVGUI_PinButton:SetSize(24,24)
	self.bVGUI_PinButton:Dock(RIGHT)
	self.bVGUI_PinButton:SetMaterial(bVGUI.ICON_PIN)
	self.bVGUI_PinButton:SetHoverMaterial(bVGUI.ICON_PIN_INVERTED)

	function self.bVGUI_PinButton:DoClick()
		self:TogglePin()
		if (GAS and GAS.PlaySound) then
			if (this.Pinned) then
				GAS:PlaySound("drip_up")
			else
				GAS:PlaySound("drip_down")
			end
		end
	end
	function self.bVGUI_PinButton:TogglePin()
		this.Pinned = not this.Pinned
		if (this.Pinned) then
			this:KillFocus()
			this:SetMouseInputEnabled(false)
			this:SetKeyboardInputEnabled(false)
			this:SetAlpha(200)

			gui.HideGameUI()
			timer.Simple(0, function()

				this.pin_overlay = vgui.Create("DPanel")
				this.pin_overlay:SetCursor("hand")
				this.pin_overlay:SetMouseInputEnabled(true)
				function this.pin_overlay:Paint(w,h)
					if (not IsValid(this)) then
						self:Remove()
						return
					end
					self:SetSize(this:GetSize())
					self:SetPos(this:GetPos())
					if (gui.IsGameUIVisible()) then
						bVGUI_GlobalPinned = nil
						for _,v in ipairs(bVGUI.Frames) do
							if (v.Pinned and IsValid(v.bVGUI_PinButton) and v.bVGUI_PinButton:IsVisible()) then
								v.bVGUI_PinButton:TogglePin()
							end
						end
					end
				end
				function this.pin_overlay:OnMouseReleased(m)
					self:Remove()
					this.bVGUI_PinButton:DoClick()

					for _,v in ipairs(bVGUI.Frames) do
						if (v ~= this and v.Pinned and IsValid(v.bVGUI_PinButton) and v.bVGUI_PinButton:IsVisible()) then
							v.bVGUI_PinButton:TogglePin()
						end
					end
				end

			end)

			for _,v in ipairs(bVGUI.Frames) do
				if (v ~= this and not v.Pinned and IsValid(v.bVGUI_PinButton) and v.bVGUI_PinButton:IsVisible()) then
					v.bVGUI_PinButton:TogglePin()
				end
			end
		else
			if (IsValid(this.pin_overlay)) then
				this.pin_overlay:Remove()
			end
			this:MakePopup()
			this:SetAlpha(255)
		end

		gui.EnableScreenClicker(false)

		if (this.Pinned) then
			if (not bVGUI_GlobalPinned) then
				bVGUI_GlobalPinned = true
				notification.AddLegacy(bVGUI.L("pin_tip"), NOTIFY_UNDO, 3)
			end
		else
			bVGUI_GlobalPinned = nil
		end

		if (this.Pinned and this.OnPinned) then
			this:OnPinned()
		elseif (not this.Pinned and this.OnUnpinned) then
			this:OnUnpinned()
		end
	end

	function self:OnChildAdded(child)
		child.IsDefaultChild = false
	end
end

function PANEL:OnClose()
	if (self.CloseFrames) then
		for v in pairs(self.CloseFrames) do
			if (IsValid(v)) then v:Close() end
		end
	end
	if (self.ClosePanels) then
		for v in pairs(self.ClosePanels) do
			if (IsValid(v)) then v:Remove() end
		end
	end
end

function PANEL:OnResize(w, h)

end

local drag_icon = Material("vgui/bvgui/drag.png", "smooth")
function PANEL:EnableUserResize()
	local this = self
	self.UserResize = vgui.Create("bVGUI.BlankPanel", self)
	self.UserResize:SetMouseInputEnabled(true)
	self.UserResize:SetCursor("sizenwse")
	self.UserResize:SetSize(18,18)
	self.UserResize:MoveToFront()
	function self.UserResize:OnMousePressed(m)
		self.Dragging = true
	end
	function self.UserResize:Think()
		if (self.Dragging == true) then
			if (input.IsMouseDown(MOUSE_LEFT)) then
				local x,y = gui.MousePos()
				if (not self.StartingCoords) then
					self.StartingCoords = {x,y}
				end
				if (not self.StartingSize) then
					self.StartingSize = {this:GetSize()}
				end

				local new_x, new_y = self.StartingSize[1] + (x - self.StartingCoords[1]), self.StartingSize[2] + (y - self.StartingCoords[2])
				this:OnResize(new_x, new_y)
				this:SetSize(math.max(new_x, this:GetMinWidth()), math.max(new_y, this:GetMinHeight()))
				this:InvalidateChildren(true)
			else
				self.StartingCoords = nil
				self.StartingSize = nil
				self.Dragging = false

				local function recursive(children)
					for _,child in ipairs(children) do
						if (child.RerenderMarkups) then
							child:RerenderMarkups()
						end
						recursive(child:GetChildren())
					end
				end
				recursive(this:GetChildren())
			end
		end
	end
	function self.UserResize:Paint(w,h)
		surface.SetDrawColor(255,255,255,255)
		surface.SetMaterial(drag_icon)
		local width,height = 12,12
		surface.DrawTexturedRect(w / 2 - width / 2, h / 2 - height / 2, width, height)
	end
end

function PANEL:ShowCloseButton(showclosebutton)
	self.bVGUI_CloseButton:SetVisible(showclosebutton)
end

function PANEL:ShowFullscreenButton(showfullscreenbutton)
	self.bVGUI_FullscreenButton:SetVisible(showfullscreenbutton)
end

function PANEL:ShowPinButton(showpinbutton)
	self.bVGUI_PinButton:SetVisible(showpinbutton)
end

function PANEL:SetDraggable(draggable)
	self.m_bDraggable = draggable
	if (draggable) then
		self.bVGUI_Toolbar:SetCursor("sizeall")
	else
		self.bVGUI_Toolbar:SetCursor("default")
	end
end

function PANEL:PaintOver(w,h)
	if (self.DrawBorder ~= false) then
		surface.SetDrawColor(bVGUI.COLOR_BLACK)
		surface.DrawOutlinedRect(0,0,w,h)
	end
end

function PANEL:PerformLayout(w, h)
	self.bVGUI_Toolbar:SetWide(self:GetWide())
	for _,v in pairs(self:GetChildren()) do
		v:InvalidateLayout(true)
	end
	if (IsValid(self.UserResize)) then
		self.UserResize:AlignRight(0)
		self.UserResize:AlignBottom(0)
	end
	if (self.PostPerformLayout) then
		self:PostPerformLayout(w, h)
	end
end

function PANEL:SetTitle(title)
	self.lblTitle:SetText(title)
	self.bVGUI_MenuButton:SetText(title)
end

local frame_bg = Color(30,34,42,250)
local blur = Material("pp/blurscreen")
function PANEL:Paint(w,h)
	if (self.DrawBlur == true) then
		local x,y = self:LocalToScreen(0,0)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetMaterial(blur)
		for i = -0.2, 2, 0.2 do
			blur:SetFloat("$blur", i * 1.0)
			blur:Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(-x,-y,ScrW(),ScrH())
		end

		surface.SetDrawColor(frame_bg)
		surface.DrawRect(0,0,w,h)
	else
		surface.SetDrawColor(30,34,42,253)
		surface.DrawRect(0,0,w,h)

		surface.SetDrawColor(255,255,255,210)
		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LARGE)
		surface.DrawTexturedRect(0,0,w,h)
	end

	local r = Lerp(0.01, self.ColorCycling.CurrentColor.r, self.ColorCycling.IntendedColor.r)
	local g = Lerp(0.01, self.ColorCycling.CurrentColor.g, self.ColorCycling.IntendedColor.g)
	local b = Lerp(0.01, self.ColorCycling.CurrentColor.b, self.ColorCycling.IntendedColor.b)
	if (self.ColorCycling.r_ceil) then r = bVGUI.CEIL(r) else r = bVGUI.FLOOR(r) end
	if (self.ColorCycling.g_ceil) then g = bVGUI.CEIL(g) else g = bVGUI.FLOOR(g) end
	if (self.ColorCycling.b_ceil) then b = bVGUI.CEIL(b) else b = bVGUI.FLOOR(b) end
	self.ColorCycling.CurrentColor.r = r
	self.ColorCycling.CurrentColor.g = g
	self.ColorCycling.CurrentColor.b = b
end
function PANEL:CycleColors(col)
	self.ColorCycling.r_ceil = col.r > self.ColorCycling.IntendedColor.r
	self.ColorCycling.g_ceil = col.g > self.ColorCycling.IntendedColor.g
	self.ColorCycling.b_ceil = col.b > self.ColorCycling.IntendedColor.b
	self.ColorCycling.IntendedColor = table.Copy(col)
end

derma.DefineControl("bVGUI.Frame", nil, PANEL, "DFrame")
--PATH lua/vgui/bvgui/horizontaldivider.lua:
local PANEL = {}

function PANEL:Init()
	self:SetMouseInputEnabled(true)
	self:SetCursor("sizewe")

	self.LeftWidth = 0
	self.MiddleWidth = 0
	self.RightWidth = 0
end

function PANEL:SetLeft(pnl)
	self.LeftPnl = pnl
	pnl:SetParent(self)
end

function PANEL:SetMiddle(pnl)
	self.MiddlePnl = pnl
	pnl:SetParent(self)
end

function PANEL:SetRight(pnl)
	self.RightPnl = pnl
	pnl:SetParent(self)
end

function PANEL:SetDividerWidth(w)
	self.DividerWidth = w
end

function PANEL:BalanceWidths()
	self.BalanceWidth = true
end

function PANEL:PerformLayout(w,h)
	if (self.BalanceWidth) then
		self.BalanceWidth = nil

		if (IsValid(self.MiddlePnl)) then
			self.LeftWidth   = (w - (self.DividerWidth * 2)) / 3
			self.MiddleWidth = (w - (self.DividerWidth * 2)) / 3
			self.RightWidth  = (w - (self.DividerWidth * 2)) / 3
		else
			self.LeftWidth   = (w - self.DividerWidth) / 2
			self.MiddleWidth = 0
			self.RightWidth  = (w - self.DividerWidth) / 2
		end
	end

	if (IsValid(self.LeftPnl)) then
		self.LeftPnl:SetSize(self.LeftWidth, h)
		self.LeftPnl:AlignLeft(0)
	end
	if (IsValid(self.MiddlePnl)) then
		self.MiddlePnl:SetSize(self.MiddleWidth, h)
		self.MiddlePnl:AlignLeft(self.LeftWidth + self.DividerWidth)
	end
	if (IsValid(self.RightPnl)) then
		self.RightPnl:SetSize(self.RightWidth, h)
		self.RightPnl:AlignRight(0)
	end
end

function PANEL:Paint(w,h)
	if (not IsValid(self.LeftPnl) or not IsValid(self.RightPnl)) then return end

	surface.SetDrawColor(51,80,114)
	surface.DrawRect(self.LeftWidth,0,self.DividerWidth,h)

	surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LARGE)
	surface.DrawTexturedRect(self.LeftWidth,0,self.DividerWidth,h)

	if (IsValid(self.MiddlePnl)) then
		surface.SetDrawColor(51,80,114)
		surface.DrawRect(w - self.RightWidth - self.DividerWidth,0,self.DividerWidth,h)

		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LARGE)
		surface.DrawTexturedRect(w - self.RightWidth - self.DividerWidth,0,self.DividerWidth,h)
	end
end

function PANEL:OnMousePressed(m)
	if (m == MOUSE_LEFT) then
		self.Dragging = true
	end
end
function PANEL:OnCursorMoved(x,y)
	local w,h = self:GetSize()
	if (self.Dragging) then
		
	end
end
function PANEL:OnMouseReleased(m)
	if (m == MOUSE_LEFT) then
		self.Dragging = nil
	end
end

derma.DefineControl("bVGUI.HorizontalDivider", nil, PANEL, "DHorizontalDivider")
--PATH lua/vgui/bvgui/renderscene.lua:
local IsInspecting = false

local LockView
local ViewOrigin, ViewAngle
local Velocity = Vector(0,0,0)
local CalcView_tbl = {}
hook.Add("CalcView", "bvgui_renderscene_CalcView", function(ply, origin, angles, fov)
	if (IsInspecting) then
		if (not ViewOrigin or not ViewAngle) then
			ViewOrigin, ViewAngle = origin, angles
		end
		CalcView_tbl.origin = ViewOrigin
		CalcView_tbl.angles = ViewAngle
	end

	if (GAS and GAS.Logging and GAS.Logging.Scenes) then
		if (IsInspecting) then
			GAS.Logging.Scenes.ViewOrigin = ViewOrigin
		else
			GAS.Logging.Scenes.ViewOrigin = nil
		end
	end

	if (IsInspecting) then return CalcView_tbl end
end)

local tr = { collisiongroup = COLLISION_GROUP_WORLD }
local function IsInWorld( pos )
	tr.start = pos
	tr.endpos = pos
	return util.TraceLine( tr ).HitWorld
end

hook.Add("CreateMove", "bvgui_renderscene_CreateMove", function(cmd)
	if (not IsInspecting) then
		LockView = nil
		Velocity.x, Velocity.y, Velocity.z = 0,0,0
		return
	end

	if (not LockView) then
		LockView = cmd:GetViewAngles()
	else
		cmd:SetViewAngles(LockView)
	end
	
	cmd:ClearMovement()

	local time = FrameTime()
   
	local sensitivity = 0.022
	ViewAngle:Normalize()
	ViewAngle.p = math.Clamp(ViewAngle.p + (cmd:GetMouseY() * sensitivity), -89, 89)
	ViewAngle.y = ViewAngle.y + (cmd:GetMouseX() * -1 * sensitivity)

	local NewViewOrigin = ViewOrigin + (Velocity * time)
   
	local add = Vector(0,0,0)
	local ang = ViewAngle
	if (cmd:KeyDown(IN_FORWARD)) then add = add + ang:Forward() end
	if (cmd:KeyDown(IN_BACK)) then add = add - ang:Forward() end
	if (cmd:KeyDown(IN_MOVERIGHT)) then add = add + ang:Right() end
	if (cmd:KeyDown(IN_MOVELEFT)) then add = add - ang:Right() end
	if (cmd:KeyDown(IN_JUMP)) then add = add + ang:Up() end
	if (cmd:KeyDown(IN_DUCK)) then add = add - ang:Up() end
   
	add = add:GetNormal() * time * 1000
	if (cmd:KeyDown(IN_SPEED)) then add = add * 2 end

	Velocity = Velocity * 0.95
	ViewOrigin = NewViewOrigin
   
	Velocity = Velocity + add

	cmd:ClearButtons()
end)

local function ResetNoDraw()
	for _,ent in ipairs(ents.GetAll()) do
		if (ent.bVGUI_RenderScene_SetNoDraw) then
			ent.bVGUI_RenderScene_SetNoDraw = nil
			ent:SetNoDraw(false)
		end
	end
end
local function SetNoDraw()
	for _,ent in ipairs(ents.GetAll()) do
		if (ent:GetNoDraw() == false and not ent.bVGUI_RenderScene_ForceDraw) then
			ent.bVGUI_RenderScene_SetNoDraw = true
			ent:SetNoDraw(true)
		end
	end
end
local function CheckNoDraw(ent)
	if (not IsValid(ent)) then return end
	if (IsInspecting) then
		if (ent:GetNoDraw() == false and not ent.bVGUI_RenderScene_ForceDraw) then
			ent.bVGUI_RenderScene_SetNoDraw = true
			ent:SetNoDraw(true)
		end
	else
		if (ent.bVGUI_RenderScene_SetNoDraw) then
			ent.bVGUI_RenderScene_SetNoDraw = nil
			ent:SetNoDraw(false)
		end
	end
end
local function KeepNoDraw(ent)
	CheckNoDraw(ent)
	CheckNoDraw(ent:GetParent())
end
hook.Add("NotifyShouldTransmit", "bvgui_renderscene_KeepNoDraw", KeepNoDraw)

local static = Material("vgui/bvgui/static.vtf")

local PANEL = {}

function PANEL:Init()
	local this = self

	local function find_dframe(pnl)
		if (IsValid(pnl.bVGUI_PinButton)) then
			return pnl
		elseif (IsValid(pnl:GetParent())) then
			return find_dframe(pnl:GetParent())
		end
	end
	self.PvPEventFrame = find_dframe(self:GetParent())

	self.Inspecting = false
	self.Rendering = false
	self.CanRender = true
	self.Origin = Vector(0,0,0)
	self.Angle = Angle(0,0,0)

	self:SetMouseInputEnabled(true)
	self:SetCursor("hand")

	self.RenderView = {
		origin = self.Origin,
		angles = self.Angle,
		drawviewmodel = false,
		fov = 120,
		bloomtone = false,
		aspectratio = 0
	}

	self.Toolbar = vgui.Create("bVGUI.BlankPanel", self)
	self.Toolbar:DockPadding(2,2,2,2)
	self.Toolbar:SetPos(5,5)
	function self.Toolbar:Paint(w,h)
		surface.SetDrawColor(47,79,115,255)
		surface.DrawRect(0,0,w,h)

		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
		surface.DrawTexturedRect(0,0,w,h)
	end

	self.InspectBtn = vgui.Create("DImageButton", self.Toolbar)
	self.InspectBtn:Dock(LEFT)
	self.InspectBtn:DockMargin(0,0,5,0)
	self.InspectBtn:SetSize(16,16)
	self.InspectBtn:SetImage("icon16/world.png")
	function self.InspectBtn:DoClick()
		if (IsInspecting and not this.Inspecting) then return end
		if (IsInspecting) then
			IsInspecting = false
			this.Inspecting = false
			if (ViewOrigin and ViewAngle) then
				this:SetOrigin(ViewOrigin)
				this:SetAngle(ViewAngle)
			end
			ResetNoDraw()

			this.PvPEventFrame:SetPos(this.PvPEventFrame.GAS_RenderScene_FramePosX, this.PvPEventFrame.GAS_RenderScene_FramePosY)
			for _,dframe in ipairs(bVGUI.Frames) do
				if (IsValid(dframe) and dframe.GAS_RenderScene_Hidden) then
					dframe:SetVisible(true)
				end
			end
		else
			ViewOrigin, ViewAngle = this.Origin, this.Angle

			SetNoDraw()

			this.PvPEventFrame.bVGUI_PinButton:TogglePin()
			this.PvPEventFrame.GAS_RenderScene_FramePosX, this.PvPEventFrame.GAS_RenderScene_FramePosY = this.PvPEventFrame:GetPos()
			this.PvPEventFrame:SetPos(ScrW() - this.PvPEventFrame:GetWide() - 20, ScrH() - this.PvPEventFrame:GetTall() - 20)
			for _,dframe in ipairs(bVGUI.Frames) do
				if (IsValid(dframe) and dframe ~= this.PvPEventFrame and dframe:IsVisible()) then
					dframe:SetVisible(false)
					dframe.GAS_RenderScene_Hidden = true
				end
			end

			IsInspecting = true
			this.Inspecting = true
		end
		GAS:PlaySound("jump")
	end
	bVGUI.AttachTooltip(self.InspectBtn, {Text = bVGUI.L("inspect")})

	local screenshot = vgui.Create("DImageButton", self.Toolbar)
	screenshot:Dock(LEFT)
	screenshot:SetSize(16,16)
	screenshot:DockMargin(0,0,5,0)
	screenshot:SetImage("icon16/camera.png")
	function screenshot:Capture()
		gui.HideGameUI()
		bVGUI.DestroyTooltip()

		timer.Simple(0, function()
			hook.Add("PostRender", "GAS_RenderScene_Screenshot", function()
				local img = render.Capture({
					format = "png",
					x = 0,
					y = 0,
					w = ScrW(),
					h = ScrH(),
					alpha = false
				})

				local name = "gas_scene_screenshot_" .. os.date("%d_%m_%Y_%H_%M_%S")
				local function screenshot_name(i)
					if (i == nil) then
						if (file.Exists(name, "DATA")) then
							return screenshot_name(2)
						else
							return name
						end
					else
						if (file.Exists(name .. "_" .. i, "DATA")) then
							return screenshot_name(i + 1)
						else
							return name .. "_" .. i
						end
					end
				end
				local screenshot_name = screenshot_name() .. ".png"
				file.Write(screenshot_name, img)

				hook.Remove("PostRender", "GAS_RenderScene_Screenshot")

				bVGUI.RichMessage({
					title = bVGUI.L("screenshot_saved"),
					button = bVGUI.L("ok"),
					textCallback = function(text)
						local full_path = "garrysmod/data/" .. screenshot_name

						text:InsertColorChange(255,255,255,255)
						local t = bVGUI.L("screenshot_saved_to")
						local s,e = t:find("%%s")
						text:AppendText(t:sub(1,s-1))

						text:InsertColorChange(0,255,255,255)
						text:InsertClickableTextStart("CopyFilePath")
						text:AppendText(full_path)
						text:InsertClickableTextEnd()

						text:InsertColorChange(255,255,255,255)
						text:AppendText(t:sub(e+1))

						function text:ActionSignal(signalName, signalValue)
							if (signalName == "TextClicked" and signalValue == "CopyFilePath") then
								GAS:SetClipboardText(full_path)
							end
						end
					end
				})

				if (IsValid(self) and IsValid(this) and this.Inspecting) then
					this.InspectBtn:DoClick()
				end

				GAS:PlaySound("success")
			end)
		end)
	end
	function screenshot:DoClick()
		if (this.Inspecting) then
			self:Capture()
		elseif (not IsInspecting) then
			this.InspectBtn:DoClick()
			self:Capture()
		end
	end
	bVGUI.AttachTooltip(screenshot, {Text = bVGUI.L("screenshot")})

	local reset = vgui.Create("DImageButton", self.Toolbar)
	reset:Dock(LEFT)
	reset:SetSize(16,16)
	reset:SetImage("icon16/arrow_refresh.png")
	function reset:DoClick()
		if (this.OriginalOrigin) then
			this:SetOrigin(Vector(this.OriginalOrigin.x, this.OriginalOrigin.y, this.OriginalOrigin.z))
		end
		if (this.OriginalAngles) then
			this:SetAngle(Angle(this.OriginalAngles.p, this.OriginalAngles.y, this.OriginalAngles.r))
		end
		GAS:PlaySound("delete")
	end
	bVGUI.AttachTooltip(reset, {Text = bVGUI.L("reset")})
end

function PANEL:OnRemove()
	if (self.Inspecting) then
		self.InspectBtn:DoClick()
	end
end

function PANEL:PerformLayout(w,h)
	self.Toolbar:SetSize(w - 10,20)
end

local click_to_render_font = bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 18)
function PANEL:Paint(w,h)
	if (not self.Rendering or IsInspecting) then
		surface.SetDrawColor(255,255,255)
		surface.SetMaterial(static)
		local d = math.max(w,h)
		surface.DrawTexturedRect((w - d) / 2,(h - d) / 2,d,d)

		surface.SetMaterial(bVGUI.MATERIAL_GRADIENT)
		surface.DrawTexturedRect(0,(((SysTime() % 5) / 5) * (h + 30)) - 30,w,30)

		if (self.CanRender and not IsInspecting) then
			draw.SimpleTextOutlined(bVGUI.L("click_to_render"), click_to_render_font, w / 2, (h - 20) / 2, bVGUI.COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, bVGUI.COLOR_BLACK)
		end
		if (self.Inspecting) then
			draw.SimpleTextOutlined(bVGUI.L("inspecting"), click_to_render_font, w / 2, (h - 20) / 2, bVGUI.COLOR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, bVGUI.COLOR_BLACK)
		elseif (not self.CanRender) then
			draw.SimpleTextOutlined(bVGUI.L("no_data"), click_to_render_font, w / 2, (h - 20) / 2, bVGUI.COLOR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, bVGUI.COLOR_BLACK)
		end
	else
		local x,y = self:LocalToScreen(0,0)
		self.RenderView.x, self.RenderView.y, self.RenderView.w, self.RenderView.h = x,y,w,h
		render.RenderView(self.RenderView)
	end

	surface.SetDrawColor(0,0,0)
	surface.DrawRect(0,0,5,h)
	surface.DrawRect(0,0,w,5)
	surface.DrawRect(w - 5,0,5,h)
	surface.DrawRect(0,h - 30,w,30)

	self.Toolbar:SetVisible(self.Rendering)
end

function PANEL:SetLabel(txt)
	self.Label = vgui.Create("DLabel", self)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetText(txt)
	self.Label:Dock(FILL)
	self.Label:DockMargin(0,0,0,7.5)
	self.Label:SetContentAlignment(2)
end

function PANEL:SetOrigin(origin)
	self.Origin = origin
	self.RenderView.origin = self.Origin
	if (not self.OriginalOrigin) then
		self.OriginalOrigin = Vector(origin.x,origin.y,origin.z)
	end
end

function PANEL:SetAngle(ang)
	self.Angle = ang
	self.RenderView.angles = self.Angle
	if (not self.OriginalAngles) then
		self.OriginalAngles = Angle(ang.p,ang.y,ang.r)
	end
end

function PANEL:SetRendering(rendering)
	self.Rendering = rendering
	if (self.Rendering and self.OnStartRender) then
		self:OnStartRender()
	elseif (not self.Rendering and self.OnEndRender) then
		self:OnEndRender()
	end

	if (not self.Rendering and self.Inspecting) then
		self.Inspecting = false
		IsInspecting = false
	end
end

function PANEL:SetCanRender(can_render)
	self.CanRender = can_render
	if (not self.CanRender) then
		self:SetCursor("none")
	else
		self:SetCursor("hand")
	end
	if (self.Rendering) then
		self:SetRendering(false)
	end
end

function PANEL:DoClick()
	if (not self.Rendering) then
		if (not self.CanRender) then
			GAS:PlaySound("error")
		else
			self:SetRendering(true)
			GAS:PlaySound("btn_on")
			notification.AddLegacy(bVGUI.L("right_click_to_stop_rendering"), NOTIFY_HINT, 2)
		end
	else
		self.InspectBtn:DoClick()
	end
end

function PANEL:DoRightClick()
	if (self.Rendering) then
		if (self.Inspecting) then
			self.InspectBtn:DoClick()
		end
		self:SetRendering(false)
		GAS:PlaySound("btn_off")
	end
end

function PANEL:OnMousePressed(m)
	self.m_pressing = m
end
function PANEL:OnMouseReleased(m)
	if (self.m_pressing == m) then
		if (m == MOUSE_LEFT) then
			self:DoClick()
		elseif (m == MOUSE_RIGHT) then
			self:DoRightClick()
		end
	end
	self.m_pressing = nil
end

derma.DefineControl("bVGUI.RenderScene", nil, PANEL, "bVGUI.BlankPanel")
--PATH addons/sl_utils/lua/vgui/stackerpreseteditor.lua:
--[[--------------------------------------------------------------------------
-- 	Namespace Tables
--------------------------------------------------------------------------]]--

local PANEL = {}

--[[--------------------------------------------------------------------------
-- 	Localized Functions & Variables
--------------------------------------------------------------------------]]--

local vgui = vgui
local pairs = pairs
local AccessorFunc = AccessorFunc
local GetConVarString = GetConVarString

--[[--------------------------------------------------------------------------
--	Namespace Functions
--------------------------------------------------------------------------]]--

AccessorFunc( PANEL, "m_ConCommands", "ConCommands" )

--[[--------------------------------------------------------------------------
--
--	PANEL:Add()
--
--]]--
function PANEL:Add()
	if ( not self.m_ConVars ) then return end
	
	local ToName = self.txtName:GetValue()
	if ( not ToName or ToName == "" ) then return end
	
	-- Todo, Handle name collision
	local tabValues = {}
	
	for k, v in pairs( self.m_ConVars ) do
		tabValues[ v.CCmd ] = GetConVarString( v.CVar )
	end
		
	presets.Add( self.m_strType, ToName, tabValues )
	self:Update()
	self.PresetList:SelectByName( ToName )
	self.txtName:SetText( "" )
	
	if ( self.m_PresetControl ) then
		self.m_PresetControl:Update()
	end
end

vgui.Register( "StackerPresetEditor", PANEL, "PresetEditor" )
--PATH gamemodes/mangarp/gamemode/config/config.lua:
--[[-------------------------------------------------------------------------
DarkRP config settings.
-----------------------------------------------------------------------------

This is the settings file of DarkRP. Every DarkRP setting is listed here.

Warning:
If this file is missing settings (because of e.g. an update), DarkRP will assume default values for these settings.
Don't worry about updating this file. If a new setting is added you can manually add them to this file.
---------------------------------------------------------------------------]]


--[[
Toggle settings.
Set to true or false.
]]

-- voice3D - Enable/disable 3DVoice is enabled.
GM.Config.voice3D                       = true
-- AdminsCopWeapons - Enable/disable admins spawning with cop weapons.
GM.Config.AdminsCopWeapons              = false
-- adminBypassJobCustomCheck - Enable/disable whether an admin can force set a job with whenever customCheck returns false.
GM.Config.adminBypassJobRestrictions    = true
-- Acts/Taunts - Enable/disable Taunts (e.g. act salute)
GM.Config.allowActs                     = false
-- allow people getting their own custom jobs.
GM.Config.allowjobswitch                = true
-- allowrpnames - Allow Players to Set their RP names using the /rpname command.
GM.Config.allowrpnames                  = true
-- allowsprays - Enable/disable the use of sprays on the server.
GM.Config.allowsprays                   = true
-- allowvehicleowning - Enable/disable whether people can own vehicles.
GM.Config.allowvehicleowning            = true
-- allowvnocollide - Enable/disable the ability to no-collide a vehicle (for security).
GM.Config.allowvnocollide               = false
-- alltalk - Enable for global chat, disable for local chat.
GM.Config.alltalk                       = false
-- antimultirun - Disallow people joining your server(s) twice on the same account.
GM.Config.antimultirun                  = true
-- autovehiclelock - Enable/Disable automatic locking of a vehicle when a player exits it.
GM.Config.autovehiclelock               = false
-- babygod - people spawn godded (prevent spawn killing).
GM.Config.babygod                       = true
-- canforcedooropen - whether players can force an unownable door open with lockpick or battering ram or w/e.
GM.Config.canforcedooropen              = true
-- chatsounds - sounds are played when some things are said in chat.
GM.Config.chatsounds                    = true
-- chiefjailpos - Allow the Chief to set the jail positions.
GM.Config.chiefjailpos                  = true
-- cit_propertytax - Enable/disable property tax that is exclusive only for citizens.
GM.Config.cit_propertytax               = false
-- copscanunfreeze - Enable/disable the ability of cops to unfreeze other people's props.
GM.Config.copscanunfreeze               = true
-- copscanunweld - Enable/disable the ability of cops to unweld other people's props.
GM.Config.copscanunweld                 = false
-- cpcanarrestcp - Allow/Disallow CPs to arrest other CPs.
GM.Config.cpcanarrestcp                 = true
-- currencyLeft - The position of the currency symbol. true for left, false for right.
GM.Config.currencyLeft                  = true
-- customjobs - Enable/disable the /job command (personalized job names).
GM.Config.customjobs                    = true
-- customspawns - Enable/disable whether custom spawns should be used.
GM.Config.customspawns                  = true
-- deathblack - Whether or not a player sees black on death.
GM.Config.deathblack                    = false
-- showdeaths - Display kill information in the upper right corner of everyone's screen.
GM.Config.showdeaths                    = true
-- deadtalk - Enable/disable whether people talk and use commands while dead.
GM.Config.deadtalk                      = true
-- deadvoice - Enable/disable whether people talk through the microphone while dead.
GM.Config.deadvoice                     = true
-- deathpov - Enable/disable whether people see their death in first person view.
GM.Config.deathpov                      = false
-- decalcleaner - Enable/Disable clearing every player's decals.
GM.Config.decalcleaner                  = false
-- disallowClientsideScripts - Clientside scripts can be very useful for customizing the HUD or to aid in building. This option bans those scripts.
GM.Config.disallowClientsideScripts     = false
-- doorwarrants - Enable/disable Warrant requirement to enter property.
GM.Config.doorwarrants                  = true
-- dropmoneyondeath - Enable/disable whether people drop money on death.
GM.Config.dropmoneyondeath              = false
-- droppocketarrest - Enable/disable whether people drop the stuff in their pockets when they get arrested.
GM.Config.droppocketarrest              = false
-- droppocketdeath - Enable/disable whether people drop the stuff in their pockets when they die.
GM.Config.droppocketdeath               = true
-- dropweapondeath - Enable/disable whether people drop their current weapon when they die.
GM.Config.dropweapondeath               = false
-- Whether players can drop the weapons they spawn with.
GM.Config.dropspawnedweapons            = false
-- dynamicvoice - Enable/disable whether only people in the same room as you can hear your mic.
GM.Config.dynamicvoice                  = true
-- earthquakes - Enable/disable earthquakes.
GM.Config.earthquakes                   = false
-- enablebuypistol - Turn /buy on of off.
GM.Config.enablebuypistol               = true
-- enforceplayermodel - Whether or not to force players to use their role-defined character models.
GM.Config.enforceplayermodel            = true
-- globalshow - Whether or not to display player info above players' heads in-game.
GM.Config.globalshow                    = false
-- ironshoot - Enable/disable whether people need iron sights to shoot.
GM.Config.ironshoot                     = true
-- showjob - Whether or not to display a player's job above their head in-game.
GM.Config.showjob                       = true
-- letters - Enable/disable letter writing / typing.
GM.Config.letters                       = true
-- license - Enable/disable People need a license to be able to pick up guns.
GM.Config.license                       = false
-- lockdown - Enable/Disable initiating lockdowns for mayors.
GM.Config.lockdown                      = true
-- lockpickfading - Enable/disable the lockpicking of fading doors.
GM.Config.lockpickfading                = true
-- logging - Enable/disable logging everything that happens.
GM.Config.logging                       = true
-- lottery - Enable/disable creating lotteries for mayors.
GM.Config.lottery                       = true
-- showname - Whether or not to display a player's name above their head in-game.
GM.Config.showname                      = true
-- showhealth - Whether or not to display a player's health above their head in-game.
GM.Config.showhealth                    = true
-- needwantedforarrest - Enable/disable Cops can only arrest wanted people.
GM.Config.needwantedforarrest           = false
-- noguns - Enabling this feature bans Guns and Gun Dealers.
GM.Config.noguns                        = false
-- norespawn - Enable/Disable that people don't have to respawn when they change job.
GM.Config.norespawn                     = false
-- keepPickedUp - Enable/Disable keeping picked up weapons when switching jobs.
GM.Config.keepPickedUp                  = false
-- instantjob - Enable/Disable instantly respawning when norespawn is false
GM.Config.instantjob                    = false
-- npcarrest - Enable/disable arresting npc's.
GM.Config.npcarrest                     = true
-- ooc - Whether or not OOC tags are enabled.
GM.Config.ooc                           = true
-- propertytax - Enable/disable property tax.
GM.Config.propertytax                   = false
-- proppaying - Whether or not players should pay for spawning props.
GM.Config.proppaying                    = false
-- propspawning - Enable/disable props spawning. Applies to admins too.
GM.Config.propspawning                  = true
-- removeclassitems - Enable/disable shipments/microwaves/etc. removal when someone changes team.
GM.Config.removeclassitems              = true
-- removeondisconnect - Enable/disable shipments/microwaves/etc. removal when someone disconnects.
GM.Config.removeondisconnect            = true
-- respawninjail - Enable/disable whether people can respawn in jail when they die.
GM.Config.respawninjail                 = true
-- restrictallteams - Enable/disable Players can only be citizen until an admin allows them.
GM.Config.restrictallteams              = false
-- restrictbuypistol - Enabling this feature makes /buy available only to Gun Dealers.
GM.Config.restrictbuypistol             = false
-- restrictdrop - Enable/disable restricting the weapons players can drop. Setting this to true disallows weapons from shipments from being dropped.
GM.Config.restrictdrop                  = false
-- revokeLicenseOnJobChange - Whether licenses are revoked when a player changes jobs.
GM.Config.revokeLicenseOnJobChange      = true
-- shouldResetLaws - Enable/Disable resetting the laws back to the default law set when the mayor changes.
GM.Config.shouldResetLaws               = false
-- strictsuicide - Whether or not players should spawn where they suicided.
GM.Config.strictsuicide                 = false
-- telefromjail - Enable/disable teleporting from jail.
GM.Config.telefromjail                  = true
-- teletojail - Enable/disable teleporting to jail.
GM.Config.teletojail                    = true
-- unlockdoorsonstart - Enable/Disable unlocking all doors on map start.
GM.Config.unlockdoorsonstart            = false
-- voiceradius - Enable/disable local voice chat.
GM.Config.voiceradius                   = true
-- tax - Whether players pay taxes on their wallets.
GM.Config.wallettax                     = false
-- wantedrespawn - Whether players remain wanted on respawn.
GM.Config.wantedrespawn                 = false
-- wantedsuicide - Enable/Disable suiciding while you are wanted by the police.
GM.Config.wantedsuicide                 = false
-- realisticfalldamage - Enable/Disable dynamic fall damage. Setting mp_falldamage to 1 will over-ride this.
GM.Config.realisticfalldamage           = true
-- printeroverheat - Whether the default money printer can overheat on its own.
GM.Config.printeroverheat               = true
-- weaponCheckerHideDefault - Hide default weapons when checking weapons.
GM.Config.weaponCheckerHideDefault      = true
-- weaponCheckerHideNoLicense - Hide weapons that do not require a license.
GM.Config.weaponCheckerHideNoLicense    = false

--[[
Value settings
]]
-- adminnpcs - Whether or not NPCs should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminnpcs                     = 1
-- adminsents - Whether or not SENTs should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminsents                    = 1
-- adminvehicles - Whether or not vehicles should be admin only. 0 = everyone, 1 = admin or higher, 2 = superadmin or higher, 3 = rcon only
GM.Config.adminvehicles                 = 1
-- adminweapons - Who can spawn weapons: 0: admins only, 1: supadmins only, 2: no one, 3: everyone
GM.Config.adminweapons                  = 0
-- arrestspeed - Sets the max arrest speed.
GM.Config.arrestspeed                   = 120
-- babygodtime - How long the babygod lasts.
GM.Config.babygodtime                   = 5
-- chatsoundsdelay - How long to wait before letting a player emit a sound from their chat again.
-- Leave this on at least a few seconds to prevent people from spamming sounds. Set to 0 to disable.
GM.Config.chatsoundsdelay               = 5
-- deathfee - the amount of money someone drops when dead.
GM.Config.deathfee                      = 30
-- decaltimer - Sets the time to clear clientside decals (in seconds).
GM.Config.decaltimer                    = 120
-- demotetime - Number of seconds before a player can rejoin a team after demotion from that team.
GM.Config.demotetime                    = 120
-- doorcost - Sets the cost of a door.
GM.Config.doorcost                      = 10000
-- entremovedelay - how long to wait before removing a bought entity after disconnect.
GM.Config.entremovedelay                = 0
-- gunlabweapon - The weapon that the gunlab spawns.
GM.Config.gunlabweapon                  = "weapon_p2282"
-- jailtimer - Sets the jailtimer (in seconds).
GM.Config.jailtimer                     = 120
-- lockdowndelay - The amount of time a mayor must wait before starting the next lockdown.
GM.Config.lockdowndelay                 = 120
-- maxadvertbillboards - The maximum number of /advert billboards a player can place.
GM.Config.maxadvertbillboards           = 3
-- maxCheques - The maximum number of cheques someone can write
GM.Config.maxCheques                    = 5
-- maxdoors - Sets the max amount of doors one can own.
GM.Config.maxdoors                      = 20
-- maxdrugs - Sets max drugs.
GM.Config.maxdrugs                      = 2
-- maxfoods - Sets the max food cartons per Microwave owner.
GM.Config.maxfoods                      = 2
-- maxfooditems - Sets the max amount of food items a player can buy from the F4 menu.
GM.Config.maxfooditems                  = 20
-- maxlawboards - The maximum number of law boards the mayor can place.
GM.Config.maxlawboards                  = 2
-- maxletters - Sets max letters.
GM.Config.maxletters                    = 10
-- maxlotterycost - Maximum payment the mayor can set to join a lottery.
GM.Config.maxlotterycost                = 250
-- maxvehicles - Sets how many vehicles one can buy.
GM.Config.maxvehicles                   = 5
-- microwavefoodcost - Sets the sale price of Microwave Food.
GM.Config.microwavefoodcost             = 30
-- gunlabguncost - Sets the initial price of a gun from a gunlab. Note that the
-- gunlab owner can change this price.
GM.Config.gunlabguncost                 = 200
-- druglabdrugcost - Sets the initial price of drugs from a drugs lab. Note that
-- the drugs lab owner can change this price.
GM.Config.druglabdrugcost               = 100
-- minlotterycost - Minimum payment the mayor can set to join a lottery.
GM.Config.minlotterycost                = 30
-- Money packets will get removed if they don't get picked up after a while. Set to 0 to disable.
GM.Config.moneyRemoveTime               = 600
-- mprintamount - Value of the money printed by the money printer.
GM.Config.mprintamount                  = 250
-- normalsalary - Sets the starting salary for newly joined players.
GM.Config.normalsalary                  = 10000
-- npckillpay - Sets the money given for each NPC kill.
GM.Config.npckillpay                    = 10
-- paydelay - Sets how long it takes before people get salary.
GM.Config.paydelay                      = 160
-- pocketitems - Sets the amount of objects the pocket can carry.
GM.Config.pocketitems                   = 10
-- pricecap - The maximum price of items (using /price).
GM.Config.pricecap                      = 500
-- pricemin - The minimum price of items (using /price).
GM.Config.pricemin                      = 50
-- propcost - How much prop spawning should cost (prop paying must be enabled for this to have an effect).
GM.Config.propcost                      = 10
-- quakechance - Chance of an earthquake happening.
GM.Config.quakechance                   = 4000
-- respawntime - Minimum amount of seconds a player has to wait before respawning.
GM.Config.respawntime                   = 1
-- changejobtime - Minimum amount of seconds a player has to wait before changing job.
GM.Config.changejobtime                 = 10
-- runspeed - Sets the max running speed.
GM.Config.runspeed                      = 240
-- runspeed - Sets the max running speed for CP teams.
GM.Config.runspeedcp                    = 255
-- searchtime - Number of seconds for which a search warrant is valid.
GM.Config.searchtime                    = 30
-- ShipmentSpawnTime - Antispam time between spawning shipments.
GM.Config.ShipmentSpamTime              = 3
-- shipmenttime - The number of seconds it takes for a shipment to spawn.
GM.Config.shipmentspawntime             = 10
-- startinghealth - the health when you spawn.
GM.Config.startinghealth                = 100
-- startingmoney - your wallet when you join for the first time.
GM.Config.startingmoney                 = 500000
-- stunstickdamage - amount of damage the stunstick will do to entities.
-- When between 0 and 1, the damage is relative, where 1 takes the entire health of the entity.
-- When above 1, the damage is absolute
GM.Config.stunstickdamage               = 1000
-- vehiclecost - Sets the cost of a vehicle (To own it).
GM.Config.vehiclecost                   = 40
-- wallettaxmax - Maximum percentage of tax to be paid.
GM.Config.wallettaxmax                  = 5
-- wallettaxmin - Minimum percentage of tax to be paid.
GM.Config.wallettaxmin                  = 1
-- wallettaxtime - Time in seconds between taxing players. Requires server restart.
GM.Config.wallettaxtime                 = 600
-- wantedtime - Number of seconds for which a player is wanted for.
GM.Config.wantedtime                    = 120
-- walkspeed - Sets the max walking speed.
GM.Config.walkspeed                     = 160
-- falldamagedamper - The damper on realistic fall damage. Default is 15. Decrease this for more damage.
GM.Config.falldamagedamper              = 15
-- falldamageamount - The base damage taken from falling for static fall damage. Default is 10.
GM.Config.falldamageamount              = 10
-- printeroverheatchance - The likelyhood of a printer overheating. The higher this number, the less likely (minimum 3, default 22).
GM.Config.printeroverheatchance         = 22
-- printerreward - Reward for destroying a money printer.
GM.Config.printerreward                 = 950

--[[---------------------------------------------------------------------------
Chat distance settings
Distance is in source units (similar to inches)
---------------------------------------------------------------------------]]
GM.Config.talkDistance    = 250
GM.Config.whisperDistance = 90
GM.Config.yellDistance    = 550
GM.Config.meDistance      = 250
GM.Config.voiceDistance   = 550

--[[---------------------------------------------------------------------------
Other settings
---------------------------------------------------------------------------]]

-- The classname of money packets. Use this to create your own money entity!
-- Note: the money packet must support the "Setamount" method (or the amount DTVar).
GM.Config.MoneyClass = "spawned_money"
-- In case you do wish to keep the default money, but change the model, this option is the way to go:
GM.Config.moneyModel = "models/props/cs_assault/money.mdl"
-- You can set your own, custom sound to be played for all players whenever a lockdown is initiated.
-- Note: Remember to include the folder where the sound file is located.
GM.Config.lockdownsound = "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav"

-- The skin DarkRP uses. Set to "default" to use the GMod default derma theme.
GM.Config.DarkRPSkin = "DarkRP"
GM.Config.currency = "₩"
GM.Config.currencyThousandSeparator = ","
GM.Config.chatCommandPrefix = "/"
GM.Config.F1MenuHelpPage = "https://darkrp.miraheze.org/wiki/Main_Page"
GM.Config.F1MenuHelpPageTitle = "DarkRP Wiki"

-- The sound that plays when you get a DarkRP notification
GM.Config.notificationSound = "buttons/lightswitch2.wav"

-- Put Steam ID's and ranks in this list, and the players will have that rank when they join.
GM.Config.DefaultPlayerGroups = {
    ["STEAM_0:0:11111111"] = "superadmin",
    ["STEAM_0:0:11111111"] = "admin",
}

-- Custom modules in this addon that are disabled.
GM.Config.DisabledCustomModules = {
    ["hudreplacement"] = false,
    ["extraf4tab"] = false,
}

-- The list of weapons that players are not allowed to drop. Items set to true are not allowed to be dropped.
GM.Config.DisallowDrop = {
    ["arrest_stick"] = true,
    ["door_ram"] = true,
    ["gmod_camera"] = true,
    ["gmod_tool"] = true,
    ["keys"] = true,
    ["lockpick"] = true,
    ["med_kit"] = true,
    ["pocket"] = true,
    ["stunstick"] = true,
    ["unarrest_stick"] = true,
    ["weapon_keypadchecker"] = true,
    ["weapon_physcannon"] = true,
    ["weapon_physgun"] = true,
    ["weaponchecker"] = true,
    ["mad_epee1"] = true,
    ["mad_epee2"] = true,
    ["mad_epee3"] = true,
    ["mad_epee4"] = true,
    ["mad_epee5"] = true,
    ["mad_epee6"] = true,
    ["mad_epee7"] = true,
    ["mad_epee8"] = true,
    ["mad_epee9"] = true,
    ["mad_epee10"] = true,
    ["mad_epee11"] = true,
    ["mad_epee12"] = true,
    ["mad_epee13"] = true,
    ["mad_epee14"] = true,
    ["mad_epee15"] = true,
    ["mad_epee16"] = true,
    ["mad_epee17"] = true,
    ["mad_epee18"] = true,
    ["mad_dague1"] = true,
    ["mad_dague2"] = true,
    ["mad_dague3"] = true,
    ["mad_dague4"] = true,
    ["mad_dague5"] = true,
    ["mad_dague6"] = true,
    ["mad_dague7"] = true,
    ["mad_dague8"] = true,
    ["mad_dague9"] = true,
    ["mad_dague10"] = true,
    ["mad_dague11"] = true,
    ["mad_dague12"] = true,
    ["mad_dague13"] = true,
    ["mad_dague14"] = true,
    ["mad_dague15"] = true,
    ["mad_dague16"] = true,
    ["mad_dague17"] = true,
    ["mad_dague18"] = true,
    ["mad_baton1"] = true,
    ["mad_baton2"] = true,
    ["mad_baton3"] = true,
    ["mad_baton4"] = true,
    ["mad_baton5"] = true,
    ["mad_baton6"] = true,
    ["mad_baton7"] = true,
    ["mad_baton8"] = true,
    ["mad_baton9"] = true,
    ["mad_baton10"] = true,
    ["mad_baton11"] = true,
    ["mad_baton12"] = true,
    ["mad_baton13"] = true,
    ["mad_baton14"] = true,
    ["mad_baton15"] = true,
    ["mad_baton16"] = true,
    ["mad_baton17"] = true,
    ["mad_baton18"] = true,
    ["mad_marteau1"] = true,
    ["mad_marteau2"] = true,
    ["mad_marteau3"] = true,
    ["mad_marteau4"] = true,
    ["mad_marteau5"] = true,
    ["mad_marteau6"] = true,
    ["mad_marteau7"] = true,
    ["mad_marteau8"] = true,
    ["mad_marteau9"] = true,
    ["mad_marteau10"] = true,
    ["mad_marteau11"] = true,
    ["mad_marteau12"] = true,
    ["mad_marteau13"] = true,
    ["mad_marteau14"] = true,
    ["mad_marteau15"] = true,
    ["mad_marteau16"] = true,
    ["mad_marteau17"] = true,
    ["mad_marteau18"] = true,
    ["mad_corpsacorps"] = true,
    ["mad_asso_detecteur"] = true,
}

-- The list of weapons people spawn with.
GM.Config.DefaultWeapons = {
    "keys",
    "weapon_physcannon",
    "gmod_camera",
    "aphone",
}

-- Override categories.
-- NOTE: categories are to be set in the "category" field of the custom jobs/shipments/entities/ammo/pistols/vehicles.
-- Use this only to override the categories of _default_ things.
-- This will NOT work for your own custom stuff.
-- Make sure the category is created in the darkrp_customthings/categories.lua, otherwise it won't work!
GM.Config.CategoryOverride = {
    jobs = {
        ["Citizen"]                             = "Citizens",
        ["Hobo"]                                = "Citizens",
        ["Gun Dealer"]                          = "Citizens",
        ["Medic"]                               = "Citizens",
        ["Civil Protection"]                    = "Civil Protection",
        ["Gangster"]                            = "Gangsters",
        ["Mob boss"]                            = "Gangsters",
        ["Civil Protection Chief"]              = "Civil Protection",
        ["Mayor"]                               = "Civil Protection",
    },
    entities = {
        ["Drug lab"]                            = "Other",
        ["Money printer"]                       = "Other",
        ["Gun lab"]                             = "Other",

    },
    shipments = {
        ["AK47"]                                = "Rifles",
        ["MP5"]                                 = "Rifles",
        ["M4"]                                  = "Rifles",
        ["Mac 10"]                              = "Other",
        ["Pump shotgun"]                        = "Shotguns",
        ["Sniper rifle"]                        = "Snipers",

    },
    weapons = {
        ["Desert eagle"]                        = "Pistols",
        ["Fiveseven"]                           = "Pistols",
        ["Glock"]                               = "Pistols",
        ["P228"]                                = "Pistols",
    },
    vehicles = {}, -- There are no default vehicles.
    ammo = {
        ["Pistol ammo"]                         = "Other",
        ["Shotgun ammo"]                        = "Other",
        ["Rifle ammo"]                          = "Other",
    },
}

-- The list of weapons admins spawn with, in addition to the default weapons, a job's weapons and GM.Config.AdminsCopWeapons.
GM.Config.AdminWeapons = {
    "weapon_physgun",
    "gmod_tool",
}

-- These are the default laws, they're unchangeable in-game.
GM.Config.DefaultLaws = {
    "Do not attack other citizens except in self-defence.",
    "Do not steal or break into people's homes.",
    "Money printers/drugs are illegal.",
}

GM.Config.PocketBlacklist = {
    ["fadmin_jail"] = true,
    ["meteor"] = true,
    ["door"] = true,
    ["func_"] = true,
    ["player"] = true,
    ["beam"] = true,
    ["worldspawn"] = true,
    ["env_"] = true,
    ["path_"] = true,
    ["prop_physics"] = true,
    ["money_printer"] = true,
    ["gunlab"] = true,
    ["prop_dynamic"] = true,
    ["prop_vehicle_prisoner_pod"] = true,
    ["keypad_wire"] = true,
    ["gmod_button"] = true,
    ["gmod_rtcameraprop"] = true,
    ["gmod_cameraprop"] = true,
    ["gmod_dynamite"] = true,
    ["gmod_thruster"] = true,
    ["gmod_light"] = true,
    ["gmod_lamp"] = true,
    ["gmod_emitter"] = true,
}

-- These weapons are classed as 'legal' in the weapon checker and are not stripped when confiscating weapons.
-- This setting is used IN ADDITION to GM.Config.weaponCheckerHideDefault and GM.Config.weaponCheckerHideNoLicense.
-- You should use the former if you want to class the default weapons (GM.Config.DefaultWeapons and, if admin, GM.Config.AdminWeapons) and a player's job weapons as legal.
-- The latter takes GM.NoLicense weapons as legal (see licenseweapons.lua).
-- The format of this config is similar to GM.Config.DisallowDrop.
GM.Config.noStripWeapons = {

}

-- The entities listed here will not be removed when a player changes their job.
-- This only applies when removeclassitems is set to true.
-- Note: entities will only be removed when the player changes to a job that is not allowed to have the entity.
GM.Config.preventClassItemRemoval = {
    ["gunlab"] = false,
    ["microwave"] = false,
    ["spawned_shipment"] = false,
}

-- Properties set to true are allowed to be used. Values set to false or are missing from this list are blocked.
GM.Config.allowedProperties = {
    remover = true,
    ignite = false,
    extinguish = true,
    keepupright = true,
    gravity = true,
    collision = true,
    skin = true,
    bodygroups = true,
}

--[[---------------------------------------------------------------------------
F4 menu
---------------------------------------------------------------------------]]
-- hide the items that you can't buy and the jobs you can't get (instead of graying them out).
-- this option hides items when you don't have enough money, when the maximum is reached for a job or any other reason.
GM.Config.hideNonBuyable = false

-- Hide only the items that you have the wrong job for (or for which the customCheck says no).
-- When you set this option to true and hideNonBuyable to false, you WILL see e.g. items that are too expensive for you to buy.
-- but you won't see gundealer shipments when you have the citizen job.
GM.Config.hideTeamUnbuyable = true

--[[---------------------------------------------------------------------------
AFK module
---------------------------------------------------------------------------]]
-- The time of inactivity before being demoted.
GM.Config.afkdemotetime = 600
-- Prevent people from spamming AFK.
GM.Config.AFKDelay = 300

--[[---------------------------------------------------------------------------
Hitmenu module
---------------------------------------------------------------------------]]
-- The minimum price for a hit.
GM.Config.minHitPrice = 200
-- The maximum price for a hit.
GM.Config.maxHitPrice = 50000
-- The minimum distance between a hitman and his customer when they make the deal.
GM.Config.minHitDistance = 150
-- The text that tells the player he can press use on the hitman to request a hit.
GM.Config.hudText = "I am a hitman.\nPress E on me to request a hit!"
-- The text above a hitman when he's got a hit.
GM.Config.hitmanText = "Hit\naccepted!"
-- The cooldown time for a hit target (so they aren't spam killed).
GM.Config.hitTargetCooldown = 120
-- How long a customer has to wait to be able to buy another hit (from the moment the hit is accepted).
GM.Config.hitCustomerCooldown = 240

--[[---------------------------------------------------------------------------
Hungermod module
---------------------------------------------------------------------------]]
-- hungerspeed <Amount> - Set the rate at which players will become hungry (2 is the default).
GM.Config.hungerspeed = 0
-- starverate <Amount> - How much health that is taken away every second the player is starving  (3 is the default).
GM.Config.starverate = 3

--PATH gamemodes/mangarp/gamemode/libraries/fn.lua:
/*---------------------------------------------------------------------------
Functional library

by FPtje Atheos
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
Function currying
    Take a function with n parameters.
    Currying is the procedure of storing k < n parameters "in the function"
     in such a way that the remaining function can be called with n - k parameters

    Example:
    DebugPrint = fp{print, "[DEBUG]"}
    DebugPrint("TEST")
    > [DEBUG] TEST
---------------------------------------------------------------------------*/
function fp(tbl)
    local func = tbl[1]

    return function(...)
        local fnArgs = {}
        local arg = {...}
        local tblN = table.maxn(tbl)

        for i = 2, tblN do fnArgs[i - 1] = tbl[i] end
        for i = 1, table.maxn(arg) do fnArgs[tblN + i - 1] = arg[i] end

        return func(unpack(fnArgs, 1, table.maxn(fnArgs)))
    end
end

local unpack = unpack
local table = table
local pairs = pairs
local ipairs = ipairs
local error = error
local math = math
local select = select
local type = type
local _G = _G
local fp = fp


module("fn")

/*---------------------------------------------------------------------------
Parameter manipulation
---------------------------------------------------------------------------*/
Id = function(...) return ... end

Flip = function(f)
    if not f then error("not a function") end
    return function(b, a, ...)
        return f(a, b, ...)
    end
end

-- Definition from http://lua-users.org/wiki/CurriedLua
ReverseArgs = function(...)

   --reverse args by building a function to do it, similar to the unpack() example
   local function reverse_h(acc, v, ...)
      if select('#', ...) == 0 then
         return v, acc()
      else
         return reverse_h(function () return v, acc() end, ...)
      end
   end

   -- initial acc is the end of the list
   return reverse_h(function () return end, ...)
end

/*---------------------------------------------------------------------------
Misc functions
---------------------------------------------------------------------------*/
-- function composition
do
    local function comp_h(a, b, ...)
        if b == nil then return a end
        b = comp_h(b, ...)
        return function(...)
            return a(b(...))
        end
    end
    Compose = function(funcs, ...)
        if type(funcs) == "table" then
            return comp_h(unpack(funcs))
        else
            return comp_h(funcs, ...)
        end
    end
end

_G.fc = Compose

-- Definition from http://lua-users.org/wiki/CurriedLua
Curry = function(func, num_args)
    if not num_args then error("Missing argument #2: num_args") end
    if not func then error("Function does not exist!", 2) end
    -- helper
    local function curry_h(argtrace, n)
        if n == 0 then
            -- reverse argument list and call function
            return func(ReverseArgs(argtrace()))
        else
            -- "push" argument (by building a wrapper function) and decrement n
            return function(x)
                return curry_h(function() return x, argtrace() end, n - 1)
            end
        end
   end

   -- no sense currying for 1 arg or less
   if num_args > 1 then
      return curry_h(function() return end, num_args)
   else
      return func
   end
end

-- Thanks Lexic!
Partial = function(func, ...)
    local args = {...}
    return function(...)
        return func(unpack(table.Add( args, {...})))
    end
end

Apply = function(f, ...) return f(...) end

Const = function(a, b) return a end
Until = function(cmp, fn, val)
    if cmp(val) then
        return val
    end
    return Until(cmp, fn, fn(val))
end

Seq = function(f, x) f(x) return x end

GetGlobalVar = function(key) return _G[key] end

/*---------------------------------------------------------------------------
Mathematical operators and functions
---------------------------------------------------------------------------*/
Add = function(a, b) return a + b end
Sub = function(a, b) return a - b end
Mul = function(a, b) return a * b end
Div = function(a, b) return a / b end
Mod = function(a, b) return a % b end
Neg = function(a)    return -a    end

Eq  = function(a, b) return a == b end
Neq = function(a, b) return a ~= b end
Gt  = function(a, b) return a > b  end
Lt  = function(a, b) return a < b  end
Gte = function(a, b) return a >= b end
Lte = function(a, b) return a <= b end

Succ = Compose{Add, 1}
Pred = Compose{Flip(Sub), 1}
Even = Compose{fp{Eq, 0}, fp{Flip(Mod), 2}}
Odd  = Compose{Not, Even}

/*---------------------------------------------------------------------------
Functional logical operators and conditions
---------------------------------------------------------------------------*/
FAnd = function(fns)
    return function(...)
        local val
        for _, f in pairs(fns) do
            val = {f(...)}
            if not val[1] then return unpack(val) end
        end
        if val then return unpack(val) end
    end
end

FOr = function(fns)
    return function(...)
        local val
        for _, f in pairs(fns) do
            val = {f(...)}
            if val[1] then return unpack(val) end
        end
        return false, unpack(val, 2)
    end
end

Not = function(x) return not x end

If = function(f, Then, Else)
    return function(x)
        if f(x) then
            return Then
        else
            return Else
        end
    end
end

/*---------------------------------------------------------------------------
List operations
---------------------------------------------------------------------------*/
Map = function(f, xs)
    for k, v in pairs(xs) do
        xs[k] = f(v)
    end
    return xs
end

Append = function(xs, ys)
    return table.Add(xs, ys)
end

Filter = function(f, xs)
    local res = {}
    for k, v in pairs(xs) do
        if f(v) then res[k] = v end
    end
    return res
end

ForEach = function(f, xs)
    for k, v in pairs(xs) do
        local val = f(k, v)
        if val ~= nil then return val end
    end
end

Head = function(xs)
    return table.GetFirstValue(xs)
end

Last = function(xs)
    return xs[#xs] or table.GetLastValue(xs)
end

Tail = function(xs)
    table.remove(xs, 1)
    return xs
end

Init = function(xs)
    xs[#xs] = nil
    return xs
end

GetValue = function(i, xs)
    return xs[i]
end

Null = function(xs)
    for _ in pairs(xs) do
        return false
    end
    return true
end

Length = function(xs)
    return #xs
end

Index = function(xs, i)
    return xs[i]
end

Reverse = function(xs)
    local res = {}
    for i = #xs, 1, -1 do
        res[#xs - i + 1] = xs[i]
    end
    return res
end

/*---------------------------------------------------------------------------
Folds
---------------------------------------------------------------------------*/
Foldr = function(func, val, xs)
    for i = #xs, 1, -1 do
        val = func(xs[i], val)
    end

    return val
end

Foldl = function(func, val, xs)
    for _, v in ipairs(xs) do
        val = func(val, v)
    end

    return val
end

And = function(xs)
    for _, v in pairs(xs) do
        if v ~= true then return false end
    end
    return true
end

Or = function(xs)
    for _, v in pairs(xs) do
        if v == true then return true end
    end
    return false
end

Any = function(func, xs)
    for _, v in pairs(xs) do
        if func(v) == true then return true end
    end
    return false
end

All = function(func, xs)
    for _, v in pairs(xs) do
        if func(v) ~= true then return false end
    end
    return true
end

Sum = _G.fp{Foldr, Add, 0}

Product = _G.fp{Foldr, Mul, 1}

Concat = _G.fp{Foldr, Append, {}}

Maximum = _G.fp{Foldl, math.Max, -math.huge}

Minimum = _G.fp{Foldl, math.Min, math.huge}

Snd = _G.fp{select, 2}

Thrd = _G.fp{select, 3}

--PATH gamemodes/mangarp/gamemode/modules/jobs/sh_interface.lua:
DarkRP.hookStub{
    name = "OnPlayerChangedTeam",
    description = "When your team (job) is changed.",
    parameters = {
        {
            name = "ply",
            description = "The player that changed team. Clientside this hook is only called for the LocalPlayer.",
            type = "Player"
        },
        {
            name = "before",
            description = "The team before the change.",
            type = "number"
        },
        {
            name = "after",
            description = "The team after the change.",
            type = "number"
        }
    },
    returns = {

    }
}

--PATH gamemodes/mangarp/gamemode/modules/hitmenu/sh_interface.lua:
DarkRP.PLAYER.isHitman = DarkRP.stub{
    name = "isHitman",
    description = "Whether this player is a hitman.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a hitman.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.hasHit = DarkRP.stub{
    name = "hasHit",
    description = "Whether this hitman has a hit.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player has a hit.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getHitTarget = DarkRP.stub{
    name = "getHitTarget",
    description = "Get the target of a hitman.",
    parameters = {
    },
    returns = {
        {
            name = "target",
            description = "The target of the hit.",
            type = "Player"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getHitPrice = DarkRP.stub{
    name = "getHitPrice",
    description = "Get the price the hitman demands for his work.",
    parameters = {
    },
    returns = {
        {
            name = "price",
            description = "The price of the next hit.",
            type = "number"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.addHitmanTeam = DarkRP.stub{
    name = "addHitmanTeam",
    description = "Make this team a hitman.",
    parameters = {
        {
            name = "team number",
            description = "The number of the team (e.g. TEAM_MOB)",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getHitmanTeams = DarkRP.stub{
    name = "getHitmanTeams",
    description = "Get all the hitman teams.",
    parameters = {
    },
    returns = {
        {
            name = "tbl",
            description = "A table in which the keys are TEAM_ numbers and the values are just true.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "canRequestHit",
    description = "Whether someone can request a hit.",
    parameters = {
        {
            name = "hitman",
            description = "The hitman performing the hit",
            type = "Player"
        },
        {
            name = "customer",
            description = "The customer for the current hit.",
            type = "Player"
        },
        {
            name = "target",
            description = "The target of the current hit",
            type = "Player"
        },
        {
            name = "price",
            description = "The agreed upon price.",
            type = "number"
        }
    },
    returns = {
        {
            name = "canRequest",
            description = "A yes or no as to whether the hit can be requested.",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when they can't request the hit.",
            type = "string"
        },
        {
            name = "price",
            description = "An override for the price of the hit.",
            type = "number"
        }
    }
}

DarkRP.hookStub{
    name = "onHitAccepted",
    description = "When a hitman accepts a hit.",
    parameters = {
        {
            name = "hitman",
            description = "The hitman performing the hit.",
            type = "Player"
        },
        {
            name = "target",
            description = "The target of the current hit.",
            type = "Player"
        },
        {
            name = "customer",
            description = "The customer of the current hit.",
            type = "Player"
        }
    },
    returns = {

    }
}

DarkRP.hookStub{
    name = "onHitCompleted",
    description = "When a hitman finishes a hit.",
    parameters = {
        {
            name = "hitman",
            description = "The hitman performing the hit.",
            type = "Player"
        },
        {
            name = "target",
            description = "The target of the current hit.",
            type = "Player"
        },
        {
            name = "customer",
            description = "The customer of the current hit.",
            type = "Player"
        }
    },
    returns = {

    }
}

DarkRP.hookStub{
    name = "onHitFailed",
    description = "When a hit fails for some reason.",
    parameters = {
        {
            name = "hitman",
            description = "The hitman performing the hit.",
            type = "Player"
        },
        {
            name = "target",
            description = "The target of the current hit.",
            type = "Player"
        },
        {
            name = "reason",
            description = "why the hit failed.",
            type = "string"
        }
    },
    returns = {

    }
}

--PATH gamemodes/mangarp/gamemode/modules/base/cl_interface.lua:
DarkRP.PLAYER.isInRoom = DarkRP.stub{
    name = "isInRoom",
    description = "Whether the player is in the same room as the LocalPlayer.",
    parameters = {},
    returns = {
        {
            name = "inRoom",
            description = "Whether the player is in the same room.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.deLocalise = DarkRP.stub{
    name = "deLocalise",
    description = "Makes sure the string will not be localised when drawn or printed.",
    parameters = {
        {
            name = "text",
            description = "The text to delocalise.",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "text",
            description = "The delocalised text.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.textWrap = DarkRP.stub{
    name = "textWrap",
    description = "Wrap a text around when reaching a certain width.",
    parameters = {
        {
            name = "text",
            description = "The text to wrap.",
            type = "string",
            optional = false
        },
        {
            name = "font",
            description = "The font of the text.",
            type = "string",
            optional = false
        },
        {
            name = "width",
            description = "The maximum width in pixels.",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "text",
            description = "The wrapped string.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.setPreferredJobModel = DarkRP.stub{
    name = "setPreferredJobModel",
    description = "Set the model preferred by the player (if the job allows multiple models).",
    parameters = {
        {
            name = "teamNr",
            description = "The team number of the job.",
            type = "number",
            optional = false
        },
        {
            name = "model",
            description = "The preferred model for the job.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getPreferredJobModel = DarkRP.stub{
    name = "getPreferredJobModel",
    description = "Get the model preferred by the player (if the job allows multiple models).",
    parameters = {
        {
            name = "teamNr",
            description = "The team number of the job.",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "model",
            description = "The preferred model for the job.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "teamChanged",
    description = "When your team is changed.",
    deprecated = "Use the OnPlayerChangedTeam hook instead.",
    parameters = {
        {
            name = "before",
            description = "The team before the change.",
            type = "number"
        },
        {
            name = "after",
            description = "The team after the change.",
            type = "number"
        }
    },
    returns = {

    }
}

--PATH gamemodes/mangarp/gamemode/modules/tipjar/cl_frame.lua:
local updateModel, getModelValue, onModelUpdate =
    DarkRP.tipJarUIModel.updateModel,
    DarkRP.tipJarUIModel.getModelValue,
    DarkRP.tipJarUIModel.onModelUpdate


--[[-------------------------------------------------------------------------
Donation amount entry
---------------------------------------------------------------------------]]
local DONATE_ENTRY = {}

function DONATE_ENTRY:Init()
    self.BaseClass.Init(self)

    self:SetNumeric(true)
    self:SetSize(290, 70)
    self:SetFont("HUDNumber5")
    self:SetText("")

    onModelUpdate("amount", function(new, _, src)
        if not IsValid(self) or src == self then return end

        local pos = self:GetCaretPos()
        self:SetText(new)
        self:SetCaretPos(math.min(pos, string.len(new)))
    end)

    onModelUpdate("lastTipAmount", function()
        self:SelectAllText()
        self:RequestFocus()
    end)
end

function DONATE_ENTRY:CheckNumeric(value)
    if DarkRP.toInt(value) then return false end

    return true
end

function DONATE_ENTRY:OnChange()
    local value = DarkRP.toInt(self:GetText())

    if not value then return end

    updateModel("amount", value, self)
end

function DONATE_ENTRY:OnEnter()
    updateModel("frameVisible", false)
    updateModel("lastTipAmount", getModelValue("amount"))
end

derma.DefineControl("DarkRP_TipJar_DONATE_ENTRY", "", DONATE_ENTRY, "DTextEntry")

local DONATE_BUTTON = {}

function DONATE_BUTTON:Init()
    self.BaseClass.Init(self)

    self:SetSize(290, 80)
    self:SetText("")

    self.donateLabel = vgui.Create("DLabel", self)
    self.donateLabel:SetFont("HUDNumber5")
    self.donateLabel:SetText(DarkRP.getPhrase("Donate"))
    self.donateLabel:SizeToContents()
    self.donateLabel:SetPos(50, 10)
    self.donateLabel:CenterHorizontal()

    self.amountLabel = vgui.Create("DLabel", self)
    self.amountLabel:SetFont("HUDNumber5")
    self.amountLabel:SetPos(50, 40)

    onModelUpdate("amount", function(new)
        if not IsValid(self) then return end

        self.amountLabel:SetText(DarkRP.formatMoney(new))
        self.amountLabel:SizeToContents()
        self.amountLabel:CenterHorizontal()
    end)
end

function DONATE_BUTTON:DoClick()
    -- updateModel("frameVisible", false)
    updateModel("lastTipAmount", getModelValue("amount"))
end

derma.DefineControl("DarkRP_TipJar_DONATE_BUTTON", "", DONATE_BUTTON, "DButton")


local DONATE_LIST_ITEM = {}

function DONATE_LIST_ITEM:Init()
    self:SetSize(470, 25)
    self:SetPaintBackground(false)

    self.textL = vgui.Create("DLabel", self)
    self.textL:SetFont("DarkRPHUD2")
    self.textL:Dock(LEFT)

    self.textR = vgui.Create("DLabel", self)
    self.textR:SetFont("DarkRPHUD2")
    self.textR:DockMargin(5, 5, 20, 5)
    self.textR:Dock(RIGHT)

    self.donatedColor = Color(50, 130, 50)
    self.activeColor = Color(180, 180, 180)
    self.moneyColor = Color(50, 130, 50)
end

function DONATE_LIST_ITEM:SetActive(name, amount)
    self.textL:SetText(name)
    self.textL:SetTextColor(self.activeColor)
    self.textL:SizeToContents()

    self.textR:SetText(amount)
    self.textR:SetTextColor(self.activeColor)
    self.textR:SizeToContents()
end

function DONATE_LIST_ITEM:SetDonated(name, amount)
    self.textL:SetText(name)
    self.textL:SetTextColor(self.donatedColor)
    self.textL:SizeToContents()

    self.textR:SetText(amount)
    self.textR:SetTextColor(self.moneyColor)
    self.textR:SizeToContents()
end

derma.DefineControl("DarkRP_TipJar_DONATE_LIST_ITEM", "", DONATE_LIST_ITEM, "DPanel")


local DONATE_LIST = {}

function DONATE_LIST:Init()
    self.activeLines = {}
    self.donatedLines = {}

    self:SetSize(480, 465)

    self:SetBackgroundColor(color_transparent)
    self:EnableVerticalScrollbar()
    self:SetSpacing(10)
    self.VBar.Paint = fn.Id
    self.VBar.btnUp.Paint = fn.Id
    self.VBar.btnDown.Paint = fn.Id


    onModelUpdate("activeDonationUpdate", function()
        local tipjar = getModelValue("tipjar")

        if not IsValid(self) then return end
        if not IsValid(tipjar) then return end

        self:RebuildLines(tipjar)
    end)

    onModelUpdate("donatedUpdate", function()
        local tipjar = getModelValue("tipjar")

        if not IsValid(self) then return end
        if not IsValid(tipjar) then return end

        self:RebuildLines(tipjar)

        self:PerformLayout()
        self.VBar:SetScroll(math.huge)
    end)
end

function DONATE_LIST:AddActiveLine(name, amount)
    local line = vgui.Create("DarkRP_TipJar_DONATE_LIST_ITEM", self)
    line:SetActive(name, amount)
    self:AddItem(line)

    table.insert(self.activeLines, line)
end

function DONATE_LIST:AddDonatedLine(name, amount)
    local line = vgui.Create("DarkRP_TipJar_DONATE_LIST_ITEM", self)
    line:SetDonated(name, amount)
    self:AddItem(line)

    table.insert(self.donatedLines, line)
end

function DONATE_LIST:ClearLines()
    for _, line in ipairs(self.activeLines) do
        line:Remove()
    end

    for _, line in ipairs(self.donatedLines) do
        line:Remove()
    end

    table.Empty(self.activeLines)
    table.Empty(self.donatedLines)
end

function DONATE_LIST:RebuildLines(tipjar)
    self:ClearLines()

    for _, donation in ipairs(tipjar.madeDonations) do
        self:AddDonatedLine(donation.name, DarkRP.formatMoney(donation.amount))
    end

    for ply, amount in pairs(tipjar.activeDonations) do
        -- Don't show the owner looking at this page
        if ply == tipjar:Getowning_ent() then continue end

        self.activeLines[ply:Nick()] = DarkRP.formatMoney(amount)
    end

    for name, amount in SortedPairs(self.activeLines) do
        self:AddActiveLine(name, amount)
    end
end

derma.DefineControl("DarkRP_TipJar_DONATE_LIST", "", DONATE_LIST, "DPanelList")


--[[-------------------------------------------------------------------------
Main frame
---------------------------------------------------------------------------]]
local FRAME = {}

function FRAME:Init()
    self:SetTitle("Tipping jar")
    self:SetSize(800, 500)
    self:Center()
    self:SetVisible(true)
    self:MakePopup()
    self:SetDeleteOnClose(false)

    self.donateEntry = vgui.Create("DarkRP_TipJar_DONATE_ENTRY", self)
    self.donateEntry:SetPos(10, 175)

    self.donateButton = vgui.Create("DarkRP_TipJar_DONATE_BUTTON", self)
    self.donateButton:SetPos(10, 245)

    self.donateList = vgui.Create("DarkRP_TipJar_DONATE_LIST", self)
    self.donateList:SetPos(310, 25)


    self:SetSkin(GAMEMODE.Config.DarkRPSkin)
end

function FRAME:OnClose()
    updateModel("frameVisible", false)
end

function FRAME:Think()
    local tipJar = getModelValue("tipjar")

    if not IsValid(tipJar) or
       tipJar:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100 * 100 then
        updateModel("frameVisible", false)
   end
end

derma.DefineControl("DarkRP_TipJar_FRAME", "", FRAME, "DFrame")

onModelUpdate("frameVisible", function(visible)
    local tipjar = getModelValue("tipjar")
    if not IsValid(tipjar) then return end

    if not getModelValue("frame") then
        if not visible then return end

        updateModel("frame", vgui.Create("DarkRP_TipJar_FRAME"))
    end

    local frame = getModelValue("frame")

    frame:SetVisible(visible)

    if visible then
        updateModel("amount", 0)
        frame.donateEntry:SelectAllText()
        frame.donateEntry:RequestFocus()

        local disable = getModelValue("isOwner")
        frame.donateEntry:SetDisabled(disable)
        frame.donateButton:SetDisabled(disable)
    end
end)

function DarkRP.tipJarUI(tipjar)
    updateModel("tipjar", tipjar)
    updateModel("isOwner", tipjar:Getowning_ent() == LocalPlayer())
    updateModel("amount", 0)
    updateModel("frameVisible", true)
end

--PATH gamemodes/mangarp/gamemode/modules/money/sh_money.lua:
local pMeta = FindMetaTable("Player")
local entMeta = FindMetaTable("Entity")

function pMeta:canAfford(amount)
    if not amount or self.DarkRPUnInitialized then return false end
    return math.floor(amount) >= 0 and (self:getDarkRPVar("money") or 0) - math.ceil(amount) >= 0
end

function entMeta:isMoneyBag()
    return self.IsSpawnedMoney or self:GetClass() == GAMEMODE.Config.MoneyClass
end

--PATH gamemodes/mangarp/gamemode/modules/hitmenu/cl_init.lua:
local localplayer
local hudText
local textCol1, textCol2 = Color(0, 0, 0, 200), Color(128, 30, 30, 255)
local plyMeta = FindMetaTable("Player")
local activeHitmen = {}
local postPlayerDraw
local minHitDistanceSqr = GM.Config.minHitDistance * GM.Config.minHitDistance

--[[---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------]]
function plyMeta:drawHitInfo()
    activeHitmen[self] = true

    hook.Add("PostPlayerDraw", "drawHitInfo", postPlayerDraw)
end

function plyMeta:stopHitInfo()
    activeHitmen[self] = nil
    if table.IsEmpty(activeHitmen) then
        hook.Remove("PostPlayerDraw", "drawHitInfo")
    end
end

--[[---------------------------------------------------------------------------
Hooks
---------------------------------------------------------------------------]]
function DarkRP.hooks:onHitAccepted(hitman, target, customer)
    if not IsValid(hitman) then return end
    hitman:drawHitInfo()
end

function DarkRP.hooks:onHitCompleted(hitman, target, customer)
    if not IsValid(hitman) then return end
    hitman:stopHitInfo()
end

function DarkRP.hooks:onHitFailed(hitman, target, reason)
    if not IsValid(hitman) then return end
    hitman:stopHitInfo()
end

hook.Add("EntityRemoved", "hitmenu", function(ent)
    activeHitmen[ent] = nil
end)

hook.Add("HUDPaint", "DrawHitOption", function()
    localplayer = localplayer or LocalPlayer()
    hudText = hudText or GAMEMODE.Config.hudText
    local x, y
    local ply = localplayer:GetEyeTrace().Entity

    if IsValid(ply) and ply:IsPlayer() and ply:isHitman() and not ply:hasHit() and localplayer:GetPos():DistToSqr(ply:GetPos()) < minHitDistanceSqr then
        x, y = ScrW() / 2, ScrH() / 2 + 30

        draw.DrawNonParsedText(hudText, "Roboto20", x + 1, y + 1, textCol1, 1)
        draw.DrawNonParsedText(hudText, "Roboto20", x, y, textCol2, 1)
    end

    if localplayer:isHitman() and localplayer:hasHit() and IsValid(localplayer:getHitTarget()) then
        x, y = chat.GetChatBoxPos()
        local text = DarkRP.getPhrase("current_hit", localplayer:getHitTarget():Nick())
        draw.DrawNonParsedText(text, "HUDNumber5", x + 1, y + 1, textCol1, 0)
        draw.DrawNonParsedText(text, "HUDNumber5", x, y, textCol2, 0)
    end
end)

local lastKeyPress = 0
hook.Add("KeyPress", "openHitMenu", function(ply, key)
    if key ~= IN_USE or lastKeyPress > CurTime() - 0.2 then return end
    lastKeyPress = CurTime()
    localplayer = localplayer or LocalPlayer()
    local hitman = localplayer:GetEyeTrace().Entity

    if not IsValid(hitman) or not hitman:IsPlayer() or not hitman:isHitman() or localplayer:GetPos():DistToSqr(hitman:GetPos()) > minHitDistanceSqr then return end

    local canRequest, message = hook.Call("canRequestHit", DarkRP.hooks, hitman, ply, nil, hitman:getHitPrice())

    if not canRequest then
        GAMEMODE:AddNotify(DarkRP.getPhrase("cannot_request_hit", message or ""), 1, 4)
        surface.PlaySound("buttons/lightswitch2.wav")
        return
    end

    DarkRP.openHitMenu(hitman)
end)

hook.Add("InitPostEntity", "HitmanMenu", function()
    for _, v in ipairs(player.GetAll()) do
        if IsValid(v) and v:isHitman() and v:hasHit() then
            v:drawHitInfo()
        end
    end
end)

function postPlayerDraw(ply)
    if not activeHitmen[ply] then return end
    local pos, ang = ply:GetShootPos(), ply:EyeAngles()
    ang.p = 0
    ang:RotateAroundAxis(ang:Up(), 90)
    ang:RotateAroundAxis(ang:Forward(), 90)

    cam.Start3D2D(pos, ang, 0.3)
        draw.DrawNonParsedText(GAMEMODE.Config.hitmanText, "Roboto20", 1, -100, textCol1, 1)
        draw.DrawNonParsedText(GAMEMODE.Config.hitmanText, "Roboto20", 0, -101, textCol2, 1)
    cam.End3D2D()
end

--[[---------------------------------------------------------------------------
Networking
---------------------------------------------------------------------------]]
net.Receive("onHitAccepted", function(len)
    hook.Call("onHitAccepted", DarkRP.hooks, net.ReadEntity(), net.ReadEntity(), net.ReadEntity())
end)

net.Receive("onHitCompleted", function(len)
    hook.Call("onHitCompleted", DarkRP.hooks, net.ReadEntity(), net.ReadEntity(), net.ReadEntity())
end)

net.Receive("onHitFailed", function(len)
    hook.Call("onHitFailed", DarkRP.hooks, net.ReadEntity(), net.ReadEntity(), net.ReadString())
end)

--PATH gamemodes/mangarp/gamemode/modules/fspectate/sh_init.lua:
if not CAMI then return end

CAMI.RegisterPrivilege{
    Name = "FSpectate",
    MinAccess = "admin"
}

CAMI.RegisterPrivilege{
    Name = "FSpectateTeleport",
    MinAccess = "admin"
}

--PATH gamemodes/mangarp/gamemode/modules/fpp/pp/sh_cppi.lua:
CPPI = CPPI or {}
CPPI.CPPI_DEFER = 102112 --\102\112 = fp
CPPI.CPPI_NOTIMPLEMENTED = 7080 --\70\80 = FP

function CPPI:GetName()
    return "Falco's prop protection"
end

function CPPI:GetVersion()
    return "universal.1"
end

function CPPI:GetInterfaceVersion()
    return 1.3
end

function CPPI:GetNameFromUID(uid)
    return CPPI.CPPI_NOTIMPLEMENTED
end

local PLAYER = FindMetaTable("Player")
function PLAYER:CPPIGetFriends()
    if not self.Buddies then return CPPI.CPPI_DEFER end
    local FriendsTable = {}

    for k, v in pairs(self.Buddies) do
        if not table.HasValue(v, true) then continue end -- not buddies in anything
        table.insert(FriendsTable, k)
    end

    return FriendsTable
end

local ENTITY = FindMetaTable("Entity")
function ENTITY:CPPIGetOwner()
    local Owner = FPP.entGetOwner(self)
    if not IsValid(Owner) or not Owner:IsPlayer() then return SERVER and Owner or nil, self.FPPOwnerID end
    return Owner, Owner:UniqueID()
end

if SERVER then
    function ENTITY:CPPISetOwner(ply)
        if ply == self.FPPOwner then return end

        assert(ply == nil or IsEntity(ply), "The owner of an entity must be set to either nil, NULL or a valid entity.")

        local valid = IsValid(ply) and ply:IsPlayer()
        local steamId = valid and ply:SteamID() or nil
        local canSetOwner = hook.Run("CPPIAssignOwnership", ply, self, valid and ply:UniqueID() or ply)

        if canSetOwner == false then return false end
        ply = canSetOwner ~= nil and canSetOwner ~= true and canSetOwner or ply
        self.FPPOwner = ply
        self.FPPOwnerID = steamId

        self.FPPOwnerChanged = true
        FPP.recalculateCanTouch(player.GetAll(), {self})
        self.FPPOwnerChanged = nil

        return true
    end

    function ENTITY:CPPISetOwnerUID(UID)
        local ply = UID and player.GetByUniqueID(tostring(UID)) or nil
        if UID and not IsValid(ply) then return false end
        return self:CPPISetOwner(ply)
    end

    function ENTITY:CPPICanTool(ply, tool)
        local Value = FPP.Protect.CanTool(ply, nil, tool, self)
        if Value ~= false and Value ~= true then Value = true end
        return Value
    end

    function ENTITY:CPPICanPhysgun(ply)
        return FPP.plyCanTouchEnt(ply, self, "Physgun")
    end

    function ENTITY:CPPICanPickup(ply)
        return FPP.plyCanTouchEnt(ply, self, "Gravgun")
    end

    function ENTITY:CPPICanPunt(ply)
        return FPP.plyCanTouchEnt(ply, self, "Gravgun")
    end

    function ENTITY:CPPICanUse(ply)
        return FPP.plyCanTouchEnt(ply, self, "PlayerUse")
    end

    function ENTITY:CPPICanDamage(ply)
        return FPP.plyCanTouchEnt(ply,  self, "EntityDamage")
    end

    function ENTITY:CPPIDrive(ply)
        local Value = FPP.Protect.CanDrive(ply, self)
        if Value ~= false and Value ~= true then Value = true end
        return Value
    end

    function ENTITY:CPPICanProperty(ply, property)
        local Value = FPP.Protect.CanProperty(ply, property, self)
        if Value ~= false and Value ~= true then Value = true end
        return Value
    end

    function ENTITY:CPPICanEditVariable(ply, key, val, editTbl)
        return self:CPPICanProperty(ply, "editentity")
    end
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cleanup/cl_init.lua:
FAdmin.StartHooks["CleanUp"] = function()
    FAdmin.Access.AddPrivilege("CleanUp", 2)
    FAdmin.Commands.AddCommand("ClearDecals", nil)
    FAdmin.Commands.AddCommand("StopSounds", nil)
    FAdmin.Commands.AddCommand("CleanUp", nil)

    FAdmin.ScoreBoard.Server:AddServerAction("Clear decals", "fadmin/icons/cleanup", Color(155, 0, 0, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "CleanUp") end, function(ply, button)
        RunConsoleCommand("_FAdmin", "ClearDecals")
    end)

    FAdmin.ScoreBoard.Server:AddServerAction("Stop all sounds", "fadmin/icons/cleanup", Color(155, 0, 0, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "CleanUp") end, function(ply, button)
        RunConsoleCommand("_FAdmin", "StopSounds")
    end)

    usermessage.Hook("FAdmin_StopSounds", function()
        RunConsoleCommand("stopsound") -- bypass for ConCommand blocking it
    end)

    FAdmin.ScoreBoard.Server:AddServerAction("Clean up server", "fadmin/icons/cleanup", Color(155, 0, 0, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "CleanUp") end, function(ply, button)
        RunConsoleCommand("_FAdmin", "CleanUp")
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/teleport/cl_init.lua:

FAdmin.StartHooks["zz_Teleport"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "goto",
        hasTarget = true,
        message = {"instigator", " teleported to ", "targets"}
    }

    FAdmin.Messages.RegisterNotification{
        name = "bring",
        hasTarget = true,
        message = {"instigator", " brought ", "targets", " to them"}
    }

    FAdmin.Access.AddPrivilege("Teleport", 2)

    FAdmin.Commands.AddCommand("Teleport", nil, "[Player]")
    FAdmin.Commands.AddCommand("TP", nil, "[Player]")
    FAdmin.Commands.AddCommand("Bring", nil, "<Player>", "[Player]")
    FAdmin.Commands.AddCommand("goto", nil, "<Player>")


    FAdmin.ScoreBoard.Player:AddActionButton("Teleport", "fadmin/icons/teleport", Color(0, 200, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Teleport") end,
    function(ply, button)
        RunConsoleCommand("_FAdmin", "Teleport", ply:UserID())
    end)

    FAdmin.ScoreBoard.Player:AddActionButton("Goto", "fadmin/icons/teleport", Color(0, 200, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Teleport") and ply ~= LocalPlayer() end,
    function(ply, button)
        RunConsoleCommand("_FAdmin", "goto", ply:UserID())
    end)

    FAdmin.ScoreBoard.Player:AddActionButton("Bring", "fadmin/icons/teleport", Color(0, 200, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Teleport") and ply ~= LocalPlayer() end,
    function(ply, button)
        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Bring to:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)

        menu:AddPanel(Title)

        local uid = ply:UserID()
        menu:AddOption("Yourself", function() RunConsoleCommand("_FAdmin", "bring", uid) end)
        for _, v in pairs(DarkRP.nickSortedPlayers()) do
            if IsValid(v) and v ~= LocalPlayer() then
                local vUid = v:UserID()
                menu:AddOption(v:Nick(), function() RunConsoleCommand("_FAdmin", "bring", uid, vUid) end)
            end
        end
        menu:Open()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/giveweapons/sh_hl2weapons.lua:
FAdmin.HL2Guns = {
    Crowbar = "weapon_crowbar",
    Gravgun = "weapon_gravgun",
    Physgun = "weapon_physgun",
    Stunstick = "weapon_stunstick",
    Pistol = "weapon_pistol",
    ["357"] = "weapon_357",
    Smg1 = "weapon_smg1",
    Ar2 = "weapon_ar2",
    Shotgun = "weapon_shotgun",
    Crossbow = "weapon_crossbow",
    Grenade = "weapon_frag",
    RPG = "weapon_rpg",
    ["S.L.A.M."] = "weapon_SLAM",
    Camera = "gmod_camera",
    Toolgun = "gmod_tool"
}

FAdmin.AmmoTypes = {
    AR2 = 30,
    AR2AltFire = 3,
    pistol = 180,
    smg1 = 45,
    ["357"] = 6,
    XBowBolt = 3,
    Buckshot = 6,
    RPG_Round = 3,
    SMG1_Grenade = 1,
    Grenade = 3,
    slam = 1
}

FAdmin.StartHooks["GivingWeapons"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "giveweapon",
        hasTarget = true,
        message = {"instigator", " gave ", "extraInfo.1", " to ", "targets"},
        receivers = "everyone",
        writeExtraInfo = function(i) net.WriteString(i[1]) end,
        readExtraInfo = function()
            return {net.ReadString()}
        end,
        extraInfoColors = {Color(255, 102, 0)}
    }

    FAdmin.Messages.RegisterNotification{
        name = "giveammo",
        hasTarget = true,
        message = {"instigator", " gave ", "extraInfo.1", " ", "extraInfo.2", " ammo to ", "targets"},
        receivers = "everyone",
        writeExtraInfo = function(info) net.WriteUInt(info[1], 32) net.WriteString(info[2]) end,
        readExtraInfo = function()
            return {tostring(net.ReadUInt(32)), net.ReadString()}
        end,
        extraInfoColors = {Color(255, 102, 0), Color(255, 102, 153)}
    }
end

--PATH gamemodes/mangarp/gamemode/modules/f4menu/cl_menuitem.lua:
local PANEL = {}

AccessorFunc(PANEL, "borderColor", "BorderColor")

local white = color_white
local black = color_black
local gray = Color(140, 140, 140, 255)
local darkgray = Color(50, 50, 50, 255)

--[[---------------------------------------------------------------------------
Generic item
---------------------------------------------------------------------------]]
function PANEL:Init()
    self:SetMouseInputEnabled(true)
    self:SetKeyboardInputEnabled(true)

    self:SetCursor("hand")

    self:SetFont("F4MenuFont01")
    self:SetTextColor(white)
    self:SetTall(60)
    self:DockPadding(0, 0, 10, 5)

    self.model = self.model or vgui.Create("ModelImage", self)
    self.model:SetSize(60, 60)
    self.model:SetPos(0, 0)

    self.txtRight = self.txtRight or vgui.Create("DLabel", self)
    self.txtRight:SetFont("F4MenuFont01")
    self.txtRight:Dock(RIGHT)
    self.txtRight:SetTextColor(white)
end

function PANEL:Paint(w, h)
    local disabled = self:GetDisabled()
    local x, y = self.Depressed and 2 or 0, self.Depressed and 2 or 0
    w, h = self.Depressed and w - 4 or w, self.Depressed and h - 4 or h

    draw.RoundedBox(4, x, y, w, h, disabled and darkgray or black) -- background

    draw.RoundedBoxEx(4, h, h - 10 + y, w - h + x, 10,
        self.DarkRPItem and self.DarkRPItem.buttonColor or not disabled and (self:GetBorderColor() or black) or darkgray,
        false, false, false, true) -- the colored bar

    draw.RoundedBoxEx(4, x, y, h, h, disabled and darkgray or gray, true, false, false, false) -- gray box for the model
end

function PANEL:SetModel(mdl, skin)
    self.model:SetModel(mdl, skin, "000000000")
end

function PANEL:SetTextRight(text)
    self.txtRight:SetText(text)
    self.txtRight:SizeToContents()
    self.txtRight:Dock(RIGHT)
end

-- For overriding
function PANEL:setDarkRPItem(item)
    self.DarkRPItem = item
end

function PANEL:Refresh()

end

-- SetDisabled. Disables the button and hides it when the config options are set right
-- rules: always hide if hideNonBuyable, only hide items that have nothing to do with your situation (like items for another job) with hideTeamUnbuyable
function PANEL:SetDisabled(b, isImportant)
    self.m_bDisabled = b
    if GAMEMODE.Config.hideNonBuyable or (isImportant and GAMEMODE.Config.hideTeamUnbuyable) and b then
        self:SetVisible(false)
    else
        self:SetVisible(true)
    end
end

derma.DefineControl("F4MenuItemButton", "", PANEL, "DButton")

--[[---------------------------------------------------------------------------
Job item
---------------------------------------------------------------------------]]
PANEL = {}

local function getMaxOfTeam(job)
    if not job.max or job.max == 0 then return "∞" end
    if job.max % 1 == 0 then return tostring(job.max) end

    return tostring(math.floor(job.max * player.GetCount()))
end

local function canGetJob(job)
    local ply = LocalPlayer()

    if isnumber(job.NeedToChangeFrom) and ply:Team() ~= job.NeedToChangeFrom then return false, true end
    if istable(job.NeedToChangeFrom) and not table.HasValue(job.NeedToChangeFrom, ply:Team()) then return false, true end
    if job.customCheck and not job.customCheck(ply) then return false, true end
    if ply:Team() == job.team then return false, true end
    local numPlayers = team.NumPlayers(job.team)
    if job.max ~= 0 and ((job.max % 1 == 0 and numPlayers >= job.max) or (job.max % 1 ~= 0 and (numPlayers + 1) / player.GetCount() > job.max)) then return false, false end
    if job.admin == 1 and not ply:IsAdmin() then return false, true end
    if job.admin > 1 and not ply:IsSuperAdmin() then return false, true end


    return true
end

function PANEL:setDarkRPItem(job)
    self.BaseClass.setDarkRPItem(self, job)

    local model = isfunction(job.PlayerSetModel) and job.PlayerSetModel(LocalPlayer()) or
                  istable(job.model) and job.model[1] or
                  job.model

    self:SetBorderColor(job.color)
    self:SetModel(model)
    self:SetText(job.label or job.name)
    self:SetTextRight(string.format("%s/%s", team.NumPlayers(job.team), getMaxOfTeam(job)))

    local canGet, important = canGetJob(job)
    self:SetDisabled(not canGet, important)
end

function PANEL:DoDoubleClick()
    if self:GetDisabled() then return end

    local job = self.DarkRPItem
    if (job.RequiresVote == nil and job.vote) or (job.RequiresVote ~= nil and job.RequiresVote(LocalPlayer(), job.team)) then
        RunConsoleCommand("darkrp", "vote" .. job.command)
    else
        RunConsoleCommand("darkrp", job.command)
    end

    timer.Simple(1, function() DarkRP.getF4MenuPanel():Refresh() end)
end

function PANEL:Refresh()
    self:SetTextRight(string.format("%s/%s", team.NumPlayers(self.DarkRPItem.team), getMaxOfTeam(self.DarkRPItem)))

    local canGet, important = canGetJob(self.DarkRPItem)
    self:SetDisabled(not canGet, important)
end

derma.DefineControl("F4MenuJobButton", "", PANEL, "F4MenuItemButton")

--[[---------------------------------------------------------------------------
custom entity button
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:setDarkRPItem(item)
    local cost = item.getPrice and item.getPrice(LocalPlayer(), item.price) or item.price

    self.BaseClass.setDarkRPItem(self, item)
    self:SetBorderColor(Color(140, 0, 0, 180))
    self:SetModel(item.model, item.skin)
    self:SetText(item.label or item.name)
    self:SetTextRight(DarkRP.formatMoney(cost))
end

function PANEL:updatePrice(price)
    if not price then return end

    self:SetTextRight(DarkRP.formatMoney(price))
end

derma.DefineControl("F4MenuEntityButton", "", PANEL, "F4MenuItemButton")

--[[---------------------------------------------------------------------------
Button for purchasing guns
---------------------------------------------------------------------------]]
PANEL = {}

function PANEL:setDarkRPItem(item)
    local cost = item.getPrice and item.getPrice(LocalPlayer(), item.pricesep) or item.pricesep

    self.BaseClass.setDarkRPItem(self, item)
    self:SetBorderColor(Color(140, 0, 0, 180))
    self:SetModel(item.model)
    self:SetText(item.label or item.name)
    self:SetTextRight(DarkRP.formatMoney(cost))

    self.DoClick = fn.Partial(RunConsoleCommand, "DarkRP", "buy", self.DarkRPItem.name)
end

function PANEL:updatePrice(price)
    if not price then return end

    self:SetTextRight(DarkRP.formatMoney(price))
end

derma.DefineControl("F4MenuPistolButton", "", PANEL, "F4MenuItemButton")

--PATH gamemodes/mangarp/gamemode/modules/doorsystem/sh_doors.lua:
local meta = FindMetaTable("Entity")
local plyMeta = FindMetaTable("Player")

local ownableDoors = {
    ["func_door"] = true,
    ["func_door_rotating"] = true,
    ["prop_door_rotating"] = true
}
local unOwnableDoors = {
    ["func_door"] = true,
    ["func_door_rotating"] = true,
    ["prop_door_rotating"] = true,
    ["func_movelinear"] = true,
    ["prop_dynamic"] = true
}
function meta:isKeysOwnable()
    if not IsValid(self) then return false end

    local class = self:GetClass()

    if (ownableDoors[class] or
            (GAMEMODE.Config.allowvehicleowning and self:IsVehicle() and (not IsValid(self:GetParent()) or not self:GetParent():IsVehicle()))) then
        return true
    end

    return false
end

function meta:isDoor()
    local class = self:GetClass()

    if unOwnableDoors[class] then
        return true
    end

    return false
end

function meta:isKeysOwned()
    if IsValid(self:getDoorOwner()) then return true end

    return false
end

function meta:getDoorOwner()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.owner and Player(doorData.owner) or nil
end

function meta:isMasterOwner(ply)
    return ply == self:getDoorOwner()
end

function meta:isKeysOwnedBy(ply)
    if self:isMasterOwner(ply) then return true end

    local coOwners = self:getKeysCoOwners()
    return coOwners and coOwners[ply:UserID()] or false
end

function meta:isKeysAllowedToOwn(ply)
    local doorData = self:getDoorData()
    if not doorData then return false end

    return doorData.allowedToOwn and doorData.allowedToOwn[ply:UserID()] or false
end

function meta:getKeysNonOwnable()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.nonOwnable
end

function meta:getKeysTitle()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.title
end

function meta:getKeysDoorGroup()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.groupOwn
end

function meta:getKeysDoorTeams()
    local doorData = self:getDoorData()
    if not doorData or table.IsEmpty(doorData.teamOwn or {}) then return nil end

    return doorData.teamOwn
end

function meta:getKeysAllowedToOwn()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.allowedToOwn
end

function meta:getKeysCoOwners()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.extraOwners
end

local function canLockUnlock(ply, ent)
    local Team = ply:Team()
    local group = ent:getKeysDoorGroup()
    local teamOwn = ent:getKeysDoorTeams()

    return ent:isKeysOwnedBy(ply)                                         or
        (group   and table.HasValue(RPExtraTeamDoors[group] or {}, Team)) or
        (teamOwn and teamOwn[Team])
end

function plyMeta:canKeysLock(ent)
    local canLock = hook.Run("canKeysLock", self, ent)

    if canLock ~= nil then return canLock end
    return canLockUnlock(self, ent)
end

function plyMeta:canKeysUnlock(ent)
    local canUnlock = hook.Run("canKeysUnlock", self, ent)

    if canUnlock ~= nil then return canUnlock end
    return canLockUnlock(self, ent)
end

local netDoorVars = {}
local netDoorVarsByName = {}

DarkRP.getDoorVars = fp{fn.Id, netDoorVars}
DarkRP.getDoorVarsByName = fp{fn.Id, netDoorVarsByName}

function DarkRP.registerDoorVar(name, writeFn, readFn)
    netDoorVarsByName[name] = {name = name, write = writeFn, read = readFn}

    netDoorVarsByName[name].id = table.insert(netDoorVars, netDoorVarsByName[name])
end

if SERVER then
    function DarkRP.writeNetDoorVar(name, value)
        local var = netDoorVarsByName[name]

        -- Not registered, send inefficiently
        if not var then
            net.WriteUInt(0, 8) -- indicate unregistered
            net.WriteString(name)
            net.WriteType(value)

            return
        end

        net.WriteUInt(var.id, 8)
        var.write(value)
    end
end

if CLIENT then
    function DarkRP.readNetDoorVar()
        local id = net.ReadUInt(8)

        -- unregistered var
        if id == 0 then
            return net.ReadString(), net.ReadType(net.ReadUInt(8))
        end

        if not netDoorVars[id] then
            DarkRP.error("Unregistered DarkRP Doorvar clientside: " .. id, 2, {"Some addon is registering some DoorVar serverside, but not clientside."})
        end

        return netDoorVars[id].name, netDoorVars[id].read()
    end
end

DarkRP.registerDoorVar("groupOwn",
    function(val)
        net.WriteUInt(RPExtraTeamDoorIDs[val], 16)
    end,
    function()
        local id = net.ReadUInt(16)
        for name, id2 in pairs(RPExtraTeamDoorIDs) do
            if id == id2 then return name end
        end
    end
)

-- Net helper function for writing tables with numbers as keys and bools as values
local function writeNumBoolTbl(tbl)
    net.WriteUInt(table.Count(tbl), 10)

    for num, _ in pairs(tbl) do
        net.WriteUInt(num, 16)
    end
end

-- Net helper function for reading tables with numbers as keys and bools as values
local function readNumBoolTbl(tbl)
    local res = {}
    local count = net.ReadUInt(10)

    for i = 1, count do
        res[net.ReadUInt(16)] = true
    end

    return res
end

DarkRP.registerDoorVar("owner", fp{fn.Flip(net.WriteInt), 16}, fp{net.ReadUInt, 16})
DarkRP.registerDoorVar("nonOwnable", net.WriteBool, net.ReadBool)
DarkRP.registerDoorVar("teamOwn", writeNumBoolTbl, readNumBoolTbl)
DarkRP.registerDoorVar("allowedToOwn", writeNumBoolTbl, readNumBoolTbl)
DarkRP.registerDoorVar("extraOwners", writeNumBoolTbl, readNumBoolTbl)
DarkRP.registerDoorVar("title", net.WriteString, net.ReadString)

--[[---------------------------------------------------------------------------
Commands
---------------------------------------------------------------------------]]
DarkRP.declareChatCommand{
    command = "toggleownable",
    description = "Toggle ownability status on this door.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "togglegroupownable",
    description = "Set this door group ownable.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "toggleteamownable",
    description = "Toggle this door ownable by a given team.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "toggleown",
    description = "Own or unown the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "unownalldoors",
    description = "Sell all of your doors.",
    delay = 1.5
}

DarkRP.chatCommandAlias("unownalldoors", "sellalldoors")

DarkRP.declareChatCommand{
    command = "title",
    description = "Set the title of the door you're looking at.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "removeowner",
    description = "Remove an owner from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "ro",
    description = "Remove an owner from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "addowner",
    description = "Invite someone to co-own the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "ao",
    description = "Invite someone to co-own the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceunlock",
    description = "Force the door you're looking at to be unlocked. This is saved.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceremoveowner",
    description = "Forcefully remove an owner from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceunownall",
    description = "Force a player to unown all the doors and vehicles they have.",
    delay = 0.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "forcelock",
    description = "Force the door you're looking at to be locked. This is saved.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceunown",
    description = "Forcefully remove any owners from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceown",
    description = "Forcefully make someone own the door you're looking at.",
    delay = 0.5
}

--PATH gamemodes/mangarp/gamemode/modules/dermaskin/cl_dermaskin.lua:
-- Skin for DarkRP gui's
SKIN = {}

SKIN.PrintName          = "DarkRP"
SKIN.Author             = "FPtje Falco"
SKIN.DermaVersion       = 1
SKIN.GwenTexture        = Material("darkrp/darkrpderma.png")


SKIN.colTextEntryText               = color_white
SKIN.colTextEntryTextCursor         = color_white

SKIN.colTextEntryTextPlaceholder    = Color(200, 200, 200, 200) -- Unofficial but will probably be named this

SKIN.tex = {}

SKIN.tex.Selection                  = GWEN.CreateTextureBorder(384, 32, 31, 31, 4, 4, 4, 4)

SKIN.tex.Panels = {}
SKIN.tex.Panels.Normal              = GWEN.CreateTextureBorder(256, 0, 63, 63, 16, 16, 16, 16)
SKIN.tex.Panels.Bright              = GWEN.CreateTextureBorder(256 + 64, 0, 63, 63, 16, 16, 16, 16)
SKIN.tex.Panels.Dark                = GWEN.CreateTextureBorder(256, 64, 63, 63, 16, 16, 16, 16)
SKIN.tex.Panels.Highlight           = GWEN.CreateTextureBorder(256 + 64, 64, 63, 63, 16, 16, 16, 16)

SKIN.tex.Button                     = GWEN.CreateTextureBorder(480, 0, 31, 31, 8, 8, 8, 8)
SKIN.tex.Button_Hovered             = GWEN.CreateTextureBorder(480, 32, 31, 31, 8, 8, 8, 8)
SKIN.tex.Button_Dead                = GWEN.CreateTextureBorder(480, 64, 31, 31, 8, 8, 8, 8)
SKIN.tex.Button_Down                = GWEN.CreateTextureBorder(480, 96, 31, 31, 8, 8, 8, 8)
SKIN.tex.Shadow                     = GWEN.CreateTextureBorder(448, 0, 31, 31, 8, 8, 8, 8)

SKIN.tex.Tree                       = GWEN.CreateTextureBorder(256, 128, 127, 127, 16, 16, 16, 16)
SKIN.tex.Checkbox_Checked           = GWEN.CreateTextureNormal(448, 32, 15, 15)
SKIN.tex.Checkbox                   = GWEN.CreateTextureNormal(464, 32, 15, 15)
SKIN.tex.CheckboxD_Checked          = GWEN.CreateTextureNormal(448, 48, 15, 15)
SKIN.tex.CheckboxD                  = GWEN.CreateTextureNormal(464, 48, 15, 15)
--SKIN.tex.RadioButton_Checked      = GWEN.CreateTextureNormal(448, 64, 15, 15)
--SKIN.tex.RadioButton              = GWEN.CreateTextureNormal(464, 64, 15, 15)
--SKIN.tex.RadioButtonD_Checked     = GWEN.CreateTextureNormal(448, 80, 15, 15)
--SKIN.tex.RadioButtonD             = GWEN.CreateTextureNormal(464, 80, 15, 15)
SKIN.tex.TreePlus                   = GWEN.CreateTextureNormal(448, 96, 15, 15)
SKIN.tex.TreeMinus                  = GWEN.CreateTextureNormal(464, 96, 15, 15)
--SKIN.tex.Menu_Strip               = GWEN.CreateTextureBorder(0, 128, 127, 21, 1, 1, 1, 1)
SKIN.tex.TextBox                    = GWEN.CreateTextureBorder(0, 150, 127, 21, 4, 4, 4, 4)
SKIN.tex.TextBox_Focus              = GWEN.CreateTextureBorder(0, 172, 127, 21, 4, 4, 4, 4)
SKIN.tex.TextBox_Disabled           = GWEN.CreateTextureBorder(0, 193, 127, 21, 4, 4, 4, 4)
SKIN.tex.MenuBG_Margin              = GWEN.CreateTextureBorder(128, 128, 127, 63, 24, 8, 8, 8)
SKIN.tex.MenuBG                     = GWEN.CreateTextureBorder(128, 192, 127, 63, 8, 8, 8, 8)
SKIN.tex.MenuBG_Hover               = GWEN.CreateTextureBorder(128, 256, 127, 31, 8, 8, 8, 8)
SKIN.tex.MenuBG_Spacer              = GWEN.CreateTextureNormal(128, 288, 127, 3)
SKIN.tex.Tab_Control                = GWEN.CreateTextureBorder(0, 256, 127, 127, 8, 8, 8, 8)
SKIN.tex.TabB_Active                = GWEN.CreateTextureBorder(0, 416, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabB_Inactive              = GWEN.CreateTextureBorder(0 + 128, 416, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabT_Active                = GWEN.CreateTextureBorder(0, 384, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabT_Inactive              = GWEN.CreateTextureBorder(0 + 128, 384, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabL_Active                = GWEN.CreateTextureBorder(64, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.TabL_Inactive              = GWEN.CreateTextureBorder(64 + 128, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.TabR_Active                = GWEN.CreateTextureBorder(96, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.TabR_Inactive              = GWEN.CreateTextureBorder(96 + 128, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.Tab_Bar                    = GWEN.CreateTextureBorder(128, 352, 127, 31, 4, 4, 4, 4)

SKIN.tex.Window = {}

SKIN.tex.Window.Normal              = GWEN.CreateTextureBorder(0, 0, 127, 127, 8, 32, 8, 8)
SKIN.tex.Window.Inactive            = GWEN.CreateTextureBorder(128, 0, 127, 127, 8, 32, 8, 8)
SKIN.tex.Window.Close               = GWEN.CreateTextureNormal(0, 224, 24, 24)
SKIN.tex.Window.Close_Hover         = GWEN.CreateTextureNormal(32, 224, 24, 24)
SKIN.tex.Window.Close_Down          = GWEN.CreateTextureNormal(64, 224, 24, 24)
SKIN.tex.Window.Close_Disabled      = GWEN.CreateTextureNormal(96, 224, 24, 24)

SKIN.tex.Window.Maxi                = GWEN.CreateTextureNormal(32 + 96 * 2, 448, 31, 31)
SKIN.tex.Window.Maxi_Hover          = GWEN.CreateTextureNormal(64 + 96 * 2, 448, 31, 31)
SKIN.tex.Window.Maxi_Down           = GWEN.CreateTextureNormal(96 + 96 * 2, 448, 31, 31)

SKIN.tex.Window.Restore             = GWEN.CreateTextureNormal(32 + 96 * 2, 448 + 32, 31, 31)
SKIN.tex.Window.Restore_Hover       = GWEN.CreateTextureNormal(64 + 96 * 2, 448 + 32, 31, 31)
SKIN.tex.Window.Restore_Down        = GWEN.CreateTextureNormal(96 + 96 * 2, 448 + 32, 31, 31)

SKIN.tex.Window.Mini                = GWEN.CreateTextureNormal(32 + 96, 448, 31, 31)
SKIN.tex.Window.Mini_Hover          = GWEN.CreateTextureNormal(64 + 96, 448, 31, 31)
SKIN.tex.Window.Mini_Down           = GWEN.CreateTextureNormal(96 + 96, 448, 31, 31)

SKIN.tex.Scroller = {}
SKIN.tex.Scroller.TrackV                = GWEN.CreateTextureBorder(384, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Normal        = GWEN.CreateTextureBorder(384 + 16, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Hover         = GWEN.CreateTextureBorder(384 + 32, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Down          = GWEN.CreateTextureBorder(384 + 48, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Disabled      = GWEN.CreateTextureBorder(384 + 64, 208, 15, 127, 4, 4, 4, 4)

SKIN.tex.Scroller.TrackH                = GWEN.CreateTextureBorder(384, 128, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Normal        = GWEN.CreateTextureBorder(384, 128 + 16, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Hover         = GWEN.CreateTextureBorder(384, 128 + 32, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Down          = GWEN.CreateTextureBorder(384, 128 + 48, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Disabled      = GWEN.CreateTextureBorder(384, 128 + 64, 127, 15, 4, 4, 4, 4)

SKIN.tex.Scroller.LeftButton_Normal     = GWEN.CreateTextureBorder(464, 208, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.LeftButton_Hover      = GWEN.CreateTextureBorder(480, 208, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.LeftButton_Down       = GWEN.CreateTextureBorder(464, 272, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.LeftButton_Disabled   = GWEN.CreateTextureBorder(480 + 48, 272, 15, 15, 2, 2, 2, 2)

SKIN.tex.Scroller.UpButton_Normal       = GWEN.CreateTextureBorder(464, 208 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Hover        = GWEN.CreateTextureBorder(480, 208 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Down         = GWEN.CreateTextureBorder(464, 272 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Disabled     = GWEN.CreateTextureBorder(480 + 48, 272 + 16, 15, 15, 2, 2, 2, 2)

SKIN.tex.Scroller.RightButton_Normal    = GWEN.CreateTextureBorder(464, 208 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Hover     = GWEN.CreateTextureBorder(480, 208 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Down      = GWEN.CreateTextureBorder(464, 272 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Disabled  = GWEN.CreateTextureBorder(480 + 48, 272 + 32, 15, 15, 2, 2, 2, 2)

SKIN.tex.Scroller.DownButton_Normal     = GWEN.CreateTextureBorder(464, 208 + 48, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Hover      = GWEN.CreateTextureBorder(480, 208 + 48, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Down       = GWEN.CreateTextureBorder(464, 272 + 48, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Disabled   = GWEN.CreateTextureBorder(480 + 48, 272 + 48, 15, 15, 2, 2, 2, 2)

SKIN.tex.Menu = {}
SKIN.tex.Menu.RightArrow                = GWEN.CreateTextureNormal(464, 112, 15, 15)

SKIN.tex.Input = {}
SKIN.tex.Input.ListBox                  = GWEN.CreateTextureBorder(256, 256, 63, 127, 8, 8, 8, 8)

SKIN.tex.Input.ComboBox = {}
SKIN.tex.Input.ComboBox.Normal          = GWEN.CreateTextureBorder(384, 336, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Hover           = GWEN.CreateTextureBorder(384, 336 + 32, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Down            = GWEN.CreateTextureBorder(384, 336 + 64, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Disabled        = GWEN.CreateTextureBorder(384, 336 + 96, 127, 31, 8, 8, 32, 8)

SKIN.tex.Input.ComboBox.Button = {}
SKIN.tex.Input.ComboBox.Button.Normal        = GWEN.CreateTextureNormal(496, 272, 15, 15)
SKIN.tex.Input.ComboBox.Button.Hover         = GWEN.CreateTextureNormal(496, 272 + 16, 15, 15)
SKIN.tex.Input.ComboBox.Button.Down          = GWEN.CreateTextureNormal(496, 272 + 32, 15, 15)
SKIN.tex.Input.ComboBox.Button.Disabled      = GWEN.CreateTextureNormal(496, 272 + 48, 15, 15)

SKIN.tex.Input.UpDown = {}
SKIN.tex.Input.UpDown.Up = {}
SKIN.tex.Input.UpDown.Up.Normal             = GWEN.CreateTextureCentered(384, 112, 7, 7)
SKIN.tex.Input.UpDown.Up.Hover              = GWEN.CreateTextureCentered(384 + 8, 112, 7, 7)
SKIN.tex.Input.UpDown.Up.Down               = GWEN.CreateTextureCentered(384 + 16, 112, 7, 7)
SKIN.tex.Input.UpDown.Up.Disabled           = GWEN.CreateTextureCentered(384 + 24, 112, 7, 7)

SKIN.tex.Input.UpDown.Down = {}
SKIN.tex.Input.UpDown.Down.Normal           = GWEN.CreateTextureCentered(384, 120, 7, 7)
SKIN.tex.Input.UpDown.Down.Hover            = GWEN.CreateTextureCentered(384 + 8, 120, 7, 7)
SKIN.tex.Input.UpDown.Down.Down             = GWEN.CreateTextureCentered(384 + 16, 120, 7, 7)
SKIN.tex.Input.UpDown.Down.Disabled         = GWEN.CreateTextureCentered(384 + 24, 120, 7, 7)

SKIN.tex.Input.Slider = {}
SKIN.tex.Input.Slider.H = {}
SKIN.tex.Input.Slider.H.Normal          = GWEN.CreateTextureNormal(416, 32, 15, 15)
SKIN.tex.Input.Slider.H.Hover           = GWEN.CreateTextureNormal(416, 32 + 16, 15, 15)
SKIN.tex.Input.Slider.H.Down            = GWEN.CreateTextureNormal(416, 32 + 32, 15, 15)
SKIN.tex.Input.Slider.H.Disabled        = GWEN.CreateTextureNormal(416, 32 + 48, 15, 15)

SKIN.tex.Input.Slider.V = {}
SKIN.tex.Input.Slider.V.Normal          = GWEN.CreateTextureNormal(416 + 16, 32, 15, 15)
SKIN.tex.Input.Slider.V.Hover           = GWEN.CreateTextureNormal(416 + 16, 32 + 16, 15, 15)
SKIN.tex.Input.Slider.V.Down            = GWEN.CreateTextureNormal(416 + 16, 32 + 32, 15, 15)
SKIN.tex.Input.Slider.V.Disabled        = GWEN.CreateTextureNormal(416 + 16, 32 + 48, 15, 15)

SKIN.tex.Input.ListBox = {}
SKIN.tex.Input.ListBox.Background           = GWEN.CreateTextureBorder(256, 256, 63, 127, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.Hovered          = GWEN.CreateTextureBorder(320, 320, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.EvenLine         = GWEN.CreateTextureBorder(352, 256, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.OddLine          = GWEN.CreateTextureBorder(352, 288, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.EvenLineSelected         = GWEN.CreateTextureBorder(320, 270, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.OddLineSelected          = GWEN.CreateTextureBorder(320, 288, 31, 31, 8, 8, 8, 8)

SKIN.tex.ProgressBar = {}
SKIN.tex.ProgressBar.Back       = GWEN.CreateTextureBorder(384, 0, 31, 31, 8, 8, 8, 8)
SKIN.tex.ProgressBar.Front      = GWEN.CreateTextureBorder(384 + 32, 0, 31, 31, 8, 8, 8, 8)


SKIN.tex.CategoryList = {}
SKIN.tex.CategoryList.Outer     = GWEN.CreateTextureBorder(256, 384, 63, 63, 8, 8, 8, 8)
SKIN.tex.CategoryList.Inner     = GWEN.CreateTextureBorder(256 + 64, 384, 63, 63, 8, 21, 8, 8)
SKIN.tex.CategoryList.Header    = GWEN.CreateTextureBorder(320, 352, 63, 31, 8, 8, 8, 8)

SKIN.tex.Tooltip                = GWEN.CreateTextureBorder(384, 64, 31, 31, 8, 8, 8, 8)

SKIN.Colours = {}

SKIN.Colours.Window = {}
SKIN.Colours.Window.TitleActive         = GWEN.TextureColor(4 + 8 * 0, 508)
SKIN.Colours.Window.TitleInactive       = GWEN.TextureColor(4 + 8 * 1, 508)

SKIN.Colours.Button = {}
SKIN.Colours.Button.Normal              = GWEN.TextureColor(4 + 8 * 2, 508)
SKIN.Colours.Button.Hover               = GWEN.TextureColor(4 + 8 * 3, 508)
SKIN.Colours.Button.Down                = GWEN.TextureColor(4 + 8 * 2, 500)
SKIN.Colours.Button.Disabled            = GWEN.TextureColor(4 + 8 * 3, 500)

SKIN.Colours.Tab = {}
SKIN.Colours.Tab.Active = {}
SKIN.Colours.Tab.Active.Normal          = GWEN.TextureColor(4 + 8 * 4, 508)
SKIN.Colours.Tab.Active.Hover           = GWEN.TextureColor(4 + 8 * 5, 508)
SKIN.Colours.Tab.Active.Down            = GWEN.TextureColor(4 + 8 * 4, 500)
SKIN.Colours.Tab.Active.Disabled        = GWEN.TextureColor(4 + 8 * 5, 500)

SKIN.Colours.Tab.Inactive = {}
SKIN.Colours.Tab.Inactive.Normal        = GWEN.TextureColor(4 + 8 * 6, 508)
SKIN.Colours.Tab.Inactive.Hover         = GWEN.TextureColor(4 + 8 * 7, 508)
SKIN.Colours.Tab.Inactive.Down          = GWEN.TextureColor(4 + 8 * 6, 500)
SKIN.Colours.Tab.Inactive.Disabled      = GWEN.TextureColor(4 + 8 * 7, 500)

SKIN.Colours.Label = {}
SKIN.Colours.Label.Default              = GWEN.TextureColor(4 + 8 * 8, 508)
SKIN.Colours.Label.Bright               = GWEN.TextureColor(4 + 8 * 9, 508)
SKIN.Colours.Label.Dark                 = GWEN.TextureColor(4 + 8 * 8, 500)
SKIN.Colours.Label.Highlight            = GWEN.TextureColor(4 + 8 * 9, 500)

SKIN.Colours.Tree = {}
SKIN.Colours.Tree.Lines                 = GWEN.TextureColor(4 + 8 * 10, 508)
---- !!!
SKIN.Colours.Tree.Normal                = GWEN.TextureColor(4 + 8 * 11, 508)
SKIN.Colours.Tree.Hover                 = GWEN.TextureColor(4 + 8 * 10, 500)
SKIN.Colours.Tree.Selected              = GWEN.TextureColor(4 + 8 * 11, 500)

SKIN.Colours.Properties = {}
SKIN.Colours.Properties.Line_Normal         = GWEN.TextureColor(4 + 8 * 12, 508)
SKIN.Colours.Properties.Line_Selected       = GWEN.TextureColor(4 + 8 * 13, 508)
SKIN.Colours.Properties.Line_Hover          = GWEN.TextureColor(4 + 8 * 12, 500)
SKIN.Colours.Properties.Title               = GWEN.TextureColor(4 + 8 * 13, 500)
SKIN.Colours.Properties.Column_Normal       = GWEN.TextureColor(4 + 8 * 14, 508)
SKIN.Colours.Properties.Column_Selected     = GWEN.TextureColor(4 + 8 * 15, 508)
SKIN.Colours.Properties.Column_Hover        = GWEN.TextureColor(4 + 8 * 14, 500)
SKIN.Colours.Properties.Border              = GWEN.TextureColor(4 + 8 * 15, 500)
SKIN.Colours.Properties.Label_Normal        = GWEN.TextureColor(4 + 8 * 16, 508)
SKIN.Colours.Properties.Label_Selected      = GWEN.TextureColor(4 + 8 * 17, 508)
SKIN.Colours.Properties.Label_Hover         = GWEN.TextureColor(4 + 8 * 16, 500)

SKIN.Colours.Category = {}
SKIN.Colours.Category.Header                = GWEN.TextureColor(4 + 8 * 18, 500)
SKIN.Colours.Category.Header_Closed         = GWEN.TextureColor(4 + 8 * 19, 500)
SKIN.Colours.Category.Line = {}
SKIN.Colours.Category.Line.Text             = GWEN.TextureColor(4 + 8 * 20, 508)
SKIN.Colours.Category.Line.Text_Hover       = GWEN.TextureColor(4 + 8 * 21, 508)
SKIN.Colours.Category.Line.Text_Selected    = GWEN.TextureColor(4 + 8 * 20, 500)
SKIN.Colours.Category.Line.Button           = GWEN.TextureColor(4 + 8 * 21, 500)
SKIN.Colours.Category.Line.Button_Hover     = GWEN.TextureColor(4 + 8 * 22, 508)
SKIN.Colours.Category.Line.Button_Selected  = GWEN.TextureColor(4 + 8 * 23, 508)
SKIN.Colours.Category.LineAlt = {}
SKIN.Colours.Category.LineAlt.Text              = GWEN.TextureColor(4 + 8 * 22, 500)
SKIN.Colours.Category.LineAlt.Text_Hover        = GWEN.TextureColor(4 + 8 * 23, 500)
SKIN.Colours.Category.LineAlt.Text_Selected     = GWEN.TextureColor(4 + 8 * 24, 508)
SKIN.Colours.Category.LineAlt.Button            = GWEN.TextureColor(4 + 8 * 25, 508)
SKIN.Colours.Category.LineAlt.Button_Hover      = GWEN.TextureColor(4 + 8 * 24, 500)
SKIN.Colours.Category.LineAlt.Button_Selected   = GWEN.TextureColor(4 + 8 * 25, 500)

derma.DefineSkin("DarkRP", "The official SKIN for DarkRP", SKIN)

--PATH gamemodes/mangarp/gamemode/modules/base/cl_util.lua:
local plyMeta = FindMetaTable("Player")

--[[---------------------------------------------------------------------------
Show a black screen
---------------------------------------------------------------------------]]
local function blackScreen(um)
    local toggle = um:ReadBool()
    if toggle then
        local black = color_black
        local w, h = ScrW(), ScrH()
        hook.Add("HUDPaintBackground", "BlackScreen", function()
            surface.SetDrawColor(black)
            surface.DrawRect(0, 0, w, h)
        end)
    else
        hook.Remove("HUDPaintBackground", "BlackScreen")
    end
end
usermessage.Hook("blackScreen", blackScreen)

--[[---------------------------------------------------------------------------
Wrap strings to not become wider than the given amount of pixels
---------------------------------------------------------------------------]]
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

function DarkRP.textWrap(text, font, maxWidth)
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

--[[---------------------------------------------------------------------------
Decides whether a given player is in the same room as the local player
note: uses a heuristic
---------------------------------------------------------------------------]]
function plyMeta:isInRoom()
    local tracedata = {}
    tracedata.start = LocalPlayer():GetShootPos()
    tracedata.endpos = self:GetShootPos()
    local trace = util.TraceLine(tracedata)

    return not trace.HitWorld
end

--[[---------------------------------------------------------------------------
Key name to key int mapping
---------------------------------------------------------------------------]]
local keyNames
function input.KeyNameToNumber(str)
    if not keyNames then
        keyNames = {}
        for i = 1, 107, 1 do
            keyNames[input.GetKeyName(i)] = i
        end
    end

    return keyNames[str]
end

--PATH gamemodes/mangarp/gamemode/modules/base/cl_gamemode_functions.lua:
local GUIToggled = false
local mouseX, mouseY = ScrW() / 2, ScrH() / 2
function GM:ShowSpare1()
    local jobTable = LocalPlayer():getJobTable()

    -- We need to check for the existance of jobTable here, because in very rare edge cases, the player's team isn't set, when the getJobTable-function is called here.
    if jobTable and jobTable.ShowSpare1 then
        return jobTable.ShowSpare1(LocalPlayer())
    end

    GUIToggled = not GUIToggled

    if GUIToggled then
        gui.SetMousePos(mouseX, mouseY)
    else
        mouseX, mouseY = gui.MousePos()
    end
    gui.EnableScreenClicker(GUIToggled)
end

function GM:ShowSpare2()
    local jobTable = LocalPlayer():getJobTable()

    -- We need to check for the existance of jobTable here, because in very rare edge cases, the player's team isn't set, when the getJobTable-function is called here.
    if jobTable and jobTable.ShowSpare2 then
        return jobTable.ShowSpare2(LocalPlayer())
    end

    DarkRP.toggleF4Menu()
end

function GM:PlayerStartVoice(ply)
    if ply == LocalPlayer() then
        ply.DRPIsTalking = true
        return -- Not the original rectangle for yourself! ugh!
    end
    self.Sandbox.PlayerStartVoice(self, ply)
end

function GM:PlayerEndVoice(ply)
    if ply == LocalPlayer() then
        ply.DRPIsTalking = false
        return
    end

    self.Sandbox.PlayerEndVoice(self, ply)
end

function GM:OnPlayerChat()
end

local FKeyBinds = {
    ["gm_showhelp"] = "ShowHelp",
    ["gm_showteam"] = "ShowTeam",
    ["gm_showspare1"] = "ShowSpare1",
    ["gm_showspare2"] = "ShowSpare2"
}

function GM:PlayerBindPress(ply, bind, pressed)
    self.Sandbox.PlayerBindPress(self, ply, bind, pressed)

    local bnd = string.match(string.lower(bind), "gm_[a-z]+[12]?")
    if bnd and FKeyBinds[bnd] then
        hook.Call(FKeyBinds[bnd], GAMEMODE)
    end

    if not self.Config.deadvoice and not ply:Alive() and string.find(string.lower(bind), "voicerecord") then return true end
end

function GM:InitPostEntity()
    hook.Call("teamChanged", GAMEMODE, GAMEMODE.DefaultTeam, GAMEMODE.DefaultTeam)
end

function GM:teamChanged(before, after)
end

local function OnChangedTeam(um)
    local oldTeam, newTeam = um:ReadShort(), um:ReadShort()
    hook.Call("teamChanged", GAMEMODE, oldTeam, newTeam) -- backwards compatibility
    hook.Call("OnPlayerChangedTeam", GAMEMODE, LocalPlayer(), oldTeam, newTeam)
end
usermessage.Hook("OnChangedTeam", OnChangedTeam)

timer.Simple(0, function() GAMEMODE.ShowTeam = DarkRP.openKeysMenu end)

--PATH addons/leveling-system/lua/darkrp_modules/levels/sh_config.lua:
/////////////////////////
// Configuration file  //
/////////////////////////

LevelSystemConfiguration = {} -- Ignore
local Printers = {} -- Ignore
local Books = {} -- Ignore

//Language settings
LevelSystemConfiguration.Language = "FR" -- (available: FR, EN, PL, RU, zh-CN)

//Hud settings
LevelSystemConfiguration.EnableBar = false -- Is the XP Bar enabled?
LevelSystemConfiguration.BarText = false -- Is the bar text enabled?
LevelSystemConfiguration.XPTextColor = Color(255,255,255,255) -- The color of the XP percentage HUD element.
LevelSystemConfiguration.LevelBarColor = {6,116,255} -- The color of the XP bar. (Sorry this one is different. It is still {R,G,B})
LevelSystemConfiguration.XPBarYPos = 0 -- Y position of the XP bar
LevelSystemConfiguration.LevelText = false -- Enable the white text on left bottom?
LevelSystemConfiguration.LevelColor = Color(255,255,255,255) -- The color of the "Level: 1" HUD element. White looks best. (This setting is nullified if you have the prestige system)
LevelSystemConfiguration.LevelTextPos = {1.5, 180.0} -- The position of the LevelText. Y starts from bottom. Fiddle with it
LevelSystemConfiguration.DisplayLevel = true -- Show player levels when you look at them
LevelSystemConfiguration.GreenJobBars = true -- Are the green bars at the bottom of jobs enabled? KEEP THIS TRUE!
LevelSystemConfiguration.GreenAllBars = true -- Are the green bars at the bottom of everything but jobs enabled? Recommended(true)

//Kill settings
LevelSystemConfiguration.KillModule = true -- Give XP + Money for kills! -- Next 2 settings control this.
LevelSystemConfiguration.Friendly = true -- Only take away money / give XP if the killer is a lower level/same level than the victim. (Recommended:true)
LevelSystemConfiguration.TakeAwayMoneyAmount = 100 -- How much money to take away from players when they are killed and add to the killer. You can change this to 0 if none. The XP amount is dynamic.
LevelSystemConfiguration.NPCXP = true -- Give XP when an NPC is killed?
LevelSystemConfiguration.NPCXPAmount = 50 -- Amount of XP to give when an NPC is killed

//Timer settings
LevelSystemConfiguration.TimerModule = true -- Give XP to everybody every howeverlong
LevelSystemConfiguration.Timertime = 120 -- How much time (in seconds) until everybody gets given XP
LevelSystemConfiguration.TimerXPAmount = 100 -- How much XP to give each time it goes off
LevelSystemConfiguration.TimerXPAmountVip = 200 -- How much XP to give for vip players each time it goes off
LevelSystemConfiguration.TimerXPVipGroups = {"vip", "vip+", "leveling", "Arise", "superadmin", "monarque"} -- The vip groups

//XP settings
LevelSystemConfiguration.XPMult = 0.9 -- How hard it is to level up. 2 would require twice as much XP, ect.
LevelSystemConfiguration.MaxLevel = 99 -- The max level
LevelSystemConfiguration.ContinueXP = false -- If remaining XP continues over to next levels. I recommend this to be false. Seriously. What if a level 1 gets 99999999 XP somehow? He is level 99 so quickly.
LevelSystemConfiguration.BoughtXP = false -- Does the player gain xp from buying something (shipment/entity)

//Printer settings
LevelSystemConfiguration.PrinterSound = true -- Give the printers sounds?
LevelSystemConfiguration.PrinterMaxP = 4 -- How many times a printer can print before stopping. Change this to 0 if you want infine.
LevelSystemConfiguration.PrinterMax = 4 -- How many printers of a certain type a player can own at any one time
LevelSystemConfiguration.PrinterOverheat = false -- Can printers overheat?
LevelSystemConfiguration.PrinterTime = 120 -- How long it takes printers to print
LevelSystemConfiguration.PrinterCanCollect = true -- Can players collect from printers that are 5 levels above their level? (Recommended: false)
LevelSystemConfiguration.PrinterEpilepsy = true -- If printers flash different colors when they have money in them.

//Book settings
LevelSystemConfiguration.BookMax = 4 -- How many Books of a certain type a player can own at any one time
LevelSystemConfiguration.BookOnTouch = true -- Consume the book on touch?


/*Template Code for printers/*
local Printer= {} -- Leave this line
Printer.Name = "Your Printer Name"
Printer.Type = "yourprintername" -- A UNIQUE identifier STRING, can be anything. NO SPACES! The player does not see this.
Printer.Category = "printers" -- The category of the printer (See http:--wiki.darkrp.com/index.php/DarkRP:Categories)
Printer.XPPerPrint = 10 -- How much XP to give a player every time they print.
Printer.MoneyPerPrint = 50 -- How much money to give a player every time they print.
Printer.Color = Color(255,255,255,255) -- The color of the printer. Setting it to (255,255,255,255) will make it the normal prop color.
Printer.Model = "models/props_lab/reciever01b.mdl" -- The model of the printer. To find the path of a model, right click it in the spawn menu and click "Copy to Clipboard"
Printer.Prestige = 0 -- The prestige you have to be to buy the printer. Only works with the prestige DLC on Gmodstore.
Printer.Allowed = {} -- Same as DarkRP .allowed
Printer.CustomCheck = function(ply) return CLIENT or table.HasValue({"vip"}, ply:GetNWString("usergroup")) end -- Custom check, this one will make the printer vip only
Printer.CustomCheckFailMsg = "This printer is vip only" -- Message to display if the player can"t buy the entity
table.insert(Printers,Printer) -- Leave this line
*/

// Default printers:
/*local Printer={}
Printer.Name = "Regular Printer"
Printer.Type = "regularprinter"
Printer.XPPerPrint = 65
Printer.MoneyPerPrint = 100
Printer.Color = Color(255,255,255,255)
Printer.Model = "models/props_lab/reciever01b.mdl"
Printer.Price = 1000
Printer.Level = 1
Printer.Prestige = 0
table.insert(Printers,Printer)

local Printer={}
Printer.Name = "Golden Money Printer"
Printer.Type = "goldenprinter"
Printer.XPPerPrint = 300
Printer.MoneyPerPrint = 300
Printer.Color = Color(255,215,0)
Printer.Model = "models/props_lab/reciever01b.mdl"
Printer.Price = 3000
Printer.Level = 10
Printer.Prestige = 0
table.insert(Printers,Printer)

local Printer={}
Printer.Name = "Ruby Money Printer"
Printer.Type = "rubyprinter"
Printer.XPPerPrint = 1069
Printer.MoneyPerPrint = 1200
Printer.Color = Color(255,0,0)
Printer.Model = "models/props_lab/reciever01a.mdl"
Printer.Price = 5000
Printer.Level = 20
Printer.Prestige = 0
table.insert(Printers,Printer)

local Printer={}
Printer.Name = "Platinum Money Printer"
Printer.Type = "platprinter"
Printer.XPPerPrint = 1800
Printer.MoneyPerPrint = 1500
Printer.Color = Color(255,255,255)
Printer.Model = "models/props_c17/consolebox03a.mdl"
Printer.Price = 10000
Printer.Level = 30
Printer.Prestige = 0
table.insert(Printers,Printer)

local Printer={}
Printer.Name = "Diamond Money Printer"
Printer.Type = "diamondprinter"
Printer.XPPerPrint = 2500
Printer.MoneyPerPrint = 5000
Printer.Color = Color(135,200,250)
Printer.Model = "models/props_c17/consolebox01a.mdl"
Printer.Price = 50000
Printer.Level = 40
Printer.Prestige = 0
table.insert(Printers,Printer)

local Printer={}
Printer.Name = "Emerald Money Printer"
Printer.Type = "emeraldprinter"
Printer.XPPerPrint = 3550
Printer.MoneyPerPrint = 10000
Printer.Color = Color(0,100,0)
Printer.Model = "models/props_c17/consolebox01a.mdl"
Printer.Price = 100000
Printer.Level = 50
Printer.Prestige = 0
table.insert(Printers,Printer)

local Printer={}
Printer.Name = "Unubtainium Money Printer"
Printer.Type = "unubprinter"
Printer.XPPerPrint = 3500
Printer.MoneyPerPrint = 15000
Printer.Color = Color(255,255,255)
Printer.Model = "models/props_lab/harddrive01.mdl"
Printer.Price = 120000
Printer.Level = 60
Printer.Prestige = 0
table.insert(Printers,Printer)*/

/*Template Code for books/*
local Book= {} -- Leave this line
Book.Name = "Your Book Name"
Book.Type = "yourbookname" -- A UNIQUE identifier STRING, can be anything. NO SPACES! The player does not see this.
Book.Category = "Books" -- The category of the Book (See http:--wiki.darkrp.com/index.php/DarkRP:Categories)
Book.Color = Color(255,255,255,255) -- The color of the Book. Setting it to (255,255,255,255) will make it the normal prop color.
Book.Model = "models/props_lab/binderblue.mdl" -- The model of the Book. To find the path of a model, right click it in the spawn menu and click "Copy to Clipboard"
Book.Prestige = 0 -- The prestige you have to be to buy the Book. Only works with the prestige DLC on Gmodstore.
Book.Allowed = {} -- Same as DarkRP .allowed
Book.CustomCheck = function(ply) return CLIENT or table.HasValue({"vip"}, ply:GetNWString("usergroup")) end -- Custom check, this one will make the printer vip only
Book.CustomCheckFailMsg = "This book is vip only" -- Message to display if the player can"t buy the entity
table.insert(Books,Book) -- Leave this line
*/

// Default books:
/*local Book={}
Book.Name = "Small Book"
Book.Type = "smallbook"
Book.Color = Color(255,255,255)
Book.Model = "models/props_lab/binderblue.mdl"
Book.Price = 750
Book.XP = 500
Book.Level = 1
Book.Prestige = 0
table.insert(Books,Book)

local Book={}
Book.Name = "Medium Book"
Book.Type = "mediumbook"
Book.Color = Color(255,255,255)
Book.Model = "models/props_lab/bindergreen.mdl"
Book.Price = 3000
Book.XP = 2000
Book.Level = 1
Book.Prestige = 0
table.insert(Books,Book)

local Book={}
Book.Name = "Big Book"
Book.Type = "bigbook"
Book.Color = Color(255,255,255)
Book.Model = "models/props_lab/binderredlabel.mdl"
Book.Price = 7500
Book.XP = 5000
Book.Level = 1
Book.Prestige = 0
table.insert(Books,Book)*/













// Ignore everything under this line.













local en_language = {
	lvl_buy_entity = "You\'re not the right level to buy this!", -- Error message when someone can't buy an entity
	lvl_take_job = "You\'re not the right level to become this!", -- Error message when someone can't take a job
	lvl_kill_notify = "You got %s XP and %s for killing %s", -- Notification to the killer when he kill someone (vars: XP, money, victime)
	lvl_kill_notify2 = "You got %s XP for killing %s", -- Notification to the killer when he kill someone (vars: XP, victime)
	lvl_kill_notify3 = "You killed %s", -- Notification to the killer when he kill someone (vars: victime)
	lvl_kill_npc = "You got %s XP for killing an NPC.", -- Notification to the killer when he kill a npc (vars: XP)
	lvl_death = "You died and lost %s!", -- Notification to the victim when he lost money on death (vars: money)
	lvl_play_on = "You got %s XP for playing on the server.", -- Notification to everyone when they gain xp by the timer (vars: XP)
	lvl_recieve_xp = "You got %s XP!", -- Notification to the player when he recieve xp (vars: ammount)
	lvl_reach_level = "%s has reached level %s!", -- Notification to everyone when someone reach a level (vars: name, PlayerLevel)
	lvl_book_notify = "You got %s XP for using the book %s!", -- Notification to the player when he use a book (vars: XP, bookname)
	lvl_printer_use = "You got %s XP and %s from this printer.",  -- Notification to the player when he use a printer (vars: XP, money)
	lvl_printer_level = "You need to be a higher level to use this!", -- Notification to the player when he can't use a printer
}
DarkRP.addLanguage("en", en_language)

local fr_language = {
	lvl_buy_entity = "Vous n\'avez pas le bon level pour acheter ça!",
	lvl_take_job = "Vous n\'avez pas le bon level pour avoir ce job!",
	lvl_kill_notify = "Vous avez reçu %s XP et %s pour avoir tué %s",
	lvl_kill_notify2 = "Vous avez reçu %s XP pour avoir tué %s",
	lvl_kill_notify3 = "Vous avez tué %s",
	lvl_kill_npc = "Vous avez reçu %s XP pour avoir tué un NPC.",
	lvl_death = "Vous êtes mort et avez perdu %s!",
	lvl_play_on = "Vous avez reçu %s XP Pour avoir joué sur le serveur.",
	lvl_recieve_xp = "Vous avez reçu %s XP!",
	lvl_reach_level = "%s a atteint le niveau %s!",
	lvl_book_notify = "Vous avez reçu %s XP pour avoir utilisé un livre %s!",
	lvl_printer_use = "Vous avez reçu %s XP et %s du printer.",
	lvl_printer_level = "Vous devez avoir un plus haut niveau pour utiliser ce printer!",
}
DarkRP.addLanguage("fr", fr_language)

local pl_language = {
	lvl_buy_entity = "Ty nie masz odpowiedniego poziomu by to kupić!",
	lvl_take_job = "Ty nie masz odpowiedniego poziomu by tym zostać!",
	lvl_kill_notify = "Ty masz %s XP i %s za zabicie %s",
	lvl_kill_notify2 = "Ty masz %s XP za zabicie %s",
	lvl_kill_notify3 = "Zabiłeś %s",
	lvl_kill_npc = "Ty masz %s XP za zabicie NPC.",
	lvl_death = "Zmarłeś i straciłeś %s!",
	lvl_play_on = "Ty masz %s XP za grę na serwerze.",
	lvl_recieve_xp = "Ty masz %s XP!",
	lvl_reach_level = "%s osiągnął poziom %s!",
	lvl_book_notify = "Ty masz %s XP za korzystanie z książki %s!",
	lvl_printer_use = "Ty masz %s XP i %s z tej drukarki.",
	lvl_printer_level = "Aby móc z tego korzystać, musisz być na wyższym poziomie!",
}
DarkRP.addLanguage("pl", pl_language)

local ru_language = {
	lvl_buy_entity = "Вы не того уровня, чтобы купить это!",
	lvl_take_job = "Вы не того уровня для этой работы!",
	lvl_kill_notify = "Вы получили %s опыта и %s за убийство %s",
	lvl_kill_notify2 = "Вы получили %s опыта за убийство %s",
	lvl_kill_notify3 = "Вы убили %s",
	lvl_kill_npc = "Вы получили %s опыта за убийство NPC.",
	lvl_death = "Вы умерли и потеряли %s!",
	lvl_play_on = "Вы получили %s опыта за игру на этом сервере.",
	lvl_recieve_xp = "Вы получили %s опыта!",
	lvl_reach_level = "%s достиг уровня %s!",
	lvl_book_notify = "Вы получили %s опыта за использование книги %s!",
	lvl_printer_use = "Вы получили %s опыта и %s из принтера.",
	lvl_printer_level = "Вы должны быть более высокого уровня, чтобы использовать это!",
}
DarkRP.addLanguage("ru", ru_language)

local cn_language = {
	lvl_buy_entity = "你没有足够的等级来购买这个!",
	lvl_take_job = "你没有足够的等级去就职这个!",
	lvl_kill_notify = "你获得了 %s XP 和 %s 作为击杀 %s 的奖励",
	lvl_kill_notify2 = "你获得了 %s XP 作为击杀 %s 的奖励",
	lvl_kill_notify3 = "你击杀了 %s",
	lvl_kill_npc = "你获得了 %s XP 作为击杀了一个NPC的奖励.",
	lvl_death = "你因死亡丢失了 %s!",
	lvl_play_on = "你获得了 %s XP 作为游玩本服的奖励.",
	lvl_recieve_xp = "你获得了 %s XP!",
	lvl_reach_level = "%s 提升到了等级 %s!",
	lvl_book_notify = "你获得了 %s XP 因为你阅读了书籍： %s",
	lvl_printer_use = "你从这个印钞机获得了 %s XP 和 %s.",
	lvl_printer_level = "你需要拥有更高的等级才能使用这个!",
}
DarkRP.addLanguage("zh-CN", cn_language)


hook.Add("loadCustomDarkRPItems", "manolis:MVLevels:CustomLoad", function()

	for k,v in pairs(Printers) do
		local Errors = {}
		if not type(v.Name) == "string" then table.insert(Errors, "The name of a printer is INVALID!") end
		if not type(v.Type) == "string" then table.insert(Errors, "The type of a printer is INVALID!") end
		if not type(v.XPPerPrint) == "number" then table.insert(Errors, "The XP of a printer is INVALID!") end
		if not type(v.MoneyPerPrint) == "number" then table.insert(Errors, "The money of a printer is INVALID!") end
		if not type(v.Color) == "table" then table.insert(Errors, "The color of a printer is INVALID!") end
		if not type(v.Model) == "string" then table.insert(Errors, "The model of a printer is INVALID!") end
		if not type(v.Price) == "number" then table.insert(Errors, "The price of a printer is INVALID!") end
		if not type(v.Category) == "string" then v.Category="" end
		if not type(v.Level) == "number" then table.insert(Errors, "The level of a printer is INVALID!") end
		local ErrorCount = 0
		for k,v in pairs(Errors) do
			error(v)
			ErrorCount = ErrorCount + 1
		end



		if not(ErrorCount==0) then return false end

		local t = {
			ent = "vrondakis_printer",
			model = v.Model,
			category = v.Category,
			price = v.Price,
			prestige = (v.Prestige or 0),
			printer = true,
			level = v.Level,
			max = LevelSystemConfiguration.PrinterMax,
			cmd = "buyvrondakis"..v.Type.."printer",
			allowed = v.Allowed,
			vrondakisName = v.Name,
			vrondakisType = v.Type,
			vrondakisXPPerPrint = v.XPPerPrint,
			vrondakisMoneyPerPrint = v.MoneyPerPrint,
			vrondakisColor = v.Color,
			vrondakisModel = v.Model,
			customCheck = (v.CustomCheck or function() return true end),
			CustomCheckFailMsg = v.CustomCheckFailMsg,
			vrondakisPrinterOverheat = LevelSystemConfiguration.PrinterOverheat,
			vrondakisPrinterMaxP = LevelSystemConfiguration.PrinterMaxP,
			vrondakisPrinterTime = LevelSystemConfiguration.PrinterTime,
			vrondakisPrinterCanCollect = LevelSystemConfiguration.PrinterCanCollect,
			vrondakisPrinterEpilepsy = LevelSystemConfiguration.PrinterEpilepsy
		}

		if(v.DParams) then
			for k,v in pairs(v.DParams) do
				t[k] = v
			end
		end

		DarkRP.createEntity(v.Name,t)

	end





	for k,v in pairs(Books) do
		local Errors = {}
		if not type(v.Name) == "string" then table.insert(Errors, "The name of a book is INVALID!") end
		if not type(v.Type) == "string" then table.insert(Errors, "The type of a book is INVALID!") end
		if not type(v.Color) == "table" then table.insert(Errors, "The color of a book is INVALID!") end
		if not type(v.Model) == "string" then table.insert(Errors, "The model of a book is INVALID!") end
		if not type(v.Price) == "number" then table.insert(Errors, "The price of a book is INVALID!") end
		if not type(v.XP) == "number" then table.insert(Errors, "The xp ammount of a book is INVALID!") end
		if not type(v.Category) == "string" then v.Category="" end
		if not type(v.Level) == "number" then table.insert(Errors, "The level of a book is INVALID!") end
		local ErrorCount = 0
		for k,v in pairs(Errors) do
			error(v)
			ErrorCount = ErrorCount + 1
		end



		if not(ErrorCount==0) then return false end

		local t = {
			ent = "vrondakis_book",
			model = v.Model,
			category = v.Category,
			price = v.Price,
			xp = v.XP,
			prestige = (v.Prestige or 0),
			book = true,
			level = v.Level,
			max = LevelSystemConfiguration.BookMax,
			cmd = "buyvrondakis"..v.Type.."book",
			allowed = v.Allowed,
			vrondakisName = v.Name,
			vrondakisType = v.Type,
			vrondakisColor = v.Color,
			vrondakisModel = v.Model,
			customCheck = (v.CustomCheck or function() return true end),
			CustomCheckFailMsg = v.CustomCheckFailMsg,
		}

		if(v.DParams) then
			for k,v in pairs(v.DParams) do
				t[k] = v
			end
		end

		DarkRP.createEntity(v.Name,t)

	end

end)


DarkRP.registerDarkRPVar("xp", net.WriteDouble, net.ReadDouble)
DarkRP.registerDarkRPVar("level", net.WriteDouble, net.ReadDouble)
DarkRP.registerDarkRPVar("prestige", net.WriteDouble, net.ReadDouble)

--PATH addons/sl_aphone/lua/weapons/aphone/shared.lua:
SWEP.PrintName = "APhone"
SWEP.Author = "Akulla"
SWEP.Category = "APhone"
SWEP.SlotPos = 1
SWEP.Spawnable = true
SWEP.DrawAmmo = false

SWEP.ViewModel = Model( "models/akulla/aphone/c_aphone.mdl" )
SWEP.WorldModel = Model( "models/akulla/aphone/w_aphone.mdl" )

SWEP.UseHands = true

SWEP.Primary.Ammo = "none"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
--PATH addons/sl_utils/lua/weapons/comlink_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can now Comlink to your friends!"
SWEP.Instructions 			= "Click to use your Comlink"

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Comlink"
SWEP.Spawnable				= true

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_R_UpperArm"] = Angle(32.9448, -103.5211, 2.2273),
	        ["ValveBiped.Bip01_R_Forearm"] = Angle(-90.3271, -31.3616, -41.8804),
	        ["ValveBiped.Bip01_R_Hand"] = Angle(0,0,-24),
	    }
	end
end

--PATH addons/sl_util_wallet/lua/weapons/ez_wallet_wallet/shared.lua:
SWEP.PrintName          = easzy.wallet.config.walletName or "Wallet"
SWEP.Author             = "Easzy"
SWEP.Instructions       = ""
SWEP.Category           = "DarkRp"

SWEP.AutomaticFrameAdvance = true

SWEP.Spawnable          = true
SWEP.AdminOnly          = true

SWEP.Slot               = 1
SWEP.SlotPos            = 0

SWEP.Base               = "weapon_base"
SWEP.ViewModel          = "models/easzy/ez_wallet/wallet/v_wallet.mdl"
SWEP.WorldModel         = "models/easzy/ez_wallet/wallet/w_wallet.mdl"

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

--PATH lua/weapons/gmod_tool/stools/bricks_server_npcs.lua:
TOOL.Category = "Bricks Server"
TOOL.Name = "NPC Placer"
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

	if( BRICKS_SERVER.CONFIG.NPCS[ply:GetNW2Int( "bricks_server_tool_npctype" )] ) then
		local NPCEnt = ents.Create( "bricks_server_npc" )
		NPCEnt:SetPos( trace.HitPos )
		local EntAngles = NPCEnt:GetAngles()
		local PlayerAngle = ply:GetAngles()
		NPCEnt:SetAngles( Angle( EntAngles.p, PlayerAngle.y+180, EntAngles.r ) )
		NPCEnt:Spawn()
		NPCEnt:SetNPCKey( ply:GetNW2Int( "bricks_server_tool_npctype" ) )
		
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "npcPlaced" ) )
		ply:ConCommand( "bricks_server_saveentpositions" )
	else
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "invalidNPCType" ) )
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
	
	if( trace.Entity:GetClass() == "bricks_server_npc" ) then
		trace.Entity:Remove()
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "npcRemoved" ) )
		ply:ConCommand( "bricks_server_saveentpositions" )
	else
		BRICKS_SERVER.Func.SendNotification( ply, 1, 2, BRICKS_SERVER.Func.L( "errorNotNPC" ) )
		return false
	end
end

function TOOL:DrawToolScreen( width, height )
	if( not BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then return end

	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
	surface.DrawRect( 0, 0, width, height )

	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
	surface.DrawRect( 0, 0, width, 60 )
	
	draw.SimpleText( language.GetPhrase( "tool.bricks_server_npcs.name" ), "BRICKS_SERVER_Font33", width/2, 30, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	local NPCSelected = BRICKS_SERVER.CONFIG.NPCS[LocalPlayer():GetNW2Int( "bricks_server_tool_npctype", 0 )]
	draw.SimpleText( BRICKS_SERVER.Func.L( "selected" ), "BRICKS_SERVER_Font33", width/2, 60+((height-60)/2)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
	draw.SimpleText( ((NPCSelected and (NPCSelected.Name or BRICKS_SERVER.Func.L( "error" ))) or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font25", width/2, 60+((height-60)/2)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
end

function TOOL.BuildCPanel( panel )
	panel:AddControl("Header", { Text = BRICKS_SERVER.Func.L( "npcType" ), Description = BRICKS_SERVER.Func.L( "npcPlacerDescription" ) })
 
	local combo = panel:AddControl( "ComboBox", { Label = BRICKS_SERVER.Func.L( "npcType" ) } )
	for k, v in pairs( BRICKS_SERVER.CONFIG.NPCS or {} ) do
		combo:AddOption( v.Name, { k } )
	end
	function combo:OnSelect( index, text, data )
		net.Start( "BRS.Net.ToolNPCPlacer" )
			net.WriteUInt( data[1], 8 )
		net.SendToServer()
	end
end

if( CLIENT ) then
	language.Add( "tool.bricks_server_npcs.name", BRICKS_SERVER.Func.L( "npcPlacer" ) )
	language.Add( "tool.bricks_server_npcs.desc", BRICKS_SERVER.Func.L( "npcPlacerDescriptionSmall" ) )
	language.Add( "tool.bricks_server_npcs.0", BRICKS_SERVER.Func.L( "entityPlacerInstructions" ) )
elseif( SERVER ) then
	util.AddNetworkString( "BRS.Net.ToolNPCPlacer" )
	net.Receive( "BRS.Net.ToolNPCPlacer", function( len, ply )
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then return end

		ply:SetNW2Int( "bricks_server_tool_npctype", net.ReadUInt( 8 ) )
	end )
end
--PATH lua/weapons/gmod_tool/stools/catmullrom_camera_duration.lua:
TOOL.Category   = "Behavior Modifiers"
TOOL.Name       = "Duration Editor"
TOOL.Command    = nil
TOOL.ConfigName	= nil
TOOL.Tab        = "CRCCams"


TOOL.ClientConVar["duration"] = "2"
TOOL.ClientConVar["duration_mps"] = "1"

function TOOL:LeftClick(trace)
	return CatmullRomCams.SToolMethods.DurationEditor.LeftClick(self, trace)
end

function TOOL:RightClick(trace)
	return CatmullRomCams.SToolMethods.DurationEditor.RightClick(self, trace)
end

function TOOL:Reload(trace)
	return CatmullRomCams.SToolMethods.DurationEditor.Reload(self, trace)
end

function TOOL:Think()
	return CatmullRomCams.SToolMethods.DurationEditor.Think(self)
end

function TOOL:ValidTrace(trace)
	return CatmullRomCams.SToolMethods.ValidTrace(trace)
end

function TOOL.BuildCPanel(panel)
	return CatmullRomCams.SToolMethods.DurationEditor.BuildCPanel(panel)
end


--PATH lua/weapons/gmod_tool/stools/catmullrom_camera_map_io.lua:
TOOL.Category   = "Event Triggering"
TOOL.Name       = "Map I/O Editor"
TOOL.Command    = nil
TOOL.ConfigName	= nil
TOOL.Tab        = "CRCCams"


TOOL.ClientConVar["user1"] = "0"
TOOL.ClientConVar["user2"] = "0"
TOOL.ClientConVar["user3"] = "0"
TOOL.ClientConVar["user4"] = "0"

function TOOL:LeftClick(trace)
	return CatmullRomCams.SToolMethods.MapIOEditor.LeftClick(self, trace)
end

function TOOL:RightClick(trace)
	return CatmullRomCams.SToolMethods.MapIOEditor.RightClick(self, trace)
end

function TOOL:Reload(trace)
	return CatmullRomCams.SToolMethods.MapIOEditor.Reload(self, trace)
end

function TOOL:Think()
	return CatmullRomCams.SToolMethods.MapIOEditor.Think(self)
end

function TOOL:ValidTrace(trace)
	return CatmullRomCams.SToolMethods.ValidTrace(trace)
end

function TOOL.BuildCPanel(panel)
	return CatmullRomCams.SToolMethods.MapIOEditor.BuildCPanel(panel)
end


--PATH lua/weapons/gmod_tool/stools/drgbase_tool_damage.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_damage.name"
TOOL.ClientConVar = {
	["value"] = 0,
	["type"] = DMG_GENERIC
}
TOOL.BuildCPanel = function(panel)
	GetConVar("drgbase_tool_damage_type"):SetInt(DMG_GENERIC)
	panel:Help("#tool.drgbase_tool_damage.desc")
	panel:NumSlider("Damage", "drgbase_tool_damage_value", 0, 10000)
	local dlist = DrGBase.DListView({"Type", "Enabled"})
	dlist:AddLine("Crush", "False", DMG_CRUSH)
	dlist:AddLine("Slash", "False", DMG_SLASH)
	dlist:AddLine("Blast", "False", DMG_BLAST)
	dlist:AddLine("Burn", "False", DMG_BURN)
	dlist:AddLine("Slow burn", "False", DMG_SLOWBURN)
	dlist:AddLine("Shock", "False", DMG_SHOCK)
	dlist:AddLine("Plasma", "False", DMG_PLASMA)
	dlist:AddLine("Dissolve", "False", DMG_DISSOLVE)
	dlist:AddLine("Sonic", "False", DMG_SONIC)
	dlist:AddLine("Poison", "False", DMG_POISON)
	dlist:AddLine("Acid", "False", DMG_ACID)
	dlist:AddLine("Radiation", "False", DMG_RADIATION)
	dlist:AddLine("Neurotoxin", "False", DMG_NERVEGAS)
	dlist:SetSize(10, 250)
	dlist:SetMultiSelect(false)
	function dlist:OnRowSelected(id, line)
		local type = GetConVar("drgbase_tool_damage_type")
		if line:GetValue(2) == "True" then
			line:SetValue(2, "False")
			type:SetInt(type:GetInt()-line:GetValue(3))
		else
			line:SetValue(2, "True")
			type:SetInt(type:GetInt()+line:GetValue(3))
		end
	end
	panel:AddItem(dlist)
end

function TOOL:LeftClick(tr)
	local ent = tr.Entity
	if IsValid(ent) and SERVER then
		local dmg = DamageInfo()
		dmg:SetDamage(self:GetClientNumber("value"))
		dmg:SetDamageType(self:GetClientNumber("type"))
		dmg:SetAttacker(self:GetOwner())
		dmg:SetInflictor(self:GetOwner():GetActiveWeapon())
		dmg:SetDamageForce(tr.Normal*self:GetClientNumber("value"))
		dmg:SetDamagePosition(tr.HitPos)
		dmg:SetReportedPosition(tr.HitPos)
		ent:DispatchTraceAttack(dmg, tr)
	end
	return true
end
function TOOL:Reload()
	local owner = self:GetOwner()
	return self:LeftClick({
		Normal = -owner:EyeAngles():Forward(),
		Entity = owner, HitPos = owner:GetPos()
	})
end

if CLIENT then
	language.Add("tool.drgbase_tool_damage.name", "Inflict Damage")
	language.Add("tool.drgbase_tool_damage.desc", "Inflict damage to an entity.")
	language.Add("tool.drgbase_tool_damage.0", "Left click to inflict damage.")
end

--PATH lua/weapons/gmod_tool/stools/drgbase_tool_godmode.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_godmode.name"
TOOL.BuildCPanel = function(panel)
	panel:Help("#tool.drgbase_tool_godmode.desc")
	panel:Help("#tool.drgbase_tool_godmode.0")
end

function TOOL:LeftClick(tr)
	if not IsValid(tr.Entity) then return false end
	if not tr.Entity.IsDrGNextbot then return false end
	if SERVER then tr.Entity:SetGodMode(not tr.Entity:GetGodMode()) end
	return true
end

if CLIENT then
	language.Add("tool.drgbase_tool_godmode.name", "Toggle Godmode")
	language.Add("tool.drgbase_tool_godmode.desc", "Disable/enable godmode for a nextbot.")
	language.Add("tool.drgbase_tool_godmode.0", "Left click to toggle godmode. (Green => Enabled / Red => Disabled)")

	hook.Add("PreDrawHalos", "DrGBaseToolGodModeHalos", function()
		local wep = LocalPlayer():GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
		local tool = LocalPlayer():GetTool()
		if tool == nil or tool.Mode ~= "drgbase_tool_godmode" then return end
		local enabled = {}
		local disabled = {}
		for i, nextbot in ipairs(DrGBase.GetNextbots()) do
			if not IsValid(nextbot) then continue end
			if nextbot:GetGodMode() then table.insert(enabled, nextbot)
			else table.insert(disabled, nextbot) end
		end
		halo.Add(enabled, DrGBase.CLR_GREEN)
		halo.Add(disabled, DrGBase.CLR_RED)
	end)
end

--PATH gamemodes/mangarp/entities/weapons/keys/shared.lua:
AddCSLuaFile()

if SERVER then
    AddCSLuaFile("cl_menu.lua")
end

if CLIENT then
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false

    include("cl_menu.lua")
end

SWEP.PrintName = "Keys"
SWEP.Author = "DarkRP Developers"
SWEP.Instructions = "Left click to lock\nRight click to unlock\nReload for door settings or animation menu"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPKeys = true

SWEP.WorldModel = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "DarkRP (Utility)"
SWEP.Sound = "doors/door_latch3.wav"

SWEP.Primary.Delay = 0.3
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.Delay = 0.3
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:Deploy()
    if CLIENT or not IsValid(self:GetOwner()) then return true end
    self:GetOwner():DrawWorldModel(false)
    return true
end

function SWEP:Holster()
    return true
end

function SWEP:PreDrawViewModel()
    return true
end

local function lookingAtLockable(ply, ent, hitpos)
    local eyepos = ply:EyePos()
    return IsValid(ent)
        and ent:isKeysOwnable()
        and (
            ent:isDoor() and eyepos:DistToSqr(hitpos) < 2000
            or
            ent:IsVehicle() and eyepos:DistToSqr(hitpos) < 4000
        )
end

local function lockUnlockAnimation(ply, snd)
    ply:EmitSound("npc/metropolice/gear" .. math.random(1, 6) .. ".wav")
    timer.Simple(0.9, function() if IsValid(ply) then ply:EmitSound(snd) end end)

    umsg.Start("anim_keys")
        umsg.Entity(ply)
        umsg.String("usekeys")
    umsg.End()

    ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_PLACE, true)
end

local function doKnock(ply, sound)
    ply:EmitSound(sound, 100, math.random(90, 110))

    umsg.Start("anim_keys")
        umsg.Entity(ply)
        umsg.String("knocking")
    umsg.End()

    ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST, true)
end

function SWEP:PrimaryAttack()
    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    local trace = Owner:GetEyeTrace()

    local ent = trace.Entity

    if not lookingAtLockable(Owner, ent, trace.HitPos) then return end

    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

    if CLIENT then return end

    if Owner:canKeysLock(ent) then
        ent:keysLock() -- Lock the door immediately so it won't annoy people
        lockUnlockAnimation(Owner, self.Sound)
    elseif ent:IsVehicle() then
        DarkRP.notify(Owner, 1, 3, DarkRP.getPhrase("do_not_own_ent"))
    else
        doKnock(Owner, "physics/wood/wood_crate_impact_hard2.wav")
    end
end

function SWEP:SecondaryAttack()
    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    local trace = Owner:GetEyeTrace()

    local ent = trace.Entity

    if not lookingAtLockable(Owner, ent, trace.HitPos) then return end

    self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)

    if CLIENT then return end

    if Owner:canKeysUnlock(ent) then
        ent:keysUnLock() -- Unlock the door immediately so it won't annoy people
        lockUnlockAnimation(Owner, self.Sound)
    elseif ent:IsVehicle() then
        DarkRP.notify(Owner, 1, 3, DarkRP.getPhrase("do_not_own_ent"))
    else
        doKnock(Owner, "physics/wood/wood_crate_impact_hard3.wav")
    end
end

function SWEP:Reload()
    local trace = self:GetOwner():GetEyeTrace()

    local ent = trace.Entity

    if not IsValid(ent) or ((not ent:isDoor() and not ent:IsVehicle()) or self:GetOwner():EyePos():DistToSqr(trace.HitPos) > 40000) then
        if CLIENT and not DarkRP.disabledDefaults["modules"]["animations"] then RunConsoleCommand("_DarkRP_AnimationMenu") end
        return
    end
    if SERVER then
        umsg.Start("KeysMenu", self:GetOwner())
        umsg.End()
    end
end

--PATH gamemodes/mangarp/entities/weapons/ls_sniper/shared.lua:
AddCSLuaFile()

if SERVER then
    AddCSLuaFile("cl_init.lua")
end

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 0
    SWEP.SlotPos = 0
    SWEP.IconLetter = "n"

    killicon.AddFont("ls_sniper", "CSKillIcons", SWEP.IconLetter, Color(200, 200, 200, 255))
end

DEFINE_BASECLASS("weapon_cs_base2")

SWEP.PrintName = "Silenced Sniper"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.ViewModel = "models/weapons/cstrike/c_snip_g3sg1.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"

SWEP.Weight = 3

SWEP.HoldType = "ar2"
SWEP.LoweredHoldType = "passive"

SWEP.Primary.Sound = Sound("Weapon_M4A1.Silenced")
SWEP.Primary.Damage = 100
SWEP.Primary.Recoil = 0.03
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.0001 - .05
SWEP.Primary.ClipSize = 25
SWEP.Primary.Delay = 0.7
SWEP.Primary.DefaultClip = 75
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "smg1"
SWEP.IronSightsPos = Vector(0, 0, 0) -- this is just to make it disappear so it doesn't show up whilst scoped

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Int 0 = BurstBulletNum
    -- Int 1 = TotalUsedMagCount
    self:NetworkVar("Int", 2, "ScopeLevel")
end

function SWEP:Deploy()
    self:GetOwner():SetFOV(0, 0)

    self:SetScopeLevel(0)

    return BaseClass.Deploy(self)
end

function SWEP:Holster()
    self:GetOwner():SetFOV(0, 0)

    self:SetScopeLevel(0)

    return BaseClass.Holster(self)
end

local zoomFOV = {0, 0, 25, 5}
function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end

    self:SetNextSecondaryFire(CurTime() + 0.1)

    self:SetScopeLevel((self:GetScopeLevel() + 1) % 4)
    self:SetIronsights(self:GetScopeLevel() > 0)

    self:GetOwner():SetFOV(zoomFOV[self:GetScopeLevel() + 1], 0)
end

function SWEP:Reload()
    self:GetOwner():SetFOV(0, 0)

    self:SetScopeLevel(0)

    return BaseClass.Reload(self)
end

--PATH addons/sl_main_system/lua/weapons/mad_baton12/shared.lua:
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

SWEP.PrintName 		      = "12 : Parapluie" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton10.mdl"
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
SWEP.BonusDegats = 98

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton15/shared.lua:
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

SWEP.PrintName 		      = "15 : Baton de combat" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton7.mdl"
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
SWEP.BonusDegats = 122

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton19/shared.lua:
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

SWEP.PrintName 		      = "19 : Baton Glaciale" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton25.mdl"
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
SWEP.BonusDegats = 154

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton6/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_bow/shared.lua:
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

SWEP.PrintName 		      = "Base : Arc" 
SWEP.Author 		      = "Buellost"
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/prop/bow/genshin_impact_bow_amos.mdl"
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "weapon_base" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[ARMES - MAD]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

--------------------------------------------------------------------------

local DATA = {}
DATA.Name = "sl_mage_ht_mad"
DATA.HoldType = "sl_mage_ht_mad"
DATA.BaseHoldType = "normal"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
    { Sequence = "mad_son_run_base", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
    { Sequence = "mad_eaujump3", Weight = 1 },
}            

DATA.Translations[ ACT_MP_WALK ] = {
    { Sequence = "phalanx_walk_lower_2", Weight = 1 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
    { Sequence = "mad_son_run_base", Weight = 1 },
}

DATA.Translations[ ACT_MP_RUN ] = {
    { Sequence = "mad_son_run_base", Weight = 5 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )

--------------------------------------------------------------------------

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

SWEP.TypeArme = "arc"
SWEP.BonusDegats = 10
SWEP.holdtype = "sl_mage_ht_mad"

function SWEP:Initialize()
    if IsValid(self) and IsValid(self:GetOwner()) then
        self:GetOwner():SetNWInt("Combo", 0)
        if CLIENT then
        self:GetOwner():SetNWInt("FOV", self:GetOwner():GetFOV())
        end
        self.Weapon:SetHoldType( self.holdtype )
    end
end

function SWEP:Deploy()
    self.Weapon:SetHoldType( self.holdtype )
    self:GetOwner():SetNWInt("Combo", 0)   
end

-----------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague/cl_init.lua:
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
local comboCount = 0
function SWEP:PrimaryAttack()
    lastClick = lastClick or 0
    if CurTime() - lastClick > 1 then
        comboCount = comboCount +1
        lastClick = CurTime()
    end
   
end


concommand.Add("testCombo",function()
    local test = vgui.Create( 'DPanel' )
    test:SetPos(1920/2+40+100,1080/1.5)
    test:SetSize( 57.55, 96 )
    test:NoClipping(true)
    test.Paint = function(self,w,h)
        local tbl = string.Explode("",tostring(comboCount))
        for k,v in ipairs(tbl) do
            drawFigure(tonumber(v),(k-1)*w,w,h)
        end
        surface.SetDrawColor(255,255,255)
        surface.SetMaterial(comboImg)
        surface.DrawTexturedRectUV(#tbl*w,0,w,h,10/11,0,1,1)
    end
end)
--PATH addons/sl_main_system/lua/weapons/mad_dague/shared.lua:
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

SWEP.PrintName 		      = "Base : Dague" 
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
SWEP.Base                 = "weapon_base" 
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

local DATA = {}
DATA.Name = "sl_dague_ht_mad"
DATA.HoldType = "sl_dague_ht_mad"
DATA.BaseHoldType = "normal"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
    { Sequence = "mad_an_hero_magna_combat_idle_01 retarget", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
    { Sequence = "mad_eaujump3", Weight = 1 },
}            

DATA.Translations[ ACT_MP_WALK ] = {
    { Sequence = "phalanx_walk_lower_2", Weight = 1 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
    { Sequence = "mad_bete_run_base", Weight = 1 },
}

DATA.Translations[ ACT_MP_RUN ] = {
    { Sequence = "mad_bete_run_base", Weight = 5 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )

--------------------------------------------------------------------------

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

SWEP.TypeArme = "dague"
SWEP.BonusDegats = 10
SWEP.holdtype = "sl_dague_ht_mad"

function SWEP:Initialize()
    if IsValid(self) and IsValid(self:GetOwner()) then
        self:GetOwner():SetNWInt("Combo", 0)
        if CLIENT then
        self:GetOwner():SetNWInt("FOV", self:GetOwner():GetFOV())
        end
        self.Weapon:SetHoldType( self.holdtype )
    end
end

function SWEP:Deploy()
    self.Weapon:SetHoldType( self.holdtype )
    print(self:GetOwner():GetFOV())
    self:GetOwner():SetNWInt("Combo", 0)   
end
--PATH addons/sl_main_system/lua/weapons/mad_dague15/shared.lua:
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

SWEP.PrintName 		      = "15 : Dague de Pirate" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague9.mdl"
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
SWEP.BonusDegats = 122

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague16/shared.lua:
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

SWEP.PrintName 		      = "16 : Dague Blue Marine" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague1.mdl"
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
SWEP.BonusDegats = 130

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague8/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee1/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee10/shared.lua:
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

SWEP.PrintName 		      = "D : Épée épuré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword30.mdl"
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
SWEP.BonusDegats = 90

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee18/shared.lua:
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

SWEP.PrintName 		      = "18 : Épée Courbé" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword23.mdl"
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
SWEP.BonusDegats = 154

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee19/shared.lua:
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

SWEP.PrintName 		      = "19 : Épée Sanglante" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword16.mdl"
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
SWEP.BonusDegats = 162

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau/shared.lua:
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

SWEP.PrintName 		      = "Base : Marteau" 
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
SWEP.Base                 = "weapon_base" 
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

local DATA = {}
DATA.Name = "sl_marteau_ht_mad"
DATA.HoldType = "sl_marteau_ht_mad"
DATA.BaseHoldType = "normal"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
    { Sequence = "mad_an_hero_asta_combat_idle_01 retarget", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
    { Sequence = "mad_eaujump3", Weight = 1 },
}            

DATA.Translations[ ACT_MP_WALK ] = {
    { Sequence = "phalanx_walk_lower_2", Weight = 1 },
}

DATA.Translations[ ACT_MP_SPRINT ] = {
    { Sequence = "mad_flamme_run_base", Weight = 1 },
}

DATA.Translations[ ACT_MP_RUN ] = {
    { Sequence = "mad_flamme_run_base", Weight = 5 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )

--------------------------------------------------------------------------

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

SWEP.TypeArme = "marteau"
SWEP.BonusDegats = 10
SWEP.holdtype = "sl_marteau_ht_mad"

function SWEP:Initialize()
    if IsValid(self) and IsValid(self:GetOwner()) then
        self:GetOwner():SetNWInt("Combo", 0)
        if CLIENT then
        self:GetOwner():SetNWInt("FOV", self:GetOwner():GetFOV())
        end
        self.Weapon:SetHoldType( self.holdtype )
    end
end

function SWEP:Deploy()
    self.Weapon:SetHoldType( self.holdtype )
    print(self:GetOwner():GetFOV())
    self:GetOwner():SetNWInt("Combo", 0)   
end
--PATH addons/sl_main_system/lua/weapons/mad_marteau12/shared.lua:
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

SWEP.PrintName 		      = "12 : Hache scellé" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/axe3.mdl"
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
SWEP.BonusDegats = 98

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau3/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau7/shared.lua:
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

SWEP.PrintName 		      = "7 : Marteau en fer doré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/marteau12.mdl"
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
SWEP.BonusDegats = 58

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau9/cl_init.lua:
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
--PATH gamemodes/mangarp/entities/weapons/stunstick/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Slot = 0
    SWEP.SlotPos = 5
    SWEP.RenderGroup = RENDERGROUP_BOTH

    killicon.AddAlias("stunstick", "weapon_stunstick")

    CreateMaterial("darkrp/stunstick_beam", "UnlitGeneric", {
        ["$basetexture"] = "sprites/lgtning",
        ["$additive"] = 1
    })
end

DEFINE_BASECLASS("stick_base")

SWEP.Instructions = "Left click to discipline\nRight click to kill\nHold reload to threaten"
SWEP.IsDarkRPStunstick = true

SWEP.PrintName = "Stun Stick"
SWEP.Spawnable = true
SWEP.Category = "DarkRP (Utility)"

SWEP.StickColor = Color(0, 0, 255)

function SWEP:Initialize()
    BaseClass.Initialize(self)

    self.Hit = {
        Sound("weapons/stunstick/stunstick_impact1.wav"),
        Sound("weapons/stunstick/stunstick_impact2.wav")
    }

    self.FleshHit = {
        Sound("weapons/stunstick/stunstick_fleshhit1.wav"),
        Sound("weapons/stunstick/stunstick_fleshhit2.wav")
    }
end

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Float 0 = IronsightsTime
    -- Float 1 = LastPrimaryAttack
    -- Float 2 = ReloadEndTime
    -- Float 3 = BurstTime
    -- Float 4 = SeqIdleTime
    -- Float 5 = HoldTypeChangeTime
    self:NetworkVar("Float", 6, "LastReload")
end

function SWEP:Think()
    BaseClass.Think(self)
    if self.WaitingForAttackEffect and self:GetSeqIdleTime() ~= 0 and CurTime() >= self:GetSeqIdleTime() - 0.35 then
        self.WaitingForAttackEffect = false

        local Owner = self:GetOwner()

        local effectData = EffectData()
        effectData:SetOrigin(Owner:GetShootPos() + (Owner:EyeAngles():Forward() * 45))
        effectData:SetNormal(Owner:EyeAngles():Forward())
        util.Effect("StunstickImpact", effectData)
    end
end

function SWEP:DoFlash(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end

    ply:ScreenFade(SCREENFADE.IN, color_white, 1.2, 0)
end

local stunstickMaterial = Material("effects/stunstick")
local stunstickBeam     = Material("!darkrp/stunstick_beam")
local colorSprite       = Color(180, 180, 180)
function SWEP:PostDrawViewModel(vm)
    if self:GetSeqIdleTime() ~= 0 or self:GetLastReload() >= CurTime() - 0.1 then
        local attachment = vm:GetAttachment(1)
        local pos = attachment.Pos
        cam.Start3D(EyePos(), EyeAngles())
            render.SetMaterial(stunstickMaterial)
            render.DrawSprite(pos, 12, 12, colorSprite)
            for i = 1, 3 do
                local randVec = VectorRand() * 3
                local offset = (attachment.Ang:Forward() * randVec.x) + (attachment.Ang:Right() * randVec.y) + (attachment.Ang:Up() * randVec.z)
                render.SetMaterial(stunstickBeam)
                render.DrawBeam(pos, pos + offset, 3.25 - i, 1, 1.25, colorSprite)
                pos = pos + offset
            end
        cam.End3D()
    end
end

local light_glow02_add = Material("sprites/light_glow02_add")
function SWEP:DrawWorldModelTranslucent()
    if CurTime() <= self:GetLastReload() + 0.1 then
        local bone = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Hand")
        if not bone then self:DrawModel() return end
        local bonePos, boneAng = self:GetOwner():GetBonePosition(bone)
        if bonePos then
            local pos = bonePos + (boneAng:Up() * -16) + (boneAng:Right() * 3) + (boneAng:Forward() * 6.5)
            render.SetMaterial(light_glow02_add)
            render.DrawSprite(pos, 32, 32, color_white)
        end
    end
    self:DrawModel()
end

local entMeta = FindMetaTable("Entity")
function SWEP:DoAttack(dmg)
    if CLIENT then return end

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    Owner:LagCompensation(true)
    local trace = util.QuickTrace(Owner:EyePos(), Owner:GetAimVector() * 90, {Owner})
    Owner:LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent.onStunStickUsed then
        ent:onStunStickUsed(Owner)
        return
    elseif IsValid(ent) and ent:GetClass() == "func_breakable_surf" then
        ent:Fire("Shatter")
        Owner:EmitSound(self.Hit[math.random(#self.Hit)])
        return
    end

    self.WaitingForAttackEffect = true

    ent = Owner:getEyeSightHitEntity(
        self.stickRange,
        15,
        fn.FAnd{
            fp{fn.Neq, Owner},
            fc{IsValid, entMeta.GetPhysicsObject},
            entMeta.IsSolid
        }
    )

    if not IsValid(ent) then return end
    if ent:IsPlayer() and not ent:Alive() then return end

    if not ent:isDoor() then
        ent:SetVelocity((ent:GetPos() - Owner:GetPos()) * 7)
    end

    if dmg > 0 then
        ent:TakeDamage(dmg, Owner, self)
    end

    if ent:IsPlayer() or ent:IsNPC() or ent:IsVehicle() then
        self:DoFlash(ent)
        Owner:EmitSound(self.FleshHit[math.random(#self.FleshHit)])
    else
        Owner:EmitSound(self.Hit[math.random(#self.Hit)])
        if FPP and FPP.plyCanTouchEnt(Owner, ent, "EntityDamage") then
            if ent.SeizeReward and not ent.beenSeized and not ent.burningup and Owner:isCP() and ent.Getowning_ent and Owner ~= ent:Getowning_ent() then
                local amount = isfunction(ent.SeizeReward) and ent:SeizeReward(Owner, dmg) or ent.SeizeReward

                Owner:addMoney(amount)
                DarkRP.notify(Owner, 1, 4, DarkRP.getPhrase("you_received_x", DarkRP.formatMoney(amount), DarkRP.getPhrase("bonus_destroying_entity")))
                ent.beenSeized = true
            end
            local health = math.max(ent:Health(), ent:GetMaxHealth())
            health = health == 0 and 1000 or health

            local dmgToTake = GAMEMODE.Config.stunstickdamage <= 1 and GAMEMODE.Config.stunstickdamage * health or GAMEMODE.Config.stunstickdamage
            -- Ceil because health is an integer value
            dmgToTake = math.max(0, math.ceil(dmgToTake - dmg))
            ent:TakeDamage(dmgToTake, Owner, self) -- for illegal entities
        end
    end
end

function SWEP:PrimaryAttack()
    BaseClass.PrimaryAttack(self)
    self:SetNextSecondaryFire(self:GetNextPrimaryFire())
    self:DoAttack(0)
end

function SWEP:SecondaryAttack()
    BaseClass.PrimaryAttack(self)
    self:SetNextSecondaryFire(self:GetNextPrimaryFire())
    self:DoAttack(10)
end

function SWEP:Reload()
    self:SetHoldType("melee")
    self:SetHoldTypeChangeTime(CurTime() + 0.1)

    if self:GetLastReload() + 0.1 > CurTime() then self:SetLastReload(CurTime()) return end
    self:SetLastReload(CurTime())
    self:EmitSound("weapons/stunstick/spark" .. math.random(1, 3) .. ".wav")
end

--PATH gamemodes/mangarp/entities/weapons/weapon_ak472/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
    SWEP.IconLetter = "b"

    killicon.AddFont("weapon_ak472", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

SWEP.Base = "weapon_cs_base2"

SWEP.PrintName = "AK47"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.HoldType = "ar2"
SWEP.LoweredHoldType = "passive"

SWEP.Primary.Sound = Sound("Weapon_AK47.Single")
SWEP.Primary.Recoil = 1.5
SWEP.Primary.Damage = 40
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.002
SWEP.Primary.ClipSize = 30
SWEP.Primary.Delay = 0.08
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-6.6, -15, 2.6)
SWEP.IronSightsAng = Vector(2.6, 0.02, 0)

SWEP.MultiMode = true

--PATH addons/sl_aphone/lua/entities/aphone_npc/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = aphone.L("NPC_Name")
ENT.Category        = "APhone"
ENT.Author          = "Akulla"
ENT.Spawnable       = true
ENT.AdminSpawnable  = true
ENT.AdminOnly = true
ENT.ViewOffset = Vector(0,0,70)
ENT.RenderGroup = RENDERGROUP_BOTH
--PATH lua/entities/beercan1/shared.lua:
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
--PATH lua/entities/bread5b/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bread (half)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bread_half.mdl")
	
end
--PATH lua/entities/cheesewheel2b/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cheese wheel"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cheesewheel2b.mdl")
	
end
--PATH lua/entities/chipsdoritos4/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Doritos - Diablo"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Chips (Crisps if ya from Blighty)"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/ChipsDoritos4.mdl")
	
end
--PATH lua/entities/chipsfritos/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Fritos"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Fritos Original"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipsfritos.mdl")
	
end
--PATH lua/entities/chipslays2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Lays Salt and Vinegar"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Lays"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipslays2.mdl")
	
end
--PATH lua/entities/chipstwisties/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Twisties"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Twisties"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipstwisties.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/coiffeur_sl/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	if string.len(string.Trim("Coiffeur")) < 1 then return end

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
			draw.SimpleText("Coiffeur","DermaLarge",0,-40, white , 1 , 1) 
		cam.End3D2D() 
	end
end
--PATH lua/entities/colas2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cola (Swift Light)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cola_swift2.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/darkrp_cheque/cl_init.lua:
include("shared.lua")

ENT.TextColors = {
    OtherToSelf = Color(0, 255, 0, 255),
    SelfToSelf = Color(255, 255, 0, 255),
    SelfToOther = Color(0, 0, 255, 255),
    OtherToOther = Color(255, 0, 0, 255)
}

function ENT:Draw()
    self:DrawModel()

    local owner = self:Getowning_ent()
    local recipient = self:Getrecipient()
    local ownerplayer = owner:IsPlayer()
    local recipientplayer = recipient:IsPlayer()
    local localplayer = LocalPlayer()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()
    local Up = Ang:Up()
    Up:Mul(0.9)
    Pos:Add(Up)

    surface.SetFont("ChatFont")
    local text = DarkRP.getPhrase("cheque_pay", recipientplayer and recipient:Nick() or DarkRP.getPhrase("unknown")) .. "\n" .. DarkRP.formatMoney(self:Getamount()) .. "\n" .. DarkRP.getPhrase("signed", ownerplayer and owner:Nick() or DarkRP.getPhrase("unknown"))

    cam.Start3D2D(Pos, Ang, 0.1)
        draw.DrawNonParsedText(text, "ChatFont", surface.GetTextSize(text) * -0.5, -25, localplayer:IsValid() and (ownerplayer and localplayer == owner and (recipientplayer and localplayer == recipient and self.TextColors.SelfToSelf or self.TextColors.SelfToOther) or recipientplayer and localplayer == recipient and self.TextColors.OtherToSelf) or self.TextColors.OtherToOther, 0)
    cam.End3D2D()
end
--PATH gamemodes/mangarp/entities/entities/darkrp_laws/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "DarkRP Laws"
ENT.Instructions = "Use /addlaws to add a custom law, /removelaw <num> to remove a law."
ENT.Author = "Drakehawke"

ENT.Spawnable = false

local plyMeta = FindMetaTable("Player")
DarkRP.declareChatCommand{
    command = "addlaw",
    description = "Add a law to the laws board.",
    delay = 1.5,
    condition = plyMeta.isMayor
}

DarkRP.declareChatCommand{
    command = "removelaw",
    description = "Remove a law from the laws board.",
    delay = 1.5,
    condition = plyMeta.isMayor
}

DarkRP.declareChatCommand{
    command = "placelaws",
    description = "Place a laws board.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "resetlaws",
    description = "Reset all laws.",
    delay = 1.5
}

DarkRP.getLaws = DarkRP.stub{
    name = "getLaws",
    description = "Get the table of all current laws.",
    parameters = {
    },
    returns = {
        {
            name = "laws",
            description = "A table of all current laws.",
            type = "table"
        }
    },
    metatable = DarkRP,
    realm = "Shared"
}

DarkRP.resetLaws = DarkRP.stub{
    name = "resetLaws",
    description = "Reset to default laws.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP,
    realm = "Server"
}

DarkRP.hookStub{
    name = "addLaw",
    description = "Called when a law is added.",
    parameters = {
        {
            name = "index",
            description = "Index of the law",
            type = "number"
        },
        {
            name = "law",
            description = "Law string",
            type = "string"
        },
        {
            name = "player",
            description = "The player who added the law",
            type = "Player"
        }
    },
    returns = {
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "removeLaw",
    description = "Called when a law is removed.",
    parameters = {
        {
            name = "index",
            description = "Index of law",
            type = "number"
        },
        {
            name = "law",
            description = "Law string",
            type = "string"
        },
        {
            name = "player",
            description = "The player who removed the law",
            type = "Player"
        }
    },
    returns = {
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "resetLaws",
    description = "Called when laws are reset.",
    parameters = {
        {
            name = "player",
            description = "The player resetting the laws.",
            type = "Player"
        }
    },
    returns = {
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "canEditLaws",
    description = "Whether someone can edit laws.",
    parameters = {
        {
            name = "player",
            description = "The player trying to edit laws.",
            type = "Player"
        },
        {
            name = "action",
            description = "How the player is trying to edit laws.",
            type = "string"
        },
        {
            name = "arguments",
            description = "Arguments related to editing laws.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canEdit",
            description = "A yes or no as to whether the player can edit the law.",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when they can't edit the law.",
            type = "string"
        }
    },
    realm = "Server"
}

--PATH addons/the_perfect_training_system/lua/entities/diablos_card_reader/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()

end
--PATH lua/entities/drg_roach_des_penetrator.lua:
if not DrGBase then return end
ENT.Base = "drg_roach_ds1_base"

-- Editables --
ENT.PrintName = "Penetrator"
ENT.Category = "Demon's Souls"
ENT.Models = {"models/roach/des/penetrator.mdl"}
ENT.CollisionBounds = Vector(15, 15, 100)
ENT.SpawnHealth = 2960*2
ENT.MeleeAttackRange = 125
ENT.Factions = {"FACTION_DES_DEMON"}
ENT.PossessionBinds = {
	[IN_ATTACK] = {{coroutine = true,onkeydown = function(self)if self:IsRunning() then self:DS1_Range() else self:DS1_Melee()end end}},
	[IN_ATTACK2] = {{coroutine = true,onkeydown = function(self)
		local ply = self:GetPossessor()
		
		if ply:KeyDown(IN_MOVERIGHT) then self:Dodge(nil,1)
		elseif ply:KeyDown(IN_MOVELEFT) then self:Dodge(nil,2)
		elseif ply:KeyDown(IN_BACK) then self:Dodge(nil,3)
		else self:Dodge(nil,4)end
	end}},
	[IN_JUMP] = {{coroutine=false,onkeydown=function()return end}}
}
ENT.HPBarOffset = 10
ENT.HPBarScale = 0.4

if SERVER then
ENT.SOUND_EVTTABLE = {
	["step"] = {"",0,100,function(self)
		self:EmitSound("roach/des/penetrator/step"..math.random(3)..".wav",80)
		self:EmitSound("roach/des/penetrator/movement"..math.random(6)..".wav",120)
	end},
	["swing"] = {"",0,100,function(self)
		self:EmitSound("roach/des/penetrator/swing.wav",100,math.random(100,200))
		self:StopParticles()
	end},
	["down"] = {"roach/des/tk/down.wav",0,100},
	["jump"] = {"roach/ds1/gargoyle/c5350_jump.wav.mp3",0,110}
}
ENT.JumpAnimation = "glide"
ENT.IdleAnimation = "idle"
ENT.WalkAnimation = "walk_all"
ENT.RunAnimation = "run"

ENT.SetupDamage = 18
ENT.SetupType = DMG_SLASH
ENT.HitSnds = {"roach/ds1/main/damage1.wav.mp3","roach/ds1/main/damage2.wav.mp3","roach/ds1/main/damage3.wav.mp3"}
ENT.StrafeMin = 128
ENT.StrafeMax = 256
ENT.Parryable = false
function ENT:DS1_Initialize()
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self.ColA = 255
end
function ENT:DS1_OnLand()
	-- self:PlaySequenceAndMove("land")
end
function ENT:DS1_EventHook(e)
	if e[1] == "ComboTransition" then
		if (self:IsPossessed() and self:GetPossessor():KeyDown(IN_ATTACK))
		or (not self:IsPossessed() and self:IsInRange(self:GetEnemy(),self.MeleeAttackRange)) then
			self:CICO(function()
				local seq
				if not e[3] then seq = e[2] else seq = (e[2].."_"..math.random(tonumber(e[3]))) end
				-- for i=2,11 do ParticleEffectAttach("ds3_friede_scythe_swing",PATTACH_POINT_FOLLOW,self,i) end
				for i=2,11 do ParticleEffectAttach("ds3_friede_scythe_idle",PATTACH_POINT_FOLLOW,self,i) end
				self:DS1_Seq(seq,math.Rand(0.9,1.2))
			end)
		end
	end
end
function ENT:DS1_Melee(enemy)
	local m = math.random(4)
	self.MeleeAttackRange = 200
	self.SetupDamage = math.random(30,50)
	if m==2 or m==3 then self.SetupType = bit.bor(DMG_BLAST,DMG_CRUSH) else self.SetupType = DMG_SLASH end
	
	-- for i=2,11 do ParticleEffectAttach("ds3_friede_scythe_swing",PATTACH_POINT_FOLLOW,self,i) end
	for i=2,11 do ParticleEffectAttach("ds3_friede_scythe_idle",PATTACH_POINT_FOLLOW,self,i) end
	self:DS1_Seq("att"..m)
	self.MeleeAttackRange = 125
end
function ENT:DS1_Range(enemy)
	if not self:IsPossessed() then self:DS1_Seq("run",{stoponcollide=true})end
	self.MeleeAttackRange = 200
	self.SetupDamage = math.random(30,50)
	self.SetupType = bit.bor(DMG_BLAST,DMG_CRUSH)
	self.SOUND_EVTTABLE["swing"][4](self)
	-- for i=2,11 do ParticleEffectAttach("ds3_friede_scythe_swing",PATTACH_POINT_FOLLOW,self,i) end
	for i=2,11 do ParticleEffectAttach("ds3_friede_scythe_idle",PATTACH_POINT_FOLLOW,self,i) end
	self:Attack({
		damage = self.SetupDamage*((self:GetEnemy():IsPlayer()) and 1 or 2),
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
	self:DS1_Seq("att3_1")
end
function ENT:DS1_OnDodge(m,mat)
	local dodgetbl = {[1]="dodge_r",[2]="dodge_l",[3]="dodge_b",[4]="dodge_f"}
	self:DS1_Seq(dodgetbl[m],{multiply=Vector(mat,mat,1)},function()
		if self:IsPossessed() then self:PossessionFaceForward()
		else self:FaceEnemy()end
	end)
end
function ENT:DS1_Strafe(enemy,mdirection)
	if mdirection == 1 then
		self:MoveBackward(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end  
			if self:ShouldRun() then return true end
		end)
	elseif mdirection == 2 then
		self:MoveLeft(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end  
			if self:ShouldRun() then return true end
		end)
	elseif mdirection == 3 then
		self:MoveRight(math.random(self.StrafeMin,self.StrafeMax),function()
			self:FaceEnemy() 
			if self:IsInRange(self:GetClosestEnemy(),self.MeleeAttackRange) then return true end  
			if self:ShouldRun() then return true end
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
		self:SetDMGDealt(self:GetDMGDealt()+dmg:GetDamage())
		self:SetHP(math.Clamp(self:Health()-dmg:GetDamage(),0,self.SpawnHealth))
		self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
	return end
	self:SpotEntity(dmg:GetAttacker())
	
	if dmg:IsDamageType(DMG_BLAST) or (dmg:GetDamage() >= 12 and math.random(10) == 3) then
		dmg:ScaleDamage(2)
		self.Flinching = true
		local dam = dmg:GetAttacker()
		self:CICO(function(self)
			self:EmitSound("roach/ds1/main/damage"..math.random(3)..".wav.mp3",100)
			if IsValid(dam) then
				self:FaceInstant(dam:GetPos())
			end
			self.Flinching = false
			self:PlaySequenceAndMove("flinch_blast",1,function()if self.Flinching then return true end end)
		end)
	elseif math.random(150) <= (dmg:IsBulletDamage() and 3 or 9) then
		self.Flinching = true
		if dmg:IsDamageType(DMG_BURN) then 
			self:EmitSound("roach/ds1/main/burning.wav.mp3",100)
			for i=1,math.random(5,10) do ParticleEffect("burning_character",self:GetBonePosition(math.random(1,self:GetBoneCount()-1)),self:GetAngles(),self)end
			self:Timer(0.5,self.StopParticles)
		else if #self.HitSnds==1 then self:EmitSound(self.HitSnds[1],100)else self:EmitSound(self.HitSnds[math.random(#self.HitSnds)],100)end end
		self:CICO(function(self)
			self:DS1_Seq("flinch")
			self.Flinching = false
		end)
	end
	self:SetDMGDealt(self:GetDMGDealt()+dmg:GetDamage())
	self:SetHP(math.Clamp(self:Health()-dmg:GetDamage(),0,self.SpawnHealth))
	self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 1.5)
end
function ENT:OnDeath(dmg, hitgroup) 
	self:SetHP(math.Clamp(self:Health()-dmg:GetDamage(),0,self.SpawnHealth))
	self:SetCooldown("DS1_"..self:GetClass().."_HPYDegrade", 2)
	self:EmitSound("roach/ds1/main/kill"..math.random(2)..".wav.mp3",100)
	self:PlaySequenceAndMove("death")
	
	self:SetCollisionBounds(Vector(-1,-1,-1),Vector(0,0,0))
	self:PauseCoroutine(false)
end
else
ENT.RenderGroup = RENDERGROUP_BOTH
end
function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "HP")
	self:NetworkVar("Float", 1, "HPY")
	self:NetworkVar("Float", 2, "DMGDealt")
end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)
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

--PATH lua/entities/drgbase_nextbot/possession.lua:

-- Getters/setters --

function ENT:IsPossessionEnabled()
	--return self:GetNW2Bool("DrGBasePossessionEnabled")
	return self:GetNWBool("DrGBasePossessionEnabled")
end

function ENT:GetPossessor()
	return self:GetNW2Entity("DrGBasePossessor")
end
function ENT:IsPossessed()
	return IsValid(self:GetPossessor())
end
function ENT:IsPossessor(ent)
	if not self:IsPossessed() then return false
	else return self:GetPossessor() == ent end
end

function ENT:CurrentViewPreset()
	if not self:IsPossessed() then return -1 end
	if #self.PossessionViews == 0 then return -1 end
	local current = self:GetNW2Int("DrGBasePossessionView", 1)
	return current, self.PossessionViews[current]
end
function ENT:CycleViewPresets()
	if SERVER then
		local current = self:CurrentViewPreset()
		if current == -1 then return end
		current = current + 1
		if current > #self.PossessionViews then current = 1 end
		self:SetNW2Int("DrGBasePossessionView", current)
	elseif self:IsPossessedByLocalPlayer() then
		net.Start("DrGBasePossessionCycleViewPresets")
		net.WriteEntity(self)
		net.SendToServer()
	end
end

function ENT:PossessionGetLockedOn()
	if not self:IsPossessed() then return NULL
	else return self:GetNW2Entity("DrGBasePossessionLockedOn") end
end

-- Functions --

function ENT:PossessorView()
	if not self:IsPossessed() then return end
	local current, view = self:CurrentViewPreset()

	local origin
	local distance
	if current == -1 or view.auto then
		origin = self:WorldSpaceCenter() +
			Vector(0, 0, self:Height() / 3)
		distance = self:Length() * 3
	else
		local offset = view.offset or Vector(0, 0, 0)
		if view.eyepos then
			origin = self:EyePos()
		elseif isstring(view.bone) then
			local boneid = self:LookupBone(view.bone)
			if boneid ~= nil then
				origin = self:GetBonePosition(boneid)
			end
		else origin = self:WorldSpaceCenter() end

		local tr = self:TraceLine(
			self:PossessorForward() * offset.x * self:GetModelScale() +
			self:PossessorRight() * offset.y * self:GetModelScale() +
			self:PossessorUp() * offset.z * self:GetModelScale(), {
			start = origin,
		})

		origin = tr.HitPos
		distance = view.distance or 0
	end

	local tr = self:TraceLine(-self:PossessorNormal() * distance * self:GetModelScale(), {start = origin})
	return tr.HitPos, self:GetPossessor():EyeAngles()
end

function ENT:PossessorTrace(options)
	if not self:IsPossessed() then return end
	local origin, angles = self:PossessorView()
	options = options or {}
	options.start = origin
	options.endpos = origin + angles:Forward() * 999999999
	return self:TraceLine(nil, options)
end

function ENT:PossessorNormal()
	if not self:IsPossessed() then return end
	return self:GetPossessor():EyeAngles():Forward()
end

function ENT:PossessorForward()
	if not self:IsPossessed() then return end
	local lockedOn = self:PossessionGetLockedOn()
	if IsValid(lockedOn) then
		local dir = self:GetPos():DrG_Direction(lockedOn:GetPos())
		dir.z = 0
		return dir:GetNormalized()
	else
		local normal = self:PossessorNormal()
		normal.z = 0
		return normal:GetNormalized()
	end
end

function ENT:PossessorRight()
	if not self:IsPossessed() then return end
	local forward = self:PossessorForward()
	forward:Rotate(Angle(0, -90, 0))
	return forward
end

function ENT:PossessorUp()
	return Vector(0, 0, 1)
end

-- Hooks --

function ENT:OnPossessed() end
function ENT:OnDispossessed() end

-- Handlers --

function ENT:_InitPossession()
	if SERVER then
		self:SetPossessionEnabled(self.PossessionEnabled)
	else
		self:SetNW2VarProxy("DrGBasePossessor", function(self, name, old, new)
			if not IsValid(old) and IsValid(new) then self:OnPossessed(new)
			elseif IsValid(old) and not IsValid(new) then self:OnDispossessed(old) end
		end)
	end
end

function ENT:_HandlePossession(cor)
	if not self:IsPossessed() then return end
	local possessor = self:GetPossessor()
	if cor and self:OnPossession() then return end
	if cor then
		local f = possessor:KeyDown(IN_FORWARD)
		local b = possessor:KeyDown(IN_BACK)
		local l = possessor:KeyDown(IN_MOVELEFT)
		local r = possessor:KeyDown(IN_MOVERIGHT)
		local forward = f and not b
		local backward = b and not f
		local right = r and not l
		local left = l and not r
		if self.PossessionMovement == POSSESSION_MOVE_8DIR then
			self:PossessionFaceForward()
			if forward then self:PossessionMoveForward()
			elseif backward then self:PossessionMoveBackward() end
			if right then self:PossessionMoveRight()
			elseif left then self:PossessionMoveLeft() end
		elseif self.PossessionMovement == POSSESSION_MOVE_4DIR then
			self:PossessionFaceForward()
			local dir = self._DrGBasePossLast4DIR or ""
			if forward and (dir == "" or dir == "N") then
				self:PossessionMoveForward()
				self._DrGBasePossLast4DIR = "N"
			elseif backward and (dir == "" or dir == "S") then
				self:PossessionMoveBackward()
				self._DrGBasePossLast4DIR = "S"
			elseif right and (dir == "" or dir == "E") then
				self:PossessionMoveRight()
				self._DrGBasePossLast4DIR = "E"
			elseif left and (dir == "" or dir == "W") then
				self:PossessionMoveLeft()
				self._DrGBasePossLast4DIR = "W"
			else self._DrGBasePossLast4DIR = "" end
		elseif self.PossessionMovement == POSSESSION_MOVE_1DIR then
			local direction = self:GetPos()
			if forward then direction = direction + self:PossessorForward()
			elseif backward then direction = direction - self:PossessorForward() end
			if right then direction = direction + self:PossessorRight()
			elseif left then direction = direction - self:PossessorRight() end
			if direction ~= self:GetPos() then self:MoveTowards(direction)
			else self:PossessionFaceForward() end
		elseif self.PossessionMovement == POSSESSION_MOVE_CUSTOM then
			self:PossessionControls(forward, backward, right, left)
		end
		if possessor:DrG_ButtonDown(possessor:GetInfoNum("drgbase_possession_climb", KEY_C)) then
			if self.ClimbLadders and navmesh.IsLoaded() then
				local area = navmesh.GetNearestNavArea(self:GetPos())
				if IsValid(area) then
					local ladders = area:GetLadders()
					for i, ladder in ipairs(ladders) do
						if self.ClimbLadderUp then
							if self:GetHullRangeSquaredTo(ladder:GetBottom()) < self.LaddersUpDistance^2 then
								self:ClimbLadderUp(ladder)
								return
							end
						elseif self.ClimbLaddersDown then
							if self:GetHullRangeSquaredTo(ladder:GetTop()) < self.LaddersDownDistance^2 then
								self:ClimbLadderDown(ladder)
								return
							end
						end
					end
				end
			end
			local ledge = self:FindLedge()
			if isvector(ledge) then self:ClimbLedge(ledge) end
		end
	end
	for key, binds in pairs(self.PossessionBinds) do
		if isstring(key) then
			if CLIENT then
				local convar = GetConVar(key)
				if not convar then continue
				else key = convar:GetInt() end
			else
				key = possessor:GetInfoNum(key, BUTTON_CODE_INVALID)
				if key == BUTTON_CODE_INVALID then continue end
			end
		end
		for i, bind in ipairs(binds) do
			if CLIENT and not bind.client then continue end
			if SERVER and ((not cor and bind.coroutine) or (cor and not bind.coroutine)) then continue end
			if not isfunction(bind.onkeyup) then bind.onkeyup = function() end end
			if not isfunction(bind.onkeypressed) then bind.onkeypressed = function() end end
			if not isfunction(bind.onkeydown) then bind.onkeydown = function() end end
			if not isfunction(bind.onkeydownlast) then bind.onkeydownlast = function() end end
			if not isfunction(bind.onkeyreleased) then bind.onkeyreleased = function() end end
			if possessor:KeyPressed(key) then bind.onkeypressed(self, possessor) end
			if possessor:KeyDown(key) then bind.onkeydown(self, possessor) else bind.onkeyup(self, possessor) end
			if possessor:KeyDownLast(key) then bind.onkeydownlast(self, possessor) end
			if possessor:KeyReleased(key) then bind.onkeyreleased(self, possessor) end
			if not isfunction(bind.onbuttonup) then bind.onbuttonup = function() end end
			if not isfunction(bind.onbuttonpressed) then bind.onbuttonpressed = function() end end
			if not isfunction(bind.onbuttondown) then bind.onbuttondown = function() end end
			if not isfunction(bind.onbuttonreleased) then bind.onbuttonreleased = function() end end
			if possessor:DrG_ButtonUp(key) then bind.onbuttonup(self, possessor) end
			if possessor:DrG_ButtonPressed(key) then bind.onbuttonpressed(self, possessor) end
			if possessor:DrG_ButtonDown(key) then bind.onbuttondown(self, possessor) end
			if possessor:DrG_ButtonReleased(key) then bind.onbuttonreleased(self, possessor) end
		end
	end
end

if SERVER then
	util.AddNetworkString("DrGBasePossessionCycleViewPresets")

	-- Getters/setters --

	function ENT:SetPossessionEnabled(bool)
		--self:SetNW2Bool("DrGBasePossessionEnabled", bool)
		self:SetNWBool("DrGBasePossessionEnabled", bool)
		if not bool and self:IsPossessed() then self:Dispossess() end
	end

	function ENT:PossessionLockOn(ent)
		if not self:IsPossessed() then return end
		if IsValid(ent) then
			self:SetNW2Entity("DrGBasePossessionLockedOn", ent)
		else
			self:SetNW2Entity("DrGBasePossessionLockedOn", NULL)
		end
	end

	-- Functions --

	function ENT:Possess(ply)
		if not self:IsPossessionEnabled() then return "disabled" end
		if self:IsPossessed() then return "already possessed" end
		if not IsValid(ply) then return "invalid" end
		if not ply:IsPlayer() then return "not player" end
		if not ply:Alive() then return "not alive" end
		if ply:InVehicle() then return "in vehicle" end
		if ply:DrG_IsPossessing() then return "already possessing" end
		if not self:CanPossess(ply) then return "not allowed" end
		self:SetNW2Entity("DrGBasePossessor", ply)
		ply:SetNW2Entity("DrGBasePossessing", self)
		ply:SetNW2Vector("DrGBasePrePossessPos", ply:GetPos())
		ply:SetNW2Angle("DrGBasePrePossessAngle", ply:GetAngles())
		ply:SetNW2Angle("DrGBasePrePossessEyes", ply:EyeAngles())
		ply:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		ply:SetNoTarget(true)
		ply:SetNoDraw(true)
		ply:Flashlight(false)
		ply:AllowFlashlight(false)
		ply:SetEyeAngles(self:EyeAngles())
		self:UpdateEnemy()
		self:SetNW2Entity("DrGBasePossessionLockedOn", NULL)
		self:SetNW2Int("DrGBasePossessionView", 1)
		self:OnPossessed(ply)
		return "ok"
	end

	function ENT:Dispossess()
		if not self:IsPossessed() then return "not possessed" end
		local ply = self:GetPossessor()
		if not self:CanDispossess(ply) then return "not allowed" end
		if not tobool(ply:GetInfoNum("drgbase_possession_teleport", 0)) then
			ply:SetPos(ply:GetNW2Vector("DrGBasePrePossessPos"))
			ply:SetAngles(ply:GetNW2Angle("DrGBasePrePossessAngle"))
			ply:SetEyeAngles(ply:GetNW2Angle("DrGBasePrePossessEyes"))
		else ply:SetPos(ply:DrG_TraceHull(-self:PossessorForward()*self:Length()).HitPos) end
		self:SetNW2Entity("DrGBasePossessor", NULL)
		ply:SetNW2Entity("DrGBasePossessing", NULL)
		ply:SetCollisionGroup(COLLISION_GROUP_PLAYER)
		ply:SetNoTarget(false)
		ply:SetNoDraw(false)
		ply:AllowFlashlight(true)
		self:UpdateEnemy()
		self:OnDispossessed(ply)
		return "ok"
	end

	function ENT:PossessionFaceForward()
		if not self:IsPossessed() then return end
		local lockedOn = self:PossessionGetLockedOn()
		if not IsValid(lockedOn) then
			self:FaceTowards(self:GetPos() + self:PossessorNormal())
		else self:FaceTowards(lockedOn) end
	end

	function ENT:PossessionMoveForward()
		return self:Approach(self:GetPos() + self:PossessorForward())
	end
	function ENT:PossessionMoveBackward()
		return self:Approach(self:GetPos() - self:PossessorForward())
	end
	function ENT:PossessionMoveRight()
		return self:Approach(self:GetPos() + self:PossessorRight())
	end
	function ENT:PossessionMoveLeft()
		return self:Approach(self:GetPos() - self:PossessorRight())
	end

	-- Hooks --

	function ENT:CanPossess() return true end
	function ENT:CanDispossess() return true end
	function ENT:OnPossession() end
	function ENT:PossessionControls(forward, backward, right, left) end
	function ENT:PossessionFetchLockOn()
		local closest = self:GetClosestHostile()
		if not IsValid(closest) then return end
		if self:Visible(closest) then return closest end
	end

	-- Handlers --

	local function MoveEnt(ply, ent)
		if not ply:DrG_IsPossessing() then return end
		local tr = ply:DrG_Possessing():PossessorTrace()
		ent:SetPos(tr.HitPos)
	end
	local function MoveEntModel(ply, model, ent)
		MoveEnt(ply, ent)
	end
	hook.Add("PlayerSpawnedEffect", "DrGBasePlayerPossessingSpawnedEffect", MoveEntModel)
	hook.Add("PlayerSpawnedNPC", "DrGBasePlayerPossessingSpawnedNPC", MoveEnt)
	hook.Add("PlayerSpawnedProp", "DrGBasePlayerPossessingSpawnedProp", MoveEntModel)
	hook.Add("PlayerSpawnedRagdoll", "DrGBasePlayerPossessingSpawnedRagdoll", MoveEntModel)
	hook.Add("PlayerSpawnedSENT", "DrGBasePlayerPossessingSpawnedSENT", MoveEnt)
	hook.Add("PlayerSpawnedSWEP", "DrGBasePlayerPossessingSpawnedSWEP", MoveEnt)
	hook.Add("PlayerSpawnedVehicle", "DrGBasePlayerPossessingSpawnedVehicle", MoveEnt)

	net.Receive("DrGBasePossessionCycleViewPresets", function(_, ply)
		local ent = net.ReadEntity()
		if not IsValid(ent) then return end
		if ent:IsPossessed() and ent:GetPossessor() == ply then
			ent:CycleViewPresets()
		end
	end)

else

	-- Convars --

	CreateClientConVar("drgbase_possession_teleport", "0", true, true)

	-- Getters/setters --

	function ENT:IsPossessedByLocalPlayer()
		return self:IsPossessor(LocalPlayer())
	end

	-- Functions --

	-- Hooks --

	function ENT:PossessionHUD() end
	hook.Add("HUDPaint", "DrGBasePossessionHUD", function()
		local ply = LocalPlayer()
		if not isfunction(ply.DrG_Possessing) then return end
		local possessing = ply:DrG_Possessing()
		if not IsValid(possessing) then return end
		local hookres = possessing:PossessionHUD()
		if hookres then return end
		DrGBase.DrawPossessionHUD(possessing)
	end)

	function ENT:PossessionRender() end
	hook.Add("RenderScreenspaceEffects", "DrGBasePossessionDraw", function()
		local ply = LocalPlayer()
		if not isfunction(ply.DrG_Possessing) then return end
		local possessing = ply:DrG_Possessing()
		if not IsValid(possessing) then return end
		possessing:PossessionRender()
	end)

	function ENT:PossessionHalos() end
	hook.Add("PreDrawHalos", "DrGBasePossessionHalos", function()
		local ply = LocalPlayer()
		if not isfunction(ply.DrG_Possessing) then return end
		local possessing = ply:DrG_Possessing()
		if not IsValid(possessing) then return end
		possessing:PossessionHalos()
	end)

	-- Handlers --

end

--PATH lua/entities/drgbase_nextbot/behaviours.lua:

function ENT:IsWaiting()
	return self:GetNW2Bool("DrGBaseWaiting")
end
function ENT:IsJumping()
	return self:GetNW2Bool("DrGBaseJumping")
end
function ENT:IsLeaping()
	return self:GetNW2Bool("DrGBaseLeaping")
end
function ENT:IsGliding()
	return self:GetNW2Bool("DrGBaseGliding")
end

if SERVER then

	-- Misc --

	function ENT:Wait(duration, callback)
		if duration <= 0 then return end
		if callback == nil then callback = function() end end
		self:SetNW2Bool("DrGBaseWaiting", true)
		local delay = CurTime() + duration
		local now = CurTime()
		while CurTime() < delay do
			if self:IsPossessed() then break end
			if self:HasEnemy() then break end
			if callback(CurTime() - now) then break end
			self:YieldCoroutine(true)
		end
		self:SetNW2Bool("DrGBaseWaiting", false)
	end

	-- Jumps --

	local function LocoJump(self)
		local seq = self:GetSequence()
		local cycle = self:GetCycle()
		self.loco:Jump()
		self:ResetSequence(seq)
		self:SetCycle(cycle)
	end
	local function LocoJumpGap(self, pos)
		local seq = self:GetSequence()
		local cycle = self:GetCycle()
		self.loco:JumpAcrossGap(pos, self:GetForward())
		self:ResetSequence(seq)
		self:SetCycle(cycle)
	end

	function ENT:LeaveGround()
		if not self:IsOnGround() then return end
		local jumpHeight = self.loco:GetJumpHeight()
		self.loco:SetJumpHeight(1)
		LocoJump(self)
		self.loco:SetJumpHeight(jumpHeight)
	end

	function ENT:Jump(height, callback)
		if not self:IsOnGround() then return end
		if isnumber(height) then
			local jumpHeight = self.loco:GetJumpHeight()
			self.loco:SetJumpHeight(height*self:GetScale())
			LocoJump(self)
			self.loco:SetJumpHeight(jumpHeight)
		elseif isvector(height) then
			LocoJumpGap(self, height)
		else return self:Jump(self.loco:GetJumpHeight(), callback) end
		if not coroutine.running() then return end
		self:SetNW2Bool("DrGBaseJumping", true)
		local now = CurTime()
		while not self:IsOnGround() do
			if isfunction(callback) and
			callback(self, CurTime()-now) then break end
			self:YieldCoroutine(true)
		end
		self:SetNW2Bool("DrGBaseJumping", false)
	end

	local function CalcTrajectory(self, pos, speed)
		local dir, info = self:GetPos():DrG_CalcBallisticTrajectory(pos, {
			speed = speed, recursive = true
		})
		if dir.z <= 0 then
			dir, info = self:GetPos():DrG_CalcBallisticTrajectory(pos, {
				speed = speed, recursive = true, highest = true
			})
		end
		return dir, info
	end

	function ENT:Leap(pos, speed, callback)
		if not self:IsOnGround() then return end
		if not coroutine.running() then return end
		if isentity(pos) then
			local dir, info = CalcTrajectory(self, pos:GetPos(), speed)
			return self:Leap(pos:GetPos()+pos:GetVelocity()*info.duration, speed, callback)
		elseif isvector(pos) then
			if not isfunction(callback) then callback = function()
				self:FaceTowards(self:GetPos()+self:GetVelocity())
			end end
			local dir, info = CalcTrajectory(self, pos, speed)
			if self:TraceHull(dir:GetNormalized()).Hit then return false end
			local collided = NULL
			local now = CurTime()
			self:LeaveGround()
			if self:IsOnGround() then return false end
			self:SetNW2Bool("DrGBaseLeaping", true)
			while not self:IsOnGround() do
				local time = CurTime() - now
				local left = info.duration - time
				local hasCollided = IsValid(collided) or collided:IsWorld()
				if callback(self, left, hasCollided, collided) then break end
				if not hasCollided then
					local pos, vel = info.Predict(time)
					collided = self:TraceHull(info.Predict(time+engine.TickInterval())-self:GetPos()).Entity
					hasCollided = IsValid(collided) or collided:IsWorld()
					if not hasCollided then
						self:SetPos(pos)
						self:SetVelocity(vel)
					end
				end
				self:YieldCoroutine(true)
			end
			self:SetNW2Bool("DrGBaseLeaping", false)
			return not collided
		end
	end

	function ENT:Glide(dist, options, callback)
		if not coroutine.running() then return end
		options = options or {}
		options.speed = options.speed or self:GetSpeed()
		options.pitch = options.pitch or 15
		LocoJumpGap(self, self:GetPos() + self:GetForward()*dist)
		self:SetNW2Bool("DrGBaseGliding", true)
		local now = CurTime()
		while not self:IsOnGround() do
			if isfunction(callback) and
			callback(self, CurTime()-now) then break
			elseif self:GetVelocity().z <= 0 then
				local forward = self:GetForward()
				forward.z = -math.tan(math.rad(options.pitch))
				forward:Normalize()
				self.loco:SetVelocity(forward*options.speed*self:GetScale())
			end
			self:YieldCoroutine(true)
		end
		self:SetNW2Bool("DrGBaseGliding", false)
	end

end

--PATH addons/sl_utils/lua/entities/gmod_contr_spawner/shared.lua:
ENT.Type 			= "anim"
ENT.Base			= WireLib and "base_wire_entity" or "base_gmodentity"
ENT.PrintName		= "Contraption Spawner"
ENT.Author			= "TB"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

--PATH lua/entities/icecream/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A vanilla ice cream"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/icecream.mdl")
	
end
--PATH lua/entities/icecream4b/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream_open4.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/jet_item_sl/cl_init.lua:
include('shared.lua')
local itemsui = Material("items_ui.png")

function ENT:Draw()
	self:DrawModel()
	if not INV_SL or not self.GetItemID or not INV_SL[self:GetItemID()] then return end
	if INV_SL[self:GetItemID()].img then
		image = Material(INV_SL[self:GetItemID()].img)
	end
	if string.len(string.Trim(self:GetNWInt("ItemName"))) < 1 then return end

	if LocalPlayer():GetPos():Distance(self:GetPos()) < 400 then
		local alpha = (LocalPlayer():GetPos():Distance(self:GetPos()) / 500.0)
		alpha = math.Clamp(1.25 - alpha, 0 ,1)
		local a = Angle(0,0,0) 
		a:RotateAroundAxis(Vector(1,0,0),90) 
		a.y = LocalPlayer():GetAngles().y - 90 

		cam.Start3D2D(self:GetPos() + Vector(0,0,25), a , 0.08)
			surface.SetDrawColor(255, 255, 255, 230)
			surface.SetMaterial(itemsui)
			surface.DrawTexturedRect(-600, -700, W(1426) /1.2,H(816) /1.2)
			draw.SimpleText("item : "..self:GetItemName(),"B_Font6",60,-555, white , 1 ) 
			draw.SimpleText(INV_SL[self:GetItemID()].type,"B_Font6",W(280),H(-455), white , TEXT_ALIGN_RIGHT ) 
			draw.SimpleText(INV_SL[self:GetItemID()].rang,"B_Font6",W(-110),H(-455), RANG_SLColor[INV_SL[self:GetItemID()].rang] , TEXT_ALIGN_LEFT ) 
			if INV_SL[self:GetItemID()].type == "armure" or INV_SL[self:GetItemID()].type == 'arme' then
			elseif INV_SL[self:GetItemID()].img then
				surface.SetDrawColor(255, 255, 255, 230)
				surface.SetMaterial(image)
				surface.DrawTexturedRect(W(-280), H(-550), W(270)/2,H(270)/2)
			end
		cam.End3D2D() 
	end
	
end
--PATH lua/entities/mcdburger/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "McDonalds Cheeseburger"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A cheeseburger from McDonalds"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/burgersims2.mdl")
	
end
--PATH lua/entities/mcdburger2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "McDonalds Cheeseburger (Double)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A double cheeseburger from McDonalds"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/mcdburger.mdl")
	
end
--PATH lua/entities/meat4/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/meat4.mdl")
	
end
--PATH lua/entities/meat9/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Meat"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/meat9.mdl")
	
end
--PATH lua/entities/meat9b/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/meat9b.mdl")
	
end
--PATH lua/entities/orangejuice/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Orange Juice"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A carton of orange juice"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/juice.mdl")
	
end
--PATH addons/pcasino/lua/entities/pcasino_chair/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Sign Plaque"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false


PerfectCasino.Core.RegisterEntity("pcasino_chair", {
},
"models/freeman/owain_casino_stool.mdl")
--PATH addons/pcasino/lua/entities/pcasino_mystery_wheel/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Mysterly Wheel"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Spawnable = false
ENT.AdminSpawnable = false

PerfectCasino.Core.RegisterEntity("pcasino_mystery_wheel", {
	general = {
		useFreeSpins = {d = true, t = "bool"} -- Can you use free spins on this machine
	},
	buySpin = {
		buy = {d = false, t = "bool"}, -- Can you buy a spin on this machine
		cost = {d = 1000000, t = "int"}, 
	},
	-- Combo data
	wheel = { -- I know, 20 slots :O
		{n = "$1", f = "money", i = 1, p = "dolla"},
		{n = "Nothing", f = "nothing", i = "nil", p = "melon"},
		{n = "$250,000", f = "money", i = 250000, p = "dolla"},
		{n = "Spin Again", f = "prize_wheel", i = "nil", p = "mystery_1"},
		{n = "Crossbow", f = "weapon", i = "weapon_crossbow", p = "chest"},
		{n = "$1,000,000", f = "money", i = 1000000, p = "dolla"},
		{n = "100 Points", f = "ps1_points", i = 100, p = "coins"},
		{n = "Vehicle", f = "wcd_givecar", i = "alfa_stradaletdm", p = "car"},
		{n = "Die", f = "kill", i = "nil", p = "bell"},
		{n = "$50,000", f = "money", i = 50000, p = "dolla"},
		{n = "Cone Hat", f = "ps1_item", i = "conehat", p = "berry"},
		{n = "100% Armor", f = "armor", i = 100, p = "diamond"},
		{n = "SMG", f = "weapon", i = "weapon_smg1", p = "chest"},
		{n = "Nothing", f = "nothing", i = "nil", p = "melon"},
		{n = "100% Health", f = "health", i = 100, p = "diamond"},
		{n = "$100,000", f = "money", i = 100000, p = "dolla"},
		{n = "Be Alyx", f = "setmodel", i = "models/player/alyx.mdl", p = "cherry"},
		{n = "250 Points", f = "ps1_points", i = 250, p = "coins"},
		{n = "450 XP", f = "bwe_givexp", i = 450, p = "clover"},
		{n = "7 HP", f = "health", i = 7, p = "seven"},
	}
},
"models/freeman/owain_mystery_wheel.mdl")
--PATH addons/pcasino/lua/entities/pcasino_sign_interior_wall/cl_init.lua:
include("shared.lua")

function ENT:PostData()
end

function ENT:Draw()
	self:DrawModel()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 1000000 then return end

	-- We can piggyback off the distance check to only request the entities data when it's needed :D
	if (not self.data) and (not PerfectCasino.Cooldown.Check(self:EntIndex(), 5)) then
		PerfectCasino.Core.RequestConfigData(self)
		return
	end

	if not self.data then return end

	local pos = self:GetPos()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), -90)

	cam.Start3D2D(pos + (self:GetUp() * 2.8) + (self:GetForward() * 0.1) + (self:GetRight() * 10.8), ang, 0.06)
		PerfectCasino.UI.WrapText(self.data.general.text, 25, "pCasino.Title.Static", 180, 47, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
--PATH lua/entities/pfx1_02.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Molotov Fire 1"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]molotov_ground"
--PATH lua/entities/pfx1_08~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [Blue]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_campfire_blue"
--PATH lua/entities/pfx1_0e_l.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Large Fire [Default]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_large_campfire"
--PATH lua/entities/pfx4_09.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Matrix Core"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]matrix_core"
--PATH lua/entities/pfx4_0a.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Vehicle Nitro Flame"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]_car_nitro"
--PATH lua/entities/pfx5_00_alt_ss.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Micro Alt Black Hole"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]black_hole_mmicro_b"
--PATH lua/entities/pfx7_03.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fog 1"
ENT.Category         = "PPE: Weather"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[7]areal_fog_s"
--PATH lua/entities/pfx_test.lua:
-- CAT** PlaceableFX::[Fire, Smoke, Weather, Tech, Nature, Other]
-- ENT** PFX:[*]
AddCSLuaFile()     
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "light_test"
ENT.Author			= "npc_teslacybertruck_driver"
ENT.Information		= ""
ENT.Category		= "PPE: Dev"
ENT.Spawnable		= false
ENT.AdminOnly		= false
if SERVER then
    function ENT:Initialize()
	    self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
	    self:SetNoDraw(true)
	    self:DrawShadow(false)
	    self:PhysicsInit( SOLID_VPHYSICS )
	    self:SetMoveType( MOVETYPE_VPHYSICS )
	    self:SetSolid( SOLID_VPHYSICS )
        ParticleEffectAttach( "[~]light_test", 1, self, 1 )
    end
end



--PATH addons/sl_main_system/lua/entities/portail_break_sl/cl_init.lua:
include('shared.lua')

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/sl_main_system/lua/entities/portail_break_sl/shared.lua:
ENT.Type                    = "anim"
ENT.Base                    = "base_gmodentity"

ENT.PrintName				= "Portail"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= false
ENT.AdminSpawnable			= true

--game.AddParticles( "particles/mad_sololeveling3.pcf" )
PrecacheParticleSystem( "[NE]PortailRouge" )

function ENT:Initialize()
	ParticleEffectAttach("[NE]PortailRouge", 4, self, 0)
end
--PATH addons/sl_main_system/lua/entities/retour_portail_sl/shared.lua:
ENT.Type                    = "anim"
ENT.Base                    = "base_gmodentity"

ENT.PrintName				= "Portail de Retour"
ENT.Author					= "Mad"
ENT.Category                = "NE - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true

--game.AddParticles( "particles/mad_sololeveling1.pcf" )
PrecacheParticleSystem( "[NE]PortailBleue" )

function ENT:Initialize()
	ParticleEffectAttach("[NE]PortailBleue", 4, self, 0)
end
--PATH addons/sl_bouffe/lua/entities/sl_champagne2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Champagne (on plate)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bottle of champagne on a plate"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/champagneonplate.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_sodacolalarge/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cola (Large)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A large bottle of off brand cola"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/colabig.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_wineclassic1/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/winebottle1.mdl")
	
end
--PATH lua/entities/sodacan03/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Soda (Coca Cola Life)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacan03.mdl")
	
end
--PATH lua/entities/sodacanb03/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Monster Energy (Assault)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacanb03.mdl")
	
end
--PATH addons/sl_main_system/lua/effects/sl_effect3.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

local propHalos = {}  -- Tableau pour stocker les modèles nécessitant un halo

hook.Add("PreDrawHalos", "AddPropHalos", function()
    halo.Add(propHalos, Color(127,255,255,255), 0, 15, 2)  -- Ajouter des halos aux modèles stockés dans la table
end)

function EFFECT:Init( data )
    self.Ent = data:GetEntity()
    self.Pos = data:GetOrigin()

    self.LifeTime = 0.2
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

	table.insert(propHalos, self.Model)

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

--PATH addons/sl_main_system/lua/effects/sl_effect8.lua:
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

--PATH lua/effects/wraith_wirefade.lua:
local mat_glow = Material( "models/mana/c_wirefade" )
local mat_wraith

local cmd_matproxy = GetConVar( "hl2_mana_matproxy" )

tShieldFX = {}

EFFECT.FxMaterial = ""
EFFECT.Time = 1.5 -- Effect's desired life span.
EFFECT.Color = Vector( 1, 6, 48 ) -- Desired Color.

function EFFECT:Init( data )

	if ( GetConVar( "mat_fillrate" ):GetBool() ) then return end

	self.LifeTime = CurTime() + self.Time
	
	local ent = data:GetEntity()
	
	if ( !IsValid( ent ) ) then return end
	if ( !ent:GetModel() ) then return end
	
	self.FxMaterial = mat_glow
			
	local pEntity = LocalPlayer()

	if ( ent == pEntity ) && ( !pEntity:ShouldDrawLocalPlayer() ) then
		self.ViewModel = true
		self.FxMaterial = Material( "models/mana/c_wirefade_noz" )
			
		ent = pEntity:GetHands()
	end
	
	self.ParentEntity = ent
	
	if !( IsValid( self ) && IsValid( ent ) ) then return end
	
	self:SetModel( ent:GetModel() )	
	self:SetPos( ent:GetPos() )
	self:SetAngles( ent:GetAngles() )
	self:SetParent( ent )
	
	self.ParentEntity.RenderOverride = self.RenderParent
	self.ParentEntity.SpawnEffect = self

end

function EFFECT:Think( )

	if ( !IsValid( self.ParentEntity ) ) then return false end
	
	local PPos = self.ParentEntity:GetPos()
	self:SetPos( PPos + (EyePos() - PPos):GetNormal() )
	
	if ( self.LifeTime > CurTime() ) then
		return true
	end
	
	self.ParentEntity.RenderOverride = nil
	self.ParentEntity.SpawnEffect = nil
			
	return false
	
end

function EFFECT:Render()

end

function EFFECT:RenderOverlay( entity )
		
	local fFraction = ( self.LifeTime - CurTime() ) / self.Time
	
	fFraction = math.Clamp( fFraction, 0, 1 )
	
	local origin = entity:GetPos()

	local EyeNormal = origin - EyePos()
	local Distance = EyeNormal:Length()
	EyeNormal:Normalize()
	
	local offset 
	
	if ( self.ViewModel ) then
		local iFov = 54
		local wEntity = LocalPlayer():GetActiveWeapon()
		if ( IsValid( wEntity ) && wEntity.ViewModelFOV ) then
			iFov = wEntity.ViewModelFOV
		end
		
		local add = -54 + iFov
		add = add * 0.3
		
		offset = EyeAngles():Forward() * ( 12 - add )
	else
		offset = EyeNormal * Distance * 0.01
	end
	
	local Pos = EyePos() + offset
	local bClipping = self:StartClip( entity, 2, origin, -1 )
	local bClipping2 = self:StartClip( entity, 1, origin, 1 )

	local clr = self.Color
	clr = clr * ( fFraction - 0.1 )
	
	local fStrength = 1 * ( fFraction * 2 ^ ( ( 1 - fFraction ) * 2 ) )

	local owner = entity
	local dlight = DynamicLight( entity:EntIndex() )
	if ( dlight ) then
		local vLightOrigin = owner:GetBonePosition( 1 )
		if ( !vLightOrigin ) then 
			vLightOrigin = owner:GetPos()
		end
		
		dlight.pos = vLightOrigin
		dlight.r = math.min( clr.r * 10, 255 )
		dlight.g = math.min( clr.g * 10, 255 )
		dlight.b = math.min( clr.b * 10, 255 )
		dlight.brightness = 6 * fFraction 
		dlight.Size = 140 * fFraction * fStrength
		dlight.Decay = 768
		dlight.Style = 1
		dlight.DieTime = CurTime() + self.Time
	end

	self.FxMaterial:SetFloat( "$emissiveBlendStrength", fStrength )
	self.FxMaterial:SetVector( "$emissiveBlendTint", clr )
	self.FxMaterial:SetVector( "$emissiveBlendScrollVector", Vector( -1, 2 ) )
	self.FxMaterial:SetFloat( "$FleshBorderWidth", 2 + 2 * fStrength )

	cam.Start3D( Pos, EyeAngles() )
		render.MaterialOverride( self.FxMaterial )
		render.SetBlend( fFraction )
		entity:DrawModel()
		render.SetBlend( 1 )
		render.MaterialOverride()
	cam.End3D()

	render.PopCustomClipPlane()
	render.PopCustomClipPlane()
	render.EnableClipping( bClipping )
	render.EnableClipping( bClipping2 )

end

function EFFECT:RenderParent()
	
	self:DrawModel()
	
	self.SpawnEffect:RenderOverlay( self )

end

function EFFECT:StartClip( model, spd, origin, direction )

	local mn, mx = model:GetRenderBounds()
	local Up = model:GetUp() + (mx-mn):GetNormal()
	local Bottom =  origin + mn
	local Top = origin + mx
	
	local fFraction = ( self.LifeTime - CurTime() ) / self.Time
	fFraction = math.Clamp( fFraction / spd, 0, 1 )
	
	local Lerped = LerpVector( fFraction, Top, Bottom )
	
	local normal = Up 
	local distance = normal:Dot( Lerped )
	local bEnabled = render.EnableClipping( true )

	render.PushCustomClipPlane( normal * direction, distance * direction )

	return bEnabled
	
end
--PATH addons/mc_quests/lua/mqs/core/sh_util.lua:
-- ╔═╗╔═╦═══╦═══╗───────────────────────
-- ║║╚╝║║╔═╗║╔═╗║───────────────────────
-- ║╔╗╔╗║║─║║╚══╗───────────────────────
-- ║║║║║║║─║╠══╗║──By MacTavish <3──────
-- ║║║║║║╚═╝║╚═╝║───────────────────────
-- ╚╝╚╝╚╩══╗╠═══╝───────────────────────
-- ────────╚╝───────────────────────────
--──────────────────────────────────--
---------- Util functions ------------
--──────────────────────────────────--
function MQS.CheckID(id)
	id = string.match( id, "^[a-zA-Z0-9_]*$" )
	if tonumber(id) then return false end
	return id
end

function MQS.TableCompress(data)
	local json_data = util.TableToJSON(data, false)
	local compressed_data = util.Compress(json_data)
	local bytes_number = string.len(compressed_data)

	return compressed_data, bytes_number
end

function MQS.TableDecompress(compressed_data)
	local json_data = util.Decompress(compressed_data) or "[]"
	local data = util.JSONToTable(json_data)

	return data
end

function MQS.HasNPCLink(link, npc)
	if istable(link) then return link.id == npc end

	return link == npc
end

function MQS.QuestStatusCheck(tk, ply)
	if CLIENT and not ply then ply = LocalPlayer() end
	if ply.MQSdata and ply.MQSdata.Stored and ply.MQSdata.Stored.QuestList and ply.MQSdata.Stored.QuestList[tk] then return ply.MQSdata.Stored.QuestList[tk] end
	return false
end

function MQS.CanStartTask(tk, ply, npc, force)
	if CLIENT then
		ply = LocalPlayer()
	end

	local task = MQS.Quests[tk]

	if not task then return false, MSD.GetPhrase("inv_quest") end

	if not ply or not IsValid(ply) or not ply:Alive() then return false, MSD.GetPhrase("dead") end

	if MQS.HasQuest(ply) then return false, MSD.GetPhrase("active_quest") end

	if not force then
		local block, reason = hook.Call("MQS.PreventTaskStart", nil, ply, tk, task)
		if block then return false, reason or MSD.GetPhrase("inactive_quest") end

		if not MQS.IsEditor(ply) and not task.active and not MQS.Config.NPC.enable then return false, MSD.GetPhrase("inactive_quest") end

		if (CLIENT or not MQS.IsEditor(ply)) and MQS.Config.NPC.enable and (not npc or not task.link or not MQS.HasNPCLink(task.link, npc)) then return false, MSD.GetPhrase("inactive_quest") end

		local tm = ply:Team()

		if not task.team_blacklist and task.team_whitelist and not task.team_whitelist[tm] then return false, MSD.GetPhrase("team_bl") end

		if task.team_blacklist and task.team_whitelist and task.team_whitelist[tm] then return false, MSD.GetPhrase("team_bl") end

		if task.need_players and #player.GetAll() < task.need_players then return false, MSD.GetPhrase("no_players") end

		if task.cant_replay and ply.MQSdata.Stored and ply.MQSdata.Stored.QuestList and ply.MQSdata.Stored.QuestList[tk] then return false, MSD.GetPhrase("q_noreplay") end

		if task.quest_needed and MQS.Quests[task.quest_needed] and not MQS.Quests[task.quest_needed].looped and (not ply.MQSdata.Stored.QuestList or not ply.MQSdata.Stored.QuestList[task.quest_needed]) then return false, MSD.GetPhrase("q_needquest") end

		if not task.cooldow_perply and MQS.TaskQueue[tk] and MQS.TaskQueue[tk] > CurTime() then return false, MSD.GetPhrase("q_time_wait") end

		if task.cooldow_perply and ply.MQSdata.Stored.CoolDown and ply.MQSdata.Stored.CoolDown[tk] and ply.MQSdata.Stored.CoolDown[tk] > os.time() then return false, MSD.GetPhrase("q_time_wait") end

		if task.limit and MQS.TaskCount[tk] and MQS.TaskCount[tk] >= task.limit then return false, MSD.GetPhrase("q_play_limit") end

		if task.conflictlist then
			for qst, _ in pairs(task.conflictlist) do
				if MQS.TaskCount[qst] and MQS.TaskCount[qst] > 0 then
					return false, MSD.GetPhrase("q_play_limit")
				end
			end
		end

		if task.quest_blacklist and ply.MQSdata.Stored.QuestList then
			for qst, _ in pairs(task.quest_blacklist) do
				if ply.MQSdata.Stored.QuestList[qst] then
					return false, MSD.GetPhrase("inactive_quest")
				end
			end
		end

		if task.need_teamplayers then
			for tms, num in pairs(task.need_teamplayers) do
				if team.NumPlayers(tms) < tonumber(num) then return false, MSD.GetPhrase("no_players_team") end
			end
		end
	end

	return true
end

function MQS.ActiveQuestLists(npc, ply)
	if CLIENT and not ply then ply = LocalPlayer() end

	local a_quests = {}

	for k, v in pairs(MQS.Quests) do
		if MQS.CanStartTask(k, ply, npc) then
			a_quests[k] = true
		end
	end

	return a_quests
end
--PATH addons/mc_quests/lua/mqs/ui/npc_menu.lua:
local NpcMenu

function MQS.OpenNPCMenu(npc)
	local npc_table
	local simple_npc = false
	if NpcMenu then return end

	if npc:GetClass() == "mqs_npc" then
		npc_table = MQS.Config.NPC.list[npc:GetUID()]
		if not npc_table then return end
	end

	if npc:GetClass() == "mcs_npc" then
		simple_npc = true
	end

	local tasks = MQS.ActiveQuestLists(npc:GetUID())
	local sw, sh = ScrW(), ScrH()
	NpcMenu = vgui.Create("MSDSimpleFrame")
	NpcMenu:SetSize(sw, sh)
	NpcMenu:SetDraggable(false)
	NpcMenu:Center()
	NpcMenu:MakePopup()

	NpcMenu.OnClose = function()
		NpcMenu = nil
	end

	NpcMenu:SetAlpha(1)
	NpcMenu:AlphaTo(255, 0.4)
	NpcMenu.Page = 1
	NpcMenu.Pages = {}

	NpcMenu.Paint = function(self, w, h)
		Derma_DrawBackgroundBlur(self, self.startTime)
		if not npc.GetNamer then
			NpcMenu:Close()

			return
		end

		NpcMenu.Pages[NpcMenu.Page].paint(self, w, h)
	end

	local OpenPage = function(id)
		if not NpcMenu.Pages[id] then return end
		NpcMenu.Page = id
		NpcMenu.Pages[id].onOpne()
	end

	NpcMenu.clsBut = MSD.IconButton(NpcMenu, MSD.Icons48.cross, NpcMenu:GetWide() - 34, 10, 25, nil, MSD.Config.MainColor.p, function()
		if NpcMenu.OnPress then
			NpcMenu.OnPress()

			return
		end

		NpcMenu:AlphaTo(0, 0.4, 0, function()
			NpcMenu:Close()
		end)
	end)

	NpcMenu.Pages[1] = {
		paint = function(self, w, h)
		end,
		onOpne = function()
			if NpcMenu.Paneler then
				NpcMenu.Paneler:Remove()
			end

			NpcMenu.Paneler = vgui.Create("DPanel", NpcMenu)
			NpcMenu.Paneler:SetSize(sw - sw / 4 , sh / 4 - 10)
			NpcMenu.Paneler:SetPos(sw / 8, sh / 2 - 10)
			NpcMenu.Paneler.Paint = function(self, w, h)
				MSD.DrawBG(self, w, h)
				draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.Theme["d"])
				draw.SimpleText(npc:GetNamer() .. ":", "MSDFont.32", 16, 24, color_white, TEXT_ALIGN_LEFT, 1)
				local text = MSD.TextWrap(npc_table.text, "MSDFont.28", w - 24)
				draw.DrawText(text, "MSDFont.28", 16, 50, color_white, TEXT_ALIGN_LEFT, 1)
			end
			local bs = NpcMenu.Paneler:GetWide()
			local by = NpcMenu.Paneler:GetTall()

			MSD.Button(NpcMenu.Paneler, 8, by - 58, bs / 2 - 12, 50, npc_table.answer_yes, function()
				NpcMenu:AlphaTo(1, 0.4, 0, function()
					OpenPage(2)
					NpcMenu:AlphaTo(255, 0.4)
				end)
			end)

			MSD.Button(NpcMenu.Paneler, bs / 2, by - 58, bs / 2 - 12, 50, npc_table.answer_no, function()
				NpcMenu:AlphaTo(0, 0.4, 0, function()
					NpcMenu:Close()
				end)
			end)
		end,
	}

	NpcMenu.Pages[2] = {
		paint = function() end,
		onOpne = function()
			if NpcMenu.Paneler then
				NpcMenu.Paneler:Remove()
			end

			NpcMenu.Paneler = vgui.Create("DPanel", NpcMenu)
			NpcMenu.Paneler:SetSize(sw, sh - 100)
			NpcMenu.Paneler:SetPos(0, 100)
			NpcMenu.Paneler.Paint = function(self, w, h) end
			NpcMenu.Paneler = vgui.Create("MSDPanelList", NpcMenu)
			NpcMenu.Paneler:SetSize(sw - (sw / 6) * 2, sh - (sh / 8) * 2)
			NpcMenu.Paneler:SetPos(sw / 6, sh / 8)
			NpcMenu.Paneler:EnableVerticalScrollbar()
			NpcMenu.Paneler:EnableHorizontal(true)
			NpcMenu.Paneler:SetSpacing(5)
			NpcMenu.Paneler.IgnoreVbar = true

			for k, v in pairs(MQS.Quests) do
				if not tasks[k] then continue end
				local qpnl = vgui.Create("DButton")
				qpnl:SetText("")
				qpnl.alpha = 0
				qpnl.title = 0
				qpnl.StaticScale = {
					w = 1,
					h = 5,
					minw = 200,
					minh = 120
				}

				qpnl.Paint = function(self, w, h)
					if self.hover then
						self.alpha = Lerp(FrameTime() * 5, self.alpha, 1)
					else
						self.alpha = Lerp(FrameTime() * 5, self.alpha, 0)
					end

					draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.Theme["d"])

					draw.RoundedBox(MSD.Config.Rounded, 0, 0, self.title + 16, 45, MSD.Theme["d"])
					self.title = draw.SimpleText(v.name, "MSDFont.25", 8, 8, color_white, TEXT_ALIGN_LEFT)

					draw.DrawText(MSD.GetPhrase("q_start"), "MSDFont.25", 26 + self.title, 8, MSD.ColorAlpha(MSD.Config.MainColor["p"], self.alpha * 255), TEXT_ALIGN_LEFT)
					draw.DrawText(MSD.GetPhrase("q_start"), "MSDFont.25", 26 + self.title, 8, MSD.ColorAlpha(MSD.Text["d"], 255 - self.alpha * 255), TEXT_ALIGN_LEFT)

					local text = MSD.TextWrap(v.desc, "MSDFont.28", w - 16)
					draw.DrawText(text, "MSDFont.22", 8, 50, MSD.Text["d"], TEXT_ALIGN_LEFT)

					return true
				end

				qpnl.OnCursorEntered = function(self)
					self.hover = true
				end

				qpnl.OnCursorExited = function(self)
					self.hover = false
				end

				qpnl.DoClick = function(self)
					NpcMenu:Close()
					net.Start("MQS.StartTask")
					net.WriteString(k)
					net.WriteBool(simple_npc)
					if simple_npc then
						net.WriteString(npc:GetUID())
					else
						net.WriteInt(npc:GetUID(), 16)
					end

					net.SendToServer()
				end

				NpcMenu.Paneler:AddItem(qpnl)
			end

			if table.IsEmpty(tasks) then
				local pnl = vgui.Create("DPanel")

				pnl.StaticScale = {
					w = 1,
					h = 1,
					minw = 150,
					minh = 150
				}

				pnl.Paint = function(self, w, h)
					MSD.DrawTexturedRect(w / 2 - 24, h / 2 - 50, 48, 48, MSD.Icons48.account, MSD.Text["n"])
					draw.DrawText(MSD.GetPhrase("There is no quests avalible"), "MSDFont.25", w / 2, h / 2 + 10, MSD.Text["n"], TEXT_ALIGN_CENTER)
				end

				NpcMenu.Paneler:AddItem(pnl)
			end
		end,
	}

	NpcMenu.Pages[3] = {
		paint = function(self, w, h)
		end,
		onOpne = function()
			if NpcMenu.Paneler then
				NpcMenu.Paneler:Remove()
			end

			NpcMenu.Paneler = vgui.Create("DPanel", NpcMenu)
			NpcMenu.Paneler:SetSize(sw - sw / 4 , sh / 4 - 10)
			NpcMenu.Paneler:SetPos(sw / 8, sh / 2 - 10)
			NpcMenu.Paneler.Paint = function(self, w, h)
				MSD.DrawBG(self, w, h)
				draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.Theme["d"])
				draw.SimpleText(npc:GetNamer() .. ":", "MSDFont.32", 16, 24, color_white, TEXT_ALIGN_LEFT, 1)
				local text = MSD.TextWrap(npc_table.text_notask, "MSDFont.28", w - 24)
				draw.DrawText(text, "MSDFont.28", 16, 50, color_white, TEXT_ALIGN_LEFT, 1)
			end
			local bs = NpcMenu.Paneler:GetWide()
			local by = NpcMenu.Paneler:GetTall()
			MSD.Button(NpcMenu.Paneler, 8, by - 58, bs - 16, 50, npc_table.answer_notask, function()
				NpcMenu:AlphaTo(0, 0.4, 0, function()
					NpcMenu:Close()
				end)
			end)
		end,
	}

	if simple_npc then
		OpenPage(2)
	else
		if table.IsEmpty(tasks) then
			OpenPage(3)
		else
			OpenPage(1)
		end
	end
end

net.Receive("MQS.OpenNPCMenu", function()
	local npc = net.ReadEntity()
	MQS.OpenNPCMenu(npc)
end)