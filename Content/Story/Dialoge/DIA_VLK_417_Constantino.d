///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Constantino_EXIT(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 999;
	condition		= DIA_Constantino_EXIT_Condition;
	information		= DIA_Constantino_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Constantino_PICKPOCKET(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 900;
	condition		= DIA_Constantino_PICKPOCKET_Condition;
	information		= DIA_Constantino_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Constantino_PICKPOCKET_Condition()
{
	C_Beklauen(59, 90);
};

func void DIA_Constantino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
	Info_AddChoice(DIA_Constantino_PICKPOCKET, DIALOG_BACK, DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Constantino_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Constantino_Hallo(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_Hallo_Condition;
	information		= DIA_Constantino_Hallo_Info;
	important		= TRUE;
};

func int DIA_Constantino_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Hallo_Info()
{
	// ADDON AI_Output(self, other,"DIA_Constantino_Hallo_10_00"); // Was willst du? Hier gibt es nichts umsonst und ich werde dir auch nichts verkaufen.
	AI_Output(self, other, "DIA_Addon_Constantino_Hallo_10_00"); //你 想 要 什 么 ？ 我 什 么 东 西 都 不 给 。
};

///////////////////////////////////////////////////////////////////////
//	Suche Stelle als Lehrling
///////////////////////////////////////////////////////////////////////
instance DIA_Constantino_AboutLehrling(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 1;
	condition		= DIA_Constantino_AboutLehrling_Condition;
	information		= DIA_Constantino_AboutLehrling_Info;
	description		= "我 想 要 成 为 一 名 学 徒 。";
};

func int DIA_Constantino_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Constantino_AboutLehrling_Info()
{
	AI_Output(other, self, "DIA_Constantino_AboutLehrling_15_00"); //我 想 要 成 为 一 名 学 徒 。
	AI_Output(self, other, "DIA_Constantino_AboutLehrling_10_01"); //真 的 吗 ？ 那 你 准 备 跟 谁 签 约 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Constantino_Heilung(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 5;
	condition		= DIA_Constantino_Heilung_Condition;
	information		= DIA_Constantino_Heilung_Info;
	description		= "我 需 要 治 疗";
};

func int DIA_Constantino_Heilung_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Heilung_Info()
{
	AI_Output(other, self, "DIA_Constantino_Heilung_15_00"); //我 需 要 治 疗 。
	AI_Output(self, other, "DIA_Constantino_Heilung_10_01"); //（ 简 略 地 ） 怎 么 了 ， 你 受 伤 了 吗 ？

	Info_ClearChoices(DIA_Constantino_Heilung);
	Info_AddChoice(DIA_Constantino_Heilung, "不 是 吧 。", DIA_Constantino_Heilung_Nein);
	Info_AddChoice(DIA_Constantino_Heilung, "是 的 。 ", DIA_Constantino_Heilung_Ja);
};

func void DIA_Constantino_Heilung_Ja()
{
	AI_Output(other, self, "DIA_Constantino_Heilung_Ja_15_00"); //是 的 。

	if (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self, other, "DIA_Constantino_Heilung_Ja_10_01"); //那 去 找 瓦 卓 斯 ， 他 会 把 你 包 扎 好 的 。 别 把 血 流 到 我 的 地 板 上 到 处 都 是 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Constantino_Heilung_Ja_10_02"); //你 只 是 受 了 点 轻 伤 ， 我 还 有 比 跟 你 谈 话 更 重 要 的 事 情 要 做 。
	};

	AI_StopProcessInfos(self);
};

func void DIA_Constantino_Heilung_Nein()
{
	AI_Output(other, self, "DIA_Constantino_Heilung_Nein_15_00"); //不 是 吧 。
	AI_Output(self, other, "DIA_Constantino_Heilung_Nein_10_01"); //那 就 走 吧 ， 否 则 这 个 伤 口 就 会 让 你 吃 更 多 苦 头 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info LestersKraeuter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Constantino_LestersKraeuter(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 5;
	condition		= DIA_Addon_Constantino_LestersKraeuter_Condition;
	information		= DIA_Addon_Constantino_LestersKraeuter_Info;
	description		= "我 能 卖 给 你 一 些 药 草 吗 ？";
};

func int DIA_Addon_Constantino_LestersKraeuter_Condition()
{
	if ((MIS_Constantino_BringHerbs == 0)
	&& (MIS_Addon_Lester_PickForConstantino != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info()
{
	AI_Output(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //我 能 卖 给 你 一 些 药 草 吗 ？
	AI_Output(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //如 果 你 有 什 么 可 以 提 供 … …
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Constantino_Trade(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 700;
	condition		= DIA_Constantino_Trade_Condition;
	information		= DIA_Constantino_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Constantino_Trade_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Constantino_Trade_15_00"); //让 我 看 看 你 的 货 物 。

	if (Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
		B_LogEntry(Topic_CityTrader, Topic_CityTrader_3);

		Constantino_Logpatch1 = TRUE;
	};
};

// *******************************************************
//						Bei Dir! // e2
// *******************************************************
instance DIA_Constantino_BeiDir(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 1;
	condition		= DIA_Constantino_BeiDir_Condition;
	information		= DIA_Constantino_BeiDir_Info;
	description		= "我 想 签 约 成 为 你 的 学 徒 。";
};

func int DIA_Constantino_BeiDir_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BeiDir_Info()
{
	AI_Output(other, self, "DIA_Constantino_BeiDir_15_00"); //我 想 签 约 成 为 你 的 学 徒 。
	AI_Output(self, other, "DIA_Constantino_BeiDir_10_01"); //跟 我 ？ 不 ！ 我 已 经 有 过 一 次 跟 学 徒 扭 打 的 不 快 的 经 历 了 。 那 对 我 已 经 非 常 足 够 了 。
	AI_Output(self, other, "DIA_Constantino_BeiDir_10_02"); //我 在 他 的 教 育 上 投 入 了 好 几 年 ， 到 后 来 那 个 可 怜 的 笨 蛋 发 了 疯 毒 死 了 自 己 。
	AI_Output(self, other, "DIA_Constantino_BeiDir_10_03"); //去 跟 其 它 某 位 大 师 签 约 ！
};

// *******************************************************
//						Bei anderem Meister // e2
// *******************************************************
instance DIA_Constantino_ZUSTIMMUNG(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_ZUSTIMMUNG_Condition;
	information		= DIA_Constantino_ZUSTIMMUNG_Info;
	permanent		= TRUE;
	description		= "我 想 签 约 做 其 它 大 师 的 学 徒 。";
};

func int DIA_Constantino_ZUSTIMMUNG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output(other, self, "DIA_Constantino_ZUSTIMMUNG_15_00"); //我 想 签 约 做 其 它 大 师 的 学 徒 。
	AI_Output(self, other, "DIA_Constantino_ZUSTIMMUNG_10_01"); //你 来 是 为 了 取 得 我 的 同 意 ？
	if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self, other, "DIA_Constantino_ZUSTIMMUNG_10_02"); //嗯 - 我 认 为 ， 你 可 以 跟 你 喜 欢 的 任 何 人 签 约 。
	}
	else
	{
		AI_Output(self, other, "DIA_Constantino_ZUSTIMMUNG_10_03"); //嗯 ， 你 不 会 得 到 它 的 ！ 我 所 听 说 的 关 于 你 的 事 ， 对 你 很 不 利 ！
		AI_Output(self, other, "DIA_Constantino_ZUSTIMMUNG_10_04"); //我 不 会 给 你 这 样 的 罪 犯 投 票 ， 并 让 你 在 我 们 城 里 得 到 一 个 尊 贵 的 地 位 。
		AI_Output(self, other, "DIA_Constantino_ZUSTIMMUNG_10_05"); //在 你 跟 城 市 守 卫 的 指 挥 官 解 决 好 了 这 件 事 情 之 前 ， 我 的 回 答 是 - 不 ！
	};

	if (Constantino_Logpatch2 == FALSE)
	{
		Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);
		B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_1);

		Constantino_Logpatch2 = TRUE;
	};
};

// *******************************************************
//						Was muß ich tun? // e3
// *******************************************************
instance DIA_Constantino_BringHerbs(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 1;
	condition		= DIA_Constantino_BringHerbs_Condition;
	information		= DIA_Constantino_BringHerbs_Info;
	description		= "我 要 想 做 你 的 学 徒 ， 需 要 怎 么 做 ？";
};

func int DIA_Constantino_BringHerbs_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Constantino_BeiDir))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BringHerbs_Info()
{
	AI_Output(other, self, "DIA_Constantino_BringHerbs_15_00"); //我 要 想 做 你 的 学 徒 ， 需 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Constantino_BringHerbs_10_01"); //（ 叹 息 ） 我 的 良 知 绝 不 能 允 许 另 一 个 业 余 爱 好 者 。
	AI_Output(self, other, "DIA_Constantino_BringHerbs_10_02"); //外 面 有 很 多 草 药 。 通 过 不 同 的 变 化 ， 它 们 能 提 供 多 样 的 效 果 。
	AI_Output(self, other, "DIA_Constantino_BringHerbs_10_03"); //你 也 许 连 它 们 的 一 半 都 不 认 识 。
	AI_Output(self, other, "DIA_Constantino_BringHerbs_10_04"); //（ 叹 息 ） 给 - 这 是 那 些 最 重 要 的 植 物 的 清 单 。
	B_GiveInvItems(self, other, ItWr_Kraeuterliste, 1);
	AI_Output(self, other, "DIA_Constantino_BringHerbs_10_05"); //每 一 种 都 给 我 带 回 来 一 点 ， 那 么 ， 我 也 许 会 重 新 考 虑 收 你 做 学 徒 。

	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ConstantinoPlants, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ConstantinoPlants, LOG_RUNNING);
	B_LogEntry(TOPIC_ConstantinoPlants, TOPIC_ConstantinoPlants_1);
};

