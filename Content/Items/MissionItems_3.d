//********************************************
//	Das Auge Innos (Das reparierte Auge, mit dem man mit den Drachen Spricht)
//********************************************

const int AM_EyeProtEdge = 10;
const int AM_EyeProtPoint = 10;
const int AM_EyeProtMage = 20;
const int AM_EyeProtFire = 30;

// -------------------------------------------

instance ItMi_InnosEye_MIS(C_ITEM)
{
	name						= "英 诺 斯 之 眼";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_InnosEye_MIS.3DS";
	material					= MAT_STONE;

	on_equip					= Equip_InnosEye;
	on_unequip					= UnEquip_InnosEye;

	value						= 0;

	description					= name;
	text[0]						= "能 量 在 眼 睛 中 有 规 律 地 脉 动 。";			count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("FX_EarthQuake", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	AI_StandUp(self);
	Snd_Play("SFX_INNOSEYE");

	self.protection [PROT_EDGE] += AM_EyeProtEdge;
	self.protection [PROT_BLUNT] += AM_EyeProtEdge;
	self.protection [PROT_POINT] += AM_EyeProtPoint;
	self.protection [PROT_FIRE] += AM_EyeProtFire;
	self.protection [PROT_MAGIC] += AM_EyeProtMage;

	PrintScreen("", -1, -1, FONT_Screen, 0);
};

func void UnEquip_InnosEye()
{
	self.protection [PROT_EDGE] -= AM_EyeProtEdge;
	self.protection [PROT_BLUNT] -= AM_EyeProtEdge;
	self.protection [PROT_POINT] -= AM_EyeProtPoint;
	self.protection [PROT_FIRE] -= AM_EyeProtFire;
	self.protection [PROT_MAGIC] -= AM_EyeProtMage;
};

instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name						= "英 诺 斯 之 眼";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	visual						= "ItMi_InnosEye_MIS.3DS";
	material					= MAT_STONE;

	on_equip					= Equip_ItMi_InnosEye_Discharged_Mis;

	value						= 0;

	description					= name;
	text[0]						= "眼 睛 暗 淡 了 ， 不 再 闪 烁 。";			count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name						= "英 诺 斯 之 眼";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	visual						= "ItMi_InnosEye_MIS.3DS";
	material					= MAT_STONE;

	on_equip					= Equip_ItMi_InnosEye_Broken_Mis;

	value						= 0;

	description					= name;
	text[0]						= TEXT_Innoseye_Setting;						count[0] = 0;
	text[1]						= TEXT_Innoseye_Gem;							count[1] = 0;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

//**********************************************************************************
//	Ermächtigungsschreiben für SC für Pyrokar, das Auge Innos rauszurücken.
// ----------------------------------------------------------------------------------

instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name						= "授 权 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_PermissionToWearInnosEye;

	value						= 0;

	description					= "授 权 给 皮 罗 卡 的 信 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string PermissionToWearInnosEye_1 = "持 有 此 字 条 的 人 有 权 进 入 神 圣 的 修 道 院 大 厅 。";
const string PermissionToWearInnosEye_2 = "他 要 带 走 英 诺 斯 之 眼 的 要 求 必 须 立 即 履 行 。";
const string PermissionToWearInnosEye_3 = "这 些 命 令 必 须 被 看 作 我 作 为 这 个 岛 的 统 治 者 的 权 力 的 象 征 ， 也 代 表 了 国 王 ， 同 时 也 通 过 了 与 英 诺 斯 教 会 在 火 ２ 年 签 订 的 条 约 。";
const string PermissionToWearInnosEye_4 = "最 后 ， 我 不 会 再 做 其 它 的 陈 述 ， 并 希 望 我 的 命 令 能 够 被 遵 守 。";
const string PermissionToWearInnosEye_5 = "英 诺 斯 祝 福 国 王 。";
const string PermissionToWearInnosEye_6 = "     哈 根 勋 爵";
func void Use_PermissionToWearInnosEye()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_1);
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_2);
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_3);
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PermissionToWearInnosEye_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PermissionToWearInnosEye_6);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_XardasBookForPyrokar_Mis
//**********************************************************************************

