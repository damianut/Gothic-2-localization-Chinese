//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_1052_Wegelagerer_EXIT(C_INFO)
{
	npc				= BDT_1052_Wegelagerer;
	nr				= 999;
	condition		= DIA_1052_Wegelagerer_EXIT_Condition;
	information		= DIA_1052_Wegelagerer_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_1052_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1052_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hallo
//*********************************************************************
instance DIA_1052_Wegelagerer_Hello(C_INFO)
{
	npc				= BDT_1052_Wegelagerer;
	nr				= 1;
	condition		= DIA_1052_Wegelagerer_Hello_Condition;
	information		= DIA_1052_Wegelagerer_Hello_Info;
	description		= "你 是 谁 ？";
};

func int DIA_1052_Wegelagerer_Hello_Condition()
{
	var C_Npc Pal;
	Pal = Hlp_GetNpc(BDT_1051_Wegelagerer);

	if (C_NpcIsDown(Pal) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_1052_Wegelagerer_Hello_Info()
{
	AI_Output(other, self, "DIA_1052_Wegelagerer_Hello_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_1052_Wegelagerer_Hello_06_01"); //这 是 什 么 ？ 一 次 审 问 ？
	AI_Output(self, other, "DIA_1052_Wegelagerer_Hello_06_02"); //我 没 什 么 告 诉 你 的 ， 但 是 你 也 许 想 要 和 我 的 搭 档 聊 聊 。
	AI_Output(self, other, "DIA_1052_Wegelagerer_Hello_06_03"); //但 是 要 小 心 ， 他 不 和 陌 生 人 聊 天 。
};

///////////////////////////////////////////////////////////////////////
//	Info Angriff
///////////////////////////////////////////////////////////////////////
instance DIA_Wegelagerer_ANGRIFF2(C_INFO)
{
	npc				= BDT_1052_Wegelagerer;
	nr				= 2;
	condition		= DIA_Wegelagerer_ANGRIFF2_Condition;
	information		= DIA_Wegelagerer_ANGRIFF2_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Wegelagerer_ANGRIFF2_Condition()
{
	if ((Npc_RefuseTalk(self) == FALSE)
	&& (C_NpcIsDown(BDT_1051_Wegelagerer)))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_ANGRIFF2_Info()
{
	AI_Output(self, other, "DIA_Wegelagerer_ANGRIFF2_06_00"); //好 吧 ， 朋 友 。 你 现 在 要 倒 霉 了 。
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 40);

	self.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1051_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE;
};
