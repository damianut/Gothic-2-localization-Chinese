// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OUT_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OUT_13_EXIT_Condition;
	information		= DIA_OUT_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OUT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_OUT_13_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_OUT_13_STANDARD_Condition;
	information		= DIA_OUT_13_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_OUT_13_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_13_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_13_00"); //到 现 在 为 止 ， 我 们 一 直 都 能 挡 住 兽 人 们 的 攻 击 。 但 是 近 来 他 们 的 数 量 越 来 越 多 了 。
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_13_01"); //民 兵 也 不 是 来 帮 助 我 们 的 。 他 们 从 城 里 过 来 只 是 为 了 拿 走 我 们 的 庄 稼 和 家 畜 。
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_13_02"); //欧 纳 尔 疯 了 ， 竟 然 当 圣 骑 士 还 在 这 里 的 时 候 向 城 市 发 起 挑 战 。
	};

	AI_StopProcessInfos(self);
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OUT_13(var C_Npc slf)
{
	DIA_OUT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_13_STANDARD.npc = Hlp_GetInstanceID(slf);
};
