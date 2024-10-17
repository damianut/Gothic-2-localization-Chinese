//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
instance ITWr_Addon_Hinweis_02(C_Item)
{
	name						= "重 要 的 信 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Hinweis_02;

	value						= 250;

	description					= name;
	text[0]						= "来 自 强 盗 营 地 的 酒 馆";			count[0] = 0;
};

const string Hinweis_02_1 = "嘿 ， 大 伙 儿 ，";
const string Hinweis_02_2 = "卢 在 沼 泽 里 失 踪 了 。 他 可 能 已 经 被 沼 泽 鲨 吃 掉 了 。";
const string Hinweis_02_3 = "更 糟 糕 的 是 - 大 门 钥 匙 和 他 一 起 失 踪 了 。";
const string Hinweis_02_4 = "找 到 它 ， 你 可 以 留 下 卢 的 物 品 。";
const string Hinweis_02_5 = "斯耐夫";
func void Use_Hinweis_02()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Hinweis_02_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Hinweis_02_2);
				Doc_PrintLines	(nDocID, 0, Hinweis_02_3);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Hinweis_02_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Hinweis_02_5);
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Heiltrunk
//**********************************************************************************
instance ITWr_Addon_Health_04(C_Item)
{
	name						= "治 疗 药 剂 配 方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Heilrezept_04;

	value						= 1000;

	description					= "纯 净 的 生 命 能 量";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "制 造 一 种 强 效 药 剂 。";	count[2] = 0;
	text[3]						= "要 想 使 用 ， 需 要 治 疗 药 剂 的 相 关 知 识 。";count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string Heilrezept_04_1 = "制 造 治 疗 药 剂 ：";
const string Heilrezept_04_2 = "需 要 １ 份 洼 地 节 草 和 ３ 份 治 疗 精 华 。";
const string Heilrezept_04_3 = "倒 在 一 起 ， 并 按 照 治 疗 药 剂 配 方 进 行 酿 造 。 ";
const string Heilrezept_04_4 = "这 种 药 剂 只 有 知 道 治 疗 药 剂 配 方 的 炼 金 术 士 才 能 制 造 。";
func void Use_Heilrezept_04()
{
	var int nDocID;

	if (Npc_IsPlayer(self))
	{
		if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy, TOPIC_TalentAlchemy_1);
		};
	};

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Heilrezept_04_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Heilrezept_04_2);
				Doc_PrintLines	(nDocID, 0, Heilrezept_04_3);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Heilrezept_04_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Manatrunk
//**********************************************************************************
instance ITWr_Addon_Mana_04(C_Item)
{
	name						= "魔 力 配 方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Manarezept_04;

	value						= 1500;

	description					= "纯 魔 法 值";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "制 造 一 种 强 效 药 剂 。";	count[2] = 0;
	text[3]						= "需 要 魔 力 药 剂 相 关 知 识 才 能 使 用 。";count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string Manarezept_04_1 = "制 造 一 份 魔 力 药 剂 ：";
const string Manarezept_04_2 = "需 要 一 份 洼 地 节 草 和 三 份 魔 法 能 量 精 华 。";
const string Manarezept_04_3 = "倒 在 一 起 ， 并 按 照 魔 力 药 剂 配 方 进 行 酿 造 。 ";
const string Manarezept_04_4 = "这 种 药 剂 只 有 知 道 魔 力 药 剂 配 方 的 炼 金 术 士 才 能 制 造 。";
func void Use_Manarezept_04()
{
	var int nDocID;

	if (Npc_IsPlayer(self))
	{
		if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy, TOPIC_TalentAlchemy_2);
		};
	};

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Manarezept_04_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Manarezept_04_2);
				Doc_PrintLines	(nDocID, 0, Manarezept_04_3);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Manarezept_04_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
instance ITWr_Addon_Hinweis_01(C_Item)
{
	name						= "重 要 提 示";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Hinweis_01;

	value						= 250;

	description					= name;
	text[0]						= "挂 在 沼 泽 小 屋 里 面";				count[0] = 0;
};

