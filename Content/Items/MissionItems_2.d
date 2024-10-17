// Missionitems 2. Kapitel

//********************************************
//	Xardas´ Stein des Wissens liegt im alten Demonenbeschwörerturm auf dem Tisch in seinem alten Studierzimmer!
//********************************************

instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name						= "知 识 宝 石";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_StoneOfKnowlegde_MIS.3DS";
	material					= MAT_STONE;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

//**********************************************************************************
//	BRIEF von Garond an Lord Hagen
// ----------------------------------------------------------------------------------

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name						= "信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePaladinLetter;

	value						= 0;

	description					= "给 哈 根 勋 爵 的 信";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string PaladinLetter_1 = "哈 根 勋 爵";
const string PaladinLetter_2 = "矿 藏 山 谷 的 探 险 失 败 了 。 我 们 遭 受 了 很 大 的 损 失 。 幸 存 者 被 困 在 城 堡 里 ， 被 兽 人 包 围 着 。 ";
const string PaladinLetter_3 = "我 们 已 经 被 龙 攻 击 了 很 多 次 。 它 们 摧 毁 了 城 堡 附 近 的 土 地 。 在 英 诺 斯 的 帮 助 下 ， 我 们 将 会 坚 持 到 援 军 抵 达 。 突 围 是 不 可 能 的 。 ";
const string PaladinLetter_4 = "愿 英 诺 斯 保 护 我 们 所 有 人";
const string PaladinLetter_5 = "加 隆 德";
func void UsePaladinLetter()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PaladinLetter_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, PaladinLetter_2);
				Doc_PrintLines	(nDocID, 0, PaladinLetter_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PaladinLetter_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PaladinLetter_5);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Schmuggelbrief von Milten an Gorn
// ----------------------------------------------------------------------------------

instance ItWr_LetterForGorn_MIS(C_Item)
{
	name						= "信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseLetterForGorn;

	value						= 0;

	description					= "米 尔 腾 给 戈 恩 的 字 条";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string LetterForGorn_1 = "戈 恩 ！";
const string LetterForGorn_2 = "加 隆 德 已 经 同 意 给 你 自 由 - １ ０ ０ ０ 枚 金 币 的 代 价 。 ";
const string LetterForGorn_3 = "因 此 ， 如 果 你 还 在 某 个 地 方 藏 着 金 币 ， 现 在 是 最 好 的 时 机 交 出 它 。 ";
const string LetterForGorn_4= "密 尔 顿 ";
func void UseLetterForGorn()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, LetterForGorn_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LetterForGorn_2);
				Doc_PrintLines	(nDocID, 0, LetterForGorn_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, LetterForGorn_4);
	Doc_Show(nDocID);
};

//********************************************
//	Kerkerschlüssel der Burg im Minental
//********************************************

