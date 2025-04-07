--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 10/10 - 08/04/2025


--PATH addons/sl_util_accessory/lua/advanced_accessories/languages/sh_language_es.lua:
AAS = AAS or {}
AAS.Language = AAS.Language  or {}

AAS.Language["es"] = {
    ["cancel"] = "Cancelar",
    ["save"] = "Guardar Objeto",
    ["name"] = "Nombre",
    ["model"] = "Modelo",
    ["itemPrice"] = "Precio del Objeto",
    ["itemPos"] = "Posición del Objeto",
    ["itemStat"] = "Estadísticas del Objeto",
    ["itemJob"] = "Exclusivo para Trabajo",
    ["itemName"] = "Nombre del Objeto",
    ["customCharacter"] = "PERSONALIZA A TU PERSONAJE",
    ["adminDashboard"] = "PANEL DE ADMINISTRACIÓN",
    ["welcomeText"] = "BIENVENIDO, ¿QUÉ DESEAS COMPRAR?",
    ["position"] = "POSICIÓN",
    ["rotation"] = "ROTACIÓN",
    ["scale"] = "ESCALA",
    ["description"] = "Descripción corta de tu objeto",
    ["search"] = "  Buscar Objetos...",
    ["sell"] = "Vender",
    ["buy"] = "Comprar",
    ["buyaccessory"] = "Comprar el accesorio",
    ["sellaccessory"] = "Vender el accesorio",
    ["sure"] = "¿Estás seguro de que quieres hacer esto?",
    ["activate"] = "Activar",
    ["desactivate"] = "Desactivar",
    ["modifypos"] = "Modificar posición",
    ["edititem"] = "Editar Objeto",
    ["appearance"] = "Apariencia",
    ["skin"] = "Skin",
    ["desc"] = "Descripción",
    ["titleactivate"] = "Activar / Deshabilitar objeto",
    ["choosecategory"] = "Elegir Categoría",
    ["chooseskin"] = "Elegir Skin",
    ["additem"] = "Añadir Objeto",
    ["adminname"] = "¡El nombre del objeto es incorrecto!",
    ["faildesc"] = "¡La descripción es incorrecta!",
    ["failprice"] = "¡El precio es incorrecto!",
    ["choosemodel"] = "¡Debes elegir un modelo para tu accesorio!",
    ["failcategory"] = "Debes elegir una categoría para tu accesorio",
    ["updateItem"] = "Has actualizado",
    ["deleteItem"] = "Has eliminado el objeto",
    ["ownedItem"] = "¡Ya tienes este objeto!",
    ["notEnoughtMoney"] = "¡No tienes el dinero suficiente!",
    ["notRank"] = "¡No tienes el rango apropiado para hacer esto!",
    ["itemDesactivate"] = "¡El objeto se encuentra deshabilitado!",
    ["sellItem"] = "Has vendido el objeto por",
    ["cantEquip"] = "¡No puedes equiparte este objeto!",
    ["itemVip"] = "Este objeto es exclusivo para VIP",
    ["jobProblem"] = "¡No puedes hacer esto con tu trabajo actual!",
    ["exploitArmory"] = "¡Estás demasiado lejos del closet para realizar esta acción!",
    ["exploitNpc"] = "¡Estás demasiado lejos del NPC para realizar esta acción!",
    ["saveBodygroup"] = "¡Has modificado la apariencia de tu personaje!",
    ["addItem"] = "Añadiste el objeto",
    ["buyItem"] = "Adquiriste",
    ["for"] = "por",
    ["noItems"] = "No hay objetos en el mercado \n¡Por favor contacta con un administrador!",
    ["yourInventory"] = "TU INVENTARIO",
    ["emptyInventory"] = "No tienes objetos en tu inventario",
    ["changeInv"] = "¡Puedes cambiar tu",
    ["clickingHere"] = "haciendo click aquí!",
    ["upHere"] = "¿Qué deseas el día de hoy?",
    ["equipItem"] = "Te has equipado tu objeto",
    ["deequipedItem"] = "Te has desequipado tu objeto",
    ["equipModel"] = "¡Has cambiado tu apariencia!",
    ["saveModel"] = "Guardar Modelo",
    ["toomany"] = "¡No tienes el espacio suficiente en tu mochila para adquirir esto!",
    ["backpack"] = "Mochila",
    ["bought"] = "En posesión",
    ["comboskin"] = "Selecciona un aspecto",
    ["combocategory"] = "Selecciona una categoría",
    ["waitItem"] = "Por favor, espera un momento antes de equiparte otro accesorio.",
    ["waitEquip"] = "Te estás colocando tu accesorio...",
    ["swepcantgo"] = "No puedes ir a la tienda de accesorios con la herramienta!",
    ["iconPos"] = "Modificar posición del ícono",
    ["iconFov"] = "Modificar FOV del ícono",
    ["itemUniqueId"] = "Objeto único",
    ["adjustAccessory"] = "Ajustar accesorio",
    ["adjust"] = "Ajustar",
    ["adjustText"] = "¿Desea ajustar el artículo?",
    ["notOwned"] = "¡No has comprado este artículo!",
    ["rankBlackList"] = "Rango de la lista negra",

    ["titleGingerBread"] = "Galleta de Jengibre",
    ["titleCap"] = "Gorra",
    ["titleHeadphones"] = "Auriculares",
    ["titleHawkMask"] = "Máscara de Halcón",
    ["titleBeret"] = "Boina",
    ["titleBandMask"] = "Barbijo",
    ["titlePinguin"] = "Máscara Pinguina",
    ["titleMummyMask"] = "Máscara de Momia",
    ["titleBandana"] = "Bandana",
    ["titleBag"] = "Bolso",
    ["titleMonkeyMask"] = "Máscara de Mono",
    ["titleNinjaMask"] = "Máscara de Ninja",
    ["titleZombieMask"] = "Máscara de Zombi",
    ["titlePleaseStop"] = "Por favor, para",
    ["titleSkullMask"] = "Máscara de Calavera",
    ["titleGentlemanshat"] = "Sombrero",
    ["titleMask"] = "Máscara",
    ["titleOrangeHat"] = "Sombrero Naranja",
    ["titleBlackBagPack"] = "Mochila Negra",
    ["titlePigHat"] = "Sombrero de Cerdo",
    ["titleCap2"] = "Gorra 2",
    ["titleBigBagpack"] = "Mochila Grande 2",
    ["titleSchoolBagPack"] = "Mochila Escolar",
    ["titleBeerHat"] = "Gorra Cervecera",
    ["titleArmor"] = "Armadura",
    ["titleMaskDuck"] = "Máscara de Pato",
    ["titleGlasses"] = "Gafas",
    ["titleGlasses2"] = "Gafas 2",
    ["titleAfro"] = "Afro",
    ["titleMarioHat"] = "Sombrero de Mario",
    ["titleGlasses3"] = "Gafas 3",
    ["titleLuigiHat"] = "Sombrero de Luigi",
    ["titleGlasses4"] = "Gafas 4",
    ["titleGlasses5"] = "Gafas 5",
    ["titleToadHat"] = "Sombrero de Toad",
    ["titleServboHead"] = "Cabeza de Servbo",
    ["titleCatHat"] = "Sombrero de Gato",
    ["titleStrawHat"] = "Sombrero de Paja",
    ["titleRabbitEar"] = "Orejas de Conejo",
    ["titleSunHat"] = "Sombrero",
    ["title3DGlasses"] = "Gafas 3D",
    ["titleCatsEars"] = "Orejas de Gato",
    ["titleCatHat2"] = "Sombrero de Gato 2",
    ["titleJasonMask"] = "Máscara de Jason",
    ["titleMustache"] = "Bigote",
    ["titleCowboyHat"] = "Sombrero",
    ["titleDeadmau5"] = "Deadmau5",
    ["titleFrogHat"] = "Sombrero de Rana",
    ["titleHeartBand"] = "Banda de Corazón",
    ["titlePumpkinHead"] = "Cabeza de Calabaza",
    ["titleChristmasHat"] = "Gorro de Navidad",
    ["titleStarHeadband"] = "Diadema de Estrella",
    ["titleThomasHat"] = "Sombrero de Tomas",
    ["titleSombrero"] = "Sombrero",
    ["titleHeadphones2"] = "Auriculares 2",
    ["titleSnowGoggles"] = "Gafas para la Nieve",
    ["titleCap3"] = "Gorra 3",
    ["titleHat"] = "Sombrero negro",
    ["titleGlasses6"] = "Gafas 6",
    ["titleCap4"] = "Gorra 4",
    ["titleDrinkCap"] = "Gorra para Bebidas",
    ["titleStarGlasses"] = "Gafas Estrelladas",
    ["titleCatEars"] = "Orejas de Gato",
    ["titleHat2"] = "Sombrero 2",
    ["titleBabyRhino"] = "Rinoceronte bebé",
    ["titleArnoldMask"] = "Máscara de Arnold",
    ["titleChuckMask"] = "Máscara de Chuck",
    ["titleDeerMask"] = "Máscara de Venado",
    ["titlePandaMask"] = "Máscara de Panda",
    ["titleMonkeyMask2"] = "Máscara de Mono 2",
    ["titleBearMask"] = "Máscara de Oso",
    ["titlePigMask"] = "Máscara de Cerdo.",
    ["titlePolishBeret"] = "Boina Polaca",
    ["titlePolishBeret2"] = "Boina Polaca 2",
    ["titlePolishBeret3"] = "Boina Polaca 3",
    ["titleBikeHelmet"] = "Casco para Bicicleta",
    ["titleBikeHelmet2"] = "Casco para Bicicleta",
    ["titleBikeHelmet3"] = "Casco para Bicicleta",
    ["titleBikeHelmet4"] = "Casco para Bicicleta",
    ["titleBikeHelmet5"] = "Casco para Bicicleta",
    ["titleBikeHelmet6"] = "Casco para Bicicleta",
    ["titleBikeHelmet7"] = "Casco para Bicicleta",
    ["titleBikeHelmet8"] = "Casco para Bicicleta",
    ["titleBikeHelmet9"] = "Casco para Bicicleta",
    ["titleBikeHelmet10"] = "Casco para Bicicleta",
    ["titleBikeHelmet11"] = "Casco para Bicicleta",
    ["titleBikeHelmet12"] = "Casco para Bicicleta",
    ["titleBikeHelmet13"] = "Casco para Bicicleta",
    ["titleBikeHelmet14"] = "Casco para Bicicleta",
    ["titleBikeHelmet15"] = "Casco para Bicicleta",
    ["titlePumpkinMask"] = "Máscara de Calabaza",
    ["titleHorseMask"] = "Máscara de Caballo",
    ["titleHorseMask2"] = "Máscara de Caballo",
    ["titleHorseMask3"] = "Máscara de Caballo",
    ["titleRussianHat"] = "Sombrero Ruso",

    ["descGingerBread"] = "¡Una adorable Galleta de Jengibre!",
    ["descCap"] = "¡Por si tienes frío!",
    ["descHeadphones"] = "Si amas el ruido, este accesorio es para ti",
    ["descHawkMask"] = "Una preciosa máscara de Halcón",
    ["descBeret"] = "¡Wow! ¡Te queda genial!",
    ["descBandMask"] = "La mejor máscara para el crimen",
    ["descPinguin"] = "Una máscara de Pinguino",
    ["descMummyMask"] = "Ahora eres amigo de Anubis :D",
    ["descBandana"] = "Una preciosa bandana.", -- To make
    ["descBag"] = "¡Tu bolsa favorita para hacer las compras!",
    ["descMonkeyMask"] = "¡Una máscara muy mona!",
    ["descNinjaMask"] = "¡Tu pase Shinobi!",
    ["descZombieMask"] = "¡Perfecta para morir!",
    ["descPleaseStop"] = "¡Una preciosa máscara!",
    ["descSkullMask"] = "La mejor máscara para bromear en Halloween",
    ["descGentlemanshat"] = "Un sombrero para caballeros",
    ["descMask"] = "Una máscara",
    ["descOrangeHat"] = "Un sombrero naranja",
    ["descBlackBagPack"] = "Una mochila negra",
    ["descPigHat"] = "¿Amas a los cerdos?",
    ["descCap2"] = "¡Para protegerte del sol!",
    ["descBigBagpack"] = "Una gran mochila",
    ["descSchoolBagPack"] = "Una mochila escolar",
    ["descBeerHat"] = "Un sombrero cervecero",
    ["descArmor"] = "Una armadura",
    ["descMaskDuck"] = "Una divertida máscara de pato",
    ["descGlasses"] = "¿Te duelen los ojos? Entonces estas gafas son para ti",
    ["descGlasses2"] = "¿Te duelen los ojos? Entonces estas gafas son para ti",
    ["descAfro"] = "¿Quieres verte bien?",
    ["descMarioHat"] = "¡Para los fanáticos de Mario!",
    ["descGlasses3"] = "¿Te duelen los ojos? Entonces estas gafas son para ti",
    ["descLuigiHat"] = "¡Para los fanáticos de Luigi!",
    ["descGlasses4"] = "¿Te duelen los ojos? Entonces estas gafas son para ti",
    ["descGlasses5"] = "¿Te duelen los ojos? Entonces estas gafas son para ti",
    ["descToadHat"] = "¡Para los fanáticos de Toad!",
    ["descServboHead"] = "¡Amo la vida!",
    ["descCatHat"] = "Un precioso sombrero gatuno.",
    ["descStrawHat"] = "¡Un precios sombrero de paja!",
    ["descRabbitEar"] = "Increíbles orejas de conejo",
    ["descSunHat"] = "Para una gran travesía",
    ["desc3DGlasses"] = "¡Para disfrutar de tus peliculas favoritas en el cine!",
    ["descCatsEars"] = "Vistete como un gato, se un gato.",
    ["descCatHat2"] = "Un precioso sombrero de gato.",
    ["descJasonMask"] = "La máscara de tu película de terror favorita",
    ["descMustache"] = "¡Un peludo bigote!",
    ["descCowboyHat"] = "¿Alguna vez quisiste ser un vaquero?",
    ["descDeadmau5"] = "¿Alguna vez quisiste ser Deadmau5?",
    ["descFrogHat"] = "Un precioso sombrero de rana.",
    ["descHeartBand"] = "Una banda con un corazón.",
    ["descPumpkinHead"] = "La máscara perfecta para tus salidas de Halloween.",
    ["descChristmasHat"] = "¡Feliz navidad!.",
    ["descStarHeadband"] = "¡Vuélvete una estrella!.",
    ["descThomasHat"] = "¿Amas la música?",
    ["descSombrero"] = "¡Un precioso sombrero!",
    ["descHeadphones2"] = "¡Con estos auriculares escucha música en alta calidad!",
    ["descSnowGoggles"] = "Para esquiar con seguridad",
    ["descCap3"] = "Una gran gorra.",
    ["descHat"] = "Un lujoso sombrero negro.",
    ["descGlasses6"] = "Unas lujosas gafas.",
    ["descCap4"] = "Una gorra básica.",
    ["descDrinkCap"] = "¡Un precioso sombrero de alcohol para los alcoholicos!",
    ["descStarGlasses"] = "¡Para volverte una estrella!",
    ["descCatEars"] = "Orejas de gato para ser una preciosa NEKO UWU.",
    ["descHat2"] = "Un gorro negro simple.",
    ["descBabyRhino"] = "Por si amas a Rhino.",
    ["descArnoldMask"] = "La máscara de Arnold, pero no te transforma en Arnold Schwarzenegger.",
    ["descChuckMask"] = "Simplemente Chuck...",
    ["descDeerMask"] = "¡Una preciosa máscaraa de Venado!",
    ["descPandaMask"] = "¡Una increíble máscara de Panda! Para pasar noches candentes con tu novia",
    ["descMonkeyMask2"] = "¡La máscara más mona del mercado!",
    ["descBearMask"] = "Simplemente una máscara de oso. No te acerques mucho a los depredadores",
    ["descPigMask"] = "Te ves como un gatito salvaje... No, espera, pareces un cerdo :/",
    ["descPolishBeret"] = "Una preciosa Boina Polaca",
    ["descPolishBeret2"] = "Una preciosa Boina Polaca",
    ["descPolishBeret3"] = "Una preciosa Boina Polaca",
    ["descBikeHelmet"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet2"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet3"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet4"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet5"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet6"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet7"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet8"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet9"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet10"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet11"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet12"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet13"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet14"] = "¡Colócate el casco o la policía te detendrá!",
    ["descBikeHelmet15"] = "¡Colócate el casco o la policía te detendrá!",
    ["descPumpkinMask"] = "Para un mejor Halloween",
    ["descHorseMask"] = "SOY UN CABALLO BRRRR",
    ["descHorseMask2"] = "SOY UN CABALLO BRRRR XD",
    ["descHorseMask3"] = "Sigo siendo un caballo ¯|_(ツ)_|¯",
    ["descRussianHat"] = "¡BAJOS DUROS PARA LA VICTORIA!",
}
// 76561198442896680
--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_bodygroup.lua:
local function addLabel(scroll, text)
    if not IsValid(scroll) then return end 

    local dLabel = vgui.Create("DLabel", scroll)
    dLabel:SetText(text)
    dLabel:SetFont("AAS:Font:03")
    dLabel:SetTextColor(AAS.Colors["white"])
    dLabel:DockMargin(AAS.ScrH*0.005,0,0,AAS.ScrH*0.005)
end 

function AAS.BodyGroup()
    AAS.BaseMenu(AAS.GetSentence("customCharacter"), false, AAS.ScrW*0.2, "customcharacter")

    AAS.ClientTable["Id"] = 1

    local playerModel = vgui.Create("AAS:DModel", accessoriesFrame)
    playerModel:SetSize(AAS.ScrW*0.11, AAS.ScrH*0.55)
    playerModel:SetPos(accessoriesFrame:GetWide()*0.27, AAS.ScrH*0.07) 
    playerModel:SetFOV(15)
    playerModel:Zoom()
    playerModel:SetDrawModelAccessories(false)

    if isnumber(playerModel.Entity:LookupBone("ValveBiped.Bip01_Head1")) then
        local modelEye = playerModel.Entity:GetBonePosition(playerModel.Entity:LookupBone("ValveBiped.Bip01_Head1"))
        modelEye:Add(Vector(0, 0, -28))
        playerModel:SetLookAt(modelEye)
        playerModel:SetCamPos(modelEye-Vector(-100, 0, -5))
    end

    local arrowLeft = vgui.Create("DButton", accessoriesFrame)
    arrowLeft:SetSize(AAS.ScrW*0.013, AAS.ScrH*0.039)
    arrowLeft:SetPos(AAS.ScrW*0.095, AAS.ScrH*0.28)
    arrowLeft:SetText("")
    arrowLeft.Paint = function(self, w, h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["arrowleft"])
        surface.DrawTexturedRect( 0, 0, w, h )
    end
    arrowLeft.Think = function()
        if not arrowLeft:IsHovered() or not input.IsButtonDown(MOUSE_FIRST) then return end
        playerModel.Entity:SetAngles(playerModel.Entity:GetAngles() - Angle(0, 1, 0))
    end

    local arrowRight = vgui.Create("DButton", accessoriesFrame)
    arrowRight:SetSize(AAS.ScrW*0.013, AAS.ScrH*0.039)
    arrowRight:SetPos(AAS.ScrW*0.325, AAS.ScrH*0.28)
    arrowRight:SetText("")
    arrowRight.Paint = function(self, w, h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["arrowright"])
        surface.DrawTexturedRect( 0, 0, w, h )
    end
    arrowRight.Think = function()
        if not arrowRight:IsHovered() or not input.IsButtonDown(MOUSE_FIRST) then return end
        playerModel.Entity:SetAngles(playerModel.Entity:GetAngles() + Angle(0, 1, 0))
    end

    local categoryList = vgui.Create("DScrollPanel", accessoriesFrame)
    categoryList:SetSize(AAS.ScrW*0.038, AAS.ScrH*0.5)
    categoryList:SetPos(0, AAS.ScrH*0.1)

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

    local sliderList = vgui.Create("AAS:ScrollPanel", accessoriesFrame)
    sliderList:SetSize(AAS.ScrW*0.19, AAS.ScrH*0.53)
    sliderList:SetPos(accessoriesFrame:GetWide() - AAS.ScrW*0.195, AAS.ScrH*0.12)
    sliderList:GetVBar():SetSize(0,0)

    local skinSlider
    if AAS.LocalPlayer:SkinCount() > 0 then 
        addLabel(sliderList, AAS.GetSentence("skin"))

        skinSlider = vgui.Create("AAS:Slider", sliderList)
        skinSlider:SetPos(accessoriesFrame:GetWide()*0.675,300)
        skinSlider.Slider:SetMax(AAS.LocalPlayer:SkinCount())
        skinSlider.Slider:SetValue(AAS.LocalPlayer:GetSkin())
        skinSlider.Slider.OnValueChanged = function( self, value )
            playerModel.Entity:SetSkin(math.Round(value))
        end
    end

    local bodyGroups, tableToSend = AAS.LocalPlayer:GetBodyGroups(), {}
    for k,v in ipairs(bodyGroups) do 
        if #v.submodels == 0 then continue end

        tableToSend[v.id] = AAS.LocalPlayer:GetBodygroup(v.id)
        addLabel(sliderList, v.name:gsub("^%l", string.upper))

        local bodyGroupSlider = vgui.Create("AAS:Slider", sliderList)
        bodyGroupSlider:SetPos(accessoriesFrame:GetWide()*0.675,300)
        bodyGroupSlider.Slider:SetMax(#bodyGroups[k]["submodels"])
        bodyGroupSlider.Slider:SetValue(tableToSend[v.id])

        playerModel.Entity:SetBodygroup(v.id, tableToSend[v.id])
        bodyGroupSlider.Slider.OnValueChanged = function( self, value )
            tableToSend[v.id] = math.Round(value)
            playerModel.Entity:SetBodygroup(v.id, math.Round(value))
        end
    end 
    
    local panelBack = vgui.Create("DPanel", accessoriesFrame)
    panelBack:SetSize(AAS.ScrW*0.197, AAS.ScrH*0.04)
    panelBack:SetPos(accessoriesFrame:GetWide()*0.67, AAS.ScrH*0.065)
    panelBack.Paint = function(self,w,h)
        draw.DrawText(string.upper(AAS.GetSentence("appearance")), "AAS:Font:04", w*0.02, h*0.1, AAS.Colors["white"], TEXT_ALIGN_LEFT)
        draw.RoundedBox(0, w*0.025, h*0.93, w*0.94, AAS.ScrH*0.002, AAS.Colors["white"])
    end 
    
    local lerpFirstButton = 255
    local firstButton = vgui.Create("DButton", panelBack)
    firstButton:SetSize(AAS.ScrW*0.055, AAS.ScrH*0.027)
    firstButton:SetPos(panelBack:GetWide()*0.685, AAS.ScrH*0.0)
    firstButton:SetText(AAS.GetSentence("cancel"))
    firstButton:SetFont("AAS:Font:04")
    firstButton:SetTextColor(AAS.Colors["white"])
    firstButton.Paint = function(self,w,h)
        lerpFirstButton = Lerp(FrameTime()*10, lerpFirstButton, self:IsHovered() and 255 or 100)

        draw.RoundedBox(5, 0, 0, w, h, ColorAlpha(AAS.Colors["red49"], lerpFirstButton))
    end
    firstButton.DoClick = function()
        accessoriesFrame:AlphaTo( 100, 0.3, 0, function() 
            if not IsValid(accessoriesFrame) then return end 
            accessoriesFrame:Remove()
        end)
    end

    local lerpSecondButton = 255
    local secondButton = vgui.Create("DButton", panelBack)
    secondButton:SetSize(AAS.ScrW*0.06, AAS.ScrH*0.027)
    secondButton:SetPos(panelBack:GetWide()*0.36, AAS.ScrH*0.0)
    secondButton:SetText(AAS.GetSentence("saveModel"))
    secondButton:SetFont("AAS:Font:04")
    secondButton:SetTextColor(AAS.Colors["white"])
    secondButton.Paint = function(self,w,h)
        lerpSecondButton = Lerp(FrameTime()*10, lerpSecondButton, self:IsHovered() and 255 or 100)

        draw.RoundedBox(5, 0, 0, w, h, ColorAlpha(AAS.Colors["blue77"], lerpSecondButton))
    end
    secondButton.DoClick = function()
        local stringToSend = ""
        for k,v in pairs(tableToSend) do 
            stringToSend = stringToSend..(#stringToSend != 0 and ";" or "")..k..":"..v
        end
        
        local skin = IsValid(skinSlider.Slider) and math.Round(skinSlider.Slider:GetValue()) or 0

        net.Start("AAS:BodyGroups")
            net.WriteString(stringToSend)
            net.WriteString(skin)
        net.SendToServer()
    end 
end

--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_slider.lua:
local PANEL = {}

local function AASCircle(x, y, radius, seg)
	local cir = {}

	table.insert(cir, { x = x, y = y, u = 0.5, v = 0.5 })
	for i = 0, seg do
		local a = math.rad((i / seg) * -360)
		table.insert(cir, {x = x + math.sin(a) * radius, y = y + math.cos(a) * radius, u = math.sin(a) / 2 + 0.5, v = math.cos(a) / 2 + 0.5})
	end

	local a = math.rad(0)
	table.insert(cir, {x = x + math.sin(a) * radius, y = y + math.cos(a) * radius, u = math.sin(a) / 2 + 0.5, v = math.cos(a) / 2 + 0.5})

	surface.DrawPoly(cir)
end

function PANEL:Init()
    self:SetSize(AAS.ScrW*0.19, AAS.ScrH*0.055)
    self.DrawBackground = true
    self.AccurateNumber = 0.02

    local dSlider = vgui.Create("DNumSlider", self)
    dSlider:SetSize(AAS.ScrW*0.15, AAS.ScrH*0.01)
    dSlider:SetPos(AAS.ScrW*0.19/2 - AAS.ScrW*0.15/2, AAS.ScrH*0.033)
    dSlider:SetDefaultValue(0)
    dSlider:SetMin(0)
    dSlider:SetMax(10)
    dSlider:SetDecimals(1)
    self.Slider = dSlider

    dSlider.Slider.Knob.Paint = function(self,w,h)
        local Num = math.Round(dSlider:GetValue())

        surface.SetFont("AAS:Font:03")
        local Text = surface.GetTextSize(tostring(Num)) + AAS.ScrW*0.01

        draw.RoundedBox(0, -Text/2 + w/2, -AAS.ScrH*0.02, Text, AAS.ScrH*0.019, AAS.Colors["white"])
        draw.RoundedBox(0, -Text*0.95/2 + w/2, -AAS.ScrH*0.0193, Text*0.915, AAS.ScrH*0.017, AAS.Colors["black18"])
        draw.DrawText(Num, "AAS:Font:03", w/2, -AAS.ScrH*0.022, AAS.Colors["white"], TEXT_ALIGN_CENTER)

        surface.SetDrawColor(AAS.Colors["white"])
        draw.NoTexture()

        AASCircle(w/2, h*0.5, AAS.ScrW*0.004, 25)
    end 
    dSlider.Slider.Paint = function(self,w,h)
        draw.RoundedBox(0, 0, h*0.6, w, AAS.ScrH*0.002, AAS.Colors["white"])
    end 
    dSlider.TextArea:SetVisible(false)
    dSlider.Label:SetVisible(false)
    
    local leftButton = vgui.Create("DButton", self)
    leftButton:SetSize(AAS.ScrH*0.018, AAS.ScrH*0.018)
    leftButton:SetPos(AAS.ScrW*0.005, AAS.ScrH*0.058/2)
    leftButton:SetText("")
    leftButton.Paint = function(panel,w,h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["sliderarrowleft"])
        surface.DrawTexturedRect(0, 0, w, h)
        if input.IsMouseDown(MOUSE_LEFT) and leftButton:IsHovered() then
            dSlider:SetValue(dSlider:GetValue() - self.AccurateNumber)
        end
    end
    self.leftButton = leftButton

    local rightButton = vgui.Create("DButton", self)
    rightButton:SetSize(AAS.ScrH*0.018, AAS.ScrH*0.018)
    rightButton:SetPos(AAS.ScrW*0.174, AAS.ScrH*0.058/2)
    rightButton:SetText("")
    rightButton.Paint = function(panel,w,h)
        surface.SetDrawColor(AAS.Colors["white"])
        surface.SetMaterial(AAS.Materials["sliderarrowright"])
        surface.DrawTexturedRect(0, 0, w, h)
        if input.IsMouseDown(MOUSE_LEFT) and rightButton:IsHovered() then
            dSlider:SetValue(dSlider:GetValue() + self.AccurateNumber)
        end
    end
    self.rightButton = rightButton
end

function PANEL:AccurateSlider()
    self.Slider.Slider:Dock(NODOCK)
    self.Slider.Slider:SetSize(AAS.ScrW*0.15,AAS.ScrW*0.005)
    self.Slider.Scratch:SetParent(self)
    self.Slider.Scratch:Dock(FILL)
end

function PANEL:SetAccurateNumber(number)
    self.AccurateNumber = number
end

function PANEL:ChangeBackground(bool)
    self.DrawBackground = bool
end 

function PANEL:Paint(w,h)
    if not self.DrawBackground then return end 
    draw.RoundedBox(8, 0, 0, w, h, AAS.Colors["black18"])
end 

derma.DefineControl("AAS:Slider", "AAS Slider", PANEL, "DPanel")

--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl__gui.lua:
-- Functions
aphone.GUI = aphone.GUI or {}

function aphone:Is2D()
    return aphone:GetParameters("Core", "2D", false)
end

local ratio_h = ScrH() / 1080
local ratio_w = ScrW() / 1920
local ratio = ratio_h < ratio_w and ratio_h or ratio_w

hook.Add("OnScreenSizeChanged", "APhone_RefreshRatio", function()
    ratio_h = ScrH() / 1080
    ratio_w = ScrW() / 1920
    local new_ratio = ratio_h < ratio_w and ratio_h or ratio_w
    if new_ratio == ratio then return end

    ratio = new_ratio
end)

function aphone.GUI.ScaledSize(...)
    local args = {...}

    for k, v in ipairs(args) do
        args[k] = v * ratio * (aphone:Is2D() and 0.65 or 1)
    end

    return unpack(args)
end

function aphone.GUI.ScaledSizeX(num)
    return aphone.GUI.ScaledSize(num)
end

function aphone.GUI.ScaledSizeY(num)
    return aphone.GUI.ScaledSize(num)
end

local p = FindMetaTable("Panel")

function p:aphone_RemoveCursor()
    if aphone:Is2D() then return end

    for k, v in ipairs(self:GetChildren()) do
        v:aphone_RemoveCursor()
    end

    self:SetCursor("blank")
end

function aphone.GUI.GenerateCircle(x, y, r)
    local circle = {}

    for i = 1, 360 do
        circle[i] = {}
        circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
        circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
    end

    return circle
end

function aphone.GUI.RoundedBox(x, y, w, h, r)
    local pts = {}
    -- Top right
    local x_corner = (x + w) - r
    local y_corner = y + r

    for i = 270, 360 do
        table.insert(pts, {
            x = x_corner + math.cos(math.rad(i * 360) / 360) * r,
            y = y_corner + math.sin(math.rad(i * 360) / 360) * r
        })
    end

    -- Bottom Right
    x_corner = (x + w) - r
    y_corner = (y + h) - r

    for i = 0, 90 do
        table.insert(pts, {
            x = x_corner + math.cos(math.rad(i * 360) / 360) * r,
            y = y_corner + math.sin(math.rad(i * 360) / 360) * r
        })
    end

    -- Bottom Left
    x_corner = x + r
    y_corner = (y + h) - r

    for i = 90, 180 do
        table.insert(pts, {
            x = x_corner + math.cos(math.rad(i * 360) / 360) * r,
            y = y_corner + math.sin(math.rad(i * 360) / 360) * r
        })
    end

    -- Top Left
    x_corner = x + r
    y_corner = y + r

    for i = 180, 270 do
        table.insert(pts, {
            x = x_corner + math.cos(math.rad(i * 360) / 360) * r,
            y = y_corner + math.sin(math.rad(i * 360) / 360) * r
        })
    end

    return pts
end

-- Wrap text, big thanks to https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/base/cl_util.lua
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

function aphone.GUI.WrapText(text, font, maxWidth)
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
        -- Split the word if the word is too big
        if wordlen >= maxWidth then
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
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl__lib.lua:
aphone.SpecialNumbers = aphone.SpecialNumbers or {}

function aphone.RegisterNumber(info)
    if not isstring(info.name) or not isfunction(info.func) or not isstring(info.icon) then return end
    info.icon = Material(info.icon, "smooth 1")

    if info.icon and !info.icon:IsError() then
        aphone.SpecialNumbers[info.name] = info

        return true
    end
end

function aphone.playringtone()
    local id
    local l = "Ringtones"

    for k, v in pairs(aphone.Ringtones) do
        if aphone:GetParameters(l, "Ringstone_" .. k, false) then
            id = k
            break
        end
    end

    if !id or !aphone.Ringtones or !aphone.Ringtones[id] then
        print("[APhone] Invalid Ringtone ID, please select another sound in your settings")
        surface.PlaySound("akulla/phone_ringing.mp3")
        return
    end

    local c = aphone.Ringtones[id]
    if !c.is_local then
        sound.PlayURL(c.url, "", function( station, errorID, errorname)
            if ( IsValid( station ) ) then
                station:Play()
            else
                print("[APhone] The URL of the ringtone does not seem valid, the default sound is played.")
                surface.PlaySound("akulla/phone_ringing.mp3")
            end
        end )
    else
        surface.PlaySound(c.url)
    end
end

-- Load Player
net.Receive("aphone_GiveID", function()
    local e = net.ReadEntity()

    if IsValid(e) then
        e.aphone_ID = net.ReadUInt(32)
        e.aphone_number = net.ReadUInt(30)
    end
end)

net.Receive("aphone_OldID", function()
    for i=1, net.ReadUInt(8) do
        local e = net.ReadEntity()
        local id = net.ReadUInt(32)
        local num = net.ReadUInt(30)

        if IsValid(e) then
            e.aphone_ID = id
            e.aphone_number = num
        end
    end
end)

hook.Add("InitPostEntity", "aphone_AskSQL", function()
    net.Start("aphone_AskSQL")
    net.SendToServer()
end)
--PATH addons/sl_aphone/lua/aphone/_libs/call/cl_call.lua:
aphone.Call = aphone.Call or {}

local function init_call(param)
    aphone.Call.Infos = param

    timer.Create("aphone_DringSound", 5, 0, function()
        local info = aphone.Call.Infos
        local firstCheck = IsValid(LocalPlayer()) and LocalPlayer():HasWeapon("aphone") and info and info.pending and not info.is_caller and !aphone:GetParameters("Core", "SilentMode", false)

        if firstCheck and (IsValid(aphone.Call.Infos.target) or info.special_id) then
            aphone.playringtone()
        else
            timer.Remove("aphone_DringSound")
        end
    end)

    if IsValid(aphone.MainDerma) then
        if IsValid(aphone.Call.Panel) then
            aphone.Call.Panel:Remove()
        end

        local call = vgui.Create("aphone_Call", aphone.MainDerma)
        call:SetZPos(3)

        if !param.pending then
            call:Accepted()
        end
    end
end

net.Receive("aphone_Phone", function()
    local id = net.ReadUInt(4)
    local local_player = LocalPlayer()

    if id == 1 then
        -- Asking call
        local ent1 = net.ReadEntity()
        local ent2 = net.ReadEntity()
        local force_accept = net.ReadBool()

        init_call({
            target = (ent1 == local_player and ent2 or ent1),
            is_caller = (ent1 == local_player),
            target_facetime = false,
            facetime = false,
            start_time = os.time(),
            pending = !force_accept
        })

    elseif id == 2 then
        -- Accept call
        aphone.Call.Infos.pending = false

        if aphone.Call.Panel and IsValid(aphone.Call.Panel) then
            aphone.Call.Panel:Accepted()
        end
    elseif id == 3 then
        -- Can't make the call
        aphone.AddNotif("alert", aphone.L("Already_Call"), 3)
    elseif id == 4 then
        -- Facetime enable
        aphone.Call.Infos.target_facetime = !aphone.Call.Infos.target_facetime
    elseif id == 5 then
        -- End of the call
        if aphone.Call.Infos and IsValid(aphone.Call.Infos.target) then
            local i = aphone.Call.Infos
            local t = os.time() - i.start_time
            local settings = aphone.Clientside.GetSetting("callhistory", {})

            if table.Count(settings) >= 50 then
                settings[50] = nil
            end

            local tbl = {
                time = t,
                p = i.pending,
                is_caller = is_caller,
                targetID = i.target:aphone_GetID()
            }

            if !i.is_caller and tbl.p then
                aphone.Clientside.SaveSetting("callmissed",
                    aphone.Clientside.GetSetting("callmissed", 0) + 1)
            end

            table.insert(settings, 1, tbl)

            aphone.Clientside.SaveSetting("callhistory", settings)
        end
        aphone.Call.Infos = nil
    elseif id == 6 then
        -- Special Call
        local num = net.ReadUInt(8)
        local is_caller = net.ReadBool()

        init_call({
            target_facetime = false,
            facetime = false,
            start_time = os.time(),
            pending = true,
            special_id = num,
            is_caller = is_caller,
        })
    end
end)
--PATH addons/sl_aphone/lua/aphone/_libs/gamemodes_related/sh_helix.lua:
// I don't know if i'm dumb, but I didn't found any hooks post load
hook.Add("PostGamemodeLoaded", "APhone_GR_Helix", function()
    if ix then
        aphone.Gamemode = {}

        function aphone.Gamemode.Afford(ply, amt)
            return ply:GetCharacter():GetMoney() > amt
        end

        function aphone.Gamemode.AddMoney(ply, amt)
            local c = ply:GetCharacter()

            local money = c:GetMoney()
            if money + amt < 0 then return false end

            c:SetMoney(c:GetMoney() + amt)
            return true
        end

        function aphone.Gamemode.Format(amt)
            return ix.currency.Get(amt)
        end

        function aphone.Gamemode.GetMoney(ply)
            return ply:GetCharacter():GetMoney()
        end
    end
end)

--PATH addons/sl_aphone/lua/aphone/_libs/gamemodes_related/sh_nutscript.lua:
hook.Add("PostGamemodeLoaded", "APhone_GR_Nut", function()
    if nut then
        aphone.Gamemode = {}

        function aphone.Gamemode.Afford(ply, amt)
            return ply:canAfford(amt)
        end
    
        function aphone.Gamemode.AddMoney(ply, amt)
            local c = ply:getChar()
    
            local money = c:getMoney()
            if money + amt < 0 then return false end
    
            c:addMoney(c:getMoney() + amt)
            return true
        end
    
        function aphone.Gamemode.Format(amt)
            return nut.currency.get(amt)
        end

        function aphone.Gamemode.GetMoney(ply)
            return ply:getChar():getMoney()
        end
    end
end)

--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_notifications.lua:
// Config
local notif_ids = {
	["alert"] = {
		mat = Material("akulla/aphone/phone_popup_alert.png", "smooth 1"),
		mat_bg = Color(255, 82, 82),
	},
	["bell"] = {
		mat = Material("akulla/aphone/phone_popup_bell.png", "smooth 1"),
		mat_bg = Color(52, 152, 219),
	},
	["good"] = {
		mat = Material("akulla/aphone/phone_popup_good.png", "smooth 1"),
		mat_bg = Color(46, 204, 113),
	},
}

local function addnotif(background, icon, msg, cd)
	if aphone.RunningNotif or !aphone.NotifPanel or !IsValid(aphone.NotifPanel) then return end

	aphone.RunningNotif = true
	aphone.NotifPanel:SetMouseInputEnabled(true)

	local last_curtime = CurTime()
	local p = vgui.Create("DPanel", aphone.NotifPanel)
	p:SetMouseInputEnabled(false)

	function p:Paint(w, h)
		draw.RoundedBox(16, 0, 0, w, h, background)
	end

	local icon_pnl = vgui.Create("DPanel", p)
	icon_pnl:Dock(TOP)
	icon_pnl:DockMargin(0, aphone.GUI.ScaledSizeX(3), 0, 0)
	icon_pnl:SetTall(aphone.GUI.ScaledSizeY(40))
	icon_pnl:SetMouseInputEnabled(false)

	function icon_pnl:Paint(w, h)
		surface.SetDrawColor(color_white)
		surface.SetMaterial(icon)
		surface.DrawTexturedRect((w-h) / 2, 0, h, h)
	end

	local wrapped_text = aphone.GUI.WrapText(msg, aphone:GetFont("MediumHeader"), aphone.NotifPanel:GetWide()*0.8)

	local text = vgui.Create("DLabel", p)
	text:Dock(FILL)
	text:SetFont(aphone:GetFont("MediumHeader"))
	text:SetText(wrapped_text)
	text:SetContentAlignment(5)
	text:DockMargin(aphone.GUI.ScaledSize(3, 3, 3, 3))
	text:SetMouseInputEnabled(false)

	surface.SetFont(aphone:GetFont("MediumHeader"))

	local final_x = aphone.NotifPanel:GetWide()*0.84
	local final_y = select(2, surface.GetTextSize(wrapped_text)) + aphone.GUI.ScaledSizeY(60)

	// Anim : Pop-up
	p:SetSize(final_x * 1.5, final_y * 1.5)
	p:Center()

	p:SizeTo(final_x, final_y, 0.4, 0, 0.5)
	p:MoveTo((aphone.GUI.ScaledSizeX(405) - final_x) / 2, (aphone.GUI.ScaledSizeY(850) - final_y) / 2, 0.4, 0, 0.5)
	p:SetAlpha(0)
	p:AlphaTo(255, 0.4, 0)

	// Anim : Remove Pop-up
	local started_backanim = false

	function aphone.NotifPanel:Paint(w, h)
		local sum = last_curtime + cd - 0.25
		if sum < CurTime() then
			surface.SetDrawColor(0, 0, 0, Lerp((CurTime() - sum) * 4, 240, 0))

			if !started_backanim then
				p:SizeTo(final_x * 1.5, final_y * 1.5, 0.25, 0, 0.5)
				p:AlphaTo(0, 0.25, 0)
				p:MoveTo((aphone.GUI.ScaledSizeX(400) - final_x * 1.5) / 2, (aphone.GUI.ScaledSizeY(850) - final_y * 1.5) / 2, 0.25, 0, 0.5)
				started_backanim = true
			end
		else
			local sec = CurTime() - last_curtime

			// not clamping with math.clamp, With fprofiler I got bad experiences with math.clamp
			sec = sec > 0.25 and 0.25 or sec
			surface.SetDrawColor(0, 0, 0, Lerp(sec * 4, 0, 240))
		end

		surface.DrawRect(0, 0, w, h)
	end

	timer.Simple(cd, function()
		aphone.RunningNotif = false
		p:Remove()
		aphone.NotifPanel:SetMouseInputEnabled(false)
	end)

	aphone.NotifPanel:aphone_RemoveCursor()
end

function aphone.AddNotif(type, msg, cd)
	local infos = notif_ids[type]

	if !infos then
		// MAYBE WE GOT EM
		local app = aphone.RegisteredApps[type]

		if app then
			notif_ids[type] = {
				mat = app.icon,
				mat_bg = app.color or color_white,
			}

			infos = notif_ids[type]
		else
			return
		end
	end

	addnotif(infos.mat_bg, infos.mat, msg, cd)
end
--PATH addons/sl_aphone/lua/aphone/apps/printer/cl_main.lua:
local APP = {}

APP.name = aphone.L("Printer")
APP.icon = "akulla/aphone/app_printer.png"

local lua_grad = Material("akulla/aphone/bg_printer.png", "smooth 1")

function APP:ShowCondition()
	return tobool(aphone.Printer)
end

local wave_wscale = 0.8
local green = Color(46, 204, 113)
local red = Color(255, 82, 82)

local text_infos = {
    ["money"] = true,
    ["sec"] = true,
    ["capacity"] = true,
    ["danger"] = false,
}

function APP:Open(main, main_x, main_y, screenmode)
	// consts
	local font_header = aphone:GetFont("Roboto60")
    local font_small = aphone:GetFont("Small")
    local clr_white60 = aphone:Color("Text_White60")
    local ping_time = 0

    function main:Paint(w, h)
        surface.SetDrawColor(aphone:Color("Black48"))
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(lua_grad)

		local time = (CurTime() / 20) % 1
		local wave_w = -2048 * wave_wscale * time

		// We need to repeat it
		if wave_w + 2048 * wave_wscale < main_x then
			surface.DrawTexturedRect(wave_w + 2048 * wave_wscale, h - main_y*0.45, 2048 * wave_wscale, main_y*0.45)
		end
		surface.DrawTexturedRect(wave_w, h - main_y*0.45, 2048 * wave_wscale, main_y*0.45)

        if ping_time < CurTime() then
            net.Start("APhone_Printer_Ping")
            net.SendToServer()
            ping_time = CurTime() + 5
        end
    end

    local bottom_bg = vgui.Create("DPanel", main)
    bottom_bg:Dock(BOTTOM)
    bottom_bg:SetTall(main_y*0.45)
    bottom_bg:SetPaintBackground(false)

    local getprinters = aphone.Printer.GetPrinters(LocalPlayer()) or {}
    local infos, getprinters = aphone.Printer.GetInfo(getprinters)

    local top = vgui.Create("DPanel", main)
    top:Dock(TOP)
    top:SetTall(main_y * 0.03)
    top:SetPaintBackground(false)

    local panels = {}

    for k, v in ipairs(infos) do
        local title = vgui.Create("DLabel", main)
        title:SetText(aphone.L("printer_" .. v.name) or "nil")
        title:SetFont(font_small)
        title:Dock(TOP)
        title:SetTextColor(clr_white60)
        title:SetContentAlignment(5)
        title:DockMargin(0, main_y*0.03, 0, 0)
        title:SetAutoStretchVertical(true)

        local text = vgui.Create("DLabel", main)
        text:SetText(text_infos[v.name] and aphone.Printer.FormatMoney(v.val) or v.val)
        text:SetFont(font_header)
        text:Dock(TOP)
        text:SetTextColor(text_infos[v.name] and green or red)
        text:SetContentAlignment(5)
        text:SetAutoStretchVertical(true)

        panels[v.name] = text
    end

    local last_check = CurTime()
    function main:Think()
        if last_check < CurTime() then
            local infos, new_printers = aphone.Printer.GetInfo(getprinters)

            for k, v in pairs(infos) do
                panels[v.name]:SetText(text_infos[v.name] and aphone.Printer.FormatMoney(v.val) or v.val)
            end

            getprinters = new_printers
            last_check = CurTime() + 0.2
        end
    end

	main:aphone_RemoveCursor()
end

aphone.RegisterApp(APP)
--PATH addons/sh_reports/lua/reports_config.lua:
/**
* General configuration
**/

-- Usergroups allowed to view/handle reports
SH_REPORTS.Usergroups = {
	["moderateur"] = true,
	["admin"] = true,
	["gerant"] = true,
	["superviseur"] = true,
	["superadmin"] = true,
	-- ["manager"] = true,
	-- ["owner"] = true,
}

-- Usergroups allowed to view performance reports
SH_REPORTS.UsergroupsPerformance = {
	-- ["manager"] = true,
	["superadmin"] = true,
	["superviseur"] = true,
	["gerant"] = true,
	-- ["owner"] = true,
}

-- Customize your report reasons here.
-- Try to keep them short as they appear in full in the reports list.
SH_REPORTS.ReportReasons = {
	"Freekill",
	"FreeAttack",
	"HRP",
	"FailRP",
	"NoPain/NoFear",
	"Autre",
}

-- How many reports can a player make?
SH_REPORTS.MaxReportsPerPlayer = 1

-- Play a sound to admins whenever a report is made?
SH_REPORTS.NewReportSound = {
	enabled = true,
	path = Sound("buttons/button16.wav"),
}

-- Enable ServerLog support? Any actions related to reports will be ServerLog'd IN ENGLISH if true.
-- NOTE: ServerLogs are in English.
SH_REPORTS.UseServerLog = true

-- Should admins be able to create reports?
SH_REPORTS.StaffCanReport = true

-- Can players report admins?
SH_REPORTS.StaffCanBeReported = false

-- Should admins be able to delete unclaimed reports?
SH_REPORTS.CanDeleteWhenUnclaimed = true

-- Notify admins when they connect of any unclaimed reports?
SH_REPORTS.NotifyAdminsOnConnect = true

-- Can players report "Other"?
-- Other is no player in particular; but players can make a report with Other if they want a sit or something.
SH_REPORTS.CanReportOther = true

-- Use ULX commands for teleporting? (allows returning etc.)
SH_REPORTS.UseULXCommands = false

-- Key binding to open the Make Report menu.
SH_REPORTS.ReportKey = KEY_F9

-- Key binding to open the Report List menu.
SH_REPORTS.ReportsKey = KEY_F11

-- Should players be asked for rating the admin after their report gets closed?
SH_REPORTS.AskRating = true

-- Should admins know whenever a player rates them?
SH_REPORTS.NotifyRating = true

-- Should players be teleported back to their position after their report gets closed?
SH_REPORTS.TeleportPlayersBack = true

-- How many pending reports to show on admin's screen?
SH_REPORTS.PendingReportsDispNumber = 3

-- Allows admins to claim reports without teleporting?
-- If true, the Goto and Bring commands will be hidden.
SH_REPORTS.ClaimNoTeleport = false

-- Use Steam Workshop for the custom content?
-- If false, custom content will be downloaded through FastDL.
SH_REPORTS.UseWorkshop = true

/**
* Command configuration
**/

-- Chat commands which can open the View Reports menu (for admins)
-- ! are automatically replaced by / and inputs are made lowercase for convenience.
SH_REPORTS.AdminCommands = {
	["/reports"] = true,
	["/reportlist"] = true,
}

-- Chat commands which can open the Make Report menu (for players)
-- ! are automatically replaced by / and inputs are made lowercase for convenience.
SH_REPORTS.ReportCommands = {
	["/report"] = true,
	["/rep"] = true,
	["///"] = true,
}

-- Enable quick reporting with @?
-- Typing "@this guy RDM'd me" would open the Make Report menu with the text as a comment.
-- Might conflict with add-ons relying on @ commands.
-- NOTE: Admins cannot use this feature.
SH_REPORTS.EnableQuickReport = true

/**
* Performance reports configuration
**/

-- How should performance reports be saved?
-- Possible options: sqlite, mysqloo
-- mysqloo requires gmsv_mysqloo to be installed on your server.
-- You can configure MySQL credentials in reports/lib_database.lua
SH_REPORTS.DatabaseMode = "sqlite"

-- What should be the frequency of performance reports?
-- Possible options: daily, weekly, monthly
SH_REPORTS.PerformanceFrequency = "weekly"

-- If the above option is weekly, on what day of the week
-- should new performance reports be created? (always at midnight)
-- 0: Sunday
-- 1: Monday
-- 2: Tuesday
-- 3: Wednesday
-- 4: Thursday
-- 5: Friday
-- 6: Saturday
SH_REPORTS.PerformanceWeekDay = 1

-- Should reports created by admins count for the performance reports and ratings?
SH_REPORTS.AdminReportsCount = false

/**
* Storage configuration
**/

-- Should reports closed by an admin be stored?
-- Useful if you want to see a past report, and what rating the admin got.
-- Possible options: none, sqlite, mysqloo
-- none disables this feature.
SH_REPORTS.StoreCompletedReports = "sqlite"

-- Should reports be purged after some time? In seconds.
-- Purges are done on map start to avoid performance loss.
-- Set to 0 to make stored reports never expire.
-- Beware! Too many reports may prevent you from seeing the history properly due to large amounts of data to send.
SH_REPORTS.StorageExpiryTime = 86400 * 7

/**
* Advanced configuration
* Edit at your own risk!
**/

SH_REPORTS.MaxCommentLength = 2048

SH_REPORTS.DateFormat = "%Y/%m/%d"

SH_REPORTS.TimeFormat = "%Y/%m/%d %H:%M:%S"

-- When making a report with the "RDM" reason
-- it will automatically select the player who last killed you.
-- If you modify the report reasons above make sure to modify those here as well for convenience.
SH_REPORTS.ReasonAutoTarget = {
	["RDM"] = "killer",
	["RDA"] = "arrester",
}

/**
* Theme configuration
**/

-- Font to use for normal text throughout the interface.
SH_REPORTS.Font = "Circular Std Medium"

-- Font to use for bold text throughout the interface.
SH_REPORTS.FontBold = "Circular Std Bold"

-- Color sheet. Only modify if you know what you're doing
SH_REPORTS.Style = {
	header = Color(52, 152, 219, 255),
	bg = Color(52, 73, 94, 255),
	inbg = Color(44, 62, 80, 255),

	close_hover = Color(231, 76, 60, 255),
	hover = Color(255, 255, 255, 10, 255),
	hover2 = Color(255, 255, 255, 5, 255),

	text = Color(255, 255, 255, 255),
	text_down = Color(0, 0, 0),
	textentry = Color(44, 62, 80),
	menu = Color(127, 140, 141),

	success = Color(46, 204, 113),
	failure = Color(231, 76, 60),
	rating = Color(241, 196, 15),
}

/**
* Language configuration
**/

-- Various strings used throughout the add-on.
-- Available languages: english, french, german
-- To add your own language, see the reports/language folder
-- You may need to restart the map after changing the language!
SH_REPORTS.LanguageName = "french"
--PATH lua/drgbase/dpanels.lua:
if SERVER then return end

function DrGBase.DListView(columns, options)
	if not istable(options) then options = {} end
	local dlist = vgui.Create("DListView")
	for i, column in ipairs(columns) do dlist:AddColumn(column) end
	if isstring(options.convar) then
		local convar = GetConVar(options.convar)
		if convar then
			local old_AddLine = dlist.AddLine
			local old_Clear = dlist.Clear
			cvars.AddChangeCallback(options.convar, function(convar, old, new)
				if old == new then return end
				new = util.JSONToTable(new)
				old_Clear(dlist)
				for i, line in ipairs(new) do
					old_AddLine(dlist, unpack(line))
				end
			end)
			function dlist:AddLine(...)
				local tbl = util.JSONToTable(convar:GetString())
				table.insert(tbl, {...})
				convar:SetString(util.TableToJSON(tbl))
			end
			function dlist:RemoveLine(id)
				local tbl = util.JSONToTable(convar:GetString())
				table.remove(tbl, id)
				convar:SetString(util.TableToJSON(tbl))
			end
			function dlist:Clear()
				convar:SetString("[]")
			end
		end
	end
	return dlist
end

--PATH lua/drgbase/nextbots.lua:
local PrecacheModels = CreateConVar("drgbase_precache_models", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local PrecacheSounds = CreateConVar("drgbase_precache_sounds", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

-- Registry --

function DrGBase.AddNextbotMixins(ENT)
	if isfunction(ENT.OnTraceAttack) then
		local old_OnTraceAttack = ENT.OnTraceAttack
		function ENT:OnTraceAttack(...)
			local res = self:_HandleTraceAttack(...)
			if res ~= nil then return res end
			return old_OnTraceAttack(self, ...)
		end
	end
	if isfunction(ENT.OnNavAreaChanged) then
		local old_OnNavAreaChanged = ENT.OnNavAreaChanged
		function ENT:OnNavAreaChanged(...)
			local res = self:_HandleNavAreaChanged(...)
			if res ~= nil then return res end
			return old_OnNavAreaChanged(self, ...)
		end
	end
	if isfunction(ENT.OnLeaveGround) then
		local old_OnLeaveGround = ENT.OnLeaveGround
		function ENT:OnLeaveGround(...)
			local res = self:_HandleLeaveGround(...)
			if res ~= nil then return res end
			return old_OnLeaveGround(self, ...)
		end
	end
	if isfunction(ENT.OnLandOnGround) then
		local old_OnLandOnGround = ENT.OnLandOnGround
		function ENT:OnLandOnGround(...)
			local res = self:_HandleLandOnGround(...)
			if res ~= nil then return res end
			return old_OnLandOnGround(self, ...)
		end
	end
	if isfunction(ENT.OnTakeDamage) then
		local old_TakeDamage = ENT.OnTakeDamage
		function ENT:OnTakeDamage(dmg, hitgroup)
			if not isnumber(hitgroup) then return end
			return old_TakeDamage(self, dmg, hitgroup)
		end
	end
end

function DrGBase.AddNextbot(ENT)
	local class = string.Replace(ENT.Folder, "entities/", "")
	if ENT.PrintName == nil or ENT.Category == nil then return false end
	if PrecacheModels:GetBool() then
		for i, model in ipairs(ENT.Models or {}) do
			if not isstring(model) then continue end
			util.PrecacheModel(model)
		end
	end
	if PrecacheSounds:GetBool() then
		for i, sounds in ipairs({
			ENT.OnSpawnSounds,
			ENT.OnIdleSounds,
			ENT.OnDamageSounds,
			ENT.OnDeathSounds
		}) do
			if not istable(sounds) then continue end
			for h, soundName in ipairs(sounds) do
				if not isstring(soundName) then continue end
				util.PrecacheSound(soundName)
			end
		end
	end
	if CLIENT then
		language.Add(class, ENT.PrintName)
		ENT.Killicon = ENT.Killicon or {
			icon = "HUD/killicons/default",
			color = Color(255, 80, 0, 255)
		}
		killicon.Add(class, ENT.Killicon.icon, ENT.Killicon.color)
	else
		resource.AddFile("materials/entities/"..class..".png")
		DrGBase.AddNextbotMixins(ENT)
	end
	local nextbot = {
		Name = ENT.PrintName,
		Class = class,
		Category = ENT.Category
	}
	if ENT.Spawnable ~= false then
		list.Set("NPC", class, nextbot)
		list.Set("DrGBaseNextbots", class, nextbot)
	end
	DrGBase.Print("Nextbot '"..class.."': loaded.")
	return true
end

hook.Add("PopulateDrGBaseSpawnmenu", "AddDrGBaseNextbots", function(pnlContent, tree, node)
	local list = list.Get("DrGBaseNextbots")
	local categories = {}
	for class, ent in pairs(list) do
		local category = ent.Category or "Other"
		local tab = categories[category] or {}
		tab[class] = ent
		categories[category] = tab
	end
	local nextbotsTree = tree:AddNode("Nextbots", "icon16/monkey.png")
	for categoryName, category in SortedPairs(categories) do
		local icon = DrGBase.GetIcon(categoryName) or "icon16/monkey.png"
		if categoryName == "DrGBase" then icon = DrGBase.Icon end
		local node = nextbotsTree:AddNode(categoryName, icon)
		node.DoPopulate = function(self)
			if self.PropPanel then return end
			self.PropPanel = vgui.Create("ContentContainer", pnlContent)
			self.PropPanel:SetVisible(false)
			self.PropPanel:SetTriggerSpawnlistChange(false)
			for class, ent in SortedPairsByMemberValue(category, "Name") do
				spawnmenu.CreateContentIcon("npc", self.PropPanel, {
					nicename	= ent.Name or class,
					spawnname	= class,
					material = "entities/"..class..".png",
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

DrGBase._SpawnedNextbots = DrGBase._SpawnedNextbots or {}
function DrGBase.GetNextbots()
	return DrGBase._SpawnedNextbots
end

DrGBase.DefaultFootsteps = {
	[MAT_ANTLION] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav"
	},
	[MAT_BLOODYFLESH] = {
		"physics/flesh/flesh_squishy_impact_hard1.wav",
		"physics/flesh/flesh_squishy_impact_hard2.wav",
		"physics/flesh/flesh_squishy_impact_hard3.wav",
		"physics/flesh/flesh_squishy_impact_hard4.wav"
	},
	[MAT_CONCRETE] = {
		"player/footsteps/concrete1.wav",
		"player/footsteps/concrete2.wav",
		"player/footsteps/concrete3.wav",
		"player/footsteps/concrete4.wav"
	},
	[MAT_DIRT] = {
		"player/footsteps/dirt1.wav",
		"player/footsteps/dirt2.wav",
		"player/footsteps/dirt3.wav",
		"player/footsteps/dirt4.wav"
	},
	[MAT_EGGSHELL] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav"
	},
	[MAT_FLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav"
	},
	[MAT_GRATE] = {
		"player/footsteps/chainlink1.wav",
		"player/footsteps/chainlink2.wav",
		"player/footsteps/chainlink3.wav",
		"player/footsteps/chainlink4.wav"
	},
	[MAT_ALIENFLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav"
	},
	[MAT_SNOW] = {
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav"
	},
	[MAT_PLASTIC] = {
		"physics/plastic/plastic_box_impact_soft1.wav",
		"physics/plastic/plastic_box_impact_soft2.wav",
		"physics/plastic/plastic_box_impact_soft3.wav",
		"physics/plastic/plastic_box_impact_soft4.wav"
	},
	[MAT_METAL] = {
		"player/footsteps/metal1.wav",
		"player/footsteps/metal2.wav",
		"player/footsteps/metal3.wav",
		"player/footsteps/metal4.wav"
	},
	[MAT_SAND] = {
		"player/footsteps/sand1.wav",
		"player/footsteps/sand2.wav",
		"player/footsteps/sand3.wav",
		"player/footsteps/sand4.wav"
	},
	[MAT_FOLIAGE] = {
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav"
	},
	[MAT_COMPUTER] = {
		"player/footsteps/metal1.wav",
		"player/footsteps/metal2.wav",
		"player/footsteps/metal3.wav",
		"player/footsteps/metal4.wav"
	},
	[MAT_SLOSH] = {
		"player/footsteps/slosh1.wav",
		"player/footsteps/slosh2.wav",
		"player/footsteps/slosh3.wav",
		"player/footsteps/slosh4.wav"
	},
	[MAT_TILE] = {
		"player/footsteps/tile1.wav",
		"player/footsteps/tile2.wav",
		"player/footsteps/tile3.wav",
		"player/footsteps/tile4.wav"
	},
	[MAT_GRASS] = {
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav"
	},
	[MAT_VENT] = {
		"player/footsteps/duct1.wav",
		"player/footsteps/duct2.wav",
		"player/footsteps/duct3.wav",
		"player/footsteps/duct4.wav"
	},
	[MAT_WOOD] = {
		"player/footsteps/wood1.wav",
		"player/footsteps/wood2.wav",
		"player/footsteps/wood3.wav",
		"player/footsteps/wood4.wav"
	},
	[MAT_DEFAULT] = {
		"player/footsteps/concrete1.wav",
		"player/footsteps/concrete2.wav",
		"player/footsteps/concrete3.wav",
		"player/footsteps/concrete4.wav"
	},
	[MAT_GLASS] = {
		"physics/glass/glass_sheet_step1.wav",
		"physics/glass/glass_sheet_step2.wav",
		"physics/glass/glass_sheet_step3.wav",
		"physics/glass/glass_sheet_step4.wav"
	},
	[MAT_WARPSHIELD] = {
		"physics/glass/glass_sheet_step1.wav",
		"physics/glass/glass_sheet_step2.wav",
		"physics/glass/glass_sheet_step3.wav",
		"physics/glass/glass_sheet_step4.wav"
	}
}

--PATH lua/drgbase/resources.lua:
if CLIENT then return end

resource.AddFile("materials/drgbase/icon16.png")

--PATH lua/drgbase/meta/npc.lua:

local npcMETA = FindMetaTable("NPC")

if SERVER then

	function npcMETA:DrG_SetRelationship(ent, disp)
		if not IsValid(ent) then return end
		if self.CPTBase_NPC then
			self:AddEntityRelationship(ent, disp, 99)
		else
			self._DrGBaseRelPrios = self._DrGBaseRelPrios or {}
			if not self._DrGBaseRelPrios[ent] then self._DrGBaseRelPrios[ent] = 0 end
			self._DrGBaseRelPrios[ent] = self._DrGBaseRelPrios[ent]+1
			self:AddEntityRelationship(ent, disp, self._DrGBaseRelPrios[ent])
			if not self.IsVJBaseSNPC or not ent.IsDrGNextbot then return end
			if istable(self.CurrentPossibleEnemies) and
			not table.HasValue(self.CurrentPossibleEnemies, ent) then
				table.insert(self.CurrentPossibleEnemies, ent)
			end
			if istable(self.VJ_AddCertainEntityAsEnemy) then
				if (disp == D_HT or disp == D_FR) then
					if not table.HasValue(self.VJ_AddCertainEntityAsEnemy, ent) then
						table.insert(self.VJ_AddCertainEntityAsEnemy, ent)
					end
				else table.RemoveByValue(self.VJ_AddCertainEntityAsEnemy, ent) end
			end
			if istable(self.VJ_AddCertainEntityAsFriendly) then
				if disp == D_LI then
					if not table.HasValue(self.VJ_AddCertainEntityAsFriendly, ent) then
						table.insert(self.VJ_AddCertainEntityAsFriendly, ent)
					end
				else table.RemoveByValue(self.VJ_AddCertainEntityAsFriendly, ent) end
			end
		end
	end

end

--PATH lua/drgbase/meta/vector.lua:

local vecMETA = FindMetaTable("Vector")

-- Ballistic stuff --

function vecMETA:DrG_TrajectoryInfo(direction, ballistic)
	local data = direction:DrG_Data()
	if ballistic then
		local gravity = physenv.GetGravity():Length()
		local magnitude = data.length
		local pitch = math.rad(data.pitch)
		local forward = data.forward
		local calc = magnitude*math.sin(pitch)
		local highest = calc/gravity
		local function Predict(t)
			local pos = forward*magnitude*t*math.cos(pitch)
			pos.z = magnitude*t*math.sin(pitch)-(gravity*t*t)/2
			local velocity = forward*magnitude*math.cos(pitch)
			velocity.z = magnitude*math.sin(pitch)-gravity*t
			return self + pos, velocity
		end
		return {
			normal = data.normal,
			forward = data.forward,
			magnitude = data.length,
			pitch = data.pitch,
			highest = highest,
			height = Predict(highest).z - self.z,
			Predict = Predict,
			ballistic = true
		}
	else
		return {
			normal = data.normal,
			forward = data.forward,
			magnitude = data.length,
			pitch = data.pitch,
			Predict = function(t)
				return self+direction*t, direction
			end,
			ballistic = false
		}
	end
end
function vecMETA:DrG_Data()
	local forward = Vector(self.x, self.y, 0)
	local pitch = math.atan(self.z/forward:Length())
	return {
		normal = self:GetNormalized(),
		forward = forward:GetNormalized(),
		length = self:Length(),
		pitch = math.deg(pitch)
	}
end

function vecMETA:DrG_CalcLineTrajectory(target, speed, feet)
	if isentity(target) and IsValid(target) then
		local aimAt = feet and target:GetPos() or target:WorldSpaceCenter()
		local velocity = target:IsNPC() and target:GetGroundSpeedVelocity() or target:GetVelocity()
		local dist = self:Distance(aimAt)
		return self:DrG_CalcLineTrajectory(aimAt+velocity*(dist/speed), speed)
	elseif isvector(target) then
		local dir = self:DrG_Dir(target):GetNormalized()*speed
		local info = self:DrG_TrajectoryInfo(dir, false)
		info.duration = self:Distance(target)/speed
		return dir, info
	else
		local dir = Vector(0, 0, 0)
		return dir, self:DrG_TrajectoryInfo(dir, false)
	end
end

function vecMETA:DrG_CalcBallisticTrajectory(target, options, feet)
	options = istable(options) and options or {}
	if isentity(target) and IsValid(target) then
		local aimAt = feet and target:GetPos() or target:WorldSpaceCenter()
		local velocity = target:IsNPC() and target:GetGroundSpeedVelocity() or target:GetVelocity()
		local options2 = table.Copy(options)
		options2.recursive = true
		local dir, info = self:DrG_CalcBallisticTrajectory(aimAt, options2)
		return self:DrG_CalcBallisticTrajectory(aimAt+velocity*info.duration, options)
	elseif isvector(target) then
		local dir = Vector(target.x - self.x, target.y - self.y, 0)
		local g = options._g or physenv.GetGravity():Length()
		local x = options._x or dir:Length()
		local y = target.z - self.z
		local pitch = nil
		local magnitude = nil
		local pitchnumber = isnumber(options.pitch)
		local magnitudenumber = isnumber(options.magnitude)
		if pitchnumber and not magnitudenumber then
			pitch = math.rad(math.Clamp(options.pitch, -90, 90))
			if y >= math.tan(pitch)*x then
				if options.recursive then
					options._g = g
					options._x = x
					options.pitch = math.deg(pitch)+1
					return self:DrG_CalcBallisticTrajectory(target, options)
				else
					dir.z = math.tan(pitch)*x
					local velocity = dir:GetNormalized()
					local info = self:DrG_TrajectoryInfo(velocity)
					info.duration = -1
					return velocity, info
				end
			else magnitude = math.sqrt((-g*x*x)/(2*(math.cos(pitch)^2)*(y-x*math.tan(pitch)))) end
		elseif magnitudenumber and not pitchnumber then
			magnitude = math.abs(options.magnitude)
			local v = magnitude
			local calc = math.sqrt(v^4-g*(g*x*x+2*y*v*v))
			if calc ~= calc then
				if options.recursive then
					options._g = g
					options._x = x
					options.magnitude = v*1.05
					return self:DrG_CalcBallisticTrajectory(target, options)
				else
					local velocity = self:DrG_Dir(target):GetNormalized()*v
					local info = self:DrG_TrajectoryInfo(velocity)
					info.duration = -1
					return velocity, info
				end
			else
				local s1 = math.atan((v*v+calc)/(g*x))
				local s2 = math.atan((v*v-calc)/(g*x))
				if options.highest then
					pitch = s1 < s2 and s2 or s1
				else pitch = s1 > s2 and s2 or s1 end
			end
		elseif not pitchnumber and not magnitudenumber then
			options._g = g
			options._x = x
			options.pitch = 45
			return self:DrG_CalcBallisticTrajectory(target, options)
		else
			pitch = math.rad(options.pitch)
			magnitude = options.magnitude
		end
		dir.z = math.tan(pitch)*x
		local velocity = dir:GetNormalized()*magnitude
		local info = self:DrG_TrajectoryInfo(velocity, true)
		local calc = math.sqrt(((velocity.z^2)/(g^2))-((2*y)/g))
		local duration1 = (velocity.z/g)+calc
		local duration2 = (velocity.z/g)-calc
		local dist1 = info.Predict(duration1):DistToSqr(target)
		local dist2 = info.Predict(duration2):DistToSqr(target)
		if dist1 < dist2 then info.duration = duration1
		else info.duration = duration2 end
		return velocity, info
	else
		local dir = Vector(0, 0, 0)
		return dir, self:DrG_TrajectoryInfo(dir, true)
	end
end

-- Misc --

function vecMETA:DrG_ManhattanDistance(pos)
	return math.abs(self.x - pos.x) + math.abs(self.y - pos.y) + math.abs(self.z - pos.z)
end

function vecMETA:DrG_Direction(pos)
	return pos - self
end
function vecMETA:DrG_Dir(pos)
	return self:DrG_Direction(pos)
end

function vecMETA:DrG_Degrees(vec2, origin)
	local vec1 = self
	origin = origin or Vector(0, 0, 0)
	vec1 = vec1 - origin
	vec2 = vec2 - origin
	return math.deg(math.acos(math.Round(vec1:GetNormalized():Dot(vec2:GetNormalized()), 2)))
end

function vecMETA:DrG_Round(round)
	return Vector(
		math.Round(self.x, round),
		math.Round(self.y, round),
		math.Round(self.z, round)
	)
end
function vecMETA:DrG_ToString(round)
	local rounded = self:DrG_Round(round)
	return tostring(util.NiceFloat(rounded.x)).." / "..tostring(util.NiceFloat(rounded.y)).." / "..tostring(util.NiceFloat(rounded.z))
end

function vecMETA:DrG_Copy()
	local copy = Vector()
	copy:Set(self)
	return copy
end

function vecMETA:DrG_Join(other, ratio)
	return LerpVector(ratio, self, other)
end

function vecMETA:DrG_Away(pos)
	return self*2 - pos
end

--PATH lua/drgbase/modules/debugoverlay.lua:

function debugoverlay.DrG_Trajectory(start, velocity, lifetime, color, ignoreZ, options)
	local info = start:DrG_TrajectoryInfo(velocity, options.ballistic)
	options = options or {}
	options.from = options.from or 0
	options.to = options.to or 10
	options.increments = options.increments or 0.01
	if options.colors == nil then options.colors = function() end end
	if options.height == nil then options.height = true end
	local t = options.from
	while t < options.to do
		if isfunction(color) then
			debugoverlay.Line(info.Predict(t), info.Predict(t+options.increments), lifetime, color(t), ignoreZ)
		else debugoverlay.Line(info.Predict(t), info.Predict(t+options.increments), lifetime, color, ignoreZ) end
		t = t+options.increments
	end
	if info.ballistic and options.height then
		local highestPoint = info.Predict(info.highest)
		local tr = util.TraceLine({
			start = highestPoint,
			endpos = highestPoint + Vector(0, 0, -999999999),
			collisiongroup = COLLISION_GROUP_IN_VEHICLE
		})
		if isfunction(color) then
			debugoverlay.Line(highestPoint, tr.HitPos, lifetime, color(info.highest), ignoreZ)
		else debugoverlay.Line(highestPoint, tr.HitPos, lifetime, color, ignoreZ) end
	end
end

--PATH lua/drgbase/modules/navmesh.lua:
if CLIENT then return end

local NAVAREAS_CENTERS = {}
function navmesh.DrG_GetAreaFromCenter(pos)
	return NAVAREAS_CENTERS[tostring(pos)]
end
for i, area in ipairs(navmesh.GetAllNavAreas()) do
	NAVAREAS_CENTERS[tostring(area:GetCenter())] = area
end

--PATH addons/sl_util_wallet/lua/ezwallet/shared/colors.lua:


easzy.wallet.colors = {}

-- Palette from https://flatuicolors.com/palette/defo

easzy.wallet.colors.belizeHole = Color(41, 128, 185, 255)
easzy.wallet.colors.carrot = Color(230, 126, 34, 255)

-- Other colors

easzy.wallet.colors.white = Color(255, 255, 255, 255)
easzy.wallet.colors.black = Color(0, 0, 0, 255)
easzy.wallet.colors.red = Color(255, 0, 0, 255)


--PATH addons/sl_util_wallet/lua/ezwallet/shared/bodygroup.lua:


-- Returns a string of all the bodygroups of an entity
function easzy.wallet.GetBodygroupsString(entity)
    local bodygroupsString = ""

    for i = 0, entity:GetNumBodyGroups() - 1 do
        local bodygroup = entity:GetBodygroup(i)
        bodygroupsString = bodygroupsString .. bodygroup
    end

    return bodygroupsString
end

-- Returns the integer value of a bodygroup by its name
function easzy.wallet.FindBodygroupValueByValueName(entity, bodygroup, valueName)
    -- Because blank is not written int the bodygroup table
    local bodygroupTable = entity:GetBodyGroups()[bodygroup + 1]

    for value = 0, entity:GetBodygroupCount(bodygroup) - 1 do
        local name = bodygroupTable.submodels[value]
        name = (name == "" and "blank" or name)

        if name == valueName then return value end
    end

    return -1
end

-- Set a bodygroup of an entity by its name
function easzy.wallet.SetBodygroupByNames(entity, bodygroupName, valueName)
    local bodygroup = entity:FindBodygroupByName(bodygroupName)
    if bodygroup == -1 then return end

    local value = easzy.wallet.FindBodygroupValueByValueName(entity, bodygroup, valueName)
    if value == -1 then return end

    entity:SetBodygroup(bodygroup, value)
end

-- Set many bodygroups of an entity by their names
function easzy.wallet.SetBodygroupsByNames(entity, bodygroupsList)
    if not IsValid(entity) then return end

    for bodygroupName, valueName in pairs(bodygroupsList) do
        easzy.wallet.SetBodygroupByNames(entity, bodygroupName, valueName)
    end
end


--PATH addons/gmod_info_board/lua/autorun/gmib_launch.lua:
--Gmod Info Board Launch File
--DO NOT CHANGE
print("[ Gmod Info Board ] Loading Config Files")

gmib = {}

if SERVER then
	for _, filename in pairs( file.Find( "gmod_info_board/sh/*.lua", "LUA" ) ) do
		include( "gmod_info_board/sh/" .. filename )
		AddCSLuaFile( "gmod_info_board/sh/" .. filename )
	end
	for _, filename in pairs( file.Find( "gmod_info_board/sv/*.lua", "LUA" ) ) do
		include( "gmod_info_board/sv/" .. filename )
	end
	for _, filename in pairs( file.Find( "gmod_info_board/cl/*.lua", "LUA" ) ) do
		AddCSLuaFile( "gmod_info_board/cl/" .. filename )
	end
end

if CLIENT then
	for _, filename in pairs( file.Find( "gmod_info_board/sh/*.lua", "LUA" ) ) do
		include( "gmod_info_board/sh/" .. filename )
	end
	for _, filename in pairs( file.Find( "gmod_info_board/cl/*.lua", "LUA" ) ) do
		include( "gmod_info_board/cl/" .. filename )
	end
end

print("[ Gmod Info Board ] Finished Loading Config Files")

--PATH lua/autorun/gmodadminsuite.lua:
if (CLIENT and not file.Exists("gmodadminsuite/sh_networking.lua", "LUA")) then
	-- serverside code failed for some reason, abort loading GAS
	return
end

if (CLIENT and GAS) then
	if (IsValid(GAS.Menu)) then
		GAS.Menu:Close()
	end
	if (IsValid(GAS.ModuleFrame)) then
		GAS.ModuleFrame:Close()
	end
end

if (not file.IsDir("gmodadminsuite", "DATA")) then
	file.CreateDir("gmodadminsuite", "DATA")
end

GAS = {}

--######## sv_hibernate_think ########--

if (SERVER) then
	RunConsoleCommand("sv_hibernate_think", "1")
end

--######## Clientside Lua Files ########--

AddCSLuaFile("gmodadminsuite_lua_functions.lua")
AddCSLuaFile("gmodadminsuite_config.lua")

AddCSLuaFile("gmodadminsuite/cl_contextmenu.lua")
AddCSLuaFile("gmodadminsuite/cl_menubar.lua")
AddCSLuaFile("gmodadminsuite/sh_teams.lua")
AddCSLuaFile("gmodadminsuite/sh_modules.lua")
AddCSLuaFile("gmodadminsuite/sh_language.lua")
AddCSLuaFile("gmodadminsuite/sh_afk.lua")
AddCSLuaFile("gmodadminsuite/cl_selection_prompts.lua")
AddCSLuaFile("gmodadminsuite/cl_menu.lua")
AddCSLuaFile("gmodadminsuite/cl_country_codes.lua")

AddCSLuaFile("gmodadminsuite/thirdparty/pon.lua")
AddCSLuaFile("gmodadminsuite/thirdparty/spon.lua")
AddCSLuaFile("gmodadminsuite/thirdparty/von.lua")

--######## PRINTING ########--

GAS_COLOR_WHITE = Color(255,255,255)

GAS_PRINT_COLOR_GOOD    = Color(0,255,0)
GAS_PRINT_COLOR_BAD     = Color(255,0,0)
GAS_PRINT_COLOR_NEUTRAL = Color(0,255,255)

GAS_PRINT_TYPE_INFO  = "[INFO]"
GAS_PRINT_TYPE_WARN  = "[WARN]"
GAS_PRINT_TYPE_FAIL  = "[FAIL]"
GAS_PRINT_TYPE_DEBUG = "[DEBUG]"
function GAS:print(print_text, print_status_or_type, print_type)
	local type_str = ""
	local print_status = GAS_PRINT_COLOR_NEUTRAL
	if (print_type) then
		print_status = print_status_or_type
		type_str = print_type .. " "
	else
		if (type(print_status_or_type) == "string") then
			type_str = print_status_or_type .. " "
		end
		if (type(print_status_or_type) == "table") then
			print_status = print_status_or_type
		end
	end
	MsgC(print_status, "[GmodAdminSuite] ", type_str, GAS_COLOR_WHITE, print_text .. "\n")
end
if (CLIENT) then
	function GAS:chatPrint(print_text, print_status_or_type, print_type)
		local type_str = ""
		local print_status = GAS_PRINT_COLOR_NEUTRAL
		if (print_type) then
			print_status = print_status_or_type
			type_str = print_type .. " "
		else
			if (type(print_status_or_type) == "string") then
				type_str = print_status_or_type .. " "
			end
			if (type(print_status_or_type) == "table") then
				print_status = print_status_or_type
			end
		end
		chat.AddText(print_status, "[GmodAdminSuite] ", type_str, GAS_COLOR_WHITE, print_text)
	end
end

local first_header = true
local header_space_len = 85
local header_padding = 3
function GAS:StartHeader(header)
	if (first_header) then
		first_header = false
	else
		GAS:print("")
	end
	local header_len = #header + (header_padding * 2)
	GAS:print("[" .. ("="):rep(math.floor(header_space_len / 2 - header_len / 2)) .. (" "):rep(header_padding) .. header .. (" "):rep(header_padding) .. ("="):rep(math.ceil(header_space_len / 2 - header_len / 2)) .. "]")
end
function GAS:HeaderPrint(str, print_status_or_type, print_type)
	local str_len = utf8.len(str)

	local type_str = ""
	local print_status = GAS_PRINT_COLOR_NEUTRAL
	if (print_type) then
		print_status = print_status_or_type
		type_str = print_type .. " "
	else
		if (type(print_status_or_type) == "string") then
			type_str = print_status_or_type .. " "
		end
		if (type(print_status_or_type) == "table") then
			print_status = print_status_or_type
		end
	end

	local header_space_len_padded = header_space_len - 2 - #type_str
	if (str_len > header_space_len_padded) then
		for i = 1, math.ceil(str_len / header_space_len_padded) do
			GAS:HeaderPrint(str:sub(((i - 1) * header_space_len_padded) + 1, i * header_space_len_padded), print_status_or_type, print_type)
		end
		return
	else
		MsgC(print_status, "[GmodAdminSuite] ", GAS_COLOR_WHITE, "[ ", print_status, type_str, GAS_COLOR_WHITE, str .. (" "):rep(header_space_len - str_len - #type_str - 2) .. " ]\n")
	end
end
function GAS:EndHeader()
	GAS:print("[" .. ("="):rep(header_space_len) .. "]")
end

--######## InitPostEntity ########--

GAS.InitPostEntity_hooks = {}
function GAS:InitPostEntity(func)
	if (GAS_InitPostEntity) then
		func()
	else
		table.insert(GAS.InitPostEntity_hooks, func)
	end
end
function GAS:InitPostEntity_Run()
	hook.Remove("InitPostEntity", "gmodadminsuite:InitPostEntity_Loader")
	if GAS_InitPostEntity then return end

	GAS:print("InitPostEntity")
	GAS_InitPostEntity = true
	for _,v in ipairs(GAS.InitPostEntity_hooks) do v() end
end
if (SERVER) then
	util.AddNetworkString("GAS.InitPostEntityNetworking")

	net.Receive("GAS.InitPostEntityNetworking", function(_, ply)
		if (not ply.GAS_InitPostEntityNetworking) then
			ply.GAS_InitPostEntityNetworking = true
			net.Start("GAS.InitPostEntityNetworking")
			net.Send(ply)
		end
	end)
end

if (not GAS_InitPostEntity) then
	if (SERVER) then
		hook.Add("InitPostEntity", "gmodadminsuite:InitPostEntity_Loader", GAS.InitPostEntity_Run)
		timer.Simple(0.1, GAS.InitPostEntity_Run)
	else
		hook.Add("InitPostEntity", "gmodadminsuite:InitPostEntity_Loader", function()
			net.Receive("GAS.InitPostEntityNetworking", function()
				timer.Remove("GAS.InitPostEntityNetworking")
				GAS:InitPostEntity_Run()
			end)
			local function DoPing()
				net.Start("GAS.InitPostEntityNetworking")
				net.SendToServer()
			end
			DoPing()
			timer.Create("GAS.InitPostEntityNetworking", 2, 0, DoPing)
		end)
	end
else
	GAS:InitPostEntity_Run()
end

--######## Initialize ########--

GAS_GMInitialize = GAS_GMInitialize == true or GM ~= nil or GAMEMODE ~= nil
GAS.GMInitialize_hooks = {}
function GAS:GMInitialize(func)
	if (GAS_GMInitialize) then
		func()
	else
		table.insert(GAS.GMInitialize_hooks, func)
	end
end
if (not GAS_GMInitialize) then
	local function GMInitialize()
		GAS_GMInitialize = true
		for _,v in ipairs(GAS.GMInitialize_hooks) do v() end
		GAS.GMInitialize_hooks = {}

		timer.Remove("gmodadminsuite:GMInitialize_Loader")
		hook.Remove("Initialize", "gmodadminsuite:GMInitialize_Loader")
	end
	hook.Add("Initialize", "gmodadminsuite:GMInitialize_Loader", function()
		timer.Remove("gmodadminsuite:GMInitialize_Loader")

		GAS:print("Gamemode initialized")

		GAS_GMInitialize = true
		for _,v in ipairs(GAS.GMInitialize_hooks) do v() end
		GAS.GMInitialize_hooks = {}
	end)
	timer.Simple(0, function()
		if (GM or GAMEMODE) then
			GMInitialize()
		else
			timer.Create("gmodadminsuite:GMInitialize_Loader", 1, 0, function()
				if (GM or GAMEMODE) then
					GAS:print("Gamemode initialized (late/did not fire)", GAS_PRINT_TYPE_WARN)
					GMInitialize()
				end
			end)
		end
	end)
end

--######## PRINT INFO ########--

GAS:StartHeader("GmodAdminSuite")

GAS.Version = "v1"
GAS:HeaderPrint("Version: " .. GAS.Version, GAS_PRINT_COLOR_GOOD)

--######## BillysErrors ########--

require("billyserrors")
if (SERVER) then
	GAS.BillysErrors = BillysErrors:AddAddon({
		Name  = "GmodAdminSuite",
		Color = Color(0,125,255),
		Icon  = "icon16/shield.png"
	})
end

--######## INITIALIZE ########--

include("gmodadminsuite/sh_core.lua")

--######## RELOADER ########--

concommand.Add("gas_reload", function(ply)
	if (SERVER and IsValid(ply)) then return end
	include("autorun/gmodadminsuite.lua")
end)
--PATH lua/gmodadminsuite/modules/fpsbooster/lang/english.lua:
return {
	Name = "English",
	Flag = "flags16/gb.png",
	Phrases = function() return {

		module_name = "FPS Booster",

		--####################### UI PHRASES #######################--

		fps_booster          = "FPS Booster",
		never_show_again     = "Never Show Again",
		never_show_again_tip = "You'll lose the benefits of this menu! Type \"gmodadminsuite fpsbooster\" in your console to open this menu in future.",

		--####################### SETTING PHRASES #######################--

		show_fps                 = "Show FPS",
		multicore_rendering      = "Enable Multicore Rendering",
		multicore_rendering_help = "This is an experimental feature of GMod which boosts FPS by rendering frames using more than a single CPU core.",
		hardware_acceleration    = "Enable Hardware Acceleration",
		shadows                  = "Disable Shadows",
		disable_skybox           = "Disable Skybox",
		sprays                   = "Disable Player Sprays",
		gibs                     = "Disable Gibs",
		gibs_help                = "\"Gibs\" are particles and objects that can fly off of corpses and ragdolls.",

} end }
--PATH addons/gmodadminsuite-logging-2.4.8/lua/gmodadminsuite/modules/logging/lang/english.lua:
return {
	Name = "English",
	Flag = "flags16/gb.png",
	Phrases = function() return {

		module_name = "Billy's Logs",

		--####################### UI PHRASES #######################--

		no_data                     = "No data",
		add_to_evidence_box         = "Add to Evidence Box",
		livelogs_show_logs_for      = "Show Logs For",
		background_color            = "Background Color",
		health_abbrieviated         = "%d HP",
		livelogs                    = "Live Logs",
		exit_deep_storage           = "Exit Deep Storage",
		log_formatting              = "Log Formatting",
		strings                     = "Strings",
		when                        = "When",
		copy_log                    = "Copy Log",
		evidence_box                = "Evidence Box",
		livelogs_position_x         = "X Position (pixels)",
		width                       = "Width",
		color                       = "Color",
		help                        = "Help",
		apply_filter                = "Apply Filter",
		live_log_antispam           = "< discarded live log for antispam >",
		settings                    = "Settings",
		loading_ellipsis            = "Loading...",
		livelogs_enabled            = "Enable Live Logs",
		armor_abbrieviated          = "%d ARM",
		deep_storage                = "Deep Storage",
		all_logs                    = "All Logs",
		logs                        = "Logs",
		padding                     = "Padding (pixels)",
		livelogs_position_y         = "Y Position (pixels)",
		livelogs_rows_help          = "What is the maximum amount of logs that should be displayed?",
		livelogs_rows               = "Rows (Log Amount)",
		livelogs_color_help         = "Should logs be displayed in color?",
		export_to_clipboard         = "Export to clipboard",
		players                     = "Players",
		script_page                 = "Script Page",
		wiki                        = "Wiki",
		module                      = "Module",
		modules                     = "Modules",
		localization                = "Localization",
		view_deep_storage           = "View Deep Storage",
		copied                      = "Copied!",
		operator                    = "Operator",
		log                         = "Log",
		reset_to_defaults           = "Reset to Defaults",
		livelogs_show_logs_for_help = "How many seconds should logs be shown for?\nSet to 0 for forever.",
		advanced_search             = "Advanced Search",
		quick_search                = "Quick Search",
		quick_search_ellipsis       = "Quick Search...",
		entities                    = "Entities",
		tutorial                    = "Tutorial",
		clear_filters               = "Clear Filters",
		clear_filter                = "Clear Filter",
		manual_steamid_ellipsis     = "Manual SteamID...",
		no_results_found            = "No results found",
		add_player                  = "+ Add Player",
		add_module                  = "+ Add Module",
		add_entity                  = "+ Add Entity",
		add_string                  = "+ Add String",
		modules_search_tooltip      = "What module(s) do you want to include? (leave blank for any module)",
		players_search_tooltip      = "What player(s) are you looking for? (leave blank for any player)",
		entities_search_tooltip     = "What entities(s) are you looking for? (SWEPs, SENTs, vehicles, props, classes, etc.)",
		strings_search_tooltip      = "Is there any specific text that you are looking for?",
		class_name_ellipsis         = "Class name...",
		add_string_popup_title      = "Add String",
		add_string_popup_text       = "Enter the text you're trying to find.",
		text_ellipsis               = "Text...",
		click_to_focus              = "Click to focus",
		right_click_to_focus        = "Right click to focus",
		highlight_color             = "Highlight Color",
		weapon_color                = "Weapon Color",
		money_color                 = "Money Color",
		vehicle_color               = "Vehicle Color",
		entity_color                = "Entity Color",
		health_color                = "Health Color",
		armor_color                 = "Armor Color",
		usergroup_color             = "Usergroup Color",
		unavailable_color           = "Unavailable/Unknown Color",
		learn_more                  = "Learn more",
		player_combats              = "Player Combats",
		took_damage                 = "[took %d dmg]",
		open_pvp_event_report       = "Open PvP Event Report",
		remove                      = "Remove",
		greedy                      = "Greedy",
		greedy_tip                  = "If your search is greedy, it will attempt to match as many logs as possible. If it's not greedy, it will attempt to match as little logs as possible.",
		log_colouring               = "Log Coloring",
		done_exclamation            = "Done!",
		module_settings             = "Module Settings",
		storage_settings            = "Storage Settings",
		third_party_addons          = "Third Party Addons",
		pvp_settings                = "PvP Logging Settings",
		live_logs_settings          = "Live Logs Settings",
		logging_settings            = "Logging Settings",
		enabled_modules             = "Enabled Modules",
		permissions                 = "Permissions",
		gamemode_modules            = "Gamemode Modules",
		saved_exclamation           = "Saved!",
		save_settings               = "Save Settings",
		weapon_class                = "Weapon class",
		enter_weapon_class          = "Enter the class name of the weapon.\nDon't know it? Open your spawn menu, right click a weapon and click \"Copy to clipboard\"",
		save                        = "Save",
		add_new                     = "+ Add New",
		enabled                     = "Enabled",
		website                     = "Website",
		name                        = "Name",
		usergroups                  = "Usergroups",
		everyone                    = "Everyone",
		all_modules                 = "All modules",
		all_teams                   = "All teams",
		add_usergroup               = "Add Usergroup",
		cl_sv_tooltip               = [[cl represents the time taken for your computer to request logs, receive them, process them and display them
		
		sv represents the time taken for the server to retrieve logs from memory/the database, process them and then send them to you

		Servers using MySQL will see a higher sv value due to the latency between the MySQL server and Garry's Mod]],
		deep_storage_help           = [[Deep Storage is a bLogs feature that improves performance by storing logs from previous server sessions separately from the current session's.

		After clicking "View Deep Storage", you will only see logs from previous server sessions.
		You can view the current session's logs by clicking the button below again or reopening the menu.

		NOTE: Damage logs are not included in deep storage and are deleted on every restart to save disk space]],

		damage = "Damage",

		class_type_other = "Other",
		class_type_player = "Player",
		class_type_team = "Team",
		class_type_weapon = "Weapon",
		class_type_vehicle = "Vehicle",
		class_type_damage = "Damage Type",
		class_type_usergroup = "Usergroup",
		class_type_prop = "Prop",
		class_type_ragdoll = "Ragdoll",
		class_type_country = "Country",
		class_type_ammo = "Ammo",
		class_type_role = "Role",
		class_type_entity = "Entity",
		class_selector = "Class Selector",
		custom_class = "Custom Class",
		class_type = "Class Type",
		value = "Value",
		search = "Search",
		check_all = "Check All",
		uncheck_all = "Uncheck All",
		general = "General",
		class_search_title = "Class Search",
		class_search_text = "Enter the name or part of a name of the class that you're looking for (case insensitive)",
		view_logs = "View Logs",
		open_menu = "Open Menu",
		licensed_to = "Licensed to %s",

		pvp_event_report = "PvP Event Report",
		victim = "Victim",
		instigator = "Instigator",
		victim_tag_tip = "This is the person who the instigator started the combat against",
		instigator_tag_tip = "This is the person who started the combat",
		victim_abbr = "V",
		instigator_abbr = "I",
		time = "Time",
		linked_events = "Linked Events",

		deleted_team = "(DELETED TEAM)",

		unknown = "Unknown",
		cancel = "Cancel",

		deep_storage_advanced_search_warning = "WARNING: Advanced Search actually searches Deep Storage internally for performance reasons, which means recently created logs will not be found by Advanced Search for a short period of time.",

		--####################### SETTINGS #######################--

		Player_RecordTeam = "Show player team in logs",
		Player_RecordUsergroup = "Show player usergroup in logs",
		Player_RecordHealth = "Show player health in logs",
		Player_RecordArmor = "Show player armor in logs",
		Player_RecordWeapon = "Show player weapon in logs",
		Player_RecordWeapon_DoNotRecord = "Player weapon filter",
		Player_RecordWeapon_DoNotRecord_help = "If you want to show player weapons in the logs, use this option to filter weapons you don't want to see (such as physgun, toolgun, etc.)",

		OverrideMoneyFormat = "Override default money formatting",
		OverrideMoneyFormat_help = "When this is off, the gamemode's money formatting will be used.\nWhen this is on, you can use the option below to make your own money format.",
		MoneyFormat = "Money Format",
		MoneyFormat_help = "Enter how you want money to appear, and insert \"%s\" (without quotes) where you want the number of money to appear.",

		DeepStorageEnabled = "Deep Storage enabled",
		DeepStorageEnabled_help = "Disabling Deep Storage can significantly improve performance on servers that are not using MySQL.",

		DeepStorageCommitOnShutdown = "Commit Deep Storage on server shutdown",
		DeepStorageCommitOnShutdown_help = "If enabled, any deep storage logs that haven't been committed to the database will be committed on server shutdown/map change, but this can cause that operation to hang",

		DeepStorageCommitPeriod = "Deep storage commit period",
		DeepStorageCommitPeriod_help = "How often (in seconds) should deep storage logs be committed to the database? This setting does nothing without MySQL.",

		DeepStorageTooOld = "Max age of deep storage logs",
		DeepStorageTooOld_help = "How many days old can a log in deep storage be before it is deleted? (saves disk space)\nSet to 0 to never delete logs in deep storage.",

		LiveLogsEnabled = "Live Logs Enabled",
		LiveLogsEnabled_help = "Live logs can be a performance hit for large servers; you can disable the feature completely here.",
		LiveLogsIn10Seconds = "Max live logs in 10 seconds",
		LiveLogsIn10Seconds_help = "How many live logs can be sent before additional logs are blocked for antispam?",
		NotifyLiveLogsAntispam = "Notify antispam",
		NotifyLiveLogsAntispam_help = "Should users be notified that a live log has been discarded for antispam?",

		TimeBetweenPvPEvents = "Time between PvP events",
		TimeBetweenPvPEvents_help = "When players start combat, it creates a \"PvP event\", when no further combat has occured in a certain amount of seconds, the PvP event is treated as finished and committed to the logs. How many seconds should bLogs wait before doing this?",
		NonPvPWeapons = "PvP weapons filter",
		NonPvPWeapons_help = "What weapons shouldn't be treated as PvP weapons?",

		server_restart_required = "NOTE: Changes to these settings will apply after a server restart.",

		gamemode_modules_tip = [[bLogs supports a plethora of gamemodes.
		However, sometimes bLogs may have trouble detecting whether you are running a certain gamemode.
		In this screen, you can force bLogs to think that you are running a certain gamemode.

		Unchecked = Default behaviour
		Checked = Forced on
		Crossed = Forced off

		Please note that some gamemodes DERIVE from Sandbox, this means they use Sandbox's spawn menu, toolgun, etc.
		For gamemodes like DarkRP which derive from Sandbox, it is recommended that you leave Sandbox to its default detection.]],

		third_party_addons_tip = [[bLogs supports a plethora of third party addons.
		However, sometimes bLogs may have trouble detecting whether you have a certain third party addon installed.
		In this screen, you can force bLogs to think that you have certain third party addons installed.

		Unchecked = Default behaviour
		Checked = Forced on
		Crossed = Forced off]],

		edit_discord_webhooks = "Edit Discord Webhooks",
		webhook_name = "Webhook Name",
		webhook_name_tip = "Enter the name of your webhook.\nThis is just an identifier for the webhook, you'll enter the URL in the next screen.",
		webhook = "Webhook",
		webhook_url = "Webhook URL",
		webhook_url_tip = "Copy the URL of your Discord webhook and paste it here.",
		copy_webhook = "Copy Webhook",

		can_access_module = "Can Access Module",
		can_access_all_modules = "Can Access ALL Modules",
		all_usergroups = "All usergroups",
		all_jobs_in_category = "All jobs in category",
		all_teams_in_category = "All teams in category",
		teams = "Teams",
		permissions_tip = "Unchecked = Inherits from \"%s\"\nChecked = Allowed to use module\nCrossed = Forbidden to use module",
		all_modules_tip = "Permissions are inherited from this section unless overrided.",

		wipes_and_resets = "Wipes & Resets", -- wipes as in data wipes
		disable_buttons = "Disable Buttons",
		enable_buttons = "Enable Buttons",
		wipe_deepstorage = "Wipe Deep Storage",
		wipe_session = "Wipe Session Logs",
		wipe_all_logs = "Wipe All Logs",
		reset_config = "Reset config",

		vehicle_driver = "Driver:",
		data = "Data",
		weapons = "Weapons",
		props = "Props",
		ragdolls = "Ragdolls",
		money = "Money",
		countries = "Countries",
		ammo = "Ammo",
		roles = "Roles",
		vehicles = "Vehicles",

		flag_ongoing = "Ongoing Event",
		flag_finished = "Event Finished",
		flag_superadmin = "Involves Superadmin",
		flag_admin = "Involves Admin",
		flag_friendly_fire = "Friendly Fire",
		flag_law_enforcement = "Involves Law Enforcement",
		flag_instigator_death = "Instigator Died",
		flag_victim_death = "Victim Died",
		flag_vehicle = "Involves Vehicle(s)",
		flag_world = "Involves the Map",
		flag_props = "Involves Props",
		flag_team_switched = "Team Switch Occured",
		flag_disconnect = "Player Disconnected During Combat",
		flag_linked = "Linked to Other PvP Events",

		event_start = "Event Start",
		event_end = "Event End",

		dead_tag = "[DEAD]",

		DmgTooltip_Victim = "% of total PvP event damage VICTIM was responsible for",
		DmgTooltip_Instigator = "% of total PvP event damage INSTIGATOR was responsible for",
		DmgTooltip_Other = "% of total PvP event damage which is miscellaneous",

		--####################### LOG PHRASES #######################--
		Logs = {
			round_start     = "ROUND START",
			round_preparing = "PREPARING ROUND",
			round_end       = "ROUND ENDED",

			connected                                      = "{1} connected",
			connected_from_country                         = "{1} connected from {2}",
			finished_connecting                            = "{1} finished connecting",
			respawned                                      = "{1} respawned",
			disconnected                                   = "{1} disconnected ({2})",
			picked_up_weapon                               = "{1} picked up weapon {2}",
			picked_up_item                                 = "{1} picked up item {2}",
			prop_killed_self                               = "{1} killed themselves with their prop {2}",
			prop_killed_other                              = "{1} was killed by prop created by {2} ({3})",
			prop_killed_world                              = "{1} was killed by world prop {2}",
			prop_damaged_self                              = "{1} damaged themselves for {2} damage with their prop {3}",
			prop_damaged_other                             = "{1} was damaged by prop created by {2} for {3} damage ({4})",
			prop_damaged_world                             = "{1} was damaged by world prop {2} for {3} damage",
			toolgun_used_their_ent                         = "{1} used tool {2} on their {3}",
			toolgun_used_other_ent                         = "{1} used tool {2} on {3} created by {4}",
			toolgun_used_world_ent                         = "{1} used tool {2} on {3}",
			spawned_effect                                 = "{1} spawned effect {2}",
			spawned_npc                                    = "{1} spawned NPC {2}",
			spawned_prop                                   = "{1} spawned prop {2}",
			spawned_ragdoll                                = "{1} spawned ragdoll {2}",
			spawned_sent                                   = "{1} spawned SENT {2}",
			spawned_swep                                   = "{1} spawned SWEP {2}",
			spawned_vehicle                                = "{1} spawned vehicle {2}",
			steam_name_changed                             = "{1} changed their Steam name from {2} to {3}",
			weapon_switched                                = "{1} switched weapons from {2} to {3}",
 
			murder_loot                                    = "{1} picked up loot",
 
			cinema_video_queued                            = "[{1}] {2} queued [{3}] \"{4}\" {5}",
 
			ttt_win_traitor                                = "Traitors win!",
			ttt_win_innocent                               = "Innocent win!",
			ttt_win_timelimit                              = "Innocent win - time limit reached!",
			ttt_bought                                     = "{1} bought {2}",
			ttt_karma                                      = "{1} was KICKED for low karma",
			ttt_foundbody                                  = "{1} found the body of {2}",
			ttt_founddna                                   = "{1} found the DNA of {2} on their {3}",
			ttt_founddna_corpse                            = "{1} found the DNA of {2} on their corpse",
 
			darkrp_agenda_updated                          = "{1} updated the {2} agenda to: {3}",
			darkrp_agenda_removed                          = "{1} removed the {2}",
			darkrp_arrest                                  = "{1} arrested {2}",
			darkrp_unarrest                                = "{1} released {2}",
			darkrp_batteringram_owned_success              = "{1} battering rammed the {2} of {3}",
			darkrp_batteringram_owned_door_success         = "{1} battering rammed the door of {2}",
			darkrp_batteringram_success                    = "{1} battering rammed an unowned {2}",
			darkrp_batteringram_door_success               = "{1} battering rammed an unowned door",
			darkrp_batteringram_owned_failed               = "{1} failed to battering ram the {2} of {3}",
			darkrp_batteringram_owned_door_failed          = "{1} failed to battering ram the door of {2}",
			darkrp_batteringram_failed                     = "{1} failed to battering ram an unowned {2}",
			darkrp_batteringram_door_failed                = "{1} failed to battering ram an unowned door",
			darkrp_cheque_dropped                          = "{1} dropped a cheque of {2} for {3}",
			darkrp_cheque_picked_up                        = "{1} cashed a cheque of {2} from {3}",
			darkrp_cheque_tore_up                          = "{1} tore up a cheque of {2} meant for {3}",
			darkrp_demoted                                 = "{1} demoted {2} for {3}",
			darkrp_demoted_afk                             = "{1} was demoted for being AFK",
			darkrp_door_sold                               = "{1} sold a door",
			darkrp_door_bought                             = "{1} bought a door",
			darkrp_money_dropped                           = "{1} dropped {2}",
			darkrp_money_picked_up                         = "{1} picked up {2}",
			darkrp_money_picked_up_owned                   = "{1} picked up {2} dropped by {3}",
			darkrp_hit_accepted                            = "{1} accepted a hit on {2} requested by {3}",
			darkrp_hit_completed                           = "{1} completed a hit on {2} which was requested by {3}",
			darkrp_hit_failed                              = "{1} failed a hit on {2} because {3}",
			darkrp_hit_requested                           = "{1} requested a hit on {2} through {3} for {4}",
			darkrp_job_changed                             = "{1} changed from {2} to {3}",
			darkrp_law_added                               = "{1} added law: {2}",
			darkrp_law_removed                             = "{1} removed law: {2}",
			darkrp_purchase                                = "{1} purchased {2} for {3}",
			darkrp_purchase_ammo                           = "{1} purchased {2} ammo for {3}",
			darkrp_purchase_shipment                       = "{1} purchased a shipment of x{2} {3} for {4}",
			darkrp_purchase_food                           = "{1} purchased food {2} for {3}",
			darkrp_weapons_checked                         = "{1} checked the weapons of {2}",
			darkrp_weapons_confiscated                     = "{1} confiscated the weapons of {2}",
			darkrp_weapons_returned                        = "{1} returned the confiscated weapons of {2}",
			darkrp_filed_warant                            = "{1} filed a warrant on {2} for: {3}",
			darkrp_warrant_cancelled                       = "{1} cancelled a warrant on {2}",
			darkrp_set_wanted                              = "{1} set {2} as wanted for {3}",
			darkrp_cancelled_wanted                        = "{1} cancelled the wanted status of {2}",
			darkrp_auto_cancelled_wanted                   = "{1} lost their wanted status",
			darkrp_starved                                 = "{1} starved",
			darkrp_pocket_added                            = "{1} put {2} in their pocket",
			darkrp_pocket_dropped                          = "{1} dropped {2} from their pocket",
			darkrp_rpname_change                           = "{1} changed their RP name from {2} to {3}",
			darkrp_started_lockpick_owned_entity           = "{1} started lockpicking {2} owned by {3}",
			darkrp_started_lockpick_unowned_entity         = "{1} started lockpicking unowned {2}",
			darkrp_started_lockpick_owned_door             = "{1} started lockpicking a door owned by {2}",
			darkrp_started_lockpick_unowned_door           = "{1} started lockpicking an unowned door",
			darkrp_started_lockpick_own_entity             = "{1} started lockpicking their {2}",
			darkrp_started_lockpick_own_door               = "{1} started lockpicking one of their doors",
			darkrp_successfully_lockpicked_owned_entity    = "{1} successfully lockpicked {2} owned by {3}",
			darkrp_successfully_lockpicked_unowned_entity  = "{1} successfully lockpicked unowned {2}",
			darkrp_successfully_lockpicked_owned_door      = "{1} successfully lockpicked a door owned by {2}",
			darkrp_successfully_lockpicked_unowned_door    = "{1} successfully lockpicked an unowned door",
			darkrp_successfully_lockpicked_own_entity      = "{1} successfully lockpicked their {2}",
			darkrp_successfully_lockpicked_own_door        = "{1} successfully lockpicked one of their doors",
			darkrp_failed_lockpick_owned_entity            = "{1} failed to lockpick {2} owned by {3}",
			darkrp_failed_lockpick_unowned_entity          = "{1} failed to lockpick unowned {2}",
			darkrp_failed_lockpick_owned_door              = "{1} failed to lockpick a door owned by {2}",
			darkrp_failed_lockpick_unowned_door            = "{1} failed to lockpick an unowned door",
			darkrp_failed_lockpick_own_entity              = "{1} failed to lockpick their {2}",
			darkrp_failed_lockpick_own_door                = "{1} failed to lockpick one of their doors",
			darkrp_changed_job                             = "{1} changed job from {2} to {3}",
			darkrp_added_law                               = "{1} added law: {2}",
			darkrp_removed_law                             = "{1} removed law: {2}",
			darkrp_sold_door                               = "{1} sold a door",
			darkrp_bought_door                             = "{1} bought a door",
			darkrp_dropped_money                           = "{1} dropped {2}",
			darkrp_picked_up_money                         = "{1} picked up {2}",
			darkrp_picked_up_money_dropped_by              = "{1} picked up {2} which was dropped by {3}",
			darkrp_gave_money                              = "{1} gave {2} to {3}",
			darkrp_afk_demoted                             = "{1} was demoted for being AFK",
			darkrp_lottery_started                         = "{1} started a lottery with an entry price of {2}",
			darkrp_lottery_ended                           = "{1} won {2} from the lottery!",
			darkrp_lottery_fail                            = "The lottery failed to find a winner",
 
			pvp_instigator_killed_noweapon                 = "{1} {2} finished combat and KILLED {3} {4} after {5}", -- after X seconds/minutes/hours
			pvp_instigator_killed_weapon                   = "{1} {2} finished combat using {3} and KILLED {4} {5} after {6}",
			pvp_instigator_killed_weapons                  = "{1} {2} finished combat using multiple weapons and KILLED {3} {4} after {5}",
			pvp_victim_killed_noweapon                     = "{1} {2} finished combat and GOT KILLED BY {3} {4} after {5}",
			pvp_victim_killed_weapon                       = "{1} {2} finished combat using {3} and GOT KILLED BY {4} {5} after {6}",
			pvp_victim_killed_weapons                      = "{1} {2} finished combat using multiple weapons and GOT KILLED BY {3} {4} after {5}",
			pvp_combat_noweapon                            = "{1} {2} finished combat with {3} {4} after {5}",
			pvp_combat_weapon                              = "{1} {2} finished combat using {3} with {4} {5} after {6}",
			pvp_combat_weapons                             = "{1} {2} finished combat using multiple weapons with {3} {4} after {5}",
			pvp_log_noweapon                               = "{1} hit {2} for {3} damage",
			pvp_log_weapon                                 = "{1} hit {2} for {3} damage using a {4}",
			pvp_killed                                     = "{1} killed {2}",
			pvp_vehicle_owned_killed                       = "{1} was hit & killed by {2} with no driver but owned by {3}",
			pvp_vehicle_owned_damaged                      = "{1} was hit for {2} damage by {3} with no driver but owned by {4}",
			pvp_vehicle_killed                             = "{1} was hit & killed by {2} with no driver and owned by nobody",
			pvp_vehicle_damaged                            = "{1} was hit for {2} damage by {3} with no driver and owned by nobody",
			pvp_killed_self                                = "{1} killed themselves",
			pvp_damaged_self                               = "{1} damaged themselves for {2} damage",
 
			changed_team                                   = "{1} changed team from {2} to {3}",
			command_used                                   = "{1}: {2}",
			warned_reason                                  = "{1} was warned by {2} for {3}",
			warned_noreason                                = "{1} was warned by {2}",
			warned_kicked                                  = "{1} was KICKED for breaching the active warning threshold",
			warned_banned                                  = "{1} was BANNED for breaching the active warning threshold",
			handcuffed                                     = "{1} handcuffed {2}",
			handcuffs_broken_by                            = "{1} broke {2} out of handcuffs",
			handcuffs_broken                               = "{1} broke out of their handcuffs",
			npc_health_bought                              = "{1} bought health from an NPC for {2}",
			npc_armor_bought                               = "{1} bought armor from an NPC for {2}",
			pac_outfit                                     = "{1} switched to PAC outfit {2}",
			party_chat                                     = "{1} ({2}): {3}",
			party_created                                  = "{1} created party {2}",
			party_join                                     = "{1} joined party {2}",
			party_join_request                             = "{1} requested to join party {2}",
			party_invite                                   = "{1} invited {2} to party {3}",
			party_leave                                    = "{1} left party {2}",
			party_kick                                     = "{1} kicked {2} from party {3}",
			party_disbanded                                = "{1} disbanded party {2}",
			party_abandoned                                = "{1} left the server and abandoned their party {2}",
			spraymesh                                      = "{1} used their spray {2}",
			starwarsvehicle_damage_owned_weapon            = "{1} damaged Star Wars vehicle {2} owned by {3} for {4} damage with {5}",
			starwarsvehicle_damage_owned                   = "{1} damaged Star Wars vehicle {2} owned by {3} for {4} damage",
			starwarsvehicle_damage_weapon                  = "{1} damaged Star Wars vehicle {2} for {3} damage with {4}",
			starwarsvehicle_damage                         = "{1} damaged Star Wars vehicle {2} for {3} damage",
			wac_damage_owned_weapon                        = "{1} damaged WAC aircraft {2} owned by {3} for {4} damage with {5}",
			wac_damage_owned                               = "{1} damaged WAC aircraft {2} owned by {3} for {4} damage",
			wac_damage_weapon                              = "{1} damaged WAC aircraft {2} for {3} damage with {4}",
			wac_damage                                     = "{1} damaged WAC aircraft {2} for {3} damage",
			wyozi_cinema_queued                            = "{1} requested video {2} ➞ {3} at cinema {4}",
			wyozi_dj_queued                                = "{1} queued {2} ➞ {3} on channel {4}",
			wyozi_dj_channel_rename                        = "{1} renamed a channel to {2}",
 
			bwhitelist_whitelist_enabled_by                = "{1} enabled the whitelist for {2}",
			bwhitelist_whitelist_enabled                   = "The whitelist for {1} was enabled",
			bwhitelist_whitelist_disabled_by               = "{1} disabled the whitelist for {2}",
			bwhitelist_whitelist_disabled                  = "The whitelist for {1} was disabled",
 
			bwhitelist_blacklist_enabled_by                = "{1} enabled the blacklist for {2}",
			bwhitelist_blacklist_enabled                   = "The blacklist for {1} was enabled",
			bwhitelist_blacklist_disabled_by               = "{1} disabled the blacklist for {2}",
			bwhitelist_blacklist_disabled                  = "The blacklist for {1} was disabled",
 
			bwhitelist_added_to_whitelist_by               = "{1} was added to the whitelist for {2} by {3}",
			bwhitelist_added_to_whitelist                  = "{1} was added to the whitelist for {2}",
			bwhitelist_removed_from_whitelist_by           = "{1} was removed from the whitelist for {2} by {3}",
			bwhitelist_removed_from_whitelist              = "{1} was removed from the whitelist for {2}",
			bwhitelist_added_to_blacklist_by               = "{1} was added to the blacklist for {2} by {3}",
			bwhitelist_added_to_blacklist                  = "{1} was added to the blacklist for {2}",
			bwhitelist_removed_from_blacklist_by           = "{1} was removed from the blacklist for {2} by {3}",
			bwhitelist_removed_from_blacklist              = "{1} was removed from the blacklist for {2}",
 
			bwhitelist_added_to_whitelist_by_usergroup     = "Usergroup {1} was added to the whitelist for {2} by {3}",
			bwhitelist_added_to_whitelist_usergroup        = "Usergroup {1} was added to the whitelist for {2}",
			bwhitelist_removed_from_whitelist_by_usergroup = "Usergroup {1} was removed from the whitelist for {2} by {3}",
			bwhitelist_removed_from_whitelist_usergroup    = "Usergroup {1} was removed from the whitelist for {2}",
			bwhitelist_added_to_blacklist_by_usergroup     = "Usergroup {1} was added to the blacklist for {2} by {3}",
			bwhitelist_added_to_blacklist_usergroup        = "Usergroup {1} was added to the blacklist for {2}",
			bwhitelist_removed_from_blacklist_by_usergroup = "Usergroup {1} was removed from the blacklist for {2} by {3}",
			bwhitelist_removed_from_blacklist_usergroup    = "Usergroup {1} was removed from the blacklist for {2}",
 
			bwhitelist_added_to_whitelist_by_luafunc       = "Lua function {1} was added to the whitelist for {2} by {3}",
			bwhitelist_added_to_whitelist_luafunc          = "Lua function {1} was added to the whitelist for {2}",
			bwhitelist_removed_from_whitelist_by_luafunc   = "Lua function {1} was removed from the whitelist for {2} by {3}",
			bwhitelist_removed_from_whitelist_luafunc      = "Lua function {1} was removed from the whitelist for {2}",
			bwhitelist_added_to_blacklist_by_luafunc       = "Lua function {1} was added to the blacklist for {2} by {3}",
			bwhitelist_added_to_blacklist_luafunc          = "Lua function {1} was added to the blacklist for {2}",
			bwhitelist_removed_from_blacklist_by_luafunc   = "Lua function {1} was removed from the blacklist for {2} by {3}",
			bwhitelist_removed_from_blacklist_luafunc      = "Lua function {1} was removed from the blacklist for {2}",

			pvp_combat_begin = "{1} instigated combat against {2}",
			pvp_combat_end   = "The combat instigated by {1} against {2} has ended",

			pvp_player_damage_weapon = "{1} damaged {2} with a {3}",
			pvp_player_damage = "{1} damaged {2}",
			pvp_misc_dmg = "{1} was damaged by {2}",
			pvp_fall_damage = "{1} took fall damage",
			pvp_world_crush_damage = "{1} was crushed against the world",
			pvp_world_damage = "{1} was damaged by the world",
			pvp_prop_self_damage = "{1} damaged themself with prop {2}",
			pvp_prop_damage = "{1} was damaged by prop {2} created by {3}",
			pvp_world_prop_damage = "{1} was damaged by world prop {2}",
			pvp_dmg_self = "{1} damaged themself",
			pvp_vehicle_damage = "{1} was damaged by vehicle {2} driven by {3}",
			pvp_driverless_vehicle_damage = "{1} was damaged by vehicle {2} driven by no one",
			pvp_vehicle_damage_self = "{1} was damaged by crashing their vehicle {2}",

			pvp_player_silent_death = "{1} was silently killed",
			pvp_death_propkill_self = "{1} propkilled themself with {2}",
			pvp_death_propkill_world = "{1} was propkilled by world prop {2}",
			pvp_death_propkill = "{1} was propkilled by {2} using prop {3}",
			pvp_death_player = "{1} was killed by {2}",
			pvp_death_player_weapon = "{1} was killed by {2} with a {3}",
			pvp_death_world = "{1} was killed by the world",
			pvp_death = "{1} was killed",
			
			pvp_misc_dmg_prop = "{1} took {2} from world prop {3}",
			pvp_misc_dmg_attacker = "{1} took {2} from {3}",
			pvp_misc_dmg_other = "{1} took {2}",

			steamfam = "{1} is Steam Family sharing with {2}",
		},

		pvp_dmgtype_generic = "%u damage",
		pvp_dmgtype_burn = "%u burn damage",
		pvp_dmgtype_crush = "%u crush damage",
		pvp_dmgtype_fall = "%u fall damage",
		pvp_dmgtype_bullet = "%u bullet damage",
		pvp_dmgtype_slash = "%u slash damage",
		pvp_dmgtype_vehicle = "%u vehicle damage",
		pvp_dmgtype_blast = "%u explosion damage",
		pvp_dmgtype_club = "%u club damage",
		pvp_dmgtype_shock = "%u electric shock damage",
		pvp_dmgtype_sonic = "%u sonic damage",
		pvp_dmgtype_energybeam = "%u laser damage",
		pvp_dmgtype_drown = "%u drowning damage",
		pvp_dmgtype_nervegas = "%u neurotoxin damage",
		pvp_dmgtype_poison = "%u poison damage",
		pvp_dmgtype_radiation = "%u radiation damage",
		pvp_dmgtype_acid = "%u chemical damage",
		pvp_dmgtype_gravgun = "%u gravity gun damage",
		pvp_dmgtype_plasma = "%u plasma damage",
		pvp_dmgtype_airboat = "%u airboat gun damage",
		pvp_dmgtype_buckshot = "%u buckshot bullet damage",
		pvp_dmgtype_sniper = "%u sniper bullet damage",

} end }
--PATH addons/gmodadminsuite-logging-2.4.8/lua/gmodadminsuite/modules/logging/lang/spanish.lua:
return {
	Name = "Spanish",
	Flag = "flags16/es.png",
	Phrases = function() return {

		module_name = "Billy's Logs",

		--####################### UI PHRASES #######################--

		no_data                     = "Sin registros",
		add_to_evidence_box         = "Agregar a la Caja de Pruebas",
		livelogs_show_logs_for      = "Mostrar Logs Por",
		background_color            = "Color de Fondo",
		health_abbrieviated         = "%d HP",
		livelogs                    = "Logs en Vivo",
		exit_deep_storage           = "Salir del los Registros Profundos",
		log_formatting              = "Formato de log",
		strings                     = "Palabras Clave",
		when                        = "Cuando",
		copy_log                    = "Copiar log",
		evidence_box                = "Caja de Pruebas",
		livelogs_position_x         = "Posición X (pixeles)",
		width                       = "Anchura",
		color                       = "Color",
		help                        = "Ayuda",
		apply_filter                = "Aplicar Filtro",
		live_log_antispam           = "< live log descartado por antispam >",
		settings                    = "Ajustes",
		loading_ellipsis            = "Cargando...",
		livelogs_enabled            = "Habilitar Logs en Vivo",
		armor_abbrieviated          = "%d ARM",
		deep_storage                = "Registros Profundos",
		all_logs                    = "Todos los Logs",
		logs                        = "Logs",
		padding                     = "Relleno (pixeles)",
		livelogs_position_y         = "Posición Y (pixeles)",
		livelogs_rows_help          = "¿Cuál es la cantidad máxima de logs que se deben mostrar?",
		livelogs_rows               = "Filas (Cantidad de log)",
		livelogs_color_help         = "¿Deben mostrarse los registros en color?",
		export_to_clipboard         = "Exportar al portapapeles",
		players                     = "Jugadores",
		script_page                 = "Pagina del Script",
		wiki                        = "Wiki",
		module                      = "Módulo",
		modules                     = "Módulos",
		localization                = "Localización",
		view_deep_storage           = "Ver Registros Profundos",
		copied                      = "Copiado!",
		operator                    = "Operador",
		log                         = "Log",
		reset_to_defaults           = "Restablecer los valores predeterminados",
		livelogs_show_logs_for_help = "¿Por cuántos segundos se deben mostrar los registros?\nEstablecer en 0 para que sea para siempre.",
		advanced_search             = "Búsqueda Avanzada",
		quick_search                = "Búsqueda Rápida",
		quick_search_ellipsis       = "Búsqueda Rápida...",
		entities                    = "Entidades",
		tutorial                    = "Tutorial",
		clear_filters               = "Borrar Filtros",
		clear_filter                = "Borrar Filtro",
		manual_steamid_ellipsis     = "SteamID Manual...",
		no_results_found            = "No se han encontrado resultados",
		add_player                  = "+ Agregar Jugador",
		add_module                  = "+ Agregar Módulo",
		add_entity                  = "+ Agregar Entidad",
		add_string                  = "+ Agregar Palabra Clave",
		modules_search_tooltip      = "¿Qué módulo(s) quieres incluir? (dejar en blanco para cualquier módulo)",
		players_search_tooltip      = "¿Qué jugador(es) estás buscando? (dejar en blanco para cualquier jugador)",
		entities_search_tooltip     = "¿Qué entidad(es) estás buscando? (armas, entidades, vehículos, props, clases, etc...)",
		strings_search_tooltip      = "¿Hay algún texto específico que estás buscando?",
		class_name_ellipsis         = "Nombre de la clase...",
		add_string_popup_title      = "Agregar Palabra Clave",
		add_string_popup_text       = "Ingresa el texto que estás tratando de encontrar.",
		text_ellipsis               = "Texto...",
		click_to_focus              = "Haz click para enfocar",
		right_click_to_focus        = "Haz click derecho para enfocar",
		highlight_color             = "Color de resaltado",
		weapon_color                = "Color de arma",
		money_color                 = "Color de dinero",
		vehicle_color               = "Color vehiculo",
		entity_color                = "Color de entidad",
		health_color                = "Color de HP",
		armor_color                 = "Color de armadura",
		usergroup_color             = "Color de rango",
		unavailable_color           = "No disponible/Color Desconocido",
		learn_more                  = "Aprender más",
		player_combats              = "Combates de Jugadores",
		took_damage                 = "[recibió %d de daño]",
		open_pvp_event_report       = "Reporte de evento de PVP",
		remove                      = "Borrar",
		greedy                      = "Extenso",
		greedy_tip                  = "Si tu búsqueda es extensa, intentará hacer coincidir tantos registros como sea posible. Si no lo es, intentará hacer coincidir la menor cantidad posible de registros.",
		log_colouring               = "Colores de Logs",
		done_exclamation            = "Hecho!",
		module_settings             = "Ajustes de Módulo",
		storage_settings            = "Ajustes de Almacenamiento",
		third_party_addons          = "Addons de terceros",
		pvp_settings                = "Ajustes de registro PvP",
		live_logs_settings          = "Ajustes de Logs en Vivo",
		logging_settings            = "Ajustes de logs",
		settings                    = "Ajustes",
		enabled_modules             = "Habilitar Módulos",
		permissions                 = "Permisos",
		gamemode_modules            = "Módulos de Gamemodes",
		saved_exclamation           = "Guardado!",
		save_settings               = "Guardar Ajustes",
		weapon_class                = "Clase de Arma",
		enter_weapon_class          = "Introduce el nombre de la clase del arma.\nNo lo se? Abre tu menú de spawn, haz clic derecho en un arma y haz click \"Copiar al portapapeles\"",
		save                        = "Guardar",
		add_new                     = "+ Agregar nuevo",
		enabled                     = "Habilitado",
		website                     = "Sitio Web",
		name                        = "Nombre",
		usergroups                  = "Rangos",
		everyone                    = "Todos",
		all_modules                 = "Todos los módulos",
		all_teams                   = "Todos los Jobs",
		add_usergroup               = "Agregar Rango",
		cl_sv_tooltip               = [[cl representa el tiempo necesario para que tu ordenador solicite registros, los reciba, los procese y los muestre
		
		sv representa el tiempo necesario para que el servidor recupere los registros de la memoria/la base de datos, los procese y luego se los envíe.

		Los servidores que usan MySQL verán un valor sv más alto debido a la latencia entre el servidor MySQL y Garr's Mod]],
		deep_storage_help           = [[Registros Profundos es una función de bLogs que mejora el rendimiento al almacenar registros de sesiones anteriores del servidor por separado de las sesiones actuales.

		Después de hacer clic en "Ver Registros Profundos", solo verás los registros de las sesiones anteriores del servidor.
		Puede ver los registros de la sesión actual haciendo click nuevamente en el botón de abajo o volviendo a abrir el menú.

		NOTA:Los registros de daños no se incluyen en el almacenamiento profundo y se eliminan en cada reinicio para ahorrar espacio en el disco]],

		damage = "Daño",

		class_type_other = "Otro",
		class_type_player = "Jugador",
		class_type_team = "Team",
		class_type_weapon = "Arma",
		class_type_vehicle = "Vehiculo",
		class_type_damage = "Tipo de Daño",
		class_type_usergroup = "Rango",
		class_type_prop = "Prop",
		class_type_ragdoll = "Ragdoll",
		class_type_country = "País",
		class_type_ammo = "Munición",
		class_type_role = "Rol",
		class_type_entity = "Entidad",
		class_selector = "Selector de Clase",
		custom_class = "Clase Personalizada",
		class_type = "Tipo de Clase",
		value = "Valor",
		search = "Búscar",
		check_all = "Marcar Todo",
		uncheck_all = "Desmaecae Todo",
		general = "General",
		class_search_title = "Búsqueda de Clase",
		class_search_text = "Ingresa el nombre o parte de un nombre de la clase que estás buscando (no se distinguen mayúsculas y minúsculas)",
		view_logs = "Ver Logs",
		open_menu = "Open Menu",
		licensed_to = "Licenciado para %s",

		pvp_event_report = "Reporte de Evento PvP",
		victim = "Victima",
		instigator = "Instigador",
		victim_tag_tip = "Esta es la persona contra la que el instigador comenzó el combate.",
		instigator_tag_tip = "Esta es la persona que comenzó el combate.",
		victim_abbr = "V",
		instigator_abbr = "I",
		time = "Tiempo",
		linked_events = "Eventos Relacionados",

		deleted_team = "(TEAM BORRADO)",

		unknown = "Desconocido",
		cancel = "Cancelar",

		deep_storage_advanced_search_warning = "ADVERTENCIA: La búsqueda avanzada en realidad busca en el Registros Profundos internamente por razones de rendimiento, lo que significa que la Búsqueda avanzada no encontrará los registros creados recientemente durante un corto período de tiempo.",

		--####################### SETTINGS #######################--

		Player_RecordTeam = "Mostrar team del jugador en los logs",
		Player_RecordUsergroup = "Mostrar el rango del jugador en los logs",
		Player_RecordHealth = "Mostra vida del jugador en los logs",
		Player_RecordArmor = "Mostrar armadura del jugador en los logs",
		Player_RecordWeapon = "Mostrar arma del jugador en los logs",
		Player_RecordWeapon_DoNotRecord = "Filtro de arma del jugador",
		Player_RecordWeapon_DoNotRecord_help = "Si deseas mostrar las armas de los jugadores en los registros, usa esta opción para filtrar las armas que no quieres ver (como la physgun, la toolgun, etc.)",

		OverrideMoneyFormat = "Anular formato de dinero predeterminado",
		OverrideMoneyFormat_help = "Cuando esto está desactivado, se utilizará el formato de dinero del modo de juego.\nCuando esto está activado, puedes usar la opción a continuación para poner tu propio formato de dinero.",
		MoneyFormat = "Formato de Dinero",
		MoneyFormat_help = "Introduce cómo quieres que aparezca el dinero e inserta \"%s\" (sin las comillas)donde quieres que aparezca la cantidad de dinero.",

		DeepStorageEnabled = "Registros Profundos Habilitados",
		DeepStorageEnabled_help = "Deshabilitar el Registros Profundos puede mejorar significativamente el rendimiento en servidores que no usan MySQL.",

		DeepStorageCommitPeriod = "Registros Profundos período de compromiso",
		DeepStorageCommitPeriod_help = "¿Con qué frecuencia (en segundos) se deben confirmar los registros profundos en la base de datos?",

		DeepStorageTooOld = "Edad máxima de los registros profundos",
		DeepStorageTooOld_help = "¿Cuántos días puede estar un registro profundo antes de que se elimine? (ahorra espacio en el disco)\nEstablézcalo en 0 para no eliminar nunca los registros profundos.",

		LiveLogsEnabled = "Logs en Vivo Habilitado",
		LiveLogsEnabled_help = "Los registros en vivo pueden ser un impacto de rendimiento para servidores grandes; Puedes desactivar la función completamente aquí.",
		LiveLogsIn10Seconds = "Max registros en vivo en 10 segundos",
		LiveLogsIn10Seconds_help = "¿Cuántos registros en vivo se pueden enviar antes de que se bloqueen los registros adicionales para el antispam?",
		NotifyLiveLogsAntispam = "Notificar antispam",
		NotifyLiveLogsAntispam_help = "¿Se debe notificar a los usuarios que se ha descartado un registro activo por el antispam?",

		TimeBetweenPvPEvents = "Tiempo entre eventos PvP",
		TimeBetweenPvPEvents_help = "Cuando los jugadores comienzan el combate, se crea un \"Evento PVP\", cuando no se ha producido ningún combate adicional en una cierta cantidad de segundos, el evento PvP se trata como finalizado y comprometido con los registros. ¿Cuántos segundos deben esperar los bLogs antes de hacer esto?",
		NonPvPWeapons = "Filtro de armas PvP",
		NonPvPWeapons_help = "¿Qué armas no deben ser tratadas como armas PvP?",

		server_restart_required = "NOTA: Los cambios en estos ajustes se aplicarán después de reiniciar el servidor.",

		gamemode_modules_tip = [[bLogs soporta una gran cantidad de modos de juego.
        Sin embargo, a veces bLogs puede tener problemas para detectar si está ejecutando un determinado modo de juego.
        En esta pantalla, puedes forzar a bLogs a detectar que estás ejecutando un determinado modo de juego.

		Desmarcado = Comportamiento por defecto
		Marcado = Forzado
		Tachado = No Forzado

		Ten en cuenta que algunos modos de juego RETIVAN del Sandbox, esto significa que usan el menú de spawn del Sandbox, la toolgun, etc.
		Para los modos de juego como DarkRP que se derivan de Sandbox, se recomienda dejar Sandbox en su detección predeterminada.]],

		third_party_addons_tip = [[bLogs admite una gran cantidad de addons de terceros.
		Sin embargo, a veces, los bLogs pueden tener problemas para detectar si tienes un complemento de terceros instalado.
        En esta pantalla, puede forzar a bLogs a pensar que tiene ciertos addons de terceros instalados.

		Desmarcado = Comportamiento por defecto
		Marcado = Forzado
		Tachado = No Forzado]],

		edit_discord_webhooks = "Editar Discord Webhooks",
		webhook_name = "Nombre del webhook",
		webhook_name_tip = "Ingrese el nombre del webhook.\nEsto es solo un identificador para el webhook, ingresará la URL en la siguiente pantalla.",
		webhook = "Webhook",
		webhook_url = "Webhook URL",
		webhook_url_tip = "Copia la URL de tu webhook de Discord y pégala aquí.",
		copy_webhook = "Copiar Webhook",

		can_access_module = "Puede acceder al módulo",
		can_access_all_modules = "Puede acceder a TODOS los módulos",
		all_usergroups = "Todos los rangos",
		all_jobs_in_category = "Todos los jobs en categoría",
		all_teams_in_category = "Todos los teams en categoria",
		teams = "Teams",
		permissions_tip = "Desmarcado = Hereda de \"%s\"\nMarcado = Permitido usar módulo\nTachado = Prohibido usar módulo",
		all_modules_tip = "Los permisos se heredan de esta sección a menos que se invaliden.",

		wipes_and_resets = "Wipes & Reseteos", -- wipes as in data wipes
		disable_buttons = "Deshabilitar botones",
		enable_buttons = "Habilitar botones",
		wipe_deepstorage = "Borrar Registros Profundos",
		wipe_session = "Borrar Logs de la sesión",
		wipe_all_logs = "Borrar todos los Logs",
		reset_config = "Resetear Ajustes.",

		vehicle_driver = "Conductor:",
		data = "Data",
		weapons = "Armas",
		props = "Props",
		ragdolls = "Ragdolls",
		money = "Dinero",
		countries = "Países",
		ammo = "Munición",
		roles = "Roles",
		vehicles = "Vehiculos",

		flag_ongoing = "Evento en curso",
		flag_finished = "Evento Terminado",
		flag_superadmin = "Implica Superadmin",
		flag_admin = "Implica Staff",
		flag_friendly_fire = "Fuego amigo",
		flag_law_enforcement = "Implica cumplimiento de la ley",
		flag_instigator_death = "El instigador murió",
		flag_victim_death = "La víctima murió",
		flag_vehicle = "Implica vehículo(s)",
		flag_world = "Involucra el mapa",
		flag_props = "Involucra props",
		flag_team_switched = "Ocurrió cambio de team",
		flag_disconnect = "Jugador desconectado durante el combate",
		flag_linked = "Vinculado a otros eventos PvP",

		event_start = "Inicio de evento",
		event_end = "Final del evento",

		dead_tag = "[MUERTO]",

		DmgTooltip_Victim = "% del daño total del evento PVP fue la víctima responsable",
		DmgTooltip_Instigator = "% del daño total del evento PVP fue el instigador responsable",
		DmgTooltip_Other = "% del daño total del evento PVP fue por otra causa",

		--####################### LOG PHRASES #######################--
		Logs = {
			round_start     = "INICIO DE RONDA",
			round_preparing = "PREPARANDO RONDA",
			round_end       = "RONDA TERMINADA",

			connected                                      = "{1} conectado",
			connected_from_country                         = "{1} conectado desede {2}",
			finished_connecting                            = "{1} se terminó de conectar",
			respawned                                      = "{1} respawneo",
			disconnected                                   = "{1} desconectado ({2})",
			picked_up_weapon                               = "{1} cogió un arma {2}",
			picked_up_item                                 = "{1} cogió un item {2}",
			prop_killed_self                               = "{1} se suicidó con su prop {2}",
			prop_killed_other                              = "{1} fue asesinado por prop creado por {2} ({3})",
			prop_killed_world                              = "{1} fue asesinado por un prop del mundo {2}",
			prop_damaged_self                              = "{1} recibió un {2} de daño con su prop {3}",
			prop_damaged_other                             = "{1} fue dañado por prop creado por {2} quitandole {3} de daño ({4})",
			prop_damaged_world                             = "{1} fue dañado con un prop del mundo {2} recibió un {3} de daño",
			toolgun_used_their_ent                         = "{1} usó la tool {2} en su {3}",
			toolgun_used_other_ent                         = "{1} usó la tool {2} en {3} creado por {4}",
			toolgun_used_world_ent                         = "{1} usó la tool {2} en {3}",
			spawned_effect                                 = "{1} spawneó un efecto {2}",
			spawned_npc                                    = "{1} spawneó un NPC {2}",
			spawned_prop                                   = "{1} spawneó un prop {2}",
			spawned_ragdoll                                = "{1} spawneó un ragdoll {2}",
			spawned_sent                                   = "{1} spawneó una entidad {2}",
			spawned_swep                                   = "{1} spawneó un arma {2}",
			spawned_vehicle                                = "{1} spawneó vehiculo {2}",
			steam_name_changed                             = "{1} cambió su nombre de Steam de {2} a {3}",
			weapon_switched                                = "{1} cambió del arma {2} a {3}",
 
			murder_loot                                    = "{1} recogió loot",
 
			cinema_video_queued                            = "[{1}] {2} en cola [{3}] \"{4}\" {5}",
 
			ttt_win_traitor                                = "Ganan Traidores!",
			ttt_win_innocent                               = "Ganan Inocentes!",
			ttt_win_timelimit                              = "Ganan Inocentes - límite de tiempo alcanzado!",
			ttt_bought                                     = "{1} compró {2}",
			ttt_karma                                      = "{1} fue KICKEADO por bajo karma",
			ttt_foundbody                                  = "{1} encontró el cuerpo de {2}",
			ttt_founddna                                   = "{1} encontró el ADN de {2} en su {3}",
			ttt_founddna_corpse                            = "{1} encontró el ADN de {2} en su cadáver",
 
			darkrp_agenda_updated                          = "{1} actualizó la agenda de {2} a: {3}",
			darkrp_agenda_removed                          = "{1} borro {2}",
			darkrp_arrest                                  = "{1} arrestó {2}",
			darkrp_unarrest                                = "{1} salió {2}",
			darkrp_batteringram_owned_success              = "{1} abrió con el battering ram el {2} de {3}",
			darkrp_batteringram_owned_door_success         = "{1} abrió con el battering ram la puerta de {2}",
			darkrp_batteringram_success                    = "{1} abrió con el battering ram algo desconocido, {2}",
			darkrp_batteringram_door_success               = "{1} abrió con el battering ram una puerta desconocida",
			darkrp_batteringram_owned_failed               = "{1} falló con el battering ram en {2} de {3}",
			darkrp_batteringram_owned_door_failed          = "{1} falló con el battering ram en la puerta de {2}",
			darkrp_batteringram_failed                     = "{1} falló con el battering ram algo desconocido, {2}",
			darkrp_batteringram_door_failed                = "{1} falló con el battering ram una puerta desconocida",
			darkrp_cheque_dropped                          = "{1} solltó un cheque de {2} para {3}",
			darkrp_cheque_picked_up                        = "{1} cobró un cheque de {2} de {3}",
			darkrp_cheque_tore_up                          = "{1} rompió un cheque de {2} hecho para {3}",
			darkrp_demoted                                 = "{1} demoteado {2} por {3}",
			darkrp_demoted_afk                             = "{1} fue demoteado por estar AFK",
			darkrp_door_sold                               = "{1} vendió una puerta",
			darkrp_door_bought                             = "{1} compró una puerta",
			darkrp_money_dropped                           = "{1} soltó {2}",
			darkrp_money_picked_up                         = "{1} cogió {2}",
			darkrp_money_picked_up_owned                   = "{1} cogió {2} soltado por {3}",
			darkrp_hit_accepted                            = "{1} acepto un hit para {2} requerido por {3}",
			darkrp_hit_completed                           = "{1} completó un hit hacia {2} que fue requerido por {3}",
			darkrp_hit_failed                              = "{1} falló el hit para {2} porque {3}",
			darkrp_hit_requested                           = "{1} requirió un hit para {2} mediante {3} por {4}",
			darkrp_job_changed                             = "{1} se cambió de {2} a {3}",
			darkrp_law_added                               = "{1} ley añadida: {2}",
			darkrp_law_removed                             = "{1} ley borrada: {2}",
			darkrp_purchase                                = "{1} compró {2} por {3}",
			darkrp_purchase_ammo                           = "{1} compró munición de {2} por {3}",
			darkrp_purchase_shipment                       = "{1} compró un cargamento de x{2} {3} por {4}",
			darkrp_purchase_food                           = "{1} compró comida: {2} por {3}",
			darkrp_weapons_checked                         = "{1} chequeó las armas de {2}",
			darkrp_weapons_confiscated                     = "{1} confiscó las armas de {2}",
			darkrp_weapons_returned                        = "{1} devolvió las armas confiscadas de {2}",
			darkrp_filed_warant                            = "{1} presentó un warrant para {2} por: {3}",
			darkrp_warrant_cancelled                       = "{1} canceló el warrant de {2}",
			darkrp_set_wanted                              = "{1} pusó a {2} un wanted por {3}",
			darkrp_cancelled_wanted                        = "{1} canceló el wanted de {2}",
			darkrp_auto_cancelled_wanted                   = "{1} perdió el wanted que tenia",
			darkrp_starved                                 = "{1} murió de hambre",
			darkrp_pocket_added                            = "{1} guardó {2} en su pocket",
			darkrp_pocket_dropped                          = "{1} soltó {2} de su pocket",
			darkrp_rpname_change                           = "{1} se cambió el Nombre de RP de {2} a {3}",
			darkrp_started_lockpick_owned_entity           = "{1} empezó a usar la lockpick en {2} de {3}",
			darkrp_started_lockpick_unowned_entity         = "{1} empezó a usar la lockpick en un {2} desconocido",
			darkrp_started_lockpick_owned_door             = "{1} empezó a usar la lockpick en una puerta de {2}",
			darkrp_started_lockpick_unowned_door           = "{1} empezó a usar la lockpick en una puerta desconocida",
			darkrp_started_lockpick_own_entity             = "{1} empezó a usar la lockpick en su {2}",
			darkrp_started_lockpick_own_door               = "{1} empezó a usar la lockpick en una de sus puertas",
			darkrp_successfully_lockpicked_owned_entity    = "{1} lockpickeo con éxito un {2} de {3}",
			darkrp_successfully_lockpicked_unowned_entity  = "{1} lockpickeo con éxito un {2} desconocido",
			darkrp_successfully_lockpicked_owned_door      = "{1} lockpickeo con éxito una puerta de {2}",
			darkrp_successfully_lockpicked_unowned_door    = "{1} lockpickeo con éxito una puerta desconocida",
			darkrp_successfully_lockpicked_own_entity      = "{1} lockpickeo con éxito su {2}",
			darkrp_successfully_lockpicked_own_door        = "{1} lockpickeo con éxito una de sus puertas",
			darkrp_failed_lockpick_owned_entity            = "{1} no consiguió lockpickear el {2} de {3}",
			darkrp_failed_lockpick_unowned_entity          = "{1} no consiguió lockpickear el {2} desconocido",
			darkrp_failed_lockpick_owned_door              = "{1} no consiguió lockpickear la puerta de {2}",
			darkrp_failed_lockpick_unowned_door            = "{1} no consiguió lockpickear una puerta desconocida",
			darkrp_failed_lockpick_own_entity              = "{1} no consiguió lockpickear su {2}",
			darkrp_failed_lockpick_own_door                = "{1} no consiguió lockpickear una de sus pertas",
			darkrp_changed_job                             = "{1} se cambio de job de {2} a {3}",
			darkrp_added_law                               = "{1} añadió la ley: {2}",
			darkrp_removed_law                             = "{1} borró la ley: {2}",
			darkrp_hit_accepted                            = "{1} aceptó un hit para {2} requerido por {3}",
			darkrp_hit_completed                           = "{1} completoó un hit para {2} requerido por {3}",
			darkrp_hit_failed                              = "{1} falló en un hit para {2} requerido por {3}",
			darkrp_hit_requested                           = "{1} solicitó un hit para {2} mediante {3} por {4}",
			darkrp_sold_door                               = "{1} vendió una puerta",
			darkrp_bought_door                             = "{1} compró una puerta",
			darkrp_dropped_money                           = "{1} soltó {2}",
			darkrp_picked_up_money                         = "{1} cogió {2}",
			darkrp_picked_up_money_dropped_by              = "{1} cogió {2} que soltó {3}",
			darkrp_demoted                                 = "{1} fue demoteado de {2} por {3}",
			darkrp_afk_demoted                             = "{1} fue demoteado por estar AFK",
			darkrp_lottery_started                         = "{1} inició una loteria con el precio de: {2}",
			darkrp_lottery_ended                           = "{1} ganó {2} de la loteria!",
 
			pvp_instigator_killed_noweapon                 = "{1} {2} terminó el combate y ASESINÓ A {3} {4} después de {5}", -- after X seconds/minutes/hours
			pvp_instigator_killed_weapon                   = "{1} {2} terminó el combate usando {3} y ASESINÓ A {4} {5} después de {6}",
			pvp_instigator_killed_weapons                  = "{1} {2} terminó el combate usando multiples armas y ASESINÓ A {3} {4} después de {5}",
			pvp_victim_killed_noweapon                     = "{1} {2} terminó el combate y FUE ASESINADÓ POR {3} {4} después de {5}",
			pvp_victim_killed_weapon                       = "{1} {2} terminó el combate usando {3} y FUE ASESINADO POR {4} {5} después de {6}",
			pvp_victim_killed_weapons                      = "{1} {2} terminó el combate usando multiples armas y FUE ASESINADO POR {3} {4} después de {5}",
			pvp_combat_noweapon                            = "{1} {2} terminó el combate con {3} {4} después de {5}",
			pvp_combat_weapon                              = "{1} {2} terminó el combate usando {3} con {4} {5} después {6}",
			pvp_combat_weapons                             = "{1} {2} terminó el combate usando multiples armas con {3} {4} después {5}",
			pvp_log_noweapon                               = "{1} dañó a {2} quitandole {3} de daño",
			pvp_log_weapon                                 = "{1} dañó a {2} quitandole {3} de daño usando {4}",
			pvp_killed                                     = "{1} mató a {2}",
			pvp_vehicle_owned_killed                       = "{1} fue dañado & y asesinado por {2} sin conductor, propiedad de {3}",
			pvp_vehicle_owned_damaged                      = "{1} fue dañado quitandole {2} de daño por {3} sin conductor, propiedad de {4}",
			pvp_vehicle_killed                             = "{1} fue dañado & y asesinado por {2} sin conductor, propiedad de nadie",
			pvp_vehicle_damaged                            = "{1} fue dañado quitandole {2} de daño por {3} sin conductor, propiedad de nadie",
			pvp_killed_self                                = "{1} se suicidó",
			pvp_damaged_self                               = "{1} se dañó a si mismo quitandose {2} de daño",
 
			changed_team                                   = "{1} se cambió de team de {2} a {3}",
			command_used                                   = "{1}: {2}",
			warned_reason                                  = "{1} fue warneado por {2} por {3}",
			warned_noreason                                = "{1} fue warnedo por {2}",
			warned_kicked                                  = "{1} fue KICKEADO por alcanzar el límite de warns activos",
			warned_banned                                  = "{1} fue BANEADO por alcanzar el límite de warns activos",
			handcuffed                                     = "{1} esposó {2}",
			handcuffs_broken_by                            = "{1} rompió las esposas que le puso {2}",
			handcuffs_broken                               = "{1} rompió sus propias esposas",
			npc_health_bought                              = "{1} compro vida en un NPC por {2}",
			npc_armor_bought                               = "{1} compro armadura en un NPC por {2}",
			pac_outfit                                     = "{1} cambiado su traje de PAC {2}",
			party_chat                                     = "{1} ({2}): {3}",
			party_created                                  = "{1} creó una party {2}",
			party_join                                     = "{1} se unió a la parti {2}",
			party_join_request                             = "{1} requirió unirse a la party {2}",
			party_invite                                   = "{1} invitó a {2} a la party {3}",
			party_leave                                    = "{1} se salió de la party {2}",
			party_kick                                     = "{1} kickeo a {2} de la party {3}",
			party_disbanded                                = "{1} party borrada {2}",
			party_abandoned                                = "{1} se fue del server y se fue de la party {2}",
			spraymesh                                      = "{1} usó su spray {2}",
			starwarsvehicle_damage_owned_weapon            = "{1} dañó un vehiculo de Star Wars {2} de {3} quitandole {4} de daño con {5}",
			starwarsvehicle_damage_owned                   = "{1} dañó un vehiculo de Star Wars {2} de {3} quitandole {4} de daño",
			starwarsvehicle_damage_weapon                  = "{1} dañó un vehiculo de Star Wars {2} quitandole {3} de daño con {4}",
			starwarsvehicle_damage                         = "{1} dañó un vehiculo de Star Wars {2} quitandole {3} de daño",
			wac_damage_owned_weapon                        = "{1} dañó un vehiculo de WAC aircraft {2} de {3} quitandole {4} de daño con {5}",
			wac_damage_owned                               = "{1} dañó un vehiculo de WAC aircraft {2} de {3} quitandole {4} de daño",
			wac_damage_weapon                              = "{1} dañó un vehiculo de WAC aircraft {2} quitandole {3} de daño con {4}",
			wac_damage                                     = "{1} dañó un vehiculo de WAC aircraft {2} quitandole {3} de daño",
			wyozi_cinema_queued                            = "{1} requirió un video {2} ➞ {3} en el cine {4}",
			wyozi_dj_queued                                = "{1} en cola {2} ➞ {3} en el canal {4}",
			wyozi_dj_channel_rename                        = "{1} renombró el canal a {2}",
 
			bwhitelist_whitelist_enabled_by                = "{1} habilitó la whitelist para {2}",
			bwhitelist_whitelist_enabled                   = "La whitelist para {1} fue habilitada",
			bwhitelist_whitelist_disabled_by               = "{1} deshabilitó la whitelist de {2}",
			bwhitelist_whitelist_disabled                  = "La whitelist de {1} fue deshabilitada",
 
			bwhitelist_blacklist_enabled_by                = "{1} habilitó la blacklist para {2}",
			bwhitelist_blacklist_enabled                   = "La bakclist para {1} fue habilitada",
			bwhitelist_blacklist_disabled_by               = "{1} deshabilitó la blacklist para {2}",
			bwhitelist_blacklist_disabled                  = "La blacklist para {1} fue deshabilitada",
 
			bwhitelist_added_to_whitelist_by               = "{1} fue añadido a la whitelist de {2} por {3}",
			bwhitelist_added_to_whitelist                  = "{1} fue añadido a la whitelist de {2}",
			bwhitelist_removed_from_whitelist_by           = "{1} fue borrado de la whitelist de {2} por {3}",
			bwhitelist_removed_from_whitelist              = "{1} fue borrado de la whitelist de {2}",
			bwhitelist_added_to_blacklist_by               = "{1} fue añadido a la blacklist de {2} por {3}",
			bwhitelist_added_to_blacklist                  = "{1} fue añadido a la blacklist de {2}",
			bwhitelist_removed_from_blacklist_by           = "{1} fue borrado de la blacklist de {2} por {3}",
			bwhitelist_removed_from_blacklist              = "{1} fue borrado de la blacklist de {2}",
 
			bwhitelist_added_to_whitelist_by_usergroup     = "El rango {1} fue añadido a la whitelist de {2} por {3}",
			bwhitelist_added_to_whitelist_usergroup        = "El rango {1} fue añadido a la whitelist de {2}",
			bwhitelist_removed_from_whitelist_by_usergroup = "El rango {1} fue borrado a la whitelist de {2} por {3}",
			bwhitelist_removed_from_whitelist_usergroup    = "El rango {1} fue borrado a la whitelist de {2}",
			bwhitelist_added_to_blacklist_by_usergroup     = "El rango {1} fue añadido a la blacklist de {2} por {3}",
			bwhitelist_added_to_blacklist_usergroup        = "El rango {1} fue añadido a la blacklist de {2}",
			bwhitelist_removed_from_blacklist_by_usergroup = "El rango {1} fue borrado a la blacklist de {2} por {3}",
			bwhitelist_removed_from_blacklist_usergroup    = "El rango {1} fue borrado a la blacklist de {2}",
 
			bwhitelist_added_to_whitelist_by_luafunc       = "La función de lua {1} fue añadida a la whitelist de {2} por {3}",
			bwhitelist_added_to_whitelist_luafunc          = "La función de lua {1} fue añadida a la whitelist de {2}",
			bwhitelist_removed_from_whitelist_by_luafunc   = "La función de lua {1} fue borrada a la whitelist de {2} por {3}",
			bwhitelist_removed_from_whitelist_luafunc      = "La función de lua {1} fue borrada a la whitelist de {2}",
			bwhitelist_added_to_blacklist_by_luafunc       = "La función de lua {1} fue añadida a la blacklist de {2} por {3}",
			bwhitelist_added_to_blacklist_luafunc          = "La función de lua {1} fue añadida a la blacklist de {2}",
			bwhitelist_removed_from_blacklist_by_luafunc   = "La función de lua {1} fue borrada a la blacklist de {2} por {3}",
			bwhitelist_removed_from_blacklist_luafunc      = "La función de lua {1} fue borrada a la blacklist de {2}",

			pvp_combat_begin = "{1} combate instigado contra {2}",
			pvp_combat_end   = "El combate instigado por {1} en contra de {2} terminó",

			pvp_player_damage_weapon = "{1} dañó a {2} con {3}",
			pvp_player_damage = "{1} dañó a {2}",
			pvp_misc_dmg = "{1} fue dañado por {2}",
			pvp_fall_damage = "{1} recibió daño por caida",
			pvp_world_crush_damage = "{1} fue aplastado contra el mundo",
			pvp_world_damage = "{1} fue dañado por el mundo",
			pvp_prop_self_damage = "{1} se dañó a si mismo con el prop {2}",
			pvp_prop_damage = "{1} fue dañado con el prop {2} creado por {3}",
			pvp_world_prop_damage = "{1} fue dañado con el un prop del mundo, {2}",
			pvp_dmg_self = "{1} se daño a si mismo",
			pvp_vehicle_damage = "{1} fue dañado por el vehículo {2} conducido por {3}",
			pvp_driverless_vehicle_damage = "{1} fue dañado por el vehículo {2} sin conductor",

			pvp_player_silent_death = "{1} fue asesinado en silencio",
			pvp_death_propkill_self = "{1} se hizo propkill a si mismo con {2}",
			pvp_death_propkill_world = "{1} el mundo le hizo propkill con {2}",
			pvp_death_propkill = "{1} fue asesinado con un prop de {2} usando {3}",
			pvp_death_player = "{1} fue asesinado por {2}",
			pvp_death_player_weapon = "{1} fue asesinado por {2} con {3}",
			pvp_death_world = "{1} fue asesinado por el mundo",
			pvp_death = "{1} fue asesinado",
			
			pvp_misc_dmg_prop = "{1} recibió {2} por el prop de un mundo {3}",
			pvp_misc_dmg_attacker = "{1} recibió {2} de {3}",
			pvp_misc_dmg_other = "{1} recibió {2}",
		},

		pvp_dmgtype_generic = "%u de daño",
		pvp_dmgtype_burn = "%u de daño por fuego",
		pvp_dmgtype_crush = "%u de daño por aplastamiento",
		pvp_dmgtype_fall = "%u de daño por caida",
		pvp_dmgtype_bullet = "%u de daño por bala",
		pvp_dmgtype_slash = "%u de daño por corte",
		pvp_dmgtype_vehicle = "%u de daño por vehiculo",
		pvp_dmgtype_blast = "%u de daño por explosión",
		pvp_dmgtype_club = "%u de daño por club",
		pvp_dmgtype_shock = "%u de daño por electrocutamiento",
		pvp_dmgtype_sonic = "%u de daño por sonic",
		pvp_dmgtype_energybeam = "%u de daño por laser",
		pvp_dmgtype_drown = "%u de daño por ahogamiento",
		pvp_dmgtype_nervegas = "%u de daño por neurotoxina",
		pvp_dmgtype_poison = "%u de daño por  veneno",
		pvp_dmgtype_radiation = "%u de daño por radiación",
		pvp_dmgtype_acid = "%u de daño por químico",
		pvp_dmgtype_gravgun = "%u de daño por gravity gun",
		pvp_dmgtype_plasma = "%u de daño por plasma",
		pvp_dmgtype_airboat = "%u de daño por arma de airboat",
		pvp_dmgtype_buckshot = "%u de daño por bala de escopeta",
		pvp_dmgtype_sniper = "%u de daño por bala de Sniper",

} end }
--PATH lua/gmodadminsuite/sh_offline_player_data.lua:
AddCSLuaFile()

GAS.OfflinePlayerData = {callbacks = {}, data = {}}

if (CLIENT) then
	local function L(phrase, ...)
		if (#({...}) == 0) then
			return GAS:Phrase(phrase)
		else
			return GAS:PhraseFormat(phrase, ...)
		end
	end

	GAS:netReceive("offline_player_data", function()
		local account_id = net.ReadUInt(31)
		local nick = net.ReadString()
		local usergroup = net.ReadString()
		GAS.OfflinePlayerData.data[account_id] = {nick = nick, usergroup = usergroup}
		
		if (GAS.OfflinePlayerData.callbacks[account_id]) then
			for i,v in ipairs(GAS.OfflinePlayerData.callbacks[account_id]) do
				table.remove(GAS.OfflinePlayerData.callbacks[account_id], i)
				v(true, GAS.OfflinePlayerData.data[account_id])
			end
		end
	end)

	GAS:netReceive("offline_player_data_failed", function()
		local account_id = net.ReadUInt(31)
		GAS.OfflinePlayerData.data[account_id] = false

		if (GAS.OfflinePlayerData.callbacks[account_id]) then
			for i,v in ipairs(GAS.OfflinePlayerData.callbacks[account_id]) do
				table.remove(GAS.OfflinePlayerData.callbacks[account_id], i)
				v(false)
			end
		end
	end)

	GAS:InitPostEntity(function()
		if (system.GetCountry() and #system.GetCountry() > 0) then
			GAS:netStart("offline_player_data_country_code")
				net.WriteString(system.GetCountry())
			net.SendToServer()
		end
	end)
else
	GAS:untimer("offline_player_data_update")

	local cached_offline_data = {}

	GAS_OfflinePlayerData_CountryCodes = GAS_OfflinePlayerData_CountryCodes or {}
	function GAS.OfflinePlayerData:Update(ply)
		GAS.Database:Prepare("REPLACE INTO gas_offline_player_data (`server_id`, `account_id`, `nick`, `usergroup`, `ip_address`, `country_code`, `last_seen`) VALUES(?,?,?,?,?,?,CURRENT_TIMESTAMP())", {GAS.ServerID, ply:AccountID(), utf8.force(ply:Nick()), ply:GetUserGroup(), (ply:IPAddress():gsub(":%d+$","")), GAS_OfflinePlayerData_CountryCodes[ply] or NULL})
	end

	local function sql_init()
		GAS.Database:ServerID(function()
			local function update_data()
				GAS.Database:BeginTransaction()
				for _,ply in ipairs(player.GetHumans()) do
					local data_hash = util.CRC(ply:Nick() .. ply:GetUserGroup() .. ply:IPAddress() .. (GAS_OfflinePlayerData_CountryCodes[ply] or ""))
					if (data_hash ~= cached_offline_data[ply]) then
						cached_offline_data[ply] = data_hash
						GAS.OfflinePlayerData:Update(ply)
					end
				end
				GAS.Database:CommitTransaction()
			end
			update_data()
			GAS:timer("offline_player_data_update", 60, 0, update_data)
		end)
	end
	if (GAS.Database.MySQLDatabase) then
		GAS.Database:Query([[

			CREATE TABLE IF NOT EXISTS `gas_offline_player_data` (
				`server_id` int(11) NOT NULL,
				`account_id` int(11) UNSIGNED NOT NULL,
				`nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
				`usergroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
				`ip_address` varchar(15) CHARACTER SET ascii NOT NULL,
				`country_code` char(3) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
				`last_seen` timestamp NOT NULL,
				PRIMARY KEY (`server_id`, `account_id`)
			);

		]], function()

			GAS.Database:Query("SHOW COLUMNS FROM `gas_offline_player_data` WHERE `Field`='country_code'", function(rows)
				if (not rows or #rows == 0) then
					GAS.Database:Query("ALTER TABLE `gas_offline_player_data` ADD `country_code` CHAR(3) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL AFTER `ip_address`, ADD INDEX (`country_code`), ADD INDEX (`usergroup`), ADD INDEX (`ip_address`)", sql_init)
				else
					sql_init()
				end
			end)

		end)
	else
		GAS.Database:Query([[

			CREATE TABLE IF NOT EXISTS "gas_offline_player_data" (
				"server_id" INTEGER NOT NULL,
				"account_id" INTEGER NOT NULL,
				"nick" TEXT NOT NULL,
				"usergroup" TEXT NOT NULL,
				"ip_address" TEXT NOT NULL,
				"country_code" TEXT DEFAULT NULL,
				"last_seen" INTEGER NOT NULL,
				PRIMARY KEY ("server_id", "account_id")
			);

			CREATE INDEX IF NOT EXISTS gas_opd_usergroup_index ON gas_offline_player_data ("usergroup");
			CREATE INDEX IF NOT EXISTS gas_opd_country_code_index ON gas_offline_player_data ("country_code");
			CREATE INDEX IF NOT EXISTS gas_opd_ip_address_index ON gas_offline_player_data ("ip_address");

		]], function()

			GAS.Database:Query("PRAGMA table_info(`gas_offline_player_data`)", function(rows)
				local found = false
				for _,row in ipairs(rows) do
					if (row.name == "country_code") then
						found = true
						break
					end
				end
				if (not found) then
					GAS.Database:Query("ALTER TABLE `gas_offline_player_data` ADD COLUMN `country_code` TEXT DEFAULT NULL", sql_init)
				else
					sql_init()
				end
			end)

		end)
	end

	GAS:netInit("offline_player_data")
	GAS:netInit("offline_player_data_failed")

	GAS:netReceive("offline_player_data", function(ply)
		local account_id = net.ReadUInt(31)
		local target_ply = player.GetByAccountID(account_id)
		if (IsValid(target_ply)) then
			GAS:netStart("offline_player_data")
				net.WriteUInt(account_id, 31)
				net.WriteString(target_ply:Nick())
				net.WriteString(target_ply:GetUserGroup())
			net.Send(ply)
		else
			GAS.Database:Prepare("SELECT `nick`, `usergroup` FROM gas_offline_player_data WHERE `server_id`=? AND `account_id`=?", {GAS.ServerID, account_id}, function(rows)
				if (not rows or #rows == 0) then
					GAS:netStart("offline_player_data_failed")
						net.WriteUInt(account_id, 31)
					net.Send(ply)
				else
					GAS:netStart("offline_player_data")
						net.WriteUInt(account_id, 31)
						net.WriteString(rows[1].nick)
						net.WriteString(rows[1].usergroup)
					net.Send(ply)
				end
			end)
		end
	end)

	GAS:netInit("offline_player_data_country_code")
	GAS:netReceive("offline_player_data_country_code", function(ply)
		local country_code = net.ReadString()
		if (GAS_OfflinePlayerData_CountryCodes[ply]) then return end
		if (#country_code > 0 and #country_code <= 3) then
			GAS_OfflinePlayerData_CountryCodes[ply] = country_code
			GAS.Database:Prepare("UPDATE gas_offline_player_data SET `country_code`=? WHERE `account_id`=?", {country_code:upper(), ply:AccountID()})
		end
	end)

	GAS:hook("onPlayerChangedName", "offline_player_data:ChangeName", function(ply, _, name)
		GAS.Database:Prepare("UPDATE gas_offline_player_data SET `nick`=? WHERE `account_id`=?", {name, ply:AccountID()})
	end)
end

function GAS.OfflinePlayerData:SteamID64(steamid64, callback)
	print("deprecated", steamid64)
	debug.Trace()
	return GAS.OfflinePlayerData:AccountID(GAS:SteamID64ToAccountID(steamid64), callback)
end

function GAS.OfflinePlayerData:AccountID(account_id, callback)
	local ply = player.GetByAccountID(account_id)
	if (IsValid(ply)) then
		GAS.OfflinePlayerData.data[account_id] = {nick = ply:Nick(), usergroup = ply:GetUserGroup()}
		callback(true, GAS.OfflinePlayerData.data[account_id])
	else
		if (CLIENT) then
			if (GAS.OfflinePlayerData.data[account_id] ~= nil) then
				if (GAS.OfflinePlayerData.data[account_id] == false) then
					callback(false)
				else
					callback(true, GAS.OfflinePlayerData.data[account_id])
				end
			else
				GAS.OfflinePlayerData.callbacks[account_id] = GAS.OfflinePlayerData.callbacks[account_id] or {}
				table.insert(GAS.OfflinePlayerData.callbacks[account_id], callback)
				GAS:netStart("offline_player_data")
					net.WriteUInt(account_id, 31)
				net.SendToServer()
			end
		else
			GAS.Database:Prepare("SELECT `nick`, `usergroup` FROM gas_offline_player_data WHERE `server_id`=? AND `account_id`=?", {GAS.ServerID, account_id}, function(rows)
				if (#rows == 0) then
					callback(false)
				else
					callback(true, {nick = rows[1].nick, usergroup = rows[1].usergroup})
				end
			end)
		end
	end
end
--PATH lua/gmodadminsuite/modules/playerdatabase/_gas_info.lua:
return {
	Name = "Player Database",
	Category = GAS.MODULE_CATEGORY_PLAYER_MANAGEMENT,
	Icon = "icon16/database.png"
}
--PATH lua/gmodadminsuite/modules/playerdatabase/sh_init.lua:
if (SERVER) then
	AddCSLuaFile("gmodadminsuite/modules/playerdatabase/sh_playerdatabase.lua")
end

GAS:hook("gmodadminsuite:LoadModule:playerdatabase", "LoadModule:playerdatabase", function()
	include("gmodadminsuite/modules/playerdatabase/sh_playerdatabase.lua")
end)
--PATH addons/mc_simple_npcs/lua/mcs_npcs/cl_init.lua:
--  _______               __          _______  __                   __          _______  ______  ______        
-- |   |   |.---.-..----.|  |.-----. |     __||__|.--------..-----.|  |.-----. |    |  ||   __ \|      |.-----.
-- |       ||  _  ||  __| |_||__ --| |__     ||  ||        ||  _  ||  ||  -__| |       ||    __/|   ---||__ --|
-- |__|_|__||___._||____|    |_____| |_______||__||__|__|__||   __||__||_____| |__|____||___|   |______||_____|
--                                                          |__|                                               

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////// Warning! Edit this only if you know what are you doing ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
local NewFont = surface.CreateFont
NewFont( "MCS_Arial32", { font = "Arial", size = 32, antialias = true} )
NewFont( "MCS_Arial24", { font = "Arial", size = 24, antialias = true} )
NewFont( "MCS_Arial16", { font = "Arial", size = 16, antialias = true, shadow = true} )

//// Via MCS.PaintFunction function you can customize the dialogue box fast and easy
//// MCS.PaintFunction( Panel, Panel's wide, Panel's hight, Fade in animation effect (0-255))

function MCS.PaintFunction(self, w, h, fade)

	MCS.Blur( self, 2, 2, fade, fade-100 )
	MCS.Frame(0,0,w,h,15,Color(155,155,155, fade),Color(255,255,255, fade))

end

local blur = Material( "pp/blurscreen" )

function MCS.Blur( panel, inn, density, alpha, alpha2, w, h )
	
	if MCS.Config.EnableBlur then
		local x, y = panel:LocalToScreen(0, 0)
		
		surface.SetDrawColor( 255, 255, 255, alpha )
		surface.SetMaterial( blur )

		for i = 1, 3 do
			blur:SetFloat( "$blur", ( i / inn ) * density )
			blur:Recompute()

			render.UpdateScreenEffectTexture()
			if w and h then
			render.SetScissorRect(-x, -y, x+w, y+h, true)
				surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
			render.SetScissorRect(0, 0, 0, 0, false)
			else
				surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
			end
		end
	end
	
	draw.RoundedBox( 0, 0, 0, panel:GetWide(), panel:GetTall(), Color( 0, 0, 0, alpha2)) 
	
end

function MCS.Frame(x,y,w,h,lw,color,otcolor)

	surface.SetDrawColor(color)
	surface.DrawOutlinedRect(x,y,w,h)
	surface.SetDrawColor(otcolor)
	
	if lw then
		surface.DrawLine( x, y, x+lw, y )
		surface.DrawLine( w+x-1, y, w+x-lw-1, y )
		surface.DrawLine( x, y+h-1, x+lw, y+h-1 )
		surface.DrawLine( w+x-1, y+h-1, w+x-lw-1, y+h-1 )
		surface.DrawLine( x, y, x, y+lw )
		surface.DrawLine( w+x-1, y, w+x-1, y+lw )
		surface.DrawLine( x, y, x, y+lw )
		surface.DrawLine( w+x-1, y+h-1, w+x-1, y+h-lw-1 )
		surface.DrawLine( x, y+h-1, x, y+h-lw-1 )
	end
	
end
 
hook.Add("HUDPaint", "MCS Npc", function()
	for _, ent in pairs (ents.FindByClass("mcs_npc")) do
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
			local pos = ent:EyePos()
			local shootPos = LocalPlayer():GetShootPos()
			local hisPos = ent:GetPos()
			local tpp = hisPos:Distance(shootPos)
			local textColor = Color( 255, 255, 255, 255-tpp*2 )
			
			if MCS.Spawns[ent:GetUID()] and  MCS.Spawns[ent:GetUID()].namepos then
				pos.z = pos.z + MCS.Spawns[ent:GetUID()].namepos
			else
				pos.z = pos.z + 77
			end
			
			pos = pos:ToScreen()

			if tpp < 130 then 
				draw.SimpleTextOutlined(ent:GetNamer(), MCS.Config.AnswersFont, pos.x, pos.y, textColor, TEXT_ALIGN_CENTER, 0, 3, Color(0, 0, 0, 255-tpp*2) )
			end
		end
	end
end)

function MCSruscheck(str)
	
	local chars = {
		["й"] = true, ["ц"] = true, ["у"] = true, ["к"] = true, ["е"] = true, ["н"] = true, ["г"] = true, ["ш"] = true, ["щ"] = true, ["з"] = true, ["х"] = true, ["ъ"] = true, ["ф"] = true, ["ы"] = true,
		["в"] = true, ["а"] = true, ["п"] = true, ["р"] = true, ["о"] = true, ["л"] = true, ["д"] = true, ["ж"] = true, ["э"] = true, ["я"] = true, ["ч"] = true, ["с"] = true, ["м"] = true, ["и"] = true,
		["т"] = true, ["ь"] = true, ["б"] = true, ["ю"] = true, ["Й"] = true, ["Ц"] = true, ["У"] = true, ["К"] = true, ["Е"] = true, ["Н"] = true, ["Г"] = true, ["Ш"] = true, ["Щ"] = true, ["З"] = true, 
		["Х"] = true, ["Ъ"] = true, ["Ф"] = true, ["Ы"] = true, ["В"] = true, ["А"] = true, ["П"] = true, ["Р"] = true, ["О"] = true, ["Л"] = true, ["Д"] = true, ["Ж"] = true, ["Э"] = true, ["Я"] = true, 
		["Ч"] = true, ["С"] = true, ["М"] = true, ["И"] = true, ["Т"] = true, ["Ь"] = true, ["Б"] = true, ["Ю"] = true, ["ё"] = true, ["Ё"] = true, ["À"] = true, ["Á"] = true, ["Â"] = true, ["Æ"] = true,
		["Ç"] = true, ["È"] = true, ["É"] = true, ["Ê"] = true, ["Ë"] = true, ["Ì"] = true, ["Í"] = true, ["Î"] = true, ["Ï"] = true, ["Ñ"] = true, ["Ò"] = true, ["Ó"] = true, ["Ô"] = true, ["Œ"] = true, 
		["Ù"] = true, ["Ú"] = true, ["Û"] = true, ["Ü"] = true, ["Ý"] = true, ["Ÿ"] = true, ["à"] = true, ["á"] = true, ["â"] = true, ["æ"] = true, ["ç"] = true, ["è"] = true, ["é"] = true, ["ê"] = true,
		["ë"] = true, ["ì"] = true, ["í"] = true, ["î"] = true, ["ï"] = true, ["ñ"] = true, ["ò"] = true, ["ó"] = true, ["ô"] = true, ["œ"] = true, ["ù"] = true, ["ú"] = true, ["û"] = true, ["ü"] = true,
		["ý"] = true, ["ÿ"] = true
	}
	
	if chars[str] then
		return true
	else
		return false
	end
	
end
--PATH addons/msd_ui/lua/msd/language/de.lua:
MSD.Language["de"] = {

	-- UI

	lang_name = "Deutsch",

	ok = "OK",
	map = "Karte",
	off = "Aus",
	on = "An",
	time_add = "Zeit zum Hinzufügen",
	type = "Typ",
	delay = "Verzögerung",
	cancel = "Abbrechen",
	enable = "Aktivieren",
	model = "Model",
	name = "Name",
	settings = "Einstellungen",
	editor = "Editor",
	red = "Rot",
	green = "Grün",
	blue = "Blau",
	admin_menu = "Administrationsmenü",
	ui_settings = "UI Einstellungen",
	active = "Aktiv",
	inactive = "Inaktiv",
	disabled = "Deaktiviert",
	warning = "Warnung!",
	remove = "Entfernen",
	theme = "Theme",
	dark_theme = "Dunkles Theme",
	payment = "Zahlung",
	load_autosave = "Letzte automatische Speicherung laden?",
	load_save = "Speicherung laden",
	create_new = "Neu erstellen",
	enable_option = "Option aktivieren",
	main_opt = "Hauptoptionen",
	copy_data = "Kopiere Daten",
	save_chng = "Speichere Änderungen",
	enter_name = "Gib den Namen ein",
	enter_id = "Gib die ID ein",
	confirm_action = "Bitte bestätige deine Aktion",
	check_fpr_errors = "Auf Fehler prüfen",
	enter_description = "Gib die Beschreibung ein",
	cooldown_ok = "Abklingzeit bei Erfolg",
	cooldown_fail = "Abklingzeit bei Fehlschlag",
	s_team_whitelist = "Team-Whitelist einrichten",
	whitelist_blacklist = "Die Whitelist als Blacklist benutzen",
	custom_val = "Setze spezifischen Wert",
	set_hp_full = "Setze volle HP",
	dist_to_close = "Distanz zum nächsten",

	e_text = "Text eingeben",
	e_number = "Nummer eingeben",
	e_class = "Klasse eingeben",
	e_value = "Wert eingeben",
	e_blank_dis = "Leer lassen, um es zu deaktiveren",
	e_blank_default = "Leer lassen, um Standard zu benutzen",
	e_url = "URL eingeben",
	e_model = "Modelpfad eingeben",
	e_material = "Materialpfad eingeben",
	e_wep_class = "Waffenklasse eingeben",
	e_ent_class = "Entityklasse eingeben",
	e_veh_class = "Fahrzeugklasse eingeben",
	e_npc_class = "NPC-Klasse eingeben",


	select_ammo = "Ausgewählte Munition",
	amount_ammo = "Munitionsmenge",
	disable_phys = "Physik deaktivieren",
	none = "Nichts",
	custom_icon = "Setzte eigenes Icon",
	weapon_name = "Waffenname",
	moveup = "Aufwärts bewegen",
	movedown = "Abwärts bewegen",
	movepoint = "Punkt bewegen",
	swap = "Tauschen",
	swapmod = "Tausch-Modus aktiviert. Klicke zum Deaktivieren",
	copy_from_ent = "Kopiere vom Entity",
	set_pos_self = "Zu deiner Position setzen",
	set_pos_aim = "Zu anvisiertem Punkt setzen",
	spawn_point = "Spawnpunkt",
	spawn_ang = "Spawnwinkel",
	mark_area = "Markiere Bereich",
	time_wait = "Zeit zum Warten",
	map_marker = "Wähle Map-Makierung aus",
	in_sec = "in Sekunden",
	def_units = "Standard %s Einheiten", -- "Default 350 units" leave %s as is
	def_seconds = "Standard %s Sekunden", -- "Default 10 seconds" leave %s as is
	ent_show_pointer = "Zeiger über dem Entity anzeigen",
	ent_arcade_style = "Erscheinungsbild des Entitys im Arcade-Stil",
	ent_stnd_style = "Standard Entity Erscheinungsbild",
	custom_color = "Aktiviere eigene Farbe",
	mat_default = "Leer lassen für Standardmaterial",


	set_ui = "UI Einstellungen",
	set_hud = "HUD Einstellungen",
	set_hud_pos = "Quest HUD Position",
	set_hud_themes = "HUD Themes",
	set_server = "Server Einstellungen",
	set_ui_blur = "Unscharfer Hintergrund",
	set_ui_mono = "Einfarbiger Hintergrund",
	set_ui_vignette = "Vignetteneffekt für den Hintergrund",
	set_ui_brightness = "Helligkeit des Hintergrunds",
	set_ui_color = "Wähle die Hauptfarbe",
	set_ui_align_left = "Horizontale Ausrichtung nach links",
	set_ui_align_right = "Horizontale Ausrichtung nach rechts",
	set_ui_align_top = "Vertikale Ausrichtung nach oben",
	set_ui_align_bottom = "Vertikale Ausrichtung nach unten",
	set_ui_offset_h = "Horizontaler Versatz",
	set_ui_offset_v = "Vertikaler Versatz",


	upl_changes = "Änderungen auf den Server hochladen",
	res_changes = "Änderungen wiederherstellen",


	-- Player


	dead = "Du bist tot",
	time_ex = "Zeit abgelaufen",
	vehicle_bum = "Dein Fahrzeug wurde zerstört",
	left_area = "Du hast den Bereich verlassen",
	m_blew = "Du hast die Mission gesprengt",
	m_failed = "Mission fehlgeschlagen",
	m_success = "Mission erfolgreich",
	m_loop = "Mission aktualisieren",

	-- Errors


	inv_quest = "Ungültige Quest",
	team_bl = "Dein Team ist auf der Blacklist",
	no_players = "Der Server benötigt mehr Spieler, die gleichzeitig online sind, bevor du fortfahren kannst.",
	no_players_team = "Der Server benötigt mehr Spieler, die gleichzeitig in spezifischen Teams online sind, bevor du fortfahren kannst.",
	need_admin = "Nur Admins können diese Aktion durchführen",


	-- Quests


	active_quest = "Du hast eine aktive Quest",
	inactive_quest = "Du kannst diese Quest nicht spielen",
	quest_editor = "Quest Editor",
	quest_list = "Quest Liste",
	quests = "Quests",
	leave_pnt = "Punkt zum Verlassen",


	q_editobj = "Objekte bearbeiten",
	q_incvobj = "Ungültige Objekte",
	q_setobj = "Objekt Einstellungen",
	q_newobj = "Neues Objekt hinzufügen",
	q_editrwd = "Belohnungen bearbeiten",
	q_rwdeditor = "Belohnungs Editor",
	q_rwdlist = "Belohnungsliste",
	q_rwdsets = "Belohnungseinstellungen",
	q_findmap = "Quests aus anderen Maps suchen",
	q_obj_des = "Objekt Beschreibung",
	q_dist_point = "Distanz zum Punkt",
	q_dist_from_point = "Distanz vom Punkt",
	q_ignore_veh = "Quest Fahrzeug ignorieren",
	q_timer_show = "Dem Spieler einen Timer anzeigen",
	q_area_stay = "Der Spieler muss im Bereich bleiben",
	q_start = "Quest starten",
	q_new = "Neue Quest",
	q_submit = "Quest abschicken",
	q_addnew = "Neue Quest hinzufügen",
	q_remove = "Quest entfernen",
	q_id_unique = "Die ID muss für jede Quest einzigartig sein",
	q_complete_msg = "Nachricht für fertiggestellte Quest",
	q_dotime = "Nachricht für fertiggestellte Quest",
	q_dotime_ok = "Schließe die Quest am Ende der Zeit ab",
	q_dotime_fail = "Scheitere an der Quest am Ende der Zeit",
	q_death_fail = "Scheitere die Quest beim Tod des Spielers",
	q_loop = "Schleifenaufgaben Quest",
	q_loop_reward = "Belohne Spieler bei jeder Wiederholung",
	q_enable = "Aktiviere Quest",
	q_events = "Events",
	q_eventadd = "Event hinzufügen",
	q_eventedit = "Event bearbeiten",
	q_eventremove = "Event entfernen",
	q_in_progress = "Quest in Bearbeitung",
	q_time_left = "Verbleibende Zeit",
	q_ply_limit = "Spielerlimit für die Quest",
	q_ply_team_limit = "Teamlimit einrichten",
	q_ply_team_need = "Benötigte Spieler im Team",
	q_ply_need = "Zum Starten benötigte Anzahl der Spieler",
	q_play_limit = "Es gibt ein Limit wie viele Spieler diese Quest spielen können",
	q_must_stay_area = "Du musst in diesem Bereich bleiben, oder die Quest wird fehlgeschlagen",
	q_time_wait = "Du musst warten bevor du die Quest wiederholen kannst",
	q_dotime_reset = "Zeit für die Quest zurücksetzen",
	q_dotime_add = "Zeit zur Quest hinzufügen",
	q_noreplay = "Du kannst diese Quest nicht wiederholen",
	q_dis_replay = "Wiederholung der Quest deaktivieren",
	q_needquest = "Du musst zuerst eine andere Quest abschließen",
	q_needquest_menu = "Benötigt abgeschlossene Quest",
	q_enterror = "Quest Entities sind nicht gespawnt, überprüfe die Einrichtung der Quest",
	q_get = "Du kannst eine Quest von diesen NPCs erhalten",
	q_noquests = "Es gibt noch keine Möglichkeit Quests zu spielen :(",
	q_ent_draw = "Quest Entity Drawdistanz",
	q_loop_stop_key = "Schleifenquest Stoptaste",
	q_hold_key_stop = "Um die Quest zu stoppen, halte [%s]", -- To stop quest hold [P]
	q_enter_veh = "Steig in dein Fahrzeug ein",
	q_npc_link = "Verlinke Quest zu einem NPC",
	q_icon68 = "Gib eine URL zu einem .PNG Bild mit 68x68px ein",
	q_ent_pos_show = "Zeige dem Spieler die Positionen der Entities",
	q_area_size = "Größe des Bereichs",
	q_area_pos = "Position des Bereichs",
	q_s_area_size = "Suche Größe des Bereichs",
	q_s_area_pos = "Suche Position des Bereichs",
	q_npc_answer_ok = "Positive Antwort des Spielers",
	q_npc_answer_no = "Negative Antwort des Spielers",
	q_npc_answer_noq = "Antwort des Spielers bei keiner Quest",
	q_npc_quest_no = "NPC Sprache bei keiner Quest",
	q_money_give = "Geld zum Geben",

	-- Simple NPCs

	npc_editor = "NPC ",
	npc_new = "Neuer NPC",
	npc_select = "Wähle einen NPC",
	npc_e_speech = "Gib NPC Sprache ein",
	npc_submit = "Bestätige NPC Erstellung",
	npc_update = "Aktualisiere NPC",
	npc_remove = "Entferne NPC",
	npc_q_enable = "Aktiviere Quest NPCs",
	npc_did_open = "Dialog ID zum Öffnen",
	npc_q_target = "NPC ist ein objektives Ziel",
	npc_hostile = "Feindlicher NPC",

		-- Update 1.1.0
	cam_start = "Startparameter der Kamera",
	cam_end = "Kamera-Endparameter",
	cam_pos = "Kamera Position",
	cam_ang = "Kamera Winkel",
	cam_fov = "Kamera-Sichtfeld",
	cam_effect = "Kameraverschluss-Effekt",
	q_open_target = "Erlaubt anderen Spielern NPCs zu töten",
	q_npc_mind = "Mindest Distanz zu NPCs",
	not_spawned = "nicht gespawnt",
	dis_text = "Angezeigter Text",
	cam_speed = "Kamerabewegungsgeschwindigkeit (niedrigere Zahl - langsamere Bewegung)",
	fov_speed = "FOV-Wechselgeschwindigkeit (niedrigere Zahl - langsamere Bewegung)",
	category_des = "Questkategorie, wird verwendet, um Quests zu sortieren",
	sortquests_cat = "Quests nach Kategorie sortieren",
	search_q = "Suche nach Quests",
	quest_tools = "Quest Tools",
	set_anim = "Animation einstellen",
	s_quest_blacklist = "Quest-Blacklist einrichten",
	s_quest_blacklist_desc = "Wählen Sie Quests aus, die diese Quest blockieren, wenn Sie sie gespielt haben",
	hold_use = "Halten sie [%s] gedrückt",
	duplicate = "Duplizieren",
	unsorted = "Unsortiert",
	search = "Suche",
	duration = "Dauer",
	category = "Kategorie",
	blacklist = "Blacklist",


	--  Update 1.2.0

	restore_wep = "Stellen Sie Waffen am Questende wieder her",
	e_cmd = "Geben sie eine Konsolen Kommand ein",
	e_args = "Enter command arguments",
	hint_cmd = "Verknüpfungen zum automatischen Ausfüllen: \n$uid - UserID, \n$sid - SteamID, \n$s64 - SteamID 64, \n$n - Spielername",
	youaretracked = "Deine Positon ist nun für alle Sichtbar.",
	border_rounded = "Abgerundetes Border desgin",
	border_square = "Quadrat border design",
	access_settings = "Menüzugriff",
	compact_obj = "Kompakte Zielliste für Quests",
	e_usergroup = "Benutzergruppe eingeben",
	ug_isanadmin = "Diese Benutzergruppe hat bereits vollen Zugriff",
	find_player_id32 = "Finde Spielerdaten nach SteamID 32",
	user_data = "Benutzerdaten-Editor",
	access_editors = "Zugriff für Quest-Editoren festlegen",
	access_admins = "Vollzugriff einstellen",
	add_usergroup = "Benutzergruppe hinzufügen",
	edit_objmod = "Zielreihenfolge bearbeiten",
	editmod = "Bearbeitungsmodus",
	move = "Bewegen",
	q_errorloop = "Quest in einer Endlosschleife eingegeben",
	q_cooldow_perply = "Öffentlicher Cooldown-Timer",
	q_cooldow_publick = "Abklingzeit pro Spieler",
	q_stop_anytime = "Erlaube, die Quest manuell abzubrechen",
	quest_abandon = "Du hast die Quest abgebrochen",
	q_dotime_set = "Quest-Erledigungszeit einstellen",


	-- Ranks

	enter_path_or_url = "Geben sie einen Pfad oder eine URL ein",
	rank_edit = "Rang einstellen",
	rank_list = "Rang Liste",
	group_list = "Gruppen Liste",
	group_addnew = "Eine neue Gruppe hinzufügen",
	blank = "Leer",
	mrs_show_all = "Ränge allen Spielern anzeigen",
	mrs_show_team = "Ränge nur der Gruppe anzeigen",
	mrs_use_sn = "Kurze Rangnamen anzeigen",
	use_url = "URL verwenden",
	enter_srt_name = "Kurznamen eingeben",
	srt_name = "Kurzbezeichnung",
	mrs_prom_demote = "Die nächsten 2 Optionen betreffen nur niedrigere Ränge. Spieler mit diesem Rang können keine anderen Spieler auf höhere Ränge oder den gleichen Rang befördern.",
	mrs_whilelist = "Wenn Sie eine Ranganforderung für einen Job auswählen, kann der Spieler diesen Job nur spielen, wenn sein Rang dem gewählten Rang entspricht oder höher ist.",
	can_promote = "Kann den Spielerrang erhöhen",
	can_demote = "Kann den Spielerrang zurückstufen",
	edit_player_model = "Benutzerdefiniertes Spielermodell bearbeiten",
	enable_player_model = "Benutzerdefiniertes Spielermodell aktivieren",
	disable_player_model = "Benutzerdefiniertes Spielermodell deaktivieren",
	edit_custom_stats = "Benutzerdefinierte Spielerstatistiken bearbeiten",
	autoprom = "Automatische Beförderung zum nächsten Rang",
	in_min = "in Minuten",
	mrs_promoted = "Sie sind befördert worden",
	mrs_demoted = "Sie sind degradiert worden",
	mrs_job_smallrank = "Du musst %s oder höher sein, um als %s zu spielen", -- You must be Sergeant II or higher to play as Watch Commander
	show_group = "Ranggruppenname anzeigen",
	hide_rank = "Nur Rangsymbol anzeigen",
	mrs_hud_follow = "Drehen der Benutzeroberfläche um den Spieler je nach Blickwinkel",
	set_overhead = "Spieler-Info UI",
	offline_users = "Offline-Benutzer",
	mrs_noranks = "Ihr derzeitiger Arbeitsplatz hat keine Dienstgrade",
	mrs_nopower = "Ihr aktueller Rang hat keine zusätzlichen Berechtigungen",
	promotion = "Beförderung",
	on_duty = "Im Dienst",
	other_players = "Andere Spieler",
	mrs_change_jobname = "Jobname in den Rangnamen ändern",
	mrs_set_prefix = "Fügen Sie den Namen des Dienstgrads als Präfix zum Jobnamen hinzu.",
	copy_all_data = "Alle Daten kopieren",
	copy_only_stats = "Nur Statistiken und Spielermodell kopieren",
}


-- Other phrases
local lng = "de"


MSD.Language[lng]["Move to point"] = "Zum Punkt bewegen"
MSD.Language[lng]["Leave area"] = "Verlasse Bereich"
MSD.Language[lng]["Kill NPC"] = "Töte NPC"
MSD.Language[lng]["Collect quest ents"] = "Sammle Quest Gegenstände"
MSD.Language[lng]["Talk to NPC"] = "Spreche mit dem NPC"


MSD.Language[lng]["There is no quests avalible"] = "Es sind keine Quests verfügbar"


MSD.Language[lng]["Give weapon"] = "Gebe Waffe"
MSD.Language[lng]["Give ammo"] = "Gebe Munition"
MSD.Language[lng]["Strip Weapon"] = "Nehme Waffe weg"
MSD.Language[lng]["Spawn quest entity"] = "Spawne Quest Gegenstand"
MSD.Language[lng]["Spawn entity"] = "Spawne Gegenstand"
MSD.Language[lng]["Spawn npc"] = "Spawne NPC"
MSD.Language[lng]["Manage do time"] = "Verwalte Do-Zeit"
MSD.Language[lng]["Spawn vehicle"] = "Spawne Fahrzeug"
MSD.Language[lng]["Remove vehicle"] = "Entferne Fahrzeug"
MSD.Language[lng]["Remove all entites"] = "Entferne alle Gegenstände"
MSD.Language[lng]["Set HP"] = "Setze HP"
MSD.Language[lng]["Set Armor"] = "Setze Rüstung"


MSD.Language[lng]["DarkRP Money"] = "DarkRP Geld"


MSD.Language[lng]["Quest NPCs are disabled"] = "Quest NPCs sind deaktiviert"
MSD.Language[lng]["You can enable them in settings"] = "Du kannst sie in den Einstellungen aktivieren"
MSD.Language[lng]["Wait time"] = "Wartezeit"
--PATH addons/msd_ui/lua/msd/language/es.lua:
﻿MSD.Language["es"] = {

	-- UI

	lang_name = "Spanish",

	ok = "OK",
	map = "Mapa",
	off = "Apagado",
	on = "Encendido",
	time_add = "Tiempo para agregar",
	type = "Tipo",
	delay = "Retraso",
	cancel = "Cancelar",
	enable = "Permitir",
	model = "Modelo",
	name = "Nombre",
	settings = "Ajustes",
	editor = "Editor",
	red = "Rojo",
	green = "Verde",
	blue = "Azul",
	admin_menu = "Menú de admin",
	ui_settings = "Ajustes de interfaz",
	active = "Activo",
	inactive = "Inactivo",
	disabled = "Deshabilitado",
	warning = "Peligro",
	remove = "Eliminar",
	theme = "Tema",
	dark_theme = "Tema oscuro",
	payment = "Pago",
	load_autosave = "Cargar el ultimo autoguardado?",
	load_save = "Cargar guardado",
	create_new = "Crear nuevo",
	enable_option = "Permitir opción",
	main_opt = "Opciones principales",
	copy_data = "Copiar datos",
	save_chng = "Guardar cambios",
	enter_name = "Ingresar el nombre",
	enter_id = "Ingresar el ID",
	confirm_action = "Por favor confirma tus acciones",
	check_fpr_errors = "Chequear errores",
	enter_description = "Ingresar descripción",
	cooldown_ok = "Enfriamiento en el éxito",
	cooldown_fail = "Enfriamiento en caso de falla",
	s_team_whitelist = "Configurar la lista blanca del equipo",
	whitelist_blacklist = "La lista blanca es una lista negra",
	custom_val = "Colocar valor personalizado",
	set_hp_full = "Colocar todo el HP",
	dist_to_close = "Distancia al más cercano",

	e_text = "Ingresar texto",
	e_number = "Ingresar número",
	e_class = "Ingresar clase",
	e_value = "Ingresar valor",
	e_blank_dis = "Dejar en blanco para deshabilitar",
	e_blank_default = "Dejar en blanco para usar por defecto",
	e_url = "Ingresar URL",
	e_model = "Ingresar ruta del modelo",
	e_material = "Ingresar ruta del material",
	e_wep_class = "Ingresar ruta de la arma",
	e_ent_class = "Ingresar ruta de la entidad",
	e_veh_class = "Ingresar ruta del vehículo",
	e_npc_class = "Ingresar clase del NPC",

	select_ammo = "Munición seleccionada",
	amount_ammo = " Cantidad munición",
	disable_phys = "Deshabilitar la física",
	none = "Ninguno",
	custom_icon = "Seleccionar icono personalizado",
	weapon_name = "Nombre del arma",
	moveup = "Mover hacia arriba",
	movedown = "Mover hacia abajo",
	movepoint = "Mover punto",
	swap = "Intercambiar",
	swapmod = "Intercambiar mod habilitado. Click para deshabilitar",
	copy_from_ent = "Copiar de la entidad que mira",
	set_pos_self = "Establecer en su posición",
	set_pos_aim = "Establecer en el punto de mira",
	spawn_point = "Spawnear punto",
	spawn_ang = "Spawnear ángulo",
	mark_area = "Marcar área",
	time_wait = "Tiempo de espera",
	map_marker = "Seleccionar punto del mapa",
	in_sec = "En segundos",
	def_units = "Default %s unidades", -- "350 unidades por defecto" leave %s as is
	def_seconds = "Default %s segundos", -- "10 segundos por defecto" leave %s as is
	ent_show_pointer = "Mostrar puntero sobre la entidad",
	ent_arcade_style = "Apariencia de entidad de estilo arcade",
	ent_stnd_style = "Apariencia de la entidad estándar",
	custom_color = "Habilitar color personalizado",
	mat_default = "Dejar en blanco para material por defecto",

	set_ui = "Ajustes de la interfaz de usuario",
	set_hud = "Ajustes del HUD",
	set_hud_pos = "Posición HUD de las misiones",
	set_hud_themes = "Temas del HUD",
	set_server = "Ajustes de servidor",
	set_ui_blur = "Desenfoque del fondo",
	set_ui_mono = "Fondo monocromático",
	set_ui_vignette = "Efecto de viñeta para el fondo",
	set_ui_brightness = "Brillo de fondo",
	set_ui_color = "Seleccionar el color principal",
	set_ui_align_left = "Alineación vertical hacia la izquierda",
	set_ui_align_right = "Alineación vertical hacia la derecha",
	set_ui_align_top = "Alineación vertical hacia arriba",
	set_ui_align_bottom = "Alineación vertical hasta la parte inferior",
	set_ui_offset_h = "Compensación horizontal",
	set_ui_offset_v = "Compensación vertical",

	upl_changes = "Subir cambios al servidor",
	res_changes = "Restablecer cambios",

	-- Jugador

	dead = "Estas muerto",
	time_ex = "Tiempo expirado",
	vehicle_bum = "Tu Vehículo esta destruido",
	left_area = "Dejaste la zona",
	m_blew = "You blew up the mission",
	m_failed = "Misión fallida",
	m_success = "Misión exitosa",
	m_loop = "Actualización de la misión",

	-- Errores

	inv_quest = "Misión Invalida",
	team_bl = "Tu equipo está en lista negra",
	no_players = "El servidor necesita más jugadores conectados antes que puedas hacer esto",
	no_players_team = "El servidor necesita más jugadores conectados para equipo(s) especifico(s)antes que puedas hacer esto",
	need_admin = "Solo los administradores pueden realizar esta accion",

	-- Misiones

	active_quest = "Tienes una misión activa",
	inactive_quest = "No puedes jugar esta misión",
	quest_editor = "Editor de misiones",
	quest_list = "Lista de misiones",
	quests = "Misiones",
	leave_pnt = "Dejar punto",

	q_editobj = "Editar objetivos",
	q_incvobj = "Objetivo invalido",
	q_setobj = "Ajustes de objetivo",
	q_newobj = "Añadir nuevo objetivo",
	q_editrwd = "Editar recompensas",
	q_rwdeditor = "Editor de recompensas",
	q_rwdlist = "Lista de recompensas",
	q_rwdsets = "Ajustes de recompensas",
	q_findmap = "Encontrar misiones de otros mapas",
	q_obj_des = "Descripción de objetivo",
	q_dist_point = "Distancia al punto",
	q_dist_from_point = "Distancia desde el punto",
	q_ignore_veh = "Ignorar vehículo de misión",
	q_timer_show = "Mostrar el temporizador al jugador",
	q_area_stay = "El jugador debe quedarse en el area",
	q_start = "Empezar Misión",
	q_new = "Nueva misión",
	q_submit = "Enviar misión",
	q_addnew = "Añadir nueva misión",
	q_remove = "Eliminar misión",
	q_id_unique = "La ID debe ser única para cada misión",
	q_complete_msg = "Mensaje de misión completada",
	q_dotime = "Tiempo para hacer la misión",
	q_dotime_ok = "Misión exitosa al finalizar el tiempo",
	q_dotime_fail = "Falla la misión al finalizar el tiempo",
	q_death_fail = "Falló la misión al morir el jugador",
	q_loop = "Tareas de misiones en bucle",
	q_loop_reward = "Recompensa al jugador en cada bucle",
	q_enable = "Habilitar misión",
	q_events = "Eventos",
	q_eventadd = "Añadir Evento",
	q_eventedit = "Editor de evento",
	q_eventremove = "Eliminar evento",
	q_in_progress = "Misión en progreso",
	q_time_left = "Tiempo restante",
	q_ply_limit = "Limite de jugadores para la misión",
	q_ply_team_limit = "Configurar equipos limitados",
	q_ply_team_need = "Jugadores de equipo necesarios",
	q_ply_need = "Cantidad de jugadores necesarios para comenzar",
	q_play_limit = "Hay un límite en cuantos jugadores pueden jugar esta misión",
	q_must_stay_area = "Debes permanecer dentro de esta área, o la misión fallara",
	q_time_wait = "Debes esperar antes de repetir esta misión",
	q_dotime_reset = "Restablecer el tiempo de realización de la misión",
	q_dotime_add = "Añadir tiempo para hacer la misión",
	q_noreplay = "No puedes re jugar esta misión",
	q_dis_replay = "Des habilitar repetición de la misión",
	q_needquest = "Debes completar otra misión primero",
	q_needquest_menu = "Requiere misión completada",
	q_enterror = "Entidades de misión no spawnean, chequear configuración de misión",
	q_get = "Puedes obtener una misión de estos NPCS",
	q_noquests = "Todavía no hay forma de jugar las misiones :(",
	q_ent_draw = "Distancia del dibujo de la entidad",
	q_loop_stop_key = "Tecla para detener misión en bucle",
	q_hold_key_stop = "Para detener la misión, mantenga [%s]", -- Para detener la mision mantenga apretado [P]
	q_enter_veh = "Entrar a tu vehículo",
	q_npc_link = "Linquear misión a un NPC",
	q_icon68 = "Ingresar url a un icono .PNG de 68x68 px",
	q_ent_pos_show = "Mostrar locación de entidades al jugador",
	q_area_size = "Tamaño de área",
	q_area_pos = "Posición de área",
	q_s_area_size = "Buscar tamaño de área",
	q_s_area_pos = "Buscar posición de área",
	q_npc_answer_ok = "Respuesta positiva del jugador",
	q_npc_answer_no = "Respuesta negativa del jugador",
	q_npc_answer_noq = "Respuesta del jugador si no hay misiones",
	q_npc_quest_no = "Discurso del NPC si no hay misiones",
	q_money_give = "Dinero para dar",

	-- Simple NPCs

	npc_editor = "Editor de NPC",
	npc_new = "Nuevo NPC",
	npc_select = "Seleccionar un NPC",
	npc_e_speech = " Ingresar el discurso del NPC",
	npc_submit = "Confirmar creación del NPC",
	npc_update = "Actualizar NPC",
	npc_remove = "Eliminar NPC",
	npc_q_enable = "Habilitar misiones de NPCs",
	npc_did_open = "ID de dialogo para abrir",
	npc_q_target = "NPC is an objective target",
	npc_hostile = "NPC Hostil",

}

-- Otras frases
local es = "es"

MSD.Language[es]["Move to point"] = "Mover al punto"
MSD.Language[es]["Leave area"] = "Dejar área"
MSD.Language[es]["Kill NPC"] = "Matar NPC"
MSD.Language[es]["Collect quest ents"] = "Recoger misiones"
MSD.Language[es]["Talk to NPC"] = "Hablar al NPC"

MSD.Language[es]["No hay misiones disponibles"] = "No hay misiones disponibles"

MSD.Language[es]["Give weapon"] = "Dar arma"
MSD.Language[es]["Give ammo"] = "Dar munición"
MSD.Language[es]["Strip Weapon"] = "Extraer arma"
MSD.Language[es]["Spawn quest entity"] = "Spawnear entidad de misión"
MSD.Language[es]["Spawn entity"] = "Spawnear entidad"
MSD.Language[es]["Spawn npc"] = "Spawnear npc"
MSD.Language[es]["Manage do time"] = "Administrar el tiempo"
MSD.Language[es]["Spawn vehicle"] = "Spawnear vehículo"
MSD.Language[es]["Remove vehicle"] = "Elminar vehículo"
MSD.Language[es]["Remove all entites"] = "Remover todas las entidades"
MSD.Language[es]["Set HP"] = "Configurar HP"
MSD.Language[es]["Set Armor"] = "Configurar armadura"

MSD.Language[es]["DarkRP Money"] = " Dinero DarkRP"

MSD.Language[es]["Quest NPCs are disabled"] = "Los NPCs de las misiones están deshabilitados"
MSD.Language[es]["You can enable them in settings"] = "Puedes habilitarlos en las configuraciones"
MSD.Language[es]["Wait time"] = "Tiempo de espera"

--PATH addons/msd_ui/lua/msd/ui/assets.lua:
MSD.Icons48 = {
	cross = Material("msd/icons/cross.png", "smooth"),
	cog = Material("msd/icons/cog.png", "smooth"),
	eye = Material("msd/icons/eye.png", "smooth"),
	box = Material("mqs/map_markers/b5.png", "smooth"),
	box_open = Material("mqs/icons/box_open.png", "smooth"),
	layers = Material("msd/icons/layers.png", "smooth"),
	layers_plus = Material("msd/icons/layers-plus.png", "smooth"),
	layers_remove = Material("msd/icons/layers-remove.png", "smooth"),
	briefcase = Material("msd/icons/briefcase.png", "smooth"),
	account = Material("msd/icons/account.png", "smooth"),
	account_plus = Material("msd/icons/account-plus.png", "smooth"),
	account_edit = Material("msd/icons/account-edit.png", "smooth"),
	account_multiple = Material("msd/icons/account-multiple.png", "smooth"),
	account_convert = Material("msd/icons/account-convert.png", "smooth"),
	arrow_up = Material("msd/icons/arrow_up.png", "smooth"),
	arrow_down = Material("msd/icons/arrow_down.png", "smooth"),
	folder_open = Material("msd/icons/folder-open.png", "smooth"),
	file_document = Material("msd/icons/file-document.png", "smooth"),
	menu = Material("msd/icons/menu.png", "smooth"),
	dot = Material("msd/icons/dot.png", "smooth"),
	pencil = Material("msd/icons/pencil.png", "smooth"),
	play = Material("msd/icons/play.png", "smooth"),
	plus = Material("msd/icons/plus.png", "smooth"),
	back = Material("msd/icons/back.png", "smooth"),
	calendar_check = Material("msd/icons/calendar-check.png", "smooth"),
	playlist_edit = Material("msd/icons/playlist-edit.png", "smooth"),
	seal = Material("msd/icons/seal.png", "smooth"),
	save = Material("msd/icons/content-save.png", "smooth"),
	copy = Material("msd/icons/content-copy.png", "smooth"),
	submit = Material("msd/icons/check-decagram.png", "smooth"),
	alert = Material("msd/icons/alert-circle.png", "smooth"),
	arrow_down_color = Material("msd/icons/arrow_down_color.png", "smooth"),
	face_agent = Material("msd/icons/face-agent.png", "smooth"),
	swap = Material("msd/icons/swap.png", "smooth"),
	search = Material("mqs/map_markers/c4.png", "smooth"),
	tools = Material("mqs/map_markers/t1.png", "smooth"),
	human_female = Material("msd/icons/human-female.png", "smooth"),
	human_male = Material("msd/icons/human-male.png", "smooth"),
	human_female_dance = Material("msd/icons/human-female-dance.png", "smooth"),
	hand_peace_variant = Material("msd/icons/hand-peace-variant.png", "smooth"),
	key = Material("msd/icons/key-variant.png", "smooth"),
	key_arrow_right = Material("msd/icons/key-arrow-right.png", "smooth"),
	key_link = Material("msd/icons/key-link.png", "smooth"),
	key_plus = Material("msd/icons/key-plus.png", "smooth"),
	key_remove = Material("msd/icons/key-remove.png", "smooth"),
	key_star = Material("msd/icons/key-star.png", "smooth"),
	door = Material("msd/icons/door.png", "smooth"),
	car = Material("mqs/map_markers/v1.png", "smooth"),
	cancel = Material("msd/icons/cancel.png", "smooth"),
	reload = Material("msd/icons/reload.png", "smooth"),
	reload_alert = Material("msd/icons/reload-alert.png", "smooth"),
	heart = Material("msd/icons/cards-heart.png", "smooth"),
	heart_outline = Material("msd/icons/cards-heart-outline.png", "smooth"),
	heart_broken = Material("msd/icons/heart-broken.png", "smooth"),
	heart_flash = Material("msd/icons/heart-flash.png", "smooth"),
	skip_to = Material("msd/icons/debug-step-over.png", "smooth"),
	food = Material("msd/icons/food.png", "smooth"),
	food_off = Material("msd/icons/food-off-outline.png", "smooth"),
	food_outline = Material("msd/icons/food-outline.png", "smooth"),
	cash = Material("msd/icons/cash.png", "smooth"),
	magazine = Material("msd/icons/magazine-pistol.png", "smooth"),
	ammo = Material("mqs/icons/ammo.png", "smooth"),
	armor = Material("mqs/map_markers/a1.png", "smooth"),
	armor_outline = Material("mqs/map_markers/a2.png", "smooth"),
	armor_broken = Material("mqs/map_markers/a4.png", "smooth"),
	armor_flash = Material("mqs/map_markers/a5.png", "smooth")
}

MSD.Materials = {
	vignette = Material("msd/vignette.png", "smooth"),
	gradient = Material("gui/gradient", "smooth"),
	gradient_right = Material("msd/gradient_right.png", "smooth"),
}

MSD.PinPoints = {
	[0] = Material("mqs/icons/pin.png", "smooth"),
}

local files = file.Find("materials/mqs/map_markers/*", "GAME")

for k, v in pairs(files) do
	MSD.PinPoints[k] = Material("mqs/map_markers/" .. v, "smooth")
end

MSD.ColorPresets = {Color(255, 20, 20), Color(255, 115, 0), Color(210, 255, 0), Color(0, 170, 25), Color(0, 155, 255), Color(0, 100, 200), Color(135, 0, 255), Color(255, 0, 100),}

MSD.Theme = {
	["d_na"] = Color(25, 25, 26),
	["d"] = Color(0, 5, 10, 165),
	["m"] = Color(0, 5, 10, 120),
	["l"] = Color(0, 5, 10, 85),
}

MSD.Text = {
	["a"] = Color(150, 150, 150, 200),
	["n"] = Color(150, 150, 150),
	["d"] = Color(220, 220, 220),
	["s"] = Color(235, 235, 235),
	["m"] = Color(245, 245, 245),
	["l"] = Color(255, 255, 255),
}

local NewFont = surface.CreateFont

for i = 0, 40 do
	NewFont("MSDFont." .. 12 + i, {
		font = "AdihausDIN",
		extended = true,
		size = 12 + i,
		weight = 500
	})
end

for i = 0, 20 do
	NewFont("MSDFontB." .. 16 + i, {
		font = "AdihausDIN",
		extended = true,
		size = 16 + i,
		weight = 800
	})
end

NewFont("MSDFont.Big", {
	font = "AdihausDIN",
	extended = true,
	size = 45,
	weight = 500
})

NewFont("MSDFont.Biger", {
	font = "AdihausDIN",
	extended = true,
	size = 55,
	weight = 500
})

function MSD.DrawBG(panel, w, h)
	if MSD.Config.Blur then
		MSD.Blur(panel, 1, 3, 255, 250 - MSD.Config.BgrColor.r, w, h)
	else
		draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.Config.BgrColor)
	end
end

function MSD.DrawTexturedOutlined(x, y, w, h, mat, color, outlinewidth, ocolor)
	if isstring(mat) then
		mat = Material(mat)
	end

	surface.SetMaterial(mat)
	surface.SetDrawColor(ocolor)
	local steps = ( outlinewidth * 2 ) / 3
	if ( steps < 1 ) then steps = 1 end

	for _x = -outlinewidth, outlinewidth, steps do
		for _y = -outlinewidth, outlinewidth, steps do
			surface.DrawTexturedRect(x + _x, y + _y, w, h)
		end
	end

	surface.SetDrawColor(color)
	surface.DrawTexturedRect(x, y, w, h)
end

local cached_mat = {}

function MSD.DrawTexturedRect(x, y, w, h, mat, color)
	if isstring(mat) then
		local crc = util.CRC(mat)
		if not cached_mat[crc] then
			cached_mat[crc] = Material(mat, "smooth")
		end
		mat = cached_mat[crc]
	end

	surface.SetDrawColor(color)
	surface.SetMaterial(mat)
	surface.DrawTexturedRect(x, y, w, h)
end

function MSD.DrawTexturedRectRotated(rot, x, y, w, h, mat, color)
	if isstring(mat) then
		local crc = util.CRC(mat)
		if not cached_mat[crc] then
			cached_mat[crc] = Material(mat, "smooth")
		end
		mat = cached_mat[crc]
	end

	surface.SetDrawColor(color)
	surface.SetMaterial(mat)
	surface.DrawTexturedRectRotated(x, y, w, h, rot)
end

function MSD.ColorAlpha(cl, al)
	local new_cl = table.Copy(cl)
	new_cl.a = al
	return new_cl
end

local blur = Material("pp/blurscreen")

function MSD.Blur(panel, inn, density, alpha, back_alpha, w, h)
	local x, y = panel:LocalToScreen(0, 0)
	surface.SetDrawColor(255, 255, 255, alpha)
	surface.SetMaterial(blur)

	for i = 1, 3 do
		blur:SetFloat("$blur", (i / inn) * density)
		blur:Recompute()
		render.UpdateScreenEffectTexture()

		if w and h then
			render.SetScissorRect(-x, -y, x + w, y + h, true)
			surface.DrawTexturedRect(-x, -y, ScrW(), ScrH())
			render.SetScissorRect(0, 0, 0, 0, false)
		else
			surface.DrawTexturedRect(-x, -y, ScrW(), ScrH())
		end
	end

	if back_alpha and back_alpha > 0 then
		draw.RoundedBox(MSD.Config.Rounded, 0, 0, w, h, MSD.ColorAlpha(color_black, back_alpha))
	end
end

-- subUTF8 functions
local function SubStringGetByteCount(str, index)
	local curByte = string.byte(str, index)
	local byteCount = 1

	if curByte == nil then
		byteCount = 0
	elseif curByte > 0 and curByte <= 127 then
		byteCount = 1
	elseif curByte >= 192 and curByte <= 223 then
		byteCount = 2
	elseif curByte >= 224 and curByte <= 239 then
		byteCount = 3
	elseif curByte >= 240 and curByte <= 247 then
		byteCount = 4
	end

	return byteCount
end

local function SubStringGetTotalIndex(str)
	local curIndex = 0
	local i = 1
	local lastCount = 1
	repeat
		lastCount = SubStringGetByteCount(str, i)
		i = i + lastCount
		curIndex = curIndex + 1
	until (lastCount == 0)

	return curIndex - 1
end

local function SubStringGetTrueIndex(str, index)
	local curIndex = 0
	local i = 1
	local lastCount = 1
	repeat
		lastCount = SubStringGetByteCount(str, i)
		i = i + lastCount
		curIndex = curIndex + 1
	until (curIndex >= index)

	return i - lastCount
end

function string.subUTF8(str, startIndex, endIndex)
	if startIndex < 0 then
		startIndex = SubStringGetTotalIndex(str) + startIndex + 1
	end

	if endIndex ~= nil and endIndex < 0 then
		endIndex = SubStringGetTotalIndex(str) + endIndex + 1
	end

	if endIndex == nil then
		return string.sub(str, SubStringGetTrueIndex(str, startIndex))
	else
		return string.sub(str, SubStringGetTrueIndex(str, startIndex), SubStringGetTrueIndex(str, endIndex + 1) - 1)
	end
end

-- Same used in DarkRP, used it here so we can use it with any gamemodes
local function CharWrap(t, w)
	local a = 0

	t = t:gsub(".", function(c)
		a = a + surface.GetTextSize(c)

		if a >= w then
			a = 0

			return "\n" .. c
		end

		return c
	end)

	return t, a
end

function MSD.TextWrap(text, font, w)
	local total = 0
	surface.SetFont(font)
	local spaceSize = surface.GetTextSize(' ')

	text = text:gsub("(%s?[%S]+)", function(word)
		local char = string.subUTF8(word, 1, 1)

		if char == "\n" or char == "\t" then
			total = 0
		end

		local wordlen = surface.GetTextSize(word)
		total = total + wordlen

		if wordlen >= w then
			local splitWord, splitPoint = CharWrap(word, w - (total - wordlen))
			total = splitPoint

			return splitWord
		elseif total < w then
			return word
		end

		if char == ' ' then
			total = wordlen - spaceSize

			return '\n' .. string.subUTF8(word, 2)
		end

		total = wordlen

		return '\n' .. word
	end)

	local w_end, h_end =  surface.GetTextSize(text)

	return text, w_end, h_end
end

-- Image Lib
MSD.ImgLib = {}
MSD.ImgLib.Images = {}
MSD.ImgLib.PreCacheStarted = {}
MSD.ImgLib.Avatars = {}
MSD.ImgLib.NoMaterial = Material("msd/icons/file-hidden.png", "smooth noclamp")

function MSD.ImgLib.GetMaterial(url, jpg)
	if url == "" then
		return MSD.ImgLib.NoMaterial
	end

	local crc = util.CRC(url) .. ".png"

	if jpg then
		crc = util.CRC(url) .. ".jpg"
	end

	if MSD.ImgLib.Images[crc] then return MSD.ImgLib.Images[crc] end

	if (file.Exists("msd_imgs/" .. crc, "DATA")) then
		MSD.ImgLib.Images[crc] = Material("data/msd_imgs/" .. crc, "smooth noclamp")

		return MSD.ImgLib.Images[crc]
	else
		return MSD.ImgLib.PreCacheMaterial(url, crc, jpg)
	end
end

function MSD.ImgLib.PreCacheMaterial(url, crc, jpg)
	if not crc then
		crc = util.CRC(url) .. ".png"
	end

	if not file.Exists("msd_imgs", "DATA") then
		file.CreateDir("msd_imgs")
	end

	if not MSD.ImgLib.PreCacheStarted[crc] then
		MSD.ImgLib.PreCacheStarted[crc] = true

		http.Fetch(url, function(body, size, headers, code)
			if not jpg and (body:find("^.PNG")) then
				file.Write("msd_imgs/" .. crc, body)
				MSD.ImgLib.Images[crc] = Material("data/msd_imgs/" .. crc, "smooth noclamp")

				return MSD.ImgLib.Images[crc]
			elseif jpg then
				file.Write("msd_imgs/" .. crc, body)
				MSD.ImgLib.Images[crc] = Material("data/msd_imgs/" .. crc, "smooth noclamp")
			else
				print("Image is not a PNG, url - " .. url)
			end
		end, function()
			print("Failed to get image, url - " .. url)
		end)
	end

	return MSD.ImgLib.NoMaterial
end

function MSD.ImgLib.GetAvatar(crc)
	crc = tostring(crc)
	if not MSD.ImgLib.Avatars[crc] then
		MSD.ImgLib.Avatars[crc] = ""

		http.Fetch("https://macnco.one/steamid/avatar.php?input=" .. crc, function(body, size, headers, code)
			MSD.ImgLib.Avatars[crc] = body
		end, function()
			print("Failed to get link, url - " .. url)
		end)
	end

	return MSD.ImgLib.Avatars[crc] or ""
end
--PATH addons/sl_whitelist/lua/autorun/nordahl_cl/nordahl_whitelistjob_cl.lua:
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

local cfg=nordahl_cfg_1402

local Nordah_Whitelist_Job = Nordah_Whitelist_Job or {}
local Add_Job_In_the_Whiteliste = {}
local Add_JobGroup_In_the_Whiteliste = {}
local ZJOBwhitelist={}

local ztvo=0.02 --More this number is big more the download of data is slow. antivorflow system. Default value is 0.01 (0 = zero second of delay Too much information is sent your crash server if you have a big list)
local wjl=" "..cfg.Ver
local puce="*"
local nord_s_skin="0"
local Nordah_Whitelist_Job_Menu=nil

local function eRight(a)
return cfg.StaffSteamID64[a:SteamID64()] or cfg.Usergroups_Access[a:GetUserGroup()] or cfg.JOB_Access_rank[team.GetName( a:Team() )] or (cfg.Allow_Admin==1 and a:IsAdmin()) or (cfg.Allow_SUPER_Admin==1 and a:IsSuperAdmin())
end

local files=file.Read("nordahlclient_option/language.txt","DATA")
if (!files) then
file.CreateDir("nordahlclient_option")
file.Write("nordahlclient_option/language.txt","2")
Z_Defaut_Languages=2
else
Z_Defaut_Languages=files+0
end
local files=file.Read("nordahlclient_option/nord_s_skin.txt","DATA")
if (!files) then
file.Write("nordahlclient_option/nord_s_skin.txt","0")
nord_s_skin="0"
else
nord_s_skin=files
end

local tra_nom="Nom"
local zadmin3="Rang"
local zmobutan="Clic droit sur le joueur"
local tra_ajt="Ajouter"
local ajouterallj="Ajouter à tous les jobs"
local zaddlisti="Joueurs"
local WhitelistJobSystem="Système de Job Whitelist"
local CategoryJobSystem="Category Whitelist"
local zaddsuppr="Supprimer"
local zaddsupprall="Supprimer de tous les jobs"
local tra_scrp_nordahl_script="Credit"
local tra_scrp_nordahl_credit="Fait par Nordahl"
local tra_scrp_nordahl_note="Aide moi en me donnant votre avis"
local tra_scrprecherche="Rechercher"
local tra_scrprecherched="Retrouver en une seule liste toutes les entrées avec un Steam_ID"
local tra_wlistde="Whitelist de: "
local tra_init="Initialisation"
local tra_receptd="Reception des données"
local tra_susermax="Nombre d'utilisateurs"
local tra_legd="anti-surcharge(Optimisation)"
local tra_metieactuel="Métier actuel"
local tra_publique="Publique"
local tra_acceswhitelist="Accessible seulement sur Whitelist"
local tra_groupferme="Métier fermé pour tout le monde"
local tra_accesvip="Accessible seulement aux Donateurs"
local tra_reinitialiser="Réinitialiser"
local tra_ajdalwdumetier="Ajouter dans la Whitelist du métier"
local tra_ajdalbdumetier="Ajouter dans la Blacklist du métier"
local tra_date="Date"
local tra_ajpar="Ajouté par"
local tra_metier="Métier"
local tra_gestiondesmetier="Gestion des métiers"
local tra_gestiondesmetitreel="Gestion de l'accès des métiers en temps réel"
local tra_listedesjoueurs="La liste des joueurs présents sur le serveur"
local tra_accessi="Accessibilité"
local tra_info_leak="Vous etiez pas admin lorsque vous avez rejoint le serveur. Il vous manque des informations. Veuillez vous reconnecter. Merci."
local tra_regl_stat_job="Regler le Status du Job"
local tra_recherch_job="You need to find a job first."

function languejobwifr(z)
Z_Defaut_Languages=1
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="Nom"
zadmin3="Rang"
zmobutan="Clic droit sur le joueur"
tra_ajt="Ajouter"
ajouterallj="Ajouter à tous les jobs"
zaddlisti="Joueurs"
WhitelistJobSystem="Système de Job Whitelist"
zaddsuppr="Supprimer"
zaddsupprall="Supprimer de tous les jobs"
tra_scrp_nordahl_script="Credit"
tra_scrp_nordahl_credit="Fait par Nordahl"
tra_scrp_nordahl_note="Aide moi en me donnant votre avis"
tra_scrprecherche="Rechercher"
tra_scrprecherched="Retrouver en une seule liste toutes les entrées avec un Steam_ID"
tra_wlistde="Whitelist de: "
tra_init="Initialisation"
tra_receptd="Reception des données"
tra_susermax="Nombre d'utilisateurs"
tra_legd="anti-surcharge(Optimisation)"
tra_metieactuel="Métier actuel"
tra_publique="Publique"
tra_acceswhitelist="Accessible seulement sur Whitelist"
tra_groupferme="Métier fermé pour tout le monde"
tra_accesvip="Accessible seulement aux Donateurs"
tra_reinitialiser="Réinitialiser"
tra_ajdalwdumetier="Ajouter dans la Whitelist du métier"
tra_ajdalbdumetier="Ajouter dans la Blacklist du métier"
tra_date="Date"
tra_ajpar="Ajouté par"
tra_metier="Métier"
tra_gestiondesmetier="Gestion des métiers"
tra_gestiondesmetitreel="Gestion de l'accès des métiers en temps réel"
tra_listedesjoueurs="La liste des joueurs présents sur le serveur"
tra_accessi="Accessibilité"
tra_info_leak="Vous etiez pas admin lorsque vous avez rejoint le serveur. Il vous manque des informations. Veuillez vous reconnecter. Merci."
tra_regl_stat_job="Regler le Status du Job"
tra_recherch_job="Vous devez un métier en premier"
end
function languejobwien(z)
Z_Defaut_Languages=2
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="Name"
zadmin3="Rank"
zmobutan="Right Click on the player"
tra_ajt="Add"
ajouterallj="Add in all jobs"
zaddlisti="Players"
WhitelistJobSystem="Whitelist Job System"
zaddsuppr="Delete"
zaddsupprall="Delete from all jobs"
tra_scrp_nordahl_script="Credits"
tra_scrp_nordahl_credit="Made by Nordahl"
tra_scrp_nordahl_note="Help me by giving me your opinion on this script"
tra_scrprecherche="Search"
tra_scrprecherched="With a Steam_ID, find all the entries in a simple list"
tra_wlistde="Whitelist on : "
tra_init="Initialisation"
tra_receptd="Data receipt"
tra_susermax="Number of users"
tra_legd="Anti-Overload (Optimisation)"
tra_metieactuel="Actual Job"
tra_publique="Public"
tra_acceswhitelist="Accessible only with the Whitelist"
tra_groupferme="Job closed for everyone"
tra_accesvip="Accessible only to the donators"
tra_reinitialiser="Reset"
tra_ajdalwdumetier="Add in the Job's Whitelist"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date="Date"
tra_ajpar="Added by"
tra_metier="Job"
tra_gestiondesmetier="Jobs management"
tra_gestiondesmetitreel="Real time job access management"
tra_listedesjoueurs="List of players in the server"
tra_accessi="Accessibility"
tra_info_leak="You did not admin when you joined the server. You are missing information. Please reconnect. Thank you."
tra_regl_stat_job="Set the jobs' status"
tra_recherch_job="You need to find a job first."
end
function languejobwidu(z)
Z_Defaut_Languages=4
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Name"
zadmin3 = "Rank"
zmobutan = "Rechts auf dem Player Klicken Sie auf"
tra_ajt= "Hinzufügen"
ajouterallj = "in allen Jobs hinzufügen"
zaddlisti = "Spieler"
WhitelistJobSystem = "Weiße Liste Job-System"
zaddsuppr = "Löschen"
zaddsupprall = "von allen Jobs löschen"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Hilf mir, von mir auf diesem Skript Sie Ihre Meinung sagen"
tra_scrprecherche = "Suchen"
tra_scrprecherched = "Mit einem STEAM_ID, alle Einträge in einer einfachen Liste finden"
tra_wlistde = "Weiße Liste auf:"
tra_init = "Initialisierung"
tra_receptd = "Datenempfang"
tra_susermax = "Anzahl Benutzer"
tra_legd = "Anti-Überlast (Optimierung)"
tra_metieactuel = "Aktueller Job"
tra_publique = "Public"
tra_acceswhitelist = "Erreichbar nur mit der Whitelist"
tra_groupferme = "Job für alle geschlossen"
tra_accesvip = "Erreichbar nur zu den Donatoren"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Fügen Sie in der Hiobs Weiße Liste"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Datum"
tra_ajpar = "hinzugefügt"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs Management"
tra_gestiondesmetitreel = "Echtzeit-Job Access Management"
tra_listedesjoueurs = "Liste der Spieler auf dem Server"
tra_accessi = "Barrierefreiheit"
tra_info_leak = "Sie haben nicht Admin, wenn Sie den Server verbunden. Sie fehlen Informationen. Bitte wieder an. Danke."
tra_regl_stat_job = "den Status der Jobs Set"
end
function languejobwiru(z)
Z_Defaut_Languages=5
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="имя"
zadmin3="Ранг"
zmobutan="щелкните правой кнопкой мыши на игрока"
tra_ajt="Добавить"
ajouterallj="Все вакансии"
zaddlisti="игроки"
WhitelistJobSystem="Система Белый Список Заданий"
zaddsuppr="удалить"
zaddsupprall="удалить со всех рабочих мест"
tra_scrp_nordahl_script="кредиты"
tra_scrp_nordahl_credit="выступил Нордал"
tra_scrp_nordahl_note="помогите мне, давая мне свое мнение на этот сценарий"
tra_scrprecherche="поиск"
tra_scrprecherched="с Steam_ID, найти все записи в виде простого списка"
tra_wlistde="белый список на : "
tra_init="инициализация"
tra_receptd="получение данных"
tra_susermax="количество пользователей"
tra_legd="Анти-перегрузки (Оптимизация)"
tra_metieactuel="настоящая работа"
tra_publique="общественные"
tra_acceswhitelist="доступно только с белого списка"
tra_groupferme="задание закрыто для всех"
tra_accesvip="доступна только для донаторов"
tra_reinitialiser="сброс"
tra_ajdalwdumetier="Добавить в задания белого списка"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date="Дата"
tra_ajpar="Добавлено"
tra_metier="работа"
tra_gestiondesmetier="вакансии"
tra_gestiondesmetitreel="режиме реального времени доступ к Job управление"
tra_listedesjoueurs="список игроков на сервере"
tra_accessi="доступность"
tra_info_leak="You did not admin when you joined the server. You are missing information. Please reconnect. Thank you."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwies(z)
Z_Defaut_Languages=3
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="Nombre"
zadmin3="Rango"
zmobutan="haga Clic Derecho sobre el jugador"
tra_ajt="Agregar"
ajouterallj="Agregar en todos los puestos de trabajo"
zaddlisti="Jugadores"
WhitelistJobSystem="Lista Blanca Sistema De Trabajo"
zaddsuppr="Eliminar"
zaddsupprall="Eliminar todos los puestos de trabajo"
tra_scrp_nordahl_script="Créditos"
tra_scrp_nordahl_credit="Hecho por Nordahl"
tra_scrp_nordahl_note="Help me por darme tu opinión sobre esta secuencia de comandos"
tra_scrprecherche="Buscar"
tra_scrprecherched="Con un Steam_ID, encontrar todas las entradas en una lista simple"
tra_wlistde="lista Blanca : "
tra_init="Inicialización"
tra_receptd="recepción de Datos"
tra_susermax="Número de usuarios"
tra_legd="Anti-Sobrecarga (Optimización)"
tra_metieactuel="Trabajo Real"
tra_publique="Público"
tra_acceswhitelist="Accesible sólo con la lista Blanca"
tra_groupferme="Trabajo cerrado para todo el mundo"
tra_accesvip="Accesible sólo para los donadores"
tra_reinitialiser="Reset"
tra_ajdalwdumetier="Agregar en el Trabajo de la lista Blanca"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date="Fecha"
tra_ajpar="Agregado por"
tra_metier="Trabajo"
tra_gestiondesmetier="Puestos de trabajo gestión de"
tra_gestiondesmetitreel="tiempo Real de trabajo de gestión de acceso"
tra_listedesjoueurs="Lista de jugadores en el servidor"
tra_accessi="Accesibilidad"
tra_info_leak="You did not admin when you joined the server. You are missing information. Please reconnect. Thank you."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiel(z)
Z_Defaut_Languages=6
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Όνομα"
zadmin3 = "Κατάταξη"
zmobutan = "Κάντε δεξί κλικ στη συσκευή αναπαραγωγής"
tra_ajt= "Προσθήκη"
ajouterallj = "Προσθέστε σε όλες τις θέσεις εργασίας"
zaddlisti = "παίκτες"
WhitelistJobSystem = "Σύστημα Λευκή Λίστα εργασίας"
zaddsuppr = "Διαγραφή"
zaddsupprall = "Διαγραφή από όλες τις θέσεις εργασίας"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Βοηθήστε με, δίνοντάς μου τη γνώμη σας σχετικά με αυτό το σενάριο"
tra_scrprecherche = "Αναζήτηση"
tra_scrprecherched = "Με Steam_ID, βρείτε όλες τις καταχωρήσεις σε μια απλή λίστα"
tra_wlistde = "Λευκή Λίστα με θέμα:"
tra_init = "αρχικοποίησης"
tra_receptd = "λήψη δεδομένων"
tra_susermax = "Αριθμός χρηστών"
tra_legd = "Anti-υπερφόρτωσης (Βελτιστοποίηση)"
tra_metieactuel = "πραγματική δουλειά"
tra_publique = "Δημόσια"
tra_acceswhitelist = "Πρόσβαση μόνο με τη Λευκή Λίστα"
tra_groupferme = "έκλεισε εργασίας για όλους"
tra_accesvip = "Διαθέσιμη μόνο στους δωρητές"
tra_reinitialiser = "Επαναφορά"
tra_ajdalwdumetier = "Προσθήκη στη Λευκή Λίστα του Ιώβ"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Ημερομηνία"
tra_ajpar = "Προστέθηκε από"
tra_metier = "Job"
tra_gestiondesmetier = "διαχείριση Jobs"
tra_gestiondesmetitreel = "διαχείριση πρόσβαση στην αγορά εργασίας σε πραγματικό χρόνο"
tra_listedesjoueurs = "Λίστα των παικτών στο διακομιστή"
tra_accessi = "Προσβασιμότητα"
tra_info_leak = "Μπορείτε δεν διαχειριστή, όταν εντάχθηκε στο διακομιστή. Μπορείτε λείπουν πληροφορίες. Παρακαλούμε να επανασυνδεθεί. Σας ευχαριστώ."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwipt(z)
Z_Defaut_Languages=7
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Name"
zadmin3 = "Rank"
zmobutan = "Clique direito sobre o jogador"
tra_ajt= "Adicionar"
ajouterallj = "Adicionar em todos os trabalhos"
zaddlisti = "jogadores"
WhitelistJobSystem = "Sistema de trabalho Whitelist"
zaddsuppr = "Excluir"
zaddsupprall = "Excluir todos os trabalhos"
tra_scrp_nordahl_script = "créditos"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Ajuda-me, dando-me a sua opinião sobre este script"
tra_scrprecherche = "Pesquisar"
tra_scrprecherched = "Com uma Steam_ID, encontrar todas as entradas em uma lista simples"
tra_wlistde = "Whitelist em:"
tra_init = "Inicialização"
tra_receptd = "recebimento de dados"
tra_susermax = "Número de usuários"
tra_legd = "Anti-sobrecarga (Optimization)"
tra_metieactuel = "trabalho real"
tra_publique = "Público"
tra_acceswhitelist = "Acessível apenas com o Whitelist"
tra_groupferme = "Job fechado para todos"
tra_accesvip = "acessível apenas para os doadores"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Adicionar na Whitelist do Job"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Data"
tra_ajpar = "Adicionado por"
tra_metier = "Job"
tra_gestiondesmetier = "gestão Jobs"
tra_gestiondesmetitreel = "gerenciamento de acesso de trabalho em tempo real"
tra_listedesjoueurs = "Lista de jogadores no servidor"
tra_accessi = "Acessibilidade"
tra_info_leak = "Você tinha informação não administrador quando você se juntou ao servidor. Está faltando. Por favor volte a ligar. Obrigado."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwipl(z)
Z_Defaut_Languages=8
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nazwa"
zadmin3 = "Pozycja"
zmobutan = "Kliknij prawym przyciskiem myszy na odtwarzaczu"
tra_ajt= "Dodaj"
ajouterallj = "Dodaj we wszystkich miejscach pracy"
zaddlisti = "Gracze"
WhitelistJobSystem = "Biała system pracy"
zaddsuppr = "Usuń"
zaddsupprall = "Usuń ze wszystkich miejsc pracy"
tra_scrp_nordahl_script = "Kredyty"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Pomóż mi, dając mi swoją opinię na temat tego skryptu"
tra_scrprecherche = "Szukaj"
tra_scrprecherched = "Z Steam_ID, znaleźć wszystkie wpisy w prostej listy"
tra_wlistde = "Biała on:"
tra_init = "Inicjalizacja"
tra_receptd = "odbiór danych"
tra_susermax = "Liczba użytkowników"
tra_legd = "Anti-przeciążeniowe (Optymalizacja)"
tra_metieactuel = "rzeczywistej pracy"
tra_publique = "Publiczne"
tra_acceswhitelist = "Dostępna tylko z Biała"
tra_groupferme = "Praca zamknięte dla wszystkich"
tra_accesvip = "Dostępna tylko dla darczyńców"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Add w Joba białej listy"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Data"
tra_ajpar = "Dodane przez"
tra_metier = "Praca"
tra_gestiondesmetier = "Praca management"
tra_gestiondesmetitreel = "Zarządzanie w czasie rzeczywistym dostęp do zatrudnienia"
tra_listedesjoueurs = "Lista graczy na serwerze"
tra_accessi = "Dostępność"
tra_info_leak = "Ty nie jesteś administratorem, kiedy dołączył do serwera. brakuje informacji. Proszę ponownie. Dziękuję."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiit(z)
Z_Defaut_Languages=9
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nome"
zadmin3 = "Rank"
zmobutan = "Fare clic destro sul giocatore"
tra_ajt= "Aggiungi"
ajouterallj = "Aggiungere in tutti i posti di lavoro"
zaddlisti = "Players"
WhitelistJobSystem = "Job System White list"
zaddsuppr = "Cancella"
zaddsupprall = "Elimina da tutti i lavori"
tra_scrp_nordahl_script = "Crediti"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Aiutami dandomi la tua opinione su questo script"
tra_scrprecherche = "Ricerca"
tra_scrprecherched = "Con un Steam_ID, trovare tutte le voci in un elenco semplice"
tra_wlistde = "Whitelist su:"
tra_init = "inizializzazione"
tra_receptd = "la ricezione dei dati"
tra_susermax = "Numero di utenti"
tra_legd = "anti-sovraccarico (Ottimizzazione)"
tra_metieactuel = "Actual lavoro"
tra_publique = "Pubblico"
tra_acceswhitelist = "accessibile solo con la White list"
tra_groupferme = "Job chiuso per tutti"
tra_accesvip = "accessibile solo ai donatori"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Aggiungi a Lista bianca del lavoro"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Data"
tra_ajpar = "Added by"
tra_metier = "Job"
tra_gestiondesmetier = "gestione dei processi"
tra_gestiondesmetitreel = "la gestione degli accessi di lavoro in tempo reale"
tra_listedesjoueurs = "Lista dei giocatori nel server"
tra_accessi = "Accessibilità"
tra_info_leak = "hai informazioni non admin quando ti sei iscritto il server. Ti manca. Si prega di riconnessione. Grazie."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwibg(z)
Z_Defaut_Languages=10
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Име"
zadmin3 = "Място"
zmobutan = "Кликнете с десния бутон на плейъра"
tra_ajt= "Добави"
ajouterallj = "Добавяне на всички работни места"
zaddlisti = "Играчите"
WhitelistJobSystem = "Бял списък Система за работа"
zaddsuppr = "Изтриване"
zaddsupprall = "Изтриване от всички работни места"
tra_scrp_nordahl_script = "Кредити"
tra_scrp_nordahl_credit = "Произведено от Nordahl"
tra_scrp_nordahl_note = "Помогни ми, като ми вашето мнение по този скрипт"
tra_scrprecherche = "Търсене"
tra_scrprecherched = "С Steam_ID, намерите всички записи в един прост списък"
tra_wlistde = "Бял списък на:"
tra_init = "Инициализация"
tra_receptd = "получаване на данни"
tra_susermax = "Брой на потребителите"
tra_legd = "Anti-претоварване (Оптимизиране)"
tra_metieactuel = "Край на работа"
tra_publique = "Public"
tra_acceswhitelist = "Достъпна само с списъка с разрешени адреси"
tra_groupferme = "Job затворен за всички"
tra_accesvip = "достъпни само за дарителите"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Добави в белия списък на Йов"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Дата"
tra_ajpar = "Добавена от"
tra_metier = "Работа"
tra_gestiondesmetier = "Управление на работни места"
tra_gestiondesmetitreel = "в реално време за управление на достъп до работа"
tra_listedesjoueurs = "Списък на играчите в сървъра"
tra_accessi = "Достъпност"
tra_info_leak = "Вие не администратор, когато се присъедини към сървъра. Вие сте липсва информация. Моля, свържете отново. Благодаря ви."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwics(z)
Z_Defaut_Languages=11
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Název"
zadmin3 = "Rank"
zmobutan = "Klikněte pravým tlačítkem myši na přehrávači"
tra_ajt= "Add"
ajouterallj = "Přidat do všech pracovních míst"
zaddlisti = "Hráči"
WhitelistJobSystem = "System Seznam povolených Job"
zaddsuppr = "Delete"
zaddsupprall = "Smazat ze všech pracovních míst"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Pomoz mi tím, že mi váš názor na tento skript"
tra_scrprecherche = "Search"
tra_scrprecherched = "S Steam_ID, kde najdete všechny položky v jednoduchém seznamu"
tra_wlistde = "Seznam povolených na"
tra_init = "Inicializace"
tra_receptd = "Data příjem"
tra_susermax = "Počet uživatelů"
tra_legd = "Anti-přetížení (Optimalizace)"
tra_metieactuel = "Skutečná práce"
tra_publique = "Public"
tra_acceswhitelist = "přístupné pouze po zadání Seznam povolených"
tra_groupferme = "uzavřené práce pro každého"
tra_accesvip = "přístupné pouze donátorů"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Přidat do Whitelist úkolu"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Datum"
tra_ajpar = "Přidal"
tra_metier = "Job"
tra_gestiondesmetier = "Správa Jobs"
tra_gestiondesmetitreel = "Správa přístup k zaměstnání v reálném čase"
tra_listedesjoueurs = "Seznam hráčů na serveru"
tra_accessi = "dostupnost"
tra_info_leak = "Vy jste admin, když se připojil k serveru. Zde jsou chybějící informace. Prosím připojte. Děkuji."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiet(z)
Z_Defaut_Languages=12
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nimi"
zadmin3 = "Koht"
zmobutan = "Paremklõps mängija"
tra_ajt= "Lisa"
ajouterallj = "Lisa kõik töökohad"
zaddlisti = "Mängijad"
WhitelistJobSystem = "valgesse nimekirja Töö System"
zaddsuppr = "Kustuta"
zaddsupprall = "Kustuta kõik töökohad"
tra_scrp_nordahl_script = "Autorid"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Aita mind, andes mulle oma arvamuse selle skripti"
tra_scrprecherche = "Otsi"
tra_scrprecherched = "Mis Steam_ID, leida kõik kirjed lihtsa nimekirja"
tra_wlistde = "Whitelisti kohta:"
tra_init = "Initialisation"
tra_receptd = "Andmete kättesaamisel"
tra_susermax = "Kasutajate arv"
tra_legd = "Anti-ülekoormus (optimeerimine)"
tra_metieactuel = "Tegelik töö"
tra_publique = "Avalik"
tra_acceswhitelist = "Kasutatav ainult valgesse nimekirja"
tra_groupferme = "Töö suletud kõigile"
tra_accesvip = "Kasutatav ainult annetajad"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Lisada Töö valge nimekiri"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Date"
tra_ajpar = "Lisatud"
tra_metier = "Töö"
tra_gestiondesmetier = "Jobs juhtimine"
tra_gestiondesmetitreel = "Reaalajas juurdepääs tööle juhtimine"
tra_listedesjoueurs = "Nimekiri mängijad server"
tra_accessi = "Hõlbustus"
tra_info_leak = "Sa ei admin kui liitus server. Sa puuduvad andmed. Palun ühendage. Aitäh."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwifi(z)
Z_Defaut_Languages=13
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nimi"
zadmin3 = "Rank"
zmobutan = "oikealla klikkaa pelaaja"
tra_ajt= "Add"
ajouterallj = "Lisää kaikki työt"
zaddlisti = "Pelaajat"
WhitelistJobSystem = "valkoinen lista Job System"
zaddsuppr = "Poista"
zaddsupprall = "Poista kaikki työt"
tra_scrp_nordahl_script = "Laajuus"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Auta minua antamalla minulle mielipiteenne tästä kirjoitus"
tra_scrprecherche = "Etsi"
tra_scrprecherched = "Kun Steam_ID, löytää kaikki merkinnät pelkkä luettelo"
tra_wlistde = "valkoinen lista on:"
tra_init = "Alustus"
tra_receptd = "Data kuitti"
tra_susermax = "Käyttäjien lukumäärä"
tra_legd = "Anti-ylikuorma (optimointi)"
tra_metieactuel = "Todellinen työ"
tra_publique = "Public"
tra_acceswhitelist = "Esteetön vain valkoinen lista"
tra_groupferme = "Job suljettu kaikille"
tra_accesvip = "Esteetön vain lahjoittajia"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Lisää joukkoon Jobin Whitelist"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Date"
tra_ajpar = "Lisääjä"
tra_metier = "työ"
tra_gestiondesmetier = "Jobs hallinta"
tra_gestiondesmetitreel = "Reaaliaikainen työn saanti hallinta"
tra_listedesjoueurs = "List of pelaajia palvelin"
tra_accessi = "Esteettömyys"
tra_info_leak = "Et admin kun liittynyt palvelimelle. Sinulta puuttuvat tiedot. Muodosta yhteys uudelleen. Kiitos."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwija(z)
Z_Defaut_Languages=14
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "名前"
zadmin3 = "ランク"
zmobutan = "プレイヤー上で右クリックして"
tra_ajt= "追加"
ajouterallj = "すべてのジョブに追加"
zaddlisti = "プレイヤー"
WhitelistJobSystem = "ホワイトリストジョブ・システム"
zaddsuppr = "削除"
zaddsupprall = "すべてのジョブから削除"
tra_scrp_nordahl_script = "クレジット"
tra_scrp_nordahl_credit = "Nordahl製"
tra_scrp_nordahl_note = "このスクリプトに私にあなたの意見を与えることによって、私を助けて"
tra_scrprecherche = "検索"
tra_scrprecherched = "Steam_IDでは、単純なリスト内のすべてのエントリを検索します"
tra_wlistde = "上のホワイトリスト："
tra_init = "初期化"
tra_receptd = "データ受信"
tra_susermax = "ユーザー数"
tra_legd = "アンチ過負荷（最適化）"
tra_metieactuel = "実際の仕事"
tra_publique = "公開"
tra_acceswhitelist ="アクセスしやすいだけでホワイトリスト "
tra_groupferme = "仕事を皆のため閉鎖しました"
tra_accesvip = "のみ寄付者へのバリアフリー"
tra_reinitialiser= "リセット"
tra_ajdalwdumetier ="ジョブのホワイトリストに追加"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "日"
tra_ajpar = "によって追加されました"
tra_metier = "仕事"
tra_gestiondesmetier ="ジョブ管理"
tra_gestiondesmetitreel = "リアルタイムジョブアクセス管理"
tra_listedesjoueurs = "サーバーのプレイヤーの一覧"
tra_accessi = "アクセシビリティ"
tra_info_leak = "サーバーに参加したときは、管理者はなかった。あなたは情報が不足している。再接続してください。ありがとうございます。"
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiko(z)
Z_Defaut_Languages=15
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "이름"
zadmin3 = "순위"
zmobutan = "오른쪽 플레이어를 클릭"
tra_ajt= "추가"
ajouterallj = "모든 작업에 추가"
zaddlisti = "플레이어"
WhitelistJobSystem = "허용 된 사이트 목록 작업 시스템"
zaddsuppr = "삭제"
zaddsupprall = "모든 작업에서 삭제"
tra_scrp_nordahl_script = "학점"
tra_scrp_nordahl_credit = "Nordahl에 의해 만들어"
tra_scrp_nordahl_note = "이 스크립트에 나에게 의견을 제공하여 도와주세요"
tra_scrprecherche = "검색"
tra_scrprecherched = "는 Steam_ID으로, 간단한 목록에있는 모든 항목을 찾을 수 있습니다"
tra_wlistde = "에 대한 화이트리스트"
tra_init = "초기화"
tra_receptd = "데이터 수신"
tra_susermax = "사용자 수"
tra_legd = "안티 - 과부하 (최적화)"
tra_metieactuel = "실제 작업"
tra_publique = '공개'
tra_acceswhitelist = "액세스 전용으로 화이트리스트"
tra_groupferme = "작업이 모두 폐쇄"
tra_accesvip = "만 기부자에 접근"
tra_reinitialiser = "재설정"
tra_ajdalwdumetier = "작업의 화이트리스트에 추가"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "날짜"
tra_ajpar = "작성자"
tra_metier = "작업"
tra_gestiondesmetier = "작업 관리"
tra_gestiondesmetitreel = "실시간 작업 액세스 관리"
tra_listedesjoueurs = "서버에서 선수 목록"
tra_accessi = "접근성"
tra_info_leak = "당신은. 서버에 가입하지 않을 경우 관리. 당신은 누락 된 정보를 다시 연결하십시오 않았다. 감사합니다."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwilv(z)
Z_Defaut_Languages=16
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nosaukums"
zadmin3 = "Rank"
zmobutan = "Tiesības, noklikšķiniet uz atskaņotāja"
tra_ajt= "Pievienot"
ajouterallj = "Pievienot visās darba vietām"
zaddlisti = "Spēlētāji"
WhitelistJobSystem = "baltais saraksts Job System"
zaddsuppr = "Dzēst"
zaddsupprall = "Dzēst no visām darba vietām"
tra_scrp_nordahl_script = "Kredīti"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Palīdzi man, dodot man savu viedokli par šo programmu"
tra_scrprecherche = "Meklēt"
tra_scrprecherched = "Ar Steam_ID, atrast visus ierakstus vienkāršā sarakstā"
tra_wlistde = "baltais saraksts uz:"
tra_init = "uzsākšana"
tra_receptd = "Datu saņemšana"
tra_susermax = "lietotāju skaits"
tra_legd = "Anti-Pārslodze (optimizācija)"
tra_metieactuel = "Faktiskā Job"
tra_publique = "Public"
tra_acceswhitelist = "Pieejama tikai ar baltais saraksts"
tra_groupferme = "Job slēgta ikvienam"
tra_accesvip = "Pieejama tikai ziedotājiem"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Pievienot in darbs baltajam sarakstam"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Datums"
tra_ajpar = "Pievienots"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs vadība"
tra_gestiondesmetitreel = "Reālā laika darba pieejamība vadība"
tra_listedesjoueurs = "Saraksts Dalībnieku servera"
tra_accessi = "Pieejamība"
tra_info_leak = "Jums nav admin kad tu pievienojies serverim. Jūs trūkstošo informāciju. Lūdzu, pievienojiet. Paldies."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwino(z)
Z_Defaut_Languages=17
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Navn"
zadmin3 = "Rank"
zmobutan = "Høyreklikk på spilleren"
tra_ajt= "Legg til"
ajouterallj = "Legg til i alle jobber"
zaddlisti = "spillere"
WhitelistJobSystem = "Whitelist Job System"
zaddsuppr = "Slett"
zaddsupprall = "Slett fra alle jobber"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Hjelp meg ved å gi meg din mening om dette skriptet"
tra_scrprecherche = "Søk"
tra_scrprecherched = "Med en steamid, finne alle oppføringer i en enkel liste"
tra_wlistde = "Whitelist på:"
tra_init = "Initial"
tra_receptd = "Data kvittering"
tra_susermax = "Antall brukere"
tra_legd = "Anti-Load (optimalisering)"
tra_metieactuel = "selve jobben"
tra_publique = "Public"
tra_acceswhitelist = "Tilgjengelig kun med hviteliste"
tra_groupferme = "Job stengt for alle"
tra_accesvip = "Tilgjengelig kun til givere"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Legg til i Jobs Whitelist"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Dato"
tra_ajpar = "Lagt til av"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs management"
tra_gestiondesmetitreel = "Real time jobb access management"
tra_listedesjoueurs = "Liste over spillere i serveren"
tra_accessi = "Tilgjengelighet"
tra_info_leak = "Du har ikke admin når du ble med serveren. Du mangler informasjon. Vennligst koble til igjen. Takk."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiro(z)
Z_Defaut_Languages=18
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nume"
zadmin3 = "Locul"
zmobutan = "Click dreapta pe player-ul"
tra_ajt= "Adăugați"
ajouterallj = "Adăugați în toate locurile de muncă"
zaddlisti = "Players"
WhitelistJobSystem = "Sistem de locuri de muncă de listă albă"
zaddsuppr = "Șterge"
zaddsupprall = "Șterge din toate locurile de muncă"
tra_scrp_nordahl_script = "credite"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Ajută-mă dându-mi părerea despre acest script"
tra_scrprecherche = "Căutare"
tra_scrprecherched = "Cu un Steam_ID, găsiți toate intrările dintr-o listă simplă"
tra_wlistde = "lista albă:"
tra_init = "Inițializarea"
tra_receptd = "primirea de date"
tra_susermax = "Numărul de utilizatori"
tra_legd = "Anti-suprasarcină (optimizare)"
tra_metieactuel = "locul de muncă actual"
tra_publique = "Public"
tra_acceswhitelist = "Accesibil numai cu Exceptate"
tra_groupferme = "Iov închis pentru toată lumea"
tra_accesvip = "accesibilă numai donatorilor"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Adauga in Lista albă Job-ului"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Data"
tra_ajpar = "Adăugat de"
tra_metier = "Iov"
tra_gestiondesmetier = "Management Locuri de munca"
tra_gestiondesmetitreel = "managementul accesului de locuri de muncă în timp real"
tra_listedesjoueurs = "Lista de jucători în server"
tra_accessi = "Accesibilitate"
tra_info_leak = "Tu ai informații nu admin când a aderat la server. Vă lipsesc. Vă rugăm să reconectați. Vă mulțumesc."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwisv(z)
Z_Defaut_Languages=19
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Namn"
zadmin3 = "Rank"
zmobutan = "Högerklicka på spelaren"
tra_ajt= "Lägg till"
ajouterallj = "Lägg i alla jobb"
zaddlisti = "Spelare"
WhitelistJobSystem = "vitlista Job System"
zaddsuppr = "Delete"
zaddsupprall = "Ta bort från alla jobb"
tra_scrp_nordahl_script = "Tack"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Hjälp mig genom att ge mig din åsikt om detta script"
tra_scrprecherche = "Sök"
tra_scrprecherched = "Med en Steam_ID, hitta alla poster i en enkel lista"
tra_wlistde = "vitlista på:"
tra_init = "Initiering"
tra_receptd = "Data kvitto"
tra_susermax = "Antal användare"
tra_legd = "Anti-överbelastning (Optimization)"
tra_metieactuel = "Verklig jobb"
tra_publique = "Public"
tra_acceswhitelist = "Tillgänglig endast med vitlista"
tra_groupferme = "Job stängd för alla"
tra_accesvip = "Tillgänglig endast till donator"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Lägg i Jobs vitlista"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Date"
tra_ajpar = "Inlagd av"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs management"
tra_gestiondesmetitreel = "Realtids tillgång jobbhantering"
tra_listedesjoueurs = "Förteckning över spelare i servern"
tra_accessi = "Handikappstöd"
tra_info_leak = "Du har informationen inte admin när du gick med servern. Du saknar. Försök återansluta. Tack."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwitr(z)
Z_Defaut_Languages=20
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Ad"
zadmin3 = "Rank"
zmobutan = "Sağ oyuncu tıklayın"
tra_ajt= "Ekle"
ajouterallj = "Tüm işlerde Ekle"
zaddlisti = "Oyuncular"
WhitelistJobSystem = "Beyaz liste İş Sistemi"
zaddsuppr = "Sil"
zaddsupprall = "bütün işlerden Sil"
tra_scrp_nordahl_script = "Kredi"
tra_scrp_nordahl_credit = "Nordahl tarafından yapılmıştır"
tra_scrp_nordahl_note = "Bu senaryo üzerinde bana Düşüncelerinizi vererek bana yardım"
tra_scrprecherche = "Ara"
tra_scrprecherched = "a Steam_ID ile basit bir listedeki tüm girdileri bulmak"
tra_wlistde = "konulu Beyaz liste:"
tra_init = "Bafllatma"
tra_receptd = "Veri makbuz"
tra_susermax = "kullanıcı sayısı"
tra_legd = "Anti-Aşırı yük (Optimizasyon)"
tra_metieactuel = "Gerçek iş"
tra_publique = "Public"
tra_acceswhitelist = "Erişilebilir yalnızca Beyaz Liste"
tra_groupferme = "İş herkes için kapalı"
tra_accesvip = "sadece bağışçıların Erişilebilir"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Eyüp Beyaz Listede Ekle"
tra_ajdalbdumetier="Add in the Job's Blacklist"
tra_date = "Tarih"
tra_ajpar = "tarafından eklendi"
tra_metier = "İş"
tra_gestiondesmetier = "İşler yönetimi"
tra_gestiondesmetitreel = "Gerçek zamanlı bir iş erişim yönetimi"
tra_listedesjoueurs = "sunucudaki oyuncuların listesi"
tra_accessi = "Erişilebilirlik"
tra_info_leak = "Sen. sunucuyu katıldığında admin. Sen eksik bilgileri yeniden Lütfen etmedi. Teşekkür ederim."
tra_regl_stat_job="Set the jobs' status"
end

if Z_Defaut_Languages==1 then
languejobwifr(1)
elseif Z_Defaut_Languages==2 then
languejobwien(2)
elseif Z_Defaut_Languages==3 then
languejobwies(3)
elseif Z_Defaut_Languages==4 then
languejobwidu(4)
elseif Z_Defaut_Languages==5 then
languejobwiru(5)
elseif Z_Defaut_Languages==6 then
languejobwiel(6)
elseif Z_Defaut_Languages==7 then
languejobwipt(7)
elseif Z_Defaut_Languages==8 then
languejobwipl(8)
elseif Z_Defaut_Languages==9 then
languejobwiit(9)
elseif Z_Defaut_Languages==10 then
languejobwibg(10)
elseif Z_Defaut_Languages==11 then
languejobwics(11)
elseif Z_Defaut_Languages==12 then
languejobwiet(12)
elseif Z_Defaut_Languages==13 then
languejobwifi(13)
elseif Z_Defaut_Languages==14 then
languejobwija(14)
elseif Z_Defaut_Languages==15 then
languejobwiko(15)
elseif Z_Defaut_Languages==16 then
languejobwilv(16)
elseif Z_Defaut_Languages==17 then
languejobwino(17)
elseif Z_Defaut_Languages==18 then
languejobwiro(18)
elseif Z_Defaut_Languages==19 then
languejobwisv(19)
elseif Z_Defaut_Languages==20 then
languejobwitr(20)
else
languejobwien(2)
end

function Nordah_Whitelist_Job.AddCommand( func, name )
local newfunc = function( ply, cmd, args ) 
local target = Nordah_Whitelist_Job.GetPlayer( args[1] )
if name=="wjs_goto" or name=="wjs_bring" then 
else
if not target or not eRight(ply) or(ply==target and name=="wjs_superadmin") then return end 
end
func( ply, cmd, args ) 
end
concommand.Add( name, newfunc )
end

function Nordah_Whitelist_Job.GetPlayer( id )
if id==nil then return end
local ply = Entity( id )
if not IsValid( ply ) or not ply:IsPlayer() then return end
return ply
end
Nordah_Whitelist_Job.Commands = {}
--Nordah_Whitelist_Job.Tabs = {}
function Nordah_Whitelist_Job.RegisterCommand( name, commandname, chatcmd, args, override )
table.insert( Nordah_Whitelist_Job.Commands, { Name = name, CommandName = commandname, ChatCmd = chatcmd, Args = args, ArgOverride = override } )
end

local gradient=Material("gui/gradient.png")
local SetDrawColor=surface.SetDrawColor
local TexturedRect=surface.DrawTexturedRect
local SetMaterial=surface.SetMaterial

local function zradient(r,g,b,a,x,y,w,t)
SetDrawColor(r,g,b,a)
SetMaterial(gradient)TexturedRect(x,y,w,t)
end

function Nordah_Whitelist_Job_Menu( ply, cmd, args )
if zwjlist==nil then print(tra_info_leak) return end
if eRight(ply)==false then print("Whitelist System: You are not Admin") return end
surface.PlaySound("ambient/machines/keyboard1_clicks.wav")
local Menu = vgui.Create("DFrame")
Menu:SetSize(ScrW()/1.5,ScrH()/2)
Menu:Center()
Menu:SetTitle(" ")
Menu:SetDraggable(true)
Menu:ShowCloseButton(false)
Menu:MakePopup()
Menu.Paint=function()
if sysjobwi=="1" then
if nord_s_skin=="1" then
zradient(0,0,0,255,0,0,Menu:GetWide(),Menu:GetTall())
draw.RoundedBox(0,1,1,Menu:GetWide()-2,22,Color(0,0,50,255))
draw.SimpleText(WhitelistJobSystem..wjl..' - by Nordahl', "Trebuchet18", 28, 13, Color(26,138,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
elseif nord_s_skin=="2" then
draw.SimpleText(WhitelistJobSystem..wjl..' - by Nordahl', "Trebuchet24", 28, 12, Color(26,138,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
else
zradient(255,255,255,255,0,0,Menu:GetWide(),Menu:GetTall())
draw.SimpleText(WhitelistJobSystem..wjl..' - by Nordahl', "Trebuchet18", 28, 13, Color(0,0,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,5,16,16)

elseif sysjobwi=="0" then

if nord_s_skin=="1" then
zradient(200,0,0,255,0,0,Menu:GetWide(),Menu:GetTall())
zradient(0,0,0,255,1,1,Menu:GetWide()-2,Menu:GetTall()-2)
draw.SimpleText(WhitelistJobSystem..wjl.." (OFF)", "Trebuchet18", 28, 13, Color(150,0,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
elseif nord_s_skin=="2" then
draw.SimpleText(WhitelistJobSystem..wjl.." (OFF)", "Trebuchet18", 28, 13, Color(150,0,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
else
zradient(200,0,0,255,0,0,Menu:GetWide(),Menu:GetTall())
zradient(255,255,255,255,1,1,Menu:GetWide()-2,Menu:GetTall()-2)
draw.SimpleText(WhitelistJobSystem..wjl.." (OFF)", "Trebuchet18", 28, 13, Color(150,0,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
surface.SetDrawColor(255,200,200,255) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,5,16,16)

end

end
local Text = vgui.Create("DLabel",Menu)
Text:SetText("")
Text:SizeToContents()
Text:SetPos(10,100)
Text:SetSize(800,40)
Text:SetFont("Trebuchet24")
local button=vgui.Create("DButton",Menu)button:SetText("")button:SetSize(16,16)
button.Paint=function()draw.RoundedBox(8,0,0,button:GetWide(),button:GetTall(),Color(0,0,0,0))
end
button:SetPos(Menu:GetWide()-45,5)local zmodcm=vgui.Create("DImage",Menu)zmodcm:SetImage("icon16/Wrench.png")zmodcm:SetSize(16,16)zmodcm:SetPos(Menu:GetWide()-45,5)button.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")

------
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu("Languages")
optMenu:SetIcon("icon16/world.png")
local flche=""
if Z_Defaut_Languages==1 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Français",function()file.Write("nordahlclient_option/language.txt","1")languejobwifr()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/fr.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==2 then flche=puce else flche="" end 
subMenu:AddOption(flche.."English",function()file.Write("nordahlclient_option/language.txt","2")languejobwien()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/en.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==3 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Español",function()file.Write("nordahlclient_option/language.txt","3")languejobwies()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/es.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==4 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Deutsch",function()file.Write("nordahlclient_option/language.txt","4")languejobwidu()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/de.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==5 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Russian",function()file.Write("nordahlclient_option/language.txt","5")languejobwiru()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ru.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==6 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Greek",function()file.Write("nordahlclient_option/language.txt","6")languejobwiel()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/el.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==7 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Portuguese",function()file.Write("nordahlclient_option/language.txt","7")languejobwipt()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/pt.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==8 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Polish",function()file.Write("nordahlclient_option/language.txt","8")languejobwipl()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/pl.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==9 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Italian",function()file.Write("nordahlclient_option/language.txt","9")languejobwiit()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/it.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==10 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Bulgarian",function()file.Write("nordahlclient_option/language.txt","10")languejobwibg()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/bg.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==11 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Czech",function()file.Write("nordahlclient_option/language.txt","11")languejobwics()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/cs.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==12 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Estonian",function()file.Write("nordahlclient_option/language.txt","12")languejobwiet()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/et.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==13 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Finnish",function()file.Write("nordahlclient_option/language.txt","13")languejobwifi()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/fi.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==14 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Japanese",function()file.Write("nordahlclient_option/language.txt","14")languejobwija()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ja.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==15 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Korean",function()file.Write("nordahlclient_option/language.txt","15")languejobwiko()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ko.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==16 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Latvian",function()file.Write("nordahlclient_option/language.txt","16")languejobwilv()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/lv.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==17 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Norwegian",function()file.Write("nordahlclient_option/language.txt","17")languejobwino()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/no.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==18 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Romanian",function()file.Write("nordahlclient_option/language.txt","18")languejobwiro()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ro.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==19 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Swedish",function()file.Write("nordahlclient_option/language.txt","19")languejobwisv()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/sv.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==20 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Turkish",function()file.Write("nordahlclient_option/language.txt","20")languejobwitr()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/tr.png")
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4:AddSpacer()
local subMenu,optMenu=z4:AddSubMenu("Panel Skin")
optMenu:SetIcon("icon16/color_swatch.png")
subMenu:AddOption("Original Skin",function()LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)file.Write("nordahlclient_option/nord_s_skin.txt","0")nord_s_skin="0" end):SetImage("icon16/color_swatch.png")
subMenu:AddSpacer()
subMenu:AddOption("Skin 1",function()LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)file.Write("nordahlclient_option/nord_s_skin.txt","1")nord_s_skin="1" end):SetImage("icon16/color_swatch.png")
subMenu:AddSpacer()
subMenu:AddOption("Skin 2",function()LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)file.Write("nordahlclient_option/nord_s_skin.txt","2")nord_s_skin="2" end):SetImage("icon16/color_swatch.png")
z4:AddSpacer()
local subMenu,optMenu=z4:AddSubMenu(tra_scrp_nordahl_script)
optMenu:SetIcon("icon16/wand.png")
subMenu:AddOption(tra_scrp_nordahl_credit,function()gui.OpenURL("https://originahl-scripts.com/profiles/76561198033784269") end):SetImage("ngui/nordahl.png")
subMenu:AddSpacer()
subMenu:AddOption(tra_scrp_nordahl_note.." :)",function()gui.OpenURL("https://originahl-scripts.com/gmod-scripts/1402/reviews-page-1") end):SetImage("icon16/star.png")
subMenu:AddSpacer()
subMenu:AddOption("Workshop Content",function()gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=493897275") end)
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4:AddSpacer()
z4:AddOption("Script Description",function()gui.OpenURL("https://originahl-scripts.com/gmod-scripts/1402/description#description") end):SetImage("ngui/originahl-scripts.png")
z4:AddSpacer()
z4:AddOption("Script Wiki",function()gui.OpenURL("https://originahl-scripts.com/gmod-scripts/1402/wiki#wiki") end):SetImage("ngui/originahl-scripts.png")
z4:Open()
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
------
end

local button=vgui.Create("DButton",Menu)
button:SetText("")
button:SetSize(16,16)
button:SetPos(Menu:GetWide()-25,5)
button.Paint=function()draw.RoundedBox(8,0,0,0,0,Color(0,0,0,0))
end
local zmodcm=vgui.Create("DImage",Menu)
zmodcm:SetImage("icon16/cross.png")
zmodcm:SetSize(16,16)
zmodcm:SetPos(Menu:GetWide()-25,5)
button.DoClick=function()
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
Menu:Close()
end
local button=vgui.Create("DButton",Menu)
button:SetText("")
button:SetSize(16,16)
button:SetPos(Menu:GetWide()-23-21-21,5)
button.Paint=function()draw.RoundedBox(8,0,0,0,0,Color(0,0,0,0))
end
local zmodcm=vgui.Create("DImage",Menu)
zmodcm:SetImage("icon16/arrow_refresh.png")
zmodcm:SetSize(16,16)
zmodcm:SetPos(Menu:GetWide()-23-21-21,5)
button.DoClick=function()
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
Menu:Close()
Nordah_Whitelist_Job_Menu(ply)
end
if eRight(ply)==false then return end
local xsize = 600
local ysize = 500
local players = {}
local list = vgui.Create( "DPropertySheet", Menu )
local MenuGetWide=Menu:GetWide()-9
local MenuGetTall=Menu:GetTall()-30
list.Paint=function()
zradient(0,0,0,255,0,20,MenuGetWide,MenuGetTall-20)
zradient(26,138,200,255,1,21,MenuGetWide-2,MenuGetTall-22)
end
list:StretchToParent( 4, 24, 4, 4 )
local dpanel = vgui.Create( "DPanel" )
dpanel.InvalidateLayout = function()
if dpanel.List then
dpanel.List:StretchToParent( 0, 35, 0, 0 )
end
end
dpanel.Paint=function()
zradient(0,0,0,255,0,0,MenuGetWide-2,MenuGetTall-22)
end
local listview = vgui.Create( "DListView", dpanel )
listview.Paint=function()
zradient(0,0,0,255,0,0,listview:GetWide(),listview:GetTall())
draw.RoundedBox(8,1,1,listview:GetWide()-5,listview:GetTall()-2,Color(255,255,255,255))
end

local function stringifycash(n)
local c,p="$",","
if n<0 then
c="-"..c
end
n=math.abs(n)..""
local dp=#n
for i=dp-3,1,-3 do
n=n:sub(1,i)..p..n:sub(i+1)
end
return c..n
end

col1 = listview:AddColumn(tra_nom)
col6 = listview:AddColumn("Money")
col4 = listview:AddColumn("Steam_ID")
col2 = listview:AddColumn(tra_metieactuel)
col5 = listview:AddColumn("Distance")
col1:SetMinWidth( 150 )
col4:SetMinWidth( 150 )
col4:SetMaxWidth( 150 )
col2:SetMinWidth( 150 )
col2:SetMaxWidth( 150 )
col5:SetMaxWidth( 150 )
col6:SetMaxWidth( 150 )

local butan=vgui.Create("DButton",dpanel)
butan:SetText("SteamID Converter")
butan:SetPos(5,5)
butan:SetWide(150)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
end
butan.DoClick=function()
gui.OpenURL("https://steamid.io/")
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

dpanel.Butan = butan
dpanel.List = listview
dpanel:InvalidateLayout()
list:AddSheet(zaddlisti, dpanel, "icon16/group.png", false, false,tra_listedesjoueurs)

local Faitlepanno=vgui.Create("DPanel")
Faitlepanno.InvalidateLayout=function()
if Faitlepanno.List then
Faitlepanno.List:StretchToParent(0,35,0,0)
end
end
Faitlepanno.Paint=function()zradient(0,125,194,255,0,0,MenuGetWide-2,MenuGetTall-22)end
local butan=vgui.Create("DButton",Faitlepanno)
butan:SetText("    "..tra_reinitialiser)
butan:SetPos(5,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/cross.png"))surface.DrawTexturedRect(4,4,16,16)
end

local listtt=vgui.Create("DListView",Faitlepanno)

butan.DoClick=function()
surface.PlaySound(Sound( "buttons/button14.wav" ))
Add_Job_In_the_Whiteliste={}
RunConsoleCommand("MetajolistDe")
listtt:Clear()
LUTJ()

end
function LUTJ()
local lignedeu=tra_publique
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
if Add_Job_In_the_Whiteliste[v.Name]==nil or Add_Job_In_the_Whiteliste[v.Name]=="0" then
lignedeu=tra_publique
lignetroi="0"
elseif Add_Job_In_the_Whiteliste[v.Name]=="1" then
lignedeu=tra_acceswhitelist
lignetroi="1"
elseif Add_Job_In_the_Whiteliste[v.Name]=="2" then
lignedeu=tra_groupferme
lignetroi="2"
elseif Add_Job_In_the_Whiteliste[v.Name]=="3" then
lignedeu=tra_accesvip
lignetroi="3"
elseif Add_Job_In_the_Whiteliste[v.Name]=="4" then
lignedeu="Blacklist"
lignetroi="4"
end
listtt:AddLine(v.Name,lignedeu,lignetroi)

-- for c,f in pairs(Add_Job_In_the_Whiteliste)do
-- if v.Name==c then
-- if f=="0" then
-- lignedeu=tra_acceswhitelist
-- lignetroi="0"
-- elseif f=="1" then
-- lignedeu=tra_acceswhitelist
-- lignetroi="1"
-- elseif f=="2" then
-- lignedeu=tra_groupferme
-- lignetroi="2"
-- end
-- end
-- end
-- listtt:AddLine(v.Name,lignedeu,lignetroi)
end
end
LUTJ()

local butan=vgui.Create("DButton",Faitlepanno)
butan:SetText("")
butan:SetPos(110,5)
butan:SetWide(250)
butan.Paint=function()
if sysjobwi=="1" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,190,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(210,255,210,255))
surface.SetDrawColor( 255,255,255, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
elseif sysjobwi=="0" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(170,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(255,210,210,255))
surface.SetDrawColor( 255,200,200, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
end
if sysjobwi=="1" then
draw.SimpleText("Whitelist JOB System ON","Trebuchet18",125+8,11, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
elseif sysjobwi=="0" then
draw.SimpleText("Whitelist JOB System OFF","Trebuchet18",125+8,11, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end
end

butan.DoClick=function()
if sysjobwi=="0" then
LocalPlayer():EmitSound("ui/buttonclick.wav",100,200)
RunConsoleCommand("sysjobwhitelist","1")
elseif sysjobwi=="1" then
RunConsoleCommand("sysjobwhitelist","0")
LocalPlayer():EmitSound("ui/buttonclick.wav",100,160)
end
end

local butan=vgui.Create("DButton",Faitlepanno)
butan:SetText("")
butan:SetPos(365,5)
butan:SetWide(200)
butan.Paint=function()
if sysjobwi=="1" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,190,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(210,255,210,255))
surface.SetDrawColor( 255,255,255, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
elseif sysjobwi=="0" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(170,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(255,210,210,255))
surface.SetDrawColor( 255,200,200, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
end
draw.SimpleText("Global_"..tra_accessi,"Trebuchet18",108,11, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end

local function set_G_line(a,b)
RunConsoleCommand("Metajrmalist_G",a,b)
Metajolist_f_G(LocalPlayer(),"Metajolist_f_G",{a})
listtt:Clear()
LUTJ()
end

butan.DoClick=function()
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu(tra_regl_stat_job)
optMenu:SetIcon("ngui/wljs.png")
subMenu:AddOption("(Global) "..tra_publique,function()set_G_line("0")end):SetImage("icon16/door_open.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) "..tra_acceswhitelist,function()set_G_line("1")end):SetImage("icon16/report_add.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) "..tra_accesvip,function()set_G_line("3")end):SetImage("icon16/coins_add.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) "..tra_groupferme,function()set_G_line("2")end):SetImage("icon16/delete.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) ".."Blacklist",function()set_G_line("4")end):SetImage("icon16/report_delete.png")
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
z4:Open()
LocalPlayer():EmitSound("ui/buttonclick.wav",100,200)
end

listtt.Paint=function()
draw.RoundedBox(8,0,0,listtt:GetWide(),listtt:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listtt:GetWide()-2,listtt:GetTall()-2,Color(255,255,255,255))
end
Faitlepanno.List=listtt
local col1=listtt:AddColumn(tra_metier)
local col2=listtt:AddColumn(tra_accessi)
col1:SetMinWidth(300)
col1:SetMaxWidth(300)
col2:SetMinWidth(300)
col2:SetMinWidth(300)
local function setline(a,b)
if b!="0" then
Add_Job_In_the_Whiteliste[a]=b
elseif b=="0" then
Add_Job_In_the_Whiteliste[a]=nil
end
RunConsoleCommand("Metajourmalist",a,b)
listtt:Clear()
LUTJ()
end
listtt.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu(tra_regl_stat_job)
optMenu:SetIcon("ngui/wljs.png")
local polici=""
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]==nil then polici=puce else polici="" end
subMenu:AddOption(polici..tra_publique,function()setline(line:GetColumnText(1),"0")end):SetImage("icon16/door_open.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="1" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_acceswhitelist,function()setline(line:GetColumnText(1),"1")end):SetImage("icon16/report_add.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="3" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_accesvip,function()setline(line:GetColumnText(1),"3")end):SetImage("icon16/coins_add.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="2" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_groupferme,function()setline(line:GetColumnText(1),"2")end):SetImage("icon16/delete.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="4" then polici=puce else polici="" end
subMenu:AddOption(polici.."Blacklist",function()setline(line:GetColumnText(1),"4")end):SetImage("icon16/report_delete.png")

subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
z4:Open()
end

list:AddSheet(tra_gestiondesmetier,Faitlepanno,"ngui/wljs.png", false, false,tra_gestiondesmetitreel)

local Faitlepangjb=vgui.Create("DPanel")
local list2=vgui.Create("DListView",Faitlepangjb)
function LUTG()
local lignedeu=tra_publique
for k,v in pairs(Add_JobGroup_In_the_Whiteliste) do
if v=="0" then
lignedeu=tra_publique
lignetroi="0"
elseif v=="1" then
lignedeu=tra_acceswhitelist
lignetroi="1"
elseif v=="2" then
lignedeu=tra_groupferme
lignetroi="2"
elseif v=="3" then
lignedeu=tra_accesvip
lignetroi="3"
elseif v=="4" then
lignedeu="Blacklist"
lignetroi="4"
end
list2:AddLine(k,lignedeu,lignetroi)
end
end
LUTG()

Faitlepangjb.InvalidateLayout=function()
if Faitlepangjb.List then
Faitlepangjb.List:StretchToParent(0,35,0,0)
end
end
Faitlepangjb.Paint=function()zradient(229,140,38,255,0,0,MenuGetWide-2,MenuGetTall-22)
end
local butan=vgui.Create("DButton",Faitlepangjb)
butan:SetText("    "..tra_reinitialiser)
butan:SetPos(5,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/cross.png"))surface.DrawTexturedRect(4,4,16,16)
end

butan.DoClick=function()
surface.PlaySound(Sound( "buttons/button14.wav" ))
Add_JobGroup_In_the_Whiteliste={}
RunConsoleCommand("MetajogrlistDe")
list2:Clear()
LUTG()
end


local butan=vgui.Create("DButton",Faitlepangjb)
butan:SetText("")
butan:SetPos(110,5)
butan:SetWide(250)
butan.Paint=function()
if syscatwi=="1" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,190,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(210,255,210,255))
surface.SetDrawColor( 255,255,255, 255 ) 
surface.SetMaterial(Material("ngui/wlgs.png"))surface.DrawTexturedRect(5,4,16,16)
elseif syscatwi=="0" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(170,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(255,210,210,255))
surface.SetDrawColor( 255,200,200, 255 ) 
surface.SetMaterial(Material("ngui/wlgs.png"))surface.DrawTexturedRect(5,4,16,16)
end
if syscatwi=="1" then
draw.SimpleText("Whitelist Category(Job) System ON","Trebuchet18",125+8,11, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
elseif syscatwi=="0" then
draw.SimpleText("Whitelist Category(Job) System OFF","Trebuchet18",125+8,11, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end
end

butan.DoClick=function()
if syscatwi=="0" then
LocalPlayer():EmitSound("ui/buttonclick.wav",100,200)
RunConsoleCommand("syscatwhitelist","1")
elseif syscatwi=="1" then
RunConsoleCommand("syscatwhitelist","0")
LocalPlayer():EmitSound("ui/buttonclick.wav",100,160)
end
end

local function setline(a,b)
if b=="-1" then
Add_JobGroup_In_the_Whiteliste[a]=nil
else
Add_JobGroup_In_the_Whiteliste[a]=b
end
RunConsoleCommand("Metajourmalist2",a,b)
list2:Clear()
LUTG()
end

local butan=vgui.Create("DButton",Faitlepangjb)
butan:SetText("")
butan:SetPos(365,5)
butan:SetWide(200)
butan.Paint=function()
if sysjobwi=="1" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,190,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(210,255,210,255))
surface.SetDrawColor( 255,255,255, 255 ) 
surface.SetMaterial(Material("ngui/wlgs.png"))surface.DrawTexturedRect(5,4,16,16)
elseif sysjobwi=="0" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(170,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(255,210,210,255))
surface.SetDrawColor( 255,200,200, 255 ) 
surface.SetMaterial(Material("ngui/wlgs.png"))surface.DrawTexturedRect(5,4,16,16)
end
draw.SimpleText("Category list","Trebuchet18",108,11, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end
butan.DoClick=function()
LocalPlayer():EmitSound("ui/buttonclick.wav",100,200)
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu("List of category of jobs set in darkrp/gamemode/jobrelated.lua")optMenu:SetIcon("ngui/wlgs.png")
local trij={}
for k,v in pairs(RPExtraTeams) do
local c=v.category
if !trij[c] then
trij[c]=true
subMenu:AddOption(c,function()setline(c,"0")end):SetImage("icon16/add.png")
subMenu:AddSpacer()
end
end
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
z4:Open()
end

list2.Paint=function()
draw.RoundedBox(8,0,0,list2:GetWide(),list2:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,list2:GetWide()-2,list2:GetTall()-2,Color(255,255,255,255))
end
Faitlepangjb.List=list2
local col1=list2:AddColumn("GROUPED JOB (Category)")
local col2=list2:AddColumn(tra_accessi)
col1:SetMinWidth(300)col1:SetMaxWidth(300)
col2:SetMinWidth(300)col2:SetMinWidth(300)
list2.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu(tra_regl_stat_job)
optMenu:SetIcon("ngui/wlgs.png")
subMenu:AddOption("Delete",function()setline(line:GetColumnText(1),"-1")end):SetImage("icon16/cross.png")
subMenu:AddSpacer()
local polici=""
if Add_JobGroup_In_the_Whiteliste[line:GetColumnText(1)]=="0" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_publique,function()setline(line:GetColumnText(1),"0")end):SetImage("icon16/door_open.png")
subMenu:AddSpacer()
if Add_JobGroup_In_the_Whiteliste[line:GetColumnText(1)]=="1" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_acceswhitelist,function()setline(line:GetColumnText(1),"1")end):SetImage("icon16/report_add.png")
subMenu:AddSpacer()
if Add_JobGroup_In_the_Whiteliste[line:GetColumnText(1)]=="3" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_accesvip,function()setline(line:GetColumnText(1),"3")end):SetImage("icon16/coins_add.png")
subMenu:AddSpacer()
if Add_JobGroup_In_the_Whiteliste[line:GetColumnText(1)]=="2" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_groupferme,function()setline(line:GetColumnText(1),"2")end):SetImage("icon16/delete.png")
subMenu:AddSpacer()
if Add_JobGroup_In_the_Whiteliste[line:GetColumnText(1)]=="4" then polici=puce else polici="" end
subMenu:AddOption(polici.."Blacklist",function()setline(line:GetColumnText(1),"4")end):SetImage("icon16/report_delete.png")
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
z4:Open()
end

local textbox1=vgui.Create("DTextEntry",Faitlepangjb)
textbox1:SetPos(570,6)
textbox1:SetWide(200)
textbox1:SetText("Add manually a category")
textbox1.OnEnter=function(a,b,c)
textbox1:SetTextColor(Color(0,175,0,255))
setline(textbox1:GetText(),"0")
end
list:AddSheet("Category job",Faitlepangjb,"ngui/wlgs.png", false, false,tra_gestiondesmetitreel)

local MakePanelF=vgui.Create("DPanel")
MakePanelF.InvalidateLayout=function()
if MakePanelF.List then
MakePanelF.List:StretchToParent(0,35,0,0)
MakePanelF.Box1:SetPos(0,7)
end
end
MakePanelF.Paint=function()
zradient(0,125,194,255,0,0,MenuGetWide-2,MenuGetTall-22)
end
local textbox1=vgui.Create("DTextEntry",MakePanelF)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
MakePanelF.Box1=textbox1
local butan=vgui.Create("DButton",MakePanelF)
butan:SetText("   "..tra_scrprecherche.." Players")
butan:SetPos(155,5)
butan:SetWide(150)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/zoom.png"))surface.DrawTexturedRect(4,4,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:Clear()
for k,v in pairs(ZJOBwhitelist)do 
if v[2]==steamid64 then
butan.List:AddLine(steamid64,v[3],v[4],v[5])
end
end
surface.PlaySound(Sound( "buttons/button14.wav" ))
end
local butan2=vgui.Create("DButton",MakePanelF)
butan2:SetText("   "..zaddsupprall)
butan2:SetPos(310,5)
butan2:SetWide(170)
butan2.Paint=function()
draw.RoundedBox(6,0,0,butan2:GetWide(),butan2:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan2:GetWide()-2,butan2:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan2:GetTall()-1-butan2:GetTall()/3,butan2:GetWide()-2,butan2:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/user_delete.png"))surface.DrawTexturedRect(4,4,16,16)
end
butan2.DoClick=function()
RunConsoleCommand("Massremovewhitelist",steamid64)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local listtrouver=vgui.Create("DListView",MakePanelF)
listtrouver.Paint=function()
draw.RoundedBox(8,0,0,listtrouver:GetWide(),listtrouver:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listtrouver:GetWide()-2,listtrouver:GetTall()-2,Color(255,255,255,255))
end
MakePanelF.List=listtrouver
butan.List=listtrouver
local col1=listtrouver:AddColumn("Steam ID")
col2=listtrouver:AddColumn(tra_nom)
col3=listtrouver:AddColumn(tra_metier)
col4=listtrouver:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

listtrouver.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listtrouver:RemoveLine(id)
Nordah_Whitelist_Job.RemoveJobWhitelist(line:GetColumnText(1),nil,line:GetColumnText(3))
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listtrouver:Clear()
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end
list:AddSheet(tra_scrprecherche.." Players",MakePanelF,"icon16/zoom.png", false, false,tra_scrprecherched)


local MakePanelRECH=vgui.Create("DPanel")
MakePanelRECH.InvalidateLayout=function()
if MakePanelRECH.List then
MakePanelRECH.List:StretchToParent(0,65,0,0)
MakePanelRECH.Box1:SetPos(0,7)
end
end
MakePanelRECH.Paint=function()
zradient(0,125,194,255,0,0,MenuGetWide-2,MenuGetTall-22)
end
local textbox1=vgui.Create("DTextEntry",MakePanelRECH)
textbox1:SetWide(150)
textbox1:SetText("Job/Category Name here")
MakePanelRECH.Box1=textbox1
local butan=vgui.Create("DButton",MakePanelRECH)
butan:SetText("   "..tra_scrprecherche.." Job or Category")
butan:SetPos(155,5)
butan:SetWide(150)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/zoom.png"))surface.DrawTexturedRect(4,4,16,16)
end
butan.DoClick=function()
local Met=textbox1:GetText()
butan.List:Clear()
local xst=false
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
if v.Name==Met then
xst=true
if butanwarning then
butanwarning:Remove()
butanwarning=nil
end
end
end

if xst==false and !butanwarning then
butanwarning=vgui.Create("DButton",MakePanelRECH)
butanwarning:SetText("")
butanwarning:SetPos(0,30)
butanwarning:SetSize(775,30)
butanwarning.Paint=function()--
draw.RoundedBox(6,0,0,butanwarning:GetWide(),butanwarning:GetTall(),Color(150,0,0,200))
draw.RoundedBox(6,1,1,butanwarning:GetWide()-2,butanwarning:GetTall()-2,Color(255,0,0,200))
draw.SimpleText(tra_recherch_job, "Trebuchet24", 387, 13, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
butanwarning.DoClick=function()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end
end





for k,v in pairs(ZJOBwhitelist)do 
if v[4]==Met then
butan.List:AddLine(v[2],v[3],v[1],v[5])
end
end
surface.PlaySound(Sound( "buttons/button14.wav" ))
end
-----
local textbox2=vgui.Create("DTextEntry",MakePanelRECH)
textbox2:SetWide(150)
textbox2:SetText("STEAM_0:0:00000000")
textbox2:SetPos(0,35)
local textbox3=vgui.Create("DTextEntry",MakePanelRECH)
textbox3:SetPos(155,35)
textbox3:SetWide(150)
textbox3:SetText("Name here")

local butanad=vgui.Create("DButton",MakePanelRECH)
butanad:SetText(tra_ajt)
butanad:SetPos(330,35)
butanad:SetWide(100)
butanad.Paint=function()
draw.RoundedBox(6,0,0,butanad:GetWide(),butanad:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butanad:GetWide()-2,butanad:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butanad:GetTall()-1-butanad:GetTall()/3,butanad:GetWide()-2,butanad:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/add.png"))surface.DrawTexturedRect(4,3,16,16)
end
butanad.DoClick=function()
local steamid64=util.SteamIDTo64(textbox2:GetText())
butan.List:AddLine(steamid64,textbox3:GetText(),LocalPlayer():Name(),tostring(os.date()))
--RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), "Full Access" )
RunConsoleCommand( "wjs_addbuto", steamid64,textbox3:GetText(), textbox1:GetText() )
Nordah_Whitelist_Job.AddWhitelist({LocalPlayer():Name(),steamid64,textbox3:GetText(),textbox1:GetText(),tostring( os.date() )})
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local butanc=vgui.Create("DButton",MakePanelRECH)
butanc:SetText("CleanUp")
butanc:SetPos(440,35)
butanc:SetWide(100)
butanc.Paint=function()
draw.RoundedBox(6,0,0,butanc:GetWide(),butanc:GetTall(),Color(255,0,0,255))
draw.RoundedBox(6,1,1,butanc:GetWide()-2,butanc:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butanc:GetTall()-1-butanc:GetTall()/3,butanc:GetWide()-2,butanc:GetTall()/3,Color(255,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/bin.png"))surface.DrawTexturedRect(4,3,16,16)
end
butanc.DoClick=function()
butan.List:Clear()
for c,b in pairs(ZJOBwhitelist)do
if b[4]==textbox1:GetText() then
ZJOBwhitelist[c]=nil
end
end
RunConsoleCommand( "cleanup_joblist",textbox1:GetText())
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

butanwarning=vgui.Create("DButton",MakePanelRECH)
butanwarning:SetText("")
butanwarning:SetPos(0,30)
butanwarning:SetSize(775,30)
butanwarning.Paint=function()--
draw.RoundedBox(6,0,0,butanwarning:GetWide(),butanwarning:GetTall(),Color(150,0,0,150))
draw.RoundedBox(6,1,1,butanwarning:GetWide()-2,butanwarning:GetTall()-2,Color(255,0,0,200))
draw.SimpleText(tra_recherch_job, "Trebuchet24", 387, 13, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
butanwarning.DoClick=function()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end


local listtrouvjo=vgui.Create("DListView",MakePanelRECH)
listtrouvjo.Paint=function()
draw.RoundedBox(8,0,0,listtrouvjo:GetWide(),listtrouvjo:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listtrouvjo:GetWide()-2,listtrouvjo:GetTall()-2,Color(255,255,255,255))
end
MakePanelRECH.List=listtrouvjo
butan.List=listtrouvjo
local col1=listtrouvjo:AddColumn("Steam ID")
col2=listtrouvjo:AddColumn(tra_nom)
col3=listtrouvjo:AddColumn(tra_ajpar)
col4=listtrouvjo:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

listtrouvjo.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listtrouvjo:RemoveLine(id)
local steamid=line:GetColumnText(1)
Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,nil,textbox1:GetText())
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listtrouvjo:RemoveLine(id)
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end

list:AddSheet(tra_scrprecherche,MakePanelRECH,"icon16/zoom.png", false, false,tra_scrprecherched)

local MakePanelFullacc=vgui.Create("DPanel")
MakePanelFullacc.InvalidateLayout=function()
if MakePanelFullacc.List then
MakePanelFullacc.List:StretchToParent(0,35,0,0)
MakePanelFullacc.Box1:SetPos(0,7)
MakePanelFullacc.Box2:SetPos(165,7)
end
end
MakePanelFullacc.Paint=function()
zradient(0,194,0,255,0,0,MenuGetWide-2,MenuGetTall-22)end
local textbox1=vgui.Create("DTextEntry",MakePanelFullacc)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
MakePanelFullacc.Box1=textbox1
local textbox2=vgui.Create("DTextEntry",MakePanelFullacc)
textbox2:SetWide(150)
textbox2:SetText("Name here")
MakePanelFullacc.Box2=textbox2
local butan=vgui.Create("DButton",MakePanelFullacc)
butan:SetText(tra_ajt)
butan:SetPos(330,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/add.png"))surface.DrawTexturedRect(4,3,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:AddLine(steamid64,textbox2:GetText(),LocalPlayer():Name(),tostring(os.date()))
RunConsoleCommand( "wjs_addbuto", steamid64,textbox2:GetText(),"Full Access")
Nordah_Whitelist_Job.AddWhitelist({LocalPlayer():Name(),steamid64,textbox2:GetText(),"Full Access",tostring( os.date() )})
surface.PlaySound(Sound( "buttons/button14.wav" ))
end
local listmetongl=vgui.Create("DListView",MakePanelFullacc)
listmetongl.Paint=function()
draw.RoundedBox(8,0,0,listmetongl:GetWide(),listmetongl:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listmetongl:GetWide()-2,listmetongl:GetTall()-2,Color(255,255,255,255))
end
MakePanelFullacc.List=listmetongl
butan.List=listmetongl
local col1=listmetongl:AddColumn("Steam ID")
col2=listmetongl:AddColumn(tra_nom)
col3=listmetongl:AddColumn(tra_ajpar)
col4=listmetongl:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

for a,z in pairs(ZJOBwhitelist)do
if( "Full Access"==z[4] )then
listmetongl:AddLine(z[2],z[3],z[1],z[5])
end
end

listmetongl.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,nil,"Full Access")
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end

list:AddSheet("Full Access",MakePanelFullacc,"icon16/accept.png", false, false,"All in this lsit have an Full Access")
-----

for k,v in pairs(Add_Job_In_the_Whiteliste)do
if v=="1" or v=="3" or v=="4" then

local metieronglet=vgui.Create("DPanel")
metieronglet.InvalidateLayout=function()
if metieronglet.List then
metieronglet.List:StretchToParent(0,35,0,0)
metieronglet.Box1:SetPos(0,7)
metieronglet.Box2:SetPos(165,7)
end
end

metieronglet.Paint=function()
zradient(0,125,194,255,0,0,MenuGetWide-2,MenuGetTall-22)
end
local textbox1=vgui.Create("DTextEntry",metieronglet)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
metieronglet.Box1=textbox1
local textbox2=vgui.Create("DTextEntry",metieronglet)
textbox2:SetWide(150)
textbox2:SetText("Name here")
metieronglet.Box2=textbox2
local butan=vgui.Create("DButton",metieronglet)
butan:SetText(tra_ajt)
butan:SetPos(330,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/add.png"))surface.DrawTexturedRect(4,3,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:AddLine(steamid64,textbox2:GetText(),LocalPlayer():Name(),tostring(os.date()))
--RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), "Full Access" )
RunConsoleCommand( "wjs_addbuto", steamid64,textbox2:GetText(), k )
Nordah_Whitelist_Job.AddWhitelist({LocalPlayer():Name(),steamid64,textbox2:GetText(),k,tostring( os.date() )})
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local butanc=vgui.Create("DButton",metieronglet)
butanc:SetText("CleanUp")
butanc:SetPos(440,5)
butanc:SetWide(100)
butanc.Paint=function()
draw.RoundedBox(6,0,0,butanc:GetWide(),butanc:GetTall(),Color(255,0,0,255))
draw.RoundedBox(6,1,1,butanc:GetWide()-2,butanc:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butanc:GetTall()-1-butanc:GetTall()/3,butanc:GetWide()-2,butanc:GetTall()/3,Color(255,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/bin.png"))surface.DrawTexturedRect(4,3,16,16)
end
butanc.DoClick=function()
butan.List:Clear()
for c,b in pairs(ZJOBwhitelist)do
if b[4]==k then
ZJOBwhitelist[c]=nil
end
end
RunConsoleCommand("cleanup_joblist",k)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local butanc=vgui.Create("DButton",metieronglet)
butanc:SetText("Disable")
butanc:SetPos(550,5)
butanc:SetWide(100)
butanc.Paint=function()
draw.RoundedBox(6,0,0,butanc:GetWide(),butanc:GetTall(),Color(255,0,0,255))
draw.RoundedBox(6,1,1,butanc:GetWide()-2,butanc:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,butanc:GetTall()-1-butanc:GetTall()/3,butanc:GetWide()-2,butanc:GetTall()/3,Color(255,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/cross.png"))surface.DrawTexturedRect(4,3,16,16)
end
butanc.DoClick=function()
RunConsoleCommand("Metajourmalist",k,"0")
Menu:Close()
timer.Simple(0.1,function()Nordah_Whitelist_Job_Menu(ply)end)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local listmetongl=vgui.Create("DListView",metieronglet)
listmetongl.Paint=function()
draw.RoundedBox(8,0,0,listmetongl:GetWide(),listmetongl:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listmetongl:GetWide()-2,listmetongl:GetTall()-2,Color(255,255,255,255))
end
metieronglet.List=listmetongl
butan.List=listmetongl
local col1=listmetongl:AddColumn("Steam ID")
col2=listmetongl:AddColumn(tra_nom)
col3=listmetongl:AddColumn(tra_ajpar)
col4=listmetongl:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

for a,z in pairs(ZJOBwhitelist)do
if( k==z[4] )then
listmetongl:AddLine(z[2],z[3],z[1],z[5])
end
end

listmetongl.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,nil,k)
surface.PlaySound(Sound("buttons/button14.wav"))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end
local nm_co=tra_wlistde
local petitpict="icon16/report.png"
if v=="1" then
petitpict="icon16/report.png"
elseif v=="3" then
petitpict="icon16/coins.png"
elseif v=="4" then
petitpict="icon16/report_delete.png"
nm_co="Blacklist"
end
list:AddSheet("Job: "..k,metieronglet,petitpict, false, false,nm_co.." '"..k.."'" )
end
end
---

for k,v in pairs(Add_JobGroup_In_the_Whiteliste)do
local metieronglet=vgui.Create("DPanel")
metieronglet.InvalidateLayout=function()
if metieronglet.List then
metieronglet.List:StretchToParent(0,35,0,0)
metieronglet.Box1:SetPos(0,7)
metieronglet.Box2:SetPos(165,7)
end
end

metieronglet.Paint=function()
zradient(229,140,38,255,0,0,MenuGetWide-2,MenuGetTall-22)
end
local textbox1=vgui.Create("DTextEntry",metieronglet)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
metieronglet.Box1=textbox1
local textbox2=vgui.Create("DTextEntry",metieronglet)
textbox2:SetWide(150)
textbox2:SetText("Name here")
metieronglet.Box2=textbox2
local butan=vgui.Create("DButton",metieronglet)
butan:SetText(tra_ajt)
butan:SetPos(330,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/add.png"))surface.DrawTexturedRect(4,3,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:AddLine(steamid64,textbox2:GetText(),LocalPlayer():Name(),tostring(os.date()))
--RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), "Full Access" )
RunConsoleCommand( "wjs_addbuto", steamid64,textbox2:GetText(), k )
Nordah_Whitelist_Job.AddWhitelist({LocalPlayer():Name(),steamid64,textbox2:GetText(),k,tostring( os.date() )})
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local butanc=vgui.Create("DButton",metieronglet)
butanc:SetText("CleanUp")
butanc:SetPos(440,5)
butanc:SetWide(100)
butanc.Paint=function()
draw.RoundedBox(6,0,0,butanc:GetWide(),butanc:GetTall(),Color(255,0,0,255))
draw.RoundedBox(6,1,1,butanc:GetWide()-2,butanc:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butanc:GetTall()-1-butanc:GetTall()/3,butanc:GetWide()-2,butanc:GetTall()/3,Color(255,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/bin.png"))surface.DrawTexturedRect(4,3,16,16)
end
butanc.DoClick=function()
butan.List:Clear()
for c,b in pairs(ZJOBwhitelist)do
if b[4]==k then
ZJOBwhitelist[c]=nil
end
end
RunConsoleCommand("cleanup_joblist",k)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local listmetongl=vgui.Create("DListView",metieronglet)
listmetongl.Paint=function()
draw.RoundedBox(8,0,0,listmetongl:GetWide(),listmetongl:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listmetongl:GetWide()-2,listmetongl:GetTall()-2,Color(255,255,255,255))
end
metieronglet.List=listmetongl
butan.List=listmetongl
local col1=listmetongl:AddColumn("Steam ID")
col2=listmetongl:AddColumn(tra_nom)
col3=listmetongl:AddColumn(tra_ajpar)
col4=listmetongl:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

for a,z in pairs(ZJOBwhitelist)do
if( k==z[4] )then
listmetongl:AddLine(z[2],z[3],z[1],z[5])
end
end

listmetongl.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,nil,k)
surface.PlaySound(Sound("buttons/button14.wav"))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end
local nm_co=tra_wlistde
local petitpict="icon16/report.png"
if v=="1" then
petitpict="icon16/report.png"
elseif v=="3" then
petitpict="icon16/coins.png"
elseif v=="4" then
petitpict="icon16/report_delete.png"
nm_co="Blacklist"
end
list:AddSheet("Category: "..k,metieronglet,petitpict, false, false,nm_co.." '"..k.."'" )

end

for k,v in pairs( player.GetAll() ) do
local pos = v:GetPos()
local lgr = LocalPlayer():GetPos():Distance( pos )
local lgr=lgr/10
local lgr2=255-lgr
local lgr3=math.Round(lgr/5)
local mon=stringifycash(v:getDarkRPVar("money")or 0)
listview:AddLine( v:Name(),mon,v:SteamID(),team.GetAllTeams()[v:Team()].Name,lgr3)
table.insert( players, v )
end
listview.OnRowRightClick = function( pnl, id, line )
local menu = vgui.Create( "DMenu", panel )
local pl = players[id]
local steamid64=pl:SteamID64()
for k,v in pairs( Nordah_Whitelist_Job.Commands ) do
if not v.Args then
else
menu:AddSpacer()
menu.Paint=function()draw.RoundedBox(4,0,0,menu:GetWide(),menu:GetTall(),Color(84,132,240,255))draw.RoundedBox(4,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))end

local submenu,optMenu = menu:AddSubMenu(tra_ajdalwdumetier)
if v.CommandName=="wjs_addwhite" then
optMenu:SetIcon("ngui/wljs.png")
end

local trij={}
for k,v2 in pairs(RPExtraTeams) do
local c=v2.category
local c2=v2.name
if !trij[c] then
trij[c]={}
end
if trij[c] then
for az,d in pairs( v.Args ) do
if c2==d.Value then
table.insert(trij[c],{Value=d.Value,Name=d.Name})
end
end
end
end

for m,p in pairs(trij) do
local submenu2,optMenu2 = submenu:AddSubMenu(m)
if v.CommandName=="wjs_addwhite" then
optMenu2:SetIcon("ngui/wljs.png")submenu:AddSpacer()
submenu.Paint=function()draw.RoundedBox(4,0,0,submenu:GetWide(),submenu:GetTall(),Color(84,132,240,255))draw.RoundedBox(4,1,1,submenu:GetWide()-2,submenu:GetTall()-2,Color(255,255,255,255))end
end

for c,d in pairs(p) do
local arg = d.Value
local Name=d.Name
if Add_Job_In_the_Whiteliste[Name] then
if Add_Job_In_the_Whiteliste[Name]!="2" and Add_Job_In_the_Whiteliste[Name]!="4" then
submenu2:AddSpacer()
submenu2:AddOption(Name,function()
if IsValid( pl ) then
if type( arg ) == "table" then
if not v.Clientside then
local newtbl = {}
for k,v in pairs( arg ) do
table.insert( newtbl, tostring( v ) )
end
print("newtbl : ", v.CommandName, pl:EntIndex(), unpack( newtbl ) )
RunConsoleCommand( v.CommandName, pl:EntIndex(), unpack( newtbl ) )
end
else
if not v.Clientside then
RunConsoleCommand( v.CommandName, pl:EntIndex(), arg )
print("arg : ", v.CommandName, pl:EntIndex(), arg )
end
end
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end
end):SetIcon("icon16/add.png")
end
end
submenu2.Paint=function()draw.RoundedBox(4,0,0,submenu2:GetWide(),submenu2:GetTall(),Color(84,132,240,255))draw.RoundedBox(4,1,1,submenu2:GetWide()-2,submenu2:GetTall()-2,Color(255,255,255,255))end
end
end

local submenu,optMenu=menu:AddSubMenu("Add in the category whitelist")
if v.CommandName=="wjs_addwhite" then
optMenu:SetIcon("ngui/wlgs.png")
end

for c,d in pairs( Add_JobGroup_In_the_Whiteliste ) do
submenu:AddSpacer()
submenu:AddOption(c,function()
if IsValid( pl ) then
RunConsoleCommand("wjs_addwhite2", pl:EntIndex(), c )
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end
end):SetIcon("icon16/add.png")

end

menu:AddOption( "Full Access", function()
if IsValid( pl ) then
if type( arg ) == "table" then
if not v.Clientside then
local newtbl = {}
for k,v in pairs( arg ) do
table.insert( newtbl, tostring( v ) )
end
jswl_chat(LocalPlayer(),"jswl_chat",{pl:EntIndex(),1,"Full Access"})
RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), unpack( newtbl ) )
end
else
if not v.Clientside then

jswl_chat(LocalPlayer(),"jswl_chat",{pl:EntIndex(),1,"Full Access"})
RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), "Full Access" )
end
end
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end
end):SetIcon("icon16/add.png")
menu:AddSpacer()

local submenu,optMenu = menu:AddSubMenu(tra_ajdalbdumetier)
if v.CommandName=="wjs_addwhite" then
optMenu:SetIcon("icon16/cross.png")
end
for c,d in pairs( v.Args ) do
local arg = d.Value
if Add_Job_In_the_Whiteliste[d.Name] then
if Add_Job_In_the_Whiteliste[d.Name]=="4" then
submenu:AddSpacer()
submenu:AddOption( d.Name, function()
if IsValid( pl ) then
if type( arg ) == "table" then
if not v.Clientside then
local newtbl = {}
for k,v in pairs( arg ) do
table.insert( newtbl, tostring( v ) )
end
print("newtbl : ", v.CommandName, pl:EntIndex(), unpack( newtbl ) )
RunConsoleCommand( v.CommandName, pl:EntIndex(), unpack( newtbl ) )
end
else
if not v.Clientside then
RunConsoleCommand( v.CommandName, pl:EntIndex(), arg )
print("arg : ", v.CommandName, pl:EntIndex(), arg )
end
end
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end
end):SetIcon("icon16/add.png")
end
end
end
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(line:GetColumnText(3))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
if IsValid( pl ) then
jswl_chat(LocalPlayer(),"jswl_chat",{pl:EntIndex(),3,"nil"})
RunConsoleCommand("Massremovewhitelist",steamid64)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid64 then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
end
end):SetImage("icon16/bin.png")
menu:AddSpacer()

end
end
menu:Open()
end
end
concommand.Add("whitelist_systemjob", Nordah_Whitelist_Job_Menu )
concommand.Add("whitelist_menu", Nordah_Whitelist_Job_Menu )
concommand.Add("whitelist", Nordah_Whitelist_Job_Menu )

function Nordah_Whitelist_Job.Print( tbl )end
function ntsysjobwi(a,b,c)sysjobwi=tostring(c[1]) end
concommand.Add("ntsysjobwi",ntsysjobwi)
function ntsyscatwi(a,b,c)syscatwi=tostring(c[1]) end
concommand.Add("ntsyscatwi",ntsyscatwi)

ZJOBwhitelist={}
net.Receive("SynchAddJobwhitelist",function(len)
local pl=net.ReadString()
local id=net.ReadString()
local rs=net.ReadString()
local met=net.ReadString()
local date=net.ReadString()
local remove=tobool(net.ReadBit())
if remove then
for k,v in pairs(ZJOBwhitelist)do 
if v[2]==id and v[3]==met then
Nordah_Whitelist_Job.RemoveJobWhitelist(id,true,met)
table.remove(ZJOBwhitelist,k)
return
end
end
else
Nordah_Whitelist_Job.AddWhitelist({pl,id,rs,met,date},true)
end
end)
net.Receive("NSynchAddJob",function(len)
if zwjlist==nil then zwjlist=0 end
zwjlist=zwjlist+1
local meti=net.ReadString()
local val=net.ReadString()
if val=="0" then val=nil end
Add_Job_In_the_Whiteliste[meti]=val
end)
net.Receive("NSynchAddJob2",function(len)
if zwjlist==nil then zwjlist=0 end
zwjlist=zwjlist+1
local meti=net.ReadString()
local val=net.ReadString()
if val=="-1" then
Add_JobGroup_In_the_Whiteliste[meti]=nil
else
Add_JobGroup_In_the_Whiteliste[meti]=val
end
end)
net.Receive("SynchAllJobWhitelisted",function(len)
if zwusers==nil then zwusers=0 end
zwusers=zwusers+1
Nordah_Whitelist_Job.AddWhitelist({net.ReadString(),net.ReadString(),net.ReadString(),net.ReadString(),net.ReadString()},true)
end)

local function Metajolistcl(a)
Add_Job_In_the_Whiteliste={}
end
concommand.Add("Metajolistcl",Metajolistcl)
local function Metajogrlistcl(a)
Add_Job_In_the_Whiteliste={}
end
concommand.Add("Metajogrlistcl",Metajogrlistcl)

function Metajolist_f_G(a,b,c)
local j_nu=tostring(c[1])
Add_Job_In_the_Whiteliste={}
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
if "Citizen"!=v.Name then
if j_nu==nil or "0" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="1" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="2" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="3" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
end
end
end
end
concommand.Add("Metajolist_f_G",Metajolist_f_G)

function Nordah_Whitelist_Job.whitelistexist(steamid)
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
return false 
end
end
end
function Nordah_Whitelist_Job.AddWhitelist(tbl,override)
if Nordah_Whitelist_Job.whitelistexist(tbl[2])then return end
table.insert(ZJOBwhitelist,tbl)
if override then return end
end
function Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,override,job)
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid and v[4]==job then
table.remove(ZJOBwhitelist,k)
if override then return end
RunConsoleCommand("wjs_remove_whitelist",steamid,job)
return
end
end
end

local args={}
timer.Simple(15,function()
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
table.insert(args,{Name=v.Name,Value=v.Name})
end
end)
Nordah_Whitelist_Job.RegisterCommand(f2panadwl,"wjs_addwhite","Add In WhiteList",args,true)


local function whitelist_update(a,b,c)
if c[1]==nil then print("This is not the right command, Nordahl. ^^") return end
if zwjlist==nil then zwjlist=0 end
if zwclist==nil then zwclist=0 end
if zwusers==nil then zwusers=0 end
local numline=tonumber(c[1])
local numline2=tonumber(c[2])
sysjobwi=tostring(c[3])
syscatwi=tostring(c[4])

local zloairme=CurTime()
if loadbar then loadbar:Remove() end
loadbar=vgui.Create("DFrame")
loadbar:SetPos(0,0)
loadbar:SetSize(ScrW(),ScrH())
loadbar:SetTitle("")
loadbar:SetDraggable(false)
loadbar:ShowCloseButton(false)
loadbar.Think=function()
if zwusers>=numline then
zwusers=numline
end
if zwjlist>=numline2 then
zwjlist=numline2
end
if (zwusers>=numline and zwjlist>=numline2) then
loadbar:Remove()
end
end
local scrW=ScrW()-185
local scrH=ScrH()-100
loadbar.Paint=function()
draw.RoundedBox(4,(scrW)-176,(scrH)-1,352,92,Color(0,117,223,255))
draw.RoundedBox(4,(scrW)-175,(scrH),350,90,Color(255,255,255,255))
draw.SimpleText(WhitelistJobSystem..": "..tra_init, "Trebuchet18",scrW,(scrH)+9, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
draw.SimpleText("Jobs: "..zwjlist.."/"..numline2, "Trebuchet18",scrW,(scrH)+25, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
draw.SimpleText(tra_susermax..": "..zwusers.."/"..numline, "Trebuchet18",scrW,(scrH)+40, Color(0,0,0),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
draw.RoundedBox(4,(scrW)-151,(scrH)+69-20,302,12,Color(0,117,223,255))
draw.RoundedBox(4,(scrW)-150,(scrH)+70-20,300,10,Color(0,0,50,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+70-20,(300/numline2)*zwjlist,10,Color(0,117,223,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+76-20,(300/numline2)*zwjlist,4,Color(0,125,194,255))
surface.SetDrawColor( 255,255,255, 255 )
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect((scrW)-170,(scrH)+67-20,16,16)
draw.RoundedBox(4,(scrW)-151,(scrH)+69,302,12,Color(0,117,223,255))
draw.RoundedBox(4,(scrW)-150,(scrH)+70,300,10,Color(0,0,50,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+70,(300/numline)*zwusers,10,Color(0,117,223,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+76,(300/numline)*zwusers,4,Color(0,125,194,255))
surface.SetDrawColor( 255,255,255, 255 )
surface.SetMaterial(Material("icon16/report.png"))surface.DrawTexturedRect((scrW)-170,(scrH)+67,16,16)
end
end
concommand.Add("whitelist_update",whitelist_update)

function PlychangeAllowed(ply,job)
local SteamID64=ply:SteamID64()
local Job=job
for k,v in pairs(ZJOBwhitelist)do
if v[2]==SteamID64 then
if Job==v[4] or v[4]=="Full Access" then
return true
end
end
end
if Add_Job_In_the_Whiteliste[Job]=="3" then
for _,c in ipairs(nordahl_cfg_1402.ULX_DONATOR_RANK)do if c==ply:GetUserGroup() then return true end end
end
return false
end
concommand.Add("PlychangeAllowed",PlychangeAllowed)

local function nord_context(ent)
local ent,SteamID,SteamID64,EntIndex=ent,ent:SteamID(),ent:SteamID64(),ent:EntIndex()
jco_menu = vgui.Create("DFrame")
jco_menu:SetSize(200,24)
jco_menu:SetPos(ScrW()/2+150,ScrH()/2-150)
jco_menu:SetTitle(" ")
jco_menu:SetDraggable(true)
jco_menu:ShowCloseButton(false)
jco_menu:MakePopup()
jco_menu.Paint=function()
if !IsValid(ent) then
jco_menu:Remove()
jco_menu=nil
return end
end
local jo_but=vgui.Create("DButton",jco_menu)
jo_but:SetText("")
jo_but:SetSize(200,24)
jo_but:SetPos(0,0)
jo_but.Paint=function()
draw.RoundedBox(4,0,0,jo_but:GetWide(),jo_but:GetTall(),Color(26,138,200,255))
draw.RoundedBox(4,1,1,jo_but:GetWide()-2,jo_but:GetTall()-2,Color(255,255,255,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(4,4,16,16)
draw.SimpleText(WhitelistJobSystem..wjl, "Trebuchet18", 28, 12, Color(26,138,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
jo_but.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
if jco_menu then
jco_menu:Remove()
jco_menu=nil
end
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu(tra_ajdalwdumetier)
optMenu:SetIcon("ngui/wljs.png")
for k,v in pairs( Nordah_Whitelist_Job.Commands ) do
if not v.Args then
else

local trij={}
for k,v2 in pairs(RPExtraTeams) do
local c=v2.category
local c2=v2.name
if !trij[c] then
trij[c]={}
end
if trij[c] then
for az,d in pairs( v.Args ) do
if c2==d.Value then
table.insert(trij[c],{Value=d.Value,Name=d.Name})
end
end
end
end

for m,p in pairs(trij) do
local submenu2,optMenu2 = subMenu:AddSubMenu(m)
if v.CommandName=="wjs_addwhite" then
optMenu2:SetIcon("ngui/wljs.png")subMenu:AddSpacer()
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(84,132,240,255))draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
end

for c,d in pairs(p) do
local arg = d.Value
local jnom=d.Name
if Add_Job_In_the_Whiteliste[jnom] then
if Add_Job_In_the_Whiteliste[jnom]!="2" and Add_Job_In_the_Whiteliste[jnom]!="4" then
submenu2:AddSpacer()
submenu2:AddOption(jnom,function()surface.PlaySound( Sound( "buttons/button14.wav" ) )
RunConsoleCommand("wjs_addwhite",EntIndex,arg)end):SetImage("icon16/add.png")
submenu2:AddSpacer()
end
end
submenu2.Paint=function()draw.RoundedBox(4,0,0,submenu2:GetWide(),submenu2:GetTall(),Color(84,132,240,255))draw.RoundedBox(4,1,1,submenu2:GetWide()-2,submenu2:GetTall()-2,Color(255,255,255,255))end
end
end

end
end
subMenu.Paint=function()
draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(26,138,200,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))
end

z4:AddSpacer()
local subMenu,optMenu=z4:AddSubMenu("Add in Job Category")
optMenu:SetIcon("ngui/wlgs.png")

for c,d in pairs( Add_JobGroup_In_the_Whiteliste ) do
subMenu:AddSpacer()
subMenu:AddOption(c,function()
RunConsoleCommand("wjs_addwhite2", EntIndex, c )
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end):SetImage("icon16/add.png")
end
subMenu.Paint=function()
draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(26,138,200,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))
end

z4:AddSpacer()
z4:AddOption("Add in Full Access List",function()
jswl_chat(LocalPlayer(),"jswl_chat",{EntIndex,1,"Full Access"})
RunConsoleCommand("wjs_addwhite",EntIndex,"Full Access")end):SetImage("icon16/add.png")
z4:AddSpacer()
z4:AddOption(zaddsupprall,function()
jswl_chat(LocalPlayer(),"jswl_chat",{EntIndex,3,"nil"})
RunConsoleCommand("Massremovewhitelist",SteamID64)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==SteamID64 then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
end):SetImage("icon16/cross.png")
z4:AddSpacer()
local subMenu,optMenu=z4:AddSubMenu("Delete from one job")
optMenu:SetIcon("icon16/cross.png")
for k,v in pairs(ZJOBwhitelist)do 
if v[2]==SteamID64 then
subMenu:AddOption(v[4],function()
table.remove(ZJOBwhitelist,k)
surface.PlaySound(Sound( "buttons/button14.wav" ))
jswl_chat(a,b,{EntIndex,2,v[4]})
RunConsoleCommand("wjs_remove_whitelist",SteamID64,v[4])
end):SetImage("icon16/cross.png")
subMenu:AddSpacer()
end
end
subMenu.Paint=function()
draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(26,138,200,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))
end
z4:AddSpacer()
surface.PlaySound(Sound( "buttons/button14.wav" ))
local subMenu,optMenu=z4:AddSubMenu("Copy SteamID")
optMenu:SetIcon("icon16/application_double.png")
subMenu:AddOption("Copy SteamID64      : "..SteamID64,function()SetClipboardText(SteamID64)LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
subMenu:AddSpacer()
subMenu:AddOption("Copy SteamID normal : "..SteamID,function()SetClipboardText(SteamID)LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
subMenu.Paint=function()
draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(26,138,200,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))
end
z4:AddSpacer()
z4:AddOption(WhitelistJobSystem..wjl.." (Menu Shortcut)",function()RunConsoleCommand("whitelist_systemjob")end):SetImage("ngui/wljs.png")
z4:AddSpacer()
z4.Paint=function()
draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(26,138,200,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))
end
z4:Open()
end
end

function jswl_nord_context(a,b,c)
nord_context(LocalPlayer())
end
concommand.Add("jswl_nord_context",jswl_nord_context)


local z4=nil
hook.Add( "OnContextMenuOpen","nordahl_contextmenu_whjs_1",function(a,b,c)
if eRight(LocalPlayer())==true then
local etr=LocalPlayer():GetEyeTrace()
local ent=etr.Entity
if IsValid(ent) then
if ent:IsPlayer()==true then
nord_context(ent)
end
else
print("Press 'Context Menu' when you look the player to see the action you can do with the whitelistjob system")
end
else
if  cfg.chat_msg_warn==1 then
chat.AddText(Color(45,148,255),WhitelistJobSystem..wjl.." [System] ",Color(255,255,255),"You are not Admin, please configure your administration System or add your steamid in the config file. Thank you.")
chat.AddText(Color(45,148,255),"Nordahl")
end
end
end)

hook.Add( "OnContextMenuClose","nordahl_contextmenu_whjs_0",function(a,b,c)
if jco_menu then
jco_menu:Remove()
jco_menu=nil
end
end)

local tab_c={
[1]={Color(45,148,225),"Added in"},
[2]={Color(255,0,0),"Removed from"},
[3]={Color(255,0,0),"Was removed from all jobs whitelist"},
}

function jswl_chat(a,b,c)
local ent=Entity(c[1])
local num=tonumber(c[2])
local tab=tab_c[num]
local nom=""
if IsValid(ent)then
nom=ent:Nick()
end
local cpalet=tab[1]
local txt=tab[2]
if b=="jswl_chat" then
if num!=3 then
chat.AddText(cpalet,WhitelistJobSystem..wjl.." [System] ",Color(255,242,207),nom.." ",Color(255,255,255),txt.." : ",cpalet,c[3])
else
chat.AddText(cpalet,WhitelistJobSystem..wjl.." [System] ",Color(255,242,207),nom.." ",Color(255,255,255),txt)
end
else
if num!=3 then
chat.AddText(cpalet,CategoryJobSystem..wjl.." [System] ",Color(255,242,207),nom.." ",Color(229,140,38),txt.." : ",cpalet,c[3])
else
chat.AddText(cpalet,CategoryJobSystem..wjl.." [System] ",Color(255,242,207),nom.." ",Color(229,140,38),txt)
end
end
end
concommand.Add("jswl_chat",jswl_chat)
concommand.Add("jswl_chat2",jswl_chat)

function jswl_chat3(a,b,c)
local str=c[1]
chat.AddText(Color(26,138,200),"Nordahl whitelist job  [System] : ",Color(255,255,255),str)
end
concommand.Add("jswl_chat3",jswl_chat3)

function jswl_m_chat(a,b,c)
local nom=c[1]
local num=tonumber(c[2])
local tab=tab_c[num]
local cpalet=tab[1]
local txt=tab[2]
if num!=3 then
chat.AddText(cpalet,WhitelistJobSystem..wjl.." [System] ",Color(255,242,207),nom.." ",Color(255,255,255),txt.." : ",cpalet,c[3])
else
chat.AddText(cpalet,WhitelistJobSystem..wjl.." [System] ",Color(255,242,207),nom.." ",Color(255,255,255),txt)
end
end
concommand.Add("jswl_m_chat",jswl_m_chat)
--PATH addons/gmodadminsuite-config-master/lua/openpermissions_lua_functions.lua:
--[[

	    __                   ______                 __  _                 
	   / /   __  ______ _   / ____/_  ______  _____/ /_(_)___  ____  _____
	  / /   / / / / __ `/  / /_  / / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
	 / /___/ /_/ / /_/ /  / __/ / /_/ / / / / /__/ /_/ / /_/ / / / (__  ) 
	/_____/\__,_/\__,_/  /_/    \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/  
	                                                                      

	Welcome to the Lua functions config.
	OpenPermissions has been designed to be as customizable as possible.
	In this configuration, you can define custom Lua functions which OpenPermissions can use.

	These Lua functions can be used as Access Groups, which allow you to assign permissions to people
	who successfully pass your own custom Lua code.

]]

return {
	["example_function"] = function(ply, permission_id)
		if (ply:SteamID() == "STEAM_0:1:40314158" or ply:SteamID64() == "76561198112561190") then
			return true -- allow!
		elseif (ply:SteamID() == "STEAM_0:1:7099") then
			return false -- disallow!
		else
			return -- ignore!
		end
	end,
}

--PATH addons/pcasino/lua/perfectcasino/core/sh_core.lua:
-- The letters bodygroup and width
PerfectCasino.Core.Letter = {
	["a"] = {b = 0, w = 5},
	["b"] = {b = 1, w = 4},
	["c"] = {b = 2, w = 4.2},
	["d"] = {b = 3, w = 4.5},
	["e"] = {b = 4, w = 3.7},
	["f"] = {b = 5, w = 3.6},
	["g"] = {b = 6, w = 5},
	["h"] = {b = 7, w = 5},
	["i"] = {b = 8, w = 2},
	["j"] = {b = 9, w = 3.2},
	["k"] = {b = 10, w = 4.7},
	["l"] = {b = 11, w = 3.7},
	["m"] = {b = 12, w = 6},
	["n"] = {b = 13, w = 5},
	["o"] = {b = 14, w = 5},
	["p"] = {b = 15, w = 4},
	["q"] = {b = 16, w = 5},
	["r"] = {b = 17, w = 4.7},
	["s"] = {b = 18, w = 4},
	["t"] = {b = 19, w = 4.5},
	["u"] = {b = 20, w = 4.5},
	["v"] = {b = 21, w = 5.2},
	["w"] = {b = 22, w = 7.3},
	["x"] = {b = 23, w = 5},
	["y"] = {b = 24, w = 4.7},
	["z"] = {b = 25, w = 4.6},
	["0"] = {b = 26, w = 4.2},
	["1"] = {b = 27, w = 3},
	["2"] = {b = 28, w = 4},
	["3"] = {b = 29, w = 3.8},
	["4"] = {b = 30, w = 4.4},
	["5"] = {b = 31, w = 3.8},
	["6"] = {b = 32, w = 4.1},
	["7"] = {b = 33, w = 4.1},
	["8"] = {b = 34, w = 4.2},
	["9"] = {b = 35, w = 4.1},
	["-"] = {b = 36, w = 2.7},
	["!"] = {b = 37, w = 2},
	["."] = {b = 38, w = 2.3}
}

-- Who has "admin" perms
function PerfectCasino.Core.Access(user)
	if not IsValid(user) then return false end
	return PerfectCasino.Config.AccessGroups[user:GetUserGroup()] or PerfectCasino.Config.AccessGroups[user:SteamID64()] or PerfectCasino.Config.AccessGroups[user:SteamID()]
end

-- Chat messages
function PerfectCasino.Core.Msg(msg, ply)
	if SERVER then
		net.Start("pCasino:Msg")
			net.WriteString(msg)
		if not ply then
			net.Broadcast()
		else
			net.Send(ply)
		end
	else
		chat.AddText(PerfectCasino.Config.PrefixColor, PerfectCasino.Config.Prefix..": ", Color( 255, 255, 255 ), msg)
	end
end


if SERVER then return end

net.Receive("pCasino:Msg", function()
	PerfectCasino.Core.Msg(net.ReadString())
end)


--PATH addons/pcasino/lua/perfectcasino/core/sh_config.lua:
PerfectCasino.Core.Entites = PerfectCasino.Core.Entites or {}
function PerfectCasino.Core.RegisterEntity(class, data, model)
	PerfectCasino.Core.Entites[class] = {}
	PerfectCasino.Core.Entites[class].cache = {}
	PerfectCasino.Core.Entites[class].config = data
	PerfectCasino.Core.Entites[class].model = model
end

function PerfectCasino.Core.GetEntityConfigOptions(class)
	return PerfectCasino.Core.Entites[class].config
end

if SERVER then return end

function PerfectCasino.Core.RequestConfigData(entity)
	net.Start("pCasino:RequestData:Send")
		net.WriteEntity(entity)
	net.SendToServer()
end

net.Receive("pCasino:RequestData:Respond", function()
	local ent = net.ReadEntity()
	if not ent then return end

	local data = net.ReadTable()
	ent.data = data
	ent:PostData()
end)
--PATH addons/pcasino/lua/perfectcasino/core/sh_card.lua:
-- Build a deck
local allCards = {}
-- hearts, diamonds, spades, clubs
for _, s in pairs({"h", "d", "s", "c"}) do
	for _, v in pairs{"a", 2, 3, 4, 5, 6, 7, 8, 9, "t", "j", "k", "q"} do -- We use 't' instead of '10' so that we can just check the 2nd value for what the card is worth
		table.insert(allCards, s..v)
	end
end

function PerfectCasino.Cards:GetRandom()
	local card = table.Random(allCards)

	--return "sq"
	return card
end

function PerfectCasino.Cards:GetValue(card, sum)
	local v = card[2]
	if not v then return false end

	if (v == "t") or (v == "j") or (v == "k") or (v == "q") then
		return 10
	elseif v == "a" then
		if sum then -- Check if we're basing it off a current evaluation
			if sum <= 10 then -- If the current sum is less than 11, we can return 11 without going bust
				return 11
			end

			return 1 -- Return 1 as a fallback
		end

		return 11
	else
		return tonumber(v)
	end
end

-- The card var must be a table of cards in the format obtained with PerfectCasino.Cards:GetRandom()
function PerfectCasino.Cards:GetHandValue(cards)
	local totalValue = 0
	local aces = 0

	for k, v in pairs(cards) do
		-- We calculate the aces after we've summmed up the total
		if v[2] == "a" then
			aces = aces + 1
			continue
		end
		totalValue = totalValue + PerfectCasino.Cards:GetValue(v)
	end

	if aces > 0 then
		for i=1, aces do
			totalValue = totalValue + PerfectCasino.Cards:GetValue("ha", totalValue) -- It doesn't matter the card we give it, as long as it's an ace
		end
	end

	return totalValue
end

local skins = {["h"] = 0, ["d"] = 1, ["c"] = 2, ["s"] = 3}
local bodygroups = {["a"] = 0, ["2"] = 1, ["3"] = 2, ["4"] = 3, ["5"] = 4, ["6"] = 5, ["7"] = 6, ["8"] = 7, ["9"] = 8, ["t"] = 9, ["j"] = 10, ["q"] = 11, ["k"] = 12}
function PerfectCasino.Cards:GetFaceData(card)
	if not card then return end

	return skins[card[1]] or 0, bodygroups[card[2]] or 0
end
--PATH addons/sam-157/lua/sam/libs/sh_netstream.lua:
if SAM_LOADED then return end

--[[
	NetStream - 2.0.1
	https://github.com/alexgrist/NetStream/blob/master/netstream2.lua

	Alexander Grist-Hucker
	http://www.revotech.org
]]--

--[[
	if SERVER then
		netstream.Hook("Hi", function(ply, ...) -- Third argument is called to check if the player has permission to send the net message before decoding
			print(...)
		end, function(ply)
			if not ply:IsAdmin() then
				return false
			end
		end)
		-- OR
		netstream.Hook("Hi", function(ply, ...)
			print(...)
		end)
		netstream.Start(Entity(1), "Hi", "a", 1, {}, true, false, nil, "!") -- First argument player or table of players or any other argument to send to all players
		netstream.Start({Entity(1), Entity(2)}, "Hi", "a", 1, {}, true, false, nil, "!")
		netstream.Start(nil, "Hi", "a", 1, {}, true, false, nil, "!")
	end
	if CLIENT then
		netstream.Hook("Hi", function(...)
			print(...)
		end)
		netstream.Start("Hi", "a", 1, {}, true, false, nil, "!")
	end
]]--

-- Config

local addonName = "SAM"
local mainTable = sam -- _G.netstream = netstream

local sfs = sam.sfs
local encode_array = sfs.encode_array
local decode = sfs.decode

--

local type = sam.type
local unpack = unpack

local net = net
local compress = util.Compress
local decompress = util.Decompress

local netStreamSend = addonName .. ".NetStreamDS.Sending"

local netstream = {}
if istable(mainTable) then
	mainTable.netstream = netstream
end

local checks = {}
local receivers = {}

if SERVER then
	util.AddNetworkString(netStreamSend)

	local player_GetAll = player.GetAll
	function netstream.Start(ply, name, ...)
		if #name > 31 then
			error("netstream.Start name too long")
		end

		local ply_type = type(ply)
		if ply_type ~= "Player" and ply_type ~= "table" then
			ply = player_GetAll()
		end

		local array_length = select("#", ...)
		local encoded_data = encode_array({name, array_length, ...}, array_length + 2)

		net.Start(netStreamSend)
			net.WriteBool(false)
			net.WriteData(encoded_data)
		net.Send(ply)
	end

	function netstream.StartCompressed(ply, name, ...)
		if #name > 31 then
			error("netstream.Start name too long")
		end

		local ply_type = type(ply)
		if ply_type ~= "Player" and ply_type ~= "table" then
			ply = player_GetAll()
		end

		local array_length = select("#", ...)
		local encoded_data = encode_array({name, array_length, ...}, array_length + 2)

		local compressed_data = compress(encoded_data)

		net.Start(netStreamSend)
			net.WriteBool(true)
			net.WriteData(compressed_data)
		net.Send(ply)
	end

	function netstream.Hook(name, callback, check)
		if #name > 31 then
			error("netstream.Hook name too long")
		end

		receivers[name] = callback
		if type(check) == "function" then
			checks[name] = check
		end
	end

	net.Receive(netStreamSend, function(_, ply)
		local name = net.ReadString()

		local callback = receivers[name]
		if not callback then return end

		local length = net.ReadUInt(16)

		local check = checks[name]
		if check and check(ply, length) == false then return end

		local binary_data = net.ReadData(length)

		local decoded_data = decode(binary_data)
		if type(decoded_data) ~= "table" then return end

		local array_length = decoded_data[1]
		if type(array_length) ~= "number" then return end
		if array_length < 0 then return end

		callback(ply, unpack(decoded_data, 2, array_length + 1))
	end)
else
	checks = nil

	function netstream.Start(name, ...)
		if #name > 31 then
			error("netstream.Start name too long")
		end

		local array_length = select("#", ...)
		local encoded_data = encode_array({array_length, ...}, array_length + 1)

		local length = #encoded_data

		net.Start(netStreamSend)
			net.WriteString(name)
			net.WriteUInt(length, 16)
			net.WriteData(encoded_data, length)
		net.SendToServer()
	end

	function netstream.Hook(name, callback)
		receivers[name] = callback
	end

	net.Receive(netStreamSend, function(len)
		local compressed = net.ReadBool()
		local binary_data = net.ReadData((len - 1) / 8)

		if compressed then
			binary_data = decompress(binary_data)
			if not binary_data then return end
		end

		local decoded_data, err, err2 = decode(binary_data)
		if err ~= nil then
			sam.print("NetStream error: " .. err .. err2)
			return
		end

		local name = decoded_data[1]

		local callback = receivers[name]
		if not callback then return end

		callback(unpack(decoded_data, 3, decoded_data[2] + 2))
	end)
end

return netstream

--PATH addons/sam-157/lua/sam/libs/sh_globals.lua:
if SAM_LOADED then return end

local sam, netstream = sam, sam.netstream

local globals

if SERVER then
	globals = {}
	local order = {}

	local get_order_key = function(key)
		for i = 1, #order do
			if order[i] == key then
				return i
			end
		end
	end

	function sam.set_global(key, value, force)
		if force or globals[key] ~= value then
			globals[key] = value

			if value ~= nil then
				if not get_order_key(key) then
					table.insert(order, key)
				end
			else
				local i = get_order_key(key)
				if i then
					table.remove(order, i)
				end
			end

			netstream.Start(nil, "SetGlobal", key, value)
		end
	end

	hook.Add("SAM.PlayerNetReady", "SAM.SendGlobals", function(ply)
		netstream.StartCompressed(ply, "SendGlobals", globals, order)
	end)
end

if CLIENT then
	function sam.set_global(key, value)
		if globals then
			globals[key] = value
			hook.Call("SAM.ChangedGlobalVar", nil, key, value)
		end
	end
	netstream.Hook("SetGlobal", sam.set_global)

	netstream.Hook("SendGlobals", function(vars, order)
		globals = vars

		for _, key in ipairs(order) do
			hook.Call("SAM.ChangedGlobalVar", nil, key, vars[key])
		end
	end)
end

function sam.get_global(key, default)
	if globals then
		local value = globals[key]
		if value ~= nil then
			return value
		end
	end

	return default
end

--PATH addons/sam-157/lua/sam/sh_lang.lua:
if SAM_LOADED then return end

local lang = sam.load_file("sam_language.lua", "sh")

local original = lang
if not isstring(lang) then
	lang = "english"
end

local lang_path = "sam_languages/" .. lang .. ".lua"

if not file.Exists(lang_path, "LUA") then
	lang_path = "sam_languages/english.lua"
	if not file.Exists(lang_path, "LUA") then
		-- maybe they deleted english lang????
		sam.print("SAM is broken!")
		sam.print("Language '" .. tostring(original) .. "' doesn't exist and 'english' language file doesn't exist")
		return false
	else
		sam.print("Language '" .. tostring(original) .. "' doesn't exist falling back to english")
	end
end

local Language = sam.load_file(lang_path, "sh_")

local sub, find = string.sub, string.find

local white_color = Color(236, 240, 241)

do
	local args = {}
	function sam.add_message_argument(arg, func)
		if isstring(arg) and isfunction(func) then
			args[arg] = func
		end
	end

	local insert = function(t, v)
		t.__cnt = t.__cnt + 1
		t[t.__cnt] = v
	end

	function sam.format_message(msg, tbl, result, result_n)
		msg = Language[msg] or msg

		result = result or {}
		result.__cnt = result_n or 0

		local pos = 0
		local start, _end, arg, arg2 = nil, 0, nil, nil

		while true do
			start, _end, arg, arg2 = find(msg, "%{ *([%w_%#]+)([^%{}]-) *%}", _end)
			if not start then break end

			if pos ~= start then
				local txt = sub(msg, pos, start - 1)
				if txt ~= "" then
					insert(result, white_color)
					insert(result, txt)
				end
			end

			local ma = args[sub(arg, 1, 1)]
			if not ma then
				insert(result, "{" .. arg .. " " .. arg2 .. "}")
			else
				ma(result, tbl and tbl[arg], arg, unpack(arg2:Trim():Split(" ")))
			end

			pos = _end + 1
		end

		if pos <= #msg then
			insert(result, white_color)
			insert(result, sub(msg, pos))
		end

		return result
	end

	/*
		Admin
	*/
	sam.add_message_argument("A", function(result, admin)
		if sam.isconsole(admin) then
			-- we need to show that it's the real console!!!!!
			insert(result, Color(236, 240, 241))
			insert(result, "*")
			insert(result, Color(13, 130, 223))
			insert(result, "Console")
		else
			if sam.type(admin) == "Player" then
				if CLIENT and LocalPlayer() == admin then
					insert(result, Color(255, 215, 0))
					insert(result, sam.language.get("You"))
				else
					insert(result, Color(13, 130, 223))
					insert(result, admin:Name())
				end
			else
				insert(result, Color(13, 130, 223))
				insert(result, admin)
			end
		end
	end)

	/*
		Target(s)
	*/
	sam.add_message_argument("T", function(result, targets)
		for k, v in ipairs(sam.get_targets_list(targets)) do
			insert(result, v)
		end
	end)

	/*
		Value(s)
	*/
	sam.add_message_argument("V", function(result, value)
		insert(result, Color(0, 230, 64))
		insert(result, tostring(value))
	end)

	/*
		Text(s)
	*/
	sam.add_message_argument("S", function(result, text, _, color)
		insert(result, sam.get_color(color) or white_color)
		insert(result, tostring(text))
	end)

	-- https://gist.github.com/fernandohenriques/12661bf250c8c2d8047188222cab7e28
	local hex_rgb = function(hex)
		local r, g, b
		if #hex == 4 then
			r, g, b = tonumber(hex:sub(2, 2), 16) * 17, tonumber(hex:sub(3, 3), 16) * 17, tonumber(hex:sub(4, 4), 16) * 17
		else
			r, g, b = tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16)
		end

		if not r or not g or not b then
			return color_white
		end

		return Color(r, g, b)
	end

	/*
		Colored Text(s)
	*/
	sam.add_message_argument("#", function(result, _, color, ...)
		local text = table.concat({...}, " ")
		insert(result, hex_rgb(color))
		insert(result, text)
	end)
end

function sam.get_message(msg)
	msg = Language[msg]
	if not msg then
		return false
	else
		return {Color(236, 240, 241), msg}
	end
end

function sam.language.get(key)
	return Language[key]
end

function sam.language.Add(key, value)
	Language[key] = value
end
--PATH addons/sui/lua/sui/cl_base.lua:
local hook = hook
local bit = bit
local math = math

local Color = Color
local ipairs = ipairs
local RealFrameTime = RealFrameTime

local color_white = color_white
local color_black = color_black

local sui = sui

local isfunction = sui.isfunction
local isstring = sui.isstring

local floor = math.floor

function sui.scale(v)
	return ScrH() * (v / 900)
end

function sui.hex_rgb(hex)
	hex = tonumber(hex:gsub("^([%w])([%w])([%w])$", "%1%1%2%2%3%3", 1), 16)

	return Color(
		bit.band(bit.rshift(hex, 16), 0xFF),
		bit.band(bit.rshift(hex, 8), 0xFF),
		bit.band(hex, 0xFF)
	)
end

function sui.rgb_hex(c)
	return bit.tohex((c.r * 0x10000) + (c.g * 0x100) + c.b, 6)
end
local rgb_hex = sui.rgb_hex

function sui.lerp_color(from, to)
	local frac = RealFrameTime() * 10
	from.r = Lerp(frac, from.r, to.r)
	from.g = Lerp(frac, from.g, to.g)
	from.b = Lerp(frac, from.b, to.b)
	from.a = Lerp(frac, from.a, to.a)
end

do
	local colors = {
		["41b9ff"] = Color(44, 62, 80),
		["00c853"] = Color(44, 62, 80),
		["181818"] = Color(242, 241, 239),
		["212121"] = Color(242, 241, 239),
	}

	function sui.contrast_color(color)
		local c = colors[rgb_hex(color)]
		if c then return c end

		local luminance = (0.299 * color.r + 0.587 * color.g + 0.114 * color.b) / 255
		return luminance > 0.5 and color_black or color_white
	end
end

do
	local SetDrawColor = surface.SetDrawColor
	local SetMaterial = surface.SetMaterial
	local DrawTexturedRectRotated = surface.DrawTexturedRectRotated
	function sui.draw_material(mat, x, y, size, col, rot)
		SetDrawColor(col)

		if x == -1 then
			x = size / 2
		end

		if y == -1 then
			y = size / 2
		end

		if mat then
			SetMaterial(mat)
		end

		DrawTexturedRectRotated(x, y, size, size, rot or 0)
	end
end

do
	local hsv_t = {
		[0] = function(v, p, q, t)
			return v, t, p
		end,
		[1] = function(v, p, q, t)
			return q, v, p
		end,
		[2] = function(v, p, q, t)
			return p, v, t
		end,
		[3] = function(v, p, q, t)
			return p, q, v
		end,
		[4] = function(v, p, q, t)
			return t, p, v
		end,
		[5] = function(v, p, q, t)
			return v, p, q
		end
	}

	function sui.hsv_to_rgb(h, s, v)
		local i = floor(h * 6)
		local f = h * 6 - i

		return hsv_t[i % 6](
			v * 255, -- v
			(v * (1 - s)) * 255, -- p
			(v * (1 - f * s)) * 255, -- q
			(v * (1 - (1 - f) * s)) * 255 -- t
		)
	end
end

local Panel = FindMetaTable("Panel")
local SetSize = Panel.SetSize
local GetWide = Panel.GetWide
local GetTall = Panel.GetTall
function sui.scaling_functions(panel)
	local scale_changed
	local SUI = CURRENT_SUI

	local dock_top = function(s, h)
		if not h then return end

		if not scale_changed then
			s.real_h = h
		end

		if not s.no_scale then
			h = SUI.Scale(h)
		end

		if GetTall(s) == h then return end

		SetSize(s, GetWide(s), h)
	end

	local dock_right = function(s, w)
		if not w then return end

		if not scale_changed then
			s.real_w = w
		end

		if not s.no_scale then
			w = SUI.Scale(w)
		end

		if GetWide(s) == w then return end

		SetSize(s, w, GetTall(s))
	end

	local size_changed = function(s, w, h)
		if s.using_scale then return end

		s.using_scale = true

		local dock = s:GetDock()

		if dock ~= FILL then
			if dock == NODOCK then
				dock_top(s, h)
				dock_right(s, w)
			elseif dock == TOP or dock == BOTTOM then
				dock_top(s, h)
			else
				dock_right(s, w)
			end
		end

		s.using_scale = nil
	end

	local wide_changed = function(s, w)
		size_changed(s, w)
	end

	local tall_changed = function(s, h)
		size_changed(s, nil, h)
	end

	function panel:ScaleChanged()
		scale_changed = true
		size_changed(self, self.real_w, self.real_h)
		scale_changed = nil
		if self.OnScaleChange then
			self:OnScaleChange()
		end
	end

	local on_remove = function(s)
		SUI.RemoveScaleHook(s)
	end

	function panel:ScaleInit()
		self.SetSize = size_changed
		self.SetWide = wide_changed
		self.SetTall = tall_changed
		SUI.OnScaleChanged(self, self.ScaleChanged)
		self:On("OnRemove", on_remove)
	end
end

do
	local utf8 = {}

	local str_rel_to_abs = function(str, v, str_n)
		return v > 0 and v or math.max(str_n + v + 1, 1)
	end

	local utf8_decode = function(str, start_pos, str_n)
		start_pos = str_rel_to_abs(str, start_pos or 1, str_n)

		local b1 = str:byte(start_pos, start_pos)
		if not b1 then return nil end
		if b1 < 0x80 then return start_pos, start_pos, b1 end
		if b1 > 0xF4 or b1 < 0xC2 then return nil end

		local cont_byte_count = b1 >= 0xF0 and 3 or b1 >= 0xE0 and 2 or b1 >= 0xC0 and 1
		local end_pos = start_pos + cont_byte_count
		local code_point = 0

		if str_n < end_pos then return nil end

		local bytes = {str:byte(start_pos + 1, end_pos)}
		for i = 1, #bytes do
			local b_x = bytes[i]
			if bit.band(b_x, 0xC0) ~= 0x80 then return nil end
			code_point = bit.bor(bit.lshift(code_point, 6), bit.band(b_x, 0x3F))
			b1 = bit.lshift(b1, 1)
		end

		code_point = bit.bor(code_point, bit.lshift(bit.band(b1, 0x7F), cont_byte_count * 5))

		return start_pos, end_pos, code_point
	end

	local replacement = string.char(239, 191, 189)

	function utf8.force(str)
		local end_pos = #str
		if end_pos == 0 then return str, end_pos end

		local ret = ""
		local cur_pos = 1

		repeat
			local seq_start_pos, seq_end_pos = utf8_decode(str, cur_pos, end_pos)

			if not seq_start_pos then
				ret = ret .. replacement
				cur_pos = cur_pos + 1
			else
				ret = ret .. str:sub(seq_start_pos, seq_end_pos)
				cur_pos = seq_end_pos + 1
			end
		until cur_pos > end_pos

		return ret, #ret
	end

	-- https://gist.github.com/gdeglin/4128882

	local utf8_char_bytes = function(c)
		if c > 0 and c <= 127 then
			return 1
		elseif c >= 194 and c <= 223 then
			return 2
		elseif c >= 224 and c <= 239 then
			return 3
		elseif c >= 240 and c <= 244 then
			return 4
		end
	end
	utf8.char_bytes = utf8_char_bytes

	function utf8.len(str)
		local length = #str

		local len = 0

		local pos = 1
		while pos <= length do
			len = len + 1
			pos = pos + utf8_char_bytes(str:byte(pos))
		end

		return len
	end

	function utf8.sub(str, i, j)
		j = j or -1

		if i == nil then return "" end

		local l = (i >= 0 and j >= 0) or utf8.len(str)
		local start_char = (i >= 0) and i or l + i + 1
		local end_char = (j >= 0) and j or l + j + 1

		if start_char > end_char then return "" end

		local pos = 1
		local length = #str
		local len = 0

		local start_byte, end_byte = 1, length

		while pos <= length do
			len = len + 1

			if len == start_char then
				start_byte = pos
			end

			pos = pos + utf8_char_bytes(str:byte(pos))

			if len == end_char then
				end_byte = pos - 1
				break
			end
		end

		return str:sub(start_byte, end_byte)
	end

	sui.utf8 = utf8
end

--
-- thanks falco!
-- https://github.com/FPtje/DarkRP/blob/4fd2c3c315427e79bb7624702cfaefe9ad26ac7e/gamemode/modules/base/cl_util.lua#L42
--
do
	local utf8 = utf8
	local surface = surface

	local max_width, original_width, can_fix

	local fix_width = function()
		if can_fix then
			can_fix = false
			max_width = original_width
		end
	end

	local char_wrap = function(text, remaining_width)
		local total_width  = 0

		local new_text = ""
		for char in text:gmatch(utf8.charpattern) do
			total_width  = total_width  + surface.GetTextSize(char)
			if total_width >= remaining_width then
				total_width = surface.GetTextSize(char)
				fix_width()
				remaining_width = max_width

				new_text = new_text .. ("\n" .. char)
			else
				new_text = new_text .. char
			end
		end

		return new_text, total_width
	end

	function sui.wrap_text(text, font, width, first_width)
		text = sui.utf8.force(text)

		local total_width = 0
		can_fix = first_width and true or false
		max_width, original_width = first_width or width, width

		surface.SetFont(font)

		local space_width = surface.GetTextSize(" ")

		text = text:gsub("(%s?[%S]*)", function(word)
			local char = word:sub(1, 1)
			if char == "\n" then
				total_width = 0
				fix_width()
			end

			local wordlen = surface.GetTextSize(word)
			total_width = total_width + wordlen

			if wordlen >= max_width then
				local split_word
				split_word, total_width = char_wrap(word, max_width - (total_width - wordlen))
				return split_word
			elseif total_width < max_width then
				return word
			end

			fix_width()

			total_width = wordlen

			if char == " " then
				total_width = total_width - space_width
				return "\n" .. word:sub(2)
			end

			return "\n" .. word
		end)

		return text
	end
end

function sui.register(classname, panel_table, parent_class)
	sui.TDLib.Install(panel_table)

	if not panel_table.Add then
		function panel_table:Add(pnl)
			return vgui.Create(pnl, self)
		end
	end

	if not panel_table.NoOverrideClear and not panel_table.Clear then
		function panel_table:Clear()
			local children = self:GetChildren()
			for i = 1, #children do
				children[i]:Remove()
			end
		end
	end

	local SUI = CURRENT_SUI

	for k, v in pairs(SUI.panels_funcs) do
		panel_table[k] = v
	end

	panel_table.SUI_GetColor = function(name)
		return SUI.GetColor(name)
	end

	SUI.panels[classname] = panel_table

	return vgui.Register(SUI.name .. "." .. classname, panel_table, parent_class)
end

local Material; do
	local C_Material, material_str = select(2, debug.getupvalue(_G.Material, 1)), "0001010" -- [["mips smooth"]]
	Material = function(name)
		return C_Material(name, material_str)
	end
end
sui.Material = Material

local function prepare_theme(theme)
	for k, v in pairs(theme) do
		if IsColor(v) then continue end

		if istable(v) then
			prepare_theme(v)
		elseif isstring(v) and v:sub(1, 1) == "#" then
			theme[k] = sui.hex_rgb(v:sub(2))
		end
	end
end

function sui.new(addon_name, default_scaling, panels_funcs)
	local SUI = {
		name = addon_name,
		panels = {},
		panels_funcs = panels_funcs or {}
	}

	CURRENT_SUI = SUI

	do
		local themes = table.Copy(sui.themes)
		local current_theme_table

		function SUI.GetColor(color_name)
			return current_theme_table[color_name]
		end

		function SUI.SetTheme(theme_name)
			SUI.current_theme = theme_name
			current_theme_table = themes[theme_name]
			hook.Call(addon_name .. ".ThemeChanged")
		end

		function SUI.GetThemes()
			return themes
		end

		function SUI.AddToTheme(theme_name, tbl)
			local theme = themes[theme_name]
			for k, v in pairs(tbl) do
				theme[k] = v
			end
			prepare_theme(theme)
		end

		function SUI.RemoveTheme(theme_name)
			themes[theme_name] = nil
			if theme_name == SUI.current_theme then
				SUI.SetTheme(next(themes))
			end
		end

		function SUI.AddTheme(theme_name, tbl)
			prepare_theme(tbl)
			themes[theme_name] = tbl
		end

		SUI.themes = themes
	end

	local Scale
	do
		local scale = 1

		if default_scaling then
			SUI.Scale = sui.scale
		else
			function SUI.Scale(v)
				return floor((v * scale) + 0.5)
			end
		end
		Scale = SUI.Scale

		function SUI.ScaleEven(v)
			v = Scale(v)
			if v % 2 ~= 0 then
				v = v + 1
			end
			return v
		end

		function SUI.SetScale(_scale)
			if _scale == scale then return end

			scale = _scale
			SUI.scale = _scale

			for k, v in pairs(SUI.fonts) do
				SUI.CreateFont(k:sub(#addon_name + 1), v.font, v.size, v.weight)
			end

			SUI.CallScaleChanged()
		end

		local n = 0
		local keys = {}
		local hooks = {}
		_G[addon_name .. "_HOOKS"] = keys
		_G[addon_name .. "_KEYS"] = hooks
		_G[addon_name .. "_N"] = function()
			return n
		end
		function SUI.OnScaleChanged(name, func)
			if not isfunction(func) then
				error("Invalid function?")
			end

			if not name then
				error("Invalid name?")
			end

			if not isstring(name) then
				local _func = func
				func = function()
					local isvalid = name.IsValid
					if isvalid and isvalid(name) then
						_func(name)
					else
						SUI.RemoveScaleHook(name, true)
					end
				end
			end

			local pos = keys[name]
			if pos then
				hooks[pos + 1] = func
			else
				hooks[n + 1] = name
				hooks[n + 2] = func
				keys[name] = n + 1
				n = n + 2
			end
		end

		function SUI.RemoveScaleHook(name, in_hook)
			local pos = keys[name]
			if not pos then return end

			if in_hook then
				hooks[pos] = nil
				hooks[pos + 1] = nil
			else
				local new_name = hooks[n - 1]
				if new_name then
					hooks[pos], hooks[pos + 1] = new_name, hooks[n]
					hooks[n - 1], hooks[n] = nil, nil
					keys[new_name] = pos
				end
				n = n - 2
			end
			keys[name] = nil
		end

		function SUI.CallScaleChanged()
			if n == 0 then return end

			local i, c_n = 2, n
			::loop::
			local func = hooks[i]
			if func then
				func()
				i = i + 2
			else
				local _n, _i = c_n, i
				if n ~= c_n then
					_n = n
					i = i + 2
				else
					c_n = c_n - 2
				end

				local new_name = hooks[_n - 1]
				if new_name then
					hooks[_i - 1], hooks[_i] = new_name, hooks[_n]
					hooks[_n - 1], hooks[_n] = nil, nil
					keys[new_name] = _i - 1
				end

				n = n - 2
			end

			if i <= c_n then
				goto loop
			end
		end

		function SUI.GetScale()
			return scale
		end

		SUI.scale = 1
	end

	do
		local fonts = {}

		function SUI.CreateFont(font_name, font, size, weight)
			font_name = addon_name .. font_name

			fonts[font_name] = fonts[font_name] or {
				font = font,
				size = size,
				weight = weight
			}

			surface.CreateFont(font_name, {
				font = font,
				size = Scale(size),
				weight = weight,
				extended = true
			})

			return font_name
		end

		function SUI.GetFont(font_name)
			return addon_name .. font_name
		end

		function SUI.GetFontHeight(font_name)
			local font = fonts[addon_name .. font_name] or fonts[font_name]
			if not font then return 0 end

			return floor(Scale(font.size or 0))
		end

		SUI.fonts = fonts
	end

	do
		local materials = {}

		local delay = 0.008
		local next_run = UnPredictedCurTime()

		function SUI.Material(mat, allow_delay)
			local _mat = materials[mat]
			if _mat then return _mat end

			if allow_delay then
				if UnPredictedCurTime() < next_run then return end
				next_run = UnPredictedCurTime() + delay
			end

			materials[mat] = Material(mat)

			return materials[mat]
		end

		SUI.materials = materials
	end

	SUI.SetTheme("Dark")

	for _, f in ipairs(file.Find("sui/vgui/sui_*.lua", "LUA")) do
		include("sui/vgui/" .. f)
	end

	for _, f in ipairs(file.Find(string.format("sui/vgui/%s_*.lua", addon_name:lower()), "LUA")) do
		include("sui/vgui/" .. f)
	end

	return SUI
end

sui.themes = sui.themes or {}
function sui.add_theme(name, tbl)
	prepare_theme(tbl)
	sui.themes[name] = tbl
end

function sui.valid_options()
	local objs = {}
	objs.IsValid = function()
		local valid = true
		for i = 1, #objs do
			local obj = objs[i]
			if obj:IsValid() and obj.valid == false then
				valid = false
				break
			end
		end
		return valid
	end
	objs.Add = function(obj)
		table.insert(objs, obj)
	end
	return objs
end

do
	local SURFACE = Color(31, 31, 31)
	local PRIMARY = Color(65, 185, 255)

	local ON_SURFACE = Color(255, 255, 255)
	local ON_SURFACE_HIGH_EMPHASIS = ColorAlpha(ON_SURFACE, 221)
	local ON_SURFACE_MEDIUM_EMPHASIS = ColorAlpha(ON_SURFACE, 122)
	local ON_SURFACE_DISABLED = ColorAlpha(ON_SURFACE, 97)

	local ON_PRIMARY = Color(60, 60, 60)

	sui.add_theme("Dark", {
		frame = Color(18, 18, 18),
		frame_blur = false,

		title = ON_SURFACE,
		header = SURFACE,

		close = ON_SURFACE_MEDIUM_EMPHASIS,
		close_hover = Color(255, 60, 60),
		close_press = Color(255, 255, 255, 30),

		button = PRIMARY,
		button_text = "#050709",
		button_hover = ColorAlpha(ON_PRIMARY, 100),
		button_click = ColorAlpha(ON_PRIMARY, 240),
		button_disabled = Color(100, 100, 100),
		button_disabled_text = "#bdbdbd",

		button2_hover = ColorAlpha(PRIMARY, 5),
		button2_selected = ColorAlpha(PRIMARY, 15),

		scroll = ColorAlpha(PRIMARY, 97),
		scroll_grip = PRIMARY,

		scroll_panel = Color(29, 29, 29),
		scroll_panel_outline = false,

		text_entry_bg = Color(34, 34, 34),
		text_entry_bar_color = Color(0, 0, 0, 0),
		text_entry = ON_SURFACE_HIGH_EMPHASIS,
		text_entry_2 = ON_SURFACE_MEDIUM_EMPHASIS,
		text_entry_3 = PRIMARY,

		property_sheet_bg = Color(39, 39, 39),
		property_sheet_tab = Color(150, 150, 150),
		property_sheet_tab_click = Color(255, 255, 255, 30),
		property_sheet_tab_active = PRIMARY,

		toggle_button = ON_SURFACE_DISABLED,
		toggle_button_switch = ON_SURFACE_HIGH_EMPHASIS,

		toggle_button_active = ColorAlpha(PRIMARY, 65),
		toggle_button_switch_active = PRIMARY,

		slider_knob = PRIMARY,
		slider_track = ColorAlpha(PRIMARY, 65),
		slider_hover = ColorAlpha(PRIMARY, 5),
		slider_pressed = ColorAlpha(PRIMARY, 30),

		on_sheet = Color(43, 43, 43, 200),
		on_sheet_hover = Color(200, 200, 200, 20),

		--=--
		query_box_bg = "#181818",
		query_box_cancel = Color(244, 67, 54, 30),
		query_box_cancel_text = "#f44336",
		--=--

		--=--
		menu = "#212121",

		menu_option = "#212121",
		menu_option_text = "#bdbdbd",
		menu_option_hover = "#3b3b3b",
		menu_option_hover_text = "#fefefe",

		menu_spacer = "#303030",
		--=--

		line = "#303030",

		--=--
		column_sheet = "#263238",
		column_sheet_bar = "#202020",

		column_sheet_tab = "#202020",
		column_sheet_tab_hover = "#2e2e2e",
		column_sheet_tab_active = "#383838",

		column_sheet_tab_icon = "#909090",
		column_sheet_tab_icon_hover = "#f0f0f0",
		column_sheet_tab_icon_active = "#34a1e0",
		--=--

		--=--
		collapse_category_header = "#272727",
		collapse_category_header_hover = "#2a2a2a",
		collapse_category_header_active = "#2e2e2e",

		collapse_category_header_text = "#aaaaaa",
		collapse_category_header_text_hover = "#dcdcdc",
		collapse_category_header_text_active = "#34A1E0",

		collapse_category_item = "#343434",
		collapse_category_item_hover = "#464646",
		collapse_category_item_active = "#535353",

		collapse_category_item_text = "#aaaaaa",
		collapse_category_item_text_hover = "#dcdcdc",
		collapse_category_item_text_active = "#ffffff",
		--=--
	})
end

do
	local PRIMARY = Color(65, 185, 255)

	local ON_PRIMARY = Color(220, 220, 220)

	sui.add_theme("Blur", {
		frame = Color(30, 30, 30, 220),
		frame_blur = true,

		title = Color(255, 255, 255),
		header = Color(60, 60, 60, 200),

		close = Color(200, 200, 200),
		close_hover = Color(255, 60, 60),
		close_press = Color(255, 255, 255, 30),

		button = ColorAlpha(PRIMARY, 130),
		button_text = ON_PRIMARY,
		button_hover = Color(0, 0, 0, 30),
		button_click = PRIMARY,
		button_disabled = Color(100, 100, 100),
		button_disabled_text = "#bdbdbd",

		button2_hover = ColorAlpha(PRIMARY, 5),
		button2_selected = ColorAlpha(PRIMARY, 15),

		scroll = Color(0, 0, 0, 100),
		scroll_grip = PRIMARY,

		scroll_panel = Color(255, 255, 255, 10),
		scroll_panel_outline = false,

		text_entry_bg = Color(0, 0, 0, 0),
		text_entry_bar_color = Color(200, 200, 200, 153),
		text_entry = Color(240, 240, 240, 221),
		text_entry_2 = Color(200, 200, 200, 153),
		text_entry_3 = PRIMARY,

		property_sheet_bg = Color(60, 60, 60, 200),
		property_sheet_tab = Color(150, 150, 150),
		property_sheet_tab_click = Color(255, 255, 255, 40),
		property_sheet_tab_active = PRIMARY,

		toggle_button = Color(244, 67, 54),
		toggle_button_switch = Color(230, 230, 230),

		toggle_button_active = PRIMARY,
		toggle_button_switch_active = Color(230, 230, 230),

		slider_knob = PRIMARY,
		slider_track = ColorAlpha(PRIMARY, 100),
		slider_hover = ColorAlpha(PRIMARY, 40),
		slider_pressed = ColorAlpha(PRIMARY, 70),

		on_sheet = Color(60, 60, 60, 180),
		on_sheet_hover = Color(30, 30, 30, 70),

		--=--
		query_box_bg = Color(0, 0, 0, 100),
		query_box_cancel = Color(244, 67, 54, 30),
		query_box_cancel_text = "#f44336",
		--=--
	})
end
--PATH addons/sui/lua/sui/vgui/sui_image.lua:
local table = table
local file = file
local coroutine = coroutine
local surface = surface

local UnPredictedCurTime = UnPredictedCurTime
local pairs = pairs

local color_white = color_white

local sui = sui
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local read_gif = include("sui/libs/gif_loader.lua")
local generate_png = include("sui/libs/png_encoder.lua")

local images_path = (NAME .. "/images/"):lower()
file.CreateDir(images_path)

local get_image_path = function(url)
	return images_path .. (url:gsub("%W", "_") .. ".png")
end

local Write = file.Write
local gif_to_png; do
	local internal_gif_to_png = function(file_path, chunk)
		local gif = read_gif(chunk)
		local frames = gif:get_frames()
		local w, h = gif.width, gif.height

		local path = file_path .. "/"
		file.CreateDir(path)

		for frame_id = 1, #frames do
			local frame = frames[frame_id]
			local data = frame.data
			local png = generate_png(w, h, data)
			Write(("%s%d_%d.png"):format(path, frame_id, frame.delay), png)
			coroutine.yield()
		end
	end

	local delay = 0.01
	local next_run = 0

	local coroutines = {}
	local callbacks = {}
	gif_to_png = function(file_path, data, callback)
		local co = coroutine.create(internal_gif_to_png)
		local i = table.insert(coroutines, co)
		callbacks[i] = callback
		coroutine.resume(co, file_path, data)
		next_run = UnPredictedCurTime()
	end

	hook.Add("Think", NAME .. "ProcessGIFs", function()
		local co = coroutines[1]
		if not co then return end
		if UnPredictedCurTime() < next_run then return end

		if coroutine.status(co) == "suspended" then
			coroutine.resume(co)
		else
			callbacks[1]()
			table.remove(coroutines, 1)
			table.remove(callbacks, 1)
		end

		next_run = UnPredictedCurTime() + delay
	end)

	hook.Add(NAME .. "ImagesCleared", "ClearCoroutines", function()
		table.Empty(coroutines)
		table.Empty(callbacks)
	end)
end

local download_image, is_downloading_image; do
	-- https://stackoverflow.com/questions/25959386/how-to-check-if-a-file-is-a-valid-image
	local valid_images = {
		["\xff\xd8\xff"] = "jpeg",
		["\x89PNG\r\n\x1a\n"] = "png",
		["GIF87a"] = "gif",
		["GIF89a"] = "gif",
	}

	local get_image_type = function(data)
		for k, v in pairs(valid_images) do
			if data:StartWith(k) then
				return v
			end
		end
		return false
	end

	local downloading_images = {}

	local process_callbacks = function(url)
		local callbacks = downloading_images[url] or {}
		downloading_images[url] = nil

		for _, func in ipairs(callbacks) do
			func()
		end
	end

	download_image = function(url, callback)
		if downloading_images[url] then
			table.insert(downloading_images[url], callback)
			return
		end

		downloading_images[url] = {callback}

		http.Fetch(url, function(data)
			local image_type = get_image_type(data)
			if not image_type then
				downloading_images[url] = nil
				return
			end

			local image_path = get_image_path(url)

			if image_type == "gif" then
				gif_to_png(image_path, data, function()
					process_callbacks(url)
				end)
			else
				file.Write(image_path, data)
				process_callbacks(url)
			end
		end, function(err)
			print("(SUI) Failed to download an image, error: " .. err)
			downloading_images[url] = nil
		end)
	end

	is_downloading_image = function(url)
		return downloading_images[url] ~= nil
	end

	hook.Add(NAME .. "ImagesCleared", "ClearDownloadingImages", function()
		table.Empty(downloading_images)
	end)
end

local images_panels = {}

local PANEL = {}

local err_mat = SUI.Material("error")

function PANEL:Init()
	self:SetMouseInputEnabled(false)

	self.minus = 0
	self.rotation = 0
	self.image = err_mat
	self.image_col = color_white

	table.insert(images_panels, self)
end

function PANEL:OnRemove()
	for k, v in ipairs(images_panels) do
		if v == self then
			table.remove(images_panels, k)
			return
		end
	end
end

function PANEL:SetMinus(minus)
	self.minus = minus
end

function PANEL:SetRotation(rotation)
	self.rotation = rotation
end

function PANEL:SetImageColor(col)
	self.image_col = col
end

local cached_files = {}
local get_files = function(image_path)
	local f = cached_files[image_path]
	if f then return f end

	cached_files[image_path] = file.Find(image_path .. "/*", "DATA")

	return cached_files[image_path]
end

function PANEL:SetImage(url)
	self.image = err_mat

	self.pos = nil
	self.delay = nil

	self.images = nil
	self.delays = nil
	self.url = url

	if url:sub(1, 4) ~= "http" then
		self.image = SUI.Material(url)
		return
	end

	local image_path = get_image_path(url)
	if not file.Exists(image_path, "DATA") or is_downloading_image(url) then
		download_image(url, function()
			if self:IsValid() then
				self:SetImage(url)
			end
		end)
		return
	end

	local is_gif = file.IsDir(image_path, "DATA")
	if is_gif then
		local images = {}
		local delays = {}

		local files = get_files(image_path)
		for i = 1, #files do
			local v = files[i]
			local id, delay = v:match("(.*)_(.*)%.png")
			id = tonumber(id)
			local img_path = "../data/" .. image_path .. "/" .. v
			images[id] = img_path
			delays[id] = delay
		end

		self.frame = 1
		self.delay = (UnPredictedCurTime() * 100) + delays[1]

		self.images = images
		self.delays = delays

		self.max_images = #files
	else
		self.image = SUI.Material("../data/" .. image_path)
	end
end

local SetMaterial = surface.SetMaterial
function PANEL:PaintGIF(w, h, images)
	local frame = self.frame

	-- SUI.Material() caches materials by default
	local mat = SUI.Material(images[frame], true)
	if not mat then
		if frame > 1 then
			mat = SUI.Material(images[frame - 1])
		else
			mat = err_mat
		end

		SetMaterial(mat)

		return
	end

	SetMaterial(mat)

	local curtime = UnPredictedCurTime() * 100
	if curtime < self.delay then return end
	frame = frame + 1
	if frame > self.max_images then
		frame = 1
	end

	self.frame = frame
	self.delay = curtime + self.delays[frame]
end

local PaintGIF = PANEL.PaintGIF
local SetDrawColor = surface.SetDrawColor
local DrawTexturedRectRotated = surface.DrawTexturedRectRotated
function PANEL:Paint(w, h)
	SetDrawColor(self.image_col)

	local images = self.images
	if images then
		PaintGIF(self, w, h, images)
	else
		SetMaterial(self.image)
	end

	if self.Draw then
		self:Draw(w, h, true)
	else
		local minus = self.minus
		DrawTexturedRectRotated(w * 0.5, h * 0.5, w - minus, h - minus, self.rotation)
	end
end

sui.register("Image", PANEL, "PANEL")

function SUI.ClearImages()
	local files, dirs = file.Find(images_path .. "/*", "DATA")
	for _, f in ipairs(files) do
		file.Delete(images_path .. f)
	end

	for _, d in ipairs(dirs) do
		for _, f in ipairs(file.Find(images_path .. d .. "/*", "DATA")) do
			file.Delete(images_path .. (d .. "/" .. f))
		end
		file.Delete(images_path .. d)
	end

	table.Empty(SUI.materials)
	table.Empty(cached_files)

	hook.Call(NAME .. "ImagesCleared")

	for k, v in ipairs(images_panels) do
		if v.url then
			v:SetImage(v.url)
		end
	end
end
--PATH addons/sam-157/lua/sam/menu/tabs/config.lua:
if SAM_LOADED then return end

local sam = sam
local config = sam.config

local tabs = {}
if CLIENT then
	function config.add_tab(name, func, check, pos)
		local tab = {
			name = name,
			func = func,
			check = check,
			pos = pos
		}
		for k, v in ipairs(tabs) do
			if v.name == name then
				tabs[k] = tab
				return
			end
		end
		table.insert(tabs, tab)
	end
end

for _, f in ipairs(file.Find("sam/menu/tabs/config/*.lua", "LUA")) do
	sam.load_file("sam/menu/tabs/config/" .. f, "cl_")
end

if SERVER then return end

local SUI = sam.SUI
local GetColor = SUI.GetColor
local Line = sui.TDLib.LibClasses.Line

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/config.png", function(column_sheet)
	local tab_body = column_sheet:Add("Panel")
	tab_body:Dock(FILL)
	tab_body:DockMargin(0, 1, 0, 0)

	do
		local title = tab_body:Add("SAM.Label")
		title:Dock(TOP)
		title:DockMargin(10, 10, 0, 0)
		title:SetFont(SAM_TAB_TITLE_FONT)
		title:SetText("Config")
		title:SetTextColor(GetColor("menu_tabs_title"))
		title:SizeToContents()

		local total = tab_body:Add("SAM.Label")
		total:Dock(TOP)
		total:DockMargin(10, 6, 0, 0)
		total:SetFont(SAM_TAB_DESC_FONT)
		total:SetText("Some settings may require a server restart")
		total:SetTextColor(GetColor("menu_tabs_title"))
		total:SetPos(10, SUI.Scale(40))
		total:SizeToContents()
	end

	local body = tab_body:Add("Panel")
	body:Dock(FILL)
	body:DockMargin(10, 5, 10, 10)

	Line(body, nil, 0, 0, 0, 10)

	local sheet = body:Add("SAM.PropertySheet")
	sheet:Dock(FILL)
	sheet:InvalidateParent(true)
	sheet:InvalidateLayout(true)

	local sheets = {}
	for _, v in SortedPairsByMemberValue(tabs, "pos") do
		sheets[v.name] = sheet:AddSheet(v.name, v.func)
	end

	local tab_scroller = sheet.tab_scroller:GetCanvas()
	function tab_body.Think()
		for _, v in ipairs(tabs) do
			local tab = sheets[v.name]
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
	end

	return tab_body
end, function()
	return LocalPlayer():HasPermission("manage_config")
end, 5)
--PATH addons/sl_utils/lua/sam/modules/command_notify_for_ranks.lua:
--
-- Make command notifying only for ranks you select.
-- permission is command_notify. (by default admin+ has it)
-- You can NOT use this with 'command_hide_admin_name.lua'
--
if SAM_LOADED then return end

sam.permissions.add("command_notify", nil, "admin")

if SERVER then
	local get_players = function()
		local players = {}
		for _, v in ipairs(player.GetAll()) do
			if v:HasPermission("command_notify") then
				table.insert(players, v)
			end
		end
		return players
	end

	sam.player.old_send_message = sam.player.old_send_message or sam.player.send_message
	function sam.player.send_message(ply, msg, tbl)
		if ply == nil and debug.traceback():find("lua/sam/command/", 1, true) then
			sam.player.old_send_message(get_players(), msg, tbl)
		else
			sam.player.old_send_message(ply, msg, tbl)
		end
	end
end
--PATH addons/sam-157/lua/sam/modules/murder.lua:
if SAM_LOADED then return end

local add = not GAMEMODE and hook.Add or function(_, _, fn)
	fn()
end

-- Thanks to https://github.com/boxama/addons/blob/master/addons/ULX_Murder/lua/ulx/modules/sh/murder.lua
add("PostGamemodeLoaded", "SAM.Murder", function()
	if GAMEMODE.Author ~= "MechanicalMind" then return end
	if not isstring(GAMEMODE.Version) or GAMEMODE.Version < "28" then return end

	local sam, command = sam, sam.command

	command.set_category("Murder")

	local autoslain_players = {}

	command.new("slaynr")
		:SetPermission("slaynr", "admin")

		:AddArg("player")
		:AddArg("number", {hint = "rounds", optional = true, default = 1, min = 1, max = 100, round = true})

		:Help("Slays the target(s) at the beggining of the next round.")

		:OnExecute(function(ply, targets, rounds)
			for i = 1, #targets do
				local v = targets[i]
				v.MurdererChance = 0

				if not v:IsBot() then
					autoslain_players[v:AccountID()] = rounds
				end
			end

			sam.player.send_message(nil, "{A} set {T} to be autoslain for {V} round(s)", {
				A = ply, T = targets, V = rounds
			})
		end)
	:End()

	command.new("unslaynr")
		:SetPermission("unslaynr", "admin")

		:AddArg("player")

		:Help("Remove target(s) autoslays.")

		:OnExecute(function(ply, targets)
			for i = 1, #targets do
				local v = targets[i]
				v.MurdererChance = 1

				if not v:IsBot() then
					autoslain_players[v:AccountID()] = nil
				end
			end

			sam.player.send_message(nil, "Removed all autoslays for {T} ", {
				A = ply, T = targets
			})
		end)
	:End()

	hook.Add("OnStartRound", "SAM.Murder", function()
		timer.Simple(3, function()
			local players = team.GetPlayers(2)
			local targets = {admin = sam.console}
			for i = 1, #players do
				local v = players[i]
				if not v:IsBot() then continue end

				local slays = autoslain_players[v:AccountID()]
				if not slays then continue end

				v:Kill()

				slays = slays - 1

				targets[1] = v
				sam.player.send_message(nil, "{A} autoslayed {T}, autoslays left: {V}.", {
					A = sam.console, T = targets, V = slays
				})

				autoslain_players[v:AccountID()] = slays > 0 and slays or nil
			end
		end)
	end)

	hook.Add("PlayerInitialSpawn", "SAM.Murder", function(ply)
		if autoslain_players[ply:AccountID()] then
			ply.MurdererChance = 0
		end
	end)

	command.new("respawn")
		:SetPermission("respawn", "admin")

		:AddArg("player", {single_target = true})

		:Help("Respawn a target.")

		:OnExecute(function(ply, targets)
			local target = targets[1]

			if target:Team() ~= 2 then
				return ply:sam_add_text("You cannot respawn a spectator!")
			end

			target:Spectate(OBS_MODE_NONE)
			target:Spawn()

			sam.player.send_message(nil, "respawn", {
				A = ply, T = targets
			})
		end)
	:End()

	local get_admins = function()
		local admins = {}

		local players = player.GetHumans()
		for i = 1, #players do
			local v = players[i]
			if v:IsAdmin() then
				table.insert(admins, v)
			end
		end

		return admins
	end

	command.new("givemagnum")
		:SetPermission("givemagnum", "superadmin")

		:AddArg("player", {single_target = true, optional = true})

		:Help("Give the target a magnum.")

		:OnExecute(function(ply, targets)
			local target = targets[1]

			if target:Team() ~= 2 then
				return ply:sam_add_text("You cannot give spectator a magnum!")
			end

			target:Give("weapon_mu_magnum")

			sam.player.send_message(get_admins(), "{A} gave {T} a {V}", {
				A = ply, T = targets, V = "magnum"
			})
		end)
	:End()

	command.new("giveknife")
		:SetPermission("giveknife", "superadmin")

		:AddArg("player", {single_target = true, optional = true})

		:Help("Give the target a knife.")

		:OnExecute(function(ply, targets)
			local target = targets[1]

			if target:Team() ~= 2 then
				return ply:sam_add_text("You cannot give spectator a knife!")
			end

			target:Give("weapon_mu_knife")

			sam.player.send_message(get_admins(), "{A} gave {T} a {V}", {
				A = ply, T = targets, V = "knife"
			})
		end)
	:End()

	command.new("forcemurderer")
		:SetPermission("forcemurderer", "admin")

		:AddArg("player", {single_target = true, optional = true})

		:Help("Force the target to me a murderer next round.")

		:OnExecute(function(ply, targets)
			GAMEMODE.ForceNextMurderer = targets[1]

			sam.player.send_message(get_admins(), "{A} set {T} to be the Murderer next round!", {
				A = ply, T = targets
			})
		end)
	:End()

	command.new("getmurderers")
		:SetPermission("getmurderers", "admin")

		:Help("Print all murderers in chat.")

		:OnExecute(function(ply)
			local murderers = {admin = ply}

			local players = team.GetPlayers(2)
			for i = 1, #players do
				local v = players[i]
				if v:GetMurderer() then
					table.insert(murderers, v)
				end
			end

			sam.player.send_message(ply, "Murderers are: {T}", {
				T = murderers
			})
		end)
	:End()
end)
--PATH addons/sl_utils/lua/sam/modules/newera.lua:
if SAM_LOADED then return end

local add = not GAMEMODE and hook.Add or function(_, _, fn)
	fn()
end

add("PostGamemodeLoaded", "SAM.NewEra", function()
	if not DarkRP then return end

    local sam, command, language = sam, sam.command, sam.language

    command.set_category("New Era")

    local ranks = {"E", "D", "C", "B", "A", "S"}

    command.new("setrang")
        :SetPermission("setrang", "superadmin")

        :AddArg("player", {optional = true})
        :AddArg("dropdown", {hint = "rang", options = ranks})

        :Help("Set player's rang.")

        :OnExecute(function(ply, targets, rank)
            for i = 1, #targets do
                SaveData(targets[i],"SLSaves", "rang", rank, false)
                targets[i]:SetNWString("Rang", rank)
            end

            sam.player.send_message(nil, "{A} set the rang for {T} to {V}.", {
                A = ply, T = targets, V = rank
            })
        end)
    :End()

    local classes = {}
    for k in pairs(CLASSES_SL) do
        table.insert(classes, k)
    end

    command.new("setclass")
        :SetPermission("setclass", "superadmin")

        :AddArg("player", {optional = true})
        :AddArg("dropdown", {hint = "class", options = classes})

        :Help("Set player's class.")

        :OnExecute(function(ply, targets, class)
            for i = 1, #targets do
                SaveData(targets[i],"SLSaves", "classe", class,false)
                targets[i]:SetNWString("Classe", class)
            end

            sam.player.send_message(nil, "{A} set the class for {T} to {V}.", {
                A = ply, T = targets, V = class
            })
        end)
    :End()

    local magics = {}
    for k in pairs(MAGIE_SL) do
        table.insert(magics, k)
    end

    command.new("setmagie")
        :SetPermission("setmagie", "superadmin")

        :AddArg("player", {optional = true})
        :AddArg("dropdown", {hint = "magic", options = magics})

        :Help("Set player's magic.")

        :OnExecute(function(ply, targets, magic)
            for i = 1, #targets do
                targets[i]:SetNWInt("Magie", magic)
                SaveData(targets[i],"SLSaves", "magie", magic)
            end

            sam.player.send_message(nil, "{A} set the magic for {T} to {V}.", {
                A = ply, T = targets, V = magic
            })
        end)
    :End()

    local RPExtraTeams = RPExtraTeams
    local jobs = {}
    for _, v in pairs(RPExtraTeams) do
        table.insert(jobs, v.name)
    end

    command.new("setteam")
        :SetPermission("setteam", "superadmin")

        :AddArg("player", {optional = true})
        :AddArg("dropdown", {hint = "team", options = jobs})

        :Help("Set player's team.")

        :OnExecute(function(ply, targets, team)
            local job_index = nil

            for k, v in ipairs(RPExtraTeams) do
                if v.name:lower() == team:lower() then
                    job_index = k
                    break
                end
            end

            for i = 1, #targets do
                targets[i]:changeTeam(job_index, true, true, true)
            end

            sam.player.send_message(nil, "{A} set the team for {T} to {V}.", {
                A = ply, T = targets, V = team
            })
        end)
    :End()
end)
--PATH addons/sam-157/lua/sam/modules/utime.lua:
if SAM_LOADED then return end

local PLAYER = FindMetaTable("Player")

function PLAYER:GetUTime()
	return self:sam_get_nwvar("TotalUTime")
end

function PLAYER:SetUTime(time)
	self:sam_set_nwvar("TotalUTime", time)
end

function PLAYER:GetUTimeStart()
	return self:sam_get_nwvar("UTimeStart")
end

function PLAYER:SetUTimeStart(time)
	self:sam_set_nwvar("UTimeStart", time)
end

function PLAYER:GetUTimeSessionTime()
	return CurTime() - self:GetUTimeStart()
end

function PLAYER:GetUTimeTotalTime()
	return self:GetUTime() + CurTime() - self:GetUTimeStart()
end

if SERVER then
	hook.Add("SAM.AuthedPlayer", "SAM.UTime", function(ply)
		ply:SetUTime(ply:sam_get_play_time())
		ply:SetUTimeStart(CurTime())
	end)
end
--PATH addons/sui/lua/sui/vgui/sui_panel.lua:
local PANEL = {}

sui.scaling_functions(PANEL)

function PANEL:Init()
	self:ScaleInit()
end

sui.register("Panel", PANEL, "Panel")
--PATH addons/sui/lua/sui/vgui/sui_query_box.lua:
local ScrW, ScrH = ScrW, ScrH
local DisableClipping = DisableClipping
local SetDrawColor = surface.SetDrawColor
local DrawRect = surface.DrawRect
local BlurPanel = sui.TDLib.BlurPanel
local lerp_color = sui.lerp_color

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor

local PANEL = {}

function PANEL:SetCallback(callback)
	self.callback = callback
end

function PANEL:Init()
	self:SetSize(0, 0)

	local bottom = self:Add("Panel")
	bottom:Dock(BOTTOM)
	bottom:DockMargin(4, 10, 4, 4)
	bottom:SetZPos(100)

	local save = bottom:Add(NAME .. ".Button")
	save:SetText("SAVE")
	save:Dock(RIGHT)
	save:SetEnabled(false)
	self.save = save

	function save.DoClick()
		self.callback()
		self:Remove()
	end

	local cancel = bottom:Add(NAME .. ".Button")
	cancel:Dock(RIGHT)
	cancel:DockMargin(0, 0, 4, 0)
	cancel:SetContained(false)
	cancel:SetColors(GetColor("query_box_cancel"), GetColor("query_box_cancel_text"))
	cancel:SetText("CANCEL")
	self.cancel = cancel

	function cancel.DoClick()
		self:Remove()
	end

	bottom:SetSize(save:GetWide() * 2 + 4, SUI.Scale(30))

	local body = self:Add("Panel")
	body:Dock(FILL)
	body:DockMargin(4, 4, 4, 4)
	body:DockPadding(3, 3, 3, 3)
	body:InvalidateLayout(true)
	body:InvalidateParent(true)

	local added = 1
	function body.OnChildAdded(s, child)
		added = added + 1
		child:Dock(TOP)
		child:SetZPos(added)
		child:InvalidateLayout(true)
		s:InvalidateLayout(true)
	end
	self.body = body

	function self:Add(name)
		return body:Add(name)
	end

	local old_Paint = self.Paint
	local trans = Color(0, 0, 0, 0)
	local new_col = Color(70, 70, 70, 100)
	function self:Paint(w, h)
		lerp_color(trans, new_col)

		local x, y = self:LocalToScreen(0, 0)
		DisableClipping(true)
			BlurPanel(self)
			SetDrawColor(trans)
			DrawRect(x * -1, y * -1, ScrW(), ScrH())
		DisableClipping(false)

		old_Paint(self, w, h)
	end
end

function PANEL:ChildrenHeight()
	local body = self.body

	self.header:InvalidateLayout(true)
	local height = self.header:GetTall()

	body:InvalidateLayout(true)
	self:InvalidateLayout(true)
	height = height + select(2, body:ChildrenSize())

	height = height + SUI.Scale(30) + 14 + 6

	return height
end

function PANEL:Paint(w, h)
	if GetColor("frame_blur") then
		BlurPanel(self)
	end

	self:RoundedBox("Background", 8, 0, 0, w, h, GetColor("query_box_bg"))
end

function PANEL:Done()
	self:InvalidateChildren(true)

	self.size_to_children = function()
		local h = self:ChildrenHeight()
		self:RealSetSize(self:GetWide(), h)
		self.real_h = h
	end

	self:Center()
	self:MakePopup()
	self:DoModal(true)

	timer.Simple(0.08, function()
		self:AddAnimations(self:GetWide(), self:ChildrenHeight(), true)
	end)
end

sui.register("QueryBox", PANEL, NAME .. ".Frame")
--PATH addons/chatbox/lua/scb/settings/tabs/client.lua:
if SCB_LOADED then return end

local vgui = vgui

local ipairs = ipairs

local scb = scb
local SUI = scb.SUI
local language = scb.language

local toggle_convars = {
	{
		title = "show_time",
		convar = "scb_show_timestamps",
	},
	{
		title = "disable_rainbow",
		convar = "scb_disable_rainbow_colors",
		value = "0"
	},
	{
		title = "disable_flashing",
		convar = "scb_disable_flashing_texts",
		value = "0"
	},
	{
		title = "blur_theme",
		convar = "scb_blur_theme",
		value = SUI.current_theme == "Blur" and "1" or "0",
		on_change = function(value)
			SUI.SetTheme(value == "1" and "Blur" or "Dark")
		end
	},
	{
		title = "join_messages",
		convar = "scb_joindisconnect_message",
		value = "1"
	},
	{
		"number",
		title = "scale",
		convar = "scb_scale",
		value = "5",
		min = 1, max = 9,
		load = function(slider, convar)
			slider:GetParent():SetWide(110)

			slider:SetDecimals(0)
			slider:SetMinMax(1, 9)
			slider.Knob:SUI_TDLib()

			local on_mouse_released = function()
				convar:SetInt(slider:GetValue())
			end
			slider:On("OnMouseReleased", on_mouse_released)
			slider.Knob:On("OnMouseReleased", on_mouse_released)

			slider:SetValue(scb.to_new_range(SUI.GetScale(), 0.5, 1.5, 1, 9))
		end,
		on_change = function(value)
			SUI.SetScale(scb.to_new_range(value, 1, 9, 0.5, 1.5))
		end
	},
	{
		"number",
		title = "messages_fade",
		convar = "scb_message_fade_out_time",
		value = "6",
		min = 0, max = 60,
		load = function(slider, convar)
			slider:GetParent():SetWide(160)

			slider:SetDecimals(0)
			slider:SetMinMax(0, 60)

			slider:On("OnValueChanged", function(_, v)
				convar:SetInt(v)
			end)

			slider:SetValue(convar:GetInt())
		end
	},
	{
		"number",
		title = "max_messages",
		convar = "scb_max_messages",
		value = "200",
		min = 100, max = 400,
		load = function(slider, convar)
			slider:GetParent():SetWide(160)

			slider:SetDecimals(0)
			slider:SetMinMax(100, 400)

			slider:On("OnValueChanged", function(_, v)
				convar:SetInt(v)
			end)

			slider:SetValue(convar:GetInt())
		end
	}
}

if scb.config.enable_avatars then
	table.insert(toggle_convars, 1, {
		title = "show_avatars",
		convar = "scb_show_avatars",
	})
end

if not scb.config.enable_custom_join_messages and not scb.config.enable_custom_leave_messages then
	for k, v in ipairs(toggle_convars) do
		if v.convar == "scb_joindisconnect_message" then
			table.remove(toggle_convars, k)
			break
		end
	end
end

for _, v in ipairs(toggle_convars) do
	local convar = CreateClientConVar(v.convar, v.value or "1", true, false, "", v.min or 0, v.max or 1)

	if v.on_change then
		v.on_change(convar:GetString())
		cvars.AddChangeCallback(v.convar, function(_, _, value_new)
			v.on_change(value_new, v.panel)
		end)
	end
end

return {
	title = language.client_title,
	pos = 1,
	check = false,
	func = function(parent)
		local body = parent:Add("SCB.ScrollPanel")
		body:Dock(FILL)
		body:DockMargin(0, 1, 0, 0)

		local add_setting = function(title, pnl)
			local setting = body:Add("SCB.LabelPanel")
			setting:DockMargin(4, 4, 4, 0)
			setting:SetLabel(title)
			setting:SetPanel(pnl)
			return setting
		end

		for _, v in ipairs(toggle_convars) do
			local panel
			if v[1] == "number" then
				panel = vgui.Create("SCB.NumberSlider")

				v.panel = panel.slider
				v.load(panel.slider, v.convar and GetConVar(v.convar))
			else
				panel = vgui.Create("SCB.ToggleButton")
				panel:SetConVar(v.convar)
			end

			add_setting(language[v.title], panel)
		end

		local reset_size = vgui.Create("SCB.Button")
		reset_size:SetText("Reset")
		reset_size:SetSize(70, 24)
		reset_size:On("DoClick", function()
			scb.chatbox:SetSize(480, 220)
		end)
		add_setting(language.reset_size, reset_size)

		local reset_position = vgui.Create("SCB.Button")
		reset_position:SetText("Reset")
		reset_position:SetSize(70, 24)
		reset_position:On("DoClick", function()
			scb.chatbox:SetPos(sui.scale(18), ScrH() - scb.chatbox:GetTall() - sui.scale(170))
			scb.chatbox:OnPosChanged()
		end)
		add_setting(language.reset_position, reset_position)

		local clear_cache = vgui.Create("SCB.Button")
		clear_cache:SetText("Clear")
		clear_cache:SetSize(70, 24)

		clear_cache:On("DoClick", function()
			SUI.ClearImages()
		end)

		add_setting(language.clear_reload, clear_cache)

		return body
	end
}
--PATH addons/chatbox/lua/scb/sh_chatbox.lua:
if SCB_LOADED then return end

local scb = scb

local PLAYER = FindMetaTable("Player")
function PLAYER:IsTyping()
	return self:GetNWBool("SCB.IsTyping", false)
end

function PLAYER:SCB_GetTag()
	local tags = scb.tags
	return tags[self:SteamID()] or tags[self:SteamID64()] or tags[self:GetUserGroup()] or false
end

local permissions = scb.config.permissions
function scb.has_permission(ply, permission)
	if not IsValid(ply) then return true end

	permission = permissions[permission]
	return permission[1] or permission[ply:GetUserGroup()] or permission[ply:SteamID()] or permission[ply:SteamID64()]
end
--PATH addons/sl_util_atm/lua/batm_scenes/background.lua:
--[[-------------------------------------------------------------------------
Draws the bluie background, and the title bar and time.
---------------------------------------------------------------------------]]

surface.CreateFont( "batm_date", {
	font = "Roboto Lt", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 35,
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

surface.CreateFont( "batm_time", {
	font = "Roboto Lt", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 35,
	weight = 50,
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

surface.CreateFont( "batm_large", {
	font = "Coolvetica", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
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

local logo = Material("bluesatm/logo.png", "noclamp smooth")

--Lerps a color
local function LerpColor(t, col1, col2)
	local newCol = Color(0,0,0,0)

	newCol.r = Lerp(t, col1.r, col2.r)
	newCol.g = Lerp(t, col1.g, col2.g)
	newCol.b = Lerp(t, col1.b, col2.b)
	newCol.a = Lerp(t, col1.a, col2.a)

	return newCol
end


local scene = {}

--Called when the scene is loaded
function scene.Load(ent)
 
end

--Add st, nd, rd or th to the end of a number
local function OrdinalNumber(n)
  local ordinal, digit = {"st", "nd", "rd"}, string.sub(n, -1)
  if tonumber(digit) > 0 and tonumber(digit) <= 3 and string.sub(n,-2) ~= 11 and string.sub(n,-2) ~= 12 and string.sub(n,-2) ~= 13 then
    return n .. ordinal[tonumber(digit)]
  else
    return n .. "th"
  end
end

--Draw code
function scene.Draw(ent, ScrW, ScrH)
 
	--Draw background
	draw.RoundedBox(0, 0, 0, ScrW, ScrH, Color(45, 62, 80))
	draw.RoundedBox(0, 0, 0, ScrW, 100, Color(52, 73, 94))
	
	--Draw the logo
	surface.SetDrawColor(Color(200,200,200,255))
	surface.SetMaterial(logo)
	surface.DrawTexturedRect(-12, 12, 1024 / 2.5, 199 / 2.5)
 	
 	--Draw date a time
 	local date = os.date("%A, %B ")
 	local dayOfTheMonth = OrdinalNumber(tonumber(os.date("%d")))
 	date = date..dayOfTheMonth

 	local time = string.upper(os.date("%I:%M %p"))

 	draw.SimpleText(date,"batm_date",ScrW - 10, 30, Color(200,200,200,255),2, 1)
  	draw.SimpleText(time,"batm_time",ScrW - 10, 60, Color(200,200,200,255),2, 1)
end

--Think code (dt = FrameTime())
function scene.Think(ent, dt)

end

--Called when a the scene is unloaded
function scene.Unload(ent, newSceneName)

end

--Register the scene
BATM.RegisterScene(scene, "background")


--PATH addons/sl_util_atm/lua/batm_scenes/done_transfer.lua:
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
	draw.SimpleText(BATM.Lang["Transfer Complete."], "batm_done_text", ScrW/2, ScrH - 150, Color(255,255,255,100), 1)

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
BATM.RegisterScene(scene, "done_transfer")

--PATH lua/catmullromcams/cl_calcview_hook.lua:

function CatmullRomCams.CL.CalcViewOverride(ply, origin, angles, fov)
	local weap = ply:GetActiveWeapon()
	
	local toolmode_active = (CatmullRomCams.SToolMethods.ToolObj and (gmod_toolmode:GetString() == "catmullrom_camera") and weap and weap:IsValid() and (weap:GetClass() == "gmod_tool"))
	local playing_track   = ply:GetNWEntity("UnderControlCatmullRomCamera") and ply:GetNWEntity("UnderControlCatmullRomCamera"):IsValid()
	
	if not (toolmode_active or playing_track) then return end
	
	local overrides = {}
	overrides.origin = origin
	overrides.angles = angles
	overrides.fov    = fov
	
	if toolmode_active then
		overrides.fov      =  CatmullRomCams.SToolMethods.ToolObj:GetClientNumber("zoom") or 75
		overrides.angles.r = (CatmullRomCams.SToolMethods.ToolObj:GetClientNumber("enable_roll") == 1) and CatmullRomCams.SToolMethods.ToolObj:GetClientNumber("roll") or angles.r
	else
		overrides.fov = ply.CatmullRomCamsTrackZoom or fov
	end
	
	return overrides
end
hook.Add("CalcView", "CatmullRomCams.CL.CalcViewOverride", CatmullRomCams.CL.CalcViewOverride)

--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/sh_rhandcuffs_languages.lua:

for k, v in pairs(file.Find("tbfy_rhandcuffs/languages/*.lua","LUA")) do 
	include("tbfy_rhandcuffs/languages/" .. v);
	if SERVER then
		AddCSLuaFile("tbfy_rhandcuffs/languages/" .. v);
	end
end

--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/languages/chinese.lua:
//Translated by taka_qiao https://steamcommunity.com/id/taka_qiao/
RHandcuffsConfig.Language =  RHandcuffsConfig.Language or {}
RHandcuffsConfig.Language["Chinese"] = {
CuffedBy = "你已被 %s 用手铐铐住",
Cuffer = "你成功铐住了 %s.",
ReleasedBy = "你的手铐已被 %s 解开",
Releaser = "你成功解开了 %s 的手铐.",

CantEnterVehicle = "当你被手铐铐住的事后不能进入一个车辆!",
CantLeaveVehicle = "当你被手铐铐住的时候不能离开车辆!",
CantSpawnProps = "当你被手铐铐住的时候不能生成物品!",
CantChangeTeam = "当你被手铐铐住的时候不能切换职业.",
CantSwitchSeat = "当你被手铐铐住的时候不能切换座位.",

ConfiscateReward = "没收武器你获得了 $%s 作为奖赏.",
ArrestReward = "你获得了 $%s 作为逮捕 %s 的奖赏.",
AlreadyArrested = "这个玩家已经入狱了!",
MustBeCuffed = "如果你想把该玩家投入监狱你需要先铐住他!",
ReqLockpick = "用开锁器来帮助解放这个玩家!",

PlayerPutInDriver = "Player was put in driver seat.",
CantCuffRestrained = "你不能用手铐铐住一个已经被绑起来的玩家.",
NoSeats = "没有可用的座位!",
CuffingText = "用手铐铐 %s 中..",
TazedPlayer = "受到电击的玩家",

CuffedText = "你被手铐铐住了!",
SurrenderedText = "你已经投降!",
}
--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/languages/norwegian.lua:
//Translated by Lenny https://steamcommunity.com/id/LennySwenni/
RHandcuffsConfig.Language =  RHandcuffsConfig.Language or {}
RHandcuffsConfig.Language["Norwegian"] = {
CuffedBy = "Du har blitt satt i h�ndjern: %s",
Cuffer = "Du har n� satt h�ndjern p� %s.",
ReleasedBy = "Du holder p� � bli l�slatt av: %s",
Releaser = "Du har blitt satt fri av: %s.",

CantEnterVehicle = "Du kan ikke g� inn i biler n�r du er i h�ndjern",
CantLeaveVehicle = "Du kan ikke g� ut av bilen n�r du er i h�ndjern",
CantSpawnProps = "Du kan ikke plassere props n�r du er i h�ndjern!",
CantChangeTeam = "Du kan ikke bytte lag n�r du er i h�ndjern.",
CantSwitchSeat = "Du kan ikke skifte sete n�r du er i h�ndjern",

ConfiscateReward = "Du ble bel�nnet med $%s for � konfiskere et v�pen.",
ArrestReward = "Du ble bel�nnet med $%s for � arrestere %s.",
AlreadyArrested = "Denne spiller er allerede arrestert!",
MustBeCuffed = "Spilleren m� v�re i h�ndjern f�r du kan arrestere ham!",
ReqLockpick = "Du m� lockpicke h�ndjerne for � slippe l�s denne spilleren!",

PlayerPutInDriver = "Player was put in driver seat.",
CantCuffRestrained = "Du kan ikke lenke en tilbakeholdt spiller.",
NoSeats = "Ingen seter til tilgjengelige!",
CuffingText = "H�ndjern %s",
TazedPlayer = "Eliktriserer spiller",

CuffedText = "Du har blitt puttet i h�ndjern!",
SurrenderedText = "Du har overgivet deg selv!",
}
--PATH addons/squad_reborn/lua/squads/sh_squad_config.lua:
SQUAD = SQUAD or {}

SQUAD.Config = SQUAD.Config or {}

--Custom check function
SQUAD.Config.CustomCheck = function(ply)
    --if ply:GetUserGroup() == "user" then
    --  return true
    --end
    return true
end
SQUAD.Config.FailCheck = "Sorry, you are not a banana"

--Max members, i recommend using 4 in 4 amounts, and less than 12, 4 is perfect, but it's up to you to use it
SQUAD.Config.MaxMembers = 12
--Max tag size, example FIRED or LMAOX
SQUAD.Config.TagMaxSize = 5
--Max team name size, it speaks for itself
SQUAD.Config.NameMaxSize = 15
--Teams can deal damage between themselves? True enable damage
SQUAD.Config.DamageBetweenTeam = false
--Can you give weapons via C menu?
SQUAD.Config.CanShareWeapons = false
--Can you send money via C menu?
SQUAD.Config.CanShareMoney = false
--Can you share your view via C menu?
SQUAD.Config.CanViewPlayerScreens = false
--Can only bosses from squads use view function
SQUAD.Config.OnlyBossCanSee = true

--HUD size, i recommend values higher than 0.5
SQUAD.Config.HUDScale = 0.85
--HUD elements opacity, 255 is full opaque, 0 is invisible
SQUAD.Config.HUDOpacity = 100

--Key that brings minimap
SQUAD.Config.MinimapKey = KEY_G

--You can open squad menu in C menu?
SQUAD.Config.UseCMenu = true

--You can open squad menu in C menu?
SQUAD.Config.KeyBringSquadMenu = KEY_F6 --Keep -1 to disable it

--Prefix to use squad chat, example !party hey guys!
SQUAD.Config.ChatPrefix = "party"
--Which key is used to talk with your squad, you must hold voice chat too
SQUAD.Config.VoiceKey = -1
--This is the key displayed in tips
SQUAD.Config.VoiceKeyString = "Left ALT"
--Which groups can see admin panel info inside C menu
SQUAD.Config.AdminPanelView = {"superadmin", "admin", "trialmod"}

--Language options
SQUAD.Language = {}

SQUAD.Language.Join = "%s wanna invite you!"
SQUAD.Language.CreateOne = "Create one!"
SQUAD.Language.AcceptInvitations = "Can I get invited?"
SQUAD.Language.ShareView = "Can share view?"
SQUAD.Language.DrawOutlines = "Draw outlines"
SQUAD.Language.Drawtips = "Draw Tips"
SQUAD.Language.NotInSquad = "You are not in a squad"
SQUAD.Language.InvitePlayers = "Invite players"
SQUAD.Language.Create = "Create"
SQUAD.Language.Filter = "Invite - Filter:"
SQUAD.Language.InvitationButtons = {"SENT", "SELECT"}
SQUAD.Language.LeavedSquad = "leaved the squad"
SQUAD.Language.Sent = "sent you"

SQUAD.Language.ExitMessage = "Are you sure you want to Leave from the SQUAD?"
SQUAD.Language.ExitConfirm = "Abandoning confirmation"
SQUAD.Language.Yeah = "Yeah"
SQUAD.Language.RemoveLeave = {"Remove", "Leave", "From SQUAD"}

SQUAD.Language.D_Title = "SQUAD - CREATE"
SQUAD.Language.Chars = "letters"
SQUAD.Language.D_Created = "SQUAD CREATED"
SQUAD.Language.D_Exists = "SQUAD ALREADY EXISTS"
SQUAD.Language.D_ExistsB = "USE A DIFFERENT NAME"
SQUAD.Language.D_Error = "AN ERROR OCCURRED"

SQUAD.Language.Message = "Send message"
SQUAD.Language.MessageWarning = "Wait atleast 5 seconds between sending messages"
SQUAD.Language.Money = "Send Money"
SQUAD.Language.MoneySubtitle = "Insert the amount of money you want to give"
SQUAD.Language.GiveGun = "Give gun"
SQUAD.Language.ScreenView = "View player screen"

SQUAD.Language.MaxMembers = "This SQUAD already has max members on it."

SQUAD.Language.Accept = "To accept"
SQUAD.Language.Refuse = "To refuse"

--Tips strings
SQUAD.Tips = { "Hold C and press Squad widget to create yours",
    "Wanna stop people from invite you? Open C menu and disable it in Squad",
    "You can see your squad through walls by enabling it in Squad options (C Menu)",
    "You can send money via Squad menu",
    "Wanna send a message to your squad? Type (! or /)" .. SQUAD.Config.ChatPrefix .. " <message>",
    "You can radio talk with your squad by holding voice key and " .. SQUAD.Config.VoiceKeyString,
    "You can disable those tips in Squad menu"
}
--PATH addons/squad_reborn/lua/squads/sh_squad_system.lua:

SQUAD.Groups = SQUAD.Groups or {}
SQUAD.PlyMeta = FindMetaTable("Player")

if SERVER then
    include("server/sv_squad.lua")
end

function SQUAD:Sync()
end

function SQUAD.PlyMeta:GetSquad()
    if (not SQUAD.Groups) then
        SQUAD.Groups = {}
    end

    return SQUAD.Groups[self:GetSquadName()] or nil
end

function SQUAD.PlyMeta:GetSquadName()
    return self._squad or ""
end

function SQUAD.PlyMeta:SameSquad(ply)
    if (ply:GetSquadName() == "") then return false end
    return ply:GetSquadName() == self:GetSquadName()
end

function SQUAD.PlyMeta:GetSquadMembers()
    if (not self:GetSquad()) then return {} end

    return self:GetSquad().Members or {}
end

function SQUAD.PlyMeta:SendTip(msg, icon, time)
    if SERVER then
        net.Start("Squad.SendTip")
        net.WriteString(msg)
        net.WriteInt(icon or 0, 4)
        net.WriteFloat(time or 3)
        net.Send(self)
    else
        notification.AddLegacy(msg, icon, time)
    end
end

net.Receive("Squad.SendTip", function()
    local msg = net.ReadString()
    local icon = net.ReadInt(4)
    local time = net.ReadFloat()
    LocalPlayer():SendTip(msg, icon, time)
end)

--PATH addons/tlib/lua/tlib/client/init.lua:
local iLastH = 0
local iMargin = 0
local iRoundness = 0

--[[

    Materials

]]--

TLib.Mat = {
    [ 0 ] = Material( "tlib/circle_filled.png", "smooth" ),
    [ 1 ] = Material( "vgui/gradient-r", "smooth" ),
    [ 2 ] = Material( "vgui/gradient-l", "smooth" ),
    [ 3 ] = Material( "vgui/gradient-d", "smooth" ),
    [ 4 ] = Material( "vgui/gradient-u", "smooth" ),
    [ 5 ] = Material( "tlib/info.png", "smooth" ),
}

--[[

    Absolute fonts

]]--

for i = 16, 96, 8 do
    surface.CreateFont( "TLib.R." .. i, { font = "Rajdhani Regular", size = i } )
    surface.CreateFont( "TLib.B." .. i, { font = "Rajdhani Bold", size = i } )
end

--[[

    TLib:ScaleVGUI
        Desc: Creates (or recreate if screen size has changed) responsive fonts and define VGUI margin and roundness
        Return: Margin (number), Roundness (number), Screen height (number)

]]--

function TLib:ScaleVGUI()
    local iH = ScrH()
    if ( iLastH == iH ) then
        return iMargin, iRoundness
    end

    -- Responsive fonts
    local ceil = math.ceil
    local iH5, iH4, iH3, iH2, iH1 = ceil( iH * .02 ), ceil( iH * .024 ), ceil( iH * .026 ), ceil( iH * .03 ), ceil( iH * .04 )

    surface.CreateFont( "TLib.Small", { font = "Rajdhani Regular", size = iH5 } )
    surface.CreateFont( "TLib.SmallItalic", { font = "Rajdhani Regular", size = iH5, italic = true } )

    surface.CreateFont( "TLib.Standard", { font = "Rajdhani Regular", size = iH4 } )
    surface.CreateFont( "TLib.StandardItalic", { font = "Rajdhani Regular", size = iH4, italic = true } )

    surface.CreateFont( "TLib.Big", { font = "Rajdhani Bold", size = iH3 } )
    surface.CreateFont( "TLib.BigItalic", { font = "Rajdhani Bold", size = iH3, italic = true } )

    surface.CreateFont( "TLib.Subtitle", { font = "Rajdhani Regular", size = iH2 } )
    surface.CreateFont( "TLib.SubtitleItalic", { font = "Rajdhani Regular", size = iH2, italic = true } )

    surface.CreateFont( "TLib.Title", { font = "Rajdhani Bold", size = iH1 } )
    surface.CreateFont( "TLib.TitleItalic", { font = "Rajdhani Bold", size = iH1, italic = true } )    

    iLastH, iMargin, iRoundness = iH, ceil( iH * .008 ), ceil( iH * .006 )

    return iMargin, iRoundness
end

TLib:ScaleVGUI()
--PATH addons/tlib/lua/tlib/client/derma/textentry.lua:
local draw = draw
local surface = surface

local PANEL = {}
local matPlaceholder = TLib.Mat[ 5 ]

--[[

    PANEL:Init

]]--

function PANEL:Init()
    self.iMargin, self.iRoundness = TLib:ScaleVGUI()

    self:SetFont( "TLib.Small" )
    self:SetDrawLanguageID( false )
    self:SetPaintBackground( false )

    self:SetTextColor( TLib:C( 2 ) )
    self:SetCursorColor( TLib:C( 2 ) )
    self:SetHighlightColor( TLib:C( 2 ) )

    self.tBgColor = TLib:C( 1 )
    self.tFocusColor = TLib:C( 5 )
    self.tUnfocusColor = TLib:C( 2 )
end

--[[

    PANEL:OnGetFocus

]]--

function PANEL:OnGetFocus()
    self:SetTextColor( self.tFocusColor )
end

--[[

    PANEL:OnLoseFocus

]]--

function PANEL:OnLoseFocus()
    self:SetTextColor( self.tUnfocusColor )
end

--[[

    PANEL:IsPlaceholderVisible

]]--

function PANEL:IsPlaceholderVisible()
    if not self:HasFocus() and ( self:GetText() == "" ) and self.m_txtPlaceholder then
        return true
    end
end

--[[

    PANEL:Init

]]--

function PANEL:Paint( iW, iH )
    draw.RoundedBox( self.iRoundness, 0, 0, iW, iH, self.tBgColor )
    draw.RoundedBox( self.iRoundness, 1, 1, iW - 2, iH - 2, TLib:C( 0 ) )

    self:DrawTextEntryText( self.m_colText, self.m_colHighlight, self.m_colCursor )

    if not self:IsPlaceholderVisible() then
        return
    end

    if not self.iIconH then
        self.iIconH = ( draw.GetFontHeight( self:GetFont() ) * .8 )
        return
    end

    self.iOffset = ( self.iOffset or math.ceil( ( iH - self.iIconH ) * .5 ) )

    self.fLerpOffset = ( self.fLerpOffset or -iW ) 
    self.fLerpOffset = Lerp( RealFrameTime() * 6, self.fLerpOffset, self.iOffset )

    surface.SetDrawColor( self.tUnfocusColor )
    surface.SetMaterial( matPlaceholder )
    surface.DrawTexturedRect( self.fLerpOffset, self.iOffset, self.iIconH, self.iIconH )

    draw.SimpleText( self.m_txtPlaceholder, self:GetFont(), self.iIconH + self.fLerpOffset + ( self.iOffset * .5 ), math.ceil( iH * .5 ), self.tUnfocusColor, 0, 1 )
end

-- Register VGUI element
vgui.Register( "TLTextEntry", PANEL, "DTextEntry" )
PANEL = nil

--PATH addons/simplistic_presentation/lua/simplistic_presentation/client/cl_fonts.lua:
surface.CreateFont("SimplisticPresentation:Font:3d2d", {
    font = "Montserrat",
    size = 30,
    weight = 610,
    extended = false,
    shadow = true
})

surface.CreateFont("SimplisticPresentation:Font:Title", {
    font = "Montserrat",
    size = RX(50),
    weight = 610,
    extended = false,
    shadow = true
})

surface.CreateFont("SimplisticPresentation:Font:Subtitle", {
    font = "Montserrat",
    size = RX(35),
    shadow = true,
    extended = false
})

--PATH addons/simplistic_presentation/lua/simplistic_presentation/client/cl_hooks.lua:
local bToggleHud = false
local bWasHovered = false

local tPlayersHUDCache = {}
local iHUDCalcCooldown = 0

-- Override default LocalPlayer():Nick() function
hook.Add("Initialize", "SimplisticPresentation:Initialize", function()

    local PLAYER = FindMetaTable("Player")

    SimplisticPresentation.oldPlayerNick = SimplisticPresentation.oldPlayerNick or PLAYER.Nick

    function PLAYER:Nick()

        if not IsValid(LocalPlayer()) then return end

        local bShouldShowName = false
        bShouldShowName = bShouldShowName or self == LocalPlayer()
        bShouldShowName = bShouldShowName or LocalPlayer():IsSuperAdmin()
        bShouldShowName = bShouldShowName or LocalPlayer():GetNWBool("SimplisticPresentation:AdminMode")
        bShouldShowName = bShouldShowName or SimplisticPresentation.tKnownPlayers[self:SteamID64()]
        bShouldShowName = bShouldShowName or IsValid(SimplisticPresentation.AdminPanel)

        -- Billy's Logs compatibility (https://www.gmodstore.com/market/view/billys-logs)
        if GAS and GAS.Logging then
            bShouldShowName = bShouldShowName or IsValid(GAS.Logging.Menu)
        end

        if not table.IsEmpty(SimplisticPresentation.Config.tJobsKnowByEveryone) then
            for sName, tConfig in pairs(SimplisticPresentation.Config.tJobsKnowByEveryone) do
                if tConfig.bName then
                    bShouldShowName = bShouldShowName or sName == team.GetName(self:Team())
                end
            end
        end

        if not table.IsEmpty(SimplisticPresentation.Config.tJobsKnowEachOther) then
            for _, tJobs in pairs(SimplisticPresentation.Config.tJobsKnowEachOther) do
                bShouldShowName = bShouldShowName or tJobs[team.GetName(LocalPlayer():Team())] and tJobs[team.GetName(self:Team())]
            end
        end

        return bShouldShowName and SimplisticPresentation.oldPlayerNick(self) or SimplisticPresentation:GetSentence("Unknown")
    end

    SimplisticPresentation.oldGetJob = SimplisticPresentation.oldGetJob or PLAYER.getDarkRPVar

    function PLAYER:getDarkRPVar(sVar)
        if sVar == "job" and SimplisticPresentation.Config.bHideJobIfUnknown then
            local bShouldShowJob = false
            bShouldShowJob = bShouldShowJob or self == LocalPlayer()
            bShouldShowJob = bShouldShowJob or LocalPlayer():GetNWBool("SimplisticPresentation:AdminMode")
            bShouldShowJob = bShouldShowJob or SimplisticPresentation.tKnownPlayers[self:SteamID64()]

            if not table.IsEmpty(SimplisticPresentation.Config.tJobsKnowByEveryone) then
                for sName, tConfig in pairs(SimplisticPresentation.Config.tJobsKnowByEveryone) do
                    if tConfig.bJobName then
                        bShouldShowJob = bShouldShowJob or sName == team.GetName(self:Team())
                    end
                end
            end

            if not table.IsEmpty(SimplisticPresentation.Config.tJobsKnowEachOther) then
                for _, tJobs in pairs(SimplisticPresentation.Config.tJobsKnowEachOther) do
                    bShouldShowJob = bShouldShowJob or tJobs[team.GetName(LocalPlayer():Team())] and tJobs[team.GetName(self:Team())]
                end
            end

            return bShouldShowJob and SimplisticPresentation.oldGetJob(self, sVar) or ""
        else
            return SimplisticPresentation.oldGetJob(self, sVar)
        end
    end


end)

if SimplisticPresentation.Config.bDrawInContextMenu then

    hook.Add("OnContextMenuOpen", "SimplisticPresentation:OnContextMenuOpen", function()
        bToggleHud = true
        bWasHovered = false
    end)

    hook.Add("OnContextMenuClose", "SimplisticPresentation:OnContextMenuClose", function()
        bToggleHud = false
    end)

end

if SimplisticPresentation.Config.kDrawWhilePressingKey then

    hook.Add("KeyPress", "SimplisticPresentation:KeyPress", function(pPlayer, kKey)
        if not IsValid(pPlayer) then return end
        if kKey ~= SimplisticPresentation.Config.kDrawWhilePressingKey then return end

        if IsValid(SimplisticPresentation.InvisiblePanel) then
            SimplisticPresentation.InvisiblePanel:Remove()
        end

        local vPanel = vgui.Create("DPanel")
        vPanel:SetSize(ScrW(), ScrH())
        vPanel:SetPos(0, 0)
        vPanel:SetVisible(false)
        vPanel:SetMouseInputEnabled(true)

        SimplisticPresentation.InvisiblePanel = vPanel

        bToggleHud = true
        bWasHovered = false

    end)

    hook.Add("KeyRelease", "SimplisticPresentation:KeyRelease", function(pPlayer, kKey)
        if not IsValid(pPlayer) then return end
        if kKey ~= SimplisticPresentation.Config.kDrawWhilePressingKey then return end

        if IsValid(SimplisticPresentation.InvisiblePanel) then
            SimplisticPresentation.InvisiblePanel:Remove()
        end

        bToggleHud = false

    end)

end

local sIntroduceText = SimplisticPresentation:GetSentence("IntroduceYourself")
surface.SetFont("SimplisticPresentation:Font:3d2d")
local iIntroduceSize = surface.GetTextSize(sIntroduceText)

hook.Add("PostDrawTranslucentRenderables", "SimplisticPresentation:PostDrawTranslucentRenderables", function()

    if not bToggleHud and not SimplisticPresentation.Config.bDrawOverHeadDefaulty then return end

    if iHUDCalcCooldown < CurTime() then

        iHUDCalcCooldown = CurTime() + 1
        tPlayersHUDCache = {}

        local vecLocal = LocalPlayer():GetPos()

        for _, pPlayer in ipairs(player.GetAll()) do

            if not IsValid(pPlayer) then return end
            if not pPlayer:Alive() then return end

            if pPlayer ~= LocalPlayer() and pPlayer:GetPos():DistToSqr(vecLocal) < SimplisticPresentation.Config.iRenderDistance and pPlayer:GetRenderMode() ~= RENDERMODE_NONE then
                table.insert(tPlayersHUDCache, pPlayer)
            end

        end

    end

    for _, pPlayer in ipairs(tPlayersHUDCache) do
        if not IsValid(pPlayer) then return end

        local vecPlayer = pPlayer:EyePos()
        local angPlayer = LocalPlayer():EyeAngles()

        vecPlayer = vecPlayer + angPlayer:Right() * 10 + angPlayer:Up() * 2

        angPlayer:RotateAroundAxis( angPlayer:Forward(), 90 )
        angPlayer:RotateAroundAxis( angPlayer:Right(), -90 )

        w3d.Start3D2D(vecPlayer, Angle(0, angPlayer.y - 180, 90), 0.1)

            if SimplisticPresentation.Config.bDrawOverHeadDefaulty or bToggleHud then
                draw.SimpleText(pPlayer:Nick(), "SimplisticPresentation:Font:3d2d", -110, -100, SimplisticPresentation.Constants["cColors"]["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            if not bToggleHud then return w3d.End3D2D() end

            if not SimplisticPresentation.tKnownByWho[pPlayer:SteamID64()] and LocalPlayer():GetNWBool("SimplisticPresentation:AdminMode") == false and not SimplisticPresentation:IsLocallyKnown(pPlayer) then

                local iButtonW = iIntroduceSize + 50
                local iButtonX = 100 - (iButtonW / 2)

                w3d.Create("DButton", "SimplisticPresentation:3d2d:Introduce:" .. pPlayer:SteamID(), iButtonX, 0, iButtonW, 50,
                    function()
                        LocalPlayer():EmitSound("garrysmod/ui_click.wav")
                        net.Start('SimplisticPresentation:Introduce')
                            net.WriteEntity(pPlayer)
                        net.SendToServer()
                    end,
                    function(x, y, w, h, bHovered)
                        draw.RoundedBox(8, x, y, w, h, SimplisticPresentation.Constants["cColors"]["cBackground"])
                        draw.RoundedBox(8, x + 5, y + 5, w - 10, h - 10, SimplisticPresentation.Constants["cColors"]["cHeader"])
                        draw.SimpleText(SimplisticPresentation:GetSentence("IntroduceYourself"), "SimplisticPresentation:Font:3d2d", 100, 22, SimplisticPresentation.Constants["cColors"]["cText"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                        if bHovered and not bWasHovered then
                            bWasHovered = true
                            LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
                        end
                    end
                )

                
                
            end

            w3d.Create("DButton", "SimplisticPresentation:3d2d:GetId:" .. pPlayer:SteamID(), 70, 100, 50, 50,
            function()
                LocalPlayer():EmitSound("garrysmod/ui_click.wav")

                SetClipboardText(pPlayer:SteamID())

                chat.AddText(SimplisticPresentation.Constants["cColors"]["cBackground"], SimplisticPresentation.Config.sChatPrefix .. " " , SimplisticPresentation.Constants["cColors"]["cText"], SimplisticPresentation:GetSentence("CopyIdentifier"))

            end,
            function(x, y, w, h, bHovered)
                draw.RoundedBox(8, 70, 100, w, h, SimplisticPresentation.Constants["cColors"]["cBackground"])
                draw.RoundedBox(8, 75, 105, w - 10, h - 10, SimplisticPresentation.Constants["cColors"]["cHeader"])

                surface.SetDrawColor(color_white)
                surface.SetMaterial(SimplisticPresentation.Constants["mUi"]["mClipboard"])
                        surface.DrawTexturedRect(77, 107, 35, 35)

                        if bHovered and not bWasHovered then
                            bWasHovered = true
                            LocalPlayer():EmitSound("garrysmod/ui_hover.wav")
                        end

                    end
                )

        w3d.End3D2D()
    end

end)


concommand.Add(SimplisticPresentation.Config.sAdminModeConsoleCommand, function()

    if not SimplisticPresentation.Config.tAdminModeGroups[LocalPlayer():GetUserGroup()] then return end

    net.Start("SimplisticPresentation:AdminMode:Toggle")
    net.SendToServer()

end)
--PATH addons/the_sit_anywhere_script/lua/sitanywhere/ground_sit.lua:
SitAnywhere = SitAnywhere or {}
SitAnywhere.GroundSit = true
local TAG = "SitAnyG_"

hook.Add("SetupMove", TAG .. "SetupMove", function(ply, mv)
	local butts = mv:GetButtons()

	if not ply:GetNWBool(TAG) then
		return
	end

	local getUp = bit.band(butts, IN_JUMP) == IN_JUMP or ply:GetMoveType() ~= MOVETYPE_WALK or ply:InVehicle() or not ply:Alive()

	if getUp then
		ply:SetNWBool(TAG, false)
	end

	local move = bit.band(butts, IN_DUCK) == IN_DUCK

	butts = bit.bxor(bit.bor(butts, bit.bor(IN_JUMP, IN_DUCK)), IN_JUMP)

	if move then
		butts =  bit.bxor(bit.bor(bit.bor(butts, IN_WALK), IN_SPEED), IN_SPEED)

		mv:SetButtons(butts)
		return
	end

	mv:SetButtons(butts)
	mv:SetSideSpeed(0)
	mv:SetForwardSpeed(0)
	mv:SetUpSpeed(0)
end)

hook.Add("CalcMainActivity", TAG .. "CalcMainActivity", function(ply, vel)
	local seq = ply:LookupSequence("pose_ducking_02")
	if ply:GetNWBool(TAG) and seq and vel:Length2DSqr() < 1 then
		return ACT_MP_SWIM, seq
	else
		return
	end
end)


if SERVER then
	local AllowGroundSit = CreateConVar("sitting_allow_ground_sit", "1", {FCVAR_ARCHIVE}, "Allows people to sit on the ground on your server", 0, 1)
	hook.Add("HandleSit", "GroundSit", function(ply, dists, EyeTrace)
		if #dists == 0 and ply:GetInfoNum("sitting_ground_sit", 1) == 1 and AllowGroundSit:GetBool() and ply:EyeAngles().p > 80 then
			local t = hook.Run("OnGroundSit", ply, EyeTrace)
			if t == false then
				return
			end

			if not ply:GetNWBool(TAG) then
				ply:SetNWBool(TAG, true)
				ply.LastSit = CurTime() + 1
				return true
			end
		end
	end)

	concommand.Add("ground_sit", function(ply)
		if AllowGroundSit:GetBool() and (not ply.LastSit or ply.LastSit < CurTime()) then
			ply:SetNWBool(TAG, not ply:GetNWBool(TAG))
			ply.LastSit = CurTime() + 1
		end
	end)
else
	CreateClientConVar("sitting_ground_sit", "1.00", true, true, "Toggles the ability for you to sit on the ground", 0, 1)
end

--PATH addons/sl_main_system/lua/autorun/sl_config_portail.lua:
-- sh
game.AddParticles("particles/[sl-nw].pcf")

MADSL_TIMER_PORTAIL = 1200 -- 10 minutes.

PORTAIL_SL_POS = {
    "-9200.112305 8346.813477 7367.683594",
    "4113.316406 4390.056641 6959.522461",
    "2746.091553 -7771.473633 6690.746582",
    "-4177.986328 -9018.655273 6928.473633",
    "-2949.195068 14675.844727 7368.391602",
    "1957.441284 14892.801758 6923.084473",
    "12830.444336 -3336.326172 6649.391602",
    "-1147.250366 -1295.316528 6837.102539",
    "-14889.402344 2133.775391 7358.208496",
    "-11958.249023 15660.769531 7360.031250",
    "-5289.684082 -14914.066406 7073.685059",
    -- "2615.934570 11824.547852 6985.689941",
    "6637.751465 15592.846680 6941.542969",
    "-943.360046 -14873.880859 6958.558105"
}

PORTAIL_SL = {
    ["Portail1"] = {
        id = "Portail1",
        rang = "E",
        pos_in = "-4746.610352 2817.483643 -15600.581055",
        portail_retour_pos = "-4748.630371 2966.977295 -15542.298828",
        portail_retour_angle = "0.000000 0.000000 0.000000",
        resources_iron_pos = {
            "-5044.515625 1686.718018 -15661.287109",
            "-3562.667236 2023.732666 -15661.075195",
            "-4044.357666 179.225189 -15637.656250",
        },
        portail_spawn_rdm = true,

        boss_spawn_pos = "-4706.313477 -1611.038330 -15596.408203",
        mob_spawn1_pos = "-4765.256836 -1573.901978 -15590.968750",
        mob_spawn2_pos = "-5223.325195 -76.911781 -15593.776367",
        mob_spawn3_pos = "-4148.579102 -1627.234253 -15573.504883",
        mob_spawn4_pos = "-4685.959473 -1758.474365 -15563.953125",
        mob_spawn5_pos = "-5160.467285 -1813.510010 -15592.590820",
        mob_spawn6_pos = "-5843.458008 1346.899536 -15600.375977",
        mob_spawn7_pos = "-5891.677734 1729.616821 -15588.340820",
        mob_spawn8_pos = "-3740.154785 1767.632202 -15627.716797",
        mob_spawn9_pos = "-3734.213379 1398.094116 -15600.724609",
        mob_spawn10_pos = "-4279.916992 -53.088943 -15606.000977",

        -- mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        -- mob_spawn_pos2 = "10829.689453 2599.001709 -8364.630859",

        mob_in = {
            -- ["mad_goblin_mob"] = 7,
            -- ["mad_goblin_boss"] = 1,
            ["npc_goblin"] = 7,
            ["npc_goblin_mage"] = 1,
        },
    },
    ["Portail2"] = {
        id = "Portail2",
        rang = "D",
        pos_in = "2602.991943 2722.479004 -15579.860352",
        portail_retour_pos = "2602.234619 2857.594238 -15514.455078",
        portail_retour_angle = "0.000000 0.000000 0.000000",
        resources_iron_pos = {},
        portail_spawn_rdm = true,

        boss_spawn_pos = "2683.862305 -2353.906250 -15505.331055",
        mob_spawn1_pos = "2266.223633 -2297.347168 -15533.035156",
        mob_spawn2_pos = "3101.227539 -1466.326172 -15558.058594",
        mob_spawn3_pos = "2098.192139 -302.442383 -15576.338867",
        mob_spawn4_pos = "2708.458008 34.598457 -15580.445312",
        mob_spawn5_pos = "2623.139893 1250.095093 -15559.374023",
        mob_spawn6_pos = "1724.684692 1723.222534 -15577.452148",
        mob_spawn7_pos = "1417.016846 1281.035278 -15578.561523",
        mob_spawn8_pos = "3344.810303 1669.470947 -15574.435547",
        mob_spawn9_pos = "3835.265137 1748.259766 -15595.040039",
        mob_spawn10_pos = "3769.733154 2445.564941 -15555.178711",

        -- mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        -- mob_spawn_pos2 = "10829.689453 2599.001709 -8364.630859",

        mob_in = {
            -- ["mad_loup_mob"] = 4,
            -- ["mad_loup2_mob"] = 3,
            -- ["mad_loup_boss"] = 1,
            ["npc_loupevo"] = 3,
            ["npc_loupevo2"] = 1,
            ["npc_loup"] = 6,
        },
    },
    /*["Portail3"] = {
        id = "Portail3",
        rang = "C",
        pos_in = "1602.186401 -3010.867920 -5676.509766",
        portail_retour_pos = "1822.316284 -3329.587158 -5569.907227",

        portail_spawn_rdm = true,

        boss_spawn_pos = "-1953.208496 -813.783997 -5696.233398",
        mob_spawn1_pos = "-523.273926 964.616089 -5745.743164",
        mob_spawn2_pos = "697.415771 2093.989990 -5742.290527",
        mob_spawn3_pos = "-767.967468 3249.844727 -5670.465820",
        mob_spawn4_pos = "-3435.652832 1275.266724 -5187.843750",
        mob_spawn5_pos = "-2365.103760 -644.083435 -5681.276367",
        mob_spawn6_pos = "-1709.166016 -2785.002197 -5642.550293",
        mob_spawn7_pos = "1779.420410 -1040.913452 -5719.583496",
        mob_spawn8_pos = "1159.680664 520.573425 -5453.991211",
        -- mob_spawn9_pos = "11477.143555 1939.824951 -8278.652344",

        -- mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        -- mob_spawn_pos2 = "10829.689453 2599.001709 -8364.630859",

        mob_in = {
            -- ["mad_undead_mob"] = 7,
            -- ["mad_undead_boss"] = 1,
            ["npc_centipede"] = 7,
            ["npc_centipedeboss"] = 1,
        },
    },*/
    ["Portail4"] = {
        id = "Portail4",
        rang = "C",
        resources_iron_pos = {},
        pos_in = "-8036.697266 1187.519775 55.892059",
        portail_retour_pos = "-8253.001953 1208.190063 76.524658",
        portail_retour_angle = "0.000000 90.000000 0.000000",

        portail_spawn_rdm = true,

        boss_spawn_pos = "3008.474365 878.148132 59.570091",
        mob_spawn1_pos = "2321.509033 219.734787 53.452766",
        mob_spawn2_pos = "3128.952148 -11.684317 64.783577",
        mob_spawn3_pos = "-15.742541 -54.154232 58.996223",
        mob_spawn4_pos = "-3228.728027 119.741188 53.480881",
        mob_spawn5_pos = "-4720.834473 1373.591431 53.616074",
        mob_spawn6_pos = "-4864.850586 -125.114136 100.301758",
        mob_spawn7_pos = "-4939.721680 519.726074 90.933838",
        mob_spawn8_pos = "-1723.581299 -228.838913 68.178658",
        mob_spawn9_pos = "-1640.464355 295.233856 67.117935",

        -- mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        -- mob_spawn_pos2 = "10829.689453 2599.001709 -8364.630859",

        mob_in = {
            -- ["mad_werewolf_mob"] = 7,
            -- ["mad_werewolf_boss"] = 1,
            ["npc_werewolf"] = 7,
            ["npc_werewolfboss"] = 1,
        },
    },
    ["Portail5"] = {
        id = "Portail5",
        rang = "C",
        resources_iron_pos = {},
        pos_in = "12452.816406 13488.077148 -10909.876953",
        portail_retour_pos = "12588.464844 13481.366211 -10870.485352",
        portail_retour_angle = "0.000000 90.000000 0.000000",

        portail_spawn_rdm = true,

        boss_spawn_pos = "7830.703613 6457.515625 -11191.483398",
        mob_spawn1_pos = "9978.942383 13698.403320 -10870.339844",
        mob_spawn2_pos = "7511.564941 7333.662109 -11122.801758",
        mob_spawn3_pos = "9212.478516 7339.297363 -11183.506836",
        mob_spawn4_pos = "7941.777344 8869.488281 -11184.900391",
        mob_spawn5_pos = "8532.405273 9390.731445 -11141.798828",
        mob_spawn6_pos = "9290.447266 10287.065430 -11004.252930",
        mob_spawn7_pos = "8473.414062 11615.564453 -10902.536133",
        mob_spawn8_pos = "9540.636719 12564.406250 -10892.922852",
        mob_spawn9_pos = "10054.128906 13784.808594 -10893.884766",

        -- mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        -- mob_spawn_pos2 = "10829.689453 2599.001709 -8364.630859",

        mob_in = {
            ["npc_ours"] = 7,
            ["npc_oursboss"] = 1,
        },
    },
    ["Portail6"] = {
        id = "Portail6",
        rang = "A",
        pos_in = "-767.407532 -3246.021973 -10713.680664",
        portail_retour_pos = "-769.139160 -3390.968750 -10650.012695",
        resources_iron_pos = {},

        portail_spawn_rdm = true,

        boss_spawn_pos = "-2538.321777 1513.416870 -10654.496094",
        mob_spawn1_pos = "-2532.261230 -448.877777 -10676.693359",
        mob_spawn2_pos = "-2268.409424 -1747.755127 -10675.500977",
        mob_spawn3_pos = "-1279.632080 -1595.362549 -10685.289062",
        mob_spawn4_pos = "187.791687 -1527.760864 -10685.624023",
        mob_spawn5_pos = "-660.954956 -2184.343750 -10775.027344",
        mob_spawn6_pos = "148.064621 -2259.614502 -10772.790039",


        mob_in = {
            ["npc_demon"] = 6,
            ["npc_demonboss"] = 1,
        },
    },
    /*["Portail5"] = {
        id = "Portail5",
        rang = "B",
        pos_in = "8666.269531 332.342926 -5856.509277",
        portail_retour_pos = "8203.083984 327.718628 -5810.937988",

        portail_spawn_rdm = true,

        boss_spawn_pos = "11649.155273 777.814819 -6999.020996",
        mob_spawn1_pos = "8538.118164 4093.790527 -6050.194336",
        mob_spawn2_pos = "10292.964844 3545.056396 -6208.950195",
        mob_spawn3_pos = "10342.483398 1374.438721 -6158.183105",
        mob_spawn4_pos = "9431.056641 324.766449 -6335.727051",
        mob_spawn5_pos = "8213.784180 1185.045044 -6030.428711",
        mob_spawn6_pos = "7474.049316 3916.817627 -6808.809082",
        mob_spawn7_pos = "8252.250000 6740.960449 -7091.507324",
        mob_spawn8_pos = "10829.689453 2599.001709 -8364.630859",
        mob_spawn9_pos = "11477.143555 1939.824951 -8278.652344",
        mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        mob_spawn_pos2 = "10829.689453 2599.001709 -8364.630859",

        mob_in = {
            -- ["mad_lezard_mob"] = 7,
            -- ["mad_lezard_boss"] = 1,
            ["npc_lezard"] = 7,
            ["npc_lezardboss"] = 1,
        },
    },
    ["Portail6"] = {
        id = "Portail6",
        rang = "A",
        pos_in = "-3110.909668 14527.335938 11687.906250",
        portail_retour_pos = "-3117.452148 14880.790039 11540.536133",

        portail_spawn_rdm = true,

        boss_spawn_pos = "3706.211670 -13031.081055 13687.485352",
        mob_spawn1_pos = "-2863.277588 11522.015625 14086.766602",
        mob_spawn2_pos = "4270.559082 11831.581055 13397.459961",
        mob_spawn3_pos = "6990.931641 6010.465820 14207.132813",
        mob_spawn4_pos = "-2184.155762 -807.941162 14416.163086",
        mob_spawn5_pos = "4626.442383 -3310.140137 15221.527344",
        mob_spawn6_pos = "4293.313477 -7948.716309 14814.253906",
        mob_spawn7_pos = "9253.000977 -10537.446289 14337.355469",
        mob_spawn8_pos = "1167.879272 -11890.745117 14804.454102",
        mob_spawn9_pos = "-475.148682 -948.650391 15265.119141",

        mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        mob_spawn_pos2 = "9135.164063 3711.556641 -5968.683594",

        mob_in = {
            -- ["mad_ours_mob"] = 7,
            -- ["mad_ours_boss"] = 1,
            ["npc_ours"] = 7,
            ["npc_oursboss"] = 1,
        },
    },
    ["Portail7"] = {
        id = "Portail7",
        rang = "A",
        pos_in = "68.003593 -12477.157227 -14930.027344",
        portail_retour_pos = "150.871262 -13429.195313 -15017.065430",

        portail_spawn_rdm = true,

        boss_spawn_pos = "-560.244446 2128.675781 -13421.482422",
        mob_spawn1_pos = "6456.131836 4328.862305 -13880.014648",
        mob_spawn2_pos = "9030.442383 127.092186 -13575.535156",
        mob_spawn3_pos = "7817.118164 -7465.097656 -13428.999023",
        mob_spawn4_pos = "-242.774765 -7842.071289 -13894.651367",
        mob_spawn5_pos = "-7379.820313 -5174.024414 -13366.150391",
        mob_spawn6_pos = "-9306.342773 1589.355713 -13362.654297",
        mob_spawn7_pos = "-8969.431641 9131.277344 -13459.266602",
        mob_spawn8_pos = "-1692.763916 9009.457031 -12568.344727",
        mob_spawn9_pos = "-355.166382 -1684.483643 -12998.171875",

        mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        mob_spawn_pos2 = "9135.164063 3711.556641 -5968.683594",


        mob_in = {
            -- ["mad_centipede_mob"] = 7,
            -- ["mad_centipede_boss"] = 1,
            ["npc_centipede"] = 7,
            ["npc_centipedeboss"] = 1,
        },
    },*/
    /*["Portail8"] = {
        id = "Portail8",
        rang = "A",
        pos_in = "-3110.909668 14527.335938 11687.906250",
        portail_retour_pos = "-3117.452148 14880.790039 11540.536133",

        portail_spawn_rdm = true,

        boss_spawn_pos = "3706.211670 -13031.081055 13687.485352",
        mob_spawn1_pos = "-2863.277588 11522.015625 14086.766602",
        mob_spawn2_pos = "4270.559082 11831.581055 13397.459961",
        mob_spawn3_pos = "6990.931641 6010.465820 14207.132813",
        mob_spawn4_pos = "-2184.155762 -807.941162 14416.163086",
        mob_spawn5_pos = "4626.442383 -3310.140137 15221.527344",
        mob_spawn6_pos = "4293.313477 -7948.716309 14814.253906",
        mob_spawn7_pos = "9253.000977 -10537.446289 14337.355469",
        mob_spawn8_pos = "1167.879272 -11890.745117 14804.454102",
        mob_spawn9_pos = "-475.148682 -948.650391 15265.119141",

        mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        mob_spawn_pos2 = "9135.164063 3711.556641 -5968.683594",

        mob_in = {
            ["mad_elf_mob"] = 7,
            ["mad_elf_boss"] = 1,
        },
    },
    ["Portail9"] = {
        id = "Portail9",
        rang = "S",
        pos_in = "68.003593 -12477.157227 -14930.027344",
        portail_retour_pos = "150.871262 -13429.195313 -15017.065430",

        portail_spawn_rdm = true,

        boss_spawn_pos = "-560.244446 2128.675781 -13421.482422",
        mob_spawn1_pos = "6456.131836 4328.862305 -13880.014648",
        mob_spawn2_pos = "9030.442383 127.092186 -13575.535156",
        mob_spawn3_pos = "7817.118164 -7465.097656 -13428.999023",
        mob_spawn4_pos = "-242.774765 -7842.071289 -13894.651367",
        mob_spawn5_pos = "-7379.820313 -5174.024414 -13366.150391",
        mob_spawn6_pos = "-9306.342773 1589.355713 -13362.654297",
        mob_spawn7_pos = "-8969.431641 9131.277344 -13459.266602",
        mob_spawn8_pos = "-1692.763916 9009.457031 -12568.344727",
        mob_spawn9_pos = "-355.166382 -1684.483643 -12998.171875",

        mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
        mob_spawn_pos2 = "9135.164063 3711.556641 -5968.683594",


        mob_in = {
            ["mad_ant_mob"] = 7,
            ["mad_ant_boss"] = 1,
        },
    },
    ["Portail10"] = {
        id = "Portail10",
        rang = "S",
        pos_in = "-10000.157227 -512.834473 -8964.921875",
        portail_retour_pos = "-10280.076172 -290.056091 -9121.848633",

        portail_spawn_rdm = true,

        boss_spawn_pos = "-7155.383301 -1966.817749 -8917.492188",
        mob_spawn1_pos = "-7155.383301 -1966.817749 -8917.492188",

        mob_spawn_pos1 = "-7155.383301 -1966.817749 -8917.492188",
        mob_spawn_pos2 = "-7155.383301 -1966.817749 -8917.492188",


        mob_in = {
            ["mad_dragon_boss"] = 1,
        },
    },
    ["Portail11"] = {
        id = "Portail11",
        rang = "S",
        pos_in = "-10000.157227 -512.834473 -8964.921875",
        portail_retour_pos = "-10280.076172 -290.056091 -9121.848633",

        portail_spawn_rdm = true,

        boss_spawn_pos = "-7155.383301 -1966.817749 -8917.492188",
        mob_spawn1_pos = "-7155.383301 -1966.817749 -8917.492188",

        mob_spawn_pos1 = "-7155.383301 -1966.817749 -8917.492188",
        mob_spawn_pos2 = "-7155.383301 -1966.817749 -8917.492188",


        mob_in = {
            ["mad_igris_boss"] = 1,
        },
    },*/
    -- ["Portail7"] = {
    --     rang = "A",
    --     pos_in = "68.003593 -12477.157227 -14930.027344",
    --     portail_retour_pos = "150.871262 -13429.195313 -15017.065430",

    --     portail_spawn_rdm = true,

    --     boss_spawn_pos = "-560.244446 2128.675781 -13421.482422",
    --     mob_spawn1_pos = "-1647.993774 -8879.562500 -14850.949219",
    --     mob_spawn2_pos = "1594.192627 -6743.795898 -14900.666992",
    --     mob_spawn3_pos = "1220.141357 -6340.152832 -14900.448242",
    --     mob_spawn4_pos = "1623.923584 -5718.323730 -14900.608398",
    --     mob_spawn5_pos = "179.628967 -2319.695801 -13400.063477",
    --     mob_spawn6_pos = "7474.049316 3916.817627 -6808.809082",
    --     mob_spawn7_pos = "-2007.827637 -38.327381 -13400.444336",
    --     mob_spawn8_pos = "-501.288086 524.527832 -13400.554688",
    --     mob_spawn9_pos = "-1277.018799 1243.060913 -13400.641602",
    --     mob_spawn_pos1 = "7466.850586 6496.564453 -6036.760742",
    --     mob_spawn_pos2 = "9135.164063 3711.556641 -5968.683594",

    --     mob_in = {
    --         ["npc_orc"] = 9,
    --         ["npc_orcboss"] = 1,
    --     },
    -- },
}
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_splayerselector.lua:
slib.panels = slib.panels or {}

local PANEL = {}

local font, sid_font, empty_font = slib.createFont("Roboto", 13), slib.createFont("Roboto", 11), slib.createFont("Roboto", 15)
local textcolor, textcolor_60 = slib.getTheme("textcolor"), slib.getTheme("textcolor", -60)
local hovercolor, margin, maincolor_12, maincolor_15 = slib.getTheme("hovercolor"), slib.getTheme("margin"), slib.getTheme("maincolor", 12), slib.getTheme("maincolor", 15)
local icon = Material("slib/down-arrow.png", "smooth")
local placeholder = "Select Option"

function PANEL:Init()
    self:SetTall(slib.getScaledSize(25, "y"))
    self:setTitle(placeholder, TEXT_ALIGN_LEFT)
    self.iteration = 0
    self.options = {}
    self.option_h = slib.getScaledSize(32, "y")
    self.titl = ""

    self.close = vgui.Create("DButton")
    self.close:Dock(FILL)
    self.close:SetText("")
    self.close:SetVisible(false)

    self.close.Paint = function() end

    self.close.DoClick = function()
        self.close:SetVisible(false)
        if IsValid(self.droppedFrame) then
            self.droppedFrame:SetVisible(false)
        end

        if isfunction(self.onClose) then self.onClose(self) end

        self:setTitle(self.titl, TEXT_ALIGN_LEFT, true)

        if !self.ply then
            self:setTitle(placeholder, TEXT_ALIGN_LEFT)
        end
    end

    self.droppedFrame = vgui.Create("EditablePanel")
    self.droppedFrame:SetWide(self:GetWide())
    self.droppedFrame:SetVisible(false)

    self.search = vgui.Create("STextEntry", self.droppedFrame)
    :Dock(TOP)
    :SetTall(self:GetTall())
    
    self.search.onValueChange = function(val)
        for k,v in ipairs(self.droppedMenu:GetCanvas():GetChildren()) do
            if !v.ply then continue end

            local filtered = false

            if self.filter then
                if self.filter(v.ply) == false then filtered = true end
            end

            v:SetVisible((val:Trim() == "" or string.find(v.nick:lower(), val:lower()) or val == v.sid64) and !filtered)
        end

        self.droppedMenu.SizeToChilds()
        self.droppedMenu:GetCanvas():InvalidateLayout(true)
    end

    self.closesearch = vgui.Create("SButton", self.search)
    self.closesearch:SetSize(self.option_h, self.option_h)
    self.closesearch.Paint = function(s,w,h) end
    self.closesearch.DoClick = self.close.DoClick

    self.droppedMenu = vgui.Create("SScrollPanel", self.droppedFrame)
    self.droppedMenu:SetWide(self:GetWide())
    self.droppedMenu:SetPos(0, self:GetTall())
    self.droppedMenu.Paint = function(s,w,h)
        surface.SetDrawColor(maincolor_15)
        surface.DrawRect(0,0,w,h)

        draw.SimpleText("No entries.", empty_font, w * .5, self.option_h * .5, textcolor_60, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    self.droppedMenu.SizeToChilds = function()
        local childs = self.droppedMenu:GetCanvas():GetChildren()
        local visible_childs = 0
        local childs_h = 0

        for k,v in ipairs(childs) do
            if v:IsVisible() then
                childs_h = childs_h + v:GetTall()
                visible_childs = visible_childs + 1
            end

            if visible_childs >= 5 then break end
        end
        
        self.droppedMenu:SetTall(math.max(childs_h, visible_childs <= 0 and self.option_h or 0))
        self.droppedFrame:SetTall(self.droppedMenu:GetTall() + self.search:GetTall())
    end

    self.no_player = vgui.Create("SButton", self.droppedMenu)
    :Dock(TOP)
    :SetLinePos(0)
    :SetTall(slib.getScaledSize(24, "y"))
    :SetZPos(-100)
    :SetVisible(false)

    self.no_player.skipVisible = true

    local noply_titl = "No Player"

    self.no_player.Paint = function(s,w,h)        
        surface.SetDrawColor(s:IsHovered() and maincolor_12 or maincolor_15)
        surface.DrawRect(0, 0, w, h)

        draw.SimpleText(noply_titl, self.buttonfont or s.font, margin, h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    self.no_player.DoClick = function()
        self.titl = noply_titl
        self.ply = nil

        self.close.DoClick()
        self:setTitle(noply_titl, TEXT_ALIGN_LEFT, true)

        if isfunction(self.onValueChange) then
            self.onValueChange(val, ply)
        end
    end

    slib.panels["SPlayerSelector"] = slib.panels["SPlayerSelector"] or {}
    table.insert(slib.panels["SPlayerSelector"], self)

    timer.Simple(0, function()
        if !IsValid(self) then return end

        for k,v in ipairs(player.GetAll()) do
            self:addOption(v)
        end
    end)
end

function PANEL:SetScrollBG(col)
    self.droppedMenu.scrollbg = col
end

function PANEL:FindSelectPlayer(ply)
    for k,v in ipairs(self.droppedMenu:GetCanvas():GetChildren()) do
        if v.ply == ply then
            v.DoClick()
            
            break
        end
    end
end

function PANEL:SetPlaceholder(str)
    self:setTitle(str, TEXT_ALIGN_LEFT)
end

function PANEL:OnRemove()
    if IsValid(self.droppedFrame) then self.droppedFrame:Remove() end
end

function PANEL:popupAlone()
    self:DoClick()

    local x, y = input.GetCursorPos()
    if !IsValid(self.droppedFrame) then return end
    self.droppedFrame:SetWide(self:GetWide())
    self.droppedFrame:SetPos(x, y)
    self.droppedFrame:MakePopup()
    self:SetVisible(false)

    self.droppedMenu:SetWide(self.droppedFrame:GetWide())

    self.onClose = function() self:Remove() end

    return self
end

function PANEL:updatedFilters()
    for k, v in ipairs(self.droppedMenu:GetCanvas():GetChildren()) do
        local result = true
        
        if v.skipVisible then continue end

        if self.filter then
            if self.filter(v.ply) == false then result = false end    
        end

        v:SetVisible(result)
    end

    self:pickFirst()
end

function PANEL:pickFirst()
    local childs = self.droppedMenu:GetCanvas():GetChildren()

    for k,v in ipairs(childs) do
        if !v:IsVisible() then continue end
        
        v.DoClick(true)

        break
    end
end

function PANEL:ScrollToFirst()
    local childs = self.droppedMenu:GetCanvas():GetChildren()

    for k,v in ipairs(childs) do
        if !v:IsVisible() then continue end
        
        self.droppedMenu:ScrollToChild(v)

        break
    end
end

function PANEL:ShowNoPlayer(bool)
    self.no_player:SetVisible(bool)

    self.droppedMenu:InvalidateLayout(true)
    self.droppedMenu:SizeToChilds()
end

function PANEL:addOption(ply)
    self.addedPlys = self.addedPlys or {}
    
    if self.addedPlys[ply] then return end
    
    self.addedPlys[ply] = true

    local iteration = self.iteration
    local nick, sid64 = ply:Nick(), ply:SteamID64()

    self.options[iteration] = vgui.Create("SButton", self.droppedMenu)
    :Dock(TOP)
    :SetLinePos(0)
    :SetTall(self.option_h)

    local visibility = !self.filter or self.filter(ply) != false
    self.options[iteration]:SetVisible(visibility)

    self.options[iteration].ply = ply
    self.options[iteration].nick = nick
    self.options[iteration].sid64 = sid64
    
    local avatar = vgui.Create("AvatarImage", self.options[iteration])
    avatar:SetPlayer(ply, 64)
    avatar:SetSize(self.option_h, self.option_h)
    avatar:SetMouseInputEnabled(false)

    local wide = self.options[iteration]:GetWide()

    self.options[iteration].accentheight = 1

    self.droppedMenu:InvalidateLayout(true)
    self.droppedMenu:SizeToChilds()

    self.options[iteration].DoClick = function()
        self.titl = nick
        self.ply = ply

        self.close.DoClick()
        self:setTitle(nick, TEXT_ALIGN_LEFT, true)

        if isfunction(self.onValueChange) then
            self.onValueChange(val, ply)
        end
    end

    self.options[iteration].Paint = function(s,w,h)
        if !IsValid(ply) then s:Remove() if IsValid(self.droppedMenu) then self.droppedMenu:InvalidateLayout(true) end end
        
        surface.SetDrawColor(s:IsHovered() and maincolor_12 or maincolor_15)
        surface.DrawRect(0, 0, w, h)

        draw.SimpleText(nick, self.buttonfont or self.options[iteration].font, self.option_h + margin, h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
        draw.SimpleText(sid64, sid_font, self.option_h + margin, h * .5, textcolor_60, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end
    
    if wide > self:GetWide() then
        self:SetWide(wide)
    end
    
    self.iteration = self.iteration + 1

    self.lastchild = self.options[iteration]

    return self
end

function PANEL:SelectOption(int)
    self.options[int].DoClick()

    return self
end

function PANEL:Reposition()
    local x, y = self:LocalToScreen(0,0)
    if !IsValid(self.droppedMenu) then return end
    self.droppedFrame:SetWide(self:GetWide())
    self.droppedFrame:SetPos(x, y)
    self.droppedFrame:MakePopup()

    self.droppedMenu:SetWide(self.droppedFrame:GetWide())
    self.closesearch:SetPos(self:GetWide() - self.option_h, 0)
end

function PANEL:DoClick()
    self.close:SetVisible(!self.droppedFrame:IsVisible())
    self.close:MakePopup()

    local childs = self.droppedMenu:GetCanvas():GetChildren()

    self.droppedFrame:SetVisible(!self.droppedFrame:IsVisible())
    self.search:SetValue(self.search.placeholder)

    for k, v in ipairs(childs) do
        local result = true

        if v.skipVisible then continue end

        if self.filter then
            if self.filter(v.ply) == false then result = false end    
        end

        v:SetVisible(result)
    end

    self.droppedMenu:GetCanvas():InvalidateLayout()

    self:ScrollToFirst()

    self.droppedMenu.SizeToChilds()

    self:setTitle("")

    self:Reposition()
end

function PANEL:OnSizeChanged()
    self:Reposition()
end

function PANEL:PaintOver(w,h)
    local size = math.min(h * .7, slib.getScaledSize(12, "y"))
    local thickness = slib.getScaledSize(2, "x")

    draw.NoTexture()

    local wantedCol = (self:IsHovered() or (IsValid(self.closesearch) and self.closesearch:IsHovered())) and color_white or hovercolor

    surface.SetDrawColor(wantedCol)
    surface.SetMaterial(icon)
    surface.DrawTexturedRect(w - size - margin * 2, h * .5 - size * .5, size, size)
end

hook.Add("OnEntityCreated", "slib:AddNewPlayerSelector", function(ent)
    timer.Simple(3, function()
        if IsValid(ent) and slib.panels["SPlayerSelector"] and ent:IsPlayer() then
            for k,v in ipairs(slib.panels["SPlayerSelector"]) do
                if !IsValid(v) then continue end

                v:addOption(ent)
            end
        end
    end)
end)

vgui.Register("SPlayerSelector", PANEL, "SButton")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_sstatement.lua:
local PANEL = {}

local colorpickerMat, checkmarkMat = Material("slib/icons/color-picker16.png", "noclamp smooth" ), Material("slib/icons/checkmark.png", "noclamp smooth" )

local textcolor, textcolor_50, maincolor, maincolor_7, maincolor_10, accentcolor, cleanaccentcolor = slib.getTheme("textcolor"), slib.getTheme("textcolor", -50), slib.getTheme("maincolor"), slib.getTheme("maincolor", 7), slib.getTheme("maincolor", 10), slib.getTheme("accentcolor"), slib.getTheme("accentcolor")
local margin = slib.getTheme("margin")

function PANEL:Init()
    self:Dock(TOP)
    self:SetTall(slib.getScaledSize(25, "y"))
    self:DockMargin(margin, 0, margin, margin)
    self.font = slib.createFont("Roboto", 14)
	self.bg = maincolor_7
	self.elemBg = maincolor
	
	slib.wrapFunction(self, "SetZPos", nil, function() return self end, true)
	slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
end

function PANEL:Paint(w,h)
    surface.SetDrawColor(self.bg)
    surface.DrawRect(0, 0, w, h)
	
    draw.SimpleText(self.name, self.font, self.center and w * .5 - self.xoffset - margin or margin, h * .5, textcolor, self.center and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end

function PANEL:OnSizeChanged(w, h)
	if self.center then
		self:setCenter()
	end
end

function PANEL:setCenter()
	self.center = true

	self.xoffset = self.element:GetWide() * .5

	surface.SetFont(self.font)
	local w, h = surface.GetTextSize(self.name)

	local l,t,r,b = self.element:GetDockMargin()
	self.element:DockMargin(l,t,self:GetWide() * .5 - self.xoffset - (w * .5) - margin,b)
end

function PANEL:addStatement(name, value)
    self.name = name
	local statement = slib.getStatement(value)
	local element

	if statement == "color" then
		element = vgui.Create("SButton", self)
		element:SetWide(slib.getScaledSize(25, "y") - slib.getScaledSize(2, "x") - slib.getScaledSize(2, "x"))
		element.color = value
		element.old_color = value

		element.Paint = function(s,w,h)
			draw.RoundedBox(h * .3, 0, 0, w, h, element.color)

			surface.SetDrawColor(textcolor_50)
			surface.SetMaterial(colorpickerMat)
			local sizew, sizeh = 16, 16

			surface.DrawTexturedRect( (w * .5) - (sizew * .5), (h * .5) - (sizeh * .5), sizew, sizeh )
		end

		element.OnRemove = function()
			if IsValid(element.ColorPicker) then element.ColorPicker:Remove() end
		end

		element.DoClick = function()
			if element.ColorPicker and IsValid(element.ColorPicker) then return end

			local posx, posy = self:LocalToScreen( element:GetPos() )

			element.ClosePicker = vgui.Create("SButton")
			element.ClosePicker:Dock(FILL)
			element.ClosePicker:MakePopup()
			element.ClosePicker.DoClick = function()
				if IsValid(element.ColorPicker) then element.ColorPicker:Remove() end
				if IsValid(element.ClosePicker) then element.ClosePicker:Remove() end
			end

			element.ClosePicker.Paint = function() end

			element.ColorPicker = vgui.Create("DColorMixer")
			element.ColorPicker:SetSize( slib.getScaledSize(200, "x"), slib.getScaledSize(160, "y") )
			element.ColorPicker:SetPos( posx - element.ColorPicker:GetWide(), posy )
			element.ColorPicker:SetPalette(false)
			element.ColorPicker:SetAlphaBar(false)
			element.ColorPicker:SetAlphaBar( true )
			element.ColorPicker:SetWangs(false)
			element.ColorPicker:SetColor(element.color and element.color or Color(255,0,0))
			element.ColorPicker:MakePopup()

			element.ColorPicker.Think = function()
				element.color = element.ColorPicker:GetColor()
			end

			element.ColorPicker.OnRemove = function()
				element.old_color = element.color

				if isfunction(element.onValueChange) then
					local result = element.onValueChange(element.color)
					if result == false then element.color = element.old_color end
				end
			end
		end
	elseif statement == "bool" then
		element = vgui.Create("SButton", self)
		element:SetWide(slib.getScaledSize(25, "y") - slib.getScaledSize(2, "x") - slib.getScaledSize(2, "x"))
		element.basealpha = cleanaccentcolor.a

		element.Paint = function(s,w,h)
			draw.RoundedBox(h * .3, 0, 0, w, h, self.elemBg)
            
            local wantedcolor = accentcolor

			wantedcolor.a = s.enabled and element.basealpha or 0
		
			local ico_size = h * .55

			surface.SetDrawColor(slib.lerpColor(s, wantedcolor, 3))
			surface.SetMaterial(checkmarkMat)
			surface.DrawTexturedRect(w * .5 - ico_size * .5,h * .5 - ico_size * .5, ico_size, ico_size)
		end

		element.enabled = value

		element.DoClick = function()
			element.enabled = !element.enabled
            
            if isfunction(element.onValueChange) then
				local result = element.onValueChange(element.enabled)
				if result == false then element.enabled = !element.enabled end
            end
		end
	elseif statement == "int" then
		element = vgui.Create("DNumberWang", self)
		element:SetWide(slib.getScaledSize(50, "x"))
		element:SetDrawLanguageID(false)
		element:SetFont(self.font)
		element:SetMin(0)
		element:SetMax(2000000)
		element.oldValue = value

		element.Paint = function(s,w,h)
			draw.RoundedBox(h * .3, 0, 0, w, h, self.elemBg)

			s:DrawTextEntryText(textcolor, cleanaccentcolor, cleanaccentcolor)
		end

		element.OnValueChanged = function(ignore)
			local oldValue = element.oldValue
			local newValue = element:GetValue()

			timer.Create(tostring(element), .3, 1, function()
				if isfunction(element.onValueChange) then
					local result = element.onValueChange(newValue)
					if result == false then
						element.oldValue = oldValue
						element:SetText(oldValue)
					return end

					element.oldValue = newValue
				end
			end)
		end

		element:SetText(value)
	elseif statement == "function" or statement == "table" then
		element = vgui.Create("SButton", self)
		element:Dock(RIGHT)
		element:DockMargin(0,slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"))
		element:setTitle(statement == "function" and "Execute" or "View Table")

		element.DoClick = function()
			if statement == "function" then
				value()
			return end
			
			local display_data = vgui.Create("STableViewer")
			display_data:setTable(value)
			display_data:SetBG(false, true, nil, true)

			if isfunction(element.onElementOpen) then
				element.onElementOpen(display_data)
			end
		end
	elseif statement == "string" then
		element = vgui.Create("DTextEntry", self)
		element:SetWide(slib.getScaledSize(80, "x"))
		element:SetDrawLanguageID(false)
		element:SetFont(self.font)
		element.Paint = function(s,w,h)
			draw.RoundedBox(h * .3, 0, 0, w, h, self.elemBg)

			s:DrawTextEntryText(textcolor, cleanaccentcolor, cleanaccentcolor)
		end
    end
    
    element:Dock(RIGHT)
    element:DockMargin(0,slib.getScaledSize(2, "x"),slib.getScaledSize(2, "x"),slib.getScaledSize(2, "x"))

	self.element = element

	return self, element
end

vgui.Register("SStatement", PANEL, "EditablePanel")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_stableviewer.lua:
local PANEL = {}

local font = slib.createFont("Roboto", 15)
local neutralcolor, textcolor, successcolor_100, failcolor_100, maincolor_5, maincolor_7, maincolor_10, maincolor_15 = slib.getTheme("neutralcolor"), slib.getTheme("textcolor"), slib.getTheme("successcolor", -100), slib.getTheme("failcolor", -100), slib.getTheme("maincolor", 5), slib.getTheme("maincolor", 7), slib.getTheme("maincolor", 10), slib.getTheme("maincolor", 15)

function PANEL:Init()
    self:SetSize(slib.getScaledSize(450, "x"), slib.getScaledSize(330, "y"))
    :Center()
    :MakePopup()
    :addCloseButton()
    :setTitle("Table Viewer", slib.createFont("Roboto", 17))
    :setBlur(true)

    self.entryheight = slib.getScaledSize(20, "y")
    
    self.viewbox = vgui.Create("EditablePanel", self.frame)
    self.viewbox:Dock(RIGHT)
    self.viewbox:SetWide(self.frame:GetWide())

    self.viewer = vgui.Create("SScrollPanel", self.viewbox)
    :Dock(FILL)
end

local function createButton(self, parent, str, val)
    local istbl = istable(val)
    local selparent = parent and parent or self.viewer

    local value = vgui.Create("SButton", selparent)
    :Dock(TOP)
    :SetZPos(-10)
    :SetTall(slib.getScaledSize(25, "y"))

    value.title = str
    value.tbl = istbl and val or parent.tbl

    value.Paint = function(s,w,h)
        local wantedcolor = selparent == self.suggestions and successcolor_100 or (value.toggleable and selparent.tbl[str] and successcolor_100 or failcolor_100)

        if !value.toggleable and (!s:IsHovered() or self.viewOnly) then
            wantedcolor = table.Copy(wantedcolor)
            wantedcolor.a = 0
        end
        
        surface.SetDrawColor(slib.lerpColor(s, wantedcolor))
        surface.DrawRect(0, 0, w, h)
        local display = ""

        if !istbl and (isstring(val) or isnumber(val)) then
            display = ": "..tostring(val)
        end
        
        draw.SimpleText(str..display, font, slib.getTheme("margin"), h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    value.Think = function()
        if !value.toggleable and self:getRule("toggleables", str) then
            value.toggleable = true
        end

        if value:IsHovered() and input.IsKeyDown(KEY_LSHIFT) and input.IsMouseDown(MOUSE_RIGHT) then
            value:DoClick()
        end
    end

    value.DoClick = function()
        if self.viewOnly then return end

        self.modified = true
        
        if selparent == self.suggestions then
            local edit = IsValid(self.selected) and self.selected or self.viewer

            if self.rules and self.rules.onlymodifytable and edit:GetName() == "SScrollPanel" then return end

            if self.customvalues then
                local popup = vgui.Create("SPopupBox")
                :setTitle(value.title)
                
                local entry = popup:addInput("text", self.customvalueplaceholder)

                if self.customnumeric then
                    entry:SetNumeric(true)
                end
                
                popup:addChoise(self.customvalues, function()
                    local val = entry:GetValue()
                    self:addValue(editTbl, value.title, val, edit)
                    edit.tbl[value.title] = val

                    if edit == self.viewer then
                        self:sortValues(self.viewer)
                    end
                end)

                return
            else
                edit.tbl[value.title] = true
                self:addValue(editTbl, value.title, true, edit)
            end
            
            if edit == self.viewer then
                self:sortValues(self.viewer)
            end
        else
            if value.toggleable then
                selparent.tbl[str] = !selparent.tbl[str]
            return end

            value:Remove()
        end

        selparent.tbl[str] = nil
    end

    return value
end

function PANEL:addValue(panel, str, val, parent)
    if istable(val) then
        local selpar = parent or panel
        parent = vgui.Create("EditablePanel", selpar)
        parent:Dock(TOP)
        parent:SetTall(slib.getScaledSize(25, "y"))
        parent:DockMargin(slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"))
        parent:DockPadding(0,slib.getScaledSize(25, "y"),0,0)
        parent.isTblContainer = true
        parent.tbl = val
        parent.title = str
        parent.OnSizeChanged = function(w,h)
            parent.top:SetWide(parent:GetWide())
        end

        parent.top = vgui.Create("SButton", parent)
        parent.top:SetSize(parent:GetWide(), slib.getScaledSize(25, "y"))

        parent.top.DoClick = function()
            if self.rules and self.rules.tableDeletable and !self:getRule("undeleteableTables", str)  then
                parent:Remove()
                selpar.tbl[str] = nil
                self.modified = true
            return end

            self.selected = self.selected ~= parent and parent or nil
        end

        parent.top.Paint = function(s,w,h)
            local wantedcolor = self.rules and self.rules.tableDeletable and !self:getRule("undeleteableTables", str) and failcolor_100 or neutralcolor
            
            surface.SetDrawColor(maincolor_7)
            surface.DrawRect(0, 0, w, h)

            surface.SetDrawColor(maincolor_5)
            surface.DrawRect(0,h-1,w,1)

            if self.rules and self.rules.tableDeletable and !self:getRule("undeleteableTables", str) then
                if !s:IsHovered() then
                    wantedcolor = table.Copy(wantedcolor)
                    wantedcolor.a = 0
                end
            elseif self.selected ~= parent then
                wantedcolor = table.Copy(wantedcolor)
                wantedcolor.a = 0
            end


            surface.SetDrawColor(slib.lerpColor(s, wantedcolor))
            surface.DrawRect(0, 0, w, h)

            draw.SimpleText(str, font, slib.getTheme("margin"), h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        parent.PaintOver = function(s, w, h)
            surface.SetDrawColor(maincolor_5)
            surface.DrawOutlinedRect(0, 0, w, h)
        end

        parent.OnChildAdded = function(child)
            local addheight = slib.getScaledSize(25, "y")
            parent:SetTall(parent:GetTall() + addheight)

            local grandparent = parent:GetParent()
            if !grandparent.isTblContainer then return end
            grandparent:SetTall(grandparent:GetTall() + addheight)
        end

        parent.OnChildRemoved = function(child)
            local addheight = slib.getScaledSize(25, "y")
            parent:SetTall(parent:GetTall() - addheight)

            local grandparent = parent:GetParent()
            if !grandparent.isTblContainer then return end
            grandparent:SetTall(grandparent:GetTall() - addheight)
        end
        
        if selpar ~= self.viewer then
            selpar:SetTall(selpar:GetTall() + (slib.getTheme("margin") * 2))
        end

        for k,v in pairs(val) do
            self:addValue(panel, k, v, parent)
        end
    return end

    return createButton(self, parent and parent or panel, str, val)
end

local function differenciate(a, b)
    if !(isstring(a) == isstring(b)) or isbool(a) or isbool(b) then
        return tostring(a), tostring(b)
    end

    return a, b
end

function PANEL:setCustomValues(bool, placeholder, numeric)
    self.customvalues = bool
    self.customvalueplaceholder = placeholder
    self.customnumeric = numeric

    return self
end

function PANEL:sortValues(panel)
    if !IsValid(panel) then return self end
    local basictable = {}
    local cleantable = {}

    for k,v in pairs(panel.tbl) do
        table.insert(basictable, k)
    end

    table.sort(basictable, function(a, b) local a, b = differenciate(a, b) return a < b end)
    
    for k,v in pairs(basictable) do
        cleantable[v] = k
    end

    for k, v in pairs(panel:GetCanvas():GetChildren()) do
        if !v.title then continue end
        v:SetZPos(cleantable[v.title])
    end

    return self
end

function PANEL:addSuggestions(tbl)
    if !tbl then return self end

    local wide, tall = self.frame:GetWide() * .5, self.frame:GetTall()
    self.viewer:SetPos(wide, 0)
    self.viewer:SetWide(wide)

    self.suggestionbox = vgui.Create("EditablePanel", self.frame)
    self.suggestionbox:Dock(LEFT)
    self.suggestionbox:SetWide(self.frame:GetWide() * .5)
    self.viewbox:SetWide(self.frame:GetWide() * .5)

    self.suggestions = vgui.Create("SScrollPanel", self.suggestionbox)
    self.suggestions:Dock(FILL)
    self.suggestions.tbl = tbl
    self.suggestions.hidden = {}

    self.suggestions.PaintOver = function(s,w,h)
        surface.SetDrawColor(maincolor_10)
        surface.DrawRect(w - 1, 0, 1, h)
    end

    self.suggestions.Think = function()
        local edit = IsValid(self.selected) and self.selected or self.viewer
        for k, value in pairs(self.suggestions:GetCanvas():GetChildren()) do
            if value:IsVisible() ~= !edit.tbl[value.title] and !value.searchHidden then
                value:SetVisible(!edit.tbl[value.title])
                self.suggestions:GetCanvas():InvalidateLayout(true)
            end
        end
    end

    for k,v in pairs(tbl) do
        self:addValue(self.suggestions, k, v)
    end

    return self
end

function PANEL:setOnlyModifyTable(bool)
    self.rules = self.rules or {}
    self.rules.onlymodifytable = bool
end

function PANEL:setToggleable(module, name, string)
    self.rules = self.rules or {}
    self.rules[module] = self.rules[module] or {}
    self.rules[module][name] = self.rules[module][name] or {}
    self.rules[module][name].toggleables = self.rules[module][name].toggleables or {}

    self.rules[module][name].toggleables[string] = true
end

function PANEL:setTableDeletable(bool)
    self.rules = self.rules or {}
    self.rules.tableDeletable = bool
end

function PANEL:setundeleteableTable(module, name, string)
    self.rules = self.rules or {}
    self.rules[module] = self.rules[module] or {}
    self.rules[module][name] = self.rules[module][name] or {}
    self.rules[module][name].undeleteableTables = self.rules[module][name].undeleteableTables or {}

    self.rules[module][name].undeleteableTables[string] = true
end

function PANEL:setAddRules(rule)
    self.rules = self.rules or {}
    self.rules.addRules = rule
end

function PANEL:getRule(type, str)
    local returnval = false

    if self.rules and self.rules[self.modulename] and self.rules[self.modulename][self.name] and self.rules[self.modulename][self.name][type] and self.rules[self.modulename][self.name][type][str] then
        returnval = true
    end
    
    return returnval
end

function PANEL:setIdentifiers(module, name)
    self.modulename, self.name = module, name
end

function PANEL:setTable(tbl)
    if !tbl or !istable(tbl) then return self end
    self.viewer.tbl = tbl
    for k,v in pairs(tbl) do
        self:addValue(self.viewer, k, v)
    end

    return self
end

function PANEL:addSearch(panel, viewer)
    if !IsValid(panel) or !IsValid(viewer) then return self end
    panel.search = vgui.Create("SSearchBar", panel)
    :addIcon()
    :SetWide(panel:GetWide())
    :Dock(TOP)
    :DockMargin(0,0,0,0)

    panel.search.entry.onValueChange = function(newvalue)
        for k,v in pairs(viewer:GetCanvas():GetChildren()) do
            if !v.title then continue end

            v:SetVisible(string.find(string.lower(v.title), string.lower(newvalue)))

            if v:IsVisible() then
                v.searchHidden = nil
            else
                v.searchHidden = true
            end
        end

        viewer:GetCanvas():InvalidateLayout(true)
    end

    return self
end

function PANEL:addEntry()
    self.addEntryFrame = vgui.Create("EditablePanel", self.viewbox)
    self.addEntryFrame:Dock(BOTTOM)

    self.addEntryButton = vgui.Create("SButton", self.addEntryFrame)
    :Dock(RIGHT)
    :setTitle("Add")

    self.addEntryButton.accentheight = 1
    self.addEntryButton.bg = maincolor_10

    self.addEntryButton.DoClick = function()
        local key, edit = self.entry:GetValue(), (IsValid(self.selected) and self.selected or self.viewer)
        if !key or key == "" or edit.tbl[key] then return end
        if self.rules and self.rules.onlymodifytable and edit:GetName() == "SScrollPanel" then return end
        
        local val

        if self.rules and self.rules.addRules and edit:GetName() == "SScrollPanel" then
            val = table.Copy(self.rules.addRules)
        end

        if !val then val = key end

        local result = !istable(val) and true or val
        edit.tbl[key] = result

        self:addValue(edit, key, result, edit)
        self:sortValues(self.viewer)
        self.modified = true
        self.entry:SetValue("")
    end

    self.entry = vgui.Create("STextEntry", self.addEntryFrame)
    :Dock(FILL)
    :SetValue("")

    self.entry.bg = maincolor_10

    self.entry.placeholder = ""

    self.addEntryFrame:SetTall(self.entry:GetTall())
    self.addEntryButton:SetTall(self.entry:GetTall())

    return self
end

vgui.Register("STableViewer", PANEL, "SFrame")
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_modes.lua:
local PANEL = {}
function PANEL:Init()
    self:SetPageName("Modes")
    self.tblDefaultSettings = {
        ["Whisper"] = {
            strDesc = "Whisper_Desc",
            strType = "tSlider"
        },
        ["Talk"] = {
            strDesc = "Talk_Desc",
            strType = "tSlider"
        },
        ["Yell"] = {
            strDesc = "Yell_Desc",
            strType = "tSlider"
        }
    }
    self:RefreshSettings()
end
vgui.Register("TalkModes.ModesSettings", PANEL, "TalkModes.SettingsBase")

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

--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_theme.lua:
local PANEL = {}
function PANEL:Init()
    self:SetPageName("UI")
    self.tblDefaultSettings = {
        ["Background"] = {
            strDesc = "Background_Desc",
            strType = "tColor",
        },
        ["Foreground"] = {
            strDesc = "Foreground_Desc",
            strType = "tColor"
        },
        ["Hover"] = {
            strDesc = "Hover_Desc",
            strType = "tColor"
        },
        ["White"] = {
            strDesc = "White_Desc",
            strType = "tColor"
        },
        ["Gray"] = {
            strDesc = "Gray_Desc",
            strType = "tColor"
        },
    }
    self:RefreshSettings()
end
vgui.Register("TalkModes.ThemesSettings", PANEL, "TalkModes.SettingsBase")
--PATH addons/warning_system/lua/warning_system_7452/languages/en.lua:
WarningSystem7452em.Lang["en"] = {
    tabs = {
        my_warnings = "My Warnings",
        offline_players = "Offline Players",
        online_players = "Online Players",
        settings = "Settings",
        statistics = "Statistics",
    },

    settings_tabs = {
        preset_reasons = "Preset Reasons",
        thresholds = "Thresholds",
        permissions = "Permissions",
        theme = "Theme",
        other = "Other",

        add_this_reason = "Add this reason",
        penalty_points_to_reach = "Penalty points to reach",
        add_this_threshold = "Add this threshold",
        save_those_permissions = "Save those permissions",
        save_this_theme = "Save this theme for everyone",
        save_this_config = "Save this configuration",
    },

    webhooks = {
        new_warning = "New Warning",
        warning_removed = "Warning Removed",

        user = "User",
        admin = "Administrator",
        more_info = "More Information",
    },

    errors = {
        no_access = "You do not have access to this",
        reason_too_short = "Reason too short",
        reason_too_long = "Reason too long",
        invalid_key = "Invalid key",
    },

    notifs = {
        success = "Success",
        error = "Error",
        warning = "Warning",
    },

    youve_been_warned = "You have been warned",
    player_been_warned = "The player has been warned successfully",
    player_been_unwarned = "The player has been unwarned successfully",

    settings_updated = "Settings updated",

    awarn_imported = "Warnings from AWarn3 imported!",

    by = "By",
    reason = "Reason",
    penalty = "Penalty",
    date = "Date",
    expiration = "Expiration",
    duration = "Duration",
    preset = "Preset",

    none = "None",

    warn = "Warn",

    custom_warning = "Custom Warning",

    penalty_points = "Penalty Points",

    warn_this_player = "Warn this player",

    search_player_sid64 = "Search for a player by its SteamID x64 (7656...)",
    search_player = "Search for a player...",

    x_displayed = "%i displayed",
    x_online_players = "%i Online Players",

    total_warnings = "Total Warnings",
    total_penalty_points = "Total Penalty Points",
    monthly_warnings = "Monthly Warnings",
    last_warnings = "Last Warnings",
    most_warned = "Most Warned",
    staff_leaderboard = "Staff Leaderboard",
    active_warnings = "Active Warnings",

    view_more = "View More",

    joins_with_x = "%s joins the server with %s warnings",

    set_api_key = "You must set a Steam API key",

    months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
}
--PATH addons/warning_system/lua/warning_system_7452/languages/fr.lua:
WarningSystem7452em.Lang["fr"] = {
    tabs = {
        my_warnings = "Mes Avertissements",
        offline_players = "Joueurs Hors-Ligne",
        online_players = "Joueurs En-Ligne",
        settings = "Paramètres",
        statistics = "Statistiques",
    },

    settings_tabs = {
        preset_reasons = "Raisons Prédéfinies",
        thresholds = "Seuils",
        permissions = "Permissions",
        theme = "Thème",
        other = "Autre",

        add_this_reason = "Ajouter cette raison",
        penalty_points_to_reach = "Points de pénalité à atteindre",
        add_this_threshold = "Ajouter ce seuil",
        save_those_permissions = "Enregistrer ces permissions",
        save_this_theme = "Enregistrer ce thème pour tout le monde",
        save_this_config = "Enregistrer cette configuration",
    },

    webhooks = {
        new_warning = "Nouvel Avertissement",
        warning_removed = "Avertissement Retiré",

        user = "Utilisateur",
        admin = "Administrateur",
        more_info = "Plus d'Informations",
    },

    errors = {
        no_access = "Vous n'avez pas accès à cela",
        reason_too_short = "Raison trop courte",
        reason_too_long = "Raison trop longue",
        invalid_key = "Clé invalide",
    },

    notifs = {
        success = "Succès",
        error = "Erreur",
        warning = "Attention",
    },

    youve_been_warned = "Vous avez été averti",
    player_been_warned = "Ce joueur a été averti avec succès",
    player_been_unwarned = "Ce joueur a été désaverti avec succès",

    settings_updated = "Paramètres mis à jour",

    awarn_imported = "Les avertissements d'AWarn3 ont été importés !",

    by = "Par",
    reason = "Raison",
    penalty = "Pénalité",
    date = "Date",
    expiration = "Expiration",
    duration = "Durée",
    preset = "Préréglage",

    none = "Aucun",

    warn = "Avertir",

    custom_warning = "Avertissement personnalisé",

    penalty_points = "Points de Pénalité",

    warn_this_player = "Avertir ce joueur",

    search_player_sid64 = "Rechercher un joueur par son SteamID x64 (7656...)",
    search_player = "Rechercher un joueur...",

    x_displayed = "%i affichés",
    x_online_players = "%i Joueurs en Ligne",

    total_warnings = "Avertissements Totaux",
    total_penalty_points = "Points de Pénalité Totaux",
    monthly_warnings = "Avertissements Mensuels",
    last_warnings = "Derniers avertissements",
    most_warned = "Les Plus Avertis",
    staff_leaderboard = "Administrateurs Efficaces",
    active_warnings = "Avertissements Actifs",

    view_more = "Voir Plus",

    joins_with_x = "%s rejoint le serveur avec %s avertissements",

    set_api_key = "Vous devez définir une clé d'API Steam",

    months = {"Jan", "Fev", "Mar", "Avr", "Mai", "Juin", "Juil", "Aoû", "Sep", "Oct", "Nov", "Déc"}
}

--PATH addons/warning_system/lua/warning_system_7452/languages/ru.lua:
WarningSystem7452em.Lang["ru"] = {
	tabs = {
		my_warnings = "Ваши Варны",
		offline_players = "Игроки Оффлайн",
		online_players = "Игроки Онлайн",
		settings = "Настройки",
		statistics = "Статистика",
	},

	settings_tabs = {
		preset_reasons = "Шаблоны причин",
		thresholds = "Наказания",
		permissions = "Разрешения",
		theme = "Тема",
		other = "Другое",

		add_this_reason = "Добавить причину",
		penalty_points_to_reach = "Количество очков для наказания",
		add_this_threshold = "Добавить наказание",
		save_those_permissions = "Сохранить",
		save_this_theme = "Сохранить",
		save_this_config = "Сохранить",
	},

	webhooks = {
		new_warning = "Новый Варн",
		warning_removed = "Варн снят",

		user = "Игрок",
		admin = "Администратор",
		more_info = "Подробнее",
	},

	errors = {
		no_access = "У вас нет доступа к этому",
		reason_too_short = "Причина слишком короткая",
		reason_too_long = "Причина слишком длинная",
		invalid_key = "Невалидный ключ",
	},

	notifs = {
		success = "Удачно",
		error = "Ошибка",
		warning = "Предупреждение",
	},

	youve_been_warned = "Вы получили варн",
	player_been_warned = "Игрок успешно получил варн",
	player_been_unwarned = "Варн был успешно снят",

	settings_updated = "Настройки обновлены!",

	awarn_imported = "Варны из AWarn3 импортированы!",

	by = "Кем",
	reason = "Причина",
	penalty = "Очков",
	date = "Дата",
	expiration = "Истекает",
	duration = "Срок",
	preset = "Шаблон",

	none = "Нет",

	warn = "Варн",

	custom_warning = "Выдать варн",

	penalty_points = "Очков наказания",

	warn_this_player = "Выдать варн",

	search_player_sid64 = "Поиск игрока по SteamID x64 (7656...)",
	search_player = "Поиск игрока...",

	x_displayed = "%i отображён",
	x_online_players = "%i Игроков онлайн",

	total_warnings = "Всего варнов",
	total_penalty_points = "Всего очков наказания",
	monthly_warnings = "Варнов в месяц",
	last_warnings = "Последний Варн",
	most_warned = "Больше всего",
	staff_leaderboard = "Лидер наказаний",
	active_warnings = "Активный Варн",

	view_more = "Посмотреть больше",

	joins_with_x = "%s зашёл на сервер с %s варнами",

	set_api_key = "Вы должны установить ключ Steam API",

	months = {"Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"}
}

--PATH addons/warning_system/lua/warning_system_7452/client/util.lua:
surface.CreateFont("WarningSystem7452em:35R", {font = "Poppins Bold", size = ScrH() * 0.035})

surface.CreateFont("WarningSystem7452em:45M", {font = "Poppins Medium", size = ScrH() * 0.045})
surface.CreateFont("WarningSystem7452em:40M", {font = "Poppins Medium", size = ScrH() * 0.04})
surface.CreateFont("WarningSystem7452em:32M", {font = "Poppins Medium", size = ScrH() * 0.032})
surface.CreateFont("WarningSystem7452em:30M", {font = "Poppins Medium", size = ScrH() * 0.03})
surface.CreateFont("WarningSystem7452em:28M", {font = "Poppins Medium", size = ScrH() * 0.028})
surface.CreateFont("WarningSystem7452em:25M", {font = "Poppins Medium", size = ScrH() * 0.025})
surface.CreateFont("WarningSystem7452em:20M", {font = "Poppins Medium", size = ScrH() * 0.02})

WarningSystem7452em.Users = WarningSystem7452em.Users or {}
WarningSystem7452em.PenaltyPoints = WarningSystem7452em.PenaltyPoints or {}
WarningSystem7452em.Stats = WarningSystem7452em.Stats or {}
--PATH addons/warning_system/lua/warning_system_7452/client/vgui/components/dbutton.lua:
local PANEL = {}

AccessorFunc(PANEL, "cBackground", "BackgroundColor")

function PANEL:Init()
    self:SetText("")
    self.sText = "Button"
    self.cBackground = WarningSystem7452em.CFG.theme.Main
    self:SetTextColor(WarningSystem7452em.CFG.theme.Texts)
    self:SetFont("WarningSystem7452em:25M")
    self.iLerp = 0
    self.tBorder = {
        color = color_black,
        width = 0
    }

    function self:SetText(sText) self.sText = sText end
end

function PANEL:GetText() return self.sText end

function PANEL:SetBorder(cColor, iWidth)
    self.tBorder = {
        color = cColor,
        width = iWidth or 1
    }
end

function PANEL:OnMousePressed(iKey)
	if (self.intNextClick && self.intNextClick > CurTime()) then return end

	self.intNextClick = CurTime() + 0.2

    if self.DoClick and iKey == MOUSE_LEFT then
        self:DoClick()
        surface.PlaySound( "buttons/button15.wav" )
    end
end

function PANEL:Paint(iW, iH)
    self.iLerp = Lerp(RealFrameTime() * 8, self.iLerp, self:IsHovered() and 70 or 0)

    draw.RoundedBox(8, 0, 0, iW, iH, self.tBorder.color)
    draw.RoundedBox(8, self.tBorder.width, self.tBorder.width, iW - self.tBorder.width * 2, iH - self.tBorder.width * 2, self:GetBackgroundColor())
    draw.RoundedBox(8, 0, 0, iW, iH, ColorAlpha(color_black, self.iLerp))

    draw.SimpleText(self:GetText(), self:GetFont(), iW * 0.5, iH * 0.5, self:GetTextColor(), 1, 1)
end

vgui.Register("WarningSystem7452em:DButton", PANEL, "DButton")
--PATH addons/warning_system/lua/warning_system_7452/client/vgui/components/leaderboard.lua:
local PANEL = {}

function PANEL:Init()
end

function PANEL:Setup(sTitle, cDescs)
    self.sTitle = sTitle
    self.cDescs = cDescs

    self.pnlScroll = vgui.Create("DPanel", self)
    self.pnlScroll:SetSize(self:GetWide() * 0.9, self:GetTall() * 0.78)
    self.pnlScroll:SetPos(self:GetWide() * 0.05, self:GetTall() * 0.17)
    self.pnlScroll.Paint = nil
end

function PANEL:AddRow(sImage, sText, sDesc)
    local xMat = Material("icon16/attach.png")

    local pnlRow = vgui.Create("DPanel", self.pnlScroll)
    pnlRow:Dock(TOP)
    pnlRow:SetTall(self:GetTall() * 0.12)
    pnlRow:DockMargin(0, 0, 0, self:GetTall() * 0.05)
    function pnlRow:Paint(iW, iH)
        surface.SetMaterial(xMat)
        surface.SetDrawColor(WarningSystem7452em.CFG.theme.Texts)
        surface.DrawTexturedRect(0, 0, iH, iH)

        surface.SetDrawColor(WarningSystem7452em.CFG.theme.Primary)
        surface.DrawRect(0, 0, iH, iH)

        draw.SimpleText(sText, "WarningSystem7452em:20M", iH * 1.3, iH * 0.5, WarningSystem7452em.CFG.theme.Texts, 0, 1)
        draw.SimpleText(sDesc, "WarningSystem7452em:30M", iW * 0.98, iH * 0.5, self:GetParent():GetParent().cDescs, 2, 1)
    end

    local pnlAvatar = vgui.Create("HTML", pnlRow)
    pnlAvatar:SetSize(pnlRow:GetTall(), pnlRow:GetTall())
    pnlAvatar:SetHTML(
        [[
            <style type="text/css">
                body{
                    padding: 0;
                    margin: 0;
                    background-image: url("]] .. sImage .. [[");
                    background-size: cover;
                }
            </style>
        ]]
    )
end

function PANEL:Paint(iW, iH)
    draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
    draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, WarningSystem7452em.CFG.theme.Tertiary)
    
    draw.SimpleText(self.sTitle, "WarningSystem7452em:25M", iW * 0.05, iH * 0.03, WarningSystem7452em.CFG.theme.Texts2)
end

vgui.Register("WarningSystem7452em:Leaderboard", PANEL, "DPanel")
--PATH lua/wos/anim_extension/extensions/wos_ds_mad.lua:
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

wOS.AnimExtension.Mounted[ "DS_MAD" ] = true
MsgC( Color( 255, 255, 255 ), "[wOS] Successfully mounted animation extension: DS_MAD\n" )
--PATH lua/wos/anim_extension/vgui/wiltos_anim_viewer.lua:
--[[-------------------------------------------------------------------
	wiltOS Animation Viewer:
		A Supplement to the animation base, it allows you to view more than	
					2000 animations/sequences with it's model viewer
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
wOS = wOS or {}

local w, h = ScrW(), ScrH()

surface.CreateFont( "wOS.Anim.TitleFont", {
	font = "Roboto Cn", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 24*(h/1200),
	weight = 1000,
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

surface.CreateFont( "wOS.Anim.DescFont",{
	font = "Roboto Cn", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 18*(h/1200),
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

list.Add( "DesktopWindows", {
	icon = "wos/anim_extension/emblem.png",
	title = "wiltOS Viewer",
	init = function() wOS:OpenAnimationMenu() end,
})

function wOS:OpenAnimationMenu()

	if self.OverFrame then 
		self.OverFrame:Remove()
		self.OverFrame = nil
		gui.EnableScreenClicker( false )
		return 
	end

	self.OverFrame = vgui.Create( "DFrame" )
	self.OverFrame:SetSize( w, h )
	self.OverFrame:Center()
	self.OverFrame.Paint = function() end
	self.OverFrame:SetTitle( "" )
	self.OverFrame:ShowCloseButton( false )
	self.OverFrame:SetDraggable( false )
	
	gui.EnableScreenClicker( true )
	self.AnimMenu = vgui.Create( "DFrame", self.OverFrame )
	self.AnimMenu:SetSize( w*0.5, h*0.5 )
	self.AnimMenu:Center()
	self.AnimMenu.Display = LocalPlayer():GetModel()
	self.AnimMenu:MakePopup()
	self.AnimMenu:SetTitle( "" )
	self.AnimMenu:ShowCloseButton( false )
	self.AnimMenu:SetDraggable( false )
	
	local fw, fh = self.AnimMenu:GetSize()
	local padx = fh*0.025
	local pady = padx
	
	local modelmenu = vgui.Create( "DAdjustableModelPanel", self.AnimMenu )
	modelmenu:SetPos( padx, pady )
	modelmenu:SetSize( fw/2 - padx - padx/2, fh - 2*pady )
	modelmenu.LayoutEntity = function() local ent = modelmenu:GetEntity() ent:SetEyeTarget( modelmenu:GetCamPos() ) ent:FrameAdvance( FrameTime() ) end
	
	self.AnimMenu.Paint = function( pan, ww, hh )
		if not vgui.CursorVisible() then gui.EnableScreenClicker( true ) end
		draw.RoundedBox( 3, 0, 0, ww, hh, Color( 25, 25, 25, 245 ) )
		--draw.SimpleText( "Animation Viewer", "wOS.Anim.TitleFont", ww/2, hh*0.05, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
		surface.SetDrawColor( Color( 0, 155, 155, 255 ) )
		surface.DrawOutlinedRect( padx, pady, modelmenu:GetWide(), modelmenu:GetTall() )
	end 
		
	local lister = vgui.Create( "DListView", self.AnimMenu )
	lister:SetPos( fw/2 + padx/2, pady )
	lister:SetSize( fw/2 - padx - padx/2, fh*0.77 - pady)	
	lister:AddColumn( "Name" )
	lister:SetMultiSelect( false )
	lister:SetHideHeaders( true )
	lister.Pages = {}
	lister.CurrentPage = 1
	
	function lister:Think()
		if wOS.AnimMenu.Display != modelmenu:GetModel() then
			modelmenu:RebuildModel()
		end	
	end
	
	function lister:RebuildCache( ent )
		lister:Clear()
		lister.BasePages = {} // SUPERIOR JACOBS EDIT // https://steamcommunity.com/id/AwesomeJacob/
		lister.Pages = {}
		lister.CurrentPage = 1
		local max = 500
		local count = 0
		local curpage = 1
		for k, v in SortedPairsByValue( ent:GetSequenceList() ) do
			if not lister.BasePages[ curpage ] then lister.BasePages[ curpage ] = {} end
			if count < max then
				table.insert( lister.BasePages[ curpage ], string.lower( v ) )
				if curpage == 1 then
					local line = lister:AddLine( string.lower( v ) )
					line.OnSelect = function()
						ent:ResetSequence( v )
						ent:SetCycle( 0 )
					end
				end
				count = count + 1
			else
				curpage = curpage + 1
				count = 0
			end
		end

		lister.Pages = lister.BasePages
	end

	// SUPERIOR JACOBS EDIT
	// https://steamcommunity.com/id/AwesomeJacob/
	function lister:RebuildToLines( ent, lines )
		lister:Clear()
		lister.Pages = {}
		lister.CurrentPage = 1
		local max = 500
		local count = 0
		local curpage = 1
		for k, v in SortedPairsByValue( lines ) do
			if not lister.Pages[ curpage ] then lister.Pages[ curpage ] = {} end
			if count < max then
				table.insert( lister.Pages[ curpage ], string.lower( v ) )
				if curpage == 1 then
					local line = lister:AddLine( string.lower( v ) )
					line.OnSelect = function()
						ent:ResetSequence( v )
						ent:SetCycle( 0 )
					end
				end
				count = count + 1
			else
				curpage = curpage + 1
				count = 0
			end
		end
	end
	//

	function lister:ChangePage( page )
		lister:Clear()
		if not page then return end	
		if not lister.Pages[ page ] then return end
		local ent = modelmenu:GetEntity()
		for k, v in pairs( lister.Pages[ page ] ) do
			local line = lister:AddLine( string.lower( v ) )
			line.OnSelect = function()
				ent:ResetSequence( v )
				ent:SetCycle( 0 )
			end
		end

		lister:SelectFirstItem()
	end

	function modelmenu:RebuildModel()
		modelmenu:SetModel( wOS.AnimMenu.Display )
		local ent = modelmenu:GetEntity()
		local pos = ent:GetPos()
		local campos = pos + Vector( -150, 0, 0 )
		modelmenu:SetCamPos( campos )
		modelmenu:SetFOV( 45 )
		modelmenu:SetLookAng( ( campos * -1 ):Angle() )
		lister:RebuildCache( modelmenu:GetEntity() )
	end

	local nextbutt = vgui.Create( "DButton", self.AnimMenu )
	nextbutt:SetSize( fw*0.15, fh*0.05 )
	nextbutt:SetPos( fw*0.85 - padx, fh*0.95 - pady*1.5 - nextbutt:GetTall() )
	nextbutt:SetText( "" )
	nextbutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "NEXT PAGE", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	nextbutt.DoClick = function( pan )
		lister.CurrentPage = math.Clamp( lister.CurrentPage + 1, 1, #lister.Pages )
		lister:ChangePage( lister.CurrentPage )
	end
	
	// SUPERIOR JACOBS EDIT
	// https://steamcommunity.com/id/AwesomeJacob/
	local pagedisplay = vgui.Create( "DLabel", self.AnimMenu )
	pagedisplay:SetSize( fw*0.15, fh*0.05 )
	pagedisplay:SetPos( fw/2 + padx/2, fh*0.95 - pady*2 - nextbutt:GetTall() - pagedisplay:GetTall() )
	pagedisplay:SetText( "" )
	pagedisplay.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "PAGE: "..lister.CurrentPage.."/"..#lister.Pages, "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local searchbar = vgui.Create( "DTextEntry", self.AnimMenu )
	searchbar:SetSize( fw*0.15 * 1.5, fh*0.05 * 0.8 )
	searchbar:SetPos( fw*0.85 - padx + fw*0.15 - searchbar:GetWide(), fh*0.95 - pady*2 - nextbutt:GetTall() - fh*0.05/2 - searchbar:GetTall()/2 )
	searchbar:SetFont("wOS.Anim.DescFont")
	searchbar:SetText( "" )

	local searchtext = vgui.Create( "DButton", self.AnimMenu )
	searchtext:SetSize( fw*0.15 * 0.5, fh*0.05 )
	searchtext:SetPos( fw/2 + padx/2 + fw*0.15 + padx, fh*0.95 - pady*2 - nextbutt:GetTall() - searchtext:GetTall() )
	searchtext:SetText( "" )
	searchtext.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "SEARCH", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	searchtext.DoClick = function( pan )
		local var = string.lower(searchbar:GetValue())
		local page = 1
		local line = 0

		if (var == "") then
			lister.Pages = lister.BasePages
			lister:ChangePage( page )
		else
			local found = {}
									
			for i = 1, #lister.BasePages do
				for _, v in ipairs( lister.BasePages[i] ) do
					if (string.find(v, var)) then
						table.insert(found, v)
					end
				end
			end

			lister:RebuildToLines( modelmenu:GetEntity(), found )
		end
	end
	//

	local prevbutt = vgui.Create( "DButton", self.AnimMenu )
	prevbutt:SetSize( fw*0.15, fh*0.05 )
	prevbutt:SetPos( fw/2 + padx/2, fh*0.95 - pady*1.5 - prevbutt:GetTall() )
	prevbutt:SetText( "" )
	prevbutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "PREVIOUS PAGE", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	prevbutt.DoClick = function( pan )
		lister.CurrentPage = math.Clamp( lister.CurrentPage - 1, 1, #lister.Pages )
		lister:ChangePage( lister.CurrentPage )
	end
	
	local replaybutt = vgui.Create( "DButton", self.AnimMenu )
	replaybutt:SetSize( fw*0.15, fh*0.05 )
	replaybutt:SetPos( fw/2 + padx/2 + replaybutt:GetWide() + padx, fh*0.95 - pady*1.5 - replaybutt:GetTall() )
	replaybutt:SetText( "" )
	replaybutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "REPLAY SELECTION", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	replaybutt.DoClick = function( pan )
		local selected = lister:GetSelectedLine()
		if not selected then return end
		local ent = modelmenu:GetEntity()
		ent:ResetSequence( lister:GetLines()[ selected ]:GetValue( 1 ) )
		ent:SetCycle( 0 )		
	end
	
	local closebutt = vgui.Create( "DButton", self.AnimMenu )
	closebutt:SetSize( fw*0.3, fh*0.05 )
	closebutt:SetPos( fw/2 + fw*0.1, fh*0.95 - pady )
	closebutt:SetText( "" )
	closebutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "CLOSE MENU", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	closebutt.DoClick = function( pan )
		wOS:OpenAnimationMenu()	
	end
	
	local mw, mh = modelmenu:GetSize()
	
	local infoframe = vgui.Create( "DPanel", modelmenu )
	infoframe:SetSize( mw, mh*0.2 )
	infoframe:SetPos( 0, mh*0.8 )
	infoframe.Paint = function( pan, ww, hh )
		if not lister:GetLines()[ lister:GetSelectedLine() ] then return end
		local title = lister:GetLines()[ lister:GetSelectedLine() ]:GetValue( 1 )
		local ent = modelmenu:GetEntity()
		local act = ent:LookupSequence( title )
		draw.SimpleText( "SEQUENCE: " .. title, "wOS.Anim.DescFont", ww/2, hh*0.25, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		if act then
			local actn = ent:GetSequenceActivityName( act )
			act = ent:GetSequenceActivity( act )
			if not act then 
				draw.SimpleText( "ACT ID: NONE", "wOS.Anim.DescFont", ww/2, hh*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( "ACT ID: " .. act, "wOS.Anim.DescFont", ww/2, hh*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
			if not actn then 
				draw.SimpleText( "ACT NAME: N/A", "wOS.Anim.DescFont", ww/2, hh*0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( "ACT NAME: " .. actn, "wOS.Anim.DescFont", ww/2, hh*0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
		end	
	end
	
	local holdframe = vgui.Create( "DFrame", self.OverFrame )
	holdframe:SetSize( fw*0.3, fh*0.1 )
	holdframe:SetPos( fw*1.5 + fw*0.01, fh - fh/2 )
	holdframe:SetText( "" )
	holdframe:SetTitle( "" )
	holdframe:ShowCloseButton( false )
	holdframe:SetDraggable( false )
	holdframe.Paint = function( pan, ww, hh )
		draw.RoundedBox( 3, 0, 0, ww, hh, Color( 25, 25, 25, 245 ) )
	end
	holdframe.Think = function( pan )
		local endy = fh*0.1
		if pan.Expand then
			endy = fh
		end
		pan:SetTall( math.Approach( pan:GetTall(), endy, 15 ) )
	end
	holdframe.Expand = false
	holdframe:MakePopup()
	
	local iw, ih = holdframe:GetSize()
	
	local togglebutt = vgui.Create( "DButton", holdframe )
	togglebutt:SetSize( iw*0.9, fh*0.05 )
	togglebutt:SetPos( iw*0.05, ih - fh*0.075 )
	togglebutt:SetText( "" )
	togglebutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( ( holdframe.Expand and "Close Holdtype Creator" ) or "Open Holdtype Creator", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local ACTS = { 
		[ "Idle Standing" ] = "ACT_MP_STAND_IDLE", 
		[ "Slow Walk" ] = "ACT_MP_WALK", 
		[ "Running" ] = "ACT_MP_RUN", 
		[ "Sprinting" ] = "ACT_MP_SPRINT",
		[ "Idle Crouching" ] = "ACT_MP_CROUCH_IDLE", 
		[ "Walk Crouching" ] = "ACT_MP_CROUCHWALK", 
		[ "Attack Standing" ] = "ACT_MP_ATTACK_STAND_PRIMARYFIRE",
		[ "Attack Crouching" ] = "ACT_MP_ATTACK_CROUCH_PRIMARYFIRE",
		[ "Reload Standing" ] = "ACT_MP_RELOAD_STAND",
		[ "Reload Crouching" ] = "ACT_MP_RELOAD_CROUCH",
		[ "Swimming" ] = "ACT_MP_SWIM",
		[ "Jumping" ] = "ACT_MP_JUMP",
		[ "Landing" ] = "ACT_LAND",
	}
	
	local title = vgui.Create( "DLabel", holdframe )
	title:SetSize( iw*0.8, fh*0.05 )
	title:SetPos( iw*0.05, ih )
	title:SetText( "Base Holdtype:" )
	title:SetFont( "wOS.Anim.TitleFont" )
	
	local basetype = vgui.Create( "DTextEntry", holdframe )
	basetype:SetSize( iw*0.8, fh*0.03 )
	basetype:SetPos( iw*0.05, ih + fh*0.05 )
	
	local baselist = vgui.Create( "DImageButton", holdframe )
	baselist:SetSize( fh*0.03, fh*0.03 )
	baselist:SetPos( iw*0.86, ih + fh*0.05 )
	baselist:SetImage( "icon16/application_view_list.png" )	
	baselist.DoClick = function( pan )
		if pan.ItemIconOptions then pan.ItemIconOptions:Remove() pan.ItemIconOptions = nil end
		pan.ItemIconOptions = DermaMenu( baselist )
		pan.ItemIconOptions:MakePopup()
		pan.ItemIconOptions:SetPos( gui.MouseX(), gui.MouseY() )
		pan.ItemIconOptions.Think = function( self )
			if not pan then self:Remove() end
		end
		local holdlist = { "pistol", "smg", "grenade", "ar2", "shotgun", "rpg", "physgun", "crossbow", "melee", "slam", "normal", "fist", "melee2", "passive", "knife", "duel", "camera", "magic", "revolver" }
		for name, _ in pairs( wOS.AnimExtension.TranslateHoldType ) do
			table.insert( holdlist, name )
		end
		for _, typ in ipairs( holdlist ) do
			pan.ItemIconOptions:AddOption( typ, function( self ) 
				basetype:SetText( typ )
				self:Remove()
			end )
		end			
	end
	
	local title = vgui.Create( "DLabel", holdframe )
	title:SetSize( iw*0.9, fh*0.05 )
	title:SetPos( iw*0.05, ih + fh*0.09 )
	title:SetText( "Holdtype Name:" )
	title:SetFont( "wOS.Anim.TitleFont" )
	
	local nametext = vgui.Create( "DTextEntry", holdframe )
	nametext:SetSize( iw*0.9, fh*0.03 )
	nametext:SetPos( iw*0.05, ih + fh*0.15 )
	
	local title = vgui.Create( "DLabel", holdframe )
	title:SetSize( iw*0.9, fh*0.05 )
	title:SetPos( iw*0.05, ih + fh*0.19 )
	title:SetText( "Holdtype Code:" )
	title:SetFont( "wOS.Anim.TitleFont" )
	
	local prefix = vgui.Create( "DTextEntry", holdframe )
	prefix:SetSize( iw*0.9, fh*0.03 )
	prefix:SetPos( iw*0.05, ih + fh*0.25 )
	prefix:SetText( "wos-custom-xxx" )
	
	local title2 = vgui.Create( "DLabel", holdframe )
	title2:SetSize( iw*0.9, fh*0.05 )
	title2:SetPos( iw*0.05, ih + fh*0.29 )
	title2:SetText( "Current Action:" )
	title2:SetFont( "wOS.Anim.TitleFont" )
	
	local DComboBox = vgui.Create( "DComboBox", holdframe )
	DComboBox:SetSize( iw*0.9, fh*0.03 )
	DComboBox:SetPos( iw*0.05, ih + fh*0.35 )
	DComboBox:SetValue( "Idle Standing" )
	for act, _ in pairs( ACTS ) do
		DComboBox:AddChoice( act )
	end
	
	local AddSeq = vgui.Create( "DButton", holdframe )
	AddSeq:SetSize( iw*0.9, fh*0.05 )
	AddSeq:SetPos( iw*0.05, fh*0.515 )
	AddSeq:SetText( "" )
	AddSeq.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "Add Selected Sequence", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local AppList = vgui.Create( "DListView", holdframe )
	AppList:SetSize( iw*0.9, fh*0.3 )
	AppList:SetPos( iw*0.05, fh*0.6 )
	AppList:SetMultiSelect( false )
	AppList:AddColumn( "Animation" )
	AppList:AddColumn( "Weight" )
	AppList.OnRowRightClick = function( pan, id, line )
		if pan.ItemIconOptions then pan.ItemIconOptions:Remove() pan.ItemIconOptions = nil end
		pan.ItemIconOptions = DermaMenu( AppList )
		pan.ItemIconOptions:MakePopup()
		pan.ItemIconOptions:SetPos( gui.MouseX(), gui.MouseY() )
		pan.ItemIconOptions.Think = function( self )
			if not pan then self:Remove() end
		end
		pan.ItemIconOptions:AddOption( "Change Weight", function( self ) 

			local Scratch = vgui.Create( "DNumberScratch", holdframe:GetParent() )
			Scratch:SetSize( 1, 1 )
			Scratch:Center()
			Scratch:MakePopup()
			Scratch:SetValue( pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ]*100 or 100 )
			Scratch:SetMin( 0 )
			Scratch:SetMax( 100 )
			Scratch.OnMousePressed = function() end
			Scratch.OnMouseReleased = function() end
			Scratch.OnValueChanged = function( panz )
				pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ] = math.Round( panz:GetFloatValue() )/100
			end
			Scratch.Think = function( panz )
				if input.IsMouseDown( MOUSE_LEFT ) or input.IsMouseDown( MOUSE_RIGHT ) then
					panz:Remove()
					AppList:ReloadAll()
					return
				end
				panz:SetActive( true )
				panz:MouseCapture( true )
				panz:LockCursor()
				if ( !system.IsLinux() ) then
					panz:SetCursor( "none" )
				end
				panz:SetShouldDrawScreen( true )
			end
			hook.Add( "DrawOverlay", "wOS.AnimExtension.ReallyFuckedUpWorkAround", function()
				if ( !IsValid( Scratch ) ) then hook.Remove( "DrawOverlay", "wOS.AnimExtension.ReallyFuckedUpWorkAround" ) return end
				Scratch:PaintScratchWindow()
			end )
			self:Remove()
		end )	
		pan.ItemIconOptions:AddOption( "Remove", function( self ) 
			pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ] = nil
			pan:RemoveLine( id )
			self:Remove()
		end )	
	end
	AppList.Selections = {}
	AppList.ActSelect = DComboBox:GetValue()
	AppList.ReloadAll = function( pan ) 
		pan:Clear()
		if pan.Selections[ pan.ActSelect ] then
			for sequence, weight in pairs( pan.Selections[ pan.ActSelect ] ) do
				pan:AddLine( sequence, weight * 100 .. "%" )
			end
		end
	end
	AppList:ReloadAll()
	
	AddSeq.DoClick = function( pan )
		local l = lister:GetSelected()[1]
		if l then
			AppList:AddLine( l:GetValue(1), "100%" )
			if not AppList.Selections[ AppList.ActSelect ] then
				AppList.Selections[ AppList.ActSelect ] = {}
			end
			AppList.Selections[ AppList.ActSelect ][ l:GetValue(1) ] = 1
		end
	end
	
	DComboBox.OnSelect = function( panel, index, value )
		AppList.ActSelect = value
		AppList:ReloadAll()
	end
	
	togglebutt.DoClick = function( pan )
		holdframe.Expand = !holdframe.Expand
		if !holdframe.Expand then
			basetype:SetText( "" )
			nametext:SetText( "" )
			prefix:SetText( "wos-custom-xxx" )
			DComboBox:SetValue( "Idle Standing" )
			AppList.ActSelect = "Idle Standing"
			AppList.Selections = {}
			AppList:ReloadAll()
		end
	end
	
	local CreateHoldType = vgui.Create( "DButton", holdframe )
	CreateHoldType:SetSize( iw*0.9, fh*0.05 )
	CreateHoldType:SetPos( iw*0.05, fh*0.925 )
	CreateHoldType:SetText( "" )
	CreateHoldType.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "Print Holdtype ( Console )", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	CreateHoldType.DoClick = function( pan )
		chat.AddText( color_white, "[", Color( 0, 175, 255 ), "wOS", color_white, "] The Holdtype code has been printed into console!" )
		local name = ( nametext:GetText():len() > 0 and nametext:GetText() ) or "Rename Me" 
		local pref = ( prefix:GetText():len() > 0 and prefix:GetText() ) or "wos-custom-xxx" 
		local base = ( basetype:GetText():len() > 0 and basetype:GetText() ) or "normal"
		print( [[--=====================================================================]] )
		print( [[/*		My Custom Holdtype
			Created by ]] .. LocalPlayer():Nick() .. [[( ]] .. LocalPlayer():SteamID() .. [[ )*/]])
		print( [[
local DATA = {}
DATA.Name = "]] .. name .. [["
DATA.HoldType = "]] .. pref .. [["
DATA.BaseHoldType = "]] .. base .. [["
DATA.Translations = {} 
]])
		for slot, data in pairs( AppList.Selections ) do
			if table.Count( data ) > 0 then
				print( [[DATA.Translations[ ]] .. ACTS[slot] .. [[ ] = {]] )
				for seq, weight in pairs( data ) do
					print( [[	{ Sequence = "]] .. seq .. [[", Weight = ]] .. weight .. [[ },]])
				end
				print( [[}]] )
				print( "" )
			end
		end
		print( [[wOS.AnimExtension:RegisterHoldtype( DATA )]] )
		print( [[--=====================================================================]] )
	end
	
end
--PATH lua/bricks_server/languages/bricks_server/english.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "english", {
    ["search"] = "Search",
    ["invalidPlayerProfile"] = "Invalid player profile requested!",
    ["unbound"] = "UNBOUND",
    ["themes"] = "Themes",
    ["groups"] = "Groups",
    ["general"] = "General",
    ["itemWhitelisting"] = "Item Whitelisting",
    ["rarities"] = "Rarities",
    ["languages"] = "Languages",
    ["disabled"] = "Disabled",
    ["enabled"] = "Enabled",
    ["purchase"] = "Purchase",
    ["profile"] = "Profile",
    ["view"] = "View",
    ["admin"] = "Admin",
    ["noToolPermission"] = "You don't have permission to use this tool.",
    ["settings"] = "Settings",
    ["players"] = "Players",
    ["modules"] = "Modules",

    ["userGroupEditor"] = "User Group Editor",
    ["addNewGroup"] = "Add new group",
    ["newUserGroup"] = "What should new user group be?",
    ["groupName"] = "GroupName",

    ["custom"] = "Custom",
    ["addNew"] = "Add new",
    ["material"] = "Material",
    ["directImage"] = "Enter a direct image URL below.",
    ["default"] = "Default",
    ["selectMaterial"] = "You must select a material!",

    ["errorNoText"] = "ERROR: NO TEXT",
    ["selectOption"] = "Select option",
    ["selectValue"] = "Please select a value.",
    ["selectColor"] = "Please choose a color.",
    ["configSaved"] = "Config saved!",
    ["cmdNoPermission"] = "You don't have permission to use this command.",
    ["entityPosUpdated"] = "Entity positions updated.",
    ["noEntitiesSpawned"] = "No saved Entities were spawned.",
    ["xEntitiesSpawned"] = "%d saved Entities were spawned.",
    ["error"] = "ERROR",

    ["seconds"] = "%d seconds",
    ["second"] = "%d second",
    ["minutes"] = "%d minutes",
    ["minute"] = "%d minute",
    ["hours"] = "%d hours",
    ["hour"] = "%d hour",
    ["days"] = "%d days",
    ["day"] = "%d day",

    ["noRarity"] = "No rarity",

    ["config"] = "Config",
    ["edit"] = "Edit",
    ["editColor"] = "Edit Color",
    ["editName"] = "Edit Name",
    ["remove"] = "Remove",
    ["name"] = "Name",
    ["description"] = "Description",
    ["model"] = "Model",
    ["icon"] = "Icon",
    ["type"] = "Type",
    ["price"] = "Price",
    ["group"] = "Group",
    ["category"] = "Category",
    ["color"] = "Color",
    ["invalidType"] = "Invalid type.",
    ["invalidOption"] = "Invalid option.",
    ["invalidChoice"] = "Invalid choice.",
    ["invalidGroup"] = "Invalid group.",
    ["invalidPlayer"] = "Invalid player.",
    ["true"] = "TRUE",
    ["false"] = "FALSE",
    ["noDescription"] = "No description",
    ["other"] = "Other",
    ["completed"] = "Completed",
    ["close"] = "Close",
    ["main"] = "Main",
    
    ["valueQuery"] = "What should the %s be?",
    ["dataValueQuery"] = "What data should this be?",
    ["newNameQuery"] = "What should the new name be?",
    ["newDescriptionQuery"] = "What should the new description be?",
    ["newModelQuery"] = "What should the new model be?",
    ["newIconQuery"] = "What should the new icon be?",
    ["newColorQuery"] = "What should the new color be?",
    ["npcTypeQuery"] = "What type should this NPC be?",
    ["newTypeQuery"] = "What should the new type be",
    ["groupRequirementQuery"] = "What should the group requirement be?",
    ["levelRequirementQuery"] = "What should the level requirement be?",
    ["newPriceQuery"] = "What should the new price be?",
    ["newCategoryQuery"] = "What should the new category be?",
    ["npcType"] = "NPC Type",

    ["npcEditor"] = "NPC Editor",
    ["addNPC"] = "Add NPC",
    ["newNPC"] = "New NPC",

    ["ok"] = "OK",
    ["cancel"] = "Cancel",
    ["save"] = "Save",
    ["confirm"] = "Confirm",
    ["nil"] = "NIL",
    ["none"] = "None",
    ["selected"] = "Selected",
    ["unselected"] = "Unselected",
    ["add"] = "Add",

    ["shootyStick"] = "A shooty stick!",
    ["permanent"] = "Permanent",
    ["tierX"] = "(Tier %d)",
    ["someDescription"] = "Some description.",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Invalid NPC",

    ["disconnected"] = "Disconnected",
    ["profileView"] = "Profile View",
    ["loading"] = "Loading",
    ["statistics"] = "Statistics",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Donation Rank",
    ["staffRank"] = "Staff Rank",
    ["currentJob"] = "Current Job",
    ["wallet"] = "Wallet",
    ["level"] = "Level",
    ["levelX"] = "Level %d",
    ["experience"] = "Experience",
    ["exp"] = "EXP",
    ["money"] = "Money",
    ["playerLogs"] = "Player Logs",
    ["deleteLogs"] = "Delete logs",
    ["xLogs"] = "%d logs",
    ["xAdminGroups"] = "%d Admin Groups",
    ["editUserGroups"] = "Edit User Groups",
    ["newGroupColor"] = "What should the new group color be?",
    ["newGroupName"] = "What should new group name be?",
    ["groupAlreadyExists"] = "That group already exists!",
    ["whitelist"] = "Whitelist",
    ["unWhitelist"] = "UnWhitelist",
    ["addCustom"] = "Add custom",
    ["entClassWhitelist"] = "What entity class would you like to whitelist?",
    ["entClassAlreadyOnList"] = "This entity class is already on the list!",
    ["changesServerRestart"] = "Some changes will not take effect until the server is restarted!",
    ["comingSoon"] = "Coming Soon!",
    ["features"] = "FEATURES",
    ["addNewRarity"] = "Add new rarity",
    ["newRarity"] = "New Rarity",
    ["needToAddRarity"] = "You need to add a rarity type first!",
    ["whatRarityItem"] = "What rarity should this item be?",
    ["invalidRarity"] = "Invalid rarity.",
    ["rarityAlreadyExists"] = "A rarity with this name already exists!",
    ["themeColorX"] = "Theme - Color %d",
    ["themeTextColor"] = "Theme - Text Color",
    ["presetAccents"] = "Preset accents",
    ["presetBackgrounds"] = "Preset backgrounds",
    ["resetToBaseThemes"] = "Reset to base themes",
    ["resetToCurrentThemes"] = "Reset to current themes",
    ["toggle"] = "Toggle",
    ["menu"] = "Menu",
    ["emptyValue"] = "EMPTY VALUE",
    ["newValueQuery"] = "What should the new value be?",
    ["pressKey"] = "PRESS A KEY",

    ["entityPlacer"] = "Entity Placer",
    ["invalidEntityType"] = "Invalid Entity type, choose a valid one from the tool menu.",
    ["entityPlaced"] = "Entity succesfully placed.",
    ["entityRemoved"] = "Entity succesfully removed.",
    ["canOnlyUseToolEntity"] = "You can only use this tool to remove/create an entity.",
    ["entityType"] = "Entity Type",
    ["entityPlacerDescription"] = "Places and removes entities from Brick's Server and saves their positions. LeftClick - place. RightClick - remove.",
    ["entityPlacerDescriptionSmall"] = "Places and removes entities",
    ["entityPlacerInstructions"] = "LeftClick - place, RightClick - remove.",

    ["npcPlacer"] = "NPC Placer",
    ["npcPlaced"] = "NPC succesfully placed.",
    ["invalidNPCType"] = "Invalid NPC type, choose a valid one from the tool menu.",
    ["npcRemoved"] = "NPC succesfully removed.",
    ["errorNotNPC"] = "You can only use this tool to remove/create an NPC.",
    ["npcPlacerDescription"] = "Places and removes NPCs from Brick's Server, LeftClick - place, RightClick - remove.",
    ["npcPlacerDescriptionSmall"] = "Places and removes NPCs from Brick's Server.",

    ["inventory"] = "Inventory",
    ["player"] = "Player",
    ["drop"] = "Drop",
    ["use"] = "Use",
    ["dropAll"] = "Drop all",
    ["delete"] = "Delete",
    ["create"] = "Create",
    ["createNew"] = "CREATE NEW",
    ["createNewLanguage"] = "Create a new language.",

    ["itemRarities"] = "Item Rarities",
} )
--PATH lua/bricks_server/core/shared/sh_player.lua:
BRICKS_SERVER.PLAYERMETA = {}
BRICKS_SERVER.PLAYERMETA.__index = BRICKS_SERVER.PLAYERMETA

local playerMeta = FindMetaTable( "Player" )

function playerMeta:BRS()
	if( SERVER ) then
		if( not self ) then return false end

		if( not self.BRS_PLAYERMETA ) then
			self.BRS_PLAYERMETA = {
				Player = self
			}

			setmetatable( self.BRS_PLAYERMETA, BRICKS_SERVER.PLAYERMETA )
		end

		return self.BRS_PLAYERMETA
	else
		return BRICKS_SERVER.LOCALPLYMETA
	end
end

-- GENERAL FUNCTIONS --
function BRICKS_SERVER.PLAYERMETA:GetUserID()
	return self.UserID or 0
end
--PATH lua/bricks_server/vgui/bricks_server_combo_search.lua:

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

--PATH lua/bricks_server/vgui/bricks_server_config_groups.lua:
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
    local textX, textY = surface.GetTextSize( "Create Group" )
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

        draw.SimpleText( "Create Group", "BRICKS_SERVER_Font20", 12+iconSize+5, h/2, BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ), 0, TEXT_ALIGN_CENTER )
    end
    createNewButton.DoClick = function()
        BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupName" ), BRICKS_SERVER.Func.L( "groupName" ), function( text ) 
            for key, val in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
                if( val[1] == text ) then
                    BRICKS_SERVER.Func.CreateTopNotification( BRICKS_SERVER.Func.L( "groupAlreadyExists" ), 3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
                    return
                end
            end
            
            table.insert( BS_ConfigCopyTable.GENERAL.Groups, { text, {} } )
            self:Refresh()
            BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
        end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
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

    local slotsWide = 3
    self.spacing = 10
    local gridWide = self.panelWide-50-10-self.spacing
    self.slotWide, self.slotTall = (gridWide-((slotsWide-1)*self.spacing))/slotsWide, 60+10+40+10+60

    self.slotPanels = {}
    for i = 1, slotsWide do
        self.slotPanels[i] = vgui.Create( "DPanel", self.scrollPanel )
        self.slotPanels[i]:SetPos( ((i-1)*(self.slotWide+self.spacing)), 0 )
        self.slotPanels[i]:SetSize( self.slotWide, 0 )
        self.slotPanels[i].slotCount = 0
        self.slotPanels[i].Paint = function() end
    end

    self:Refresh()
end

function PANEL:Refresh()
    local removeMat = Material( "materials/bricks_server/delete.png" )
    local editMat = Material( "materials/bricks_server/edit.png" )
    local upMat = Material( "materials/bricks_server/up.png" )
    local downMat = Material( "materials/bricks_server/down.png" )

    for k, v in ipairs( self.slotPanels ) do
        v:Clear()
        v:SetTall( 0 )
        v.slotCount = 0
    end

    for k, v in ipairs( BS_ConfigCopyTable.GENERAL.Groups ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local slotParent = self.slotPanels[1]
        for key, val in ipairs( self.slotPanels ) do
            if( val.slotCount < slotParent.slotCount ) then
                slotParent = val
                break
            end
        end

        slotParent.slotCount = slotParent.slotCount+1
        slotParent.targetHeight = slotParent:GetTall()+self.slotTall+(slotParent.slotCount == 1 and 0 or self.spacing)
        slotParent:SetTall( slotParent.targetHeight )

        surface.SetFont( "BRICKS_SERVER_Font25" )
        local headerX, headerY = surface.GetTextSize( v[1] )

        local groupCount = table.Count( v[2] )
        surface.SetFont( "BRICKS_SERVER_Font17" )
        local groupX, groupY = surface.GetTextSize( groupCount .. " User Group" .. (groupCount != 1 and "s" or "") )

        local contentH = headerY+groupY-10

        local topH = 60
        local groupBack = vgui.Create( "DPanel", slotParent )
        groupBack:Dock( TOP )
        groupBack:DockMargin( 0, 0, 0, self.spacing )
        groupBack:DockPadding( 0, topH, 0, 0 )
        groupBack:SetTall( self.slotTall )
        groupBack.targetHeight = self.slotTall
        groupBack.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

            draw.RoundedBoxEx( 8, 0, 0, w, topH, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, false, false )
            draw.RoundedBoxEx( 8, 0, 0, w, topH, BRICKS_SERVER.Func.GetTheme( 1, 75 ), true, true, false, false )

            draw.SimpleText( v[1] .. " - " .. k, "BRICKS_SERVER_Font25", w/2, (topH/2)-(contentH/2)-4, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
            draw.SimpleText( groupCount .. " User Group" .. (groupCount != 1 and "s" or ""), "BRICKS_SERVER_Font17", w/2, (topH/2)+(contentH/2), BRICKS_SERVER.Func.GetTheme( 6, 75 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
        end

        local actionBack = vgui.Create( "DPanel", groupBack )
        actionBack:Dock( TOP )
        actionBack:DockMargin( 10, 10, 10, 0 )
        actionBack:SetTall( 40 )
        actionBack:DockPadding( 0, 0, 10, 0 )
        actionBack.Paint = function( self2, w, h ) end
        actionBack.AddButton = function( self2, material, func )
            local button = vgui.Create( "DButton", self2 )
            button:Dock( LEFT )
            button:SetWide( self2:GetTall() )
            button:DockMargin( 0, 0, 5, 0 )
            button:SetText( "" )
            local alpha = 0
            local x, y = 0, 0
            button.Paint = function( self3, w, h )
                local toScreenX, toScreenY = self3:LocalToScreen( 0, 0 )
                if( x != toScreenX or y != toScreenY ) then
                    x, y = toScreenX, toScreenY
                end
        
                if( self3:IsHovered() ) then
                    alpha = math.Clamp( alpha+10, 0, 105 )
                else
                    alpha = math.Clamp( alpha-10, 0, 105 )
                end
        
                draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
                draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 150+alpha ) )
        
                surface.SetMaterial( material )
                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 150+alpha ) )
                local iconSize = 24
                surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
            end
            button.DoClick = function()
                func( x, y, button:GetWide(), button:GetWide() )
            end
        end

        actionBack:AddButton( removeMat, function( x, y, w, h )
            table.remove( BS_ConfigCopyTable.GENERAL.Groups, k )
            self:Refresh()
            BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
        end )
        actionBack:AddButton( editMat, function( x, y, w, h )
            actionBack.Menu = vgui.Create( "bricks_server_dmenu" )
            actionBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editUserGroups" ), function()
                BRICKS_SERVER.Func.CreateGroupEditor( (v[2] or {}), function( userGroups ) 
                    BS_ConfigCopyTable.GENERAL.Groups[k][2] = userGroups or {}
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end, function() end, true )
            end )
            actionBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editColor" ), function()
                BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupColor" ), (v[3] or BRICKS_SERVER.Func.GetTheme( 5 )), function( color ) 
                    BS_ConfigCopyTable.GENERAL.Groups[k][3] = color or BRICKS_SERVER.Func.GetTheme( 5 )
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
            end )
            actionBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editName" ), function()
                BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupName" ), (v[1] or "GroupName"), function( text ) 
                    for key, val in pairs( BS_ConfigCopyTable.GENERAL.Groups ) do
                        if( val[1] == text ) then
                            notification.AddLegacy( BRICKS_SERVER.Func.L( "groupAlreadyExists" ), 1, 5 )
                            return
                        end
                    end
                    
                    BS_ConfigCopyTable.GENERAL.Groups[k][1] = text
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
            end )
            actionBack.Menu:Open()
            actionBack.Menu:SetPos( x+w+5, y+(h/2)-(actionBack.Menu:GetTall()/2) )
        end )
        actionBack:AddButton( downMat, function( x, y, w, h )
            if( k+1 <= #BS_ConfigCopyTable.GENERAL.Groups ) then
                if( BS_ConfigCopyTable.GENERAL.Groups[k+1] ) then
                    BS_ConfigCopyTable.GENERAL.Groups[k] = BS_ConfigCopyTable.GENERAL.Groups[k+1]
                end

                BS_ConfigCopyTable.GENERAL.Groups[k+1] = v
                self:Refresh()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end
        end )
        actionBack:AddButton( upMat, function( x, y, w, h )
            if( k-1 >= 1 ) then
                if( BS_ConfigCopyTable.GENERAL.Groups[k-1] ) then
                    BS_ConfigCopyTable.GENERAL.Groups[k] = BS_ConfigCopyTable.GENERAL.Groups[k-1]
                end

                BS_ConfigCopyTable.GENERAL.Groups[k-1] = v
                self:Refresh()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end
        end )

        local rarityBox = vgui.Create( "bricks_server_raritybox", groupBack )
        rarityBox:SetSize( self.slotWide, 10 )
        rarityBox:Dock( BOTTOM )
        rarityBox:SetRarityInfo( (istable( v[3] ) and v[3][1] == "") and v[3] or { "", "SolidColor", (v[3] or BRICKS_SERVER.Func.GetTheme( 5 )) } )
        rarityBox:SetCornerRadius( 8 )
        rarityBox:SetRoundedBoxDimensions( false, -10, false, 20 )

        local userGroupsBack = vgui.Create( "DPanel", groupBack )
        userGroupsBack:Dock( TOP )
        userGroupsBack:DockMargin( 10, 10, 10, 10 )
        userGroupsBack:SetTall( 40 )
        userGroupsBack.Paint = function( self2, w, h ) 
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        end

        userGroupsBack.expandButton = vgui.Create( "DButton", userGroupsBack )
        userGroupsBack.expandButton:Dock( TOP )
        userGroupsBack.expandButton:SetTall( userGroupsBack:GetTall() )
        userGroupsBack.expandButton:SetText( "" )
        local alpha = 0
        local arrow = Material( "bricks_server/down_16.png" )
        userGroupsBack.expandButton.textureRotation = -90
        userGroupsBack.expandButton.Paint = function( self2, w, h )
            local expanded = userGroupsBack:GetTall() > 40

            if( expanded ) then
                alpha = math.Clamp( alpha+5, 0, 75 )
            elseif( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+5, 0, 100 )
            else
                alpha = math.Clamp( alpha-5, 0, 100 )
            end

            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 150 ), true, true, not expanded, not expanded )

            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, not expanded, not expanded )
            surface.SetAlphaMultiplier( 1 )

            draw.SimpleText( "Edit User Groups", "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
            surface.SetMaterial( arrow )
            local iconSize = 16
            surface.DrawTexturedRectRotated( w-((h-iconSize)/2)-(iconSize/2), h/2, iconSize, iconSize, math.Clamp( (self2.textureRotation or 0), -90, 0 ) )
        end
        userGroupsBack.expandButton.DoAnim = function( expanding )
            local anim = userGroupsBack.expandButton:NewAnimation( 0.2, 0, -1 )
        
            anim.Think = function( anim, pnl, fraction )
                if( expanding ) then
                    userGroupsBack.expandButton.textureRotation = (1-fraction)*-90
                else
                    userGroupsBack.expandButton.textureRotation = fraction*-90
                end
            end
        end
        userGroupsBack.expandButton.DoClick = function()
            userGroupsBack.Expanded = not userGroupsBack.Expanded

            if( userGroupsBack.Expanded ) then
                groupBack.targetHeight = groupBack.targetHeight+userGroupsBack.expandedExtraH
                slotParent.targetHeight = slotParent.targetHeight+userGroupsBack.expandedExtraH
                userGroupsBack:SizeTo( self.slotWide-20, 40+userGroupsBack.expandedExtraH, 0.2 )
                userGroupsBack.expandButton.DoAnim( true )
            else
                groupBack.targetHeight = groupBack.targetHeight-userGroupsBack.expandedExtraH
                slotParent.targetHeight = slotParent.targetHeight-userGroupsBack.expandedExtraH
                userGroupsBack:SizeTo( self.slotWide-20, 40, 0.2 )
                userGroupsBack.expandButton.DoAnim( false )
            end

            groupBack:SizeTo( self.slotWide, groupBack.targetHeight, 0.2 )
            slotParent:SizeTo( self.slotWide, slotParent.targetHeight, 0.2 )
        end

        userGroupsBack.searchBar = vgui.Create( "DPanel", userGroupsBack )
        userGroupsBack.searchBar:Dock( TOP )
        userGroupsBack.searchBar:SetTall( 30 )
        local search = Material( "materials/bricks_server/search_16.png" )
        local alpha = 0
        userGroupsBack.searchBar.Paint = function( self2, w, h )
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, 100 ) )
            surface.DrawRect( 0, 0, w, h )
    
            if( self2.entry:IsEditing() ) then
                alpha = math.Clamp( alpha+5, 0, 100 )
            else
                alpha = math.Clamp( alpha-5, 0, 100 )
            end
            
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2, alpha ) )
            surface.DrawRect( 0, 0, w, h )
        
            surface.SetDrawColor( 255, 255, 255, 20+((alpha/100)*255) )
            surface.SetMaterial( search )
            local size = 16
            surface.DrawTexturedRect( w-size-(h-size)/2, (h-size)/2, size, size )
        end
    
        userGroupsBack.searchBar.entry = vgui.Create( "bricks_server_search", userGroupsBack.searchBar )
        userGroupsBack.searchBar.entry:Dock( FILL )
        userGroupsBack.searchBar.entry:SetFont( "BRICKS_SERVER_Font20" )
        userGroupsBack.searchBar.entry.OnChange = function()
            userGroupsBack.list.RefreshEntries()
        end

        local userGroupTall, userGroupSpacing = 25, 10
        userGroupsBack.list = vgui.Create( "DPanel", userGroupsBack )
        userGroupsBack.list:Dock( TOP )
        userGroupsBack.list:SetTall( 0 )
        userGroupsBack.list:DockMargin( 0, userGroupSpacing, 0, userGroupSpacing )
        userGroupsBack.list.Paint = function( self2, w, h ) end
        userGroupsBack.list.RefreshEntries = function()
            userGroupsBack.list:Clear()
            userGroupsBack.list:SetTall( 0 )

            local possibleUserGroups = BRICKS_SERVER.Func.GetAdminSystemRanks()
            for key, val in pairs( v[2] ) do
                if( not possibleUserGroups[key] ) then
                    BS_ConfigCopyTable.GENERAL.Groups[k][2][key] = nil
                end
            end

            for key, val in pairs( possibleUserGroups ) do
                if( userGroupsBack.searchBar.entry:GetValue() != "" and not string.find( string.lower( val ), string.lower( userGroupsBack.searchBar.entry:GetValue() ) ) ) then
                    continue
                end

                local userGroupEntry = vgui.Create( "DPanel", userGroupsBack.list )
                userGroupEntry:Dock( TOP )
                userGroupEntry:DockMargin( 20, 0, 20, userGroupSpacing )
                userGroupEntry:SetTall( userGroupTall )
                userGroupEntry.Paint = function( self2, w, h )
                    draw.SimpleText( val, "BRICKS_SERVER_Font20", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                end

                local userGroupButton = vgui.Create( "bricks_server_dcheckbox", userGroupEntry )
                userGroupButton:Dock( RIGHT )
                userGroupButton:SetValue( v[2][key] )
                userGroupButton:SetTitle( "" )
                userGroupButton.backgroundCol = BRICKS_SERVER.Func.GetTheme( 2 )
                userGroupButton.OnChange = function( value )
                    if( value == true ) then
                        BS_ConfigCopyTable.GENERAL.Groups[k][2][key] = true
                    else
                        BS_ConfigCopyTable.GENERAL.Groups[k][2][key] = nil
                    end
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end

                userGroupsBack.list:SetTall( userGroupsBack.list:GetTall()+userGroupEntry:GetTall()+(userGroupsBack.list:GetTall() > 0 and userGroupSpacing or 0) )
            end

            if( userGroupsBack.Expanded ) then
                groupBack.targetHeight = groupBack.targetHeight-userGroupsBack.expandedExtraH
                slotParent.targetHeight = slotParent.targetHeight-userGroupsBack.expandedExtraH
    
                userGroupsBack.expandedExtraH = (userGroupSpacing*2)+userGroupsBack.list:GetTall()+userGroupsBack.searchBar:GetTall()

                groupBack.targetHeight = groupBack.targetHeight+userGroupsBack.expandedExtraH
                slotParent.targetHeight = slotParent.targetHeight+userGroupsBack.expandedExtraH
                
                userGroupsBack:SizeTo( self.slotWide-20, 40+userGroupsBack.expandedExtraH, 0.1 )
                groupBack:SizeTo( self.slotWide, groupBack.targetHeight, 0.1 )
                slotParent:SizeTo( self.slotWide, slotParent.targetHeight, 0.1 )
            else
                userGroupsBack.expandedExtraH = (userGroupSpacing*2)+userGroupsBack.list:GetTall()+userGroupsBack.searchBar:GetTall()
            end
        end
        userGroupsBack.list.RefreshEntries()
    end
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_groups", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_config_itemrarities.lua:
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

    self.spacing = 5
    local gridWide = self.panelWide-50-10-self.spacing
    local wantedSlotSize = 125*(ScrW()/2560)
    self.slotsWide = math.floor( gridWide/wantedSlotSize )
    self.slotSize = (gridWide-((self.slotsWide-1)*self.spacing))/self.slotsWide

    self.grid = vgui.Create( "DIconLayout", self.scrollPanel )
    self.grid:Dock( TOP )
    self.grid:SetSpaceY( self.spacing )
    self.grid:SetSpaceX( self.spacing )

    self:Refresh()
end

function PANEL:Refresh()
    self.grid:Clear()

    local sortedItems = {}
    local rarityItems = BRICKS_SERVER.Func.GetRarityItems() or {}
    for k, v in pairs( rarityItems ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] or "" ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local rarityInfo, rarityKey = {}, 0
        if( BS_ConfigCopyTable.INVENTORY.ItemRarities[k] ) then
            rarityInfo, rarityKey = BRICKS_SERVER.Func.GetRarityInfo( BS_ConfigCopyTable.INVENTORY.ItemRarities[k] )
        end

        local itemTable = table.Copy( v )
        itemTable.Key = k
        itemTable.Rarity = rarityKey or 0
        itemTable.RarityInfo = rarityInfo

        table.insert( sortedItems, itemTable )
    end

    table.sort( sortedItems, function( a, b ) return ((a or {}).Rarity or 0) > ((b or {}).Rarity or 0) end )

    local loadingIcon = Material( "materials/bricks_server/loading.png" )

    local modelsToLoad = {}
    for k, v in pairs( sortedItems ) do
        local slotBack = self.grid:Add( "DPanel" )
        slotBack:SetSize( self.slotSize, self.slotSize )
        local changeAlpha = 0
        slotBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
            
            if( IsValid( self2.itemModel ) ) then
                if( self2.itemModel:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                elseif( self2.itemModel:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
                end
            else
                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.SetMaterial( loadingIcon )
                local size = 32
                surface.DrawTexturedRectRotated( w/2, h/2, size, size, -(CurTime() % 360 * 250) )
            end

            surface.SetAlphaMultiplier( changeAlpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            surface.SetAlphaMultiplier( 1 )

            draw.SimpleText( (v[1] or BRICKS_SERVER.Func.L( "nil" )), "BRICKS_SERVER_Font17", w/2, h-5, ((v.RarityInfo and BRICKS_SERVER.Func.GetRarityColor( v.RarityInfo )) or BRICKS_SERVER.Func.GetTheme( 6 )), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
        end

        table.insert( modelsToLoad, { slotBack, v.Key } )
    end

    local function loadModel( k )
        if( not modelsToLoad[k] ) then return end

        local parent, itemKey = modelsToLoad[k][1], modelsToLoad[k][2]
        local model, color = rarityItems[itemKey][2], rarityItems[itemKey][3]

        if( not IsValid( parent ) ) then return end

        if( model ) then
            parent.itemModel = vgui.Create( "DModelPanel", parent )
            parent.itemModel:Dock( FILL )
            parent.itemModel:SetModel( model )
            function parent.itemModel:LayoutEntity( Entity ) return end
            if( parent.itemModel.Entity and IsValid( parent.itemModel.Entity ) ) then
                local mn, mx = parent.itemModel.Entity:GetRenderBounds()
                local size = 0
                size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
                size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
                size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )
    
                parent.itemModel:SetFOV( 70 )
                parent.itemModel:SetCamPos( Vector( size, size, size ) )
                parent.itemModel:SetLookAt( (mn + mx) * 0.5 )
            end

            if( color ) then
                parent.itemModel:SetColor( color )
            end
        else
            parent.itemModel = vgui.Create( "DButton", parent )
            parent.itemModel:Dock( FILL )
            parent.itemModel:SetText( "" )
            parent.itemModel.Paint = function() end
        end

        parent.itemModel.DoClick = function()
            local options = {}
            for k, v in pairs( BS_ConfigCopyTable.GENERAL.Rarities ) do
                options[k] = v[1] or BRICKS_SERVER.Func.L( "nil" )
            end

            if( table.Count( options ) <= 0 ) then 
                notification.AddLegacy( BRICKS_SERVER.Func.L( "needToAddRarity" ), 1, 5 )
                return 
            end

            BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "whatRarityItem" ), BRICKS_SERVER.Func.L( "none" ), options, function( value, data ) 
                if( BS_ConfigCopyTable.GENERAL.Rarities[data] ) then
                    BS_ConfigCopyTable.INVENTORY.ItemRarities[itemKey] = value
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                else
                    notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidRarity" ), 1, 3 )
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end

        timer.Simple( 0.02, function()
            if( not IsValid( self ) ) then return end
            
            loadModel( k+1 )
        end )
    end

    timer.Simple( 0.02, function()
        if( not IsValid( self ) ) then return end

        loadModel( 1 )
    end )
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_itemrarities", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_dvscrollbar.lua:
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

--PATH lua/bricks_server/vgui/bricks_server_loading_square.lua:
local PANEL = {}

function PANEL:Init()
    self.loadingDuration = 0.6
    self.finishFadeDuration = 0.5

    self:SetSize( BRICKS_SERVER.Func.Repeat( BRICKS_SERVER.Func.ScreenScale( 50 ), 2 ) )
    self.boxPositions = {}
    self.loadingX, self.loadingY = 0, 0
    self.oldX, self.oldY = 0, 0
    self.targetBox = 1
    self.loadingStart = 0
end

function PANEL:BeginAnimation()
    local size = (self:GetWide()-BRICKS_SERVER.UI.Margin5)/2

    for i = 1, 4 do
        local loadingBox = vgui.Create( "DPanel", self )
        loadingBox:SetSize( BRICKS_SERVER.Func.Repeat( size, 2 ) )
        loadingBox:SetPos( i % 2 == 0 and size+BRICKS_SERVER.UI.Margin5 or 0, i > 2 and size+BRICKS_SERVER.UI.Margin5 or 0 )
        loadingBox.index = i
        loadingBox.Paint = function( self2, w, h ) 
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
            surface.DrawRect( 0, 0, w, h )

            if( self.finished ) then 
                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 4, (CurTime()-self.finishTime)/self.finishFadeDuration*255 ) )
                surface.DrawRect( 0, 0, w, h )
                return 
            end

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 4 ) )
            local x, y = self2:ScreenToLocal( self:LocalToScreen( self.loadingX, self.loadingY ) )
            surface.DrawRect( x, y, w, h )
        end

        table.insert( self.boxPositions, { loadingBox:GetPos() } )
    end

    self:MoveLoadingBox( 2 )
end

function PANEL:MoveLoadingBox( target )
    self.targetBox = target > 4 and 1 or target
    self.oldX, self.oldY = self.loadingX, self.loadingY
    self.loadingStart = CurTime()

    timer.Simple( self.loadingDuration, function()
        if( not IsValid( self ) ) then return end
        self:MoveLoadingBox( (self.targetBox == 1 and 2) or (self.targetBox == 2 and 4) or (self.targetBox == 4 and 3) or 1 )
    end )
end

function PANEL:FinishLoading()
    self.finishTime = CurTime()
    self.finished = true
    self:SizeTo( 0, 0, 0.2, self.finishFadeDuration+0.2, -1, function()
        self:Remove()
    end )
end

function PANEL:OnSizeChanged( w, h )
    if( not self.finished ) then return end
    self:SetPos( self.centerX-w/2, self.centerY-h/2 )

    local size = (self:GetWide()-PROJECT0.UI.Margin5)/2
    for k, v in ipairs( self:GetChildren() ) do
        v:SetSize( BRICKS_SERVER.Func.Repeat( size, 2 ) )
        v:SetPos( k % 2 == 0 and size+PROJECT0.UI.Margin5 or 0, k > 2 and size+PROJECT0.UI.Margin5 or 0 )
    end
end

function PANEL:PerformLayout( width, height )
    if( self.finished ) then return end
    self.centerX, self.centerY = self:GetX()+width/2, self:GetY()+height/2
end

function PANEL:Think()
    local percent = math.Clamp( (CurTime()-self.loadingStart)/self.loadingDuration, 0, 1 )
    self.loadingX, self.loadingY = Lerp( percent, self.oldX, self.boxPositions[self.targetBox][1] ), Lerp( percent, self.oldY, self.boxPositions[self.targetBox][2] )
end

vgui.Register( "bricks_server_loading_square", PANEL, "Panel" )
--PATH lua/bricks_server/vgui/bricks_server_raritybox.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:SetRarityName( rarityName, direction, rarityInfo )
	self:Clear()

	self.rarityInfo = rarityInfo or BRICKS_SERVER.Func.GetRarityInfo( rarityName )

	if( not self.rarityInfo ) then return end

	self.rarityType = self.rarityInfo[2]

	if( (self.rarityType == "Gradient" or self.rarityType == "Fade") and (not self.rarityInfo[3] or #self.rarityInfo[3] <= 1) ) then
		self.rarityType = "SolidColor"
	end

	if( self.rarityType == "Gradient" or self.rarityType == "Rainbow" ) then
		self.colorPanel = vgui.Create( "bricks_server_gradientanim", self )
		self.colorPanel:SetPos( 0, 0 )
		self.colorPanel:SetSize( self:GetSize() )

		if( direction ) then
			self.colorPanel:SetDirection( direction )
		end
		
		if( self.rarityType == "Rainbow" ) then
			self.colorPanel:TasteTheRainbow()
		else
			self.colorPanel:SetColors( unpack( self.rarityInfo[3] ) )
		end

		self.colorPanel:StartAnim()
	else
		local panelColors
		if( self.rarityType == "Fade" ) then
			panelColors = self.rarityInfo[3]
		else
			panelColors = { self.rarityInfo[3] }
		end

		local fadeTime = 3
		local changeTime, currentColor, nextColor = CurTime()+fadeTime, 1, 2

		self.colorPanel = vgui.Create( "DPanel", self )
		self.colorPanel:SetPos( 0, 0 )
		self.colorPanel:SetSize( self:GetSize() )
		self.colorPanel.Paint = function( self2, w, h )
			local panelColor = panelColors[1]
			if( self.rarityType == "Fade" ) then
				if( CurTime() >= changeTime ) then
					changeTime, currentColor, nextColor = CurTime()+fadeTime, nextColor, ((panelColors[nextColor+1] and nextColor+1) or 1)
				end

				local curColor, nextColor = panelColors[currentColor], panelColors[nextColor]
				local percent = (fadeTime-(changeTime-CurTime()))/fadeTime

				panelColor = Color( Lerp( percent, curColor.r, nextColor.r ), Lerp( percent, curColor.g, nextColor.g ), Lerp( percent, curColor.b, nextColor.b ) )
			end
			
			if( self.cornerRadius > 0 ) then
				draw.RoundedBox( self.cornerRadius, (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h), panelColor )
			else
				surface.SetDrawColor( panelColor )
				surface.DrawRect( (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h) )
			end
		end
	end
end

function PANEL:SetRarityInfo( rarityInfo, direction )
	self:SetRarityName( false, direction, rarityInfo )
end

function PANEL:OnSizeChanged( w, h )
	if( IsValid( self.colorPanel ) ) then
		self.colorPanel:SetSize( w, h )
	end
end

function PANEL:SetCornerRadius( cornerRadius )
	self.cornerRadius = cornerRadius

	if( self.rarityType != "Gradient" and self.rarityType != "Rainbow" ) then return end

    self.colorPanel:SetCornerRadius( cornerRadius )
end

function PANEL:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
	self.roundedBoxX, self.roundedBoxY, self.roundedBoxW, self.roundedBoxH = roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH

	if( self.rarityType != "Gradient" and self.rarityType != "Rainbow" ) then return end

	self.colorPanel:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_raritybox", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_searchbar.lua:
local PANEL = {}

function PANEL:Init()
    self.search = vgui.Create( "bricks_server_search", self )
    self.search:Dock( FILL )
    self.search.OnChange = function()
        if( self.OnChange ) then
            self.OnChange()
        end
    end
    self.search.OnEnter = function()
        if( self.OnEnter ) then
            self.OnEnter()
        end
    end

    self:SetCornerRadius( 5 )
    self:SetRoundedCorners( true, true, true, true )
end

function PANEL:SetValue( val )
    return self.search:SetValue( val )
end

function PANEL:GetValue()
    return self.search:GetValue()
end

function PANEL:SetBackColor( color )
    self.backColor = color
end

function PANEL:SetHighlightColor( color )
    self.highlightColor = color
end

function PANEL:SetCornerRadius( cornerRadius )
    self.cornerRadius = cornerRadius
end

function PANEL:SetRoundedCorners( roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight )
    self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight = roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight
end

local search = Material( "materials/bricks_server/search.png" )
local alpha, alpha2 = 0, 20
function PANEL:Paint( w, h )
    draw.RoundedBoxEx( self.cornerRadius, 0, 0, w, h, (self.backColor or BRICKS_SERVER.Func.GetTheme( 3 )), self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight )

    if( self.search:IsEditing() ) then
        alpha = math.Clamp( alpha+5, 0, 100 )
        alpha2 = math.Clamp( alpha2+20, 20, 255 )
    else
        alpha = math.Clamp( alpha-5, 0, 100 )
        alpha2 = math.Clamp( alpha2-20, 20, 255 )
    end
    
    surface.SetAlphaMultiplier( alpha/255 )
    draw.RoundedBoxEx( self.cornerRadius, 0, 0, w, h, (self.highlightColor or BRICKS_SERVER.Func.GetTheme( 2 )), self.roundTopLeft, self.roundTopRight, self.roundBottomLeft, self.roundBottomRight )
    surface.SetAlphaMultiplier( 1 )

    surface.SetDrawColor( 255, 255, 255, alpha2 )
    surface.SetMaterial( search )
    local size = 24
    surface.DrawTexturedRect( w-size-(h-size)/2, (h-size)/2, size, size )
end

vgui.Register( "bricks_server_searchbar", PANEL, "DPanel" )
--PATH lua/vgui/bvgui/blankpanel.lua:
derma.DefineControl("bVGUI.BlankPanel", nil, {})
--PATH lua/vgui/bvgui/button.lua:
--/// Button Color Enumerations ///--

bVGUI.BUTTON_COLOR_BLUE   = bVGUI.COLOR_GMOD_BLUE
bVGUI.BUTTON_COLOR_GREEN  = Color(57, 202, 116)
bVGUI.BUTTON_COLOR_RED    = Color(229, 77, 66)
bVGUI.BUTTON_COLOR_ORANGE = Color(230, 126, 34)
bVGUI.BUTTON_COLOR_PURPLE = Color(154, 91, 180)
bVGUI.BUTTON_COLOR_YELLOW = Color(240, 195, 48)
bVGUI.BUTTON_COLOR_GREY   = Color(62, 62, 62)

--/// bVGUI.Button ///--

local PANEL = {}

function PANEL:Init()
	self:SetCursor("hand")
	self:SetTall(30)
	self:SetMouseInputEnabled(true)
	self:DockPadding(0,0,0,4)

	self.OriginalBarColor = bVGUI.INFOBAR_COLOR_GREY
	self.TargetBarColor = self.OriginalBarColor
	self.BorderColor = bVGUI.DarkenColor(self.OriginalBarColor, 0.4)

	self.Label = vgui.Create("DLabel", self)
	self.Label:Dock(FILL)
	self.Label:SetContentAlignment(5)
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
end

function PANEL:SetFont(font)
	self.Label:SetFont(font)
end

function PANEL:SetText(text)
	self.Text = text
	self.Label:SetText(text)
end
function PANEL:GetText()
	return self.Text
end

function PANEL:SetColor(col_enum)
	self.Label:SetTextColor(bVGUI.TextColorContrast(col_enum))
	self.OriginalBarColor = col_enum
	self.TargetBarColor = self.OriginalBarColor
	self.BorderColor = bVGUI.DarkenColor(self.OriginalBarColor, 0.4)
	if (self.ColorInterpolation) then
		self.ColorInterpolation = bVGUI.LerpColor(self.OriginalBarColor, self.OriginalBarColor, .25)
	end
end
function PANEL:GetColor()
	return self.OriginalBarColor
end

function PANEL:OnCursorEntered()
	if (self.Tooltip) then
		bVGUI.CreateTooltip(self.Tooltip)
	end
	if (self.Disabled) then return end

	self.TargetBarColor = bVGUI.LightenColor(self.OriginalBarColor, 0.2)
	self.ColorInterpolation = bVGUI.LerpColor(self.OriginalBarColor, self.TargetBarColor, .25)
end
function PANEL:OnCursorExited()
	if (self.Tooltip) then
		bVGUI.DestroyTooltip()
	end
	if (self.Disabled) then return end

	self.ColorInterpolation = bVGUI.LerpColor(self.TargetBarColor, self.OriginalBarColor, .25)
	self.TargetBarColor = self.OriginalBarColor

	if (self.DrawBorder ~= false) then
		self:DockPadding(0,0,0,4)
		self:InvalidateLayout(true)
	end
end
function PANEL:OnMousePressed()
	if (self.Disabled) then return end

	self.ColorInterpolation = nil
	self.TargetBarColor = self.BorderColor
	if (self.DrawBorder ~= false) then
		self:DockPadding(0,0,0,0)
		self:InvalidateLayout(true)
	end
end
function PANEL:OnMouseReleased()
	if (self.Disabled) then return end

	if (self:IsHovered()) then
		self.TargetBarColor = bVGUI.LightenColor(self.OriginalBarColor, 0.2)
	else
		self.TargetBarColor = self.OriginalBarColor
	end
	if (self.DrawBorder ~= false) then
		self:DockPadding(0,0,0,4)
		self:InvalidateLayout(true)
	end

	if (self.ButtonSound and GAS) then
		GAS:PlaySound(self.ButtonSound)
	end
	if (self.DoClick) then
		self:DoClick()
	end
end

function PANEL:Paint(w,h)
	if (self.ColorInterpolation) then
		self.ColorInterpolation:DoLerp()
		surface.SetDrawColor(self.ColorInterpolation:GetColor())
	else
		surface.SetDrawColor(self.TargetBarColor)
	end
	if (self.DrawBorder ~= false) then
		local col
		if (self.ColorInterpolation) then
			col = self.ColorInterpolation:GetColor()
		else
			col = self.TargetBarColor
		end
		draw.RoundedBox(4, 0, 0, w, h, self.BorderColor)
		draw.RoundedBoxEx(4, 0, 0, w, h - 4, col, true, true)
	else
		surface.DrawRect(0,0,w,h)
	end
end

function PANEL:SetDisabled(disabled)
	self.Disabled = disabled
	if (disabled) then
		self:SetCursor("no")
		if (self.ColorInterpolation) then
			self.ColorInterpolation = bVGUI.LerpColor(self.TargetBarColor, bVGUI.BUTTON_COLOR_GREY, .25)
		end
		self.TargetBarColor = bVGUI.BUTTON_COLOR_GREY
	else
		self:SetCursor("hand")
		if (self.ColorInterpolation) then
			self.ColorInterpolation = bVGUI.LerpColor(self.TargetBarColor, self.OriginalBarColor, .25)
		end
		self.TargetBarColor = self.OriginalBarColor
	end
	self.BorderColor = bVGUI.DarkenColor(self.TargetBarColor, 0.4)
end
function PANEL:GetDisabled()
	return self.Disabled
end

function PANEL:SetDrawBorder(draw_border)
	self.DrawBorder = draw_border
	if (draw_border == false) then
		self:DockPadding(0,0,0,0)
	else
		self:DockPadding(0,0,0,5)
	end
end
function PANEL:GetDrawBorder()
	return self.DrawBorder
end

function PANEL:SetTooltip(tooltip)
	self.Tooltip = tooltip
	self.Tooltip.VGUI_Element = self
end
function PANEL:RemoveTooltip()
	if (IsValid(self.Tooltip)) then
		bVGUI.DestroyTooltip()
	end
	self.Tooltip = nil
end

function PANEL:SetSound(sound_name)
	self.ButtonSound = sound_name
end

derma.DefineControl("bVGUI.Button", nil, PANEL, "DPanel")

local PANEL = {}

function PANEL:Init()
	self:SetTall(30)
	self.Button = vgui.Create("bVGUI.Button", self)
end

function PANEL:PerformLayout()
	self.Button:Center()
end

derma.DefineControl("bVGUI.ButtonContainer", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/bvgui/combobox.lua:
local PANEL = {}

function PANEL:Init()
	self.ChoiceIcons = {}
	self.Spacers = {}
end

function PANEL:Clear()
	
	self:SetText( "" )
	self.Choices = {}
	self.Data = {}
	self.ChoiceIcons = {}
	self.Spacers = {}
	self.selected = nil

	if ( self.Menu ) then
		self.Menu:Remove()
		self.Menu = nil
	end

end

function PANEL:AddChoice( value, data, select, icon )

	local i = table.insert( self.Choices, value )

	if ( data ) then
		self.Data[ i ] = data
	end

	if (icon) then
		self.ChoiceIcons[ i ] = icon
	end

	if ( select ) then

		self:ChooseOption( value, i )

	end

	return i

end

function PANEL:AddSpacer()

	self.Spacers[ #self.Choices ] = true

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

	self.Menu = DermaMenu( false, self )

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
			if ( self.Spacers[ v.id ] ) then
				self.Menu:AddSpacer()
			end
		end
	else
		for k, v in pairs( self.Choices ) do
			local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
			if ( self.ChoiceIcons[ k ] ) then
				option:SetIcon( self.ChoiceIcons[ k ] )
			end
			if ( self.Spacers[ k ] ) then
				self.Menu:AddSpacer()
			end
		end
	end

	local x, y = self:LocalToScreen( 0, self:GetTall() )

	self.Menu:SetMinimumWidth( self:GetWide() )
	self.Menu:Open( x, y, false, self )

end

derma.DefineControl("bVGUI.ComboBox", nil, PANEL, "DComboBox")
--PATH lua/vgui/bvgui/form.lua:
local PANEL = {}

function PANEL:Init()
	self:SetColumns(bVGUI.COLUMN_LAYOUT_COLUMN_SHRINK, bVGUI.COLUMN_LAYOUT_COLUMN_GROW_COLUMN, bVGUI.COLUMN_LAYOUT_COLUMN_GROW)
end

function PANEL:SetTextSize(textsize)
	self.TextSize = textsize
end

function PANEL:CreateLabel(text, icon)
	if (ispanel(text)) then return text end
	local icon_container
	if (icon) then
		icon_container = vgui.Create("bVGUI.BlankPanel", self)
		icon_container:SetTall(16)
		icon_container.icon = vgui.Create("DImage", icon_container)
		icon_container.icon:SetSize(16,16)
		icon_container.icon:SetImage(icon)
	end

	local label
	if (icon) then
		label = vgui.Create("DLabel", icon_container)
	else
		label = vgui.Create("DLabel", self)
	end
	label:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", self.TextSize or 16))
	label:SetTextColor(bVGUI.COLOR_WHITE)
	label:SetText(text)
	label:SizeToContents()
	label:SetContentAlignment(7)
	label:SetWrap(true)
	label:SetAutoStretchVertical(true)
	if (icon) then
		function label:PerformLayout()
			icon_container:SetSize(16 + 5 + self:GetWide(), self:GetTall())
			self:AlignLeft(16 + 5)
		end
		return icon_container
	else
		return label
	end
end

function PANEL:AddSpacing(h)
	local pnl1 = vgui.Create("bVGUI.BlankPanel", self)
	pnl1:SetSize(0,h)
	local pnl2 = vgui.Create("bVGUI.BlankPanel", self)
	pnl2:SetSize(0,h)
	local pnl3 = vgui.Create("bVGUI.BlankPanel", self)
	pnl3:SetSize(0,h)
	self:AddRow(pnl1,pnl2,pnl3)
end

function PANEL:AddButton(text, btncolor, help, func)
	local btn = vgui.Create("bVGUI.Button", self)
	btn:SetColor(btncolor)
	btn:SetText(text)
	btn:SetTall(25)
	if (func) then
		function btn:DoClick()
			func()
		end
	end

	local l1 = self:CreateLabel(text)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, btn, l2)

	return l1, btn, l2
end

function PANEL:AddSwitch(text, state, help, func)
	local switch = vgui.Create("bVGUI.Switch", self)
	switch:SetChecked(state)
	switch:SetText("")
	if (func) then
		function switch:OnChange()
			func(switch:GetChecked())
		end
	end

	local l1 = self:CreateLabel(text)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, switch, l2)

	return l1, switch, l2
end

function PANEL:AddCheckbox(text, state, help, func)
	local switch = vgui.Create("bVGUI.Checkbox_Crossable", self)
	switch:SetChecked(state)
	switch:SetText("")
	if (func) then
		function switch:OnChange()
			func(switch:GetChecked())
		end
	end

	local l1 = self:CreateLabel(text)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, switch, l2)

	return l1, switch, l2
end

function PANEL:AddComboBox(text, selected, help, func, icon)
	local combobox = vgui.Create("bVGUI.ComboBox", self)
	if (selected) then combobox:SetValue(selected) end
	if (func) then
		function combobox:OnSelect(index, value, data)
			func(index, value, data)
		end
	end

	local l1 = self:CreateLabel(text, icon)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, combobox, l2)

	return l1, combobox, l2
end

function PANEL:AddTextEntry(text, value, help, func, validation, placeholder, icon)
	local textentry = vgui.Create("bVGUI.TextEntry", self)
	textentry:SetValue(value)
	if (placeholder) then
		textentry:SetPlaceholderText(placeholder)
	end
	local prev_val = value
	function textentry:OnValueChange(val)
		if (validation == nil or validation(val) == true) then
			prev_val = val
			if (func) then func(val) end
		else
			self:SetValue(prev_val)
			self:SetText(prev_val)
			GAS:PlaySound("error")
		end
	end

	local l1 = self:CreateLabel(text, icon)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, textentry, l2)

	return l1, textentry, l2
end

function PANEL:AddLongTextEntry(...)
	local l1, textentry, l2 = self:AddTextEntry(...)

	textentry:SetMultiline(true)
	textentry:SetContentAlignment(7)
	textentry:SetTall(75)

	return l1, textentry, l2
end

function PANEL:AddNumberEntry(text, value, help, func, allow_negative)
	local textentry = vgui.Create("bVGUI.TextEntry", self)
	textentry:SetNumeric(true)
	textentry:SetValue(value)
	local prev_val = value
	function textentry:OnValueChange(val)
		if (not tonumber(self:GetValue()) or (allow_negative ~= true and tonumber(self:GetValue()) < 0)) then
			self:SetValue(prev_val)
			self:SetText(prev_val)
			GAS:PlaySound("error")
		else
			prev_val = self:GetValue()
			if (func) then func(tonumber(val)) end
		end
	end

	local l1 = self:CreateLabel(text)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, textentry, l2)

	return l1, textentry, l2
end

function PANEL:AddColorMixer(text, value, help, func, alpha)
	local colormixer = vgui.Create("DColorMixer", self)
	colormixer:SetAlphaBar(alpha == true)
	colormixer:SetPalette(false)
	colormixer:SetTall(120)
	if (value) then
		colormixer:SetColor(value)
	end
	if (func) then
		function colormixer:ValueChanged(col)
			func(col)
		end
	end

	local l1 = self:CreateLabel(text)
	local l2 = self:CreateLabel(help)

	self:AddRow(l1, colormixer, l2)

	return l1, colormixer, l2
end

derma.DefineControl("bVGUI.Form", nil, PANEL, "bVGUI.ColumnLayout")
--PATH lua/vgui/bvgui/mouseinfo_tooltip.lua:
if (IsValid(bVGUI.MouseInfoTooltip)) then
	if (IsValid(bVGUI.MouseInfoTooltip.Label)) then
		bVGUI.PlayerTooltip.Label:Remove()
	end
end

bVGUI.MouseInfoTooltip = {}
bVGUI.MouseInfoTooltip.Create = function(text)
	if (IsValid(bVGUI.MouseInfoTooltip.Label)) then
		bVGUI.MouseInfoTooltip.Label:Remove()
	end
	bVGUI.MouseInfoTooltip.Label = vgui.Create("DLabel")
	bVGUI.MouseInfoTooltip.Label:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 12))
	bVGUI.MouseInfoTooltip.Label:SetText(text)
	bVGUI.MouseInfoTooltip.Label:SizeToContents()
	bVGUI.MouseInfoTooltip.Label:SetContentAlignment(5)

	bVGUI.MouseInfoTooltip.Label.CurrentTextColor = Color(255, 255, 255, 255)
	bVGUI.MouseInfoTooltip.Label.CurrentY = 15

	bVGUI.MouseInfoTooltip.Label:SetTextColor(bVGUI.MouseInfoTooltip.Label.CurrentTextColor)
	bVGUI.MouseInfoTooltip.Label:SetPos(gui.MouseX(), bVGUI.MouseInfoTooltip.Label.CurrentY)

	bVGUI.MouseInfoTooltip.Label:SetZPos(32767)
	bVGUI.MouseInfoTooltip.Label:MakePopup()
	bVGUI.MouseInfoTooltip.Label:MoveToFront()
	bVGUI.MouseInfoTooltip.Label:SetMouseInputEnabled(false)
	bVGUI.MouseInfoTooltip.Label:SetKeyBoardInputEnabled(false)

	bVGUI.MouseInfoTooltip.Label.SysTime = SysTime()
	bVGUI.MouseInfoTooltip.Label.SysTimeEnd = SysTime() + 5
	function bVGUI.MouseInfoTooltip.Label:Think()
		self.CurrentTextColor.a = Lerp(FrameTime() * 10, self.CurrentTextColor.a, 0)
		self.CurrentY = Lerp(FrameTime() * 10, self.CurrentY, 20)

		self:SetTextColor(self.CurrentTextColor)
		self:SetPos(gui.MouseX() - (self:GetWide() / 2) + 5, gui.MouseY() + self:GetTall() + self.CurrentY)

		if (self.CurrentTextColor.a <= 1) then
			self:Remove()
		end
	end
end
--PATH lua/vgui/bvgui/numberwang.lua:
local PANEL = {}

function PANEL:Init()
	self.NumberWang = vgui.Create("DNumberWang", self)
	self.NumberWang:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
end

function PANEL:CorrectSizing()
	local y = 0
	y = y + self.NumberWang:GetTall()
	if (IsValid(self.Label)) then
		y = y + 10 + self.Label:GetTall()
		self.NumberWang:AlignTop(10 + self.Label:GetTall())
	end
	if (IsValid(self.HelpLabel)) then
		y = y + 10 + self.HelpLabel:GetTall()
		self.HelpLabel:AlignTop(10 + self.Label:GetTall() + self.NumberWang:GetTall() + 10)
	end
	self:SetTall(y)
end

function PANEL:SetText(text)
	self.Label = vgui.Create("DLabel", self)
	self.Label:SetContentAlignment(4)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetText(text)
	self.Label:SizeToContents()

	self:CorrectSizing()
end

function PANEL:SetHelpText(text)
	self.HelpLabel = vgui.Create("DLabel", self)
	self.HelpLabel:SetTextColor(Color(200,200,200))
	self.HelpLabel:SetAutoStretchVertical(true)
	self.HelpLabel:SetWrap(true)
	self.HelpLabel:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.HelpLabel:SetText(text)
	local this = self
	function self.HelpLabel:PerformLayout()
		this:CorrectSizing()
	end
	self:CorrectSizing()
end

function PANEL:PerformLayout()
	if (IsValid(self.HelpLabel)) then
		self.HelpLabel:SetWide(self:GetWide() - 10)
	end
end

derma.DefineControl("bVGUI.NumberWang", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/bvgui/player_tooltip.lua:
if (bVGUI.PlayerTooltip) then
	if (IsValid(bVGUI.PlayerTooltip.Panel)) then
		bVGUI.PlayerTooltip.Panel:Remove()
	end
end

bVGUI.PlayerTooltip = {}
bVGUI.PlayerTooltip.Close = function()
	if (IsValid(bVGUI.PlayerTooltip.Panel)) then
		if (bVGUI.PlayerTooltip.Panel.Focused ~= true) then
			bVGUI.PlayerTooltip.Panel:Remove()
		end
	end
end
bVGUI.PlayerTooltip.Create = function(options)
	if (IsValid(bVGUI.PlayerTooltip.Panel)) then
		if (bVGUI.PlayerTooltip.Panel.Focused ~= true) then
			bVGUI.PlayerTooltip.Panel:Remove()
		end
	end

	if (not IsValid(options.player) and options.account_id) then
		local ply = player.GetByAccountID(options.account_id)
		if (IsValid(ply)) then
			options.player = ply
		end
	elseif (not IsValid(options.player) and options.steamid64) then
		local ply = player.GetBySteamID64(options.steamid64)
		if (IsValid(ply)) then
			options.player = ply
		end
	end

	local data = {}
	data.nick = "Loading..."
	data.usergroup = "Loading..."
	data.team_name = "(offline)"
	data.team_color = bVGUI.BUTTON_COLOR_RED
	if (IsValid(options.player)) then
		data.account_id = options.player:AccountID()
		data.steamid = options.player:SteamID()
		data.steamid64 = options.player:SteamID64()
		data.team_name = team.GetName(options.player:Team())
		data.team_color = team.GetColor(options.player:Team())
		data.nick = options.player:Nick()
		data.usergroup = options.player:GetUserGroup()
	elseif (options.steamid64) then
		data.account_id = GAS:SteamID64ToAccountID(options.steamid64)
		data.steamid = util.SteamIDFrom64(options.steamid64)
		data.steamid64 = options.steamid64
	elseif (options.account_id) then
		data.account_id = options.account_id
		data.steamid = GAS:AccountIDToSteamID(options.account_id)
		data.steamid64 = util.SteamIDTo64(data.steamid)
	end

	bVGUI.PlayerTooltip.Panel = vgui.Create("bVGUI.Frame")
	local pnl = bVGUI.PlayerTooltip.Panel
	pnl.Options = options
	pnl.CreatorPanel = options.creator
	pnl:ShowFullscreenButton(false)
	pnl:SetSize(316, 234)
	pnl:SetPos(gui.MouseX() + 15, gui.MouseY() + 15)
	pnl:DockPadding(10,24 + 10,10,10)
	pnl:MakePopup()
	pnl:SetMouseInputEnabled(false)
	pnl:SetKeyBoardInputEnabled(false)
	pnl:SetDrawOnTop(true)
	pnl.OriginalTitle = data.nick

	function pnl:OnRemove()
		timer.Simple(1, function()
			if (not IsValid(bVGUI.PlayerTooltip.Panel)) then
				bVGUI.PlayerTooltip.MouseX = false 
				bVGUI.PlayerTooltip.MouseY = false
			end
		end)
	end

	function pnl:PostPerformLayout(w, h)
		if (options.focustip) then
			pnl:SetTitle(bVGUI.EllipsesText(data.nick, bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 14), w / 3) .. " · " .. options.focustip)
		else
			pnl:SetTitle(data.nick)
		end
	end

	function pnl:OnFocusChanged(got)
		if got then return end 
		if self.Pinned then return end 
		if not GAS.LocalConfig.ClosePlayerPopups then return end		
		self:Close()
	end

	pnl.OldPaint = pnl.Paint
	function pnl:Paint(w,h)
		if (not self.Focused) then
			surface.SetAlphaMultiplier(0.5)
		end
		self:OldPaint(w,h)

		if (self.Focused ~= true) then
			local x,y = gui.MouseX(), gui.MouseY()
			bVGUI.PlayerTooltip.MouseX = Lerp(FrameTime() * 10, bVGUI.PlayerTooltip.MouseX or x, x)
			bVGUI.PlayerTooltip.MouseY = Lerp(FrameTime() * 10, bVGUI.PlayerTooltip.MouseY or y, y)

			self:SetPos(bVGUI.PlayerTooltip.MouseX + 15, bVGUI.PlayerTooltip.MouseY + 15)
		end

		if (not self.Focused) then
			if (not system.HasFocus()) then
				self:Remove()
			elseif (self.CreatorPanel) then
				if (not IsValid(self.CreatorPanel)) then
					self:Remove()
				elseif (vgui.GetHoveredPanel() ~= self.CreatorPanel) then
					if (self.HoverFrameNumber) then
						if (FrameNumber() > self.HoverFrameNumber) then
							self:Remove()
						end
					else
						self.HoverFrameNumber = FrameNumber() + 1
					end
				end
			end
		end
	end

	local avatar_container = vgui.Create("bVGUI.BlankPanel", pnl)
	avatar_container:SetMouseInputEnabled(true)
	avatar_container:Dock(LEFT)
	avatar_container:DockMargin(0,0,10,0)
	avatar_container:SetWide(110)

	local avatar = vgui.Create("AvatarImage", avatar_container)
	avatar:Dock(TOP)
	avatar:SetSize(avatar_container:GetWide(), avatar_container:GetWide())
	if (IsValid(options.player)) then
		avatar:SetPlayer(options.player, 128)
	else
		avatar:SetSteamID(data.steamid64, 128)
	end

	local usergroup = vgui.Create("bVGUI.InfoBar", avatar_container)
	usergroup:Dock(TOP)
	usergroup:DockMargin(0,10,0,10)
	usergroup:SetText(data.usergroup)
	usergroup:AllowCopy(options.copiedphrase)
	usergroup:SetColor(bVGUI.INFOBAR_COLOR_PURPLE)
	bVGUI.AttachTooltip(usergroup, {Text = "Usergroup"})

	local job = vgui.Create("bVGUI.InfoBar", avatar_container)
	job:Dock(TOP)
	job:DockMargin(0,0,0,10)
	job:SetText(data.team_name)
	job:AllowCopy(options.copiedphrase)
	job:SetColor(data.team_color)
	if (DarkRP) then
		bVGUI.AttachTooltip(job, {Text = "Job"})
	else
		bVGUI.AttachTooltip(job, {Text = "Team"})
	end

	local info_container = vgui.Create("bVGUI.BlankPanel", pnl)
	info_container:Dock(FILL)
	info_container:SetMouseInputEnabled(true)
	info_container.SIG = true

	local nick = vgui.Create("bVGUI.InfoBar", info_container)
	nick:Dock(TOP)
	nick:DockMargin(0,0,0,10)
	nick:SetText(data.nick)
	nick:AllowCopy(options.copiedphrase)
	nick:SetColor(bVGUI.INFOBAR_COLOR_PURPLE)

	local steamid = vgui.Create("bVGUI.InfoBar", info_container)
	steamid:Dock(TOP)
	steamid:DockMargin(0,0,0,10)
	steamid:SetText(data.steamid)
	steamid:AllowCopy(options.copiedphrase)

	local steamid64 = vgui.Create("bVGUI.InfoBar", info_container)
	steamid64:Dock(TOP)
	steamid64:DockMargin(0,0,0,10)
	steamid64:SetText(data.steamid64)
	steamid64:AllowCopy(options.copiedphrase)

	local steam_profile = vgui.Create("bVGUI.Button", info_container)
	steam_profile:Dock(TOP)
	steam_profile:DockMargin(0,0,0,10)
	steam_profile:SetText(bVGUI.L("open_steam_profile"))
	steam_profile:SetColor(bVGUI.BUTTON_COLOR_BLUE)
	function steam_profile:DoClick()
		if (GAS) then
			GAS:OpenURL("https://steamcommunity.com/profiles/" .. steamid64:GetText())
		else
			gui.OpenURL("https://steamcommunity.com/profiles/" .. steamid64:GetText())
		end
	end

	local context_menu = vgui.Create("bVGUI.Button", info_container)
	context_menu:Dock(TOP)
	context_menu:DockMargin(0,0,0,10)
	context_menu:SetText(bVGUI.L("open_context_menu"))
	context_menu:SetColor(bVGUI.BUTTON_COLOR_RED)
	context_menu:SetDisabled(not IsValid(options.player))
	function context_menu:DoClick()
		if (IsValid(options.player)) then
			if (GAS) then GAS:PlaySound("popup") end
			properties.OpenEntityMenu(options.player, LocalPlayer():GetEyeTrace())
		else
			if (GAS) then GAS:PlaySound("error") end
			self:SetDisabled(true)
		end
	end
	
	if (not IsValid(options.player)) then
		pnl.GetPlayerData = function()
			GAS:untimer("PlayerTooltip:Load:" .. data.account_id)
			GAS.OfflinePlayerData:AccountID(tonumber(data.account_id), function(success, offline_data)
				if (not IsValid(pnl)) then return end
				if (success) then
					data.nick = offline_data.nick
					data.usergroup = offline_data.usergroup

					pnl.OriginalTitle = offline_data.nick
					nick:SetText(offline_data.nick)
					usergroup:SetText(offline_data.usergroup)
					if (options.focustip) then
						pnl:SetTitle(offline_data.nick .. " · " .. options.focustip)
					else
						pnl:SetTitle(offline_data.nick)
					end
				else
					data.nick = "(unknown)"
					data.usergroup = "(unknown)"

					pnl.OriginalTitle = bVGUI.L("unknown")
					nick:SetText(bVGUI.L("unknown"))
					usergroup:SetText(bVGUI.L("unknown"))
					if (options.focustip) then
						pnl:SetTitle(bVGUI.L("unknown") .. " · " .. options.focustip)
					else
						pnl:SetTitle(bVGUI.L("unknown"))
					end
				end
			end)
			pnl.GetPlayerData = nil
		end
		if (GAS.OfflinePlayerData.data[data.account_id] ~= nil) then
			pnl.GetPlayerData()
		else
			GAS:timer("PlayerTooltip:Load:" .. data.account_id, .5, 1, function()
				if (not IsValid(pnl)) then return end
				pnl.GetPlayerData()
			end)
		end
	end

	return pnl
end
bVGUI.PlayerTooltip.Focus = function()
	if (IsValid(bVGUI.PlayerTooltip.Panel)) then
		if (GAS) then GAS:PlaySound("flash") end
		bVGUI.PlayerTooltip.Panel.Focused = true
		bVGUI.PlayerTooltip.Panel:MakePopup()
		bVGUI.PlayerTooltip.Panel:MoveToFront()
		bVGUI.PlayerTooltip.Panel:SetTitle(bVGUI.PlayerTooltip.Panel.OriginalTitle)
		bVGUI.PlayerTooltip.Panel:SetDrawOnTop(false)
		if (bVGUI.PlayerTooltip.Panel.GetPlayerData) then
			bVGUI.PlayerTooltip.Panel.GetPlayerData()
		end
	end
end

bVGUI.PlayerTooltip.Attach = function(pnl, options)
	options.creator = pnl
	if (pnl.bVGUI_PlayerTooltipOptions) then
		pnl.bVGUI_PlayerTooltipOptions = options
		return
	else
		pnl.bVGUI_PlayerTooltipOptions = options
	end

	pnl.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_ENTER = pnl.OnCursorEntered
	pnl.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_EXIT = pnl.OnCursorExited
	function pnl:OnCursorEntered(...)
		bVGUI.PlayerTooltip.Create(self.bVGUI_PlayerTooltipOptions)
		if (self.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_ENTER) then self.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_ENTER(self, ...) end
	end
	function pnl:OnCursorExited(...)
		bVGUI.PlayerTooltip.Close()
		if (self.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_EXIT) then self.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_EXIT(self, ...) end
	end
end

bVGUI.PlayerTooltip.Unattach = function(pnl)
	pnl.bVGUI_PlayerTooltipOptions = nil
	pnl.OnCursorEntered = pnl.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_ENTER
	pnl.OnCursorExited = pnl.bVGUI_PLAYER_TOOLTIP_OLD_CURSOR_EXIT
end
--PATH lua/vgui/bvgui/switch.lua:
local PANEL = {}

local on_color  = Color(76,218,100)
local off_color = Color(216,75,75)
local switch_width = 40
local switch_height = 20
local label_margin = 7

local function Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 )
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	return cir 
end

function PANEL:Init()
	self.LeftCircle = false
	self.RightCircle = false

	self.Active = false
	self.ColorInterpolation = bVGUI.LerpColor(off_color, off_color, .25)
	self.SwitchInterpolation = bVGUI.Lerp(switch_height / 2, switch_height / 2, .25)

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetContentAlignment(4)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 16))
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self:SetText("Switch")

	self.ClickableArea = vgui.Create("bVGUI.BlankPanel", self)
	self.ClickableArea:SetMouseInputEnabled(true)
	self.ClickableArea:SetCursor("hand")
	function self.ClickableArea:OnMouseReleased(m)
		if (m ~= MOUSE_LEFT) then return end
		local checked = not self:GetParent().Active
		self:GetParent():SetChecked(checked, true)
		if (GAS) then
			if (checked) then
				GAS:PlaySound("btn_on")
			else
				GAS:PlaySound("btn_off")
			end
		end
		if (self:GetParent().OnChange) then
			self:GetParent():OnChange()
		end
	end
end

function PANEL:PerformLayout()
	self.ClickableArea:SetSize(switch_width + label_margin + self.Label:GetWide() + label_margin, switch_height)
end

function PANEL:SetText(text)
	self.Text = text

	self.Label:SetText(text)
	self.Label:SizeToContents()
	self.Label:AlignLeft(switch_width + label_margin)
	self.Label:SizeToContents()

	self:SetSize(switch_width + label_margin + self.Label:GetWide(), switch_height)

	self.Label:CenterVertical()
end
function PANEL:GetText(text)
	return self.Text
end

function PANEL:Paint(w)
	if !self.LeftCircle or !self.RightCircle then
		self.LeftCircle = Circle(switch_height / 2, switch_height / 2, switch_height / 2,20)
		self.RightCircle = Circle(switch_width - switch_height / 2, switch_height / 2, switch_height / 2,20)
	end

	self.ColorInterpolation:DoLerp()
	self.SwitchInterpolation:DoLerp()

	surface.SetDrawColor(self.ColorInterpolation:GetColor())
	draw.NoTexture()
	surface.DrawPoly(self.LeftCircle)
	surface.DrawPoly(self.RightCircle)
	
	surface.DrawRect(switch_height / 2, 0, switch_width - switch_height, switch_height)

	surface.SetDrawColor(255, 255, 255)
	surface.DrawPoly(Circle(self.SwitchInterpolation:GetValue(), switch_height / 2, switch_height / 2 - 2,20))
end

function PANEL:SetChecked(active, animate)
	if (self.Disabled) then return end
	self.Active = active
	local from
	local to
	if (active) then
		from = switch_height / 2
		to = switch_width - (switch_height / 2)
	else
		from = switch_width - (switch_height / 2)
		to = switch_height / 2
	end
	if (animate) then
		self.SwitchInterpolation:SetTo(to)
		self.ColorInterpolation:SetTo(active and on_color or off_color)
	else
		self.SwitchInterpolation = bVGUI.Lerp(to, to, .25)
		if (active) then
			self.ColorInterpolation = bVGUI.LerpColor(on_color, on_color, .25)
		else
			self.ColorInterpolation = bVGUI.LerpColor(off_color, off_color, .25)
		end
	end
end
function PANEL:GetChecked()
	return self.Active
end

function PANEL:SetHelpText(text)
	self.HelpLabel = vgui.Create("DLabel", self)
	self.HelpLabel:SetTextColor(Color(200,200,200))
	self.HelpLabel:SetAutoStretchVertical(true)
	self.HelpLabel:SetWrap(true)
	self.HelpLabel:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.HelpLabel:AlignTop(switch_height + 10)
	self.HelpLabel:SetText(text)
	function self.HelpLabel:PerformLayout()
		local w = math.min(500, self:GetParent():GetWide())
		if (self:GetWide() ~= w) then
			self:SetWide(w)
		end
		self:GetParent():SetSize(switch_width + label_margin + self:GetParent().Label:GetWide(), switch_height + 10 + self:GetTall())
	end
end

function PANEL:SetDisabled(disabled)
	self.Disabled = disabled
	if (self.Disabled) then
		self.ColorInterpolation:SetColor(Color(165,165,165))
		self.Label:SetTextColor(Color(180,180,180))
		self.ClickableArea:SetCursor("no")
	else
		self.ClickableArea:SetCursor("hand")
		self.Label:SetTextColor(bVGUI.COLOR_WHITE)
		if (self:GetChecked()) then
			self.ColorInterpolation:SetColor(on_color)
		else
			self.ColorInterpolation:SetColor(off_color)
		end
	end
end
function PANEL:GetDisabled()
	return self.Disabled
end

derma.DefineControl("bVGUI.Switch", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/dparticlecontroller.lua:
local PANEL = {}

function PANEL:Init()
	self.CategoryTable = {}

	self.HorizontalDivider = vgui.Create( "DHorizontalDivider", self )
	self.HorizontalDivider:Dock( FILL )
	self.HorizontalDivider:SetLeftWidth( 192 )
	self.HorizontalDivider:SetLeftMin( 100 )
	self.HorizontalDivider:SetRightMin( 100 )
	if ( ScrW() >= 1024 ) then self.HorizontalDivider:SetLeftMin( 192 ) self.HorizontalDivider:SetRightMin( 400 ) end
	self.HorizontalDivider:SetDividerWidth( 6 )
	self.HorizontalDivider:SetCookieName( "SpawnMenuCreationMenuDiv" )

	self.ContentNavBar = vgui.Create( "ContentSidebar", self.HorizontalDivider )
	self.HorizontalDivider:SetLeft( self.ContentNavBar )

    self:FillContent()
end

function PANEL:EnableModify()
	self.ContentNavBar:EnableModify()
end

function PANEL:EnableSearch( ... )
	self.ContentNavBar:EnableSearch( ... )
end

function PANEL:CallPopulateHook( HookName )
end

function PANEL:FillContent()
    local files = file.Find("particles/*.pcf", "GAME")

    for k, v in pairs(files) do
        local item = self.ContentNavBar.Tree:AddNode( v, "icon16/page.png" )
        item.DoPopulate = function( s )
            game.AddParticles("particles/" .. v)
            -- If we've already populated it - forget it.
			if ( s.PropPanel ) then return end

			-- Create the container panel
			s.PropPanel = vgui.Create( "ContentContainer", pnlContent )
			s.PropPanel:SetVisible( false )
			s.PropPanel:SetTriggerSpawnlistChange( false )

			for _, pp in pairs(util.GetParticleList( "particles/" .. v )) do
				spawnmenu.CreateContentIcon( "particles", s.PropPanel, {
					name = pp,
                    part = v,
				} )
			end

        end

        item.DoClick = function( s )

			s:DoPopulate()
			self:SwitchPanel( s.PropPanel )

		end
    end
end

function PANEL:SwitchPanel( panel )

	if ( IsValid( self.SelectedPanel ) ) then
		self.SelectedPanel:SetVisible( false )
		self.SelectedPanel = nil
	end

	self.SelectedPanel = panel

	if ( !IsValid( panel ) ) then return end

	self.HorizontalDivider:SetRight( self.SelectedPanel )
	self.HorizontalDivider:InvalidateLayout( true )

	self.SelectedPanel:SetVisible( true )
	self:InvalidateParent()

end

function PANEL:OnSizeChanged()
	self.HorizontalDivider:LoadCookies()
end

vgui.Register("DParticleViewer", PANEL, "EditablePanel")

spawnmenu.AddCreationTab( "Particles", function()
    local PViewer = vgui.Create( "DParticleViewer" )
    return PViewer
end, "icon16/fire.png", 96, "See all your particles" )
--PATH addons/gmodadminsuite-logging-2.4.8/lua/vgui/gas_logging_damagelog.lua:
local function L(phrase, ...)
	if (#({...}) == 0) then
		return GAS:Phrase(phrase, "logging")
	else
		return GAS:PhraseFormat(phrase, "logging", ...)
	end
end

surface.CreateFont("gas_logging_damagelog_pct", {
	size = 24,
	font = "Circular Std Medium",
	bold = true,
})

surface.CreateFont("gas_logging_damagelog_delay", {
	size = 12,
	font = "Circular Std Medium"
})

local module_icon_cache = {}
local module_noicon = Material("icon16/page_white_text.png")
local function GetModuleIcon(module_id)
	if (module_icon_cache[module_id]) then
		return module_icon_cache[module_id]
	else
		local module_data = GAS.Logging.IndexedModules[module_id]
		if (module_data.Icon ~= nil) then
			local mat = Material(module_data.Icon)
			module_icon_cache[module_id] = mat
			return mat
		else
			return module_noicon
		end
	end
end

GAS_Logging_PvPEventReports = {}

local PANEL = {}

function PANEL:DoClick()
	local this = self

	GAS:PlaySound("popup")
	if (IsValid(GAS_Logging_PvPEventReports[self.data[GAS.Logging.PvP_EVENT_ID]])) then
		GAS_Logging_PvPEventReports[self.data[GAS.Logging.PvP_EVENT_ID]]:MakePopup()
		GAS_Logging_PvPEventReports[self.data[GAS.Logging.PvP_EVENT_ID]]:Center()
	else
		local total_time = this.data[GAS.Logging.PvP_LAST_UPDATED] - this.data[GAS.Logging.PvP_PRECISE_CREATION_TIME]

		local pvp_event_report = vgui.Create("bVGUI.Frame")
		pvp_event_report.data = self.data

		GAS_Logging_PvPEventReports[self.data[GAS.Logging.PvP_EVENT_ID]] = pvp_event_report

		pvp_event_report:SetSize(800,500)
		pvp_event_report:SetMinimumSize(pvp_event_report:GetSize())
		pvp_event_report:SetTitle(L"pvp_event_report")
		pvp_event_report:MakePopup()
		pvp_event_report:Center()
		function pvp_event_report:OnClose()
			GAS.Logging.Scenes:ClearScene(pvp_event_report.data[GAS.Logging.PvP_COMBAT_SCENE])
			if (IsValid(this) and this.DeleteMeOnClose) then
				this:Remove()
			end
		end

		local info_container = vgui.Create("bVGUI.BlankPanel", pvp_event_report)
		info_container:Dock(FILL)

		local scene_container = vgui.Create("bVGUI.BlankPanel", pvp_event_report)
		scene_container:Dock(LEFT)
		scene_container:SetWide(200)

			local scene_beginning = vgui.Create("bVGUI.RenderScene", scene_container)
			scene_beginning:SetLabel(L"event_start")
			function scene_beginning:OnStartRender()
				GAS.Logging.Scenes:ViewScene(pvp_event_report.data[GAS.Logging.PvP_COMBAT_SCENE], true, function(pos, ang)
					if (not IsValid(self)) then return end
					if (self.SetDefaultPositioning) then return end
					self.SetDefaultPositioning = true
					self:SetOrigin(pos)
					self:SetAngle(ang)
				end)
			end
			function scene_beginning:OnEndRender()
				GAS.Logging.Scenes:ClearScene(pvp_event_report.data[GAS.Logging.PvP_COMBAT_SCENE], true)
			end

			local scene_end = vgui.Create("bVGUI.RenderScene", scene_container)
			scene_end:SetCanRender(not self.data[GAS.Logging.PvP_ONGOING])
			scene_end:SetLabel(L"event_end")
			function scene_end:OnStartRender()
				GAS.Logging.Scenes:ViewScene(pvp_event_report.data[GAS.Logging.PvP_COMBAT_SCENE], false, function(pos, ang)
					if (not IsValid(self)) then return end
					if (self.SetDefaultPositioning) then return end
					self.SetDefaultPositioning = true
					self:SetOrigin(pos)
					self:SetAngle(ang)
				end)
			end
			function scene_end:OnEndRender()
				GAS.Logging.Scenes:ClearScene(pvp_event_report.data[GAS.Logging.PvP_COMBAT_SCENE], false)
			end

			function scene_container:PerformLayout(w,_h)
				local h = _h + 5
				scene_beginning:SetSize(w,h/2)
				scene_end:SetSize(w,h/2)
				scene_end:AlignTop((h/2)-5)
			end

		local timeline = vgui.Create("bVGUI.BlankPanel", info_container)
		timeline:SetMouseInputEnabled(true)
		timeline:Dock(TOP)
		timeline:SetTall(70)
		timeline.Scale = math.max(1, total_time * 1.25)
		timeline.BlipOffset = 0
		timeline.DmgEventBlips = {}
		function timeline:OnMouseWheeled(delta)
			local scale_change = timeline.Scale
			if (delta == 1) then
				timeline.Scale = timeline.Scale * 2
			elseif (delta == -1) then
				timeline.Scale = timeline.Scale / 2
			end
			local max_scale = math.max(4, total_time * 1.25)

			timeline.Scale = math.Clamp(timeline.Scale, 0.25, max_scale)

			local x,y = timeline:ScreenToLocal(gui.MousePos())
			if (timeline.Scale >= max_scale) then
				timeline.BlipOffset = 0
			end

			timeline:RefreshBlips()
			timeline:RefreshDelayMarkup()
		end

		local blip_size = 7.5
		function timeline:RefreshBlips()
			local w,h = self:GetSize()

			local y_offset = 14 + 10

			timeline.DmgEventBlips = {}
			for i,log in ipairs(pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS]) do
				if (type(log[1]) == "table") then continue end

				local place = (log[1] / total_time) * (w * (total_time / timeline.Scale)) - timeline.BlipOffset

				local blip = {
					{x = place, y = y_offset},
					{x = place + blip_size, y = blip_size + y_offset},
					{x = place, y = (blip_size * 2) + y_offset},
					{x = place - blip_size, y = blip_size + y_offset},
				}
				if (log[3] == pvp_event_report.data[GAS.Logging.PvP_VICTIM] and log[4] == pvp_event_report.data[GAS.Logging.PvP_INSTIGATOR]) then
					timeline.DmgEventBlips[i] = {true, blip}
				elseif (log[3] == pvp_event_report.data[GAS.Logging.PvP_INSTIGATOR] and log[4] == pvp_event_report.data[GAS.Logging.PvP_VICTIM]) then
					timeline.DmgEventBlips[i] = {false, blip}
				else
					timeline.DmgEventBlips[i] = {nil, blip}
				end
			end
		end
		timeline:RefreshBlips()

		function timeline:RefreshDelayMarkup()
			local x,y = self:ScreenToLocal(gui.MousePos())
			local w,h = self:GetSize()
			if (x >= 0) then
				self.DelayMarkup = markup.Parse("<font=gas_logging_damagelog_delay>+" .. math.Round((x / (w * (total_time / self.Scale))) * total_time, 2) .. "s</font>")
			else
				self.DelayMarkup = markup.Parse("<font=gas_logging_damagelog_delay>+0s</font>")
			end
		end

		function timeline:PerformLayout()
			timeline:RefreshBlips()
		end

		local pvp_event = vgui.Create("GAS.Logging.DamageLog", info_container)
		pvp_event:Dock(TOP)
		pvp_event:Setup(self.data, false)

		local tabs = vgui.Create("bVGUI.Tabs", info_container)
		tabs:Dock(TOP)
		tabs:SetTall(40)

		local logs_tab_content, logs_tab = tabs:AddTab(L"logs", Color(216,76,76))
			
			local log_tbl = vgui.Create("bVGUI.Table", logs_tab_content)
			log_tbl:Dock(FILL)
			log_tbl:AddColumn(L"log", bVGUI.TABLE_COLUMN_GROW)
			log_tbl:AddColumn(L"instigator_abbr", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
			log_tbl:AddColumn(L"victim_abbr", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
			log_tbl:AddColumn(L"time", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
			for i,log in ipairs(this.data[GAS.Logging.PvP_EVENT_LOGS]) do
				if (type(log[1]) == "table") then
					local row = log_tbl:AddRow(GAS.Logging:FormatMarkupLog(log, nil, nil, this.data[GAS.Logging.PvP_VICTIM], this.data[GAS.Logging.PvP_INSTIGATOR]), "-", "-", "+" .. math.Round(this.data[GAS.Logging.PvP_EVENT_LOGS_CHRONOLOGY][i], 2) .. "s")
					local icon = GetModuleIcon(log[2])
					row:SetMaterial(icon)
				else
					local instigator_dmg = "-"
					local victim_dmg = "-"
					if (log[3] == this.data[GAS.Logging.PvP_VICTIM]) then
						victim_dmg = "<color=0,255,0>" .. math.Round(log[6], 2) .. "</color>"
					elseif (log[3] == this.data[GAS.Logging.PvP_INSTIGATOR]) then
						instigator_dmg = "<color=255,0,0>" .. math.Round(log[6], 2) .. "</color>"
					end
					log_tbl:AddRow(GAS.Logging:FormatMarkupLogCustom(GAS:Phrase(log[2], "logging", "Logs"), log[5], nil, nil, this.data[GAS.Logging.PvP_VICTIM], this.data[GAS.Logging.PvP_INSTIGATOR]), instigator_dmg, victim_dmg, "+" .. math.Round(log[1], 2) .. "s")
				end
			end

		local weapons_tab_content, weapons_tab = tabs:AddTab(L"weapons", Color(76,76,216))

			local weapons_grid = vgui.Create("bVGUI.Grid", weapons_tab_content)
			weapons_grid:Dock(FILL)
			weapons_grid:SetPadding(10,10)

			local merged_weps = {}
			for weapon_class, dmg in pairs(pvp_event_report.data[GAS.Logging.PvP_INSTIGATOR_WEPS]) do
				merged_weps[weapon_class] = merged_weps[weapon_class] or {0,0}
				merged_weps[weapon_class][1] = merged_weps[weapon_class][1] + dmg
			end
			for weapon_class, dmg in pairs(pvp_event_report.data[GAS.Logging.PvP_VICTIM_WEPS]) do
				merged_weps[weapon_class] = merged_weps[weapon_class] or {0,0}
				merged_weps[weapon_class][2] = merged_weps[weapon_class][2] + dmg
			end

			for weapon_class, dmgs in pairs(merged_weps) do
				local ent_display = vgui.Create("GAS.Logging.EntityDisplay", weapons_grid)
				ent_display:SetWeapon(weapon_class)
				ent_display:SetDrawOnTop(false)
				ent_display.Think = nil
				weapons_grid:AddToGrid(ent_display)
			end

		local linked_events_tab_content, linked_events_tab = tabs:AddTab(L"linked_events", Color(216,76,76))



		local log_tbl_highlights = {}
		local timeline_hover_last_prev_frame
		local timeline_hover_exact_prev_frame
		function timeline:Paint(w,h)
			local x,y = self:ScreenToLocal(gui.MousePos())
			local target_time_point = (x / (w * (total_time / self.Scale))) * total_time
			local target_time_point_rnd = math.Round(target_time_point, 2)

			if (x ~= self.StoreX) then
				self.StoreX = x
				timeline:RefreshDelayMarkup()
			end

			surface.SetDrawColor(26,26,26)
			surface.DrawRect(0,0,w,h)

			surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT_LARGE)
			surface.DrawTexturedRect(0,0,w,h)

			surface.SetDrawColor(50, 50, 50)
			local spacing = w / self.Scale
			for i=1,self.Scale do
				surface.DrawLine((i - 1) * spacing,0,(i - 1) * spacing,h)
			end
			if (self.Scale < 5) then
				local spacing = w / math.floor(self.Scale / .25)
				for i=1,math.floor(self.Scale / .25) do
					if ((i - 1) % 4 == 0) then continue end
					if ((i - 1) % 2 == 0) then
						surface.SetDrawColor(37, 37, 37)
					else
						surface.SetDrawColor(30, 30, 30)
					end
					surface.DrawLine((i - 1) * spacing,0,(i - 1) * spacing,h)
				end
			end

			surface.SetDrawColor(181,39,39)
			surface.DrawRect(0,0,w,14)

			surface.SetDrawColor(181,39,39)
			surface.DrawRect(0,0,w * (total_time / self.Scale),14)

			if (self.DelayMarkupW ~= nil and x >= 0 and x <= w) then
				surface.SetDrawColor(0,0,0,200)
				surface.DrawRect(x - ((self.DelayMarkupW + 15) / 2),0,self.DelayMarkupW + 15,14)
			end

			local timeline_hover_exact
			local timeline_hover_last = target_time_point > total_time
			if (timeline_hover_last) then
				for k,v in pairs(log_tbl_highlights) do
					if (k ~= #pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS]) then
						log_tbl_highlights = {}
						break
					end
				end
				log_tbl_highlights[#pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS]] = true
			elseif (timeline_hover_last_prev_frame ~= timeline_hover_last) then
				log_tbl_highlights[#pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS]] = nil
			end
			timeline_hover_last_prev_frame = timeline_hover_last

			for i,log in ipairs(pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS]) do
				local time_point
				if (type(log[1]) == "table") then
					-- event log
					time_point = pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS_CHRONOLOGY][i]

					local icon = GetModuleIcon(log[2])
					surface.SetDrawColor(255,255,255)
					surface.SetMaterial(icon)
					surface.DrawTexturedRect((time_point / total_time) * (w * (total_time / self.Scale)) - (16 / 2) - timeline.BlipOffset, h - 16 - 10, 16, 16)
				else
					-- damage log
					local poly = timeline.DmgEventBlips[i]
					draw.NoTexture()
					if (poly[1] == true) then
						surface.SetDrawColor(215,50,50,200)
					elseif (poly[1] == false) then
						surface.SetDrawColor(50,215,50,200)
					else
						surface.SetDrawColor(50,50,215,200)
					end
					surface.DrawPoly(poly[2])

					time_point = log[1]
				end

				if (not timeline_hover_last) then
					local time_point_rnd = math.Round(time_point, 2)
					if (timeline_hover_exact ~= nil) then
						log_tbl_highlights[i] = (time_point_rnd == timeline_hover_exact) or nil
					elseif (time_point_rnd == target_time_point_rnd) then
						timeline_hover_exact = target_time_point_rnd
						log_tbl_highlights[i] = true
					else
						if (i ~= 1 and target_time_point < time_point) then
							local prev = pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS][i - 1]
							local prev_time_point = prev[1]
							if (type(prev[1]) == "table") then
								prev_time_point = pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS_CHRONOLOGY][i - 1]
							end
							if (target_time_point > prev_time_point) then
								local median = (prev_time_point + time_point) / 2
								if (target_time_point > median) then
									log_tbl_highlights[i] = true
									log_tbl_highlights[i - 1] = nil
								else
									log_tbl_highlights[i] = nil
									log_tbl_highlights[i - 1] = true
								end
							else
								log_tbl_highlights[i] = nil
							end
						elseif (i ~= #pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS] and target_time_point > time_point) then
							local next = pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS][i + 1]
							local next_time_point = next[1]
							if (type(next[1]) == "table") then
								next_time_point = pvp_event_report.data[GAS.Logging.PvP_EVENT_LOGS_CHRONOLOGY][i + 1]
							end
							if (target_time_point < next_time_point) then
								local median = (next_time_point + time_point) / 2
								if (target_time_point > median) then
									log_tbl_highlights[i] = nil
									log_tbl_highlights[i + 1] = true
								else
									log_tbl_highlights[i] = true
									log_tbl_highlights[i + 1] = nil
								end
							else
								log_tbl_highlights[i] = nil
							end
						end
					end
				end
			end

			if (x >= 0 and x <= w) then
				surface.SetDrawColor(100,100,100)
				surface.DrawLine(x,14,x,h)

				if (self.DelayMarkup) then
					self.DelayMarkup:Draw(x, 7, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					self.DelayMarkupW = self.DelayMarkup:GetWidth()
				end
			elseif (next(log_tbl_highlights) ~= nil) then
				log_tbl_highlights = {}
			end

			for i,row in ipairs(log_tbl.Rows) do
				row.Highlight = log_tbl_highlights[i] == true
				if (row.Highlight and pvp_event_report:HasFocus() and (not IsValid(vgui.GetHoveredPanel()) or not log_tbl:IsOurChild(vgui.GetHoveredPanel()))) then
					if (self.ScrollToChild_Prev ~= row) then
						self.ScrollToChild_Prev = row
						log_tbl.RowContainer:ScrollToChild(row)
					end
				end
			end
		end

		pvp_event_report:EnableUserResize()
	end
end
function PANEL:OnMousePressed(m)
	self._pressed = m
end
function PANEL:OnMouseReleased(m)
	if (self._pressed == m) then
		if (m == MOUSE_LEFT and self.DoClick) then
			self:DoClick()
		end
		self._pressed = nil
	end
end

function PANEL:Init()
	self:SetMouseInputEnabled(true)

	self:SetTall(95)

	self.InstigatorAvatar = vgui.Create("AvatarImage", self)
	self.InstigatorAvatar:SetSize(48,48)
	self.InstigatorAvatar:SetCursor("hand")
	self.InstigatorAvatar:SetMouseInputEnabled(true)
	function self.InstigatorAvatar:OnMouseReleased(m) if m ~= MOUSE_LEFT then return else bVGUI.PlayerTooltip.Focus() end end

	self.InstigatorDead = vgui.Create("DLabel", self)
	self.InstigatorDead:SetTextColor(Color(255,0,0))
	self.InstigatorDead:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.InstigatorDead:SetContentAlignment(4)
	self.InstigatorDead:SetText("")
	self.InstigatorDead:SetWide(0)

	self.InstigatorTag = vgui.Create("DLabel", self)
	self.InstigatorTag:SetTextColor(Color(255,0,0))
	self.InstigatorTag:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.InstigatorTag:SetText("[" .. string.upper(L"instigator") .. "]")
	self.InstigatorTag:SetContentAlignment(4)
	self.InstigatorTag:SizeToContents()
	bVGUI.AttachTooltip(self.InstigatorTag, {
		Text = L"instigator_tag_tip",
	})

	self.InstigatorName = vgui.Create("DLabel", self)
	self.InstigatorName:SetTextColor(bVGUI.COLOR_WHITE)
	self.InstigatorName:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.InstigatorName:SetText("")
	self.InstigatorName:SetContentAlignment(4)
	self.InstigatorName:SetCursor("hand")
	self.InstigatorName:SetMouseInputEnabled(true)
	function self.InstigatorName:DoClick() bVGUI.PlayerTooltip.Focus() end

	self.InstigatorPrimaryWep = vgui.Create("DLabel", self)
	self.InstigatorPrimaryWep:SetTextColor(GAS.Logging.LogFormattingSettings.Colors.Weapon)
	self.InstigatorPrimaryWep:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.InstigatorPrimaryWep:SetText("")
	self.InstigatorPrimaryWep:SetContentAlignment(4)
	self.InstigatorPrimaryWep:SetMouseInputEnabled(true)

	self.VictimAvatar = vgui.Create("AvatarImage", self)
	self.VictimAvatar:SetSize(48,48)
	self.VictimAvatar:SetCursor("hand")
	self.VictimAvatar:SetMouseInputEnabled(true)
	function self.VictimAvatar:OnMouseReleased(m) if m ~= MOUSE_LEFT then return else bVGUI.PlayerTooltip.Focus() end end

	self.VictimDead = vgui.Create("DLabel", self)
	self.VictimDead:SetTextColor(Color(255,0,0))
	self.VictimDead:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.VictimDead:SetContentAlignment(4)
	self.VictimDead:SetText("")
	self.VictimDead:SetWide(0)

	self.VictimTag = vgui.Create("DLabel", self)
	self.VictimTag:SetTextColor(Color(0,255,0))
	self.VictimTag:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.VictimTag:SetText("[" .. string.upper(L"victim") .. "]")
	self.VictimTag:SetContentAlignment(6)
	self.VictimTag:SizeToContents()
	bVGUI.AttachTooltip(self.VictimTag, {
		Text = L"victim_tag_tip",
	})

	self.VictimName = vgui.Create("DLabel", self)
	self.VictimName:SetTextColor(bVGUI.COLOR_WHITE)
	self.VictimName:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.VictimName:SetText("")
	self.VictimName:SetContentAlignment(6)
	self.VictimName:SetCursor("hand")
	self.VictimName:SetMouseInputEnabled(true)
	function self.VictimName:DoClick() bVGUI.PlayerTooltip.Focus() end

	self.VictimPrimaryWep = vgui.Create("DLabel", self)
	self.VictimPrimaryWep:SetTextColor(GAS.Logging.LogFormattingSettings.Colors.Weapon)
	self.VictimPrimaryWep:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.VictimPrimaryWep:SetText("")
	self.VictimPrimaryWep:SetContentAlignment(6)
	self.VictimPrimaryWep:SetMouseInputEnabled(true)

	self.FlagMetadata = {
		{GAS.Logging.PvP_FLAG_ONGOING, L"flag_ongoing", "icon16/lightbulb.png"},
		{GAS.Logging.PvP_FLAG_FINISHED, L"flag_finished", "icon16/lightbulb_off.png"},
		{GAS.Logging.PvP_FLAG_SUPERADMIN, L"flag_superadmin", "icon16/shield_add.png"},
		{GAS.Logging.PvP_FLAG_ADMIN, L"flag_admin", "icon16/shield.png"},
		{GAS.Logging.PvP_FLAG_FRIENDLYFIRE, L"flag_friendly_fire", "icon16/emoticon_unhappy.png"},
		{GAS.Logging.PvP_FLAG_LAWENFORCEMENT, L"flag_law_enforcement", "icon16/bell.png"},
		{GAS.Logging.PvP_FLAG_INSTIGATOR_DEATH, L"flag_instigator_death", "icon16/status_busy.png"},
		{GAS.Logging.PvP_FLAG_VICTIM_DEATH, L"flag_victim_death", "icon16/status_offline.png"},
		{GAS.Logging.PvP_FLAG_VEHICLE, L"flag_vehicle", "icon16/car.png"},
		{GAS.Logging.PvP_FLAG_WORLD, L"flag_world", "icon16/world.png"},
		{GAS.Logging.PvP_FLAG_PROPS, L"flag_props", "icon16/bricks.png"},
		{GAS.Logging.PvP_FLAG_TEAM_SWITCHED, L"flag_team_switched", "icon16/arrow_refresh.png"},
		{GAS.Logging.PvP_FLAG_DISCONNECT, L"flag_disconnect", "icon16/disconnect.png"},
		{GAS.Logging.PvP_FLAG_LINKED, L"flag_linked", "icon16/link.png"},
	}

	self.LogTypeMetadata = {
		[GAS.Logging.PvP_LOG_TYPE_CHAT] = {L"log_type_chat", "icon16/user_comment.png"},
		[GAS.Logging.PvP_LOG_TYPE_CHAT_TEAM] = {L"log_type_team_chat", "icon16/group.png"},
		[GAS.Logging.PvP_LOG_TYPE_WEAPON_PICKUP] = {L"log_type_weapon_pickup", "icon16/bomb.png"},
		[GAS.Logging.PvP_LOG_TYPE_WEAPON_DROPPED] = {L"log_type_weapon_drop", "icon16/arrow_down.png"},
		[GAS.Logging.PvP_LOG_TYPE_ITEM_PICKUP] = {L"log_type_item_pickup", "icon16/coins.png"},
		[GAS.Logging.PvP_LOG_TYPE_SPAWNMENU] = {L"log_type_spawnmenu", "icon16/bricks.png"},
		[GAS.Logging.PvP_LOG_TYPE_DARKRP_PURCHASE] = {L"log_type_darkrp_purchase", "icon16/money_add.png"},
		[GAS.Logging.PvP_LOG_TYPE_DISCONNECT] = {L"log_type_disconnect", "icon16/disconnect.png"},
		[GAS.Logging.PvP_LOG_TYPE_WEAPON_SWITCHED] = {L"log_type_weapon_switched", "icon16/arrow_switch.png"},
		[GAS.Logging.PvP_LOG_TYPE_TEAM_SWITCH] = {L"log_type_team_switched", "icon16/arrow_refresh.png"},
		[GAS.Logging.PVP_LOG_TYPE_SILENT_DEATH] = {L"log_type_silent_death", "icon16/status_offline.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH_WORLD] = {L"log_type_death_world", "icon16/world.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH_PLAYER_WEP] = {L"log_type_death_player_wep", "icon16/wand.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH_PLAYER] = {L"log_type_death_player", "icon16/status_offline.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH_ENT] = {L"log_type_death_ent", "icon16/status_offline.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH] = {L"log_type_death", "icon16/status_offline.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH_PROPKILL_SELF] = {L"log_type_propkill_self", "icon16/box.png"},
		[GAS.Logging.PvP_LOG_TYPE_DEATH_PROPKILL] = {L"log_type_propkill", "icon16/brick_go.png"},
	}

	self.FlagContainer = vgui.Create("bVGUI.BlankPanel", self)
	self.FlagContainer:Dock(RIGHT)
	self.FlagContainer:DockMargin(0,10,10 + 6,10 + 14)
	self.FlagContainer:SetWide(16)
	function self.FlagContainer:PerformLayout(w)
		self.Content:SetWide(w)
		self.Content:AlignRight(0)
		self.Content:CenterVertical()
	end

	self.FlagContainer.Content = vgui.Create("bVGUI.BlankPanel", self.FlagContainer)
	self.FlagContainer.Content:SetTall((3 * (16 + 5)) - 5)

	self.Timestamp = vgui.Create("DLabel", self)
	self.Timestamp:SetTextColor(bVGUI.COLOR_WHITE)
	self.Timestamp:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.Timestamp:SetText("")
	self.Timestamp:SetContentAlignment(4)
	self.Timestamp:SetMouseInputEnabled(true)
end

function PANEL:Setup(data, allow_click)
	if (allow_click == false) then
		self.DoClick = nil
	else
		self:SetCursor("hand")
	end

	self.data = data

	if (self.data[GAS.Logging.PvP_FLAGS][GAS.Logging.PvP_FLAG_INSTIGATOR_DEATH]) then
		self.InstigatorDead:SetText(L"dead_tag")
		self.InstigatorDead:SizeToContents()
	end
	if (self.data[GAS.Logging.PvP_FLAGS][GAS.Logging.PvP_FLAG_VICTIM_DEATH]) then
		self.VictimDead:SetText(L"dead_tag")
		self.VictimDead:SizeToContents()
	end

	self.Timestamp:SetText(GAS:SimplifyTimestamp(self.data[GAS.Logging.PvP_CREATION_TIMESTAMP]))
	self.Timestamp:SizeToContents()
	bVGUI.AttachTooltip(self.Timestamp, {
		Text = GAS:FormatFullTimestamp(self.data[GAS.Logging.PvP_CREATION_TIMESTAMP])
	})

	self.InstigatorAvatar:SetSteamID(GAS:AccountIDToSteamID64(data[GAS.Logging.PvP_INSTIGATOR]), 48)
	self.VictimAvatar:SetSteamID(GAS:AccountIDToSteamID64(data[GAS.Logging.PvP_VICTIM]), 48)

	local instigator = player.GetByAccountID(data[GAS.Logging.PvP_INSTIGATOR])
	if (IsValid(instigator)) then
		self.InstigatorName:SetText(instigator:Nick())
	else
		self.InstigatorName:SetText(data[GAS.Logging.PvP_INSTIGATOR_NICK])
	end
	self.InstigatorName:SizeToContents()

	bVGUI.PlayerTooltip.Attach(self.InstigatorAvatar, {
		account_id = data[GAS.Logging.PvP_INSTIGATOR],
		focustip = L"click_to_focus",
	})

	bVGUI.PlayerTooltip.Attach(self.InstigatorName, {
		account_id = data[GAS.Logging.PvP_INSTIGATOR],
		focustip = L"click_to_focus",
	})

	local instigator_primary_wep = table.GetWinningKey(data[GAS.Logging.PvP_INSTIGATOR_WEPS])
	if (instigator_primary_wep ~= nil) then
		self.InstigatorPrimaryWep:SetText(instigator_primary_wep)
		self.InstigatorPrimaryWep:SizeToContents()

		GAS_Logging_DisplayEntity(function(pnl)
			pnl:SetWeapon(instigator_primary_wep)
		end, self.InstigatorPrimaryWep, true)
	end

	local victim = player.GetByAccountID(data[GAS.Logging.PvP_VICTIM])
	if (IsValid(victim)) then
		self.VictimName:SetText(victim:Nick())
	else
		self.VictimName:SetText(data[GAS.Logging.PvP_VICTIM_NICK])
	end
	self.VictimName:SizeToContents()

	bVGUI.PlayerTooltip.Attach(self.VictimAvatar, {
		account_id = data[GAS.Logging.PvP_VICTIM],
		focustip = L"click_to_focus",
	})

	bVGUI.PlayerTooltip.Attach(self.VictimName, {
		account_id = data[GAS.Logging.PvP_VICTIM],
		focustip = L"click_to_focus",
	})

	local victim_primary_wep = table.GetWinningKey(data[GAS.Logging.PvP_VICTIM_WEPS])
	if (victim_primary_wep ~= nil) then
		self.VictimPrimaryWep:SetText(victim_primary_wep)
		self.VictimPrimaryWep:SizeToContents()

		GAS_Logging_DisplayEntity(function(pnl)
			pnl:SetWeapon(victim_primary_wep)
		end, self.VictimPrimaryWep, true)
	end

	local column = 1
	local count = 0
	for i,v in ipairs(self.FlagMetadata) do
		if (data[GAS.Logging.PvP_FLAGS][v[1]] == true) then
			count = count + 1
			if (count % 3 == 0) then
				column = column + 1
			end
		end
	end
	if (count % 3 == 0) then column = column - 1 end
	self.FlagContainer:SetWide((column * (16 + 5)) - 5)
	if (column == 1) then
		self.FlagContainer.Content:SetTall((count * (16 + 5)) - 5)
	else
		self.FlagContainer.Content:SetTall((3 * (16 + 5)) - 5)
	end
	self.FlagContainer.Content:SetWide((column * (16 + 5)) - 5)
	self.FlagContainer.Content:AlignRight(0)
	self.FlagContainer.Content:CenterVertical()

	local column = 1
	local count = 0
	for i,v in ipairs(self.FlagMetadata) do
		if (data[GAS.Logging.PvP_FLAGS][v[1]] == true) then
			local flag_icon = vgui.Create("DImage", self.FlagContainer.Content)
			flag_icon:SetSize(16,16)
			flag_icon:AlignTop((count % 3) * (16 + 5))
			flag_icon:AlignRight((column - 1) * (16 + 5))
			flag_icon:SetImage(v[3])
			bVGUI.AttachTooltip(flag_icon, {
				Text = v[2]
			})
			count = count + 1
			if (count % 3 == 0) then
				column = column + 1
			end
		end
	end

	self:InvalidateLayout(true)
end

function PANEL:PerformLayout(w,h)
	self.InstigatorAvatar:AlignLeft(10)
	self.InstigatorAvatar:AlignBottom(10 + 14)

	self.VictimAvatar:AlignRight(10 + self.FlagContainer:GetWide() + 10 + 6)
	self.VictimAvatar:AlignBottom(10 + 14)

	self.InstigatorDead:AlignTop(5)
	self.InstigatorDead:AlignLeft(10)

	local instigator_death_margin, victim_death_margin = 0,0
	if (self.InstigatorDead:GetWide() > 0) then
		instigator_death_margin = self.InstigatorDead:GetWide() + 5
	end
	if (self.VictimDead:GetWide() > 0) then
		victim_death_margin = self.VictimDead:GetWide() + 5
	end

	self.InstigatorTag:AlignTop(5)
	self.InstigatorTag:AlignLeft(10 + instigator_death_margin)

	self.InstigatorName:AlignTop(5)
	self.InstigatorName:AlignLeft(10 + instigator_death_margin + self.InstigatorTag:GetWide() + 5)

	self.InstigatorPrimaryWep:AlignTop(5)
	self.InstigatorPrimaryWep:AlignLeft(10 + instigator_death_margin + self.InstigatorTag:GetWide() + 5 + self.InstigatorName:GetWide() + 5)

	self.VictimDead:AlignTop(5)
	self.VictimDead:AlignRight(10 + self.FlagContainer:GetWide() + 10 + 6)

	self.VictimTag:AlignTop(5)
	self.VictimTag:AlignRight(10 + self.FlagContainer:GetWide() + 10 + victim_death_margin + 6)

	self.VictimName:AlignTop(5)
	self.VictimName:AlignRight(10 + self.FlagContainer:GetWide() + 10 + victim_death_margin + self.VictimTag:GetWide() + 5 + 6)

	self.VictimPrimaryWep:AlignTop(5)
	self.VictimPrimaryWep:AlignRight(10 + self.FlagContainer:GetWide() + 10 + self.VictimTag:GetWide() + 5 + self.VictimName:GetWide() + 5 + victim_death_margin + 6)

	self.Timestamp:AlignLeft(10)
	self.Timestamp:AlignBottom(5)

	self.vgui_InstigatorFrac = self.data[GAS.Logging.PvP_INSTIGATOR_DMG_GVN] / self.data[GAS.Logging.PvP_TOTAL_DMG]
	self.vgui_VictimFrac     = self.data[GAS.Logging.PvP_VICTIM_DMG_GVN] / self.data[GAS.Logging.PvP_TOTAL_DMG]
	self.vgui_OtherFrac      = (self.data[GAS.Logging.PvP_TOTAL_DMG] - self.data[GAS.Logging.PvP_INSTIGATOR_DMG_GVN] - self.data[GAS.Logging.PvP_VICTIM_DMG_GVN]) / self.data[GAS.Logging.PvP_TOTAL_DMG]
	if (self.data[GAS.Logging.PvP_TOTAL_DMG] == 0) then self.vgui_OtherFrac = 1 self.vgui_VictimFrac = 0 self.vgui_InstigatorFrac = 0 end

	self.vgui_InstigatorWidth = (w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10 - 10 - 48 - 10) * self.vgui_InstigatorFrac
	self.vgui_VictimWidth     = (w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10 - 10 - 48 - 10) * self.vgui_VictimFrac
	self.vgui_OtherWidth      = (w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10 - 10 - 48 - 10) * self.vgui_OtherFrac
end

function PANEL:OnCursorMoved(x,y)
	local w,h = self:GetSize()
	if (y >= (h - 10 - 48) and y <= h - 10 and x >= 10 + 48 + 10 and x <= w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10) then
		local relative_x = x - 10 - 48 - 10
		local DmgTooltip = self.DmgTooltip
		if (relative_x <= self.vgui_InstigatorWidth) then
			self.DmgTooltip = 1
		elseif (relative_x <= self.vgui_InstigatorWidth + self.vgui_OtherWidth) then
			self.DmgTooltip = 2
		else
			self.DmgTooltip = 3
		end
		if (DmgTooltip ~= self.DmgTooltip) then
			bVGUI.DestroyTooltip()
			local tt = {
				VGUI_Element = self,
			}
			if (self.DmgTooltip == 1) then
				tt.Text = math.Round(self.vgui_InstigatorFrac * 100, 2) .. L"DmgTooltip_Instigator"
				tt.TextColor = Color(216,76,76)
			elseif (self.DmgTooltip == 2) then
				tt.Text = math.Round(self.vgui_OtherFrac * 100, 2) .. L"DmgTooltip_Other"
				tt.TextColor = Color(74,126,214)
			else
				tt.Text = math.Round(self.vgui_VictimFrac * 100, 2) .. L"DmgTooltip_Victim"
				tt.TextColor = Color(76,216,76)
			end
			bVGUI.CreateTooltip(tt)
		end
	else
		self.DmgTooltip = nil
		bVGUI.DestroyTooltip()
	end
end

local stripes = Material("gmodadminsuite/stripes4.png")
function PANEL:Paint(w,h)
	if (self.RowIndex ~= nil and self.RowIndex % 2 ~= 0) then
		surface.SetDrawColor(255,255,255,75)
	else
		surface.SetDrawColor(255,255,255,200)
	end
	surface.SetMaterial(stripes)
	surface.DrawTexturedRect(0,0,w,h)

	surface.SetDrawColor(198,19,19)
	surface.DrawRect(48 + 10 + 10, h - 10 - 48 - 14, self.vgui_InstigatorWidth, 48)

	surface.SetDrawColor(19,198,19)
	surface.DrawRect(w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10 - self.vgui_VictimWidth, h - 10 - 48 - 14, self.vgui_VictimWidth, 48)

	surface.SetDrawColor(32,32,173)
	surface.DrawRect(48 + 10 + 10 + self.vgui_InstigatorWidth, h - 10 - 48 - 14, self.vgui_OtherWidth, 48)

	surface.SetDrawColor(255,255,255,255)
	surface.SetMaterial(bVGUI.MATERIAL_GRADIENT)
	surface.DrawTexturedRect(10 + 48 + 10,h - 10 - 48 - 14,w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10 - 48 - 10 - 10,48)

	if (self.vgui_InstigatorWidth >= 50) then
		draw.SimpleText(math.Round(self.vgui_InstigatorFrac * 100) .. "%", "gas_logging_damagelog_pct", 10 + 48 + 10 + (self.vgui_InstigatorWidth / 2), h - 10 - (48 / 2) - 14, bVGUI.COLOR_WHITE,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	if (self.vgui_VictimWidth >= 50) then
		draw.SimpleText(math.Round(self.vgui_VictimFrac * 100) .. "%", "gas_logging_damagelog_pct", w - 6 - 10 - self.FlagContainer:GetWide() - 10 - 48 - 10 - (self.vgui_VictimWidth / 2), h - 10 - (48 / 2) - 14, bVGUI.COLOR_WHITE,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	if (self.vgui_OtherWidth >= 50) then
		draw.SimpleText(math.Round(self.vgui_OtherFrac * 100) .. "%", "gas_logging_damagelog_pct", 10 + 48 + 10 + self.vgui_InstigatorWidth + (self.vgui_OtherWidth / 2), h - 10 - (48 / 2) - 14, bVGUI.COLOR_WHITE,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
end

derma.DefineControl("GAS.Logging.DamageLog", nil, PANEL, "bVGUI.BlankPanel")
--PATH addons/gmodadminsuite-logging-2.4.8/lua/vgui/gas_logging_entity_display.lua:
GAS_Logging_EntityDisplay_Networking = {}
GAS_Logging_EntityDisplay_Cache = {}

if (IsValid(GAS_Logging_EntityDisplay)) then
	GAS_Logging_EntityDisplay:Close()
end

local PANEL = {}

function PANEL:InfoInit()
	self.Shruggie = vgui.Create("DLabel", self)
	self.Shruggie:SetText("¯\\_(ツ)_/¯")
	self.Shruggie:SetFont("DermaLarge")
	self.Shruggie:SetTextColor(bVGUI.COLOR_WHITE)
	self.Shruggie:SizeToContents()
	self.Shruggie:SetVisible(false)

	self.LoadingPanel = vgui.Create("bVGUI.LoadingPanel", self)
	self.LoadingPanel:Dock(FILL)
	self.LoadingPanel:SetLoading(true)

	self.ModelPanel = vgui.Create("DModelPanel", self.LoadingPanel)
	self.ModelPanel:Dock(FILL)

	self.InfoContainer = vgui.Create("bVGUI.BlankPanel", self)

	self.LabelContainer = vgui.Create("bVGUI.BlankPanel", self.InfoContainer)
	self.LabelContainer:Dock(FILL)

	self.SpawnCategory = vgui.Create("DLabel", self.LabelContainer)
	self.SpawnCategory:Dock(BOTTOM)
	self.SpawnCategory:SetContentAlignment(3)
	self.SpawnCategory:SetTextColor(Color(160,160,160))
	self.SpawnCategory:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.SpawnCategory:SetText("")
	self.SpawnCategory:SetVisible(false)

	self.PrintName = vgui.Create("DLabel", self.LabelContainer)
	self.PrintName:SetText("")
	self.PrintName:SetTextColor(bVGUI.COLOR_WHITE)
	self.PrintName:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 16))
	self.PrintName:Dock(FILL)
	self.PrintName:SetContentAlignment(3)

	self.SpawnIcon = vgui.Create("DImage", self.InfoContainer)
	self.SpawnIcon:Dock(LEFT)
	self.SpawnIcon:DockMargin(0,0,10,0)
	self.SpawnIcon:SetSize(64,64)
	self.SpawnIcon:SetVisible(false)

	self.OldPerformLayout = self.PerformLayout
	function self:PerformLayout(w,h)
		self:OldPerformLayout(w,h)

		self.InfoContainer:SetSize(w - 20, 64)
		self.InfoContainer:AlignBottom(10)
		self.InfoContainer:AlignLeft(10)

		self.Shruggie:Center()
	end
end

function PANEL:FixCamera(scale)
	if (IsValid(self.ModelPanel.Entity)) then
		local PrevMins, PrevMaxs = self.ModelPanel.Entity:GetRenderBounds()
		self.ModelPanel:SetCamPos(PrevMins:Distance(PrevMaxs) * Vector(scale or 0.75, scale or 0.75,scale or 0.75))
		self.ModelPanel:SetLookAt((PrevMaxs + PrevMins) / 2)
	end
end

function PANEL:SetWeapon(weapon_class)
	self:SetTitle(weapon_class)

	local weapon_tbl = weapons.Get(weapon_class)
	if (weapon_tbl ~= nil and weapon_tbl.WorldModel ~= nil) then
		self.ModelPanel:SetModel(weapon_tbl.WorldModel)
		self:SetVisible(true)
		if (weapon_tbl.PrintName ~= nil and type(weapon_tbl.PrintName) == "string") then
			self.PrintName:SetText(weapon_tbl.PrintName)
		end
		if (weapon_tbl.Category ~= nil and type(weapon_tbl.Category)) then
			self.SpawnCategory:SetText(weapon_tbl.Category)
			self.SpawnCategory:SetVisible(true)
		end
	elseif (file.Exists("scripts/" .. weapon_class .. ".txt", "GAME")) then
		local weapon_script = file.Read("scripts/" .. weapon_class .. ".txt", "GAME")
		if (weapon_script) then
			local world_model = weapon_script:match('"playermodel"%s*"(.-)"')
			if (world_model ~= nil) then
				self.ModelPanel:SetModel(world_model)
				self:SetVisible(true)
			end
		end
		local weapon_info = list.Get("Weapon")[weapon_class]
		if (weapon_info) then
			if (weapon_info.PrintName ~= nil and type(weapon_info.PrintName) == "string") then
				self.PrintName:SetText(weapon_info.PrintName)
				self.PrintName:SizeToContents()
			end
			if (weapon_info.Category ~= nil and type(weapon_info.Category)) then
				self.SpawnCategory:SetText(weapon_info.Category)
				self.SpawnCategory:SetVisible(true)
			end
		end
	end

	if (file.Exists("materials/entities/" .. weapon_class .. ".png", "GAME")) then
		self.SpawnIcon:SetImage("entities/" .. weapon_class .. ".png")
		self.SpawnIcon:SetVisible(true)
	end

	self:FixCamera()
	self.LoadingPanel:SetLoading(false)
end

function PANEL:SetProp(model)
	self.ModelPanel:SetModel(model)
	self:SetTitle(model)
	self:SetVisible(true)

	self:FixCamera()
	self.LoadingPanel:SetLoading(false)
end

function PANEL:SetAmmo(ammo_type)
	local spawnmenu_item = list.Get("SpawnableEntities")[ammo_type]
	if (spawnmenu_item ~= nil and spawnmenu_item.PrintName ~= nil and type(spawnmenu_item) == "string") then
		self.PrintName:SetText(spawnmenu_item.PrintName)
	end
	if (file.Exists("materials/entities/" .. ammo_type .. ".png", "GAME")) then
		self.SpawnIcon:SetImage("entities/" .. ammo_type .. ".png")
		self.SpawnIcon:SetVisible(true)
	end

	self:SetVisible(true)

	if (GAS_Logging_EntityDisplay_Cache[ammo_type]) then
		self.ModelPanel:SetModel(GAS_Logging_EntityDisplay_Cache[ammo_type])
		self:SetVisible(true)
		self:FixCamera()
		self.LoadingPanel:SetLoading(false)
	else
		local net_msg_fire = GAS_Logging_EntityDisplay_Networking[ammo_type] == nil
		GAS_Logging_EntityDisplay_Networking[ammo_type] = GAS_Logging_EntityDisplay_Networking[ammo_type] or {}
		GAS_Logging_EntityDisplay_Networking[ammo_type][self] = true
		if (net_msg_fire) then
			GAS:netStart("logging:EntityDisplay:AmmoModel")
				net.WriteString(ammo_type)
			net.SendToServer()
		end
	end
end

function PANEL:SetVehicle(vehicle_class, mdl_str)
	self:SetTitle(vehicle_class)

	if (mdl_str ~= nil and not IsUselessModel(mdl_str)) then
		self.ModelPanel:SetModel(mdl_str)
		self:SetVisible(true)
		self:FixCamera()
		self.LoadingPanel:SetLoading(false)

		for _,spawnmenu_item in pairs(list.Get("Vehicles")) do
			if (spawnmenu_item.Class == vehicle_class and spawnmenu_item.Model == mdl_str) then
				if (spawnmenu_item.Name ~= nil and type(spawnmenu_item.Name) == "string") then
					self.PrintName:SetText(spawnmenu_item.Name)
					if (file.Exists("materials/entities/" .. spawnmenu_item.Name .. ".png", "GAME")) then
						self.SpawnIcon:SetImage("entities/" .. spawnmenu_item.Name .. ".png")
						self.SpawnIcon:SetVisible(true)
					end
				end
				return
			end
		end
		for _,spawnmenu_item in pairs(list.Get("Vehicles")) do
			if (spawnmenu_item.Model == mdl_str) then
				if (spawnmenu_item.Name ~= nil and type(spawnmenu_item.Name) == "string") then
					self.PrintName:SetText(spawnmenu_item.Name)
					if (file.Exists("materials/entities/" .. spawnmenu_item.Name .. ".png", "GAME")) then
						self.SpawnIcon:SetImage("entities/" .. spawnmenu_item.Name .. ".png")
						self.SpawnIcon:SetVisible(true)
					end
				end
				break
			end
		end
	else
		for _,spawnmenu_item in pairs(list.Get("Vehicles")) do
			if (spawnmenu_item.Class ~= vehicle_class) then continue end
			if (spawnmenu_item.Name ~= nil and type(spawnmenu_item.Name) == "string") then
				self.PrintName:SetText(spawnmenu_item.Name)
				if (file.Exists("materials/entities/" .. spawnmenu_item.Name .. ".png", "GAME")) then
					self.SpawnIcon:SetImage("entities/" .. spawnmenu_item.Name .. ".png")
					self.SpawnIcon:SetVisible(true)
				end
			end
			if (mdl_str == nil or IsUselessModel(mdl_str)) then
				if (spawnmenu_item.Model ~= nil and type(spawnmenu_item.Model) == "string") then
					self.ModelPanel:SetModel(spawnmenu_item.Model)
					self:SetVisible(true)
					self:FixCamera()
					self.LoadingPanel:SetLoading(false)
				end
			end
			break
		end
	end
end

function PANEL:SetEntity(class_name, mdl_str)
	if (class_name == "worldspawn") then return end

	self:SetTitle(class_name)

	local sent_tbl = scripted_ents.Get(class_name)
	if (sent_tbl ~= nil and sent_tbl.PrintName ~= nil and type(sent_tbl.PrintName) == "string") then
		self.PrintName:SetText(sent_tbl.PrintName)
	else
		local spawnmenu_item = list.Get("SpawnableEntities")[class_name]
		if (spawnmenu_item ~= nil and spawnmenu_item.PrintName ~= nil and type(spawnmenu_item.PrintName) == "string") then
			self.PrintName:SetText(spawnmenu_item.PrintName)
		end
	end
	if (file.Exists("materials/entities/" .. class_name .. ".png", "GAME")) then
		self.SpawnIcon:SetImage("entities/" .. class_name .. ".png")
		self.SpawnIcon:SetVisible(true)
	end

	if (mdl_str ~= nil and type(mdl_str) == "string") then
		if (not IsUselessModel(mdl_str)) then
			self.ModelPanel:SetModel(mdl_str)
			self:SetVisible(true)
			self:FixCamera()
			self.LoadingPanel:SetLoading(false)
		end
	elseif (GAS_Logging_EntityDisplay_Cache[class_name]) then
		self.ModelPanel:SetModel(GAS_Logging_EntityDisplay_Cache[class_name])
		self:SetVisible(true)
		self:FixCamera()
		self.LoadingPanel:SetLoading(false)
	else
		local found = false
		for _,ent in ipairs(ents.GetAll()) do
			if (not ent:IsWorld() and ent:GetClass() == class_name) then
				GAS_Logging_EntityDisplay_Cache[class_name] = ent:GetModel()
				self.ModelPanel:SetModel(ent:GetModel())
				self:SetVisible(true)
				self:FixCamera()
				self.LoadingPanel:SetLoading(false)
				found = true
				break
			end
		end
		if (not found) then
			local predefined_model = sent_tbl.model or sent_tbl.Model or sent_tbl.WorldModel
			if (predefined_model ~= nil and not IsUselessModel(predefined_model)) then
				GAS_Logging_EntityDisplay_Cache[class_name] = predefined_model
				self.ModelPanel:SetModel(predefined_model)
				self:SetVisible(true)
				self:FixCamera()
				self.LoadingPanel:SetLoading(false)
				return
			elseif (sent_tbl.Initialize ~= nil and type(sent_tbl.Initialize) == "function") then
				local debug_info = debug.getinfo(sent_tbl.Initialize)
				if (debug_info ~= nil and debug_info.short_src ~= nil) then
					local code
					if (file.Exists(debug_info.short_src, "LUA")) then
						code = file.Read(debug_info.short_src, "LUA")
					elseif (file.Exists(debug_info.short_src, "GAME")) then
						code = file.Read(debug_info.short_src, "GAME")
					end
					if (code ~= nil) then
						local mdl_str = code:match('function ENT:Initialize%(.-%)\n.-self:SetModel%("(.-)"%)[%s%S]-end')
						if (mdl_str ~= nil) then
							if (not IsUselessModel(mdl_str)) then
								GAS_Logging_EntityDisplay_Cache[class_name] = mdl_str
								self.ModelPanel:SetModel(mdl_str)
								self:SetVisible(true)
								self:FixCamera()
								self.LoadingPanel:SetLoading(false)
								return
							end
						end
						local relative_path = string.GetPathFromFilename(debug_info.short_src)
						for file_name in code:gmatch('include%("(.-%.lua)"%)') do
							local relative_file = relative_path .. file_name
							local code
							if (file.Exists(relative_file, "LUA")) then
								code = file.Read(relative_file, "LUA")
							elseif (file.Exists(relative_file, "GAME")) then
								code = file.Read(relative_file, "GAME")
							end
							if (code ~= nil) then
								for mdl_str in code:gmatch('self:SetModel%("(.-)"%)') do
									if (not IsUselessModel(mdl_str)) then
										GAS_Logging_EntityDisplay_Cache[class_name] = mdl_str
										self.ModelPanel:SetModel(mdl_str)
										self:SetVisible(true)
										self:FixCamera()
										self.LoadingPanel:SetLoading(false)
										return
									end
								end
								local mdl_str = code:match('"([^\n]-%.mdl)"')
								if (mdl_str ~= nil and not IsUselessModel(mdl_str)) then
									GAS_Logging_EntityDisplay_Cache[class_name] = mdl_str
									self.ModelPanel:SetModel(mdl_str)
									self:SetVisible(true)
									self:FixCamera()
									self.LoadingPanel:SetLoading(false)
									return
								end
							end
						end
					end
				end
			end

			self:SetVisible(true)
			local net_msg_fire = GAS_Logging_EntityDisplay_Networking[class_name] == nil
			GAS_Logging_EntityDisplay_Networking[class_name] = GAS_Logging_EntityDisplay_Networking[class_name] or {}
			GAS_Logging_EntityDisplay_Networking[class_name][self] = true
			if (net_msg_fire) then
				GAS:netStart("logging:EntityDisplay:SENTModel")
					net.WriteString(class_name)
				net.SendToServer()
			end
		end
	end
end

function PANEL:Init()
	self:InfoInit()
end

local DFRAME_PANEL = table.Copy(PANEL)

function PANEL:SetTitle() end

function DFRAME_PANEL:Init()
	self:SetDrawOnTop(true)

	self:ShowFullscreenButton(false)
	self:ShowPinButton(false)
	self:ShowCloseButton(false)

	self:SetVisible(false)

	self:SetMouseInputEnabled(false)
	self:SetKeyboardInputEnabled(false)
	self:SetSize(250,250)

	self:SetTitle("Entity")

	self:InfoInit()
end

function DFRAME_PANEL:Think()
	if (not system.HasFocus() or not IsValid(self.Creator) or vgui.GetHoveredPanel() ~= self.Creator) then
		self:Close()
		return
	end
	local x,y = gui.MousePos()
	self:SetPos(x + 20, y + 20)
end

function DFRAME_PANEL:SetCreator(creator_pnl)
	self.Creator = creator_pnl
end

function GAS_Logging_DisplayEntity(setup_func, creator, on_hover)
	if (not IsValid(creator)) then return end

	local function display()
		if (IsValid(GAS_Logging_EntityDisplay)) then
			GAS_Logging_EntityDisplay:Close()
		end

		GAS_Logging_EntityDisplay = vgui.Create("GAS.Logging.EntityDisplay")
		GAS_Logging_EntityDisplay:SetCreator(creator)
		setup_func(GAS_Logging_EntityDisplay)

		return GAS_Logging_EntityDisplay
	end

	if (on_hover == true) then
		creator.GAS_Logging_DisplayEntity_OnCursorEntered = creator.GAS_Logging_DisplayEntity_OnCursorEntered or creator.OnCursorEntered
		creator.GAS_Logging_DisplayEntity_OnCursorExited  = creator.GAS_Logging_DisplayEntity_OnCursorExited or creator.OnCursorExited
		function creator:OnCursorEntered(...)
			if (self.GAS_Logging_DisplayEntity_OnCursorEntered) then
				self:GAS_Logging_DisplayEntity_OnCursorEntered(...)
			end

			self.GAS_Logging_EntityDisplay = display()
		end
		function creator:OnCursorExited(...)
			if (self.GAS_Logging_DisplayEntity_OnCursorExited) then
				self:GAS_Logging_DisplayEntity_OnCursorExited(...)
			end

			if (IsValid(self.GAS_Logging_EntityDisplay)) then
				self.GAS_Logging_EntityDisplay:Close()
			end
		end
	else
		return display()
	end
end

GAS:netReceive("logging:EntityDisplay:SENTModel", function()
	local class_name = net.ReadString()
	local success = net.ReadBool()
	if (success) then
		local model = net.ReadString()
		if (GAS_Logging_EntityDisplay_Networking[class_name] ~= nil) then
			for pnl in pairs(GAS_Logging_EntityDisplay_Networking[class_name]) do
				if (not IsValid(pnl)) then continue end
				GAS_Logging_EntityDisplay_Cache[class_name] = model
				pnl.LoadingPanel:SetLoading(false)
				pnl.ModelPanel:SetModel(model)
				pnl:FixCamera()
			end
			GAS_Logging_EntityDisplay_Networking[class_name] = nil
		end
	else
		GAS:PlaySound("error")
		if (GAS_Logging_EntityDisplay_Networking[class_name] ~= nil) then
			for pnl in pairs(GAS_Logging_EntityDisplay_Networking[class_name]) do
				if (not IsValid(pnl)) then continue end
				pnl.LoadingPanel:SetLoading(false)
				pnl.Shruggie:SetVisible(true)
			end
			GAS_Logging_EntityDisplay_Networking[class_name] = nil
		end
	end
end)

derma.DefineControl("GAS.Logging.EntityDisplay", nil, DFRAME_PANEL, "bVGUI.Frame")
derma.DefineControl("GAS.Logging.Entity", nil, PANEL, "bVGUI.BlankPanel")
--PATH lua/vgui/openpermissions_tooltip.lua:
local bg_color = Color(43,48,58,255)

local PANEL = {}

function PANEL:Init()
	self:SetDrawOnTop(true)

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetFont(bVGUI.FONT(bVGUI.FONT_CIRCULAR, "REGULAR", 14))
	self.Label:SetText("Tooltip")
	self.Label:SetTextColor(bVGUI.COLOR_WHITE)
	self.Label:SetContentAlignment(5)
	self.Label:SetWrap(true)

	self.Arrow = {
		{x = 0, y = 0},
		{x = 0, y = 0},
		{x = 0, y = 0}
	}
end

function PANEL:Paint(w,h)
	draw.RoundedBox(4, 0, 0, w, h, self.BackgroundColor or bg_color)
	surface.DisableClipping(true)

	surface.SetDrawColor(self.BackgroundColor or bg_color)
	draw.NoTexture()

	self.Arrow[1].x = w / 2 - 7
	self.Arrow[1].y = h

	self.Arrow[2].x = w / 2 + 7
	self.Arrow[2].y = h

	self.Arrow[3].x = w / 2
	self.Arrow[3].y = h + 7

	surface.DrawPoly(self.Arrow)

	surface.DisableClipping(false)
end

function PANEL:Think()
	local x,y = self.Label:GetSize()
	self:SetSize(x + 15, y + 7)
	self.Label:Center()
	local x,y = gui.MousePos()
	self:SetPos(x - self:GetWide() / 2, y - self:GetTall() - 14 - 5)

	if (not system.HasFocus()) then
		self:Remove()
	elseif (self.VGUI_Element) then
		if (not IsValid(self.VGUI_Element)) then
			self:Remove()
		elseif (vgui.GetHoveredPanel() ~= self.VGUI_Element) then
			if (self.HoverFrameNumber) then
				if (FrameNumber() > self.HoverFrameNumber) then
					self:Remove()
				end
			else
				self.HoverFrameNumber = FrameNumber() + 1
			end
		end
	end
end

function PANEL:SetText(text)
	self.Label:SetText(text)
	self.Label:SetWrap(false)
	self.Label:SizeToContentsX()
	if (self.Label:GetWide() >= 200) then
		self.Label:SetWide(200)
		self.Label:SetWrap(true)
		self.Label:SetAutoStretchVertical(true)
	end
end

derma.DefineControl("OpenPermissions.Tooltip", nil, PANEL, "DPanel")
--PATH gamemodes/mangarp/gamemode/modules/f1menu/cl_interface.lua:
DarkRP.openF1Menu = DarkRP.stub{
    name = "openF1Menu",
    description = "Open the F1 help menu.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.closeF1Menu = DarkRP.stub{
    name = "closeF1Menu",
    description = "Close the F1 help menu.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.refreshF1Menu = DarkRP.stub{
    name = "refreshF1Menu",
    description = "Close the F1 help menu.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP
}

--PATH gamemodes/mangarp/gamemode/libraries/modificationloader.lua:
-- Modification loader.
-- Dependencies:
--     - fn
--     - simplerr

--[[---------------------------------------------------------------------------
Disabled defaults
---------------------------------------------------------------------------]]
DarkRP.disabledDefaults = {}
DarkRP.disabledDefaults["modules"] = {
    ["afk"]              = true,
    ["chatsounds"]       = false,
    ["events"]           = false,
    ["fpp"]              = false,
    ["hitmenu"]          = false,
    ["hud"]              = false,
    ["hungermod"]        = false,
    ["playerscale"]      = false,
    ["sleep"]            = false,
}

DarkRP.disabledDefaults["agendas"]          = {}
DarkRP.disabledDefaults["ammo"]             = {}
DarkRP.disabledDefaults["demotegroups"]     = {}
DarkRP.disabledDefaults["doorgroups"]       = {}
DarkRP.disabledDefaults["entities"]         = {}
DarkRP.disabledDefaults["food"]             = {}
DarkRP.disabledDefaults["groupchat"]        = {}
DarkRP.disabledDefaults["hitmen"]           = {}
DarkRP.disabledDefaults["jobs"]             = {}
DarkRP.disabledDefaults["shipments"]        = {}
DarkRP.disabledDefaults["vehicles"]         = {}
DarkRP.disabledDefaults["workarounds"]      = {}

-- The client cannot use simplerr.runLuaFile because of restrictions in GMod.
local doInclude = CLIENT and include or fc{simplerr.wrapError, simplerr.wrapLog, simplerr.runFile}

if file.Exists("darkrp_config/disabled_defaults.lua", "LUA") then
    if SERVER then AddCSLuaFile("darkrp_config/disabled_defaults.lua") end
    doInclude("darkrp_config/disabled_defaults.lua")
end

--[[---------------------------------------------------------------------------
Config
---------------------------------------------------------------------------]]
local configFiles = {
    "darkrp_config/settings.lua",
    "darkrp_config/licenseweapons.lua",
}

for _, File in pairs(configFiles) do
    if not file.Exists(File, "LUA") then continue end

    if SERVER then AddCSLuaFile(File) end
    doInclude(File)
end
if SERVER and file.Exists("darkrp_config/mysql.lua", "LUA") then doInclude("darkrp_config/mysql.lua") end

--[[---------------------------------------------------------------------------
Modules
---------------------------------------------------------------------------]]
local function loadModules()
    local fol = "darkrp_modules/"

    local _, folders = file.Find(fol .. "*", "LUA")

    for _, folder in SortedPairs(folders, true) do
        if folder == "." or folder == ".." or GAMEMODE.Config.DisabledCustomModules[folder] then continue end
        -- Sound but incomplete way of detecting the error of putting addons in the darkrpmod folder
        if file.Exists(fol .. folder .. "/addon.txt", "LUA") or file.Exists(fol .. folder .. "/addon.json", "LUA") then
            DarkRP.errorNoHalt("Addon detected in the darkrp_modules folder.", 2, {
                "This addon is not supposed to be in the darkrp_modules folder.",
                "It is supposed to be in garrysmod/addons/ instead.",
                "Whether a mod is to be installed in darkrp_modules or addons is the author's decision.",
                "Please read the readme of the addons you're installing next time."
            },
            "<darkrpmod addon>/lua/darkrp_modules/" .. folder, -1)
            continue
        end

        for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
            if SERVER then
                AddCSLuaFile(fol .. folder .. "/" .. File)
            end

            if File == "sh_interface.lua" then continue end
            doInclude(fol .. folder .. "/" .. File)
        end

        if SERVER then
            for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
                if File == "sv_interface.lua" then continue end
                doInclude(fol .. folder .. "/" .. File)
            end
        end

        for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
            if File == "cl_interface.lua" then continue end

            if SERVER then
                AddCSLuaFile(fol .. folder .. "/" .. File)
            else
                doInclude(fol .. folder .. "/" .. File)
            end
        end
    end
end

local function loadLanguages()
    local fol = "darkrp_language/"

    local files, _ = file.Find(fol .. "*", "LUA")
    for _, File in pairs(files) do
        if SERVER then AddCSLuaFile(fol .. File) end
        doInclude(fol .. File)
    end
end

local customFiles = {
    "darkrp_customthings/jobs.lua",
    "darkrp_customthings/shipments.lua",
    "darkrp_customthings/entities.lua",
    "darkrp_customthings/vehicles.lua",
    "darkrp_customthings/food.lua",
    "darkrp_customthings/ammo.lua",
    "darkrp_customthings/groupchats.lua",
    "darkrp_customthings/categories.lua",
    "darkrp_customthings/agendas.lua", -- has to be run after jobs.lua
    "darkrp_customthings/doorgroups.lua", -- has to be run after jobs.lua
    "darkrp_customthings/demotegroups.lua", -- has to be run after jobs.lua
}
local function loadCustomDarkRPItems()
    for _, File in pairs(customFiles) do
        if not file.Exists(File, "LUA") then continue end
        if File == "darkrp_customthings/food.lua" and DarkRP.disabledDefaults["modules"]["hungermod"] then continue end

        if SERVER then AddCSLuaFile(File) end
        doInclude(File)
    end
end


function GM:DarkRPFinishedLoading()
    -- GAMEMODE gets set after the last statement in the gamemode files is run. That is not the case in this hook
    GAMEMODE = GAMEMODE or GM

    loadLanguages()
    loadModules()
    loadCustomDarkRPItems()
    hook.Call("loadCustomDarkRPItems", self)
    hook.Call("postLoadCustomDarkRPItems", self)
end

--PATH gamemodes/mangarp/gamemode/modules/workarounds/sh_workarounds.lua:
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

if not DarkRP.disabledDefaults["workarounds"]["os.date() Windows crash"] and system.IsWindows() then
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
    if DarkRP.disabledDefaults["workarounds"]["SkidCheck"] then return end

    -- Malicious addons that kicks players this one person doesn't like.
    if not istable(Skid) then return end
    Skid.Check = fn.Id
    hook.Remove("CheckPassword", "Skid.CheckPassword")

    MsgC(Color(0, 255, 0), "SkidCheck", color_white, " has been ", Color(255, 0, 0), "DISABLED\n", color_white, [[
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
    https://forum.facepunch.com//f/gmoddev/nujl/PSA-Hex-SkidCheck-global-banlist-is-a-thing-and-people-actually-use-it/1/

    On a somewhat unrelated note, HeX has been known to be malicious for quite some time:
    He used to have an anticheat (called HAC) on his server, which not only misfired from
    time to time, but actively used exploits to fuck "cheaters" up as much as possible,
    doing malicious shit ranging from unbinding keys to removing every friend they had in
    their friends list.

    That too can be fact checked right here:
    https://forum.facepunch.com//f/gmoddev/lrbf/So-hac-got-released/1/

    DO NOT trust this guy to decide who gets banned from your server. In fact,
    DO NOT EVER TRUST ANYONE with that power. No one ever should have the power
    to decide who gets banned and who doesn't over the servers that decide to install
    their addon.
]])
end)

if SERVER and not DarkRP.disabledDefaults["workarounds"]["Error on edict limit"] then
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
            DarkRP.error(entsCreateError, 2, {string.format("Affected entity: '%s'", name)})
        end

        return unpack(res, 1, len)
    end
end

--[[---------------------------------------------------------------------------
Generic InitPostEntity workarounds
---------------------------------------------------------------------------]]
hook.Add("InitPostEntity", "DarkRP_Workarounds", function()
    if CLIENT then
        if not DarkRP.disabledDefaults["workarounds"]["White flashbang flashes"] then
            -- Removes the white flashes when the server lags and the server has flashbang. Workaround because it's been there for fucking years
            hook.Remove("HUDPaint","drawHudVital")
        end

        -- Fuck up APAnti
        if not DarkRP.disabledDefaults["workarounds"]["APAnti"] then
            net.Receivers.sblockgmspawn = nil
            hook.Remove("PlayerBindPress", "_sBlockGMSpawn")
        end
        return
    end
    local commands = concommand.GetTable()
    if not DarkRP.disabledDefaults["workarounds"]["Durgz witty sayings"] and commands["durgz_witty_sayings"] then
        game.ConsoleCommand("durgz_witty_sayings 0\n") -- Deals with the cigarettes exploit. I'm fucking tired of them. I hate having to fix other people's mods, but this mod maker is retarded and refuses to update his mod.
    end

    -- Remove ULX /me command. (the /me command is the only thing this hook does)
    if not DarkRP.disabledDefaults["workarounds"]["ULX /me command"] then
        hook.Remove("PlayerSay", "ULXMeCheck")
    end

    -- why can people even save multiplayer games?
    -- Lag exploit
    if not DarkRP.disabledDefaults["workarounds"]["gm_save"] then
        concommand.Remove("gm_save")
    end

    -- Remove that weird rooftop spawn in rp_downtown_v4c_v2
    if not DarkRP.disabledDefaults["workarounds"]["rp_downtown_v4c_v2 rooftop spawn"] and
    game.GetMap() == "rp_downtown_v4c_v2" then
        for _, v in ipairs(ents.FindByClass("info_player_terrorist")) do
            v:Remove()
        end
    end
end)

--[[---------------------------------------------------------------------------
Fuck up APAnti. These hooks send unnecessary net messages.
---------------------------------------------------------------------------]]
if not DarkRP.disabledDefaults["workarounds"]["APAnti"] then
    timer.Simple(3, function()
        hook.Remove("Move", "_APA.Settings.AllowGMSpawn")
        hook.Remove("PlayerSpawnObject", "_APA.Settings.AllowGMSpawn")
    end)
end

--[[---------------------------------------------------------------------------
Wire field generator exploit
---------------------------------------------------------------------------]]
if SERVER and not DarkRP.disabledDefaults["workarounds"]["Wire field generator exploit fix"] then
    hook.Add("OnEntityCreated", "DRP_WireFieldGenerator", function(ent)
        timer.Simple(0, function()
            if IsValid(ent) and ent:GetClass() == "gmod_wire_field_device" then
                local TriggerInput = ent.TriggerInput
                function ent:TriggerInput(iname, value)
                    if iname == "Distance" and isnumber(value) then
                        value = math.min(value, 400)
                    end
                    TriggerInput(self, iname, value)
                end
            end
        end)
    end)
end

--[[---------------------------------------------------------------------------
Door tool is shitty
Let's fix that huge class exploit
---------------------------------------------------------------------------]]
if not DarkRP.disabledDefaults["workarounds"]["Door tool class fix"] then
    hook.Add("InitPostEntity", "FixDoorTool", function()
        local oldFunc = makedoor
        if isfunction(oldFunc) then
            function makedoor(ply, trace, ang, model, open, close, autoclose, closetime, class, hardware, ...)
                if class ~= "prop_dynamic" and class ~= "prop_door_rotating" then return end

                oldFunc(ply, trace, ang, model, open, close, autoclose, closetime, class, hardware, ...)
            end
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
end
--[[---------------------------------------------------------------------------
Anti crash exploit
---------------------------------------------------------------------------]]
if SERVER and not DarkRP.disabledDefaults["workarounds"]["Constraint crash exploit fix"] then
    hook.Add("PropBreak", "drp_AntiExploit", function(attacker, ent)
        if IsValid(ent) and ent:GetPhysicsObject():IsValid() then
            constraint.RemoveAll(ent)
        end
    end)
end

--[[---------------------------------------------------------------------------
Actively deprecate commands
---------------------------------------------------------------------------]]
if SERVER and not DarkRP.disabledDefaults["workarounds"]["Deprecated console commands"] then
    local deprecated = {
        {command = "rp_removeletters",      alternative = "removeletters"},
        {command = "rp_setname",            alternative = "forcerpname"},
        {command = "rp_unlock",             alternative = "forceunlock"},
        {command = "rp_lock",               alternative = "forcelock"},
        {command = "rp_removeowner",        alternative = "forceremoveowner"},
        {command = "rp_addowner",           alternative = "forceown"},
        {command = "rp_unownall",           alternative = "forceunownall"},
        {command = "rp_unown",              alternative = "forceunown"},
        {command = "rp_own",                alternative = "forceown"},
        {command = "rp_tellall",            alternative = "admintellall"},
        {command = "rp_tell",               alternative = "admintell"},
        {command = "rp_teamunban",          alternative = "teamunban"},
        {command = "rp_teamban",            alternative = "teamban"},
        {command = "rp_setsalary",          alternative = "setmoney"},
        {command = "rp_setmoney",           alternative = "setmoney"},
        {command = "rp_revokelicense",      alternative = "unsetlicense"},
        {command = "rp_givelicense",        alternative = "setlicense"},
        {command = "rp_unlockdown",         alternative = "unlockdown"},
        {command = "rp_lockdown",           alternative = "lockdown"},
        {command = "rp_unarrest",           alternative = "unarrest"},
        {command = "rp_arrest",             alternative = "arrest"},
        {command = "rp_cancelvote",         alternative = "forcecancelvote"},
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
end


--[[-------------------------------------------------------------------------
CAC tends to kick innocent people when they use the x86_64 branch. Since the
author is unable to maintain it, it is better to disable the addon altogether.
---------------------------------------------------------------------------]]
local disableCacMsg = [[CAC was detected on this server and has been disabled.
It turns out there is a trivial and very well known way for cheats to bypass
CAC. Worse yet, CAC tends to kick innocent players who are using the 64 bits
branch of GMod.

The author of the addon does not maintain CAC anymore, so this is to prevent
further damage and to warn you of this situation.

If you wish to leave CAC enabled, please open

addons\darkrpmodification\lua\darkrp_config\disabled_defaults.lua

Head to the section about disabled workarounds and make sure the following line is there:
["disable CAC"]                                  = true,
]]
if SERVER and not DarkRP.disabledDefaults["workarounds"]["disable CAC"] then
    timer.Create("disable CAC", 2, 1, function()
        if not CAC then return end

        --remove CAC's hooks
        hook.Remove("CheckPassword"      , "CAC.CheckPassword")
        hook.Remove("Initialize"         , "CAC.LuaWhitelistController.261b4998")
        hook.Remove("OnNPCKilled"        , "CAC.Aimbotdetector")
        hook.Remove("PlayerDeath"        , "CAC.AimbotDetector")
        hook.Remove("PlayerInitialSpawn" , "CAC.PlayerMonitor.PlayerConnected")
        hook.Remove("PlayerSay"          , "CAC.ChatCommands")
        hook.Remove("SetupMove"          , "CAC.MoveHandler")
        hook.Remove("ShutDown"           , "CAC")
        hook.Remove("Think"              , "CAC.DelayedCalls")
        hook.Remove("Tick"               , "CAC.PlayerMonitor.ProcessQueue")
        hook.Remove("player_disconnect"  , "CAC.PlayerMonitor.PlayerDisconnected")

        --remove CAC's timers
        timer.Remove("CAC.AdminUIBootstrapper")
        timer.Remove("CAC.DataUpdater")
        timer.Remove("CAC.IncidentController")
        timer.Remove("CAC.LivePlayerSessionController")
        timer.Remove("CAC.SettingsSaver")

        --remove CAC's net receivers
        net.Receivers[CAC.Identifiers.MultiplexedDataChannelName] = nil
        net.Receivers[CAC.Identifiers.AdminChannelName] = nil

        for k,v in pairs(CAC) do
            if istable(CAC[k]) and CAC[k].dtor then CAC[k]:dtor() end
        end

        CAC = nil

        MsgC(Color(0, 255, 0), "Cake Anticheat (CAC)", color_white, " has been ", Color(255, 0, 0), "DISABLED\n", Color(253, 151, 31), disableCacMsg)
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/jobs/sh_commands.lua:
local plyMeta = FindMetaTable("Player")

DarkRP.declareChatCommand{
    command = "job",
    description = "Change your job name",
    delay = 1.5,
    condition = fn.Compose{fn.Not, plyMeta.isArrested}
}

DarkRP.declareChatCommand{
    command = "demote",
    description = "Demote a player from their job",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.Flip(fn.Gt), 2)(1), fn.Length, player.GetAll},
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "switchjob",
    description = "Switch jobs with the player you're looking at",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.GetValue, 2)("allowjobswitch"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "switchjobs",
    description = "Switch jobs with the player you're looking at",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.GetValue, 2)("allowjobswitch"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "jobswitch",
    description = "Switch jobs with the player you're looking at",
    delay = 1.5,
    condition = fn.Compose{fn.Curry(fn.GetValue, 2)("allowjobswitch"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "teamban",
    description = "Ban someone from getting a certain job",
    delay = 1.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "teamunban",
    description = "Undo a teamban",
    delay = 1.5,
    tableArgs = true
}

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/cl_interface/cl_scoreboardplayer.lua:
FAdmin.ScoreBoard.Player.Information = {}
FAdmin.ScoreBoard.Player.ActionButtons = {}

function FAdmin.ScoreBoard.Player.Show(ply)
    ply = ply or FAdmin.ScoreBoard.Player.Player
    FAdmin.ScoreBoard.Player.Player = ply

    if not IsValid(ply) or not IsValid(FAdmin.ScoreBoard.Player.Player) then FAdmin.ScoreBoard.ChangeView("Main") return end

    local ScreenHeight = ScrH()

    FAdmin.ScoreBoard.Player.Controls.AvatarBackground = vgui.Create("AvatarImage")
    FAdmin.ScoreBoard.Player.Controls.AvatarBackground:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 100)
    FAdmin.ScoreBoard.Player.Controls.AvatarBackground:SetSize(184, 184)
    FAdmin.ScoreBoard.Player.Controls.AvatarBackground:SetPlayer(ply, 184)
    FAdmin.ScoreBoard.Player.Controls.AvatarBackground:SetVisible(true)

    FAdmin.ScoreBoard.Player.InfoPanels = FAdmin.ScoreBoard.Player.InfoPanels or {}
    for k, v in pairs(FAdmin.ScoreBoard.Player.InfoPanels) do
        if IsValid(v) then
            v:Remove()
            FAdmin.ScoreBoard.Player.InfoPanels[k] = nil
        end
    end

    if IsValid(FAdmin.ScoreBoard.Player.Controls.InfoPanel1) then
        FAdmin.ScoreBoard.Player.Controls.InfoPanel1:Remove()
    end

    FAdmin.ScoreBoard.Player.Controls.InfoPanel1 = vgui.Create("DListLayout")
    FAdmin.ScoreBoard.Player.Controls.InfoPanel1:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 100 + 184 + 5 --[[ + Avatar size]])
    FAdmin.ScoreBoard.Player.Controls.InfoPanel1:SetSize(184, ScreenHeight * 0.1 + 2)
    FAdmin.ScoreBoard.Player.Controls.InfoPanel1:SetVisible(true)
    FAdmin.ScoreBoard.Player.Controls.InfoPanel1:Clear(true)

    FAdmin.ScoreBoard.Player.Controls.InfoPanel2 = FAdmin.ScoreBoard.Player.Controls.InfoPanel2 or vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Player.Controls.InfoPanel2:SetPos(FAdmin.ScoreBoard.X + 25 + 184 --[[+ Avatar]], FAdmin.ScoreBoard.Y + 100)
    FAdmin.ScoreBoard.Player.Controls.InfoPanel2:SetSize(FAdmin.ScoreBoard.Width - 184 - 30 - 10, 184 + 5 + ScreenHeight * 0.1 + 2)
    FAdmin.ScoreBoard.Player.Controls.InfoPanel2:SetVisible(true)
    FAdmin.ScoreBoard.Player.Controls.InfoPanel2:Clear(true)

    local function AddInfoPanel()
        local pan = FAdmin.ScoreBoard.Player.Controls.InfoPanel2:Add("DListLayout")
        pan:SetSize(1, FAdmin.ScoreBoard.Player.Controls.InfoPanel2:GetTall())

        table.insert(FAdmin.ScoreBoard.Player.InfoPanels, pan)
        return pan
    end

    local SelectedPanel = AddInfoPanel() -- Make first panel to put the first things in

    for k, v in pairs(FAdmin.ScoreBoard.Player.Information) do
        SelectedPanel:Dock(LEFT)
        local Value = v.func(FAdmin.ScoreBoard.Player.Player)
        --if not Value or Value == "" then return --[[ Value = "N/A" ]] end
        if Value and Value ~= "" then

            local Text = vgui.Create("DLabel")
            Text:Dock(LEFT)
            Text:SetFont("TabLarge")
            Text:SetText(v.name .. ": " .. Value)
            Text:SizeToContents()
            Text:SetColor(Color(200,200,200,200))
            Text:SetTooltip("Click to copy " .. v.name .. " to clipboard")
            Text:SetMouseInputEnabled(true)

            function Text:OnMousePressed(mcode)
                self:SetTooltip(v.name .. " copied to clipboard!")
                ChangeTooltip(self)
                SetClipboardText(Value)
                self:SetTooltip("Click to copy " .. v.name .. " to clipboard")
            end

            timer.Create("FAdmin_Scoreboard_text_update_" .. v.name, 1, 0, function()
                if not IsValid(ply) or not IsValid(FAdmin.ScoreBoard.Player.Player) or not IsValid(Text) then
                    timer.Remove("FAdmin_Scoreboard_text_update_" .. v.name)
                    if FAdmin.ScoreBoard.Visible and (not IsValid(ply) or not IsValid(FAdmin.ScoreBoard.Player.Player)) then FAdmin.ScoreBoard.ChangeView("Main") end
                    return
                end
                Value = v.func(FAdmin.ScoreBoard.Player.Player)
                if not Value or Value == "" then Value = "N/A" end
                Text:SetText(v.name .. ": " .. Value)
            end)

            if (#FAdmin.ScoreBoard.Player.Controls.InfoPanel1:GetChildren() * 17 + 17) <= FAdmin.ScoreBoard.Player.Controls.InfoPanel1:GetTall() and not v.NewPanel then
                FAdmin.ScoreBoard.Player.Controls.InfoPanel1:Add(Text)
            else
                if #SelectedPanel:GetChildren() * 17 + 17 >= SelectedPanel:GetTall() or v.NewPanel then
                    SelectedPanel = AddInfoPanel() -- Add new panel if the last one is full
                end
                SelectedPanel:Add(Text)
                if Text:GetWide() > SelectedPanel:GetWide() then
                    SelectedPanel:SetWide(Text:GetWide() + 40)
                end
            end
        end
    end

    local CatColor = team.GetColor(ply:Team())
    if GAMEMODE.Name == "Sandbox" then
        CatColor = Color(100, 150, 245, 255)
        if ply:Team() == TEAM_CONNECTING then
            CatColor = Color(200, 120, 50, 255)
        elseif ply:IsAdmin() then
            CatColor = Color(30, 200, 50, 255)
        end

        if ply:GetFriendStatus() == "friend" then
            CatColor = Color(236, 181, 113, 255)
        end
    end
    CatColor = hook.Run("FAdmin_PlayerRowColour", ply, CatColor) or CatColor

    FAdmin.ScoreBoard.Player.Controls.ButtonCat = FAdmin.ScoreBoard.Player.Controls.ButtonCat or vgui.Create("FAdminPlayerCatagory")
    FAdmin.ScoreBoard.Player.Controls.ButtonCat:SetLabel("  Player options!")
    FAdmin.ScoreBoard.Player.Controls.ButtonCat.CatagoryColor = CatColor
    FAdmin.ScoreBoard.Player.Controls.ButtonCat:SetSize(FAdmin.ScoreBoard.Width - 40, 100)
    FAdmin.ScoreBoard.Player.Controls.ButtonCat:SetPos(FAdmin.ScoreBoard.X + 20, FAdmin.ScoreBoard.Y + 100 + FAdmin.ScoreBoard.Player.Controls.InfoPanel2:GetTall() + 5)
    FAdmin.ScoreBoard.Player.Controls.ButtonCat:SetVisible(true)

    function FAdmin.ScoreBoard.Player.Controls.ButtonCat:Toggle()
    end

    FAdmin.ScoreBoard.Player.Controls.ButtonPanel = FAdmin.ScoreBoard.Player.Controls.ButtonPanel or vgui.Create("FAdminPanelList", FAdmin.ScoreBoard.Player.Controls.ButtonCat)
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:SetSpacing(5)
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:EnableHorizontal(true)
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:EnableVerticalScrollbar(true)
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:SizeToContents()
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:SetVisible(true)
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:SetSize(0, (ScreenHeight - FAdmin.ScoreBoard.Y - 40) - (FAdmin.ScoreBoard.Y + 100 + FAdmin.ScoreBoard.Player.Controls.InfoPanel2:GetTall() + 5))
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:Clear()
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:DockMargin(5, 5, 5, 5)

    for _, v in ipairs(FAdmin.ScoreBoard.Player.ActionButtons) do
        if v.Visible == true or (isfunction(v.Visible) and v.Visible(FAdmin.ScoreBoard.Player.Player) == true) then
            local ActionButton = vgui.Create("FAdminActionButton")
            local imageType = TypeID(v.Image)
            if imageType == TYPE_STRING then
                ActionButton:SetImage(v.Image or "icon16/exclamation")
            elseif imageType == TYPE_TABLE then
                ActionButton:SetImage(v.Image[1])
                if v.Image[2] then ActionButton:SetImage2(v.Image[2]) end
            elseif imageType == TYPE_FUNCTION then
                local img1, img2 = v.Image(ply)
                ActionButton:SetImage(img1)
                if img2 then ActionButton:SetImage2(img2) end
            else
                ActionButton:SetImage("icon16/exclamation")
            end
            local name = v.Name
            if isfunction(name) then name = name(FAdmin.ScoreBoard.Player.Player) end
            ActionButton:SetText(DarkRP.deLocalise(name))
            ActionButton:SetBorderColor(v.color)

            function ActionButton:DoClick()
                if not IsValid(FAdmin.ScoreBoard.Player.Player) then return end
                return v.Action(FAdmin.ScoreBoard.Player.Player, self)
            end
            FAdmin.ScoreBoard.Player.Controls.ButtonPanel:AddItem(ActionButton)
            if v.OnButtonCreated then
                v.OnButtonCreated(FAdmin.ScoreBoard.Player.Player, ActionButton)
            end
        end
    end
    FAdmin.ScoreBoard.Player.Controls.ButtonPanel:Dock(TOP)
end

function FAdmin.ScoreBoard.Player:AddInformation(name, func, ForceNewPanel) -- ForeNewPanel is to start a new column
    table.insert(FAdmin.ScoreBoard.Player.Information, {name = name, func = func, NewPanel = ForceNewPanel})
end

function FAdmin.ScoreBoard.Player:AddActionButton(Name, Image, color, Visible, Action, OnButtonCreated)
    table.insert(FAdmin.ScoreBoard.Player.ActionButtons, {Name = Name, Image = Image, color = color, Visible = Visible, Action = Action, OnButtonCreated = OnButtonCreated})
end

FAdmin.ScoreBoard.Player:AddInformation("Name", function(ply) return ply:Nick() end)
FAdmin.ScoreBoard.Player:AddInformation("Kills", function(ply) return ply:Frags() end)
FAdmin.ScoreBoard.Player:AddInformation("Deaths", function(ply) return ply:Deaths() end)
FAdmin.ScoreBoard.Player:AddInformation("Health", function(ply) return ply:Health() end)
FAdmin.ScoreBoard.Player:AddInformation("Ping", function(ply) return ply:Ping() end)
FAdmin.ScoreBoard.Player:AddInformation("SteamID", function(ply) return ply:SteamID() end, true)

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/ragdoll/sh_shared.lua:
-- lua_Run A = Player(5):GetEyeTrace().Entity
-- lua_run for i = 1, A:GetPhysicsObjectCount() do B = A:WorldToLocal(A:GetPhysicsObjectNum(i):GetPos()) print("Vector("..B.x..", "..B.y..", "..B.z.."),") end
-- lua_run for i = 1, A:GetPhysicsObjectCount() do B = A:GetPhysicsObjectNum(i):GetAngle() print("Angle("..B.p..", "..B.y..", "..B.r.."),") end

FAdmin.PlayerActions.RagdollTypes = {
    [1] = "Normal",
    [2] = "Kick them in the nuts",
    [3] = "Hang",
    [4] = "Unragdoll"
}

FAdmin.StartHooks["Ragdolling"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "ragdoll",
        hasTarget = true,
        message = {"instigator", " ragdolled ", "targets", " ", "extraInfo.1"},
        receivers = "involved+admins",
        writeExtraInfo = function(info) net.WriteUInt(info[1], 16) end,
        readExtraInfo = function()
            local time = net.ReadUInt(16)
            return {time == 0 and FAdmin.PlayerActions.commonTimes[time] or string.format("for %s", FAdmin.PlayerActions.commonTimes[time] or (time .. " seconds"))}
        end
    }

    FAdmin.Messages.RegisterNotification{
        name = "unragdoll",
        hasTarget = true,
        message = {"instigator", " unragdolled ", "targets"},
        receivers = "involved+admins",
    }
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/ignite/cl_init.lua:
FAdmin.StartHooks["Ignite"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "ignite",
        hasTarget = true,
        message = {"instigator", " ignited ", "targets", " ", "extraInfo.1"},
        readExtraInfo = function()
            local time = net.ReadUInt(16)
            return {time == 0 and FAdmin.PlayerActions.commonTimes[time] or string.format("for %s", FAdmin.PlayerActions.commonTimes[time] or (time .. " seconds"))}
        end
    }

    FAdmin.Messages.RegisterNotification{
        name = "unignite",
        hasTarget = true,
        message = {"instigator", " unignited ", "targets"},
    }

    FAdmin.Access.AddPrivilege("Ignite", 2)
    FAdmin.Commands.AddCommand("Ignite", nil, "<Player>", "[time]")
    FAdmin.Commands.AddCommand("unignite", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply) return (ply:FAdmin_GetGlobal("FAdmin_ignited") and "Extinguish") or "Ignite" end,
    function(ply) local disabled = (ply:FAdmin_GetGlobal("FAdmin_ignited") and "fadmin/icons/disable") or nil return "fadmin/icons/ignite", disabled end,
    Color(255, 130, 0, 255),
    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Ignite", ply) end,
    function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_ignited") then
            RunConsoleCommand("_FAdmin", "ignite", ply:UserID())
            button:SetImage2("fadmin/icons/disable")
            button:SetText("Extinguish")
            button:GetParent():InvalidateLayout()
        else
            RunConsoleCommand("_FAdmin", "unignite", ply:UserID())
            button:SetImage2("null")
            button:SetText("Ignite")
            button:GetParent():InvalidateLayout()
        end
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/playeractions/god/cl_init.lua:
FAdmin.StartHooks["God"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "god",
        hasTarget = true,
        message = {"instigator", " enabled godmode for ", "targets"},
        receivers = "everyone",
    }

    FAdmin.Messages.RegisterNotification{
        name = "ungod",
        hasTarget = true,
        message = {"instigator", " disabled godmode for ", "targets"},
        receivers = "everyone",
    }

    FAdmin.Access.AddPrivilege("God", 2)
    FAdmin.Commands.AddCommand("god", nil, "<Player>")
    FAdmin.Commands.AddCommand("ungod", nil, "<Player>")

    FAdmin.ScoreBoard.Player:AddActionButton(function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_godded") then return "Ungod" end
        return "God"
    end, function(ply)
        if ply:FAdmin_GetGlobal("FAdmin_godded") then return "fadmin/icons/god", "fadmin/icons/disable" end
        return "fadmin/icons/god"
    end, Color(255, 130, 0, 255),

    function(ply) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "God") end, function(ply, button)
        if not ply:FAdmin_GetGlobal("FAdmin_godded") then
            RunConsoleCommand("_FAdmin", "god", ply:UserID())
        else
            RunConsoleCommand("_FAdmin", "ungod", ply:UserID())
        end

        if not ply:FAdmin_GetGlobal("FAdmin_godded") then button:SetImage2("fadmin/icons/disable") button:SetText("Ungod") button:GetParent():InvalidateLayout() return end
        button:SetImage2("null")
        button:SetText("God")
        button:GetParent():InvalidateLayout()
    end)
end

--PATH gamemodes/mangarp/gamemode/modules/chat/cl_chatlisteners.lua:
--[[---------------------------------------------------------------------------
This module finds out for you who can see you talk or speak through the microphone
---------------------------------------------------------------------------]]

--[[---------------------------------------------------------------------------
Variables
---------------------------------------------------------------------------]]
local receivers
local currentChatText = {}
local receiverConfigs = {}
local currentConfig = {text = "", hearFunc = fn.Id} -- Default config is not loaded yet

--[[---------------------------------------------------------------------------
addChatReceiver
Add a chat command with specific receivers

prefix: the chat command itself ("/pm", "/ooc", "/me" are some examples)
text: the text that shows up when it says "Some people can hear you X"
hearFunc: a function(ply, splitText) that decides whether this player can or cannot hear you.
    return true if the player can hear you
           false if the player cannot
           nil if you want to prevent the text from showing up temporarily
---------------------------------------------------------------------------]]
function DarkRP.addChatReceiver(prefix, text, hearFunc)
    receiverConfigs[prefix] = {
        text = text,
        hearFunc = hearFunc
    }
end

--[[---------------------------------------------------------------------------
removeChatReceiver
Remove a chat command.

prefix: the command, like in addChatReceiver
---------------------------------------------------------------------------]]
function DarkRP.removeChatReceiver(prefix)
    receiverConfigs[prefix] = nil
end

--[[---------------------------------------------------------------------------
Draw the results to the screen
---------------------------------------------------------------------------]]
local function drawChatReceivers()
    if not receivers then return end

    local fontHeight = draw.GetFontHeight("DarkRPHUD1")
    local x, y = chat.GetChatBoxPos()
    y = y - fontHeight - 4

    local receiversCount = #receivers
    -- No one hears you
    if receiversCount == 0 then
        draw.WordBox(2, x, y, DarkRP.getPhrase("hear_noone", currentConfig.text), "DarkRPHUD1", Color(0,0,0,160), Color(255,0,0,255))
        return
    -- Everyone hears you
    elseif receiversCount == player.GetCount() - 1 then
        draw.WordBox(2, x, y, DarkRP.getPhrase("hear_everyone"), "DarkRPHUD1", Color(0,0,0,160), Color(0,255,0,255))
        return
    end

    draw.WordBox(2, x, y - (receiversCount * (fontHeight + 4)), DarkRP.getPhrase("hear_certain_persons", currentConfig.text), "DarkRPHUD1", Color(0,0,0,160), Color(0,255,0,255))
    for i = 1, receiversCount, 1 do
        if not IsValid(receivers[i]) then
            receivers[i] = receivers[#receivers]
            receivers[#receivers] = nil
            continue
        end

        draw.WordBox(2, x, y - (i - 1) * (fontHeight + 4), receivers[i]:Nick(), "DarkRPHUD1", Color(0, 0, 0, 160), color_white)
    end
end

--[[---------------------------------------------------------------------------
Find out who could hear the player if they were to speak now
---------------------------------------------------------------------------]]
local function chatGetRecipients()
    if not currentConfig then return end

    receivers = {}
    for _, ply in ipairs(player.GetAll()) do
        local hidePly = hook.Run("chatHideRecipient", ply)
        if not IsValid(ply) or ply == LocalPlayer() or ply:GetNoDraw() or hidePly then continue end

        local val = currentConfig.hearFunc(ply, currentChatText)

        -- Return nil to disable the chat recipients temporarily.
        if val == nil then
            receivers = nil
            return
        elseif val == true then
            table.insert(receivers, ply)
        end
    end
end

--[[---------------------------------------------------------------------------
Called when the player starts typing
---------------------------------------------------------------------------]]
local function startFind()
    local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_ChatReceivers")
    if shouldDraw == false then return end

    currentConfig = receiverConfigs[""]
    hook.Add("Think", "DarkRP_chatRecipients", chatGetRecipients)
    hook.Add("HUDPaint", "DarkRP_DrawChatReceivers", drawChatReceivers)
end
hook.Add("StartChat", "DarkRP_StartFindChatReceivers", startFind)

--[[---------------------------------------------------------------------------
Called when the player stops typing
---------------------------------------------------------------------------]]
local function stopFind()
    hook.Remove("Think", "DarkRP_chatRecipients")
    hook.Remove("HUDPaint", "DarkRP_DrawChatReceivers")
end
hook.Add("FinishChat", "DarkRP_StopFindChatReceivers", stopFind)

--[[---------------------------------------------------------------------------
Find out which chat command the user is typing
---------------------------------------------------------------------------]]
local function findConfig(text)
    local split = string.Explode(' ', text)
    local prefix = string.lower(split[1])

    currentChatText = split

    currentConfig = receiverConfigs[prefix] or receiverConfigs[""]
end
hook.Add("ChatTextChanged", "DarkRP_FindChatRecipients", findConfig)


--[[---------------------------------------------------------------------------
Default chat receievers. If you want to add your own ones, don't add them to this file. Add them to a clientside module file instead.
---------------------------------------------------------------------------]]
-- Load after the custom languages have been loaded
local function loadChatReceivers()
    -- Default talk chat receiver has no prefix
    DarkRP.addChatReceiver("", DarkRP.getPhrase("talk"), function(ply)
        if GAMEMODE.Config.alltalk then return nil end

        return LocalPlayer():GetPos():DistToSqr(ply:GetPos()) <
            GAMEMODE.Config.talkDistance * GAMEMODE.Config.talkDistance
    end)

    DarkRP.addChatReceiver("/ooc", DarkRP.getPhrase("speak_in_ooc"), function(ply) return true end)
    DarkRP.addChatReceiver("//", DarkRP.getPhrase("speak_in_ooc"), function(ply) return true end)
    DarkRP.addChatReceiver("/a", DarkRP.getPhrase("speak_in_ooc"), function(ply) return true end)
    DarkRP.addChatReceiver("/w", DarkRP.getPhrase("whisper"), function(ply) return LocalPlayer():GetPos():DistToSqr(ply:GetPos()) < GAMEMODE.Config.whisperDistance * GAMEMODE.Config.whisperDistance end)
    DarkRP.addChatReceiver("/y", DarkRP.getPhrase("yell"), function(ply) return LocalPlayer():GetPos():DistToSqr(ply:GetPos()) < GAMEMODE.Config.yellDistance * GAMEMODE.Config.yellDistance end)
    DarkRP.addChatReceiver("/me", DarkRP.getPhrase("perform_your_action"), function(ply) return LocalPlayer():GetPos():DistToSqr(ply:GetPos()) < GAMEMODE.Config.meDistance * GAMEMODE.Config.meDistance end)
    DarkRP.addChatReceiver("/g", DarkRP.getPhrase("talk_to_your_group"), function(ply)
        for _, func in pairs(GAMEMODE.DarkRPGroupChats) do
            if func(LocalPlayer()) and func(ply) then
                return true
            end
        end
        return false
    end)


    DarkRP.addChatReceiver("/pm", "PM", function(ply, text)
        if not isstring(text[2]) then return false end
        text[2] = string.lower(tostring(text[2]))

        return string.find(string.lower(ply:Nick()), text[2], 1, true) ~= nil or
            string.find(string.lower(ply:SteamName()), text[2], 1, true) ~= nil or
            string.lower(ply:SteamID()) == text[2]
    end)

    --[[---------------------------------------------------------------------------
        Voice chat receivers
        ---------------------------------------------------------------------------]]
    local voiceDistance = GM.Config.voiceDistance * GM.Config.voiceDistance
    DarkRP.addChatReceiver("speak", DarkRP.getPhrase("speak"), function(ply)
        if not LocalPlayer().DRPIsTalking then return nil end
        if LocalPlayer():GetPos():DistToSqr(ply:GetPos()) > voiceDistance then return false end

        return not GAMEMODE.Config.dynamicvoice or ply:isInRoom()
    end)
end
hook.Add("loadCustomDarkRPItems", "loadChatListeners", loadChatReceivers)

--[[---------------------------------------------------------------------------
Called when the player starts using their voice
---------------------------------------------------------------------------]]
local function startFindVoice(ply)
    if ply ~= LocalPlayer() then return end

    local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_ChatReceivers")
    if shouldDraw == false then return end

    currentConfig = receiverConfigs["speak"]
    hook.Add("Think", "DarkRP_chatRecipients", chatGetRecipients)
    hook.Add("HUDPaint", "DarkRP_DrawChatReceivers", drawChatReceivers)
end
hook.Add("PlayerStartVoice", "DarkRP_VoiceChatReceiverFinder", startFindVoice)

--[[---------------------------------------------------------------------------
Called when the player stops using their voice
---------------------------------------------------------------------------]]
local function stopFindVoice(ply)
    if ply ~= LocalPlayer() then return end

    stopFind()
end
hook.Add("PlayerEndVoice", "DarkRP_VoiceChatReceiverFinder", stopFindVoice)

--PATH gamemodes/mangarp/gamemode/modules/base/sh_commands.lua:
DarkRP.declareChatCommand{
    command = "rpname",
    description = "Set your RP name",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "name",
    description = "Set your RP name",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "nick",
    description = "Set your RP name",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "buy",
    description = "Buy a pistol",
    delay = 1.5,
    condition = fn.FAnd {
        fn.Compose{fn.Curry(fn.GetValue, 2)("enablebuypistol"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode},
        fn.Compose{fn.Not, fn.Curry(fn.GetValue, 2)("noguns"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
    }
}

DarkRP.declareChatCommand{
    command = "buyshipment",
    description = "Buy a shipment",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "buyvehicle",
    description = "Buy a vehicle",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "buyammo",
    description = "Purchase ammo",
    delay = 1.5,
    condition = fn.Compose{fn.Not, fn.Curry(fn.GetValue, 2)("noguns"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}
}

DarkRP.declareChatCommand{
    command = "price",
    description = "Set the price of the microwave or gunlab you're looking at",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "setprice",
    description = "Set the price of the microwave or gunlab you're looking at",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "forcerpname",
    description = "Forcefully change a player's RP name",
    delay = 0.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "freerpname",
    description = "Remove a RP name from the database so a player can use it",
    delay = 1.5
}

--PATH lua/weapons/drgbase_possession.lua:
SWEP.PrintName = "Possession"
SWEP.Spawnable = false
SWEP.AdminOnly = true
SWEP.AutoSwitchTo = false
SWEP.DrawAmmo = false
SWEP.DisableDuplicator = true
SWEP.Primary.Ammo = ""
SWEP.Secondary.Ammo = ""
SWEP.WorldModel = ""
SWEP.Slot = 5
function SWEP:PrimaryAttack() end
function SWEP:SecondaryAttack() end
function SWEP:Reload() end

--PATH lua/weapons/drgbase_possessor.lua:
AddCSLuaFile()
SWEP.PrintName = "Possessor"
SWEP.Category = "DrGBase"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.Ammo = ""
SWEP.Secondary.Ammo = ""
SWEP.WorldModel = ""
SWEP.ViewModel = "models/weapons/v_bugbait.mdl"
SWEP.DrawAmmo = false
SWEP.AutoSwitchTo = false
SWEP.Slot = 5

local function CanPossess(ent)
	return ent.IsDrGNextbot and
	GetConVar("drgbase_possession_enable"):GetBool() and
	ent.PossessionPrompt and ent:IsPossessionEnabled()
end

function SWEP:Initialize()
	self:SetHoldType("magic")
end
function SWEP:PrimaryAttack()
	if CLIENT then return end
	local owner = self:GetOwner()
	if not IsValid(owner) then return end
	if not owner:IsPlayer() then return end
	local tr = owner:GetEyeTraceNoCursor()
	if IsValid(tr.Entity) and CanPossess(tr.Entity) then
		local possess = tr.Entity:Possess(owner)
		if possess == "ok" then
			net.Start("DrGBaseNextbotCanPossess")
			net.WriteEntity(tr.Entity)
		else
			net.Start("DrGBaseNextbotCantPossess")
			net.WriteEntity(tr.Entity)
			net.WriteString(possess)
		end
		net.Send(owner)
	end
end
function SWEP:SecondaryAttack() end
function SWEP:Reload() end
hook.Add("PreDrawHalos", "DrGBasePossessorSWEPHalos", function()
	local ply = LocalPlayer()
	local weapon = ply:GetActiveWeapon()
	if IsValid(weapon) and weapon:GetClass() == "drgbase_possessor" then
		local tr = ply:GetEyeTraceNoCursor()
		local ent = tr.Entity
		if not IsValid(ent) then return end
		if CanPossess(ent) and not ent:IsPossessed() then
			halo.Add({ent}, DrGBase.CLR_GREEN)
		else halo.Add({ent}, DrGBase.CLR_RED) end
	end
end)

--PATH lua/weapons/drgbase_weapon/secondary.lua:

SWEP.Secondary.Enabled = false

-- Shooting
SWEP.Secondary.Damage = 1
SWEP.Secondary.Bullets = 1
SWEP.Secondary.Spread = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Delay = 0
SWEP.Secondary.Recoil = 0

-- Ammo
SWEP.Secondary.Ammo	= ""
SWEP.Secondary.Cost = 1
SWEP.Secondary.ClipSize	= 0
SWEP.Secondary.DefaultClip = 0

-- Effects
SWEP.Secondary.Sound = ""
SWEP.Secondary.EmptySound = ""

function SWEP:CanSecondaryAttack()
	if not self.Secondary.Enabled then return false end
	if self:GetSecondaryAmmoType() < 0 then return true end
	if self.Secondary.ClipSize > 0 then
		return self.Weapon:Clip2() >= self.Secondary.Cost
	else return self.Owner:GetAmmoCount(self.Secondary.Ammo) >= self.Secondary.Cost end
end
function SWEP:TriedToSecondaryAttack()
	self:EmitSound(self.Secondary.EmptySound)
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end
function SWEP:SecondaryAttack()
	if not self.Secondary.Enabled then return false end
	if not self:CanSecondaryAttack() then
		if IsFirstTimePredicted() then
			self:TriedToSecondaryAttack()
		end
		return false
	end
	if IsFirstTimePredicted() and self:PreSecondaryAttack() == false then return false end
	if IsFirstTimePredicted() then self:FireSecondary() end
	self:EmitSound(self.Secondary.Sound)
	if SERVER then
		self:TakeSecondaryAmmo(self.Secondary.Cost)
		if self.Owner:IsPlayer() then
			local eyeangles = self.Owner:EyeAngles()
			eyeangles.p = eyeangles.p - self.Secondary.Recoil
			self.Owner:SetEyeAngles(eyeangles)
		end
	end
	if IsFirstTimePredicted() then
		if self.Secondary.Delay >= 0 then
			local delay = CurTime() + self.Secondary.Delay
			self:SetNextSecondaryFire(delay)
			self:PostSecondaryAttack(delay)
		else self:PostSecondaryAttack(CurTime()) end
	end
	return true
end
function SWEP:PreSecondaryAttack() end
function SWEP:FireSecondary()
	self:ShootBullet(self.Secondary.Damage, self.Secondary.Bullets, self.Secondary.Spread)
end
function SWEP:PostSecondaryAttack() end

--PATH lua/weapons/gas_weapon_hands.lua:
AddCSLuaFile()

SWEP.PrintName = "Hands"
SWEP.Slot = 0
SWEP.SlotPos = 0

SWEP.DrawAmmo = false

SWEP.Spawnable = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.DrawCrosshair = false

SWEP.WorldModel = ""

SWEP.Instructions = "You are temporarily restricted to this weapon only."

function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:Deploy()
	if (CLIENT or not IsValid(self:GetOwner())) then return true end
	self:GetOwner():DrawWorldModel(false)
	return true
end

function SWEP:PreDrawViewModel()
	return true
end

function SWEP:PrimaryAttack() end
function SWEP:SecondaryAttack() end
function SWEP:Reload() end
--PATH lua/weapons/gmod_tool/stools/catmullrom_camera_numpad_trigger.lua:
TOOL.Category   = "Event Triggering"
TOOL.Name       = "Numpad Trigger Editor"
TOOL.Command    = nil
TOOL.ConfigName	= nil
TOOL.Tab        = "CRCCams"


TOOL.ClientConVar["keys"] = "-1"
TOOL.ClientConVar["hold"] = "0"

function TOOL:LeftClick(trace)
	return CatmullRomCams.SToolMethods.NumPadTrigger.LeftClick(self, trace)
end

function TOOL:RightClick(trace)
	return CatmullRomCams.SToolMethods.NumPadTrigger.RightClick(self, trace)
end

function TOOL:Reload(trace)
	return CatmullRomCams.SToolMethods.NumPadTrigger.Reload(self, trace)
end

function TOOL:Think()
	return CatmullRomCams.SToolMethods.NumPadTrigger.Think(self)
end

function TOOL:ValidTrace(trace)
	return CatmullRomCams.SToolMethods.ValidTrace(trace)
end

function TOOL.BuildCPanel(panel)
	return CatmullRomCams.SToolMethods.NumPadTrigger.BuildCPanel(panel)
end

--PATH lua/weapons/gmod_tool/stools/drgbase_tool_relationship_simple.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_relationship_simple.name"
TOOL.ClientConVar = {
	["disposition"] = 1,
	["bothways"] = 0
}
TOOL.BuildCPanel = function(panel)
	panel:Help("#tool.drgbase_tool_relationship_simple.desc")
	panel:Help("#tool.drgbase_tool_relationship_simple.0")
	panel:ControlHelp("\nOptions\n")
	local combo = panel:ComboBox("Relationship", "drgbase_tool_relationship_simple_disposition")
	combo:AddChoice("Like", 3)
	combo:AddChoice("Hate", 1)
	combo:AddChoice("Fear", 2)
	combo:AddChoice("Ignore", 4)
	panel:CheckBox("Both ways", "drgbase_tool_relationship_simple_bothways")
	panel:Help("If both ways, it will set the same relationship on the other entity.")
end

function TOOL:LeftClick(tr)
	if not IsValid(tr.Entity) then return false end
	if not tr.Entity.IsDrGNextbot and
	not tr.Entity:IsNPC() then return false end
	if CLIENT then return true end
	self:GetOwner():DrG_CleverEntitySelect(tr.Entity)
	return true
end
function TOOL:RightClick(tr)
	if not IsValid(tr.Entity) and not tr.Entity:IsWorld() then return false end
	if CLIENT then return true end
	if tr.Entity:IsWorld() then tr.Entity = self:GetOwner() end
	local disp = self:GetClientNumber("disposition")
	if self:GetOwner():KeyDown(IN_SPEED) then
		for ent in self:GetOwner():DrG_SelectedEntities() do
			for ent2 in self:GetOwner():DrG_SelectedEntities() do
				if ent == ent2 then continue end
				if ent.IsDrGNextbot then
					ent:_SetRelationship(ent2, disp)
				elseif ent:IsNPC() then
					ent:DrG_SetRelationship(ent2, disp)
				end
			end
		end
	else
		for ent in self:GetOwner():DrG_SelectedEntities() do
			if ent.IsDrGNextbot then
				ent:_SetRelationship(tr.Entity, disp)
			elseif ent:IsNPC() then
				ent:DrG_SetRelationship(tr.Entity, disp)
			end
		end
	end
	return true
end
function TOOL:Reload(tr)
	if CLIENT then return true end
	self:GetOwner():DrG_ClearSelectedEntities()
	return true
end

if CLIENT then
	language.Add("tool.drgbase_tool_relationship_simple.name", "Set Relationship")
	language.Add("tool.drgbase_tool_relationship_simple.desc", "Change relationship of a nextbot towards an entity.")
	language.Add("tool.drgbase_tool_relationship_simple.0", "Left click to select/deselect a nextbot/NPC (hold shift to select multiple entities), right click to set the relationship towards an entity (aim at the ground to set the relationship towards yourself) and reload to clear the list of selected entities.")

	hook.Add("PreDrawHalos", "DrGBaseToolRelationshipHalos", function()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
		local tool = ply:GetTool()
		if tool == nil or tool.Mode ~= "drgbase_tool_relationship_simple" then return end
		local allies = {}
		local enemies = {}
		local afraid = {}
		local neutrals = {}
		local errors = {}
		for selected in ply:DrG_SelectedEntities() do
			if selected.IsDrGNextbot then
				local disp = selected:LocalPlayerRelationship()
				if disp == D_LI then table.insert(allies, selected)
				elseif disp == D_HT then table.insert(enemies, selected)
				elseif disp == D_FR then table.insert(afraid, selected)
				elseif disp == D_NU then table.insert(neutrals, selected)
				else table.insert(errors, selected) end
			else table.insert(errors, selected) end
		end
		halo.Add(allies, DrGBase.CLR_GREEN)
		halo.Add(enemies, DrGBase.CLR_RED)
		halo.Add(afraid, DrGBase.CLR_PURPLE)
		halo.Add(neutrals, DrGBase.CLR_CYAN)
		halo.Add(errors, DrGBase.CLR_ORANGE)
	end)
end

--PATH addons/sl_utils/lua/weapons/high_five_swep/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Purpose				= "You can now high five!"
SWEP.Instructions 			= "Click to high five."

SWEP.Category 				= "EGM Animation SWEPs"
SWEP.PrintName				= "High Five"
SWEP.Spawnable				= true
SWEP.deactivateOnMove		= 110

SWEP.Base = "animation_swep_base"

if CLIENT then
	function SWEP:GetGesture()
		return {
	        ["ValveBiped.Bip01_L_Forearm"] = Angle(25,-65,25),
	        ["ValveBiped.Bip01_L_UpperArm"] = Angle(-70,-180,70),
	    }
	end
end

--PATH addons/sl_main_system/lua/weapons/mad_baton/shared.lua:
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

SWEP.PrintName 		      = "Base : Baton Mage" 
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
SWEP.Base                 = "weapon_base" 
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

SWEP.TypeArme = "magie"
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
--PATH addons/sl_main_system/lua/weapons/mad_baton13/shared.lua:
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

SWEP.PrintName 		      = "13 : Baton céleste" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton14.mdl"
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
SWEP.BonusDegats = 106

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton16/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton4/shared.lua:
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

SWEP.PrintName 		      = "4 : Gros baton" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton5.mdl"
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
SWEP.BonusDegats = 34

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague1/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague10/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague11/shared.lua:
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

SWEP.PrintName 		      = "11 : Dague en or épuré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague21.mdl"
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
SWEP.BonusDegats = 90

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague17/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague20/shared.lua:
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

SWEP.PrintName 		      = "20 : Dague Antique" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague20.mdl"
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
SWEP.BonusDegats = 162

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_dague9/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee11/shared.lua:
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

SWEP.PrintName 		      = "D : Épée en or épuré" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword3.mdl"
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
SWEP.BonusDegats = 98

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee2/shared.lua:
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

SWEP.PrintName 		      = "E : Épée en fer fine" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword31.mdl"
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

SWEP.TypeArme = "sword"
SWEP.BonusDegats = 26
SWEP.holdtype = "sl_epee_ht_mad"
--PATH addons/sl_main_system/lua/weapons/mad_epee22/shared.lua:
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

SWEP.PrintName 		      = "22 : Épée Scimitar" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/swordspe6.mdl"
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
SWEP.BonusDegats = 186

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee3/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee4/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee5/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee5/shared.lua:
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

SWEP.PrintName 		      = "E : Épée du Crépuscule" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword12.mdl"
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
SWEP.BonusDegats = 50

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee8/shared.lua:
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

SWEP.PrintName 		      = "D : Épée en or noir" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/sword6.mdl"
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
SWEP.BonusDegats = 74

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee9/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau1/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau16/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau2/cl_init.lua:
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
--PATH addons/the_perfect_training_system/lua/weapons/trained_fists.lua:
/*
	This file is a copy-pasta from the original SWEP, with some changes for the strength parameter
	99% of the code is made by the original SWEP fists author, though.
*/


AddCSLuaFile()

SWEP.PrintName = "Trained Fists"
SWEP.Author = "From the original SWEP author, remade for The Perfect Training System"
SWEP.Purpose = ""

SWEP.Slot = 0
SWEP.SlotPos = 4

SWEP.Spawnable = true

SWEP.ViewModel = Model( "models/weapons/c_arms.mdl" )
SWEP.WorldModel = ""
SWEP.ViewModelFOV = 54
SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = false

SWEP.HitDistance = 48

local SwingSound = Sound( "WeaponFrag.Throw" )
local HitSound = Sound( "Flesh.ImpactHard" )

function SWEP:Initialize()

	self:SetHoldType( "fist" )

end

function SWEP:SetupDataTables()

	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
	self:NetworkVar( "Int", 2, "Combo" )

end

function SWEP:UpdateNextIdle()

	local vm = self:GetOwner():GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )

end

function SWEP:PrimaryAttack( right )

	local ply = self:GetOwner()

	ply:SetAnimation( PLAYER_ATTACK1 )

	local anim = "fists_left"
	if ( right ) then anim = "fists_right" end
	if ( self:GetCombo() >= 2 ) then
		anim = "fists_uppercut"
	end

	local vm = ply:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )

	self:EmitSound( SwingSound )

	self:UpdateNextIdle()
	self:SetNextMeleeAttack( CurTime() + 0.2 )

	local routineFire = 0.9
	if Diablos.TS:IsTrainingEnabled("attackspeed") then
		local attackspeed = ply:TSGetAttackSpeed() -- 100% of attack speed by default
		routineFire = routineFire / (attackspeed / 100)
	end

	self:SetNextPrimaryFire( CurTime() + routineFire )
	self:SetNextSecondaryFire( CurTime() + routineFire )

end

function SWEP:SecondaryAttack()

	self:PrimaryAttack( true )

end

function SWEP:DealDamage()

	local anim = self:GetSequenceName(self:GetOwner():GetViewModel():GetSequence())

	self:GetOwner():LagCompensation( true )

	local tr = util.TraceLine( {
		start = self:GetOwner():GetShootPos(),
		endpos = self:GetOwner():GetShootPos() + self:GetOwner():GetAimVector() * self.HitDistance,
		filter = self:GetOwner(),
		mask = MASK_SHOT_HULL
	} )

	if ( !IsValid( tr.Entity ) ) then
		tr = util.TraceHull( {
			start = self:GetOwner():GetShootPos(),
			endpos = self:GetOwner():GetShootPos() + self:GetOwner():GetAimVector() * self.HitDistance,
			filter = self:GetOwner(),
			mins = Vector( -10, -10, -8 ),
			maxs = Vector( 10, 10, 8 ),
			mask = MASK_SHOT_HULL
		} )
	end

	-- We need the second part for single player because SWEP:Think is ran shared in SP
	if ( tr.Hit && !( game.SinglePlayer() && CLIENT ) ) then
		self:EmitSound( HitSound )
	end

	local hit = false

	if ( SERVER && IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) ) then
		local dmginfo = DamageInfo()

		local attacker = self:GetOwner()
		if ( !IsValid( attacker ) ) then attacker = self end
		dmginfo:SetAttacker( attacker )

		local damage = math.random( 8, 12 )
		local strengthDamage = 0
		if Diablos.TS:IsTrainingEnabled("strength") then
			strengthDamage = attacker:TSGetStrengthDamage()
			damage = damage * (strengthDamage / 100)
		end



		dmginfo:SetInflictor( self )
		dmginfo:SetDamage( damage )

		if ( anim == "fists_left" ) then
			dmginfo:SetDamageForce( self:GetOwner():GetRight() * 4912 + self:GetOwner():GetForward() * 9998 ) -- Yes we need those specific numbers
		elseif ( anim == "fists_right" ) then
			dmginfo:SetDamageForce( self:GetOwner():GetRight() * -4912 + self:GetOwner():GetForward() * 9989 )
		elseif ( anim == "fists_uppercut" ) then
			dmginfo:SetDamageForce( self:GetOwner():GetUp() * 5158 + self:GetOwner():GetForward() * 10012 )
			damage = math.random( 12, 24 )
			damage = damage + (damage * (strengthDamage * 1.5 / 100))
			dmginfo:SetDamage( damage )
		end

		SuppressHostEvents( NULL ) -- Let the breakable gibs spawn in multiplayer on client
		tr.Entity:TakeDamageInfo( dmginfo )
		SuppressHostEvents( self:GetOwner() )

		hit = true

	end

	if ( SERVER && IsValid( tr.Entity ) ) then
		local phys = tr.Entity:GetPhysicsObject()
		if ( IsValid( phys ) ) then
			phys:ApplyForceOffset( self:GetOwner():GetAimVector() * 80 * phys:GetMass(), tr.HitPos )
		end
	end

	if ( SERVER ) then
		if ( hit && anim != "fists_uppercut" ) then
			self:SetCombo( self:GetCombo() + 1 )
		else
			self:SetCombo( 0 )
		end
	end

	self:GetOwner():LagCompensation( false )

end

function SWEP:OnDrop()

	self:Remove() -- You can't drop fists

end

function SWEP:Deploy()

	local speed = GetConVarNumber( "sv_defaultdeployspeed" )

	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_draw" ) )
	vm:SetPlaybackRate( speed )

	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:UpdateNextIdle()

	if ( SERVER ) then
		self:SetCombo( 0 )
	end

	return true

end

function SWEP:Think()

	local vm = self:GetOwner():GetViewModel()
	local curtime = CurTime()
	local idletime = self:GetNextIdle()

	if ( idletime > 0 && CurTime() > idletime ) then

		vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_idle_0" .. math.random( 1, 2 ) ) )

		self:UpdateNextIdle()

	end

	local meleetime = self:GetNextMeleeAttack()

	if ( meleetime > 0 && CurTime() > meleetime ) then

		self:DealDamage()

		self:SetNextMeleeAttack( 0 )

	end

	if ( SERVER && CurTime() > self:GetNextPrimaryFire() + 0.1 ) then

		self:SetCombo( 0 )

	end

end

--PATH gamemodes/mangarp/entities/weapons/weapon_m42/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Contact = ""
    SWEP.Purpose = ""
    SWEP.Instructions = "Hold use and left-click to change firemodes."
    SWEP.Slot = 2
    SWEP.SlotPos = 0
    SWEP.IconLetter = "w"

    killicon.AddFont("weapon_m42", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

SWEP.Base = "weapon_cs_base2"

SWEP.PrintName = "M4"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.HoldType = "ar2"
SWEP.LoweredHoldType = "passive"
SWEP.DarkRPViewModelBoneManipulations = {
    ["ValveBiped.Bip01_Spine4"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(2, 0, 0),
        angle = Angle(0, 0, 0)
    },
    ["ValveBiped.Bip01_L_Hand"] = {
        scale = Vector(0.7, 0.7, 0.5),
        pos = Vector(-0.6, -0.6, 0),
        angle = Angle(17, -21, 0)
    },
    ["ValveBiped.Bip01_L_Finger0"] = {
        scale = Vector(1, 1, 1.5),
        pos = Vector(0, 0, 0),
        angle = Angle(0, -2, 0)
    },
    ["ValveBiped.Bip01_L_Finger1"] = {
        scale = Vector(1, 1, 1.5),
        pos = Vector(-0.3, -0.8, 0),
        angle = Angle(0, -10, 0)
    },
    ["ValveBiped.Bip01_L_Finger11"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, 0, 0),
        angle = Angle(0, -15, 0)
    },
    ["ValveBiped.Bip01_L_Finger12"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, 0, 0),
        angle = Angle(0, -14, 0)
    },
    ["ValveBiped.Bip01_L_Finger2"] = {
        scale = Vector(1, 1, 1.5),
        pos = Vector(-0.6, -1, -0),
        angle = Angle(0, 7, 0)
    },
    ["ValveBiped.Bip01_L_Finger21"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, 0, 0),
        angle = Angle(0, -15, 0)
    },
    ["ValveBiped.Bip01_L_Finger22"] = {
        scale = Vector(0.8, 0.8, 1),
        pos = Vector(0, -0.3, 0),
        angle = Angle(0, -36, 0)
    },
    ["ValveBiped.Bip01_L_Finger3"] = {
        scale = Vector(1, 1, 1.5),
        pos = Vector(-0.36, -1.2, -0.2),
        angle = Angle(-6, -2, 0)
    },
    ["ValveBiped.Bip01_L_Finger31"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, -0.1, 0),
        angle = Angle(0, -4, 0)
    },
    ["ValveBiped.Bip01_L_Finger32"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, -0.2, 0),
        angle = Angle(0, -12, 0)
    },
    ["ValveBiped.Bip01_L_Finger4"] = {
        scale = Vector(1, 1, 1.5),
        pos = Vector(-0.3, -1.2, 0.3),
        angle = Angle(12, -6.2, -4)
    },
    ["ValveBiped.Bip01_L_Finger41"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, 0, 0),
        angle = Angle(0, 38, 0)
    },
    ["ValveBiped.Bip01_L_Finger42"] = {
        scale = Vector(1, 1, 1),
        pos = Vector(0, 0, 0),
        angle = Angle(0, 30, 0)
    }
}

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.Primary.Sound = Sound("Weapon_M4A1.Single")
SWEP.Primary.Recoil = 1.25
SWEP.Primary.Unrecoil = 8
SWEP.Primary.Damage = 15
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone   = 0.03
SWEP.Primary.ClipSize = 30
SWEP.Primary.Delay = 0.07
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

-- Start of Firemode configuration
SWEP.IronSightsPos = Vector(-8.09, -4.5, 0.56)
SWEP.IronSightsAng = Vector(2.75, -3.97, -3.8)
SWEP.IronSightsPosAfterShootingAdjustment = Vector(0.5, 0, 0)
SWEP.IronSightsAngAfterShootingAdjustment = Vector(0, 1.65, 0)

SWEP.MultiMode = true

--PATH addons/sl_util_accessory/lua/entities/aas_bodygroup/cl_init.lua:
include("shared.lua")

--PATH addons/sl_util_atm/lua/entities/atm_reader/cl_init.lua:
include("shared.lua")

surface.CreateFont( "batm_reader_med", {
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

surface.CreateFont( "batm_reader_med2", {
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


surface.CreateFont( "batm_reader_small", {
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



surface.CreateFont( "batm_reader_smallest", {
	font = "Coolvetica",
	extended = false,
	size = 42,
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

surface.CreateFont( "batm_reader_smallester", {
	font = "Coolvetica",
	extended = false,
	size = 38,
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

surface.CreateFont( "batm_reader_smallesterer", {
	font = "Coolvetica",
	extended = false,
	size = 25,
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


--The X resolution of the screen
local ScrW = 512
local ScrH = 469

--Set up the entity and its render targts and materials
function ENT:Initialize()
	self.screenMaterial = CreateMaterial("blueatm_cardreaderscreenmat_"..self:EntIndex(), "UnlitGeneric", {})
	self.renderTarget = GetRenderTarget("blueatm_cardreaderscreenmat_"..self:EntIndex(), 512, 512, false)

	self.screenMaterial:SetTexture('$basetexture', self.renderTarget)
end


local logo = Material("bluesatm/logo.png", "noclamp smooth")
local scroll = Material("bluesatm/color_strip.vmt")
local failed = Material("bluesatm/failed.png", "noclamp smooth")

--CBLib.Helper.WrapText(Str,font,width)
--Draw the model and call the screen rendering functions.
function ENT:RenderScreen()
	if self:GetPos():Distance(LocalPlayer():GetPos()) < 300 and BATM.ScreenDisabled == false then
		--Draw the screen
		render.PushRenderTarget(self.renderTarget)
			render.Clear(0,0,0,0,true,true) 
			cam.Start2D()
					
			draw.RoundedBox(0, 0, 0, ScrW, ScrH, Color(52, 73, 94))--Color(45, 62, 80))

			if self:GetItemPrice() == -1 then
			    --Draw background
				draw.SimpleText(BATM.Lang["Press 'E' to set up!"], "batm_reader_med2", ScrW/2, ScrH/2 , Color(255,255,255), 1, 1)
			else

				draw.SimpleText(BATM.Lang["$"]..CBLib.Helper.CommaFormatNumber(self:GetItemPrice()), "batm_reader_med", ScrW/2, 45 , Color(255,255,255), 1, 1)
				draw.SimpleText(self:GetItemTitle(), "batm_reader_small", ScrW/2, 110 , Color(255,255,255), 1, 1)

				draw.RoundedBox(0, 25, 150, ScrW - 50, ScrH - 175, Color(45, 62, 80))

				--200 character count limit
				local description = self:GetItemDescription()

				local lines = CBLib.Helper.WrapText(description,"batm_reader_smallest",ScrW - 25 - 50)

				local yOffset = 0

				for k ,v in pairs(lines) do
					draw.SimpleText(v,"batm_reader_smallest",30 + ((ScrW-58)/2),155 + yOffset, Color(255,255,255), 1)
					yOffset = yOffset + 30
				end
			end

			cam.End2D()
		render.PopRenderTarget()

		--Update material texture

		self.screenMaterial:SetTexture('$basetexture', self.renderTarget)
		self:SetSubMaterial(4, "!blueatm_cardreaderscreenmat_"..self:EntIndex())
	end

end

function ENT:Draw()
	self:RenderScreen()
	self:DrawModel()
end

--Handle scene thinks
function ENT:Think()

end

local frameReference = nil

--For owners to set up the machine
function ENT:ShowSetupWindow()
	if frameReference ~= nil then return end

	local frame = vgui.Create("DFrame")
	frame:SetSize(300, 440)
	frame:SetTitle("")
	frame:Center()
	frame:ShowCloseButton(false)
	frame:SetVisible(true)
	frame:MakePopup()
	frame.Close = function(s)
		frameReference = nil
		s:Remove()
	end

	frameReference = frame

	frame.Paint = function(s , w , h)
		draw.RoundedBox(0, 0, 0, ScrW, ScrH, Color(45, 62, 80))
		draw.RoundedBox(0, 0, 50, ScrW, ScrH, Color(52, 73, 94))

		surface.SetDrawColor(Color(255,255,255))
		surface.SetMaterial(logo)
		surface.DrawTexturedRect(-4, 5, 1024 / 4.5, 199 / 4.5)
	end

	--Close button
	local close = vgui.Create("DButton", frame)
	close:SetPos(300 - 40, 7)
	close:SetSize(32, 32)
	close:SetText("")
	close.DoClick = function()
		frame:Close()
	end
	close.Paint = function(s , w , h)
		surface.SetDrawColor(Color(255,255,255,100))
		surface.SetMaterial(failed)
		surface.DrawTexturedRect(0,0,w,h)
	end

	local inputPrice = vgui.Create("DTextEntry", frame)
	inputPrice:SetPos(20, 70)
	inputPrice:SetSize(300 - 40, 40)
	inputPrice:SetFont("batm_reader_small")

	inputPrice.Paint = function(s, w, h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255,255))
		s:DrawTextEntryText(Color(120,120,120,200), Color(0,0,0,255), Color(120,120,120,255))

		if s:GetText() == "" then
			draw.SimpleText(BATM.Lang["Enter Price"],"batm_reader_small",5, 0, Color(120,120,120,200))
		end
	end

	local inputTitle = vgui.Create("DTextEntry", frame)
	inputTitle:SetPos(20, 70 + 50)
	inputTitle:SetSize(300 - 40, 40)
	inputTitle:SetFont("batm_reader_small")

	inputTitle.Paint = function(s, w, h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255,255))
		s:DrawTextEntryText(Color(120,120,120,200), Color(0,0,0,255), Color(120,120,120,255))

		if s:GetText() == "" then
			draw.SimpleText(BATM.Lang["Enter Title"],"batm_reader_small",5, 0, Color(120,120,120,200))
		end
	end

	local inputDesc = vgui.Create("DTextEntry", frame)
	inputDesc:SetPos(20, 70 + 50 + 50)
	inputDesc:SetSize(300 - 40, 200)
	inputDesc:SetFont("batm_reader_smallesterer")
	inputDesc:SetMultiline(true)

	inputDesc.Paint = function(s, w, h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255,255))
		s:DrawTextEntryText(Color(120,120,120,200), Color(0,0,0,255), Color(120,120,120,255))

		if s:GetText() == "" then
			draw.SimpleText(BATM.Lang["Enter Description"],"batm_reader_smallester",5, 0, Color(120,120,120,200))
		end
	end

	local submit = vgui.Create("DButton", frame)
	submit:SetPos(20, 70 + 50 + 50 + 200 + 10)
	submit:SetSize(300 - 40, 40)
	submit:SetFont("batm_reader_smallest")
	submit:SetTextColor(Color(255,255,255,255))
	submit:SetText(BATM.Lang["Submit"])
	submit.Paint = function(s , w , h)
		draw.RoundedBox(0,0,0,w,h,Color(49, 209, 60))
	end
	submit.DoClick = function(s)
		local amount = tonumber(inputPrice:GetText())
		local title = inputTitle:GetText()
		local desc = inputDesc:GetText()

		net.Start("batm_reader_edit")
			net.WriteDouble(amount or 0)
			net.WriteString(title)
			net.WriteString(desc)
			net.WriteEntity(self)
		net.SendToServer()

		frame:Close()
	end
end
 
--For customers to purchase shit
function ENT:ShowPurchaseWindow()
	if frameReference ~= nil then return end

	local frame = vgui.Create("DFrame")
	frame:SetSize(300, 200) 
	frame:SetTitle("")
	frame:Center()
	frame:ShowCloseButton(false)
	frame:SetVisible(true)
	frame:MakePopup()
	frame.Close = function(s)
		frameReference = nil
		s:Remove()
	end

	frameReference = frame

	frame.Paint = function(s , w , h)
		draw.RoundedBox(0, 0, 0, ScrW, ScrH, Color(45, 62, 80))
		draw.RoundedBox(0, 0, 50, ScrW, ScrH, Color(52, 73, 94))

		surface.SetDrawColor(Color(255,255,255))
		surface.SetMaterial(logo)
		surface.DrawTexturedRect(-4, 5, 1024 / 4.5, 199 / 4.5)

		draw.SimpleText(BATM.Lang["$"]..CBLib.Helper.CommaFormatNumber(self:GetItemPrice()),"batm_reader_small",w/2, 60, Color(255,255,255,255), 1)
		draw.SimpleText(BATM.Lang["Seller : "]..self:GetReaderOwner():Name(),"batm_reader_smallesterer",w/2, 105, Color(255,255,255,255), 1)
	end

	--Close button
	local close = vgui.Create("DButton", frame)
	close:SetPos(300 - 40, 7)
	close:SetSize(32, 32)
	close:SetText("")
	close.DoClick = function()
		frame:Close()
	end
	close.Paint = function(s , w , h)
		surface.SetDrawColor(Color(255,255,255,100))
		surface.SetMaterial(failed)
		surface.DrawTexturedRect(0,0,w,h)
	end

	local purchase = vgui.Create("DButton", frame)
	purchase:SetPos(20, 140)
	purchase:SetSize(300 - 40, 40)
	purchase:SetFont("batm_reader_smallest")
	purchase:SetTextColor(Color(255,255,255,255))
	purchase:SetText(BATM.Lang["Purchase"])
	purchase.Paint = function(s , w , h)
		draw.RoundedBox(0,0,0,w,h,Color(49, 209, 60))
	end
	purchase.DoClick = function(s) 
		net.Start("batm_reader_purchase")
			net.WriteEntity(self)
		net.SendToServer()

		frame:Close()
	end
end

--Call the correct function
net.Receive("batm_reader_purchase", function()
	local ent = net.ReadEntity()
	if ent ~= nil then
		if ent:GetItemPrice() == -1 then
			LocalPlayer():ChatPrint(BATM.Lang["[ATM] The owner has not yet set up this device"])
		else
			ent:ShowPurchaseWindow()
		end
	end
end)

--Call the correctl function
net.Receive("batm_reader_edit", function()
	local ent = net.ReadEntity()
	if ent ~= nil then
		ent:ShowSetupWindow()
	end
end)


--PATH lua/entities/bacon1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bacon Slice"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Bacon"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/bacon.mdl")
	
end
--PATH lua/entities/bdcakeslice4/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Birthday Cake (Slice)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A piece of birthday cake"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/cakeslice2.mdl")
	
end
--PATH lua/entities/bread5/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/bread_loaf.mdl")
	
end
--PATH lua/entities/champagne1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Champagne"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bottle of champagne"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/champagne.mdl")
	
end
--PATH lua/entities/cheesewheel2a/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/cheesewheel2a.mdl")
	
end
--PATH lua/entities/chipsdoritos/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/chipsdoritos.mdl")
	
end
--PATH lua/entities/chipslays5/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Lays Dill Pickle"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Lays"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chipslays5.mdl")
	
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_card_reader/shared.lua:
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
ENT.PrintName		= "Training Card Reader"
ENT.Category		= "Diablos Addon"
ENT.Instructions	= ""
ENT.Spawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "TrainingID")
	self:NetworkVar("Entity", 0, "SportOwner")
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_dumbbell/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()

	local ply = LocalPlayer()

	if ply:GetPos():DistToSqr(self:GetPos()) > Diablos.TS.Optimization * 100 then return end

	local ang = Angle(0, 90, 90)

	local pos = self:GetPos()

	local weightDumbbell = self:GetWeight()
	local sizeDumbbell = Diablos.TS.DumbbellSizeEquivalence[weightDumbbell]

	local sizeX, sizeH = 500, 150
	local relativePos = math.sin(CurTime()) * 70

	local weightValue = sizeDumbbell.kg
	if Diablos.TS.IsLbs then
		weightValue = sizeDumbbell.lbs
	end

	cam.Start3D2D(pos + Vector(0, -12.5, 35), ang, .05)

		surface.SetDrawColor(Diablos.TS.Colors.drawColor)
		surface.DrawRect(0, 0 + relativePos, sizeX, sizeH)

		draw.SimpleText(Diablos.TS:GetLanguageString("dumbbellDraw"), "Diablos:Font:TS:60", sizeX / 2, 10 + relativePos, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

		draw.SimpleText(string.format("%4.2f %s", weightValue, Diablos.TS:GetWeightText()), "Diablos:Font:TS:45:I", sizeX / 2, sizeH - 10 + relativePos, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	cam.End3D2D()


	ang:RotateAroundAxis(ang:Right(), 180)

	cam.Start3D2D(pos + Vector(0, 12.5, 35), ang, .05)

		draw.SimpleText(Diablos.TS:GetLanguageString("dumbbellDraw"), "Diablos:Font:TS:60", sizeX / 2, 10 + relativePos, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

		draw.SimpleText(string.format("%4.2f %s", weightValue, Diablos.TS:GetWeightText()), "Diablos:Font:TS:45:I", sizeX / 2, sizeH - 10 + relativePos, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	cam.End3D2D()
end

function ENT:DrawTranslucent()
	self:Draw()
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_weigh_balance/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()

end
--PATH addons/the_perfect_training_system/lua/entities/diablos_weigh_television/shared.lua:
ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
ENT.PrintName		= "Weigh Television"
ENT.Category		= "Diablos Addon"
ENT.Instructions	= ""
ENT.Spawnable		= true


function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "ActivePlayer")
end

--PATH lua/entities/drg_roach_des_fka.lua:
if not DrGBase then return end
ENT.Base = "drg_roach_ds1_base"

game.AddParticles("particles/desfka.pcf")
	PrecacheParticleSystem("desfka_charge")
	PrecacheParticleSystem("desfka_postcharge")

-- Editables --
ENT.PrintName = "Old King Allant"
ENT.Category = "Demon's Souls"
ENT.Models = {"models/roach/des/allant.mdl"}
ENT.CollisionBounds = Vector(15, 15, 90)
ENT.SpawnHealth = 5967*2
ENT.MeleeAttackRange = 512
ENT.RangeAttackRange = 2048
ENT.Factions = {"FACTION_DES_DEMON"}
ENT.EyeBone = "c7230 Head"
ENT.PossessionBinds = {
	[IN_ATTACK] = {{coroutine = true,onkeydown = function(self)
		self.MeleeAttackRange = 200
		if not self:IsRunning() then
			self:DS1_Melee()
		else
			self:DS1_Seq("charge_3")
		end
	end}},
	[IN_ATTACK2] = {{coroutine = true,onkeydown = function(self)
		local ply = self:GetPossessor()
		
		if ply:KeyDown(IN_MOVERIGHT) then self:Dodge(nil,1)
		elseif ply:KeyDown(IN_MOVELEFT) then self:Dodge(nil,2)
		elseif ply:KeyDown(IN_BACK) then self:Dodge(nil,3)
		-- elseif ply:KeyDown(IN_FORWARD) then self:Dodge(nil,4)
		else 
			self:Dodge(nil,4)
			-- self:DS1_Seq("charge_1")
				-- while ply:KeyDown(IN_ATTACK2) do self:PlaySequenceAndMove("charge_2",1,self.PossessionFaceForward) end --coroutine.yield() end
			-- self:DS1_Seq("charge_3")
		end
	end}},
	[IN_RELOAD] = {{coroutine = true,onkeydown = function(self)self:DS1_Seq("att_grab")end}},
	[IN_JUMP] = {{coroutine = true,onkeydown = function(self)self:Jump(450)end}},
}
ENT.HPBarOffset = 15
ENT.HPBarScale = 0.4
ENT.SoundDisp = 90
ENT.SoundDispMoving = 100

if SERVER then
ENT.SOUND_EVTTABLE = {
	["dodge"] = {"roach/ds1/gargoyle/c5350_jump.wav.mp3",0,150},
	["step"] = {"roach/ds1/main/foot-stone-w",3,100,function(self)
		self:EmitSound("roach/ds1/main/body-lobe-"..math.random(5)..".wav.mp3",70)
	end},
	["down"] = {"roach/ds1/main/downs.wav.mp3"},
	["vox_pain"] = {"",0,100,function(self)
		self:EmitSound("roach/ds1/jareel/c5300_v_damage"..math.random(4)..".wav.mp3",511)
	end},
	["vox_death"] = {"",0,100,function(self)
		self:EmitSound("roach/ds1/jareel/c5300_v_dead.wav.mp3",511)
	end},
	["down_knee"] = {"roach/ds1/main/downs-knee.WAV.mp3"},
	["swing"] = {"roach/ds1/jareel/c5300_weapon_swing.wav.mp3",0,100,function(self)
		self:EmitSound("roach/ds1/jareel/c5300_v_attack"..math.random(2)..".wav.mp3",511)
	end},
	["swing_hand"] = {"roach/ds1/manus/c4500_jump.wav.mp3",0,100,function(self)self:StopParticles()end},
	["vox_attack_tame"] = {"",0,100,function(self)
		self:EmitSound("roach/ds1/jareel/c5300_v_tame"..math.random(3)..".wav.mp3",511)
	end},
	["vox_laugh"] = {"",0,100,function(self)
		self:Timer(1,self.EmitSound,"roach/ds1/jareel/c5300_v_hahaa.wav.mp3",511)
	end},
	["kill_pre"] = {"roach/ds1/main/kill-pre.wav.mp3"},
	["s20169"] = {"roach/ds1/main/s20169.wav.mp3"},
	["c2250_blood"] = {"roach/ds1/main/c2250_blood_slower.wav.mp3"},
	["land"] = {"roach/ds1/main/body-lobe-rolling.wav.mp3"},
	["zimen"] = {"roach/ds1/jareel/c5300_weapon_zimen.wav.mp3"},
	["vox_charge"] = {"",0,100,function(self)
		self:EmitSound("roach/ds1/jareel/c5300_v_charge.wav.mp3",511)
	end},
}
ENT.JumpAnimation = "glide"
ENT.IdleAnimation = "idle"
ENT.WalkAnimation = "walk_all"
ENT.RunAnimation = "charge_2"

ENT.SetupDamage = 18
ENT.SetupType = DMG_SLASH
ENT.HitSnds = {"roach/ds1/main/damage1.wav.mp3","roach/ds1/main/damage2.wav.mp3","roach/ds1/main/damage3.wav.mp3"}
ENT.StrafeMin = 128
ENT.StrafeMax = 256
ENT.Parryable = false
function ENT:OnNewEnemy(enemy)
	self:CallInCoroutine(function(self)
		if self:IsInRange(enemy,self.MeleeAttackRange) then return end
		if not self:HasEnemy() then return end
		ParticleEffectAttach("ds3_dw_mist",PATTACH_POINT_FOLLOW,self,2)
		self:DS1_Seq("alert")
	end)
end
-- function ENT:PossessionControls(f,b,r,l)
	-- if self:IsMoving() then self:PossessionFaceForward() end
	-- local dir = self._DrGBasePossLast4DIR or ""
	-- if f and (dir == "" or dir == "N") then
		-- self:PossessionMoveForward()
		-- self._DrGBasePossLast4DIR = "N"
	-- elseif b and (dir == "" or dir == "S") then
		-- self:PossessionMoveBackward()
		-- self._DrGBasePossLast4DIR = "S"
	-- elseif r and (dir == "" or dir == "E") then
		-- self:PossessionMoveRight()
		-- self._DrGBasePossLast4DIR = "E"
	-- elseif l and (dir == "" or dir == "W") then
		-- self:PossessionMoveLeft()
		-- self._DrGBasePossLast4DIR = "W"
	-- else self._DrGBasePossLast4DIR = "" end
-- end
function ENT:OnUpdateAnimation()
	if !self.Ready or self:IsDead() or self:IsDown() then return end
	if !self:IsOnGround() then return self.JumpAnimation, 0.1
	elseif (self:IsMoving() and self.Charging) or (self:IsPossessed() and self:IsRunning()) then return self.RunAnimation, self.RunAnimRate
	elseif self:IsMoving() then return self.WalkAnimation, self.WalkAnimRate
	else return self.IdleAnimation, self.IdleAnimRate end
end
function ENT:DS1_Initialize()
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self.ColA = 255
	self.VFX_EVTTABLE = {
		["charge_1"]={"desfka_charge"},
		["charge_2"]={"desfka_postcharge"}
	}
end
function ENT:DS1_OnLand()end
function ENT:HandleAnimEvent(a,b,c,d,e)
	if e == "InvokeAttackBehaviour" then
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
		
		local pos = self:WorldSpaceCenter() + (self:GetForward()*150)
		self.Laser = self:CreateProjectile(nil, {}, "drg_roach_chester_arrow")
		self.Laser:SetPos(pos)
		self.Laser:SetNoDraw(true)
		if !self:IsPossessed() then
			self.Laser:AimAt(self:GetEnemy(), 1000)
		else
			local lockedOn = self:PossessionGetLockedOn()
			if IsValid(lockedOn) then 
				self.Laser:AimAt(lockedOn,1000)
			else
				self.Laser:AimAt(self:PossessorTrace().HitPos,1000)
			end
		end
		self.Laser.OnContact = function(laser,ent)
			local dmg = math.random(13,22)*math.Rand(2,3)
			laser:DealDamage(ent, dmg, DMG_DISSOLVE)
			SafeRemoveEntity(laser)
		end
		for i=1,10 do ParticleEffectAttach("ds3_boss_dissolve",PATTACH_ABSORIGIN_FOLLOW,self.Laser,0) end
	elseif e == "InvokeAttackBehaviour_Grab" then
		self.Dodging = true
		local enemy = self:GetClosestEnemy()
		if not self:IsInRange(enemy,self.MeleeAttackRange) then return end
		if util.IsValidRagdoll(enemy:GetModel()) then
			self:CICO(function()
				local dmg = DamageInfo() dmg:SetAttacker(self)
				local ragdoll = enemy:DrG_RagdollDeath(dmg)
				if not ragdoll:DrG_SearchBone("head") then return end
				self.actualragdoll = self:GrabRagdoll(ragdoll, "head", "grab")
				
				self:Timer(167/30,function()
					self:DropRagdoll(self.actualragdoll)
					self.actualragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
					self.actualragdoll:Fire("fadeandremove",1,15)
				end)
				self:PlaySequenceAndMove("att_grab_hit",1,self.PossessionFaceForward)
				self.Dodging = false
			end)
		end
	elseif e == "InvokeAttackBehaviour_Radial" then
		for i=1,20 do self:Timer(0.05,function()ParticleEffect("desfka_postcharge",self:GetPos(),Angle(0,0,0),nil)end)end
		self:EmitSound("roach/ds1/massofsouls_wisp/c3501_bomb.wav.mp3",511)
		local dtype = bit.bor(DMG_BLAST,DMG_CRUSH)
		local range = 300
		self:BlastAttack({
			damage = self.SetupDamage*(range/10),
			range=range,
			type = dtype,
		})
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
	elseif evt[1] == "ComboTransition" then
		if (self:IsPossessed() and self:GetPossessor():KeyDown(IN_ATTACK))
		or (not self:IsPossessed() and self:IsInRange(self:GetEnemy(),self.MeleeAttackRange)) then
			self:CICO(function()
				local seq = evt[2]
				self:DS1_Seq(seq,math.Rand(0.9,1.2))
			end)
		end
	elseif evt[1] == "SpawnOneShotFFX" then
		local fx = self.VFX_EVTTABLE[evt[2]]
		ParticleEffectAttach(fx[1],PATTACH_POINT_FOLLOW,self,0)
	end
end
function ENT:DS1_Melee(enemy)
	if self.Charging then
		self.SetupType = bit.bor(DMG_CRUSH,DMG_BLAST)
		self.SetupDamage = math.random(50,70)
		self:DS1_Seq("charge_3")
		self.MeleeAttackRange = 1024
		self.Charging = false
	else
		if not self:IsPossessed() and util.IsValidRagdoll(enemy:GetModel()) and math.random(4)==2 and self:IsInRange(enemy,150) then
			ParticleEffectAttach("ds3_dw_mist",PATTACH_POINT_FOLLOW,self,2)
			self:EmitSound("roach/ds1/main/s000012390.wav.mp3",100)
			self.MeleeAttackRange = 100
			self:DS1_Seq("att_grab")
			self.MeleeAttackRange = 1024
			self:StopParticles()
		else
			local m = math.random(7)
			self.SetupType = DMG_SLASH
			self.SetupDamage = math.random(30,40)
			if not self:IsPossessed() then self.MeleeAttackRange = 120 end
			self:DS1_Seq("att"..m)
			if not self:IsPossessed() then self.MeleeAttackRange = 1024 end
		end
	end
end
function ENT:DS1_Range(enemy)
	self.MeleeAttackRange = 120
	self:DS1_Seq("charge_1")
	self.Charging = true
end
function ENT:ShouldRun()return self.Charging end
function ENT:DS1_OnDodge(m,mat)
	if self.Charging then return end
	if self:IsPossessed() then mat=mat*5 end
	local dodgetbl = {[1]="dodge_r",[2]="dodge_l",[3]="dodge_b",[4]="dodge_f"}
	self:DS1_Seq(dodgetbl[m],{multiply=Vector(mat,mat,1)},function()
		if self:IsPossessed() then self:PossessionFaceForward()
		else self:FaceEnemy()end
	end)
end
function ENT:DS1_Strafe(enemy,mdirection)
	if self.Charging then return end
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
	
	if math.random(150) <= (10*(dmg:IsBulletDamage() and 1.5 or 3)) then
		self.Flinching = true
		if dmg:IsDamageType(DMG_BURN) then 
			self:EmitSound("roach/ds1/main/burning.wav.mp3",100)
			for i=1,math.random(5,10) do ParticleEffect("burning_character",self:GetBonePosition(math.random(1,self:GetBoneCount()-1)),self:GetAngles(),self)end
			self:Timer(0.5,self.StopParticles)
		else if #self.HitSnds==1 then self:EmitSound(self.HitSnds[1],100)else self:EmitSound(self.HitSnds[math.random(#self.HitSnds)],100)end end
		self:CICO(function(self)
			self:DS1_Seq("flinch"..math.random(3))
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
--PATH lua/entities/drg_roach_des_tk.lua:
if not DrGBase then return end
ENT.Base = "drg_roach_ds1_base"

-- Editables --
ENT.PrintName = "Tower Knight"
ENT.Category = "Demon's Souls"
ENT.Models = {"models/roach/des/tk.mdl"}
ENT.CollisionBounds = Vector(100, 100, 250)
ENT.SpawnHealth = 1365*2
ENT.MeleeAttackRange = 300
ENT.Factions = {"FACTION_DES_DEMON"}
ENT.PossessionBinds = {[IN_ATTACK] = {{coroutine = true,onkeydown = function(self)self:DS1_Melee()end}}}
ENT.PossessionViews = {{offset = Vector(0, 90, 130),distance = 300},{offset = Vector(7.5, 0, 0),distance = 0,eyepos = true}}
ENT.HPBarOffset = 100
ENT.HPBarScale = 1.5
ENT.Blocking = true
ENT.BloodColor = BLOOD_COLOR_MECH

if SERVER then
ENT.SOUND_EVTTABLE = {
	["step"] = {"",0,100,function(self)
		self:EmitSound("roach/des/tk/step.wav",511)
		self:EmitSound("roach/des/tk/movement.wav",115)
		self:ScreenShake(1000,1000,(self:IsRunning() and 1 or 0.2),1000)
	end},
	["down"] = {"roach/des/tk/down.wav"},
	["down_knee"] = {"roach/des/tk/down_knee.wav"},
	["swing"] = {"roach/des/tk/swing.wav"},
	["zimen"] = {"roach/ds1/jareel/c5300_weapon_zimen.wav.mp3",0,100,function(self)ParticleEffect("ds3_watcher_impact",self:LocalToWorld(Vector(400,0,0)),Angle(0,0,0),nil)end},
	["pullout"] = {"roach/des/oh/weapon_pullout.wav",0,70,function(self)ParticleEffect("ds3_watcher_dirt_kickup",self:LocalToWorld(Vector(400,0,0)),Angle(0,0,0),nil)end},
	["slam"] = {"roach/des/oh/kickup.wav",0,90,function(self)
		ParticleEffect("ds3_watcher_dirt_kickup",self:LocalToWorld(Vector(100,0,0)),Angle(0,0,0),nil)
		ParticleEffect("ds3_watcher_dirt_kickup",self:LocalToWorld(Vector(100,-80,0)),Angle(0,0,0),nil)
		ParticleEffect("ds3_watcher_dirt_kickup",self:LocalToWorld(Vector(100,80,0)),Angle(0,0,0),nil)
	end},
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
ENT.SoundDisp = 511
ENT.SoundDispMoving = 511
function ENT:DS1_Initialize()
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self.ColA = 255
end
function ENT:DS1_OnLand()
	-- self:PlaySequenceAndMove("land")
end
function ENT:DS1_EventHook(e)end
function ENT:DS1_Melee(enemy)
	local m = math.random(4)
	self.SetupDamage = math.random(30,40)
	self.SetupType = (m==4 and bit.bor(DMG_CRUSH,DMG_BLAST) or DMG_CRUSH)
	self.MeleeAttackRange = (m%2==1 and 200 or 500)
	self:DS1_Seq("att"..m)
	self.MeleeAttackRange = 300
end
function ENT:DS1_Range(enemy)return self:DS1_Melee(enemy) end
function ENT:DS1_OnDodge(m,mat)
	self:DS1_Seq("dodge_b",{multiply=Vector(mat,mat,1)},function()
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
	if dmg:GetAttacker():IsPlayer() then
		-- local trace = util.TraceHull({
			-- start=dmg:GetAttacker():WorldSpaceCenter(),
			-- endpos=dmg:GetDamagePosition(),
			-- filter=dmg:GetAttacker(),
			-- ignoreworld=true,
			-- mins=Vector(-10,-10,-10),maxs=Vector(10,10,10)
		-- })
		local trace = dmg:GetAttacker():GetEyeTrace()
		print(trace.HitBox)
		if trace.HitBox == 33 then dmg:ScaleDamage(0.1) else dmg:ScaleDamage(1) end
	end
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
			self.Dodging = true
			self:PlaySequenceAndMove("flinch_blast")
			self.Flinching = false
			self.Dodging = false
		end)
	elseif math.random(600) <= (5*(dmg:IsBulletDamage() and 3 or 9)) then
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
--PATH lua/entities/drgbase_nextbot/animations.lua:

-- Convars --

local DebugAnims = CreateConVar("drgbase_debug_animations", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

-- Getters/setters --

function ENT:GetAnimInfoSequence(seq)
	if isstring(seq) then seq = self:LookupSequence(seq)
	elseif not isnumber(seq) then return {} end
	if seq == -1 then return {} end
	local seqName = self:GetSequenceName(seq)
	local seqInfo = self:GetSequenceInfo(seq)
	for i, anim in ipairs(seqInfo.anims) do
		local info = self:GetAnimInfo(anim)
		if info.label == "@"..seqName or info.label == "a_"..seqName then
			return info
		end
	end
end

function ENT:GetActivityIDFromName(name)
	if isnumber(self._DrGBaseActIDsFromNames[name]) then
		return self._DrGBaseActIDsFromNames[name]
	else
		for i in pairs(self:GetSequenceList()) do
			if self:GetSequenceActivityName(i) == name then
				local id = self:GetSequenceActivity(i)
				self._DrGBaseActIDsFromNames[name] = id
				return id
			end
		end
		self._DrGBaseActIDsFromNames[name] = ACT_INVALID
		return ACT_INVALID
	end
end

-- Functions --

function ENT:SelectRandomSequence(anim)
	return self:SelectWeightedSequenceSeeded(anim, math.random(0, 255))
end

function ENT:SequenceEvent(seq, cycles, callback, ...)
	if istable(seq) then
		for i, se in ipairs(seq) do
			self:SequenceEvent(se, cycles, callback)
		end
	elseif isstring(seq) then seq = self:LookupSequence(seq)
	elseif not isnumber(seq) then return end
	if seq == -1 then return end
	self._DrGBaseSequenceEvents[seq] = self._DrGBaseSequenceEvents[seq] or {}
	local event = self._DrGBaseSequenceEvents[seq]
	if isnumber(cycles) then cycles = {cycles} end
	local args, n = table.DrG_Pack(...)
	for i, cycle in ipairs(cycles) do
		event[cycle] = event[cycle] or {}
		table.insert(event[cycle], {
			callback = callback, args = args, n = n
		})
	end
end
function ENT:ClearSequenceEvents(seq)
	if istable(seq) then
		for i, se in ipairs(seq) do self:ClearSequenceEvents(se) end
	elseif isstring(seq) or isnumber(seq) then
		if isstring(seq) then seq = self:LookupSequence(seq)
		elseif not isnumber(seq) then return end
		self._DrGBaseSequenceEvents[seq] = nil
	else self._DrGBaseSequenceEvents = {} end
end

function ENT:AddAnimEvent(seq, frames, event)
	if istable(seq) then
		for i, se in ipairs(seq) do self:AddAnimEvent(se, frames, event) end
	elseif isstring(seq) then seq = self:LookupSequence(seq)
	elseif not isnumber(seq) then return end
	if seq == -1 then return end
	local info = self:GetAnimInfoSequence(seq)
	if not isnumber(info.numframes) then return end
	if not istable(frames) then frames = {frames} end
	for i, frame in ipairs(frames) do
		self:SequenceEvent(seq, frame/(info.numframes-1), function(self)
			self:OnAnimEvent(event, -1, self:GetPos(), self:GetAngles())
		end)
	end
end

function ENT:DirectPoseParametersAt(pos, pitch, yaw, center)
	if not isstring(yaw) then
		return self:DirectPoseParametersAt(pos, pitch.."_pitch", pitch.."_yaw", yaw)
	elseif isentity(pos) then pos = pos:WorldSpaceCenter() end
	if isvector(pos) then
		center = center or self:WorldSpaceCenter()
		local angle = (pos - center):Angle()
		self:SetPoseParameter(pitch, math.AngleDifference(angle.p, self:GetAngles().p))
		self:SetPoseParameter(yaw, math.AngleDifference(angle.y, self:GetAngles().y))
	else
		self:SetPoseParameter(pitch, 0)
		self:SetPoseParameter(yaw, 0)
	end
end

-- Hooks --

function ENT:OnAnimEvent() end

-- Handlers --

function ENT:_InitAnimations()
	if SERVER then
		self._DrGBaseCurrentGestures = {}
		self._DrGBasePoseParameters = {}
		for i = 0, (self:GetNumPoseParameters()-1) do
			self._DrGBasePoseParameters[self:GetPoseParameterName(i)] = true
		end
	end
	self._DrGBaseActIDsFromNames = {}
	self._DrGBasePreviousSequence = self:GetSequence()
	self._DrGBaseLastAnimCycle = 0
	self._DrGBaseSequenceEvents = {}
end

function ENT:_HandleAnimations()
	local current = self:GetSequence()
	if self:GetSequence() ~= self._DrGBasePreviousSequence then
		self._DrGBasePreviousSequence = current
		self._DrGBaseLastAnimCycle = 0
		self:_PlaySequenceEvents(current, 0, 0)
	else self:_PlaySequenceEvents(current, self:GetCycle(), self._DrGBaseLastAnimCycle) end
	self._DrGBaseLastAnimCycle = self:GetCycle()
end

function ENT:_PlaySequenceEvents(seq, currCycle)
	local events = self._DrGBaseSequenceEvents[seq]
	for cycle, event in pairs(istable(events) and events or {}) do
		if (currCycle > cycle and self._DrGBaseLastAnimCycle <= cycle) or
		(currCycle < self._DrGBaseLastAnimCycle and currCycle >= cycle) or
		(currCycle < self._DrGBaseLastAnimCycle and self._DrGBaseLastAnimCycle <= cycle) then
			for _, todo in ipairs(event) do todo.callback(self, table.DrG_Unpack(todo.args, todo.n)) end
		end
	end
end

if SERVER then

	local function SeqHasTurningWalkframes(self, seq)
		local success, _, angles = self:GetSequenceMovement(seq, 0, 1)
		return success and angles.y ~= 0
	end

	local function CallOnAnimChange(self, old, new)
		return self:OnAnimChange(self:GetSequenceName(old), self:GetSequenceName(new))
	end
	local function CallOnAnimChanged(self, old, new)
		if not isfunction(self.OnAnimChanged) then return end
		self:ReactInCoroutine(function(self)
			self:OnAnimChanged(self:GetSequenceName(old), self:GetSequenceName(new), delay)
		end)
	end

	local function ResetSequence(self, seq)
		local len = self:SetSequence(seq)
		self:ResetSequenceInfo()
		self:SetCycle(0)
		return len
	end

	-- Getters/setters --

	function ENT:IsPlayingAnimation()
		return isnumber(self._DrGBasePlayingAnimation)
	end

	function ENT:IsPlayingSequence(seq)
		if isstring(seq) then seq = self:LookupSequence(seq)
		elseif not isnumber(seq) then return false end
		if seq == -1 then return false end
		if self._DrGBasePlayingAnimation == seq then return true end
		if self._DrGBaseCurrentGestures[seq] then return true end
		return false
	end

	function ENT:IsPlayingActivity(act)
		if not isnumber(self._DrGBasePlayingAnimation) then return false end
		return self:GetSequenceActivity(self._DrGBasePlayingAnimation) == act
	end

	-- Functions --

	function ENT:PlaySequenceAndWait(seq, rate, callback)
		if self._DrGBaseDisablePSAW then return end
		if isstring(seq) then seq = self:LookupSequence(seq)
		elseif not isnumber(seq) then return end
		if seq == -1 then return end
		local current = self:GetSequence()
		if seq == self:GetSequence() or CallOnAnimChange(self, current, seq) ~= false then
			self._DrGBasePlayingAnimation = seq
			ResetSequence(self, seq)
			self:SetPlaybackRate(rate or 1)
			local now = CurTime()
			local lastCycle = -1
			while seq == self:GetSequence() do
				local cycle = self:GetCycle()
				if lastCycle > cycle then break end
				if lastCycle == cycle and cycle == 1 then break end
				lastCycle = cycle
				if isfunction(callback) then
					self._DrGBaseDisablePSAW = true
					local res = callback(self, cycle)
					self._DrGBaseDisablePSAW = false
					if res then break end
				end
				self:YieldCoroutine(false)
			end
			self._DrGBasePlayingAnimation = nil
			self:Timer(0, function()
				self:UpdateAnimation()
				self:UpdateSpeed()
			end)
			return CurTime() - now
		end
	end
	function ENT:PlayActivityAndWait(act, rate, callback)
		local seq = self:SelectRandomSequence(act)
		return self:PlaySequenceAndWait(seq, rate, callback)
	end
	function ENT:PlayAnimationAndWait(anim, rate, callback)
		if isstring(anim) then return self:PlaySequenceAndWait(anim, rate, callback)
		elseif isnumber(anim) then return self:PlayActivityAndWait(anim, rate, callback) end
	end

	function ENT:PlaySequenceAndMove(seq, options, callback)
		if isstring(seq) then seq = self:LookupSequence(seq)
		elseif not isnumber(seq) then return end
		if seq == -1 then return end
		if isnumber(options) then options = {rate = options}
		elseif not istable(options) then options = {} end
		if options.gravity == nil then options.gravity = true end
		if options.collisions == nil then options.collisions = true end
		local previousCycle = 0
		local previousPos = self:GetPos()
		local res = self:PlaySequenceAndWait(seq, options.rate, function(self, cycle)
			local success, vec, angles = self:GetSequenceMovement(seq, previousCycle, cycle)
			local collided = false
			if success then
				if isvector(options.multiply) then
					vec = Vector(vec.x*options.multiply.x, vec.y*options.multiply.y, vec.z*options.multiply.z)
				end
				vec:Rotate(self:GetAngles() + angles)
				self:SetAngles(self:LocalToWorldAngles(angles))
				local tr = self:TraceHull(vec, {step = self:IsOnGround()})
				if not options.collisions or not tr.Hit then
					if not options.gravity then
						previousPos = previousPos + vec*self:GetModelScale()
						self:SetPos(previousPos)
					elseif not vec:IsZero() then
						previousPos = self:GetPos() + vec*self:GetModelScale()
						self:SetPos(previousPos)
					else previousPos = self:GetPos() end
				else
					collided = true
					if IsValid(tr.Entity) then
						self:OnContact(tr.Entity)
					end
					if options.stoponcollide then return true
					elseif options.gravityoncollide then options.gravity = true
					elseif not options.gravity then
						self:SetPos(previousPos)
					end
				end
			end
			previousCycle = cycle
			if isfunction(callback) then return callback(self, cycle, collided) end
		end)
		if not options.gravity then
			self:SetPos(previousPos)
			self:SetVelocity(Vector(0, 0, 0))
		end
		return res
	end
	function ENT:PlayActivityAndMove(act, options, callback)
		local seq = self:SelectRandomSequence(act)
		return self:PlaySequenceAndMove(seq, options, callback)
	end
	function ENT:PlayAnimationAndMove(anim, options, callback)
		if isstring(anim) then return self:PlaySequenceAndMove(anim, options, callback)
		elseif isnumber(anim) then return self:PlayActivityAndMove(anim, options, callback) end
	end

	function ENT:PlaySequenceAndMoveAbsolute(seq, options, callback)
		if isnumber(options) then
			return self:PlaySequenceAndMove(seq, {
				rate = options, gravity = false, collisions = false
			}, callback)
		else
			options = options or {}
			options.gravity = false
			options.collisions = false
			return self:PlaySequenceAndMove(seq, options, callback)
		end
	end
	function ENT:PlayActivityAndMoveAbsolute(act, options, callback)
		local seq = self:SelectRandomSequence(act)
		return self:PlaySequenceAndMoveAbsolute(seq, options, callback)
	end
	function ENT:PlayAnimationAndMoveAbsolute(anim, options, callback)
		if isstring(anim) then return self:PlaySequenceAndMoveAbsolute(anim, options, callback)
		elseif isnumber(anim) then return self:PlayActivityAndMoveAbsolute(anim, options, callback) end
	end

	function ENT:PlaySequence(seq, rate, callback)
		if isstring(seq) then seq = self:LookupSequence(seq)
		elseif not isnumber(seq) then return end
		if seq == -1 then return end
		rate = isnumber(rate) and rate or 1
		if self._DrGBaseCurrentGestures[seq] then return end
		local duration = self:SequenceDuration(seq)/rate
		local layerID = self:AddGestureSequence(seq)
		if layerID == -1 then return 0 end
		self._DrGBaseCurrentGestures[seq] = true
		self:SetLayerPlaybackRate(layerID, rate)
		coroutine.DrG_Create(function()
			local lastCycle = 0
			while IsValid(self) do
				local cycle = self:GetLayerCycle(layerID)
				if cycle < lastCycle then break end
				--if cycle == lastCycle and cycle == 1 then break end
				self:_PlaySequenceEvents(seq, cycle, lastCycle)
				if not isfunction(callback) or
				not callback(self, cycle, layerID) then
					lastCycle = cycle
					coroutine.yield()
				else break end
			end
			if IsValid(self) then
				self._DrGBaseCurrentGestures[seq] = nil
			end
		end)
		return duration
	end
	function ENT:PlayActivity(act, rate, callback)
		local seq = self:SelectRandomSequence(act)
		return self:PlaySequence(seq, rate, callback)
	end
	function ENT:PlayAnimation(anim, rate, callback)
		if isstring(anim) then return self:PlaySequence(anim, rate, callback)
		elseif isnumber(anim) then return self:PlayActivity(anim, rate, callback) end
	end

	local function PlayClosestClimbSequence(self, seqs, height, rate, callback)
		local climbs = {}
		for _, seq in ipairs(seqs) do
			if isstring(seq) then seq = self:LookupSequence(seq)
			elseif not isnumber(seq) then continue end
			if seq == -1 then continue end
			local success, vec = self:GetSequenceMovement(seq, 0, 1)
			if not success then continue end
			table.insert(climbs, {seq = seq, height = vec.z})
		end
		table.sort(climbs, function(climb1, climb2)
			return climb1.height < climb2.height
		end)
		height = height/self:GetModelScale()
		for i, climb in ipairs(climbs) do
			local prior = climbs[i-1]
			if height < climb.height then
				return self:PlayClimbSequence(climb.seq, height*self:GetModelScale(), rate, callback)
			elseif prior ~= nil and math.Clamp(height, prior.height, climb.height) == height then
				local avg = (prior.height + climb.height)/2
				if height < avg then
					return self:PlayClimbSequence(prior.seq, height*self:GetModelScale(), rate, callback)
				else return self:PlayClimbSequence(climb.seq, height*self:GetModelScale(), rate, callback) end
			elseif climbs[i+1] == nil then
				return self:PlayClimbSequence(climb.seq, height*self:GetModelScale(), rate, callback)
			end
		end
	end
	function ENT:PlayClimbSequence(seq, height, rate, callback)
		if not istable(seq) then
			if isstring(seq) then seq = self:LookupSequence(seq)
			elseif not isnumber(seq) then return end
			if seq == -1 then return end
			local success, vec = self:GetSequenceMovement(seq, 0, 1)
			if not success then return end
			return self:PlaySequenceAndMoveAbsolute(seq, {
				rate = rate,
				multiply = Vector(1, 1, height/vec.z/self:GetModelScale()),
			}, function(self, cycle)
				if not self:TraceHull(self:GetForward()*self.LedgeDetectionDistance*2).Hit then return true end
				if isfunction(callback) then return callback(self, cycle) end
			end)
		else return PlayClosestClimbSequence(self, seq, height, rate, callback) end
	end
	function ENT:PlayClimbActivity(act, height, rate, callback)
		local seq = self:SelectRandomSequence(act)
		return self:PlayClimbSequence(seq, height, rate, callback)
	end
	function ENT:PlayClimbAnimation(anim, height, rate, callback)
		if isstring(anim) then self:PlayClimbSequence(anim, height, rate, callback)
		elseif isnumber(anim) then self:PlayClimbActivity(anim, height, rate, callback) end
	end

	-- Update --

	function ENT:UpdateAnimation()
		if self:IsPlayingAnimation() then return end
		if self:IsAIDisabled() and
		not self:IsPossessed() and
		DebugAnims:GetBool() then return end
		local anim, rate = self:OnUpdateAnimation()
		if isstring(anim) and string.StartWith(anim, "ACT_") then
			anim = self:GetActivityIDFromName(anim)
		end
		local current = self:GetSequence()
		local validAnim = false
		if isnumber(anim) then
			local seq = self:SelectRandomSequence(anim)
			validAnim = seq ~= -1
			local activity = self:GetSequenceActivity(current)
			if validAnim and (self:GetCycle() == 1 or anim ~= activity) then
				if CallOnAnimChange(self, current, seq) ~= false then
					CallOnAnimChanged(self, current, seq)
					ResetSequence(self, seq)
				end
			end
		elseif isstring(anim) then
			local seq = self:LookupSequence(anim)
			validAnim = seq ~= -1
			if validAnim and (self:GetCycle() == 1 or seq ~= current) then
				if CallOnAnimChange(self, current, seq) ~= false then
					CallOnAnimChanged(self, current, seq)
					ResetSequence(self, seq)
				end
			end
		end
		if validAnim and
		((not self:IsMoving() or self:GetSequenceGroundSpeed(self:GetSequence()) == 0) and
		(not self:IsTurning() or not SeqHasTurningWalkframes(self, self:GetSequence()))) then
			self:SetPlaybackRate(rate or 1)
		end
	end
	function ENT:OnUpdateAnimation()
		if self:IsDown() or self:IsDead() then return end
		if self:IsClimbingUp() then return self.ClimbUpAnimation, self.ClimbAnimRate
		elseif self:IsClimbingDown() then return self.ClimbDownAnimation, self.ClimbAnimRate
		elseif not self:IsOnGround() then return self.JumpAnimation, self.JumpAnimRate
		elseif self:IsRunning() then return self.RunAnimation, self.RunAnimRate
		elseif self:IsMoving() then return self.WalkAnimation, self.WalkAnimRate
		else return self.IdleAnimation, self.IdleAnimRate end
	end

	-- Hooks

	function ENT:OnAnimChange() end
	--function ENT:OnAnimChanged() end

	function ENT:BodyUpdate()
		self:BodyMoveXY()
	end

	function ENT:HandleAnimEvent(event, _, _, _, options)
		self:OnAnimEvent(options, event, self:GetPos(), self:GetAngles())
	end

	-- Handlers --

	-- Meta --

	local nextbotMETA = FindMetaTable("NextBot")

	local old_BodyMoveXY = nextbotMETA.BodyMoveXY
	function nextbotMETA:BodyMoveXY(options)
		if self.IsDrGNextbot then
			if self.IsDrGNextbotSprite then return end
			options = options or {}
			if options.rate == nil then options.rate = true end
			if options.direction == nil then options.direction = true end
			if options.frameadvance ~= false then self:FrameAdvance() end
			local seq = self:GetSequence()
			if not self:IsPlayingAnimation() and
			(self:IsMoving() or (self:IsTurning() and SeqHasTurningWalkframes(self, seq))) then
				if options.direction and self:IsMoving() then
					if self._DrGBasePoseParameters["move_x"] or
					self._DrGBasePoseParameters["move_y"] then
						local movement = self:GetMovement(true)
						self:SetPoseParameter("move_x", movement.x)
						self:SetPoseParameter("move_y", movement.y)
					end
					if self._DrGBasePoseParameters["move_yaw"] then
						local forward = self:GetForward()
						local velocity = self:GetVelocity()
						forward.z = 0
						velocity.z = 0
						local forwardAng = forward:Angle()
						local velocityAng = velocity:Angle()
						self:SetPoseParameter("move_yaw", math.AngleDifference(velocityAng.y, forwardAng.y))
					end
				end
				if options.rate and not self:IsPlayingAnimation() and
				self:IsOnGround() and not self:IsClimbing() then
					local velocity = self:GetVelocity()
					velocity.z = 0
					if not velocity:IsZero() then
						local speed = velocity:Length()
						local seqspeed = self:GetSequenceGroundSpeed(seq)
						if seqspeed ~= 0 then self:SetPlaybackRate(speed/seqspeed) end
					elseif self:IsTurning() then
						local success, _, angles = self:GetSequenceMovement(seq, 0, 1)
						if success and angles.y ~= 0 then
							local seqspeed = math.abs(angles.y)/self:SequenceDuration(seq)
							local turnspeed = math.abs(self:GetAngles().y-self._DrGBaseLastAngle.y)/0.1
							if seqspeed ~= 0 then self:SetPlaybackRate(turnspeed/seqspeed) end
						end
					end
				end
			end
		else return old_BodyMoveXY(self) end
	end

	local old_GetActivity = nextbotMETA.GetActivity
	function nextbotMETA:GetActivity()
		if self.IsDrGNextbot then
			return self:GetSequenceActivity(self:GetSequence())
		else return old_GetActivity(self) end
	end

	local old_StartActivity = nextbotMETA.StartActivity
	function nextbotMETA:StartActivity(act)
		if self.IsDrGNextbot then
			local seq = self:SelectRandomSequence(act)
			if seq == -1 then return false end
			self:ResetSequence(seq)
			return true
		else return old_StartActivity(self, act) end
	end

else

	-- Getters/setters --

	-- Functions --

	-- Hooks --

	function ENT:FireAnimationEvent(pos, angle, event, name)
		self:OnAnimEvent(name, event, pos, angle)
	end

	-- Handlers --

end

--PATH lua/entities/drgbase_nextbot_sprite/shared.lua:
ENT.Base = "drgbase_nextbot"
ENT.IsDrGNextbotSprite = true

-- Misc --
ENT.Models = {"models/props_lab/blastdoor001a.mdl"}
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

-- Animations --
DrGBase.IncludeFile("animations.lua")
ENT.SpriteFolder = ""
ENT.FramesPerSecond = 10
ENT.WalkAnimation = "walk"
ENT.RunAnimation = "run"
ENT.IdleAnimation = "idle"
ENT.JumpAnimation = "jump"

-- Movements --
ENT.WalkSpeed = 100
ENT.RunSpeed = 200

-- Climbing --
ENT.ClimbUpAnimation = "climb"
ENT.ClimbDownAnimation = "climb"
ENT.ClimbOffset = Vector(-10, 0, 0)

-- Detection --
ENT.SightFOV = 360

-- Misc --

function ENT:IsAttack(anim)
	if self:GetNW2Bool("DrGBaseAnimAttacks/"..anim) then return true
	else return string.find(string.lower(anim), "attack") ~= nil end
end

if SERVER then
	AddCSLuaFile()

	-- Movements --

	function ENT:UpdateSpeed()
		local speed = self:OnUpdateSpeed()
		if isnumber(speed) then self:SetSpeed(math.Clamp(speed, 0, math.huge)) end
	end

	-- Misc --

	function ENT:IsAttacking()
		return self:IsAttack(self:GetSpriteAnim())
	end
	function ENT:SetAttack(anim, attack)
		self:SetNW2Bool("DrGBaseAnimAttacks/"..anim, attack)
	end

	function ENT:SequenceAttack() end
	function ENT:SpriteAnimAttack(anim, frame, attack, callback)
		if istable(anim) then
			for i, anim in ipairs(anim) do self:SetAttack(anim, true) end
		else self:SetAttack(anim, true) end
		self:SpriteAnimEvent(anim, frame, function(self)
			self:Attack(attack, callback)
		end)
	end

else

	local function DrawSprite(self, anim)
		local height = self:Height()
		local pos = self:GetPos() + Vector(0, 0, height/2)
		local sprite = self:GetSpriteFolder()..anim..self:GetSpriteFrame()..".png"
		render.DrG_DrawSprite(sprite, pos, height, {
			origin = self:IsPossessedByLocalPlayer() and self:GetPos()-self:PossessorForward(),
			color = self:GetColor(), lighting = true, flip = self:ShouldFlipSprite()
		})
	end
	function ENT:ShouldFlipSprite() return false end

	function ENT:DrawTranslucent()
		if DrGBase.INFO_TOOL.Viewcam then
			local selected = LocalPlayer():DrG_GetSelectedEntities()[1]
			if selected == self then return end
		end
		if self:ShouldDraw() then
			local anim = self:GetSpriteAnim()
			if anim ~= "" then
				if self:SpriteAnim8Dir(anim) then
					DrawSprite(self, string.lower(self:CalcPosDirection(EyePos(), true)).."_"..anim)
				elseif self:SpriteAnim4Dir(anim) then
					DrawSprite(self, string.lower(self:CalcPosDirection(EyePos(), false)).."_"..anim)
				else DrawSprite(self, anim) end
			end
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

end

--PATH gamemodes/mangarp/entities/entities/drug/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Drugs"
ENT.Author = "Rickster"
ENT.Spawnable = false

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 1, "owning_ent")
end

hook.Add("Move", "DruggedPlayer", function(ply, mv)
    if not ply.isDrugged then return end

    mv:SetMaxSpeed(mv:GetMaxSpeed() * 2)
    mv:SetMaxClientSpeed(mv:GetMaxClientSpeed() * 2)

    if ply:IsOnGround() and mv:KeyPressed(IN_JUMP) then
        local vec = mv:GetVelocity()
        vec.z = 100 -- Adds on to the jump power
        mv:SetVelocity(vec)
    end
end)

--PATH gamemodes/mangarp/entities/entities/drug_lab/shared.lua:
ENT.Base = "lab_base"
ENT.PrintName = "Drug Lab"

function ENT:initVars()
    self.model = "models/props_lab/crematorcase.mdl"
    self.initialPrice = GAMEMODE.Config.druglabdrugcost
    self.labPhrase = DarkRP.getPhrase("drug_lab")
    self.itemPhrase = DarkRP.getPhrase("drugs")
    self.noIncome = true
    self.camMul = -39
end

--PATH addons/sl_main_system/lua/entities/ent_config_launch/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self.Entity:DrawModel()
end 
--PATH addons/sl_main_system/lua/entities/ent_config_launch/shared.lua:
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.PrintName = "[MAD] Lauch Entity"
ENT.Author = "Mad"
--PATH gamemodes/mangarp/entities/entities/fadmin_motd/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "fadmin MOTD"
ENT.Information = "Place this MOTD somewhere, freeze it and it will be saved automatically"
ENT.Author = "FPtje"
ENT.Spawnable = false

function ENT:CanTool(ply, trace, tool)
    if ply:IsAdmin() and tool == "remover" then
        self.CanRemove = true
        if SERVER then FAdmin.MOTD.RemoveMOTD(self, ply) end
        return true
    end
    return false
end

local PickupPos = Vector(1.8079, -0.6743, -62.3193)
function ENT:PhysgunPickup(ply)
    if ply:IsAdmin() and PickupPos:DistToSqr(self:WorldToLocal(ply:GetEyeTrace().HitPos)) < 49 then return true end
    return false
end

--PATH lua/entities/fruitorange/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Orange"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/orange.mdl")
	
end
--PATH lua/entities/fruitpear/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pear"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pear.mdl")
	
end
--PATH addons/gmod_info_board/lua/entities/gmib_blank_visual/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
  	self:DrawModel()
end

--PATH lua/entities/icecream1b/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Ice Cream (Neapolitan)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream_open1.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/letter/cl_init.lua:
include("shared.lua")

local frame
local SignButton

function ENT:Draw()
    self:DrawModel()
end

local function KillLetter(msg)
    hook.Remove("HUDPaint", "ShowLetter")
    frame:Remove()
end
usermessage.Hook("KillLetter", KillLetter)

local function ShowLetter(msg)
    if frame then
        frame:Remove()
    end

    local LetterMsg = ""
    local Letter = msg:ReadEntity()
    local LetterType = msg:ReadShort()
    local LetterPos = msg:ReadVector()
    local sectionCount = msg:ReadShort()
    local LetterY = ScrH() / 2 - 300
    local LetterAlpha = 255

    Letter:CallOnRemove("Kill letter HUD on remove", KillLetter)

    for k = 1, sectionCount, 1 do
        LetterMsg = LetterMsg .. msg:ReadString()
    end

    frame = vgui.Create("DFrame")
    frame:SetTitle("")
    frame:ShowCloseButton(false)

    SignButton = vgui.Create("DButton", frame)
    SignButton:SetText(DarkRP.getPhrase("sign_this_letter"))
    frame:SetPos(ScrW() - 256, ScrH() - 256)
    SignButton:SetSize(256, 256)
    frame:SetSize(256, 256)
    SignButton:SetSkin(GAMEMODE.Config.DarkRPSkin)
    frame:SizeToContents()
    frame:MakePopup()
    frame:SetKeyboardInputEnabled(false)

    function SignButton:DoClick()
        RunConsoleCommand("_DarkRP_SignLetter", Letter:EntIndex())
        SignButton:SetDisabled(true)
    end
    SignButton:SetDisabled(IsValid(Letter:Getsigned()))

    hook.Add("HUDPaint", "ShowLetter", function()
        if not Letter.dt then KillLetter() return end
        if LetterAlpha < 255 then
            LetterAlpha = math.Clamp(LetterAlpha + 400 * FrameTime(), 0, 255)
        end

        local font = (LetterType == 1 and "AckBarWriting") or "Default"

        draw.RoundedBox(2, ScrW() * .2, LetterY, ScrW() * .8 - (ScrW() * .2), ScrH(), Color(255, 255, 255, math.Clamp(LetterAlpha, 0, 200)))
        draw.DrawNonParsedText(LetterMsg .. "\n\n\n" .. DarkRP.getPhrase("signed", IsValid(Letter:Getsigned()) and Letter:Getsigned():Nick() or DarkRP.getPhrase("no_one")), font, ScrW() * .25 + 20, LetterY + 80, Color(0, 0, 0, LetterAlpha), 0)

        if LocalPlayer():GetPos():DistToSqr(LetterPos) > 10000 then
            LetterY = Lerp(0.1, LetterY, ScrH())
            LetterAlpha = Lerp(0.1, LetterAlpha, 0)
            if frame and frame.Close then frame:Close() end
            if math.Round(LetterAlpha) <= 10 then
                KillLetter()
            end
        end
    end)
end
usermessage.Hook("ShowLetter", ShowLetter)

--PATH gamemodes/mangarp/entities/entities/meteor/cl_init.lua:
ENT.Spawnable = false
ENT.AdminSpawnable = false

include("shared.lua")

language.Add("meteor", "meteor")

function ENT:Initialize()
    local mx, mn = self:GetRenderBounds()
    self:SetRenderBounds(mn + Vector(0,0,128), mx, 0)
    self.emitter = ParticleEmitter(LocalPlayer():GetShootPos())
end

local color_grey = Color(200, 200, 210)

function ENT:Think()
    local vOffset = self:LocalToWorld(VectorRand(-3, 3)) + VectorRand(-3, 3)
    local vNormal = (vOffset - self:GetPos()):GetNormalized()

    if not self.emitter then return end

    local particle = self.emitter:Add(Model("particles/smokey"), vOffset)
    particle:SetVelocity(vNormal * math.Rand(10, 30))
    particle:SetDieTime(2.0)
    particle:SetStartAlpha(math.Rand(50, 150))
    particle:SetStartSize(math.Rand(8, 16))
    particle:SetEndSize(math.Rand(32, 64))
    particle:SetRoll(math.Rand(-0.2, 0.2))
    particle:SetColor(color_grey)
end

function ENT:OnRemove()
    if IsValid(self.emitter) then
        self.emitter:Finish()
    end
end

--PATH gamemodes/mangarp/entities/entities/money_printer/shared.lua:
--Static Vars
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Printer"
ENT.Author = "DarkRP Developers"
ENT.Spawnable = false
ENT.sparking = false
ENT.IsMoneyPrinter = true

function ENT:initVars()
    self.MoneyCount = GAMEMODE.Config.mprintamount
    self.OverheatChance = GAMEMODE.Config.printeroverheatchance
    self.model = "models/props_c17/consolebox01a.mdl"
    self.damage = 100
    self.DisplayName = "Money Printer"
    self.MinTimer = 100
    self.MaxTimer = 350
    self.SeizeReward = GAMEMODE.Config.printerreward
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "price")
    self:NetworkVar("Entity", 0, "owning_ent")
end

DarkRP.hookStub{
    name = "moneyPrinterCatchFire",
    description = "Called when a money printer is about to catch fire.",
    parameters = {
        {
            name = "moneyprinter",
            description = "The money printer that is about to catch fire",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "prevent",
            description = "Set to true to prevent the money printer from catching fire",
            type = "boolean"
        }
    },
    realm = "Server"
}

DarkRP.hookStub{
    name = "moneyPrinterPrintMoney",
    description = "Called when a money printer is about to print money.",
    parameters = {
        {
            name = "moneyprinter",
            description = "The money printer that is about to print money",
            type = "Entity"
        },
        {
            name = "amount",
            description = "The amount to be printed",
            type = "number"
        }
    },
    returns = {
        {
            name = "prevent",
            description = "Set to true to prevent the money printer from printing the money.",
            type = "boolean"
        },
        {
            name = "amount",
            description = "Optionally override the amount of money that will be printed.",
            type = "number"
        }
    },
    realm = "Server"
}

DarkRP.hookStub{
    name = "moneyPrinterPrinted",
    description = "Called after a money printer is has printed money.",
    parameters = {
        {
            name = "moneyprinter",
            description = "The money printer",
            type = "Entity"
        },
        {
            name = "moneybag",
            description = "The moneybag produced by the printer.",
            type = "Entity"
        }
    },
    returns = {
    },
    realm = "Server"
}

--PATH addons/sl_main_system/lua/entities/npc_centipede.lua:

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
ENT.PrintName = "Centipede"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_centipedemob.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 8000
ENT.money = 300000
ENT.Damage = 200
ENT.SpawnHealth = 7500

ENT.WalkSpeed = 100
ENT.RunSpeed = 400

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

		-- Définir un délai d'attente aléatoire entre 1.5 et 3 secondes
		local attackDelay = math.random(15, 30) / 10

		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + attackDelay  -- Mettre à jour le cooldown avec le délai aléatoire

			if self:Health() < 1 then return end
			self:EmitSound(swing_attack[math.random(1, 3)], 75, math.random(70, 130), 0.8, CHAN_AUTO)

			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) and IsValid(enemy) then
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
				
				local pos = self:GetBonePosition(self:LookupBone("Bone_Centiped_001")) + Vector(0,0,self.HPBarOffset)
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

--PATH lua/entities/npc_drg_testnextbot.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Test Nextbot"
ENT.Category = "DrGBase"
ENT.Models = {"models/player/gman_high.mdl"}

-- AI --
ENT.BehaviourType = AI_BEHAV_BASE
ENT.RangeAttackRange = 100
ENT.MeleeAttackRange = 0
ENT.ReachEnemyRange = 100
ENT.AvoidEnemyRange = 25

-- Relationships --
ENT.DefaultRelationship = D_HT
ENT.Factions = {FACTION_GMAN}

-- Animations --
ENT.WalkAnimation = ACT_HL2MP_WALK
ENT.RunAnimation = ACT_HL2MP_RUN_FAST
ENT.IdleAnimation = ACT_HL2MP_IDLE
ENT.JumpAnimation = ACT_HL2MP_JUMP_KNIFE

-- Movements --
ENT.WalkSpeed = -1
ENT.RunSpeed = 300

-- Climbing --
ENT.ClimbLedges = true
ENT.ClimbProps = true
ENT.ClimbLedgesMaxHeight = 300
ENT.ClimbLadders = true
ENT.ClimbSpeed = 60
ENT.ClimbUpAnimation = ACT_ZOMBIE_CLIMB_UP
ENT.ClimbOffset = Vector(-14, 0, 0)

-- Detection --
ENT.EyeBone = "ValveBiped.Bip01_Head1"
ENT.EyeOffset = Vector(5, 0, 2.5)

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_8DIR
ENT.PossessionViews = {
	{
		offset = Vector(0, 30, 20),
		distance = 100
	},
	{
		offset = Vector(7.5, 0, 0),
		distance = 0,
		eyepos = true
	}
}
ENT.PossessionBinds = {
	[IN_JUMP] = {{
		coroutine = false,
		onkeydown = function(self)
			self:Jump(100)
		end
	}},
	[IN_ATTACK] = {{
		coroutine = false,
		onkeydown = function(self)
			self:PlaySequence("gesture_wave")
		end
	}},
	[IN_ATTACK2] = {{
		coroutine = false,
		onkeydown = function(self)
			self:EmitSlotSound("riseandshine", 7, "DrGBase.RiseAndShine")
		end
	}}
}

if SERVER then

	sound.Add({
		name = "DrGBase.RiseAndShine",
		sound = "vo/gman_misc/gman_riseshine.wav",
		channel = CHAN_VOICE,
		level = 60
	})

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetSelfClassRelationship(D_LI)
		self:SetPlayersRelationship(D_HT, 2)
		self:SetModelRelationship("models/props_c17/doll01.mdl", D_FR)
		self:SetModelRelationship("models/props_borealis/bluebarrel001.mdl", D_HT)
		for i, walk in ipairs({
			self.RunAnimation,
			self.WalkAnimation
		}) do
			self:SequenceEvent(self:SelectRandomSequence(walk), {0.28, 0.78}, function(self)
				self:EmitFootstep()
			end)
		end
		self.Mode = 0
	end
	function ENT:Use()
		self.Mode = (self.Mode+1)%2
		if self.Mode == 0 then
			DrGBase.Print("Default mode", {chat = true, color = DrGBase.CLR_GREEN})
			self.RangeAttackRange = 100
			self.MeleeAttackRange = 0
			self.ReachEnemyRange = 100
			self.AvoidEnemyRange = 25
		elseif self.Mode == 1 then
			DrGBase.Print("Projectile mode", {chat = true, color = DrGBase.CLR_GREEN})
			self.RangeAttackRange = 5000
			self.MeleeAttackRange = 0
			self.ReachEnemyRange = 4900
			self.AvoidEnemyRange = 0
		end
	end

	-- AI --

	function ENT:OnRangeAttack(enemy)
		if self.Mode == 0 then
			if self:IsMoving() then return end
			self:FaceTowards(enemy)
			self:PlaySequence("gesture_wave")
			self:EmitSlotSound("riseandshine", 7, "DrGBase.RiseAndShine")
		elseif self.Mode == 1 then
			if self:GetCooldown("Throw") > 0 then return end
			self:SetCooldown("Throw", 0.5)
			local proj = self:CreateProp("models/props_junk/watermelon01.mdl")
			if not IsValid(proj) then return end
			proj:SetPos(self:GetPos() + Vector(0, 0, self:Height()*1.1))
			proj:GetPhysicsObject():EnableGravity(true)
			proj:DrG_AimAt(enemy, 3000)
		end
	end

	function ENT:OnReachedPatrol()
		self:PlaySequenceAndWait("menu_gman")
	end

	-- Damage --

	function ENT:OnTakeDamage(dmg, hitgroup)
		local attacker = dmg:GetAttacker()
		if hitgroup == HITGROUP_HEAD then
			if not self:HasSpotted(attacker) then
				self:Kill(attacker, dmg:GetInflictor())
			end
		end
		self:SpotEntity(attacker)
	end
	function ENT:OnDeath(dmg, hitgroup)
		if self:IsClimbing() then return end
		if hitgroup ~= HITGROUP_HEAD then
			local deaths = {"death_01", "death_02", "death_03"}
			self:PlaySequenceAndWait(deaths[math.random(#deaths)])
		else self:PlaySequenceAndWait("death_04") end
	end

	-- Misc --

	function ENT:OnClimbing(ladder, left, down)
		if IsValid(ladder) then
			self:EmitSlotSound("DrGBaseLadderClimbing", 0.3, "player/footsteps/ladder"..math.random(4)..".wav")
		end
		return not down and left < 112.5
	end
	function ENT:OnStopClimbing(ladder, height, down)
		if down then return end
		local footstep = false
		self:PlayActivityAndMoveAbsolute(ACT_ZOMBIE_CLIMB_END, self.ClimbAnimRate, function(self, cycle)
			if cycle >= 0.875 and not footstep then
				footstep = true
				self:EmitFootstep()
			end
			if cycle > 0.5 or not IsValid(ladder) then return end
			self:EmitSlotSound("DrGBaseLadderClimbing", 0.3, "player/footsteps/ladder"..math.random(4)..".wav")
		end)
	end

	function ENT:OnRemove()
		self:StopSound("DrGBase.RiseAndShine")
	end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/sl_main_system/lua/entities/npc_werewolfboss.lua:

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
ENT.PrintName = "Chef des Loup Garou"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_werewolfboss.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "boss"

-- Stats --
ENT.xp = 3415
ENT.money = 500000
ENT.Damage = 450
ENT.SpawnHealth = 15000

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
		if self.Freeze == true then return end
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					timer.Simple(0.5,function()
						if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 450 then
							enemy:TakeDamage(self.Damage, self, self)	
							timer.Simple(0.001, function()
								if enemy:Health() <= 0 then
									local currentXP = enemy:getDarkRPVar("xp") or 0
									-- Calcule 50% de l'XP
									local xpToRemove = currentXP * 0.5
									-- Enlève 50% de l'XP au joueur
									enemy:addXP(-xpToRemove)
					
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

--PATH lua/entities/nutellajar/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Nutella"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/nutella.mdl")
	
end
--PATH addons/pcasino/lua/entities/pcasino_blackjack_table/cl_init.lua:
include("shared.lua")


local preset = {
	{p = 0.7, a = -30, o = 0.9},
	{p = 0.1, a = -16, o = 1.8},
	{p = 0, a = 16, o = 3},
	{p = 0.3, a = 35, o = 4.1},
}
function ENT:Initialize()
	-- Rebuild the panels table client side, without needing to do any extra networking.
	self.panels = {}
	for k, v in ipairs(self:GetChildren()) do
		if v:GetClass() == "pcasino_blackjack_panel" then
			table.insert(self.panels, v)
		end
	end
	-- Flip the table
	self.panels = table.Reverse(self.panels)
	for k, v in pairs(self.panels) do
		v.order = k
	end

	self.currentBid = 0
	self.active = false
	self.currentBets = {}
	self.currentCards = {}
	self.curHands = {}

	self.hasInitialized = true
end

function ENT:PostData()
	if not self.hasInitialized then
		self:Initialize()
	end
	
	self.currentBid = self.data.bet.default
end
function ENT:OnRemove()
	self:ClearBets()
end

local surface_setdrawcolor = surface.SetDrawColor
local surface_drawrect = surface.DrawRect
local draw_simpletext = draw.SimpleText
local black = Color(0, 0, 0, 200)
local white = Color(255, 255, 255, 100)
function ENT:DrawTranslucent()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > 25000 then return end

	-- We can piggyback off the distance check to only request the entities data when it's needed :D
	if (not self.data) and (not PerfectCasino.Cooldown.Check(self:EntIndex(), 5)) then
		PerfectCasino.Core.RequestConfigData(self)
		return
	end

	if not self.data then return end

	if not (self:GetStartRoundIn() == -1) then
		local pos = self:GetPos()
		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Forward(), 90)
		ang:RotateAroundAxis(ang:Right(), -90)
		cam.Start3D2D(pos + (ang:Up()*-22) + (ang:Right()*-19.7) + (ang:Forward()*-4.5), ang, 0.05)
			
			-- Previous bet step
			surface_setdrawcolor(black)
			surface_drawrect(5, 5, 190, 65)
			-- Border
			surface_setdrawcolor(white)
			surface_drawrect(0, 0, 200, 5)
			surface_drawrect(0, 5, 5, 65)
			surface_drawrect(195, 5, 5, 65)
			surface_drawrect(0, 70, 200, 5)

			local text = string.format(PerfectCasino.Translation.UI.Start, self.data.general.betPeriod - (os.time() - self:GetStartRoundIn())) 
			draw_simpletext(text, "pCasino.Entity.Bid", 100, 37, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		cam.End3D2D()
	end

	if not self.currentCards or not self.currentCards[0] then return end

	for k, v in pairs(self.currentCards) do
		for i, h in pairs(v) do
			local masterCard = h[1]

			local ang = masterCard:GetAngles()
			ang:RotateAroundAxis(ang:Right(), -90)
			ang:RotateAroundAxis(ang:Up(), 90)

			local pos = masterCard:GetPos() + (ang:Forward()*-2.4) + (ang:Right()*1.2)
			
			cam.Start3D2D(pos, ang, 0.04)
				-- Main Box
				surface_setdrawcolor(black)
				surface_drawrect(-20, -20, 40, 40)
				-- Border
				surface_setdrawcolor(white)
				surface_drawrect(-20, -20, 2, 38)-- Left border
				surface_drawrect(-18, -20, 38, 2)-- Top border
				surface_drawrect(18, -18, 2, 38) -- Right border
				surface_drawrect(-20, 18, 38, 2)

				draw_simpletext(PerfectCasino.Cards:GetHandValue(self.curHands[k][i]), "pCasino.Header.Static", -1, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			cam.End3D2D()
		end 
	end
end

-- Chip code
function ENT:AddBet(pad, amount)
	self.currentBets[pad] = self.currentBets[pad] or {}

	local chips = PerfectCasino.Chips:GetFromNumber(amount)

	local ang = self:GetAngles()
	for k=#PerfectCasino.Chips.Types, 0, -1 do -- Run it in reverse, putting the highest chips at the bottom
		if not chips[k] then continue end
		for i=1, chips[k] do
			local plaque = k >= 11 -- There are 11 normal skins, so anything over 10 (11-1, due to skins starting at 0) we use the big plaque models

			local chip = ClientsideModel(plaque and "models/freeman/owain_casino_plaque.mdl" or "models/freeman/owain_casino_chip.mdl")
			table.insert(self.currentBets[pad], chip)
			chip:SetParent(self)
			chip:SetSkin(plaque and k-11 or k)
			chip:SetPos(self:GetPos() + ((self:GetUp()*15.8) + (self:GetUp() * (#self.currentBets[pad]*0.3))) + ((self:GetForward()*8) + ((self:GetForward()*-10) * preset[pad].p)) + ((self:GetRight() * -13) * (pad - 2.5)))
			chip:SetAngles(ang)
		end
	end
end
function ENT:ClearBets()
	for _, pad in pairs(self.currentBets) do
		for k, v in pairs(pad) do
			if not IsValid(v) then continue end
			v:Remove()
		end
	end

	self.currentBets = {}
end

-- Card code
function ENT:AddCard(pad, hand, face)
	self.currentCards[pad] = self.currentCards[pad] or {}
	self.currentCards[pad][hand] = self.currentCards[pad][hand] or {}

	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Right(), 90)
	--ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), preset[pad] and preset[pad].a or 0)

	
	local card = ClientsideModel("models/freeman/owain_playingcards.mdl")
	table.insert(self.currentCards[pad][hand], card)
	card:SetParent(self)

	if face then 
		local skin, bodygroup = PerfectCasino.Cards:GetFaceData(face)
		card:SetBodygroup(1, bodygroup)
		card:SetSkin(skin)
		card:SetAngles(ang)
	else
		ang:RotateAroundAxis(ang:Right(), 180)
		ang:RotateAroundAxis(ang:Forward(), 180)
		card:SetAngles(ang)
	end
		

	if pad == 0 then -- Dealers hand
		card:SetPos(self:GetPos() + (self:GetUp()*15.8) + (self:GetForward()*-7) + (self:GetRight()*10) + ((self:GetRight()*-3) * #self.currentCards[pad][hand]))
	else -- Players hand
		-- If there is no existing card, set the basis for the positions of them
		if #self.currentCards[pad][hand] == 1 then
			-- Then positioning for the cards is rather complex to understand on 1 line, so I've decided to comment it out to save myself the pain
			card:SetPos(self:GetPos() -- The table's position
				+ (self:GetUp()*15.8) -- Take it to the hight of the table playing area
				+ (self:GetForward()*2) -- Bring it closer to the edge of the mat
				+ ((self:GetForward()*-9) * (preset[pad].p + ((#self.currentCards[pad][hand]-1)*0.1))) -- Shift the cards up or down the X axist to align with the pads better
				+ ((self:GetRight()*-10) * ((preset[pad].o - 2.7))) -- Move the cards across the Y axis so they are next to their pads
			)
	
		-- Move the cards to the right based on what hand it is. This is done after the first move as we need it's new position to calculate the movement
			card:SetPos(card:GetPos() -- It's current position
				+ ((-card:GetRight()*4) * (hand-1))
			)
		else -- Otherwise we can juse the existing card to position the rest of them
			local baseCard = self.currentCards[pad][hand][#self.currentCards[pad][hand] - 1]
	
			card:SetPos(baseCard:GetPos() -- The base card's position
				+ (self:GetUp()*(#self.currentCards[pad][hand]*0.02))  -- Make each card in that hand higher than the last, so they don't overlap and give glitchy artifacts
				+ (-baseCard:GetRight() * 0.6) -- Shift the card slightly to the right
				+ (baseCard:GetUp() * 0.5) -- Move the card slightly up
			)
		end
	end
end

function ENT:ClearCards()
	for _, pad in pairs(self.currentCards) do
		for k, h in ipairs(pad) do
			for _, c in ipairs(h) do
				if not IsValid(c) then continue end
				c:Remove()
			end
		end
	end

	self.currentCards = {}
end

function ENT:OnRemove()
	self:ClearBets()
	self:ClearCards()
end

net.Receive("pCasino:Blackjack:Bet:Change", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end

	local newBet = net.ReadUInt(32)
	entity.currentBid = newBet
end)

net.Receive("pCasino:Blackjack:Bet:Place", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100000 then return end

	local pad = net.ReadUInt(3)
	local betAmount = net.ReadUInt(32)

	entity:AddBet(pad, betAmount)
end)
net.Receive("pCasino:Blackjack:Clear", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end

	entity:ClearBets()
	entity:ClearCards()

	entity.curHands = {}
end)

net.Receive("pCasino:Blackjack:StartingCards", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100000 then return end

	local hands = net.ReadTable()
	local dealersHand = net.ReadTable()

	for i, p in pairs(hands) do
		entity.curHands[i] = {} -- Build the pad

		for ih, h in ipairs(p) do
			entity.curHands[i][ih] = {} -- Build the hand

			for _, c in ipairs(h.cards) do
				table.insert(entity.curHands[i][ih], c) -- Add the card to the hand

				entity:AddCard(i, ih, c) -- Add a visual card to the table
			end
		end
	end

	entity.curHands[0] = {}
	entity.curHands[0][1] = {}
	for k, c in pairs(dealersHand) do
		entity:AddCard(0, 1, c)
		table.insert(entity.curHands[0][1], c)
	end
	entity:AddCard(0, 1) -- The dealer's blind card
end)
net.Receive("pCasino:Blackjack:NewCard", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100000 then return end

	local pad = net.ReadUInt(3)
	local hand = net.ReadUInt(3)
	local card = net.ReadString()

	if (not entity.curHands) or (not entity.curHands[pad]) or (not entity.curHands[pad][hand]) then return end

	table.insert(entity.curHands[pad][hand], card) -- Add the card to the hand
	entity:AddCard(pad, hand, card) -- Add a visual card to the table
end)
net.Receive("pCasino:Blackjack:Split", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100000 then return end

	local pad = net.ReadUInt(3)
	local hands = net.ReadTable()

	-- Clear the existing cards to rebuild them
	for k, v in pairs(entity.currentCards[pad]) do
		for n, m in pairs(v) do
			m:Remove()
		end
	end

	-- Reset then sub tables
	entity.curHands[pad] = {}

	entity.currentCards[pad] = {}

	for i, h in ipairs(hands) do
		entity.curHands[pad][i] = {}
		for _, c in ipairs(h.cards) do
			table.insert(entity.curHands[pad][i], c) -- Add the card to the hand

			entity:AddCard(pad, i, c)
		end
	end
end)
net.Receive("pCasino:Blackjack:DealerCards", function()
	local entity = net.ReadEntity()
	if not IsValid(entity) then return end
	if not entity.data then return end
	if entity:GetPos():DistToSqr(LocalPlayer():GetPos()) > 100000 then return end

	local dealersCards = net.ReadTable()

	-- Remove the blind card
	if (not entity.currentCards) or (not entity.currentCards[0]) or (not entity.currentCards[0][1]) or (not entity.currentCards[0][1][2]) then return end

	entity.currentCards[0][1][2]:Remove()
	entity.currentCards[0][1][2] = nil
	for i, c in ipairs(dealersCards) do
		if i == 1 then continue end -- We already have the first card placed
		timer.Simple(i-2, function()
			entity:AddCard(0, 1, c)
			table.insert(entity.curHands[0][1], c) -- Add the card to the hand
		end)
	end
end)
--PATH addons/pcasino/lua/entities/pcasino_prize_plinth/cl_init.lua:
include("shared.lua")

function ENT:PostData()
	self.item = ClientsideModel(self.data.general.model)
	self.item:SetParent(self)
	self.item:SetPos(self:GetPos() + (self:GetUp() * 5))
	self.item:SetAngles(self:GetAngles())

	if self.data.general.bow then
		self.item.bow = ClientsideModel("models/freeman/owain_giantbow.mdl")
		self.item.bow:SetParent(self.item)
		local boundMin, boundMax = self.item:GetModelRenderBounds()
		self.item.bow:SetPos(self.item:GetPos() + Vector(0, 0, boundMax[3] + 8 + (self.data.general.bowOffset or 0)))
		self.item.bow:SetAngles(self.item:GetAngles())
	end
end

function ENT:Think()
	if not IsValid(self.item) then return end

	if not (self:GetBoneMatrix(1)) then return end
	
	local ang = self:GetBoneMatrix(1):GetAngles()
	ang:RotateAroundAxis(ang:Right(), -90)
	self.item:SetAngles(ang)
end

function ENT:OnRemove()

	if IsValid(self.item) then
		self.item:Remove()
		
		if IsValid(self.item.bow) then
			self.item.bow:Remove()
		end
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
--PATH lua/entities/pfx1_06~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Flamethrower 1 [Large]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]flamethrower_large"
--PATH lua/entities/pfx1_08.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Fire [Green]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]_campfire_green"
--PATH lua/entities/pfx1_0c.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Medium fire"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]ground_fire_1"
--PATH lua/entities/pfx2_02.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Gushing Blood [Large]"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]gushing_blood*"



--PATH lua/entities/pfx2_02_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Gushing Blood"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]gushing_blood"



--PATH lua/entities/pfx4_02.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Red Jet"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_r"

--PATH lua/entities/pfx4_02_s~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Red Jet [Smokeless]"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_r_s*"
--PATH lua/entities/pfx4_04_s~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Purple Jet [Smokeless]"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_v_s*"
--PATH lua/entities/pfx4_07.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "BFG Projectile"
ENT.Category         = "PPE: Weapons" -- too lazy to move this to different entity category.
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]bfg_*proj"
--PATH lua/entities/pfx5_00_alt_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Small Alt Black Hole"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]black_hole_micro_b"
--PATH lua/entities/pfx5_00_ss.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Micro Black Hole"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]black_hole_mmicro"
--PATH lua/entities/pfx8_00.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Magic Flame 1"
ENT.Category         = "PPE: Magic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[8]magic_1"
--PATH lua/entities/pfxa_00.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Waterleak"
ENT.Category         = "PPE: Water"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[A]waterleak_1"
--PATH addons/sl_main_system/lua/entities/portail_sl/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
    -- self:PhysicsInitBox(Vector(-100, -100, -100), Vector(100, 100, 100))

    self:CreateParticle()
end

function ENT:CreateParticle()
    if not IsValid(self) or IsValid(self.particle) then return end

    self.particle = self:CreateParticleEffect(self:GetNWString("Particle", "[NE]PortailBleue"), PATTACH_ABSORIGIN_FOLLOW, 0)
end

-- not called cuz setnodraw true
/*function ENT:Draw()
    self:DrawModel()

    self:CreateParticle()

    -- self.particle:SetControlPointOrientation(0, Angle(90, 90, 90))
end*/

function ENT:Think()
    if not IsValid(self.particle) then return end

    -- self.particle:SetControlPointOrientation(0, self:GetForward()*50, self:GetRight(), self:GetUp())

    if self.particle:GetEffectName() == self:GetNWString("Particle", "[NE]PortailBleue") then return end

    self.particle:StopEmissionAndDestroyImmediately()
    self.particle = nil

    self:CreateParticle()

    self:NextThink(CurTime() + 0.5)
    return true
end

function ENT:OnRemove()
    if IsValid(self.particle) then
        self.particle:StopEmissionAndDestroyImmediately()
        self.particle = nil
    end
end
--PATH addons/sl_main_system/lua/entities/rang_roll_sl/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/sl_main_system/lua/entities/rochemine/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

end
--PATH addons/sl_utils/lua/entities/sammyservers_textscreen/cl_init.lua:
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

--PATH addons/sl_bouffe/lua/entities/sl_champagne1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Champagne"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bottle of champagne"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/champagne.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_champagne5/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/champagne3.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_sodacanb01/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Monster Energy"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacanb01.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/spawned_food/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Spawned Food"
ENT.Author = "Rickster"
ENT.Spawnable = false
ENT.IsSpawnedFood = true
ENT.EatSound = "vo/sandwicheat09.mp3" -- Requires Team Fortress 2

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 1, "owning_ent")
end

--PATH gamemodes/mangarp/entities/entities/spawned_shipment/cl_init.lua:
include("shared.lua")

local matBallGlow = Material("models/props_combine/tpballglow")
function ENT:Draw()
    self.height = self.height or 0
    self.colr = self.colr or 1
    self.colg = self.colg or 0
    self.StartTime = self.StartTime or CurTime()

    if GAMEMODE.Config.shipmentspawntime > 0 and self.height < self:OBBMaxs().z then
        self:drawSpawning()
    else
        self:DrawModel()
    end

    self:drawFloatingGun()
    self:drawInfo()
end

net.Receive("DarkRP_shipmentSpawn", function()
    local ent = net.ReadEntity()
    if not IsValid(ent) or not ent.IsSpawnedShipment then return end

    ent.height = 0
    ent.StartTime = CurTime()
end)

function ENT:drawSpawning()
    render.MaterialOverride(matBallGlow)

    render.SetColorModulation(self.colr, self.colg, 0)

    self:DrawModel()

    render.MaterialOverride()
    self.colr = 1 - ((CurTime() - self.StartTime) / GAMEMODE.Config.shipmentspawntime)
    self.colg = (CurTime() - self.StartTime) / GAMEMODE.Config.shipmentspawntime

    render.SetColorModulation(1, 1, 1)

    render.MaterialOverride()

    local normal = - self:GetAngles():Up()
    local pos = self:LocalToWorld(Vector(0, 0, self:OBBMins().z + self.height))
    local distance = normal:Dot(pos)
    self.height = self:OBBMaxs().z * ((CurTime() - self.StartTime) / GAMEMODE.Config.shipmentspawntime)
    render.EnableClipping(true)
    render.PushCustomClipPlane(normal, distance)

    self:DrawModel()

    render.PopCustomClipPlane()
end

function ENT:drawFloatingGun()
    local contents = CustomShipments[self:Getcontents() or ""]
    if not contents or not IsValid(self:GetgunModel()) then return end
    self:GetgunModel():SetNoDraw(true)

    local pos = self:GetPos()
    local ang = self:GetAngles()

    -- Position the gun
    local gunPos = self:GetAngles():Up() * 40 + ang:Up() * (math.sin(CurTime() * 3) * 8)
    self:GetgunModel():SetPos(pos + gunPos)


    -- Make it dance
    ang:RotateAroundAxis(ang:Up(), (CurTime() * 180) % 360)
    self:GetgunModel():SetAngles(ang)

    -- Draw the model
    if self:Getgunspawn() < CurTime() - 2 then
        self:GetgunModel():DrawModel()
        return
    elseif self:Getgunspawn() < CurTime() then -- Not when a gun just spawned
        return
    end

    -- Draw the spawning effect
    local delta = self:Getgunspawn() - CurTime()
    local min, max = self:GetgunModel():OBBMins(), self:GetgunModel():OBBMaxs()
    min, max = self:GetgunModel():LocalToWorld(min), self:GetgunModel():LocalToWorld(max)

    -- Draw the ghosted weapon
    render.MaterialOverride(matBallGlow)
    render.SetColorModulation(1 - delta, delta, 0) -- From red to green
    self:GetgunModel():DrawModel()
    render.MaterialOverride()
    render.SetColorModulation(1, 1, 1)

    -- Draw the cut-off weapon
    render.EnableClipping(true)
    -- The clipping plane only draws objects that face the plane
    local normal = -self:GetgunModel():GetAngles():Forward()
    local cutPosition = LerpVector(delta, max, min) -- Where it cuts
    local cutDistance = normal:Dot(cutPosition) -- Project the vector onto the normal to get the shortest distance between the plane and origin

    -- Activate the plane
    render.PushCustomClipPlane(normal, cutDistance);
    -- Draw the partial model
    self:GetgunModel():DrawModel()
    -- Remove the plane
    render.PopCustomClipPlane()

    render.EnableClipping(false)
end

local color_red = Color(140, 0, 0, 100)
local color_white = color_white

function ENT:drawInfo()
    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    local content = self:Getcontents() or ""
    local contents = CustomShipments[content]
    if not contents then return end
    contents = contents.name

    surface.SetFont("HUDNumber5")
    local text = DarkRP.getPhrase("contents")
    local TextWidth = surface.GetTextSize(text)
    local TextWidth2 = surface.GetTextSize(contents)

    cam.Start3D2D(Pos + Ang:Up() * 25, Ang, 0.2)
        draw.WordBox(2, -TextWidth * 0.5 + 5, -30, text, "HUDNumber5", color_red, color_white)
        draw.WordBox(2, -TextWidth2 * 0.5 + 5, 18, contents, "HUDNumber5", color_red, color_white)
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Forward(), 90)

    text = DarkRP.getPhrase("amount")
    TextWidth = surface.GetTextSize(text)
    TextWidth2 = surface.GetTextSize(self:Getcount())

    cam.Start3D2D(Pos + Ang:Up() * 17, Ang, 0.14)
        draw.WordBox(2, -TextWidth * 0.5 + 5, -150, text, "HUDNumber5", color_red, color_white)
        draw.WordBox(2, -TextWidth2 * 0.5 + 0, -102, self:Getcount(), "HUDNumber5", color_red, color_white)
    cam.End3D2D()
end

--[[---------------------------------------------------------------------------
Create a shipment from a spawned_weapon
---------------------------------------------------------------------------]]
properties.Add("splitShipment",
{
    MenuLabel   =   DarkRP.getPhrase("splitshipment"),
    Order       =   2004,
    MenuIcon    =   "icon16/arrow_divide.png",

    Filter      =   function(self, ent, ply)
                        if not IsValid(ent) then return false end
                        return ent.IsSpawnedShipment
                    end,

    Action      =   function(self, ent)
                        if not IsValid(ent) then return end
                        RunConsoleCommand("darkrp", "splitshipment", ent:EntIndex())
                    end
})

--PATH gamemodes/mangarp/entities/entities/spawned_weapon/cl_init.lua:
include("shared.lua")

local color_red = Color(140, 0, 0, 100)
local color_white = color_white

function ENT:Draw()
    local ret = hook.Call("onDrawSpawnedWeapon", nil, self)
    if ret ~= nil then return end
    self:DrawModel()

    local amount = self:Getamount()
    if amount == 1 then return end

    local Pos = self:GetPos()
    local Ang = self:GetAngles()
    local text = DarkRP.getPhrase("amount") .. amount

    surface.SetFont("HUDNumber5")
    local TextWidth = surface.GetTextSize(text)

    Ang:RotateAroundAxis(Ang:Forward(), 90)

    cam.Start3D2D(Pos + Ang:Up(), Ang, 0.11)
        draw.WordBox(2, 0, -40, text, "HUDNumber5", color_red, color_white)
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Right(), 180)

    cam.Start3D2D(Pos + Ang:Up() * 3, Ang, 0.11)
        draw.WordBox(2, -TextWidth, -40, text, "HUDNumber5", color_red, color_white)
    cam.End3D2D()
end

--[[---------------------------------------------------------------------------
Create a shipment from a spawned_weapon
---------------------------------------------------------------------------]]
properties.Add("createShipment",
    {
        MenuLabel   =   DarkRP.getPhrase("createshipment"),
        Order       =   2003,
        MenuIcon    =   "icon16/add.png",

        Filter      =   function(self, ent, ply)
                            if not IsValid(ent) then return false end
                            return ent.IsSpawnedWeapon
                        end,

        Action      =   function(self, ent)
                            if not IsValid(ent) then return end
                            RunConsoleCommand("darkrp", "makeshipment", ent:EntIndex())
                        end
    }
)

--[[---------------------------------------------------------------------------
Interface
---------------------------------------------------------------------------]]
DarkRP.hookStub{
    name = "onDrawSpawnedWeapon",
    description = "Draw spawned weapons.",
    realm = "Client",
    parameters = {
        {
            name = "weapon",
            description = "The weapon to perform drawing operations on.",
            type = "Player"
        }
    },
    returns = {
        {
            name = "value",
            description = "Return a value to completely override drawing",
            type = "any"
        }
    }
}

--PATH lua/entities/steak1/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Steak"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/steak1.mdl")
	
end
--PATH lua/entities/turkeyleg/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Turkey leg"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/turkeyleg.mdl")
	
end
--PATH lua/entities/vegchili/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chili"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/chili.mdl")
	
end
--PATH lua/entities/vegleek/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Leek"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/leek.mdl")
	
end
--PATH lua/entities/vegpepper2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pepper (yellow)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pepper2.mdl")
	
end
--PATH addons/sl_main_system/lua/effects/sl_effect11.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

local propHalos = {}  -- Tableau pour stocker les modèles nécessitant un halo

hook.Add("PreDrawHalos", "AddPropHalos", function()
    -- halo.Add(propHalos, Color(255,0,0,255), 5, 5, 2)  -- Ajouter des halos aux modèles stockés dans la table
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

    self.Model:SetMaterial("Models/effects/comball_tape")
    self.Model:SetColor( Color(255,0,0) )
    self.Model:SetParent( self.Ent, 0 )
    self.Model:SetMoveType( MOVETYPE_NONE )
    self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
    self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
    self.Model:AddEffects( EF_BONEMERGE )

	table.insert(propHalos, self.Model)

    for i = 0,self.Ent:GetBoneCount() do
        self.Model:ManipulateBoneScale( i, Vector(1,1,1)) -- * 1.05 
    end

    for i = 0, self.Ent:GetNumBodyGroups() do
        self.Model:SetBodygroup(i, self.Ent:GetBodygroup(i))
    end
end

function EFFECT:Think()
    if not IsValid( self.Ent ) then self.Model:Remove() return false end
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

--PATH lua/bricks_server/bricks_server_devcfg_main.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame or use the f4menu
    !!WARNING!!
]]--

BRICKS_SERVER.DEVCONFIG.BaseThemes = {}
BRICKS_SERVER.DEVCONFIG.BaseThemes.Red = Color(201, 70, 70)
BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed = Color(181, 50, 50)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Green = Color(46, 204, 113)
BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen = Color(39, 174, 96)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Gold = Color(201,176,55)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Silver = Color(180,180,180)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Bronze = Color(173,138,86)
BRICKS_SERVER.DEVCONFIG.BaseThemes.White = Color( 255, 255, 255 )
BRICKS_SERVER.DEVCONFIG.BaseThemes.Black = Color( 0, 0, 2505 )

BRICKS_SERVER.DEVCONFIG.AccentThemes = {}
BRICKS_SERVER.DEVCONFIG.AccentThemes["Turquoise"] = { Color(22, 160, 133), Color(26, 188, 156) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Emerald"] = { Color(39, 174, 96), Color(46, 204, 113) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Blue"] = { Color(41, 128, 185), Color(52, 152, 219) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Amethyst"] = { Color(142, 68, 173), Color(155, 89, 182) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Yellow"] = { Color(243, 156, 18), Color(241, 196, 15) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Orange"] = { Color(211, 84, 0), Color(230, 126, 34) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Red"] = { Color(181, 50, 50), Color(201, 70, 70) }

BRICKS_SERVER.DEVCONFIG.BackgroundThemes = {}
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["Dark"] = { Color(25, 25, 25), Color(40, 40, 40), Color(49, 49, 49), Color(68, 68, 68), Color( 255, 255, 255 ) }
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["DarkBlue"] = { Color(26, 41, 56), Color(36, 51, 66), Color(44, 62, 80), Color(52, 73, 94), Color( 255, 255, 255 ) }
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["Light"] = { Color(152, 157, 161), Color(170, 177, 182), Color(189, 195, 199), Color(236, 240, 241), Color( 0, 0, 0 ) }
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["Grey"] = { Color(101, 115, 116), Color(111, 125, 126), Color(127, 140, 141), Color(149, 165, 166), Color( 255, 255, 255 ) }

BRICKS_SERVER.DEVCONFIG.EntityTypes = BRICKS_SERVER.DEVCONFIG.EntityTypes or {}
BRICKS_SERVER.DEVCONFIG.EntityTypes["bricks_server_npc"] = { 
    GetDataFunc = function( entity ) 
        return entity:GetNPCKeyVar() or 0
    end,
    SetDataFunc = function( entity, data ) 
        return entity:SetNPCKey( data or 0 )
    end
}

BRICKS_SERVER.DEVCONFIG.NPCTypes = BRICKS_SERVER.DEVCONFIG.NPCTypes or {}

BRICKS_SERVER.DEVCONFIG.WeaponModels = {
    ["weapon_ar2"] = "models/weapons/w_irifle.mdl",
    ["weapon_bugbait"] = "models/weapons/w_bugbait.mdl",
    ["weapon_crossbow"] = "models/weapons/w_crossbow.mdl",
    ["weapon_crowbar"] = "models/weapons/w_crowbar.mdl",
    ["weapon_frag"] = "models/weapons/w_grenade.mdl",
    ["weapon_physcannon"] = "models/weapons/w_Physics.mdl",
    ["weapon_pistol"] = "models/weapons/w_pistol.mdl",
    ["weapon_rpg"] = "models/weapons/w_rocket_launcher.mdl",
    ["weapon_shotgun"] = "models/weapons/w_shotgun.mdl",
    ["weapon_slam"] = "models/weapons/w_slam.mdl",
    ["weapon_smg1"] = "models/weapons/w_smg1.mdl",
    ["weapon_stunstick"] = "models/weapons/w_stunbaton.mdl",
    ["weapon_medkit"] = "models/weapons/w_medkit.mdl",
    ["weapon_physgun"] = "models/weapons/w_Physics.mdl",
    ["gmod_tool"] = "models/weapons/w_toolgun.mdl",

    ["arrest_stick"] = "models/weapons/w_stunbaton.mdl",
    ["unarrest_stick"] = "models/weapons/w_stunbaton.mdl",
    ["stunstick"] = "models/weapons/w_stunbaton.mdl",
    ["weaponchecker"] = "models/weapons/v_hands.mdl",
}

BRICKS_SERVER.DEVCONFIG.KEY_BINDS = {
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "Numpad 0",
    "Numpad 1",
    "Numpad 2",
    "Numpad 3",
    "Numpad 4",
    "Numpad 5",
    "Numpad 6",
    "Numpad 7",
    "Numpad 8",
    "Numpad 0",
    "Numpad /",
    "Numpad *",
    "Numpad -",
    "Numpad +",
    "Numpad Enter",
    "Numpad .",
    "(",
    ")",
    ";",
    "'",
    "`",
    ",",
    ".",
    "/",
    [[\]],
    "-",
    "=",
    "Enter",
    "Space",
    "Backspace",
    "Tab",
    "Capslock",
    "Numlock",
    "Escape",
    "Scrolllock",
    "Insert",
    "Delete",
    "Home",
    "End",
    "Pageup",
    "Pagedown",
    "Break",
    "Left Shift",
    "Right Shift",
    "Alt",
    "Right Alt",
    "Left Control",
    "Right Control",
    "Left Windows",
    "Right Windows",
    "App",
    "Up",
    "Left",
    "Down",
    "Right",
    "F1",
    "F2",
    "F3",
    "F4",
    "F5",
    "F6",
    "F7",
    "F8",
    "F9",
    "F10",
    "F11",
    "F12",
    "Capslock Toggle",
    "Numlock Toggle",
    "Last",
    "Count"
}

-- Inventory --
BRICKS_SERVER.DEVCONFIG.INVENTORY = BRICKS_SERVER.DEVCONFIG.INVENTORY or {}
BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs = {
    GetItemData = function( ent )
        local itemData = { ent:GetClass(), ent:GetModel() }
        
        return itemData, 1
    end,
    OnSpawn = function( ply, pos, itemData )
        local ent = ents.Create( itemData[1] )
        if( not IsValid( ent ) ) then return end
        ent:SetPos( pos )
        ent:SetModel( itemData[2] )
        ent:Spawn()
        if( ent.CPPISetOwner ) then ent:CPPISetOwner( ply ) end
        if( ent.Setowning_ent ) then ent:Setowning_ent( ply ) end
    end,
    ModelDisplay = function( Panel, itemData )
        if( not Panel.Entity or not IsValid( Panel.Entity ) ) then return end

        local mn, mx = Panel.Entity:GetRenderBounds()
        local size = 0
        size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
        size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
        size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )

        Panel:SetFOV( 65 )
        Panel:SetCamPos( Vector( size, size, size ) )
        Panel:SetLookAt( (mn + mx) * 0.5 )
    end,
    GetInfo = function( itemData )
        local name = BRICKS_SERVER.Func.GetList( "entities" )[itemData[1] or ""] or (itemData[1] or "Unknown")
        return { name, "Some " .. name .. ".", (BRICKS_SERVER.CONFIG.INVENTORY.ItemRarities or {})[itemData[1] or ""] }
    end,
    GetItemKey = function( itemData )
        return itemData[1]
    end,
    CanCombine = function( itemData1, itemData2 )
        if( itemData1[1] == itemData2[1] ) then
            return true
        end

        return false
    end,
}

BRICKS_SERVER.DEVCONFIG.RarityTypes = {}
BRICKS_SERVER.DEVCONFIG.RarityTypes["SolidColor"] = {
    Title = "Solid Color"
}
BRICKS_SERVER.DEVCONFIG.RarityTypes["Gradient"] = {
    Title = "Gradient"
}
BRICKS_SERVER.DEVCONFIG.RarityTypes["Fade"] = {
    Title = "Fade"
}
BRICKS_SERVER.DEVCONFIG.RarityTypes["Rainbow"] = {
    Title = "Rainbow"
}

BRICKS_SERVER.DEVCONFIG.Currencies = BRICKS_SERVER.DEVCONFIG.Currencies or {}
local function loadCurrencies()
    if( DarkRP ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["darkrp_money"] = {
            Title = "DarkRP Money",
            getFunction = function( ply )
                return ply:getDarkRPVar( "money" )
            end,
            addFunction = function( ply, amount )
                ply:addMoney( amount )
            end,
            formatFunction = function( amount )
                return DarkRP.formatMoney( amount )
            end
        }
    end

    if( BRICKSCREDITSTORE ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["brcs_credits"] = {
            Title = "Credits",
            getFunction = function( ply )
                return ply:GetBRCS_Credits()
            end,
            addFunction = function( ply, amount )
                ply:AddBRCS_Credits( amount )
            end,
            formatFunction = function( amount )
                return BRICKSCREDITSTORE.FormatCredits( amount )
            end
        }
    end

    if( mTokens ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["mtokens"] = {
            Title = "mTokens",
            getFunction = function( ply )
                return ((SERVER and mTokens.GetPlayerTokens(ply)) or (CLIENT and mTokens.PlayerTokens)) or 0
            end,
            addFunction = function( ply, amount )
                if( amount > 0 ) then
                    mTokens.AddPlayerTokens(ply, amount)
                else
                    mTokens.TakePlayerTokens(ply, math.abs(amount))
                end
            end,
            formatFunction = function( amount )
                return string.Comma( amount ) .. " Tokens"
            end
        }
    end
    
    BRICKS_SERVER.DEVCONFIG.Currencies["ps2_points"] = {
        Title = "PS2 Points",
        getFunction = function( ply )
            return (ply.PS2_Wallet or {}).points or 0
        end,
        addFunction = function( ply, amount )
            ply:PS2_AddStandardPoints( amount )
        end,
        formatFunction = function( amount )
            return string.Comma( amount ) .. " Points"
        end
    }

    BRICKS_SERVER.DEVCONFIG.Currencies["ps2_premium_points"] = {
        Title = "PS2 Premium Points",
        getFunction = function( ply )
            return (ply.PS2_Wallet or {}).premiumPoints or 0
        end,
        addFunction = function( ply, amount )
            ply:PS2_AddPremiumPoints( amount )
        end,
        formatFunction = function( amount )
            return string.Comma( amount ) .. " Premium Points"
        end
    }

    BRICKS_SERVER.DEVCONFIG.Currencies["ps1_points"] = {
        Title = "PS1 Points",
        getFunction = function( ply )
            return ply:PS_GetPoints() or 0
        end,
        addFunction = function( ply, amount )
            ply:PS_GivePoints( amount )
        end,
        formatFunction = function( amount )
            return string.Comma( amount ) .. " Points"
        end
    }

    if( SH_POINTSHOP ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["sh_points"] = {
            Title = "SH Points",
            getFunction = function( ply )
                return ply:SH_GetStandardPoints()
            end,
            addFunction = function( ply, amount )
                ply:SH_AddStandardPoints( amount )
            end,
            formatFunction = function( amount )
                return string.Comma( amount ) .. " Points"
            end
        }

        BRICKS_SERVER.DEVCONFIG.Currencies["sh_premium_points"] = {
            Title = "SH Premium Points",
            getFunction = function( ply )
                return ply:SH_GetPremiumPoints()
            end,
            addFunction = function( ply, amount )
                ply:SH_AddPremiumPoints( amount )
            end,
            formatFunction = function( amount )
                return string.Comma( amount ) .. " Premium Points"
            end
        }
    end
end

if( gmod.GetGamemode() ) then
    loadCurrencies()
else
    hook.Add( "OnGamemodeLoaded", "BRS.OnGamemodeLoaded.DevConfig", loadCurrencies )
end
--PATH addons/mc_quests/lua/mqs/core/sh_player.lua:
-- ╔═╗╔═╦═══╦═══╗───────────────────────
-- ║║╚╝║║╔═╗║╔═╗║───────────────────────
-- ║╔╗╔╗║║─║║╚══╗───────────────────────
-- ║║║║║║║─║╠══╗║──By MacTavish <3──────
-- ║║║║║║╚═╝║╚═╝║───────────────────────
-- ╚╝╚╝╚╩══╗╠═══╝───────────────────────
-- ────────╚╝───────────────────────────

function MQS.Notify(a, b, c, d)
	if SERVER then
		net.Start("MQS.Notify")
		net.WriteString(b)
		net.WriteString(c)
		net.WriteInt(d, 16)
		net.Send(a)
	else
		MQS.DoNotify(a, b, c)
	end
end

function MQS.TaskNotify(a, b, c)
	if SERVER then
		net.Start("MQS.TaskNotify")
		net.WriteString(b)
		net.WriteInt(c, 16)
		net.Send(a)
	else
		MQS.DoTaskNotify(a, b)
	end
end

function MQS.SmallNotify(message, ply, type)
	if SERVER then
		if DarkRP then
			DarkRP.notify(ply, type, 5, message)
		elseif ix then
			ix.util.Notify(message, ply)
		else
			ply:ChatPrint(message)
		end
	else
		if GAMEMODE.AddNotify then
			GAMEMODE:AddNotify(message, type, 5)
		elseif ix then
			ix.util.Notify(message)
		else
			ply:ChatPrint(message)
		end
	end
end

function MQS.IsAdministrator(ply)
	return MQS.MasterAdmins[ply:SteamID()] or MQS.Config.Administrators[ply:GetUserGroup()]
	--return ply:IsSuperAdmin()
end

function MQS.IsEditor(ply)
	return MQS.Config.Editors[ply:GetUserGroup()] or MQS.IsAdministrator(ply)
	--return ply:IsSuperAdmin()
end

function MQS.GetActiveVehicle(ply)
	if (ply.GetSimfphys and ply:GetSimfphys()) and IsValid(ply:GetSimfphys()) then return ply:GetSimfphys() end

	local veh = ply:GetVehicle()

	if IsValid(veh) and IsValid(veh:GetOwner()) and veh:GetOwner().LFS and veh:GetOwner():GetDriver() == ply then return veh:GetOwner() end
	if IsValid(veh) and IsValid(veh:GetParent()) and veh:GetDriver() == ply then return veh:GetParent() end
	if IsValid(veh) then return ply:GetVehicle() end

	return nil
end

function MQS.CanPlayIntro(ply)
	return MQS.Config.IntoQuest and MQS.Config.IntoQuest ~= "" and MQS.Quests[MQS.Config.IntoQuest] and ply.MQSdata.Stored and ply.MQSdata.Stored.QuestList and not ply.MQSdata.Stored.QuestList[MQS.Config.IntoQuest]
end

function MQS.HasQuest(ply)
	if CLIENT and not ply then
		ply = LocalPlayer()
	end

	return MQS.GetNWdata(ply, "active_quest") and {quest = MQS.GetNWdata(ply, "active_quest"), id = MQS.GetNWdata(ply, "active_questid")} or nil
end

function MQS.GetNWdata(ply, id)
	if not ply.MQSdata or not ply.MQSdata[id] then return false end

	return ply.MQSdata[id]
end

function MQS.GetSelfNWdata(ply, id)
	if not ply.MQSdata_self or not ply.MQSdata_self[id] then return false end

	return ply.MQSdata_self[id]
end

function MQS.GetDataStored(ply, id)
	if not ply.MQSdata or not ply.MQSdata.Stored or not ply.MQSdata.Stored[id] then return false end

	return ply.MQSdata.Stored[id]
end

function MQS.ReQuest(quest, ply)
	if SERVER then
		if not MQS.Quests[quest] then return end
		local data = table.Copy(MQS.Quests[quest])

		local json_data = util.TableToJSON(data, false)
		local compressed_data = util.Compress(json_data)
		local bytes_number = string.len(compressed_data)
		net.Start("MQS.ReQuest")
		net.WriteString(quest)
		net.WriteInt(bytes_number, 32)
		net.WriteData(compressed_data, bytes_number)
		if ply then
			net.Send(ply)
		else
			net.Broadcast()
		end
	else
		net.Start("MQS.ReQuest")
			net.WriteString(quest)
		net.SendToServer()
	end
end


function MQS.DataShare(ply, initial)
	if SERVER then
		local data_mod = table.Copy(MQS.ActiveTask)

		for k, v in pairs(data_mod) do
			v.player = v.player:UserID()
		end

		if initial then
			local quests = table.Copy(MQS.Quests)

			for k,v in pairs(quests) do
				v.objects = nil
				v.notloaded = true
			end

			MQS.SendDataToClien({
				index = "Quests",
				data = quests
			}, ply)
		end

		MQS.SendDataToClien({
			index = "ActiveTask",
			data = data_mod,
			mod = "player"
		}, ply)

		MQS.SendDataToClien({
			index = "TaskQueue",
			data = table.Copy(MQS.TaskQueue)
		}, ply)

		MQS.SendDataToClien({
			index = "TaskCount",
			data = table.Copy(MQS.TaskCount)
		}, ply)
	else
		net.Start("MQS.DataShare")
		net.SendToServer()
	end
end

function MQS.ActiveDataShare(ply)
	if SERVER then
		local data_mod = table.Copy(MQS.ActiveTask)

		for k, v in pairs(data_mod) do
			v.player = v.player:UserID()
		end

		MQS.SendDataToClien({
			index = "ActiveTask",
			data = data_mod,
			mod = "player"
		}, ply)
	else
		net.Start("MQS.DataShare")
		net.SendToServer()
	end
end

if CLIENT then
	net.Receive("MQS.GetBigData", function(l, ply)
		local bytes_number = net.ReadInt(32)
		local compressed_data = net.ReadData(bytes_number)
		local real_data = MQS.TableDecompress(compressed_data)

		if real_data.isaltdata then
			if not MQS.AltDate then
				MQS.AltDate = {}
			end

			MQS.AltDate[real_data.index] = real_data.data

			if MQS.AltDateUpdate then
				MQS.AltDateUpdate()
			end

			return
		end

		if real_data.isplayerdata then
			local pl_d = Player(real_data.isplayerdata)
			if not IsValid(pl_d) then return end

			if not pl_d.MQSdata then
				pl_d.MQSdata = {}
				pl_d.MQSdata.Stored = {}
			end

			if not pl_d.MQSdata.Stored then
				pl_d.MQSdata.Stored = {}
			end

			if real_data.index == "none" then
				pl_d.MQSdata = real_data.data
			else
				pl_d.MQSdata.Stored[real_data.index] = real_data.data
			end

			return
		end

		MQS[real_data.index] = real_data.data

		if real_data.mod then
			for k, v in pairs(MQS[real_data.index]) do
				if v[real_data.mod] then
					v[real_data.mod] = Player(v[real_data.mod])
				end
			end
		end
	end)

	net.Receive("MQS.SetPData", function()
		local id = net.ReadString()
		local data = net.ReadString()
		local ply = net.ReadEntity()

		if tonumber(data) then data = tonumber(data) end

		if ply and IsValid(ply) and ply:IsPlayer() then
			if not ply.MQSdata then
				ply.MQSdata = {}
			end

			if data == "" then
				ply.MQSdata[id] = nil
			else
				ply.MQSdata[id] = data
			end

		else
			if not LocalPlayer().MQSdata_self then
				LocalPlayer().MQSdata_self = {}
			end

			if data == "" then
				LocalPlayer().MQSdata_self[id] = nil
			else
				LocalPlayer().MQSdata_self[id] = data
			end
		end
	end)

	net.Receive("MQS.ReQuest", function()
		local id = net.ReadString()
		local bytes_number = net.ReadInt(32)
		local compressed_data = net.ReadData(bytes_number)
		local real_data = MQS.TableDecompress(compressed_data)

		if not id then return end
		MQS.Quests[id] = real_data

		if MQS.SetupMenu then
			MQS.SetupMenu.OnQuestUpdate(id)
		end
	end)

	net.Receive("MQS.QuestRemove", function()
		local id = net.ReadString()
		MQS.Quests[id] = nil

		if MQS.SetupMenu then
			MQS.SetupMenu.OnQuestUpdate(id)
		end
	end)

	-- Request quest and player data from server
	net.Start("MQS.GetPData")
	net.SendToServer()

	MQS.DataShare(nil, true)
end
--PATH addons/pcasino/lua/perfectcasino/derma/cl_fonts.lua:
-- This just creates the font. to keep them organised
surface.CreateFont("pCasino.Header.Static", {
	font = "Roboto",
	size = 35,
})
surface.CreateFont("pCasino.Title.Static", {
	font = "Roboto",
	size = 36,
})
surface.CreateFont("pCasino.Entity.Bid", {
	font = "Roboto",
	size = 40,
})
surface.CreateFont("pCasino.Entity.Arrows", {
	font = "Roboto",
	size = 60,
})
surface.CreateFont("pCasino.SubTitle.Static", {
	font = "Roboto",
	size = 24,
})
surface.CreateFont("pCasino.Main.Static", {
	font = "Roboto",
	size = 28,
})
surface.CreateFont("pCasino.Nav.Static", {
	font = "Roboto",
	size = 25,
})
surface.CreateFont("pCasino.Textbox.Static", {
	font = "Roboto",
	size = 20,
	weight = 500,
})
surface.CreateFont("pCasino.Button.Micro", {
	font = "Roboto",
	size = 15,
	weight = 500,
})