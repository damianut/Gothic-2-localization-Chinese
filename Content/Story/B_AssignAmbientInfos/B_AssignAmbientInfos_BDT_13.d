// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BDT_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BDT_13_EXIT_Condition;
	information		= DIA_BDT_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_BDT_13_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_BDT_13_STANDARD_Condition;
	information		= DIA_BDT_13_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_13_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void B_Verschwinde_Stimme13()
{
	AI_Output(self, other, "DIA_BDT_13_STANDARD_13_01"); //滚 开 ！
};

func void DIA_BDT_13_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_BDT_13_STANDARD_13_00"); //你 像 个 白 痴 一 样 看 什 么 呢 ！
	};

	if (randy == 1)
	{
		B_Verschwinde_Stimme13();
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_BDT_13_STANDARD_13_02"); //马 上 走 开 ， 你 这 废 物 ！
	};

	AI_StopProcessInfos(self);
};

//**************************************************************
// ----------------------------------------------------------------

func void B_AssignAmbientInfos_BDT_13(var C_Npc slf)
{
	DIA_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BDT_13_STANDARD.npc = Hlp_GetInstanceID(slf);
};
