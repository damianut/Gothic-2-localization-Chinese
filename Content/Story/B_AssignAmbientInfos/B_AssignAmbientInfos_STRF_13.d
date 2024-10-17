// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_STRF_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_STRF_13_EXIT_Condition;
	information		= DIA_STRF_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_STRF_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_STRF_13_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_STRF_13_STANDARD_Condition;
	information		= DIA_STRF_13_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_STRF_13_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_13_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_STRF_13_STANDARD_13_00"); //走 开 ， 伙 计 ！
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_STRF_13_STANDARD_13_01"); //你 想 要 我 怎 么 样 ？ 别 烦 我 ！
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_STRF_13_STANDARD_13_02"); //我 们 都 会 死 在 这 里 ！
	};

	AI_StopProcessInfos(self);
};

//**************************************************************
// ----------------------------------------------------------------

func void B_AssignAmbientInfos_STRF_13(var C_Npc slf)
{
	DIA_STRF_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_STRF_13_STANDARD.npc = Hlp_GetInstanceID(slf);
};
