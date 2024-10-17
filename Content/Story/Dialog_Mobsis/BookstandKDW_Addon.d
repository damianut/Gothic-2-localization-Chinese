// -------------------------------------------------------------------------------------
//				Runensteine Wassermagie
// -------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------
//				Runen des ersten Kreises und ihre Ingredenzien
// -------------------------------------------------------------------------------------
const string Runemaking_KDW_CIRC1_S1_1 = "水 之 环";
const string Runemaking_KDW_CIRC1_S1_2 = "水 咒 语 和 制 造 时 需 要 的 原 料 。 ";
const string Runemaking_KDW_CIRC1_S1_3 = "旋 风";
const string Runemaking_KDW_CIRC1_S1_4 = "血 蝇 的 翅 膀";
const string Runemaking_KDW_CIRC1_S1_5 = "冰 矛";
const string Runemaking_KDW_CIRC1_S1_6 = "冰 河 石 英";
const string Runemaking_KDW_CIRC1_S1_7 = "喷 泉";
const string Runemaking_KDW_CIRC1_S1_8 = "蓝 宝 石";
const string Runemaking_KDW_CIRC1_S1_9 = "风 暴";
const string Runemaking_KDW_CIRC1_S1_10 = "冰 河 石 英";
const string Runemaking_KDW_CIRC1_S1_11 = "血 蝇 的 翅 膀";
const string Runemaking_KDW_CIRC1_S1_12 = "水 拳";
const string Runemaking_KDW_CIRC1_S1_13 = "蓝 宝 石";
const string Runemaking_KDW_CIRC1_S1_14 = "岩 石 水 晶";
const string Runemaking_KDW_CIRC1_S1_15 = "要 制 造 咒 语 ， 你 总 是 需 要 下 面 所 列 的 原 料 。";
const string Runemaking_KDW_CIRC1_S1_16 = "使 用 者 必 须 知 道 魔 法 的 公 式 ， 同 时 他 必 须 有 一 个 空 白 的 咒 语 石 和 一 个 所 需 魔 法 的 魔 法 卷 轴 。";
const string Runemaking_KDW_CIRC1_S1_17 = "只 有 这 些 需 求 都 满 足 后 ， 才 能 在 咒 语 台 上 开 始 工 作 。";
func void Use_Runemaking_KDW_CIRC1_S1()
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

		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Runemaking_KDW_CIRC1_S1_2);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_3);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_4);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_5);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_6);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_7);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_8);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_9);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_10);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_11);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_12);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_13);
		Doc_PrintLine(nDocID, 0, Runemaking_KDW_CIRC1_S1_14);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_PrintLines(nDocID, 1, Runemaking_KDW_CIRC1_S1_15);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Runemaking_KDW_CIRC1_S1_16);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Runemaking_KDW_CIRC1_S1_17);
		Doc_Show(nDocID);
	};
};

func void Use_Runemaking_KDW_CIRC2_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC3_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC4_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC5_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};

func void Use_Runemaking_KDW_CIRC6_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};
