// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BDT_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BDT_1_EXIT_Condition;
	information		= DIA_BDT_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_BDT_1_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_BDT_1_STANDARD_Condition;
	information		= DIA_BDT_1_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_BDT_1_STANDARD_01_00"); //马 上 从 我 的 视 线 里 消 失 ！
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_BDT_1_STANDARD_01_01"); //你 在 找 麻 烦 吗 ？
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_BDT_1_STANDARD_01_02"); //趁 还 活 着 的 时 候 马 上 滚 开 ！
	};

	AI_StopProcessInfos(self);
};

//**************************************************************
// ----------------------------------------------------------------

func void B_AssignAmbientInfos_BDT_1(var C_Npc slf)
{
	DIA_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BDT_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