const string Hinweis_01_1 = "嘿 ， 各 位 ，";
const string Hinweis_01_2 = "箱 子 里 的 物 品 是 为 了 应 付 紧 急 情 况 。 ";
const string Hinweis_01_3 = "这 是 为 所 有 人 准 备 的 ， 所 以 只 拿 你 需 要 的 东 西 。";
const string Hinweis_01_4 = "只 拿 你 需 要 的 。";
const string Hinweis_01_5 = "如 果 所 有 人 都 遵 守 这 个 要 求 ， 那 就 对 了 。";
const string Hinweis_01_6 = "弗 莱 彻";
func void Use_Hinweis_01()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Hinweis_01_1);
				Doc_PrintLines	(nDocID, 0, Hinweis_01_2);
				Doc_PrintLines	(nDocID, 0, Hinweis_01_3);
				Doc_PrintLines	(nDocID, 0, Hinweis_01_4);
				Doc_PrintLines	(nDocID, 0, Hinweis_01_5);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Hinweis_01_6);
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
instance ITWr_Addon_William_01(C_Item)
{
	name						= "字 条";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_William_01;

	value						= 250;

	description					= name;
	text[0]						= "渔 夫 威 廉 带 着 这 个 。";count[0] = 0;
};

const string William_01_1 = "威 廉，";
const string William_01_2 = "当 月 圆 之 时 ， 守 卫 就 会 心 烦 意 乱 。";
const string William_01_3 = "潜 行 出 去 - 但 是 要 小 心 ！";
const string William_01_4 = "如 果 你 沿 着 伐 木 通 路 走 ， 就 能 离 开 沼 泽 。";
const string William_01_5 = "海 盗 营 地 在 山 谷 西 边 很 远 的 一 边 。 ";
const string William_01_6 = "从 那 里 ， 可 以 轻 松 地 乘 船 离 开 。 ";
const string William_01_7 = "祝 福 者";
func void Use_William_01()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, William_01_1);
				Doc_PrintLines	(nDocID, 0, William_01_2);
				Doc_PrintLines	(nDocID, 0, William_01_3);
				Doc_PrintLines	(nDocID, 0, William_01_4);
				Doc_PrintLines	(nDocID, 0, William_01_5);
				Doc_PrintLines	(nDocID, 0, William_01_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, William_01_7);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Rezept von Miguel (Minecrawler Trank)
//**********************************************************************************
instance ITWr_Addon_MCELIXIER_01(C_Item)
{
	name						= "配 方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MCELIXIER_01;

	value						= 250;

	description					= name;
	text[0]						= "精 神 改 造 药 剂 配 方 。";count[0] = 0;
	text[1]						= "这 种 药 剂 可 以 用 来 恢 复 记 忆 。";count[1] = 0;
};

