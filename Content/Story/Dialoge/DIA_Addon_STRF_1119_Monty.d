// ---------------------------------------------------------------------
// Arbeiter von Garvell
// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Monty_EXIT(C_INFO)
{
	npc				= STRF_1119_Addon_Monty;
	nr				= 999;
	condition		= DIA_Addon_Monty_EXIT_Condition;
	information		= DIA_Addon_Monty_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
var int Monty_einmal;
// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Monty_Hi(C_INFO)
{
	npc				= STRF_1119_Addon_Monty;
	nr				= 2;
	condition		= DIA_Addon_Monty_Hi_Condition;
	information		= DIA_Addon_Monty_Hi_Info;
	description		= "嘿 ， 情 况 怎 么 样 了 ？";
};

func int DIA_Addon_Monty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Monty_Hi_15_00"); //嘿 ， 情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Monty_Hi_08_01"); //我 还 活 着 - 那 时 我 唯 一 关 心 的 事 。

	if (Monty_einmal == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Monty_Hi_08_02"); //如 果 你 有 什 么 事 需 要 讨 论 ， 去 找 帕 特 里 克 。
		Monty_einmal = TRUE;
	};
};

// ---------------------------------------------------------------------
//	Info Hacken
// ---------------------------------------------------------------------
instance DIA_Addon_Monty_Hacken(C_INFO)
{
	npc				= STRF_1119_Addon_Monty;
	nr				= 2;
	condition		= DIA_Addon_Monty_Hacken_Condition;
	information		= DIA_Addon_Monty_Hacken_Info;
	description		= DIALOG_ADDON_GOLD_DESCRIPTION;
};

func int DIA_Addon_Monty_Hacken_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hacken_Info()
{
	B_Say(other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Monty_Hacken_08_00"); //嗯 ， 你 挥 击 的 角 度 决 定 了 采 矿 的 效 率 。
	AI_Output(self, other, "DIA_Addon_Monty_Hacken_08_01"); //不 要 太 无 力 ， 也 不 要 过 度 ， 那 样 你 才 能 得 到 金 块 ， 并 能 一 直 握 住 你 的 十 字 镐 。

	B_Upgrade_Hero_HackChance(5);
};
