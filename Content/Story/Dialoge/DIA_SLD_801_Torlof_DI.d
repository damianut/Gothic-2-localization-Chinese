// ************************************************************
// 	  				   EXIT
// ************************************************************
instance DIA_Torlof_DI_KAP3_EXIT(C_INFO)
{
	npc				= SLD_801_Torlof_DI;
	nr				= 999;
	condition		= DIA_Torlof_DI_KAP3_EXIT_Condition;
	information		= DIA_Torlof_DI_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Torlof_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Torlof_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hallo
//*********************************************************************
instance DIA_Torlof_DI_Hallo(C_INFO)
{
	npc				= SLD_801_Torlof_DI;
	nr				= 4;
	condition		= DIA_Torlof_DI_Hallo_Condition;
	information		= DIA_Torlof_DI_Hallo_Info;
	permanent		= TRUE;
	description		= "都 安 静 了 ？";
};

func int DIA_Torlof_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_Torlof_DI_Hallo_15_00"); //一 切 都 平 静 了 吗 ？

	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Torlof_DI_Hallo_01_01"); //到 目 前 为 止 。 不 过 ， 那 可 能 在 转 眼 间 改 变 。 提 高 警 惕 。
	}
	else
	{
		AI_Output(self, other, "DIA_Torlof_DI_Hallo_01_02"); //如 果 那 些 该 死 的 兽 人 呆 在 那 里 不 动 的 话 ， 我 看 没 什 么 问 题 。
		B_StartOtherRoutine(Torlof_DI, "Start");
	};

	AI_StopProcessInfos(self);
};

//*******************************************
//	TeachPlayer
//*******************************************
instance DIA_Torlof_DI_Teach(C_INFO)
{
	npc				= SLD_801_Torlof_DI;
	nr				= 150;
	condition		= DIA_Torlof_DI_Teach_Condition;
	information		= DIA_Torlof_DI_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 强 我 的 能 力 ！";
};

func int DIA_Torlof_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Teach_Info()
{
	AI_Output(other, self, "DIA_Torlof_DI_Teach_15_00"); //我 想 要 增 强 我 的 能 力 ！

	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Torlof_DI_Teach);
};

func void DIA_Torlof_DI_Teach_DEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_DEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MAX);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MAX);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_DI_Teach_STR_5);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DI_UndeadDragonDead(C_INFO)
{
	npc				= SLD_801_Torlof_DI;
	nr				= 4;
	condition		= DIA_Torlof_DI_UndeadDragonDead_Condition;
	information		= DIA_Torlof_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 已 经 消 灭 了 敌 人 。";
};

func int DIA_Torlof_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Torlof_DI_UndeadDragonDead_15_00"); //我 已 经 消 灭 了 敌 人 。
	AI_Output(self, other, "DIA_Torlof_DI_UndeadDragonDead_01_01"); //我 没 有 想 过 别 的 事 。 情 况 怎 么 样 ？ 现 在 我 们 终 于 可 以 离 开 了 吗 ？

	Info_ClearChoices(DIA_Torlof_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead, "我 还 需 要 一 两 分 钟 。", DIA_Torlof_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead, "是 的 ， 结 束 了 。 我 们 出 发 。", DIA_Torlof_DI_UndeadDragonDead_over);
};

func void DIA_Torlof_DI_UndeadDragonDead_moment()
{
	AI_Output(other, self, "DIA_Torlof_DI_UndeadDragonDead_moment_15_00"); //我 还 需 要 一 两 分 钟 。
	AI_Output(self, other, "DIA_Torlof_DI_UndeadDragonDead_moment_01_01"); //快 点 ！
	AI_StopProcessInfos(self);
};

func void DIA_Torlof_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Torlof_DI_PICKPOCKET(C_INFO)
{
	npc				= SLD_801_Torlof_DI;
	nr				= 900;
	condition		= DIA_Torlof_DI_PICKPOCKET_Condition;
	information		= DIA_Torlof_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Torlof_DI_PICKPOCKET_Condition()
{
	C_Beklauen(76, 120);
};

func void DIA_Torlof_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET, DIALOG_BACK, DIA_Torlof_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Torlof_DI_PICKPOCKET_DoIt);
};

func void DIA_Torlof_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};

func void DIA_Torlof_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};
