// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Logan_EXIT(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 999;
	condition		= DIA_Addon_Logan_EXIT_Condition;
	information		= DIA_Addon_Logan_EXIT_Info;
	permanent		= TRUE;
	description		= "我 马 上 回 来 … … ( 结 束 )";
};

func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	AI_Output(other, self, "DIA_Addon_Logan_EXIT_15_00"); //我 马 上 回 来 … …

	if (((!MIS_HlpLogan == LOG_RUNNING)
	|| (!MIS_HlpLogan == LOG_SUCCESS))
	&& (Logan_Inside == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Logan_EXIT_10_01"); //（ 咆 哮 ） 是 的 ， 你 就 逃 走 吧 。 我 会 留 在 这 里 ， 挡 住 任 何 企 图 靠 近 的 东 西 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Logan_PICKPOCKET(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 900;
	condition		= DIA_Addon_Logan_PICKPOCKET_Condition;
	information		= DIA_Addon_Logan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Logan_PICKPOCKET_Condition()
{
	C_Beklauen(59, 50);
};

func void DIA_Addon_Logan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET, DIALOG_BACK, DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

// ----------------------------------------------------------------------
//	Info Mine
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1072_Logan_Mine(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 2;
	condition		= DIA_Addon_Logan_Mine_Condition;
	information		= DIA_Addon_Logan_Mine_Info;
	description		= DIALOG_ADDON_MINE_DESCRIPTION;
};

func int DIA_Addon_Logan_Mine_Condition()
{
	if ((MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems(other, ItmI_Addon_Stone_01) >= 1)
	&& (Npc_GetDistToWP(self, "BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other, self, ItmI_Addon_Stone_01, 1);
	AI_Output(self, other, "DIA_Addon_BDT_1072_Logan_Mine_10_00"); //那 么 说 你 成 功 了 ， 嗯 ？ 好 吧 ， 你 没 听 说 我 被 绞 死 真 是 不 错 。

	Player_SentBuddler = (Player_SentBuddler + 1);
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "MINE");
};

// ---------------------------------------------------------------------
//	Info INSIDE
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_How2(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 2;
	condition		= DIA_Addon_Logan_How2_Condition;
	information		= DIA_Addon_Logan_How2_Info;
	description		= "你 近 况 如 何 ？";
};

func int DIA_Addon_Logan_How2_Condition()
{
	if ((Logan_Inside == TRUE)
	&& (Npc_GetDistToWP(self, "BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other, self, "DIA_Addon_Logan_How2_15_00"); //你 近 况 如 何 ？
	AI_Output(self, other, "DIA_Addon_Logan_How2_10_01"); //嗯 ， 至 少 我 现 在 进 来 了 。 露 西 亚 会 酿 造 一 些 相 当 出 色 的 酒 。
	AI_Output(self, other, "DIA_Addon_Logan_How2_10_02"); //但 是 伊 斯 特 班 不 让 我 进 入 矿 井 。 至 少 现 在 还 没 有 。 他 给 了 我 另 一 个 工 作 。
	AI_Output(other, self, "DIA_Addon_Logan_How2_15_03"); //还 有 吗 ？ 他 想 从 你 那 里 得 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Logan_How2_10_04"); //有 人 想 要 刺 杀 伊 斯 特 班 。 他 想 要 知 道 谁 是 幕 后 指 使 。
	AI_Output(self, other, "DIA_Addon_Logan_How2_10_05"); //（ 沉 着 的 ） 伊 斯 特 班 认 为 斯 耐 夫 可 能 涉 及 其 中 。 我 要 多 留 神 他 … …
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_Attentat(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 9;
	condition		= DIA_Addon_Logan_Attentat_Condition;
	information		= DIA_Addon_Logan_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Logan_Attentat_Condition()
{
	if ((MIS_Judas == LOG_RUNNING)
	&& (Logan_Inside == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Logan_Attentat_10_00"); //你 想 要 找 到 那 个 幕 后 人 ， 嗯 ？
	AI_Output(self, other, "DIA_Addon_Logan_Attentat_10_01"); //但 是 我 不 知 道 任 何 关 于 它 的 事 情 。 我 怎 么 可 能 知 道 ？ 当 时 我 还 在 沼 泽 … …
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_HI(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 2;
	condition		= DIA_Addon_Logan_HI_Condition;
	information		= DIA_Addon_Logan_HI_Info;
	important		= TRUE;
};

func int DIA_Addon_Logan_HI_Condition()
{
	if ((Logan_Inside == FALSE)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self, other, "DIA_Addon_Logan_HI_10_00"); //看 ， 一 张 新 面 孔 。
	AI_Output(self, other, "DIA_Addon_Logan_HI_10_01"); //你 只 是 四 处 闲 逛 吗 ， 还 是 说 你 是 来 帮 助 我 的 ？

	if (Npc_KnowsInfo(other, DIA_Addon_Franco_HI))
	{
		AI_Output(other, self, "DIA_Addon_Logan_HI_15_02"); //佛 朗 哥 派 我 来 的 。 他 说 你 可 能 需 要 一 些 帮 助 。 所 以 ， 发 生 了 什 么 事 ？
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Logan_HI_15_03"); //那 取 决 于 - 你 需 要 怎 样 的 帮 助 ？
	};

	AI_Output(self, other, "DIA_Addon_Logan_HI_10_04"); //沼 泽 鲨 离 我 太 近 了 - 早 该 干 掉 它 们 一 些 。

	Log_CreateTopic(Topic_Addon_Logan, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Logan, Topic_Addon_Logan_1);
};

// ---------------------------------------------------------------------
//	Info Why
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_Why(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 2;
	condition		= DIA_Addon_Logan_Why_Condition;
	information		= DIA_Addon_Logan_Why_Info;
	description		= "我 帮 忙 能 获 得 什 么 ？";
};

func int DIA_Addon_Logan_Why_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Logan_HI)
	&& (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other, self, "DIA_Addon_Logan_Why_15_00"); //我 帮 忙 能 获 得 什 么 ？
	AI_Output(self, other, "DIA_Addon_Logan_Why_10_01"); //（ 咆 哮 ） 如 果 你 不 干 的 话 ， 佛 朗 哥 会 你 在 这 里 腐 烂 掉 。
	AI_Output(self, other, "DIA_Addon_Logan_Why_10_02"); //如 果 你 想 进 入 营 地 ， 你 就 必 须 要 帮 忙 。 只 凭 一 句 话 ， 你 是 无 法 再 接 近 这 里 的 。
	AI_Output(self, other, "DIA_Addon_Logan_Why_10_03"); //此 外 ， 我 能 教 你 如 何 解 剖 那 些 野 兽 。
	AI_Output(self, other, "DIA_Addon_Logan_Why_10_04"); //但 是 别 指 望 佛 朗 哥 会 直 接 把 你 送 进 营 地 ， 因 为 我 们 这 里 有 一 些 和 沼 泽 鲨 之 间 的 娱 乐 活 动 。
	AI_Output(self, other, "DIA_Addon_Logan_Why_10_05"); //这 里 有 很 多 人 已 经 等 了 很 久 还 没 能 进 去 。
	AI_Output(self, other, "DIA_Addon_Logan_Why_10_06"); //那 么 下 一 个 进 去 的 人 就 是 我 … … （ 咆 哮 ） … … 最 好 是 … …

	Log_CreateTopic(Topic_Addon_BDT_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, Topic_Addon_BDT_Teacher_3);
};

// ---------------------------------------------------------------------
//	Info Lager
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_Lager(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 3;
	condition		= DIA_Addon_Logan_Lager_Condition;
	information		= DIA_Addon_Logan_Lager_Info;
	description		= "那 么 营 地 里 有 什 么 ？";
};

func int DIA_Addon_Logan_Lager_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Logan_Why)
	&& (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_Logan_Lager_15_00"); //那 么 营 地 里 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Logan_Lager_10_01"); //（ 咆 哮 ） 问 题 应 该 是 营 地 里 ‘ 没 有 ’ 什 么 。 没 有 沼 泽 鲨 ， 没 有 沼 泽 泥 洞 … … 那 里 根 本 没 有 沼 泽 。
	AI_Output(self, other, "DIA_Addon_Logan_Lager_10_02"); //相 反 的 ， 他 们 有 酒 和 黄 金 。 据 我 所 知 ， 那 里 甚 至 有 一 个 女 人 。 明 白 吗 ？
};

// ---------------------------------------------------------------------
//	Info von Franco geschickt (MISsion)
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_MIS(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 99;
	condition		= DIA_Addon_Logan_MIS_Condition;
	information		= DIA_Addon_Logan_MIS_Info;
	description		= "我 们 攻 击 沼 泽 鲨 吧 。";
};

func int DIA_Addon_Logan_MIS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other, self, "DIA_Addon_Logan_MIS_15_00"); //我 们 攻 击 沼 泽 鲨 吧 。
	AI_Output(self, other, "DIA_Addon_Logan_MIS_10_01"); //（ 咆 哮 ） 你 已 经 说 清 了 怎 么 先 到 达 这 里 。 我 很 高 兴 。 嘘 … … 你 听 到 了 吗 ？ 是 的 ， 我 听 到 了 它 们 。
	AI_Output(other, self, "DIA_Addon_Logan_MIS_15_02"); //我 明 白 - 我 们 现 在 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Logan_MIS_10_03"); //它 们 来 了 。 它 们 渴 望 吃 到 人 肉 。 嗯 ， 我 们 看 看 这 在 里 谁 会 被 吃 掉 … … 我 们 上 。

	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "JAGD");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_RUNNING;

	Wld_InsertNpc(MIS_Addon_Swampshark_01, "ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02, "ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03, "ADW_BANDIT_VP3_06");
};

// ---------------------------------------------------------------------
//	Info Sumpfhaie TOT
// ---------------------------------------------------------------------
instance DIA_Addon_Logan_tot(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 2;
	condition		= DIA_Addon_Logan_tot_Condition;
	information		= DIA_Addon_Logan_tot_Info;
	important		= TRUE;
};

func int DIA_Addon_Logan_tot_Condition()
{
	if (Npc_IsDead(MIS_Addon_Swampshark_01)
	&& Npc_IsDead(MIS_Addon_Swampshark_02)
	&& Npc_IsDead(MIS_Addon_Swampshark_03)
	&& Npc_KnowsInfo(other, DIA_Addon_Logan_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self, other, "DIA_Addon_Logan_tot_10_00"); //唯 一 善 良 的 沼 泽 鲨 就 是 死 沼 泽 鲨 。 那 将 会 警 告 它 们 的 兄 弟 ！
	AI_Output(other, self, "DIA_Addon_Logan_tot_15_01"); //好 吧 ， 还 有 什 么 其 它 事 情 要 做 吗 ？ 没 有 的 话 ， 我 要 离 开 了 … …
	AI_Output(self, other, "DIA_Addon_Logan_tot_10_02"); //就 那 样 吧 。 如 果 你 想 学 点 其 它 的 东 西 - 你 知 道 去 哪 里 找 我 。

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog();
	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_12);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Logan_Lern(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 100;
	condition		= DIA_Addon_Logan_Lern_Condition;
	information		= DIA_Addon_Logan_Lern_Info;
	description		= "告 诉 我 怎 么 处 理 动 物 … …";
};

func int DIA_Addon_Logan_Lern_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other, self, "DIA_Addon_Logan_Lern_15_00"); //告 诉 我 怎 么 处 理 动 物 … …
	AI_Output(self, other, "DIA_Addon_Logan_Lern_10_01"); //如 果 你 想 了 解 关 于 血 蝇 的 事 ， 去 找 艾 德 高 。 他 知 道 它 们 的 一 切 。
	AI_Output(self, other, "DIA_Addon_Logan_Lern_10_02"); //如 果 你 想 要 了 解 如 何 解 剖 沼 泽 鲨 或 者 蜥 蜴 的 话 ， 一 定 要 知 道 怎 么 剥 皮 和 拔 牙 。 我 能 教 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info Allgemeine Talente
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Logan_Allg(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 3;
	condition		= DIA_Addon_Logan_Allg_Condition;
	information		= DIA_Addon_Logan_Allg_Info;
	permanent		= TRUE;
	description		= "我 想 要 学 习 … …";
};

func int DIA_Addon_Logan_Allg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Logan_Lern)
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
	Info_AddChoice(DIA_Addon_Logan_Allg, DIALOG_BACK, DIA_Addon_Logan_Allg_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg, B_BuildLearnString(NAME_LEARN_TEETH, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), DIA_Addon_Logan_Allg_Teeth);
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg, B_BuildLearnString(NAME_LEARN_CLAWS, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), DIA_Addon_Logan_Allg_Claws);
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg, B_BuildLearnString(NAME_LEARN_FUR, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), DIA_Addon_Logan_Allg_Fur);
	};
};

