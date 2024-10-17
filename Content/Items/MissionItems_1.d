//****************************************************************************
//			Schlüssel für Xardas Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Xardas(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 箱 子 的 钥 匙";						count[2] = 0;
	text[3]						= "属 于 艾 克 萨 达 斯.";									count[3] = 0;
};

//**********************************************************************************
//	Canthars Kompromittierender Brief für Sarah die Händlerin
// ----------------------------------------------------------------------------------

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name						= "信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Canthars_KomproBrief;

	value						= 0;

	description					= "坎 萨 给 商 人 莎 拉 的 信 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Canthars_KomproBrief_1 = " 最 后 警 告";
const string Canthars_KomproBrief_2 = " 我 已 经 在 我 们 的 友 好 时 期";
const string Canthars_KomproBrief_3 = " 提 醒 你 好 几 次 了";
const string Canthars_KomproBrief_4 = " 我迫切需要的条款";
const string Canthars_KomproBrief_5 = " 我 在 一 周 前 从 你 那 里 订 购 的";
const string Canthars_KomproBrief_6 = " 之前。";
const string Canthars_KomproBrief_7 = " 如 果 我 不 能 马 上 从 你 那 里 得 到 回 信 的 话 ，";
const string Canthars_KomproBrief_8 = " 莎 拉 ， 我 将 要 被 迫 改 变 对 你 的";
const string Canthars_KomproBrief_9 = " 对于你的态度。我希望我们能够理解";
const string Canthars_KomproBrief_10 = " 互 相 理 解 ！ ！ ！ ！ ！ ！ ！ ！ ！ ！ ！ ！";
const string Canthars_KomproBrief_11 = "     欧 纳 尔";
func void Use_Canthars_KomproBrief()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_2);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_3);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_4);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_5);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_6);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_7);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_8);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_9);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_10);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_11);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//****************************************************************************
//			Rods Schwert
//			---------------------------------------------
//****************************************************************************
instance ItMw_2h_Rod(C_Item)
{
	name						= "罗 德 的 双 手 巨 剑";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_SWD;

	visual						= "ItMw_035_2h_sld_sword_01.3DS";
	material					= MAT_METAL;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_Rod;

	damageTotal					= Damage_Rod;
	damageType					= DAM_EDGE;
	range						= RANGE_Sld2hSchwert;

	value						= Value_Sld2hSchwert;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[2];
	text[4]						= NAME_TwoHanded;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//***************
// Coragons Silber
//***************
instance ItMi_CoragonsSilber(C_Item)
{
	name						= "科 拉 贡 的 银 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverCup.3DS";
	material					= MAT_METAL;

	value						= Value_SilverCup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*******************************
// Päckchen für Thekla von Sagitta
//*******************************
instance ItMi_TheklasPaket(C_Item)
{
	name						= "特 赫 克 拉 的 包 裹";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_TheklasPacket;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_TheklasPacket()
{
	CreateInvItems(hero, ItPl_Mana_Herb_01, 3);
	CreateInvItems(hero, ItPl_Health_Herb_02, 1);
	CreateInvItems(hero, ItPl_Speed_Herb_01, 1);
	CreateInvItems(hero, ItPl_Blueplant, 2);

	Print(PRINT_GotPlants);
};

//*******************************
// Marias Goldener Teller
//*******************************
instance ItMi_MariasGoldPlate(C_Item)
{
	name						= "沉 重 的 金 盘";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldPlate.3DS";
	material					= MAT_METAL;

	value						= Value_GoldPlate;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "盘 子 上 刻 着";				count[2] = 0;
	text[3]						= "欧 纳 尔 和 玛 丽 亚 的 名 字 。";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*******************************
// Valentinos Ring
//*******************************

instance ItRi_ValentinosRing(C_Item) // bei Cassia als Belohnung
{
	name						= NAME_Ring;

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Prot_Edge_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ValentinosRing;
	on_unequip					= UnEquip_ValentinosRing;

	value						= Value_Ri_ProtEdge;

	description					= "瓦 尔 地 诺 的 戒 指";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Prot_Edge;								count[2] = Ri_ProtEdge;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_ValentinosRing()
{
	self.protection [PROT_EDGE] += Ri_ProtEdge;
	self.protection [PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection [PROT_EDGE] -= Ri_ProtEdge;
	self.protection [PROT_BLUNT] -= Ri_ProtEdge;
};

//****************************************************************************
//			Schlüssel für Dexter Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Dexter(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 箱 子 的 钥 匙";						count[2] = 0;
	text[3]						= "属 于 德 克 斯 特 。";									count[3] = 0;
};

//**********************************************************************************
//	Constantinos Kräuterliste
// ----------------------------------------------------------------------------------

instance ItWr_Kraeuterliste(C_Item)
{
	name						= "列 表";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Kraeuterliste;

	value						= 0;

	description					= "康 斯 坦 提 诺 的 草 药 列 表 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Kraeuterliste_1 = "炼 金 术 草 药";
const string Kraeuterliste_2 = "治 疗 植 物";
const string Kraeuterliste_3 = "治 疗 药 草";
const string Kraeuterliste_4 = "治 疗 根";
const string Kraeuterliste_5 = "火 荨 麻";
const string Kraeuterliste_6 = "柳 兰";
const string Kraeuterliste_7 = "火 根";
const string Kraeuterliste_8 = "哥 布 林 浆 果";
const string Kraeuterliste_9 = "龙 根";
const string Kraeuterliste_10 = "暴 龙 草";
const string Kraeuterliste_11 = "洼 地 节 草";
const string Kraeuterliste_12 = "国 王 酢 浆 草";
const string Kraeuterliste_13 = "注 意 ： 让 将 来 的 学 徒 为 你 采 摘 植 物 。 那 样 你 就 可 以 了 解 他 是 否 优 秀 。 ";
const string Kraeuterliste_14 = "衷 心 问 候 ， 祖 里 斯 。";
func void Use_Kraeuterliste()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_2);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_3);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_4);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_5);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_6);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_7);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_8);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_9);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_10);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_11);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_12);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Kraeuterliste_13);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_14);
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus

	Doc_Show(nDocID);
};

