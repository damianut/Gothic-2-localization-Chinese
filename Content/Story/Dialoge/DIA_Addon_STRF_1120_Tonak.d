// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Tonak_EXIT(C_INFO)
{
	npc				= STRF_1120_Addon_Tonak;
	nr				= 999;
	condition		= DIA_Addon_Tonak_EXIT_Condition;
	information		= DIA_Addon_Tonak_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Tonak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tonak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Tonak_Hi(C_INFO)
{
	npc				= STRF_1120_Addon_Tonak;
	nr				= 2;
	condition		= DIA_Addon_Tonak_Hi_Condition;
	information		= DIA_Addon_Tonak_Hi_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Tonak_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tonak_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Tonak_Hi_03_00"); //你 想 要 什 么 ？ 我 只 是 一 个 被 关 住 的 工 人 。 我 什 么 也 没 做 。
	AI_StopProcessInfos(self);
};