// *******************************************************
//					Wegen der Pflanzen // e4
// *******************************************************
instance DIA_Constantino_HerbsRunning(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 1;
	condition		= DIA_Constantino_HerbsRunning_Condition;
	information		= DIA_Constantino_HerbsRunning_Info;
	permanent		= TRUE;
	description		= "关 于 植 物 … …";
};

func int DIA_Constantino_HerbsRunning_Condition()
{
	if (MIS_Constantino_BringHerbs == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Constantino_HerbsRunning_Info()
{
	AI_Output(other, self, "DIA_Constantino_HerbsRunning_15_00"); //关 于 植 物 … …
	AI_Output(self, other, "DIA_Constantino_HerbsRunning_10_01"); //如 果 你 不 能 独 自 解 决 这 个 问 题 ， 你 就 也 不 会 成 为 一 个 好 的 炼 金 术 士 ！

	Info_ClearChoices(DIA_Constantino_HerbsRunning);
	Info_AddChoice(DIA_Constantino_HerbsRunning, "我 明 白 了 。", DIA_Constantino_HerbsRunning_Running);
	if ((Npc_HasItems(other, ItPl_Mana_Herb_01) > 0)
	&& (Npc_HasItems(other, ItPl_Mana_Herb_02) > 0)
	&& (Npc_HasItems(other, ItPl_Mana_Herb_03) > 0)
	&& (Npc_HasItems(other, ItPl_Health_Herb_01) > 0)
	&& (Npc_HasItems(other, ItPl_Health_Herb_02) > 0)
	&& (Npc_HasItems(other, ItPl_Health_Herb_03) > 0)
	&& (Npc_HasItems(other, ItPl_Dex_Herb_01) > 0)
	&& (Npc_HasItems(other, ItPl_Strength_Herb_01) > 0)
	&& (Npc_HasItems(other, ItPl_Speed_Herb_01) > 0)
	&& (Npc_HasItems(other, ItPl_Temp_Herb) > 0)
	&& (Npc_HasItems(other, ItPl_Perm_Herb) > 0))
	{
		Info_AddChoice(DIA_Constantino_HerbsRunning, "我 找 到 了 所 有 你 需 要 的 草 药 ！", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output(other, self, "DIA_Constantino_HerbsRunning_Success_15_00"); //我 找 到 了 所 有 你 需 要 的 草 药 ！
	AI_Output(self, other, "DIA_Constantino_HerbsRunning_Success_10_01"); //什 么 ？ 你 在 跟 我 开 玩 笑 ， 是 吧 ！

	// 11 Gegenstände gegeben (Pflanzen) HACK für Screen ADDON
	AI_PrintScreen(PRINT_GIVE_CONSTANTINO_PLANTS, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

	Npc_RemoveInvItems(other, ItPl_Mana_Herb_01, 1);
	Npc_RemoveInvItems(other, ItPl_Mana_Herb_02, 1);
	Npc_RemoveInvItems(other, ItPl_Mana_Herb_03, 1);
	Npc_RemoveInvItems(other, ItPl_Health_Herb_01, 1);
	Npc_RemoveInvItems(other, ItPl_Health_Herb_02, 1);
	Npc_RemoveInvItems(other, ItPl_Health_Herb_03, 1);
	Npc_RemoveInvItems(other, ItPl_Dex_Herb_01, 1);
	Npc_RemoveInvItems(other, ItPl_Strength_Herb_01, 1);
	Npc_RemoveInvItems(other, ItPl_Speed_Herb_01, 1);
	Npc_RemoveInvItems(other, ItPl_Temp_Herb, 1);
	Npc_RemoveInvItems(other, ItPl_Perm_Herb, 1);

	CreateInvItems(self, ItPl_Mana_Herb_01, 1);
	CreateInvItems(self, ItPl_Mana_Herb_02, 1);
	CreateInvItems(self, ItPl_Mana_Herb_03, 1);
	CreateInvItems(self, ItPl_Health_Herb_01, 1);
	CreateInvItems(self, ItPl_Health_Herb_02, 1);
	CreateInvItems(self, ItPl_Health_Herb_03, 1);
	CreateInvItems(self, ItPl_Dex_Herb_01, 1);
	CreateInvItems(self, ItPl_Strength_Herb_01, 1);
	CreateInvItems(self, ItPl_Speed_Herb_01, 1);
	CreateInvItems(self, ItPl_Temp_Herb, 1);
	CreateInvItems(self, ItPl_Perm_Herb, 1);

	AI_Output(self, other, "DIA_Constantino_HerbsRunning_Success_10_02"); //以 亚 达 诺 斯 的 名 义 ！ 毫 无 疑 问 ， 都 在 那 里 。
	AI_Output(self, other, "DIA_Constantino_HerbsRunning_Success_10_03"); //谁 知 道 呢 ， 也 许 哪 天 你 能 成 为 一 个 相 当 好 的 炼 金 术 士 。

	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Constantino_Herbs);

	Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);
	B_LogEntry(Topic_Lehrling, Topic_Lehrling_2);

	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output(other, self, "DIA_Constantino_HerbsRunning_Running_15_00"); //我 明 白 了 。
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

// *******************************************************
//						LEHRLING // e5
// *******************************************************

var int Constantino_StartGuild;
// ----------------------------
instance DIA_Constantino_LEHRLING(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 1;
	condition		= DIA_Constantino_LEHRLING_Condition;
	information		= DIA_Constantino_LEHRLING_Info;
	permanent		= TRUE;
	description		= "我 现 在 能 成 为 你 的 学 徒 吗 ？";
};

func int DIA_Constantino_LEHRLING_Condition()
{
	if ((MIS_Constantino_BringHerbs == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;

	AI_Output(other, self, "DIA_Constantino_LEHRLING_15_00"); //我 现 在 能 成 为 你 的 学 徒 吗 ？

	if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output(self, other, "DIA_Constantino_LEHRLING_10_01"); //我 认 为 ， 是 的 。
		stimmen = stimmen + 1;

		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_02"); //对 于 哈 莱 德 来 说 ，最 重 要 的 是 ， 如 果 遭 到 兽 人 的 攻 击 ， 你 将 有 能 力 保 卫 这 个 城 市 。
			if ((MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_03"); //而 且 看 起 来 你 已 经 向 他 证 实 了 这 一 点 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_04"); //不 过 ， 他 认 为 你 是 个 胆 小 鬼 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_05"); //但 是 ， 哈 莱 德 说 他 以 前 从 来 没 见 过 你 。
		};

		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_06"); //伯 斯 波 非 常 不 愿 意 对 你 作 出 评 价 。
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_07"); //我 猜 他 更 想 要 你 做 他 自 己 的 学 徒 。
			if ((MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_08"); //但 是 ， 他 最 终 还 是 同 意 了 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_09"); //为 了 这 个 理 由 而 阻 止 某 人 的 许 可 确 实 不 是 一 件 光 彩 的 事 情 ！
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_10"); //但 是 ， 如 果 其 它 所 有 的 大 师 都 同 意 ， 你 不 需 要 他 的 投 票 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_11"); //伯 斯 波 还 不 认 识 你 。
		};

		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_12"); //托 尔 本 是 一 个 非 常 虔 诚 的 人 。
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_13"); //他 给 了 你 他 的 祝 福 。 这 是 个 好 的 预 兆 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_14"); //只 有 有 了 神 的 祝 福 ， 他 才 会 给 你 他 的 许 可 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_15"); //托 尔 本 不 知 道 你 是 谁 。
		};

		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_16"); //至 于 麦 迪 欧 - 他 到 处 唱 着 你 的 赞 歌 。
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_17"); //麦 迪 欧 说 你 还 欠 他 一 些 东 西 。 如 果 你 想 要 他 的 投 票 ， 你 最 好 处 理 好 那 件 小 事 。
			}
			else
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_18"); //麦 迪 欧 说 他 还 没 跟 你 谈 过 这 件 事 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_19"); //麦 迪 欧 说 他 以 前 从 没 见 到 你 去 过 他 的 商 店 。
		};

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_20"); //这 意 味 着 你 已 经 得 到 了 所 有 的 大 师 的 赞 同 ！
			}
			else // == 4
			{
				AI_Output(self, other, "DIA_Constantino_LEHRLING_10_21"); //你 已 经 得 到 了 四 位 大 师 的 赞 同 。 那 将 足 够 让 你 被 接 受 成 为 一 名 学 徒 了 。
			};

			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_22"); //这 意 味 着 你 已 经 得 到 了 所 有 的 大 师 的 赞 同 ？

			Info_ClearChoices(DIA_Constantino_LEHRLING);
			Info_AddChoice(DIA_Constantino_LEHRLING, "我 需 要 把 问 题 留 到 第 二 天 解 决 。", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice(DIA_Constantino_LEHRLING, "是 的 ， 大 师 。", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_23"); //你 需 要 得 到 至 少 四 位 大 师 的 许 可 才 能 在 城 里 的 贫 民 区 开 始 你 的 学 徒 生 涯 。
			AI_Output(self, other, "DIA_Constantino_LEHRLING_10_24"); //这 意 味 着 你 应 该 去 跟 所 有 还 不 完 全 赞 成 你 的 大 师 们 谈 谈 。
		};
	}
	else // CITY CRIME > 0
	{
		AI_Output(self, other, "DIA_Constantino_LEHRLING_10_25"); //（ 愤 怒 的 ） 不 行 ！ 我 听 到 传 言 说 你 在 克 霍 里 尼 斯 被 指 控 犯 了 罪 ！
		AI_Output(self, other, "DIA_Constantino_LEHRLING_10_26"); //在 你 跟 城 市 守 卫 的 指 挥 官 解 决 好 了 这 件 事 情 之 前 ， 我 不 会 收 你 做 学 徒 。
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output(other, self, "DIA_Constantino_LEHRLING_Yes_15_00"); //是 的 ， 大 师 。
	AI_Output(self, other, "DIA_Constantino_LEHRLING_Yes_10_01"); //（ 叹 息 ） 那 么 ， 好 吧 ！ 我 希 望 我 不 会 因 为 这 个 决 定 而 后 悔 。
	AI_Output(self, other, "DIA_Constantino_LEHRLING_Yes_10_02"); //从 现 在 起 ， 你 可 以 当 我 的 学 徒 了。
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine(Lothar, "START");

	Constantino_StartGuild = other.guild;

	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist", GIL_NONE);

	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(Topic_Bonus, Topic_Bonus_1);

	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output(other, self, "DIA_Constantino_LEHRLING_Later_15_00"); //我 需 要 把 问 题 留 到 第 二 天 解 决 。
	AI_Output(self, other, "DIA_Constantino_LEHRLING_Later_10_01"); //好 的 ！ 如 果 你 不 能 真 的 把 心 思 放 在 这 上 面 ， 你 可 以 选 择 其 它 的 职 业 ！

	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

// *******************************************************
//				 IMPORTANT als Lehrling
// *******************************************************
// ----------------------------------
var int Constantino_MILKommentar;
var int Constantino_INNOSKommentar;
// ----------------------------------
instance DIA_Constantino_AlsLehrling(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 1;
	condition		= DIA_Constantino_AlsLehrling_Condition;
	information		= DIA_Constantino_AlsLehrling_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Constantino_AlsLehrling_Condition()
{
	if ((Player_IsApprentice == APP_Constantino)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Constantino_AlsLehrling_Info()
{
	if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_00"); //（ 愤 怒 的 ） 只 要 你 在 城 里 还 被 指 控 有 一 项 犯 罪 ， 我 就 拒 绝 进 一 步 指 导 你 。
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_01"); //去 找 安 德 烈 勋 爵 ， 使 一 切 恢 复 正 常 。
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}

	else if ((other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_02"); //那 么 说 ， 你 加 入 了 民 兵 ？ 我 已 经 听 说 了 这 件 事 。
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_03"); //轻 松 地 当 上 学 徒 ， 然 后 就 加 入 了 民 兵 ？ 我 想 不 到 对 你 来 说 会 这 么 容 易 。
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_04"); //我 期 待 着 你 遵 守 我 们 的 约 定 ， 给 我 拿 来 植 物 和 蘑 菇 做 主 药 。
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_05"); //如 果 让 你 同 时 做 两 份 工 作 任 务 太 多 的 话 ， 你 就 必 须 少 睡 一 点 了 ！
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}

	else if (((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_06"); //我 知 道 你 已 经 为 英 诺 斯 服 务 了 。 我 想 那 意 味 着 ， 从 现 在 开 始 ， 你 不 能 花 大 量 的 时 间 来 为 一 个 老 头 子 采 集 药 草 了 。
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_07"); //尽 管 如 此 ， 我 把 支 持 你 走 上 自 己 的 道 路 当 成 是 一 种 荣 耀 。
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_08"); //除 了 你 的 新 的 职 责 外 ， 你 还 应 该 抽 时 间 练 习 炼 金 术 ， 这 里 永 远 会 热 烈 地 欢 迎 你 。
		Constantino_INNOSKommentar = TRUE;
	}

	else if ((Constantino_Lehrling_Day <= (Wld_GetDay() - 4))
	&& (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_09"); //你 一 直 在 忙 些 什 么 ？
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_10"); //我 对 我 的 学 徒 期 待 很 多 ， 而 不 是 在 很 长 时 间 里 偶 尔 来 我 这 里 一 次 ！
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_11"); //你 给 我 带 了 些 蘑 菇 来 吗 ？
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self, other, "DIA_Constantino_AlsLehrling_10_12"); //你 又 来 了 … …
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};

// *******************************************************
//					Aufgaben als Lehrling
// *******************************************************
instance DIA_Constantino_Aufgaben(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_Aufgaben_Condition;
	information		= DIA_Constantino_Aufgaben_Info;
	description		= "我 的 任 务 是 什 么 ？";
};

func int DIA_Constantino_Aufgaben_Condition()
{
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Aufgaben_Info()
{
	AI_Output(other, self, "DIA_Constantino_Aufgaben_15_00"); //我 的 任 务 是 什 么 ？
	AI_Output(self, other, "DIA_Constantino_Aufgaben_10_01"); //我 知 道 我 不 能 期 望 一 个 年 青 人 整 天 跟 我 呆 在 屋 子 里 。
	AI_Output(self, other, "DIA_Constantino_Aufgaben_10_02"); //有 时 ， 你 得 带 一 些 我 需 要 的 植 物 给 我 。 作 为 回 报 ， 我 会 指 导 你 炼 金 术 的 要 领 。
	AI_Output(self, other, "DIA_Constantino_Aufgaben_10_03"); //你 可 以 在 我 这 里 买 一 些 瓶 子 。 不 过 ， 大 部 分 的 配 方 你 得 自 己 去 找 了 。
	AI_Output(self, other, "DIA_Constantino_Aufgaben_10_04"); //还 有 ， 我 期 待 你 的 言 行 得 体 ， 配 得 上 这 个 城 里 的 市 民 身 份 。
};

// *******************************************************
//					Welche Pflanzen
// *******************************************************
instance DIA_Constantino_Mushrooms(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_Mushrooms_Condition;
	information		= DIA_Constantino_Mushrooms_Info;
	description		= "我 要 找 到 什 么 样 草 药 ？ ";
};

func int DIA_Constantino_Mushrooms_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Mushrooms_Info()
{
	AI_Output(other, self, "DIA_Constantino_Mushrooms_15_00"); //我 要 找 到 什 么 样 草 药 ？
	AI_Output(self, other, "DIA_Constantino_Mushrooms_10_01"); //我 会 向 你 买 下 你 给 我 带 来 的 任 何 东 西 - 而 且 我 会 按 照 平 常 的 价 格 付 款 。
	AI_Output(self, other, "DIA_Constantino_Mushrooms_10_02"); //不 过 ， 要 是 蘑 菇 ， 我 就 会 给 你 一 个 特 别 的 价 格 。

	MIS_Constantino_Mushrooms = LOG_RUNNING;

	Log_CreateTopic(Topic_Bonus, LOG_NOTE);
	B_LogEntry(Topic_Bonus, Topic_Bonus_2);
};

// *******************************************************
//					Mushrooms Running
// *******************************************************
instance DIA_Constantino_MushroomsRunning(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_MushroomsRunning_Condition;
	information		= DIA_Constantino_MushroomsRunning_Info;
	permanent		= TRUE;
	description		= "你 要 的 蘑 菇 … …";
};

func int DIA_Constantino_MushroomsRunning_Condition()
{
	if (MIS_Constantino_Mushrooms == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output(other, self, "DIA_Constantino_MushroomsRunning_15_00"); //你 要 的 蘑 菇 … …

	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning, "我 要 给 你 带 来 一 些 … …", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, "为 什 么 那 些 东 西 这 么 重 要 ？", DIA_Constantino_MushroomsRunning_Why);
	};

	if ((Npc_HasItems(other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems(other, ItPl_Mushroom_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning, "我 有 一 些 … …", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;

	if (Npc_HasItems(other, ItPl_Mushroom_01) > 0)
	{
		AI_Output(other, self, "DIA_Constantino_MushroomsRunning_Sell_15_00"); //我 这 里 有 几 个 黑 暗 蘑 菇 … …
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Sell_10_01"); //啊 ！ 它 们 都 是 最 好 的 ！ 干 得 漂 亮 ！ 这 是 你 的 钱 ！
		Dunkelpilz_dabei = TRUE;

		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other, ItPl_Mushroom_01);

		B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItPl_Mushroom_01) * Value_Mushroom_01));
		B_GiveInvItems(other, self, ItPl_Mushroom_01, Npc_HasItems(other, ItPl_Mushroom_01));
	};

	if (Npc_HasItems(other, ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output(other, self, "DIA_Constantino_MushroomsRunning_Sell_15_02"); //还 有 ， 这 是 其 它 的 一 些 … …
		}
		else
		{
			AI_Output(other, self, "DIA_Constantino_MushroomsRunning_Sell_15_03"); //我 弄 到 了 几 个 蘑 菇 ！
		};

		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Sell_10_04"); //这 些 没 有 黑 暗 蘑 菇 那 么 好 ， 但 是 ， 我 还 是 会 收 下 它 们 。

		B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItPl_Mushroom_02) * Value_Mushroom_02));
		B_GiveInvItems(other, self, ItPl_Mushroom_02, Npc_HasItems(other, ItPl_Mushroom_02));
	};

	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output(other, self, "DIA_Constantino_MushroomsRunning_Why_15_00"); //为 什 么 那 些 东 西 这 么 重 要 ？
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Why_10_01"); //尽 管 你 是 我 的 学 徒 ， 我 也 不 会 告 诉 你 所 有 的 事 情 。
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Why_10_02"); //好 吧 - 那 么 ， 我 会 告 诉 你 。 但 是 ， 你 不 能 告 诉 任 何 人 。
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Why_10_03"); //黑 暗 蘑 菇 充 满 了 魔 法 能 量 。 每 当 你 吃 掉 一 个 ， 你 的 身 体 里 面 的 能 量 就 会 增 加 一 点 点 。
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Why_10_04"); //当 你 吃 掉 了 足 够 数 量 这 样 的 蘑 菇 后 ， 你 的 魔 法 能 量 就 会 增 加 … …
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Why_10_05"); //如 果 我 比 较 早 就 告 诉 了 你 这 件 事 ， 你 就 自 己 把 这 些 蘑 菇 都 吃 光 了 ， 不 是 吗 ？
		AI_Output(other, self, "DIA_Constantino_MushroomsRunning_Why_15_06"); //（ 叹 息 ） 哦 ， 伙 计 ！

		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Why_10_07"); //你 已 经 问 过 我 这 个 了 。 （ 顽 皮 地 ） 谁 知 道 呢 ， 也 许 哪 天 我 会 真 的 告 诉 你 … …
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output(other, self, "DIA_Constantino_MushroomsRunning_Later_15_00"); //我 要 给 你 带 来 一 些 … …
	AI_Output(self, other, "DIA_Constantino_MushroomsRunning_Later_10_01"); //好 极 了 ！ 你 能 找 到 多 少 就 给 我 多 少 … …

	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

// *******************************************************
//					Unterrichte mich
// *******************************************************
instance DIA_Constantino_Alchemy(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_Alchemy_Condition;
	information		= DIA_Constantino_Alchemy_Info;
	description		= "教 我 炼 金 术 的 技 能 ！";
};

func int DIA_Constantino_Alchemy_Condition()
{
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Alchemy_Info()
{
	AI_Output(other, self, "DIA_Constantino_Alchemy_15_00"); //教 我 炼 金 术 的 技 能 ！
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_01"); //好 。 我 先 说 说 基 本 原 理 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_02"); //每 一 个 药 剂 都 是 植 物 做 成 的 - 它 们 拥 有 各 种 能 量 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_03"); //它 们 把 所 有 的 能 量 都 用 来 生 长 - 改 变 这 种 能 量 就 是 炼 金 术 的 艺 术 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_04"); //要 准 备 在 炼 金 术 士 工 作 台 上 酿 造 一 瓶 药 剂 的 话 ， 你 需 要 一 个 实 验 室 烧 瓶 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_05"); //你 必 须 知 道 正 确 的 配 方 并 有 合 适 的 配 料 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_06"); //我 可 以 教 你 几 个 配 方 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_07"); //用 来 恢 复 损 失 的 力 量 的 药 剂 ， 甚 至 还 有 永 久 影 响 力 量 的 药 剂 。
	AI_Output(self, other, "DIA_Constantino_Alchemy_10_08"); //你 不 能 一 次 学 会 所 有 的 知 识 。

	Constantino_TeachAlchemy = TRUE;

	Log_CreateTopic(TOPIC_CityTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, TOPIC_CityTeacher_1);
};

// *******************************************************
//					für Nicht-Lehrlinge
// *******************************************************
instance DIA_Constantino_NewRecipes(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_NewRecipes_Condition;
	information		= DIA_Constantino_NewRecipes_Info;
	description		= "我 在 寻 找 新 的 药 剂 配 方 。";
};

func int DIA_Constantino_NewRecipes_Condition()
{
	if ((Player_IsApprentice != APP_Constantino)
	&& (Player_IsApprentice > APP_NONE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NewRecipes_Info()
{
	AI_Output(other, self, "DIA_Constantino_NewRecipes_15_00"); //我 在 寻 找 新 的 药 剂 配 方 。
	AI_Output(self, other, "DIA_Constantino_NewRecipes_10_01"); //你 以 前 有 过 任 何 从 事 炼 金 术 的 经 验 吗 。
	AI_Output(other, self, "DIA_Constantino_NewRecipes_15_02"); //是 的 ， 我 有 过 。
	AI_Output(self, other, "DIA_Constantino_NewRecipes_10_03"); //你 仍 然 还 活 着 … … 那 说 明 你 的 技 术 还 不 太 坏 。
	AI_Output(self, other, "DIA_Constantino_NewRecipes_10_04"); //我 想 我 可 以 告 诉 你 几 个 配 方 。 当 然 ， 那 取 决 于 你 想 知 道 些 什 么 。

	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, TOPIC_CityTeacher_2);
};

// *******************************************************
//							TEACH
// *******************************************************
instance DIA_Constantino_TEACH(C_INFO)
{
	npc				= VLK_417_Constantino;
	nr				= 2;
	condition		= DIA_Constantino_TEACH_Condition;
	information		= DIA_Constantino_TEACH_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 配 方 ？";
};

func int DIA_Constantino_TEACH_Condition()
{
	if (Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_TEACH_Info()
{
	AI_Output(other, self, "DIA_Constantino_TEACH_15_00"); //你 能 教 我 什 么 配 方 ？

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_10_01"); //对 不 起 。 我 没 有 什 么 别 的 可 以 教 你 。
	}
	else
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_10_02"); //我 知 道 几 个 - 你 自 己 选 吧 。

		Info_ClearChoices(DIA_Constantino_Teach);
		Info_AddChoice(DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_HealthPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_HealthPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_HealthPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Constantino_TEACH_Mana01);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_ManaPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Constantino_TEACH_Mana02);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH, B_BuildLearnString(NAME_Str_Permanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_Health01()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_Health01_10_00"); //治 疗 精 华 的 配 方 是 治 疗 植 物 和 洼 地 节 草 。
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_Health02()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Health_02))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_Health02_10_00"); //要 做 治 疗 萃 取 物 ， 需 要 治 疗 药 草 和 洼 地 节 草 。
		AI_Output(self, other, "DIA_Constantino_TEACH_Health02_10_01"); //一 定 要 十 分 小 心 地 加 热 那 些 萃 取 物 。
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_Health03()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Health_03))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_Health03_10_00"); //制 作 治 疗 练 金 药 需 要 丰 富 的 经 验 。
		AI_Output(self, other, "DIA_Constantino_TEACH_Health03_10_01"); //你 需 要 治 疗 根 和 洼 地 节 草 。 这 次 加 热 它 时 要 十 分 小 心 。
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_PermHealth()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Health))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_PermHealth_10_00"); //生 命 炼 金 药 ！ 珍 贵 的 酿 造 物 。 与 它 的 效 果 不 同 的 是 - 这 种 药 剂 实 际 上 并 非 那 么 难 制 造 出 来 。
		AI_Output(self, other, "DIA_Constantino_TEACH_PermHealth_10_01"); //但 是 它 的 原 料 十 分 罕 有 。 需 要 治 疗 根 和 国 王 酢 浆 草 。
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_Mana01()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_Mana01_10_00"); //魔 法 精 华 是 最 简 单 的 魔 法 药 剂 。
		AI_Output(self, other, "DIA_Constantino_TEACH_Mana01_10_01"); //把 火 荨 麻 和 洼 地 节 草 一 起 慢 慢 加 热 。
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_Mana02()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_02))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_Mana02_10_00"); //因 为 你 已 经 可 以 做 出 魔 法 精 华 ， 只 要 一 点 点 努 力 你 就 同 样 有 能 力 做 出 一 瓶 萃 取 物 。
		AI_Output(self, other, "DIA_Constantino_TEACH_Mana02_10_01"); //你 需 要 在 熬 制 酿 造 物 的 时 候 保 持 正 确 的 感 觉 。 用 柳 兰 和 洼 地 节 草 来 做 这 种 药 剂 。
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};

func void DIA_Constantino_TEACH_PermSTR()
{
	if (B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_STR))
	{
		AI_Output(self, other, "DIA_Constantino_TEACH_PermSTR_10_00"); //力 量 炼 金 药 ！ 卓 越 的 药 剂 。 需 要 珍 稀 的 龙 根 和 国 王 酢 浆 草 。
		AI_Output(self, other, "DIA_Constantino_TEACH_PermSTR_10_01"); //当 烧 开 酿 造 物 时 ， 不 要 让 泡 泡 变 得 太 大 ， 否 则 你 会 碰 到 一 个 棘 手 的 意 外 ！
	};

	Info_ClearChoices(DIA_Constantino_Teach);
};
