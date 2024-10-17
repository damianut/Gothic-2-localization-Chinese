// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_NW_EXIT(C_INFO)
{
	npc				= STRF_1127_Addon_Pardos_NW;
	nr				= 999;
	condition		= DIA_Addon_Pardos_NW_EXIT_Condition;
	information		= DIA_Addon_Pardos_NW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Pardos_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_NW_Hi(C_INFO)
{
	npc				= STRF_1127_Addon_Pardos_NW;
	nr				= 2;
	condition		= DIA_Addon_Pardos_NW_Hi_Condition;
	information		= DIA_Addon_Pardos_NW_Hi_Info;
	permanent		= TRUE;
	description		= "你 近 况 如 何 ？";
};

func int DIA_Addon_Pardos_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_NW_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Pardos_NW_Hi_15_00"); //你 近 况 如 何 ？
	AI_Output(self, other, "DIA_Addon_Pardos_NW_Hi_03_01"); //（ 露 齿 而 笑 ） 嘿 ， 即 使 那 不 是 我 的 救 星 。 再 次 感 谢 ， 现 在 我 可 以 休 息 一 整 天 了 。
	AI_Output(other, self, "DIA_Addon_Pardos_NW_Hi_15_02"); //好 吧 ， 那 我 继 续 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Pardos_NW_PICKPOCKET(C_INFO)
{
	npc				= STRF_1127_Addon_Pardos_NW;
	nr				= 900;
	condition		= DIA_Addon_Pardos_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Pardos_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Addon_Pardos_NW_PICKPOCKET_Condition()
{
	C_Beklauen(85, 10);
};

func void DIA_Addon_Pardos_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Pardos_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Pardos_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Pardos_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Pardos_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Pardos_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Pardos_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Pardos_NW_PICKPOCKET);
};

func void DIA_Addon_Pardos_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Pardos_NW_PICKPOCKET);
};
