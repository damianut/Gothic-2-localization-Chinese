// ##########################################################################
// ##
// ## Bookstand Animals
// ##
// ##########################################################################

// ----------------------
var int Animals_1_permanent;
// ----------------------
// ----------------------
var int Animals_2_permanent;
// ----------------------
// ----------------------
var int Animals_3_permanent;
// ----------------------

const string BookstandAnimals1_S1_1 = "搜 寻 和 捕 食";
const string BookstandAnimals1_S1_2 = "每 种 野 兽 或 者 生 物 都 有 特 定 的 战 利 品 可 以 为 经 验 丰 富 的 猎 手 增 加 财 富 和 声 望 。";
const string BookstandAnimals1_S1_3 = "每 个 经 验 丰 富 的 猎 手 都 知 道 每 种 猎 物 所 有 的 战 利 品 和 如 何 取 得 它 们 。";
const string BookstandAnimals1_S1_4 = "拔 出 牙 齿";
const string BookstandAnimals1_S1_5 = "牙 齿 是 多 数 动 物 和 生 物 的 武 器 。 如 果 你 知 道 如 何 从 你 的 猎 物 身 上 取 得 战 利 品 ， 例 如 、 狼 、 暴 龙 、 影 兽 、 沼 泽 鲨 和 巨 魔 。";
const string BookstandAnimals1_S1_6 = "剥 皮";
const string BookstandAnimals1_S1_7 = "这 项 天 赋 是 衡 量 经 验 丰 富 的 猎 人 的 价 值 的 关 键 ， 因 为 大 多 数 动 物 都 有 皮 毛 ， - 例 如 绵 羊 ， 狼 和 影 兽 等 等 。";
const string BookstandAnimals1_S1_8 = "拥 有 这 项 技 能 的 猎 人 也 可 以 剥 沼 泽 鲨 和 潜 伏 者 的 皮 毛 。  ";
const string BookstandAnimals1_S1_9 = "拔 出 爪 子";
const string BookstandAnimals1_S1_10 = "这 项 技 能 可 以 用 于 所 有 种 类 的 蜥 蜴 、 暴 龙 和 影 兽 。  ";
func void Use_BookstandAnimals1_S1() // Tierbücher
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

		Doc_PrintLine(nDocID, 0, BookstandAnimals1_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandAnimals1_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandAnimals1_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, BookstandAnimals1_S1_4);
		Doc_PrintLines(nDocID, 0, BookstandAnimals1_S1_5);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, BookstandAnimals1_S1_6);
		Doc_PrintLines(nDocID, 1, BookstandAnimals1_S1_7);
		Doc_PrintLines(nDocID, 1, BookstandAnimals1_S1_8);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, BookstandAnimals1_S1_9);
		Doc_PrintLines(nDocID, 1, BookstandAnimals1_S1_10);
		Doc_Show(nDocID);

		if (Animals_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_1_permanent = TRUE;
		};
	};
};

const string BookstandAnimals2_S1_1 = "搜 寻 和 捕 食";
const string BookstandAnimals2_S1_2 = "每 种 野 兽 或 者 生 物 都 有 特 定 的 战 利 品 可 以 为 经 验 丰 富 的 猎 手 增 加 财 富 和 声 望 。";
const string BookstandAnimals2_S1_3 = "血 蝇 的 毒 液";
const string BookstandAnimals2_S1_4 = "处 理 这 些 会 飞 的 魔 鬼 需 要 两 项 特 殊 的 技 能 。";
const string BookstandAnimals2_S1_5 = "可 以 去 除 它 们 的 翅 膀 ， 并 将 它 们 的 刺 拔 出 。";
const string BookstandAnimals2_S1_6 = "有 经 验 的 猎 人 需 要 使 用 这 两 项 技 能 来 获 取 他 们 的 战 利 品 。";
const string BookstandAnimals2_S1_7 = "旷 野 袭 击 者 和 矿 井 爬 行 者 使 用 颚 骨 来 攻 击 。 矿 井 爬 行 者 的 颚 骨 有";
const string BookstandAnimals2_S1_8 = "特 殊 的 价 值 ， 因 为 它 们 包 含 能 够 增 强 魔 法 能 力 的 分 泌 物 。";
const string BookstandAnimals2_S1_9 = "然 而 在 使 用 它 们 时 要 有 节 制 ， 因 为 人 类 的 身 体 会 渐 渐 对 它 失 去 反 应 。";
const string BookstandAnimals2_S1_10 = "矿 井 爬 行 者 鳞 甲 同 样 很 受 欢 迎 。 它 们 常 常 用 来 制 作 盔 甲 。 ";