//**********************************************************************************
// Neoras Mana Rezept
// ----------------------------------------------------------------------------------

instance ItWr_ManaRezept(C_Item)
{
	name						= "配 方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ManaRezept;

	value						= 20;

	description					= "魔 术 精 华 的 配 方 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ManaRezept_1 = "魔 法 药 剂";
const string ManaRezept_2 = "要 酿 造 魔 法 药 剂 ， 技 艺 娴 熟 的 炼 金 术 士 需 要 ：";
const string ManaRezept_3 = "火 荨 麻";
const string ManaRezept_4 = "柳 兰";
const string ManaRezept_5 = "火 根";
const string ManaRezept_6 = "他 同 样 需 要 植 物 ";
const string ManaRezept_7 = "洼 地 节 草";
const string ManaRezept_8 = "大 师 尼 欧 莱 斯 ";
func void Use_ManaRezept()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ManaRezept_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ManaRezept_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ManaRezept_3);
				Doc_PrintLine	(nDocID, 0, ManaRezept_4);
				Doc_PrintLine	(nDocID, 0, ManaRezept_5);
				Doc_PrintLines	(nDocID, 0, ManaRezept_6);
				Doc_PrintLine	(nDocID, 0, ManaRezept_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ManaRezept_8);
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus

	Doc_Show(nDocID);
};

// **************************************************************************************

instance ItWr_Passierschein(C_Item)
{
	name						= "通 行 证";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePassierschein;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "这 些 文 件 可 以 让 我";							count[3] = 0;
	text[4]						= "通 过 城 市 的 守 卫 。";		count[4] = 0;
};

