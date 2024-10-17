//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//			---------------------------------------------
//****************************************************************************
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name						= "密 封 的 消 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_SaturasFirstMessage_Sealed;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 条 信 息 被 仔 细 地 密 封 起 来 。";count[2] = 0;
};

var int Use_SaturasFirstMessage_OneTime;
const string SaturasFirstMessage_1 = "亲 爱 的 瓦 卓 斯 ，";
const string SaturasFirstMessage_2 = "我 们 必 须 去 传 送 门 那 里 。 你 是 正 确 的 。";
const string SaturasFirstMessage_3 = "他 们 看 来 的 确 是 亚 达 诺 斯 的 信 徒 。 我 要 求 你 在 得 到 我 的 字 条 的 帮 助 之 后 ， 马 上 验 证 此 事 。";
const string SaturasFirstMessage_4 = "我 们 已 经 几 天 没 有 看 到 那 些 奇 怪 的 石 头 人 了 。";
const string SaturasFirstMessage_5 = "不 过 ， 地 面 还 是 在 没 有 任 何 明 显 的 原 因 时 连 续 震 动 。";
const string SaturasFirstMessage_6 = "我 猜 想 我 们 的 研 究 很 快 就 会 给 我 们 带 来 更 多 的 启 迪 。";
const string SaturasFirstMessage_7 = "我 们 发 现 的 装 饰 物 比 我 们 最 初 预 期 的 拥 有 更 加 重 要 的 意 义 。 看 来 是 它 一 个 至 关 重 要 的 关 键 物 品 。 不 过 ， 还 没 有 完 成 。 我 们 必 须 做 进 一 步 研 究 。";
const string SaturasFirstMessage_8 = "从 ‘ 水 之 环 ’ 派 遣 一 个 我 们 的 追 随 者 把 它 给 我 们 带 回 来 。 如 果 可 能 的 话 ， 不 要 派 卡 瓦 隆 。";
const string SaturasFirstMessage_9 = "我 已 经 派 他 把 这 封 信 送 给 你 。 我 想 让 他 来 做 足 够 了 。";
const string SaturasFirstMessage_10 = "我 希 望 我 们 做 得 正 确 。";
const string SaturasFirstMessage_11 = "萨 图 拉 斯";
func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, SaturasFirstMessage_1);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_2);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_3);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_4);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_5);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_6);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_7);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_8);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_9);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_10);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, SaturasFirstMessage_11);
	Doc_Show(nDocID);

	if ((Use_SaturasFirstMessage_OneTime == FALSE)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_2);
		Use_SaturasFirstMessage_OneTime = TRUE;
	};

	if (SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_1);
	};

	if (SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_2);
	};

	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self, ItWr_SaturasFirstMessage_Addon, 1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};

//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//				Das Siegel wurde geöffnet
//			---------------------------------------------
//****************************************************************************
instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name						= "已 经 打 开 的 信 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_SaturasFirstMessage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "萨 图 拉 斯 给 瓦 卓 斯 的 信";					count[2] = 0;
};

//****************************************************************************
//				Portalschlüsselbruchstück
//			---------------------------------------------
//****************************************************************************

instance ItMi_Ornament_Addon(C_ITEM)
{
	name						= "装 饰 性 戒 指";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_PortalRing_05.3DS";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "一 个 大 型 装 饰 性 戒 指 的 碎 片";		count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC5_STANDARD;
};

instance ItMi_Ornament_Addon_Vatras(C_ITEM) // Joly: gibt Vatras dem SC um ihn zu Lares zu bringen. Nur hiermit wird Saturas zufrieden gestellt -> erst dann Nefarius Auftrag!!!!!!!!!
{
	name						= "装 饰 性 戒 指";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_PortalRing_05.3DS";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "一 个 大 型 装 饰 性 戒 指 的 碎 片";		count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC5_STANDARD;
};

//****************************************************************************
//				ItWr_Map_NewWorld_Ornaments_Addon
//			---------------------------------------------
//****************************************************************************

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name						= "内 法 利 尔 斯 的 地 图"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_Ornaments;

	value						= 250;

	description					= name;
	text[0]						= "内 法 利 尔 斯 把 可 以 找 到 的 失 踪";	count[0] = 0;
	text[1]						= "装 饰 物 地 点 已 经 表 在 地 图 上 了";count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_Ornaments()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
	};

	SC_SAW_ORNAMENT_MAP = TRUE;

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_Ornaments.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//****************************************************************************
//				ItWr_Map_NewWorld_Dexter
//			---------------------------------------------
//****************************************************************************

instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name						= "克 霍 里 尼 斯 的 地 形 图"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_Dexter;

	value						= 210;

	description					= name;
	text[0]						= "斯 奇 普 已 经 标 明 了 位 置";			count[0] = 0;
	text[1]						= "我 在 哪 里 可 以 找 到 强 盗 首 领";				count[1] = 0;
	text[2]						= "德 克 斯 特。";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_Dexter()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_Dexter.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//****************************************************************************
//				ItRi_Ranger_Addon
//			---------------------------------------------
//****************************************************************************

prototype Rangerring_Prototype(C_ITEM)
{
	name = "蓝 宝 石 戒 指";

	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION; // Joly:kein Multiitem. Die ringe sind individuell

	value = Value_Ri_HpMana;

	visual = "ItRi_Hp_Mana_01.3ds";

	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;

	description = "‘ 水 之 环 ’ 的 识 别 标 记";

	TEXT[5] = NAME_Value;
	COUNT[5] = value;

	INV_ZBIAS = INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ = INVCAM_Z_RING_STANDARD;
	INV_ROTX = INVCAM_X_RING_STANDARD;
};

func void Equip_ItRi_Ranger_Addon()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if (ENTERED_ADDONWORLD == FALSE) // Joly:wegen Lance' Ring
		{
			if (Npc_HasItems(hero, ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};

		SCIsWearingRangerRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if (SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};

		RangerRingIsLaresRing = FALSE;
	};
};

// Lares Ring
instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	TEXT[1] = "这 个 戒 指 属 于 莱 尔 瑞 兹";
};

// PCs Ring
instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	TEXT[1] = "这 个 戒 指 属 于 我";
};

// Lance Ring
instance ItRi_LanceRing(Rangerring_Prototype)
{
	TEXT[1] = "这 个 戒 指 属 于 兰 斯";
};

//****************************************************************************
//				ItMi_PortalRing_Addon
//			---------------------------------------------
//****************************************************************************

instance ItMi_PortalRing_Addon(C_Item)
{
	name						= "装 饰 性 戒 指";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_PortalRing_01.3DS";
	material					= MAT_STONE;

	value						= 0;

	description					= "传 送 门 戒 指";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC3_STANDARD;
};

//**********************************************************************************
//	Empfehlungsschreiben für Andre, Miliz zu werden (von Martin)
// ----------------------------------------------------------------------------------

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name						= "马 丁 的 推 荐 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MartinMilizEmpfehlung_Addon;

	value						= 0;

	description					= "来 自 安 德 烈 勋 爵 的 推 荐 信";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 封 信 应 该 可 以 让";		count[2] = 0;
	text[3]						= "民 兵 接 受 我";			count[3] = 0;
};

const string MartinMilizEmpfehlung_Addon_1 = "尊 敬 的 安 德 烈 勋 爵";
const string MartinMilizEmpfehlung_Addon_2 = "我 从 我 们 的 民 兵 中 派 遣 了 一 名 新 兵 给 你 送 信 。";
const string MartinMilizEmpfehlung_Addon_3 = "他 已 经 帮 我 完 成 了 一 些 困 难 和 重 要 的 事 情 。";
const string MartinMilizEmpfehlung_Addon_4 = "我 肯 定 他 可 以 胜 任 保 护 国 王 的 任 务 ， 并 造 福 这 个 城 市 的 居 民 。";
const string MartinMilizEmpfehlung_Addon_5 = "英 诺 斯 祝 福 国 王 。";
const string MartinMilizEmpfehlung_Addon_6 = "     补 给 官 员 马 丁";
func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_2);
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_3);
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_4);
				Doc_PrintLine	(nDocID, 0, MartinMilizEmpfehlung_Addon_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, MartinMilizEmpfehlung_Addon_6);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Ravens Befehle an Dexter
// ----------------------------------------------------------------------------------

instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name						= "命 令";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_RavensKidnapperMission_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "我 从 强 盗 德 克 斯 特 那 里 ";					count[2] = 0;
	text[3]						= "得 到 这 封 信";				count[3] = 0;
};

