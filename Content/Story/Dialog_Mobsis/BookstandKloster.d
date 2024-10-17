// -------------------------------------------------------------------------------------
//				Weitere Buchständer in der Magierbibliothek
// -------------------------------------------------------------------------------------
//				Runensteine
// -------------------------------------------------------------------------------------
const string Bookstand_Rune_01_S1_1 = "第1页";
const string Bookstand_Rune_01_S1_2 = "咒 语 石";
const string Bookstand_Rune_01_S1_3 = "第2页";

func void Use_Bookstand_Rune_01_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Rune_01_S1_1);
		Doc_PrintLine(nDocID, 0, Bookstand_Rune_01_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, Bookstand_Rune_01_S1_3);
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen und Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Rune_02_S1_1 = "第1页";
const string Bookstand_Rune_02_S1_2 = "咒 语 和 它 们 的 原 料";
const string Bookstand_Rune_02_S1_3 = "第2页";

func void Use_Bookstand_Rune_02_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Rune_02_S1_1);
		Doc_PrintLine(nDocID, 0, Bookstand_Rune_02_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, Bookstand_Rune_02_S1_3);
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Die Lehren Innos
// -------------------------------------------------------------------------------------
const string Bookstand_Innos_01_S1_1 = "第1页";
const string Bookstand_Innos_01_S1_2 = "英 诺 斯 的 教 义";
const string Bookstand_Innos_01_S1_3 = "第2页";

func void Use_Bookstand_Innos_01_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Innos_01_S1_1);
		Doc_PrintLine(nDocID, 0, Bookstand_Innos_01_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, Bookstand_Innos_01_S1_3);
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Die Gebote Innos
// -------------------------------------------------------------------------------------
const string Bookstand_Innos_02_S1_1 = "第1页";
const string Bookstand_Innos_02_S1_2 = "英 诺 斯 的 戒 律";
const string Bookstand_Innos_02_S1_3 = "第2页";