const string Passierschein_1 = "     通 行 证";
const string Passierschein_2 = "         克 霍 里 尼 斯";
const string Passierschein_3 = " 这 份 文 件 允 许 携 带 者";
const string Passierschein_4 = " 在 任 何 时 间 自 由 进 出";
const string Passierschein_5 = " 克 霍 里 尼 斯 的 下 等 区 。";
const string Passierschein_6 = "     拉 里 厄 斯";
const string Passierschein_7 = "     国 王 的 地 方 长 官";
func void UsePassierschein()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passierschein_1);
				Doc_PrintLine	(nDocID, 0, Passierschein_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, Passierschein_3);
				Doc_PrintLine	(nDocID, 0, Passierschein_4);
				Doc_PrintLine	(nDocID, 0, Passierschein_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passierschein_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passierschein_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Kraut Paket für MIS_ANDRE_WAREHOUSE
//			---------------------------------------------
//****************************************************************************
instance ItMi_HerbPaket(C_Item)
{
	name						= "野 草 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "沉 重 的 、 沾 手 的 包 裹 ， 里 面 的";				count[2] = 0;
	text[3]						= "沼 生 草 散 发 着 臭 味 。";					count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = 200;
};

//****************************************************************************
//				Lagerhaus Schlüssel für MIS_ANDRE_WAREHOUSE
//			---------------------------------------------
//****************************************************************************
instance ItKe_Storage(C_Item)
{
	name						= "仓 库 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "海 港 的 钥 匙";							count[2] = 0;
	text[3]						= "仓 库 。";							count[3] = 0;
};

const int HP_Hering = 20;
//****************************************************************************
//				Alternativer Fish - danke Levelbereich !
//			---------------------------------------------
//****************************************************************************
instance ItFo_SmellyFish(C_Item)
{
	name						= "急 躁 鲱 鱼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "FOOD";
	on_state[0]					= Use_SmellyFish;

	value						= 0;

	description					= "一 条 鲱 鱼 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Hering;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Fish;
};

func void Use_SmellyFish()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Hering);
};

//****************************************************************************
//				Komischer Fisch von den Banditen mit Nachricht an Halvor
//			---------------------------------------------
//****************************************************************************
instance ItFo_HalvorFish_MIS(C_Item)
{
	name						= "奇 怪 的 鱼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_HalvorFish;

	value						= 0;

	description					= "一 种 长 得 很 奇 怪 的 鱼 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 条 鱼 一 定 有 哪 里 不 对 头 。";	count[2] = 0;
	text[3]						= "看 起 来 好 像 它 是 被 缝 起 来 的 … …";			count[3] = 0;
};

func void Use_HalvorFish()
{
	CreateInvItems(hero, ItWr_HalvorMessage, 1);
	Print(PRINT_FishLetter);
};

//****************************************************************************
//				Nachricht von Halvor an die Banditen, im Fisch versteckt
//			---------------------------------------------
//****************************************************************************
instance ItWr_HalvorMessage(C_Item)
{
	name						= "发 出 臭 气 的 字 条";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseHalvorMessage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 张 字 条 藏 在 一 条 鱼 里 。";	count[2] = 0;
};

const string HalvorMessage_1 = " 把 头 低 下 ， 那 个 家 伙 ！ ";
const string HalvorMessage_2 = " 民 兵 开 始 怀 疑 了 。";
const string HalvorMessage_3 = " 在 你 再 次 听 到 我 的 声 音 前 ， 不 要 再 做 任 何 事 情 ！";
const string HalvorMessage_4 = "     哈 尔 沃";
func void UseHalvorMessage()
{
	Knows_Halvor = TRUE;

	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, HalvorMessage_1);
				Doc_PrintLine	(nDocID, 0, HalvorMessage_2);
				Doc_PrintLine	(nDocID, 0, HalvorMessage_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, HalvorMessage_4);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Komischer Fisch von Halvor als Schweigegeld
//			---------------------------------------------
//****************************************************************************
/*
instance ItFo_HalvorFish(C_Item)
{
	name						= "Seltsamer Fisch";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_HalvorFish;

	value						= 0;

	description					= "Seltsam aussehender Fisch";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Irgendwas ist in diesem Fisch versteckt";	count[2] = 0;
};

func void Use_HalvorFish()
{
	CreateInvItems(hero, ItMi_Nugget, 1);
	PrintScreen(PRINT_FoundOreNugget, -1, YPOS_LEVELUP, FONT_ScreenSmall, 2);
};

*/
//****************************************
//	Alriks Schwert
//****************************************