instance ItWr_XardasBookForPyrokar_Mis(C_ITEM)
{
	name						= "伊 尔 多 拉 斯 大 厅";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasBookForPyrokar;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_XardasBookForPyrokar()
{
	Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

//**********************************************************************************
//	ItKe_CHEST_SEKOB_XARDASBOOK_MIS Xardas Schlüssel für die Truhe auf Sekobs Hof
//**********************************************************************************

instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name						= "艾 克 萨 达 斯 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_02;

	description					= name;
	text[0]						= "塞 柯 布 农 场 里 的 箱 子 。";			count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	ItWr_CorneliusTagebuch_Mis
//**********************************************************************************

instance ItWr_CorneliusTagebuch_Mis(C_ITEM)
{
	name						= "日 记";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_01.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseCorneliusTagebuch;

	value						= 0;

	description					= name;
	text[0]						= "考 内 留 斯 的 日 记 。";					count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string CorneliusTagebuch_1 = "如 果 拉 里 厄 斯 继 续 保 持 那 个 样 子 的 话 ， 我 要 寻 找 另 一 个 地 方 。";
const string CorneliusTagebuch_2 = "昨 夜 我 身 上 发 生 了 一 些 怪 事 。 我 们 最 近 时 常 听 说 的 那 些 戴 着 黑 头 巾 的 家 伙 来 到 了 我 的 房 子 里 。 虽 然 他 们 可 能 真 的 是 那 么 邪 恶 ， 但 我 并 没 有 感 到 紧 张 。 你 几 乎 可 以 察 觉 他 们 身 上 所 拥 有 的 能 量 。 但 是 他 的 声 音 平 静 、 和 蔼 ， 让 你 情 不 自 禁 地 相 信 他 们 。";
const string CorneliusTagebuch_3 = "他 给 了 我 ２ ０ ０ ０ ０ 个 金 币 ， 让 我 确 保 宣 告 某 个 雇 佣 兵 有 罪 。 他 说 ， 到 那 个 时 候 我 会 知 道 他 的 意 思 。";
const string CorneliusTagebuch_4 = "我 当 然 立 刻 同 意 了 ， 总 之 那 些 雇 佣 兵 不 值 得 尊 重 。 如 果 不 是 他 们 的 话 ， 我 这 里 一 切 都 会 很 好 。 而 且 这 些 金 币 可 以 让 我 舒 服 地 退 休 。";
const string CorneliusTagebuch_5 = "事 情 发 生 了 ， 他 们 已 经 逮 捕 了 其 中 一 名 雇 佣 兵 。 要 遵 守 我 的 诺 言 很 容 易 。";
func void UseCorneliusTagebuch()
{
	Cornelius_IsLiar = TRUE;
	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_4);

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, CorneliusTagebuch_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, CorneliusTagebuch_2);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, CorneliusTagebuch_3);
				Doc_PrintLines	(nDocID, 1, CorneliusTagebuch_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, CorneliusTagebuch_5);
	Doc_Show(nDocID);

	PrintScreen("", -1, -1, FONT_Screen, 0);
};

//**********************************************************************************
//	ITWR_DementorObsessionBook_MIS // Joly: DementorBuch, der Bessenheit, Ein NSC trägt dieses Buch mit sich, wenn er von einem Dementor kurzzeitig übernommen wurde.)
//**********************************************************************************

