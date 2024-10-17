//*************************************
//	Buchständer im Banditenlager
//*************************************

const string Bookstand_Addon_BL_S1_1 = "矿 井";
const string Bookstand_Addon_BL_S1_2 = "科 瑞 姆 桑 ： 收 到 ７ ９ 金 块 并 且 熔 解";
const string Bookstand_Addon_BL_S1_3 = "斯 凯 蒂 ： ２ ５ ０ 金 币 收 购 货 物";
const string Bookstand_Addon_BL_S1_4 = "加 莱 兹 ： 收 到 ６ 金 块";
const string Bookstand_Addon_BL_S1_5 = "所 有 守 卫 ： 收 到 ９ 金 块";
const string Bookstand_Addon_BL_S1_6 = "营 地 ：  ";
const string Bookstand_Addon_BL_S1_7 = "瑞 雯 的 守 卫 ： ２ ５ 金 币";
const string Bookstand_Addon_BL_S1_8 = "芬 恩 ： ６ ０ 金 币";
const string Bookstand_Addon_BL_S1_9 = "雷 纳 尔 ： ４ ０ 金 币";
const string Bookstand_Addon_BL_S1_10 = "艾 米 里 欧 ： ５ ０ 金 币";
const string Bookstand_Addon_BL_S1_11 = "其 他 ： ２ ０ 金 币";
const string Bookstand_Addon_BL_S1_12 = "胡 诺 ， 费 斯 克 ， 斯 耐 夫 ： 各 自 按 货 物";
const string Bookstand_Addon_BL_S1_13 = "猎 人 ： 让 首 领 处 理 这 些 ！ 佛 朗 哥 得 到 ７ 金 币";
func void Use_Bookstand_Addon_BL_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, Bookstand_Addon_BL_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Addon_BL_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Addon_BL_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Addon_BL_S1_4);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Addon_BL_S1_5);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, Bookstand_Addon_BL_S1_6);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_7);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_8);
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_9);
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_10);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_11);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_12);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Addon_BL_S1_13);
		Doc_Show(nDocID);
	};
};

// ##########################################################################
// ##
// ## SteinPult
// ##
// ##########################################################################

// ----------------------
var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;
// ----------------------
func int C_CanReadBookStand()
{
	if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};
};

