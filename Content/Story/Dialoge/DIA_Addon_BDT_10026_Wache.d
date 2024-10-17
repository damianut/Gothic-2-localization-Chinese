// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10026_Wache_EXIT(C_INFO)
{
	npc				= BDT_10026_Addon_Wache;
	nr				= 999;
	condition		= DIA_Addon_10026_Wache_EXIT_Condition;
	information		= DIA_Addon_10026_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10026_Wache_Hi(C_INFO)
{
	npc				= BDT_10026_Addon_Wache;
	nr				= 99;
	condition		= DIA_Addon_10026_Wache_Hi_Condition;
	information		= DIA_Addon_10026_Wache_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_10026_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10026_Wache_Hi_15_00"); //怎 么 样 了 ？

	if (Sklaven_Flucht == FALSE)
	{
		CreateInvItems(self, ItFo_Bacon, 1);
		AI_Output(self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_01"); //我 们 仍 然 只 有 这 么 少 的 奴 隶 ， 真 是 太 糟 糕 了 。 我 们 必 须 要 一 些 新 人 。
		AI_Output(self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_02"); //这 些 家 伙 被 彻 底 累 坏 了 。 可 能 因 为 他 们 只 有 那 么 一 点 东 西 吃 吧 。 （ 大 笑 ）
		B_UseItem(self, ItFo_Bacon);

		AI_Output(self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_03"); //但 是 我 宁 可 把 这 些 矿 工 送 回 去 工 作 ， 也 不 想 给 这 些 混 蛋 一 片 肉 吃 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_04"); //奴 隶 们 都 走 了 - 太 糟 了 。 嗯 ， 我 们 只 能 再 去 揍 那 些 矿 工 了 。
	};

	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Gruft
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10026_Wache_Gruft(C_INFO)
{
	npc				= BDT_10026_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10026_Wache_Gruft_Condition;
	information		= DIA_Addon_10026_Wache_Gruft_Info;
	permanent		= TRUE;
	description		= "你 知 道 坟 墓 的 任 何 事 情 吗 ？";
};

func int DIA_Addon_10026_Wache_Gruft_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Gruft_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10026_Wache_Gruft_15_00"); //你 知 道 坟 墓 的 任 何 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_01"); //是 的 。 坟 墓 就 在 这 条 路 的 后 面 。
	AI_Output(self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_02"); //（ 冷 漠 的 ） 只 要 跟 着 尸 体 走 ， 你 就 能 找 到 它 。
};
