///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rick_EXIT(C_INFO)
{
	npc				= Mil_336_Rick;
	nr				= 999;
	condition		= DIA_Rick_EXIT_Condition;
	information		= DIA_Rick_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rick_HALLO(C_INFO)
{
	npc				= Mil_336_Rick;
	nr				= 1;
	condition		= DIA_Rick_HALLO_Condition;
	information		= DIA_Rick_HALLO_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Rick_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rick_HALLO_Info()
{
	AI_Output(other, self, "DIA_Rick_HALLO_15_00"); //进 行 的 怎 么 样 ？
	AI_Output(self, other, "DIA_Rick_HALLO_10_01"); //如 果 你 要 聊 天 ， 去 找 鲁 姆 博 德 。 我 站 在 这 里 就 是 为 了 防 止 有 人 惹 麻 烦 。

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rick_PICKPOCKET(C_INFO)
{
	npc				= Mil_336_Rick;
	nr				= 900;
	condition		= DIA_Rick_PICKPOCKET_Condition;
	information		= DIA_Rick_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Rick_PICKPOCKET_Condition()
{
	C_Beklauen(10, 45);
};

func void DIA_Rick_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rick_PICKPOCKET);
	Info_AddChoice(DIA_Rick_PICKPOCKET, DIALOG_BACK, DIA_Rick_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rick_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rick_PICKPOCKET_DoIt);
};

func void DIA_Rick_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rick_PICKPOCKET);
};

func void DIA_Rick_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rick_PICKPOCKET);
};
