// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10028_Buddler_EXIT(C_INFO)
{
	npc				= BDT_10028_Addon_Buddler;
	nr				= 999;
	condition		= DIA_Addon_10028_Buddler_EXIT_Condition;
	information		= DIA_Addon_10028_Buddler_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10028_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10028_Buddler_Hi(C_INFO)
{
	npc				= BDT_10028_Addon_Buddler;
	nr				= 2;
	condition		= DIA_Addon_10028_Buddler_Hi_Condition;
	information		= DIA_Addon_10028_Buddler_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_10028_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10028_Buddler_Hi_15_00"); //怎 么 样 了 ？

	if (Sklaven_Flucht == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_01"); //我 不 想 自 己 陷 入 采 矿 的 麻 烦 之 中 。 我 们 有 足 够 的 奴 隶 去 帮 我 们 做 那 些 。
		AI_Output(self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_02"); //（ 大 笑 ） 我 们 的 金 子 从 来 也 不 会 来 得 这 么 简 单 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_03"); //啊 。 是 哪 个 白 痴 把 奴 隶 放 了 ？
		AI_StopProcessInfos(self);
	};
};

// ---------------------------------------------------------------------
//	Info Hacken
// ---------------------------------------------------------------------
instance DIA_Addon_10028_Buddler_Hacken(C_INFO)
{
	npc				= BDT_10028_Addon_Buddler;
	nr				= 3;
	condition		= DIA_Addon_10028_Buddler_Hacken_Condition;
	information		= DIA_Addon_10028_Buddler_Hacken_Info;
	description		= DIALOG_ADDON_GOLD_DESCRIPTION;
};

func int DIA_Addon_10028_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10028_Buddler_Hacken_Info()
{
	B_Say(other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_10028_Buddler_Hacken_12_00"); //一 直 从 底 下 向 上 挖 掘 。
	AI_Output(self, other, "DIA_Addon_10028_Buddler_Hacken_12_01"); //那 也 许 很 难 ， 但 是 那 样 做 你 可 以 从 岩 石 中 得 到 更 多 的 金 子 。

	B_Upgrade_Hero_HackChance(5);
};