const string BookstandMaya_1 = "… … 因 为 只 有 死 亡 守 护 者 可 以 呼 唤 祖 先 。 ";
const string BookstandMaya_2 = "他 们 的 缺 席 伤 害 巨 大 。 没 有 了 祖 先 的 建 议 ， 我 们 现 在 受 我 们 人 民 的 支 配 。";
const string BookstandMaya_3 = "治 疗 者 被 派 出 封 印 传 送 门 和 摧 毁 钥 匙 。 只 有 亚 达 诺 斯 知 道 他 们 发 生 了 什 么 事 ， 还 有 他 们 是 否 完 成 了 他 们 的 目 标 。";
const string BookstandMaya_4 = "战 士 阶 层 被 亚 达 诺 斯 的 愤 怒 消 灭 了 。 老 战 士 王 子 的 心 破 碎 了 。 ";
const string BookstandMaya_5 = "只 有 剩 下 的 牧 师 唤 起 希 望 ， 并 不 断 地 宣 杨 我 们 曾 经 宏 伟 的 城 市 的 复 苏 。 ";
const string BookstandMaya_6 = "然 而 ， 我 们 学 者 知 道 痛 苦 的 真 相 。 加 肯 达 已 经 倒 下 ， 并 将 遗 忘 在 时 间 之 河 中 。";
const string BookstandMaya_7 = "拉 德 梅 斯 被 永 久 地 囚 禁 在 亚 达 诺 斯 神 殿 中 ， 但 是 剑 的 力 量 还 没 有 受 损 。";
const string BookstandMaya_8 = "它 的 影 响 变 得 十 分 巨 大 。 街 道 上 的 杀 戮 不 会 停 止 。";
const string BookstandMaya_9 = "亚 达 诺 斯 的 愤 怒 终 结 了 一 切 。 大 海 高 过 了 加 肯 达 ， 并 淹 没 了 整 个 城 市 。";
const string BookstandMaya_10 = "只 有 神 殿 和 高 处 的 建 筑 丝 毫 无 损 地 保 留 了 下 来 。";
const string BookstandMaya_11 = "在 折 成 大 灾 难 中 的 幸 存 者 无 力 重 建 城 市 。";
const string BookstandMaya_12 = "因 此 加 肯 达 的 命 运 完 全 无 法 知 晓 。";
const string BookstandMaya_13 = "夸 霍 德 隆 的 年 纪 使 得 他 无 法 再 领 导 我 们 的 军 队 。 因 此 ， 牧 师 们 坚 持 他 们 拥 有 控 制 他 的 权 力 。";
const string BookstandMaya_14 = "他 们 命 令 他 辞 去 他 的 事 务 ， 并 把 剑 交 出 来 。";
const string BookstandMaya_15 = "五 人 议 会 决 定 了 他 的 继 承 者 。 但 是 ， 战 士 阶 层 否 决 了 议 会 的 选 择 。";
const string BookstandMaya_16 = "战 士 们 不 再 服 从 五 人 议 会 ， 并 选 择 了 他 的 儿 子 拉 德 梅 斯 作 为 他 们 的 新 首 领 。 ";
const string BookstandMaya_17 = "由 于 缺 少 对 他 自 己 血 脉 的 自 豪 和 信 心 ， 夸 霍 德 隆 决 定 放 弃 它 们 。";
const string BookstandMaya_18 = "他 把 剑 交 给 他 的 儿 子 ， 并 希 望 他 能 象 他 自 己 曾 经 的 那 样 挥 动 它 。";
const string BookstandMaya_19 = "拉 德 梅 斯 很 软 弱 。 剑 的 力 量 政 府 了 他 ， 并 使 他 成 为 它 的 工 具 。";
const string BookstandMaya_20 = "即 使 牧 师 们 也 无 法 减 轻 他 盲 目 的 暴 行 给 我 们 的 人 民 所 带 来 的 痛 苦 。 ";
const string BookstandMaya_21 = "剑 很 快 认 识 到 ， 脆 弱 的 人 民 不 会 阻 止 它 的 计 划 。";
const string BookstandMaya_22 = "只 有 我 们 祖 先 的 力 量 可 以 抵 挡 它 。 ";
const string BookstandMaya_23 = "因 此 它 让 拉 德 梅 斯 驱 逐 或 者 杀 死 了 所 有 的 死 亡 守 护 者 ， 粉 碎 了 所 有 可 以 解 除 这 种 邪 恶 的 希 望 。";
const string BookstandMaya_24 = "因 此 ， 在 我 们 人 民 剩 下 的 四 个 领 导 者 作 出 放 弃 加 肯 达 的 痛 苦 决 定 时 ， 已 经 没 有 任 何 死 亡 守 护 者 活 着 。";
const string BookstandMaya_25 = "在 治 疗 者 们 开 始 永 久 地 把 我 们 的 山 谷 入 口 封 闭 时 ， 战 争 已 经 在 街 道 上 横 行 已 久 。";
const string BookstandMaya_26 = "在 这 些 夸 霍 德 隆 的 大 厅 中 ， 高 级 牧 师 克 哈 迪 蒙 和 我 讨 论 着 击 败 拉 德 梅 斯 那 把 剑 的 方 法 。";
const string BookstandMaya_27 = "夸 霍 德 隆 和 克 哈 迪 蒙 认 为 集 中 力 量 可 以 在 战 斗 中 击 败 拉 德 梅 斯 。 但 是 我 深 深 了 解 剑 的 威 力 ， 并 坚 信 那 是 不 可 能 的 。";
const string BookstandMaya_28 = "因 此 我 行 使 了 我 的 权 力 ， 否 决 了 其 他 人 的 决 定 。 我 决 定 使 用 一 个 诡 计 来 战 胜 拉 德 梅 斯 。";
const string BookstandMaya_29 = "夸 霍 德 隆 服 从 了 议 会 的 决 定 。 他 进 入 亚 达 诺 斯 神 殿 ， 并 召 唤 他 的 儿 子 。";
const string BookstandMaya_30 = "他 儿 子 的 憎 恨 如 此 强 烈 ， 拉 德 梅 斯 狂 暴 地 袭 击 了 神 殿 并 杀 死 了 他 的 父 亲 。";
const string BookstandMaya_31 = "在 他 察 觉 我 们 的 计 划 时 ， 已 经 为 时 已 晚 。";
const string BookstandMaya_32 = "夸 霍 德 隆 封 闭 了 神 殿 神 圣 的 房 间 ， 拉 德 梅 斯 被 永 远 地 困 在 神 殿 中 。";
func void Use_BookstandMaya()
{
	if (BookstandMayaArt == 1) // Joly: überall objektieren!
	{
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_1);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_2);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_3);

		Doc_SetMargins(StPl_nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_4);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_5);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_6);
		Doc_PrintLines(StPl_nDocID, 1, "");
	}
	else if (BookstandMayaArt == 2) // Joly: objektieren egal wo, nur nicht Entrance.
	{
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_7);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_8);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_9);

		Doc_SetMargins(StPl_nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_10);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_11);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_12);

		if (SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
	}
	else if (BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_13);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_14);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_15);

		Doc_SetMargins(StPl_nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_16);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_17);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_18);
	}
	else if (BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_19);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_20);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_21);
		Doc_PrintLine(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_22);
		Doc_PrintLine(StPl_nDocID, 0, "");

		Doc_SetMargins(StPl_nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_23);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_24);
		Doc_PrintLine(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_25);
	}
	else if (BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_26);
		Doc_PrintLines(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_27);
		Doc_PrintLines(StPl_nDocID, 0, "");
		Doc_PrintLines(StPl_nDocID, 0, BookstandMaya_28);

		Doc_SetMargins(StPl_nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLines(StPl_nDocID, 1, "");

		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_29);
		Doc_PrintLines(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_30);
		Doc_PrintLines(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_31);
		Doc_PrintLines(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, BookstandMaya_32);

		Doc_PrintLines(StPl_nDocID, 1, "");
		Doc_PrintLines(StPl_nDocID, 1, "");
	};
};

