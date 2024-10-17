// --------------------------------------------------------------------
//	Info EXIT
// --------------------------------------------------------------------
instance DIA_Addon_Lucia_EXIT(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 999;
	condition		= DIA_Addon_Lucia_EXIT_Condition;
	information		= DIA_Addon_Lucia_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Lucia_PICKPOCKET(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 900;
	condition		= DIA_Addon_Lucia_PICKPOCKET_Condition;
	information		= DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80_Female;
};

func int DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	C_Beklauen(80, 100);
};

func void DIA_Addon_Lucia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET, DIALOG_BACK, DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};

func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_Hi(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 2;
	condition		= DIA_Addon_Lucia_Hi_Condition;
	information		= DIA_Addon_Lucia_Hi_Info;
	description		= "你 还 好 吗 ？";
};

func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Hi_15_00"); //你 还 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Hi_16_01"); //听 着 。 如 果 你 想 要 吃 的 ， 去 斯 耐 夫 那 里 。 如 果 你 想 要 喝 的 ， 你 来 对 地 方 了 。
};

// ---------------------------------------------------------------------
//	Info was
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_was(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 2;
	condition		= DIA_Addon_Lucia_was_Condition;
	information		= DIA_Addon_Lucia_was_Info;
	description		= "那 你 在 这 里 喝 什 么 ？";
};

func int DIA_Addon_Lucia_was_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_was_15_00"); //那 你 在 这 里 喝 什 么 ？
	AI_Output(self, other, "DIA_Addon_Lucia_was_16_01"); //我 们 只 有 一 点 啤 酒 。 岛 上 唯 一 的 啤 酒 是 圣 骑 士 带 来 的 。
	AI_Output(self, other, "DIA_Addon_Lucia_was_16_02"); //那 是 那 些 家 伙 带 来 的 唯 一 的 好 东 西 … …
	AI_Output(self, other, "DIA_Addon_Lucia_was_16_03"); //要 不 然 我 们 就 喝 烈 性 酒 。 我 有 月 光 、 烈 酒 和 白 朗 姆 酒 -
	AI_Output(self, other, "DIA_Addon_Lucia_was_16_04"); //（ 感 激 的 ） 嗯 … … 你 应 该 试 试 那 个 - 我 从 塞 缪 尔 那 里 得 到 了 配 方 。 那 个 老 小 子 真 的 会 做 生 意 。

	Log_CreateTopic(Topic_Addon_BDT_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, Topic_Addon_BDT_Trader_4);
};

// ---------------------------------------------------------------------
//	Info Khorinis
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_Khorinis(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 2;
	condition		= DIA_Addon_Lucia_Khorinis_Condition;
	information		= DIA_Addon_Lucia_Khorinis_Info;
	description		= "你 不 是 来 自 克 霍 里 尼 斯 的 ？";
};

func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Bromor_Lucia)
	|| (Nadja_GaveLuciaInfo == TRUE)
	|| Npc_KnowsInfo(other, DIA_Addon_Elvrich_WhatExactly))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Khorinis_15_00"); //你 不 是 来 自 克 霍 里 尼 斯 的 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Khorinis_16_01"); //不 用 提 醒 我 ！ 我 在 那 座 城 市 里 的 生 活 糟 透 了 。
	AI_Output(self, other, "DIA_Addon_Lucia_Khorinis_16_02"); //那 时 装 着 新 罪 犯 的 船 不 断 驶 入 ， 镇 上 还 有 囚 犯 。
	AI_Output(self, other, "DIA_Addon_Lucia_Khorinis_16_03"); //不 过 所 有 那 些 家 伙 … … （ 大 笑 ） 不 ， 谢 谢 。 也 许 是 因 为 我 们 在 一 座 岛 上 … … 嗯 ， 那 些 日 子 过 去 了 。

	if ((MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0))
	{
		AI_Output(self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //我 和 艾 尔 弗 里 奇 断 绝 关 系 了 ！
		AI_Output(other, self, "DIA_Addon_Lucia_Khorinis_15_04"); //为 什 么 ？
		AI_Output(self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //他 是 个 懦 夫 ！ 当 强 盗 们 把 我 拉 出 去 的 时 候 ， 他 没 有 动 一 根 手 指 来 帮 我 。
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};

	TOPIC_END_Lucia = TRUE;
};

// ---------------------------------------------------------------------
//	Info Jetzt
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_Jetzt(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 2;
	condition		= DIA_Addon_Lucia_Jetzt_Condition;
	information		= DIA_Addon_Lucia_Jetzt_Info;
	description		= "你 打 算 要 做 什 么 ？";
};

func int DIA_Addon_Lucia_Jetzt_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lucia_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Jetzt_15_00"); //你 打 算 要 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Jetzt_16_01"); //我 们 看 看 。 现 在 ， 我 要 留 在 这 里 和 斯 耐 夫 、 费 斯 克 还 有 其 它 人 一 起 。
	AI_Output(self, other, "DIA_Addon_Lucia_Jetzt_16_02"); //你 已 经 同 托 鲁 斯 谈 过 了 ？ （ 转 动 她 的 眼 睛 ） 哦 ， 英 诺 斯 ， 那 是 一 个 大 块 头 的 人 吗 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Jetzt_16_03"); //（ 大 笑 ） 抱 歉 … … 我 们 回 到 你 的 问 题 上 … … 我 没 有 目 标 ， 我 只 是 在 漂 流 。
};

