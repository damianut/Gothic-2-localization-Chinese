// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OUT_7_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OUT_7_EXIT_Condition;
	information		= DIA_OUT_7_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OUT_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_OUT_7_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_OUT_7_STANDARD_Condition;
	information		= DIA_OUT_7_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_OUT_7_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_7_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_OUT_7_STANDARD_07_00"); //最 近 这 里 越 发 危 险 了 。 旷 野 袭 击 者 变 成 了 真 正 的 瘟 疫。
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_OUT_7_STANDARD_07_01"); //我 们 必 须 向 城 里 交 税 。 如 果 我 们 不 交 的 话 ， 就 会 惹 上 圣 骑 士 。
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_OUT_7_STANDARD_07_02"); //欧 纳 尔 的 反 叛 会 造 成 严 重 的 后 果 。 我 最 好 置 身 事 外 。
	};

	AI_StopProcessInfos(self);
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OUT_7(var C_Npc slf)
{
	DIA_OUT_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};