instance ITWR_DementorObsessionBook_MIS(C_ITEM)
{
	name						= "我 这 里 有 一 本 附 体 名 单";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_DementorObsessionBook;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string DementorObsessionBook_1 = "edef Kon dirandorix";
const string DementorObsessionBook_2 = "in Sparady bell ";
const string DementorObsessionBook_3 = "el utoy";
const string DementorObsessionBook_4 = " Kho ray xaondron";
const string DementorObsessionBook_5 = "em piratoram endro";
const string DementorObsessionBook_6 = "          维 诺";
const string DementorObsessionBook_7 = "费 尔 南 多";
const string DementorObsessionBook_8 = "     玛 莱 克";
const string DementorObsessionBook_9 = "布 洛 摩 尔";
const string DementorObsessionBook_10 = "          恩 格 罗 姆";
const string DementorObsessionBook_11 = "     伦 道 夫";
const string DementorObsessionBook_12 = "          塞 柯 布";
const string DementorObsessionBook_13 = "     布 鲁 图 斯";
func void Use_DementorObsessionBook()
{
	Wld_PlayEffect("spellFX_Fear", hero, hero, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);

	if (hero.guild == GIL_KDF)
	{
		var int nDocID;

		nDocID = Doc_Create(); // DocManager
		Doc_SetPages(nDocID, 2); // wieviel Pages
		Doc_SetPage(nDocID, 0, "BOOK_MAGE_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
		Doc_SetPage(nDocID, 1, "BOOK_MAGE_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga
		// 1.Seite
				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 0, DementorObsessionBook_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DementorObsessionBook_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DementorObsessionBook_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DementorObsessionBook_4);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, DementorObsessionBook_5);
		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");

		if (Kapitel >= 3)
		{
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_6);
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_7);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_8);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_9);
		};

		if (Kapitel >= 4)
		{
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_10);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_11);
				Doc_PrintLine	(nDocID, 1, "");
		};

		if (Kapitel >= 5)
		{
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_12);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_13);
				Doc_PrintLine	(nDocID, 1, "");
		};

		Doc_Show(nDocID);
	};
};

//**********************************************************************************
//	ItWr_PyrokarsObsessionList
//**********************************************************************************

instance ItWr_PyrokarsObsessionList(C_Item)
{
	name						= "皮 罗 卡 的 魔 法 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_PyrokarsObsessionList;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string PyrokarsObsessionList_1 = "财 产";
const string PyrokarsObsessionList_2 = "费 尔 南 多";
const string PyrokarsObsessionList_3 = "维 诺";
const string PyrokarsObsessionList_4 = "玛莱克";
const string PyrokarsObsessionList_5 = "布 洛 摩 尔";
const string PyrokarsObsessionList_6 = "恩 格 罗 姆";
const string PyrokarsObsessionList_7 = "伦 道 夫";
const string PyrokarsObsessionList_8 = "塞 柯 布";
const string PyrokarsObsessionList_9 = "布 鲁 图 斯";
func void Use_PyrokarsObsessionList()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages

	if (Kapitel >= 3)
	{
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_5);
	};

	if (Kapitel >= 4)
	{
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_7);
	};

	if (Kapitel >= 5)
	{
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_9);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	};

	Doc_Show(nDocID);
};

/******************************************************************************************/
//	Heiltrank für Hilda //
/******************************************************************************************/
instance ItPo_HealHilda_MIS(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_HealHilda;

	value						= Value_HpEssenz;

	description					= "治 疗 黑 热 病";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpEssenz;
};

func void Use_HealHilda()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
};

// *****************************************************
// 		Maleths verlorener Gehstock
// *****************************************************
instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name						= "手 杖";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "Itmw_008_1h_pole_01.3ds";
	material					= MAT_WOOD;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_VLKMace;

	damageTotal					= Damage_VLKMace;
	damageType					= DAM_BLUNT;
	range						= RANGE_VLKMace;

	value						= Value_VLKMace;

	description					= name;
	text[0]						= "‘ Ｍ ’ 字 样 写 在 信 上";							count[0] = 0;
	text[1]						= "上面刻着。";		count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[2];
	text[4]						= NAME_OneHanded;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// *****************************************************
// 		Maleths BanditenGeldbeutel
// *****************************************************