instance ItMw_AlriksSword_Mis(C_Item)
{
	name						= "艾 尔 里 克 的 剑";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_MISSION | ITEM_SWD;

	visual						= "ItMw_025_1h_Sld_Sword_01.3DS";
	material					= MAT_METAL;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_Alrik;

	damageTotal					= damage_Alrik;
	damageType					= DAM_EDGE;
	range						= range_Alrik;

	on_equip					= Equip_AlriksSword;
	on_unequip					= UnEquip_AlriksSword;

	value						= value_Alrik;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[2];
	text[4]						= NAME_OneHanded;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_AlriksSword()
{
	B_AddFightSkill(self, NPC_TALENT_1H, 10);
};

func void UnEquip_AlriksSword()
{
	B_AddFightSkill(self, NPC_TALENT_1H, -10);
};

//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//			---------------------------------------------
//****************************************************************************
instance ItWr_VatrasMessage(C_Item)
{
	name						= "被 封 住 的 信 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= UseVatrasMessage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 来 自 瓦 卓 斯 的 消 息";					count[2] = 0;
	text[3]						= "给 火 魔 法 师 。";					count[3] = 0;
};

const string VatrasMessage_1 = "亲 爱 的 伊 斯 加 罗 斯 ，";
const string VatrasMessage_2 = "我 察 觉 到 另 一 股 势 力 正 在 日 益 增 长 。";
const string VatrasMessage_3 = "这 是 一 股 我 们 不 知 道 的 势 力 。 可 能 是 贝 利 尔 的 奴 仆 在 附 近 吗 ？";
const string VatrasMessage_4 = "我 可 能 会 出 错 ， 但 是 我 相 信 皮 罗 卡 神 父 一 定 能 明 智 地 把 握 事 态 。 ";
const string VatrasMessage_5 = "愿 你 的 祈 祷 得 到 回 应 。";
const string VatrasMessage_6 = "瓦 卓 斯";
func void UseVatrasMessage()
{
	CreateInvItems(self, ItWr_VatrasMessage_Open, 1);
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, VatrasMessage_1);
				Doc_PrintLines	(nDocID, 0, VatrasMessage_2);
				Doc_PrintLines	(nDocID, 0, VatrasMessage_3);
				Doc_PrintLines	(nDocID, 0, VatrasMessage_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasMessage_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, VatrasMessage_6);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//				Das Siegel wurde geöffnet
//			---------------------------------------------
//****************************************************************************
instance ItWr_VatrasMessage_Open(C_Item)
{
	name						= "消 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseVatrasMessageOpen;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 来 自 瓦 卓 斯 的 消 息";					count[2] = 0;
	text[3]						= "给 火 魔 法 师 。";					count[3] = 0;
	text[4]						= "封 印 已 经 打 开 了 。";					count[4] = 0;
};

const string VatrasMessageOpen_1 = "亲 爱 的 伊 斯 加 罗 斯 ，";
const string VatrasMessageOpen_2 = "我 察 觉 到 另 一 股 势 力 正 在 日 益 增 长 。";
const string VatrasMessageOpen_3 = "这 是 一 股 我 们 不 知 道 的 势 力 。 可 能 是 贝 利 尔 的 奴 仆 在 附 近 吗 ？";
const string VatrasMessageOpen_4 = "我 可 能 会 出 错 ， 但 是 我 相 信 皮 罗 卡 神 父 一 定 能 明 智 地 把 握 事 态 。 ";
const string VatrasMessageOpen_5 = "愿 你 的 祈 祷 得 到 回 应 。";
const string VatrasMessageOpen_6 = "瓦 卓 斯";
func void UseVatrasMessageOpen()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, VatrasMessageOpen_1);
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_2);
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_3);
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, VatrasMessageOpen_6);
	Doc_Show(nDocID);
};

//****************************************************
//		Hotelschlüssel
//****************************************************
instance ItKe_Hotel(C_Item)
{
	name						= "房 间 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "旅 馆 的 钥 匙";						count[2] = 0;
	text[3]						= "房 间";									count[3] = 0;
};

//****************************************************
//		Schlüssel zur Diebesgilde
//****************************************************
instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name						= "生 锈 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 把 钥 匙 已 经 被 海 水 的 盐 分 腐 蚀 了 。";	count[2] = 0;
};

//****************************************************
//		Schlüssel zur Diebesgilde vom Hotel
//****************************************************
instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name						= "生 锈 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "旅 馆 地 窖 的 钥 匙 。";				count[2] = 0;
};

