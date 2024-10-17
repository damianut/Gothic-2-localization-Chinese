// *****************************************************************
// // Joly: Auge Innos nicht dabei? Kein Problem. Xardas hilft auch dir Idiot!!!!!!!!!!!!
// Vorsicht: Nur für D.A.U.s
// *****************************************************************

instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name						= "非 常 奇 怪 的 皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_XardasNotfallBeutel;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "这 个 背 包 里 面 似 乎";						count[1] = 0;
	text[2]						= "有 一 个 硬 的 东 西 ";						count[2] = 0;
	text[3]						= "和 一 份 文 件 。";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_XardasNotfallBeutel()
{
	CreateInvItems(hero, ItWr_XardasErmahnungFuerIdioten_MIS, 1);
	CreateInvItems(hero, ItMi_InnosEye_Discharged_Mis, 1);

	var string concatText;

	concatText = ConcatStrings("2", PRINT_ItemsErhalten);
	Print(concatText);
};

//**********************************************************************************
//	ItWr_XardasErmahnungFuerIdioten_MIS
//**********************************************************************************

instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name						= "艾 克 萨 达 斯 的 警 告 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasErmahnungFuerIdioten;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string XardasErmahnungFuerIdioten_1 = "你 太 令 我 失 望 了 ！ 没 拿 到 ‘ 英 诺 斯 之 眼 ’ 你 就 离 开 了 船 ？";
const string XardasErmahnungFuerIdioten_2 = "我 只 能 希 望 你 能 小 心 谨 慎 。 否 则 你 永 远 无 法 消 除 世 界 上 的 邪 恶 ， 而 我 也 因 为 你 的 愚 蠢 而 亲 自 处 决 你 。";
const string XardasErmahnungFuerIdioten_3 = "                      艾 克 萨 达 斯";
func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, XardasErmahnungFuerIdioten_1);
				Doc_PrintLines	(nDocID, 0, XardasErmahnungFuerIdioten_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, XardasErmahnungFuerIdioten_3);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	Brief in der Krypta
// ----------------------------------------------------------------------------------

instance ItWr_Krypta_Garon(C_Item)
{
	name						= "陈 旧 的 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Krypta_Garon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "颤 抖 的 字 体 。";			count[3] = 0;
};

const string Krypta_Garon_1 = "我 失 败 了 。 我 想 让 伊 努 比 斯 一 直 走 善 良 之 路 的 努 力 都 是 徒 劳 。 ";
const string Krypta_Garon_2 = "首 先 我 认 为 我 死 了 。 但 是 在 伊 凡 的 骸 骨 中 充 满 了 力 量 。 ";
const string Krypta_Garon_3 = "伊 努 比 斯 从 死 亡 中 复 苏 了 。 由 于 被 远 古 的 圣 骑 士 消 灭 ， 他 现 在 要 为 他 的 诅 咒 复 仇 。";
const string Krypta_Garon_4 = "他 的 大 部 分 追 随 者 都 和 他 在 一 起 。 我 无 法 想 象 像 伊 努 比 斯 这 样 的 军 阀 会 变 得 如 此 邪 恶 。 ";
const string Krypta_Garon_5 = "我 在 这 个 地 下 室 找 到 了 他 的 坟 墓 。 但 是 我 不 能 肯 定 我 是 否 可 以 一 直 报 告 我 的 发 现 。 所 以 我 把 这 些 都 记 录 下 来 ， 并 希 望 有 人 能 找 到 它 。";
const string Krypta_Garon_6 = "注 意 。 一 个 强 大 的 敌 人 正 在 接 近 这 些 正 义 的 灵 魂 。 伊 努 比 斯 不 会 是 最 后 一 个 。";
const string Krypta_Garon_7 = "愿 英 诺 斯 拯 救 你 的 灵 魂 。";
const string Krypta_Garon_8 = "                                 伊 凡";
func void Use_Krypta_Garon()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_1);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_2);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_3);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_4);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_5);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Krypta_Garon_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Krypta_Garon_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus

	Doc_Show(nDocID);
};

//****************************************************************************
//				DragonIsle_Undead_Schlüssel
//			---------------------------------------------
//****************************************************************************

//**********************************************************************************
//	Knasttürschlüssel für Pedros Zelle auf DI
//**********************************************************************************

instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name						= "兽 人 上 校 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItKe_EVT_UNDEAD_01(C_Item) // Schlüssel für erste Tür
{
	name						= "亚 绍 尔 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= name;											count[2] = 0;
};

//**********************************************************************************
//	Schlüssel zum Labyrinth der Untoten auf DI
//**********************************************************************************

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name						= "钥 匙 大 师 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Kammerschlüssel für´s Tor zum Saal des Untoten Drachen.
//**********************************************************************************

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name						= "黑 魔 法 师 的 房 间 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Schriftrolle für´s Tor zum Saal des Untoten Drachen.
//**********************************************************************************

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name						= "黑 魔 法 师 的 卷 轴";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_LastDoorToUndeadDrgDI_MIS;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ItWr_LastDoorToUndeadDrgDI_MIS_1 = "KHADOSH ";
const string ItWr_LastDoorToUndeadDrgDI_MIS_2 = "EMEM KADAR";
const string ItWr_LastDoorToUndeadDrgDI_MIS_3 = "能 量 之 眼 照 亮 了 你 的 道 路 。";
func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_LastDoorToUndeadDrgDI_MIS_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_LastDoorToUndeadDrgDI_MIS_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_LastDoorToUndeadDrgDI_MIS_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus

	Doc_Show(nDocID);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_2);
};

