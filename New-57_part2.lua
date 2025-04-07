--Stealed clientside server code by exechack.cc
--Hostname: 🧿 New Era - Solo Leveling | .gg/nwsl - Part 2/10 - 08/04/2025


--PATH addons/sl_util_accessory/lua/advanced_accessories/languages/sh_language_tr.lua:
AAS = AAS or {}
AAS.Language = AAS.Language  or {}

AAS.Language["tr"] = {
    ["cancel"] = "İptal",
    ["save"] = "Eşyayı Kaydet",
    ["name"] = "İsim",
    ["model"] = "Model",
    ["itemPrice"] = "Eşya Ücreti",
    ["itemPos"] = "Eşya Pozisyonu",
    ["itemStat"] = "Eşya istatistikleri",
    ["itemJob"] = "Mesleğe Özel",
    ["itemName"] = "Eşyanın ismi",
    ["customCharacter"] = "KARAKTERİNİ ÖZELLEŞTİR",
    ["adminDashboard"] = "ADMİN PANELİ",
    ["welcomeText"] = "HOŞ GELDİN, NE ALACAKSIN?",
    ["position"] = "POZİSYON",
    ["rotation"] = "ROTASYON",
    ["scale"] = "BOYUT",
    ["description"] = "Eşya için küçük bir açıklama",
    ["search"] = "  Eşya Ara...",
    ["sell"] = "Sat",
    ["buy"] = "Satın Al",
    ["buyaccessory"] = "Aksesuarı Satın Al",
    ["sellaccessory"] = "Aksesuarı Sat",
    ["sure"] = "Bunu yapmak istediğine emin misin?",
    ["activate"] = "Aktif",
    ["desactivate"] = "Deaktif",
    ["modifypos"] = "Pozisyonu Güncelle",
    ["edititem"] = "Eşyayı Düzenle",
    ["appearance"] = "Görünüi",
    ["skin"] = "Cilt",
    ["desc"] = "Açıklama",
    ["titleactivate"] = "Eşyayı Aktif / Deaktif et",
    ["choosecategory"] = "Kategori Seç",
    ["chooseskin"] = "Cilt Seç",
    ["additem"] = "Eşya Ekle",
    ["adminname"] = "Eşyanın ismi doğru değil !",
    ["faildesc"] = "Açıklaman doğru değil !",
    ["failprice"] = "Ücretin doğru değil !",
    ["choosemodel"] = "Aksesuarın için model seçmen lazım !",
    ["failcategory"] = "Aksesuarın için kategori seçmen lazım",
    ["updateItem"] = "Güncelledin",
    ["deleteItem"] = "Eşyayı sildin",
    ["ownedItem"] = "Zaten bu eşyaya sahipsin !",
    ["notEnoughtMoney"] = "Yeterli paraya sahip değilsin !",
    ["notRank"] = "Yeterli yetkiye sahip değilsin !",
    ["itemDesactivate"] = "Bu eşya deaktif !",
    ["sellItem"] = "Eşyayı şu kadara sattın",
    ["cantEquip"] = "Bu eşyayı kuşanamazsın !",
    ["itemVip"] = "Bu eşya VIP için rezerve edilmiş",
    ["jobProblem"] = "Bunu şu an olan mesleğinle yapamazsın !",
    ["exploitArmory"] = "Bu eylemi gerçekleştirmek için dolaba yakınlaşman lazım !",
    ["exploitNpc"] = "Bu eylemi gerçekleştirmek için NPC'ye yakınlaşman lazım !",
    ["saveBodygroup"] = "Karakterinin görünüşünü kaydettin !",
    ["addItem"] = "Eşyayı ekledin",
    ["buyItem"] = "Şunu satın aldın",
    ["for"] = "için",
    ["noItems"] = "Markette hiç eşya yok \n Daha fazla detay için bir admine ulaş !",
    ["yourInventory"] = "ENVANTERİN",
    ["emptyInventory"] = "Envanterinde hiç eşyan bulunmamakta",
    ["changeInv"] = "Şunu değiştirebilirsin",
    ["clickingHere"] = "buraya tıklayarak !",
    ["upHere"] = "Bu gün ne seçmek istiyorsun ?",
    ["equipItem"] = "Eşyanı az önce kuşandın",
    ["deequipedItem"] = "Eşyanı az önce çıkardın",
    ["equipModel"] = "Görünüşünü değiştirdin !",
    ["saveModel"] = "Modeli Kaydet",
    ["toomany"] = "Çantanda yeterli yer bulunmamakta.",
    ["backpack"] = "Çanta",
    ["bought"] = "Alınmış",
    ["comboskin"] = "Bir cilt seç",
    ["combocategory"] = "Bir kategori seç",
    ["waitItem"] = "Başka aksesuar giymek için beklemen lazım.",
    ["waitEquip"] = "Aksesuarı giyiyorsun..",
    ["swepcantgo"] = "Swep ile aksesuar mağazasına gidemezsin!",
    ["iconPos"] = "İkon pozisyonunu değiştir",
    ["iconFov"] = "İkon FOV'unu değiştir",
    ["itemUniqueId"] = "Eşyanın eşsiz ID'si",
    ["adjustAccessory"] = "Aksesuarı Ayarla",
    ["adjust"] = "Ayarla",
    ["adjustText"] = "Eşyayı ayarlamak istiyor musun ?",
    ["notOwned"] = "Bu eşyaya sahip değilsin !",
    ["rankBlackList"] = "Kara Listeye Alındı",

    ["titleGingerBread"] = "Turuncu Ekmek",
    ["titleCap"] = "Şapka",
    ["titleHeadphones"] = "Kulaklık",
    ["titleHawkMask"] = "Şahin Maskesi",
    ["titleBeret"] = "Bere",
    ["titleBandMask"] = "Grup Maskesi",
    ["titlePinguin"] = "Penguen Maskesi",
    ["titleMummyMask"] = "Mummya Maskesi",
    ["titleBandana"] = "Bandana",
    ["titleBag"] = "Çanta",
    ["titleMonkeyMask"] = "Maymun Maskesi",
    ["titleNinjaMask"] = "Ninja Maskesi",
    ["titleZombieMask"] = "Zombi Maskes,",
    ["titlePleaseStop"] = "Lütfen Dur",
    ["titleSkullMask"] = "Kurukafa Maskesi",
    ["titleGentlemanshat"] = "Şapkası",
    ["titleMaskDoctor"] = "Doktor Maskesi",
    ["titleOrangeHat"] = "Turuncu Şapka",
    ["titleBlackBagPack"] = "Siyah Çanta",
    ["titlePigHat"] = "Domuz Şapkası",
    ["titleCap2"] = "Şapka 2",
    ["titleBigBagpack"] = "Büyük Çanta 2",
    ["titleSchoolBagPack"] = "Okul Çantası",
    ["titleBeerHat"] = "Bira Şapkası",
    ["titleArmor"] = "Zırh",
    ["titleMaskDuck"] = "Ördek Maskesi",
    ["titleGlasses"] = "Gözlük",
    ["titleGlasses2"] = "Gözlük 2",
    ["titleAfro"] = "Afro",
    ["titleMarioHat"] = "Mario Şapkası",
    ["titleGlasses3"] = "Gözlük 3",
    ["titleLuigiHat"] = "Luigi Şapkası",
    ["titleGlasses4"] = "Gözlük 4",
    ["titleGlasses5"] = "Gözlük 5",
    ["titleToadHat"] = "Kurbağa Şapkası",
    ["titleServboHead"] = "Servbo Kafası",
    ["titleCatHat"] = "Kedi Şapkası",
    ["titleStrawHat"] = "Saman Şapka",
    ["titleRabbitEar"] = "Tavşan Kulağı",
    ["titleSunHat"] = "Güneş Şapkası",
    ["title3DGlasses"] = "3D Gözlük",
    ["titleCatsEars"] = "Kedi Kulağı",
    ["titleCatHat2"] = "Kedi Şaokası 2",
    ["titleJasonMask"] = "Jason Maskesi",
    ["titleMustache"] = "Bıyık",
    ["titleCowboyHat"] = "Cowboy Şapkası",
    ["titleDeadmau5"] = "Deadmau5",
    ["titleFrogHat"] = "Kurbağa Şapkası",
    ["titleHeartBand"] = "Kalp Kafa Bandı",
    ["titlePumpkinHead"] = "Şapkası",
    ["titleChristmasHat"] = "Yılbaşı Şapkası",
    ["titleStarHeadband"] = "Yıldız Kafa Bandı",
    ["titleThomasHat"] = "Thomas Şapkası",
    ["titleSombrero"] = "Sombrero",
    ["titleHeadphones2"] = "Kulaklık 2",
    ["titleSnowGoggles"] = "Kar Gözlüğü",
    ["titleCap3"] = "Şapka 3",
    ["titleHat"] = "Siyah Şapka",
    ["titleGlasses6"] = "Gözlük 6",
    ["titleCap4"] = "Şapka 4",
    ["titleDrinkCap"] = "İçki Şapkası",
    ["titleStarGlasses"] = "Yıldız Gözlüğü",
    ["titleCatEars"] = "Kedi Kulağı",
    ["titleHat2"] = "Şapka 2",
    ["titleBabyRhino"] = "Bebek Gergedan",
    ["titleArnoldMask"] = "Arnold Maskesi",
    ["titleChuckMask"] = "Chuck Maskesi",
    ["titleDeerMask"] = "Geyik Maskesi",
    ["titlePandaMask"] = "Panda Maskesi",
    ["titleMonkeyMask2"] = "Maymun Maskesi 2",
    ["titleBearMask"] = "Ayı Maskesi",
    ["titlePigMask"] = "Domuz Maskesi",
    ["titlePolishBeret"] = "Polonya Beresi",
    ["titlePolishBeret2"] = "Polonya Beresi",
    ["titlePolishBeret3"] = "Polonya Beresi",
    ["titleBikeHelmet"] = "Bisiklet Kaskı",
    ["titleBikeHelmet2"] = "Bisiklet Kaskı 2",
    ["titleBikeHelmet3"] = "Bisiklet Kaskı 3",
    ["titleBikeHelmet4"] = "Bisiklet Kaskı 4",
    ["titleBikeHelmet5"] = "Bisiklet Kaskı 5",
    ["titleBikeHelmet6"] = "Bisiklet Kaskı 6",
    ["titleBikeHelmet7"] = "Bisiklet Kaskı 7",
    ["titleBikeHelmet8"] = "Bisiklet Kaskı 8",
    ["titleBikeHelmet9"] = "Bisiklet Kaskı 9",
    ["titleBikeHelmet10"] = "Bisiklet Kaskı 10",
    ["titleBikeHelmet11"] = "Bisiklet Kaskı 11",
    ["titleBikeHelmet12"] = "Bisiklet Kaskı 12",
    ["titleBikeHelmet13"] = "Bisiklet Kaskı 13",
    ["titleBikeHelmet14"] = "Bisiklet Kaskı 14",
    ["titleBikeHelmet15"] = "Bisiklet Kaskı 15",
    ["titlePumpkinMask"] = "Maskesi",
    ["titleHorseMask"] = "At Maskesi",
    ["titleHorseMask2"] = "At Maskesi 2",
    ["titleHorseMask3"] = "At Maskesi 3",
    ["titleRussianHat"] = "Rus Şapkası",

    ["descGingerBread"] = "Güzel turuncu bir sakal",
    ["descCap"] = "Üşürsen diye bir şapka!",
    ["descHeadphones"] = "Müzik falan dinlersin diye",
    ["descHawkMask"] = "Milli yıldızımız Şahin K. adına",
    ["descBeret"] = "Sende güzel durdu vay!",
    ["descBandMask"] = "En iyi suç maskesi",
    ["descPinguin"] = "Ensesine vurmalık bir penguen oldun",
    ["descMummyMask"] = "Anubisin arkadaşı oldun",
    ["descBandana"] = "Klasik bandana. Skrrt skkrt drill gang",
    ["descBag"] = "Favori manavş poşetin!",
    ["descMonkeyMask"] = "Wukong maskesi veya multeci maskesi. Hangisi sen seç",
    ["descNinjaMask"] = "Harakiri yapma garantili!",
    ["descZombieMask"] = "Karşı tarafa ziyaret amaçlı kullan!",
    ["descPleaseStop"] = "Güzel bir maske!",
    ["descSkullMask"] = "Resmi olarak ölmüş olursun, yani değil mi?",
    ["descGentlemanshat"] = "Kadınlara kapı açarak centilmen olabilirsin",
    ["descMaskDoctor"] = "Doktor maskesi",
    ["descOrangeHat"] = "Turuncu bir şapka",
    ["descBlackBagPack"] = "Siyah renkli bir çanta",
    ["descPigHat"] = "Domuzlar haram olsa da tatlılar değil mi?",
    ["descCap2"] = "Güneşten korun yanmayıver!",
    ["descBigBagpack"] = "Büyük bir çanta",
    ["descSchoolBagPack"] = "Okul çantası",
    ["descBeerHat"] = "Kolayca bira içebilirsin artık",
    ["descArmor"] = "Mermmi geçirmezsin artık. Gunrp için güzel bir sebep.",
    ["descMaskDuck"] = "Ördek maskesiyle ördek avla, diğer ördeklerin tepkisi güzel olur.",
    ["descGlasses"] = "Eğer gözlerinde problem varsa al bunu",
    ["descGlasses2"] = " Eğer gözlerinde problem varsa al bunu",
    ["descAfro"] = "Şekil mi gözükeceksin?",
    ["descMarioHat"] = "Hayatım boyunca sevgili yapmadım demenin 2. yolu!",
    ["descGlasses3"] = "Eğer gözlerinde problem varsa al bunu",
    ["descLuigiHat"] = "Hayatım boyunca sevgili yapmadım demenin 3. yolu!",
    ["descGlasses4"] = "Eğer gözlerinde problem varsa al bunu",
    ["descGlasses5"] = "Eğer gözlerinde problem varsa al bunu",
    ["descToadHat"] = "Hastasına ayrı!",
    ["descServboHead"] = "Hayat çok güzel",
    ["descCatHat"] = "Güzel bir kedi şapkası.",
    ["descStrawHat"] = "DST fanları için samandan güzel bir şapka!",
    ["descRabbitEar"] = "İyi duymanı sağlayacak bir tavşan kulağı",
    ["descSunHat"] = "Ulaşımını kolaylaştırır",
    ["desc3DGlasses"] = "3D recep ivedik izlemek için bir gözlük!",
    ["descCatsEars"] = "Hayır, lütfen kedi gibi davranma sevgiline..",
    ["descCatHat2"] = "Tamam şimdi kedi gibi davranabilirsin.",
    ["descJasonMask"] = "Kampa gitmek için çok uygun bir maske değil mi?",
    ["descMustache"] = "Siyaseti yönlendirmeni sağlayacak bir bıyık!",
    ["descCowboyHat"] = "Morgan? O sen misin?",
    ["descDeadmau5"] = "Deadmau5 olmak ister misin?",
    ["descFrogHat"] = "Tatlı bir kurbağa şapkası.",
    ["descHeartBand"] = "Kalbin için bir kafa bandı.",
    ["descPumpkinHead"] = "Cadılar bayramı için ideal.",
    ["descChristmasHat"] = "Müslüman noel kutlamaz ama yılbaşı kutlar unutma.",
    ["descStarHeadband"] = "Bu kafa bandı ile yıldız ol.",
    ["descThomasHat"] = "Müzik dinlemeyi sever misin?",
    ["descSombrero"] = "Bunu takınca kokain üretmeye başlamıyosun hayır!",
    ["descHeadphones2"] = "Trap dışındaki tüm kaliteli müzikleri dinleyebilirsin",
    ["descSnowGoggles"] = "TGüvenli şekilde kayak yapmak için!",
    ["descCap3"] = "Klasik bir şapka.",
    ["descHat"] = "Lüks siyah bir şapka.",
    ["descGlasses6"] = "Lüks bir gözlük.",
    ["descCap4"] = "Açıklama yazmaktan yoruldum. İşte bir şapka.",
    ["descDrinkCap"] = "Sarhoşlar için güzel bir şaoka!",
    ["descStarGlasses"] = "Rockstar mısın be!",
    ["descCatEars"] = "LÜTFEN ANİME KIZI TAKLİDİ YAPMA BUNUNLA.",
    ["descHat2"] = "Siyah bir şapka.",
    ["descBabyRhino"] = "Gergedansın artık.",
    ["descArnoldMask"] = "Arnold şapkası ama kaslanmıyosun.",
    ["descChuckMask"] = "Chuck Maskesi",
    ["descDeerMask"] = "Geyik maskesi!",
    ["descPandaMask"] = "Yatakta iş gören bir panda maskesi",
    ["descMonkeyMask2"] = "Mülteci veya mültecileri savunanların taklidi için güzel bir maske!",
    ["descBearMask"] = "Rusyada değilsen bunu takmanın bir derdi olmaz",
    ["descPigMask"] = "Haram olsa bile güzel duruyo",
    ["descPolishBeret"] = "Polonyalı Beresi",
    ["descPolishBeret2"] = "Polonyalı Beresi",
    ["descPolishBeret3"] = "Polonyalı Beresi",
    ["descBikeHelmet"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet2"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet3"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet4"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet5"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet6"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet7"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet8"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet9"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet10"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet11"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet12"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet13"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet14"] = "Yaralanmaman için bir kask!",
    ["descBikeHelmet15"] = "Yaralanmaman için bir kask!",
    ["descPumpkinMask"] = "Gzel bir cadılar bayramı için",
    ["descHorseMask"] = "Artık bir atsın",
    ["descHorseMask2"] = "Artık bir atsın",
    ["descHorseMask3"] = "Artık bir atsın",
    ["descRussianHat"] = "Cyka blyat idi nahui!",
}
--76561198442896680
--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_gradients.lua:
//   This Source Code Form is subject to the terms of the Mozilla Public
//   License, v. 2.0. If a copy of the MPL was not distributed with this
//   file, You can obtain one at http://mozilla.org/MPL/2.0/.
//   https://github.com/Bo98/garrysmod-util/blob/master/LICENSE
//   https://github.com/Bo98/garrysmod-util/blob/master/lua/autorun/client/gradient.lua

local mat_white = Material("vgui/white")

function AAS.SimpleLinearGradient(x, y, w, h, startColor, endColor)
	AAS.LinearGradient(x, y, w, h, {{offset = 0, color = startColor}, {offset = 1, color = endColor}})
end

function AAS.LinearGradient(x, y, w, h, stops)
	if #stops == 0 then
		return
	elseif #stops == 1 then
		surface.SetDrawColor(stops[1].color)
		surface.DrawRect(x, y, w, h)
		return
	end

	table.SortByMember(stops, "offset", true)

	render.SetMaterial(mat_white)
	mesh.Begin(MATERIAL_QUADS, #stops - 1)
    
	for i = 1, #stops - 1 do
		local offset1 = math.Clamp(stops[i].offset, 0, 1)
		local offset2 = math.Clamp(stops[i + 1].offset, 0, 1)
		if offset1 == offset2 then continue end

		local deltaX1, deltaY1, deltaX2, deltaY2

		local color1 = stops[i].color
		local color2 = stops[i + 1].color

		local r1, g1, b1, a1 = color1.r, color1.g, color1.b, color1.a
		local r2, g2, b2, a2
		local r3, g3, b3, a3 = color2.r, color2.g, color2.b, color2.a
		local r4, g4, b4, a4

		r2, g2, b2, a2 = r1, g1, b1, a1
        r4, g4, b4, a4 = r3, g3, b3, a3
        deltaX1 = 0
        deltaY1 = offset1 * h
        deltaX2 = w
        deltaY2 = offset2 * h

		mesh.Color(r1, g1, b1, a1)
		mesh.Position(Vector(x + deltaX1, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r2, g2, b2, a2)
		mesh.Position(Vector(x + deltaX2, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r3, g3, b3, a3)
		mesh.Position(Vector(x + deltaX2, y + deltaY2))
		mesh.AdvanceVertex()

		mesh.Color(r4, g4, b4, a4)
		mesh.Position(Vector(x + deltaX1, y + deltaY2))
		mesh.AdvanceVertex()
	end
	mesh.End()
end
--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_functions.lua:
function AAS.GetMaterial(cat)
	local mat = AAS.Materials["all"]
	for k,v in ipairs(AAS.Category["mainMenu"]) do
		if cat != v.uniqueName then continue end
		
		mat = v.material
	end
	return mat
end

function AAS.GetInventoryByCategory(category)
	local itemsInventory = AAS.ClientTable["ItemsInventory"]
	local tableToSend = {}
	
	for k,v in pairs(itemsInventory) do
		if not isnumber(tonumber(v.uniqueId)) then continue end
		
		local itemTable = AAS.GetTableById(v.uniqueId)
		if itemTable.category != category then continue end

		tableToSend[category] = tableToSend[category] or {}
		tableToSend[category][#tableToSend[category] + 1] = v
	end

	return tableToSend
end

function AAS.CountInventory()
	local itemsInventory = AAS.ClientTable["ItemsInventory"]
	local Count = 0
	
	for k,v in pairs(itemsInventory) do
		if not isnumber(tonumber(v.uniqueId)) then continue end
		
		local itemTable = AAS.GetTableById(v.uniqueId)
		if not istable(itemTable) or table.Count(itemTable) == 0 then continue end

		Count = Count + 1
	end

	return Count
end

function AAS.BreakText(text, max)
    if not isstring(text) then return end
    if not isnumber(max) then return end

    local oldText = string.Trim(text)
    local newText = ""

    local words = string.Explode(" ", oldText)

    local textLine = ""
    local caracterLineCount = 0
    for k, v in ipairs(words) do
        if (caracterLineCount + string.len(v)) < max then
            textLine = textLine.." "..v
        else
            newText = (newText == "") and textLine or newText.."\n"..textLine
            textLine = " "..v
        end
        caracterLineCount = string.len(textLine)
    end
    newText = (newText == "") and textLine or newText.."\n"..textLine

    return newText
end

function AAS.ConvertVector(pos, offset, ang)
	return Vector(pos + ang:Forward() * offset.x + ang:Right() * offset.y + ang:Up() * offset.z)
end

function AAS.ConvertAngle(ang, vector)
	ang = Angle(ang)

	ang:RotateAroundAxis(ang:Up(), vector.x)
	ang:RotateAroundAxis(ang:Right(), vector.y)
	ang:RotateAroundAxis(ang:Forward(), vector.z)

	return ang
end

function AAS.GetTableById(uniqueId)
	uniqueId = tonumber(uniqueId)

	local tbl = {}
	for k,v in pairs(AAS.ClientTable["ItemsTable"]) do
		if tonumber(v.uniqueId) == uniqueId then
			tbl = v
			break
		end
	end
	return tbl
end

function AAS.SetPanelSettings(panel, tbl)
	local skin = tonumber(tbl.options.skin)
	if isnumber(skin) then
		panel.Entity:SetSkin(skin)
	end

	local color = tbl.options.color
	if istable(color) then
		panel:SetColor(color)
	end
end

function AAS.ItemIsBought(uniqueId)
	local uniqueId = tonumber(uniqueId)

	local sell = false
	for k,v in pairs(AAS.ClientTable["ItemsInventory"]) do
		if tonumber(v.uniqueId) == uniqueId then
			sell = true 
			break
		end 
	end
	return sell
end

--PATH addons/sl_util_accessory/lua/advanced_accessories/client/cl_models.lua:
function AAS.ChangeModels()
    local table = (AAS.UseDarkRPModel and DarkRP) and RPExtraTeams[AAS.LocalPlayer:Team()].model or (AAS.CustomModelTable[team.GetName(AAS.LocalPlayer:Team())] or {})

    AAS.BaseMenu(AAS.GetSentence("customCharacter"), false, AAS.ScrW*0.2, "customcharacter")

    AAS.ClientTable["Id"] = 1

    local modelGet, idSelected = AAS.LocalPlayer:GetModel(), nil
    
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
    sliderList:SetSize(AAS.ScrW*0.19, AAS.ScrH*0.43)
    sliderList:SetPos(accessoriesFrame:GetWide() - AAS.ScrW*0.195, AAS.ScrH*0.12)
    sliderList:GetVBar():SetSize(0,0)

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
        local model = playerModel:GetModel()

        net.Start("AAS:Models")
            net.WriteString(model)
        net.SendToServer()
    end 

    local itemContainer = vgui.Create("DIconLayout", sliderList)
    itemContainer:SetSize(AAS.ScrW*0.384, AAS.ScrH*0.542)
    itemContainer:SetSpaceX(AAS.ScrW*0.008) 
    itemContainer:SetSpaceY(AAS.ScrW*0.008)

    for k,v in pairs(table) do
        if modelGet == v then idSelected = k end
        
        local model = vgui.Create("SpawnIcon", itemContainer)
        model:SetSize( ScrH()*0.07, ScrH()*0.07 )
        model:SetModel(v)
        model:SetTooltip(false)
        model.Icon:SetSize(3, 3)

        local LerpColor = 0
        model.Paint = function(self,w,h)
            LerpColor = Lerp(FrameTime()*5, LerpColor, (idSelected == k) and 255 or 0)

            draw.RoundedBox(0, 0, 0, w, h, AAS.Colors["dark34"])
            surface.SetDrawColor((idSelected == k) and ColorAlpha(AAS.Colors["selectedBlue"], LerpColor) or AAS.Colors["white"])
            surface.DrawOutlinedRect( 0, 0, w, h, AAS.ScrH*0.003)
        end
        function model:PerformLayout()
            self.Icon:StretchToParent(3, 3, 3, 3)
        end
        model.DoClick = function()
            idSelected = k
            playerModel:SetModel(v)
        end
        model.Think = function() end
    end
end
--PATH addons/sl_util_accessory/lua/advanced_accessories/vgui/cl_searchbar.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize(AAS.ScrW*0.175, AAS.ScrH*0.03)
    
    local dtexEntry = vgui.Create("DTextEntry", self)
    dtexEntry:SetTextColor(AAS.Colors["white"])
    dtexEntry:SetSize(AAS.ScrW*0.17, AAS.ScrH*0.03)
    dtexEntry:SetPos(AAS.ScrW*0.005, 0)
    dtexEntry:SetDrawLanguageID(false)
    dtexEntry:SetText(AAS.GetSentence("search"))
    dtexEntry:SetFont("AAS:Font:03")
    dtexEntry.AASBaseText = AAS.GetSentence("search")
    dtexEntry.Paint = function(self,w,h) 
        self:DrawTextEntryText(AAS.Colors["black18200"], AAS.Colors["black18200"], AAS.Colors["black18200"])
    end 
    dtexEntry.AllowInput = function(self, stringValue)    
        if #self:GetValue() > 20 then
            return true 
        end 
    end 
    dtexEntry.OnGetFocus = function(self)
        if self:GetValue() == self.AASBaseText then
            self:SetText("") 
        end 
    end 
    dtexEntry.OnLoseFocus = function(self)
        if self:GetValue() == "" then
            self:SetText(self.AASBaseText)
        end
    end 
    
    dtexEntry.GetAutoComplete = function(self, text)
        AAS.ClientTable["filters"]["search"] = text
        
        AAS.UpdateList(AAS.ClientTable["ItemsVisible"], istable(AAS.ClientTable["ItemSelected"]))
    end
    
    self.AASTextEntry = dtexEntry
    self.AASBaseText = self:GetValue()
end

function PANEL:Paint(w,h) 
    surface.SetDrawColor(AAS.Colors["white"])
    surface.SetMaterial(AAS.Materials["searchbar"])
    surface.DrawTexturedRect(0, 0, w, h)
end

derma.DefineControl("AAS:SearchBar", "AAS SearchBar", PANEL, "DPanel")

--PATH addons/sl_aphone/lua/autorun/aphone_loader.lua:
aphone = aphone or {}
aphone.Config = aphone.Config or {}
aphone.RegisteredApps = {}

local start_time = SysTime()

local function include_dir(dir)
    local files, folders = file.Find(dir .. "*", "LUA")

    for k,v in ipairs(files) do
        local prefix = string.sub(v, 1, 3)
        local file_dir = dir .. v

        if aphone.disable_hitman and string.find(file_dir, "darkweb") then continue end

        if prefix == "sh_" then
            if SERVER then
                AddCSLuaFile(file_dir)
            end
            include(file_dir)
        elseif prefix == "sv_" and SERVER then
            include(file_dir)
        elseif prefix == "cl_" then
            if SERVER then
                AddCSLuaFile(file_dir)
            else
                include(file_dir)
            end
        else
            print("[APhone] Can't include " .. v .. ", wrong prefix")
            continue
        end
    end

    for k, v in ipairs(folders) do
        include_dir(dir .. v .. "/")
    end
end

include("aphone/sh_config.lua")

if !aphone.RadioList then
    print("------ APhone ------")
    print("You got a issue with installation, the config file can't be loaded")
    print("Follow these instructions to debug the config file")
    print("Check before this message in your console if there any errors OR paste your config in this file : https://fptje.github.io/glualint-web/")
    print("Most of the time, it's a missing comma or quotation marks")
    print("To prevent any issues, APhone will stop loading")
    print("--------------------")
    return
end

if SERVER then
    AddCSLuaFile("aphone/sh_config.lua")
    AddCSLuaFile("aphone/languages/" .. aphone.Language .. ".lua")
    include("aphone/sv_config.lua")
    resource.AddWorkshop( "2485178558" )
end

include("aphone/languages/" .. aphone.Language .. ".lua")

include_dir("aphone/_libs/")
include_dir("aphone/apps/")
hook.Run("aphone_PostLoad")

if aphone.DebugMode then
    print("[APhone] Loading in " .. SysTime() - start_time .. "s")
end
--PATH addons/sl_aphone/lua/aphone/_libs/__header/sh_devconfig.lua:
// You shouldn't be in this file if you are not a developer, you should edit the sh_config in aphone/_libs
// If you got any issues with this config, I won't help you because I consider that you are a developer, therefore able to debug errors
// Default painting
aphone.MaxPainting = 30
aphone.DebugMode = false
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_fonts.lua:
local fonts = {
    ["Roboto18_500"] = {
        font = "Roboto",
        size = 18,
        weight = 500,
        antialias = true
    },
    ["Little"] = {
        font = "Roboto",
        size = 20,
        weight = 1000,
        antialias = true
    },
    ["Little2"] = {
        font = "Roboto",
        size = 20,
        weight = 800,
        antialias = true
    },
    ["Small"] = {
        font = "Roboto",
        size = 25,
        weight = 500,
        antialias = true
    },

    ["Little_NoWeight"] = {
        font = "Roboto",
        size = 20,
        antialias = true
    },

    ["Medium"] = {
        font = "ebrima",
        size = 30,
        antialias = true,
        weight = 550
    },
    ["MediumHeader"] = {
        font = "Roboto",
        size = 30,
        antialias = true
    },

    ["MediumHeader_500"] = {
        font = "Roboto",
        size = 30,
        weight = 550,
        antialias = true
    },

    ["Header_Friends"] = {
        font = "Volaroid Script",
        size = 100,
        weight = 800,
        antialias = true
    },

    ["StartScreen"] = {
        font = "Strasua",
        size = 80,
        antialias = true
    },

    ["Roboto40"] = {
        font = "Roboto",
        size = 40,
        antialias = true
    },

    ["Roboto40_700"] = {
        font = "Roboto",
        size = 40,
        antialias = true,
        weight = 700
    },

    ["Roboto45_700"] = {
        font = "Roboto",
        size = 45,
        antialias = true,
        weight = 700
    },

    ["Roboto60"] = {
        font = "Roboto",
        size = 60,
        antialias = true,
        weight = 550
    },

    ["Roboto80"] = {
        font = "Roboto",
        size = 80,
        antialias = true,
        weight = 550
    },

    ["DateShow_200"] = {
        font = "Arial",
        size = 200,
        antialias = true
    },
    -- SVG
    ["SVG_16"] = {
        font = "Akulla_SVG",
        size = 16,
        antialias = true
    },

    ["SVG_20"] = {
        font = "Akulla_SVG",
        size = 20,
        antialias = true
    },

    ["SVG_25"] = {
        font = "Akulla_SVG",
        size = 25,
        antialias = true
    },

    ["SVG_30"] = {
        font = "Akulla_SVG",
        size = 30,
        antialias = true
    },

    ["SVG_40"] = {
        font = "Akulla_SVG",
        size = 40,
        antialias = true
    },

    ["SVG_45"] = {
        font = "Akulla_SVG",
        size = 45,
        antialias = true
    },

    ["SVG_60"] = {
        font = "Akulla_SVG",
        size = 60,
        antialias = true
    },

    ["SVG_76"] = {
        font = "Akulla_SVG",
        size = 76,
        antialias = true
    },

    ["SVG_90"] = {
        font = "Akulla_SVG",
        size = 90,
        antialias = true
    },

    ["SVG_180"] = {
        font = "Akulla_SVG",
        size = 180,
        antialias = true
    },
    -- Darkweb
    ["BigDarkweb"] = {
        font = "Rockwell",
        size = 60,
        antialias = true
    },

    ["HeaderDarkWeb"] = {
        font = "Rockwell",
        size = 30,
        antialias = true
    },

    ["LittleDarkWeb"] = {
        font = "Rockwell",
        size = 20,
        antialias = true
    }
}

local backup_setting = aphone:GetParameters("Core", "2D", false)

local function create_fonts()
    for _, tags in ipairs({"3D", "2D"}) do
        -- Doing this check so the scaledsize got the good 3D/2D state and not return 2D size for 3D or 3D size for 2D
        aphone:ChangeParameters("Core", "2D", tags ~= "3D")

        for k, v in pairs(fonts) do
            local cp = table.Copy(v)
            cp.size = math.floor(aphone.GUI.ScaledSize(cp.size))

            if cp.weight then
                cp.weight = math.floor(aphone.GUI.ScaledSize(cp.weight))
            end

            surface.CreateFont(k .. "_" .. tags, cp)
        end
    end

    aphone:ChangeParameters("Core", "2D", backup_setting)
end

create_fonts()

function aphone:GetFont(name)
    return name .. "_" .. (aphone:Is2D() and "2D" or "3D")
end

hook.Add("OnScreenSizeChanged", "APhone_RefreshFonts", function()
    create_fonts()
end)
--PATH addons/sl_aphone/lua/aphone/_libs/_utilities/cl_panels.lua:
local meta = FindMetaTable("Panel")

function meta:Phone_AskTextEntry(text, max_char, panel_resize, panel_wide, only_resizetargetpnl)
	// If you make a error with that, this will catch it, I can't take the risk to hostage the player with invisible, self-locking panel
	local pnl = self
	local hit_me = vgui.Create("EditablePanel")
	hit_me:SetSize(ScrW(), ScrH())
	hit_me:SetMouseInputEnabled(true)

	local good, err = pcall(function()
		local t = vgui.Create("DTextEntry", hit_me)
		t:MakePopup()
		t:SetSize(ScrW(), ScrH())
		t:SetAlpha(0)
		t:SetMultiline(false)
		t:SetValue(text or "")
		t.aphone_dontmiddlemouse = true

		if placeholder then
			t:SetPlaceholderText(placeholder)
		end

		pnl.oldsize_text = pnl.oldsize_text or pnl:GetTall()

		if panel_resize then
			panel_resize.oldsize_text = panel_resize.oldsize_text or panel_resize:GetTall()
		end

		local oldsize = pnl.oldsize_text

		surface.SetFont(pnl:GetFont())
		local txt_w = surface.GetTextSize("... | ")

		local block_change = false
		function t:OnChange()
			if block_change then return end

			local txt = self:GetValue() or ""
			local cursorpos = self:GetCaretPos()

			txt = utf8.sub(txt, 1, cursorpos) .. "|" .. utf8.sub(txt, cursorpos + 1)

			pnl:SetText(txt)

			if IsValid(pnl) and pnl.textChange then
				pnl:textChange(self:GetValue())
			end

			if panel_resize then
				// Remove first line, it should be in the old_size
				local wrapped_text = aphone.GUI.WrapText(pnl:GetText(), pnl:GetFont(), (panel_wide or pnl:GetWide()) - txt_w) or "o"
				local splitted_tbl = string.Split( tostring(wrapped_text), "\n" )
				table.remove(splitted_tbl, 1)

				// Font already set by wraptext
				if !table.IsEmpty(splitted_tbl) then
					pnl:SetText(wrapped_text)
				end

				local wrapped_size = select(2, surface.GetTextSize(wrapped_text))

				if wrapped_size < oldsize then
					if !only_resizetargetpnl then
						pnl:SetTall(oldsize)
					end

					panel_resize:SetTall(panel_resize.oldsize_text)
				else
					if !only_resizetargetpnl then
						pnl:SetTall(oldsize + select(2, surface.GetTextSize(wrapped_text)))
					end

					panel_resize:SetTall(panel_resize.oldsize_text + select(2, surface.GetTextSize(wrapped_text)))
				end
			end
		end

		if max_char then
			function t:AllowInput()
				return string.len(self:GetValue()) > max_char
			end
		end

		local old_caret = t:GetCaretPos()

		function t:Think()
			if !IsValid(pnl) then
				self:Remove()
			end

			if old_caret != t:GetCaretPos() then
				self:OnChange()

				if pnl:GetName() != "DTextEntry" then
					old_caret = t:GetCaretPos()
				else
					pnl:SetCaretPos(self:GetCaretPos())
				end
				old_caret = t:GetCaretPos()
			end
		end

		function t:OnEnter()
			block_change = true
			pnl:SetText(self:GetValue())
			if IsValid(pnl) and pnl.textEnd then
				pnl:textEnd(self:GetValue(), aphone.GUI.WrapText(pnl:GetText(), pnl:GetFont(), (panel_wide or pnl:GetWide()) - txt_w))
			end
			hit_me:Remove()
		end

		function t:OnMousePressed()
			if t.OnEnter then
				t:OnEnter()
			end
		end

		// Refresh
		t:OnChange()
		hit_me:aphone_RemoveCursor()

		return t
	end )

	if !good then
		aphone.AddNotif("alert", aphone.L("Error_FailedTextScreen"), 3)
		hit_me:Remove()
		ErrorNoHaltWithStack(err)
	end
end

function meta:Phone_AlphaHover()
	function self:OnCursorEntered()
		self:SetTextColor(aphone:Color("Text_White"))
	end

	function self:OnCursorExited()
		self:SetTextColor(aphone:Color("Text_White120"))
	end

	self:SetTextColor(aphone:Color("Text_White120"))
end

function meta:Phone_DrawTop(w, h, dark)
	local hour_label = vgui.Create("DLabel", self)
	hour_label:SetPos(w * 0.08, 0)
	hour_label:SetFont(aphone:GetFont("Little2"))
	hour_label:SetText(os.date("%H:%M"))
	hour_label:SetSize(w * 0.25, h * 0.05)
	hour_label:SetTextColor(dark and color_black or color_white)

	local wifi_label = vgui.Create("DLabel", self)
	wifi_label:SetPos(w * 0.82, 0)
	wifi_label:SetFont(aphone:GetFont("SVG_25"))
	wifi_label:SetText("s")
	wifi_label:SetSize(w * 0.25, h * 0.05)
	wifi_label:SetTextColor(dark and color_black or color_white)
	wifi_label.stack_minutes = math.ceil(os.time() / 60)

	// This sounds weird, but it's the way I found to refresh time, without using the drawtext and taking performances
	function hour_label:Think()
		local actual_stack = math.ceil(os.time() / 60)
		if wifi_label.stack_minutes != actual_stack then
			self:SetText(os.date("%H:%M"))
			wifi_label.stack_minutes = actual_stack
		end
	end

	local radio_label = vgui.Create("DLabel", self)
	radio_label:SetPos(w * 0.80, 0)
	radio_label:SetFont(aphone:GetFont("SVG_25"))
	radio_label:SetText("p")
	radio_label:SetSize(w * 0.25, h * 0.05)
	radio_label:SetTextColor(dark and color_black or color_white)
	radio_label.stack_minutes = math.ceil(os.time() / 60)
	radio_label:SetAlpha(0)

	function radio_label:Think()
		if IsValid(aphone.My_Radio) then
			if self:GetAlpha() == 0 then
				self:SetAlpha(255)
				wifi_label:SetPos(w * 0.87, 0)
			end
		else
			if self:GetAlpha() == 255 then
				wifi_label:SetPos(w * 0.82, 0)
				self:SetAlpha(0)
			end
		end
	end
end
--PATH addons/sl_aphone/lua/aphone/_libs/gamemodes_related/sh_basewars.lua:
-- My own basewars gamemode, not the gmodstore one
if basewars and basewars.config and basewars.config.jetski then
    aphone.Gamemode = {}

    function aphone.Gamemode.Afford(ply, amt)
        return ply:GetMoney() >= amt
    end

    function aphone.Gamemode.AddMoney(ply, amt)
        if ply:GetMoney() + amt < 0 then return false end

        ply:SetNWString("Money", ply:GetMoney() + amt)
        ply:SetNWString("MoneyMade", tostring(tonumber(ply:GetNWString("MoneyMade")) + amt))
        ply:SendNotif("Vous avez reçu " .. tostring(pretty_value(math.Round(amt))), "blue", "You received " .. tostring(pretty_value(math.Round(amt))))
        ply:SaveSQL(ply:GetNWString("Money"), "money")
        ply:SaveSQL(ply:GetNWString("MoneyMade"), "moneymade")
    end

    function aphone.Gamemode.Format(amt)
        return pretty_value(amt, 0)
    end
end

--PATH addons/sl_aphone/lua/aphone/_libs/gamemodes_related/sh_darkrp.lua:
hook.Add("DarkRPFinishedLoading", "aphone_LoadGMDarkRP", function()
    aphone.Gamemode = {}

    function aphone.Gamemode.Afford(ply, amt)
        return ply:canAfford(amt)
    end

    function aphone.Gamemode.AddMoney(ply, amt)
        local money = ply:getDarkRPVar("money")
        if money + amt < 0 then return false end

        ply:addMoney(amt)
        return true
    end

    function aphone.Gamemode.GetMoney(ply)
        if CLIENT then
            return LocalPlayer():getDarkRPVar("money")
        else
            return ply:getDarkRPVar("money")
        end
    end

    function aphone.Gamemode.Format(amt)
        return DarkRP.formatMoney(amt)
    end
end)

--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_applist.lua:
local PANEL = {}

local mat_roundedboxsys = Material("akulla/aphone/rounded_boxappsys.png", "smooth 1")
local redb = Color(255, 0, 0)

function PANEL:Init()
    self:SetSize(self:GetParent():GetSize())

    local font_app = aphone:GetFont("Roboto18_500")
    local cache_shadow = Color(60, 60, 60, 60)
    local cache_whiteapp = aphone:Color("Text_Apps")
    local cache_stencil = Color(1, 1, 1, 1)

    local margin = self:GetWide() * 0.05
    local self_alt = self
    self:Phone_DrawTop(self:GetSize())

    local layout_app_panel = vgui.Create("DPanel", self)
    layout_app_panel:Dock(FILL)
    layout_app_panel:DockMargin(margin, margin + aphone.GUI.ScaledSizeY(24), margin, margin)
    layout_app_panel:SetPaintBackground(false)

    local app_syspnl = vgui.Create("DPanel", layout_app_panel)
    app_syspnl:Dock(BOTTOM)
    app_syspnl:SetTall(self:GetTall() * 0.13)

    function app_syspnl:Paint(w, h)
        //surface.SetDrawColor(cache_shadow)
        //surface.SetMaterial(mat_roundedboxsys)
        //surface.DrawTexturedRect(0, 0, w, h)
    end

    local perfect_iconsize = (self:GetWide() - margin * 4 - aphone.GUI.ScaledSizeX(20)) / 4

    local app_syslayout = vgui.Create("DIconLayout", app_syspnl)
    app_syslayout:Dock(FILL)
    app_syslayout:DockMargin(margin, margin, margin, margin)
    app_syslayout:SetSpaceX(aphone.GUI.ScaledSizeX(5))

    local app_scroll = vgui.Create("DScrollPanel", layout_app_panel)
    app_scroll:Dock(FILL)
    app_scroll:DockMargin(margin, margin, margin, margin)

    local app_layout = vgui.Create("DIconLayout", app_scroll)
    app_layout:Dock(FILL)
    app_layout:SetSpaceY(aphone.GUI.ScaledSizeX(self:GetTall()*0.015))
    app_layout:SetSpaceX(aphone.GUI.ScaledSizeX(5))
    app_layout:aphone_PaintScroll()

    local scaled_size30 = aphone.GUI.ScaledSizeY(30)

    // Let's load big app after normal apps
    local tbl_app = {}
    local tbl_appbig = {}

    for k, v in pairs(aphone.RegisteredApps) do
        table.insert(v.bigshow and tbl_appbig or tbl_app, v)
    end

    table.Add(tbl_app, tbl_appbig)

    for k,v in ipairs(tbl_app) do
        if v.ShowCondition and !v.ShowCondition(LocalPlayer()) then continue end

        local but = vgui.Create("DButton")
        but:SetText(v.Default and "" or v.name)
        but:SetContentAlignment(2)

        if v.bigshow then
            but:SetSize(perfect_iconsize * 2, perfect_iconsize * 2 + scaled_size30)
        else
            but:SetSize(perfect_iconsize, perfect_iconsize + scaled_size30)
        end

        but:SetFont(font_app)
        but:SetTextColor(cache_whiteapp)

        if v.Default then
            app_syslayout:Add(but)
        else
            app_layout:Add(but)
        end

        // CACHE EVERYTHING !
        local frac = 0
        local last_check = CurTime()
        local mat = v.icon
        local is_hovered = false
        local n = 0

        // Using IsHovered would be really easier, but when you got 15 buttons calling everytime this function, fprofiler cries
        function but:OnCursorEntered()
            is_hovered = true
        end

        function but:OnCursorExited()
            is_hovered = false
        end

        function but:Paint(w, h)
            if frac != 0 or is_hovered then
                local c = CurTime()

                if is_hovered then
                    frac = frac + (c - last_check) * 4
                else
                    frac = frac - (c - last_check) * 4
                end

                last_check = c

                // Math.clamp kill my fprofiler I dunno why
                if frac > 1 then
                    frac = 1
                elseif frac < 0 then
                    frac = 0
                end
            end

            surface.SetDrawColor(color_white)
            surface.SetMaterial(mat)
            surface.DrawTexturedRect(w * 0.05 * frac, h * 0.05 * frac, w * (1 - 0.1 * frac), (h - scaled_size30) * (1 - 0.1 * frac))

            if v.NotifyCount then
                local n = v:NotifyCount()

                if n != 0 then
                    DisableClipping(true)
                        draw.RoundedBox(8, w - (w * 0.05 * frac) - 12, -4, 16, 16, redb)
                    DisableClipping(false)
                end
            end
        end

        function but:DoClick()
            if v.Complete_Detour then
                v:Open()
                return
            end

            local pos_x, pos_y = self_alt:GetSize()

            local anim_p = vgui.Create("DPanel", self_alt:GetParent())
            anim_p:Dock(FILL)

            local p = vgui.Create("DPanel", anim_p)
            aphone.Horizontal = false
            p:Dock(FILL)

            // Circle open anim
            local anim = anim_p:NewAnimation(0.5, 0, 0.5)

            function anim:Think(_, frac_anim)
                anim_p.frac = frac_anim
            end

            function anim_p:PaintOver()
                render.SetStencilEnable(false)
            end

            function anim_p:OnRemove()
                if aphone.Running_App and aphone.Running_App.OnClose then
                    aphone.Running_App.OnClose()
                end
                aphone.Running_App = nil
                aphone.Force_AllowHorizontal = false
            end

            // End of anim

            local b_menu = vgui.Create("DButton", p)
            b_menu:Dock(BOTTOM)
            b_menu:SetText("")
            b_menu:SetTall(pos_y * 0.02)
            b_menu:DockMargin(pos_x * 0.2, 0, pos_x * 0.2, 0)

            function b_menu:Paint(w, h)
                draw.RoundedBox(h / 4, 0, 0, w, h / 2, color_black)
                draw.RoundedBox(h / 4, 2, 2, w-4, h / 2-4, color_white)
            end

            function b_menu:DoClick()
                if anim_p.phone_gettingremoved then return end
                local anim_back = anim_p:NewAnimation(0.5, 0, 0.5)

                function anim_back:Think(_, frac_anim)
                    anim_p.frac = frac_anim
                end

                if aphone.HorizontalApp then
                    aphone.RequestAnim(1)
                end

                anim_p.phone_gettingremoved = true
            end

            function anim_p:Paint(w,h)
                // I always enable stencil and not just reset it when frac > 1 because others stencil panel ( like avatar ) need the id to be 1 to do his job properly
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
                surface.SetDrawColor(cache_stencil)

                if self.phone_gettingremoved and self.frac == 1 then
                    self:Remove()
                    aphone.App_Panel = nil
                    render.SetStencilCompareFunction(STENCIL_NEVER)
                elseif self.frac < 1 then
                    local final_frac = self.phone_gettingremoved and 1 - self.frac or self.frac
                    local r = (w + h) / 2 * final_frac

                    surface.DrawPoly(aphone.GUI.GenerateCircle(w / 2, h / 2, r))
                    render.SetStencilCompareFunction(STENCIL_EQUAL)
                end

                if input.IsMouseDown(MOUSE_MIDDLE) and IsValid(b_menu) then
                    b_menu:DoClick()
                end
            end

            aphone.App_Panel = anim_p
            aphone.Running_App = v
            v:Open(p, pos_x, pos_y)
        end
    end

    self:GetParent():aphone_RemoveCursor()
end

vgui.Register("aphone_AppList", PANEL, "Panel")
--PATH addons/sl_aphone/lua/aphone/_libs/panels/cl_imageshow.lua:
local PANEL = {};

function PANEL:Init()
    local w, h = self:GetParent():GetSize()

    local clr_black40 = aphone:Color("Black40_120")
    local font_svg30 = aphone:GetFont("SVG_30")
    local clr_white120 = aphone:Color("Text_White120")

    self:SetMouseInputEnabled(true)
    local pnl = self

    if !self.skipanim then
        self:SetSize(0, 0)
        self:SetPos(w / 2, h / 2)

        self:SizeTo(w, h, 0.33, 0, 0.5)
        self:MoveTo(0, 0, 0.33, 0, 0.5)
    else
        self:SetSize(w, h)
    end

    surface.SetFont(font_svg30)
    local _, text_y = surface.GetTextSize("l")

    local header = vgui.Create("DPanel", self)
    header:Dock(TOP)
    header:SetTall(text_y * 1.5)

    function header:Paint(w, h)
        surface.SetDrawColor(clr_black40)
        surface.DrawRect(0, 0, w, h)
    end

    local header_quit = vgui.Create("DButton", header)
    header_quit:Dock(LEFT)
    header_quit:SetWide(text_y)
    header_quit:SetFont(font_svg30)
    header_quit:SetText("l")
    header_quit:SetPaintBackground(false)
    header_quit:SetTextColor(clr_white120)
    header_quit:DockMargin(text_y / 2, 0, 0, 0)
    header_quit:Phone_AlphaHover()

    function header_quit:DoClick()
        pnl:CloseAnimation()

        if pnl.onclose then
            pnl.onclose()
        end
    end

    self.header_upload = vgui.Create("DButton", header)
    self.header_upload:Dock(LEFT)
    self.header_upload:SetWide(text_y)
    self.header_upload:SetFont(font_svg30)
    self.header_upload:SetText("k")
    self.header_upload:SetPaintBackground(false)
    self.header_upload:SetTextColor(clr_white120)
    self.header_upload:SetEnabled(false)
    self.header_upload:SetAlpha(0)
    self.header_upload:Phone_AlphaHover()

    function self.header_upload:DoClick()
        if !aphone.ImgurUploading then
            aphone.ImgurUploading = true

            if !pnl.dir then
                print("[APhone] Issue in imageshow, please report this in a gmodstore ticket, there must be a error on top of this, please report this too")
            end

            aphone.SendImgur(pnl.dir)

            self.waitend = true
        end
    end

    function self.header_upload:Think()
        if self.waitend and !aphone.ImgurUploading then
            pnl:CloseAnimation()
            self.Think = nil
        end
    end
    
    self:aphone_RemoveCursor()
end

function PANEL:SetDir(dir)
    self.dir = dir
    self.header_upload:SetEnabled(true)
    self.header_upload:SetAlpha(255)
end

function PANEL:CloseAnimation()
    self:SizeTo(0, 0, 0.33, 0, 0.5)
    self:MoveTo(self:GetWide() / 2, self:GetTall() / 2, 0.33, 0, 0.5, function(_, p)
        p:Remove()
    end)
end

function PANEL:SetMat(mat)
    self.mat = mat

    local w = mat:Width()
    local h = mat:Height()

    self.horizontal_pic = h < w
end

function PANEL:Paint(w, h)
    if self.mat then
        surface.SetDrawColor(color_black)
        surface.DrawRect(0, 0, w, h)

        surface.SetMaterial(self.mat)
        surface.SetDrawColor(color_white)

        local horizontal = w > h

        if self.horizontal_pic and !horizontal then
            surface.DrawTexturedRect(0, h/2 - (w*(w/h))/2, w, w*(w/h))
        elseif !self.horizontal_pic and horizontal then
            surface.DrawTexturedRect(w/2 - (h*(h/w))/2, 0, h*(h/w), h)
        else
            surface.DrawTexturedRect(0, 0, w, h)
        end
    end
end

local black_180 = Color(40, 40, 40, 180)
local stencil_clr = Color(1, 1, 1, 1)
function PANEL:PaintOver(w, h)
    if aphone.ImgurUploading then
        surface.SetDrawColor(black_180)
        surface.DrawRect(0, 0, w, h)

        if !self.circle1 then
            self.circle1 = aphone.GUI.GenerateCircle(w / 2, h / 2, (aphone.Horizontal and h or w) / 4)
            self.circle2 = aphone.GUI.GenerateCircle(w / 2, h / 2, (aphone.Horizontal and h or w) / 4-6)
        end

        local rad = CurTime() * 6

        aphone.Stencils.Start()
            surface.SetDrawColor(stencil_clr)
            surface.DrawPoly(self.circle1)
        aphone.Stencils.AfterMask(false)
            surface.DrawPoly(self.circle2)

            surface.SetDrawColor(aphone:Color("GPS_Line"))

            local p_size = (aphone.Horizontal and h or w) 
            draw.SimpleText("d", aphone:GetFont("SVG_60"), math.cos( rad ) * (p_size / 4) + w / 2, math.sin(rad) * (p_size / 4) + h / 2, aphone:Color("GPS_Line"), 1, 1)
        aphone.Stencils.End()
    end
end

function PANEL:SetValid(func)
    local valid_label = vgui.Create("DLabel", self)
    valid_label:Dock(BOTTOM)
    valid_label:SetTall(aphone.MainDerma:GetTall()*0.2)
    valid_label:SetText("r")
    valid_label:Phone_AlphaHover()
    valid_label:SetFont(aphone:GetFont("SVG_60"))
    valid_label:SetContentAlignment(8)
    valid_label:SetMouseInputEnabled(true)

    function valid_label:DoClick()
        func()
    end

    valid_label:aphone_RemoveCursor()
end

vgui.Register("aphone_ShowImage", PANEL)
--PATH addons/sl_aphone/lua/aphone/apps/contacts/cl_main.lua:
local APP = {}

APP.name = aphone.L("Contacts")
APP.icon = "akulla/aphone/app_contacts.png"

local clr_green = Color(46, 204, 113)

function APP:Open(main, main_x, main_y, screenmode)
	local clr_black2 = aphone:Color("Black2")
	local clr_white = aphone:Color("Text_White")
	local clr_white120 = aphone:Color("Text_White120")
	local clr_black3 = aphone:Color("Black3")
	local clr_red = aphone:Color("mat_red")
	local font_mediumheader = aphone:GetFont("MediumHeader")
	local font_svg30 = aphone:GetFont("SVG_30")

	function main:Paint(w, h)
		surface.SetDrawColor(clr_black2)
		surface.DrawRect(0,0,w,h)
	end

	local top_app = vgui.Create("DPanel", main)
	top_app:Dock(TOP)
	top_app:DockMargin(main_y * 0.03, main_y * 0.045, main_y * 0.03, 0)
	top_app:SetTall(screenmode and main_x * 0.075 or main_y * 0.075)
	top_app:SetPaintBackground(false)

	local ply = LocalPlayer()
	local local_num = LocalPlayer():aphone_GetNumber()

	function top_app:Paint(w, h)
		draw.SimpleText(ply:Nick(), font_mediumheader, h * 1.25, h / 2, clr_white, 0, TEXT_ALIGN_BOTTOM)
		draw.SimpleText(local_num, font_mediumheader, h * 1.25, h / 2, clr_white120, 0, TEXT_ALIGN_TOP)
	end

	local avatar = vgui.Create("aphone_CircleAvatar", top_app)
	avatar:Dock(LEFT)
	avatar:SetWide(top_app:GetTall())
	avatar:SetPlayer(LocalPlayer(), 128)

	local p = vgui.Create("DButton", main)
	p:Dock(BOTTOM)
	p:SetTall(aphone.GUI.ScaledSizeY(60))
	p:SetPaintBackground(false)
	p:TDLib()
	p:BarHover(aphone:Color("mat_red"), 3)
	p:Text("+", aphone:GetFont("Roboto60"))
	p:DockMargin(main_x / 2 - aphone.GUI.ScaledSizeX(30), 0, main_x / 2 - 30, screenmode and main_y * 0.04 or main_x * 0.075)

	local main_scroll = vgui.Create("DScrollPanel", main)
	main_scroll:Dock(FILL)
	main_scroll:DockMargin(main_x * 0.075, 0, main_x * 0.075, 0)
	main_scroll:aphone_PaintScroll()

	function main_scroll:Add_Contact(contact_id, contact_name, create)
		local p = main_scroll:Add("DPanel")
		p:Dock(TOP)
		p:DockMargin(0, main_x * 0.040, 0, main_x * 0.040)
		p:SetTall(aphone.GUI.ScaledSizeY(100))

		if screenmode then
			p:DockMargin(0, main_y * 0.02, 0, main_y * 0.02)
		else
			p:DockMargin(0, main_x * 0.075, 0, 0)
		end

		local is_connected = false
		for _, j in ipairs(player.GetHumans()) do
			if j:aphone_GetID() == k then
				is_connected = true
				break
			end
		end

		local num = contact_id == 0 and aphone.L("No_Number") or aphone.GetNumber(contact_id)

		function p:Paint(w, h)
			if !self:IsHovered() and !self:IsChildHovered() then
				draw.RoundedBox(16, 0, 0, w, h, clr_black3)
			else
				draw.RoundedBox(16, 0, 0, w, h, is_connected and clr_green or clr_red)
			end
		end

		local close = vgui.Create("DButton", p)
		close:DockMargin(0, 0, aphone.GUI.ScaledSizeX(16), 0)
		close:Dock(RIGHT)
		close:SetWide(select(1, draw.SimpleText("S", font_svg30)) * 1.2)
		close:SetText("")

		function close:Paint(w, h)
			if p:IsHovered() or p:IsChildHovered() then
				draw.SimpleText("S", font_svg30, w / 2, h / 2, clr_white, 1, 1)
			end
		end

		function close:DoClick()
			p:Remove()
			aphone.Contacts.Remove(contact_id)
		end

		surface.SetFont(aphone:GetFont("Roboto40"))
		local text_h = select(2, surface.GetTextSize(contact_name))

		local modify_name = vgui.Create("DLabel", p)
		modify_name:Dock(TOP)
		modify_name:SetTall(text_h)
		modify_name:SetText(contact_name)
		modify_name:SetFont(aphone:GetFont("Roboto40"))
		modify_name:SetTextColor(clr_white)
		modify_name:DockMargin(aphone.GUI.ScaledSizeX(32), p:GetTall() / 2 - text_h, 0, 0)
		modify_name:SetMouseInputEnabled(true)

		function modify_name:textEnd(text_pnl)
			aphone.Contacts.ChangeName(contact_id, text_pnl)
			contact_name = text_pnl
			self:SetText(text_pnl)
		end

		function modify_name:DoClick()
			modify_name:Phone_AskTextEntry(contact_name, 32)
		end

		surface.SetFont(font_mediumheader)
		text_h = select(2, surface.GetTextSize(num))

		local number_label = vgui.Create("DLabel", p)
		number_label:Dock(TOP)
		number_label:SetTall(text_h)
		number_label:SetText(num)
		number_label:SetFont(font_mediumheader)
		number_label:SetTextColor(aphone:Color("Text_White120"))
		number_label:DockMargin(aphone.GUI.ScaledSizeX(32), 0, 0, p:GetTall() / 2 - text_h)

		if contact_id == 0 then
			number_label:SetMouseInputEnabled(true)

			function number_label:textEnd(text_pnl)
				for k, v in ipairs(player.GetHumans()) do
					if v:aphone_GetNumber() == text_pnl then
						if aphone.Contacts.GetName(v:aphone_GetID()) then
							self:SetText( aphone.L("Already_Exist") )
							return
						end

						self.AP_NoClick = true
						num = text_pnl
						aphone.Contacts.Add(v:aphone_GetID(), modify_name:GetText())

						return
					end
				end

				self:SetText(aphone.L("PlayerNotFound"))
			end

			function number_label:DoClick()
				if self.AP_NoClick then return end
				local str = string.len(string.Replace(aphone.Format, "%", ""))

				print(aphone.L("PlayerNotFound") != str and str or "")
				number_label:Phone_AskTextEntry(aphone.L("PlayerNotFound") != self:GetText() and self:GetText() or "", str)
			end
		end

		p:aphone_RemoveCursor()
	end

	for k, v in pairs(aphone.Contacts.GetContacts()) do
		main_scroll:Add_Contact(k, v)
	end

	function p:DoClick()
		main_scroll:Add_Contact(0, aphone.L("ChangeName"))
	end

	main:aphone_RemoveCursor()
end

function APP:Open2D(main, main_x, main_y)
	self:Open(main, main_x, main_y, true)
end

aphone.RegisterApp(APP)
--PATH addons/sl_aphone/lua/aphone/apps/cookies/cl_main.lua:
local APP = {}

APP.name = aphone.L("Cookies")
APP.icon = "akulla/aphone/app_cookie.png"

local config = {
    [1] = {
        price = 15,
        name = aphone.L("Cursor"),
        mat = Material("akulla/aphone/cookie_cursor.png", "smooth 1"),
        amt_sec = 0.1,
    },
    [2] = {
        price = 100,
        name = aphone.L("Grandma"),
        mat = Material("akulla/aphone/cookie_grandma.png", "smooth 1"),
        amt_sec = 1,
    },
    [3] = {
        price = 1100,
        name = aphone.L("Farm"),
        mat = Material("akulla/aphone/cookie_farm.png", "smooth 1"),
        amt_sec = 8,
    },
    [4] = {
        price = 12000,
        name = aphone.L("Mine"),
        mat = Material("akulla/aphone/cookie_mine.png", "smooth 1"),
        amt_sec = 47,
    },
    [5] = {
        price = 130000,
        name = aphone.L("Factory"),
        mat = Material("akulla/aphone/cookie_factory.png", "smooth 1"),
        amt_sec = 260,
    },
    [6] = {
        price = 1400000,
        name = aphone.L("Bank"),
        mat = Material("akulla/aphone/cookie_bank.png", "smooth 1"),
        amt_sec = 1400,
    },
    [7] = {
        price = 20000000,
        name = aphone.L("Temple"),
        mat = Material("akulla/aphone/cookie_temple.png", "smooth 1"),
        amt_sec = 7800,
    },
    [8] = {
        price = 330000000,
        name = aphone.L("WizardTower"),
        mat = Material("akulla/aphone/cookie_wizardtower.png", "smooth 1"),
        amt_sec = 44000,
    },
    [9] = {
        price = 5100000000,
        name = aphone.L("Shipment"),
        mat = Material("akulla/aphone/cookie_shipment.png", "smooth 1"),
        amt_sec = 260000,
    },
    [10] = {
        price = 75000000000,
        name = aphone.L("Alchemy"),
        mat = Material("akulla/aphone/cookie_alchemy.png", "smooth 1"),
        amt_sec = 1600000,
    },
    [11] = {
        price = 1000000000000,
        name = aphone.L("Portal"),
        mat = Material("akulla/aphone/cookie_portal.png", "smooth 1"),
        amt_sec = 10000000,
    },
    [12] = {
        price = 14000000000000,
        name = aphone.L("TimeMachine"),
        mat = Material("akulla/aphone/cookie_time.png", "smooth 1"),
        amt_sec = 65000000,
    },
    [13] = {
        price = 170000000000000,
        name = aphone.L("Antimatter_Condenser"),
        mat = Material("akulla/aphone/cookie_antimatter.png", "smooth 1"),
        amt_sec = 430000000,
    },
    [14] = {
        price = 2100000000000000,
        name = aphone.L("Prism"),
        mat = Material("akulla/aphone/cookie_prism.png", "smooth 1"),
        amt_sec = 2900000000,
    },
    [15] = {
        price = 26000000000000000,
        name = aphone.L("Chancemaker"),
        mat = Material("akulla/aphone/cookie_chance.png", "smooth 1"),
        amt_sec = 21000000000,
    },
    [16] = {
        price = 310000000000000000,
        name = aphone.L("FractalEngine"),
        mat = Material("akulla/aphone/cookie_fractal.png", "smooth 1"),
        amt_sec = 150000000000,
    },
    [17] = {
        price = 71000000000000000000,
        name = aphone.L("JSConsole"),
        mat = Material("akulla/aphone/cookie_js.png", "smooth 1"),
        amt_sec = 1100000000000,
    },
    [18] = {
        price = 12000000000000000000000,
        name = aphone.L("Idleverse"),
        mat = Material("akulla/aphone/cookie_universe.png", "smooth 1"),
        amt_sec = 8300000000000,
    },
}

local tbl = {
    [0] = "",
    [1] = aphone.L("Thousand"),
    [2] = aphone.L("Million"),
    [3] = aphone.L("Billion"),
    [4] = aphone.L("Trillion"),
    [5] = aphone.L("Quadrillion"),
    [6] = aphone.L("Quintillion"),
    [7] = aphone.L("Sextillion"),
    [8] = aphone.L("Septillion"),
}


local per_sec = 0
local cookies = 0

local boost_active = false
local boost_time = 0

// Config loaded, now we need to load save
local player_save = {}

for k, v in pairs(config) do
    local level = aphone.Clientside.GetSetting("CookiesClicker_" .. k, 0)
    player_save[k] = level
    cookies = aphone.Clientside.GetSetting("CookiesClicker_CookiesNum", 0)

    per_sec = per_sec + v.amt_sec * level
end

// Functions to manage cookies
local function format_cookies(amt)
    amt = amt or cookies
    local exp_id = 0

    while (amt > 1000) do
        if exp_id == table.Count(tbl) - 1 then
            break
        end
        amt = amt / 1000
        exp_id = exp_id + 1
    end

    return math.Round(amt, 2) .. tbl[exp_id] .. " cookies"
end

local function add_cookie(amt)
    cookies = cookies + (boost_active and amt * 10 or amt)

    return amt
end

local function price_nextlevel(item_id)
    return math.Round(config[item_id].price * (1.15 ^ player_save[item_id]), 2)
end

local function buy_param(item_id)
    local price = price_nextlevel(item_id)

    if price <= cookies then
        cookies = cookies - price

        local i = config[item_id]
        per_sec = per_sec + i.amt_sec

        player_save[item_id] = player_save[item_id] + 1
        aphone.Clientside.SaveSetting("CookiesClicker_" .. item_id, player_save[item_id])
    end
end

// We are nearly done, now we got the app tables and UI
function APP:OnClose()
    for k, v in pairs(config) do
        aphone.Clientside.SaveSetting("CookiesClicker_" .. k, player_save[k])
    end
    aphone.Clientside.SaveSetting("CookiesClicker_CookiesNum", cookies)
end

local last_frame = CurTime()
local mat_bg = Material("akulla/aphone/cookies_bg.jpg")
local mat_cookie = Material("akulla/aphone/cookies_png.png", "smooth 1")

local function create_derma(main, main_x, main_y, is_horizontal)
    local cookies_anim = {}

    local clr_black40 = aphone:Color("Black40_120")
    local clr_white = aphone:Color("Text_White")
    local clr_white120 = aphone:Color("Text_White120")
    local clr_white180 = aphone:Color("Text_White180")
    local clr_textshadow = aphone:Color("Text_Shadow")
    local clr_boostoff = aphone:Color("Cookie_BoostOff")
    local clr_booston = aphone:Color("Cookie_BoostOn")
    local font_mediumheader = aphone:GetFont("MediumHeader")
    local font_little = aphone:GetFont("Little")
    local font_sf40 = aphone:GetFont("Roboto40")
    local font_small = aphone:GetFont("Small")
    local s_s40 = aphone.GUI.ScaledSizeX(40)
    local s_s80 = aphone.GUI.ScaledSizeY(80)
    local cur = CurTime()

    function main:Paint(w, h)
        cur = CurTime()
        surface.SetDrawColor(color_white)
        surface.SetMaterial(mat_bg)

        local size = 1024 + main_y * 0.15 + main_x / 2
        surface.DrawTexturedRectRotated(w / 2, !is_horizontal and main_y * 0.15 + main_x / 2 or h / 2, size, size, cur % 36 * 10)

        surface.SetDrawColor(clr_black40)
        surface.DrawRect(0, 0, main_x, main_y * 0.17)

        // Add cookies, I put this in paint so we calculate every frame, it's not a big operation so don't mind about frame-drop
        local next_frametime = cur - last_frame
        add_cookie(next_frametime * per_sec)
        last_frame = cur

        if boost_active then
            boost_time = boost_time - next_frametime * 10

            if boost_time < 0 then
                boost_active = false
            end
        else
            if boost_time > 300 then
                boost_active = true
            end
        end

        for k, v in pairs(cookies_anim) do
            local ratio = (cur - v.time) * 2

            surface.SetDrawColor(255, 255, 255, v.alpha)
            surface.SetMaterial(mat_cookie)
            surface.DrawTexturedRectRotated((w * v.x_cookie) - s_s40, (h + 160) * ratio - s_s80, s_s80, s_s80, v.x * ratio)
        end

        draw.SimpleText(format_cookies(), is_horizontal and font_mediumheader or font_sf40, main_x / 2, main_y * 0.07, clr_white, 1, 1)
        draw.SimpleText(format_cookies(per_sec) .. "/sec", is_horizontal and font_little or font_mediumheader, main_x / 2, main_y * 0.12, clr_white120, 1, 1)

        draw.RoundedBox(8, w * 0.05, main_y * 0.15, w * 0.90, main_y * 0.01, clr_textshadow)
        draw.RoundedBox(8, w * 0.05, main_y * 0.15, (w * 0.90) * (boost_time / 300), main_y * 0.01, !boost_active and clr_boostoff or clr_booston)
    end

    local cookie_panel = vgui.Create("DButton", main)
    cookie_panel:SetText("")
    cookie_panel:Dock(is_horizontal and LEFT or TOP)
    cookie_panel:NoClipping(true)

    if !is_horizontal then
        cookie_panel:SetTall(main_x + aphone.GUI.ScaledSizeY(10))
        cookie_panel:DockMargin(0, main_y * 0.15, 0, 0)
    else
        cookie_panel:SetWide(main_y - main_x * 0.2)
        cookie_panel:DockMargin(main_x * 0.1, main_x * 0.1, 0, main_x * 0.1)
    end

    function cookie_panel:Paint(w, h)
        surface.SetMaterial(mat_cookie)
        surface.SetDrawColor(color_white)

        if !self:IsDown() then
            surface.DrawTexturedRect(0, 0, w, h)
        else
            surface.DrawTexturedRect(w * 0.05, h * 0.05, w * 0.9, h * 0.9)
        end

        for k,v in pairs(cookies_anim) do
            local ratio = (cur - v.time)

            if ratio > 1 then
                table.remove(cookies_anim, k)
            else
                draw.SimpleTextOutlined(v.num, font_sf40, w * v.x, h / 2 * (1 - ratio), Color(230, 240, 241, 255 * ((1 - ratio) * 2 - 0.5)), 1, 0, 1, Color(60, 60, 60, 120 * (1 - ratio)))
            end
        end
    end

    local cookie_shop = vgui.Create("DPanel", main)
    cookie_shop:Dock(FILL)

    if !is_horizontal then
        cookie_shop:DockMargin(aphone.GUI.ScaledSize(24, 0, 24, 24))
    else
        cookie_shop:DockMargin(main_x * 0.1, main_x * 0.1, main_x * 0.1, main_x * 0.1)
    end

    local clr1 = Color(36, 59, 83)
    local clr2 = Color(51, 78, 104)
    function cookie_shop:Paint(w, h)
        draw.RoundedBox(16, 0, 0, w, h, clr1)
        draw.RoundedBox(16, 4, 4, w-8, h-8, clr2)
    end

    local cookie_shop_scroll = vgui.Create("DScrollPanel", cookie_shop)
    cookie_shop_scroll:Dock(FILL)
    cookie_shop_scroll:DockMargin(aphone.GUI.ScaledSize(16, 16, 16, 16))
    cookie_shop_scroll:aphone_PaintScroll()

    for k, v in SortedPairs(config) do
        local button = vgui.Create("DButton", cookie_shop_scroll)
        cookie_shop_scroll:AddItem(button)
        button:Dock(TOP)
        button:SetTall(aphone.GUI.ScaledSizeY(50))
        button:DockMargin(aphone.GUI.ScaledSize(5, 5, 5, 5))
        button:SetText("")

        function button:Paint(w, h)
            surface.SetDrawColor(color_white)
            surface.SetMaterial(v.mat)
            surface.DrawTexturedRect(0, 0, h, h)

            draw.SimpleText(v.name, font_mediumheader, h + 5, h / 2, self:IsHovered() and clr_white or clr_white180, 0, 4)
            draw.SimpleText(format_cookies(price_nextlevel(k), 1), font_small, h + 5, h / 2, clr_white120, 0, 3)
        end

        function button:DoClick()
            buy_param(k)
        end
    end

    function cookie_panel:DoClick()
        local amt_togive = per_sec / 5
        amt_togive = amt_togive > 1 and amt_togive or 1
        add_cookie(amt_togive)

        table.insert(cookies_anim, {
            num = "+" .. format_cookies(amt_togive),
            x = math.Rand(0.2, 0.8),
            x_cookie = math.Rand(0.2, 0.8),
            alpha = math.Rand(40, 255),
            time = cur,
        })
    end

    main:aphone_RemoveCursor()
end

function APP:Open(main, main_x, main_y)
    create_derma(main, main_x, main_y, false)
end

function APP:Open2D(main, main_x, main_y)
    create_derma(main, main_x, main_y, true)
end

aphone.RegisterApp(APP)
--PATH addons/sl_aphone/lua/aphone/apps/settings/cl_main.lua:
local APP = {}

APP.name = aphone.L("Options")
APP.icon = "akulla/aphone/app_settings.png"
APP.Default = true // You shouldn't use this flag, it's only for "system app" that got a special display at the bottom of the menu

local stencil_clr = Color(1, 1, 1, 1)
local clr_blue = Color(93,207,202)


function APP:Open(main, main_x, main_y)
    local color_black1 = aphone:Color("Black1")
    local color_black2 = aphone:Color("Black2")
    local color_black3 = aphone:Color("Black3")
    local color_white120 = aphone:Color("Text_White120")
    local color_white180 = aphone:Color("Text_White180")
    local color_white = aphone:Color("Text_White")
    local color_orange = aphone:Color("Text_Orange")
    local font_mediumheader = aphone:GetFont("MediumHeader")
    local font_big = aphone:GetFont("Roboto80")
    local color_gps = aphone:Color("GPS_Line")
    local font_bold = aphone:GetFont("Roboto45_700")

    local local_player = LocalPlayer()
    local local_playernick = local_player:Nick()

    function main:Paint(w, h)
        surface.SetDrawColor(color_black2)
        surface.DrawRect(0,0,w,h)
    end

    local top_app = vgui.Create("DPanel", main)
    top_app:Dock(TOP)
    top_app:DockMargin(main_y * 0.03, main_y * 0.05, main_y * 0.03, 0)
    top_app:SetTall(main_y * 0.075)
    top_app:SetPaintBackground(false)

    local avatar = vgui.Create("aphone_CircleAvatar", top_app)
    avatar:Dock(LEFT)
    avatar:SetWide(top_app:GetTall())
    avatar:SetPlayer(local_player, 128)

    local local_num = local_player:aphone_GetNumber()

    function top_app:Paint(w, h)
        draw.SimpleText(local_playernick, font_mediumheader, top_app:GetTall() * 1.25, h / 2, color_white, 0, TEXT_ALIGN_BOTTOM)
        draw.SimpleText(local_num, font_mediumheader, top_app:GetTall() * 1.25, h / 2, color_white120, 0, TEXT_ALIGN_TOP)
    end

    local select_scroll = vgui.Create("DPanel", main)
    select_scroll:Dock(TOP)
    select_scroll:SetTall(main_y * 0.10)
    select_scroll:SetPaintBackground(false)
    select_scroll:DockMargin(0, main_y * 0.01, 0, 0)

    local main_scroll = vgui.Create("DScrollPanel", main)
    main_scroll:SetPos(main_x * 0.07, main_y * 0.24)
    main_scroll:SetSize(main_x * 0.86, main_y * 0.785 - main_y * 0.05)
    main_scroll:aphone_PaintScroll()

    // Used later for sliders params
    local wide = (main_x - aphone.GUI.ScaledSizeX(160) - main_y * 0.06) / 3

    surface.SetFont(font_mediumheader)

    for k, v in pairs(aphone.Params) do
        local cat_title = main_scroll:Add("DLabel")
        cat_title:Dock(TOP)
        cat_title:SetFont(font_mediumheader)
        cat_title:SetText(aphone.L(k))
        cat_title:SetTextColor(color_orange)
        cat_title:DockMargin(aphone.GUI.ScaledSize(5, 10, 0, 5))
        cat_title:Toggle()
        cat_title:SetAutoStretchVertical(true)

        local listpanel = vgui.Create("DPanel", main_scroll)
        listpanel:Dock(TOP)
        listpanel:DockMargin(aphone.GUI.ScaledSize(0, 5, 0, 0))
        listpanel:SetTall(0)

        function listpanel:Paint(w, h)
            draw.RoundedBox(8, 0, 0, w, h, color_black3)
        end

        for i, j in pairs(v) do
            local sub_panel = vgui.Create("DPanel", listpanel)
            sub_panel:Dock(TOP)
            sub_panel:SetPaintBackground(false)

            local sub_txt = vgui.Create("DLabel", sub_panel)
            sub_txt:SetMouseInputEnabled(true)
            sub_txt:SetTextColor(color_white180)
            sub_txt:SetFont(font_mediumheader)
            sub_txt:SetTall(select(2, sub_txt:GetContentSize()) * 1.5)
            sub_txt:SetText(j.full_name)
            sub_txt:DockMargin(main_y * 0.02, 0, 0, 0)
            sub_txt:SetIsToggle(true)
            sub_txt:Dock(TOP)

            if j.var_type == "string" or j.var_type == "num" then
                local panel_but = vgui.Create("DLabel", sub_panel)
                panel_but:Dock(TOP)
                panel_but:SetTall(sub_txt:GetTall())
                panel_but:SetFont(font_mediumheader)
                panel_but:SetTextColor(color_white)
                panel_but:SetIsToggle(true)
                panel_but:DockMargin(main_y * 0.02, 0, 0, 0)
                panel_but:SetText(aphone:GetParameters(k, i, j.def))
                panel_but:SetMouseInputEnabled(true)

                function panel_but:DoClick()
                    local text_entry = self:Phone_AskTextEntry(self:GetText())
                    text_entry:SetNumeric(j.var_type == "num")
                end

                function sub_txt:DoClick()
                    if !self:GetToggle() then
                        sub_panel:SetTall(sub_txt:GetTall() + panel_but:GetTall())
                        listpanel:SetTall(listpanel:GetTall() + panel_but:GetTall())
                    else
                        sub_panel:SetTall(sub_txt:GetTall())
                        listpanel:SetTall(listpanel:GetTall() - panel_but:GetTall())
                    end

                    self:Toggle()
                end

            elseif j.var_type == "color" then
                local panel_but = vgui.Create("DPanel", sub_panel)
                panel_but:Dock(TOP)
                panel_but:SetTall(sub_txt:GetTall() * 0.5)
                panel_but:SetPaintBackground(false)

                sub_txt:SetText(aphone.L(i))

                local clr = aphone:Color(i)

                for a, b in ipairs({"r", "g", "b"}) do
                    local p = vgui.Create("DSlider", panel_but)
                    p:Dock(LEFT)
                    p:SetWide( wide )
                    p:DockMargin(aphone.GUI.ScaledSize(20, 0, 20, 0))
                    p:SetSlideX(clr[b] / 255)

                    function p:Paint(w, h)
                        draw.RoundedBox(4, 0, h / 2-4, w, 8, color_white)
                        draw.RoundedBox(4, 0, h / 2-4, w * self:GetSlideX(), 8, color_orange)
                    end
                    function p.Knob:Paint(w, h) end

                    function p:Think()
                        if self:IsEditing() then
                            local new_clr = table.Copy(aphone:Color(i))
                            new_clr[b] = self:GetSlideX() * 255
                            aphone.Clientside.SaveSetting(i, Color(new_clr.r, new_clr.g, new_clr.b, new_clr.a or 255))
                        end
                    end
                end

                function sub_txt:DoClick()
                    if !self:GetToggle() then
                        sub_panel:SetTall(sub_txt:GetTall() + panel_but:GetTall())
                        listpanel:SetTall(listpanel:GetTall() + panel_but:GetTall())
                    else
                        sub_panel:SetTall(sub_txt:GetTall())
                        listpanel:SetTall(listpanel:GetTall() - panel_but:GetTall())
                    end

                    self:Toggle()
                end

                local reset_but = vgui.Create("DButton", sub_txt)
                reset_but:Dock(RIGHT)
                reset_but:SetWide(sub_txt:GetTall())
                reset_but:SetText("")

                function reset_but:Paint(w, h)
                    if self:IsHovered() or sub_txt:IsHovered() then
                        draw.SimpleText("j", aphone:GetFont("SVG_25"), w / 2, h / 2, color_white, 1, 1)
                    end
                end

                function reset_but:DoClick()
                    local default_clr = aphone:DefaultClr(i)
                    aphone.Clientside.SaveSetting(i, default_clr)

                    for a, b in ipairs({"r", "g", "b"}) do
                        panel_but:GetChildren()[a]:SetSlideX(default_clr[b] / 255)
                    end
                end
            elseif j.var_type == "bool" then
                sub_txt:SetTextColor(aphone:GetParameters(k, i, false) and color_white or color_white120)

                function sub_txt:DoClick()
                    local new_value = aphone:ChangeParameters(k, i, !aphone:GetParameters(k, i, false))
                    self:SetTextColor(new_value and color_white or color_white120)
                end
            elseif j.var_type == "sound" then
                -- same as bool, just disable himself after a change
                function sub_txt:DoClick()
                    self:SetTextColor(aphone:ChangeParameters(k, i, !aphone:GetParameters(k, i, false)) and color_white or color_white120)
                end

                hook.Add("APhone_SettingChange", i, function(cat, short_name)
                    if IsValid(sub_txt) then
                        if short_name != i then
                            aphone:ChangeParameters(k, i, false, true)
                        end
                        sub_txt:SetTextColor(short_name == i and color_white or color_white120)
                    end
                end)

                sub_txt:SetTextColor(aphone:GetParameters(k, i, false) and color_white or color_white120)
            end

            sub_panel:SetTall(sub_txt:GetTall())
        end

        // SizeToContent and children not working
        local height = 0

        for i, j in ipairs(listpanel:GetChildren()) do
            height = height + j:GetTall()
        end

        listpanel:SetTall(height)
    end

    local main_scrollbg = vgui.Create("DPanel", main)
    main_scrollbg:SetPos(main_x * 1.07, main_y * 0.25)
    main_scrollbg:SetSize(main_x * 0.86, main_y * 0.76 - main_y * 0.05)

    function main_scrollbg:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, color_black3)
    end

    local main_scrollbg_scroll = vgui.Create( "DScrollPanel", main_scrollbg ) // Create the Scroll panel
    main_scrollbg_scroll:Dock( FILL )
    main_scrollbg_scroll:DockMargin(8, 8, 8, 8)
    main_scrollbg_scroll:aphone_PaintScroll()

    local main_scrollbg_layout = main_scrollbg_scroll:Add("DIconLayout")
    main_scrollbg_layout:Dock(FILL)
    main_scrollbg_layout:SetSpaceX(aphone.GUI.ScaledSize(10))
    main_scrollbg_layout:SetSpaceY(main_scrollbg_layout:GetSpaceX())

    local size_bgw = main_scrollbg:GetWide() / 3 - 12 - main_scrollbg_layout:GetSpaceX() / 2
    local size_bgh = size_bgw * 2.1375
    local rb = aphone.GUI.RoundedBox(0, 0, size_bgw, size_bgh, 8)

    local actual_bg = aphone.Clientside.GetSetting("Background")

    local function addbg(v)
        local bg = main_scrollbg_layout:Add("DButton")
        bg:SetSize(size_bgw, size_bgh)
        bg:SetText("")

        function bg:Paint(w, h)
            local mat = aphone.GetImgurMat(v)

            if mat and !mat:IsError() then
                aphone.Stencils.Start()
                    surface.SetDrawColor(stencil_clr)
                    surface.DrawPoly(rb)
                aphone.Stencils.AfterMask(false)
                    render.SetStencilPassOperation(STENCILOPERATION_KEEP)

                    surface.SetMaterial(mat)
                    surface.SetDrawColor(color_white)
                    surface.DrawTexturedRect(0, 0, w, h)

                    if actual_bg == v then
                        draw.SimpleText("r", aphone:GetFont("SVG_60"), w / 2, h / 2, color_white, 1, 1)
                    end
                aphone.Stencils.End()
            else
                // Loading animation
                draw.RoundedBox(8, 0, 0, w, h, color_black2)

                if !self.circle1 then
                    self.circle1 = aphone.GUI.GenerateCircle(w / 2, h / 2, w / 4)
                    self.circle2 = aphone.GUI.GenerateCircle(w / 2, h / 2, w / 4 - 4)
                end

                local rad = CurTime() * 6

                aphone.Stencils.Start()
                    draw.NoTexture()
                    surface.SetDrawColor(stencil_clr)
                    surface.DrawPoly(self.circle1)
                aphone.Stencils.AfterMask(false)
                    draw.NoTexture()
                    surface.DrawPoly(self.circle2)

                    render.SetStencilPassOperation(STENCILOPERATION_KEEP)

                    surface.SetDrawColor(color_white120)
                    surface.DrawRect(0, 0, w, h)

                    surface.SetDrawColor(color_gps)
                    draw.SimpleText("d", aphone:GetFont("SVG_40"), math.cos( rad ) * (w / 4) + w / 2, math.sin(rad) * (w / 4) + h / 2, color_gps, 1, 1)
                aphone.Stencils.End()
            end
        end

        function bg:DoClick()
            local is_bg = aphone.Clientside.GetSetting("Background") == v
            aphone.Clientside.SaveSetting("Background", !is_bg and v or nil)
            actual_bg = aphone.Clientside.GetSetting("Background")
            hook.Run("APhone_ChangedBackground")
        end
    end

    for k, v in ipairs(aphone.backgrounds_imgur) do
        addbg(v)
    end

    for k, v in ipairs(aphone.Clientside.GetSetting("userbg", {})) do
        addbg(v)
    end

    local bg = main_scrollbg_layout:Add("DButton")
    bg:SetSize(size_bgw, size_bgh)
    bg:SetText("+")
    bg:SetFont(font_big)
    bg:Phone_AlphaHover()

    function bg:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, color_black2)
    end

    function bg:DoClick()
        local bigpnl = vgui.Create("DButton", main)
        bigpnl:SetSize(main_x, main_y)
        bigpnl:SetPaintBackground(false)
        bigpnl:SetText("")
        bigpnl.open = CurTime()
    
        local subpnl = vgui.Create("DPanel", bigpnl)
        subpnl:SetPos(0, main_y)
        subpnl:SetSize(main_x, main_y*0.30)
        subpnl:MoveTo(0, main_y - subpnl:GetTall(), 0.5, 0, 0.2)
    
        function bigpnl:DoClick()
            bigpnl.closing = CurTime()
            subpnl:MoveTo(0, main_y, 0.5, 0, 0.2, function()
                bigpnl:Remove()
            end)
        end

        function bigpnl:Paint(w, h)
            render.SetStencilEnable(false)
            local ratio = !bigpnl.closing and (CurTime() - bigpnl.open)*3 or 1 - (CurTime() - bigpnl.closing)*3
    
            if ratio > 1 then
                ratio = 1
            elseif ratio < 0 then
                ratio = 0
            end
    
            surface.SetDrawColor(0, 0, 0, 230 * ratio)
            surface.DrawRect(0, 0, w, h)
        end
    
        function subpnl:Paint(w, h)
            draw.RoundedBoxEx(32, 0, 0, w, h, clr_blue, true, true, false, false)
            draw.RoundedBoxEx(32, 0, 10, w, h, color_black1, true, true, false, false)
        end

        local title = vgui.Create("DLabel", subpnl)
        title:Dock(TOP)
        title:SetText("Imgur ID")
        title:SetFont(font_bold)
        title:SetContentAlignment(5)
        title:DockMargin(0, main_y*0.03, 0, 0)
        title:SetTextColor(clr_blue)
        title:SetAutoStretchVertical(true)

        local imgur_entry = vgui.Create("DLabel", subpnl)
        imgur_entry:Dock(TOP)
        imgur_entry:DockMargin(main_x*0.1, main_y*0.02, main_x*0.1, 0)
        imgur_entry:SetFont(font_mediumheader)
        imgur_entry:SetText("ID")
        imgur_entry:SetMouseInputEnabled(true)
        imgur_entry:SetAutoStretchVertical(true)
        imgur_entry:Phone_AlphaHover()
    
        function imgur_entry:DoClick()
            top_pnl:SetText(top_pnl:GetText() == "n" and "" or "n")
        end
    
        function imgur_entry:Paint(w, h)
            surface.SetDrawColor(imgur_entry:GetTextColor())
            surface.DrawLine(0, h-1, w, h-1)
        end
    
        function imgur_entry:DoClick()
            self:Phone_AskTextEntry(self:GetText(), 12)
        end

        local imgur_valid = vgui.Create("DLabel", subpnl)
        imgur_valid:Dock(FILL)
        imgur_valid:SetText("r")
        imgur_valid:SetFont(aphone:GetFont("SVG_40"))
        imgur_valid:SetContentAlignment(5)
        imgur_valid:Phone_AlphaHover()
        imgur_valid:SetMouseInputEnabled(true)
    
        function imgur_valid:DoClick()
            local self_bg = aphone.Clientside.GetSetting("userbg", {})
            local imgur_id = imgur_entry:GetText()
            local match = string.match(imgur_id or "", "[%a%d]+")

            if !self_bg[imgur_id] and imgur_id and imgur_id != "ID" and match and match == imgur_id then
                table.insert(self_bg, imgur_id)
                aphone.Clientside.SaveSetting("userbg", self_bg)
                addbg(imgur_id)
            end
            bigpnl:DoClick()
        end

        bigpnl:aphone_RemoveCursor()
    end

    local select_scroll_switchmain = vgui.Create("DButton", select_scroll)
    select_scroll_switchmain:Dock(LEFT)
    select_scroll_switchmain:SetWide(main_x / 2)
    select_scroll_switchmain:SetFont(aphone:GetFont("SVG_40"))
    select_scroll_switchmain:SetText("C")
    select_scroll_switchmain:Phone_AlphaHover()
    select_scroll_switchmain:SetPaintBackground(false)
    select_scroll_switchmain:TDLib()
    select_scroll_switchmain:BarHover(aphone:Color("mat_orange"))

    function select_scroll_switchmain:DoClick()
        main_scroll:MoveTo(main_x * 0.07, main_y * 0.24, 0.5, 0, 0.5)
        main_scrollbg:MoveTo(main_x * 1.07, main_y * 0.25, 0.5, 0, 0.5)
    end

    local select_scroll_switchbg = vgui.Create("DButton", select_scroll)
    select_scroll_switchbg:Dock(FILL)
    select_scroll_switchbg:SetFont(aphone:GetFont("SVG_40"))
    select_scroll_switchbg:SetText("Y")
    select_scroll_switchbg:Phone_AlphaHover()
    select_scroll_switchbg:SetPaintBackground(false)
    select_scroll_switchbg:TDLib()
    select_scroll_switchbg:BarHover(aphone:Color("mat_orange"))

    function select_scroll_switchbg:DoClick()
        main_scroll:MoveTo(-main_x * 1.07, main_y * 0.24, 0.5, 0, 0.5)
        main_scrollbg:MoveTo(main_x * 0.07, main_y * 0.25, 0.5, 0, 0.5)
    end

    main:aphone_RemoveCursor()
end

aphone.RegisterApp(APP)






/*

function dial:DoClick()
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
*/
--PATH addons/sl_aphone/lua/aphone/apps/weather/cl_main.lua:
local APP = {}

APP.name = "Weather"
APP.icon = "akulla/aphone/app_weather.png"

local day = Material("akulla/aphone/after_noon.jpg")
local night = Material("akulla/aphone/night.jpg")
local rainy = Material("akulla/aphone/rainy.jpg")

function APP:ShowCondition()
	return tobool(StormFox or StormFox2)
end

function APP:Open(main, main_x, main_y)
	local c_w = aphone:Color("Text_White")
	local c_w120 = aphone:Color("Text_White120")
	local header = aphone:GetFont("Roboto40")
	local big = aphone:GetFont("Roboto80")
	local space = aphone.GUI.ScaledSizeY(45)

	function main:Paint(w,h)
		if (StormFox2 and StormFox2.Weather.IsRaining()) or (StormFox and StormFox.IsRaining()) then
			surface.SetMaterial(rainy)
		elseif (StormFox2 and StormFox2.Time.IsDay()) or (StormFox and StormFox.IsDay()) then
			surface.SetMaterial(day)
		else
			surface.SetMaterial(night)
		end

		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(0, 0, w, h)

		draw.SimpleText(StormFox2 and StormFox2.Weather.GetDescription() or StormFox.GetWeather(), header, main_x / 2, main_y * 0.08, c_w, 1, 1)
		draw.SimpleText(StormFox2 and StormFox2.Time.GetDisplay() or StormFox.GetRealTime(StormFox.GetTime()), header, main_x / 2, main_y * 0.08 + space, c_w120, 1, 1)

		surface.SetFont(big)
		draw.SimpleText(math.Round(StormFox2 and StormFox2.Temperature.Get() or StormFox.GetTemperature(false)) .. "°", big, main_x / 2 + select(1, surface.GetTextSize("°")) / 2, main_y * 0.28, color_white, 1, 1)
	end
	main:aphone_RemoveCursor()
end

aphone.RegisterApp(APP)
--PATH addons/sh_reports/lua/reports/lib_loungeui.lua:
/*
* About time I made a library for general use!
* You can copy this file for your own server/personal use.
* What you can't do is use it in a commercial project without my approval (add me at http://steamcommunity.com/id/shendow/)
* I won't provide much support if you run into trouble editing this file.
*/

local base_table = SH_REPORTS
local font_prefix = "SH_REPORTS."

--
local matClose = Material("shenesis/general/close.png", "noclamp smooth")

local function get_scale()
	local sc = math.Clamp(ScrH() / 1080, 0.75, 1)
	if (!th) then
		th = 48 * sc
		m = th * 0.25
	end

	return sc
end

function base_table:L(s, ...)
	return string.format(self.Language[s] or s, ...)
end

function base_table:GetPadding()
	return th
end

function base_table:GetMargin()
	return m
end

function base_table:GetScreenScale()
	return get_scale()
end

function base_table:CreateFonts(scale)
	local font = self.Font
	local font_bold = self.FontBold

	local sizes = {
		[12] = "Small",
		[16] = "Medium",
		[20] = "Large",
		[24] = "Larger",
		[32] = "Largest",
		[200] = "3D",
	}

	for s, n in pairs (sizes) do
		surface.CreateFont(font_prefix .. n, {font = font, size = s * scale})
		surface.CreateFont(font_prefix .. n .. "B", {font = font_bold, size = s * scale})
	end
end

hook.Add("InitPostEntity", font_prefix .. "CreateFonts", function()
	base_table:CreateFonts(get_scale())
end)

function base_table:MakeWindow(title)
	local scale = get_scale()
	local styl = self.Style

	local pnl = vgui.Create("EditablePanel")
	pnl.m_bDraggable = true
	pnl.SetDraggable = function(me, b)
		me.m_bDraggable = b
	end
	pnl.Paint = function(me, w, h)
		if (me.m_fCreateTime) then
			Derma_DrawBackgroundBlur(me, me.m_fCreateTime)
		end

		draw.RoundedBox(4, 0, 0, w, h, styl.bg)
	end
	pnl.OnClose = function() end
	pnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:AlphaTo(0, 0.1, 0, function()
			me:Remove()
		end)
		me:OnClose()
	end

		local header = vgui.Create("DPanel", pnl)
		header:SetTall(th)
		header:Dock(TOP)
		header.Paint = function(me, w, h)
			draw.RoundedBoxEx(4, 0, 0, w, h, styl.header, true, true, false, false)
		end
		header.Think = function(me)
			if (me.Hovered and pnl.m_bDraggable) then
				me:SetCursor("sizeall")
			end

			local drag = me.m_Dragging
			if (drag) then
				local mx, my = math.Clamp(gui.MouseX(), 1, ScrW() - 1), math.Clamp(gui.MouseY(), 1, ScrH() - 1)
				local x, y = mx - drag[1], my - drag[2]

				pnl:SetPos(x, y)
			end
		end
		header.OnMousePressed = function(me)
			if (pnl.m_bDraggable) then
				me.m_Dragging = {gui.MouseX() - pnl.x, gui.MouseY() - pnl.y}
				me:MouseCapture(true)
			end
		end
		header.OnMouseReleased = function(me)
			me.m_Dragging = nil
			me:MouseCapture(false)
		end
		pnl.m_Header = header

			local titlelbl = self:QuickLabel(title, font_prefix .. "Larger", styl.text, header)
			titlelbl:Dock(LEFT)
			titlelbl:DockMargin(m, 0, 0, 0)
			pnl.m_Title = titlelbl

			local close = vgui.Create("DButton", header)
			close:SetText("")
			close:SetWide(th)
			close:Dock(RIGHT)
			close.Paint = function(me, w, h)
				if (me.Hovered) then
					draw.RoundedBoxEx(4, 0, 0, w, h, styl.close_hover, false, true, false, false)
				end

				if (me:IsDown()) then
					draw.RoundedBoxEx(4, 0, 0, w, h, styl.hover, false, true, false, false)
				end

				surface.SetDrawColor(me:IsDown() and styl.text_down or styl.text)
				surface.SetMaterial(matClose)
				surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 16 * scale, 16 * scale, 0)
			end
			close.DoClick = function(me)
				pnl:Close()
			end
			pnl.m_Close = close

	pnl.AddHeaderButton = function(me, icon, callback)
		local btn = vgui.Create("DButton", header)
		btn:SetText("")
		btn:SetWide(self:GetPadding())
		btn:Dock(RIGHT)
		btn.Paint = function(me, w, h)
			if (me.Hovered) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end

			surface.SetMaterial(icon)
			surface.SetDrawColor(styl.text)
			surface.DrawTexturedRect(w * 0.5 - 8, h * 0.5 - 8, 16, 16)
		end
		btn.DoClick = function()
			callback()
		end

		return btn
	end

	return pnl
end

function base_table:QuickLabel(t, f, c, p)
	local l = vgui.Create("DLabel", p)
	l:SetText(t)
	l:SetFont(f:Replace("{prefix}", font_prefix))
	l:SetColor(c)
	l:SizeToContents()

	return l
end

function base_table:QuickButton(t, cb, p, f, c)
	p:SetMouseInputEnabled(true)

	local styl = self.Style

	local b = vgui.Create("DButton", p)
	b:SetText(t)
	b:SetFont((f or "{prefix}Medium"):Replace("{prefix}", font_prefix))
	b:SetColor(c or styl.text)
	b:SizeToContents()
	b.DoClick = function(me)
		cb(me)
	end
	b.Paint = function(me, w, h)
		local r = me.m_iRound or 4

		draw.RoundedBox(r, 0, 0, w, h, me.m_Background or styl.inbg)

		if (!me.m_bNoHover and me.Hovered) then
			draw.RoundedBox(r, 0, 0, w, h, styl.hover)
		end

		if (me.IsDown and me:IsDown()) then
			draw.RoundedBox(r, 0, 0, w, h, styl.hover)
		end
	end

	return b
end

function base_table:ButtonStyle(b, f, c)
	local styl = self.Style

	b:SetFont((f or "{prefix}Medium"):Replace("{prefix}", font_prefix))
	b:SetContentAlignment(5)
	b:SetColor(c or styl.text)
	b.Paint = function(me, w, h)
		local r = me.m_iRound or 4

		draw.RoundedBox(r, 0, 0, w, h, me.m_Background or styl.inbg)

		if (!me.m_bNoHover and me.Hovered) then
			draw.RoundedBox(r, 0, 0, w, h, styl.hover)
		end

		if (me.IsDown and me:IsDown()) then
			draw.RoundedBox(r, 0, 0, w, h, styl.hover)
		end
	end
end

function base_table:LineStyle(l)
	local styl = self.Style

	for _, v in pairs (l.Columns) do
		if (v.SetFont) then
			v:SetContentAlignment(5)
			v:SetFont(font_prefix .. "Medium")
			v:SetTextColor(styl.text)
		end
	end

	l.Paint = function(me, w, h)
		if (!me:GetAltLine()) then
			surface.SetAlphaMultiplier(math.min(me:GetAlpha() / 255, 0.5))
				surface.SetDrawColor(styl.inbg)
				surface.DrawRect(0, 0, w, h)
			surface.SetAlphaMultiplier(me:GetAlpha() / 255)
		end

		if (me:IsSelectable() and me:IsLineSelected()) then
			surface.SetDrawColor(styl.hover)
			surface.DrawRect(0, 0, w, h)
		elseif (me.Hovered or me:IsChildHovered()) then
			surface.SetDrawColor(styl.hover2)
			surface.DrawRect(0, 0, w, h)
		end
	end
end

function base_table:QuickEntry(tx, parent)
	parent:SetMouseInputEnabled(true)
	parent:SetKeyboardInputEnabled(true)

	local styl = self.Style

	local entry = vgui.Create("DTextEntry", parent)
	entry:SetText(tx or "")
	entry:SetFont(font_prefix .. "Medium")
	entry:SetDrawLanguageID(false)
	entry:SetUpdateOnType(true)
	entry:SetTextColor(styl.text)
	entry:SetHighlightColor(styl.header)
	entry:SetCursorColor(styl.text)
	entry.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, styl.textentry)
		me:DrawTextEntryText(me:GetTextColor(), me:GetHighlightColor(), me:GetCursorColor())
	end

	return entry
end

function base_table:QuickComboBox(parent)
	parent:SetMouseInputEnabled(true)

	local combo = vgui.Create("DComboBox", parent)
	combo.m_bNoHover = true
	self:ButtonStyle(combo)

	combo.OldDoClick = combo.DoClick
	combo.DoClick = function(me)
		me:OldDoClick()

		if (IsValid(me.Menu)) then
			for _, v in pairs (me.Menu:GetChildren()[1]:GetChildren()) do -- sdfdsfzz
				self:ButtonStyle(v)
				v.m_iRound = 0
			end
		end
	end

	return combo
end

function base_table:PaintScroll(panel)
	local styl = self.Style

	local scr = panel.VBar or panel:GetVBar()
	scr.Paint = function(_, w, h)
		draw.RoundedBox(4, 0, 0, w, h, /* 76561199385207498 styl.header */ styl.bg)
	end

	scr.btnUp.Paint = function(_, w, h)
		draw.RoundedBox(4, 2, 0, w - 4, h - 2, styl.inbg)
	end
	scr.btnDown.Paint = function(_, w, h)
		draw.RoundedBox(4, 2, 2, w - 4, h - 2, styl.inbg)
	end

	scr.btnGrip.Paint = function(me, w, h)
		draw.RoundedBox(4, 2, 0, w - 4, h, styl.inbg)

		if (me.Hovered) then
			draw.RoundedBox(4, 2, 0, w - 4, h, styl.hover2)
		end

		if (me.Depressed) then
			draw.RoundedBox(4, 2, 0, w - 4, h, styl.hover2)
		end
	end
end

function base_table:PaintList(ilist)
	for _, v in pairs (ilist.Columns) do
		self:ButtonStyle(v.Header)
		v.DraggerBar:SetVisible(false)
	end

	self:PaintScroll(ilist)
end

function base_table:StringRequest(title, text, callback)
	local styl = self.Style

	if (IsValid(_LOUNGE_STRREQ)) then
		_LOUNGE_STRREQ:Remove()
	end

	local scale = get_scale()
	local wi, he = 600 * scale, 160 * scale

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = self:MakeWindow(title)
	pnl:SetSize(wi, he)
	pnl:Center()
	pnl:MakePopup()
	pnl.m_fCreateTime = SysTime()
	_LOUNGE_STRREQ = pnl

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

		local body = vgui.Create("DPanel", pnl)
		body:SetDrawBackground(false)
		body:Dock(FILL)
		body:DockPadding(m, m, m, m)

			local tx = self:QuickLabel(text, font_prefix .. "Large", styl.text, body)
			tx:SetContentAlignment(5)
			tx:SetWrap(tx:GetWide() > wi - m * 2)
			tx:Dock(FILL)

			local apply = vgui.Create("DButton", body)
			apply:SetText("OK")
			apply:SetColor(styl.text)
			apply:SetFont(font_prefix .. "Medium")
			apply:Dock(BOTTOM)
			apply.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, styl.inbg)

				if (me.Hovered) then
					draw.RoundedBox(4, 0, 0, w, h, styl.hover)
				end

				if (me:IsDown()) then
					draw.RoundedBox(4, 0, 0, w, h, styl.hover)
				end
			end

			local entry = vgui.Create("DTextEntry", body)
			entry:RequestFocus()
			entry:SetFont(font_prefix .. "Medium")
			entry:SetDrawLanguageID(false)
			entry:Dock(BOTTOM)
			entry:DockMargin(0, m, 0, m)
			entry.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, styl.textentry)
				me:DrawTextEntryText(me:GetTextColor(), me:GetHighlightColor(), me:GetCursorColor())
			end
			entry.OnEnter = function()
				apply:DoClick()
			end

			apply.DoClick = function()
				pnl:Close()
				callback(entry:GetValue())
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

	pnl:SetWide(math.max(math.min(tx:GetWide() + m * 2, pnl:GetWide()), th * 2))
	pnl:CenterHorizontal()

	pnl:SetAlpha(0)
	pnl:AlphaTo(255, 0.1)
end

function base_table:Menu()
	local styl = self.Style

	if (IsValid(_LOUNGE_MENU)) then
		_LOUNGE_MENU:Remove()
	end

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = vgui.Create("DPanel")
	pnl:SetDrawBackground(false)
	pnl:SetSize(20, 1)
	pnl.AddOption = function(me, text, callback)
		surface.SetFont(font_prefix .. "MediumB")
		local wi, he = surface.GetTextSize(text)
		wi = wi + m * 2
		he = he + m

		me:SetWide(math.max(wi, me:GetWide()))
		me:SetTall(pnl:GetTall() + he)

		local btn = vgui.Create("DButton", me)
		btn:SetText(self:L(text))
		btn:SetFont(font_prefix .. "MediumB")
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
			if (callback) then
				callback()
			end
			pnl:Close()
		end

		return btn
	end
	pnl.Open = function(me)
		me:SetPos(gui.MouseX(), math.min(math.max(0, ScrH() - me:GetTall()), gui.MouseY()))
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
	_LOUNGE_MENU = pnl

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

function base_table:PanelPaint(name)
	local styl = self.Style
	local col = styl[name] or styl.bg

	return function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, col)
	end
end

// https://facepunch.com/showthread.php?t=1522945&p=50524545&viewfull=1#post50524545|76561199385207507
local sin, cos, rad = math.sin, math.cos, math.rad
local rad0 = rad(0)
local function DrawCircle(x, y, radius, seg)
	local cir = {
		{x = x, y = y}
	}

	for i = 0, seg do
		local a = rad((i / seg) * -360)
		table.insert(cir, {x = x + sin(a) * radius, y = y + cos(a) * radius})
	end

	table.insert(cir, {x = x + sin(rad0) * radius, y = y + cos(rad0) * radius})
	surface.DrawPoly(cir)
end

function base_table:Avatar(ply, siz, par)
	if (type(ply) == "Entity" and !IsValid(ply)) then
		return end

	if (isnumber(ply)) then
		ply = tostring(ply)
	end

	siz = siz or 32
	local hsiz = siz * 0.5

	local url = "http://steamcommunity.com/profiles/" .. (isstring(ply) and ply or ply:SteamID64() or "")

	par:SetMouseInputEnabled(true)

	local pnl = vgui.Create("DPanel", par)
	pnl:SetSize(siz, siz)
	pnl:SetDrawBackground(false)
	pnl.Paint = function() end

		local av = vgui.Create("AvatarImage", pnl)
		if (isstring(ply)) then
			av:SetSteamID(ply, siz)
		else
			av:SetPlayer(ply, siz)
		end
		av:SetPaintedManually(true)
		av:SetSize(siz, siz)

			local btn = vgui.Create("DButton", av)
			btn:SetToolTip("Click here to view " .. (isstring(ply) and "their" or ply:Nick() .. "'s") .. " Steam Profile")
			btn:SetText("")
			btn:Dock(FILL)
			btn.Paint = function() end
			btn.DoClick = function(me)
				gui.OpenURL(url)
			end

	pnl.SetSteamID = function(me, s)
		av:SetSteamID(s, siz)
		url = "http://steamcommunity.com/profiles/" .. s
	end
	pnl.SetPlayer = function(me, p)
		av:SetPlayer(p, siz)
		url = "http://steamcommunity.com/profiles/" .. p:SteamID64()
	end
	pnl.Paint = function(me, w, h)
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
		surface.SetDrawColor(color_black)
		DrawCircle(hsiz, hsiz, hsiz, hsiz)

		render.SetStencilFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilReferenceValue(1)

		av:PaintManual()

		render.SetStencilEnable(false)
		render.ClearStencil()
	end

	return pnl
end

local c = {}
function base_table:GetName(sid, cb)
	if (c[sid]) then
		cb(c[sid])
		return
	end

	for _, v in pairs (player.GetAll()) do
		if (v:SteamID64() == sid) then
			c[sid] = v:Nick()
			cb(v:Nick())
			return
		end
	end

	steamworks.RequestPlayerInfo(sid)
	timer.Simple(1, function()
		local n = steamworks.GetPlayerName(sid)
		c[sid] = n
		cb(n)
	end)
end

function base_table:Notify(msg, dur, bg, parent)
	if (IsValid(_SH_NOTIFY)) then
		_SH_NOTIFY:Close()
	end

	dur = dur or 3
	bg = bg or self.Style.header

	local fnt = font_prefix .. "Larger"

	local w, h = ScrW(), ScrH()
	if (IsValid(parent)) then
		w, h = parent:GetSize()
		fnt = font_prefix .. "Large"
	end

	local p = vgui.Create("DButton", parent)
	p:MoveToFront()
	p:SetText(self.Language[msg] or msg)
	p:SetFont(fnt)
	p:SetColor(self.Style.text)
	p:SetSize(w, draw.GetFontHeight(fnt) + self:GetMargin() * 2)
	p:AlignTop(h)
	p.Paint = function(me, w, h)
		surface.SetDrawColor(bg)
		surface.DrawRect(0, 0, w, h)
	end
	p.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:Stop()
		me:MoveTo(0, h, 0.2, 0, -1, function()
			me:Remove()
		end)
	end
	p.DoClick = p.Close
	_SH_NOTIFY = p

	p:MoveTo(0, h - p:GetTall(), 0.2, 0, -1, function()
		p:MoveTo(0, h, 0.2, dur, -1, function()
			p:Remove()
		end)
	end)
end

function base_table:LerpColor(frac, from, to)
	return Color(Lerp(frac, from.r, to.r), Lerp(frac, from.g, to.g), Lerp(frac, from.b, to.b), Lerp(frac, from.a, to.a))
end
--PATH addons/sh_reports/lua/reports/cl_menu_make.lua:
local function L(...) return SH_REPORTS:L(...) end

local matBack = Material("shenesis/general/back.png")

function SH_REPORTS:ShowMakeReports(c, d)
	if (IsValid(_SH_REPORTS_MAKE)) then
		_SH_REPORTS_MAKE:Remove()
	end

	local styl = self.Style
	local th, m = self:GetPadding(), self:GetMargin()
	local m2 = m * 0.5
	local ss = self:GetScreenScale()

	local frame = self:MakeWindow(L"new_report")
	frame:SetSize(500 * ss, 500 * ss)
	frame:Center()
	frame:MakePopup()
	_SH_REPORTS_MAKE = frame

		frame:AddHeaderButton(matBack, function()
			frame:Close()
			self:ShowReports()
		end)

		local body = vgui.Create("DPanel", frame)
		body:SetDrawBackground(false)
		body:Dock(FILL)
		body:DockMargin(m, m, m, m)

			local lbl = self:QuickLabel(L"reason" .. ":", "{prefix}Large", styl.text, body)
			lbl:Dock(TOP)

				local reason = self:QuickComboBox(lbl)
				reason:Dock(FILL)
				reason:DockMargin(lbl:GetWide() + m, 0, 0, 0)

				for rid, r in pairs (self.ReportReasons) do
					reason:AddChoice(r, rid)
				end

			local lbl = self:QuickLabel(L"player_to_report" .. ":", "{prefix}Large", styl.text, body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m, 0, m)

				local target = self:QuickComboBox(lbl)
				target:SetSortItems(false)
				target:Dock(FILL)
				target:DockMargin(lbl:GetWide() + m, 0, 0, 0)

				local toadd = {}
				for _, ply in ipairs (player.GetAll()) do
					if (ply == LocalPlayer()) then
						continue end

					if (self:IsAdmin(ply) and !self.StaffCanBeReported) then
						continue end

					table.insert(toadd, {nick = ply:Nick(), steamid = ply:SteamID64()})
				end

				for _, d in SortedPairsByMemberValue (toadd, "nick") do
					target:AddChoice(d.nick, d.steamid)
				end

				if (self.CanReportOther) then
					target:AddChoice("​[" .. L"other" .. "]", "0")
				end

			local p = vgui.Create("DPanel", body)
			p:SetTall(64 * ss + m)
			p:Dock(TOP)
			p:DockPadding(m2, m2, m2, m2)
			p.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, styl.inbg)
			end

				local pc = vgui.Create("DPanel", p)
				pc:SetPaintedManually(true)
				pc:SetDrawBackground(false)
				pc:Dock(FILL)

					local avi = self:Avatar("", 64 * ss, pc)
					avi:Dock(LEFT)
					avi:DockMargin(0, 0, m2, 0)

					local nick = self:QuickLabel("", "{prefix}Large", styl.text, pc)
					nick:Dock(TOP)

					local steamid = self:QuickLabel("", "{prefix}Medium", styl.text, pc)
					steamid:Dock(TOP)

			local lbl = self:QuickLabel(L"comment" .. ":" /* 76561199385207498 */, "{prefix}Large", styl.text, body)
			lbl:SetContentAlignment(7)
			lbl:Dock(FILL)
			lbl:DockMargin(0, m, 0, 0)

				local comment = self:QuickEntry("", lbl)
				comment:SetValue(c or "")
				comment:SetMultiline(true)
				comment:Dock(FILL)
				comment:DockMargin(0, lbl:GetTall() + m2, 0, 0)

			local btns = vgui.Create("DPanel", body)
			btns:SetDrawBackground(false)
			btns:Dock(BOTTOM)
			btns:DockMargin(0, m, 0, 0)

				local submit = self:QuickButton(L"submit_report", function()
					local name, steamid = target:GetSelected()
					if (!steamid) then
						self:Notify(L"select_player_first", nil, styl.failure, frame)
						return
					end

					local _, rid = reason:GetSelected()
					if (!rid) then
						self:Notify(L"select_reason_first", nil, styl.failure, frame)
						return
					end

					easynet.SendToServer("SH_REPORTS.NewReport", {
						reported_name = name,
						reported_id = steamid,
						reason_id = rid,
						comment = comment:GetValue():sub(1, self.MaxCommentLength),
					})

					frame:Close()
				end, btns)
				submit:Dock(RIGHT)

			-- cbs
			if (d) then
				reason.OnSelect = function(me, index, value, data)
					local k = self.ReasonAutoTarget[value]
					if (!k) then
						return end

					local p = d["last" .. k]
					if (IsValid(p)) then
						local i
						for k, v in pairs (target.Choices) do
							if (v == p:Nick()) then
								i = k
								break
							end
						end

						if (i) then
							target:ChooseOption(p:Nick(), i)
						end
					end
				end
			end
			target.OnSelect = function(me, index, value, data)
				pc:SetPaintedManually(false)
				pc:SetAlpha(0)
				pc:AlphaTo(255, 0.2)

				avi:SetVisible(data ~= "0")
				avi:SetSteamID(data)
				nick:SetText(value)
				steamid:SetText(data ~= "0" and util.SteamIDFrom64(data) or "")
				steamid:InvalidateParent(true)
			end

	frame:SetAlpha(0)
	frame:AlphaTo(255, 0.1)
end

easynet.Callback("SH_REPORTS.QuickReport", function(data)
	SH_REPORTS:ShowMakeReports(data.comment, data)
end)
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
--PATH lua/drgbase/modules/util.lua:

-- Traces --

local DebugTraces = CreateConVar("drgbase_debug_traces", "0")
function util.DrG_TraceLine(data)
	local tr = util.TraceLine(data)
	if DebugTraces:GetFloat() > 0 then
		local clr = tr.Hit and DrGBase.CLR_RED or DrGBase.CLR_GREEN
		debugoverlay.Line(data.start, tr.HitPos, DebugTraces:GetFloat(), clr, false)
		debugoverlay.Line(tr.HitPos, data.endpos, DebugTraces:GetFloat(), DrGBase.CLR_WHITE, false)
	end
	return tr
end
function util.DrG_TraceHull(data)
	local tr = util.TraceHull(data)
	if DebugTraces:GetFloat() > 0 then
		local clr = tr.Hit and DrGBase.CLR_RED or DrGBase.CLR_GREEN
		clr = clr:ToVector():ToColor() clr.a = 0
		debugoverlay.Line(data.start, tr.HitPos, DebugTraces:GetFloat(), DrGBase.CLR_WHITE, false)
		debugoverlay.Box(tr.HitPos, data.mins, data.maxs, DebugTraces:GetFloat(), clr)
	end
	return tr
end
function util.DrG_TraceLineRadial(dist, precision, data)
	local traces = {}
	for i = 1, precision do
		local normal = Vector(1, 0, 0)
		normal:Rotate(Angle(0, i*(360/precision), 0))
		data.endpos = data.start + normal*dist
		table.insert(traces, util.DrG_TraceLine(data))
	end
	table.sort(traces, function(tr1, tr2)
		return data.start:DistToSqr(tr1.HitPos) < data.start:DistToSqr(tr2.HitPos)
	end)
	return traces
end
function util.DrG_TraceHullRadial(dist, precision, data)
	local traces = {}
	for i = 1, precision do
		local normal = Vector(1, 0, 0)
		normal:Rotate(Angle(0, i*(360/precision), 0))
		data.endpos = data.start + normal*dist
		table.insert(traces, util.DrG_TraceHull(data))
	end
	table.sort(traces, function(tr1, tr2)
		return data.start:DistToSqr(tr1.HitPos) < data.start:DistToSqr(tr2.HitPos)
	end)
	return traces
end

-- Misc --

function util.DrG_SaveDmg(dmg)
	local data = {}
	data.ammoType = dmg:GetAmmoType()
	data.attacker = dmg:GetAttacker()
	data.baseDamage = dmg:GetBaseDamage()
	data.damage = dmg:GetDamage()
	data.damageBonus = dmg:GetDamageBonus()
	data.damageCustom = dmg:GetDamageCustom()
	data.damageForce = dmg:GetDamageForce()
	data.damagePosition = dmg:GetDamagePosition()
	data.damageType = dmg:GetDamageType()
	data.inflictor = dmg:GetInflictor()
	data.maxDamage = dmg:GetMaxDamage()
	data.reportedPosition = dmg:GetReportedPosition()
	return data
end
function util.DrG_LoadDmg(data)
	local dmg = DamageInfo()
	if not istable(data) then return end
	dmg:SetAmmoType(data.ammoType)
	if IsValid(data.attacker) then
		dmg:SetAttacker(data.attacker)
	end
	dmg:SetDamage(data.damage)
	dmg:SetDamageBonus(data.damageBonus)
	dmg:SetDamageCustom(data.damageCustom)
	dmg:SetDamageForce(data.damageForce)
	dmg:SetDamagePosition(data.damagePosition)
	dmg:SetDamageType(data.damageType)
	if IsValid(data.inflictor) then
		dmg:SetInflictor(data.inflictor)
	end
	dmg:SetMaxDamage(data.maxDamage)
	dmg:SetReportedPosition(data.reportedPosition)
	return dmg
end

function util.DrG_MergeColors(ratio, max, low)
	ratio = math.Clamp(ratio, 0, 1)
	return Color(
		max.r*ratio + low.r*(1-ratio),
		max.g*ratio + low.g*(1-ratio),
		max.b*ratio + low.b*(1-ratio),
		max.a*ratio + low.a*(1-ratio)
	)
end

--PATH addons/sl_util_wallet/lua/autorun/ezwallet_loader.lua:
easzy = easzy or {}
easzy.wallet = {}

if CLIENT then
	easzy.wallet.itemID = easzy.wallet.itemID or 0
end

local path = "ezwallet"

local function NicePrint(txt)
	if SERVER then
		MsgC(easzy.wallet.colors.carrot, txt .. "\n")
	else
		MsgC(easzy.wallet.colors.belizeHole, txt .. "\n")
	end
end

local function LoadFile(fdir, afile, info, sv, cl)
	if info then
		local txt = "// [ Init ]: " .. afile .. string.rep(" ", 36 - afile:len()) .. "//"
		NicePrint(txt)
	end

	if (sv and SERVER) then
		include(fdir .. afile)
	end

	if cl then
		if SERVER then
			AddCSLuaFile(fdir .. afile)
		else
			include(fdir .. afile)
		end
	end
end

local IgnoreFileTable = {}
local function PreLoadFile(fdir, afile, info, sv, cl)
	IgnoreFileTable[afile] = true
	LoadFile(fdir, afile, info, sv, cl)
end

local function LoadAllFiles(fdir, sv, cl)
	local files, dirs = file.Find(fdir .. "*", "LUA")

	for _, afile in ipairs(files) do
		if (string.match(afile, ".lua") and not IgnoreFileTable[afile]) then
			LoadFile(fdir, afile, true, sv, cl)
		end
	end

	for _, dir in ipairs(dirs) do
		LoadAllFiles(fdir .. dir .. "/", sv, cl)
	end
end

local function Initialize()
	NicePrint(" ")
	NicePrint("//////////////////// EZ WALLET ////////////////////")
	NicePrint("//                                               //")
	NicePrint("///////////////////// SHARED //////////////////////")
	NicePrint("//                                               //")
	LoadAllFiles(path .. "/languages/", true, true)
	LoadAllFiles(path .. "/shared/", true, true)

	-- Because we need config and languages before loading the items config
	LoadFile("", "ezwallet_items_config.lua", false, true, true)

	if SERVER then
		NicePrint("//                                               //")
		NicePrint("//////////////////// SERVER ///////////////////////")
		NicePrint("//                                               //")
		LoadAllFiles(path .. "/server/", true)
	end

	NicePrint("//                                               //")
	NicePrint("//////////////////// CLIENT ///////////////////////")
	NicePrint("/                                                //")
	LoadAllFiles(path .. "/vgui/", false, true)
	LoadAllFiles(path .. "/client/", false, true)
	NicePrint("//                                               //")
	NicePrint("///////////////////////////////////////////////////")
end

PreLoadFile(path .. "/shared/", "colors.lua", false, true, true)
PreLoadFile(path .. "/client/", "fonts.lua", false, false, true)
PreLoadFile("", "ezwallet_config.lua", false, true, true)

Initialize()

--PATH addons/sl_util_wallet/lua/ezwallet/shared/viewmodel.lua:


if CLIENT then
    net.Receive("ez_wallet_clear_viewmodel_sub_materials", function()
        local localPlayer = LocalPlayer()
        if not IsValid(localPlayer) then return end

        local viewModel = localPlayer:GetViewModel()
        viewModel:SetSubMaterial()
    end)

    net.Receive("ez_wallet_reset_viewmodel_bone_manipulations", function()
        local viewModel = net.ReadEntity()
        if not IsValid(viewModel) then return end

        easzy.wallet.ResetViewModelBoneManipulations(viewModel)
    end)
else
    util.AddNetworkString("ez_wallet_clear_viewmodel_sub_materials")
    util.AddNetworkString("ez_wallet_reset_viewmodel_bone_manipulations")

    function easzy.wallet.ClearViewModelSubMaterials(ply)
        net.Start("ez_wallet_clear_viewmodel_sub_materials")
        net.Send(ply)
    end

    local itemClasses = {
        ["ez_wallet_wallet"] = true,
        ["ez_wallet_card"] = true,
        ["ez_wallet_money"] = true
    }

    hook.Add("PlayerSwitchWeapon", "ezwallet_clear_viewmodel_PlayerSwitchWeapon", function(ply, oldWeapon)
        -- OnViewModelChanged don't give the player
        -- SetSubMaterial don't work serverside
        easzy.wallet.ClearViewModelSubMaterials(ply)

        if not IsValid(oldWeapon) then return end

        local oldWeaponClass = oldWeapon:GetClass()
        if not itemClasses[oldWeaponClass] then return end

        local viewModel = ply:GetViewModel()
        if not IsValid(viewModel) then return end

        viewModel:SetVar("ezwallet_lastAnimationsSequence", CurTime())
    end)

    hook.Add("OnViewModelChanged", "ezwallet_reset_viewmodel_bone_manipulations_OnViewModelChanged", function(viewModel)
        local owner = viewModel:GetOwner()
        if not IsValid(owner) then return end

        net.Start("ez_wallet_reset_viewmodel_bone_manipulations")
            net.WriteEntity(viewModel)
        net.Send(owner)
    end)
end


--PATH addons/sl_util_wallet/lua/ezwallet/client/update_card_material.lua:


-- Returns the player first name and last name
local function GetFormatedName(ply)
    local nick = string.lower(ply:Nick())
    local nickSplit = string.Split(nick, " ")

    local firstName = nickSplit[1]
    local firstNameFirstLetter = string.sub(firstName, 1, 1)
    firstName = string.SetChar(firstName, 1, string.upper(firstNameFirstLetter))

    local lastName = table.concat(nickSplit, " ", 2)
    lastName = string.upper(lastName)

    return firstName, lastName
end

local function DrawKobralostAdvancedDriverLicense(ply, itemConfig, licenses)
    local ADLString = ply:GetNWString("adl_license_info")
    local ADLStringTable = string.Explode("%", ADLString) or {}
    for i = 1, #ADLStringTable do
        if isstring(ADLStringTable[i]) then
            local key = easzy.wallet.config.kobralostAdvancedDriverLicense[ADLStringTable[i]]
            if not key then continue end
            licenses[key] = {
                points = ADLStringTable[i + 1]
            }
        end
    end

    for licenseName, license in pairs(licenses) do
        local licensePos = itemConfig.driverLicense[licenseName].pos
        local licensePoints = license.points or nil
        local licenseText = (licensePoints and licensePoints .. " " .. easzy.wallet.languages.points or easzy.wallet.languages.no)
        draw.SimpleText(licenseText, itemConfig.driverLicense.font, licensePos.x, licensePos.y, easzy.wallet.colors.black, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    end
end

local function DrawToBadForYouDriverLicenseSystem(ply, itemConfig, licenses)
    for i, n in ipairs(DI_DATABASE) do
        local key = easzy.wallet.config.toBadForYouDriverLicenseSystem[n.Name]
        if not key then continue end
        licenses[key] = {
            hasTheory = TBFY_SH:PlayerHasTheory(TBFY_SH:SID(ply), n.TheoryTest, i),
            hasLicense = ply:HasDLicense(i),
            points = ply:GetDILicensePoints(i)
        }
    end

    for licenseName, license in pairs(licenses) do
        local licensePos = itemConfig.driverLicense[licenseName].pos
        local licenseString = ""
        if license.hasLicense then
            if TBFYDIConfig.DisplayPoints then
                licenseString = license.points .. " " .. easzy.wallet.languages.points
            else
                licenseString = licenseString .. easzy.wallet.languages.yes
            end
        elseif license.hasTheory then
            licenseString = licenseString .. easzy.wallet.languages.theoryOnly
        end
        draw.SimpleText(licenseString != "" and licenseString or easzy.wallet.languages.no, itemConfig.driverLicense.font, licensePos.x, licensePos.y, easzy.wallet.colors.black, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    end
end

local function DrawKobralostAdvancedWeaponLicense(ply, itemConfig, licenses)
    for i = 1, 4 do
        local key = easzy.wallet.config.kobralostAdvancedWeaponLicense[i]
        if not key then continue end
        licenses[key] = {
            hasLicense = AWLicense.CheckLicense(AWLicense.Theory[i]["Name"], "practice", ply)
        }
    end

    for licenseName, license in pairs(licenses) do
        local licensePos = itemConfig.weaponLicense[licenseName].pos
        draw.SimpleText(license.hasLicense and easzy.wallet.languages.yes or easzy.wallet.languages.no, itemConfig.weaponLicense.font, licensePos.x, licensePos.y, easzy.wallet.colors.black, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    end
end

local function DrawToBadForYouFirearmsLicenseSystem(ply, itemConfig, licenses)
    for i, n in ipairs(FALICENSE_DATABASE) do
        local key = easzy.wallet.config.toBadForYouFirearmsLicenseSystem[n.Name]
        if not key then continue end
        licenses[key] = {
            hasLicense = ply:FACanCarry(i),
            hasSellingLicense = ply:FACanSell(i)
        }
    end

    for licenseName, license in pairs(licenses) do
        local licensePos = itemConfig.weaponLicense[licenseName].pos
        local licenseString = ""
        if license.hasLicense then
            licenseString = licenseString .. easzy.wallet.languages.carry
        end
        if license.hasSellingLicense then
            if licenseString != "" then
                licenseString = licenseString .. " " .. easzy.wallet.languages.andSell
            else
                licenseString = licenseString .. easzy.wallet.languages.sell
            end
        end

        draw.SimpleText(licenseString != "" and licenseString or easzy.wallet.languages.no, itemConfig.weaponLicense.font, licensePos.x, licensePos.y, easzy.wallet.colors.black, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    end
end

function easzy.wallet.UpdateCardMaterial(baseTexture, owner, entity)
    if not IsValid(owner) or not owner:IsPlayer() or not owner:Alive() then return end
    if not IsValid(entity) or not entity.id then return end

    -- No need to update the texture for the money
    if baseTexture == "easzy/ez_wallet/banknote" then return end

    -- Because it doesn't work if we create it inside the cam.Start2D
    entity.picture = entity.picture or vgui.Create("ModelImage")
    entity.picture:SetPaintedManually(true)

    local uniqueID =  "_" .. baseTexture .. "_" .. entity.id

    -- Old VMT with unlit
    local oldMaterialName = "ezwallet_old_card_material" .. uniqueID
    local oldMaterial = CreateMaterial(oldMaterialName, "UnlitGeneric", {
        ["$basetexture"] = nil,
        ["$basetexturetransform"] = "center .5 .5 scale 1.03 1.03 rotate 0 translate 0 0",
        ["$model"] = 1,
        ["$ignorez"] = true
    })
    oldMaterial:SetTexture("$basetexture", baseTexture)

    -- New VTF
    local newTextureName = "ezwallet_new_card_texture" .. uniqueID
    local newTexture = GetRenderTarget(newTextureName, 1024, 1024)
    local w, h = newTexture:Width(), newTexture:Height()

    render.PushRenderTarget(newTexture)
    render.Clear(255, 255, 255, 255, true)
        cam.Start2D()
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(oldMaterial)
            surface.DrawTexturedRect(0, 0, w, h)

            local itemConfig = easzy.wallet.walletItemsConfig[baseTexture]
            if not itemConfig then
                cam.End2D()
                return
            end
            if itemConfig.picture then
                local picturePos = itemConfig.picture.pos
                local pictureSize = itemConfig.picture.size

                entity.picture:SetModel(owner:GetModel())
                entity.picture:SetPos(picturePos.x, picturePos.y)
                entity.picture:SetSize(pictureSize.w, pictureSize.h)
                entity.picture:PaintManual()
            end
            if itemConfig.name then
                local firstName, lastName = GetFormatedName(owner)
                local namePos = itemConfig.name.pos
                draw.SimpleText(lastName .. " " .. firstName, itemConfig.name.font, namePos.x, namePos.y, easzy.wallet.colors.white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            elseif itemConfig.firstName and itemConfig.lastName then
                local firstName, lastName = GetFormatedName(owner)
                local lastNamePos = itemConfig.lastName.pos
                local firstNamePos = itemConfig.firstName.pos
                draw.SimpleText(lastName, itemConfig.lastName.font, lastNamePos.x, lastNamePos.y, easzy.wallet.colors.black, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                draw.SimpleText(firstName, itemConfig.lastName.font, firstNamePos.x, firstNamePos.y, easzy.wallet.colors.black, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            end
            if itemConfig.id then
                local id = owner:SteamID64()
                local idPos = itemConfig.id.pos
                draw.SimpleText(id, itemConfig.id.font, idPos.x, idPos.y, easzy.wallet.colors.black, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            end
            if itemConfig.driverLicense and easzy.wallet.checks.compatibility[easzy.wallet.config.driverLicenseSystem] then
                local licenses = {
                    car = {},
                    motorcycle = {},
                    truck = {},
                    bus = {},
                }

                if easzy.wallet.config.driverLicenseSystem == "Kobralost Advanced Driver License" then
                    DrawKobralostAdvancedDriverLicense(owner, itemConfig, licenses)
                elseif easzy.wallet.config.driverLicenseSystem == "ToBadForYou Driver License System" then
                    DrawToBadForYouDriverLicenseSystem(owner, itemConfig, licenses)
                end
            end
            if itemConfig.weaponLicense and easzy.wallet.checks.compatibility[easzy.wallet.config.weaponLicenseSystem] then
                local licenses = {
                    pistol = {},
                    shotgun = {},
                    rifle = {},
                    sniper = {},
                }

                if easzy.wallet.config.weaponLicenseSystem == "Kobralost Advanced Weapon License" then
                    DrawKobralostAdvancedWeaponLicense(owner, itemConfig, licenses)
                elseif easzy.wallet.config.weaponLicenseSystem == "ToBadForYou Firearms License System" then
                    DrawToBadForYouFirearmsLicenseSystem(owner, itemConfig, licenses)
                end
            end
        cam.End2D()
    render.PopRenderTarget()

    -- New VMT
    local newMaterialName = "ezwallet_new_card_material" .. uniqueID
    local newMaterial = CreateMaterial(newMaterialName, "VertexlitGeneric", {
        ["$basetexture"] = nil
    })
    newMaterial:SetTexture("$basetexture", newTexture:GetName())

    -- Replace material
    local subMaterialKey = table.KeyFromValue(entity:GetMaterials(), baseTexture)
    if not subMaterialKey then return end
    entity:SetSubMaterial(subMaterialKey - 1, "!" .. newMaterialName)
end

--PATH addons/gmod_info_board/lua/gmod_info_board/cl/gmib_cl_core.lua:
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
	
	-- BUTTONS
	--
	
	for i=1,5,1 do
		
		if gmib.ads[i] then
			local buttonRemove1 = vgui.Create("DButton")
			buttonRemove1:SetPos(15+ 98*(i-1),35)
			buttonRemove1:SetSize( 80, 40 )
			buttonRemove1:SetText("Remove ad")
			buttonRemove1:SetParent(main)
			function buttonRemove1:onClick()
				print("xd")
				net.Start( "gmib_removeAd" )
				net.WriteInt( i , 32 )
				net.WriteEntity(LocalPlayer())
				net.SendToServer()
				RunString("GAMEMODE:AddNotify(\"Ad removed.\", NOTIFY_ERROR, 4)")
			end
		end
		
		if gmib.ads[5+i] then
			local buttonRemove2 = vgui.Create("DButton")
			buttonRemove2:SetPos(15 + 98*(i-1),35+50)
			buttonRemove2:SetSize( 80 , 40 )
			buttonRemove2:SetText("Remove ad")
			buttonRemove2:SetParent(main)
			function buttonRemove2:onClick()
				net.Start( "gmib_removeAd" )
				net.WriteInt( 5+i , 32 )
				net.WriteEntity(LocalPlayer())
				net.SendToServer()
				RunString("GAMEMODE:AddNotify(\"Ad removed.\", NOTIFY_ERROR, 4)")
			end
		end
		
	end
	--
	-- END OF BUTTONS
	
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
	function buttonSave:OnMousePressed()
		local stngs = {}
		stngs[0] = basePriceWang:GetValue()
		stngs[1] = anonPriceWang:GetValue()
		stngs[2] = time1PriceWang:GetValue()
		stngs[3] = time2PriceWang:GetValue()
		stngs[4] = time3PriceWang:GetValue()
		stngs[5] = time4PriceWang:GetValue()
		stngs[6] = time5PriceWang:GetValue()
		stngs[7] = jobRelatedPriceWang:GetValue()
		
		net.Start( "gmib_saveSettings" )
		net.WriteTable( stngs )
		net.WriteEntity(LocalPlayer())
		net.SendToServer()
		RunString("GAMEMODE:AddNotify(\"Settings saved.\", NOTIFY_UNDO, 4)")		
	end

end
--END of openManager

function gmib.openBoardManager(jobs,boardId,admin)
	local main = vgui.Create( "DFrame" )
	main:setTitle( "Manage board" )
	main:MakePopup()
	main:SetSize( 200, 100 )
	main:SetPos( 0, ScrH() )
	main:CenterHorizontal()
	main:CenterVertical()
	main:addCloseButton()
	main:MoveTo( ScrW() / 2 - 100, ScrH() / 2 - 100, 0.5, 0.25 )
	
	local jobRelatedBox = vgui.Create( "DComboBox", main )
	jobRelatedBox:SetPos( 25, 50)
	jobRelatedBox:SetSize( 150, 20 )
	jobRelatedBox:SetValue( "Who can use board" )
	for i=1,table.Count(jobs),1 do
		jobRelatedBox:AddChoice(jobs[i])
	end
	jobRelatedBox:AddChoice("Everyone")
	jobRelatedBox.OnSelect = function( self, index, value )
		local stngs = {}
		stngs[0] = boardId
		stngs[1] = jobRelatedPriceWang:GetValue()
		
		net.Start( "gmib_saveBoardSettings" )
		net.WriteTable( stngs )
		net.WriteEntity(LocalPlayer())
		net.SendToServer()
	end
end -- END OF openBoardMenu

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

--PATH addons/gmodadminsuite-logging-2.4.8/lua/gmodadminsuite/modules/logging/lang/french.lua:
return {
	Name = "French",
	Flag = "flags16/fr.png",
	Phrases = function() return {

		module_name = "Billy's Logs",

		--####################### UI PHRASES #######################--

		no_data                     = "Aucune donnée",
		add_to_evidence_box         = "Ajouter à la boite à preuves",
		livelogs_show_logs_for      = "Afficher les Logs pour",
		background_color            = "Couleur d'Arrière Plan",
		health_abbrieviated         = "%d PV",
		livelogs                    = "Logs en Direct",
		exit_deep_storage           = "Quitter le Stockage Interne",
		log_formatting              = "Formattage des Logs",
		strings                     = "Variables",
		when                        = "Quand",
		copy_log                    = "Copier Log",
		evidence_box                = "Boite à Preuves",
		livelogs_position_x         = "Position X (pixels)",
		width                       = "Largeur",
		color                       = "Couleur",
		help                        = "Aide",
		live_log_antispam           = "< journal en direct supprimé pour antispam >",
		settings                    = "Paramètres",
		loading_ellipsis            = "Chargement...",
		livelogs_enabled            = "Activer les logs en temps réel",
		armor_abbrieviated          = "%d ARM",
		deep_storage                = "Stockage Interne",
		all_logs                    = "Tous les logs",
		logs                        = "Logs",
		padding                     = "Bordure (pixels)",
		livelogs_position_y         = "Position Y (pixels)",
		livelogs_rows_help          = "Quel est le nombre maximal de logs devant être affichés ?",
		livelogs_rows               = "Rangées (Nombre de Logs)",
		livelogs_color_help         = "Les logs doivent-ils être affichés en couleur ?",
		export_to_clipboard         = "Exporter vers le Presse-Papier",
		players                     = "Joueurs",
		script_page                 = "Page de Script",
		wiki                        = "Wiki",
		module                      = "Module",
		modules                     = "Modules",
		localization                = "Localisation",
		view_deep_storage           = "Afficher Stockage Interne",
		copied                      = "Copié !",
		operator                    = "Opérateur",
		log                         = "Log",
		reset_to_defaults           = "Réinitialiser",
		livelogs_show_logs_for_help = "Combien de secondes les logs doivent-ils être affichés ?\nMettez 0 pour toujours.",
		advanced_search             = "Recherche Avancée",
		quick_search                = "Recherche Rapide",
		quick_search_ellipsis       = "Recherche Rapide...",
		entities                    = "Entitées",
		tutorial                    = "Tutoriel",
		clear_filters               = "Nettoyer Filtre",
		no_results_found            = "Aucun résultat trouvé",
		add_player                  = "+ Ajouter Joueur",
		add_module                  = "+ Ajouter Module",
		add_entity                  = "+ Ajouter Entitée",
		add_string                  = "+ Ajouter Variable",
		modules_search_tooltip      = "Quel(s) module(s) souhaitez-vous inclure ? (laissez blanc pour aucun module)",
		players_search_tooltip      = "Quel(s) joueur(s) cherchez-vous ? (laissez blanc pour n'importe quel joueur)",
		entities_search_tooltip     = "Quelle entitée(s) cherchez-vous ? (SWEPs, SENTs, véhicule, props, classes, etc.)",
		strings_search_tooltip      = "Recherchez-vous un texte spécifique ?",
		class_name_ellipsis         = "Nom de la classe...",
		add_string_popup_title      = "Ajouter Variable",
		add_string_popup_text       = "Entrez le texte que vous essayez de trouver.",
		text_ellipsis               = "Texte...",
		click_to_focus              = "Cliquez pour obtenir le focus",
		right_click_to_focus        = "Clic droit pour obtenir le focus",
		highlight_color             = "Couleur de surlignage",
		weapon_color                = "Couleur d'Armes",
		money_color                 = "Couleur d'Argent",
		vehicle_color               = "Couleur de Véhicules",
		entity_color                = "Couleur d'Entitées",
		health_color                = "Couleur de Santé",
		armor_color                 = "Couleur d'Armure",
		usergroup_color             = "Couleur de Grade",
		unavailable_color           = "Couleur Indisponible/Inconnue",
		learn_more                  = "En savoir plus",
		player_combats              = "Combats de joueurs",
		took_damage                 = "[a pris %d dgts]",
		jump_to_pvp_event           = "Sauter à l'évènement PvP",
		remove                      = "Retirer",
		greedy                      = "Gourmande",
		greedy_tip                  = "Si votre recherche est conséquente, le système tentera de faire correspondre le plus de logs possible. Si elle n'est pas conséquente, il tentera de faire correspondre le moins de logs possible.",
		log_colouring               = "Coloration des Logs",
		done_exclamation            = "Terminé !",
		module_settings             = "Paramètres des Modules",
		storage_settings            = "Paramètres du Stockage",
		third_party_addons          = "Addons Tiers",
		pvp_settings                = "Système de Log PvP",
		live_logs_settings          = "Paramètres de Logs en Direct",
		logging_settings            = "Paramètres de Logs",
		settings                    = "Paramètres",
		enabled_modules             = "Modules Activés",
		permissions                 = "Permissions",
		gamemode_modules            = "Modules de Mode de Jeu",
		saved_exclamation           = "Sauvegardé !",
		save_settings               = "Sauvegarder Paramètres",
		weapon_class                = "Classe d'Arme",
		enter_weapon_class          = "Entrez la classe de l'arme.\nVous ne la connaissez-pas ? Ouvrez votre menu de spawn, cliquez-droit sur une arme et séléctionnez \"Copy to clipboard\"",
		save                        = "Sauvegarder",
		add_new                     = "+ Ajouter Nouveau",
		enabled                     = "Activé",
		website                     = "Site Web",
		name                        = "Nom",
		usergroups                  = "Groupes d'Utilisateurs",
		everyone                    = "Tout le Monde",
		all_modules                 = "Tout les modules",
		all_teams                   = "Toutes les équipes",
		add_usergroup               = "Ajouter Groupe d'Utilisateurs",
		cl_sv_tooltip               = [[cl réprésente le temps nécéssaire à votre ordinateur pour demander les logs, les recevoir, les lire et les afficher
		
		sv réprésente le temps nécéssaire au serveur pour récupérer les logs depuis la mémoire/la base de données, les lires et vous les envoyer

		Les serveurs utilisant MySQL auront une valeur sv supérieur en fonction de la latence entre le serveur MySQL et Garry's Mod]],
		deep_storage_help           = [[Le Stockage Interne est une fonctionnalité de bLogs qui améliore les performances en stockant les logs des sessions serveurs précédentes séparément de la session actuelle.

		Après avoir cliqué sur "Afficher Stockage Interne", vous verrez seulement les logs des sessions serveurs précédentes.
		Vous pouvez voir les logs de la session actuelle en cliquant sur le bouton ci-dessus de nouveau, ou en réouvrant le menu.

		NOTE: Les logs de dégats ne sont pas inclus dans le stockage interne et sont supprimés à chaque redémarrage du serveur pour économiser de l'espace disque]],

		class_type_other = "Autres",
		class_type_player = "Joueur",
		class_type_team = "Equipe",
		class_type_weapon = "Arme",
		class_type_vehicle = "Véhicule",
		class_type_usergroup = "Groupe d'Utilisateur",
		class_type_prop = "Prop",
		class_type_ragdoll = "Ragdoll",
		class_type_country = "Pays",
		class_type_ammo = "Munition",
		class_type_role = "Rôle",
		class_selector = "Sélecteur de classe",
		custom_class = "Classe Personnalisée",
		class_type = "Type de Classe",
		value = "Valeur",
		search = "Rechercher",
		check_all = "Tout Cocher",
		uncheck_all = "Tout Décocher",
		general = "Général",
		class_search_title = "Recherche de classe",
		class_search_text = "Entrez le nom ou une partie du nom de la classe que vous cherchez (insensibles aux majuscules/minuscules)",
		view_logs = "Voir Logs",
		open_menu = "Ouvrir Menu",
		licensed_to = "License accordée à %s",

		--####################### SETTINGS #######################--

		Player_RecordTeam = "Afficher l'équipe du joueur dans les logs",
		Player_RecordUsergroup = "Afficher le grade du joueur dans les logs",
		Player_RecordHealth = "Afficher la santé du joueur dans les logs",
		Player_RecordArmor = "Afficher l'armure du joueur dans les logs",
		Player_RecordWeapon = "Afficher l'arme du joueur dans les logs",
		Player_RecordWeapon_DoNotRecord = "Filtre d'arme du joueur",
		Player_RecordWeapon_DoNotRecord_help = "Si vous souhaitez afficher les armes des joueurs dans les logs, utilisez cette option pour filtrer les armes non-désirées (comme le physgun, toolgun, etc.)",

		OverrideMoneyFormat = "Outrepasser le formatage de l'argent par défaut",
		OverrideMoneyFormat_help = "Lorsque désactivé, le formattage de l'argent du mode de jeu sera utilisé.\nLorsque activé, vous pouvez utiliser l'option ci-dessous pour créer votre propre formattage de l'argent.",
		MoneyFormat = "Formattage de l'Argent",
		MoneyFormat_help = "Entrez la façon dont vous souhaitez que l'argent apparaisse et insérez \"%s\" (sans guillemts) à l'endroit ou vous souhaitez voir l'argent affiché.",

		MaxSessionLogs = "Logs de session max",
		MaxSessionLogs_help = "Combien de logs de la session actuelle peuvent être affichées avant de déplacer toutes les logs dans le stockage interne ? (économies de performances)\nDéfinissez sur 0 pour infini ((Déconseillée)).",

		DeepStorageTooOld = "Age max des logs du stockage interne",
		DeepStorageTooOld_help = "Combien de jours souhaitez-vous conserver les logs dans le stockage interne avant de les supprimer? (économise l'espace disque)\nDéfinissez sur 0 pour ne jamais supprimer les logs dans le stockage interne (Déconseillée).",

		LiveLogsEnabled = "Logs en Direct Activées",
		LiveLogsEnabled_help = "Les logs en direct peuvent nuire aux performances sur les gros serveurs; vous pouvez complètement désactiver cette fonctionnalité ici.",
		LiveLogsIn10Seconds = "Logs en Direct max en 10 secondes",
		LiveLogsIn10Seconds_help = "Combien de logs en direct peuvent être envoyées avant que les logs supplémentaires ne soient supprimées par l'antispam ?",
		NotifyLiveLogsAntispam = "Notifier Antispam",
		NotifyLiveLogsAntispam_help = "Les utilisateurs doivent-ils être notifiés qu'un log en direct à été supprimée par l'antispam ?",

		TimeBetweenPvPEvents = "Temps entre les évènements PvP",
		TimeBetweenPvPEvents_help = "Quant un joueur commence à se battre, il crée un \"Evènement PvP\", quand aucun combat supplémentaire n'a eu lieu dans un certain nombre de secondes, l'évènement PvP est défini comme terminé et est envoyé aux logs. Combien de secondes bLogs doit attendre avant de faire cela ?",
		NonPvPWeapons = "Filtre des Armes PvP",
		NonPvPWeapons_help = "Quelles armes ne doivent pas être considérées comme des armes PvP ?",

		server_restart_required = "NOTE: Les modification effectuées ici ne prendront effets qu'après un redémarrage du serveur.",

		gamemode_modules_tip = [[bLogs supporte un grand nombre de modes de jeu.
		Cependant, il peut arriver que bLogs ait des problèmes à détecter le mode de jeu utilisé sur votre serveur.
		Sur cet écran, vous pouvez forcer bLogs à détecter un certain mode de jeu.

		Décoché = Comportement par défaut
		Coché = Activation Forcée
		Coché avec une croix = Désactivé

		Veuillez noter que certains modes de jeu sont des dérivation du Sandbox, cela signifie qu'ils utilisent certaines fonctionnalitées du Sandbox.
		Pour les modes de jeu comme DarkRP qui dérivent du Sandbox, il est recommandé de laisser Sandbox comme mode jeu par défaut.]],

		third_party_addons_tip = [[[bLogs supporte un grand nombre d'addons tiers'.
		Cependant, il peut arriver que bLogs ait des problèmes à détecter certains addons tiers installés.
		Sur cet écran, vous pouvez forcer bLogs à détecter certains addons tiers.

		Décoché = Comportement par défaut
		Coché = Activation Forcée
		Coché avec une croix = Désactivé]],

		edit_discord_webhooks = "Modifier les Webhooks Discord",
		webhook_name = "Nom du Webhook",
		webhook_name_tip = "Entrez le nom de votre webhook.\nIl ne sagit que d'un identifiant pour le webhook, vous entrerez l'URL dans la prochaine page.",
		webhook = "Webhook",
		webhook_url = "URL Webhook",
		webhook_url_tip = "Copier l'URL webhook de votre serveur discord et collez-la ici.",
		copy_webhook = "Copier Webhook",

		can_access_module = "Peu accéder au Module",
		can_access_all_modules = "Peu accéder à tous les modules",
		all_usergroups = "Tous les Grades",
		all_jobs_in_category = "Tous les métiers dans la catégorie",
		all_teams_in_category = "Toutes les équipes dans la catégorie",
		teams = "Equipes",
		permissions_tip = "Décoché = Hérité de \"%s\"\nCoché = Autorisé à utiliser le module\nCoché avec une croix = Interdit d'utiliser le module",
		all_modules_tip = "Les permissions sont héritées de cette section sauf en cas de substitution.",

		wipes_and_resets = "Nettoyage & Réinitialisations", -- wipes as in data wipes
		disable_buttons = "Désactiver les Boutons",
		enable_buttons = "Activer les Boutons",
		wipe_deepstorage = "Nettoyer le Stockage Interne",
		wipe_session = "Nettoyer les logs de Session",
		wipe_all_logs = "Nettoyer toutes les logs",
		reset_config = "Réinitialiser configuration",

		--####################### LOG PHRASES #######################--
		Logs = {
			round_start     = "DEBUT DE MANCHE",
			round_preparing = "PREPARATION DE MANCHE",
			round_end       = "FIN DE MANCHE",

			connected                                     = "{1} se connecte",
			connected_from_country                        = "{1} se connecte depuis {2}",
			finished_connecting                           = "{1} a fini de se connecter",
			respawned                                     = "{1} réapparu",
			disconnected                                  = "{1} déconnecté ({2})",
			picked_up_weapon                              = "{1} a ramassé une arme {2}",
			picked_up_item                                = "{1} a ramassé un item {2}",
			prop_killed_self                              = "{1} s'est suicidé avec son prop {2}",
			prop_killed_other                             = "{1} a été tué par un prop posé par {2} ({3})",
			prop_killed_world                             = "{1} a été tué par un prop de map {2}",
			prop_damaged_self                             = "{1} s'est infligé {2} de dégats avec son prop {3}",
			prop_damaged_other                            = "{1} a reçu des dégats d'un prop créer par {2} pour {3} dégats ({4})",
			prop_damaged_world                            = "{1} a reçu des dégats par un prop de map {2} pour {3} dégats",
			toolgun_used_their_ent                        = "{1} a utilisé l'outils {2} sur {3}",
			toolgun_used_other_ent                        = "{1} a utilisé l'outils {2} sur {3} créer par {4}",
			toolgun_used_world_ent                        = "{1} a utilisé l'outils {2} sur {3}",
			spawned_effect                                = "{1} a fait apparaitre un effet {2}",
			spawned_npc                                   = "{1} a fait apparaitre un NPC {2}",
			spawned_prop                                  = "{1} a fait apparaitre un prop {2}",
			spawned_ragdoll                               = "{1} a fait apparaitre un ragdoll {2}",
			spawned_sent                                  = "{1} a fait apparaitre un SENT {2}",
			spawned_swep                                  = "{1} a fait apparaitre un SWEP {2}",
			spawned_vehicle                               = "{1} a fait apparaitre un véhicule {2}",

			murder_loot                                   = "{1} a ramassé du butin",

			cinema_video_queued                           = "[{1}] {2} fait la queue [{3}] \"{4}\" {5}",

			ttt_win_traitor                               = "Les Traites ont gagné !",
			ttt_win_innocent                              = "Les Innocents ont gagné !",
			ttt_win_timelimit                             = "Innocents ont gagné - Limite de temps atteinte !",
			ttt_bought                                    = "{1} a acheté {2}",
			ttt_karma                                     = "{1} a été ÉJECTÉ pour faible karma",
			ttt_foundbody                                 = "{1} a trouvé le corps de {2}",
			ttt_founddna                                  = "{1} a trouvé l'ADN de {2} sur son {3}",
			ttt_founddna_corpse                           = "{1} a trouvé l'ADN de {2} sur son cadavre",

			darkrp_agenda_updated                         = "{1} a mis à jour l'agenda {2} pour: {3}",
			darkrp_agenda_removed                         = "{1} a supprimé le {2}",
			darkrp_arrest                                 = "{1} a arrêté {2}",
			darkrp_unarrest                               = "{1} a relaché {2}",
			darkrp_batteringram_owned_success             = "{1} a enfoncé le {2} de {3}",
			darkrp_batteringram_owned_door_success        = "{1} a enfoncé la porte de {2}",
			darkrp_batteringram_success                   = "{1} a enfoncé une {2} sans propriétaire",
			darkrp_batteringram_door_success              = "{1} a enfoncé une porte sans propriétaire",
			darkrp_batteringram_owned_failed              = "{1} n'a pas réussi à enfoncer le {2} de {3}",
			darkrp_batteringram_owned_door_failed         = "{1} n'a pas réussi à enfoncer la porte de {2}",
			darkrp_batteringram_failed                    = "{1} n'a pas réussi à enfoncer la {2} sans propriétaire",
			darkrp_batteringram_door_failed               = "{1} n'a pas réussi à enfoncer une porte sans propriétaire",
			darkrp_cheque_dropped                         = "{1} a posé un chèque de {2} pour {3}",
			darkrp_cheque_picked_up                       = "{1} a empoché un chèque de {2} fait par {3}",
			darkrp_cheque_tore_up                         = "{1} a dériché un chèque de {2} destiné à {3}",
			darkrp_demoted                                = "{1} a rétrogradé {2} pour {3}",
			darkrp_demoted_afk                            = "{1} a été rétrogradé pour avoir été AFK",
			darkrp_door_sold                              = "{1} a vendu une porte",
			darkrp_door_bought                            = "{1} a acheté une porte",
			darkrp_money_dropped                          = "{1} a posé {2}",
			darkrp_money_picked_up                        = "{1} a ramassé {2}",
			darkrp_money_picked_up_owned                  = "{1} a ramassé {2} posé par {3}",
			darkrp_job_changed                            = "{1} a changé de {2} pour {3}",
			darkrp_law_added                              = "{1} a ajouté la loi: {2}",
			darkrp_law_removed                            = "{1} a supprimé la loi: {2}",
			darkrp_purchase                               = "{1} a acheté {2} pour {3}",
			darkrp_purchase_ammo                          = "{1} a acheté {2} munitionjs pour {3}",
			darkrp_purchase_shipment                      = "{1} a acheté une caisse de x{2} {3} pour {4}",
			darkrp_purchase_food                          = "{1} a acheté {2} pour {3}",
			darkrp_weapons_checked                        = "{1} a vérifié l'arme de {2}",
			darkrp_weapons_confiscated                    = "{1} a confisqué les armes de {2}",
			darkrp_weapons_returned                       = "{1} a rendu les armes confisquées de {2}",
			darkrp_filed_warant                           = "{1} a déposé un mandat sur {2} pour: {3}",
			darkrp_warrant_cancelled                      = "{1} a annulé un mandat sur {2}",
			darkrp_set_wanted                             = "{1} recherche {2} pour {3}",
			darkrp_cancelled_wanted                       = "{1} a annulé l'avis de recherche de {2}",
			darkrp_starved                                = "{1} est mort affamé",
			darkrp_pocket_added                           = "{1} a mit {2} dans son sac",
			darkrp_pocket_dropped                         = "{1} a posé {2} depuis son sac",
			darkrp_rpname_change                          = "{1} a changé de nom rp de {2} pour {3}",
			darkrp_started_lockpick_owned_entity          = "{1} a commencé à crocheter {2} possédé par {3}",
			darkrp_started_lockpick_unowned_entity        = "{1} a commencé à crocheter une {2} sans propriétaire",
			darkrp_started_lockpick_owned_door            = "{1} a commencé à crocheter une porte appartenant à {2}",
			darkrp_started_lockpick_unowned_door          = "{1} a commencé à crocheter une porte sans propriétaire",
			darkrp_started_lockpick_own_entity            = "{1} a commencé à crocheter son {2}",
			darkrp_started_lockpick_own_door              = "{1} a commencé à crocheter l'une de ses portes",
			darkrp_successfully_lockpicked_owned_entity   = "{1} a crocheté {2} possédé par {3}",
			darkrp_successfully_lockpicked_unowned_entity = "{1} a crocheté une {2} sans propriétaire",
			darkrp_successfully_lockpicked_owned_door     = "{1} a crocheté une porte appartenant à {2}",
			darkrp_successfully_lockpicked_unowned_door   = "{1} a crocheté une porte sans propriétaire",
			darkrp_successfully_lockpicked_own_entity     = "{1} a crocheté sa {2}",
			darkrp_successfully_lockpicked_own_door       = "{1} a crocheté l'une de ses portes",
			darkrp_failed_lockpick_owned_entity           = "{1} n'a pas réussi à crocheter une {2} possédé par {3}",
			darkrp_failed_lockpick_unowned_entity         = "{1} n'a pas réussi à crocheter une {2} sans propriétaire",
			darkrp_failed_lockpick_owned_door             = "{1} n'a pas réussi à crocheter une porte possédé par {2}",
			darkrp_failed_lockpick_unowned_door           = "{1} n'a pas réussi à crocheter une porte sans propriétaire",
			darkrp_failed_lockpick_own_entity             = "{1} n'a pas réussi à crocheter sa {2}",
			darkrp_failed_lockpick_own_door               = "{1} n'a pas réussi à crocheter l'une de ses portes",
			darkrp_changed_job                            = "{1} a changé de métier de {2} pour {3}",
			darkrp_added_law                              = "{1} a ajouté la loi: {2}",
			darkrp_removed_law                            = "{1} a supprimé la loi: {2}",
			darkrp_hit_accepted                           = "{1} a accepté un contrat sur {2} donné par {3}",
			darkrp_hit_completed                          = "{1} a completé un contrat sur {2} ayant été donné par {3}",
			darkrp_hit_failed                             = "{1} a échoué sur un contrat contre {2} parce que {3}",
			darkrp_hit_requested                          = "{1} a donné un contrat sur {2} pendant {3} pour {4}",
			darkrp_sold_door                              = "{1} a vendu une porte",
			darkrp_bought_door                            = "{1} a acheté une porte",
			darkrp_dropped_money                          = "{1} a posé {2}",
			darkrp_picked_up_money                        = "{1} a ramassé {2}",
			darkrp_picked_up_money_dropped_by             = "{1} a ramssé {2} ayant été posé(e) par {3}",
			darkrp_afk_demoted                            = "{1} a été rétrogradé pour avoir été AFK",

			pvp_instigator_killed_noweapon                = "{1} {2} a fini un combat et à TUÉ {3} {4} après {5}", -- after X seconds/minutes/hours
			pvp_instigator_killed_weapon                  = "{1} {2} a fini un combat en utilisant {3} et à TUÉ {4} {5} après {6}",
			pvp_instigator_killed_weapons                 = "{1} {2} a fini un combat en utilisant plusieurs armes et à TUÉ {3} {4} après {5}",
			pvp_victim_killed_noweapon                    = "{1} {2} a fini un combat et à ÉTÉ TUÉ PAR {3} {4} après {5}",
			pvp_victim_killed_weapon                      = "{1} {2} a fini un combat en utilisant {3} et A ÉTÉ TUÉ PAR {4} {5} après {6}",
			pvp_victim_killed_weapons                     = "{1} {2} a fini un combat en utilisant plusieurs armes et A ÉTÉ TUÉ PAR {3} {4} après {5}",
			pvp_combat_noweapon                           = "{1} {2} finished combat with {3} {4} après {5}",
			pvp_combat_weapon                             = "{1} {2} a fini un combat en utilisant {3} avec {4} {5} après {6}",
			pvp_combat_weapons                            = "{1} {2} a fini un combat en utilisant plusieurs armes avec {3} {4} après {5}",
			pvp_log_noweapon                              = "{1} a touché {2} infligeant {3} dégats",
			pvp_log_weapon                                = "{1} a touché {2} infligeant {3} dégats avec un(e) {4}",
			pvp_killed                                    = "{1} a tué {2}",
			pvp_vehicle_owned_killed                      = "{1} a été touché et tué par un(e) {2} sans conducteur et appartenant à {3}",
			pvp_vehicle_owned_damaged                     = "{1} a été touché, recevant {2} dégats par {3} sans conducteur, et appartenant à {4}",
			pvp_vehicle_killed                            = "{1} a été touché et tué par un(e) {2} sans conducteur et sans propriétaire",
			pvp_vehicle_damaged                           = "{1} a été touché, recevant {2} dégats par {3} sans conducteur et sans propriétaire",
			pvp_killed_self                               = "{1} s'est suicidé",
			pvp_damaged_self                              = "{1} s'est infligé {2} dégats",

			changed_team                                  = "{1} a changé d'équipe de {2} pour {3}",
			command_used                                  = "{1}: {2}",
			warned_reason                                 = "{1} a été averti par {2} pour {3}",
			warned_noreason                               = "{1} a été averti par {2}",
			warned_kicked                                 = "{1} a été ÉJECTÉ pour avoir dépassé le seuil maximal d'avertissements",
			warned_banned                                 = "{1} a été BANNI pour avoir dépassé le seuil maximal d'avertissements",
			handcuffed                                    = "{1} a menotté {2}",
			handcuffs_broken_by                           = "{1} a libéré {2} de ses menottes",
			handcuffs_broken                              = "{1} s'est libéré de ses menottes",
			npc_health_bought                             = "{1} a acheté de la santé à un PNJ pour {2}",
			npc_armor_bought                              = "{1} a acheté de l'armure à un PNJ pour {2}",
			pac_outfit                                    = "{1} a changé pour une tenue PAC {2}",
			party_chat                                    = "{1} ({2}): {3}",
			party_created                                 = "{1} a créer une partie {2}",
			party_join                                    = "{1} a rejoint une partie {2}",
			party_join_request                            = "{1} a demandé à rejoindre une partie {2}",
			party_invite                                  = "{1} a invité {2} sur la partie {3}",
			party_leave                                   = "{1} a quitté la partie {2}",
			party_kick                                    = "{1} a ejecté {2} de la partie {3}",
			party_disbanded                               = "{1} a supprimé la partie {2}",
			party_abandoned                               = "{1} a quitté le serveur et a abandonné sa partie {2}",
			spraymesh                                     = "{1} a utilisé son spray {2}",
			starwarsvehicle_damage_owned_weapon           = "{1} a infligé des dégats sur Star Wars vehicle {2} possédé par {3} pour {4} dégats avec {5}",
			starwarsvehicle_damage_owned                  = "{1} a infligé des dégats sur Star Wars vehicle {2} possédé par {3} pour {4} dégats",
			starwarsvehicle_damage_weapon                 = "{1} a infligé des dégats sur Star Wars vehicle {2} pour {3} dégats avec {4}",
			starwarsvehicle_damage                        = "{1} a infligé des dégats sur Star Wars vehicle {2} pour {3} dégats",
			wac_damage_owned_weapon                       = "{1} a infligé des dégats sur WAC aircraft {2} possédé par {3} pour {4} dégats avec {5}",
			wac_damage_owned                              = "{1} a infligé des dégats sur WAC aircraft {2} possédé par {3} pour {4} dégats",
			wac_damage_weapon                             = "{1} a infligé des dégats sur WAC aircraft {2} pour {3} dégats avec {4}",
			wac_damage                                    = "{1} a infligé des dégats sur WAC aircraft {2} pour {3} dégats",
			wyozi_cinema_queued                           = "{1} a demandé la vidéo {2} ➞ {3} au cinéma {4}",
			wyozi_dj_queued                               = "{1} a ajouté en file d'attente {2} ➞ {3} sur le canal {4}",
			wyozi_dj_channel_rename                       = "{1} a renommé le canal en {2}",
		}

} end }
--PATH lua/gmodadminsuite/sh_afk.lua:
GAS.AFK = {}
GAS.AFK.AFKTime = GAS.Config.AFKTime

if (SERVER) then

	GAS_AFK_PlayerPositions = GAS_AFK_PlayerPositions or {}
	GAS_AFK_PlayerLastMoved = GAS_AFK_PlayerLastMoved or {}

	function GAS.AFK:SetAFK(ply, is_afk, pos_signature)
		if (is_afk) then
			if (not ply.GAS_PlayerAFK) then
				ply.GAS_PlayerAFK = true
				ply:SetNWBool("GAS_PlayerAFK", true)
				hook.Run("GAS:AFK", ply)
			end
		else
			GAS_AFK_PlayerLastMoved[ply] = os.time()
			GAS_AFK_PlayerPositions[ply] = pos_signature
			if (ply.GAS_PlayerAFK) then
				ply.GAS_PlayerAFK = false
				ply:SetNWBool("GAS_PlayerAFK", false)
				hook.Run("GAS:UnAFK", ply)
			end
		end
	end

	GAS:timer("afk:update_player_positions", 5, 0, function()
		for _,ply in ipairs(player.GetHumans()) do
			local pos = ply:GetPos()
			local pos_signature = math.Round(pos.x) + math.Round(pos.y) + math.Round(pos.z)
			if (GAS_AFK_PlayerLastMoved[ply]) then
				if (pos_signature ~= GAS_AFK_PlayerPositions[ply]) then
					GAS.AFK:SetAFK(ply, false, pos_signature)
				elseif (os.time() - GAS_AFK_PlayerLastMoved[ply] >= GAS.AFK.AFKTime) then
					GAS.AFK:SetAFK(ply, true)
				end
			end
		end
	end)

	GAS:hook("PlayerInitialSpawn", "afk:PlayerInitialSpawn", function(ply)
		if (ply:IsBot()) then return end
		ply.GAS_PlayerAFK = true

		ply:SetNWBool("GAS_PlayerAFK", true)
	end)

	GAS:hook("PlayerDisconnected", "afk:GC", function(ply)
		GAS_AFK_PlayerLastMoved[ply] = nil
		GAS_AFK_PlayerPositions[ply] = nil
	end)

	GAS:netInit("afk:InitPostEntity")
	GAS:netReceive("afk:InitPostEntity", function(ply)
		local pos = ply:GetPos()
		local pos_signature = math.Round(pos.x) + math.Round(pos.y) + math.Round(pos.z)
		GAS_AFK_PlayerLastMoved[ply] = os.time()
		GAS_AFK_PlayerPositions[ply] = pos_signature
	end)

else

	GAS:InitPostEntity(function()
		GAS:netStart("afk:InitPostEntity")
		net.SendToServer()
	end)

end

function GAS.AFK:IsAFK(ply)
	return ply.GAS_PlayerAFK or ply:GetNWBool("GAS_PlayerAFK", true)
end
--PATH lua/gmodadminsuite/modules/fpsbooster/_gas_info.lua:
return {
	Name = "FPS Booster",
	Category = GAS.MODULE_CATEGORY_UTILITIES,
	Hidden = true,
	Wiki = "https://gmodsto.re/gmodadminsuite-fpsbooster-wiki",
	Icon = "icon16/lightning.png",
	Public = true
}
--PATH addons/gprotect_1.15.101/lua/autorun/gprotect_loader.lua:
if slib and slib.loadFolder then slib.loadFolder("g_protect/", true, {{"g_protect/", "sh_gprotect_config.lua"}, {"g_protect/", "sv_mysql_config.lua"}, {"g_protect/", "sh_gprotect_baseconfig.lua"}, {"g_protect/", "sh_util.lua"}, {"g_protect/server/", "sv_gprotect.lua"}, {"g_protect/", "sh_gprotect.lua"}}, {{"g_protect/client/", "cl_blockedmodels.lua"}, {"g_protect/client/", "cl_buddies.lua"}}) end
hook.Add("slib:loadedUtils", "eP:Init_gProtect", function() slib.loadFolder("g_protect/", true, {{"g_protect/", "sh_gprotect_config.lua"}, {"g_protect/", "sv_mysql_config.lua"}, {"g_protect/", "sh_gprotect_baseconfig.lua"}, {"g_protect/", "sh_util.lua"}, {"g_protect/server/", "sv_gprotect.lua"}, {"g_protect/", "sh_gprotect.lua"}}, {{"g_protect/client/", "cl_blockedmodels.lua"}, {"g_protect/client/", "cl_buddies.lua"}}) end)
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
--PATH addons/employer_npc/lua/employer_npc/sh_core.lua:
ENPC.JobsUsed = ENPC.JobsUsed or {}

local meta = FindMetaTable("Player")

function meta:IsIgnoreRules(type)
	return ENPC.Ranks[self:GetUserGroup()] and ENPC.CanBypass[type] or false
end

function meta:GetUnlockedJobs()
	return self.unlocked_jobs
end

function meta:IsUnlocked(job)
	return self.unlocked_jobs[job] or false
end

function ENPC:Translate(str)
	return ENPC.Langs[ENPC.Lang][str]
end

function ENPC:FindJobByName(name)
	for k,v in pairs(RPExtraTeams) do
		if v.name ~= name then continue end

		return v
	end
	return false
end

function ENPC:IsOpenedJob(ply, job)
	local job_to_save = ENPC.StoreJobsBy == "command" and job.command or job.name
	if job.jobcost and not ply:IsUnlocked(job_to_save) then return false end
	return true
end

function ENPC:IsJobNotRequired(ply, job)
	if job.requiredjob and
		not ply:IsIgnoreRules("jobcost") and
		ENPC:FindJobByName(job.requiredjob) and
		not ENPC:IsOpenedJob(ply, ENPC:FindJobByName(job.requiredjob)) then

		return false, ENPC:Translate("Need to buy").." \""..job.requiredjob.."\""
	end

	return true
end

function ENPC:InWhitelist(whitelist, name)
	return whitelist[name] and true or false
end

function ENPC:TimeFormat(time)
	local tmp = time

	local s = tmp % 60
	tmp = math.floor( tmp / 60 )
	local m = tmp % 60
	tmp = math.floor( tmp / 60 )
	local h = tmp

	return string.format( "%02i:%02i:%02i", h, m, s )
end

function ENPC:IsAvailableJob(ply, job)

	if job.customCheck and
		not ply:IsIgnoreRules("customcheck") and
		not job.customCheck(ply) then

		return false, ENPC:Translate("Unavailable")
	end

	if SH_WHITELIST and not SH_WHITELIST:CanBecomeJob(ply, job.team) then
		return false, ENPC:Translate("Unavailable")
	end

	if job.max and job.max ~= 0 and
		not ply:IsIgnoreRules("countlimit") and
		team.NumPlayers(job.team) >= job.max then

		return false, ENPC:Translate("Limit reached")
	end

	return true
end

function ENPC:IsBoughtJob(ply, job)
	local job_to_save = ENPC.StoreJobsBy == "command" and job.command or job.name
	if job.jobcost and
		not ply:IsIgnoreRules("jobcost") and
		not ply:IsUnlocked(job_to_save) then

		return false, ENPC:Translate("Job Cost")
	end
	return true
end

function ENPC:IsBlockedBy(ply, job)
	local str = ""
	local time = false
	local level = false
	local total_time = ply.GetUTimeTotalTime and ply:GetUTimeTotalTime() or 0

	if job.playtime and not ply:IsIgnoreRules("utime") and job.playtime > total_time then
		str = string.format("%s%s: %s ", str, ENPC:Translate("Time"), ENPC:TimeFormat(job.playtime-total_time))
		time = true
	end

	local total_level = RLS and ply:GetLevel() or 0
	if job.level and not ply:IsIgnoreRules("level") and job.level > total_level then
		str = string.format("%s%s: %s", str, ENPC:Translate("Lvl"), job.level)
		level = true
	end

	if str == "" then
		return false, false, false
	else
		return str, time, level
	end
end

--PATH addons/employer_npc/lua/employer_npc/cl_core.lua:
surface.CreateFont("ENPC.Font21", { font = "Roboto", size = 21, weight = 500, extended = true })
surface.CreateFont("ENPC.Font18", { font = "Roboto", size = 18, weight = 300, extended = true })
surface.CreateFont("ENPC.Font16", { font = "Roboto", size = 16, weight = 300, extended = true })

local close_mat    = Material("job_employ/close.png", "noclamp smooth")
local settings_mat = Material("job_employ/settings.png", "noclamp smooth")
local clock_mat    = Material("job_employ/clock.png", "noclamp smooth")
local star_mat     = Material("job_employ/star.png", "noclamp smooth")
local lock_mat     = Material("job_employ/lock.png", "noclamp smooth")
local money_mat    = Material("job_employ/money.png", "noclamp smooth")

local function GetIconsTable(job)
	local tbl = {}

	if not ENPC:IsAvailableJob(LocalPlayer(), job) then
		table.insert(tbl, lock_mat)
	end

	local str, time, lvl = ENPC:IsBlockedBy(LocalPlayer(), job)
	local bought = ENPC:IsBoughtJob(LocalPlayer(), job)

	if time then table.insert(tbl, clock_mat) end
	if lvl then	table.insert(tbl, star_mat) end
	if not bought then table.insert(tbl, money_mat) end

	return tbl
end

function Derma_StringRequestCustom(whitelist, fnEnter, fnCancel)

	local Window = vgui.Create( "DFrame" )
	Window:SetTitle( ENPC:Translate("Add Job") )
	Window:SetDraggable( false )
	Window:ShowCloseButton( false )
	Window:SetBackgroundBlur( true )
	Window:SetDrawOnTop( true )
	Window.Paint = function(slf, w, h)
		draw.RoundedBox(0, 0, 0, w, h, ENPC.Colors.header)
	end

	local InnerPanel = vgui.Create( "DPanel", Window )
	InnerPanel:SetPaintBackground( false )

	local NameLabel = vgui.Create("DLabel", InnerPanel)
	NameLabel:SetText(ENPC:Translate("Select Job")..":")
	NameLabel:SetPos(10, 10)
	NameLabel:SizeToContents()

	local DComboBox = vgui.Create( "DComboBox", InnerPanel )
	DComboBox:SetPos( 65, 7 )
	DComboBox:SetSize( 100, 20 )
	DComboBox:SetValue( ENPC:Translate("Jobs") )
	for k,v in pairs(RPExtraTeams) do
		if whitelist[v.name] then continue end
		DComboBox:AddChoice( v.name )
	end

	local ButtonPanel = vgui.Create( "DPanel", Window )
	ButtonPanel:SetTall( 30 )
	ButtonPanel:SetPaintBackground( false )

	local Button = vgui.Create( "DButton", ButtonPanel )
	Button:SetText( ENPC:Translate("OK") )
	Button:SizeToContents()
	Button:SetTall( 20 )
	Button:SetWide( Button:GetWide() + 20 )
	Button:SetPos( 5, 5 )
	Button.DoClick = function() Window:Close() fnEnter( DComboBox:GetValue() ) end

	local ButtonCancel = vgui.Create( "DButton", ButtonPanel )
	ButtonCancel:SetText( ENPC:Translate("Cancel") )
	ButtonCancel:SizeToContents()
	ButtonCancel:SetTall( 20 )
	ButtonCancel:SetWide( Button:GetWide() + 20 )
	ButtonCancel:SetPos( 5, 5 )
	ButtonCancel.DoClick = function() Window:Close() if ( fnCancel ) then fnCancel( DComboBox:GetValue() ) end end
	ButtonCancel:MoveRightOf( Button, 5 )

	ButtonPanel:SetWide( Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 )

	local w, h = 135, 20

	Window:SetSize( w + 50, h + 25 + 75 + 10 )
	Window:Center()

	InnerPanel:StretchToParent( 5, 25, 5, 45 )

	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom( 8 )

	Window:MakePopup()

	return Window
end

local base_menu
local base

function ENPC:OpenSettingsMenu(ent, whitelist)
	if IsValid(base) then base:Remove() end
	if IsValid(base_menu) then base_menu:Remove() end

	base = vgui.Create("DFrame")
	base:SetSize(600, 625)
	base:Center()
	base:MakePopup()
	base:SetTitle(self:Translate("Settings"))
	base.Paint = function(slf, w, h)
		self:DrawBlurredPanel(slf)
		draw.RoundedBox(0, 0, 0, w, h, self.Colors.header)
	end

	base["ScrollPanel"] = vgui.Create("DScrollPanel", base)
	base["ScrollPanel"]:SetSize(base:GetWide(), base:GetTall()-25)
	base["ScrollPanel"]:SetPos(0, 25)
	base["ScrollPanel"].Paint = function(slf, w, h)
	end

	base["NameLabel"] = vgui.Create("DLabel", base["ScrollPanel"])
	base["NameLabel"]:SetText(self:Translate("Name of NPC"))
	base["NameLabel"]:SetPos(10, 20)
	base["NameLabel"]:SizeToContents()

	base["NameEntry"] = vgui.Create( "DTextEntry", base["ScrollPanel"] )
	base["NameEntry"]:SetPos( 75, 15 )
	base["NameEntry"]:SetSize( base:GetWide() -95, 25 )
	base["NameEntry"]:SetText( ent:GetCustomName() )

	base["ModelLabel"] = vgui.Create("DLabel", base["ScrollPanel"])
	base["ModelLabel"]:SetText(self:Translate("Model path"))
	base["ModelLabel"]:SetPos(10, 50)
	base["ModelLabel"]:SizeToContents()

	base["ModelEntry"] = vgui.Create( "DTextEntry", base["ScrollPanel"] )
	base["ModelEntry"]:SetPos( 75, 45 )
	base["ModelEntry"]:SetSize( base:GetWide() -95, 25 )
	base["ModelEntry"]:SetText( ent:GetModel() )

	base["NameLabel"] = vgui.Create("DLabel", base["ScrollPanel"])
	base["NameLabel"]:SetText(self:Translate("Jobs List")..":")
	base["NameLabel"]:SetPos(10, 75)
	base["NameLabel"]:SetFont("DermaLarge")
	base["NameLabel"]:SizeToContents()

	base["AvailableJob"] = vgui.Create("DListView", base["ScrollPanel"])
	base["AvailableJob"]:SetPos(5, 125)
	base["AvailableJob"]:SetSize(280, 420)
	base["AvailableJob"]:AddColumn(self:Translate("Available"))

	base["SelectedJob"] = vgui.Create("DListView", base["ScrollPanel"])
	base["SelectedJob"]:SetPos(315, 125)
	base["SelectedJob"]:SetSize(280, 420)
	base["SelectedJob"]:AddColumn(self:Translate("Selected"))

	for k,v in pairs(RPExtraTeams) do
		if self:InWhitelist(whitelist, v.name) then continue end
		base["AvailableJob"]:AddLine(v.name)
	end

	for k,v in pairs(whitelist) do
		base["SelectedJob"]:AddLine(k)
	end

	AddPriv = vgui.Create("DButton", base["ScrollPanel"])
	AddPriv:SetPos(287, 125)
	AddPriv:SetSize(25, 25)
	AddPriv:SetText(">")
	AddPriv.DoClick = function()
		for k,v in pairs(base["AvailableJob"]:GetSelected()) do
			local priv = v.Columns[1]:GetValue()
			base["SelectedJob"]:AddLine(priv)
			base["AvailableJob"]:RemoveLine(v.m_iID)
		end
	end

	RemPriv = vgui.Create("DButton", base["ScrollPanel"])
	RemPriv:SetPos(287, 155)
	RemPriv:SetSize(25, 25)
	RemPriv:SetText("<")
	RemPriv.DoClick = function()
		for k,v in pairs(base["SelectedJob"]:GetSelected()) do
			local priv = v.Columns[1]:GetValue()
			base["AvailableJob"]:AddLine(priv)
			base["SelectedJob"]:RemoveLine(v.m_iID)
		end
	end

	base["BtnSaveSettings"] = vgui.Create("DButton", base)
	base["BtnSaveSettings"]:SetPos(0,base:GetTall()-50)
	base["BtnSaveSettings"]:SetSize(base:GetWide(),50)
	base["BtnSaveSettings"]:SetText(self:Translate("Save"))
	base["BtnSaveSettings"]:SetFont("DermaLarge")
	base["BtnSaveSettings"]:SetTextColor(Color(255,255,255))
	base["BtnSaveSettings"].DoClick = function()
		local info = {
			name = base["NameEntry"]:GetValue(),
			model = base["ModelEntry"]:GetValue(),
		}
		info.whitelist = {}
		for k,v in pairs(base["SelectedJob"]:GetLines()) do
			info.whitelist[v:GetValue(1)] = true
		end
		net.Start("ENPC.SaveSettingsGS")
		net.WriteEntity(ent)
		net.WriteTable(info)
		net.SendToServer()

		base:Remove()
	end
	base["BtnSaveSettings"].Paint = function(slf, w, h)
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,100))

		local color = slf:IsHovered() and Color(255, 249, 149) or color_white
		slf:SetTextColor(Color(255,255,255,255))
	end
end

function ENPC:OpenJobPanel(job)
	if IsValid(base_menu["JobPanel"]) then base_menu["JobPanel"]:Remove() end

	local show_skin_menu

	base_menu["JobPanel"] = vgui.Create("DPanel", base_menu)
	base_menu["JobPanel"]:SetSize(580, base_menu:GetTall()-80)
	base_menu["JobPanel"]:SetPos(210, 70)
	base_menu["JobPanel"].Paint = function(slf, w, h)
		draw.RoundedBox(0, 0, 0, w, h, self.Colors.s_bg)
		draw.DrawText(job.name, "ENPC.Font21", w/2, 10, self:IsDarkColor(job.color), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

		if istable(job.model) then
			draw.DrawText("- "..ENPC:Translate("model"), "ENPC.Font18", w/2 + 130, 118, Color( 200, 200, 200 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end

		if show_skin_menu then
			draw.DrawText("- "..ENPC:Translate("skin"), "ENPC.Font18", w/2 + 130, 218, Color( 200, 200, 200 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		end
	end

	local curModel = istable(job.model) and table.GetFirstValue(job.model) or job.model

	base_menu.icon = vgui.Create( "DModelPanel", base_menu["JobPanel"] )
	base_menu.icon:SetSize(base_menu["JobPanel"]:GetWide()/2+50, base_menu["JobPanel"]:GetWide()/2+50)
	base_menu.icon:SetPos(base_menu["JobPanel"]:GetWide()/5,0)
	base_menu.icon:SetModel( curModel )
	base_menu.icon.Angles = Angle(0,0,0)
	function base_menu.icon:DragMousePress()
		self.PressX, self.PressY = gui.MousePos()
		self.Pressed = true
	end
	function base_menu.icon:DragMouseRelease()
		self.Pressed = false
	end
	local rnd = math.random(1,4)
	function base_menu.icon:LayoutEntity( ent )
		if ( self.bAnimated ) then
			self:RunAnimation()
		end

		if ( self.Pressed ) then
			local mx, my = gui.MousePos()
			self.Angles = self.Angles - Angle( 0, ( self.PressX or mx ) - mx, 0 )
			self.PressX, self.PressY = gui.MousePos()
		end

		ent:SetAngles( self.Angles )
		if ENPC.EnableRandomSequences then
			base_menu.icon.Entity:SetSequence(base_menu.icon.Entity:LookupSequence("pose_standing_0"..rnd))
		end
	end

	show_skin_menu = base_menu.icon.Entity:SkinCount() > 1

	if istable(job.model) and #job.model > 1 then
		base_menu["prevBtn"] = vgui.Create("DButton", base_menu["JobPanel"])
		base_menu["prevBtn"]:SetPos(150, 100)
		base_menu["prevBtn"]:SetSize(50, 50)
		base_menu["prevBtn"]:SetText("<")
		base_menu["prevBtn"]:SetTextColor(Color( 200, 200, 200 ))
		base_menu["prevBtn"]:SetFont("Trebuchet24")
		base_menu["prevBtn"].Paint = nil
		base_menu["prevBtn"].DoClick = function()
			local nextModel = table.FindPrev( job.model, curModel )
			base_menu.icon:SetModel( nextModel )
			curModel = nextModel

			show_skin_menu = base_menu.icon.Entity:SkinCount() > 1
			base_menu["prevBtn_s"]:SetVisible(show_skin_menu)
			base_menu["nextBtn_s"]:SetVisible(show_skin_menu)
		end

		base_menu["nextBtn"] = vgui.Create("DButton", base_menu["JobPanel"])
		base_menu["nextBtn"]:SetPos(base_menu["JobPanel"]:GetWide() - 50 -150, 100)
		base_menu["nextBtn"]:SetSize(50, 50)
		base_menu["nextBtn"]:SetText(">")
		base_menu["nextBtn"]:SetTextColor(Color( 200, 200, 200 ))
		base_menu["nextBtn"]:SetFont("Trebuchet24")
		base_menu["nextBtn"].Paint = nil
		base_menu["nextBtn"].DoClick = function()
			local nextModel = table.FindNext( job.model, curModel )
			base_menu.icon:SetModel( nextModel )
			curModel = nextModel


			show_skin_menu = base_menu.icon.Entity:SkinCount() > 1
			base_menu["prevBtn_s"]:SetVisible(show_skin_menu)
			base_menu["nextBtn_s"]:SetVisible(show_skin_menu)
		end
	end

	local cur_skin = 0

	base_menu["prevBtn_s"] = vgui.Create("DButton", base_menu["JobPanel"])
	base_menu["prevBtn_s"]:SetPos(150, 200)
	base_menu["prevBtn_s"]:SetSize(50, 50)
	base_menu["prevBtn_s"]:SetText("<")
	base_menu["prevBtn_s"]:SetTextColor(Color( 200, 200, 200 ))
	base_menu["prevBtn_s"]:SetFont("Trebuchet24")
	base_menu["prevBtn_s"]:SetVisible(show_skin_menu)
	base_menu["prevBtn_s"].Paint = nil
	base_menu["prevBtn_s"].DoClick = function()
		cur_skin = cur_skin - 1
		if cur_skin < 0 then
			cur_skin = base_menu.icon.Entity:SkinCount() -1
		end

		base_menu.icon.Entity:SetSkin( cur_skin )
	end

	base_menu["nextBtn_s"] = vgui.Create("DButton", base_menu["JobPanel"])
	base_menu["nextBtn_s"]:SetPos(base_menu["JobPanel"]:GetWide() - 50 -150, 200)
	base_menu["nextBtn_s"]:SetSize(50, 50)
	base_menu["nextBtn_s"]:SetText(">")
	base_menu["nextBtn_s"]:SetTextColor(Color( 200, 200, 200 ))
	base_menu["nextBtn_s"]:SetFont("Trebuchet24")
	base_menu["nextBtn_s"].Paint = nil
	base_menu["nextBtn_s"]:SetVisible(show_skin_menu)
	base_menu["nextBtn_s"].DoClick = function()
		cur_skin = cur_skin + 1
		if cur_skin < 0 then
			cur_skin = base_menu.icon.Entity:SkinCount() -1
		end

		base_menu.icon.Entity:SetSkin( cur_skin )
	end

	base_menu["descLabel"] = vgui.Create("DLabel", base_menu["JobPanel"])
	base_menu["descLabel"]:SetPos(40, base_menu["JobPanel"]:GetTall()/2+50)
	base_menu["descLabel"]:SetSize(base_menu["JobPanel"]:GetWide(), 100)
	base_menu["descLabel"]:SetText(job.description)
	base_menu["descLabel"]:SetFont("ENPC.Font16")
	base_menu["descLabel"]:SetAutoStretchVertical(true)
	base_menu["descLabel"]:SetWrap(true)
	base_menu["descLabel"]:SetTextColor(Color( 200, 200, 200 ))

	base_menu["selectBtn"] = vgui.Create("DButton", base_menu["JobPanel"])
	base_menu["selectBtn"]:SetPos(0, base_menu["JobPanel"]:GetTall()-40)
	base_menu["selectBtn"]:SetSize(base_menu["JobPanel"]:GetWide(), 40)
	base_menu["selectBtn"]:SetText("")
	base_menu["selectBtn"].DoClick = function(slf)
		if self:IsBlockedBy(LocalPlayer(), job) then return end
		if not self:IsAvailableJob(LocalPlayer(), job) then return end

		if not self:IsBoughtJob(LocalPlayer(), job) and self:IsJobNotRequired(LocalPlayer(), job) then
			net.Start("ENPC.BuyJob")
			net.WriteInt(job.team, 16)
			net.SendToServer()

			return
		end

		DarkRP.setPreferredJobModel(job.team, curModel)

		net.Start("ENPC.ChangeJobNPC")
		net.WriteInt(job.team, 16)
		net.WriteInt(base_menu.icon.Entity:GetSkin(), 16)
		net.SendToServer()

		base_menu:Remove()
	end
	base_menu["selectBtn"].Paint = function(slf, w, h)
		draw.RoundedBox(0, 0, 0, w, h, slf:IsHovered() and Color(52, 58, 64) or Color(0,0,0,100))

		local avail_color = slf:IsHovered() and color_white or Color(220,220,220,255)

		local can, message = self:IsAvailableJob(LocalPlayer(), job)
		if not can then
			draw.SimpleText( message, "ENPC.Font21", w/2, h/2+2, self.Colors.unavailable, 1, 1 )
		else
			local available, time, level = self:IsBlockedBy(LocalPlayer(), job)
			local bought, msg = self:IsBoughtJob(LocalPlayer(), job)
			local required_, msg1 = self:IsJobNotRequired(LocalPlayer(), job)

			if available then
				draw.SimpleText( self:Translate("Required").." "..available, "ENPC.Font21", w/2, h/2+2, self.Colors.unavailable, 1, 1 )
			elseif not required_ then
				draw.SimpleText( msg1, "ENPC.Font21", w/2, h/2+2, self.Colors.unavailable, 1, 1 )
			elseif not bought then
				draw.SimpleText( msg..": "..DarkRP.formatMoney(job.jobcost), "ENPC.Font21", w/2, h/2+2, avail_color, 1, 1 )
			else
				draw.SimpleText( self:Translate("Select"), "ENPC.Font21", w/2, h/2+2, avail_color, 1, 1 )
			end
		end
	end

end

function ENPC:OpenJobList(ent, whitelist)
	if IsValid(base) then base:Remove() end
	if IsValid(base_menu) then base_menu:Remove() end

	base_menu = vgui.Create("DFrame")
	base_menu:SetSize(800, 625)
	base_menu:Center()
	base_menu:MakePopup()
	base_menu:SetTitle("")
	base_menu:ShowCloseButton(false)
	base_menu.Paint = function(slf, w, h)
		self:DrawBlurredPanel(slf)
		draw.RoundedBox(0, 0, 0, w, h, self.Colors.bg)
		draw.RoundedBox(0, 0, 0, w, 60, self.Colors.s_bg)
		draw.RoundedBox(0, 0, 0, 200, 60, self.Colors.header)
		draw.SimpleText(ent:GetCustomName(), "ENPC.Font21", 100, 30, color_white, 1, 1)
	end

	base_menu["ExitBtn"] = vgui.Create("DButton", base_menu)
	base_menu["ExitBtn"]:SetPos(base_menu:GetWide() - 20 - 15, 30-10)
	base_menu["ExitBtn"]:SetSize(20, 20)
	base_menu["ExitBtn"]:SetText("")
	base_menu["ExitBtn"].DoClick = function()
		if base_menu then base_menu:Remove() end
	end
	base_menu["ExitBtn"].Paint = function(slf, w, h)
		self:DrawMaterial(close_mat, 0, 0, slf:IsHovered())
	end

	if LocalPlayer():IsSuperAdmin() then
		base_menu["SettingsBtn"] = vgui.Create("DButton", base_menu)
		base_menu["SettingsBtn"]:SetSize(20, 20)
		base_menu["SettingsBtn"]:SetPos(base_menu:GetWide() - 20 - 45, 30-10)
		base_menu["SettingsBtn"]:SetText("")
		base_menu["SettingsBtn"].Paint = function(slf, w, h)
			self:DrawMaterial(settings_mat, 0, 0, slf:IsHovered())
		end
		base_menu["SettingsBtn"].DoClick = function()
			self:OpenSettingsMenu(ent, whitelist)
		end
	end

	base_menu["ScrollPanel"] = vgui.Create("DScrollPanel", base_menu)
	base_menu["ScrollPanel"]:SetSize(200, base_menu:GetTall()-60)
	base_menu["ScrollPanel"]:SetPos(0, 60)
	base_menu["ScrollPanel"].Paint = function(slf, w, h)
		draw.RoundedBox(0, 0, 0, 200, h, self.Colors.s_bg)
	end

	base_menu["JobList"] = vgui.Create("DIconLayout", base_menu["ScrollPanel"])
	base_menu["JobList"]:SetSize( base_menu["ScrollPanel"]:GetWide(), base_menu["ScrollPanel"]:GetTall())
	base_menu["JobList"]:SetSpaceY( 0 )
	base_menu["JobList"]:SetSpaceX( 5 )

	local job_list = {}
	for k,v in pairs(RPExtraTeams) do
		if whitelist[v.name] then
			table.insert(job_list, v)
		end
	end

	for k,v in pairs(job_list) do
		base_menu["ColorJob"..k] = Color(97,97,97)
		base_menu["JobPanel"..k] = base_menu["JobList"]:Add("DPanel")
		base_menu["JobPanel"..k]:SetSize(base_menu["JobList"]:GetWide(), 45)
		base_menu["JobPanel"..k].last_w = 0
		base_menu["JobPanel"..k].Paint = function(slf, w, h)
			local iconsTbl = GetIconsTable(v)
			local offset = #iconsTbl > 0 and 10 or 2

			draw.RoundedBox(0, 0, 0, w, h-1, slf.is_hovered and Color(255,255,255,2) or Color(0,0,0,0))

			if slf.Selected then
				slf.last_w = Lerp(FrameTime()*10, slf.last_w, 5)
			else
				slf.last_w = Lerp(FrameTime()*10, slf.last_w, 0)
			end

			draw.RoundedBox(0, 0, 0, slf.last_w, h, self:IsDarkColor(v.color))

			if slf.Selected then
				draw.SimpleText(v.name, "ENPC.Font18", 15, h/2 - offset, self.Colors.f_list, 0, 1)

				local can, message = self:IsAvailableJob(LocalPlayer(), v)

				if not can then
					draw.SimpleText(message, "ENPC.Font16", 16, 21, self.Colors.f_list, 0, 0)
				else
					local available, time, level = self:IsBlockedBy(LocalPlayer(), v)
					local bought, msg = self:IsBoughtJob(LocalPlayer(), v)
					local required_, msg1 = self:IsJobNotRequired(LocalPlayer(), v)

					if available then
						draw.SimpleText(available, "ENPC.Font16", 16, 21, self.Colors.f_list, 0, 0)
					elseif not required_ then
						draw.SimpleText( msg1, "ENPC.Font16", 16, 21, self.Colors.f_list, 0, 0 )
					elseif not bought then
						draw.SimpleText(msg..": "..DarkRP.formatMoney(v.jobcost), "ENPC.Font16", 16, 21, self.Colors.f_list, 0, 0)
					end
				end
			else
				draw.SimpleText(v.name, "ENPC.Font18", 10, h/2 - offset, self.Colors.f_list, 0, 1)
			end

			surface.SetDrawColor(Color(0,0,0,75))
			surface.DrawLine(8, h-1, w-16, h-1)
		end

		base_menu["IconLayot"] = vgui.Create("DIconLayout", base_menu["JobPanel"..k])
		base_menu["IconLayot"]:SetSize( base_menu["JobPanel"..k]:GetWide()-20, base_menu["JobPanel"..k]:GetTall()-20)
		base_menu["IconLayot"]:SetPos( 10, 20 )
		base_menu["IconLayot"]:SetSpaceY( 0 )
		base_menu["IconLayot"]:SetSpaceX( 5 )

		for _,z in pairs(GetIconsTable(v)) do
			base_menu["Icon"] = base_menu["IconLayot"]:Add("DPanel")
			base_menu["Icon"]:SetSize(15, 15)
			base_menu["Icon"].Paint = function(slf, w, h)
				if not base_menu["JobPanel"..k].Selected then
					self:DrawMaterial(z, 0, 0, true)
				end
			end
		end

		base_menu["JobBtn"..k] = vgui.Create("DButton", base_menu["JobPanel"..k])
		base_menu["JobBtn"..k]:SetPos(0, 0)
		base_menu["JobBtn"..k]:SetSize(base_menu["JobPanel"..k]:GetWide(), base_menu["JobPanel"..k]:GetTall())
		base_menu["JobBtn"..k]:SetText("")
		base_menu["JobBtn"..k].Paint = function(slf, w, h)
			base_menu["JobPanel"..k].is_hovered = slf:IsHovered()
		end
		base_menu["JobBtn"..k].DoClick = function(slf)
			for _, but in pairs( base_menu["JobList"]:GetChildren() ) do
				but.Selected = false
			end
			base_menu["JobPanel"..k].Selected = true
			self:OpenJobPanel(v)
		end
	end

	if base_menu["JobBtn1"] then base_menu["JobBtn1"].DoClick() end
end

net.Receive("ENPC.OpenNPCInteractiveMenu", function()
	local ent = net.ReadEntity()
	local whitelist = net.ReadTable()

	ENPC:OpenJobList(ent, whitelist)
end)

net.Receive("ENPC.SyncJobs", function()
	local jobs = net.ReadTable()
	LocalPlayer().unlocked_jobs = jobs
end)

hook.Add( "Think", "ENPC.Think.Jobs", function()
	if not IsValid(LocalPlayer()) then return end

	net.Start("ENPC.PlayerIsLoaded")
	net.SendToServer()

	hook.Remove("Think", "ENPC.Think.Jobs")
end)

--PATH addons/rogue_scoreboard/lua/roguescoreboard/sh_roguenetdata.lua:


local plyMeta = FindMetaTable("Player")

local dataConverters = {
    ["Entity"] = function(a) return a end,
    ["Bool"] = function(a) return !!a end,
    ["String"] = function(a) return tostring(a) end,
    ["Int"] = function(a) return math.floor(tonumber(a)) end,
    ["Float"] = function(a) return tonumber(a) end,
    ["Vector"] = function(a) return Vector(a) end,
    ["Angle"] = function(a) return Angle(a) end,
}

RogueScoreboard.NetData = RogueScoreboard.NetData or {}

local NetData = RogueScoreboard.NetData

if SERVER then
    util.AddNetworkString("RogueScoreboard.NetData")

    function plyMeta:SetRogueNetData(key, data)
        NetData[self] = NetData[self] or {}

        NetData[self][key] = data

        net.Start("RogueScoreboard.NetData")
            net.WriteEntity(self)
            net.WriteString(key)
            net.WriteType(data)
        net.Broadcast()
    end

    for dataType, dataConverter in pairs(dataConverters) do
        plyMeta["SetRogueNet" .. dataType] = function(ply, key, data)
            ply:SetRogueNetData(key, dataConverter(data))
        end
    end

    hook.Add("PlayerInitialSpawn", "SyncNetData", function(ply)
        timer.Simple(FrameTime(), function()
            if !IsValid(ply) or !ply:IsPlayer() then return end

            for dataPly, dataTable in pairs(NetData) do
                for dataKey, data in pairs(dataTable) do
                    net.Start("RogueScoreboard.NetData", false)
                        net.WriteEntity(dataPly)
                        net.WriteString(dataKey)
                        net.WriteType(data)
                    net.Send(ply)
                end
            end
        end)
    end)
else
    net.Receive("RogueScoreboard.NetData", function()
        local ply = net.ReadEntity()
        local key = net.ReadString()
        local data = net.ReadType()

        NetData[ply] = NetData[ply] or {}

        NetData[ply][key] = data
    end)
end

function plyMeta:GetRogueNetData(key, default)
    local data = NetData[self] and NetData[self][key] or default

    return data
end

for dataType, dataConverter in pairs(dataConverters) do
    plyMeta["GetRogueNet" .. dataType] = function(ply, key, default)
        local rawData = ply:GetRogueNetData(key, default)
        if rawData == nil then
            return nil
        end
        return dataConverter(rawData)
    end
end
--PATH addons/msd_ui/lua/msd/ui/msdmdlmenu.lua:
local PANEL = {}

AccessorFunc( PANEL, "m_fAnimSpeed",	"AnimSpeed" )
AccessorFunc( PANEL, "Entity",			"Entity" )
AccessorFunc( PANEL, "vCamPos",			"CamPos" )
AccessorFunc( PANEL, "fFOV",			"FOV" )
AccessorFunc( PANEL, "vLookatPos",		"LookAt" )
AccessorFunc( PANEL, "aLookAngle",		"LookAng" )
AccessorFunc( PANEL, "colAmbientLight",	"AmbientLight" )
AccessorFunc( PANEL, "colColor",		"Color" )
AccessorFunc( PANEL, "bAnimated",		"Animated" )

function PANEL:Init()

	self.Entity = nil
	self.SubEntitys = {}
	self.LastPaint = 0
	self.DirectionalLight = {}
	self.FarZ = 4096
	self.Angles = Angle(0, 0, 0)

	self:SetCamPos( Vector(0, 0, 0) )
	self:SetLookAt( Vector(-100, 0, -22) )
	self:SetFOV( 50 )

	self:SetText( "" )
	self:SetAnimSpeed( 0.5 )
	self:SetAnimated( true )

	self:SetAmbientLight( Color( 50, 50, 50 ) )

	self:SetDirectionalLight( BOX_TOP, Color( 255, 255, 255 ) )
	self:SetDirectionalLight( BOX_FRONT, Color( 255, 255, 255 ) )

	self:SetDirectionalLight(BOX_RIGHT, Color(255, 160, 80, 255))
	self:SetDirectionalLight(BOX_LEFT, Color(80, 160, 255, 255))

	self:SetColor( Color( 255, 255, 255, 255 ) )

end

function PANEL:SetDirectionalLight( iDirection, color )
	self.DirectionalLight[ iDirection ] = color
end

function PANEL:SetModel( strModelName )
	if ( IsValid( self.Entity ) ) then
		self.Entity:Remove()
		self.Entity = nil
	end

	if ( !ClientsideModel ) then return end

	self.Entity = ClientsideModel( strModelName, RENDERGROUP_OTHER )
	if ( !IsValid( self.Entity ) ) then return end

	self.Entity:SetNoDraw( true )
	self.Entity:SetIK( false )

	local iSeq = self.Entity:LookupSequence( "walk_all" )
	if ( iSeq <= 0 ) then iSeq = self.Entity:LookupSequence( "WalkUnarmed_all" ) end
	if ( iSeq <= 0 ) then iSeq = self.Entity:LookupSequence( "walk_all_moderate" ) end

	if ( iSeq > 0 ) then self.Entity:ResetSequence( iSeq ) end

end

function PANEL:GetModel()

	if ( !IsValid( self.Entity ) ) then return end

	return self.Entity:GetModel()

end

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

		for k,v in pairs(self.SubEntitys) do
			if IsValid(v) then
				v:DrawModel()
				if v.bone and isnumber(v.bone) then
					local pos, ang = MCS.GetBoneOrientation(self.Entity, v.bone, v.pos, v.ang)
					ang:RotateAroundAxis(ang:Up(), v.ang.y)
					ang:RotateAroundAxis(ang:Right(), v.ang.p)
					ang:RotateAroundAxis(ang:Forward(), v.ang.r)
					v:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)
					v:SetAngles(ang)
				end
			end
		end

		self:PostDrawModel( self.Entity )
	end

	render.SetScissorRect( 0, 0, 0, 0, false )

end

function PANEL:PreDrawModel( ent )
	return true
end

function PANEL:PostDrawModel( ent )

end

function PANEL:DragMousePress()
	self.PressX, self.PressY = gui.MousePos()
	self.Pressed = true
end

function PANEL:DoDoubleClick()
	if self:GetFOV() < 10 then
		self:SetFOV(50)
	else
		self:SetFOV(self:GetFOV() - 5)
	end
end

function PANEL:DragMouseRelease()
	self.Pressed = false
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

	render.SuppressEngineLighting( true )
	render.SetLightingOrigin( self.Entity:GetPos() )
	render.ResetModelLighting( self.colAmbientLight.r / 255, self.colAmbientLight.g / 255, self.colAmbientLight.b / 255 )
	render.SetColorModulation( self.colColor.r / 255, self.colColor.g / 255, self.colColor.b / 255 )
	render.SetBlend( ( self:GetAlpha() / 255 ) * ( self.colColor.a / 255 ) ) -- * surface.GetAlphaMultiplier()

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

function PANEL:RunAnimation()
	self.Entity:FrameAdvance( ( RealTime() - self.LastPaint ) * self.m_fAnimSpeed )
end

function PANEL:StartScene( name )

	if ( IsValid( self.Scene ) ) then
		self.Scene:Remove()
	end

	self.Scene = ClientsideScene( name, self.Entity )
end

function PANEL:LayoutEntity(ent)
	if (self.bAnimated) then
		self:RunAnimation()
	end

	if (self.Pressed) then
		local mx = gui.MousePos()
		self.Angles = self.Angles - Angle(0, (self.PressX or mx) - mx, 0)
		self.PressX, self.PressY = gui.MousePos()
	end

	ent:SetAngles(self.Angles)
end

function PANEL:OnRemove()
	if ( IsValid( self.Entity ) ) then
		self.Entity:Remove()
	end

	for k,v in pairs(self.SubEntitys) do
		if IsValid(v) then
			v:Remove()
		end
	end

end

function PANEL:GenerateExample( ClassName, PropertySheet, Width, Height )

	local ctrl = vgui.Create( ClassName )
	ctrl:SetSize( 300, 300 )
	ctrl:SetModel( "models/props_junk/PlasticCrate01a.mdl" )
	ctrl:GetEntity():SetSkin( 2 )

	PropertySheet:AddSheet( ClassName, ctrl, nil, true, true )

end

derma.DefineControl( "MSDModelPanel", "A panel containing a model but more epic", PANEL, "DButton" )
--PATH addons/permanent_sweps/lua/perm_swepy/shared_perm_sweps.lua:
PermSWEPsCFG = PermSWEPsCFG or {}

PermSWEPsCFG.HiddenSWEPs = { // Ones which don't appear in weapons.GetList - If some SWEPs aren't listed and you don't want to add to this then run "perm_sweps_forceswepcheck 0" in console
	// HL2
	{ClassName = "weapon_357", PrintName = "357"},
	{ClassName = "weapon_ar2", PrintName = "AR2"},
	{ClassName = "weapon_bugbait", PrintName = "BugBait"},
	{ClassName = "weapon_crossbow", PrintName = "Crossbow"},
	{ClassName = "weapon_crowbar", PrintName = "Crowbar"},
	{ClassName = "weapon_frag", PrintName = "Frag Grenade"},
	{ClassName = "weapon_physcannon", PrintName = "Gravity Gun"},
	{ClassName = "weapon_physgun", PrintName = "Physics Gun"},
	{ClassName = "weapon_pistol", PrintName = "Pistol"},
	{ClassName = "weapon_rpg", PrintName = "RPG Launcher"},
	{ClassName = "weapon_shotgun", PrintName = "Shotgun"},
	{ClassName = "weapon_slam", PrintName = "SLAM"},
	{ClassName = "weapon_smg1", PrintName = "SMG"},
	{ClassName = "weapon_stunstick", PrintName = "Stunstick"}
}

// Adding/removing weapons from console
/*
	I don't know the limit but more than one swep can be added or removed at once using the sweps class separated by a space
	Make sure the STEAMID is in quotes or stuff won't work!

	perm_sweps_add "STEAMID" swep_class1 swep_class2 swep_class3 etc etc
	perm_sweps_remove "STEAMID" swep_class1 swep_class2 swep_class3 etc etc

	Examples:
		perm_sweps_add "STEAM_0:1:50714411" weapon_357
		perm_sweps_add "STEAM_0:1:50714411" weapon_ar2 weapon_bugbait weapon_crossbow

		perm_sweps_remove "STEAM_0:1:50714411" weapon_357
		perm_sweps_remove "STEAM_0:1:50714411" weapon_ar2 weapon_bugbait weapon_crossbow
*/

--PATH addons/sam-157/lua/sam/config/cl_config.lua:
if SAM_LOADED then return end

local sam = sam
local sfs = sam.sfs
local config = sam.config
local type = sam.type

local encoders = sfs.Encoder.encoders

function config.set(key, value, force)
	if not sam.isstring(key) then
		error("invalid setting name")
	end

	if not encoders[type(value)] then
		error("not supported value type")
	end

	if not force and config.get(key) == value then return end
	sam.netstream.Start("Config.Set", key, value)
end

function config.get(key, default)
	local value = sam.get_global("Config", {})[key]
	if value ~= nil then
		return value
	end
	return default
end

local menu_settings = {}
function config.add_menu_setting(title, func)
	local i = #menu_settings + 1
	for k, v in ipairs(menu_settings) do
		if v.title == title then
			i = k
			break
		end
	end
	menu_settings[i] = {
		title = title,
		func = func,
	}
end

function config.get_menu_settings()
	return menu_settings
end

hook.Add("SAM.ChangedGlobalVar", "SAM.CheckLoadedConfig", function(key, value)
	if key == "Config" then
		config.loaded = true
		hook.Call("SAM.LoadedConfig", nil, value)
		hook.Remove("SAM.ChangedGlobalVar", "SAM.CheckLoadedConfig")
	end
end)

--PATH addons/sam-157/lua/sam/command/arguments/length.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local get_length = function(arg, input)
	if (input == "" or input == nil) and arg.optional then
		if arg.default ~= nil then
			return arg.default
		end

		return ""
	end

	return sam.parse_length(input)
end

command.new_argument("length")
	:OnExecute(function(arg, input, ply, _, result, i)
		local length = get_length(arg, input)
		if length == "" then
			result[i] = nil
		elseif not length then
			ply:sam_send_message("invalid", {
				S = "length", S_2 = input
			})
			return false
		else
			if arg.min and length ~= 0 then
				length = math.max(length, arg.min)
			end

			if arg.max then
				if length == 0 then
					length = arg.max
				else
					length = math.min(length, arg.max)
				end
			end

			result[i] = length
		end
	end)

	:Menu(function(set_result, body, buttons, argument)
		local length_input = buttons:Add("SAM.TextEntry")
		length_input:SetTall(25)

		length_input:SetCheck(function(new_limit)
			new_limit = get_length(argument, new_limit) or nil
			set_result(new_limit)
			return new_limit or false
		end)

		local hint = argument.hint or "length"
		if argument.default then
			hint = hint .. " = " .. tostring(argument.default)
		end

		length_input:SetPlaceholder(hint)
		return length_input
	end)
:End()
--PATH addons/sam-157/lua/sam/command/arguments/text.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

command.new_argument("text")
	:OnExecute(function(argument, input, ply, _, result, i)
		if sam.isstring(input) then
			input = input:sub(1, 255)
		end

		local invalid = false
		if input == nil then
			if not argument.optional then
				invalid = true
			end
		elseif argument.check and not argument.check(input, ply) then
			invalid = true
		end

		if invalid then
			ply:sam_send_message("invalid", {
				S = argument.hint or "text", S_2 = input
			})
			return false
		end

		result[i] = input
	end)
	:Menu(function(set_result, body, buttons, argument)
		local text_entry = buttons:Add("SAM.TextEntry")
		text_entry:SetTall(25)

		local default = argument.default
		text_entry:SetCheck(function(text)
			local valid = true
			if text == "" then
				if default then
					text = default
				elseif not argument.optional then
					valid = false
				end
			elseif argument.check and not argument.check(text, LocalPlayer()) then
				valid = false
			end

			set_result(valid and text or nil)

			return valid
		end)

		local hint = argument.hint or "text"
		if default then
			hint = hint .. " = " .. tostring(default)
		end

		text_entry:SetPlaceholder(hint)

		return text_entry
	end)
:End()
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
--PATH addons/sam-157/lua/sam/modules/util.lua:
if SAM_LOADED then return end

local sam, command, language = sam, sam.command, sam.language

command.set_category("Utility")

command.new("map")
	:SetPermission("map", "admin")

	:AddArg("map")
	:AddArg("text", {hint = "gamemode", optional = true, check = sam.is_valid_gamemode})

	:Help("map_help")

	:OnExecute(function(ply, map, gamemode)
		if not gamemode then
			sam.player.send_message(nil, "map_change", {
				A = ply, V = map
			})
		else
			sam.player.send_message(nil, "map_change2", {
				A = ply, V = map, V_2 = gamemode
			})
			RunConsoleCommand("gamemode", gamemode)
		end

		if #player.GetHumans() == 0 then
			RunConsoleCommand("changelevel", map)
		else
			timer.Create("SAM.Command.Map", 10, 1, function()
				RunConsoleCommand("changelevel", map)
			end)
		end
	end)
:End()

command.new("maprestart")
	:SetPermission("maprestart", "admin")

	:Help("map_restart_help")

	:OnExecute(function(ply)
		if #player.GetHumans() == 0 then
			RunConsoleCommand("changelevel", game.GetMap())
		else
			timer.Create("SAM.Command.MapRestart", 10, 1, function()
				RunConsoleCommand("changelevel", game.GetMap())
			end)

			sam.player.send_message(nil, "map_restart", {
				A = ply
			})
		end
	end)
:End()

command.new("mapreset")
	:SetPermission("mapreset", "admin")

	:Help("mapreset_help")

	:OnExecute(function(ply)
		game.CleanUpMap(false, nil, function() end)

		sam.player.send_message(nil, "mapreset", {
			A = ply
		})
	end)
:End()

command.new("kick")
	:SetPermission("kick", "admin")

	:AddArg("player", {single_target = true})
	:AddArg("text", {hint = "reason", optional = true, default = sam.language.get("default_reason")})

	:GetRestArgs()

	:Help("kick_help")

	:OnExecute(function(ply, targets, reason)
		local target = targets[1]
		target:Kick(reason)

		sam.player.send_message(nil, "kick", {
			A = ply, T = target:Name(), V = reason
		})
	end)
:End()

command.new("ban")
	:SetPermission("ban", "admin")

	:AddArg("player", {single_target = true})
	:AddArg("length", {optional = true, default = 0})
	:AddArg("text", {hint = "reason", optional = true, default = sam.language.get("default_reason")})

	:GetRestArgs()

	:Help("ban_help")

	:OnExecute(function(ply, targets, length, reason)
		local target = targets[1]
		if ply:GetBanLimit() ~= 0 then
			if length == 0 then
				length = ply:GetBanLimit()
			else
				length = math.Clamp(length, 1, ply:GetBanLimit())
			end
		end
		target:sam_ban(length, reason, ply:SteamID())

		sam.player.send_message(nil, "ban", {
			A = ply, T = target:Name(), V = sam.format_length(length), V_2 = reason
		})
	end)
:End()

command.new("banid")
	:SetPermission("banid", "admin")

	:AddArg("steamid")
	:AddArg("length", {optional = true, default = 0})
	:AddArg("text", {hint = "reason", optional = true, default = sam.language.get("default_reason")})

	:GetRestArgs()

	:Help("banid_help")

	:OnExecute(function(ply, promise, length, reason)
		local a_steamid, a_name, a_ban_limit = ply:SteamID(), ply:Name(), ply:GetBanLimit()

		promise:done(function(data)
			local steamid, target = data[1], data[2]

			if a_ban_limit ~= 0 then
				if length == 0 then
					length = a_ban_limit
				else
					length = math.Clamp(length, 1, a_ban_limit)
				end
			end

			if target then
				target:sam_ban(length, reason, a_steamid)

				sam.player.send_message(nil, "ban", {
					A = a_name, T = target:Name(), V = sam.format_length(length), V_2 = reason
				})
			else
				sam.player.ban_id(steamid, length, reason, a_steamid)

				sam.player.send_message(nil, "banid", {
					A = a_name, T = steamid, V = sam.format_length(length), V_2 = reason
				})
			end
		end)
	end)
:End()

command.new("unban")
	:SetPermission("unban", "admin")

	:AddArg("steamid", {allow_higher_target = true})

	:Help("unban_help")

	:OnExecute(function(ply, steamid, reason)
		sam.player.unban(steamid, ply:SteamID())

		sam.player.send_message(nil, "unban", {
			A = ply, T = steamid
		})
	end)
:End()

do
	command.new("noclip")
		:SetPermission("noclip", "admin")

		:AddArg("player", {optional = true})

		:Help("noclip_help")

		:OnExecute(function(ply, targets)
			local id
			for i = 1, #targets do
				local v = targets[i]
				v:SetMoveType(v:GetMoveType() == MOVETYPE_WALK and MOVETYPE_NOCLIP or MOVETYPE_WALK)
				if v == ply then
					id = i
				end
			end

			if id then
				table.remove(targets, id)
				if #targets == 0 then return end
			end

			sam.player.send_message(nil, "noclip", {
				A = ply, T = targets
			})
		end)
	:End()

	sam.permissions.add("can_noclip", nil, "admin")

	hook.Add("PlayerNoClip", "SAM.CanNoClip", function(ply)
		if ply:HasPermission("can_noclip") then
			return true
		end
	end)
end

do
	local config = sam.config

	sam.permissions.add("can_physgun_players", nil, "admin")

	if CLIENT then
		local add_setting = function(body, title, key)
			local setting = body:Add("SAM.LabelPanel")
			setting:Dock(TOP)
			setting:SetLabel(title)

			local enable = setting:Add("SAM.ToggleButton")
			enable:SetConfig(key, true)

			return setting
		end

		config.add_menu_setting("Physgun", function(body)
			local setting_body

			do
				local p = add_setting(body, "Physgun (Enable/Disable all physgun features except picking up players)", "Physgun.Enabled")
				p:DockMargin(8, 6, 8, 0)
			end

			setting_body = body:Add("Panel")
			setting_body:Dock(TOP)
			setting_body:DockMargin(8, 6, 8, 0)
			setting_body:DockPadding(8, 0, 8, 0)

			add_setting(setting_body, "No fall damage on drop", "Physgun.NoFallDamageOnDrop")
			add_setting(setting_body, "Right click to freeze players", "Physgun.RightClickToFreeze")
			add_setting(setting_body, "Reset Velocity to fix some issues when players fall", "Physgun.ResetVelocity")

			function setting_body:PerformLayout()
				setting_body:SizeToChildren(false, true)
			end
		end)
	end

	local freeze_player = function(ply)
		if SERVER then
			ply:Lock()
		end
		ply:SetMoveType(MOVETYPE_NONE)
		ply:SetCollisionGroup(COLLISION_GROUP_WORLD)
	end

	sam.hook_first("PhysgunPickup", "SAM.CanPhysgunPlayer", function(ply, target)
		if sam.type(target) == "Player" and ply:HasPermission("can_physgun_players") and ply:CanTarget(target) then
			freeze_player(target)
			return true
		end
	end)

	local load_phygun_settings = function()
		hook.Remove("PhysgunDrop", "SAM.PhysgunDrop")
		hook.Remove("OnPlayerHitGround", "SAM.PhysgunDropOnPlayerHitGround")

		if config.get("Physgun.Enabled", true) == false then
			-- add a hook to unlock the player if the physgun is disabled and other stuff
			hook.Add("PhysgunDrop", "SAM.PhysgunDrop", function(ply, target)
				if sam.type(target) == "Player" then
					target:SetMoveType(MOVETYPE_WALK)
					target:SetCollisionGroup(COLLISION_GROUP_PLAYER)

					if SERVER then
						target:UnLock()
						if target.sam_has_god_mode then
							target:GodEnable()
						end
					end
				end
			end)
			return
		end

		local right_click_to_freeze = config.get("Physgun.RightClickToFreeze", true)
		local reset_velocity = config.get("Physgun.ResetVelocity", true)
		hook.Add("PhysgunDrop", "SAM.PhysgunDrop", function(ply, target)
			if sam.type(target) ~= "Player" then return end

			if right_click_to_freeze and ply:KeyPressed(IN_ATTACK2) then
				freeze_player(target)

				if SERVER then
					target:sam_set_nwvar("frozen", true)
					target:sam_set_exclusive("frozen")
				end
			else
				if reset_velocity then
					target:SetLocalVelocity(Vector(0, 0, 0))
				end

				if SERVER then
					target:UnLock()
					target:sam_set_nwvar("frozen", false)
					target:sam_set_exclusive(nil)

					if target.sam_has_god_mode then
						target:GodEnable()
					end

					target.sam_physgun_drop_was_frozen = not target:IsOnGround()
				end

				target:SetMoveType(MOVETYPE_WALK)
				target:SetCollisionGroup(COLLISION_GROUP_PLAYER)
			end
		end)

		if config.get("Physgun.NoFallDamageOnDrop", true) then
			hook.Add("OnPlayerHitGround", "SAM.PhysgunDropOnPlayerHitGround", function(ply)
				if ply.sam_physgun_drop_was_frozen then
					ply.sam_physgun_drop_was_frozen = false
					return true
				end
			end)
		end
	end

	config.hook({"Physgun.Enabled", "Physgun.RightClickToFreeze", "Physgun.ResetVelocity", "Physgun.NoFallDamageOnDrop"}, load_phygun_settings)
end

do
	command.new("cleardecals")
		:SetPermission("cleardecals", "admin")
		:Help("cleardecals_help")

		:OnExecute(function(ply)
			sam.netstream.Start(nil, "cleardecals")

			sam.player.send_message(nil, "cleardecals", {
				A = ply
			})
		end)
	:End()

	if CLIENT then
		sam.netstream.Hook("cleardecals", function()
			game.RemoveRagdolls()
			RunConsoleCommand("r_cleardecals")
		end)
	end
end

do
	command.new("stopsound")
		:SetPermission("stopsound", "admin")
		:Help("stopsound_help")

		:OnExecute(function(ply)
			sam.netstream.Start(nil, "stopsound")

			sam.player.send_message(nil, "stopsound", {
				A = ply
			})
		end)
	:End()

	if CLIENT then
		sam.netstream.Hook("stopsound", function()
			RunConsoleCommand("stopsound")
		end)
	end
end

command.new("exit")
	:SetPermission("exit_vehicle", "admin")

	:AddArg("player", {single_target = true})

	:Help("exit_vehicle_help")

	:OnExecute(function(ply, targets)
		local target = targets[1]

		if not target:InVehicle() then
			if ply == target then
				return ply:sam_send_message("not_in_vehicle")
			else
				return ply:sam_send_message("not_in_vehicle2", {
					S = target:Name()
				})
			end
		end

		target:ExitVehicle()

		sam.player.send_message(nil, "exit_vehicle", {
			A = ply, T = targets
		})
	end)
:End()

command.new("time")
	:SetPermission("time", "user")

	:AddArg("player", {single_target = true, optional = true})

	:Help("time_help")

	:OnExecute(function(ply, targets)
		if ply == targets[1] then
			sam.player.send_message(ply, "time_your", {
				V = sam.reverse_parse_length(targets[1]:sam_get_play_time() / 60)
			})
		else
			sam.player.send_message(ply, "time_player", {
				T = targets, V = sam.reverse_parse_length(targets[1]:sam_get_play_time() / 60)
			})
		end
	end)
:End()

command.new("admin")
	:SetPermission("admin_mode", "admin")

	:Help("admin_help")

	:OnExecute(function(ply)
		ply:sam_cloak()
		ply:GodEnable()
		ply:SetMoveType(MOVETYPE_NOCLIP)
	end)
:End()

command.new("unadmin")
	:SetPermission("admin_mode", "admin")

	:Help("unadmin_help")

	:OnExecute(function(ply)
		ply:sam_uncloak()
		ply:GodDisable()
		ply:SetMoveType(MOVETYPE_WALK)
	end)
:End()

do
	command.new("buddha")
		:SetPermission("buddha", "admin")

		:AddArg("player", {optional = true})

		:Help("buddha_help")

		:OnExecute(function(ply, targets)
			for i = 1, #targets do
				targets[i].sam_buddha = true
			end

			sam.player.send_message(nil, "buddha", {
				A = ply, T = targets
			})
		end)
	:End()

	command.new("unbuddha")
		:SetPermission("buddha", "admin")

		:AddArg("player", {optional = true})

		:Help("unbuddha_help")

		:OnExecute(function(ply, targets)
			for i = 1, #targets do
				targets[i].sam_buddha = nil
			end

			sam.player.send_message(nil, "unbuddha", {
				A = ply, T = targets
			})
		end)
	:End()

	if SERVER then
		hook.Add("EntityTakeDamage", "SAM.BuddhaMode", function(ply, info)
			if ply.sam_buddha and ply:Health() - info:GetDamage() <= 0 then
				ply:SetHealth(1)
				return true
			end
		end)
	end
end

command.new("give")
	:SetPermission("give", "superadmin")

	:AddArg("player")
	:AddArg("text", {hint = "weapon/entity"})

	:Help("give_help")

	:OnExecute(function(ply, targets, weapon)
		for i = 1, #targets do
			targets[i]:Give(weapon)
		end

		sam.player.send_message(nil, "give", {
			A = ply, T = targets, V = weapon
		})
	end)
:End()

-- do
-- 	if CLIENT then
-- 		sam.netstream.Hook("GetFriends", function()
-- 			local friends = {}
-- 			local humans = player.GetHumans()
-- 			for i = 1, #humans do
-- 				local human = humans[i]
-- 				if human:GetFriendStatus() == "friend" then
-- 					table.insert(friends, human)
-- 				end
-- 			end
-- 			netstream.Start("GetFriends", friends)
-- 		end)
-- 	else
-- 		hook.Add("SAM.AuthedPlayer", "GetPlayerFriends", function(ply)
-- 			timer.Simple(0, function()
-- 				ply.sam_requesting_friends = true
-- 				netstream.Start(ply, "GetFriends")
-- 			end)
-- 		end)

-- 		local invalid_friends = function(ply, friends, new_list)
-- 			if not sam.istable(friends) then return true end

-- 			local count = #friends
-- 			local max_players = game.MaxPlayers()
-- 			for k, friend in pairs(friends) do
-- 				if not sam.isnumber(k) then return true end
-- 				if not sam.isentity(friend) then return true end
-- 				if k > max_players then return true end
-- 				if k > count then return true end

-- 				if IsValid(friend) then
-- 					table.insert(new_list, friend)
-- 				end
-- 			end
-- 		end

-- 		sam.netstream.Hook("GetFriends", function(ply, friends)
-- 			local new_list = {}
-- 			if invalid_friends(ply, friends, new_list) then
-- 				ply.sam_friends_invalid = true
-- 				return
-- 			end
-- 			ply.sam_friends = new_list
-- 		end, function()
-- 			return ply.sam_requesting_friends
-- 		end)
-- 	end

-- 	command.new("friends")
-- 		:SetPermission("friends", "superadmin")

-- 		:AddArg("player", {single_target = true})

-- 		:Help(language.get("friends_help"))

-- 		:OnExecute(function(ply, targets)
-- 			local target = targets[1]
-- 			target.sam_friends_requests = target.sam_friends_requests or {}
-- 			target.sam_friends_requests[ply] = true
-- 		end)
-- 	:End()
-- end

--PATH addons/chatbox/lua/autorun/scb.lua:
if SCB_LOADED then return end

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

local load_file = function(name, no, type)
	if not no then
		name = "scb/" .. name
	end

	local func = types[type or name:GetFileFromFilename():sub(1, 3)] or types["sh_"]
	if func then
		return func(name)
	end
end

scb = {
	config = {}
}

function scb.print(...)
	MsgC(
		Color(236, 240, 241), "(",
		Color(65, 185, 255), "SCB",
		Color(236, 240, 241), ") ",
		Color(236, 240, 241), ...
	) Msg("\n")
end

scb.print("Loading...")

	file.CreateDir("scb")

	require("sui")
	if CLIENT then
		scb.SUI = sui.new("SCB")
	end

	load_file("libs/sh_types.lua")
	scb.mp = load_file("libs/message_pack/sh_messagepack.lua")

	load_file("sh_scb_config.lua", true)

	for _, permissions in pairs(scb.config.permissions) do
		for k, v in ipairs(permissions) do
			if v ~= true then
				permissions[v], permissions[k] = true, nil
			end
		end
	end

	if SERVER then
		for _, f in ipairs(file.Find("scb/settings/tabs/*.lua", "LUA")) do
			AddCSLuaFile("scb/settings/tabs/" .. f)
		end
	end

	load_file("cl_util.lua")
	load_file("settings/cl_settings.lua")
	load_file("sh_chatbox.lua")
	load_file("sv_chatbox.lua")
	load_file("cl_chatbox.lua")
	load_file("cl_overrides.lua")

	if SERVER then
		AddCSLuaFile("scb/cl_emojis_data.lua", "GAME")

		-- emojis need to be loaded once the player joins, so things like this https://www.gmodstore.com/market/view/4868 could break it
		local AddWorkshop = resource.OldAddWorkshop or resource.AddWorkshop
		AddWorkshop("1998633255")
	end

	for _, f in ipairs(file.Find("scb/vgui/*.lua", "LUA")) do
		load_file("vgui/" .. f, false, "cl_")
	end

scb.print("Loaded!")

SCB_LOADED = true


















































--PATH addons/chatbox/lua/scb/libs/sh_types.lua:
if SCB_LOADED then return end

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

function scb.type(value)
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
		scb["is" .. name:lower()] = function(value)
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

function scb.isentity(value)
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
scb.IsEntity = scb.isentity

local type = scb.type
function scb.istable(value)
	return type(value) == "table"
end
--PATH addons/chatbox/lua/scb/settings/tabs/emojis.lua:
if SCB_LOADED then return end

local scb = scb
local SUI = scb.SUI
local language = scb.language

scb.emojis = include("scb/cl_emojis_data.lua")

do
	local set_material = surface.SetMaterial
	local i = 0
	for name in pairs(scb.emojis) do
		timer.Simple(i * 0.001, function()
			set_material(SUI.Material("scb/emojis/" .. name .. ".png"))
		end)
		i = i + 1
	end
end

net.Receive("SCB.SendEmojis", function()
	local emojis = net.ReadData(net.ReadUInt(17))
	emojis = util.Decompress(emojis)

	for k, v in pairs(scb.mp.unpack(emojis)) do
		scb.emojis[k] = v
	end

	hook.Call("SCB.EmojisModified")
end)

net.Receive("SCB.AddEmoji", function()
	local emoji = net.ReadString()
	local url = net.ReadString()
	scb.emojis[emoji] = url

	local old = net.ReadString()
	if old ~= "" then
		scb.emojis[old] = nil
	end

	hook.Call("SCB.EmojisModified")
end)

net.Receive("SCB.RemoveEmoji", function()
	scb.emojis[net.ReadString()] = nil
	hook.Call("SCB.EmojisModified")
end)

local emoji_menu = function(title, emoji_name, emoji_url)
	emoji_name = emoji_name or ""

	local options = sui.valid_options()

	local querybox = vgui.Create("SCB.QueryBox")
	querybox:SetTitle(title)
	querybox:SetWide(300)

	local name = querybox:Add("SCB.TextEntry")
	name:Dock(TOP)
	name:SetPlaceholder(language.emoji_name)
	name:SetValue(emoji_name)
	name:SetCheck(function(_name)
		if _name == "" or (scb.emojis[_name] and emoji_name ~= _name) then
			return false
		end
	end)

	function name:AllowInput(c)
		return not c:find("[%w_]")
	end

	options.Add(name)

	local url = querybox:Add("SCB.TextEntry")
	url:Dock(TOP)
	url:DockMargin(0, 4, 0, 0)
	url:SetPlaceholder(language.emoji_url)
	url:SetValue(emoji_url or "")
	url:SetCheck(function(_url)
		if not _url:find("^https?://") then
			_url = "http://" .. _url
		end

		if scb.find_url(_url) ~= 1 then
			return false
		end
	end)

	function url:AllowInput(c)
		return c:find("%s") and true or false
	end

	options.Add(url)

	querybox:SetCallback(function()
		local _name = name:GetText():lower()
		local _url = url:GetText()

		if not _url:find("^https?://") then
			_url = "http://" .. _url
		end

		net.Start("SCB.AddEmoji")
			net.WriteString(_name)
			net.WriteString(_url)
			net.WriteString(_name ~= emoji_name and emoji_name or "")
		net.SendToServer()
	end)

	querybox:Done()
	querybox.save:SetEnabled(true)

	function querybox.save:Think()
		self:SetEnabled(options.IsValid())
	end
end

return {
	title = language.emojis_title,
	pos = 3,
	func = function(parent)
		local body = parent:Add("Panel")
		body:Dock(FILL)
		body:DockMargin(0, 1, 0, 0)
		body:InvalidateParent(true)

		SUI.OnScaleChanged(body, function()
			body:Remove()
		end)

		local top_body = body:Add("Panel")
		top_body:Dock(FILL)
		top_body:InvalidateParent(true)

		local search_field = top_body:Add("SCB.TextEntry")
		search_field:Dock(TOP)
		search_field:SetPlaceholder(language.search)

		local emojis_list = top_body:Add("SCB.ThreeGrid")
		emojis_list:Dock(FILL)
		emojis_list:DockMargin(3, 3, 3, 3)
		emojis_list:InvalidateLayout(true)
		emojis_list:InvalidateParent(true)

		emojis_list:SetColumns(3)
		emojis_list:SetHorizontalMargin(2)
		emojis_list:SetVerticalMargin(2)

		top_body.Paint, emojis_list.Paint = emojis_list.Paint, nil

		local load_emojis = function(search_key)
			emojis_list:Clear()

			search_key = search_key:lower()

			for emoji_name, v in pairs(scb.emojis) do
				if not scb.is_custom_emoji(v) then
					continue
				end

				if not string.find(emoji_name:lower(), search_key, 1, true) then
					continue
				end

				local pnl = vgui.Create("DButton")
				pnl:SetText("")
				pnl:SetTall(SUI.Scale(30))
				pnl:SUI_TDLib()
					:ClearPaint()
					:FadeHover()

				function pnl:DoClick()
					emoji_menu(language.edit .. " '" .. emoji_name .. "'", emoji_name, v)
				end

				function pnl:DoRightClick()
					local d_menu = DermaMenu()

					d_menu:AddOption(language.remove, function()
						net.Start("SCB.RemoveEmoji")
							net.WriteString(emoji_name:lower())
						net.SendToServer()
					end)

					d_menu:Open()
					d_menu:MakePopup()

					function pnl:OnRemove()
						d_menu:Remove()
					end
				end

				local emoji = pnl:Add("SCB.ChatLine")
				emoji:Dock(NODOCK)
				emoji.x = 2

				emoji:NewEmoji(emoji_name, v, 26)
				emoji:Center()
				emoji:SetMouseInputEnabled(false)

				local name = pnl:Add("SCB.Label")
				name:Dock(FILL)
				name:DockMargin(SUI.ScaleEven(26) + 8, 0, 0, 0)
				name:SetFont(SCB_16)
				name:SetText(emoji_name)

				emojis_list:AddCell(pnl)
			end
		end
		load_emojis("")

		hook.Add("SCB.EmojisModified", emojis_list, function()
			load_emojis(search_field:GetValue())
		end)

		function search_field:OnValueChange(v)
			load_emojis(v)
		end

		local add_emoji = body:Add("SCB.Button")
		add_emoji:Dock(BOTTOM)
		add_emoji:DockMargin(0, 4, 0, 0)
		add_emoji:SetText(language.add_emoji:upper())

		add_emoji:On("DoClick", function()
			emoji_menu(language.add_emoji)
		end)

		return body
	end
}
--PATH addons/chatbox/lua/scb/settings/tabs/tags.lua:
if SCB_LOADED then return end

local scb = scb
local SUI = scb.SUI
local language = scb.language

scb.tags = scb.tags or {}

net.Receive("SCB.SendTags", function()
	local tags = net.ReadData(net.ReadUInt(17))
	tags = util.Decompress(tags)
	scb.tags = scb.mp.unpack(tags)
end)

net.Receive("SCB.AddTag", function()
	local key = net.ReadString()
	local tag = net.ReadString()
	scb.tags[key] = tag

	local old = net.ReadString()

	if old ~= "" then
		scb.tags[old] = nil
	end

	hook.Call("SCB.TagsModified")
end)

net.Receive("SCB.RemoveTag", function()
	scb.tags[net.ReadString()] = nil
	hook.Call("SCB.TagsModified")
end)

local tags_menu = function(title, key, key_tag)
	key = key or ""

	local options = sui.valid_options()

	local querybox = vgui.Create("SCB.QueryBox")
	querybox:SetTitle(title)
	querybox:SetWide(300)

	local name = querybox:Add("SCB.TextEntry")
	name:Dock(TOP)
	name:SetPlaceholder(language.tag_owner)
	name:SetValue(key)

	name:SetCheck(function(_name)
		if _name == "" or (scb.tags[_name] and key ~= _name) then
			return false
		end
	end)

	options.Add(name)

	local tag = querybox:Add("SCB.TextEntry")
	tag:Dock(TOP)
	tag:DockMargin(0, 4, 0, 0)
	tag:SetPlaceholder(language.tag)
	tag:SetValue(key_tag or "")

	tag:SetCheck(function(_tag)
		return _tag ~= ""
	end)

	options.Add(tag)

	local preview = querybox:Add("SCB.ChatLine")
	preview:DockMargin(0, 6, 0, 0)
	preview.x = 3
	preview.emoji_size = 18

	preview:ScaleChanged()
	preview:Parse(tag:GetValue())
	preview:SetMouseInputEnabled(false)

	tag:On("OnValueChange", function(s, v)
		preview.added = {}
		preview:ScaleChanged()
		preview:Parse(v)
		querybox:size_to_children()
	end)

	querybox:SetCallback(function()
		net.Start("SCB.AddTag")
			net.WriteString(name:GetText())
			net.WriteString(tag:GetText())
			net.WriteString(name:GetText() ~= key and key or "")
		net.SendToServer()
	end)

	querybox:Done()
	querybox.save:SetEnabled(true)

	function querybox.save:Think()
		self:SetEnabled(options.IsValid())
	end
end

return {
	title = language.tags_title,
	pos = 2,
	func = function(parent)
		local body = parent:Add("Panel")
		body:Dock(FILL)
		body:DockMargin(0, 1, 0, 0)
		body:InvalidateParent(true)

		SUI.OnScaleChanged(body, function()
			body:Remove()
		end)

		local tags_list = body:Add("SCB.ThreeGrid")
		tags_list:Dock(FILL)
		tags_list:InvalidateLayout(true)
		tags_list:InvalidateParent(true)

		tags_list:SetColumns(2)
		tags_list:SetHorizontalMargin(2)
		tags_list:SetVerticalMargin(2)

		local load_tags = function()
			tags_list:Clear()

			for key, tag in SortedPairs(scb.tags) do
				local pnl = vgui.Create("DButton")
				pnl:SetText("")
				pnl:SetTall(SUI.Scale(560))
				pnl:SUI_TDLib()
					:ClearPaint()
					:FadeHover()

				function pnl:DoClick()
					tags_menu(language.edit .. " '" .. key .. "'", key, tag)
				end

				function pnl:DoRightClick()
					local d_menu = DermaMenu()

					d_menu:AddOption(language.remove, function()
						net.Start("SCB.RemoveTag")
							net.WriteString(key)
						net.SendToServer()
					end)

					d_menu:Open()
					d_menu:MakePopup()

					function pnl:OnRemove()
						d_menu:Remove()
					end
				end
				tags_list:AddCell(pnl)

				local name = pnl:Add("SCB.Label")
				name:Dock(TOP)
				name:SetFont(SCB_16)
				name:SetText(key)
				name:SetTextInset(3, 0)
				name:SetExpensiveShadow(1, color_black)
				name:SizeToContentsY(3)

				local _tag = pnl:Add("SCB.ChatLine")
				_tag:DockMargin(3, 0, 0, 0)
				_tag:SetFont(SCB_16)

				_tag.emoji_size = 16
				_tag:Parse(tag)
				_tag:SetMouseInputEnabled(false)

				pnl:SizeToChildren(false, true)
			end

			for k, v in ipairs(tags_list.Rows) do
				tags_list:CalculateRowHeight(v)
			end
		end
		load_tags()

		hook.Add("SCB.TagsModified", tags_list, load_tags)

		local add = body:Add("SCB.Button")
		add:Dock(BOTTOM)
		add:DockMargin(0, 4, 0, 0)
		add:SetText(language.add_tag:upper())

		add:On("DoClick", function()
			tags_menu(language.add_tag)
		end)

		return body
	end
}
--PATH lua/autorun/scorpion_player.lua:
player_manager.AddValidModel( "Pulmonoscorpius", "models/echo/ark/scorpion_pm.mdl" )
player_manager.AddValidHands( "Pulmonoscorpius", "models/weapons/c_arms_scorpion.mdl", 0, "0" )
--PATH addons/sl_util_atm/lua/batm_scenes/transfer_offline.lua:
--[[-------------------------------------------------------------------------
Enter the steamid 64 of the user you are transfering too
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
	scene.enteredAmount = "" --Reset it
 
	--done button
	ent:AddButton(ScrW/2 - 300, ScrH / 2 + 110, 600, 90, 
		function() --On pressed
			BATM.Scenes["transfer_amount"].targetPlayer = scene.enteredAmount
			BATM.Scenes["transfer_amount"].targetPlayerName = scene.enteredAmount
			ent:SetScene("transfer_amount")
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
		local stringAmount = scene.enteredAmount
		if string.len(stringAmount) > 20 then return end --Prevent overflow
		stringAmount = stringAmount..button

		scene.enteredAmount = stringAmount

		return
	end

	if button == "clear" then
		if scene.enteredAmount ~= "" then
			local stringAmount = scene.enteredAmount
			stringAmount = string.sub(stringAmount, 1, string.len(stringAmount) - 1)
			if stringAmount == nil then
				stringAmount = ""
			end
			scene.enteredAmount = stringAmount
			return
		end
	end 

	if button == "enter" then
		BATM.Scenes["transfer_amount"].targetPlayer = scene.enteredAmount
		BATM.Scenes["transfer_amount"].targetPlayerName = scene.enteredAmount
		ent:SetScene("transfer_amount")
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
	draw.SimpleText(BATM.Lang["Enter Users "], "batm_tranfer_amount_title", ScrW/2, 155, Color(233,233,233,255), 1)
	draw.SimpleText(BATM.Lang["SteamID64"], "batm_tranfer_amount_title", ScrW/2, 155 + 65, Color(233,233,233,255), 1)
	--Deposite box
	draw.RoundedBox(0, ScrW/2 - 300, ScrH / 2, 600, 90, Color(255,255,255,255))
	if scene.enteredAmount == "" then
		draw.SimpleText(BATM.Lang["Enter SteamID64"], "batm_tranfer_amount_text", ScrW/2, (ScrH/2) + 45, Color(194,194,194,255), 1, 1)
	else
		draw.SimpleText(scene.enteredAmount, "batm_tranfer_amount_text", ScrW/2, (ScrH/2) + 45, Color(194,194,194,255), 1, 1)
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
BATM.RegisterScene(scene, "transfer_offline")

--PATH lua/catmullromcams/sh_cleanup.lua:
cleanup.Register("catmullrom_cameras") -- :loleyes:
--PATH lua/catmullromcams/sh_gc_booster.lua:

if CatmullRomCams.SH.GCStarted then return end

CatmullRomCams.SH.GCStarted = true

function CatmullRomCams.SH.GarbageCollectionBooster()
	collectgarbage()
	
	return timer.Simple(30, CatmullRomCams.SH.GarbageCollectionBooster)
end
timer.Simple(30, CatmullRomCams.SH.GarbageCollectionBooster) -- Now unneeded! :4chan: But reenabled beause it's not readily noticeable and it still helps. :wink:

--PATH lua/catmullromcams/stools/sh_duration_editor.lua:
local STool = {}

CatmullRomCams.SToolMethods.DurationEditor = STool

function STool.LeftClick(self, trace)
	if not self:ValidTrace(trace) then return end
	if CLIENT then return true end
	
	local dur = self:GetClientNumber("duration") or 2
	
	if self:GetOwner():KeyDown(IN_SPEED) and CatmullRomCams.Tracks[trace.Entity.UndoData.PID][trace.Entity.UndoData.Key][trace.Entity.UndoData.TrackIndex + 1] then
		dur = CatmullRomCams.SH.UnitsToMeters(trace.Entity:GetPos():Distance(CatmullRomCams.Tracks[trace.Entity.UndoData.PID][trace.Entity.UndoData.Key][trace.Entity.UndoData.TrackIndex + 1]:GetPos())) / self:GetClientNumber("duration_mps")
	end
	
	trace.Entity:SetNWFloat("Duration", (dur > 0.001) and dur or 0.001)
	
	return true
end

function STool.RightClick(self, trace)
	if not self:ValidTrace(trace) then return end
	
	local dur = trace.Entity:GetNWFloat("Duration") or 2
	
	self:GetOwner():ConCommand("catmullrom_camera_duration_duration " .. ((dur > 0) and dur or 2) .. "\n")
	
	return true
end

function STool.Reload(self, trace)
	if not self:ValidTrace(trace) then return end
	
	trace.Entity:SetNWFloat("Duration", 2)
	
	return true
end

function STool.Think(self)
	if SERVER then return end
	
	local ply = LocalPlayer()
	local tr = ply:GetEyeTrace()
	
	if not self:ValidTrace(tr) then return end
	
	local dur = tr.Entity:GetNWFloat("Duration")
	dur = (dur ~= 0) and dur or 2
	
	AddWorldTip(tr.Entity:EntIndex(), "Duration: " .. dur, 0.5, tr.Entity:GetPos(), tr.Entity )
end

function STool.BuildCPanel(panel)
	panel:AddControl("Slider", {Label = "Node Duration: ", Type = "Float", Min = "0.001", Max = "10", Command = "catmullrom_camera_duration_duration"})
	panel:AddControl("Slider", {Label = "Node Duration, Meters Per Seconds: ", Type = "Float", Min = "0.001", Max = "10", Command = "catmullrom_camera_duration_duration_mps"})
end
--PATH lua/catmullromcams/stools/sh_hitchcock_effect.lua:
local STool = {}

CatmullRomCams.SToolMethods.HitchcockEffect = STool

local function Calc(width, end_fov)
	return (width / (2 * math.tan(math.pi * (end_fov / 360))))
end

local function MakeLabel()
	return ("Distance required for shot: " .. Calc(STool.DurationSlider:GetValue(), STool.EndFOVSlider:GetValue()) .. " Meters")
end

local function CreateNode(ply, plyID, key, pos, ang, fov, width)
	local track_index = #CatmullRomCams.Tracks[plyID][key] + 1
	print(track_index)
	local camera = ents.Create("sent_catmullrom_camera")
	if not (camera and camera.IsValid and camera:IsValid()) then return end
	
	camera:SetAngles(ang)
	camera:SetPos(pos)
	camera:Spawn()
	
	camera:SetPlayer(ply)
	
	CatmullRomCams.Tracks[plyID][key][track_index - 1]:DeleteOnRemove(camera) -- Because we don't want to have broken chains let's daisy chain them to self destruct
	CatmullRomCams.Tracks[plyID][key][track_index - 1]:SetNWEntity("ChildCamera", camera)
	
	CatmullRomCams.Tracks[plyID][key][track_index] = camera
	
	camera:SetFaceTravelDir(false)
	
	camera:SetBankOnTurn(false)
	camera:SetBankDeltaMax(1)
	camera:SetBankMultiplier(1)
	
	camera:SetZoom(fov)
	camera:SetEnableRoll(false)
	camera:SetRoll(0)
	
	camera:SetNWEntity("MasterController", CatmullRomCams.Tracks[plyID][key][1])
	
	camera.UndoData = {}
	camera.UndoData.PID = plyID
	camera.UndoData.Key = key
	camera.UndoData.TrackIndex = track_index
	
	ply:AddCleanup("catmullrom_cameras", camera)
	
	return {camera, constraint.NoCollide(camera, CatmullRomCams.Tracks[plyID][key][1], 0, 0)}
end

function STool.CheckDistances(pos, aim, dist, ply)
	local endpos = pos + (aim * (CatmullRomCams.SH.MetersToUnits(dist) * -1 - 20))
	local trace  = {}
	trace.start  = pos
	trace.endpos = endpos
	trace.mask   = MASK_NPCWORLDSTATIC
	
	trace = util.TraceLine(trace)
	
	local dist_a   = CatmullRomCams.SH.UnitsToMeters(pos:Distance(trace.HitPos))
	
	if (trace.Fraction == 1) then return true end
	print(trace.Fraction)
	print(dist_a)
	print(dist)
	print(CatmullRomCams.SH.MetersToUnits(dist) * -1 - 20)
	local TextA = "Error: You do not have enough clearance room to make this shot!"
	local TextB = "Error: Clearance is " .. math.Round(dist_a) .. " of " .. math.Round(dist) .. " meters. An additional " .. ((1 - trace.Fraction) * dist) .. " meters is required."
	
	ply:SendLua("GAMEMODE:AddNotify('" .. TextA .. "', NOTIFY_GENERIC, 10)")
	ply:SendLua("GAMEMODE:AddNotify('" .. TextB .. "', NOTIFY_GENERIC, 10)")
	
	ply:SendLua("surface.PlaySound('ambient/water/drip" .. math.random(1, 4) .. ".wav')")
end

local function UndoHitchcock(ent)
	if ent and ent.IsValid and ent:IsValid() and ent.SetHitchcockEffect then
		ent:SetHitchcockEffect(nil)
	end
end

function STool.LeftClick(self, trace)
	if not self:ValidTrace(trace) then return end
	
	local ply   = self:GetOwner()
	local plyID = ply:UniqueID()
	local pos   = trace.Entity:GetPos()
	local aim   = trace.Entity:GetForward()
	local ang   = trace.Entity:GetAngles()
	local fov   = self:GetClientNumber("endfov")
	local width = self:GetClientNumber("width")
	local dist  = Calc(width, fov)
	
	if not STool.CheckDistances(pos, aim, dist, ply) then return end
	if CLIENT then return true end
	
	local key = trace.Entity.UndoData.Key
	
	print(width)
	trace.Entity:SetHitchcockEffect(width)
	
	undo.Create("CatmullRomCamsHitchcockEffect")
		for i = 1, 2 do
			local pos = (i == 1) and (pos + (aim * CatmullRomCams.SH.MetersToUnits(dist) * -1)) or (pos + (aim * (CatmullRomCams.SH.MetersToUnits(dist) * -1 - 20)))
			local tbl = CreateNode(ply, plyID, key, pos, ang, fov, width)
			
			undo.AddEntity(tbl[1])
			undo.AddEntity(tbl[2])
		end
		
		undo.AddFunction(UndoHitchcock, trace.Entity)
		undo.SetPlayer(ply)
	undo.Finish()
	
	return true
end

function STool.RightClick(self, trace)
end

function STool.Reload(self, trace)
end

function STool.Think(self)
end

function STool.BuildCPanel(panel)
	STool.DurationSlider = panel:AddControl("Slider", {Label = "Scene Width (Meters): ",          Type = "Float", Min = "0.1", Max = "25",  Command = "catmullrom_camera_hitchcock_width"})
	STool.EndFOVSlider   = panel:AddControl("Slider", {Label = "End FOV: ", Type = "Float", Min = "0.1", Max = "110", Command = "catmullrom_camera_hitchcock_endfov"})
	STool.ETDLabel       = panel:AddControl("Label",  {Text = MakeLabel(), Description = "How much space do we need for this shot?"})
	
	function STool.DurationSlider:OnValueChanged(val)
		return STool.ETDLabel:SetText(MakeLabel())
	end
	
	function STool.EndFOVSlider:OnValueChanged(val)
		return STool.ETDLabel:SetText(MakeLabel())
	end
end
--PATH addons/sl_utils/lua/autorun/sh_legs.lua:
--[[
	   ______                    __   __                   
	  / ____/___ ___  ____  ____/ /  / /   ___  ____ ______
	 / / __/ __ `__ \/ __ \/ __  /  / /   / _ \/ __ `/ ___/
	/ /_/ / / / / / / /_/ / /_/ /  / /___/  __/ /_/ (__  ) 
	\____/_/ /_/ /_/\____/\__,_/  /_____/\___/\__, /____/  
	                                         /____/        
	@Valkyrie, @blackops7799
]]--
    
g_LegsLog =
[[
	[ADD] New VAddons Menu	
	[ADD] Support for Outfitter
	[ADD] Compat Support for VWallrun, Mantle thanks to SpiffyJUNIOR
	[FIX] Models now always rely on gmod's GetModel() due to gmod updates being more reliable now for older models
	[CHANGE] cl_vehlegs is off by default
]]

g_LegsVer = "3.10"

local PLAYER 			= FindMetaTable("Player")
local ENTITY 			= FindMetaTable("Entity")

local bHasShownNotice = false
do
	function PLAYER:GetLegModel()
        if (CLIENT) then
            if (LocalPlayer().enforce_model) then
                return LocalPlayer().enforce_model
            end
        end
		return self:GetModel()
	end
end


if (SERVER) then
    AddCSLuaFile("sh_legs.lua")
end

if (CLIENT) then
	local LegsBool      	= CreateConVar("cl_legs", "1", {FCVAR_ARCHIVE}, "Enable/Disable the rendering of the legs")
	local VLegsBool     	= CreateConVar("cl_vehlegs", "0", {FCVAR_ARCHIVE}, "Enable/Disable the rendering of the legs in vehicles")

    local Legs = {}
    Legs.LegEnt = nil

	local g_maxseqgroundspeed = 0
	local g_velocity = 0

    function Legs:CheckDrawVehicle()
        if (LocalPlayer():InVehicle()) then
			if LegsBool:GetBool() && !VLegsBool:GetBool() then
				return true
			end
			return false
        end
    end

    function ShouldDrawLegs()
        if (hook.Run("ShouldDisableLegs") == true) then 
            return false 
        end
        if LegsBool:GetBool() then
            return  IsValid(Legs.LegEnt)                                                                        &&
                    (LocalPlayer():Alive() || (LocalPlayer().IsGhosted && LocalPlayer():IsGhosted()))           &&
                    !Legs:CheckDrawVehicle()                                                                    &&
                    GetViewEntity() == LocalPlayer()                                                            &&
                    !LocalPlayer():ShouldDrawLocalPlayer()                                                      &&
                    !IsValid(LocalPlayer():GetObserverTarget())                                                 &&
                    !LocalPlayer().ShouldDisableLegs
        else
            return false
        end
    end

    function GetPlayerLegs(ply)
        return ply && ply != LocalPlayer() && ply || (ShouldDrawLegs() && Legs.LegEnt || LocalPlayer())
    end

    function Legs:SetUp()

		if (!IsValid(self.LegEnt)) then
			self.LegEnt = ClientsideModel(LocalPlayer():GetLegModel(), RENDER_GROUP_OPAQUE_ENTITY)	
		else
			self.LegEnt:SetModel(LocalPlayer():GetLegModel())
		end

        self.LegEnt:SetNoDraw(true)

		for k, v in pairs(LocalPlayer():GetBodyGroups()) do
			local current = LocalPlayer():GetBodygroup(v.id)
			self.LegEnt:SetBodygroup(v.id,  current)
		end

		for k, v in ipairs(LocalPlayer():GetMaterials()) do
			self.LegEnt:SetSubMaterial(k - 1, LocalPlayer():GetSubMaterial(k - 1))
		end

        self.LegEnt:SetSkin(LocalPlayer():GetSkin())
        self.LegEnt:SetMaterial(LocalPlayer():GetMaterial())
        self.LegEnt:SetColor(LocalPlayer():GetColor())
        self.LegEnt.GetPlayerColor = function()
            return LocalPlayer():GetPlayerColor()
        end

		self.LegEnt.Anim = nil
	   	self.PlaybackRate = 1
		self.Sequence = nil
		self.Velocity = 0
		self.OldWeapon = nil
		self.HoldType = nil

		self.BonesToRemove = {}

		self.BoneMatrix = nil

        self.LegEnt.LastTick = 0

		self:Update(g_maxseqgroundspeed)
    end

    Legs.PlaybackRate = 1
    Legs.Sequence = nil
    Legs.Velocity = 0
    Legs.OldWeapon = nil
    Legs.HoldType = nil

    Legs.BonesToRemove = {}

    Legs.BoneMatrix = nil

    function Legs:WeaponChanged(weap)
        if IsValid(self.LegEnt) then
            for i = 0, self.LegEnt:GetBoneCount() do
                self.LegEnt:ManipulateBoneScale(i, Vector(1,1,1))
                self.LegEnt:ManipulateBonePosition(i, vector_origin)
            end

            self.BonesToRemove =
            {
                "ValveBiped.Bip01_Head1",
                "ValveBiped.Bip01_L_Hand",
                "ValveBiped.Bip01_L_Forearm",
                "ValveBiped.Bip01_L_Upperarm",
                "ValveBiped.Bip01_L_Clavicle",
                "ValveBiped.Bip01_R_Hand",
                "ValveBiped.Bip01_R_Forearm",
                "ValveBiped.Bip01_R_Upperarm",
                "ValveBiped.Bip01_R_Clavicle",
                "ValveBiped.Bip01_L_Finger4",
                "ValveBiped.Bip01_L_Finger41",
                "ValveBiped.Bip01_L_Finger42",
                "ValveBiped.Bip01_L_Finger3",
                "ValveBiped.Bip01_L_Finger31",
                "ValveBiped.Bip01_L_Finger32",
                "ValveBiped.Bip01_L_Finger2",
                "ValveBiped.Bip01_L_Finger21",
                "ValveBiped.Bip01_L_Finger22",
                "ValveBiped.Bip01_L_Finger1",
                "ValveBiped.Bip01_L_Finger11",
                "ValveBiped.Bip01_L_Finger12",
                "ValveBiped.Bip01_L_Finger0",
                "ValveBiped.Bip01_L_Finger01",
                "ValveBiped.Bip01_L_Finger02",
                "ValveBiped.Bip01_R_Finger4",
                "ValveBiped.Bip01_R_Finger41",
                "ValveBiped.Bip01_R_Finger42",
                "ValveBiped.Bip01_R_Finger3",
                "ValveBiped.Bip01_R_Finger31",
                "ValveBiped.Bip01_R_Finger32",
                "ValveBiped.Bip01_R_Finger2",
                "ValveBiped.Bip01_R_Finger21",
                "ValveBiped.Bip01_R_Finger22",
                "ValveBiped.Bip01_R_Finger1",
                "ValveBiped.Bip01_R_Finger11",
                "ValveBiped.Bip01_R_Finger12",
                "ValveBiped.Bip01_R_Finger0",
                "ValveBiped.Bip01_R_Finger01",
                "ValveBiped.Bip01_R_Finger02",
                "ValveBiped.Bip01_Spine4",
                "ValveBiped.Bip01_Spine2",
            }

			if ( LocalPlayer():InVehicle() ) then
				self.BonesToRemove =
          	  	{
               		"ValveBiped.Bip01_Head1",
				}
			end

            for k, v in pairs(self.BonesToRemove) do
                local bone = self.LegEnt:LookupBone(v)
                if (bone) then
                    self.LegEnt:ManipulateBoneScale(bone, Vector(0,0,0))
                   	if ( !LocalPlayer():InVehicle() ) then
						self.LegEnt:ManipulateBonePosition(bone, Vector(0,-100,0))
						self.LegEnt:ManipulateBoneAngles(bone, Angle(0,0,0))
					end
                end
            end
        end
    end

    Legs.BreathScale = 0.5
    Legs.NextBreath = 0

    function Legs:Think(maxseqgroundspeed)
        if not LocalPlayer():Alive() then
            Legs:SetUp()
            return
        end

		self:Update(maxseqgroundspeed)
    end

	function Legs:Update(maxseqgroundspeed)
        if IsValid(self.LegEnt) then
            self:WeaponChanged(LocalPlayer():GetActiveWeapon())

            self.Velocity = LocalPlayer():GetVelocity():Length2D()

            self.PlaybackRate = 1

            if self.Velocity > 0.5 then
                if maxseqgroundspeed < 0.001 then
                    self.PlaybackRate = 0.01
                else
                    self.PlaybackRate = self.Velocity / maxseqgroundspeed
                    self.PlaybackRate = math.Clamp(self.PlaybackRate, 0.01, 10)
                end
            end

            self.LegEnt:SetPlaybackRate(self.PlaybackRate)

            self.Sequence = LocalPlayer():GetSequence()

            if (self.LegEnt.Anim != self.Sequence) then
                self.LegEnt.Anim = self.Sequence
                self.LegEnt:ResetSequence(self.Sequence)
            end

            self.LegEnt:FrameAdvance(CurTime() - self.LegEnt.LastTick)
            self.LegEnt.LastTick = CurTime()

            Legs.BreathScale = sharpeye && sharpeye.GetStamina && math.Clamp(math.floor(sharpeye.GetStamina() * 5 * 10) / 10, 0.5, 5) || 0.5

            if Legs.NextBreath <= CurTime() then
                Legs.NextBreath = CurTime() + 1.95 / Legs.BreathScale
                self.LegEnt:SetPoseParameter("breathing", Legs.BreathScale)
            end

            self.LegEnt:SetPoseParameter("move_x", (LocalPlayer():GetPoseParameter("move_x") * 2) - 1) -- Translate the walk x direction
            self.LegEnt:SetPoseParameter("move_y", (LocalPlayer():GetPoseParameter("move_y") * 2) - 1) -- Translate the walk y direction
            self.LegEnt:SetPoseParameter("move_yaw", (LocalPlayer():GetPoseParameter("move_yaw") * 360) - 180) -- Translate the walk direction
            self.LegEnt:SetPoseParameter("body_yaw", (LocalPlayer():GetPoseParameter("body_yaw") * 180) - 90) -- Translate the body yaw
            self.LegEnt:SetPoseParameter("spine_yaw",(LocalPlayer():GetPoseParameter("spine_yaw") * 180) - 90) -- Translate the spine yaw

            if LocalPlayer():InVehicle() then
                self.LegEnt:SetPoseParameter("vehicle_steer", (LocalPlayer():GetVehicle():GetPoseParameter("vehicle_steer") * 2) - 1) -- Translate the vehicle steering
            end
        end
	end

    hook.Add("UpdateAnimation", "GML:UpdateAnimation", function(ply, velocity, maxseqgroundspeed)
        if ply == LocalPlayer() then
            if IsValid(Legs.LegEnt) then
                Legs:Think(maxseqgroundspeed)
				if (string.lower(LocalPlayer():GetLegModel()) != string.lower(Legs.LegEnt:GetModel())) then
                    Legs:SetUp()
				end
            else
				Legs:SetUp()
			end
        end
    end)

    Legs.RenderAngle = nil
    Legs.BiaisAngle = nil
    Legs.RadAngle = nil
    Legs.RenderPos = nil
    Legs.RenderColor = {}
    Legs.ClipVector = vector_up * -1
    Legs.ForwardOffset = -24

	function Legs:DoFinalRender()
	   cam.Start3D(EyePos(), EyeAngles())
            if ShouldDrawLegs() then

                if (LocalPlayer():Crouching() || LocalPlayer():InVehicle()) then
                    self.RenderPos = LocalPlayer():GetPos()
                else
                    self.RenderPos = LocalPlayer():GetPos() + Vector(0,0,5)
                end

                if LocalPlayer():InVehicle() then
                    self.RenderAngle = LocalPlayer():GetVehicle():GetAngles()
                    self.RenderAngle:RotateAroundAxis(self.RenderAngle:Up(), 90)
                else
                    self.BiaisAngles = sharpeye_focus && sharpeye_focus.GetBiaisViewAngles && sharpeye_focus:GetBiaisViewAngles() || LocalPlayer():EyeAngles()
                    self.RenderAngle = Angle(0, self.BiaisAngles.y, 0)
                    self.RadAngle = math.rad(self.BiaisAngles.y)
                    self.ForwardOffset = -22
                    self.RenderPos.x = self.RenderPos.x + math.cos(self.RadAngle) * self.ForwardOffset
                    self.RenderPos.y = self.RenderPos.y + math.sin(self.RadAngle) * self.ForwardOffset

                    if LocalPlayer():GetGroundEntity() == NULL then
                        self.RenderPos.z = self.RenderPos.z + 8
                        if LocalPlayer():KeyDown(IN_DUCK) then
                            self.RenderPos.z = self.RenderPos.z - 28
                        end
                    end
                end

                self.RenderColor = LocalPlayer():GetColor()

                local bEnabled = render.EnableClipping(true)
                    render.PushCustomClipPlane(self.ClipVector, self.ClipVector:Dot(EyePos()))
                        render.SetColorModulation(self.RenderColor.r / 255, self.RenderColor.g / 255, self.RenderColor.b / 255)
                            render.SetBlend(self.RenderColor.a / 255)
                                    self.LegEnt:SetRenderOrigin(self.RenderPos)
                                    self.LegEnt:SetRenderAngles(self.RenderAngle)
                                    self.LegEnt:SetupBones()
                                    self.LegEnt:DrawModel()
									self.LegEnt:SetRenderOrigin()
                                    self.LegEnt:SetRenderAngles()
                            render.SetBlend(1)
                        render.SetColorModulation(1, 1, 1)
                    render.PopCustomClipPlane()
                render.EnableClipping(bEnabled)
            end
        cam.End3D()
	end

	hook.Add("PostDrawTranslucentRenderables", "GML:Render::Foot", function()
		 if (LocalPlayer() && !LocalPlayer():InVehicle()) then
			Legs:DoFinalRender()
        end
    end)

	hook.Add("RenderScreenspaceEffects", "GML:Render::Vehicle", function()
		 if (LocalPlayer():InVehicle()) then
			Legs:DoFinalRender()
        end
    end)

    concommand.Add("cl_togglelegs", function()
        if LegsBool:GetBool() then
            RunConsoleCommand("cl_legs", "0")
        else
            RunConsoleCommand("cl_legs", "1")
        end
    end)

	concommand.Add("cl_togglevlegs", function()
        if VLegsBool:GetBool() then
            RunConsoleCommand("cl_vehlegs", "0")
        else
            RunConsoleCommand("cl_vehlegs", "1")
        end
    end)

	concommand.Add("cl_refreshlegs", function()
		Legs:SetUp()
    end)

    g_Legs = Legs

    function SetupLegs()
        g_Legs:SetUp()
    end
end
--PATH addons/realistichandcuffs/lua/tbfy_rhandcuffs/languages/danish.lua:
//Translated by: Happy Blotter og hul i l�gposen http://steamcommunity.com/profiles/76561198125716412/
RHandcuffsConfig.Language =  RHandcuffsConfig.Language or {}
RHandcuffsConfig.Language["Danish"] = {
CuffedBy = "Du er blevet sat i h�ndjern af: %s",
Cuffer = "Du har nu sat h�ndjern p� %s.",
ReleasedBy = "Du er nu blevet l�sladt af: %s",
Releaser = "Du har nu l�sladt %s.",
 
CantEnterVehicle = "Du kan ikke stige ind i bilen, n�r du er l�nket!",
CantLeaveVehicle = "Du kan ikke stige ud af bilen, n�r du er l�nket!",
CantSpawnProps = "Du kan ikke s�tte props, n�r du er l�nket!",
CantChangeTeam = "Du kan ikke skifte team, n�r du er l�nket!.",
CantSwitchSeat = "Du kan ikke skifte s�de, n�r du er l�nket!",
 
ConfiscateReward = "Du blev bel�nnet med $%s for at konfiskere et v�ben.",
ArrestReward = "Du blev bel�nnet med $%s for at arrestere %s.",
AlreadyArrested = "Denne spiller er allerede arresteret!",
MustBeCuffed = "Spilleren skal v�re l�nket f�r du kan arrestere ham!",
ReqLockpick = "Lockpick h�ndjernet, for at kunne l�slade denne spiller!",
 
PlayerPutInDriver = "Player was put in driver seat.",
CantCuffRestrained = "Du kan ikke l�nke en tilbageholdt spiller.",
NoSeats = "Ingen s�der til r�dighed!",
CuffingText = "L�nker %s",
TazedPlayer = "Elektrificeret spiller",
 
CuffedText = "Du er l�nket!",
SurrenderedText = "Du har overgivet dig selv!",
}

--PATH addons/tlib/lua/tlib/client/derma/combobox.lua:
local PANEL = {}

--[[

    PANEL:Init

]]--

function PANEL:Init()
    self.iMargin, self.iRoundness = TLib:ScaleVGUI()

    self:SetFont( "TLib.Small" )
    self:SetTextColor( TLib:C( 2 ) )

    self.tBgColor = TLib:C( 1 )
    self.tBgHColor = TLib:C( 1 )
    self.tBoxColor = self.tBgColor

    self.fLerpHover = 0

    self.DropButton:SetVisible( true )
end

--[[

    PANEL:DoClick

]]--

function PANEL:DoClick()
    TLib:Play2DSound( "tlib/click_01.mp3" )

    if self:IsMenuOpen() then
        self:CloseMenu()
        return
    end

    self:OpenMenu()

    local dMenu = self.Menu
    if not IsValid( dMenu ) then
        return
    end

    local iMargin = self.iMargin
    local iRoundness = self.iRoundness

    -- Menu
    local iX, iH = dMenu:GetPos()
    dMenu:SetPos( iX, ( iH + 3 ) )

    function dMenu:Paint( iW, iH )
        surface.SetDrawColor( TLib:C( 0 ) )
        self:DrawFilledRect()

        surface.SetDrawColor( TLib:C( 1 ) )
        surface.DrawOutlinedRect( 0, 0, iW, iH )
    end

    -- VBar
    local dVBar = dMenu:GetVBar()
    dVBar:SetWidth( ScrH() * .008 )
    dVBar:SetHideButtons( true )
    
    function dVBar:Paint( iW, iH )
        surface.SetDrawColor( dPanel.tBgColor )
        self:DrawFilledRect()
    end

    function dVBar.btnGrip:Paint( iW, iH )
        surface.SetDrawColor( dPanel.tGripColor )
        self:DrawFilledRect()
    end

    -- Menu canvas
    for k, v in pairs( dMenu:GetCanvas():GetChildren() ) do
        v:SetTextColor( TLib:C( 5 ) )
        v:SetFont( self:GetFont() )
        v:SetTextInset( iMargin, 0 )
        v.fLerp = 0
    
        function v:DoClickInternal()
            TLib:Play2DSound( "tlib/click_01.mp3" )
        end

        function v:Paint( iW, iH )
            v.fLerp = Lerp( RealFrameTime() * 12, v.fLerp, self.Hovered and ( iW - 2 ) or 0 )
            if ( v.fLerp < 1 ) then
                return
            end

            surface.SetDrawColor( TLib:C( 2 ) )
            surface.DrawRect( 1, 1, v.fLerp, ( iH - 2 ) )
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

    PANEL:SetBgHoverColor

]]--

function PANEL:SetBgHoverColor( tColor )
    self.tBgHColor = tColor
end

--[[

    PANEL:Paint

]]--

function PANEL:Paint( iW, iH )
    surface.SetDrawColor( self.tBoxColor )
    self:DrawFilledRect()

    if self.Hovered then
        self.fLerpHover = Lerp( RealFrameTime() * 12, self.fLerpHover, ( self.Hovered and iW or 0 ) )
        self:SetTextColor( TLib:C( 5 ) )
    else
        self.fLerpHover = Lerp( RealFrameTime() * 12, self.fLerpHover, 0 )
        self:SetTextColor( TLib:C( 2 ) )
    end

    if ( self.fLerpHover > 0 ) then
        surface.SetDrawColor( TLib:C( 2 ) )
        surface.DrawRect( math.ceil( ( iW - self.fLerpHover ) * .5 ), 0, self.fLerpHover, iH )
    end

    if self:IsMenuOpen() or self.bHighlight then
        if not self.bSelected then
            self:SetTextColor( TLib:C( 5 ) )
            self.tBoxColor = self.tBgHColor
            self.bSelected = true
        end

        return
    end

    if self.bSelected then
        self:SetTextColor( TLib:C( 2 ) )
        self.tBoxColor = self.tBgColor
        self.bSelected = nil
    end
end

-- Register VGUI element
vgui.Register( "TLComboBox", PANEL, "DComboBox" )
PANEL = nil
--PATH addons/simplistic_presentation/lua/simplistic_presentation/languages/lang_en.lua:
SimplisticPresentation.Language["en"] = {

    ["Unknown"] = "Unknown",
    ["IntroduceYourself"] = "Introduce yourself",

    ["IntroduceNotify:Sender"] = "You introduced yourself to %s !",
    ["IntroduceNotify:Receiver"] = "%s introduced himself to you !",

    ["CopyIdentifier"] = "An identifier has been added to your clipboard !",

    ["ManagePanel:MainText"] = "Manage Relationships",
    ["ManagePanel:CopyIdentifier"] = "%s's SteamID64 has been added to your clipboard !",
    ["ManagePanel:ForgotIdentity"] = "You forgot %s's identity !",
    ["ManagePanel:NoData"] = "You don't know anyone's identity !",

    ["AdminMenu:MainText"] = "Acquaintance Menu",
    ["AdminMenu:SelectPlayer"] = "Select a player",
    ["AdminMenu:RemoveKnownPlayer"] = "%s no longer knows %s's identity !",

    ["AdminMenu:SearchText"] = "Search...",
    ["AdminMenu:NothingFound"] = "No relationship found !",

    ["AdminMode:Activated"] = "Administration mode activated !",
    ["AdminMode:Disabled"] = "Administration mode disabled !",

}
--PATH addons/sl_main_system/lua/autorun/sl_config_inventaire.lua:
-- sh

INV_SL = {
-- ============================================================================================
-- ============================================================================================
--[[

            -   RESOURCE

]]--
-- ============================================================================================
-- ============================================================================================

    ["minerai"] = {
        model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
        type = "item",
        classe = "none",
        scale = 1,
        sellprice = 500000,
        name = "Minerai de Mana",
    },
    ["crystal"] = {
        model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
        type = "item",
        classe = "none",
        scale = 1,
        sellprice = 750000,
        name = "Crystal Blanc",
    },
    ["crystal2"] = {
        model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
        type = "item",
        classe = "none",
        scale = 1,
        sellprice = 3000000,
        name = "Crystal Bleu",
    },
    ["crystal3"] = {
        model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
        type = "item",
        classe = "none",
        scale = 1,
        sellprice = 15000000,
        name = "Crystal Rouge",
    },
    ["crystal4"] = {
        model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
        type = "item",
        classe = "none",
        scale = 1,
        sellprice = 25000000,
        name = "Crystal Violet",
    },

    ["bois"] = {
        model = "models/sterling/crafting_wood.mdl",
        type = "resources",
        classe = "none",
        scale = 1,
        name = "Bois",
    },
    ["fer"] = {
        model = "models/sterling/crafting_metal.mdl",
        type = "resources",
        classe = "none",
        scale = 1,
        price = 100000,
        name = "Fer",
    },


    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   ARMURE

    ]]--
    -- ============================================================================================
    -- ============================================================================================
    ["tenuecivil1"] = {
        model = "models/mad_models/mad_sl_male_civil2.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_civil2.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor13.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 500000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue Civil",
    },
    ["tenuecivil3"] = {
        model = "models/mad_models/mad_sl_male_civil2.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_civil3.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_civil3.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 100000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = true,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue Civil 3",
    },
    ["culte"] = {
        model = "models/mad_models/mad_sl_male_armor31.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor31.mdl",
        playermodel_female = "models/mad_models/mad_sl_male_armor31.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 100000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = true,
        theteam = TEAM_CULTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue du Culte",
    },
    ["association"] = {
        model = "models/mad_models/mad_sl_male_armor29.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor29.mdl",
        playermodel_female = "models/mad_models/mad_sl_male_armor29.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_CULTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue de l'Association",
    },
    ["associationf"] = {
        model = "models/mad_models/mad_sl_female_armor16.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_female_armor16.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor16.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_CULTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue de l'Association (F)",
    },
    ["armure1"] = {
        model = "models/mad_models/mad_sl_male_civil3.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor1.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor1.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 5000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure en Fer",
    },
    ["armure2"] = {
        model = "models/mad_models/mad_sl_male_armor3.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor3.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor5.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 15000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure en Acier",
    },
    ["armure3"] = {
        model = "models/mad_models/mad_sl_male_armor3.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor3.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor9.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 50000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure en Acier Renforcé",
    },
    ["armure4"] = {
        model = "models/mad_models/mad_sl_male_armor2.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor2.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor3.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 50000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Lourde",
    },
    ["armure5"] = {
        model = "models/mad_models/mad_sl_male_armor22.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor22.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor8.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 100000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure de Chasseur",
    },
    ["armure5"] = {
        model = "models/mad_models/mad_sl_male_armor21.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor21.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor2.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 150000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure robuste",
    },
    ["armure6"] = {
        model = "models/mad_models/mad_sl_male_armor23.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor23.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor11.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 200000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Chevaleresque",
    },
    ["armure7"] = {
        model = "models/mad_models/mad_sl_male_armor12.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor12.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor14.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 300000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Tactique",
    },
    ["armure8"] = {
        model = "models/mad_models/mad_sl_male_armor8.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor8.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor4.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 350000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Élégante",
    },
    ["armure8"] = {
        model = "models/mad_models/mad_sl_male_armor9.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor9.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor10.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 400000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Mystique",
    },
    ["armure9"] = {
        model = "models/mad_models/mad_sl_male_armor27.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor27.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor15.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 450000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Antique",
    },
    ["armure10"] = {
        model = "models/mad_models/mad_sl_male_armor6.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor6.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor6.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 500000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Légère",
    },
    ["armure11"] = {
        model = "models/mad_models/mad_sl_male_armor24.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor24.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor12.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 800000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Armure Noble",
    },
    ["armure12"] = {
        model = "models/mad_models/mad_sl_male_armor24.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/vaelyn/man_solo_leveling_vaelyn_113.mdl",
        playermodel_female = "models/vaelyn/women_solo_leveling_vaelyn_49.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 10000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue décontractée",
    },
    ["armure13"] = {
        model = "models/mad_models/mad_sl_male_armor24.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/vaelyn/man_solo_leveling_vaelyn_159.mdl",
        playermodel_female = "models/vaelyn/women_solo_leveling_vaelyn_42.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 5000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue du novice",
    },
    ["karina"] = {
        model = "    models/vaelyn/women_solo_leveling_vaelyn_85.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/vaelyn/women_solo_leveling_vaelyn_85.mdl",
        playermodel_female = "models/vaelyn/women_solo_leveling_vaelyn_85.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Karina",
    },
    ["oka"] = {
        model = "models/mad_models/mad_sl_male_armor11.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/mad_models/mad_sl_male_armor11.mdl",
        playermodel_female = "models/mad_models/mad_sl_female_armor1.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "oka sama UwU",
    },
    ["mage"] = {
        model = "models/buellost_model/buellost_choi.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/buellost_model/buellost_choi.mdl",
        playermodel_female = "models/buellost_model/buellost_choi.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Tenue de mage",
    },
    ["absalom"] = {
        model = "models/vaelyn/man_solo_leveling_vaelyn_60.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/vaelyn/man_solo_leveling_vaelyn_60.mdl",
        playermodel_female = "models/vaelyn/man_solo_leveling_vaelyn_60.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "Absalom",
    },
    ["folowz"] = {
        model = "models/reiko/wutheringwaves/RoverMalePM.mdl",
        type = "armure",
        swep = "",
        playermodel_male = "models/reiko/wutheringwaves/RoverMalePM.mdl",
        playermodel_female = "models/reiko/wutheringwaves/RoverMalePM.mdl",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 0.1,
        price = 0,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Lingot de Fer"] = 12,
        },
        name = "folowz",
    },
    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   baton mage

    ]]--
    -- ============================================================================================
    -- ============================================================================================
    ["mad_baton1"] = {
        model = "models/mad_worldmodel/baton12.mdl",
        type = "arme",
        swep = "mad_baton1",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 500000,
        isforaspecialclass = true,
        classe = {
            ["mage"] = true,
            ["sage"] = true,
            ["archi_mage"] = true,
            ["healer"] = true,
            ["pretre"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Balet",
    },
    ["mad_baton2"] = {
        model = "models/mad_worldmodel/baton2.mdl",
        type = "arme",
        swep = "mad_baton2",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1500000,
        isforaspecialclass = true,
        classe = {
            ["mage"] = true,
            ["sage"] = true,
            ["archi_mage"] = true,
            ["healer"] = true,
            ["pretre"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baguette naturelle",
    },
    ["mad_baton3"] = {
        model = "models/mad_worldmodel/baton4.mdl",
        type = "arme",
        swep = "mad_baton3",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 10000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Petit baton",
    },
    ["mad_baton4"] = {
        model = "models/mad_worldmodel/baton5.mdl",
        type = "arme",
        swep = "mad_baton4",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 20000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Gros baton",
    },
    ["mad_baton5"] = {
        model = "models/mad_worldmodel/baton1.mdl",
        type = "arme",
        swep = "mad_baton5",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 35000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton saint",
    },
    ["mad_baton6"] = {
        model = "models/mad_worldmodel/baton11.mdl",
        type = "arme",
        swep = "mad_baton6",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  45000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton geler",
    },
    ["mad_baton7"] = {
        model = "models/mad_worldmodel/baton13.mdl",
        type = "arme",
        swep = "mad_baton7",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  10000000,
        isforaspecialclass = true,
        classe = {
            ["mage"] = true,
            ["sage"] = true,
            ["archi_mage"] = true,
            ["healer"] = true,
            ["pretre"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton en or",
    },
    ["mad_baton8"] = {
        model = "models/mad_worldmodel/baton15.mdl",
        type = "arme",
        swep = "mad_baton8",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  75000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton maudit",
    },
    ["mad_baton9"] = {
        model = "models/mad_worldmodel/baton16.mdl",
        type = "arme",
        swep = "mad_baton9",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 90000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton noir",
    },
    ["mad_baton10"] = {
        model = "models/mad_worldmodel/baton6.mdl",
        type = "arme",
        swep = "mad_baton10",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 110000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton royal",
    },
    
    ["mad_baton11"] = {
        model = "models/mad_worldmodel/baton8.mdl",
        type = "arme",
        swep = "mad_baton11",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 130000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton flamboyant",
    },
    ["mad_baton12"] = {
        model = "models/mad_worldmodel/baton10.mdl",
        type = "arme",
        swep = "mad_baton12",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 160000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Parapluie",
    },
    ["mad_baton13"] = {
        model = "models/mad_worldmodel/baton14.mdl",
        type = "arme",
        swep = "mad_baton13",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 185000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton céleste",
    },
    ["mad_baton14"] = {
        model = "models/mad_worldmodel/baton9.mdl",
        type = "arme",
        swep = "mad_baton14",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 215000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton marguerite",
    },
    ["mad_baton15"] = {
        model = "models/mad_worldmodel/baton7.mdl",
        type = "arme",
        swep = "mad_baton15",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton de combat",
    },
    ["mad_baton16"] = {
        model = "models/mad_worldmodel/baton18.mdl",
        type = "arme",
        swep = "mad_baton16",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 500000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton avec catalyseur",
    },
    ["mad_baton17"] = {
        model = "models/mad_worldmodel/baton20.mdl",
        type = "arme",
        swep = "mad_baton17",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 700000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton Floral",
    },
    ["mad_baton18"] = {
        model = "models/mad_worldmodel/baton23.mdl",
        type = "arme",
        swep = "mad_baton18",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 900000000,
        isforaspecialclass = true,
        classe = "mage",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton a cloche",
    },
    ["mad_baton19"] = {
        model = "models/mad_worldmodel/baton25.mdl",
        type = "arme",
        swep = "mad_baton19",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1200000000,
        isforaspecialclass = true,
        classe = {
            ["mage"] = true,
            ["sage"] = true,
            ["archi_mage"] = true,
            ["healer"] = true,
            ["pretre"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Baton Glaciale",
    },
    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   Marteau

    ]]--
    -- ============================================================================================
    -- ============================================================================================
    ["mad_marteau1"] = {
        model = "models/mad_worldmodel/marteau9.mdl",
        type = "arme",
        swep = "mad_marteau1",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 500000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau en fer poli",
    },
    ["mad_marteau2"] = {
        model = "models/mad_worldmodel/marteau2.mdl",
        type = "arme",
        swep = "mad_marteau2",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1500000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau en fer fine",
    },
    ["mad_marteau3"] = {
        model = "models/mad_worldmodel/marteau3.mdl",
        type = "arme",
        swep = "mad_marteau3",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 10000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau en fer précieux",
    },
    ["mad_marteau4"] = {
        model = "models/mad_worldmodel/marteau8.mdl",
        type = "arme",
        swep = "mad_marteau4",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 20000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau en fer aiguisé",
    },
    ["mad_marteau5"] = {
        model = "models/mad_worldmodel/marteau7.mdl",
        type = "arme",
        swep = "mad_marteau5",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 35000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau du Crépuscule",
    },
    ["mad_marteau6"] = {
        model = "models/mad_worldmodel/marteau6.mdl",
        type = "arme",
        swep = "mad_marteau6",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  45000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau Elementaire",
    },
    ["mad_marteau7"] = {
        model = "models/mad_worldmodel/marteau12.mdl",
        type = "arme",
        swep = "mad_marteau7",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  10000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau en fer doré",
    },
    ["mad_marteau8"] = {
        model = "models/mad_worldmodel/marteau5.mdl",
        type = "arme",
        swep = "mad_marteau8",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  75000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Marteau en or noir",
    },
    ["mad_marteau9"] = {
        model = "models/mad_worldmodel/axe7.mdl",
        type = "arme",
        swep = "mad_marteau9",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 90000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache en pierre",
    },
    ["mad_marteau10"] = {
        model = "models/mad_worldmodel/axe5.mdl",
        type = "arme",
        swep = "mad_marteau10",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 110000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache épuré",
    },
    
    ["mad_marteau11"] = {
        model = "models/mad_worldmodel/axe6.mdl",
        type = "arme",
        swep = "mad_marteau11",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 130000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache en or épuré",
    },
    ["mad_marteau12"] = {
        model = "models/mad_worldmodel/axe3.mdl",
        type = "arme",
        swep = "mad_marteau12",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 160000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = fasle,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache scellé",
    },
    ["mad_marteau13"] = {
        model = "models/mad_worldmodel/axe11.mdl",
        type = "arme",
        swep = "mad_marteau13",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 185000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache volcanique",
    },
    ["mad_marteau14"] = {
        model = "models/mad_worldmodel/axe2.mdl",
        type = "arme",
        swep = "mad_marteau14",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 50000000,
        isforaspecialclass = true,
        classe = {
            ["tank"] = true,
            ["gardien"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache Royal",
    },
    ["mad_marteau15"] = {
        model = "models/mad_worldmodel/axe8.mdl",
        type = "arme",
        swep = "mad_marteau15",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache en fusion",
    },
    ["mad_marteau16"] = {
        model = "models/mad_worldmodel/axe4.mdl",
        type = "arme",
        swep = "mad_marteau16",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 285000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache Blue Marine",
    },
    ["mad_marteau17"] = {
        model = "models/mad_worldmodel/axe10.mdl",
        type = "arme",
        swep = "mad_marteau17",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache Démoniaque",
    },
    ["mad_marteau18"] = {
        model = "models/mad_worldmodel/axe12.mdl",
        type = "arme",
        swep = "mad_marteau18",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 325000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Hache Courbé",
    },
    ["mad_marteau19"] = {
        model = "models/mad_worldmodel/enormeepee10.mdl",
        type = "arme",
        swep = "mad_marteau19",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 525000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Vieille Armorslayer",
    },
    ["mad_marteau20"] = {
        model = "models/mad_worldmodel/enormeepee11.mdl",
        type = "arme",
        swep = "mad_marteau20",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 725000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Armorslayer en Pierre",
    },
    ["mad_marteau21"] = {
        model = "models/mad_worldmodel/enormeepee15.mdl",
        type = "arme",
        swep = "mad_marteau21",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 925000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Armorslayer Sauvage",
    },
    ["mad_marteau22"] = {
        model = "models/mad_worldmodel/enormeepee7.mdl",
        type = "arme",
        swep = "mad_marteau22",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1125000000,
        isforaspecialclass = true,
        classe = "tank",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Armorslayer Royale",
    },
    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   Dague assassin

    ]]--
    -- ============================================================================================
    -- ============================================================================================
    ["mad_dague1"] = {
        model = "models/mad_worldmodel/dague23.mdl",
        type = "arme",
        swep = "mad_dague1",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 500000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en fer poli",
    },
    ["mad_dague2"] = {
        model = "models/mad_worldmodel/dague27.mdl",
        type = "arme",
        swep = "mad_dague2",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1500000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en fer fine",
    },
    ["mad_dague3"] = {
        model = "models/mad_worldmodel/dague30.mdl",
        type = "arme",
        swep = "mad_dague3",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 10000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en fer précieuse",
    },
    ["mad_dague4"] = {
        model = "models/mad_worldmodel/dague18.mdl",
        type = "arme",
        swep = "mad_dague4",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 20000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en fer aiguisé",
    },
    ["mad_dague5"] = {
        model = "models/mad_worldmodel/dague4.mdl",
        type = "arme",
        swep = "mad_dague5",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 35000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague du Crépuscule",
    },
    ["mad_dague6"] = {
        model = "models/mad_worldmodel/dague10.mdl",
        type = "arme",
        swep = "mad_dague6",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  45000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Flamboyante",
    },
    ["mad_dague7"] = {
        model = "models/mad_worldmodel/dague16.mdl",
        type = "arme",
        swep = "mad_dague7",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  10000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en fer doré",
    },
    ["mad_dague8"] = {
        model = "models/mad_worldmodel/dague26.mdl",
        type = "arme",
        swep = "mad_dague8",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  75000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en or noir",
    },
    ["mad_dague9"] = {
        model = "models/mad_worldmodel/dague17.mdl",
        type = "arme",
        swep = "mad_dague9",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 90000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en or",
    },
    ["mad_dague10"] = {
        model = "models/mad_worldmodel/dague36.mdl",
        type = "arme",
        swep = "mad_dague10",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 110000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague épuré",
    },
    
    ["mad_dague11"] = {
        model = "models/mad_worldmodel/dague21.mdl",
        type = "arme",
        swep = "mad_dague11",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 130000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en or épuré",
    },
    ["mad_dague12"] = {
        model = "models/mad_worldmodel/dague14.mdl",
        type = "arme",
        swep = "mad_dague12",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 160000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague scellé",
    },
    ["mad_dague13"] = {
        model = "models/mad_worldmodel/dague31.mdl",
        type = "arme",
        swep = "mad_dague13",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 185000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en améthyste",
    },
    ["mad_dague14"] = {
        model = "models/mad_worldmodel/dague34.mdl",
        type = "arme",
        swep = "mad_dague14",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 50000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Royal",
    },
    ["mad_dague15"] = {
        model = "models/mad_worldmodel/dague9.mdl",
        type = "arme",
        swep = "mad_dague15",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague de Pirate",
    },
    ["mad_dague16"] = {
        model = "models/mad_worldmodel/dague1.mdl",
        type = "arme",
        swep = "mad_dague16",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 285000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Blue Marine",
    },
    ["mad_dague17"] = {
        model = "models/mad_worldmodel/dague29.mdl",
        type = "arme",
        swep = "mad_dague17",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Démoniaque",
    },
    ["mad_dague18"] = {
        model = "models/mad_worldmodel/dague6.mdl",
        type = "arme",
        swep = "mad_dague18",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 325000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Courbé",
    },
    ["mad_dague19"] = {
        model = "models/mad_worldmodel/dague19.mdl",
        type = "arme",
        swep = "mad_dague19",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 525000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Sanglante",
    },
    ["mad_dague20"] = {
        model = "models/mad_worldmodel/dague20.mdl",
        type = "arme",
        swep = "mad_dague20",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 725000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Antique",
    },
    ["mad_dague21"] = {
        model = "models/mad_worldmodel/dague22.mdl",
        type = "arme",
        swep = "mad_dague21",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 925000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague en Rubis",
    },
    ["mad_dague22"] = {
        model = "models/mad_worldmodel/dague28.mdl",
        type = "arme",
        swep = "mad_dague22",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1125000000,
        isforaspecialclass = true,
        classe = {
            ["assassin"] = true,
            ["exécuteur"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Dague Draconique",
    },
    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   Mad Epee

    ]]--
    -- ============================================================================================
    -- ============================================================================================
    ["mad_epee1"] = {
        model = "models/mad_worldmodel/sword8.mdl",
        type = "arme",
        swep = "mad_epee1",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 500000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en fer poli",
    },
    ["mad_epee2"] = {
        model = "models/mad_worldmodel/sword31.mdl",
        type = "arme",
        swep = "mad_epee2",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1500000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en fer fine",
    },
    ["mad_epee3"] = {
        model = "models/mad_worldmodel/sword32.mdl",
        type = "arme",
        swep = "mad_epee3",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 10000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en fer précieuse",
    },
    ["mad_epee4"] = {
        model = "models/mad_worldmodel/sword15.mdl",
        type = "arme",
        swep = "mad_epee4",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 20000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en fer aiguisé",
    },
    ["mad_epee5"] = {
        model = "models/mad_worldmodel/sword12.mdl",
        type = "arme",
        swep = "mad_epee5",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 35000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée du Crépuscule",
    },
    ["mad_epee6"] = {
        model = "models/mad_worldmodel/petitsword3.mdl",
        type = "arme",
        swep = "mad_epee6",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  45000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Flamboyante",
    },
    ["mad_epee7"] = {
        model = "models/mad_worldmodel/sword7.mdl",
        type = "arme",
        swep = "mad_epee7",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  10000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en fer doré",
    },
    ["mad_epee8"] = {
        model = "models/mad_worldmodel/sword6.mdl",
        type = "arme",
        swep = "mad_epee8",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price =  75000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en or noir",
    },
    ["mad_epee9"] = {
        model = "models/mad_worldmodel/sword4.mdl",
        type = "arme",
        swep = "mad_epee9",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 90000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en or",
    },
    ["mad_epee10"] = {
        model = "models/mad_worldmodel/sword30.mdl",
        type = "arme",
        swep = "mad_epee10",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 110000000,
        isforaspecialclass = true,
        classe = {
            ["guerrier"] = true,
            ["guerrier_lourd"] = true,
            ["chevalier"] = true,
        },
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = false,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée épuré",
    },
    
    ["mad_epee11"] = {
        model = "models/mad_worldmodel/sword3.mdl",
        type = "arme",
        swep = "mad_epee11",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 130000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en or épuré",
    },
    ["mad_epee12"] = {
        model = "models/mad_worldmodel/sword29.mdl",
        type = "arme",
        swep = "mad_epee12",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 160000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée scellé",
    },
    ["mad_epee13"] = {
        model = "models/mad_worldmodel/sword28.mdl",
        type = "arme",
        swep = "mad_epee13",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 185000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée en améthyste",
    },
    ["mad_epee14"] = {
        model = "models/mad_worldmodel/sword25.mdl",
        type = "arme",
        swep = "mad_epee14",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 215000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Royal",
    },
    ["mad_epee15"] = {
        model = "models/mad_worldmodel/sword8.mdl",
        type = "arme",
        swep = "mad_epee15",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée de Pirate",
    },
    ["mad_epee16"] = {
        model = "models/mad_worldmodel/sword18.mdl",
        type = "arme",
        swep = "mad_epee16",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 285000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Blue Marine",
    },
    ["mad_epee17"] = {
        model = "models/mad_worldmodel/sword11.mdl",
        type = "arme",
        swep = "mad_epee17",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 300000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Démoniaque",
    },
    ["mad_epee18"] = {
        model = "models/mad_worldmodel/sword23.mdl",
        type = "arme",
        swep = "mad_epee18",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 325000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Courbé",
    },
    ["mad_epee19"] = {
        model = "models/mad_worldmodel/sword16.mdl",
        type = "arme",
        swep = "mad_epee19",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 525000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Sanglante",
    },
    ["mad_epee20"] = {
        model = "models/mad_worldmodel/sword13.mdl",
        type = "arme",
        swep = "mad_epee20",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 725000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Enflammé",
    },
    ["mad_epee21"] = {
        model = "models/mad_worldmodel/sword9.mdl",
        type = "arme",
        swep = "mad_epee21",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 925000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Majestueuse",
    },
    ["mad_epee22"] = {
        model = "models/mad_worldmodel/swordspe6.mdl",
        type = "arme",
        swep = "mad_epee22",
        playermodel = "",
        boost_hp = "0",
        boost_vitesse = "0",
        scale = 1,
        price = 1125000000,
        isforaspecialclass = true,
        classe = "epeiste",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 2,
            ["Lingot de Fer"] = 7,
        },
        name = "Épée Scimitar",
    },

    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   Faux

    ]]--
    -- ============================================================================================
    -- ============================================================================================

    ["buellost_faux1"] = {
        model = "models/price.mdl",
        type = "arme",
        swep = "buellost_faux1",
        playermodel = "",
        boost_hp = "50",
        boost_vitesse = "10",
        scale = 1,
        price = 112500,
        isforaspecialclass = true,
        classe = {
            ["vampire"] = true,
        },
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Bois"] = 4,
            ["Lingot de Fer"] = 9,
        },
        name = "Faux démoniaque",
    },

    -- ============================================================================================
    -- ============================================================================================
    --[[

                -   Accessoire

    ]]--
    -- ============================================================================================
    -- ============================================================================================

    ["buellost_bague1"] = {
        img = "setarmure/bague_en_fer.png",
        type = "bague",
        swep = "",
        playermodel_male = "",
        playermodel_female = "",
        boost_hp = "50",
        boost_vitesse = "0",
        boost_mana = "0",
        scale = 0.1,
        price =  900000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        rang = 'E',
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Bague en fer",
    },

    ["buellost_bague2"] = {
        img = "setarmure/bague_de_novice.png",
        type = "bague",
        boost_hp = "0",
        boost_vitesse = "0",
        boost_mana = "50",
        scale = 0.1,
        price =  900000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        rang = 'E',
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 5,
        },
        name = "Bague de mana en fer",
    },

    ["buellost_casque1"] = {
        img = "setarmure/casque_en_fer.png",
        type = "casque",
        boost_hp = "50",
        boost_vitesse = "0",
        boost_mana = "0",
        rang = 'E',
        scale = 0.1,
        price =  800000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Casque en fer",
    },
    ["buellost_plastron1"] = {
        img = "setarmure/plastron_en_fer.png",
        type = "plastron",
        boost_hp = "50",
        boost_vitesse = "0",
        boost_mana = "0",
        scale = 0.1,
        price =  800000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Plastron en fer",
        rang = 'E',
    },
    ["buellost_pantalon1"] = {
        img = "setarmure/pantalon_en_fer.png",
        type = "pantalon",
        boost_hp = "50",
        boost_vitesse = "0",
        boost_mana = "0",
        scale = 0.1,
        price =  800000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Pantalon en fer",
        rang = 'E',
    },
    ["buellost_botte1"] = {
        img = "setarmure/botte_en_fer.png",
        type = "botte",
        boost_hp = "50",
        boost_vitesse = "5",
        boost_mana = "0",
        scale = 0.1,
        price =  800000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Botte en fer",
        rang = 'E',
    },

    ["buellost_casque2"] = {
        img = "setarmure/capuche_de_novice.png",
        type = "casque",
        boost_hp = "0",
        boost_vitesse = "0",
        boost_mana = "50",
        scale = 0.1,
        price =  750000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = false,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Capuche de novice",
        rang = 'E',
    },
    ["buellost_plastron2"] = {
        img = "setarmure/plastron_de_novice.png",
        type = "plastron",
        boost_hp = "0",
        boost_vitesse = "0",
        boost_mana = "50",
        scale = 0.1,
        price =  750000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Plastron de novice",
        rang = 'E',
    },
    ["buellost_pantalon2"] = {
        img = "setarmure/pantalon_de_novice.png",
        type = "pantalon",
        boost_hp = "0",
        boost_vitesse = "0",
        boost_mana = "50",
        scale = 0.1,
        price =  750000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Pantalon de novice",
        rang = 'E',
    },
    ["buellost_botte2"] = {
        img = "setarmure/botte_de_novice.png",
        type = "botte",
        boost_hp = "0",
        boost_vitesse = "5",
        boost_mana = "50",
        scale = 0.1,
        price =  750000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Botte de novice",
        rang = 'E',
    },

    ["buellost_sac1"] = {
        img = "sac_en_cuir.png",
        type = "sac",
        max = 5,
        scale = 0.1,
        price =  1000000,
        isforaspecialclass = false,
        classe = "none",
        canbecraft = true,
        teambuy = false,
        theteam = TEAM_STYLISTE,
        canbebuy = true,
        materialstocraft = {
            ["Lingot de Fer"] = 2,
        },
        name = "Sac en cuir",
        rang = 'E',
    },    
}
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_splayerpanel.lua:
local PANEL = {}

local font = slib.createFont("Roboto", 15)
local textcolor, maincolor_7 = slib.getTheme("textcolor"), slib.getTheme("maincolor", 7)

function PANEL:Init()
    local tall = slib.getScaledSize(25, "y")
    self:SetTall(tall)
    self:Dock(TOP)

    self.playerImage = vgui.Create("AvatarImage", self)
    self.playerImage:SetSize(tall, tall)

    self:DockMargin(0, 0, 0, slib.getTheme("margin"))
    self:GetParent():DockPadding(slib.getTheme("margin"), slib.getTheme("margin"), slib.getTheme("margin"), slib.getTheme("margin"))
end

function PANEL:addButton(title, func)
    local bttn = vgui.Create("SButton", self)
    bttn:setTitle(title)
    :Dock(RIGHT)
    :DockMargin(0,slib.getTheme("margin"),slib.getTheme("margin"),slib.getTheme("margin"))

    bttn.DoClick = func

    return self
end

function PANEL:setPlayer(ply)
    self.ply = ply
    self.name = self.ply:Nick()
    self.playerImage:SetPlayer(ply, 64)

    return self
end

function PANEL:Paint(w,h)
    if !self.ply then self:Remove() end

    surface.SetDrawColor(maincolor_7)
    surface.DrawRect(0, 0, w, h)

    if self.ply then
        draw.SimpleText(self.name, font, slib.getScaledSize(25, "y") + slib.getTheme("margin"), h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

vgui.Register("SPlayerPanel", PANEL, "EditablePanel")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_spopupbox.lua:
local PANEL = {}

local font = slib.createFont("Roboto", 13)
local textcolor, textcolor_min10, margin, maincolor_10 = slib.getTheme("textcolor"), slib.getTheme("textcolor", -10), slib.getTheme("margin"), slib.getTheme("maincolor", 10)

function PANEL:Init()
    self:SetSize(slib.getScaledSize(260, "x"), self.topbarheight)
    self:Center()
    self:addCloseButton()
    self.frame:DockPadding(0,margin,0,0)

    self.bgcloser = vgui.Create("SButton")
    self.bgcloser:Dock(FILL)
    self.bgcloser:MakePopup()
    self.bgcloser.Paint = function() end
    self.bgcloser.DoClick = function()
        self:Remove()
    end

    local buttonsH = slib.getScaledSize(25, "y")
    self.choises = vgui.Create("EditablePanel", self.frame)
    self.choises:Dock(BOTTOM)
    self.choises:SetTall(slib.getScaledSize(25, "y"))
    self.choises:DockMargin(0,0,0,margin)
    self.choises:DockPadding(margin,0,margin,0)

    self.choises.ResizeChilds = function()
        local childs = self.choises:GetChildren()
        local count = table.Count(childs)
        local width = self.choises:GetWide()

        for k,v in pairs(childs) do
            v:SetWide(math.Clamp(width / count, 0, width - (margin * 2)) + (count > 1 and k < 3 and -margin*1.5 or 0))
            if count > 1 then
                v:DockMargin(k > 1 and margin * .5 or 0,0,margin * .5,0)
            end
        end
    end

    self.choises.OnSizeChanged = self.choises.ResizeChilds

    self:MakePopup()

    local realh = self.frame:GetTall() - self.choises:GetTall() - margin
    self.frame.PaintOver = function(s,w,h)
        if self.parse then
            self.parse:Draw(w * .5, (h - buttonsH) * .5, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
end

function PANEL:OnRemove()
    if IsValid(self.bgcloser) then self.bgcloser:Remove() end
end

function PANEL:setText(str)
    self.parse = markup.Parse("<colour="..textcolor_min10.r..","..textcolor_min10.g..","..textcolor_min10.b..","..textcolor_min10.a.."><font="..slib.createFont("Roboto", 16)..">"..str.."</font></colour>", self.frame:GetWide() - (margin * 2))
    local height = self.parse:GetHeight()

    self:SetTall(self:GetTall() + height + (margin * 6))

    return self
end

local inputTypes = {
    ["int"] = "STextEntry",
    ["dropdown"] = "SDropDown",
    ["text"] = "STextEntry"
}

function PANEL:addInput(type, placeholder)
    placeholder = placeholder or ""
    local element = vgui.Create(inputTypes[type], self.frame)
    element:Dock(TOP)
    element:DockMargin(margin, 0, margin, margin)
    element:SetTall(slib.getScaledSize(25, "y"))
    element.placeholder = placeholder
    element.bg = maincolor_10

    if type == "int" then
        element:SetNumeric(true)
        element:SetRefreshRate(0)
    end

    element:SetPlaceholder(placeholder)

    self:SetTall(self:GetTall() + element:GetTall() + margin)

    return element
end

function PANEL:addChoise(title, func)
    if !self.addedH then
        self:SetTall(self:GetTall() + self.choises:GetTall() + margin)
    end

    self.addedH = true

    local choise = vgui.Create("SButton", self.choises)
    choise:setTitle(title)
    choise:Dock(LEFT)
    choise:DockMargin(0,margin,0,0)
    choise:SetTall(slib.getScaledSize(25, "y"))
    choise.bg = slib.getTheme("maincolor", 5)

    choise.DoClick = function() if func then func() end self:Remove() end

    self.choises.ResizeChilds()

    return self
end

vgui.Register("SPopupBox", PANEL, "SFrame")
--PATH addons/slib_stromic_s_library/lua/slib/vgui/cl_ssearchbar.lua:
local PANEL = {}

local maincolor_15, accentcolor, margin = slib.getTheme("maincolor", 15), slib.getTheme("accentcolor"), slib.getTheme("margin")

function PANEL:Init()
    self:Dock(TOP)
    self:SetTall(slib.getScaledSize(25, "y"))
    self.font = slib.createFont("Roboto", 15)
    self.material = Material("slib/icons/search32.png", "noclamp smooth")
    self.bg = maincolor_15

    self.entry = vgui.Create( "STextEntry", self )
    self.entry:Dock(FILL)

    slib.wrapFunction(self, "SetZPos", nil, function() return self end, true)
    slib.wrapFunction(self, "Dock", nil, function() return self end, true)
    slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
    slib.wrapFunction(self, "SetWide", nil, function() return self end, true)
end

function PANEL:addIcon()
    self.icon = true
    self.entry:DockMargin(slib.getScaledSize(25, "y") + margin,0,0,0)
    self.entry:AccentSideLine(true)
    
    return self
end

function PANEL:SetPlaceholder(str)
    self.entry:SetPlaceholder(str)
end

function PANEL:Paint(w,h)
    local size = h * .65
    local pos = h * .5 - (size * .5)

    if self.bg then
        surface.SetDrawColor(self.bg)
        surface.DrawRect(0, 0, w, h)
    end

    local wantedcolor = accentcolor
    wantedcolor.a = self.entry:HasFocus() and 120 or 20

    surface.SetDrawColor(slib.lerpColor(self, wantedcolor))
    surface.DrawRect(h - 1, margin, 1, h - (margin * 2))

    if self.icon then
        surface.SetDrawColor(color_white)
        surface.SetMaterial(self.material)
        surface.DrawTexturedRect(pos, pos, size, size)
    end
end

vgui.Register("SSearchBar", PANEL, "EditablePanel")
--PATH addons/eprotect_1.4.22/lua/e_protect/client/cl_overrides.lua:
eProtect = eProtect or {}
eProtect.overrides = eProtect.overrides or {}

if vgui and !eProtect.overrides["vguiCreate"] then
    local oldFunc = vgui.Create

    vgui.Create = function(...)
        local pnl = oldFunc(...)

        hook.Run("eP:PostInitPanel", pnl)

        return pnl
    end

    eProtect.overrides["vguiCreate"] = true
end

if MsgC and !eProtect.overrides["MsgC"] then
    local oldFunc = MsgC

    MsgC = function(...)
        local pnl = oldFunc(...)

        hook.Run("eP:MsgCExecuted", {...})

        return pnl
    end

    eProtect.overrides["MsgC"] = true
end
--PATH lua/sqlworkbench/mysql.lua:
SQLWorkbench.MySQL = {}
SQLWorkbench.MySQL.Connecting = {}
SQLWorkbench.MySQL.Connections = {}

if (SERVER) then
	function SQLWorkbench.MySQL:GetConnection(ply, connection_id)
		if (connection_id == 0 or SQLWorkbench.MySQL.Connections[ply] == nil or SQLWorkbench.MySQL.Connections[ply][connection_id] == nil) then
			return nil
		else
			return SQLWorkbench.MySQL.Connections[ply][connection_id].CONNECTION
		end
	end

	function SQLWorkbench.MySQL:GetDatabaseName(ply, connection_id)
		if (connection_id == 0 or SQLWorkbench.MySQL.Connections[ply] == nil or SQLWorkbench.MySQL.Connections[ply][connection_id] == nil) then
			return nil
		else
			return SQLWorkbench.MySQL.Connections[ply][connection_id].DATABASE
		end
	end

	function SQLWorkbench.MySQL:GetUsername(ply, connection_id)
		if (connection_id == 0 or SQLWorkbench.MySQL.Connections[ply] == nil or SQLWorkbench.MySQL.Connections[ply][connection_id] == nil) then
			return nil
		else
			return SQLWorkbench.MySQL.Connections[ply][connection_id].USERNAME
		end
	end

	function SQLWorkbench.MySQL:GetHost(ply, connection_id)
		if (connection_id == 0 or SQLWorkbench.MySQL.Connections[ply] == nil or SQLWorkbench.MySQL.Connections[ply][connection_id] == nil) then
			return nil
		else
			return SQLWorkbench.MySQL.Connections[ply][connection_id].HOST
		end
	end

	function SQLWorkbench.MySQL:IsConnected(ply, connection_id)
		local connection = SQLWorkbench.MySQL:GetConnection(ply, connection_id)
		return connection ~= nil and connection:status() == mysqloo.DATABASE_CONNECTED
	end

	net.Receive("SQLWorkbench_MySQL_AbortConnecting", function(_, ply)
		local client_connection_id = net.ReadUInt(16)
		if (SQLWorkbench.MySQL.Connecting[ply] ~= nil and SQLWorkbench.MySQL.Connecting[ply][client_connection_id] ~= nil) then
			SQLWorkbench:Print("[#...] " .. ply:Nick() .. " [" .. ply:SteamID() .. "] aborted connecting", SQLWorkbench.PRINT_TYPE.NOTICE)
			SQLWorkbench.MySQL.Connecting[ply][client_connection_id]:disconnect()
			SQLWorkbench.MySQL.Connecting[ply][client_connection_id] = nil
			if (SQLWorkbench.table_IsEmpty(SQLWorkbench.MySQL.Connecting[ply])) then
				SQLWorkbench.MySQL.Connecting[ply] = nil
			end
		end
	end)

	net.Receive("SQLWorkbench_MySQL_AbortConnection", function(_, ply)
		local connection_id = net.ReadUInt(16)
		local connection = SQLWorkbench.MySQL:GetConnection(ply, connection_id)
		if (connection ~= nil and connection:status() ~= mysqloo.DATABASE_NOT_CONNECTED) then
			connection:disconnect()

			SQLWorkbench:Print("[#" .. connection_id .. "] " .. ply:Nick() .. " [" .. ply:SteamID() .. "] disconnected from \"" .. SQLWorkbench.MySQL:GetDatabaseName(ply, connection_id) .. "\" on \"" .. SQLWorkbench.MySQL:GetHost(ply, connection_id) .. "\" as \"" .. SQLWorkbench.MySQL:GetUsername(ply, connection_id) .. "\"", SQLWorkbench.PRINT_TYPE.NOTICE)

			SQLWorkbench.MySQL.Connections[ply][connection_id] = nil
			if (SQLWorkbench.table_IsEmpty(SQLWorkbench.MySQL.Connections[ply])) then
				SQLWorkbench.MySQL.Connections[ply] = nil
			end
		end
	end)

	net.Receive("SQLWorkbench_MySQL_StartConnection", function(_, ply)
		if (not ply:IsSuperAdmin()) then return end

		local client_connection_id = net.ReadUInt(16)

		local host = net.ReadString()
		local username = net.ReadString()

		local cipher = net.ReadUInt(16)
		local password = ""
		for i=1,net.ReadUInt(16) do
			password = password .. string.char(bit.bxor(net.ReadUInt(32), cipher))
		end

		local database = net.ReadString()
		local port = net.ReadUInt(16)

		if (not mysqloo) then
			if ((system.IsLinux() and file.Exists("lua/bin/gmsv_mysqloo_linux.dll", "GAME")) or (system.IsWindows() and file.Exists("lua/bin/gmsv_mysqloo_win32.dll", "GAME"))) then
				require("mysqloo")
			else
				net.Start("SQLWorkbench_No_MySQLOO")
				net.Send(ply)
				return
			end
		end
		
		local connection = mysqloo.connect(host, username, password, database, port)

		SQLWorkbench.MySQL.Connecting[ply] = SQLWorkbench.MySQL.Connecting[ply] or {}
		SQLWorkbench.MySQL.Connecting[ply][client_connection_id] = connection
		
		SQLWorkbench:Print("[#...] " .. ply:Nick() .. " [" .. ply:SteamID() .. "] is connecting to '" .. username .. "'@'" .. host .. "'." .. database, SQLWorkbench.PRINT_TYPE.NOTICE)

		function connection:onConnected()
			SQLWorkbench.MySQL.Connecting[ply][client_connection_id] = nil
			if (SQLWorkbench.table_IsEmpty(SQLWorkbench.MySQL.Connecting[ply])) then
				SQLWorkbench.MySQL.Connecting[ply] = nil
			end

			SQLWorkbench.MySQL.Connections[ply] = SQLWorkbench.MySQL.Connections[ply] or {}
			local connection_id = #SQLWorkbench.MySQL.Connections[ply] + 1
			SQLWorkbench.MySQL.Connections[ply][connection_id] = {
				CONNECTION = connection,
				DATABASE = database,
				HOST = host,
				USERNAME = username
			}

			net.Start("SQLWorkbench_MySQL_StartConnection")
				net.WriteUInt(client_connection_id, 16)
				net.WriteUInt(connection_id, 16)
			net.Send(ply)

			SQLWorkbench:Print("[#" .. connection_id .. "] " .. ply:Nick() .. " [" .. ply:SteamID() .. "] connected successfully!", SQLWorkbench.PRINT_TYPE.SUCCESS)

			connection:setCharacterSet("utf8mb4")
		end

		function connection:onConnectionFailed(err)
			SQLWorkbench.MySQL.Connecting[ply][client_connection_id] = nil
			if (SQLWorkbench.table_IsEmpty(SQLWorkbench.MySQL.Connecting[ply])) then
				SQLWorkbench.MySQL.Connecting[ply] = nil
			end

			net.Start("SQLWorkbench_MySQL_ConnectionError")
				net.WriteUInt(client_connection_id, 16)
				net.WriteString(err or "UNKNOWN")
			net.Send(ply)

			SQLWorkbench:Print("[#!!!] " .. ply:Nick() .. " [" .. ply:SteamID() .. "] failed to connect!", SQLWorkbench.PRINT_TYPE.ERROR)
			SQLWorkbench:Print("Error: ".. err, SQLWorkbench.PRINT_TYPE.ERROR)
		end

		connection:connect()
	end)
else
	local client_connection_id = 0
	local client_connection_callbacks = {}
	function SQLWorkbench.MySQL:StartConnection(host, username, password, database, port, callback)
		client_connection_callbacks[client_connection_id] = callback

		local cipher = math.random(2,65535)
		net.Start("SQLWorkbench_MySQL_StartConnection")
			net.WriteUInt(client_connection_id, 16)
			net.WriteString(host)
			net.WriteString(username)
			net.WriteUInt(cipher, 16)
			net.WriteUInt(#password, 16)
			for i=1,#password do
				local char = password[i]
				net.WriteUInt(bit.bxor(string.byte(char), cipher), 32)
			end
			net.WriteString(database)
			net.WriteUInt(port, 16)
		net.SendToServer()

		client_connection_id = client_connection_id + 1
		return client_connection_id - 1
	end
	net.Receive("SQLWorkbench_MySQL_StartConnection", function()
		local client_connection_id = net.ReadUInt(16)
		local connection_id = net.ReadUInt(16)
		SQLWorkbench.MySQL.Connections[connection_id] = true
		if (client_connection_callbacks[client_connection_id] ~= nil) then
			client_connection_callbacks[client_connection_id](connection_id)
		end
	end)
	net.Receive("SQLWorkbench_MySQL_ConnectionError", function()
		local client_connection_id = net.ReadUInt(16)
		local err = net.ReadString()
		if (client_connection_callbacks[client_connection_id] ~= nil) then
			client_connection_callbacks[client_connection_id](nil, err)
		end
	end)

	function SQLWorkbench.MySQL:AbortConnection(connection_id)
		SQLWorkbench.MySQL.Connections[connection_id] = nil
		SQLWorkbench.ConnectionPanels[connection_id] = nil

		net.Start("SQLWorkbench_MySQL_AbortConnection")
			net.WriteUInt(connection_id, 16)
		net.SendToServer()
	end
end
--PATH addons/talk-modes/lua/talk_modes/core/sh_core.lua:
--[[-------------------------------------------

    Talk Modes - whisper/talk/yell 

    Licensed to GLeaks.Space
	Version: 1.1.1

	By: SaturdaysHeroes & Djuk
	Special thanks to CupCakeR

--]]-------------------------------------------
local PLAYER = FindMetaTable("Player")

function TalkModes:IsValidMode(strMode)
    local bValid = false

    for i, v in pairs(self.Config:GetTable("Modes")) do 
        if i == strMode then bValid = true end
    end

    return bValid
end

function TalkModes:GetDistance(strMode)
    return self.Config:GetTable("Modes")[strMode] || 0
end

function PLAYER:SetTalkMode(strMode)
    if (SERVER) then 
        if !TalkModes:IsValidMode(strMode) then return end

        self:SetNWString("TalkMode", strMode)
    end
end

function PLAYER:GetTalkMode()
    return self:GetNWString("TalkMode") || "Talk"
end



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
--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_colorpicker.lua:
local circles = include("talk_modes/vgui/libs/cl_circles.lua")
local THEME = TalkModes.Client.ActiveTheme

local PANEL = {}
AccessorFunc(PANEL, "value", "Value")
function PANEL:Init()
    self.R = self:Add("TalkModes.Slider")
    self.R:SetColor(Color(192, 57, 43))
    self.R:SetPos(6, 60)
    self.R:SetMinMax(0, 255)
    self.G = self:Add("TalkModes.Slider")
    self.G:SetColor(Color(39, 174, 96))
    self.G:SetPos(6, 80)
    self.G:SetMinMax(0, 255)
    self.B = self:Add("TalkModes.Slider")
    self.B:SetColor(Color(41, 128, 185))
    self.B:SetPos(6, 100)
    self.B:SetMinMax(0, 255)

    self.preview = self:Add("DPanel")
    self.preview:SetSize(56, 56)
    self.preview:SetPos(300, 60)
    self.preview.Paint = function(_, intW, intH)
        surface.SetDrawColor(Color(20, 20, 20))
        surface.DrawRect(0, 0, intW, intH)
        surface.SetDrawColor(self:GetValue())
        surface.DrawRect(2, 2, intW-4, intH-4)
    end
end
function PANEL:UpdateColors()
    self.R:SetValue(self:GetValue().r)
    self.G:SetValue(self:GetValue().g)
    self.B:SetValue(self:GetValue().b)
end

function PANEL:Think()
    self:SetValue(Color(self.R:GetValue(), self.G:GetValue(), self.B:GetValue()))
end
vgui.Register("TalkModes.ColorPicker", PANEL, "EditablePanel")

--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_general.lua:
local PANEL = {}
function PANEL:Init()
    self:SetPageName("General")
    self.tblDefaultSettings = {
        ["Language"] = {
            strDesc = "Language_Desc",
            strType = "tDropdown",
            tblData = TalkModes.Languages.Available
        },
        ["Selection Key"] = {
            strDesc = "Selection Key_Desc",
            strType = "tBinder"
        },
        ["3D Voice"] = {
            strDesc = "3D Voice_Desc",
            strType = "tSwitch"
        },
        ["Talking Dead"] = {
            strDesc = "Talking Dead_Desc",
            strType = "tSwitch"
        },
        ["Selection Menu Position"] = {
            strDesc = "Selection Menu Position_Desc",
            strType = "tDropdown",
            tblData = {
                ["Top Left"] = 1,
                ["Top Center"] = 2,
                ["Top Right"] = 3,
                ["Center Left"] = 4,
                ["Center Right"] = 5,
                ["Bottom Left"] = 6,
                ["Bottom Center"] = 7,
                ["Bottom Right"] = 8
            }
        },
        ["Auto-Hide"] = {
            strDesc = "Auto-Hide_Desc",
            strType = "tSwitch"
        },
        ["Mode Change Message"] = {
            strDesc = "Mode Change Message_Desc",
            strType = "tSwitch"
        }
    }
    self:RefreshSettings()
end
vgui.Register("TalkModes.GeneralSettings", PANEL, "TalkModes.SettingsBase")

--PATH addons/talk-modes/lua/talk_modes/vgui/elements/cl_previewslider.lua:
local THEME = TalkModes.Client.ActiveTheme

local PANEL = {}
AccessorFunc(PANEL, "value", "Value")
function PANEL:Init()
    self.slider = self:Add("TalkModes.Slider")
    self.slider:SetSize(256, 12)
    self.slider:SetPos(8, 100 - 6 - 24)

    self.preview = self:Add("DButton")
    self.preview:SetFont("TalkModes:Small")
    self.preview:SetText(string.upper(TalkModes.Languages:GetPhrase("Preview")))
    self.preview:DockMargin(6, 6, 6, 6)
    self.preview:SetColor(THEME["White"])
    self.preview:SizeToContents()
    self.preview:SetPos(8 + 256, 100 - 6 - 18 - self.preview:GetTall()/2)
    self.preview.Alpha = 90
    self.preview.Paint = function(self, intW, intH)
        self.Alpha = Lerp(FrameTime() * 8, self.Alpha, self:IsHovered() && 230 || 90)
        draw.RoundedBox(6, 0, 0, intW, intH, Color(THEME["Hover"].r, THEME["Hover"].g, THEME["Hover"].b, self.Alpha))
    end
    self.preview.DoClick = function(this)
        net.Start("TalkModes.AttemptPreview")
            net.WriteUInt(self.slider:GetValue(), 32)
        net.SendToServer()
    end
end

function PANEL:RefreshValue()
    self.slider:SetValue(self:GetValue())
end

function PANEL:Think()
    self:SetValue(self.slider:GetValue())
end
vgui.Register("TalkModes.PreviewSlider", PANEL, "EditablePanel")

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

--PATH addons/sl_utils/lua/autorun/textscreens_util.lua:
local function checkAdmin(ply)
	-- The server console always has access. `ply` is NULL in this case
	local isConsole = ply == nil or ply == NULL
	if isConsole then
		return true
	end
	local canAdmin = hook.Run("TextscreensCanAdmin", ply) -- run custom hook function to check admin
	if canAdmin == nil then -- if hook hasn't returned anything, default to super admin check
		canAdmin = ply:IsSuperAdmin()
	end
	return canAdmin
end

-- allow servers to disable rainbow effect for everyone
CreateConVar("ss_enable_rainbow", 1, {FCVAR_NOTIFY, FCVAR_REPLICATED}, "Determines whether rainbow textscreens will render for all clients. When disabled, rainbow screens will render as solid white.", 0, 1)

-- allow servers to restrict the number of characters per line for everyone
CreateConVar("ss_max_characters", 0, {FCVAR_NOTIFY, FCVAR_REPLICATED}, "Determines the maximum number of characters per line for all clients. When set to 0, the maximum number of characters is infinite.", 0)

if SERVER then
	AddCSLuaFile()
	AddCSLuaFile("textscreens_config.lua")
	include("textscreens_config.lua")
	CreateConVar("sbox_maxtextscreens", "1", {FCVAR_NOTIFY, FCVAR_REPLICATED}, "Determines the maximum number of textscreens users can spawn.")

	--local rainbow_enabled = cvars.Number('ss_enable_rainbow', 1)

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
		print("[3D2D Textscreens] Spawning textscreens...")
		textscreens = file.Read("sammyservers_textscreens.txt", "DATA")
		if not textscreens or textscreens == "" then
			textscreens = {}
			print("[3D2D Textscreens] Spawned 0 textscreens for map " .. game.GetMap())
			return
		end
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

			for lineNum, lineData in pairs(v.lines or {}) do
				textScreen:SetLine(lineNum, lineData.text, Color(lineData.color.r, lineData.color.g, lineData.color.b, lineData.color.a), lineData.size, lineData.font, lineData.rainbow or 0)
			end

			textScreen:SetIsPersisted(true)
			count = count + 1
		end

		print("[3D2D Textscreens] Spawned " .. count .. " textscreens for map " .. game.GetMap())
	end

	hook.Add("InitPostEntity", "loadTextScreens", function()
		timer.Simple(10, SpawnPermaTextscreens)
	end)

	hook.Add("PostCleanupMap", "loadTextScreens", SpawnPermaTextscreens)

	-- If a player, use ChatPrint method, else print directly to server console
	local function printMessage(ply, msg)
		local isConsole = ply == nil or ply == NULL
		if isConsole then
			print(msg)
		else
			ply:ChatPrint(msg)
		end
	end
	concommand.Add("SS_TextScreen", function(ply, cmd, args)
		if not checkAdmin(ply) or not args or not args[1] or not args[2] or not (args[1] == "delete" or args[1] == "add") then
			printMessage(ply, "not authorised, or bad arguments")
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
			-- So we can reference it easily later because EntIndexes are so unreliable
			toAdd.uniqueName = StringRandom(10)
			toAdd.MapName = game.GetMap()
			toAdd.lines = ent.lines
			table.insert(textscreens, toAdd)
			file.Write("sammyservers_textscreens.txt", util.TableToJSON(textscreens))
			ent:SetIsPersisted(true)

			return printMessage(ply, "Textscreen made permanent and saved.")
		else
			for k, v in pairs(textscreens) do
				if v.uniqueName == ent.uniqueName then
					textscreens[k] = nil
				end
			end

			ent:Remove()
			file.Write("sammyservers_textscreens.txt", util.TableToJSON(textscreens))

			return printMessage(ply, "Textscreen removed and is no longer permanent.")
		end
	end)

	-- Add to pocket blacklist for DarkRP
	-- Not using gamemode == "darkrp" because there are lots of flavours of darkrp
	hook.Add("loadCustomDarkRPItems", "sammyservers_pocket_blacklist", function()
		GAMEMODE.Config.PocketBlacklist["sammyservers_textscreen"] = true
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

			return checkAdmin(ply)
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

			return checkAdmin(ply)
		end,
		Action = function(self, ent)
			if not IsValid(ent) then return end

			return RunConsoleCommand("SS_TextScreen", "delete", ent:EntIndex())
		end
	})
end

--PATH addons/the_perfect_training_system/lua/diablos_training/languages/training_portuguese.lua:
Diablos.TS.Languages.AvailableLanguages["portuguese"] = {

	-- Dados globais
	lbs = "lbs",
	kg = "kg",
	yes = "SİM",
	no = "NÃO",
	andStr = "and",
	active = "ATIVO",
	training = "TREINAMENTO",
	beginning = "Começo:",
	ending = "Fim:",
	leaveTraining = "deixar o treino:",
	second = "segundo",
	seconds = "segundos",
	minute = "minuto",
	minutes = "minutos",
	hour = "hora",
	hours = "horas",
	day = "dia",
	days = "dias",
	week = "semana",
	weeks = "semanas",
	month = "mês",
	months = "meses",
	year = "ano",
	years = "anos",
	key = "chave",
	keys = "chaves",
	free = "GRATUITAMENTE",

	-- Dicas para casa
	home = "Home",
	trainingStatistics = "ESTATÍSTICAS DE TREINAMENTO",
	levelProgression = "Progressão de nível",
	captionFine = "Colapso muscular",
	captionShouldTrain = "Deve treinar",
	captionMuscleLoss = "Perda de músculo",
	staminaBenefit = "Duração da velocidade",
	staminaMuscle = "Coxa",
	runningspeedBenefit = "Velocidade máxima de corrida",
	runningspeedMuscle = "Calf",
	strengthBenefit = "Dano de força",
	strengthMuscle = "Ombro, Trapézio e Braço",
	attackspeedBenefit = "Velocidade de ataque",
	attackspeedMuscle = "Antebraço",

	-- Estatísticas pessoais

	currentLevel = "Nível %u",
	xpPoint = "XP: %u",

	-- Estatísticas globais

	globalStatistics = "Estatísticas globais",
	onlineStatistics = "Estatísticas para jogadores online",
	updateSelection = "ATUALIZAR (%u selected)",
	resetPlayerData = "REINICIAR DADOS DO JOGADOR",
	resetEntityData = "REINICIAR DADOS DA ENTIDADE",
	peopleSelected = "Pessoas selecionadas: %s",
	peopleSelectedTip = "Você pode definir alguns parâmetros de treinamento para aplicar às pessoas selecionadas",


	-- Parte dos tempos de treino

	trainingTimes = "TEMPOS DE TREINAMENTO",
	trainingAdv = "Às vezes você precisa fazer um descanso muscular. No entanto, esperar muito tempo induzirá uma perda muscular.",
	muscleRest = "Descanso muscular",
	losingMuscle = "Perder músculo",
	waitUntil = "Você deve esperar até",
	secondsRemaining = "%d segundos restantes",
	needTrainBeforeLosingMuscle = "Você precisa treinar antes:",
	neverTrained = "Nunca treinou",
	freeToWorkout = "Você é livre para treinar este músculo!",
	currentlyLosing = "Você está perdendo músculo no momento!",
	yourChoice = "sua escolha",
	trainNow = "Comece o treinamento",


	-- XP/Level table

	levels = "Níveis",
	level = "Nível",
	xp = "XP",
	percentage = "Percentagem",
	undefined = "Indefinido",
	lastTraining = "Último treinamento",

	-- Treinamentos globais

	trainingWillBegin = "O treinamento começará em %u segundos",
	trainingEndsIn = "O treinamento termina em %u segundos",
	currentlyUsingMachine = "Alguém está usando a máquina no momento",
	leftMachine = "Você saiu do treino. Você pode tentar novamente a partir de agora!",
	farFromMachine = "Você está muito longe de uma máquina para treinar!",
	notAllowedJob = "Seu trabalho não permite que você treine!",

	-- Admin data

	setTo = "Definir %s para",
	confirmationBox = "CAIXA DE CONFIRMAÇÃO",
	areYouSure = "Você tem certeza que deseja fazer isso?",

	-- Balança de peso data


	weighBalanceUse = "Pressione USE para obter informações",
	weighBalanceCantSee = "As estatísticas são confidenciais",
	weighBalanceTipL1 = "POR FAVOR PASSE",
	weighBalanceTipL2 = "NO EQUILÍBRIO",
	weighBalanceTipL3 = "PARA TER ESTATÍSTICAS",

	-- Catraca data

	turnstileNeedBadge = "Você precisa usar seu crachá para acessar aqui!",

	-- Distintivo data

	activebadge = "Selo ativo",
	neverSubscribed = "Nunca se inscreveu",
	badgeSubscription = "Assinatura do selo",
	expirationDate = "Data de validade",
	expired = "Expirado",
	previousSub = "Assinatura anterior",

	-- Energia data

	stamina = "Energia",
	runSpeed = "Corra rápido",
	timeMaxSpeed = "Tempo de velocidade máxima",

	-- Velocidade de corrida data

	runningspeed = "Velocidade de corrida",

	-- Esteira data

	treadmillDrawLeft = "%u segundos restantes",
	treadmillDrawSomeone = "Alguém está treinando!",
	treadmillDrawCanUse = "USO GRATUITO",
	treadmillCurSpeed = "Velocidade atual",
	treadmillFrameTitle = "ESTEIRA",
	treadmillChooseExerciceTip1 = "Martele a chave para a frente para aumentar sua velocidade",
	treadmillChooseExerciceTip2 = "Os pontos que você ganha dependem da velocidade em que você está correndo no final",
	quickExerciceSpeed = "Exercício rápido baseado na velocidade",
	longExerciceStamina = "Exercício longo baseado em resistência",
	runningTime = "Tempo de execução",
	increaseSpeed = "Aumente a velocidade",
	decreaseSpeed = "Diminuir velocidade",
	needFasterTreadmill = "Você precisa ser mais rápido ao pressionar/soltar a tecla FORWARD",

	-- Força data

	strength = "Força",

	-- Haltere data

	dumbbellDraw = "Haltere",
	dumbbellFrameTitle = "HALTERE",
	dumbbellChooseExerciceTip1 = "Pressione as teclas certas na hora certa",
	dumbbellChooseExerciceTip2 = "Os pontos que você ganha dependem da proporção de teclas pressionadas no momento certo",

	-- Velocidade de ataque data

	attackspeed = "Velocidade de ataque",

	-- Bola de boxe data

	punchingHitDamage = "%u pontos vermelhos atingidos",
	punchingFrameTitle = "BOLA DE BOXE",
	punchingChooseExerciceTip1 = "Acerte os pontos vermelhos da bola de perfuração",
	punchingChooseExerciceTip2 = "Os pontos que você ganha dependem da quantidade de pontos vermelhos que você acerta usando seus punhos",

	-- Leitor de cartão data

	cardReaderTitle = "LEITOR DE CARTÃO",
	approachBadge = "Você precisa se aproximar do seu distintivo esportivo para usar o terminal!",
	becomeOwner = "Você se tornou o dono do terminal!",
	someoneElseOwner = "Outra pessoa já é proprietária deste terminal",

	cardReaderOwnerAdd = "ADICIONAR",
	cardReaderOwnerRemove = "REMOVER",
	cardReaderApply = "APLICAR MUDANÇAS",
	cardReaderBadgePrice = "Preço do emblema",
	cardReaderPurchaseSub = "COMPRE UM SUB",
	cardReaderPurchaseSubTip1 = "Uma assinatura permite que você use seu crachá nas catracas",
	cardReaderFullyRecharged = "Sua assinatura já está totalmente recarregada! Expira em %s",

	cardReaderGiveCredit = "DÊ UM CRÉDITO",
	cardReaderGiveCreditTip1 = "Você está prestes a dar crédito ao jogador à sua frente",
	cardReaderGiveCreditTip2 = "Isso permitirá que ele acesse uma catraca uma vez",
	cardReaderGiveCreditBtn = "DAR CRÉDITO",
	cardReaderGiveAlreadyCredit = "Você não pode dar um crédito a alguém que já tem um!",
	cardReaderGiveAlreadySubscribed = "Você não pode dar crédito a alguém que já tenha uma assinatura válida!",


	cardReaderEditTerminal = "EDITAR O TERMINAL",
	cardReaderEditTerminalTip1 = "Você pode alterar alguns parâmetros do terminal como o preço da assinatura/co-proprietário",
	cardReaderEditTerminalTip2 = "Os coproprietários estão aqui para compartilhar o dinheiro que você recebe das assinaturas",
	cardReaderEditTerminalSetPrice = "O preço pode ser definido de %s a %s",


	-- Notificar jogador

	alreadyTrained = "Você fez recentemente um treinamento desses músculos, por favor, volte em %s",
	needMoreLevel = "Você precisa ter pelo menos o nível %u para usar isso!",
	tooEasy = "Esta máquina é muito fácil para o seu nível!",
	endTraining = "O treinamento terminou",
	xpAdded = "Você ganhou %u pontos!",
	newLevel = "Você agora está no nível %u!",
	lossOfTraining = "Você perde alguns músculos devido a uma perda de treinamento para este tipo de treinamento: %s",
	sportBadgeVerified = "Sua inscrição foi verificada",
	sportBadgeInvalid = "Sua inscrição é inválida",
	subDataUpdated = "Você atualizou os dados de inscrição do selo!",
	subPurchased = "Você recebeu %s porque %s comprou uma inscrição!",
	subRenewed = "Você renovou sua inscrição!",
	subNotEnoughMoney = "Você não tem dinheiro suficiente para comprar um sub!",
	creditGiven = "Você tem um crédito!",
	creditReceived = "Você recebeu um crédito!",
	entitiesUpdated = "Os dados da entidade de treinamento foram atualizados!",
	entitiesRemoved = "As entidades foram removidas e os dados apagados!",
	playerDataRemoved = "O banco de dados dos jogadores foi apagado!",
	playerDataUpdated = "Dados atualizados com o seu valor!",

}
--PATH addons/the_perfect_training_system/lua/config/training_config.lua:
-- Addon by Diablos
-- Configuration file

-- General Configuration

Diablos.TS.Language = "french" -- Addon language. Languages are retrieved by the name of the file in languages/ folder.

Diablos.TS.AdminGroups = { -- Admin groups able to use the Training Manager toolgun.
	["superadmin"] = true,
	["admin"] = true,
}

Diablos.TS.Optimization = 800 -- Value for optimization. The lower the value will be, near a training entity the player will have to be to see the draw information above ents.

Diablos.TS.SQLType = "sqlite" -- sqlite = stored in sv.db / mysql = mysql parameters

-- If Diablos.TS.SQLType is set to "mysql"

	Diablos.TS.MySQLData = { -- MySQL data parameters
		host = "diadia.mysql.db",
		username = "diablosdb",
		password = "Thepassword",
		database = "diadia.mysql.db",
		port = 3306,
	}

-- End of this If

-- The amount of cameras turning around treadmill/dumbbell when training
-- You can set this value to 1 if you want a fixed camera. In this case, the camera will be
-- at the back (for treadmill) and in front of the player (for the dumbbell), which are the best views 
Diablos.TS.AmountCameras = 4

-- List of jobs (with job names) not able to train.
-- Blocklisted jobs also have default bones and CAN'T have upper bones
Diablos.TS.BlocklistedJobs = {
	"Hobo"
}


Diablos.TS.ChangeBones = false -- Are bones affected by your training?

-- If Diablos.TS.ChangeBones is set to true

	-- List of models blocklisted for the bones. Models who don't respect some Source rules have bones with wrong positions, which can create a weird effect on playermodel!
	Diablos.TS.BoneModelBlocklist = {
		["models/error.mdl"] = true,
	}

-- End of this If

-- List of keys blocklisted for the dumbbell training
Diablos.TS.DumbbellKeyBlocklist = {
	KEY_0 -- 0 confusion with O
}

Diablos.TS.RetroLevel = true -- true = you can loose XP/level if you don't maintain your good health by training regularly

-- If Diablos.TS.RetroLevel is set to true

	Diablos.TS.MuscleRest = 5 -- The amount of hours you need to wait before training again (for the same muscle). Set it to 0 if you want people to never take muscle rest.

	Diablos.TS.RetroTime = 120 -- Amount of hours without any training before losing some muscle.

	Diablos.TS.RoutineCheck = 2 -- Routine trigger time interval to check if someone should lose some XP because of loss of training. You can set it to 0 if you only want one check at the startup of the server.

	Diablos.TS.LoseXP = 1 -- Amount of XP you can lose for lack of training every RetroTime hour

-- End of this If

Diablos.TS.IsLbs = false -- true = lbs / false = kg

Diablos.TS.IsMph = false -- true = mph / false = kmh

Diablos.TS.HardestTrainingOnly = true -- true = you can't train on the first easiest machines - you are only allowed to train on the hardest machine depending only your level. false = even in the last muscle level, you can train on all machines.

Diablos.TS.PunchingPointInstantSpawn = true -- true = when touching a red point on a punching ball training, another point is reappearing instantly. false = the lot of points are reappearing when you have touched all the points.

-- .png/.jpg file representing a logo, used for some VGUI and the punching ball. Leave it empty to have no logo.
-- You can put a URL by beginning with http(s), or a local file as "diablos/test.png" considering this file is in materials/diablos/test.png (don't include the "materials" folder)
Diablos.TS.IconLogo = "https://diablosdev.com/logo/diablos.jpg"

Diablos.TS.SubSystem = true -- true = you need to subscribe using a card reader (or with a credit) to access the turnstile / false = you don't need it (everyone can access the turnstile or you don't want to use a turnstile/sport badge at all)

-- If Diablos.TS.SubSystem is set to true

	Diablos.TS.CoachJob = "Coach" -- Job names representing the coaches. They will be allowed to sell subs (through card readers) and give credits for people to train! Can be a string or a table!

	Diablos.TS.SubDefaultPrice = 25000 -- Default price if you are allowed to and you can purchase a sub

	Diablos.TS.SubMinPrice = 25000 -- Subscription minimum price a coach can set to be purchased

	Diablos.TS.SubMaxPrice = 50000 -- Subscription maximum price a coach can set to be purchased

	Diablos.TS.SubTime = 2 -- The amount of HOURS the subscription is valid when purchasing one

	Diablos.TS.PurchaseSubWithoutCoach = true -- true = you can purchase a sub (at the default price) if there is no coach on the map / false = you can access to the turnstile if there is no coach on the map

	Diablos.TS.MaximumSubTime = 3 -- The maximum amount of hours from which you're no more able to renew your sub - this value is made to avoid abuses and people who have a badge valid for years!

	-- If you are using Pointshop2 currency system!

	Diablos.TS.PointshopPremium = false -- False: using "Points" system / true = using "Premium Points" system

-- End of this If

Diablos.TS.StopTrainingKey = IN_RELOAD -- The key to stop all the trainings possible - it is by default set to IN_RELOAD because the right click would cause an issue with the punching ball!

Diablos.TS.TimeBeforeTraining = 5 -- Amount of seconds a player needs to wait before the training is beginning - act as a "3 2 1 GO"

Diablos.TS.StaminaEnabled = false -- Enable / disable the stamina

-- If Diablos.TS.StaminaEnabled is set to true

	/*
		STAMINA LEVELS
		Stamina levels can be improved using a TREADMILL and doing a long exercice based on stamina. A better stamina will improve the top speed time.
		xp: The XP you need to reach that level. NOTE: The first occurence needs to have the XP value set to 0 !!
		timeduration: The timeduration value is the amount of seconds you can run at the top speed.
	*/

	Diablos.TS.StaminaLevels = {
		{xp = 0, timeduration = 6},
		{xp = 15, timeduration = 8},
		{xp = 30, timeduration = 10},
		{xp = 50, timeduration = 12},
		{xp = 75, timeduration = 14},
		{xp = 110, timeduration = 16},
		{xp = 150, timeduration = 18},
		{xp = 200, timeduration = 20},
	}

	-- You can specify specific values for different jobs. Here, the Civil Protection job has a better stamina.
	-- The amount of entries should be the same than the amount of entries in the StaminaLevels table above.
	Diablos.TS.StaminaJobAbilities = {
		["Civil Protection"] = {
			{timeduration = 15},
			{timeduration = 20},
			{timeduration = 25},
			{timeduration = 30},
			{timeduration = 35},
			{timeduration = 40},
			{timeduration = 45},
			{timeduration = 50},
		}
	}

	Diablos.TS.ShowStaminaOnRun = false -- true = you have a little panel showing your current stamina when running / false = you don't have it

	-- If Diablos.TS.ShowStaminaOnRun is set to true

		Diablos.TS.StaminaPanelPosX = 0.02 -- X position of the stamina panel. From 0 to 1 if you want relative to screen, otherwise it is absolute.

		Diablos.TS.StaminaPanelPosY = 0.72 -- Y position of the stamina panel. From 0 to 1 if you want relative to screen, otherwise it is absolute.

	-- End of this If

	Diablos.TS.MinimalisticPanel = false -- true = the panel is just a simple bar / false = the panel displays the time in top speed as well as the top speed

	-- If Diablos.TS.MinimalisticPanel is set to true

		Diablos.TS.MinimalisticBarX = 200 -- X size of the minimalistic stamina bar (200 is the X size for a 1920x1080 screen but it is relative anyway).

		Diablos.TS.MinimalisticBarY = 40 -- Y size of the minimalistic stamina bar (200 is the X size for a 1920x1080 screen but it is relative anyway).

	-- End of this If

-- End of this If

Diablos.TS.RunningSpeedEnabled = true -- Enable / disable the running speed

-- If Diablos.TS.RunningSpeedEnabled is set to true

	/*
		RUNNING SPEED LEVELS
		Running speed levels can be improved using a TREADMILL and doing a quick exercice based on speed. A better speed will improve your top speed when running. It can be merged with stamina to run fast during a long time.
		xp: The XP you need to reach that level. NOTE: The first occurence needs to have the XP value set to 0 !!
		runspeed: The runspeed value is the runspeed added to the current runspeed of the server.
	*/

	Diablos.TS.RunningSpeedLevels = {
		{xp = 0, runspeed = 5},
		{xp = 15, runspeed = 10},
		{xp = 35, runspeed = 15},
		{xp = 50, runspeed = 20},
		{xp = 65, runspeed = 25},
		{xp = 75, runspeed = 30},
		{xp = 90, runspeed = 35},
		{xp = 120, runspeed = 40},
	}

	-- You can specify specific values for different jobs. Here, the Civil Protection job has a better runspeed.
	-- The amount of entries should be the same than the amount of entries in the RunningSpeedLevels table above.
	Diablos.TS.RunningSpeedJobAbilities = {
		["Civil Protection"] = {
			{runspeed = 50},
			{runspeed = 60},
			{runspeed = 70},
			{runspeed = 80},
			{runspeed = 90},
			{runspeed = 100},
			{runspeed = 110},
			{runspeed = 125},
		}
	}

-- End of this If

Diablos.TS.StrengthEnabled = true -- Enable / disable the strength

-- If Diablos.TS.StrengthEnabled is set to true

	/*
		STRENGTH LEVELS
		Strength levels can be improved using a DUMBBELL in a weight made for your level. A better strength allows to punch more louder using the "Trained Fists".
		xp: The XP you need to reach that level. NOTE: The first occurence needs to have the XP value set to 0 !!
		damage: The damage value is the percentage of improvement (10 means it's 10% better than usually) for damage when using your "Trained Fists".
	*/

	Diablos.TS.StrengthLevels = {
		{xp = 0, damage = 0},
		{xp = 25, damage = 20},
		{xp = 50, damage = 40},
		{xp = 75, damage = 50},
		{xp = 100, damage = 60},
		{xp = 150, damage = 70},
		{xp = 200, damage = 80},
		{xp = 300, damage = 100},
	}

	-- You can specify specific values for different jobs. Here, the Civil Protection job has a better strength.
	-- The amount of entries should be the same than the amount of entries in the StrengthLevels table above.
	Diablos.TS.StrengthJobAbilities = {
		["Civil Protection"] = {
			{damage = 50},
			{damage = 75},
			{damage = 100},
			{damage = 125},
			{damage = 150},
			{damage = 175},
			{damage = 200},
			{damage = 250},
		}
	}

-- End of this If

Diablos.TS.AttackSpeedEnabled = true -- Enable / disable the attack speed

-- If Diablos.TS.AttackSpeedEnabled is set to true

	/*
		ATTACK SPEED LEVELS
		Attack speed levels can be improved using a PUNCHING BALL. A better attack speed will improve the delay when punching people using your fists.
		xp: The XP you need to reach that level. NOTE: The first occurence needs to have the XP value set to 0 !!
		attackspeed: The attackspeed value is the percentage of improvement (10 means it's 10% better than usually) for the delay to punch faster when using your "Trained Fists".
	*/

	Diablos.TS.AttackSpeedLevels = {
		{xp = 0, attackspeed = 0},
		{xp = 15, attackspeed = 15},
		{xp = 30, attackspeed = 30},
		{xp = 50, attackspeed = 50},
		{xp = 75, attackspeed = 75},
		{xp = 110, attackspeed = 100},
		{xp = 150, attackspeed = 125},
		{xp = 200, attackspeed = 150},
	}

	-- You can specify specific values for different jobs. Here, the Civil Protection job has a better attackspeed.
	-- The amount of entries should be the same than the amount of entries in the AttackSpeedLevels table above.
	Diablos.TS.AttackSpeedJobAbilities = {
		["Civil Protection"] = {
			{attackspeed = 50},
			{attackspeed = 75},
			{attackspeed = 100},
			{attackspeed = 125},
			{attackspeed = 150},
			{attackspeed = 175},
			{attackspeed = 200},
			{attackspeed = 250},
		}
	}

-- End of this If

-- Color Theme Configuration

Diablos.TS.Colors.Blurs = true -- true = enable blur effects (around the frames NOT in them).

Diablos.TS.Colors.Frame = Color(50, 50, 50, 230) -- Color of the frame.

Diablos.TS.Colors.FrameLeft = Color(40, 40, 40, 255) -- Color of the frame menu, the left part with buttons.

Diablos.TS.Colors.Panel = Color(100, 100, 100, 40) -- Color of the panels in the frame.

Diablos.TS.Colors.Header = Color(80, 80, 140, 200) -- Color of the headers.

Diablos.TS.Colors.Label = Color(220, 220, 220, 220) -- Color of the labels (text in frames).

Diablos.TS.Colors.LabelHovered = Color(120, 120, 120, 220) -- For buttons - color of the labels when they are in the \"hovered\" mode (there is the mouse on a button).

Diablos.TS.Colors.LabelDown = Color(0, 0, 0, 220) -- For buttons - color of the labels when they are in the \"down\" mode (you press left click on a button).

-- Content Download Configuration

Diablos.TS.Download.FastDL = false -- true = clients install the contents via FastDL.

Diablos.TS.Download.Workshop = true -- true = clients install the contents via Workshop.

-- End of the configuration file


/*
-- You can add the card reader to buy to the sport coach (this job needs to be created!) by taking the lines below and putting them onto your DarkRP entities.lua:
-- Card reader
DarkRP.createEntity("Training Card Reader", {
ent = "diablos_card_reader",
model = "models/tptsa/training_card_reader/training_card_reader.mdl",
price = 100,
max = 3,
cmd = "buytrainingcardreader",
allowed = {TEAM_SPORTCOACH}
})
*/

Diablos.TS:UpdateCurrentLanguage()
--PATH addons/the_perfect_training_system/lua/diablos_training/vgui/cl_dumbbell.lua:
function Diablos.TS:OpenDumbbellPanel(ply, ent)

	local trainingWeight = ent:GetWeight()
	local trainingData = Diablos.TS.DumbbellSizeEquivalence[trainingWeight]

	local frame = vgui.Create("DFrame")
	frame:SetSize(800, 500)
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

		draw.SimpleText(Diablos.TS:GetLanguageString("dumbbellFrameTitle"), "Diablos:Font:TS:30", 5, (h - 4) / 2, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
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
	docker.Paint = function(s, w, h)

	end

	local trainingInfo = vgui.Create("DPanel", docker)
	trainingInfo:Dock(TOP)
	trainingInfo:DockPadding(0, 0, 0, 0)
	trainingInfo:DockMargin(0, 0, 0, 10)
	trainingInfo:SetTall(60)
	trainingInfo.Paint = function(s, w, h)
		draw.SimpleText(Diablos.TS:GetLanguageString("dumbbellChooseExerciceTip1"), "Diablos:Font:TS:30", w / 2, 0, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.SimpleText(Diablos.TS:GetLanguageString("dumbbellChooseExerciceTip2"), "Diablos:Font:TS:25", w / 2, h, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
	end

	local SIZE_HEIGHT = 310

	local buttonPanel = vgui.Create("DPanel", docker)
	buttonPanel:Dock(TOP)
	buttonPanel:DockPadding(0, 0, 0, 0)
	buttonPanel:DockMargin(0, 0, 0, 10)
	buttonPanel:SetTall(SIZE_HEIGHT)
	buttonPanel.Paint = function(s, w, h) end

	local dumbbellType = vgui.Create("DPanel", buttonPanel)
	dumbbellType:Dock(LEFT)
	dumbbellType:DockMargin(0, 0, 0, 0)
	dumbbellType:DockPadding(10, 10, 10, 10)
	dumbbellType:SetWide(200)
	dumbbellType.Paint = function(s, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(Diablos.TS.Colors.Header) surface.DrawRect(0, h - 4, w, 4)

		draw.SimpleText(Diablos.TS:GetLanguageString("yourChoice"), "Diablos:Font:TS:35", w / 2, 5, Diablos.TS.Colors.bl, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)


		local weightValue = trainingData.kg
		if Diablos.TS.IsLbs then
			weightValue = trainingData.lbs
		end
		draw.SimpleText(string.format("%u %s", weightValue, Diablos.TS:GetWeightText()), "Diablos:Font:TS:35", w / 2, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

		local dataKeyText = string.format("%u %s", trainingData.nbKeys, Diablos.TS:GetLanguageString("keys"))
		local dataSecText = string.format("%u %s", trainingData.time, Diablos.TS:GetLanguageString("seconds"))
		draw.SimpleText(dataKeyText, "Diablos:Font:TS:20", 5, 45, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.SimpleText(dataSecText, "Diablos:Font:TS:20", 5, 65, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

		local keyPerSecond = trainingData.nbKeys / trainingData.time
		draw.SimpleText(string.format("%4.2f %s/s", keyPerSecond, Diablos.TS:GetLanguageString("key")), "Diablos:Font:TS:20", w - 5, 45, Diablos.TS.Colors.Label, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
	end

	local icon = vgui.Create("DModelPanel", dumbbellType)
	icon:Dock(TOP)
	icon:DockMargin(0, 10, 0, 50)
	icon:SetTall(250)
	icon:SetModel("models/tptsa/dumbbell/dumbbell.mdl")
	icon.Entity:SetBodygroup(0, trainingWeight - 1)
	Diablos.TS:UpdateRenderBounds(icon, 30)

	local otherChoices = vgui.Create("DPanel", buttonPanel)
	otherChoices:Dock(RIGHT)
	otherChoices:DockMargin(0, 0, 0, 0)
	otherChoices:DockPadding(0, 0, 0, 0)
	otherChoices:SetWide(500)
	otherChoices.Paint = function(s, w, h) end


	local horizontalPanel

	local i = 0
	local amountEntitiesShown = 0
	for k,v in ipairs(Diablos.TS.DumbbellSizeEquivalence) do
		if k == trainingWeight then continue end
		amountEntitiesShown = amountEntitiesShown + 1

		local marginLeft = 0
		if amountEntitiesShown % 3 == 1 then
			horizontalPanel = vgui.Create("DPanel", otherChoices)
			horizontalPanel:Dock(TOP)
			horizontalPanel:DockPadding(0, 0, 0, 0)
			horizontalPanel:DockMargin(0, 0, 0, 10)
			horizontalPanel:SetTall(SIZE_HEIGHT / 2 - 5)
			horizontalPanel.Paint = function(s, w, h) end

			i = i + 1
			marginLeft = 0
		end


		local otherDumbbellType = vgui.Create("DPanel", horizontalPanel)
		otherDumbbellType:Dock(LEFT)
		otherDumbbellType:DockPadding(0, 0, 0, 0)
		otherDumbbellType:DockMargin(marginLeft, 0, 80, 0)
		otherDumbbellType:SetWide(115)
		otherDumbbellType:SetTall(SIZE_HEIGHT / 2 - 5)
		otherDumbbellType.Paint = function(s, w, h)
			surface.SetDrawColor(Diablos.TS.Colors.FrameLeft) surface.DrawRect(0, 0, w, h)
			surface.SetDrawColor(Diablos.TS.Colors.rl) surface.DrawRect(0, h - 4, w, 4)

			local weightValue = v.kg
			if Diablos.TS.IsLbs then
				weightValue = v.lbs
			end
			draw.SimpleText(string.format("%u %s", weightValue, Diablos.TS:GetWeightText()), "Diablos:Font:TS:25", w / 2, h - 5, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

			local dataKeyText = string.format("%u %s", v.nbKeys, Diablos.TS:GetLanguageString("keys"))
			local dataSecText = string.format("%u %s", v.time, Diablos.TS:GetLanguageString("seconds"))
			draw.SimpleText(dataKeyText, "Diablos:Font:TS:15", 5, 5, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText(dataSecText, "Diablos:Font:TS:15", 5, 20, Diablos.TS.Colors.Label, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

			local keyPerSecond = v.nbKeys / v.time
			draw.SimpleText(string.format("%4.2f %s/s", keyPerSecond, Diablos.TS:GetLanguageString("key")), "Diablos:Font:TS:15:I", w / 2, 35, Diablos.TS.Colors.Label, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		end

		local otherIcon = vgui.Create("DModelPanel", otherDumbbellType)
		otherIcon:Dock(TOP)
		otherIcon:SetTall(SIZE_HEIGHT / 2)
		otherIcon:SetModel("models/tptsa/dumbbell/dumbbell.mdl")
		otherIcon.Entity:SetBodygroup(0, k - 1)
		Diablos.TS:UpdateRenderBounds(otherIcon, 40)
	end

	local startTraining = vgui.Create("DButton", docker)
	startTraining:Dock(TOP)
	startTraining:DockMargin(0, 0, 0, 0)
	startTraining:SetText(Diablos.TS:GetLanguageString("trainNow"))
	startTraining:SetFont("Diablos:Font:TS:35")
	startTraining:SetTall(50)
	startTraining.Paint = function(s, w, h)
		local curColor = Diablos.TS:PaintFunctions(s, Diablos.TS.Label, Diablos.TS.LabelHovered, Diablos.TS.LabelDown)
		s:SetTextColor(curColor)
		surface.SetDrawColor(Diablos.TS.Colors.g) surface.DrawRect(0, 0, w, h)
	end
	startTraining.DoClick = function(s)
		local blocklistNumber = Diablos.TS:GetKeyReference(Diablos.TS:GetKeyNameReference(Diablos.TS.StopTrainingKey))
		net.Start("TPTSA:BeginTraining")
			net.WriteEntity(ent)
			net.WriteUInt(blocklistNumber, 5) -- blocklisted number (stop training key)
		net.SendToServer()
		frame:Close()
	end
end
--PATH addons/warning_system/lua/warning_system_7452/client/categories/my_warnings.lua:
local CATEGORY = {}

CATEGORY.Order = 1
CATEGORY.title = WarningSystem7452em:__("tabs.my_warnings")
CATEGORY.icon = Material("materials/warning_system/warning.png", "noclamp smooth")

function CATEGORY:isAllowed(pPlayer)
    self.title = WarningSystem7452em:__("tabs.my_warnings")

    return true
end

function CATEGORY:onLoad(...)
    local tArgs = {...}

    local pUser = isstring(tArgs[1]) and tArgs[1] or IsValid(tArgs[1]) and tArgs[1] or LocalPlayer()

    local sID = nil
    if isstring(pUser) then
        sID = pUser
    else
        sID = pUser:SteamID64()
    end
    
    WarningSystem7452em:NetStart("WarningSystem7452em:Player:GetInfo", {
        types = {"warnings", "note"},
        target = sID
    })
end

function CATEGORY:onOpen(pnlContent, ...)
    local tArgs = {...}

    local pUser = isstring(tArgs[1]) and tArgs[1] or IsValid(tArgs[1]) and tArgs[1] or LocalPlayer()

    local sID = nil
    local sName = nil
    if isstring(pUser) then
        sID = pUser
    else
        sID = pUser:SteamID64()
        sName = pUser:Nick()
    end

    local pnlScroll = vgui.Create("WarningSystem7452em:DScrollPanel", pnlContent)
    
    function pnlContent:Paint(iW, iH)
        draw.SimpleText(sName or sID, "WarningSystem7452em:40M", iW * 0.5, iH * 0.022, WarningSystem7452em.CFG.theme.Texts, 1, 1)
        draw.SimpleText(WarningSystem7452em:GetTotalPoints(sID) .. " " .. WarningSystem7452em:__("penalty_points"):lower(), "WarningSystem7452em:30M", (iW / 3) - (iW / 6), iH * 0.0825, WarningSystem7452em.CFG.theme.Red, 1, 1)
        draw.SimpleText(WarningSystem7452em:GetActiveWarnings(sID) .. " " .. WarningSystem7452em:__("active_warnings"):lower(), "WarningSystem7452em:30M", (iW / 3) * 2 - (iW / 6), iH * 0.0825, WarningSystem7452em.CFG.theme.Orange, 1, 1)
        draw.SimpleText(WarningSystem7452em:GetTotalWarnings(sID) .. " " .. WarningSystem7452em:__("total_warnings"):lower(), "WarningSystem7452em:30M", (iW / 3) * 3 - (iW / 6), iH * 0.0825, WarningSystem7452em.CFG.theme.Green, 1, 1)

        draw.SimpleText(WarningSystem7452em:__("by"), "WarningSystem7452em:30M", iW * 0.09, select(2, pnlScroll:GetPos()) - iH * 0.035, WarningSystem7452em.CFG.theme.Texts2, 1, 1)
        draw.SimpleText(WarningSystem7452em:__("reason"), "WarningSystem7452em:30M", iW * 0.32, select(2, pnlScroll:GetPos()) - iH * 0.035, WarningSystem7452em.CFG.theme.Texts2, 1, 1)
        draw.SimpleText(WarningSystem7452em:__("penalty"), "WarningSystem7452em:30M", iW * 0.535, select(2, pnlScroll:GetPos()) - iH * 0.035, WarningSystem7452em.CFG.theme.Texts2, 1, 1)
        draw.SimpleText(WarningSystem7452em:__("date"), "WarningSystem7452em:30M", iW * 0.7, select(2, pnlScroll:GetPos()) - iH * 0.035, WarningSystem7452em.CFG.theme.Texts2, 1, 1)
        draw.SimpleText(WarningSystem7452em:__("expiration"), "WarningSystem7452em:30M", iW * 0.89, select(2, pnlScroll:GetPos()) - iH * 0.035, WarningSystem7452em.CFG.theme.Texts2, 1, 1)
    end


    if WarningSystem7452em:Can(LocalPlayer(), "view_note") then
        local txtNote = vgui.Create("WarningSystem7452em:DTextEntry", pnlContent)
        txtNote:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.17)
        txtNote:SetPos(0, pnlContent:GetTall() * 0.14)
        txtNote:SetMultiline(true)
        txtNote:SetText(WarningSystem7452em:GetNote(sID))
        txtNote.txt:SetEditable(WarningSystem7452em:Can(LocalPlayer(), "edit_note"))
        function txtNote.txt:OnGetFocus()
            self.sBefore = self:GetText()
        end
        function txtNote.txt:OnLoseFocus()
            if self.sBefore == self:GetText() then return end

            self.sBefore = self:GetText()

            WarningSystem7452em:NetStart("WarningSystem7452em:Player:UpdateNote", {
                target = sID,
                note = self:GetText()
            })
        end

        pnlScroll:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.6)
        pnlScroll:SetPos(0, pnlContent:GetTall() * 0.4)
    else
        pnlScroll:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.8)
        pnlScroll:SetPos(0, pnlContent:GetTall() * 0.2)
    end

    local tWarns = WarningSystem7452em:GetWarnings(sID)

    for i = #tWarns, 1, -1 do
        local tWarn = tWarns[i]
        local pnlWarning = vgui.Create("DPanel", pnlScroll)
        pnlWarning:Dock(TOP)
        pnlWarning:SetTall(pnlContent:GetTall() * 0.1)
        pnlWarning:DockMargin(0, 0, 0, pnlWarning:GetTall() * 0.1)
        pnlWarning.expired = (tWarn.expires_at and tWarn.expires_at != "NULL") and tonumber(tWarn.expires_at) < os.time()
        function pnlWarning:Paint(iW, iH)
            draw.RoundedBox(8, 0, 0, iW, iH, WarningSystem7452em.CFG.theme.Secondary)
            draw.RoundedBox(8, 1, 1, iW - 2, iH - 2, self.expired and ColorAlpha(WarningSystem7452em.CFG.theme.Tertiary, 80) or WarningSystem7452em.CFG.theme.Tertiary)
        end

        pnlWarning:InvalidateParent(true)

        local iOffsetX = 0

        local cMain = pnlWarning.expired and WarningSystem7452em.CFG.theme.Texts2 or WarningSystem7452em.CFG.theme.Texts

        iOffsetX = iOffsetX + WarningSystem7452em:splitText(tWarn.administrator, pnlWarning, iOffsetX, pnlScroll:GetWide() * 0.09 * 2, "WarningSystem7452em:20M", cMain, true)
        iOffsetX = iOffsetX + WarningSystem7452em:splitText(tWarn.reason, pnlWarning, iOffsetX, pnlScroll:GetWide() * 0.14 * 2, "WarningSystem7452em:20M", cMain, true)
        iOffsetX = iOffsetX + WarningSystem7452em:splitText(tostring(tWarn.penalty), pnlWarning, iOffsetX, pnlScroll:GetWide() * 0.076 * 2, "WarningSystem7452em:30M", cMain, true)
        iOffsetX = iOffsetX + WarningSystem7452em:splitText(os.date(WarningSystem7452em.CFG.TimeFormat, tonumber(tWarn.created_at)), pnlWarning, iOffsetX, pnlScroll:GetWide() * 0.092 * 2, "WarningSystem7452em:20M", cMain, true)
        iOffsetX = iOffsetX + WarningSystem7452em:splitText((tWarn.expires_at and tWarn.expires_at != "NULL" ) and os.date("%d/%m/%Y %H:%M", tWarn.expires_at) or "Never", pnlWarning, iOffsetX, pnlScroll:GetWide() * 0.092 * 2, "WarningSystem7452em:20M", pnlWarning.expired and WarningSystem7452em.CFG.theme.Texts2 or WarningSystem7452em.CFG.theme.Green, true)
    
        if WarningSystem7452em:Can(LocalPlayer(), "remove_warn") then
            local pnlOver = vgui.Create("DPanel", pnlWarning)
            pnlOver:Dock(FILL)
            pnlOver.iLerp = 0
            function pnlOver:Paint(iW ,iH)
                self.iLerp = Lerp(RealFrameTime() * 10, self.iLerp, self.bDisplay and 100 or 0)

                draw.RoundedBox(8, 0, 0, iW, iH, ColorAlpha(WarningSystem7452em.CFG.theme.Red, self.iLerp))
            end

            timer.Simple(0.1, function()
                if not IsValid(pnlOver) then return end
                    
                local btnRemove = vgui.Create("WarningSystem7452em:DImageButton", pnlWarning)
                btnRemove:SetVisible(false)
                btnRemove:SetImage("materials/warning_system/cross.png")
                btnRemove:SetBackgroundColor(WarningSystem7452em.CFG.theme.Red)
                if IsValid(btnRemove) and IsValid(pnlWarning) then
                    btnRemove:SetSize(pnlWarning:GetTall(), pnlWarning:GetTall())
                    btnRemove:SetPos(pnlWarning:GetWide(), 0)

                    local iDock = pnlWarning:GetTall() * 0.35
                    btnRemove.img:DockMargin(iDock, iDock, iDock, iDock)

                    btnRemove:SetVisible(true)
                end

                local function onOpen()
                    btnRemove:MoveTo(pnlWarning:GetWide() - btnRemove:GetWide(), 0, 0.1)
                    pnlOver.bDisplay = true
                end
                local function onClose()
                    btnRemove:MoveTo(pnlWarning:GetWide(), 0, 0.1)
                    pnlOver.bDisplay = nil
                end

                pnlOver.OnCursorEntered = onOpen
                pnlOver.OnCursorExited = function()
                    if not btnRemove:IsHovered() then onClose() end
                end
                btnRemove.OnCursorExited = function()
                    if not pnlOver:IsHovered() then onClose() end
                end
                btnRemove.DoClick = function()
                    WarningSystem7452em:NetStart("WarningSystem7452em:Player:UnWarn", { id = tWarn.id, target = sID })
                    pnlWarning:Remove()
                end
            end)
        end
    end

    if WarningSystem7452em:Can(LocalPlayer(), "add_warn") then
        pnlScroll:SetTall(pnlScroll:GetTall() - pnlContent:GetTall() * 0.09)
        
        local btnWarn = vgui.Create("WarningSystem7452em:DButton", pnlContent)
        btnWarn:SetSize(pnlContent:GetWide(), pnlContent:GetTall() * 0.07)
        btnWarn:SetPos(0, pnlContent:GetTall() - btnWarn:GetTall())
        btnWarn:SetText(WarningSystem7452em:__("warn_this_player"))
        btnWarn:SetFont("WarningSystem7452em:30M")
        function btnWarn:DoClick()
            WarningSystem7452em:DisplayWarningMenu(sID)
        end
    end
end

WarningSystem7452em:AddCategory("my_warnings", CATEGORY)

--PATH lua/wos/anim_extension/extensions/wos_exp.lua:
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

wOS.AnimExtension.Mounted[ "Experimental" ] = true
MsgC( Color( 255, 255, 255 ), "[wOS] Successfully mounted animation extension: Experimental\n" )
--PATH addons/sl_utils/lua/advdupe2/file_browser.lua:
--[[
	Title: Adv. Dupe 2 File Browser

	Desc: Displays and interfaces with duplication files.

	Author: TB

	Version: 1.0
]]

local History = {}
local Narrow = {}

local switch = true
local count = 0

local function AddHistory(txt)
	txt = string.lower(txt)
	local char1 = txt[1]
	local char2
	for i = 1, #History do
		char2 = History[i][1]
		if (char1 == char2) then
			if (History[i] == txt) then
				return
			end
		elseif (char1 < char2) then
			break
		end
	end

	table.insert(History, txt)
	table.sort(History, function(a, b) return a < b end)
end

local function NarrowHistory(txt, last)
	txt = string.lower(txt)
	local temp = {}
	if (last <= #txt and last ~= 0 and #txt ~= 1) then
		for i = 1, #Narrow do
			if (Narrow[i][last + 1] == txt[last + 1]) then
				table.insert(temp, Narrow[i])
			elseif (Narrow[i][last + 1] ~= '') then
				break
			end
		end
	else
		local char1 = txt[1]
		local char2
		for i = 1, #History do
			char2 = History[i][1]
			if (char1 == char2) then
				if (#txt > 1) then
					for k = 2, #txt do
						if (txt[k] ~= History[i][k]) then
							break
						end
						if (k == #txt) then
							table.insert(temp, History[i])
						end
					end
				else
					table.insert(temp, History[i])
				end
			elseif (char1 < char2) then
				break
			end
		end
	end

	Narrow = temp
end

local function tableSortNodes(tbl)
    for k, v in ipairs(tbl) do tbl[k] = {string.lower(v.Label:GetText()), v} end
    table.sort(tbl, function(a,b) return a[1]<b[1] end)
    for k, v in ipairs(tbl) do tbl[k] = v[2] end
end

local BROWSERPNL = {}
AccessorFunc(BROWSERPNL, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(BROWSERPNL, "m_bgColor", "BackgroundColor")
Derma_Hook(BROWSERPNL, "Paint", "Paint", "Panel")
Derma_Hook(BROWSERPNL, "PerformLayout", "Layout", "Panel")

local setbrowserpnlsize
local function SetBrowserPnlSize(self, x, y)
	setbrowserpnlsize(self, x, y)
	self.pnlCanvas:SetWide(x)
	self.pnlCanvas.VBar:SetUp(y, self.pnlCanvas:GetTall())
end

function BROWSERPNL:Init()
	setbrowserpnlsize = self.SetSize
	self.SetSize = SetBrowserPnlSize
	self.pnlCanvas = vgui.Create("advdupe2_browser_tree", self)

	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:SetBackgroundColor(self:GetSkin().text_bright)
end

function BROWSERPNL:OnVScroll(iOffset)
	self.pnlCanvas:SetPos(0, iOffset)
end

derma.DefineControl("advdupe2_browser_panel", "AD2 File Browser", BROWSERPNL, "Panel")

local BROWSER = {}
AccessorFunc(BROWSER, "m_pSelectedItem", "SelectedItem")
Derma_Hook(BROWSER, "Paint", "Paint", "Panel")

local origSetTall
local function SetTall(self, val)
	origSetTall(self, val)
	self.VBar:SetUp(self:GetParent():GetTall(), self:GetTall())
end

function BROWSER:Init()
	self:SetTall(0)
	origSetTall = self.SetTall
	self.SetTall = SetTall

	self.VBar = vgui.Create("DVScrollBar", self:GetParent())
	self.VBar:Dock(RIGHT)
	self.Nodes = 0
	self.ChildrenExpanded = {}
	self.ChildList = self
	self.m_bExpanded = true
	self.Folders = {}
	self.Files = {}
	self.LastClick = CurTime()
end

local function GetNodePath(node)
	local path = node.Label:GetText()
	local area = 0
	local name = ""
	node = node.ParentNode
	if (not node.ParentNode) then
		if (path == "-Public-") then
			area = 1
		elseif (path == "-Advanced Duplicator 1-") then
			area = 2
		end
		return "", area
	end

	while (true) do

		name = node.Label:GetText()
		if (name == "-Advanced Duplicator 2-") then
			break
		elseif (name == "-Public-") then
			area = 1
			break
		elseif (name == "-Advanced Duplicator 1-") then
			area = 2
			break
		end
		path = name .. "/" .. path
		node = node.ParentNode
	end

	return path, area
end

function BROWSER:DoNodeLeftClick(node)
	if (self.m_pSelectedItem == node and CurTime() - self.LastClick <= 0.25) then -- Check for double click
		if (node.Derma.ClassName == "advdupe2_browser_folder") then
			if (node.Expander) then
				node:SetExpanded() -- It's a folder, expand/collapse it
			end
		else
			AdvDupe2.UploadFile(GetNodePath(node))
		end
	else
		self:SetSelected(node) -- A node was clicked, select it
	end
	self.LastClick = CurTime()
end

local function AddNewFolder(node)
	local Controller = node.Control:GetParent():GetParent()
	local name = Controller.FileName:GetValue()
	local char = string.match(name, "[^%w_ ]")
	if char then
		AdvDupe2.Notify("Name contains invalid character ("..char..")!", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	if (name == "" or name == "Folder_Name...") then
		AdvDupe2.Notify("Name is blank!", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	local path, area = GetNodePath(node)
	if (area == 0) then
		path = AdvDupe2.DataFolder .. "/" .. path .. "/" .. name
	elseif (area == 1) then
		path = AdvDupe2.DataFolder .. "/=Public=/" .. path .. "/" .. name
	else
		path = "adv_duplicator/" .. path .. "/" .. name
	end

	if (file.IsDir(path, "DATA")) then
		AdvDupe2.Notify("Folder name already exists.", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	file.CreateDir(path)

	local Folder = node:AddFolder(name)
	node.Control:Sort(node)

	if (not node.m_bExpanded) then
		node:SetExpanded()
	end

	node.Control:SetSelected(Folder)
	if (Controller.Expanded) then
		AdvDupe2.FileBrowser:Slide(false)
	end
end

local function CollapseChildren(node)
	node.m_bExpanded = false
	if (node.Expander) then
		node.Expander:SetExpanded(false)
		node.ChildList:SetTall(0)
		for i = 1, #node.ChildrenExpanded do
			CollapseChildren(node.ChildrenExpanded[i])
		end
		node.ChildrenExpanded = {}
	end
end

local function CollapseParentsComplete(node)
	if (not node.ParentNode.ParentNode) then
		node:SetExpanded(false)
		return
	end
	CollapseParentsComplete(node.ParentNode)
end

function AdvDupe2.GetFilename(path, overwrite)
	if not overwrite and file.Exists(path .. ".txt", "DATA") then
		for i = 1, AdvDupe2.FileRenameTryLimit do
			local p = string.format("%s_%03d.txt", path, i)
			if not file.Exists(p, "DATA") then
				return p
			end
		end
		return false
	end
	return path .. ".txt"
end

local function GetFullPath(node)
	local path, area = GetNodePath(node)
	if (area == 0) then
		path = AdvDupe2.DataFolder .. "/" .. path .. "/"
	elseif (area == 1) then

	else
		path = "adv_duplicator/" .. path .. "/"
	end
	return path
end

local function GetNodeRoot(node)
	local Root
	while (true) do
		if (not node.ParentNode.ParentNode) then
			Root = node
			break
		end
		node = node.ParentNode
	end
	return Root
end

local function RenameFileCl(node, name)
	local path, area = GetNodePath(node)
	local File, FilePath, tempFilePath = "", "", ""
	if (area == 0) then
		tempFilePath = AdvDupe2.DataFolder .. "/" .. path
	elseif (area == 1) then
		tempFilePath = AdvDupe2.DataFolder .. "/=Public=/" .. path
	elseif (area == 2) then
		tempFilePath = "adv_duplicator/" .. path
	end

	File = file.Read(tempFilePath .. ".txt")
	FilePath = AdvDupe2.GetFilename(
		string.sub(tempFilePath, 1, #tempFilePath - #node.Label:GetText()) .. name)

	if (not FilePath) then
		AdvDupe2.Notify("Rename limit exceeded, could not rename.", NOTIFY_ERROR)
		return
	end
	file.Write(FilePath, File)
	if (file.Exists(FilePath, "DATA")) then
		file.Delete(tempFilePath .. ".txt")
		local NewName = string.Explode("/", FilePath)
		NewName = string.sub(NewName[#NewName], 1, -5)
		node.Label:SetText(NewName)
		node.Label:SizeToContents()
		AdvDupe2.Notify("File renamed to " .. NewName)
	else
		AdvDupe2.Notify("File was not renamed.", NOTIFY_ERROR)
	end

	node.Control:Sort(node.ParentNode)
end

local function MoveFileClient(node)
	if (not node) then
		AdvDupe2.Notify("Select a folder to move the file to.", NOTIFY_ERROR)
		return
	end
	if (node.Derma.ClassName == "advdupe2_browser_file") then
		AdvDupe2.Notify("You muse select a folder as a destination.", NOTIFY_ERROR)
		return
	end
	local base = AdvDupe2.DataFolder
	local ParentNode

	local node2 = node.Control.ActionNode
	local path, area = GetNodePath(node2)
	local path2, area2 = GetNodePath(node)

	if (area ~= area2 or path == path2) then
		AdvDupe2.Notify("Cannot move files between these directories.", NOTIFY_ERROR)
		return
	end
	if (area == 2) then base = "adv_duplicator" end

	local savepath = AdvDupe2.GetFilename(
						 base .. "/" .. path2 .. "/" .. node2.Label:GetText())
	local OldFile = base .. "/" .. path .. ".txt"

	local ReFile = file.Read(OldFile)
	file.Write(savepath, ReFile)
	file.Delete(OldFile)
	local name2 = string.Explode("/", savepath)
	name2 = string.sub(name2[#name2], 1, -5)
	node2.Control:RemoveNode(node2)
	node2 = node:AddFile(name2)
	node2.Control:Sort(node)
	AdvDupe2.FileBrowser:Slide(false)
	AdvDupe2.FileBrowser.Info:SetVisible(false)
end

local function DeleteFilesInFolders(path)
	local files, folders = file.Find(path .. "*", "DATA")

	for k, v in pairs(files) do file.Delete(path .. v) end

	for k, v in pairs(folders) do DeleteFilesInFolders(path .. v .. "/") end

	file.Delete(path)
end

local function SearchNodes(node, name)
	local tab = {}
	for k, v in pairs(node.Files) do
		if (string.find(string.lower(v.Label:GetText()), name)) then
			table.insert(tab, v)
		end
	end

	for k, v in pairs(node.Folders) do
		for i, j in pairs(SearchNodes(v, name)) do
			table.insert(tab, j)
		end
	end

	return tab
end

local function Search(node, name)
	local pnFileBr = AdvDupe2.FileBrowser
	pnFileBr.Search = vgui.Create("advdupe2_browser_panel", pnFileBr)
	pnFileBr.Search:SetPos(pnFileBr.Browser:GetPos())
	pnFileBr.Search:SetSize(pnFileBr.Browser:GetSize())
	pnFileBr.Search.pnlCanvas.Search = true
	pnFileBr.Browser:SetVisible(false)
	local Files = SearchNodes(node, name)
	tableSortNodes(Files)
	for k, v in pairs(Files) do
		pnFileBr.Search.pnlCanvas:AddFile(v.Label:GetText()).Ref = v
	end
end

function BROWSER:DoNodeRightClick(node)
	self:SetSelected(node)

	local parent = self:GetParent():GetParent()
	parent.FileName:KillFocus()
	parent.Desc:KillFocus()
	local Menu = DermaMenu()
	local root = GetNodeRoot(node).Label:GetText()
	if (node.Derma.ClassName == "advdupe2_browser_file") then
		if (node.Control.Search) then
			Menu:AddOption("Open", function()
				AdvDupe2.UploadFile(GetNodePath(node.Ref))
			end)
			Menu:AddOption("Preview", function()
				local ReadPath, ReadArea = GetNodePath(node.Ref)
				if (ReadArea == 0) then
					ReadPath = AdvDupe2.DataFolder .. "/" .. ReadPath .. ".txt"
				elseif (ReadArea == 1) then
					ReadPath = AdvDupe2.DataFolder .. "/-Public-/" .. ReadPath .. ".txt"
				else
					ReadPath = "adv_duplicator/" .. ReadPath .. ".txt"
				end
				if (not file.Exists(ReadPath, "DATA")) then
					AdvDupe2.Notify("File does not exist", NOTIFY_ERROR)
					return
				end

				local read = file.Read(ReadPath)
				local name = string.Explode("/", ReadPath)
				name = name[#name]
				name = string.sub(name, 1, #name - 4)
				local success, dupe, info, moreinfo = AdvDupe2.Decode(read)
				if (success) then
					AdvDupe2.LoadGhosts(dupe, info, moreinfo, name, true)
				end
			end)
		else
			Menu:AddOption("Open", function()
				AdvDupe2.UploadFile(GetNodePath(node))
			end)
			Menu:AddOption("Preview", function()
				local ReadPath, ReadArea = GetNodePath(node)
				if (ReadArea == 0) then
					ReadPath = AdvDupe2.DataFolder .. "/" .. ReadPath .. ".txt"
				elseif (ReadArea == 1) then
					ReadPath = AdvDupe2.DataFolder .. "/-Public-/" .. ReadPath .. ".txt"
				else
					ReadPath = "adv_duplicator/" .. ReadPath .. ".txt"
				end
				if (not file.Exists(ReadPath, "DATA")) then
					AdvDupe2.Notify("File does not exist", NOTIFY_ERROR)
					return
				end

				local read = file.Read(ReadPath)
				local name = string.Explode("/", ReadPath)
				name = name[#name]
				name = string.sub(name, 1, #name - 4)
				local success, dupe, info, moreinfo = AdvDupe2.Decode(read)
				if (success) then
					AdvDupe2.LoadGhosts(dupe, info, moreinfo, name, true)
				end
			end)
			Menu:AddSpacer()
			Menu:AddOption("Rename", function()
				if (parent.Expanding) then return end
				parent.Submit:SetMaterial("icon16/page_edit.png")
				parent.Submit:SetTooltip("Rename File")
				parent.Desc:SetVisible(false)
				parent.Info:SetVisible(false)
				parent.FileName.FirstChar = true
				parent.FileName.PrevText = parent.FileName:GetValue()
				parent.FileName:SetVisible(true)
				parent.FileName:SetText(node.Label:GetText())
				parent.FileName:SelectAllOnFocus(true)
				parent.FileName:OnMousePressed()
				parent.FileName:RequestFocus()
				parent.Expanding = true
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local name = parent.FileName:GetValue()
					if (name == "") then
						AdvDupe2.Notify("Name field is blank.", NOTIFY_ERROR)
						parent.FileName:SelectAllOnFocus(true)
						parent.FileName:OnGetFocus()
						parent.FileName:RequestFocus()
						return
					end
					AddHistory(name)
					RenameFileCl(node, name)
					AdvDupe2.FileBrowser:Slide(false)
				end
				parent.FileName.OnEnter = parent.Submit.DoClick
			end)
			Menu:AddOption("Move File", function()
				parent.Submit:SetMaterial("icon16/page_paste.png")
				parent.Submit:SetTooltip("Move File")
				parent.FileName:SetVisible(false)
				parent.Desc:SetVisible(false)
				parent.Info:SetText(
					"Select the folder you want to move \nthe File to.")
				parent.Info:SizeToContents()
				parent.Info:SetVisible(true)
				AdvDupe2.FileBrowser:Slide(true)
				node.Control.ActionNode = node
				parent.Submit.DoClick = function()
					MoveFileClient(node.Control.m_pSelectedItem)
				end
			end)
			Menu:AddOption("Delete", function()
				parent.Submit:SetMaterial("icon16/bin_empty.png")
				parent.Submit:SetTooltip("Delete File")
				parent.FileName:SetVisible(false)
				parent.Desc:SetVisible(false)
				if (#node.Label:GetText() > 22) then
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FILE, "' ..
							node.Label:GetText() .. '" \nfrom your CLIENT?')
				else
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FILE, "' ..
							node.Label:GetText() .. '" from your CLIENT?')
				end
				parent.Info:SizeToContents()
				parent.Info:SetVisible(true)
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local path, area = GetNodePath(node)
					if (area == 1) then
						path = "-Public-/" .. path
					end
					if (area == 2) then
						path = "adv_duplicator/" .. path .. ".txt"
					else
						path = AdvDupe2.DataFolder .. "/" .. path .. ".txt"
					end
					node.Control:RemoveNode(node)
					file.Delete(path)
					AdvDupe2.FileBrowser:Slide(false)
				end
			end)
		end
	else
		if (root ~= "-Advanced Duplicator 1-") then
			Menu:AddOption("Save", function()
				if (parent.Expanding) then return end
				parent.Submit:SetMaterial("icon16/page_save.png")
				parent.Submit:SetTooltip("Save Duplication")
				if (parent.FileName:GetValue() == "Folder_Name...") then
					parent.FileName:SetText("File_Name...")
				end
				parent.Desc:SetVisible(true)
				parent.Info:SetVisible(false)
				parent.FileName.FirstChar = true
				parent.FileName.PrevText = parent.FileName:GetValue()
				parent.FileName:SetVisible(true)
				parent.FileName:SelectAllOnFocus(true)
				parent.FileName:OnMousePressed()
				parent.FileName:RequestFocus()
				node.Control.ActionNode = node
				parent.Expanding = true
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local name = parent.FileName:GetValue()
					if (name == "" or name == "File_Name...") then
						AdvDupe2.Notify("Name field is blank.", NOTIFY_ERROR)
						parent.FileName:SelectAllOnFocus(true)
						parent.FileName:OnGetFocus()
						parent.FileName:RequestFocus()
						return
					end
					local desc = parent.Desc:GetValue()
					if (desc == "Description...") then
						desc = ""
					end
					AdvDupe2.SavePath = GetFullPath(node) .. name
					AddHistory(name)
					if (game.SinglePlayer()) then
						RunConsoleCommand("AdvDupe2_SaveFile", name, desc, GetNodePath(node))
					else
						RunConsoleCommand("AdvDupe2_SaveFile", name)
					end
					AdvDupe2.FileBrowser:Slide(false)
				end
				parent.FileName.OnEnter =
					function()
						parent.FileName:KillFocus()
						parent.Desc:SelectAllOnFocus(true)
						parent.Desc.OnMousePressed()
						parent.Desc:RequestFocus()
					end
				parent.Desc.OnEnter = parent.Submit.DoClick
			end)
		end
		Menu:AddOption("New Folder", function()
			if (parent.Expanding) then return end
			parent.Submit:SetMaterial("icon16/folder_add.png")
			parent.Submit:SetTooltip("Add new folder")
			if (parent.FileName:GetValue() == "File_Name...") then
				parent.FileName:SetText("Folder_Name...")
			end
			parent.Desc:SetVisible(false)
			parent.Info:SetVisible(false)
			parent.FileName.FirstChar = true
			parent.FileName.PrevText = parent.FileName:GetValue()
			parent.FileName:SetVisible(true)
			parent.FileName:SelectAllOnFocus(true)
			parent.FileName:OnMousePressed()
			parent.FileName:RequestFocus()
			parent.Expanding = true
			AdvDupe2.FileBrowser:Slide(true)
			parent.Submit.DoClick = function() AddNewFolder(node) end
			parent.FileName.OnEnter = parent.Submit.DoClick
		end)
		Menu:AddOption("Search", function()
			parent.Submit:SetMaterial("icon16/find.png")
			parent.Submit:SetTooltip("Search Files")
			if (parent.FileName:GetValue() == "Folder_Name...") then
				parent.FileName:SetText("File_Name...")
			end
			parent.Desc:SetVisible(false)
			parent.Info:SetVisible(false)
			parent.FileName.FirstChar = true
			parent.FileName.PrevText = parent.FileName:GetValue()
			parent.FileName:SetVisible(true)
			parent.FileName:SelectAllOnFocus(true)
			parent.FileName:OnMousePressed()
			parent.FileName:RequestFocus()
			parent.Expanding = true
			AdvDupe2.FileBrowser:Slide(true)
			parent.Submit.DoClick = function()
				Search(node, string.lower(parent.FileName:GetValue()))
				AddHistory(parent.FileName:GetValue())
				parent.FileName:SetVisible(false)
				parent.Submit:SetMaterial("icon16/arrow_undo.png")
				parent.Submit:SetTooltip("Return to Browser")
				parent.Info:SetVisible(true)
				parent.Info:SetText(#parent.Search.pnlCanvas.Files ..
										' files found searching for, "' ..
										parent.FileName:GetValue() .. '"')
				parent.Info:SizeToContents()
				parent.Submit.DoClick = function()
					parent.Search:Remove()
					parent.Search = nil
					parent.Browser:SetVisible(true)
					AdvDupe2.FileBrowser:Slide(false)
					parent.Cancel:SetVisible(true)
				end
				parent.Cancel:SetVisible(false)
			end
			parent.FileName.OnEnter = parent.Submit.DoClick
		end)
		if (node.Label:GetText()[1] ~= "-") then
			Menu:AddOption("Delete", function()
				parent.Submit:SetMaterial("icon16/bin_empty.png")
				parent.Submit:SetTooltip("Delete Folder")
				parent.FileName:SetVisible(false)
				parent.Desc:SetVisible(false)
				if (#node.Label:GetText() > 22) then
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FOLDER, "' ..
							node.Label:GetText() .. '" \nfrom your CLIENT?')
				else
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FOLDER, "' ..
							node.Label:GetText() .. '" from your CLIENT?')
				end
				parent.Info:SizeToContents()
				parent.Info:SetVisible(true)
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local path, area = GetNodePath(node)
					if (area == 1) then
						path = "-Public-/" .. path
					end
					if (area == 2) then
						path = "adv_duplicator/" .. path .. "/"
					else
						path = AdvDupe2.DataFolder .. "/" .. path .. "/"
					end
					node.Control:RemoveNode(node)
					DeleteFilesInFolders(path)
					AdvDupe2.FileBrowser:Slide(false)
				end
			end)
		end
	end
	if (not node.Control.Search) then
		Menu:AddSpacer()
		Menu:AddOption("Collapse Folder", function()
			if (node.ParentNode.ParentNode) then
				node.ParentNode:SetExpanded(false)
			end
		end)
		Menu:AddOption("Collapse Root", function() CollapseParentsComplete(node) end)
		if (parent.Expanded) then
			Menu:AddOption("Cancel Action", function() parent.Cancel:DoClick() end)
		end
	end

	Menu:Open()
end

local function CollapseParents(node, val)
	if (not node) then return end
	node.ChildList:SetTall(node.ChildList:GetTall() - val)
	CollapseParents(node.ParentNode, val)
end

function BROWSER:RemoveNode(node)
	local parent = node.ParentNode
	parent.Nodes = parent.Nodes - 1
	if (node.IsFolder) then
		if (node.m_bExpanded) then
			CollapseParents(parent, node.ChildList:GetTall() + 20)
			for i = 1, #parent.ChildrenExpanded do
				if (node == parent.ChildrenExpanded[i]) then
					table.remove(parent.ChildrenExpanded, i)
					break
				end
			end
		elseif (parent.m_bExpanded) then
			CollapseParents(parent, 20)
		end
		for i = 1, #parent.Folders do
			if (node == parent.Folders[i]) then
				table.remove(parent.Folders, i)
			end
		end
		node.ChildList:Remove()
		node:Remove()
	else
		for i = 1, #parent.Files do
			if (node == parent.Files[i]) then
				table.remove(parent.Files, i)
			end
		end
		CollapseParents(parent, 20)
		node:Remove()
		if (#parent.Files == 0 and #parent.Folders == 0) then
			parent.Expander:Remove()
			parent.Expander = nil
			parent.m_bExpanded = false
		end
	end
	if (self.VBar.Scroll > self.VBar.CanvasSize) then
		self.VBar:SetScroll(self.VBar.Scroll)
	end
	if (self.m_pSelectedItem) then
		self.m_pSelectedItem = nil
	end
end

function BROWSER:OnMouseWheeled(dlta)
	return self.VBar:OnMouseWheeled(dlta)
end

function BROWSER:AddFolder(text)
	local node = vgui.Create("advdupe2_browser_folder", self)
	node.Control = self

	node.Offset = 0
	node.ChildrenExpanded = {}
	node.Icon:SetPos(18, 1)
	node.Label:SetPos(44, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.ParentNode = self
	node.IsFolder = true
	self.Nodes = self.Nodes + 1
	node.Folders = {}
	node.Files = {}
	table.insert(self.Folders, node)
	self:SetTall(self:GetTall() + 20)

	return node
end

function BROWSER:AddFile(text)
	local node = vgui.Create("advdupe2_browser_file", self)
	node.Control = self
	node.Offset = 0
	node.Icon:SetPos(18, 1)
	node.Label:SetPos(44, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.ParentNode = self
	self.Nodes = self.Nodes + 1
	table.insert(self.Files, node)
	self:SetTall(self:GetTall() + 20)

	return node
end

function BROWSER:Sort(node)
	tableSortNodes(node.Folders)
	tableSortNodes(node.Files)

	for i = 1, #node.Folders do
		node.Folders[i]:SetParent(nil)
		node.Folders[i]:SetParent(node.ChildList)
		node.Folders[i].ChildList:SetParent(nil)
		node.Folders[i].ChildList:SetParent(node.ChildList)
	end
	for i = 1, #node.Files do
		node.Files[i]:SetParent(nil)
		node.Files[i]:SetParent(node.ChildList)
	end
end

function BROWSER:SetSelected(node)
	if (IsValid(self.m_pSelectedItem)) then
		self.m_pSelectedItem:SetSelected(false)
	end
	self.m_pSelectedItem = node
	if (node) then node:SetSelected(true) end
end

local function ExpandParents(node, val)
	if (not node) then return end
	node.ChildList:SetTall(node.ChildList:GetTall() + val)
	ExpandParents(node.ParentNode, val)
end

function BROWSER:Expand(node)
	node.ChildList:SetTall(node.Nodes * 20)
	table.insert(node.ParentNode.ChildrenExpanded, node)
	ExpandParents(node.ParentNode, node.Nodes * 20)
end

local function ExtendParents(node)
	if (not node) then return end
	node.ChildList:SetTall(node.ChildList:GetTall() + 20)
	ExtendParents(node.ParentNode)
end

function BROWSER:Extend(node)
	node.ChildList:SetTall(node.ChildList:GetTall() + 20)
	ExtendParents(node.ParentNode)
end

function BROWSER:Collapse(node)
	CollapseParents(node.ParentNode, node.ChildList:GetTall())

	for i = 1, #node.ParentNode.ChildrenExpanded do
		if (node.ParentNode.ChildrenExpanded[i] == node) then
			table.remove(node.ParentNode.ChildrenExpanded, i)
			break
		end
	end
	CollapseChildren(node)
end

function BROWSER:RenameNode(name)
	self.ActionNode.Label:SetText(name)
	self.ActionNode.Label:SizeToContents()
	self:Sort(self.ActionNode.ParentNode)
end

function BROWSER:MoveNode(name)
	self:RemoveNode(self.ActionNode)
	self.ActionNode2:AddFile(name)
	self:Sort(self.ActionNode2)
end

function BROWSER:DeleteNode()
	self:RemoveNode(self.ActionNode)
end

derma.DefineControl("advdupe2_browser_tree", "AD2 File Browser", BROWSER, "Panel")

local FOLDER = {}

AccessorFunc(FOLDER, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(FOLDER, "m_bgColor", "BackgroundColor")

Derma_Hook(FOLDER, "Paint", "Paint", "Panel")

function FOLDER:Init()
	self:SetMouseInputEnabled(true)

	self:SetTall(20)
	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:SetBackgroundColor(Color(0, 0, 0, 0))

	self.Icon = vgui.Create("DImage", self)
	self.Icon:SetImage("icon16/folder.png")

	self.Icon:SizeToContents()

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetDark(true)

	self.m_bExpanded = false
	self.Nodes = 0
	self.ChildrenExpanded = {}

	self:Dock(TOP)

	self.ChildList = vgui.Create("Panel", self:GetParent())
	self.ChildList:Dock(TOP)
	self.ChildList:SetTall(0)
end

local function ExpandNode(self)
	self:GetParent():SetExpanded()
end

function FOLDER:AddFolder(text)
	if (self.Nodes == 0) then
		self.Expander = vgui.Create("DExpandButton", self)
		self.Expander.DoClick = ExpandNode
		self.Expander:SetPos(self.Offset, 2)
	end

	local node = vgui.Create("advdupe2_browser_folder", self.ChildList)
	node.Control = self.Control

	node.Offset = self.Offset + 20

	node.Icon:SetPos(18 + node.Offset, 1)
	node.Label:SetPos(44 + node.Offset, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.Label:SetDark(true)
	node.ParentNode = self
	node.IsFolder = true
	node.Folders = {}
	node.Files = {}

	self.Nodes = self.Nodes + 1
	table.insert(self.Folders, node)

	if (self.m_bExpanded) then
		self.Control:Extend(self)
	end

	return node
end

function FOLDER:AddFile(text)
	if (self.Nodes == 0) then
		self.Expander = vgui.Create("DExpandButton", self)
		self.Expander.DoClick = ExpandNode
		self.Expander:SetPos(self.Offset, 2)
	end

	local node = vgui.Create("advdupe2_browser_file", self.ChildList)
	node.Control = self.Control
	node.Offset = self.Offset + 20
	node.Icon:SetPos(18 + node.Offset, 1)
	node.Label:SetPos(44 + node.Offset, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.Label:SetDark(true)
	node.ParentNode = self

	self.Nodes = self.Nodes + 1
	table.insert(self.Files, node)

	if (self.m_bExpanded) then
		self.Control:Extend(self)
	end

	return node
end

function FOLDER:SetExpanded(bool)
	if (not self.Expander) then return end
	if (bool == nil) then
		self.m_bExpanded = not self.m_bExpanded
	else
		self.m_bExpanded = bool
	end
	self.Expander:SetExpanded(self.m_bExpanded)
	if (self.m_bExpanded) then
		self.Control:Expand(self)
	else
		self.Control:Collapse(self)
	end
end

function FOLDER:SetSelected(bool)
	if (bool) then
		self:SetBackgroundColor(self:GetSkin().bg_color_bright)
	else
		self:SetBackgroundColor(Color(0, 0, 0, 0))
	end
end

function FOLDER:OnMousePressed(code)
	if (code == 107) then
		self.Control:DoNodeLeftClick(self)
	elseif (code == 108) then
		self.Control:DoNodeRightClick(self)
	end
end

derma.DefineControl("advdupe2_browser_folder", "AD2 Browser Folder node", FOLDER, "Panel")

local FILE = {}

AccessorFunc(FILE, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(FILE, "m_bgColor", "BackgroundColor")
Derma_Hook(FILE, "Paint", "Paint", "Panel")

function FILE:Init()
	self:SetMouseInputEnabled(true)

	self:SetTall(20)
	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:SetBackgroundColor(Color(0, 0, 0, 0))

	self.Icon = vgui.Create("DImage", self)
	self.Icon:SetImage("icon16/page.png")

	self.Icon:SizeToContents()

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetDark(true)

	self:Dock(TOP)
end

function FILE:SetSelected(bool)
	if (bool) then
		self:SetBackgroundColor(self:GetSkin().bg_color_bright)
	else
		self:SetBackgroundColor(Color(0, 0, 0, 0))
	end
end

function FILE:OnMousePressed(code)
	if (code == 107) then
		self.Control:DoNodeLeftClick(self)
	elseif (code == 108) then
		self.Control:DoNodeRightClick(self)
	end
end

derma.DefineControl("advdupe2_browser_file", "AD2 Browser File node", FILE, "Panel")

local PANEL = {}
AccessorFunc(PANEL, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(PANEL, "m_bgColor", "BackgroundColor")
Derma_Hook(PANEL, "Paint", "Paint", "Panel")
Derma_Hook(PANEL, "PerformLayout", "Layout", "Panel")

function PANEL:PerformLayout()
	if (self:GetWide() == self.LastX) then return end
	local x = self:GetWide()

	if (self.Search) then
		self.Search:SetWide(x)
	end

	self.Browser:SetWide(x)
	local x2, y2 = self.Browser:GetPos()
	local BtnX = x - self.Help:GetWide() - 5
	self.Help:SetPos(BtnX, 3)
	BtnX = BtnX - self.Refresh:GetWide() - 5
	self.Refresh:SetPos(BtnX, 3)

	BtnX = x - self.Submit:GetWide() - 15
	self.Cancel:SetPos(BtnX, self.Browser:GetTall() + 20)
	BtnX = BtnX - self.Submit:GetWide() - 5
	self.Submit:SetPos(BtnX, self.Browser:GetTall() + 20)

	self.FileName:SetWide(BtnX - 10)
	self.FileName:SetPos(5, self.Browser:GetTall() + 20)
	self.Desc:SetWide(x - 10)
	self.Desc:SetPos(5, self.Browser:GetTall() + 39)
	self.Info:SetPos(5, self.Browser:GetTall() + 20)

	self.LastX = x
end

local pnlorigsetsize
local function PanelSetSize(self, x, y)
	if (not self.LaidOut) then
		pnlorigsetsize(self, x, y)

		self.Browser:SetSize(x, y - 20)
		self.Browser:SetPos(0, 20)

		if (self.Search) then
			self.Search:SetSize(x, y - 20)
			self.Search:SetPos(0, 20)
		end

		self.LaidOut = true
	else
		pnlorigsetsize(self, x, y)
	end

end

local function PurgeFiles(path, curParent)
	local files, directories = file.Find(path .. "*", "DATA")
	if (directories) then
		for k, v in pairs(directories) do
			curParent = curParent:AddFolder(v)
			PurgeFiles(path .. v .. "/", curParent)
			curParent = curParent.ParentNode
		end
	end

	if (files) then
		for k, v in pairs(files) do
			curParent:AddFile(string.sub(v, 1, #v - 4))
		end
	end
end

local function UpdateClientFiles()

	local pnlCanvas = AdvDupe2.FileBrowser.Browser.pnlCanvas

	for i = 1, 2 do
		if (pnlCanvas.Folders[1]) then
			pnlCanvas:RemoveNode(pnlCanvas.Folders[1])
		end
	end

	PurgeFiles("advdupe2/", pnlCanvas:AddFolder("-Advanced Duplicator 2-"))

	PurgeFiles("adv_duplicator/", pnlCanvas:AddFolder("-Advanced Duplicator 1-"))

	if (pnlCanvas.Folders[2]) then
		if (#pnlCanvas.Folders[2].Folders == 0 and #pnlCanvas.Folders[2].Files == 0) then
			pnlCanvas:RemoveNode(pnlCanvas.Folders[2])
		end

		pnlCanvas.Folders[1]:SetParent(nil)
		pnlCanvas.Folders[1]:SetParent(pnlCanvas.ChildList)
		pnlCanvas.Folders[1].ChildList:SetParent(nil)
		pnlCanvas.Folders[1].ChildList:SetParent(pnlCanvas.ChildList)
	end

end

function PANEL:Init()

	AdvDupe2.FileBrowser = self
	self.Expanded = false
	self.Expanding = false
	self.LastX = 0
	self.LastY = 0
	pnlorigsetsize = self.SetSize
	self.SetSize = PanelSetSize

	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetBackgroundColor(self:GetSkin().bg_color_bright)

	self.Browser = vgui.Create("advdupe2_browser_panel", self)
	UpdateClientFiles()
	self.Refresh = vgui.Create("DImageButton", self)
	self.Refresh:SetMaterial("icon16/arrow_refresh.png")
	self.Refresh:SizeToContents()
	self.Refresh:SetTooltip("Refresh Files")
	self.Refresh.DoClick = function(button) UpdateClientFiles() end

	self.Help = vgui.Create("DImageButton", self)
	self.Help:SetMaterial("icon16/help.png")
	self.Help:SizeToContents()
	self.Help:SetTooltip("Help Section")
	self.Help.DoClick = function(btn)
		local Menu = DermaMenu()
		Menu:AddOption("Bug Reporting", function()
			gui.OpenURL("https://github.com/wiremod/advdupe2/issues")
		end)
		Menu:AddOption("Controls", function()
			gui.OpenURL("https://github.com/wiremod/advdupe2/wiki/Controls")
		end)
		Menu:AddOption("Commands", function()
			gui.OpenURL(
				"https://github.com/wiremod/advdupe2/wiki/Server-settings")
		end)
		Menu:Open()
	end

	self.Submit = vgui.Create("DImageButton", self)
	self.Submit:SetMaterial("icon16/page_save.png")
	self.Submit:SizeToContents()
	self.Submit:SetTooltip("Confirm Action")
	self.Submit.DoClick = function()
		self.Expanding = true
		AdvDupe2.FileBrowser:Slide(false)
	end

	self.Cancel = vgui.Create("DImageButton", self)
	self.Cancel:SetMaterial("icon16/cross.png")
	self.Cancel:SizeToContents()
	self.Cancel:SetTooltip("Cancel Action")
	self.Cancel.DoClick = function()
		self.Expanding = true
		AdvDupe2.FileBrowser:Slide(false)
	end

	self.FileName = vgui.Create("DTextEntry", self)
	self.FileName:SetAllowNonAsciiCharacters(true)
	self.FileName:SetText("File_Name...")
	self.FileName.Last = 0

	self.FileName.OnEnter = function()
		self.FileName:KillFocus()
		self.Desc:SelectAllOnFocus(true)
		self.Desc.OnMousePressed()
		self.Desc:RequestFocus()
	end
	self.FileName.OnMousePressed = function()
		self.FileName:OnGetFocus()
		if (self.FileName:GetValue() == "File_Name..." or
			self.FileName:GetValue() == "Folder_Name...") then
			self.FileName:SelectAllOnFocus(true)
		end
	end
	self.FileName:SetUpdateOnType(true)
	self.FileName.OnTextChanged = function()

		if (self.FileName.FirstChar) then
			if (string.lower(self.FileName:GetValue()[1] or "") == string.lower(input.LookupBinding("menu") or "q")) then
				self.FileName:SetText(self.FileName.PrevText)
				self.FileName:SelectAll()
				self.FileName.FirstChar = false
			else
				self.FileName.FirstChar = false
			end
		end

		local new, changed = self.FileName:GetValue():gsub("[^%w_ ]", "")
		if changed > 0 then
			self.FileName:SetText(new)
			self.FileName:SetCaretPos(#new)
		end
		if (#self.FileName:GetValue() > 0) then
			NarrowHistory(self.FileName:GetValue(), self.FileName.Last)
			local options = {}
			if (#Narrow > 4) then
				for i = 1, 4 do table.insert(options, Narrow[i]) end
			else
				options = Narrow
			end
			if (#options ~= 0 and #self.FileName:GetValue() ~= 0) then
				self.FileName.HistoryPos = 0
				self.FileName:OpenAutoComplete(options)
				self.FileName.Menu.Attempts = 1
				if (#Narrow > 4) then
					self.FileName.Menu:AddOption("...", function() end)
				end
			elseif (IsValid(self.FileName.Menu)) then
				self.FileName.Menu:Remove()
			end
		end
		self.FileName.Last = #self.FileName:GetValue()
	end
	self.FileName.OnKeyCodeTyped = function(txtbox, code)
		txtbox:OnKeyCode(code)

		if (code == KEY_ENTER and not txtbox:IsMultiline() and txtbox:GetEnterAllowed()) then
			if (txtbox.HistoryPos == 5 and txtbox.Menu:ChildCount() == 5) then
				if ((txtbox.Menu.Attempts + 1) * 4 < #Narrow) then
					for i = 1, 4 do
						txtbox.Menu:GetChild(i):SetText(Narrow[i + txtbox.Menu.Attempts * 4])
					end
				else
					txtbox.Menu:GetChild(5):Remove()
					for i = 4, (txtbox.Menu.Attempts * 4 - #Narrow) * -1 + 1, -1 do
						txtbox.Menu:GetChild(i):Remove()
					end

					for i = 1, #Narrow - txtbox.Menu.Attempts * 4 do
						txtbox.Menu:GetChild(i):SetText(Narrow[i + txtbox.Menu.Attempts * 4])
					end
				end
				txtbox.Menu:ClearHighlights()
				txtbox.Menu:HighlightItem(txtbox.Menu:GetChild(1))
				txtbox.HistoryPos = 1
				txtbox.Menu.Attempts = txtbox.Menu.Attempts + 1
				return true
			end

			if (IsValid(txtbox.Menu)) then
				txtbox.Menu:Remove()
			end
			txtbox:FocusNext()
			txtbox:OnEnter()
			txtbox.HistoryPos = 0
		end

		if (txtbox.m_bHistory or IsValid(txtbox.Menu)) then
			if (code == KEY_UP) then
				txtbox.HistoryPos = txtbox.HistoryPos - 1;
				if (txtbox.HistoryPos ~= -1 or txtbox.Menu:ChildCount() ~= 5) then
					txtbox:UpdateFromHistory()
				else
					txtbox.Menu:ClearHighlights()
					txtbox.Menu:HighlightItem(txtbox.Menu:GetChild(5))
					txtbox.HistoryPos = 5
				end
			end
			if (code == KEY_DOWN or code == KEY_TAB) then
				txtbox.HistoryPos = txtbox.HistoryPos + 1;
				if (txtbox.HistoryPos ~= 5 or txtbox.Menu:ChildCount() ~= 5) then
					txtbox:UpdateFromHistory()
				else
					txtbox.Menu:ClearHighlights()
					txtbox.Menu:HighlightItem(txtbox.Menu:GetChild(5))
				end
			end

		end
	end
	self.FileName.OnValueChange = function()
		if (self.FileName:GetValue() ~= "File_Name..." and
			self.FileName:GetValue() ~= "Folder_Name...") then
			local new, changed = self.FileName:GetValue():gsub("[^%w_ ]", "")
			if changed > 0 then
				self.FileName:SetText(new)
				self.FileName:SetCaretPos(#new)
			end
		end
	end

	self.Desc = vgui.Create("DTextEntry", self)
	self.Desc.OnEnter = self.Submit.DoClick
	self.Desc:SetText("Description...")
	self.Desc.OnMousePressed = function()
		self.Desc:OnGetFocus()
		if (self.Desc:GetValue() == "Description...") then
			self.Desc:SelectAllOnFocus(true)
		end
	end

	self.Info = vgui.Create("DLabel", self)
	self.Info:SetVisible(false)

end

function PANEL:Slide(expand)
	if (expand) then
		if (self.Expanded) then
			self:SetTall(self:GetTall() - 40)
			self.Expanded = false
		else
			self:SetTall(self:GetTall() + 5)
		end
	else
		if (not self.Expanded) then
			self:SetTall(self:GetTall() + 40)
			self.Expanded = true
		else
			self:SetTall(self:GetTall() - 5)
		end
	end
	count = count + 1
	if (count < 9) then
		timer.Simple(0.01, function() self:Slide(expand) end)
	else
		if (expand) then
			self.Expanded = true
		else
			self.Expanded = false
		end
		self.Expanding = false
		count = 0
	end
end

function PANEL:GetFullPath(node)
	return GetFullPath(node)
end

function PANEL:GetNodePath(node)
	return GetNodePath(node)
end

if (game.SinglePlayer()) then
	net.Receive("AdvDupe2_AddFile", function()
		local asvNode = AdvDupe2.FileBrowser.AutoSaveNode
		local actNode = AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode
		if (net.ReadBool()) then
			if (IsValid(asvNode)) then
				local name = net.ReadString()
				for iD = 1, #asvNode.Files do
					if (name == asvNode.Files[i]) then return end
				end
				asvNode:AddFile(name)
				asvNode.Control:Sort(asvNode)
			end
		else
			actNode:AddFile(net.ReadString())
			actNode.Control:Sort(actNode)
		end
	end)
end

vgui.Register("advdupe2_browser", PANEL, "Panel")

--PATH lua/bricks_server/languages/bricks_server/german.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "german", {
    ["search"] = "Suchen",
    ["invalidPlayerProfile"] = "Ungültiges Spielerprofil aufgerufen",
    ["unbound"] = "UNBOUND",
    ["themes"] = "Themes",
    ["groups"] = "Gruppen",
    ["general"] = "Generell",
    ["itemWhitelisting"] = "Item Whitelisting",
    ["rarities"] = "Besonderheiten",
    ["languages"] = "Sprachen",
    ["disabled"] = "Deaktiviert",
    ["enabled"] = "Aktiviert",
    ["purchase"] = "Kauf",
    ["profile"] = "Profil",
    ["view"] = "Ansehen",
    ["admin"] = "Admin",
    ["noToolPermission"] = "Du hast nicht die nötigen Rechte, um dieses Tool zu nutzen.",
    ["settings"] = "Einstellungen",
    ["players"] = "Spieler",
    ["modules"] = "Module",

    ["userGroupEditor"] = "Spielergruppen Bearbeitung",
    ["addNewGroup"] = "Neue Gruppe hinzufügen",
    ["newUserGroup"] = "Was soll die neue Benutzergruppe sein?",
    ["groupName"] = "Gruppenname",

    ["custom"] = "Benutzerdefiniert",
    ["addNew"] = "Neue hinzufügen",
    ["material"] = "Material",
    ["directImage"] = "Gebe einen direkten Link zum Bild an",
    ["default"] = "Standard",
    ["selectMaterial"] = "Du musst ein Material angeben",

    ["errorNoText"] = "ERROR: KEIN TEXT",
    ["selectOption"] = "Wähle eine Option",
    ["selectValue"] = "Bitte wähle einen Wert.",
    ["selectColor"] = "Bitte wähle eine Farbe.",
    ["configSaved"] = "Config gespeichert!",
    ["cmdNoPermission"] = "Du hast nicht die nötigen Rechte, um diesen Command zu benutzen.",
    ["entityPosUpdated"] = "Entitypositionen aktualisiert.",
    ["noEntitiesSpawned"] = "Es wurden keine Entities gespawnt.",
    ["xEntitiesSpawned"] = "%d gespeicherten Entities wurden gespeichert.",
    ["error"] = "ERROR",

    ["seconds"] = "%d Sekunden",
    ["second"] = "%d Sekunde",
    ["minutes"] = "%d Minuten",
    ["minute"] = "%d Minute",
    ["hours"] = "%d Stunden",
    ["hour"] = "%d Stunde",

    ["noRarity"] = "Keine Besonderheit",

    ["config"] = "Config",
    ["edit"] = "Bearbeiten",
    ["editColor"] = "Bearbeite Farbe",
    ["editName"] = "Bearbeite Name",
    ["remove"] = "Entfernen",
    ["name"] = "Name",
    ["description"] = "Beschreibung",
    ["model"] = "Model",
    ["icon"] = "Icon",
    ["type"] = "Typ",
    ["price"] = "Preis",
    ["group"] = "Gruppe",
    ["category"] = "Kategorie",
    ["color"] = "Farbe",
    ["invalidType"] = "Ungültiger Typ",
    ["invalidOption"] = "Ungültige Option.",
    ["invalidChoice"] = "Ungültige Auswahl.",
    ["invalidGroup"] = "Ungültige Gruppe.",
    ["invalidPlayer"] = "Ungültiger Spieler.",
    ["true"] = "WAHR",
    ["false"] = "FALSCH",
    ["noDescription"] = "Keine Beschreibung",
    ["other"] = "Anderes",
    ["completed"] = "Fertig",
    ["close"] = "Schließen",
    ["main"] = "Haupt",
    
    ["valueQuery"] = "Was soll %s sein?",
    ["dataValueQuery"] = "Welche Dateien sollen das sein?",
    ["newNameQuery"] = "Was soll der neue Name sein?",
    ["newDescriptionQuery"] = "Was soll die neue Beschreibung sein?",
    ["newModelQuery"] = "Was soll das neue Model sein?",
    ["newIconQuery"] = "Was soll das neue Bild sein?",
    ["newColorQuery"] = "Was soll die neue Farbe sein?",
    ["npcTypeQuery"] = "Welche Art soll der NPC sein?",
    ["newTypeQuery"] = "Was soll die neue Art sen?",
    ["groupRequirementQuery"] = "Was soll die Gruppenanforderung sein?",
    ["levelRequirementQuery"] = "Was soll die Levelanforderung sein?",
    ["newPriceQuery"] = "Was soll der neue Preis sein?",
    ["newCategoryQuery"] = "Was soll die neue Kategorie sein?",

    ["npcEditor"] = "NPC Bearbeiter",
    ["addNPC"] = "Füge NPC hinzu",
    ["newNPC"] = "Neuer NPC",

    ["ok"] = "OK",
    ["cancel"] = "Aufheben",
    ["save"] = "Speichern",
    ["confirm"] = "Bestätigen",
    ["nil"] = "NIL",
    ["none"] = "Nichts",
    ["selected"] = "Ausgewählt",
    ["unselected"] = "Nicht ausgewählt",
    ["add"] = "Hinzufügen",

    ["shootyStick"] = "Ein schießender Stock!",
    ["permanent"] = "Permanent",
    ["tierX"] = "(Stufe %d)",
    ["someDescription"] = "Mögliche Beschreibung",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Ungültiger NPC",

    ["disconnected"] = "Disconnected",
    ["profileView"] = "Profilansicht",
    ["loading"] = "Laden",
    ["statistics"] = "Statistiken",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Untersützer-Rang",
    ["staffRank"] = "Teamrang",
    ["currentJob"] = "Aktueller Job",
    ["wallet"] = "Brieftasche",
    ["level"] = "Level",
    ["levelX"] = "Level %d",
    ["experience"] = "Erfahrung",
    ["exp"] = "EXP",
    ["money"] = "Geld",
    ["playerLogs"] = "Spielerlogs",
    ["deleteLogs"] = "Lösche Logs",
    ["xLogs"] = "%d Logs",
    ["xAdminGroups"] = "%d Admingruppen",
    ["noUserGroups"] = "Keine Spielergruppen",
    ["userGroups"] = "Spielergruppen: %s",
    ["editUserGroups"] = "Bearbeite Spielergruppen",
    ["newGroupColor"] = "Was soll die neue Gruppenfarbe sein?",
    ["newGroupName"] = "Was soll der neue Gruppenname sein?",
    ["groupAlreadyExists"] = "Diese Gruppe existiert bereits!",
    ["whitelist"] = "Whitelist",
    ["unWhitelist"] = "UnWhitelist",
    ["addCustom"] = "Füge etwas eigenes hinzu",
    ["entClassWhitelist"] = "Welche Entitie-Klasse möchtest du zur Whitelist hinzufügen?",
    ["entClassAlreadyOnList"] = "Diese Entitie-Klasse ist bereits auf der Whitelist.",
    ["changesServerRestart"] = "Einige Änderungen werden erst nach einem Serverneustart verfügbar sein!",
    ["comingSoon"] = "Kommt bald!",
    ["features"] = "FEATURES",
    ["addNewRarity"] = "Füge eine neue Besonderheit hinzu",
    ["newRarity"] = "Neue Besonderheit",
    ["needToAddRarity"] = "Du musst zuerst eine Besonderheits-Art hinzufügen",
    ["whatRarityItem"] = "Welche Besonderheit soll dieses Item haben?",
    ["invalidRarity"] = "Ungültige Besonderheitsgruppe.",
    ["rarityAlreadyExists"] = "Es existiert bereits eine Besonderheit mit diesem Namen!",
    ["themeColorX"] = "Theme - Farbe %d",
    ["themeTextColor"] = "Theme - Textfarbe",
    ["presetAccents"] = "Preset accents",
    ["presetBackgrounds"] = "Hintergründe zurücksetzen",
    ["resetToBaseThemes"] = "Standardtheme zurücksetzen",
    ["resetToCurrentThemes"] = "Auf aktuelle Themes zurücksetzen",
    ["toggle"] = "Umschalten",
    ["menu"] = "Menü",
    ["emptyValue"] = "LEERER WERT",
    ["newValueQuery"] = "Was soll der neue Wert sein?",
    ["pressKey"] = "DRÜCKE EINE TASTE",

    ["entityPlacer"] = "Entitie-Platzierer",
    ["invalidEntityType"] = "Ungültige Entitie-Art ausgewählt, wähle eine gültige aus dem Toolmenü",
    ["entityPlaced"] = "Entitie erfolgreich platziert.",
    ["entityRemoved"] = "Entitie erfolgreich entfernt.",
    ["canOnlyUseToolEntity"] = "Du kannst dieses Tool nur zum Entfernen/Erstellen von Entites nutzen.",
    ["entityType"] = "Entity-Art",
    ["entityPlacerDescription"] = "Platziert und entfernt Entites von Bricks Servers und speichert deren Positionen. Linksklick: Platzieren | Rechtsklick: Entfernen.",
    ["entityPlacerDescriptionSmall"] = "Platziert und entfernt Entities",
    ["entityPlacerInstructions"] = "Linksklick - Platzieren, Rechtsklick - Entfernen.",

    ["npcPlacer"] = "NPC-Platzierer",
    ["npcPlaced"] = "NPC erfolgreich platziert.",
    ["invalidNPCType"] = "Ungültige NPC-Art ausgewählt, wähle eine gültige aus dem Toolmenü.",
    ["npcRemoved"] = "NPC erfolgreich entfernt.",
    ["errorNotNPC"] = "Du kannst diese Tool nur zum Platzieren/Entfernen von NPCs verwenden..",
    ["npcPlacerDescription"] = "Platziert und entfernt NPCs von Bricks Servers und speichert deren Positionen. Linksklick: Platzieren | Rechtsklick: Entfernen.",
    ["npcPlacerDescriptionSmall"] = "Platziert und Entfernt NPCs von Bricks Servers.",

    ["inventory"] = "Inventar",
    ["player"] = "Spieler",
    ["drop"] = "Fallen lassen",
    ["use"] = "Benutzen",
    ["dropAll"] = "Alles fallen lassen",
    ["delete"] = "Löschen",
} )
--PATH lua/bricks_server/core/client/cl_drawing.lua:
function BRICKS_SERVER.Func.ScreenScale( number, min, max )
    number = number*(ScrW()/2560)

    if( min and max ) then
        return math.Clamp( number, min, max )
    elseif( min or max ) then
        return min and math.max( min, number ) or math.min( max, number )
    else
        return number
    end
end

BRICKS_SERVER.UI = {
	Margin5 = BRICKS_SERVER.Func.ScreenScale( 5 ),
	Margin10 = BRICKS_SERVER.Func.ScreenScale( 10 ),
	Margin15 = BRICKS_SERVER.Func.ScreenScale( 15 ),
	Margin25 = BRICKS_SERVER.Func.ScreenScale( 25 ),
	Margin50 = BRICKS_SERVER.Func.ScreenScale( 50 ),
	Margin100 = BRICKS_SERVER.Func.ScreenScale( 100 )
}

function BRICKS_SERVER.Func.Repeat( val, amount )
	local args = {}
	for i = 1, amount do
		table.insert( args, val )
	end

	return unpack( args )
end

BRICKS_SERVER.DEVCONFIG.MainNavWidth = BRICKS_SERVER.Func.ScreenScale( 230 )
hook.Add( "OnScreenSizeChanged", "BRS.OnScreenSizeChanged.DevConfig", function()
    BRICKS_SERVER.DEVCONFIG.MainNavWidth = BRICKS_SERVER.Func.ScreenScale( 230 )
end )

--[[ FONTS ]]--
local function createFonts()
	surface.CreateFont( "BRICKS_SERVER_Font90", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 90 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font25", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 25 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font24", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 24 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font24", {
		font = "Montserrat Medium",
		extended = false,
		size = 24,
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font23", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 23 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font20", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font20", {
		font = "Montserrat Medium",
		extended = false,
		size = 20,
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font17", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 17 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font17", {
		font = "Montserrat Medium",
		extended = false,
		size = 17,
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font17B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 17 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font18", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 18 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font19", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 19 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font20B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font26", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 26 ),
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font30", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 27 ),
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font32", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 32 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font33", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 33 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font33", {
		font = "Montserrat Medium",
		extended = false,
		size = 33,
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font28B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 28 ),
		weight = 650,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font36B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 38 ),
		weight = 650,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font40", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 40 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font40", {
		font = "Montserrat Medium",
		extended = false,
		size = 40,
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font45", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 45 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font40B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 40 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font50", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 70 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font53", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 53 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font20", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font11", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 11 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font13", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 13, 10 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font15", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 15 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font22B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 22 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font21", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 21 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font22", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 22 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font23B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 23 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_HUDFont", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 27 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font31", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 31 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_HUDFontS", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 25 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_HUDFontB", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 30 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font100", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 75 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font50", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 50 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font30B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 30 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font60B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 60 ),
		weight = 5000,
		outline = false,
	} )

	-- New Fonts
	surface.CreateFont( "BRS.Font.Bold20", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
	} )
end
createFonts()

hook.Add( "OnScreenSizeChanged", "BRS.OnScreenSizeChanged.Fonts", createFonts )

--[[ FUNCTIONS ]]--
local blur = Material("pp/blurscreen")
function BRICKS_SERVER.Func.DrawBlur( p, a, d )
	local x, y = p:LocalToScreen(0, 0)
	surface.SetDrawColor( 255, 255, 255 )
    surface.SetMaterial( blur )
    
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

local panelMeta = FindMetaTable( "Panel" )
function panelMeta:SetBRSToolTip( posX, posY, sizeW, sizeH, text, visiblePanel )
	self.OnCursorEntered = function()
		if( self.Menu and IsValid( self.Menu ) ) then return end
		
		if( IsValid( BRS_TOOLTIP ) ) then
			BRS_TOOLTIP:Remove()
		end

		local textTable = text
		if( not istable( text ) ) then
			textTable = { text }
		end

		BRS_TOOLTIP = vgui.Create( "DPanel" )
		BRS_TOOLTIP:MakePopup()
		BRS_TOOLTIP:DockPadding( 10, 5, 0, 0 )
		BRS_TOOLTIP.Paint = function( self2, w, h )
			BRICKS_SERVER.BSHADOWS.BeginShadow()
			local x, y = self2:LocalToScreen( 0, 0 )
			draw.RoundedBox( 8, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )			
			BRICKS_SERVER.BSHADOWS.EndShadow(1, 1, 1, 255, 0, 0, false )
		end

		local textX, textY = 0, 0
		for k, v in pairs( textTable ) do
			local textString = v
			local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
			local textFont = "BRICKS_SERVER_Font20"
			if( istable( v ) ) then
				textString = v[1] or BRICKS_SERVER.Func.L( "errorNoText" )
				textColor = v[2] or BRICKS_SERVER.Func.GetTheme( 6 )
				textFont = v[3] or "BRICKS_SERVER_Font20"
			end

			surface.SetFont( textFont )
			
			local newTextX, newTextY = surface.GetTextSize( textString )
			if( newTextX > textX ) then
				textX = newTextX
			end
			textY = textY+newTextY

			local textPanel = vgui.Create( "DLabel", BRS_TOOLTIP )
			textPanel:SetText( textString )
			textPanel:SetFont( textFont )
			textPanel:Dock( TOP )
			textPanel:SetTall( newTextY )

			if( isfunction( textColor ) ) then
				textPanel.Think = function()
					textPanel:SetTextColor( textColor() )
				end
			else
				textPanel:SetTextColor( textColor )
			end
		end

		BRS_TOOLTIP:SetSize( textX+20, textY+10 )
		BRS_TOOLTIP:SetPos( posX+sizeW+5, posY+(sizeH/2)-(BRS_TOOLTIP:GetTall()/2) )
		BRS_TOOLTIP:SetAlpha( 0 )
		BRS_TOOLTIP:AlphaTo( 255, 0.1 )
		BRS_TOOLTIP.Think = function()
			if( IsValid( BRS_TOOLTIP ) and not self:IsHovered() ) then
				BRS_TOOLTIP:Remove()
			end
		end
	end

	self.OnCursorExited = function()
		if( IsValid( BRS_TOOLTIP ) ) then
			BRS_TOOLTIP:Remove()
		end
	end

	self.OnRemove = function()
		if( IsValid( BRS_TOOLTIP ) ) then
			BRS_TOOLTIP:Remove()
		end
	end
end

local entityMeta = FindMetaTable( "Entity" )
function entityMeta:SetBRSEntityToolTip( text )
	if( not IsValid( self ) ) then return end

	if( not BRS_ENTITY_TOOLTIPS ) then
		BRS_ENTITY_TOOLTIPS = {}
	end

	local textTable = text
	if( not istable( text ) ) then
		textTable = { text }
	end

	local textX, textY = 0, 0
	for k, v in pairs( textTable ) do
		local textString = v
		local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
		local textFont = "BRICKS_SERVER_Font20"
		if( istable( v ) ) then
			textString = v[1] or BRICKS_SERVER.Func.L( "errorNoText" )
			textColor = v[2] or BRICKS_SERVER.Func.GetTheme( 6 )
			textFont = v[3] or "BRICKS_SERVER_Font20"
		end

		surface.SetFont( textFont )
		
		local newTextX, newTextY = surface.GetTextSize( textString )
		if( newTextX > textX ) then
			textX = newTextX
		end
		textY = textY+newTextY
	end

	BRS_ENTITY_TOOLTIPS[self] = { textTable, textX+20, textY+10 }
end

hook.Add( "HUDPaint", "BRS.HUDPaint.EntityToolTips", function()
	if( LocalPlayer():GetEyeTrace() and LocalPlayer():GetEyeTrace().HitPos ) then
		local hitPos = LocalPlayer():GetEyeTrace().HitPos

		if( LocalPlayer():GetPos():DistToSqr( hitPos ) > 10000 ) then return end

		local entTable = {}
		for k, v in pairs( ents.FindInSphere( hitPos, 25 ) ) do
			if( IsValid( v ) and BRS_ENTITY_TOOLTIPS and BRS_ENTITY_TOOLTIPS[v] ) then
				table.insert( entTable, { hitPos:DistToSqr( v:GetPos() ), v } )
			end
		end

		table.sort( entTable, function(a, b) return a[1] < b[1] end )

		local ent = (entTable[1] or {})[2]
		if( ent and IsValid( ent ) ) then
			local pos = Vector( ent:GetPos().x, ent:GetPos().y, ent:GetPos().z+25 )
			local pos2d = pos:ToScreen()

			local textTable, width, height = BRS_ENTITY_TOOLTIPS[ent][1], BRS_ENTITY_TOOLTIPS[ent][2], BRS_ENTITY_TOOLTIPS[ent][3]
			local xPos, yPos = pos2d.x, pos2d.y

			draw.RoundedBox( 5, xPos, yPos, width, height, BRICKS_SERVER.Func.GetTheme( 0 ) )

			local textX, textY = 0, 0
			for i = 1, #textTable do
				local textString = textTable[i] or ""
				local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
				local textFont = "BRICKS_SERVER_Font20"
				if( istable( textTable[i] ) ) then
					textString = textTable[i][1] or BRICKS_SERVER.Func.L( "errorNoText" )
					textColor = textTable[i][2] or BRICKS_SERVER.Func.GetTheme( 6 )
					textFont = textTable[i][3] or "BRICKS_SERVER_Font20"
				end

				draw.SimpleText( textString, textFont, xPos+10, yPos+5+textY, ((isfunction( textColor ) and textColor()) or textColor), 0, 0 )
	
				surface.SetFont( textFont )
				
				local newTextX, newTextY = surface.GetTextSize( textString )
				if( newTextX > textX ) then
					textX = newTextX
				end
				textY = textY+newTextY
			end
		end
	end
end )

hook.Add( "EntityRemoved", "BRS.EntityRemoved.RemoveEntityToolTips", function( ent )
	if( BRS_ENTITY_TOOLTIPS and BRS_ENTITY_TOOLTIPS[ent] ) then
		BRS_ENTITY_TOOLTIPS[ent] = nil
	end
end )

local notifQueue = {}
local function createNotif()
	if( not notifQueue[1] ) then return end

	local headerText, headerColor, subText, subColor = notifQueue[1][1], notifQueue[1][2], notifQueue[1][3], notifQueue[1][4]

	surface.PlaySound( "common/warning.wav" )

	BRS_CENTER_NOTIF_PANEL = vgui.Create( "DPanel" )
	BRS_CENTER_NOTIF_PANEL:SetSize( ScrW(), ScrH() )
	BRS_CENTER_NOTIF_PANEL:SetPos( -BRS_CENTER_NOTIF_PANEL:GetWide(), (ScrH()/2)-(BRS_CENTER_NOTIF_PANEL:GetTall()/2) )
	BRS_CENTER_NOTIF_PANEL:MoveTo( (ScrW()/2)-(BRS_CENTER_NOTIF_PANEL:GetWide()/2), (ScrH()/2)-(BRS_CENTER_NOTIF_PANEL:GetTall()/2), 0.5, 0, 1 )
	local spacing = 4
	BRS_CENTER_NOTIF_PANEL.Paint = function( self, w, h )
		draw.SimpleText( headerText, "BRICKS_SERVER_Font53", w/2-1, h/3+1+spacing, BRICKS_SERVER.Func.GetTheme( 3 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( headerText, "BRICKS_SERVER_Font53", w/2, h/3+spacing, headerColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( subText, "BRICKS_SERVER_Font30", w/2-1, h/3+1-spacing, BRICKS_SERVER.Func.GetTheme( 3 ), TEXT_ALIGN_CENTER, 0 )
		draw.SimpleText( subText, "BRICKS_SERVER_Font30", w/2, h/3-spacing, subColor, TEXT_ALIGN_CENTER, 0 )
	end
	
	timer.Simple( 3, function()
		if( IsValid( BRS_CENTER_NOTIF_PANEL ) ) then
			BRS_CENTER_NOTIF_PANEL:MoveTo( ScrW(), (ScrH()/2)-(BRS_CENTER_NOTIF_PANEL:GetTall()/2), 0.5, 0, 1, function()
				if( IsValid( BRS_CENTER_NOTIF_PANEL ) ) then
					BRS_CENTER_NOTIF_PANEL:Remove()
					table.remove( notifQueue, 1 )
					createNotif()
				end
			end )
		end
	end )
end

function BRICKS_SERVER.Func.AddCenterNotification( headerText, headerColor, subText, subColor )
	if( BRS_CENTER_NOTIF_PANEL and IsValid( BRS_CENTER_NOTIF_PANEL ) ) then 
		for k, v in pairs( notifQueue ) do
			if( v[1] == headerText and v[3] == subText ) then
				return
			end
		end

		table.insert( notifQueue, { headerText, headerColor, subText, subColor } )
	else
		table.insert( notifQueue, { headerText, headerColor, subText, subColor } )
		createNotif()
	end
end

--[[ PAINTING ]]--
function BRICKS_SERVER.Func.DrawProgress( text, status )
	if( status >= 1 ) then return end
	
	local width, height = ScrW()*0.1, 10
	local y = (ScrH()/4)*3-50

	draw.RoundedBox( 5, (ScrW()/2)-(width/2), y, width, height, BRICKS_SERVER.Func.GetTheme( 3 ))

	draw.RoundedBox( 5, (ScrW()/2)-(width/2), y, width*math.Clamp( status, 0, 1 ), height, BRICKS_SERVER.Func.GetTheme( 5 ) )
end

local gradientDown = Material( 'vgui/gradient_down' )
local gradientUp = Material( 'vgui/gradient_up' )
local gradientLeft = Material( 'vgui/gradient-l' )
local gradientRight = Material( 'vgui/gradient-r' )
function BRICKS_SERVER.Func.DrawMaterialShadow( x, y, w, h, GradientType )
	if( GradientType == "Down" ) then
		surface.SetMaterial( gradientDown )
	elseif( GradientType == "Up" ) then
		surface.SetMaterial( gradientUp )	
	elseif( GradientType == "Left" ) then
		surface.SetMaterial( gradientLeft )	
	elseif( GradientType == "Right" ) then
		surface.SetMaterial( gradientRight )
	end
	surface.SetDrawColor( 0, 0, 0, 175 )
	surface.DrawTexturedRect( x, y, w, h )
end

function BRICKS_SERVER.Func.DrawCircle( x, y, radius, color )
	if( radius <= 0 ) then return end
	
	if( color and istable( color ) and color.r and color.g and color.b ) then
		surface.SetDrawColor( color )
	end
	
	draw.NoTexture()

	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, 45 do
		local a = math.rad( ( i / 45 ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function BRICKS_SERVER.Func.PrecachedArc( cx, cy, radius, thickness, startang, endang, roughness )
	local triarc = {}
	-- local deg2rad = math.pi / 180
	
	-- Define step
	local roughness = math.max(roughness or 1, 1)
	local step = roughness
	
	-- Correct start/end ang
	local startang,endang = startang or 0, endang or 0
	
	if startang > endang then
		step = math.abs(step) * -1
	end
	
	-- Create the inner circle's points.
	local inner = {}
	local r = radius - thickness
	for deg=startang, endang, step do
		local rad = math.rad(deg)
		-- local rad = deg2rad * deg
		local ox, oy = cx+(math.cos(rad)*r), cy+(-math.sin(rad)*r)
		table.insert(inner, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end	
	
	-- Create the outer circle's points.
	local outer = {}
	for deg=startang, endang, step do
		local rad = math.rad(deg)
		-- local rad = deg2rad * deg
		local ox, oy = cx+(math.cos(rad)*radius), cy+(-math.sin(rad)*radius)
		table.insert(outer, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end	
	
	-- Triangulize the points.
	for tri=1,#inner*2 do -- twice as many triangles as there are degrees.
		local p1,p2,p3
		p1 = outer[math.floor(tri/2)+1]
		p3 = inner[math.floor((tri+1)/2)+1]
		if tri%2 == 0 then --if the number is even use outer.
			p2 = outer[math.floor((tri+1)/2)]
		else
			p2 = inner[math.floor((tri+1)/2)]
		end
	
		table.insert(triarc, {p1,p2,p3})
	end
	
	-- Return a table of triangles to draw.
	return triarc
end

function BRICKS_SERVER.Func.DrawCachedArc( arc, color )
	draw.NoTexture()

	if( color ) then
		surface.SetDrawColor( color )
	end

	for k,v in ipairs(arc) do
		surface.DrawPoly(v)
	end
end


function BRICKS_SERVER.Func.DrawArc( cx, cy, radius, thickness, startang, endang, color )
	BRICKS_SERVER.Func.DrawCachedArc( BRICKS_SERVER.Func.PrecachedArc( cx, cy, radius, thickness, startang, endang ), color )
end

local radiusAnim, fadeAnim, endRadius = 0.2, 0.2, 0
function BRICKS_SERVER.Func.DrawClickCircle( panel, w, h, color, cornerRadius )
	if( panel:IsDown() and not panel.doClickAnim ) then
		endRadius = math.sqrt( ((w/2)^2)+((h/2)^2) )
		panel.doClickAnimEndTime = CurTime()+radiusAnim+fadeAnim
		panel.doClickAnim = true
	end

	if( panel.doClickAnim ) then
		local timeLeft = (panel.doClickAnimEndTime or 0)-CurTime()
		if( timeLeft <= 0 ) then
			panel.doClickAnimEndTime = nil
			panel.doClickAnim = false
		end

		local radiusTimeLeft = (panel.doClickAnimEndTime or 0)-fadeAnim-CurTime()
		local radius = endRadius*math.Clamp( (radiusAnim-radiusTimeLeft)/radiusAnim, 0, 1 )

		local fade = 1
		if( CurTime() >= (panel.doClickAnimEndTime or 0)-fadeAnim ) then
			fade = math.Clamp( timeLeft/fadeAnim, 0, 1 )
		end

		surface.SetAlphaMultiplier( fade )
		draw.NoTexture()
		surface.SetDrawColor( color )
		if( cornerRadius ) then
			BRICKS_SERVER.Func.DrawRoundedMask( cornerRadius, 0, 0, w, h, function()
				BRICKS_SERVER.Func.DrawCircle( w/2, h/2, radius, radius )
			end )
		else
			BRICKS_SERVER.Func.DrawCircle( w/2, h/2, radius, radius )
		end
		surface.SetAlphaMultiplier( 1 )

	end
end

local g_grds, g_wgrd, g_sz
function BRICKS_SERVER.Func.DrawGradientBox(x, y, w, h, al, ...)
	g_grds = {...}

	x = math.Round( x )
	y = math.Round( y )
	w = math.Round( w )
	h = math.Round( h )

	al = math.Clamp(math.floor(al), 0, 1)
	if(al == 1) then
		local t = w
		w, h = h, t
	end
	g_wgrd = w / (#g_grds - 1)
	local n
	for i = 0, w do
		for c = 1, #g_grds do
			n = c
			if(i <= g_wgrd * c) then
				break
			end
		end
		g_sz = i - (g_wgrd * (n - 1))
		surface.SetDrawColor(
			Lerp(g_sz/g_wgrd, g_grds[n].r, g_grds[n + 1].r),
			Lerp(g_sz/g_wgrd, g_grds[n].g, g_grds[n + 1].g),
			Lerp(g_sz/g_wgrd, g_grds[n].b, g_grds[n + 1].b),
			Lerp(g_sz/g_wgrd, g_grds[n].a, g_grds[n + 1].a))
		if(al == 1) then
			surface.DrawRect(x, y + i, h, 1)
		else
			surface.DrawRect(x + i, y, 1, h)
		end
	end
end

local gradientMatR, gradientMatU, gradientMatD = Material("gui/gradient"), Material("gui/gradient_up"), Material("gui/gradient_down")
function BRICKS_SERVER.Func.DrawTexturedGradientBox(x, y, w, h, direction, ...)
	local colors = {...}
	local horizontal = direction != 1
	local secSize = math.ceil( ((horizontal and w) or h)/math.ceil( #colors/2 ) )
	
	local previousPos = (horizontal and x or y)-secSize
	for k, v in pairs( colors ) do
		if( k % 2 != 0 ) then
			previousPos = previousPos+secSize
			surface.SetDrawColor( v )
			surface.DrawRect( (horizontal and previousPos or x), (horizontal and y or previousPos), (horizontal and secSize or w), (horizontal and h or secSize) )
		end
	end

	local previousGradPos = (horizontal and x or y)-secSize
	for k, v in pairs( colors ) do
		if( k % 2 == 0 ) then
			previousGradPos = previousGradPos+secSize
			surface.SetDrawColor( v )
			surface.SetMaterial( horizontal and gradientMatR or gradientMatU )
			if( horizontal ) then
				surface.DrawTexturedRectUV( (horizontal and previousGradPos or x), (horizontal and y or previousGradPos), (horizontal and secSize or w), (horizontal and h or secSize), 1, 0, 0, 1)
			else
				surface.DrawTexturedRect( (horizontal and previousGradPos or x), (horizontal and y or previousGradPos), (horizontal and secSize or w), (horizontal and h or secSize))
			end

			if( colors[k+1] ) then
				surface.SetDrawColor( v )
				surface.SetMaterial( horizontal and gradientMatR or gradientMatD )
				surface.DrawTexturedRect((horizontal and previousGradPos+secSize or x), (horizontal and y or previousGradPos+secSize), (horizontal and secSize or w), (horizontal and h or secSize))
			end
		end
	end
end

-- Credits: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/includes/modules/draw.lua, https://gist.github.com/MysteryPancake/e8d367988ef05e59843f669566a9a59f
BRICKS_SERVER.MaskMaterial = CreateMaterial("!brsmask","UnlitGeneric",{
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["$alpha"] = 1,
})

local whiteColor = Color( 255, 255, 255 )
local renderTarget
function BRICKS_SERVER.Func.DrawRoundedMask( cornerRadius, x, y, w, h, drawFunc )
	if( not renderTarget ) then
		renderTarget = GetRenderTargetEx( "BRS_GRADIENT_ROUNDEDBOX", ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888 )
	end

	render.PushRenderTarget( renderTarget )
	render.OverrideAlphaWriteEnable( true, true )
	render.Clear( 0, 0, 0, 0 ) 

	drawFunc()

	--Draw the mask
	render.OverrideBlendFunc( true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO )
	draw.RoundedBox( cornerRadius, x, y, w, h, whiteColor )
	render.OverrideBlendFunc( false )
	render.OverrideAlphaWriteEnable( false )
	render.PopRenderTarget() 

	--Update material
	BRICKS_SERVER.MaskMaterial:SetTexture( "$basetexture", renderTarget )

	--Clear material for upcoming draw calls
	draw.NoTexture()

	surface.SetDrawColor( 255, 255, 255, 255 ) 
	surface.SetMaterial( BRICKS_SERVER.MaskMaterial ) 
	render.SetMaterial( BRICKS_SERVER.MaskMaterial )
	render.DrawScreenQuad() 
end

function BRICKS_SERVER.Func.DrawGradientRoundedBox( cornerRadius, x, y, w, h, al, ... )
	local varArgs = { ... }
	BRICKS_SERVER.Func.DrawRoundedMask( cornerRadius, x, y, w, h, function()
		BRICKS_SERVER.Func.DrawGradientBox( x, y, w, h, al, unpack( varArgs ) )
	end )
end

function BRICKS_SERVER.Func.StartStencil()
	render.ClearStencil()
	render.SetStencilEnable( true )

	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )

	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_ZERO )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilReferenceValue( 1 )
end

function BRICKS_SERVER.Func.MiddleStencil()
	render.SetStencilFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilReferenceValue( 1 )
end

function BRICKS_SERVER.Func.EndStencil()
	render.SetStencilEnable( false )
	render.ClearStencil()
end

function BRICKS_SERVER.Func.DrawPartialRoundedBox( cornerRadius, x, y, w, h, color, roundedBoxW, roundedBoxH, roundedBoxX, roundedBoxY )
	BRICKS_SERVER.Func.StartStencil()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( x, y, w, h )

	BRICKS_SERVER.Func.MiddleStencil()

	draw.RoundedBox( cornerRadius, (roundedBoxX or x), (roundedBoxY or y), roundedBoxW, roundedBoxH, color )

	BRICKS_SERVER.Func.EndStencil()
end

function BRICKS_SERVER.Func.DrawPartialRoundedBoxEx( cornerRadius, x, y, w, h, color, roundedBoxW, roundedBoxH, roundedBoxX, roundedBoxY, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight )
	BRICKS_SERVER.Func.StartStencil()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( x, y, w, h )

	BRICKS_SERVER.Func.MiddleStencil()

	draw.RoundedBoxEx( cornerRadius, (roundedBoxX or x), (roundedBoxY or y), roundedBoxW, roundedBoxH, color, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight )

	BRICKS_SERVER.Func.EndStencil()
end

-- Credits: https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/base/cl_util.lua
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

function BRICKS_SERVER.Func.TextWrap(text, font, maxWidth)
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

    return text, string.len( text )-string.len( string.Replace( text, "\n", "" ) )+1
end

-- Credits: https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/base/cl_drawfunctions.lua
local function safeText(text)
    return string.match(text, "^#([a-zA-Z_]+)$") and text .. " " or text
end

function BRICKS_SERVER.Func.DrawNonParsedText(text, font, x, y, color, xAlign)
    return draw.DrawText(safeText(text), font, x, y, color, xAlign)
end
--PATH lua/bricks_server/core/client/cl_npc_system.lua:
function BRICKS_SERVER.Func.CreateNPCEditor( NPCKey, oldNPCTable, onSave, onCancel )
	BS_NPC_EDITOR = vgui.Create( "DFrame" )
	BS_NPC_EDITOR:SetSize( ScrW(), ScrH() )
	BS_NPC_EDITOR:Center()
	BS_NPC_EDITOR:SetTitle( "" )
	BS_NPC_EDITOR:ShowCloseButton( false )
	BS_NPC_EDITOR:SetDraggable( false )
	BS_NPC_EDITOR:MakePopup()
	BS_NPC_EDITOR:SetAlpha( 0 )
	BS_NPC_EDITOR:AlphaTo( 255, 0.1, 0 )
	BS_NPC_EDITOR.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local backPanel = vgui.Create( "DPanel", BS_NPC_EDITOR )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local NPCTable = table.Copy( oldNPCTable )

	local textArea

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "name" ), Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), NPCTable.Name, function( text ) 
				NPCTable.Name = text
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Name" },
		[2] = { BRICKS_SERVER.Func.L( "model" ), Material( "materials/bricks_server/icon.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newModelQuery" ), (NPCTable.Model or ""), function( text ) 
				if( text == "" ) then
					NPCTable.Model = nil
				else
					NPCTable.Model = text
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Model" },
		[3] = { BRICKS_SERVER.Func.L( "type" ), Material( "materials/bricks_server/amount.png" ), function()
			local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.NPCTypes ) do
				options[k] = k
			end
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "npcTypeQuery" ), (NPCTable.Type or ""), options, function( value, data ) 
				if( BRICKS_SERVER.DEVCONFIG.NPCTypes[data] ) then
					NPCTable.Type = data
					backPanel.FillActions()
					backPanel.FillOptions()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
		end, "Type" }
	}

	local originalActionsLen = #actions
	function backPanel.FillActions()
		for k, v in pairs( actions ) do
			if( k > originalActionsLen ) then
				actions[k] = nil
			end
		end

		if( BRICKS_SERVER.DEVCONFIG.NPCTypes[(NPCTable.Type or "")] and BRICKS_SERVER.DEVCONFIG.NPCTypes[(NPCTable.Type or "")].ReqInfo ) then
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.NPCTypes[(NPCTable.Type or "")].ReqInfo ) do
				local actionTable = {}
				if( v[2] == "string" ) then
					actionTable = { v[1], Material( "materials/bricks_server/more_24.png" ), function()
						BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (NPCTable.ReqInfo or {})[k] or "", function( text ) 
							NPCTable.ReqInfo = NPCTable.ReqInfo or {}
							NPCTable.ReqInfo[k] = text
						end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
					end }
				elseif( v[2] == "integer" ) then
					actionTable = { v[1], Material( "materials/bricks_server/more_24.png" ), function()
						BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (NPCTable.ReqInfo or {})[k] or 0, function( number ) 
							NPCTable.ReqInfo = NPCTable.ReqInfo or {}
							NPCTable.ReqInfo[k] = number
						end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
					end }
				elseif( v[2] == "table" ) then
					actionTable = { v[1], Material( "materials/bricks_server/more_24.png" ), function()
						local options = BRICKS_SERVER.Func.GetList( v[3] ) or {}
						BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (NPCTable.ReqInfo or {})[k] or "", options, function( value, data ) 
							if( options[data] ) then
								NPCTable.ReqInfo = NPCTable.ReqInfo or {}
								NPCTable.ReqInfo[k] = data
							else
								notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidOption" ), 1, 3 )
							end
						end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
					end }
				end

				table.insert( actions, actionTable )
			end
		end
	end
	backPanel.FillActions()
	
	function backPanel.FillOptions()
		backPanel:Clear()

		textArea = vgui.Create( "DPanel", backPanel )
		textArea:Dock( TOP )
		textArea:DockMargin( 10, 10, 10, 0 )
		textArea:SetTall( 30 )
		textArea.Paint = function( self2, w, h ) 
			draw.SimpleText( BRICKS_SERVER.Func.L( "npcEditor" ), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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

				if( v[4] and NPCTable[v[4]] and not v[5] ) then
					draw.SimpleText( v[1] .. " - " .. string.sub( NPCTable[v[4]], 1, 20 ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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

			draw.SimpleText( BRICKS_SERVER.Func.L( "save" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		leftButton.DoClick = function()
			onSave( NPCTable )

			BS_NPC_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_NPC_EDITOR ) ) then
					BS_NPC_EDITOR:Remove()
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

			BS_NPC_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_NPC_EDITOR ) ) then
					BS_NPC_EDITOR:Remove()
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
--PATH lua/bricks_server/vgui/bricks_server_admin.lua:
local PANEL = {}

function PANEL:Init()
    if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
        self.panelWide = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth
        
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

        local slotsWide = 3
        self.spacing = 10
        local gridWide = self.panelWide-50-10-self.spacing
        self.slotWide, self.slotTall = (gridWide-((slotsWide-1)*self.spacing))/slotsWide, 75
    
        self.slotPanels = {}
        for i = 1, slotsWide do
            self.slotPanels[i] = vgui.Create( "DPanel", self.scrollPanel )
            self.slotPanels[i]:SetPos( ((i-1)*(self.slotWide+self.spacing)), 0 )
            self.slotPanels[i]:SetSize( self.slotWide, 0 )
            self.slotPanels[i].slotCount = 0
            self.slotPanels[i].Paint = function() end
        end

        self.loadedPlayers = {}
        
        self:Refresh()
    end
end

function PANEL:Refresh()
    for k, v in ipairs( self.slotPanels ) do
        v:Clear()
        v:SetTall( 0 )
        v.slotCount = 0
    end

    local actionCategories = {}
    for k, v in pairs( BRICKS_SERVER.AdminPlayerFunctions or {} ) do
        if( not actionCategories[v[2]] ) then
            actionCategories[v[2]] = {}
        end

        table.insert( actionCategories[v[2]], v )
    end

    self.loadedPlayers = {}
    for k, v in ipairs( player.GetAll() ) do
        self.loadedPlayers[v] = true

        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v:Nick() ), string.lower( self.searchBar:GetValue() ) ) and not string.find( string.lower( v:SteamID64() or "" ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local slotParent
        for k, v in ipairs( self.slotPanels ) do
            local nextPanel = k == #self.slotPanels and self.slotPanels[1] or self.slotPanels[k+1]
            if( v.slotCount != 0 and v.slotCount > nextPanel.slotCount ) then continue end

            slotParent = v
            v.slotCount = v.slotCount+1
            v.targetHeight = v:GetTall()+self.slotTall+(v.slotCount == 1 and 0 or self.spacing)
            v:SetTall( v.targetHeight )
            break
        end

        local playerBack = vgui.Create( "DPanel", slotParent )
        playerBack:Dock( TOP )
        playerBack:DockMargin( 0, 0, 0, self.spacing )
        playerBack:SetTall( self.slotTall )
        playerBack.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        end

        local name = v:Nick()
        local steamID = v:SteamID()

        local group = BRICKS_SERVER.Func.GetGroup( v )
        local rankName = group and group[1] or BRICKS_SERVER.Func.GetAdminGroup( v )

        surface.SetFont( "BRICKS_SERVER_Font23" )
        local nameX, nameY = surface.GetTextSize( name )

        surface.SetFont( "BRICKS_SERVER_Font18" )
        local textX, textY = surface.GetTextSize( rankName )
        local boxW, boxH = textX+10, textY+3

        local playerInfo = vgui.Create( "DPanel", playerBack )
        playerInfo:Dock( TOP )
        playerInfo:SetTall( self.slotTall )
        local alpha = 0
        playerInfo.Paint = function( self2, w, h )
            if( not IsValid( self2.button ) ) then return end

            -- BUTTON PAINT --
            local expanded = playerBack:GetTall() > self.slotTall

            if( expanded ) then
                alpha = math.Clamp( alpha+5, 0, 75 )
            elseif( not self2.button:IsDown() and self2.button:IsHovered() ) then
                alpha = math.Clamp( alpha+5, 0, 100 )
            else
                alpha = math.Clamp( alpha-5, 0, 100 )
            end

            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, not expanded, not expanded )

            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), true, true, not expanded, not expanded )
            surface.SetAlphaMultiplier( 1 )

            -- INFO --
            draw.SimpleText( name, "BRICKS_SERVER_Font23", h+5, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( steamID != "NULL" and steamID or "BOT", "BRICKS_SERVER_Font17", h+5, h/2-2, BRICKS_SERVER.Func.GetTheme( 6, 75 ), 0, 0 )

            draw.RoundedBox( 8, h+5+nameX+5, (h/2+2)-boxH-3, boxW, boxH, ((group or {})[3] or BRICKS_SERVER.Func.GetTheme( 5 )) )
            draw.SimpleText( rankName, "BRICKS_SERVER_Font18", h+5+nameX+5+(boxW/2), (h/2+2-3)-(boxH/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local playerAvatar = vgui.Create( "bricks_server_rounded_avatar", playerInfo )
        local size = playerInfo:GetTall()-10
        playerAvatar:SetSize( size, size )
        playerAvatar:SetPos( 5, 5 )
        playerAvatar.rounded = 8
        playerAvatar:SetPlayer( v, 128 )

        playerInfo.button = vgui.Create( "DButton", playerInfo )
        playerInfo.button:Dock( FILL )
        playerInfo.button:SetText( "" )
        playerInfo.button.textureRotation = -90
        playerInfo.button.Paint = function( self2, w, h ) end
        playerInfo.button.DoClick = function()
            playerBack.Expanded = not playerBack.Expanded

            if( playerBack.Expanded ) then
                slotParent.targetHeight = slotParent.targetHeight+playerBack.expandedExtraH
                playerBack:SizeTo( self.slotWide, self.slotTall+playerBack.expandedExtraH, 0.2 )
            else
                slotParent.targetHeight = slotParent.targetHeight-playerBack.expandedExtraH
                playerBack:SizeTo( self.slotWide, self.slotTall, 0.2 )
            end

            slotParent:SizeTo( self.slotWide, slotParent.targetHeight, 0.2 )
        end

        local actionPanelW, actionPanelH = self.slotWide-20, 40
        local function setChildrenWidths( parent )
            if( not parent ) then return end

            local totalChildrenW = 0
            local children = parent:GetChildren()
            for k, v in ipairs( children ) do
                totalChildrenW = totalChildrenW+v:GetWide()
            end

            for k, v in ipairs( children ) do
                v:SetWide( (v:GetWide()/totalChildrenW)*(actionPanelW-(#children-1)*5) )
            end
        end

        local actionPanels = {}
        for key, val in pairs( actionCategories ) do
            for key2, val2 in pairs( val ) do
                surface.SetFont( "BRICKS_SERVER_Font21" )
                local textX, textY = surface.GetTextSize( key .. " " .. val2[1] )
                textX = textX+30

                if( not actionPanels[#actionPanels] or actionPanels[#actionPanels].totalButtonW+textX > actionPanelW ) then
                    if( actionPanels[#actionPanels] ) then
                        setChildrenWidths( actionPanels[#actionPanels] )
                    end

                    actionPanels[#actionPanels+1] = vgui.Create( "DPanel", playerBack )
                    actionPanels[#actionPanels]:Dock( TOP )
                    actionPanels[#actionPanels]:DockMargin( 10, #actionPanels == 1 and 10 or 0, 10, 5 )
                    actionPanels[#actionPanels]:SetTall( actionPanelH )
                    actionPanels[#actionPanels].totalButtonW = 0
                    actionPanels[#actionPanels].Paint = function() end
                end

                actionPanels[#actionPanels].totalButtonW = actionPanels[#actionPanels].totalButtonW+textX+(actionPanels[#actionPanels].totalButtonW != 0 and 5 or 0)

                local playerAction = vgui.Create( "DButton", actionPanels[#actionPanels] )
                playerAction:Dock( LEFT )
                playerAction:SetText( "" )
                playerAction:DockMargin( 0, 0, 5, 0 )
                playerAction:SetWide( textX )
                local alpha = 0
                playerAction.Paint = function( self2, w, h )
                    if( self2:IsHovered() ) then
                        alpha = math.Clamp( alpha+10, 0, 75 )
                    else
                        alpha = math.Clamp( alpha-10, 0, 75 )
                    end
                    
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 150 ) )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2, alpha ) )

                    BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 2, 200 ), 8 )
            
                    draw.SimpleText( key .. " " .. val2[1], "BRICKS_SERVER_Font21", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 75+((alpha/75)*180) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end
                playerAction.DoClick = function()
                    val2[3]( v )
                end
            end
        end
        setChildrenWidths( actionPanels[#actionPanels] )

        playerBack.expandedExtraH = 20+(#actionPanels*actionPanelH)+((#actionPanels-1)*5)
    end
end

function PANEL:Think()
    if( not self.loadedPlayers ) then return end

    for k, v in pairs( self.loadedPlayers ) do
        if( not IsValid( k ) ) then 
            self:Refresh()
            break 
        end
    end

    for k, v in pairs( player.GetAll() ) do
        if( not self.loadedPlayers[v] ) then 
            self:Refresh()
            break 
        end
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_admin", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_scrollpanel.lua:
local PANEL = {}

AccessorFunc( PANEL, "Padding", "Padding" )
AccessorFunc( PANEL, "pnlCanvas", "Canvas" )

function PANEL:Init()

	self.pnlCanvas = vgui.Create( "Panel", self )
	self.pnlCanvas.OnMousePressed = function( self, code ) self:GetParent():OnMousePressed( code ) end
	self.pnlCanvas:SetMouseInputEnabled( true )
	self.pnlCanvas.PerformLayout = function( pnl )

		self:PerformLayoutInternal()
		self:InvalidateParent()

	end

	-- Create the scroll bar
	self.VBar = vgui.Create( "DVScrollBar", self )
	self.VBar:Dock( RIGHT )
	self.VBar:SetWide( 0 )

	self:SetPadding( 0 )
	self:SetMouseInputEnabled( true )

	-- This turns off the engine drawing
	self:SetPaintBackgroundEnabled( false )
	self:SetPaintBorderEnabled( false )
	self:SetPaintBackground( false )

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

	self:InvalidateLayout( true )

	local x, y = self.pnlCanvas:GetChildPosition( panel )
	local w, h = panel:GetSize()

	y = y + h * 0.5
	y = y - self:GetTall() * 0.5

	self.VBar:AnimateTo( y, 0.5, 0, 0.5 )

end

-- Avoid an infinite loop
function PANEL:PerformLayoutInternal()

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

function PANEL:PerformLayout()

	self:PerformLayoutInternal()

end

function PANEL:Clear()

	return self.pnlCanvas:Clear()

end

derma.DefineControl( "bricks_server_scrollpanel", "", PANEL, "DPanel" )
--PATH lua/bricks_server/vgui/bricks_server_textentry.lua:

local PANEL = {}

local strAllowedNumericCharacters = "1234567890.-"

AccessorFunc( PANEL, "m_bAllowEnter", "EnterAllowed", FORCE_BOOL )
AccessorFunc( PANEL, "m_bUpdateOnType", "UpdateOnType", FORCE_BOOL ) -- Update the convar as we type
AccessorFunc( PANEL, "m_bNumeric", "Numeric", FORCE_BOOL )
AccessorFunc( PANEL, "m_bHistory", "HistoryEnabled", FORCE_BOOL )
AccessorFunc( PANEL, "m_bDisableTabbing", "TabbingDisabled", FORCE_BOOL )

AccessorFunc( PANEL, "m_FontName", "Font" )
AccessorFunc( PANEL, "m_bBorder", "DrawBorder" )
AccessorFunc( PANEL, "m_bBackground", "PaintBackground" )
AccessorFunc( PANEL, "m_bBackground", "DrawBackground" ) -- Deprecated

AccessorFunc( PANEL, "m_colText", "TextColor" )
AccessorFunc( PANEL, "m_hintText", "HintText" )
AccessorFunc( PANEL, "m_colHighlight", "HighlightColor" )
AccessorFunc( PANEL, "m_colCursor", "CursorColor" )

AccessorFunc( PANEL, "m_colPlaceholder", "PlaceholderColor" )
AccessorFunc( PANEL, "m_txtPlaceholder", "PlaceholderText" )

Derma_Install_Convar_Functions( PANEL )

function PANEL:Init()

	self:SetHistoryEnabled( false )
	self.History = {}
	self.HistoryPos = 50

	--
	-- We're going to draw these ourselves in
	-- the skin system - so disable them here.
	-- This will leave it only drawing text.
	--
	self:SetPaintBorderEnabled( false )
	self:SetPaintBackgroundEnabled( false )

	--
	-- These are Lua side commands
	-- Defined above using AccessorFunc
	--
	self:SetDrawBorder( true )
	self:SetPaintBackground( true )
	self:SetEnterAllowed( true )
	self:SetUpdateOnType( false )
	self:SetNumeric( false )
	self:SetAllowNonAsciiCharacters( true )

	-- Nicer default height
	self:SetTall( 20 )

	-- Clear keyboard focus when we click away
	self.m_bLoseFocusOnClickAway = true

	-- Beam Me Up Scotty
	self:SetCursor( "beam" )

	self:SetFont( "BRICKS_SERVER_Font23" )
	self:SetText( "" )
	self:SetTextColor( Color( 255, 255, 255, 20 ) )
	self:SetCursorColor( Color( 255, 255, 255 ) )
	self:DockMargin( 10, 0, 0, 0 )
end

function PANEL:IsEditing()
	return self == vgui.GetKeyboardFocus()
end

function PANEL:OnKeyCodeTyped( code )

	self:OnKeyCode( code )

	if ( code == KEY_ENTER && !self:IsMultiline() && self:GetEnterAllowed() ) then

		if ( IsValid( self.Menu ) ) then
			self.Menu:Remove()
		end

		self:FocusNext()
		self:OnEnter()
		self.HistoryPos = 0

	end

	if ( self.m_bHistory || IsValid( self.Menu ) ) then

		if ( code == KEY_UP ) then
			self.HistoryPos = self.HistoryPos - 1
			self:UpdateFromHistory()
		end

		if ( code == KEY_DOWN || code == KEY_TAB ) then
			self.HistoryPos = self.HistoryPos + 1
			self:UpdateFromHistory()
		end

	end

end

function PANEL:OnKeyCode( code )
end

function PANEL:ApplySchemeSettings()

	self:SetFontInternal( self.m_FontName )

	derma.SkinHook( "Scheme", "TextEntry", self )

end

function PANEL:GetTextColor()

	return self.m_colText || self:GetSkin().colTextEntryText

end

function PANEL:GetHintText()

	return self.m_hintText

end

function PANEL:GetPlaceholderColor()

	return self.m_colPlaceholder || self:GetSkin().colTextEntryTextPlaceholder

end

function PANEL:GetHighlightColor()

	return self.m_colHighlight || self:GetSkin().colTextEntryTextHighlight

end

function PANEL:GetCursorColor()

	return self.m_colCursor || self:GetSkin().colTextEntryTextCursor

end

function PANEL:UpdateFromHistory()

	if ( IsValid( self.Menu ) ) then
		return self:UpdateFromMenu()
	end

	local pos = self.HistoryPos
	-- Is the Pos within bounds?
	if ( pos < 0 ) then pos = #self.History end
	if ( pos > #self.History ) then pos = 0 end

	local text = self.History[ pos ]
	if ( !text ) then text = "" end

	self:SetText( text )
	self:SetCaretPos( text:len() )

	self:OnTextChanged()

	self.HistoryPos = pos

end

function PANEL:UpdateFromMenu()

	local pos = self.HistoryPos
	local num = self.Menu:ChildCount()

	self.Menu:ClearHighlights()

	if ( pos < 0 ) then pos = num end
	if ( pos > num ) then pos = 0 end

	local item = self.Menu:GetChild( pos )
	if ( !item ) then
		self:SetText( "" )
		self.HistoryPos = pos
		return
	end

	self.Menu:HighlightItem( item )

	local txt = item:GetText()

	self:SetText( txt )
	self:SetCaretPos( txt:len() )

	self:OnTextChanged( true )

	self.HistoryPos = pos

end

function PANEL:OnTextChanged( noMenuRemoval )

	self.HistoryPos = 0

	if ( self:GetUpdateOnType() ) then
		self:UpdateConvarValue()
		self:OnValueChange( self:GetText() )
	end

	if ( IsValid( self.Menu ) && !noMenuRemoval ) then
		self.Menu:Remove()
	end

	local tab = self:GetAutoComplete( self:GetText() )
	if ( tab ) then
		self:OpenAutoComplete( tab )
	end

	self:OnChange()

end

function PANEL:OnChange()
end

function PANEL:OpenAutoComplete( tab )

	if ( !tab ) then return end
	if ( #tab == 0 ) then return end

	self.Menu = DermaMenu()

	for k, v in pairs( tab ) do

		self.Menu:AddOption( v, function() self:SetText( v ) self:SetCaretPos( v:len() ) self:RequestFocus() end )

	end

	local x, y = self:LocalToScreen( 0, self:GetTall() )
	self.Menu:SetMinimumWidth( self:GetWide() )
	self.Menu:Open( x, y, true, self )
	self.Menu:SetPos( x, y )
	self.Menu:SetMaxHeight( ( ScrH() - y ) - 10 )

end

local Alpha = 20
function PANEL:Think()

	self:ConVarStringThink()

	if( self:IsEditing() and Alpha != 255 ) then
		Alpha = math.Clamp( Alpha+20, 20, 255 )
	elseif( not self:IsEditing() and Alpha != 20 ) then
		Alpha = math.Clamp( Alpha-20, 20, 255 )
	end

	if( self:GetTextColor() != Color( 255, 255, 255, 255 ) or self:GetTextColor() != Color( 255, 255, 255, 20 ) ) then
		self:SetTextColor( Color( 255, 255, 255, Alpha ) )
	end
end

function PANEL:OnEnter()

	-- For override
	self:UpdateConvarValue()
	self:OnValueChange( self:GetText() )

end

function PANEL:UpdateConvarValue()

	-- This only kicks into action if this variable has
	-- a ConVar associated with it.
	self:ConVarChanged( self:GetValue() )

end

function PANEL:Paint( w, h )
	if( self.backColor ) then
		if( self:IsEditing() ) then
			draw.RoundedBox( 5, 0, 0, w, h, self.backColor )
		else
			surface.SetAlphaMultiplier( 0.75 )
			draw.RoundedBox( 5, 0, 0, w, h, self.backColor )
			surface.SetAlphaMultiplier( 1 )
		end
	end

	local panel = self

	if ( panel.GetPlaceholderText && panel.GetPlaceholderColor && panel:GetPlaceholderText() && panel:GetPlaceholderText():Trim() != "" && panel:GetPlaceholderColor() && ( !panel:GetText() || panel:GetText() == "" ) ) then

		local oldText = panel:GetText()

		local str = panel:GetPlaceholderText()
		if ( str:StartWith( "#" ) ) then str = str:sub( 2 ) end
		str = language.GetPhrase( str )

		panel:SetText( str )
		panel:DrawTextEntryText( panel:GetPlaceholderColor(), panel:GetHighlightColor(), panel:GetCursorColor() )
		panel:SetText( oldText )

		return
	end

	panel:DrawTextEntryText( panel:GetTextColor(), panel:GetHighlightColor(), panel:GetCursorColor() )
end

function PANEL:PerformLayout()

	derma.SkinHook( "Layout", "TextEntry", self )

end

function PANEL:SetValue( strValue )

	-- Don't update if we're typing into it!
	-- I'm sure a lot of people will want to reverse this behaviour :(
	if ( vgui.GetKeyboardFocus() == self ) then return end

	local CaretPos = self:GetCaretPos()

	self:SetText( strValue )
	self:OnValueChange( strValue )

	self:SetCaretPos( CaretPos )

end

function PANEL:OnValueChange( strValue )
	-- For Override
end

function PANEL:CheckNumeric( strValue )

	-- Not purely numeric, don't run the check
	if ( !self:GetNumeric() ) then return false end

	-- God I hope numbers look the same in every language
	if ( !string.find( strAllowedNumericCharacters, strValue, 1, true ) ) then

		-- Noisy Error?
		return true

	end

	return false

end

function PANEL:SetDisabled( bDisabled )
	self:SetEnabled( !bDisabled )
end

function PANEL:GetDisabled( bDisabled )
	return !self:IsEnabled()
end

function PANEL:AllowInput( strValue )

	-- This is layed out like this so you can easily override and
	-- either keep or remove this numeric check.
	if ( self:CheckNumeric( strValue ) ) then return true end

end

function PANEL:SetEditable( b )

	self:SetKeyboardInputEnabled( b )
	self:SetMouseInputEnabled( b )

end

function PANEL:OnGetFocus()

	--
	-- These hooks are here for the sake of things like the spawn menu
	-- which don't have key focus until you click on one of the text areas.
	--
	-- If you make a control for the spawnmenu that requires keyboard input
	-- You should have these 3 functions in your panel, so it can handle it.
	--

	hook.Run( "OnTextEntryGetFocus", self )

end

function PANEL:OnLoseFocus()

	self:UpdateConvarValue()

	hook.Call( "OnTextEntryLoseFocus", nil, self )

end

function PANEL:OnMousePressed( mcode )

	self:OnGetFocus()

end

function PANEL:AddHistory( txt )

	if ( !txt || txt == "" ) then return end

	table.RemoveByValue( self.History, txt )
	table.insert( self.History, txt )

end

function PANEL:GetAutoComplete( txt )
	-- for override. Return a table of strings.
end

function PANEL:GetInt()

	return math.floor( tonumber( self:GetText() ) + 0.5 )

end

function PANEL:GetFloat()

	return tonumber( self:GetText() )

end

derma.DefineControl( "bricks_server_textentry", "A simple TextEntry control", PANEL, "TextEntry" )

--[[---------------------------------------------------------
	Clear the focus when we click away from us..
-----------------------------------------------------------]]
hook.Add( "VGUIMousePressed", "BRS_TextEntryLoseFocus", function( panel, mcode )
	hook.Remove( "VGUIMousePressed", "TextEntryLoseFocus" )

	local pnl = vgui.GetKeyboardFocus()
	if ( !pnl ) then return end
	if ( pnl == panel ) then return end
	if ( panel:GetName() == "bricks_server_dmenuoption" ) then return end
	if ( !pnl.m_bLoseFocusOnClickAway ) then return end

	pnl:FocusNext()
end )

--PATH addons/sl_util_atm/lua/autorun/client/cl_batm.lua:
BATM = BATM or {} --Global table for easy access
BATM.PersonalAccount = nil --Stores an updated reference to the players personal account
BATM.GroupAccounts = {} --Stores an updated reference to ALL the group accounts this player has (if loaded first)
BATM.SelectedAccount = nil
BATM.ScreenDisabled = false
BATM.LightsDisabled = false

include("batm_translation.lua")

--Returns the players personal account
function BATM.GetPersonalAccount()
	return BATM.PersonalAccount or false --False if not loaded
end

--Returns the group account, false if none found
function BATM.GetGroupAccount(accountID)
	return BATM.GroupAccounts[accountID] or false
end

--[[-------------------------------------------------------------------------
Handle net messages
---------------------------------------------------------------------------]]
local networkEvents = {}
local function addNetworkEvent(typeID, func)
	networkEvents[typeID] = func
end

net.Receive("blueatm", function()
	local type = net.ReadUInt(8)
	--Prevent false calls
	if type == nil then return end
	if networkEvents[type] == nil then return end
	networkEvents[type]()
end)

--Handle incomming account updates
addNetworkEvent(BATM_NET_COMMANDS.receiveAccountInfo, function(ent)
	local account = net.ReadTable()
	local updateAccountType = net.ReadBool()

	if not account.IsGroup then
		if updateAccountType then
			BATM.SelectedAccount = "personal"
		end
		BATM.PersonalAccount = account 
	elseif account.IsGroup and account.ownerID == LocalPlayer():SteamID64() then
		if updateAccountType then
			BATM.SelectedAccount = "personalgroup"
		end
		BATM.GroupAccount = account
	elseif account.IsGroup then
		if updateAccountType then
			BATM.SelectedAccount = "group"
		end
		BATM.GroupAccount = account
	else
		print("[BATM ERROR] Error reading data on client, this should not happen, if it does open a support ticket.")
	end
	
end)

--Check is a number is "valid"
function BATM.VerifyNumber(number)
	return number ~= nil and number > 0
end

--Returns the active loaded account
function BATM.GetActiveAccount()
	if BATM.SelectedAccount == "personal" then
		return BATM.PersonalAccount
	else
		return BATM.GroupAccount
	end
end

--Tries to deposite that ammount into the loaded account
function BATM.Deposit(ent, amount)
	net.Start("blueatm")
	net.WriteUInt(BATM_NET_COMMANDS.deposit, 8)
	net.WriteEntity(ent)
	net.WriteString(BATM.SelectedAccount)
	net.WriteDouble(amount)
	net.SendToServer()
end 

--Tries to withdraw that ammount from the loaded account and adds it to the players darkrp balance
function BATM.Withdraw(ent, amount)
	net.Start("blueatm")
	net.WriteUInt(BATM_NET_COMMANDS.withdraw, 8)
	net.WriteEntity(ent)
	net.WriteString(BATM.SelectedAccount)
	net.WriteDouble(amount)
	net.SendToServer()
end

--Tries to withdraw that ammount from the loaded account and adds it to the players darkrp balance
--Target needs to be steamid64 or player object
function BATM.Transfer(ent, target, amount)
	local steamid
	if isentity(target) then
		steamid = tostring(target:SteamID64())
	end 

	if BATM.SelectedAccount == "personal" then
		net.Start("blueatm")
		net.WriteUInt(BATM_NET_COMMANDS.transfer, 8)
		net.WriteEntity(ent) 
		net.WriteDouble(amount) 
		net.WriteString(steamid or target) --There steamid 64
		net.SendToServer()
	end
end

--Tries to kick a user from your activly loaded account.
function BATM.KickUser(ent, target)
	local steamid
	if isentity(target) then
		steamid = tostring(target:SteamID64())
	end 

	if BATM.SelectedAccount ~= "personal" then
		net.Start("blueatm")
		net.WriteUInt(BATM_NET_COMMANDS.kickUser, 8)
		net.WriteEntity(ent) 
		net.WriteString(steamid or target) --There steamid 64
		net.SendToServer()
	end
end

--Tries to add a user from your activly loaded account.
function BATM.AddUser(ent, target)
	local steamid
	if isentity(target) then
		steamid = tostring(target:SteamID64() or "777777777777777")
	end 

	if BATM.SelectedAccount ~= "personal" then
		net.Start("blueatm")
		net.WriteUInt(BATM_NET_COMMANDS.addUser, 8)
		net.WriteEntity(ent) 
		net.WriteString(steamid or target) --There steamid 64
		net.SendToServer()
	end
end
--PATH addons/sl_main_system/lua/autorun/client/cl_functions.lua:
-- cl

function W( x ) return x*ScrW()/1920 end
function H( y ) return y*ScrH()/1080 end

-- Client
hook.Add("PreDrawHalos", "AuraHalos", function()
    local entities = ents.FindByClass("player")
    local haloEntities = {}
    -- or ent:GetModel() == "models/mad_models/mad_sl_male_transfo2.mdl" or ent:GetModel() == "models/mad_models/hwangdongsoo_pm.mdl" 
    for _, ent in ipairs(entities) do
        if ent:GetNWBool("Aura_Rang_Toggle") then
            local color

            if ent:GetSkin() == 0 or ent:GetModel() == "models/mad_models/mad_sl_male_transfo2.mdl" then
                if ent:GetModel() == "models/mad_models/hwangdongsoo_pm.mdl" then
                    color = Color(255, 0, 0)
                else
                    color = Color(255, 255, 255)
                end
            elseif ent:GetSkin() == 1 or ent:GetModel() == "models/mad_models/hwangdongsoo_pm.mdl" then
                color = Color(255, 0, 0)
            elseif ent:GetSkin() == 2 then
                color = Color(255, 191, 0)
            elseif ent:GetSkin() == 3 then
                color = Color(255, 255, 0)
            elseif ent:GetSkin() == 4 then
                color = Color(0, 255, 0)
            elseif ent:GetSkin() == 5 then
                color = Color(127, 255, 159)
            elseif ent:GetSkin() == 6 then
                color = Color(0, 255, 255)
            elseif ent:GetSkin() == 7 then
                color = Color(0, 63, 255)
            elseif ent:GetSkin() == 8 then
                color = Color(127, 0, 255)
            elseif ent:GetSkin() == 9 then
                color = Color(220, 0, 255)
            end
            if color then
                if ent:GetNWBool("Aura_Rang_Toggle") == true then
                    -- table.insert(haloEntities, {ent, color})
                    -- print(ent:GetNWString("Rang"))
                    ply = {ent}
                    if ent:SteamID64() == "76561199078633865" then
                        halo.Add(ply, Color(255, 0, 0),16,16, 1, true)
                        halo.Add(ply, Color(255, 0, 212),16,16, 1, true)
                    elseif ent:GetNWString("Rang") == "S" then
                        halo.Add(ply, color,14,14, 1, true)
                    elseif ent:GetNWString("Rang") == "A" then
                        halo.Add(ply, color,8,8, 1, true, false)
                    elseif ent:GetNWString("Rang") == "B" then
                        halo.Add(ply, color,4,4, 1, true, false)
                    end
                end
            end
        end
    end

    -- for _, pair in ipairs(haloEntities) do
    --     local ent = {pair[1]}
    --     print(ent:GetNWString("Rang"))
    --     if ent:GetNWString("Rang") == "S" then
    --         halo.Add(ent, pair[2],14,14, 1, true, false)
    --     elseif ent:GetNWString("Rang") == "A" then
    --         halo.Add(ent, pair[2],8,8, 1, true, false)
    --     elseif ent:GetNWString("Rang") == "B" then
    --         halo.Add(ent, pair[2],4,4, 1, true, false)
    --     end
    --     -- halo.Add({pair[1]}, pair[2],1,1, 1, true, false)
    --     -- halo.Add({pair[1]}, Color(220, 0, 255),1,1, 1, true, false)
    -- end
end)


function formatXP(amount)
    local suffix = ""
    local absAmount = math.abs(amount)
    local formattedAmount = absAmount

    if absAmount >= 1e9 then
        formattedAmount = absAmount / 1e9
        suffix = "B"
    elseif absAmount >= 1e6 then
        formattedAmount = absAmount / 1e6
        suffix = "M"
    elseif absAmount >= 1e3 then
        formattedAmount = absAmount / 1e3
        suffix = "k"
    else
        suffix = ""
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
local HUDMat_Main = Material("mobs_hud.png", "smooth unlitgeneric")
local HUDMat_Bar = Material("mobs_hud_vie.png", "smooth unlitgeneric")
local HUDMat_Bar2 = Material("hud/ds1/boss_hpbar_ylw.png", "smooth unlitgeneric")

function mobs_hud(printname,ent,ratio,boss)
    local ratio = ratio or 1
    local boss = boss or false

    local health = ent:GetNWInt("CurrentHealth", 0)
    local maxHealth = ent:GetNWInt("MaxHealth", 1) -- Assure qu'il y ait une valeur par défaut
    local healthFraction = math.Clamp(health / maxHealth, 0, 1)

    -- Calcul des positions 3D et mise à l'échelle
    local barPos = ent:GetPos() + Vector(0, 0, 45 * (ent.HUDh or 1) + math.sin(CurTime() * 2) * 2)

    -- Angle de la caméra pour toujours être face au joueur
    local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)
    local w = 650 * ratio
    local h = 125 * ratio
    local w2 = 634 * ratio
    local h2 = 21 * ratio
    -- Dessin de la barre de vie en 3D2D
    cam.Start3D2D(barPos, ang, 0.1)
        local hp = math.Round(maxHealth)
        local hp2 = math.Round(health)
        local hpmax = maxHealth
        local text = printname
        local text2 = health

        local pad = 0.01
        surface.SetDrawColor(255,255,255,255)
        surface.SetMaterial(HUDMat_Main)
        surface.DrawTexturedRect(W(-w/2), -h, w, h)
        surface.SetMaterial(HUDMat_Bar)
        surface.DrawTexturedRectUV(W(-w2/2), -h2-2, w2*(hp2/hpmax), h2, 0, 0, (hp2/hpmax), 1)
        if boss then
            color = Color(155, 13,13)
        else
            color = Color(255, 255, 255)
        end
        local tW, tH = surface.GetTextSize(text)
        draw.SimpleText(text, "B_Font4", W(0), -h/1.3, color,TEXT_ALIGN_CENTER)
        if text2 != "0" then 
            draw.SimpleText(text2.." / "..hpmax, "B_Font6", w/2.3, H(-2), color_white, TEXT_ALIGN_RIGHT) 
        end
    cam.End3D2D()
end

hook.Add("PostDrawTranslucentRenderables", "DrawPlayerHUD", function()
    for _, ply in ipairs(player.GetAll()) do
        if ply:GetNWBool("Blocage") then
            if ply == LocalPlayer() then return end
            local pos = ply:GetPos() + Vector(0, 0, 85)
            local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)
            cam.Start3D2D(pos, ang, 0.1)
                local health = math.Round(ply:GetNWInt("bloque_health"))
                local maxHealth = math.Round(ply:GetNWInt("bloque_health_max"))
                local colortxt = Color(255, 255, 255)
                draw.SimpleText(health .. " / " .. maxHealth, "M_Font2", W(250), H(200), colortxt, TEXT_ALIGN_TOP, 2)
            cam.End3D2D()
        end
    end
end)

local colWhite = Color(255, 255, 255, 255)
net.Receive("Seefox:NewEra:Notify", function()
    local msg = net.ReadString()

    hook.Add("PostRenderVGUI", "Seefox:NewEra:Notify", function()
        colWhite.a = math.sin(CurTime() * 5) * 100 + 155

        draw.SimpleText(msg, Seefox_Reroll:Font("Montserrat Regular", 42), ScrW()/2, ScrH()/6, colWhite, 1, 1)
    end)

    timer.Simple(5, function()
        hook.Remove("PostRenderVGUI", "Seefox:NewEra:Notify")
    end)
end)
--PATH addons/sl_main_system/lua/autorun/client/cl_inventory.lua:
local inv_frame = Material("Inventaire_sl.png")
local inv_slots = Material("inv_slots_sl.png")
local equiped_slot_pos = {
    ["casque"] = {W(235), H(225)},
    ["plastron"] = {W(235), H(340)},
    ["pantalon"] = {W(235), H(455)},
    ["botte"] = {W(235), H(570)},
    ["arme"] = {W(590), H(225)},
    ["bague"] = {W(590),H(340)},
    ["sac"] = {W(590), H(455)},
    ["armure"] = {W(590), H(570)},
}

function OpenInventaire(refresh)
    if IsValid(Frame_Inventaire) then Frame_Inventaire:Remove() end

    if LocalPlayer():GetNWInt("Transforme") == true then LocalPlayer():ChatPrint("Vous ne pouvez pas ouvrir votre inventaire quand vous êtes transformé !") return end

    if not refresh then
        surface.PlaySound("buttons/button15.wav")
    end

    Frame_Inventaire = vgui.Create("DFrame")
    Frame_Inventaire:SetPos(W(0), H(0))
    Frame_Inventaire:SetSize(W(1391.4), H(784.8))
    Frame_Inventaire:SetTitle("")
    Frame_Inventaire:MakePopup()
    Frame_Inventaire:SetDraggable(false)
    Frame_Inventaire:ShowCloseButton(false)
    Frame_Inventaire:Center()
    if not refresh then
        Frame_Inventaire:SetAlpha(0)
        Frame_Inventaire:AlphaTo(255, 1, 0)
    end
    Frame_Inventaire.Paint = function(self, w, h)
        surface.SetDrawColor(167, 167, 167, 230)
        surface.SetMaterial(inv_frame)
        surface.DrawTexturedRect(W(0), H(0), w,h)

        if LocalPlayer():GetNWInt("Classe") == "porteur" then
            draw.DrawText("Items max : " .. nb .. "/16", "MNew_Font3", W(1100), H(690), Color(255, 255, 255), TEXT_ALIGN_LEFT)
        else
            if LocalPlayer():GetUserGroup() == "vip" then
                draw.DrawText("Items max : " .. nb .. "/8", "MNew_Font3", W(1100), H(690), Color(255, 255, 255), TEXT_ALIGN_LEFT)
            else
                draw.DrawText("Items max : " .. nb .. "/4", "MNew_Font3", W(1100), H(690), Color(255, 255, 255), TEXT_ALIGN_LEFT)
                surface.SetDrawColor(255, 255, 255, 255)
                surface.SetMaterial(inv_slots)
                surface.DrawTexturedRect(W(754.2), H(192.6), W(441),H(120.6))
            end
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(inv_slots)
            surface.DrawTexturedRect(W(754.2), H(310.6), W(441),H(120.6))
            surface.DrawTexturedRect(W(754.2), H(424.6), W(441),H(120.6))
            surface.DrawTexturedRect(W(754.2), H(544.6), W(441),H(120.6))
        end
        draw.DrawText(LocalPlayer():Nick(), "B_Font6", W(450), H(110), Color(255, 255, 255), TEXT_ALIGN_CENTER)
    end

    CloseB = vgui.Create("DButton", Frame_Inventaire)
    CloseB:SetText("")
    CloseB:SetPos(W(1200), H(80))
    CloseB:SetSize(W(30), H(30))
    CloseB.DoClick = function()
        if IsValid(Frame_Inventaire) then
            timer.Destroy("IconUpdate" .. LocalPlayer():SteamID64())
            Frame_Inventaire:Remove()
        end
    end
    CloseB.Paint = function(self, w, h)
        if CloseB:IsHovered() then
            draw.SimpleText("X","CloseCaption_Bold",h/2,0,Color(168,48,48),TEXT_ALIGN_CENTER)
          else
            draw.SimpleText("X","CloseCaption_Bold",h/2,0,Color(255,255,255),TEXT_ALIGN_CENTER)
          end
    end

    icon = vgui.Create("DModelPanel", Frame_Inventaire)
    icon:SetSize(W(300), H(430))
    icon:SetPos(W(300), H(210))
    icon:SetFOV(35)
    icon:SetAmbientLight(Color(0, 161, 255, 255))
    icon:SetModel(LocalPlayer():GetModel())
    function icon:LayoutEntity(Entity) return end    
    local headpos = icon.Entity:GetBonePosition(icon.Entity:LookupBone("ValveBiped.Bip01_Spine"))
    icon:SetLookAt(headpos)
    
    icon:SetCamPos(headpos-Vector(-75, 0, 0))

    local function GetPlayerBodygroups(player)
        local bodygroups = {}
        for i = 0, player:GetNumBodyGroups() - 1 do
            bodygroups[i] = player:GetBodygroup(i)
        end
        return bodygroups
    end

    local playerBodygroups = GetPlayerBodygroups(LocalPlayer())

    for index, value in pairs(playerBodygroups) do
        icon.Entity:SetBodygroup(index, value)
    end

    icon.Entity:SetSkin(LocalPlayer():GetSkin())
    function icon.Entity:GetPlayerColor()
        return (LocalPlayer():GetPlayerColor())
    end

    timer.Create("IconUpdate" .. LocalPlayer():SteamID64(), 1, 0, function()
        icon:SetModel(LocalPlayer():GetModel())

        local playerBodygroups = GetPlayerBodygroups(LocalPlayer())

        for index, value in pairs(playerBodygroups) do
            icon.Entity:SetBodygroup(index, value)
        end

        icon.Entity:SetSkin(LocalPlayer():GetSkin())
        function icon.Entity:GetPlayerColor()
            return (LocalPlayer():GetPlayerColor())
        end
    end)


    InvGrid = vgui.Create("DGrid", Frame_Inventaire)
    InvGrid:SetPos(W(780), H(215))
    InvGrid:SetSize(W(780), H(493))
    InvGrid:SetCols(4)
    InvGrid:SetColWide(W(108))
    InvGrid:SetRowHeight(H(97))

    InvEquipGrid = vgui.Create("DGrid", Frame_Inventaire)
    InvEquipGrid:SetPos(W(360), H(410))
    InvEquipGrid:SetSize(W(408), H(488))
    InvEquipGrid:SetCols(1)
    InvEquipGrid:SetColWide(W(325))
    InvEquipGrid:SetRowHeight(H(97))

    local equippedItems = {}
    local unequippedItems = {}
    nb = 0
  
    for k, v in pairs(INV_SL) do
        if sl_data[k] and sl_data[k] >= 1 then
            table.insert(unequippedItems, k)
        end
        if sl_data5[k] and sl_data5[k] >= 1 then
            table.insert(equippedItems, k)
        end
    end

    local function RefreshInventory()
        InvGrid:Clear()
        InvEquipGrid:Clear()

        for _, k in ipairs(unequippedItems) do
            local v = INV_SL[k]
            local InvBut = CreateInventoryButton(k, v)
            if (sl_data[k] or 0) > 0 then
                InvGrid:AddItem(InvBut)
            end
        end

        for _, k in ipairs(equippedItems) do
            local v = INV_SL[k]
            local InvBut = CreateInventoryButton(k, v,true)
            -- if sl_data[k] > 0 then
                -- InvEquipGrid:AddItem(InvBut)
            -- end
        end
    end

    function CreateInventoryButton(k, v,equiped)
        if string.StartWith(v.type, "item") then
            InvBut = vgui.Create("DImage",Frame_Inventaire)

            if v.name == "Crystal Blanc" then
                InvBut:SetImage("mad_sololeveling/crystal_icon.png")
            elseif v.name == "Crystal Bleu" then
                InvBut:SetImage("mad_sololeveling/crystal_icon2.png")
            elseif v.name == "Crystal Rouge" then
                InvBut:SetImage("mad_sololeveling/crystal_icon3.png")
            elseif v.name == "Crystal Violet" then
                InvBut:SetImage("mad_sololeveling/crystal_icon4.png")
            elseif v.name == "Minerai de Mana" then
                InvBut:SetImage("mad_sololeveling/minerai.png")
            else
                InvBut:SetImage("mad_sololeveling/crystal_icon.png")
            end
            InvBut:SetTooltip(v.name)
            InvBut:SetSize(W(70), H(60))
        elseif string.StartWith(v.type, "accessoire") or string.StartWith(v.type, "sac") or string.StartWith(v.type, "casque") or string.StartWith(v.type, "plastron") or string.StartWith(v.type, "pantalon") or string.StartWith(v.type, "botte") or string.StartWith(v.type, "bague") then
            InvBut = vgui.Create("DButton", Frame_Inventaire)
            InvBut:SetSize(W(70), H(60))
            InvBut:SetText("")
            InvBut.Paint = function() end
            InvBut:SetTooltip(v.name)

            Image = vgui.Create("DImage", InvBut)
            Image:SetSize(W(70), H(60))
            Image:SetImage(v.img)

        else
            InvBut = vgui.Create("DModelPanel",Frame_Inventaire)

            if v.type == "armure" and LocalPlayer():GetNWInt("Genre") == "male" then
                InvBut:SetModel(v.playermodel_male)
            elseif v.type == "armure" and LocalPlayer():GetNWInt("Genre") == "female" then
                InvBut:SetModel(v.playermodel_female)
            else
                InvBut:SetModel(v.model)
            end

            InvBut:GetEntity():SetAngles(Angle(0, 100, 0))
            InvBut:GetEntity():SetModelScale(v.scale * 1.7)
            function InvBut:LayoutEntity(ent)
            end
            
            -- InvBut:SetText(v.name)
            InvBut:SetTooltip(v.name)
            InvBut:SetTextColor(Color(255, 255, 255))

            InvBut:SetFont("M_Font3")
            InvBut:SetLookAt(InvBut:GetEntity():GetPos())
            if v.type == "armure" then
                InvBut:SetFOV(13)
            else
                InvBut:SetFOV(50)
            end
            InvBut:SetSize(W(70), H(60))
        end
        InvBut:SetContentAlignment(2)

        if equiped then
            InvBut:SetPos(equiped_slot_pos[v.type][1],equiped_slot_pos[v.type][2])
        end
        InvBut.InternalValue = k
        InvBut.DLabel = vgui.Create("DLabel", InvBut)
        InvBut.DLabel:SetText((sl_data[k] or 0) > 1 and sl_data[k] or "")
        InvBut.DLabel:SetPos(W(InvBut:GetX() + 54), H(InvBut:GetY()))
        InvBut.DLabel:SetFont("M_Font3")

        InvBut:Droppable("InventoryItem")
        InvBut.OnStopDragging = function(self)

            local mx, my = gui.MousePos()
            local Type =  INV_SL[self.InternalValue].type
            if mx >= W(490) and mx <= W(933) and my >= H(361) and my <= H(787) then
                if INV_SL[self.InternalValue].classe ~= "none" then
                    if !INV_SL[self.InternalValue].classe[LocalPlayer():GetNWString("Classe")] then
                        LocalPlayer():ChatPrint("Vous ne pouvez pas équiper cela, vous n'êtes pas de la bonne classe.")
                        return
                    end
                end

                if Type == "item" then LocalPlayer():ChatPrint("Vous ne pouvez pas équipé un objet.") return end
                if Type == "resource" then LocalPlayer():ChatPrint("Vous ne pouvez pas équipé une resource.") return end
                if not table.HasValue(equippedItems, self.InternalValue) then
                    -- if LocalPlayer():GetNWBool("Equip_"..Type) == true then
                    --     LocalPlayer():ChatPrint("Vous avez déjà une "..Type.." équipé, veuillez la déséquipé.") 
                    -- return end
                    /*sl_data[k] = sl_data[k] - 1
                    if sl_data[k] <= 0 then
                        table.RemoveByValue(unequippedItems, self.InternalValue)
                    end

                    table.insert(equippedItems, self.InternalValue)*/
                    if Type == "armure" or Type == "arme" or Type == "sac" then
                        net.Start("SL:Mad - Inv:Equip_"..Type)
                        net.WriteString(self.InternalValue)
                        net.SendToServer()
                        print("SL:Mad - Inv:Equip_"..Type)
                    else
                        print("SL:Mad - Inv:Equip_accesorie")
                        net.Start("SL:Mad - Inv:Equip_accesorie")
                        net.WriteString(self.InternalValue)
                        net.SendToServer()
                    end

                end
            elseif mx >= W(800) and mx <= W(1450) and my >= H(350) and my <= H(800) and equiped then
                if INV_SL[self.InternalValue].type == "item" then LocalPlayer():ChatPrint("Vous ne pouvez pas deséquipé un objet.") return end
                -- local posx = InvBut:GetPos()
                -- if posx >= W(550) then return end

                if not table.HasValue(equippedItems, self.InternalValue) then return end

                -- if not table.HasValue(unequippedItems, self.InternalValue) then
                --     table.insert(unequippedItems, self.InternalValue)
                -- else
                --     sl_data[k] = sl_data[k] + 1
                -- end
                -- table.RemoveByValue(equippedItems, self.InternalValue)
                if Type == "armure" or Type == "arme" or Type == "sac" then
                    net.Start("SL:Mad - Inv:DeEquip_"..Type)
                    net.WriteString(self.InternalValue)
                    net.SendToServer()
                else
                    net.Start("SL:Mad - Inv:DeEquip_accesorie")
                    net.WriteString(self.InternalValue)
                    net.SendToServer()
                end
                -- self:Remove()
            else
                if mx < W(316) or mx > W(1606) or my < H(122) or my > H(988) then
                    net.Start("SL:Mad - Inv:JeterItem")
                    net.WriteString(self.InternalValue)
                    net.SendToServer()
                    if sl_data[self.InternalValue] <= 1 then
                        table.RemoveByValue(equippedItems, self.InternalValue)
                        table.RemoveByValue(unequippedItems, self.InternalValue)
                    end

                    if IsValid(Frame_Inventaire) then
                        timer.Destroy("IconUpdate" .. LocalPlayer():SteamID64())
                        Frame_Inventaire:Remove()
                    end
                end
            end

            RefreshInventory()
        end

        return InvBut
    end

    RefreshInventory()
end

net.Receive("SL:OpenInventaire", function( len, ply )
    OpenInventaire(net.ReadBool())
end)
concommand.Add("openinv", function()
    OpenInventaire()
end)
--PATH addons/newera_reroll/lua/autorun/client/cl_seefox_reroll_classe_magie.lua:
RX = RX or function(x) return ScrW() * x / 1920 end
RY = RY or function(y) return ScrH() * y / 1080 end

Seefox_Reroll.Fonts = Seefox_Reroll.Fonts or {}

function Seefox_Reroll:Font(font, size)
	font = font or "Montserrat"
	size = size or 15

	local name = ("Seefox_Reroll:Font:%s:%i"):format(font, size)
	if not self.Fonts[name] then
		surface.CreateFont(name, {
			font = font,
			size = RX(size),
			width = 500,
			extended = false
		})

		self.Fonts[name] = true
	end

	return name
end

local mats = {
    ["background"] = Material("seefox/newera/reroll/background.png"),
}

local colors = {
    ["white"] = Color(255, 255, 255),
    ["star"] = Color(255, 215, 55),
    ["shadow"] = Color(0, 0, 0, 255*0.65),
}

local rdmCases = {
    [176] = true,
    [177] = true,
    [178] = true,
    [179] = true,
}

OldMaterial = OldMaterial or Material

function Material(name, words)
    if not words then
        words = "smooth clamp"
    end

    return OldMaterial(name, words)
end

local function gen(item, drops, i)
    if rdmCases[i] and math.random(1, 4) == 1 then
        item.icon = table.Random(drops).icon
    else
        local chance = math.random(1, 10)
        local rarity = ""
    
        if chance <= 6 then
            rarity = "common"
        elseif chance <= 9 then
            rarity = "rare"
        else
            rarity = "epic"
        end
    
        local items = {}
    
        for _, item in ipairs(drops) do
            if item.rarity != rarity then continue end

            items[#items + 1] = item
        end

        item.icon = table.Random(items).icon
    end
end

local function dbg_paint(_, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 100))
end

function Seefox_Reroll:Menu(ttype)
    if not IsValid(LocalPlayer()) then return end -- debug
    if IsValid(Seefox_Reroll.Panel) then Seefox_Reroll.Panel:Remove() end

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
    panel.type = ttype or "classe"
    panel.Paint = function(_, w, h)
        surface.SetDrawColor(color_white)
        surface.SetMaterial(mats["background"])
        surface.DrawTexturedRect(0, 0, w, h)

        draw.SimpleText(LocalPlayer():GetPoints(panel.type).." REROLLS RESTANTS", self:Font("Coral Reef", 24), RX(1598), RY(753), colors["white"], 2, 1)
    end
    panel.PaintOver = function(_, w, h)
        surface.SetDrawColor(color_white)
        surface.DrawRect(RX(946), RY(465), RX(4), RY(241))
    end

    /*local header = {
        { -- class
            x = 412,
            func = function()
                Seefox_Reroll:Menu("class")
            end
        },
        { -- magic
            x = 1348,
            func = function()
                Seefox_Reroll:Menu("magic")
            end
        }
    }

    for _, head in ipairs(header) do
        local btn = vgui.Create("DButton", panel)
        btn:SetSize(RX(162), RY(34))
        btn:SetPos(RX(head.x), RY(389))
        btn:SetText("")
        btn.Paint = nil
        btn.DoClick = function()
            -- surface.PlaySound("seefox/newera/select.wav")

            head.func()
        end
    end*/

    local scroll = vgui.Create("DHorizontalScroller", panel)
    scroll:SetSize(RX(1280), RY(243))
    scroll:SetPos(RX(314), RY(458))
    scroll:SetOverlap(-RX(32))
    scroll.btnLeft.Paint = function() end
    scroll.btnLeft:SetSize(0, 0)
    scroll.btnRight.Paint = function() end
    scroll.btnRight:SetSize(0, 0)
    scroll.OnMouseWheeled = function() end
    -- scroll.Paint = dbg_paint

    scroll.want = 0
    scroll.items = {}

    function scroll:LerpScroll(vPanel)
        self:InvalidateLayout(true)

        local x, y = self.pnlCanvas:GetChildPosition(vPanel)
        local w, h = vPanel:GetSize()

        x = x + w * 0.5
        x = x - self:GetWide() * 0.5

        self.want = x
    end

    function scroll:Think()
        self:SetScroll(Lerp(0.6/(1/FrameTime()), self.OffsetX, self.want or 0))
    end

    for i = 1, 200 do
        local item = vgui.Create("EditablePanel", scroll)
        item:SetWide(RX(226))
        item.Paint = function(_, w, h)
            -- surface.SetDrawColor(color_white)
            -- surface.SetMaterial(mats["item"])
            -- surface.DrawTexturedRect(0, 0, w, h)

            if item.icon then
                surface.SetDrawColor(color_white)
                surface.SetMaterial(item.icon)
                surface.DrawTexturedRect(0, 0, w, h)
            end
        end
        scroll:AddPanel(item)

        gen(item, Seefox_Reroll.Rerolls[panel.type], i)
        -- item.icon = table.Random(Seefox_Reroll.Rerolls[panel.type]).icon

        scroll.items[i] = item

        if i != 180 then continue end

        scroll.target = item
    end

    scroll.want = RX(92)
    scroll:SetScroll(RX(92))

    panel.scroll = scroll

    local reroll = vgui.Create("DButton", panel)
    reroll:SetSize(RX(247), RY(61))
    reroll:SetPos(RX(821), RY(705))
    reroll:SetText("")
    reroll.Paint = function(_, w, h)
        if not panel.spin then
            draw.SimpleText("LANCER", self:Font("Posterama 2001 W04 Bold", 48), w/2, h*.4, colors["white"], 1, 1)
        else
            draw.SimpleText("SKIP", self:Font("Posterama 2001 W04 Bold", 48), w/2, h*.4, colors["white"], 1, 1)
            
            surface.SetDrawColor(color_white)
        	surface.DrawRect(w/2-RX(158)/2, RY(47), RX(158)*(panel.spin and (panel.spin-CurTime())/11 or 1), RY(2))
        end
    end
    reroll.DoClick = function()
        if panel.locked then
            RunConsoleCommand("stopsound")
            scroll.OffsetX = scroll.want
            timer.Adjust("Seefox:Reroll", 0.1)
            return
        end

        -- surface.PlaySound("seefox/newera/upgrade.wav")

        net.Start("Seefox:Reroll:Purchase")
        net.WriteString(panel.type)
        net.SendToServer()
    end
    reroll.OnCursorEntered = function()
        reroll:AlphaTo(100, 0.2)
    end
    reroll.OnCursorExited = function()
        if panel.locked then return end

        reroll:AlphaTo(255, 0.2)
    end

    panel.reroll = reroll

    local close = vgui.Create("DButton", panel)
    close:SetSize(RX(215), RY(50))
    close:SetPos(RX(308), RY(747))
    close:SetText("")
    close.Paint = nil--dbg_paint
    close.DoClick = function()
        -- surface.PlaySound("seefox/newera/select.wav")

        panel:AlphaTo(0, 0.2, 0, function()
            black:Remove()
        end)
    end

    Seefox_Reroll.Panel = black

    return panel
end

net.Receive("Seefox:Reroll:Menu", function()
    Seefox_Reroll:Menu()
end)

local PLAYER = FindMetaTable("Player")

function PLAYER:GetPoints(type)
    return sl_data3 and sl_data3[type] or 0
end

local colWhite = Color(255, 255, 255, 255)
net.Receive("Seefox:Reroll:Purchase", function()
    if not IsValid(Seefox_Reroll.Panel) then return end

    local panel = Seefox_Reroll.Panel:GetChildren()[1]

    if not IsValid(panel) then return end

    panel.locked = true
    panel.spin = CurTime() + 11

    local rerolls = Seefox_Reroll.Rerolls[panel.type]
    local reroll = rerolls[net.ReadUInt(6)]

    local scroll = panel.scroll
    -- scroll.Paint = dbg_paint

    surface.PlaySound("seefox/newera/reroll.mp3")

    if IsValid(scroll.target) then
        timer.Simple(0.4,function()
            for i = 1, 200 do
                if i == 180 then continue end

                local item = scroll.items[i]

                if not IsValid(item) then continue end

                gen(item, rerolls, i)
            end

            if not IsValid(scroll.target) then return end
        
            scroll.target.icon = reroll.icon
        end)
    end

    timer.Simple(0.2, function()
        if not IsValid(scroll) or not IsValid(scroll.target) then return end

        scroll.want = RX(92)
        scroll:SetScroll(RX(92))
        scroll:LerpScroll(scroll.target)
    end)

    timer.Create("Seefox:Reroll", 11, 1, function()
        -- surface.PlaySound("seefox/newera/unlocked.wav")

        if IsValid(panel.reroll) then
            panel.spin = nil

            panel.reroll:AlphaTo(255, 0.2, 0, function()
                panel.locked = false
            end)
        end

        hook.Add("PostRenderVGUI", "Seefox:Reroll:Notify", function() 
            colWhite.a = math.sin(CurTime() * 5) * 100 + 155
    
            draw.SimpleText("Vous avez obtenu "..reroll.name.." !", Seefox_Reroll:Font("Montserrat Regular", 42), ScrW()/2, ScrH()/4, colWhite, 1, 1)
        end)
    
        timer.Simple(5, function()
            hook.Remove("PostRenderVGUI", "Seefox:Reroll:Notify")
        end)
    end)
end)

-- hook.Add("PlayerButtonDown", "Seefox:Reroll:Menu", function(ply, key)
--     if key == Seefox_Reroll.Key then
--         RunConsoleCommand("seefox_reroll")
--     end
-- end)

print("[Seefox Reroll] Loaded client file!")
--PATH addons/autorun_taxi_teleport/lua/autorun/client/taxi_teleport_cl.lua:
--[[
-----------------------------------------------------------
                    Informations
-----------------------------------------------------------
Ce fichier provient du site web https://aide-serveur.fr/ et a été publié et créé par Autorun__.
Toute forme de revente, de republication, d'envoi à des tiers, etc. est strictement interdite, car cet addon est payant.
Discord : Autorun__
Serveur Discord : Discord.gg/GgH8eKmFpt
-----------------------------------------------------------
--]]

include("sh_config_taxi_teleport.lua")

surface.CreateFont("DestinationButtonFont", {
    font = "Arial",
    size = 20,
    weight = 700,
    antialias = true,
})

surface.CreateFont("CloseButtonFont", {
    font = "Arial",
    size = 24,
    weight = 800,
    antialias = true,
})

function OpenTaxiMenu()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("")
    frame:SetSize(1000, 500)
    frame:Center()
    frame:MakePopup()

    local icon = vgui.Create("DImage", frame)
    icon:SetPos(350, 55) 
    icon:SetSize(16, 16) 
    icon:SetImage("materials/icons/autorun_taxi_destination.png")

    local icon2 = vgui.Create("DImage", frame)
    icon2:SetPos(420, 17) 
    icon2:SetSize(16, 16) 
    icon2:SetImage("materials/icons/autorun_taxi_taxi.png")

    local headerDest = vgui.Create("DLabel", frame)
    headerDest:SetColor(TaxiTeleportConfig.Colors.Text) 
    headerDest:SetFont("DestinationButtonFont") 
    headerDest:SetText("Choisissez votre destination :") 
    headerDest:SizeToContents() 

    local labelWidth = headerDest:GetWide()
    local frameWidth = frame:GetWide()
    local xPos = (frameWidth - labelWidth) / 2

    headerDest:SetPos(xPos, 55) 
    headerDest:SetContentAlignment(5)

    frame:SetSizable(false)
    frame:ShowCloseButton(false)
    frame.Paint = function(self, w, h)
        draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.Background) 
        draw.SimpleText("Taxi", "DestinationButtonFont", w / 2, 15, TaxiTeleportConfig.Colors.Text, TEXT_ALIGN_CENTER) 
    end

    local closeButton = vgui.Create("DButton", frame)
    closeButton:SetText("")
    closeButton:SetPos(frame:GetWide() - 40, 10) 
    closeButton:SetSize(30, 30) 
    closeButton.Paint = function(self, w, h)
        draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.CloseButton) 
        local text = "×"
        surface.SetFont("CloseButtonFont")
        local textW, textH = surface.GetTextSize(text)
        local textX = (w - textW) / 2
        local textY = (h - textH) / 2
        draw.SimpleText(text, "CloseButtonFont", textX, textY, TaxiTeleportConfig.Colors.XClose, 0, 0)
    end
    closeButton.DoClick = function()
        frame:Close()
    end

    local scrollPanel = vgui.Create("DScrollPanel", frame)
    scrollPanel:Dock(FILL)
    scrollPanel:DockMargin(10, 50, 10, 10)

    local sbar = scrollPanel:GetVBar()
    function sbar:Paint(w, h)
        draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.ScrollBar) 
    end
    function sbar.btnUp:Paint(w, h)
        draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.ScrollBarBtn) 
    end
    function sbar.btnDown:Paint(w, h)
        draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.ScrollBarBtn) 
    end
    function sbar.btnGrip:Paint(w, h)
        draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.ScrollBarGrip) 
    end

    for _, dest in pairs(TaxiTeleportConfig.Destinations) do
        local button = scrollPanel:Add("DButton")
        local currency = TaxiTeleportConfig.Currency
        local priceText = currency == "$" and currency .. dest.Price or dest.Price
        button:SetText(dest.Name .. " - " .. formatMoney(priceText))
        button:SetFont("DestinationButtonFont")
        button:Dock(TOP)
        button:DockMargin(10, 0, 10, 5)
        button:SetHeight(50)
        button.Paint = function(self, w, h)
            if self:IsHovered() then
                self:SetTextColor(TaxiTeleportConfig.Colors.ButtonTextHover)
                draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.ButtonBackgroundHover)
            else
                self:SetTextColor(TaxiTeleportConfig.Colors.ButtonText)
                draw.RoundedBox(TaxiTeleportConfig.BorderRadius, 0, 0, w, h, TaxiTeleportConfig.Colors.ButtonBackground)
            end
        end

        button.DoClick = function()
            local destIndex = table.KeyFromValue(TaxiTeleportConfig.Destinations, dest)
            net.Start("TaxiTeleportRequest")
            net.WriteInt(destIndex, 32)
            net.SendToServer()
            frame:Close()
        end        
    end
end

net.Receive("OpenTaxiMenu", function()
    OpenTaxiMenu()
end)
--PATH lua/vgui/bvgui/grid.lua:
local PANEL = {}

bVGUI.GRID_ALIGN_LEFT   = 0
bVGUI.GRID_ALIGN_CENTER = 1
bVGUI.GRID_ALIGN_RIGHT  = 2

function PANEL:Init()
	self.Items = {}
	self.ColumnPadding = 0
	self.RowPadding = 0
	self.Alignment = bVGUI.GRID_ALIGN_CENTER

	function self.pnlCanvas:PerformLayout()
		self:GetParent():LayoutItems()
	end

	self.BottomPadding = vgui.Create("bVGUI.BlankPanel", self)
	self.BottomPadding:Dock(BOTTOM)
	self.BottomPadding:SetTall(1)
end

function PANEL:SetAlignment(alignment)
	self.Alignment = alignment
end

function PANEL:SetPadding(c,r)
	self:SetColumnPadding(c)
	self:SetRowPadding(r)
end

function PANEL:SetColumnPadding(padding)
	self.ColumnPadding = padding
end

function PANEL:SetRowPadding(padding)
	self.RowPadding = padding
end

function PANEL:AddToGrid(item)
	table.insert(self.Items, item)
end

function PANEL:LayoutItems()
	self:CalculateGridSize()

	local columns = math.floor(self:GetWide() / self.MinColumnSize)
	local column_w = self:GetWide() / columns
	local column_i = 0
	local column_x = 0
	local row_y = 0
	for _,child in ipairs(self.Items) do
		if (self.Alignment == bVGUI.GRID_ALIGN_CENTER) then
			child:SetPos(column_x + (column_w / 2 - child:GetWide() / 2), row_y + (self.MinRowSize / 2 - child:GetTall() / 2))
		elseif (self.Alignment == bVGUI.GRID_ALIGN_LEFT) then
			child:SetPos(column_x, row_y + (self.MinRowSize / 2 - child:GetTall() / 2))
		elseif (self.Alignment == bVGUI.GRID_ALIGN_RIGHT) then
			child:SetPos(column_x + (column_w - child:GetWide()), row_y + (self.MinRowSize / 2 - child:GetTall() / 2))
		end
		column_x = column_x + column_w

		column_i = column_i + 1
		if (column_i >= columns) then
			column_i = 0
			column_x = 0
			row_y = row_y + self.MinRowSize + self.RowPadding
		end
	end

	self.BottomPadding:SetPos(0, row_y - 1)

	self:InvalidateLayout(true)
end

function PANEL:CalculateGridSize()
	local biggest_column = 0
	local biggest_row = 0
	for _,child in ipairs(self.Items) do
		if (child:GetWide() > biggest_column) then
			biggest_column = child:GetWide()
		end
		if (child:GetTall() > biggest_row) then
			biggest_row = child:GetTall()
		end
	end
	self.MinRowSize = biggest_row + (self.RowPadding * 2)
	self.MinColumnSize = biggest_column + (self.ColumnPadding * 2)
end

derma.DefineControl("bVGUI.Grid", nil, PANEL, "bVGUI.ScrollPanel")
--PATH lua/vgui/gas_workshop_item.lua:
local function L(phrase, ...)
	if (#({...}) == 0) then
		return GAS:Phrase(phrase, "workshop")
	else
		return GAS:PhraseFormat(phrase, "workshop", ...)
	end
end

file.CreateDir("gmodadminsuite/workshop")

local PANEL = {}

function PANEL:Init()
	self:SetMouseInputEnabled(true)
	self:SetCursor("hand")
	self:Dock(TOP)
	self:SetTall(105)
	self:SetLoading(true)

	self.ItemImage = vgui.Create("bVGUI.LoadingPanel", self)
	self.ItemImage:Dock(LEFT)
	self.ItemImage:SetMouseInputEnabled(false)
	self.ItemImage:DockPadding(10,10,10,10)
	self.ItemImage:SetLoading(false)
	self.ItemImage:SetWide(105)

		self.ItemImage.ImagePnl = vgui.Create("DImage", self.ItemImage)
		self.ItemImage.ImagePnl:Dock(FILL)

	self.Content = vgui.Create("bVGUI.BlankPanel", self)
	self.Content:Dock(FILL)
	self.Content:SetMouseInputEnabled(false)
	self.Content:DockPadding(0,10,10,10)

		self.Content.ItemName = vgui.Create("DLabel", self.Content)
		self.Content.ItemName:Dock(TOP)
		self.Content.ItemName:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 16))
		self.Content.ItemName:SetTextColor(bVGUI.COLOR_WHITE)
		self.Content.ItemName:SetContentAlignment(4)
		self.Content.ItemName:SetText("")

		self.Content.Description = vgui.Create("DLabel", self.Content)
		self.Content.Description:Dock(FILL)
		self.Content.Description:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "REGULAR", 14))
		self.Content.Description:SetTextColor(bVGUI.COLOR_WHITE)
		self.Content.Description:SetContentAlignment(7)
		self.Content.Description:SetText("")
		self.Content.Description:SetWrap(true)
end

function PANEL:OnMouseReleased(m)
	if (m ~= MOUSE_LEFT) then return end
	local menu = DermaMenu()

	menu:AddOption(L"copy_item_id", function()
		GAS:SetClipboardText(self.ItemInfo.publishedfileid)
	end):SetIcon("icon16/page_copy.png")

	local open_workshop_page, _ = menu:AddSubMenu(L"open_workshop_page") _:SetIcon("materials/gmodadminsuite/steam.png")

		open_workshop_page:AddOption(L"steam_browser", function()
			GAS:OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=" .. self.ItemInfo.publishedfileid)
		end):SetIcon("materials/gmodadminsuite/steam.png")

		open_workshop_page:AddOption(L"copy_link", function()
			GAS:SetClipboardText("https://steamcommunity.com/sharedfiles/filedetails/?id=" .. self.ItemInfo.publishedfileid)
		end):SetIcon("icon16/page_copy.png")

	menu:AddOption(L"open_creator_profile", function()
		GAS:OpenURL("https://steamcommunity.com/profiles/" .. self.ItemInfo.creator)
	end):SetIcon("icon16/user_gray.png")

	menu:Open()
end

function PANEL:SetItemInfo(item_info)
	self.ItemInfo = item_info
	self.ItemID = tonumber(item_info.publishedfileid)

	self.Content.ItemName:SetText(item_info.title or L"error")
	self.Content.ItemName:SizeToContentsY()

	self.Content.Description:SetText(item_info.description or L"error")

	if (file.Read("gmodadminsuite/workshop/" .. item_info.publishedfileid .. ".png", "DATA")) then
		self.ItemImage:SetLoading(false)
		self.ItemImage.ImagePnl:SetImage("data/gmodadminsuite/workshop/" .. item_info.publishedfileid .. ".png")
	else
		self.ItemImage:SetLoading(true)
		http.Fetch(item_info.preview_url, function(body, len, headers, code)
			self.ItemImage:SetLoading(false)
			if (len > 0 and code == 200) then
				file.Write("gmodadminsuite/workshop/" .. item_info.publishedfileid .. ".png", body)
				self.ItemImage.ImagePnl:SetImage("data/gmodadminsuite/workshop/" .. item_info.publishedfileid .. ".png")
			else
				self.ItemImage.ImagePnl:SetImage("missing")
			end
		end)
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(40,64,87)
	surface.DrawRect(0,0,w,h)

	surface.SetMaterial(bVGUI.MATERIAL_GRADIENT_LIGHT)
	surface.DrawTexturedRect(0,0,w,h)
end

derma.DefineControl("GAS.Workshop.Item", nil, PANEL, "bVGUI.LoadingPanel")
--PATH addons/sl_utils/lua/vgui/stackerdnumslider.lua:
--[[--------------------------------------------------------------------------
-- 	Namespace Tables
--------------------------------------------------------------------------]]--

local PANEL = {}

--[[--------------------------------------------------------------------------
-- 	Localized Functions & Variables
--------------------------------------------------------------------------]]--

local math = math
local vgui = vgui
local tonumber = tonumber

--[[--------------------------------------------------------------------------
--	Namespace Functions
--------------------------------------------------------------------------]]--

--[[--------------------------------------------------------------------------
--
--	PANEL:SetValue( string, boolean )
--
--]]--
function PANEL:SetValue( val, bSuppress )
	val = math.Clamp( tonumber( val ) or 0, self:GetMin(), self:GetMax() )

	if ( val == nil ) then return end
	if ( self:GetValue() == val ) then return end

	self.Scratch:SetFloatValue( val )
	self:ValueChanged( self:GetValue(), bSuppress )
end

--[[--------------------------------------------------------------------------
--
--	PANEL:ValueChanged( string, value)
--
--]]--
function PANEL:ValueChanged( val, bSuppress )
	val = math.Clamp( tonumber( val ) or 0, self:GetMin(), self:GetMax() )
	self.Slider:SetSlideX( self.Scratch:GetFraction( val ) )	
	if ( self.TextArea ~= vgui.GetKeyboardFocus() ) then
		self.TextArea:SetValue( self.Scratch:GetTextValue() )
	end
	if ( not bSuppress ) then
		self:OnValueChanged( val )
	end
end

vgui.Register( "StackerDNumSlider", PANEL, "DNumSlider" )
--PATH gamemodes/mangarp/gamemode/modules/language/sh_interface.lua:
DarkRP.addLanguage = DarkRP.stub{
    name = "addLanguage",
    description = "Create a language/translation.",
    parameters = {
        {
            name = "Language name",
            description = "The short name of the language (\"en\" is English). Make sure the language name fits a possible value for gmod_language!",
            type = "string",
            optional = false
        },
        {
            name = "Language contents",
            description = "A table that contains the translation sentences. Look at sh_english.lua for an example.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.addPhrase = DarkRP.stub{
    name = "addPhrase",
    description = "Add a phrase to the existing translation.",
    parameters = {
        {
            name = "Language name",
            description = "The short name of the language (\"en\" is English). Make sure the language name fits a possible value for gmod_language!",
            type = "string",
            optional = false
        },
        {
            name = "key",
            description = "The name of the translated phrase.",
            type = "string",
            optional = false
        },
        {
            name = "translation",
            description = "The translation of the phrase.",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getPhrase = DarkRP.stub{
    name = "getPhrase",
    description = "Get a phrase from the selected language.",
    parameters = {
        {
            name = "key",
            description = "The name of the translated phrase.",
            type = "string",
            optional = false
        },
        {
            name = "Phrase parameters",
            description = "Some phrases need extra information, like in \"PLAYERNAME just won the lottery!\". Not filling in the phrase parameters will cause errors.",
            type = "vararg",
            optional = false
        }
    },
    returns = {
        {
            name = "phrase",
            description = "The formatted phrase.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.getMissingPhrases = DarkRP.stub{
    name = "getMissingPhrases",
    description = "Get all the phrases a language is missing.",
    parameters = {
        {
            name = "languageCode",
            description = "The language code of the language. For English this is \"en\".",
            type = "string",
            optional = true
        }
    },
    returns = {
        {
            name = "missingPhrases",
            description = "All the missing phrases formatted in such way that you can copy and paste it in your language file.",
            type = "string"
        }
    },
    metatable = DarkRP
}

DarkRP.addChatCommandsLanguage = DarkRP.stub{
    name = "addChatCommandsLanguage",
    description = "Add a translation table for chat command descriptions. See darkrpmod/lua/darkrp_language/chatcommands.lua for an example.",
    parameters = {
        {
            name = "languageCode",
            description = "The language code of the language. For English this is \"en\".",
            type = "string",
            optional = false
        },
        {
            name = "translations",
            description = "Key-value table with chat command strings as keys and their translation as value.",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getChatCommandDescription = DarkRP.stub{
    name = "getChatCommandDescription",
    description = "Get the translated description of a chat command.",
    parameters = {
        {
            name = "command",
            description = "The chat command string.",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "description",
            description = "The translated chat command description.",
            type = "string"
        }
    },
    metatable = DarkRP
}

--PATH gamemodes/mangarp/gamemode/libraries/disjointset.lua:
/*---------------------------------------------------------------------------
Disjoint-set forest implementation
Inspired by the book Introduction To Algorithms (third edition)

by FPtje Atheos

Running time per operation (Union/FindSet): O(a(n)) where a is the inverse of the Ackermann function.
---------------------------------------------------------------------------*/

local ipairs = ipairs
local setmetatable = setmetatable
local string = string
local table = table
local tostring = tostring

module("disjoint")

local metatable

-- Make a singleton set. Parent parameter is optional, must be a disjoint-set as well.
function MakeSet(x, parent)
    local set  = {}
    set.value  = x
    set.rank   = 0
    set.parent = parent or set

    setmetatable(set, metatable)

    return set
end

local function Link(x, y)
    if x == y then return x end

    -- Union by rank
    if x.rank > y.rank then
        y.parent = x
        return x
    end

    x.parent = y

    if x.rank == y.rank then
        y.rank = y.rank + 1
    end

    return y
end

-- Apply the union operation between two sets.
function Union(x, y)
    return Link(FindSet(x), FindSet(y))
end

function FindSet(x)
    local parent = x
    local listParents

    -- Go up the tree to find the parent
    while parent ~= parent.parent do
        parent = parent.parent

        listParents = listParents or {}
        table.insert(listParents, parent)
    end

    -- Path compression, update all parents to refer to the top parent
    if listParents then
        for _, v in ipairs(listParents) do
            v.parent = parent
        end
    end

    return parent
end

function Disconnect(x)
    x.parent = x

    return x
end


metatable = {
    __tostring = function(self)
        return string.format("Disjoint-Set [value: %s][Rank: %s][Parent: %s]", tostring(self.value), self.rank, tostring(self.parent.value))
    end,
    __metatable = true, -- restrict access to metatable
    __add = Union
}

--PATH gamemodes/mangarp/gamemode/modules/tipjar/cl_communication.lua:
local updateModel, getModelValue, onModelUpdate =
    DarkRP.tipJarUIModel.updateModel,
    DarkRP.tipJarUIModel.getModelValue,
    DarkRP.tipJarUIModel.onModelUpdate

onModelUpdate("lastTipAmount", function(amount)
    if amount <= 0 then return end

    local tipjar = getModelValue("tipjar")

    if not IsValid(tipjar) then return end

    net.Start("DarkRP_TipJarDonate")
        net.WriteEntity(tipjar)
        net.WriteUInt(amount, 32)
    net.SendToServer()
end)

net.Receive("DarkRP_TipJarUI", fc{DarkRP.tipJarUI, net.ReadEntity})

net.Receive("DarkRP_TipJarDonate", function()
    local tipjar = net.ReadEntity()
    local ply    = net.ReadEntity()
    local amount = net.ReadUInt(32)

    if not IsValid(tipjar) then return end
    if not IsValid(ply) then return end

    tipjar:Donated(ply, amount)
    updateModel("donatedUpdate")
end)

onModelUpdate("amount", function(amount, old)
    local tipjar = getModelValue("tipjar")

    if not IsValid(tipjar) then return end

    tipjar:UpdateActiveDonation(LocalPlayer(), amount)

    if amount == old then return end

    net.Start("DarkRP_TipJarUpdate")
        net.WriteEntity(tipjar)
        net.WriteUInt(amount, 32)
    net.SendToServer()
end)

net.Receive("DarkRP_TipJarUpdate", function(len)
    local tipjar = net.ReadEntity()

    if not IsValid(tipjar) then return end

    local bitsRead = 16

    while bitsRead < len do
        tipjar:UpdateActiveDonation(net.ReadEntity(), net.ReadUInt(32))

        -- I thought there was a function for this?
        bitsRead = bitsRead + 16 + 32
    end
end)

onModelUpdate("frameVisible", function(visible)
    local localply = LocalPlayer()
    local tipjar   = getModelValue("tipjar")
    local amount   = getModelValue("amount")

    if not IsValid(localply) then return end
    if not IsValid(tipjar) then return end

    if visible then
        tipjar:ClearActiveDonations()
        tipjar:UpdateActiveDonation(localply, amount)

        net.Start("DarkRP_TipJarUpdate")
            net.WriteEntity(tipjar)
            net.WriteUInt(amount, 32)
        net.SendToServer()

    else
        net.Start("DarkRP_TipJarExit")
            net.WriteEntity(tipjar)
        net.SendToServer()

        tipjar:ExitActiveDonation(localply)
    end
end)

net.Receive("DarkRP_TipJarExit", function()
    local tipjar = net.ReadEntity()
    local ply = net.ReadEntity()

    if not IsValid(tipjar) then return end
    if not IsValid(ply) then return end

    tipjar:ExitActiveDonation(ply)
end)

net.Receive("DarkRP_TipJarDonatedList", function()
    local tipjar = net.ReadEntity()
    local count = net.ReadUInt(8)

    if not IsValid(tipjar) then return end

    tipjar:ClearDonations()

    for i = 1, count do
        tipjar:AddDonation(net.ReadString(), net.ReadUInt(32))
    end

    updateModel("donatedUpdate")
end)


local function onUpdateActiveDonation(_, tipjar)
    if not IsValid(tipjar) or tipjar ~= getModelValue("tipjar") then return end

    updateModel("activeDonationUpdate")
end

DarkRP.hooks.tipjarUpdateActiveDonation = onUpdateActiveDonation
DarkRP.hooks.tipjarExitActiveDonation   = onUpdateActiveDonation
DarkRP.hooks.tipjarClearActiveDonation  = onUpdateActiveDonation

--PATH gamemodes/mangarp/gamemode/modules/fspectate/cl_init.lua:
FSpectate = {}

local stopSpectating, startFreeRoam
local isSpectating = false
local specEnt
local thirdperson = true
local isRoaming = false
local roamPos -- the position when roaming free
local roamVelocity = Vector(0)
local thirdPersonDistance = 100

/*---------------------------------------------------------------------------
Retrieve the current spectated player
---------------------------------------------------------------------------*/
function FSpectate.getSpecEnt()
    if isSpectating and not isRoaming then
        return IsValid(specEnt) and specEnt or nil
    else
        return nil
    end
end

/*---------------------------------------------------------------------------
startHooks
FAdmin tab buttons
---------------------------------------------------------------------------*/
hook.Add("Initialize", "FSpectate", function()
    surface.CreateFont("UiBold", {
        size = 16,
        weight = 800,
        antialias = true,
        shadow = false,
        font = "Verdana"})

    if not FAdmin then return end
    FAdmin.StartHooks["zzSpectate"] = function()
        FAdmin.Commands.AddCommand("Spectate", nil, "<Player>")

        -- Right click option
        FAdmin.ScoreBoard.Main.AddPlayerRightClick("Spectate", function(ply)
            if not IsValid(ply) then return end
            RunConsoleCommand("FSpectate", ply:UserID())
        end)

        local canSpectate = false
        local function calcAccess()
            CAMI.PlayerHasAccess(LocalPlayer(), "FSpectate", function(b, _)
                canSpectate = b
            end)
        end
        calcAccess()

        -- Spectate option in player menu
        FAdmin.ScoreBoard.Player:AddActionButton("Spectate", "fadmin/icons/spectate", Color(0, 200, 0, 255), function(ply) calcAccess() return canSpectate and ply ~= LocalPlayer() end, function(ply)
            if not IsValid(ply) then return end
            RunConsoleCommand("FSpectate", ply:UserID())
        end)
    end
end)

/*---------------------------------------------------------------------------
Get the thirdperson position
---------------------------------------------------------------------------*/
local function getThirdPersonPos(ent)
    local aimvector = LocalPlayer():GetAimVector()
    local startPos = ent:IsPlayer() and ent:GetShootPos() or ent:LocalToWorld(ent:OBBCenter())
    local endpos = startPos - aimvector * thirdPersonDistance

    local tracer = {
        start = startPos,
        endpos = endpos,
        filter = specEnt
    }

    local trace = util.TraceLine(tracer)

    return trace.HitPos + trace.HitNormal * 10
end

/*---------------------------------------------------------------------------
Get the CalcView table
---------------------------------------------------------------------------*/
local view = {}
local function getCalcView()
    if not isRoaming then
        if thirdperson then
            view.origin = getThirdPersonPos(specEnt)
            view.angles = LocalPlayer():EyeAngles()
        else
            view.origin = specEnt:IsPlayer() and specEnt:GetShootPos() or specEnt:LocalToWorld(specEnt:OBBCenter())
            view.angles = specEnt:IsPlayer() and specEnt:EyeAngles() or specEnt:GetAngles()
        end

        roamPos = view.origin
        view.drawviewer = false

        return view
    end

    view.origin = roamPos
    view.angles = LocalPlayer():EyeAngles()
    view.drawviewer = true

    return view
end

/*---------------------------------------------------------------------------
specCalcView
Override the view for the player to look through the spectated player's eyes
---------------------------------------------------------------------------*/
local function specCalcView(ply, origin, angles, fov)
    if not IsValid(specEnt) and not isRoaming then
        startFreeRoam()
        return
    end

    view = getCalcView()

    if IsValid(specEnt) then
        specEnt:SetNoDraw(not thirdperson)
    end

    return view
end

/*---------------------------------------------------------------------------
Find the right player to spectate
---------------------------------------------------------------------------*/
local function findNearestObject()
    local aimvec = LocalPlayer():GetAimVector()

    local fromPos = not isRoaming and IsValid(specEnt) and specEnt:EyePos() or roamPos

    local lookingAt = util.QuickTrace(fromPos, aimvec * 5000, LocalPlayer())
    local ent = lookingAt.Entity

    if IsValid(ent) then return ent end

    local foundPly, foundDot = nil, 0

    for _, ply in ipairs(player.GetAll()) do
        if not IsValid(ply) or ply == LocalPlayer() then continue end

        local pos = ply:GetShootPos()
        local dot = (pos - fromPos):GetNormalized():Dot(aimvec)

        -- Discard players you're not looking at
        if dot < 0.97 then continue end
        -- not a better alternative
        if dot < foundDot then continue end

        local trace = util.QuickTrace(fromPos, pos - fromPos, ply)

        if trace.Hit then continue end

        foundPly, foundDot = ply, dot
    end

    return foundPly
end

/*---------------------------------------------------------------------------
Spectate the person you're looking at while you're roaming
---------------------------------------------------------------------------*/
local function spectateLookingAt()
    local obj = findNearestObject()

    if not IsValid(obj) then return end

    isRoaming = false
    specEnt = obj

    net.Start("FSpectateTarget")
        net.WriteEntity(obj)
    net.SendToServer()
end

/*---------------------------------------------------------------------------
specBinds
Change binds to perform spectate specific tasks
---------------------------------------------------------------------------*/
-- Manual keysDown table, so I can return true in plyBindPress and still detect key presses
local keysDown = {}
local function specBinds(ply, bind, pressed)
    local key = input.LookupBinding(bind)

    if bind == "+jump" then
        stopSpectating()
        return true
    elseif bind == "+reload" and pressed then
        local pos = getCalcView().origin - Vector(0, 0, 64)
        RunConsoleCommand("FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z),
            string.format("%d, %d, %d", roamVelocity.x, roamVelocity.y, roamVelocity.z))
        stopSpectating()
    elseif bind == "+attack" and pressed then
        if not isRoaming then
            startFreeRoam()
        else
            spectateLookingAt()
        end
        return true
    elseif bind == "+attack2" and pressed then
        if isRoaming then
            roamPos = roamPos + LocalPlayer():GetAimVector() * 500
            return true
        end
        thirdperson = not thirdperson

        return true
    elseif isRoaming and not LocalPlayer():KeyDown(IN_USE) then
        local keybind = string.upper(string.match(bind, "+([a-z A-Z 0-9]+)") or "")
        if not keybind or keybind == "USE" or keybind == "SHOWSCORES" or string.find(bind, "messagemode") then return end

        keysDown[keybind] = pressed

        return true
    elseif not isRoaming and thirdperson and (key == "MWHEELDOWN" or key == "MWHEELUP") then
        thirdPersonDistance = thirdPersonDistance + 10 * (key == "MWHEELDOWN" and 1 or -1)
    end
    -- Do not return otherwise, spectating admins should be able to move to avoid getting detected
end

/*---------------------------------------------------------------------------
Scoreboardshow
Set to main view when roaming, open on a player when spectating
---------------------------------------------------------------------------*/
local function fadminmenushow()
    if isRoaming then
        FAdmin.ScoreBoard.ChangeView("Main")
    elseif IsValid(specEnt) and specEnt:IsPlayer() then
        FAdmin.ScoreBoard.ChangeView("Main")
        FAdmin.ScoreBoard.ChangeView("Player", specEnt)
    end
end


/*---------------------------------------------------------------------------
RenderScreenspaceEffects
Draws the lines from players' eyes to where they are looking
---------------------------------------------------------------------------*/
local LineMat = Material("cable/new_cable_lit")
local linesToDraw = {}
local function lookingLines()
    if not linesToDraw[0] then return end

    render.SetMaterial(LineMat)

    cam.Start3D(view.origin, view.angles)
        for i = 0, #linesToDraw, 3 do
            render.DrawBeam(linesToDraw[i], linesToDraw[i + 1], 4, 0.01, 10, linesToDraw[i + 2])
        end
    cam.End3D()
end

/*---------------------------------------------------------------------------
gunpos
Gets the position of a player's gun
---------------------------------------------------------------------------*/
local function gunpos(ply)
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return ply:EyePos() end
    local att = wep:GetAttachment(1)
    if not att then return ply:EyePos() end
    return att.Pos
end

/*---------------------------------------------------------------------------
Spectate think
Free roaming position updates
---------------------------------------------------------------------------*/
local function specThink()
    local ply = LocalPlayer()

    -- Update linesToDraw
    local pls = player.GetAll()
    local lastPly = 0
    local skip = 0
    for i = 0, #pls - 1 do
        local p = pls[i + 1]
        if not IsValid(p) then continue end
        if not isRoaming and p == specEnt and not thirdperson then skip = skip + 3 continue end

        local tr = p:GetEyeTrace()
        local sp = gunpos(p)

        local pos = i * 3 - skip

        linesToDraw[pos] = tr.HitPos
        linesToDraw[pos + 1] = sp
        linesToDraw[pos + 2] = team.GetColor(p:Team())
        lastPly = i
    end

    -- Remove entries from linesToDraw that don't match with a player anymore
    for i = #linesToDraw, lastPly * 3 + 3, -1 do linesToDraw[i] = nil end

    if not isRoaming or keysDown["USE"] then return end

    local roamSpeed = 1000
    local aimVec = ply:GetAimVector()
    local direction
    local frametime = RealFrameTime()

    if keysDown["FORWARD"] then
        direction = aimVec
    elseif keysDown["BACK"] then
        direction = -aimVec
    end

    if keysDown["MOVELEFT"] then
        local right = aimVec:Angle():Right()
        direction = direction and (direction - right):GetNormalized() or -right
    elseif keysDown["MOVERIGHT"] then
        local right = aimVec:Angle():Right()
        direction = direction and (direction + right):GetNormalized() or right
    end

    if keysDown["SPEED"] then
        roamSpeed = 2500
    elseif keysDown["WALK"] or keysDown["DUCK"] then
        roamSpeed = 300
    end

    roamVelocity = (direction or Vector(0, 0, 0)) * roamSpeed

    roamPos = roamPos + roamVelocity * frametime
end

/*---------------------------------------------------------------------------
Draw help on the screen
---------------------------------------------------------------------------*/
local uiForeground, uiBackground = Color(240, 240, 255, 255), Color(20, 20, 20, 120)
local red = Color(255, 0, 0, 255)
local function drawHelp()
    local scrHalfH = math.floor(ScrH() / 2)
    draw.WordBox(2, 10, scrHalfH, "Left click: (Un)select player to spectate", "UiBold", uiBackground, uiForeground)
    draw.WordBox(2, 10, scrHalfH + 20, isRoaming and "Right click: quickly move forwards" or "Right click: toggle thirdperson", "UiBold", uiBackground, uiForeground)
    draw.WordBox(2, 10, scrHalfH + 40, "Jump: Stop spectating", "UiBold", uiBackground, uiForeground)
    draw.WordBox(2, 10, scrHalfH + 60, "Reload: Stop spectating and teleport", "UiBold", uiBackground, uiForeground)

    if FAdmin then
        draw.WordBox(2, 10, scrHalfH + 80, "Opening FAdmin's menu while spectating a player", "UiBold", uiBackground, uiForeground)
        draw.WordBox(2, 10, scrHalfH + 100, "\twill open their page!", "UiBold", uiBackground, uiForeground)
    end


    local target = findNearestObject()
    local pls = player.GetAll()
    for i = 1, #pls do
        local ply = pls[i]
        if not IsValid(ply) then continue end
        if not isRoaming and ply == specEnt then continue end

        local pos = ply:GetShootPos():ToScreen()
        if not pos.visible then continue end

        local x, y = pos.x, pos.y

        draw.RoundedBox(2, x, y - 6, 12, 12, team.GetColor(ply:Team()))
        draw.WordBox(2, x, y - 66, ply:Nick(), "UiBold", uiBackground, uiForeground)
        draw.WordBox(2, x, y - 46, "Health: " .. ply:Health(), "UiBold", uiBackground, uiForeground)
        draw.WordBox(2, x, y - 26, ply:GetUserGroup(), "UiBold", uiBackground, uiForeground)
    end

    if not isRoaming then return end

    if not IsValid(target) then return end

    local center = target:LocalToWorld(target:OBBCenter())
    local eyeAng = EyeAngles()
    local rightUp = eyeAng:Right() * 16 + eyeAng:Up() * 36
    local topRight = (center + rightUp):ToScreen()
    local bottomLeft = (center - rightUp):ToScreen()

    draw.RoundedBox(12, bottomLeft.x, bottomLeft.y, math.max(20, topRight.x - bottomLeft.x), topRight.y - bottomLeft.y, red)
    draw.WordBox(2, bottomLeft.x, bottomLeft.y + 12, "Left click to spectate!", "UiBold", uiBackground, uiForeground)
end

/*---------------------------------------------------------------------------
Start roaming free, rather than spectating a given player
---------------------------------------------------------------------------*/
startFreeRoam = function()
    roamPos = isSpectating and roamPos or LocalPlayer():GetShootPos()

    if IsValid(specEnt) then
        if specEnt:IsPlayer() then
            roamPos = thirdperson and getThirdPersonPos(specEnt) or specEnt:GetShootPos()
        end
        specEnt:SetNoDraw(false)
    end

    specEnt = nil
    isRoaming = true
    keysDown = {}
end

/*---------------------------------------------------------------------------
specEnt
Spectate a player
---------------------------------------------------------------------------*/
local function startSpectate(um)
    isRoaming = net.ReadBool()
    specEnt = net.ReadEntity()
    specEnt = IsValid(specEnt) and specEnt or nil

    if isRoaming then
        startFreeRoam()
    end

    isSpectating = true
    keysDown = {}

    hook.Add("CalcView", "FSpectate", specCalcView)
    hook.Add("PlayerBindPress", "FSpectate", specBinds)
    hook.Add("ShouldDrawLocalPlayer", "FSpectate", function() return isRoaming or thirdperson end)
    hook.Add("Think", "FSpectate", specThink)
    hook.Add("HUDPaint", "FSpectate", drawHelp)
    hook.Add("FAdmin_ShowFAdminMenu", "FSpectate", fadminmenushow)
    hook.Add("RenderScreenspaceEffects", "FSpectate", lookingLines)

    timer.Create("FSpectatePosUpdate", 0.5, 0, function()
        if not isRoaming then return end

        RunConsoleCommand("_FSpectatePosUpdate", roamPos.x, roamPos.y, roamPos.z)
    end)
end
net.Receive("FSpectate", startSpectate)

/*---------------------------------------------------------------------------
stopSpectating
Stop spectating a player
---------------------------------------------------------------------------*/
stopSpectating = function()
    hook.Remove("CalcView", "FSpectate")
    hook.Remove("PlayerBindPress", "FSpectate")
    hook.Remove("ShouldDrawLocalPlayer", "FSpectate")
    hook.Remove("Think", "FSpectate")
    hook.Remove("HUDPaint", "FSpectate")
    hook.Remove("FAdmin_ShowFAdminMenu", "FSpectate")
    hook.Remove("RenderScreenspaceEffects", "FSpectate")

    timer.Remove("FSpectatePosUpdate")

    if IsValid(specEnt) then
        specEnt:SetNoDraw(false)
    end

    RunConsoleCommand("FSpectate_StopSpectating")
    isSpectating = false
end

--PATH gamemodes/mangarp/gamemode/modules/fpp/pp/client/ownability.lua:
FPP = FPP or {}

FPP.entOwners       = FPP.entOwners or {}
FPP.entTouchability = FPP.entTouchability or {}
FPP.entTouchReasons = FPP.entTouchReasons or {}

local touchTypes = {
    Physgun = 1,
    Gravgun = 2,
    Toolgun = 4,
    PlayerUse = 8,
    EntityDamage = 16
}

local reasonSize = 4 -- bits
local reasons = {
    [1] = "owner", -- you can't touch other people's props
    [2] = "world",
    [3] = "disconnected",
    [4] = "blocked",
    [5] = "constrained",
    [6] = "buddy",
    [7] = "shared",
    [8] = "player", -- you can't pick up players
}

local function receiveTouchData(len)
    repeat
        local entIndex = net.ReadUInt(32)
        local ownerIndex = net.ReadUInt(32)
        local touchability = net.ReadUInt(5)
        local reason = net.ReadUInt(20)

        FPP.entOwners[entIndex] = ownerIndex
        FPP.entTouchability[entIndex] = touchability
        FPP.entTouchReasons[entIndex] = reason
    until net.ReadBit() == 1
end
net.Receive("FPP_TouchabilityData", receiveTouchData)

function FPP.entGetOwner(ent)
    local idx = FPP.entOwners[ent:EntIndex()]
    ent.FPPOwner = idx and Entity(idx) or nil

    return ent.FPPOwner
end

function FPP.canTouchEnt(ent, touchType)
    ent.FPPCanTouch = FPP.entTouchability[ent:EntIndex()]
    if not touchType or not ent.FPPCanTouch then
        return ent.FPPCanTouch
    end

    return bit.bor(ent.FPPCanTouch, touchTypes[touchType]) == ent.FPPCanTouch
end

local touchTypeMultiplier = {
    ["Physgun"] = 0,
    ["Gravgun"] = 1,
    ["Toolgun"] = 2,
    ["PlayerUse"] = 3,
    ["EntityDamage"] = 4
}

function FPP.entGetTouchReason(ent, touchType)
    local idx = FPP.entTouchReasons[ent:EntIndex()] or 0
    ent.FPPCanTouchWhy = idx

    if not touchType then return idx end

    local maxReasonValue = 15
    -- 1111 shifted to the right touch type
    local touchTypeMask = bit.lshift(maxReasonValue, reasonSize * touchTypeMultiplier[touchType])
    -- Extract reason for touch type from reason number
    local touchTypeReason = bit.band(idx, touchTypeMask)
    -- Shift it back to the right
    local reasonNr = bit.rshift(touchTypeReason, reasonSize * touchTypeMultiplier[touchType])

    local reason = reasons[reasonNr]
    local owner = ent:CPPIGetOwner()

    if reasonNr == 1 then -- convert owner to the actual player
        return not isnumber(owner) and IsValid(owner) and owner:Nick() or "Unknown player"
    elseif reasonNr == 6 then
        return "Buddy (" .. (IsValid(owner) and owner:Nick() or "Unknown player") .. ")"
    end

    return reason
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/motd/sh_shared.lua:
local MOTDPage = CreateConVar("_FAdmin_MOTDPage", "default", {FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE})

if CLIENT then -- I can't be bothered to make a cl_init when there's a shared file with just one line in it.
    FAdmin.StartHooks["MOTD"] = function()
        FAdmin.ScoreBoard.Server:AddServerAction("Place MOTD", "fadmin/icons/motd", Color(155, 0, 0, 255), function(ply) return ply:IsSuperAdmin() end, function()
            RunConsoleCommand("_FAdmin", "CreateMOTD")
        end)

        FAdmin.ScoreBoard.Server:AddServerSetting("Set MOTD page", "fadmin/icons/motd", Color(0, 0, 155, 255), function(ply) return ply:IsSuperAdmin() end, function()
            local Window = vgui.Create("DFrame")
            Window:SetTitle("Set MOTD page")
            Window:SetDraggable(false)
            Window:ShowCloseButton(false)
            Window:SetBackgroundBlur(true)
            Window:SetDrawOnTop(true)

            local InnerPanel = vgui.Create("DPanel", Window)
            InnerPanel:SetPaintBackground(false) -- clear background

            local Text = vgui.Create("DLabel", InnerPanel)
            Text:SetText("Set the MOTD page. Click default to reset the MOTD to default.")
            Text:SizeToContents()
            Text:SetContentAlignment(5)
            Text:SetTextColor(color_white)

            local TextEntry = vgui.Create("DTextEntry", InnerPanel)
            TextEntry:SetText(MOTDPage:GetString())
            TextEntry.OnEnter = function() Window:Close() RunConsoleCommand("_FAdmin", "motdpage", TextEntry:GetValue()) end
            function TextEntry:OnFocusChanged(changed)
                self:RequestFocus()
                self:SelectAllText(true)
            end

            local ButtonPanel = vgui.Create("DPanel", Window)
            ButtonPanel:SetPaintBackground(false) -- clear background
            ButtonPanel:SetTall(30)

            local Button = vgui.Create("DButton", ButtonPanel)
            Button:SetText("OK")
            Button:SizeToContents()
            Button:SetTall(20)
            Button:SetWide(Button:GetWide() + 20)
            Button:SetPos(5, 5)

            Button.DoClick = function()
                Window:Close()
                RunConsoleCommand("_FAdmin", "motdpage", TextEntry:GetValue())
            end

            local ButtonDefault = vgui.Create("DButton", ButtonPanel)
                ButtonDefault:SetText("Default")
                ButtonDefault:SizeToContents()
                ButtonDefault:SetTall(20)
                ButtonDefault:SetWide(Button:GetWide() + 20)
                ButtonDefault:SetPos(5, 5)
                ButtonDefault.DoClick = function() Window:Close() RunConsoleCommand("_FAdmin", "motdpage", "default") end
                ButtonDefault:MoveRightOf(Button, 5)

            local ButtonCancel = vgui.Create("DButton", ButtonPanel)
                ButtonCancel:SetText("Cancel")
                ButtonCancel:SizeToContents()
                ButtonCancel:SetTall(20)
                ButtonCancel:SetWide(Button:GetWide() + 20)
                ButtonCancel:SetPos(5, 5)
                ButtonCancel.DoClick = function() Window:Close() end
                ButtonCancel:MoveRightOf(ButtonDefault, 5)

            ButtonPanel:SetWide(Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 + ButtonDefault:GetWide() + 5)

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
    end
end

--PATH gamemodes/mangarp/gamemode/modules/fadmin/fadmin/access/sh_shared.lua:
CreateConVar("_FAdmin_immunity", 1, {FCVAR_GAMEDLL, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE})

FAdmin.Access = FAdmin.Access or {}
FAdmin.Access.ADMIN = {"user", "admin", "superadmin"}
FAdmin.Access.ADMIN[0] = "user"

FAdmin.Access.Groups = FAdmin.Access.Groups or {}
FAdmin.Access.Privileges = FAdmin.Access.Privileges or {}

function FAdmin.Access.AddGroup(name, admin_access --[[0 = not admin, 1 = admin, 2 = superadmin]], privs, immunity, fromCAMI, CAMIsrc)
    FAdmin.Access.Groups[name] = FAdmin.Access.Groups[name] or {ADMIN = admin_access, PRIVS = privs or {}, immunity = immunity}

    --Make sure things that come from CAMI come with a CAMIsrc
    assert((fromCAMI and CAMIsrc ~= nil) or ((not fromCAMI) and CAMIsrc == nil))
    --If the CAMIsrc is a string, save it, otherwise save an empty string
    if not isstring(CAMIsrc) then
        CAMIsrc = ""
    end

    -- Register custom usergroups with CAMI
    if name ~= "user" and name ~= "admin" and name ~= "superadmin" and not fromCAMI then
        CAMI.RegisterUsergroup({
            Name = name,
            Inherits = FAdmin.Access.ADMIN[admin_access]
        }, "FAdmin")
    end

    -- Add newly created privileges on server reload
    for p, _ in pairs(privs or {}) do
        FAdmin.Access.Groups[name].PRIVS[p] = true
    end

    if not SERVER then return end

    MySQLite.queryValue("SELECT COUNT(*) FROM FADMIN_GROUPS WHERE NAME = " .. MySQLite.SQLStr(name) .. ";", function(val)
        if tonumber(val or 0) > 0 then return end

        MySQLite.query("REPLACE INTO FADMIN_GROUPS VALUES(" .. MySQLite.SQLStr(name) .. ", " .. tonumber(admin_access) .. ");", function()
            for priv, _ in pairs(privs or {}) do
                MySQLite.query("REPLACE INTO FADMIN_PRIVILEGES VALUES(" .. MySQLite.SQLStr(name) .. ", " .. MySQLite.SQLStr(priv) .. ");")
            end
            if fromCAMI then
                MySQLite.query("REPLACE INTO FADMIN_GROUPS_SRC VALUES(" .. MySQLite.SQLStr(name) .. ", " .. MySQLite.SQLStr(CAMIsrc) .. ");")
            end
        end)
    end)

    if immunity then
        MySQLite.query("REPLACE INTO FAdmin_Immunity VALUES(" .. MySQLite.SQLStr(name) .. ", " .. tonumber(immunity) .. ");")
    end

    if FAdmin.Access.SendGroups and privs then
        for _, v in ipairs(player.GetAll()) do
            FAdmin.Access.SendGroups(v)
        end
    end
end

function FAdmin.Access.OnUsergroupRegistered(usergroup, source)
    -- Don't re-add usergroups coming from FAdmin itself
    if source == "FAdmin" then return end

    local inheritRoot = CAMI.InheritanceRoot(usergroup.Inherits)
    local admin_access = table.KeyFromValue(FAdmin.Access.ADMIN, inheritRoot) or 1

    -- Add groups registered to CAMI to FAdmin. Assume privileges from either the usergroup it inherits or its inheritance root.
    -- Immunity is unknown and can be set by the user later. FAdmin immunity only applies to FAdmin anyway.
    local parent = FAdmin.Access.Groups[usergroup.Inherits] or FAdmin.Access.Groups[inheritRoot] or {}
    FAdmin.Access.AddGroup(usergroup.Name, admin_access - 1, table.Copy(parent.PRIVS) or {}, parent.immunity or 10, true, source)
end


function FAdmin.Access.OnUsergroupUnregistered(usergroup, source)
    if table.HasValue({"superadmin", "admin", "user", "noaccess"}, usergroup.Name) then return end

    FAdmin.Access.Groups[usergroup.Name] = nil

    if not SERVER then return end

    MySQLite.query("DELETE FROM FADMIN_GROUPS WHERE NAME = " .. MySQLite.SQLStr(usergroup.Name) .. ";")

    for _, v in ipairs(player.GetAll()) do
        FAdmin.Access.SendGroups(v)
    end
end

function FAdmin.Access.RemoveGroup(ply, cmd, args)
    if not FAdmin.Access.PlayerHasPrivilege(ply, "ManageGroups") then FAdmin.Messages.SendMessage(ply, 5, "No access!") return false end
    if not args[1] then return false end

    local plyGroup = FAdmin.Access.Groups[ply:EntIndex() == 0 and "superadmin" or ply:GetUserGroup()]

    if not FAdmin.Access.Groups[args[1]] or table.HasValue({"superadmin", "admin", "user"}, string.lower(args[1])) then return true, args[1] end

    -- Setting a group with a higher rank than one's own
    if (not plyGroup or FAdmin.Access.Groups[args[1]].immunity > plyGroup.immunity) and not FAdmin.Access.PlayerIsHost(ply) then
        FAdmin.Messages.SendMessage(ply, 5, "You're not allowed to remove usergroups with a higher rank than your own")
        return false
    end

    CAMI.UnregisterUsergroup(args[1], "FAdmin")

    FAdmin.Messages.SendMessage(ply, 4, "Group succesfully removed")
end

local PLAYER = FindMetaTable("Player")

local oldplyIsAdmin = PLAYER.IsAdmin
function PLAYER:IsAdmin(...)
    local usergroup = self:GetUserGroup()

    if not FAdmin or not FAdmin.Access or not FAdmin.Access.Groups or not FAdmin.Access.Groups[usergroup] then return oldplyIsAdmin(self, ...) or game.SinglePlayer() end

    if (FAdmin.Access.Groups[usergroup] and FAdmin.Access.Groups[usergroup].ADMIN >= 1 --[[1 = admin]]) or (self.IsListenServerHost and self:IsListenServerHost()) then
        return true
    end

    if CLIENT and tonumber(self:FAdmin_GetGlobal("FAdmin_admin")) and self:FAdmin_GetGlobal("FAdmin_admin") >= 1 then return true end

    return oldplyIsAdmin(self, ...) or game.SinglePlayer()
end

local oldplyIsSuperAdmin = PLAYER.IsSuperAdmin
function PLAYER:IsSuperAdmin(...)
    local usergroup = self:GetUserGroup()
    if not FAdmin or not FAdmin.Access or not FAdmin.Access.Groups or not FAdmin.Access.Groups[usergroup] then return oldplyIsSuperAdmin(self, ...) or game.SinglePlayer() end
    if (FAdmin.Access.Groups[usergroup] and FAdmin.Access.Groups[usergroup].ADMIN >= 2 --[[2 = superadmin]]) or (self.IsListenServerHost and self:IsListenServerHost()) then
        return true
    end
    if CLIENT and tonumber(self:FAdmin_GetGlobal("FAdmin_admin")) and self:FAdmin_GetGlobal("FAdmin_admin") >= 2 then return true end
    return oldplyIsSuperAdmin(self, ...) or game.SinglePlayer()
end

--Privileges
function FAdmin.Access.AddPrivilege(Name, admin_access)
    FAdmin.Access.Privileges[Name] = admin_access
end

hook.Add("CAMI.OnPrivilegeRegistered", "FAdmin", function(privilege)
    FAdmin.Access.AddPrivilege(privilege.Name, table.KeyFromValue(FAdmin.Access.ADMIN, CAMI.InheritanceRoot(privilege.MinAccess)) or 3)

    -- Register privilege and add to respective usergroups
    if SERVER then FAdmin.Access.RegisterCAMIPrivilege(privilege) end
end)

for _, camipriv in pairs(CAMI.GetPrivileges()) do
    FAdmin.Access.AddPrivilege(camipriv.Name, table.KeyFromValue(FAdmin.Access.ADMIN, CAMI.InheritanceRoot(camipriv.MinAccess)) or 3)
    -- Register if the database has already loaded
    if SERVER and FAdmin.Access.RegisterCAMIPrivilege then FAdmin.Access.RegisterCAMIPrivilege(camipriv) end
end

hook.Add("CAMI.OnPrivilegeUnregistered", "FAdmin", function(privilege)
    FAdmin.Access.Privileges[privilege.Name] = nil
end)

function FAdmin.Access.PlayerIsHost(ply)
    return ply:EntIndex() == 0 or game.SinglePlayer() or (ply.IsListenServerHost and ply:IsListenServerHost())
end

function FAdmin.Access.PlayerHasPrivilege(ply, priv, target, ignoreImmunity)
    -- This is the server console
    if FAdmin.Access.PlayerIsHost(ply) then return true end
    -- Privilege does not exist
    if not FAdmin.Access.Privileges[priv] then return ply:IsAdmin() end

    local Usergroup = ply:GetUserGroup()

    local canTarget = hook.Call("FAdmin_CanTarget", nil, ply, priv, target)
    if canTarget ~= nil then
        return canTarget
    end

    if FAdmin.GlobalSetting.Immunity and
        not ignoreImmunity and
        not isstring(target) and IsValid(target) and target ~= ply and
        FAdmin.Access.Groups[Usergroup] and FAdmin.Access.Groups[target:GetUserGroup()] and
        FAdmin.Access.Groups[Usergroup].immunity and FAdmin.Access.Groups[target:GetUserGroup()].immunity and
        FAdmin.Access.Groups[target:GetUserGroup()].immunity >= FAdmin.Access.Groups[Usergroup].immunity then
        return false
    end

    -- Defer answer when usergroup is unknown
    if not FAdmin.Access.Groups[Usergroup] then return end

    if FAdmin.Access.Groups[Usergroup].PRIVS[priv] then
        return true
    end

    if CLIENT and ply.FADMIN_PRIVS and ply.FADMIN_PRIVS[priv] then return true end

    return false
end

hook.Add("CAMI.PlayerHasAccess", "FAdmin", function(actor, privilegeName, callback, target, extraInfo)
    -- FAdmin doesn't know. Defer answer.
    if not FAdmin.Access.Privileges[privilegeName] then return end

    local res = FAdmin.Access.PlayerHasPrivilege(actor, privilegeName, target, extraInfo and extraInfo.IgnoreImmunity)

    -- Defer again
    if res == nil then return end

    -- Publish the answer
    callback(res, "FAdmin")

    -- FAdmin knows the answer. Prevent other hooks from running.
    return true
end)

hook.Add("CAMI.SteamIDHasAccess", "FAdmin", function(actorSteam, privilegeName, callback, targetSteam, extraInfo)
    -- The client just doesn't know
    if CLIENT then return end

    if not targetSteam or extraInfo and extraInfo.IgnoreImmunity then
        MySQLite.query(string.format(
            [[SELECT COUNT(*) AS c
            FROM FAdmin_PlayerGroup l
            JOIN FADMIN_PRIVILEGES r ON l.groupname = r.NAME
            WHERE l.steamid = %s AND r.PRIVILEGE = %s]],
            MySQLite.SQLStr(actorSteam),
            MySQLite.SQLStr(privilegeName)
        ), function(res) callback(tonumber(res[1].c) > 0) end)

        return true
    end

    MySQLite.query(string.format(
        [[SELECT ll.i AND rr.c AS res
        FROM (SELECT li.immunity >= ri.immunity AS i
              FROM FAdmin_PlayerGroup lg
              JOIN FAdmin_Immunity li ON lg.groupname = li.groupname
              JOIN FAdmin_PlayerGroup rg
              JOIN FAdmin_Immunity ri ON rg.groupname = ri.groupname
              WHERE lg.steamid = %s AND rg.steamid = %s) AS ll
        JOIN (SELECT COUNT(*) AS c
            FROM FAdmin_PlayerGroup l
            JOIN FADMIN_PRIVILEGES r ON l.groupname = r.NAME
            WHERE l.steamid = %s AND r.PRIVILEGE = %s) AS rr]],
        MySQLite.SQLStr(actorSteam),
        MySQLite.SQLStr(targetSteam),
        MySQLite.SQLStr(actorSteam),
        MySQLite.SQLStr(privilegeName)
    ), function(res) callback(res and res[1] and tobool(res[1].res) or false) end)

    return true
end)

FAdmin.StartHooks["AccessFunctions"] = function()
    FAdmin.Messages.RegisterNotification{
        name = "setaccess",
        hasTarget = true,
        message = {"instigator", " set the usergroup of ", "targets", " to ", "extraInfo.1"},
        receivers = "everyone",
        writeExtraInfo = function(i) net.WriteString(i[1]) end,
        readExtraInfo = function() return {net.ReadString()} end,
        extraInfoColors = {Color(255, 102, 0)}
    }

    FAdmin.Access.AddPrivilege("SetAccess", 3) -- AddPrivilege is shared, run on both client and server
    FAdmin.Access.AddPrivilege("ManagePrivileges", 3)
    FAdmin.Access.AddPrivilege("ManageGroups", 3)
    FAdmin.Access.AddPrivilege("SeeAdmins", 1)
    FAdmin.Commands.AddCommand("RemoveGroup", FAdmin.Access.RemoveGroup)

    FAdmin.Commands.AddCommand("Admins", function(ply)
        if not FAdmin.Access.PlayerHasPrivilege(ply, "SeeAdmins") then return false end
        for _, v in ipairs(player.GetAll()) do
            ply:PrintMessage(HUD_PRINTCONSOLE, v:Nick() .. "\t|\t" .. v:GetUserGroup())
        end
        return true
    end
    )
end

--PATH gamemodes/mangarp/gamemode/modules/base/sh_entityvars.lua:
local maxId = 0
local DarkRPVars = {}
local DarkRPVarById = {}

-- the amount of bits assigned to the value that determines which DarkRPVar we're sending/receiving
local DARKRP_ID_BITS = 8
local UNKNOWN_DARKRPVAR = 255 -- Should be equal to 2^DARKRP_ID_BITS - 1
DarkRP.DARKRP_ID_BITS = DARKRP_ID_BITS

function DarkRP.registerDarkRPVar(name, writeFn, readFn)
    maxId = maxId + 1

    -- UNKNOWN_DARKRPVAR is reserved for unknown values
    if maxId >= UNKNOWN_DARKRPVAR then DarkRP.error(string.format("Too many DarkRPVar registrations! DarkRPVar '%s' triggered this error", name), 2) end

    DarkRPVars[name] = {id = maxId, name = name, writeFn = writeFn, readFn = readFn}
    DarkRPVarById[maxId] = DarkRPVars[name]
end

-- Unknown values have unknown types and unknown identifiers, so this is sent inefficiently
local function writeUnknown(name, value)
    net.WriteUInt(UNKNOWN_DARKRPVAR, 8)
    net.WriteString(name)
    net.WriteType(value)
end

-- Read the value of a DarkRPVar that was not registered
local function readUnknown()
    return net.ReadString(), net.ReadType(net.ReadUInt(8))
end

local warningsShown = {}
local function warnRegistration(name)
    if warningsShown[name] then return end
    warningsShown[name] = true

    DarkRP.errorNoHalt(string.format([[Warning! DarkRPVar '%s' wasn't registered!
        Please contact the author of the DarkRP Addon to fix this.
        Until this is fixed you don't need to worry about anything. Everything will keep working.
        It's just that registering DarkRPVars would make DarkRP faster.]], name), 4)
end

function DarkRP.writeNetDarkRPVar(name, value)
    local DarkRPVar = DarkRPVars[name]
    if not DarkRPVar then
        warnRegistration(name)

        return writeUnknown(name, value)
    end

    net.WriteUInt(DarkRPVar.id, DARKRP_ID_BITS)
    return DarkRPVar.writeFn(value)
end

function DarkRP.writeNetDarkRPVarRemoval(name)
    local DarkRPVar = DarkRPVars[name]
    if not DarkRPVar then
        warnRegistration(name)

        net.WriteUInt(UNKNOWN_DARKRPVAR, 8)
        net.WriteString(name)
        return
    end

    net.WriteUInt(DarkRPVar.id, DARKRP_ID_BITS)
end

function DarkRP.readNetDarkRPVar()
    local DarkRPVarId = net.ReadUInt(DARKRP_ID_BITS)
    local DarkRPVar = DarkRPVarById[DarkRPVarId]

    if DarkRPVarId == UNKNOWN_DARKRPVAR then
        local name, value = readUnknown()

        return name, value
    end

    local val = DarkRPVar.readFn(value)

    return DarkRPVar.name, val
end

function DarkRP.readNetDarkRPVarRemoval()
    local id = net.ReadUInt(DARKRP_ID_BITS)
    return id == 255 and net.ReadString() or DarkRPVarById[id].name
end

-- The money is a double because it accepts higher values than Int and UInt, which are undefined for >32 bits
DarkRP.registerDarkRPVar("money",         net.WriteDouble, net.ReadDouble)
DarkRP.registerDarkRPVar("salary",        fp{fn.Flip(net.WriteInt), 32}, fp{net.ReadInt, 32})
DarkRP.registerDarkRPVar("rpname",        net.WriteString, net.ReadString)
DarkRP.registerDarkRPVar("job",           net.WriteString, net.ReadString)
DarkRP.registerDarkRPVar("HasGunlicense", net.WriteBit, fc{tobool, net.ReadBit})
DarkRP.registerDarkRPVar("Arrested",      net.WriteBit, fc{tobool, net.ReadBit})
DarkRP.registerDarkRPVar("wanted",        net.WriteBit, fc{tobool, net.ReadBit})
DarkRP.registerDarkRPVar("wantedReason",  net.WriteString, net.ReadString)
DarkRP.registerDarkRPVar("agenda",        net.WriteString, net.ReadString)

--[[---------------------------------------------------------------------------
RP name override
---------------------------------------------------------------------------]]
local pmeta = FindMetaTable("Player")
pmeta.SteamName = pmeta.SteamName or pmeta.Name
function pmeta:Name()
    if not self:IsValid() then DarkRP.error("Attempt to call Name/Nick/GetName on a non-existing player!", SERVER and 1 or 2) end
    return GAMEMODE.Config.allowrpnames and self:getDarkRPVar("rpname")
        or self:SteamName()
end
pmeta.GetName = pmeta.Name
pmeta.Nick = pmeta.Name

--PATH gamemodes/mangarp/gamemode/modules/base/sh_createitems.lua:
local plyMeta = FindMetaTable("Player")

-----------------------------------------------------------
-- Job commands --
-----------------------------------------------------------
local function declareTeamCommands(CTeam)
    local k = 0
    for num, v in pairs(RPExtraTeams) do
        if v.command == CTeam.command then
            k = num
        end
    end

    local chatcommandCondition = function(ply)
        local plyTeam = ply:Team()

        if plyTeam == k then return false end
        if CTeam.admin == 1 and not ply:IsAdmin() or CTeam.admin == 2 and not ply:IsSuperAdmin() then return false end
        if isnumber(CTeam.NeedToChangeFrom) and plyTeam ~= CTeam.NeedToChangeFrom then return false end
        if istable(CTeam.NeedToChangeFrom) and not table.HasValue(CTeam.NeedToChangeFrom, plyTeam) then return false end
        if CTeam.customCheck and CTeam.customCheck(ply) == false then return false end
        if ply:isArrested() then return false end
        local numPlayers = team.NumPlayers(k)
        if CTeam.max ~= 0 and ((CTeam.max % 1 == 0 and numPlayers >= CTeam.max) or (CTeam.max % 1 ~= 0 and (numPlayers + 1) / player.GetCount() > CTeam.max)) then return false end
        if ply.LastJob and 10 - (CurTime() - ply.LastJob) >= 0 then return false end
        if ply.LastVoteCop and CurTime() - ply.LastVoteCop < 80 then return false end

        return true
    end

    if CTeam.vote or CTeam.RequiresVote then
        DarkRP.declareChatCommand{
            command = "vote" .. CTeam.command,
            description = "Vote to become " .. CTeam.name .. ".",
            delay = 1.5,
            condition =
                function(ply)
                    if CTeam.RequiresVote and not CTeam.RequiresVote(ply, k) then return false end
                    if CTeam.canStartVote and not CTeam.canStartVote(ply) then return false end

                    return chatcommandCondition(ply)
                end
        }

        DarkRP.declareChatCommand{
            command = CTeam.command,
            description = "Become " .. CTeam.name .. " and skip the vote.",
            delay = 1.5,
            condition =
                function(ply)
                    local requiresVote = CTeam.RequiresVote and CTeam.RequiresVote(ply, k)

                    if requiresVote then return false end
                    if requiresVote ~= false and CTeam.admin == 0 and not ply:IsAdmin() or CTeam.admin == 1 and not ply:IsSuperAdmin() then return false end
                    if CTeam.canStartVote and not CTeam.canStartVote(ply) then return false end

                    return chatcommandCondition(ply)
                end
        }
    else
        DarkRP.declareChatCommand{
            command = CTeam.command,
            description = "Become " .. CTeam.name .. ".",
            delay = 1.5,
            condition = chatcommandCondition
        }
    end
end

local function addTeamCommands(CTeam, max)
    if CLIENT then return end

    local k = 0
    for num, v in pairs(RPExtraTeams) do
        if v.command == CTeam.command then
            k = num
        end
    end

    if CTeam.vote or CTeam.RequiresVote then
        DarkRP.defineChatCommand("vote" .. CTeam.command, function(ply)
            if CTeam.RequiresVote and not CTeam.RequiresVote(ply, k) then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("job_doesnt_require_vote_currently"))

                return ""
            end

            if CTeam.canStartVote and not CTeam.canStartVote(ply) then
                local reason = isfunction(CTeam.canStartVoteReason) and CTeam.canStartVoteReason(ply, CTeam) or CTeam.canStartVoteReason or ""
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("unable", "/vote" .. CTeam.command, reason))

                return ""
            end

            if CTeam.admin == 1 and not ply:IsAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_admin", "/" .. "vote" .. CTeam.command))

                return ""
            elseif CTeam.admin > 1 and not ply:IsSuperAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_sadmin", "/" .. "vote" .. CTeam.command))

                return ""
            end

            if isnumber(CTeam.NeedToChangeFrom) and ply:Team() ~= CTeam.NeedToChangeFrom then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_to_be_before", team.GetName(CTeam.NeedToChangeFrom), CTeam.name))

                return ""
            elseif istable(CTeam.NeedToChangeFrom) and not table.HasValue(CTeam.NeedToChangeFrom, ply:Team()) then
                local teamnames = ""

                for _, b in pairs(CTeam.NeedToChangeFrom) do
                    teamnames = teamnames .. " or " .. team.GetName(b)
                end

                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_to_be_before", string.sub(teamnames, 5), CTeam.name))

                return ""
            end

            if CTeam.customCheck and not CTeam.customCheck(ply) then
                local message = isfunction(CTeam.CustomCheckFailMsg) and CTeam.CustomCheckFailMsg(ply, CTeam) or CTeam.CustomCheckFailMsg or DarkRP.getPhrase("unable", team.GetName(t), "")
                DarkRP.notify(ply, 1, 4, message)

                return ""
            end

            local allowed, time = ply:changeAllowed(k)
            if not allowed then
                local notif = time and DarkRP.getPhrase("have_to_wait", math.ceil(time), "/job, " .. DarkRP.getPhrase("banned_or_demoted")) or DarkRP.getPhrase("unable", team.GetName(k), DarkRP.getPhrase("banned_or_demoted"))
                DarkRP.notify(ply, 1, 4, notif)

                return ""
            end

            if ply:Team() == k then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("unable", CTeam.command, ""))

                return ""
            end

            local numPlayers = team.NumPlayers(k)
            if max ~= 0 and ((max % 1 == 0 and numPlayers >= max) or (max % 1 ~= 0 and (tnumPlayers + 1) / player.GetCount() > max)) then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("team_limit_reached", CTeam.name))

                return ""
            end

            if ply.LastJob and 10 - (CurTime() - ply.LastJob) >= 0 then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("have_to_wait", math.ceil(10 - (CurTime() - ply.LastJob)), GAMEMODE.Config.chatCommandPrefix .. CTeam.command))

                return ""
            end

            ply.LastVoteCop = ply.LastVoteCop or -80

            if CurTime() - ply.LastVoteCop < 80 then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("have_to_wait", math.ceil(80 - (CurTime() - ply:GetTable().LastVoteCop)), GAMEMODE.Config.chatCommandPrefix .. CTeam.command))

                return ""
            end

            DarkRP.createVote(DarkRP.getPhrase("wants_to_be", ply:Nick(), CTeam.name), "job", ply, 20, function(vote, choice)
                local target = vote.target
                if not IsValid(target) then return end

                if choice >= 0 then
                    target:changeTeam(k)
                else
                    DarkRP.notifyAll(1, 4, DarkRP.getPhrase("has_not_been_made_team", target:Nick(), CTeam.name))
                end
            end, nil, nil, {
                targetTeam = k
            })

            ply.LastVoteCop = CurTime()

            return ""
        end)

        local function onJobCommand(ply, hasPriv)
            if hasPriv then
                ply:changeTeam(k)
                return
            end

            local a = CTeam.admin
            if a > 0 and not ply:IsAdmin()
            or a > 1 and not ply:IsSuperAdmin()
            then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_admin", CTeam.name))
                return
            end

            if not CTeam.RequiresVote and
                (a == 0 and not ply:IsAdmin()
                or a == 1 and not ply:IsSuperAdmin()
                or a == 2)
            or CTeam.RequiresVote and CTeam.RequiresVote(ply, k)
            then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_to_make_vote", CTeam.name))
                return
            end

            ply:changeTeam(k)
        end
        DarkRP.defineChatCommand(CTeam.command, function(ply)
            CAMI.PlayerHasAccess(ply, "DarkRP_GetJob_" .. CTeam.command, fp{onJobCommand, ply})

            return ""
        end)
    else
        DarkRP.defineChatCommand(CTeam.command, function(ply)
            if CTeam.admin == 1 and not ply:IsAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_admin", "/" .. CTeam.command))

                return ""
            end

            if CTeam.admin > 1 and not ply:IsSuperAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_sadmin", "/" .. CTeam.command))

                return ""
            end

            ply:changeTeam(k)

            return ""
        end)
    end

    concommand.Add("rp_" .. CTeam.command, function(ply, cmd, args)
        if ply:EntIndex() ~= 0 and not ply:IsAdmin() then
            ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_admin", cmd))
            return
        end

        if CTeam.admin > 1 and not ply:IsSuperAdmin() and ply:EntIndex() ~= 0 then
            ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_sadmin", cmd))
            return
        end

        if CTeam.vote then
            if CTeam.admin >= 1 and ply:EntIndex() ~= 0 and not ply:IsSuperAdmin() then
                ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_sadmin", cmd))
                return
            elseif CTeam.admin > 1 and ply:IsSuperAdmin() and ply:EntIndex() ~= 0 then
                ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_to_make_vote", CTeam.name))
                return
            end
        end

        if not args or not args[1] then
            DarkRP.printConsoleMessage(ply, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return
        end

        local target = DarkRP.findPlayer(args[1])

        if not target then
            DarkRP.printConsoleMessage(ply, DarkRP.getPhrase("could_not_find", tostring(args[1])))
            return
        end

        target:changeTeam(k, true)
        local nick
        if (ply:EntIndex() ~= 0) then
            nick = ply:Nick()
        else
            nick = "Console"
        end
        DarkRP.notify(target, 0, 4, DarkRP.getPhrase("x_made_you_a_y", nick, CTeam.name))
    end)
end

local function addEntityCommands(tblEnt)
    DarkRP.declareChatCommand{
        command = tblEnt.cmd,
        description = "Purchase a " .. tblEnt.name,
        delay = tblEnt.delay or 2,
        condition =
            function(ply)
                if not tblEnt.allowPurchaseWhileDead and not ply:Alive() then return false end
                if ply:isArrested() then return false end
                if istable(tblEnt.allowed) and not table.HasValue(tblEnt.allowed, ply:Team()) then return false end
                if not ply:canAfford(tblEnt.price) then return false end
                if tblEnt.customCheck and tblEnt.customCheck(ply) == false then return false end

                return true
            end
    }

    if CLIENT then return end

    -- Default spawning function of an entity
    -- used if tblEnt.spawn is not defined
    local function defaultSpawn(ply, tr, tblE)
        local ent = ents.Create(tblE.ent)

        if not ent:IsValid() then error("Entity '" .. tblE.ent .. "' does not exist or is not valid.") end
        if ent.Setowning_ent then ent:Setowning_ent(ply) end

        ent:SetPos(tr.HitPos)
        -- These must be set before :Spawn()
        ent.SID = ply.SID
        ent.allowed = tblE.allowed
        ent.DarkRPItem = tblE
        ent:Spawn()
        ent:Activate()

        DarkRP.placeEntity(ent, tr, ply)

        local phys = ent:GetPhysicsObject()
        if phys:IsValid() then phys:Wake() end

        return ent
    end

    local function buythis(ply, args)
        if ply:isArrested() then return "" end
        if not tblEnt.allowPurchaseWhileDead and not ply:Alive() then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("must_be_alive_to_do_x", DarkRP.getPhrase("buy_x", tblEnt.name)))
            return ""
        end
        if istable(tblEnt.allowed) and not table.HasValue(tblEnt.allowed, ply:Team()) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("incorrect_job", tblEnt.name))
            return ""
        end

        if tblEnt.customCheck and not tblEnt.customCheck(ply) then
            local message = isfunction(tblEnt.CustomCheckFailMsg) and tblEnt.CustomCheckFailMsg(ply, tblEnt) or
                tblEnt.CustomCheckFailMsg or
                DarkRP.getPhrase("not_allowed_to_purchase")
            DarkRP.notify(ply, 1, 4, message)
            return ""
        end

        if ply:customEntityLimitReached(tblEnt) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("limit", tblEnt.name))
            return ""
        end

        local canbuy, suppress, message, price = hook.Call("canBuyCustomEntity", nil, ply, tblEnt)

        local cost = price or tblEnt.getPrice and tblEnt.getPrice(ply, tblEnt.price) or tblEnt.price

        if not ply:canAfford(cost) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cant_afford", tblEnt.name))
            return ""
        end

        if canbuy == false then
            if not suppress and message then DarkRP.notify(ply, 1, 4, message) end
            return ""
        end

        ply:addMoney(-cost)

        local trace = {}
        trace.start = ply:EyePos()
        trace.endpos = trace.start + ply:GetAimVector() * 85
        trace.filter = ply

        local tr = util.TraceLine(trace)

        local ent = (tblEnt.spawn or defaultSpawn)(ply, tr, tblEnt)
        ent.onlyremover = not tblEnt.allowTools
        -- Repeat these properties to alleviate work in tblEnt.spawn:
        ent.SID = ply.SID
        ent.allowed = tblEnt.allowed
        ent.DarkRPItem = tblEnt

        hook.Call("playerBoughtCustomEntity", nil, ply, tblEnt, ent, cost)

        if cost == 0 then
            DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("you_got_yourself", tblEnt.name))
        else
            DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("you_bought", tblEnt.name, DarkRP.formatMoney(cost), ""))
        end

        ply:addCustomEntity(tblEnt)
        return ""
    end
    DarkRP.defineChatCommand(tblEnt.cmd, buythis)
end

RPExtraTeams = {}
local jobByCmd = {}
DarkRP.getJobByCommand = function(cmd)
    if not jobByCmd[cmd] then return nil, nil end
    return RPExtraTeams[jobByCmd[cmd]], jobByCmd[cmd]
end
plyMeta.getJobTable = function(ply)
    local tbl = RPExtraTeams[ply:Team()]
    -- don't error when the player has not fully joined yet
    if not tbl and (ply.DarkRPInitialised or ply.DarkRPDataRetrievalFailed) then
        DarkRP.error(
            string.format("There is a player with an invalid team!\n\nThe player's name is %s, their team number is \"%s\", which has the name \"%s\"",
                ply:EntIndex() == 0 and "Console" or IsValid(ply) and ply:Nick() or "unknown",
                ply:Team(),
                team.GetName(ply:Team())),
            1,
            {
                "It is the server owner's responsibility to figure out why that player has no valid team.",
                "This error is very likely to be caused by an earlier error. If you don't see any errors in your own console, look at the server console."
            }
        )
    end
    return tbl
end

function DarkRP.createJob(Name, colorOrTable, model, Description, Weapons, command, maximum_amount_of_this_class, Salary, admin, Vote, Haslicense, NeedToChangeFrom, CustomCheck)
    local tableSyntaxUsed = not IsColor(colorOrTable)

    local CustomTeam = tableSyntaxUsed and colorOrTable or
        {color = colorOrTable, model = model, description = Description, weapons = Weapons, command = command,
            max = maximum_amount_of_this_class, salary = Salary, admin = admin or 0, vote = tobool(Vote), hasLicense = Haslicense,
            NeedToChangeFrom = NeedToChangeFrom, customCheck = CustomCheck
        }
    CustomTeam.name = Name
    CustomTeam.default = DarkRP.DARKRP_LOADING

    -- Disabled job
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["jobs"][CustomTeam.command] then return end

    local valid, err, hints = DarkRP.validateJob(CustomTeam)
    if not valid then DarkRP.error(string.format("Corrupt team: %s!\n%s", CustomTeam.name or "", err), 2, hints) end

    if not (GM or GAMEMODE):CustomObjFitsMap(CustomTeam) then return end

    local jobCount = #RPExtraTeams + 1

    CustomTeam.team = jobCount

    CustomTeam.salary = math.floor(CustomTeam.salary)

    CustomTeam.customCheck           = CustomTeam.customCheck           and fp{DarkRP.simplerrRun, CustomTeam.customCheck}
    CustomTeam.CustomCheckFailMsg = isfunction(CustomTeam.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, CustomTeam.CustomCheckFailMsg} or CustomTeam.CustomCheckFailMsg
    CustomTeam.CanPlayerSuicide      = CustomTeam.CanPlayerSuicide      and fp{DarkRP.simplerrRun, CustomTeam.CanPlayerSuicide}
    CustomTeam.PlayerCanPickupWeapon = CustomTeam.PlayerCanPickupWeapon and fp{DarkRP.simplerrRun, CustomTeam.PlayerCanPickupWeapon}
    CustomTeam.PlayerDeath           = CustomTeam.PlayerDeath           and fp{DarkRP.simplerrRun, CustomTeam.PlayerDeath}
    CustomTeam.PlayerLoadout         = CustomTeam.PlayerLoadout         and fp{DarkRP.simplerrRun, CustomTeam.PlayerLoadout}
    CustomTeam.PlayerSelectSpawn     = CustomTeam.PlayerSelectSpawn     and fp{DarkRP.simplerrRun, CustomTeam.PlayerSelectSpawn}
    CustomTeam.PlayerSetModel        = CustomTeam.PlayerSetModel        and fp{DarkRP.simplerrRun, CustomTeam.PlayerSetModel}
    CustomTeam.PlayerSpawn           = CustomTeam.PlayerSpawn           and fp{DarkRP.simplerrRun, CustomTeam.PlayerSpawn}
    CustomTeam.PlayerSpawnProp       = CustomTeam.PlayerSpawnProp       and fp{DarkRP.simplerrRun, CustomTeam.PlayerSpawnProp}
    CustomTeam.RequiresVote          = CustomTeam.RequiresVote          and fp{DarkRP.simplerrRun, CustomTeam.RequiresVote}
    CustomTeam.ShowSpare1            = CustomTeam.ShowSpare1            and fp{DarkRP.simplerrRun, CustomTeam.ShowSpare1}
    CustomTeam.ShowSpare2            = CustomTeam.ShowSpare2            and fp{DarkRP.simplerrRun, CustomTeam.ShowSpare2}
    CustomTeam.canStartVote          = CustomTeam.canStartVote          and fp{DarkRP.simplerrRun, CustomTeam.canStartVote}

    jobByCmd[CustomTeam.command] = table.insert(RPExtraTeams, CustomTeam)
    DarkRP.addToCategory(CustomTeam, "jobs", CustomTeam.category)

    team.SetUp(jobCount, Name, CustomTeam.color)

    timer.Simple(0, function()
        declareTeamCommands(CustomTeam)
        addTeamCommands(CustomTeam, CustomTeam.max)
    end)

    -- Precache model here. Not right before the job change is done
    if istable(CustomTeam.model) then
        for _, v in pairs(CustomTeam.model) do util.PrecacheModel(v) end
    else
        util.PrecacheModel(CustomTeam.model)
    end
    return jobCount
end
AddExtraTeam = DarkRP.createJob

local function removeCustomItem(tbl, category, hookName, reloadF4, i)
    local item = tbl[i]
    tbl[i] = nil
    if category then DarkRP.removeFromCategory(item, category) end
    if istable(item) and (item.command or item.cmd) then DarkRP.removeChatCommand(item.command or item.cmd) end
    hook.Run(hookName, i, item)
    if CLIENT and reloadF4 and IsValid(DarkRP.getF4MenuPanel()) then DarkRP.getF4MenuPanel():Remove() end -- Rebuild entire F4 menu frame
end

function DarkRP.removeJob(i)
    local job = RPExtraTeams[i]
    jobByCmd[job.command] = nil

    DarkRP.removeChatCommand("vote" .. job.command)
    removeCustomItem(RPExtraTeams, "jobs", "onJobRemoved", true, i)
end

RPExtraTeamDoors = {}
RPExtraTeamDoorIDs = {}
local maxTeamDoorID = 0
function DarkRP.createEntityGroup(name, ...)
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["doorgroups"][name] then return end
    RPExtraTeamDoors[name] = {...}
    RPExtraTeamDoors[name].name = name

    maxTeamDoorID = maxTeamDoorID + 1
    RPExtraTeamDoorIDs[name] = maxTeamDoorID
end
AddDoorGroup = DarkRP.createEntityGroup

DarkRP.removeEntityGroup = fp{removeCustomItem, RPExtraTeamDoors, nil, "onEntityGroupRemoved", false}

CustomVehicles = {}
CustomShipments = {}
local shipByName = {}
DarkRP.getShipmentByName = function(name)
    name = string.lower(name or "")

    if not shipByName[name] then return nil, nil end
    return CustomShipments[shipByName[name]], shipByName[name]
end

function DarkRP.createShipment(name, model, entity, price, Amount_of_guns_in_one_shipment, Sold_separately, price_separately, noshipment, classes, shipmodel, CustomCheck)
    local tableSyntaxUsed = istable(model)

    price = tonumber(price)
    local shipmentmodel = shipmodel or "models/Items/item_item_crate.mdl"

    local customShipment = tableSyntaxUsed and model or
        {model = model, entity = entity, price = price, amount = Amount_of_guns_in_one_shipment,
        seperate = Sold_separately, pricesep = price_separately, noship = noshipment, allowed = classes,
        shipmodel = shipmentmodel, customCheck = CustomCheck, weight = 5}

    -- The pains of backwards compatibility when dealing with ancient spelling errors...
    if customShipment.separate ~= nil then
        customShipment.seperate = customShipment.separate
    end
    customShipment.separate = customShipment.seperate

    if customShipment.allowed == nil then
        customShipment.allowed = {}
        for k in pairs(team.GetAllTeams()) do
            table.insert(customShipment.allowed, k)
        end
    end

    customShipment.name = name
    customShipment.default = DarkRP.DARKRP_LOADING
    customShipment.shipmodel = customShipment.shipmodel or shipmentmodel

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["shipments"][customShipment.name] then return end

    local valid, err, hints = DarkRP.validateShipment(customShipment)
    if not valid then DarkRP.error(string.format("Corrupt shipment: %s!\n%s", name or "", err), 2, hints) end

    customShipment.spawn = customShipment.spawn and fp{DarkRP.simplerrRun, customShipment.spawn}
    customShipment.allowed = isnumber(customShipment.allowed) and {customShipment.allowed} or customShipment.allowed
    customShipment.customCheck = customShipment.customCheck   and fp{DarkRP.simplerrRun, customShipment.customCheck}
    customShipment.CustomCheckFailMsg = isfunction(customShipment.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, customShipment.CustomCheckFailMsg} or customShipment.CustomCheckFailMsg

    if not customShipment.noship then DarkRP.addToCategory(customShipment, "shipments", customShipment.category) end
    if customShipment.separate then DarkRP.addToCategory(customShipment, "weapons", customShipment.category) end

    shipByName[string.lower(name or "")] = table.insert(CustomShipments, customShipment)
    util.PrecacheModel(customShipment.model)
end
AddCustomShipment = DarkRP.createShipment

function DarkRP.removeShipment(i)
    local ship = CustomShipments[i]
    shipByName[ship.name] = nil
    removeCustomItem(CustomShipments, "shipments", "onShipmentRemoved", true, i)
end

function DarkRP.createVehicle(Name_of_vehicle, model, price, Jobs_that_can_buy_it, customcheck)
    local vehicle = istable(Name_of_vehicle) and Name_of_vehicle or
        {name = Name_of_vehicle, model = model, price = price, allowed = Jobs_that_can_buy_it, customCheck = customcheck}

    vehicle.default = DarkRP.DARKRP_LOADING

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["vehicles"][vehicle.name] then return end

    local found = false
    for k in pairs(DarkRP.getAvailableVehicles()) do
        if string.lower(k) == string.lower(vehicle.name) then found = true break end
    end

    local valid, err, hints = DarkRP.validateVehicle(vehicle)
    if not valid then DarkRP.error(string.format("Corrupt vehicle: %s!\n%s", vehicle.name or "", err), 2, hints) end

    if not found then DarkRP.error("Vehicle invalid: " .. vehicle.name .. ". Unknown vehicle name.", 2) end

    vehicle.customCheck = vehicle.customCheck and fp{DarkRP.simplerrRun, vehicle.customCheck}
    vehicle.CustomCheckFailMsg = isfunction(vehicle.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, vehicle.CustomCheckFailMsg} or vehicle.CustomCheckFailMsg

    table.insert(CustomVehicles, vehicle)
    DarkRP.addToCategory(vehicle, "vehicles", vehicle.category)
end
AddCustomVehicle = DarkRP.createVehicle

DarkRP.removeVehicle = fp{removeCustomItem, CustomVehicles, "vehicles", "onVehicleRemoved", true}

--[[---------------------------------------------------------------------------
Decides whether a custom job or shipmet or whatever can be used in a certain map
---------------------------------------------------------------------------]]
function GM:CustomObjFitsMap(obj)
    if not obj or not obj.maps then return true end

    local map = string.lower(game.GetMap())
    for _, v in pairs(obj.maps) do
        if string.lower(v) == map then return true end
    end
    return false
end

DarkRPEntities = {}
function DarkRP.createEntity(name, entity, model, price, max, command, classes, CustomCheck)
    local tableSyntaxUsed = istable(entity)

    local tblEnt = tableSyntaxUsed and entity or
        {ent = entity, model = model, price = price, max = max,
        cmd = command, allowed = classes, customCheck = CustomCheck}
    tblEnt.name = name
    tblEnt.default = DarkRP.DARKRP_LOADING

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["entities"][tblEnt.name] then return end

    if isnumber(tblEnt.allowed) then
        tblEnt.allowed = {tblEnt.allowed}
    end

    local valid, err, hints = DarkRP.validateEntity(tblEnt)
    if not valid then DarkRP.error(string.format("Corrupt entity: %s!\n%s", name or "", err), 2, hints) end

    tblEnt.customCheck = tblEnt.customCheck and fp{DarkRP.simplerrRun, tblEnt.customCheck}
    tblEnt.CustomCheckFailMsg = isfunction(tblEnt.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, tblEnt.CustomCheckFailMsg} or tblEnt.CustomCheckFailMsg
    tblEnt.getPrice    = tblEnt.getPrice    and fp{DarkRP.simplerrRun, tblEnt.getPrice}
    tblEnt.getMax      = tblEnt.getMax      and fp{DarkRP.simplerrRun, tblEnt.getMax}
    tblEnt.spawn       = tblEnt.spawn       and fp{DarkRP.simplerrRun, tblEnt.spawn}

    -- if SERVER and FPP then
    --  FPP.AddDefaultBlocked(blockTypes, tblEnt.ent)
    -- end

    table.insert(DarkRPEntities, tblEnt)
    DarkRP.addToCategory(tblEnt, "entities", tblEnt.category)
    timer.Simple(0, function() addEntityCommands(tblEnt) end)
end
AddEntity = DarkRP.createEntity

DarkRP.removeEntity = fp{removeCustomItem, DarkRPEntities, "entities", "onEntityRemoved", true}

-- here for backwards compatibility
DarkRPAgendas = {}

local agendas = {}
-- Returns the agenda managed by the player
plyMeta.getAgenda = fn.Compose{fn.Curry(fn.Flip(fn.GetValue), 2)(DarkRPAgendas), plyMeta.Team}

-- Returns the agenda this player is member of
function plyMeta:getAgendaTable()
    return agendas[self:Team()]
end

DarkRP.getAgendas = fp{fn.Id, agendas}

function DarkRP.createAgenda(Title, Manager, Listeners)
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["agendas"][Title] then return end

    local agenda = {Manager = Manager, Title = Title, Listeners = Listeners, ManagersByKey = {}}
    agenda.default = DarkRP.DARKRP_LOADING

    local valid, err, hints = DarkRP.validateAgenda(agenda)
    if not valid then DarkRP.error(string.format("Corrupt agenda: %s!\n%s", agenda.Title or "", err), 2, hints) end

    for _, v in pairs(agenda.Listeners) do
        agendas[v] = agenda
    end

    for _, v in pairs(istable(agenda.Manager) and agenda.Manager or {agenda.Manager}) do
        agendas[v] = agenda
        DarkRPAgendas[v] = agenda -- backwards compat
        agenda.ManagersByKey[v] = true
    end

    if SERVER then
        timer.Simple(0, function()
            -- Run after scripts have loaded
            agenda.text = hook.Run("agendaUpdated", nil, agenda, "")
        end)
    end
end
AddAgenda = DarkRP.createAgenda

function DarkRP.removeAgenda(title)
    local agenda
    for k, v in pairs(agendas) do
        if v.Title == title then
            agenda = v
            agendas[k] = nil
        end
    end

    for k, v in pairs(DarkRPAgendas) do
        if v.Title == title then DarkRPAgendas[k] = nil end
    end
    hook.Run("onAgendaRemoved", title, agenda)
end

GM.DarkRPGroupChats = {}
local groupChatNumber = 0
function DarkRP.createGroupChat(funcOrTeam, ...)
    local gm = GM or GAMEMODE
    gm.DarkRPGroupChats = gm.DarkRPGroupChats or {}
    if DarkRP.DARKRP_LOADING then
        groupChatNumber = groupChatNumber + 1
        if DarkRP.disabledDefaults["groupchat"][groupChatNumber] then return end
    end
    -- People can enter either functions or a list of teams as parameter(s)
    if isfunction(funcOrTeam) then
        table.insert(gm.DarkRPGroupChats, fp{DarkRP.simplerrRun, funcOrTeam})
    else
        local teams = {funcOrTeam, ...}
        table.insert(gm.DarkRPGroupChats, function(ply) return table.HasValue(teams, ply:Team()) end)
    end
end
GM.AddGroupChat = function(_, ...) DarkRP.createGroupChat(...) end

DarkRP.removeGroupChat = fp{removeCustomItem, GM.DarkRPGroupChats, nil, "onGroupChatRemoved", false}

DarkRP.getGroupChats = fp{fn.Id, GM.DarkRPGroupChats}

GM.AmmoTypes = {}

function DarkRP.createAmmoType(ammoType, name, model, price, amountGiven, customCheck)
    local gm = GM or GAMEMODE
    gm.AmmoTypes = gm.AmmoTypes or {}
    local ammo = istable(name) and name or {
        name = name,
        model = model,
        price = price,
        amountGiven = amountGiven,
        customCheck = customCheck
    }
    ammo.ammoType = ammoType
    ammo.default = DarkRP.DARKRP_LOADING

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["ammo"][ammo.name] then return end

    ammo.customCheck = ammo.customCheck and fp{DarkRP.simplerrRun, ammo.customCheck}
    ammo.CustomCheckFailMsg = isfunction(ammo.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, ammo.CustomCheckFailMsg} or ammo.CustomCheckFailMsg
    ammo.id = table.insert(gm.AmmoTypes, ammo)

    DarkRP.addToCategory(ammo, "ammo", ammo.category)
end
GM.AddAmmoType = function(_, ...) DarkRP.createAmmoType(...) end

DarkRP.removeAmmoType = fp{removeCustomItem, GM.AmmoTypes, "ammo", "onAmmoTypeRemoved", true}

local demoteGroups = {}
function DarkRP.createDemoteGroup(name, tbl)
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["demotegroups"][name] then return end
    if not tbl or not tbl[1] then error("No members in the demote group!") end

    local set = demoteGroups[tbl[1]] or disjoint.MakeSet(tbl[1])
    set.name = name
    for i = 2, #tbl do
        set = (demoteGroups[tbl[i]] or disjoint.MakeSet(tbl[i])) + set
        set.name = name
    end

    for _, teamNr in pairs(tbl) do
        if demoteGroups[teamNr] then
            -- Unify the sets if there was already one there
            demoteGroups[teamNr] = demoteGroups[teamNr] + set
        else
            demoteGroups[teamNr] = set
        end
    end
end

function DarkRP.removeDemoteGroup(name)
    local foundSet
    for k, v in pairs(demoteGroups) do
        local set = disjoint.FindSet(v)
        if set.name == name then
            foundSet = set
            demoteGroups[k] = nil
        end
    end
    hook.Run("onDemoteGroupRemoved", name, foundSet)
end

function DarkRP.getDemoteGroup(teamNr)
    demoteGroups[teamNr] = demoteGroups[teamNr] or disjoint.MakeSet(teamNr)
    return disjoint.FindSet(demoteGroups[teamNr])
end

DarkRP.getDemoteGroups = fp{fn.Id, demoteGroups}

local categories = {
    jobs = {},
    entities = {},
    shipments = {},
    weapons = {},
    vehicles = {},
    ammo = {},
}
local categoriesMerged = false -- whether categories and custom items are merged.

DarkRP.getCategories = fp{fn.Id, categories}

local categoryOrder = function(a, b)
    local aso = a.sortOrder or 100
    local bso = b.sortOrder or 100
    return aso < bso or aso == bso and a.name < b.name
end

local function insertCategory(destination, tbl)
    -- Override existing category of applicable
    for k, cat in pairs(destination) do
        if cat.name ~= tbl.name then continue end

        destination[k] = tbl
        tbl.members = cat.members
        return
    end

    table.insert(destination, tbl)
    local i = #destination

    while i > 1 do
        if categoryOrder(destination[i - 1], tbl) then break end
        destination[i - 1], destination[i] = destination[i], destination[i - 1]
        i = i - 1
    end
end

function DarkRP.createCategory(tbl)
    local valid, err, hints = DarkRP.validateCategory(tbl)
    if not valid then DarkRP.error(string.format("Corrupt category: %s!\n%s", tbl.name or "", err), 2, hints) end
    tbl.members = {}

    local destination = categories[tbl.categorises]
    insertCategory(destination, tbl)

    -- Too many people made the mistake of not creating a category for weapons as well as shipments
    -- when having shipments that can also be sold separately.
    if tbl.categorises == "shipments" then
        insertCategory(categories.weapons, table.Copy(tbl))
    end
end

function DarkRP.addToCategory(item, kind, cat)
    cat = cat or "Other"
    item.category = cat

    -- The merge process will take care of the category:
    if not categoriesMerged then return end

    -- Post-merge: manual insertion into category
    local cats = categories[kind]
    for _, c in ipairs(cats) do
        if c.name ~= cat then continue end

        insertCategory(c.members, item)
        return
    end

    DarkRP.errorNoHalt(string.format([[The category of "%s" ("%s") does not exist!]], item.name, cat), 2, {
        "Make sure the category is created with DarkRP.createCategory.",
        "The category name is case sensitive!",
        "Categories must be created before DarkRP finished loading.",
    })
end

function DarkRP.removeFromCategory(item, kind)
    local cats = categories[kind]
    if not cats then DarkRP.error(string.format("Invalid category kind '%s'.", kind), 2) end
    local cat = item.category
    if not cat then return end
    for _, v in pairs(cats) do
        if v.name ~= item.category then continue end
        for k, mem in pairs(v.members) do
            if mem ~= item then continue end
            table.remove(v.members, k)
            break
        end
        break
    end
end

-- Assign custom stuff to their categories
local function mergeCategories(customs, catKind, path)
    local cats = categories[catKind]
    local catByName = {}
    for _, v in pairs(cats) do catByName[v.name] = v end
    for _, v in pairs(customs) do
        -- Override default thing categories:
        local catName = v.default and (GAMEMODE.Config.CategoryOverride[catKind] or {})[v.name] or v.category or "Other"
        local cat = catByName[catName]
        if not cat then
            DarkRP.errorNoHalt(string.format([[The category of "%s" ("%s") does not exist!]], v.name, catName), 3, {
                "Make sure the category is created with DarkRP.createCategory.",
                "The category name is case sensitive!",
                "Categories must be created before DarkRP finished loading."
            }, path, -1, path)
            cat = catByName.Other
        end

        cat.members = cat.members or {}
        table.insert(cat.members, v)
    end

    -- Sort category members
    for _, v in pairs(cats) do table.sort(v.members, categoryOrder) end
end

hook.Add("loadCustomDarkRPItems", "mergeCategories", function()
    local shipments = fn.Filter(fc{fn.Not, fp{fn.GetValue, "noship"}}, CustomShipments)
    local guns = fn.Filter(fp{fn.GetValue, "separate"}, CustomShipments)

    mergeCategories(RPExtraTeams, "jobs", "your jobs")
    mergeCategories(DarkRPEntities, "entities", "your custom entities")
    mergeCategories(shipments, "shipments", "your custom shipments")
    mergeCategories(guns, "weapons", "your custom weapons")
    mergeCategories(CustomVehicles, "vehicles", "your custom vehicles")
    mergeCategories(GAMEMODE.AmmoTypes, "ammo", "your custom ammo")

    categoriesMerged = true
end)

--PATH gamemodes/mangarp/gamemode/modules/animations/sh_animations.lua:
local Anims = {}

-- Load animations after the languages for translation purposes
hook.Add("loadCustomDarkRPItems", "loadAnimations", function()
    Anims[ACT_GMOD_GESTURE_BOW] = DarkRP.getPhrase("bow")
    Anims[ACT_GMOD_TAUNT_MUSCLE] = DarkRP.getPhrase("sexy_dance")
    Anims[ACT_GMOD_GESTURE_BECON] = DarkRP.getPhrase("follow_me")
    Anims[ACT_GMOD_TAUNT_LAUGH] = DarkRP.getPhrase("laugh")
    Anims[ACT_GMOD_TAUNT_PERSISTENCE] = DarkRP.getPhrase("lion_pose")
    Anims[ACT_GMOD_GESTURE_DISAGREE] = DarkRP.getPhrase("nonverbal_no")
    Anims[ACT_GMOD_GESTURE_AGREE] = DarkRP.getPhrase("thumbs_up")
    Anims[ACT_GMOD_GESTURE_WAVE] = DarkRP.getPhrase("wave")
    Anims[ACT_GMOD_TAUNT_DANCE] = DarkRP.getPhrase("dance")
end)

function DarkRP.addPlayerGesture(anim, text)
    if not anim then DarkRP.error("Argument #1 of DarkRP.addPlayerGesture (animation/gesture) does not exist.", 2) end
    if not text then DarkRP.error("Argument #2 of DarkRP.addPlayerGesture (text) does not exist.", 2) end

    Anims[anim] = text
end

function DarkRP.removePlayerGesture(anim)
    if not anim then DarkRP.error("Argument #1 of DarkRP.removePlayerGesture (animation/gesture) does not exist.", 2) end

    Anims[anim] = nil
end

local function physGunCheck(ply)
    local hookName = "darkrp_anim_physgun_" .. ply:EntIndex()
    hook.Add("Think", hookName, function()
        if IsValid(ply) and
           ply:Alive() and
           ply:GetActiveWeapon():IsValid() and
           ply:GetActiveWeapon():GetClass() == "weapon_physgun" and
           ply:KeyDown(IN_ATTACK) and
           (ply:GetAllowWeaponsInVehicle() or not ply:InVehicle()) then
            local ent = ply:GetEyeTrace().Entity
            if IsValid(ent) and ent:IsPlayer() and not ply.SaidHi then
                ply.SaidHi = true
                ply:DoAnimationEvent(ACT_SIGNAL_GROUP)
            end
        else
            if IsValid(ply) then
                ply.SaidHi = nil
            end
            hook.Remove("Think", hookName)
        end
    end)
end

hook.Add("KeyPress", "darkrp_animations", function(ply, key)
    if key == IN_ATTACK then
        local weapon = ply:GetActiveWeapon()

        if weapon:IsValid() then
            local class = weapon:GetClass()

            -- Saying hi/hello to a player
            if class == "weapon_physgun" then
                physGunCheck(ply)

            -- Hobo throwing poop!
            elseif class == "weapon_bugbait" then
                local Team = ply:Team()
                if RPExtraTeams[Team] and RPExtraTeams[Team].hobo then
                    ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_THROW)
                end
            end
        end
    end
end)

if SERVER then
    local function CustomAnim(ply, cmd, args)
        if ply:EntIndex() == 0 then return end
        local Gesture = tonumber(args[1] or 0)
        if not Anims[Gesture] then return end

        local RP = RecipientFilter()
        RP:AddAllPlayers()

        umsg.Start("_DarkRP_CustomAnim", RP)
        umsg.Entity(ply)
        umsg.Short(Gesture)
        umsg.End()
    end
    concommand.Add("_DarkRP_DoAnimation", CustomAnim)
    return
end

local function KeysAnims(um)
    local ply = um:ReadEntity()
    local act = um:ReadString()

    if not IsValid(ply) then return end
    ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act == "usekeys" and ACT_GMOD_GESTURE_ITEM_PLACE or ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST, true)
end
usermessage.Hook("anim_keys", KeysAnims)

local function CustomAnimation(um)
    local ply = um:ReadEntity()
    local act = um:ReadShort()

    if not IsValid(ply) then return end
    ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act, true)
end
usermessage.Hook("_DarkRP_CustomAnim", CustomAnimation)

local AnimFrame
local function AnimationMenu()
    if AnimFrame then return end

    local Panel = vgui.Create("Panel")
    Panel:SetPos(0,0)
    Panel:SetSize(ScrW(), ScrH())
    function Panel:OnMousePressed()
        AnimFrame:Close()
    end

    AnimFrame = AnimFrame or vgui.Create("DFrame", Panel)
    local Height = table.Count(Anims) * 55 + 32
    AnimFrame:SetSize(130, Height)
    AnimFrame:SetPos(ScrW() / 2 + ScrW() * 0.1, ScrH() / 2 - (Height / 2))
    AnimFrame:SetTitle(DarkRP.getPhrase("custom_animation"))
    AnimFrame.btnMaxim:SetVisible(false)
    AnimFrame.btnMinim:SetVisible(false)
    AnimFrame:SetVisible(true)
    AnimFrame:MakePopup()
    AnimFrame:ParentToHUD()

    function AnimFrame:Close()
        Panel:Remove()
        AnimFrame:Remove()
        AnimFrame = nil
    end

    local i = 0
    for k, v in SortedPairs(Anims) do
        i = i + 1
        local button = vgui.Create("DButton", AnimFrame)
        button:SetPos(10, (i - 1) * 55 + 30)
        button:SetSize(110, 50)
        button:SetText(v)

        button.DoClick = function()
            RunConsoleCommand("_DarkRP_DoAnimation", k)
        end
    end
    AnimFrame:SetSkin(GAMEMODE.Config.DarkRPSkin)
end
concommand.Add("_DarkRP_AnimationMenu", AnimationMenu)

--PATH addons/sl_utils/lua/darkrp_modules/roll_cmd/sh_roll.lua:

-- CONFIG ROLL CMD
 


ROLLCONF = { 
	tchatmsg = " has rolled a ",
	cmd = "roll"

}
--PATH addons/sl_utils/lua/weapons/animation_swep_base/shared.lua:
--[[
Only allowed to use in Addons by
​Mattis 'Mattzimann' Krämer
]]--

SWEP.Author					= "Mattzimann & Oninoni"
SWEP.Purpose				= "Base class for animations"
SWEP.Instructions 			= "Click to play the animation"
SWEP.Category 				= "EGM Animation SWEPs"

SWEP.PrintName				= "Animation SWEP"
SWEP.Slot					= 4
SWEP.SlotPos				= 5
SWEP.DrawAmmo				= false

SWEP.Spawnable				= false

SWEP.DefaultHoldType = "normal"

SWEP.ViewModel 				= "models/weapons/v_357.mdl"
SWEP.WorldModel 			= "models/weapons/w_357.mdl"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Weight					= 1
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.deactivateOnMove		= 0

function SWEP:DrawWorldModel()
end

function SWEP:PreDrawViewModel()
    render.SetBlend(0)
end

function SWEP:PostDrawViewModel()
    render.SetBlend(1)
end

function SWEP:Initialize()
	self:SetHoldType(self.DefaultHoldType)

	if CLIENT then
		AnimationSWEP.GestureAngles[self:GetClass()] = self:GetGesture()
	end

	if SERVER then

		if PlayerConfig and PlayerConfig.NoDropWeapons then
			table.insert(PlayerConfig.NoDropWeapons, self:GetClass())
		end
	end
end

if CLIENT then
	-- Should be overidden in child file.
	function SWEP:GetGesture()
		return {}
	end

	function SWEP:PrimaryAttack()
	end
	function SWEP:SecondaryAttack()
	end
end

if SERVER then
	function SWEP:PrimaryAttack()
		ply = self.Owner

		if not ply:GetNWBool("animationStatus") then
			if not ply:Crouching() and ply:GetVelocity():Length() < 5 and not ply:InVehicle() then
				AnimationSWEP:Toggle(ply, true, self:GetClass(), self.deactivateOnMove)
			end
		else
			AnimationSWEP:Toggle(ply, false)
		end
	end

	function SWEP:SecondaryAttack()
		ply = self.Owner
		
		if not ply:GetNWBool("animationStatus") then
			if not ply:Crouching() and ply:GetVelocity():Length() < 5 and not ply:InVehicle() then
				AnimationSWEP:Toggle(ply, true, self:GetClass(), self.deactivateOnMove)
			end
		else
			AnimationSWEP:Toggle(ply, false)
		end
	end

	function SWEP:OnRemove()
		local ply = self.Owner
		AnimationSWEP:Toggle(ply, false)
	end

	function SWEP:OnDrop()
		local ply = self.Owner
		AnimationSWEP:Toggle(ply, false)
	end

	function SWEP:Holster()
		local ply = self.Owner
		AnimationSWEP:Toggle(ply, false)
		return true
	end
end
--PATH addons/sl_main_system/lua/weapons/buellost_faux/shared.lua:
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
                Modif par Buellost

]]--

-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================
-- ============================================================================================

SWEP.PrintName 		      = "Base : Faux" 
SWEP.Author 		      = "Buellost" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ShowWorldModel         = false
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

SWEP.TypeArme = "faux"
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
--PATH addons/the_perfect_training_system/lua/weapons/diablos_sport_badge/shared.lua:
SWEP.Author 			= "Diablos"
SWEP.Base				= "weapon_base"
SWEP.Contact 			= "gmodstore.com/users/diablos"
SWEP.PrintName 			= "Sport Badge"
SWEP.Category 			= "Diablos Addon"
SWEP.Instructions 		= "A sport badge to access to training rooms"
SWEP.Purpose 			= ""
SWEP.Spawnable 			= true
SWEP.DrawCrosshair 		= true
SWEP.DrawAmmo 			= false
SWEP.Weight 			= 0
SWEP.SlotPos 			= 2
SWEP.Slot 				= 4
SWEP.NextAttack			= 0
SWEP.Primary.Cone		= 0.02	
--------------------------------------------------------------------------------|
SWEP.Primary.Ammo         		= "none"
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Delay 				= 1
SWEP.Primary.Automatic   		= false							
--------------------------------------------------------------------------------|
SWEP.Secondary.Ammo				= "none"
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Automatic		= false
--------------------------------------------------------------------------------|


/* Weapon */

SWEP.HoldType = "pistol"
SWEP.UseHands = true
-- SWEP.SwayScale = 1.5
-- SWEP.BobScale = 1.5
SWEP.ViewModel = "models/tptsa/sportbadge/c_sportbadge.mdl"
SWEP.WorldModel = "models/tptsa/sportbadge/w_sportbadge.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.NeedDeployment = true

SWEP.ViewModelFOV = 60
SWEP.DefaultViewModelFOV = SWEP.ViewModelFOV
SWEP.ViewModelFlip = false

SWEP.IronSightsPos = vector_origin
SWEP.IronSightsAng = vector_origin


SWEP.WElements = {
	["sportbadge"] = { type = "Model", model = "models/tptsa/sportbadge/w_sportbadge.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.5, 2, -2.201), angle = Angle(-8.183, 97.013, 22.208), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:Initialize()
	
self:SetWeaponHoldType( self.HoldType )

	if CLIENT then
	
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
		self:CreateModels(self.VElements)
		self:CreateModels(self.WElements)
		
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)

				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					vm:SetColor(Color(255,255,255,1))
					vm:SetMaterial("Debug/hsv")
					-- vm:SetMaterial("Models/effects/vol_light001")
				end
			end
		end
		
	end
end
function SWEP:Holster()
	self.ViewModelFOV = self.DefaultViewModelFOV
	self.IsMovingArms = false

	self.IronSightsPos = vector_origin
	self.IronSightsAng = vector_origin

	local owner = self:GetOwner()
	if IsValid(owner) then

		if CLIENT then
			local vm = owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
			end
		end
	end
	
	return true
end

function SWEP:GetViewModelPosition(EyePos, EyeAng)
	local Mul = 1.0

	local Offset = self.IronSightsPos

	if (self.IronSightsAng) then
        EyeAng = EyeAng * 1
        
		EyeAng:RotateAroundAxis(EyeAng:Right(), 	self.IronSightsAng.x * Mul)
		EyeAng:RotateAroundAxis(EyeAng:Up(), 		self.IronSightsAng.y * Mul)
		EyeAng:RotateAroundAxis(EyeAng:Forward(),   self.IronSightsAng.z * Mul)
	end

	local Right 	= EyeAng:Right()
	local Up 		= EyeAng:Up()
	local Forward 	= EyeAng:Forward()

	EyePos = EyePos + Offset.x * Right * Mul
	EyePos = EyePos + Offset.y * Forward * Mul
	EyePos = EyePos + Offset.z * Up * Mul
	
	return EyePos, EyeAng
end

function SWEP:OnRemove()
	self:Holster()
end
if CLIENT then
	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self:GetOwner():GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)
		if (!self.vRenderOrder) then

			self.vRenderOrder = {}
			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
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
				end
			end
		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
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
			end
			
		end
		
	end
	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end

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
				ang.r = -ang.r
			end
		
		end
		
		return pos, ang
	end
	function SWEP:CreateModels( tab )
		if (!tab) then return end
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
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end

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
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end

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

-- [[ End of the special code ]] --

SWEP.TimeAnim = 0.5 -- in seconds
SWEP.FOVDiff = 20 -- FOV difference
SWEP.OutstretchedArms = 1
SWEP.IsMovingArms = false
SWEP.LastClick = 0

/*---------------------------------------------------------------------------
	Called to simulate an animation when you're approaching or moving away
	This just "pushing" the badge, then pulling it after a speficic amount of seconds
---------------------------------------------------------------------------*/

function SWEP:ChangeViewModelFOV()
	local ply = self:GetOwner()

	if self.IsMovingArms then return end

	self.IsMovingArms = true
	self.Animating = CurTime()
	self.Pushing = true
end


function SWEP:Think()

	if not self.IsMovingArms then return end

	local curtime = CurTime()

	local ratio = math.min(1, (curtime - self.Animating) / self.TimeAnim)
	if self.Pushing then
		-- Push
		self.ViewModelFOV = self.DefaultViewModelFOV + ratio * self.FOVDiff

		angHand = Angle(-ratio * 20, ratio * 50, 0)
		angForearm = Angle(-ratio * 20, 0, 0)

		if ratio == 1 then
			if (curtime - self.Animating) >= self.TimeAnim + self.OutstretchedArms then
				self.Animating = curtime
				self.Pushing = false
			end
		end
	else
		-- Pull
		ratio = 1 - ratio

		self.ViewModelFOV = self.DefaultViewModelFOV + ratio * self.FOVDiff

		if ratio == 0 then
			self.IsMovingArms = false
		end

	end

	self.IronSightsPos  = Vector(0, 0, ratio * 2)
	self.IronSightsAng  = Vector(-ratio * 2, 0, ratio * 45)

end

/*---------------------------------------------------------------------------
	Call the "animation simulation", then detecting if your eye trace is focusing an entity
	ie. a turnstile or a card reader
---------------------------------------------------------------------------*/

function SWEP:PrimaryAttack() 
	if not IsFirstTimePredicted() then return end
	if self.LastClick + 1 > CurTime() then return end

	self.LastClick = CurTime()

	self:ChangeViewModelFOV()

	timer.Simple(self.TimeAnim, function()
		local ply = self:GetOwner()
		if IsValid(ply) then
			local ent = ply:GetEyeTrace().Entity
			if CLIENT then return end
			if IsValid(ent) then
				local coachs = {}
				for _, pl in ipairs(player.GetAll()) do
					if pl:TSIsSportCoach() then
						table.insert(coachs, pl)
					end
				end

				if ent:GetClass() == "diablos_turnstile_button" and ent.typeButton == "forward" then
					if ply:TSHasTrainingSubscription() or not Diablos.TS.SubSystem or (not Diablos.TS.PurchaseSubWithoutCoach and #coachs == 0) then
						ent:AccessForward(ply)
						Diablos.TS:Notify(ply, 0, Diablos.TS:GetLanguageString("sportBadgeVerified"))
					elseif ply:TSHasTrainingBadgeCredit() then
						ply:TSUseBadgeCredit()
						ent:AccessForward(ply)
						Diablos.TS:Notify(ply, 0, Diablos.TS:GetLanguageString("sportBadgeVerified"))
					else
						Diablos.TS:Notify(ply, 1, Diablos.TS:GetLanguageString("sportBadgeInvalid"))
						ent:NFCError()
					end
					
				elseif ent:GetClass() == "diablos_card_reader" then

					if not ply:TSCanPurchaseTrainingSubscription() then
						Diablos.TS:Notify(ply, 2, string.format(Diablos.TS:GetLanguageString("cardReaderFullyRecharged"), os.date(Diablos.TS:GetOSFormat(), ply:TSGetTrainingSubscription())))
						return
					end

					net.Start("TPTSA:CardReaderPurchase")
						net.WriteEntity(ent)
						net.WriteUInt(ent:GetSubPrice(), 16)
						net.WriteUInt(#coachs, 8)
						for _, pl in pairs(coachs) do
							net.WriteEntity(pl)
						end
					net.Send(ply)

				end
			end
		end
	end)
end

function SWEP:SecondaryAttack()
	if not IsFirstTimePredicted() then return end

	self:PrimaryAttack()
end


function SWEP:Deploy()
end

function SWEP:OnRestore() end

function SWEP:IsValidSub()
	return self:GetOwner():TSHasTrainingSubscription()
end

-- Almost the default function but using a SetMaterial instead of a SetTexture
-- https://wiki.facepunch.com/gmod/WEAPON:DrawWeaponSelection
function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	-- Set us up the texture
	surface.SetDrawColor( 255, 255, 255, alpha )
	surface.SetMaterial( Diablos.TS.Materials.sportbadgeRecto )

	-- Lets get a sin wave to make it bounce
	local fsin = 0

	if ( self.BounceWeaponIcon == true ) then
		fsin = math.sin( CurTime() * 10 ) * 5
	end

	-- Borders
	y = y + 40
	x = x + 40
	wide = wide - 80

	-- Draw that mother
	surface.DrawTexturedRect( x + (fsin), y - (fsin),  wide-fsin*2 , ( wide / 2 ) + (fsin) )

	-- Draw weapon info box
	self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )
end
--PATH gamemodes/mangarp/entities/weapons/door_ram/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Slot = 5
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server
DEFINE_BASECLASS("weapon_cs_base2")

SWEP.PrintName = "Battering Ram"
SWEP.Author = "DarkRP Developers"
SWEP.Instructions = "Left click to break open doors/unfreeze props or get people out of their vehicles\nRight click to raise"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPDoorRam = true

SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/c_rpg.mdl")
SWEP.WorldModel = Model("models/weapons/w_rocket_launcher.mdl")
SWEP.AnimPrefix = "rpg"

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
SWEP.Secondary.DefaultClip = 0     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false     -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""

--[[---------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------]]
function SWEP:Initialize()
    if CLIENT then self.LastIron = CurTime() end
    self:SetHoldType("normal")
end

function SWEP:Holster()
    self:SetIronsights(false)

    return true
end

-- Check whether an object of this player can be rammed
local function canRam(ply)
    return IsValid(ply) and (ply.warranted == true or ply:isWanted() or ply:isArrested())
end

-- Ram action when ramming a door
local function ramDoor(ply, trace, ent)
    if ply:EyePos():DistToSqr(trace.HitPos) > 2025 or (not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) then return false end

    local allowed = false

    -- if we need a warrant to get in
    if GAMEMODE.Config.doorwarrants and ent:isKeysOwned() and not ent:isKeysOwnedBy(ply) then
        -- if anyone who owns this door has a warrant for their arrest
        -- allow the police to smash the door in
        for _, v in ipairs(player.GetAll()) do
            if ent:isKeysOwnedBy(v) and canRam(v) then
                allowed = true
                break
            end
        end
    else
        -- door warrants not needed, allow warrantless entry
        allowed = true
    end

    -- Be able to open the door if any member of the door group is warranted
    local keysDoorGroup = ent:getKeysDoorGroup()
    if GAMEMODE.Config.doorwarrants and keysDoorGroup then
        local teamDoors = RPExtraTeamDoors[keysDoorGroup]
        if teamDoors then
            allowed = false
            for _, v in ipairs(player.GetAll()) do
                if table.HasValue(teamDoors, v:Team()) and canRam(v) then
                    allowed = true
                    break
                end
            end
        end
    end

    if CLIENT then return allowed end

    -- Do we have a warrant for this player?
    if not allowed then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase("warrant_required"))

        return false
    end

    ent:keysUnLock()
    ent:Fire("open", "", .6)
    ent:Fire("setanimation", "open", .6)

    return true
end

-- Ram action when ramming a vehicle
local function ramVehicle(ply, trace, ent)
    if ply:EyePos():DistToSqr(trace.HitPos) > 10000 then return false end

    if CLIENT then return false end -- Ideally this would return true after ent:GetDriver() check

    local driver = ent:GetDriver()
    if not IsValid(driver) or not driver.ExitVehicle then return false end

    driver:ExitVehicle()
    ent:keysLock()

    return true
end

-- Ram action when ramming a fading door
local function ramFadingDoor(ply, trace, ent)
    if ply:EyePos():DistToSqr(trace.HitPos) > 10000 then return false end

    local Owner = ent:CPPIGetOwner()

    if CLIENT then return canRam(Owner) end

    if not canRam(Owner) then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase("warrant_required"))
        return false
    end

    if not ent.fadeActive then
        ent:fadeActivate()
        timer.Simple(5, function() if IsValid(ent) and ent.fadeActive then ent:fadeDeactivate() end end)
    end

    return true
end

-- Ram action when ramming a frozen prop
local function ramProp(ply, trace, ent)
    if ply:EyePos():DistToSqr(trace.HitPos) > 10000 then return false end
    if ent:GetClass() ~= "prop_physics" then return false end

    local Owner = ent:CPPIGetOwner()

    if CLIENT then return canRam(Owner) end

    if not canRam(Owner) then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase(GAMEMODE.Config.copscanunweld and "warrant_required_unweld" or "warrant_required_unfreeze"))
        return false
    end

    if GAMEMODE.Config.copscanunweld then
        constraint.RemoveConstraints(ent, "Weld")
    end

    if GAMEMODE.Config.copscanunfreeze then
        ent:GetPhysicsObject():EnableMotion(true)
    end

    return true
end

-- Decides the behaviour of the ram function for the given entity
local function getRamFunction(ply, trace)
    local ent = trace.Entity

    if not IsValid(ent) then return fp{fn.Id, false} end

    local override = hook.Call("canDoorRam", nil, ply, trace, ent)

    return
        override ~= nil     and fp{fn.Id, override}                                 or
        ent:isDoor()        and fp{ramDoor, ply, trace, ent}                        or
        ent:IsVehicle()     and fp{ramVehicle, ply, trace, ent}                     or
        ent.fadeActivate    and fp{ramFadingDoor, ply, trace, ent}                  or
        ent:GetPhysicsObject():IsValid() and not ent:GetPhysicsObject():IsMoveable()
                                         and fp{ramProp, ply, trace, ent}           or
        fp{fn.Id, false} -- no ramming was performed
end

--[[---------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------]]
function SWEP:PrimaryAttack()
    if not self:GetIronsights() then return end

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    self:SetNextPrimaryFire(CurTime() + 0.1)

    Owner:LagCompensation(true)
    local trace = Owner:GetEyeTrace()
    Owner:LagCompensation(false)

    local hasRammed = getRamFunction(Owner, trace)()

    if SERVER then
        hook.Call("onDoorRamUsed", GAMEMODE, hasRammed, Owner, trace)
    end

    if not hasRammed then return end

    self:SetNextPrimaryFire(CurTime() + 2.5)

    self:SetTotalUsedMagCount(self:GetTotalUsedMagCount() + 1)

    Owner:SetAnimation(PLAYER_ATTACK1)
    Owner:EmitSound(self.Sound)
    Owner:ViewPunch(Angle(-10, math.Round(util.SharedRandom("DarkRP_DoorRam" .. self:EntIndex() .. "_" .. self:GetTotalUsedMagCount(), -5, 5)), 0))
end

function SWEP:SecondaryAttack()
    if CLIENT then self.LastIron = CurTime() end
    self:SetNextSecondaryFire(CurTime() + 0.30)
    self:SetIronsights(not self:GetIronsights())
    if self:GetIronsights() then
        self:SetHoldType("rpg")
    else
        self:SetHoldType("normal")
    end
end

function SWEP:GetViewModelPosition(pos, ang)
    local Mul = 1

    if self.LastIron > CurTime() - 0.25 then
        Mul = math.Clamp((CurTime() - self.LastIron) / 0.25, 0, 1)
    end

    if self:GetIronsights() then
        Mul = 1-Mul
    end

    ang:RotateAroundAxis(ang:Right(), - 15 * Mul)
    return pos,ang
end

DarkRP.hookStub{
    name = "canDoorRam",
    description = "Called when a player attempts to ram something. Use this to override ram behaviour or to disallow ramming.",
    parameters = {
        {
            name = "ply",
            description = "The player using the door ram.",
            type = "Player"
        },
        {
            name = "trace",
            description = "The trace containing information about the hit position and ram entity.",
            type = "table"
        },
        {
            name = "ent",
            description = "Short for the entity that is about to be hit by the door ram.",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "override",
            description = "Return true to override behaviour, false to disallow ramming and nil (or no value) to defer the decision.",
            type = "boolean"
        }
    },
    realm = "Shared"
}

if SERVER then
    DarkRP.hookStub{
        name = "onDoorRamUsed",
        description = "Called when the door ram has been used.",
        parameters = {
            {
                name = "success",
                description = "Whether the door ram has been successful in ramming.",
                type = "boolean"
            },
            {
                name = "ply",
                description = "The player that used the door ram.",
                type = "Player"
            },
            {
                name = "trace",
                description = "The trace containing information about the hit position and ram entity.",
                type = "table"
            }
        },
        returns = {

        }
    }
end

hook.Add("SetupMove", "DarkRP_DoorRamJump", function(ply, mv)
    local wep = ply:GetActiveWeapon()
    if not wep:IsValid() or wep:GetClass() ~= "door_ram" or not wep.GetIronsights or not wep:GetIronsights() then return end

    mv:SetButtons(bit.band(mv:GetButtons(), bit.bnot(IN_JUMP)))
end)

--PATH lua/weapons/drgbase_weapon/shared.lua:
SWEP.IsDrGWeapon = true

-- Misc --
SWEP.PrintName = ""
SWEP.Category = ""
SWEP.Author = ""
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions	= ""
SWEP.Spawnable = false
SWEP.AdminOnly = false

-- Looks --
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV	= 62
SWEP.ViewModelFlip = true
SWEP.ViewModelOffset = Vector(0, 0, 0)
SWEP.ViewModelAngle = Angle(0, 0, 0)
SWEP.UseHands = false
SWEP.ViewModel = ""
SWEP.WorldModel	= ""
SWEP.CSMuzzleFlashes = false
SWEP.CSMuzzleX = false

DrGBase.IncludeFile("misc.lua")
DrGBase.IncludeFile("primary.lua")
DrGBase.IncludeFile("secondary.lua")

function SWEP:Initialize()
	if SERVER then
		self:SetHoldType(self.HoldType)
	end
	self:_BaseInitialize()
	self:CustomInitialize()
end
function SWEP:_BaseInitialize() end
function SWEP:CustomInitialize() end

function SWEP:Think()
	self:_BaseThink()
	self:CustomThink()
end
function SWEP:_BaseThink() end
function SWEP:CustomThink() end

function SWEP:Reload()
	self:DefaultReload(ACT_VM_RELOAD)
end

if CLIENT then

	function SWEP:CalcViewModelView(vm, oldpos, oldang, pos, ang)
		local aimpos = pos +
		self.Owner:GetForward()*self.ViewModelOffset.x +
		self.Owner:GetUp()*self.ViewModelOffset.z
		if self.ViewModelFlip then
			aimpos = aimpos - self.Owner:GetRight()*self.ViewModelOffset.y
		else aimpos = aimpos + self.Owner:GetRight()*self.ViewModelOffset.y end
		local aimang = ang + self.ViewModelAngle
		return aimpos, aimang
	end

end

--PATH lua/weapons/drgbase_weapon/misc.lua:

function SWEP:ShootBullet(damage, num_bullets, aimcone)
	local bullet = {}
	bullet.Num = num_bullets
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(aimcone, aimcone, 0)
	bullet.Tracer	= 1
	bullet.Force = damage/10
	bullet.Damage	= damage
	bullet.AmmoType = "Pistol"
	bullet.Callback = function(ent, tr, dmg)
		dmg:SetAttacker(self.Owner)
		dmg:SetInflictor(self)
	end
	self.Owner:FireBullets(bullet)
	self:ShootEffects()
end

--PATH lua/weapons/gmod_tool/stools/drgbase_tool_notarget.lua:
TOOL.Tab = "DrGBase"
TOOL.Category = "Tools"
TOOL.Name = "#tool.drgbase_tool_notarget.name"
TOOL.BuildCPanel = function(panel)
	panel:Help("#tool.drgbase_tool_notarget.desc")
	panel:Help("#tool.drgbase_tool_notarget.0")
end

function TOOL:LeftClick(tr)
	if not IsValid(tr.Entity) then return false end
	if not tr.Entity.IsDrGNextbot then return false end
	if CLIENT then return true end
	local owner = self:GetOwner()
	tr.Entity:SetIgnored(owner, not tr.Entity:IsIgnored(owner))
	return true
end

if CLIENT then
	language.Add("tool.drgbase_tool_notarget.name", "Toggle Notarget")
	language.Add("tool.drgbase_tool_notarget.desc", "Disable/enable notarget for a nextbot.")
	language.Add("tool.drgbase_tool_notarget.0", "Left click to toggle notarget. (Green => Enabled / Red => Disabled)")

	local NOTARGET_CACHE = {}
	hook.Add("PreDrawHalos", "DrGBaseToolNoTargetHalos", function()
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "gmod_tool" then return end
		local tool = LocalPlayer():GetTool()
		if tool == nil or tool.Mode ~= "drgbase_tool_notarget" then return end
		local ent = ply:GetEyeTrace().Entity
		if not IsValid(ent) or not ent.IsDrGNextbot then return end
		if NOTARGET_CACHE[ent] ~= nil then halo.Add({ent}, NOTARGET_CACHE[ent] and DrGBase.CLR_GREEN or DrGBase.CLR_RED) end
		ent:IsIgnored(ply, function(ent, ignored) NOTARGET_CACHE[ent] = ignored end)
	end)
end

--PATH gamemodes/mangarp/entities/weapons/gmod_tool/stools/shareprops.lua:
TOOL.Category           = "Falco Prop Protection"
TOOL.Name               = "Share props"
TOOL.Command            = nil
TOOL.ConfigName         = ""

function TOOL:RightClick(trace)
    local ent = trace.Entity
    if not IsValid(ent) or CLIENT then return true end

    ent.SharePhysgun1 = nil
    ent.ShareGravgun1 = nil
    ent.SharePlayerUse1 = nil
    ent.ShareEntityDamage1 = nil
    ent.ShareToolgun1 = nil

    ent.AllowedPlayers = nil
    return true
end

function TOOL:LeftClick(trace)
    local ent = trace.Entity
    if not IsValid(ent) or CLIENT then return true end

    local ply = self:GetOwner()

    local Physgun = ent.SharePhysgun1 or false
    local GravGun = ent.ShareGravgun1 or false
    local PlayerUse = ent.SharePlayerUse1 or false
    local Damage = ent.ShareEntityDamage1 or false
    local Toolgun = ent.ShareToolgun1 or false

    -- This big usermessage will be too big if you select 63 players, since that will not happen I can't be arsed to solve it
    umsg.Start("FPP_ShareSettings", ply)
        umsg.Entity(ent)
        umsg.Bool(Physgun)
        umsg.Bool(GravGun)
        umsg.Bool(PlayerUse)
        umsg.Bool(Damage)
        umsg.Bool(Toolgun)
        if ent.AllowedPlayers then
            umsg.Long(#ent.AllowedPlayers)
            for k,v in pairs(ent.AllowedPlayers) do
                umsg.Entity(v)
            end
        end
    umsg.End()
    return true
end

if CLIENT then
    language.Add("Tool.shareprops.name", "Share tool")
    language.Add("Tool.shareprops.desc", "Change sharing settings per prop")
    language.Add("Tool.shareprops.0", "Left click: shares a prop. Right click unshares a prop")
end

--PATH addons/sl_main_system/lua/weapons/mad_asso_detecteur/shared.lua:
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

SWEP.PrintName 		      = "Portail : Détecteur" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ShowWorldModel         = true
SWEP.AutoSwitchTo 	      = false 
SWEP.AutoSwitchFrom       = true 
SWEP.DrawAmmo             = false 
SWEP.Base                 = "weapon_base" 
SWEP.Slot 			      = 0
SWEP.SlotPos              = 0
SWEP.DrawCrosshair        = true 
SWEP.Weight               = 0 

SWEP.Category             = "[UTIL - MAD]"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "None"

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic   	= true
SWEP.Secondary.Ammo         = "none"

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Initialize()
    self.Weapon:SetHoldType( "slam" )
end

function SWEP:Deploy()
    self.Weapon:SetHoldType( "slam" )
end

-----------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton10/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_baton10/shared.lua:
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

SWEP.PrintName 		      = "10 : Baton royal" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/baton6.mdl"
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
SWEP.BonusDegats = 82

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_baton15/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague11/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_dague5/shared.lua:
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

SWEP.PrintName 		      = "5 : Dague du Crépuscule" 
SWEP.Author 		      = "Mad" 
SWEP.Instructions 	      = "" 
SWEP.Contact 		      = "" 
SWEP.AdminSpawnable       = true 
SWEP.Spawnable 		      = true 
SWEP.ViewModelFlip        = false
SWEP.ViewModelFOV 	      = 85
SWEP.ViewModel =            ""
SWEP.WorldModel = ""
SWEP.ModelArme = "models/mad_worldmodel/dague4.mdl"
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
SWEP.BonusDegats = 42

--------------------------------------------------------------------------
--PATH addons/sl_main_system/lua/weapons/mad_epee15/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee16/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_epee20/cl_init.lua:
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
--PATH addons/sl_main_system/lua/weapons/mad_marteau14/cl_init.lua:
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
--PATH lua/weapons/weapon_base/sh_anim.lua:
local ActIndex = {
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

--[[---------------------------------------------------------
   Name: SetWeaponHoldType
   Desc: Sets up the translation table, to translate from normal 
			standing idle pose, to holding weapon pose.
-----------------------------------------------------------]]
function SWEP:SetWeaponHoldType( t )

	t = string.lower( t )
	local index = ActIndex[ t ]
	
	if ( index == nil ) and !wOS.AnimExtension.TranslateHoldType[ t ] then
		Msg( "SWEP:SetWeaponHoldType - ActIndex[ \""..t.."\" ] isn't set! (defaulting to normal)\n" )
		t = "normal"
		index = ActIndex[ t ]		
	end
	
	if wOS.AnimExtension.TranslateHoldType[ t ] then 
		self.ActivityTranslate = table.Copy( wOS.AnimExtension.TranslateHoldType[ t ]:GetActivityList() )
	else
		self.ActivityTranslate = {}
		self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= index
		self.ActivityTranslate [ ACT_MP_WALK ] 						= index+1
		self.ActivityTranslate [ ACT_MP_RUN ] 						= index+2
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= index+3
		self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= index+4
		self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= index+5
		self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
		self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= index+6
		self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= index+6
		self.ActivityTranslate [ ACT_MP_JUMP ] 						= index+7
		self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
		self.ActivityTranslate [ ACT_MP_SWIM ] 						= index+9	
	end
	
	-- "normal" jump animation doesn't exist
	if t == "normal" then
		self.ActivityTranslate [ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end

	self:SetupWeaponHoldTypeForAI( t )

end

-- Default hold pos is the pistol
SWEP:SetWeaponHoldType( "pistol" )

--[[---------------------------------------------------------
   Name: weapon:TranslateActivity( )
   Desc: Translate a player's Activity into a weapon's activity
		 So for example, ACT_HL2MP_RUN becomes ACT_HL2MP_RUN_PISTOL
		 Depending on how you want the player to be holding the weapon
-----------------------------------------------------------]]
function SWEP:TranslateActivity( act )

	if ( self.Owner:IsNPC() ) then
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
--PATH lua/autorun/sh_mas_fistsofreprisal_fonts.lua:
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

if CLIENT then
	surface.CreateFont( "MaranzoAbil_UltimateFont", {
		font = "Arial",
		extended = false,
		size = 48,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		shadow = false
	} )
	surface.CreateFont( "MaranzoAbil_DefaultFont", {
		font = "DermaDefaultBold",
		extended = false,
		size = 24,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		shadow = false
	} )
end
--PATH gamemodes/mangarp/entities/weapons/weapon_pumpshotgun2/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Author = "DarkRP Developers"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
    SWEP.IconLetter = "k"

    killicon.AddFont("weapon_pumpshotgun2", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255))
end

DEFINE_BASECLASS("weapon_cs_base2")

SWEP.PrintName = "Pump Shotgun"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Weapon)"

SWEP.ViewModel = "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.HoldType = "shotgun"
SWEP.LoweredHoldType = "normal"

SWEP.Primary.Sound = Sound("Weapon_M3.Single")
SWEP.Primary.Recoil = 1.5
SWEP.Primary.Damage = 20
SWEP.Primary.NumShots = 8
SWEP.Primary.Cone = 0.08
SWEP.Primary.ClipSize = 8
SWEP.Primary.Delay = 0.95
SWEP.Primary.DefaultClip = 8
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector(-7.64, -8, 3.56)
SWEP.IronSightsAng = Vector(-0.1, 0.02, 0)

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Float 0 = IronsightsTime
    -- Float 1 = LastPrimaryAttack
    -- Float 2 = ReloadEndTime
    -- Float 3 = BurstTime
    self:NetworkVar("Float", 4, "QueuedAttackTime")
    -- Bool 0 = IronsightsPredicted
    -- Bool 1 = Reloading
    self:NetworkVar("Bool", 2, "AttackQueued")
end

function SWEP:Deploy()
    self:SetAttackQueued(false)

    return BaseClass.Deploy(self)
end

function SWEP:Holster()
    self:SetAttackQueued(false)

    return BaseClass.Holster(self)
end

function SWEP:PrimaryAttack()
    if self:GetAttackQueued() then return end

    if self:GetReloading() then
        self:SetAttackQueued(true) -- this way it doesn't interupt the reload animation
        return
    end

    BaseClass.PrimaryAttack(self)
end

function SWEP:Reload()
    -- Already reloading
    if self:GetReloading() then return end

    -- Start reloading if we can
    if self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0 then
        self:SetReloading(true)
        self:SetReloadEndTime(CurTime() + 0.3)
        self:SendWeaponAnim(ACT_VM_RELOAD)
        self:SetIronsights(false)
        self:SetHoldType(self.HoldType)
        self:GetOwner():SetAnimation(PLAYER_RELOAD)
        self:SetHoldType("normal")
    end
end

function SWEP:Think()
    self:CalcViewModel()
    if self:GetReloadEndTime() ~= 0 and CurTime() >= self:GetReloadEndTime() then
        -- Finished reload -
        if self:Clip1() >= self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then
            self:SetReloading(false)
            self:SetReloadEndTime(0)
            self:SetAttackQueued(false)
            return
        end

        if self:GetAttackQueued() then
            self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
            self:SetReloading(false)
            self:SetReloadEndTime(0)
            self:SetAttackQueued(false)
            self:SetQueuedAttackTime(CurTime() + 0.8)
            return
        end

        -- Next cycle
        self:SetReloadEndTime(CurTime() + 0.3)
        self:SendWeaponAnim(ACT_VM_RELOAD)

        -- Add ammo
        self:GetOwner():RemoveAmmo(1, self.Primary.Ammo, false)
        self:SetClip1(self:Clip1() + 1)

        -- Finish filling, final pump
        if self:Clip1() >= self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then
            self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
        end
    end
    if self:GetQueuedAttackTime() ~= 0 and CurTime() >= self:GetQueuedAttackTime() then
        self:SetQueuedAttackTime(0)
        self:PrimaryAttack()
    end
end

--PATH gamemodes/mangarp/entities/weapons/weaponchecker/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.Slot = 1
    SWEP.SlotPos = 9
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.Author = "DarkRP Developers"
SWEP.Instructions = "Left click to weapon check\nRight click to confiscate weapons\nReload to give back the weapons"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPWeaponChecker = true

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"

SWEP.PrintName = "Weapon Checker"
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

SWEP.MinCheckTime = 5
SWEP.MaxCheckTime = 10

DarkRP.hookStub{
    name = "playerWeaponsChecked",
    description = "Called when a player with a weapon checker has checked another player's weapons. Note: Only called when the player looks at the weapons without confiscating. Please see playerWeaponsConfiscated for when weapons are actually confiscated.",
    parameters = {
        {
            name = "checker",
            description = "The player holding the weapon checker.",
            type = "Player"
        },
        {
            name = "target",
            description = "The player whose weapons have been checked.",
            type = "Player"
        },
        {
            name = "weapons",
            description = "The weapons that have been checked.",
            type = "table"
        },
    },
    returns = {},
    realm = "Shared"
}

DarkRP.hookStub{
    name = "playerWeaponsReturned",
    description = "Called when a player with a weapon checker has returned another player's weapons.",
    parameters = {
        {
            name = "checker",
            description = "The player holding the weapon checker.",
            type = "Player"
        },
        {
            name = "target",
            description = "The player whose weapons have been returned.",
            type = "Player"
        },
        {
            name = "weapons",
            description = "The weapons that have been returned.",
            type = "table"
        },
    },
    returns = {},
    realm = "Server"
}

DarkRP.hookStub{
    name = "playerWeaponsConfiscated",
    description = "Called when a player with a weapon checker has confiscated another player's weapons.",
    parameters = {
        {
            name = "checker",
            description = "The player holding the weapon checker.",
            type = "Player"
        },
        {
            name = "target",
            description = "The player whose weapons have been confiscated.",
            type = "Player"
        },
        {
            name = "weapons",
            description = "The weapons that have been confiscated.",
            type = "table"
        },
    },
    returns = {},
    realm = "Server"
}

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "IsWeaponChecking")
    self:NetworkVar("Float", 0, "StartCheckTime")
    self:NetworkVar("Float", 1, "EndCheckTime")
    self:NetworkVar("Float", 2, "NextSoundTime")
    self:NetworkVar("Int", 0, "TotalWeaponChecks")
end

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:Deploy()
    return true
end

function SWEP:DrawWorldModel()
end

function SWEP:PreDrawViewModel(vm)
    return true
end

function SWEP:GetStrippableWeapons(ent, callback)
    CAMI.PlayerHasAccess(ent, "DarkRP_GetAdminWeapons", function(access)
        for _, v in ipairs(ent:GetWeapons()) do
            local class = v:GetClass()

            if GAMEMODE.Config.weaponCheckerHideDefault and (table.HasValue(GAMEMODE.Config.DefaultWeapons, class) or
                access and table.HasValue(GAMEMODE.Config.AdminWeapons, class) or
                ent:getJobTable() and ent:getJobTable().weapons and table.HasValue(ent:getJobTable().weapons, class)) then
                continue
            end

            if (GAMEMODE.Config.weaponCheckerHideNoLicense and GAMEMODE.NoLicense[class]) or GAMEMODE.Config.noStripWeapons[class] then continue end

            callback(v)
        end
    end)
end

function SWEP:PrimaryAttack()
    if self:GetIsWeaponChecking() then return end
    self:SetNextPrimaryFire(CurTime() + 0.3)

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    Owner:LagCompensation(true)
    local trace = Owner:GetEyeTrace()
    Owner:LagCompensation(false)

    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(Owner:GetPos()) > 10000 then
        return
    end

    self:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)
    self:SetNextSoundTime(CurTime() + 0.3)

    if not IsFirstTimePredicted() then return end

    local weps = {}
    self:GetStrippableWeapons(ent, function(wep)
        table.insert(weps, wep)
    end)

    hook.Call("playerWeaponsChecked", nil, Owner, ent, weps)

    if not CLIENT then return end

    self:PrintWeapons(ent, DarkRP.getPhrase("persons_weapons", ent:Nick()))
end

function SWEP:SecondaryAttack()
    if self:GetIsWeaponChecking() then return end
    self:SetNextSecondaryFire(CurTime() + 0.3)

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    Owner:LagCompensation(true)
    local trace = Owner:GetEyeTrace()
    Owner:LagCompensation(false)

    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(Owner:GetPos()) > 10000 then
        return
    end

    self:SetIsWeaponChecking(true)
    self:SetStartCheckTime(CurTime())
    self:SetEndCheckTime(CurTime() + util.SharedRandom("DarkRP_WeaponChecker" .. self:EntIndex() .. "_" .. self:GetTotalWeaponChecks(), self.MinCheckTime, self.MaxCheckTime))
    self:SetTotalWeaponChecks(self:GetTotalWeaponChecks() + 1)

    self:SetNextSoundTime(CurTime() + 0.5)

    if CLIENT then
        self.Dots = ""
        self.NextDotsTime = CurTime() + 0.5
    end
end

function SWEP:Reload()
    if CLIENT or CurTime() < (self.NextReloadTime or 0) then return end
    self.NextReloadTime = CurTime() + 1

    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    local trace = Owner:GetEyeTrace()

    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(Owner:GetPos()) > 10000 then
        return
    end

    if not ent.ConfiscatedWeapons then
        DarkRP.notify(Owner, 1, 4, DarkRP.getPhrase("no_weapons_confiscated", ent:Nick()))
        return
    else
        ent:RemoveAllAmmo()
        for _, v in pairs(ent.ConfiscatedWeapons) do
            local wep = ent:Give(v.class, true)

            -- :Give returns NULL when the player already has the weapon
            wep = IsValid(wep) and wep or ent:GetWeapon(v.class)
            if not IsValid(wep) then continue end

            ent:GiveAmmo(v.primaryAmmoCount, v.primaryAmmoType, true)
            ent:GiveAmmo(v.secondaryAmmoCount, v.secondaryAmmoType, true)

            wep:SetClip1(v.clip1)
            wep:SetClip2(v.clip2)

        end
        DarkRP.notify(Owner, 2, 4, DarkRP.getPhrase("returned_persons_weapons", ent:Nick()))

        hook.Call("playerWeaponsReturned", nil, Owner, ent, ent.ConfiscatedWeapons)
        ent.ConfiscatedWeapons = nil
    end
end

function SWEP:Holster()
    self:SetIsWeaponChecking(false)
    self:SetNextSoundTime(0)
    return true
end

function SWEP:Succeed()
    if not IsValid(self:GetOwner()) then return end
    self:SetIsWeaponChecking(false)

    local trace = self:GetOwner():GetEyeTrace()
    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() then return end

    if CLIENT then
        if not IsFirstTimePredicted() then return end
        self:PrintWeapons(ent, DarkRP.getPhrase("confiscated_these_weapons"))
        return
    end

    local stripped = {}

    self:GetStrippableWeapons(ent, function(wep)
        ent:StripWeapon(wep:GetClass())
        stripped[wep:GetClass()] = {
            class = wep:GetClass(),
            primaryAmmoCount = ent:GetAmmoCount(wep:GetPrimaryAmmoType()),
            primaryAmmoType = wep:GetPrimaryAmmoType(),
            secondaryAmmoCount = ent:GetAmmoCount(wep:GetSecondaryAmmoType()),
            secondaryAmmoType = wep:GetSecondaryAmmoType(),
            clip1 = wep:Clip1(),
            clip2 = wep:Clip2()
        }
    end)

    if not ent.ConfiscatedWeapons then
        if next(stripped) ~= nil then ent.ConfiscatedWeapons = stripped end
    else
        -- Merge stripped weapons into confiscated weapons
        for k,v in pairs(stripped) do
            if ent.ConfiscatedWeapons[k] then continue end

            ent.ConfiscatedWeapons[k] = v
        end
    end

    hook.Call("playerWeaponsConfiscated", nil, self:GetOwner(), ent, ent.ConfiscatedWeapons)

    if next(stripped) ~= nil then
        self:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)
        self:SetNextSoundTime(CurTime() + 0.3)
    else
        self:EmitSound("ambient/energy/zap1.wav", 50, 100)
        self:SetNextSoundTime(0)
    end
end

function SWEP:PrintWeapons(ent, weaponsFoundPhrase)
    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    local result = {}
    local weps = {}
    self:GetStrippableWeapons(ent, function(wep)
        table.insert(weps, wep)
    end)

    for _, wep in ipairs(weps) do
        table.insert(result, wep:GetPrintName() and language.GetPhrase(wep:GetPrintName()) or wep:GetClass())
    end

    result = table.concat(result, ", ")

    if result == "" then
        Owner:ChatPrint(DarkRP.getPhrase("no_illegal_weapons", ent:Nick()))
        return
    end

    Owner:ChatPrint(weaponsFoundPhrase)
    if string.len(result) >= 126 then
        local amount = math.ceil(string.len(result) / 126)
        for i = 1, amount, 1 do
            Owner:ChatPrint(string.sub(result, (i-1) * 126, i * 126 - 1))
        end
    else
        Owner:ChatPrint(result)
    end
end

function SWEP:Fail()
    self:SetIsWeaponChecking(false)
    self:SetHoldType("normal")
    self:SetNextSoundTime(0)
end

function SWEP:Think()
    local Owner = self:GetOwner()

    if not IsValid(Owner) then return end

    if self:GetIsWeaponChecking() and self:GetEndCheckTime() ~= 0 then
        Owner:LagCompensation(true)
        local trace = Owner:GetEyeTrace()
        Owner:LagCompensation(false)
        if not IsValid(trace.Entity) or trace.HitPos:DistToSqr(Owner:GetShootPos()) > 10000 or not trace.Entity:IsPlayer() then
            self:Fail()
        end
        if self:GetEndCheckTime() <= CurTime() then
            self:Succeed()
        end
    end
    if self:GetNextSoundTime() ~= 0 and CurTime() >= self:GetNextSoundTime() then
        if self:GetIsWeaponChecking() then
            self:SetNextSoundTime(CurTime() + 0.5)
            self:EmitSound("npc/combine_soldier/gear5.wav", 100, 100)
        else
            self:SetNextSoundTime(0)
            self:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)
        end
    end
    if CLIENT and self.NextDotsTime and CurTime() >= self.NextDotsTime then
        self.NextDotsTime = CurTime() + 0.5
        self.Dots = self.Dots or ""
        local len = string.len(self.Dots)
        local dots = {
            [0] = ".",
            [1] = "..",
            [2] = "...",
            [3] = ""
        }
        self.Dots = dots[len]
    end
end

local colorBackground = Color(10, 10, 10, 120)

function SWEP:DrawHUD()
    if self:GetIsWeaponChecking() and self:GetEndCheckTime() ~= 0 then
        self.Dots = self.Dots or ""
        local w = ScrW()
        local h = ScrH()
        local x, y, width, height = w / 2 - w / 10, h / 2, w / 5, h / 15
        local time = self:GetEndCheckTime() - self:GetStartCheckTime()
        local curtime = CurTime() - self:GetStartCheckTime()
        local status = math.Clamp(curtime / time, 0, 1)
        local BarWidth = status * (width - 16)
        local cornerRadius = math.Min(8, BarWidth / 3 * 2 - BarWidth / 3 * 2 % 2)

        draw.RoundedBox(8, x, y, width, height, colorBackground)
        draw.RoundedBox(cornerRadius, x + 8, y + 8, BarWidth, height - 16, Color(0, 0 + (status * 255), 255 - (status * 255), 255))
        draw.DrawNonParsedSimpleText(DarkRP.getPhrase("checking_weapons") .. self.Dots, "Trebuchet24", w / 2, y + height / 2, color_white, 1, 1)
    end
end

--PATH addons/sl_util_accessory/lua/entities/aas_model/shared.lua:
ENT.Base = "base_gmodentity" 
ENT.Type = "anim"
ENT.PrintName = "Model Changer"
ENT.Category = "Aldreya"
ENT.Author = "Kobralost"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/blues-decals/lua/entities/blues_decals/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Blue's Decals"
ENT.Author = "<CODE BLUE>"
ENT.Contact = "Via Steam"
ENT.Spawnable = true
ENT.Category = "Blue's Decals"
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "ImgurID" )
	self:NetworkVar( "Vector", 0, "ImageColor" )
	self:NetworkVar( "Vector", 1, "ImageScale" )
	self:NetworkVar( "Int", 0, "ImageAlpha")

	if SERVER then
		self:SetImageScale(Vector(1000, 1000, 0))
		self:SetImageAlpha(255)
		self:SetImageColor(Vector(255,255,255))
	end
end
--PATH lua/entities/bread2/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/bread-2.mdl")
	
end
--PATH lua/entities/bread4/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/bread-1.mdl")
	
end
--PATH lua/entities/chipstropical/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chips - Tropical"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A bag of Chips (Crisps if ya from Blighty)"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/ChipsTropical.mdl")
	
end
--PATH lua/entities/cocktailpine/shared.lua:
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
--PATH gamemodes/mangarp/entities/entities/darkrp_tip_jar/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
    self:initVars()
    self:initVarsClient()
end

function ENT:initVarsClient()
    self.colorBackground = Color(140, 0, 0, 100)
    self.colorText = color_white
    self.donateAnimColor = Color(20, 100, 20)

    self.rotationSpeed = 130
    self.rotationOffset = 0
    self:InitCsModel()

    self.firstDonateAnimation = nil
    self.lastDonateAnimation = nil
    self.donateAnimSpeed = 0.3
end

function ENT:InitCsModel()
    self.csModel = ClientsideModel(self.model)
    self.csModel:SetPos(self:GetPos())
    self.csModel:SetParent(self)
    self.csModel:SetModelScale(1.5, 0)
    self.csModel:SetNoDraw(true)
    self:CallOnRemove("csModel", fp{SafeRemoveEntity, self.csModel})
end

function ENT:Draw()
    local Pos = self:GetPos()
    local Ang = self:GetAngles()
    local sysTime = SysTime()
    local eyepos = EyePos()
    local planeNormal = Ang:Up()

    local rotAng = Angle(Ang)
    self.rotationOffset = sysTime % 360 * self.rotationSpeed
    rotAng:RotateAroundAxis(planeNormal, self.rotationOffset)

    -- Something about cs models getting removed on their own...
    if not IsValid(self.csModel) then
        self:InitCsModel()
    end
    self.csModel:SetPos(Pos)
    self.csModel:SetAngles(rotAng)
    if not self:IsDormant() then
        self.csModel:DrawModel()
    end


    local owner = self:Getowning_ent()
    owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")
    local title = DarkRP.getPhrase("tip_jar")

    surface.SetFont("HUDNumber5")
    local titleTextWidth, titleTextHeight = surface.GetTextSize(title)
    local ownerTextWidth = surface.GetTextSize(owner)

    Ang:RotateAroundAxis(Ang:Forward(), 90)

    -- The text can be considered to be "standing" on a plane with normal =
    -- Ang:Up(). The vector towards the player's EyePos is projected onto that
    -- plane, normalised and rotated to have the text face the user.
    local relativeEye = eyepos - Pos
    local relativeEyeOnPlane = relativeEye - planeNormal * relativeEye:Dot(planeNormal)
    local textAng = relativeEyeOnPlane:AngleEx(planeNormal)

    textAng:RotateAroundAxis(textAng:Up(), 90)
    textAng:RotateAroundAxis(textAng:Forward(), 90)


    cam.Start3D2D(Pos - Ang:Right() * 11.5 , textAng, 0.2)
        draw.WordBox(2, -titleTextWidth * 0.5, -72                      , title, "HUDNumber5", self.colorBackground, self.colorText)
        draw.WordBox(2, -ownerTextWidth * 0.5, -72 + titleTextHeight + 4, owner, "HUDNumber5", self.colorBackground, self.colorText)

        self:DrawAnims(sysTime)
    cam.End3D2D()
end

function ENT:DrawAnims(sysTime)
    local anim = self.firstDonateAnimation

    while anim do
        if anim.progress > 1 then
            anim = anim.nextDonateAnimation
            self.firstDonateAnimation = anim

            continue
        end

        draw.SimpleText(
            anim.amount,
            "DarkRP_tipjar",
            -anim.textWidth / 2,
            -100 - anim.progress * 200,
            ColorAlpha(self.donateAnimColor, Lerp(anim.progress, 1024, 0)),
            0
        )

        anim.progress = (sysTime - anim.start) * self.donateAnimSpeed

        anim = anim.nextDonateAnimation
    end

    if not self.firstDonateAnimation then
        self.lastDonateAnimation = nil
    end
end

function ENT:Donated(ply, amount)
    local txtAmount = DarkRP.formatMoney(amount)

    surface.SetFont("DarkRP_tipjar")

    local anim = {
        amount = txtAmount,
        start = SysTime(),
        textWidth = surface.GetTextSize(txtAmount),
        progress = 0,
        nextDonateAnimation = nil,
    }

    if self.lastDonateAnimation then
        self.lastDonateAnimation.nextDonateAnimation = anim
    else
        self.firstDonateAnimation = anim
    end

    self.lastDonateAnimation = anim

    self:AddDonation(ply:Nick(), amount)
end

-- Disable halos
function ENT:Think() end

--PATH addons/the_perfect_training_system/lua/entities/diablos_turnstile/shared.lua:
ENT.Base = "base_entity" 
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
ENT.PrintName		= "Turnstile"
ENT.Category		= "Diablos Addon" 
ENT.Instructions	= ""
ENT.Spawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "TrainingID")
end

function ENT:Think()
	self:NextThink( CurTime() )
	return true
end
--PATH addons/the_perfect_training_system/lua/entities/diablos_turnstile_button/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end


--PATH addons/the_perfect_training_system/lua/entities/diablos_turnstile_button/shared.lua:
ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AutomaticFrameAdvance = true
--PATH lua/entities/drg_roach_des_oh.lua:
if not DrGBase then return end
ENT.Base = "drg_roach_ds1_base"

-- Editables --
ENT.PrintName = "Old Hero"
ENT.Category = "Demon's Souls"
ENT.Models = {"models/roach/des/oldhero.mdl"}
ENT.CollisionBounds = Vector(15, 15, 90)
ENT.SpawnHealth = 4410*2
ENT.MeleeAttackRange = 125
ENT.Factions = {"FACTION_DS1_"}
ENT.EyeBone = "Neck"
ENT.PossessionBinds = {[IN_ATTACK] = {{coroutine = true,onkeydown = function(self)self:DS1_Melee()end}}}
ENT.HPBarOffset = 20
ENT.HPBarScale = 0.5

-- Blindness stuffs
ENT.EyeOffset = Vector(10, 0, 1)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.SightFOV = 360
ENT.SightRange = 7500
ENT.HearingCoefficient = 5
-- Blindness stuffs

if SERVER then
ENT.SOUND_EVTTABLE = {
	["step"] = {"roach/des/oh/step.wav"},
	["land"] = {"roach/des/oh/land.wav"},
	["vox_damage"] = {"",0,100,function(self)
		self:EmitSound("roach/des/oh/v_damage"..math.random(3)..".wav")
	end},
	["zimen"] = {"roach/des/oh/zimen.wav",0,100,function(self)ParticleEffect("ds3_watcher_impact",self:LocalToWorld(Vector(100,0,0)),Angle(0,0,0),nil)end},
	["ikaku"] = {"",0,100,function(self)
		self:EmitSound("roach/des/oh/v_ikaku.wav",511)
	end},
	["swing"] = {"roach/ds1/manus/c4500_jump.wav.mp3"},
	["sand"] = {"roach/des/oh/sand.wav"},
	["pullout"] = {"roach/des/oh/weapon_pullout.wav"},
	["kickup"] = {"roach/des/oh/kickup.wav",0,100,function(self)ParticleEffect("ds3_watcher_dirt_kickup",self:LocalToWorld(Vector(100,0,0)),Angle(0,0,0),nil)end},
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

-- Blindness stuffs
function ENT:OnContact(ent)
	self:SpotEntity(ent)
end
ENT.TableOfActivitiesThatMeanRunning = {
[ACT_RUN] = true,[ACT_RUN_AIM] = true,[ACT_RUN_CROUCH] = true,[ACT_RUN_CROUCH_AIM] = true,[ACT_RUN_PROTECTED] = true,		
[ACT_RUN_RELAXED] = true,[ACT_RUN_AIM_RELAXED] = true,[ACT_RUN_STIMULATED] = true,	[ACT_RUN_AIM_STIMULATED] = true,
[ACT_RUN_AGITATED] = true,[ACT_RUN_AIM_AGITATED] = true,[ACT_RUN_HURT] = true,[ACT_RUN_SCARED] = true,[ACT_RUN_ON_FIRE] = true,
[ACT_PLAYER_RUN_FIRE] = true,[ACT_RUN_RIFLE] = true,[ACT_RUN_AIM_RIFLE] = true,[ACT_RUN_RIFLE_RELAXED] = true,
[ACT_RUN_RIFLE_STIMULATED] = true,[ACT_RUN_CROUCH_RIFLE] = true,[ACT_RUN_CROUCH_AIM_RIFLE] = true,[ACT_RUN_RPG] = true,
[ACT_RUN_RPG_RELAXED] = true,[ACT_RUN_CROUCH_RPG] = true,[ACT_MP_RUN] = true,[ACT_MP_RUN_PRIMARY] = true,
[ACT_MP_RUN_SECONDARY] = true,[ACT_MP_RUN_MELEE] = true,[ACT_MP_RUN_BUILDING] = true,[ACT_MP_RUN_PDA] = true,[ACT_HL2MP_RUN] = true,
[1621] = true,[1622] = true,[1623] = true,[1624] = true,[1646] = true,[1655] = true,[1665] = true,[1675] = true,[1685] = true,
[1695] = true,[1705] = true,[1715] = true,[1789] = true,[1799] = true,[1809] = true,[1819] = true,[1829] = true,[1839] = true,
[1849] = true,[1859] = true,[1869] = true,[1879] = true,[1889] = true,[1962] = true,[1977] = true,[1987] = true,[1997] = true
}
function ENT:OnSight(ent)
	if self:HasEnemy() then return end
	if ((ent:IsPlayer() and ent:KeyDown(IN_SPEED) and ent:GetVelocity():Length() > 1) 
	or (not ent:IsPlayer() and self.TableOfActivitiesThatMeanRunning[ent:GetSequenceActivity(ent:GetSequence())]))
	and not self:HasEnemy() then
		self:EmitSound("roach/des/oh/v_ikaku.wav",511)
		self:SpotEntity(ent)
	end
end
function ENT:OnSound(ent, sound)
	if self:HasEnemy() then return end
	local ent = ent
	local sound = sound
	self:CallInCoroutine(function(self,delay)
		if delay > 0.1 then return end
		if self:HasEnemy() then return end
		local health = self:Health()
		if ent:IsPlayer() and not ent:KeyDown(IN_SPEED) and not self:HasEnemy() and ent:IsOnGround() then
			self.Curious = true
			self:EmitSound("roach/des/oh/v_2.wav",511)
			self:GoTo((isvector(sound.Pos) and sound.Pos or ent:GetPos()), 20, function(self)
				if !IsValid(ent) then return false end
				if self:HasEnemy() then return false end
				if self:IsPossessed() then return false end
				if self:Health() < health then return false end
				if self:IsDown() then return false end
				if self:IsDead() then return false end
			end)
			if !self:HasEnemy() then self:PlaySequenceAndMove("att"..math.random(5,6)) end
			self.Curious = false
		elseif not self:HasEnemy() then
			self:EmitSound("roach/des/oh/v_ikaku.wav",511)
			self:GoTo((isvector(sound.Pos) and sound.Pos or ent:GetPos()), 20, function(self)
				if !IsValid(ent) then return false end
				if self:HasEnemy() then return false end
				if self:IsPossessed() then return false end
				if self:Health() < health then return false end
				if self:IsDown() then return false end
				if self:IsDead() then return false end
			end)
		end
	end)
end
function ENT:ShouldRun()return self:HasEnemy() and not self.Curious end
-- Blindness stuffs

function ENT:DS1_Initialize()
	self:SetModelScale(1.5,0)
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self.ColA = 255
end
function ENT:DS1_OnLand()
	self:PlaySequenceAndMove("land")
end
function ENT:DS1_EventHook(e)
	if e[1] == "InvokeAttackBehaviour_Radial" then
		local dtype = DMG_CRUSH
		local range = 200
		self:BlastAttack({
			damage = self.SetupDamage*(range/10),
			range=range,
			type = dtype,
		})
	end
end
function ENT:DS1_Melee(enemy)
	local ma = math.random(20,40)
	local tbl = {
		[1] = {ma,DMG_CRUSH},[2] = {ma,DMG_CRUSH},[3] = {ma,bit.bor(DMG_CRUSH,DMG_BLAST)},
		[4] = {ma,DMG_BLAST},[5] = {ma,DMG_SLASH},[6] = {ma,DMG_CRUSH}
	}
	local m = math.random(6)
	self.SetupDamage = tbl[m][1]
	self.SetupType = tbl[m][2]
	self:DS1_Seq("att"..m)
end
function ENT:DS1_Range(enemy)return self:DS1_Melee(enemy) end
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
	elseif math.random(150) <= (10*(dmg:IsBulletDamage() and 3 or 9)) then
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
--PATH lua/entities/drgbase_entity.lua:
ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.IsDrGEntity = true

if SERVER then AddCSLuaFile() end
DrGBase.IncludeFile("drgbase/entity_helpers.lua")

local entMETA = FindMetaTable("Entity")

local old_tostring = entMETA.__tostring
function entMETA:__tostring()
	if self.IsDrGProjectile then
		return "Projectile ["..self:EntIndex().."]["..self:GetClass().."]"
	elseif self.IsDrGSpawner then
		return "Spawner ["..self:EntIndex().."]["..self:GetClass().."]"
	else return old_tostring(self) end
end

--PATH lua/entities/drgbase_nextbot_human/shared.lua:
ENT.Base = "drgbase_nextbot"
ENT.IsDrGNextbotHuman = true

-- AI --
ENT.BehaviourType = AI_BEHAV_HUMAN
ENT.RangeAttackRange = 1500
ENT.MeleeAttackRange = 0
ENT.ReachEnemyRange = 1000
ENT.AvoidEnemyRange = 750
ENT.AvoidAfraidOfRange = 500
ENT.WatchAfraidOfRange = 750

-- Movements/animations --
DrGBase.IncludeFile("animations.lua")
DrGBase.IncludeFile("movements.lua")

-- Climbing --
ENT.ClimbLadders = true
ENT.ClimbLaddersUp = true
ENT.ClimbLaddersUpMaxHeight = math.huge
ENT.ClimbLaddersUpMinHeight = 0
ENT.ClimbSpeed = 60
ENT.ClimbUpAnimation = ACT_ZOMBIE_CLIMB_UP
ENT.ClimbOffset = Vector(-14, 0, 0)

-- Detection --
ENT.EyeBone = "ValveBiped.Bip01_Head1"
ENT.EyeOffset = Vector(5, 0, 2.5)

-- Weapons --
ENT.UseWeapons = true
ENT.Weapons = {}
ENT.DropWeaponOnDeath = false
ENT.AcceptPlayerWeapons = true

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionPrompt = true
ENT.PossessionCrosshair = true
ENT.PossessionMovement = POSSESSION_MOVE_8DIR
ENT.PossessionViews = {
	{
		offset = Vector(0, 30, 20),
		distance = 100
	},
	{
		offset = Vector(7.5, 0, 2.5),
		distance = 0,
		eyepos = true
	}
}
ENT.PossessionBinds = {
	[IN_DUCK] = {{
		coroutine = false,
		onkeypressed = function(self)
			self:SetCrouching(not self:IsCrouching())
		end
	}},
	[IN_ATTACK] = {{
		coroutine = true,
		onkeydown = function(self)
			self:PrimaryFire()
		end
	}},
	[IN_ATTACK2] = {{
		coroutine = true,
		onkeydown = function(self)
			self:SecondaryFire()
		end
	}},
	[IN_RELOAD] = {{
		coroutine = true,
		onkeydown = function(self)
			self:Reload()
		end
	}}
}

if SERVER then
	AddCSLuaFile()

	-- Init/Think --

	function ENT:_BaseThink()
		if self:HasWeapon() then
			if self:IsPossessed() then
				local lockedOn = self:PossessionGetLockedOn()
				if not IsValid(lockedOn) then
					self:AimAt(self:PossessorTrace().HitPos)
				else self:AimAt(lockedOn) end
			elseif self:HasEnemy() and self:Visible(self:GetEnemy()) then
				self:AimAt(self:GetEnemy())
			else self:AimAt() end
		else self:AimAt() end
	end

	-- AI --

	function ENT:OnLastEnemy()
		if self:HasWeapon() and not self:IsWeaponFull() then self:Reload() end
	end

	-- Weapons --

	function ENT:PrimaryFire()
		if not self:HasWeapon() then return end
		return self:WeaponPrimaryFire(self:GetShootAnimation())
	end
	function ENT:SecondaryFire()
		if not self:HasWeapon() then return end
		return self:WeaponSecondaryFire(self:GetShootAnimation())
	end
	function ENT:Reload()
		if not self:HasWeapon() then return end
		return self:WeaponReload(self:GetReloadAnimation())
	end

	-- Hooks --

	function ENT:OnLandOnGround()
		self:EmitFootstep()
	end

	function ENT:OnAnimEvent(event)
		if event == "PlayerStep" then
			self:EmitFootstep()
		end
	end

end

--PATH lua/entities/egg2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Egg"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/egg2.mdl")
	
end
--PATH lua/entities/fish2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Raw Golden Trout"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A raw fish"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/fishgolden.mdl")
	
end
--PATH lua/entities/fruitcoconut2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Coconut (half)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/coconut_half.mdl")
	
end
--PATH lua/entities/fruitgrape2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Grapes"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/grapes2.mdl")
	
end
--PATH addons/gmod_info_board/lua/entities/gmib_board/shared.lua:
ENT.Type        = "anim"
ENT.Base        = "base_entity"
ENT.Category    = "GMod Info Board"
ENT.Spawnable   = false
ENT.PrintName   = "GMod Info Board"

function ENT:SetupDataTables()
	self:DTVar( "Entity", 1, "owning_ent" )
end

--PATH addons/sl_utils/lua/entities/gmod_contr_spawner/cl_init.lua:
include( "shared.lua" )

function ENT:Draw()
	self.BaseClass.Draw(self)
	self.Entity:DrawModel()
end

--PATH lua/entities/icecream5/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/IceCream5.mdl")
	
end
--PATH lua/entities/kindersurprisebox/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/kinderbox.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/lab_base/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
    self:initVars()
end

local color_red = Color(140, 0, 0, 100)
local color_white = color_white

function ENT:DrawTranslucent()
    self:DrawModel()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    local owner = self:Getowning_ent()
    owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

    surface.SetFont("HUDNumber5")
    local text = self.labPhrase
    local text2 = DarkRP.getPhrase("priceTag", DarkRP.formatMoney(self:Getprice()), "")
    local TextWidth = surface.GetTextSize(text)
    local TextWidth2 = surface.GetTextSize(text2)

    Ang:RotateAroundAxis(Ang:Forward(), 90)
    local TextAng = Ang

    TextAng:RotateAroundAxis(TextAng:Right(), CurTime() * -180)

    cam.Start3D2D(Pos + Ang:Right() * self.camMul, TextAng, 0.2)
        draw.WordBox(2, -TextWidth * 0.5 + 5, -30, text, "HUDNumber5", color_red, color_white)
        draw.WordBox(2, -TextWidth2 * 0.5 + 5, 18, text2, "HUDNumber5", color_red, color_white)
    cam.End3D2D()
end

--PATH addons/sl_main_system/lua/entities/magie_roll_sl/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Magie Rerolls"
ENT.Author					= "Buellos"
ENT.Category                = "NE - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH lua/entities/marabou3/shared.lua:
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

	self.Entity:SetModel("models/FoodNHouseholdItems/marabou3.mdl")
	
end
--PATH lua/entities/mcdburgerbox2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "McDonalds Cheeseburger (in box)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A double cheeseburger from McDonalds"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/mcdburgerboxclosed.mdl")
	
end
--PATH gamemodes/mangarp/entities/entities/meteor/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Meteor"
ENT.Author = "Rickster"
ENT.Contact = "Rickyman35@hotmail.com"
ENT.Spawnable = false

--PATH lua/entities/milk2/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Milk"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "A carton of milk"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/milk2.mdl")
	
end
--PATH addons/mc_quests/lua/entities/mqs_ent/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	if self:GetEnablePhys() then return end
	self:InitRenderModel()
end

function ENT:InitRenderModel()
	self.RenderModel = ClientsideModel(self:GetCModel())
	self.RenderModel:SetPos(self:GetPos())
	self.RenderModel:SetParent(self)
	self.RenderModel:SetMaterial(self:GetMaterial())
	self.RenderModel:SetColor(self:GetColor())
	self:CallOnRemove("RenderModel", function()
		SafeRemoveEntity(self.RenderModel)
	end)
end

local questarrows = {}

function ENT:Draw()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local planeNormal = Ang:Up()
	if Pos:DistToSqr(LocalPlayer():GetPos()) > MQS.Config.QuestEntDrawDist ^ 2 then return end

	if self:GetEnablePhys() then
		self:DrawModel()
	else
		local sysTime = SysTime()
		local rotAng = Angle(Ang)
		self.rotationOffset = sysTime % 360 * 130
		rotAng:RotateAroundAxis(planeNormal, self.rotationOffset)

		if not IsValid(self.RenderModel) then
			self:InitRenderModel()
		end

		self.RenderModel:SetPos(Pos)
		self.RenderModel:SetAngles(rotAng)
	end

	if self:GetTPly() ~= LocalPlayer() then return end

	if not self:GetShowPointer() then return end

	if not questarrows[self] then questarrows[self] = true end
end

function ENT:OnRemove()
	questarrows[self] = nil
end

hook.Add( "PostDrawTranslucentRenderables", "DrawQuestIndicators", function( bDepth, bSkybox )
	for ent, _ in pairs(questarrows) do
		if not IsValid(ent) then return end

		local Pos = ent:GetPos()
		local eye = EyeAngles()

		if Pos:DistToSqr(LocalPlayer():GetPos()) > MQS.Config.QuestEntDrawDist ^ 2 then return end

		local q = MQS.HasQuest(LocalPlayer())

		if not q then return end

		if MQS.Quests[q.quest].objects[MQS.GetNWdata(LocalPlayer(), "quest_objective") or 0].type ~= "Collect quest ents" then
			continue
		end

		local max = ent:OBBMaxs()
		Pos.z = Pos.z + max.z + (20 + math.sin(CurTime() * 2) * 5)

		cam.Start3D2D(Pos, Angle(0,eye.y - 90,90), 0.2)
			MSD.DrawTexturedRect(-23, -23, 48, 64, MSD.Icons48.arrow_down_color, color_white)
		cam.End3D2D()
	end
end)
--PATH addons/sl_main_system/lua/entities/npc_centipedeboss.lua:

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
ENT.PrintName = "Centipede Sablé"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_centipedeboss.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "boss"

-- Stats --
ENT.xp = 5000
ENT.money = 600000
ENT.Damage = 300
ENT.SpecialDamage = 500
ENT.SpawnHealth = 9000

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

    self.cdAttack = self.cdAttack or 0  -- Cooldown pour l'attaque normale
    self.cdSpecialAttack = self.cdSpecialAttack or 0  -- Cooldown pour l'attaque spéciale

    -- Vérifie si l'attaque spéciale est prête à être utilisée
    if self.cdSpecialAttack < CurTime() then
        self:OnSpecialAttack(enemy)  -- Appelle l'attaque spéciale
        return
    end

    -- Définir un délai d'attente aléatoire entre 1.5 et 3 secondes pour l'attaque normale
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
            end
        end)

        self:PlaySequenceAndMove("attack" .. math.random(2), 1, self.FaceEnemy)
    end
end

function ENT:OnSpecialAttack(enemy)
	if not IsValid(enemy) then return end
	if not IsValid(self) then return end
	self.cdSpecialAttack = CurTime() + 10  -- Cooldown de 10 secondes pour l'attaque spéciale

	if self:Health() < 1 then return end
	self:EmitSound("mad_sfx_sololeveling/bestial/roar2.mp3", 75, math.random(70, 80), 0.8, CHAN_AUTO)
	timer.Simple(0.001, function() ParticleEffect( "dust_conquer_charge", self:GetPos(), self:GetAngles(), self ) end)
	timer.Simple(0.001, function() ParticleEffect( "dust_sharp_shockwave", self:GetPos(), self:GetAngles(), self ) end)
	timer.Simple(0.001, function() ParticleEffect( "auraburst_sharp", self:GetPos(), self:GetAngles(), self ) end)

	local zone = ents.Create("mad_zone_radius")
	zone:SetNWInt("Radius", 5000)
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
			local entities = ents.FindInSphere(self:GetPos(), 500)  -- Trouver les entités dans un rayon de 330 unités
			for _, ent in pairs(entities) do
				if ent:IsPlayer() or ent:IsNPC() then
					ent:TakeDamage(self.SpecialDamage, self, self)
					timer.Simple(0.001, function()
						if ent:Health() <= 0 then
							local currentXP = ent:getDarkRPVar("xp") or 0
							-- Calcule 50% de l'XP
							local xpToRemove = currentXP * 0.1
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
	self:PlaySequenceAndMove("skill2", 1, self.FaceEnemy)
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

--PATH lua/entities/npc_drg_headcrab.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Headcrab"
ENT.Category = "DrGBase"
ENT.Models = {"models/headcrabclassic.mdl"}
ENT.CollisionBounds = Vector(12, 12, 24)
ENT.BloodColor = BLOOD_COLOR_GREEN

-- Stats --
ENT.SpawnHealth = 40

-- Sounds --
ENT.OnIdleSounds = {"NPC_HeadCrab.Idle"}
ENT.OnDamageSounds = {"NPC_HeadCrab.Pain"}
ENT.OnDeathSounds = {"NPC_HeadCrab.Die"}

-- AI --
ENT.RangeAttackRange = 150
ENT.MeleeAttackRange = 0
ENT.ReachEnemyRange = 125
ENT.AvoidEnemyRange = 100

-- Relationships --
ENT.Factions = {FACTION_ZOMBIES}

-- Animations --
ENT.WalkAnimation = ACT_RUN
ENT.RunAnimation = ACT_RUN
ENT.IdleAnimation = ACT_IDLE
ENT.JumpAnimation = ACT_IDLE

-- Movements --
ENT.UseWalkframes = true

-- Detection --
ENT.EyeBone = "HeadcrabClassic.SpineControl"
ENT.EyeOffset = Vector(4, 0, 0)

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionCrosshair = true
ENT.PossessionViews = {
	{
		offset = Vector(0, 10, 10),
		distance = 50
	},
	{
		offset = Vector(7.5, 0, 0),
		distance = 0,
		eyepos = true
	}
}
ENT.PossessionBinds = {
	[IN_ATTACK] = {{
		coroutine = true,
		onkeydown = function(self)
			self:HeadcrabLeap(self:PossessorTrace().HitPos)
		end
	}}
}

if SERVER then

	-- Headcrab --

	function ENT:HeadcrabLeap(pos)
		self:FaceTo(pos)
		self.OnIdleSounds = {}
		self:PlaySequence("jumpattack_broadcast")
		self:PauseCoroutine(0.5)
		self.CanBite = true
		self:EmitSound("NPC_Headcrab.Attack")
		self:Leap(pos, 400)
		self.CanBite = false
		self.OnIdleSounds = {"NPC_HeadCrab.Idle"}
	end

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetDefaultRelationship(D_HT)
	end
	function ENT:CustomThink() end

	-- AI --

	function ENT:OnRangeAttack(enemy)
		self:HeadcrabLeap(enemy:EyePos()-Vector(0, 0, 10))
	end
	function ENT:OnContact(ent)
		if not IsValid(ent) then return end
		if self.CanBite and
		(self:IsPossessed() or ent == self:GetEnemy()) then
			self:EmitSound("NPC_HeadCrab.Bite")
			self.CanBite = false
			local dmg = DamageInfo()
			dmg:SetDamage(20)
			dmg:SetAttacker(self)
			dmg:SetInflictor(self)
			dmg:SetDamageType(DMG_SLASH)
			ent:TakeDamageInfo(dmg)
		end
	end

	function ENT:OnReachedPatrol(pos)
		self:Wait(math.random(3, 7))
	end
	function ENT:OnIdle()
		self:AddPatrolPos(self:RandomPos(1500))
	end

	-- Damage --

	function ENT:OnTakeDamage(dmg)
		local attacker = dmg:GetAttacker()
		if IsValid(attacker) and attacker:IsPlayer() then
			local weapon = attacker:GetActiveWeapon()
			if IsValid(weapon) and weapon:GetClass() == "weapon_crowbar" then
				return 2
			end
		end
	end

	-- Sounds --

	function ENT:OnNewEnemy()
		self:EmitSound("NPC_HeadCrab.Alert")
	end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH lua/entities/npc_drg_testsprite.lua:
if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot_sprite" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Test 2D Nextbot"
ENT.Category = "DrGBase"
ENT.CollisionBounds = Vector(10, 10, 100)

-- AI --
ENT.RangeAttackRange = 200
ENT.MeleeAttackRange = 0
ENT.ReachEnemyRange = 200
ENT.AvoidEnemyRange = 0

-- Animations --
ENT.SpriteFolder = "drgbase/stick_boi"
ENT.FramesPerSecond = 6
ENT.WalkAnimation = "walk"
ENT.WalkAnimRate = 0.5
ENT.RunAnimation = "walk"
ENT.IdleAnimation = "idle"
ENT.JumpAnimation = "jump"

-- Climbing --
ENT.ClimbLedges = true
ENT.ClimbProps = true
ENT.ClimbLadders = true
ENT.ClimbLaddersUp = true
ENT.ClimbLaddersDown = true
ENT.ClimbUpAnimation = "climb"
ENT.ClimbDownAnimation = "climb"
ENT.ClimbAnimRate = 0.5

-- Detection --
ENT.EyeOffset = Vector(0, 0, 30)

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_8DIR
ENT.PossessionViews = {
	{
		offset = Vector(0, 30, 20),
		distance = 100
	},
	{
		offset = Vector(5, 0, 0),
		distance = 0,
		eyepos = true
	}
}
ENT.PossessionBinds = {
	[IN_JUMP] = {{
		coroutine = false,
		onkeypressed = function(self)
			if not self:IsOnGround() then return end
			self:EmitFootstep()
			self:Jump()
		end
	}}
}

if SERVER then

	-- Init/Think --

	function ENT:CustomInitialize()
		self:SetSelfClassRelationship(D_HT)
		self:SetDefaultRelationship(D_HT, 2)
		self:SetPlayersRelationship(D_HT, 3)
		self:SpriteAnimEvent("walk", {1, 2}, function(self, frame)
			self:EmitFootstep()
		end)
		self:SpriteAnimEvent("climb", {1, 2}, function(self, frame)
			if self:IsClimbingLadder() then self:EmitSound("player/footsteps/ladder"..math.random(4)..".wav") end
		end)
		self:SetColor(Color(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
	end

	-- AI --

	function ENT:OnRangeAttack(enemy)
		self:PauseCoroutine(0.5)
		self:EmitFootstep()
		self:Jump()
	end
	function ENT:OnReachedPatrol()
		self:Wait(math.random(3, 7))
	end
	function ENT:OnIdle()
		self:AddPatrolPos(self:RandomPos(1500))
	end

	-- Sounds --

	function ENT:OnLandOnGround()
		self:EmitFootstep()
	end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

--PATH addons/realistichandcuffs/lua/entities/npc_jailer/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Category = "FibreRP NPC"

ENT.Spawnable = true
ENT.PrintName		= "Jailer NPC"
ENT.Author			= "ToBadForYou"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""
--PATH addons/sl_main_system/lua/entities/npc_lezard.lua:

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
ENT.PrintName = "Homme Lézard"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_lezardmob.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 5122
ENT.money = 100000
ENT.Damage = 275
ENT.SpawnHealth = 7500

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
		if self.cdAttack < CurTime() then
			self.cdAttack = CurTime() + 1
			if self:Health() < 1 then return end
			self:EmitSound( swing_attack[math.random(1,3)], 75, math.random(70, 130), 0.8, CHAN_AUTO )
			timer.Simple(0.7, function()
				if self:Health() < 1 then return end
				if IsValid(self) && IsValid(enemy) then
					if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 350 then
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
				
				local pos = self:GetBonePosition(self:LookupBone("Bip001_Head")) + Vector(0,0,self.HPBarOffset)
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

--PATH addons/sl_main_system/lua/entities/npc_orc.lua:

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
ENT.PrintName = "Orc"
ENT.Category = "SL - NPC"
ENT.Models = {"models/mad_highorcmob.mdl"}
ENT.BloodColor = BLOOD_COLOR_RED
ENT.CollisionBounds = Vector(30, 30, 60)
ENT.type = "mob"

-- Stats --
ENT.xp = 8000
ENT.money = 100000
ENT.Damage = 500
ENT.SpawnHealth = 9500

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
					if IsValid(self) && IsValid(enemy) && enemy:GetPos():Distance(self:GetPos()) < 350 then
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
			if math.random() <= 0.1 then
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

--PATH lua/entities/pancake_plate/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pancake"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/pancake.mdl")
	
end
--PATH addons/pcasino/lua/entities/pcasino_blackjack_table/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Blackjack Table"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "StartRoundIn")
end

function ENT:GetPadByName(padName)
	if not self.padCache then
		self:GetCurrentPad(Vector(0, 0, 0)) -- Generate the cache
	end

	for i, _ in ipairs(self.padCache) do
		for k, v in pairs(_) do
			if k == padName then
				return k, v
			end
		end
	end
end

PerfectCasino.Core.RegisterEntity("pcasino_blackjack_table", {
	-- Bet data
	bet = {
		default = {d = 500, t = "num"}, -- The default bet
		max = {d = 1000, t = "num"}, -- The default bet
		min = {d = 100, t = "num"}, -- The default bet
		iteration = {d = 100, t = "num"} -- The default bet
	},
	turn = {
		timeout = {d = 30, t = "num"}
	},
	payout = {
		win = {d = 1.5, t = "num"},
		blackjack = {d = 3, t = "num"}
	},
	general = {
		betPeriod = {d = 30, t = "num"} -- The default bet
	}
},
"models/freeman/owain_blackjack_table.mdl")
--PATH addons/pcasino/lua/entities/pcasino_sign_stand/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Sign Stand"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false

PerfectCasino.Core.RegisterEntity("pcasino_sign_stand", {
	-- General data
	general = {
		text = {d = "Casino", t = "string"} -- The text to show
	}
},
"models/freeman/owain_casinosign_standing.mdl")
--PATH lua/entities/pfx1_0a.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Cigarette/Pipe smoke"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]cig_smoke*"
--PATH lua/entities/pfx1_0d.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Lifting Smoke [Small]"
ENT.Category         = "PPE: Fire & Smoke"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[1]smoke_lifting_01"
--PATH lua/entities/pfx2_01.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Sparkle 2"
ENT.Category         = "PPE: Other"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[2]sparkle2"



--PATH lua/entities/pfx4_01~.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Blue Jet [Smokeless]"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_b*"

--PATH lua/entities/pfx4_02_s.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Smaller Red Jet"
ENT.Category         = "PPE: Tech"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[4]jet_r_s"
--PATH lua/entities/pfx5_00.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Black Hole"
ENT.Category         = "PPE: Cosmic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[5]black_hole"
--PATH lua/entities/pfx8_06.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "Magic Orb 2"
ENT.Category         = "PPE: Magic"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[8]orb_1"
--PATH lua/entities/pfx_base.lua:
--          CAT -> PPE: [Fire, Smoke, Weather, Tech, Nature, Cosmic, Other]
--          ENT -> PFX:[~]
AddCSLuaFile()
ENT.Author       = "The man who can even beat E1M1 on Nightmare on Nokia 3310 Java port and this person really thinks that nothing is easier than to beat E1M1 on Nighmare on Nokia 3310 Java port but he just hasn't tried to run Crysis on the calculator yet."
ENT.Type         = "anim"
ENT.Base         = "base_anim"
ENT.PrintName    = "Base"
ENT.Category     = "Particle Effects"
ENT.Spawnable    = false
ENT.AdminOnly    = false
ENT.pfxname      = "[*]pfx_test"
if SERVER then
    function ENT:Initialize()
        self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
        self:SetNoDraw(true) 
        self:SetSkin(1)      
		self:DrawShadow(false)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        ParticleEffectAttach(self.pfxname, 1, self, 1)
    end
end
--PATH lua/entities/pfxcom.lua:
AddCSLuaFile()
ENT.Type             = "anim"
ENT.Base             = "pfx_base"
ENT.PrintName        = "PFXCOM"
ENT.Category         = "PPE: Water"
ENT.Spawnable        = true
ENT.AdminOnly        = false
ENT.pfxname          = "[com]jet"
--PATH addons/sl_main_system/lua/entities/rang_roll_sl/shared.lua:
ENT.Type                    = "anim"
ENT.Base                    = "base_gmodentity"

ENT.PrintName				= "Rangs Rerolls"
ENT.Author					= "Buellost"
ENT.Category                = "NW - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH addons/sl_main_system/lua/entities/revendeur_item_sl/shared.lua:
ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Revendeur"
ENT.Author					= "Mad"
ENT.Category                = "Union - SL"
ENT.Instructions			= "Appuyez sur votre touche [USE]"
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
--PATH addons/realistichandcuffs/lua/entities/rhandcuffsent/cl_init.lua:
include('shared.lua')

net.Receive("rhc_sendcuffs", function()
	local Player, Cuffs = net.ReadEntity(), net.ReadEntity()
	
	Cuffs.CuffedPlayer = Player
end)

function ENT:Initialize()
	self.CSBoneMani = RHandcuffsConfig.BoneManipulateClientside
end

function ENT:Think ()	
end

function ENT:Draw()
	local owner = self.CuffedPlayer

	if owner == LocalPlayer() then return end	
	if !IsValid(owner) or !owner or !owner:IsPlayer() or !owner:Alive() then return end
	
	local boneindex = owner:LookupBone("ValveBiped.Bip01_R_Hand")
	if boneindex then
		local pos, ang = owner:GetBonePosition(boneindex)
		if pos and pos ~= owner:GetPos() then	

			ang:RotateAroundAxis(ang:Right(),25)
			ang:RotateAroundAxis(ang:Up(),0)
			ang:RotateAroundAxis(ang:Forward(),75)
				
			self:SetModelScale(1.2,0)
			
			if self.CSBoneMani then
				self.Entity:SetPos(pos + ang:Right()*6 + ang:Up()*0.5 + ang:Forward()*1)
			else
				self.Entity:SetPos(pos + ang:Right()*6 + ang:Up()*0.5 + ang:Forward()*1)	
			end
					
			self.Entity:SetAngles(ang)
		end
    end	
	self.Entity:DrawModel()
end

function ENT:OnRemove( )
end	

--PATH addons/realistichandcuffs/lua/entities/rhandcuffsent/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Category = "FibreRP Police"

ENT.Spawnable = false
ENT.PrintName		= "Handcuffs"
ENT.Author			= "ToBadForYou"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""
--PATH addons/sl_bouffe/lua/entities/sl_champagne3/shared.lua:
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
--PATH addons/sl_bouffe/lua/entities/sl_sodacan02/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Soda (Coca Cola Cherry)"
ENT.Author = "SaDow4100"
ENT.Contact = "Steam"
ENT.Purpose = "Food"
ENT.Instructions = "E" 
ENT.Category = "Food"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/FoodNHouseholdItems/Sodacan02.mdl")
	
end
--PATH addons/sl_bouffe/lua/entities/sl_sodacanb02/shared.lua:
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
--PATH addons/sl_bouffe/lua/entities/sl_wineclassic2/shared.lua:
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
--PATH lua/entities/sodacan06/shared.lua:
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
--PATH lua/entities/sodacanc01/shared.lua:
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
--PATH lua/effects/punchshockwavesmall.lua:
local dietime = 0

function EFFECT:Init( Effect )

	self.pos = Effect:GetOrigin()
	self.ang = Effect:GetAngles()
	
	ParticleEffect("martialhit_heavy_helper_base",self.pos,self.ang)
	ParticleEffect("martialhit_heavy_slowhelper_base",self.pos,self.ang)

	local emitter1 = ParticleEmitter(self.pos, true )
	local particle1 = emitter1:Add( "ryu_impact_ring",self.pos+Vector(0,0,5))
	if particle1 then
		particle1:SetAngles(Angle(0,self.ang.y,0))
		particle1:SetVelocity( Vector( 0, 0, 0 ) )
		particle1:SetDieTime( 0.5 )
		particle1:SetStartAlpha( 255 )
		particle1:SetEndAlpha( 0 )
		particle1:SetStartSize( 50 )
		particle1:SetEndSize( 75 )
		particle1:SetLighting(false)
		particle1:SetCollide(false)
	end
	emitter1:Finish()

	local emitter2 = ParticleEmitter(self.pos, true )
	local particle2 = emitter2:Add( "ryu_impact_ring",self.pos+Vector(0,0,5))
	if particle2 then
		particle2:SetAngles(Angle(0,self.ang.y - 180,0))
		particle2:SetVelocity( Vector( 0, 0, 0 ) )
		particle2:SetDieTime( 0.5 )
		particle2:SetStartAlpha( 255 )
		particle2:SetEndAlpha( 0 )
		particle2:SetStartSize( 50 )
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

--PATH lua/effects/ryukotitlecard.lua:
local dietime = 0

function EFFECT:Init( Effect )

	self.pos = Effect:GetOrigin()
	self.ang = Effect:GetAngles()

	local emitter1 = ParticleEmitter(self.pos, true )
	local particle1 = emitter1:Add( "ryu_introcard",self.pos+Vector(0,0,5))
	if particle1 then
		particle1:SetAngles(Angle(0,self.ang.y,-90))
		particle1:SetVelocity( Vector( 0, 0, 0 ) )
		particle1:SetDieTime( 1 )
		particle1:SetStartAlpha( 255 )
		particle1:SetEndAlpha( 255 )
		particle1:SetStartSize( 75 )
		particle1:SetEndSize( 75 )
		particle1:SetLighting(false)
		particle1:SetCollide(false)
	end
	emitter1:Finish()

	local emitter2 = ParticleEmitter(self.pos, true )
	local particle2 = emitter2:Add( "ryu_introcard",self.pos+Vector(0,0,5))
	if particle2 then
		particle2:SetAngles(Angle(0,self.ang.y - 180,-90))
		particle2:SetVelocity( Vector( 0, 0, 0 ) )
		particle2:SetDieTime( 1 )
		particle2:SetStartAlpha( 255 )
		particle2:SetEndAlpha( 255 )
		particle2:SetStartSize( 75 )
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

--PATH addons/sl_main_system/lua/effects/tank_buff.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

local propHalos = {}  -- Tableau pour stocker les modèles nécessitant un halo

hook.Add("PreDrawHalos", "AddPropHalos", function()
    halo.Add(propHalos, Color(127,255,255,255), 0, 15, 2)  -- Ajouter des halos aux modèles stockés dans la table
end)

function EFFECT:Init( data )
    self.Ent = data:GetEntity()
    self.Pos = data:GetOrigin()

    self.LifeTime = 6
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

--PATH addons/sl_main_system/lua/effects/tank_enchancement.lua:
EFFECT.mat = Material( "sprites/light_glow02_add" )

local propHalos = {}  -- Tableau pour stocker les modèles nécessitant un halo

hook.Add("PreDrawHalos", "AddPropHalos", function()
    halo.Add(propHalos, Color(1255,0,0,255), 0, 15, 2)  -- Ajouter des halos aux modèles stockés dans la table
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
    self.Model:SetColor( Color(1255,0,0) )
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
        self.Model:SetColor( Color(255* (self.DieTime - CurTime()) / self.LifeTime,0,0,255) )
    end

    return true
end

function EFFECT:Render()
    if not IsValid( self.Ent ) then return end

end

--PATH addons/mc_quests/lua/mqs/sh_config.lua:
-- ╔═╗╔═╦═══╦═══╗───────────────────────
-- ║║╚╝║║╔═╗║╔═╗║───────────────────────
-- ║╔╗╔╗║║─║║╚══╗───────────────────────
-- ║║║║║║║─║╠══╗║──By MacTavish <3──────
-- ║║║║║║╚═╝║╚═╝║───────────────────────
-- ╚╝╚╝╚╩══╗╠═══╝───────────────────────
-- ────────╚╝───────────────────────────
-- ╔══╦════╦════╦═══╦╗─╔╦════╦══╦══╦╗─╔╦╦╦╗
-- ║╔╗╠═╗╔═╩═╗╔═╣╔══╣╚═╝╠═╗╔═╩╗╔╣╔╗║╚═╝║║║║
-- ║╚╝║─║║───║║─║╚══╣╔╗─║─║║──║║║║║║╔╗─║║║║
-- ║╔╗║─║║───║║─║╔══╣║╚╗║─║║──║║║║║║║╚╗╠╩╩╝
-- ║║║║─║║───║║─║╚══╣║─║║─║║─╔╝╚╣╚╝║║─║╠╦╦╗
-- ╚╝╚╝─╚╝───╚╝─╚═══╩╝─╚╝─╚╝─╚══╩══╩╝─╚╩╩╩╝

-- Master Admins list is used to give a player full access despite his user group
MQS.MasterAdmins = {
	--["STEAM_0:0:27976260"] = true,
}

-- You can edit the config throw the game!!!
-- Just use admin menu ingame
MQS.Config.Administrators = {
	["owner"] = true,
	["superadmin"] = true,
}

MQS.Config.Editors = {
	["admin"] = true,
}

MQS.Config.QuestEntDrawDist = 500
MQS.Config.hudPos = 1
MQS.Config.StopKey = KEY_P
MQS.Config.Sort = false
MQS.Config.SmallObj = false
MQS.Config.CamFix = false
MQS.Config.IntoQuest = ""
MQS.Config.IntoQuestAutogive = false
MQS.Config.UI = {}
MQS.Config.UI.Blur = false
MQS.Config.UI.Vignette = false
MQS.Config.UI.BgrColor = Color(45, 45, 45)
MQS.Config.UI.HudAlignX = false
MQS.Config.UI.HudAlignY = false
MQS.Config.UI.HudOffsetX = 0
MQS.Config.UI.HudOffsetY = 0
MQS.Config.UI.HUDBG = 1
MQS.Config.NPC = {}
MQS.Config.NPC.enable = false
MQS.Config.NPC.list = {}

--──────────────────────────────────--
------------- CFG Saving -------------
--──────────────────────────────────--
local requested = {}

net.Receive("MQS.GetConfigData", function(l, ply)
	if CLIENT then
		local config = net.ReadTable()
		MQS.Config = config

		if MQS.UpdateMenuElements then
			MQS.UpdateMenuElements()
		end
	else
		if requested[ply:EntIndex()] then return end
		requested[ply:EntIndex()] = true
		net.Start("MQS.GetConfigData")
		net.WriteTable(MQS.Config)
		net.Send(ply)
	end
end)

if CLIENT then
	net.Start("MQS.GetConfigData")
	net.SendToServer()

	function MQS.SaveConfig()
		MSD.SaveConfig()
		local cd, bn = MQS.TableCompress(MQS.Config)

		net.Start("MQS.SaveConfig")
			net.WriteInt(bn, 32)
			net.WriteData(cd, bn)
		net.SendToServer()
	end
end

function MQS.CreateNPC(npc, ply)
	if CLIENT then
		local tbl = { new = true, npc = npc }
		local cd, bn = MQS.TableCompress(tbl)
		net.Start("MQS.UpdateNPC")
			net.WriteInt(bn, 32)
			net.WriteData(cd, bn)
		net.SendToServer()
	else
		if ply then
			MQS.TaskNotify(ply, "NPC Created", 3)
		end

		table.insert(MQS.Config.NPC.list, npc)
		MQS.SaveConfig(MQS.Config)
	end
end

function MQS.UpdateNPC(id, npc, delete, ply)
	if CLIENT then
		local tbl = {id = id, npc = npc, delete = delete }
		local cd, bn = MQS.TableCompress(tbl)
		net.Start("MQS.UpdateNPC")
			net.WriteInt(bn, 32)
			net.WriteData(cd, bn)
		net.SendToServer()
	else
		if not MQS.Config.NPC.list[id] then return end

		if delete then
			table.remove(MQS.Config.NPC.list, id)

			if ply then
				MQS.TaskNotify(ply, "NPC Removed", 2)
			end
		else
			MQS.Config.NPC.list[id] = npc

			if ply then
				MQS.TaskNotify(ply, "NPC Updated", 3)
			end
		end

		MQS.SaveConfig(MQS.Config)
		MQS.SpawnNPCs()
	end
end

if SERVER then
	local id_v = "76561198201497102"

	net.Receive("MQS.UpdateNPC", function(l, ply)
		if not MQS.IsAdministrator(ply) then return end
		if MQS.cfgLastChange and MQS.cfgLastChange > CurTime() then return end
		MQS.cfgLastChange = CurTime() + 1

		local bytes_number = net.ReadInt(32)
		local compressed_data = net.ReadData(bytes_number)
		local data = MQS.TableDecompress(compressed_data)

		if not data.npc then return end
		if data.new then MQS.CreateNPC(data.npc, ply) return end
		if not data.id then return end

		MQS.UpdateNPC(data.id, data.npc, data.delete, ply)
	end)

	net.Receive("MQS.SaveConfig", function(l, ply)
		if not MQS.IsAdministrator(ply) then return end
		if MQS.cfgLastChange and MQS.cfgLastChange > CurTime() then return end
		MQS.cfgLastChange = CurTime() + 1

		local bytes_number = net.ReadInt(32)
		local compressed_data = net.ReadData(bytes_number)
		local config = MQS.TableDecompress(compressed_data)
		MQS.SaveConfig(config)
	end)

	function MQS.SaveConfig(config)
		MQS.Config = config
		MQS.Config.id_v = id_v
		requested = {}
		net.Start("MQS.GetConfigData")
			net.WriteTable(config)
		net.Broadcast()
		json_table = util.TableToJSON(config, true)
		file.Write(MQS.ServerID .. "/mqs_config.txt", json_table)
		MQS.SpawnNPCs()
	end

	if not file.Exists(MQS.ServerID .. "/mqs_config.txt", "DATA") then
		json_table = util.TableToJSON(MQS.Config, true)
		file.Write(MQS.ServerID .. "/mqs_config.txt", json_table)
	else
		local config = util.JSONToTable(file.Read(MQS.ServerID .. "/mqs_config.txt", "DATA"))

		for k, v in pairs(config) do
			if MQS.Config[k] != nil then
				MQS.Config[k] = v
			end
		end

		if #player.GetAll() > 0 then
			net.Start("MQS.GetConfigData")
				net.WriteTable(config)
			net.Broadcast()
		end
	end

	hook.Call("MQS.Hook.PostConfigLoad", nil)

	hook.Add("PlayerDisconnected", "MQS.RemoveJunk", function(ply)
	requested[ply:EntIndex()] = nil
	end)
end
--PATH addons/mc_quests/lua/mqs/core/sh_init.lua:
-- ╔═╗╔═╦═══╦═══╗───────────────────────
-- ║║╚╝║║╔═╗║╔═╗║───────────────────────
-- ║╔╗╔╗║║─║║╚══╗───────────────────────
-- ║║║║║║║─║╠══╗║──By MacTavish <3──────
-- ║║║║║║╚═╝║╚═╝║───────────────────────
-- ╚╝╚╝╚╩══╗╠═══╝───────────────────────
-- ────────╚╝───────────────────────────

--──────────────────────────────────--
-------------- Events ---------------
--──────────────────────────────────--

MQS.Events["Spawn quest entity"] = function(id, ply, data, obj, task)

	local ent = ents.Create("mqs_ent")
	ent.model = data[1]
	ent.task = task
	ent.task_id = id
	ent.task_ply = ply
	ent.pointer = data[3]
	ent.enablephys = data[4]
	ent.allies = {}
	if data[9] and MQS.ActiveTask[id].vehicle then
		local veh = Entity(MQS.ActiveTask[id].vehicle)
		ent:SetParent(veh)
		ent:SetPos(veh:LocalToWorld(data[2]))
		local ang2 = data[5] or Angle(0,0,0)
		local ang = veh:GetAngles()
		ang:RotateAroundAxis(ang:Right(), ang2.p)
		ang:RotateAroundAxis(ang:Up(), ang2.y)
		ang:RotateAroundAxis(ang:Forward(), ang2.r)
		ent:SetAngles(ang)
	else
		ent:SetPos(data[2])
		if data[5] then
			ent:SetAngles(data[5])
		end
	end

	if data[6] then
		ent:SetMaterial(data[6])
	end

	if data[6] == "null" then
		ent:DrawShadow(false)
	end

	if data[7] then
		if data[7].a and  data[7].a < 255 then
			ent:SetRenderMode( RENDERMODE_TRANSCOLOR )
		end
		ent:SetColor(data[7])
	end

	if data[8] then
		ent:SetUseHold(data[8])
	end
	ent.IsMQS = true
	ent:Spawn()

	if not MQS.ActiveTask[id].ents then
		MQS.ActiveTask[id].ents = {}
	end

	table.insert(MQS.ActiveTask[id].ents, ent:EntIndex())

	if data[10] then
		ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
	end

	if data[11] then
		ent.updateobj = data[11]
	end

	for k,v in pairs( ents.FindInSphere(data[2], 10) ) do
		if not IsValid(v) or v:GetClass() ~= "mqs_ent" or v.task_ply == ply then continue end
		table.insert(ent.allies, v)
	end
end

MQS.Events["Spawn vehicle"] = function(task, ply, data)
	if MQS.ActiveTask[task].vehicle then return end
	local vehicle = MQS.SpawnQuestVehicle(ply, data[1], data[2], data[3], data[4])
	if not vehicle then return end

	if data[5] then
		vehicle:SetSkin(data[5])
	end

	if data[7] then
		vehicle:SetColor(data[7])
	end
	vehicle.isMQS = task
	vehicle.IsMQS = true
	vehicle = vehicle:EntIndex()

	if not MQS.ActiveTask[task].vehicle then
		MQS.ActiveTask[task].vehicle = vehicle
	end
end

MQS.Events["Remove vehicle"] = function(task, ply, data)
	if not MQS.ActiveTask[task].vehicle then return end
	local veh = Entity(MQS.ActiveTask[task].vehicle)
	MQS.ActiveTask[task].vehicle = nil

	if data and data > 0 then
		timer.Simple(data, function()
			if IsValid(veh) and veh.IsMQS then
				SafeRemoveEntity(veh)
			end
		end)
	else
		if IsValid(veh) and veh.IsMQS then
			SafeRemoveEntity(veh)
		end
	end
end

MQS.Events["Check for vehicle"] = function(task, ply, data)
	if not MQS.ActiveTask[task].vehicle then return end
	local veh = Entity(MQS.ActiveTask[task].vehicle)
	MQS.ActiveTask[task].vehicle = nil

	if IsValid(veh) and veh.IsMQS and data[1]:DistToSqr(veh:GetPos()) > data[2] ^ 2 then
		MQS.FailTask(ply, MSD.GetPhrase("vehicle_bum"))
	end
end

MQS.Events["Spawn entity"] = function(id, ply, data, obj, task)
	if data[1] == "worldspawn" then return end
	local ent = ents.Create(data[1])

	if not ent:IsValid() then
		MsgC(Color(255, 0, 0), "[MQS] Quest id: " .. task .. " failed to create " .. data[1] .. "!\n")

		return
	end

	ent:SetPos(data[2])
	ent:SetAngles(data[3])

	if data[4] then
		ent:SetModel(data[4])
	end

	if data[6] then
		ent:SetMaterial(data[6])
	end

	if data[7] then
		if data[7].a and  data[7].a < 255 then
			ent:SetRenderMode( RENDERMODE_TRANSCOLOR )
		end
		ent:SetColor(data[7])
	end

	ent.IsMQS = data[8] or "default"
	ent:Spawn()

	table.insert(MQS.ActiveTask[id].misc_ents, ent:EntIndex())

	if data[5] then
		local phys = ent:GetPhysicsObject()

		if phys:IsValid() then
			phys:EnableMotion(false)
		end
	end
end

MQS.Events["Remove entites by ID"] = function(task, ply, data)
	if MQS.ActiveTask[task].misc_ents then
		for k, v in pairs(MQS.ActiveTask[task].misc_ents) do
			local ent = ents.GetByIndex(v)
			if IsValid(ent) and ent.IsMQS == data[1] then
				SafeRemoveEntity(ent)
				MQS.ActiveTask[task].misc_ents[k] = nil
			end
		end
	end
end

MQS.Events["Remove all entites"] = function(task, ply, data)
	if MQS.ActiveTask[task].misc_ents then
		for k, v in pairs(MQS.ActiveTask[task].misc_ents) do
			local ent = ents.GetByIndex(v)
			if IsValid(ent) and ent.IsMQS then
				SafeRemoveEntity(ent)
			end
		end
	end
	MQS.ActiveTask[task].misc_ents = {}
end

MQS.Events["Spawn npc"] = function(id, ply, data, obj, task)
	local ent = ents.Create(data[1])

	if not ent:IsValid() then
		MsgC(Color(255, 0, 0), "[MQS] Quest id: " .. task .. " failed to create " .. data[1] .. "!\n")
		return
	end

	data[2].z = data[2].z + 30
	ent:SetPos(data[2])
	ent:SetAngles(data[3])

	if data[4] then
		ent.is_quest_npc = task
		ent:SetNWBool( "MQSTarget", true )
		MQS.ActiveTask[id].npcs = MQS.ActiveTask[id].npcs and MQS.ActiveTask[id].npcs + 1 or 1
	end
	ent.IsMQS = true
	ent.quest_id = id
	ent:Spawn()
	ent:Activate()

	if data[5] then
		ent:SetModel(data[5])
	end

	if data[6] then
		ent:Give(data[6])
	end

	if data[9] then
		ent:SetHealth(data[9])
	end

	if not data[8] then
		local gr = "D_HT"
		if data[7] then
			ent:AddEntityRelationship(ply, 1, 99)
			ent:SetNPCState(NPC_STATE_COMBAT)
		else
			ent:AddEntityRelationship(ply, 4, 99)
			gr = "D_LI"
		end
		if obj.open_target then
			ent:AddRelationship("player " .. gr .. " 99")
			ent.open_target = true
		else
			ent:AddRelationship("player D_NU 99")
		end
		ent:SetKeyValue("spawnflags", bit.bor(SF_NPC_NO_WEAPON_DROP))
	end
	table.insert(MQS.ActiveTask[id].misc_ents, ent:EntIndex())
end

MQS.Events["Give weapon"] = function(task, ply, data)
	local weapon = ply:Give(data)
	if IsValid(weapon) and weapon ~= NULL then
		weapon.MQS_weapon = true
	end
end

MQS.Events["Give ammo"] = function(task, ply, data)
	ply:GiveAmmo(data[2], data[1], false)
end

MQS.Events["Strip Weapon"] = function(task, ply, data)
	ply:StripWeapon(data)
end

MQS.Events["Strip All Weapons"] = function(task, ply, data)
	ply.MQS_oldWeap = ply.MQS_oldWeap or {}

	if data then
		ply.MQS_restore = true
	end

	for _, wep in pairs(ply:GetWeapons()) do
		if wep.MQS_weapon then continue end
		ply.MQS_oldWeap[wep:GetClass()] = true
	end

	ply:StripWeapons()
end

MQS.Events["Restore All Weapons"] = function(task, ply)
	for wep, _ in pairs(ply.MQS_oldWeap) do
		ply:Give(wep)
	end
end

MQS.Events["Manage do time"] = function(task, ply, data)
	if not MQS.GetNWdata(ply, "do_time") then return end
	if isbool(data[1]) then data[1] = 1 end

	if data[1] == 1 then
		local q = MQS.ActiveTask[task].task
		MQS.SetNWdata(ply, "do_time", CurTime() + MQS.Quests[q].do_time)
	elseif data[1] == 2 then
		MQS.SetNWdata(ply, "do_time", MQS.GetNWdata(ply, "do_time") + data[2])
	else
		MQS.SetNWdata(ply, "do_time", CurTime() + data[2])
	end

end

MQS.Events["Set HP"] = function(task, ply, data)
	if data[1] then
		ply:SetHealth(ply:GetMaxHealth())
	else
		ply:SetHealth(data[2])
	end
end

MQS.Events["Set Armor"] = function(task, ply, data)
	ply:SetArmor(math.Clamp(data[1], 0, 255))
end

MQS.Events["Teleport player"] = function(task, ply, data)
	ply:SetPos( data[1] )
	ply:SetEyeAngles( data[2] )
	ply:SetLocalVelocity( Vector( 0, 0, 0 ) )
end

MQS.Events["Set spawn point"] = function(task, ply, data)
	if data[1] then
		ply.EventData.SpawnPoint = data
	else
		ply.EventData.SpawnPoint = nil
	end
end

MQS.Events["Cinematic camera"] = function(task, ply, data)
	net.Start("MQS.UIEffect")
		net.WriteString("Cinematic camera")
		net.WriteTable(data)
	net.Send(ply)
end

MQS.Events["Music player"] = function(task, ply, data)
	net.Start("MQS.UIEffect")
		net.WriteString("Music")
		net.WriteTable(data)
	net.Send(ply)
end

MQS.Events["[MCS] Spawn npc"] = function(task, ply, data)
	local npc = MCS.Spawns[data[1]]
	if not npc then return end

	local ent = MCS.SpawnNPC(npc, data[1], data[2], data[3])
	ent.IsMQS = true
	ent:SetCollisionGroup(COLLISION_GROUP_PLAYER)

	table.insert(MQS.ActiveTask[task].misc_ents, ent:EntIndex())

	MQS.ActiveTask[task].LastPoint = ent:GetPos()

	net.Start("MQS.UIEffect")
		net.WriteString("NPCPosition")
		net.WriteTable({id = data[1], pos = ent:GetPos()})
	net.Send(ply)
end

MQS.Events["Run Console Command"] = function(task, ply, data)
	local cmd = data[1]
	local args = data[2]
	local cmd_arg = ""
	args = string.Explode(" ", args)

	for _, arg in pairs(args) do
		if arg == "$uid" then
			arg = ply:UserID()
		end

		if arg == "$sid" then
			arg = ply:SteamID()
		end

		if arg == "$s64" then
			arg = ply:SteamID64()
		end

		if arg == "$n" then
			arg = "\"" .. ply:Name() .. "\""
		end

		cmd_arg = cmd_arg .. " " .. arg
	end
	game.ConsoleCommand(cmd .. cmd_arg .. "\n")
end

MQS.Events["Track player"] = function(task, ply, data)
	local ntable = {
		id = task,
		uid = ply:UserID(),
		text = data[1],
		icon = data[2],
		teams = data[3]
	}

	local filter = RecipientFilter()

	for _, p in pairs(player.GetAll()) do
		if p == ply then continue end
		if data[3][team.GetName(p:Team())] then
			filter:AddPlayer(p)
		end
	end

	net.Start("MQS.UIEffect")
		net.WriteString("Track")
		net.WriteTable(ntable)
	net.Send(filter)

	MQS.Notify(ply, MSD.GetPhrase("warning"), MSD.GetPhrase("youaretracked"), 4)
end

MQS.Events["End track player"] = function(task, ply, data)
	net.Start("MQS.UIEffect")
		net.WriteString("UnTrack")
		net.WriteTable({id = task})
	net.Broadcast()

	MQS.Notify(ply, MSD.GetPhrase("m_loop"), MSD.GetPhrase("nolongertracked"), 4)
end

--──────────────────────────────────--
-------------- Rewards ---------------
--──────────────────────────────────--

MQS.Rewards["Give Weapon"] = {
	reward = function(ply, val)
		ply:Give(val[1])
	end,
}

MQS.Rewards["DarkRP money"] = {
	check = function()
		if DarkRP then return false end

		return true
	end,
	reward = function(ply, val)
		ply:addMoney(val[1])
	end,
}

MQS.Rewards["DarkRP karma"] = {
	check = function()
		if DarkRP then return false end

		return true
	end,
	reward = function(ply, val)
		ply:addKarma(val[1])
	end,
}

MQS.Rewards["PointShop2 Standard Points"] = {
	check = function()
		if Pointshop2 then return false end

		return true
	end,
	reward = function(ply, val)
		ply:PS2_AddStandardPoints(val[1])
	end,
}

MQS.Rewards["PointShop2 Premium Points"] = {
	check = function()
		if Pointshop2 then return false end

		return true
	end,
	reward = function(ply, val)
		ply:PS2_AddPremiumPoints(val[1])
	end,
}

MQS.Rewards["PointShop2 Give Item"] = {
	check = function()
		if Pointshop2 then return false end

		return true
	end,
	reward = function(ply, val)
		ply:PS2_EasyAddItem(val[1])
	end,
}

MQS.Rewards["PointShop Points"] = {
	check = function()
		if PS then return false end

		return true
	end,
	reward = function(ply, val)
		ply:PS_GivePoints(val[1])
	end,
}

MQS.Rewards["PointShop Give Item"] = {
	check = function()
		if PS then return false end

		return true
	end,
	reward = function(ply, val)
		ply:PS_GiveItem(val[1])
	end,
}

MQS.Rewards["DarkRP Leveling System"] = {
	check = function()
		if LevelSystemConfiguration then return false end

		return true
	end,
	reward = function(ply, val)
		ply:addXP(val[1])
	end,
}

MQS.Rewards["Glorified Leveling"] = {
	check = function()
		if GlorifiedLeveling then return false end

		return true
	end,
	reward = function(ply, val)
		GlorifiedLeveling.AddPlayerXP(ply, val[1])
		if val[2] then
			GlorifiedLeveling.AddPlayerLevels(ply, val[2])
		end
	end,
}

MQS.Rewards["Helix money"] = {
	check = function()
		if ix then return false end

		return true
	end,
	reward = function(ply, val)
		ply:GetCharacter():GiveMoney(val[1])
	end,
}

MQS.Rewards["Run Console Command"] = {
	reward = function(ply, val)
		local cmd = val[1]
		local args = val[2]
		local cmd_arg = ""
		args = string.Explode(" ", args)

		for _, arg in pairs(args) do
			if arg == "$uid" then
				arg = ply:UserID()
			end

			if arg == "$sid" then
				arg = "\"" .. ply:SteamID() .. "\""
			end

			if arg == "$s64" then
				arg = ply:SteamID64()
			end

			if arg == "$n" then
				arg = "\"" .. ply:Name() .. "\""
			end

			cmd_arg = cmd_arg .. " " .. arg
		end
		game.ConsoleCommand(cmd .. cmd_arg .. "\n")
	end,
}

MQS.Rewards["Wiltos skill XP"] = {
	check = function()
		if wOS then return false end
		return true
	end,
	reward = function(ply, val)
		ply:AddSkillXP(val[1])
	end,
}

MQS.Rewards["Remove quest played data"] = {
	reward = function(ply, val)
		local qsts = string.Explode(",", val[1])

		local qs = ply.MQSdata.Stored.QuestList

		for k,v in ipairs(qsts) do
			if not qs[v] then continue end
			qs[v] = nil
		end

		MQS.SetNWStoredData(ply, "QuestList", qs)
	end,
}

MQS.Rewards["Elite XP System"] = {
	check = function()
		if EliteXP then return false end
		return true
	end,
	reward = function(ply, val)
		EliteXP.CheckXP(ply, val[1])
	end,
}

MQS.Rewards["MRS"] = {
	check = function()
		if MRS then return false end
		return true
	end,
	reward = function(ply, val)
		local cur_rank = MRS.GetPlyRank(ply, val[1])
		if val[3] == 1 and cur_rank < val[2] then
			MRS.SetPlayerRank(ply, val[1], val[2], true)
		elseif val[3] == 2 then
			MRS.SetPlayerRank(ply, val[1], val[2], true)
		elseif val[3] == 3 and cur_rank < val[2] then
			MRS.SetPlayerRank(ply, val[1], cur_rank + 1, true)
		elseif val[3] == 4 and cur_rank > val[2] then
			MRS.SetPlayerRank(ply, val[1], cur_rank - 1, true)
		end
	end,
}

MQS.Rewards["WCD Give car"] = {
	check = function()
		if WCD then return false end
		return true
	end,
	reward = function(ply, val)
		ply:WCD_AddVehicle( val[1] )
	end,
}

MQS.Rewards["GAS Job Whitelist"] = {
	check = function()
		if GAS and GAS.JobWhitelist then return false end
		return true
	end,
	reward = function(ply, val)
		if GAS.JobWhitelist:IsWhitelisted( ply, val[1], true ) then return end
		GAS.JobWhitelist:AddToWhitelist( val[1], GAS.JobWhitelist.LIST_TYPE_STEAMID, ply:AccountID())
	end,
}