instance ItMi_MalethsBanditGold(C_Item)
{
	name						= "一 满 袋 金 子 ！";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_MalethsBanditGold;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MalethsBanditGold()
{
	B_PlayerFindItem(ItMi_Gold, 300);
};

// *****************************************************
// 		MoleratFett für "die Winde klemmt"
// *****************************************************

instance ItMi_Moleratlubric_MIS(C_Item)
{
	name						= "鼹 鼠 脂 肪";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Moleratlubric.3ds";
	material					= MAT_WOOD;

	value						= Value_Pitch;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//*****************************************************
//	Babos Brief
//*****************************************************

instance ItWr_BabosLetter_MIS(C_Item)
{
	name						= "给 白 波 的 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_BabosLetter;

	value						= 0;

	description					= "一 封 给 白 波 的 信 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string BabosLetter_1 = "亲 爱 的 白 波 ，";
const string BabosLetter_2 = "毫 无 疑 问 ， 你 很 奇 怪 我 们 怎 么 会 给 你 写 这 封 信 。 我 们 把 所 有 的 积 蓄 都 给 了 玛 勒 斯 大 师 ， 并 请 他 给 你 写 了 这 些 话 。 我 们 希 望 你 未 来 一 切 顺 利 ， 并 送 你 一 张 图 片 作 为 临 别 礼 物 ， 那 样 你 就 能 一 直 记 住 我 们 在 修 道 院 的 那 些 漫 长 的 夜 晚 。";
const string BabosLetter_3 = "祝 你 好 运 。 希 望 你 喜 欢 这 张 图 片 。";
const string BabosLetter_4 = "费 哈 特 和 邦 卡";
func void Use_BabosLetter()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, BabosLetter_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, BabosLetter_2);
				Doc_PrintLines	(nDocID, 0, BabosLetter_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, BabosLetter_4);

	Doc_Show(nDocID);
};

//********************************************************
//	BabosPinup
//********************************************************

instance ItWr_BabosPinUp_MIS(C_Item)
{
	name						= "女 子 的 图 片";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_BabosPinUp;

	value						= 0;

	description					= "一 张 女 人 图 片 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Map_Pinup.TGA", 0);
	Doc_Show(nDocID);
};

//********************************************************
//	BabosDocs
//********************************************************

instance ItWr_BabosDocs_MIS(C_Item)
{
	name						= "一 捆 文 件";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_BabosDocs;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 些 文 件 卷 在";					count[2] = 0;
	text[3]						= "一 起";									count[3] = 0;
};

func void Use_BabosDocs()
{
	BaboSDocsOpen = TRUE;

	CreateInvItems(self, ItWr_BabosLetter_MIS, 1);
	CreateInvItems(self, ItWr_BabosPinUp_MIS, 1);
};

//*************************************************************
//	igaraz Schlüssel
//*************************************************************

instance ItKe_IgarazChest_Mis(C_Item)
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
	text[2]						= "箱 子 钥 匙";							count[2] = 0;
	text[3]						= "属 于 伊 加 莱 兹 。";						count[3] = 0;
};

//**********************************************************************************
//	ItWr_Astronomy_Mis
//**********************************************************************************

instance ItWr_Astronomy_Mis(C_ITEM)
{
	name						= "星 的 神 圣 力 量";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_02.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Astronomy;

	value						= 400;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

var int Astronomy_once;

const string Astronomy_1 = "… … 但 是 当 公 牛 的 力 量 和 战 士 的 天 性 结 合 起 来 之 后 ， 那 么 要 小 心 可 能 会 发 生 的 事 件 。";
const string Astronomy_2 = "解 脱 的 公 牛 力 量 和 战 士 的 毅 力 可 能 会 颠 覆 远 古 的 力 量 平 衡 。 次 元 之 间 的 宇 宙 边 界 会 变 弱 - 因 此 黑 暗 的 生 物 贝 利 尔 可 以 很 容 易 地 进 入 我 们 的 世 界 。 ";
const string Astronomy_3 = "远 古 时 期 的 战 争 向 我 们 展 示 了 这 一 系 列 的 发 展 变 化 ， 那 时 世 界 之 间 的 连 结 依 然 十 分 牢 固 。 邪 恶 的 追 随 者 给 这 个 世 界 带 来 的 死 亡 和 毁 灭 ， 只 有 英 诺 斯 的 帮 助 和 天 选 者 保 护 人 类 远 离 邪 恶 。 ";
const string Astronomy_4 = "如 果 这 样 的 威 胁 再 次 出 现 ， 那 么 只 有 英 诺 斯 保 护 我 们 ， 因 为 几 百 年 来 ， 英 诺 斯 没 有 再 次 挑 选 出 另 一 个 天 选 者 。";
func void Use_Astronomy()
{
	if (Astronomy_once == FALSE)
	{
		B_RaiseAttribute(self, ATR_MANA_MAX, 2);
		Print(PRINT_ReadAstronomy);
		Astronomy_once = TRUE;
	};

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Astronomy_1);
				Doc_PrintLines	(nDocID, 0, Astronomy_2);
	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Astronomy_3);
				Doc_PrintLines	(nDocID, 1, Astronomy_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, "");
	Doc_Show(nDocID);
};