var int Use_RavensKidnapperMission_Addon_OneTime;
const string RavensKidnapperMission_Addon_1 = "德 克 斯 特 ， 你 这 个 混 蛋 ！";
const string RavensKidnapperMission_Addon_2 = "当 我 还 是 矿 石 大 亨 时 ， 你 并 非 如 此 不 可 靠 。";
const string RavensKidnapperMission_Addon_3 = "如 果 你 不 能 再 从 城 市 里 绑 架 更 多 的 市 民 给 我 的 话 ， 在 我 们 隐 蔽 所 里 的 小 伙 子 很 快 就 会 出 现 严 重 的 问 题 。 ";
const string RavensKidnapperMission_Addon_4 = "我 这 里 需 要 更 多 的 奴 隶 ， 否 则 那 个 小 子 将 会 开 始 反 抗 。 而 我 不 用 告 诉 你 那 意 味 着 什 么 ， 对 吗 ？";
const string RavensKidnapperMission_Addon_5 = "我 将 要 进 入 神 殿 。 那 样 的 话 ， 我 就 无 法 再 制 造 这 样 的 骚 乱 了 。";
const string RavensKidnapperMission_Addon_6 = "还 有 一 个 问 题 ：";
const string RavensKidnapperMission_Addon_7 = "迟 早 我 们 都 要 在 克 霍 里 尼 斯 东 北 的 山 顶 找 一 条 路 。 如 果 我 们 不 继 续 付 给 他 们 钱 的 话 ， 海 盗 们 不 会 再 继 续 运 送 。";
const string RavensKidnapperMission_Addon_8 = "     瑞 雯";
func void Use_RavensKidnapperMission_Addon()
{
	if ((Use_RavensKidnapperMission_Addon_OneTime == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_3);
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};

	SCKnowsMissingPeopleAreInAddonWorld = TRUE;

	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_2);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_3);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_4);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_5);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_6);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RavensKidnapperMission_Addon_8);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Empfehlungsschreiben für Pedro, ins Kloster eingelassen zu werden.
// ----------------------------------------------------------------------------------

instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name						= "瓦 卓 斯 的 推 荐 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_VatrasKDFEmpfehlung_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 封 信 应 该 可 以 帮 助 我 进 入";		count[2] = 0;
	text[3]						= "火 魔 法 师 的 修 道 院";			count[3] = 0;
	text[4]						= "没 有 礼 物 。";						count[4] = 0;
};

const string VatrasKDFEmpfehlung_Addon_1 = "火 兄 弟";
const string VatrasKDFEmpfehlung_Addon_2 = "我 刚 刚 得 知 要 想 进 入 你 的 领 域 需 要 礼 物 。";
const string VatrasKDFEmpfehlung_Addon_3 = "我 派 来 送 这 封 信 的 信 徒 希 望 成 为 你 们 的 一 个 学 徒 。";
const string VatrasKDFEmpfehlung_Addon_4 = "     瓦 卓 斯";
func void Use_VatrasKDFEmpfehlung_Addon()
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
				Doc_PrintLines	(nDocID, 0, VatrasKDFEmpfehlung_Addon_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasKDFEmpfehlung_Addon_2);
				Doc_PrintLines	(nDocID, 0, VatrasKDFEmpfehlung_Addon_3);
				// Doc_PrintLine	(nDocID, 0, "Ich hoffe, dass ich nicht persönlich erscheinen muss ihm den Einlass ");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, VatrasKDFEmpfehlung_Addon_4);
	Doc_Show(nDocID);
};

/******************************************************************************************/
instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name						= "英 诺 斯 的 贵 重 雕 像";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_InnosStatue.3DS";
	material					= MAT_METAL;

	value						= Value_InnosStatue;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Abschiedsbrief von Lucia an Elvrich
// ----------------------------------------------------------------------------------

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name						= "露 西 亚 的 辞 别 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_LuciasLoveLetter_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string LuciasLoveLetter_Addon_1 = "最 亲 爱 的 艾 尔 弗 里 奇";
const string LuciasLoveLetter_Addon_2 = "我 无 法 找 到 言 辞 来 表 达 我 的 歉 意 。";
const string LuciasLoveLetter_Addon_3 = "我 知 道 你 不 会 理 解 ， 但 是 我 已 经 得 出 结 论 ， 如 果 你 找 到 一 个 比 我 更 好 的 女 孩 的 话 ， 对 我 们 两 个 人 都 好 。";
const string LuciasLoveLetter_Addon_4 = "我 不 会 再 回 到 我 离 开 的 地 方 。 忘 了 我 。 一 个 像 我 这 样 的 妓 女 配 不 上 你 这 样 正 直 的 人 。 再 会 。";
const string LuciasLoveLetter_Addon_5 = "     露西亚";
func void Use_LuciasLoveLetter_Addon()
{
	Log_CreateTopic(TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Lucia, TOPIC_Addon_Lucia_1);
	MIS_LuciasLetter = LOG_RUNNING;
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_2);
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_3);
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, LuciasLoveLetter_Addon_5);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Effectitems
//			---------------------------------------------
//****************************************************************************