const string MCELIXIER_01_1 = "精 神 改 造 药 剂";
const string MCELIXIER_01_2 = "需 要 两 份 血 蝇 刺 的 分 泌 物 ， 才 能 制 造 这 种 药 剂 。";
const string MCELIXIER_01_3 = "添 加 一 份 魔 力 萃 取 物 和 一 份 治 疗 精 华 。";
const string MCELIXIER_01_4 = "最 后 ， 把 一 袋 红 色 泪 胡 椒 搅 拌 到 沸 腾 的 药 液 中 。";
const string MCELIXIER_01_5 = "只 有 知 道 如 何 提 取 钉 刺 分 泌 物 的 炼 金 术 士 专 家 才 能 尝 试 这 种 药 剂 。 ";
func void Use_MCELIXIER_01()
{
	Knows_MCELIXIER = TRUE;
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, MCELIXIER_01_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MCELIXIER_01_2);
				Doc_PrintLines	(nDocID, 0, MCELIXIER_01_3);
				Doc_PrintLines	(nDocID, 0, MCELIXIER_01_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MCELIXIER_01_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Deal Brief von Esteban an zwei Piraten
//**********************************************************************************
instance ITWr_Addon_Pirates_01(C_Item)
{
	name						= "油 污 的 字 条";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Pirates_01;

	value						= 250;

	description					= name;
	text[0]						= "安 格 斯 把 这 张 字 条 放 在 口 袋 里 。";	count[0] = 0;
};

const string Pirates_01_1 = "海 盗 ，";
const string Pirates_01_2 = "拿 到 给 我 们 的 最 后 货 物 。";
const string Pirates_01_3 = "然 后 把 它 带 到 你 的 洞 穴 里 。 我 们 在 那 里 会 面 。";
const string Pirates_01_4 = "我 会 支 付 双 倍 的 金 币 。";
const string Pirates_01_5 = "就 那 么 做";
const string Pirates_01_6 = "汤 姆";
func void Use_Pirates_01()
{
	Read_JuansText = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Pirates_01_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Pirates_01_2);
				Doc_PrintLine	(nDocID, 0, Pirates_01_3);
				Doc_PrintLines	(nDocID, 0, Pirates_01_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Pirates_01_5);
				Doc_PrintLine	(nDocID, 0, Pirates_01_6);
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Rezept für grünene Novizen
//**********************************************************************************
instance ITWr_Addon_Joint_01(C_Item)
{
	name						= "绿 色 新 信 徒";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Joint_Rezept_01;

	value						= 250;

	description					= name;
	text[0]						= "在 弗 图 诺 的 箱 子 里";				count[0] = 0;
};

const string Joint_Rezept_01_1 = "绿 色 新 信 徒";
const string Joint_Rezept_01_2 = "（ … … ） 烟 卷 得 不 错 ， 但 是 我 们 在 沼 泽 营 地 拿 到 的 是 完 全 不 同 的 长 度 。";
const string Joint_Rezept_01_3 = "如 果 我 使 用 两 份 沼 生 草 植 物 精 华 ， 并 加 上 一 份 洼 地 节 草 ， 那 么 我 就 制 成 了 一 支 有 绿 色 新 信 徒 效 果 的 卷 烟 。";
const string Joint_Rezept_01_4 = "绿 色 新 信 徒 可 以 帮 助 抵 抗 所 有 类 型 的 疼 痛 ， 并 使 头 脑 清 醒 。";
func void Use_Joint_Rezept_01()
{
	var int nDocID;

	Green_Extrem = TRUE;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Joint_Rezept_01_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Joint_Rezept_01_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Joint_Rezept_01_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Joint_Rezept_01_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Schnapsbrennen Rezept
//**********************************************************************************
instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name						= "卢 的 海 默 酒 配 方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseLouRezept;

	value						= 70;

	description					= name;
	text[0]						= "制 造 ‘ 卢 的 海 默 酒 ’ 的 配 方";	count[0] = 0;
};

const string LouRezept_1 = "卢 的 海 默 酒";
const string LouRezept_2 = "酿 造 海 默 酒 的 原 料 ：";
const string LouRezept_3 = "取 一 只 水 瓶 ， 两 份 萝 卜 ， 还 有 和 一 份 沼 生 草 。";
const string LouRezept_4 = "添 加 一 组 沼 泽 鲨 的 牙 齿 。";
const string LouRezept_5 = "把 所 有 东 西 放 进 瓶 子 ， 然 后 用 一 点 朗 姆 酒 煮 沸 。";
const string LouRezept_6 = "干 杯 。";
const string LouRezept_7 = "据 那 个 老 盲 人 所 言 ， 最 好 不 要 呼 吸 蒸 汽 ！";
func void UseLouRezept()
{
	Knows_LousHammer = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, LouRezept_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, LouRezept_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LouRezept_3);
				Doc_PrintLines	(nDocID, 0, LouRezept_4);
				Doc_PrintLines	(nDocID, 0, LouRezept_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, LouRezept_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LouRezept_7);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Doppelhammer
//**********************************************************************************
instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name						= "卢 的 双 倍 海 默 酒 配 方";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseLouRezept2;

	value						= 140;

	description					= name;
	text[0]						= "制 作 卢 的 双 倍 海 默 酒 的 配 方 。";count[0] = 0;
};

const string LouRezept2_1 = "卢 的 双 倍 海 默 酒";
const string LouRezept2_2 = "拿 一 份 陈 年 卢 的 海 默 酒 并 再 次 精 炼 。";
const string LouRezept2_3 = "只 有 经 验 丰 富 的 制 造 者 才 能 制 作 这 种 混 合 物 。";
const string LouRezept2_4 = "如 果 外 行 想 尝 试 的 话 ， 轻 则 致 盲 ， 重 则 死 亡 。";
func void UseLouRezept2()
{
	Knows_SchlafHammer = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, LouRezept2_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LouRezept2_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LouRezept2_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LouRezept2_4);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	Piratentod
//**********************************************************************************
instance ITWr_Addon_Piratentod(C_Item)
{
	name						= "急 躁 鲱 鱼";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseRezeptPiratentod;

	value						= 250;

	description					= name;
	text[0]						= "制 造 急 躁 鲱 鱼 的 配 方 。";count[0] = 0;
};