///////////////////////
// Besessenheit heilen.
///////////////////////

var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_HealObsession;

	value						= Value_HpEssenz;

	description					= "着 魔 治 疗";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpEssenz;
};

func void Use_HealObsession()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	B_ClearSCObsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET", hero, hero, 0, 0, 0, FALSE);
	Snd_Play("SFX_HealObsession");
};

//************************************************
//	Die Golem Truhe
//************************************************

instance ItSe_Golemchest_Mis(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_GolemChest;

	value						= 0;

	description					= "一 个 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "袋 子 里 面 装 满 了 硬 币 。";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_GolemChest()
{
	CreateInvItems(hero, ItMi_Gold, 50);
	Print(PRINT_FoundGold50);
	Print(PRINT_FoundRing);
	CreateInvItems(hero, ItRi_Prot_Total_02, 1);
	Snd_Play("Geldbeutel");
};

//////////////////////////////////////////////////////////////////////////////
//
//	ItWr_ShatteredGolem_MIS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_ShatteredGolem_MIS(C_Item)
{
	name						= "一 张 非 常 旧 的 地 图 。"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ShatteredGolem_Mis;

	value						= 150;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_ShatteredGolem_Mis()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_ShatteredGolem_MIS);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_ShatteredGolem.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//**********************************************************************************
//	Diegos Brief an den Richter
// ----------------------------------------------------------------------------------

instance ItWr_DiegosLetter_MIS(C_Item)
{
	name						= "来 自 迪 雅 戈 的 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_DiegosLetter_Mis;

	value						= 0;

	description					= "迪 雅 戈 发 给 哲 勃 兰 特 的 信 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string DiegosLetter_Mis_1 = "哲 勃 兰 特 ";
const string DiegosLetter_Mis_2 = "你 知 道 ， 你 真 应 该 杀 了 我 。 ";
const string DiegosLetter_Mis_3 = "我 回 到 镇 上 来 找 你 了 。 等 我 找 到 你 的 时 候 ， 我 会 把 你 象 布 丁 一 样 切 碎 。 你 认 识 我 很 久 了 ， 肯 定 知 道 我 不 会 那 么 轻 易 被 愚 弄 。";
const string DiegosLetter_Mis_4 = "我 猜 ， 当 你 把 我 扔 进 屏 障 的 时 候 ， 你 从 没 想 到 我 会 回 来 。 嗯 ， 你 错 了 。 ";
const string DiegosLetter_Mis_5 = "我 已 经 回 来 了 ， 要 回 那 些 欠 我 的 一 切 。 ";
const string DiegosLetter_Mis_6 = "你 唯 一 活 下 来 的 机 会 是 赶 快 逃 走 ， 把 你 的 生 意 交 给 我 。 那 样 我 们 就 两 清 了 。";
const string DiegosLetter_Mis_7 = "迪 雅 戈";
func void Use_DiegosLetter_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, DiegosLetter_Mis_1);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_2);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_3);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_4);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_5);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DiegosLetter_Mis_7);
	Doc_Show(nDocID);
};

