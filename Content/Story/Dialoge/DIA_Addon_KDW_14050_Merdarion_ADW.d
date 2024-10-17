///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_EXIT(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 999;
	condition		= DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information		= DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Merdarion_ADW_PICKPOCKET(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 900;
	condition		= DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition;
	information		= DIA_Addon_Merdarion_ADW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Merdarion_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Merdarion_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADWHello(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_ADWHello_Condition;
	information		= DIA_Addon_Merdarion_ADWHello_Info;
	description		= "进 行 的 怎 么 样 了 ？";
};

func int DIA_Addon_Merdarion_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_Back_15_00"); //我 已 经 听 够 了 。
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_15_00"); //事 情 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_06_01"); //（ 注 意 ） 听 起 来 … … 很 古 怪 。 你 认 为 呢 ？
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_15_02"); //额 … …
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_06_03"); //这 些 传 送 石 似 乎 无 法 运 转 ， 但 是 你 能 听 到 它 们 发 出 嗡 嗡 的 声 音 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_06_04"); //虽 然 它 们 没 有 启 动 ， 但 是 它 们 内 部 一 直 都 有 一 种 能 量 。

	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "这 些 传 送 石 怎 么 获 得 它 们 所 需 的 能 量 ？", DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "你 觉 得 要 激 活 它 们 需 要 做 什 么 ？", DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_was_15_00"); //你 觉 得 要 激 活 它 们 需 要 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_01"); //对 此 我 有 一 个 想 法 。 我 只 是 需 要 证 明 我 的 猜 想 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_02"); //我 感 觉 几 天 前 ， 我 在 别 的 地 方 见 过 这 种 类 型 的 建 筑 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_03"); //我 想 我 们 已 经 给 它 们 输 送 了 相 当 多 的 能 量 ， 以 使 它 们 恢 复 运 作 。

	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "你 以 前 在 哪 里 见 过 这 些 传 送 石 ？", DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "什 么 可 以 提 供 足 够 的 魔 法 能 量 … …", DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_00"); //什 么 可 以 提 供 足 够 的 魔 法 能 量 … …
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_01"); //我 只 能 想 到 一 件 事 。 一 个 魔 法 焦 点 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_02"); //我 是 说 ， 曾 经 用 来 制 造 矿 藏 山 谷 屏 障 的 五 块 聚 焦 石 其 中 之 一 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_03"); //据 我 所 知 ， 你 已 经 在 一 段 时 间 之 前 就 把 它 们 给 我 们 带 来 了 。
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_04"); //是 的 。 我 能 记 起 来 。

	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "你 说 你 需 要 证 明 来 消 除 怀 疑 。", DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "现 在 聚 焦 石 在 哪 里 ？", DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_focusWo_15_00"); //现 在 聚 焦 石 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_01"); //它 们 已 经 被 交 给 我 了 。 我 已 经 把 它 们 保 管 在 一 个 安 全 地 方 ， 直 到 我 们 能 找 到 它 们 其 它 的 用 途 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_02"); //照 目 前 看 来 ， 时 机 已 经 成 熟 了 。
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello, "我 已 经 听 够 了。", DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_focusProof_15_00"); //你 说 你 需 要 证 明 来 消 除 怀 疑 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_01"); //一 个 魔 法 焦 点 应 该 可 以 把 这 些 石 头 连 接 起 来 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_02"); //但 是 我 不 知 道 是 哪 里 。
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_wo_15_00"); //你 以 前 在 哪 里 见 过 这 些 传 送 石 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_01"); //你 也 在 罪 犯 流 放 地 呆 过 。 你 没 有 注 意 过 那 些 石 头 吗 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_02"); //我 非 常 肯 定 现 在 还 能 在 那 里 找 到 它 们 。
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADWHello_reaktor_15_00"); //这 些 传 送 石 怎 么 获 得 它 们 所 需 的 能 量 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_01"); //建 造 者 是 高 度 发 展 的 民 族 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_02"); //他 们 使 用 了 我 们 从 未 见 过 的 魔 法 特 性 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_03"); //他 们 修 建 了 一 个 传 送 石 网 络 ， 可 以 让 建 造 者 们 迅 速 从 城 市 的 一 个 地 方 到 达 另 外 一 个 地 方 。
	AI_Output(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_04"); //这 里 的 石 头 显 然 是 某 种 的 中 心 。
};

///////////////////////////////////////////////////////////////////////
//	Info FokusGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FokusGeben(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_FokusGeben_Condition;
	information		= DIA_Addon_Merdarion_FokusGeben_Info;
	description		= "给 我 聚 焦 石 。";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FokusGeben_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_FokusGeben_15_00"); //给 我 一 块 聚 焦 石 。 我 要 试 着 让 传 送 器 运 转 。
	AI_Output(self, other, "DIA_Addon_Merdarion_FokusGeben_06_01"); //好 吧 。 但 是 要 小 心 使 用 它 ， 听 到 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_FokusGeben_06_02"); //如 果 我 丢 了 它 们 的 话 ， 萨 图 拉 斯 会 要 我 的 命 。
	CreateInvItems(self, ItMi_Focus, 1);
	B_GiveInvItems(self, other, ItMi_Focus, 1);

	Log_CreateTopic(TOPIC_Addon_TeleportsADW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_TeleportsADW, TOPIC_Addon_TeleportsADW_6);
};