instance ItKe_PrisonKey_MIS(C_Item)
{
	name						= "地 牢 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 地 牢 的 钥 匙";					count[2] = 0;
	text[3]						= "在 城 堡 里";								count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Schlüssel Erzlager der Burg im Minental
//********************************************
instance ItKe_OC_Store(C_Item)
{
	name						= "仓 库 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "贮 藏 室 的 钥 匙";				count[2] = 0;
	text[3]						= "在 城 堡 里";								count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Schlüssel Erzbaron Flur der Burg im Minental
//********************************************
instance ITKE_ErzBaronFlur(C_Item)
{
	name						= "门 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= "用 于 第 一 扇 门 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "上 面 刻 着 一 个 名 字 。";					count[2] = 0;
	text[3]						= "葛 梅 兹";										count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Schlüssel Erzbaron Raum der Burg im Minental
//********************************************
instance ITKE_ErzBaronRaum(C_Item)
{
	name						= "门 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= "用 于 第 二 扇 门 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "上 面 刻 着 一 个 名 字 。";					count[2] = 0;
	text[3]						= "葛 梅 兹";										count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Der Schatz von Gorn
//********************************************

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= UseGornsTreasure;

	value						= 250;

	description					= "戈 恩 的 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold, 250);
	Gorns_Beutel = TRUE;
};

//**********************************************************************************
//	Schreiben von Silvestro
// ----------------------------------------------------------------------------------

instance ItWr_Silvestro_MIS(C_Item)
{
	name						= "字 条";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItwr_Silvestro;

	value						= 0;

	description					= "席 尔 维 斯 特 罗 的 字 条 ";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Itwr_Silvestro_1 = "来 自 国 王 的 圣 骑 士 席 尔 维 斯 特 罗 ";
const string Itwr_Silvestro_2 = "又 一 个 挖 掘 日 开 始 了 。 今 天 我 们 准 备 破 墙 深 入 挖 掘 岩 石 。";
const string Itwr_Silvestro_3 = "我 有 一 种 不 好 的 感 觉 ， 所 以 我 要 把 矿 石 藏 起 来 。";
const string Itwr_Silvestro_4 = "迪 雅 戈 是 我 们 中 间 唯 一 一 个 知 道 附 近 道 路 的 人 。 我 必 须 相 信 他 。 他 要 把 箱 子 带 到 安 全 的 地 方 - 但 是 我 不 允 许 他 单 独 行 动 。";
const string Itwr_Silvestro_5 = "要 不 惜 一 切 代 价 保 护 矿 石 ， 所 以 我 派 了 两 名 骑 士 与 迪 雅 戈 一 起 走 。";
const string Itwr_Silvestro_6 = "国 王 万 岁 。";
const string Itwr_Silvestro_7 = "席 尔 维 斯 特 罗";
func void UseItwr_Silvestro()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, Itwr_Silvestro_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Itwr_Silvestro_2);
				Doc_PrintLines	(nDocID, 0, Itwr_Silvestro_3);
				Doc_PrintLines	(nDocID, 0, Itwr_Silvestro_4);
				Doc_PrintLines	(nDocID, 0, Itwr_Silvestro_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Itwr_Silvestro_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Itwr_Silvestro_7);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Krallen des Rudelführers
// ----------------------------------------------------------------------------------
instance ItAt_ClawLeader(C_Item)
{
	name						= "暴 龙 爪 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItAt_Claw.3DS";
	material					= MAT_LEATHER;

	value						= 100;

	description					= "兽 群 首 领 的 爪 子";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Olavs Beutel
// ----------------------------------------------------------------------------------
instance ItSe_Olav(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= UseOlav;

	value						= 25;

	description					= "奥 莱 夫 的 袋 子";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "里 面 有 些 硬 币 叮 当 作 响 。";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold, 25);
};

/******************************************************************************************/
instance ItMi_GoldPlate_MIS(C_Item)
{
	name						= "金 盘";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldPlate.3DS";
	material					= MAT_METAL;

	value						= Value_GoldPlate;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Schlüssel Erzlager der Burg im Minental
//********************************************
instance ItKe_Pass_MIS(C_Item)
{
	name						= "通 道 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= "一 把 小 钥 匙 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "打 开 通 道 大 门 。";						count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Schlüssel Bromor
//********************************************
instance ItKe_Bromor(C_Item)
{
	name						= "布 洛 摩 尔 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= "旅 馆 的 钥 匙";
	text[0]						= "";											count[0] = 0;
	text[1]						= "房 间 钥 匙 。";						count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//********************************************
//	Schlüssel Runenstein
//********************************************
instance ITKE_RUNE_MIS(C_Item)
{
	name						= "钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= "一 把 小 箱 子 的 小 钥 匙 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "这 把 钥 匙 可 以 打 开 的 箱 子";					count[1] = 0;
	text[2]						= "在 一 座 桥 下 面 。";					count[2] = 0;
	text[3]						= "里 面 有 一 块 咒 语 石 。";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Bloodfly Stachel ausschlürfen lernen
// ----------------------------------------------------------------------------------
instance ItWr_Bloody_MIS(C_Item)
{
	name						= "字 条";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseBloodMIS;

	value						= 0;

	description					= "血 蝇 的 毒 液";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string BloodMIS_1 = "血 蝇 的 刺 含 有 一 种 致 命 的 毒 液 ， 精 神 健 全 的 人 绝 对 不 会 尝 试 。";
const string BloodMIS_2 = "除 非 他 知 道 去 除 毒 刺 的 技 巧 和 下 面 的 规 则 。 ";
const string BloodMIS_3 = "用 锋 利 的 刀 片 把 刺 从 中 轴 末 端 整 齐 地 切 开 。";
const string BloodMIS_4 = "移 开 上 层 皮 肤 。 被 切 开 的 组 织 包 围 着 一 个 腺 体 ";
const string BloodMIS_5 = "这 个 组 织 的 特 殊 汁 液 有 治 疗 效 果 。 ";
const string BloodMIS_6 = "不 过 ， 人 体 会 慢 慢 对 治 疗 药 剂 产 生 免 疫 。";
const string BloodMIS_7 = "戴 玛 洛 克";
func void UseBloodMIS()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, BloodMIS_1);
				Doc_PrintLines	(nDocID, 0, BloodMIS_2);
				Doc_PrintLines	(nDocID, 0, BloodMIS_3);
				Doc_PrintLines	(nDocID, 0, BloodMIS_4);
				Doc_PrintLines	(nDocID, 0, BloodMIS_5);
				Doc_PrintLines	(nDocID, 0, BloodMIS_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BloodMIS_7);
	Doc_Show(nDocID);

	if (Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		Log_CreateTopic(Topic_Bonus, LOG_NOTE);
		B_LogEntry(Topic_Bonus, Topic_Bonus_5);
		B_GivePlayerXP(XP_Ambient);
	};
};

//**********************************************************************************
//	Brief von Lutero
// ----------------------------------------------------------------------------------

instance ItWr_Pfandbrief_MIS(C_Item)
{
	name						= "借 据 注 释";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePfandbrief;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Pfandbrief_1 = "为 了 偿 还 未 清 债 务 ， 可 以 接 受  ";
const string Pfandbrief_2 = "典 当 物 品 ， 其 价 值 要 等 于";
const string Pfandbrief_3 = "债 务 。";
const string Pfandbrief_4 = "已 典 当 ： 装 饰 性 金 杯 ";
const string Pfandbrief_5 = "鲜 血 圣 杯 藏 品";
const string Pfandbrief_6 = "签署";
const string Pfandbrief_7 = "鲁 特 罗 ， 商 人  ";
const string Pfandbrief_8 = "雷 玛 尔 ， 典 当 商";
func void UsePfandbrief()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Pfandbrief_1);
				Doc_PrintLine	(nDocID, 0, Pfandbrief_2);
				Doc_PrintLine	(nDocID, 0, Pfandbrief_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Pfandbrief_4);
				Doc_PrintLines	(nDocID, 0, Pfandbrief_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Pfandbrief_6);
				Doc_PrintLine	(nDocID, 0, Pfandbrief_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Pfandbrief_8);
	Doc_Show(nDocID);
};

instance ItWr_Map_OldWorld_Oremines_MIS(C_Item)
{
	name						= "加 隆 德 的 矿 坑 地 图";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_OldWorld_Oremines;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_OldWorld_Oremines()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_MIS);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_OldWorld_Oremines.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document, -78500, 47500, 54000, -53000);
	Doc_Show(Document);
};

//**********************************************************************************
//	Ruf des Dominique
// ----------------------------------------------------------------------------------

instance ItWr_Manowar(C_Item)
{
	name						= "文 字";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseManowar;

	value						= 0;

	description					= "歌 词 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Manowar_1 = "多 米 尼 克 的 哭 泣";
const string Manowar_2 = "我 们 将 得 到 他 的 荣 耀 。 ";
const string Manowar_3 = "英 诺 斯 在 支 持 我 和 我 的 兄 弟 们 。";
const string Manowar_4 = "我 会 杀 死 任 何 象 民 样 一 样 阻 止 我 的 人";
const string Manowar_5 = "因 为 他 是 我 心 中 的 火 焰 。";
const string Manowar_6 = "我 的 刀 只 为 他 服 务 。  ";
const string Manowar_7 = "现 在 ， 他 的 名 字 将 会 广 为 传 播 。";
const string Manowar_8 = "任 何 反 对 我 的 人";
const string Manowar_9 = "将 会 死 在 我 的 手 里";
const string Manowar_10 = "因 为 我 是 英 诺 斯 的 战 士 。";
func void UseManowar()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Manowar_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Manowar_2);
				Doc_PrintLines	(nDocID, 0, Manowar_3);
				Doc_PrintLines	(nDocID, 0, Manowar_4);
				Doc_PrintLines	(nDocID, 0, Manowar_5);
				Doc_PrintLines	(nDocID, 0, Manowar_6);
				Doc_PrintLines	(nDocID, 0, Manowar_7);
				Doc_PrintLines	(nDocID, 0, Manowar_8);
				Doc_PrintLines	(nDocID, 0, Manowar_9);
				Doc_PrintLines	(nDocID, 0, Manowar_10);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	BRIEF der Wassermagier
// ----------------------------------------------------------------------------------

instance ItWr_KDWLetter(C_Item)
{
	name						= "消 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseKDWLetter;

	value						= 0;

	description					= "一 条 消 息 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string KDWLetter_1 = "我 们 已 经 离 开 了 营 地 。 现 在 屏 障 已 经 被 突 破 ， 我 们 将 会 找 到 毁 灭 的 中 心 。 也 许 我 们 能 在 那 里 找 到 多 年 以 来 我 们 寻 找 的 答 案 。 亚 达 诺 斯 知 道 我 们 的 旅 途 会 把 我 们 带 到 何 处 。";
const string KDWLetter_2 = "亚 达 诺 斯 和 我 们 在 一 起 。";
const string KDWLetter_3 = "萨 图 拉 斯";
func void UseKDWLetter()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, KDWLetter_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, KDWLetter_2);
				Doc_PrintLine	(nDocID, 0, KDWLetter_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	BRIEF von Gilbert
// ----------------------------------------------------------------------------------

instance ItWr_GilbertLetter(C_Item)
{
	name						= "字 条";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseGilbertLetter;

	value						= 0;

	description					= "一 条 消 息 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string GilbertLetter_1 = "我 吃 饱 了 。 我 已 经 在 这 里 多 了 很 久 。 如 果 我 听 到 的 没 错 的 话 ， 屏 障 终 于 被 破 坏 了 。  ";
const string GilbertLetter_2 = "现 在 似 乎 不 会 有 人 再 来 找 我 了 。 我 已 经 受 够 了 这 个 煽 动 和 这 个 该 死 的 山 谷 。 该 回 家 了 。";
const string GilbertLetter_3 = "吉 尔 伯 特";
func void UseGilbertLetter()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, GilbertLetter_1);
				Doc_PrintLines	(nDocID, 0, GilbertLetter_2);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, GilbertLetter_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

instance ItRi_Tengron(C_Item)
{
	name						= NAME_Ring;

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Hp_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ItRi_Tengron;
	on_unequip					= UnEquip_ItRi_Tengron;

	value						= Value_Ri_Hp;

	description					= NAME_ADDON_TengronsRing;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Bonus_HP;								count[2] = Ri_Hp;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if (self.attribute [ATR_HITPOINTS] > Ri_Hp + 1)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};