//****************************************************
//		Pfortenschlüssel Tempel von Innos
//****************************************************
instance ItKe_Innos_MIS(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 把 钥 匙 可 以 打 开 传 送 门 ：";					count[2] = 0;
	text[3]						= "英 诺 斯 修 道 院 。";							count[3] = 0;
};

//****************************************************************************
//			Schlüssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
instance ItKe_KlosterSchatz(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "修 道 院 的 钥 匙 ";							count[2] = 0;
	text[3]						= "宝 库 。";					count[3] = 0;
};

//****************************************************************************
//			Schlüssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
instance ItKe_KlosterStore(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "修 道 院 的 钥 匙 ";							count[2] = 0;
	text[3]						= "食 品 库 。";					count[3] = 0;
};

//****************************************************************************
//			Schlüssel Schlafgemach Player
//			---------------------------------------------
//****************************************************************************
instance ItKe_KDFPlayer(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "秘 室 钥 匙 ";							count[2] = 0;
	text[3]						= "在 修 道 院 里 。";							count[3] = 0;
};

//****************************************************************************
//			Schlüssel Bibliothek Kloster
//			---------------------------------------------
//****************************************************************************
instance ItKe_KlosterBibliothek(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "修 道 院 的 钥 匙 ";							count[2] = 0;
	text[3]						= "图 书 馆";						count[3] = 0;
};

//****************************************************************************
//			Extra Wurst Gorax Mission
//			---------------------------------------------
//****************************************************************************
instance ItFo_Schafswurst(C_Item)
{
	name						= "绵 羊 香 肠";

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Sausage.3DS";
	material					= MAT_LEATHER;

	scemeName					= "FOOD";
	on_state[0]					= Use_Schafswurst;

	value						= Value_Sausage;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Sausage;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Sausage;
};

func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Sausage);
};

/******************************************************************************************/
instance ItPo_Perm_LittleMana(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_MANAPOTION";

	visual						= "ItPo_Perm_Mana.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_LittleMana;

	value						= 150;

	description					= "精 神 精 华";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_ManaMax;							count[1] = 3;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value;
};

func void UseItPo_LittleMana()
{
	B_RaiseAttribute(self, ATR_MANA_MAX, 3);
	Npc_ChangeAttribute(self, ATR_MANA, 3);
};

//****************************************************
//		Hammer Innos, für Golem Prüfung
//****************************************************
instance Holy_Hammer_MIS(C_Item)
{
	name						= "神 圣 之 锤";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_MISSION | ITEM_2HD_AXE;

	owner						= Nov_608_Garwig;
	visual						= "ItMw_030_2h_kdf_hammer_01.3DS";
	material					= MAT_METAL;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_HolyHammer;

	damageTotal					= Damage_HolyHammer;
	damageType					= DAM_BLUNT;
	range						= Range_HolyHammer;

	value						= Value_HolyHammer;

	description					= name;
	// FIXME_Noki: TAB
	/*
	description = name;
	TEXT[2] = NAME_Damage; COUNT[2] = damageTotal;
	TEXT[3] = NAME_Str_needed; COUNT[3] = cond_value[2];
	TEXT[4] = NAME_OneHanded;
	TEXT[5] = NAME_Value; COUNT[5] = value;

	Die Konstanten stehen in der Tuning_Melee_Weapons.d M.F.
	*/
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "伤 害 ：               ??";				count[2] = 0;
	text[3]						= "需 要 力 量 ：           ??";				count[3] = 0;
	text[4]						= "双 手 武 器             ";					count[4] = 0;
	text[5]						= "价 值 ： 不 能 确 定";					count[5] = value;
};

//****************************************************************************
//			Schlüssel für die Truhe in der Magierhöhle
//			---------------------------------------------
//****************************************************************************
instance ItKe_MagicChest(C_Item)
{
	name						= "陈 旧 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 把 陈 旧 的 铁 钥 匙 。";				count[2] = 0;
	text[3]						= "它 也 许 能 打 开 某 把 ";						count[3] = 0;
	text[4]						= "挂 锁 。";					count[4] = 0;
};

//****************************************************************************
//			gefälschter Passierschein von Lee
//			---------------------------------------------
//****************************************************************************
instance ItWr_Passage_MIS(C_Item)
{
	name						= "给 圣 骑 士 的 和 平 提 议";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePassage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "有 了 这 张 字 条 ， 我 应 该 可 以 ";			count[3] = 0;
	text[4]						= "见 到 哈 根 勋 爵 。";				count[4] = 0;
};

