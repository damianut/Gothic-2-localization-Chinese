//**********************************************************************************
//	StandardBrief
//**********************************************************************************

instance StandardBrief(C_Item)
{
	name						= "信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseStandardBrief;

	value						= 0;

	description					= "标 准 的 信";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string StandardBrief_1 = "标 准 的 信";
const string StandardBrief_2 = "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla";
func void UseStandardBrief()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, StandardBrief_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StandardBrief_2);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	StandardBuch
//**********************************************************************************

instance StandardBuch(C_ITEM)
{
	name						= "标 准 的 书";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseStandardBuch;

	value						= 100;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string StandardBuch_1 = "标 准 的 书 第 一 页";
const string StandardBuch_2 = "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla";
const string StandardBuch_3 = "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla";
const string StandardBuch_4 = "标 准 的 书 第 二 页";
func void UseStandardBuch()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StandardBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, StandardBuch_2);
	// Absatz
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 0, StandardBuch_3);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, StandardBuch_4);
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, StandardBuch_2);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, StandardBuch_2);
	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////
//
//	MAPS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_NewWorld(C_Item)
{
	name						= "克 霍 里 尼 斯 的 地 形 图"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld;

	value						= 250;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

instance ItWr_Map_NewWorld_City(C_Item)
{
	name						= "克 霍 里 尼 斯 的 城 市 地 图"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_City;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_City()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_City);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_City.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -6900, 11800, 21600, -9400);
	Doc_Show(Document);
};

instance ItWr_Map_OldWorld(C_Item)
{
	name						= "矿 藏 山 谷 的 地 图";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_OldWorld;

	value						= 350;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_OldWorld()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_OldWorld.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document, -78500, 47500, 54000, -53000);
	Doc_Show(Document);
};

var int Lerne_Einhand;
var int Lerne_Zweihand;
// ---------------------------------------------------------------------------------------------------------------------------
//						Einhandkampf
// ---------------------------------------------------------------------------------------------------------------------------
instance ItWr_EinhandBuch(C_ITEM)
{
	name						= "战 斗 技 巧";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseEinhandBuch;

	value						= 5000;

	description					= "南 方 防 御 技 巧";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 本 关 于";						count[2] = 0;
	text[3]						= "单 手 战 斗 技 巧 的 书 。";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string EinhandBuch_1 = "南 方 防 御 技 巧";
const string EinhandBuch_2 = "南 方 人 比 北 方 人 使 用 的 力 量 要 小 ， 更 多 地 依 靠 敏 捷 。 在 家 乡 炎 热 的 气 候 中 ， 他 更 喜 欢 轻 型 盔 甲 ， 可 以 让 他 自 由 行 动 。 因 此 ， 南 方 人 发 展 出 一 种 与 我 们 完 全 不 同 的 格 斗 风 格 。 ";
const string EinhandBuch_3 = "可 能 南 方 人 最 出 名 的 战 术 就 是 使 用 单 手 割 和 后 退 步 伐 。 后 退 步 伐 可 以 减 少 对 手 攻 击 所 带 来 的 冲 击 ， 同 时 可 以 进 入 反 击 姿 态 。";
func void UseEinhandBuch()
{
	if (Lerne_Einhand == FALSE)
	{
		B_RaiseFightTalent(self, NPC_TALENT_1H, 5);
		Print(PRINT_Learn1H);
		Lerne_Einhand = TRUE;
		Snd_Play("Levelup");
	};

	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, EinhandBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, EinhandBuch_2);

				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, EinhandBuch_3);
				Doc_PrintLine	(nDocID, 1, "");

	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------------------------------------------------------
//						Zweihandkampf
// ---------------------------------------------------------------------------------------------------------------------------
instance ItWr_ZweihandBuch(C_ITEM)
{
	name						= "战 斗 策 略 ";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseZweihandBuch;

	value						= 5000;

	description					= "双 重 格 挡";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 本 关 于";						count[2] = 0;
	text[3]						= "双 手 战 斗 。";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ZweihandBuch_1 = "双 重 格 挡";
const string ZweihandBuch_2 = "使 用 双 手 武 器 格 挡 敌 人 的 刀 剑 是 强 壮 的 战 士 用 来 阻 止 冲 击 并 迫 使 对 手 的 组 合 技 能 突 然 中 断 的 方 法 。 ";
const string ZweihandBuch_3 = "通 常 中 断 敌 人 行 动 之 后 ， 就 有 机 会 占 据 主 动 并 利 用 娴 熟 的 打 击 击 败 敌 人 。    ";
func void UseZweihandBuch()
{
	if (Lerne_Zweihand == FALSE)
	{
		B_RaiseFightTalent(self, NPC_TALENT_2H, 5);
		Print(PRINT_Learn2H);
		Lerne_Zweihand = TRUE;
		Snd_Play("Levelup");
	};

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ZweihandBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ZweihandBuch_2);

				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, "");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, ZweihandBuch_3);

	Doc_Show(nDocID);
};
