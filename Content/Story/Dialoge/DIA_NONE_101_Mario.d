//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_None_101_Mario_EXIT(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 999;
	condition		= DIA_None_101_Mario_EXIT_Condition;
	information		= DIA_None_101_Mario_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Was machst du hier?
//*********************************************************************
instance DIA_None_101_Mario_Job(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 4;
	condition		= DIA_None_101_Mario_Job_Condition;
	information		= DIA_None_101_Mario_Job_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_None_101_Mario_Job_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == FALSE)
	&& (Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_None_101_Mario_Job_07_01"); //我 希 望 能 来 一 条 可 以 租 用 的 船 ， 而 且 时 间 不 要 太 久 。
	AI_Output(self, other, "DIA_None_101_Mario_Job_07_02"); //像 这 样 闲 逛 真 的 让 我 发 疯 。
};

//*********************************************************************
//	Du suchst doch Leute?
//*********************************************************************
instance DIA_None_101_Mario_YouNeedMe(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 4;
	condition		= DIA_None_101_Mario_YouNeedMe_Condition;
	information		= DIA_None_101_Mario_YouNeedMe_Info;
	important		= TRUE;
};

func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self, other, "DIA_None_101_Mario_YouNeedMe_07_00"); //我 听 说 你 的 船 正 在 招 人 ？
	AI_Output(other, self, "DIA_None_101_Mario_YouNeedMe_15_01"); //然后呢?
	AI_Output(self, other, "DIA_None_101_Mario_YouNeedMe_07_02"); //我 加 入 ！

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_6);
};

//*********************************************************************
//	Warum sollte ich dich mitnehmen?
//*********************************************************************
instance DIA_None_101_Mario_WhyNeedYou(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 5;
	condition		= DIA_None_101_Mario_WhyNeedYou_Condition;
	information		= DIA_None_101_Mario_WhyNeedYou_Info;
	description		= "我 为 什 么 要 带 上 你 ？";
};

func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_WhyNeedYou_15_00"); //我 为 什 么 要 带 上 你 ？
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_01"); //非 常 简 单 ， 因 为 你 需 要 我 。
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_02"); //我 是 … … 我 是 皇 家 海 军 的 中 尉 。
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_03"); //我 曾 经 作 为 一 名 水 手 为 国 王 罗 巴 尔 和 米 尔 塔 纳 的 骄 傲 服 务 。
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_04"); //在 东 部 群 岛 战 役 中 ， 我 独 力 把 两 对 兽 人 打 回 了 贝 利 尔 的 国 度 。
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_05"); //不 幸 的 是 ， 在 我 们 的 旗 舰 沉 没 后 ， 我 们 剩 下 的 人 太 少 ， 所 以 我 们 被 迫 撤 退 。
};

//*********************************************************************
//	Wieso bist du dann hier?
//*********************************************************************
instance DIA_None_101_Mario_WhyHere(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 7;
	condition		= DIA_None_101_Mario_WhyHere_Condition;
	information		= DIA_None_101_Mario_WhyHere_Info;
	description		= "那 你 为 什 么 在 这 里 ？ ";
};

func int DIA_None_101_Mario_WhyHere_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_WhyHere_15_00"); //那 你 为 什 么 在 这 里 ？
	AI_Output(self, other, "DIA_None_101_Mario_WhyHere_07_01"); //舰 队 的 航 线 已 经 定 好 ， 但 是 工 资 金 库 是 空 的 。
	AI_Output(self, other, "DIA_None_101_Mario_WhyHere_07_02"); //在 我 退 伍 之 后 ， 我 在 这 个 垃 圾 场 里 进 退 两 难 ， 而 且 正 在 找 新 的 职 位 。
};

//*********************************************************************
//	Was kannst du?
//*********************************************************************
instance DIA_None_101_Mario_Abilities(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 8;
	condition		= DIA_None_101_Mario_Abilities_Condition;
	information		= DIA_None_101_Mario_Abilities_Info;
	description		= "你 能 做 什 么 ？";
};

func int DIA_None_101_Mario_Abilities_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_Abilities_15_00"); //你 能 做 什 么 ？
	AI_Output(self, other, "DIA_None_101_Mario_Abilities_07_01"); //我 受 过 攻 击 敌 船 和 近 战 的 训 练 ， 同 时 我 的 炮 术 还 可 以 。
	AI_Output(self, other, "DIA_None_101_Mario_Abilities_07_02"); //我 肯 定 在 旅 途 中 能 教 你 一 两 手 。

	B_LogEntry(TOPIC_Crew, TOPIC_Crew_7);
};

//*********************************************************************
//	Was verlangst du?
//*********************************************************************
instance DIA_None_101_Mario_YourPrice(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 9;
	condition		= DIA_None_101_Mario_YourPrice_Condition;
	information		= DIA_None_101_Mario_YourPrice_Info;
	description		= "你 要 问 什 么 ？";
};

func int DIA_None_101_Mario_YourPrice_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_YourPrice_15_00"); //你 要 问 什 么 ？
	AI_Output(self, other, "DIA_None_101_Mario_YourPrice_07_01"); //我 能 问 什 么 ？ 离 开 这 里 我 很 高 兴 。
	AI_Output(self, other, "DIA_None_101_Mario_YourPrice_07_02"); //我 加 入 是 为 了 换 一 个 铺 位 。 我 帮 助 你 ， 你 带 上 我 。
};