///////////////////////////////////////////////////////////////////////
//	Info FirstFocus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FirstFocus(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_FirstFocus_Condition;
	information		= DIA_Addon_Merdarion_FirstFocus_Info;
	description		= "我 已 经 激 活 了 一 块 传 送 石 。";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition()
{
	if (TriggeredTeleporterADW != 0)
	{
		return TRUE;
	};
};

var int Merdarion_GotFocusCount;
func void DIA_Addon_Merdarion_FirstFocus_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_FirstFocus_15_00"); //我 已 经 激 活 了 一 块 传 送 石 。
	AI_Output(self, other, "DIA_Addon_Merdarion_FirstFocus_06_01"); //我 能 看 到 那 些 。 所 以 我 是 正 确 的 。
	AI_Output(self, other, "DIA_Addon_Merdarion_FirstFocus_06_02"); //我 同 其 它 人 谈 过 它 了 。
	AI_Output(self, other, "DIA_Addon_Merdarion_FirstFocus_06_03"); //我 们 要 你 试 着 激 活 所 有 的 传 送 石 。
	AI_Output(self, other, "DIA_Addon_Merdarion_FirstFocus_06_04"); //如 果 我 们 能 从 城 市 的 一 个 地 方 迅 速 传 到 另 一 个 地 方 ， 那 将 对 我 们 的 研 究 有 极 大 的 帮 助 。
	AI_Output(self, other, "DIA_Addon_Merdarion_FirstFocus_06_05"); //这 是 另 一 块 聚 焦 石 。
	CreateInvItems(self, ItMi_Focus, 1);
	B_GiveInvItems(self, other, ItMi_Focus, 1);
	Merdarion_GotFocusCount = 1;
	AI_Output(self, other, "DIA_Addon_Merdarion_FirstFocus_06_06"); //如 果 你 可 以 的 话 ， 把 它 们 都 激 活 。
	AI_Output(other, self, "DIA_Addon_Merdarion_FirstFocus_15_07"); //我 会 试 一 下 。
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW, TOPIC_Addon_TeleportsADW_7);
};

///////////////////////////////////////////////////////////////////////
//	Info ActivateTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ActivateTeleports(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information		= DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent		= TRUE;
	description		= "我 已 经 激 活 了 另 外 一 个 传 送 石 。";
};

func int DIA_Addon_Merdarion_ActivateTeleports_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Merdarion_FirstFocus))
	&& (TriggeredTeleporterADW > Merdarion_GotFocusCount)
	&& (Merdarion_GotFocusCount < 6))
	{
		return TRUE;
	};
};

var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_00"); //我 已 经 激 活 了 另 外 一 个 传 送 石 。

	if (SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_01"); //我 认 为 他 们 在 打 猎 。
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_02"); //当 然 。 给 你 。
		CreateInvItems(self, ItMi_Focus, 1);
		B_GiveInvItems(self, other, ItMi_Focus, 1);
	};

	if (DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_03"); //有 点 难 度 。？
		AI_Output(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_04"); //这 取 决 于 你 如 何 看 待 它 。 我 需 要 一 点 援 助 。
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_05"); //我 能 给 你 一 些 金 币 ， 那 有 用 吗 ？
		AI_Output(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_06"); //不 会 有 什 么 害 处 。
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_07"); //我 们 看 一 下 … …
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};

	if (SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_08"); //你 做 得 相 当 好 。 我 必 须 祝 贺 你 的 工 作 。
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_09"); //它 们 现 在 全 都 恢 复 运 转 了 。 非 常 感 人 的 一 幕 ， 你 认 为 呢 ？
	};

	AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_10"); //这 是 一 点 金 币 。
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);
	Merdarion_GotFocusCount = (Merdarion_GotFocusCount + 1);

	if ((Merdarion_GotFocusCount >= 1)
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (MIS_Saturas_LookingForHousesOfRulers == 0))
	{
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_11"); //哦 ， 顺 便 说 一 句 ， 免 得 忘 记 了 ， 萨 图 拉 斯 想 要 找 你 谈 话 。
		AI_Output(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_12"); //你 应 该 尽 快 去 见 他 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachMana
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_PreTeachMana(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information		= DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description		= "你 能 教 我 你 的 魔 法 技 能 吗 ？";
};

func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADW_PreTeachMana_15_00"); //你 能 教 我 你 的 魔 法 技 能 吗 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_ADW_PreTeachMana_06_01"); //我 可 以 教 你 如 何 增 强 你 的 魔 法 能 力 。
	Merdarion_Addon_TeachMana = TRUE;

	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, TOPIC_Addon_KDWTeacher_1);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_TEACH_MANA(C_INFO)
{
	npc				= KDW_14050_Addon_Merdarion_ADW;
	nr				= 99;
	condition		= DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information		= DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent		= TRUE;
	description		= "我 要 增 加 我 的 魔 法 能 力 。";
};

var int Merdarion_ADW_Empty;
func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition()
{
	if ((Merdarion_ADW_Empty == FALSE)
	&& (Merdarion_Addon_TeachMana == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00"); //我 要 增 加 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, DIALOG_BACK, DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00"); //你 的 要 求 超 出 了 我 的 能 力 。
		AI_Output(self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01"); //我 无 法 再 教 你 其 它 东 西 了 。
		Merdarion_ADW_Empty = TRUE;
	};

	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_HIGH);

	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, DIALOG_BACK, DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_HIGH);

	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, DIALOG_BACK, DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
