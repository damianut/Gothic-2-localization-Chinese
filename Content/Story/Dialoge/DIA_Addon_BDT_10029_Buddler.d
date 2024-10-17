// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10029_Buddler_EXIT(C_INFO)
{
	npc				= BDT_10029_Addon_Buddler;
	nr				= 999;
	condition		= DIA_Addon_10029_Buddler_EXIT_Condition;
	information		= DIA_Addon_10029_Buddler_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10029_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10029_Buddler_Hi(C_INFO)
{
	npc				= BDT_10029_Addon_Buddler;
	nr				= 2;
	condition		= DIA_Addon_10029_Buddler_Hi_Condition;
	information		= DIA_Addon_10029_Buddler_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_10029_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10029_Buddler_Hi_15_00"); //怎 么 样 了 ？

	if (Sklaven_Flucht == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10029_Buddler_Hi_06_01"); //只 要 奴 隶 还 在 工 作 ， 我 就 不 用 动 一 根 手 指 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10029_Buddler_Hi_06_02"); //我 必 须 要 挖 一 点 那 样 才 能 恢 复 节 奏 。
		AI_StopProcessInfos(self);
	};
};

// ---------------------------------------------------------------------
//	Info Hacken
// ---------------------------------------------------------------------
instance DIA_Addon_10029_Buddler_Hacken(C_INFO)
{
	npc				= BDT_10029_Addon_Buddler;
	nr				= 3;
	condition		= DIA_Addon_10029_Buddler_Hacken_Condition;
	information		= DIA_Addon_10029_Buddler_Hacken_Info;
	description		= DIALOG_ADDON_GOLD_DESCRIPTION;
};

func int DIA_Addon_10029_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10029_Buddler_Hacken_Info()
{
	B_Say(other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_10029_Buddler_Hacken_06_00"); //腿 ， 全 在 腿 上 。
	AI_Output(self, other, "DIA_Addon_10029_Buddler_Hacken_06_01"); //力 量 和 动 力 来 自 于 腿 。

	B_Upgrade_Hero_HackChance(5);
};