//*********************************************************************
//	Die Reise kann gefährlich werden.
//*********************************************************************
instance DIA_None_101_Mario_CouldBeDangerous(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 10;
	condition		= DIA_None_101_Mario_CouldBeDangerous_Condition;
	information		= DIA_None_101_Mario_CouldBeDangerous_Info;
	description		= "旅 途 可 能 很 危 险 。";
};

func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YourPrice))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_CouldBeDangerous_15_00"); //旅 途 可 能 很 危 险 。
	AI_Output(self, other, "DIA_None_101_Mario_CouldBeDangerous_07_01"); //我 习 惯 危 险 了 。 当 出 海 的 时 候 ， 每 一 天 都 危 险 。
	AI_Output(self, other, "DIA_None_101_Mario_CouldBeDangerous_07_02"); //下 一 个 风 暴 可 能 就 是 你 的 死 期 ， 深 海 怪 物 可 能 会 把 你 的 船 整 个 吞 下 。
	AI_Output(self, other, "DIA_None_101_Mario_CouldBeDangerous_07_03"); //而 我 更 不 用 提 起 兽 人 的 战 舰 了 ， 是 吗 ？ 相 信 我 ， 我 什 么 都 不 怕 。 一 个 会 害 怕 的 水 手 早 就 死 了 。
};

//*********************************************************************
//	Kein Bedarf!
//*********************************************************************
instance DIA_None_101_Mario_DontNeedYou(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 13;
	condition		= DIA_None_101_Mario_DontNeedYou_Condition;
	information		= DIA_None_101_Mario_DontNeedYou_Info;
	description		= "我 用 不 上 你 。";
};

func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_DontNeedYou_15_00"); //我 用 不 上 你 。
	AI_Output(self, other, "DIA_None_101_Mario_DontNeedYou_07_01"); //我 是 你 在 这 里 能 找 到 的 最 好 的 水 手 。
	AI_Output(self, other, "DIA_None_101_Mario_DontNeedYou_07_02"); //从 你 的 样 子 看 ， 你 并 不 了 解 导 航 的 基 础 。
	AI_Output(self, other, "DIA_None_101_Mario_DontNeedYou_07_03"); //所 以 在 你 相 信 任 何 人 之 前 ， 一 定 要 考 虑 再 三 。
};

//*********************************************************************
//	Gute Leute kann ich immer brauchen.
//*********************************************************************
instance DIA_None_101_Mario_NeedGoodMen(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 2;
	condition		= DIA_None_101_Mario_NeedGoodMen_Condition;
	information		= DIA_None_101_Mario_NeedGoodMen_Info;
	description		= "我 永 远 需 要 好 帮 手 。";
};

func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_NeedGoodMen_15_00"); //我 永 远 需 要 好 帮 手 。
	AI_Output(self, other, "DIA_None_101_Mario_NeedGoodMen_07_01"); //当 然 ， 我 们 船 上 见 。

	B_GivePlayerXP(XP_Crewmember_Success);

	Mario_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);
	AI_StopProcessInfos(self);
	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_LeaveMyShip(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 11;
	condition		= DIA_Mario_LeaveMyShip_Condition;
	information		= DIA_Mario_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "无 论 如 何 我 还 是 用 不 上 你 ！";
};

func int DIA_Mario_LeaveMyShip_Condition()
{
	if ((Mario_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Mario_LeaveMyShip_15_00"); //无 论 如 何 我 还 是 用 不 上 你 ！
	AI_Output(self, other, "DIA_Mario_LeaveMyShip_07_01"); //随 你 的 便 。 你 知 道 到 哪 里 找 我 ！

	Mario_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "ShipOff");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_StillNeedYou(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 11;
	condition		= DIA_Mario_StillNeedYou_Condition;
	information		= DIA_Mario_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "我 最 终 还 是 需 要 你 帮 忙 ！";
};

func int DIA_Mario_StillNeedYou_Condition()
{
	if (((Mario_IsOnBOard == LOG_OBSOLETE) // Hier brauch man natürlich nur eine variable abfragen
	|| (Mario_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Mario_StillNeedYou_15_00"); //我 最 终 还 是 需 要 你 帮 忙 ！

	if (Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Mario_StillNeedYou_07_01"); //我 早 就 知 道 ！ 我 们 船 上 见 ！

		Mario_IsOnBoard = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count + 1);
		AI_StopProcessInfos(self);
		if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self, "SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self, "WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Mario_StillNeedYou_07_02"); //你 不 能 那 样 对 待 我 。 我 要 杀 了 你 ！

		AI_StopProcessInfos(self);

		B_Attack(self, other, AR_NONE, 1);
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 900;
	condition		= DIA_MARIO_PICKPOCKET_Condition;
	information		= DIA_MARIO_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_MARIO_PICKPOCKET_Condition()
{
	C_Beklauen(71, 220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_MARIO_PICKPOCKET);
	Info_AddChoice(DIA_MARIO_PICKPOCKET, DIALOG_BACK, DIA_MARIO_PICKPOCKET_BACK);
	Info_AddChoice(DIA_MARIO_PICKPOCKET, DIALOG_PICKPOCKET, DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_MARIO_PICKPOCKET);
};

func void DIA_MARIO_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_MARIO_PICKPOCKET);
};
