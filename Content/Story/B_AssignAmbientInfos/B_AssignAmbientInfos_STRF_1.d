// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_STRF_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_STRF_1_EXIT_Condition;
	information		= DIA_STRF_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_STRF_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_STRF_1_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_STRF_1_STANDARD_Condition;
	information		= DIA_STRF_1_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_STRF_1_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_STRF_1_STANDARD_01_00"); //如 果 我 在 那 时 趁 机 离 开 的 话 ， 现 在 就 不 用 为 那 头 猪 做 苦 工 了 ！
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_STRF_1_STANDARD_01_01"); //全 是 为 了 矿 石 ， 一 直 都 是 这 样 。 他 们 要 的 只 是 该 死 的 矿 石 。
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_STRF_1_STANDARD_01_02"); //如 果 你 只 能 吃 他 们 扔 给 我 们 的 食 物 ， 那 也 会 开 始 考 虑 反 叛 的 ！
	};

	AI_StopProcessInfos(self);
};

//**************************************************************
// ----------------------------------------------------------------

func void B_AssignAmbientInfos_STRF_1(var C_Npc slf)
{
	DIA_STRF_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_STRF_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