const string Passage_1 = "尊 敬 的 哈 根 勋 爵 ，";
const string Passage_2 = "我 们 都 很 了 解 你 的 情 况 。 因 此 我 打 算 做 出 如 下 安 排 ： ";
const string Passage_3 = "在 英 诺 斯 和 国 王 的 面 前 彻 底 赦 免 我 和 我 的 人 。 ";
const string Passage_4 = "做 为 回 报 ， 我 们 会 帮 你 防 守 城 镇 以 及 周 边 地 区 。 ";
const string Passage_5 = "此 外 ， 我 个 人 将 负 责 确 保 我 的 人 离 开 附 近 的 农 场 - 当 然 ， 除 了 欧 纳 尔 ， 我 们 还 要 继 续 在 那 里 驻 扎 。";
const string Passage_6 = "我 知 道 ， 你 要 启 程 去 大 陆 的 船 上 有 足 够 的 房 间 让 我 和 一 些 我 的 人 居 住 。 在 你 开 始 航 行 时 ， 我 要 上 船 。";
const string Passage_7 = "我 请 求 你 ： 用 你 所 有 的 智 慧 来 作 出 决 定 。 ";
const string Passage_8 = "签 字   李 将 军";
func void UsePassage()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passage_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Passage_2);
				Doc_PrintLines	(nDocID, 0, Passage_3);
				Doc_PrintLines	(nDocID, 0, Passage_4);
				Doc_PrintLines	(nDocID, 0, Passage_5);
				Doc_PrintLines	(nDocID, 0, Passage_6);
				Doc_PrintLines	(nDocID, 0, Passage_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passage_8);
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus

	Doc_Show(nDocID);
};

//****************************************************************************
//			Nachricht des Banditen -> Plot Wo ist die Armee?
//			---------------------------------------------
//****************************************************************************

instance ItWr_BanditLetter_MIS(C_Item)
{
	name						= "消 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseBanditLetter;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
};

const string BanditLetter_1 = "阻 止 所 有 接 近 的 人 ";
const string BanditLetter_2 = " 到 山 上 来";
const string BanditLetter_3 = "如 果 有 人 在 路 上 走 ， ";
const string BanditLetter_4 = " 有 可 能 是 个 老 人 。";
const string BanditLetter_5 = "别 让 他 愚 弄 了 你 - ";
const string BanditLetter_6 = " 他 是 一 个 危 险 的 巫 师 。   ";
const string BanditLetter_7 = "留 意 他 。";
const string BanditLetter_8 = "可 能 是 我 们 正 在 找 的 人 ";
const string BanditLetter_9 = " 会 和 他 联 系 。 ";
const string BanditLetter_10 = "有 了 我 给 你 的 信 ";
const string BanditLetter_11 = " 三 十 枚 金 币 。 ";
const string BanditLetter_12 = "我 会 再 给 任 何 杀 掉 那 个 家 伙 ";
const string BanditLetter_13 = " 谁杀了那个人。 ";
const string BanditLetter_14 = "把 他 的 头 带 到 土 地 所 有 者 附 近 的 老 矿 坑 。";
const string BanditLetter_15 = "… … Ｄ 。";
func void UseBanditLetter()
{
	var int nDocID;

	/*
	if (Bdt13_Dexter_verraten == FALSE)
	{
		Bdt13_Dexter_verraten = TRUE;

		Log_CreateTopic(Topic_Bandits, LOG_MISSION);
		Log_SetTopicStatus(Topic_Bandits, LOG_RUNNING);
		B_LogEntry(Topic_Bandits, "Der Anführer der Banditen ist Dexter. Er versteckt sich bei einer Mine, beim Großbauer.");
		MIS_Steckbriefe = LOG_RUNNING;
	};

		*/

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, BanditLetter_1);
				Doc_PrintLine	(nDocID, 0, BanditLetter_2);
				Doc_PrintLine	(nDocID, 0, BanditLetter_3);
				Doc_PrintLine	(nDocID, 0, BanditLetter_4);
				Doc_PrintLine	(nDocID, 0, BanditLetter_5);
				Doc_PrintLine	(nDocID, 0, BanditLetter_6);
				Doc_PrintLine	(nDocID, 0, BanditLetter_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BanditLetter_8);
				Doc_PrintLine	(nDocID, 0, BanditLetter_9);
				Doc_PrintLine	(nDocID, 0, BanditLetter_10);
				Doc_PrintLine	(nDocID, 0, BanditLetter_11);
				Doc_PrintLine	(nDocID, 0, BanditLetter_12);
				Doc_PrintLine	(nDocID, 0, BanditLetter_13);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BanditLetter_14);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BanditLetter_15);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//****************************************************************************
