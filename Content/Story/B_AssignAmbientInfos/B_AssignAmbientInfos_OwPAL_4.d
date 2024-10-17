// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OWPAL_4_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OWPAL_4_EXIT_Condition;
	information		= DIA_OWPAL_4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OWPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OWPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_OWPAL_4_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_OWPAL_4_STANDARD_Condition;
	information		= DIA_OWPAL_4_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_OWPAL_4_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OWPAL_4_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_OWPAL_4_STANDARD_04_00"); //英 诺 斯 是 我 的 荣 耀 ， 荣 耀 就 是 我 的 生 命 。
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_OWPAL_4_STANDARD_04_01"); //只 要 英 诺 斯 的 光 还 照 耀 着 我 们 ， 我 们 就 要 坚 定 地 站 在 这 里 。
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_OWPAL_4_STANDARD_04_02"); //有 了 英 诺 斯 的 帮 助 ， 我 们 将 会 把 邪 恶 的 生 物 从 这 里 赶 走 。
	};

	AI_StopProcessInfos(self);
};

//**************************************************************
// ----------------------------------------------------------------

func void B_AssignAmbientInfos_OWPAL_4(var C_Npc slf)
{
	DIA_OWPAL_4_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OWPAL_4_STANDARD.npc = Hlp_GetInstanceID(slf);
};
