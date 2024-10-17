// --------------------------------------------------------------------
//	Info EXIT
// --------------------------------------------------------------------
instance DIA_Addon_Wache_01_EXIT(C_INFO)
{
	npc				= BDT_1081_Addon_Wache_01;
	nr				= 999;
	condition		= DIA_Addon_Wache_01_EXIT_Condition;
	information		= DIA_Addon_Wache_01_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Wache_01_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_01_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Wache_01_PICKPOCKET(C_INFO)
{
	npc				= BDT_1081_Addon_Wache_01;
	nr				= 900;
	condition		= DIA_Addon_Wache_01_PICKPOCKET_Condition;
	information		= DIA_Addon_Wache_01_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Wache_01_PICKPOCKET_Condition()
{
	C_Beklauen(38, 99);
};

func void DIA_Addon_Wache_01_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Wache_01_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Wache_01_PICKPOCKET, DIALOG_BACK, DIA_Addon_Wache_01_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Wache_01_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Wache_01_PICKPOCKET_DoIt);
};

func void DIA_Addon_Wache_01_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Wache_01_PICKPOCKET);
};

func void DIA_Addon_Wache_01_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_01_PICKPOCKET);
};

// --------------------------------------------------------------------
//	Info Hi
// --------------------------------------------------------------------
instance DIA_Addon_Wache_01_Hi(C_INFO)
{
	npc				= BDT_1081_Addon_Wache_01;
	nr				= 2;
	condition		= DIA_Addon_Wache_01_Hi_Condition;
	information		= DIA_Addon_Wache_01_Hi_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Addon_Wache_01_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_01_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Wache_01_Hi_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Wache_01_Hi_04_01"); //靠 近 伊 斯 特 班 话 ， 我 就 把 你 剁 成 碎 片 。

	AI_StopProcessInfos(self);
};