//*************************************************************************************
//		Diegos Goldschatz
//*************************************************************************************

instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name						= "装 满 的 皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_DiegosTreasure;

	value						= 0;

	description					= "迪 雅 戈 的 旧 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;

	B_PlayerFindItem(ItMi_Gold, DiegosTreasure);
};

//*************************************************************************************
//		Ulthars heilendes Wasser zum reinigen der Wegschreine (nur PAL)
//*************************************************************************************

instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name						= "乌 尔 萨 的 圣 水";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_HolyWater.3ds";
	material					= MAT_WOOD;

	value						= Value_HolyWater;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	ItWr_MinenAnteil_Mis
// ----------------------------------------------------------------------------------
var int ItWr_MinenAnteil_Mis_OneTime;
instance ItWr_MinenAnteil_Mis(C_Item)
{
	name						= "克 霍 里 尼 斯 的 矿 井 股 票";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MinenAnteil_Mis;

	value						= Value_HpElixier;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string MinenAnteil_Mis_1 = "矿 井 股 票";
const string MinenAnteil_Mis_2 = "在 皇 家 土 地 上 ， 以 国 王 的 财 产 清 单 为 依 据 ， 此 文 件 的 持 有 者 有 权 在 国 王 的 土 地 上 探 矿 。";
const string MinenAnteil_Mis_3 = "他 的 挖 掘 地 区 必 须 限 定 在 一 小 块 皇 家 领 土 的 挖 掘 地 区 中 。";
const string MinenAnteil_Mis_4 = "根 据 挖 掘 区 域 大 小 法 案 ， 一 小 块 皇 家 领 土 是 水 平 １ ６ 步 、 垂 直 ３ 步 的 范 围 。";
const string MinenAnteil_Mis_5 = "在 区 域 中 的 矿 工 没 有 任 何 关 税 的 约 束 ， 并 且 受 到 保 护 。";
const string MinenAnteil_Mis_6 = "如 果 承 租 人 无 法 支 付 租 金 ， 那 么 所 有 的 开 采 权 力 将 被 王 国 收 回 。";
const string MinenAnteil_Mis_7 = "     签 署";
const string MinenAnteil_Mis_8 = "     国 王 的 采 矿 者";
const string MinenAnteil_Mis_9 = "          萨 伦 德 里 尔";
func void Use_MinenAnteil_Mis()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_1);
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_2);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_3);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_4);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_5);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_6);
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_7);
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_9);
	Doc_Show(nDocID);

	SC_KnowsProspektorSalandril = TRUE;

	if (ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile, TOPIC_MinenAnteile_1);

		if (Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile, TOPIC_MinenAnteile_2);
		};

		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};

//**********************************************************************************
//	Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name						= "灵 魂 召 唤 护 身 符";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItAm_Hp_Mana_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	value						= Value_Am_HpMana;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "免 受 黑 暗 的 窥 视";			count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

//**********************************************************************************
//	Gestein aus gesegneter Erde für das Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name						= "来 自 受 祝 福 的 土 地 的 石 头";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_Rockcrystal.3ds";
	visual_skin					= 0;
	material					= MAT_STONE;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Komprobrief für Lee