func void InitUse_BookstandMaya()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if (C_CanReadBookStand() == FALSE)
		{
			StPl_nDocID =
			Doc_Create(); // DocManager
			Doc_SetPages(StPl_nDocID, 2);
			Doc_SetPage(StPl_nDocID, 0, "Book_MayaGlyph_L.tga", 0);
			Doc_SetPage(StPl_nDocID, 1, "Book_MayaGlyph_R.tga", 0);
			Doc_SetFont(StPl_nDocID, -1, FONT_Book);
			Doc_SetMargins(StPl_nDocID, 0, 275, 20, 30, 20, 1);

			/*
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Oksefd nodnf Kwe");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Sebnejbuwd Weinafiwjf Ihweqpjrann");
			Doc_PrintLines(StPl_nDocID, 0, "Erfjkemvefj Hwoqmnyhan ckh");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Revfnbrebuiwe ewohjfribwe wefa");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Ejkhfshduhweb isdh Thjdkad");
			Doc_PrintLines(StPl_nDocID, 0, "asdkejhnead Gakjesdhad Uhand");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Ihdah Zanshen");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Fjewheege Egadegsmkd Ygec slaje ");
			Doc_PrintLines(StPl_nDocID, 0, "");
			Doc_PrintLines(StPl_nDocID, 0, "Esfj ewzbfujbwe Iuhdfb");

			Doc_SetMargins(StPl_nDocID, -1, 30, 20, 275, 20, 1);
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Siehdkhnfv Ghlorka");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Jomaghe Ohramja");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Bam klod Heknaud");
			Doc_PrintLines(StPl_nDocID, 1, "Wokan fadudeksJuh");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Jhdy funikha ");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Ehnep Fhika Oiritan");
			Doc_PrintLines(StPl_nDocID, 1, "Oiritan Gkoropjia Onham");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Filiothak Juhama Penn");
			Doc_PrintLines(StPl_nDocID, 1, "Vorsiehal Kiman Sik");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Fjewheege Egdgsmkd Ygc slje ");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "");
			Doc_PrintLines(StPl_nDocID, 1, "Oznishdz gdo sek ie");
		*/
			Doc_Show(StPl_nDocID);
			B_Say(self, self, "$CANTREADTHIS");
		}
		else
		{
			if (C_CanReadBookStand())
			{
				StPl_nDocID =
				Doc_Create(); // DocManager
				Doc_SetPages(StPl_nDocID, 2);
				Doc_SetPage(StPl_nDocID, 0, "Book_MayaRead_L.tga", 0);
				Doc_SetPage(StPl_nDocID, 1, "Book_MayaRead_R.tga", 0);
				Doc_SetFont(StPl_nDocID, -1, FONT_Book);
				Doc_SetMargins(StPl_nDocID, 0, 275, 20, 30, 20, 1);
				Use_BookstandMaya();
				Doc_Show(StPl_nDocID);
			};
		};
	};

	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();
	if ((BookstandMayaHierchary_1_permanent == FALSE)
	&& (C_CanReadBookStand()))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_02_S1()
{
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();

	if ((BookstandMayaHierchary_2_permanent == FALSE)
	&& (C_CanReadBookStand()))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_03_S1()
{
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();

	if ((BookstandMayaHierchary_3_permanent == FALSE)
	&& (C_CanReadBookStand()))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_04_S1()
{
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();

	if ((BookstandMayaHierchary_4_permanent == FALSE)
	&& (C_CanReadBookStand()))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_05_S1()
{
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();

	if ((BookstandMayaHierchary_5_permanent == FALSE)
	&& (C_CanReadBookStand()))
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
	};
};