func void Use_Bookstand_Innos_02_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Innos_02_S1_1);
		Doc_PrintLine(nDocID, 0, Bookstand_Innos_02_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, Bookstand_Innos_02_S1_3);
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen des ersten Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Kreise_01_S1_1 = "第 一 环";
const string Bookstand_Kreise_01_S1_2 = "第 一 环 咒 语 和 制 造 它 们 所 需 的 原 料 ";
const string Bookstand_Kreise_01_S1_3 = "金 币";
const string Bookstand_Kreise_01_S1_4 = "火 箭";
const string Bookstand_Kreise_01_S1_5 = "硫 磺";
const string Bookstand_Kreise_01_S1_6 = "小 型 闪 电";
const string Bookstand_Kreise_01_S1_7 = "岩 石 水 晶";
const string Bookstand_Kreise_01_S1_8 = "哥 布 林 骷 髅";
const string Bookstand_Kreise_01_S1_9 = "哥 布 林 的 骨 头";
const string Bookstand_Kreise_01_S1_10 = "治 疗 植 物";
const string Bookstand_Kreise_01_S1_11 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Bookstand_Kreise_01_S1_12 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Bookstand_Kreise_01_S1_13 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Bookstand_Kreise_01_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Kreise_01_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, NAME_SPL_LIGHT);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_3);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_4);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_5);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_6);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_7);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_8);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_9);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, NAME_SPL_LightHeal);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_01_S1_10);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_01_S1_11);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_01_S1_12);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_01_S1_13);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen des zweiten Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Kreise_02_S1_1 = "第 二 环";
const string Bookstand_Kreise_02_S1_2 = "第 二 环 咒 语 和 制 造 它 们 所 需 的 原 料 ";
const string Bookstand_Kreise_02_S1_3 = "火 球";
const string Bookstand_Kreise_02_S1_4 = "沥 青";
const string Bookstand_Kreise_02_S1_5 = "冰 箭";
const string Bookstand_Kreise_02_S1_6 = "冰 河 石 英";
const string Bookstand_Kreise_02_S1_7 = "召 唤 狼";
const string Bookstand_Kreise_02_S1_8 = "狼 皮";
const string Bookstand_Kreise_02_S1_9 = "风 之 拳";
const string Bookstand_Kreise_02_S1_10 = "煤";
const string Bookstand_Kreise_02_S1_11 = "催 眠";
const string Bookstand_Kreise_02_S1_12 = "沼 生 草";
const string Bookstand_Kreise_02_S1_13 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Bookstand_Kreise_02_S1_14 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Bookstand_Kreise_02_S1_15 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Bookstand_Kreise_02_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Kreise_02_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_3);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_4);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_5);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_6);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_7);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_8);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_9);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_10);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_11);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_02_S1_12);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_02_S1_13);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_02_S1_14);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_02_S1_15);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen des dritten Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Kreise_03_S1_1 = "第 三 环";
const string Bookstand_Kreise_03_S1_2 = "第 三 环 咒 语 和 制 造 它 们 所 需 的 原 料 ";
const string Bookstand_Kreise_03_S1_3 = "治 疗 药 草";
const string Bookstand_Kreise_03_S1_4 = "小 型 火 焰 风 暴";
const string Bookstand_Kreise_03_S1_5 = "沥 青，硫 磺";
const string Bookstand_Kreise_03_S1_6 = "制 造 骷 髅";
const string Bookstand_Kreise_03_S1_7 = "骷 髅 骨 头";
const string Bookstand_Kreise_03_S1_8 = "恐 惧";
const string Bookstand_Kreise_03_S1_9 = "黑 珍 珠";
const string Bookstand_Kreise_03_S1_10 = "冰 块";
const string Bookstand_Kreise_03_S1_11 = "冰 河 石 英";
const string Bookstand_Kreise_03_S1_12 = "蓝 宝 石";
const string Bookstand_Kreise_03_S1_13 = "球 形 闪 电";
const string Bookstand_Kreise_03_S1_14 = "岩 石 水 晶";
const string Bookstand_Kreise_03_S1_15 = "硫 磺";
const string Bookstand_Kreise_03_S1_16 = "火 球";
const string Bookstand_Kreise_03_S1_17 = "沥 青，硫 磺";
const string Bookstand_Kreise_03_S1_18 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Bookstand_Kreise_03_S1_19 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Bookstand_Kreise_03_S1_20 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Bookstand_Kreise_03_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_1);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, Bookstand_Kreise_03_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, NAME_SPL_MediumHeal);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_3);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_4);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_5);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_6);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_7);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_8);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_9);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_10);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_11);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_12);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_13);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_14);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_15);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_16);
		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_03_S1_17);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_03_S1_18);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_03_S1_19);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_03_S1_20);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen des vierten Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Kreise_04_S1_1 = "第 四 环";
