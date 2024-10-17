// ************************************************************
// 	  				   EXIT
// ************************************************************
instance DIA_GornNW_nach_DJG_KAP5_EXIT(C_INFO)
{
	npc				= PC_Fighter_NW_nach_DJG;
	nr				= 999;
	condition		= DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information		= DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  	  Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************
instance DIA_GornNW_nach_DJG_AllDragonsDead(C_INFO)
{
	npc				= PC_Fighter_NW_nach_DJG;
	nr				= 59;
	condition		= DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information		= DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent		= TRUE;
	description		= "你 放 松 了 吗 ？";
};

func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if (Gorn_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_GornNW_nach_DJG_AllDragonsDead_15_00"); //你 放 松 了 吗 ？
	AI_Output(self, other, "DIA_GornNW_nach_DJG_AllDragonsDead_12_01"); //当 然 ， 为 什 么 不 呢 ？ 龙 都 死 了 ， 不 是 吗 ？
	AI_Output(other, self, "DIA_GornNW_nach_DJG_AllDragonsDead_15_02"); //这 个 问 题 有 点 儿 复 杂 。
	AI_Output(self, other, "DIA_GornNW_nach_DJG_AllDragonsDead_12_03"); //（ 大 笑 ） 好 吧 。 象 往 常 一 样 。 需 要 我 的 斧 子 的 时 候 跟 我 说 一 声 。
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_INFO)
{
	npc				= PC_Fighter_NW_nach_DJG;
	nr				= 55;
	condition		= DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information		= DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 需 要 你 和 你 的 斧 头 。";
};

func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Gorn_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00"); //我 需 要 你 和 你 的 斧 头 。
	AI_Output(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01"); //好 的 。 我 并 不 感 到 意 外 。 我 能 为 你 做 些 什 么 ？
	AI_Output(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02"); //你 能 跟 我 一 起 乘 船 去 一 座 岛 上 对 付 一 些 敌 人 吗 ？
	AI_Output(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03"); //（ 大 笑 ） 当 然 。 马 上 。 尽 管 告 诉 我 要 我 做 些 什 么 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_13);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04"); //目 前 ， 我 的 船 员 队 伍 已 经 够 了 ， 但 我 会 考 虑 让 你 也 上 船 。
		AI_Output(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05"); //如 果 因 为 我 的 原 因 而 必 须 从 船 员 中 减 掉 一 个 人 的 话 ， 那 就 挑 出 最 弱 的 那 个 。
		AI_Output(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06"); //在 这 种 艰 难 时 刻 ， 你 需 要 每 一 个 肯 出 力 的 人 。
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy, "等 时 机 成 熟 的 时 候 ， 我 会 让 你 知 道 。", DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy, "和 我 一 起 上 船 。 在 港 口 等 我 。", DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00"); //和 我 一 起 上 船 。 在 港 口 等 我 。
	AI_Output(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01"); //一 艘 船 ？ 哈 ！ 我 要 对 你 说 一 件 事 ， 跟 你 在 一 起 永 远 也 不 会 无 聊 。 再 见 。

	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00"); //等 时 机 成 熟 的 时 候 ， 我 会 让 你 知 道 。
	AI_Output(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01"); //好的。

	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_LeaveMyShip(C_INFO)
{
	npc				= PC_Fighter_NW_nach_DJG;
	nr				= 55;
	condition		= DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information		= DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "也 许 你 最 好 留 在 这 里 。";
};

func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if ((Gorn_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_GornNW_nach_DJG_LeaveMyShip_15_00"); //也 许 你 最 好 留 在 这 里 。
	AI_Output(self, other, "DIA_GornNW_nach_DJG_LeaveMyShip_12_01"); //我 应 该 让 你 独 自 离 开 ？ 唔 。 这 让 我 很 为 难 ， 但 这 是 你 的 战 争 。 不 管 怎 样 ， 如 果 你 想 让 我 跟 随 你 的 话 ， 就 来 找 我 。

	Gorn_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_StillNeedYou(C_INFO)
{
	npc				= PC_Fighter_NW_nach_DJG;
	nr				= 55;
	condition		= DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information		= DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "回 来 。 我 需 要 你 。";
};

func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if (((Gorn_IsOnBOard == LOG_OBSOLETE)
	|| (Gorn_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_GornNW_nach_DJG_StillNeedYou_15_00"); //回 来 。 我 需 要 你 。
	AI_Output(self, other, "DIA_GornNW_nach_DJG_StillNeedYou_12_01"); //你 来 了 。 而 我 还 以 为 你 在 逍 遥 快 活 的 时 候 想 让 我 死 在 这 里 呢 。 一 会 见 。

	self.flags = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard = LOG_SUCCESS;
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

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fighter_nach_DJG_PICKPOCKET(C_INFO)
{
	npc				= PC_Fighter_NW_nach_DJG;
	nr				= 900;
	condition		= DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information		= DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	C_Beklauen(10, 25);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET, DIALOG_BACK, DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};