// ---------------------------------------------------------------------
//	Info Paladine
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_Paladine(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 2;
	condition		= DIA_Addon_Lucia_Paladine_Condition;
	information		= DIA_Addon_Lucia_Paladine_Info;
	description		= "你 不 喜 欢 圣 骑 士 ， 对 吗 ？";
};

func int DIA_Addon_Lucia_Paladine_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Paladine_15_00"); //你 不 喜 欢 圣 骑 士 ， 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_16_01"); //那 些 狂 热 的 杀 手 是 受 火 魔 法 师 雇 佣 的 ？ 不 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_16_02"); //那 个 哈 根 勋 爵 和 他 的 暴 徒 一 起 占 领 了 城 市 ， 所 有 人 都 要 服 从 他 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_16_03"); //而 我 不 想 那 么 做 。 我 不 想 等 着 他 们 封 闭 红 灯 笼 ， 并 把 我 锁 起 来 的 。

	if ((Npc_GetTrueGuild(other) != GIL_SLD)
	&& (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine, "结 束 对 话 。", DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine, "圣 骑 士 不 仅 仅 是 以 他 的 名 义 而 战 斗 。 英 诺 斯 也 挑 选 他 的 战 士 。 ", DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine, "圣 骑 士 是 英 诺 斯 的 战 士 。 他 们 不 是 谋 杀 犯 。 ", DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00"); //圣 骑 士 不 仅 仅 是 以 他 的 名 义 而 战 斗 。 英 诺 斯 也 挑 选 他 的 战 士 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01"); //真 的 吗 ？ 我 相 信 是 人 民 选 择 了 他 们 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02"); //你 的 话 让 我 感 到 吃 惊 。 你 的 话 听 起 来 好 像 你 是 他 们 中 的 一 员 。

	Info_AddChoice(DIA_Addon_Lucia_Paladine, "你 以 前 杀 过 人 吗 ？ ", DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00"); //你 以 前 杀 过 人 吗 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01"); //不 ， 我 对 此 非 常 高 兴 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02"); //请 不 要 再 这 么 严 肃 了 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03"); //还 是 让 我 们 喝 酒 吧 ， 享 受 神 赐 予 我 们 的 每 一 刻 。

	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00"); //那 么 你 要 拒 绝 英 诺 斯 吗 ， 村 姑 ？
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01"); //我 怎 么 能 ？ 是 人 们 滥 用 他 的 名 字 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02"); //但 是 我 从 来 没 有 一 刻 怀 疑 过 英 诺 斯 的 神 圣 光 辉 。
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00"); //圣 骑 士 是 英 诺 斯 的 战 士 。 他 们 不 是 谋 杀 犯 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01"); //真 的 ？ 鲜 血 也 粘 在 他 们 的 剑 上 - 就 象 海 盗 或 者 强 盗 们 的 武 器 一 样 。
	AI_Output(self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02"); //唯 一 的 不 同 就 是 ， 他 们 是 以 英 诺 斯 的 名 义 那 样 做 的 ， 而 不 是 因 为 他 们 想 要 求 生 。

	Info_AddChoice(DIA_Addon_Lucia_Paladine, "那 么 你 要 拒 绝 英 诺 斯 吗 ， 村 姑 ？", DIA_Addon_Lucia_Paladine_WEIB);
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_Attentat(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 9;
	condition		= DIA_Addon_Lucia_Attentat_Condition;
	information		= DIA_Addon_Lucia_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Lucia_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Lucia_Attentat_16_00"); //什 么 都 不 知 道 。
};

// ---------------------------------------------------------------------
//	Info Trade
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_Trade(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 99;
	condition		= DIA_Addon_Lucia_Trade_Condition;
	information		= DIA_Addon_Lucia_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "给 我 一 点 喝 的 。";
};

func int DIA_Addon_Lucia_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Trade_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_Trade_15_00"); //给 我 一 点 喝 的 。
	B_GiveTradeInv(self);
};

// ---------------------------------------------------------------------
//	Info lernen
// ---------------------------------------------------------------------
instance DIA_Addon_Lucia_lernen(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 19;
	condition		= DIA_Addon_Lucia_lernen_Condition;
	information		= DIA_Addon_Lucia_lernen_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Addon_Lucia_lernen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_lernen_15_00"); //你 能 教 我 一 些 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Lucia_lernen_16_01"); //（ 大 笑 ） 只 是 太 高 兴 了 。 你 可 以 把 你 的 敏 捷 传 授 给 我 。

	Log_CreateTopic(Topic_Addon_BDT_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, Topic_Addon_BDT_Teacher_1);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lucia_TEACH(C_INFO)
{
	npc				= BDT_1091_Addon_Lucia;
	nr				= 101;
	condition		= DIA_Addon_Lucia_TEACH_Condition;
	information		= DIA_Addon_Lucia_TEACH_Info;
	permanent		= TRUE;
	description		= "我 想 要 变 得 更 加 灵 巧 。";
};

func int DIA_Addon_Lucia_TEACH_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other, self, "DIA_Addon_Lucia_TEACH_15_00"); //我 想 要 变 得 更 加 灵 巧 。

	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);

	Info_ClearChoices(DIA_Addon_Lucia_TEACH);

	Info_AddChoice(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);

	Info_ClearChoices(DIA_Addon_Lucia_TEACH);

	Info_AddChoice(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Lucia_TEACH_5);
};