//**********************************************************************************
//	Schlüssel zur Truhe in der Kammer des OberDementors.
//**********************************************************************************
instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name						= "黑 魔 法 师 的 箱 子 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Der Schwarzmagiernovize
//**********************************************************************************

//**********************************************************************************
//	ItWr_Rezept_MegaDrink_MIS
//**********************************************************************************

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name						= "配方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_RezeptFuerMegaTrank;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string RezeptFuerMegaTrank_1 = "我 得 到 了 一 种 远 古 技 能 。 我 担 心 费 欧 达 隆 不 会 对 我 的 成 绩 留 下 什 么 印 象 。";
const string RezeptFuerMegaTrank_2 = "这 就 是 说 ， 非 常 简 单 ， 我 可 以 把 他 的 所 有 蛋 在 我 的 实 验 室 中 融 合 进 药 剂 。 只 要 他 不 是 像 母 鸡 一 样 整 天 蹲 在 他 的 蛋 上 ， 我 就 可 以 尝 试 一 下 。 但 是 他 仍 旧 对 我 有 些 歧 视 。";
const string RezeptFuerMegaTrank_3 = "艾 姆 巴 拉 · 费 尔 加 斯 托：";
const string RezeptFuerMegaTrank_4 = "１ １ 个 龙 蛋 ， 一 份 黑 珍 珠 粉 末 和 一 小 撮 硫 磺 。";
const string RezeptFuerMegaTrank_5 = "把 乳 状 液 体 煮 沸 ， 并 在 它 通 过 蒸 馏 器 时 要 不 断 的 搅 拌 。";
const string RezeptFuerMegaTrank_6 = "这 种 炼 金 药 在 使 用 过 程 中 必 须 要 十 分 小 心 。 它 可 能 会 有 强 烈 的 副 作 用 ， 可 能 会 颠 覆 整 个 魔 法 系 统 。";
func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_1);
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RezeptFuerMegaTrank_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_4);
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_5);
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_6);

	Doc_Show(nDocID);

	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};

//**********************************************************************************
//	Tagebuch des SchwarzmagierNovizen
//**********************************************************************************

instance ItWr_Diary_BlackNovice_MIS(C_ITEM)
{
	name						= "日 记";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Diary_BlackNovice;

	value						= 100;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string Diary_BlackNovice_1 = "到 现 在 为 止 ， 我 已 经 等 候 ３ ６ 天 的 命 令 了 。 我 开 始 怀 疑 他 们 会 把 我 带 走 。 但 是 我 已 经 完 成 了 他 们 要 求 我 做 的 所 有 事 情 。 我 像 个 女 仆 一 样 为 他 们 取 东 西 、 带 东 西 。";
const string Diary_BlackNovice_2 = "钥 匙 大 师 通 知 我 把 门 封 住 。 我 还 没 有 到 它 附 近 去 。 如 果 有 东 西 靠 近 这 个 方 向 ， 肯 定 会 有 人 穿 过 大 门 。";
const string Diary_BlackNovice_3 = "我 记 不 住 那 个 组 合 方 式 真 是 太 丢 人 了 。 ";
const string Diary_BlackNovice_4 = "我 应 该 在 几 年 前 就 潜 入 大 厅 。 我 等 不 及 去 见 大 师 。 我 想 知 道 当 我 成 为 他 们 一 员 时 ， 他 们 是 否 会 让 我 见 他 ？";
const string Diary_BlackNovice_5 = "我 昨 天 去 碰 了 碰 运 气 。 但 是 在 我 可 以 按 照 正 确 的 顺 序 按 动 西 边 的 三 个 开 关 之 前 ， 那 间 有 两 个 拉 杆 的 房 间 挡 住 了 我 。 那 个 混 蛋 把 房 间 锁 住 了 ！ 明 天 我 要 再 去 试 试 ， 我 要 从 他 身 上 拿 到 钥 匙 … …";
func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_RED_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_RED_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Diary_BlackNovice_1);
	// Absatz
				Doc_PrintLines	(nDocID, 0, Diary_BlackNovice_2);
				Doc_PrintLines	(nDocID, 0, Diary_BlackNovice_3);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Diary_BlackNovice_4);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, Diary_BlackNovice_5);
	Doc_Show(nDocID);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_3);
};

//**********************************************************************************
//	ItWr_ZugBruecke_MIS
//**********************************************************************************

instance ItWr_ZugBruecke_MIS(C_Item)
{
	name						= "陈 旧 的 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ZugBruecke;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ZugBruecke_1 = "最 后 警 告 ！";
const string ZugBruecke_2 = "我 不 在 乎 你 是 否 能 从 另 一 边 通 过 大 桥 。 如 果 还 要 我 说 什 么 的 话 ， 你 将 会 在 地 狱 中 腐 烂 。";
const string ZugBruecke_3 = "一 进 入 我 的 领 地 ， 我 就 要 马 上 把 这 座 桥 沉 掉 。 如 果 我 还 能 再 找 到 一 个 人 使 用 弓 箭 击 中 开 关 的 话 ， 我 一 定 要 亲 自 把 那 个 白 痴 吊 死 在 附 近 的 树 上 ！";
const string ZugBruecke_4 = "                      亚 绍 尔";
func void Use_ZugBruecke()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ZugBruecke_1);
				Doc_SetMargins(nDocID, -1, 50, 50, 70, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ZugBruecke_2);
				Doc_PrintLines	(nDocID, 0, ZugBruecke_3);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ZugBruecke_4);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItMi_PowerEye zum öffnen der letzten Tür
//**********************************************************************************

instance ItMi_PowerEye(C_Item)
{
	name						= "能 量 之 眼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_DarkPearl.3ds";
	material					= MAT_METAL;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};
