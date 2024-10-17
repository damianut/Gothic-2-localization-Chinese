// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10027_Buddler_EXIT(C_INFO)
{
	npc				= BDT_10027_Addon_Buddler;
	nr				= 999;
	condition		= DIA_Addon_10027_Buddler_EXIT_Condition;
	information		= DIA_Addon_10027_Buddler_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10027_Buddler_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10027_Buddler_Hi(C_INFO)
{
	npc				= BDT_10027_Addon_Buddler;
	nr				= 2;
	condition		= DIA_Addon_10027_Buddler_Hi_Condition;
	information		= DIA_Addon_10027_Buddler_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_10027_Buddler_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10027_Buddler_Hi_15_00"); //怎 么 样 了 ？

	if (Sklaven_Flucht == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_01"); //我 已 经 为 矿 石 大 亨 努 力 工 作 了 很 久 。 现 在 很 高 兴 有 其 它 人 继 续 挖 掘 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_02"); //该 死 。 现 在 我 们 必 须 自 己 回 去 继 续 挖 掘 了 ， 嗯 ？
	};
};

// ---------------------------------------------------------------------
//	Info Hacken
// ---------------------------------------------------------------------
instance DIA_Addon_10027_Buddler_Hacken(C_INFO)
{
	npc				= BDT_10027_Addon_Buddler;
	nr				= 3;
	condition		= DIA_Addon_10027_Buddler_Hacken_Condition;
	information		= DIA_Addon_10027_Buddler_Hacken_Info;
	description		= DIALOG_ADDON_GOLD_DESCRIPTION;
};

func int DIA_Addon_10027_Buddler_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_10027_Buddler_Hacken_Info()
{
	B_Say(other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_10027_Buddler_Hacken_11_00"); //脑 力 工 作 ， 小 伙 子 。 挖 掘 金 矿 是 绝 对 的 智 力 过 程 。 别 对 着 石 头 用 力 - 它 比 你 硬 。
	AI_Output(self, other, "DIA_Addon_10027_Buddler_Hacken_11_01"); //释 放 你 思 想 的 每 一 部 分 - 试 着 让 自 己 变 成 某 一 块 金 子 。 然 后 就 象 冥 想 一 样 ， 一 名 祈 祷 者 。

	B_Upgrade_Hero_HackChance(10);
};
