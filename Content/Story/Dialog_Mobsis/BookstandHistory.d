// ##########################################################################
// ##
// ## Bookstand History
// ##
// ##########################################################################

// ----------------------
var int History_1_permanent;
// ----------------------
// ----------------------
var int History_2_permanent;
// ----------------------
// ----------------------
var int History_3_permanent;
// ----------------------

const string BookstandHistory1_S1_1 = "战 斗 的 方 法";
const string BookstandHistory1_S1_2 = "最 好 的 防 御 就 是 出 色 地 进 攻 ， 至 少 在 对 付 非 人 类 的 时 候 。 想 要 格 挡 动 物 和 怪 物 的 攻 击 是 毫 无 用 处 的 。";
const string BookstandHistory1_S1_3 = "最 好 能 用 精 确 地 攻 击 困 住 敌 人 ， 然 后 发 起 突 然 的 组 合 攻 击 。";
const string BookstandHistory1_S1_4 = "当 然 ， 只 有 经 验 丰 富 的 战 士 可 以 组 合 他 们 的 行 动 。 如 果 你 成 为 一 名 战 斗 技 能 的 大 师 ， 你 甚 至 可 以 使 用 几 种 组 合 。";
func void Use_BookstandHistory1_S1() // Geschichtsbücher
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_RED_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_RED_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, BookstandHistory1_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, BookstandHistory1_S1_2);
		Doc_PrintLines(nDocID, 0, BookstandHistory1_S1_3);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandHistory1_S1_4);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);

		if (History_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_1_permanent = TRUE;
		};
	};
};

const string BookstandHistory2_S1_1 = "岛 屿";
const string BookstandHistory2_S1_2 = "克 霍 里 尼 斯 的 海 港 城 市 坐 落 在 远 离 米 尔 塔 纳 王 国 海 岸 的 岛 屿 上 。";
const string BookstandHistory2_S1_3 = "这 座 岛 屿 因 为 矿 藏 山 谷 而 闻 名 遐 迩 。 它 的 声 望 有 些 问 题 ， 因 为 多 年 来 一 座 魔 法 屏 障 封 锁 了 整 个 山 谷 ， 作 为 关 押 整 个 王 国 的 罪 犯 的 监 狱 。";
const string BookstandHistory2_S1_4 = "如 此 ， 山 谷 变 成 了 一 座 监 狱 殖 民 地 ， 罪 犯 们 在 地 面 深 处 挖 掘 魔 法 矿 石 。 ";
const string BookstandHistory2_S1_5 = "克 霍 里 尼 斯 的 外 面 分 布 着 一 些 农 场 ， 在 肥 沃 的 土 地 上 种 植 小 麦 和 萝 卜 ， 并 繁 殖 绵 羊 。";
const string BookstandHistory2_S1_6 = "很 长 时 期 内 ， 最 大 的 农 场 一 直 归 地 主 所 有 ， 他 把 土 地 租 给 周 围 的 其 他 农 民 。 ";
const string BookstandHistory2_S1_7 = "在 岛 屿 的 中 部 ， 是 一 座 古 代 的 英 诺 斯 神 殿 ， 由 火 魔 法 师 领 导 。 他 们 在 那 里 研 究 魔 法 和 炼 金 术 ， 并 酿 造 葡 萄 酒 。";
func void Use_BookstandHistory2_S1() // Geschichtsbücher
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_RED_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_RED_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, BookstandHistory2_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandHistory2_S1_2);
		Doc_PrintLines(nDocID, 0, BookstandHistory2_S1_3);
		Doc_PrintLines(nDocID, 0, BookstandHistory2_S1_4);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandHistory2_S1_5);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandHistory2_S1_6);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandHistory2_S1_7);

		Doc_Show(nDocID);

		if (History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
		};
	};
};

const string BookstandHistory3_S1_1 = "岛 屿 的 法 律";
const string BookstandHistory3_S1_2 = "哪 里 有 人 们 聚 集 ， 哪 里 就 需 要 规 范 来 维 护 和 平 - 无 论 是 修 道 院 、 城 市 还 是 地 主 的 农 场 。";
const string BookstandHistory3_S1_3 = "任 何 违 背 社 会 的 犯 罪 行 为 都 会 受 到 惩 罚 。";
const string BookstandHistory3_S1_4 = "社 区 禁 止 打 斗 和 争 吵 。";
const string BookstandHistory3_S1_5 = "盗 窃 也 是 被 禁 止 的 行 为 。 同 时 ， 绵 羊 受 到 法 律 的 保 护 。";
const string BookstandHistory3_S1_6 = "如 果 有 人 把 其 他 人 打 倒 并 谋 杀 ， 那 么 他 必 须 立 即 接 受 被 判 死 刑 。";
const string BookstandHistory3_S1_7 = "要 想 避 免 这 种 命 运 ， 他 必 须 支 付 巨 额 罚 金 。";
const string BookstandHistory3_S1_8 = "在 所 有 的 大 地 方 ， 都 有 专 人 负 责 维 护 和 平 。 他 们 会 留 意 一 切 犯 罪 行 为 ， 他 们 的 责 任 是 进 行 有 效 的 惩 罚 和 恢 复 秩 序 。";
const string BookstandHistory3_S1_9 = "那 些 受 害 人 和 目 击 者 对 犯 人 并 没 有 足 够 地 指 证 权 力 。";
const string BookstandHistory3_S1_10 = "当 然 ， 也 有 一 些 家 伙 不 在 乎 任 何 法 律 ， 特 别 是 强 盗 和 雇 佣 兵 。";
func void Use_BookstandHistory3_S1() // Geschichtsbücher
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_RED_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_RED_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, BookstandHistory3_S1_1);
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, BookstandHistory3_S1_2);
		Doc_PrintLines(nDocID, 0, BookstandHistory3_S1_3);
		Doc_PrintLines(nDocID, 0, BookstandHistory3_S1_4);
		Doc_PrintLines(nDocID, 0, BookstandHistory3_S1_5);
		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandHistory3_S1_6);
		Doc_PrintLines(nDocID, 1, BookstandHistory3_S1_7);
		Doc_PrintLines(nDocID, 1, BookstandHistory3_S1_8);
		Doc_PrintLines(nDocID, 1, BookstandHistory3_S1_9);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandHistory3_S1_10);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);

		if (History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
		};
	};
};