const string RezeptPiratentod_1 = "急 躁 鲱 鱼 （ 我 制 作 的 ）";
const string RezeptPiratentod_2 = "给 真 正 男 人 的 提 神 酒";
const string RezeptPiratentod_3 = "同 以 往 一 样 ， 你 需 要 一 只 水 瓶 。 装 入 中 量 的 朗 姆 酒 ， 并 放 入 一 条 新 鲜 的 鱼 。";
const string RezeptPiratentod_4 = "在 液 体 开 始 变 黄 的 时 候 ， 把 鱼 取 出 ， 并 添 加 一 束";
const string RezeptPiratentod_5 = "刚 采 摘 的 新 鲜 暴 龙 草 调 味 。";
const string RezeptPiratentod_6 = "要 留 神 ， 这 种 东 西 劲 很 大 。";
func void UseRezeptPiratentod()
{
	Knows_SchnellerHering = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, RezeptPiratentod_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RezeptPiratentod_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RezeptPiratentod_3);
				Doc_PrintLines	(nDocID, 0, RezeptPiratentod_4);
				Doc_PrintLines	(nDocID, 0, RezeptPiratentod_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RezeptPiratentod_6);
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ------------------------------------------------------------------------------------------
instance Fakescroll_Addon(C_Item)
{
	name						= "一 张 纸";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	hp							= 5;
	hp_max						= 5;
	weight						= 1;

	visual						= "Fakescroll.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// ------------------------------------------------------------------------------------------
instance ItWr_Addon_AxtAnleitung(C_ITEM)
{
	name						= "强 盗 斧 的 说 明";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseAxtAnleitung;

	value						= 250;

	description					= name;
	text[0]						= "制 作 一 种 轻 型 、 锋 利 的 斧 头 的 介 绍 。";count[0] = 0;
};

const string AxtAnleitung_1 = "强 盗 斧";
const string AxtAnleitung_2 = "单 手 斧";
const string AxtAnleitung_3 = "任 何 懂 得 基 础 锻 造 方 法 的 人 可 以 制 作 一 种 特 别 的 斧 头 。 ";
const string AxtAnleitung_4 = "你 需 要 两 小 片 炽 热 的 生 铁 。";
const string AxtAnleitung_5 = "一 小 块 矿 石 和 三 枚 狼 、 暴 龙 或 者 类 似 的 野 兽 的 牙 齿 。";
const string AxtAnleitung_6 = "在 铁 砧 上 把 矿 石 、 牙 齿 和 铁 块 锤 炼 在 一 起 。";
const string AxtAnleitung_7 = "这 种 斧 头 很 容 易 使 用 ， 并 能 造 成 相 当 大 的 伤 害 。";
func void UseAxtAnleitung()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, AxtAnleitung_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, AxtAnleitung_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, AxtAnleitung_3);
				Doc_PrintLines	(nDocID, 0, AxtAnleitung_4);
				Doc_PrintLines	(nDocID, 0, AxtAnleitung_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, AxtAnleitung_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, AxtAnleitung_7);
				Doc_PrintLines	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ------------------------------------------------------------------------------------------
instance ItWr_Addon_SUMMONANCIENTGHOST(C_ITEM)
{
	name						= "召 唤 ‘ 夸 霍 德 隆 ’";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseSummonAncientGhost;

	value						= 250;

	description					= name;
	text[0]						= "可 以 使 用 这 个 魔 法 卷 轴 召 唤 夸 霍 德 隆 。";count[0] = 0;
};

func void UseSummonAncientGhost()
{
	if (SC_SummonedAncientGhost == FALSE)
	{
		B_Say(self, self, "$ADDON_SUMMONANCIENTGHOST");

		if (Npc_GetDistToWP(self, "ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(NONE_ADDON_111_Quarhodron, "ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost", NONE_ADDON_111_Quarhodron, NONE_ADDON_111_Quarhodron, 0, 0, 0, FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE", NONE_ADDON_111_Quarhodron, NONE_ADDON_111_Quarhodron, 0, 0, 0, FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_Say(self, self, "$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};

//////////////////////////////////////////////////////////////////////////////
//
//	MAPS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_AddonWorld(C_Item)
{
	name						= "被 遗 忘 的 建 造 者 山 谷 。";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_AddonWorld;

	value						= 250;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_AddonWorld()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_AddonWorld);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_AddonWorld.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document, -47783, 36300, 43949, -32300);
	// Joly:Doc_SetLevelCoords(Document, -47783, 36300, 43949, -32300);
	// Nico:Doc_SetLevelCoords(Document, -43000, 39000, 43000, -29000);
	Doc_Show(Document);
};
