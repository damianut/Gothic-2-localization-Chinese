// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10031_Wache_EXIT(C_INFO)
{
	npc				= BDT_10031_Addon_Wache;
	nr				= 999;
	condition		= DIA_Addon_10031_Wache_EXIT_Condition;
	information		= DIA_Addon_10031_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10031_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Scatty
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10031_Wache_Scatty(C_INFO)
{
	npc				= BDT_10031_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10031_Wache_Scatty_Condition;
	information		= DIA_Addon_10031_Wache_Scatty_Info;
	important		= TRUE;
};

func int DIA_Addon_10031_Wache_Scatty_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Scatty_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_00"); //嘿 ， 你 想 要 去 挖 金 子 ？ 那 不 要 忘 记 去 斯 凯 蒂 那 里 采 购 。
	AI_Output(other, self, "DIA_Addon_BDT_10031_Wache_Scatty_15_01"); //那 么 我 需 要 什 么 ？
	AI_Output(self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_02"); //嗯 ， 至 少 要 有 一 柄 十 字 镐 。 再 来 一 点 食 物 也 不 会 错 。
	AI_Output(self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_03"); //或 者 来 点 治 疗 药 剂 怎 么 样 ？ 下 面 有 矿 井 爬 行 者 。
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
var int Wache_Joker;
// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10031_Wache_Hi(C_INFO)
{
	npc				= BDT_10031_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10031_Wache_Hi_Condition;
	information		= DIA_Addon_10031_Wache_Hi_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Addon_10031_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10031_Wache_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10031_Wache_Hi_15_00"); //一 切 都 好 吗 ？

	if ((Sklaven_Flucht == TRUE)
	&& (Wache_Joker == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_01"); //小 子 ， 喔 小 子 。 奴 隶 们 一 定 都 在 忙 。
		AI_Output(self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_02"); //当 他 们 听 说 他 们 获 得 自 由 的 时 候 ， 他 们 跑 得 象 兔 子 一 样 ！
		Wache_Joker = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_03"); //是 的 。 所 以 ， 不 要 惹 麻 烦 ， 就 万 事 大 吉 。
};