prototype EffectItemPrototype_Addon(C_Item)
{
	name = "石 头";

	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;

	value = Value_Coal;

	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;

	description = name;
	TEXT[5] = NAME_Value;
	COUNT[5] = value;

	INV_ZBIAS = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

/******************************************************************************************/
// Hacke
instance ItMi_Rake(C_Item)
{
	name						= "鹤 嘴 锄";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Rake.3DS";
	material					= MAT_WOOD;

	scemeName					= "RAKE";
	on_state[1]					= Use_Rake;

	value						= Value_Rake;

	description					= name;
	// text[3]					= "(Lässt sich bei geöffnetem Inventar benutzen)";
	// text[4]					= "('Aktionstaste' + 'Pfeil- Vorne' gedrückt halten)";

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
	// INV_ROTX					= 180;
};

func void Use_Rake()
{
	// B_SCUsesRake (self); // Schatz ausgraben ist jetzt Mobsi mit itmw_2h_Axe_L_01
};

/******************************************************************************************/
instance ItRi_Addon_BanditTrader(C_Item) // Händlergildenring
{
	name						= "公 会 戒 指";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING;

	visual						= "ItRi_Prot_Point_02.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	value						= 5;

	description					= "雕 刻 戒 指";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "海 外 贸 易 公 会 阿 莱 克 欧 斯";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

//**********************************************************************************
//	ItWr_Addon_BanditTrader
// ----------------------------------------------------------------------------------

instance ItWr_Addon_BanditTrader(C_Item)
{
	name						= "货 物";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Addon_BanditTrader;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "我 在 塞 柯 布 的 农 场 后 面";				count[2] = 0;
	text[3]						= "找 到 这 封 信 和 这 些 强 盗";	count[3] = 0;
};

var int Use_ItWr_Addon_BanditTrader_OneTime;
const string ItWr_Addon_BanditTrader_1 = "１ ５ 短 剑";
const string ItWr_Addon_BanditTrader_2 = "２ ０ 轻 剑";
const string ItWr_Addon_BanditTrader_3 = "２ ５ 块 面 包";
const string ItWr_Addon_BanditTrader_4 = "１ ５ 瓶 葡 萄 酒";
const string ItWr_Addon_BanditTrader_5 = "那 是 最 后 一 次 。 ";
const string ItWr_Addon_BanditTrader_6 = "这 个 东 西 变 得 太 烫 了";
const string ItWr_Addon_BanditTrader_7 = "     费 尔 南 多";
func void Use_ItWr_Addon_BanditTrader()
{
	BanditTrader_Lieferung_Gelesen = TRUE;
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_1);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_2);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_3);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_4);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_5);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_6);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Addon_BanditTrader_7);
	Doc_Show(nDocID);

	if ((MIS_Vatras_FindTheBanditTrader != 0)
	&& (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_1);
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};

//****************************************************************************
//				Vatras schickt SC zu Saturas
//			---------------------------------------------
//****************************************************************************
instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name						= "消 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Vatras2Saturas_FindRaven_Sealed;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "瓦 卓 斯 给 萨 图 拉 斯 的 信";				count[2] = 0;
};

const string Vatras2Saturas_FindRaven_1 = "亲 爱 的 萨 图 拉 斯";
const string Vatras2Saturas_FindRaven_2 = "我 希 望 你 的 目 标 很 快 能 达 到 。 我 们 在 城 市 里 的 情 况 现 在 看 起 来 已 经 缓 和 下 来 。 不 过 我 担 心 这 种 宁 静 是 一 个 诱 饵 。 你 应 该 快 点 ， 我 需 要 你 来 这 里 。";
const string Vatras2Saturas_FindRaven_3 = "我 已 经 研 究 过 你 的 记 录 ， 并 能 肯 定 你 的 猜 测 。 这 些 作 品 的 确 指 出 了 一 个 崇 拜 亚 达 诺 斯 的 文 化 。 要 小 心 ， 不 要 让 你 自 己 被 虚 假 的 预 言 蒙 住 眼 睛 。";
const string Vatras2Saturas_FindRaven_4 = "失 踪 的 克 霍 里 尼 斯 市 民 被 前 矿 石 大 亨 瑞 雯 拉 到 了 传 送 门 的 目 的 地 。";
const string Vatras2Saturas_FindRaven_5 = "还 有 一 件 事 ： 我 给 你 派 遣 了 帮 手 。 带 着 这 个 信 息 的 人 是 非 常 特 殊 的 。 他 的 眼 中 有 一 种 非 同 寻 常 的 闪 光 。 我 不 能 确 定 ， 但 很 可 能 就 是 ‘ 他 ’ ， 尽 管 我 们 已 经 在 想 象 他 的 与 众 不 同 。";
const string Vatras2Saturas_FindRaven_6 = "测 试 他 。 我 想 我 是 对 的 。";
const string Vatras2Saturas_FindRaven_7 = "     瓦 卓 斯";
func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, Vatras2Saturas_FindRaven_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_2);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_3);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_4);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_5);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Vatras2Saturas_FindRaven_7);
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self, ItWr_Vatras2Saturas_FindRaven_opened, 1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};

instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name						= "已 经 打 开 的 信 息";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Vatras2Saturas_FindRaven;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "瓦 卓 斯 给 萨 图 拉 斯 的 信";				count[2] = 0;
};

// ------------------------------------------------------------------------------------------
// Amulett des suchenden Irrlichts
// ------------------------------------------------------------------------------------------
instance ItAm_Addon_WispDetector(C_Item)
{
	name						= "兽 人 护 身 符";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER_BLUE";

	visual						= "ItAm_Mana_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_WispDetector;
	on_unequip					= UnEquip_WispDetector;

	value						= Value_Am_DexStrg;

	description					= "兽 人 护 身 符 - 寻 找 磷 火";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

var int Equip_WispDetector_OneTime;

func void Equip_WispDetector()
{
	if (Equip_WispDetector_OneTime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE; // das erste Talent gibt's gratis
		WispSearching = WispSearch_NF;
		Equip_WispDetector_OneTime = TRUE;
	};

	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	AI_Teleport(DetWsp, "TOT");
	Wld_SpawnNpcRange(self, Wisp_Detector, 1, 500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", Wisp_Detector, Wisp_Detector, 0, 0, 0, FALSE);
	Snd_Play("MFX_Transform_Cast");
	// Wld_PlayEffect("spellFX_SummonCreature_ORIGIN", hero, hero, 0, 0, 0, FALSE );
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);

	if (Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};

	AI_Teleport(DetWsp, "TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp, "TOT");
};

// Alligatorfleisch

instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name						= "沼 泽 鼠 肉";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItFoMuttonRaw.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MEAT";

	value						= Value_RawMeat;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "不 知 道 为 什 么 ， 闻 起 来 有 腥 臭 味 ！";					count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_RawMeat;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name						= "摩 根 的 戒 指";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Prot_Total_02.3DS";
	material					= MAT_METAL;

	on_equip					= Equip_MorgansRing;
	on_unequip					= UnEquip_MorgansRing;

	value						= 500;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "戒 指 装 饰 着 很 多 杰 出 的 咒 语 。";count[1] = 0;
	text[2]						= NAME_ADDON_BONUS_1H;							count[2] = 10;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_MorgansRing()
{
	B_AddFightSkill(self, NPC_TALENT_1H, 10);
};

func void UnEquip_MorgansRing()
{
	B_AddFightSkill(self, NPC_TALENT_1H, -10);
};

instance ItMi_Focus(C_Item)
{
	name						= "聚 焦 石";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_MANAPOTION";

	visual						= "ItMi_Focus.3DS";
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

// ---------------------------------------------------------------------------
//				Stahl Paket für Huno
// ---------------------------------------------------------------------------
instance ItMi_Addon_Steel_Paket(C_Item)
{
	name						= "金 属 包 裹";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	value						= 300;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 个 包 裹 真 的 很 重";			count[2] = 0;
	text[3]						= "它 里 面 有 一 大 块 金 属";		count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// ------------------------------------------------------------------------------------------
// 	ItWr_StonePlateCommon_Addon
// ------------------------------------------------------------------------------------------
instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name						= "旧 石 片";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_StonePlate_Read_06.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_StonePlateCommon;

	value						= value_StonePlateCommon;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 块 灰 色 的 石 片";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value_StonePlateCommon;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string StonePlateCommon_1 = "战 士 们 的 职 业 招 致 了 我 们 神 的 愤 怒 。";
const string StonePlateCommon_2 = "拉 德 梅 斯 ， 夸 霍 德 隆 的 继 承 者 ， 被 流 放 了 。 但 是 他 的 邪 恶 力 量 甚 至 可 以 从 他 的 流 放 地 到 达 我 们 这 里 。";
const string StonePlateCommon_3 = "我 们 无 力 对 抗 它 。";
const string StonePlateCommon_4 = "亚 达 诺 斯 的 愤 怒 袭 击 了 杰 赫 兰 达 ！";
func void Use_StonePlateCommon()
{
	var int nDocID;

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create(); // DocManager
		Doc_SetPages(nDocID, 1); // wieviel Pages
		Doc_SetPage(nDocID, 0, "Maya_Stoneplate_03.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_4);
	}
	else // Spieler beherrscht Sprache nicht
	{
		nDocID = Doc_Create(); // DocManager
		Doc_SetPages(nDocID, 1); // wieviel Pages
		Doc_SetPage(nDocID, 0, "Maya_Stoneplate_02.TGA", 0);
		/*
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "Oksefd nodnf Kwe. Erfjkemvfj Hwoqmnyhan ckh Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "RHADEMES revfnbrebuiwe QUAHODRON ewohjfribwe wef Gkjsdhad smoelk. Ihdh Znshen Fjewheege Egdgsmkd Ygc slje smoelkor.");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "Esfjwedbwe ewzbfujbwe Iuhdfb");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "ADANOS Ygc Egdgsmkd JHARKENDAR!");
		*/
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//				Die 5 Steintafeln
// ---------------------------------------------------------------------------

instance ItMi_Addon_Stone_01(C_Item) // Esteban und Thorus // Joly:Die Banditen benutzen diese Steintafeln als Zahlungsmittel.
{
	name						= "红 色 石 片";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_03.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_01;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 块 红 色 的 石 片";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_01_1 = "我 们 ， 五 人 议 会 最 后 的 三 个 领 导 者 ， 用 一 间 布 满 陷 阱 的 神 殿 的 房 间 把 入 口 隐 藏 起 来 ， 以 使 那 把 剑 永 远 无 法 再 见 阳 光 。";
const string Addon_Stone_01_2 = "Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.";
func void Use_Addon_Stone_01()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_02.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_01_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_01_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 5
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_05(C_Item) // Valley - Totenwächter
{
	name						= "黄 色 石 片";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_04.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_05;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 块 黄 色 的 石 片";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_05_1 = "我 ， 反 对 三 人 决 定 的 人 ， 修 建 了 第 一 个 陷 阱 。 而 且 只 有 我 知 道 正 确 的 入 口 。";
const string Addon_Stone_05_2 = "Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.";
func void Use_Addon_Stone_05()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_01.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_05_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_05_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 3
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_03(C_Item) // Valley - Priester
{
	name						= "蓝 色 石 片";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_05.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_03;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 块 蓝 色 的 石 片";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_03_1 = "克 哈 迪 蒙 设 计 了 第 一 个 机 关 。 而 且 只 有 始 终 追 随 光 明 的 人 可 以 到 达 第 三 个 房 间 。";
const string Addon_Stone_03_2 = "KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.";
func void Use_Addon_Stone_03()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_03.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_03_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_03_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 4
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_04(C_Item) // DAS DING AUS DEM SENAT /SUMPF // Joly: Haus der Heiler
{
	name						= "绿 色 石 片";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_01.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_04;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 块 绿 色 的 石 片";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_04_1 = "第 三 个 机 关 是 由 夸 霍 德 隆 设 计 的 ， 只 有 他 知 道 如 何 开 启 传 送 门 。";
const string Addon_Stone_04_2 = "Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.";
func void Use_Addon_Stone_04()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_04.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_04_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_04_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 5
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_02(C_Item) // Bibliothek der Erbauer.
{
	name						= "紫 色 石 片";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_02.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_02;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 块 紫 色 的 石 片";					count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_02_1 = "夸 霍 德 隆 在 克 哈 迪 蒙 的 帮 助 下 从 外 面 封 印 了 神 殿 大 门 。 他 们 无 一 从 仪 式 中 生 还 。";
const string Addon_Stone_02_2 = "只 有 我 还 可 以 讲 述 这 个 故 事 。";
const string Addon_Stone_02_3 = "我 希 望 那 个 拉 德 梅 斯 永 远 腐 烂 在 神 殿 之 中 ！";
const string Addon_Stone_02_4 = "QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.";
const string Addon_Stone_02_5 = "Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.";
const string Addon_Stone_02_6 = "Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!";
func void Use_Addon_Stone_02()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_05.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_3);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_6);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//*******************************************
//		Der goldene Kompass
//*******************************************

instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name						= "金 制 罗 盘";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Compass_01.3DS";
	material					= MAT_STONE;

	value						= 500;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

//*******************************************
//			Morgans Schatz
//*******************************************

instance ItSE_Addon_FrancisChest(C_Item)
{
	name						= "宝 箱";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_GoldChest.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= FrancisChest;

	value						= 200;

	description					= "一 个 宝 箱";
	text[0]						= "这 个 箱 子 非 常 重 。";					count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void FrancisChest()
{
	CreateInvItems(hero, ItMi_GoldChest, 1);
	CreateInvItems(hero, ItMw_FrancisDagger_Mis, 1);
	CreateInvItems(hero, Itmi_Gold, 153);
	CreateInvItems(hero, ItMi_GoldCup, 1);
	CreateInvItems(hero, ItMi_SilverNecklace, 1);
	CreateInvItems(hero, ITWR_Addon_FrancisAbrechnung_Mis, 1);

	Snd_Play("Geldbeutel");
	Print(PRINT_FRANCIS_CHEST);
};

instance ITWR_Addon_FrancisAbrechnung_Mis(C_ITEM)
{
	name						= "支 付 记 录";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseFrancisAbrechnung_Mis;

	value						= 100;

	description					= NAME;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string FrancisAbrechnung_Mis_1 = "商 船 ‘ 人 鱼 ’";
const string FrancisAbrechnung_Mis_2 = "总 共 获 得 ： １ ４ ５ ６ ０ 金 币";
const string FrancisAbrechnung_Mis_3 = "-----------------------";
const string FrancisAbrechnung_Mis_4 = "船 员 ： ９ ８ ４ ０ ";
const string FrancisAbrechnung_Mis_5 = "高 级 船 员 ： ２ ５ ０ ０ ";
const string FrancisAbrechnung_Mis_6 = "船 长 ： １ ０ ０ ０ ";
const string FrancisAbrechnung_Mis_7 = "-----------------------";
const string FrancisAbrechnung_Mis_8 = "个 人 获 得 ： ２ ２ ２ ０";
const string FrancisAbrechnung_Mis_9 = "商 船 ‘ 米 里 亚 姆 ’";
const string FrancisAbrechnung_Mis_10 = "总 共 获 得 ： ４ ８ ９ ０ 金 币";
const string FrancisAbrechnung_Mis_11 = "-----------------------";
const string FrancisAbrechnung_Mis_12 = "船 员 ： ２ ３ ９ ０ ";
const string FrancisAbrechnung_Mis_13 = "高 级 船 员 ： ５ ０ ０ ";
const string FrancisAbrechnung_Mis_14 = "船 长 ： ５ ０ ０ ";
const string FrancisAbrechnung_Mis_15 = "----------------------";
const string FrancisAbrechnung_Mis_16 = "个 人 获 得 ： １ ０ ０ ０ ";
const string FrancisAbrechnung_Mis_17 = "商 船 ‘ 尼 克 ’";
const string FrancisAbrechnung_Mis_18 = "总 共 获 得 ： ９ ９ ７ ０ ";
const string FrancisAbrechnung_Mis_19 = "----------------------";
const string FrancisAbrechnung_Mis_20 = "船 员 ： ５ ６ １ ０ ";
const string FrancisAbrechnung_Mis_21 = "高 级 船 员 ： １ ５ ０ ０";
const string FrancisAbrechnung_Mis_22 = "船 长 ： １ ０ ０ ０";
const string FrancisAbrechnung_Mis_23 = "----------------------";
const string FrancisAbrechnung_Mis_24 = "个 人 获 得 ： １ ８ ６ ０";
const string FrancisAbrechnung_Mis_25 = "商 船 ‘ 玛 丽 亚 ’";
const string FrancisAbrechnung_Mis_26 = "总 共 获 得 ： ７ ８ ５ １ 个 金 币";
const string FrancisAbrechnung_Mis_27 = "----------------------";
const string FrancisAbrechnung_Mis_28 = "船 员 ： ４ ４ ０ ０ ";
const string FrancisAbrechnung_Mis_29 = "高 级 船 员 ： ７ ５ ０ ";
const string FrancisAbrechnung_Mis_30 = "船 长 ： １ ０ ０ ０ ";
const string FrancisAbrechnung_Mis_31 = "----------------------";
const string FrancisAbrechnung_Mis_32 = "个 人 获 得 ： １ ７ ０ １ ";
func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_2);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_4);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_5);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_6);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_9);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_10);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_11);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_12);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_13);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_14);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_15);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_16);
				Doc_PrintLine	(nDocID, 0, "");

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_17);
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_18);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_19);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_20);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_21);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_22);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_23);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_24);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_25);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_26);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_27);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_28);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_29);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_30);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_31);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_32);
				Doc_PrintLine	(nDocID, 1, "");

	Francis_HasProof = TRUE;

	Doc_Show(nDocID);

	B_Say(self, self, "$ADDON_THISLITTLEBASTARD");
};

