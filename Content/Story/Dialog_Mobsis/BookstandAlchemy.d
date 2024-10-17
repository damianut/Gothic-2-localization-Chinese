// ##########################################################################
// ##
// ## Bookstand Alchemie
// ##
// ##########################################################################

// ----------------------
var int ALchemy_1_permanent;
// ----------------------
// ----------------------
var int ALchemy_2_permanent;
// ----------------------
// ----------------------
var int ALchemy_3_permanent;
// ----------------------

const string BookstandALCHEMY1_S1_1 = "魔 法 能 力 药 剂";
const string BookstandALCHEMY1_S1_2 = "还 有 原 料";
const string BookstandALCHEMY1_S1_3 = "２ 火 荨 麻";
const string BookstandALCHEMY1_S1_4 = "２ 柳 兰";
const string BookstandALCHEMY1_S1_5 = "２ 火 根";
const string BookstandALCHEMY1_S1_6 = "所 有 在 炼 金 术 士 工 作 台 上 进 行 的 工 作 过 程 中 都 需 要 一 个 实 验 烧 瓶 。";
const string BookstandALCHEMY1_S1_7 = "要 酿 造 任 何 治 疗 药 剂 或 者 增 强 魔 法 能 力 的 药 剂 ， 我 需 要 特 殊 的 原 料 和 植 物 ：";
const string BookstandALCHEMY1_S1_8 = "洼 地 节 草";
const string BookstandALCHEMY1_S1_9 = "要 酿 造 任 何 永 远 改 变 身 体 或 者 精 神 的 药 剂 ， 你 需 要 一 种 特 殊 的 植 物 ： ";
const string BookstandALCHEMY1_S1_10 = "国 王 酢 浆 草";
func void Use_BookstandALCHEMY1_S1() // Alchemiebücher
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY1_S1_1);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY1_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_ManaPotion1);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY1_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_ManaPotion2);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY1_S1_4);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_ManaPotion3);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY1_S1_5);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY1_S1_6);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY1_S1_7);
		Doc_PrintLine(nDocID, 1, BookstandALCHEMY1_S1_8);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY1_S1_9);
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY1_S1_10);
		Doc_Show(nDocID);

		if (ALchemy_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_1_permanent = TRUE;
		};
	};
};

const string BookstandALCHEMY2_S1_1 = "治 疗 药 剂";
const string BookstandALCHEMY2_S1_2 = "还 有 原 料";
const string BookstandALCHEMY2_S1_3 = "２ 治 疗 植 物";
const string BookstandALCHEMY2_S1_4 = "２ 治 疗 药 草";
const string BookstandALCHEMY2_S1_5 = "２ 治 疗 根";
const string BookstandALCHEMY2_S1_6 = "所 有 在 炼 金 术 士 工 作 台 上 进 行 的 工 作 过 程 中 都 需 要 一 个 实 验 烧 瓶 。";
const string BookstandALCHEMY2_S1_7 = "要 酿 造 任 何 治 疗 药 剂 或 者 增 强 魔 法 能 力 的 药 剂 ， 我 需 要 特 殊 的 原 料 和 植 物 ：";
const string BookstandALCHEMY2_S1_8 = "洼 地 节 草";
const string BookstandALCHEMY2_S1_9 = "要 酿 造 任 何 永 远 改 变 身 体 或 者 精 神 的 药 剂 ， 你 需 要 一 种 特 殊 的 植 物 ： ";
const string BookstandALCHEMY2_S1_10 = "国 王 酢 浆 草";
func void Use_BookstandALCHEMY2_S1() // Alchemiebücher
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY2_S1_1);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY2_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_HealthPotion1);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY2_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_HealthPotion2);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY2_S1_4);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_HealthPotion3);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY2_S1_5);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY2_S1_6);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY2_S1_7);
		Doc_PrintLine(nDocID, 1, BookstandALCHEMY2_S1_8);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY2_S1_9);
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY2_S1_10);
		Doc_Show(nDocID);

		if (ALchemy_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_2_permanent = TRUE;
		};
	};
};

const string BookstandALCHEMY3_S1_1 = "永 久 改 变 药 剂";
const string BookstandALCHEMY3_S1_2 = "还 有 原 料";
const string BookstandALCHEMY3_S1_3 = "1 哥 布 林 浆 果";
const string BookstandALCHEMY3_S1_4 = "１ 暴 龙 草 - 这 种 药 剂 需 要 的 不 是 国 王 酢 浆 草 ， 而 是 洼 地 节 草 。";
const string BookstandALCHEMY3_S1_5 = "1 龙 根";
const string BookstandALCHEMY3_S1_6 = "1 治 疗 根";
const string BookstandALCHEMY3_S1_7 = "1 火 根";
const string BookstandALCHEMY3_S1_8 = "酿 造 这 些 配 方 是 炼 金 术 的 最 高 技 能 。 他 们 都 要 使 用 国 王 酢 浆 草 作 为 一 种 常 用 原 料 。";
const string BookstandALCHEMY3_S1_9 = "速 度 药 剂 是 一 种 制 造 相 当 简 单 的 药 剂 ， 因 为 它 不 需 要 国 王 酢 浆 草 。 ";
func void Use_BookstandALCHEMY3_S1() // Alchemiebücher
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandALCHEMY3_S1_1);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY3_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, NAME_Dex_Permanent);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY3_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_Speed_Potion);
		Doc_PrintLines(nDocID, 0, BookstandALCHEMY3_S1_4);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, NAME_Str_Permanent);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY3_S1_5);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, NAME_HealthPermanent);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY3_S1_6);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, NAME_ManaPermanent);
		Doc_PrintLine(nDocID, 0, BookstandALCHEMY3_S1_7);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY3_S1_8);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandALCHEMY3_S1_9);
		Doc_PrintLine(nDocID, 1, "");

		Doc_Show(nDocID);

		if (ALchemy_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_3_permanent = TRUE;
		};
	};
};