func void Use_BookstandAnimals2_S1() // Tierbücher
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

		Doc_PrintLine(nDocID, 0, BookstandAnimals2_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandAnimals2_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, BookstandAnimals2_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandAnimals2_S1_4);
		Doc_PrintLines(nDocID, 0, BookstandAnimals2_S1_5);
		Doc_PrintLines(nDocID, 0, BookstandAnimals2_S1_6);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandAnimals2_S1_7);
		Doc_PrintLines(nDocID, 1, BookstandAnimals2_S1_8);
		Doc_PrintLines(nDocID, 1, BookstandAnimals2_S1_9);
		Doc_PrintLines(nDocID, 1, BookstandAnimals2_S1_10);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, "");
		Doc_Show(nDocID);

		if (Animals_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_2_permanent = TRUE;
		};
	};
};

const string BookstandAnimals3_S1_1 = "搜 寻 和 捕 食";
const string BookstandAnimals3_S1_2 = "每 种 野 兽 或 者 生 物 都 有 特 定 的 战 利 品 可 以 为 经 验 丰 富 的 猎 手 增 加 财 富 和 声 望 。";
const string BookstandAnimals3_S1_3 = "火 蜥 蜴";
const string BookstandAnimals3_S1_4 = "这 种 野 兽 是 某 种 蜥 蜴 ， 但 是 它 可 以 喷 火 ， 并 会 杀 死 任 何 胆 敢 冒 犯 它 的 人 。";
const string BookstandAnimals3_S1_5 = "只 有 那 些 拥 有 抵 抗 火 焰 能 力 的 人 可 以 与 这 种 野 兽 战 斗 ， 并 取 得 它 们 宝 贵 的 舌 头 。";
const string BookstandAnimals3_S1_6 = "影 兽";
const string BookstandAnimals3_S1_7 = "影 兽 是 一 种 古 代 的 独 居 动 物 ， 住 在 隐 蔽 的 树 林 里 。";
const string BookstandAnimals3_S1_8 = "这 些 生 物 所 存 不 多 ， 因 此 它 们 对 人 类 来 讲 没 有 危 害 ， 除 非 人 类 冒 险 进 入 它 们 的 捕 猎 区 域 。";
const string BookstandAnimals3_S1_9 = "影 兽 头 上 的 角 是 一 种 非 常 宝 贵 的 战 利 品 。 猎 人 必 须 学 会 如 何 把 它 拔 出 ，";
const string BookstandAnimals3_S1_10 = "才 能 取 得 这 个 战 利 品 。";
func void Use_BookstandAnimals3_S1() // Tierbücher
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

		Doc_PrintLine(nDocID, 0, BookstandAnimals3_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, BookstandAnimals3_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, BookstandAnimals3_S1_3);
		Doc_PrintLines(nDocID, 0, BookstandAnimals3_S1_4);
		Doc_PrintLines(nDocID, 0, BookstandAnimals3_S1_5);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, BookstandAnimals3_S1_6);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, BookstandAnimals3_S1_7);
		Doc_PrintLines(nDocID, 1, BookstandAnimals3_S1_8);
		Doc_PrintLines(nDocID, 1, BookstandAnimals3_S1_9);
		Doc_PrintLines(nDocID, 1, BookstandAnimals3_S1_10);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");

		Doc_Show(nDocID);

		if (Animals_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_3_permanent = TRUE;
		};
	};
};