// -----------------------------------------------------------------------
//		Gregs Logbuch
// -----------------------------------------------------------------------

instance ITWR_Addon_GregsLogbuch_Mis(C_ITEM)
{
	name						= "航 海 日 志";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_01.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseGregsLogbuch;

	value						= 100;

	description					= "格 雷 格 的 航 海 日 志";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string GregsLogbuch_1 = "我 已 经 看 够 了 这 片 海 滩 。 到 处 是 沙 子 。 我 甚 至 无 法 入 眠 ， 因 为 到 处 都 痒 。 应 该 是 瑞 雯 交 付 囚 犯 的 金 币 的 时 候 了 ， 我 们 再 次 开 始 航 程 。 我 必 须 要 和 这 个 死 胖 子 谈 谈 。";
const string GregsLogbuch_2 = "那 头 蠢 猪 怎 么 敢 那 样 ？ 他 让 他 的 爪 牙 在 大 门 口 把 我 赶 走 。 他 应 该 和 我 把 帐 算 清 ！ 我 要 亲 手 把 那 个 马 屁 精 布 拉 德 维 恩 拿 去 喂 鱼 。";
const string GregsLogbuch_3 = "如 果 他 不 尽 快 付 账 的 话 ， 我 就 必 须 来 硬 的 。 ";
const string GregsLogbuch_4 = "那 些 强 盗 太 无 耻 了 。 他 们 还 是 没 有 支 付 上 次 的 货 款 。 我 们 没 有 足 够 的 信 息 。 我 必 须 找 出 瑞 雯 在 这 里 要 做 什 么 。";
const string GregsLogbuch_5 = "我 会 带 大 部 分 船 员 登 陆 ， 并 保 护 矿 石 。 弗 朗 西 斯 会 和 一 些 人 留 在 后 方 防 守 营 地 。 ";
const string GregsLogbuch_6 = "那 么 时 间 没 有 白 费 ， 我 给 了 波 恩 斯 盔 甲 。 他 将 为 我 潜 行 到 强 盗 营 地 去 侦 查 瑞 雯 在 那 里 有 什 么 计 划 。";
func void UseGregsLogbuch()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 0, GregsLogbuch_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, GregsLogbuch_2);
				Doc_PrintLines	(nDocID, 0, GregsLogbuch_3);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 1, GregsLogbuch_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, GregsLogbuch_5);
				Doc_PrintLines	(nDocID, 1, GregsLogbuch_6);

	Greg_GaveArmorToBones = TRUE;

	Doc_Show(nDocID);
};

