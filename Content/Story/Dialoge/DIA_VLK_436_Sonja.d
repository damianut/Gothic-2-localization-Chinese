///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Sonja_EXIT(C_INFO)
{
	npc				= VLK_436_Sonja;
	nr				= 999;
	condition		= DIA_Sonja_EXIT_Condition;
	information		= DIA_Sonja_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sonja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sonja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sonja_PICKPOCKET(C_INFO)
{
	npc				= VLK_436_Sonja;
	nr				= 900;
	condition		= DIA_Sonja_PICKPOCKET_Condition;
	information		= DIA_Sonja_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60_Female;
};

func int DIA_Sonja_PICKPOCKET_Condition()
{
	C_Beklauen(58, 70);
};

func void DIA_Sonja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
	Info_AddChoice(DIA_Sonja_PICKPOCKET, DIALOG_BACK, DIA_Sonja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sonja_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sonja_PICKPOCKET_DoIt);
};

func void DIA_Sonja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

func void DIA_Sonja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sonja_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Sonja_STANDARD(C_INFO)
{
	npc				= VLK_436_Sonja;
	condition		= DIA_Sonja_STANDARD_Condition;
	information		= DIA_Sonja_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Sonja_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_Andre_REDLIGHT != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Sonja_STANDARD_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Sonja_STANDARD_16_00"); //如 果 你 想 找 点 乐 子 ， 去 跟 布 洛 摩 尔 谈 谈 。
	}
	else if ((other.guild == GIL_DJG)
	&& (Sonja_Says == FALSE))
	{
		AI_Output(self, other, "DIA_Sonja_STANDARD_16_01"); //如 果 你 想 找 点 乐 子 ， 去 跟 布 洛 摩 尔 谈 谈 。
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Sonja_STANDARD_16_02"); //如 果 你 只 想 聊 天 的 话 ， 那 就 自 己 去 找 个 女 人 然 后 娶 了 她 。
	};

	AI_StopProcessInfos(self);
};
