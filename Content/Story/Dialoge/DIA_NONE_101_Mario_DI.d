//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_NONE_101_MARIO_DI_EXIT(C_INFO)
{
	npc				= NONE_101_MARIO_DI;
	nr				= 999;
	condition		= DIA_NONE_101_MARIO_DI_EXIT_Condition;
	information		= DIA_NONE_101_MARIO_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_NONE_101_MARIO_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_101_MARIO_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
// perm
//*********************************************************************
instance DIA_NONE_101_MARIO_DI_Job(C_INFO)
{
	npc				= NONE_101_MARIO_DI;
	nr				= 4;
	condition		= DIA_NONE_101_MARIO_DI_Job_Condition;
	information		= DIA_NONE_101_MARIO_DI_Job_Info;
	permanent		= TRUE;
	description		= "这 是 你 证 明 你 战 斗 能 力 的 机 会 。";
};

func int DIA_NONE_101_MARIO_DI_Job_Condition()
{
	if ((Npc_IsDead(UndeadDragon) == FALSE)
	&& (ORkSturmDI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_Job_Info()
{
	AI_Output(other, self, "DIA_NONE_101_MARIO_DI_Job_15_00"); //这 是 你 证 明 你 战 斗 能 力 的 机 会 。
	AI_Output(self, other, "DIA_NONE_101_MARIO_DI_Job_07_01"); //慢 慢 的 。 万 事 俱 备 。
	AI_Output(other, self, "DIA_NONE_101_MARIO_DI_Job_15_02"); //嗯 。 那 就 是 我 期 待 在 你 身 上 看 到 的 。
	AI_Output(self, other, "DIA_NONE_101_MARIO_DI_Job_07_03"); //等 等 吧 。
};

//*********************************************************************
// ambush
//*********************************************************************
instance DIA_NONE_101_MARIO_DI_ambush(C_INFO)
{
	npc				= NONE_101_MARIO_DI;
	nr				= 4;
	condition		= DIA_NONE_101_MARIO_DI_ambush_Condition;
	information		= DIA_NONE_101_MARIO_DI_ambush_Info;
	important		= TRUE;
};

func int DIA_NONE_101_MARIO_DI_ambush_Condition()
{
	if (ORkSturmDI == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_ambush_Info()
{
	AI_Output(self, other, "DIA_NONE_101_MARIO_DI_ambush_07_00"); //靠 近 点 。 我 的 朋 友 ， 现 在 让 我 看 看 你 都 有 什 么 。
	AI_Output(other, self, "DIA_NONE_101_MARIO_DI_ambush_15_01"); //你 这 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_NONE_101_MARIO_DI_ambush_07_02"); //非 常 简 单 。 主 人 已 经 忍 受 不 了 你 了 。
	AI_Output(self, other, "DIA_NONE_101_MARIO_DI_ambush_07_03"); //我 早 就 应 该 杀 了 你 。 但 是 我 的 朋 友 和 我 马 上 就 会 纠 正 这 个 错 误 。

	Info_ClearChoices(DIA_NONE_101_MARIO_DI_ambush);
	Info_AddChoice(DIA_NONE_101_MARIO_DI_ambush, DIALOG_ENDE, DIA_NONE_101_MARIO_DI_ambush_ambush);
	B_GivePlayerXP(XP_Mario_Ambush);
	MIS_Mario_Ambush = LOG_SUCCESS;
};

func void DIA_NONE_101_MARIO_DI_ambush_ambush()
{
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	Skeleton_Mario1.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario2.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario3.aivar[AIV_EnemyOverride] = FALSE;
	Skeleton_Mario4.aivar[AIV_EnemyOverride] = FALSE;
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_MARIO_DI_PICKPOCKET(C_INFO)
{
	npc				= NONE_101_MARIO_DI;
	nr				= 900;
	condition		= DIA_MARIO_DI_PICKPOCKET_Condition;
	information		= DIA_MARIO_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_MARIO_DI_PICKPOCKET_Condition()
{
	C_Beklauen(71, 110);
};

func void DIA_MARIO_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_MARIO_DI_PICKPOCKET);
	Info_AddChoice(DIA_MARIO_DI_PICKPOCKET, DIALOG_BACK, DIA_MARIO_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_MARIO_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_MARIO_DI_PICKPOCKET_DoIt);
};

func void DIA_MARIO_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_MARIO_DI_PICKPOCKET);
};

func void DIA_MARIO_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_MARIO_DI_PICKPOCKET);
};
