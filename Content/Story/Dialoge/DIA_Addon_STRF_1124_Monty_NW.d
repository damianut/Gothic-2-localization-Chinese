// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Monty_NW_EXIT(C_INFO)
{
	npc				= STRF_1124_Addon_Monty_NW;
	nr				= 999;
	condition		= DIA_Addon_Monty_NW_EXIT_Condition;
	information		= DIA_Addon_Monty_NW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Monty_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Monty_NW_Hi(C_INFO)
{
	npc				= STRF_1124_Addon_Monty_NW;
	nr				= 2;
	condition		= DIA_Addon_Monty_NW_Hi_Condition;
	information		= DIA_Addon_Monty_NW_Hi_Info;
	description		= "怎 么 样 ？ 回 去 工 作 ， 是 吗 ？";
};

func int DIA_Addon_Monty_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Monty_NW_Hi_15_00"); //怎 么 样 ？ 回 去 工 作 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Monty_NW_Hi_08_01"); //哦 ， 老 兄 - 在 我 走 后 ， 他 们 什 么 事 都 没 做 成 。 现 在 我 必 须 再 仔 细 研 究 一 下 那 些 建 筑 图 。
	AI_Output(other, self, "DIA_Addon_Monty_NW_Hi_15_02"); //嗯 好 。 那 我 不 留 你 了 。
	AI_Output(self, other, "DIA_Addon_Monty_NW_Hi_08_03"); //（ 大 笑 ） 好 吧 。 旅 途 愉 快 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Monty_NW_PICKPOCKET(C_INFO)
{
	npc				= STRF_1124_Addon_Monty_NW;
	nr				= 900;
	condition		= DIA_Addon_Monty_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Monty_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Monty_NW_PICKPOCKET_Condition()
{
	C_Beklauen(60, 60);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Monty_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Monty_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};
