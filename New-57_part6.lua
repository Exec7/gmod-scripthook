--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 6/10 - 08/04/2025


--PATH addons/sl_util_accessory/lua/advanced_accessories/languages/sh_language_en.lua:
AAS = AAS or {}
AAS.Language = AAS.Language  or {}

AAS.Language["en"] = {
    ["cancel"] = "Cancel",
    ["save"] = "Save Item",
    ["name"] = "Name",
    ["model"] = "Model",
    ["itemPrice"] = "Item Price",
    ["itemPos"] = "Item Position",
    ["itemStat"] = "Item statistics",
    ["itemJob"] = "Job Exclusive",
    ["itemName"] = "Name of the item",
    ["customCharacter"] = "CUSTOM YOUR CHARACTER",
    ["adminDashboard"] = "ADMINISRATOR DASHBOARD",
    ["welcomeText"] = "WELCOME, WHAT ARE YOU BUYING?",
    ["position"] = "POSITION",
    ["rotation"] = "ROTATION",
    ["scale"] = "SCALE",
    ["description"] = "Short description of your item",
    ["search"] = "  Search Items...",
    ["sell"] = "Sell",
    ["buy"] = "Buy",
    ["buyaccessory"] = "Buy the accessory",
    ["sellaccessory"] = "Sell the accessory",
    ["sure"] = "Are you sure you want to do this?",
    ["activate"] = "Activate",
    ["desactivate"] = "Disable",
    ["modifypos"] = "Modify Position",
    ["edititem"] = "Edit Item",
    ["appearance"] = "Appearance",
    ["skin"] = "Skin",
    ["desc"] = "Description",
    ["titleactivate"] = "Activate / Disable item",
    ["choosecategory"] = "Choose Category",
    ["chooseskin"] = "Choose Skin",
    ["additem"] = "Add Item",
    ["adminname"] = "The name of the item is not correct !",
    ["faildesc"] = "Your description is not correct !",
    ["failprice"] = "The price is not correct !",
    ["choosemodel"] = "You need to choose a model for your accessory !",
    ["failcategory"] = "You need to choose a category for your accessory",
    ["updateItem"] = "You have updated",
    ["deleteItem"] = "You deleted the item",
    ["ownedItem"] = "You already have this item !",
    ["notEnoughtMoney"] = "You don't have enought money !",
    ["notRank"] = "You don't have the appropiate rank to do this !",
    ["itemDesactivate"] = "This item is actually disabled !",
    ["sellItem"] = "You selled the item for",
    ["cantEquip"] = "You can't equip this item !",
    ["itemVip"] = "The item is reserved for vip",
    ["jobProblem"] = "You don't have the possibility to do this with your job !",
    ["exploitArmory"] = "You are too far from the clothes closet to perform this action !",
    ["exploitNpc"] = "You are too far from the npc to perform this action !",
    ["saveBodygroup"] = "You have just saved your character's appearance !",
    ["addItem"] = "You added the item",
    ["buyItem"] = "You just bought",
    ["for"] = "for",
    ["noItems"] = "There are no items in the market \n Please contact an administrator for more details !",
    ["yourInventory"] = "YOUR INVENTORY",
    ["emptyInventory"] = "You have no items in your inventory",
    ["changeInv"] = "You can change your",
    ["clickingHere"] = "by clicking here !",
    ["upHere"] = "What do you want to wear today?",
    ["equipItem"] = "You have just equipped your item",
    ["deequipedItem"] = "You have just de-equipped your item",
    ["equipModel"] = "You changed your Appearance !",
    ["saveModel"] = "Save Model",
    ["toomany"] = "You don't have enough room in your backpack to buy this.",
    ["backpack"] = "Backpack",
    ["bought"] = "Possessed",
    ["comboskin"] = "Choose a skin",
    ["combocategory"] = "Choose a category",
    ["waitItem"] = "Please wait a moment before equipping another accessory.",
    ["waitEquip"] = "You are fitting the accessory..",
    ["swepcantgo"] = "You can't go to the accessory shop with the swep !",
    ["iconPos"] = "Modify icon position",
    ["iconFov"] = "Modify icon FOV",
    ["itemUniqueId"] = "Item UniqueId",
    ["adjustAccessory"] = "Adjust Accessory",
    ["adjust"] = "Adjust",
    ["adjustText"] = "Do you want to adjust the item ?",
    ["notOwned"] = "You don't own this item !",
    ["rankBlackList"] = "Rank Blacklisted",

    ["titleGingerBread"] = "Ginger Bread",
    ["titleCap"] = "Cap",
    ["titleHeadphones"] = "Headphones",
    ["titleHawkMask"] = "Hawk Mask",
    ["titleBeret"] = "Beret",
    ["titleBandMask"] = "Band Mask",
    ["titlePinguin"] = "Pinguin Mask",
    ["titleMummyMask"] = "Mummy Mask",
    ["titleBandana"] = "Bandana",
    ["titleBag"] = "Bag",
    ["titleMonkeyMask"] = "Monkey Mask",
    ["titleNinjaMask"] = "Ninja Mask",
    ["titleZombieMask"] = "Zombie Mask",
    ["titlePleaseStop"] = "Please Stop",
    ["titleSkullMask"] = "Skull Mask",
    ["titleGentlemanshat"] = "Gentleman's Hat",
    ["titleMaskDoctor"] = "Doctor Mask",
    ["titleOrangeHat"] = "Orange Hat",
    ["titleBlackBagPack"] = "Black Bagpack",
    ["titlePigHat"] = "Pig Hat",
    ["titleCap2"] = "Cap 2",
    ["titleBigBagpack"] = "Big Bagpack 2",
    ["titleSchoolBagPack"] = "School bagpack",
    ["titleBeerHat"] = "Beer hat",
    ["titleArmor"] = "Armor",
    ["titleMaskDuck"] = "Duck Mask",
    ["titleGlasses"] = "Glasses",
    ["titleGlasses2"] = "Glasses 2",
    ["titleAfro"] = "Afro",
    ["titleMarioHat"] = "Mario Hat",
    ["titleGlasses3"] = "Glasses 3",
    ["titleLuigiHat"] = "Luigi Hat",
    ["titleGlasses4"] = "Glasses 4",
    ["titleGlasses5"] = "Glasses 5",
    ["titleToadHat"] = "Toad Hat",
    ["titleServboHead"] = "Servbo Head",
    ["titleCatHat"] = "Cat Hat",
    ["titleStrawHat"] = "Straw Hat",
    ["titleRabbitEar"] = "Rabbit Ear",
    ["titleSunHat"] = "Sun hat",
    ["title3DGlasses"] = "3D Glasses",
    ["titleCatsEars"] = "Cat's Ears",
    ["titleCatHat2"] = "Cat Hat 2",
    ["titleJasonMask"] = "Jason Mask",
    ["titleMustache"] = "Mustache",
    ["titleCowboyHat"] = "Cowboy Hat",
    ["titleDeadmau5"] = "Deadmau5",
    ["titleFrogHat"] = "Frog Hat",
    ["titleHeartBand"] = "Heart Band",
    ["titlePumpkinHead"] = "Pumpkin Head",
    ["titleChristmasHat"] = "Christmas Hat",
    ["titleStarHeadband"] = "Star Headband",
    ["titleThomasHat"] = "Thomas Hat",
    ["titleSombrero"] = "Sombrero",
    ["titleHeadphones2"] = "Headphones 2",
    ["titleSnowGoggles"] = "Snow Goggles",
    ["titleCap3"] = "Cap 3",
    ["titleHat"] = "Black hat",
    ["titleGlasses6"] = "Glasses 6",
    ["titleCap4"] = "Cap 4",
    ["titleDrinkCap"] = "Drink Cap",
    ["titleStarGlasses"] = "Star Glasses",
    ["titleCatEars"] = "Cat Ears",
    ["titleHat2"] = "Hat 2",
    ["titleBabyRhino"] = "Baby Rhino",
    ["titleArnoldMask"] = "Arnold Mask",
    ["titleChuckMask"] = "Chuck Mask",
    ["titleDeerMask"] = "Deer Mask",
    ["titlePandaMask"] = "Panda Mask",
    ["titleMonkeyMask2"] = "Monkey Mask 2",
    ["titleBearMask"] = "Bear Mask",
    ["titlePigMask"] = "Pig Mask.",
    ["titlePolishBeret"] = "Polish Beret",
    ["titlePolishBeret2"] = "Polish Beret 2",
    ["titlePolishBeret3"] = "Polish Beret 3",
    ["titleBikeHelmet"] = "Bike Helmet",
    ["titleBikeHelmet2"] = "Bike Helmet 2",
    ["titleBikeHelmet3"] = "Bike Helmet 3",
    ["titleBikeHelmet4"] = "Bike Helmet 4",
    ["titleBikeHelmet5"] = "Bike Helmet 5",
    ["titleBikeHelmet6"] = "Bike Helmet 6",
    ["titleBikeHelmet7"] = "Bike Helmet 7",
    ["titleBikeHelmet8"] = "Bike Helmet 8",
    ["titleBikeHelmet9"] = "Bike Helmet 9",
    ["titleBikeHelmet10"] = "Bike Helmet 10",
    ["titleBikeHelmet11"] = "Bike Helmet 11",
    ["titleBikeHelmet12"] = "Bike Helmet 12",
    ["titleBikeHelmet13"] = "Bike Helmet 13",
    ["titleBikeHelmet14"] = "Bike Helmet 14",
    ["titleBikeHelmet15"] = "Bike Helmet 15",
    ["titlePumpkinMask"] = "Pumpkin Mask",
    ["titleHorseMask"] = "Horse Mask",
    ["titleHorseMask2"] = "Horse Mask 2",
    ["titleHorseMask3"] = "Horse Mask 3",
    ["titleRussianHat"] = "Russian Hat",

    ["descGingerBread"] = "A beautiful Ginger Bread",
    ["descCap"] = "A cap if you are cold!",
    ["descHeadphones"] = "Too much noise this accessory is made for you",
    ["descHawkMask"] = "A beautiful Hawk Mask",
    ["descBeret"] = "Wow! It looks great on you",
    ["descBandMask"] = "Best Crime Mask",
    ["descPinguin"] = "A Pinguin mask",
    ["descMummyMask"] = "Now you're Anubis friend",
    ["descBandana"] = "A beautiful bandana.",
    ["descBag"] = "Your favorite grocery bag!",
    ["descMonkeyMask"] = "A beautiful monkey mask",
    ["descNinjaMask"] = "Your shinobi pass!",
    ["descZombieMask"] = "Perfect for your death trip!",
    ["descPleaseStop"] = "A beautiful mask!",
    ["descSkullMask"] = "Best mask for your haloween pranks",
    ["descGentlemanshat"] = "A gentleman's hat",
    ["descMaskDoctor"] = "A Doctor mask",
    ["descOrangeHat"] = "A Orange hat",
    ["descBlackBagPack"] = "A black bagpack",
    ["descPigHat"] = "Do you love pig?",
    ["descCap2"] = "To protect you from the sun!",
    ["descBigBagpack"] = "A Big Bagpack",
    ["descSchoolBagPack"] = "A school bagpack",
    ["descBeerHat"] = "A beer hat",
    ["descArmor"] = "A Resistant Bulletproof",
    ["descMaskDuck"] = "A funny duck hat",
    ["descGlasses"] = "Do your eyes hurt? Then they are made for you",
    ["descGlasses2"] = "Do your eyes hurt? Then they are made for you",
    ["descAfro"] = "Want to look good?",
    ["descMarioHat"] = "If you are a Mario fan!",
    ["descGlasses3"] = "Do your eyes hurt? Then they are made for you",
    ["descLuigiHat"] = "If you are a Luigi fan!",
    ["descGlasses4"] = "Do your eyes hurt? Then they are made for you",
    ["descGlasses5"] = "Do your eyes hurt? Then they are made for you",
    ["descToadHat"] = "If you are a Toad fan!",
    ["descServboHead"] = "I love life!",
    ["descCatHat"] = "A beautifull cat hat.",
    ["descStrawHat"] = "A beautiful straw hat!",
    ["descRabbitEar"] = "Very nice rabbit ears",
    ["descSunHat"] = "To have a good time while traveling",
    ["desc3DGlasses"] = "To have a good time at the cinema!",
    ["descCatsEars"] = "Feel like a cat.",
    ["descCatHat2"] = "A beautifull cat hat.",
    ["descJasonMask"] = "The mask from your favorite horror movie",
    ["descMustache"] = "A beautiful Mustache!",
    ["descCowboyHat"] = "Have you always dreamed of becoming a cowboy?",
    ["descDeadmau5"] = "Have you ever dreamed of being Deadmau5?",
    ["descFrogHat"] = "A beautiful frog hat.",
    ["descHeartBand"] = "A headband with heart.",
    ["descPumpkinHead"] = "The perfect face mask for your Halloween outings.",
    ["descChristmasHat"] = "We wish you a merry christmas.",
    ["descStarHeadband"] = "Become a star with this headband.",
    ["descThomasHat"] = "Do you love music?",
    ["descSombrero"] = "A beautiful mexican hat!",
    ["descHeadphones2"] = "With these headphones listen to quality music",
    ["descSnowGoggles"] = "To ski in complete safety!",
    ["descCap3"] = "A good cap.",
    ["descHat"] = "A luxurious black hat.",
    ["descGlasses6"] = "A luxurious pair of glasses.",
    ["descCap4"] = "A basic cap.",
    ["descDrinkCap"] = "A beautiful drink hat for a drunkard!",
    ["descStarGlasses"] = "If you dream of becoming a star!",
    ["descCatEars"] = "Beautiful cat ears to become NEKO UWU.",
    ["descHat2"] = "A good basic black hat.",
    ["descBabyRhino"] = "If you love Rhino.",
    ["descArnoldMask"] = "Arnold Mask, but it doesn't make you Arnold Schwarzenegger.",
    ["descChuckMask"] = "Chuck Mask",
    ["descDeerMask"] = "A beautiful Deer Mask!",
    ["descPandaMask"] = "A cool Panda mask! For your hot nights with your girlfriend",
    ["descMonkeyMask2"] = "The best monkey mask on the market!",
    ["descBearMask"] = "A simple bear mask. Don't get close to animal catchers",
    ["descPigMask"] = "You look like a wildcat... No, wait, you look like a pig",
    ["descPolishBeret"] = "A beautiful Polish Beret",
    ["descPolishBeret2"] = "A beautiful Polish Beret",
    ["descPolishBeret3"] = "A beautiful Polish Beret",
    ["descBikeHelmet"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet2"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet3"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet4"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet5"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet6"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet7"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet8"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet9"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet10"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet11"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet12"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet13"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet14"] = "Put the helmet on, or the police will stop you!",
    ["descBikeHelmet15"] = "Put the helmet on, or the police will stop you!",
    ["descPumpkinMask"] = "For a better Halloween",
    ["descHorseMask"] = "I'M A HORSE UWUWUWU",
    ["descHorseMask2"] = "I'M A HORSE UWUWUWU",
    ["descHorseMask3"] = "I'M A HORSE UWUWUWU",
    ["descRussianHat"] = "Hardbass forever epta!",
}
--76561198442896680
--PATH addons/sl_util_accessory/lua/advanced_accessories/languages/sh_language_pl.lua:
AAS = AAS or {}
AAS.Language = AAS.Language  or {}

AAS.Language["pl"] = {
    ["cancel"] = "Anuluj",
    ["save"] = "Rejestr",
    ["name"] = "Nazwa",
    ["model"] = "Model",
    ["itemPrice"] = "Cena Przedmiotu",
    ["itemPos"] = "Pozycja Przedmiotu",
    ["itemStat"] = "Statystyki Przedmiotu",
    ["itemJob"] = "Wyłączność dla Prac",
    ["itemName"] = "Nazwa Przedmiotu",
    ["customCharacter"] = "DOSTOSUJ SWÓJ CHARAKTER",
    ["adminDashboard"] = "PANEL ADMINISTRATORA",
    ["welcomeText"] = "WITAJ, CO KUPUJESZ?",
    ["position"] = "POZYCJA",
    ["rotation"] = "OBRÓT",
    ["scale"] = "SKALA",
    ["description"] = "Krótki opis twojego przedmiotu",
    ["search"] = "  Wyszukaj Przedmiot...",
    ["sell"] = "Sprzedaj",
    ["buy"] = "Kup",
    ["buyaccessory"] = "Kup Akcesoria",
    ["sellaccessory"] = "Sprzedaj Akcesoria",
    ["sure"] = "Czy na pewno chcesz to zrobić?",
    ["activate"] = "Aktywuj",
    ["desactivate"] = "Wyłącz",
    ["modifypos"] = "Zmień Pozycję",
    ["edititem"] = "Edytuj",
    ["appearance"] = "Wygląd",
    ["skin"] = "Skóra",
    ["desc"] = "Opis",
    ["titleactivate"] = "Aktywuj / Wyłącz przedmiot",
    ["choosecategory"] = "Wybierz Kategorię",
    ["chooseskin"] = "Wybierz Skórkę",
    ["additem"] = "Dodaj Przedmiot",
    ["adminname"] = "Nazwa przedmiotu jest nieprawidłowa !",
    ["faildesc"] = "Twój opis jest niepoprawny !",
    ["failprice"] = "Cena nie jest prawidłowa !",
    ["choosemodel"] = "Musisz wybrać model dla swojego akcesorium !",
    ["failcategory"] = "Muszisz wybrać kategorię dla swojego akcesorium",
    ["updateItem"] = "Zaktualizowałeś",
    ["deleteItem"] = "Usunąłeś przedmiot",
    ["ownedItem"] = "Już masz ten przedmiot !",
    ["notEnoughtMoney"] = "Nie masz wystarczająco pieniędzy !",
    ["notRank"] = "Nie masz odpowiedzniej rangi aby to zrobić !",
    ["itemDesactivate"] = "Ten przedmiot jest wyłączony !",
    ["sellItem"] = "Sprzedałeś przedmiot za",
    ["cantEquip"] = "Nie możesz wyposażyć tego przedmiotu !",
    ["itemVip"] = "Przedmiot jest zarezerwowany dla vip",
    ["jobProblem"] = "Nie masz takiej możliwośći w swojej pracy !",
    ["exploitArmory"] = "Jesteś zbyt daleko szafy na ubrania by wykonać tę czynność !",
    ["exploitNpc"] = "Jesteś za daleko od NPC aby wykonać tę akcję !",
    ["saveBodygroup"] = "Właśnie zapisałeś wygląd swojej postaci !",
    ["addItem"] = "Dodałeś przedmiot",
    ["buyItem"] = "Właśnie kupiłeś",
    ["for"] = "dla",
    ["noItems"] = "Na rynku nie ma żadnych przedmiotów \n Aby uzyskać więcej informacji skontaktuj się z administratorem !",
    ["yourInventory"] = "TWÓJ EKWIPUNEK",
    ["emptyInventory"] = "Nie masz żadnych przedmiotów w ekwipunku",
    ["changeInv"] = "Możesz zmienić swoje",
    ["clickingHere"] = "klikając tutaj !",
    ["upHere"] = "Co chcesz dzisiaj wybrać ?",
    ["equipItem"] = "Właśnie wyposażyłeś swój przedmiot",
    ["deequipedItem"] = "Właśnie zdemontowałeś swój przedmiot",
    ["equipModel"] = "Zmieniłeś swój wygląd !",
    ["saveModel"] = "Zapisz model",
    ["toomany"] = "Nie masz wystarczająco miejsca w plecaku aby to kupić.",
    ["backpack"] = "Plecak",
    ["bought"] = "Possessed",
    ["comboskin"] = "Wybierz skórkę",
    ["combocategory"] = "Wybierz kategorię",
    ["waitItem"] = "Poczekaj chwilę przed wyposażeniem kolejnego akcesorium.",
    ["waitEquip"] = "Dopasowujesz akcesorium..",
    ["swepcantgo"] = "Nie możesz iść do sklepu z akcesoriami z sweap'em !",
    ["iconPos"] = "Zmień pozycję ikony",
    ["iconFov"] = "Modyfikuj iconę FOV",
    ["itemUniqueId"] = "Unikalny identyfikator przedmiotu",
    ["adjustAccessory"] = "Dostosuj akcesorium",
    ["adjust"] = "Dostosuj",
    ["adjustText"] = "Czy chcesz dostosować ten element?",
    ["notOwned"] = "Nie kupiłeś tego przedmiotu !",
    ["rankBlackList"] = "Pozycja na czarnej liście",

    ["titleGingerBread"] = "Piernik",
    ["titleCap"] = "Czapka",
    ["titleHeadphones"] = "Słuchawki",
    ["titleHawkMask"] = "Jastrzębia",
    ["titleBeret"] = "Beret",
    ["titleBandMask"] = "Maska",
    ["titlePinguin"] = "Maska Pingwina",
    ["titleMummyMask"] = "Maska Mumii",
    ["titleBandana"] = "Bandana",
    ["titleBag"] = "Torba",
    ["titleMonkeyMask"] = "Maska Małpy",
    ["titleNinjaMask"] = "Maska Ninja",
    ["titleZombieMask"] = "Maska Zombie",
    ["titlePleaseStop"] = "Proszę Przestań",
    ["titleSkullMask"] = "Maska Czaszki",
    ["titleGentlemanshat"] = "Dżentelmena",
    ["titleMaskDoctor"] = "Maska Doktora",
    ["titleOrangeHat"] = "Czapka",
    ["titleBlackBagPack"] = "Czarny Plecak",
    ["titlePigHat"] = "Czapka Świni",
    ["titleCap2"] = "Czapka 2",
    ["titleBigBagpack"] = "Duży Plecak 2",
    ["titleSchoolBagPack"] = "Plecak szkolny",
    ["titleBeerHat"] = "Piwny kapelusz",
    ["titleArmor"] = "Opancerzenie",
    ["titleMaskDuck"] = "Maska Kaczki",
    ["titleGlasses"] = "Okulary",
    ["titleGlasses2"] = "Okulary 2",
    ["titleAfro"] = "Afro",
    ["titleMarioHat"] = "Czapka Mario",
    ["titleGlasses3"] = "Okulary 3",
    ["titleLuigiHat"] = "Czapka Luigi",
    ["titleGlasses4"] = "Okulary 4",
    ["titleGlasses5"] = "Okulary 5",
    ["titleToadHat"] = "Kapelusz",
    ["titleServboHead"] = "Głowa Servbo",
    ["titleCatHat"] = "Czapka Kota",
    ["titleStrawHat"] = "Kapelusz",
    ["titleRabbitEar"] = "Ucho Królika",
    ["titleSunHat"] = "Czapka",
    ["title3DGlasses"] = "3D Okulary",
    ["titleCatsEars"] = "Kocie uszy",
    ["titleCatHat2"] = "Czapka Kota 2",
    ["titleJasonMask"] = "Maska Jasona",
    ["titleMustache"] = "Wąsy",
    ["titleCowboyHat"] = "Kowbojski Kapelusz",
    ["titleDeadmau5"] = "Deadmau5",
    ["titleFrogHat"] = "Czapka Żaby",
    ["titleHeartBand"] = "Opaska",
    ["titlePumpkinHead"] = "Dyniowa Głowa",
    ["titleChristmasHat"] = "Świąteczna Czapka",
    ["titleStarHeadband"] = "Opaska",
    ["titleThomasHat"] = "Czapka Thomasa",
    ["titleSombrero"] = "Sombrero",
    ["titleHeadphones2"] = "Słuchawki 2",
    ["titleSnowGoggles"] = "Gogle Śnieżne",
    ["titleCap3"] = "Czapka 3",
    ["titleHat"] = "Czarna czapka",
    ["titleGlasses6"] = "Okulary 6",
    ["titleCap4"] = "Czapka 4",
    ["titleDrinkCap"] = "Drink Cap",
    ["titleStarGlasses"] = "Okulary",
    ["titleCatEars"] = "Kocie Uszy",
    ["titleHat2"] = "Czapka 2",
    ["titleBabyRhino"] = "Mały Nosorożec",
    ["titleArnoldMask"] = "Maska Arnolda",
    ["titleChuckMask"] = "Maska Chucka",
    ["titleDeerMask"] = "Maska Jelenia",
    ["titlePandaMask"] = "Maska Pandy",
    ["titleMonkeyMask2"] = "Maska Małpy 2",
    ["titleBearMask"] = "Niedźwiedzia",
    ["titlePigMask"] = "Maska Świni.",
    ["titlePolishBeret"] = "Polski Beret",
    ["titlePolishBeret2"] = "Polski Beret 2",
    ["titlePolishBeret3"] = "Polski Beret 3",
    ["titleBikeHelmet"] = "Kask Rowerowy",
    ["titleBikeHelmet2"] = "Kask Rowerowy",
    ["titleBikeHelmet3"] = "Kask Rowerowy",
    ["titleBikeHelmet4"] = "Kask Rowerowy",
    ["titleBikeHelmet5"] = "Kask Rowerowy",
    ["titleBikeHelmet6"] = "Kask Rowerowy",
    ["titleBikeHelmet7"] = "Kask Rowerowy",
    ["titleBikeHelmet8"] = "Kask Rowerowy",
    ["titleBikeHelmet9"] = "Kask Rowerowy",
    ["titleBikeHelmet10"] = "Kask Rowerowy",
    ["titleBikeHelmet11"] = "Kask Rowerowy",
    ["titleBikeHelmet12"] = "Kask Rowerowy",
    ["titleBikeHelmet13"] = "Kask Rowerowy",
    ["titleBikeHelmet14"] = "Kask Rowerowy",
    ["titleBikeHelmet15"] = "Kask Rowerowy",
    ["titlePumpkinMask"] = "Maska Dyni",
    ["titleHorseMask"] = "Maska Konia",
    ["titleHorseMask2"] = "Maska Konia 2",
    ["titleHorseMask3"] = "Maska Konia 3",
    ["titleRussianHat"] = "Rosyjska Czapka",

    ["descGingerBread"] = "Piękny piernik",
    ["descCap"] = "Czapka jeśli jest ci zmino!",
    ["descHeadphones"] = "Za dużo hałasu to akcesorium jest stworzone dla Ciebie",
    ["descHawkMask"] = "Piękna maska ​​jastrzębia",
    ["descBeret"] = "Wow! To wygląda na Tobie świetnie",
    ["descBandMask"] = "Najlepsza maska do napadu",
    ["descPinguin"] = "Maska Pingwina",
    ["descMummyMask"] = "Teraz jesteś przyjacielem Anubisa",
    ["descBandana"] = "Piękna bandana.",
    ["descBag"] = "Twoja ulubiona torba na zakupy!",
    ["descMonkeyMask"] = "Piękna maska małpy",
    ["descNinjaMask"] = "Twoja przepustka shinobi!",
    ["descZombieMask"] = "Idealny na twoją podróż śmierci!",
    ["descPleaseStop"] = "Piękna maska!",
    ["descSkullMask"] = "Najlepsza maska ​​na twoje haloweenowe figle",
    ["descGentlemanshat"] = "Czapka dżentelmena",
    ["descMaskDoctor"] = "Maska doktora",
    ["descOrangeHat"] = "Pomarańczowa czapka",
    ["descBlackBagPack"] = "Czarny plecak",
    ["descPigHat"] = "Kochasz świnie?",
    ["descCap2"] = "Aby chronić Cię przed słońcem!",
    ["descBigBagpack"] = "Duży plecak",
    ["descSchoolBagPack"] = "Plecak szkolny",
    ["descBeerHat"] = "Piwny kapelusz",
    ["descArmor"] = "Kuloodporny",
    ["descMaskDuck"] = "Zabawna czapka kaczki",
    ["descGlasses"] = "Czy bolą cię oczy? Wtedy są stworzone dla ciebie",
    ["descGlasses2"] = "Czy bolą cię oczy? Wtedy są stworzone dla ciebie",
    ["descAfro"] = "Chcesz dobrze wyglądać?",
    ["descMarioHat"] = "Jeśli jesteś fanem Mario!",
    ["descGlasses3"] = "Czy bolą cię oczy? Wtedy są stworzone dla ciebie",
    ["descLuigiHat"] = "Jeśli jesteś fanem Luigi!",
    ["descGlasses4"] = "Czy bolą cię oczy? Wtedy są stworzone dla ciebie",
    ["descGlasses5"] = "Czy bolą cię oczy? Wtedy są stworzone dla ciebie",
    ["descToadHat"] = "Jeśli jesteś fanem Toada!",
    ["descServboHead"] = "Kocham życię!",
    ["descCatHat"] = "Piękna kocia czapka.",
    ["descStrawHat"] = "Piękny słomiany kapelusz!",
    ["descRabbitEar"] = "Bardzo ładne królicze uszy",
    ["descSunHat"] = "Aby dobrze się bawić podczas podróży",
    ["desc3DGlasses"] = "Aby dobrze się bawić w kinie!",
    ["descCatsEars"] = "Poczuj się jak kot.",
    ["descCatHat2"] = "Piękny kapelusz dla kota.",
    ["descJasonMask"] = "Maska z twojego ulubionego horroru",
    ["descMustache"] = "Piękne wąsy!",
    ["descCowboyHat"] = "Czy zawsze marzyłeś o zostaniu kowbojem?",
    ["descDeadmau5"] = "Czy kiedykolwiek marzyłeś o byciu Deadmau5?",
    ["descFrogHat"] = "Piękna żabia czapka.",
    ["descHeartBand"] = "Opaska z sercem.",
    ["descPumpkinHead"] = "Idealna maska ​​na twarz na Halloweenowe wyjścia.",
    ["descChristmasHat"] = "Życzymy ci wesołych świąt.",
    ["descStarHeadband"] = "Zostań gwiazdą z tym.",
    ["descThomasHat"] = "Czy kochasz muzykę?",
    ["descSombrero"] = "Piękny meksykański kapelusz!",
    ["descHeadphones2"] = "Z tymi słuchawkami słuchaj wysokiej jakości muzyki",
    ["descSnowGoggles"] = "Do jazdy na nartach całkowicie bezpiecznie!",
    ["descCap3"] = "Dobra czapka.",
    ["descHat"] = "Luksusowa czarna czapka.",
    ["descGlasses6"] = "Luksusowa para okularów.",
    ["descCap4"] = "Zwykła czapka.",
    ["descDrinkCap"] = "Piękny kapelusz na drinka dla pijaka!",
    ["descStarGlasses"] = "Jeśli marzysz o zostaniu gwiazdą!",
    ["descCatEars"] = "Piękne kocie uszy aby stać się NEKO UWU.",
    ["descHat2"] = "Dobry zwykły czarny kapelusz.",
    ["descBabyRhino"] = "Jeśli kochasz nosorożcę.",
    ["descArnoldMask"] = "Maska Arnolda, ale to nie czyni z ciebie Arnolda Schwarzeneggera.",
    ["descChuckMask"] = "Maska Chucka",
    ["descDeerMask"] = "Piękna maska jelenia!",
    ["descPandaMask"] = "Fajna maska ​​Pandy! Na gorące noce z dziewczyną",
    ["descMonkeyMask2"] = "Najlepsza maska ​​małpy na rynku!",
    ["descBearMask"] = "Prosta maska ​​niedźwiedzia. Nie zbliżaj się do kłusowników",
    ["descPigMask"] = "Wyglądasz jak dzik Nie, czekaj, wyglądasz jak świnia",
    ["descPolishBeret"] = "Piękny polski beret",
    ["descPolishBeret2"] = "Piękny polski beret",
    ["descPolishBeret3"] = "Piękny polski beret",
    ["descBikeHelmet"] = "Załóż kask, bo policja cię zatrzyma!",
    ["descBikeHelmet2"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet3"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet4"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet5"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet6"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet7"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet8"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet9"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet10"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet11"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet12"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet13"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet14"] = "Załóż kask, bo policja cię zatrzym!",
    ["descBikeHelmet15"] = "Załóż kask, bo policja cię zatrzym!",
    ["descPumpkinMask"] = "Na lepsze Halloween",
    ["descHorseMask"] = "JESTEM KONIEM UWUWUWU",
    ["descHorseMask2"] = "JESTEM KONIEM UWUWUWU",
    ["descHorseMask3"] = "JESTEM KONIEM UWUWUWU",
    ["descRussianHat"] = "Hardbass na zawsze epta!",
}
--76561198442896680
--PATH addons/sl_util_accessory/lua/advanced_accessories/sh_materials.lua:
AAS = AAS or {}
AAS.Materials = AAS.Materials or {}

AAS.Materials = {
    ["informations"] = Material("aas_materials/ass_informations.png", "smooth"),
    ["house"] = Material("aas_materials/aas_house.png", "smooth"),
    ["close"] = Material("aas_materials/aas_close.png", "smooth"),
    ["settings"] = Material("aas_materials/aas_settings.png", "smooth"),
    ["new"] = Material("aas_materials/aas_new.png", "smooth"),
    ["vip"] = Material("aas_materials/aas_vip.png", "smooth"),
    ["newButton"] = Material("aas_materials/aas_back_buttonnew.png", "smooth"),
    ["vipButton"] = Material("aas_materials/aas_back_buttonvip.png", "smooth"),
    ["searchbar"] = Material("aas_materials/aas_searchbar.png", "smooth"),
    ["circle"] = Material("aas_materials/aas_circle.png", "smooth"),
    ["arrowleft"] = Material("aas_materials/aas_arrow_left.png", "smooth"),
    ["arrowright"] = Material("aas_materials/aas_arrow_right.png", "smooth"),
    ["customcharacter"] = Material("aas_materials/aas_custom_character.png", "smooth"), 
    ["avatar"] = Material("aas_materials/aas_avatar.png", "smooth"), 
    ["sliderarrowleft"] = Material("aas_materials/aas_left_slider3.png", "smooth"), 
    ["sliderarrowright"] = Material("aas_materials/aas_left_right3.png", "smooth"), 
    ["market"] = Material("aas_materials/aas_market.png", "smooth"), 
    ["health"] = Material("aas_materials/aas_heart_1.png", "smooth"), 
    ["shield"] = Material("aas_materials/aas_shield.png", "smooth"),
    ["foot"] = Material("aas_materials/aas_foot.png", "smooth"),
    ["editpos"] = Material("aas_materials/aas_editpos.png", "smooth"),
    ["removeitem"] = Material("aas_materials/aas_delete.png", "smooth"),
    ["inactive"] = Material("aas_materials/aas_button_inactive.png", "smooth"), 
    ["scale"] = Material("aas_materials/aas_scale.png", "smooth"),
    ["all"] = Material("aas_materials/aas_points.png", "smooth"),
    ["selected"] = Material("aas_materials/aas_selected.png", "smooth"),
    ["upButton"] = Material("aas_materials/aas_up_button.png", "smooth"),
    ["unEquip"] = Material("aas_materials/ass_unequip.png", "smooth"),
    ["add"] = Material("aas_materials/aas_add.png", "smooth"),
}
--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_inventory.lua:
local function countTable(cat)
    local Count = 1
    local tblInventory = AAS.GetInventory()
    for k,v in pairs(tblInventory) do
        local itemTable = AAS.GetTableById(v.uniqueId)
        if itemTable.category != cat then continue end

        if not istable(itemTable) or #itemTable < 0 then continue end
        if not isstring(itemTable.model) then continue end

        Count = Count + 1
    end

    return Count
end

function AAS.InventoryMenu(itemMenuAccess)
    AAS.ClientTable["filters"] = {["vip"] = true, ["new"] = true, ["search"] = ""}

    local tblInventory = AAS.GetInventory()
    if not istable(tblInventory) or #tblInventory == 0 then AAS.Notification(5, AAS.GetSentence("emptyInventory")) return end

    AAS.BaseMenu(AAS.GetSentence("yourInventory"), true, AAS.ScrW*0.1595, "house")
    AAS.ClientTable["Id"] = (AAS.ScrH*0.038)*(AAS.ClientTable["Id"] - 1)
    
    playerModel = vgui.Create("AAS:DModel", accessoriesFrame)
    playerModel:SetFOV(25)
    
    local categoryList = vgui.Create("DScrollPanel", accessoriesFrame)
    categoryList:SetSize(AAS.ScrW*0.038, AAS.ScrH*0.5)
    categoryList:SetPos(0, AAS.ScrH*0.1)
    categoryList.Paint = function(self,w,h)
        draw.RoundedBox(0, 0, 0, AAS.ScrW*0.038, AAS.ScrH*0.038, AAS.Colors["selectedBlue"])
        draw.RoundedBox(0, AAS.ScrW*0.038 - AAS.ScrW*0.0017, 0, AAS.ScrW*0.002, AAS.ScrH*0.038, AAS.Colors["white200"])
    end

    if AAS.WeightActivate then
        local DProgress = vgui.Create("DPanel", accessoriesFrame)
        DProgress:SetSize(AAS.ScrW*0.385, AAS.ScrH*0.02)
        DProgress:SetPos(accessoriesFrame:GetWide()*0.08, accessoriesFrame:GetTall()*0.95)
        DProgress.Paint = function(self,w,h)
            local count = AAS.CountInventory()
            local max = (not isnumber(AAS.WeightInventory[AAS.LocalPlayer:GetUserGroup()]) and AAS.WeightInventory["all"] or AAS.WeightInventory[AAS.LocalPlayer:GetUserGroup()])

            draw.RoundedBox(0, 0, 0, w, h, AAS.Colors["black18230"])
            draw.RoundedBox(0, 0, 0, w*((count*100/max)/100), h, AAS.Colors["selectedBlue"])

            surface.SetDrawColor(AAS.Colors["white200"])
            surface.DrawOutlinedRect(0, 0, w, h, 1)

            draw.SimpleText(AAS.GetSentence("backpack").." "..count.." / "..max, "AAS:Font:04", w/2, h/2.3, AAS.Colors["white200"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    local categoryButton = vgui.Create("DButton", categoryList)
    categoryButton:SetSize(0, AAS.ScrH*0.038)
    categoryButton:Dock(TOP)
    categoryButton:SetText("")
    categoryButton:DockMargin(0,0,0,AAS.ScrH*0.006)
    categoryButton.Paint = function(self,w,h)
        draw.RoundedBox(0, 0, 0, w, h, AAS.Colors["selectedBlue"])
        draw.RoundedBox(0, w*0.955, 0, w*0.1, h, AAS.Colors["white200"])

        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["avatar"])
        surface.DrawTexturedRect(w/2 - AAS.ScrW*0.015/2, h/2 - AAS.ScrH*0.0268/2, AAS.ScrW*0.015, AAS.ScrH*0.0268)
    end
    categoryButton.DoClick = function()
        AAS.ClientTable["Id"] = k 
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
    end 
    
    newButton.DoClick = function()
        newButton:ChangeStatut(true)
    end 
    
    local containerScroll = vgui.Create("DScrollPanel", accessoriesFrame)
    containerScroll:SetSize(AAS.ScrW*0.38, AAS.WeightActivate and AAS.ScrH*0.52 or AAS.ScrH*0.56)
    containerScroll:SetPos(AAS.ScrW*0.05, AAS.ScrH*0.085)
    containerScroll:GetVBar():SetWide(0)
    
    local firstOpen = true
    local AASTimerId = 0
    for k,v in ipairs(AAS.Category["mainMenu"]) do
        if v.all then continue end

        local itemsInventory = AAS.GetInventoryByCategory(v.uniqueName)

        local Deployed, LerpPos = false, 0
        local count = istable(itemsInventory[v.uniqueName]) and countTable(v.uniqueName) or 0

        local size = (math.ceil(count/6)-1)*AAS.ScrH*0.1 + AAS.ScrH*0.22
        
        local mainPanel = vgui.Create("DPanel", containerScroll)
        mainPanel:SetSize(0, AAS.ScrH*0.125)
        mainPanel:Dock(TOP)

        local catList = vgui.Create("DScrollPanel", mainPanel)
        catList:SetSize(AAS.ScrW*0.31, 0)
        catList:SetPos(AAS.ScrW*0.02, AAS.ScrH*0.115)
        catList:GetVBar():SetWide(0)

        local itemContainer = vgui.Create("DIconLayout", catList)
        itemContainer:SetSize(AAS.ScrW*0.3, AAS.ScrH*0.25)
        itemContainer:SetSpaceX(AAS.ScrW*0.005)
        itemContainer:SetSpaceY(AAS.ScrW*0.005)
        
        local LerpDeploy = 255
        mainPanel.Paint = function(self,w,h)
            LerpPos = Lerp(FrameTime()*20, LerpPos, Deployed and 255 or 0)
            
            draw.RoundedBox(4, 0, AAS.ScrH*0.05, w, AAS.ScrH*0.05, AAS.Colors["white"])
            draw.RoundedBox(4, AAS.ScrW*0.0008, AAS.ScrH*0.052, w-(AAS.ScrW*0.002), AAS.ScrH*0.045, ColorAlpha(AAS.Colors["dark34"], LerpDeploy))

            draw.RoundedBox(4, AAS.ScrW*0.003, AAS.ScrH*0.0175, AAS.ScrW*0.0424, AAS.ScrH*0.075, AAS.Colors["white"])
            draw.RoundedBox(4, AAS.ScrW*0.004, AAS.ScrH*0.0175 + AAS.ScrH*0.002, AAS.ScrW*0.0424-AAS.ScrW*0.0025, AAS.ScrH*0.071, ColorAlpha(AAS.Colors["dark34"], LerpDeploy))

            draw.RoundedBoxEx(14, AAS.ScrW*0.32, AAS.ScrH*0.05, AAS.ScrW*0.0424, AAS.ScrH*0.075, AAS.Colors["white"], true, false, false, true)
            draw.RoundedBoxEx(12, AAS.ScrW*0.32 + AAS.ScrH*0.0017, AAS.ScrH*0.05 + AAS.ScrH*0.002, AAS.ScrW*0.0424-AAS.ScrW*0.0025, AAS.ScrH*0.071, AAS.Colors["grey53"], true, false, false, true)

            draw.SimpleText(string.upper((v.uniqueName or "")), "AAS:Font:12", w*0.14, AAS.ScrH*0.03, AAS.Colors["white"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            draw.SimpleText(not Deployed and (AAS.GetSentence("changeInv").." "..(v.uniqueName or "").." "..AAS.GetSentence("clickingHere")) or AAS.GetSentence("upHere"), "AAS:Font:10", w*0.48, AAS.ScrH*0.073, ColorAlpha(AAS.Colors["white"], LerpDeploy), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(v.material)
            surface.DrawTexturedRect( -AAS.ScrW*0.0045, AAS.ScrH*0.03, (v.material:Width()*AAS.ScrW/1920)*1.5, (v.material:Height()*AAS.ScrH/1080)*1.5 )

            local ent = istable(AAS.ClientTable["ItemsEquiped"]) and istable(AAS.ClientTable["ItemsEquiped"][AAS.LocalPlayer:SteamID64()]) and AAS.ClientTable["ItemsEquiped"][AAS.LocalPlayer:SteamID64()][v.uniqueName] or nil
            if not IsValid(ent) then
                surface.SetDrawColor(AAS.Colors["white"])
                surface.SetMaterial(AAS.Materials["add"])
                surface.DrawTexturedRect( AAS.ScrW*0.3285, AAS.ScrH*0.065, (AAS.Materials["add"]:Width()*AAS.ScrW/1920)*0.8, (AAS.Materials["add"]:Height()*AAS.ScrH/1080)*0.8 )
            end

            draw.RoundedBox(0, w*0.02, AAS.ScrH*0.108, 1, itemContainer:GetTall(), ColorAlpha(AAS.Colors["white"], LerpPos))
            draw.RoundedBox(0, w*0.05, h*0.93, w*0.79, 1, ColorAlpha(AAS.Colors["white"], LerpPos))
        end
        
        local antiSpam
        local rightModel = vgui.Create("DModelPanel", mainPanel)
        rightModel:SetSize(AAS.ScrW*0.04, AAS.ScrW*0.04)
        rightModel:SetPos(AAS.ScrW*0.3215, AAS.ScrH*0.05)
        rightModel.LayoutEntity = function() end
        rightModel.DoClick = function()
            antiSpam = antiSpam or 0
            if antiSpam > CurTime() then return end
            antiSpam = CurTime() + 0.5

            catList:SizeTo(catList:GetWide(), Deployed and 0 or size, 0.28, 0, -1, function()
                Deployed = !Deployed
            end)
            mainPanel:SizeTo(mainPanel:GetWide(), Deployed and AAS.ScrH*0.125 or size, 0.3)
        end
 
        rightModel.Think = function(self)
            local inventoryTbl = AAS.ClientTable["ItemsEquiped"][AAS.LocalPlayer:SteamID64()] or {}
            local uniqueId = IsValid(inventoryTbl[v.uniqueName]) and inventoryTbl[v.uniqueName].uniqueId or 0
            local itemTable = AAS.GetTableById(uniqueId)

            self:SetModel(itemTable.model or "")

            if not IsValid(self.Entity) then return end

            if not isnumber(self.mn) or not isnumber(self.mx) then
                self.mn, self.mx = self.Entity:GetRenderBounds()
                
                local size = 0
                size = math.max(size, math.abs(self.mn.x) + math.abs(self.mx.x))
                size = math.max(size, math.abs(self.mn.y) + math.abs(self.mx.y))
                size = math.max(size, math.abs(self.mn.z) + math.abs(self.mx.z))
        
                self:SetCamPos(Vector(size, size, size))
            end
            
            if istable(itemTable["options"]) then
                if isnumber(itemTable["options"]["iconFov"]) then
                    self:SetFOV(45 + itemTable["options"]["iconFov"])
                end
    
                local vector = itemTable["options"]["iconPos"]
                if isvector(vector) then
                    self:SetLookAt((self.mn + self.mx) * 0.5 + vector)
                end
            end

            AAS.SetPanelSettings(rightModel, itemTable)
        end
        
        local DeployButton = vgui.Create("DButton", mainPanel)
        DeployButton:SetSize(AAS.ScrW*0.38, AAS.ScrH*0.05)
        DeployButton:SetPos(0,AAS.ScrH*0.045)
        DeployButton:SetText("")
        DeployButton.Paint = function() end
        DeployButton.DoClick = function()
            antiSpam = antiSpam or 0
            if antiSpam > CurTime() then return end
            antiSpam = CurTime() + 0.5
            
            catList:SizeTo(catList:GetWide(), Deployed and 0 or size, 0.28, 0, -1, function()
                Deployed = !Deployed
            end)
            mainPanel:SizeTo(mainPanel:GetWide(), Deployed and AAS.ScrH*0.125 or size, 0.3)
        end
        DeployButton.Think = function()
            LerpDeploy = Lerp(FrameTime()*10, LerpDeploy, DeployButton:IsHovered() and 253 or 255)
        end
        
        local lerpUnequip = 255
        local backModel = vgui.Create("DPanel", itemContainer)
        backModel:SetSize(AAS.ScrH*0.079,AAS.ScrH*0.079)
        backModel.Paint = function(self,w,h)
            draw.RoundedBoxEx(16, 0, 0, w, h, AAS.Colors["white"], false, true, true, false)
            draw.RoundedBoxEx(14, AAS.ScrW*0.0015, AAS.ScrH*0.003, w - AAS.ScrW*0.003, h-AAS.ScrH*0.0065, ColorAlpha(AAS.Colors["grey165"], lerpUnequip), false, true, true, false)
        end

        local buttonUnEquip = vgui.Create("DButton", backModel)
        buttonUnEquip:Dock(FILL)
        buttonUnEquip:SetText("")
        buttonUnEquip.Paint = function(self,w,h)
            lerpUnequip = Lerp(FrameTime()*3, lerpUnequip, buttonUnEquip:IsHovered() and 180 or 255)

            local width, height = (AAS.Materials["unEquip"]:Width()*AAS.ScrW/1920), (AAS.Materials["unEquip"]:Height()*AAS.ScrH/1080)
            
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(AAS.Materials["unEquip"])
            surface.DrawTexturedRect( width/1.8, height/1.7, width, height )
        end
        buttonUnEquip.DoClick = function()
            net.Start("AAS:Inventory")
                net.WriteUInt(4, 5)
                net.WriteString(itemContainer.AASTable.category)
            net.SendToServer()
        end

        if istable(itemsInventory[v.uniqueName]) then
            for _, item in ipairs(itemsInventory[v.uniqueName]) do
                local itemTable = AAS.GetTableById(item.uniqueId)
                AASTimerId = AASTimerId + 1

                if not istable(itemTable) or #itemTable < 0 or not isstring(itemTable.model) then continue end

                if firstOpen then
                    catList:SetSize(catList:GetWide(), size)
                    mainPanel:SetSize(mainPanel:GetWide(), size)
                    Deployed = true
                    firstOpen = false
                end

                local lerpBackmodel, itemModel = 255
                local backModel = vgui.Create("DPanel", itemContainer)
                backModel:SetSize(AAS.ScrH*0.079,AAS.ScrH*0.079)
                backModel.Paint = function(self,w,h)
                    lerpBackmodel = Lerp(FrameTime()*10, lerpBackmodel, itemModel:IsHovered() and 180 or 255)
                    draw.RoundedBoxEx(16, 0, 0, w, h, AAS.Colors["white"], false, true, true, false)
                    draw.RoundedBoxEx(14, AAS.ScrW*0.0015, AAS.ScrH*0.003, w - AAS.ScrW*0.003, h-AAS.ScrH*0.0065, ColorAlpha(AAS.Colors["grey165"], lerpBackmodel), false, true, true, false)
                end

                local timerName = ("AAS:Timer:...:%s"):format(AASTimerId)
                timer.Create(timerName, 0, 0, function()
                    if IsValid(itemContainer) then itemContainer:Layout() end
                    if not IsValid(backModel) then timer.Remove(timerName) return end 

                    if (itemTable.options["vip"] and itemTable.options["new"]) and not AAS.ClientTable["filters"]["vip"] and not AAS.ClientTable["filters"]["new"] then backModel:SetVisible(false) return end
                    if (itemTable.options["vip"] and not itemTable.options["new"]) and not AAS.ClientTable["filters"]["vip"] then backModel:SetVisible(false) return end
                    if (itemTable.options["new"] and not itemTable.options["vip"]) and not AAS.ClientTable["filters"]["new"] then backModel:SetVisible(false) return end
                    if not string.find(itemTable.name:lower(), AAS.ClientTable["filters"]["search"]:lower()) then backModel:SetVisible(false) return end

                    backModel:SetVisible(true)
                end)

                itemContainer.AASTable = itemTable
                
                itemModel = vgui.Create("DModelPanel", backModel)
                itemModel:SetSize(backModel:GetWide(), backModel:GetWide())
                itemModel:SetModel((itemTable.model or ""))
                itemModel.LayoutEntity = function() end
                itemModel.DoClick = function()
                    net.Start("AAS:Inventory")
                        net.WriteUInt(3, 5)
                        net.WriteUInt(item.uniqueId, 32)
                    net.SendToServer()

                    catList:SizeTo(catList:GetWide(), Deployed and 0 or size, 0.28, 0, -1, function()
                        Deployed = !Deployed
                    end)
                    mainPanel:SizeTo(mainPanel:GetWide(), Deployed and AAS.ScrH*0.125 or size, 0.3)
                end

                itemModel.Think = function(self)              
                    self.mn, self.mx = self.Entity:GetRenderBounds()
                    
                    local size = 0
                    size = math.max(size, math.abs(self.mn.x) + math.abs(self.mx.x))
                    size = math.max(size, math.abs(self.mn.y) + math.abs(self.mx.y))
                    size = math.max(size, math.abs(self.mn.z) + math.abs(self.mx.z))
                
                    self:SetCamPos(Vector(size, size, size))
                    
                    if istable(itemTable["options"]) then
                        if isnumber(itemTable["options"]["iconFov"]) then
                            self:SetFOV(45 + itemTable["options"]["iconFov"])
                        end
            
                        local vector = itemTable["options"]["iconPos"]
                        if isvector(vector) then
                            self:SetLookAt((self.mn + self.mx) * 0.5 + vector)
                        end
                    end

                    AAS.SetPanelSettings(itemModel, itemTable)
                end    
            end
        else
            mainPanel:Remove()
        end

        local upButton = vgui.Create("DButton", mainPanel)
        upButton:SetSize(AAS.ScrH*0.03,AAS.ScrH*0.03)
        upButton:SetPos(0, mainPanel:GetTall()*0.88)
        upButton:SetText("")
        upButton.Paint = function(self,w,h)
            upButton:SetPos(0, mainPanel:GetTall()*0.88)

            if not Deployed then return end
            surface.SetDrawColor(AAS.Colors["white"])
            surface.SetMaterial(AAS.Materials["upButton"])
            surface.DrawTexturedRect( 0, 0, (AAS.Materials["upButton"]:Width()*AAS.ScrW/1920), (AAS.Materials["upButton"]:Height()*AAS.ScrH/1080) )
        end
        upButton.DoClick = function()
            catList:SizeTo(catList:GetWide(), 0, 0.28, 0, -1, function()
                Deployed = false
            end)
            mainPanel:SizeTo(mainPanel:GetWide(), AAS.ScrH*0.125, 0.3)
        end
    end

    local itemsButton = vgui.Create("DButton", accessoriesFrame)
    itemsButton:SetSize(AAS.ScrH*0.0277, AAS.ScrH*0.0277)
    itemsButton:SetPos(AAS.ScrW*0.0384/2 - AAS.ScrH*0.0277/2, accessoriesFrame:GetTall()*0.92)
    itemsButton:SetText("")
    itemsButton.Paint = function(self,w,h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["market"])
        surface.DrawTexturedRect( 0, 0, w, h )
    end  
    itemsButton.DoClick = function()
        if itemMenuAccess then AAS.Notification(3, AAS.GetSentence("swepcantgo")) return end
        AAS.ItemMenu()
    end
end

function AAS.SettingsPopupMenu(itemTable)
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

        draw.SimpleText(AAS.GetSentence("adjustAccessory"), "AAS:Font:06", w*0.174, AAS.ScrH*0.021, AAS.Colors["white"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(AAS.GetSentence("adjustText"), "AAS:Font:07", w/2, h*0.465, AAS.Colors["white"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["market"])
        surface.DrawTexturedRect(w*0.05, AAS.ScrH*0.0105, (AAS.Materials["market"]:Width()*AAS.ScrW/1920)*0.85, (AAS.Materials["market"]:Height()*AAS.ScrH/1080)*0.85)
    end

    local lerpFirstButton = 255
    local equipButton = vgui.Create("DButton", popupFrame)
    equipButton:SetSize(AAS.ScrW*0.09, AAS.ScrH*0.042)
    equipButton:SetPos(AAS.ScrW*0.005, AAS.ScrH*0.105)
    equipButton:SetFont("AAS:Font:02")
    equipButton:SetText(string.upper(AAS.GetSentence("adjust")))
    equipButton:SetTextColor(AAS.Colors["white"])
    equipButton.Paint = function(self,w,h)
        lerpFirstButton = Lerp(FrameTime()*10, lerpFirstButton, self:IsHovered() and 255 or 100)

        draw.RoundedBox(8, 0, 0, w, h,  ColorAlpha(AAS.Colors["blue75"], lerpFirstButton))
    end
    equipButton.DoClick = function()
        AAS.PlayerSettings(itemTable)
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
--831c00f6ced967465ebe067d04eaae4bf34a6a65b8df7c05b6492e8c1bd841a2
--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_checkbox.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize(AAS.ScrH*0.03, AAS.ScrH*0.03)
    self.AASValue = false
    self:SetText("")
    self.Lerp = 0
end

function PANEL:SetValue(bool)
    self.AASValue = bool
end

function PANEL:GetValue()
    return self.AASValue
end

function PANEL:DoClick()
    self.AASValue = !self.AASValue
end

function PANEL:Paint(w,h)
    draw.RoundedBox(2, 0, 0, w, h, AAS.Colors["white"])

    self.Lerp = Lerp(FrameTime()*10, self.Lerp, self.AASValue and 255 or 0)
    draw.RoundedBox(2, self:GetWide()*0.1, self:GetTall()*0.1, w-self:GetWide()*0.2, h-self:GetWide()*0.2, ColorAlpha(AAS.Colors["dark34"], self.Lerp))
end

derma.DefineControl("AAS:CheckBox", "AAS CheckBox", PANEL, "DButton")
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_stencils.lua:
aphone.Stencils = aphone.Stencils or {}
local stencil_writemask = render.SetStencilWriteMask
local stencil_testmask = render.SetStencilTestMask
local stencil_id = render.SetStencilReferenceValue
local stencil_fail = render.SetStencilFailOperation
local stencil_zfail = render.SetStencilZFailOperation
local stencil_compare = render.SetStencilCompareFunction
local stencil_pass = render.SetStencilPassOperation

function aphone.Stencils.Start()
    -- Reset
    stencil_writemask(0xFF)
    stencil_testmask(0xFF)
    stencil_fail(STENCIL_KEEP)
    stencil_zfail(STENCIL_KEEP)
    stencil_id(1)
    -- Stencil
    stencil_compare(STENCIL_EQUAL)
    stencil_pass(STENCIL_INCRSAT)
end

function aphone.Stencils.AfterMask(ext)
    stencil_id(2)
    stencil_pass(STENCIL_DECRSAT)
    stencil_compare(ext and STENCIL_LESS or STENCIL_EQUAL)
end

function aphone.Stencils.End()
    stencil_id(1)
    stencil_pass(STENCIL_REPLACE)
end
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_tdlib.lua:
/*---------------------------------------------------------------------------
	Three's Derma Lib
	Made by Threebow

	You are free to use this anywhere you like, or sell any addons
	made using this, as long as I am properly accredited.
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
	Constants
---------------------------------------------------------------------------*/
local blur = Material("pp/blurscreen")
local gradLeft = Material("vgui/gradient-l")
local gradUp = Material("vgui/gradient-u")
local gradRight = Material("vgui/gradient-r")
local gradDown = Material("vgui/gradient-d")


/*---------------------------------------------------------------------------
	Collection of various utilities
---------------------------------------------------------------------------*/
TDLibUtil = {}

//Beast's circle drawing function v2
TDLibUtil.DrawCircle = function(x, y, r, col)
    local circle = {}

    for i = 1, 360 do
        circle[i] = {}
        circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
        circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
    end

    surface.SetDrawColor(col)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

TDLibUtil.DrawArc = function(x, y, ang, p, rad, color, seg)
	seg = seg || 80
    ang = (-ang) + 180
    local circle = {}

    table.insert(circle, {x = x, y = y})
    for i = 0, seg do
        local a = math.rad((i / seg) * -p + ang)
        table.insert(circle, {x = x + math.sin(a) * rad, y = y + math.cos(a) * rad})
    end

    surface.SetDrawColor(color)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

TDLibUtil.LerpColor = function(frac, from, to)
	return Color(
		Lerp(frac, from.r, to.r),
		Lerp(frac, from.g, to.g),
		Lerp(frac, from.b, to.b),
		Lerp(frac, from.a, to.a)
	)
end

//Various handy premade transition functions
TDLibUtil.HoverFunc = function(s) return s:IsHovered() end
TDLibUtil.HoverFuncChild = function(s) return s:IsHovered() || s:IsChildHovered() end


/*---------------------------------------------------------------------------
	Circle function - credit to Beast
---------------------------------------------------------------------------*/
local function drawCircle(x, y, r)
	local circle = {}

	for i = 1, 360 do
		circle[i] = {}
		circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
		circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
	end

	surface.DrawPoly(circle)
end


/*---------------------------------------------------------------------------
	Basic helper classes
---------------------------------------------------------------------------*/
local classes = {}

classes.On = function(pnl, name, fn)
	name = pnl.AppendOverwrite || name

	local old = pnl[name]
	
	pnl[name] = function(s, ...)
		if(old) then old(s, ...) end
		fn(s, ...)
	end
end

classes.SetupTransition = function(pnl, name, speed, fn)
	fn = pnl.TransitionFunc || fn

	pnl[name] = 0
	pnl:On("Think", function(s)
		s[name] = Lerp(FrameTime()*speed, s[name], fn(s) && 1 || 0)
	end)
end

// Color caching : Not in default lib
local white_30 = Color(255, 255, 255, 30)
local blue = Color(0, 127, 255, 255)
local white_50 = Color(255, 255, 255, 50)
local green = Color(0, 255, 0, 255)


/*---------------------------------------------------------------------------
	Classes
---------------------------------------------------------------------------*/
classes.FadeHover = function(pnl, col, speed, rad)
	col = col || white_30
	speed = speed || 6

	pnl:SetupTransition("FadeHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		local col = ColorAlpha(col, col.a*s.FadeHover)

		if(rad && rad > 0) then
			draw.RoundedBox(rad, 0, 0, w, h, col)
		else
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
		end
	end)
end

classes.BarHover = function(pnl, col, height, speed)
	col = col || color_white
	height = height || 2
	speed = speed || 6

	pnl:SetupTransition("BarHover", speed, TDLibUtil.HoverFunc)
	pnl:On("PaintOver", function(s, w, h)
		local bar = math.Round(w*s.BarHover)

		surface.SetDrawColor(col)
		surface.DrawRect(w/2-bar/2, h-height, bar, height)
	end)
end

classes.FillHover = function(pnl, col, dir, speed, mat)
	col = col || white_30
	dir = dir || LEFT
	speed = speed || 8

	pnl:SetupTransition("FillHover", speed, TDLibUtil.HoverFunc)
	pnl:On("PaintOver", function(s, w, h)
		surface.SetDrawColor(col)

		local x, y, fw, fh
		if(dir == LEFT) then
			x, y, fw, fh = 0, 0, math.Round(w*s.FillHover), h
		elseif(dir == TOP) then
			x, y, fw, fh = 0, 0, w, math.Round(h*s.FillHover)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*s.FillHover)
			x, y, fw, fh = w-prog, 0, prog, h
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*s.FillHover)
			x, y, fw, fh = 0, h-prog, w, prog
		end

		if(mat) then
			surface.SetMaterial(mat)
			surface.DrawTexturedRect(x, y, fw, fh)
		else
			surface.DrawRect(x, y, fw, fh)
		end
	end)
end

classes.Background = function(pnl, col, rad, rtl, rtr, rbl, rbr)
	pnl:On("Paint", function(s, w, h)
		if(rad && rad > 0) then
			if(rtl != nil) then
				draw.RoundedBoxEx(rad, 0, 0, w, h, col, rtl, rtr, rbl, rbr)
			else
				draw.RoundedBox(rad, 0, 0, w, h, col)
			end
		else
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
		end
	end)
end

classes.Material = function(pnl, mat, col)
	col = col || color_white

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		surface.SetMaterial(mat)
		surface.DrawTexturedRect(0, 0, w, h)
	end)
end

classes.TiledMaterial = function(pnl, mat, tw, th, col)
	col = col || color_white

	pnl:On("Paint", function(s, w, h)
		surface.SetMaterial(mat)
		surface.SetDrawColor(col)
		surface.DrawTexturedRectUV(0, 0, w, h, 0, 0, w/tw, h/th)
	end)
end

classes.Outline = function(pnl, col, width)
	col = col || color_white
	width = width || 1

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		
		for i=0, width-1 do
			surface.DrawOutlinedRect(0+i,0+i,w-i*2,h-i*2)
		end
	end)
end

classes.LinedCorners = function(pnl, col, len)
	col = col || color_white
	len = len || 15

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)

		surface.DrawRect(0, 0, len, 1)
		surface.DrawRect(0, 1, 1, len-1)
		surface.DrawRect(w-len, h-1, len, 1)
		surface.DrawRect(w-1, h-len, 1, len-1)
	end)
end

classes.SideBlock = function(pnl, col, size, side)
	col = col || color_white
	size = size || 3
	side = side || LEFT

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		
		if(side == LEFT) then
			surface.DrawRect(0, 0, size, h)
		elseif(side == TOP) then
			surface.DrawRect(0, 0, w, size)
		elseif(side == RIGHT) then
			surface.DrawRect(w-size, 0, size, h)
		elseif(side == BOTTOM) then
			surface.DrawRect(0, h-size, w, size)
		end
	end)
end

classes.Text = function(pnl, text, font, col, alignment, ox, oy, paint)
	font = font || "Trebuchet24"
	col = col || color_white
	alignment = alignment || TEXT_ALIGN_CENTER
	ox = ox || 0
	oy = oy || 0

	if(!paint && pnl.SetText && pnl.SetFont && pnl.SetTextColor) then
		pnl:SetText(text)
		pnl:SetFont(font)
		pnl:SetTextColor(col)
	else
		pnl:On("Paint", function(s, w, h)
			local x = 0
			if(alignment == TEXT_ALIGN_CENTER) then
				x = w/2
			elseif(alignment == TEXT_ALIGN_RIGHT) then
				x = w
			end

			draw.SimpleText(text,font,x+ox,h/2+oy,col,alignment,TEXT_ALIGN_CENTER)
		end)
	end
end

classes.DualText = function(pnl, toptext, topfont, topcol, bottomtext, bottomfont, bottomcol, alignment, centerSpacing)
	topfont = topfont || "Trebuchet24"
	topcol = topcol || blue
	bottomfont = bottomfont || "Trebuchet18"
	bottomcol = bottomcol || color_white
	alignment = alignment || TEXT_ALIGN_CENTER
	centerSpacing = centerSpacing || 0

	pnl:On("Paint", function(s, w, h)
		surface.SetFont(topfont)
		local tw, th = surface.GetTextSize(toptext)

		surface.SetFont(bottomfont)
		local bw, bh = surface.GetTextSize(bottomtext)

		local y1, y2 = h/2-bh/2, h/2+th/2

		local x
		if(alignment == TEXT_ALIGN_LEFT) then
			x = 0
		elseif(alignment == TEXT_ALIGN_CENTER) then
			x = w/2
		elseif(alignment == TEXT_ALIGN_RIGHT) then
			x = w
		end

		draw.SimpleText(toptext, topfont, x, y1+centerSpacing, topcol, alignment, TEXT_ALIGN_CENTER)
		draw.SimpleText(bottomtext, bottomfont, x, y2-centerSpacing, bottomcol, alignment, TEXT_ALIGN_CENTER)
	end)
end

classes.Blur = function(pnl, amount)
	pnl:On("Paint", function(s, w, h)
		local x, y = s:LocalToScreen(0, 0)
		local scrW, scrH = ScrW(), ScrH()

		surface.SetDrawColor(color_white)
		surface.SetMaterial(blur)

		for i = 1, 3 do
			blur:SetFloat("$blur", (i / 3) * (amount or 8))
			blur:Recompute()

			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
		end
	end)
end

classes.CircleClick = function(pnl, col, speed, trad)
	col = col || white_50
	speed = speed || 5

	pnl.Rad, pnl.Alpha, pnl.ClickX, pnl.ClickY = 0, 0, 0, 0

	pnl:On("Paint", function(s, w, h)
		if(s.Alpha >= 1) then
			surface.SetDrawColor(ColorAlpha(col, s.Alpha))
			draw.NoTexture()
			drawCircle(s.ClickX, s.ClickY, s.Rad)
			s.Rad = Lerp(FrameTime()*speed, s.Rad, trad || w)
			s.Alpha = Lerp(FrameTime()*speed, s.Alpha, 0)
		end
	end)

	pnl:On("DoClick", function(s)
		s.ClickX, s.ClickY = s:CursorPos()
		s.Rad = 0
		s.Alpha = col.a
	end)
end

classes.CircleHover = function(pnl, col, speed, trad)
	col = col || white_30
	speed = speed || 6

	pnl.LastX, pnl.LastY = 0, 0

	pnl:SetupTransition("CircleHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Think", function(s)
		if(s:IsHovered()) then
			s.LastX, s.LastY = s:CursorPos()
		end
	end)

	pnl:On("PaintOver", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleHover))
		drawCircle(s.LastX, s.LastY, s.CircleHover*(trad || w))
	end)
end

classes.SquareCheckbox = function(pnl, inner, outer, speed)
	inner = inner || green
	outer = outer || color_white
	speed = speed || 14

	pnl:SetupTransition("SquareCheckbox", speed, function(s) return s:GetChecked() end)
	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(outer)
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(inner)
		surface.DrawOutlinedRect(0, 0, w, h)

		local bw, bh = (w-4)*s.SquareCheckbox, (h-4)*s.SquareCheckbox
		bw, bh = math.Round(bw), math.Round(bh)

		surface.DrawRect(w/2-bw/2, h/2-bh/2, bw, bh)
	end)
end

classes.CircleCheckbox = function(pnl, inner, outer, speed)
	inner = inner || green
	outer = outer || color_white
	speed = speed || 14

	pnl:SetupTransition("CircleCheckbox", speed, function(s) return s:GetChecked() end)
	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(outer)
		drawCircle(w/2, h/2, w/2-1)

		surface.SetDrawColor(inner)
		drawCircle(w/2, h/2, w*s.CircleCheckbox/2)
	end)
end

classes.AvatarMask = function(pnl, mask)
	pnl.Avatar = vgui.Create("AvatarImage", pnl)
	pnl.Avatar:SetPaintedManually(true)

	pnl.Paint = function(s, w, h)
		render.ClearStencil()
		render.SetStencilEnable(true)

		render.SetStencilWriteMask(0xFF)
		render.SetStencilTestMask(0xFF)

		render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
		render.SetStencilPassOperation(STENCILOPERATION_ZERO)
		render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
		render.SetStencilReferenceValue(1)

		draw.NoTexture()
		surface.SetDrawColor(color_white)
		mask(s, w, h)

		render.SetStencilFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilReferenceValue(1)

		s.Avatar:SetPaintedManually(false)
		s.Avatar:PaintManual()
		s.Avatar:SetPaintedManually(true)

		render.SetStencilEnable(false)
		render.ClearStencil()
	end

	pnl.PerformLayout = function(s)
		s.Avatar:SetSize(s:GetWide(), s:GetTall())
	end

	pnl.SetPlayer = function(s, ply, size) s.Avatar:SetPlayer(ply, size) end
	pnl.SetSteamID = function(s, id, size) s.Avatar:SetSteamID(id, size) end
end

classes.CircleAvatar = function(pnl)
	pnl:Class("AvatarMask", function(s, w, h)
		drawCircle(w/2, h/2, w/2)
	end)
end

classes.Circle = function(pnl, col)
	col = col || color_white

	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(col)
		drawCircle(w/2, h/2, math.min(w, h)/2)
	end)
end

classes.CircleFadeHover = function(pnl, col, speed)
	col = col || white_30
	speed = speed || 6

	pnl:SetupTransition("CircleFadeHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleFadeHover))
		drawCircle(w/2, h/2, math.min(w, h)/2)
	end)
end

classes.CircleExpandHover = function(pnl, col, speed)
	col = col || white_30
	speed = speed || 6

	pnl:SetupTransition("CircleExpandHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		local rad = math.Round(w/2*s.CircleExpandHover)

		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleExpandHover))
		drawCircle(w/2, h/2, rad)
	end)
end

classes.Gradient = function(pnl, col, dir, frac, op)
	dir = dir || BOTTOM
	frac = frac || 1

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)

		local x, y, gw, gh		
		if(dir == LEFT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = 0, 0, prog, h
			surface.SetMaterial(op && gradRight || gradLeft)
		elseif(dir == TOP) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, 0, w, prog
			surface.SetMaterial(op && gradDown || gradUp)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = w-prog, 0, prog, h
			surface.SetMaterial(op && gradLeft || gradRight)
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, h-prog, w, prog
			surface.SetMaterial(op && gradUp || gradDown)
		end

		surface.DrawTexturedRect(x, y, gw, gh)
	end)
end

classes.SetOpenURL = function(pnl, url)
	pnl:On("DoClick", function()
		gui.OpenURL(url)
	end)
end

classes.NetMessage = function(pnl, name, data)
	data = data || function() end

	pnl:On("DoClick", function()
		net.Start(name)
			data(pnl)
		net.SendToServer()
	end)
end

classes.Stick = function(pnl, dock, margin, dontInvalidate)
	dock = dock || FILL
	margin = margin || 0

	pnl:Dock(dock)
	if(margin > 0) then
		pnl:DockMargin(margin, margin, margin, margin)
	end

	if(!dontInvalidate) then
		pnl:InvalidateParent(true)
	end
end

classes.DivTall = function(pnl, frac, target)
	frac = frac || 2
	target = target || pnl:GetParent()

	pnl:SetTall(target:GetTall()/frac)
end

classes.DivWide = function(pnl, frac, target)
	target = target || pnl:GetParent()
	frac = frac || 2

	pnl:SetWide(target:GetWide()/frac)
end

classes.SquareFromHeight = function(pnl)
	pnl:SetWide(pnl:GetTall())
end

classes.SquareFromWidth = function(pnl)
	pnl:SetTall(pnl:GetWide())
end

classes.SetRemove = function(pnl, target)
	target = target || pnl

	pnl:On("DoClick", function()
		if(IsValid(target)) then target:Remove() end
	end)
end

classes.FadeIn = function(pnl, time, alpha)
	time = time || 0.2
	alpha = alpha || 255

	pnl:SetAlpha(0)
	pnl:AlphaTo(alpha, time)
end

classes.HideVBar = function(pnl)
	local vbar = pnl:GetVBar()
	vbar:SetWide(0)
	vbar:Hide()
end

classes.SetTransitionFunc = function(pnl, fn)
	pnl.TransitionFunc = fn
end

classes.ClearTransitionFunc = function(pnl)
	pnl.TransitionFunc = nil
end

classes.SetAppendOverwrite = function(pnl, fn)
	pnl.AppendOverwrite = fn
end

classes.ClearAppendOverwrite = function(pnl)
	pnl.AppendOverwrite = nil
end

classes.ClearPaint = function(pnl)
	pnl.Paint = nil
end

classes.ReadyTextbox = function(pnl)
	pnl:SetPaintBackground(false)
	pnl:SetAppendOverwrite("PaintOver")
		:SetTransitionFunc(function(s) return s:IsEditing() end)
end


/*---------------------------------------------------------------------------
	TDLib function which adds all the classes to your panel
---------------------------------------------------------------------------*/
local meta = FindMetaTable("Panel")

function meta:TDLib()
	self.Class = function(pnl, name, ...)
		local class = classes[name]
		assert(class, "[TDLib]: Class "..name.." does not exist.")

		class(pnl, ...)

		return pnl
	end

	for k, v in pairs(classes) do
		self[k] = function(s, ...) return s:Class(k, ...) end
	end

	return self
end

function TDLib(c, p, n)
	local pnl = vgui.Create(c, p, n)
	return pnl:TDLib()
end
--PATH addons/sl_aphone/lua/aphone/_libs/gamemodes_related/sh_flux.lua:
// You won't find this gamemode online, it's my private gm
hook.Add("Flux_LoadedGamemode", "aphone_LoadGMFlux", function()
    aphone.Gamemode = {}

    function aphone.Gamemode.Afford(ply, amt)
        return ply:canAfford(amt)
    end

    function aphone.Gamemode.AddMoney(ply, amt)
        return !ply:ChangeMoney(amt)
    end

    function aphone.Gamemode.Format(amt)
        return Flux:FormatMoney(amt)
    end

    function aphone.Gamemode.GetMoney(ply)
        return ply:GetMoney()
    end
end)

--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_advancedphone_scroll.lua:
// Patch ScrollPanel with stencil
local SCROLL = FindMetaTable("Panel")

function SCROLL:aphone_PaintScroll()
	if self:GetName() != "DScrollPanel" then return end

	local vbar = self:GetVBar()
	vbar:SetWide(4)

	function vbar:Paint() end
	function vbar.btnUp:Paint() end
	function vbar.btnDown:Paint() end

	local s = self.OnMouseWheeled

	function self:OnMouseWheeled(delta)
		// s function return a value, so we return the same thing, also we use the result to check if we can put our cd or self is disabled ( Look into DVScrollBar )
		local return_val = s(self, delta)

		if s(self, delta) then
			vbar.btnGrip.aphone_BarCD = CurTime()
		end

		return return_val
	end

	function vbar.btnGrip:Paint(w, h)
		local a = CurTime() - (self.aphone_BarCD or 0) - 1
		if a > 0.5 then return end

		draw.RoundedBox(w / 2, 0, 0, w, h, Color(255, 255, 255, a < 0 and 255 or (1 - a * 2) * 255))
	end
	self:aphone_RemoveCursor()
end
--PATH addons/sl_aphone/lua/aphone/_libs/printers/sh_lithiumprinter.lua:
hook.Add("PostGamemodeLoaded", "APhone_LoadPrinter_LthiumPrinter", function()
    if lp then
        aphone.Printer = aphone.Printer or {}

        function aphone.Printer.GetPrinters(ply)
            local tbl = {}

            for k, v in ipairs(ents.FindByClass("lithium_*_printer")) do
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
                    money = money + v.data.stored
                    capacity = capacity + v.data.storage

                    if v.data.status and v.data.stored < v.data.storage and !v.data.isMalfunction then
                        sec = sec + (v.data.delay / v.data.delay)
                    end

                    danger = danger + (v.data.isOverheat and 1 or 0)
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
--PATH addons/sl_aphone/lua/aphone/_libs/printers/sh_oneprint.lua:
hook.Add("PostGamemodeLoaded", "APhone_LoadPrinter_OnePrint", function()
    if OnePrint then
        aphone.Printer = aphone.Printer or {}

        function aphone.Printer.GetPrinters(ply)
            local tbl = {}

            for k, v in ipairs(ents.FindByClass("oneprint")) do
                if !v:IsLocked() and v:GetPowered() then
                    if ( v:GetOwnerObject() == ply ) then
                        table.insert(tbl, v)
                        continue
                    end

                    for i, j in pairs( v:GetUsers() ) do
                        if ( j == pPlayer ) then
                            table.insert(tbl, v)
                            continue
                        end
                    end
                end
            end

            return tbl
        end

        function aphone.Printer.FormatMoney(amt)
            return OnePrint:FormatMoney( amt )
        end

        function aphone.Printer.GetInfo(ents)
            local capacity = 0
            local money = 0
            local sec = 0
            local danger = 0

            for k, v in ipairs(ents) do
                if IsValid(v) then
                    money = money + v:GetMoney()
                    capacity = capacity + v:GetStorage()

                    if !v:IsStorageFull() then
                        sec = sec + v:GetTotalIncome()
                    end

                    danger = danger + (v:GetTemperature() < 80 and 0 or 1)
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
--PATH addons/sl_aphone/lua/aphone/apps/calculator/cl_main.lua:
local APP = {}

APP.name = aphone.L("Calculator")
APP.icon = "akulla/aphone/app_calculator.png"

local operator, last_result
local first_num = ""
local second_num = ""

local function Retrieve_NumberOn()
	if !tonumber(first_num) then
		first_num = ""
	end
	return operator and second_num or first_num
end

local function Set_NumberOn(n)
	if operator then
		second_num = n
	else
		first_num = n
	end
end

local function addnumber(num)
	local new_num = tonumber(Retrieve_NumberOn() .. num)

	if new_num > 999999999 or -999999999 > new_num then return end
	Set_NumberOn(tostring(new_num))
end

local function removenumber()
	if !tonumber(Retrieve_NumberOn()) then return end
	Set_NumberOn(string.sub(Retrieve_NumberOn(), 0, -1))
end

local function switch_sign()
	if !tonumber(Retrieve_NumberOn()) then return end
	Set_NumberOn(-tonumber(Retrieve_NumberOn()))
end

local function add_comma()
	Set_NumberOn(Retrieve_NumberOn() .. ".")
end

local function reset()
	first_num = ""
	second_num = ""
	operator = nil
end

local function operation(o)
	if !operator then
		// Check if he really put a number
		if !tonumber(first_num) or o == "=" then return end

		operator = o
	elseif tonumber(second_num) then
		first_num = tonumber(first_num)
		second_num = tonumber(second_num)

		// Switch and +=, -=, /=, *= would fit so well for this
		if operator == "+" then
			first_num = first_num + second_num
		elseif operator == "-" then
			first_num = first_num - second_num
		elseif operator == "*" then
			first_num = first_num * second_num
		elseif operator == "/" then
			// Little easter egg
			first_num = second_num == 0 and "/0 ?" or first_num / second_num
		elseif operator == "%" then
			first_num = first_num % second_num
		end

		// don't break the easter egg 
		last_result = isnumber(first_num) and string.Comma(math.Round(first_num, 4)) or first_num

		reset()
	end
end

local button_table = {
	[1] = {name = "C", func = reset},
	[2] = {name = "+/-", func = switch_sign},
	[3] = {name = "%"},
	[4] = {name = "/"},
	[5] = {name = 7},
	[6] = {name = 8},
	[7] = {name = 9},
	[8] = {name = "*"},
	[9] = {name = 4},
	[10] = {name = 5},
	[11] = {name = 6},
	[12] = {name = "-"},
	[13] = {name = 1},
	[14] = {name = 2},
	[15] = {name = 3},
	[16] = {name = "+"},
	[17] = {name = 0},
	[18] = {name = ".", func = add_comma},
	[19] = { name = "<", func = removenumber },
	[20] = { name = "=" },
}

local mat_bg = Material("akulla/aphone/background_calculator.jpg")
function APP:Open(main, main_x, main_y, screenmode)
	// consts
	local font_big2 = aphone:GetFont("Roboto80")
	local font_header = aphone:GetFont("Roboto40")
	local font_mediumheader = aphone:GetFont("MediumHeader")
	local clr_white180 = aphone:Color("Text_White180")
	local clr_white = aphone:Color("Text_White")
	local black_120 = Color(40, 40, 40, 120)

	local scaledsize_24 = aphone.GUI.ScaledSizeY(24)
	local scaledsize_61 = aphone.GUI.ScaledSizeY(61)

	// adapt to screenmode
	local sub_panely, p_sizey, p_sizex

	local but_lay = vgui.Create("DIconLayout", main)
	but_lay:SetSpaceX(aphone.GUI.ScaledSizeX(5))
	but_lay:SetSpaceY(aphone.GUI.ScaledSizeY(5))

	if !screenmode then
		sub_panely = math.abs(main_x / 4 * 5 - main_y)
		p_sizey = (main_y - sub_panely) / 5 - aphone.GUI.ScaledSizeY(5)
		p_sizex = main_x / 4 - aphone.GUI.ScaledSizeX(5)
		but_lay:Dock(BOTTOM)
		but_lay:DockMargin(0, sub_panely, 0, aphone.GUI.ScaledSizeY(12))
		but_lay:SetTall(sub_panely)
	else
		sub_panely = math.abs(main_y / 5 * 5 - main_x)
		p_sizey = (main_x - sub_panely) / 5 - aphone.GUI.ScaledSizeY(10)
		p_sizex = main_y / 4 - aphone.GUI.ScaledSizeX(5)
		but_lay:Dock(RIGHT)
		but_lay:DockMargin(sub_panely, aphone.GUI.ScaledSize(12, 12, 12))
		but_lay:SetWide(sub_panely)
	end

	for k, v in SortedPairs(button_table) do
		local d = but_lay:Add("DButton")
		d:SetText(v.name)
		d:SetFont(font_header)
		d:SetSize(p_sizex, p_sizey)
		d:SetTextColor(clr_white)
		d:SetPaintBackground(false)
		d:TDLib()

		d:On("DoClick", function(self)
			if v.func then
				v.func()
			elseif isnumber(v.name) then
				addnumber(v.name)
			else
				operation(v.name)
			end
		end)

		d:FadeHover(black_120)
	end

	function main:Paint(w, h)
		surface.SetMaterial(mat_bg)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(0, 0, w, h)

		surface.SetFont(font_big2)

		if !screenmode then
			if last_result then
				draw.DrawText(last_result, select(1, surface.GetTextSize(last_result)) >= main_x * 0.9 and font_mediumheader or font_big2, w / 2, sub_panely / 2 - scaledsize_24, clr_white, 1, 1)
			end
			draw.SimpleText(first_num .. (operator or "") .. second_num, font_header, w / 2, sub_panely / 2 + scaledsize_61, clr_white180, 1, 0)
		else
			local w_final = (w - but_lay:GetWide()) / 2
			if last_result then
				draw.DrawText(last_result, (select(1, surface.GetTextSize(last_result)) >= main_x * 0.9 and font_mediumheader or font_big2), w_final, h / 3, clr_white, 1, 1)
			end
			draw.SimpleText(first_num .. (operator or "") .. second_num, font_header, w_final, h/2 + scaledsize_61, clr_white180, 1, 0)
		end
	end

	if !screenmode then
		main:Phone_DrawTop(main_x, main_y)
	end
	main:aphone_RemoveCursor()
end

function APP:Open2D(main, main_x, main_y)
	self:Open(main, main_x, main_y, true)
end

aphone.RegisterApp(APP)
--PATH addons/sl_aphone/lua/aphone/apps/call/cl_init.lua:
local APP = {}

APP.name = "Calls"
APP.icon = "akulla/aphone/app_calls.png"

local clr_blue = Color(93,207,202)
local redb = Color(255, 0, 0)

function APP:NotifyCount()
    return aphone.Clientside.GetSetting("callmissed", 0)
end

function APP:Open(main, main_x, main_y, screenmode)
    local clr_green = aphone:Color("Black2")
    local clr_black3 = aphone:Color("Black3")
    local clr_black1 = aphone:Color("Black1")
    local clr_white120 = aphone:Color("Text_White120")
    local font_bold = aphone:GetFont("Roboto45_700")
    local font_mediumheader = aphone:GetFont("MediumHeader")
    local sBox = aphone.GUI.ScaledSize(48)

    local tbl = {}

    function main:Paint(w, h)
        surface.SetDrawColor(clr_black3)
        surface.DrawRect(0,0,w,h)
    end

    local local_player = LocalPlayer()
    local already_ids = {}
    local already_num = {}

    local search_bg = vgui.Create("DPanel", main)
    search_bg:Dock(TOP)
    search_bg:DockMargin(main_x * 0.04, main_y * 0.05, main_x * 0.04, 0)
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

                v:SizeTo(-1, sBox, 0.25, 0, 0.5)
                v:AlphaTo(255, 0.25, 0)
                v.on_closeanim = false
            end
        end
    end

    local sFont = draw.GetFontHeight(aphone:GetFont("SVG_40"))
    local dial = vgui.Create("DLabel", main)
    dial:Dock(BOTTOM)
    dial:DockMargin(0, 0, 0, main_y*0.05)
    dial:SetFont(aphone:GetFont("SVG_40"))
    dial:SetText("5")
    dial:SetContentAlignment(5)
    dial:SetTall(sFont)
    dial:SetMouseInputEnabled(true)
    dial:Phone_AlphaHover()

    local b = true
    local switch = vgui.Create("DLabel", dial)
    switch:Dock(RIGHT)
    switch:DockMargin(0, 0, sFont, 0)
    switch:SetFont(aphone:GetFont("SVG_40"))
    switch:SetText("4")
    switch:SetContentAlignment(5)
    switch:SetWide(sFont)
    switch:SetMouseInputEnabled(true)
    switch:Phone_AlphaHover()

    if aphone.Clientside.GetSetting("callmissed", 0) > 0 then
        function switch:Paint(w, h)
            DisableClipping(true)
                draw.RoundedBox(8, w - 12, -4, 16, 16, redb)
            DisableClipping(false)
        end
    end

    local player_list = vgui.Create("DScrollPanel", main)
    player_list:Dock(FILL)
    player_list:DockMargin(0, main_y * 0.02, 0, 0)
    player_list:aphone_PaintScroll()

    local function genCallable()
        local plyList = player.GetHumans()
        plyList = player.GetAll()

        for k, v in ipairs(plyList) do
            local id = v:aphone_GetID()

            if local_player == v or (aphone.disable_showingUnknownPlayers and !aphone.Contacts.GetName(id)) then continue end
            already_ids[id] = v

            // Get last message, for date + text display
            local player_main = vgui.Create("DButton", player_list)
            player_main:Dock(TOP)
            player_main:SetTall(sBox)
            player_main:DockMargin(main_x*0.1, main_y * 0.0125, main_x*0.1, 0)
            player_main:SetPaintBackground(false)
            player_main:TDLib()
            player_main:SetText("")
            player_main:FadeHover(clr_green, nil, 8)
    
            tbl[string.lower(aphone.GetName(v))] = player_main
    
            function player_main:DoClick()
                net.Start("aphone_Phone")
                    net.WriteUInt(1, 4)
                    net.WriteEntity(v)
                net.SendToServer()
            end
    
            local player_avatar = vgui.Create("aphone_CircleAvatar", player_main)
            player_avatar:SetPlayer(v, 184)
            player_avatar:Dock(LEFT)
            player_avatar:SetWide(sBox)
            player_avatar.roundedValue = 8
            player_avatar:DockMargin(0, 0, 0, 0)

            surface.SetFont(font_mediumheader)
            local player_textname = vgui.Create("DLabel", player_main)
            player_textname:Dock(FILL)
            player_textname:DockMargin(main_x * 0.05, 0, 5, 0)
            player_textname:SetFont(font_mediumheader)
            player_textname:SetTextColor(aphone:Color("Text_White"))
            player_textname:SetText(aphone.GetName(v))
            player_textname:SetMouseInputEnabled(false)
        end
    
        for k, v in ipairs(plyList) do
            if local_player == v or !v:aphone_GetNumber() then continue end
            already_num[v:aphone_GetNumber()] = v
        end
    end

    local function genHistory()
        already_ids = {}
        for k, v in ipairs(aphone.Clientside.GetSetting("callhistory", {})) do
            // Get last message, for date + text display
            local a = draw.GetFontHeight(aphone:GetFont("SVG_30"))/2

            local player_main = vgui.Create("DPanel", player_list)
            player_main:Dock(TOP)
            player_main:SetTall(sBox*1.66)
            player_main:DockMargin(main_x*0.1, main_y * 0.0125, main_x*0.1, 0)
            player_main:DockPadding(a, a, a, a)
            player_main:SetPaintBackground(false)
            player_main:TDLib()
            player_main:SetText("")
            //player_main:FadeHover(clr_green, nil, 8)

            function player_main:Paint(w, h)
                surface.SetDrawColor(100, 100, 100, 125)
                surface.DrawLine(0, h-1, w, h-1)
            end
    
            tbl[string.lower(aphone.GetName(v))] = player_main
    
            local player_avatar = vgui.Create("DLabel", player_main)
            player_avatar:Dock(LEFT)
            player_avatar:SetWide(sBox)
            player_avatar:SetFont(aphone:GetFont("SVG_30"))
            player_avatar:SetTextColor(aphone:Color("Text_White120"))
            player_avatar:DockMargin(0, 0, main_y * 0.005, 0)

            if v.p then
                player_avatar:SetText("4")

                if !v.is_caller then
                    player_avatar:SetTextColor(aphone:Color("mat_blackred"))
                end
            else
                player_avatar:SetText("o")
            end
    
            surface.SetFont(font_mediumheader)
            local player_textname = vgui.Create("DLabel", player_main)
            player_textname:Dock(TOP)
            player_textname:SetFont(aphone:GetFont("Small"))
            player_textname:SetTextColor(aphone:Color("Text_White"))
            player_textname:SetText(aphone.GetName(v))
            player_textname:SetMouseInputEnabled(false)
            player_textname:SetTall(player_main:GetTall()/2 - a)
            player_textname:SetContentAlignment(1)

            local player_time = vgui.Create("DLabel", player_main)
            player_time:Dock(TOP)
            player_time:SetFont(aphone:GetFont("Small"))
            player_time:SetTextColor(aphone:Color("Text_White"))
            player_time:SetText(aphone.FormatTimeStamp(os.time() - v.time))
            player_time:SetMouseInputEnabled(false)
            player_time:SetTall(player_main:GetTall()/2 - a)
            player_time:SetContentAlignment(7)
        end
    end

    function switch:DoClick()
        b = !b
        player_list:Clear()

        if !b then
            genCallable()
            switch:SetText("4")
            search_bg:SetTall(main_y * 0.07)
        else
            genHistory()
            switch:SetText("o")
            search_bg:SetTall(0)

            switch.Paint = function() end
            aphone.Clientside.SaveSetting("callmissed", 0)
        end

        main:aphone_RemoveCursor()
    end
    switch:DoClick()

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

    main:aphone_RemoveCursor()
end

function APP:OnClose()
    aphone.InsertNewMessage = nil
end

aphone.RegisterApp(APP)
--PATH addons/sl_aphone/lua/aphone/apps/friends/cl_main.lua:
local APP = {}

APP.name = "Twitter"
APP.icon = "azog_schoolhud/twitter.jpg"

local m = Material("akulla/aphone/avatar_unknown.png", "smooth 1")
local red = Color(255, 82, 82)
local last_closedpic

function APP:Open(main, main_x, main_y, screenmode)
    local clr_black2 = aphone:Color("Black2")
    local clr_black1 = aphone:Color("Black1")
    local color_white180 = aphone:Color("Text_White180")
    local Roboto60 = aphone:GetFont("Roboto60")
    local font_mediumheader = aphone:GetFont("MediumHeader_500")
    local font_header = aphone:GetFont("Roboto40")
    local font_little = aphone:GetFont("Little_NoWeight")
    local font_small = aphone:GetFont("Small")
    local font_littlew = aphone:GetFont("Little")
    local svg_30 = aphone:GetFont("SVG_30")
    local svg_25 = aphone:GetFont("SVG_25")

    if !screenmode then
        main:Phone_DrawTop(main_x, main_y, true)
    end
    
    // Get player ids
    local already_ids = {}

    for k, v in ipairs(player.GetHumans()) do
        already_ids[v:aphone_GetID()] = v
    end

    function main:Paint(w, h)
        surface.SetDrawColor(220, 220, 220)
        surface.DrawRect(0,0,w,h)
    end

    local message_writing = vgui.Create("DPanel", main)
    message_writing:Dock(BOTTOM)
    message_writing:DockMargin(main_x * 0.04, main_y * 0.025, main_x * 0.04, main_y * 0.025)
    message_writing:SetTall(screenmode and main_x*0.07 or main_y * 0.07)

    local perfect_h = main_y * 0.035
    local clr_text = aphone:Color("Black40")

    function message_writing:Paint(w, h)
        draw.RoundedBox(perfect_h, 0, 0, w, h, clr_text)
    end

    surface.SetFont(svg_30)
    local msg_writingtall = message_writing:GetTall()

    local message_send = vgui.Create("DLabel", message_writing)
    message_send:Dock(RIGHT)
    message_send:DockMargin(0, 0, msg_writingtall / 4, 0)
    message_send:SetWide(select(1, surface.GetTextSize("i")))
    message_send:SetFont(svg_30)
    message_send:SetText("i")
    message_send:SetTextColor(clr_white120)
    message_send:SetMouseInputEnabled(true)

    // aphone_OnlinePictureList
    local messages_pic = vgui.Create("DLabel", message_writing)
    messages_pic:Dock(RIGHT)
    messages_pic:DockMargin(0, 0, msg_writingtall / 4, 0)
    messages_pic:SetWide(select(1, surface.GetTextSize("m")))
    messages_pic:SetFont(svg_30)
    messages_pic:SetText("m")
    messages_pic:SetTextColor(clr_white120)
    messages_pic:SetMouseInputEnabled(true)
    messages_pic:Phone_AlphaHover()

    local message_writingEntry = vgui.Create("DLabel", message_writing)
    message_writingEntry:Dock(FILL)
    message_writingEntry:DockMargin(msg_writingtall / 2, 0, msg_writingtall / 2, 0)
    message_writingEntry:SetFont(font_mediumheader)
    message_writingEntry:SetText(aphone.L("Type_Message"))
    message_writingEntry:SetTextColor(clr_white120)
    message_writingEntry:SetMouseInputEnabled(true)
    message_writingEntry:Phone_AlphaHover()

    -- Create a panel to select online pictures, then set the dlabel text to the link
    function messages_pic:DoClick()
        local messages_picmain = vgui.Create("aphone_OnlinePictureList", main)
        function messages_picmain:OnSelected(imgur_url)
            aphone.Contacts.Send(id, "imgur://" .. imgur_url, true)
        end
    end

    local placeholder = aphone.L("Type_Message")
    function message_writingEntry:DoClick()
        self:Phone_AskTextEntry(message_writingEntry:GetText() == placeholder and "" or self:GetText(), 140, message_writing, (main_x * 0.92 - msg_writingtall * 1.25 - messages_pic:GetWide() - message_send:GetWide()))
    end

    function message_writingEntry:textEnd(clean_txt, wrapped_txt)
        self:SetText(wrapped_txt)
        self.goodtext = clean_txt
    end

    // Header_Friends
    local player_text = vgui.Create("DLabel", main)
    player_text:Dock(TOP)
    player_text:DockMargin(main_x * 0.05, main_y * 0.05, 0, 0)
    player_text:SetText("Twitter")
    player_text:SetTextColor(clr_black2)
    player_text:SetFont(aphone:GetFont("Header_Friends"))
    player_text:SetContentAlignment(5)
    player_text:SetTall(select(2, player_text:GetTextSize()))

    local message_scroll = vgui.Create("DScrollPanel", main)
    message_scroll:Dock(FILL)
    message_scroll:aphone_PaintScroll()
    message_scroll:DockMargin(screenmode and main_x * 0.03 or 0, 0, 0, 0)

    aphone.Friends_PanelList = {}
    local lastpanel

    function aphone.InsertNewMessage_Friend(userid, body, msg_id, last_name, likes, local_vote)
        if IsValid(message_scroll) then
            local sub

            if !lastpanel or lastpanel.userid ~= userid then
                sub = message_scroll:Add("DPanel")
                sub:SetTall(aphone.GUI.ScaledSizeY(54))
                sub:Dock(TOP)
                sub:SetPaintBackground(false)
                sub:DockMargin(0, 0, 0, main_y*0.02)
                sub.userid = userid

                local sub_mainpnl = vgui.Create("DPanel", sub)
                sub_mainpnl:SetTall(sub:GetTall())
                sub_mainpnl:Dock(TOP)
                sub_mainpnl:SetPaintBackground(false)

                local avatar

                // try to get the player
                if isnumber(userid) and already_ids[userid] then
                    userid = already_ids[userid]
                end

                local connected = !isnumber(userid) and IsValid(userid)
                local plyname = connected and userid:Nick() or last_name

                if !isnumber(userid) and IsValid(userid) then
                    avatar = vgui.Create("aphone_CircleAvatar", sub_mainpnl)
                    avatar:SetPlayer(userid, 64)
                else
                    avatar = vgui.Create("DPanel", sub_mainpnl)

                    function avatar:Paint(w, h)
                        surface.SetDrawColor(color_white)
                        surface.SetMaterial(m)
                        surface.DrawTexturedRect(0, 0, h, h)
                    end
                end

                avatar:Dock(LEFT)
                avatar:SetWide(sub_mainpnl:GetTall())
                avatar:DockMargin(sub_mainpnl:GetTall()/6*2, 0, sub_mainpnl:GetTall()/6, 0)

                local bottom_name = vgui.Create("DLabel", sub_mainpnl)
                bottom_name:Dock(BOTTOM)
                bottom_name:SetText("@" .. string.Replace(plyname, " ", ""))
                bottom_name:SetFont(font_little)
                bottom_name:SetTextColor(clr_black1)
                bottom_name:SetAutoStretchVertical(true)
                bottom_name:SetAlpha(180)
                bottom_name:DockMargin(5, 0, 0, 0)
                bottom_name:SetMouseInputEnabled(false)

                local subtitle = vgui.Create("DPanel", sub_mainpnl)
                subtitle:Dock(FILL)
                subtitle:SetPaintBackground(false)

                sub.like_logo = vgui.Create("DLabel", subtitle)
                sub.like_logo:Dock(RIGHT)
                sub.like_logo:SetWide(aphone.GUI.ScaledSizeX(25))
                sub.like_logo:SetTextColor(local_vote == 1 and red or clr_black1)
                sub.like_logo:SetText("3")
                sub.like_logo:SetFont(svg_25)
                sub.like_logo:SetContentAlignment(5)
                sub.like_logo:SetMouseInputEnabled(true)
                sub.like_logo:DockMargin(0, 0, main_x*0.1, 0)

                function sub.like_logo:DoClick()
                    net.Start("aphone_AddLike") 
                        net.WriteUInt(msg_id, 29)
                    net.SendToServer()
                end

                surface.SetFont(font_littlew)

                sub.like_count = vgui.Create("DLabel", subtitle)
                sub.like_count:Dock(RIGHT)
                sub.like_count:SetWide(select(1, surface.GetTextSize("9999")))
                sub.like_count:SetTextColor(color_black)
                sub.like_count:SetText(likes)
                sub.like_count:SetFont(font_littlew)
                sub.like_count:SetContentAlignment(6)
                sub.like_count:DockMargin(3, 0, 3, 0)
                sub.like_count:SetMouseInputEnabled(true)

                function sub.like_count:DoClick()
                    sub.like_logo:DoClick()
                end

                local name = vgui.Create("DLabel", subtitle)
                name:Dock(FILL)
                name:SetText(plyname)
                name:SetFont(font_mediumheader)
                name:SetTextColor(clr_black1)
                name:SetAutoStretchVertical(true)
                name:DockMargin(5, 0, 0, 0)

                aphone.Friends_PanelList[tonumber(msg_id)] = sub
                lastpanel = sub
            else
                sub = lastpanel
            end

            local sub_size = aphone.GUI.ScaledSizeY(54)

            local left_margin = sub_size*1.5 + 5

            if string.StartWith(body, "imgur://") then
                local sub_messagepnl = vgui.Create("aphone_MessageImage", sub)
                sub_messagepnl:Dock(TOP)
                sub_messagepnl:Left_Avatar(false)
                sub_messagepnl:SetImgur(body)
                sub_messagepnl:SetTall(main_x * 0.35)
                sub_messagepnl:DockMargin(sub_size * 1.25, 5, sub_size/2, 0)
                sub:SetTall(sub:GetTall() + sub_messagepnl:GetTall())

                function sub_messagepnl:DoClick()
                    local show_pic = vgui.Create("aphone_ShowImage", main)
                    show_pic:SetMat(aphone.GetImgurMat(body))
                    last_closedpic = msg_id

                    function show_pic.onclose()
                        last_closedpic = nil
                    end
                end

                if last_closedpic and last_closedpic == msg_id then
                    sub_messagepnl:DoClick()
                end
            else
                local text_panel = vgui.Create("DLabel", sub)
                text_panel:DockMargin(sub_size*1.5 + 5, 5, sub_size/2, 0)
                text_panel:Dock(TOP)

                local wrapped = aphone.GUI.WrapText(body, font_small, main_x - left_margin - sub_size)

                text_panel:SetWrap(true)
                text_panel:SetText(wrapped)
                text_panel:SetFont(font_small)
                text_panel:SetAutoStretchVertical(true)
                text_panel:SetTextColor(clr_black2)

                sub:SetTall(sub:GetTall() + select(2, surface.GetTextSize(wrapped)))
            end

            sub:SetTall(sub:GetTall() + aphone.GUI.ScaledSizeY(10))
            sub:aphone_RemoveCursor()

            return lastpanel
        end
    end

    function message_send:DoClick()
        if !message_writingEntry.goodtext then return end

        aphone.Contacts.Send(id, message_writingEntry.goodtext, true)

        self:GetParent():SetTall(main_y * 0.07)
        message_writingEntry:SetText(aphone.L("Type_Message"))
        message_writingEntry.goodtext = nil
    end

    // Let's not load ALL messages. Imagine if he got a lot of messages
    local msg_tbl = sql.Query("SELECT * FROM aphone_Friends WHERE ip = '" .. game.GetIPAddress() .. "' AND timestamp > " .. os.time() - 604800) or {}

    local scrollto
    for k, v in ipairs(msg_tbl) do
        scrollto = aphone.InsertNewMessage_Friend(tonumber(v.user), v.body, tonumber(v.id), v.last_name, v.likes, tonumber(v.local_vote), false)
    end

    if scrollto then
        // We need to wait that dock size everything, I think ?
        timer.Simple(0.33, function()
            message_scroll:ScrollToChild(scrollto)
        end)
    end

    main:aphone_RemoveCursor()
end

function APP:OnClose()
    last_closedpic = nil
    aphone.InsertNewMessage_Friend = nil
end

function APP:Open2D(main, main_x, main_y)
    APP:Open(main, main_x, main_y, true)
end

aphone.RegisterApp(APP)
--PATH addons/sh_reports/lua/autorun/autorun_reports.lua:
SH_REPORTS = {}

include("reports/lib_easynet.lua")
include("reports/sh_main.lua")
include("reports_config.lua")

IncludeCS("reports/language/" .. (SH_REPORTS.LanguageName or "english") .. ".lua")

if (SERVER) then
	AddCSLuaFile("reports/lib_loungeui.lua")
	AddCSLuaFile("reports/lib_easynet.lua")
	AddCSLuaFile("reports/sh_main.lua")
	AddCSLuaFile("reports/cl_main.lua")
	AddCSLuaFile("reports/cl_menu_main.lua")
	AddCSLuaFile("reports/cl_menu_make.lua")
	AddCSLuaFile("reports/cl_menu_performance.lua")
	AddCSLuaFile("reports/cl_menu_rating.lua")
	AddCSLuaFile("reports_config.lua")

	include("reports/lib_database.lua")
	include("reports/sv_main.lua")
else
	include("reports/lib_loungeui.lua")
	include("reports/cl_main.lua")
	include("reports/cl_menu_main.lua")
	include("reports/cl_menu_make.lua")
	include("reports/cl_menu_performance.lua")
	include("reports/cl_menu_rating.lua")
end
--PATH lua/drgbase/modules/table.lua:

function table.DrG_ReadOnly(tbl)
	return setmetatable({}, {
		__index = tbl,
		__newindex = function() end
	})
end

function table.DrG_Default(tbl, default)
	return setmetatable(tbl, {__index = function() return default end})
end

function table.DrG_Pack(...)
	return {...}, select("#", ...)
end

function table.DrG_Unpack(tbl, size, i)
	if not isnumber(i) then i = 1 end
	if i < size then
		return tbl[i], table.DrG_Unpack(tbl, size, i+1)
	elseif i == size then return tbl[i] end
end

function table.DrG_Fetch(tbl, callback)
	local fetched = nil
	local fetchedKey = nil
	for key, val in pairs(tbl) do
		if fetched == nil or
		callback(val, fetched, key, fetchedKey) then
			fetched = val
			fetchedKey = key
		end
	end
	return fetched, fetchedKey
end

function table.DrG_Invert(tbl)
	local inverted = {}
	for key, val in pairs(tbl) do
		inverted[val] = key
	end
	return inverted
end

function table.DrG_Copy(tbl, copied)
	copied = copied or {}
	local copy = {}
	for key, val in pairs(tbl) do
		if istable(val) and not istable(getmetatable(val)) then
			copy[key] = copied[val] or table.DrG_Copy(val, copied)
			copied[val] = copy[key]
		else copy[key] = val end
	end
	return copy
end

--PATH addons/eprotect_1.4.22/lua/autorun/eprotect_loader.lua:
if slib and slib.loadFolder then slib.loadFolder("e_protect/", true, {{"e_protect/", "sh_config.lua"}}) end
hook.Add("slib:loadedUtils", "eP:Initialize", function() slib.loadFolder("e_protect/", true, {{"e_protect/", "sh_config.lua"}}) end)
--PATH addons/sl_util_wallet/lua/ezwallet/languages/en.lua:

easzy.wallet.languages = easzy.wallet.languages or {}

if (easzy.wallet.config.language != "en") then return end

local languages = easzy.wallet.languages

languages.yes = "Yes"
languages.no = "No"

languages.points = "points"
languages.theoryOnly = "Theory only"
languages.carry = "Carry"
languages.sell = "Sell"
languages.andSell = "and sell"

languages.youHave = "You have"
languages.pressToRotate = "Press B to rotate"
languages.pressToATM = "Press E to put in ATM"
languages.pressToGive = "Press E to give"
languages.pressToUse = "Press E to use"

languages.money = "Money"
languages.creditCard = "Credit card"
languages.idCard = "ID card"
languages.driverLicense = "Driver license"
languages.weaponLicense = "Firearms license"

languages.drop = "drop"
languages.onTheGround = "on the ground"
languages.give = "give"
languages.to = "to"

languages.takeOut = "take out"

languages.addonNotFound = "Addon not found"

--PATH addons/sl_util_wallet/lua/ezwallet/shared/utility.lua:


-- Get the distance between the given entities
function easzy.wallet.GetDistance(ent1, ent2)
	return ent1:GetPos():DistToSqr(ent2:GetPos())
end

-- Verify if the given entities are in the given distance
function easzy.wallet.GetInDistance(ent1, ent2, distance)
	return easzy.wallet.GetDistance(ent1, ent2) < distance^2
end

-- Check that the wanted weapon is active
function easzy.wallet.IsWeaponActive(ply, weaponClass)
    local activeWeapon = ply:GetActiveWeapon()
    if not IsValid(activeWeapon) then return false end

    local activeWeaponClass = activeWeapon:GetClass()
    return (activeWeaponClass == weaponClass), activeWeapon
end

-- Print error in console
function easzy.wallet.PrintError(message)
    MsgC(easzy.wallet.colors.red, "EZ WALLET: " .. message .. "\n")
end

if CLIENT then
    -- Verify if the mouse is over the given rectangle
    function easzy.wallet.IsMouseOver(x, y, w, h)
        local mouseX, mouseY = input.GetCursorPos()
        if mouseX < x or mouseX > x + w then
            return false
        end
        if mouseY < y or mouseY > y + h then
            return false
        end
        return true
    end

    local defaultAngle = Angle(0, 0, 0)
    local defaultScale = Vector(1, 1, 1)
    local defaultPos = Vector()

    -- Reset viewmodel bone manipulations
    function easzy.wallet.ResetViewModelBoneManipulations(viewModel)
        if not IsValid(viewModel) then return end

        local boneCount = viewModel:GetBoneCount()
        if not boneCount then return end

        for i = 0, boneCount do
            viewModel:ManipulateBoneScale(i, defaultScale)
            viewModel:ManipulateBoneAngles(i, defaultAngle)
            viewModel:ManipulateBonePosition(i, defaultPos)
        end
    end
else
    -- Give the wanted weapon to the player and disable screen clicker
    function easzy.wallet.GiveWeapon(ply, class)
        ply:Give(class)

        -- Because Give returns NULL if the ply already has the weapon
        local weapon = ply:GetWeapon(class)
        if not IsValid(weapon) then return end

        ply:SelectWeapon(class)
        easzy.wallet.DisableScreenClicker(ply) -- Because when using SelectWeapon, PlayerSwitchWeapon doesn't work on client
        easzy.wallet.ClearViewModelSubMaterials(ply)

        return weapon
    end

    -- Strip the weapon and select the hands
    function easzy.wallet.StripWeapon(ply, weapon)
        if not IsValid(weapon) then return end

        ply:StripWeapon(weapon:GetClass())
        ply:SelectWeapon(easzy.wallet.config.hands)
    end
end

-- Format currency
function easzy.wallet.FormatCurrency(amount)
    -- local amountString
    -- if GAMEMODE.Config.currency == "€" then
    --     amountString = tostring(amount) .. " " .. GAMEMODE.Config.currency
    -- else
    --     amountString = GAMEMODE.Config.currency .. tostring(amount)
    -- end
    -- return amountString
    local suffix = ""
    local absAmount = math.abs(amount)
    local formattedAmount = absAmount

    if absAmount >= 1e9 then
        formattedAmount = absAmount / 1e9
        suffix = "B ₩"
    elseif absAmount >= 1e6 then
        formattedAmount = absAmount / 1e6
        suffix = "M ₩"
    elseif absAmount >= 1e3 then
        formattedAmount = absAmount / 1e3
        suffix = "k ₩"
    else
        suffix = " ₩"
    end

    -- Round to two decimal places if necessary
    if formattedAmount % 1 ~= 0 then
        formattedAmount = string.format("%.2f", formattedAmount)
    end

    if amount < 0 then
        return "-" .. formattedAmount .. suffix
    else
        return formattedAmount .. suffix
    end
end




--PATH addons/gmod_info_board/lua/gmod_info_board/cl/gmib_model_select.lua:
net.Receive("gmib_ChooseBoardModel",function(len,ply)
    gmib.ChooseBoardModel()
end)

function gmib.ChooseBoardModel()
    
    local main = vgui.Create( "DFrame" )
    main:SetTitle( "Choose model" )
    main:MakePopup()
    main:SetSize( 200, 100 )
    main:Center()
    main:CenterHorizontal()
    
    local DComboBox = vgui.Create( "DComboBox", main )
    DComboBox:SetPos( 40, 35 )
    DComboBox:SetSize( 120, 20 )
    DComboBox:SetValue( "Choose model" )
    DComboBox:AddChoice( "1) Only board" )
    DComboBox:AddChoice( "2) Board with stand" )
    
    local DermaButton = vgui.Create( "DButton", main ) 
    DermaButton:SetText( "Select" )					
    DermaButton:SetPos( 40, 65 )					
    DermaButton:SetSize( 120, 20 )					
    DermaButton.DoClick = function()
        local choice = DComboBox:GetSelected()
        if choice == nil then return end

        if choice == "1) Only board" then
            choice = 1 
        else
            choice = 2 
        end

        print(choice)

        net.Start("gmib_ChooseBoardModel")
        net.WriteInt(choice,4)
        net.SendToServer()
    end
    
end --of gmib.ChooseBoardModel
--PATH lua/gmodadminsuite/sh_teams.lua:
GAS.Teams = {}
GAS.Teams.Identifiers = {}
GAS.Teams.IdentifiersIndexed = {}

local ReadyCallbacks = {}
function GAS.Teams:Ready(callback)
	if (GAS.Teams.CachedIdentifiers) then
		callback()
	else
		table.insert(ReadyCallbacks, callback)
	end
end

if (SERVER) then

	local function utf8_cmp(str1, str2)
		return
			str1 == str2 or
			utf8.force(str1) == utf8.force(str2)
	end

	GAS:netInit("teams:GetIdentifiers")
	local function NetworkIdentifiers(ply)
		GAS:netStart("teams:GetIdentifiers")
			net.WriteUInt(table.Count(GAS.Teams.Identifiers), 16)
			for team_index, identifier in pairs(GAS.Teams.Identifiers) do
				net.WriteUInt(team_index, 16)
				net.WriteUInt(identifier, 16)
			end
		net.Send(ply)
	end

	local GetIdentifiersQueue = {}
	GAS:netReceive("teams:GetIdentifiers", function(ply)
		if (GAS.Teams.CachedIdentifiers) then
			NetworkIdentifiers(ply)
		else
			table.insert(GetIdentifiersQueue, ply)
		end
	end)

	GAS.Teams:Ready(function()
		for _,ply in ipairs(GetIdentifiersQueue) do
			NetworkIdentifiers(ply)
		end
		GetIdentifiersQueue = {}
	end)

	local function teams_init()
		GAS.Teams.Identifiers = {}
		GAS.Teams.IdentifiersIndexed = {}
		
		GAS:print("Populating team identification...", GAS_PRINT_TYPE_INFO)

		GAS.Database:Query("SELECT `id`, `name`, `command`, `OPENPERMISSIONS_IDENTIFIER` FROM `gas_teams` WHERE `server_id`=" .. GAS.ServerID, function(rows)
			GAS.Database:BeginTransaction()

			if (DarkRP and RPExtraTeams) then
				for _,job in ipairs(RPExtraTeams) do
					local OPENPERMISSIONS_IDENTIFIER = NULL
					if (job.OPENPERMISSIONS_IDENTIFIER ~= nil) then
						OPENPERMISSIONS_IDENTIFIER = utf8.force(job.OPENPERMISSIONS_IDENTIFIER)
					end
					local found = false
					for _,row in ipairs(rows) do
						if (
							(row.OPENPERMISSIONS_IDENTIFIER ~= nil and job.OPENPERMISSIONS_IDENTIFIER ~= nil and utf8_cmp(job.OPENPERMISSIONS_IDENTIFIER, row.OPENPERMISSIONS_IDENTIFIER)) or
							(row.command ~= nil and utf8_cmp(job.command, row.command))
						) then
							found = true
							GAS.Database:Prepare("UPDATE `gas_teams` SET `name`=?, `command`=?, `OPENPERMISSIONS_IDENTIFIER`=? WHERE `server_id`=? AND `id`=?", {utf8.force(job.name), utf8.force(job.command), OPENPERMISSIONS_IDENTIFIER, GAS.ServerID, tonumber(row.id)})
							break
						end
					end
					if (not found) then
						GAS.Database:Prepare("INSERT INTO `gas_teams` (`server_id`, `name`, `command`, `OPENPERMISSIONS_IDENTIFIER`) VALUES(?,?,?,?)", {GAS.ServerID, utf8.force(job.name), utf8.force(job.command), OPENPERMISSIONS_IDENTIFIER})
					end
				end
			else
				for i,t in ipairs(team.GetAllTeams()) do
					local found = false
					for _,row in ipairs(rows) do
						if (row.name ~= nil and utf8_cmp(t.Name, row.name)) then
							found = true
							GAS.Database:Prepare("UPDATE `gas_teams` SET `name`=?, `command`=?, `OPENPERMISSIONS_IDENTIFIER`=? WHERE `server_id`=? AND `id`=?", {utf8.force(t.Name), NULL, NULL, GAS.ServerID, tonumber(row.id)})
							break
						end
					end
					if (not found) then
						GAS.Database:Prepare("INSERT INTO `gas_teams` (`server_id`, `name`, `command`, `OPENPERMISSIONS_IDENTIFIER`) VALUES(?,?,?,?)", {GAS.ServerID, utf8.force(t.Name), NULL, NULL})
					end
				end
			end

			GAS.Database:CommitTransaction(function()

				GAS.Database:Query("SELECT `id`, `name`, `command`, `OPENPERMISSIONS_IDENTIFIER` FROM `gas_teams` WHERE `server_id`=" .. GAS.ServerID, function(rows)
					for _,row in ipairs(rows) do
						if (DarkRP and RPExtraTeams) then
							for _,job in ipairs(RPExtraTeams) do
								if (GAS.Teams.Identifiers[job.team] ~= nil) then continue end
								if (
									(row.OPENPERMISSIONS_IDENTIFIER ~= nil and job.OPENPERMISSIONS_IDENTIFIER == row.OPENPERMISSIONS_IDENTIFIER) or
									(row.command ~= nil and job.command == row.command) or
									(row.name ~= nil and job.name == row.name)
								) then
									GAS.Teams.Identifiers[job.team] = tonumber(row.id)
									GAS.Teams.IdentifiersIndexed[tonumber(row.id)] = job.team
									break
								end
							end
						else
							for i,t in ipairs(team.GetAllTeams()) do
								if (GAS.Teams.Identifiers[i] ~= nil) then continue end
								if (row.name ~= nil and t.Name == row.name) then
									GAS.Teams.Identifiers[i] = tonumber(row.id)
									GAS.Teams.IdentifiersIndexed[tonumber(row.id)] = i
									break
								end
							end
						end
					end

					GAS.Teams.CachedIdentifiers = true

					for _,callback in ipairs(ReadyCallbacks) do
						callback()
					end
					ReadyCallbacks = {}

					hook.Run("GAS:TeamIdentifiersReady")

					GAS:print("Initialized team identification", GAS_PRINT_COLOR_GOOD, GAS_PRINT_TYPE_INFO)
				end)

			end)
		end)
	end

	local function sql_init()
		GAS:GMInitialize(function()
			GAS:InitPostEntity(function()
				GAS.Database:ServerID(teams_init)
			end)
		end)
		hook.Add("DConfigOnUpdateJob", "DConfig:UpdateJobCache", teams_init)
	end

	if (GAS.Database.MySQLDatabase) then
		GAS.Database:Query([[

			CREATE TABLE IF NOT EXISTS `gas_teams` (
				`id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
				`server_id` smallint(5) unsigned NOT NULL,
				`OPENPERMISSIONS_IDENTIFIER` varchar(189) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
				`command` varchar(189) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
				`name` varchar(189) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
				PRIMARY KEY (`id`),
				UNIQUE KEY `command` (`server_id`,`command`),
				UNIQUE KEY `OPENPERMISSIONS_IDENTIFIER` (`server_id`,`OPENPERMISSIONS_IDENTIFIER`)
			)

		]], function()
			GAS.Database:Query("SHOW INDEX FROM gas_teams WHERE KEY_NAME='name'", function(rows)
				if (rows and #rows > 0) then
					GAS.Database:Query("DROP INDEX name ON gas_teams", sql_init)
				else
					sql_init()
				end
			end)
		end)
	else
		GAS.Database:Query([[

			CREATE TABLE IF NOT EXISTS "gas_teams" (
				"id" INTEGER PRIMARY KEY,
				"server_id" INTEGER NOT NULL,
				"OPENPERMISSIONS_IDENTIFIER" TEXT DEFAULT NULL,
				"command" TEXT DEFAULT NULL,
				"name" TEXT NOT NULL,
				UNIQUE ("server_id","command"),
				UNIQUE ("server_id","OPENPERMISSIONS_IDENTIFIER")
			)

		]], sql_init)
	end

else

	GAS:netReceive("teams:GetIdentifiers", function(len)
		for i=1,net.ReadUInt(16) do
			local team_index, identifier = net.ReadUInt(16), net.ReadUInt(16)
			GAS.Teams.Identifiers[team_index] = identifier
			GAS.Teams.IdentifiersIndexed[identifier] = team_index
		end

		GAS.Teams.CachedIdentifiers = true

		for _,callback in ipairs(ReadyCallbacks) do
			callback()
		end
		ReadyCallbacks = {}

		hook.Run("GAS:TeamIdentifiersReady")
	end)

	GAS:InitPostEntity(function()
		GAS:netStart("teams:GetIdentifiers")
		net.SendToServer()
	end)

end

function GAS.Teams:GetIdentifier(team_index)
	return GAS.Teams.Identifiers[team_index]
end
function GAS.Teams:GetFromIdentifier(identifier)
	return GAS.Teams.IdentifiersIndexed[tonumber(identifier)]
end

GAS:hook("OpenPermissions:GetTeamIdentifier", "teams:OpenPermissions:GetTeamIdentifier", function(team_index)
	return GAS.Teams:GetIdentifier(team_index)
end)
GAS:hook("OpenPermissions:GetTeamFromIdentifier", "teams:OpenPermissions:GetTeamFromIdentifier", function(team_identifier)
	return GAS.Teams:GetFromIdentifier(team_identifier)
end)
--PATH lua/gmodadminsuite/sh_modules.lua:
GAS.Modules = {}
GAS.Modules.Info = {}

GAS.MODULE_CATEGORY_ADMINISTRATION    = 0
GAS.MODULE_CATEGORY_PLAYER_MANAGEMENT = 1
GAS.MODULE_CATEGORY_UTILITIES         = 2
GAS.MODULE_CATEGORY_FUN               = 3

GAS.Modules.Organised = {}

function GAS.Modules:GetFriendlyName(module_name)
	return GAS:Phrase("module_name", module_name) or GAS.Modules.Info[module_name].Name or module_name
end

if (SERVER) then

	GAS.Modules.Config = GAS:GetConfig("modules", {
		Enabled = {}
	})

	GAS:netInit("SetModuleEnabled")
	GAS:netReceive("SetModuleEnabled", function(ply)
		if (not OpenPermissions:IsOperator(ply)) then return end

		local module_name, enabled = net.ReadString(), net.ReadBool()

		GAS.Modules.Config.Enabled[module_name] = enabled or nil
		GAS:SaveConfig("modules", GAS.Modules.Config)

		GAS:netStart("SetModuleEnabled")
			net.WriteString(module_name)
			net.WriteBool(enabled)
		net.SendOmit(ply)
	end)

else

	GAS:netReceive("SetModuleEnabled", function()
		local module_name, enabled = net.ReadString(), net.ReadBool()
		GAS.Modules.Config.Enabled[module_name] = enabled or nil
	end)

end

GAS.Modules.LoadedModules = {}
function GAS.Modules:IsModuleLoaded(module_name)
	return GAS.Modules.LoadedModules[module_name] == true
end

GAS.Modules.MODULE_ENABLED  = 0
GAS.Modules.MODULE_DISABLED = 1
GAS.Modules.MODULE_UNKNOWN  = 2
function GAS.Modules:IsModuleEnabled(module_name)
	if (GAS.Modules.Info[module_name]) then
		if (GAS.Modules.Config.Enabled[module_name]) then
			return GAS.Modules.MODULE_ENABLED
		else
			return GAS.Modules.MODULE_DISABLED
		end
	else
		return GAS.Modules.MODULE_UNKNOWN
	end
end

function GAS.Modules:LoadModule(module_name, suppress_print)
	GAS.Modules.LoadedModules[module_name] = true
	hook.Run("gmodadminsuite:LoadModule:" .. module_name, GAS.Modules.Info[module_name])
end

GAS:StartHeader("Modules")

local save_config = false
local _,d = file.Find("gmodadminsuite/modules/*", "LUA")
for _,module_name in ipairs(d) do
	if (not file.Exists("gmodadminsuite/modules/" .. module_name .. "/_gas_info.lua", "LUA")) then continue end

	if (SERVER) then
		AddCSLuaFile("gmodadminsuite/modules/" .. module_name .. "/_gas_info.lua")
	end
	GAS.Modules.Info[module_name] = include("gmodadminsuite/modules/" .. module_name .. "/_gas_info.lua")

	local category = GAS.Modules.Info[module_name].Category
	GAS.Modules.Organised[category] = GAS.Modules.Organised[category] or {}
	GAS.Modules.Organised[category][module_name] = GAS.Modules.Info[module_name]

	local init = false
	if (file.Exists("gmodadminsuite/modules/" .. module_name .. "/sh_init.lua", "LUA")) then
		if (SERVER) then AddCSLuaFile("gmodadminsuite/modules/" .. module_name .. "/sh_init.lua") end
		include("gmodadminsuite/modules/" .. module_name .. "/sh_init.lua")
		init = true
	end
	if (file.Exists("gmodadminsuite/modules/" .. module_name .. "/cl_init.lua", "LUA")) then
		if (SERVER) then AddCSLuaFile("gmodadminsuite/modules/" .. module_name .. "/cl_init.lua") end
		if (CLIENT) then include("gmodadminsuite/modules/" .. module_name .. "/cl_init.lua") end
		init = true
	end
	if (SERVER and file.Exists("gmodadminsuite/modules/" .. module_name .. "/sv_init.lua", "LUA")) then
		include("gmodadminsuite/modules/" .. module_name .. "/sv_init.lua")
		init = true
	end

	local friendly_name
	if (SERVER) then
		friendly_name = GAS.Modules.Info[module_name].Name
	else
		friendly_name = GAS:Phrase("module_name", module_name)
	end
	if (SERVER) then
		if (GAS.Modules.Config.Enabled[module_name] == nil and GAS.Modules.Info[module_name].DefaultEnabled == true) then
			GAS.Modules.Config.Enabled[module_name] = true
			save_config = true
		end
		if (GAS.Modules.Config.Enabled[module_name]) then
			GAS:HeaderPrint("= " .. friendly_name, GAS_PRINT_COLOR_GOOD)
		else
			GAS:HeaderPrint("X " .. friendly_name, GAS_PRINT_COLOR_BAD)
		end
	elseif (init) then
		GAS:HeaderPrint("✓ " .. friendly_name, GAS_PRINT_COLOR_GOOD)
	end
end

GAS:EndHeader()

if (save_config) then
	GAS:SaveConfig("modules", GAS.Modules.Config)
end

if (CLIENT) then
	GAS:InitPostEntity(function()
		GAS:GetConfig("modules", function(config)
			GAS.Modules.Config = config
			for module_name, enabled in pairs(GAS.Modules.Config.Enabled) do
				if (not enabled) then continue end
				GAS.Modules:LoadModule(module_name, true)
			end
		end)
	end)
else
	for module_name, enabled in pairs(GAS.Modules.Config.Enabled) do
		if (not enabled) then continue end
		GAS.Modules:LoadModule(module_name, true)
	end
end
--PATH addons/gmodadminsuite-logging-2.4.8/lua/gmodadminsuite/modules/logging/sh_init.lua:
if (SERVER) then
	include("sv_backwards_compatibility.lua")

	GAS_Logging_ReadyCallbacks = {}
	function GAS_Logging_Init(callback)
		if (GAS and GAS.Logging and GAS.Logging.Loaded) then
			callback()
		else
			table.insert(GAS_Logging_ReadyCallbacks, callback)
		end
	end
	
	AddCSLuaFile("cl_menu.lua")
	AddCSLuaFile("cl_livelogs.lua")
	AddCSLuaFile("sh_log_formatting.lua")
	AddCSLuaFile("sh_scenes.lua")
end

GAS:hook("gmodadminsuite:LoadModule:logging", "LoadModule:jobwhitelist:logging", function(module_info)
	if (GAS.Logging and IsValid(GAS.Logging.Menu)) then
		GAS.Logging.Menu:Close()
	end

	GAS.Logging = {}

	GAS.Logging.FORMAT_PLAYER    = 0
	GAS.Logging.FORMAT_WEAPON    = 1
	GAS.Logging.FORMAT_ENTITY    = 2
	GAS.Logging.FORMAT_PROP      = 3
	GAS.Logging.FORMAT_RAGDOLL   = 4
	GAS.Logging.FORMAT_CURRENCY  = 5
	GAS.Logging.FORMAT_COUNTRY   = 6
	GAS.Logging.FORMAT_AMMO      = 7
	GAS.Logging.FORMAT_TEAM      = 8
	GAS.Logging.FORMAT_USERGROUP = 9
	GAS.Logging.FORMAT_STRING    = 10
	GAS.Logging.FORMAT_HIGHLIGHT = 11
	GAS.Logging.FORMAT_ROLE      = 12
	GAS.Logging.FORMAT_VEHICLE   = 13
	GAS.Logging.FORMAT_DAMAGE    = 14
	
	function GAS.Logging:ClassTypeNames(L) return {
		[GAS.Logging.FORMAT_PLAYER]    = L"class_type_player",
		[GAS.Logging.FORMAT_WEAPON]    = L"class_type_weapon",
		[GAS.Logging.FORMAT_ENTITY]    = L"class_type_entity",
		[GAS.Logging.FORMAT_PROP]      = L"class_type_prop",
		[GAS.Logging.FORMAT_RAGDOLL]   = L"class_type_ragdoll",
		[GAS.Logging.FORMAT_COUNTRY]   = L"class_type_country",
		[GAS.Logging.FORMAT_AMMO]      = L"class_type_ammo",
		[GAS.Logging.FORMAT_TEAM]      = L"class_type_team",
		[GAS.Logging.FORMAT_USERGROUP] = L"class_type_usergroup",
		[GAS.Logging.FORMAT_ROLE]      = L"class_type_role",
		[GAS.Logging.FORMAT_VEHICLE]   = L"class_type_vehicle",
		[GAS.Logging.FORMAT_DAMAGE]    = L"class_type_damage",
	} end

	GAS.Logging.PvP_LOG_TYPE_CHAT                = 0
	GAS.Logging.PvP_LOG_TYPE_CHAT_TEAM           = 1
	GAS.Logging.PvP_LOG_TYPE_WEAPON_PICKUP       = 2
	GAS.Logging.PvP_LOG_TYPE_WEAPON_DROPPED      = 3
	GAS.Logging.PvP_LOG_TYPE_ITEM_PICKUP         = 4
	GAS.Logging.PvP_LOG_TYPE_SPAWNMENU           = 5
	GAS.Logging.PvP_LOG_TYPE_DARKRP_PURCHASE     = 6
	GAS.Logging.PvP_LOG_TYPE_DISCONNECT          = 7
	GAS.Logging.PvP_LOG_TYPE_WEAPON_SWITCHED     = 8
	GAS.Logging.PvP_LOG_TYPE_TEAM_SWITCH         = 9
	GAS.Logging.PVP_LOG_TYPE_SILENT_DEATH        = 10
	GAS.Logging.PvP_LOG_TYPE_DEATH_WORLD         = 11
	GAS.Logging.PvP_LOG_TYPE_DEATH_PLAYER_WEP    = 12
	GAS.Logging.PvP_LOG_TYPE_DEATH_PLAYER        = 13
	GAS.Logging.PvP_LOG_TYPE_DEATH_ENT           = 14
	GAS.Logging.PvP_LOG_TYPE_DEATH               = 15
	GAS.Logging.PvP_LOG_TYPE_DEATH_PROPKILL_SELF = 16
	GAS.Logging.PvP_LOG_TYPE_DEATH_PROPKILL      = 17

	GAS.Logging.PvP_FLAG_FRIENDLYFIRE     = 0
	GAS.Logging.PvP_FLAG_LAWENFORCEMENT   = 1
	GAS.Logging.PvP_FLAG_LINKED           = 2
	GAS.Logging.PvP_FLAG_ADMIN            = 3
	GAS.Logging.PvP_FLAG_SUPERADMIN       = 4
	GAS.Logging.PvP_FLAG_VEHICLE          = 5
	GAS.Logging.PvP_FLAG_PROPS            = 6
	GAS.Logging.PvP_FLAG_DISCONNECT       = 7
	GAS.Logging.PvP_FLAG_WORLD            = 9
	GAS.Logging.PvP_FLAG_ONGOING          = 10
	GAS.Logging.PvP_FLAG_FINISHED         = 11
	GAS.Logging.PvP_FLAG_TEAM_SWITCHED    = 12
	GAS.Logging.PvP_FLAG_INSTIGATOR_DEATH = 13
	GAS.Logging.PvP_FLAG_VICTIM_DEATH     = 14

	GAS.Logging.PvP_EVENT_ID              = 1
	GAS.Logging.PvP_PRECISE_CREATION_TIME = 2
	GAS.Logging.PvP_LAST_UPDATED          = 3
	GAS.Logging.PvP_INSTIGATOR            = 4
	GAS.Logging.PvP_INSTIGATOR_WEPS       = 5
	GAS.Logging.PvP_INSTIGATOR_DMG_TKN    = 6
	GAS.Logging.PvP_INSTIGATOR_DMG_GVN    = 7
	GAS.Logging.PvP_INSTIGATOR_TEAM       = 8
	GAS.Logging.PvP_VICTIM                = 9
	GAS.Logging.PvP_VICTIM_WEPS           = 10
	GAS.Logging.PvP_VICTIM_DMG_TKN        = 11
	GAS.Logging.PvP_VICTIM_DMG_GVN        = 12
	GAS.Logging.PvP_VICTIM_TEAM           = 13
	GAS.Logging.PvP_TOTAL_DMG             = 14
	GAS.Logging.PvP_LINKED_EVENTS         = 15
	GAS.Logging.PvP_EVENT_LOGS            = 16
	GAS.Logging.PvP_EVENT_LOGS_CHRONOLOGY = 17
	GAS.Logging.PvP_WEP_VEHICLES          = 18
	GAS.Logging.PvP_FLAGS                 = 19
	GAS.Logging.PvP_ONGOING               = 20
	GAS.Logging.PvP_INSTIGATOR_NICK       = 21
	GAS.Logging.PvP_VICTIM_NICK           = 22
	GAS.Logging.PvP_COMBAT_SCENE          = 23
	GAS.Logging.PvP_CREATION_TIMESTAMP    = 24

	GAS.Logging.PvP_SCENE_MODEL              = 1
	GAS.Logging.PvP_SCENE_POS                = 2
	GAS.Logging.PvP_SCENE_ANG                = 3
	GAS.Logging.PvP_SCENE_PLY_COLOR          = 4
	GAS.Logging.PvP_SCENE_SHOOT_POS          = 5
	GAS.Logging.PvP_SCENE_EYE_POS            = 6
	GAS.Logging.PvP_SCENE_HEAD_ANG           = 7
	GAS.Logging.PvP_SCENE_WEAPON_MDL         = 8
	GAS.Logging.PvP_SCENE_WEAPON_CLASS       = 9
	GAS.Logging.PvP_SCENE_SEQUENCE           = 10
	GAS.Logging.PvP_SCENE_VEHICLE_MODEL      = 11
	GAS.Logging.PvP_SCENE_VEHICLE_POS        = 12
	GAS.Logging.PvP_SCENE_VEHICLE_ANG        = 13
	GAS.Logging.PvP_SCENE_VEHICLE_ATTACHMENT = 14

	GAS.Logging.PvP_DAMAGE_TYPES = {
		DMG_GENERIC,
		DMG_CRUSH,
		DMG_BULLET,
		DMG_SLASH,
		DMG_BURN,
		DMG_VEHICLE,
		DMG_FALL,
		DMG_BLAST,
		DMG_CLUB,
		DMG_SHOCK,
		DMG_SONIC,
		DMG_ENERGYBEAM,
		DMG_PREVENT_PHYSICS_FORCE,
		DMG_NEVERGIB,
		DMG_ALWAYSGIB,
		DMG_DROWN,
		DMG_PARALYZE,
		DMG_NERVEGAS,
		DMG_POISON,
		DMG_RADIATION,
		DMG_DROWNRECOVER,
		DMG_ACID,
		DMG_SLOWBURN,
		DMG_REMOVENORAGDOLL,
		DMG_PHYSGUN,
		DMG_PLASMA,
		DMG_AIRBOAT,
		DMG_DISSOLVE,
		DMG_BLAST_SURFACE,
		DMG_DIRECT,
		DMG_BUCKSHOT,
		DMG_SNIPER,
		DMG_MISSILEDEFENSE
	}

	GAS.Logging.ThirdPartyAddons = {
		["ULX Admin Mod"] = {installed = function()
			return ulx ~= nil
		end, website = "https://ulyssesmod.net"},

		["ServerGuard Admin Mod"] = {installed = function()
			return SERVERGUARD ~= nil
		end, gmodstore = "1847"},

		["AWarn"] = {installed = function()
			return AWarn ~= nil
		end, gmodstore = "629"},

		["Cuffs - Handcuffs and Restraints"] = {installed = function()
			return ConVarExists("cuffs_allowbreakout")
		end, gmodstore = "910"},

		["Medic / Armor NPC"] = {installed = function()
			return MavNPCModel ~= nil
		end, workshop = "912372779"},

		["PAC3"] = {installed = function()
			return pac ~= nil
		end, workshop = "104691717"},

		["Pointshop Trading System"] = {installed = function()
			return TRADING ~= nil
		end, gmodstore = "1672"},

		["Simple Party System"] = {installed = function()
			return party ~= nil
		end, gmodstore = "2109"},

		["SprayMesh"] = {installed = function()
			return SprayMesh ~= nil
		end, workshop = "394091909"},

		["Star Wars Vehicles"] = {installed = function()
			local SWVehicles = list.Get("SWVehicles")
			return SWVehicles and table.Count(SWVehicles) > 0
		end, workshop = "1311553933"},

		["WAC Aircraft"] = {installed = function()
			return wac ~= nil
		end, workshop = "104990330"},

		["Wyozi Cinema Kit"] = {installed = function()
			return wck ~= nil
		end, gmodstore = "1471"},

		["Wyozi DJ Kit"] = {installed = function()
			return wdj ~= nil
		end, gmodstore = "1534"},

		["bWhitelist"] = {installed = function()
			return GAS.JobWhitelist ~= nil
		end, gmodadminsuite = "jobwhitelist", gmodstore = "6017"},

		["bKeycardScanner"] = {installed = function()
			return bKeycardScanner ~= nil
		end, gmodstore = "3192"},
	}

	GAS.Logging.RolesEnabled = false
	function GAS.Logging:EnableRoles()
		GAS.Logging.RolesEnabled = true
	end

	if (SERVER) then
		include("gmodadminsuite/modules/logging/sv_logging.lua")
		include("gmodadminsuite/modules/logging/sv_logscanning.lua")

		GAS.XEON:PostLoad(function()
			XEON:Init("6016", "[GAS] Billy's Logs", "2.4", "gmodadminsuite/modules/logging/sv_drm.lua", include("gmodadminsuite/modules/logging/license.lua"))
		end)
	else
		include("gmodadminsuite/modules/logging/cl_menu.lua")
		include("gmodadminsuite/modules/logging/cl_livelogs.lua")
	end

	include("gmodadminsuite/modules/logging/sh_log_formatting.lua")
	include("gmodadminsuite/modules/logging/sh_scenes.lua")

	if (CLIENT) then
		local _,ds = file.Find("gmodadminsuite/modules/logging/modules/gamemodes/*", "LUA")
		for _,d in ipairs(ds) do
			if (file.Exists("gmodadminsuite/modules/logging/modules/gamemodes/" .. d .. "/_roles.lua", "LUA")) then
				include("gmodadminsuite/modules/logging/modules/gamemodes/" .. d .. "/_roles.lua")
			end
		end

		GAS:netReceive("logging:NetworkConfig", function()
			GAS.Logging.Config = {}
			GAS.Logging.Config.OverrideMoneyFormat = net.ReadBool()
			GAS.Logging.Config.MoneyFormat = net.ReadString()
			GAS.Logging.Config.Player_RecordTeam = net.ReadBool()
			GAS.Logging.Config.Player_RecordUsergroup = net.ReadBool()
			GAS.Logging.Config.Player_RecordHealth = net.ReadBool()
			GAS.Logging.Config.Player_RecordArmor = net.ReadBool()
			GAS.Logging.Config.Player_RecordWeapon = net.ReadBool()
			GAS.Logging.Config.Player_RecordRole = net.ReadBool()
			GAS.Logging.Config.DeepStorageEnabled = net.ReadBool()

			GAS.Logging.Config.Player_RecordWeapon_DoNotRecord = {}
			for i=1,net.ReadUInt(6) do
				GAS.Logging.Config.Player_RecordWeapon_DoNotRecord[net.ReadString()] = true
			end
		end)

		GAS:InitPostEntity(function()
			GAS:netStart("logging:NetworkConfig")
			net.SendToServer()
		end)
	end
end)
--PATH lua/gmodadminsuite/sh_permissions.lua:
if (SERVER) then AddCSLuaFile() end

if (SERVER) then
	local function OpenPermissions_Init()
		GAS:unhook("OpenPermissions:Ready", "GAS:OpenPermissions")

		GAS.OpenPermissions = OpenPermissions:RegisterAddon("gmodadminsuite", {
			Name = "GmodAdminSuite",
			Color = Color(30,34,42),
			Icon = "icon16/shield.png",
			Logo = {
				Path = "gmodadminsuite/gmodadminsuite.vtf",
				Width = 256,
				Height = 256
			}
		})

		GAS.OpenPermissions:AddToTree({
			Label = "See IP Addresses",
			Icon = "icon16/server_connect.png",
			Value = "see_ip_addresses",
			Default = OpenPermissions.CHECKBOX.CROSSED
		})

		local modules_tree = GAS.OpenPermissions:AddToTree({
			Label = "Modules",
			Icon = "icon16/server.png"
		})

		for module_name, module_data in pairs(GAS.Modules.Info) do
			if (not module_data.OperatorOnly and not module_data.NoMenu and not module_data.Hidden and not module_data.Public) then
				modules_tree:AddToTree({
					Label = module_data.Name,
					Value = module_name,
					Tip = "Can access the menu of " .. module_data.Name .. "?",
					Icon = module_data.Icon
				})
			end
		end
	end
	if (OpenPermissions_Ready == true) then
		OpenPermissions_Init()
	else
		GAS:hook("OpenPermissions:Ready", "GAS:OpenPermissions", OpenPermissions_Init)
	end
end

function GAS:CanAccessMenu(ply)
	if (OpenPermissions:IsOperator(ply)) then return true end
	for module_name in pairs(GAS.Modules.Config.Enabled) do
		if (OpenPermissions:HasPermission(ply, "gmodadminsuite/" .. module_name)) then
			return true
		end
	end
	return false
end
--PATH lua/gmodadminsuite/cl_menubar.lua:
local function L(phrase, ...)
	if (#({...}) == 0) then
		return GAS:Phrase(phrase)
	else
		return GAS:PhraseFormat(phrase, nil, ...)
	end
end

hook.Add("PopulateMenuBar", "gmodadminsuite.menubar", function(p)
	p.GASMenu = p:AddOrGetMenu("GmodAdminSuite")

	p.GASMenu:AddOption(L"open_gas", function()
		RunConsoleCommand("gmodadminsuite")
	end):SetIcon("icon16/shield.png")

	p.GASMenu:AddSpacer()

	for ident, tab in pairs(GAS.Modules.Info) do
		hook.Add("gmodadminsuite:LoadModule:"..ident, "gmodadminsuite.menubar", function()
			p.GASMenu:AddOption(tab.Name, function()
				GAS:PlaySound("popup")
				RunConsoleCommand("gmodadminsuite", ident)
			end):SetIcon(tab.Icon)
			hook.Remove("gmodadminsuite:LoadModule:"..ident, "gmodadminsuite.menubar")
		end)
	end
end)
--PATH addons/mc_simple_npcs/lua/mcs_npcs/cl_menu.lua:
--  _______               __          _______  __                   __          _______  ______  ______        
-- |   |   |.---.-..----.|  |.-----. |     __||__|.--------..-----.|  |.-----. |    |  ||   __ \|      |.-----.
-- |       ||  _  ||  __| |_||__ --| |__     ||  ||        ||  _  ||  ||  -__| |       ||    __/|   ---||__ --|
-- |__|_|__||___._||____|    |_____| |_______||__||__|__|__||   __||__||_____| |__|____||___|   |______||_____|
--                                                          |__|                                               

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////// Warning! Edit this only if you know what are you doing ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

net.Receive("OpenMCSMenu", function()
	npc = net.ReadEntity()
	
	if !IsValid(npc) then return end
	
	local theme = MCS.Spawns[npc:GetUID()].theme
	
	if theme and theme != "Default" and MCS.Themes[theme] then
		
		if MCS.Themes[theme].Menu then
			MCS.Themes[theme].Menu(npc)
		elseif MCS.Themes[theme].Paint then
			MCS.OpenDialogue(npc, theme)
		else
			MCS.OpenDialogue(npc)
		end
	else
		MCS.OpenDialogue(npc)
	end
	
end)

MCS.OpenDialogue = function(npc, theme, test)
	
	if !IsValid(npc) and !test then return end
	
	local testmode = MCS.Config.DebugMode
	
	if test then testmode = true end
	
	// Fonts
	local AnswersFont, NPCFont, AnswersAlign = MCS.Config.AnswersFont, MCS.Config.NPCFont, MCS.Config.AnswersAlign
	// Colors
	local NPCTextColor, TextColor, HighlightColor = MCS.Config.NPCTextColor, MCS.Config.TextColor, MCS.Config.HighlightColor
	// Functions
	local PaintFunction = MCS.PaintFunction
	
	if theme then
		theme = MCS.Themes[theme]
		
		PaintFunction = theme.Paint
		
		if theme.Fonts then
			AnswersFont, NPCFont, AnswersAlign = theme.Fonts[1], theme.Fonts[2], theme.Fonts[3]
		end
		
		if theme.Colors then
			NPCTextColor, TextColor, HighlightColor = theme.Colors.NPCTextColor, theme.Colors.TextColor, theme.Colors.HighlightColor
		end
		
	end
	
	local dialogs = (test and test.dialogs) or MCS.Spawns[npc:GetUID()].dialogs
	
	if !dialogs then return end
	
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
	mainf:ShowCloseButton( testmode )
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
		surface.SetFont(AnswersFont)
		local tw, th = surface.GetTextSize((npc and npc:GetNamer()) or test.name)
		
		draw.SimpleTextOutlined( (npc and npc:GetNamer()) or test.name, AnswersFont, w/8, h/2-th-5, NPCTextColor, TEXT_ALIGN_LEFT, 1, 1, Color(0,0,0,100))
			
		if showhint then
			local skipb = TextColor
			skipb.a = 100+math.sin( CurTime()*5)*55
			draw.SimpleTextOutlined( MCS.Config.SkipButton , AnswersFont, w/2, h/2+h/4+10, skipb, TEXT_ALIGN_CENTER, 1, 1, Color(0,0,0,100))
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
		subf:SetPos(mainf:GetWide()/8,mainf:GetTall()/2-10)
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
			PaintFunction(self, w, h, fade)
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
		subl:SetSize( mainf:GetWide()-mainf:GetWide()/4, mainf:GetTall()/4-10 )
		subl:SetPos(mainf:GetWide()/8,mainf:GetTall()/2+mainf:GetTall()/4-10)
		subl:SetDraggable( false )
		subl:ShowCloseButton( false )
		subl:SetTitle( "" )
		subl.Paint = function( self, w, h ) 
			PaintFunction(self, w, h, fade2)
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
					self.fade = Lerp(FrameTime() * 7, self.fade, 255)
				else
					self.fade = Lerp(FrameTime() * 7, self.fade, 0)
				end
				
				local colstn = TextColor
				colstn.a = fade2-self.fade
				local colhgl = HighlightColor
				colhgl.a = self.fade
				
				local x = 0
				
				if AnswersAlign == TEXT_ALIGN_CENTER then
					x = w/2
				elseif AnswersAlign == TEXT_ALIGN_RIGHT then
					x = w
				end
				
				draw.SimpleText( ans[1], AnswersFont, x+1, 0, Color( 0, 0, 0,fade2), AnswersAlign )
				draw.SimpleText( ans[1], AnswersFont, x, 1,colhgl, AnswersAlign )
				draw.SimpleText( ans[1], AnswersFont, x, 1, colstn, AnswersAlign )
				
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

--PATH addons/msd_ui/lua/msd/language/en.lua:
MSD.Language["en"] = {

	lang_name = "English",

	ok = "OK",
	map = "Map",
	off = "Off",
	on = "On",
	time_add = "Time to add",
	type = "Type",
	delay = "Delay",
	cancel = "Cancel",
	enable = "Enable",
	model = "Model",
	name = "Name",
	settings = "Settings",
	editor = "Editor",
	red = "Red",
	green = "Green",
	blue = "Blue",
	admin_menu = "Administration menu",
	ui_settings = "UI Settings",
	active = "Active",
	inactive = "Inactive",
	disabled = "Disabled",
	warning = "Warning!",
	remove = "Remove",
	theme = "Theme",
	dark_theme = "Dark theme",
	payment = "Payment",
	load_autosave = "Load last autosave?",
	load_save = "Load save",
	create_new = "Create new",
	enable_option = "Enable option",
	main_opt = "Main options",
	copy_data = "Copy data",
	save_chng = "Save changes",
	enter_name = "Enter the name",
	enter_id = "Enter the ID",
	confirm_action = "Please confirm your actions",
	check_fpr_errors = "Check for errors",
	enter_description = "Enter description",
	cooldown_ok = "Cooldown on success",
	cooldown_fail = "Cooldown on fail",
	s_team_whitelist = "Setup team whitelist",
	whitelist_blacklist = "The whitelist is a blacklist",
	custom_val = "Set custom value",
	set_hp_full = "Set full HP",
	dist_to_close = "Distance to closest",

	e_text = "Enter text",
	e_number = "Enter number",
	e_class = "Enter class",
	e_value = "Enter value",
	e_blank_dis = "Leave blank to disable",
	e_blank_default = "Leave blank to use default",
	e_url = "Enter URL",
	e_model = "Enter model path",
	e_material = "Enter material path",
	e_wep_class = "Enter weapon class",
	e_ent_class = "Enter entity class",
	e_veh_class = "Enter vehicle class",
	e_npc_class = "Enter NPC class",

	select_ammo = "Selected ammo",
	amount_ammo = "Ammo amount",
	disable_phys = "Disable physics",
	none = "None",
	custom_icon = "Set custom icon",
	weapon_name = "Weapon name",
	moveup = "Move up",
	movedown = "Move down",
	movepoint = "Move point",
	swap = "Swap",
	swapmod = "Swap mod enabled. Click to disable",
	copy_from_ent = "Copy from looking entity",
	set_pos_self = "Set to your position",
	set_pos_aim = "Set to looking poit",
	spawn_point = "Spawn point",
	spawn_ang = "Spawn angle",
	mark_area = "Mark area",
	time_wait = "Time to wait",
	map_marker = "Select map marker",
	in_sec = "in seconds",
	def_units = "Default %s units", -- "Default 350 units" leave %s as is
	def_seconds = "Default %s seconds", -- "Default 10 seconds" leave %s as is
	ent_show_pointer = "Show pointer above the entity",
	ent_arcade_style = "Arcade-style entity appearance",
	ent_stnd_style = "Standart entity appearance",
	custom_color = "Enable custom color",
	mat_default = "Leave blank for default material",

	set_ui = "UI settings",
	set_hud = "HUD settings",
	set_hud_pos = "Quest HUD position",
	set_hud_themes = "HUD Themes",
	set_server = "Server settings",
	set_ui_blur = "Blur background",
	set_ui_mono = "Monochrome background",
	set_ui_vignette = "Vignette effect for background",
	set_ui_brightness = "Background brightness",
	set_ui_color = "Select the main color",
	set_ui_align_left = "Horizontal alignment to the left",
	set_ui_align_right = "Horizontal alignment to the right",
	set_ui_align_top = "Vertical alignment to the top",
	set_ui_align_bottom = "Vertical alignment to the bottom",
	set_ui_offset_h = "Horizontal Offset",
	set_ui_offset_v = "Vertical Offset",

	upl_changes = "Upload changes to server",
	res_changes = "Restore changes",

	-- Player

	dead = "You are dead",
	time_ex = "Time expired",
	vehicle_bum = "Your vehicle is destroyed",
	left_area = "You left the area",
	m_blew = "You blew up the mission",
	m_failed = "Mission failed",
	m_success = "Mission success",
	m_loop = "Mission update",

	-- Errors

	inv_quest = "Invalid quest",
	team_bl = "Your team is blacklisted",
	no_players = "Server needs more players to be online before you can do this",
	no_players_team = "Server needs more players for specific team(s) to be online before you can do this",
	need_admin = "Only admins can do this action",

	-- Quests

	active_quest = "You have an active quest",
	inactive_quest = "You can't play this quest",
	quest_editor = "Quest Editor",
	quest_list = "Quest List",
	quests = "Quests",
	leave_pnt = "Leave point",

	q_editobj = "Edit objectives",
	q_incvobj = "Invalid objective",
	q_setobj = "Objective settings",
	q_newobj = "Add new objective",
	q_editrwd = "Edit rewards",
	q_rwdeditor = "Reward Editor",
	q_rwdlist = "Reward List",
	q_rwdsets = "Reward Settings",
	q_findmap = "Find quest from other maps",
	q_obj_des = "Objecive description",
	q_dist_point = "Distance to point",
	q_dist_from_point = "Distance from point",
	q_ignore_veh = "Ignore quest vehicle",
	q_timer_show = "Show the timer to player",
	q_area_stay = "Player must stay in area",
	q_start = "Start Quest",
	q_new = "New quest",
	q_submit = "Submit quest",
	q_addnew = "Add new quest",
	q_remove = "Remove quest",
	q_id_unique = "ID must be unique for each quest",
	q_complete_msg = "Quest complete message",
	q_dotime = "Quest do time",
	q_dotime_ok = "Succeed quest on time end",
	q_dotime_fail = "Fail quest on time end",
	q_death_fail = "Fail quest on player death",
	q_loop = "Loop quest tasks",
	q_loop_reward = "Reward player on each loop",
	q_enable = "Enable quest",
	q_events = "Events",
	q_eventadd = "Add Event",
	q_eventedit = "event edit",
	q_eventremove = "Remove event",
	q_in_progress = "Quest in progress",
	q_time_left = "Time left",
	q_ply_limit = "Player limit for the quest",
	q_ply_team_limit = "Setup team limits",
	q_ply_team_need = "Needed team players",
	q_ply_need = "Player amount needed to start",
	q_play_limit = "There is a limit on how much players can play this quest",
	q_must_stay_area = "You must stay inside this area, or quest will be failed",
	q_time_wait = "You need to wait before replaying this quest",
	q_dotime_reset = "Reset quest do time",
	q_dotime_add = "Add quest do time",
	q_noreplay = "You can't replay this quest",
	q_dis_replay = "Disable quest replay",
	q_needquest = "You need to finish another quest first",
	q_needquest_menu = "Require completed quest",
	q_enterror = "Quest entities didn't spawn, check quest setup",
	q_get = "You can get a quest from these NPCs",
	q_noquests = "There is no way to play quests yet :(",
	q_ent_draw = "Quest entity draw distance",
	q_loop_stop_key = "Looped quest stop key",
	q_hold_key_stop = "To stop quest hold [%s]", -- To stop quest hold [P]
	q_enter_veh = "Enter your vehicle",
	q_npc_link = "Link quest to an NPC",
	q_icon68 = "Enter url to .PNG icon 68x68 px",
	q_ent_pos_show = "Show entities location to the player",
	q_area_size = "Area size",
	q_area_pos = "Area postition",
	q_s_area_size = "Search area size",
	q_s_area_pos = "Search area postition",
	q_npc_answer_ok = "Player's positive answer",
	q_npc_answer_no = "Player's negative answer",
	q_npc_answer_noq = "Player's answer if no quests",
	q_npc_quest_no = "NPC speech if no quests",
	q_money_give = "Money to give",

	-- Simple NPCs

	npc_editor = "NPC Editor",
	npc_new = "New NPC",
	npc_select = "Select an NPC",
	npc_e_speech = "Enter NPC speech",
	npc_submit = "Confirm NPC creation",
	npc_update = "Update NPC",
	npc_remove = "Remove NPC",
	npc_q_enable = "Enable quest NPCs",
	npc_did_open = "Dialog ID to open",
	npc_q_target = "NPC is an objective target",
	npc_hostile = "Hostile NPC",


	-- Update 1.1.0

	cam_start = "Camera start parameters",
	cam_end = "Camera end parameters",
	cam_pos = "Camera position",
	cam_ang = "Camera angle",
	cam_fov = "Camera FOV",
	cam_effect = "Camera shutter effect",
	q_open_target = "Allow other players to kill NPCs",
	q_npc_mind = "Min. distance to NPCs",
	not_spawned = "not spawned",
	dis_text = "Displayed text",
	cam_speed = "Camera movement speed (lower number - slower movement)",
	fov_speed = "FOV change speed (lower number - slower movement)",
	category_des = "Quest category, used to sort quests",
	sortquests_cat = "Sort quests by category",
	search_q = "Search quests",
	quest_tools = "Quest tools",
	set_anim = "Set Animation",
	s_quest_blacklist = "Setup quest blacklist",
	s_quest_blacklist_desc = "Select quests that will block this quest if you played them",
	hold_use = "Hold [%s] key",
	duplicate = "Duplicate",
	unsorted = "Unsorted",
	search = "Search",
	duration = "Duration",
	category = "Category",
	blacklist = "Blacklist",


	--  Update 1.2.0

	restore_wep = "Restore weapons on quest end",
	e_cmd = "Enter console command",
	e_args = "Enter command arguments",
	hint_cmd = "Autofill shortcuts: \n$uid - UserID, \n$sid - SteamID,  \n$s64 - SteamID 64, \n$n - Player name",
	youaretracked = "Your position is now compromised to other players!",
	border_rounded = "Rounded border design",
	border_square = "Square border design",
	access_settings = "Menu access",
	compact_obj = "Compact objective list for quests",
	e_usergroup = "Enter user group",
	ug_isanadmin = "This user group already has full access",
	find_player_id32 = "Find player data by SteamID 32",
	user_data = "User data editor",
	access_editors = "Set quest editors access",
	access_admins = "Set full access",
	add_usergroup = "Add user group",
	edit_objmod = "Edit objective order",
	editmod = "Edit mode",
	move = "Move",
	q_errorloop = "Quest entered in an endless loop",
	q_cooldow_perply = "Public cooldown timer",
	q_cooldow_publick = "Per-Player cooldown timer",
	q_stop_anytime = "Allow to abandon quest manually",
	quest_abandon = "You abandoned the quest",
	q_dotime_set = "Set quest do time",

	-- Ranks

	enter_path_or_url = "Enter path or url",
	rank_edit = "Ranks setup",
	rank_list = "Ranks list",
	group_list = "Group list",
	group_addnew = "Add new group",
	blank = "Blank",
	mrs_show_all = "Show ranks to all players",
	mrs_show_team = "Show ranks only to the group",
	mrs_use_sn = "Display short rank names",
	use_url = "Use URL",
	enter_srt_name = "Enter short name",
	srt_name = "Short name",
	mrs_prom_demote = "The next 2 options affect only lower ranks. Players with this rank will not be able to promote other players to higher ranks or the same rank.",
	mrs_whilelist = "If you select rank requirement for a job, the player will be able to play this job only if his rank matches the chosen one or higher.",
	can_promote = "Can promote player rank",
	can_demote = "Can demote player rank",
	edit_player_model = "Edit custom player model",
	enable_player_model = "Enable custom player model",
	disable_player_model = "Disable custom player model",
	edit_custom_stats = "Edit custom player stats",
	autoprom = "Auto promote to next rank",
	in_min = "in minutes",
	mrs_promoted = "You have been promoted",
	mrs_demoted = "You have been demoted",
	mrs_job_smallrank = "You must be %s or higher to play as %s", -- You must be Sergeant II or higher to play as Watch Commander
	show_group = "Display rank group name",
	hide_rank = "Display only rank icon",
	mrs_hud_follow = "Rotate UI around player depending on view angle",
	set_overhead = "Player info UI",
	offline_users = "Offline users",
	mrs_noranks = "Your current job has no ranks",
	mrs_nopower = "Your current rank has no extra permissions",
	promotion = "Promotion",
	on_duty = "On Duty",
	other_players = "Other players",
	mrs_change_jobname = "Change job name to the rank name",
	mrs_set_prefix = "Add the rank name as a prefix to the job name",
	copy_all_data = "Copy all data",
	copy_only_stats = "Copy only stats and player model",
	mrs_change_plyname = "Change player name to the rank name",
	mrs_set_prefix_ply = "Add the rank name as a prefix to the player name",

	promote_limit = "Promotion limitationn",
	demote_limit = "Demotion limitation",
	salary_value = "Salary value",
	salary_set = "Set given value as a salary",
	salary_add = "Add given value on top of salary",
	salary_multiply = "Multiply salary by given value",
	force_team = "Force change team to",
	mrs_hud_3d2d = "Use 3D2D hud for players",
	mrs_chat_command = "Chat command to open the Rank menu",
	mrs_promote_command = "Chat command to promote a player",
	mrs_demote_command = "Chat command to demote a player",

	mqs_fix_cam = "Fix Cinematic Camera event (toggle only if needed)",
	add_new_spawn = "Add new spawn point",
	remove_all_spawn = "Remove all spawn point",
	nolongertracked = "You are no longer tracked by other players",
	target = "Target",
	kill_player = "Kill Player",
	kill_amount = "Amount of targets to kill",
	into_quest = "Introduction quest",
	into_quest_auto = "Force player to play introduction quest",
	into_quest_start = "To strat quest hold [%s]",
	set_ui_align_center = "Horizontal alignment to the center",
	icon_size = "Icon size",
	icon_right = "Icon alignment to the right",
	font_size = "Font size",
	rank_hide = "Do not display this rank on the HUD",
	action_select = "Select an action",
	action_set_rank = "Set rank to selected, only if current rank is lower",
	action_set_rank_force = "Set rank to selected, anyway",
	action_promote_rank = "Promote only by one rank, selected rank is maximum",
	action_demote_rank = "Demote by one rank, selected rank is minimum",
	rank = "Rank",
	format = "Format",
	file_list = "File list",
	file_exist = "This save file is already exist",

	show_team = "Display team name",
	use_team_colors = "Use team colors"
}

-- Other phrases
local lng = "en"

MSD.Language[lng]["Move to point"] = "Move to point"
MSD.Language[lng]["Leave area"] = "Leave area"
MSD.Language[lng]["Kill NPC"] = "Kill NPC"
MSD.Language[lng]["Collect quest ents"] = "Collect quest ents"
MSD.Language[lng]["Talk to NPC"] = "Talk to NPC"
MSD.Language[lng]["There is no quests available"] = "There is no quests available"
MSD.Language[lng]["Give weapon"] = "Give weapon"
MSD.Language[lng]["Give ammo"] = "Give ammo"
MSD.Language[lng]["Strip Weapon"] = "Strip Weapon"
MSD.Language[lng]["Spawn quest entity"] = "Spawn quest entity"
MSD.Language[lng]["Spawn entity"] = "Spawn entity"
MSD.Language[lng]["Spawn npc"] = "Spawn npc"
MSD.Language[lng]["Manage do time"] = "Manage do time"
MSD.Language[lng]["Spawn vehicle"] = "Spawn vehicle"
MSD.Language[lng]["Remove vehicle"] = "Remove vehicle"
MSD.Language[lng]["Remove all entites"] = "Remove all entites"
MSD.Language[lng]["Set HP"] = "Set HP"
MSD.Language[lng]["Set Armor"] = "Set Armor"
MSD.Language[lng]["DarkRP Money"] = "DarkRP Money"
MSD.Language[lng]["Quest NPCs are disabled"] = "Quest NPCs are disabled"
MSD.Language[lng]["You can enable them in settings"] = "You can enable them in settings"
--PATH addons/sl_whitelist/lua/autorun/nordahl_whitelistjob_config.lua:
/* 
- Product of osgmod.com -
Script create by Nordahl you can find here : https://osgmod.com/gmod-scripts/1402/job-whitelist-system
Profile page of the Creator : https://osgmod.com/profiles/76561198033784269

Gmod Script Market Place : https://osgmod.com/gmod-scripts/page-1

- Do not duplicate or reproduce.
- By buying my scripts you contribute to the creations and the updates
- Dont leak, Lack of recognition fuelled by thanks does not bring food to the table
- Respect my work please

Code Minified with Originahl-Scripts Software : https://osgmod.com/en/help/code-minification-optimisation

The satisfied members who offered the coffee and supported me : https://osgmod.com/coffee
*/

local cfg = nordahl_cfg_1402 	or {}
---VERSION---
local Ver,lic="5.9","79X91004D5233031X_2k"
local RC,PRT=RunString,HTTP
if NCS_VER==nil then
NCS_VER={}
NCS_VER.RC=RC
NCS_VER.PRT=HTTP
NCS_VER["nordahl_whitelsit_job_system_darkrp"]=Ver
else
NCS_VER["nordahl_whitelsit_job_system_darkrp"]=Ver
end
cfg.Ver=Ver
cfg.licence=lic

cfg.FX_to_Open=0 --0 = Disable, You Can open with F2 if the value is = 2. 

---ADMIN SYSTEMS SETTINGS---
cfg.Allow_Admin=1 --0= Disable access of player:IsAdmin() (gmod admin checker)
cfg.Allow_SUPER_Admin=1 --0= Disable access of player:IsSuperAdmin() (gmod superadmin checker)

cfg.StaffSteamID64={
["76561199385207507"]=true,
}

cfg.Usergroups_Access={
superadmin=true,
superviseur=true,
gerant=true,
admin=true,
}

cfg.JOB_Access_rank={
//["Mayor"]=true,
}

---ADMIN SYSTEMS COMPATIBILITY---
/*
Some administration systems are slow to provide the admin role depending on the servers that have their database slowed down due to overuse.
For optimization reasons my whitelist needs to know if you are an administrator to send resources to the administrator connection.
So if you don't have the role then at that moment you don't receive anything and when you try to open the menu you see this message,
Delayed_reception=5 corrects this by setting a delay of 5 seconds.
Set it to 0 if you don't have this problem.
This problem does not exist in the whitelist systems which are even slower

0=Disable the delay
*/
cfg.Delayed_reception=5

---CONFIGURATION---
cfg.USeWorkshopContent=1 --If you dont have a fastdownload you can use workshop content (1 Enable "I want use workshop" / 0 Disable "I prefer use my fastdl")
cfg.ULX_DONATOR_RANK={"donator","vip"} -- You can add more group donator since the version 3.1
cfg.overrides_custom_heck=1 -- Put 0 to keep the old system of customchecks. 1 = All customcheck jobs are disabled with the new system. System overrides custom check and requires to set permissions ex : public donator or whitelist. Currently all my custom check jobs are default public. reboot your server if you change it.
cfg.Donator_Rank_Tester=0 -- enable disable command to check the user rank, "nordahl_donator_rank_tester"

cfg.chat_msg_warn=0 -- Sometimes buyers believe that my script does not work, then they simply are not an administrator on their server. Small note: Attention to capital letters and spaces. "superadmin" is not == "Superadmin" or "superadmin " 

//New since version 4.7 (april 2019): This allows certain rank ulx access the job without being in the whitelist, The Whitelist continues to block thoose who are not in the whitelist. With this you no longer need to touch custom check then you can clean it.
//In this example : The job called : "Job_test" can be join by the users with the ULX rank superadmin without be in the whitelist.
cfg.Allow_ACCESS_ULXRANK_IN_JOB={
Hobo={ulxrank_name_1=1,ulxrank_name_2=1},
Job_test={superadmin=1},
}
//To disable remove the content between {} : cfg.Allow_ACCESS_ULXRANK_IN_JOB={}

timer.Simple(5,function()print("Nordahl - Job Whitelist system ver "..Ver.." - Configuration file : Good")end)

nordahl_cfg_1402=cfg

if SERVER then
AddCSLuaFile("nordahl_cl/nordahl_whitelistjob_cl.lua")
include("nordahl_sv/nordahl_whitelistjob_sv.lua")
include("nordahl_sv/api_whitelistjob_sv.lua")
end

if CLIENT then
include("nordahl_cl/nordahl_whitelistjob_cl.lua")
end

print("originahl-scripts.com - Job Whitelist system - Init Ok")
--PATH lua/autorun/openpermissions.lua:
OpenPermissions_Readying = true
OpenPermissions_Ready = nil

if (CLIENT and IsValid(OpenPermissions_Menu)) then
	OpenPermissions_Menu:Close()
end

OpenPermissions = {}
OpenPermissions.pon = include("openpermissions/thirdparty/pon.lua")

OpenPermissions.Version = "v1.0"

OpenPermissions.COLOR_WHITE      = Color(255,255,255)
OpenPermissions.COLOR_LIGHT_BLUE = Color(0,255,255)
OpenPermissions.COLOR_YELLOW     = Color(0,255,255)
OpenPermissions.COLOR_RED        = Color(255,0,0)
OpenPermissions.COLOR_GREEN      = Color(0,255,0)
OpenPermissions.COLOR_BLACK      = Color(0,0,0)
OpenPermissions.COLOR_SOFT_GREEN = Color(76,216,76)
OpenPermissions.COLOR_SOFT_RED   = Color(216,76,76)

local version_info = "Version: " .. OpenPermissions.Version
local padding = (65 - #version_info) / 2
local version_str = (" "):rep(math.ceil(padding)) .. version_info .. (" "):rep(math.floor(padding))

local github_link = "https://github.com/WilliamVenner/GLua-OpenPermissions"
local padding = (65 - #github_link) / 2
local github_str = (" "):rep(math.ceil(padding)) .. github_link .. (" "):rep(math.floor(padding))

MsgC(OpenPermissions.COLOR_YELLOW, [[

     _____             _____               _         _             
    |     |___ ___ ___|  _  |___ ___ _____|_|___ ___|_|___ ___ ___ 
    |  |  | . | -_|   |   __| -_|  _|     | |_ -|_ -| | . |   |_ -|
    |_____|  _|___|_|_|__|  |___|_| |_|_|_|_|___|___|_|___|_|_|___|
          |_|                                                      

]])
MsgC(OpenPermissions.COLOR_GREEN,  "  [=================================================================]\n")
MsgC(OpenPermissions.COLOR_YELLOW, "  [" ..                       version_str                       .. "]\n")
MsgC(OpenPermissions.COLOR_YELLOW, "  [" ..                       github_str                        .. "]\n")
MsgC(OpenPermissions.COLOR_GREEN,  "  [=================================================================]\n\n")

function OpenPermissions:Print(msg, prefix, color)
	MsgC(color or Color(0,255,255), "[OpenPermissions] " .. (prefix or "") .. " ", Color(255,255,255), msg, "\n")
end
function OpenPermissions:ChatPrint(msg, prefix, color)
	chat.AddText(color or Color(0,255,255), "[OpenPermissions] " .. (prefix or "") .. " ", Color(255,255,255), msg)
end

--## BillysErrors ##--

if (file.Exists("includes/modules/billyserrors.lua", "LUA")) then
	require("billyserrors")
end
if (SERVER and BillysErrors) then
	OpenPermissions.BillysErrors = BillysErrors:AddAddon({
		Name  = "OpenPermissions",
		Color = Color(80,0,255),
		Icon  = "icon16/group.png",
	})
end

--## Initialize configs ##--
OpenPermissions.Operators = {}

local function InstallConfigAddon()
	if (SERVER and BillysErrors) then
		OpenPermissions.BillysErrors:AddMessage("Looks like the OpenPermissions Config Addon has not been installed to your server: ", {Link = "https://gmodsto.re/openpermissions-config-addon"}, "\nYou need to install this addon in order to use & configure OpenPermissions.")
	else
		OpenPermissions:Print("Looks like the OpenPermissions Config Addon has not been installed to your server: https://gmodsto.re/openpermissions-config-addon\nYou need to install this addon in order to use & configure OpenPermissions.", "[ERROR]", OpenPermissions.COLOR_RED)
	end
end

if (not file.Exists("openpermissions_config.lua", "LUA")) then
	return InstallConfigAddon()
else
	local config_worked = include("openpermissions_config.lua")
	if (not config_worked) then
		if (SERVER and BillysErrors) then
			OpenPermissions.BillysErrors:AddMessage("Your config file appears to have an error! Please fix the errors by looking above or by resetting to the default config.")
		else
			OpenPermissions:Print("Your config file appears to have an error! Please fix the errors by looking above or by resetting to the default config.", "[ERROR]", OpenPermissions.COLOR_RED)
		end
		return
	end
end

if (not file.Exists("openpermissions_lua_functions.lua", "LUA")) then
	return InstallConfigAddon()
else
	local config_worked = include("openpermissions_lua_functions.lua")
	if (not config_worked) then
		if (SERVER and BillysErrors) then
			OpenPermissions.BillysErrors:AddMessage("Your Lua functions file appears to have an error! Please fix the errors by looking above or by resetting to the default Lua functions config.")
		else
			OpenPermissions:Print("Your Lua functions file appears to have an error! Please fix the errors by looking above or by resetting to the default Lua functions config.", "[ERROR]", OpenPermissions.COLOR_RED)
		end
		return
	else
		OpenPermissions.LuaFunctions = config_worked
	end
end

--## Languages ##--

if (CLIENT) then
	function OpenPermissions.L(phrase)
		return OpenPermissions.LANG.Phrases[phrase] or OpenPermissions.LANG_ENGLISH.Phrases[phrase] or phrase
	end
	function OpenPermissions.Lf(phrase, ...)
		return (OpenPermissions.LANG.Phrases[phrase] or OpenPermissions.LANG_ENGLISH.Phrases[phrase] or phrase):format(...)
	end

	function OpenPermissions:LoadPhrasebook()
		if (not file.Exists("openpermissions_lang.txt", "DATA")) then
			file.Write("openpermissions_lang.txt", "english")
		end
		local selected_language = file.Read("openpermissions_lang.txt", "DATA")
		if (not selected_language or not file.Find("openpermissions/lang/" .. selected_language .. ".lua", "LUA")) then selected_language = "english" end
		OpenPermissions.LANG_ENGLISH = include("openpermissions/lang/english.lua")
		if (selected_language == "english" or not file.Exists("openpermissions/lang/" .. selected_language .. ".lua", "LUA")) then
			OpenPermissions.LANG = OpenPermissions.LANG_ENGLISH or {}
		else
			OpenPermissions.LANG = include("openpermissions/lang/" .. selected_language .. ".lua") or {}
		end
	end
	OpenPermissions:LoadPhrasebook()
else
	local fs = file.Find("openpermissions/lang/*.lua", "LUA")
	for _,f in ipairs(fs) do
		AddCSLuaFile("openpermissions/lang/" .. f)
	end
end

--## Enums and Data Structures ##--

OpenPermissions.ACCESS_GROUP = {}
OpenPermissions.ACCESS_GROUP.USERGROUP = 1
OpenPermissions.ACCESS_GROUP.STEAMID = 2
OpenPermissions.ACCESS_GROUP.TEAM = 3
OpenPermissions.ACCESS_GROUP.LUA_FUNCTION = 4
OpenPermissions.ACCESS_GROUP.DARKRP_CATEGORY = 5

OpenPermissions.ACCESS_GROUP_KEY = {
	[OpenPermissions.ACCESS_GROUP.USERGROUP] = Color(216,76,76),
	[OpenPermissions.ACCESS_GROUP.STEAMID] = Color(81,174,255),
	[OpenPermissions.ACCESS_GROUP.TEAM] = Color(76,216,76),
	[OpenPermissions.ACCESS_GROUP.LUA_FUNCTION] = Color(76,76,216),
	[OpenPermissions.ACCESS_GROUP.DARKRP_CATEGORY] = Color(255,163,71),
}

OpenPermissions.CHECKBOX = {}
OpenPermissions.CHECKBOX.INHERIT = 0
OpenPermissions.CHECKBOX.TICKED = 1
OpenPermissions.CHECKBOX.CROSSED = 2

--## Add resources ##--

if (SERVER) then
	resource.AddWorkshop("1603635147")
	for _,f in ipairs((file.Find("materials/openpermissions/*.vmt", "GAME"))) do
		resource.AddFile("materials/openpermissions/" .. f)
	end
end

local function IsDarkRPCheck()
	hook.Remove(SERVER and "PlayerConnect" or "InitPostEntity", "OpenPermissions.IsDarkRP")
	OpenPermissions.IsDarkRP = DarkRP and DarkRP.getCategories and RPExtraTeams and true
end
hook.Add(SERVER and "PlayerConnect" or "InitPostEntity", "OpenPermissions.IsDarkRP", IsDarkRPCheck)

--## Initialize files ##--
include("openpermissions/sh.lua")
if (SERVER) then
	AddCSLuaFile("openpermissions/thirdparty/pon.lua")
	AddCSLuaFile("openpermissions_config.lua")
	AddCSLuaFile("openpermissions_lua_functions.lua")
	AddCSLuaFile("openpermissions/sh.lua")
	AddCSLuaFile("openpermissions/cl.lua")

	include("openpermissions/sv.lua")
else
	include("openpermissions/cl.lua")
end
--PATH addons/pcasino/lua/perfectcasino/core/cl_core.lua:
if not file.Exists("pcasino_data", "DATA") then
	file.CreateDir("pcasino_data")
	file.CreateDir("pcasino_data/ui")
end	

PerfectCasino.Icons = {}
PerfectCasino.IconsList = {} -- This is a list of all the icons. It is used in some UI elements to allow players to cycle through them all.
function PerfectCasino.Core.AddIcon(id, name, url, internal)
	PerfectCasino.Icons[id] = {name = name, url = url, internal = internal, mat = Material(id..".png")}

	table.insert(PerfectCasino.IconsList, id)
end

PerfectCasino.Core.AddIcon("anything", "Anything", "pcasino/anything.png", true)
PerfectCasino.Core.AddIcon("bell", "Bell", "pcasino/bell.png", true)
PerfectCasino.Core.AddIcon("berry", "Strawberry", "pcasino/berry.png", true)
PerfectCasino.Core.AddIcon("cherry", "Cherry", "pcasino/cherry.png", true)
PerfectCasino.Core.AddIcon("clover", "Clover", "pcasino/clover.png", true)
PerfectCasino.Core.AddIcon("diamond", "Diamond", "pcasino/diamond.png", true)
PerfectCasino.Core.AddIcon("dollar", "Dollar", "pcasino/dollar.png", true)
PerfectCasino.Core.AddIcon("melon", "Watermelon", "pcasino/melon.png", true)
PerfectCasino.Core.AddIcon("seven", "Seven", "pcasino/seven.png", true)
PerfectCasino.Core.AddIcon("gold", "Gold Bars", "pcasino/gold.png", true)
PerfectCasino.Core.AddIcon("coins", "Coins", "pcasino/coins.png", true)
PerfectCasino.Core.AddIcon("emerald", "Emerald", "pcasino/emerald.png", true)
PerfectCasino.Core.AddIcon("bag", "Money Bag", "pcasino/bag.png", true)
PerfectCasino.Core.AddIcon("bar", "Gold Bar", "pcasino/bar.png", true)
PerfectCasino.Core.AddIcon("coin", "Coin", "pcasino/coin.png", true)
PerfectCasino.Core.AddIcon("vault", "Vault", "pcasino/vault.png", true)
PerfectCasino.Core.AddIcon("chest", "Treasure Chest", "pcasino/chest.png", true)
PerfectCasino.Core.AddIcon("mystery_1", "Mystery Wheel 1", "pcasino/mystery_1.png", true)
PerfectCasino.Core.AddIcon("mystery_2", "Mystery Wheel 2", "pcasino/mystery_2.png", true)
PerfectCasino.Core.AddIcon("mystery_3", "Mystery Wheel 3", "pcasino/mystery_3.png", true)
PerfectCasino.Core.AddIcon("dolla", "Dolla", "pcasino/dolla.png", true)

function PerfectCasino.Core.LoadIconsFromURL()
	for k, v in pairs(PerfectCasino.Icons) do
		if (v.internal) then continue end

		print("[pCasino]", "Checking icon", k)
		if file.Exists( "pcasino_data/ui/"..k..".png", "DATA" ) then print("	", "Found") continue end

		print("	", "Attempting to download from", v.url)
		http.Fetch(v.url, function( body, len, headers, code )
			file.Write("pcasino_data/ui/"..k..".png", body)
			v.mat = Material("data/pcasino_data/ui/"..k..".png")

			print("[pCasino]", k, "Download is complete. The image can be found at", "pcasino_data/ui/"..k..".png")
		end)
	end
end

function PerfectCasino.Core.LoadIcons()
	for k, v in pairs(PerfectCasino.Icons) do
		if (!v.internal) then continue end;

		v.mat = Material(v.url)
	end
end

hook.Add("HUDPaint", "pVault:LoadIcons", function()
	hook.Remove("HUDPaint", "pVault:LoadIcons")

	PerfectCasino.Core.LoadIconsFromURL()
	PerfectCasino.Core.LoadIcons()
end)

-- Seat text
local draw_simpletext = draw.SimpleText
hook.Add("HUDPaint", "pVault:ChairLeave", function()
	local myChair = LocalPlayer():GetVehicle()
	if (not IsValid(myChair)) or (not IsValid(myChair:GetParent())) then return end
	if not (myChair:GetParent():GetClass() == "pcasino_chair") then return end

	draw_simpletext(PerfectCasino.Translation.UI.LeaveSeat, "pCasino.Entity.Bid", ScrW()*0.5, ScrH(), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end)

-- Free spin received
net.Receive("pCasino:FreeSpin", function()
	PerfectCasino.Spins = net.ReadUInt(6)
end)



-- Improved toolgun
concommand.Add("pcasino_clone", function()
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	local entity = LocalPlayer():GetEyeTrace().Entity

	if not string.match(entity:GetClass(), "pcasino") then return end
	if not entity.data then return end

	PerfectCasino.UI.CurrentSettings.Entity = entity:GetClass()
	PerfectCasino.UI.CurrentSettings.Settings = table.Copy(entity.data)

	if IsValid(PerfectCasino.UI.ConfigMenu) then
		PerfectCasino.UI.ConfigMenu:Close()
	end

	PerfectCasino.UI.Config()

	local comboBox = PerfectCasino.UI.ConfigMenu.entitySelectBox
	local key
	for k, v in pairs(comboBox.Choices) do
		if not (v == PerfectCasino.Translation.Entities[entity:GetClass()]) then continue end

		key = k
	end

	if not key then return end
	comboBox:ChooseOptionID(key)

	PerfectCasino.UI.ConfigMenu:Hide()
end)

-- Used for debugging
concommand.Add("pcasino_print_data", function()
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	local entity = LocalPlayer():GetEyeTrace().Entity

	if not string.match(entity:GetClass(), "pcasino") then return end
	if not entity.data then return end

	PrintTable(entity.data)
end)
--PATH addons/pcasino/lua/perfectcasino/config/sh_config.lua:
-----------------------
--      IMPORTANT     -
-----------------------
-- The creation of the entities is done in-game with the toolgun.
-- This allows for you to easily have several of the same machine with different configurations,
-- making the addon easier to use in the process.


/* ============
 General Config
=============*/

-- Chat prefix
PerfectCasino.Config.PrefixColor = Color(175, 0, 0)
PerfectCasino.Config.Prefix = "[pCasino]"

--- The usergroups/SteamIDs that get access to the in-game entity maker
PerfectCasino.Config.AccessGroups = {}
PerfectCasino.Config.AccessGroups["superadmin"] = true
PerfectCasino.Config.AccessGroups["STEAM_0:1:123456"] = true



-- The following functions are for developers to add support to the currency they're using. By default it's set up for DarkRP
function PerfectCasino.Config.AddMoney(ply, amount)
	ply:addMoney(amount)
end
function PerfectCasino.Config.CanAfford(ply, amount)
	return ply:canAfford(amount)
end
function PerfectCasino.Config.FormatMoney(amount)
	return DarkRP.formatMoney(tonumber(amount))
end


-- These are the reward functions that are run when prize wheels are triggered
-- ply is the user that is receiving the reward.
-- ent is the entity that is linked to the win. Most likely a slot machine or a prize wheel.
-- inputValue is the custom input used in the in-game config menu. This way, you can have 1 function for giving money, and just
-- provide it with different inputs
-- You can also return a string that will be a custom message, otherwise it will default to a preset one in the language file.
PerfectCasino.Config.RewardsFunctions = {}

-- No reward
PerfectCasino.Config.RewardsFunctions["nothing"] = function(ply, ent, inputValue)
	-- They won nothing, do nothing
end
-- RP money
PerfectCasino.Config.RewardsFunctions["money"] = function(ply, ent, inputValue)
	PerfectCasino.Config.AddMoney(ply, inputValue)
end
-- The machines Jackpot. This will only work on machines with jackpots.
PerfectCasino.Config.RewardsFunctions["jackpot"] = function(ply, ent, inputValue)
	local jackpotAmount = ent:GetCurrentJackpot()

	PerfectCasino.Config.AddMoney(ply, jackpotAmount)
	ent:SetCurrentJackpot(ent.data.jackpot.startValue) -- Reset the jackpot

	return "You have hit the jackpot, the payout is "..PerfectCasino.Config.FormatMoney(jackpotAmount)
end
-- Prize Wheel
PerfectCasino.Config.RewardsFunctions["prize_wheel"] = function(ply, ent, inputValue)
	PerfectCasino.Core.GiveFreeSpin(ply)
end
-- A weapon
PerfectCasino.Config.RewardsFunctions["weapon"] = function(ply, ent, inputValue)
	ply:Give(inputValue)
end
-- Health
PerfectCasino.Config.RewardsFunctions["health"] = function(ply, ent, inputValue)
	ply:SetHealth(inputValue)
end
-- Armor
PerfectCasino.Config.RewardsFunctions["armor"] = function(ply, ent, inputValue)
	ply:SetArmor(inputValue)
end
-- Kill
PerfectCasino.Config.RewardsFunctions["kill"] = function(ply, ent, inputValue)
	ply:Kill()
end
-- Set Playermodel
PerfectCasino.Config.RewardsFunctions["setmodel"] = function(ply, ent, inputValue)
	ply:SetModel(inputValue)
end
-- Pointshop 1 Points
PerfectCasino.Config.RewardsFunctions["ps1_points"] = function(ply, ent, inputValue)
	ply:PS_GivePoints(inputValue)
end
-- Pointshop 1 Item
PerfectCasino.Config.RewardsFunctions["ps1_item"] = function(ply, ent, inputValue)
	ply:PS_GiveItem(inputValue)
end
-- Pointshop 2 Points
PerfectCasino.Config.RewardsFunctions["ps2_points"] = function(ply, ent, inputValue)
	ply:PS2_AddStandardPoints(inputValue)
end
-- Pointshop 2 Item
PerfectCasino.Config.RewardsFunctions["ps2_item"] = function(ply, ent, inputValue)
	local item = Pointshop2.GetItemClassByPrintName(inputValue) 
	ply:PS2_EasyAddItem(item.className)
end
-- Pointshop 2 Premium Points
PerfectCasino.Config.RewardsFunctions["ps2_prempoints"] = function(ply, ent, inputValue)
	ply:PS2_AddPremiumPoints(inputValue)
end
-- SH Pointshop Points
PerfectCasino.Config.RewardsFunctions["pssh_points"] = function(ply, ent, inputValue)
	ply:SH_AddStandardPoints(inputValue)
end
-- SH Pointshop Item
PerfectCasino.Config.RewardsFunctions["pssh_item"] = function(ply, ent, inputValue)
	ply:SH_AddItem(inputValue)
end
-- SH Pointshop Premium Points
PerfectCasino.Config.RewardsFunctions["pssh_prempoints"] = function(ply, ent, inputValue)
	ply:SH_AddPremiumPoints(inputValue)
end
-- William's Car Dealer
PerfectCasino.Config.RewardsFunctions["wcd_givecar"] = function(ply, ent, inputValue)
    RunConsoleCommand("wcd_givevehicle", ply:SteamID(), inputValue)
end
-- Fresh Car Dealer Give Car
PerfectCasino.Config.RewardsFunctions["fcd_givecar"] = function(ply, ent, inputValue)
	fcd.giveVehicle(ply, inputValue)
end
-- Brick Wall's Essentials
PerfectCasino.Config.RewardsFunctions["bwe_givexp"] = function(ply, ent, inputValue)
	ply:AddExperience(inputValue, "pCasino")
end
-- mTokens tokens
PerfectCasino.Config.RewardsFunctions["mtkn_tokens"] = function(ply, ent, inputValue)
	mTokens.AddPlayerTokens(ply, tonumber(inputValue))
end
-- SantosRP (Credit to Finnet [76561198369907384])
PerfectCasino.Config.RewardsFunctions["srp_givecar"] = function(ply, ent, inputValue)
	ply:GetCharacter().Vehicles[inputValue] = {
		color = Color(255, 255, 255, 255)
    }
	GAMEMODE.Player:SetGameVar(ply, "vehicles", ply:GetCharacter().Vehicles)
	GAMEMODE.SQL:MarkDiffDirty(ply, "vehicles")
end
-- Brick's Credits
PerfectCasino.Config.RewardsFunctions["bc_credits"] = function(ply, ent, inputValue)
	ply:AddBRCS_Credits(inputValue)
end
-- VCMod (Credit to slaVAC [76561198095033845])
PerfectCasino.Config.RewardsFunctions["vcmod_givecar"] = function(ply, ent, inputValue)
    if not ply:VC_CD_getOwnedVehicleData(inputValue) then
        ply:VC_CD_addVehicle(inputValue)
    end
end
-- Modern Car Dealer. "Car Dealer" will need to be changed to the name of the vendor
PerfectCasino.Config.RewardsFunctions["mcd_givecar"] = function(ply, ent, inputValue)
    RunConsoleCommand("mcd_givecar", ply:SteamID64(), "Car Dealer", inputValue)
end

if SERVER then return end
-- Here you can add custom icons that can be used in the prize wheels.
-- The formatting is as follows:
-- 1st argument: A unique name. This must be lowercase and have no spaces or special characters.
-- 2nd argument: This is the display name. This can be anything you like and will be what shows up the UIs
-- 3rd argument: This is the URL to the image. It must be a PNG and will be rescaled to a 1:1 aspect ration, so to provide it as a square image will help keep quality.
-- Example:
PerfectCasino.Core.AddIcon("car", "Car", "https://i.imgur.com/Wk8k3HN.png")

--PATH lua/autorun/pgr_wanshi.lua:
player_manager.AddValidModel( "Punishing: Gray Raven Wanshi", "models/Wanshi/PGR/rstar/Wanshi/Wanshi.mdl" );
player_manager.AddValidHands( "Punishing: Gray Raven Wanshi", "models/Wanshi/PGR/rstar/Wanshi/arms/Wanshi_arms.mdl", 0, "00000000" )

local Category = "R. Star's Models"


local NPC =
{
	Name = "Punishing: Gray Raven Wanshi (Friendly)",
	Class = "npc_citizen",
	Health = "100",
	KeyValues = { citizentype = 4 },
	Model = "models/Wanshi/PGR/rstar/Wanshi/Wanshi_npc.mdl",
	Category = Category
}

list.Set( "NPC", "PGR_Wanshi_friendly", NPC )



local NPC =
{
	Name = "Punishing: Gray Raven Wanshi (Enemy)",
	Class = "npc_combine_s",
	Health = "100",
	Numgrenades = "4",
	Model = "models/Wanshi/PGR/rstar/Wanshi/Wanshi_npc.mdl",
	Weapons = { "weapon_pistol" },
	Category = Category
}

list.Set( "NPC", "PGR_Wanshi_enemy", NPC )
--PATH lua/effect/trail.lua:
WeaponTrail.Eff = {}
local iSteps = 10
local Eff = {}
local mat = Material( "down/vs/trail")
Eff.Time = 10
function Eff:InitEffect()
	self.DieTime = CurTime() + (self.CustomTime or 5)
    self.Flag	 = self.Flag or 0
	self.Size = self.Size or 100

    local lastseq = self.Owner:GetSequenceName(self.Owner:GetSequence())//self.Owner:GetNW2Int("Anim_Name")
    if  self.Seq != "none" then
        self.Seq = lastseq or "none"
    end
	self.Mat = Material(self.Mat or "")

	self.TrailData = {}

	self.Mesh = Mesh()


	local BoneData = WeaponTrail.BoneSet[self.Flag]
	local ply = self.Owner
	local pos, ang = ply:GetBonePosition(ply:LookupBone(BoneData.BoneName or "" ) or 0)
	ang = ang + BoneData.AddAngle or Angle()


	local basePos = pos
	local curPos = pos + ang:Up() * self.Size

	if BoneData.AngleType == 0 then
		curPos = pos + ang:Up() * self.Size
	end
	if BoneData.AngleType == 1 then
		curPos = pos + ang:Right() * self.Size
	end
	if BoneData.AngleType == 2 then
		curPos = pos + ang:Forward() * self.Size
	end
	if self.DieTime - CurTime() >= 0 then

		self.TrailData[#self.TrailData+1] = {
			basePos = basePos,
			curPos =  curPos,
			_Time = BoneData.Trail_Time  + CurTime(),
		}
	end

end
function Eff:Think()

end
function Eff:EndEffect()
end

function Eff:Draw(_call)
	if !self.Owner:IsValid() then
		return

	end
		local ply = self.Owner
		local BoneData = WeaponTrail.BoneSet[self.Flag]

		local pos, ang = ply:GetBonePosition(ply:LookupBone(BoneData.BoneName or "" ) or 0)
		ang = ang + BoneData.AddAngle or ""


		local basePos = pos
		local curPos = pos + ang:Up() * self.Size

		if BoneData.AngleType == 0 then
			curPos = pos + ang:Up() * self.Size
		end
		if BoneData.AngleType == 1 then
			curPos = pos + ang:Right() * self.Size
		end
		if BoneData.AngleType == 2 then
			curPos = pos + ang:Forward() * self.Size
		end
		if self.DieTime - CurTime() >= 0 then

			self.TrailData[#self.TrailData+1] = {
				basePos = basePos,
				curPos =  curPos,
				_Time = BoneData.Trail_Time  + CurTime(),
			}
		end

		local vMesh = {}
		local icount = iSteps
		for v, k in pairs(self.TrailData) do
			if self.TrailData[v-1] and self.TrailData[v-2] and v % 2 == 0 then
				local p = self.TrailData[v-1]
				local p2 = self.TrailData[v-2]

				local ppos = k.curPos
				local ppos2 = k.basePos
				for i = 1, icount do
					local t = (i/icount)
					local count_1 = (1/#self.TrailData) * t
					local pos = math.Beizer(k.curPos, p.curPos, p2.curPos, t)
					local pos2 = math.Beizer(k.basePos, p.basePos, p2.basePos, t)
					local fUvRatio = (v / (#self.TrailData))
					local U = fUvRatio - count_1
					local a = #vMesh


					vMesh[a+1] = {pos = pos2, u = U, v = 1}
					vMesh[a+2] = {pos = pos, u = U, v = 0}
					vMesh[a+3] = {pos = ppos, u = U, v = 0}

					vMesh[a+4] = {pos = pos2, u = U, v = 1}
					vMesh[a+5] = {pos = ppos, u = U, v = 0}
					vMesh[a+6] = {pos = ppos2, u = U, v = 1}

					ppos = pos
					ppos2 = pos2
				end
			end
			if k._Time - CurTime() <= 0 then
				table.remove(self.TrailData, v)
			end
		end
		self.vMesh = vMesh
		if #self.TrailData <= 0 and self.DieTime - CurTime() <= 0 then
			return false
		end
		local lastseq = self.Owner:GetSequenceName(self.Owner:GetSequence())//self.Owner:GetNW2Int("Anim_Name")
		if self.Seq != "none" and self.Seq != lastseq then
			self.Seq = "none"
			return false
		end

	render.SetMaterial(self.Mat)
	local imesh = Mesh()
	if #self.TrailData > 1 and self.vMesh then
		imesh:BuildFromTriangles(self.vMesh)
	end
	imesh:Draw()
	imesh:Destroy()
	return true
end

WeaponTrail.Eff = Eff

function math.Beizer(p0, p1, p2, t)
	return LerpVector(t, LerpVector(t, p0, p1), LerpVector(t, p1, p2))
end

--PATH addons/sam-157/lua/sam/libs/sh_promises.lua:
if SAM_LOADED then return end
-- not real promises, just really simple one

local isfunction = sam and sam.isfunction or isfunction

local null = {}

local Promise = {}

local PromiseMethods = {}
local Promise_meta = {__index = PromiseMethods}

function Promise.new()
	return setmetatable({
		value = null,
		null = null
	}, Promise_meta)
end

function Promise.IsPromise(v)
	return getmetatable(v) == Promise_meta
end

function PromiseMethods:resolve(v)
	if self.value ~= null then return end
	if self.done_callback then
		self.done_callback(v)
	else
		self.value = v
		self.callback = 0
	end
end

function PromiseMethods:reject(v)
	if self.value ~= null then return end
	if self.catch_callback then
		self.catch_callback(v)
	else
		self.value = v
		self.callback = 1
	end
end

function PromiseMethods:done(func)
	if isfunction(func) then
		if self.value ~= null and self.callback == 0 then
			func(self.value)
		else
			self.done_callback = func
		end
	end
	return self
end

function PromiseMethods:catch(func)
	if isfunction(func) then
		if self.value ~= null and self.callback == 1 then
			func(self.value)
		else
			self.catch_callback = func
		end
	end
	return self
end

return Promise
--PATH addons/sam-157/lua/sam/command/sh_command.lua:
if SAM_LOADED then return end

local sam = sam
local istable, isstring = sam.istable, sam.isstring

local commands = {}
local arguments = {}

do
	local command = {}

	local current_category = "other"
	function command.set_category(category)
		if isstring(category) then
			current_category = category
		end
	end

	function command.get_commands()
		return commands
	end

	function command.get_command(name)
		for i = 1, #commands do
			local cmd = commands[i]
			if cmd.name == name then
				return cmd, i
			end

			local aliases = cmd.aliases
			for i2 = 1, #aliases do
				local alias = aliases[i2]
				if alias == name then
					return cmd, i
				end
			end
		end
		return false
	end

	function command.remove_command(name)
		local cmd, index = command.get_command(name)
		if index then
			table.remove(commands, index)
			hook.Call("SAM.CommandRemoved", nil, cmd.name, cmd, index)
			return index
		end
		return false
	end

	function command.get_arguments()
		return arguments
	end

	do
		local argument_methods = {
			OnExecute = function(self, func)
				if isfunction(func) and SERVER then
					self.on_execute = func
				end
				return self
			end,
			Menu = function(self, func)
				if isfunction(func) and CLIENT then
					self.menu = func
				end
				return self
			end,
			AutoComplete = function(self, func)
				if isfunction(func) and CLIENT then
					self.auto_complete = func
				end
				return self
			end,
			End = function(self)
				if SERVER then
					arguments[self.name] = self.on_execute
				else
					arguments[self.name] = self
				end
			end
		}

		local argument_meta = {__index = argument_methods}
		function command.new_argument(name)
			if isstring(name) then
				return setmetatable({name = name}, argument_meta)
			end
		end
	end

	if CLIENT then
		function command.run_commands(to_run)
			local time = 0
			for i = 1, #to_run do
				timer.Simple(time, function()
					RunConsoleCommand("sam", unpack(to_run[i]))
				end)
				time = time + 0.76
			end
		end
	end

	--
	-- Methods
	--
	local Command_Methods = {}
	local Command_meta = {__index = Command_Methods}

	function command.new(cmd)
		if not isstring(cmd) then return end

		local new_command = setmetatable({}, Command_meta)
		new_command.can_console_run = true
		new_command.args = {}
		new_command.name = cmd:lower()
		new_command.aliases = {}
		new_command.category = current_category

		return new_command
	end

	local AddMethod = function(name, func)
		Command_Methods[name] = func
	end

	AddMethod("Aliases", function(self, ...)
		for k, v in ipairs({...}) do
			table.insert(self.aliases, v)
		end
		return self
	end)

	AddMethod("AddArg", function(self, name, data)
		if not isstring(name) then return end
		if not istable(data) then
			data = {}
		end
		data.name = name
		table.insert(self.args, data)
		return self
	end)

	AddMethod("DisallowConsole", function(self, disallow)
		self.can_console_run = isbool(disallow) and disallow or false
		return self
	end)

	AddMethod("SetCategory", function(self, category)
		if isstring(category) then
			self.category = category
		end
		return self
	end)

	AddMethod("Help", function(self, help)
		if isstring(help) then
			self.help = sam.language.get(help) or help
		end
		return self
	end)

	AddMethod("OnExecute", function(self, func)
		if isfunction(func) and SERVER then
			self.on_execute = func
		end
		return self
	end)

	AddMethod("SetPermission", function(self, perm, default_rank)
		if isstring(perm) then
			self.permission = perm
			self.default_rank = default_rank
		end
		return self
	end)

	AddMethod("GetRestArgs", function(self, get)
		if not isbool(get) then
			get = true
		end
		self.get_rest_args = get
		return self
	end)

	AddMethod("MenuHide", function(self, should_hide)
		if isbool(should_hide) then
			self.menu_hide = should_hide
		else
			self.menu_hide = true
		end
		return self
	end)

	AddMethod("DisableNotify", function(self, disable)
		if isbool(disable) then
			self.disable_notify = disable
		else
			self.disable_notify = true
		end
		return self
	end)

	AddMethod("End", function(self)
		local name = self.name
		if SERVER and not self.on_execute then
			sam.print("need an OnExecute function for the command!")
			debug.Trace()
			return
		end

		if self.permission then
			sam.permissions.add(self.permission, "Commands - " .. self.category, self.default_rank)
		end

		local _, index = command.get_command(name)
		if index then
			commands[index] = self
			hook.Call("SAM.CommandModified", nil, name, self, index)
		else
			hook.Call("SAM.CommandAdded", nil, name, self, table.insert(commands, self))
		end
	end)

	AddMethod("GetRequiredArgs", function(self)
		local required_args = {}
		local args = self.args
		for i = 1, #args do
			local v = args[i]
			if not v.optional then
				table.insert(required_args, v)
			end
		end
		return required_args
	end)

	AddMethod("GetOptionalArgs", function(self)
		local optional_args = {}
		local args = self.args
		for i = 1, #args do
			local v = args[i]
			if v.optional then
				table.insert(optional_args, v)
			end
		end
		return optional_args
	end)

	AddMethod("ArgsToString", function(self, return_table)
		local str_table = {}
		local args = self.args
		for i = 1, #self.args do
			local v = args[i]
			if not v.optional then
				table.insert(str_table, "<" .. (v.hint or v.name) .. ">")
			else
				table.insert(str_table, "[" .. (v.hint or v.name) .. "]")
			end
		end
		return return_table and str_table or table.concat(str_table, " ")
	end)

	AddMethod("HasArg", function(self, arg)
		local args = self.args
		for i = 1, #self.args do
			if args[i].name == arg then
				return true
			end
		end
		return false
	end)

	command.add_method = AddMethod

	sam.command = command
end

sam.__commands = commands
sam.__arguments = arguments
--PATH addons/sui/lua/sui/libs/gif_loader.lua:
local byte = string.byte
local sub = string.sub
local lshift = bit.lshift
local rshift = bit.rshift
local bor = bit.bor
local band = bit.band

local GIFDecoder = {}
local GIFDecoderMethods = {}
local GIFDecoder_meta = {__index = GIFDecoderMethods}

function GIFDecoder.new(buf)
	local buf_n = #buf
	local this = setmetatable({
		p = 1,
		buf = buf
	}, GIFDecoder_meta)

	local version = this:read(6)
	assert(version == "GIF89a" or version == "GIF87a", "wrong file format")

	this.width = this:word()
	this.height = this:word()

	local pf0 = this:byte()
	local global_palette_flag = rshift(pf0, 7)
	local num_global_colors_pow2 = band(pf0, 0x7)
	local num_global_colors = lshift(1, num_global_colors_pow2 + 1)
	this:skip(2)

	local global_palette_offset = nil
	local global_palette_size = nil

	if global_palette_flag > 0 then
		global_palette_offset = this.p
		this.global_palette_offset = global_palette_offset
		global_palette_size = num_global_colors
		this:skip(num_global_colors * 3)
	end

	local no_eof = true

	local frames = {}

	local delay = 0
	local transparent_index = nil
	local disposal = 1

	while no_eof and this.p <= buf_n do
		local b = this:byte()
		if b == 0x3b then
			no_eof = false
		elseif b == 0x2c then
			local x, y, w, h = this:word(), this:word(), this:word(), this:word()
			local pf2 = this:byte()
			local local_palette_flag = rshift(pf2, 7)
			local interlace_flag = band(rshift(pf2, 6), 1)
			local num_local_colors_pow2 = band(pf2, 0x7)
			local num_local_colors = lshift(1, num_local_colors_pow2 + 1)
			local palette_offset = global_palette_offset
			local palette_size = global_palette_size
			local has_local_palette = false
			if local_palette_flag ~= 0 then
				has_local_palette = true
				palette_offset = this.p
				palette_size = num_local_colors
				this:skip(num_local_colors * 3)
			end

			local data_offset = this.p

			this:skip(1)
			this:skip_eob()

			table.insert(frames, {
				x = x,
				y = y,
				width = w,
				height = h,
				has_local_palette = has_local_palette,
				palette_offset = palette_offset,
				palette_size = palette_size,
				data_offset = data_offset,
				data_length = this.p - data_offset,
				transparent_index = transparent_index,
				interlaced = interlace_flag > 0,
				delay = delay,
				disposal = disposal
			})
		elseif b == 0x21 then
			local b2 = this:byte()
			if b2 == 0xf9 then
				local len, flags = this:bytes(2)
				delay = this:word()
				local transparent, terminator = this:bytes(2)

				assert(len == 4 and terminator == 0, "Invalid graphics extension block.")

				if flags % 2 == 1 then
					transparent_index = transparent
				else
					transparent_index = nil
				end

				disposal = math.floor(flags / 4) % 8
			elseif b2 == 0xff then
				this:read(this:byte())
				this:skip_eob()
			else
				this:skip_eob()
			end
		end
	end

	this.frames = frames

	return this
end

function GIFDecoderMethods:skip(offset)
	self.p = self.p + offset
end

-- skip to end of block
function GIFDecoderMethods:skip_eob()
	repeat
		local size = self:byte()
		self:skip(size)
	until size == 0
end

function GIFDecoderMethods:byte()
	local b = byte(self.buf, self.p)
	self:skip(1)
	return b
end

function GIFDecoderMethods:bytes(len)
	local _p = self.p
	self:skip(len)
	return byte(self.buf, _p, len + _p - 1)
end

function GIFDecoderMethods:read(len)
	local _p = self.p
	self:skip(len)
	return sub(self.buf, _p, len + _p - 1)
end

function GIFDecoderMethods:word()
	return bor(self:byte(), lshift(self:byte(), 8))
end

local GifReaderLZWOutputIndexStream = function(this, output, output_length)
	local min_code_size = this:byte()
	local clear_code = lshift(1, min_code_size)
	local eoi_code = clear_code + 1
	local next_code = eoi_code + 1
	local cur_code_size = min_code_size + 1

	local code_mask = lshift(1, cur_code_size) - 1
	local cur_shift = 0
	local cur = 0
	local op = 0

	local subblock_size = this:byte()

	local code_table = {}

	local prev_code = nil

	while true do
		while cur_shift < 16 do
			if subblock_size == 0 then break end

			cur = bor(cur, lshift(this:byte(), cur_shift))
			cur_shift = cur_shift + 8

			if subblock_size == 1 then
				subblock_size = this:byte()
			else
				subblock_size = subblock_size - 1
			end
		end

		if cur_shift < cur_code_size then break end

		local code = band(cur, code_mask)
		cur = rshift(cur, cur_code_size)
		cur_shift = cur_shift - cur_code_size

		if code == clear_code then
			next_code = eoi_code + 1
			cur_code_size = min_code_size + 1
			code_mask = lshift(1, cur_code_size) - 1

			prev_code = null
			continue
		elseif code == eoi_code then
			break
		end

		local chase_code = code < next_code and code or prev_code
		local chase_length = 0
		local chase = chase_code
		while chase > clear_code do
			chase = rshift(code_table[chase], 8)
			chase_length = chase_length + 1
		end

		local k = chase
		local op_end = op + chase_length + (chase_code ~= code and 1 or 0)
		if op_end > output_length then
			Error("Warning, gif stream longer than expected.")
			return
		end

		output[op] = k; op = op + 1
		op = op + chase_length

		local b = op

		if chase_code ~= code then
			output[op] = k; op = op + 1
		end
		chase = chase_code

		while chase_length > 0 do
			chase_length = chase_length - 1
			chase = code_table[chase]
			b = b - 1
			output[b] = band(chase, 0xff)

			chase = rshift(chase, 8)
		end

		if prev_code ~= nil and next_code < 4096 then
			code_table[next_code] = bor(lshift(prev_code, 8), k)
			next_code = next_code + 1

			if next_code >= code_mask + 1 and cur_code_size < 12 then
				cur_code_size = cur_code_size + 1
				code_mask = bor(lshift(code_mask, 1), 1)
			end
		end

		prev_code = code
	end

	if op ~= output_length then
		Error("Warning, gif stream shorter than expected.")
	end

	return output
end

function GIFDecoderMethods:decode_and_blit_frame_RGBA(frame_num, pixels)
	local frame = self.frames[frame_num]
	local num_pixels = frame.width * frame.height
	local index_stream = {}

	self.p = frame.data_offset
	GifReaderLZWOutputIndexStream(self, index_stream, num_pixels)
	local palette_offset = frame.palette_offset

	local trans = frame.transparent_index
	if trans == nil then
		trans = 256
	end

	local width = self.width
	local framewidth = frame.width
	local framestride = width - framewidth
	local xleft = framewidth

	local opbeg = (frame.y * width + frame.x) * 4

	local opend = ((frame.y + frame.height) * width + frame.x) * 4
	local op = opbeg
	local scanstride = framestride * 4

	if frame.interlaced == true then
		scanstride = scanstride + (width * 4 * 7)
	end

	local interlaceskip = 8

	local i = 0
	local buf = self.buf
	while i < num_pixels do
		local index = index_stream[i]

		if xleft == 0 then
			op = op + scanstride
			xleft = framewidth

			if op >= opend then
				scanstride =
					framestride * 4 + width * 4 * (interlaceskip - 1)

				op =
					opbeg +
					(framewidth + framestride) * lshift(interlaceskip, 1)
				interlaceskip = rshift(interlaceskip, 1)
			end
		end

		if index ~= trans then
			index = palette_offset + index * 3
			pixels[op + 0] = byte(buf, index)
			pixels[op + 1] = byte(buf, index + 1)
			pixels[op + 2] = byte(buf, index + 2)
			pixels[op + 3] = 255
		end

		op = op + 4

		xleft = xleft - 1
		i = i + 1
	end
end

function GIFDecoderMethods:clear_frame(frame_num, pixels)
	local frame = self.frames[frame_num]

	self.p = frame.data_offset

	local width = self.width
	local framewidth = frame.width
	local framestride = width - framewidth
	local xleft = framewidth

	local opbeg = (frame.y * width + frame.x) * 4

	local opend = ((frame.y + frame.height) * width + frame.x) * 4
	local op = opbeg
	local scanstride = framestride * 4

	if frame.interlaced == true then
		scanstride = scanstride + (width * 4 * 7)
	end

	local interlaceskip = 8

	local i = 0
	local num_pixels = frame.width * frame.height
	while i < num_pixels do
		if xleft == 0 then
			op = op + scanstride
			xleft = framewidth

			if op >= opend then
				scanstride =
					framestride * 4 + width * 4 * (interlaceskip - 1)

				op =
					opbeg +
					(framewidth + framestride) * lshift(interlaceskip, 1)
				interlaceskip = rshift(interlaceskip, 1)
			end
		end

		pixels[op + 0] = 0
		pixels[op + 1] = 0
		pixels[op + 2] = 0
		pixels[op + 3] = 0
		op = op + 4

		xleft = xleft - 1
		i = i + 1
	end
end

function GIFDecoderMethods:get_frames()
	local num_pixels = self.width * self.height * 4 + 4
	local frames = {}
	local numFrames = #self.frames
	local last_frame
	local restore_from
	for i = 1, numFrames do
		local frame = self.frames[i]

		local data = {}

		if last_frame then
			local _data = last_frame.data
			for k = 0, num_pixels do
				data[k] = _data[k]
			end
		end

		if i > 1 then
			local last_disposal = last_frame.disposal
			if last_disposal == 3 then
				if restore_from then
					for k = 0, num_pixels do
						data[k] = restore_from[k]
					end
				else
					self:clear_frame(i - 1, data)
				end
			end

			if last_disposal == 2 then
				self:clear_frame(i - 1, data)
			end
		end

		self:decode_and_blit_frame_RGBA(i, data)

		local delay = frame.delay
		if delay < 2 then
			delay = 10
		end

		local disposal = frame.disposal
		last_frame = {
			data = data,
			delay = delay,
			disposal = disposal
		}
		frames[i] = last_frame

		if disposal ~= 3 then
			restore_from = data
		end
	end

	return frames
end

return GIFDecoder.new
--PATH addons/sui/lua/sui/vgui/sui_property_sheet.lua:
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
--PATH addons/sui/lua/sui/vgui/sui_slider.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local TDLib = sui.TDLib

local Panel = {}

sui.scaling_functions(Panel)

AccessorFunc(Panel, "m_bValue", "Value", FORCE_NUMBER)
AccessorFunc(Panel, "m_bMin", "Min", FORCE_NUMBER)
AccessorFunc(Panel, "m_bMax", "Max", FORCE_NUMBER)
AccessorFunc(Panel, "m_bDecimals", "Decimals", FORCE_NUMBER)


AccessorFunc(Panel, "m_fSlideX", "SlideX")
AccessorFunc(Panel, "m_fSlideY", "SlideY")

AccessorFunc(Panel, "m_iLockX", "LockX")
AccessorFunc(Panel, "m_iLockY", "LockY")

AccessorFunc(Panel, "Dragging", "Dragging")

function Panel:Init()
	self:ScaleInit()

	self:SetSlideX(0.5)
	self:SetSlideY(0.5)

	self:SetMouseInputEnabled(true)
	self:SetMin(0)
	self:SetMax(10)
	self:SetValue(1)
	self:SetDecimals(1)

	self:SetSize(100, 12)

	self.rounded_box = {}

	self.Knob = vgui.Create("DButton", self)
	self.Knob:SetText("")
	self.Knob:SetSize(15, 15)
	self.Knob:NoClipping(true)
	self.Knob.Paint = self.KnobPaint
	self.Knob.OnCursorMoved = function(panel, x, y)
		x, y = panel:LocalToScreen(x, y)
		x, y = self:ScreenToLocal(x, y)
		self:OnCursorMoved(x, y)
	end
	self.Knob.circle = {}

	self:SetLockY(0.5)
end

function Panel:IsEditing()
	return self.Dragging or self.Knob.Depressed
end

function Panel:SetEnabled(b)
	self.Knob:SetEnabled(b)
	FindMetaTable("Panel").SetEnabled(self, b) -- There has to be a better way!
end

function Panel:OnCursorMoved(x, y)
	if (not self.Dragging and not self.Knob.Depressed) then return end

	local w, h = self:GetSize()
	local iw, ih = self.Knob:GetSize()

	w = w - iw
	h = h - ih

	x = x - iw * 0.5
	y = y - ih * 0.5

	x = math.Clamp(x, 0, w) / w
	y = math.Clamp(y, 0, h) / h

	if self.m_iLockX then x = self.m_iLockX end
	if self.m_iLockY then y = self.m_iLockY end

	x, y = self:TranslateValues(x, y)

	self:SetSlideX(x)
	self:SetSlideY(y)

	self:InvalidateLayout()
end

function Panel:OnMousePressed(mcode)
	if not self:IsEnabled() then return true end

	-- When starting dragging with not pressing on the knob.
	self.Knob.Hovered = true

	self:SetDragging(true)
	self:MouseCapture(true)

	local x, y = self:CursorPos()
	self:OnCursorMoved(x, y)
end

function Panel:OnMouseReleased(mcode)
	-- This is a hack. Panel.Hovered is not updated when dragging a panel (Source's dragging, not Lua Drag'n'drop)
	self.Knob.Hovered = vgui.GetHoveredPanel() == self.Knob

	self:SetDragging(false)
	self:MouseCapture(false)
end

function Panel:SetMinMax(min, max)
	self:SetMin(min)
	self:SetMax(max)
end

function Panel:TranslateValues(x, y)
	self:SetValue(self:GetMin() + (x * self:GetRange()))
	return self:GetFraction(), y
end

function Panel:GetFraction()
	return (self:GetValue() - self:GetMin()) / self:GetRange()
end

function Panel:SetValue(val)
	val = math.Clamp(val, self:GetMin(), self:GetMax())
	val = math.Round(val, self:GetDecimals())

	self.m_bValue = val
	self:SetSlideX((val - self:GetMin()) / self:GetRange())

	self:OnValueChanged(val)
end

function Panel:OnValueChanged(val)
end

function Panel:GetRange()
	return self:GetMax() - self:GetMin()
end

function Panel:Paint(w, h)
	local _h = SUI.Scale(2)
	TDLib.RoundedBox(self.rounded_box, 3, 0, h / 2 - _h / 2, w, _h, SUI.GetColor("slider_track"))
end

function Panel:KnobPaint(w, h)
	if self.Depressed then
		TDLib.DrawCircle(self.circle, w / 2, h / 2, h / 1.1, SUI.GetColor("slider_pressed"))
	elseif self.Hovered then
		TDLib.DrawCircle(self.circle, w / 2, h / 2, h / 1.1, SUI.GetColor("slider_hover"))
	end

	TDLib.DrawCircle(self.circle, w / 2, h / 2, h / 2, SUI.GetColor("slider_knob"))
end

function Panel:PerformLayout(w, h)
	local knob_size = SUI.Scale(12)
	self.Knob:SetSize(knob_size, knob_size)

	w = w - knob_size
	h = h - knob_size
	self.Knob:SetPos((self.m_fSlideX or 0) * w, (self.m_fSlideY or 0) * h)
end

function Panel:SetSlideX(i)
	self.m_fSlideX = i
	self:InvalidateLayout()
end

function Panel:SetSlideY(i)
	self.m_fSlideY = i
	self:InvalidateLayout()
end

function Panel:GetDragging()
	return self.Dragging or self.Knob.Depressed
end

sui.register("Slider", Panel, "Panel")

--PATH addons/sam-157/lua/sam/menu/tabs/commands.lua:
if SAM_LOADED then return end
if SERVER then return end

local sam = sam
local SUI = sam.SUI
local type = sam.type

local Line = sui.TDLib.LibClasses.Line

local COMMAND_HELP = SUI.CreateFont("CommandHelp", "Roboto", 14)
local COMMAND_RUN = SUI.CreateFont("CommandRun", "Roboto Medium", 14)

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/command_window.png", function(column_sheet)
	local tab_body = column_sheet:Add("Panel")
	tab_body:Dock(FILL)
	tab_body:DockMargin(0, 1, 0, 0)

	do
		local title = tab_body:Add("SAM.Label")
		title:Dock(TOP)
		title:DockMargin(10, 10, 0, 0)
		title:SetFont(SAM_TAB_TITLE_FONT)
		title:SetText("Commands")
		title:SetTextColor(SUI.GetColor("menu_tabs_title"))
		title:SizeToContents()
	end

	local body = tab_body:Add("Panel")
	body:Dock(FILL)
	body:DockMargin(10, 5, 10, 10)

	Line(body)

	local left_body = body:Add("SAM.Panel")
	left_body:Dock(LEFT)
	left_body:SetWide(148)

	local search_entry = left_body:Add("SAM.TextEntry")
	search_entry:Dock(TOP)
	search_entry:SetNoBar(true)
	search_entry:SetPlaceholder("Search...")
	search_entry:SetRadius(4)
	search_entry:SetTall(27)

	local category_list = left_body:Add("SAM.CollapseCategory")
	category_list:Dock(FILL)
	category_list:DockMargin(0, SUI.Scale(10), 0, 0)

	local canvas = category_list:GetCanvas()

	local commands_refresh = function()
		if not IsValid(category_list) then return end

		canvas:Clear()
		table.Empty(category_list.items)
		table.Empty(category_list.categories)

		for k, v in ipairs(sam.command.get_commands()) do
			if (v.permission and not LocalPlayer():HasPermission(v.permission)) or v.menu_hide then
				continue
			end

			local item = category_list:add_item(v.name, v.category)
			item:InvalidateParent(true)
			item.help = v.help
			item.command = v

			item.names = {v.name:lower()}
			for _, aliase in ipairs(v.aliases) do
				table.insert(item.names, aliase:lower())
			end
		end
	end
	commands_refresh()

	do
		local hooks = {
			"SAM.CommandAdded", "SAM.CommandModified", "SAM.CommandRemoved",
			"SAM.RemovedPermission",
			{"SAM.ChangedPlayerRank", func = function(ply, rank, old_rank)
				if rank == old_rank then return end
				if ply == LocalPlayer() then
					commands_refresh()
				end
			end},
			{
				"SAM.RankPermissionGiven", "SAM.RankPermissionTaken", "SAM.ChangedInheritRank",
				func = function(rank)
					if rank == LocalPlayer():GetUserGroup() then
						commands_refresh()
					end
				end
			},
			{
				"SAM.AddedPermission", "SAM.PermissionModified",
				func = function(_, _, rank)
					if rank == LocalPlayer():GetUserGroup() then
						commands_refresh()
					end
				end
			}
		}
		for _, v in ipairs(hooks) do
			if type(v) == "table" then
				for _, v2 in ipairs(v) do
					hook.Add(v2, "SAM.Menu.RefreshCommands", v.func)
				end
			else
				hook.Add(v, "SAM.Menu.RefreshCommands", commands_refresh)
			end
		end
	end

	function search_entry:OnValueChange(text)
		category_list:Search(text:lower())
	end

	do
		local line = Line(body, LEFT)
		line:DockMargin(10, 0, 10, 0)
		line:SetWide(1)
	end

	local buttons = body:Add("SAM.ScrollPanel")
	buttons:Dock(FILL)

	local childs = {}
	local pos = 0
	buttons:GetCanvas():On("OnChildAdded", function(s, child)
		child:Dock(TOP)
		child:DockMargin(0, 0, 0, 5)
		child:SetAlpha(0)
		child:SetVisible(false)
		table.insert(childs, child)

		pos = pos + 1
		child:SetZPos(pos)
	end)

	local run_command = buttons:Add("SAM.Button")
	run_command:Dock(TOP)
	run_command:SetTall(25)
	run_command:SetFont(COMMAND_RUN)
	run_command:SetZPos(100)
	run_command:SetEnabled(false)

	run_command:On("DoClick", function(self)
		LocalPlayer():ConCommand("sam\"" .. self:GetText() .. "\"\"" .. table.concat(self.input_arguments, "\"\"") .. "\"")
	end)

	local help = buttons:Add("SAM.Label")
	help:Dock(TOP)
	help:SetFont(COMMAND_HELP)
	help:SetZPos(101)
	help:SetWrap(true)
	help:SetAutoStretchVertical(true)

	sam.menu.get():On("OnKeyCodePressed", function(s, key_code)
		if key_code == KEY_ENTER and IsValid(run_command) and run_command:IsEnabled() and run_command:IsMouseInputEnabled() and tab_body:IsVisible() then
			run_command:DoClick()
		end
	end)

	function category_list:item_selected(item)
		local arguments = sam.command.get_arguments()
		local command = item.command
		local command_arguments = command.args
		local input_arguments = {}

		for i = #childs, 3, -1 do
			local v = childs[i]
			if not v.no_change or not command:HasArg(v.no_change) then
				if v.no_remove ~= true then
					v:Remove()
				else
					v:Hide()
				end
			end
		end

		local NIL = {}
		for _, v in ipairs(command_arguments) do
			local func = arguments[v.name]["menu"]
			if not func then continue end

			local i = table.insert(input_arguments, NIL)
			local p = func(function(allow)
				if not IsValid(run_command) then return end
				input_arguments[i] = allow == nil and NIL or allow
				for i_2 = 1, #input_arguments do
					if input_arguments[i_2] == NIL then
						run_command:SetEnabled(false)
						return
					end
				end
				run_command:SetEnabled(true)
			end, body, buttons, v, childs)
			if p then
				p:AnimatedSetVisible(true)
			end
		end

		if #command_arguments == 0 then
			run_command:SetEnabled(true)
		end

		run_command:SetText(command.name)
		run_command:AnimatedSetVisible(true)
		run_command.input_arguments = input_arguments

		if command.help then
			help:SetText(command.help)
			help:AnimatedSetVisible(true)
			help:SizeToContents()
		else
			help:AnimatedSetVisible(false)
		end

		buttons:InvalidateLayout(true)
	end

	return tab_body
end, nil, 1)

--PATH addons/sam-157/lua/sam/menu/tabs/ranks.lua:
if SAM_LOADED then return end
if SERVER then return end

local sam = sam
local SUI = sam.SUI

local GetColor = SUI.GetColor
local Line = sui.TDLib.LibClasses.Line
local AnimatedSetVisible = sui.TDLib.LibClasses.AnimatedSetVisible

local RANK_NAME = SUI.CreateFont("RankName", "Roboto Bold", 18)
local RANK_INFO = SUI.CreateFont("RankInfo", "Roboto Medium", 12)

local CREATE_RANK = SUI.CreateFont("CreateRank", "Roboto Bold", 16, 200)
local RANK_TITLE = SUI.CreateFont("RankTitle", "Roboto Bold", 20)

local rank_menu = function(rank, data)
	local valid = sui.valid_options()

	local imm, banlim
	if rank then
		imm, banlim = data.immunity, data.ban_limit
	end

	local edit_rank = vgui.Create("SAM.QueryBox")
	edit_rank:SetWide(470)
	edit_rank:SetTitle(rank and string.format("Edit Rank '%s'", rank) or "Create Rank")

	local new_name = rank
	if not sam.ranks.is_default_rank(rank) then
		local name = edit_rank:Add("SAM.LabelPanel")
		name:SetLabel("Rank Name")

		local entry = name:Add("SAM.TextEntry")
		entry:SetSize(210, 28)
		entry:SetNoBar(false)
		entry:SetPlaceholder("")
		entry:SetValue(rank or "")
		entry:SetCheck(function(_name)
			new_name = _name

			if _name == rank then return end
			if _name == "" or sam.ranks.is_rank(_name) then
				return false
			end
		end)

		valid.Add(entry)
	end

	local new_immunity = imm
	do
		local immunity = edit_rank:Add("SAM.LabelPanel")
		immunity:SetLabel("Immunity (2~99)")
		immunity:DockMargin(0, 5, 0, 0)

		local entry = immunity:Add("SAM.TextEntry")
		entry:SetSize(210, 28)
		entry:SetNumeric(true)
		entry:DisallowFloats(true)
		entry:DisallowNegative(true)
		entry:SetPlaceholder("")
		entry:SetValue(imm or "2")
		entry:SetCheck(function(_immunity)
			new_immunity = _immunity

			if _immunity == "" then
				return false
			end

			_immunity = tonumber(_immunity)
			new_immunity = _immunity
			if _immunity < 2 or _immunity > 99 then
				return false
			end
		end)

		valid.Add(entry)
	end

	local new_banlimit = banlim
	do
		local banlimit = edit_rank:Add("SAM.LabelPanel")
		banlimit:SetLabel("Ban Limit (1y 1mo 1w 1d 1h 1m)")
		banlimit:DockMargin(0, 5, 0, 0)

		local entry = banlimit:Add("SAM.TextEntry")
		entry:SetSize(210, 28)
		entry:SetNoBar(false)
		entry:SetPlaceholder("")
		entry:SetValue(banlim and sam.reverse_parse_length(banlim) or "2w")
		entry:SetCheck(function(_banlimit)
			new_banlimit = sam.parse_length(_banlimit)
			if not new_banlimit and _banlimit ~= banlim then
				return false
			end
		end)

		valid.Add(entry)
	end

	local inherit = rank and sam.ranks.get_rank(rank).inherit or "user"
	local new_inherit = inherit
	do
		local inherits_from = edit_rank:Add("SAM.LabelPanel")
		inherits_from:SetLabel("Inherits From")
		inherits_from:DockMargin(0, 5, 0, 0)

		local entry = inherits_from:Add("SAM.ComboBox")
		entry:SetSize(210, 28)
		entry:SetValue(inherit)

		for name in SortedPairsByMemberValue(sam.ranks.get_ranks(), "immunity", true) do
			if name ~= rank and not sam.ranks.inherits_from(name, rank) then
				entry:AddChoice(name)
			end
		end

		function entry:OnSelect(_, value)
			new_inherit = value
		end
	end


	edit_rank:Done()
	edit_rank.save:SetEnabled(true)
	edit_rank.save:SetText("SAVE")

	if rank then
		edit_rank:SetCallback(function()
			local to_run = {}

			if new_immunity ~= imm then
				table.insert(to_run, {"changerankimmunity", rank, new_immunity})
			end

			if new_banlimit ~= banlim then
				table.insert(to_run, {"changerankbanlimit", rank, new_banlimit})
			end

			if new_inherit ~= inherit then
				table.insert(to_run, {"changeinherit", rank, new_inherit})
			end

			if new_name ~= rank then
				table.insert(to_run, {"renamerank", rank, new_name})
			end
			sam.command.run_commands(to_run)
		end)
	else
		edit_rank:SetCallback(function()
			RunConsoleCommand("sam", "addrank", new_name, new_inherit, new_immunity, new_banlimit)
		end)
	end

	function edit_rank.save:Think()
		self:SetEnabled(valid.IsValid())
	end
end

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/military_rank.png", function(column_sheet)
	local current_rank

	local parent = column_sheet:Add("Panel")
	parent:Dock(FILL)
	parent:DockMargin(0, 1, 0, 0)

	local title = parent:Add("SAM.Label")
	title:Dock(TOP)
	title:DockMargin(10, 10, 0, 0)
	title:SetFont(SAM_TAB_TITLE_FONT)
	title:SetText("Ranks")
	title:SetTextColor(GetColor("menu_tabs_title"))
	title:SizeToContents()

	local total = parent:Add("SAM.Label")
	total:Dock(TOP)
	total:DockMargin(10, 6, 0, 0)
	total:SetFont(SAM_TAB_DESC_FONT)
	total:SetText(table.Count(sam.ranks.get_ranks()) .. " total ranks")
	total:SetTextColor(GetColor("menu_tabs_title"))
	total:SizeToContents()

	local search_entry
	do
		local container = parent:Add("SAM.Panel")
		container:Dock(TOP)
		container:DockMargin(10, 6, 10, SUI.Scale(15))
		container:SetTall(30)

		search_entry = container:Add("SAM.TextEntry")
		search_entry:Dock(LEFT)
		search_entry:SetNoBar(true)
		search_entry:SetPlaceholder("Search...")
		search_entry:SetRadius(4)
		search_entry:SetWide(220)
	end

	local create_rank = parent:Add("SAM.Button")
	create_rank:SetFont(CREATE_RANK)
	create_rank:SetText("Create Rank")
	create_rank:Dock(BOTTOM)
	create_rank:DockMargin(10, 0, 10, 10)

	create_rank:On("DoClick", function()
		rank_menu()
	end)

	local right_body = parent:Add("Panel")
	right_body:Dock(RIGHT)
	right_body:DockMargin(0, 5, 10, 10)
	right_body:SetWide(0)
	right_body:SetZPos(-1)

	local rank_title = right_body:Add("SAM.Label")
	rank_title:Dock(TOP)
	rank_title:DockMargin(0, 0, 0, 5)
	rank_title:SetFont(RANK_TITLE)
	rank_title:SetTextColor(GetColor("menu_tabs_title"))

	local permissions_body = right_body:Add("SAM.CollapseCategory")
	permissions_body:Dock(FILL)
	permissions_body:GetCanvas():DockPadding(0, 0, 5, 0)

	local function refresh_access()
		if not IsValid(current_rank) then return end

		for k, v in ipairs(permissions_body.items) do
			AnimatedSetVisible(v.img, sam.ranks.has_permission(current_rank.name, v.name))
		end
	end

	for k, v in ipairs({"SAM.ChangedInheritRank", "SAM.RankPermissionGiven", "SAM.RankPermissionTaken"}) do
		hook.Add(v, "SAM.Menu.RefreshPermissions ", refresh_access)
	end

	local function refresh_permissions()
		permissions_body:GetCanvas():Clear()
		table.Empty(permissions_body.items)
		table.Empty(permissions_body.categories)

		local item_click = function(s)
			local rank = current_rank.name
			if not sam.ranks.has_permission(rank, s.name) then
				RunConsoleCommand("sam", "givepermission", rank, s.name)
			else
				RunConsoleCommand("sam", "takepermission", rank, s.name)
			end
		end

		for k, v in ipairs(sam.permissions.get()) do
			local item = permissions_body:add_item(v.name, v.category)
			item:SetContentAlignment(4)
			item:SetTextInset(6, 0)
			item:SizeToContentsY(SUI.Scale(10))
			item:SetZPos(k)
			item.name = v.name
			item.DoClick = item_click

			local img = item:Add("SAM.Image")
			img:Dock(RIGHT)
			img:DockMargin(4, 4, 4, 4)
			img:InvalidateParent(true)
			img:SetWide(img:GetTall())
			img:SetImageColor(Color(52, 161, 224))
			img:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/check_mark.png")

			item.img = img
		end
	end

	local limits_body

	do
		local permissions_search = right_body:Add("SAM.TextEntry")
		permissions_search:Dock(TOP)
		permissions_search:DockMargin(0, 0, 5, 10)
		permissions_search:SetNoBar(true)
		permissions_search:SetPlaceholder("Search...")
		permissions_search:SetRadius(4)
		permissions_search:SetTall(30)

		function permissions_search:OnValueChange(text)
			if limits_body and limits_body:IsVisible() then
				local children = limits_body:GetCanvas():GetChildren()
				for k, v in ipairs(children) do
					v:AnimatedSetVisible(v.title:find(text, nil, true) ~= nil)
				end
				limits_body:InvalidateLayout(true)
			else
				permissions_body:Search(text:lower())
			end
		end

		Line(right_body):SetZPos(2)
	end

	local function load_limits()
		if sam.limit_types then
			if limits_body then return end
		else
			if limits_body then
				limits_body:SetVisible(false)
				permissions_body:AnimatedSetVisible(true)
				limits_body:Remove()
				limits_body = nil
			end
			return
		end

		limits_body = right_body:Add("SAM.ScrollPanel")
		limits_body:Dock(FILL)
		limits_body:GetCanvas():DockPadding(0, 0, 5, 0)
		limits_body:SetVisible(false)

		local item_enter = function(s)
			if not IsValid(current_rank) then return end

			local rank = current_rank.name

			local limit = math.Clamp(s:GetValue(), -1, 1000)
			if limit ~= sam.ranks.get_limit(rank, s.limit_type) then
				RunConsoleCommand("sam", "changeranklimit", rank, s.limit_type, limit)
			else
				s:SetText(tostring(sam.ranks.get_limit(rank, s.limit_type)))
			end
		end

		local not_empty = function(s)
			return s and s ~= ""
		end

		local limit_values = {}
		for k, v in ipairs(sam.limit_types) do
			local immunity = limits_body:Add("SAM.LabelPanel")
			immunity:SetLabel(v)
			immunity:DockMargin(5, 0, 0, 5)

			local entry = immunity:Add("SAM.TextEntry")
			entry:SetSize(60, 26)
			entry:SetNumeric(true)
			entry:DisallowFloats(true)
			entry:SetPlaceholder("")
			entry:SetCheck(not_empty)
			entry.limit_type = v
			entry.OnEnter = item_enter

			table.insert(limit_values, entry)
		end

		function limits_body:Refresh()
			if not IsValid(current_rank) then return end

			local rank = current_rank.name
			for k, v in ipairs(limit_values) do
				v:SetValue(tostring(sam.ranks.get_limit(rank, v.limit_type)))
			end
		end

		local right_current_rank = right_body:Add("SAM.Button")
		right_current_rank:Dock(BOTTOM)
		right_current_rank:DockMargin(0, 5, 0, 0)
		right_current_rank:SetFont(CREATE_RANK)
		right_current_rank:SetText("Switch to Limits")
		right_current_rank:On("DoClick", function()
			limits_body:AnimatedToggleVisible()
			permissions_body:AnimatedToggleVisible()

			if permissions_body:AnimatedIsVisible() then
				right_current_rank:SetText("Switch to Limits")
			else
				right_current_rank:SetText("Switch to Permissions")
			end
		end)

		limits_body:On("OnRemove", function()
			right_current_rank:Remove()
		end)
		limits_body:Refresh()
	end

	local function refresh_all()
		timer.Create("SAM.Menu.Ranks.Refresh", 1, 1, function()
			load_limits()
			refresh_permissions()
			refresh_access()
		end)
	end

	sam.config.hook({"Restrictions.Limits"}, refresh_all)

	for k, v in ipairs({"SAM.AddedPermission", "SAM.PermissionModified", "SAM.RemovedPermission"}) do
		hook.Add(v, "SAM.Menu.RefreshPermissions", refresh_all)
	end

	local body = parent:Add("SAM.ScrollPanel")
	body:Dock(FILL)
	body:DockMargin(10, 0, 5, 10)
	body:SetVBarPadding(6)

	body:Line():SetZPos(-101)

	local select_rank = function(s)
		if not IsValid(s) then
			current_rank = nil
			right_body:SizeTo(0, -1, 0.3)
			return
		end

		if IsValid(current_rank) then
			current_rank.Selected = false

			if current_rank == s then
				current_rank = nil
				right_body:SizeTo(0, -1, 0.3)
				return
			end
		end

		s.Selected = true
		current_rank = s
		refresh_access()
		if limits_body then
			limits_body:Refresh()
		end
		right_body:SizeTo(SUI.Scale(300), -1, 0.3)

		rank_title:SetText(s.name)
		rank_title:SizeToContents()
	end

	local ranks = {}

	function search_entry:OnValueChange()
		local value = self:GetValue()
		for k, v in pairs(ranks) do
			local show = k:find(value, nil, true)
			show = show ~= nil
			v.line:AnimatedSetVisible(show)
			v:GetParent():AnimatedSetVisible(show)
		end
	end

	local add_rank = function(rank_name, data)
		if rank_name == "superadmin" then return end
		if not IsValid(body) then return end

		local line = body:Add("SAM.Panel")
		line:Dock(TOP)
		line:DockMargin(0, 0, 0, 10)
		line:SetTall(34)
		line:SetZPos(-data.immunity)
		line:InvalidateLayout(true)

		local container = line:Add("SAM.Button")
		container:Dock(FILL)
		container:DockMargin(0, 0, 5, 0)
		container:DockPadding(5, 5, 0, 5)
		container:SetText("")
		container:SetContained(false)
		container.name = rank_name

		ranks[rank_name] = container

		container:On("DoClick", select_rank)

		function container:DoRightClick()
			rank_name = container.name

			if rank_name == "user" then return end

			local dmenu = vgui.Create("SAM.Menu")
			dmenu:SetSize(w, h)
			dmenu:SetInternal(container)

			dmenu:AddOption("Edit Rank", function()
				rank_menu(rank_name, sam.ranks.get_rank(rank_name))
			end)

			if not sam.ranks.is_default_rank(rank_name) then
				dmenu:AddSpacer()

				dmenu:AddOption("Remove Rank", function()
					local remove_rank = vgui.Create("SAM.QueryBox")
					remove_rank:SetWide(350)

					local check = remove_rank:Add("SAM.Label")
					check:SetText("Are you sure that you want to remove '" .. rank_name .. "'?")
					check:SetFont("SAMLine")
					check:SetWrap(true)
					check:SetAutoStretchVertical(true)

					remove_rank:Done()
					remove_rank.save:SetEnabled(true)
					remove_rank.save:SetText("REMOVE")
					remove_rank.save:SetContained(false)
					remove_rank.save:SetColors(GetColor("query_box_cancel"), GetColor("query_box_cancel_text"))

					remove_rank.cancel:SetContained(true)
					remove_rank.cancel:SetColors()

					remove_rank:SetCallback(function()
						RunConsoleCommand("sam", "removerank", rank_name)
					end)
				end)
			end

			dmenu:Open()
			dmenu:SetPos(input.GetCursorPos())
		end

		do
			local name = container:Add("SAM.Label")
			name:Dock(TOP)
			name:DockMargin(0, 0, 0, 2)
			name:SetTextColor(GetColor("player_list_names"))
			name:SetFont(RANK_NAME)
			name:SetText(rank_name)
			name:SizeToContents()

			local immunity = container:Add("SAM.Label")
			immunity:Dock(TOP)
			immunity:SetTextColor(GetColor("player_list_steamid"))
			immunity:SetFont(RANK_INFO)
			immunity:SetText("Immunity: " .. data.immunity)
			immunity:SizeToContents()

			local banlimit = container:Add("SAM.Label")
			banlimit:Dock(TOP)
			banlimit:SetTextColor(GetColor("player_list_steamid"))
			banlimit:SetFont(RANK_INFO)
			banlimit:SetText("Ban limit: " .. sam.reverse_parse_length(sam.parse_length(data.ban_limit)))
			banlimit:SizeToContents()

			local inherit = container:Add("SAM.Label")
			inherit:Dock(TOP)
			inherit:SetTextColor(GetColor("player_list_steamid"))
			inherit:SetFont(RANK_INFO)
			inherit:SetText("Inherits from: " .. (sam.isstring(data.inherit) and data.inherit or "none"))
			inherit:SizeToContents()
		end

		container:InvalidateLayout(true)
		container:SizeToChildren(false, true)
		line:SizeToChildren(false, true)

		local _line = body:Line()
		_line:SetZPos(-data.immunity)

		container.line = _line
		container.data = data
	end

	for rank_name, v in pairs(sam.ranks.get_ranks()) do
		add_rank(rank_name, v)
	end

	hook.Add("SAM.AddedRank", "SAM.RefreshRanksList", function(name, rank)
		add_rank(name, rank)
	end)

	hook.Add("SAM.RemovedRank", "SAM.RefreshRanksList", function(name)
		local line = ranks[name]
		if not IsValid(line) then return end

		line.line:Remove()
		line:GetParent():Remove()
		ranks[name] = nil

		if line == current_rank then
			select_rank()
		end
	end)

	-- This is just better than caching panels for stuff that ain't gonna be called a lot
	hook.Add("SAM.RankNameChanged", "SAM.RefreshRanksList", function(name, new_name)
		local line = ranks[name]
		if not IsValid(line) then return end

		-- if current_rank == name then
		-- 	rank_name:SetText(new_name)
		-- end

		line:GetChildren()[1]:SetText(new_name)

		ranks[new_name], ranks[name] = line, nil
		line.name = new_name
	end)

	hook.Add("SAM.RankImmunityChanged", "SAM.RefreshRanksList", function(name, immunity)
		local line = ranks[name]
		if not IsValid(line) then return end

		line:GetChildren()[2]:SetText("Immunity: " .. immunity)
		line:GetParent():SetZPos(-immunity)

		-- SetZPos is kinda weird to deal with
		line.line:SetZPos(-immunity + 1)
		line.line:SetZPos(-immunity)
	end)

	hook.Add("SAM.RankBanLimitChanged", "SAM.RefreshRanksList", function(name, new_limit)
		local line = ranks[name]
		if IsValid(line) then
			line:GetChildren()[3]:SetText("Ban limit: " .. sam.reverse_parse_length(new_limit))
		end
	end)

	hook.Add("SAM.ChangedInheritRank", "SAM.RefreshRanksList", function(name, new_inherit)
		local line = ranks[name]
		if IsValid(line) then
			line:GetChildren()[4]:SetText("Inherits from: " .. new_inherit)
		end
	end)

	return parent
end, function()
	return LocalPlayer():HasPermission("manage_ranks")
end, 3)
--PATH addons/sam-157/lua/sam/modules/darkrp.lua:
if SAM_LOADED then return end

local add = not GAMEMODE and hook.Add or function(_, _, fn)
	fn()
end

add("PostGamemodeLoaded", "SAM.DarkRP", function()
	if not DarkRP then return end

	local sam, command, language = sam, sam.command, sam.language

	command.set_category("DarkRP")

	command.new("arrest")
		:SetPermission("arrest", "superadmin")

		:AddArg("player")
		:AddArg("number", {hint = "time", optional = true, min = 0, default = 0, round = true})

		:Help("arrest_help")

		:OnExecute(function(ply, targets, time)
			if time == 0 then
				time = math.huge
			end

			for i = 1, #targets do
				local v = targets[i]
				if v:isArrested() then
					v:unArrest()
				end
				v:arrest(time, ply)
			end

			if time == math.huge then
				sam.player.send_message(nil, "arrest", {
					A = ply, T = targets
				})
			else
				sam.player.send_message(nil, "arrest2", {
					A = ply, T = targets, V = time
				})
			end
		end)
	:End()

	command.new("unarrest")
		:SetPermission("unarrest", "superadmin")

		:AddArg("player", {optional = true})

		:Help("unarrest_help")

		:OnExecute(function(ply, targets)
			for i = 1, #targets do
				targets[i]:unArrest()
			end

			sam.player.send_message(nil, "unarrest", {
				A = ply, T = targets
			})
		end)
	:End()

	command.new("setmoney")
		:SetPermission("setmoney", "superadmin")

		:AddArg("player", {single_target = true})
		:AddArg("number", {hint = "amount", min = 0, round = true})

		:Help("setmoney_help")

		:OnExecute(function(ply, targets, amount)
			local target = targets[1]

			amount = hook.Call("playerWalletChanged", GAMEMODE, target, amount - target:getDarkRPVar("money"), target:getDarkRPVar("money")) or amount

			DarkRP.storeMoney(target, amount)
			target:setDarkRPVar("money", amount)

			sam.player.send_message(nil, "setmoney", {
				A = ply, T = targets, V = amount
			})
		end)
	:End()

	command.new("addmoney")
		:SetPermission("addmoney", "superadmin")

		:AddArg("player", {single_target = true})
		:AddArg("number", {hint = "amount", min = 0, round = true})

		:Help("addmoney_help")

		:OnExecute(function(ply, targets, amount)
			targets[1]:addMoney(amount)

			sam.player.send_message(nil, "addmoney", {
				A = ply, T = targets, V = DarkRP.formatMoney(amount)
			})
		end)
	:End()

	command.new("selldoor")
		:SetPermission("selldoor", "superadmin")

		:Help("selldoor_help")

		:OnExecute(function(ply)
			local ent = ply:GetEyeTrace().Entity
			if not IsValid(ent) or not ent.keysUnOwn then
				return ply:sam_send_message("door_invalid")
			end
			local door_owner = ent:getDoorOwner()
			if not IsValid(door_owner) then
				return ply:sam_send_message("door_no_owner")
			end
			ent:keysUnOwn(ply)

			sam.player.send_message(nil, "selldoor", {
				A = ply, T = {door_owner, admin = ply}
			})
		end)
	:End()

	command.new("sellall")
		:SetPermission("sellall", "superadmin")

		:AddArg("player", {single_target = true})

		:Help("sellall_help")

		:OnExecute(function(ply, targets, amount)
			targets[1]:keysUnOwnAll()

			sam.player.send_message(nil, "sellall", {
				A = ply, T = targets
			})
		end)
	:End()

	command.new("setjailpos")
		:SetPermission("setjailpos", "superadmin")

		:Help("setjailpos_help")

		:OnExecute(function(ply)
			DarkRP.storeJailPos(ply, false)

			sam.player.send_message(nil, "s_jail_pos", {
				A = ply
			})
		end)
	:End()

	command.new("addjailpos")
		:SetPermission("addjailpos", "superadmin")

		:Help("addjailpos_help")

		:OnExecute(function(ply)
			DarkRP.storeJailPos(ply, true)

			sam.player.send_message(nil, "a_jail_pos", {
				A = ply
			})
		end)
	:End()

	local RPExtraTeams = RPExtraTeams
	local job_index = nil

	command.new("setjob")
		:SetPermission("setjob", "admin")

		:AddArg("player")
		:AddArg("text", {hint = "job", check = function(job)
			job = job:lower()

			for i = 1, #RPExtraTeams do
				local v = RPExtraTeams[i]
				if v.name:lower() == job or v.command:lower() == job then
					job_index = v.team
					return true
				end
			end

			return false
		end})

		:Help("setjob_help")

		:OnExecute(function(ply, targets, job)
			for i = 1, #targets do
				targets[i]:changeTeam(job_index, true, true, true)
			end

			sam.player.send_message(nil, "setjob", {
				A = ply, T = targets, V = job
			})
		end)
	:End()

	do
		local get_shipment = function(name)
			local found, key = DarkRP.getShipmentByName(name)
			if found then return found, key end

			name = name:lower()

			local shipments = CustomShipments
			for i = 1, #shipments do
				local shipment = shipments[i]
				if shipment.entity == name then
					return DarkRP.getShipmentByName(shipment.name)
				end
			end

			return false
		end

		local place_entity = function(ent, tr, ply)
			local ang = ply:EyeAngles()
			ang.pitch = 0
			ang.yaw = ang.yaw - 90
			ang.roll = 0
			ent:SetAngles(ang)

			local flush_point = tr.HitPos - (tr.HitNormal * 512)
			flush_point = ent:NearestPoint(flush_point)
			flush_point = ent:GetPos() - flush_point
			flush_point = tr.HitPos + flush_point
			ent:SetPos(flush_point)
		end

		command.new("shipment")
			:SetPermission("shipment", "superadmin")

			:AddArg("text", {hint = "weapon", check = get_shipment})

			:Help("shipment_help")

			:OnExecute(function(ply, weapon_name)
				local trace = {}
				trace.start = ply:EyePos()
				trace.endpos = trace.start + ply:GetAimVector() * 85
				trace.filter = ply
				local tr = util.TraceLine(trace)

				local shipment_info, shipment_key = get_shipment(weapon_name)

				local crate = ents.Create(shipment_info.shipmentClass or "spawned_shipment")
				crate.SID = ply.SID

				crate:Setowning_ent(ply)
				crate:SetContents(shipment_key, shipment_info.amount)

				crate:SetPos(Vector(tr.HitPos.x, tr.HitPos.y, tr.HitPos.z))

				crate.nodupe = true
				crate.ammoadd = shipment_info.spareammo
				crate.clip1 = shipment_info.clip1
				crate.clip2 = shipment_info.clip2

				crate:Spawn()
				crate:SetPlayer(ply)

				place_entity(crate, tr, ply)

				local phys = crate:GetPhysicsObject()
				phys:Wake()

				if shipment_info.weight then
					phys:SetMass(shipment_info.weight)
				end

				sam.player.send_message(nil, "shipment", {
					A = ply, V = weapon_name
				})
			end)
		:End()
	end

	sam.command.new("forcename")
		:SetPermission("forcename", "superadmin")

		:AddArg("player")
		:AddArg("text", {hint = "name"})

		:Help("forcename_help")

		:OnExecute(function(ply, targets, name)
			local target = targets[1]

			DarkRP.retrieveRPNames(name, function(taken)
				if not IsValid(target) then return end

				if taken then
					ply:sam_send_message("forcename_taken", {
						V = name
					})
					return
				end

				sam.player.send_message(nil, "forcename", {
					A = ply, T = targets, V = name
				})

				DarkRP.storeRPName(target, name)
				target:setDarkRPVar("rpname", name)
			end)
		end)
	:End()
end)
--PATH addons/sam-157/lua/sam/modules/teleport.lua:
if SAM_LOADED then return end

local sam, command, language = sam, sam.command, sam.language

command.set_category("Teleport")

local find_empty_pos -- https://github.com/FPtje/DarkRP/blob/b147d6fa32799136665a9fd52d35c2fe87cf7f78/gamemode/modules/base/sv_util.lua#L149
do
	local is_empty = function(vector, ignore)
		local point = util.PointContents(vector)
		local a = point ~= CONTENTS_SOLID
			and point ~= CONTENTS_MOVEABLE
			and point ~= CONTENTS_LADDER
			and point ~= CONTENTS_PLAYERCLIP
			and point ~= CONTENTS_MONSTERCLIP
		if not a then return false end

		local ents_found = ents.FindInSphere(vector, 35)
		for i = 1, #ents_found do
			local v = ents_found[i]
			if (v:IsNPC() or v:IsPlayer() or v:GetClass() == "prop_physics" or v.NotEmptyPos) and v ~= ignore then
				return false
			end
		end

		return true
	end

	local distance, step, area = 600, 30, Vector(16, 16, 64)
	local north_vec, east_vec, up_vec = Vector(0, 0, 0), Vector(0, 0, 0), Vector(0, 0, 0)

	find_empty_pos = function(pos, ignore)
		if is_empty(pos, ignore) and is_empty(pos + area, ignore) then
			return pos
		end

		for j = step, distance, step do
			for i = -1, 1, 2 do
				local k = j * i

				-- North/South
				north_vec.x = k
				if is_empty(pos + north_vec, ignore) and is_empty(pos + north_vec + area, ignore) then
					return pos + north_vec
				end

				-- East/West
				east_vec.y = k
				if is_empty(pos + east_vec, ignore) and is_empty(pos + east_vec + area, ignore) then
					return pos + east_vec
				end

				-- Up/Down
				up_vec.z = k
				if is_empty(pos + up_vec, ignore) and is_empty(pos + up_vec + area, ignore) then
					return pos + up_vec
				end
			end
		end

		return pos
	end
end

command.new("bring")
	:DisallowConsole()
	:SetPermission("bring", "admin")

	:AddArg("player", {cant_target_self = true})

	:Help("bring_help")

	:OnExecute(function(ply, targets)
		if not ply:Alive() then
			return ply:sam_send_message("dead")
		end

		if ply:InVehicle() then
			return ply:sam_send_message("leave_car")
		end

		if ply:sam_get_exclusive(ply) then
			return ply:sam_send_message(ply:sam_get_exclusive(ply))
		end

		local teleported = {admin = ply}
		local all = targets.input == "*"

		for i = 1, #targets do
			local target = targets[i]

			if target:sam_get_exclusive(ply) then
				if not all then
					ply:sam_send_message(target:sam_get_exclusive(ply))
				end
				continue
			end

			if not target:Alive() then
				target:Spawn()
			end

			target.sam_tele_pos, target.sam_tele_ang = target:GetPos(), target:EyeAngles()

			target:ExitVehicle()
			target:SetVelocity(Vector(0, 0, 0))
			target:SetPos(find_empty_pos(ply:GetPos(), target))
			target:SetEyeAngles((ply:EyePos() - target:EyePos()):Angle())

			table.insert(teleported, target)
		end

		if #teleported > 0 then
			sam.player.send_message(nil, "bring", {
				A = ply, T = teleported
			})
		end
	end)
:End()

command.new("goto")
	:DisallowConsole()
	:SetPermission("goto", "admin")

	:AddArg("player", {single_target = true, allow_higher_target = true, cant_target_self = true})

	:Help("goto_help")

	:OnExecute(function(ply, targets)
		if ply:sam_get_exclusive(ply) then
			return ply:sam_send_message(ply:sam_get_exclusive(ply))
		end

		if not ply:Alive() then
			ply:Spawn()
		end

		local target = targets[1]
		ply.sam_tele_pos, ply.sam_tele_ang = ply:GetPos(), ply:EyeAngles()

		ply:ExitVehicle()
		ply:SetVelocity(Vector(0, 0, 0))
		ply:SetPos(find_empty_pos(target:GetPos(), ply))
		ply:SetEyeAngles((target:EyePos() - ply:EyePos()):Angle())

		sam.player.send_message(nil, "goto", {
			A = ply, T = targets
		})
	end)
:End()

command.new("return")
	:SetPermission("return", "admin")

	:AddArg("player", {single_target = true, optional = true})

	:Help("return_help")

	:OnExecute(function(ply, targets)
		local target = targets[1]

		local last_pos, last_ang = target.sam_tele_pos, target.sam_tele_ang
		if not last_pos then
			return sam.player.send_message(ply, "no_location", {
				T = targets
			})
		end

		if target:sam_get_exclusive(ply) then
			return ply:sam_send_message(target:sam_get_exclusive(ply))
		end

		if not target:Alive() then
			return ply:sam_send_message(target:Name() .. " is dead!")
		end

		target:ExitVehicle()
		target:SetVelocity(Vector(0, 0, 0))
		target:SetPos(last_pos)
		target:SetEyeAngles(last_ang)

		target.sam_tele_pos, target.sam_tele_ang = nil, nil

		sam.player.send_message(nil, "returned", {
			A = ply, T = targets
		})
	end)
:End()
--PATH addons/sam-157/lua/sam/modules/ttt.lua:
if SAM_LOADED then return end

local run = function(fn)
	if not GAMEMODE then
		timer.Simple(0, fn)
	else
		fn()
	end
end

run(function()
	if engine.ActiveGamemode() ~= "terrortown" then return end

	local sam, command, language = sam, sam.command, sam.language

	command.set_category("TTT")

	command.new("setslays")
		:SetPermission("setslays", "admin")

		:AddArg("player", {single_target = true})
		:AddArg("number", {hint = "amount", optional = true, min = 1, default = 1, round = true})

		:Help("setslays_help")

		:OnExecute(function(ply, targets, amount)
			targets[1]:sam_set_pdata("slays_amount", amount)

			sam.player.send_message(nil, "setslays", {
				A = ply, T = targets, V = amount
			})
		end)
	:End()

	command.new("removeslays")
		:SetPermission("removeslays", "admin")

		:AddArg("player", {single_target = true})

		:Help("removeslays_help")

		:OnExecute(function(ply, targets, amount)
			local target = targets[1]
			target:sam_set_pdata("slays_amount", nil)
			target:SetForceSpec(false)

			sam.player.send_message(nil, "removeslays", {
				A = ply, T = targets
			})
		end)
	:End()

	OldBeginRound = OldBeginRound or BeginRound
	function BeginRound(...)
		local players = player.GetAll()
		for i = 1, #players do
			local ply = players[i]

			local slays = ply:sam_get_pdata("slays_amount")
			if not slays then continue end

			if not ply:IsSpec() then
				ply:Kill()
			end

			GAMEMODE:PlayerSpawnAsSpectator(ply)

			ply:SetTeam(TEAM_SPEC)
			ply:SetForceSpec(true)
			ply:Spawn()

			ply:SetRagdollSpec(false) -- dying will enable this, we don't want it here

			slays = slays - 1

			if slays == 0 then
				timer.Simple(0, function()
					ply:SetForceSpec(false)
				end)
				ply:sam_set_pdata("slays_amount", nil)
			else
				ply:sam_set_pdata("slays_amount", slays)
			end

			sam.player.send_message(nil, "setslays_slayed", {
				T = {ply}, V = slays
			})
		end

		return OldBeginRound(...)
	end
end)
--PATH addons/sam-157/lua/sam/modules/vote.lua:
if SAM_LOADED then return end

-- DONT EVER TALK TO ME ABOUT THIS CODE

local sam, command = sam, sam.command

command.set_category("Voting")

local start_vote, end_vote
if SERVER then
	local vote_on = false
	local options, players_voted

	local shuffle = function(tbl) -- https://gist.github.com/Uradamus/10323382
		for i = #tbl, 2, -1 do
			local j = math.random(i)
			tbl[i], tbl[j] = tbl[j], tbl[i]
		end
		return tbl
	end

	end_vote = function(ply, callback)
		if not vote_on then
			return ply:sam_add_text(color_white, "There is no vote to end.")
		end

		vote_on = false

		sam.set_global("Vote", nil)

		if callback then
			local tbl = {}
			local total_count = 0

			for i = 1, #options do
				local count = sam.get_global("Votings" .. i)
				total_count = total_count + count
				table.insert(tbl, {i, count})
				sam.set_global("Votings" .. i, nil)
			end

			if total_count == 0 then
				return sam.player.add_text(nil, color_white, "The vote have been canceled because nobody voted.")
			end

			table.sort(shuffle(tbl), function(a,b) return a[2] > b[2] end)

			local v = tbl[1]
			local winner, count = v[1], v[2]

			callback(winner, options[winner], count, total_count)
		else
			for i = 1, #options do
				sam.set_global("Votings" .. i, nil)
			end
		end

		options, players_voted = nil, nil

		timer.Remove("SAM.Vote")
	end

	start_vote = function(ply, callback, title, ...)
		if vote_on then
			return ply:sam_add_text(color_white, "There is an active vote, wait for it to finish.")
		end

		vote_on = true

		options, players_voted = {}, {}

		local args, n = {...}, select("#", ...)
		for i = 1, n do
			local v = args[i]
			if v then
				table.insert(options, v)
			end
		end

		sam.set_global("Vote", {title, options, CurTime()})

		for k in ipairs(options) do
			sam.set_global("Votings" .. k, 0)
		end

		timer.Create("SAM.Vote", 25, 1, function()
			end_vote(ply, callback)
		end)

		return true
	end

	sam.netstream.Hook("Vote", function(ply, index)
		if not sam.isnumber(index) or index > 5 then return end

		local votings = sam.get_global("Votings" .. index)
		if not votings then return end

		local old_index = players_voted[ply:AccountID()]
		if old_index == index then return end

		if old_index then
			sam.set_global("Votings" .. old_index, sam.get_global("Votings" .. old_index) - 1)
		end

		sam.set_global("Votings" .. index, votings + 1)

		players_voted[ply:AccountID()] = index
	end)
end

if CLIENT then
	local SUI = sam.SUI
	-- https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/includes/extensions/client/player.lua

	local VOTING_TITLE = SUI.CreateFont("VotingTitle", "Roboto Bold", 15)
	local VOTING_OPTION = SUI.CreateFont("VotingTitle", "Roboto Medium", 14)

	local bind_translation = {}
	for i = 0, 9 do
		bind_translation["slot" .. i] = i
	end

	local voting_frame

	end_vote = function()
		if IsValid(voting_frame) then
			voting_frame:Remove()
		end
		hook.Remove("PlayerBindPress", "SAM.Voting")
		hook.Remove("SAM.ChangedGlobalVar", "SAM.VotingCount")
	end

	hook.Add("SAM.ChangedGlobalVar", "Voting", function(key, value)
		if key ~= "Vote" then return end

		if not value then
			end_vote()
			return
		end

		local title, options, start_time = value[1], value[2], value[3]

		sui.TDLib.Start()

		voting_frame = vgui.Create("EditablePanel")
		voting_frame:SetSize(SUI.Scale(165), SUI.Scale(230))
		voting_frame:SetPos(5, ScrH() * 0.25)
		voting_frame:DockPadding(4, 4, 4, 4)
		voting_frame:Blur()
			:Background(Color(30, 30, 30, 240))

		local voting_title = voting_frame:Add("SAM.Label")
		voting_title:Dock(TOP)
		voting_title:SetFont(VOTING_TITLE)
		voting_title:TextColor(Color(220, 220, 220))
		voting_title:SetText(title)
		voting_title:SetWrap(true)
		voting_title:SetAutoStretchVertical(true)

		local line = voting_frame:Add("SAM.Label")
		line:Dock(TOP)
		line:TextColor(Color(220, 220, 220))
		line:SetText("-")

		local options_added = {}
		for i, v in ipairs(options) do
			local option = voting_frame:Add("SAM.Label")
			option:Dock(TOP)
			option:SetFont(VOTING_OPTION)
			option:TextColor(Color(220, 220, 220), true)
			option:SetText(i .. ". " .. v .. " (0)")
			option:SetWrap(true)
			option:SetAutoStretchVertical(true)

			options_added[i] = option
		end

		function voting_frame:Think() -- fucking gmod
			self:SizeToChildren(false, true)

			local time_left = math.floor(25 - (CurTime() - start_time))
			if time_left <= 0 then
				end_vote()
				voting_frame.Think = nil
				return
			end

			voting_title:SetText(title .. " (" .. time_left .. ")")
		end

		line = voting_frame:Add("SAM.Label")
		line:Dock(TOP)
		line:TextColor(Color(220, 220, 220))
		line:SetText("-")

		local option = voting_frame:Add("SAM.Label")
		option:Dock(TOP)
		option:SetFont(VOTING_OPTION)
		option:TextColor(Color(220, 220, 220), true)
		option:SetText("0. Close")
		option:SetWrap(true)
		option:SetAutoStretchVertical(true)

		sui.TDLib.End()

		local current_index
		hook.Add("PlayerBindPress", "SAM.Voting", function(_, bind, down)
			if not down then return end

			local index = bind_translation[bind]
			if not index then return end

			if index == 0 then
				end_vote()
				return true
			end

			if not options[index] then return true end

			if current_index then
				options_added[current_index]:TextColor(Color(220, 220, 220), true)
			end

			options_added[index]:TextColor(Color(65, 185, 255), true)
			current_index = index

			sam.netstream.Start("Vote", index)

			return true
		end)

		hook.Add("SAM.ChangedGlobalVar", "SAM.VotingCount", function(key2, count)
			if key2:sub(1, 7) ~= "Votings" then return end
			if not count then return end

			local index = tonumber(key2:sub(8))
			options_added[index]:SetText(index .. ". " .. options[index] .. " (" .. count .. ")")
		end)
	end)
end

local vote_check = function(str)
	return str:match("%S") ~= nil
end

command.new("vote")
	:SetPermission("vote", "admin")

	:AddArg("text", {hint = "title", check = vote_check})
	:AddArg("text", {hint = "option", check = vote_check})
	:AddArg("text", {hint = "option", check = vote_check})
	:AddArg("text", {hint = "option", optional = true, check = vote_check})
	:AddArg("text", {hint = "option", optional = true, check = vote_check})
	:AddArg("text", {hint = "option", optional = true, check = vote_check})

	:Help("Start a vote!")

	:OnExecute(function(ply, title, ...)
		local callback = function(_, option, count, total_count)
			sam.player.send_message(nil, "Vote {V} for {V_2} has been passed. ({V_3}/{V_4})", {
				V = title, V_2 = option, V_3 = count, V_4 = total_count
			})
		end

		if start_vote(ply, callback, title, ...) then
			sam.player.send_message(nil, "{A} started a vote with title {V}.", {
				A = ply, V = title
			})
		end
	end)
:End()

command.new("endvote")
	:SetPermission("endvote", "admin")

	:Help("End current vote.")

	:OnExecute(function(ply)
		end_vote(ply)
	end)
:End()

command.new("votekick")
	:SetPermission("votekick", "admin")

	:AddArg("player", {single_target = true})
	:AddArg("text", {hint = "reason", optional = true})

	:GetRestArgs()

	:Help("Start a vote to kick a player.")

	:OnExecute(function(ply, targets, reason)
		local target = targets[1]
		local target_name = target:Name()

		local callback = function(index, option, count, total_count)
			if not IsValid(ply) then
				sam.player.send_message(nil, "Vote was canceled because {T} left.", {
					T = target_name
				})
				return
			end

			if index == 1 then
				target:Kick("Vote was successful (" .. (reason or "none") .. ")")

				sam.player.send_message(nil, "Vote was successful, {T} has been kicked. ({V})", {
					T = targets, V = reason
				})
			else
				sam.player.send_message(nil, "Vote was unsuccessful, {T} won't be kicked.", {
					T = target_name
				})
			end
		end

		local title = "Kick " .. target_name .. "?"
		if reason then
			title = title .. " (" .. reason .. ")"
		end

		if start_vote(ply, callback, title, "Yes", "No") then
			if reason then
				sam.player.send_message(nil, "{A} started a votekick against {T} ({V})", {
					A = ply, T = targets, V = reason
				})
			else
				sam.player.send_message(nil, "{A} started a votekick against {T}", {
					A = ply, T = targets
				})
			end
		end
	end)
:End()

command.new("voteban")
	:SetPermission("voteban", "admin")

	:AddArg("player", {single_target = true})
	:AddArg("length", {optional = true, default = 60, min = 30, max = 120})
	:AddArg("text", {hint = "reason", optional = true})

	:GetRestArgs()

	:Help("Start a vote to ban a player.")

	:OnExecute(function(ply, targets, length, reason)
		local target = targets[1]
		local target_steamid, target_name = target:SteamID(), target:Name()
		local ply_steamid = ply:SteamID()

		local callback = function(index, option, count, total_count)
			if index == 1 then
				sam.player.ban_id(target_steamid, length, "Vote was successful (" .. (reason or "none") .. ")", ply_steamid)

				sam.player.send_message(nil, "Vote was successful, {T} has been banned. ({V})", {
					T = target_name, V = reason
				})
			else
				sam.player.send_message(nil, "Vote was unsuccessful, {T} won't be banned.", {
					T = target_name
				})
			end
		end

		local title = "Ban " .. target_name .. "?"
		if reason then
			title = title .. " (" .. reason .. ")"
		end

		if start_vote(ply, callback, title, "Yes", "No") then
			if reason then
				sam.player.send_message(nil, "{A} started a voteban against {T} for {V} ({V_2})", {
					A = ply, T = targets, V = sam.format_length(length), V_2 = reason
				})
			else
				sam.player.send_message(nil, "{A} started a voteban against {T} for {V}", {
					A = ply, T = targets, V = sam.format_length(length)
				})
			end
		end
	end)
:End()

command.new("votemute")
	:SetPermission("votemute", "admin")

	:AddArg("player", {single_target = true})
	:AddArg("text", {hint = "reason", optional = true})

	:GetRestArgs()

	:Help("Start a vote to mute and gag a player.")

	:OnExecute(function(ply, targets, reason)
		local _reason = reason and (" (" .. reason .. ")") or ""

		local target = targets[1]
		local target_name = target:Name()

		local callback = function(index, option, count, total_count)
			if not IsValid(target) then
				sam.player.send_message(nil, "Vote was canceled because {T} left.", {
					T = target_name
				})
				return
			end

			if index == 1 then
				RunConsoleCommand("sam", "mute", "#" .. target:EntIndex(), 0, "votemute" .. _reason)
				RunConsoleCommand("sam", "gag", "#" .. target:EntIndex(), 0, "votemute" .. _reason)

				sam.player.send_message(nil, "Vote was successful, {T} has been muted. ({V})", {
					T = target_name, V = reason
				})
			else
				sam.player.send_message(nil, "Vote was unsuccessful, {T} won't be muted.", {
					T = target_name
				})
			end
		end

		local title = "Mute " .. target_name .. "?" .. _reason
		if start_vote(ply, callback, title, "Yes", "No") then
			if reason then
				sam.player.send_message(nil, "{A} started a votemute against {T} ({V}).", {
					A = ply, T = targets, V = reason
				})
			else
				sam.player.send_message(nil, "{A} started a votemute against {T}.", {
					A = ply, T = targets
				})
			end
		end
	end)
:End()

command.new("votemap")
	:SetPermission("votemap", "admin")

	:AddArg("map", {exclude_current = true})
	:AddArg("map", {optional =  true, exclude_current = true})
	:AddArg("map", {optional =  true, exclude_current = true})

	:GetRestArgs()

	:Help("Start a vote to change map.")

	:OnExecute(function(ply, ...)
		local callback = function(_, option, count, total_count)
			sam.player.send_message(nil, "Map vote for {V} has been passed. ({V_2}/{V_3})", {
				V = option, V_2 = count, V_3 = total_count
			})

			if sam.is_valid_map(option) then
				RunConsoleCommand("sam", "map", option)
			end
		end

		local args = {...}
		for i = select("#", ...), 1, -1 do
			if args[i] == "None" then
				args[i] = nil
			end
		end
		table.insert(args, "Extend Current Map")

		if start_vote(ply, callback, "Vote for the next map!", unpack(args)) then
			sam.player.send_message(nil, "{A} started a map change vote.", {
				A = ply
			})
		end
	end)
:End()
--PATH addons/sui/lua/sui/libs/gif_loader.lua:
local byte = string.byte
local sub = string.sub
local lshift = bit.lshift
local rshift = bit.rshift
local bor = bit.bor
local band = bit.band

local GIFDecoder = {}
local GIFDecoderMethods = {}
local GIFDecoder_meta = {__index = GIFDecoderMethods}

function GIFDecoder.new(buf)
	local buf_n = #buf
	local this = setmetatable({
		p = 1,
		buf = buf
	}, GIFDecoder_meta)

	local version = this:read(6)
	assert(version == "GIF89a" or version == "GIF87a", "wrong file format")

	this.width = this:word()
	this.height = this:word()

	local pf0 = this:byte()
	local global_palette_flag = rshift(pf0, 7)
	local num_global_colors_pow2 = band(pf0, 0x7)
	local num_global_colors = lshift(1, num_global_colors_pow2 + 1)
	this:skip(2)

	local global_palette_offset = nil
	local global_palette_size = nil

	if global_palette_flag > 0 then
		global_palette_offset = this.p
		this.global_palette_offset = global_palette_offset
		global_palette_size = num_global_colors
		this:skip(num_global_colors * 3)
	end

	local no_eof = true

	local frames = {}

	local delay = 0
	local transparent_index = nil
	local disposal = 1

	while no_eof and this.p <= buf_n do
		local b = this:byte()
		if b == 0x3b then
			no_eof = false
		elseif b == 0x2c then
			local x, y, w, h = this:word(), this:word(), this:word(), this:word()
			local pf2 = this:byte()
			local local_palette_flag = rshift(pf2, 7)
			local interlace_flag = band(rshift(pf2, 6), 1)
			local num_local_colors_pow2 = band(pf2, 0x7)
			local num_local_colors = lshift(1, num_local_colors_pow2 + 1)
			local palette_offset = global_palette_offset
			local palette_size = global_palette_size
			local has_local_palette = false
			if local_palette_flag ~= 0 then
				has_local_palette = true
				palette_offset = this.p
				palette_size = num_local_colors
				this:skip(num_local_colors * 3)
			end

			local data_offset = this.p

			this:skip(1)
			this:skip_eob()

			table.insert(frames, {
				x = x,
				y = y,
				width = w,
				height = h,
				has_local_palette = has_local_palette,
				palette_offset = palette_offset,
				palette_size = palette_size,
				data_offset = data_offset,
				data_length = this.p - data_offset,
				transparent_index = transparent_index,
				interlaced = interlace_flag > 0,
				delay = delay,
				disposal = disposal
			})
		elseif b == 0x21 then
			local b2 = this:byte()
			if b2 == 0xf9 then
				local len, flags = this:bytes(2)
				delay = this:word()
				local transparent, terminator = this:bytes(2)

				assert(len == 4 and terminator == 0, "Invalid graphics extension block.")

				if flags % 2 == 1 then
					transparent_index = transparent
				else
					transparent_index = nil
				end

				disposal = math.floor(flags / 4) % 8
			elseif b2 == 0xff then
				this:read(this:byte())
				this:skip_eob()
			else
				this:skip_eob()
			end
		end
	end

	this.frames = frames

	return this
end

function GIFDecoderMethods:skip(offset)
	self.p = self.p + offset
end

-- skip to end of block
function GIFDecoderMethods:skip_eob()
	repeat
		local size = self:byte()
		self:skip(size)
	until size == 0
end

function GIFDecoderMethods:byte()
	local b = byte(self.buf, self.p)
	self:skip(1)
	return b
end

function GIFDecoderMethods:bytes(len)
	local _p = self.p
	self:skip(len)
	return byte(self.buf, _p, len + _p - 1)
end

function GIFDecoderMethods:read(len)
	local _p = self.p
	self:skip(len)
	return sub(self.buf, _p, len + _p - 1)
end

function GIFDecoderMethods:word()
	return bor(self:byte(), lshift(self:byte(), 8))
end

local GifReaderLZWOutputIndexStream = function(this, output, output_length)
	local min_code_size = this:byte()
	local clear_code = lshift(1, min_code_size)
	local eoi_code = clear_code + 1
	local next_code = eoi_code + 1
	local cur_code_size = min_code_size + 1

	local code_mask = lshift(1, cur_code_size) - 1
	local cur_shift = 0
	local cur = 0
	local op = 0

	local subblock_size = this:byte()

	local code_table = {}

	local prev_code = nil

	while true do
		while cur_shift < 16 do
			if subblock_size == 0 then break end

			cur = bor(cur, lshift(this:byte(), cur_shift))
			cur_shift = cur_shift + 8

			if subblock_size == 1 then
				subblock_size = this:byte()
			else
				subblock_size = subblock_size - 1
			end
		end

		if cur_shift < cur_code_size then break end

		local code = band(cur, code_mask)
		cur = rshift(cur, cur_code_size)
		cur_shift = cur_shift - cur_code_size

		if code == clear_code then
			next_code = eoi_code + 1
			cur_code_size = min_code_size + 1
			code_mask = lshift(1, cur_code_size) - 1

			prev_code = null
			continue
		elseif code == eoi_code then
			break
		end

		local chase_code = code < next_code and code or prev_code
		local chase_length = 0
		local chase = chase_code
		while chase > clear_code do
			chase = rshift(code_table[chase], 8)
			chase_length = chase_length + 1
		end

		local k = chase
		local op_end = op + chase_length + (chase_code ~= code and 1 or 0)
		if op_end > output_length then
			Error("Warning, gif stream longer than expected.")
			return
		end

		output[op] = k; op = op + 1
		op = op + chase_length

		local b = op

		if chase_code ~= code then
			output[op] = k; op = op + 1
		end
		chase = chase_code

		while chase_length > 0 do
			chase_length = chase_length - 1
			chase = code_table[chase]
			b = b - 1
			output[b] = band(chase, 0xff)

			chase = rshift(chase, 8)
		end

		if prev_code ~= nil and next_code < 4096 then
			code_table[next_code] = bor(lshift(prev_code, 8), k)
			next_code = next_code + 1

			if next_code >= code_mask + 1 and cur_code_size < 12 then
				cur_code_size = cur_code_size + 1
				code_mask = bor(lshift(code_mask, 1), 1)
			end
		end

		prev_code = code
	end

	if op ~= output_length then
		Error("Warning, gif stream shorter than expected.")
	end

	return output
end

function GIFDecoderMethods:decode_and_blit_frame_RGBA(frame_num, pixels)
	local frame = self.frames[frame_num]
	local num_pixels = frame.width * frame.height
	local index_stream = {}

	self.p = frame.data_offset
	GifReaderLZWOutputIndexStream(self, index_stream, num_pixels)
	local palette_offset = frame.palette_offset

	local trans = frame.transparent_index
	if trans == nil then
		trans = 256
	end

	local width = self.width
	local framewidth = frame.width
	local framestride = width - framewidth
	local xleft = framewidth

	local opbeg = (frame.y * width + frame.x) * 4

	local opend = ((frame.y + frame.height) * width + frame.x) * 4
	local op = opbeg
	local scanstride = framestride * 4

	if frame.interlaced == true then
		scanstride = scanstride + (width * 4 * 7)
	end

	local interlaceskip = 8

	local i = 0
	local buf = self.buf
	while i < num_pixels do
		local index = index_stream[i]

		if xleft == 0 then
			op = op + scanstride
			xleft = framewidth

			if op >= opend then
				scanstride =
					framestride * 4 + width * 4 * (interlaceskip - 1)

				op =
					opbeg +
					(framewidth + framestride) * lshift(interlaceskip, 1)
				interlaceskip = rshift(interlaceskip, 1)
			end
		end

		if index ~= trans then
			index = palette_offset + index * 3
			pixels[op + 0] = byte(buf, index)
			pixels[op + 1] = byte(buf, index + 1)
			pixels[op + 2] = byte(buf, index + 2)
			pixels[op + 3] = 255
		end

		op = op + 4

		xleft = xleft - 1
		i = i + 1
	end
end

function GIFDecoderMethods:clear_frame(frame_num, pixels)
	local frame = self.frames[frame_num]

	self.p = frame.data_offset

	local width = self.width
	local framewidth = frame.width
	local framestride = width - framewidth
	local xleft = framewidth

	local opbeg = (frame.y * width + frame.x) * 4

	local opend = ((frame.y + frame.height) * width + frame.x) * 4
	local op = opbeg
	local scanstride = framestride * 4

	if frame.interlaced == true then
		scanstride = scanstride + (width * 4 * 7)
	end

	local interlaceskip = 8

	local i = 0
	local num_pixels = frame.width * frame.height
	while i < num_pixels do
		if xleft == 0 then
			op = op + scanstride
			xleft = framewidth

			if op >= opend then
				scanstride =
					framestride * 4 + width * 4 * (interlaceskip - 1)

				op =
					opbeg +
					(framewidth + framestride) * lshift(interlaceskip, 1)
				interlaceskip = rshift(interlaceskip, 1)
			end
		end

		pixels[op + 0] = 0
		pixels[op + 1] = 0
		pixels[op + 2] = 0
		pixels[op + 3] = 0
		op = op + 4

		xleft = xleft - 1
		i = i + 1
	end
end

function GIFDecoderMethods:get_frames()
	local num_pixels = self.width * self.height * 4 + 4
	local frames = {}
	local numFrames = #self.frames
	local last_frame
	local restore_from
	for i = 1, numFrames do
		local frame = self.frames[i]

		local data = {}

		if last_frame then
			local _data = last_frame.data
			for k = 0, num_pixels do
				data[k] = _data[k]
			end
		end

		if i > 1 then
			local last_disposal = last_frame.disposal
			if last_disposal == 3 then
				if restore_from then
					for k = 0, num_pixels do
						data[k] = restore_from[k]
					end
				else
					self:clear_frame(i - 1, data)
				end
			end

			if last_disposal == 2 then
				self:clear_frame(i - 1, data)
			end
		end

		self:decode_and_blit_frame_RGBA(i, data)

		local delay = frame.delay
		if delay < 2 then
			delay = 10
		end

		local disposal = frame.disposal
		last_frame = {
			data = data,
			delay = delay,
			disposal = disposal
		}
		frames[i] = last_frame

		if disposal ~= 3 then
			restore_from = data
		end
	end

	return frames
end

return GIFDecoder.new
--PATH addons/sui/lua/sui/vgui/sui_scroll_panel.lua:
local math = math
local table = table

local pairs = pairs

local TDLib = sui.TDLib
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local RoundedBox = sui.TDLib.LibClasses.RoundedBox

local Panel = {}

AccessorFunc(Panel, "m_bFromBottom", "FromBottom", FORCE_BOOL)
AccessorFunc(Panel, "m_bVBarPadding", "VBarPadding", FORCE_NUMBER)

Panel:SetVBarPadding(0)

Panel.NoOverrideClear = true

-- VBar
local starting_scroll_speed = 3

local vbar_OnMouseWheeled = function(s, delta)
	s.scroll_speed = s.scroll_speed + 20 * 0.012 --[[ slowly increase scroll speed ]]
	s:AddScroll(delta * -s.scroll_speed)
end

-- default set scroll clamps amount
local vbar_SetScroll = function(s, amount)
	if not s.Enabled then s.Scroll = 0 return end

	s.scroll_target = amount
	s:InvalidateLayout()
end

-- ¯\_(ツ)_/¯ https://github.com/Facepunch/garrysmod/blob/cd3d894288b847e3d081570129963d4089e36261/garrysmod/lua/vgui/dvscrollbar.lua#L234
local vbar_OnCursorMoved = function(s, _, y)
	if s.Dragging then
		y = y - s.HoldPos
		y = y / (s:GetTall() - s:GetWide() * 2 - s.btnGrip:GetTall())
		s.scroll_target = y * s.CanvasSize
	end
end

local vbar_Think = function(s)
	local frame_time = RealFrameTime() * 17
	local scroll_target = s.scroll_target

	s.Scroll = Lerp(frame_time, s.Scroll, scroll_target)

	if not s.Dragging then
		s.scroll_target = Lerp(frame_time, scroll_target, math.Clamp(scroll_target, 0, s.CanvasSize))
	end

	-- now start slowing it down!!!
	s.scroll_speed = Lerp(frame_time / 10, s.scroll_speed, starting_scroll_speed)
end

local vbar_Paint = function(s, w, h)
	TDLib.RoundedBox(s.vertices, 3, 0, 0, w, h, SUI.GetColor("scroll"))
end

local vbarGrip_Paint = function(s, w, h)
	TDLib.RoundedBox(s.vertices, 3, 0, 0, w, h, SUI.GetColor("scroll_grip"))
end

local vbar_PerformLayout = function(s, w, h)
	local scroll = s:GetScroll() / s.CanvasSize
	local bar_size = math.max(s:BarScale() * h, 10)

	local track = (h - bar_size) + 1
	scroll = scroll * track

	s.btnGrip.y = scroll
	s.btnGrip:SetSize(w, bar_size)
end
--

function Panel:Init()
	local canvas = self:GetCanvas()
	canvas:SUI_TDLib()

	local children = {}
	function canvas:OnChildAdded(child)
		table.insert(children, child)
	end
	function canvas:OnChildRemoved(child)
		for i = 1, #children do
			local v = children[i]
			if v == child then
				table.remove(children, i)
				return
			end
		end
	end
	canvas.GetChildren = function()
		return children
	end
	canvas.children = children

	local vbar = self.VBar
	vbar:SetHideButtons(true)
	vbar.btnUp:SetVisible(false)
	vbar.btnDown:SetVisible(false)

	vbar.vertices = {}
	vbar.scroll_target = 0
	vbar.scroll_speed = starting_scroll_speed

	vbar.OnMouseWheeled = vbar_OnMouseWheeled
	vbar.SetScroll = vbar_SetScroll
	vbar.OnCursorMoved = vbar_OnCursorMoved
	vbar.Think = vbar_Think
	vbar.Paint = vbar_Paint
	vbar.PerformLayout = vbar_PerformLayout

	vbar.btnGrip.vertices = {}
	vbar.btnGrip.Paint = vbarGrip_Paint

	self:ScaleChanged()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function Panel:OnChildAdded(child)
	self:AddItem(child)
	self:ChildAdded(child)
end

function Panel:ChildAdded()
end

function Panel:ScaleChanged()
	local w = SUI.Scale(4)

	self.VBar:SetWide(w)
	self.VBar.btnDown:SetSize(w, 0)
	self.VBar.btnUp:SetSize(w, 0)
end

function Panel:Paint(w, h)
	local outline = SUI.GetColor("scroll_panel_outline")
	if outline then
		TDLib.DrawOutlinedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"), outline, 1)
	else
		RoundedBox(self, "Background", 3, 0, 0, w, h, SUI.GetColor("scroll_panel"))
	end
end

function Panel:ScrollToBottom()
	local vbar = self.VBar
	for k, anim in pairs(vbar.m_AnimList or {}) do
		anim:Think(vbar, 1)
		vbar.m_AnimList[k] = nil
	end

	self:InvalidateParent(true)
	self:InvalidateChildren(true)

	vbar:SetScroll(vbar.CanvasSize)
end

function Panel:PerformLayoutInternal(w, h)
	w = w or self:GetWide()
	h = h or self:GetTall()

	local canvas = self.pnlCanvas

	self:Rebuild()

	local vbar = self.VBar
	vbar:SetUp(h, canvas:GetTall())

	if vbar.Enabled then
		w = w - vbar:GetWide() - self.m_bVBarPadding
	end

	canvas:SetWide(w)

	self:Rebuild()
end

function Panel:Think()
	local canvas = self.pnlCanvas

	local vbar = self.VBar
	if vbar.Enabled then
		canvas.y = -vbar.Scroll
	else
		if self:GetFromBottom() then
			canvas._y = Lerp(10 * RealFrameTime(), canvas._y or canvas.y, self:GetTall() - canvas:GetTall())
		else
			canvas._y = Lerp(10 * RealFrameTime(), canvas._y or canvas.y, -vbar.Scroll)
		end
		canvas.y = canvas._y
	end
end

sui.register("ScrollPanel", Panel, "DScrollPanel")

--PATH addons/sui/lua/sui/vgui/sui_text_entry.lua:
local sui = sui

local surface = surface
local utf8 = sui.utf8
local draw = draw
local math = math

local IsValid = IsValid
local tostring = tostring
local tonumber = tonumber

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor
local TEXT_ENTRY_FONT = SUI.CreateFont("TextEntry", "Roboto Regular", 16)

local Panel = {}

sui.scaling_functions(Panel)

AccessorFunc(Panel, "m_FontName", "Font", FORCE_STRING)
AccessorFunc(Panel, "m_Editable", "Editable", FORCE_BOOL)
AccessorFunc(Panel, "m_Placeholder", "Placeholder", FORCE_STRING)
AccessorFunc(Panel, "m_MaxChars", "MaxChars", FORCE_NUMBER)
AccessorFunc(Panel, "m_Numeric", "Numeric", FORCE_BOOL)
AccessorFunc(Panel, "m_NoBar", "NoBar", FORCE_BOOL)
AccessorFunc(Panel, "m_BarColor", "BarColor")
AccessorFunc(Panel, "m_Background", "Background")
AccessorFunc(Panel, "m_Radius", "Radius")
AccessorFunc(Panel, "m_NoEnter", "NoEnter")

Panel:SetRadius(3)

function Panel:Init()
	self:ScaleInit()

	self:SetupTransition("TextEntryReady", 0.9, function()
		return self:IsEditing() or self:GetBarColor() ~= nil
	end)

	self:SetUpdateOnType(true)
	self:SetCursor("beam")
	self:SetFont(TEXT_ENTRY_FONT)
	self:SetPlaceholder("Placeholder text")

	self:SetSize(200, 22)

	self.allowed_numeric_characters = "1234567890.-"

	self.history = {}
	self.history_pos = 1
	self.can_use_history = true

	self:OnScaleChange()
end

function Panel:SetCaretPos(pos)
	DTextEntry.SetCaretPos(self, math.Clamp(pos, 0, utf8.len(self:GetText())))
end

function Panel:SetValue(value)
	self:SetText(value)
	self:OnValueChange(value)
end

function Panel:AllowInput(ch)
	if self:CheckNumeric(ch) then return true end

	if sui.wspace_chs[ch] or sui.cntrl_chs[ch] then
		return true
	end

	local max_chars = self:GetMaxChars()
	if max_chars and #self:GetText() >= max_chars then
		surface.PlaySound("resource/warning.wav")
		return true
	end
end

function Panel:AddValue(v, i, j)
	local original_text = self:GetText()

	local start
	if i then
		start = original_text:sub(1, i)
	else
		start = utf8.sub(original_text, 1, self:GetCaretPos())
	end

	local text = start .. v
	local caret_pos = utf8.len(text)

	local _end
	if j then
		_end = original_text:sub(j)
	else
		_end = utf8.sub(original_text, utf8.len(start) + 1)
	end
	text = text .. _end

	local max_chars = self:GetMaxChars()
	if max_chars then
		text = text:sub(1, max_chars)
	end

	self:SetValue(text)
	self:SetCaretPos(caret_pos)
end

function Panel:OnKeyCodeTyped(code)
	if self.no_down then
		self.no_down = nil
		return
	end

	if code == KEY_UP or code == KEY_DOWN then
		if not self:UpdateFromHistory(code) then
			return true
		end

		local lines, caret_line = self:GetNumLines()

		if lines == 1 then
			return true
		end

		--
		-- this fixes a weird issue
		-- make the text entry has at least 2 lines, go up then go down, you won't be able to go up again
		--
		if code == KEY_DOWN and lines == caret_line + 1 then
			self.no_down = true
			gui.InternalKeyCodeTyped(KEY_DOWN)
		end
	end

	self:OnKeyCode(code)

	if code == KEY_ENTER then
		if IsValid(self.Menu) then
			self.Menu:Remove()
		end

		if not self:GetNoEnter() then
			self:FocusNext()
			self:OnEnter()
		end
	end
end

function Panel:DisallowFloats(disallow)
	if not isbool(disallow) then
		disallow = true
	end

	if disallow then
		self.allowed_numeric_characters = self.allowed_numeric_characters:gsub("%.", "", 1)
	elseif not self.allowed_numeric_characters:find(".", 1, true) then
		self.allowed_numeric_characters = self.allowed_numeric_characters .. "."
	end
end

function Panel:DisallowNegative(disallow)
	if not isbool(disallow) then
		disallow = true
	end

	if disallow then
		self.allowed_numeric_characters = self.allowed_numeric_characters:gsub("%-", "", 1)
	elseif not self.allowed_numeric_characters:find("-", 1, true) then
		self.allowed_numeric_characters = self.allowed_numeric_characters .. "-"
	end
end

function Panel:CheckNumeric(value)
	if not self:GetNumeric() then return false end

	if not self.allowed_numeric_characters:find(value, 1, true) then
		return true
	end

	local new_value = ""
	local current_value = tostring(self:GetText())

	local caret_pos = self:GetCaretPos()
	for i = 0, #current_value do
		new_value = new_value .. current_value:sub(i, i)
		if i == caret_pos then
			new_value = new_value .. value
		end
	end

	if #current_value ~= 0 and not tonumber(new_value) then
		return true
	end

	return false
end

function Panel:AddHistory(txt)
	if not txt or txt == "" then return end
	local history = self.history
	if history[#history] ~= txt then
		table.insert(history, txt)
	end
end

function Panel:UpdateFromHistory(code)
	if not self.can_use_history then return end

	local lines, caret_line = self:GetNumLines()

	if code == KEY_UP then
		if caret_line > 1 then return true end -- enable the caret to move up and down

		if self.history_pos <= 1 then return end

		self.history_pos = self.history_pos - 1
	elseif code == KEY_DOWN then
		if caret_line ~= lines then return true end

		if self.history_pos >= #self.history then
			self:SetValue("")
			self:SetCaretPos(0)
			self.history_pos = #self.history + 1
			return
		end

		self.history_pos = self.history_pos + 1
	end

	local text = self.history[self.history_pos]
	if not text then return end

	self:SetValue(text)
	self:SetCaretPos(utf8.len(text))
end

function Panel:OnTextChanged()
	self.history_pos = #self.history + 1

	local text = self:GetText()

	self.can_use_history = text == "" and true or false

	if self:GetUpdateOnType() then
		self:UpdateConvarValue()
		self:OnValueChange(text)
	end

	self:OnChange()
end

function Panel:OnScaleChange()
	self:InvalidateLayout()
	self:InvalidateLayout(true)
end

function Panel:Paint(w, h)
	self:RoundedBox("Background", self:GetRadius(), 0, 0, w, h, GetColor("text_entry_bg") or self:GetBackground())

	local text_entry_3 = GetColor("text_entry_3")

	if self:GetText() == "" then
		local old_text = self:GetText()
		self:SetText(self:GetPlaceholder())
		self:DrawTextEntryText(GetColor("text_entry_2"), text_entry_3, text_entry_3)
		self:SetText(old_text)
	else
		self:DrawTextEntryText(GetColor("text_entry"), text_entry_3, text_entry_3)
	end

	if not self:GetNoBar() then
		local bar_color = self:GetBarColor()

		self:RoundedBox("Bar1", 0, 0, h - 1, w, 1, GetColor("text_entry_bar_color"))

		local bar = math.Round(w * self.TextEntryReady)
		if bar > 0 then
			self:RoundedBox("Bar2", 0, (w / 2) - (bar / 2), h - 1, bar, 1, bar_color or text_entry_3)
		end
	end
end

-- https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/mp/src/vgui2/vgui_controls/TextEntry.cpp#L969
function Panel:GetNumLines(wide)
	local num_lines = 1

	wide = wide or self:GetWide() - 2

	local vbar = self:GetChildren()[1]
	if vbar then
		wide = wide - vbar:GetWide()
	end

	local char_width
	local x = 3

	local word_start_index = 1
	local word_start_len
	local word_length = 0
	local has_word = false
	local just_started_new_line = true
	local word_started_on_new_line = true

	local start_char = 1

	surface.SetFont(self:GetFont())

	local i = start_char
	local text, n = utf8.force(self:GetText())
	local caret_line = 0
	local caret_pos = self:GetCaretPos()
	local caret_i = 1
	while i <= n do
		local ch_len = utf8.char_bytes(text:byte(i))
		local ch = text:sub(i, i + ch_len - 1)

		if ch ~= " " then
			if not has_word then
				word_start_index = i
				word_start_len = ch_len
				has_word = true
				word_started_on_new_line = just_started_new_line
				word_length = 0
			end
		else
			has_word = false
		end

		char_width = surface.GetTextSize(ch)
		just_started_new_line = false

		if (x + char_width) >= wide then
			x = 3

			just_started_new_line = true
			has_word = false

			if word_started_on_new_line then
				num_lines = num_lines + 1
			else
				num_lines = num_lines + 1
				i = (word_start_index + word_start_len) - ch_len
			end

			word_length = 0
		end

		x = x + char_width
		word_length = word_length + char_width

		if caret_i == caret_pos then
			caret_line = num_lines
		end

		i = i + ch_len
		caret_i = caret_i + 1
	end

	return num_lines, caret_line
end

function Panel:SetCheck(func, col)
	function self:OnValueChange(text)
		if func(text) == false then
			self.valid = false
			self:SetBarColor(GetColor("close_hover"))
			self:SetNoEnter(true)
		else
			self.valid = true
			self:SetBarColor(col)
			self:SetNoEnter(false)
		end
	end
	self:SetValue(self:GetText())
end

sui.register("TextEntry", Panel, "DTextEntry")
--PATH addons/chatbox/lua/sh_scb_config.lua:
if SCB_LOADED then return end

local config = scb.config

--
-- Chatbox title!@!
-- SERVER_NAME will be replaced with your server name
-- PLAYER_COUNT will be replaced with your online player count
-- EG.
-- config.chatbox_title = "SERVER_NAME (PLAYER_COUNT)" -- > Srlion Gaming (1)
--
config.chatbox_title = "SERVER_NAME (PLAYER_COUNT)"

--
-- By default it uses 12h format, for 24h use "%H:%M:%S"
--
config.timestamps_format = "%H:%M:%S"

--
-- Allow parsing in chat print functions? (chat.AddText/Player:ChatPrint/Player:PrintMessage)
-- If it causes problems then disable it.
--
config.parse_in_chat = true

--
-- Hide language sign that appears behing emojis if you are typing in a non-English language
--
config.hide_language_sign = true

--
-- Enable the custom join messages
--
config.enable_custom_join_messages = true

--
-- Enable the custom leave messages
--
config.enable_custom_leave_messages = true

--
-- Enable avatars
--
config.enable_avatars = true

--
-- You can use SteamID/SteamID64/Ranks
-- If the first value is 'true' then anyone can use it
--
config.permissions = {
	--
	-- Who can add/remove/edit emojis & tags?
	--
	menu = {
		"superadmin",
		"STEAM_0:1:712470889",
	},

	--
	-- Who can use rainbow texts?
	-- Eg.
	-- hi there {* everyone}!
	--
	rainbow = {
		"superadmin",
		"admin",
		"vip",
		"vip+",
	},

	--
	-- Who can use flashing texts?
	-- Eg.
	-- hi there {! everyone}!
	--
	flashing = {
		true, -- anyone can use this!!!
	},

	--
	-- Who can use colored texts?
	-- Eg.
	-- hi there {red Srlion}!
	-- hi there {#ff0000 Srlion}!
	--
	colored_texts = {
		true, -- anyone can use this!!!
	},

	--
	-- Who can use custom emojis?
	--
	custom_emojis = {
		true, -- anyone can use this because true is the first value!!!
		"superadmin",
	}
}

--
-- You can add colors that can be used in chatbox, eg. {my_new_color hi there!}
-- Use something like https://www.hexcolortool.com to get hex codes!
--
config.colors = {
	red = "f44336",
	pink = "E91E63",
	purple = "9C27B0",
	blue = "1773c4",
	cyan = "00BCD4",
	green = "4CAF50",
	yellow = "FFEB3B",
	orange = "FF9800",
	brown = "7b5804",
	grey = "9E9E9E",
	white = "E0E0E0",
	black = "080808"
}

scb.language = {
	save = "SAVE",
	cancel = "CANCEL",
	edit = "Edit",
	search = "Search...",
	team = "TEAM",
	dead = "*DEAD* ",
	console = "Console",
	remove = "Remove",

	type_something = "type something...",

	settings_title = "Settings",

	client_title = "Client",
	tags_title = "Tags",
	emojis_title = "Emojis",

	show_avatars = "Show avatars",
	show_time = "Show timestapms",
	disable_rainbow = "Disable rainbow colors",
	disable_flashing = "Disable flashing texts",
	blur_theme = "Blur theme",
	join_messages = "Join/Disconnect messages",
	scale = "Scale",
	messages_fade = "Messages fade out time",
	max_messages = "Max messages",
	reset_size = "Reset chatbox size",
	reset_position = "Reset chatbox position",
	clear_reload = "Clear & Reload images (can fix problems if some images are outdated or not loading)",

	add_tag = "Add Tag",
	tag_owner = "SteamID/SteamID64/Rank",
	tag = "Tag",

	add_emoji = "Add Emoji",
	emoji_name = "Name",
	emoji_url = "URL",

	copy_text = "Copy Text",
	copy_message = "Copy Message",
	copy_steamid = "Copy Steamid",
	copy_steamid64 = "Copy Steamid64",
	show_profile = "Show Player Profile",
	copy_time = "Copy Message Time",
	copy_url = "Copy URL",

	bot_joined = "{#1773c4 NAME} joined the game",
	bot_left = "{#f44336 NAME} left the game",

	-- STEAMID gets replaced by the player steamid
	player_connecting = "{#1773c4 NAME} is connecting",
	player_left = "{#f44336 NAME} left the game: REASON",
}
--PATH addons/chatbox/lua/scb/settings/cl_settings.lua:
if SCB_LOADED then return end

local vgui = vgui

local IsValid = IsValid
local pairs = pairs
local LocalPlayer = LocalPlayer

local scb = scb

local tabs = {}
for _, f in ipairs(file.Find("scb/settings/tabs/*.lua", "LUA")) do
	local data = include("scb/settings/tabs/" .. f)
	tabs[data.pos or #tabs + 1] = data
end

function scb.open_settings()
	if IsValid(scb.settings_frame) then
		return scb.settings_frame:Remove()
	end

	local frame = vgui.Create("SCB.Frame")
	frame:SetTitle("SCB | " .. scb.language.settings_title)
	frame:MakePopup()
	frame:AddAnimations(382, 420)

	local sheet = frame:Add("SCB.PropertySheet")
	sheet:Dock(FILL)
	sheet:DockMargin(4, 4, 4, 4)
	sheet:InvalidateParent(true)
	sheet:InvalidateLayout(true)

	for k, v in pairs(tabs) do
		if v.check == false or scb.has_permission(LocalPlayer(), "menu") then
			sheet:AddSheet(v.title, v.func)
		end
	end

	scb.settings_frame = frame
end
--PATH addons/chatbox/lua/scb/vgui/scb_chat_line.lua:
if SCB_LOADED then return end

local timer = timer
local draw = draw
local surface = surface
local math = math
local table = table
local vgui = vgui

local Lerp = Lerp
local Color = Color
local DermaMenu = DermaMenu
local unpack = unpack
local IsValid = IsValid
local UnPredictedCurTime = UnPredictedCurTime
local RoundedBox = draw.RoundedBox
local sub = string.sub
local find = string.find
local gsub = string.gsub
local lower = string.lower

local scb = scb
local sui = sui
local SUI = scb.SUI
local config = scb.config
local language = scb.language

scb.chat_parsers = {}
local add_parser_example = function(title, example, output)
	table.insert(scb.chat_parsers, {title, example, output:format("change_me")})
end

do
	local available_colors = "\n\nAvailable Colors:\n"
	for k in pairs(config.colors) do
		available_colors = available_colors .. k .. " - "
	end
	available_colors = available_colors:sub(1, -4) .. "\n"

	add_parser_example("{cyan This text will be in cyan.}" .. available_colors, "{cyan What is this?}", "{cyan %s}")
end
add_parser_example("{#d4af37 This text will be in gold.}\nUsage: {#hex text}\n", "{#d4af37 Gold is my favourite color UwU}", "{#d4af37 %s}")
add_parser_example("{*This text will be in rainbow.}", "{*Nice rainbow text OwO}", "{*%s}")
add_parser_example("{!This text will be flashing in red.}", "{!OwO I like it ^-^}", "{!%s}")
add_parser_example("{!blue This text will be flashing in blue.}", "{!blue I love flashing blue ^~^}", "{!blue %s}")
add_parser_example("{!#d4af37 This text will be flashing in gold.}", "{!#d4af37 flashing & gold?}", "{!#d4af37 %s}")
add_parser_example("\\{*This text will be escaped.}", "\\{*This text will be escaped.}", "\\{*%s}")

local ESCAPE_CHAR = "\\"

local created_panels = {}

local Panel = {}

AccessorFunc(Panel, "m_bFont", "Font", FORCE_STRING)
AccessorFunc(Panel, "m_bPlayer", "Player")

local current_x
local current_line
local current_y, line_h
function Panel:Init()
	self:Dock(TOP)
	self:SetFont(SCB_18)

	self:InvalidateParent(true)

	self:SetAlpha(0)
	self:AlphaTo(255, 0.5)

	self:SetCursor("hand")

	self.text_color = SUI.GetColor("text_entry")

	self.added = {}

	-- Methods
	local children = {}
	function self:Add(pnl)
		pnl = vgui.Create(pnl, self)
		pnl.line = current_line
		table.insert(children, pnl)
		return pnl
	end
	function self:OnChildRemoved(child)
		for i = 1, #children do
			local v = children[i]
			if v == child then
				table.remove(children, i)
				return
			end
		end
	end
	function self:GetChildren()
		return children
	end
	--

	-- self.next_pos = 1350336069

	self:ScaleChanged()
	table.insert(created_panels, self)
end

function Panel:ScaleChanged()
	self:Clear()
	self:InvalidateParent(true)
	self:InvalidateLayout(true)

	current_x = 0
	current_line = 0
	current_y, line_h = 0, 0

	self.max_w = -1
	self.max_h = {0}
	self.text = ""

	self.emoji_size = 24

	self.parsing = true

	local added = self.added
	self.added = {}
	for i = 1, #added do
		local v = added[i]
		local v_1 = v[1]

		local func = (v_1 == 1 and self.NewLabel) or (v_1 == 2 and self.NewEmoji) or (v_1 == 3 and self.NewAvatar)
		func(self, unpack(v, 2, table.maxn(v)))

		added[i] = nil
	end

	self.parsing = nil
	self:SizeToChildren(false, true)
end

local hovered = Color(50, 50, 50, 150)
function Panel:Paint(w, h)
	if self.Hovered then
		RoundedBox(3, 0, 0, w, h, hovered)
	end
end

function Panel:DoRightClick()
	local d_menu = DermaMenu()
	local text = self.text
	d_menu:AddOption(language.copy_text, function()
		SetClipboardText(text)
	end)
	d_menu:Open()
	d_menu:MakePopup()
end

function Panel:OnMouseReleased(mousecode)
	if self.Hovered and mousecode == MOUSE_RIGHT then
		self:DoRightClick()
	end
end

function Panel:IncrementLine()
	current_x = 0
	current_line = current_line + 1
	current_y, line_h = current_y + line_h, 0
	self.max_h[current_line + 1] = 0
end

function Panel:SetLineH(h)
	if h > line_h then
		line_h = h
		self.max_h[current_line + 1] = h

		local childs = self:GetChildren()
		for i = #childs, 1, -1 do
			local v = childs[i]
			if v.line ~= current_line then break end
			v.y = self:GetCurrentY(v:GetTall())
		end
	end
end

function Panel:SizeToChildren(width, height)
	if self.parsing then return end

	if width then
		self:SetWide(self.max_w)
	end

	if height then
		self:SetTall(self:GetTotalH())
	end
end

function Panel:GetTotalH()
	local h = 0
	local max_h = self.max_h
	if max_h then
		for i = 1, #max_h do
			h = h + max_h[i]
		end
	end
	return h
end

function Panel:GetCurrentY(_h)
	local y = current_y
	if _h == line_h then return y end
	return math.floor((y + ((line_h / 2) - (_h / 2))) + 0.5)
end

function Panel:AddW(w)
	current_x = current_x + w

	if current_x > self.max_w then
		self.max_w = current_x
	end

	if current_x >= self:GetWide() then
		self:IncrementLine()
	end
end

function Panel:GetMessageW()
	return self.max_w
end

do
	local label_time

	local underline_color = Color(23, 115, 196)
	local url_underline = function(s, w, h)
		if s:IsHovered() then
			s:SetTextColor(underline_color)
		else
			s:SetTextColor(s.text_color)
		end
		RoundedBox(0, 0, h - 1, w, 1, s:GetTextColor())
	end

	local url_click = function(s)
		gui.OpenURL(s.url)
	end

	local url_right_click = function(s)
		local d_menu = DermaMenu()
		local url = s.url
		d_menu:AddOption(language.copy_url, function()
			SetClipboardText(url)
		end)
		d_menu:Open()
		d_menu:MakePopup()
	end

	local disable_rainbow_colors = GetConVar("scb_disable_rainbow_colors"):GetBool()
	cvars.AddChangeCallback("scb_disable_rainbow_colors", function(_, _, value_new)
		disable_rainbow_colors = tobool(value_new)
	end)
	local label_rainbow = function(s)
		if disable_rainbow_colors then
			s:SetTextColor(s.text_color)
			return
		end

		local r, g, b = sui.hsv_to_rgb((s.time + UnPredictedCurTime()) % 360 * 0.6, 1, 1)
		s:SetFGColor(r, g, b, s.text_color_obj.a)
	end

	local disable_flashing_texts = GetConVar("scb_disable_flashing_texts"):GetBool()
	cvars.AddChangeCallback("scb_disable_flashing_texts", function(_, _, value_new)
		disable_flashing_texts = tobool(value_new)
	end)
	local label_flash = function(s)
		if disable_flashing_texts then
			s:SetTextColor(s.text_color)
			return
		end

		local col = s.text_color_obj
		s:SetFGColor(col.r, col.g, col.b, (s.time + UnPredictedCurTime()) * 300 % 255)
	end

	function Panel:AddLabel(text, color, url, is_hovered, font)
		if text == "" then return end

		local w, h = surface.GetTextSize(text)
		self:SetLineH(h)

		local label = self:Add("SCB.Label")
		label:SetFont(font)
		label:SetText(text:sub(1, 1) == "#" and ("#" .. text) or text)
		label:SetExpensiveShadow(1, color_black)
		label:SetSize(w, h)
		label:SetPos(current_x, self:GetCurrentY(h))

		label.text_color = scb.type(color) == "Color" and color or self.text_color

		if color == "rainbow" or self.flashing then
			label.text_color_obj = Color(label.text_color:Unpack())
			label.time = label_time
			label.Paint = color == "rainbow" and label_rainbow or label_flash
		else
			label:SetTextColor(label.text_color)
		end

		if url then
			label:SetMouseInputEnabled(true)
			label:SetCursor("hand")
			label.Paint = url_underline
			label.DoClick = url_click
			label.DoRightClick = url_right_click
			label.url = url
			label.IsHovered = is_hovered
		end

		self.text = self.text .. text
		self:AddW(w)

		-- if scb.type(color) ~= "Color" then
			-- hook.Add("SCB.ThemeChanged", label, function(s)
			-- 	s.text_color = SUI.GetColor("text_entry")
			-- 	s:SetTextColor(s.text_color)
			-- end)
		-- end

		return label
	end

	local AddLabel = Panel.AddLabel
	local IncrementLine = Panel.IncrementLine
	function Panel:NewLabel(text, color, is_url, font)
		if text == "" then return end

		font = font or self:GetFont()
		table.insert(self.added, {1, text, color, is_url, flashing, font})

		local url
		if is_url then
			url = text
		end

		local wide = self:GetWide()
		text = sui.wrap_text(text, font, wide, wide - current_x)

		local urls, is_hovered
		if is_url then
			urls, is_hovered = {}, function()
				for k, v in ipairs(urls) do
					if v.Hovered then
						return true
					end
				end
			end
		end

		label_time = math.sin(UnPredictedCurTime()) + math.random()

		local lines = text:Split("\n")
		local lines_n = #lines
		for i = 1, lines_n do
			local v = lines[i]

			local line = current_line

			local label = AddLabel(self, v, color, url, is_hovered, font)
			if urls then
				table.insert(urls, label)
			end

			if i ~= lines_n and line == current_line then
				IncrementLine(self)
			end
		end

		self:SizeToChildren(false, true)
	end
end

function Panel:NewEmoji(name, info, size)
	local _size = size or self.emoji_size
	table.insert(self.added, {2, name, info, _size})

	if scb.isnumber(_size) then
		size = SUI.ScaleEven(_size)
	else
		size = tonumber(_size)
	end

	if size >= self:GetWide() - current_x then
		self:IncrementLine()
	end

	self:SetLineH(size)

	local image = self:Add("SCB.Image")
	image:SetImage(scb.is_custom_emoji(info) and info or ("scb/emojis/" .. name .. ".png"))
	image:SetSize(size, size)
	image:SetPos(current_x, self:GetCurrentY(size))

	if size == SUI.ScaleEven(24) then
		image:SetMinus(2)
	end

	self:AddW(size)

	self.text = self.text .. (":" .. name .. ":")

	self:SizeToChildren(false, true)

	return image
end

function Panel:NewAvatar(ply, size)
	table.insert(self.added, {3, ply, size})

	size = SUI.ScaleEven(size or 26)

	self:SetLineH(size)

	local avatar = self:Add("Panel")
	avatar:SetSize(size, size)
	avatar:SetPos(current_x, self:GetCurrentY(size))
	avatar:SetMouseInputEnabled(false)
	avatar:SUI_TDLib()
		:CircleAvatar()

	if scb.isentity(ply) then
		avatar:SetPlayer(ply, size)
	else
		avatar:SetSteamID(ply, size)
	end

	surface.SetFont(self:GetFont())
	self:AddW(size + surface.GetTextSize(" "))
end

function Panel:HideAfterTime(time)
	self.can_hide = false
	timer.Simple(time, function()
		if not IsValid(self) then return end
		self.can_hide = nil
		if scb.chatbox.hidden then
			self:AlphaTo(0, 0.5)
		end
	end)
end

do
	local NewLabel = Panel.NewLabel

	local trim = function(s)
		return s:match("^%s*(.-)%s*$") or s
	end

	local parse_arg = function(text)
		local arg = ""
		local i, n = 1, #text
		while i <= n do
			local c = sub(text, i, i)
			if c == " " then break end
			if c == "}" then break end
			arg = arg .. c

			i = i + 1
		end
		return lower(arg), i + 1
	end

	local color_parsers = {}
	for k, v in pairs(config.colors) do
		color_parsers[k] = {
			permission = "colored_texts",
			callback = function(self, text, arg)
				text = trim(text)
				if text == "" then return false end
				NewLabel(self, text, scb.hex_rgb(v))
			end
		}
	end

	local parsers; parsers = {
		["$"] = {
			callback = function(self, emoji, ply, color)
				emoji = lower(emoji)

				local emoji_info = scb.emojis[emoji]
				if emoji_info and not (scb.is_custom_emoji(emoji_info) and not scb.has_permission(ply, "custom_emojis")) then
					self:NewEmoji(emoji, emoji_info)
				else
					return false, ":" .. emoji .. ":"
				end
			end
		},
		["#"] = {
			permission = "colored_texts",
			callback = function(self, text, _, color)
				local hex_col, start = parse_arg(text)
				if #hex_col < 3 or not find(hex_col, "^[%da-fA-F]+$") then
					return false
				end
				text = trim(sub(text, start))
				if text == "" then return false end
				NewLabel(self, text, scb.hex_rgb(hex_col), nil, flashing)
			end
		},
		["*"] = {
			permission = "rainbow",
			callback = function(self, text, ...)
				text = trim(text)
				if text == "" then return false end
				NewLabel(self, text, "rainbow")
			end
		},
		["@"] = {
			callback = function(self, text)
				if scb.find_url(text) then
					NewLabel(self, text, nil, true)
				else
					return false
				end
			end
		},
		["!"] = {
			permission = "flashing",
			callback = function(self, text, ply)
				local ret

				self.flashing = true

				local arg, start = parse_arg(text)
				if scb.has_permission(ply, "colored_texts") then
					if sub(arg, 1, 1) == "#" then
						ret = parsers["#"].callback(self, sub(text, 2))
						goto skip
					elseif color_parsers[arg] then
						color_parsers[arg].callback(self, sub(text, start), "flash")
						goto skip
					end
				end

				text = trim(text)
				if text == "" then
					ret = false
					goto skip
				end
				NewLabel(self, text, Color(255, 0, 0))
				::skip::

				self.flashing = false

				return ret
			end
		}
	}

	local parse_between_braces = function(text, pos, len)
		local tmp_text = ""
		local end_pos = pos
		local closed = false
		local escape = false
		for i = pos, len do
			end_pos = i
			local c = sub(text, i, i)
			if escape then
				tmp_text = tmp_text .. c
				escape = false
				continue
			end
			if c == ESCAPE_CHAR then
				escape = true
			elseif c == "}" then
				closed = true
				break
			else
				tmp_text = tmp_text .. c
			end
		end
		return tmp_text, closed, end_pos
	end

	function Panel:Parse(text, color)
		self.parsing = true

		text = gsub(text, "()%:([%w_]+)%:", function(start, found)
			if text[start - 1] ~= ESCAPE_CHAR then
				return "{$" .. found .. "}"
			end
		end)

		do
			local pos = 0
			while true do
				local start, url, _end = scb.find_url(text, pos + 1)
				if not start then break end
				if text:sub(start - 1, start - 1) ~= ESCAPE_CHAR then
					text = text:sub(1, start - 1) .. ("{@" .. url .. "}") .. text:sub(_end + 1)
				end
				pos = _end + 1
			end
		end

		local ply = self:GetPlayer()

		local len = #text
		local tmp_text = ""
		local i = 0
		while true do
			i = i + 1
			if i > len then break end

			local c = sub(text, i, i)
			if c == ESCAPE_CHAR then
				tmp_text = tmp_text .. sub(text, i + 1, i + 1)
				i = i + 1
				continue
			end

			if c ~= "{" then
				tmp_text = tmp_text .. c
				continue
			end

			local ret_text, closed, end_pos = parse_between_braces(text, i + 1, len)
			if not closed then
				tmp_text = tmp_text .. sub(text, i, end_pos)
				break
			end

			local tag, tag_end = sub(ret_text, 1 , 1), 1
			if not scb.is_letter_digit(tag) then
				tag = parsers[tag]
			else
				for i2 = 2, #ret_text do
					local c2 = sub(ret_text, i2, i2)
					if not scb.is_letter_digit(c2) then break end
					tag = tag .. c2
					tag_end = tag_end + 1
				end
				tag_end = tag_end + 1
				tag = color_parsers[tag]
			end

			i = end_pos

			local failed_text = "{" .. ret_text .. "}"

			if tag == nil then
				tmp_text = tmp_text .. failed_text
				continue
			end

			local permission = tag.permission
			if permission and not scb.has_permission(ply, permission) then
				tmp_text = tmp_text .. failed_text
				continue
			end

			ret_text = sub(ret_text, tag_end + 1)

			NewLabel(self, tmp_text, color)
			local done, ret = tag.callback(self, ret_text, ply, color)
			if done == false then
				if ret then
					NewLabel(self, ret, color)
				else
					NewLabel(self, failed_text, color)
				end
			end
			tmp_text = ""
		end

		NewLabel(self, tmp_text, color)
		self.parsing = nil
		self:SizeToChildren(false, true)
	end
end

do
	local AnimationThink = function(s)
		local anim = s.anim
		if not anim then return end

		local time = UnPredictedCurTime()
		if time >= anim.start_time then
			local frac = math.TimeFraction(anim.start_time, anim.end_time, time)
			frac = math.Clamp(frac, 0, 1)

			s:SetAlpha(Lerp(frac ^ (1 - (frac - 0.5)), s:GetAlpha(), anim.alpha))

			if frac == 1 then
				s.anim = nil
				s.AnimationThink = nil
			end
		end
	end

	function Panel:AlphaTo(alpha, length)
		local time = UnPredictedCurTime()

		self.anim = {
			start_time = time,
			end_time = time + length,

			alpha = alpha
		}

		self.AnimationThink = AnimationThink
	end

	function Panel:Stop()
		self.anim = nil
	end
end

function Panel:OnRemove()
	for i = 1, #created_panels do
		if created_panels[i] == self then
			table.remove(created_panels, i)
			break
		end
	end
end

SUI.OnScaleChanged("ChatLines", function()
	timer.Simple(0, function()
		for i = 1, #created_panels do
			local v = created_panels[i]
			if v:IsValid() then
				v:ScaleChanged()
			end
		end
	end)
end)

sui.register("ChatLine", Panel, "Panel")
--PATH addons/sl_util_atm/lua/batm_scenes/personalaccount.lua:
--[[-------------------------------------------------------------------------
Draws the home screen, with aniamted lights, logo and some infomation
---------------------------------------------------------------------------]]
surface.CreateFont( "batm_small", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 45,
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

surface.CreateFont( "batm_accountselect_title_personalaccount", {
	font = "Coolvetica",
	extended = false,
	size = 75,
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

surface.CreateFont( "batm_personalaccount_button", {
	font = "Coolvetica",
	extended = false,
	size = 65,
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

local back = Material("bluesatm/back.png", "noclamp smooth")
local arrow = Material("bluesatm/arrow.png", "noclamp smooth")
local deposit = Material("bluesatm/deposit.png", "noclamp smooth")
local withdraw = Material("bluesatm/withdraw.png", "noclamp smooth")
local history = Material("bluesatm/history.png", "noclamp smooth")
local transfer = Material("bluesatm/transfer.png", "noclamp smooth")

local scene = {}
local ScrW = 1024 
local ScrH = 676
--Called when the scene is loaded
function scene.Load(ent)
	--deposit
	ent:AddButton(ScrW * 0.14,285,ScrW * 0.35, ScrH * 0.15, 
		function() --On pressed
			ent:SetScene("deposit")
		end
	)

	--history
	ent:AddButton(ScrW - ScrW * 0.35 - ScrW * 0.14,285,ScrW * 0.35, ScrH * 0.15, 
		function() --On pressed
			ent:SetScene("history")
		end
	)

	--Withdraw button
	ent:AddButton(ScrW * 0.14, ScrW * 0.4,ScrW * 0.35, ScrH * 0.15, 
		function() --On pressed
			ent:SetScene("withdraw")
		end
	)

	--Transfer button
	ent:AddButton(ScrW - ScrW * 0.35 - ScrW * 0.14,ScrW * 0.4,ScrW * 0.35, ScrH * 0.15, 
		function() --On pressed
			ent:SetScene("transfer")
		end
	)

	

	--back button
	ent:AddButton(35, 135, 64, 64, 
		function() --On pressed
			ent:SetScene("accountselection")
		end
	)	
end 

--Called when a user presses a button on the
function scene.OnKeypadPressed(ent, button)

end

local arrow = Material("bluesatm/arrow.png", "noclamp smooth")
local deposit = Material("bluesatm/deposit.png", "noclamp smooth")
local withdraw = Material("bluesatm/withdraw.png", "noclamp smooth")
local history = Material("bluesatm/history.png", "noclamp smooth")
local transfer = Material("bluesatm/transfer.png", "noclamp smooth")

--Draw code
function scene.Draw(ent, ScrW, ScrH)
 
	local account = BATM.GetPersonalAccount()

	if account == false then return end --Dont draw, big boi error

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw back button
	surface.SetDrawColor(Color(255,255,255,100))
	surface.SetMaterial(back)
	surface.DrawTexturedRect(35, 135, 64, 64)

	--Draw title
	draw.SimpleText(BATM.Lang["What would you like to do?"], "batm_accountselect_title_personalaccount", ScrW/2, 140, Color(255,255,255,255), 1)

	--Draw personal account button
	draw.RoundedBox(0,ScrW * 0.14,285,ScrW * 0.35, ScrH * 0.15, Color(231, 126, 34))
	draw.SimpleText(BATM.Lang["Deposit"], "batm_personalaccount_button",ScrW * 0.15, 285 + (ScrH * 0.15 / 2), Color(255,255,255,255), 0, 1)
	surface.SetDrawColor(255, 255, 255, 200)
	surface.SetMaterial(deposit) 
	surface.DrawTexturedRect( ScrW * 0.14 + ScrW * 0.275, 285 + 22, 56, 44 )

	draw.RoundedBox(0,ScrW - ScrW * 0.35 - ScrW * 0.14,285,ScrW * 0.35, ScrH * 0.15, Color(50, 151, 219))
	draw.SimpleText(BATM.Lang["History"], "batm_personalaccount_button",ScrW - ScrW * 0.35 - ScrW * 0.14 + ScrW * 0.01, 285 + (ScrH * 0.15 / 2), Color(255,255,255,255), 0, 1)
	surface.SetDrawColor(255, 255, 255, 200)
	surface.SetMaterial(history) 
	surface.DrawTexturedRect(ScrW - ScrW * 0.35 - ScrW * 0.14 + ScrW * 0.275, 285 + 22, 56, 44 )


	draw.RoundedBox(0,ScrW * 0.14, ScrW * 0.4,ScrW * 0.35, ScrH * 0.15, Color(45, 204, 112))
	draw.SimpleText(BATM.Lang["Withdraw"], "batm_personalaccount_button",ScrW * 0.15, ScrW * 0.4 + (ScrH * 0.15 / 2), Color(255,255,255,255), 0, 1)
	surface.SetDrawColor(255, 255, 255, 200)
	surface.SetMaterial(withdraw) 
	surface.DrawTexturedRect( ScrW * 0.14 + ScrW * 0.275, ScrW * 0.4 + 22, 56, 44 )

	draw.RoundedBox(0,ScrW - ScrW * 0.35 - ScrW * 0.14,ScrW * 0.4,ScrW * 0.35, ScrH * 0.15, Color(232, 76, 61))
	draw.SimpleText(BATM.Lang["Transfer"], "batm_personalaccount_button",ScrW - ScrW * 0.35 - ScrW * 0.14 + ScrW * 0.01, ScrW * 0.4 + (ScrH * 0.15 / 2), Color(255,255,255,255), 0, 1)
	surface.SetDrawColor(255, 255, 255, 200)
	surface.SetMaterial(transfer) 
	surface.DrawTexturedRect( ScrW - ScrW * 0.35 - ScrW * 0.14 + ScrW * 0.275, ScrW * 0.4 + 22, 56, 44 )

	draw.SimpleText(BATM.Lang["$"]..CBLib.Helper.CommaFormatNumber(account.balance), "batm_personalaccount_button", ScrW / 2, ScrH * 0.88, Color(255,255,255,255), 1, 1)

	BATM.Scenes["cursor"].Draw(ent, ScrW, ScrH)

end 

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when a the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "personalaccount")
--PATH addons/sl_util_atm/lua/batm_scenes/deposit.lua:
--[[-------------------------------------------------------------------------
Draws the deposit screen
---------------------------------------------------------------------------]]

surface.CreateFont( "batm_deposite_title", {
	font = "Coolvetica",
	extended = false,
	size = 100,
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

surface.CreateFont( "batm_deposite_text", {
	font = "Coolvetica",
	extended = false,
	size = 65,
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
scene.enteredAmount = 0
local ScrW = 1024
local ScrH = 676
--Called when the scene is loaded
function scene.Load(ent)
	scene.enteredAmount = 0 --Reset it

	--done button
	ent:AddButton(ScrW/2 - 300, ScrH / 2 + 110, 600, 90, 
		function() --On pressed
			if BATM.VerifyNumber(scene.enteredAmount) then
				ent:SetScene("loading")
				BATM.Deposit(ent, scene.enteredAmount or 0)
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

--Called when a user presses a button on the
function scene.OnKeypadPressed(ent, button)
	--Now lets make sure its not zero
	if isnumber(button) then
		--Append it
		local stringAmount = tostring(scene.enteredAmount)
		if string.len(stringAmount) > 13 then return end --Prevent overflow
		stringAmount = stringAmount..button

		if tonumber(stringAmount) == 0 then return end

		scene.enteredAmount = tonumber(stringAmount)

		return
	end

	if button == "clear" then
		if scene.enteredAmount ~= 0 then
			local stringAmount = tostring(scene.enteredAmount)
			stringAmount = string.sub(stringAmount, 1, string.len(stringAmount) - 1)
			if tonumber(stringAmount) == nil or tonumber(stringAmount) < 0 then
				stringAmount = "0"
			end
			scene.enteredAmount = tonumber(stringAmount)
			return
		end
	end

	if button == "enter" then
		if BATM.VerifyNumber(scene.enteredAmount) then
			ent:SetScene("loading")
			BATM.Deposit(ent, scene.enteredAmount or 0)
		end
	end
end

local back = Material("bluesatm/back.png", "noclamp smooth")

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw back button
	surface.SetDrawColor(Color(255,255,255,100))
	surface.SetMaterial(back)
	surface.DrawTexturedRect(35, 135, 64, 64)

	--Draw title
	draw.SimpleText(BATM.Lang["Deposit"], "batm_deposite_title", ScrW/2, 155, Color(233,233,233,255), 1)

	--Deposite box
	draw.RoundedBox(0, ScrW/2 - 300, ScrH / 2, 600, 90, Color(255,255,255,255))
	if scene.enteredAmount == 0 then
		draw.SimpleText(BATM.Lang["Enter Amount"], "batm_deposite_text", ScrW/2, (ScrH/2) + 45, Color(194,194,194,255), 1, 1)
	else
		draw.SimpleText(BATM.Lang["$"]..CBLib.Helper.CommaFormatNumber(scene.enteredAmount), "batm_deposite_text", ScrW/2, (ScrH/2) + 45, Color(194,194,194,255), 1, 1)
	end

	--Draw done button
	draw.RoundedBox(0, ScrW/2 - 300, ScrH / 2 + 110, 600, 90, Color(231, 126, 34,255))
	draw.SimpleText(BATM.Lang["Done"], "batm_deposite_text", ScrW/2, (ScrH/2) + 110 + 45, Color(255,255,255,255), 1, 1)

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
BATM.RegisterScene(scene, "deposit")

--PATH addons/sl_util_atm/lua/batm_scenes/done.lua:
--[[-------------------------------------------------------------------------
Draws the done deposite screen
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
	draw.SimpleText(BATM.Lang["Deposit Complete"], "batm_done_text", ScrW/2, ScrH - 150, Color(255,255,255,100), 1)

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
BATM.RegisterScene(scene, "done")

--PATH addons/sl_util_atm/lua/batm_scenes/transfer_amount.lua:
--[[-------------------------------------------------------------------------
Draws the transfer amount funds page
---------------------------------------------------------------------------]]

surface.CreateFont( "batm_tranfer_amount_title", {
	font = "Coolvetica",
	extended = false,
	size = 70,
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

surface.CreateFont( "batm_tranfer_amount_text", {
	font = "Coolvetica",
	extended = false,
	size = 65,
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

scene.enteredAmount = 0

local ScrW = 1024
local ScrH = 676

--The player we are targeting
scene.targetPlayer = nil
scene.targetPlayerName = "ERROR"

--Called when the scene is loaded
function scene.Load(ent)
	scene.enteredAmount = 0 --Reset it
 
	--done button
	ent:AddButton(ScrW/2 - 300, ScrH / 2 + 110, 600, 90, 
		function() --On pressed
			if BATM.VerifyNumber(scene.enteredAmount) then
				ent:SetScene("loading")
				BATM.Transfer(ent, scene.targetPlayer, scene.enteredAmount or 0)
			end
		end
	)

	--back button
	ent:AddButton(35, 135, 64, 64, 
		function() --On pressed
			ent:SetScene("transfer")
		end
	)
end

--Called when a user presses a button on the
function scene.OnKeypadPressed(ent, button)
	--Now lets make sure its not zero
	if isnumber(button) then
		--Append it
		local stringAmount = tostring(scene.enteredAmount)
		if string.len(stringAmount) > 13 then return end --Prevent overflow
		stringAmount = stringAmount..button

		if tonumber(stringAmount) == 0 then return end

		scene.enteredAmount = tonumber(stringAmount)

		return
	end

	if button == "clear" then
		if scene.enteredAmount ~= 0 then
			local stringAmount = tostring(scene.enteredAmount)
			stringAmount = string.sub(stringAmount, 1, string.len(stringAmount) - 1)
			if tonumber(stringAmount) == nil or tonumber(stringAmount) < 0 then
				stringAmount = "0"
			end
			scene.enteredAmount = tonumber(stringAmount)
			return
		end
	end

	if button == "enter" then
		if BATM.VerifyNumber(scene.enteredAmount) then
			ent:SetScene("loading")
			BATM.Transfer(ent, scene.targetPlayer, scene.enteredAmount or 0)
		end
	end
end

local back = Material("bluesatm/back.png", "noclamp smooth")

--Draw code
function scene.Draw(ent, ScrW, ScrH)

	--Draw the background
	BATM.Scenes["background"].Draw(ent, ScrW, ScrH)

	--Draw back button
	surface.SetDrawColor(Color(255,255,255,100))
	surface.SetMaterial(back)
	surface.DrawTexturedRect(35, 135, 64, 64)

	--Draw title
	draw.SimpleText(BATM.Lang["Transfer funds to"], "batm_tranfer_amount_title", ScrW/2, 155, Color(233,233,233,255), 1)
	draw.SimpleText(scene.targetPlayerName, "batm_tranfer_amount_title", ScrW/2, 155 + 65, Color(233,233,233,255), 1)
	--Deposite box
	draw.RoundedBox(0, ScrW/2 - 300, ScrH / 2, 600, 90, Color(255,255,255,255))
	if scene.enteredAmount == 0 then
		draw.SimpleText(BATM.Lang["Enter Amount"] , "batm_tranfer_amount_text", ScrW/2, (ScrH/2) + 45, Color(194,194,194,255), 1, 1)
	else
		draw.SimpleText(BATM.Lang["$"]..CBLib.Helper.CommaFormatNumber(scene.enteredAmount), "batm_tranfer_amount_text", ScrW/2, (ScrH/2) + 45, Color(194,194,194,255), 1, 1)
	end

	--Draw done button
	draw.RoundedBox(0, ScrW/2 - 300, ScrH / 2 + 110, 600, 90, Color(231, 126, 34,255))
	draw.SimpleText(BATM.Lang["Done"], "batm_tranfer_amount_text", ScrW/2, (ScrH/2) + 110 + 45, Color(255,255,255,255), 1, 1)

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
BATM.RegisterScene(scene, "transfer_amount")

--PATH lua/catmullromcams/stools/sh_map_io_editor.lua:
local STool = {}

CatmullRomCams.SToolMethods.MapIOEditor = STool

function STool.LeftClick(self, trace)
	if not self:ValidTrace(trace) then return end
	
	local dur = self:GetClientNumber("duration") or 2
	
	trace.Entity:SetNWFloat("Duration", (dur > 0.001) and dur or 0.001)
	
	return true
end

function STool.RightClick(self, trace)
	if not self:ValidTrace(trace) then return end
	
	local dur = trace.Entity:GetNWFloat("Duration") or 2
	
	self:GetOwner():ConCommand("catmullrom_camera_duration_duration " .. ((dur > 0.001) and dur or 0.001) .. "\n")
	
	return true
end

function STool.Reload(self, trace)
	if not self:ValidTrace(trace) then return end
	
	trace.Entity.MapIOData ={}
	
	return true
end

function STool.Think(self)
	if SERVER then return end
	
	local ply = LocalPlayer()
	local trace = ply:GetEyeTrace()
	
	if not self:ValidTrace(trace) then return end
	if not trace.Entity.MapIOData then return end
	
	local msg = "OnUser1: " .. (trace.Entity.MapIOData.User1 and "ACTIVE" or "INACTIVE") .. "\n" .. "OnUser2: " .. (trace.Entity.MapIOData.User2 and "ACTIVE" or "INACTIVE") .. "\n" .. "OnUser3: " .. (trace.Entity.MapIOData.User3 and "ACTIVE" or "INACTIVE") .. "\n" .. "OnUser4: " .. (trace.Entity.MapIOData.User4 and "ACTIVE" or "INACTIVE")
	
	AddWorldTip(trace.Entity:EntIndex(), msg, 0.5, trace.Entity:GetPos(), trace.Entity )
end

function STool.BuildCPanel(panel)
	panel:AddControl("CheckBox", {Label = "OnUser1", Command = "catmullrom_camera_map_io_user1"})
	panel:AddControl("CheckBox", {Label = "OnUser2", Command = "catmullrom_camera_map_io_user2"})
	panel:AddControl("CheckBox", {Label = "OnUser3", Command = "catmullrom_camera_map_io_user3"})
	panel:AddControl("CheckBox", {Label = "OnUser4", Command = "catmullrom_camera_map_io_user4"})
end
--PATH addons/squad_reborn/lua/squads/client/cl_squad_gfx.lua:
surface.CreateFont( "bebas_48" , {
    font = "Bebas Neue" ,
    size = 48
} )

surface.CreateFont( "bebas_18" , {
    font = "Bebas Neue" ,
    size = 20
} )

function createFonts( )
    surface.CreateFont( "bebas_48_hud" , {
        font = "Bebas Neue" ,
        size = 48 * SQUAD.Config.HUDScale
    } )

    surface.CreateFont( "bebas_18_hud" , {
        font = "Bebas Neue" ,
        size = 20
    } )
end

createFonts( )

for k , v in pairs( player.GetAll( ) ) do
    if ( IsValid( v.AvatarImage ) ) then
        v.AvatarImage:Remove( )
    end
end

local space = 0
local posX = 64
local posY = 220
local tX = 0
local ply = nil
local mic = Material( "icon16/sound.png" )

hook.Add( "HUDPaint" , "Squad.HUDPaint" , function( )
    if ( not IsValid( ply ) and IsValid( LocalPlayer( ) ) ) then
        ply = LocalPlayer( )
    end

    local sc = SQUAD.Config.HUDScale

    if ( LocalPlayer( ):GetSquadName( ) ~= "" ) then
        local alpha = SQUAD.Config.HUDOpacity
        local members = ply:GetSquadMembers( ) or { }
        local biggerX = 0
        local fx , _ = draw.SimpleText( LocalPlayer( ):GetSquadName( ) , "bebas_48_hud" , posX , posY , Color( 170 , 255 , 100 , alpha ) , TEXT_ALIGN_LEFT , TEXT_ALIGN_BOTTOM )
        draw.SimpleText( LocalPlayer( ):GetSquad( ).Name , "bebas_48_hud" , posX + fx + 8 , posY , Color( 255 , 255 , 255 , alpha ) , TEXT_ALIGN_LEFT , TEXT_ALIGN_BOTTOM )

        for k , v in pairs( members ) do
            k = k - 1

            if ( IsValid( v.AvatarImage ) ) then
                v.AvatarImage:PaintManual( )
                v.AvatarImage:SetPos( posX + k * space , posY + ( 64 * sc ) * k - 38 )
            elseif ( IsValid( v ) ) then
                v.AvatarImage = vgui.Create( "AvatarImage" )
                v.AvatarImage:SetSize( 32 * sc , 32 * sc )
                v.AvatarImage:SetPlayer( v , 32 )
                v.AvatarImage:SetPaintedManually( true )
                v.AvatarImage:SetPos( posX + k * space , posY + ( 64 * sc ) * k )
                v.AvatarImage.Player = v

                v.AvatarImage.Think = function( s )
                    if ( not IsValid( s.Player ) ) then
                        s:Remove( )

                        return
                    end

                    if ( not IsValid( s ) ) then
                        s:Remove( )

                        return
                    end

                    s:SetPos( posX + k * space , posY + ( 62 * sc ) * k + 48 * sc - 32 * sc - 4 )

                    if ( s.Player:GetSquadName( ) ~= LocalPlayer( ):GetSquadName( ) or s.Player:GetSquadName( ) == "" ) then
                        s:Remove( )
                    end
                end
            else
                table.RemoveByValue( SQUAD.Groups[ LocalPlayer( )._squad ].Members , v )

                return
            end

            k = k + 0.5
            tX , _ = draw.SimpleText( "- " .. v:Name( ) , "bebas_48_hud" , posX + k * space + 42 * sc , posY + ( 62 * sc ) * k + 48 * sc - 74 * sc , Color( 255 , 255 , 255 , v:Alive( ) and alpha - math.min( v.DamageHUD or 0 , alpha ) or 50 ) , TEXT_ALIGN_LEFT , TEXT_ALIGN_TOP )

            if ( ( v.DamageHUD or 0 ) > 0 ) then
                draw.SimpleText( "- " .. v:Name( ) , "bebas_48_hud" , posX + k * space + 42 * sc , posY + ( 62 * sc ) * k + 48 * sc - 74 * sc , Color( 255 , 0 , 0 , math.min( v.DamageHUD , alpha ) ) , TEXT_ALIGN_LEFT , TEXT_ALIGN_TOP )
                v.DamageHUD = Lerp( FrameTime( ) * 2 , v.DamageHUD , -5 )
            end

            k = k - 0.5
            local wdx = math.max( tX + 42 + 48 , ScrW( ) / 8 )

            if ( wdx > biggerX ) then
                biggerX = wdx
            else
                wdx = biggerX
            end

            surface.SetDrawColor( 255 , 255 , 255 , alpha / 5 )
            surface.DrawRect( posX + k * space , posY + ( 62 * sc ) * k + 48 * sc , wdx , 1 )
            local tbX , _ = draw.SimpleText( math.max( v:Health( ) , 0 ).." / "..v:GetMaxHealth() , "bebas_18_hud" , posX + k * space + wdx , posY + ( 62 * sc ) * k + 48 * sc - 16 , v:GetHealthColor( v:Alive( ) and alpha or 50 ) , TEXT_ALIGN_RIGHT , TEXT_ALIGN_BOTTOM )
            draw.SimpleText( v:Armor( ) , "bebas_18_hud" , posX + k * space + wdx , posY + ( 62 * sc ) * k + 48 * sc , Color( 255 , 255 , 255 , v:Alive( ) and ( alpha * 0.75 ) or 50 ) , TEXT_ALIGN_RIGHT , TEXT_ALIGN_BOTTOM )
            draw.SimpleText( "HP: " , "bebas_18_hud" , posX + k * space + wdx - tbX , posY + ( 62 * sc ) * k + 48 * sc - 16 , Color( 255 , 255 , 255 , v:Alive( ) and ( alpha * 0.75 ) or 50 ) , TEXT_ALIGN_RIGHT , TEXT_ALIGN_BOTTOM )
            draw.SimpleText( "AP: " , "bebas_18_hud" , posX + k * space + wdx - tbX , posY + ( 62 * sc ) * k + 48 * sc , Color( 255 , 255 , 255 , v:Alive( ) and ( alpha * 0.75 ) or 50 ) , TEXT_ALIGN_RIGHT , TEXT_ALIGN_BOTTOM )

            if ( v:GetNWBool( "Squad.Voice" , false ) and v.DoingVoice ) then
                draw.NoTexture( )
                local x = posX + k * space + wdx + 12
                local y = posY + ( 62 * sc ) * k + 48 * sc - 24
                draw.gsArc( x + 12 , y + 8 , 0 , 16 * v:VoiceVolume( ) , 0 , 361 , 1 , Color( 255 , 255 , 255 , alpha * 0.8 + math.cos( RealTime( ) * 8 ) * 55 ) )
                surface.SetDrawColor( color_white )
                surface.SetMaterial( mic )
                surface.DrawTexturedRect( x + 4 , y , 16 , 16 )
            end
        end

        render.SetBlend( 1 )
    end
end )

local openFactor = 0

hook.Add( "PostDrawTranslucentRenderables" , "Squad.DrawMinimap" , function( )
    if ( IsValid( ply ) and ply:GetSquadName( ) ~= "" and not vgui.CursorVisible()) then
        if ( input.IsKeyDown( SQUAD.Config.MinimapKey ) ) then
            openFactor = Lerp( FrameTime( ) * 2 , openFactor , 0.2 )
        elseif ( openFactor > 0 ) then
            openFactor = Lerp( FrameTime( ) * 8 , openFactor , -0.25 )
        end

        if ( openFactor <= 0 ) then return end
        cam.IgnoreZ( true )
        cam.Start3D2D( ply:GetPos( ) , Angle( 0 , 180 , 180 ) , openFactor )
        draw.NoTexture( )

        draw.gsArc( 0 , 0 , 1024 , 32 , 0 , 368 , 0.8 , Color( 255 , 255 , 255 , 50 ) )

        for k , v in pairs( ply:GetSquadMembers( ) ) do
            if ( v:IsValid() and v ~= ply ) then
                local dist = math.Clamp( v:GetPos( ):Distance( ply:GetPos( ) ) , -1024 , 1024 )
                local ang = math.rad( angleBetweenPoints( ply:GetPos( ) , v:GetPos( ) ) + 180 )
                local angB = angleBetweenPoints( Vector( math.cos( ang ) * dist , math.sin( ang ) * dist , 0 ) , Vector( 0 , 0 , 0 ) )
                draw.gsArc( math.cos( ang ) * dist / 2 , math.sin( ang ) * dist / 2 , dist / 2 , 2 , -angB , -angB + 184 , 1 , Color( v:GetPlayerColor( ).x * 255 , v:GetPlayerColor( ).y * 255 , v:GetPlayerColor( ).z * 255 , 100 ) )
                draw.gsArc( math.cos( ang ) * dist , math.sin( ang ) * dist , 24 , 24 , 0 , 365 , 1 , Color( v:GetPlayerColor( ).x * 255 , v:GetPlayerColor( ).y * 255 , v:GetPlayerColor( ).z * 255 ) )
            end
        end

        draw.gsArc( 0 , 0 , 16 , 16 , 0 , 361 , 0.8 , Color( 255 , 255 , 255 , 255 ) )
        cam.End3D2D( )
        cam.IgnoreZ( false )

        for k , v in pairs( ply:GetSquadMembers( ) ) do
            local ang = math.rad( angleBetweenPoints( ply:GetPos( ) , v:GetPos( ) ) - 4 + 180 )
            local dist = math.Clamp( v:GetPos( ):Distance( ply:GetPos( ) ) , -1024 , 1024 ) * ( openFactor / 0.2 )
            cam.IgnoreZ( true )
            cam.Start3D2D( ply:GetPos( ) - Vector( math.cos( ang ) * dist / 5 , math.sin( ang ) * dist / 5 , 0 ) , Angle( 0 , math.deg( ang ) + 90 , 0 ) , openFactor )

            if ( v ~= ply ) then
                draw.SimpleText( v:Nick( ) , "bebas_48" , 4 , -24 , color_white )
            end

            cam.End3D2D( )
            cam.IgnoreZ( false )
        end
    end
end )

net.Receive( "Squad.SendPlyDamage" , function( )
    net.ReadEntity( ).DamageHUD = 255
end )

function SQUAD.PlyMeta:GetHealthColor( a )
    local col = Color( 231 , 76 , 60 , a )

    if ( self:Health( ) > 30 ) then
        if ( self:Health( ) < 50 ) then
            col = Color( 230 , 126 , 34 , a )
        elseif ( self:Health( ) < 75 ) then
            col = Color( 241 , 196 , 15 , a )
        else
            col = Color( 46 , 204 , 113 , a )
        end
    end

    return col
end

--https://facepunch.com/showthread.php?t=1509349&p=49878319&viewfull=1#post49878319
local blur = Material( "pp/blurscreen" )
local scrw = ScrW( )
local scrh = ScrH( )

function util.DrawBlur( p , a , d )
    local x , y = p:LocalToScreen( 0 , 0 )
    surface.SetDrawColor( 255 , 255 , 255 )
    surface.SetMaterial( blur )

    for i = 1 , d do
        blur:SetFloat( "$blur" , ( i / d ) * a )
        blur:Recompute( )
        render.UpdateScreenEffectTexture( )
        surface.DrawTexturedRect( x * -1 , y * -1 , scrw , scrh )
    end
end

--PATH addons/simplistic_presentation/lua/simplistic_presentation/lib/material-avatar.lua:
local AVATAR_IMAGE_CACHE_EXPIRES = 86400 -- 1 day, in seconds

local function getAvatarMaterial(steamid64, callback)
	-- First, check the cache to see if this avatar has already been downloaded.
	-- If the avatar hasn't been cached in data/, file.Time will return 0.
	-- If an avatar material is 1 day old, let's redownload it but use it as a fallback in case something goes wrong.
	local fallback
	if os.time() - file.Time("avatars/" .. steamid64 .. ".png", "DATA") > AVATAR_IMAGE_CACHE_EXPIRES then
		fallback = Material("../data/avatars/" .. steamid64 .. ".png", "smooth")
	elseif os.time() - file.Time("avatars/" .. steamid64 .. ".jpg", "DATA") > AVATAR_IMAGE_CACHE_EXPIRES then
		fallback = Material("../data/avatars/" .. steamid64 .. ".jpg", "smooth")
	end

	-- If a fallback couldn't be found in data/, default to vgui/avatar_default
	if not fallback or fallback:IsError() then
		fallback = Material("vgui/avatar_default")
	else
		-- Otherwise, if a cached avatar was found, and it hasn't expired, return it!
		return callback(fallback)
	end

	-- Fetch the XML version of the player's Steam profile.
	-- This XML contains a tag, <avatarFull> which contains the URL to their full avatar.
	http.Fetch("https://steamcommunity.com/profiles/" .. steamid64 .. "?xml=1",
	
		function(body, size, headers, code)
			-- If the HTTP request fails (size = 0, code is not a HTTP success response code) then return the fallback
			if size == 0 or code < 200 or code > 299 then return callback(fallback, steamid64) end

			local url, fileType = body:match("<avatarFull>.-(https?://%S+%f[%.]%.)(%w+).-</avatarFull>") -- Extract the URL and file extension from <avatarFull>
			if not url or not fileType then return callback(fallback, steamid64) end -- If the URL or file type couldn't be extracted, return the fallback.
			if fileType == "jpeg" then fileType = "jpg" end -- Defensively ensure jpeg -> jpg.

			-- Download the avatar image
			http.Fetch(url .. fileType,
				
				function(body, size, headers, code)
					if size == 0 or code < 200 or code > 299 then return callback(fallback, steamid64) end

					local cachePath = "avatars/" .. steamid64 .. "." .. fileType
					file.CreateDir("avatars")
					file.Write(cachePath, body) -- Write the avatar to data/

					local material = Material("../data/" .. cachePath, "smooth") -- Load the avatar from data/ as a Material
					if material:IsError() then
						-- If the material errors, the image must be corrupt, so we'll delete this from data/ and return the fallback.
						file.Delete(cachePath)
						callback(fallback, steamid64)
					else
						-- We succeeded, return the downloaded avatar image material!
						callback(material, steamid64)
					end

				end,

				-- If we hard-fail, return the fallback image.
				function() callback(fallback, steamid64) end

			)
		end,
		
		-- If we hard-fail, return the fallback image.
		function() callback(fallback, steamid64) end
	)
end

-- We don't want to fill the user's hard drive up with avatars over time, so we'll clear them whenever they join the server.
-- This also has the added benefit of allowing the user to "manually" regenerate avatars if they so desire.
local function clearCachedAvatars()
	for _, f in ipairs( ( file.Find("avatars/*", "DATA") ) ) do
		file.Delete("avatars/" .. f)
	end

	hook.Remove("InitPostEntity", "clearCachedAvatars") -- Just to be safe.
end
hook.Add("InitPostEntity", "clearCachedAvatars", clearCachedAvatars)

return getAvatarMaterial
--PATH addons/the_sit_anywhere_script/lua/autorun/sitanywhere.lua:
if SERVER then
	AddCSLuaFile("sitanywhere/client/sit.lua")
	AddCSLuaFile("sitanywhere/helpers.lua")
	include("sitanywhere/helpers.lua")
	include("sitanywhere/server/sit.lua")

	AddCSLuaFile("sitanywhere/ground_sit.lua")
	include("sitanywhere/server/unstuck.lua")
	include("sitanywhere/ground_sit.lua")
else
	include("sitanywhere/helpers.lua")
	include("sitanywhere/client/sit.lua")

	include("sitanywhere/ground_sit.lua")
end
--PATH addons/the_sit_anywhere_script/lua/sitanywhere/helpers.lua:
SitAnywhere = SitAnywhere or {}
SitAnywhere.NET = {
	["SitWantedAng"] = 0,
	["SitRequestExit"] = 1,
}

SitAnywhere.ClassBlacklist = {
	["gmod_wire_keyboard"] = true,
	["prop_combine_ball"] = true
}

SitAnywhere.DoNotParent = {
	["yava_chunk"] = true
}
SitAnywhere.ModelBlacklist = {
}

local EMETA = FindMetaTable"Entity"

function SitAnywhere.GetAreaProfile(pos, resolution, simple)
	local filter = player.GetAll()
	local dists = {}
	local distsang = {}
	local ang_smallest_hori = nil
	local smallest_hori = 90000
	local angPerIt = (360 / resolution)
	for I = 0, 360, angPerIt do
		local rad = math.rad(I)
		local dir = Vector(math.cos(rad), math.sin(rad), 0)
		local trace = util.QuickTrace(pos + dir * 20 + Vector(0,0,5), Vector(0,0,-15000), filter)
		trace.HorizontalTrace = util.QuickTrace(pos + Vector(0,0,5), dir * 1000, filter)
		trace.Distance  =  trace.StartPos:Distance(trace.HitPos)
		trace.Distance2 = trace.HorizontalTrace.StartPos:Distance(trace.HorizontalTrace.HitPos)
		trace.ang = I

		if (not trace.Hit or trace.Distance > 14) and (not trace.HorizontalTrace.Hit or trace.Distance2 > 20) then
			if simple then return true end
			table.insert(dists, trace)
		end
		if trace.Distance2 < smallest_hori and (not trace.HorizontalTrace.Hit or trace.Distance2 > 3) then
			smallest_hori = trace.Distance2
			ang_smallest_hori = I
		end
		distsang[I] = trace
	end

	if simple then return false end
	return dists, distsang, ang_smallest_hori, smallest_hori
end

function SitAnywhere.CheckValidAngForSit(pos, surfaceAng, ang)
	local rad = math.rad(ang)
	local dir = Vector(math.cos(rad), math.sin(rad), 0)
	local trace2 = util.TraceLine({
		start = pos - dir * (20 - .5) + surfaceAng:Forward() * 5,
		endpos = pos - dir * (20 - .5) + surfaceAng:Forward() * -160,
		filter = player.GetAll()
	})

	local hor_trace = util.TraceLine({
		start = pos + Vector(0, 0, 5),
		endpos = pos + Vector(0, 0, 5) - dir * 1600,
		filter = player.GetAll()
	})

	return hor_trace.StartPos:Distance(hor_trace.HitPos) > 20 and trace2.StartPos:Distance(trace2.HitPos) > 14
end


local SitOnEntsMode = CreateConVar("sitting_ent_mode","3", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "0 = No entities\n1 = World entities only\n2 = Self-Owned, World, Unowned\n3 = Any Entity", 0, 3)
--[[
	0 - Can't sit on any ents
	1 - Can't sit on any player ents
	2 - Can only sit on your own ents
	3 - Any
]]

local blacklist = SitAnywhere.ClassBlacklist
local model_blacklist = SitAnywhere.ModelBlacklist
function SitAnywhere.ValidSitTrace(ply, EyeTrace)
	if not EyeTrace.Hit then return false end
	if EyeTrace.HitPos:Distance(EyeTrace.StartPos) > 100 then return false end
	local t = hook.Run("CheckValidSit", ply, EyeTrace)

	if t == false or t == true then
		return t
	end

	if not EyeTrace.HitWorld and SitOnEntsMode:GetInt() == 0 then return false end
	if not EyeTrace.HitWorld and blacklist[string.lower(EyeTrace.Entity:GetClass())] then return false end
	if not EyeTrace.HitWorld and EyeTrace.Entity:GetModel() and model_blacklist[string.lower(EyeTrace.Entity:GetModel())] then return false end


	if EMETA.CPPIGetOwner and SitOnEntsMode:GetInt() >= 1 then
		if SitOnEntsMode:GetInt() == 1 then
			if not EyeTrace.HitWorld then
				local owner = EyeTrace.Entity:CPPIGetOwner()
				if type(owner) == "Player" and owner ~= nil and owner:IsValid() and owner:IsPlayer() then
					return false
				end
			end
		elseif SitOnEntsMode:GetInt() == 2 then
			if not EyeTrace.HitWorld then
				local owner = EyeTrace.Entity:CPPIGetOwner()
				if type(owner) == "Player" and owner ~= nil and owner:IsValid() and owner:IsPlayer() and owner ~= ply then
					return false
				end
			end
		end
	end
	return true
end

local seatClass = "prop_vehicle_prisoner_pod"
local PMETA = FindMetaTable"Player"
function PMETA:GetSitters()
	local seats, holders = {}, {}

	local function processSeat(seat, depth)
		depth = (depth or 0) + 1
		if IsValid(seat:GetDriver()) and seat:GetDriver() ~= self then
			table.insert(seats, seat)
		end
		for _, v in pairs(seat:GetChildren()) do
			if IsValid(v) and v:GetClass() == seatClass and IsValid(v:GetDriver()) and #v:GetChildren() > 0 and depth <= 128 then
				processSeat(v, depth)
			end
		end
	end

	local plyVehicle = self:GetVehicle()
	if IsValid(plyVehicle) and plyVehicle:GetClass() == seatClass then
		processSeat(plyVehicle)
	end

	for _, v in pairs(self:GetChildren()) do
		if IsValid(v) and v:GetClass() == seatClass then
			processSeat(v)
		end
	end

	for _, v in pairs(ents.FindByClass("sit_holder")) do
		if v.GetTargetPlayer and v:GetTargetPlayer() == self then
			table.insert(holders, v)
			if v.GetSeat and IsValid(v:GetSeat()) then
				processSeat(v:GetSeat())
			end
		end
	end
	return seats, holders
end

function PMETA:IsPlayerSittingOn(ply)
	local seats = ply:GetSitters()
	for _,v in pairs(seats) do
		if IsValid(v:GetDriver()) and v:GetDriver() == self then return true end
	end
	return false
end

function PMETA:GetSitting()
	if not IsValid(self:GetVehicle()) then return false end
	local veh = self:GetVehicle()
	if veh:GetNWBool("playerdynseat", false) then
		local parent = veh:GetParent()
		if IsValid(parent) and parent:GetClass() == "sit_holder" then
			return veh, parent
		else
			return veh
		end
	end
	return false
end

function PMETA:ExitSit()
	if CLIENT then
		if self ~= LocalPlayer() then return end
		net.Start("SitAnywhere")
			net.WriteInt(SitAnywhere.NET.SitRequestExit, 4)
		net.SendToServer()
	else
		local seat, holder = self:GetSitting()
		SafeRemoveEntity(seat)
		SafeRemoveEntity(holder)

		if SitAnywhere.GroundSit and self:GetNWBool("SitGroundSitting", false) then
			self:SetNWBool("SitGroundSitting", false)
		end
	end
end

function EMETA:IsSitAnywhereSeat()
	if self:GetClass() ~= "prop_vehicle_prisoner_pod" then return false end
	if SERVER and self.playerdynseat then return true end
	return self:GetNWBool("playerdynseat", false)
end
--PATH addons/slib_stromic_s_library/lua/slib/sh_util.lua:
slib = slib or {}
slib.panels = slib.panels or {}
slib.cachedAvatars = slib.cachedAvatars or {}
slib.generalCooldowns = slib.generalCooldowns or {}

slib.config = {scale = {x = 1, y = 1}}

slib.getStatement = function(val)
    if isbool(val) then return "bool" end
    if isnumber(val) then return "int" end
    if istable(val) and val.r and val.g and val.b then return "color" end
    if istable(val) then return "table" end
    if isfunction(val) then return "function" end
    if isstring(val) then return "string" end

    return "bool"
end

local callNum = 1
local loadedCalls = {}

local function loadFile(folder, file)
    if string.StartWith(file, "sv_") or string.find(folder, "server") then
        if SERVER then
            include(folder .. file)
            loaded = true
        end
    elseif string.StartWith(file, "sh_") or string.find(folder, "shared") then
        AddCSLuaFile(folder .. file)
        include(folder .. file)
        loaded = true
    elseif string.StartWith(file, "cl_") or string.find(folder, "client") then
        AddCSLuaFile(folder .. file)
        if CLIENT then include(folder .. file) loaded = true end
    end

    if loaded then
        print("[slib] Loaded "..folder..file)

        return folder..file
    end
end

slib.loadFolder = function(folder, subdirectories, firstload, lastload, call)
    local files, directories = file.Find(folder .. "*", "LUA")
    loadedCalls[callNum] = loadedCalls[callNum] or {}

    if firstload then
        for k,v in pairs(firstload) do
            local result = loadFile(v[1], v[2])
            if !result then continue end
            loadedCalls[callNum][result] = true
        end
    end

    if lastload then
        for k,v in pairs(lastload) do
            loadedCalls[callNum][v[1]..v[2]] = true
        end
    end

    for k, v in pairs(files) do
        if loadedCalls[callNum][folder..v] then continue end
        loadFile(folder, v)
    end

    if subdirectories then
        for k,v in pairs(directories) do
            slib.loadFolder(folder..v.."/", true, nil, nil, call and call or callNum)
        end
    end

    if lastload then
        for k,v in pairs(lastload) do
            loadFile(v[1], v[2])
        end
    end

    if call then return end
    callNum = callNum + 1
end

slib.getCooldown = function(var)
    if !slib.generalCooldowns[var] then return true end
    
    return slib.generalCooldowns[var] and CurTime() >= slib.generalCooldowns[var]
end

slib.getTimeLeft = function(var)
    return slib.generalCooldowns[var] and slib.generalCooldowns[var] - CurTime() or 0
end

slib.setCooldown = function(var, cd)
    slib.generalCooldowns[var] = CurTime() + cd
end

slib.oldFunctions = {}

slib.wrapFunction = function(element, funcname, pre, post, returnresult)
    if !slib.oldFunctions[funcname.."Old"] then
        slib.oldFunctions[funcname.."Old"] = element[funcname]
    end

    element[funcname] = function(...)
        local result 
        
        if pre then
            local callback = pre(...)
            result = returnresult and callback or result
        end

        if isfunction(slib.oldFunctions[funcname.."Old"]) then
            result = slib.oldFunctions[funcname.."Old"](...) or result
        end 

        if post then
            local callback = post(...)
            result = returnresult and callback or result
        end

        return result
    end
end

slib.lang = slib.lang or {}

slib.setLang = function(addon, lang, id, str)
    slib.lang[addon] = slib.lang[addon] or {}
    slib.lang[addon][lang] = slib.lang[addon][lang] or {}

    slib.lang[addon][lang][id] = str
end

slib.getLang = function(addon, lang, id, ...)
    local args = {...}
    local unformatted = slib.lang[addon] and slib.lang[addon][lang] and slib.lang[addon][lang][id]

    if !unformatted then unformatted = slib.lang[addon] and slib.lang[addon]["en"] and slib.lang[addon]["en"][id] or id end

    return table.IsEmpty(args) and unformatted or string.format(unformatted, ...)
end

slib.notify = function(str, ply)
    str = tostring(str)
    if SERVER then
        net.Start("slib.msg")
        net.WriteString(str)
        net.Send(ply)
    elseif CLIENT then
        print(str)
        notification.AddLegacy(str, 0, 5)
    end
end

local function differenciate(a, b)
    if !(isstring(a) == isstring(b)) or isbool(a) or isbool(b) then
        return tostring(a), tostring(b)
    end

    return a, b
end

slib.sortAlphabeticallyByKeyValues = function(tbl, ascending)
    local normaltable = {}
    local cleantable = {}
    
    for k,v in pairs(tbl) do
        table.insert(normaltable, k)
    end

    if ascending then
        table.sort(normaltable, function(a, b) a, b = differenciate(a, b) return a < b end)
    else
        table.sort(normaltable, function(a, b) a, b = differenciate(a, b) return a > b end)
    end

    for k,v in pairs(normaltable) do
        cleantable[v] = k
    end

    return cleantable
end

slib.sortAlphabeticallyByValue = function(tbl, ascending, keyvalue)
    if keyvalue then
        tbl = table.Copy(tbl)
    end

    if ascending then
        table.sort(tbl, function(a, b) a, b = differenciate(a, b) return a < b end)
    else
        table.sort(tbl, function(a, b) a, b = differenciate(a, b) return a > b end)
    end

    local cleantable = {}

    for k, v in pairs(tbl) do
        cleantable[v] = k
    end

    return keyvalue and cleantable or tbl
end

slib.sid64ToPly = slib.sid64ToPly or {}

if SERVER then
    slib.playerCache = slib.playerCache or player.GetAll()

    util.AddNetworkString("slib.msg")

    local punished = {}
    slib.punish = function(ply, type, msg, duration)
        local sid = ply:SteamID()

        if punished[sid] then return end
        punished[sid] = true

        if type == 1 then
            ply:Kick(msg)
        elseif type == 2 then
            if duration == nil then duration = 0 end
            if sAdmin then
                RunConsoleCommand("sa","banid", ply:SteamID64(), duration, msg)
            elseif ULib then
                ULib.ban(ply, duration, msg)
            elseif sam then
                RunConsoleCommand("sam","banid", sid, duration, msg)
            elseif xAdmin then
                if xAdmin.Config then
                    if xAdmin.Config.MajorVersion == 1 then
                        RunConsoleCommand("xadmin_ban", sid, duration, msg)
                    else
                        RunConsoleCommand("xadmin","ban", sid, duration, msg)
                    end
                end
            elseif SERVERGUARD then
                RunConsoleCommand("serverguard","ban", sid, duration, msg)
            else
                ply:Ban(duration, true)
            end
        end
    end

    slib.isBanned = function(sid64, callback)
        local sid32 = util.SteamIDFrom64(sid64)

        if sAdmin and sAdmin.isBanned then
            return sAdmin.isBanned(sid64)
        elseif sam and sam.player and sam.player.is_banned then
            return sam.player.is_banned(sid32, callback)
        elseif ulx and ULib and ULib.bans then
            return tobool(ULib.bans[sid32])
        elseif xAdmin and xAdmin.Admin and xAdmin.Admin.Bans then
            local data = xAdmin.Admin.Bans[sid64]
            local endtime = data.StartTime + (data.Length * 60)

            return data and (tonumber(endtime) <= os.time()) or false
        end
    end

    slib.setRank = function(ply, rank)
        local sid64 = ply:SteamID64()

        if sAdmin then
            RunConsoleCommand("sa", "setrankid", sid64, rank)
        elseif sam then
            RunConsoleCommand("sam", "setrankid", sid64, rank)
        elseif ulx then
            RunConsoleCommand("ulx", "adduserid", ply:SteamID(), rank)
        elseif xAdmin then
            RunConsoleCommand("xadmin", "setgroup", ply:Nick(), rank) -- yes
        end
    end

    hook.Add("PlayerInitialSpawn", "slib.reconnected", function(ply)
        local sid = ply:SteamID()
        if punished[sid] then
            punished[sid] = nil
        end
    end)

    hook.Add("PlayerInitialSpawn", "slib.FullLoaded", function( ply )
        table.insert(slib.playerCache, ply)
        local sid64 = ply:SteamID64()
        slib.sid64ToPly[sid64] = ply

        local id = sid64.."_slib"
        hook.Add( "SetupMove", id, function( self, mv, cmd )
            if self == ply and not cmd:IsForced() then
                hook.Run("slib.FullLoaded", ply)
                hook.Remove("SetupMove", id)
            end
        end )
    end)

    hook.Add("PlayerDisconnected", "slib.handleDisconnect", function(ply)
        table.RemoveByValue(slib.playerCache, ply)
    end)
end

if CLIENT then
    local blur = Material("pp/blurscreen")

    slib.DrawBlur = function(panel, amount)
        local x, y = panel:LocalToScreen(0, 0)
        local scrW, scrH = ScrW(), ScrH()
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(blur)
        for i = 1, 3 do
            blur:SetFloat("$blur", (i / 3) * (amount or 6))
            blur:Recompute()
            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
        end
    end

    slib.getScaledSize = function(num, axis, scale)
        scale = scale or {x = 1, y = 1}

        if axis == "x" then
            num = ScrW() * (num/1920)

            num = num * scale.x
        end
    
        if axis == "y" or axis == nil then
            num = ScrH() * (num/1080)

            num = num * scale.y
        end
        
        return math.Round(num)
    end

    slib.cachedFonts = slib.cachedFonts or {}

    slib.createFont = function(fontname, size, thickness, ignorescale)
        size = size or 13
        thickness = thickness or 500
        local identifier = string.gsub(fontname, " ", "_")

        if !fontname or !size or !thickness then return end

        local name = "slib."..identifier..size.."."..thickness
        
        if ignorescale then name = "real_"..name end
        
        if slib.cachedFonts[name] then return name end

        surface.CreateFont( name, {
            font = fontname,
            size = ignorescale and size or slib.getScaledSize(size, "y"),
            weight = thickness,
        })

        slib.cachedFonts[name] = true

        return name
    end

    slib.colorCached = {}

    slib.lerpColor = function(identifier, wantedcolor, multiplier, nolerp)
        wantedcolor = table.Copy(wantedcolor)
        slib.colorCached[identifier] = slib.colorCached[identifier] or wantedcolor
        multiplier = multiplier or 1
        local basespeed = (RealFrameTime() * 3)
        local speed = basespeed * multiplier

        if minspeed then speed = minspeed > speed and minspeed or speed end
        
        for k,v in pairs(slib.colorCached[identifier]) do
            local percentageleft = math.abs(wantedcolor[k] - v)

            slib.colorCached[identifier][k] = math.Approach(v, wantedcolor[k], speed * (nolerp and 100 or percentageleft))
        end

        return slib.colorCached[identifier]
    end

    slib.numCached = {}
    slib.lerpNum = function(identifier, wantednum, multiplier, nolerp)
        slib.numCached[identifier] = slib.numCached[identifier] or wantednum
        multiplier = multiplier or 1
        local basespeed = (RealFrameTime() * 3)
        local speed = basespeed * multiplier

        local percentageleft = math.abs(wantednum - slib.numCached[identifier])

        slib.numCached[identifier] = math.Approach(slib.numCached[identifier], wantednum, speed * (nolerp and 100 or percentageleft))

        return math.Round(slib.numCached[identifier])
    end

    slib.drawTooltip = function(str, parent, align)
        local font = slib.createFont("Roboto", 13)
        local cursortposx, cursortposy = input.GetCursorPos()
        cursortposx = cursortposx + 15
        local x, y = cursortposx, cursortposy
       
        surface.SetFont(font)
        local strw, strh = surface.GetTextSize(str)
       
        local w = strw + slib.getScaledSize(6, "x")

        if align == 1 then
            local parentparent = parent:GetParent()
            if !IsValid(parentparent) then return end
            local posx, posy = parent:GetPos()
            x, y = parentparent:LocalToScreen(posx, posy)
            y = y + parent:GetTall()

            x = x + parent:GetWide() * .5

            x = x - w * .5
        end

        local tooltip = vgui.Create("EditablePanel")
        tooltip:SetMouseInputEnabled(false)
        tooltip:SetPos(x, y)
        tooltip:SetSize(w, slib.getScaledSize(22, "y"))
        tooltip:MakePopup()
    
        tooltip.Paint = function(s,w,h)
            if !parent:IsHovered() and !s:IsHovered() or !s:HasFocus() and !parent.clickable then s:Remove() end
    
            surface.SetDrawColor(slib.getTheme("maincolor", 10))
            surface.DrawRect(0, 0, w, h)
    
            surface.SetDrawColor(120, 120, 120, 200)
            surface.DrawOutlinedRect(0, 0, w, h)
    
            draw.SimpleText(str, font, slib.getScaledSize(3, "x"), h * .5, slib.getTheme("textcolor"), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        return tooltip
    end

    slib.createTooltip = function(str, parent)
        if !str or !parent then return end

        surface.SetFont(parent.font)
        local textw, texth = surface.GetTextSize(parent.name)


        local tooltipbutton = vgui.Create("DButton", parent)
		tooltipbutton:SetText("")
		tooltipbutton:Dock(LEFT)
		tooltipbutton:DockMargin(textw + slib.getScaledSize(6,"x"),slib.getScaledSize(5,"x"),0,slib.getScaledSize(5,"x"))
        tooltipbutton:SetWide(slib.getScaledSize(25, "y") - (slib.getScaledSize(5,"x") + slib.getScaledSize(5,"x")))
        tooltipbutton.bg = slib.getTheme("maincolor")
        
        tooltipbutton.DoClick = function()
            tooltipbutton.clicked = !tooltipbutton.clicked
        end

		tooltipbutton.Paint = function(s,w,h)
            draw.RoundedBox(h * .5, 0, 0, w, h, s.bg)

			draw.SimpleText("?", slib.createFont("Roboto", 14), w * .5, h * .5, slib.getTheme("textcolor", -50), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if s.clickable and !s.clicked and IsValid(s.tooltip) then
                s.tooltip:Remove()
            end

            if s:IsHovered() then
                if IsValid(s.tooltip) then return end
                s.tooltip = slib.drawTooltip(str, tooltipbutton)
            else
                s.clicked = nil
			end
        end
        
        return tooltipbutton
    end

    slib.theme = slib.theme or {}

    slib.setTheme = function(var, val)
        slib.theme[var] = val
    end

    slib.getTheme = function(var, offset)
        local val = slib.theme[var]

        if istable(val) then
            val = table.Copy(val)
            
            if offset then
                for k,v in pairs(val) do
                    val[k] = v + offset
                end

                if val.r and val.g and val.b and val.a then
                    for k,v in pairs(val) do
                        val[k] = math.Clamp(v, 0, 255)
                    end
                end
            end 
        end

        return val
    end

    slib.isValidSID64 = function(sid64)
        return util.SteamIDFrom64(sid64) != "STEAM_0:0:0"
    end

    local loading_ico = Material("slib/load.png", "smooth")

    local matCache = {}
    local fetched = {}
    
    file.CreateDir("slib")
    
    local proxy = ""--"https://proxy.duckduckgo.com/iu/?u=" -- Disabled for now, it doesn't work
    slib.ImgurGetMaterial = function(id) -- RETURN THE LOADING MATERIAL UNTIL IT IS FOUND!!!
        if !matCache[id] then
            local link = proxy.."https://i.imgur.com/"..id..".png"

            if file.Exists("slib/"..id..".png", "DATA") then
                matCache[id] = Material("data/slib/"..id..".png", "noclamp smooth")

                if matCache[id]:IsError() then
                    file.Delete("slib/"..id..".png")

                    if !fetched[link] then
                        slib.ImgurGetMaterial(id)
                    end
                end
            else
                if fetched[link] then return loading_ico, true end
                
                fetched[link] = true
                
                http.Fetch(link,
                    function(body)
                        file.Write("slib/"..id..".png", body)
                        matCache[id] = Material("data/slib/"..id..".png", "noclamp smooth")
                    end
                )
            end
        else
            return matCache[id]
        end
        
        return loading_ico, true
    end

    local cachedNames = {}
    local requestedNames = {}

    slib.findName = function(sid64, rtrn_sid64)
        if cachedNames[sid64] then return cachedNames[sid64] end

        local servercheck = player.GetBySteamID64(sid64)
        local steamcheck = false

        if servercheck then
            cachedNames[sid64] = servercheck:Nick()
        else
            if requestedNames[sid64] then return rtrn_sid64 and sid64 end
            requestedNames[sid64] = true
            local start = "<title>Steam Community :: "
            local theEnd = '<link rel="shortcut icon" href="/favicon.ico" type="image/'

            http.Fetch("http://steamcommunity.com/profiles/"..sid64,
                function(data)
                    local nameStart = select(1, string.find(data, start))
                    local nameEnd = select(1, string.find(data, theEnd))

                    if !nameStart or !nameEnd then return end

                    nameStart = nameStart + #start
                    nameEnd = nameEnd - 12

                    local nick = string.sub(data, nameStart, nameEnd)

                    cachedNames[sid64] = nick
                end
            )

            if !rtrn_sid64 then
                cachedNames[sid64] = "N/A"
            end
        end

        return rtrn_sid64 and sid64 or cachedNames[sid64]
    end

    local function saveImageFromURL(url, path, cb)
        http.Fetch(url, function(data)
            file.Write(path, data)

            if cb then
                cb()
            end
        end)
    end

    local fetchingAvatar = {}
    local default_ico = Material("slib/default_steam.png", "smooth")

    slib.findAvatar = function(sid64, medium)
        if !sid64 then return end
        
        local path = "slib/avatars/"..sid64..(medium and "_medium" or "_full")..".jpg"
        local size = medium and "medium" or "full"

        slib.cachedAvatars[size] = slib.cachedAvatars[size] or {}

        if !slib.cachedAvatars[size][sid64] or slib.cachedAvatars[size][sid64]:IsError() then
            if file.Exists(path, "DATA") then
                slib.cachedAvatars[size][sid64] = Material("data/"..path, "smooth noclamp")

                return slib.cachedAvatars[size][sid64]
            end

            local start = "https://avatars.cloudflare.steamstatic.com/"
            local theEnd = '">'

            if !fetchingAvatar[sid64] then
                http.Fetch( "http://steamcommunity.com/profiles/"..sid64,
                    function(data)
                        local avatarStart = select(1, string.find(data, start))
                        
                        if !avatarStart then return end

                        local avatarEnd = avatarStart + select(1, string.find(string.sub(data, avatarStart, #data), theEnd))

                        if !avatarEnd then return end

                        local imgLink = string.sub(data, avatarStart, avatarEnd - 2)

                        if medium then
                            imgLink = string.Replace(imgLink, "_full", "_medium")
                        end

                        saveImageFromURL(imgLink, path, function()
                            file.CreateDir("slib/avatars/")
                            slib.cachedAvatars[size][sid64] = Material("data/"..path, "smooth noclamp")
                        end)

                        cachedNames[sid64] = nick
                    end
                )

                fetchingAvatar[sid64] = true
            end

            return default_ico
        end

        return slib.cachedAvatars[size][sid64]
    end

    local storedImages = file.Find("slib/avatars/*.jpg", "DATA")

    for k,v in ipairs(storedImages) do
        if os.time() - file.Time("slib/avatars/"..v, "DATA") >= 259200 then
            file.Delete("slib/avatars/"..v)
        end
    end

    hook.Add("OnEntityCreated", "slib.CacheSid64ToPly", function(ent)
        if ent:IsPlayer() and !ent:IsBot() then
            local sid64 = ent:SteamID64()
            
            if !sid64 then return end

            slib.sid64ToPly[sid64] = ent
        end
    end)

    net.Receive("slib.msg", function(_, ply)
        slib.notify(net.ReadString())
    end)
end

hook.Run("slib:loadBase")
hook.Run("slib:loadedUtils")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_sdropdown.lua:
local PANEL = {}

local font = slib.createFont("Roboto", 13)
local textcolor = slib.getTheme("textcolor")
local hovercolor, margin, maincolor_5, maincolor_10 = slib.getTheme("hovercolor"), slib.getTheme("margin"), slib.getTheme("maincolor", 5), slib.getTheme("maincolor", 10)
local icon = Material("slib/down-arrow.png", "smooth")

function PANEL:Init()
    self:SetTall(slib.getScaledSize(25, "y"))
    self:setTitle("Select Option", TEXT_ALIGN_LEFT)
    self.iteration = 0
    self.options = {}
    self.maxHeightChilds = 0

    self.close = vgui.Create("DButton")
    self.close:Dock(FILL)
    self.close:SetText("")
    self.close:SetVisible(false)

    self.close.Paint = function() end

    self.close.DoClick = function()
        self.close:SetVisible(false)
        if IsValid(self.droppedMenu) then
            self.droppedMenu:SetVisible(false)
        end

        if isfunction(self.onClose) then self.onClose(self) end
    end

    self.droppedMenu = vgui.Create("SScrollPanel")
    self.droppedMenu:SetWide(self:GetWide())
    self.droppedMenu:SetVisible(false)
    self.droppedMenu.scrollbg = Color(42, 42, 42)
end

function PANEL:SetPlaceholder(str)
    self:setTitle(str, TEXT_ALIGN_LEFT)
end

function PANEL:OnRemove()
    if IsValid(self.droppedMenu) then self.droppedMenu:Remove() end
end

function PANEL:popupAlone()
    self:DoClick()

    local x, y = input.GetCursorPos()
    if !IsValid(self.droppedMenu) then return end
    self.droppedMenu:SetWide(self:GetWide())
    self.droppedMenu:SetPos(x, y)
    self.droppedMenu:MakePopup()
    self:SetVisible(false)
    self.poppedOut = true

    self.onClose = function() self:Remove() end

    return self
end

function PANEL:SizeToChilds()
    local canvas = self.droppedMenu:GetCanvas()
    local childsHeight = 0

    for k,v in ipairs(canvas:GetChildren()) do
        if self.maxHeightChilds > 0 and k > self.maxHeightChilds then
            break
        end
        
        childsHeight = childsHeight + v:GetTall()
    end

    canvas:InvalidateLayout(true)
    canvas:SetTall(childsHeight)

    self.droppedMenu:SetHeight(canvas:GetTall())
end

function PANEL:addOption(val)
    local iteration = self.iteration
    self.options[iteration] = vgui.Create("SButton", self.droppedMenu)
    :Dock(TOP)
    :SetLinePos(0)
    :SetTall(slib.getScaledSize(25, "y"))

    if self.buttonfont then
        self.options[iteration].font = self.buttonfont
    end

    local is_func = isfunction(val)

    self.options[iteration]:setTitle(is_func and val() or val, TEXT_ALIGN_LEFT)

    local wide = self.options[iteration]:GetWide()

    self.options[iteration].accentheight = 1

    self:SizeToChilds()

    self.options[iteration].DoClick = function(called)
        self.close.DoClick()
        self:setTitle(is_func and val() or val, TEXT_ALIGN_LEFT, true)
        self.sel_int = iteration + 1
        
        if isfunction(self.onValueChange) then
            self.onValueChange(is_func and val() or val)
        end
    end
    local isFirst = !self.firstchild
    self.options[iteration].Paint = function(s,w,h)
        if is_func then self.options[iteration]:setTitle(val(), TEXT_ALIGN_LEFT) end

        surface.SetDrawColor(s:IsHovered() and maincolor_5 or maincolor_10)
        surface.DrawRect(0, 0, w, h)

        draw.SimpleText(is_func and val() or val, self.buttonfont or self.options[iteration].font, margin, h * .5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
    
    if iteration == 0 then
        self.options[iteration].DoClick()
    end
    
    if wide > self:GetWide() then
        self:SetWide(wide)
    end
    
    self.iteration = self.iteration + 1

    self.firstchild = self.firstchild or self.options[iteration]
    self.lastchild = self.options[iteration]

    return self
end

function PANEL:SelectOption(int)
    self.options[int].DoClick(true)

    return self
end

function PANEL:Reposition()
    local x, y = self:LocalToScreen(0,self:GetTall())
    if !IsValid(self.droppedMenu) then return end
    self.droppedMenu:SetWide(self:GetWide())
    self.droppedMenu:SetPos(x, y)
    self.droppedMenu:MakePopup()
end

function PANEL:DoClick()
    self.close:SetVisible(!self.droppedMenu:IsVisible())
    self.close:MakePopup()

    self.droppedMenu:SetVisible(!self.droppedMenu:IsVisible())

    self:Reposition()
end

function PANEL:OnSizeChanged()
    self:Reposition()
end

function PANEL:PaintOver(w,h)
    local size = math.min(h * .7, slib.getScaledSize(12, "y"))
    local thickness = slib.getScaledSize(2, "x")

    draw.NoTexture()

    local wantedCol = self:IsHovered() and color_white or hovercolor

    surface.SetDrawColor(wantedCol)
    surface.SetMaterial(icon)
    surface.DrawTexturedRect(w - size - margin * 2, h * .5 - size * .5, size, size)
end

vgui.Register("SDropDown", PANEL, "SButton")
--PATH addons/gprotect_1.15.101/lua/g_protect/sh_cppi.lua:
gProtect = gProtect or {}
gProtect.EmptyFuncs = gProtect.EmptyFuncs or {}
CPPI = CPPI or {}

local ENTITY = FindMetaTable("Entity")
local PLAYER = FindMetaTable("Player")



-- Create empty functions to prevent nil errors.
if !ENTITY.CPPIGetOwner then
    function ENTITY:CPPIGetOwner() end
    gProtect.EmptyFuncs["CPPIGetOwner"] = ENTITY.CPPIGetOwner
end

if !ENTITY.CPPISetOwner then
    function ENTITY:CPPISetOwner() end
end

local function overrideCPPI()
    ENTITY.oldCPPIGetOwner = ENTITY.oldCPPIGetOwner or (ENTITY.CPPIGetOwner != gProtect.EmptyFuncs["CPPIGetOwner"] and ENTITY.CPPIGetOwner)
    function ENTITY:CPPIGetOwner()
        local result = gProtect.GetOwner(self)
        
        if isstring(result) and isfunction(ENTITY.oldCPPIGetOwner) then result = self:oldCPPIGetOwner() end

        return SERVER and gProtect.ownershipCache[self] or (isstring(result) and nil or result), 200
    end

    function PLAYER:CPPIGetFriends()
        local friends_tbl = CLIENT and gProtect.BuddiesData or gProtect.TouchPermission
        local sid = self:SteamID()
        local found_friends = {}
        local result = {}

        if friends_tbl[sid] then
            for k, v in pairs(friends_tbl[sid]) do
                if !istable(v) then continue end
                for sid, v in pairs(v) do
                    found_friends[sid] = true
                end
            end
        end

        for k, v in pairs(found_friends) do
            table.insert(result, k)
        end
        
        return result
    end

    if SERVER then
        ENTITY.oldCPPISetOwner = ENTITY.oldCPPISetOwner or ENTITY.CPPISetOwner
        function ENTITY:CPPISetOwner(ply)
            if isfunction(ENTITY.oldCPPISetOwner) then
                self:oldCPPISetOwner(ply)
            end

            if !IsValid(ply) then return end
            gProtect.SetOwner(ply, self)
        end

        function ENTITY:CPPICanTool(ply, tool)            
            return gProtect.HandlePermissions(ply, self, "gmod_tool")
        end
    
        function ENTITY:CPPICanPhysgun(ply)
            if SERVER and !gProtect.HandlePhysgunPermission(ply, self) then return false end

            return gProtect.HandlePermissions(ply, self, "weapon_physgun")
        end
    
        function ENTITY:CPPICanPickup(ply)
            return gProtect.HandlePermissions(ply, self, "weapon_physcannon")
        end
    
        function ENTITY:CPPICanPunt(ply)
            if cfg.enabled and (cfg.DisableGravityGunPunting or (IsValid(ent) and cfg.blockedEntities[ent:GetClass()])) then return false end

            return true
        end
    end
end

timer.Simple(3, function()
    overrideCPPI()
end)
--PATH addons/gprotect_1.15.101/lua/g_protect/client/cl_buddies.lua:
if gProtect.config.DisableBuddySystem then return end

gProtect = gProtect or {}
gProtect.BuddiesData = gProtect.BuddiesData or {}

if (file.Exists( "gp_buddies.txt", "DATA" )) then
	local data = file.Read( "gp_buddies.txt")
	data = util.JSONToTable(data)

	gProtect.BuddiesData = data or {}
end

local classtoInt = {
	["weapon_physcannon"] = 1,
	["weapon_physgun"] = 2,
	["gmod_tool"] = 3,
	["canProperty"] = 4,
	["canUse"] = 5
}

local permissions = {
	{title = slib.getLang("gprotect", gProtect.config.SelectedLanguage, "toolgun"), classname = "gmod_tool", int = 3},
	{title = slib.getLang("gprotect", gProtect.config.SelectedLanguage, "gravity-gun"), classname = "weapon_physcannon", int = 1},
	{title = slib.getLang("gprotect", gProtect.config.SelectedLanguage, "physgun"), classname = "weapon_physgun", int = 2},
	{title = slib.getLang("gprotect", gProtect.config.SelectedLanguage, "canproperty"), classname = "canProperty", int = 4},
	{title = slib.getLang("gprotect", gProtect.config.SelectedLanguage, "canuse"), classname = "canUse", int = 5}
}

local function handleBuddies(ply, weapon, int, forced)
	if !IsValid(ply) or !weapon or !int then return end

	local sid = ply:SteamID()
	local lsid = LocalPlayer():SteamID()

	gProtect.BuddiesData[lsid] = gProtect.BuddiesData[lsid] or {}
	gProtect.BuddiesData[lsid][weapon] = gProtect.BuddiesData[lsid][weapon] or {}

	local isBuddy = forced and forced or !gProtect.BuddiesData[lsid][weapon][sid]

	net.Start("gP:Buddies")
	net.WriteInt(ply:EntIndex(), 15)
	net.WriteUInt(int, 3)
	net.WriteBool(isBuddy)
	net.SendToServer()

	if !isBuddy then isBuddy = nil end

	gProtect.BuddiesData[lsid][weapon][sid] = isBuddy

	if(file.Exists( "gp_buddies.txt", "DATA" )) then
		local data = file.Read( "gp_buddies.txt")
		data = util.JSONToTable(data) or {}

		data[lsid] = data[lsid] or {}
		data[lsid][weapon] = data[lsid][weapon] or {}
		data[lsid][weapon][sid] = isBuddy
		
		file.Write("gp_buddies.txt", util.TableToJSON(data))
	else
		local data = {[lsid] = {[weapon] = {[sid] = isBuddy}}}
		file.Write("gp_buddies.txt", util.TableToJSON(data))
	end
end

local function openBuddies()
	local buddies = vgui.Create("SFrame")
    buddies:SetSize(slib.getScaledSize(400, "x"),slib.getScaledSize(370, "y"))
    :setTitle(slib.getLang("gprotect", gProtect.config.SelectedLanguage, "buddies-title"))
    :Center()
    :addCloseButton()
    :MakePopup()

	local player_list = vgui.Create("SListPanel", buddies.frame)
    player_list:setTitle(slib.getLang("gprotect", gProtect.config.SelectedLanguage, "player-list"))
	:addSearchbar()
	:Dock(FILL)
	:DockMargin(slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"))

    for k,v in pairs(player.GetAll()) do
        if v:IsBot() or v == LocalPlayer() then continue end
		local _, entry = player_list:addEntry(v)
		if v:GetFriendStatus() == "friend" then entry:SetZPos(-10) end
	end
	
	for k,v in ipairs(permissions) do
		local _, bttn = player_list:addButton(v.title, function() handleBuddies(player_list.selected, v.classname, v.int) end)
		bttn:setToggleable(true)

		bttn.toggleCheck = function()
			local lply = LocalPlayer()
			local ply = player_list.selected

			if !ply or !lply then return slib.getTheme("maincolor", 20) end

			local lsid = lply:SteamID()
			local sid = ply:SteamID()

			return (gProtect.BuddiesData[lsid] and gProtect.BuddiesData[lsid][v.classname] and gProtect.BuddiesData[lsid][v.classname][sid] and true or false)
		end
	end
end

hook.Add("Think", "gP:WaitOnLocalPlayer", function()
	if !IsValid(LocalPlayer()) then return end
	hook.Add("OnEntityCreated", "gP:HandleJoinedFriends", function(ent)
		if ent:IsPlayer() then
			local lply = LocalPlayer()
			
			if !IsValid(lply) then return end
	
			local lsid = lply:SteamID()
			local sid = ent:SteamID()
			if !gProtect.BuddiesData[lsid] then return end
			for k,v in pairs(gProtect.BuddiesData[lsid]) do
				if v[sid] then
					handleBuddies(ent, k, classtoInt[k], true)
				end
			end
		end
	end)
	
	for k,ply in ipairs(player.GetAll()) do
		local lsid = LocalPlayer():SteamID()
		local sid = ply:SteamID()
		if !gProtect.BuddiesData[lsid] then return end
		for k,v in pairs(gProtect.BuddiesData[lsid]) do
			if v[sid] then
				handleBuddies(ply, k, classtoInt[k], true)
			end
		end
	end

	hook.Remove("Think", "gP:WaitOnLocalPlayer")
end)

list.Set("DesktopWindows", "gp_buddies",{
	title = "gP: Buddies",
	icon = "gProtect/buddies.png",
	init = openBuddies
})

concommand.Add("buddies", openBuddies)
concommand.Add("gp_buddies", openBuddies)
--PATH addons/tadminsystem/lua/autorun/t_adminsystem_load.lua:
TAS = {}
TAS.Frames = {}
TAS.Refund = {}
TAS.Tickets = {}

local function Inclu(f) return include("t_adminsystem/"..f) end
local function AddCS(f) return AddCSLuaFile("t_adminsystem/"..f) end
local function IncAdd(f) return Inclu(f), AddCS(f) end

IncAdd("config.lua")
IncAdd("languages.lua")

if SERVER then

	Inclu("server/sv_utils.lua")

	AddCS("client/cl_hud.lua")
	AddCS("client/cl_utils.lua")

else

	Inclu("client/cl_hud.lua")
	Inclu("client/cl_utils.lua")

end
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_binder.lua:
local THEME = TalkModes.Client.ActiveTheme

local PANEL = {}
function PANEL:Init()
    self:SetTextColor(THEME["White"])
    self:SetFont("TalkModes:Small")
end

function PANEL:Paint(intW, intH)
    draw.RoundedBox(6, 0, 0, intW, intH, THEME["Background"])
end

function PANEL:DoClick()
	self:SetText("PRESS A KEY")
	self.intW, self.intH = self:GetContentSize()
    self:SetSize(self.intW + 24, self.intH + 4)
	input.StartKeyTrapping()
	self.Trapping = true
end

function PANEL:UpdateText()
	local str = input.GetKeyName( self:GetSelectedNumber() )
	if ( !str ) then str = "NONE" end
	str = language.GetPhrase( str )
	self:SetText(string.upper(str))
	self.intW, self.intH = self:GetContentSize()
    self:SetSize(self.intW + 24, self.intH + 4)
end
vgui.Register("TalkModes.Binder", PANEL, "DBinder")
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_docker.lua:
local THEME = TalkModes.Client.ActiveTheme

local PANEL = {}
function PANEL:Init()
    self.bChanging = false
    self.base = self:GetParent()
end

function PANEL:ChangePage(strPage, bFade)
    if (self.base:GetLoadedPanel() == strPage) then return end
    if (self.bChanging) then return end
    if !(self.page) then
        self.page = self:Add(strPage)
        self.page:Dock(FILL)
        return
    end
    if (bFade) then
        self.bChanging = true
        self.page:AlphaTo(0, 0.2, 0, function()
            self:Clear()

            self.page = self:Add(strPage)
            self.page:Dock(FILL)
            self.page:SetAlpha(0)
            self.page:AlphaTo(255, 0.2, 0, function()
                self.bChanging = false
            end)
        end)
    else
        self:Clear()
        self.page = self:Add(strPage)
        self.page:Dock(FILL)
    end
end


function PANEL:Paint(intW, intH)
    draw.RoundedBoxEx(8, 0, 0, intW, intH, THEME["Foreground"], false, false, false, true)
end

vgui.Register("TalkModes.Docker", PANEL, "DPanel")
--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_chinese.lua:
Diablos.TS.Languages.AvailableLanguages["chinese"] = {

	-- Global data
	lbs = "磅",
	kg = "公斤",
	yes = "是",
	no = "否",
	andStr = "和",
	active = "激活",
	training = "训练",
	beginning = "开始:",
	ending = "结束:",
	leaveTraining = "离开训练:",
	second = "秒",
	seconds = "秒",
	minute = "分钟",
	minutes = "分钟",
	hour = "小时",
	hours = "小时",
	day = "天",
	days = "天",
	week = "周",
	weeks = "周",
	month = "月",
	months = "月",
	year = "年",
	years = "年",
	key = "钥匙",
	keys = "钥匙",
	free = "免费",

	-- Home tips
	home = "主页",
	trainingStatistics = "培训统计",
	levelProgression = "等级",
	captionFine = "肌肉断裂",
	captionShouldTrain = "应该训练",
	captionMuscleLoss = "肌肉丧失",
	staminaBenefit = "速度和持续时间",
	staminaMuscle = "大腿",
	runningspeedBenefit = "最大跑步速度",
	runningspeedMuscle = "小腿",
	strengthBenefit = "强度损伤",
	strengthMuscle = "肩、斜方肌和上臂",
	attackspeedBenefit = "攻击速度",
	attackspeedMuscle = "前臂",

	-- Personal statistics

	currentLevel = "等级 %u",
	xpPoint = "经验值: %u",

	-- Global statistics

	globalStatistics = "全球统计",
	onlineStatistics = "在线玩家统计",
	updateSelection = "更新 (%u 已选择)",
	resetPlayerData = "重置玩家数据",
	resetEntityData = "重置实体数据",
	peopleSelected = "玩人员选择: %s",
	peopleSelectedTip = "您可以设置一些培训参数以应用于您选择的人员",


	-- Training times part

	trainingTimes = "培训次数",
	trainingAdv = "您有时需要肌肉休息。然而，等待太长时间会导致肌肉损失。",
	muscleRest = "肌肉休息",
	losingMuscle = "肌肉丧失",
	waitUntil = "您应该等到",
	secondsRemaining = "剩余%d 秒",
	needTrainBeforeLosingMuscle = "你需要在之前训练:",
	neverTrained = "从未训练过",
	freeToWorkout = "您可以自由锻炼肌肉！",
	currentlyLosing = "您当前正在失去肌肉！",
	yourChoice = "您的选择",
	trainNow = "开始培训",


	-- XP/Level table

	levels = "等级",
	level = "等级",
	xp = "经验值",
	percentage = "百分率",
	undefined = "未定义",
	lastTraining = "最后训练",

	-- Global trainings

	trainingWillBegin = "培训将在 %u 秒后开始",
	trainingEndsIn = "训练在 %u 秒后结束",
	currentlyUsingMachine = "有人正在使用机器",
	leftMachine = "您离开了培训。您可以从现在开始重试！",
	farFromMachine = "你离机器太远了，无法训练！",
	notAllowedJob = "你的工作不允许你训练！",

	-- Admin data

	setTo = "设置为 %s ",
	confirmationBox = "确认框",
	areYouSure = "你确定你想这样做吗？",

	-- Weigh balance data


	weighBalanceUse = "按 互动键 获取信息",
	weighBalanceCantSee = "统计数据保密",
	weighBalanceTipL1 = "请上前",
	weighBalanceTipL2 = "在天平秤上",
	weighBalanceTipL3 = "开始计算统计",

	-- Turnstile data

	turnstileNeedBadge = "您需要使用您的徽章才能进入此处!",

	-- Badge data

	activebadge = "活动徽章",
	neverSubscribed = "从未订阅",
	badgeSubscription = "徽章订阅",
	expirationDate = "到期日期",
	expired = "期满",
	previousSub = "先前订阅",

	-- Stamina data

	stamina = "耐力",
	runSpeed = "跑步速度",
	timeMaxSpeed = "最高速度时间",

	-- Running speed data

	runningspeed = "跑步速度",

	-- Treadmill data

	treadmillDrawLeft = "剩余%u 秒",
	treadmillDrawSomeone = "有人在训练!",
	treadmillDrawCanUse = "免费使用",
	treadmillCurSpeed = "当前速度",
	treadmillFrameTitle = "多功能跑步机",
	treadmillChooseExerciceTip1 = "敲击前进键以提高速度",
	treadmillChooseExerciceTip2 = "你获得的积分取决于你在比赛结束时的速度",
	quickExerciceSpeed = "基于速度的快速练习",
	longExerciceStamina = "基于耐力的长时间锻炼",
	runningTime = "跑步时间",
	increaseSpeed = "提速",
	decreaseSpeed = "降速",
	needFasterTreadmill = "按下或释放 前进键 时，您需要加快速度",

	-- Strength data

	strength = "力量",

	-- Dumbbell data

	dumbbellDraw = "哑铃",
	dumbbellFrameTitle = "哑铃",
	dumbbellChooseExerciceTip1 = "在正确的时间按正确的键",
	dumbbellChooseExerciceTip2 = "您获得的积分取决于在正确时间按下的键的比例",

	-- Attack speed data

	attackspeed = "攻击速度",

	-- Punching ball data

	punchingHitDamage = "%u 红点命中",
	punchingFrameTitle = "沙袋",
	punchingChooseExerciceTip1 = "击出打孔球，红点",
	punchingChooseExerciceTip2 = "你获得的分数取决于你用拳头击打的红色点数",

	-- Card reader data

	cardReaderTitle = "读卡机",
	approachBadge = "您需要接近您的运动徽章才能使用终端！",
	becomeOwner = "您成为了终端的所有者!",
	someoneElseOwner = "其他人已经是此终端的所有者",

	cardReaderOwnerAdd = "添加",
	cardReaderOwnerRemove = "删除",
	cardReaderApply = "应用",
	cardReaderBadgePrice = "徽章价格",
	cardReaderPurchaseSub = "购买订阅",
	cardReaderPurchaseSubTip1 = "订阅允许您在旋转栅门上使用徽章",
	cardReaderFullyRecharged = "您的订阅已充值！有效期至 %s",

	cardReaderGiveCredit = "给予订阅",
	cardReaderGiveCreditTip1 = "你将要给你面前的球员一个荣誉",
	cardReaderGiveCreditTip2 = "这将允许他进入旋转栅门一次",
	cardReaderGiveCreditBtn = "给予订阅",
	cardReaderGiveAlreadyCredit = "你不能把订阅给已经拥有订阅卡的人!",
	cardReaderGiveAlreadySubscribed = "您不能将信用授予已经拥有有效订阅的用户!",


	cardReaderEditTerminal = "编辑终端",
	cardReaderEditTerminalTip1 = "您可以将终端的某些参数更改为订阅价格/共同所有者",
	cardReaderEditTerminalTip2 = "共同所有者在这里分享您从订阅中获得的资金",
	cardReaderEditTerminalSetPrice = "价格可以从 %s 设置为 %s",


	-- Notify player

	alreadyTrained = "您最近对这些肌肉进行了训练，请在 %s 后回来",
	needMoreLevel = "您需要至少达到 %u 级才能使用此!",
	tooEasy = "这台机器对你的水平来说太容易了!",
	endTraining = "训练已经结束",
	xpAdded = "你赢的了 %u 积分!",
	newLevel = "你现在等级为 %u!",
	lossOfTraining = "由于这种类型训练中会有肌肉丧失的风险，所以您可能会丧失肌肉机能： %s",
	sportBadgeVerified = "你的订阅已经通过验证",
	sportBadgeInvalid = "你的订阅无效",
	subDataUpdated = "您更新了订阅数据!",
	subPurchased = "您收到了 %s ，因为 %s 购买了一个订阅!",
	subRenewed = "你已经更新了你的订阅!",
	subNotEnoughMoney = "你没有足够的钱买订阅!",
	creditGiven = "你赠予了订阅!",
	creditReceived = "你收到了订阅！",
	entitiesUpdated = "培训实体数据已更新!",
	entitiesRemoved = "实体已删除，数据已擦除!",
	playerDataRemoved = "玩家的数据库已被删除!",
	playerDataUpdated = "数据更新为您的值!",

}
--PATH addons/the_perfect_training_system/lua/diablos_training/vgui/cl_adminclient.lua:
/*---------------------------------------------------------------------------
	Updates the "label" vgui element to see how many elements you have selected
---------------------------------------------------------------------------*/

local function UpdateAmountPlayersSelected(label, val)
	if IsValid(label) then
		label:SetText(string.format(Diablos.TS:GetLanguageString("updateSelection"), val))
	end
end

/*---------------------------------------------------------------------------
	Returns a proper string with the table which contains player indexes
---------------------------------------------------------------------------*/

local function GetStringFromSelectedPlayers(tab)
	local str = ""
	local i = 1
	for _, ply in ipairs(tab) do
		if IsValid(ply) then
			if i != 1 then
				str = str .. ", "
			end
			str = str .. ply:Nick()
			i = i + 1
		end
	end
	if str == "" then str = "None" end

	return str
end

net.Receive("TPTSA:OpenAdminClientPanel", function(len, _)
	local ply = LocalPlayer()
	if not Diablos.TS:IsAdmin(ply) then return end
	local idopen

	local trainings = Diablos.TS:GetTrainings()
	local playersData = {}
	local sumValues = {}
	local averageValues = {}


	local playerCount = net.ReadUInt(8)
	for i = 1, playerCount do
		local curPlayer = net.ReadEntity()

		local globalTableTraining = Diablos.TS:ReadTrainingInfo(curPlayer)

		local tableTraining = globalTableTraining["Trainings"]

		for typeTraining, trainingData in pairs(tableTraining) do
			sumValues[typeTraining] = (sumValues[typeTraining] or 0) + tableTraining[typeTraining].xp

			trainingData.ID = table.KeyFromValue(trainings, typeTraining)
		end

		table.SortByMember(tableTraining, "ID", false)

		playersData[curPlayer] = globalTableTraining
	end



	for typeTraining, total in pairs(sumValues) do
		averageValues[typeTraining] = total / playerCount
	end

	local updateInfo
	local players = {}

	local frame = vgui.Create("DFrame")
	frame:SetSize(1200, 700)
	frame:DockPadding(0, 0, 0, 0)
	frame:Center()
	frame:SetTitle("")
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function(s, w, h)
		if Diablos.TS.Colors.Blurs then Derma_DrawBackgroundBlur(s, 1) end
		surface.SetDrawColor(Diablos.TS.Colors.Frame) surface.DrawRect(0, 0, w, h)
	end

	local header = vgui.Create("DPanel", frame)
	header:Dock(TOP)
	header:DockMargin(0, 0, 0, 0)
	header:SetTall(40)
	header.Paint = function(s, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.Header) surface.DrawRect(0, h - 4, w, 4)

		draw.SimpleText("ADMIN CLIENT", "Diablos:Font:TS:30", 5, (h - 4) / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
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

	local function changePanel(numPanel, numTraining)
		docker:Clear()
		players = {}

		if numPanel == 1 then

			local timeLaunch = CurTime()

			local trainingInfoPanel = vgui.Create("DPanel", docker)
			trainingInfoPanel:Dock(TOP)
			trainingInfoPanel:DockMargin(50, 0, 50, 10)
			trainingInfoPanel:SetTall(195)
			trainingInfoPanel.Paint = function(s, w, h)

				draw.SimpleText(Diablos.TS:GetLanguageString("globalStatistics"), "Diablos:Font:TS:30", w / 2, 0, Diablos.TS.Colors.gl, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

				local transition = math.min((CurTime() - timeLaunch) * 2, 1)


				for k, typeTraining in ipairs(trainings) do
					local posY = 55 + (k - 1) * 40
					draw.SimpleText(Diablos.TS:GetLanguageString(typeTraining), "Diablos:Font:TS:25:B", 5, posY, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

					local trainingTable = Diablos.TS:GetTrainingLevelTable(typeTraining)
					local maxXP = trainingTable[#trainingTable].xp
					local percent = math.min(averageValues[typeTraining] /  maxXP, 1)
					Diablos.TS:WriteProgressBar(200, posY, 600, 25, percent * transition)

					draw.SimpleText(string.format("%2.f/%2.f", averageValues[typeTraining], maxXP), "Diablos:Font:TS:25:B", w - 5, posY, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

				end
			end

			local globalInfo = vgui.Create("DPanel", docker)
			globalInfo:Dock(TOP)
			globalInfo:DockPadding(0, 0, 0, 0)
			globalInfo:DockMargin(0, 0, 0, 10)
			globalInfo:SetTall(70)
			globalInfo.Paint = function(s, w, h)
				draw.SimpleText(Diablos.TS:GetLanguageString("onlineStatistics"), "Diablos:Font:TS:30", w / 2, 0, Diablos.TS.Colors.gl, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)


				local posx = 190
				for k, typeTraining in ipairs(trainings) do
					draw.SimpleText(Diablos.TS:GetLanguageString(typeTraining), "Diablos:Font:TS:25", posx, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
					posx = posx + 180
				end
				--draw.SimpleText(Diablos.TS:GetLanguageString("strength"), "Diablos:Font:TS:25", 370, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				--draw.SimpleText(Diablos.TS:GetLanguageString("stamina"), "Diablos:Font:TS:25", 550, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				--draw.SimpleText(Diablos.TS:GetLanguageString("runningspeed"), "Diablos:Font:TS:25", 730, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				draw.SimpleText(Diablos.TS:GetLanguageString("activebadge"), "Diablos:Font:TS:25", posx, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			end

			local playersPanel = vgui.Create("DScrollPanel", docker)
			playersPanel:Dock(TOP)
			playersPanel:DockPadding(0, 0, 0, 0)
			playersPanel:DockMargin(0, 0, 0, 10)
			-- playersPanel:GetCanvas():DockPadding(0, 0, 0, 0)
			-- playersPanel:GetCanvas():DockMargin(0, 0, 0, 10)
			playersPanel:SetTall(305)
			playersPanel.Paint = function(s, w, h) end
			local playersPanelVBar = playersPanel:GetVBar()
			playersPanelVBar.Paint = function(s, w, h)
				surface.SetDrawColor(Diablos.TS.Colors.barBackground)
				surface.DrawRect(5, 0, w - 5, h)
			end
			playersPanelVBar.btnGrip.Paint = function(s, w, h)
				surface.SetDrawColor(Diablos.TS.Colors.barFill)
				surface.DrawRect(5, 0, w - 5, h)
			end
			playersPanelVBar.btnUp.Paint = function(s, w, h) end
			playersPanelVBar.btnDown.Paint = function(s, w, h) end


			for curPly, trainingInfo in pairs(playersData) do

				local playerPanel = vgui.Create("DPanel", playersPanel)
				playerPanel:Dock(TOP)
				playerPanel:DockPadding(0, 0, 0, 0)
				playerPanel:DockMargin(0, 0, 0, 10)
				playerPanel:SetTall(110)
				playerPanel.Paint = function(s, w, h)
					surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
					surface.SetDrawColor(Diablos.TS.Colors.bl) surface.DrawRect(0, h - 2, w, 2)


					local k = 1
					local posX = 0
					for typeTraining, training in pairs(trainingInfo.Trainings) do

						local levelData = Diablos.TS:GetTrainingLevel(typeTraining, training.xp)
						local percentageData = Diablos.TS:GetTrainingPercentage(typeTraining, training.xp)

						local order = Diablos.TS:GetTrainingOrder(typeTraining)
						posX = 190 + (order - 1) * 180
						draw.SimpleText(string.format(Diablos.TS:GetLanguageString("xpPoint"), training.xp), "Diablos:Font:TS:25", posX, 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
						draw.SimpleText(string.format("(%s - %u%%)", string.format(Diablos.TS:GetLanguageString("currentLevel"), levelData), percentageData), "Diablos:Font:TS:20", posX, 35, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
						if training.date != 0 then
							draw.SimpleText(string.format("%s: ", Diablos.TS:GetLanguageString("lastTraining")), "Diablos:Font:TS:20", posX, h - 5 - 20, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
						end
						local dateText
						if training.date == 0 then
							dateText = Diablos.TS:GetLanguageString("neverTrained")
						else
							local date = training.date - Diablos.TS.MuscleRest * 60 * 60
							dateText = os.date(Diablos.TS:GetOSFormat(), date)
						end
						draw.SimpleText(dateText, "Diablos:Font:TS:20", posX, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

						k = k + 1
					end

					local badge = trainingInfo.Badge

					posX = posX + 180

					local yesNoText, yesNoColor
					if badge.subdate > os.time() then
						yesNoText = Diablos.TS:GetLanguageString("yes")
						yesNoColor = Diablos.TS.Colors.gl
					else
						yesNoText = Diablos.TS:GetLanguageString("no")
						yesNoColor = Diablos.TS.Colors.rl
					end
					draw.SimpleText(yesNoText, "Diablos:Font:TS:25:B", posX, 5, yesNoColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

					local dateText
					if badge.subdate == 0 then
						dateText = Diablos.TS:GetLanguageString("neverSubscribed")
					else
						dateText = os.date(Diablos.TS:GetOSFormat(), badge.subdate)
					end
					draw.SimpleText(dateText, "Diablos:Font:TS:20", posX, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

					k = k + 1

				end

				local leftBox = vgui.Create("DPanel", playerPanel)
				leftBox:Dock(LEFT)
				leftBox:DockPadding(0, 0, 0, 30)
				leftBox:DockMargin(0, 0, 0, 0)
				leftBox:SetWide(100)
				leftBox.Paint = function(s, w, h)
					local nameText = Diablos.TS:GetLanguageString("undefined")
					if IsValid(curPly) then
						nameText = curPly:Nick()
					end

					draw.SimpleText(nameText, "Diablos:Font:TS:20", w / 2, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				end


				local icon = vgui.Create("DModelPanel", leftBox)
				icon:Dock(FILL)
				icon:DockMargin(5, 5, 5, 5)
				icon:SetModel(curPly:GetModel())
				Diablos.TS:UpdateRenderBounds(icon, 45)

				icon.DoClick = function(s)
				end


			end

			local buttonBottomPanel = vgui.Create("DPanel", docker)
			buttonBottomPanel:Dock(TOP)
			buttonBottomPanel:DockPadding(0, 0, 0, 0)
			buttonBottomPanel:DockMargin(0, 0, 0, 0)
			buttonBottomPanel:SetTall(40)
			buttonBottomPanel.Paint = function(s, w, h)
			end

			local resetPlayerData = vgui.Create("DButton", buttonBottomPanel)
			resetPlayerData:Dock(LEFT)
			resetPlayerData:DockMargin(0, 0, 0, 0)
			resetPlayerData:SetText(Diablos.TS:GetLanguageString("resetPlayerData"))
			resetPlayerData:SetFont("Diablos:Font:TS:30")
			resetPlayerData:SetWide(450)
			resetPlayerData.Paint = function(s, w, h)
				local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
				s:SetTextColor(curColor)
				surface.SetDrawColor(Diablos.TS.Colors.bl) surface.DrawRect(0, 0, w, h)
			end
			resetPlayerData.DoClick = function()
				Diablos.TS:OpenConfirmationBoxPanel(ply, function()
					net.Start("TPTSA:ResetTrainingData")
					net.SendToServer()
					frame:Close()
				end)
			end

			local resetEntityData = vgui.Create("DButton", buttonBottomPanel)
			resetEntityData:Dock(RIGHT)
			resetEntityData:DockMargin(0, 0, 0, 0)
			resetEntityData:SetText(Diablos.TS:GetLanguageString("resetEntityData"))
			resetEntityData:SetFont("Diablos:Font:TS:30")
			resetEntityData:SetWide(450)
			resetEntityData.Paint = function(s, w, h)
				local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
				s:SetTextColor(curColor)
				surface.SetDrawColor(Diablos.TS.Colors.bl) surface.DrawRect(0, 0, w, h)
			end
			resetEntityData.DoClick = function()
				Diablos.TS:OpenConfirmationBoxPanel(ply, function()
					net.Start("TPTSA:ResetEntityData")
					net.SendToServer()
					frame:Close()
				end)
			end

		elseif (numPanel >= 2 and numPanel <= 5) then

			local strings = {}
			local typeTraining = trainings[numPanel-1]

			strings.titleTraining = Diablos.TS:GetLanguageString(typeTraining)

			local trainingTable = Diablos.TS:GetTrainingLevelTable(typeTraining)

			local globalInfo = vgui.Create("DPanel", docker)
			globalInfo:Dock(TOP)
			globalInfo:DockPadding(0, 0, 0, 0)
			globalInfo:DockMargin(0, 0, 0, 10)
			globalInfo:SetTall(25)
			globalInfo.Paint = function(s, w, h)
				draw.SimpleText(Diablos.TS:GetLanguageString("xp"), "Diablos:Font:TS:25", 200, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				draw.SimpleText(Diablos.TS:GetLanguageString("level"), "Diablos:Font:TS:25", 400, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				draw.SimpleText(Diablos.TS:GetLanguageString("percentage"), "Diablos:Font:TS:25", 600, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				draw.SimpleText(Diablos.TS:GetLanguageString("lastTraining"), "Diablos:Font:TS:25", 800, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			end

			local playersPanel = vgui.Create("DScrollPanel", docker)
			playersPanel:Dock(TOP)
			playersPanel:DockPadding(0, 0, 0, 0)
			playersPanel:DockMargin(0, 0, 0, 10)
			playersPanel:SetTall(455)
			playersPanel.Paint = function(s, w, h) end
			local playersPanelVBar = playersPanel:GetVBar()
			playersPanelVBar.Paint = function(s, w, h)
				surface.SetDrawColor(Diablos.TS.Colors.barBackground)
				surface.DrawRect(5, 0, w - 5, h)
			end
			playersPanelVBar.btnGrip.Paint = function(s, w, h)
				surface.SetDrawColor(Diablos.TS.Colors.barFill)
				surface.DrawRect(5, 0, w - 5, h)
			end
			playersPanelVBar.btnUp.Paint = function(s, w, h) end
			playersPanelVBar.btnDown.Paint = function(s, w, h) end


			for curPly, trainingInfo in pairs(playersData) do

				local isSelected = false

				local training = trainingInfo["Trainings"][typeTraining]
				local trainingLevel = Diablos.TS:GetTrainingLevel(typeTraining, training.xp)
				local trainingPercentage = Diablos.TS:GetTrainingPercentage(typeTraining, training.xp)

				local playerPanel = vgui.Create("DPanel", playersPanel)
				playerPanel:Dock(TOP)
				playerPanel:DockPadding(0, 0, 0, 0)
				playerPanel:DockMargin(0, 0, 0, 10)
				playerPanel:SetTall(80)
				playerPanel.Paint = function(s, w, h)
					surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
					local colorAvailability = Diablos.TS.Colors.rl
					if isSelected then
						colorAvailability = Diablos.TS.Colors.gl
					end
					surface.SetDrawColor(colorAvailability) surface.DrawRect(0, h - 2, w, 2)

					if not IsValid(curPly) then
						if isSelected then
							isSelected = false
							table.RemoveByValue(players, curPly)
						end
					end

					for i = 1, 4 do -- 4 information: xp, level, percentage, date
						local posX = 200 + (i - 1) * 200

						local text = ""
						if i == 1 then
							text = string.format("%u/%u", training.xp, trainingTable[#trainingTable].xp)
						elseif i == 2 then
							text = string.format("%u", trainingLevel)
						elseif i == 3 then
							text = string.format("%u%%", trainingPercentage)
						elseif i == 4 then
							if training.date == 0 then
								text = Diablos.TS:GetLanguageString("neverTrained")
							else
								local date = training.date - Diablos.TS.MuscleRest * 60 * 60
								text = string.format("%s", os.date(Diablos.TS:GetOSFormat(), date))
							end
						end

						draw.SimpleText(text, "Diablos:Font:TS:25", posX, h / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					end

					surface.SetDrawColor(color_white)
					surface.SetMaterial(Diablos.TS.Materials.circle)
					local size = 60
					surface.DrawTexturedRect(w - size - 10, h / 2 - size / 2, size, size)
					if isSelected then
						surface.SetMaterial(Diablos.TS.Materials.checked)
						surface.DrawTexturedRect(w - size - 10 + 10, h / 2 - size / 2 + 10, size - 20, size - 20)
					end
				end

				local changeSelectState = vgui.Create("DButton", playerPanel)
				changeSelectState:Dock(FILL)
				changeSelectState:SetText("")
				changeSelectState:SetFont("Diablos:Font:TS:35")
				changeSelectState.Paint = function(s, w, h)

				end

				changeSelectState.DoClick = function(s)
					if IsValid(curPly) then
						isSelected = not isSelected
						if isSelected then
							table.insert(players, curPly)
						else
							table.RemoveByValue(players, curPly)
						end
						UpdateAmountPlayersSelected(updateInfo, #players)
					end
				end

				local leftBox = vgui.Create("DPanel", playerPanel)
				leftBox:Dock(LEFT)
				leftBox:DockPadding(0, 0, 0, 30)
				leftBox:DockMargin(0, 0, 0, 0)
				leftBox:SetWide(100)
				leftBox.Paint = function(s, w, h)
					local nameText = Diablos.TS:GetLanguageString("undefined")
					if IsValid(curPly) then
						nameText = curPly:Nick()
					end

					draw.SimpleText(nameText, "Diablos:Font:TS:20", w / 2, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				end


				local icon = vgui.Create("DModelPanel", leftBox)
				icon:Dock(FILL)
				icon:DockMargin(5, 5, 5, 5)
				icon:SetModel(curPly:GetModel())
				Diablos.TS:UpdateRenderBounds(icon, 80)

				icon.DoClick = function(s)
					if IsValid(curPly) then
						isSelected = not isSelected
						if isSelected then
							table.insert(players, curPly)
						else
							table.RemoveByValue(players, curPly)
						end
						UpdateAmountPlayersSelected(updateInfo, #players)
					end
				end
			end

			local setVariables = vgui.Create("DPanel", docker)
			setVariables:Dock(TOP)
			setVariables:DockPadding(0, 0, 0, 0)
			setVariables:DockMargin(0, 0, 0, 10)
			setVariables:SetTall(50)
			setVariables.Paint = function(s, w, h)
				draw.SimpleText(string.format(Diablos.TS:GetLanguageString("peopleSelected"), GetStringFromSelectedPlayers(players)), "Diablos:Font:TS:25", w / 2, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

				draw.SimpleText(Diablos.TS:GetLanguageString("peopleSelectedTip"), "Diablos:Font:TS:20", w / 2, h, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			end

			local trainingPanel = vgui.Create("DPanel", docker)
			trainingPanel:Dock(TOP)
			trainingPanel:DockPadding(250, 0, 0, 0)
			trainingPanel:DockMargin(0, 0, 0, 10)
			trainingPanel:SetTall(30)
			trainingPanel.Paint = function(s, w, h)
				draw.SimpleText(string.format(Diablos.TS:GetLanguageString("setTo"), strings.titleTraining), "Diablos:Font:TS:30", 5, h / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				draw.SimpleText(Diablos.TS:GetLanguageString("xp"), "Diablos:Font:TS:25", w - 5, h / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			end

			local valueToChange = vgui.Create("DNumberWang", trainingPanel)
			valueToChange:Dock(RIGHT)
			valueToChange:DockMargin(0, 0, 50, 0)
			valueToChange:SetMinMax(0, 65535)
			valueToChange:HideWang()
			valueToChange:SetValue(0)
			valueToChange:SetFont("Diablos:Font:TS:35")
			valueToChange:SetWide(80)
			valueToChange.Paint = function(s, w, h)
				surface.SetDrawColor(Diablos.TS.Colors.bl2)
				surface.DrawRect(0, 0, w, h)
				s:DrawTextEntryText(Diablos.TS.Colors.Label, Diablos.TS.Colors.LabelHovered, Diablos.TS.Colors.LabelDown)
			end
			valueToChange.OnValueChanged = function(s, val)
			end

			updateInfo = vgui.Create("DButton", docker)
			updateInfo:Dock(TOP)
			updateInfo:DockMargin(0, 0, 0, 0)
			updateInfo:SetTall(40)
			updateInfo:SetText(string.format(Diablos.TS:GetLanguageString("updateSelection"), 0))
			updateInfo:SetFont("Diablos:Font:TS:35")
			updateInfo.Paint = function(s, w, h)
				local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
				s:SetTextColor(curColor)
				local colorGreenRed = Diablos.TS.Colors.g
				if #players == 0 then
					colorGreenRed = Diablos.TS.Colors.r
				end
				surface.SetDrawColor(colorGreenRed) surface.DrawRect(0, 0, w, h)
			end
			updateInfo.DoClick = function(s)
				if #players > 0 then
					net.Start("TPTSA:EditTrainingData")
						net.WriteUInt(#players, 8)
						for k, v in ipairs(players) do
							net.WriteEntity(v)
						end
						-- Send trainingtype:
						-- 0: stamina / 1: running speed / 2: strength / 3: attack speed
						net.WriteUInt(numTraining, 2)
						-- The new value
						net.WriteUInt(valueToChange:GetValue(), 32)
					net.SendToServer()
					frame:Close()
				end
			end

		end

		idopen = numPanel

	end

	changePanel(1)

	-- Left panel for buttons

	local leftPanel = vgui.Create("DPanel", frame)
	leftPanel:Dock(LEFT)
	leftPanel:SetWide(150)
	leftPanel:DockPadding(0, 10, 0, 0)
	leftPanel:DockMargin(0, 0, 0, 0)
	leftPanel.Paint = function(s, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
	end

	-- Assign buttons to the left panel

	local num = 1
	for k, v in ipairs(Diablos.TS.DermaButtons) do
		if k > 1 and not Diablos.TS:IsTrainingEnabled(v.str) then continue end
		local time_anim, end_anim = 0, 0

		local new_k = num

		local panel = vgui.Create("DPanel", leftPanel)
		panel:Dock(TOP)
		panel:DockMargin(0, 0, 0, 0)
		panel:SetTall(50)
		panel.Paint = function(s, w, h)
			if idopen == new_k then
				surface.SetDrawColor(Diablos.TS.Colors.navbarSelection) surface.DrawRect(0, 0, 2, h)
			else
				local curtime = CurTime()
				surface.SetDrawColor(Diablos.TS.Colors.navbarSelection)

				if end_anim != 0 then
					local val = curtime - end_anim
					surface.DrawRect(0, 0, 2 - 8 * val, h)
					if val >= 0.25 then time_anim, end_anim = 0, 0 end
				elseif time_anim != 0 then
					local val = math.min(curtime - time_anim, 1) * 2
					surface.DrawRect(0, 0, math.min(8 * val, 2), h)
				end
			end
		end

		local button = vgui.Create("DButton", panel)
		button:Dock(FILL)
		button:SetText("")
		button.Paint = function(s, w, h)
			local size = 20
			surface.SetDrawColor(color_white)
	        surface.SetMaterial(v.icon)
	        surface.DrawTexturedRect(10, h / 2 - size / 2, size, size)

			local font = "Diablos:Font:TS:20"
			if idopen == new_k then
				font = "Diablos:Font:TS:20:B"
			end

			surface.SetFont(font)
			local textSize = surface.GetTextSize(Diablos.TS:GetLanguageString(v.str))
			if textSize > w - 40 then
				if isBold then
					font = "Diablos:Font:TS:15:B"
				else
					font = "Diablos:Font:TS:15"
				end
			end

			draw.SimpleText(Diablos.TS:GetLanguageString(v.str), font, 40, h / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		button.OnCursorEntered = function(s)
			time_anim = CurTime()
		end
		button.OnCursorExited = function(s)
			end_anim = CurTime()
		end
		button.DoClick = function(s)
			if idopen == new_k then return end
			changePanel(new_k, k - 2)
		end

		num = num + 1
	end

	frame:MakePopup()
end)
--PATH addons/the_perfect_training_system/lua/diablos_training/shared/sh_functions_global.lua:
/*---------------------------------------------------------------------------
	Construct the training table
	This function manages the way the table is being created
	This also takes in consideration if playerData is nil 
---------------------------------------------------------------------------*/

function Diablos.TS:ConstructTrainingTable(ply, playerData)

	if not playerData then
		playerData = {}
		playerData.strengthXP = 0
		playerData.strengthDate = 0

		playerData.staminaXP = 0
		playerData.staminaDate = 0

		playerData.runningspeedXP = 0
		playerData.runningspeedDate = 0

		playerData.attackspeedXP = 0
		playerData.attackspeedDate = 0
	end

	if not playerData.subValidDate and Diablos.TS.SubSystem then
		playerData.subValidDate = 0
	end
	if not Diablos.TS.SubSystem then -- If there is no sub, then the subValidDate will be at its maximum
		playerData.subValidDate = 2147483647 -- 2^31-1
	end

	ply.Training = {
		Trainings = {
			strength = {
				xp = tonumber(playerData.strengthXP),
				date = tonumber(playerData.strengthDate),
			},
			stamina = {
				xp = tonumber(playerData.staminaXP),
				date = tonumber(playerData.staminaDate),
			},
			runningspeed = {
				xp = tonumber(playerData.runningspeedXP),
				date = tonumber(playerData.runningspeedDate),
			},
			attackspeed = {
				xp = tonumber(playerData.attackspeedXP),
				date = tonumber(playerData.attackspeedDate),
			},
		},
		Badge = {
			subdate = tonumber(playerData.subValidDate),
		},
	}

	ply:TSTrainingDataLaunched()

end


/*---------------------------------------------------------------------------
	Transforms a saved table to a SQL table for the syntax
---------------------------------------------------------------------------*/

function Diablos.TS:TransformSavedTableToSQLTable(savedTable)
	if not savedTable then return nil end

	local sqlTable = {}
	sqlTable.subValidDate = savedTable.Badge.subdate

	sqlTable.strengthXP = savedTable.Trainings.strength.xp
	sqlTable.strengthDate = savedTable.Trainings.strength.date

	sqlTable.staminaXP = savedTable.Trainings.stamina.xp
	sqlTable.staminaDate = savedTable.Trainings.stamina.date

	sqlTable.runningspeedXP = savedTable.Trainings.runningspeed.xp
	sqlTable.runningspeedDate = savedTable.Trainings.runningspeed.date

	sqlTable.attackspeedXP = savedTable.Trainings.attackspeed.xp
	sqlTable.attackspeedDate = savedTable.Trainings.attackspeed.date

	return sqlTable
end

/*---------------------------------------------------------------------------
	Get the format of the osDate (shown in some interfaces)
---------------------------------------------------------------------------*/

function Diablos.TS:GetOSFormat()
	return "%d/%m - %H:%M"
end

/*---------------------------------------------------------------------------
	Get if the entity class is a training entity or not
	Used to verify you're editing a training entity when using the toolgun or dropping object with the physgun
---------------------------------------------------------------------------*/

local trainingEntities = {
	["diablos_weigh_balance"] = true,
	["diablos_card_reader"] = true,
	["diablos_turnstile"] = true,
	["diablos_treadmill"] = true,
	["diablos_dumbbell"] = true,
	["diablos_punching_base"] = true,
	["diablos_punching_ball"] = true,
}

function Diablos.TS:IsTrainingEntity(class)
	return trainingEntities[class]
end


/*---------------------------------------------------------------------------
	Get the trainings enabled on the server
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainings()
	local trainings = {}

	if Diablos.TS:IsTrainingEnabled("strength") then
		table.insert(trainings, "strength")
	end
	if Diablos.TS:IsTrainingEnabled("attackspeed") then
		table.insert(trainings, "attackspeed")
	end
	if Diablos.TS:IsTrainingEnabled("stamina") then
		table.insert(trainings, "stamina")
	end
	if Diablos.TS:IsTrainingEnabled("runningspeed") then
		table.insert(trainings, "runningspeed")
	end

	return trainings
end

/*---------------------------------------------------------------------------
	Get the trainings orders on the server
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainingOrder(typeTraining)
	local result = 0

	local trainings = Diablos.TS:GetTrainings()
	for i = 1, #trainings do
		if trainings[i] == typeTraining then
			result = i
		end
	end

	return result
end

/*---------------------------------------------------------------------------
	Get if a specific training is enabled
---------------------------------------------------------------------------*/
function Diablos.TS:IsTrainingEnabled(trainingName)
	local trainingEnabled = false
	if trainingName == "strength" then
		trainingEnabled = Diablos.TS.StrengthEnabled
	elseif trainingName == "attackspeed" then
		trainingEnabled = Diablos.TS.AttackSpeedEnabled
	elseif trainingName == "stamina" then
		trainingEnabled = Diablos.TS.StaminaEnabled
	elseif trainingName == "runningspeed" then
		trainingEnabled = Diablos.TS.RunningSpeedEnabled
	end
	return trainingEnabled
end

/*---------------------------------------------------------------------------
	Get the training level table, which returns the table you want to use depending on the typeTraining variable
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainingLevelTable(typeTraining)
	typeTraining = string.lower(typeTraining)

	if typeTraining == "stamina" then
		return Diablos.TS.StaminaLevels
	elseif typeTraining == "runningspeed" then
		return Diablos.TS.RunningSpeedLevels
	elseif typeTraining == "strength" then
		return Diablos.TS.StrengthLevels
	elseif typeTraining == "attackspeed" then
		return Diablos.TS.AttackSpeedLevels
	end
end

/*---------------------------------------------------------------------------
	Get the training bodygroup table, which returns the table you want to use depending on the typeTraining variable
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainingBodygroupTable(typeTraining)
	typeTraining = string.lower(typeTraining)

	if typeTraining == "stamina" then
		return Diablos.TS.StaminaEquivalence
	elseif typeTraining == "runningspeed" then
		return Diablos.TS.RunningSpeedEquivalence
	elseif typeTraining == "strength" then
		return Diablos.TS.DumbbellSizeEquivalence
	elseif typeTraining == "attackspeed" then
		return Diablos.TS.PunchingBallSizeEquivalence
	end
end

/*---------------------------------------------------------------------------
	Get the training level with arguments:
		- typeTraining: a specific type of training 
		- data: a player OR a integer meaning the XP we want to check the level for
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainingLevel(typeTraining, data)

	local levelTab = Diablos.TS:GetTrainingLevelTable(typeTraining)

	local xp = Diablos.TS:GetXPFromData(typeTraining, data)

	local level = 1
	if levelTab then
		for k, v in ipairs(levelTab) do
			if v.xp <= xp then
				level = k
			else
				break
			end
		end
	end

	return level
end

/*---------------------------------------------------------------------------
	Get the training XP from data with:
		- typeTraining: a specific type of training
		- data: a player, in which case we'll get its xp with GetTrainingInfo
		OR a integer, in which case we won't do anything as this is already the XP
---------------------------------------------------------------------------*/

function Diablos.TS:GetXPFromData(typeTraining, data)
	local xp = 0
	if IsEntity(data) then
		local trainingInfo = data:TSGetTrainingInfo(typeTraining)
		-- Calling GetXPFromData with a disabled typeTraining would have a nil trainingInfo table
		if trainingInfo then
			xp = trainingInfo.xp
		end
	elseif isnumber(data) then
		xp = data
	end
	return xp
end

/*---------------------------------------------------------------------------
	Get the training percentage with arguments:
		- typeTraining: a specific type of training 
		- data: a player OR a integer meaning the XP we want to check the level for

	This returns a percentage (from 0 to 100)
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainingPercentage(typeTraining, data)
	local xp = Diablos.TS:GetXPFromData(typeTraining, data)

	local levelTab = Diablos.TS:GetTrainingLevelTable(typeTraining)
	-- get the level with the GetTrainingLevel function with XP
	local level = Diablos.TS:GetTrainingLevel(typeTraining, xp)

	local percentage = 0
	if levelTab then

		local xpCurrentLevel = levelTab[level].xp

		local isLastLevel = level == #levelTab
		if isLastLevel then
			percentage = 100 -- last level
		else
			local xpNextLevel = levelTab[level + 1].xp

			local xpDifference = math.max(xp - xpCurrentLevel, 0)
			percentage = xpDifference / (xpNextLevel - xpCurrentLevel) * 100
		end
	end

	return percentage
end

/*---------------------------------------------------------------------------
	Get an integer from the type of training
	Used to send a UInt for network between client and server
---------------------------------------------------------------------------*/

function Diablos.TS:GetIntegerFromTraining(typeTraining)
	local toReturn = -1
	if typeTraining == "strength" then
		toReturn = 0
	elseif typeTraining == "attackspeed" then
		toReturn = 1
	elseif typeTraining == "stamina" then
		toReturn = 2
	elseif typeTraining == "runningspeed" then
		toReturn = 3
	end
	return toReturn
end

/*---------------------------------------------------------------------------
	Get the type of training from an integer
	Used to get the training from a UInt received with network between client and server
---------------------------------------------------------------------------*/

function Diablos.TS:GetTrainingFromInteger(integer)

	local toReturn = ""
	if integer == 0 then
		toReturn = "strength"
	elseif integer == 1 then
		toReturn = "attackspeed"
	elseif integer == 2 then
		toReturn = "stamina"
	elseif integer == 3 then
		toReturn = "runningspeed"
	end
	return toReturn
end

/*---------------------------------------------------------------------------
	Get an integer from the ENTITY
	Used by the toolgun to act differently depending on the entity you're editing
---------------------------------------------------------------------------*/

function Diablos.TS:GetIntegerFromEntity(entity)
	local toReturn = -1
	if entity == "diablos_weigh_balance" then
		toReturn = 1
	elseif entity == "diablos_card_reader" then
		toReturn = 2
	elseif entity == "diablos_turnstile" then
		toReturn = 3
	elseif entity == "diablos_treadmill" then
		toReturn = 4
	elseif entity == "diablos_dumbbell" then
		toReturn = 5
	elseif entity == "diablos_punching_base" then
		toReturn = 6
	end
	return toReturn
end

/*---------------------------------------------------------------------------
	Get an entity from an INTEGER
	Used to get the entity from a UInt received with network when an admin is editing an entity
---------------------------------------------------------------------------*/

function Diablos.TS:GetEntityFromInteger(integer)
	local toReturn = ""
	if integer == 1 then
		toReturn = "diablos_weigh_balance"
	elseif integer == 2 then
		toReturn = "diablos_card_reader"
	elseif integer == 3 then
		toReturn = "diablos_turnstile"
	elseif integer == 4 then
		toReturn = "diablos_treadmill"
	elseif integer == 5 then
		toReturn = "diablos_dumbbell"
	elseif integer == 6 then
		toReturn = "diablos_punching_base"
	end
	return toReturn
end


/*---------------------------------------------------------------------------
	Get a random number representing a key which:
		* can't be the key entered in parameter 
		* neither a blocklisted key in the Diablos.TS.DumbbellKeyBlocklist table
	Keys are going from 1 to 36, 1 being the KEY_0 and 36 being KEY_Z
---------------------------------------------------------------------------*/

function Diablos.TS:GetRandomKey(blocklistedNumber)
	local numb = math.ceil(math.Rand(0, 36))
	while (table.HasValue(Diablos.TS.DumbbellKeyBlocklist, numb) || numb == blocklistedNumber) do
		numb = math.ceil(math.Rand(0, 36))
	end
	return numb
end

/*---------------------------------------------------------------------------
	Get the mile conversion from a unit number
---------------------------------------------------------------------------*/

function Diablos.TS:GetMPHFromUnit(unit)
	return unit * 15 / 352 -- written at https://developer.valvesoftware.com/wiki/Dimensions	
end

/*---------------------------------------------------------------------------
	Get the kilometer conversion from a unit number
---------------------------------------------------------------------------*/

function Diablos.TS:GetKMHFromUnit(unit)
	return Diablos.TS:GetMPHFromUnit(unit) * 1.60934
end

/*---------------------------------------------------------------------------
	Get the speed conversion depending on the server owner's choice
---------------------------------------------------------------------------*/

function Diablos.TS:GetSpeedFromUnit(unit)
	local result = 0
	if Diablos.TS.IsMph then
		result = Diablos.TS:GetMPHFromUnit(unit)
	else
		result = Diablos.TS:GetKMHFromUnit(unit)
	end
	return result
end

/*---------------------------------------------------------------------------
	Get the speed text depending on the server owner's choice
---------------------------------------------------------------------------*/
function Diablos.TS:GetSpeedText()
	local result = ""
	if Diablos.TS.IsMph then
		result = "mph"
	else
		result = "kmh"
	end
	return result
end

/*---------------------------------------------------------------------------
	We don't have a kg to lbs conversion function, as I directly wrote the values in the equivalence variables above
	Otherwise, it would have been
		* local lbsToKg = 0.453592 * val
		* local kgToLbs = 2.20462 * val
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
	Get the weight text depending on the server owner's choice
---------------------------------------------------------------------------*/

function Diablos.TS:GetWeightText()
	local result = ""
	if Diablos.TS.IsLbs then
		result = Diablos.TS:GetLanguageString("lbs")
	else
		result = Diablos.TS:GetLanguageString("kg")
	end
	return result
end


/*---------------------------------------------------------------------------
	Returns if ply is an admin for the training addon
---------------------------------------------------------------------------*/

function Diablos.TS:IsAdmin(ply)
	return Diablos.TS.AdminGroups[ply:GetUserGroup()]
end


/*---------------------------------------------------------------------------
	Get the string depending on the language
---------------------------------------------------------------------------*/

function Diablos.TS:GetLanguageString(key)
	-- key = string.lower(key)
	local str = Diablos.TS.Strings[key]
	if not str then
		str = "UNDEFINED STRING - MAKE SURE YOU HAVE THE LATEST ADDON VERSION OR CONTACT THE AUTHOR"
	end
	return str
end

/*---------------------------------------------------------------------------
	Get a proper time format
	Work the same way than string.NiceTime but with more features and language integration
	Functions inspiration taken at https://stackoverflow.com/questions/42472876/convert-int-in-to-nice-time-format
---------------------------------------------------------------------------*/

function Diablos.TS:TimeFormat(text, name, delta, time)
	if (delta >= time) then
		if #text > 0 then
			text = text .. " " .. Diablos.TS:GetLanguageString("andStr") .. " "
		end

		local timeCalc = math.floor(delta / time)

		if delta >= time * 2 then
			name = name .. "s"
		end
		Diablos.TS:GetLanguageString(name)

		text = text .. timeCalc .. " " .. Diablos.TS:GetLanguageString(name)
		delta = delta % time;
	end
	return text, delta
end

function Diablos.TS:NiceTimeFormat(seconds, hideSecond, hideMinute, hideHour, hideDay, hideMonth, hideYear)
	local second = 1
	local minute = 60 * second
	local hour = 60 * minute
	local day = 24 * hour
	local month = 30 * day
	local year = 365 * day

	local text = ""
	local delta = seconds

	if not hideYear then
		text, delta = Diablos.TS:TimeFormat(text, "year", delta, year)
	end
	if not hideMonth then
		text, delta = Diablos.TS:TimeFormat(text, "month", delta, month)
	end
	if not hideDay then
		text, delta = Diablos.TS:TimeFormat(text, "day", delta, day)
	end
	if not hideHour then
		text, delta = Diablos.TS:TimeFormat(text, "hour", delta, hour)
	end
	if not hideMinute then
		text, delta = Diablos.TS:TimeFormat(text, "minute", delta, minute)
	end
	if not hideSecond then
		text, delta = Diablos.TS:TimeFormat(text, "second", delta, second)
	end

	return text
end

/*---------------------------------------------------------------------------
	Get the currency symbol depending on your gamemode
----------------------------------------------------------------------------*/

function Diablos.TS:GetCurrencySymbol()
	local result = ""
	if DarkRP then
		result = GAMEMODE.Config.currency
	elseif nut then
		result = nut.currency.symbol
	elseif ix then
		result = ix.currency.symbol
	elseif PS then
		result = PS.Config.PointsName
	elseif PointShop2 then
		if Diablos.TS.PointshopPremium then
			result = " Premium Points"
		else
			result = " Points"
		end
	end
	return result
end

/*---------------------------------------------------------------------------
	Get the currency format type depending on your gamemode
----------------------------------------------------------------------------*/

function Diablos.TS:GetCurrencyFormatType(money)
	local result = money
	if DarkRP then
		result = DarkRP.formatMoney(money)
	elseif nut then
		result = nut.currency.get(money)
	elseif ix then
		result = ix.currency.Get(money)
	elseif PS then
		result = money .. PS.Config.PointsName
	elseif PointShop2 then
		if Diablos.TS.PointshopPremium then
			result = money .. " Premium Points"
		else
			result = money .. " Points"
		end
	else -- No system at all
		if result == 0 then
			result = ""
		end
	end
	return result
end

/*---------------------------------------------------------------------------
	Get the way of adding money depending on your gamemode
----------------------------------------------------------------------------*/

function Diablos.TS:AddMoney(ply, money)
	if DarkRP then
		ply:addMoney(money)
	elseif nut then
		local char = ply:getChar()
		if IsValid(char) then
			char:giveMoney(money)
		end
	elseif ix then
		local char = ply:GetCharacter()
		if IsValid(char) then
			local curMoney = char:GetMoney()
			char:SetMoney(curMoney + money)
		end
	elseif PS then -- Pointshop1 (https://pointshop.burt0n.net/player-meta-functions/points)
		ply:PS_GivePoints(money)
	elseif Pointshop2 then -- Pointshop2 (http://pointshop2.kamshak.com/en/latest/developer/points.html)
		if Diablos.TS.PointshopPremium then
			ply:PS2_AddPremiumPoints(money)
		else
			ply:PS2_AddStandardPoints(money)
		end
	end
end

/*---------------------------------------------------------------------------
	Get the way of removing money depending on your gamemode
----------------------------------------------------------------------------*/

function Diablos.TS:RemoveMoney(ply, money)
	if DarkRP then
		ply:addMoney(-money)
	elseif nut then
		local char = ply:getChar()
		if IsValid(char) then
			char:takeMoney(money)
		end
	elseif ix then
		local char = ply:GetCharacter()
		if IsValid(char) then
			local curMoney = char:GetMoney()
			char:SetMoney(curMoney - money)
		end
	elseif PS then -- Pointshop1 (https://pointshop.burt0n.net/player-meta-functions/points)
		ply:PS_TakePoints(money)
	elseif Pointshop2 then -- Pointshop2 (http://pointshop2.kamshak.com/en/latest/developer/points.html)
		if Diablos.TS.PointshopPremium then
			ply:PS2_AddPremiumPoints(money)
		else
			ply:PS2_AddStandardPoints(money)
		end
	end
end

/*---------------------------------------------------------------------------
	Get the way of getting if the player has enough money depending on your gamemode
----------------------------------------------------------------------------*/

function Diablos.TS:HasEnoughMoney(ply, money)
	local result = false
	if DarkRP then
		result = ply:canAfford(money)
	elseif nut then
		local char = ply:getChar()
		if IsValid(char) then
			result = char:getMoney() >= money
		end
	elseif ix then
		local char = ply:GetCharacter()
		if IsValid(char) then
			result = char:GetMoney() >= money
		end
	elseif PS then
		result = ply:PS_HasPoints(money)
	elseif Pointshop2 then
		if ply.PS2_Wallet then
			if Diablos.TS.PointshopPremium then
				result = ply.PS2_Wallet.premiumPoints >= money
			else
				result = ply.PS2_Wallet.points >= money
			end
		end
	else -- No system at all
		result = true
	end
	return result
end


/*---------------------------------------------------------------------------
	Get if you're using the Kobralost Character Addon at https://www.gmodstore.com/market/view/character-creator-the-best-character-creation-script
----------------------------------------------------------------------------*/

function Diablos.TS:IsUsingCharacterSystem()
	return istable(CharacterCreator)
end
--PATH addons/warning_system/lua/warning_system_7452/shared/thresholds/ban.lua:
local THRESHOLD = {}

THRESHOLD.Name = "Ban"

THRESHOLD.Params = {
    { name = "reason", type = "string" },
    { name = "duration", type = "time" }
}

function THRESHOLD:Execute(pPlayer, ...)
    local tParams = {...}
    local sReason = tParams[1]
    local iDuration = tParams[2]

    if( ULib ) then
        ULib.ban(pPlayer, iDuration / 60, sReason)
    elseif( serverguard ) then
        pPlayer:Ban(iDuration / 60, true, sReason)
    elseif( xAdmin ) then
        xAdmin.Admin.RegisterBan(pPlayer, nil, sReason, iDuration / 60)
    elseif( SAM ) then
        pPlayer:sam_ban(iDuration / 60, sReason, pPlayer:SteamID())
    else
        pPlayer:Ban(iDuration / 60, true)
    end
end

WarningSystem7452em:RegisterThreshold("ban", THRESHOLD)
--PATH addons/warning_system/lua/warning_system_7452/shared/thresholds/darkrp_remove_money.lua:
local THRESHOLD = {}

THRESHOLD.Name = "DarkRP - Remove Money"

THRESHOLD.Params = {
    { name = "amount", type = "int" },
}

function THRESHOLD:Can()
    return DarkRP
end

function THRESHOLD:Execute(pPlayer, ...)
    if( not self:Can() ) then return end
    
    local tParams = {...}
    local iAmount = tParams[1]

    pPlayer:addMoney(- iAmount)
end

WarningSystem7452em:RegisterThreshold("darkrp_remove_money", THRESHOLD)
--PATH addons/warning_system/lua/warning_system_7452/shared/thresholds/jail.lua:
local THRESHOLD = {}

THRESHOLD.Name = "Jail"

THRESHOLD.Params = {
    { name = "duration", type = "time" },
}

function THRESHOLD:Can()
    return ulx or FAdmin 
end

function THRESHOLD:Execute(pPlayer, ...)
    if( not self:Can() ) then return end
    
    local tParams = {...}
    local iDuration = tParams[1]

    if( ulx ) then
        RunConsoleCommand("ulx", "jail", "$" .. pPlayer:SteamID(), iDuration)
    elseif ( FAdmin ) then
        RunConsoleCommand("_FAdmin", "jail", pPlayer:UserID(), iDuration)
    end
end

WarningSystem7452em:RegisterThreshold("jail", THRESHOLD)
--PATH addons/sl_utils/lua/advdupe2/sh_codec_legacy.lua:
--[[
	Title: Adv. Dupe 2 Codec Legacy Support

	Desc: Facilitates opening of dupes from AD1 and earlier AD2 versions.

	Author: emspike

	Version: 2.0
]]

local pairs = pairs
local type = type
local tonumber = tonumber
local error = error
local Vector = Vector
local Angle = Angle
local format = string.format
local char = string.char
local byte = string.byte
local sub = string.sub
local gsub = string.gsub
local find = string.find
local gmatch = string.gmatch
local match = string.match
local concat = table.concat

--[[
	Name:	GenerateDupeStamp
	Desc:	Generates an info table.
	Params:	<player> ply
	Return:	<table> stamp
]]
function AdvDupe2.GenerateDupeStamp(ply)
	local stamp = {}
	stamp.name = ply:GetName()
	stamp.time = os.date("%I:%M %p")
	stamp.date = os.date("%d %B %Y")
	stamp.timezone = os.date("%z")
	hook.Call("AdvDupe2_StampGenerated",GAMEMODE,stamp)
	return stamp
end

local AD2FF = "AD2F%s\n%s\n%s"

local decode_types_v1, decode_types_v2
local tables = 0
local str,pos
local a,b,c,m,n,w,tblref

local function read_v2()
	local t = byte(str, pos+1)
	if t then
		local dt = decode_types_v2[t]
		if dt then
			pos = pos + 1
			return dt()
		else
			error(format("encountered invalid data type (%u)\n",t))
		end
	else
		error("expected value, got EOF\n")
	end
end

decode_types_v2 = {
	[1	] = function()
		error("expected value, got terminator\n")
	end,
	[2	] = function() -- table
		
		m = find(str, "\1", pos)
		if m then
			w = sub(str, pos+1, m-1)
			pos = m
		else
			error("expected table identifier, got EOF\n")
		end
		
		local t = {}
		tables[w] = t
		
		while true do
			if byte(str, pos+1) == 1 then
				pos = pos + 1
				return t
			else
				t[read_v2()] = read_v2()
			end
		end
	end,
	[3	] = function() -- array
		
		m = find(str, "\1", pos)
		if m then
			w = sub(str, pos+1, m-1)
			pos = m
		else
			error("expected table identifier, got EOF\n")
		end
		
		local t, i = {}, 1
		
		tables[w] = t
		
		while true do
			if byte(str,pos+1) == 1 then
				pos = pos+1
				return t
			else
				t[i] = read_v2()
				i = i + 1
			end
		end
	end,
	[4	] = function() -- false boolean
		return false
	end,
	[5	] = function() -- true boolean
		return true
	end,
	[6	] = function() -- number
		m = find(str, "\1", pos)
		if m then
			a = tonumber(sub(str, pos+1, m-1)) or 0
			pos = m
			return a
		else
			error("expected number, got EOF\n")
		end
	end,
	[7	] = function() -- string
		m = find(str,"\1",pos)
		if m then
			w = sub(str, pos+1, m-1)
			pos = m
			return w
		else
			error("expected string, got EOF\n")
		end
	end,
	[8	] = function() -- Vector
		m,n = find(str,".-\1.-\1.-\1", pos)
		if m then
			a,b,c = match(str,"^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Vector(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected vector, got EOF\n")
		end
	end,
	[9	] = function() -- Angle
		m,n = find(str, ".-\1.-\1.-\1", pos)
		if m then
			a,b,c = match(str, "^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Angle(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected angle, got EOF\n")
		end
	end,
	[10	] = function() -- Table Reference
		m = find(str,"\1",pos)
		if m then
			w = sub(str,pos+1,m-1)
			pos = m
		else
			error("expected table identifier, got EOF\n")
		end
		tblref = tables[w]
		
		if tblref then
			return tblref
		else
			error(format("table identifier %s points to nil\n", w))
		end
		
	end
}



local function read_v1()
	local t = byte(str,pos+1)
	if t then
		local dt = decode_types_v1[t]
		if dt then
			pos = pos + 1
			return dt()
		else
			error(format("encountered invalid data type (%u)\n",t))
		end
	else
		error("expected value, got EOF\n")
	end
end

decode_types_v1 = {
	[1	] = function()
		error("expected value, got terminator\n")
	end,
	[2	] = function() -- table
		local t = {}
		while true do
			if byte(str,pos+1) == 1 then
				pos = pos+1
				return t
			else
				t[read_v1()] = read_v1()
			end
		end
	end,
	[3	] = function() -- array
		local t, i = {}, 1
		while true do
			if byte(str,pos+1) == 1 then
				pos = pos+1
				return t
			else
				t[i] = read_v1()
				i = i + 1
			end
		end
	end,
	[4	] = function() -- false boolean
		return false
	end,
	[5	] = function() -- true boolean
		return true
	end,
	[6	] = function() -- number
		m = find(str,"\1",pos)
		if m then
			a = tonumber(sub(str,pos+1,m-1)) or 0
			pos = m
			return a
		else
			error("expected number, got EOF\n")
		end
	end,
	[7	] = function() -- string
		m = find(str,"\1",pos)
		if m then
			w = sub(str,pos+1,m-1)
			pos = m
			return w
		else
			error("expected string, got EOF\n")
		end
	end,
	[8	] = function() -- Vector
		m,n = find(str,".-\1.-\1.-\1",pos)
		if m then
			a,b,c = match(str,"^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Vector(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected vector, got EOF\n")
		end
	end,
	[9	] = function() -- Angle
		m,n = find(str,".-\1.-\1.-\1",pos)
		if m then
			a,b,c = match(str,"^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Angle(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected angle, got EOF\n")
		end
	end
}

local function deserialize_v1(data)
	str = data
	pos = 0
	tables = {}
	return read_v1()
end

local function deserialize_v2(data)
	str = data
	pos = 0
	tables = {}
	return read_v2()
end

local function lzwDecode(encoded)
	local dictionary_length = 256
	local dictionary = {}
	for i = 0, 255 do
		dictionary[i] = char(i)
	end
	
	local pos = 2
	local decompressed = {}
	local decompressed_length = 1
	
	local index = byte(encoded)
	local word = dictionary[index]
	
	decompressed[decompressed_length] = dictionary[index]
	
	local entry
	local encoded_length = #encoded
	local firstbyte --of an index
	while pos <= encoded_length do
		firstbyte = byte(encoded,pos)
		if firstbyte > 252 then --now we know it's a length indicator for a multibyte index
			index = 0
			firstbyte = 256 - firstbyte
			
			--[[if pos+firstbyte > encoded_length then	--will test for performance impact
				error("expected index got EOF")
			end]]
			
			for i = pos+firstbyte, pos+1, -1 do
				index = bit.bor(bit.lshift(index, 8), byte(encoded,i))
			end
			pos = pos + firstbyte + 1
		else
			index = firstbyte
			pos = pos + 1
		end
		entry = dictionary[index] or (word..sub(word,1,1))
		decompressed_length = decompressed_length + 1
		decompressed[decompressed_length] = entry
		dictionary[dictionary_length] = word..sub(entry,1,1)
		dictionary_length = dictionary_length + 1
		word = entry
	end
	return concat(decompressed)
end

--http://en.wikipedia.org/wiki/Huffman_coding#Decompression

local invcodes = {[2]={[0]="\254"},[5]={[22]="\1",[11]="\2"},[6]={[13]="\7",[35]="\6",[37]="\5",[58]="\3",[31]="\8",[9]="\13",[51]="\9",[55]="\10",[57]="\4",[59]="\15"},[7]={[1]="\14",[15]="\16",[87]="\31",[89]="\30",[62]="\26",[17]="\27",[97]="\19",[19]="\43",[10]="\12",[39]="\33",[41]="\24",[82]="\40",[3]="\32",[46]="\41",[47]="\38",[94]="\25",[65]="\23",[50]="\39",[26]="\11",[7]="\28",[33]="\18",[61]="\17",[25]="\42"},[8]={[111]="\101",[162]="\29",[2]="\34",[133]="\21",[142]="\36",[5]="\20",[21]="\37",[170]="\44",[130]="\22",[66]="\35"},[9]={[241]="\121",[361]="\104",[365]="\184",[125]="\227",[373]="\198",[253]="\117",[381]="\57",[270]="\49",[413]="\80",[290]="\47",[294]="\115",[38]="\112",[429]="\74",[433]="\0",[437]="\48",[158]="\183",[453]="\107",[166]="\111",[469]="\182",[477]="\241",[45]="\86",[489]="\69",[366]="\100",[497]="\61",[509]="\76",[49]="\53",[390]="\78",[279]="\196",[283]="\70",[414]="\98",[53]="\55",[422]="\109",[233]="\79",[349]="\89",[369]="\52",[14]="\105",[238]="\56",[319]="\162",[323]="\83",[327]="\63",[458]="\65",[335]="\231",[339]="\225",[337]="\114",[347]="\193",[493]="\139",[23]="\209",[359]="\250",[490]="\68",[42]="\54",[63]="\91",[286]="\97",[254]="\50",[510]="\108",[109]="\73",[67]="\103",[255]="\122",[69]="\170",[70]="\110",[407]="\176",[411]="\119",[110]="\120",[83]="\146",[149]="\163",[151]="\224",[85]="\51",[155]="\177",[79]="\251",[27]="\118",[447]="\159",[451]="\228",[455]="\175",[383]="\174",[463]="\243",[467]="\157",[173]="\210",[475]="\167",[177]="\84",[90]="\45",[487]="\206",[93]="\226",[495]="\245",[207]="\64",[127]="\147",[191]="\155",[511]="\153",[195]="\208",[197]="\85",[199]="\178",[181]="\82",[102]="\116",[103]="\71",[285]="\144",[105]="\102",[211]="\199",[213]="\123",[301]="\66",[305]="\46",[219]="\137",[81]="\67",[91]="\88",[157]="\130",[325]="\95",[29]="\58",[231]="\201",[117]="\99",[341]="\222",[237]="\77",[239]="\211",[71]="\223"},[10]={[710]="\149",[245]="\60",[742]="\172",[774]="\81",[134]="\151",[917]="\145",[274]="\216",[405]="\242",[146]="\194",[838]="\246",[298]="\248",[870]="\189",[1013]="\150",[894]="\190",[326]="\244",[330]="\166",[334]="\217",[465]="\179",[346]="\59",[354]="\180",[966]="\212",[974]="\143",[370]="\148",[998]="\154",[625]="\138",[382]="\161",[194]="\141",[198]="\126",[402]="\96",[206]="\185",[586]="\129",[721]="\187",[610]="\135",[618]="\181",[626]="\72",[226]="\62",[454]="\127",[658]="\113",[462]="\164",[234]="\214",[474]="\140",[242]="\106",[714]="\188",[730]="\87",[498]="\237",[746]="\125",[754]="\229",[786]="\128",[202]="\93",[18]="\255",[810]="\173",[846]="\131",[74]="\192",[842]="\142",[977]="\252",[858]="\235",[78]="\134",[874]="\234",[882]="\90",[646]="\92",[1006]="\160",[126]="\165",[914]="\221",[718]="\94",[738]="\238",[638]="\197",[482]="\230",[34]="\220",[962]="\133",[6]="\213",[706]="\219",[986]="\171",[994]="\233",[866]="\200",[1010]="\247",[98]="\169",[518]="\236",[494]="\207",[230]="\205",[542]="\191",[501]="\202",[530]="\203",[450]="\204",[209]="\158",[106]="\186",[590]="\136",[218]="\232",[733]="\124",[309]="\168",[221]="\152",[757]="\240",[113]="\215",[114]="\156",[362]="\239",[486]="\132",[358]="\249",[262]="\75",[30]="\218",[821]="\195",[546]="\253"}}

local function huffmanDecode(encoded)
	
	local h1,h2,h3 = byte(encoded, 1, 3)
	
	if (not h3) or (#encoded < 4) then
		error("invalid input")
	end
	
	local original_length = bit.bor(bit.lshift(h3,16), bit.lshift(h2,8), h1)
	local encoded_length = #encoded+1
	local decoded = {}
	local decoded_length = 0
	local buffer = 0
	local buffer_length = 0
	local code
	local code_len = 2
	local temp
	local pos = 4
	
	while decoded_length < original_length do
		if code_len <= buffer_length then
			temp = invcodes[code_len]
			code = bit.band(buffer, bit.lshift(1, code_len)-1)
			if temp and temp[code] then --most of the time temp is nil
				decoded_length = decoded_length + 1
				decoded[decoded_length] = temp[code]
				buffer = bit.rshift(buffer, code_len)
				buffer_length = buffer_length - code_len
				code_len = 2
			else
				code_len = code_len + 1
				if code_len > 10 then
					error("malformed code")
				end
			end
		else
			buffer = bit.bor(buffer, bit.lshift(byte(encoded, pos), buffer_length))
			buffer_length = buffer_length + 8
			pos = pos + 1
			if pos > encoded_length then
				error("malformed code")
			end
		end
	end
	
	return concat(decoded)
end

local function invEscapeSub(str)
	local escseq,body = match(str,"^(.-)\n(.-)$")
	
	if not escseq then error("invalid input") end
	
	return gsub(body,escseq,"\26")
end

local dictionary
local subtables

local function deserializeChunk(chunk)
	
	local ctype,val = byte(chunk),sub(chunk,3)
	
	if     ctype == 89 then return dictionary[ val ]
	elseif ctype == 86 then
		local a,b,c = match(val,"^(.-),(.-),(.+)$")
		return Vector( tonumber(a), tonumber(b), tonumber(c) )
	elseif ctype == 65 then
		local a,b,c = match(val,"^(.-),(.-),(.+)$")
		return Angle( tonumber(a), tonumber(b), tonumber(c) )
	elseif ctype == 84 then 
		local t = {}
		local tv = subtables[val]
		if not tv then
			tv = {}
			subtables[ val ] = tv
		end
		tv[#tv+1] = t
		return t
	elseif ctype == 78 then return tonumber(val)
	elseif ctype == 83 then return gsub(sub(val,2,-2),"�",";")
	elseif ctype == 66 then return val == "t"
	elseif ctype == 80 then return 1
	end
	
	error(format("AD1 deserialization failed: invalid chunk (%u:%s)",ctype,val))
	
end

local function deserializeAD1(dupestring)
	
	dupestring = dupestring:Replace("\r\n", "\n")
	local header, extraHeader, dupeBlock, dictBlock = dupestring:match("%[Info%]\n(.+)\n%[More Information%]\n(.+)\n%[Save%]\n(.+)\n%[Dict%]\n(.+)")
	
	if not header then
		error("unknown duplication format")
	end
	
	local info = {}
	for k,v in header:gmatch("([^\n:]+):([^\n]+)") do
		info[k] = v
	end
		
	local moreinfo = {}
	for k,v in extraHeader:gmatch("([^\n:]+):([^\n]+)") do
		moreinfo[k] = v
	end
	
	dictionary = {}
	for k,v in dictBlock:gmatch("(.-):\"(.-)\"\n") do
		dictionary[k] = v
	end

	local dupe = {}
	for key,block in dupeBlock:gmatch("([^\n:]+):([^\n]+)") do
		
		local tables = {}
		subtables = {}
		local head
		
		for id,chunk in block:gmatch('(%w+){(.-)}') do
			
			--check if this table is the trunk
			if byte(id) == 72 then
				id = sub(id,2)
				head = id
			end
			
			tables[id] = {}
			
			for kv in gmatch(chunk,'[^;]+') do
				
				local k,v = match(kv,'(.-)=(.+)')
				
				if k then
					k = deserializeChunk( k )
					v = deserializeChunk( v )
					
					tables[id][k] = v
				else
					v = deserializeChunk( kv )
					local tid = tables[id]
					tid[#tid+1]=v
				end
				
			end
		end
		
		--Restore table references
		for id,tbls in pairs( subtables ) do
			for _,tbl in pairs( tbls ) do
				if not tables[id] then error("attempt to reference a nonexistent table") end
				for k,v in pairs(tables[id]) do
					tbl[k] = v
				end
			end
		end
		
		dupe[key] = tables[ head ]
		
	end
	
	return dupe, info, moreinfo
	
end

--seperates the header and body and converts the header to a table
local function getInfo(str)
	local last = str:find("\2")
	if not last then
		error("attempt to read AD2 file with malformed info block error 1")
	end
	local info = {}
	local ss = str:sub(1,last-1)
	for k,v in ss:gmatch("(.-)\1(.-)\1") do
		info[k] = v
	end
	if info.check ~= "\r\n\t\n" then
		if info.check == "\10\9\10" then
			error("detected AD2 file corrupted in file transfer (newlines homogenized)(when using FTP, transfer AD2 files in image/binary mode, not ASCII/text mode)")
		else
			error("attempt to read AD2 file with malformed info block error 2")
		end
	end
	return info, str:sub(last+2)
end

--decoders for individual versions go here
local versions = {}

versions[2] = function(encodedDupe)
	encodedDupe = encodedDupe:Replace("\r\r\n\t\r\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n\t\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n", "\n")
	encodedDupe = encodedDupe:Replace("\t\t\t\t", "\r\n\t\n")
	local info, dupestring = getInfo(encodedDupe:sub(7))
	return deserialize_v2(
				lzwDecode(
					huffmanDecode(
						invEscapeSub(dupestring)
					)
				)
			), info
end

versions[1] = function(encodedDupe)
	encodedDupe = encodedDupe:Replace("\r\r\n\t\r\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n\t\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n", "\n")
	encodedDupe = encodedDupe:Replace("\t\t\t\t", "\r\n\t\n")
	local info, dupestring = getInfo(encodedDupe:sub(7))
	return deserialize_v1(
				lzwDecode(
					huffmanDecode(
						invEscapeSub(dupestring)
					)
				)
			), info
end

versions[0] = deserializeAD1

AdvDupe2.LegacyDecoders = versions
--PATH addons/sl_utils/lua/advdupe2/cl_file.lua:
local function AdvDupe2_ReceiveFile(len, ply)
	local AutoSave = net.ReadUInt(8) == 1

	net.ReadStream(nil, function(data)
		AdvDupe2.RemoveProgressBar()
		if(!data)then
			AdvDupe2.Notify("File was not saved!",NOTIFY_ERROR,5)
			return
		end
		local path
		if AutoSave then
			if(LocalPlayer():GetInfo("advdupe2_auto_save_overwrite")~="0")then
				path = AdvDupe2.GetFilename(AdvDupe2.AutoSavePath, true)
			else
				path = AdvDupe2.GetFilename(AdvDupe2.AutoSavePath)
			end
		else
			path = AdvDupe2.GetFilename(AdvDupe2.SavePath)
		end

		local dupefile = file.Open(path, "wb", "DATA")
		if(!dupefile)then
			AdvDupe2.Notify("File was not saved!",NOTIFY_ERROR,5)
			return
		end
		dupefile:Write(data)
		dupefile:Close()
		
		local errored = false
		if(LocalPlayer():GetInfo("advdupe2_debug_openfile")=="1")then
			if(not file.Exists(path, "DATA"))then AdvDupe2.Notify("File does not exist", NOTIFY_ERROR) return end
			
			local readFile = file.Open(path, "rb", "DATA")
			if not readFile then AdvDupe2.Notify("File could not be read", NOTIFY_ERROR) return end
			local readData = readFile:Read(readFile:Size())
			readFile:Close()
			local success,dupe,info,moreinfo = AdvDupe2.Decode(readData)
			if(success)then
				AdvDupe2.Notify("DEBUG CHECK: File successfully opens. No EOF errors.")
			else
				AdvDupe2.Notify("DEBUG CHECK: " .. dupe, NOTIFY_ERROR)
				errored = true
			end
		end
		
		local filename = string.StripExtension(string.GetFileFromFilename( path ))
		if(AutoSave)then
			if(IsValid(AdvDupe2.FileBrowser.AutoSaveNode))then
				local add = true
				for i=1, #AdvDupe2.FileBrowser.AutoSaveNode.Files do
					if(filename==AdvDupe2.FileBrowser.AutoSaveNode.Files[i].Label:GetText())then
						add=false
						break
					end
				end
				if(add)then
					AdvDupe2.FileBrowser.AutoSaveNode:AddFile(filename)
					AdvDupe2.FileBrowser.Browser.pnlCanvas:Sort(AdvDupe2.FileBrowser.AutoSaveNode)
				end
			end
		else
			AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode:AddFile(filename)
			AdvDupe2.FileBrowser.Browser.pnlCanvas:Sort(AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode)
		end
		if(!errored)then
			AdvDupe2.Notify("File successfully saved!",NOTIFY_GENERIC, 5)
		end
	end)
end
net.Receive("AdvDupe2_ReceiveFile", AdvDupe2_ReceiveFile)

local uploading = nil
function AdvDupe2.UploadFile(ReadPath, ReadArea)
	if uploading then AdvDupe2.Notify("Already opening file, please wait.", NOTIFY_ERROR) return end
	if(ReadArea==0)then
		ReadPath = AdvDupe2.DataFolder.."/"..ReadPath..".txt"
	elseif(ReadArea==1)then
		ReadPath = AdvDupe2.DataFolder.."/-Public-/"..ReadPath..".txt"
	else
		ReadPath = "adv_duplicator/"..ReadPath..".txt"
	end
	
	if(not file.Exists(ReadPath, "DATA"))then AdvDupe2.Notify("File does not exist", NOTIFY_ERROR) return end
	
	local read = file.Read(ReadPath)
	if not read then AdvDupe2.Notify("File could not be read", NOTIFY_ERROR) return end
	local name = string.Explode("/", ReadPath)
	name = name[#name]
	name = string.sub(name, 1, #name-4)
	
	local success, dupe, info, moreinfo = AdvDupe2.Decode(read)
	if(success)then
		net.Start("AdvDupe2_ReceiveFile")
		net.WriteString(name)
		uploading = net.WriteStream(read, function()
			uploading = nil
			AdvDupe2.File = nil
			AdvDupe2.RemoveProgressBar()
		end)
		net.SendToServer()
		
		AdvDupe2.LoadGhosts(dupe, info, moreinfo, name)
	else
		AdvDupe2.Notify("File could not be decoded. ("..dupe..") Upload Canceled.", NOTIFY_ERROR)
	end
end

--PATH lua/bricks_server/languages/bricks_server/russian.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "russian", {
    ["search"] = "Поиск",
    ["invalidPlayerProfile"] = "Запрошен неверный профиль игрока!",
    ["unbound"] = "НЕ ПРИВЯЗАН",
    ["themes"] = "Темы",
    ["groups"] = "Группы",
    ["general"] = "Основное",
    ["itemWhitelisting"] = "Белый список предметов",
    ["rarities"] = "Раритеты",
    ["languages"] = "Языки",
    ["disabled"] = "Отключено",
    ["enabled"] = "Включено",
    ["purchase"] = "Купить",
    ["profile"] = "Профиль",
    ["view"] = "Посмотреть",
    ["admin"] = "АДМИН",
    ["noToolPermission"] = "Нет прав.",
    ["settings"] = "Настройки",
    ["players"] = "Игроки",
    ["modules"] = "Модули",

    ["userGroupEditor"] = "Редактор групп пользователей",
    ["addNewGroup"] = "Добавить новую группу",
    ["newUserGroup"] = "Какой должна быть новая группа пользователей?",
    ["groupName"] = "Название",

    ["custom"] = "Свое",
    ["addNew"] = "Добавить новую",
    ["material"] = "Материал",
    ["directImage"] = "Введите URL прямого изображения ниже.",
    ["default"] = "Стандарт",
    ["selectMaterial"] = "Вы должны выбрать материал!",

    ["errorNoText"] = "ОШИБКА: НЕТ ТЕКСТА",
    ["selectOption"] = "Выберите опцию",
    ["selectValue"] = "Выберите значение.",
    ["selectColor"] = "Выберите цвет.",
    ["configSaved"] = "Конфиг сохранен!",
    ["cmdNoPermission"] = "Нет прав.",
    ["entityPosUpdated"] = "Позиция entity сохранена.",
    ["noEntitiesSpawned"] = "Нет сохраненных entities.",
    ["xEntitiesSpawned"] = "%d сохранил entities где был заспавнен.",
    ["error"] = "ERROR",

    ["seconds"] = "%d секунд",
    ["second"] = "%d секунда",
    ["minutes"] = "%d минуты",
    ["minute"] = "%d минута",
    ["hours"] = "%d часы",
    ["hour"] = "%d час",

    ["noRarity"] = "Нет редкости",

    ["config"] = "Настройки [Конфиг]",
    ["edit"] = "Изменить",
    ["editColor"] = "Изменить цвет",
    ["editName"] = "Изменить название",
    ["remove"] = "Удалить",
    ["name"] = "Название",
    ["description"] = "Описание",
    ["model"] = "Модель",
    ["icon"] = "Значек",
    ["type"] = "Тип",
    ["price"] = "Стоимость",
    ["group"] = "Группа",
    ["category"] = "Категория",
    ["color"] = "Цвет",
    ["invalidType"] = "Неверный тип.",
    ["invalidOption"] = "Неверная опция.",
    ["invalidChoice"] = "Неверный выбор.",
    ["invalidGroup"] = "Неверная группа.",
    ["invalidPlayer"] = "Неверный игрок.",
    ["true"] = "ВКЛ",
    ["false"] = "ВЫКЛ",
    ["noDescription"] = "Нет описания",
    ["other"] = "Остальное",
    ["completed"] = "Выполнено",
    ["close"] = "Закрыть",
    ["main"] = "Меню",
    
    ["valueQuery"] = "Что следует %s?",
    ["dataValueQuery"] = "Какие данные должны это?",
    ["newNameQuery"] = "Что следует новому имени?",
    ["newDescriptionQuery"] = "Что следует новому описанию?",
    ["newModelQuery"] = "Что следует новой моделе?",
    ["newIconQuery"] = "Что следует новой иконке?",
    ["newColorQuery"] = "Что следует новому цвету?",
    ["npcTypeQuery"] = "Какой тип этого NPC?",
    ["newTypeQuery"] = "Что следует типу",
    ["groupRequirementQuery"] = "Что следует требованиям группы?",
    ["levelRequirementQuery"] = "Что следует уровню группы?",
    ["newPriceQuery"] = "Что следует новой стоимости?",
    ["newCategoryQuery"] = "Что следует новой категории?",

    ["npcEditor"] = "Настройка NPC [Editor]",
    ["addNPC"] = "Добавить NPC",
    ["newNPC"] = "Новый NPC",

    ["ok"] = "OK",
    ["cancel"] = "Отмена",
    ["save"] = "Сохранить",
    ["confirm"] = "Подтвердить",
    ["nil"] = "NIL",
    ["none"] = "Ничего",
    ["selected"] = "Выбрано",
    ["unselected"] = "Не выбрано",
    ["add"] = "Добавить",

    ["shootyStick"] = "Стрелка!",
    ["permanent"] = "Вечная",
    ["tierX"] = "(Уровень %d)",
    ["someDescription"] = "Некоторое описание.",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Неверный NPC",

    ["disconnected"] = "Отключился",
    ["profileView"] = "Просмотр профиля",
    ["loading"] = "Загрузка",
    ["statistics"] = "Статистика",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Рейтинг пожертвований",
    ["staffRank"] = "Рейтинг персонала",
    ["currentJob"] = "Текущее место работы",
    ["wallet"] = "Бумажник",
    ["level"] = "Уровень",
    ["levelX"] = "Уровень %d",
    ["experience"] = "ОПЫТ",
    ["exp"] = "EXP",
    ["money"] = "Деньги",
    ["playerLogs"] = "Логи игрока",
    ["deleteLogs"] = "Удалить логи",
    ["xLogs"] = "%d логи",
    ["xAdminGroups"] = "%d Админ группы",
    ["noUserGroups"] = "Нет групп пользователей",
    ["userGroups"] = "Группы пользователей: %s",
    ["editUserGroups"] = "Изменить группы пользователей",
    ["newGroupColor"] = "Что следует новому цвету группу?",
    ["newGroupName"] = "Какое название новой группы?",
    ["groupAlreadyExists"] = "Эта группа уже существует!",
    ["whitelist"] = "Белый список",
    ["unWhitelist"] = "Искл. из белого списка",
    ["addCustom"] = "Добавить свое",
    ["entClassWhitelist"] = "Какой класс сущностей вы бы хотели добавить в белый список?",
    ["entClassAlreadyOnList"] = "Этот класс сущностей уже есть в списке!",
    ["changesServerRestart"] = "Некоторые изменения не вступят в силу, пока сервер не будет перезагружен!",
    ["comingSoon"] = "Скоро!",
    ["features"] = "ФУНКЦИИ",
    ["addNewRarity"] = "Добавить новый раритет",
    ["newRarity"] = "Новый раритет",
    ["needToAddRarity"] = "Вы должны сначала добавить тип редкости!",
    ["whatRarityItem"] = "Какой редкости стоит этот предмет?",
    ["invalidRarity"] = "Неверная редкость.",
    ["rarityAlreadyExists"] = "Редкость с таким названием уже существует!",
    ["themeColorX"] = "Тема - Цвет %d",
    ["themeTextColor"] = "Тема - Цвет текста",
    ["presetAccents"] = "Предустановленные акценты",
    ["presetBackgrounds"] = "Предустановленные фоны",
    ["resetToBaseThemes"] = "Сбросить тему к стандарту",
    ["resetToCurrentThemes"] = "Сброс к текущим темам",
    ["toggle"] = "Включить",
    ["menu"] = "Меню",
    ["emptyValue"] = "Пустое значение",
    ["newValueQuery"] = "Что следует пустому значению?",
    ["pressKey"] = "НАЖМИТЕ НА A",

    ["entityPlacer"] = "Спавн нового Entity",
    ["invalidEntityType"] = "Неверный тип объекта, выберите правильный из меню инструментов.",
    ["entityPlaced"] = "Объект успешно размещен.",
    ["entityRemoved"] = "Сущность успешно удалена.",
    ["canOnlyUseToolEntity"] = "Вы можете использовать этот инструмент только для удаления или создания объекта.",
    ["entityType"] = "Entity Тип",
    ["entityPlacerDescription"] = "Размещает и удаляет объекты с сервера Bricks и сохраняет их позиции. Левый щелчок - место. Правый клик - удалить.",
    ["entityPlacerDescriptionSmall"] = "Размещает и удаляет объекты",
    ["entityPlacerInstructions"] = "Левый клик - разместить, правый клик - удалить.",

    ["npcPlacer"] = "Установка NPC",
    ["npcPlaced"] = "NPC успешно размещен.",
    ["invalidNPCType"] = "Неверный тип NPC, выберите правильный из меню инструментов.",
    ["npcRemoved"] = "NPC успешно удален.",
    ["errorNotNPC"] = "Вы можете использовать этот инструмент только для удаления или создания NPC.",
    ["npcPlacerDescription"] = "Размещает и удаляет NPC с сервера Bricks. Щелкните левой кнопкой мыши - поместите, щелкните правой кнопкой мыши - удалите.",
    ["npcPlacerDescriptionSmall"] = "Размещает и удаляет NPC с сервера Brick.",

    ["inventory"] = "Инвентарь",
    ["player"] = "Игрок",
    ["drop"] = "Выбросить",
    ["use"] = "Использовать",
    ["dropAll"] = "Выбросить все",
    ["delete"] = "Удалить",
} )
--PATH lua/sh_cami.lua:
--[[
CAMI - Common Admin Mod Interface.
Copyright 2020 CAMI Contributors

Makes admin mods intercompatible and provides an abstract privilege interface
for third party addons.

Follows the specification on this page:
https://github.com/glua/CAMI/blob/master/README.md

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- Version number in YearMonthDay format.
local version = 20201130

if CAMI and CAMI.Version >= version then return end

CAMI = CAMI or {}
CAMI.Version = version


--- @class CAMI_USERGROUP
--- defines the charactaristics of a usergroup
--- @field Name string @The name of the usergroup
--- @field Inherits string @The name of the usergroup this usergroup inherits from

--- @class CAMI_PRIVILEGE
--- defines the charactaristics of a privilege
--- @field Name string @The name of the privilege
--- @field MinAccess "'user'" | "'admin'" | "'superadmin'" @Default group that should have this privilege
--- @field Description string | nil @Optional text describing the purpose of the privilege
local CAMI_PRIVILEGE = {}
--- Optional function to check if a player has access to this privilege
--- (and optionally execute it on another player)
---
--- ⚠ **Warning**: This function may not be called by all admin mods
--- @param actor GPlayer @The player
--- @param target GPlayer | nil @Optional - the target
--- @return boolean @If they can or not
--- @return string | nil @Optional reason
function CAMI_PRIVILEGE:HasAccess(actor, target)
end

--- Contains the registered CAMI_USERGROUP usergroup structures.
--- Indexed by usergroup name.
--- @type CAMI_USERGROUP[]
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

--- Contains the registered CAMI_PRIVILEGE privilege structures.
--- Indexed by privilege name.
--- @type CAMI_PRIVILEGE[]
local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}

--- Registers a usergroup with CAMI.
---
--- Use the source parameter to make sure CAMI.RegisterUsergroup function and
--- the CAMI.OnUsergroupRegistered hook don't cause an infinite loop
--- @param usergroup CAMI_USERGROUP @The structure for the usergroup you want to register
--- @param source any @Identifier for your own admin mod. Can be anything.
--- @return CAMI_USERGROUP @The usergroup given as an argument
function CAMI.RegisterUsergroup(usergroup, source)
    usergroups[usergroup.Name] = usergroup

    hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source)
    return usergroup
end

--- Unregisters a usergroup from CAMI. This will call a hook that will notify
--- all other admin mods of the removal.
---
--- ⚠ **Warning**: Call only when the usergroup is to be permanently removed.
---
--- Use the source parameter to make sure CAMI.UnregisterUsergroup function and
--- the CAMI.OnUsergroupUnregistered hook don't cause an infinite loop
--- @param usergroupName string @The name of the usergroup.
--- @param source any @Identifier for your own admin mod. Can be anything.
--- @return boolean @Whether the unregistering succeeded.
function CAMI.UnregisterUsergroup(usergroupName, source)
    if not usergroups[usergroupName] then return false end

    local usergroup = usergroups[usergroupName]
    usergroups[usergroupName] = nil

    hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)

    return true
end

--- Retrieves all registered usergroups.
--- @return CAMI_USERGROUP[] @Usergroups indexed by their names.
function CAMI.GetUsergroups()
    return usergroups
end

--- Receives information about a usergroup.
--- @param usergroupName string
--- @return CAMI_USERGROUP | nil @Returns nil when the usergroup does not exist.
function CAMI.GetUsergroup(usergroupName)
    return usergroups[usergroupName]
end

--- Checks to see if potentialAncestor is an ancestor of usergroupName.
--- All usergroups are ancestors of themselves.
---
--- Examples:
--- * `user` is an ancestor of `admin` and also `superadmin`
--- * `admin` is an ancestor of `superadmin`, but not `user`
--- @param usergroupName string @The usergroup to query
--- @param potentialAncestor string @The ancestor to query
--- @return boolean @Whether usergroupName inherits potentialAncestor.
function CAMI.UsergroupInherits(usergroupName, potentialAncestor)
    repeat
        if usergroupName == potentialAncestor then return true end

        usergroupName = usergroups[usergroupName] and
                         usergroups[usergroupName].Inherits or
                         usergroupName
    until not usergroups[usergroupName] or
          usergroups[usergroupName].Inherits == usergroupName

    -- One can only be sure the usergroup inherits from user if the
    -- usergroup isn't registered.
    return usergroupName == potentialAncestor or potentialAncestor == "user"
end

--- Find the base group a usergroup inherits from.
---
--- This function traverses down the inheritence chain, so for example if you have
--- `user` -> `group1` -> `group2`
--- this function will return `user` if you pass it `group2`.
---
--- ℹ **NOTE**: All usergroups must eventually inherit either user, admin or superadmin.
--- @param usergroupName string @The name of the usergroup
--- @return "'user'" | "'admin'" | "'superadmin'" @The name of the root usergroup
function CAMI.InheritanceRoot(usergroupName)
    if not usergroups[usergroupName] then return end

    local inherits = usergroups[usergroupName].Inherits
    while inherits ~= usergroups[usergroupName].Inherits do
        usergroupName = usergroups[usergroupName].Inherits
    end

    return usergroupName
end

--- Registers an addon privilege with CAMI.
---
--- ⚠ **Warning**: This should only be used by addons. Admin mods must *NOT*
---  register their privileges using this function.
--- @param privilege CAMI_PRIVILEGE
--- @return CAMI_PRIVILEGE @The privilege given as argument.
function CAMI.RegisterPrivilege(privilege)
    privileges[privilege.Name] = privilege

    hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)

    return privilege
end

--- Unregisters a privilege from CAMI.
--- This will call a hook that will notify any admin mods of the removal.
---
--- ⚠ **Warning**: Call only when the privilege is to be permanently removed.
--- @param privilegeName string @The name of the privilege.
--- @return boolean @Whether the unregistering succeeded.
function CAMI.UnregisterPrivilege(privilegeName)
    if not privileges[privilegeName] then return false end

    local privilege = privileges[privilegeName]
    privileges[privilegeName] = nil

    hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)

    return true
end

--- Retrieves all registered privileges.
--- @return CAMI_PRIVILEGE[] @All privileges indexed by their names.
function CAMI.GetPrivileges()
    return privileges
end

--- Receives information about a privilege.
--- @param privilegeName string
--- @return CAMI_PRIVILEGE | nil
function CAMI.GetPrivilege(privilegeName)
    return privileges[privilegeName]
end

-- Default access handler
local defaultAccessHandler = {["CAMI.PlayerHasAccess"] =
    function(_, actorPly, privilegeName, callback, targetPly, extraInfoTbl)
        -- The server always has access in the fallback
        if not IsValid(actorPly) then return callback(true, "Fallback.") end

        local priv = privileges[privilegeName]

        local fallback = extraInfoTbl and (
            not extraInfoTbl.Fallback and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "user" and true or
            extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())


        if not priv then return callback(fallback, "Fallback.") end

        local hasAccess =
            priv.MinAccess == "user" or
            priv.MinAccess == "admin" and actorPly:IsAdmin() or
            priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin()

        if hasAccess and priv.HasAccess then
            hasAccess = priv:HasAccess(actorPly, targetPly)
        end

        callback(hasAccess, "Fallback.")
    end,
    ["CAMI.SteamIDHasAccess"] =
    function(_, _, _, callback)
        callback(false, "No information available.")
    end
}

--- @class CAMI_ACCESS_EXTRA_INFO
--- @field Fallback "'user'" | "'admin'" | "'superadmin'" @Fallback status for if the privilege doesn't exist. Defaults to `admin`.
--- @field IgnoreImmunity boolean @Ignore any immunity mechanisms an admin mod might have.
--- @field CommandArguments table @Extra arguments that were given to the privilege command.

--- Checks if a player has access to a privilege
--- (and optionally can execute it on targetPly)
---
--- This function is designed to be asynchronous but will be invoked
---  synchronously if no callback is passed.
---
--- ⚠ **Warning**: If the currently installed admin mod does not support
---                 synchronous queries, this function will throw an error!
--- @param actorPly GPlayer @The player to query
--- @param privilegeName string @The privilege to query
--- @param callback fun(hasAccess: boolean, reason: string|nil) @Callback to receive the answer, or nil for synchronous
--- @param targetPly GPlayer | nil @Optional - target for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
--- @return boolean | nil @Synchronous only - if the player has the privilege
--- @return string | nil @Synchronous only - optional reason from admin mod
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

--- Get all the players on the server with a certain privilege
--- (and optionally who can execute it on targetPly)
---
--- ℹ **NOTE**: This is an asynchronous function!
--- @param privilegeName string @The privilege to query
--- @param callback fun(players: GPlayer[]) @Callback to receive the answer
--- @param targetPly GPlayer | nil @Optional - target for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
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

--- @class CAMI_STEAM_ACCESS_EXTRA_INFO
--- @field IgnoreImmunity boolean @Ignore any immunity mechanisms an admin mod might have.
--- @field CommandArguments table @Extra arguments that were given to the privilege command.

--- Checks if a (potentially offline) SteamID has access to a privilege
--- (and optionally if they can execute it on a target SteamID)
---
--- ℹ **NOTE**: This is an asynchronous function!
--- @param actorSteam string | nil @The SteamID to query
--- @param privilegeName string @The privilege to query
--- @param callback fun(hasAccess: boolean, reason: string|nil) @Callback to receive  the answer
--- @param targetSteam string | nil @Optional - target SteamID for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_STEAM_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback,
targetSteam, extraInfoTbl)
    hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam,
        privilegeName, callback, targetSteam, extraInfoTbl)
end

--- Signify that your admin mod has changed the usergroup of a player. This
--- function communicates to other admin mods what it thinks the usergroup
--- of a player should be.
---
--- Listen to the hook to receive the usergroup changes of other admin mods.
--- @param ply GPlayer @The player for which the usergroup is changed
--- @param old string @The previous usergroup of the player.
--- @param new string @The new usergroup of the player.
--- @param source any @Identifier for your own admin mod. Can be anything.
function CAMI.SignalUserGroupChanged(ply, old, new, source)
    hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source)
end

--- Signify that your admin mod has changed the usergroup of a disconnected
--- player. This communicates to other admin mods what it thinks the usergroup
--- of a player should be.
---
--- Listen to the hook to receive the usergroup changes of other admin mods.
--- @param steamId string @The steam ID of the player for which the usergroup is changed
--- @param old string @The previous usergroup of the player.
--- @param new string @The new usergroup of the player.
--- @param source any @Identifier for your own admin mod. Can be anything.
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source)
    hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source)
end

--PATH lua/bricks_server/core/client/cl_bshadows.lua:
local function createShadows()
    BRICKS_SERVER.BSHADOWS = {}
    
    --The original drawing layer
    BRICKS_SERVER.BSHADOWS.RenderTarget = GetRenderTarget("bshadows_original_" .. ScrW(), ScrW(), ScrH())
    
    --The shadow layer
    BRICKS_SERVER.BSHADOWS.RenderTarget2 = GetRenderTarget("bshadows_shadow_" .. ScrW(),  ScrW(), ScrH())
    
    --The matarial to draw the render targets on
    BRICKS_SERVER.BSHADOWS.ShadowMaterial = CreateMaterial("bshadows_" .. ScrW(),"UnlitGeneric",{
        ["$translucent"] = 1,
        ["$vertexalpha"] = 1,
        ["alpha"] = 1
    })
    
    --When we copy the rendertarget it retains color, using this allows up to force any drawing to be black
    --Then we can blur it to create the shadow effect
    BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale = CreateMaterial("bshadows_grayscale_" .. ScrW(),"UnlitGeneric",{
        ["$translucent"] = 1,
        ["$vertexalpha"] = 1,
        ["$alpha"] = 1,
        ["$color"] = "0 0 0",
        ["$color2"] = "0 0 0"
    })
    
    --Call this to begin drawing a shadow
    BRICKS_SERVER.BSHADOWS.BeginShadow = function( AreaX, AreaY, AreaEndX, AreaEndY )
        --Set the render target so all draw calls draw onto the render target instead of the screen
        render.PushRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget)
    
        --Clear is so that theres no color or alpha
        render.OverrideAlphaWriteEnable(true, true)
        render.Clear(0,0,0,0)
        render.OverrideAlphaWriteEnable(false, false)
    
        if( AreaX and AreaY and AreaEndX and AreaEndY ) then
            render.SetScissorRect( AreaX, AreaY, AreaEndX, AreaEndY, true )
        end

        --Start Cam2D as where drawing on a flat surface 
        cam.Start2D()
    
        --Now leave the rest to the user to draw onto the surface
    end
    
    --This will draw the shadow, and mirror any other draw calls the happened during drawing the shadow
    BRICKS_SERVER.BSHADOWS.EndShadow = function(intensity, spread, blur, opacity, direction, distance, _shadowOnly)
        
        --Set default opcaity
        opacity = opacity or 255
        direction = direction or 0
        distance = distance or 0
        _shadowOnly = _shadowOnly or false
    
        --Copy this render target to the other
        render.CopyRenderTargetToTexture(BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Blur the second render target
        if blur > 0 then
            render.OverrideAlphaWriteEnable(true, true)
            render.BlurRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget2, spread, spread, blur)
            render.OverrideAlphaWriteEnable(false, false) 
        end
    
        --First remove the render target that the user drew
        render.PopRenderTarget()
    
        --Now update the material to what was drawn
        BRICKS_SERVER.BSHADOWS.ShadowMaterial:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget)
    
        --Now update the material to the shadow render target
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Work out shadow offsets
        local xOffset = math.sin(math.rad(direction)) * distance 
        local yOffset = math.cos(math.rad(direction)) * distance
    
        --Now draw the shadow
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetFloat("$alpha", opacity/255) --set the alpha of the shadow
        render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale)
        for i = 1 , math.ceil(intensity) do
            render.DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
        end
    
        if not _shadowOnly then
            --Now draw the original
            BRICKS_SERVER.BSHADOWS.ShadowMaterial:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget)
            render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterial)
            render.DrawScreenQuad()
        end
    
        cam.End2D()

        render.SetScissorRect( 0, 0, 0, 0, false )
    end
    
    --This will draw a shadow based on the texture you passed it.
    BRICKS_SERVER.BSHADOWS.DrawShadowTexture = function(texture, intensity, spread, blur, opacity, direction, distance, shadowOnly)
    
        --Set default opcaity
        opacity = opacity or 255
        direction = direction or 0
        distance = distance or 0
        shadowOnly = shadowOnly or false
    
        --Copy the texture we wish to create a shadow for to the shadow render target
        render.CopyTexture(texture, BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Blur the second render target
        if blur > 0 then
            render.PushRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget2)
            render.OverrideAlphaWriteEnable(true, true)
            render.BlurRenderTarget(BRICKS_SERVER.BSHADOWS.RenderTarget2, spread, spread, blur)
            render.OverrideAlphaWriteEnable(false, false) 
            render.PopRenderTarget()
        end
    
        --Now update the material to the shadow render target
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetTexture('$basetexture', BRICKS_SERVER.BSHADOWS.RenderTarget2)
    
        --Work out shadow offsets
        local xOffset = math.sin(math.rad(direction)) * distance 
        local yOffset = math.cos(math.rad(direction)) * distance
    
        --Now draw the shadow 
        BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale:SetFloat("$alpha", opacity/255) --Set the alpha
        render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterialGrayscale)
        for i = 1 , math.ceil(intensity) do
            render.DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
        end
        if not shadowOnly then
            --Now draw the original
            BRICKS_SERVER.BSHADOWS.ShadowMaterial:SetTexture('$basetexture', texture)
            render.SetMaterial(BRICKS_SERVER.BSHADOWS.ShadowMaterial)
            render.DrawScreenQuad()
        end
    end
end
createShadows()

hook.Add( "OnScreenSizeChanged", "BRS.OnScreenSizeChanged.Shadows", createShadows )
--PATH lua/bricks_server/core/client/cl_config_popups.lua:
function BRICKS_SERVER.Func.CreateGroupEditor( defaultGroups, onSave, onCancel, swap )
	BS_GROUP_EDITOR = vgui.Create( "DFrame" )
	BS_GROUP_EDITOR:SetSize( ScrW(), ScrH() )
	BS_GROUP_EDITOR:Center()
	BS_GROUP_EDITOR:SetTitle( "" )
	BS_GROUP_EDITOR:ShowCloseButton( false )
	BS_GROUP_EDITOR:SetDraggable( false )
	BS_GROUP_EDITOR:MakePopup()
	BS_GROUP_EDITOR:SetAlpha( 0 )
	BS_GROUP_EDITOR:AlphaTo( 255, 0.1, 0 )
	BS_GROUP_EDITOR.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local backPanel = vgui.Create( "DPanel", BS_GROUP_EDITOR )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local groupsTable = table.Copy( defaultGroups )
	local textArea

	function backPanel.FillGroups()
		backPanel:Clear()

		textArea = vgui.Create( "DPanel", backPanel )
		textArea:Dock( TOP )
		textArea:DockMargin( 10, 10, 10, 0 )
		textArea:SetTall( 30 )
		textArea.Paint = function( self2, w, h ) 
			draw.SimpleText( BRICKS_SERVER.Func.L( "userGroupEditor" ), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end

		for k, v in pairs( groupsTable ) do
			local actionButtonBack = vgui.Create( "DPanel", backPanel )
			actionButtonBack:Dock( TOP )
			actionButtonBack:DockMargin( 10, 10, 10, 0 )
			actionButtonBack:SetTall( 40 )
			actionButtonBack.Paint = function() end

			local actionButtonDelete = vgui.Create( "DButton", actionButtonBack )
			actionButtonDelete:SetText( "" )
			actionButtonDelete:Dock( RIGHT )
			actionButtonDelete:DockMargin( 5, 0, 0, 0 )
			actionButtonDelete:SetWide( actionButtonBack:GetTall() )
			local changeAlpha = 0
			local deleteMat = Material( "materials/bricks_server/delete.png" )
			actionButtonDelete.Paint = function( self2, w, h )
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
				end
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed )
				surface.SetAlphaMultiplier( 1 )

				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				surface.SetMaterial( deleteMat )
				local iconSize = h*0.65
				surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
			end
			actionButtonDelete.DoClick = function()
				if( isnumber( k ) ) then
					table.remove( groupsTable, k )
				else
					groupsTable[k] = nil
				end

				backPanel.FillGroups()
			end

			local actionButton = vgui.Create( "DPanel", actionButtonBack )
			actionButton:Dock( FILL )
			actionButton.Paint = function( self2, w, h )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

				draw.SimpleText( ((not swap and v) or k), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
		end

		local newGroupButton = vgui.Create( "DButton", backPanel )
		newGroupButton:SetText( "" )
		newGroupButton:Dock( TOP )
		newGroupButton:DockMargin( 10, 10, 10, 0 )
		newGroupButton:SetTall( 40 )
		local changeAlpha = 0
		newGroupButton.Paint = function( self2, w, h )
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

			draw.SimpleText( BRICKS_SERVER.Func.L( "addNewGroup" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		newGroupButton.DoClick = function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newUserGroup" ), BRICKS_SERVER.Func.L( "groupName" ), function( text ) 
				if( not swap ) then
					table.insert( groupsTable, text )
				else
					groupsTable[text] = true
				end
				backPanel.FillGroups()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
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
	
			draw.SimpleText( BRICKS_SERVER.Func.L( "save" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		leftButton.DoClick = function()
			onSave( groupsTable )
	
			BS_GROUP_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_GROUP_EDITOR ) ) then
					BS_GROUP_EDITOR:Remove()
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
	
			draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		rightButton.DoClick = function()
			onCancel()
	
			BS_GROUP_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_GROUP_EDITOR ) ) then
					BS_GROUP_EDITOR:Remove()
				end
			end )
		end
	
		backPanel:SetSize( (2*10)+(2*150)+80, buttonPanel:GetTall()+(5*10)+textArea:GetTall()+((table.Count( groupsTable ) or 10)*50)+newGroupButton:GetTall() )
		backPanel:Center()
	
		leftButton:SetWide( (backPanel:GetWide()-30)/2 )
		rightButton:SetWide( (backPanel:GetWide()-30)/2 )
	end
	backPanel.FillGroups()
end

function BRICKS_SERVER.Func.CreateTeamSelector( defaultTable, subtitle, saveFunc )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local teamsTableCopy = table.Copy( defaultTable )

	local backPanel = vgui.Create( "DPanel", frameBack )
	backPanel:SetSize( ScrW()*0.4, 0 )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local chooserBack = vgui.Create( "bricks_server_scrollpanel", backPanel )
	chooserBack:Dock( TOP )
	chooserBack:DockMargin( 10, 10, 10, 0 )
	chooserBack:SetTall( ScrH()*0.4 )
	chooserBack.Paint = function() end
	
	local spacing = 5
	local gridWide = backPanel:GetWide()-20
    local wantedSlotSize = 135
    local slotsWide = math.floor( gridWide/wantedSlotSize )
	local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

	local chooserLayout = vgui.Create( "DIconLayout", chooserBack )
    chooserLayout:Dock( FILL )
    chooserLayout:SetSpaceY( spacing )
	chooserLayout:SetSpaceX( spacing )
	
	function backPanel.RefreshTeams()
		chooserLayout:Clear()
		
		for k, v in pairs( RPExtraTeams ) do
			local materialEntry = chooserLayout:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			local name = util.CRC( k )
			local icon
			materialEntry.Paint = function( self2, w, h )
				if( teamsTableCopy[v.command] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end

				if( icon:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
				elseif( icon:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( string.len( v.name ) > 16 ) then
					draw.SimpleText( string.sub( v.name, 1, 16 ) .. "...", "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				else
					draw.SimpleText( v.name, "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				end
			end

			icon = vgui.Create( "DModelPanel", materialEntry )
			icon:Dock( FILL )
			icon:DockMargin( 0, 0, 0, 30 )
			if( istable( v.model ) ) then
				icon:SetModel( v.model[1] )
			else
				icon:SetModel( v.model )
			end
			function icon:LayoutEntity( Entity ) return end

			icon.DoClick = function()
				if( teamsTableCopy[v.command] ) then
					teamsTableCopy[v.command] = nil
				else
					teamsTableCopy[v.command] = true
				end
			end
		end

		chooserLayout:PerformLayout()
		chooserBack:Rebuild()
	end
	backPanel.RefreshTeams()

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
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "confirm" ) )
	textX = textX+20
	leftButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "confirm" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		saveFunc( teamsTableCopy )
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
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "cancel" ) )
	textX = textX+20
	rightButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetSize( backPanel:GetWide(), buttonPanel:GetTall()+(4*10)+textArea:GetTall()+chooserBack:GetTall()+10 )
	backPanel:Center()
end

function BRICKS_SERVER.Func.CreateShipmentSelector( defaultTable, subtitle, saveFunc )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local shipmentsTableCopy = table.Copy( defaultTable )

	for k, v in pairs( shipmentsTableCopy ) do
		local found, foundKey = DarkRP.getShipmentByName( k )

		if( not found ) then
			shipmentsTableCopy[k] = nil
		end
	end

	local backPanel = vgui.Create( "DPanel", frameBack )
	backPanel:SetSize( ScrW()*0.4, 0 )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local chooserBack = vgui.Create( "bricks_server_scrollpanel", backPanel )
	chooserBack:Dock( TOP )
	chooserBack:DockMargin( 10, 10, 10, 0 )
	chooserBack:SetTall( ScrH()*0.4 )
	chooserBack.Paint = function() end
	
	local spacing = 5
	local gridWide = backPanel:GetWide()-20
    local wantedSlotSize = 135
    local slotsWide = math.floor( gridWide/wantedSlotSize )
	local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

	local chooserLayout = vgui.Create( "DIconLayout", chooserBack )
    chooserLayout:Dock( FILL )
    chooserLayout:SetSpaceY( spacing )
	chooserLayout:SetSpaceX( spacing )
	
	function backPanel.RefreshTeams()
		chooserLayout:Clear()
		
		for k, v in pairs( CustomShipments ) do
			local materialEntry = chooserLayout:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			local name = util.CRC( k )
			local icon
			materialEntry.Paint = function( self2, w, h )
				if( shipmentsTableCopy[v.name] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end

				if( icon:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
				elseif( icon:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( string.len( v.name ) > 16 ) then
					draw.SimpleText( string.sub( v.name, 1, 16 ) .. "...", "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				else
					draw.SimpleText( v.name, "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				end
			end

			icon = vgui.Create( "DModelPanel", materialEntry )
			icon:Dock( FILL )
			icon:SetModel( v.model )
			if( IsValid( icon.Entity ) ) then
				function icon:LayoutEntity( Entity ) return end
				local mn, mx = icon.Entity:GetRenderBounds()
				local size = 0
				size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
				size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
				size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )
		
				icon:SetFOV( 70 )
				icon:SetCamPos( Vector( size, size, size ) )
				icon:SetLookAt( (mn + mx) * 0.5 )
			end

			icon.DoClick = function()
				if( shipmentsTableCopy[v.name] ) then
					shipmentsTableCopy[v.name] = nil
				else
					shipmentsTableCopy[v.name] = true
				end
			end
		end

		chooserLayout:PerformLayout()
		chooserBack:Rebuild()
	end
	backPanel.RefreshTeams()

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
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "confirm" ) )
	textX = textX+20
	leftButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "confirm" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		saveFunc( shipmentsTableCopy )
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
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "cancel" ) )
	textX = textX+20
	rightButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetSize( backPanel:GetWide(), buttonPanel:GetTall()+(4*10)+textArea:GetTall()+chooserBack:GetTall()+10 )
	backPanel:Center()
end

function BRICKS_SERVER.Func.MaterialRequest( title, subtitle, default, func_confirm, func_cancel, confirmText, cancelText )
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
	backPanel:SetWide( math.max( ScrW()*0.4, textX+30 ) )
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

	local chooserBack = vgui.Create( "DPanel", backPanel )
	chooserBack:Dock( TOP )
	chooserBack:DockMargin( 10, 10, 10, 0 )
	chooserBack:SetTall( ScrH()*0.4 )
	chooserBack.Paint = function() end

	local materialsScroll = vgui.Create( "bricks_server_scrollpanel", chooserBack )
	materialsScroll:Dock( FILL )
	materialsScroll.Paint = function( self2, w, h ) end
	
	local spacing = 5
	local gridWide = backPanel:GetWide()-20
    local wantedSlotSize = 100
    local slotsWide = math.floor( gridWide/wantedSlotSize )
	local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

	local materialsGridCustom = vgui.Create( "DIconLayout", materialsScroll )
    materialsGridCustom:Dock( TOP )
    materialsGridCustom:DockMargin( 0, 0, 0, 0 )
    materialsGridCustom:SetSpaceY( spacing )
	materialsGridCustom:SetSpaceX( spacing )
	
	local materialsGridDefault = vgui.Create( "DIconLayout", materialsScroll )
    materialsGridDefault:Dock( TOP )
    materialsGridDefault:SetSpaceY( spacing )
	materialsGridDefault:SetSpaceX( spacing )
	
	local selected = default
	function backPanel.RefreshMaterials( time )
		local defaultMaterials = {}
		local customMaterials = {}

		materialsGridCustom:Clear()
		materialsGridDefault:Clear()

		for k, v in pairs( BRICKS_SERVER.CachedMaterials ) do
			if( string.StartWith( k, "http" ) ) then
				table.insert( customMaterials, { v, k } )
			else
				table.insert( defaultMaterials, { v, k } )
			end
		end

		table.SortByMember( defaultMaterials, 2, true )

		local materialCustomHeader = materialsGridCustom:Add( "DPanel" )
		materialCustomHeader:SetSize( gridWide-20, 40 )
		materialCustomHeader.Paint = function( self2, w, h )
			draw.SimpleText( BRICKS_SERVER.Func.L( "custom" ), "BRICKS_SERVER_Font25", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
		end

		for k, v in pairs( customMaterials ) do
			local materialEntry = materialsGridCustom:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			local name = util.CRC( v[2] )
			materialEntry.Paint = function( self2, w, h )
				if( selected == v[2] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end

				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( BRICKS_SERVER.CachedMaterials[v[2]] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( BRICKS_SERVER.CachedMaterials[v[2]] )
					local iconSize = h*0.5
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				draw.SimpleText( name, "BRICKS_SERVER_Font17", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
			end
			materialEntry.DoClick = function()
				selected = v[2]
			end
		end

		local customMaterialNew = materialsGridCustom:Add( "DButton" )
		customMaterialNew:SetSize( slotSize, slotSize )
		customMaterialNew:SetText( "" )
		local changeAlpha = 0
		local newMat = Material( "materials/bricks_server/add.png")
		customMaterialNew.Paint = function( self2, w, h )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

			if( self2:IsDown() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
			elseif( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
			end

			surface.SetAlphaMultiplier( changeAlpha/255 )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
			surface.SetAlphaMultiplier( 1 )

			if( newMat ) then
				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				surface.SetMaterial( newMat )
				local iconSize = 32
				surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
			end

			draw.SimpleText( BRICKS_SERVER.Func.L( "addNew" ), "BRICKS_SERVER_Font17", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		end
		customMaterialNew.DoClick = function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "material" ), BRICKS_SERVER.Func.L( "directImage" ), "https://i.imgur.com/XBwi3Nh.png", function( text ) 
				selected = text
				BRICKS_SERVER.Func.CacheImageFromURL( text, function() backPanel.RefreshMaterials() end )
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end

		local materialDefaultHeader = materialsGridDefault:Add( "DPanel" )
		materialDefaultHeader:SetSize( gridWide-20, 40 )
		materialDefaultHeader.Paint = function( self2, w, h )
			draw.SimpleText( BRICKS_SERVER.Func.L( "default" ), "BRICKS_SERVER_Font25", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
		end

		for k, v in pairs( defaultMaterials ) do
			local materialEntry = materialsGridDefault:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			materialEntry.Paint = function( self2, w, h )
				if( selected == v[2] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( BRICKS_SERVER.CachedMaterials[v[2]] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( BRICKS_SERVER.CachedMaterials[v[2]] )
					local iconSize = h*0.5
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				draw.SimpleText( string.Replace( v[2], ".png", "" ), "BRICKS_SERVER_Font17", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
			end
			materialEntry.DoClick = function()
				selected = v[2]
			end
		end

		materialsGridCustom:SetTall( (math.ceil((#customMaterials+1)/slotsWide)*slotSize)+((math.ceil((#customMaterials+1)/slotsWide)-1)*spacing)+45 )
		materialsGridDefault:SetTall( (math.ceil(#defaultMaterials/slotsWide)*slotSize)+((math.ceil(#defaultMaterials/slotsWide)-1)*spacing)+45 )

		materialsGridCustom:PerformLayout()
		materialsGridDefault:PerformLayout()
		materialsScroll:Rebuild()
	end
	backPanel.RefreshMaterials()

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
		if( BRICKS_SERVER.CachedMaterials[selected] ) then
			func_confirm( selected )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		else
			notification.AddLegacy( BRICKS_SERVER.Func.L( "selectMaterial" ), 1, 3 )
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
		func_cancel( selected )
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetTall( buttonPanel:GetTall()+(4*10)+textArea:GetTall()+chooserBack:GetTall()+10+backPanel.headerHeight )
	backPanel:Center()
end
--PATH lua/bricks_server/core/client/cl_player.lua:
BRICKS_SERVER.LOCALPLYMETA = {}

setmetatable( BRICKS_SERVER.LOCALPLYMETA, BRICKS_SERVER.PLAYERMETA )
--PATH lua/bricks_server/vgui/bricks_server_config_groups_old.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    local removeMat = Material( "materials/bricks_server/delete.png" )
    local editMat = Material( "materials/bricks_server/edit.png" )
    local upMat = Material( "materials/bricks_server/up.png" )
    local downMat = Material( "materials/bricks_server/down.png" )
    
    function self.RefreshPanel()
        self:Clear()

        self.slots = nil
        if( self.grid and IsValid( self.grid ) ) then
            self.grid:Remove()
        end

        for k, v in ipairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
            local GroupBack = vgui.Create( "DPanel", self )
            GroupBack:Dock( TOP )
            GroupBack:DockMargin( 0, 0, 0, 5 )
            GroupBack:SetTall( 65 )
            GroupBack:DockPadding( 0, 0, 10, 0 )
            local groupString = ""
            for key, val in pairs( v[2] or {} ) do
                if( groupString == "" ) then
                    groupString = key
                else
                    groupString = groupString .. ", " .. key
                end
            end
            GroupBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBoxEx( 5, 0, 0, 25, h, (v[3] or BRICKS_SERVER.Func.GetTheme( 5 )), true, false, true, false )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.DrawRect( 5, 0, 20, h )

                draw.SimpleText( v[1], "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                if( v[2] and table.Count( v[2] ) > 0 ) then
                    draw.SimpleText( "User groups: " .. groupString, "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                else
                    draw.SimpleText( BRICKS_SERVER.Func.L( "noUserGroups" ), "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                end
            end
            GroupBack.AddButton = function( self2, material, func )
                local button = vgui.Create( "DButton", self2 )
                button:Dock( RIGHT )
                button:SetWide( 36 )
                button:DockMargin( 0, (self2:GetTall()-button:GetWide())/2, 0, (self2:GetTall()-button:GetWide())/2 )
                button:SetText( "" )
                local changeAlpha = 0
                local x, y = 0, 0
                button.Paint = function( self3, w, h )
                    local toScreenX, toScreenY = self3:LocalToScreen( 0, 0 )
                    if( x != toScreenX or y != toScreenY ) then
                        x, y = toScreenX, toScreenY
                    end
            
                    if( self3:IsDown() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                    elseif( self3:IsHovered() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
                    else
                        changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
                    end
            
                    surface.SetAlphaMultiplier( changeAlpha/255 )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                    surface.SetAlphaMultiplier( 1 )
            
                    surface.SetMaterial( material )
                    local size = 24
                    surface.SetDrawColor( 0, 0, 0, 255 )
                    surface.DrawTexturedRect( (h-size)/2-1, (h-size)/2+1, size, size )
            
                    surface.SetDrawColor( 255, 255, 255, 255 )
                    surface.DrawTexturedRect( (h-size)/2, (h-size)/2, size, size )
                end
                button.DoClick = function()
                    func( x, y, button:GetWide(), button:GetWide() )
                end
            end

            GroupBack:AddButton( removeMat, function( x, y, w, h )
                table.remove( BS_ConfigCopyTable.GENERAL.Groups, k )
                self.RefreshPanel()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end )
            GroupBack:AddButton( editMat, function( x, y, w, h )
                GroupBack.Menu = vgui.Create( "bricks_server_dmenu" )
                GroupBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editUserGroups" ), function()
                    BRICKS_SERVER.Func.CreateGroupEditor( (v[2] or {}), function( userGroups ) 
                        BS_ConfigCopyTable.GENERAL.Groups[k][2] = userGroups or {}
                        self.RefreshPanel()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, true )
                end )
                GroupBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editColor" ), function()
                    BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupColor" ), (v[3] or BRICKS_SERVER.Func.GetTheme( 5 )), function( color ) 
                        BS_ConfigCopyTable.GENERAL.Groups[k][3] = color or BRICKS_SERVER.Func.GetTheme( 5 )
                        self.RefreshPanel()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end )
                GroupBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editName" ), function()
                    BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupName" ), (v[1] or "GroupName"), function( text ) 
                        for key, val in pairs( BS_ConfigCopyTable.GENERAL.Groups ) do
                            if( val[1] == text ) then
                                notification.AddLegacy( BRICKS_SERVER.Func.L( "groupAlreadyExists" ), 1, 5 )
                                return
                            end
                        end
                        
                        BS_ConfigCopyTable.GENERAL.Groups[k][1] = text
                        self.RefreshPanel()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
                end )
                GroupBack.Menu:Open()
                GroupBack.Menu:SetPos( x+w+5, y+(h/2)-(GroupBack.Menu:GetTall()/2) )
            end )
            GroupBack:AddButton( downMat, function( x, y, w, h )
                if( k+1 <= #BS_ConfigCopyTable.GENERAL.Groups ) then
                    if( BS_ConfigCopyTable.GENERAL.Groups[k+1] ) then
                        BS_ConfigCopyTable.GENERAL.Groups[k] = BS_ConfigCopyTable.GENERAL.Groups[k+1]
                    end

                    BS_ConfigCopyTable.GENERAL.Groups[k+1] = v
                    self.RefreshPanel()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end
            end )
            GroupBack:AddButton( upMat, function( x, y, w, h )
                if( k-1 >= 1 ) then
                    if( BS_ConfigCopyTable.GENERAL.Groups[k-1] ) then
                        BS_ConfigCopyTable.GENERAL.Groups[k] = BS_ConfigCopyTable.GENERAL.Groups[k-1]
                    end

                    BS_ConfigCopyTable.GENERAL.Groups[k-1] = v
                    self.RefreshPanel()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end
            end )
        end

        local addNewGroup = vgui.Create( "DButton", self )
        addNewGroup:SetText( "" )
        addNewGroup:Dock( TOP )
        addNewGroup:DockMargin( 0, 0, 0, 5 )
        addNewGroup:SetTall( 40 )
        local changeAlpha = 0
        addNewGroup.Paint = function( self2, w, h )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "addNewGroup" ), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewGroup.DoClick = function()
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupName" ), BRICKS_SERVER.Func.L( "groupName" ), function( text ) 
                for key, val in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
                    if( val[1] == text ) then
                        notification.AddLegacy( BRICKS_SERVER.Func.L( "groupAlreadyExists" ), 1, 5 )
                        return
                    end
                end
                
                table.insert( BS_ConfigCopyTable.GENERAL.Groups, { text, {} } )
                self.RefreshPanel()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_groups_old", PANEL, "bricks_server_scrollpanel" )
--PATH lua/bricks_server/vgui/bricks_server_numberwang.lua:

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

--PATH lua/bricks_server/vgui/bricks_server_scrollpanel_bar.lua:

local PANEL = {}

AccessorFunc( PANEL, "Padding", "Padding" )
AccessorFunc( PANEL, "pnlCanvas", "Canvas" )

function PANEL:Init()

	self.pnlCanvas = vgui.Create( "Panel", self )
	self.pnlCanvas.OnMousePressed = function( self, code ) self:GetParent():OnMousePressed( code ) end
	self.pnlCanvas:SetMouseInputEnabled( true )
	self.pnlCanvas.PerformLayout = function( pnl )

		self:PerformLayout()
		self:InvalidateParent()

	end

	-- Create the scroll bar
	self.VBar = vgui.Create( "bricks_server_dvscrollbar", self )
	self.VBar:Dock( RIGHT )

	self:SetPadding( 0 )
	self:SetMouseInputEnabled( true )

	-- This turns off the engine drawing
	self:SetPaintBackgroundEnabled( false )
	self:SetPaintBorderEnabled( false )
	self:SetPaintBackground( false )

end

function PANEL:SetBarBackColor( color )
	self.VBar.backColor = color
end

function PANEL:SetBarColor( color )
	self.VBar.barColor = color
end

function PANEL:SetBarDownColor( color )
	self.VBar.barDownColor = color
end

function PANEL:AddItem( pnl )

	pnl:SetParent( self:GetCanvas() )

end

function PANEL:OnChildAdded( child )

	self:AddItem( child )

end

function PANEL:SizeToContents()

	self:SetSize( self.pnlCanvas:GetSize() )

end

function PANEL:GetVBar()

	return self.VBar

end

function PANEL:GetCanvas()

	return self.pnlCanvas

end

function PANEL:InnerWidth()

	return self:GetCanvas():GetWide()

end

function PANEL:Rebuild()

	self:GetCanvas():SizeToChildren( false, true )

	-- Although this behaviour isn't exactly implied, center vertically too
	if ( self.m_bNoSizing && self:GetCanvas():GetTall() < self:GetTall() ) then

		self:GetCanvas():SetPos( 0, ( self:GetTall() - self:GetCanvas():GetTall() ) * 0.5 )

	end

end

function PANEL:OnMouseWheeled( dlta )

	return self.VBar:OnMouseWheeled( dlta )

end

function PANEL:OnVScroll( iOffset )

	self.pnlCanvas:SetPos( 0, iOffset )

end

function PANEL:ScrollToChild( panel )

	self:PerformLayout()

	local x, y = self.pnlCanvas:GetChildPosition( panel )
	local w, h = panel:GetSize()

	y = y + h * 0.5
	y = y - self:GetTall() * 0.5

	self.VBar:AnimateTo( y, 0.5, 0, 0.5 )

end

function PANEL:PerformLayout()
	local Tall = self.pnlCanvas:GetTall()
	local Wide = self:GetWide()
	local YPos = 0

	self:Rebuild()

	self.VBar:SetUp( self:GetTall(), self.pnlCanvas:GetTall() )
	YPos = self.VBar:GetOffset()

	if ( self.VBar.Enabled ) then Wide = Wide - self.VBar:GetWide() end

	self.pnlCanvas:SetPos( 0, YPos )
	self.pnlCanvas:SetWide( Wide )

	self:Rebuild()

	if ( Tall != self.pnlCanvas:GetTall() ) then
		self.VBar:SetScroll( self.VBar:GetScroll() ) -- Make sure we are not too far down!
	end
end

function PANEL:Clear()

	return self.pnlCanvas:Clear()

end

derma.DefineControl( "bricks_server_scrollpanel_bar", "", PANEL, "DPanel" )

--PATH addons/sl_util_atm/lua/batm_translation.lua:
﻿BATM = BATM or {}
BATM.Lang = {}


--Edit the values after the table indexs, see example below
--Example BATM.Lang["Select an account."] = "Sélectionnez un compte."

BATM.Lang["$"] = "$"
BATM.Lang["Select an account."] = "Sélectionnez un compte."
BATM.Lang["Personal"] = "Compte"
BATM.Lang["Account"] = "Personnel"
BATM.Lang["My Group Account"] = "Mon groupe de comptes"
BATM.Lang["Other Group Accounts"] = "Autre groupe de compte"
BATM.Lang["Select a user to add."] = "sélectionner un utilisateur à ajouter."
BATM.Lang["Previous"] = "précédent"
BATM.Lang["Next"] = "Suivant"
BATM.Lang["Deposit"] = "Deposer"
BATM.Lang["Enter Amount"] = "Entrer le montant"
BATM.Lang["Deposit Complete"] = "Dépôt terminé"
BATM.Lang["Transfer Complete."] = "transfert complet."
BATM.Lang["Withdrawal Complete."] = "Retrait terminé."
BATM.Lang["Request failed, check chat."] = "La demande a échoué, vérifiez le chat."
BATM.Lang["What would you like to do?"] = "Qu'est-ce que tu veux faire?"
BATM.Lang["History"] = "Historique"
BATM.Lang["Withdraw"] = "Retirer"
BATM.Lang["Members"] = "Membres"
BATM.Lang["Press 'E' to access your account."] = "Appuyez sur 'E' pour accéder à votre compte."
BATM.Lang["Loading..."] = "Chargement..."
BATM.Lang["Kick User"] = "Retirer user"
BATM.Lang["Add User"] = "Ajouter user"
BATM.Lang["Transfer"] = "Transfert"
BATM.Lang["Offline User"] = "Utilisateur hors ligne"
BATM.Lang["Transfer funds to"] = "Transférer des fonds vers"
BATM.Lang["Done"] = "Terminé"
BATM.Lang["Enter Users"] = "Entrer utilisateurs"
BATM.Lang["SteamID64"] = "SteamID64"
BATM.Lang["Enter SteamID64"] = "Entrer SteamID64"
BATM.Lang["% Interest"] = "% Interest"
BATM.Lang["% interest! You will next get interest in 15 minutes!"] = "% interest! Vous aurez ensuite l'intérêt dans 15 minutes!"
BATM.Lang["[ATM] You just got "] = "[ATM] Tu viens de "
BATM.Lang["[ATM] Incorrect data..."] = "[ATM] Données incorrectes..."
BATM.Lang["[ATM] You are not a member of this group..."] = "[ATM] Vous n'êtes pas membre de ce groupe..."
BATM.Lang["[ATM] You don't have that much money!"] = "[ATM] Vous n'avez pas beaucoup d'argent!"
BATM.Lang["Deposit from account owner"] = "Dépôt du titulaire du compte"
BATM.Lang["[ATM] You don't have permission to do this..."] = "[ATM] Vous n'avez pas la permission de faire ça..."
BATM.Lang["[ATM] You're sending to many requests! Please wait..."] = "[ATM] Vous envoyez beaucoup de demandes! S'il vous plaît, attendez..."
BATM.Lang["[ATM] That person does not have an account set up!"] = "[ATM] Cette personne n'a pas de compte configuré!"
BATM.Lang["[ATM] "] = "[ATM] "
BATM.Lang["[ATM] Invalid player..."] = "[ATM] Joueur invalide..."
BATM.Lang["[ATM] Oh no! Something went wrong, please try again!"] = "[ATM] Oh non! Une erreur s'est produite. Veuillez réessayer!"
BATM.Lang["[ATM] Blue's atms have been saved for the map "] = "[ATM] Les ATM ont été sauvegardés pour la carte "
BATM.Lang["[ATM] You do not have permission to perform this action, please contact an admin."] = "[ATM] Vous n'êtes pas autorisé à effectuer cette action, veuillez contacter un administrateur."
BATM.Lang["[ATM] You're sesion has ended as you took too long to interact!"] = "[ATM] Vous avez mis trop de temps à interagir!"
BATM.Lang["[ATM] You're sesion has ended as you are to far away from the machine!"] = "[ATM] Vous êtes trop loin de la machine!"
BATM.Lang["[ATM] Someone is already using this ATM"] = "[ATM] Quelqu'un utilise déjà cette ATM"
BATM.Lang["[ATM] You are already using anouther ATM!"] = "[ATM] Vous utilisez déjà un autre ATM!"
BATM.Lang["Press 'E' to set up!"] = "Appuyez sur 'E' pour configurer!"
BATM.Lang["Enter Price"] = "Entrez le prix"
BATM.Lang["Enter Title"] = "Entrez le titre"
BATM.Lang["Enter Description"] = "Entrez la description"
BATM.Lang["Submit"] = "Soumettre"
BATM.Lang["Seller : "] = "Seller : "
BATM.Lang["Purchase"] = "Purchase"
BATM.Lang["[ATM] The owner has not yet set up this device"] = "[ATM] Le propriétaire n'a pas encore configuré cet appareil"
BATM.Lang["[ATM] An unknown error has occured."] = "[ATM] An unknown error has occured."
BATM.Lang["[ATM] You must have a title"] = "[ATM] You must have a title"
BATM.Lang["[ATM] You must have a description"] = "[ATM] Vous devez avoir une description"
BATM.Lang["[ATM] Invalid number..."] = "[ATM] Invalid number..."
BATM.Lang["[ATM] Nice try buddy :)"] = "[ATM] Bien essayé bebe :)" --This is when the atm detects someone is trying to cheat :)
BATM.Lang["[ATM] Number to large"] = "[ATM] Nombre trop grand"
BATM.Lang["[ATM] Info Updated"] = "[ATM] Info mise a jour"
BATM.Lang["[ATM] An unknown error has occured, open a support ticket please."] = "[ATM] Une erreur inconnue s'est produite, ouvrez un ticket s'il vous plaît."
BATM.Lang["Purchase to "] = "Achat à "
BATM.Lang["Purchase from "] = "Achat de "
BATM.Lang["[ATM] Purchase Succesfull"] = "[ATM] Achat Reussit"
BATM.Lang["[ATM] Purchase received from "] = "[ATM] Achat reçu de "
BATM.Lang["Refund from a corrupt transaction."] = "Remboursement d'une transaction corrompue."
BATM.Lang["[ATM] The owner of this device does not have a valid account, this can happen if they leave the server and their entity is still here."] = "[ATM] The owner of this device does not have a valid account, this can happen if they leave the server and their entity is still here."
BATM.Lang["[ATM] You don't have enougth money in your bank to do this."] = "[ATM] You don't have enougth money in your bank to do this."
--PATH addons/sl_utils/lua/autorun/client/guigui_handcuffs.lua:
CreateConVar("Handcuffs_ShowHeadText", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED }, "Show head text")

surface.CreateFont("HandcuffsHUD", { 
	font = "Arial", 
	size = 50, 
	antialias = true, 
	weight = 750, 
	shadow = true
})

surface.CreateFont("HandcuffsDraw", {
	font = "Arial", 
	size = 25, 
	antialias = true, 
	weight = 750, 
	shadow = true
})

hook.Add("PostDrawHUD", "HandcuffsHUD", function()
	local ply = LocalPlayer()
	if ply:HasWeapon("guigui_handcuffed") then
		if !ply:Alive() then return end
		draw.DrawText(guigui_handcuff_lang().Handcuffed, "HandcuffsHUD", ScrW()/2, ScrH()/1.08, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
	end
end)

hook.Add("PostPlayerDraw", "HandcuffsDraw", function(ply)
	if GetConVar("Handcuffs_ShowHeadText"):GetString() == "1" then
		if ply:HasWeapon("guigui_handcuffed") then
			if !ply:Alive() then return end
			local offset = Vector(0, 0, 85)
			local ang = LocalPlayer():EyeAngles()
			local pos = ply:GetPos() + offset + ang:Up()
			ang:RotateAroundAxis(ang:Forward(), 90)
			ang:RotateAroundAxis(ang:Right(), 90)
			cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.25)
				draw.DrawText(guigui_handcuff_lang().Handcuffed, "HandcuffsDraw", 2, 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			cam.End3D2D()
		end
	end
end)
--PATH lua/vgui/bvgui/checkbox_crossable.lua:
local PANEL = {}

local checked_mat = Material("vgui/bvgui/checked.png", "smooth")
local crossed_mat = Material("vgui/bvgui/cross.png", "smooth")

function PANEL:Init()
	self.Checked = 0

	self.CheckedOpacity = bVGUI.Lerp(0,0,.5)
	self.CrossedOpacity = bVGUI.Lerp(0,0,.5)
end

function PANEL:OnMouseReleased()
	self.Checked = self.Checked + 1
	if (self.Checked > 2) then self.Checked = 0 end
	if (self.OnChange) then
		self:OnChange()
	end
	self:UpdateOpacities()
	if (GAS) then
		if (self.Checked == 1) then
			GAS:PlaySound("btn_on")
		elseif (self.Checked == 2) then
			GAS:PlaySound("delete")
		else
			GAS:PlaySound("btn_off")
		end
	end
end

function PANEL:SetChecked(checked)
	self.Checked = math.Clamp(checked, 0, 2)
	self:UpdateOpacities()
end

function PANEL:UpdateOpacities()
	if (self.Checked == 1) then
		self.CheckedOpacity:SetTo(255)
	elseif (self.CheckedOpacity.to ~= 0) then
		self.CheckedOpacity:SetTo(0)
	end
	if (self.Checked == 2) then
		self.CrossedOpacity:SetTo(255)
	elseif (self.CrossedOpacity.to ~= 0) then
		self.CrossedOpacity:SetTo(0)
	end
end

local checkbox_bg = Color(47,53,66)
local check_size = 12
function PANEL:Paint(w,h)
	draw.RoundedBox(4, 0, 0, w, h, checkbox_bg)

	self.CheckedOpacity:DoLerp()
	self.CrossedOpacity:DoLerp()

	surface.SetMaterial(checked_mat)
	surface.SetDrawColor(255,255,255,self.CheckedOpacity:GetValue())
	surface.DrawTexturedRect(w / 2 - check_size / 2, h / 2 - check_size / 2, check_size, check_size)

	surface.SetMaterial(crossed_mat)
	surface.SetDrawColor(255,255,255,self.CrossedOpacity:GetValue())
	surface.DrawTexturedRect(w / 2 - check_size / 2, h / 2 - check_size / 2, check_size, check_size)
end

derma.DefineControl("bVGUI.Checkbox_Crossable", nil, PANEL, "bVGUI.Checkbox")
--PATH lua/vgui/bvgui/gauge.lua:
local PANEL = {}

function PANEL:Init()
	self.Color = Color(192,57,43)
	self.Progress = 0
	self.ProgressAngle = 0

	self.ProgressCircle = GAS_NewCircle(CIRCLE_OUTLINED)
	self.ProgressCircle:SetAngles(180,360)
	self.ProgressCircle:SetThickness(20)
	self.ProgressCircle:SetVertices(64)

	self.ProgressBackgroundCircle = GAS_NewCircle(CIRCLE_OUTLINED)
	self.ProgressBackgroundCircle:SetAngles(180,360)
	self.ProgressBackgroundCircle:SetThickness(20)
	self.ProgressBackgroundCircle:SetVertices(64)

	self.BackgroundCircle = GAS_NewCircle(CIRCLE_FILLED)
	self.BackgroundCircle:SetAngles(180,360)
	self.BackgroundCircle:SetVertices(64)

	self.Text = vgui.Create("DLabel", self)
	self.Text:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 18))
	self.Text:SetTextColor(COLOR_WHITE)
	self.Text:SetText("")

	self.SubText = vgui.Create("DLabel", self)
	self.SubText:SetVisible(false)
	self.SubText:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
	self.SubText:SetTextColor(COLOR_WHITE)
	self.SubText:SetText("")
end

function PANEL:SetColor(col_from, col_to)
	if (IsColor(col_from) and col_to == nil) then
		self.Color = col_from
		self.ColorFrom = nil
		self.ColorTo = nil
	elseif (IsColor(col_from) and IsColor(col_to)) then
		self.Color = table.Copy(col_from)
		self.ColorFrom = col_from
		self.ColorTo = col_to
	end
end

function PANEL:SetProgress(progress)
	self.Progress = math.Clamp(progress, 0, 100)
end

function PANEL:SetText(txt)
	self.Text:SetText(txt)
end

function PANEL:SetSubText(txt)
	if (txt == nil or #txt == 0) then
		self.SubText:SetVisible(false)
	else
		self.SubText:SetVisible(true)
		self.SubText:SetText(txt)
	end
end

function PANEL:PerformLayout(w, h)
	self.Text:SizeToContents()

	if (self.SubText:IsVisible()) then
		self.SubText:SizeToContents()

		self.Text:SetPos((w - self.Text:GetWide()) / 2, ((w - self.Text:GetTall()) / 2) - 20 - (self.SubText:GetTall() / 2))
		self.SubText:SetPos((w - self.SubText:GetWide()) / 2, ((w - self.Text:GetTall()) / 2) - 20 + (self.Text:GetTall() / 2))
	else
		self.Text:SetPos((w - self.Text:GetWide()) / 2, ((w - self.Text:GetTall()) / 2) - 20)
	end
end

function PANEL:Paint(w,h)
	draw.NoTexture()

	local r = w / 2

	surface.SetDrawColor(45,45,45,255)
	self.ProgressBackgroundCircle:SetPos(w / 2, w / 2)
	self.ProgressBackgroundCircle:SetRadius(r)
	self.ProgressBackgroundCircle()

	local progress_frac = (self.Progress / 100)
	if (self.ColorFrom and self.ColorTo) then
		self.Color.r = Lerp(0.05, self.Color.r, self.ColorFrom.r + ((self.ColorTo.r - self.ColorFrom.r) * progress_frac))
		self.Color.g = Lerp(0.05, self.Color.g, self.ColorFrom.g + ((self.ColorTo.g - self.ColorFrom.g) * progress_frac))
		self.Color.b = Lerp(0.05, self.Color.b, self.ColorFrom.b + ((self.ColorTo.b - self.ColorFrom.b) * progress_frac))
	end
	self.ProgressAngle = Lerp(0.05, self.ProgressAngle, progress_frac * 180)

	surface.SetDrawColor(self.Color)
	self.ProgressCircle:SetAngles(180, 180 + self.ProgressAngle)
	self.ProgressCircle:SetPos(w / 2, w / 2)
	self.ProgressCircle:SetRadius(r)
	self.ProgressCircle()

	surface.SetDrawColor(60,60,60,255)
	self.BackgroundCircle:SetPos(w / 2, w / 2)
	self.BackgroundCircle:SetRadius(r - 20)
	self.BackgroundCircle()
end

derma.DefineControl("bVGUI.Gauge", nil, PANEL, "DPanel")
--PATH lua/vgui/bvgui/httplogo.lua:
file.CreateDir("gas_http_png")

local PANEL = {}

local logo_mat = Material("gmodadminsuite/gmodadminsuite.vtf")
function PANEL:Init()
	local this = self

	self.Directory = "gas_http_png"

	self:Dock(TOP)
	self:SetTall(128 + 20 + 10 + 25 + 10)

	self.Logo = vgui.Create("DImage", self)
	self.Logo:SetSize(128,128)
	self.Logo:SetMaterial(logo_mat)

	self.LoadingOverlay = vgui.Create("bVGUI.LoadingPanel", self)
	self.LoadingOverlay:Dock(FILL)
	self.LoadingOverlay:SetLoading(false)

	self.URLContainer = vgui.Create("bVGUI.BlankPanel", self)
	self.URLContainer:Dock(TOP)
	self.URLContainer:DockMargin(0,128 + 20 + 20,0,0)
	self.URLContainer:SetTall(25)
	function self.URLContainer:PerformLayout()
		this.URLField:Center()
	end

	self.URLField = vgui.Create("bVGUI.TextEntry", self.URLContainer)
	self.URLField:SetPlaceholderText("URL...")
	self.URLField:SetSize(128 + 20 + 40, 25)
	function self.URLField:OnLoseFocus()
		self:ResetValidity()
		if (self:GetValue() == "") then
			this.Logo:SetVisible(true)
			this.Logo:SetMaterial(logo_mat)
			return
		end

		this.Logo:SetVisible(false)
		this.LoadingOverlay:SetLoading(true)

		local crc = util.CRC(os.date("%d%m%Y") .. self:GetValue()) .. ".png"

		http.Fetch(self:GetValue(), function(body, size, headers, code)
			this.LoadingOverlay:SetLoading(false)
			if (body:find("^.PNG")) then
				file.Write(this.Directory .. "/" .. crc, body)
				this.Logo:SetVisible(true)
				this.Logo:SetMaterial(Material("data/" .. this.Directory .. "/" .. crc))
				self:SetValid(true)
			else
				self:SetInvalid(true)
			end
			if (this.Always) then
				this:Always()
			end
			if (this.Success) then
				this:Success()
			end
		end, function()
			this.LoadingOverlay:SetLoading(false)
			self:SetInvalid(true)
			if (this.Always) then
				this:Always()
			end
			if (this.Failure) then
				this:Failure()
			end
		end)
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect((w - (128 + 20)) / 2,0,128 + 20,128 + 20)

	if (self.URLField._Invalid) then
		surface.SetDrawColor(255,0,0,100)
		surface.DrawRect((w - 128) / 2,10,128,128)
	end
end

function PANEL:GetURL()
	if (this.URLField._Valid) then
		return self.URLField:GetValue()
	else
		return false
	end
end

function PANEL:SetPlaceholderText(text)
	self.URLField:SetPlaceholderText(text)
end

function PANEL:SetDirectory(path)
	self.Directory = path
	file.CreateDir(path)
end

function PANEL:PerformLayout()
	self.Logo:AlignTop(10)
	self.Logo:CenterHorizontal()
end

derma.DefineControl("bVGUI.HTTPImageInput", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/bvgui/pagination.lua:
local PANEL = {}

local page_btn_font = bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14)
local page_btn_width = 23
local page_btn_padding = 15
local inactive_page_textcolor = Color(175,175,175)

local next_btn_mat = Material("vgui/bvgui/right-arrow.png", "smooth")
local prev_btn_mat = Material("vgui/bvgui/left-arrow.png", "smooth")

function PANEL:LoadingDebounce()
	if (IsValid(self.LoadingPanel)) then
		if (self.LoadingPanel:GetLoading() == true) then
			return true
		end
	end
	return false
end
function PANEL:SetLoadingPanel(loading_panel)
	self.LoadingPanel = loading_panel
end

function PANEL:Init()
	local pagination = self

	self.CurrentPage = 1
	self.Pages = 0

	self.Previous = vgui.Create("bVGUI.BlankPanel", self)
	self.Previous:SetMouseInputEnabled(true)
	self.Previous:SetCursor("hand")
	self.Previous:Dock(LEFT)
	self.Previous.Old_OnMouseReleased = self.Previous.OnMouseReleased
	function self.Previous:OnMouseReleased(m)
		if (self:GetParent().LoadingPanel and self:GetParent():LoadingDebounce() == true) then return end
		if (pagination:GetPage() ~= 1) then
			pagination:SetPage(pagination:GetPage() - 1)
			if (pagination.OnPageSelected) then
				pagination:OnPageSelected(pagination:GetPage())
			end
		end
		if (self.Old_OnMouseReleased) then
			self:Old_OnMouseReleased(m)
		end
	end
	self.Previous.Btn = vgui.Create("DImage", self.Previous)
	self.Previous.Btn:SetSize(16,16)
	self.Previous.Btn:SetMaterial(prev_btn_mat)
	function self.Previous:PerformLayout()
		self.Btn:Center()
	end

	self.PagesContainer = vgui.Create("bVGUI.BlankPanel", self)
	self.PagesContainer:SetMouseInputEnabled(true)
	self.PagesContainer:SetCursor("hand")
	function self.PagesContainer:OnMouseReleased()
		if (self:GetParent().LoadingPanel and self:GetParent():LoadingDebounce() == true) then return end
		if (self.HoveredButton and self.HoveredButton > 0 and (self:GetParent().Infinite == true or self.HoveredButton <= math.min(9, self:GetParent():GetPages()))) then
			if self:GetParent().MovingTo == self.HoveredButton then return end
			self:GetParent().MovingTo = self.HoveredButton
			if (pagination.DrawPages[self.HoveredButton] == "∞") then
				return
			elseif (pagination.DrawPages[self.HoveredButton] == "..") then
				if (self.HoveredButton == #pagination.DrawPages - 1) then
					if (self:GetParent().Infinite) then
						self:GetParent().Next:OnMouseReleased(MOUSE_LEFT)
						return
					else
						pagination:SetPage(pagination.DrawPages[self.HoveredButton - 1] + 1)
					end
				elseif (self.HoveredButton == 2) then
					if (self:GetParent().Infinite) then
						self:GetParent().Previous:OnMouseReleased(MOUSE_LEFT)
						return
					else
						pagination:SetPage(pagination.DrawPages[self.HoveredButton + 1] - 1)
					end
				end
			else
				pagination:SetPage(pagination.DrawPages[self.HoveredButton])
			end
			if (pagination.OnPageSelected) then
				pagination:OnPageSelected(pagination:GetPage())
			end
		end
	end

	self.Next = vgui.Create("bVGUI.BlankPanel", self)
	self.Next:SetMouseInputEnabled(true)
	self.Next:SetCursor("hand")
	self.Next:Dock(RIGHT)
	self.Next.Old_OnMouseReleased = self.Next.OnMouseReleased
	function self.Next:OnMouseReleased(m)
		if (self:GetParent().LoadingPanel and self:GetParent():LoadingDebounce() == true) then return end
		if (self:GetParent().Infinite or pagination:GetPage() < pagination:GetPages()) then
			pagination:SetPage(pagination:GetPage() + 1)
			if (pagination.OnPageSelected) then
				pagination:OnPageSelected(pagination:GetPage())
			end
		end
		if (self.Old_OnMouseReleased) then
			self:Old_OnMouseReleased(m)
		end
	end
	self.Next.Btn = vgui.Create("DImage", self.Next)
	self.Next.Btn:SetSize(16,16)
	self.Next.Btn:SetMaterial(next_btn_mat)
	function self.Next:PerformLayout()
		self.Btn:Center()
	end

	local page_poly = {
		{x = 0, y = 0},
		{x = 0, y = 0},
		{x = 0, y = 0},
		{x = 0, y = 0}
	}
	local hover_poly = {
		{x = 0, y = 0},
		{x = 0, y = 0},
		{x = 0, y = 0},
		{x = 0, y = 0}
	}
	function self.PagesContainer:Paint(w,h)
		local pages = pagination.Pages
		local current_page = pagination.CurrentPage
		if (pages == 0) then return end

		local infinite_controlled_pages = pages
		if (self:GetParent().Infinite) then infinite_controlled_pages = current_page + 2 end

		for i=0,math.min(infinite_controlled_pages, 9) do
			surface.SetDrawColor(40, 40, 40)
			surface.DrawLine((i * page_btn_width) + (i * page_btn_padding), h, ((i + 1) * page_btn_width) + (i * page_btn_padding), 0)
		end

		self.RhombusLerp:DoLerp()

		draw.NoTexture()

		local position = self.RhombusLerp:GetValue()

		page_poly[1].x = position + page_btn_width
		--page_poly[1].y = 0

		page_poly[2].x = position + page_btn_width + page_btn_padding + page_btn_width + 1
		--page_poly[2].y = 0

		page_poly[3].x = position + page_btn_width + page_btn_padding + 1
		page_poly[3].y = h

		page_poly[4].x = position
		page_poly[4].y = h

		surface.SetDrawColor(27, 127, 249)
		surface.DrawPoly(page_poly)

		if (self:IsHovered()) then
			-- please, a moment of silence for the amount of hours this took
			local x,y = self:ScreenToLocal(gui.MousePos())
			local rel_x = (x / (page_btn_width + page_btn_padding) % 1) * (page_btn_width + page_btn_padding)
			local rhombus_midpoint = h * (1 - (rel_x / page_btn_width))
			local hovered_position = x / (page_btn_width + page_btn_padding)
			if (rel_x < page_btn_width) then
				if (rhombus_midpoint < y) then
					hovered_position = math.floor(hovered_position + 1)
				else
					hovered_position = math.floor(hovered_position)
				end
			else
				hovered_position = math.ceil(hovered_position)
			end
			self.HoveredButton = hovered_position
			if (hovered_position > 0 and hovered_position <= math.min(9, infinite_controlled_pages)) then
				hovered_position = (hovered_position - 1) * (page_btn_width + page_btn_padding)

				hover_poly[1].x = hovered_position + page_btn_width
				--hover_poly[1].y = 0

				hover_poly[2].x = hovered_position + page_btn_width + page_btn_padding + page_btn_width + 1
				--hover_poly[2].y = 0

				hover_poly[3].x = hovered_position + page_btn_width + page_btn_padding + 1
				hover_poly[3].y = h

				hover_poly[4].x = hovered_position
				hover_poly[4].y = h

				surface.SetDrawColor(27, 127, 249, 100)
				surface.DrawPoly(hover_poly)
			end
		end

		for i,v in ipairs(self:GetParent().DrawPages) do
			if (v == current_page or (i == self.HoveredButton and self:IsHovered())) then
				draw.SimpleText(v, page_btn_font, ((page_btn_width + page_btn_padding) * i) - (page_btn_padding / 2), h / 2, bVGUI.COLOR_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText(v, page_btn_font, ((page_btn_width + page_btn_padding) * i) - (page_btn_padding / 2), h / 2, inactive_page_textcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	end
end

function PANEL:UpdatePageButtons()
	self.DrawPages = {}

	local all_pages = self:GetPages()
	if (self.Infinite) then all_pages = "∞" end
	local current_page = self:GetPage()

	if (current_page < 8) then
		local _all_pages = all_pages
		if (self.Infinite) then _all_pages = current_page end
		for i=1,math.min(_all_pages, 7) do
			table.insert(self.DrawPages, i)
		end
		table.insert(self.DrawPages, "..")
		table.insert(self.DrawPages, all_pages)
	elseif (self.Infinite ~= true and current_page >= (all_pages - 6)) then
		table.insert(self.DrawPages, 1)
		table.insert(self.DrawPages, "..")
		for i=all_pages - 6, all_pages do
			table.insert(self.DrawPages, i)
		end
	elseif (self.Infinite) then
		table.insert(self.DrawPages, 1)
		table.insert(self.DrawPages, "..")
		for i=current_page - 4, current_page do
			table.insert(self.DrawPages, i)
		end
		table.insert(self.DrawPages, "..")
		table.insert(self.DrawPages, all_pages)
	elseif (current_page <= 12) then
		table.insert(self.DrawPages, 1)
		table.insert(self.DrawPages, "..")
		for i=8,12 do
			table.insert(self.DrawPages, i)
		end
		table.insert(self.DrawPages, "..")
		table.insert(self.DrawPages, all_pages)
	else
		table.insert(self.DrawPages, 1)
		table.insert(self.DrawPages, "..")
		table.insert(self.DrawPages, current_page - 2)
		table.insert(self.DrawPages, current_page - 1)
		table.insert(self.DrawPages, current_page)
		table.insert(self.DrawPages, current_page + 1)
		table.insert(self.DrawPages, current_page + 2)
		table.insert(self.DrawPages, "..")
		table.insert(self.DrawPages, all_pages)
	end
	for i,v in ipairs(self.DrawPages) do
		if (v == current_page) then
			local rhombus_pos = (i - 1) * (page_btn_width + page_btn_padding)
			if (not self.PagesContainer.RhombusLerp) then
				self.PagesContainer.RhombusLerp = bVGUI.Lerp(rhombus_pos, rhombus_pos, .5)
			else
				self.PagesContainer.RhombusLerp:SetTo(rhombus_pos)
			end
			break
		end
	end
	if (self.Infinite) then all_pages = current_page + 2 end
	self.PagesContainer:SetWide(((math.min(all_pages, 9) + 1) * page_btn_width) + (math.min(all_pages, 9) * page_btn_padding))
end

function PANEL:SetPage(page)
	if (page == "∞") then return end
	self.CurrentPage = page
	self:UpdatePageButtons()
end
function PANEL:GetPage()
	return self.CurrentPage
end

function PANEL:SetPages(pages)
	self.Pages = pages
	self.CurrentPage = math.min(self.CurrentPage, pages)
	self:UpdatePageButtons()
end
function PANEL:GetPages()
	return self.Pages
end

function PANEL:SetInfinite(infinite)
	self.Infinite = infinite
	self:UpdatePageButtons()
end

function PANEL:PerformLayout()
	self.PagesContainer:SetTall(self:GetTall())
	self.PagesContainer:CenterHorizontal()
	self.Previous:SetSize(self:GetTall(), self:GetTall())
	self.Next:SetSize(self:GetTall(), self:GetTall())
end

derma.DefineControl("bVGUI.Pagination", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/bvgui/table.lua:
bVGUI.TABLE_COLUMN_GROW   = 0
bVGUI.TABLE_COLUMN_SHRINK = 1

--/// bVGUI.Table ///--

local PANEL = {}

function PANEL:Init()
	self.Columns = {}
	self.Rows = {}
	self.ColumnWidths = {}

	self.ColumnContainer = vgui.Create("DPanel", self)
	self.ColumnContainer:Dock(TOP)
	self.ColumnContainer.Paint = nil

	self.RowContainer = vgui.Create("bVGUI.ScrollPanel", self)
	self.RowContainer:Dock(FILL)
	self.RowContainer.Paint = nil

	self.TextSize = 14
	self.RowContainer.OnMouseWheeled_Old = self.RowContainer.OnMouseWheeled
	function self.RowContainer:OnMouseWheeled(delta)
		if (input.IsKeyDown(KEY_LCONTROL)) then
			local tbl = self:GetParent()
			if (delta > 0) then
				tbl.TextSize = math.min(tbl.TextSize + 1, 18)
			else
				tbl.TextSize = math.max(tbl.TextSize - 1, 10)
			end
			for _,row in ipairs(tbl.Rows) do
				row.Font = bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", tbl.TextSize)
			end
			tbl:InvalidateLayout(true)
			tbl:InvalidateChildren(true)
		else
			self:OnMouseWheeled_Old(delta)
		end
	end

	self.NoData = vgui.Create("DLabel", self)
	self.NoData:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.NoData:SetTextColor(bVGUI.COLOR_WHITE)
	self.NoData:SetText(bVGUI.L("no_data"))
	self.NoData:SizeToContents()

	self.NoResultsFound = vgui.Create("DLabel", self)
	self.NoResultsFound:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.NoResultsFound:SetTextColor(bVGUI.COLOR_WHITE)
	self.NoResultsFound:SetText(bVGUI.L("no_results_found"))
	self.NoResultsFound:SizeToContents()
	self.NoResultsFound:SetVisible(false)
end

function PANEL:SetRowCursor(cursor)
	self.RowCursor = cursor
end
function PANEL:GetRowCursor()
	return self.RowCursor
end

function PANEL:Clear()
	for _,v in ipairs(self.Rows) do
		v:Remove()
	end
	self.Rows = {}
	self:InvalidateLayout(true)
end

function PANEL:AddColumn(name, sizing, alignment, color)
	local column = vgui.Create("bVGUI.Table_Column", self.ColumnContainer)
	column:SetText(name)
	column:SetColor(color or Color(51, 80, 114))
	column:SetSizing(sizing or bVGUI.TABLE_COLUMN_GROW)
	column:SetAlignment(alignment or TEXT_ALIGN_LEFT)
	column:SetDrawBorder(false)

	table.insert(self.Columns, column)

	return column
end

function PANEL:AddRow(...)
	local row = vgui.Create("bVGUI.Table_Row", self.RowContainer)
	row.RowIndex = table.insert(self.Rows, row)
	row.LabelsData = {...}
	row:InvalidateLayout(true)
	if (self.RowCursor) then
		row:SetCursor(self.RowCursor)
	end
	self:InvalidateLayout(true)

	return row
end

function PANEL:RemoveRow(index_or_row)
	local row
	if (type(index_or_row) == "number") then
		row = self.Rows[index_or_row]
	elseif (IsValid(index_or_row)) then
		row = index_or_row
	else
		return
	end
	self.Rows[row.RowIndex] = nil
	row:Remove()
	local new_rows = {}
	local i = 0
	for _,v in pairs(self.Rows) do
		i = i + 1
		table.insert(new_rows, v)
		v.RowIndex = i
	end
	self.Rows = new_rows
	self:InvalidateLayout(true)
end

function PANEL:RerenderMarkups()
	for _,row in pairs(self.Rows) do
		row.LabelsMarkup = nil
	end
end

function PANEL:PerformLayout()
	self.ColumnWidths = {}

	local cur_space = self:GetWide()
	if (self.IconLayout) then cur_space = cur_space - 16 - 10 end
	local grow_count = 0
	for i,v in pairs(self.Columns) do
		if (v.Sizing == bVGUI.TABLE_COLUMN_SHRINK) then
			v:SizeToContents()
			v.Label:SizeToContents()
			local width = v.Label:GetWide() + 26
			for _,row in ipairs(self.Rows) do
				if (row.LabelsMarkup) then
					width = math.max(width, row.LabelsMarkup[i]:GetWidth() + 14)
				end
			end
			v:SetWide(width)
			v:InvalidateLayout(true)
			cur_space = cur_space - width
			self.ColumnWidths[i] = width
		else
			grow_count = grow_count + 1
		end
	end

	local grow_width = cur_space / grow_count
	for i,v in pairs(self.Columns) do
		if (v.Sizing == bVGUI.TABLE_COLUMN_GROW) then
			v:SetWide(grow_width)
			self.ColumnWidths[i] = grow_width
			for _,row in ipairs(self.Rows) do
				if (row.LabelsMarkup) then
					row.LabelsMarkup[i] = markup.Parse("<colour=225,225,225><font=" .. row.Font .. ">" .. row.LabelsData[i] .. "</font></colour>", grow_width - 14)
				end
			end
		end
	end

	self.NoData:Center()
	self.NoResultsFound:Center()
end

function PANEL:SortRows()
	local size_y = 0
	local no_rows = true
	for i,v in pairs(self.Rows) do
		if (not v:IsVisible()) then continue end
		v:AlignTop(size_y)
		size_y = size_y + v:GetTall()
		no_rows = false
	end
	self.NoResultsFound.Visible = no_rows
end

function PANEL:Paint(w,h)
	self:LoadingPaint(w,h)
	if (not self.LoadingState or self.LoadingState ~= self:GetLoading()) then
		self.LoadingState = self:GetLoading()
		self.NoData:SetVisible(self:GetLoading() == false and #self.Rows == 0)
	end
	self.NoResultsFound:SetVisible(not self.NoData:IsVisible() and self:GetLoading() ~= true and self.NoResultsFound.Visible)

	surface.SetDrawColor(51, 80, 114)
	surface.DrawRect(0,0,w,23)

	surface.SetDrawColor(31, 48, 68)
	surface.DrawLine(0,23,w,23)
end

derma.DefineControl("bVGUI.Table", nil, PANEL, "bVGUI.LoadingPanel")

--/// bVGUI.Table_Column ///--

local PANEL = {}

function PANEL:Init()
	self:SetCursor("arrow")
	self:Dock(LEFT)
	self:SetDrawBorder(false)
	self.ColumnBorderColor = bVGUI.DarkenColor(self.OriginalBarColor, 0.4)
	self.ColumnSideColor = bVGUI.DarkenColor(self.OriginalBarColor, 0.4)
end

function PANEL:GetSizing()
	return self.Sizing
end
function PANEL:SetSizing(size_enum)
	self.Sizing = size_enum
end

function PANEL:SetAlignment(alignment)
	self.Alignment = alignment
end
function PANEL:GetAlignment(alignment)
	return self.Alignment
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(self.ColumnBorderColor)
	surface.DrawLine(-1,h - 1,w + 1,h - 1)

	surface.SetDrawColor(self.ColumnSideColor)
	surface.DrawLine(w - 1, 0, w - 1, h - 1)

end

derma.DefineControl("bVGUI.Table_Column", nil, PANEL, "bVGUI.Button")

--/// bVGUI.Table_Row ///--

local PANEL = {}

function PANEL:Init()
	self.Table = self:GetParent():GetParent():GetParent()
	self:Dock(TOP)

	self.Font = bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", self.Table.TextSize)
	self.CurrentFont = self.Font
end

local row_1 = Color(39,44,53)
local row_2 = Color(35,40,48)
function PANEL:Paint(w,h)
	if (self.RowIndex % 2 == 0) then
		surface.SetDrawColor(31, 35, 43)
	else
		surface.SetDrawColor(33, 37, 45)
	end
	surface.DrawRect(0,0,w,h)
	if (self.Highlight) then
		surface.SetDrawColor(255,255,0,4)
		surface.DrawRect(0,0,w,h)
	elseif (self:IsHovered()) then
		surface.SetDrawColor(255,255,255,4)
		surface.DrawRect(0,0,w,h)
	end
	if (not self.LabelsMarkup or self.CurrentFont ~= self.Font) then
		self.CurrentFont = self.Font
		self.LabelsMarkup = {}
		for i,v in pairs(self.LabelsData) do
			if (self.Table.Columns[i]:GetSizing() ~= bVGUI.TABLE_COLUMN_SHRINK) then
				self.LabelsMarkup[i] = markup.Parse("<colour=225,225,225><font=" .. self.Font .. ">" .. v .. "</font></colour>", self.Table.ColumnWidths[i] - 14)
			else
				self.LabelsMarkup[i] = markup.Parse("<colour=225,225,225><font=" .. self.Font .. ">" .. v .. "</font></colour>")
			end
		end
	end
	local cumulative = 0
	local tall = self:GetTall()
	local max_height = 0
	for i,v in pairs(self.LabelsMarkup) do
		local l_padding = 0
		if (self.Table.IconLayout) then
			l_padding = 16 + 10
			if (i == 1) then
				l_padding = l_padding - 5
			end
		end
		if (v:GetWidth() > self.Table.ColumnWidths[i]) then
			self.Table:InvalidateLayout(true)
		end
		local alignment = self.Table.Columns[i]:GetAlignment()
		if (alignment == TEXT_ALIGN_CENTER) then
			v:Draw(l_padding + cumulative + (self.Table.ColumnWidths[i] / 2), tall / 2 - v:GetHeight() / 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		elseif (alignment == TEXT_ALIGN_RIGHT) then
			v:Draw(l_padding + cumulative + self.Table.ColumnWidths[i] - 7, tall / 2 - v:GetHeight() / 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		else
			v:Draw(l_padding + 7 + cumulative, tall / 2 - v:GetHeight() / 2, self.Table.Columns[i]:GetAlignment(), TEXT_ALIGN_TOP)
		end
		if (v:GetHeight() + 10 > max_height) then
			max_height = v:GetHeight() + 10
		end
		cumulative = cumulative + self.Table.ColumnWidths[i]
	end
	if (h ~= max_height) then
		self:SetTall(max_height)
	end
end

function PANEL:OnMouseReleased(key_code)
	if (key_code == MOUSE_LEFT) then
		self.Table.SelectedRow = self.RowIndex
		if (self.Table.OnRowClicked) then
			self.Table:OnRowClicked(self, self.CurrentHoveredColumn)
		end
	elseif (key_code == MOUSE_RIGHT) then
		if (self.Table.OnRowRightClicked) then
			self.Table:OnRowRightClicked(self, self.CurrentHoveredColumn)
		end
	end
end

function PANEL:OnCursorMoved(x)
	if (not self.Table.OnColumnHovered) then return end
	local cumulative_width = 0
	local hovered_column = nil
	for i,v in pairs(self.Table.ColumnWidths) do
		if (x >= cumulative_width) then
			hovered_column = i
		else
			break
		end
		cumulative_width = cumulative_width + v
	end
	if (self.CurrentHoveredColumn ~= hovered_column) then
		self.CurrentHoveredColumn = hovered_column
		self.Table:OnColumnHovered(self, hovered_column)
	end
end
function PANEL:OnCursorExited()
	if (not self.Table.OnColumnHovered) then return end
	self.CurrentHoveredColumn = nil
	self.Table:OnColumnHovered(self, nil)
end

function PANEL:SetIcon(path)
	self:SetMaterial(Material(path))
end
function PANEL:SetMaterial(mat)
	self.Table.IconLayout = true
	self.Table.ColumnContainer:DockPadding(16 + 10,0,0,0)
	self.Table.RowContainer:DockPadding(16 + 10,0,0,0)
	if (not IsValid(self.Icon)) then
		self.Icon = vgui.Create("DImage", self)
		self.Icon:SetSize(16,16)
		self.Icon:AlignLeft(5)
		self.Icon:CenterVertical()
	end
	self.Icon:SetMaterial(mat)
end

derma.DefineControl("bVGUI.Table_Row", nil, PANEL, "DPanel")
--PATH lua/vgui/dnumpadmulti.lua:
/*   _                                
    ()                               
   _| |   __   _ __   ___ ___     _ _ 
 /'_` | /'__`\('__)/' _ ` _ `\ /'_`)
((_| |(___/| |   | () () |((_| |
`\__,_)`\____)(_)   (_) (_) (_)`\__,_) 

	DNumPad
	
	A loverly multi-use numpad. Now can remember more then once key!

*/
 
local KP_PERIOD = 10
local KP_ENTER  = 11
local KP_PLUS   = 12
local KP_MINUS  = 13
local KP_STAR   = 14
local KP_DIV    = 15

local PANEL = {}

function PANEL:Init()
	self.Buttons = {}
	
	for i = 0, 15 do
		self.Buttons[i] = vgui.Create("DButton", self)
		self.Buttons[i]:SetText(i)
		self.Buttons[i].DoClick = function(btn) self:OnButtonPressed(btn, i) end
		self.Buttons[i].LastToggle = 0
	end
	
	self.Buttons[KP_PERIOD]:SetText(".")
	self.Buttons[KP_ENTER]:SetText("")
	self.Buttons[KP_PLUS]:SetText("+")
	self.Buttons[KP_MINUS]:SetText("-")
	self.Buttons[KP_STAR]:SetText("*")
	self.Buttons[KP_DIV]:SetText("/")
	
	self.Buttons[0]:SetContentAlignment(4)
	self.Buttons[0]:SetTextInset(6,0)
	
	self.m_KeyFlags = 0
end

function PANEL:Thinkz()
	for k, v in ipairs(self.Buttons) do
		if v.Hovered then -- it's highlighted
			-- But don't bother because I'm chopping that feature (minor one) due to time restraints
		end
	end
end

function PANEL:OnButtonPressed(pButton, iButtonNumber)
	pButton.WasSelectedActive = not pButton.WasSelectedActive
	
	pButton:SetSelected(pButton.WasSelectedActive)
	
	local hackz = (pButton.WasSelectedActive and self:AddKeyFlag(iButtonNumber, pButton) or self:RemoveKeyFlag(iButtonNumber, pButton))
end

function PANEL:PerformLayout()
	local ButtonSize = 17
	local Padding = 4
	
	self:SetSize(ButtonSize * 4 + Padding * 2, ButtonSize * 5 + Padding * 2)
	
	self.Buttons[0]:SetSize(ButtonSize * 2, ButtonSize)
	self.Buttons[0]:AlignBottom(Padding)
	self.Buttons[0]:AlignLeft(Padding)
	self.Buttons[KP_PERIOD]:CopyBounds(self.Buttons[0])
	self.Buttons[KP_PERIOD]:SetSize(ButtonSize, ButtonSize)
	self.Buttons[KP_PERIOD]:MoveRightOf(self.Buttons[0])
	
	self.Buttons[1]:SetSize(ButtonSize, ButtonSize)	
	self.Buttons[1]:AlignLeft(Padding)
	self.Buttons[1]:MoveAbove(self.Buttons[ 0 ])
	self.Buttons[2]:CopyBounds(self.Buttons[1])
	self.Buttons[2]:MoveRightOf(self.Buttons[1])
	self.Buttons[3]:CopyBounds(self.Buttons[2])
	self.Buttons[3]:MoveRightOf(self.Buttons[2])
	
	self.Buttons[KP_ENTER]:SetSize(ButtonSize, ButtonSize*2)
	self.Buttons[KP_ENTER]:AlignBottom(Padding)
	self.Buttons[KP_ENTER]:AlignRight(Padding)

	self.Buttons[KP_PLUS]:CopyBounds(self.Buttons[KP_ENTER])
	self.Buttons[KP_PLUS]:MoveAbove(self.Buttons[KP_ENTER])
	
	self.Buttons[KP_MINUS]:CopyBounds(self.Buttons[KP_PLUS])
	self.Buttons[KP_MINUS]:SetSize(ButtonSize, ButtonSize)
	self.Buttons[KP_MINUS]:MoveAbove(self.Buttons[KP_PLUS])
	
	self.Buttons[KP_STAR]:CopyBounds(self.Buttons[KP_MINUS])
	self.Buttons[KP_STAR]:MoveLeftOf(self.Buttons[KP_MINUS])
	
	self.Buttons[KP_DIV]:CopyBounds(self.Buttons[KP_STAR])
	self.Buttons[KP_DIV]:MoveLeftOf(self.Buttons[KP_STAR])
	
	self.Buttons[4]:CopyBounds(self.Buttons[1])
	self.Buttons[4]:MoveAbove(self.Buttons[1])
	self.Buttons[5]:CopyBounds(self.Buttons[4])
	self.Buttons[5]:MoveRightOf(self.Buttons[4])
	self.Buttons[6]:CopyBounds(self.Buttons[5])
	self.Buttons[6]:MoveRightOf(self.Buttons[5])
	
	self.Buttons[7]:CopyBounds(self.Buttons[4])
	self.Buttons[7]:MoveAbove(self.Buttons[4])
	self.Buttons[8]:CopyBounds(self.Buttons[7])
	self.Buttons[8]:MoveRightOf(self.Buttons[7])
	self.Buttons[9]:CopyBounds(self.Buttons[8])
	self.Buttons[9]:MoveRightOf(self.Buttons[8])
end

function PANEL:AddKeyFlag(key_val, pButton)
	local bin_flag = 2 ^ key_val
	print("Add")
	print("Key: ", key_val, "; Flag: ", bin_flag)
	print(self.m_KeyFlags and bin_flag) 
	pButton.LastToggle = CurTime() + .1 -- hackz
	print("---")
	
	if (self.m_KeyFlags and bin_flag) ~= bin_flag then
		self.m_KeyFlags = self.m_KeyFlags + bin_flag
		
		self:UpdateConVar()
	end
end

function PANEL:RemoveKeyFlag(key_val, pButton)
	local bin_flag = 2 ^ key_val
	print(pButton.LastToggle)
	print(CurTime())
	if pButton.LastToggle > CurTime() then return end
	print("Remove")
	print("Key: ", key_val, "; Flag: ", bin_flag)
	print(self.m_KeyFlags and bin_flag)
	
	
	print("---")
	--debug.Trace()
	if (self.m_KeyFlags and bin_flag) == bin_flag then
		self.m_KeyFlags = self.m_KeyFlags - bin_flag
		
		self:UpdateConVar()
	end
end

function PANEL:SetConVar(cvar_name)
	self.m_CVarName = cvar_name
end

function PANEL:UpdateConVar()
	if self.m_CVarName then
		print("Update: ", self.m_KeyFlags)
		RunConsoleCommand(self.m_CVarName, self.m_KeyFlags)
		print("---")
	end
end

function PANEL:Clear()
	for i = 1, 15 do
		if self.Buttons[i].WasSelectedActive then
			self.Buttons[i]:DoClick()
		end
	end
end

function PANEL:SetupKeys(data)
	self:Clear()
	
	for k, _ in pairs(data) do
		self.Buttons[k]:DoClick() -- ?
		print("Setting ", k, "...\n")
	end
end

function PANEL:SetValue(iNumValue)
end

function PANEL:SetKeySlider(slider)
	-- Nevermind...
end

function PANEL:GetValue()
	return self.m_KeyFlags
end

vgui.Register("DNumPadMulti", PANEL, "DPanel")



--PATH addons/gmodadminsuite-logging-2.4.8/lua/vgui/gas_logging_advanced_search_item.lua:
local function L(phrase, ...)
	if (#({...}) == 0) then
		return GAS:Phrase(phrase, "logging")
	else
		return GAS:PhraseFormat(phrase, "logging", ...)
	end
end

local PANEL = {}

function PANEL:Init()
	self:SetMouseInputEnabled(true)
	self:SetCursor("hand")
	self:Dock(TOP)
	self:SetTall(32 + 3 + 3)
	self:DockPadding(3,3,3,3)
	self:DockMargin(0,0,0,5)

	self.Color = Color(255,255,255)

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
	self.Label:Dock(FILL)
	self.Label:SetContentAlignment(5)
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:DockMargin(5,0,5,0)
end

function PANEL:SetAccountID(account_id)
	local steamid64 = GAS:AccountIDToSteamID64(account_id)

	self.AccountID = account_id

	self.AvatarImage = vgui.Create("AvatarImage", self)
	self.AvatarImage:SetMouseInputEnabled(false)
	self.AvatarImage:Dock(LEFT)
	self.AvatarImage:SetSize(32,32)
	self.AvatarImage:SetSteamID(steamid64, 32)
	self.Label:SetContentAlignment(4)

	self:UpdateTooltip()
end

function PANEL:SetColor(col)
	self.Color = col
end

function PANEL:SetTextColor(col)
	self.Label:SetTextColor(col)
	self:UpdateTooltip()
end

function PANEL:SetValue(val)
	self.Value = val
	self.Label:SetText(val)
	self:UpdateTooltip()
end

function PANEL:SetText(text)
	self.Label:SetText(text)
	self:UpdateTooltip()
end

function PANEL:GetValue()
	return self.Value
end

function PANEL:UpdateTooltip()
	if (self.AccountID ~= nil) then
		bVGUI.UnattachTooltip(self)
		bVGUI.PlayerTooltip.Attach(self, {
			account_id = self.AccountID,
			creator = self,
			focustip = L"right_click_to_focus",
		})
	else
		bVGUI.AttachTooltip(self, {
			Text = self.Label:GetText(),
			TextColor = self.Label:GetTextColor()
		})
	end
end

function PANEL:OnMouseReleased(m)
	if (m == MOUSE_LEFT) then
		GAS:PlaySound("delete")
		self:GetParent():RemoveItem(self)
	elseif (m == MOUSE_RIGHT and self.AccountID ~= nil) then
		bVGUI.PlayerTooltip.Focus()
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(bVGUI.COLOR_DARK_GREY)
	surface.DrawRect(0,0,w,h)

	surface.SetDrawColor(self.Color)
	for i=0,2 do
		surface.DrawOutlinedRect(i,i,w - (i * 2),h - (i * 2))
	end
end

derma.DefineControl("GAS.Logging.AdvancedSearchItem", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/openpermissions_tree.lua:
local PANEL = {}

AccessorFunc( PANEL, "m_bShowIcons", "ShowIcons" )
AccessorFunc( PANEL, "m_iIndentSize", "IndentSize" )
AccessorFunc( PANEL, "m_iLineHeight", "LineHeight" )
AccessorFunc( PANEL, "m_pSelectedItem", "SelectedItem" )
AccessorFunc( PANEL, "m_bClickOnDragHover", "ClickOnDragHover" )

function PANEL:Init()

	self:SetShowIcons( true )
	self:SetIndentSize( 14 )
	self:SetLineHeight( 17 )

	self.RootNode = self:GetCanvas():Add( "DTree_Node" )
	self.RootNode:SetRoot( self )
	self.RootNode:SetParentNode( self )
	self.RootNode:Dock( TOP )
	self.RootNode:SetText( "" )
	self.RootNode:SetExpanded( true, true )
	self.RootNode:DockMargin( 0, 4, 0, 0 )

	self:SetPaintBackground( true )

end

function PANEL:Root()
	return self.RootNode
end

function PANEL:AddNode( strName, strIcon )

	return self.RootNode:AddNode( strName, strIcon )

end

function PANEL:ChildExpanded( bExpand )

	self:InvalidateLayout()

end

function PANEL:ShowIcons()

	return self.m_bShowIcons

end

function PANEL:ExpandTo( bExpand )
end

function PANEL:SetExpanded( bExpand )
end

function PANEL:Clear()
	self:Root():Clear()
end

function PANEL:Paint( w, h )

	derma.SkinHook( "Paint", "Tree", self, w, h )
	return true

end

function PANEL:DoClick( node )
	return false
end

function PANEL:DoRightClick( node )
	return false
end

function PANEL:SetSelectedItem( node )

	if ( IsValid( self.m_pSelectedItem ) ) then
		self.m_pSelectedItem:SetSelected( false )
	end

	self.m_pSelectedItem = node

	if ( node ) then
		node:SetSelected( true )
		node:OnNodeSelected( node )
	end

end

function PANEL:OnNodeSelected( node )
end

function PANEL:MoveChildTo( child, pos )

	self:InsertAtTop( child )

end

function PANEL:LayoutTree()

	self:InvalidateChildren( true )

end

derma.DefineControl("OpenPermissions.Tree", nil, PANEL, "OpenPermissions.ScrollPanel")
--PATH gamemodes/mangarp/gamemode/cl_init.lua:
hook.Run("DarkRPStartedLoading")

GM.Version = "2.7.0"
GM.Name = "MangaRP"
GM.Author = "By FPtje Falco et al."

DeriveGamemode("sandbox")
DEFINE_BASECLASS("gamemode_sandbox")
GM.Sandbox = BaseClass


local function LoadModules()
    local root = GM.FolderName .. "/gamemode/modules/"
    local _, folders = file.Find(root .. "*", "LUA")

    for _, folder in SortedPairs(folders, true) do
        if DarkRP.disabledDefaults["modules"][folder] then continue end

        for _, File in SortedPairs(file.Find(root .. folder .. "/sh_*.lua", "LUA"), true) do
            if File == "sh_interface.lua" then continue end
            include(root .. folder .. "/" .. File)
        end

        for _, File in SortedPairs(file.Find(root .. folder .. "/cl_*.lua", "LUA"), true) do
            if File == "cl_interface.lua" then continue end
            include(root .. folder .. "/" .. File)
        end
    end
end

GM.Config = {} -- config table
GM.NoLicense = GM.NoLicense or {}

include("config/config.lua")
include("libraries/sh_cami.lua")
include("libraries/simplerr.lua")
include("libraries/fn.lua")
include("libraries/tablecheck.lua")
include("libraries/interfaceloader.lua")
include("libraries/disjointset.lua")

include("libraries/modificationloader.lua")

hook.Call("DarkRPPreLoadModules", GM)

LoadModules()

DarkRP.DARKRP_LOADING = true
include("config/jobrelated.lua")
include("config/addentities.lua")
include("config/ammotypes.lua")
DarkRP.DARKRP_LOADING = nil

DarkRP.finish()

hook.Call("DarkRPFinishedLoading", GM)

--PATH gamemodes/mangarp/gamemode/modules/medic/sh_interface.lua:
DarkRP.PLAYER.isMedic = DarkRP.stub{
    name = "isMedic",
    description = "Whether this player is a medic.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a medic.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

--PATH gamemodes/mangarp/gamemode/modules/hungermod/sh_interface.lua:
DarkRP.createFood = DarkRP.stub{
    name = "createFood",
    description = "Create food for DarkRP.",
    parameters = {
        {
            name = "name",
            description = "The name of the food.",
            type = "string",
            optional = false
        },
        {
            name = "tbl",
            description = "Table containing the information for the food.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}
AddFoodItem = DarkRP.createFood

DarkRP.removeFoodItem = DarkRP.stub{
    name = "removeFoodItem",
    description = "Remove a food item from DarkRP. NOTE: Must be called from BOTH server AND client to properly get it removed!",
    parameters = {
        {
            name = "i",
            description = "The index of the item.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "onFoodItemRemoved",
    description = "Called when a food item is removed.",
    parameters = {
        {
            name = "num",
            description = "The index of this item.",
            type = "number"
        },
        {
            name = "itemTable",
            description = "The table containing all the info about this item.",
            type = "table"
        }
    },
    returns = {
    }
}

DarkRP.PLAYER.isCook = DarkRP.stub{
    name = "isCook",
    description = "Whether this player is a cook. This function is only available if hungermod is enabled.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a cook.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.getFoodItems = DarkRP.stub{
    name = "getFoodItems",
    description = "Get all food items.",
    parameters = {

    },
    returns = {
        {
            name = "set",
            description = "Table with food items.",
            type = "table"
        }
    },
    metatable = DarkRP
}

--PATH gamemodes/mangarp/gamemode/modules/f4menu/cl_interface.lua:
DarkRP.openF4Menu = DarkRP.stub{
    name = "openF4Menu",
    description = "Open the F4 menu.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.closeF4Menu = DarkRP.stub{
    name = "closeF4Menu",
    description = "Close the F4 menu if it's open.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.toggleF4Menu = DarkRP.stub{
    name = "toggleF4Menu",
    description = "Toggle the state of the F4 menu (open or closed).",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getF4MenuPanel = DarkRP.stub{
    name = "getF4MenuPanel",
    description = "Get the F4 menu panel.",
    parameters = {
    },
    returns = {
        {
            name = "panel",
            description = "The F4 menu panel. It will be invalid until the F4 menu has been opened.",
            type = "Panel",
            optional = false
        }
    },
    metatable = DarkRP
}

DarkRP.addF4MenuTab = DarkRP.stub{
    name = "addF4MenuTab",
    description = "Add a tab to the F4 menu.",
    parameters = {
        {
            name = "name",
            description = "The title of the tab.",
            type = "string",
            optional = false
        },
        {
            name = "panel",
            description = "The panel of the tab.",
            type = "Panel",
            optional = false
        }
    },
    returns = {
        {
            name = "index",
            description = "The index of the tab in the menu. This is the number you use for the tab in DarkRP.switchTabOrder.",
            type = "number"
        },
        {
            name = "sheet",
            description = "The tab sheet.",
            type = "Panel"
        }
    },
    metatable = DarkRP
}

DarkRP.removeF4MenuTab = DarkRP.stub{
    name = "removeF4MenuTab",
    description = "Remove a tab from the F4 menu by name.",
    parameters = {
        {
            name = "name",
            description = "The name of the tab it should remove.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.switchTabOrder = DarkRP.stub{
    name = "switchTabOrder",
    description = "Switch the order of two tabs.",
    parameters = {
        {
            name = "firstTab",
            description = "The number of the first tab (if it's the second tab, then this number is 2).",
            type = "number",
            optional = false
        },
        {
            name = "secondTab",
            description = "The number of the second tab.",
            type = "number",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "F4MenuTabs",
    description = "Called when tabs are generated. Add and remove tabs in this hook.",
    parameters = {
    },
    returns = {
    }
}

--PATH gamemodes/mangarp/gamemode/modules/language/sh_language.lua:
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
    rp_languages[lang] = rp_languages[lang] or {}
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

    return table.IsEmpty(res) and "No language strings missing!" or table.concat(res, "\n")
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

--PATH gamemodes/mangarp/gamemode/modules/fpp/pp/client/buddies.lua:
FPP = FPP or {}

--Make buddies if not there
sql.Query("CREATE TABLE IF NOT EXISTS FPP_Buddies('steamid' TEXT NOT NULL, 'name' TEXT NOT NULL, 'physgun' INTEGER NOT NULL, 'gravgun' INTEGER NOT NULL, 'toolgun' INTEGER NOT NULL, 'playeruse' INTEGER NOT NULL, 'entitydamage' INTEGER NOT NULL, PRIMARY KEY('steamid'));")

FPP.Buddies = {}
function FPP.LoadBuddies()
    local data = sql.Query("SELECT * FROM FPP_Buddies")
    for _, v in ipairs(data or {}) do
        FPP.Buddies[v.steamid] = {name = v.name, physgun = v.physgun, gravgun = v.gravgun, toolgun = v.toolgun, playeruse = v.playeruse, entitydamage = v.entitydamage} --Put all the buddies in the table
        for _, ply in ipairs(player.GetAll()) do --If the buddies are in the server then add them serverside
            if ply:SteamID() == v.steamid then
                -- update the name
                sql.Query("UPDATE FPP_Buddies SET name = " .. sql.SQLStr(ply:Nick()) .. " WHERE steamid = " .. sql.SQLStr(v.steamid) .. ";")
                FPP.Buddies[v.steamid].name = ply:Nick()
                RunConsoleCommand("FPP_SetBuddy", ply:UserID(), v.physgun, v.gravgun, v.toolgun, v.playeruse, v.entitydamage)
            end
        end
    end
end
hook.Add("InitPostEntity", "FPP_Start", FPP.LoadBuddies)

function FPP.SaveBuddy(SteamID, Name, Type, value)
    if Type == "remove" then
        FPP.Buddies[SteamID] = nil
        sql.Query("DELETE FROM FPP_Buddies WHERE steamid = " .. sql.SQLStr(SteamID) .. ";")
        for _, v in ipairs(player.GetAll()) do
            if v:SteamID() == SteamID then
                RunConsoleCommand("FPP_SetBuddy", v:UserID(), "0", "0", "0", "0", "0")
            end
        end
        return
    end

    FPP.Buddies[SteamID] = FPP.Buddies[SteamID] or {name = Name, physgun = 0, gravgun = 0, toolgun = 0, playeruse = 0, entitydamage = 0} -- Create if not there
    FPP.Buddies[SteamID][Type] = value

    local data = sql.Query("SELECT * FROM FPP_Buddies WHERE steamid = " .. sql.SQLStr(SteamID) .. ";")
    if data then
        sql.Query("UPDATE FPP_Buddies SET " .. Type .. " = " .. value .. " WHERE steamid = " .. sql.SQLStr(SteamID) .. ";")
        -- Oi! update the name!
        sql.Query("UPDATE FPP_Buddies SET name = " .. sql.SQLStr(Name) .. " WHERE steamid = " .. sql.SQLStr(SteamID) .. ";")
        FPP.Buddies[SteamID].name = Name
    else
        sql.Query("INSERT INTO FPP_Buddies VALUES(" .. sql.SQLStr(SteamID) .. ", " .. sql.SQLStr(Name) .. ", " .. FPP.Buddies[SteamID].physgun .. ", " .. FPP.Buddies[SteamID].gravgun .. ", " .. FPP.Buddies[SteamID].toolgun .. ", " .. FPP.Buddies[SteamID].playeruse .. ", " .. FPP.Buddies[SteamID].entitydamage .. ");")
    end

    --Let the server know of your changes
    for _, v in ipairs(player.GetAll()) do
        if v:SteamID() == SteamID then -- If the person you're adding is in the server then add him serverside
            RunConsoleCommand("FPP_SetBuddy", v:UserID(), FPP.Buddies[SteamID].physgun, FPP.Buddies[SteamID].gravgun, FPP.Buddies[SteamID].toolgun, FPP.Buddies[SteamID].playeruse, FPP.Buddies[SteamID].entitydamage)
            --Don't break because there can be people(bots actually) with the same steam ID
        end
    end

    local ShouldRemove = true -- Remove the buddy if he isn't buddy in anything anymore
    for _, v in pairs(FPP.Buddies[SteamID]) do
        if v == 1 or v == "1" then
            ShouldRemove = false
            break
        end
    end

    if ShouldRemove then -- If everything = 0 then he's not your friend anymore
        FPP.Buddies[SteamID] = nil
        sql.Query("DELETE FROM FPP_Buddies WHERE steamid = " .. sql.SQLStr(SteamID) .. ";")
        for _, v in ipairs(player.GetAll()) do
            if v:SteamID() == SteamID then
                RunConsoleCommand("FPP_SetBuddy", v:UserID(), "0", "0", "0", "0", "0")
            end
        end
    end
end

function FPP.NewBuddy(um)
    local ply = um:ReadEntity()

    if not IsValid(ply) or not ply:IsPlayer() then return end
    local SteamID = ply:SteamID()

    local data = sql.Query("SELECT * FROM FPP_Buddies")
    for _, v in ipairs(data or {}) do
        -- make the player buddy if they're in your buddies list
        if v.steamid ~= SteamID then continue end

        RunConsoleCommand("FPP_SetBuddy", ply:UserID(), v.physgun, v.gravgun, v.toolgun, v.playeruse, v.entitydamage)
        -- update the name
        sql.Query("UPDATE FPP_Buddies SET name = " .. sql.SQLStr(ply:Nick()) .. " WHERE steamid = " .. sql.SQLStr(SteamID) .. ";")
        FPP.Buddies[SteamID] = FPP.Buddies[SteamID] or {}
        FPP.Buddies[SteamID].name = ply:Nick()
    end
end
usermessage.Hook("FPP_CheckBuddy", FPP.NewBuddy)

--PATH gamemodes/mangarp/gamemode/modules/fadmin/sh_fadmin_darkrp.lua:
FAdmin = FAdmin or {}

FAdmin.PlayerActions = FAdmin.PlayerActions or {}
FAdmin.StartHooks = FAdmin.StartHooks or {}

--[[

Utilities!

]]
function FAdmin.FindPlayer(info)
    if not info then return nil end
    local pls = player.GetAll()
    local found = {}

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
            end
            continue
        end

        for _, v in ipairs(pls) do
            -- Find by Steam ID
            if (PlayerInfo == v:SteamID() or v:SteamID() == "UNKNOWN") and not found[v] then
                found[v] = true
            end

            -- Find by Partial Nick
            if string.find(string.lower(v:Nick()), string.lower(tostring(PlayerInfo)), 1, true) ~= nil and not found[v] then
                found[v] = true
            end

            if v.SteamName and string.find(string.lower(v:SteamName()), string.lower(tostring(PlayerInfo)), 1, true) ~= nil and not found[v] then
                found[v] = true
            end
        end
    end

    local players = {}
    local empty = true
    for k in pairs(found or {}) do
        empty = false
        table.insert(players, k)
    end
    return not empty and players or nil
end

function FAdmin.SteamToProfile(ply) -- Thanks decodaman
    return "https://steamcommunity.com/profiles/" .. (ply:SteamID64() or "BOT")
end

--[[
    FAdmin global settings
]]
FAdmin.GlobalSetting = FAdmin.GlobalSetting or {}


--[[Dependency solver:
    Many plugins are dependant of one another.
    To prevent plugins calling functions from other plugins that haven't been opened yet
    there will be a hook that is called when all plugins are loaded.
    This way there will be no hassle with which plugin loads first, which one next etc.
]]
timer.Simple(0, function()
    for k in pairs(FAdmin.StartHooks) do if not isstring(k) then FAdmin.StartHooks[k] = nil end end
    for _, v in SortedPairs(FAdmin.StartHooks) do
        v()
    end
end)

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/serversettings/cl_init.lua:
local function SetLimits()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("Set Limits")
    frame:SetSize(300, 460)
    frame:Center()
    frame:SetVisible(true)
    frame:MakePopup()

    local PanelList = vgui.Create("DPanelList", frame)
    PanelList:StretchToParent(5, 25, 5, 5)
    PanelList:EnableVerticalScrollbar(true)

    local Form = vgui.Create("DForm", PanelList)
    Form:SetName("")

    local Settings = util.KeyValuesToTable(file.Read("gamemodes/sandbox/sandbox.txt", "GAME")) -- All SBox limits are in here :D
    for _, v in SortedPairs(Settings.settings or {}) do
        if v.type == "Numeric" then
            local left, _ = Form:NumberWang(v.text, nil, v.low or 0, v.high or 1000, v.decimals or 0)
            left:SetFloatValue(GetConVar(v.name):GetFloat())
            left:SetValue(GetConVar(v.name):GetFloat())

            function left:OnValueChanged(val)
                if val == GetConVar(v.name):GetFloat() then
                    return
                end
                RunConsoleCommand("_FAdmin", "ServerSetting", v.name, val)
            end
        end
    end
    PanelList:AddItem(Form)
end

FAdmin.StartHooks["ServerSettings"] = function()
    FAdmin.Access.AddPrivilege("ServerSetting", 2)

    local sbox_godmode = GetConVar("sbox_godmode")
    FAdmin.ScoreBoard.Server:AddServerSetting(function() return (sbox_godmode:GetBool() and "Disable" or "Enable") .. " global god mode" end,
    function() return "fadmin/icons/god", sbox_godmode:GetBool() and "fadmin/icons/disable" end,
    Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function(button)
        local val = sbox_godmode:GetBool()

        button:SetImage2((not val and "fadmin/icons/disable") or "null")
        button:SetText((not val and "Disable" or "Enable") .. " global god mode")
        button:GetParent():InvalidateLayout()

        RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_godmode", val and 0 or 1)
    end)

    local sbox_playershurtplayers = GetConVar("sbox_playershurtplayers")
    FAdmin.ScoreBoard.Server:AddServerSetting(function() return (sbox_playershurtplayers:GetBool() and "Disable" or "Enable") .. " player vs player damage" end,
    function() return "fadmin/icons/weapon", sbox_playershurtplayers:GetBool() and "fadmin/icons/disable" end,
    Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function(button)
        local val = sbox_playershurtplayers:GetBool()

        button:SetImage2(not val and "fadmin/icons/disable" or "null")
        button:SetText((not val and "Disable" or "Enable") .. " player vs player damage")
        button:GetParent():InvalidateLayout()

        RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_playershurtplayers", val and 0 or 1)
    end)

    local sbox_noclip = GetConVar("sbox_noclip")
    FAdmin.ScoreBoard.Server:AddServerSetting(function() return (sbox_noclip:GetBool() and "Disable" or "Enable") .. " global noclip" end,
    function() return "fadmin/icons/noclip", sbox_noclip:GetBool() and "fadmin/icons/disable" end,
    Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function(button)
        local val = sbox_noclip:GetBool()

        button:SetImage2(not val and "fadmin/icons/disable" or "null")
        button:SetText((not val and "Disable" or "Enable") .. " global noclip")
        button:GetParent():InvalidateLayout()

        RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_noclip", val and 0 or 1)
    end)


    FAdmin.ScoreBoard.Server:AddServerSetting("Set server limits", "fadmin/icons/serversetting", Color(0, 0, 155, 255), true, SetLimits)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/messaging/cl_init.lua:
local showChat = CreateClientConVar("FAdmin_ShowChatNotifications", 1, true, false)

local HUDNote_c = 0
local HUDNote_i = 1
local HUDNotes = {}

--Notify ripped off the Sandbox notify, changed to my likings
function FAdmin.Messages.AddMessage(MsgType, Message)
    local tab = {}
    tab.text    = Message
    tab.recv    = SysTime()
    tab.velx    = 0
    tab.vely    = -5
    surface.SetFont("GModNotify")
    local w, _  = surface.GetTextSize(Message)
    tab.x       = ScrW() / 2 + w * 0.5 + (ScrW() / 20)
    tab.y       = ScrH()
    tab.a       = 255
    local MsgTypeNames = {"ERROR", "NOTIFY", "QUESTION", "GOOD", "BAD"}
    if not MsgTypeNames[MsgType] then return end
    tab.col = FAdmin.Messages.MsgTypes[MsgTypeNames[MsgType]].COLOR

    table.insert(HUDNotes, tab)

    HUDNote_c = HUDNote_c + 1
    HUDNote_i = HUDNote_i + 1

    LocalPlayer():EmitSound("npc/turret_floor/click1.wav", 30, 100)
end

usermessage.Hook("FAdmin_SendMessage", function(u) FAdmin.Messages.AddMessage(u:ReadShort(), u:ReadString()) end)


local function DrawNotice(k, v, i)
    local H = ScrH() / 1024
    local x = v.x - 75 * H
    local y = v.y - 27
    surface.SetFont("GModNotify")
    local w, h = surface.GetTextSize(v.text)
    h = h + 16
    local col = v.col

    draw.RoundedBox(4, x - w - h + 24, y - 8, w + h - 16, h, col)
    -- Draw Icon
    surface.SetDrawColor(255, 255, 255, v.a)

    draw.DrawNonParsedSimpleText(v.text, "GModNotify", x + 1, y + 1, Color(0, 0, 0, v.a * 0.8), TEXT_ALIGN_RIGHT)
    draw.DrawNonParsedSimpleText(v.text, "GModNotify", x - 1, y - 1, Color(0, 0, 0, v.a * 0.5), TEXT_ALIGN_RIGHT)
    draw.DrawNonParsedSimpleText(v.text, "GModNotify", x + 1, y - 1, Color(0, 0, 0, v.a * 0.6), TEXT_ALIGN_RIGHT)
    draw.DrawNonParsedSimpleText(v.text, "GModNotify", x - 1, y + 1, Color(0, 0, 0, v.a * 0.6), TEXT_ALIGN_RIGHT)
    draw.DrawNonParsedSimpleText(v.text, "GModNotify", x, y, Color(255, 255, 255, v.a), TEXT_ALIGN_RIGHT)
    local ideal_y = ScrH() - (HUDNote_c - i) * h
    local ideal_x = ScrW() / 2 + w * 0.5 + (ScrW() / 20)
    local timeleft = 6 - (SysTime() - v.recv)

    -- Cartoon style about to go thing
    if (timeleft < 0.8) then
        ideal_x = ScrW() / 2 + w * 0.5 + 200
    end

    -- Gone!
    if (timeleft < 0.5) then
        ideal_y = ScrH() + 50
    end

    local spd = RealFrameTime() * 15
    v.y = v.y + v.vely * spd
    v.x = v.x + v.velx * spd
    local dist = ideal_y - v.y
    v.vely = v.vely + dist * spd * 1

    if (math.abs(dist) < 2 and math.abs(v.vely) < 0.1) then
        v.vely = 0
    end

    dist = ideal_x - v.x
    v.velx = v.velx + dist * spd * 1

    if math.abs(dist) < 2 and math.abs(v.velx) < 0.1 then
        v.velx = 0
    end

    -- Friction.. kind of FPS independant.
    v.velx = v.velx * (0.95 - RealFrameTime() * 8)
    v.vely = v.vely * (0.95 - RealFrameTime() * 8)
end

local function HUDPaint()
    if not HUDNotes then return end
    local i = 0

    for k, v in pairs(HUDNotes) do
        if v ~= 0 then
            i = i + 1
            DrawNotice(k, v, i)
        end
    end

    for k, v in pairs(HUDNotes) do
        if v ~= 0 and v.recv + 6 < SysTime() then
            HUDNotes[k] = 0
            HUDNote_c = HUDNote_c - 1

            if HUDNote_c == 0 then
                HUDNotes = {}
            end
        end
    end
end
hook.Add("HUDPaint", "FAdmin_MessagePaint", HUDPaint)

local function ConsoleMessage(um)
    MsgC(Color(255, 0, 0, 255), "(FAdmin) ", Color(200, 0, 200, 255), um:ReadString() .. "\n")
end
usermessage.Hook("FAdmin_ConsoleMessage", ConsoleMessage)


local red = Color(255, 0, 0)
local white = Color(190, 190, 190)
local brown = Color(102, 51, 0)
local blue = Color(102, 0, 255)

-- Inserts the instigator into a notification message
local function insertInstigator(res, instigator, _)
    table.insert(res, brown)
    table.insert(res, FAdmin.PlayerName(instigator))
end

-- Inserts the targets into the notification message
local function insertTargets(res, _, targets)
    table.insert(res, blue)
    table.insert(res, FAdmin.TargetsToString(targets))
end

local modMessage = {
    instigator = insertInstigator,
    you = function(res) table.insert(res, brown) table.insert(res, "you") end,
    targets = insertTargets,
}
local function showNotification(notification, instigator, targets, extraInfo)
    local res = {red, "[", white, "FAdmin", red, "] "}

    for _, text in pairs(notification.message) do
        if modMessage[text] then modMessage[text](res, instigator, targets) continue end

        if string.sub(text, 1, 10) == "extraInfo." then
            local id = tonumber(string.sub(text, 11))

            table.insert(res, notification.extraInfoColors and notification.extraInfoColors[id] or white)
            table.insert(res, extraInfo[id])
            continue
        end

        table.insert(res, white)
        table.insert(res, text)
    end

    if showChat:GetBool() then
        chat.AddText(unpack(res))
    else
        local msgTbl = {}
        for i = 8, #res, 2 do table.insert(msgTbl, res[i]) end

        FAdmin.Messages.AddMessage(FAdmin.Messages.MsgTypesByName[notification.msgType], table.concat(msgTbl, ""))

        MsgC(unpack(res))
        Msg("\n")
    end
end

local function receiveNotification()
    local id = net.ReadUInt(16)
    local notification = FAdmin.Notifications[id]
    local instigator = net.ReadEntity()

    local targets = {}

    if notification.hasTarget then
        local targetCount = net.ReadUInt(8)
        for i = 1, targetCount do
            table.insert(targets, net.ReadEntity())
        end
    end

    local extraInfo = notification.readExtraInfo and notification.readExtraInfo()

    showNotification(notification, instigator, targets, extraInfo)
end
net.Receive("FAdmin_Notification", receiveNotification)

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/commands/cl_chatcommands.lua:
local Options = {}
local targets
local colorBackground = Color(0, 0, 0, 200)
local colorHighlight = Color(255, 125, 0, 200)
hook.Add("ChatTextChanged", "FAdmin_Chat_autocomplete", function(text)
    if not FAdmin.GlobalSetting.FAdmin then return end
    Options = {}
    local prefix = GetGlobalString("FAdmin_commandprefix")
    prefix = prefix ~= '' and prefix or '/'

    if string.sub(text, 1, 1) ~= prefix then targets = nil return end

    local TExplode = string.Explode(" ", string.sub(text, 2))
    if not TExplode[1] then return end
    local Command = string.lower(TExplode[1])
    local Args = table.Copy(TExplode)
    Args[1] = nil
    Args = table.ClearKeys(Args)


    local optionsCount = 0
    for k, v in pairs(FAdmin.Commands.List) do
        if string.find(string.lower(k), Command, 1, true) ~= 1 then continue end

        Options[prefix .. k] = table.Copy(v.ExtraArgs)

        optionsCount = optionsCount + 1
    end

    local ChatBoxPosX, ChatBoxPosY = chat.GetChatBoxPos()
    local ChatBoxWidth = chat.GetChatBoxSize() -- Don't need height
    local DidMakeShorter = false
    table.sort(Options)
    local i = 1
    for k in pairs(Options) do
        local Pos = ChatBoxPosY + i * 24
        if Pos + 24 > ScrH() then
            Options[k] = nil
            DidMakeShorter = true
            optionsCount = optionsCount - 1
        end
        i = i + 1
    end

    -- Player arguments
    local firstVal = table.GetFirstValue(Options)
    if optionsCount == 1 and firstVal[#Args] and string.match(firstVal[#Args], ".Player.") then
        local players = {}

        for _, v in pairs(FAdmin.FindPlayer(Args[#Args]) or {}) do
            if not IsValid(v) then continue end
            table.insert(players, v:Nick())
        end

        targets = table.concat(players, ", ")
    end

    local xPos = ChatBoxPosX + ChatBoxWidth + 2
    hook.Add("HUDPaint", "FAdmin_Chat_autocomplete", function()
        local j = 0
        for option, args in pairs(Options) do
            draw.WordBox(4, xPos, ChatBoxPosY + j * 24, option, "UiBold", colorBackground, color_white)

            for k, arg in pairs(args) do
                draw.WordBox(4, xPos + k * 130, ChatBoxPosY + j * 24, arg, "UiBold", colorBackground, color_white)
            end

            j = j + 1
        end

        if targets then
            draw.WordBox(4, xPos, ChatBoxPosY + j * 24, "Targets: " .. targets, "UiBold", colorHighlight, color_white)
        end

        if DidMakeShorter then
            draw.WordBox(4, xPos, ChatBoxPosY + j * 24, "...", "UiBold", colorBackground, color_white)
        end
    end)
end)

hook.Add("FinishChat", "FAdmin_Chat_autocomplete", function() hook.Remove("HUDPaint", "FAdmin_Chat_autocomplete") end)

local plyIndex = 1

hook.Add("OnChatTab", "FAdmin_Chat_autocomplete", function(text)
    if not FAdmin.GlobalSetting.FAdmin then return end

    for command in pairs(Options) do
        if string.find(text, " ") == nil then
            return string.sub(command, 1, string.find(command, " "))
        elseif string.find(text, " ") then
            plyIndex = plyIndex + 1

            if plyIndex > player.GetCount() then
                plyIndex = 1
            end

            return string.sub(command, 1, string.find(command, " ")) .. " " .. string.sub(player.GetAll()[plyIndex]:Nick(), 1, string.find(player.GetAll()[plyIndex]:Nick(), " "))
        end
    end
end)

FAdmin.StartHooks["Chatcommands"] = function()
    FAdmin.ScoreBoard.Server:AddServerSetting("Set FAdmin's chat command prefix", "fadmin/icons/message", Color(0, 0, 155, 255), function(ply) return FAdmin.Access.PlayerHasPrivilege(ply, "ServerSetting") end, function()
        local prefix = GetGlobalString("FAdmin_commandprefix")
        prefix = prefix ~= '' and prefix or '/'
        Derma_StringRequest("Set chat command prefix", "Make sure it's only one character!", prefix, fp{RunConsoleCommand, "_Fadmin", "CommandPrefix"})
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/cl_scoreboardserver.lua:
FAdmin.ScoreBoard.Server.Information = {} -- Compatibility for autoreload
FAdmin.ScoreBoard.Server.ActionButtons = {} -- Refresh server buttons when reloading gamemode

local function MakeServerOptions()
    local _, YPos, Width = 20, FAdmin.ScoreBoard.Y + 120 + FAdmin.ScoreBoard.Height / 5 + 20, (FAdmin.ScoreBoard.Width - 40) / 3

    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat = FAdmin.ScoreBoard.Server.Controls.ServerActionsCat or vgui.Create("FAdminPlayerCatagory")
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetLabel("  Server Actions")
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat.CatagoryColor = Color(155, 0, 0, 255)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetSize(Width-5, FAdmin.ScoreBoard.Height - 20 - YPos)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetPos(FAdmin.ScoreBoard.X + 20, YPos)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetVisible(true)
    function FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:Toggle()
    end

    FAdmin.ScoreBoard.Server.Controls.ServerActions = FAdmin.ScoreBoard.Server.Controls.ServerActions or vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetContents(FAdmin.ScoreBoard.Server.Controls.ServerActions)
    FAdmin.ScoreBoard.Server.Controls.ServerActions:SetTall(FAdmin.ScoreBoard.Height - 20 - YPos)
    for k, v in pairs(FAdmin.ScoreBoard.Server.Controls.ServerActions:GetChildren()) do
        if k == 1 then continue end
        v:Remove()
    end

    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat = FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat or vgui.Create("FAdminPlayerCatagory")
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetLabel("  Player Actions")
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat.CatagoryColor = Color(0, 155, 0, 255)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetSize(Width-5, FAdmin.ScoreBoard.Height - 20 - YPos)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetPos(FAdmin.ScoreBoard.X + 20 + Width, YPos)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetVisible(true)
    function FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:Toggle()
    end

    FAdmin.ScoreBoard.Server.Controls.PlayerActions = FAdmin.ScoreBoard.Server.Controls.PlayerActions or vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetContents(FAdmin.ScoreBoard.Server.Controls.PlayerActions)
    FAdmin.ScoreBoard.Server.Controls.PlayerActions:SetTall(FAdmin.ScoreBoard.Height - 20 - YPos)
    for k, v in pairs(FAdmin.ScoreBoard.Server.Controls.PlayerActions:GetChildren()) do
        if k == 1 then continue end
        v:Remove()
    end

    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat = FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat or vgui.Create("FAdminPlayerCatagory")
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetLabel("  Server Settings")
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat.CatagoryColor = Color(0, 0, 155, 255)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetSize(Width-5, FAdmin.ScoreBoard.Height - 20 - YPos)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetPos(FAdmin.ScoreBoard.X + 20 + Width * 2, YPos)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetVisible(true)
    function FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:Toggle()
    end

    FAdmin.ScoreBoard.Server.Controls.ServerSettings = FAdmin.ScoreBoard.Server.Controls.ServerSettings or vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetContents(FAdmin.ScoreBoard.Server.Controls.ServerSettings)
    FAdmin.ScoreBoard.Server.Controls.ServerSettings:SetTall(FAdmin.ScoreBoard.Height - 20 - YPos)
    for k, v in pairs(FAdmin.ScoreBoard.Server.Controls.ServerSettings:GetChildren()) do
        if k == 1 then continue end
        v:Remove()
    end

    for k, v in ipairs(FAdmin.ScoreBoard.Server.ActionButtons) do
        local visible = v.Visible == true or (isfunction(v.Visible) and v.Visible(LocalPlayer()) == true)

        local ActionButton = vgui.Create("FAdminActionButton")
        local imageType = TypeID(v.Image)
        if imageType == TYPE_STRING then
            ActionButton:SetImage(v.Image or "icon16/exclamation")
        elseif imageType == TYPE_TABLE then
            ActionButton:SetImage(v.Image[1])
            if v.Image[2] then ActionButton:SetImage2(v.Image[2]) end
        elseif imageType == TYPE_FUNCTION then
            local img1, img2 = v.Image()
            ActionButton:SetImage(img1)
            if img2 then ActionButton:SetImage2(img2) end
        else
            ActionButton:SetImage("icon16/exclamation")
        end
        local name = v.Name
        if isfunction(name) then name = name() end
        ActionButton:SetText(DarkRP.deLocalise(name))
        ActionButton:SetBorderColor(visible and v.color or Color(120, 120, 120))
        ActionButton:SetDisabled(not visible)
        ActionButton:Dock(TOP)

        function ActionButton:DoClick()
            return v.Action(self)
        end

        FAdmin.ScoreBoard.Server.Controls[v.TYPE]:Add(ActionButton)
        if v.OnButtonCreated then
            v.OnButtonCreated(ActionButton)
        end
    end
end

function FAdmin.ScoreBoard.Server:AddServerAction(Name, Image, color, Visible, Action, OnButtonCreated)
    table.insert(FAdmin.ScoreBoard.Server.ActionButtons, {TYPE = "ServerActions", Name = Name, Image = Image, color = color, Visible = Visible, Action = Action, OnButtonCreated = OnButtonCreated})
end

function FAdmin.ScoreBoard.Server:AddPlayerAction(Name, Image, color, Visible, Action, OnButtonCreated)
    table.insert(FAdmin.ScoreBoard.Server.ActionButtons, {TYPE = "PlayerActions", Name = Name, Image = Image, color = color, Visible = Visible, Action = Action, OnButtonCreated = OnButtonCreated})
end

function FAdmin.ScoreBoard.Server:AddServerSetting(Name, Image, color, Visible, Action, OnButtonCreated)
    table.insert(FAdmin.ScoreBoard.Server.ActionButtons, {TYPE = "ServerSettings", Name = Name, Image = Image, color = color, Visible = Visible, Action = Action, OnButtonCreated = OnButtonCreated})
end

function FAdmin.ScoreBoard.Server.Show(ply)
    FAdmin.ScoreBoard.Server.InfoPanels = FAdmin.ScoreBoard.Server.InfoPanels or {}
    for k, v in pairs(FAdmin.ScoreBoard.Server.InfoPanels) do
        if IsValid(v) then
            v:Remove()
            FAdmin.ScoreBoard.Server.InfoPanels[k] = nil
        end
    end

    if IsValid(FAdmin.ScoreBoard.Server.Controls.InfoPanel) then
        FAdmin.ScoreBoard.Server.Controls.InfoPanel:Remove()
    end
    FAdmin.ScoreBoard.Server.Controls.InfoPanel = vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.InfoPanel:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 120)
    FAdmin.ScoreBoard.Server.Controls.InfoPanel:SetSize(FAdmin.ScoreBoard.Width - 40, FAdmin.ScoreBoard.Height / 5)
    FAdmin.ScoreBoard.Server.Controls.InfoPanel:SetVisible(true)
    FAdmin.ScoreBoard.Server.Controls.InfoPanel:Clear(true)

    local function AddInfoPanel()
        local pan = vgui.Create("FAdminPanelList")
        pan:SetSize(1, FAdmin.ScoreBoard.Server.Controls.InfoPanel:GetTall())
        pan:Dock(LEFT)
        FAdmin.ScoreBoard.Server.Controls.InfoPanel:Add(pan)

        table.insert(FAdmin.ScoreBoard.Server.InfoPanels, pan)
        return pan
    end

    local SelectedPanel = AddInfoPanel() -- Make first panel to put the first things in

    for _, v in pairs(FAdmin.ScoreBoard.Server.Information) do
        local Text = vgui.Create("DLabel")
        Text:SetFont("TabLarge")
        Text:SetColor(Color(255,255,255,200))
        Text:Dock(TOP)
        Text.Func = v.Func

        local EndText
        local function RefreshText()
            local Value = v.func()

            if not Value or Value == "" then
                Value = "N/A"
            end

            EndText = v.name .. ":  " .. Value
            local strLen = string.len(EndText)

            if strLen > 40 then
                local NewValue = string.sub(EndText, 1, 40)

                for i = 40, strLen, 34 do
                    NewValue = NewValue .. "\n        " .. string.sub(EndText, i + 1, i + 34)
                end

                EndText = NewValue
            else
                local MaxWidth = 240
                surface.SetFont("TabLarge")
                local TextWidth = surface.GetTextSize(v.name .. ": " .. Value)

                if TextWidth <= MaxWidth then
                    local SpacesAmount = (MaxWidth - TextWidth) / 3
                    local Spaces = ""

                    for i = 1, SpacesAmount, 1 do
                        Spaces = Spaces .. " "
                    end

                    EndText = v.name .. ":" .. Spaces .. Value
                end
            end

            Text:SetText(DarkRP.deLocalise(EndText))
            Text:SizeToContents()
            Text:SetTooltip("Click to copy " .. v.name .. " to clipboard")
            Text:SetMouseInputEnabled(true)
        end

        RefreshText()

        function Text:OnMousePressed(mcode)
            self:SetTooltip(v.name .. " copied to clipboard!")
            ChangeTooltip(self)
            SetClipboardText(v.func() or "")
            self:SetTooltip("Click to copy " .. v.name .. " to clipboard")
        end

        timer.Create("FAdmin_Scoreboard_text_update_" .. v.name, 1, 0, function()
            if not IsValid(Text) then
                timer.Remove("FAdmin_Scoreboard_text_update_" .. v.name)
                FAdmin.ScoreBoard.ChangeView("Main")

                return
            end

            RefreshText()
        end)

        if #SelectedPanel:GetChildren() * 17 + 17 >= SelectedPanel:GetTall() or v.NewPanel then
            SelectedPanel = AddInfoPanel()
        end
        -- Add new panel if the last one is full
        SelectedPanel:Add(Text)
        if Text:GetWide() > SelectedPanel:GetWide() then
            SelectedPanel:SetWide(Text:GetWide() + 40)
        end
    end

    MakeServerOptions()
end

function FAdmin.ScoreBoard.Server:AddInformation(name, func, ForceNewPanel) -- ForeNewPanel is to start a new column
    table.insert(FAdmin.ScoreBoard.Server.Information, {name = name, func = func, NewPanel = ForceNewPanel})
end

FAdmin.ScoreBoard.Server:AddInformation("Hostname", GetHostName)
FAdmin.ScoreBoard.Server:AddInformation("Gamemode", function() return GAMEMODE.Name end)
FAdmin.ScoreBoard.Server:AddInformation("Author", function() return GAMEMODE.Author end)
FAdmin.ScoreBoard.Server:AddInformation("Map", game.GetMap)
FAdmin.ScoreBoard.Server:AddInformation("Players", function() return player.GetCount() .. "/" .. game.MaxPlayers() end)
FAdmin.ScoreBoard.Server:AddInformation("Ping", function() return LocalPlayer():Ping() end)


--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/slay/sh_shared.lua:
FAdmin.PlayerActions.SlayTypes = {}
FAdmin.PlayerActions.SlayTypes[1] = "Normal"
FAdmin.PlayerActions.SlayTypes[2] = "Silent"
FAdmin.PlayerActions.SlayTypes[3] = "Explode"
FAdmin.PlayerActions.SlayTypes[4] = "Rocket"

FAdmin.StartHooks["Slaying"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "slay",
        hasTarget = true,
        message = {"instigator", " slayed ", "targets"},
        receivers = "involved+admins",
    }
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/ragdoll/cl_init.lua:
FAdmin.StartHooks["Ragdoll"] = function()
    FAdmin.Access.AddPrivilege("Ragdoll", 2)
    FAdmin.Commands.AddCommand("Ragdoll", nil, "<Player>", "[normal/hang/kick]")
    FAdmin.Commands.AddCommand("UnRagdoll", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        if ply:FAdmin_GetGlobal("fadmin_ragdolled") then return "Unragdoll" end
        return "Ragdoll"
    end,
    function(ply)
        if ply:FAdmin_GetGlobal("fadmin_ragdolled") then return "fadmin/icons/ragdoll", "fadmin/icons/disable" end
        return "fadmin/icons/ragdoll"
    end,
    Color(255, 130, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Ragdoll", ply) end,
    function(ply, button)
        if ply:FAdmin_GetGlobal("fadmin_ragdolled") then
            RunConsoleCommand("_FAdmin", "unragdoll", ply:UserID())
            button:SetImage2("null")
            button:SetText("Ragdoll")
            button:GetParent():InvalidateLayout()
        return end

        local menu = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menu:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Ragdoll Type:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)

        menu:AddPanel(Title)

        for k, v in pairs(FAdmin.PlayerActions.RagdollTypes) do
            if v == "Unragdoll" then continue end
            FAdmin.PlayerActions.addTimeSubmenu(menu, v,
                function()
                    RunConsoleCommand("_FAdmin", "Ragdoll", ply:UserID(), k)
                    button:SetImage2("fadmin/icons/disable")
                    button:SetText("Unragdoll")
                    button:GetParent():InvalidateLayout()
                end,
                function(secs)
                    RunConsoleCommand("_FAdmin", "Ragdoll", ply:UserID(), k, secs)
                    button:SetImage2("fadmin/icons/disable")
                    button:SetText("Unragdoll")
                    button:GetParent():InvalidateLayout()
                end
            )
        end

        menu:Open()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/cppi/sh_cppi.lua:
if CPPI then return end
CPPI = {}
CPPI.CPPI_DEFER = 100100 --\100\100 = dd
CPPI.CPPI_NOTIMPLEMENTED = 7080

function CPPI:GetName()
    return "DarkRP"
end

function CPPI:GetVersion()
    return CPPI.CPPI_NOTIMPLEMENTED
end

function CPPI:GetInterfaceVersion()
    return CPPI.CPPI_NOTIMPLEMENTED
end

function CPPI:GetNameFromUID(uid)
    return CPPI.CPPI_NOTIMPLEMENTED
end

local PLAYER = FindMetaTable("Player")
function PLAYER:CPPIGetFriends()
    return CPPI.CPPI_NOTIMPLEMENTED
end

local ENTITY = FindMetaTable("Entity")
function ENTITY:CPPIGetOwner()
    return NULL, CPPI.CPPI_NOTIMPLEMENTED
end

if SERVER then
    function ENTITY:CPPISetOwner(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPISetOwnerUID(UID)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanTool(ply, tool)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanPhysgun(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanPickup(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanPunt(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end
end

--PATH gamemodes/mangarp/entities/weapons/arrest_stick/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Slot = 1
    SWEP.SlotPos = 3
end

DEFINE_BASECLASS("stick_base")

SWEP.Instructions = "Left click to arrest\nRight click to switch batons"
SWEP.IsDarkRPArrestStick = true

SWEP.PrintName = "Arrest Baton"
SWEP.Spawnable = true
SWEP.Category = "DarkRP (Utility)"

SWEP.StickColor = Color(255, 0, 0)

SWEP.Switched = true

DarkRP.hookStub{
    name = "canArrest",
    description = "Whether someone can arrest another player.",
    parameters = {
        {
            name = "arrester",
            description = "The player trying to arrest someone.",
            type = "Player"
        },
        {
            name = "arrestee",
            description = "The player being arrested.",
            type = "Player"
        }
    },
    returns = {
        {
            name = "canArrest",
            description = "A yes or no as to whether the arrester can arrest the arestee.",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when they can't arrest the player.",
            type = "string"
        }
    },
    realm = "Server"
}

DarkRP.hookStub{
    name = "setArrestStickTime",
    description = "Sets arrest time for an arrest made via the arrest stick",
    parameters = {
        {
            name = "arrest_stick",
            description = "The arrest strick weapon with which the arrestee was arrested.",
            type = "Weapon"
        },
        {
            name = "arrester",
            description = "The player trying to arrest someone.",
            type = "Player"
        },
        {
            name = "arrestee",
            description = "The player being arrested.",
            type = "Player"
        }
    },
    returns = {
        {
            name = "time",
            description = "The time to arrest the player.",
            type = "integer"
        }
    },
    realm = "Server"
}

function SWEP:Deploy()
    self.Switched = true
    return BaseClass.Deploy(self)
end

function SWEP:PrimaryAttack()
    BaseClass.PrimaryAttack(self)

    if CLIENT then return end

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    Owner:LagCompensation(true)
    local trace = util.QuickTrace(Owner:EyePos(), Owner:GetAimVector() * 90, {Owner})
    Owner:LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent.onArrestStickUsed then
        ent:onArrestStickUsed(Owner)
        return
    end

    ent = Owner:getEyeSightHitEntity(nil, nil, function(p) return p ~= Owner and p:IsPlayer() and p:Alive() and p:IsSolid() end)

    local stickRange = self.stickRange * self.stickRange
    if not IsValid(ent) or (Owner:EyePos():DistToSqr(ent:GetPos()) > stickRange) or not ent:IsPlayer() then
        return
    end

    local canArrest, message = hook.Call("canArrest", DarkRP.hooks, Owner, ent)
    if not canArrest then
        if message then DarkRP.notify(Owner, 1, 5, message) end
        return
    end

    local time = hook.Call("setArrestStickTime", DarkRP.hooks, self, Owner, ent)
    ent:arrest(time, Owner)
    DarkRP.notify(ent, 0, 20, DarkRP.getPhrase("youre_arrested_by", Owner:Nick()))

    if Owner.SteamName then
        DarkRP.log(Owner:Nick() .. " (" .. Owner:SteamID() .. ") arrested " .. ent:Nick(), Color(0, 255, 255))
    end
end

function SWEP:startDarkRPCommand(usrcmd)
    local Owner = self:GetOwner()
    if not IsValid(Owner) then return end

    if game.SinglePlayer() and CLIENT then return end
    if usrcmd:KeyDown(IN_ATTACK2) then
        if not self.Switched and Owner:HasWeapon("unarrest_stick") then
            usrcmd:SelectWeapon(Owner:GetWeapon("unarrest_stick"))
        end
    else
        self.Switched = false
    end
end

--PATH addons/sl_utils/lua/weapons/cross_arms_infront_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can now cross your arms infront of your chest!"
SWEP.Instructions 			= "Click to cross your arms."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "Cross Arms (Infront)"
SWEP.Spawnable				= true

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
            ["ValveBiped.Bip01_R_Forearm"] = Angle(-43.779933929443,-107.18412780762,15.918969154358),
            ["ValveBiped.Bip01_R_UpperArm"] = Angle(20.256689071655, -57.223915100098, -6.1269416809082),
            ["ValveBiped.Bip01_L_UpperArm"] = Angle(-28.913911819458, -59.408206939697, 1.0253102779388),
            ["ValveBiped.Bip01_R_Thigh"] = Angle(4.7250719070435, -6.0294013023376, -0.46876749396324),
            ["ValveBiped.Bip01_L_Thigh"] = Angle(-7.6583762168884, -0.21996378898621, 0.4060270190239),
            ["ValveBiped.Bip01_L_Forearm"] = Angle(51.038677215576, -120.44165039063, -18.86986541748),
            ["ValveBiped.Bip01_R_Hand"] = Angle(14.424224853516, -33.406204223633, -7.2624106407166),
            ["ValveBiped.Bip01_L_Hand"] = Angle(25.959447860718, 31.564517974854, -14.979378700256),
	    }
	end
end

--PATH addons/sl_util_wallet/lua/weapons/ez_wallet_card/shared.lua:


SWEP.PrintName          = easzy.wallet.config.cardName or "Card"
SWEP.Author             = "Easzy"
SWEP.Instructions       = ""
SWEP.Category           = "Easzy Wallet"

SWEP.AutomaticFrameAdvance = true

SWEP.Spawnable          = false
SWEP.AdminOnly          = true

SWEP.Slot               = 1
SWEP.SlotPos            = 0

SWEP.Base               = "weapon_base"
SWEP.ViewModel          = "models/easzy/ez_wallet/card/v_card.mdl"
SWEP.WorldModel         = "models/easzy/ez_wallet/card/w_card.mdl"

SWEP.UseHands           = true
SWEP.HoldType           = "pistol"

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
SWEP.SwayScale = 0.5 -- (Clientside) The scale of the viewModel sway (viewModel position lerp when looking around

--PATH addons/sl_util_wallet/lua/weapons/ez_wallet_wallet/cl_init.lua:
include("shared.lua")

function SWEP:SetupDataTables()
	self:NetworkVar("String", 0, "BodygroupsString")
end

function SWEP:Initialize()
    self:SetHoldType(self.HoldType)

    local hand = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Finger2")
    if hand then
        self:FollowBone(self:GetOwner(), hand)
    end

    self:SetVar("hoveredItem", "")

    self.id = easzy.wallet.itemID
    easzy.wallet.itemID = easzy.wallet.itemID + 1
end

function SWEP:PostDrawViewModel(viewModel, weapon, ply)
    if not weapon.id then return end
    viewModel.id = weapon.id

    local owner = weapon:GetOwner()
    if not IsValid(owner) then return end

    for baseTexture, _ in pairs(easzy.wallet.walletItemsConfig) do
        easzy.wallet.UpdateCardMaterial(baseTexture, owner, viewModel)
    end

    -- Draw only for cetain animations
    local currentAnim = easzy.wallet.GetViewModelAnimationName(ply)
    if currentAnim != "take_out" then
        self:Draw3D2DGui(viewModel)
    end

    self:CheckItemHover(viewModel)
end

function SWEP:Draw3D2DGui(viewModel)
    local walletBone = viewModel:LookupBone("Wallet")
    if not walletBone then return end

    -- 3D2D
    local walletBonePos, walletBoneAng = viewModel:GetBonePosition(walletBone)
    if walletBonePos == viewModel:GetPos() then
        walletBonePos = viewModel:GetBoneMatrix(walletBone):GetTranslation()
    end
    walletBoneAng:RotateAroundAxis(walletBoneAng:Forward(), 90)
    walletBoneAng:RotateAroundAxis(walletBoneAng:Right(), 90)
    walletBonePos = walletBonePos + walletBoneAng:Up()*0.01

    local function DisplayCardNames()
        if not easzy.wallet.config.showCardNames then return end

        for baseTexture, itemConfig in pairs(easzy.wallet.walletItemsConfig) do
            if not itemConfig.walletText then continue end

            if easzy.wallet.config.showCardNamesOnHover then
                local hoveredItem = self:GetVar("hoveredItem")
                if baseTexture != hoveredItem then continue end
            end

		    draw.SimpleText(itemConfig.walletText, "EZFont48", itemConfig.walletTextPos.x, itemConfig.walletTextPos.y, easzy.wallet.colors.white, itemConfig.walletTextAlign, TEXT_ALIGN_CENTER)
        end
    end

    cam.Start3D2D(walletBonePos, walletBoneAng, 0.005)
        if easzy.wallet.config.showWalletHelp then
		    draw.SimpleText(easzy.wallet.languages.pressToUse, "EZFont48", -390, 0, easzy.wallet.colors.white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        DisplayCardNames()
    cam.End3D2D()
end

function SWEP:SendItemHover(baseTexture)
    if self:GetVar("hoveredItem") == baseTexture then return end
    self:SetVar("hoveredItem", baseTexture)

    net.Start("ez_wallet_hover_item")
    net.WriteString(baseTexture)
    net.SendToServer()
end

function SWEP:CheckItemHover(viewModel)
    -- Hover interaction
    local hoveringItem = false
    for baseTexture, itemConfig in pairs(easzy.wallet.walletItemsConfig) do

        if itemConfig.ent == "ez_wallet_card" then
            local itemBodygroup = viewModel:FindBodygroupByName(itemConfig.bodygroup)
            local currentBodyGroup = viewModel:GetBodygroup(itemBodygroup)
            local itemBodygroup = easzy.wallet.FindBodygroupValueByValueName(viewModel, itemBodygroup, itemConfig.bodygroupValue)
            if currentBodyGroup != itemBodygroup then continue end
        end

        if not itemConfig.attachmentTopLeft or not itemConfig.attachmentBottomRight then continue end

        local topLeftIndex = viewModel:LookupAttachment(itemConfig.attachmentTopLeft)
        local bottomRightIndex = viewModel:LookupAttachment(itemConfig.attachmentBottomRight)

        if topLeftIndex == -1 or bottomRightIndex == -1 then continue end

        local topLeft = viewModel:GetAttachment(topLeftIndex)
        local bottomRight = viewModel:GetAttachment(bottomRightIndex)

        if not topLeft or not bottomRight then continue end

        cam.Start3D()
            local topLeftScreen = topLeft.Pos:ToScreen()
            local bottomRightScreen = bottomRight.Pos:ToScreen()
        cam.End3D()

        local w = bottomRightScreen.x - topLeftScreen.x
        local h = bottomRightScreen.y - topLeftScreen.y

        if easzy.wallet.IsMouseOver(topLeftScreen.x, topLeftScreen.y, w, h) then
            self:SendItemHover(baseTexture)
            hoveringItem = true
        end

    end
    if not hoveringItem then
        self:SendItemHover("")
    end
end

function SWEP:DrawWorldModel()
    local owner = self:GetOwner()
    if not IsValid(owner) then return end

	if not IsValid(self.worldModel) then
		self.worldModel = ClientsideModel(self.WorldModel)
		self.worldModel:SetSkin(1)
		self.worldModel:SetNoDraw(true)
		self.worldModel:DrawShadow(false)
        self.worldModel:ResetSequence("unfolded")
	else
        -- Set the same bodygroups as the viewmodel
        local bodygroups = self:GetBodygroupsString()
        if bodygroups then
            self.worldModel:SetBodyGroups(bodygroups)
        end

        -- Specify a good position
        local offsetVec = Vector(4, -5, -2.5)
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

--PATH addons/gmodadminsuite-logging-2.4.8/lua/weapons/gas_log_scanner/shared.lua:
local function L(phrase, discriminator)
	return GAS:Phrase(phrase, "logging", discriminator)
end

local COLOR_RED = Color(255, 0, 0)
local SCANNER_HUD

SWEP.PrintName    = "bLogs Scanner"
SWEP.Category     = "GmodAdminSuite"
SWEP.Author       = "GmodAdminSuite"
SWEP.Purpose      = "This scanner allows you to view logs related to entities in the world"
SWEP.Instructions = "Look at an entity"
SWEP.Contact      = "www.gmodadminsuite.com"

SWEP.Slot           = 5
SWEP.SlotPos        = 2
SWEP.DrawAmmo       = false
SWEP.DrawCrosshair  = true
SWEP.Weight         = 5
SWEP.AutoSwitchTo   = false
SWEP.AutoSwitchFrom = false

SWEP.ViewModel  = "models/weapons/v_emptool.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.Spawnable  = true
SWEP.AdminOnly  = true

SWEP.ShowViewModel  = true
SWEP.ShowWorldModel = false

SWEP.Primary.ClipSize    = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic   = false
SWEP.Primary.Ammo        = "none"

SWEP.Secondary.ClipSize    = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic   = false
SWEP.Secondary.Ammo        = "none"

SWEP.HolsterSound       = Sound("npc/turret_floor/retract.wav")
SWEP.DeploySound        = Sound("npc/turret_floor/deploy.wav")
SWEP.ErrorSound         = Sound("npc/roller/code2.wav")
SWEP.ViewLogsSound      = Sound("AlyxEMP.Discharge")
SWEP.ShowInterfaceSound = Sound("gmodadminsuite/btn_light.ogg")
SWEP.HideInterfaceSound = Sound("gmodadminsuite/btn_heavy.ogg")

SWEP.WElements = {
	["scanner"] = {
		type = "Model",
		model = "models/weapons/w_emptool.mdl",
		bone = "ValveBiped.Anim_Attachment_LH",
		rel = "",
		pos = Vector(0.518, -3.636, 6.752),
		angle = Angle(38.57, -180, 12.857),
		size = Vector(1, 1, 1),
		color = Color(255, 255, 255, 255),
		surpresslightning = false,
		material = "",
		skin = 0,
		bodygroup = {}
	}
}

if (CLIENT) then
	function SWEP:Initialize()
		self:CreateModels(self.WElements)
	end
end

function SWEP:PrimaryAttack()
	self:SendWeaponAnim(ACT_VM_FIDGET)

	if (CLIENT) then
		if (IsValid(self.HUD) and self.HUD:IsVisible()) then
			self.LastInspectedEnt = self.HUD.InspectingEnt
			self.LastInspectedEntHUD = self.HUD

			self.HUD:ShowCloseButton(true)
			self.HUD:ShowFullscreenButton(true)
			self.HUD:ShowPinButton(true)
			self.HUD:MakePopup()

			GAS:PlaySound("popup")
			self.HUD = nil
			self:CreateInterface()

			local tr = self.Owner:GetEyeTrace()
			local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)
			effectdata:SetNormal(tr.HitNormal)
			effectdata:SetMagnitude(8)
			effectdata:SetScale(1)
			effectdata:SetRadius(16)
			util.Effect("cball_bounce", effectdata)

			self:EmitSound(self.ViewLogsSound)
		else
			self:EmitSound(self.ErrorSound)
		end
	end

	return true
end

function SWEP:SecondaryAttack()
	return false
end

if (SERVER) then
	util.AddNetworkString("gmodadminsuite:gas_log_scanner:Init")
	function SWEP:Deploy()
		if (not IsFirstTimePredicted()) then return end
		self:SetHoldType("duel")
		self:EmitSound(self.DeploySound)
		self:SendWeaponAnim(ACT_VM_DRAW)
		
		GAS:netStart("gas_log_scanner:Init")
		net.Send(self.Owner)
	end
else
	function SWEP:NetworkedDeploy()
		hook.Add("PreDrawHalos", "gas_log_scanner:Halo", function()
			if (not IsValid(self)) then
				timer.Remove("gas_log_scanner:UncacheData")
				timer.Remove("gas_log_scanner:LoadLogs")
				hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
				if (IsValid(SCANNER_HUD)) then
					SCANNER_HUD:Close()
				end
			else
				self:DrawHalo()
			end
		end)
		self:CreateInterface()
	end
	net.Receive("gmodadminsuite:gas_log_scanner:Init", function()
		timer.Create("gas_log_scanner:Init", 0, 0, function()
			if (IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon():GetClass() == "gas_log_scanner" and LocalPlayer():GetActiveWeapon().NetworkedDeploy ~= nil) then
				LocalPlayer():GetActiveWeapon():NetworkedDeploy()
				timer.Remove("gas_log_scanner:Init")
			end
		end)
	end)
end

function SWEP:Holster()
	if (not IsFirstTimePredicted()) then
		return
	end
	self:EmitSound(self.HolsterSound)
	if (CLIENT) then
		timer.Remove("gas_log_scanner:UncacheData")
		timer.Remove("gas_log_scanner:LoadLogs")
		hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
		if (IsValid(self.HUD)) then
			self.HUD:Close()
		end
	end
	return true
end

if (SERVER) then
	function SWEP:Think()
		if (not IsValid(self.Owner)) then return end
		local tr = self.Owner:GetEyeTrace()
		if (IsValid(tr.Entity) and not tr.Entity:IsWorld()) then
			self:SetHoldType("magic")
		else
			self:SetHoldType("duel")
		end
	end
end

if (CLIENT) then
	hook.Add("PlayerSwitchWeapon", "gas_log_scanner:RemoveMenuOnSwitch", function(ply, oldWeapon, newWeapon)
		if (ply ~= LocalPlayer()) then return end
		if (IsValid(oldWeapon) and oldWeapon:GetClass() == "gas_log_scanner") then
			if (IsValid(newWeapon) and newWeapon:GetClass() == "gas_log_scanner") then
				return
			else
				timer.Remove("gas_log_scanner:UncacheData")
				timer.Remove("gas_log_scanner:LoadLogs")
				hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
				if (IsValid(oldWeapon.HUD)) then
					oldWeapon.HUD:Close()
				end
			end
		end
	end)

	function SWEP:CreateInterface()
		timer.Remove("gas_log_scanner:LoadLogs")
		if (IsValid(self.HUD)) then
			self.HUD:Close()
		end
		if (IsValid(SCANNER_HUD)) then
			SCANNER_HUD:Close()
		end

		self.HUD = vgui.Create("bVGUI.Frame")
		local HUD = self.HUD
		SCANNER_HUD = HUD

		HUD.FirstLoad = true
		HUD:SetTitle("bLogs Scanner")
		HUD:SetSize(425,400)
		HUD:SetPos(1050,300)
		HUD:ShowCloseButton(false)
		HUD:ShowFullscreenButton(false)
		HUD:ShowPinButton(false)
		HUD:SetVisible(false)

		HUD.Pagination = vgui.Create("bVGUI.Pagination", HUD)
		HUD.Pagination:SetTall(30)
		HUD.Pagination:Dock(TOP)
		HUD.Pagination:SetPages(1)
		function HUD.Pagination:OnPageSelected(page)
			HUD.Logs:Clear()
			HUD.Logs:SetLoading(true)
			local function LoadLogs()
				if (not IsValid(HUD) or not IsValid(self)) then return end
				HUD.FirstLoad = nil
				if (not IsValid(HUD.InspectingEnt)) then
					HUD.Logs:SetLoading(false)
				else
					local function LoadScannerLogs()
						GAS:StartNetworkTransaction("logging:LoadScannerLogs", function()
							net.WriteUInt(page, 16)
							net.WriteEntity(HUD.InspectingEnt)
						end, function(data_present, l)
							if (not IsValid(HUD)) then return end
							HUD.Logs:SetLoading(false)
							if (data_present) then
								local ent = net.ReadEntity()
								local pages = net.ReadUInt(16)
								local logs = GAS:DeserializeTable(util.Decompress(net.ReadData(l - 16 - 16)))

								HUD.Pagination:SetPages(pages)
								for _,log in ipairs(logs) do
									local module_data = GAS.Logging.IndexedModules[log[2]]
									local formatted_log = GAS.Logging:FormatMarkupLog(log, GAS.Logging.Config.ColoredLogs or true)
									local log_row = HUD.Logs:AddRow("<color=" .. GAS:Unvectorize(module_data.Colour or bVGUI.COLOR_WHITE) .. ">" .. GAS:EscapeMarkup(module_data.Name) .. "</color>", GAS:SimplifyTimestamp(log[3]), formatted_log)
									log_row.Data = log
									log_row.IsColored = GAS.Logging.Config.ColoredLogs or true
								end
							end
						end)
					end
					if (GAS.Logging.IndexedModules == nil) then
						GAS:StartNetworkTransaction("logging:GetModules", nil, function()
							net.ReadBool()
							local data_len = net.ReadUInt(16)

							GAS.Logging.Modules = {}
							GAS.Logging.IndexedModules = GAS:DeserializeTable(util.Decompress(net.ReadData(data_len)))
							for module_id, module_data in pairs(GAS.Logging.IndexedModules) do
								if (module_data.Offline) then continue end
								GAS.Logging.Modules[module_data.Category] = GAS.Logging.Modules[module_data.Category] or {}
								GAS.Logging.Modules[module_data.Category][module_data.Name] = module_data
							end

							LoadScannerLogs()
						end)
					else
						LoadScannerLogs()
					end
				end
			end
			if (HUD.FirstLoad) then
				timer.Create("gas_log_scanner:LoadLogs", .5, 1, LoadLogs)
			else
				LoadLogs()
			end
		end

		HUD.Logs = vgui.Create("bVGUI.Table", HUD)
		HUD.Logs:Dock(FILL)
		HUD.Logs:AddColumn(L"module", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
		HUD.Logs:AddColumn(L"when", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
		HUD.Logs:AddColumn(L"log", bVGUI.TABLE_COLUMN_GROW)
		HUD.Logs:SetRowCursor("hand")
		HUD.Logs:SetLoading(true)

		function HUD.Logs:OnRowRightClicked(row)
			self:OnRowClicked(row)
		end
		function HUD.Logs:OnRowClicked(row)
			GAS.Logging:OpenLogsContextMenu(row)
		end
	end

	SWEP.HaloTable = {}
	function SWEP:DrawHalo()
		if (not IsValid(self) or not IsValid(self.Owner) or self.Owner:GetActiveWeapon() ~= self) then
			return hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
		end
		local tr = self.Owner:GetEyeTrace()
		if (IsValid(tr.Entity) and not tr.Entity:IsWorld()) then
			if (tr.Entity == self.LastInspectedEnt and IsValid(self.LastInspectedEntHUD)) then
				self.HaloTable[1] = nil
				return
			end
			if (self.HaloTable[1] == nil) then
				self:EmitSound(self.ShowInterfaceSound)
			end
			self.HaloTable[1] = tr.Entity

			halo.Add(self.HaloTable, COLOR_RED, 2, 2, 5, true, true)

			if (IsValid(self.HUD)) then
				self.HUD:SetVisible(true)
				self.HUD:SetTitle(tr.Entity:GetClass() .. " (" .. tr.Entity:EntIndex() .. ")")
				self.HUD.InspectingEnt = tr.Entity
				if (self.HUD.LastInspectedEnt ~= tr.Entity) then
					self.HUD.LastInspectedEnt = tr.Entity
					self.HUD.FirstLoad = true
					self.HUD.Pagination:SetPages(1)
					self.HUD.Pagination:SetPage(1)
					self.HUD.Pagination:OnPageSelected(1)
				end
				if (self.HUD.UncacheData) then
					self.HUD.UncacheData = nil
					self.HUD.Pagination:SetPage(1)
					self.HUD.Pagination:OnPageSelected(1)
				end
			end

			timer.Remove("gas_log_scanner:UncacheData")
		else
			self.LastInspectedEntHUD = nil
			self.LastInspectedEnt = nil

			if (self.HaloTable[1] ~= nil) then
				self:EmitSound(self.HideInterfaceSound)
			end
			self.HaloTable[1] = nil

			if (IsValid(self.HUD)) then
				self.HUD:SetVisible(false)
				self.HUD.InspectingEnt = nil
				if (not timer.Exists("gas_log_scanner:UncacheData") and not self.HUD.UncacheData) then
					timer.Create("gas_log_scanner:UncacheData", 3, 1, function()
						self.HUD.UncacheData = true
					end)
				end
			end
		end
	end

	-- Credit for this goes to the SWEP Construction Kit
	-- https://github.com/Clavus/SWEP_Construction_Kit

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		if (self.GetBoneOrientation == nil) then return end
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end

		if (not self.wRenderOrder) then
			self.wRenderOrder = {}
			for k, v in pairs(self.WElements) do
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
			bone_ent = self
		end

		for k, name in pairs(self.wRenderOrder) do
			local v = self.WElements[name]
			if (not v) then
				self.wRenderOrder = nil
				break
			end
			if (v.hide) then continue end

			local pos, ang

			if (v.bone) then
				pos, ang = self:GetBoneOrientation(self.WElements, v, bone_ent)
			else
				pos, ang = self:GetBoneOrientation(self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand")
			end

			if (not pos) then continue end

			local model = v.modelEnt

			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			model:SetAngles(ang)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix("RenderMultiply", matrix)

			if (v.material == "") then
				model:SetMaterial("")
			elseif (model:GetMaterial() ~= v.material) then
				model:SetMaterial(v.material)
			end

			if (v.skin and v.skin ~= model:GetSkin()) then
				model:SetSkin(v.skin)
			end

			if (v.bodygroup) then
				for k, v in pairs(v.bodygroup) do
					if (model:GetBodygroup(k) ~= v) then
						model:SetBodygroup(k, v)
					end
				end
			end

			if (v.surpresslightning) then
				render.SuppressEngineLighting(true)
			end

			render.SetColorModulation(v.color.r / 255, v.color.g / 255, v.color.b / 255)
			render.SetBlend(v.color.a / 255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1, 1, 1)

			if (v.surpresslightning) then
				render.SuppressEngineLighting(false)
			end
		end
	end

	function SWEP:CreateModels(tab)
		for k, v in pairs(tab) do
			if
				(v.type == "Model" and v.model and v.model ~= "" and (not IsValid(v.modelEnt) or v.createdModel ~= v.model) and
					string.find(v.model, ".mdl") and
					file.Exists(v.model, "GAME"))
			 then
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
			elseif
				(v.type == "Sprite" and v.sprite and v.sprite ~= "" and (not v.spriteMaterial or v.createdSprite ~= v.sprite) and
					file.Exists("materials/" .. v.sprite .. ".vmt", "GAME"))
			 then
				local name = v.sprite .. "-"
				local params = {["$basetexture"] = v.sprite}
				local tocheck = {"nocull", "additive", "vertexalpha", "vertexcolor", "ignorez"}
				for i, j in pairs(tocheck) do
					if (v[j]) then
						params["$" .. j] = 1
						name = name .. "1"
					else
						name = name .. "0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name, "UnlitGeneric", params)
			end
		end
	end
end

--PATH addons/sl_utils/lua/improvedstacker/improvedstacker.lua:
--[[--------------------------------------------------------------------------
	Improved Stacker Module
	
	Author:
		Mista-Tea ([IJWTB] Thomas)
	
	License:
		The MIT License (MIT)

		Copyright (c) 2014-2020 Mista-Tea

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
			
	Changelog:
----------------------------------------------------------------------------]]

local math = math
local hook = hook
local Angle = Angle
local Vector = Vector
local GetConVar = GetConVar
local duplicator = duplicator
local CreateConVar = CreateConVar

--[[--------------------------------------------------------------------------
-- 	Namespace Tables
--------------------------------------------------------------------------]]--

module( "improvedstacker", package.seeall )

--[[--------------------------------------------------------------------------
-- 	Localized Functions & Variables
--------------------------------------------------------------------------]]--

-- enums for determining stack relativity
MODE_WORLD = 1 -- stacking relative to the world
MODE_PROP  = 2 -- stacking relative to the prop

-- lookup table for validating relative values
Modes = {
	[MODE_WORLD] = true,
	[MODE_PROP]  = true,
}

-- enums for determining the direction to stack props
DIRECTION_FRONT = 1
DIRECTION_BACK  = 2
DIRECTION_RIGHT = 3
DIRECTION_LEFT  = 4
DIRECTION_UP    = 5
DIRECTION_DOWN  = 6

-- lookup table for validating direction values
Directions = {
	[DIRECTION_FRONT] = true,
	[DIRECTION_BACK]  = true,
	[DIRECTION_RIGHT] = true,
	[DIRECTION_LEFT]  = true,
	[DIRECTION_UP]    = true,
	[DIRECTION_DOWN]  = true,
}

-- constants used for when stacking relative to the World
ANGLE_ZERO   =  Angle( 0, 0, 0 )
VECTOR_FRONT  = ANGLE_ZERO:Forward()
VECTOR_RIGHT  = ANGLE_ZERO:Right()
VECTOR_UP     = ANGLE_ZERO:Up()
VECTOR_BACK   = -VECTOR_FRONT
VECTOR_LEFT   = -VECTOR_RIGHT
VECTOR_DOWN   = -VECTOR_UP

-- there has been a longstanding problem where stacked entities were an inch apart (figuratively), causing gaps everywhere.
-- as it turns out, fixing this issue is as easy as subtracting 0.5 from the forward component of the offset vector.
MAGIC_OFFSET = -0.5

--[[--------------------------------------------------------------------------
--	Namespace Functions
--------------------------------------------------------------------------]]--

if ( SERVER ) then
	
	-- the tables below are used internally and should only generally be interfaced with
	-- via the functions declared afterward.
	-- basically treat them as private, since they are only public for auto-refresh compatibility
	
	-- holds the current stacked entity count for every player
	m_EntCount  = m_EntCount  or {}
	-- holds the last stacker usage for every player
	m_StackTime = m_StackTime or {}
	-- holds every stacker entity created
	m_Ents      = m_Ents      or {}
		
	--[[--------------------------------------------------------------------------
	-- 	GetEntCount( player, number )
	--]]--
	function GetEntCount( ply, default )
		return m_EntCount[ ply:SteamID() ] or default
	end
	--[[--------------------------------------------------------------------------
	-- 	SetEntCount( player, number )
	--]]--
	function SetEntCount( ply, num )
		m_EntCount[ ply:SteamID() ] = num
	end
	--[[--------------------------------------------------------------------------
	-- 	IncrementEntCount( player, number )
	--]]--
	function IncrementEntCount( ply, num )
		m_EntCount[ ply:SteamID() ] = GetEntCount( ply, 0 ) + (num or 1)
	end
	--[[--------------------------------------------------------------------------
	-- 	DecrementEntCount( player, number )
	--]]--
	function DecrementEntCount( ply, num )
		m_EntCount[ ply:SteamID() ] = ( m_EntCount[ ply:SteamID() ] and m_EntCount[ ply:SteamID() ] - (num or 1) ) or 0
	end
	
	--[[--------------------------------------------------------------------------
	-- 	SetLastStackTime( player, number )
	--]]--
	function SetLastStackTime( ply, num )
		m_StackTime[ ply:SteamID() ] = num
	end
	--[[--------------------------------------------------------------------------
	-- 	GetLastStackTime( player, number )
	--]]--
	function GetLastStackTime( ply, default )
		return m_StackTime[ ply:SteamID() ] or default
	end
	
	--[[--------------------------------------------------------------------------
	--	Initialize( string )
	--
	--	This should be called immediately after including this file so that the follow
	--	variables/functions can use the stacker tool's mode (i.e., the name of the file itself
	--	and what is subsequently used in all of the cvars).
	--]]--
	function Initialize( mode )
		mode = mode or "stacker_improved"
		
		--[[--------------------------------------------------------------------------
		--  Hook :: PlayerInitialSpawn
		
		--	Sets the newly connected player's total stacker ents to 0.
		--	See TOOL:IsExceedingMax() for more details
		--]]--
		hook.Add( "PlayerInitialSpawn", mode.."_set_ent_count", function( ply )
			m_EntCount[ ply:SteamID() ] = 0
		end )
		--[[--------------------------------------------------------------------------
		--  Hook :: PlayerDisconnected
		--
		--	Removes the player from the table when they disconnect (for sanitation).
		--]]--
		hook.Add( "PlayerDisconnected", mode.."_remove_ent_count", function( ply )
			m_EntCount[ ply:SteamID() ] = nil
		end )
		
		--[[--------------------------------------------------------------------------
		-- 	MarkEntity( player, entity, table )
		--
		--	Marks the entity as a stacker entity. This allows the entity to be 
		--	collision-checked in GM.ShouldCollide.
		--]]--
		function MarkEntity( ply, ent, data )
			m_Ents[ ent ] = true
			duplicator.StoreEntityModifier( ent, mode, { StackerEnt = true } )
			ent:SetCustomCollisionCheck( true )
			
			-- when the entity is removed, sanitize our internal m_Ents array
			ent:CallOnRemove( mode, function( ent )
				ClearEntity( ent )
			end )
		end
		--duplicator.RegisterEntityModifier( mode, MarkEntity )
		--[[--------------------------------------------------------------------------
		-- 	ClearEntity( entity )
		--
		--	Removes the entity from the internal m_Ents array for sanitation purposes.
		--	This is called when an entity is just about to be removed.
		--]]--
		function ClearEntity( ent )
			if ( m_Ents[ ent ] ) then m_Ents[ ent ] = nil end
		end
		
		--[[--------------------------------------------------------------------------
		-- 	CanUnfreeze( player, entity, physObject )
		--]]--
		function CanUnfreeze( ply, ent, phys )
			if ( m_Ents[ ent ] ) then print("nope") return false end
		end
		--hook.Add( "CanPlayerUnfreeze", mode, CanUnfreeze )
		--hook.Add( "PhysgunPickup",     mode, CanUnfreeze )
		--hook.Remove( "CanPlayerUnfreeze", mode )
		--hook.Remove( "PhysgunPickup",     mode )
		
		local cvarNoCollideAll
		local cvarNoCollide
		--[[--------------------------------------------------------------------------
		-- 	ShouldCollide( entity, entity )
		--]]--
		function ShouldCollide( a, b )
			if ( not cvarNoCollideAll ) then cvarNoCollideAll = GetConVar( mode.."_force_nocollide_all" ) end
			if ( not cvarNoCollide )    then cvarNoCollide    = GetConVar( mode.."_force_nocollide" )     end
			
			if ( cvarNoCollideAll:GetBool() ) then
				if ( m_Ents[ a ] ) then
					if not ( b:IsPlayer() or b:IsWorld() or b:IsNPC() or b:IsVehicle() ) then return false end
				elseif ( m_Ents[ b ] ) then
					if not ( a:IsPlayer() or a:IsWorld() or b:IsNPC() or b:IsVehicle() ) then return false end
				end
			elseif ( cvarNoCollide:GetBool() ) then
				if ( m_Ents[ a ] and m_Ents[ b ] ) then return false end
			end
		end
		--hook.Add( "ShouldCollide", mode, ShouldCollide )
		--hook.Remove( "ShouldCollide", mode )
	end
	
elseif ( CLIENT ) then
	
	-- the table below is used internally and should only generally be interfaced with
	-- via the functions declared afterward.
	-- basically treat it as private, since it is only public for auto-refresh compatibility
	
	m_Ghosts    = m_Ghosts    or {}
	m_LookingAt = m_LookingAt or nil
	m_LookedAt  = m_LookedAt  or nil
	
	--[[--------------------------------------------------------------------------
	-- 	GetGhosts()
	--]]--
	function GetGhosts()
		return m_Ghosts
	end
	--[[--------------------------------------------------------------------------
	-- 	SetGhosts( table )
	--]]--
	function SetGhosts( tbl )
		m_Ghosts = tbl
	end
	
	--[[--------------------------------------------------------------------------
	-- 	GetLookingAt()
	--]]--
	function GetLookingAt()
		return m_LookingAt
	end
	--[[--------------------------------------------------------------------------
	-- 	SetLookingAt( entity )
	--]]--
	function SetLookingAt( ent )
		m_LookingAt = ent
	end
	
	--[[--------------------------------------------------------------------------
	-- 	GetLookedAt()
	--]]--
	function GetLookedAt()
		return m_LookedAt
	end
	--[[--------------------------------------------------------------------------
	-- 	SetLookedAt( entity )
	--]]--
	function SetLookedAt( ent )
		m_LookedAt = ent
	end
	
	--[[--------------------------------------------------------------------------
	-- 	ReleaseGhosts()
	--	
	--	Attempts to remove all ghosted props in the stack. 
	--	This occurs when the player stops looking at a prop with the stacker tool equipped.
	--]]--
	function ReleaseGhosts()
		if ( #m_Ghosts == 0 ) then return end
		
		for i = 1, #m_Ghosts do
			if ( not IsValid( m_Ghosts[ i ] ) ) then continue end
			SafeRemoveEntityDelayed( m_Ghosts[ i ], 0 )
			m_Ghosts[ i ] = nil
		end
	end
	
	--[[--------------------------------------------------------------------------
	--	Initialize( string )
	--
	--	This should be called immediately after including this file so that the follow
	--	variables/functions can use the stacker tool's mode (i.e., the name of the file itself
	--	and what is subsequently used in all of the cvars).
	--]]--
	function Initialize( mode )
		mode = mode or "stacker_improved"
		
		SETTINGS_DEFAULT = {
			[mode.."_set_max_per_player"]    = "-1",
			[mode.."_set_max_per_stack"]     = "15",
			[mode.."_set_delay"]             = "0.5",
			[mode.."_set_max_offsetx"]       = "200",
			[mode.."_set_max_offsety"]       = "200",
			[mode.."_set_max_offsetz"]       = "200",
			[mode.."_set_force_freeze"]      = "0",
			[mode.."_set_force_weld"]        = "0",
			[mode.."_set_force_nocollide"]   = "0",
			[mode.."_set_force_stayinworld"] = "1",
		}
		
		SETTINGS_SANDBOX = {
			[mode.."_set_max_per_player"]    = "-1",
			[mode.."_set_max_per_stack"]     = "30",
			[mode.."_set_delay"]             = "0.5",
			[mode.."_set_max_offsetx"]       = "1000",
			[mode.."_set_max_offsety"]       = "1000",
			[mode.."_set_max_offsetz"]       = "1000",
			[mode.."_set_force_freeze"]      = "0",
			[mode.."_set_force_weld"]        = "0",
			[mode.."_set_force_nocollide"]   = "0",
			[mode.."_set_force_stayinworld"] = "0",
		}
		
		SETTINGS_DARKRP = {
			[mode.."_set_max_per_player"]    = "50",
			[mode.."_set_max_per_stack"]     = "5",
			[mode.."_set_delay"]             = "1",
			[mode.."_set_max_offsetx"]       = "200",
			[mode.."_set_max_offsety"]       = "200",
			[mode.."_set_max_offsetz"]       = "200",
			[mode.."_set_force_freeze"]      = "1",
			[mode.."_set_force_weld"]        = "0",
			[mode.."_set_force_nocollide"]   = "1",
			[mode.."_set_force_stayinworld"] = "1",
		}
		
		SETTINGS_SINGLEPLAYER = {
			[mode.."_set_max_per_player"]    = "-1",
			[mode.."_set_max_per_stack"]     = "100",
			[mode.."_set_delay"]             = "0",
			[mode.."_set_max_offsetx"]       = "10000",
			[mode.."_set_max_offsety"]       = "10000",
			[mode.."_set_max_offsetz"]       = "10000",
			[mode.."_set_force_freeze"]      = "0",
			[mode.."_set_force_weld"]        = "0",
			[mode.."_set_force_nocollide"]   = "0",
			[mode.."_set_force_stayinworld"] = "0",
		}
	end
	
end

--
-- The functions below are used both serverside and clientside for properly orienting
-- and spacing props in a stack
--

-- Lookup table that holds functions related to determining the direction of a stack
DirectionFunctions = {
	[MODE_WORLD] = {
		[DIRECTION_FRONT] = function() return VECTOR_FRONT end,
		[DIRECTION_BACK]  = function() return VECTOR_BACK  end,
		[DIRECTION_RIGHT] = function() return VECTOR_RIGHT end,
		[DIRECTION_LEFT]  = function() return VECTOR_LEFT  end,
		[DIRECTION_UP]    = function() return VECTOR_UP    end,
		[DIRECTION_DOWN]  = function() return VECTOR_DOWN  end,
	},
	
	[MODE_PROP]  = {
		[DIRECTION_FRONT] = function( angle ) return  angle:Forward() end,
		[DIRECTION_BACK]  = function( angle ) return -angle:Forward() end,
		[DIRECTION_RIGHT] = function( angle ) return  angle:Right()   end,
		[DIRECTION_LEFT]  = function( angle ) return -angle:Right()   end,
		[DIRECTION_UP]    = function( angle ) return  angle:Up()      end,
		[DIRECTION_DOWN]  = function( angle ) return -angle:Up()      end,
	}
}

-- Lookup table that holds functions related to determining the distance to offset each prop in a stack
-- before applying the client's actual x/y/z offset values
DistanceFunctions = {
	[DIRECTION_FRONT] = function( min, max ) return math.abs(max.x - min.x) end,
	[DIRECTION_BACK]  = function( min, max ) return math.abs(max.x - min.x) end,
	[DIRECTION_RIGHT] = function( min, max ) return math.abs(max.y - min.y) end,
	[DIRECTION_LEFT]  = function( min, max ) return math.abs(max.y - min.y) end,
	[DIRECTION_UP]    = function( min, max ) return math.abs(max.z - min.z) end,
	[DIRECTION_DOWN]  = function( min, max ) return math.abs(max.z - min.z) end,
}

-- Lookup table that holds functions related to determining the distance to offset each prop in a stack
-- based on the client's x/y/z offset values
OffsetFunctions = {
	[DIRECTION_FRONT] = function( angle, offset ) return ( angle:Forward() * offset.x) + ( angle:Up()      * offset.z) + ( angle:Right()   * offset.y) end,
	[DIRECTION_BACK]  = function( angle, offset ) return (-angle:Forward() * offset.x) + ( angle:Up()      * offset.z) + (-angle:Right()   * offset.y) end,
	[DIRECTION_RIGHT] = function( angle, offset ) return ( angle:Right()   * offset.x) + ( angle:Up()      * offset.z) + (-angle:Forward() * offset.y) end,
	[DIRECTION_LEFT]  = function( angle, offset ) return (-angle:Right()   * offset.x) + ( angle:Up()      * offset.z) + ( angle:Forward() * offset.y) end,
	[DIRECTION_UP]    = function( angle, offset ) return ( angle:Up()      * offset.x) + (-angle:Forward() * offset.z) + ( angle:Right()   * offset.y) end,
	[DIRECTION_DOWN]  = function( angle, offset ) return (-angle:Up()      * offset.x) + ( angle:Forward() * offset.z) + ( angle:Right()   * offset.y) end,
}

RotationFunctions = {
	[DIRECTION_FRONT] = function( angle ) return  angle:Right(),   angle:Up(),       angle:Forward() end,
	[DIRECTION_BACK]  = function( angle ) return -angle:Right(),   angle:Up(),      -angle:Forward() end,
	[DIRECTION_RIGHT] = function( angle ) return -angle:Forward(), angle:Up(),       angle:Right()   end,
	[DIRECTION_LEFT]  = function( angle ) return  angle:Forward(), angle:Up(),      -angle:Right()   end,
	[DIRECTION_UP]    = function( angle ) return -angle:Right(),   angle:Forward(),  angle:Up()      end,
	[DIRECTION_DOWN]  = function( angle ) return  angle:Right(),   angle:Forward(), -angle:Up()      end,
}

--[[--------------------------------------------------------------------------
-- 	GetDirection( number, number, angle )
--
--	Calculates the direction to point the entity to by depending on whether the stack is
--	created relative to the world or the original prop, and the direction to stack in.
--]]--
function GetDirection( stackMode, stackDir, angle )
	return DirectionFunctions[ stackMode ][ stackDir ]( angle )
end

--[[--------------------------------------------------------------------------
-- 	GetDistance( number, number, entity )
--
--	Calculates the space occupied by the entity depending on the stack direction.
--	This represents the number of units to offset the stack entities so they appear
--	directly in front of the previous entity (depending on direction).
--]]--
function GetDistance( stackMode, stackDir, ent )
	if ( stackMode == MODE_WORLD ) then
		return DistanceFunctions[ stackDir ]( ent:WorldSpaceAABB() )
	elseif ( stackMode == MODE_PROP ) then
		return DistanceFunctions[ stackDir ]( ent:OBBMins(), ent:OBBMaxs() )
	end
end

--[[--------------------------------------------------------------------------
-- 	GetOffset( number, number, angle, vector )
--
--	Calculates a direction vector used for offsetting a stacked entity based on the facing angle of the previous entity.
--	This function uses a lookup table for added optimization as opposed to an if-else block.
--]]--
function GetOffset( stackMode, stackDir, angle, offset )
	-- if stacking relative to the world, apply the magic offset fix to the correct direction
	if ( stackMode == MODE_WORLD ) then
		local direction = DirectionFunctions[ stackMode ][ stackDir ]()
			  direction = direction * MAGIC_OFFSET
		return offset + direction
	-- if stacking relative to the prop, apply the magic offset only to the forward (x) component of the vector
	elseif ( stackMode == MODE_PROP ) then
		local trueOffset = Vector()
		      trueOffset:Set( offset )
			  trueOffset.x = trueOffset.x + MAGIC_OFFSET
		return OffsetFunctions[ stackDir ]( angle, trueOffset )
	end
end

--[[--------------------------------------------------------------------------
-- 	RotateAngle( angle, angle )
--
--	Rotates the first angle by the second angle. This ensures proper rotation
--	along all three axes and prevents various problems related to simply adding
--	two angles together. The first angle is modified directly by refence, so this does not
--	return anything.
--]]--
function RotateAngle( stackMode, stackDir, angle, rotation )
	local axisPitch, axisYaw, axisRoll = RotationFunctions[ stackDir ]( angle )

	angle:RotateAroundAxis( axisPitch,  rotation.p )
	angle:RotateAroundAxis( axisYaw,   -rotation.y )
	angle:RotateAroundAxis( axisRoll,   rotation.r )
end
--PATH addons/sl_main_system/lua/weapons/mad_baton1/shared.lua:
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

SWEP.PrintName 		      = "1 : Balais" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton12.mdl"
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
SWEP.BonusDegats = 10
SWEP.holdtype = "sl_mage_ht_mad"

-----------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton18/shared.lua:
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

SWEP.PrintName 		      = "18 : Baton a cloche" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton23.mdl"
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
SWEP.BonusDegats = 146

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague17/shared.lua:
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

SWEP.PrintName 		      = "17 : Dague Démoniaque" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague29.mdl"
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
SWEP.BonusDegats = 138

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague4/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee13/shared.lua:
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

SWEP.PrintName 		      = "13 : Épée en améthyste" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword28.mdl"
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
SWEP.BonusDegats = 114

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee17/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee2/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee6/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau10/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau11/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau19/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau19/shared.lua:
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

SWEP.PrintName 		      = "19 : Vieille Armorslayer" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/enormeepee10.mdl"
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
SWEP.BonusDegats = 154

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau8/shared.lua:
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

SWEP.PrintName 		      = "8 : Marteau en or noir" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/marteau5.mdl"
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
SWEP.BonusDegats = 66

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_marteau9/shared.lua:
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

SWEP.PrintName 		      = "9 : Hache en pierre" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/axe7.mdl"
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
SWEP.BonusDegats = 74

--------------------------------------------------------------------------
--PATH addons/leveling-system/lua/weapons/pocket/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
	AddCSLuaFile("cl_menu.lua")
	include("sv_init.lua")
end

if CLIENT then
	include("cl_menu.lua")
end

SWEP.PrintName = "Pocket"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Base = "weapon_cs_base2"

SWEP.Author = "DarkRP Developers + vrondakis"
SWEP.Instructions = "Left click to pick up, right click to drop, reload for menu"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"
SWEP.WorldModel	= ""

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "DarkRP (Utility)"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
	self:SetWeaponHoldType("normal")
end

function SWEP:Deploy()
	return true
end

function SWEP:DrawWorldModel() end

function SWEP:PreDrawViewModel(vm)
	return true
end

function SWEP:Holster()
	if not SERVER then return true end

	self.Owner:DrawViewModel(true)
	self.Owner:DrawWorldModel(true)

	return true
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.2)

	if not SERVER then return end

	local ent = self.Owner:GetEyeTrace().Entity
	local canPickup, message = hook.Call("canPocket", nil, self.Owner, ent)

	if not canPickup then
		if message then DarkRP.notify(self.Owner, 1, 4, message) end
		return
	end

	self.Owner:addPocketItem(ent)
end

function SWEP:SecondaryAttack()
	if not SERVER then return end

	local item = #self.Owner:getPocketItems()
	if item <= 0 then
		DarkRP.notify(self.Owner, 1, 4, DarkRP.getPhrase("pocket_no_items"))
		return
	end

	self.Owner:dropPocketItem(item)
end

function SWEP:Reload()
	if not CLIENT then return end

	DarkRP.openPocketMenu()
end

local meta = FindMetaTable("Player")
DarkRP.stub{
	name = "getPocketItems",
	description = "Get a player's pocket items.",
	parameters = {
	},
	returns = {
		{
			name = "items",
			description = "A table containing crucial information about the items in the pocket.",
			type = "table"
		}
	},
	metatable = meta,
	realm = "Shared"
}

--PATH addons/leveling-system/lua/weapons/pocket/cl_menu.lua:
local meta = FindMetaTable("Player")
local pocket = {}
local frame
local reload

/*---------------------------------------------------------------------------
Stubs
---------------------------------------------------------------------------*/
DarkRP.stub{
	name = "openPocketMenu",
	description = "Open the DarkRP pocket menu.",
	parameters = {
	},
	returns = {
	},
	metatable = DarkRP
}

/*---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------*/
function meta:getPocketItems()
	if self ~= LocalPlayer() then return nil end

	return pocket
end

function DarkRP.openPocketMenu()
	if frame and frame:IsValid() and frame:IsVisible() then return end
	if LocalPlayer():GetActiveWeapon():GetClass() ~= "pocket" then return end
	if not pocket then pocket = {} return end
	if #pocket <= 0 then return end
	frame = vgui.Create("DFrame")

	frame:SetTitle(DarkRP.getPhrase("drop_item"))
	frame:SetVisible(true)
	frame:MakePopup()

	reload()
	frame:SetSkin(GAMEMODE.Config.DarkRPSkin)
end


/*---------------------------------------------------------------------------
UI
---------------------------------------------------------------------------*/
function reload()
	if not ValidPanel(frame) or not frame:IsVisible() then return end
	if not pocket or next(pocket) == nil then frame:Close() return end

	local itemCount = table.Count(pocket)

	frame:SetSize(itemCount * 64, 90)
	frame:Center()

	local i = 0

	local items = {}
	for k,v in pairs(pocket) do

		local icon = vgui.Create("SpawnIcon", frame)
		icon:SetPos(i * 64, 25)
		icon:SetModel(v.model)
		icon:SetSize(64, 64)
		icon:SetToolTip()
		icon.DoClick = function(self)
			icon:SetToolTip()

			net.Start("DarkRP_spawnPocket")
				net.WriteFloat(k)
			net.SendToServer()
			pocket[k] = nil

			itemCount = itemCount - 1

			if itemCount == 0 then
				frame:Close()
				return
			end

			fn.Map(self.Remove, items)
			items = {}

			LocalPlayer():GetActiveWeapon():SetWeaponHoldType("pistol")
			timer.Simple(0.2, function() if LocalPlayer():GetActiveWeapon():IsValid() then LocalPlayer():GetActiveWeapon():SetWeaponHoldType("normal") end end)
		end

		table.insert(items, icon)
		i = i + 1
	end
end

local function retrievePocket()
	pocket = net.ReadTable()
	reload()
end
net.Receive("DarkRP_Pocket", retrievePocket)

--PATH gamemodes/mangarp/entities/weapons/weapon_mac102/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
    SWEP.IconLetter = "l"

    killicon.AddFont("weapon_mac102", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

SWEP.Base = "weapon_cs_base2"

SWEP.PrintName = "Mac10"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mac10.mdl"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.HoldType = "pistol"
SWEP.LoweredHoldType = "normal"

SWEP.Primary.Sound = Sound("Weapon_mac10.Single")
SWEP.Primary.Recoil = .8
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02
SWEP.Primary.ClipSize = 25
SWEP.Primary.Delay = 0.09
SWEP.Primary.DefaultClip = 25
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-9.08, -8, 2.6)
SWEP.IronSightsAng = Vector(1.8, -7.06, -6.1)

--PATH addons/sl_util_accessory/lua/entities/aas_model/cl_init.lua:
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

			draw.RoundedBoxEx(16, -500, -2150, 1000, 170, AAS.Colors["background"], true, true, false, false)
			draw.RoundedBox(0, -500, -2000, 1000, 20, AAS.Colors["black150"])

			draw.SimpleText(AAS.ModelName, "AAS:Font:08", 0, -2135, AAS.Colors["white"], TEXT_ALIGN_CENTER)

		cam.End3D2D()
	end 
end
--PATH lua/entities/applejuice/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Apple Juice"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A small carton of apple juice"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/juicesmall.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/banque_item_sl/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	if string.len(string.Trim("Banque")) < 1 then return end

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
			draw.SimpleText("Banque","DermaLarge",0,-40, white , 1 , 1) 
		cam.End3D2D() 
	end
end
--PATH lua/entities/bdcake/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Birthday Cake"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A birthday cake"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cake.mdl")
	
end
--PATH lua/entities/bdcake2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Birthday Cake"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A birthday cake"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cake_b.mdl")
	
end
--PATH lua/entities/beer2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Stoltz)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beer_stoltz.mdl")
	
end
--PATH lua/entities/beercan3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Hop Knot)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beercan03.mdl")
	
end
--PATH lua/entities/cabbage1/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/cabbage1.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/coiffeur_sl/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Coiffeur"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH gamemodes/mangarp/entities/entities/darkrp_billboard/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "DarkRP billboard"
ENT.Instructions = "Shows advertisements."
ENT.Author = "FPtje"

ENT.Spawnable = false
ENT.Editable = true
ENT.IsDarkRPBillboard = true

cleanup.Register("advert_billboards")

function ENT:SetupDataTables()
    self:NetworkVar("String", 0, "TopText", {
        KeyName = "toptext",
        Edit = {
            type = "Generic",
            title = "Top text",
            category = "Text",
            order = 0
        }
    })

    self:NetworkVar("String", 1, "BottomText", {
        KeyName = "bottomtext",
        Edit = {
            type = "Generic",
            title = "Bottom text",
            category = "Text",
            order = 1
        }
    })

    self:NetworkVar("Vector", 0, "BackgroundColor", {
        KeyName = "backgroundcolor",
        Edit = {
            type = "VectorColor",
            title = "Background color",
            category = "Color",
            order = 0
        }
    })

    self:NetworkVar("Vector", 1, "BarColor", {
        KeyName = "barcolor",
        Edit = {
            type = "VectorColor",
            title = "Top bar color",
            category = "Color",
            order = 1
        }
    })
end

DarkRP.declareChatCommand{
    command = "advert",
    description = "Create a billboard holding an advertisement.",
    delay = 1.5
}

DarkRP.hookStub{
    name = "canAdvert",
    description = "Whether someone can place an advertisement billboard.",
    parameters = {
        {
            name = "player",
            description = "The player trying to advertise.",
            type = "Player"
        },
        {
            name = "arguments",
            description = "The advertisement itself.",
            type = "table"
        }
    },
    returns = {
        {
            name = "canAdvert",
            description = "A yes or no as to whether the player can place the billboard.",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when they can't place the billboard.",
            type = "string"
        }
    },
    realm = "Server"
}

DarkRP.hookStub{
    name = "playerAdverted",
    description = "Called when a player placed an advertisement billboard.",
    parameters = {
        {
            name = "player",
            description = "The player.",
            type = "Player"
        },
        {
            name = "arguments",
            description = "The advertisement itself.",
            type = "string"
        },
        {
            name = "entity",
            description = "The placed advertisement billboard.",
            type = "Entity"
        }
    },
    returns = {},
    realm = "Server"
}

--PATH gamemodes/mangarp/entities/entities/darkrp_cheque/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cheque"
ENT.Author = "Eusion"
ENT.Spawnable = false
ENT.IsDarkRPCheque = true

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
    self:NetworkVar("Entity", 1, "recipient")
    self:NetworkVar("Int", 0, "amount")
end

--PATH addons/the_perfect_training_system/lua/entities/diablos_turnstile_trigger/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end


--PATH addons/the_perfect_training_system/lua/entities/diablos_weigh_television/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()

	local ply = LocalPlayer()

	if ply:GetPos():DistToSqr(self:GetPos()) > Diablos.TS.Optimization * 500 then return end

	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 90)

	local activePly = self:GetActivePlayer()

	cam.Start3D2D(self:GetPos() + self:GetUp() * 12.2 + self:GetRight() * -22.2 + self:GetForward() * -0.5, ang, .05)
		local w = 890
		local h = 495
		surface.SetDrawColor(color_white) surface.DrawRect(0, 0, w, h)

		local SIZE_MATERIAL = 100

		surface.SetDrawColor(color_white)

		surface.SetMaterial(Diablos.TS.Materials.attackSpeed)
		surface.DrawTexturedRect(w - SIZE_MATERIAL - 5, 5, SIZE_MATERIAL, SIZE_MATERIAL)

		surface.SetMaterial(Diablos.TS.Materials.treadmill)
		surface.DrawTexturedRect(5, h - SIZE_MATERIAL - 5, SIZE_MATERIAL, SIZE_MATERIAL)

		surface.SetMaterial(Diablos.TS.Materials.strength)
		surface.DrawTexturedRect(w - SIZE_MATERIAL - 5, h - SIZE_MATERIAL - 5, SIZE_MATERIAL, SIZE_MATERIAL)


		if Diablos.TS.Materials["GUILogoName"] then
			surface.SetDrawColor(color_white)
			surface.SetMaterial(Diablos.TS.Materials["GUILogo"])
			surface.DrawTexturedRect(5, 5, SIZE_MATERIAL, SIZE_MATERIAL)
		end


		if IsValid(activePly) then
			if activePly == ply then
				local useColor
				if ply.trainingDerma then
					useColor = color_black
				else
					useColor = Color(0, 0, 0, math.abs(math.cos(CurTime()) * 255))
				end

				local fontToUse = "Diablos:Font:TS:60"
				surface.SetFont(fontToUse)
				local sizex = surface.GetTextSize(Diablos.TS:GetLanguageString("weighBalanceUse"))
				if sizex > 900 then
					fontToUse = "Diablos:Font:TS:50"
				end

				draw.SimpleText(Diablos.TS:GetLanguageString("weighBalanceUse"), fontToUse, w / 2, h / 2, useColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText(Diablos.TS:GetLanguageString("weighBalanceCantSee"), "Diablos:Font:TS:60", w / 2, h / 2, Diablos.TS.Colors.bl, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		else
			draw.SimpleText(Diablos.TS:GetLanguageString("weighBalanceTipL1"), "Diablos:Font:TS:60", w / 2, h / 2 - h / 5, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(Diablos.TS:GetLanguageString("weighBalanceTipL2"), "Diablos:Font:TS:60", w / 2, h / 2, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(Diablos.TS:GetLanguageString("weighBalanceTipL3"), "Diablos:Font:TS:60", w / 2, h / 2 + h / 5, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	cam.End3D2D()
end

function ENT:DrawTranslucent()

end
--PATH lua/entities/drgbase_nextbot/status.lua:

-- Getters/setters --

function ENT:GetHealthRegen()
	return self:GetNW2Float("DrGBaseHealthRegen", 0)
end

function ENT:GetScale()
	return self:GetNW2Float("DrGBaseScale", 1)
end

function ENT:IsDown()
	return self:GetNW2Bool("DrGBaseDown")
end
function ENT:IsDowned()
	return self:IsDown()
end
function ENT:IsDying()
	return self:GetNW2Bool("DrGBaseDying")
end
function ENT:IsDead()
	return self:GetNW2Bool("DrGBaseDead") or self:IsDying()
end

function ENT:IsAlive()
	return not self:IsDead()
end
function ENT:Alive()
	return self:IsAlive()
end

function ENT:GetDowned()
	return self:GetNW2Int("DrGBaseDowned")
end

function ENT:GetGodMode()
	return self:GetNW2Bool("DrGBaseGodMode")
end

-- Functions --

-- Hooks --

-- Handlers --

if SERVER then

	-- Getters/setters --

	function ENT:SetHealthRegen(regen)
		self:SetNW2Float("DrGBaseHealthRegen", regen)
	end

	function ENT:SetScale(scale, delta)
		self:SetNW2Float("DrGBaseScale", scale)
		self:SetModelScale(self.ModelScale*scale, delta)
		self:PhysicsInitShadow()
		self:UpdateSpeed()
	end
	function ENT:Scale(mult, delta)
		self:SetScale(self:GetScale()*mult, delta)
	end

	function ENT:SetGodMode(god)
		return self:SetNW2Bool("DrGBaseGodMode", god)
	end
	function ENT:EnableGodMode()
		self:SetGodMode(true)
	end
	function ENT:DisableGodMode()
		self:SetGodMode(false)
	end

	-- Functions --

	function ENT:RegenHealth(health, duration, callback)
		if self:Health() >= health then return end
		if health > self:GetMaxHealth() then health = self:GetMaxHealth() end
		if duration > 0 then
			local regen = (health - self:Health())/duration
			local oldRegen = self:GetHealthRegen()
			self:SetHealthRegen(regen)
			while math.Round(self:Health()) < math.Round(health) do
				if isfunction(callback) and callback(self, self:Health()) then break end
				self:YieldCoroutine(false)
			end
			self:SetHealthRegen(oldRegen)
		else self:SetHealth(health) end
	end

	function ENT:AddHealth(health)
		self:SetHealth(self:Health()+health, true)
	end
	function ENT:RemoveHealth(health)
		self:SetHealth(self:Health()-health, true)
	end

	function ENT:ScaleHealth(scale)
		scale = math.Clamp(scale, 0, math.huge)
		self:SetHealth(self:Health()*scale)
		self:SetMaxHealth(self:GetMaxHealth()*scale)
	end

	-- Hooks --

	-- Handlers --

	function ENT:_RegenHealth()
		if self:IsDead() then return end
		local regen = self:GetHealthRegen()
		if regen > 0 then
			self:AddHealth(regen)
		elseif regen < 0 then
			local dmg = DamageInfo()
			dmg:SetDamage(regen)
			dmg:SetAttacker(self)
			dmg:SetInflictor(self)
			dmg:SetDamageType(DMG_DIRECT)
			self:TakeDamageInfo(dmg)
		end
	end

	function ENT:_UpdateHealth()
		local health = self:Health()
		local oldHealth = self:GetNW2Int("DrGBaseHealth")
		if oldHealth ~= health then
			self:OnHealthChange(oldHealth, health)
			self:SetNW2Int("DrGBaseHealth", health)
		end
	end
	function ENT:_UpdateMaxHealth()
		local maxHealth = self:GetMaxHealth()
		if self:GetNW2Int("DrGBaseMaxHealth") ~= maxHealth then
			self:SetNW2Int("DrGBaseMaxHealth", maxHealth)
		end
	end

	-- Meta --

	local entMETA = FindMetaTable("Entity")

	local old_SetHealth = entMETA.SetHealth
	function entMETA:SetHealth(health, clamp)
		if self.IsDrGNextbot then
			if self:IsDead() then return end
			if not clamp then
				local res = old_SetHealth(self, health)
				self:_UpdateHealth()
				return res
			else return self:SetHealth(math.Clamp(health, 0, self:GetMaxHealth()), false) end
		else return old_SetHealth(self, health) end
	end

	local old_SetMaxHealth = entMETA.SetMaxHealth
	function entMETA:SetMaxHealth(maxHealth)
		if self.IsDrGNextbot then
			local res = old_SetMaxHealth(self, maxHealth)
			self:_UpdateMaxHealth()
			return res
		else return old_SetMaxHealth(self, maxHealth) end
	end

else

	-- Getters/setters --

	-- Functions --

	-- Hooks --

	-- Handlers --

	-- Meta --

	local entMETA = FindMetaTable("Entity")

	local old_Health = entMETA.Health
	function entMETA:Health()
		if self.IsDrGNextbot then
			return self:GetNW2Int("DrGBaseHealth", old_Health(self))
		else return old_Health(self) end
	end

	local old_GetMaxHealth = entMETA.GetMaxHealth
	function entMETA:GetMaxHealth()
		if self.IsDrGNextbot then
			return self:GetNW2Int("DrGBaseMaxHealth", old_GetMaxHealth(self))
		else return old_GetMaxHealth(self) end
	end

	local old_OnGround = entMETA.OnGround
	function entMETA:OnGround()
		if self.IsDrGNextbot then
			return self:GetNW2Bool("DrGBaseOnGround")
		else return old_OnGround(self) end
	end

	local old_IsOnGround = entMETA.IsOnGround
	function entMETA:IsOnGround()
		if self.IsDrGNextbot then
			return self:OnGround()
		else return old_IsOnGround(self) end
	end

end

--PATH lua/entities/drgbase_nextbot/patrol.lua:

-- Getters/setters --

-- Functions --

-- Hooks --

-- Handlers --

function ENT:_InitPatrol()
	if CLIENT then return end
	self._DrGBaseAddedPatrols = {}
end

if SERVER then

	-- Patrol class --

	local Patrol = {}
	Patrol.__index = Patrol
	function Patrol:New(type)
		local patrol = {}
		patrol._type = type
		patrol._time = CurTime()
		setmetatable(patrol, self)
		return patrol
	end
	function Patrol:GetType()
		return self._type
	end
	function Patrol:GetTime()
		return self._time
	end
	function Patrol:FetchPos()
		return Vector(0, 0, 0)
	end
	function Patrol:ShouldRun()
		return false
	end
	function Patrol:IsValid()
		return true
	end
	function Patrol:OnAdded() end
	function Patrol:OnRemoved() end
	function Patrol:OnReached() end
	function Patrol:OnUnreachable() end
	function Patrol:__tostring()
		return "Patrol"
	end

	function DrGBase.Patrol(type)
		if not isnumber(type) then return end
		local PatrolType = Patrol:New(type)
		PatrolType.__index = PatrolType
		return PatrolType
	end

	local PatrolPos = DrGBase.Patrol(PATROL_POS)
	function PatrolPos:New(pos, run)
		local patrol = {}
		patrol._pos = pos
		patrol._run = run
		setmetatable(patrol, self)
		return patrol
	end
	function PatrolPos:FetchPos()
		return self._pos
	end
	function PatrolPos:ShouldRun()
		return self._run or false
	end
	function PatrolPos:__tostring()
		return "PatrolPos ["..self:FetchPos():DrG_ToString(2).."]"
	end

	local PatrolSound = DrGBase.Patrol(PATROL_SOUND)
	function PatrolSound:New(sound)
		local patrol = {}
		patrol._sound = sound
		setmetatable(patrol, self)
		return patrol
	end
	function PatrolSound:FetchPos()
		return self:GetSound().Pos
	end
	function PatrolSound:GetSound()
		return self._sound
	end
	function PatrolSound:ShouldRun()
		return self:GetSound().Channel == CHAN_WEAPON
	end
	function PatrolSound:OnAdded(nextbot)
		if nextbot._DrGBasePatrolSound then
			local selfSound = self:GetSound()
			local oldSound = nextbot._DrGBasePatrolSound:GetSound()
			if oldSound.Channel == CHAN_WEAPON and selfSound.Channel ~= CHAN_WEAPON then return false end
			local selfDist = math.pow(selfSound.SoundLevel/2, 2)*selfSound.Volume
			local oldDist = math.pow(oldSound.SoundLevel/2, 2)*oldSound.Volume
			if oldDist > selfDist then return false end
			nextbot:RemovePatrol(nextbot._DrGBasePatrolSound)
		end
		nextbot._DrGBasePatrolSound = self
	end
	function PatrolSound:OnRemoved(nextbot)
		nextbot._DrGBasePatrolSound = nil
	end
	function PatrolSound:__tostring()
		return "PatrolSound ["..tostring(self:GetSound().Entity).."]"
	end

	local PatrolSearch = DrGBase.Patrol(PATROL_SEARCH)
	function PatrolSearch:New(enemy)
		if not IsValid(enemy) then return end
		local patrol = {}
		patrol._enemy = enemy
		patrol._pos = ent:GetPos()
		setmetatable(patrol, self)
		return patrol
	end
	function PatrolSearch:FetchPos()
		return self._pos
	end
	function PatrolSearch:GetEnemy()
		return self._ent
	end
	function PatrolSearch:ShouldRun(nextbot)
		return not nextbot:VisibleVec(self:FetchPos())
	end
	function PatrolSearch:IsValid(nextbot)
		local ent = self:GetEnemy()
		return IsValid(ent) and nextbot:IsEnemy(ent)
	end
	function PatrolSearch:__tostring()
		return "PatrolSearch ["..tostring(self:GetEnemy()).."]"
	end

	-- Getters/setters --

	function ENT:AddPatrol(patrol)
		if not patrol:IsValid(self) then return false end
		if self:HasPatrol(patrol) then return true end
		if patrol:OnAdded(self) == false then return false end
		self._DrGBaseAddedPatrols[patrol] = true
		self:SortPatrols()
		return true
	end
	function ENT:AddPatrolPos(pos, run)
		return self:AddPatrol(PatrolPos:New(pos, run))
	end
	function ENT:AddPatrolSound(sound)
		return self:AddPatrol(PatrolSound:New(sound))
	end
	function ENT:AddPatrolSearch(enemy)
		return self:AddPatrol(PatrolSearch:New(enemy))
	end

	function ENT:RemovePatrol(patrol)
		if not self:HasPatrol(patrol) then return false end
		self._DrGBaseAddedPatrols[patrol] = nil
		if patrol == self._DrGBasePatrol then
			self:SortPatrols()
		end
		patrol:OnRemoved(self)
		return true
	end

	function ENT:GetPatrol()
		local patrol = self._DrGBasePatrol
		if patrol == nil then return nil end
		if not patrol:IsValid(self) then
			self:RemovePatrol(patrol)
			self:SortPatrols()
			return self:GetPatrol()
		else return patrol end
	end
	function ENT:HasPatrol(patrol)
		if patrol then
			return self._DrGBaseAddedPatrols[patrol] or false
		else
			patrol = self:GetPatrol()
			if patrol == nil then return false end
			return patrol:IsValid(self)
		end
	end

	function ENT:SortPatrols()
		local added, patrol = table.DrG_Fetch(self._DrGBaseAddedPatrols, function(added1, added2, patrol1, patrol2)
			if patrol1:IsValid(self) and not patrol2:IsValid(self) then return true end
			if not patrol1:IsValid(self) and patrol2:IsValid(self) then return false end
			local res = self:OnSortPatrols(patrol1, patrol2)
			if isbool(res) then return res end
			local type1, type2 = patrol1:GetType(), patrol2:GetType()
			if type1 == type2 then
				return patrol1:GetTime() < patrol2:GetTime()
			else return type1 > type2 end
		end)
		self._DrGBasePatrol = patrol
	end
	function ENT:ClearPatrols()
		for patrol, added in pairs(self._DrGBaseAddedPatrols) do
			if added then self:RemovePatrol(patrol) end
		end
	end

	-- Functions --




	-- Hooks --

	function ENT:OnSortPatrols(patrol1, patrol2) end

	-- Handlers --

else

	-- Getters/setters --

	-- Functions --

	-- Hooks --

	-- Handlers --

end

--PATH lua/entities/drgbase_nextbot/path.lua:
if CLIENT then return end

-- Handlers --

function ENT:_InitPath()
	self._DrGBaseNavAreaBlacklist = {}
end

-- Getters/setters --

function ENT:GetPath()
	if not self._DrGBasePath then
		self._DrGBasePath = Path("Follow")
		self._DrGBasePath:SetMinLookAheadDistance(300)
		return self._DrGBasePath
	else return self._DrGBasePath end
end

function ENT:LastComputeSuccess()
	return self._DrGBaseLastComputeSuccess or false
end
function ENT:LastComputeTime()
	local path = self:GetPath()
	if not IsValid(path) then return -1 end
	return CurTime()-path:GetAge()
end

-- Functions --

function ENT:InvalidatePath()
	local path = self:GetPath()
	if not IsValid(path) then return end
	return path:Invalidate()
end

function ENT:DrawPath()
	local path = self:GetPath()
	if not IsValid(path) then return end
	return path:Draw()
end

function ENT:UpdatePath()
	local path = self:GetPath()
	if not IsValid(path) then return end
	return path:Update(self)
end

function ENT:ComputePath(pos, generator)
	local path = self:GetPath()
	if not IsValid(path) then return end
	return path:Compute(self, pos, generator)
end

function ENT:RefreshPath(generator)
	local path = self:GetPath()
	if not IsValid(path) then return end
	return path:Compute(self, path:GetEnd(), generator)
end

function ENT:BlacklistNavArea(area, blacklist)
	self._DrGBaseNavAreaBlacklist[area:GetID()] = tobool(blacklist)
end
function ENT:IsNavAreaBlacklisted(area)
	return self._DrGBaseNavAreaBlacklist[area:GetID()] or false
end
function ENT:BlacklistedNavAreas()
	local areas = {}
	for id, blacklisted in pairs(self._DrGBaseNavAreaBlacklist) do
		if blacklisted then table.insert(areas, navmesh.GetNavAreaByID(id)) end
	end
	return areas
end

function ENT:GetPathGenerator()
	return function(area, fromArea, ladder, elevator, length)
		if not IsValid(fromArea) then return 0 end
		if self:IsNavAreaBlacklisted(area) then return -1 end
		if not self.loco:IsAreaTraversable(area) then return -1 end
		local dist = 0
		if IsValid(ladder) then
			if not self.ClimbLadders then return -1 end
			dist = ladder:GetLength()
		elseif length > 0 then dist = length
		else dist = fromArea:GetCenter():Distance(area:GetCenter()) end
		local cost = fromArea:GetCostSoFar() + dist
		if IsValid(ladder) then
			local height = ladder:GetTop().z - ladder:GetBottom().z
			if ladder:GetBottomArea() == fromArea then
				if not self.ClimbLaddersUp then return -1 end
				if height < self.ClimbLaddersUpMinHeight then return -1 end
				if height > self.ClimbLaddersUpMaxHeight then return -1 end
				local res = self:OnComputePathLadderUp(fromArea, area, ladder)
				if res >= 0 then cost = cost + dist * res else return -1 end
			else
				local drop = -height
				if not self.ClimbLaddersDown then return -1 end
				if drop < self.ClimbLaddersDownMinHeight then return -1 end
				if drop > self.ClimbLaddersDownMaxHeight then return -1 end
				local res = self:OnComputePathLadderDown(fromArea, area, ladder)
				if res >= 0 then cost = cost + dist * res else return -1 end
			end
		else
			local height = fromArea:ComputeAdjacentConnectionHeightChange(area)
			if height > 0 then
				if height < self.loco:GetStepHeight() then
					local res = self:OnComputePathStep(fromArea, area, height)
					if res >= 0 then cost = cost + dist * res else return -1 end
				elseif self.ClimbLedges then
					if height < self.ClimbLedgesMinHeight then return -1 end
					if height > self.ClimbLedgesMaxHeight then return -1 end
					local res = self:OnComputePathLedge(fromArea, area, height)
					if res >= 0 then cost = cost + dist * res else return -1 end
				else return -1 end
			elseif height < 0 then
				local drop = -height
				if drop < self.loco:GetDeathDropHeight() then
					local res = self:OnComputePathDrop(fromArea, area, drop)
					if res >= 0 then cost = cost + dist * res else return -1 end
				else return -1 end
			else
				local res = self:OnComputePathFlat(fromArea, area)
				if res >= 0 then cost = cost + dist * res else return -1 end
			end
			if area:IsUnderwater() then
				local res = self:OnComputePathUnderwater(fromArea, area)
				if res >= 0 then cost = cost + dist * res else return -1 end
			end
			local res = self:OnComputePath(fromArea, area)
			if res >= 0 then return cost + dist * res else return -1 end
		end
	end
end

-- Hooks --

function ENT:OnComputePath(from, to) return 0 end
function ENT:OnComputePathLadderUp(from, to, ladder) return 1 end
function ENT:OnComputePathLadderDown(from, to, ladder) return 1 end
function ENT:OnComputePathLedge(from, to, height) return 1 end
function ENT:OnComputePathStep(from, to, height) return 0 end
function ENT:OnComputePathJump(from, to, height) return 1 end
function ENT:OnComputePathDrop(from, to, drop) return 1 end
function ENT:OnComputePathFlat(from, to) return 0 end
function ENT:OnComputePathUnderwater(from, to) return 1 end

-- Meta --

local pathMETA = FindMetaTable("PathFollower")

DrGBase.OLD_Compute = DrGBase.OLD_Compute or pathMETA.Compute
function pathMETA:Compute(nextbot, pos, generator)
	if nextbot.IsDrGNextbot then
		--print(nextbot, "=> compute", CurTime())
		if not isfunction(generator) then generator = nextbot:GetPathGenerator() end
		nextbot._DrGBaseLastComputeSuccess = DrGBase.OLD_Compute(self, nextbot, pos, generator)
		return nextbot._DrGBaseLastComputeSuccess
	else return DrGBase.OLD_Compute(self, nextbot, pos, generator) end
end

--PATH lua/entities/drgbase_nextbot/movements.lua:

-- Convars --

local ComputeDelay = CreateConVar("drgbase_compute_delay", "0.1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local AvoidObstacles = CreateConVar("drgbase_avoid_obstacles", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local MultSpeed = CreateConVar("drgbase_multiplier_speed", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

-- Getters/setters --

function ENT:GetSpeed()
	return self:GetNW2Float("DrGBaseSpeed")
end

function ENT:Speed(scale)
	local speed = self:GetVelocity():Length()
	if scale then return speed/self:GetScale()
	else return speed end
end
function ENT:SpeedSqr(scale)
	if not scale then return self:GetVelocity():LengthSqr()
	else return (self:GetVelocity()/self:GetScale()):LengthSqr() end
end
function ENT:IsSpeedMore(speed, scale)
	return speed^2 < self:SpeedSqr(scale)
end
function ENT:IsSpeedLess(speed, scale)
	return speed^2 > self:SpeedSqr(scale)
end
function ENT:IsSpeedEqual(speed, scale)
	return speed^2 == self:SpeedSqr(scale)
end
function ENT:IsSpeedMoreEqual(speed, scale)
	return self:IsSpeedEqual(speed, scale) or self:IsSpeedMore(speed, scale)
end
function ENT:IsSpeedLessEqual(speed, scale)
	return self:IsSpeedEqual(speed, scale) or self:IsSpeedLess(speed, scale)
end

function ENT:GetMovement(ignoreZ)
	if not self:IsMoving() then return Vector(0, 0, 0) end
	local dir = self:GetVelocity()
	if ignoreZ then dir.z = 0 end
	return (self:GetAngles()-dir:Angle()):Forward()
end

function ENT:IsMoving()
	return not self:GetVelocity():IsZero()
end
function ENT:IsMovingUp()
	return math.Round(self:GetMovement().z) > 0
end
function ENT:IsMovingDown()
	return math.Round(self:GetMovement().z) < 0
end
function ENT:IsMovingForward()
	return math.Round(self:GetMovement().x) > 0
end
function ENT:IsMovingBackward()
	return math.Round(self:GetMovement().x) < 0
end
function ENT:IsMovingRight()
	return math.Round(self:GetMovement().y) > 0
end
function ENT:IsMovingLeft()
	return math.Round(self:GetMovement().y) < 0
end
function ENT:IsMovingForwardLeft()
	return self:IsMovingForward() and self:IsMovingLeft()
end
function ENT:IsMovingForwardRight()
	return self:IsMovingForward() and self:IsMovingRight()
end
function ENT:IsMovingBackwardLeft()
	return self:IsMovingBackward() and self:IsMovingLeft()
end
function ENT:IsMovingBackwardRight()
	return self:IsMovingBackward() and self:IsMovingRight()
end

function ENT:IsTurning(prec)
	return math.Round(self:GetAngles().y, prec) ~= math.Round(self._DrGBaseLastAngle.y, prec)
end
function ENT:IsTurningLeft(prec)
	if not self:IsTurning(prec) then return false end
	return math.AngleDifference(self:GetAngles().y, self._DrGBaseLastAngle.y) > 0
end
function ENT:IsTurningRight(prec)
	if not self:IsTurning(prec) then return false end
	return math.AngleDifference(self:GetAngles().y, self._DrGBaseLastAngle.y) < 0
end

function ENT:IsClimbing()
	return self:GetNW2Bool("DrGBaseClimbing")
end
function ENT:IsClimbingUp()
	return self:IsClimbing() and not self:IsClimbingDown()
end
function ENT:IsClimbingDown()
	return self:IsClimbing() and self:GetNW2Bool("DrGBaseClimbingDown")
end

-- Functions --

-- Hooks --

-- Handlers --

function ENT:_InitMovements()
	self._DrGBaseLastAngle = self:GetAngles()
end

function ENT:_HandleMovements()
	local angles = self:GetAngles()
	self:Timer(0.1, function()
		self._DrGBaseLastAngle = angles
	end)
end

if SERVER then

	-- Getters/setters --

	function ENT:SetSpeed(speed)
		self.loco:SetDesiredSpeed(speed*self:GetScale())
	end

	function ENT:IsRunning()
		if self:IsMoving() then
			local run = false
			if self:IsPossessed() then
				run = self:GetPossessor():KeyDown(IN_SPEED)
			else run = self:ShouldRun() end
			return run
		else return false end
	end

	function ENT:IsClimbingLadder(ladder)
		if IsValid(ladder) then
			return self:IsClimbingLadder() and ladder == self._DrGBaseClimbLadder
		else
			if not self:IsClimbing() then return false end
			return IsValid(self._DrGBaseClimbLadder), self._DrGBaseClimbLadder
		end
	end
	function ENT:IsClimbingLedge()
		return self:IsClimbing() and not IsValid(self._DrGBaseClimbLadder)
	end

	-- Functions --

	function ENT:Approach(pos, nb)
		if isentity(pos) then pos = pos:GetPos() end
		self.loco:Approach(pos, nb or 1)
	end
	function ENT:FaceTowards(pos)
		if isentity(pos) then pos = pos:GetPos() end
		self.loco:FaceTowards(pos)
	end
	function ENT:FaceInstant(pos)
		if isentity(pos) then pos = pos:GetPos() end
		local angle = (pos - self:GetPos()):Angle()
		self:SetAngles(Angle(0, angle.y, 0))
	end
	function ENT:FaceTo(toface)
		while true do
			local pos = toface
			if isentity(pos) then
				if not IsValid(pos) then return end
				pos = pos:GetPos()
			end
			local angle = (pos - self:GetPos()):Angle()
			if math.NormalizeAngle(math.Round(self:GetAngles().y)) == math.NormalizeAngle(math.Round(angle.y)) then return end
			self:FaceTowards(pos)
			self:YieldCoroutine(true)
		end
	end
	function ENT:FaceEnemy()
		if self:HasEnemy() then self:FaceTowards(self:GetEnemy()) end
	end

	function ENT:MoveTowards(pos)
		if isentity(pos) then pos = pos:GetPos() end
		self:FaceTowards(pos)
		self:Approach(pos)
	end
	function ENT:MoveAwayFrom(pos, face)
		if isentity(pos) then pos = pos:GetPos() end
		local away = self:GetPos()*2 - pos
		if face then
			self:FaceTowards(pos)
			self:Approach(away)
		else self:MoveTowards(away) end
	end

	function ENT:MoveForward(dist, callback)
		if not isnumber(dist) then
			self:Approach(self:GetPos() + self:GetForward())
		elseif dist > 0 then
			local start = self:GetPos()
			while self:GetRangeSquaredTo(start) < dist^2 do
				self:MoveForward()
				if isfunction(callback) and callback(self, self:GetRangeTo(start)) then return end
				self:YieldCoroutine(true)
			end
		end
	end
	function ENT:MoveBackward(dist, callback)
		if not isnumber(dist) then
			self:Approach(self:GetPos() - self:GetForward())
		elseif dist > 0 then
			local start = self:GetPos()
			while self:GetRangeSquaredTo(start) < dist^2 do
				self:MoveBackward()
				if isfunction(callback) and callback(self, self:GetRangeTo(start)) then return end
				self:YieldCoroutine(true)
			end
		end
	end
	function ENT:MoveRight(dist, callback)
		if not isnumber(dist) then
			self:Approach(self:GetPos() + self:GetRight())
		elseif dist > 0 then
			local start = self:GetPos()
			while self:GetRangeSquaredTo(start) < dist^2 do
				self:MoveRight()
				if isfunction(callback) and callback(self, self:GetRangeTo(start)) then return end
				self:YieldCoroutine(true)
			end
		end
	end
	function ENT:MoveLeft(dist, callback)
		if not isnumber(dist) then
			self:Approach(self:GetPos() - self:GetRight())
		elseif dist > 0 then
			local start = self:GetPos()
			while self:GetRangeSquaredTo(start) < dist^2 do
				self:MoveLeft()
				if isfunction(callback) and callback(self, self:GetRangeTo(start)) then return end
				self:YieldCoroutine(true)
			end
		end
	end

	function ENT:TurnRight(angle, callback)
		if not isnumber(angle) then
			self:FaceTowards(self:GetPos() + self:GetRight())
		elseif angle > 0 then
			local turned = 0
			local last = self:GetAngles()
			local forward = self:GetForward()
			forward:Rotate(Angle(0, -angle, 0))
			while math.Round(turned) < angle do
				if angle - turned < 180 then
					self:FaceTowards(self:GetPos() + forward)
				else self:TurnRight() end
				turned = turned + math.AngleDifference(last.y, self:GetAngles().y)
				if isfunction(callback) and callback(self, turned) then return end
				last = self:GetAngles()
				self:YieldCoroutine(true)
			end
		end
	end
	function ENT:TurnLeft(angle, callback)
		if not isnumber(angle) then
			self:FaceTowards(self:GetPos() - self:GetRight())
		elseif angle > 0 then
			if angle <= 0 then return end
			local turned = 0
			local last = self:GetAngles()
			local forward = self:GetForward()
			forward:Rotate(Angle(0, angle, 0))
			while math.Round(turned) < angle do
				if angle - turned < 180 then
					self:FaceTowards(self:GetPos() + forward)
				else self:TurnLeft() end
				turned = turned - math.AngleDifference(last.y, self:GetAngles().y)
				if isfunction(callback) and callback(self, turned) then return end
				last = self:GetAngles()
				self:YieldCoroutine(true)
			end
		end
	end

	-- Coroutine --

	local function ShouldCompute(self, path, pos)
		if not IsValid(path) then return true end
		local segments = #path:GetAllSegments()
		if path:GetAge() >= ComputeDelay:GetFloat()*segments then
			return path:GetEnd():DistToSqr(pos) > path:GetGoalTolerance()^2
		else return false end
	end
	function ENT:FollowPath(pos, tolerance, generator)
		if isentity(pos) then
			if not IsValid(pos) then return "unreachable" end
			if pos:GetClass() == "npc_barnacle" then
				pos = util.DrG_TraceLine({
					start = pos:GetPos(), endpos = pos:GetPos()-Vector(0, 0, 999999),
					collisiongroup = COLLISION_GROUP_DEBRIS
				}).HitPos
			else pos = pos:GetPos() end
		end
		tolerance = isnumber(tolerance) and tolerance or 20
		if navmesh.IsLoaded() and self:GetGroundEntity():IsWorld() then
			local path = self:GetPath()
			path:SetGoalTolerance(tolerance)
			local area = navmesh.GetNearestNavArea(pos)
			if IsValid(area) then pos = area:GetClosestPointOnArea(pos) or pos end
			if not IsValid(path) and
			self:GetRangeSquaredTo(pos) <= path:GetGoalTolerance()^2 then return "reached" end
			if ShouldCompute(self, path, pos) then path:Compute(self, pos, generator) end
			if not IsValid(path) then return "unreachable" end
			local current = path:GetCurrentGoal()
			local ledge = self:FindLedge(current.type ~= 2)
			if isvector(ledge) then
				self:ClimbLedge(ledge)
				path:Invalidate()
				return "ledge", ledge
			elseif current.type == 2 and
			self:GetRangeTo(current.pos) <= path:GetGoalTolerance() then
				if not self:AvoidObstacles(true) then
					self:MoveTowards(path:NextSegment().pos)
					if self.loco:IsStuck() then
						self:HandleStuck()
						return "stuck"
					else return "moving" end
				else return "obstacle" end
			elseif current.type == 4 then
				local ladder = current.ladder
				if not self.ClimbLaddersUp then return "unreachable" end
				if self:GetHullRangeSquaredTo(ladder:GetBottom()) < self.LaddersUpDistance^2 then
					self:ClimbLadderUp(ladder)
					path:Invalidate()
					return "ladder_up", ladder
				elseif not self:AvoidObstacles(true) then
					self:MoveTowards(current.pos)
					return "moving", ladder
				else return "obstacle" end
			elseif current.type == 5 then
				local ladder = current.ladder
				if not self.ClimbLaddersDown then
					local drop = ladder:GetTop().z - ladder:GetBottom().z
					if drop <= self.loco:GetDeathDropHeight() then
						if not self:AvoidObstacles(true) then
							self:MoveTowards(self:GetPos() + current.forward)
							if self.loco:IsStuck() then
								self:HandleStuck()
								return "stuck", ladder
							else return "moving", ladder end
						else return "obstacle" end
					else return "unreachable" end
				elseif self:GetHullRangeSquaredTo(ladder:GetTop()) < self.LaddersDownDistance^2 then
					self:ClimbLadderDown(ladder)
					path:Invalidate()
					return "ladder_down", ladder
				elseif not self:AvoidObstacles(true) then
					self:MoveTowards(current.pos)
					if self.loco:IsStuck() then
						self:HandleStuck()
						return "stuck", ladder
					else return "moving", ladder end
				else return "obstacle" end
			elseif not self:LastComputeSuccess() and
			path:GetCurrentGoal().distanceFromStart == path:LastSegment().distanceFromStart then
				return "unreachable"
			elseif not self:AvoidObstacles(true) then
				path:Update(self)
				if not IsValid(path) then return "reached"
				elseif self.loco:IsStuck() then
					self:HandleStuck()
					return "stuck"
				else return "moving" end
			else return "obstacle" end
		else
			local ledge = self:FindLedge()
			if isvector(ledge) then
				self:ClimbLedge(ledge)
				self:InvalidatePath()
				return "ledge", ledge
			elseif not self:AvoidObstacles(true) then
				if self:GetRangeSquaredTo(pos) > tolerance^2 then
					self:MoveTowards(pos)
					if self.loco:IsStuck() then
						self:HandleStuck()
						return "stuck"
					else return "moving" end
				else return "reached" end
			else return "obstacle" end
		end
	end

	function ENT:GoTo(pos, tolerance, callback)
		if isentity(pos) then pos = pos:GetPos() end
		if not isfunction(callback) then callback = function() end end
		while true do
			local res = self:FollowPath(pos, tolerance)
			if res == "reached" then return true
			elseif res == "unreachable" then
				return false
			else
				res = callback(self, self:GetPath())
				if isbool(res) then return res end
				self:YieldCoroutine(true)
			end
		end
	end

	function ENT:ChaseEntity(ent, tolerance, callback)
		if not isentity(ent) then return false end
		if not isfunction(callback) then callback = function() end end
		while IsValid(ent) do
			local res = self:FollowPath(ent, tolerance)
			if res == "reached" then return true
			elseif res == "unreachable" then
				return false
			else
				res = callback(self, self:GetPath())
				if isbool(res) then return res end
				self:YieldCoroutine(true)
			end
		end
		return false
	end

	-- Climbing --

	-- Ladders
	function ENT:ClimbLadder(ladder, down, callback)
		if self:IsClimbing() then return end
		local height = math.abs(ladder:GetTop().z - ladder:GetBottom().z)
		local res = self:OnStartClimbing(ladder, height, down)
		if res == false then return end
		self:SetNW2Bool("DrGBaseClimbing", true)
		self:SetNW2Bool("DrGBaseClimbingDown", down)
		self._DrGBaseClimbLadder = ladder
		if res ~= true then
			local offset = self:CalcOffset(self.ClimbOffset)*self:GetScale()
			offset.z = 0
			local lastHeight = self:GetPos().z
			local lastTime = CurTime()
			while true do
				self:FaceTowards(self:GetPos() - ladder:GetNormal())
				local pos
				if down then
					pos = ladder:GetPosAtHeight(lastHeight - self:GetSpeed()*self:GetScale()*(CurTime()-lastTime))
					self:SetPos(pos + offset)
					if ladder:GetBottom().z >= pos.z then break end
					local remaining = (ladder:GetBottom().z - pos.z)/self:GetScale()
					if self:OnClimbing(ladder, remaining, true) then break end
					if isfunction(callback) and callback(self, ladder, remaining, true) then break end
				else
					pos = ladder:GetPosAtHeight(lastHeight + self:GetSpeed()*self:GetScale()*(CurTime()-lastTime))
					self:SetPos(pos + offset)
					if ladder:GetTop().z <= pos.z then break end
					local remaining = (ladder:GetTop().z - pos.z)/self:GetScale()
					if self:OnClimbing(ladder, remaining, false) then break end
					if isfunction(callback) and callback(self, ladder, remaining, false) then break end
				end
				lastHeight = pos.z
				lastTime = CurTime()
				self:YieldCoroutine(false)
			end
			local pos = self:GetPos()
			if down then
				self:OnStopClimbing(ladder, ladder:GetBottom().z - pos.z, true)
			else self:OnStopClimbing(ladder, ladder:GetTop().z - pos.z, false) end
		else self:CustomClimbing(ladder, height, down) end
		self:SetNW2Bool("DrGBaseClimbing", false)
		self._DrGBaseClimbLadder = nil
		self:SetVelocity(Vector(0, 0, 0))
	end
	function ENT:ClimbLadderUp(ladder)
		return self:ClimbLadder(ladder, false)
	end
	function ENT:ClimbLadderDown(ladder)
		return self:ClimbLadder(ladder, true)
	end

	-- Ledges
	local function IsEntityClimbable(self, ent)
		if ent:IsWorld() then return true
		elseif not IsValid(ent) then return false end
		if ent:GetClass() == "func_lod" then return true end
		return self.ClimbProps and ent:GetClass() == "prop_physics" and ent:GetVelocity():IsZero()
	end
	function ENT:FindLedge(propOnly)
		if not self.ClimbLedges or (propOnly and not self.ClimbProps) then return end
		local hull = self:TraceHull(self:GetForward()*self.LedgeDetectionDistance, {step = true})
		if not hull.Hit then return end
		if IsValid(hull.Entity) and hull.Entity:GetClass() == "prop_physics" then
			if not self.ClimbProps then return end
		elseif propOnly then return end
		if IsEntityClimbable(self, hull.Entity) then
			local up = self:TraceHull(self:GetUp()*self.ClimbLedgesMaxHeight+Vector(0, 0, self:Height()*1.1)).HitPos
			local height = up.z - self:GetPos().z
			local i = 1
			local tr = {Hit = true, HitNonWorld = true}
			local precision = 5
			while tr.Hit do
				if i*precision > height then return end
				tr = self:TraceHull(self:GetForward()*self:Length(), {
					start = self:GetPos() + Vector(0, 0, i*precision)
				})
				i = i+1
			end
			local tr2 = self:TraceHull(self:GetUp()*-999, {
				start = tr.HitPos
			})
			if tr2.HitPos.z - self:GetPos().z > self.ClimbLedgesMaxHeight then return end
			local trRad = self:TraceHullRadial(999, 360, {
				collisiongroup = COLLISION_GROUP_DEBRIS,
				maxs = Vector(0.5, 0.5, self:Height()),
				mins = Vector(-0.5, -0.5, self:GetStepHeight())
			})
			local pos = self:GetPos()
			local ledge = self:TraceLine(trRad[1].Normal*self:Length(), {
				collisiongroup = COLLISION_GROUP_DEBRIS,
				start = Vector(pos.x, pos.y, tr2.HitPos.z - 1)
			}).HitPos
			local height = ledge.z - self:GetPos().z
			if math.Clamp(height, self.ClimbLedgesMinHeight, self.ClimbLedgesMaxHeight) == height then
				return ledge
			end
		end
	end
	function ENT:ClimbLedge(ledge, callback)
		if self:IsClimbing() then return end
		local height = math.abs(ledge.z - self:GetPos().z)
		local res = self:OnStartClimbing(ledge, height, false)
		if res == false then return end
		self:SetNW2Bool("DrGBaseClimbing", true)
		self:SetNW2Bool("DrGBaseClimbingDown", false)
		if res ~= true then
			local offset = self:CalcOffset(self.ClimbOffset)*self:GetScale()
			offset.z = 0
			local lastPos = self:GetPos()
			local lastTime = CurTime()
			while true do
				self:YieldCoroutine(false)
				self:FaceTowards(ledge)
				local pos = lastPos + lastPos:DrG_Direction(ledge):GetNormalized()*self:GetSpeed()*self:GetScale()*(CurTime()-lastTime)
				if pos.z > ledge.z then pos.z = ledge.z end
				lastTime = CurTime()
				lastPos = pos
				local hull = self:TraceHull(self:GetForward()*self.LedgeDetectionDistance, {
					start = lastPos
				})
				if not IsEntityClimbable(self, hull.Entity) then
					self:SetNW2Bool("DrGBaseClimbing", false)
					self:SetVelocity(Vector(0, 0, 0))
					return
				else
					self:SetPos(pos + offset)
					local remaining = math.abs(ledge.z - self:GetPos().z)/self:GetScale()
					if remaining == 0 then break end
					if self:OnClimbing(ledge, remaining, false) then break end
					if isfunction(callback) and callback(self, ledge, remaining, false) then break end
				end
			end
			self:OnStopClimbing(ledge, math.abs(ledge.z - self:GetPos().z), false)
		else self:CustomClimbing(ledge, height, false) end
		self:SetNW2Bool("DrGBaseClimbing", false)
		self:SetVelocity(Vector(0, 0, 0))
	end

	function ENT:AvoidObstacles(forwardOnly)
		if not AvoidObstacles:GetBool() then return false end
		local hulls = self:CollisionHulls(nil, forwardOnly)
		local direction
		if forwardOnly then
			if hulls.NorthWest.Hit and hulls.NorthEast.Hit then
				direction = "N"
				self:MoveBackward()
			elseif hulls.NorthWest.Hit then
				direction = "NW"
				self:MoveBackward()
				self:MoveRight()
			elseif hulls.NorthEast.Hit then
				direction = "NE"
				self:MoveBackward()
				self:MoveLeft()
			else return false end
			return true, direction
		else
			local nbHit = 0
			for k, tr in pairs(hulls) do
				if tr.Hit then nbHit = nbHit+1 end
			end
			if nbHit == 3 then
				if not hulls.NorthWest.Hit then
					direction = "SE"
					self:MoveForward()
					self:MoveLeft()
				elseif not hulls.NorthEast.Hit then
					direction = "SW"
					self:MoveForward()
					self:MoveRight()
				elseif not hulls.SouthEast.Hit then
					direction = "NW"
					self:MoveBackward()
					self:MoveRight()
				elseif not hulls.SouthWest.Hit then
					direction = "NE"
					self:MoveBackward()
					self:MoveLeft()
				end
			elseif nbHit == 2 then
				if hulls.NorthWest.Hit and hulls.NorthEast.Hit then
					direction = "N"
					self:MoveBackward()
				elseif hulls.NorthEast.Hit and hulls.SouthEast.Hit then
					direction = "E"
					self:MoveLeft()
				elseif hulls.SouthEast.Hit and hulls.SouthWest.Hit then
					direction = "S"
					self:MoveForward()
				elseif hulls.SouthWest.Hit and hulls.NorthWest.Hit then
					direction = "W"
					self:MoveRight()
				end
			elseif nbHit == 1 then
				if hulls.SouthEast.Hit then
					direction = "SE"
					self:MoveForward()
					self:MoveLeft()
				elseif hulls.SouthEast.Hit then
					direction = "SW"
					self:MoveForward()
					self:MoveRight()
				elseif hulls.NorthWest.Hit then
					direction = "NW"
					self:MoveBackward()
					self:MoveRight()
				elseif hulls.NorthEast.Hit then
					direction = "SE"
					self:MoveBackward()
					self:MoveLeft()
				end
			elseif nbHit == 0 then return false end
			return true, direction or "ALL"
		end
	end

	-- Update --

	function ENT:UpdateSpeed()
		if self:IsPlayingAnimation() then return end
		local speed = self:OnUpdateSpeed()
		if isnumber(speed) and speed >= 0 then
			self:SetSpeed(math.Clamp(speed*MultSpeed:GetFloat(), 0, math.huge))
		else
			local seq = self:GetSequence()
			if self:IsClimbing() then
				local success, vec, angles = self:GetSequenceMovement(seq, 0, 1)
				if success then
					local height = vec.z
					local duration = self:SequenceDuration(seq)
					speed = height/duration
				end
			else speed = self:GetSequenceGroundSpeed(seq) end
			if speed ~= 0 then self.loco:SetDesiredSpeed(speed*MultSpeed:GetFloat())
			else self.loco:SetDesiredSpeed(1) end
		end
	end
	function ENT:OnUpdateSpeed()
		if self:IsClimbing() then return self.ClimbSpeed
		elseif self.UseWalkframes then return -1
		elseif self:IsRunning() then return self.RunSpeed
		else return self.WalkSpeed end
	end

	-- Hooks --

	function ENT:OnStartClimbing() end
	function ENT:OnClimbing(...)
		return self:WhileClimbing(...)
	end
	function ENT:WhileClimbing() end
	function ENT:OnStopClimbing() end
	function ENT:CustomClimbing() end

	function ENT:HandleStuck()
		self:ClearStuck()
	end

	-- Handlers --

else

	-- Getters/setters --

	-- Functions --

	-- Hooks --

	-- Handlers --

end

--PATH gamemodes/mangarp/entities/entities/fadmin_jail/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "fadmin_jail"
ENT.Author = "FPtje"
ENT.Spawnable = false

function ENT:CanTool()
    return false
end

function ENT:PhysgunPickup(ply)
    return false
end

--PATH lua/entities/fish5/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Piranha"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A raw fish"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/piranha.mdl")
	
end
--PATH lua/entities/fruitbananabunch/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Banana (Bunch)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bananna_bunch.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/gunlab/shared.lua:
ENT.Base = "lab_base"
ENT.PrintName = "Gun Lab"

function ENT:initVars()
    self.model = "models/props_c17/TrapPropeller_Engine.mdl"
    self.initialPrice = GAMEMODE.Config.gunlabguncost
    self.labPhrase = DarkRP.getPhrase("gun_lab")
    self.itemPhrase = DarkRP.getPhrase("gun")
end

--PATH lua/entities/icecream6b/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream_open6.mdl")
	
end
--PATH lua/entities/kindersurprise2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Kinder Surprise (unwrapped)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "An unwrapped Kinder Surprise"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/KinderSurprise2.mdl")
	
end
--PATH lua/entities/kindersurprisebox2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Kinder Surprise Box"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A box of Kinder Surprises"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/kinderboxopen.mdl")
	
end
--PATH addons/sl_main_system/lua/entities/mad_crystal/cl_init.lua:
include('shared.lua')

function ENT:Initialize()

end

function ENT:Draw()
    self:DrawModel()
end

--PATH addons/sl_main_system/lua/entities/magie_roll_sl/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	if string.len(string.Trim("Magie - Bibliothécaire")) < 1 then return end

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
			draw.SimpleText("Magie - Bibliothécaire","DermaLarge",0,-40, white , 1 , 1) 
		cam.End3D2D() 
	end
end
--PATH lua/entities/marabou2/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/marabou2.mdl")
	
end
--PATH lua/entities/mcdchick/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "McDonalds Fried Chicken"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A fried chicken leg from McDonalds"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/mcdfriedchickenleg.mdl")
	
end
--PATH lua/entities/mcdsoda/shared.lua:
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
--PATH addons/mc_quests/lua/entities/mqs_npc/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.MQSNPC = true
	self.names = 0
end

function ENT:Draw()
	self:DrawModel()

	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > MQS.Config.QuestEntDrawDist ^ 2 then return end

	local Pos = self:EyePos() or self:GetPos()
	Pos = Pos + Vector(0, 0, 10)
	local Ang = self:GetAngles()
	local eyepos = EyePos()
	local planeNormal = Ang:Up()
	Ang:RotateAroundAxis(Ang:Forward(), 90)

	local relativeEye = eyepos - Pos
	local relativeEyeOnPlane = relativeEye - planeNormal * relativeEye:Dot(planeNormal)
	local textAng = relativeEyeOnPlane:AngleEx(planeNormal)

	textAng:RotateAroundAxis(textAng:Up(), 90)
	textAng:RotateAroundAxis(textAng:Forward(), 90)

	cam.Start3D2D(Pos - Ang:Right() * (8 + math.sin(CurTime()) * 0.9), textAng, 0.1)
		draw.RoundedBox(8, -self.names / 2 - 10, 0, self.names + 20, 35, MSD.Theme["d"])
		self.names = draw.SimpleTextOutlined(self:GetNamer(), "MSDFont.32", 0, 0, color_white, TEXT_ALIGN_CENTER, 0, 1, color_black)
	cam.End3D2D()
end
--PATH addons/sl_main_system/lua/entities/npc_goblin_mage.lua:

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

game.AddParticles( "particles/mad_sololeveling2.pcf" )
PrecacheParticleSystem( "[1]_fire_goblinmage_projectile" )

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
ENT.PrintName = "Goblin - Mage"
ENT.Category = "SL - NPC"
ENT.Models = {"models/abs_goblinmage.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "boss"

-- Stats --
ENT.xp = 450
ENT.money = 200000
ENT.Damage = 50
ENT.SpawnHealth = 9000

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
ENT.MeleeAttackRange = 500
ENT.ReachEnemyRange = 500
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
					if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 700 then
						self.shot = ents.Create("ent_config_launch")
						--------------------------------------------------------------------------
						self.shot.Damage = self.Damage
						self.shot.Burn = true
						self.shot.BurnTime = 1
						--------------------------------------------------------------------------
						self.shot.Freeze = false
						self.shot.FreezeTimer = 0
						self.shot.HaveFreezeEffect = false
						self.shot.FreezeEffect = ""
						--------------------------------------------------------------------------
						self.shot.HaveHitSound = true
						self.shot.HitSound = hitjoueur[math.random(1,3)]
						self.shot.MinSound = 70
						self.shot.MaxSound = 130
						self.shot.HaveRepeat = false
						self.shot.RepeatTime = 0
						--------------------------------------------------------------------------
						self.shot:SetPos(self:GetPos() + Vector(0,0,50) + self:GetForward()*75)
						self.shot:SetOwner(self)
						self.shot:SetAngles(self:GetAngles())
						self.shot:Spawn()
						self.shot:GetPhysicsObject():EnableMotion(true)
						self.shot:SetRenderMode( RENDERMODE_TRANSCOLOR )
						self.shot:SetColor(Color(0,0,0,0))
						self.shot:SetModel("models/hunter/misc/sphere175x175.mdl")
			
						timer.Simple(0.001, function()
							ParticleEffectAttach("[1]_fire_goblinmage_projectile", 4, self.shot, 0)
						end)
			
						local phys = self.shot:GetPhysicsObject()
						phys:EnableGravity(false)
						phys:SetVelocity( self.shot:GetForward() * 750 )
					end
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

--PATH addons/sl_main_system/lua/entities/npc_orcboss.lua:

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
ENT.PrintName = "Seigneur Orc"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_highorcboss.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "boss"

-- Stats --
ENT.xp = 10000
ENT.money = 10000
ENT.Damage = 600
ENT.SpawnHealth = 50000

ENT.WalkSpeed = 100
ENT.RunSpeed = 500

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
		self:SetModelScale(1.8)

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
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 450 then
						enemy:TakeDamage(self.Damage, self, self)	
						timer.Simple(0.001, function()
							if enemy:Health() <= 0 then
								local currentXP = enemy:getDarkRPVar("xp") or 0
								-- Calcule 50% de l'XP
								local xpToRemove = currentXP * 0.05
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
		ent:SetNWInt("item", "crystal4")
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
			if math.random() <= 0.6 then
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

--PATH addons/squad_reborn/lua/entities/npc_squad.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.AutomaticFrameAdvance = false
ENT.PrintName = "Squad creator"
ENT.Author = "Gonzo"
ENT.Category = "Fun + Games"
ENT.Spawnable = true
ENT.AdminOnly = true
AddCSLuaFile()

function ENT:Initialize()
	self:SetModel("models/player/police_fem.mdl")

	if SERVER then
		self:SetHullType(HULL_HUMAN)
		self:SetHullSizeNormal()
		self:SetNPCState(NPC_STATE_SCRIPT)
		self:SetSolid(SOLID_BBOX)
		self:CapabilitiesAdd(CAP_ANIMATEDFACE)
		self:CapabilitiesAdd(CAP_TURN_HEAD)
		self:SetUseType(SIMPLE_USE)
		self:DropToFloor()
		self:SetMaxYawSpeed(90)
		local sequence = self:LookupSequence("menu_combine")
		self:ResetSequence(sequence)
	end
end

function ENT:Think()
	if SERVER then
		self:ResetSequence("menu_combine")
		self:NextThink(CurTime() + 1)

		return true
	end
end

if SERVER then
	util.AddNetworkString("OpenSquadMenu")
end

function ENT:AcceptInput(Name , Activator , Caller)
	if Name == "Use" and Caller:IsPlayer() then
		net.Start("OpenSquadMenu")
		net.Send(Caller)
	end
end

concommand.Add("squad_save_npcs" , function(ply)
	if (SERVER) then
		local tbl = { }

		if (file.Exists(game.GetMap() .. "_squad.txt" , "DATA")) then
			tbl = util.JSONToTable(file.Read(game.GetMap() .. "_squad.txt" , "DATA"))
		end

		for k , v in pairs(ents.FindByClass("npc_squad")) do
			table.insert(tbl , { v:GetPos() , v:GetAngles() })
		end

		file.Write(game.GetMap() .. "_squad.txt" , util.TableToJSON(tbl , true))
	end
end)

hook.Add("InitPostEntity" , "CreateSquadMembers" , function()
	if CLIENT then return end
	local tbl = { }

	if (file.Exists(game.GetMap() .. "_squad.txt" , "DATA")) then
		tbl = util.JSONToTable(file.Read(game.GetMap() .. "_squad.txt" , "DATA"))
	end

	for k , v in pairs(tbl) do
		local ent = ents.Create("npc_squad")
		ent:SetPos(v[ 1 ])
		ent:SetAngles(v[ 2 ])
		ent:Spawn()
	end
end)

net.Receive("OpenSquadMenu" , function()
	if (IsValid(squad_window)) then
		squad_window:GetParent():Remove()
	end

	squad_window_frame = vgui.Create("DFrame")
	squad_window_frame:SetSize(600,500)
	squad_window_frame:Center()
	squad_window_frame:MakePopup()

	if (LocalPlayer()._squad ~= "") then
		squad_window = vgui.Create("dSquadPanel" , squad_window_frame)
	else
		squad_window_frame.Paint = function() end
		net.Start("Squad.Verify")
		net.WriteString(LocalPlayer()._squad or "")
		net.SendToServer()
	end
end)

--PATH addons/sl_main_system/lua/entities/npc_undeadboss.lua:

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
ENT.PrintName = "Chef des Morts Vivant"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_undeadboss.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "boss"

-- Stats --
ENT.xp = 3415
ENT.money = 100000
ENT.Damage = 300
ENT.SpawnHealth = 6700

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
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 450 then
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
						enemy:EmitSound( hitjoueur[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )	
					end
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
		ent:SetNWInt("item", "crystal3")
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
			if math.random() <= 0.2 then
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

--PATH lua/entities/pancake_stack/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pancakes"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pancakes.mdl")
	
end
--PATH addons/pcasino/lua/entities/pcasino_blackjack_panel/cl_init.lua:
include("shared.lua")


function ENT:Initialize()
	self.table = self:GetParent()
	self.hasInitialized = true
end

local surface_setdrawcolor = surface.SetDrawColor
local surface_drawrect = surface.DrawRect
local draw_simpletext = draw.SimpleText
local black = Color(0, 0, 0, 155)
local white = Color(255, 255, 255, 100)
local gold = Color(255, 200, 0, 100)
local edge = -235
function ENT:Draw()
end
function ENT:DrawTranslucent()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 25000 then return end
	if not self.table.data then return end

	if not self.hasInitialized then
		self:Initialize()
	end

	local pos = self:GetPos()
	local ang = self:GetAngles()

	cam.Start3D2D(pos + (ang:Up()*5.95), ang, 0.05)
		if self:GetStage() == 1 then -- Changing bet buttons
			local button = self:GetCurrentPad(self:WorldToLocal(LocalPlayer():GetEyeTrace().HitPos))

			-- Previous bet step
			surface_setdrawcolor(black)
			surface_drawrect(edge + 5, -edge - 150, 90, 65)
			-- Border
			surface_setdrawcolor(button == "bet_lower" and gold or white)
			surface_drawrect(edge + 0, -edge - 155, 100, 5)
			surface_drawrect(edge + 0, -edge - 150, 5, 65)
			surface_drawrect(edge + 95, -edge - 150, 5, 65)
			surface_drawrect(edge + 0, -edge - 85, 100, 5)
			-- Left arrow
			draw_simpletext("<", "pCasino.Entity.Arrows", edge + 50, -edge - 120,  button == "bet_lower" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	

			-- Current bet
			surface_setdrawcolor(black)
			surface_drawrect(edge + 115, -edge - 150, 240, 65)
			-- Border
			surface_setdrawcolor(white)
			surface_drawrect(edge + 110, -edge - 155, 250, 5)
			surface_drawrect(edge + 110, -edge - 150, 5, 65)
			surface_drawrect(edge + 355, -edge - 150, 5, 65)
			surface_drawrect(edge + 110, -edge - 85, 250, 5)
			-- Current Bid
			draw_simpletext(PerfectCasino.Config.FormatMoney(self.table.currentBid), "pCasino.Entity.Bid", edge + 235, -edge - 118, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	

			-- Next bet step
			-- Box
			surface_setdrawcolor(black)
			surface_drawrect(edge + 375, -edge - 150, 90, 65)
			-- Border
			surface_setdrawcolor(button == "bet_raise" and gold or white)
			surface_drawrect(edge + 370, -edge - 155, 100, 5)
			surface_drawrect(edge + 370, -edge - 150, 5, 65)
			surface_drawrect(edge + 465, -edge - 150, 5, 65)
			surface_drawrect(edge + 370, -edge - 85, 100, 5)
			-- Right arrow
			draw_simpletext(">", "pCasino.Entity.Arrows", edge + 420, -edge - 120, button == "bet_raise" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
			-- Place bet
			surface_setdrawcolor(black)
			surface_drawrect(edge, -edge - 70, 465, 65)
			-- Border
			surface_setdrawcolor(button == "bet_place" and gold or white)
			surface_drawrect(edge, -edge - 75, 470, 5)
			surface_drawrect(edge, -edge - 70, 5, 65)
			surface_drawrect(edge + 465, -edge - 70, 5, 65)
			surface_drawrect(edge, -edge - 5, 470, 5)
			-- Current Bid
			draw_simpletext(PerfectCasino.Translation.UI.PlaceBet, "pCasino.Entity.Bid", edge + 235, -edge - 38, button == "bet_place" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		elseif (self:GetStage() == 2) and (self:GetUser() == LocalPlayer()) then -- Waiting for your turn
			surface_setdrawcolor(black)
			surface_drawrect(edge, -edge - 70, 465, 65)
			-- Border
			surface_setdrawcolor(white)
			surface_drawrect(edge, -edge - 75, 470, 5)
			surface_drawrect(edge, -edge - 70, 5, 65)
			surface_drawrect(edge + 465, -edge - 70, 5, 65)
			surface_drawrect(edge, -edge - 5, 470, 5)
			-- Waiting
			draw_simpletext(PerfectCasino.Translation.UI.Waiting, "pCasino.Entity.Bid", edge + 235, -edge - 38, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		elseif (self:GetStage() == 3) and (self:GetUser() == LocalPlayer()) then -- Active turn
			if not self.table.curHands[self.order] then return end

			local activeHandData = self.table.curHands[self.order][self:GetHand()]
			if not activeHandData then return end
			local button = self:GetCurrentPad(self:WorldToLocal(LocalPlayer():GetEyeTrace().HitPos))

			----| Hit
			surface_setdrawcolor(black)
			surface_drawrect(edge + 5, -edge - 70, 220, 65)
			-- Border
			surface_setdrawcolor(button == "action_hit" and gold or white)
			surface_drawrect(edge, -edge - 75, 230, 5)
			surface_drawrect(edge, -edge - 70, 5, 65)
			surface_drawrect(edge + 225, -edge - 70, 5, 65)
			surface_drawrect(edge, -edge - 5, 230, 5)
			-- Hit
			draw_simpletext(PerfectCasino.Translation.UI.Hit, "pCasino.Entity.Bid", edge + 115, -edge - 38, button == "action_hit" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)



			----| Stand
			surface_setdrawcolor(black)
			surface_drawrect(edge + 245, -edge - 70, 220, 65)
			-- Border
			surface_setdrawcolor(button == "action_stand" and gold or white)
			surface_drawrect(edge + 240, -edge - 75, 230, 5)
			surface_drawrect(edge + 240, -edge - 70, 5, 65)
			surface_drawrect(edge + 240 + 225, -edge - 70, 5, 65)
			surface_drawrect(edge + 240, -edge - 5, 230, 5)
			-- Stand
			draw_simpletext(PerfectCasino.Translation.UI.Stand, "pCasino.Entity.Bid", edge + 355, -edge - 38, button == "action_stand" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	

			-- Can't double a hand if it's not the first action
			if #activeHandData <= 2 then
				----| Double down
				surface_setdrawcolor(black)
				surface_drawrect(edge + 5, -edge - 150, 220, 65)
				-- Border
				surface_setdrawcolor(button == "action_double" and gold or white)
				surface_drawrect(edge, -edge - 155, 230, 5)
				surface_drawrect(edge, -edge - 150, 5, 65)
				surface_drawrect(edge + 225, -edge - 150, 5, 65)
				surface_drawrect(edge, -edge - 85, 230, 5)
				-- Double down
				draw_simpletext(PerfectCasino.Translation.UI.DoubleDown, "pCasino.Entity.Bid", edge + 115, -edge - 118, button == "action_double" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end	

			if (#activeHandData <= 2) and activeHandData[2] and (PerfectCasino.Cards:GetValue(activeHandData[1]) == PerfectCasino.Cards:GetValue(activeHandData[2])) then
				----| Split
				surface_setdrawcolor(black)
				surface_drawrect(edge + 245, -edge - 150, 220, 65)
				-- Border
				surface_setdrawcolor(button == "action_split" and gold or white)
				surface_drawrect(edge + 240, -edge - 155, 230, 5)
				surface_drawrect(edge + 240, -edge - 150, 5, 65)
				surface_drawrect(edge + 240 + 225, -edge - 150, 5, 65)
				surface_drawrect(edge + 240, -edge - 85, 230, 5)
				-- Split
				draw_simpletext(PerfectCasino.Translation.UI.Split, "pCasino.Entity.Bid", edge + 355, -edge - 118, button == "action_split" and gold or white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

			----| CurHand Stats
			surface_setdrawcolor(black)
			surface_drawrect(edge + 5, -edge + 10, 460, 65)
			-- Border
			surface_setdrawcolor(white)
			surface_drawrect(edge, -edge + 5, 470, 5)
			surface_drawrect(edge, -edge + 10, 5, 65)
			surface_drawrect(edge + 465, -edge + 10, 5, 65)
			surface_drawrect(edge, -edge + 75, 470, 5)
			-- Current Hand
			draw_simpletext(string.format(PerfectCasino.Translation.UI.CurrentHand, PerfectCasino.UI.NumberSuffix(self:GetHand())), "pCasino.Entity.Bid", edge + 235, -edge + 7, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			-- Hand V
			local total = PerfectCasino.Cards:GetHandValue(activeHandData)
			local valueState = ((total > 21) and string.format(PerfectCasino.Translation.UI.Bust, total)) or ((total == 21) and string.format(PerfectCasino.Translation.UI.Blackjack, total)) or total
			draw_simpletext(string.format(PerfectCasino.Translation.UI.CurrentHandTotalValue, valueState), "pCasino.Entity.Bid", edge + 235, -edge + 77, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
		end
	cam.End3D2D()
end
--PATH addons/pcasino/lua/entities/pcasino_blackjack_panel/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Blackjack Panel"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "User")
	self:NetworkVar("Int", 0, "Stage")
	self:NetworkVar("Int", 1, "Hand")
end

function ENT:GetCurrentPad(pos)
	if self:GetStage() == 2 then return end -- There is nothing to do on stage 2 but wait.

	if not self.padCache then
		self.padCache = {}
		self.padCache[1] = {} -- The stage for placing bets
		self.padCache[3] = {} -- The stage for choosing an action

		-- Stage 1
		-- Lower bet
		self.padCache[1]["bet_lower"] = {
			boundsA = {x = -6.7, y = -7.7},
			boundsB = {x = -11.7, y = -3.9},
		}
		-- Raise bet
		self.padCache[1]["bet_raise"] = {
			boundsA = {x = 11.7, y = -7.7},
			boundsB = {x = 6.7, y = -3.9},
		}
		-- Place bet
		self.padCache[1]["bet_place"] = {
			boundsA = {x = 11.7, y = -11.7},
			boundsB = {x = -11.7, y = -8},
		}

		-- Stage 3
		self.padCache[3]["action_double"] = {
			boundsA = {x = -0.2, y = -7.7},
			boundsB = {x = -11.7, y = -3.9},
		}
		self.padCache[3]["action_hit"] = {
			boundsA = {x = -0.2, y = -11.7},
			boundsB = {x = -11.7, y = -8},
		}
		self.padCache[3]["action_stand"] = {
			boundsA = {x = 11.7, y = -11.7},
			boundsB = {x = 0.2, y = -8},
		}
		self.padCache[3]["action_split"] = {
			boundsA = {x = 11.7, y = -7.7},
			boundsB = {x = 0.2, y = -3.9},
		}
	end

	if not self.padCache[self:GetStage()] then return false end

	for k, v in pairs(self.padCache[self:GetStage()]) do
		if (pos.x < v.boundsA.x) and (pos.x > v.boundsB.x) and (pos.y > v.boundsA.y) and (pos.y < v.boundsB.y) then
			return k, v
		end
	end

	return false
end
--PATH addons/pcasino/lua/entities/pcasino_npc/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	-- To prevent some weird issue where the animation was going crazy
	self:SetSequence(self:LookupSequence("idle_subtle"))

	self.hasInitialized = true
end


function ENT:PostData()
	if not self.hasInitialized then
		self:Initialize()
	end

	surface.SetFont("pCasino.Entity.Arrows")
	self.textWidth = surface.GetTextSize(self.data.text.overhead)
end

local surface_setdrawcolor = surface.SetDrawColor
local surface_drawrect = surface.DrawRect
local draw_simpletext = draw.SimpleText
local black = Color(0, 0, 0, 155)
local white = Color(255, 255, 255, 100)
local gold = Color(255, 200, 0, 100)
function ENT:Draw()
	self:DrawModel()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 200000 then return end

	-- We can piggyback off the distance check to only request the entities data when it's needed :D
	if (not self.data) and (not PerfectCasino.Cooldown.Check(self:EntIndex(), 5)) then
		PerfectCasino.Core.RequestConfigData(self)
		return
	end

	if not self.data then return end

	if (not self.data.text.overhead) or (self.data.text.overhead == " ") then return end

	local ang = LocalPlayer():EyeAngles()
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 90)

	cam.Start3D2D(self:GetPos()+self:GetUp()*78, ang, 0.07)
		-- Previous bet step
		surface_setdrawcolor(black)
		surface_drawrect(-(self.textWidth + 10)*0.5, 5, self.textWidth + 10, 65)
		-- Border
		surface_setdrawcolor(white)
		surface_drawrect(-(self.textWidth + 20)*0.5, 0, self.textWidth + 20, 5)
		surface_drawrect(-(self.textWidth + 20)*0.5, 5, 5, 65)
		surface_drawrect((self.textWidth*0.5) + 5, 5, 5, 65)
		surface_drawrect(-(self.textWidth + 20)*0.5, 70, self.textWidth+20, 5)
		-- Text
		draw_simpletext(self.data.text.overhead, "pCasino.Entity.Arrows", 0, 35, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
--PATH addons/pcasino/lua/entities/pcasino_npc/shared.lua:
ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.PrintName = "NPC"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false

PerfectCasino.Core.RegisterEntity("pcasino_npc", {
	text = {
		overhead = {d = "Dealer", t = "string"},
		chat = {d = "Interested in playing a round?", t = "string"},
	},
},
"models/freeman/pcasino/owain_croupier_female01.mdl")
--PATH lua/entities/peanutbutterjar/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Peanut Butter"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/peanut_butter.mdl")
	
end
--PATH lua/entities/pfx1_08#.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [Pink]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_campfire_pink"
--PATH lua/entities/pfx1_0b.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Candle flame"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]candle_flame"
--PATH lua/entities/pfx2_02_a_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Gushing Alien Blood [Alien]"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]gushing_blood_alien"
--PATH lua/entities/pfx2_04.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Swirl 1"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]swirl_1"
--PATH lua/entities/pfx2_05.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "G-Man Starfield"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]gman_lines"
--PATH lua/entities/pfx2_06~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Dripping blood [Alien]"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]blood_leak_alien"
--PATH lua/entities/pfx4_03_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Green Jet"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_g_s"
--PATH lua/entities/pfx6_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "AR2 Gunfire"
ENT.Category         = "PPE: Weapons"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[6]gunfire_ar2"
--PATH lua/entities/pfx6_02b.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "AR2 Tracer"
ENT.Category         = "PPE: Weapons"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[6]bullet_tracer_ar2"
--PATH lua/entities/pfx7_00.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Dusty Wind"
ENT.Category         = "PPE: Weather"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[7]dusty_wind1"
--PATH lua/entities/pfx7_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Rain"
ENT.Category         = "PPE: Weather"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[7]rain"
--PATH lua/entities/pfx7_02.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Snow"
ENT.Category         = "PPE: Weather"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[7]snow"
--PATH lua/entities/pfx7_04.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fog 2"
ENT.Category         = "PPE: Weather"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[7]area_of_fog"
--PATH lua/entities/pizzaslicehalf/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pizza Slice (half)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Half a slice of pepperoni pizza"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pizzaslicehalf.mdl")
	
end
--PATH addons/sl_utils/lua/entities/pp_prop_effect.lua:
AddCSLuaFile()

ENT.Type = "anim"

ENT.PrintName		= ""
ENT.Author			= ""
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Spawnable		= false
ENT.AdminOnly		= false

--[[---------------------------------------------------------
	Name: Initialize
-----------------------------------------------------------]]
function ENT:Initialize()

	local Radius = 6
	local min = Vector( 1, 1, 1 ) * Radius * -0.5
	local max = Vector( 1, 1, 1 ) * Radius * 0.5

	if ( SERVER ) then

		self.AttachedEntity = ents.Create( "prop_dynamic" )
		self.AttachedEntity:SetModel( self:GetModel() )
		self.AttachedEntity:SetAngles( self:GetAngles() )
		self.AttachedEntity:SetPos( self:GetPos() )
		self.AttachedEntity:SetSkin( self:GetSkin() )
		self.AttachedEntity:Spawn()
		self.AttachedEntity:SetParent( self.Entity )
		self.AttachedEntity:DrawShadow( false )

		self:SetModel( "models/props_junk/watermelon01.mdl" )

		self:DeleteOnRemove( self.AttachedEntity )

		-- Don't use the model's physics - create a box instead
		self:PhysicsInitBox( min, max )

		-- Set up our physics object here
		local phys = self:GetPhysicsObject()
		if ( IsValid( phys ) ) then
			phys:Wake()
			phys:EnableGravity( false )
			phys:EnableDrag( false )
		end

		self:DrawShadow( false )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )

	else

		self.GripMaterial = Material( "sprites/grip" )

		-- Get the attached entity so that clientside functions like properties can interact with it
		local tab = ents.FindByClassAndParent( "prop_dynamic", self )
		if ( tab && IsValid( tab[ 1 ] ) ) then self.AttachedEntity = tab[ 1 ] end

	end

	-- Set collision bounds exactly
	self:SetCollisionBounds( min, max )

end


--[[---------------------------------------------------------
	Name: Draw
-----------------------------------------------------------]]
function ENT:Draw()

	render.SetMaterial( self.GripMaterial )

end


--[[---------------------------------------------------------
	Name: PhysicsUpdate
-----------------------------------------------------------]]
function ENT:PhysicsUpdate( physobj )

	if ( CLIENT ) then return end

	-- Don't do anything if the player isn't holding us
	if ( !self:IsPlayerHolding() && !self:IsConstrained() ) then

		physobj:SetVelocity( Vector( 0, 0, 0 ) )
		physobj:Sleep()

	end

end


--[[---------------------------------------------------------
	Name: Called after entity 'copy'
-----------------------------------------------------------]]
function ENT:OnEntityCopyTableFinish( tab )

	-- We need to store the model of the attached entity
	-- Not the one we have here.
	tab.Model = self.AttachedEntity:GetModel()

	-- Store the attached entity's table so we can restore it after being pasted
	tab.AttachedEntityInfo = table.Copy( duplicator.CopyEntTable( self.AttachedEntity ) )
	tab.AttachedEntityInfo.Pos = nil -- Don't even save angles and position, we are a parented entity
	tab.AttachedEntityInfo.Angle = nil

	-- Do NOT store the attached entity itself in our table!
	-- Otherwise, if we copy-paste the prop with the duplicator, its AttachedEntity value will point towards the original prop's attached entity instead, and that'll break stuff
	tab.AttachedEntity = nil

end


--[[---------------------------------------------------------
	Name: PostEntityPaste
-----------------------------------------------------------]]
function ENT:PostEntityPaste( ply )

	-- Restore the attached entity using the information we've saved
	if ( IsValid( self.AttachedEntity ) ) and ( self.AttachedEntityInfo ) then

		-- Apply skin, bodygroups, bone manipulator, etc.
		duplicator.DoGeneric( self.AttachedEntity, self.AttachedEntityInfo )

		if ( self.AttachedEntityInfo.EntityMods ) then
			self.AttachedEntity.EntityMods = table.Copy( self.AttachedEntityInfo.EntityMods )
			duplicator.ApplyEntityModifiers( ply, self.AttachedEntity )
		end

		if ( self.AttachedEntityInfo.BoneMods ) then
			self.AttachedEntity.BoneMods = table.Copy( self.AttachedEntityInfo.BoneMods )
			duplicator.ApplyBoneModifiers( ply, self.AttachedEntity )
		end

		self.AttachedEntityInfo = nil

	end

end

--PATH lua/entities/proj_drg_flashbang.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "proj_drg_grenade"

-- Misc --
ENT.PrintName = "Flash Grenade"
ENT.Category = "DrGBase"
ENT.Models = {"models/weapons/w_eq_flashbang.mdl"}
ENT.Spawnable = true

-- Grenade --
ENT.Bounce = 1
ENT.OnBounceSounds = {"weapons/flashbang/grenade_hit1.wav"}

if SERVER then
	AddCSLuaFile()

	function ENT:CustomInitialize()
		self:SetRange(1000)
	end

	util.AddNetworkString("DrGBaseFlashGrenade")
	function ENT:OnDetonate()
		self:EmitSound("weapons/flashbang/flashbang_explode2.wav")
		net.Start("DrGBaseFlashGrenade")
		net.WriteInt(self:EntIndex(), 32)
		net.WriteVector(self:GetPos())
		net.WriteFloat(self:GetRange())
		net.Broadcast()
		local blind = DrGBase.Blind()
		blind:SetDuration(3)
		local owner = self:GetOwner()
		blind:SetAttacker(IsValid(owner) and owner or self)
		blind:SetInflictor(self)
		for i, ent in ipairs(ents.FindInSphere(self:GetPos(), self:GetRange())) do
			if ent:IsPlayer() and ent:Alive() then
				ent:ScreenFade(SCREENFADE.IN, nil, 3, 0)
			elseif ent.IsDrGNextbot then ent:Blind(blind) end
		end
	end

else

	net.Receive("DrGBaseFlashGrenade", function()
		local dlight = DynamicLight(net.ReadInt(32))
		dlight.pos = net.ReadVector()
		dlight.dieTime = CurTime() + 0.5
		dlight.decay = 2000
		dlight.size = net.ReadFloat()
		dlight.brightness = 10
		dlight.r = 1
		dlight.g = 1
		dlight.b = 1
	end)

end

--PATH addons/sl_utils/lua/entities/sammyservers_textscreen/shared.lua:
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
--PATH addons/sl_main_system/lua/entities/sell_item_sl/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Sell"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH lua/entities/sent_particle_def.lua:
AddCSLuaFile()
ENT.Base = "base_anim"
ENT.PrintName = "Particle Controller"
ENT.Category = "Other"
ENT.Spawnable = true
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.Editable = true
ENT.Points = {}
function ENT:SetupDataTables()
    self:NetworkVar(
        "String",
        0,
        "ParticleName",
        {
            KeyName = "particle_name",
            Edit = {
                title = "Particle Name",
                type = "String",
                order = 0
            }
        }
    )

    self:NetworkVar(
        "Int",
        0,
        "ControlPoints",
        {
            KeyName = "control_points",
            Edit = {
                title = "Control Points",
                type = "Int",
                min = 0,
                max = 32,
                order = 1
            }
        }
    )

    self:NetworkVar("Int", 1, "CP")
    self:NetworkVar("Int", 2, "Key")
    self:NetworkVar("Bool", 0, "IsChildren")
    self:NetworkVar("Bool", 1, "AutoKill")
    self:NetworkVar("Bool", 2, "IsOn")
    self:NetworkVar("Entity", 0, "Main")
    self:NetworkVar("Entity", 1, "Player")
    self:NetworkVar("Int", 2, "AttachmentSelected")
    self:SetIsOn(true)
    self:NetworkVarNotify("ParticleName", self.OnParticleNameChanged)
    self:NetworkVarNotify("ControlPoints", self.OnControlPointsChanged)
    self:NetworkVarNotify("AttachmentSelected", function(s, name, old, new)
        self:OnParticleNameChanged("", "", self:GetParticleName())
    end)
end

if SERVER then
    util.AddNetworkString("GPart.Restart")
    util.AddNetworkString("GPart.NotifyDead")
end

function ENT:Initialize()
    if SERVER then
        self:SetModel("models/maxofs2d/hover_basic.mdl")
        --self:SetSolid(SOLID_NONE)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
        self:Activate()
        self:SetSkin(self:GetIsChildren() and 1 or 3)
        self:SetUseType(SIMPLE_USE)
        self:GetPhysicsObject():EnableGravity(false)
    else
        self:SetRenderBounds(Vector(-128, -128, -128) * 2, Vector(128, 128, 128) * 2)
    end

    self:DrawShadow(false)
end

function ENT:Use(act)
    if self:GetIsChildren() then return end
    net.Start("GPart.Restart")
    net.WriteEntity(self)
    net.SendPVS(self:GetPos())
end

function ENT:OnParticleNameChanged(name, old, new)
    if self:GetIsChildren() then return end
    if CLIENT then
        if self.Particle and self.Particle:IsValid() then
            self.Particle:StopEmissionAndDestroyImmediately()
        end

        self.Particle = CreateParticleSystem(self, new, PATTACH_CUSTOMORIGIN, self:GetAttachmentSelected())
        self.Particle:SetShouldDraw(false)
        self.DidCreate = true
    end
end

function ENT:OnControlPointsChanged(name, old, new)
    if self:GetIsChildren() then return end
    if CLIENT then return end
    for k, v in pairs(self.Points) do
        SafeRemoveEntity(v)
    end

    self.Points = {}
    local val = new or old
    if val <= 0 then return end
    for k = 1, new or old do
        local ent = ents.Create(self:GetClass())
        ent:SetPos(self:GetPos() + Vector(0, 0, 32) * k)
        ent:SetIsChildren(true)
        ent:SetMain(self)
        ent:SetCP(k)
        ent:Spawn()
        self:DeleteOnRemove(ent)
        table.insert(self.Points, ent)
    end
end

function ENT:Think()
    if IsValid(self:GetParent()) then
        local att = self:GetParent():GetAttachment(self:GetAttachmentSelected())
        if att then
            self:SetPos(att.Pos)
            self:SetAngles(att.Ang)
        end
    end
end

function ENT:OnRemove()
    if CLIENT and self.Particle and self.Particle:IsValid() then
        self.Particle:StopEmissionAndDestroyImmediately()
    end
end

if SERVER then
    numpad.Register(
        "Particle_Toggle",
        function(pl, ent)
            if not IsValid(ent) then return false end
            if not IsValid(pl) then return false end
            ent:SetIsOn(not ent:GetIsOn())
            if ent:GetIsOn() then
                net.Start("GPart.Restart")
                net.WriteEntity(ent)
                net.SendPVS(ent:GetPos())
            end
        end
    )
end

local allowed = {
    weapon_physgun = true,
    weapon_physcannon = true,
    gmod_tool = true
}

local beam = Material("trails/laser")
local forwardColor = Color(255, 0, 0)
local imgs = {}

for k = 0, 9 do
    imgs[k] = Material("sprites/key_" .. k)
end
function ENT:DrawGizmo(isDev)
    if not isDev then return end
    render.SetMaterial(beam)
    local r, f, u = self:GetRight(), self:GetForward(), self:GetUp()
    local a, b = self:GetPos(), self:GetPos() + f * 24
    render.DrawBeam(a, b, 8, 0, 1, forwardColor)
    render.DrawBeam(b, b + r * 8 - f * 8, 8, 0, 1, forwardColor)
    render.DrawBeam(b, b - r * 8 - f * 8, 8, 0, 1, forwardColor)

    render.DrawBeam(b, b + u * 8 - f * 8, 8, 0, 1, forwardColor)
    render.DrawBeam(b, b - u * 8 - f * 8, 8, 0, 1, forwardColor)

    if self:GetCP() > 9 then return end

    render.SetMaterial(imgs[self:GetCP()])
    render.DrawSprite(self:GetPos() + Vector(0, 0, 12), 8, 8, color_white)
end

function ENT:DrawTranslucent()
    local wep = LocalPlayer():GetActiveWeapon()
    local isDev = not self:GetAutoKill() and IsValid(wep) and allowed[wep:GetClass()]
    if isDev then
        render.SuppressEngineLighting(true)
        render.SetBlend(.5)
        self:DrawModel()
        render.SetBlend(1)
        render.SuppressEngineLighting(false)
    end

    if self:GetIsChildren() then
        local main = self:GetMain()
        if not IsValid(main) then return end
        if main.Particle and main.Particle:IsValid() then
            main.Particle:SetControlPointEntity(self:GetCP(), self)
            main.Particle:SetControlPointOrientation(self:GetCP(), self:GetAngles())
            main.Particle:SetControlPoint(self:GetCP(), self:GetPos())
        end

        self:DrawGizmo(isDev)

        return
    end

    if self.Particle and self.Particle:IsValid() then
        if not self:GetIsOn() then return end
        self.Particle:SetControlPointOrientation(0, self:GetAngles())
        if IsValid(self:GetParent()) then
            local att = self:GetParent():GetAttachment(self:GetAttachmentSelected())
            if att then
                local ang = att.Ang
                self.Particle:SetControlPointOrientation(0, ang)
                self.Particle:SetControlPoint(0, att.Pos)
            end
        else
            self.Particle:SetControlPoint(0, self:GetPos())
        end
        self.Particle:Render()
    elseif self:GetParticleName() ~= "" then
        if self:GetAutoKill() and self.DidCreate and not self.Notified then
            self.Notified = true
            net.Start("GPart.NotifyDead")
            net.WriteEntity(self)
            net.SendToServer()
        end

        if self:GetAutoKill() then return end
        self:OnParticleNameChanged("", "", self:GetParticleName())
    end

    self:DrawGizmo(isDev)
end

net.Receive(
    "GPart.NotifyDead",
    function(l, ply)
        local target = net.ReadEntity()
        if target:GetClass() == "sent_particle_def" then
            SafeRemoveEntity(target)
        end
    end
)

net.Receive(
    "GPart.Restart",
    function()
        local target = net.ReadEntity()
        if target:GetClass() == "sent_particle_def" then
            target:OnParticleNameChanged("ParticleName", "", target:GetParticleName())
        end
    end
)
--PATH addons/sl_bouffe/lua/entities/sl_beer1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Master)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beer_master.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_beer2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Stoltz)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beer_stoltz.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_beercan3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Beer (Hop Knot)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/beercan03.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_cocktailcoco/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Coconut Cocktail"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/coconut_drink.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_cocktailpine/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pineapple Cocktail"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pineapple_drink.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_sodacan01/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Soda (Coca Cola)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacan01.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_sodacola/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Cola (Small)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bottle of off brand cola"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cola.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_wineclassic3/shared.lua:
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
--PATH lua/entities/turkey1/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/turkey.mdl")
	
end
--PATH lua/entities/vegpotato/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Potato"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/potato.mdl")
	
end
--PATH lua/entities/vegtomato/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Tomato"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/tomato.mdl")
	
end
--PATH lua/entities/wineclassic2/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/winebottle2.mdl")
	
end
--PATH lua/entities/winewhite1/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/wine_white1.mdl")
	
end
--PATH lua/entities/winewhite2/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/wine_white2.mdl")
	
end
--PATH lua/effects/punchsonicboom.lua:
local dietime = 0

function EFFECT:Init( Effect )

	self.pos = Effect:GetOrigin()
	self.ang = Effect:GetAngles()

	self.InitTime = CurTime()

	self.Alpha = 0
	self.Scaling = 0

	local emitter1 = ParticleEmitter(self.pos, true )
	local particle1 = emitter1:Add( "ryu_sonicboom",self.pos+Vector(0,0,5))
	if particle1 then
		particle1:SetAngles(Angle(0,self.ang.y,math.random(-180,180)))
		particle1:SetVelocity( Vector( 0, 0, 0 ) )
		particle1:SetDieTime( 0.375 )
		particle1:SetStartAlpha( 150 )
		particle1:SetEndAlpha( 0 )
		particle1:SetStartSize( 0 )
		particle1:SetEndSize( 75 )
		particle1:SetLighting(false)
		particle1:SetCollide(false)
	end
	emitter1:Finish()

	local emitter2 = ParticleEmitter(self.pos, true )
	local particle2 = emitter2:Add( "ryu_sonicboom",self.pos+Vector(0,0,5))
	if particle2 then
		particle2:SetAngles(Angle(0,self.ang.y - 180,math.random(-180,180)))
		particle2:SetVelocity( Vector( 0, 0, 0 ) )
		particle2:SetDieTime( 0.375 )
		particle2:SetStartAlpha( 150 )
		particle2:SetEndAlpha( 0 )
		particle2:SetStartSize( 0 )
		particle2:SetEndSize( 75 )
		particle2:SetLighting(false)
		particle2:SetCollide(false)
	end
	emitter2:Finish()

end

function EFFECT:Think()
end

function EFFECT:Render()
end

--PATH addons/sl_main_system/lua/effects/sl_effect1.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

local propHalos = {}  -- Tableau pour stocker les modèles nécessitant un halo

hook.Add("PreDrawHalos", "AddPropHalos", function()
    halo.Add(propHalos, Color(127,255,255,255), 0, 15, 2)  -- Ajouter des halos aux modèles stockés dans la table
end)

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
    
    self.Model:SetMaterial("models/alyx/emptool_glow")
    self.Model:SetColor( Color(127,255,255) )
    self.Model:SetParent( self.Ent, 0 )
    self.Model:SetMoveType( MOVETYPE_NONE )
    self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
    self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
    self.Model:AddEffects( EF_BONEMERGE )

	table.insert(propHalos, self.Model)

    for i = 0,self.Ent:GetBoneCount() do
        self.Model:ManipulateBoneScale( i, Vector(1,1,1) * 1.01 )
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

--PATH addons/sl_main_system/lua/effects/sl_effect6.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

function EFFECT:Init( data )
    self.Ent = data:GetEntity()
    self.Pos = data:GetOrigin()

    self.LifeTime = 1
    self.DieTime = CurTime() + self.LifeTime

    if not IsValid( self.Ent ) then return end

    self.Model = ClientsideModel( self.Ent:GetModel(), RENDERGROUP_TRANSLUCENT )

    self.Model:SetMaterial("Models/effects/comball_sphere")
    self.Model:SetColor( Color(225,255,0) )
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
        self.Model:SetColor( Color(255* (self.DieTime - CurTime()) / self.LifeTime,255 * (self.DieTime - CurTime()) / self.LifeTime,0,255) )
    end

    return true
end

function EFFECT:Render()
    if not IsValid( self.Ent ) then return end

end

--PATH addons/mc_quests/lua/mqs/core/cl_hud.lua:

local ply = LocalPlayer()
local ScrW, ScrH = ScrW, ScrH
local info_icon = Material("mqs/icons/info.png", "smooth")
local center_gradient = Material("gui/center_gradient.vtf", "smooth")
local veh_marker = Material("mqs/map_markers/v1.png", "smooth")

local w1, w2, w3, wm, ch, alpha, dist_m = 0, 0, 0, 0, 0, 0, 0
local icon_color = Color(241, 200, 0)
local color_red = Color(231, 0, 0)

local objective_draw = {}
local objective_text = {}

local vehicle_req_task = {
	["Move to point"] = true,
	["Leave area"] = true,
	["Wait time"] = true,
}

local notification_types = {
	[1] = {Color(241, 200, 0), "mqs/notify/1.mp3"}, -- quest start / loop update notification
	[2] = {Color(231, 0, 0), "mqs/fail/1.mp3"}, -- quest fail notification
	[3] = {Color(50, 250, 0), "mqs/notify/3.mp3"}, -- quest success notification
	[4] = {Color(0, 129, 250), "mqs/fail/2.mp3"}, -- only displayed when used player track event
}

local tasknotify_types = {
	[1] = {Color(241, 200, 0), "mqs/start/2.mp3"}, -- displayed on task updated (lower part of the screen)
	[2] = {Color(231, 0, 0), "mqs/fail/1.mp3"}, -- not used currently
	[3] = {Color(50, 250, 0), "mqs/done/4.mp3"}, -- not used currently
	[4] = {Color(255, 255, 255), "mqs/done/4.mp3"}, -- displayed to show quest-giving NPCs if enabled in config
}

objective_draw["Wait time"] = function(q, obj)
	if not obj.stay_inarea then return end
	local x, y = ScrW(), ScrH()
	local pl_pos = ply:GetPos()
	local dist = pl_pos:DistToSqr(obj.point)
	local t_dist = obj.stay_inarea / 3
	t_dist = t_dist * t_dist

	if dist < t_dist then
		alpha = Lerp(FrameTime() * 7, alpha, 0)
	else
		alpha = Lerp(FrameTime() * 7, alpha, 1)
	end

	surface.SetDrawColor(0, 0, 0, alpha * 170)
	surface.SetMaterial(center_gradient)
	surface.DrawTexturedRectRotated(x / 2, y / 8, 250, alpha * (x + 200), -90)
	local _, h = draw.SimpleTextOutlined(MSD.GetPhrase("warning"), "MSDFont.Biger", x / 2, y / 8 - 50, MSD.ColorAlpha(color_red, alpha * 255), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, alpha * 100))
	draw.SimpleTextOutlined(MSD.GetPhrase("q_must_stay_area"), "MSDFont.36", x / 2, y / 8 + h - 50, MSD.ColorAlpha(color_white, alpha * 255), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, alpha * 100))
end

objective_draw["Collect quest ents"] = function(q, obj, x, y, al1, al2)
	local pl_pos = ply:GetPos()

	if obj.show_ents then
		local ent_l = MQS.ActiveTask[q.id].ents
		if not ent_l then return end
		local pos
		local dt

		for i, v in pairs(ent_l) do
			local e = Entity(v)
			if not IsValid(e) then continue end
			local dist = pl_pos:DistToSqr(e:GetPos())

			if not dt or dt > dist then
				dt = dist
				pos = e:GetPos()
			end
		end

		if pos then
			local dist = pl_pos:Distance(pos) * 0.75 / 25.4

			if MQS.Config.UI.HUDBG == 2 then
				draw.RoundedBox(8, al1 and x - ch - 10 or x - 10, al2 and y - 105 or y + 80, ch + 20, 25, MSD.Theme["m"])
			end

			ch = draw.SimpleTextOutlined("- " .. MSD.GetPhrase("dist_to_close") .. ": " .. math.floor(dist) .. " m", "MSDFont.22", x, al2 and y - 105 or y + 80, color_white, al1 and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)
		end
	end

	local pos = obj.point
	local dist = obj.dist or 500
	if dist ^ 2 > pl_pos:DistToSqr(pos) then return end
	dist = pl_pos:Distance(pos) * 0.75 / 25.4
	local screenpos = pos:ToScreen()
	x, y = screenpos.x, screenpos.y - 50
	local icon = obj.marker and MSD.PinPoints[obj.marker]
	MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, icon or MSD.PinPoints[0], MSD.ColorAlpha(color_black, 100 + alpha * 125))
	MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, icon or MSD.PinPoints[0], MSD.ColorAlpha(icon_color, 100 + alpha * 125))
	draw.SimpleTextOutlined(math.floor(dist) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, 200), TEXT_ALIGN_CENTER, 0, 1,MSD.ColorAlpha(color_black, 200))
end

objective_draw["Kill NPC"] = function(q, obj, x, y, al1, al2)
	if not obj.show_ents then return end

	local pl_pos = ply:GetPos()
	local ent_l = MQS.ActiveTask[q.id].misc_ents
	if not ent_l then return end
	local pos
	local dt

	for _, v in pairs(ent_l) do
		local e = Entity(v)
		if not IsValid(e) then continue end
		if not e:GetNWBool("MQSTarget") then continue end

		local epos = e:GetPos()
		local dist = pl_pos:DistToSqr(epos)

		if not dt or dt > dist then
			dt = dist
			pos = epos
		end

		if dist > (obj.dist and obj.dist ^ 2 or 1000) then
			epos.z = epos.z + 50
			local screenpos = epos:ToScreen()
			local sx, sy = screenpos.x, screenpos.y
			local icon = obj.marker and MSD.PinPoints[obj.marker]
			MSD.DrawTexturedRect(sx - 12, sy - 10, 24, 24, icon or MSD.PinPoints[0],  MSD.ColorAlpha(color_black, 100))
			MSD.DrawTexturedRect(sx - 12, sy - 12, 24, 24, icon or MSD.PinPoints[0],  MSD.ColorAlpha(color_red, 100))
		end

	end

	if pos then
		local dist = pl_pos:Distance(pos) * 0.75 / 25.4

		if MQS.Config.UI.HUDBG == 2 then
			draw.RoundedBox(8, al1 and x - ch - 10 or x - 10, al2 and y - 105 or y + 80, ch + 20, 25, MSD.Theme["m"])
		end

		ch = draw.SimpleTextOutlined("- " .. MSD.GetPhrase("dist_to_close") .. ": " .. math.floor(dist) .. " m", "MSDFont.22", x, al2 and y - 105 or y + 80, color_white, al1 and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)
	end
end

objective_draw["Move to point"] = function(q, obj)
	local pos = obj.point
	local screenpos = pos:ToScreen()
	local x, y = screenpos.x, screenpos.y - 50

	if x < ScrW() / 4 or x > ScrW() - ScrW() / 4 then
		alpha = Lerp(FrameTime() * 7, alpha, 0)

		if x < 30 then
			x = 30
		end
	else
		dist_m = ply:GetPos():Distance(pos) * 0.75 / 25.4
		alpha = Lerp(FrameTime() * 7, alpha, 1)
	end

	if y < 50 then
		y = 50
	end

	if x > ScrW() - 48 then
		x = ScrW() - 48
	end

	if y > ScrH() - 48 then
		y = ScrH() - 48
	end

	local icon = obj.marker and MSD.PinPoints[obj.marker]
	MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, icon or MSD.PinPoints[0],  MSD.ColorAlpha(color_black, 100 + alpha * 125))
	MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, icon or MSD.PinPoints[0],  MSD.ColorAlpha(icon_color, 100 + alpha * 125))
	draw.SimpleTextOutlined(math.floor(dist_m) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, alpha * 200), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, alpha * 200))
end

objective_draw["Move to any point"] = function(q, obj)
	for _,v in pairs(obj.points) do
		local pos = v.point

		local screenpos = pos:ToScreen()
		local x, y = screenpos.x, screenpos.y - 50

		if x < ScrW() / 4 or x > ScrW() - ScrW() / 4 then
			alpha = Lerp(FrameTime() * 7, alpha, 0)

			if x < 30 then
				x = 30
			end
		else
			dist_m = ply:GetPos():Distance(pos) * 0.75 / 25.4
			alpha = Lerp(FrameTime() * 7, alpha, 1)
		end

		if y < 50 then
			y = 50
		end

		if x > ScrW() - 48 then
			x = ScrW() - 48
		end

		if y > ScrH() - 48 then
			y = ScrH() - 48
		end

		local icon = v.marker and MSD.PinPoints[v.marker]
		MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, icon or MSD.PinPoints[0],  MSD.ColorAlpha(color_black, 100 + alpha * 125))
		MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, icon or MSD.PinPoints[0],  MSD.ColorAlpha(icon_color, 100 + alpha * 125))
		draw.SimpleTextOutlined(math.floor(dist_m) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, alpha * 200), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, alpha * 200))
	end
end

objective_draw["Talk to NPC"] = function(q, obj)
	local npc, pos

	if MQS.NPCPositions and MQS.NPCPositions[obj.npc] then
		pos = MQS.NPCPositions[obj.npc]
	else
		for _, ent in ipairs(ents.FindByClass("mcs_npc")) do
			if ent:GetUID() == obj.npc then
				npc = ent
				break
			end
		end
		if not npc then return end
		pos = npc:GetPos()
	end

	if ply:GetPos():DistToSqr(pos) < 20000 then return end
	local screenpos = pos:ToScreen()
	local x, y = screenpos.x, screenpos.y - 20

	if x < ScrW() / 4 or x > ScrW() - ScrW() / 4 then
		alpha = Lerp(FrameTime() * 7, alpha, 0)

		if x < 30 then
			x = 30
		end
	else
		dist_m = ply:GetPos():Distance(pos) * 0.75 / 25.4
		alpha = Lerp(FrameTime() * 7, alpha, 1)
	end

	if y < 50 then
		y = 50
	end

	if x > ScrW() - 48 then
		x = ScrW() - 48
	end

	if y > ScrH() - 48 then
		y = ScrH() - 48
	end

	local icon = obj.marker and MSD.PinPoints[obj.marker]
	MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, icon or MSD.PinPoints[0],  MSD.ColorAlpha(color_black, 100 + alpha * 125))
	MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, icon or MSD.PinPoints[0],  MSD.ColorAlpha(icon_color, 100 + alpha * 125))
	draw.SimpleTextOutlined(math.floor(dist_m) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, alpha * 200), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, alpha * 200))
end

objective_draw["Enter vehicle"] = function(vehicle)
	local pos = vehicle:GetPos()
	local screenpos = pos:ToScreen()
	local x, y = screenpos.x, screenpos.y - 50

	if x < ScrW() / 4 or x > ScrW() - ScrW() / 4 then
		alpha = Lerp(FrameTime() * 7, alpha, 0)

		if x < 30 then
			x = 30
		end
	else
		alpha = Lerp(FrameTime() * 7, alpha, 1)
		dist_m = ply:GetPos():Distance(pos) * 0.75 / 25.4
	end

	if y < 50 then
		y = 50
	end

	if x > ScrW() - 48 then
		x = ScrW() - 48
	end

	if y > ScrH() - 48 then
		y = ScrH() - 48
	end

	MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, veh_marker, MSD.ColorAlpha(color_black, 100 + alpha * 125))
	MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, veh_marker, MSD.ColorAlpha(icon_color, 100 + alpha * 125))
	draw.SimpleTextOutlined(math.floor(dist_m) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, alpha * 200), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, alpha * 200))
end

objective_text["Collect quest ents"] = function() return MQS.GetSelfNWdata(ply, "quest_colected") .. "/" .. MQS.GetSelfNWdata(ply, "quest_ent") end

objective_text["Wait time"] = function(q, obj) return obj.show_timer and os.date("%M:%S", tonumber(MQS.GetSelfNWdata(ply, "quest_wait") - CurTime())) or "" end

objective_text["Kill random target"] = function(q, obj) return obj.target_count - MQS.GetSelfNWdata(ply, "targets") .. "/" .. obj.target_count end

function MQS.DoNotify(text1, text2, type)
	local startt = CurTime()
	local x, y = ScrW(), ScrH()
	local color = notification_types[type][1]
	local anim = 0
	surface.PlaySound(notification_types[type][2])

	MQS.HudNotification = function()
		surface.SetDrawColor(0, 0, 0, anim * 170)
		surface.SetMaterial(center_gradient)
		surface.DrawTexturedRectRotated(x / 2, y / 8, 250, anim * (x + 200), -90)
		local _, h = draw.SimpleTextOutlined(text1, "MSDFont.Biger", x / 2, y / 8 - 50, MSD.ColorAlpha(color, anim * 255), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, anim * 255))
		text2 = MSD.TextWrap(text2, "MSDFont.28", y)
		draw.DrawText(text2, "MSDFont.36", x / 2 + 1, y / 8 + h - 49,  MSD.ColorAlpha(color_black, anim * 255), TEXT_ALIGN_CENTER, 0)
		draw.DrawText(text2, "MSDFont.36", x / 2, y / 8 + h - 50,  MSD.ColorAlpha(color_white, anim * 255), TEXT_ALIGN_CENTER, 0)

		if startt + 8 < CurTime() then
			anim = Lerp(FrameTime() * 3, anim, 0)
		else
			anim = Lerp(FrameTime() * 5, anim, 1)
		end

		if startt + 10 < CurTime() then
			MQS.HudNotification = function() end
		end
	end
end

function MQS.DoTaskNotify(text, type)
	local startt = CurTime()
	local x, y = ScrW(), ScrH()
	local color = tasknotify_types[type][1]
	local anim = 0
	surface.PlaySound(tasknotify_types[type][2])

	MQS.HudTaskNotify = function()
		surface.SetDrawColor(0, 0, 0, anim * 100)
		surface.SetMaterial(center_gradient)
		surface.DrawTexturedRectRotated(x / 2, y - anim * (y / 8), 250, x + 200, -90)
		draw.SimpleTextOutlined(text, "MSDFont.Big", x / 2, y - anim * (y / 8 + 10), MSD.ColorAlpha(color, anim * 255), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, anim * 255))

		if startt + 5 < CurTime() then
			anim = Lerp(FrameTime() * 3, anim, 0)
		else
			anim = Lerp(FrameTime() * 5, anim, 1)
		end

		if startt + 10 < CurTime() then
			MQS.HudTaskNotify = function() end
		end
	end
end

function MQS.DoHint(text, type)
	MQS.DoTaskNotify(text, type)
	local startt = CurTime()
	local anim = 0
	local npc_table = ents.FindByClass("mqs_npc")

	if MCS then
		for _, ent in pairs(ents.FindByClass("mcs_npc")) do
			if IsValid(ent) and MCS.Spawns[ent:GetUID()] and MCS.Spawns[ent:GetUID()].questNPC then
				table.insert(npc_table, ent)
			end
		end
	end

	MQS.HudHint = function()
		for _, ent in pairs(npc_table) do
			if not IsValid(ent) then continue end

			if not ent.uialpha then
				ent.uialpha = 0.3
			end

			if not ent.uidist then
				ent.uidist = 0
			end

			local pos = ent:GetPos()
			local screenpos = pos:ToScreen()
			local sx, sy = screenpos.x, screenpos.y - 50
			local x, y = ScrW() / 2, ScrH() / 2
			x = Lerp(anim, x, sx)
			y = Lerp(anim, y, sy)

			if startt + 28 > CurTime() then
				if x < ScrW() / 3 or x > ScrW() - ScrW() / 3 then
					ent.uialpha = Lerp(FrameTime() * 7, ent.uialpha, 0.2)

					if x < 30 then
						x = 30
					end
				else
					ent.uialpha = Lerp(FrameTime() * 7, ent.uialpha, 1)
					ent.uidist = ply:GetPos():Distance(pos) * 0.75 / 25.4
				end

				if anim > 0.9 then
					draw.SimpleTextOutlined(math.floor(ent.uidist) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, ent.uialpha * 255 - 55), TEXT_ALIGN_CENTER, 0, 1, MSD.ColorAlpha(color_black, ent.uialpha * 255 - 55))
				end
			else
				ent.uialpha = Lerp(FrameTime() * 7, ent.uialpha, 0)
			end

			if y < 50 then
				y = 50
			end

			if x > ScrW() - 48 then
				x = ScrW() - 48
			end

			if y > ScrH() - 48 then
				y = ScrH() - 48
			end

			MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, MSD.Icons48.account, MSD.ColorAlpha(color_black, ent.uialpha * 255))
			MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, MSD.Icons48.account, MSD.ColorAlpha(color_white, ent.uialpha * 255))
		end

		if startt + 1.5 <= CurTime() then
			anim = Lerp(FrameTime() * 2, anim, 1)
		end

		if startt + 30 < CurTime() then
			MQS.HudHint = function() end
		end
	end
end

function MQS.UdpateTracking(pos, icon)
	local startt = CurTime()
	local anim = 0
	local dist = 0
	local alp = 0

	MQS.TrackPlayer = function()
		local screenpos = pos:ToScreen()
		local x, y = screenpos.x, screenpos.y - 50

		if x < ScrW() / 4 or x > ScrW() - ScrW() / 4 then
			alp = Lerp(FrameTime() * 7, alp, 0)

			if x < 30 then
				x = 30
			end
		else
			dist = ply:GetPos():Distance(pos) * 0.75 / 25.4
			alp = Lerp(FrameTime() * 7, alp, 1)
		end

		local a = alp * 200

		if y < 50 then
			y = 50
		end

		if x > ScrW() - 48 then
			x = ScrW() - 48
		end

		if y > ScrH() - 48 then
			y = ScrH() - 48
		end

		MSD.DrawTexturedRect(x - 24, y - 22, 48, 48, icon or MSD.PinPoints[0], MSD.ColorAlpha(color_black, 55 + a * anim))
		MSD.DrawTexturedRect(x - 24, y - 24, 48, 48, icon or MSD.PinPoints[0], MSD.ColorAlpha(color_red, 55 + a * anim))
		draw.SimpleTextOutlined(math.floor(dist) .. " m", "MSDFont.25", x, y + 35, MSD.ColorAlpha(color_white, a * anim), TEXT_ALIGN_CENTER, 0, 1,  MSD.ColorAlpha(color_black, a * anim))

		if startt + 6 < CurTime() then
			anim = Lerp(FrameTime() * 3, anim, 0)
		else
			anim = Lerp(FrameTime() * 3, anim, 1)
		end

		if startt + 7 < CurTime() then
			MQS.TrackPlayer = function() end
		end
	end
end

function MQS.PendingQuest(x, y, right, bottom)
	local q = MQS.HasQuest()
	if q or not (not MQS.Config.IntoQuestAutogive and MQS.CanPlayIntro(ply)) then return end
	local qw = MQS.Quests[MQS.Config.IntoQuest]

	if MQS.Config.UI.HUDBG == 1 then
		MSD.DrawTexturedRect(right and x - wm - 75 or x - 25, bottom and y - 55 or y - 10, wm + 100, 65, right and MSD.Materials.gradient_right or MSD.Materials.gradient, MSD.Theme["m"])
		MSD.DrawTexturedRect(right and x - wm - 75 or x - 25, bottom and y - 107 or y + 55, wm + 100, 52, right and MSD.Materials.gradient_right or MSD.Materials.gradient, MSD.Theme["d"])
	end

	if MQS.Config.UI.HUDBG == 2 then
		draw.RoundedBox(8, right and x - wm - 80 or x - 10, bottom and y - 55 or y - 10, wm + 90, 65, MSD.Theme["d"])
		draw.RoundedBox(8, right and x - w3 - 10 or x - 10, bottom and y - 80 or y + 55, w3 + 20, 25, MSD.Theme["m"])
	end

	MSD.DrawTexturedRect(right and x - 48 or x, bottom and y - 48 or y, 48, 48, qw.custom_icon and MSD.ImgLib.GetMaterial(qw.custom_icon) or info_icon, color_white)

	local tw = draw.SimpleTextOutlined(qw.desc, "MSDFont.28", right and x - 55 or x + 55, bottom and y - 38 or y + 10, color_white, right and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)
	local tw2 = draw.SimpleTextOutlined(MSD.GetPhrase("into_quest_start", string.upper(input.GetKeyName(MQS.Config.StopKey))), "MSDFont.25", right and x - 70 - tw or x + 70 + tw, bottom and y - 36 or y + 12, icon_color, right and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)
	if MQS.KeyHOLD then
		draw.RoundedBox(2, right and x - 70 - tw or x + 70 + tw, bottom and y - 36 or y + 42, tw2 * ((MQS.KeyHOLD - CurTime()) / 2), 5, icon_color)
	end
end

function MQS.DrawQuestInfo(x, y, right, bottom)
	local q = MQS.HasQuest()
	local string_add = ""
	local time = ""
	if not q or not IsValid(ply) then return end
	local obj = MQS.GetNWdata(ply, "quest_objective")
	if not obj then return end
	obj = MQS.Quests[q.quest].objects[obj]

	if MQS.Config.UI.HUDBG == 1 then
		MSD.DrawTexturedRect(right and x - wm - 75 or x - 25, bottom and y - 55 or y - 10, wm + 100, 65, right and MSD.Materials.gradient_right or MSD.Materials.gradient, MSD.Theme["m"])
		MSD.DrawTexturedRect(right and x - wm - 75 or x - 25, bottom and y - 107 or y + 55, wm + 100, 52, right and MSD.Materials.gradient_right or MSD.Materials.gradient, MSD.Theme["d"])
	end

	if MQS.Config.UI.HUDBG == 2 then
		draw.RoundedBox(8, right and x - wm - 80 or x - 10, bottom and y - 55 or y - 10, wm + 90, 65, MSD.Theme["d"])
		draw.RoundedBox(8, right and x - w3 - 10 or x - 10, bottom and y - 80 or y + 55, w3 + 20, 25, MSD.Theme["m"])
	end

	MSD.DrawTexturedRect(right and x - 48 or x, bottom and y - 48 or y, 48, 48, MQS.Quests[q.quest].custom_icon and MSD.ImgLib.GetMaterial(MQS.Quests[q.quest].custom_icon) or info_icon, color_white)

	if MQS.GetNWdata(ply, "do_time") then
		time = ". " .. MSD.GetPhrase("q_time_left") .. " - " .. os.date("%M:%S", MQS.GetNWdata(ply, "do_time") - CurTime())
	end

	w1 = draw.SimpleTextOutlined(MSD.GetPhrase("q_in_progress") .. time, "MSDFont.28", right and x - 55 or x + 55, bottom and y - 38 or y + 10, color_white, right and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)

	if MQS.Quests[q.quest].stop_anytime or (MQS.GetNWdata(ply, "loops") and not MQS.Quests[q.quest].reward_on_time and MQS.GetNWdata(ply, "loops") > 0) then
		w2 = draw.SimpleTextOutlined(MSD.GetPhrase("q_hold_key_stop", string.upper(input.GetKeyName(MQS.Config.StopKey))), "MSDFont.25", right and x - 70 - w1 or x + 70 + w1, bottom and y - 36 or y + 12, icon_color, right and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)

		if MQS.KeyHOLD then
			draw.RoundedBox(2, right and x - 70 - w1 or x + 70 + w1, bottom and y - 36 or y + 42, w2 * ((MQS.KeyHOLD - CurTime()) / 2), 5, icon_color)
		end
	end

	if objective_text[obj.type] then
		string_add = " " .. objective_text[obj.type](q, obj)
	end

	local vehicle = MQS.ActiveTask[q.id].vehicle and Entity(MQS.ActiveTask[q.id].vehicle)

	if IsValid(vehicle) and MQS.GetActiveVehicle(ply) ~= vehicle and vehicle_req_task[obj.type] and not obj.ignore_veh then
		w3 = draw.SimpleTextOutlined("- " .. MSD.GetPhrase("q_enter_veh"), "MSDFont.22", x, bottom and y - 80 or y + 55, color_white, right and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)
		objective_draw["Enter vehicle"](vehicle)
	else
		w3 = draw.SimpleTextOutlined("- " .. obj.desc .. string_add, "MSDFont.22", x, bottom and y - 80 or y + 55, color_white, right and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT, 0, 1, color_black)

		if objective_draw[obj.type] then
			objective_draw[obj.type](q, obj, x, y, right, bottom)
		end
	end

	wm = math.max(w1 + w2, w3)
end

local fix

function MQS.EntInfo()
	local ent = LocalPlayer():GetEyeTrace().Entity

	if not IsValid(ent) or ent:GetClass() ~= "mqs_ent" then return end

	if not ent:GetUseHold() or ent:GetTPly() ~= LocalPlayer() then
		ent = fix
		if not IsValid(fix) or LocalPlayer() ~= ent:GetTPly() then
			return
		end
	end

	local ent_p = ent:GetPickProgress()

	if ent_p and ent_p > 0 then
		local x, y = ScrW() / 2, ScrH() / 2 + 100
		local wd = draw.SimpleTextOutlined(MSD.GetPhrase("hold_use", string.upper(input.LookupBinding("+use"))), "MSDFont.25", x, y, color_white, TEXT_ALIGN_CENTER, 0, 1,color_black)
		local pr =  wd * ent_p
		draw.RoundedBox(2, (x - wd / 2) - 1, y + 24, wd + 2, 7, color_black)
		draw.RoundedBox(2, x - wd / 2, y + 25, pr, 5, icon_color)
	end
end

net.Receive("MQS.FixPickUP", function()
	fix = net.ReadEntity()
end)
--PATH addons/mc_quests/lua/mqs/ui/editor_panel.lua:
local Ln = MSD.GetPhrase
local mouleid = 0

local blank_quest = {
	name = Ln("q_new"),
	desc = "",
	success = "",
	active = false,
	new = true,
}

local blank_quest_new = table.Copy(blank_quest)

local blank_npc = {
	name = Ln("npc_new"),
	model = "models/Humans/Group01/Male_0" .. math.random(1, 9) .. ".mdl",
	text = "",
	text_notask = "",
	answer_yes = "",
	answer_no = "",
	answer_notask = "",
	skin = 0,
	bgr = {},
	spawns = {},
}

local active_quest
local last_sm = "ui"

if not file.Exists("mqs", "DATA") then
	file.CreateDir("mqs")
end

local function AutoSave()
	if not active_quest or not active_quest.new then return end
	file.Write("mqs/autosave.txt", util.TableToJSON(active_quest))
end

local function LoadAutoSave()
	if file.Exists("mqs/autosave.txt", "DATA") then
		local jsontable = file.Read("mqs/autosave.txt", "DATA")
		blank_quest = util.JSONToTable(jsontable)
		active_quest = blank_quest
	end
end

local function QuestListPanel(parent, k, v, openPage)
	local qpnl = vgui.Create("DPanel")
	qpnl.StaticScale = {
		w = 4,
		fixed_h = 120,
		minw = 200,
		minh = 120
	}

	qpnl.Paint = function(self, w, h)
		draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.Theme["d"])
		draw.DrawText(v.name, "MSDFont.25", 10, 10, color_white, TEXT_ALIGN_LEFT)
		local active = MQS.Config.NPC.enable and v.link or v.active
		MSD.DrawTexturedRect(w - 32, h - 32, 32, 32, MSD.Icons48.dot, active and MSD.Config.MainColor["p"] or MSD.Text.n)
		draw.DrawText(Ln(active and "active" or "inactive"), "MSDFont.16", w - 28, h - 25, MSD.Text.d, TEXT_ALIGN_RIGHT)
	end

	local bpnl = vgui.Create("MSDPanelList", qpnl)
	bpnl:SetSize(200, 36)
	bpnl:DockMargin(5, 5, 5, 5)
	bpnl:SetSpacing(2)
	bpnl:EnableHorizontal(true)
	bpnl:Dock(BOTTOM)

	MSD.IconButtonBG(bpnl, MSD.Icons48.play, nil, nil, 36, nil, MSD.Config.MainColor.p, function()
		RunConsoleCommand("mqs_start", k)
	end)

	MSD.IconButtonBG(bpnl, v.notloaded and MSD.Icons48.save or MSD.Icons48.pencil, nil, nil, 36, nil, MSD.Config.MainColor.p, function()
		openPage("edit", true, true, k, v)
		if v.notloaded then MQS.ReQuest(k) end
	end)

	parent:AddItem(qpnl)
end

function MQS.OpenMenuManager(parrent, editor, npc)
	if MQS.IsEditor(LocalPlayer()) then
		MSD.OpenMenuManager(nil, mouleid)
	elseif not editor then
		if MQS.Config.NPC.enable and not npc then
			local found = false

			for _, e in ipairs(ents.FindByClass("mqs_npc")) do
				if IsValid(e) then
					found = true
					break
				end
			end

			MQS.DoHint(found and Ln("q_get") or Ln("q_noquests"), found and 4 or 2)
		else
			MQS.OpenPlayerMenu(parrent)
		end
	else
		MQS.SmallNotify(Ln("need_admin"), nil, 1)
	end
end

net.Receive("MQS.GetPlayersQuests", function()
	if not IsValid(MQS.PlayerDataPanel) then return end
	local sid = net.ReadString()
	local bytes_number = net.ReadInt(32)
	local compressed_data = net.ReadData(bytes_number)
	local data = MQS.TableDecompress(compressed_data)
	MQS.PlayerDataPanel.Update(data, sid)
end)

net.Receive("MQS.OpenEditor", function()
	MQS.OpenMenuManager()
end)

concommand.Add("mqs_editor", function(pl, cmd, args)
	MQS.OpenMenuManager()
end)

function MQS.NPCAnimationMenu(parent, ent, setanim)
	local mx, my = gui.MousePos()
	local frame = vgui.Create("DFrame")
	frame:SetSize(300, 400)
	frame:SetPos(mx - 300, my - 400)
	frame:SetDraggable(true)
	frame:ShowCloseButton(true)
	frame:MakePopup()
	frame:SetTitle("Animations List")
	frame.StartT = CurTime() + 2

	frame.Think = function(self)
		if not IsValid(parent) or (not self:HasFocus() and self.StartT < CurTime()) then
			self:Close()
		end
	end

	local AnimList = vgui.Create("DListView", frame)
	AnimList:AddColumn("name")
	AnimList:Dock(FILL)
	AnimList:SetMultiSelect(false)
	AnimList:SetHideHeaders(true)

	for k, v in SortedPairsByValue(ent:GetSequenceList() or {}) do
		local line = AnimList:AddLine(string.lower(v))

		line.OnSelect = function()
			setanim(v)
		end
	end

	return frame
end

function MQS.OpenAdminMenu(panel, mainPanel)

	if not panel then return end
	MQS.SetupMenu = panel

	function mainPanel.ModuleSwitch()
		MQS.SetupMenu = nil
		MQS.UpdateMenuElements = nil
		AutoSave()
	end

	panel.Canvas = vgui.Create("MSDPanelList", panel)
	panel.Canvas:SetSize(panel:GetWide() - 252, panel:GetTall())
	panel.Canvas:SetPos(252, 0)
	panel.Canvas:EnableVerticalScrollbar()
	panel.Canvas:EnableHorizontal(true)
	panel.Canvas:SetSpacing(2)
	panel.Canvas.IgnoreVbar = true
	panel.Canvas.Paint = function() end
	local pages = {}
	local cur_page = nil

	local function openPage(id, animate, ...)
		panel.Canvas:Clear()
		back_page = cur_page
		pages[id](...)
		cur_page = id

		if animate then
			panel.Canvas:SetAlpha(1)
			panel.Canvas:AlphaTo(255, 0.2)
		end
	end

	panel.OnQuestUpdate = function(qid)
		if cur_page == "quests" then
			openPage("quests", true)

			return
		end

		if active_quest and active_quest.id == qid then
			openPage("quests", true)

			return
		end
	end

	local buttons = {}

	buttons[1] = {
		Ln("quests"), MSD.Icons48.layers, function()
			openPage("quests", true)
		end,
		true
	}
	if MQS.IsAdministrator(LocalPlayer()) then
		buttons[2] = {
			Ln("npc_editor"), MSD.Icons48.account_multiple, function()
				openPage("npcs", true)
			end
		}
		buttons[3] = {
			Ln("settings"), MSD.Icons48.cog, function()
				openPage("settings", true)
			end
		}
	end

	panel.Menu = vgui.Create("MSDPanelList", panel)
	panel.Menu:SetSize(250, panel:GetTall())
	panel.Menu:SetPos(0, 0)
	panel.Menu:EnableVerticalScrollbar()
	panel.Menu:EnableHorizontal(false)
	panel.Menu:SetSpacing(0)
	panel.Menu.IgnoreVbar = true

	panel.Menu.Paint = function(self, w, h)
		draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.Theme["l"])
	end

	panel.Menu.Deselect = function(but)
		if not but then return end
		but.hovered = true

		for k, v in pairs(panel.Menu:GetItems()) do
			if v and v:IsValid() and v ~= but then
				v.hovered = false
			end
		end
	end

	local function PopupMenu(text, x, y, w, dwd)
		local pl, child = MSD.WorkSpacePanel(mainPanel, text, x, y, false)
		local sub_list = vgui.Create("MSDPanelList", child)
		sub_list:SetSize(dwd and child:GetWide() / dwd or child:GetWide() - 10, child:GetTall() - w)
		sub_list:SetPos(5, w)
		sub_list:EnableVerticalScrollbar()
		sub_list:EnableHorizontal(true)
		sub_list:SetSpacing(2)
		sub_list.IgnoreVbar = true

		return sub_list, child, pl
	end

	pages["quests"] = function()
		if MQS.Config.Sort then
			local catgr = {}
			MSD.Header(panel.Canvas, Ln("unsorted"), function()
				openPage("search")
			end, MSD.Icons48.search)

			MSD.BigButton(panel.Canvas, "static", nil, 4, 120, Ln("q_addnew"), MSD.Icons48.layers_plus, function()
				openPage("edit", true, true, true)
			end)

			for k, v in pairs(MQS.Quests) do
				if not v.category then
					QuestListPanel(panel.Canvas, k, v, openPage)
					continue
				end
				if catgr[v.category] then
					catgr[v.category][k] = true
				else
					catgr[v.category] = { [k] = true }
				end
			end

			for name, qlist in pairs(catgr) do
				MSD.Header(panel.Canvas, name)
				for k, _ in pairs(qlist) do
					QuestListPanel(panel.Canvas, k, MQS.Quests[k], openPage)
				end
			end
		else
			MSD.Header(panel.Canvas, Ln("quest_list"), function()
				openPage("search")
			end, MSD.Icons48.search)

			MSD.BigButton(panel.Canvas, "static", nil, 4, 120, Ln("q_addnew"), MSD.Icons48.layers_plus, function()
				openPage("edit", true, true, true)
			end)

			for k, v in pairs(MQS.Quests) do
				QuestListPanel(panel.Canvas, k, v, openPage)
			end
		end
	end

	pages["search"] = function()
		local obj_sets

		MSD.Header(panel.Canvas, Ln("search"), function()
			openPage("quests")
		end)

		MSD.TextEntry(panel.Canvas, "static", nil, 1, 50, Ln("enter_name") .. "/ID", Ln("search_q") .. ":", "", function(self, value)
			obj_sets.Update(value)
		end, true)

		obj_sets = vgui.Create("MSDPanelList")
		obj_sets:SetSize(panel.Canvas:GetWide(), panel.Canvas:GetTall() - 110)
		obj_sets:EnableVerticalScrollbar()
		obj_sets:EnableHorizontal(true)
		obj_sets:SetSpacing(2)
		obj_sets:SetPadding(0)
		obj_sets.IgnoreVbar = true
		obj_sets.Update = function(value)
			obj_sets:Clear()
			for k, v in pairs(MQS.Quests) do
				if not value then continue end
				if not string.find(string.lower(k), string.lower(value), 1, true) and not string.find(string.lower(v.name), string.lower(value), 1, true) then continue end
			 	QuestListPanel(obj_sets, k, v, openPage)
			end
		end
		obj_sets.Update("")
		panel.Canvas:AddItem(obj_sets)
	end

	pages["edit"] = function(open, id, quest)
		if open then
			if not quest and id == true then
				quest = blank_quest
				id = blank_quest.id or "new_quest"

				if not quest.edited then
					local pl, _, plm = PopupMenu(Ln("load_autosave"), 3, 5, 55)

					MSD.Button(pl, "static", nil, 1, 50, Ln("load_save"), function()
						LoadAutoSave()
						plm.Close()
					end)

					MSD.Button(pl, "static", nil, 1, 50, Ln("create_new"), function()
						active_quest = table.Copy(blank_quest_new)
						active_quest.id = "new_quest"
						plm.Close()
					end)
				end
				quest.edited = true
			end
			active_quest = quest
			active_quest.id = id
		end

		MSD.Header(panel.Canvas, Ln("quest_editor"), function()
			openPage("quests", true)
			AutoSave()
		end)

		MSD.BigButton(panel.Canvas, "static", nil, 3, 180, Ln("main_opt"), MSD.Icons48.playlist_edit, function()
			openPage("edit_page1", true)
		end)

		MSD.BigButton(panel.Canvas, "static", nil, 3, 180, Ln("q_editobj"), MSD.Icons48.calendar_check, function()
			openPage("edit_page2", true)
		end)

		MSD.BigButton(panel.Canvas, "static", nil, 3, 180, Ln("q_editrwd"), MSD.Icons48.seal, function()
			openPage("edit_page3", true)
		end)

		if active_quest.new then
			MSD.BigButton(panel.Canvas, "static", nil, 3, 100, Ln("q_submit"), MSD.Icons48.submit, function()
				if MQS.Quests[active_quest.id] then
					local pl, _, plm = PopupMenu(Ln("q_id_unique"), 3, 5, 55)

					MSD.Button(pl, "static", nil, 1, 50, Ln("ok"), function()
						plm.Close()
					end)
					return
				end
				openPage("quests", true)
				active_quest.temp_data = nil
				active_quest.edited = nil

				MQS.QuestSubmit(active_quest)
			end)

			MSD.BigButton(panel.Canvas, "static", nil, 3, 100, Ln("copy_data"), MSD.Icons48.copy, function()
				openPage("quests_copy", true)
			end)
		else
			MSD.BigButton(panel.Canvas, "static", nil, 3, 100, Ln("save_chng"), MSD.Icons48.save, function()
				active_quest.temp_data = nil
				openPage("quests", true)
				MQS.QuestSubmit(active_quest)
			end)

			MSD.BigButton(panel.Canvas, "static", nil, 3, 100, Ln("remove"), MSD.Icons48.layers_remove, function()
				local pl, _, plm = PopupMenu(Ln("confirm_action"), 3, 5, 55)

				MSD.Button(pl, "static", nil, 1, 50, Ln("q_remove"), function()
					openPage("quests", true)
					net.Start("MQS.QuestRemove")
					net.WriteString(active_quest.id)
					net.SendToServer()
					plm.Close()
				end)

				MSD.Button(pl, "static", nil, 1, 50, Ln("cancel"), function()
					plm.Close()
				end)
			end)
		end

		MSD.BigButton(panel.Canvas, "static", nil, 3, 100, Ln("check_fpr_errors"), MSD.Icons48.alert, function()
			MQS.PreCheckQuest(active_quest, PopupMenu)
		end)
	end

	pages["edit_page1"] = function()
		MSD.Header(panel.Canvas, Ln("main_opt"), function()
			openPage("edit", true)
		end)

		MSD.TextEntry(panel.Canvas, "static", nil, MQS.Config.Sort and 3 or 2, 50, Ln("enter_name"), Ln("name") .. ":", active_quest.name, function(self, value)
			active_quest.name = value
		end, true)

		if not active_quest.oldid then
			active_quest.oldid = active_quest.id
		end

		MSD.TextEntry(panel.Canvas, "static", nil, MQS.Config.Sort and 3 or 2, 50, Ln("enter_id"), "ID:", active_quest.id, function(self, value)
			if not MQS.CheckID(value) then
				self.error = Ln("inv_quest") .. " ID"
				return
			end

			if MQS.Quests[value] and active_quest.oldid ~= value then
				self.error = Ln("q_id_unique")
				return
			end

			active_quest.id = value
			self.error = nil
		end, true)

		if MQS.Config.Sort then
			MSD.TextEntry(panel.Canvas, "static", nil, 3, 50, Ln("category_des"), Ln("category"), active_quest.category, function(self, value)
				active_quest.category = value ~= "" and value or nil
			end, true)
		end

		MSD.TextEntry(panel.Canvas, "static", nil, 1, 200, Ln("enter_description"), nil, active_quest.desc, function(self, value)
			active_quest.desc = value
		end, true, nil, true)

		MSD.TextEntry(panel.Canvas, "static", nil, 1, 50, Ln("e_text"), Ln("q_complete_msg") .. ":", active_quest.success, function(self, value)
			active_quest.success = value
		end, true)

		local sld1, sld2

		MSD.TextEntry(panel.Canvas, "static", nil, 3, 50, Ln("e_blank_dis"), Ln("q_dotime") .. "(" .. Ln("in_sec") .. "):", active_quest.do_time, function(self, value)
			active_quest.do_time = tonumber(value) or nil

			if not active_quest.do_time then
				sld1.disabled = true
			else
				sld1.disabled = nil
			end
		end, true, nil, nil, true)

		MSD.DTextSlider(panel.Canvas, "static", nil, 3, 50, Ln("q_dotime_ok"), Ln("q_dotime_fail"), active_quest.reward_on_time, function(self, value)
			active_quest.reward_on_time = value
		end)

		MSD.BoolSlider(panel.Canvas, "static", nil, 3, 50, Ln("q_stop_anytime"), active_quest.stop_anytime, function(self, value)
			active_quest.stop_anytime = value
		end)

		sld1 = MSD.BoolSlider(panel.Canvas, "static", nil, 2, 50, Ln("q_loop"), active_quest.looped, function(self, value)
			active_quest.looped = value
			sld2.disabled = not value
		end)

		if not active_quest.do_time then
			sld1.disabled = true
		else
			sld1.disabled = nil
		end

		sld2 = MSD.BoolSlider(panel.Canvas, "static", nil, 2, 50, Ln("q_loop_reward"), active_quest.reward_ower_loop, function(self, value)
			active_quest.reward_ower_loop = value
		end)

		sld2.disabled = not active_quest.looped

		MSD.BoolSlider(panel.Canvas, "static", nil, 2, 50, Ln("q_death_fail"), active_quest.fail_ondeath, function(self, value)
			active_quest.fail_ondeath = value
		end)

		MSD.DTextSlider(panel.Canvas, "static", nil, 2, 50, Ln("q_cooldow_publick"), Ln("q_cooldow_perply"), active_quest.cooldow_perply, function(self, value)
			active_quest.cooldow_perply = value
		end)

		MSD.TextEntry(panel.Canvas, "static", nil, 2, 50, Ln("e_blank_dis"), Ln("cooldown_ok") .. "(" .. Ln("in_sec") .. "):", active_quest.cool_down, function(self, value)
			active_quest.cool_down = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.TextEntry(panel.Canvas, "static", nil, 2, 50, Ln("e_blank_dis"), Ln("cooldown_fail") .. "(" .. Ln("in_sec") .. "):", active_quest.cool_down_onfail, function(self, value)
			active_quest.cool_down_onfail = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.TextEntry(panel.Canvas, "static", nil, 3, 50, Ln("e_blank_dis"), Ln("q_ply_limit") .. ":", active_quest.limit, function(self, value)
			active_quest.limit = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.TextEntry(panel.Canvas, "static", nil, 3, 50, Ln("e_blank_dis"), Ln("q_ply_need") .. ":", active_quest.need_players, function(self, value)
			active_quest.need_players = tonumber(value) or nil
		end, true, nil, nil, true)

		MSD.Button(panel.Canvas, "static", nil, 3, 50, Ln("q_ply_team_limit"), function()
			local sub_list, child = PopupMenu(Ln("q_ply_team_need"), 2, 1.2, 102)
			local update

			MSD.BoolSlider(child, 5, 50, child:GetWide() - 10, 50, Ln("enable_option"), active_quest.need_teamplayers and true or false, function(self, var)
				if var then
					active_quest.need_teamplayers = {}
				else
					active_quest.need_teamplayers = nil
				end

				update()
			end)

			update = function()
				if not sub_list then return end
				sub_list:Clear()
				if not active_quest.need_teamplayers then return end
				MSD.InfoHeader(sub_list, Ln("e_blank_dis"))

				for tid, tm in SortedPairsByMemberValue(team.GetAllTeams(), "Name", true) do
					if not tm.Joinable then continue end

					MSD.TextEntry(sub_list, "static", nil, 2, 50, "", tm.Name, active_quest.need_teamplayers[tid], function(self, val)
						active_quest.need_teamplayers[tid] = val ~= "" and val or nil
					end, true, nil, nil, true)
				end
			end

			update()
		end)

		local combo = MSD.ComboBox(panel.Canvas, "static", nil, 2, 50, Ln("q_needquest_menu") .. ":", Ln("none"))
		combo:AddChoice(Ln("none"))

		combo.OnSelect = function(self, index, text, data)
			if text == Ln("none") then
				active_quest.quest_needed = nil
				return
			end
			if active_quest.quest_blacklist and active_quest.quest_blacklist[data] then return end
			active_quest.quest_needed = data
		end

		for k, v in pairs(MQS.Quests) do
			if active_quest.id == k then continue end
			if v.quest_needed and v.quest_needed == active_quest.id then continue end
			if v.looped then continue end

			if active_quest.quest_needed == k then
				combo:SetValue(v.name)
			end

			combo:AddChoice(v.name, k)
		end

		MSD.BoolSlider(panel.Canvas, "static", nil, 2, 50, Ln("q_dis_replay"), active_quest.cant_replay, function(self, value)
			active_quest.cant_replay = value
		end)

		MSD.Button(panel.Canvas, "static", nil, 2, 50, Ln("s_team_whitelist"), function()
			local sub_list, child = PopupMenu(Ln("s_team_whitelist"), 2, 1.2, 102)
			local update

			MSD.BoolSlider(child, 5, 50, child:GetWide() - 10, 50, Ln("enable_option"), active_quest.team_whitelist and true or false, function(self, var)
				if var then
					active_quest.team_whitelist = {}
				else
					active_quest.team_whitelist = nil
				end

				update()
			end)

			update = function()
				if not sub_list then return end
				sub_list:Clear()
				if not active_quest.team_whitelist then return end

				for id, tm in SortedPairsByMemberValue(team.GetAllTeams(), "Name", true) do
					if not tm.Joinable then continue end

					MSD.BoolSlider(sub_list, "static", nil, 2, 50, tm.Name, active_quest.team_whitelist[id], function(self, var)
						active_quest.team_whitelist[id] = var
					end)
				end
			end

			update()
		end)

		MSD.BoolSlider(panel.Canvas, "static", nil, 2, 50, Ln("whitelist_blacklist"), active_quest.team_blacklist, function(self, value)
			active_quest.team_blacklist = value
		end)

		if MQS.Config.NPC.enable then
			local npclist = MSD.ComboBox(panel.Canvas, "static", nil, 2, 50, Ln("q_npc_link") .. ":", Ln("none"))
			npclist:AddChoice(Ln("none"))

			npclist.OnSelect = function(self, index, text, data)
				if text == Ln("none") then
					active_quest.link = nil

					return
				end

				active_quest.link = data
			end

			for k, v in pairs(MQS.Config.NPC.list) do
				if not istable(active_quest.link) and active_quest.link == k then
					npclist:SetValue(v.name)
				end

				npclist:AddChoice(v.name, k)
			end

			if MCS then
				for k, v in pairs(MCS.Spawns) do
					if istable(active_quest.link) and active_quest.link.id == k then
						npclist:SetValue("[MCS] " .. v.name)
					end

					if not v.questNPC then continue end

					npclist:AddChoice("[MCS] " .. v.name, {
						id = k,
						base = "mcs"
					})
				end
			end
		elseif MQS.IsAdministrator(LocalPlayer()) then
			MSD.BoolSlider(panel.Canvas, "static", nil, 2, 50, Ln("q_enable"), active_quest.active or false, function(self, value)
				active_quest.active = value
			end)
		end

		MSD.Button(panel.Canvas, "static", nil, 2, 50, Ln("custom_icon"), function()
			local sub_list, child = PopupMenu(Ln("custom_icon"), 2, 3, 102)
			local update

			MSD.BoolSlider(child, 5, 50, child:GetWide() - 10, 50, Ln("enable_option"), active_quest.custom_icon and true or false, function(self, var)
				if var then
					active_quest.custom_icon = ""
				else
					active_quest.custom_icon = nil
				end

				update()
			end)

			update = function()
				if not sub_list then return end
				sub_list:Clear()
				if not active_quest.custom_icon then return end

				MSD.TextEntry(sub_list, "static", nil, 1, 50, Ln("q_icon68"), Ln("e_url"), active_quest.custom_icon, function(self, val)
					if val ~= "" then
						active_quest.custom_icon = val
					end
				end, true)

				local ops_panel = vgui.Create("DPanel")
				ops_panel:SetSize(sub_list:GetWide(), sub_list:GetTall() - 50)

				ops_panel.Paint = function(self, w, h)
					MSD.DrawTexturedRect(5, 5, 68, 68, MSD.ImgLib.GetMaterial(active_quest.custom_icon), color_white)
				end

				sub_list:AddItem(ops_panel)
			end

			update()
		end)
		local update_bl, update_cl
		MSD.Button(panel.Canvas, "static", nil, 2, 50, Ln("s_quest_blacklist"), function()
			local _, child = MSD.WorkSpacePanel(mainPanel, Ln("s_quest_blacklist_desc"), 1, 1.2, false)

			local q_list = vgui.Create("MSDPanelList", child)
			q_list:SetSize(child:GetWide() / 2 - 15, child:GetTall() - 102)
			q_list:SetPos(5, 102)
			q_list:EnableVerticalScrollbar()
			q_list:EnableHorizontal(true)
			q_list:SetSpacing(2)
			q_list.IgnoreVbar = true

			local b_list = vgui.Create("MSDPanelList", child)
			b_list:SetSize(child:GetWide() / 2 - 15, child:GetTall() - 102)
			b_list:SetPos(10 + child:GetWide() / 2 - 15, 102)
			b_list:EnableVerticalScrollbar()
			b_list:EnableHorizontal(true)
			b_list:SetSpacing(2)
			b_list.IgnoreVbar = true

			local status = active_quest.quest_blacklist and true or false
			MSD.BoolSlider(child, 5, 50, child:GetWide() - 10, 50, Ln("enable_option"), status, function(self, var)
				if var then
					active_quest.quest_blacklist = {}
				else
					active_quest.quest_blacklist = nil
				end

				update_bl(var, q_list, b_list)
			end)
			update_bl(status, q_list, b_list)
		end)

		MSD.Button(panel.Canvas, "static", nil, 2, 50, Ln("s_quest_conflictlist"), function()
			local _, child = MSD.WorkSpacePanel(mainPanel, Ln("s_quest_conflictlist_desc"), 1, 1.2, false)

			local q_list = vgui.Create("MSDPanelList", child)
			q_list:SetSize(child:GetWide() / 2 - 15, child:GetTall() - 102)
			q_list:SetPos(5, 102)
			q_list:EnableVerticalScrollbar()
			q_list:EnableHorizontal(true)
			q_list:SetSpacing(2)
			q_list.IgnoreVbar = true

			local b_list = vgui.Create("MSDPanelList", child)
			b_list:SetSize(child:GetWide() / 2 - 15, child:GetTall() - 102)
			b_list:SetPos(10 + child:GetWide() / 2 - 15, 102)
			b_list:EnableVerticalScrollbar()
			b_list:EnableHorizontal(true)
			b_list:SetSpacing(2)
			b_list.IgnoreVbar = true

			local status = active_quest.conflictlist and true or false
			MSD.BoolSlider(child, 5, 50, child:GetWide() - 10, 50, Ln("enable_option"), status, function(self, var)
				if var then
					active_quest.conflictlist = {}
				else
					active_quest.conflictlist = nil
				end

				update_cl(var, q_list, b_list)
			end)
			update_cl(status, q_list, b_list)
		end)

		update_bl = function(upd, q_list, b_list)
			q_list:Clear()
			b_list:Clear()

			if not upd then return end

			MSD.InfoHeader(q_list, Ln("quest_list"))
			MSD.InfoHeader(b_list, Ln("blacklist"))
			for k, v in pairs(MQS.Quests) do
				if active_quest.id == k then continue end
				if active_quest.quest_needed == k then continue end

				local sts = active_quest.quest_blacklist[k]
				local paretnt = sts and b_list or q_list
				MSD.Button(paretnt, "static", nil, 1, 50, v.name, function()
					if sts then
						active_quest.quest_blacklist[k] = nil
					else
						active_quest.quest_blacklist[k] = true
					end
					update_bl(upd, q_list, b_list)
				end)
			end
		end

		update_cl = function(upd, q_list, b_list)
			q_list:Clear()
			b_list:Clear()

			if not upd then return end

			MSD.InfoHeader(q_list, Ln("quest_list"))
			MSD.InfoHeader(b_list, Ln("blacklist"))
			for k, v in pairs(MQS.Quests) do
				if active_quest.id == k then continue end

				local sts = active_quest.conflictlist[k]
				local paretnt = sts and b_list or q_list
				MSD.Button(paretnt, "static", nil, 1, 50, v.name, function()
					if sts then
						active_quest.conflictlist[k] = nil
					else
						active_quest.conflictlist[k] = true
					end
					update_cl(upd, q_list, b_list)
				end)
			end
		end
	end

	pages["edit_page2"] = function()
		local SwapEvents = false

		MSD.Header(panel.Canvas, Ln("q_editobj"), function()
			openPage("edit", true)
		end)

		if not active_quest.objects then active_quest.objects = {} end

		local ccl = MQS.Config.SmallObj
		local obj_panels = {}
		for t_id, object in pairs(active_quest.objects) do
			if not MSD.ObjeciveList[object.type] then
				MSD.BigButton(panel.Canvas, "static", nil, ccl and 6 or 4, ccl and 80 or 120, Ln("q_incvobj"), MSD.Icons48.alert, function()
					table.remove(active_quest.objects, t_id)
					openPage("edit_page2", true)
				end, MSD.Config.MainColor["r"])
				continue
			end

			obj_panels[t_id] = MSD.BigButton(panel.Canvas, "static", nil, ccl and 6 or 4, ccl and 80 or 120, object.type, MSD.ObjeciveList[object.type].icon, function()
				if SwapEvents then
					local new_object = table.Copy(active_quest.objects[SwapEvents])
					active_quest.objects[SwapEvents] = object
					active_quest.objects[t_id] = new_object
					openPage("edit_page2", true)
					return
				end

				if not MSD.ObjeciveList[object.type].builUI then return end

				panel.Canvas:Clear()

				openPage("edit_objective", true, t_id, object)

			end, nil, t_id, function(self)

				if SwapEvents then return end

				if (IsValid(self.Menu)) then
					self.Menu:Remove()
					self.Menu = nil
				end

				self.Menu = MSD.MenuOpen(false, self)

				if t_id > 1 then
					self.Menu:AddOption(Ln("moveup"), function()
						local new_object = table.Copy(active_quest.objects[t_id - 1])
						active_quest.objects[t_id - 1] = object
						active_quest.objects[t_id] = new_object
						openPage("edit_page2", true)
					end)
				end

				if t_id ~= #active_quest.objects then
					self.Menu:AddOption(Ln("movedown"), function()
						local new_object = table.Copy(active_quest.objects[t_id + 1])
						active_quest.objects[t_id + 1] = object
						active_quest.objects[t_id] = new_object
						openPage("edit_page2", true)
					end)
				end

				self.Menu:AddOption(Ln("swap"), function()
					local hd = MSD.BigButton(panel.Canvas, "static", nil, 1, 80, Ln("swapmod"), MSD.Icons48.swap, function()
						openPage("edit_page2", true)
					end)

					panel.Canvas:InsertAtTop(hd)
					SwapEvents = t_id
					self.disable = true
					self.color_idle = MSD.Config.MainColor["r"]
				end)

				self.Menu:AddOption(Ln("duplicate"), function()
					table.insert(active_quest.objects, table.Copy(object))
					openPage("edit_page2", true)
				end)

				self.Menu:AddOption(Ln("editmod"), function()
					openPage("edit_objmod", true)
				end)

				self.Menu:AddOption(Ln("remove"), function()
					table.remove(active_quest.objects, t_id)
					openPage("edit_page2", true)
				end)

				local x, y = self:LocalToScreen(0, self:GetTall())
				self.Menu:SetMinimumWidth(self:GetWide())
				self.Menu:Open(x, y, false, self)
			end, (object.desc ~= object.type and not ccl) and object.desc or "", function(s, wd, hd)
				if object.type == "Skip to" and s.hover and object.oid then
					if not IsValid(obj_panels[object.oid]) then return end
					obj_panels[object.oid].hl = true
					return
				end

				if s.hl then
					draw.RoundedBox(MSD.Config.Rounded, 0, 0, wd, hd, MSD.Text["a"])
					s.hl = nil
				end

				if object.type ~= "Randomize" or not s.hover or not object.objects then return end
				for k,v in pairs(object.objects) do
					if not IsValid(obj_panels[k]) then continue end
					obj_panels[k].hl = v
				end
			end)
		end

		MSD.BigButton(panel.Canvas, "static", nil, ccl and 6 or 4, ccl and 80 or 120, Ln("q_newobj"), MSD.Icons48.plus, function(self)
			if (IsValid(self.Menu)) then
				self.Menu:Remove()
				self.Menu = nil
			end

			self.Menu = MSD.MenuOpen(false, self)

			for k, v in pairs(MSD.ObjeciveList) do
				if v.check and not v.check() then continue end
				if k == "Collect quest ents" and active_quest.objects and active_quest.objects[#active_quest.objects] and active_quest.objects[#active_quest.objects].type == k then continue end

				self.Menu:AddOption(Ln(k), function()
					if not active_quest.objects then
						active_quest.objects = {}
					end

					local ix = table.insert(active_quest.objects, table.Copy(v.tbl))
					active_quest.objects[ix].desc = k
					active_quest.objects[ix].type = k

					if active_quest.objects[ix].point then
						active_quest.objects[ix].point = LocalPlayer():GetPos()
					end

					openPage("edit_page2", true)
				end, v.icon)
			end

			local x, y = self:LocalToScreen(0, self:GetTall())
			self.Menu:SetMinimumWidth(self:GetWide())
			self.Menu:Open(x, y, false, self)
		end)
	end

	pages["edit_objmod"] = function()

		MSD.Header(panel.Canvas, Ln("edit_objmod"), function()
			openPage("edit_page2", true)
		end)

		local ccl = MQS.Config.SmallObj
		local qstart = nil
		local qend = nil

		local function copy_obj()
			local count = (qend - qstart)
			for i = 0,count do
				table.insert(active_quest.objects, table.Copy(active_quest.objects[qstart + i]))
			end
			openPage("edit_objmod", false)
		end

		local function remove_obj()
			local count = (qend - qstart)
			for i = 0,count do
				table.remove(active_quest.objects, qstart)
			end
			openPage("edit_objmod", false)
		end

		local function move_obj_to(t_id)
			local count = (qend - qstart)
			local temp_t = {}
			for i = 0,count do
				table.insert(temp_t, table.Copy(active_quest.objects[qstart + i]))
			end
			for i = 0,count do
				table.remove(active_quest.objects, qstart)
			end
			local add = t_id > qend and count or 0
			for i = 0,count do
				table.insert(active_quest.objects, t_id + i - add, table.Copy(temp_t[1 + i]))
			end
			openPage("edit_objmod", false)
		end

		for t_id, object in pairs(active_quest.objects) do
			local valid = MSD.ObjeciveList[object.type]

			MSD.BigButton(panel.Canvas, "static", nil, ccl and 6 or 4, ccl and 80 or 120, object.type, valid and valid.icon or MSD.Icons48.alert, function()
				if not qstart or not qend then
					qstart = t_id
					qend = t_id
					return
				end

				if t_id > qend then
					qend = t_id
					return
				end

				if t_id < qstart then
					qstart = t_id
					return
				end

				qstart = nil
				qend = nil
			end, nil, t_id, function(self)
				if not qstart or not qend then return end
				if (IsValid(self.Menu)) then
					self.Menu:Remove()
					self.Menu = nil
				end

				self.Menu = MSD.MenuOpen(false, self)

				if t_id >= qstart and t_id <= qend then
					self.Menu:AddOption(Ln("duplicate"), function()
						copy_obj()
					end)
					self.Menu:AddOption(Ln("remove"), function()
						remove_obj()
					end)
				else
					self.Menu:AddOption(Ln("move"), function()
						move_obj_to(t_id)
					end)
				end

				local x, y = self:LocalToScreen(0, self:GetTall())
				self.Menu:SetMinimumWidth(self:GetWide())
				self.Menu:Open(x, y, false, self)
			end, (object.desc ~= object.type and not ccl) and object.desc or "", function(s, wd, hd)
				if qstart and qend and t_id >= qstart and t_id <= qend then
					draw.RoundedBox(MSD.Config.Rounded, 0, 0, wd, hd, MSD.Text["a"])
				end
			end)
		end
	end

	pages["edit_objective"] = function(t_id, object)

		if not object.events then object.events = {} end

		MSD.Header(panel.Canvas, Ln(object.type), function() openPage("edit_page2", true) end)

		local ops_panel = vgui.Create("DPanel")
		ops_panel:SetSize(panel.Canvas:GetWide(), panel.Canvas:GetTall() - 52)

		ops_panel.Paint = function(self, w, h)
			draw.RoundedBox(MSD.Config.Rounded, 0, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.RoundedBox(MSD.Config.Rounded, w / 2, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.DrawText(Ln("q_setobj"), "MSDFont.25", 12, 12, color_white, TEXT_ALIGN_LEFT)
			draw.DrawText(Ln("q_events"), "MSDFont.25", w / 2 + 12, 12, color_white, TEXT_ALIGN_LEFT)
		end

		local obj_sets = vgui.Create("MSDPanelList", ops_panel)
		obj_sets:SetSize(ops_panel:GetWide() / 2, ops_panel:GetTall() - 52)
		obj_sets:SetPos(0, 52)
		obj_sets:EnableVerticalScrollbar()
		obj_sets:EnableHorizontal(true)
		obj_sets:SetSpacing(2)
		obj_sets:SetPadding(0)
		obj_sets.IgnoreVbar = true

		local obj_events = vgui.Create("MSDPanelList", ops_panel)
		obj_events:SetSize(ops_panel:GetWide() / 2 - 2, ops_panel:GetTall() - 52)
		obj_events:SetPos(ops_panel:GetWide() / 2, 52)
		obj_events:EnableVerticalScrollbar()
		obj_events:EnableHorizontal(true)
		obj_events:SetSpacing(2)
		obj_events:SetPadding(0)
		obj_events.IgnoreVbar = true

		obj_sets.Populate = function()
			obj_sets:Clear()
			MSD.ObjeciveList[object.type].builUI(t_id, object, obj_sets, PopupMenu, active_quest, obj_events)
		end

		obj_events.Populate = function()
			obj_events:Clear()

			MSD.Button(obj_events, "static", nil, 1, 50, Ln("q_eventadd"), function(self)
				if (IsValid(self.Menu)) then
					self.Menu:Remove()
					self.Menu = nil
				end

				self.Menu = MSD.MenuOpen(false, self, false)

				for k, v in pairs(MSD.EventList) do
					if v.check and ((isstring(v.check) and v.check ~= object.type) or (isfunction(v.check) and v.check())) then continue end

					self.Menu:AddOption(Ln(k), function()

						local ix = table.insert(object.events, {k})

						object.events[ix][2] = istable(v.data) and table.Copy(v.data) or v.data
						obj_events.Populate()
					end, v.icon)
				end

				local x, y = self:LocalToScreen(0, self:GetTall())
				self.Menu:SetMinimumWidth(self:GetWide())
				self.Menu:Open(x, y, false, self)
			end)

			if not object.events then return end

			for eid, event in pairs(object.events) do

				MSD.ButtonIcon(obj_events, "static", nil, 1, 50, Ln(event[1]), MSD.EventList[event[1]].icon, function(self)
					if not MSD.EventList[event[1]].builUI then return end
					local sub_list = PopupMenu("\"" .. Ln(event[1]) .. "\" " .. Ln("q_eventedit"), 2, MSD.EventList[event[1]].ui_h or 1.2, 50)
					sub_list:Clear()
					MSD.EventList[event[1]].builUI(event, sub_list, t_id, object)
				end, function(self)
					if (IsValid(self.Menu)) then self.Menu:Remove() self.Menu = nil end

					self.Menu = MSD.MenuOpen(false, self)

					self.Menu:AddOption(Ln("duplicate"), function()
						table.insert(object.events, table.Copy(event))
						obj_events.Populate()
					end)

					self.Menu:AddOption(Ln("q_eventremove"), function()
						table.remove(object.events, eid)
						obj_events.Populate()
					end)

					local prev_ent = object.events[eid - 1]

					self.Menu:AddOption(Ln("moveup"), function()
						object.events[eid] = table.Copy(prev_ent)
						object.events[eid - 1] = table.Copy(event)
						obj_events.Populate()
					end, nil, function()
						return prev_ent
					end)


					local next_ent = object.events[eid + 1]

					self.Menu:AddOption(Ln("movedown"), function()
						object.events[eid] = table.Copy(next_ent)
						object.events[eid + 1] = table.Copy(event)
						obj_events.Populate()
					end, nil, function()
						return next_ent
					end)


					local x, y = self:LocalToScreen(0, self:GetTall())
					self.Menu:SetMinimumWidth(self:GetWide())
					self.Menu:Open(x, y, false, self)
				end)
			end
		end

		panel.Canvas:AddItem(ops_panel)
		obj_sets.Populate()
		obj_events.Populate()
	end

	pages["edit_page3"] = function()
		MSD.Header(panel.Canvas, Ln("q_rwdeditor"), function()
			openPage("edit", true)
		end)

		if not MQS.IsAdministrator(LocalPlayer()) then
			local pnl = vgui.Create("DPanel")
			pnl.StaticScale = {
				w = 1,
				h = 1.1,
				minw = 150,
				minh = 150
			}
			pnl.Paint = function(self, w, h)
				MSD.DrawTexturedRect(w / 2 - 24, h / 2 - 50, 48, 48, MSD.Icons48.cancel, MSD.Text["n"])
				draw.DrawText(MSD.GetPhrase("need_admin"), "MSDFont.25", w / 2, h / 2 + 10, MSD.Text["n"], TEXT_ALIGN_CENTER)
			end

			panel.Canvas:AddItem(pnl)
			return
		end

		local ops_panel = vgui.Create("DPanel")
		ops_panel:SetSize(panel.Canvas:GetWide(), panel.Canvas:GetTall() - 52)

		ops_panel.Paint = function(self, w, h)
			draw.RoundedBox(MSD.Config.Rounded, 0, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.RoundedBox(MSD.Config.Rounded, w / 2, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.DrawText(Ln("q_rwdlist"), "MSDFont.25", 12, 12, color_white, TEXT_ALIGN_LEFT)
			draw.DrawText(Ln("q_rwdsets"), "MSDFont.25", w / 2 + 12, 12, color_white, TEXT_ALIGN_LEFT)
		end

		local rwd_set, rwd_list
		rwd_list = vgui.Create("MSDPanelList", ops_panel)
		rwd_list:SetSize(ops_panel:GetWide() / 2, ops_panel:GetTall() - 52)
		rwd_list:SetPos(0, 52)
		rwd_list:EnableVerticalScrollbar()
		rwd_list:EnableHorizontal(true)
		rwd_list:SetSpacing(2)
		rwd_list:SetPadding(0)
		rwd_list.IgnoreVbar = true

		rwd_list.Populate = function()
			rwd_list:Clear()

			if not active_quest.reward then
				active_quest.reward = {}
			end

			for rw_name, rw_data in pairs(MQS.Rewards) do
				if not MQS.RewardsList[rw_name] then continue end
				if rw_data.check and rw_data.check() then continue end

				MSD.BoolSlider(rwd_list, "static", nil, 1, 50, Ln("enable") .. " '" .. Ln(rw_name) .. "'", active_quest.reward[rw_name] and true or false, function(self, var)
					if var then
						active_quest.reward[rw_name] = istable(MQS.RewardsList[rw_name].data) and table.Copy(MQS.RewardsList[rw_name].data) or MQS.RewardsList[rw_name].data
					else
						active_quest.reward[rw_name] = nil
					end

					rwd_set.Populate()
				end)
			end
		end

		rwd_set = vgui.Create("MSDPanelList", ops_panel)
		rwd_set:SetSize(ops_panel:GetWide() / 2 - 2, ops_panel:GetTall() - 52)
		rwd_set:SetPos(ops_panel:GetWide() / 2, 52)
		rwd_set:EnableVerticalScrollbar()
		rwd_set:EnableHorizontal(true)
		rwd_set:SetSpacing(2)
		rwd_set:SetPadding(0)
		rwd_set.IgnoreVbar = true

		rwd_set.Populate = function()
			rwd_set:Clear()
			if not active_quest.reward then return end

			for rid, rdata in pairs(active_quest.reward) do
				if MQS.Rewards[rid].check and MQS.Rewards[rid].check() then continue end
				MSD.InfoHeader(rwd_set, rid)
				MQS.RewardsList[rid].builUI(active_quest.reward[rid], rwd_set)
			end
		end

		panel.Canvas:AddItem(ops_panel)
		rwd_list.Populate()
		rwd_set.Populate()
	end

	pages["quests_copy"] = function()
		MSD.Header(panel.Canvas, Ln("copy_data"), function()
			openPage("edit", true)
		end)

		local ops_panel = vgui.Create("DPanel")
		ops_panel:SetSize(panel.Canvas:GetWide(), panel.Canvas:GetTall() - 52)

		ops_panel.Paint = function(self, w, h)
			draw.RoundedBox(MSD.Config.Rounded, 0, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.RoundedBox(MSD.Config.Rounded, w / 2, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.DrawText(Ln("quest_list"), "MSDFont.25", 12, 12, color_white, TEXT_ALIGN_LEFT)
			draw.DrawText(Ln("q_findmap"), "MSDFont.25", w / 2 + 12, 12, color_white, TEXT_ALIGN_LEFT)
		end

		local rwd_set, rwd_list
		rwd_list = vgui.Create("MSDPanelList", ops_panel)
		rwd_list:SetSize(ops_panel:GetWide() / 2, ops_panel:GetTall() - 52)
		rwd_list:SetPos(0, 52)
		rwd_list:EnableVerticalScrollbar()
		rwd_list:EnableHorizontal(true)
		rwd_list:SetSpacing(2)
		rwd_list:SetPadding(0)
		rwd_list.IgnoreVbar = true

		rwd_list.Populate = function()
			rwd_list:Clear()

			for k, v in pairs(MQS.Quests) do
				MSD.Button(rwd_list, "static", nil, 1, 50, "[" .. k .. "] " .. v.name, function()
					active_quest = table.Copy(v)
					active_quest.id = k .. "_copy"
					active_quest.name = v.name .. " Copy"
					active_quest.new = true
					openPage("edit", true)
				end, true)
			end
		end

		rwd_set = vgui.Create("MSDPanelList", ops_panel)
		rwd_set:SetSize(ops_panel:GetWide() / 2 - 2, ops_panel:GetTall() - 52)
		rwd_set:SetPos(ops_panel:GetWide() / 2, 52)
		rwd_set:EnableVerticalScrollbar()
		rwd_set:EnableHorizontal(true)
		rwd_set:SetSpacing(2)
		rwd_set:SetPadding(0)
		rwd_set.IgnoreVbar = true

		rwd_set.Populate = function()
			rwd_set:Clear()

			MSD.TextEntry(rwd_set, "static", nil, 1, 50, Ln("e_text"), Ln("map") .. ":", "", function(self, value)
				net.Start("MQS.GetOtherQuests")
				net.WriteString(value)
				net.SendToServer()
			end, false)

			if MQS.AltDate and MQS.AltDate.Quests then
				for k, v in pairs(MQS.AltDate.Quests) do
					MSD.Button(rwd_set, "static", nil, 1, 50, "[" .. k .. "] " .. v.name, function()
						active_quest = table.Copy(v)
						active_quest.id = k .. "_copy"
						active_quest.name = v.name .. " Copy"
						active_quest.new = true
						openPage("edit", true)
					end, true)
				end
			end
		end

		MQS.AltDateUpdate = function(arguments)
			if IsValid(rwd_set) then
				rwd_set.Populate()
			end
		end

		panel.Canvas:AddItem(ops_panel)
		rwd_list.Populate()
		rwd_set.Populate()
	end

	pages["npcs"] = function()
		if not MQS.Config.NPC.enable then
			local pnl = vgui.Create("DPanel")

			pnl.StaticScale = {
				w = 1,
				h = 1,
				minw = 150,
				minh = 150
			}

			pnl.Paint = function(self, w, h)
				MSD.DrawTexturedRect(w / 2 - 24, h / 2 - 50, 48, 48, MSD.Icons48.account, MSD.Text["n"])
				draw.DrawText(Ln("Quest NPCs are disabled"), "MSDFont.25", w / 2, h / 2 + 10, MSD.Text["n"], TEXT_ALIGN_CENTER)
				draw.DrawText(Ln("You can enable them in settings"), "MSDFont.25", w / 2, h / 2 + 35, MSD.Text["n"], TEXT_ALIGN_CENTER)
			end

			panel.Canvas:AddItem(pnl)

			return
		end

		local npctab = MSD.Header(panel.Canvas, Ln("npc_editor"))

		MQS.UpdateMenuElements = function()
			if IsValid(npctab) then
				openPage("npcs", true)
			end
		end

		local function EditNPC(id, npc)
			local rwd_list, child, pn = PopupMenu(Ln("npc_editor"), 1, 1.1, 50, 1.5)

			if not id then
				npc = table.Copy(blank_npc)
			end

			local map = string.lower(game.GetMap())

			if not npc.spawns[map] then
				npc.spawns[map] = {Vector(0, 0, 0), Angle(0, 0, 0),}
			end

			local pnw = child:GetWide()
			local mdlp = MSD.NPCModelFrame(child, pnw - pnw / 3, 50, pnw / 3 - 10, child:GetTall() - 100, npc.model, npc.sequence)
			MSD.Button(child, pnw - pnw / 3, child:GetTall() - 50, pnw / 3 - 10, 50, Ln("set_anim"), function()
				MQS.NPCAnimationMenu(pn, mdlp.Entity, function(v)
					mdlp.Entity:ResetSequence(v)
					mdlp.Entity:SetCycle(0)
					npc.sequence = string.lower(v)
				end)
			end)

			MSD.TextEntry(rwd_list, "static", nil, 1, 50, Ln("enter_name"), Ln("name") .. ":", npc.name, function(self, value)
				npc.name = value
			end, true)

			local mdl = MSD.TextEntry(rwd_list, "static", nil, 1.5, 50, Ln("e_model"), Ln("model") .. ":", npc.model, function(self, value)
				npc.model = value
				mdlp:UpdateModelValue(value)
			end, true)

			MSD.Button(rwd_list, "static", nil, 3, 50, Ln("copy_from_ent"), function()
				local md = LocalPlayer():GetEyeTrace().Entity
				if not md then return end
				md = md:GetModel()
				mdl:SetText(md)
				npc.model = md
			end)

			MSD.TextEntry(rwd_list, "static", nil, 1, 150, Ln("npc_e_speech"), "", npc.text, function(self, value)
				npc.text = value
			end, true, nil, true)

			MSD.TextEntry(rwd_list, "static", nil, 1, 50, Ln("e_text"), Ln("q_npc_answer_ok") .. ":", npc.answer_yes, function(self, value)
				npc.answer_yes = value
			end, true)

			MSD.TextEntry(rwd_list, "static", nil, 1, 50, Ln("e_text"), Ln("q_npc_answer_no") .. ":", npc.answer_no, function(self, value)
				npc.answer_no = value
			end, true)

			MSD.TextEntry(rwd_list, "static", nil, 1, 50, Ln("e_text"), Ln("q_npc_quest_no") .. ":", npc.text_notask, function(self, value)
				npc.text_notask = value
			end, true)

			MSD.TextEntry(rwd_list, "static", nil, 1, 50, Ln("e_text"), Ln("q_npc_answer_noq") .. ":", npc.answer_notask, function(self, value)
				npc.answer_notask = value
			end, true)

			local vecd = MSD.VectorDisplay(rwd_list, "static", nil, 1, 50, Ln("spawn_point"), npc.spawns[map][1], function() end)
			local amgl = MSD.AngleDisplay(rwd_list, "static", nil, 1, 50, Ln("spawn_ang"), npc.spawns[map][2], function() end)

			MSD.Button(rwd_list, "static", nil, 3, 50, Ln("set_pos_self"), function()
				local vec = LocalPlayer():GetPos()
				vecd.vector = vec
				npc.spawns[map][1] = vec
				local ang = Angle(0, LocalPlayer():GetAngles().y, 0)
				amgl.angle = ang
				npc.spawns[map][2] = ang
			end)

			MSD.Button(rwd_list, "static", nil, 3, 50, Ln("set_pos_aim"), function()
				local vec = LocalPlayer():GetEyeTrace().HitPos
				if not vec then return end
				vecd.vector = vec
				npc.spawns[map][1] = vec
				local ang = Angle(0, LocalPlayer():GetAngles().y, 0)
				amgl.angle = ang
				npc.spawns[map][2] = ang
			end)

			MSD.Button(rwd_list, "static", nil, 3, 50, Ln("copy_from_ent"), function()
				local vec = LocalPlayer():GetEyeTrace().Entity
				if not vec then return end
				local ang = vec:GetAngles()
				amgl.angle = ang
				npc.spawns[map][2] = ang
				vec = vec:GetPos()
				vecd.vector = vec
				npc.spawns[map][1] = vec
			end)

			if not id then
				MSD.BigButton(rwd_list, "static", nil, 1, 80, Ln("npc_submit"), MSD.Icons48.submit, function()
					MQS.CreateNPC(npc)
					pn.Close()
				end)
			else
				MSD.BigButton(rwd_list, "static", nil, 2, 80, Ln("npc_update"), MSD.Icons48.save, function()
					openPage("npcs", true)
					MQS.UpdateNPC(id, npc)
					pn.Close()
				end)

				MSD.BigButton(rwd_list, "static", nil, 2, 80, Ln("npc_remove"), MSD.Icons48.layers_remove, function()
					openPage("npcs", true)
					MQS.UpdateNPC(id, npc, true)
					pn.Close()
				end)
			end
		end

		MSD.BigButton(panel.Canvas, "static", nil, 4, 120, Ln("npc_new"), MSD.Icons48.account_edit, function()
			EditNPC()
		end)

		for k, v in pairs(MQS.Config.NPC.list) do
			MSD.BigButton(panel.Canvas, "static", nil, 4, 120, v.name, MSD.Icons48.account, function()
				EditNPC(k, v)
			end, nil, nil, function(self)
				if (IsValid(self.Menu)) then
					self.Menu:Remove()
					self.Menu = nil
				end

				self.Menu = MSD.MenuOpen(false, self)

				self.Menu:AddOption(Ln("remove"), function()
					MQS.UpdateNPC(k, v, true)
					openPage("npcs", true)
				end)

				local x, y = self:LocalToScreen(0, self:GetTall())
				self.Menu:SetMinimumWidth(self:GetWide())
				self.Menu:Open(x, y, false, self)
			end)
		end
	end

	pages["settings"] = function()
		local oldcfg = table.Copy(MQS.Config)
		MSD.Header(panel.Canvas, Ln("settings"))
		local ops_panel = vgui.Create("DPanel")
		ops_panel:SetSize(panel.Canvas:GetWide(), panel.Canvas:GetTall() - 135)

		ops_panel.Paint = function(self, w, h)
			draw.RoundedBox(MSD.Config.Rounded, 0, 0, w / 2 - 2, h, MSD.Theme["l"])
			draw.RoundedBox(MSD.Config.Rounded, w / 2, 0, w / 2 - 2, h, MSD.Theme["l"])
		end

		local rwd_set, rwd_list
		rwd_list = vgui.Create("MSDPanelList", ops_panel)
		rwd_list:SetSize(ops_panel:GetWide() / 2, ops_panel:GetTall() - 2)
		rwd_list:SetPos(0, 0)
		rwd_list:EnableVerticalScrollbar()
		rwd_list:EnableHorizontal(true)
		rwd_list:SetSpacing(2)
		rwd_list:SetPadding(0)
		rwd_list.IgnoreVbar = true

		rwd_list.Populate = function()
			rwd_list:Clear()

			MSD.Button(rwd_list, "static", nil, 1, 50, Ln("set_hud"), function()
				rwd_set.Populate("hud")
			end)

			MSD.Button(rwd_list, "static", nil, 1, 50, Ln("set_server"), function()
				rwd_set.Populate("server")
			end)

			MSD.Button(rwd_list, "static", nil, 1, 50, Ln("access_editors"), function()
				rwd_set.Populate("access_editors")
			end)

			MSD.Button(rwd_list, "static", nil, 1, 50, Ln("access_admins"), function()
				rwd_set.Populate("access_admins")
			end)

			MSD.Button(rwd_list, "static", nil, 1, 50, Ln("user_data"), function()
				rwd_set.Populate("user_data")
			end)

			MSD.Button(rwd_list, "static", nil, 1, 50, Ln("Export") .. "/" .. Ln("Import"), function()
				rwd_set.Populate("export")
			end)
		end

		rwd_set = vgui.Create("MSDPanelList", ops_panel)
		rwd_set:SetSize(ops_panel:GetWide() / 2 - 2, ops_panel:GetTall() - 2)
		rwd_set:SetPos(ops_panel:GetWide() / 2, 0)
		rwd_set:EnableVerticalScrollbar()
		rwd_set:EnableHorizontal(true)
		rwd_set:SetSpacing(2)
		rwd_set:SetPadding(0)
		rwd_set.IgnoreVbar = true
		rwd_set.SetingList = {}

		rwd_set.Populate = function(seting)
			if not rwd_set.SetingList[seting] then return end
			MQS.PlayerDataPanel = nil
			rwd_set:Clear()
			rwd_set.SetingList[seting]()
			last_sm = seting
		end

		rwd_set.SetingList["hud"] = function()
			MSD.Header(rwd_set, Ln("set_hud_pos"))

			MSD.DTextSlider(rwd_set, "static", nil, 1, 50, Ln("set_ui_align_right"), Ln("set_ui_align_left"), MQS.Config.UI.HudAlignX, function(self, value)
				MQS.Config.UI.HudAlignX = value
			end)

			MSD.DTextSlider(rwd_set, "static", nil, 1, 50, Ln("set_ui_align_top"), Ln("set_ui_align_bottom"), MQS.Config.UI.HudAlignY, function(self, value)
				MQS.Config.UI.HudAlignY = value
			end)

			MSD.VolumeSlider(rwd_set, "static", nil, 1, 50, Ln("set_ui_offset_h"), MQS.Config.UI.HudOffsetX, function(self, var)
				MQS.Config.UI.HudOffsetX = math.Round(var, 3)
			end)

			MSD.VolumeSlider(rwd_set, "static", nil, 1, 50, Ln("set_ui_offset_v"), MQS.Config.UI.HudOffsetY, function(self, var)
				MQS.Config.UI.HudOffsetY = math.Round(var, 3)
			end)

			MSD.Header(rwd_set, Ln("set_hud_themes"))
			local tm1, tm2, tm3

			tm1 = MSD.Button(rwd_set, "static", nil, 3, 50, Ln("theme") .. " 1", function()
				MQS.Config.UI.HUDBG = 0
				tm1.hovered = true
				tm2.hovered = false
				tm3.hovered = false
			end)

			tm2 = MSD.Button(rwd_set, "static", nil, 3, 50, Ln("theme") .. " 2", function()
				MQS.Config.UI.HUDBG = 1
				tm1.hovered = false
				tm2.hovered = true
				tm3.hovered = false
			end)

			tm3 = MSD.Button(rwd_set, "static", nil, 3, 50, Ln("theme") .. " 3", function()
				MQS.Config.UI.HUDBG = 2
				tm1.hovered = false
				tm2.hovered = false
				tm3.hovered = true
			end)

			if MQS.Config.UI.HUDBG == 0 then
				tm1.hovered = true
			elseif MQS.Config.UI.HUDBG == 1 then
				tm2.hovered = true
			else
				tm3.hovered = true
			end
		end

		rwd_set.SetingList["server"] = function()
			MSD.Header(rwd_set, Ln("set_server"))

			MSD.TextEntry(rwd_set, "static", nil, 1, 50, Ln("e_number"), Ln("q_ent_draw"), MQS.Config.QuestEntDrawDist, function(self, value)
				MQS.Config.QuestEntDrawDist = tonumber(value) or 500
			end, true, nil, nil, true)

			MSD.Binder(rwd_set, "static", nil, 1, 50, Ln("q_loop_stop_key"), MQS.Config.StopKey, function(num)
				MQS.Config.StopKey = num
			end)

			MSD.BoolSlider(rwd_set, "static", nil, 1, 50, Ln("npc_q_enable"), MQS.Config.NPC.enable, function(self, value)
				MQS.Config.NPC.enable = value
			end)

			MSD.BoolSlider(rwd_set, "static", nil, 1, 50, Ln("sortquests_cat"), MQS.Config.Sort, function(self, value)
				MQS.Config.Sort = value
			end)

			MSD.BoolSlider(rwd_set, "static", nil, 1, 50, Ln("compact_obj"), MQS.Config.SmallObj, function(self, value)
				MQS.Config.SmallObj = value
			end)

			MSD.BoolSlider(rwd_set, "static", nil, 1, 50, Ln("mqs_fix_cam"), MQS.Config.CamFix, function(self, value)
				MQS.Config.CamFix = value
			end)

			local combo = MSD.ComboBox(rwd_set, "static", nil, 1, 50, Ln("into_quest") .. ":", Ln("none"))
			combo:AddChoice(Ln("none"), "")

			combo.OnSelect = function(self, index, text, data)
				MQS.Config.IntoQuest = data
			end

			for k, v in pairs(MQS.Quests) do
				if v.quest_needed or v.looped then continue end

				if MQS.Config.IntoQuest == k then
					combo:SetValue(v.name)
				end

				combo:AddChoice(v.name, k)
			end

			MSD.BoolSlider(rwd_set, "static", nil, 1, 50, Ln("into_quest_auto"), MQS.Config.IntoQuestAutogive, function(self, value)
				MQS.Config.IntoQuestAutogive = value
			end)

		end

		rwd_set.SetingList["access_admins"] = function()
			MSD.Header(rwd_set, Ln("access_admins"))

			local entr = MSD.TextEntry(rwd_set, "static", nil, 1.5, 50, Ln("e_usergroup"), Ln("add_usergroup"), "", function(self, value)
				MQS.Config.Administrators[value] = true
				if MQS.Config.Editors[value] then MQS.Config.Editors[value] = nil end
				rwd_set.Populate("access_admins")
			end)

			MSD.Button(rwd_set, "static", nil, 3, 50, Ln("add_usergroup"), function()
				entr:OnEnter(entr:GetValue())
			end)

			for ugr, stat in pairs(MQS.Config.Administrators) do
				MSD.Header(rwd_set, ugr, function()
					MQS.Config.Administrators[ugr] = nil
					rwd_set.Populate("access_admins")
				end, MSD.Icons48.cancel, true)
			end
		end

		rwd_set.SetingList["access_editors"] = function()
			MSD.Header(rwd_set, Ln("access_editors"))

			local entr = MSD.TextEntry(rwd_set, "static", nil, 1.5, 50, Ln("e_usergroup"), Ln("add_usergroup"), "", function(self, value)
				if MQS.Config.Administrators[value] then
					self.error = Ln("ug_isanadmin")
					return
				end
				MQS.Config.Editors[value] = true
				rwd_set.Populate("access_editors")
				self.error = nil
			end)

			MSD.Button(rwd_set, "static", nil, 3, 50, Ln("add_usergroup"), function()
				entr:OnEnter(entr:GetValue())
			end)

			for ugr, stat in pairs(MQS.Config.Editors) do
				MSD.Header(rwd_set, ugr, function()
					MQS.Config.Editors[ugr] = nil
					rwd_set.Populate("access_editors")
				end, MSD.Icons48.cancel, true)
			end
		end

		rwd_set.SetingList["user_data"] = function()
			MQS.PlayerDataPanel = rwd_set

			MQS.PlayerDataPanel.Update = function(data, sid)
				rwd_set:Clear()
				MSD.Header(rwd_set, Ln("user_data"))

				MSD.TextEntry(rwd_set, "static", nil, 1, 50, "STEAM_0:0:0000", Ln("find_player_id32"), sid or "", function(self, value)
					net.Start("MQS.GetPlayersQuests")
						net.WriteString(value)
					net.SendToServer()
				end)

				if not data or not data.QuestList then return end
				MSD.InfoHeader(rwd_set, "Quest ID", 2)
				MSD.InfoHeader(rwd_set, "Data", 2)
				for k, v in pairs(data.QuestList) do
					MSD.InfoHeader(rwd_set, k, 2)
					MSD.TextEntry(rwd_set, "static", nil, 2, 25, "", "", v, function(self, value)
						data.QuestList[k] = value
					end, true, nil, nil, true)
				end

				MSD.BigButton(rwd_set, "static", nil, 1, 75, Ln("save_chng"), MSD.Icons48.save, function()
					local cd, bn = MQS.TableCompress(data.QuestList)

					net.Start("MQS.SavePlayerQuestList")
					net.WriteString(sid)
						net.WriteInt(bn, 32)
						net.WriteData(cd, bn)
					net.SendToServer()
					MQS.PlayerDataPanel.Update()
				end)
			end

			MQS.PlayerDataPanel.Update()
		end

		rwd_set.SetingList["export"] = function()
			MSD.Header(rwd_set, Ln("Export") .. "/" .. Ln("Import"))
			MSD.InfoHeader(rwd_set, "Data saves to garrysmod/data/mqs/")

			local export_quest, import_quest
			local combo = MSD.ComboBox(rwd_set, "static", nil, 1, 50, Ln("quest_list") .. ":", Ln("none"))
			combo.OnSelect = function(self, index, text, data)
				export_quest = data
			end
			for k, v in pairs(MQS.Quests) do
				combo:AddChoice(v.name, k)
			end

			MSD.Button(rwd_set, "static", nil, 1, 50, Ln("Export"), function()
				if not export_quest then return end
				if not MQS.Quests[export_quest] then return end

				if file.Exists("mqs/" .. export_quest .. ".txt", "DATA") then
					local pl, _, plm = PopupMenu(Ln("file_exist"), 3, 4, 55)

					MSD.Button(pl, "static", nil, 1, 50, Ln("Replace"), function()
						file.Write("mqs/" .. export_quest .. ".txt", util.TableToJSON(MQS.Quests[export_quest]))
						surface.PlaySound("garrysmod/save_load2.wav")
						plm.Close()
					end)

					MSD.Button(pl, "static", nil, 1, 50, Ln("Save as") .. " " .. export_quest .. os.time(), function()
						file.Write("mqs/" .. export_quest .. os.time() .. ".txt", util.TableToJSON(MQS.Quests[export_quest]))
						surface.PlaySound("garrysmod/save_load1.wav")
						plm.Close()
					end)

					MSD.Button(pl, "static", nil, 1, 50, Ln("cancel"), function()
						plm.Close()
					end)

					return
				end

				file.Write("mqs/" .. export_quest .. ".txt", util.TableToJSON(MQS.Quests[export_quest]))
				surface.PlaySound("garrysmod/save_load1.wav")
			end)

			local import = MSD.ComboBox(rwd_set, "static", nil, 1, 50, Ln("file_list") .. ":", Ln("none"))
			import.OnSelect = function(self, index, text, data)
				import_quest = data
			end
			local files = file.Find( "mqs/*.txt", "DATA" )
			if files then
				for k, v in pairs(files) do
					import:AddChoice(v, v)
				end
			else
				import:AddChoice(Ln("none"), false)
			end

			MSD.Button(rwd_set, "static", nil, 1, 50, Ln("Import"), function()
				if not import_quest then return end
				if not file.Exists("mqs/" .. import_quest, "DATA" ) then return end
				local filename = string.Explode(".", import_quest)
				local quest_id = filename[1]
				local imported_quest = util.JSONToTable(file.Read("mqs/" .. import_quest, "DATA"))
				imported_quest.id = MQS.Quests[quest_id] and quest_id .. os.time() or quest_id
				MQS.QuestSubmit(imported_quest)
				surface.PlaySound("garrysmod/content_downloaded.wav")
			end)
		end

		panel.Canvas:AddItem(ops_panel)
		rwd_list.Populate()
		rwd_set.Populate(last_sm)

		if MQS.IsAdministrator(LocalPlayer()) then
			MSD.BigButton(panel.Canvas, "static", nil, 2, 80, Ln("upl_changes"), MSD.Icons48.save, function()
				MQS.SaveConfig()
				openPage("settings", true)
			end)

			MSD.BigButton(panel.Canvas, "static", nil, 2, 80, Ln("res_changes"), MSD.Icons48.cross, function()
				MQS.Config = oldcfg
				openPage("settings", true)
			end)
		end
	end

	for k, v in pairs(buttons) do
		local button = MSD.MenuButton(panel.Menu, v[2], nil, nil, 250, 50, v[1], function(self)
			panel.Menu.Deselect(not v[5] and self or false)
			v[3]()
		end)

		if v[4] then
			panel.Menu.Deselect(button)
			v[3]()
		end
	end
end

mouleid = MSD.AddModule("MQS", MQS.OpenAdminMenu, Material("mqs/logo_msd.png", "smooth"))
--PATH addons/mc_quests/lua/mqs/ui/user_panel.lua:
function MQS.OpenPlayerMenu()
	if MQS.SetupMenu then
		MQS.SetupMenu:AlphaTo(0, 0.4, 0, function()
			MQS.SetupMenu:Close()
		end)

		return
	end

	local tasks = MQS.ActiveQuestLists()
	local pnl_w, pnl_h = ScrW(), ScrH()
	pnl_w, pnl_h = pnl_w - pnl_w / 4, pnl_h - pnl_h / 6
	panel = vgui.Create("MSDSimpleFrame")
	panel:SetSize(pnl_w, pnl_h)
	panel:SetDraggable(false)
	panel:Center()
	panel:MakePopup()
	panel:SetAlpha(0)
	panel:AlphaTo(255, 0.3)

	panel.OnClose = function()
		MQS.SetupMenu = nil
	end

	panel:SetAlpha(1)
	panel:AlphaTo(255, 0.4)

	panel.Paint = function(self, w, h)
		MSD.DrawBG(self, w, h)

		draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, 50, MSD.Theme["d"])
		draw.RoundedBox(MSD.Config.Rounded, 0, 52, w, h - 52, MSD.Theme["l"])

		draw.DrawText(string.upper(MSD.GetPhrase("quests")), "MSDFont.25", 12, 12, color_white, TEXT_ALIGN_LEFT)
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

	panel.Canvas = vgui.Create("MSDPanelList", panel)
	panel.Canvas:SetSize(panel:GetWide(), panel:GetTall() - 52)
	panel.Canvas:SetPos(0, 52)
	panel.Canvas:EnableVerticalScrollbar()
	panel.Canvas:EnableHorizontal(true)
	panel.Canvas:SetSpacing(5)
	panel.Canvas.IgnoreVbar = true

	for k, v in pairs(MQS.Quests) do
		if not tasks[k] then continue end
		local qpnl = vgui.Create("DButton")
		qpnl:SetText("")
		qpnl.alpha = 0
		qpnl.title = 0
		qpnl.StaticScale = {
			w = 2,
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
			panel:Close()
			net.Start("MQS.StartTask")
			net.WriteString(k)
			net.SendToServer()
		end

		panel.Canvas:AddItem(qpnl)
	end

	MQS.SetupMenu = panel

	return panel
end