//			Steckbrief vom Spieler
//			---------------------------------------------
//****************************************************************************
instance ItWr_Poster_MIS(C_Item)
{
	name						= "通 缉 令";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePoster;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "一 张 我 的 画 像 ！";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
};

func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Gesucht.TGA", 0);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Banditen Truhen Schlüssel
//			---------------------------------------------
//****************************************************************************
instance ItKe_Bandit(C_Item)
{
	name						= "箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 把 钥 匙 属 于";								count[2] = 0;
	text[3]						= "某 个 强 盗 。";						count[3] = 0;
};

//****************************************************************************
//				Bospers Jagdbogen
//			---------------------------------------------
//****************************************************************************
instance ItRw_Bow_L_03_MIS(C_Item)
{
	name						= "猎 弓";

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MISSION;

	munition					= ItRw_Arrow;

	visual						= "ItRw_Bow_L_03.mms";
	material					= MAT_WOOD;

	cond_atr[2]					= ATR_DEXTERITY;
	cond_value[2]				= Condition_Jagdbogen;

	damageTotal					= Damage_Jagdbogen;
	damageType					= DAM_POINT;

	value						= Value_Jagdbogen;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[2];
	text[4]						= "伯 斯 波 的 猎 弓 。";							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//****************************************************************************
//				Constantinos Schutzring
//			---------------------------------------------
//****************************************************************************
instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name						= "康 斯 坦 提 诺 的 戒 指";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Prot_Point_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ItRi_Prot_Point_01_MIS;
	on_unequip					= UnEquip_ItRi_Prot_Point_01_MIS;

	value						= Value_Ri_ProtPoint;

	description					= "木 材 保 护 ";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Prot_Point;								count[2] = Ri_ProtPoint;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection [PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection [PROT_POINT] -= Ri_ProtPoint;
};

//****************************************************************************
//				Eddas Statue
//			---------------------------------------------
//****************************************************************************
instance ItMi_EddasStatue(C_Item)
{
	name						= "英 诺 斯 雕 像";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_InnosStatue.3DS";
	material					= MAT_METAL;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "英 诺 斯 ， 正 义 之 王 ";				count[2] = 0;
	text[3]						= "祝 福 并 保 护 我 ，";						count[3] = 0;
	text[4]						= "让 我 不 受 伤 害 。";			count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//****************************************************************************
//				Crypta-Schlüssel
//			---------------------------------------------
//****************************************************************************
instance ItKe_EVT_CRYPT_01(C_Item)
{
	name						= "旧 黄 铜 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "来 自 房 间 １ 中 骷 髅 的 钥 匙";		count[2] = 0;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name						= "旧 黄 铜 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "来 自 房 间 ２ 中 骷 髅 的 钥 匙";		count[2] = 0;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name						= "旧 黄 铜 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "来 自 房 间 ３ 中 骷 髅 的 钥 匙";			count[2] = 0;
};

const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name						= "旧 骑 士 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Pal_H.3ds";
	visual_change				= "Armor_Pal_Skeleton.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 50;

	value						= VALUE_ITAR_PAL_SKEL;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

//****************************************************************************
//				Schlüssel zu Valentinos Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Valentino(C_Item)
{
	name						= "箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "箱 子 钥 匙";						count[2] = 0;
	text[3]						= "属 于 瓦 尔 地 诺 。";								count[3] = 0;
};

//****************************************************************************
//				Schlüssel zur Truhe OV Noname Typen
//			---------------------------------------------
//****************************************************************************
instance ItKe_Buerger(C_Item)
{
	name						= "箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "它 就 放 在 窗 台 附 近 。";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

//****************************************************************************
//				Schlüssel Richter Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Richter(C_Item)
{
	name						= "箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "箱 子 钥 匙";						count[2] = 0;
	text[3]						= "属 于 法 官";								count[3] = 0;
};

//****************************************************************************
//				Schlüssel Salandril
//			---------------------------------------------
//****************************************************************************
instance ItKe_Salandril(C_Item)
{
	name						= "箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "属 于 炼 金 术 士 萨 伦 德 里 尔 。";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

//****************************************************************************
//				Schlüssel Truhe ...wo die Paladine schlafen
//			---------------------------------------------
//****************************************************************************
instance ItKe_PaladinTruhe(C_Item)
{
	name						= "箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "小 黄 铜 钥 匙 来 自 ：";				count[2] = 0;
	text[3]						= "圣 骑 士 的 房 子 。";					count[3] = 0;
};

//****************************************************************************
//				Diebsgilde Schatz (Insel)
//			---------------------------------------------
//****************************************************************************
instance ItKe_ThiefTreasure(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 把 小 钥 匙 。";						count[2] = 0;
};

//****************************************************************************
//				Diebsgilde Fingers Tür
//			---------------------------------------------
//****************************************************************************
instance ItKe_Fingers(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 把 生 锈 的 门 钥 匙";					count[2] = 0;
	text[3]						= "来 自 下 水 道 。";						count[3] = 0;
};

//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

instance ItWr_Schuldenbuch(C_ITEM)
{
	name						= "债 务 记 录";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_05.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseSchuldBuch;

	value						= 100;

	description					= "雷 玛 尔 的 债 务 记 录 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string SchuldBuch_1 = "交 易 和 债 务";
const string SchuldBuch_2 = "我 ， 大 师 托 尔 本 ， 克 霍 里 尼 斯 的 木 匠 ， 欠 尊 敬 的 雷 玛 尔 ２ ０ ０ 金 币 的 债 务 。";
const string SchuldBuch_3 = "             托 尔 本";
const string SchuldBuch_4 = "我 ， 科 拉 贡 ， 克 霍 里 尼 斯 的 旅 馆 主 人 ， 欠 尊 敬 的 雷 玛 尔 １ ５ ０ 金 币 的 债 务 。";
const string SchuldBuch_5 = "             科 拉 贡";
const string SchuldBuch_6 = "我 ， 汉 纳 ， 克 霍 里 尼 斯 的 旅 馆 经 营 者 ， 欠 尊 敬 的 雷 玛 尔 ２ ５ ０ 金 币 的 债 务 。";
const string SchuldBuch_7 = "               汉 纳";
func void UseSchuldBuch()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, SchuldBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, SchuldBuch_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, SchuldBuch_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, SchuldBuch_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, SchuldBuch_5);
	// Absatz
				Doc_PrintLine	(nDocID, 0, "");

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				// Doc_SetFont( nDocID, 1, FONT_BookHeadline ); // -1 -> all pages
				// Doc_PrintLine	(nDocID, 1, "");
				// Doc_PrintLines	(nDocID, 1, "StandardBuch Seite 2");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, SchuldBuch_6);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, SchuldBuch_7);
	// Absatz
				Doc_PrintLines	(nDocID, 1, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name						= "太 阳 芦 荟";

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItPl_Strength_Herb_01.3DS";
	material					= MAT_WOOD;

	scemeName					= "FOOD";

	value						= Value_Strength_Herb_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Strength_Herb_01;
};

//****************************************************************************
//			Schlüssel für die obernen Schlafzimmer in der Taverne (MITTE DER WELT!)
//			---------------------------------------------
//****************************************************************************
instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name						= "房 间 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "来 自 ‘ 戴 德 哈 匹 ’ 。";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name						= "德 莱 戈 米 尔 的 弩";

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_CROSSBOW;

	munition					= ItRw_Bolt;

	visual						= "ItRw_Crossbow_L_02.mms";
	material					= MAT_WOOD;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_LeichteArmbrust;

	damageTotal					= Damage_LeichteArmbrust;
	damageType					= DAM_POINT;

	value						= Value_LeichteArmbrust;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_STR_needed;								count[3] = cond_value[2];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};
