// ************************************************************
// 	  				   			EXIT
// ************************************************************
instance DIA_GornNW_KAP3_EXIT(C_INFO)
{
	npc				= PC_Fighter_NW_vor_DJG;
	nr				= 999;
	condition		= DIA_GornNW_KAP3_EXIT_Condition;
	information		= DIA_GornNW_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_GornNW_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  	  						Hallo
// ************************************************************
instance DIA_GornNW_Hallo(C_INFO)
{
	npc				= PC_Fighter_NW_vor_DJG;
	nr				= 1;
	condition		= DIA_GornNW_Hallo_Condition;
	information		= DIA_GornNW_Hallo_Info;
	description		= "你 一 切 都 好 吗 ？";
};

func int DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_GornNW_Hallo_Info()
{
	AI_Output(other, self, "DIA_GornNW_Add_15_00"); //你 一 切 都 好 吗 ？
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_GornNW_Add_12_01"); //你 救 了 我 的 命 ， 伙 计 。
		AI_Output(self, other, "DIA_GornNW_Add_12_02"); //我 永 远 不 会 忘 记 这 件 事 。
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self, other, "DIA_GornNW_Add_12_03"); //米 尔 腾 把 我 弄 出 来 了 。
		AI_Output(self, other, "DIA_GornNW_Add_12_04"); //我 永 远 不 会 忘 记 这 件 事 。
	};
};

// ************************************************************
// 	  	  						WhatNext
// ************************************************************
instance DIA_GornNW_WhatNext(C_INFO)
{
	npc				= PC_Fighter_NW_vor_DJG;
	nr				= 1;
	condition		= DIA_GornNW_WhatNext_Condition;
	information		= DIA_GornNW_WhatNext_Info;
	permanent		= TRUE;
	description		= "你 现 在 的 计 划 是 什 么 ？";
};

func int DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};

func void DIA_GornNW_WhatNext_Info()
{
	AI_Output(other, self, "DIA_GornNW_Add_15_05"); //现 在 你 想 干 什 么 ？
	AI_Output(self, other, "DIA_GornNW_Add_12_06"); //我 想 我 会 先 去 弄 点 食 物 填 填 肚 子 。
	AI_Output(other, self, "DIA_GornNW_Add_15_07"); //然后？
	AI_Output(self, other, "DIA_GornNW_Add_12_08"); //谁 知 道 呢 … … 也 许 我 会 回 到 矿 坑 流 放 地 去 。
	AI_Output(self, other, "DIA_GornNW_Add_12_09"); //必 须 有 人 监 视 兽 人 - 否 则 它 们 会 在 毫 无 警 告 的 情 况 下 全 部 出 现 在 大 门 口 。
};
