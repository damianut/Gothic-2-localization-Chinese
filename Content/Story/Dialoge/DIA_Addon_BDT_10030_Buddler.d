// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10030_Buddler_EXIT(C_INFO)
{
	npc				= BDT_10030_Addon_Buddler;
	nr				= 999;
	condition		= DIA_Addon_10030_Buddler_EXIT_Condition;
	information		= DIA_Addon_10030_Buddler_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10030_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10030_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10030_Buddler_Hi(C_INFO)
{
	npc				= BDT_10030_Addon_Buddler;
	nr				= 2;
	condition		= DIA_Addon_10030_Buddler_Hi_Condition;
	information		= DIA_Addon_10030_Buddler_Hi_Info;
	permanent		= TRUE;
	description		= "你 一 切 都 好 吗 ？";
};

func int DIA_Addon_10030_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10030_Buddler_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10030_Buddler_Hi_15_00"); //你 一 切 都 好 吗 ？

	if (Sklaven_Flucht == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10030_Buddler_Hi_08_01"); //奴 隶 们 正 把 大 金 块 从 我 们 的 路 上 挪 开 。
		AI_Output(self, other, "DIA_Addon_BDT_10030_Buddler_Hi_08_02"); //（ 露 齿 而 笑 ） 然 后 我 们 就 可 以 收 获 黄 金 果 实 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10030_Buddler_Hi_08_03"); //现 在 我 们 将 能 得 到 可 爱 的 金 子 。
		AI_StopProcessInfos(self);
	};
};