// ------------------------------------------------------------------------------------------------
//			Allgemeine Talente
// ------------------------------------------------------------------------------------------------
func void DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Fur);
};

// ----------------------------------------------------------------------
var int Logan_Lohn;
// ----------------------------------------------------------------------
//	Info Hacker
// ----------------------------------------------------------------------
instance DIA_Addon_Logan_Hacker(C_INFO)
{
	npc				= BDT_1072_Addon_Logan;
	nr				= 9;
	condition		= DIA_Addon_Logan_Hacker_Condition;
	information		= DIA_Addon_Logan_Hacker_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_Logan_Hacker_Condition()
{
	if (Npc_GetDistToWP(self, "ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10004_Logan_Hacker_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_01"); //嘿 ， 谢 谢 你 ， 我 成 功 了 。 我 进 矿 井 了 ！
	AI_Output(self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_02"); //也 许 我 现 在 还 不 了 解 挖 掘 金 矿 的 事 ， 但 很 快 就 会 的 。

	if (Logan_Lohn == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_03"); //我 已 经 学 到 了 最 重 要 的 事 。 腿 要 牢 牢 地 站 在 地 上 ， 攻 击 永 远 都 要 稳 固 ！
		B_Upgrade_Hero_HackChance(10);
		Logan_Lohn = TRUE;
	};
};
