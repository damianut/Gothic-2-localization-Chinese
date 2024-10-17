// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information		= DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Hi
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Hi(C_INFO)
{
	nr				= 2;
	condition		= DIA_Addon_TAL_BDT_13_Hi_Condition;
	information		= DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_TAL_BDT_13_Hi_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_TAL_BDT_13_Hi_13_01"); //你 要 么 被 一 头 野 兽 吃 掉 ， 要 么 被 另 一 头 野 兽 吃 掉 。
	AI_Output(self, other, "DIA_Addon_TAL_BDT_13_Hi_13_02"); //这 个 沼 泽 将 是 我 们 的 坟 墓 … …
};

// *************************************************************************
// 							Tal
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Tal(C_INFO)
{
	nr				= 3;
	condition		= DIA_Addon_TAL_BDT_13_Tal_Condition;
	information		= DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 山 谷 你 知 道 些 什 么 ？";
};

func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other, self, "DIA_Addon_TAL_BDT_13_Tal_15_00"); //关 于 这 个 山 谷 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_TAL_BDT_13_Tal_13_01"); //这 里 有 一 大 堆 旧 东 西 。 瑞 雯 命 令 我 们 把 所 有 东 西 都 收 集 起 来 。
	AI_Output(self, other, "DIA_Addon_TAL_BDT_13_Tal_13_02"); //不 知 道 他 想 要 从 中 找 到 什 么 ， 但 是 没 有 一 个 思 想 正 常 的 人 会 冒 生 命 危 险 去 弄 一 些 古 老 的 石 头 … …
};

// *************************************************************************
// 							News
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_News(C_INFO)
{
	nr				= 4;
	condition		= DIA_Addon_TAL_BDT_13_News_Condition;
	information		= DIA_Addon_TAL_BDT_13_News_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 新 的 吗 ？";
};

func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other, self, "DIA_Addon_TAL_BDT_13_News_15_00"); //还 有 什 么 新 的 吗 ？
	AI_Output(self, other, "DIA_Addon_TAL_BDT_13_News_13_01"); //我 们 真 的 成 功 欺 骗 了 那 些 海 盗 。
	AI_Output(self, other, "DIA_Addon_TAL_BDT_13_News_13_02"); //他 们 给 我 们 送 来 囚 犯 ， 但 是 拿 不 到 一 分 钱 。 他 们 的 愤 怒 不 足 为 奇 。

	if (BDT_13_einmal == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_TAL_BDT_13_News_13_03"); //不 过 他 们 能 做 什 么 ？ 攻 击 营 地 ？ （ 大 笑 ） 哈 哈 哈 。
		BDT_13_einmal = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_HI.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_TAL.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_NEWS.npc = Hlp_GetInstanceID(slf);
};