const string Bookstand_Kreise_04_S1_2 = "第 四 环 咒 语 和 制 造 它 们 所 需 的 原 料 ";
const string Bookstand_Kreise_04_S1_3 = "大 火 球";
const string Bookstand_Kreise_04_S1_4 = "硫 磺";
const string Bookstand_Kreise_04_S1_5 = "沥 青";
const string Bookstand_Kreise_04_S1_6 = "闪 电";
const string Bookstand_Kreise_04_S1_7 = "岩 石 水 晶";
const string Bookstand_Kreise_04_S1_8 = "冰 河 石 英";
const string Bookstand_Kreise_04_S1_9 = "唤 醒 巨 人";
const string Bookstand_Kreise_04_S1_10 = "石 巨 人 之 心";
const string Bookstand_Kreise_04_S1_11 = "消 灭 亡 灵";
const string Bookstand_Kreise_04_S1_12 = "圣 水";
const string Bookstand_Kreise_04_S1_13 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Bookstand_Kreise_04_S1_14 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Bookstand_Kreise_04_S1_15 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Bookstand_Kreise_04_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_1);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, Bookstand_Kreise_04_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_3);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_4);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_5);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_6);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_7);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_8);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_9);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_10);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_11);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_04_S1_12);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_04_S1_13);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_04_S1_14);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_04_S1_15);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen des fünften Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Kreise_05_S1_1 = "第 五 环";
const string Bookstand_Kreise_05_S1_2 = "第 五 环 咒 语 和 制 造 它 们 所 需 的 原 料 ";
const string Bookstand_Kreise_05_S1_3 = "冰 浪";
const string Bookstand_Kreise_05_S1_4 = "冰 河 石 英";
const string Bookstand_Kreise_05_S1_5 = "蓝 宝 石";
const string Bookstand_Kreise_05_S1_6 = "大 型 火 焰 风 暴";
const string Bookstand_Kreise_05_S1_7 = "硫 磺";
const string Bookstand_Kreise_05_S1_8 = "火 焰 之 舌";
const string Bookstand_Kreise_05_S1_9 = "召 唤 魔 鬼";
const string Bookstand_Kreise_05_S1_10 = "魔 鬼 的 心 脏";
const string Bookstand_Kreise_05_S1_11 = "治 疗 重 伤";
const string Bookstand_Kreise_05_S1_12 = "治 疗 根";
const string Bookstand_Kreise_05_S1_13 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Bookstand_Kreise_05_S1_14 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Bookstand_Kreise_05_S1_15 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Bookstand_Kreise_05_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_1);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, Bookstand_Kreise_05_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_3);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_4);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_5);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_6);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_7);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_8);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_9);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_10);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_11);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_05_S1_12);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_05_S1_13);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_05_S1_14);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_05_S1_15);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Runen des sechsten Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Bookstand_Kreise_06_S1_1 = "第 六 环";
const string Bookstand_Kreise_06_S1_2 = "第 六 环 咒 语 和 制 造 它 们 所 需 的 原 料 ";
const string Bookstand_Kreise_06_S1_3 = "火 雨";
const string Bookstand_Kreise_06_S1_4 = "沥 青";
const string Bookstand_Kreise_06_S1_5 = "硫 磺";
const string Bookstand_Kreise_06_S1_6 = "火 焰 之 舌";
const string Bookstand_Kreise_06_S1_7 = "死 亡 呼 吸";
const string Bookstand_Kreise_06_S1_8 = "煤";
const string Bookstand_Kreise_06_S1_9 = "黑 珍 珠";
const string Bookstand_Kreise_06_S1_10 = "死 亡 之 波";
const string Bookstand_Kreise_06_S1_11 = "骷 髅 骨 头";
const string Bookstand_Kreise_06_S1_12 = "黑 珍 珠";
const string Bookstand_Kreise_06_S1_13 = "黑 暗 军 队";
const string Bookstand_Kreise_06_S1_14 = "骷 髅 骨 头";
const string Bookstand_Kreise_06_S1_15 = "黑 珍 珠";
const string Bookstand_Kreise_06_S1_16 = "石 巨 人 之 心";
const string Bookstand_Kreise_06_S1_17 = "魔 鬼 的 心 脏";
const string Bookstand_Kreise_06_S1_18 = "缩 小 怪 物";
const string Bookstand_Kreise_06_S1_19 = "哥 布 林 的 骨 头";
const string Bookstand_Kreise_06_S1_20 = "巨 魔 獠 牙";
const string Bookstand_Kreise_06_S1_21 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Bookstand_Kreise_06_S1_22 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Bookstand_Kreise_06_S1_23 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Bookstand_Kreise_06_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_1);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, Bookstand_Kreise_06_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_3);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_4);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_5);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_6);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_7);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_8);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_9);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_10);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_11);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_12);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_13);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_14);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_15);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_16);
		Doc_PrintLine(nDocID, 0, Bookstand_Kreise_06_S1_17);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLine(nDocID, 1, Bookstand_Kreise_06_S1_18);
		Doc_PrintLine(nDocID, 1, Bookstand_Kreise_06_S1_19);
		Doc_PrintLine(nDocID, 1, Bookstand_Kreise_06_S1_20);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_06_S1_21);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_06_S1_22);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Kreise_06_S1_23);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Die Regeln im Kloster
// -------------------------------------------------------------------------------------
const string Bookstand_Rules_01_S1_1 = "第1页";
const string Bookstand_Rules_01_S1_2 = "规 则";
const string Bookstand_Rules_01_S1_3 = "第2页";
func void Use_Bookstand_Rules_01_S1()
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

		Doc_PrintLine(nDocID, 0, Bookstand_Rules_01_S1_1);
		Doc_PrintLine(nDocID, 0, Bookstand_Rules_01_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, Bookstand_Rules_01_S1_3);
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);
	};
};