// -----------------------------------------------------------------------
// Bloodwyns Truhenschlüssel - Schwere Garderüstung
// -----------------------------------------------------------------------
instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= "布 拉 德 维 恩 的 钥 匙";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "适 用 于 一 个 箱 子";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// -----------------------------------------------------------------------
// Heiler Truhenschlüssel -
// -----------------------------------------------------------------------
instance ITKE_Addon_Heiler(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= "一 把 石 头 哨 兵 的 钥 匙";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "适 用 于 一 个 箱 子";						count[2] = 0;
	text[3]						= "在 沼 泽 中 的 一 座 奇 特 、 古 老 的 建 筑 里";	count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_TempelTorKey(C_ITEM)
{
	name						= "石 片 ： 夸 霍 德 隆";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_StonePlate_Read_06.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_TempelTorKey;

	value						= 0;

	description					= "";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "亚 达 诺 斯 神 殿 的 钥 匙";			count[2] = 0;
};

const string TempelTorKey_1 = "  Jhehedra Akhantar";
func void Use_TempelTorKey()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Maya_Stoneplate_03.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				// Doc_SetFont( nDocID, 0, FONT_Book ); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				// Doc_PrintLines	(nDocID, 0, "  Eligam Shameris");

				Doc_PrintLine	(nDocID, 0, TempelTorKey_1);

	Doc_Show(nDocID);
};

// -----------------------------------------------------------------------
//	Bloodwyns Kopf
// -----------------------------------------------------------------------
instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name						= "布 拉 德 维 恩 的 头";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Head_Bloodwyn_01.3ds";
	material					= MAT_LEATHER;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// ------------------------------------------------------------------------

instance ItWR_Addon_TreasureMap(C_Item)
{
	name						= "宝 藏 地 图";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_TreasureMap;

	value						= 250;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "在 地 图 上 标 记 了 一 些 地 点 。";count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_TreasureMap()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Addon_TreasureMap);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_AddonWorld_Treasures.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document, -47783, 36300, 43949, -32300); // Joly:gut so
	Doc_Show(Document);
};

// ------------------------------------------------------------------------

instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name						= "瓶 中 信";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Water.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_GregsBottle;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "瓶 子 里 面 有 一 片 纸";count[2] = 0;
};

func void Use_GregsBottle()
{
	B_PlayerFindItem(ItWR_Addon_TreasureMap, 1);
};

/******************************************************************************************/
instance itmi_erolskelch(C_Item)
{
	name						= "刻 字 的 银 碗";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverChalice.3DS";
	material					= MAT_METAL;

	value						= 125;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};
