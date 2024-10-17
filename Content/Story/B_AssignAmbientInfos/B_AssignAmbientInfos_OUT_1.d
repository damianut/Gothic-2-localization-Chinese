// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OUT_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OUT_1_EXIT_Condition;
	information		= DIA_OUT_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OUT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_OUT_1_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_OUT_1_STANDARD_Condition;
	information		= DIA_OUT_1_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_OUT_1_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_1_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_01_00"); //因 为 罪 犯 流 放 地 的 屏 障 消 失 了 ， 我 们 现 在 一 直 受 到 强 盗 们 的 困 扰 。
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_01_01"); //不 能 依 靠 民 兵 。 我 们 必 须 保 护 自 己 。
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_01_02"); //我 不 会 让 任 何 人 利 用 ， 国 王 也 好 ， 胖 子 欧 纳 尔 也 好 。 我 只 为 自 己 战 斗 。
	};

	AI_StopProcessInfos(self);
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OUT_1(var C_Npc slf)
{
	DIA_OUT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