// ----------------------------------------------------------------------------------

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name						= "法 官 的 任 务";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_RichterKomproBrief;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string RichterKomproBrief_1 = "默 加 哈 德 ， 你 这 个 没 用 的 废 物 。 执 行 我 的 命 令 ， 否 则 我 将 不 得 不 改 变 对 你 的 态 度 ， 并 逮 捕 你 。";
const string RichterKomproBrief_2 = "这 将 会 发 生 在 明 天 晚 上 。 拉 里 厄 斯 已 经 开 始 怀 疑 了 。 ";
const string RichterKomproBrief_3 = "如 果 我 们 现 在 不 能 把 他 口 袋 里 的 钱 弄 出 来 ， 可 能 就 太 晚 了 。 我 要 你 保 证 今 晚 与 他 在 市 场 碰 面 。 ";
const string RichterKomproBrief_4 = "但 是 别 出 洋 相 ， 否 则 民 兵 会 在 你 知 道 发 生 了 什 么 事 之 前 干 掉 你 。";
const string RichterKomproBrief_5 = "顺 便 说 一 句 ： 如 果 他 刚 好 在 事 态 发 展 中 完 蛋 ， 那 对 我 来 说 非 常 好 。";
const string RichterKomproBrief_6 = "          首 席 法 官 ";
const string RichterKomproBrief_7 = "          国 王 的 大 臣";
func void Use_RichterKomproBrief()
{
	SCKnowsRichterKomproBrief = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_1);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_2);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_3);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_4);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RichterKomproBrief_6);
				Doc_PrintLine	(nDocID, 0, RichterKomproBrief_7);
				Doc_PrintLine	(nDocID, 0, "");

	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_MorgahardTip
// ----------------------------------------------------------------------------------

instance ItWr_MorgahardTip(C_Item)
{
	name						= "信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MorgahardTip;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string MorgahardTip_1 = "我 先 走 一 步 了 。 希 望 我 们 能 在 事 态 平 静 一 些 后 再 见 。";
const string MorgahardTip_2 = "不 要 担 心 ， 小 伙 子 。 如 果 其 他 都 失 败 的 话 ， 我 将 要 求 欧 纳 尔 为 我 们 密 切 注 意 。";
const string MorgahardTip_3 = "一 切 都 会 顺 利 。";
const string MorgahardTip_4 = "     M.";
func void Use_MorgahardTip()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MorgahardTip_1);
				Doc_PrintLines	(nDocID, 0, MorgahardTip_2);
				Doc_PrintLines	(nDocID, 0, MorgahardTip_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, MorgahardTip_4);
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////
//
//	MAP der Schreine
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_Shrine_MIS(C_Item)
{
	name						= "圣 殿 地 图"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_Shrine_MIS;

	value						= 200;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_Shrine_MIS()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_Shrine_MIS);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_Shrine.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//**********************************************************************************
//	ItWr_VinosKellergeister_Mis
//**********************************************************************************

instance ItWr_VinosKellergeister_Mis(C_ITEM)
{
	name						= "葡 萄 酒 的 灵 魂";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_VinosKellergeister_Mis;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string VinosKellergeister_Mis_1 = "葡 萄 的 力 量";
const string VinosKellergeister_Mis_2 = "… … 我 曾 经 多 次 尝 试 ， 但 是 这 种 上 周 从 国 外 带 来 的 水 果 已 经 超 出 了 所 有 的 期 望 … …";
const string VinosKellergeister_Mis_3 = "… … 这 种 葡 萄 的 汁 液 远 远 比 在 这 个 国 家 能 找 到 的 水 果 更 加 美 味 … …";
const string VinosKellergeister_Mis_4 = "… … 到 目 前 为 止 还 不 错 。 但 是 猜 想 我 被 抓 住 之 后 的 命 运 还 是 会 让 我 感 到 紧 张 。 我 不 知 道 ， 如 果 民 兵 在 这 里 抓 住 我 ， 他 们 会 怎 么 处 置 我 。 他 们 甚 至 会 把 我 关 进 屏 障 … …";
const string VinosKellergeister_Mis_5 = "… … 他 们 已 经 怀 疑 了 。 我 要 马 上 离 开 ， 等 待 事 态 稍 微 平 静 一 些 ， 等 我 肯 定 他 们 不 再 追 捕 我 时 ， 我 会 再 继 续 我 的 工 作 … …";
func void Use_VinosKellergeister_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_RED_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_RED_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VinosKellergeister_Mis_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VinosKellergeister_Mis_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	// Absatz
				Doc_PrintLines	(nDocID, 0, VinosKellergeister_Mis_3);
				Doc_PrintLines	(nDocID, 0, "");

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, VinosKellergeister_Mis_4);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, VinosKellergeister_Mis_5);
	Doc_Show(nDocID);
};
