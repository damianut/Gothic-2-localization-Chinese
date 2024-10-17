// ************************************************************
// 	  				   EXIT
// ************************************************************
instance DIA_Angar_NW_KAP5_EXIT(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 999;
	condition		= DIA_Angar_NW_KAP5_EXIT_Condition;
	information		= DIA_Angar_NW_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  	  Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************
instance DIA_Angar_NW_AllDragonsDead(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 59;
	condition		= DIA_Angar_NW_AllDragonsDead_Condition;
	information		= DIA_Angar_NW_AllDragonsDead_Info;
	description		= "进 行 的 怎 么 样 ？";
};

func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Angar_NW_AllDragonsDead_15_00"); //进 行 的 怎 么 样 ？
	AI_Output(self, other, "DIA_Angar_NW_AllDragonsDead_04_01"); //非 常 正 确 。 但 是 我 还 有 这 痛 苦 的 头 疼 ， 虽 然 在 我 离 开 矿 藏 山 谷 后 已 经 有 所 好 转 。
	if (Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Angar_NW_AllDragonsDead_04_02"); //我 会 留 在 这 里 。 那 样 万 一 你 需 要 我 的 话 ， 还 知 道 到 哪 里 来 找 我 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_KnowWhereEnemy(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 55;
	condition		= DIA_Angar_NW_KnowWhereEnemy_Condition;
	information		= DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 要 离 开 克 霍 里 尼 斯 。 你 想 和 我 一 起 吗 ？";
};

func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Angar_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Angar_NW_AllDragonsDead)))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Angar_NW_KnowWhereEnemy_15_00"); //我 要 离 开 克 霍 里 尼 斯 。 你 想 和 我 一 起 吗 ？
	AI_Output(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_01"); //离 矿 藏 山 谷 越 远 ， 我 感 觉 越 好 。 我 们 什 么 时 候 走 ？

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_5);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Angar_NW_KnowWhereEnemy_15_02"); //马 上 ， 我 已 经 有 足 够 的 人 手 划 船 了 。 也 许 我 一 会 就 回 你 那 里 。
		AI_Output(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_03"); //好 。 如 果 你 需 要 我 的 话 ， 我 就 在 这 里 。
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy, "要 走 的 时 候 我 会 告 诉 你 。", DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy, "那 去 港 口 吧 。 我 会 随 后 在 那 里 和 你 碰 面 。", DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Angar_NW_KnowWhereEnemy_Yes_15_00"); //那 去 港 口 吧 。 我 会 随 后 在 那 里 和 你 碰 面 。
	AI_Output(self, other, "DIA_Angar_NW_KnowWhereEnemy_Yes_04_01"); //我 在 路 上 。

	self.flags = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);
	B_GivePlayerXP(XP_Crewmember_Success);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Angar_NW_KnowWhereEnemy_No_15_00"); //要 走 的 时 候 我 会 告 诉 你 。
	AI_Output(self, other, "DIA_Angar_NW_KnowWhereEnemy_No_04_01"); //好的。

	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_LeaveMyShip(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 55;
	condition		= DIA_Angar_NW_LeaveMyShip_Condition;
	information		= DIA_Angar_NW_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "留 在 这 里 ， 治 疗 一 下 你 的 伤 痛 。";
};

func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if ((Angar_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Angar_NW_LeaveMyShip_15_00"); //留 在 这 里 ， 治 疗 一 下 你 的 伤 痛 。
	AI_Output(self, other, "DIA_Angar_NW_LeaveMyShip_04_01"); //好 吧 。 我 要 向 回 走 。 也 许 那 条 路 好 一 些 。

	Angar_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_StillNeedYou(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 55;
	condition		= DIA_Angar_NW_StillNeedYou_Condition;
	information		= DIA_Angar_NW_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "回 船 上 来 。";
};

func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if (((Angar_IsOnBOard == LOG_OBSOLETE)
	|| (Angar_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Angar_NW_StillNeedYou_15_00"); //回 船 上 来 。
	AI_Output(self, other, "DIA_Angar_NW_StillNeedYou_04_01"); //你 比 我 还 差 劲 。 多 一 些 果 断 对 你 有 好 处 。 再 见 。

	self.flags = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard = LOG_SUCCESS;
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
instance DIA_Angar_NW_PICKPOCKET(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 900;
	condition		= DIA_Angar_NW_PICKPOCKET_Condition;
	information		= DIA_Angar_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	C_Beklauen(47, 34);
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET, DIALOG_BACK, DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_FOUNDAMULETT(C_INFO)
{
	npc				= DJG_705_Angar_NW;
	nr				= 7;
	condition		= DIA_Angar_NW_FOUNDAMULETT_Condition;
	information		= DIA_Angar_NW_FOUNDAMULETT_Info;
	description		= "我 找 到 了 你 的 护 身 符 。";
};

func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if ((Npc_HasItems(other, ItAm_Mana_Angar_MIS))
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
	&& (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};
