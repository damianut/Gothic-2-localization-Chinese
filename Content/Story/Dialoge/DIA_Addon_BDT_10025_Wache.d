// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10025_Wache_EXIT(C_INFO)
{
	npc				= BDT_10025_Addon_Wache;
	nr				= 999;
	condition		= DIA_Addon_10025_Wache_EXIT_Condition;
	information		= DIA_Addon_10025_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10025_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10025_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10025_Wache_Hi(C_INFO)
{
	npc				= BDT_10025_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10025_Wache_Hi_Condition;
	information		= DIA_Addon_10025_Wache_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_10025_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10025_Wache_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10025_Wache_Hi_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_01"); //我 正 在 为 矿 工 和 卫 兵 烹 调 美 味 的 炖 肉 。

	if (Sklaven_Flucht == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_02"); //不 过 那 些 奴 隶 们 - 他 们 得 不 到 任 何 东 西 。 最 多 是 一 些 不 新 鲜 的 水 和 硬 面 包 。
		AI_Output(self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_03"); //那 样 也 不 会 对 那 些 城 里 的 小 子 有 什 么 坏 处 。
	};
};
